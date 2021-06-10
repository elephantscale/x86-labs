.intel_syntax noprefix
	
.globl main
main:
	/* TODO: complete main function */
	ret

mangle_strings:
	# For each word found in each string, swap the first two characters

	# First, get the string lengths, so that we make sure that we don't
	# go over each string.

	/* TODO: complete function */

	ret

read_string:
	/* TODO: complete function */
	
	ret

prompt:
	.asciz	"Please enter a string: "

print_string:
	/* TODO: complete function */
	ret

string_length:
	/* TODO: complete function */

	ret

	.bss
string1:
	.space 129
string2:
	.space 129
