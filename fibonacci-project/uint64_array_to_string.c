// Modified for uint64_t from https://en.wikipedia.org/wiki/Double_dabble#C_implementation

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <inttypes.h>

/* DOUBLE DABBLE ALGORITHM

   This function takes an array of n uint64_t values,
   each holding a value in the range [0, 0xFFFFFFFFFFFFFFFF],
   representing a number in the range [0, 2**(64n)-1].
   arr[0] is the most significant value..

   This function returns a new string containing the given
   number as a string of decimal digits.

   For the sake of brevity, this example assumes that
   calloc and realloc will never fail.
*/

char * uint64_array_to_string(int n, const uint64_t *arr)
{
    int nbits = sizeof(*arr)*8*n;         /* length of arr in bits */
    int nscratch = nbits/3;   /* length of scratch in bytes */
    char *scratch = calloc(1 + nscratch, sizeof *scratch);
    int i, j, k;
    int smin = nscratch-2;    /* speed optimization */

    //printf("Working with %d bits\n", nbits);
    for (i=0; i < n; ++i) {
        //printf("arr[%d] = %016lX\n", i, v);
        for (j=0; j < 64; ++j) {
	    uint64_t mask = ((uint64_t) 1) << (63-j); // The cast is MANDATORY to prevent gcc from treating it as a 32 bit shift!
	    /* This bit will be shifted in on the right. */
	    int shifted_in = (arr[i] & mask) ? 1: 0;
	    //if (shifted_in == 1) printf("Block %d, bit %d\n", i, j);

            /* Add 3 everywhere that scratch[k] >= 5. */
            for (k=smin; k < nscratch; ++k)
              scratch[k] += (scratch[k] >= 5)? 3: 0;

            /* Shift scratch to the left by one position. */
            if (scratch[smin] >= 8)
              smin -= 1;
            for (k=smin; k < nscratch-1; ++k) {
                scratch[k] <<= 1;
                scratch[k] &= 0xF;
                scratch[k] |= (scratch[k+1] >= 8);
            }

            /* Shift in the new bit from arr. */
            scratch[nscratch-1] <<= 1;
            scratch[nscratch-1] &= 0xF;
            scratch[nscratch-1] |= shifted_in;
        }
    }

    /* Remove leading zeros from the scratch space. */
    for (k=0; k < nscratch-1; ++k)
      if (scratch[k] != 0) break;
    nscratch -= k;
    memmove(scratch, scratch+k, nscratch+1);

    /* Convert the scratch space from BCD digits to ASCII. */
    for (k=0; k < nscratch; ++k)
      scratch[k] += '0';

    /* Resize and return the resulting string. */
    //*result = realloc(scratch, nscratch+1);
    return realloc(scratch, nscratch+1);
}

/*
int main(void)
{
  uint64_t arr[] = { 0, 0, 0, 1 };
    char *text = NULL;
    int i;
    for (i=0; i < 4; ++i) {
        double_dabble(i+1, arr, &text);
        printf("%s\n", text);
        free(text);
    }
    return 0;
}
*/
