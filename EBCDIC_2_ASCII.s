@ ECE-372, HW-2 EC, Casimir Sowinski

.text
.global _start

_start:
	.equ NUM, 41
	LDR  R1, =MESSAGE 				@ Load pointer to MESSAGE array
	MOV  R2, #NUM 					@ Initialize loop counter
	LDR  R3, =CONVERTED				@ Load pointer to CONVERTED array
	LDR  R4, =LOOKUP				@ Load pointer to LOOKUP array
	
NEXT:
	LDRH R6, [R1] 					@ Load a MESSAGE HWORD into R6
	ADD  R1, R1, #2					@ Increment MESSAGE pointer to next
	
	@ Troll through MESSAGE array, take number use it as an offset (add it to base address of 
	@ lookup table), get that ascii character and store it in CONVERTED array		
		
	SUBS R2, #1 					@ Decrement counter
	BNE NEXT
	NOP
	
@NEXT: 
	@LDRH R6, [R1] 					@ Load a MULTIPLICAND Half word in R6
	@LDRH R7, [R2] 					@ Load a MULTIPLIER half Word in R7
	@MUL  R8, R6, R7 				@ Multiply
	@STR  R8, [R3] 					@ Store result in PRODUCTS array
	@ADD  R1, R1, #2 				@ Increment MULTIPLICANT pointer to next
	@ADD  R2, R2, #2 				@ Increment MULTIPLIER pointer to next
	@ADD  R3, R3, #4	 				@ Increment PRODUCTS pointer to next
	@SUBS R4, #1 					@ Decrement loop counter by 1
	@BNE  NEXT 						@ Go to NEXT if all elements not multiplied	
	@NOP 							@ Instruction for breakpoint. Does nothing.

.data
.align 4
MESSAGE: 	
	.HWORD 	0xC9, 0x5F, 0x94, 0x6D, 0xA2, 0x96, 0x99, 0x99, 0xA8, 0x6D, 0xC4
	.HWORD	0x81, 0xA5, 0x85, 0x6D, 0xC9, 0x5F, 0x94, 0x6D, 0x81, 0x86, 0x99
	.HWORD	0x81, 0x89, 0x84, 0x6D, 0xC9, 0x6D, 0x83, 0x81, 0x95, 0x5F, 0xA3
	.HWORD 	0x6D, 0x84, 0x96, 0x6D, 0xA3, 0x88, 0x81, 0xA3
CONVERTED:
	.HWORD 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.HWORD 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.HWORD 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.HWORD 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
LOOKUP:
	.ascii "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?" @ 000-015
	.ascii "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?" @ 016-031
	.ascii "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?" @ 032-047
	.ascii "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?" @ 048-063
	.ascii "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", ".", "<", "(", "+", "|" @ 064-079
	.ascii "&", "?", "?", "?", "?", "?", "?", "?", "?", "!", "$", "*", ")", ";", "?", "-" @ 080-095
	.ascii "/", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", ",", "%", "_", ">", "?" @ 096-111
	.ascii "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", ":", "#", "@", "'", "=", "?" @ 112-127
	.ascii "?", "a", "b", "c", "d", "e", "f", "g", "h", "i", "?", "?", "?", "?", "?", "?" @ 128-143
	.ascii "?", "j", "k", "l", "m", "n", "o", "p", "q", "r", "?", "?", "?", "?", "?", "?" @ 144-159
	.ascii "?", "?", "s", "t", "u", "v", "w", "x", "y", "z", "?", "?", "?", "[", "?", "?" @ 160-175
	.ascii "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "]", "?", "?" @ 176-191
	.ascii "{", "A", "B", "C", "D", "E", "F", "G", "H", "I", "?", "?", "?", "?", "?", "?" @ 192-207
	.ascii "}", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "?", "?", "?", "?", "?", "?" @ 208-223
	.ascii "?", "?", "S", "T", "U", "V", "W", "X", "Y", "Z", "?", "?", "?", "?", "?", "?" @ 224-239
	.ascii "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "?", "?", "?", "?", "?", "?" @ 240-255
	
	
	
	
	
	
	
	
	
.END

