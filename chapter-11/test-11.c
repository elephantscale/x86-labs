// gcc -O1 -masm=intel -fno-asynchronous-unwind-tables test-11.c exercise-11.s -o test-11

#include <stdio.h>
#include <string.h>
#include <stdbool.h>

void test_vowels(void)
{
  extern bool is_vowel(char);

  for (int i = 65; i < 91; i++)
  {
    printf("%c %s a vowel\n", i, is_vowel(i) ? "is" : "is not");
    printf("%c %s a vowel\n", i+32, is_vowel(i+32) ? "is" : "is not");
  }
}

void test_leapyears()
{
  extern bool is_leap_year(int);

  for (int i = 1598 ; i < 1705; i++)
    printf("%d %s a leap year\n", i, is_leap_year(i) ? "is" : "is not");
}

void test_highlow()
{
  extern char* high_low(int, int);

  printf("%s\n", high_low(1,2));
  printf("%s\n", high_low(2,2));
  printf("%s\n", high_low(3,2));
}

void test_grades()
{
  extern char letter_grade(int);

  for (int i = 0; i <= 100; i++)
    printf("%d is a grade of %c\n", i, letter_grade(i));
}

int main(void)
{
  test_vowels();
  test_leapyears();
  test_highlow();
  test_grades();
}
