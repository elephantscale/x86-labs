# Fibonacci
The Fibonacci Sequence is a famous mathematical sequence that is defined as follows:

```text
F0 = 0
F1 = 1
Fn = F(n−1) + F(n−2)
```
The first few terms of the Fibonacci sequence are 0, 1, 1, 2, 3, 5, 8, 13, ...

Write a program in x86 Assembly Language that uses the first command-line parameter as a number N from 0
through 100. The program should then print out F(N), in hexadecimal. Make sure that the output of the program
matches the format shown below.

The name of the source code file should be fib.s, and be placed in your submit directory.

Sample Output: 

```console
> fibonacci 47
0xB11924E1
> fibonacci 29
0x7D8B5
```
