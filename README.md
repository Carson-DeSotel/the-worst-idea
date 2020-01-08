# The Worst Idea

author: Carson DeSotel

language: C, Java, Python, Bash

date created: January 2020

## The Premise:

There really is no such thing as a purely random number generator. There's always an algorithm involved, or a clock, or some other mechanism to get a pseudo-random seed to base your number on. In order to create a closer approximation to a random number, how about we create a system in which multiple sets of random numbers are generated in various ways in several different languages, then we pick a number from those sets *at random*.

## The Purpose: 

Outside of being a gross, inefficient way to create a random number, this also serves as a way to test interactions between different languages with the use of system calls and output. So, how well can these 3 languages interface with each other?

### C:
- The way I implemented the C algorithm was just using the `clock()` and `time()` commands, so it doesn't actually take a seed. 
    - This means that the C output will be our seed!
- This one was the easiest to implement for me. It was the shortest and required the least amount of setup. Granted, I am more comfortable with C than I am with Python, so I factored that into the total *"ease of implementation"*. 
 
### Python:
- We're going to use the `random()` library supplied in Python. 
    - [documentation here](https://docs.python.org/3/library/random.html)
- I'm not really sure what algorithm is being used to generate this. Based on the documentation, it may also be using some sort of *Park-Miller algorithm* which I decided to create for the Java section.

### Java:
- We're going to use the *Park-Miller algorithm* to create a random number based off a seed provided.
    - [documentation here](https://en.wikipedia.org/wiki/Lehmer_random_number_generator)
- This is a more manual approach that forces me to not just use libraries.
- Mostly works as intended. It generates the number like in this range: [min, max), 
    - so the max is exclusive with an inclusive min.
    - I'm not sure whether I intend this or not. I'd have to fix the algorithm.

### Bash:
- This is the overall handler for the execution. 
- This provides the system to run compilation, cleanup, and execution of the programs.
- It also handles command-line argument validation so that I don't have to write it into the other programs.

### Makefile:
- This is a simple Makefile that compiles the Java and C code as well as cleans any leftover files.

## Process:

I started by getting each of the `number-generator.*` files working, each with their own brand of random number generation. When I got to the bash implementation, it was pretty straight forward, I just had to implement the argument handling and the actual pipeline that would process the numbers.

I settled on this pipeline:

> SHELL >> Makefile >> C >> Python >> Java >> SHELL >> Makefile

Initially, I had wanted Python to be the first call, since I figured it would take the longest to get me a number. I decided against that once I had decided on my method for getting a number in C. The design I chose didn't incorporate a random number anywhere, so I decided to make that number the seed for program executions.

## Learned:

So, I've been wondering for a long time how easy it would be to make different languages interact with eachother without having to go through personal input and using text files as buffers. Turns out that the I/O handling is made pretty trivial with the Shell script. 

I don't know how effective this would be for a large scale build, but I know that if something I want to do could easily be done in Python (maybe something with `requests`), but I wanted to handle all the data in C, I may be able to jerry-rig a system that allows each language to work without having to get bogged down in new libraries.

This was a pretty Frankenstein-esque build, but it was fun to see it all come together. Definitely more of a concept piece that I can't really see myself fleshing out any more.