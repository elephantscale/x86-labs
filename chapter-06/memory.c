#include <stdio.h>
#include <stdlib.h>

int data = 99;
int bss;

int main(void)
{
  int stack = 86;
  int *heap = malloc(sizeof(*heap));

  printf("stack: %p\n", &stack);
  printf(" heap: %p\n", heap);

  printf(" bss: %p\n", &bss);
  printf(" data: %p\n", &data);
  printf(" text: %p\n", main);
  free(heap);
}
