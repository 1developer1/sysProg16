;to use these pseudo-random number sequence generators, memory must be
;set aside to hold the last random number, which is used to generate the
;next one so that a randomly distributed (but predictable) sequence of
;number is generated.

rand8reg 	EQU 0x20	;one byte that stores a single 8bit random number
randomAmount	EQU 0x21	;one byte that stores the amount of generated random numbers
randomMem	EQU 0x22	;one byte that stores the start address of the generated random numbers.

generateRandomNumbers:
	mov	randomAmount, #08H	;this can be removed later and randomAmount can be set from the outside
	mov	randomMem, #30H		;this can be removed later and randomMem can be set from the outside
	mov	rand8reg, TL0
	mov	R7, randomAmount
	mov	R0, randomMem		;the start address of the random number storage
randLoop:
	mov	a, R7
	jz 	randLoopEnd
	dec	a
	mov	R7, a
	call 	rand8
	mov	@R0, rand8reg
	inc	R0
	jmp 	randLoop
randLoopEnd:
	ret
	

;generates an 8 bit pseudo-random number which is returned in Acc.
;one byte of memory must be available for rand8reg

rand8:	mov	a, rand8reg
	jnz	rand8b
	cpl	a
	mov	rand8reg, a
rand8b:	anl	a, #10111000b
	mov	c, p
	mov	a, rand8reg
	rlc	a
	mov	rand8reg, a
	ret