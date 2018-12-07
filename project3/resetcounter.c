#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[]){
	int input = atoi(argv[1]);
	if(argc < 2){
    		printf(1, "Too few arguments.\n");
    		exit();
	}
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
	if(countreset(input) == 0) {
		printf(1, "System call %s counter reset\n", calls[input-1]);
		exit();
	} else if(countreset(input) == 1) {
		printf(1, "All system call counters reset\n");
		exit();
	}
}
