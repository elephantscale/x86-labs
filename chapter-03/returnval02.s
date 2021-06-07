.intel_syntax noprefix
.globl main
GreetingText:
    .string "Hello World!\n"
main:
    lea rdi, GreetingText[rip]
    call puts@PLT
    mov  ax, 42
    ret
