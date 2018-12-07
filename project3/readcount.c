#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[]){
	if(argc < 2){
    		printf(1, "Too few arguments.\n");
    		exit();
	}
	int input = atoi(argv[1]);
	const char *calls[] = {
		"fork",
		"exit",
		"wait",
		"pipe",
		"read",
		"kill",
		"exec",
		"fstat",
		"chdir",
		"dup",
		"getpid",
		"sbrk",
		"sleep",
		"uptime",
		"open",
		"write",
		"mknod",
		"unlink",
		"link",
		"mkdir",
		"close",
		"readcount",
		"countreset"
	};
	printf(1, "%s system call has been executed %d times.\n", calls[input-1], getreadcount(input));
	exit();
}
