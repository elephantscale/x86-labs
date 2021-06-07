#include <stdbool.h>

void add42(int * dst)
{
  *dst += 42;
}

int product_2(int x, int y, int z)
{
  return x * y * z;
}

int quintuple(int x)
{
  return x * 5;
}

bool is_odd(unsigned int x)
{
  return x & 1;
}

void product_5(int x, int y, int * res)
{
  *res = x * y;
}
