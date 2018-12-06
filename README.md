# Kayttojarjestelmat-ja-systeemiohjelmointi-harjoitustyo
Authors: Matvei Tikka &
Tested on: OS X 10.14

This repository contains three projects (own folder for each of them), with documentation file named README.md

Documentation contais many examples, which anyone can easily follow after cloning this repository to own device.

## Project 1 – Unix Utilities
Objective of this project was to create own versions of spesific UNIX command line utilities. The following ones were created in C:
1. my-cat
2. my-grep

### my-cat
This particular program reads the file and outputs its content line by line in terminal. It works similar to commonly used *cat* command. 

Before use program needs to be compiled. This can be done for example with the following command:

> gcc my-cat.c -o my-cat

After executing file named "my-cat" will be created in same directory. With this program we can now read file/files given as parameters. Program is able to read multiple files in given order.

In this example program will print out all the lines of files named "names.txt" and "names2.txt" (all the files can be found in project directory) :

> ./my-cat names.txt names2.txt


### my-grep
Present utility tool is similar to previous one, but is able to filter output by given parameter. In other words it scans the file line by line and prints all the lines with user specified search term.

Before use program needs to be compiled. This can be done for example with the following command:

> gcc my-grep.c -o my-grep

After executing file named "my-grep" will be created in same directory. 

Example of running the program:

> ./my-grep ka names.txt names2.txt

From the example we can see programs logic. First parameter is the search term, "ka" in this case. The rest are filenames inside of which program will scan for search term.


## Project 2 – Unix Shell
Purpose of this project was to create a simple command line interpreter, or in other words *SHELL*. What is does, is basically it runs a while loop and listens for commands. If command is recognized is it executes and returns back to while loop.

Features of this implementation:
- recognizes paraller commands
- recognizes multiple parameters for each command
- runs build in, own custom made and system spesific utility commands

### Tutorial
In order to run, shell needs to be compiled. 

This can be done:

> gcc wish.c -o wish

After executing file named "my-grep" will be created in same directory. 

Now shell can be started with following command:

> ./wish



## Project 3 – Kernel Hacking
