#include <stdio.h>
#include <stdlib.h>

int sum2zero(int n) {return (n < 1) ? 0 : n + sum2zero(n - 1);}

unsigned char* xor_flip(void *data, size_t size, int bit_position) {
    
    if (bit_position < 0 || bit_position >= (int)(size * 8)) {
        fprintf(stderr, "Error: Bit position out of range\n");
        exit(1);
    }

    // Calculate byte and bit positions
    int byte_pos = bit_position / 8;
    int bit_in_byte = bit_position % 8;

    // Flip the bit using XOR
    return ((unsigned char *)data)[byte_pos] ^ (1 << bit_in_byte);
}

void not_flip(int *value, int bit_position) {
    if (bit_position < 0 || bit_position >= (int)(sizeof(*value) * 8)) {
        fprintf(stderr, "Error: Bit position out of range\n");
        exit(1);
    }
    
    // Save original bit state
    int original_bit = (*value >> bit_position) & 1;
    
    // Flip ALL bits with NOT
    *value = ~(*value);
    
    // Restore all bits except our target    
    return (original_bit) ? *value |= (1 << bit_position) : *value &= ~(1 << bit_position) ;
}

int main(int argc, const char* argv[], const char* envp[]) {
    
    if (argc == 1) exit(1) ;// Check if argument was provided
    
    int num = atoi(argv[1]); if (num < 1) exit(1);

    printf("The sum from %d down to 0 is: %d\n", num, sum2zero(num));
    
    // ~~~~~~~~~~~~~~~~~~~~~XOR FLIP~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    if (argc != 4) exit(1);

    // value = (~value ^ ~(1 << bit_position)) ^ (1 << bit_position);

    return 0;
}