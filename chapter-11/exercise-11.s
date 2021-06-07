	.intel_syntax noprefix

	.globl	is_vowel
is_vowel:
	/* TODO: Complete this */
	ret

vowels:
	.ascii "AEIOUaeiou"

	.globl is_leap_year
is_leap_year:
	/* TODO: Complete this */
	ret

	.globl high_low
high_low:
	/* TODO: Complete this */
	ret
	
m0:	.asciz	"High/Low"
m1:	.asciz	"Equal"
m2:	.asciz	"Low/High"
high:	.quad m0
same:	.quad m1
less:	.quad m2

	.globl letter_grade
letter_grade:
	/* TODO: Complete this */
	ret

letter_grades:
	.ascii	"FFFFFFDCBAA"
