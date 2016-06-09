countdown equ 78h
temp equ 79h
temp2 equ 80h
showSequence:
	mov temp, R0
	mov R0, sequenceMem
	mov P0, @R0
	inc R0
	mov temp2, R0
	mov R0, temp		

mov countdown, #00100000b
countdown:
	dec countdown
	mov a, countdown
	jnz countdown
	ret
