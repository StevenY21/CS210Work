	.intel_syntax noprefix

	.section .data
	.section .text

	.global AND_FRAG

	# INPUTS: rax -> x
	#         rbx -> &y address of where in memory y is
	# OUTPUTS: x = x bitwise and y : update rax with bit wise and of the
	#                                8 byte quantity at the location of &y
	#          rbx should be updated to equal &y + 8
AND_FRAG:
	# updates rax to be the bitwise and of x and y
	and rax, QWORD PTR [rbx]
	# updates rbx to equal &y + 8
	add rbx, 8
	ret # returns to where it was called
	
