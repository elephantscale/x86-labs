# Almost Hello World

Open a file named `returnval-almost.s` and enter the following program:

```assembly
.intel_syntax noprefix

.globl main
main:

mov
eax, 42

ret
```

The program should be compiled and run with:

```console
$ make returnval-almost
$ ./returnval-almost ; echo $?
42
$
```

The `$?` shell variable is used to extract the program’s return code.
Compare this to the following C program:

```c
int main(void)
{

return 42;
}
```

You can compare the C code as follows:

```console
$ make returnval-c.s
$ cat returnval-c.s
```
