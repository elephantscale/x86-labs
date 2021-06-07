extern double sqrt(double f);

double hypoteneuse(double a, double b)
{
  return sqrt(a*a + b*b);
}

int quadratic(double a, double b, double c, double *x, double *y)
{
  /*
          -b + sqrt(b**2 - 4ac)
    x1 =  --------------------- => "y"
                   2a

          -b - sqrt(b**2 - 4ac)
    x2 =  --------------------- => "x"
                   2a
   */

  // Partials
  double s = sqrt( b*b - (4 * a * c));
  double d = 2 * a;

  // Roots
  *x = (-b - s) / d;
  *y = (-b + s) / d;
}
