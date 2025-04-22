#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

#define BYTE_TO_BINARY_PATTERN "%c%c%c%c%c%c%c%c"
#define BYTE_TO_BINARY(byte)  \
  ((byte) & 0x80 ? '1' : '0'), \
  ((byte) & 0x40 ? '1' : '0'), \
  ((byte) & 0x20 ? '1' : '0'), \
  ((byte) & 0x10 ? '1' : '0'), \
  ((byte) & 0x08 ? '1' : '0'), \
  ((byte) & 0x04 ? '1' : '0'), \
  ((byte) & 0x02 ? '1' : '0'), \
  ((byte) & 0x01 ? '1' : '0') 

unsigned int int2bin(unsigned int k) {
    return (k == 0 || k == 1 ? k : ((k % 2) + 10 * int2bin(k / 2)));
}

int sum2zero(int n) {return (n < 1) ? 0 : n + sum2zero(n - 1);}

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

int main(int argc, const char* argv[], const char* envp[]) {
    
    if (argc == 1) exit(1) ;// Check if argument was provided
    
    int num = atoi(argv[1]); if (num < 1) exit(1);

    printf("The sum from %d down to 0 is: %d\n", num, sum2zero(num));
    
    // ~~~~~~~~~~~~~~~~~~~~~XOR FLIP~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    if (argc != 4) exit(1);

    uint8_t val = int2bin(atoi(argv[2])), pos = atoi(argv[3]);

    printf( "Flipping bit in little endian position %d of value: "BYTE_TO_BINARY_PATTERN
        " using XOR -> Result: "BYTE_TO_BINARY_PATTERN"\n", pos, BYTE_TO_BINARY(val), 
        BYTE_TO_BINARY(xor_flip(&val, sizeof(val), pos))
    );

    return 0;
}