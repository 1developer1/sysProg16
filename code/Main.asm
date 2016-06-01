; Super Mario says
; Assembler project accoring to the game senso

ORG 000h

START:
	call	initializeTimer0
	call	generateRandomNumbers
	call	generateFieldSequence

initializeTimer0:
	mov	TMOD, #02H	;set timer0 to 8-bit Time Mode
	SETB	TR0		;start timer0
	ret

include RandomNumberGenerator.asm
include FieldSequenceGenerator.asm