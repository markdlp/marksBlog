---
title: "My Interview Exercises"
date: 2025-04-03
draft: true
description: "As I'm ~struggling~ trying to find a job opportunity I have landed a few interviews and as I'm trying to make up my time for lost jobs I learn!"
tags: ["job", "interview"]
---

### Disclaimer
I don't want to reveal the names and positions of the organizations I'm pursuing but this may roughly emerge as I lay the exercises and my attempts.

### Exercises
Starting of with some basic ones I was asked to write a recursive function that computes the sum of a number with all the smaller ones till zero.
Using the ternary operator we can type a one liner like:
```c
#include <stdio.h>
#include <stdlib.h>

int sum2zero(int n) {return (n < 1) ? 0 : n + sum2zero(n - 1);}

int main(int argc, const char* argv[], const char* envp[]) {
    
    if (argc != 2) exit(1) ;// Check if argument was provided
    
    int num = atoi(argv[1]); if (num < 1) exit(1);

    printf("The sum from %d down to 0 is: %d\n", num, sum2zero(num));
    
    return 0;
}
```

Now the next is to write a function that flips one specific bit of the word it takes as argument. For this; while
it is possible to perform the operation using NOT, it isn't advised, rather it is easier to create a mask and use
the XOR operator to do the flip.

For this a function shall be written that takes the binary argument as input:

```c
unsigned xor_flip(uint8_t *data, size_t size, int bit_position) {
    
    if (bit_position < 0 || bit_position >= (size * 8)) {
        fprintf(stderr, "Error: Bit position out of range\n");
        exit(1);
    } else ;

    // Calculate byte and bit positions
    int byte_pos = bit_position / 8;
    int bit_in_byte = bit_position % 8;

    // Flip the bit using XOR
    return ((unsigned*)data)[byte_pos] ^ (1 << bit_in_byte);
}
```

And for reference in the main function imports the variables as a command line argument:

```c
int main(int argc, const char* argv[], const char* envp[]) {
    
    if (argc == 1) exit(1) ;// Check if argument was provided
    
    uint8_t val = int2bin(atoi(argv[1])), pos = atoi(argv[2]);

    printf( "Flipping bit in little endian position %d of value: "BYTE_TO_BINARY_PATTERN
        " using XOR -> Result: "BYTE_TO_BINARY_PATTERN"\n", pos, BYTE_TO_BINARY(val), 
        BYTE_TO_BINARY(xor_flip(&val, sizeof(val), pos))
    );

    return 0;
}
```

There are also some code not shown here that makes it so that the cli arguments can be converted
and presented as binary and everything can be found [here](./c/main.c).