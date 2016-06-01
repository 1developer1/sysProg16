topLeft		equ 0x50;
topRight	equ 0x51;
bottomLeft	equ 0x52;
bottomRight	equ 0x53;
sequenceMem	equ 0x54;


generateFieldSequence:
	;initialize port allocation
	mov	topLeft, #11111010b		;P0.0 & P0.2
	mov	topRight, #11110110b		;P0.0 & P0.3
	mov	bottomLeft, #11111001b		;P0.1 & P0.2
	mov	bottomRight, #11110101b;	;P0.1 & P0.3
	;initialize utility registers
	mov	sequenceMem, #58H
	mov	R7, randomAmount
	mov	R0, sequenceMem
	mov	R1, randomMem
sequenceLoop:
	mov	a, R7
	jz 	sequenceLoopEnd
	dec	a
	mov	R7, a
	mov	a, @R1
	mov	b, #04H
	div	ab
	mov	R6, b
	mov	a, R6
	xrl	a, #00H
	jz	setTopLeft
	mov	a, R6
	xrl	a, #01H
	jz	setTopRight
	mov	a, R6
	xrl	a, #02H
	jz	setBottomLeft
	mov	a, R6
	xrl	a, #03H
	jz	setBottomRight
	jmp	setTopLeft
sequenceLoopEnd:
	ret

updateSourceAndTargetMem:
	inc	R0
	inc	R1
	jmp	sequenceLoop
setTopLeft:
	mov	@R0, topLeft
	jmp	updateSourceAndTargetMem
setTopRight:
	mov	@R0, topRight
	jmp	updateSourceAndTargetMem
setBottomLeft:
	mov	@R0, bottomLeft
	jmp	updateSourceAndTargetMem
setBottomRight:
	mov	@R0, bottomRight
	jmp	updateSourceAndTargetMem
	
