	.intel_syntax	noprefix
	.text
	.global factorial
	.type factorial, @function
	
factorial:
/*
Registers:
Parameters:	RDI - n for factorial(n)
*/
	/* TODO: Complete this */
	mov	rax, 1		# F(1) = 1
	xor	rdx, rdx	# clear the multiply accumulator overflow

	cmp	rdi, 1		# is rdi >= 1?
	jb	done		# is rdi < 1?
	
	mov	rcx, rdi	# start with the counter equal to N
next:
	mul	rcx		# multiple by current counter
	loop	next		# dec counter and repeat until counter == 0
done:
	ret

	.global collatz_steps
	.type collatz_steps, @function
	# See https://en.wikipedia.org/wiki/Collatz_conjecture
	# Collatz(1): 0
	# Collatz(2): 1
collatz_steps:
	/* TODO: Complete this */
	xor	ecx, ecx	# ecx == number of steps, initially zero
	mov	r8, 2		# We have a need to divide by 2
	mov	r9, 3		# and a need to multiple by 3
	mov	rax, rdi	# initialize rax with the number
	cmp	rax, 0		# Collatz(0) ...
	je	collatz_done	# ... we're done

collatz_loop:
	cmp	rax, 1		# Once it has converged on 1 ...
	je	collatz_done	# ... we're done

	inc	ecx		# increment number of steps

	test	al, 1		# Is rax odd?
	jnz	odd		# yes
	
even:
	/* Commented out printf for debugging
	push	rax			# Preserve rax
	push	rcx			# Preserve rcx
	push	r8			# Preserve r8
	push	r9			# Preserve r9
	push	rdi			# Needed for 16-byte alignment
	mov	rsi,rax			# rsi has value to print
	xor	rax,rax			# rax has number of XMMx in use
	lea	rdi, [rip + evenm]	# rdi has message to format
	call	printf@plt		# call printf
	pop	rdi
	pop	r9
	pop	r8
	pop	rcx
	pop	rax
	*/

	xor	rdx, rdx	# clear before divide
	div	r8		# N = N / 2
	jmp	collatz_loop
odd:
	/* Commented out printf for debugging
	push	rax			# Preserve rax
	push	rcx			# Preserve rcx
	push	r8			# Preserve r8
	push	r9			# Preserve r9
	push	rdi			# Needed for 16-byte alignment
	mov	rsi,rax			# rsi has value to print
	xor	rax,rax			# rax has number of XMMx in use
	lea	rdi, [rip + oddm]	# rdi has message to format
	call	printf@plt		# call printf
	pop	rdi
	pop	r9
	pop	r8
	pop	rcx
	pop	rax
	*/
	
	mul	r9		# N = 3N
	inc	eax		# N = 3N + 1
	jmp	collatz_loop

collatz_done:
	mov	eax, ecx
	ret

#evenm:	.asciz	"%d is even\n"
#oddm:	.asciz	"%d is odd\n"
	
	.global	sum
	.type sum, @function
sum:
/*
Registers:
RDI:	int *
RSI:	number of items	
*/
	/* TODO: Complete this */
	cmp	rsi, 1		# We need at least 1 ...
	jb	done_sum	# ... or we're done
	
	xor	rax, rax	# clear the sum
	mov	rcx, rsi	# rcx == number of items
next_sum:			# loop an add for each item
	add	ax, WORD PTR [rdi + 2*rcx - 2]
	loop	next_sum
done_sum:
	ret
