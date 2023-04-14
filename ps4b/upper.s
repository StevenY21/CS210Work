	.intel_syntax noprefix

	.section .data
	.section .text

	.global UPPER_FRAG

UPPER_FRAG:
	mov cl, BYTE PTR [rbx + rdi * 1] # moves the current character into cl
	cmp cl, 0 # checks if cl is 0, if it is then end loop
	je loop_end
	# checks if cl is a lowercase letter
	# if it isn't, it will move on to loop_next
	# if it is, it will update the character to its UPPERCASE form
	cmp cl, 'a
	jb loop_next
	cmp cl, 'z
	ja loop_next
	sub BYTE PTR [rbx + rdi * 1], 0x20
loop_next:
	# increases rdi to record length of string and goes back to the loop
	inc rdi
	jmp UPPER_FRAG
	
loop_end:
	add rax, rdi # adds length of string to rax
	xor rdi, rdi # resets rdi so it doesn't interfere with processing other strings
	ret # returns back to where UPPER_FRAG was called
	
	
