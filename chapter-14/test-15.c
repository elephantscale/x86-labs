// gcc -O1 -masm=intel -fno-asynchronous-unwind-tables test-15.c exercise-15.s -o test-15
#include <stdio.h>
#include <string.h>
#include <inttypes.h>

extern int exists(uint16_t needle, const uint16_t * haystack, int size);
extern int string_length(const char *);
extern char * my_strrchr(const char *, int c);

const uint16_t haystack[] = { 0, 1, 2, 3, 4, 5, 6, 7 };
const char * msg = "Hello World";

void main(int argc, char** argv)
{
  printf("Buffer start: %llX, Buffer end: %llX\n", &haystack[0], &haystack[7]);

  for (int needle = 0; needle < 10; needle++)
  {
    printf("%d exists at index %d\n", needle, exists(needle, haystack, 8));
  }

  printf("'%s' is %d characters long\n", msg, string_length(msg));

  printf("%s starts at %llX.  %c found at %llX\n", msg, msg, 'H', my_strrchr(msg, 'H'));
  printf("%s starts at %llX.  %c found at %llX\n", msg, msg, 'd', my_strrchr(msg, 'd'));
  printf("%s starts at %llX.  %c found at %llX\n", msg, msg, 'e', my_strrchr(msg, 'e'));
  printf("%s starts at %llX.  %c found at %llX\n", msg, msg, 'z', my_strrchr(msg, 'z'));
}
