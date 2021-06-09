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
	ret

	.global collatz_steps
	.type collatz_steps, @function
	# See https://en.wikipedia.org/wiki/Collatz_conjecture
	# Collatz(1): 0
	# Collatz(2): 1
collatz_steps:
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
	ret
