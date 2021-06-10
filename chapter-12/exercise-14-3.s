.intel_syntax noprefix
	
.globl main
main:
	mov	rdi, 128		# buffer length
	lea	rsi, [rip + string1]	# &buffer
	lea	rdx, [rip + prompt]	# &prompt
	call	read_string

	mov	rdi, 128		# buffer length
	lea	rsi, [rip + string2]	# &buffer
	lea	rdx, [rip + prompt]	# &prompt
	call	read_string

	call	mangle_strings		# do the silly work

	lea	rdi, [rip + string1]	# load the first string
	call	print_string		# and print it

	lea	rdi, [rip + string2]	# load the second string
	call	print_string		# and print it
	
	xor	rax, rax		# clear process result
	ret

mangle_strings:
	# For each word found in each string, swap the first two characters

	# First, get the string lengths, so that we make sure that we don't
	# go over each string.

	lea	rdi, [rip + string1]	# load the address of the first string
	push	rdi			# preserve it
	call	string_length		# get its length
	mov	r12, rax		# r12 == string1.length
	pop	r13			# r13 == current string1 base

	lea	rdi, [rip + string2]	# load the address of the second string
	push	rdi			# preserve it
	call	string_length		# get its length
	mov	r14, rax		# r14 == string2.length
	pop	r15			# r15 == current string2 base

next_word:
	cmp	r12, 3			# need at least two characters
	jb	done_mangling		# ...
	cmp	r14, 3			# in both strings
	jb	done_mangling		# else we're done
	
	mov	dl, BYTE PTR[r13]	# dl = string1[0]
	mov	cl, BYTE PTR[r15]	# cl = string2[0]
	mov	BYTE PTR[r13], cl	# string1[0] = dh
	mov	BYTE PTR[r15], dl	# string2[0] = cl

	mov	dl, BYTE PTR[r13+1]	# dl = string1[1]
	mov	cl, BYTE PTR[r15+1]	# cl = string2[1]
	mov	BYTE PTR[r13+1], cl	# string1[1] = cl
	mov	BYTE PTR[r15+1], dl	# string2[1] = dl

	# find next word in string1
	mov	rdi, r13		# r13 is base
	mov	rcx, r12		# r12 is length
	mov	rax, ' '		# search for space
	repnz scasb
	mov	r13, rdi		# new base
	mov	r12, rcx		# new length
	
	# find next word in string1
	mov	rdi, r15		# r15 is base
	mov	rcx, r14		# r14 is length
	mov	rax, ' '		# search for space
	repnz scasb
	mov	r15, rdi		# new base
	mov	r14, rcx		# new length

	jmp	next_word
	
done_mangling:
	ret

read_string:
	push	rdi			# preserve the ...
	push	rsi			# ... registers that ...
	push	rdx			# ... we use
	
	mov	rdi, rdx		# load the string to print
	call	print_string		# and print it
	
	pop	rdx			# restore the ...
	pop	rsi			# ... registers ...
	pop	rdi			# ... we had saved
	
	mov	rdx, rdi		# move size into rdx (rsi already has buffer)
	xor	rdi, rdi		# FD 0 is STDIN
	xor	rax, rax		# 0 is the SYSCALL number for sys_read
	syscall
	
	ret

prompt:
	.asciz	"Please enter a string: "

print_string:
	push	rdi			# preserve the string pointer
	call	string_length		# get the length
	pop	rdi			# restore the string pointer

	mov	rdx, rax		# move length to rdx
	mov	rsi, rdi		# move string pointer to rsi
	mov	rdi, 1			# FD 1 is STDOUT
	mov	rax, 1			# 1 is the SYSCALL number for sys_write
	syscall
	
	ret

string_length:
	mov	rcx, -1			# start at -1
	xor	rax, rax		# searching for '\0'
	repnz scasb			# search rdi for rax
	not	rcx			# we counted backwards, so ones complement...
	sub	rcx, 1			# ... and subtract 1 to get the length
	mov	rax, rcx		# return the length

	ret

	.bss
string1:
	.space 129
string2:
	.space 129
