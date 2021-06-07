CC=gcc
ASFLAGS += -W
CFLAGS += -O1 -masm=intel -fno-asynchronous-unwind-tables

%.s: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -S -o $@ $^

test-10: test-10.c exercise-10.s


