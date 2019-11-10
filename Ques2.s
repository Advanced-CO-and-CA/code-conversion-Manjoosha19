@Input
.data

NUL   : .word 0 

string1: .asciz  "11010010"
len_string1: .word 8
ascii_num0: .word 0x31

@Output
ERROR: .word	0
NUMBER: .byte	0


@ TEXT section
      .text

.globl _main

main:

	ldr r0, =string1
	mov r1, #8
	ldr r6, =ERROR
	
	
loop1:
	sub r1, #1
	cmp r1, #0
	beq exit
	ldrb r3, [r0], #1
	and r3, r3, #0x7F
	
	sub r3, #0x30
	cmp r3, #1
	bgt error
	orr r5, r3, lsl r1 @r5<- r3 << [r1] 
	
	B loop1

error:
	mov r1, #0xFF
	strb r1, [r6]
	B end

exit:
	ldr r1, =NUMBER
	strb r5, [r1]

end:
	SWI 0x11
.end
	
	
	


	