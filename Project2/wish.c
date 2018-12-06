#include <sys/wait.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int wish_cd(char **args);
int wish_exit(char **args);

char *builtin_str[] = {
  "cd",
  "exit"
};

int (*builtin_func[]) (char **) = {
  &wish_cd,
  &wish_exit
};

int wish_num_builtins() {
  return sizeof(builtin_str) / sizeof(char *);
}

int wish_cd(char **args)
{
  if (args[1] == NULL) {
    fprintf(stderr, "wish: expected argument to \"cd\"\n");
  } else {
    if (chdir(args[1]) != 0) {
      perror("wish");
    }
  }
  return 1;
}

int wish_exit(char **args)
{
  // return 0;
  exit(0);
}

int wish_launch(char **args)
{
  pid_t pid;
  int status;

  pid = fork();
  if (pid == 0) {
    // Child process
    if (execvp(args[0], args) == -1) {
      perror("wish");
    }
    exit(EXIT_FAILURE);
  } else if (pid < 0) {
    // Error forking
    perror("wish");
  } else {
    // Parent process
    do {
      waitpid(pid, &status, WUNTRACED);
    } while (!WIFEXITED(status) && !WIFSIGNALED(status));
  }

  return 1;
}

int wish_execute(char **args)
{
  int i;

  if (args[0] == NULL) {
    // An empty command was entered.
    return 1;
  }

  for (i = 0; i < wish_num_builtins(); i++) {
    if (strcmp(args[0], builtin_str[i]) == 0) {
      return (*builtin_func[i])(args);
    }
  }

  return wish_launch(args);
}

#define wish_RL_BUFSIZE 1024

char *wish_read_line(void)
{
  char *line = NULL;
  size_t bufsize = 0; // have getline allocate a buffer
  getline(&line, &bufsize, stdin);
  return line;
}

#define wish_TOK_BUFSIZE 64
#define wish_TOK_DELIM " \t\r\n\a"

char **wish_split_line(char *line)
{
  int bufsize = wish_TOK_BUFSIZE, position = 0;
  char **tokens = malloc(bufsize * sizeof(char*));
  char *token, **tokens_backup;

  if (!tokens) {
    fprintf(stderr, "wish: allocation error\n");
    exit(EXIT_FAILURE);
  }

  token = strtok(line, wish_TOK_DELIM);
  while (token != NULL) {
    tokens[position] = token;
    position++;

    if (position >= bufsize) {
      bufsize += wish_TOK_BUFSIZE;
      tokens_backup = tokens;
      tokens = realloc(tokens, bufsize * sizeof(char*));
      if (!tokens) {
		free(tokens_backup);
        fprintf(stderr, "wish: allocation error\n");
        exit(EXIT_FAILURE);
      }
    }

    token = strtok(NULL, wish_TOK_DELIM);
  }
  tokens[position] = NULL;
  return tokens;
}

int main(int argc, char **argv)
{
  int status;

  if (argc ==  1) {
    status = 1;
    while (status == 1) {

      char *line;
      char **args;

      printf("wish> ");
      line = wish_read_line();
			
			// MULTI COMMAND IMPLEMENTATION
			char *com = strtok(line, "&&");
			while(com != NULL) {
				// printf("COMMAND: %s\n", com);
        char *temp;
        temp = strdup(com);

        // Get next command ready if exists
        com = strtok(NULL, "&&");

				args = wish_split_line(temp);
	      wish_execute(args);

	      free(args);
        free(temp);
			}
			free(line);
    }
  } else if (argc == 2) {
    status = 0;

    FILE *file;
    file = fopen(argv[1], "r"); /* Avataan file. */
    if (file == NULL) {
      printf("wish: cannot open file\n");
      exit(0);
    }
    while (status != -1) {
      char *line = NULL;
      char **args;
      size_t len = 0;

      status = getline(&line, &len, file);
      args = wish_split_line(line);
      wish_execute(args);

      free(line);
      free(args);
    }
    status = 0;
    fclose(file);
    exit(0);

  } else {
    printf("Too many arguments\n");
  }

  return EXIT_SUCCESS;
}

