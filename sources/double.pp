.file	"double.c"
.local __jims_var
.comm __jims_var,4,4
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
movl	$12, -4(%rbp)
call __pp_0
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
movl    4(%esp), __jims_var
addl    $4, %esp
movl	-4(%rbp), %eax
movl	%eax, %esi
movl	$.LC0, %edi
movl	$0, %eax
call	printf
subl    $4, %esp
movl    __jims_var, 4(%esp)
ret
#added end
.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
.section	.note.GNU-stack,"",@progbits