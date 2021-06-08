// gcc -O1 -masm=intel -fno-asynchronous-unwind-tables test-10.c exercise-10.s -o test-10
#include <stdio.h>
#include <stdbool.h>

extern void add42(int * dst);
extern int product_2(int x, int y, int z);
extern int quintuple(int x);
extern bool is_odd(unsigned int x);
extern void product_5(int x, int y, int * res);

int main(void)
{
   int arg = 3;
   add42(&arg);
   printf("%d\n", arg); 

  /* printf("%d\n", product_2(3,4,5)); */
  /* TODO: Try the other functions */
}

