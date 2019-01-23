# Kayttojarjestelmat-ja-systeemiohjelmointi-harjoitustyo
Authors: Matvei Tikka (0453100) & Saku Suikkanen (0504774)

Tested on: OS X 10.14, Ubuntu 16.04 LTS

This repository contains three projects (own folder for each of them), with documentation file named README.md

Documentation contains many examples, which anyone can easily follow after cloning this repository to local device.

## Project 1 – Unix Utilities
Objective of this project was to create own versions of specific UNIX command line utilities. The following ones were created in C:
1. my-cat
2. my-grep
3. my-zip
4. my-unzip

### my-cat
This particular program reads the file and outputs its content line by line in terminal. It works similar to commonly used *cat* command. 

Before use program needs to be compiled. This can be done for example with the following command:

> gcc my-cat.c -o my-cat

After executing file named "my-cat" will be created in same directory. With this program we can now read file/files given as parameters. Program is able to read multiple files in given order.

In this example program will print out all the lines of files named "names.txt" and "names2.txt" (all the files can be found in project directory) :

> ./my-cat names.txt names2.txt

Visual representation of the steps above is seen in the followind screenshot.

![Screenshot](https://github.com/matikka96/Kayttojarjestelmat-ja-systeemiohjelmointi-harjoitusty-/blob/master/screenshots/my-cat.png?raw=true)


### my-grep
Present utility tool is similar to previous one, but is able to filter output by given parameter. In other words it scans the file line by line and prints all the lines with user specified search term.

Before use program needs to be compiled. This can be done for example with the following command:

> gcc my-grep.c -o my-grep

After executing file named "my-grep" will be created in same directory. 

Example of running the program:

> ./my-grep ka names.txt

From the example we can see programs logic. First parameter is the search term, "ka" in this case. Second parameter is filename inside of which program will scan for search term. Amount of filenames as parameters is unlimited.

Visual representation of the steps above is seen in the followind screenshot.

![Screenshot](https://github.com/matikka96/Kayttojarjestelmat-ja-systeemiohjelmointi-harjoitusty-/blob/master/screenshots/my-grep.png?raw=true)

### my-zip
Utility my-zip creates a compressed version of input file using run-length encoding. Basically the program takes one or more input text files and reading from the files it encodes the number of same characters in a row to an 4-byte integer followed by the actual character. For example the row: aaaaaaaaaaassssssssssdddddd would encode to: 11a10s6d. So when the compression has been successful, every compressed segment (11a, 10s, 6d) takes excactly 5-bytes of memory since the 4-byte integer is followed by a 1-byte ASCII-character. 

The program works by first reading the input file(s) first character and puts it into a variable p. After that it starts iterating variable count while the next characters are the same as the first one. When the program comes to a different character it sends the data from variables p and count to standard output. Then the variable p is set to the new character and count is set to 1 and this same loop is iterated until the program has met the end of file(s). We can redirect the output to the desired compressed file using shell redirection command. Compressing multiple files in one run will create only one compressed file where the compressed data is to be found.

The program can be compiled with:

> gcc my-zip.c -o my-zip

Example run with 2 input files:

> ./my-zip file.txt file2.txt > fileout.z

This will create file fileout.z which contains the compressed data from file.txt and file2.txt as shown in demonstrating picture after the my-unzip-segment.

This compression method doesnt always create better result and infact the method can usefully compress only those segments that have atleast 6 same characters in a row. Since the original text would contain 6 bytes and compressed segment contains always 5 bytes of memory. Thus series of characters lower than 6 would not compress at all or would be counter effective resulting in larger use of memory in the compressed file.

### my-unzip
Utility my-unzip is used to read the decompressed file and print its contents on the screen. It does that by reading data 5-bytes at a time which consist of the 4-byte integer and 1-byte character. Both variables are read separately and after that the integer and character are printed on the screen.

The program can be compiled with:

> gcc my-unzip.c -o my-unzip

Example run:

> ./my-unzip fileout.z

Which then prints the content of fileout.z on the screen as shown in following demonstration picture. It is also demonstrated in the screenshot that the combined size of file and file2 (216 bytes) is larger than fileout.z (185 bytes) which means that the compression has worked. It is also notable that the size of fileout.z is divisible by 5 as the sizes of each compressed item is 5-bytes. 

![Screenshot](https://github.com/matikka96/Kayttojarjestelmat-ja-systeemiohjelmointi-harjoitusty-/blob/master/screenshots/my-zip-demo.png?raw=true)

## Project 2 – Unix Shell
Purpose of this project was to create a simple command line interpreter, or in other words *SHELL*. What is does, is basically it runs a while loop and listens for commands. If command is recognized is it executes and returns back to while loop.

Features of this implementation:
- recognizes parallel commands
- recognizes multiple parameters for each command
- runs build in, own custom made and system specific utility commands
- supports both, interactive and batch modes

### Compiling and running
In order to run, shell needs to be compiled. 

This can be done:

> gcc wish.c -o wish

After executing file named "my-grep" will be created in same directory. 

Now shell can be started with following command:

> ./wish

Visual representation of the steps above is seen in the followind screenshot. Some of the SHELL's functionality is demonstrated also. 

![Screenshot](https://github.com/matikka96/Kayttojarjestelmat-ja-systeemiohjelmointi-harjoitusty-/blob/master/screenshots/wish.png?raw=true)


## Project 3 – Kernel Hacking
In project 3 we had to create new system calls for the xv6-kernel. One of which gets the number of calls the kernel has made to selected system call and another to reset the count of calls. The kernel was booted with QEMU-emulator on a virtual machine.

There was 5 different files where changes had to be made in order to create new system calls for the kernel:

- sysproc.c
- syscall.h
- syscall.c
- usys.S
- user.h

Also we had to create two C-functions for the user level implementation of the calls:

- readcount.c
	for getting the count of specific system call
- resetcounter.c
	for resetting the counter(s)

### sysproc.c
In sysproc.c we had to create functional implementation for the new system calls named: sys_getreadcount, sys_countreset. Function sys_getreadcount takes the input that user has given in the user level function and uses it to access the array callcounts where the counts for different system calls can be found. It then returns the value found in the array.

For the count resetting system call we also implement a function in the sysproc.c file called sys_countreset. It works basically the same as the former but rather than returning the arrays value at input index it determines it as 0. Alternatively if user inputs 0 at user level the system call marks all counters values as 0.

### syscall.h
File syscall.h contains only the indexes of different system calls which are used in syscall.c when kernel addresses different system calls from an array. So we define index 22 for sys_getreadcount and index 23 for sys_countreset.

### syscall.c
In this file is where we can actually iterate the system call counters inside the syscall-function. All we have to do is match the indexes of callcounts array and the indexes of system calls at syscall.h and when function syscall calls for a system call we iterate callcounts-array item at same index of which the actual system call is defined.

### usys.S
This file is used to create system calls body using a SYSCALL-macro which links the user level function with the actual system call through the register %eax. So we add two lines at the end of file:
SYSCALL(getreadcount), SYSCALL(countreset). Functions getreadcount and countreset are the user level functions which are declared at user.h.

### user.h
Here we create the headers for the functions getreadcount and countreset mentioned in the former paragraph. These functions dont have any actual functionality as they are only used to link the user with the system call where the real functionality lies.

### Makefile
To actually be able to call the user level C-functions readcount.c and resetcounter.c we have to add them in the Makefile file under the UPROGS variable.

### compiling and running
Compiling the kernels files is easy as all we have to do is write 'make' in the shell inside the root directory. Now we can run the kernel virtually by having QEMU installed and writing the command 'make qemu'. As the kernel boots we are ready to run the newly implemented system calls in the virtual machine.

System call readcount can be run with:

$ readcount (index of system call)

where the index of system call can be from range 1-23. For example index 5 is read, index 22 readcount and index 23 resetcounter. So to get the count of read system calls we write command:

$ readcount 5

Same goes for resetcounter system call: we can reset particular system calls counter by inputting its index except with input 0 we can reset all counters.

Resetting counter for system call read:

$ resetcounter 5

Both of these can be seen demonstrated in following screenshot. It also demonstrates that after calling system call readcount 4 times, the result for command 'readcount 22' is also 4 so we can tell that the system calls are working properly.

![Screenshot](https://github.com/matikka96/Kayttojarjestelmat-ja-systeemiohjelmointi-harjoitusty-/blob/master/screenshots/project3-qemu-demo.png?raw=true)