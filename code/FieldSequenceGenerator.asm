topLeft		equ 0x50;
topRight	equ 0x51;
bottomLeft	equ 0x52;
bottomRight	equ 0x53;
fieldMem	equ 0x54;
sequenceMem	equ 0x55;v


generateFieldSequence:
	
	;initialize port allocation
	mov	topLeft, #11111010b		;P0.0 & P0.2
	mov	topRight, #11110110b		;P0.0 & P0.3
	mov	bottomLeft, #11111001b		;P0.1 & P0.2
	mov	bottomRight, #11110101b		;P0.1 & P0.3
	;initialize utility registers
	mov	fieldMem, #60H
	mov	sequenceMem, #70H
	mov	R7, randomAmount
	mov	R3, fieldMem
	mov	R2, sequenceMem
	mov	R1, randomMem
sequenceLoop:
	mov	a, R3
	mov	R0, a
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
	mov	a, R0
	mov	R2, a
	inc	R1
	call showSequence
	jmp	sequenceLoop
setTopLeft:
	mov	@R0, #01H
	mov	a, R0
	mov	R3, a
	inc	R3
	mov	a, R2
	mov	R0, a
	mov	@R0, topLeft
	jmp	updateSourceAndTargetMem
setTopRight:
	mov	@R0, #02H
	mov	a, R0
	mov	R3, a
	inc	R3
	mov	a, R2
	mov	R0, a
	mov	@R0, topRight
	jmp	updateSourceAndTargetMem
setBottomLeft:
	mov	@R0, #04H
	mov	a, R0
	mov	R3, a
	inc	R3
	mov	a, R2
	mov	R0, a
	mov	@R0, bottomLeft
	jmp	updateSourceAndTargetMem
setBottomRight:
	mov	@R0, #08H
	mov	a, R0
	mov	R3, a
	inc	R3
	mov	a, R2
	mov	R0, a
	mov	@R0, bottomRight
	jmp	updateSourceAndTargetMem

include DisplayLevelSequence.asm
