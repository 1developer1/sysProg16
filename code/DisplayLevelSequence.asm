org 0h
value equ 70h
ljmp go

org 0000bh
showSequence:
	mov R1, value
	mov P1, @R1
	inc value
	call showsequence
	reti
	
go:
	mov TMOD, #000000010b
	mov TL0,#155
	mov TL1, #155
	mov TCON, #00010000b
	mov ip, #0
	setb EA
	setb ET0

haupt:
sjmp haupt
