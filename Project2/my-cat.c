#include <stdlib.h>
#include <stdio.h>

// Reading the file
int read(const char* path) {
	FILE *file;
	char *line = NULL;
	size_t len = 0;
	ssize_t nread;
	file = fopen(path, "r"); /* Avataan file. */
	if (file == NULL) {
		printf("my-cat: cannot open file\n");
		exit(1);
	}
	while ((nread = getline(&line, &len, file)) != -1) {
		fwrite(line, nread, 1, stdout);
	}
	fclose(file);
	return 0;
}

// Main program
int main(int argc, char *argv[]) {
	if (argc == 1) {
		printf("No filename provided\n");
		return 0;
	} else if (argc >= 2) {
		for (int i = 1; i < argc; ++i) {
			read(argv[i]);
		}
		return 0;
	}
}