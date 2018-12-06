#include <stdlib.h>
#include <stdio.h>

// Reading the file
int read(const char* path) {
	FILE *file;
	char *line = NULL;
	size_t len = 0;
	ssize_t nread;
	file = fopen(path, "r");
	// If not able to open, print error message and exit
	if (file == NULL) {
		printf("my-cat: cannot open file\n");
		exit(1);
	}
	// Otherwise print to the console line by line
	while ((nread = getline(&line, &len, file)) != -1) {
		fwrite(line, nread, 1, stdout);
	}
	fclose(file);
	return 0;
}

// Main program
int main(int argc, char *argv[]) {
	// Inform if no filename parameters
	if (argc == 1) {
		printf("No filename provided\n");
		return 0;
	} 
	// Reading every filename one by one
	else if (argc >= 2) {
		for (int i = 1; i < argc; ++i) {
			read(argv[i]);
		}
		return 0;
	}
}