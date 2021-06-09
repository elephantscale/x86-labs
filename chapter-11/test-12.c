// gcc -O1 -masm=intel -fno-asynchronous-unwind-tables test-12.c exercise-12.s -o test-12

#include <inttypes.h>
#include <stdio.h>

extern unsigned int factorial(unsigned int);
extern int collatz_steps(int); // https://en.wikipedia.org/wiki/Collatz_conjecture
extern unsigned int sum(uint16_t *, size_t);

void main(int argc, char** argv)
{
  for (int i = 0; i < 10; i++)
    printf("Factorial %d = %d\n", i, factorial(i));

  for (int i = 0; i < 10; i++)
    printf("The number of Collatz Steps for %d is %d\n", i, collatz_steps(i));

  uint16_t items[10] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
  for (int i = 1; i <= 10; i++)
    printf("Sum of 1 to %d is: %d\n", i, sum(items, i));
}
