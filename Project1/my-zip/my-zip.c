#include <stdlib.h>
#include <stdio.h>

void readFile(char *path);

// Main program
int main(int argc, char *argv[]) {
	if (argc == 1) {
		printf("No filename provided\n");
		return 0;
	} else if (argc >= 2) {
		for (int i = 1; i < argc; ++i) {
			readFile(argv[i]);
		}
		return 0;
	}
}

void readFile(char *path) {
	FILE *file;
	char p = '0', line[10];
	int count = 0, i = 0;
	if ((file = fopen(path, "r")) == NULL) {
		perror("my-zip: cannot open file\n");
		exit(1);
	}
	while(fgets(line, 10, file) != NULL) {
		if(line[0] != '\n'){
			for(i=0;i<9;i++){
				//skip newline
				if(line[i] == '\n') {
					continue;
				}
				//break on terminating newline
				if(line[i] == '\0') {
					//write count & character to stdout
					fwrite(&count, sizeof(int), 1, stdout);
					fwrite(&p, sizeof(char), 1, stdout);
					break;
				}
				//initialize p
				if(p == '0') {
					p = line[0];
				}
				//different character: change value of p and set count to 1
				if(line[i] != p) {
					//write count & character to stdout
					fwrite(&count, sizeof(int), 1, stdout);
					fwrite(&p, sizeof(char), 1, stdout);
					p = line[i];
					count = 1;
				} else {
					count++;
				}
			}
		}
	}
	fclose(file);

}
