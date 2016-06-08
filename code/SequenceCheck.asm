; Super Mario says
; Program part to check, if the given sequence matches the user input

storedsequence EQU 0x71;
inputsequence EQU 0x72;
tocompare EQU 0x73;
remaining EQU 0x74;

initializeSequenceCheck:
mov remaining, #06h
mov storedsequence, #60h     	;startadress according to Field Sequence Generator
mov  inputsequence, #40h  	;startadress for input sequence
mov R0, storedsequence    	;copy startadress of stored sequence to register 0
mov R1, inputsequence		;copy startadress of inputsequence to register 1

checkSequence:
mov a, @R0
mov tocompare, @R1
cjne a, tocompare, notcorrect
mov a, remaining
inc r0
inc r1
jnz checksequence

call CORRECT

notcorrect:
call INCORRECT


include DisplayCorrectOrIncorrect.asm


