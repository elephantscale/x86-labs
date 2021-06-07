	.intel_syntax	noprefix
	.text
	.global fast_fibonacci
	.type fast_fibonacci, @function
	
fast_fibonacci:
/*
Registers:
Parameters:	RDI, RSI
Available:	RAX, RDX, RCX, R8, R9, R11
Also (saved):	R12, R13, R14, R15
Used: RDI, RSI, RAX, RDX, R8, R9, R12-15
	
Details:
	RDI:	number of the fibonacci number to generate
	RSI:	address of a 256 byte buffer to hold the result
	RCX:	loop counter
		F(N, N-2):
	RAX:	0..63
	RDX:	64..127
	R8	128..191
	R9	192..255
		F(N-1)
	R12:	0..63
	R13:	64..127
	R14	128..191
	R15	192..255
*/

	/* TODO: Copmlete this */

	ret
