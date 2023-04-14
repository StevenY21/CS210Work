	.intel_syntax noprefix

	.section .data

	.global SUM_POSITIVE
	.global SUM_NEGATIVE
SUM_POSITIVE:		.quad 0 # set aside 8 bytes
SUM_NEGATIVE:		.quad 0 # set aside 8 bytes

	.section .text

	.global SUM_FRAG

	# INPUTS: rax -> x
	#         rbx -> &y address of where in memory y is
	# OUTPUTS: x = x + y : update rax by adding y
	#                      quantity at the location of &y
	#          if y is positive then add y into an 8 byte value
	#          stored at a location marked by a symbol
	#          named SUM_POSTIVE
	#          else add y into an 8 byte value stored at a
	#          location marked by a symbol named SUM_NEGATIVE
	#          final rbx should be updated to equal &y + 8
SUM_FRAG:
	# compares y stored at &y in rbx to 0
	cmp QWORD PTR [rbx], 0
	#if y < 0 then go to negative case
	jl is_neg
	# moves y to another register, then adds it to the value in the location marked by SUM_POSITIVE
	mov rcx, QWORD PTR [rbx]
	add QWORD PTR [SUM_POSITIVE], rcx
	# goes to condition end
	jmp done_cond
	# Negative Case
is_neg:
	# moves y to another register, then adds it to the value in the location marked by SUM_NEGATIVE
	mov rcx, QWORD PTR [rbx]
	add QWORD PTR [SUM_NEGATIVE], rcx
	#Conditional logic end
done_cond:
	# adds y at &y in rbx to rax
	add rax, QWORD PTR [rbx]
	# updates rbx to equal &y + 8
	add rbx, 8
	ret # return to where it was called
