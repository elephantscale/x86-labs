	.intel_syntax	noprefix
	.text
	.global times10
	.type times10, @function
	
times10:
	mov	ecx, 10		# loop 10 times
loop:
	push	rdi		# preserve rdi (string)
	push	rcx		# preserve rcx (counter)
	call	puts@plt
	pop	rcx		# resture counter
	pop	rdi		# restore string pointer
	loop	loop
	ret
