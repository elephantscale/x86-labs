CC=gcc
ASFLAGS += -W
CFLAGS += -O1 -masm=intel -fno-asynchronous-unwind-tables

%.s: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -S -o $@ $^

exercise-8-1: exercise-8-1.s
exercise-8-3: exercise-8-3.s
exercise-8-5: exercise-8-5.s
