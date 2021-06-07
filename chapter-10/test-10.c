// gcc -O1 -masm=intel -fno-asynchronous-unwind-tables test-10.c exercise-10.s -o test-10
#include <stdio.h>

extern double hypoteneuse(double a, double b);
extern int quadratic(double a, double b, double c, double *x, double *y);

int main(void)
{
  printf("%lf\n", hypoteneuse(3.0,4.0));

  double x1, x2;
  // X = [-3, -2]
  if (quadratic(1.0, 5.0, 6.0, &x1, &x2) == 2)
    printf("X = %lf or X = %lf\n", x1, x2);

  // X = [-2, 5]
  if (quadratic(1.0, -3.0, -10.0, &x1, &x2) == 2)
    printf("X = %lf or X = %lf\n", x1, x2);

  // X = [3, 15]
  if (quadratic(1.0, -18.0, 45.0, &x1, &x2) == 2)
    printf("X = %lf or X = %lf\n", x1, x2);

  // X = [-1, 1/3]
  if (quadratic(3.0, 2.0, -1.0, &x1, &x2) == 2)
    printf("X = %lf or X = %lf\n", x1, x2);

  // No real roots
  if (quadratic(3.0, 2.0, 1.0, &x1, &x2) == 2)
    printf("X = %lf or X = %lf\n", x1, x2);
}
