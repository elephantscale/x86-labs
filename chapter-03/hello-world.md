# Hello world

Here we will be showing an actual hello world program

Create a program called returnval02.s

```assembly

.intel_syntax noprefix
.globl main
GreetingText:
    .string "Hello World!\n"
main:
    lea rdi, GreetingText[rip]
    call puts@PLT
    mov  ax, 42
    ret

```
