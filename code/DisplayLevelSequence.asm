value equ 68h
countdown equ 78h


mov value, #70h
mov R1, value
showSequence:
	mov P0, @R1
	inc R1	

mov countdown, #00100000b
countdown:
	dec countdown
	mov a, countdown
	jz showsequence
	jmp countdown
