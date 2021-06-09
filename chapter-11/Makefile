CC=gcc
ASFLAGS += -W
CFLAGS += -O1 -masm=intel -fno-asynchronous-unwind-tables

%.s: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -S -o $@ $^

test-12: test-12.c exercise-12.s


