        .intel_syntax noprefix
	.section .data
x:	.quad 0x0 # holds 8 bytes used for writing rax to stdout and holding onto other values
	
	.section .text
	.global _start
_start:
	xor rax, rax # initializes rax to 0
	xor rcx, rcx # initializes rcx to 0
	xor rdi, rdi # initializes rdi to 0
	mov QWORD PTR [SUM_POSITIVE], rax # sets SUM_POSITIVE to 0
	mov QWORD PTR [SUM_NEGATIVE], rax # sets SUM_NEGATIVE to 0
	mov  rbx, OFFSET [CALC_DATA_BEGIN] # finds the address value of CALC_DATA_BEGIN
	jmp loop_start # begins the loop

loop_start:
	mov cl, BYTE PTR [rbx] # moves the first byte into al, within rax
	cmp cl, 0 # checks if the first byte of the command is 0
	je loop_end # if it is 0, we go to end
	cmp cl, 124 # checks if it is or command
	je is_or # jumps to a place to call OR_FRAG
	cmp cl, 38 # checks if it is and command
	je is_and # jumps to a place to call AND_FRAG
	cmp cl, 83 # checks if it is sum command
	je is_sum  # jumps to a place to call SUM_FRAG
	cmp cl, 85 # checks if it is the upper command
	je is_upper # jumps to a place to run the upper command
is_and:
	add rbx,8 # updates rbx to point to command argument
	call AND_FRAG # call AND_FRAG to get bitwise and of rax and the value stored at rbx 
	jmp loop_start # jumps to loop_start, beginning loop again
is_or:
	add rbx,8
	call OR_FRAG # call OR_FRAG to get bitwise and of rax and the value stored at rbx
	jmp loop_start
is_sum:	
	add rbx,8
	call SUM_FRAG # call SUM_FRAG to get bitwise and of rax and the value stored at rbx
	jmp loop_start
is_upper:
	mov QWORD PTR [x], rbx # moves current address to x
	add rbx, 8
	mov rbx, QWORD PTR [rbx] # finds the address stored at the command argument
	call UPPER_FRAG # call UPPER_FRAG to make the string UPPERCASE
	mov rbx, QWORD PTR [x] # moves the current address back to rbx
	add rbx, 16 # updates rbx to the next command
	jmp loop_start
	
loop_end: # if zero command found, program will exit normally
	# writes value of rax into standard out
	mov QWORD PTR [x], rax
	mov rax, 1 # sets system call to write
	mov rdi, 1 # sets file descriptor to standard out
	mov rsi, OFFSET x # movs memory address of where our data is to rsi
	mov rdx, 8 # for number of bytes needed for write
	syscall

	# writes value of SUM_POSITIVE to standard out
	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET SUM_POSITIVE
	mov rdx, 8
	syscall

	# writes value of SUM_NEGATIVE to standard out
	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET SUM_NEGATIVE
	mov rdx, 8
	syscall

	# writes the memory between CALC_DATA_BEGIN and CALC_DATA_END
	xor r8, r8 # initialize two registers to hold CALC_DATA_BEGIN CALC_DATA_END
	xor r9, r9
	mov r8, OFFSET CALC_DATA_BEGIN
	mov r9, OFFSET CALC_DATA_END
	sub r9, r8 # calculates the amount of bytes between CALC_DATA_BEGIN and CALC_DATA_END
	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET CALC_DATA_BEGIN
	mov rdx, r9
	syscall

	# exits program
	mov rax, 60 
	mov rdi, 0
	syscall
	
