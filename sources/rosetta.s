	.file	"rosetta.c"
	.section	.rodata
.LC0:
	.string	"%d "
	.text
	.globl	pretty
	.type	pretty, @function
pretty:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -16(%ebp)
	jmp	.L2
.L5:
	movl	$0, -12(%ebp)
	jmp	.L3
.L4:
	movl	-16(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	addl	$1, -12(%ebp)
.L3:
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L4
	movl	$10, (%esp)
	call	putchar
	addl	$1, -16(%ebp)
.L2:
	movl	-16(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L5
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	pretty, .-pretty
	.globl	chomp
	.type	chomp, @function
chomp:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	jmp	.L7
.L10:
	movl	-4(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$10, %al
	jne	.L8
	jmp	.L6
.L8:
	addl	$1, -4(%ebp)
.L7:
	cmpl	$79, -4(%ebp)
	jle	.L10
.L6:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	chomp, .-chomp
	.globl	printArr
	.type	printArr, @function
printArr:
.LFB4:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	.L12
.L13:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	addl	$1, -12(%ebp)
.L12:
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L13
	movl	$10, (%esp)
	call	putchar
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	printArr, .-printArr
	.globl	myStrCmp
	.type	myStrCmp, @function
myStrCmp:
.LFB5:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	movl	$0, -4(%ebp)
	jmp	.L15
.L20:
	movl	-4(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movb	%al, -6(%ebp)
	movl	-4(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movb	%al, -5(%ebp)
	movzbl	-6(%ebp), %eax
	cmpb	-5(%ebp), %al
	jne	.L16
	cmpb	$0, -6(%ebp)
	jne	.L17
	movl	$0, %eax
	jmp	.L18
.L17:
	addl	$1, -4(%ebp)
	jmp	.L15
.L16:
	movzbl	-6(%ebp), %eax
	cmpb	-5(%ebp), %al
	jge	.L19
	movl	$-1, %eax
	jmp	.L18
.L19:
	movl	$1, %eax
	jmp	.L18
.L15:
	cmpl	$79, -4(%ebp)
	jle	.L20
	movl	$0, %eax
.L18:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	myStrCmp, .-myStrCmp
	.globl	removeFront
	.type	removeFront, @function
removeFront:
.LFB6:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
	movl	$1, -8(%ebp)
	jmp	.L22
.L23:
	movl	-8(%ebp), %eax
	addl	$1073741823, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	-8(%ebp), %eax
	leal	0(,%eax,4), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movl	(%eax), %eax
	movl	%eax, (%edx)
	addl	$1, -8(%ebp)
.L22:
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	-8(%ebp), %eax
	jg	.L23
	movl	-8(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	$-1, (%eax)
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	leal	-1(%eax), %edx
	movl	12(%ebp), %eax
	movl	%edx, (%eax)
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	removeFront, .-removeFront
	.globl	removeBack
	.type	removeBack, @function
removeBack:
.LFB7:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	subl	$1, 12(%ebp)
	movl	12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
	movl	12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	$-1, (%eax)
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	removeBack, .-removeBack
	.globl	addFront
	.type	addFront, @function
addFront:
.LFB8:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	12(%ebp), %eax
	movl	%eax, -4(%ebp)
	jmp	.L28
.L29:
	movl	-4(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	-4(%ebp), %eax
	addl	$1073741823, %eax
	leal	0(,%eax,4), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movl	(%eax), %eax
	movl	%eax, (%edx)
	subl	$1, -4(%ebp)
.L28:
	cmpl	$0, -4(%ebp)
	jg	.L29
	movl	8(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%edx, (%eax)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE8:
	.size	addFront, .-addFront
	.globl	addBack
	.type	addBack, @function
addBack:
.LFB9:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	16(%ebp), %eax
	movl	%eax, (%edx)
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE9:
	.size	addBack, .-addBack
	.globl	sumRow
	.type	sumRow, @function
sumRow:
.LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -8(%ebp)
	movl	$0, -4(%ebp)
	jmp	.L32
.L33:
	movl	16(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	-4(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	addl	%eax, -8(%ebp)
	addl	$1, -4(%ebp)
.L32:
	movl	-4(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L33
	movl	-8(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE10:
	.size	sumRow, .-sumRow
	.globl	reverseComparison
	.type	reverseComparison, @function
reverseComparison:
.LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE11:
	.size	reverseComparison, .-reverseComparison
	.globl	forwardComparison
	.type	forwardComparison, @function
forwardComparison:
.LFB12:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE12:
	.size	forwardComparison, .-forwardComparison
	.globl	intCompR
	.type	intCompR, @function
intCompR:
.LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -8(%ebp)
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
	movl	-8(%ebp), %eax
	cmpl	-4(%ebp), %eax
	setl	%al
	movzbl	%al, %edx
	movl	-8(%ebp), %eax
	cmpl	-4(%ebp), %eax
	setg	%al
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE13:
	.size	intCompR, .-intCompR
	.section	.rodata
.LC1:
	.string	"%s"
.LC2:
	.string	"Done printing"
	.text
	.globl	printEach
	.type	printEach, @function
printEach:
.LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
.L44:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$.LC1, (%esp)
	call	printf
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	.L42
	jmp	.L46
.L42:
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -12(%ebp)
	jmp	.L44
.L46:
	movl	$.LC2, (%esp)
	call	puts
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE14:
	.size	printEach, .-printEach
	.globl	indexOf
	.type	indexOf, @function
indexOf:
.LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	cmpl	$0, 8(%ebp)
	jne	.L48
	movl	$-1, %eax
	jmp	.L49
.L48:
	movl	$0, -8(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
.L53:
	movl	-4(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	myStrCmp
	testl	%eax, %eax
	jne	.L50
	movl	-8(%ebp), %eax
	jmp	.L49
.L50:
	movl	-4(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	.L51
	nop
	movl	$-1, %eax
	jmp	.L49
.L51:
	movl	-4(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -4(%ebp)
	addl	$1, -8(%ebp)
	jmp	.L53
.L49:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE15:
	.size	indexOf, .-indexOf
	.globl	indexOfArr
	.type	indexOfArr, @function
indexOfArr:
.LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$0, -4(%ebp)
	movl	$0, -4(%ebp)
	jmp	.L55
.L58:
	movl	-4(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	myStrCmp
	testl	%eax, %eax
	jne	.L56
	movl	-4(%ebp), %eax
	jmp	.L57
.L56:
	addl	$1, -4(%ebp)
.L55:
	movl	-4(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L58
	movl	$-1, %eax
.L57:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE16:
	.size	indexOfArr, .-indexOfArr
	.section	.rodata
.LC3:
	.string	"cycle"
	.text
	.globl	main
	.type	main, @function
main:
.LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	andl	$-16, %esp
	subl	$192, %esp
	.cfi_offset 3, -12
	movl	%gs:20, %eax
	movl	%eax, 188(%esp)
	xorl	%eax, %eax
	movl	$0, 24(%esp)
	movl	$0, 28(%esp)
	movl	$0, 32(%esp)
	movl	$0, 36(%esp)
.L63:
	movl	stdin, %eax
	movl	%eax, 8(%esp)
	movl	$80, 4(%esp)
	leal	108(%esp), %eax
	movl	%eax, (%esp)
	call	fgets
	movl	stdin, %eax
	movl	%eax, (%esp)
	call	feof
	testl	%eax, %eax
	je	.L60
	movl	36(%esp), %eax
	sall	$2, %eax
	movl	%eax, (%esp)
	call	malloc
	movl	%eax, 64(%esp)
	movl	$0, 40(%esp)
	jmp	.L61
.L60:
	movl	$8, (%esp)
	call	malloc
	movl	%eax, 100(%esp)
	leal	108(%esp), %eax
	movl	%eax, (%esp)
	call	strdup
	movl	%eax, %edx
	movl	100(%esp), %eax
	movl	%edx, (%eax)
	movl	100(%esp), %eax
	movl	24(%esp), %edx
	movl	%edx, 4(%eax)
	movl	100(%esp), %eax
	movl	%eax, 24(%esp)
	addl	$1, 32(%esp)
	movl	100(%esp), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	indexOf
	cmpl	$-1, %eax
	jne	.L62
	movl	$8, (%esp)
	call	malloc
	movl	%eax, 104(%esp)
	leal	108(%esp), %eax
	movl	%eax, (%esp)
	call	strdup
	movl	%eax, %edx
	movl	104(%esp), %eax
	movl	%edx, (%eax)
	movl	104(%esp), %eax
	movl	28(%esp), %edx
	movl	%edx, 4(%eax)
	movl	104(%esp), %eax
	movl	%eax, 28(%esp)
	addl	$1, 36(%esp)
	jmp	.L63
.L62:
	jmp	.L63
.L64:
	movl	40(%esp), %eax
	leal	0(,%eax,4), %edx
	movl	64(%esp), %eax
	leal	(%edx,%eax), %ebx
	movl	36(%esp), %eax
	sall	$2, %eax
	movl	%eax, (%esp)
	call	malloc
	movl	%eax, (%ebx)
	addl	$1, 40(%esp)
.L61:
	movl	40(%esp), %eax
	cmpl	36(%esp), %eax
	jl	.L64
	movl	36(%esp), %eax
	sall	$2, %eax
	movl	%eax, (%esp)
	call	malloc
	movl	%eax, 68(%esp)
	movl	$0, 44(%esp)
	jmp	.L65
.L68:
	movl	$0, 48(%esp)
	jmp	.L66
.L67:
	movl	44(%esp), %eax
	leal	0(,%eax,4), %edx
	movl	64(%esp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	48(%esp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	$0, (%eax)
	addl	$1, 48(%esp)
.L66:
	movl	48(%esp), %eax
	cmpl	36(%esp), %eax
	jl	.L67
	addl	$1, 44(%esp)
.L65:
	movl	44(%esp), %eax
	cmpl	36(%esp), %eax
	jl	.L68
	movl	$0, 52(%esp)
	movl	32(%esp), %eax
	sall	$2, %eax
	movl	%eax, (%esp)
	call	malloc
	movl	%eax, 72(%esp)
	jmp	.L69
.L70:
	movl	52(%esp), %eax
	leal	0(,%eax,4), %edx
	movl	72(%esp), %eax
	addl	%eax, %edx
	movl	24(%esp), %eax
	movl	(%eax), %eax
	movl	%eax, (%edx)
	addl	$1, 52(%esp)
	movl	24(%esp), %eax
	movl	4(%eax), %eax
	movl	%eax, 24(%esp)
.L69:
	cmpl	$0, 24(%esp)
	jne	.L70
	movl	$0, 52(%esp)
	movl	28(%esp), %eax
	movl	%eax, 76(%esp)
	jmp	.L71
.L72:
	movl	52(%esp), %eax
	leal	0(,%eax,4), %edx
	movl	68(%esp), %eax
	addl	%eax, %edx
	movl	28(%esp), %eax
	movl	(%eax), %eax
	movl	%eax, (%edx)
	addl	$1, 52(%esp)
	movl	28(%esp), %eax
	movl	4(%eax), %eax
	movl	%eax, 28(%esp)
.L71:
	cmpl	$0, 28(%esp)
	jne	.L72
	movl	76(%esp), %eax
	movl	%eax, 28(%esp)
	movl	36(%esp), %eax
	movl	$forwardComparison, 12(%esp)
	movl	$4, 8(%esp)
	movl	%eax, 4(%esp)
	movl	68(%esp), %eax
	movl	%eax, (%esp)
	call	qsort
	movl	$0, 52(%esp)
	movl	$0, 52(%esp)
	jmp	.L73
.L74:
	movl	52(%esp), %eax
	leal	0(,%eax,4), %edx
	movl	72(%esp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 80(%esp)
	movl	52(%esp), %eax
	addl	$1, %eax
	leal	0(,%eax,4), %edx
	movl	72(%esp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 84(%esp)
	movl	84(%esp), %eax
	movl	%eax, 8(%esp)
	movl	36(%esp), %eax
	movl	%eax, 4(%esp)
	movl	68(%esp), %eax
	movl	%eax, (%esp)
	call	indexOfArr
	leal	0(,%eax,4), %edx
	movl	64(%esp), %eax
	addl	%edx, %eax
	movl	(%eax), %ebx
	movl	80(%esp), %eax
	movl	%eax, 8(%esp)
	movl	36(%esp), %eax
	movl	%eax, 4(%esp)
	movl	68(%esp), %eax
	movl	%eax, (%esp)
	call	indexOfArr
	sall	$2, %eax
	addl	%ebx, %eax
	movl	$1, (%eax)
	addl	$2, 52(%esp)
.L73:
	movl	52(%esp), %eax
	cmpl	32(%esp), %eax
	jl	.L74
	movl	36(%esp), %eax
	sall	$2, %eax
	movl	%eax, (%esp)
	call	malloc
	movl	%eax, 88(%esp)
	movl	$0, 56(%esp)
	movl	36(%esp), %eax
	sall	$2, %eax
	movl	%eax, (%esp)
	call	malloc
	movl	%eax, 92(%esp)
	movl	$0, 60(%esp)
	movl	$0, 52(%esp)
	jmp	.L75
.L77:
	movl	52(%esp), %eax
	movl	%eax, 8(%esp)
	movl	36(%esp), %eax
	movl	%eax, 4(%esp)
	movl	64(%esp), %eax
	movl	%eax, (%esp)
	call	sumRow
	testl	%eax, %eax
	jne	.L76
	movl	52(%esp), %eax
	movl	%eax, 8(%esp)
	movl	56(%esp), %eax
	movl	%eax, 4(%esp)
	movl	88(%esp), %eax
	movl	%eax, (%esp)
	call	addFront
	addl	$1, 56(%esp)
.L76:
	addl	$1, 52(%esp)
.L75:
	movl	52(%esp), %eax
	cmpl	36(%esp), %eax
	jl	.L77
	jmp	.L78
.L82:
	movl	56(%esp), %eax
	movl	%eax, 4(%esp)
	movl	88(%esp), %eax
	movl	%eax, (%esp)
	call	removeBack
	movl	%eax, 96(%esp)
	subl	$1, 56(%esp)
	movl	96(%esp), %eax
	movl	%eax, 8(%esp)
	movl	60(%esp), %eax
	movl	%eax, 4(%esp)
	movl	92(%esp), %eax
	movl	%eax, (%esp)
	call	addBack
	addl	$1, 60(%esp)
	movl	$0, 52(%esp)
	jmp	.L79
.L81:
	movl	52(%esp), %eax
	leal	0(,%eax,4), %edx
	movl	64(%esp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	96(%esp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	.L80
	movl	52(%esp), %eax
	leal	0(,%eax,4), %edx
	movl	64(%esp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	96(%esp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	$0, (%eax)
	movl	52(%esp), %eax
	movl	%eax, 8(%esp)
	movl	36(%esp), %eax
	movl	%eax, 4(%esp)
	movl	64(%esp), %eax
	movl	%eax, (%esp)
	call	sumRow
	testl	%eax, %eax
	jne	.L80
	movl	52(%esp), %eax
	movl	%eax, 8(%esp)
	movl	56(%esp), %eax
	movl	%eax, 4(%esp)
	movl	88(%esp), %eax
	movl	%eax, (%esp)
	call	addBack
	addl	$1, 56(%esp)
	movl	56(%esp), %eax
	addl	$1, %eax
	movl	$intCompR, 12(%esp)
	movl	$4, 8(%esp)
	movl	%eax, 4(%esp)
	movl	88(%esp), %eax
	movl	%eax, (%esp)
	call	qsort
.L80:
	addl	$1, 52(%esp)
.L79:
	movl	52(%esp), %eax
	cmpl	36(%esp), %eax
	jl	.L81
.L78:
	cmpl	$0, 56(%esp)
	jg	.L82
	movl	60(%esp), %eax
	cmpl	36(%esp), %eax
	jne	.L83
	movl	$0, 52(%esp)
	jmp	.L84
.L85:
	movl	52(%esp), %eax
	leal	0(,%eax,4), %edx
	movl	92(%esp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	leal	0(,%eax,4), %edx
	movl	68(%esp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$.LC1, (%esp)
	call	printf
	addl	$1, 52(%esp)
.L84:
	movl	52(%esp), %eax
	cmpl	36(%esp), %eax
	jl	.L85
	jmp	.L86
.L83:
	movl	$.LC3, (%esp)
	call	puts
.L86:
	movl	$0, %eax
	movl	188(%esp), %ecx
	xorl	%gs:20, %ecx
	je	.L88
	call	__stack_chk_fail
.L88:
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE17:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
