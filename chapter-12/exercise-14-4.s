.intel_syntax noprefix
	
.globl main
main:
	mov	rdi, 128		# buffer length
	lea	rsi, [rip + string1]	# &buffer
	lea	rdx, [rip + prompt1]	# &prompt
	call	read_string

	mov	rdi, 128		# buffer length
	lea	rsi, [rip + string2]	# &buffer
	lea	rdx, [rip + prompt2]	# &prompt
	call	read_string

	mov	rdi, 128		# buffer length
	lea	rsi, [rip + string3]	# &buffer
	lea	rdx, [rip + prompt3]	# &prompt
	call	read_string
	
	lea	rdi, [rip + string1]	# load the first numeric string
	call	ascii_to_integer	# convert to an integer
	push	rax			# push to the stack

	lea	rdi, [rip + string2]	# load the second numeric string
	call	ascii_to_integer	# convert to an integer
	push	rax			# push to the stack

	lea	rdi, [rip + string3]	# load the third numeric string
	call	ascii_to_integer	# convert to an integer

	pop	rbx			# pop second int to rbx
	mul	rbx			# rax *= rbx
	pop	rbx			# pop the first in to rbx
	mul	rbx			# rax *= rbx

	mov	rdi, rax		# 1st param is rax
	lea	rsi, [rip + result]	# 2nd param is where we want it
	call	integer_to_ascii

	lea	rdi, [rip + result]	# load result
	call	print_string		# and print it
	
	lea	rdi, [rip + finish_string]	# print a newline
	call	print_string
	
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
	push	rdi		# preserve the ...
	push	rsi		# ... registers that we ...
	push	rdx		# ... use
	
	mov	rdi, rdx	# rdx has the prompt, so load it ...
	call	print_string	# ... and print.
	
	pop	rdx		# restore the ...
	pop	rsi		# ... registers that we ...
	pop	rdi		# ... use
	
	mov	rdx, rdi	# # move dize into rdx (rsi already has buffer)
	xor	rdi, rdi	# FD 0 is STDIN
	xor	rax, rax	# 0 is the SYSCALL number for sys_read
	syscall
	
	ret

print_string:
	push	rdi		# preserve the string pointer
	
	# this is an inline strlen(s)
	mov	rcx, -1		# start at -1
	xor	rax, rax	# search for '\0'
	repnz scasb		# search rdi for rax
	not	rcx		# we counted backwards, so ones complement
	sub	rcx, 1		# ... and subtract 1 to get the length
	
	pop	rdi		# restore the string pointer

	mov	rdx, rcx	# move length to rdx
	mov	rsi, rdi	# move string pointer to rsi
	mov	rdi, 1		# FD 1 is STDOUT
	mov	rax, 1		# 1 is the SYSCALL number for sys_write
	syscall
	
	ret

ascii_to_integer:
	call	atoi@plt	# direct proxy to C atoi
	ret

integer_to_ascii:	
	# use sprintf to convert
	mov	rdx, rdi		# the number to convert was in rdi
	mov	rdi, rsi		# the buffer to use was in rsi
	lea	rsi, [rip+atoi_string]	# the format string for sprintf
	xor	eax, eax		# the number of XMM0 registers in use
	call	sprintf@plt
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
