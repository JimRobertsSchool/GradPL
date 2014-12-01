	.file	"double.c"
	.data
	.align 4
	.type	__jims_var, @object
	.size	__jims_var, 4
__jims_var:
	.long	4
	.globl	var
	.align 4
	.type	var, @object
	.size	var, 4
var:
	.long	4
	.section	.rodata
.LC0:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:

	pushl	%ebp


	movl	%esp, %ebp

	andl	$-16, %esp
	subl	$16, %esp
	movl	var, %eax
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	movl	$12, var
	movl	var, %eax
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	leave


	ret

.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
