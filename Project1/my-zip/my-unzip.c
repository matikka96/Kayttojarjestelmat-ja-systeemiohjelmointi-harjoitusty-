#include <stdlib.h>
#include <stdio.h>

void readFile(char *path);

// Main program
int main(int argc, char *argv[]) {
	if (argc == 1) {
		printf("No filename provided\n");
		return 0;
	} else if (argc == 2) {
		readFile(argv[1]);
		return 0;
	}
}

void readFile(char *path) {
	FILE *file;
	char p, line[10];
	int count;
	if ((file = fopen(path, "rb")) == NULL) {
		perror("my-unzip: cannot open file\n");
		exit(1);
	}
	//read first 4 bytes (integer)
	while(fread(&count, sizeof(int), 1, file)) {
		//read next byte (character)
		fread(&p, sizeof(char), 1, file);
		for(int i=0; i<count; i++) {
			//print character count-times
			printf("%c", p);
		}
	}
	printf("\n");
	fclose(file);

}
