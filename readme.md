# Makefiles are hard

I spent some time during my university studies using makefiles to build embedded projects for an STM32 development board, and I remember looking at the files and being completely overwhelmed, I just had to know how to to use the file and not how to make one though so it was ok.

Up until today when I had to create a small project for work. There aren't any IDEs available to use (apart from eclipse but I haven't had great experience with it so decided to just learn how to make a make file so I could make my project. Here's what I learned.

## Variables

Declaring and initializing a variable:
```make
SRC_PATH=src
``` 

Using a variable:
```make 
$(SRC_PATH)
```

## Targets

There are the bits that you type when invoking the makefile eg `make debug` has a target of `debug`. Targets are specified by:
```make
debug:
    do stuff
```
There are __TABS__ here, so if you're using vim makesure you `set noexpandtab` before you get cracking.

### Target Dependancies

Targets have dependancies, as in the following example where the `debug` target is dependant on whatever is in the `DEBUG_OBJS` variable:

```make
debug: $(DEBUG_OBJS)
    do stuff
``` 

When making a target you can access the target name using `$@` and you can access the dependancies using `$^`. This means that 

```make
T=poop and wee
debug: $(T)
    $(info $@ is dependant on $^)
``` 

Will output `debug is dependant on poop and wee.

### PHONY

A phony is a name of a target that definitely isn't the name of a file which will be used.

```make
PHONY: .clean
clean:
    rm *.o
```

# Example Project

I have put an example project on here, which has a couple of files and folders in. In my projects I like to have the source in a `src` directory and the build artefacts in a `build` directory so that I can easily manage my git artefacts. The makefile I have made looks for all the source in `src` then makes the objects and executables based on that. There is also a `test` target to demonstrate the use of `$^ $@ $<`. To run use it pick from the following options:

```bash 
make debug
make release
make all
make clean
make test
```
