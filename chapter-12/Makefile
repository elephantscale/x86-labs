CC=gcc
ASFLAGS += -W
CFLAGS += -O1 -masm=intel -fno-asynchronous-unwind-tables

%.s: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -S -o $@ $^

test-14: test-14.c exercise-14.s
exercise-14-3: exercise-14-3.s
exercise-14-4: exercise-14-4.s
