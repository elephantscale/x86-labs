.intel_syntax noprefix
	
.globl main
main:
/* TODO Complete function */
	
	ret

prompt1:
	.asciz	"Please enter the first number: "

prompt2:
	.asciz	"Please enter the second number: "

prompt3:
	.asciz	"Please enter the third number: "
	
atoi_string:
	.asciz	"%d"

finish_string:
	.asciz	"\n"

read_string:
/* TODO Complete function */
	ret

print_string:
/* TODO Complete function */
	
	ret

ascii_to_integer:
	call	atoi@plt	# direct proxy to C atoi
	ret

integer_to_ascii:	
/* TODO Complete function */
	
	ret

	.bss
string1:
	.space 129
string2:
	.space 129
string3:
	.space 129
result:
	.space 129
