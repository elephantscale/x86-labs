// gcc -O1 -masm=intel -fno-asynchronous-unwind-tables fibtest.c fastfib.s uint64_array_to_string.c -o fibtest

#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>

typedef struct { uint64_t part[4]; } fib_buffer;

extern void fast_fibonacci(int, fib_buffer *);
extern char * uint64_array_to_string(int n, const uint64_t *arr);

void main(int argc, char**argv)
{
  if (argc < 2)
  {
    printf("%s: <number of fibonacci numbers to generate>\n", argv[0]);
    exit(-1);
  }

  int number_to_generate = atoi(argv[1]);

  fib_buffer * fib = malloc(sizeof(fib_buffer));
  for (int n = 0; n <= number_to_generate; n++)
  {
    fast_fibonacci(n, fib);

    printf("Fibonacci number %d is 0x", n);
    for (int i = 0; i < 4 ; i++) printf("%016" PRIX64, fib->part[i]);
    printf("\n");

    char * text = uint64_array_to_string(4, &(fib->part[0]));
    printf("Fibonacci number %d is %s\n", n, text);
    free(text);
  }
}
