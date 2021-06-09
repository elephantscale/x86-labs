	.intel_syntax noprefix
	.text
	
	.globl	hypoteneuse
	.type	hypoteneuse, @function
hypoteneuse:
	/* TODO: Complete this */
	ret
	.size	hypoteneuse, .-hypoteneuse
	
	.globl	quadratic
	.type	quadratic, @function
quadratic:
	/*
	Entry:
		xmm0	a
		xmm1	b
		xmm2	c
		rdi	x1
		rsi	x2

	ref: https://en.wikipedia.org/wiki/Quadratic_formula
	Solution to Quadratic:

	      -b + sqrt(b**2 - 4ac)
	x1 =  ---------------------
                   2a

              -b - sqrt(b**2 - 4ac)
	x2 =  ---------------------
                   2a
	*/

	/* TODO : complete this */

	ret
	.size	quadratic, .-quadratic

	.data
	.align 16
zero:	.double 0
	.align 16
two:	.double 2
	.align 16
four:	.double 4
