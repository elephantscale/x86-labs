// gcc -O1 -masm=intel -fno-asynchronous-unwind-tables test-14.c exercise-14.s -o test-14
#include <stdio.h>
#include <string.h>
#include <inttypes.h>

extern void times10(char * s);

void main(int argc, char** argv)
{
  times10("You are braver than you believe, stronger than you seem, and smarter than you think.");
}
