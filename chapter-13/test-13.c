// gcc -O1 -masm=intel -fno-asynchronous-unwind-tables test-13.c exercise-13.s -o test-13
#include <stdio.h>
#include <string.h>
#include <inttypes.h>

extern int scrabble_score(char *);
extern int phone_keypad_button (char letter);

void main(int argc, char** argv)
{
  char * words[] = { "A", "a", "Z", "z", "Queen", "Quant", "\0" };

  for (int i = 0; strlen(words[i]) != 0; i++)  
    printf("%s scores %d\n", words[i], scrabble_score(words[i]));

  for (uint8_t c = 1; c != 0; c++)
  {
    int key = phone_keypad_button (c);
    if (key != 0) printf("Dial %d for %c (%02X)\n", key, c, c);
  }
}
