CC=gcc
ASFLAGS += -W
CFLAGS += -O1 -g -masm=intel -fno-asynchronous-unwind-tables

%.s: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -S -o $@ $^

exercise-1: exercise-1.c
short-program: short-program.c
