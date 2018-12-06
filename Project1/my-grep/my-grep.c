#include <stdlib.h>
#include <stdio.h>
#include <string.h>


// Reading the file
int readFromFile(const char* filter, const char* path) {
	FILE *file;
	char *line = NULL;
	size_t len = 0;
	ssize_t nread;
	file = fopen(path, "r"); /* Avataan file. */
	if (file == NULL) {
		printf("my-grep: cannot open file\n");
		exit(0);
	}
	while ((nread = getline(&line, &len, file)) != -1) {
		char *result;
		result = strstr(line, filter);
		if (result != NULL) {
			fwrite(line, nread, 1, stdout);
		}
	}
	fclose(file);
	return 0;
}

// Reading from the stream
int readFromStream(const char* filter) {
	char *line = NULL;
	size_t len = 0;
	ssize_t nread;
	while (1) {
		nread = getline(&line, &len, stdin);
		char *result;
		result = strstr(line, filter);
		if (result != NULL) {
			fwrite(line, nread, 1, stdout);
		}
	}
	return 0;
}
// Main program
int main(int argc, char *argv[]) {
	if (argc == 1) {
		printf("my-grep: searchterm [file ...]\n");
		exit(1);
	} else if (argc == 2) {
		readFromStream(argv[1]);
	} else if (argc >= 3) {
		for (int i = 2; i < argc; ++i) {
			readFromFile(argv[1], argv[i]);
		}
		return 0;
	}
}