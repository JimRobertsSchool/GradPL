.file	"replicated.c"
.text
#eligible start
.globl	a
.type	a, @function
a:
.LFB0:
pushq	%rbp
movq	%rsp, %rbp
movl	%edi, -4(%rbp)
movl	%esi, -8(%rbp)
addl	$1, -4(%rbp)
movl	-8(%rbp), %eax
addl	%eax, -4(%rbp)
movl	-4(%rbp), %eax
movl	%eax, -8(%rbp)
movl	-8(%rbp), %eax
movl	-4(%rbp), %edx
addl	%edx, %eax
addl	$2, %eax
popq	%rbp
ret
.LFE0:
.size	a, .-a
.globl	b
.type	b, @function
b:
.LFB1:
pushq	%rbp
movq	%rsp, %rbp
movl	%edi, -4(%rbp)
movl	%esi, -8(%rbp)
addl	$1, -4(%rbp)
movl	-8(%rbp), %eax
addl	%eax, -4(%rbp)
movl	-4(%rbp), %eax
movl	%eax, -8(%rbp)
movl	-8(%rbp), %eax
movl	-4(%rbp), %edx
addl	%edx, %eax
addl	$2, %eax
popq	%rbp
ret
.LFE1:
.size	b, .-b
.section	.rodata
.LC0:
.string	"%d\n"
.text
.globl	main
.type	main, @function
main:
.LFB2:
pushq	%rbp
movq	%rsp, %rbp
movl	$3, %esi
movl	$1, %edi
call	a
movl	%eax, %esi
movl	$.LC0, %edi
movl	$0, %eax
call	printf
movl	$4, %esi
movl	$2, %edi
call	b
movl	%eax, %esi
movl	$.LC0, %edi
movl	$0, %eax
call	printf
movl	$0, %eax
popq	%rbp
ret
.LFE2:
.size	main, .-main
#eligible end
#added start
#added end
.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
.section	.note.GNU-stack,"",@progbits
