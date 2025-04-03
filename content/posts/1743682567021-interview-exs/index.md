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

Now the next is to write a function that flips one specific bit of the word it takes as argument. For this; two options will be provided. One
using XOR and one using NOT both bitwise.
```c
#include <stdio.h>
#include <stdlib.h>

void flip_bit_with_not(int *value, int bit_position) {
    if (bit_position < 0 || bit_position >= (int)(sizeof(*value) * 8)) {
        fprintf(stderr, "Error: Bit position out of range\n");
        exit(1);
    }
    
    // Save original bit state
    int original_bit = (*value >> bit_position) & 1;
    
    // Flip ALL bits with NOT
    *value = ~(*value);
    
    // Restore all bits except our target
    if (original_bit) {
        *value |= (1 << bit_position);  // Set if originally was 1
    } else {
        *value &= ~(1 << bit_position); // Clear if originally was 0
    }
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("Usage: %s <number> <bit_position>\n", argv[0]);
        return 1;
    }
    
    int num = atoi(argv[1]);
    int bit_pos = atoi(argv[2]);
    
    printf("Original: %d (0x%x)\n", num, num);
    flip_bit_with_not(&num, bit_pos);
    printf("After NOT flip: %d (0x%x)\n", num, num);
    
    return 0;
}
```
...