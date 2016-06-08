; Super Mario says
; Program part to get the user input

userinput EQU 0x48 			;one byte for user inputs
remaininginputs EQU 0x31	

initializeUserInput:
	mov userinput, #40h     	;startadress for user inputs
	mov remaininginputs,#010b 	;TODO: use randomamount!!
	mov R1, P1			;saves combination of input bits in register
	mov R0, userinput    		;copy startadress to userinput


showinputrequestandwait:
	mov P0, #11111111b
	mov a, P1
	jz getuserinput
	jmp showinputrequestandwait

getuserinput:
	mov a, P1	
	jz getuserinput
	mov @R0, P1			;saves input bits to the adress in r0
	inc R0				;increments the value of user inputs
	dec remaininginputs
	mov a, remaininginputs
	jz endofinput
	jmp showinputrequestandwait
endofinput:
	end

include SequenceCheck.asm