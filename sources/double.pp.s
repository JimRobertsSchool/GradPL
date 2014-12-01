.file	"double.c"
.section	.rodata
.LC0:
.string	"%d\n"
.text
#eligible start
.globl	main
.type	main, @function
main:
.LFB2:
pushq	%rbp
movq	%rsp, %rbp
subq	$16, %rsp
movl	$1, -4(%rbp)
call __pp_0
call	printf
movl	$12, -4(%rbp)
call __pp_0
call	printf
leave
ret
.LFE2:
.size	main, .-main
.globl	h
.type	h, @function
h:
.LFB3:
pushq	%rbp
movq	%rsp, %rbp
movl	%edi, -4(%rbp)
addl	$2, -4(%rbp)
popq	%rbp
ret
.LFE3:
.size	h, .-h
#eligible end
#added start
__pp_0:
movl	-4(%rbp), %eax
movl	%eax, %esi
movl	$.LC0, %edi
movl	$0, %eax
ret
#added end
.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
.section	.note.GNU-stack,"",@progbits
