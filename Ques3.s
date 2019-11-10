@ BSS section
      .bss

@ DATA SECTION
  
@Input
	.data
	.align
	
	INPUT:  .word 0x92529679
	
@Output
	OUTPUT : .byte 0

@ TEXT section
      .text

.global _main

main:
	
	mov r1, #8
	mov r2, #0xF
	mov r3, #10  @BDC
	
	ldr r0, =INPUT
	ldr r0, [r0]
	
loop1:
	subs r1, #1
	bmi exit
	
	lsl r5, r1, #2
	lsl r6, r2, r5
	and r4, r0, r6
	lsr r4, r5
	
	mov r7, r1

mul:
	subs r7, #1
	bmi	exit_mul
	
	mul r4, r4, r3
	B mul

exit_mul:
	add r8, r4
	B loop1
	
exit:
	ldr r1, =OUTPUT
	str r8, [r1]

END:
	SWI 0x11

.end
	
	
