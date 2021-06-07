## Chapter 8 Exercises

1. Write a program in assembly whose return code is three
mes the number of parameters on the command line.

[Exercise 8-1](./exercise-8-1.s)

2: Implement a program iam in assembly code that prints
out the name of the program as it is invoked on the com-
mand line (i.e., `argv[0]`). The second argument to a func-
on is stored in the register rsi.

3. Write an assembly program whose return code is the
ASCII value of the first le er of the program’s name.

[Exercise 8-3](./exercise-8-3.s)

4. The `lea` instruc on can be used to multiply a register
by a number of different constant values, rather than us-
ing mul. Using just two `lea` instructions and one register,
which constant mulpliers of that register are possible?

5. What value is returned by this program? Why?

```assembly
main:
	mov al, [rip]
	ret
```

[Exercise 8-5](./exercise-8-5.s)
