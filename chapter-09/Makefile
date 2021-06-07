CC=gcc
ASFLAGS += -W
CFLAGS += -O1 -masm=intel -fno-asynchronous-unwind-tables

%.s: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -S -o $@ $^

exercise-9: exercise-9.s
test-09-c: test-9.c exercise-9-bootstrap.c
test-09: test-09.c exercise-9.s
