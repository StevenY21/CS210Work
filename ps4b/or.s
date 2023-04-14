	.intel_syntax noprefix

	.section .data
	.section .text

	.global OR_FRAG

	# INPUTS: rax -> x
	#         rbx -> &y address of where in memory y is
	# OUTPUTS: x = x bitwise or y : update rax with bitwise or of the
	#                               8 byte quantity at the location of &y
	#          rbx should be updated to equal &y + 8
OR_FRAG:
	# updates rax to be the bitwise or of x and y
	or rax, QWORD PTR [rbx]
	# updates rbx to equal &y + 8
	add rbx, 8
	ret # returns to where it was called
