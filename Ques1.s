
@ BSS section
.bss

.data
A_DIGIT: .word 0x43
H_DIGIT: .word 0

.text
.globl main

main:
	ldr r0, =A_DIGIT
	ldr r0, [R0]

	and r0, r0, #0x7F @setting MSB 0

	sub r0, #0x30

	cmp r0, #0x0A
	blt result
	add r0, # -0x41 + 0xa  + 0x30

result:
	ldr r1, =H_DIGIT @ load address of H_DIGIT
	strb r0, [r1]

END: 
	SWI 0x11
.end