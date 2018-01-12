	.file	"SobelEdge_large.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.globl	_wrap_
	.type	_wrap_, @function
_wrap_:
.LFB66:
	.cfi_startproc
	movl	%edi, %eax
	sarl	$31, %eax
	xorl	%edi, %eax
	cmpl	%esi, %edi
	jge	.L6
.L2:
.L3:
	rep ret
	.p2align 4,,10
	.p2align 3
.L6:
	notl	%edi
	leal	(%rdi,%rsi,2), %eax
	ret
	.cfi_endproc
.LFE66:
	.size	_wrap_, .-_wrap_
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.text.unlikely
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.globl	_convolution_
	.type	_convolution_, @function
_convolution_:
.LFB67:
	.cfi_startproc
	leal	-1(%r9), %eax
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	%edx, %ebp
	cltd
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	48(%rsp), %r14d
	idivl	%ecx
	movq	56(%rsp), %r12
	movl	72(%rsp), %r13d
	movl	%edx, %eax
	movl	%edx, %ebx
	sarl	$31, %eax
	xorl	%eax, %ebx
	subl	%eax, %ebx
	movl	%r9d, %eax
	cltd
	idivl	%ecx
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	movl	%edx, %r11d
	subl	%eax, %r11d
	leal	1(%r9), %eax
	cltd
	idivl	%ecx
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	movl	%edx, %r9d
	subl	%eax, %r9d
	leal	-1(%r14), %eax
	cltd
	idivl	%r8d
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	movl	%edx, %esi
	subl	%eax, %esi
	imull	%ecx, %esi
	leal	(%r11,%rsi), %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	imull	8(%r12), %eax
	movl	%eax, %edx
	leal	(%rbx,%rsi), %eax
	addl	%r9d, %esi
	movslq	%esi, %rsi
	cltq
	movzbl	(%rdi,%rsi), %esi
	movzbl	(%rdi,%rax), %eax
	imull	(%r12), %eax
	imull	16(%r12), %esi
	addl	%edx, %eax
	addl	%eax, %esi
	movl	%r14d, %eax
	cltd
	idivl	%r8d
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	movl	%edx, %r10d
	subl	%eax, %r10d
	imull	%ecx, %r10d
	leal	(%r10,%rbx), %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	imull	24(%r12), %eax
	leal	(%rax,%rsi), %edx
	leal	(%r10,%r11), %eax
	addl	%r9d, %r10d
	movslq	%r10d, %r10
	cltq
	movzbl	(%rdi,%rax), %esi
	imull	32(%r12), %esi
	leal	(%rsi,%rdx), %eax
	movzbl	(%rdi,%r10), %esi
	imull	40(%r12), %esi
	addl	%eax, %esi
	leal	1(%r14), %eax
	cltd
	idivl	%r8d
	movl	%edx, %r8d
	movl	%edx, %eax
	sarl	$31, %r8d
	xorl	%r8d, %eax
	subl	%r8d, %eax
	imull	%eax, %ecx
	addl	%ecx, %ebx
	addl	%ecx, %r11d
	addl	%ecx, %r9d
	movslq	%ebx, %rbx
	movslq	%r11d, %r11
	movslq	%r9d, %r9
	movzbl	(%rdi,%rbx), %r8d
	movzbl	(%rdi,%r9), %ebx
	imull	48(%r12), %r8d
	imull	64(%r12), %ebx
	addl	%esi, %r8d
	movzbl	(%rdi,%r11), %esi
	imull	56(%r12), %esi
	addl	%r8d, %esi
	addl	%esi, %ebx
	testb	%bpl, %bpl
	jne	.L11
.L8:
	testb	%r13b, %r13b
	je	.L9
	movq	%r12, %rdi
	call	free
.L9:
	movl	%ebx, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L11:
	.cfi_restore_state
	call	free
	jmp	.L8
	.cfi_endproc
.LFE67:
	.size	_convolution_, .-_convolution_
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.section	.text.unlikely
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4,,15
	.globl	_sobelEdgeDetection_
	.type	_sobelEdgeDetection_, @function
_sobelEdgeDetection_:
.LFB68:
	.cfi_startproc
	movl	%ecx, %eax
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	imull	%r8d, %eax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %r13
	movl	$32, %edi
	movl	%ecx, %ebx
	movl	%r8d, %ebp
	cltq
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%rax, %rsi
	movl	%edx, 52(%rsp)
	movl	%ecx, 12(%rsp)
	movq	%r9, 56(%rsp)
	movq	%rax, 40(%rsp)
	call	create1DArray_BYTE
	xorl	%edi, %edi
	movl	$9, %esi
	movq	%rax, 24(%rsp)
	call	create1DArray_int64_t
	xorl	%edi, %edi
	movq	$-1, (%rax)
	movq	$0, 8(%rax)
	movq	$1, 16(%rax)
	movq	$-2, 24(%rax)
	movl	$9, %esi
	movq	$0, 32(%rax)
	movq	$2, 40(%rax)
	movq	%rax, %r12
	movq	$-1, 48(%rax)
	movq	$0, 56(%rax)
	movq	$1, 64(%rax)
	call	create1DArray_int64_t
	testl	%ebx, %ebx
	movq	%rax, %r14
	movq	$1, (%rax)
	movq	$2, 8(%rax)
	movq	$1, 16(%rax)
	movq	$0, 24(%rax)
	movq	$0, 32(%rax)
	movq	$0, 40(%rax)
	movq	$-1, 48(%rax)
	movq	$-2, 56(%rax)
	movq	$-1, 64(%rax)
	movl	$1, 36(%rsp)
	movl	$0, 32(%rsp)
	jle	.L20
	movl	%ebp, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L22:
	movl	16(%rsp), %eax
	testl	%eax, %eax
	jle	.L16
	movl	32(%rsp), %ecx
	movl	12(%rsp), %edi
	xorl	%ebp, %ebp
	movl	36(%rsp), %esi
	movl	%ecx, %eax
	movl	%ecx, 20(%rsp)
	subl	$1, %eax
	movl	%esi, 48(%rsp)
	cltd
	idivl	%edi
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	subl	%eax, %edx
	movl	%ecx, %eax
	movl	%edx, (%rsp)
	cltd
	idivl	%edi
	movl	%esi, %eax
	movl	%edx, 4(%rsp)
	cltd
	idivl	%edi
	movl	%edx, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L17:
	movl	16(%rsp), %ebx
	leal	-1(%rbp), %eax
	movl	12(%rsp), %r15d
	movl	(%rsp), %edi
	movl	(%r12), %ecx
	cltd
	movl	16(%r12), %r11d
	movl	4(%rsp), %esi
	idivl	%ebx
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	subl	%eax, %edx
	movl	%edi, %eax
	imull	%r15d, %edx
	addl	%edx, %eax
	cltq
	movzbl	0(%r13,%rax), %r10d
	movl	4(%rsp), %eax
	addl	%edx, %eax
	addl	8(%rsp), %edx
	cltq
	movzbl	0(%r13,%rax), %r9d
	movl	8(%r12), %eax
	imull	%r10d, %ecx
	movslq	%edx, %rdx
	movzbl	0(%r13,%rdx), %r8d
	imull	%r9d, %eax
	addl	%eax, %ecx
	movl	%ebp, %eax
	addl	$1, %ebp
	cltd
	idivl	%ebx
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	subl	%eax, %edx
	movl	%edi, %eax
	imull	%r15d, %edx
	imull	%r8d, %r11d
	addl	%edx, %eax
	cltq
	addl	%r11d, %ecx
	movl	24(%r12), %r11d
	movzbl	0(%r13,%rax), %edi
	leal	(%rsi,%rdx), %eax
	addl	8(%rsp), %edx
	cltq
	movzbl	0(%r13,%rax), %esi
	imull	%edi, %r11d
	movslq	%edx, %rdx
	addl	%r11d, %ecx
	movl	32(%r12), %r11d
	imull	%esi, %r11d
	movl	%r11d, %eax
	movl	40(%r12), %r11d
	addl	%ecx, %eax
	movzbl	0(%r13,%rdx), %ecx
	imull	%ecx, %r11d
	addl	%eax, %r11d
	movl	%ebp, %eax
	cltd
	idivl	%ebx
	movl	(%rsp), %eax
	movl	%edx, %ebx
	sarl	$31, %ebx
	xorl	%ebx, %edx
	subl	%ebx, %edx
	movl	48(%r12), %ebx
	imull	%r15d, %edx
	movl	56(%r12), %r15d
	imull	(%r14), %r10d
	imull	8(%r14), %r9d
	addl	%edx, %eax
	cltq
	movzbl	0(%r13,%rax), %eax
	imull	16(%r14), %r8d
	imull	24(%r14), %edi
	addl	%r9d, %r10d
	imull	%eax, %ebx
	addl	%r8d, %r10d
	addl	%edi, %r10d
	addl	%ebx, %r11d
	movl	4(%rsp), %ebx
	addl	%edx, %ebx
	addl	8(%rsp), %edx
	movslq	%ebx, %rbx
	movzbl	0(%r13,%rbx), %ebx
	movslq	%edx, %rdx
	imull	%ebx, %r15d
	addl	%r15d, %r11d
	movzbl	0(%r13,%rdx), %r15d
	movl	64(%r12), %edx
	imull	32(%r14), %esi
	imull	40(%r14), %ecx
	imull	48(%r14), %eax
	imull	56(%r14), %ebx
	addl	%esi, %r10d
	imull	%r15d, %edx
	addl	%ecx, %r10d
	imull	64(%r14), %r15d
	addl	%eax, %r10d
	addl	%ebx, %r10d
	addl	%r11d, %edx
	imull	%edx, %edx
	addl	%r10d, %r15d
	imull	%r15d, %r15d
	addl	%r15d, %edx
	cmpl	$640000, %edx
	jle	.L19
	movslq	20(%rsp), %rax
	movq	24(%rsp), %rdi
	movb	$98, (%rdi,%rax)
.L19:
	movl	12(%rsp), %edi
	addl	%edi, 20(%rsp)
	cmpl	%ebp, 16(%rsp)
	jne	.L17
.L18:
	addl	$1, 32(%rsp)
	addl	$1, 36(%rsp)
	movl	48(%rsp), %edi
	cmpl	%edi, 12(%rsp)
	jg	.L22
.L20:
	cmpb	$0, 52(%rsp)
	jne	.L27
.L15:
	movq	%r12, %rdi
	call	free
	movq	%r14, %rdi
	call	free
	movq	56(%rsp), %rax
	movq	40(%rsp), %rdi
	movq	%rdi, (%rax)
	movq	24(%rsp), %rax
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L16:
	.cfi_restore_state
	movl	36(%rsp), %eax
	movl	%eax, 48(%rsp)
	jmp	.L18
.L27:
	movq	%r13, %rdi
	call	free
	jmp	.L15
	.cfi_endproc
.LFE68:
	.size	_sobelEdgeDetection_, .-_sobelEdgeDetection_
	.section	.text.unlikely
.LCOLDE2:
	.text
.LHOTE2:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"%d"
.LC4:
	.string	"%d\n"
	.section	.text.unlikely
.LCOLDB5:
	.text
.LHOTB5:
	.p2align 4,,15
	.globl	_print_pbm_
	.type	_print_pbm_, @function
_print_pbm_:
.LFB69:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	xorl	%edi, %edi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%esi, %r14d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	$2, %esi
	movl	%edx, %ebx
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%rcx, 8(%rsp)
	movl	%r9d, 44(%rsp)
	movl	%edx, 40(%rsp)
	call	create1DArray_int64_t
	movl	$2, %esi
	movq	%rax, %rdi
	movq	$80, (%rax)
	movq	$49, 8(%rax)
	movq	%rax, 24(%rsp)
	call	println_s
	movl	%r14d, %edx
	movl	$.LC3, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	xorl	%edi, %edi
	movl	$1, %esi
	call	create1DArray_int64_t
	movl	$1, %esi
	movq	%rax, %rdi
	movq	$32, (%rax)
	movq	%rax, 32(%rsp)
	call	printf_s
	xorl	%eax, %eax
	movl	%ebx, %edx
	movl	$.LC4, %esi
	movl	$1, %edi
	call	__printf_chk
	testl	%ebx, %ebx
	jle	.L29
	leal	-1(%r14), %eax
	xorl	%r13d, %r13d
	movb	$0, 7(%rsp)
	xorl	%r12d, %r12d
	addq	$1, %rax
	movq	%rax, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L37:
	testl	%r14d, %r14d
	jle	.L35
	movq	8(%rsp), %rax
	movslq	%r13d, %rbx
	leaq	(%rax,%rbx), %r15
	addq	16(%rsp), %rbx
	addq	%rax, %rbx
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L33:
.L34:
	xorl	%eax, %eax
	movl	$1, %edx
	movl	$.LC3, %esi
	movl	$1, %edi
	addq	$1, %r15
	call	__printf_chk
	cmpq	%rbx, %r15
	je	.L35
.L36:
	cmpb	$32, (%r15)
	jne	.L33
	xorl	%edx, %edx
	xorl	%eax, %eax
	movl	$.LC3, %esi
	movl	$1, %edi
	addq	$1, %r15
	call	__printf_chk
	cmpq	%rbx, %r15
	jne	.L36
.L35:
	cmpb	$0, 7(%rsp)
	jne	.L50
.L32:
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	create1DArray_int64_t
	testq	%rax, %rax
	movq	%rax, %rdi
	movq	%rax, %rbp
	setne	7(%rsp)
	xorl	%esi, %esi
	addl	$1, %r12d
	call	println_s
	addl	%r14d, %r13d
	cmpl	%r12d, 40(%rsp)
	jne	.L37
.L38:
	cmpb	$0, 44(%rsp)
	jne	.L41
.L39:
	movq	24(%rsp), %rdi
	call	free
	movq	32(%rsp), %rdi
	call	free
	cmpb	$0, 7(%rsp)
	movq	%rbp, %rdi
	jne	.L47
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L50:
	.cfi_restore_state
	movq	%rbp, %rdi
	call	free
	jmp	.L32
.L29:
	cmpb	$0, 44(%rsp)
	jne	.L51
	movq	24(%rsp), %rdi
	call	free
	movq	32(%rsp), %rdi
.L47:
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	free
.L51:
	.cfi_restore_state
	movb	$0, 7(%rsp)
.L41:
	movq	8(%rsp), %rdi
	call	free
	jmp	.L39
	.cfi_endproc
.LFE69:
	.size	_print_pbm_, .-_print_pbm_
	.section	.text.unlikely
.LCOLDE5:
	.text
.LHOTE5:
	.section	.rodata.str1.1
.LC11:
	.string	"%u\n"
	.section	.text.unlikely
.LCOLDB13:
	.section	.text.startup,"ax",@progbits
.LHOTB13:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB70:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	leaq	24(%rsp), %rcx
	leaq	16(%rsp), %rdx
	movq	$0, 16(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	movq	$0, 24(%rsp)
	movq	$0, 32(%rsp)
	call	convertArgsToIntArray
	movq	(%rax), %rdi
	movq	%rax, %r14
	call	parseStringToInt
	testq	%rax, %rax
	je	.L102
	movl	(%rax), %ebx
	movl	$32, %edi
	movq	%rax, (%rsp)
	imull	$2000, %ebx, %r12d
	movslq	%r12d, %rbp
	movq	%rbp, %rsi
	call	create1DArray_BYTE
	testl	%r12d, %r12d
	movq	%rax, %r15
	movq	(%rsp), %r11
	jle	.L64
	negq	%rax
	andl	$15, %eax
	cmpl	%r12d, %eax
	cmova	%r12d, %eax
	cmpl	$17, %r12d
	jg	.L103
	movl	%r12d, %eax
.L65:
	cmpl	$1, %eax
	movb	$0, (%r15)
	je	.L75
	cmpl	$2, %eax
	movb	$1, 1(%r15)
	je	.L76
	cmpl	$3, %eax
	movb	$2, 2(%r15)
	je	.L77
	cmpl	$4, %eax
	movb	$3, 3(%r15)
	je	.L78
	cmpl	$5, %eax
	movb	$4, 4(%r15)
	je	.L79
	cmpl	$6, %eax
	movb	$5, 5(%r15)
	je	.L80
	cmpl	$7, %eax
	movb	$6, 6(%r15)
	je	.L81
	cmpl	$8, %eax
	movb	$7, 7(%r15)
	je	.L82
	cmpl	$9, %eax
	movb	$8, 8(%r15)
	je	.L83
	cmpl	$10, %eax
	movb	$9, 9(%r15)
	je	.L84
	cmpl	$11, %eax
	movb	$10, 10(%r15)
	je	.L85
	cmpl	$12, %eax
	movb	$11, 11(%r15)
	je	.L86
	cmpl	$13, %eax
	movb	$12, 12(%r15)
	je	.L87
	cmpl	$14, %eax
	movb	$13, 13(%r15)
	je	.L88
	cmpl	$15, %eax
	movb	$14, 14(%r15)
	je	.L89
	cmpl	$16, %eax
	movb	$15, 15(%r15)
	je	.L90
	movb	$16, 16(%r15)
	movl	$17, %edx
.L67:
	cmpl	%r12d, %eax
	je	.L64
.L66:
	movl	%r12d, %r8d
	leal	-1(%r12), %esi
	movl	%eax, %edi
	subl	%eax, %r8d
	leal	-16(%r8), %ecx
	subl	%eax, %esi
	shrl	$4, %ecx
	addl	$1, %ecx
	movl	%ecx, %r9d
	sall	$4, %r9d
	cmpl	$14, %esi
	jbe	.L69
	movl	%edx, (%rsp)
	addq	%r15, %rdi
	xorl	%eax, %eax
	movd	(%rsp), %xmm6
	movdqa	.LC6(%rip), %xmm9
	pshufd	$0, %xmm6, %xmm0
	movdqa	.LC7(%rip), %xmm8
	movdqa	.LC8(%rip), %xmm7
	paddd	.LC12(%rip), %xmm0
	movdqa	.LC9(%rip), %xmm6
	movdqa	.LC10(%rip), %xmm3
.L56:
	movdqa	%xmm0, %xmm2
	movdqa	%xmm0, %xmm4
	movdqa	%xmm0, %xmm1
	movq	%rax, %rsi
	paddd	%xmm8, %xmm2
	punpcklwd	%xmm2, %xmm4
	addq	$1, %rax
	punpckhwd	%xmm2, %xmm1
	salq	$4, %rsi
	movdqa	%xmm0, %xmm5
	cmpl	%eax, %ecx
	movdqa	%xmm4, %xmm2
	punpckhwd	%xmm1, %xmm4
	paddd	%xmm6, %xmm5
	punpcklwd	%xmm1, %xmm2
	movdqa	%xmm0, %xmm1
	paddd	%xmm9, %xmm0
	paddd	%xmm7, %xmm1
	punpcklwd	%xmm4, %xmm2
	movdqa	%xmm1, %xmm4
	punpcklwd	%xmm5, %xmm1
	punpckhwd	%xmm5, %xmm4
	movdqa	%xmm1, %xmm5
	pand	%xmm3, %xmm2
	punpckhwd	%xmm4, %xmm5
	punpcklwd	%xmm4, %xmm1
	punpcklwd	%xmm5, %xmm1
	pand	%xmm3, %xmm1
	packuswb	%xmm1, %xmm2
	movaps	%xmm2, (%rdi,%rsi)
	ja	.L56
	addl	%r9d, %edx
	cmpl	%r9d, %r8d
	je	.L64
.L69:
	movslq	%edx, %rax
	movb	%dl, (%r15,%rax)
	leal	1(%rdx), %eax
	cmpl	%r12d, %eax
	jge	.L64
	movslq	%eax, %rcx
	movb	%al, (%r15,%rcx)
	leal	2(%rdx), %eax
	cmpl	%eax, %r12d
	jle	.L64
	movslq	%eax, %rcx
	movb	%al, (%r15,%rcx)
	leal	3(%rdx), %eax
	cmpl	%eax, %r12d
	jle	.L64
	movslq	%eax, %rcx
	movb	%al, (%r15,%rcx)
	leal	4(%rdx), %eax
	cmpl	%eax, %r12d
	jle	.L64
	movslq	%eax, %rcx
	movb	%al, (%r15,%rcx)
	leal	5(%rdx), %eax
	cmpl	%eax, %r12d
	jle	.L64
	movslq	%eax, %rcx
	movb	%al, (%r15,%rcx)
	leal	6(%rdx), %eax
	cmpl	%eax, %r12d
	jle	.L64
	movslq	%eax, %rcx
	movb	%al, (%r15,%rcx)
	leal	7(%rdx), %eax
	cmpl	%eax, %r12d
	jle	.L64
	movslq	%eax, %rcx
	movb	%al, (%r15,%rcx)
	leal	8(%rdx), %eax
	cmpl	%eax, %r12d
	jle	.L64
	movslq	%eax, %rcx
	movb	%al, (%r15,%rcx)
	leal	9(%rdx), %eax
	cmpl	%eax, %r12d
	jle	.L64
	movslq	%eax, %rcx
	movb	%al, (%r15,%rcx)
	leal	10(%rdx), %eax
	cmpl	%eax, %r12d
	jle	.L64
	movslq	%eax, %rcx
	movb	%al, (%r15,%rcx)
	leal	11(%rdx), %eax
	cmpl	%eax, %r12d
	jle	.L64
	movslq	%eax, %rcx
	movb	%al, (%r15,%rcx)
	leal	12(%rdx), %eax
	cmpl	%eax, %r12d
	jle	.L64
	movslq	%eax, %rcx
	movb	%al, (%r15,%rcx)
	leal	13(%rdx), %eax
	cmpl	%eax, %r12d
	jle	.L64
	addl	$14, %edx
	movslq	%eax, %rcx
	cmpl	%edx, %r12d
	movb	%al, (%r15,%rcx)
	jle	.L64
	movslq	%edx, %rax
	movb	%dl, (%r15,%rax)
.L64:
	xorl	%edi, %edi
	movl	$13, %esi
	movq	%r11, 8(%rsp)
	call	create1DArray_int64_t
	movl	$13, %esi
	movq	%rax, %rdi
	movq	$112, (%rax)
	movq	$105, 8(%rax)
	movq	$120, 16(%rax)
	movq	%rax, %r13
	movq	$101, 24(%rax)
	movq	$108, 32(%rax)
	movq	$115, 40(%rax)
	movq	$91, 48(%rax)
	movq	$49, 56(%rax)
	movq	$48, 64(%rax)
	movq	$48, 72(%rax)
	movq	$48, 80(%rax)
	movq	$93, 88(%rax)
	movq	$61, 96(%rax)
	call	printf_s
	movzbl	1000(%r15), %edx
	movl	$.LC11, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	leaq	32(%rsp), %r9
	movl	%ebx, %r8d
	movl	$2000, %ecx
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	_sobelEdgeDetection_
	movq	32(%rsp), %r12
	xorl	%edi, %edi
	movl	$23, %esi
	movq	%rax, %rbx
	call	create1DArray_int64_t
	movl	$23, %esi
	movq	%rax, %rdi
	movq	$66, (%rax)
	movq	$108, 8(%rax)
	movq	$117, 16(%rax)
	movq	%rax, %rbp
	movq	$114, 24(%rax)
	movq	$114, 32(%rax)
	movq	$101, 40(%rax)
	movq	$100, 48(%rax)
	movq	$32, 56(%rax)
	movq	$73, 64(%rax)
	movq	$109, 72(%rax)
	movq	$97, 80(%rax)
	movq	$103, 88(%rax)
	movq	$101, 96(%rax)
	movq	$32, 104(%rax)
	movq	$115, 112(%rax)
	movq	$105, 120(%rax)
	movq	$122, 128(%rax)
	movq	$101, 136(%rax)
	movq	$115, 144(%rax)
	movq	$58, 152(%rax)
	movq	$32, 160(%rax)
	movq	$32, 168(%rax)
	movq	$32, 176(%rax)
	call	println_s
	movl	%r12d, %edx
	movl	$.LC3, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	xorl	%edi, %edi
	movl	$6, %esi
	call	create1DArray_int64_t
	movl	$6, %esi
	movq	%rax, %rdi
	movq	$32, (%rax)
	movq	$98, 8(%rax)
	movq	$121, 16(%rax)
	movq	$116, 24(%rax)
	movq	$101, 32(%rax)
	movq	$115, 40(%rax)
	movq	%rax, (%rsp)
	call	println_s
	xorl	%edi, %edi
	movl	$16, %esi
	call	create1DArray_int64_t
	movl	$16, %esi
	movq	%rax, %rdi
	movq	$110, (%rax)
	movq	$101, 8(%rax)
	movq	$119, 16(%rax)
	movq	%rax, %r12
	movq	$80, 24(%rax)
	movq	$105, 32(%rax)
	movq	$120, 40(%rax)
	movq	$101, 48(%rax)
	movq	$108, 56(%rax)
	movq	$115, 64(%rax)
	movq	$91, 72(%rax)
	movq	$49, 80(%rax)
	movq	$48, 88(%rax)
	movq	$48, 96(%rax)
	movq	$48, 104(%rax)
	movq	$93, 112(%rax)
	movq	$61, 120(%rax)
	call	printf_s
	movzbl	1000(%rbx), %edx
	movl	$.LC3, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movq	8(%rsp), %r11
	movq	%r11, %rdi
	call	free
	movq	%r15, %rdi
	movl	$1, %r15d
	call	free
	movq	%rbx, %rdi
	call	free
	cmpq	$0, 16(%rsp)
	je	.L104
.L59:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L62:
	movq	(%r14,%rbx,8), %rdi
	call	free
	movq	$0, (%r14,%rbx,8)
	addq	$1, %rbx
	cmpq	%rbx, 16(%rsp)
	ja	.L62
	movq	%r14, %rdi
	call	free
	testb	%r15b, %r15b
	jne	.L70
.L63:
	xorl	%edi, %edi
	call	exit
	.p2align 4,,10
	.p2align 3
.L102:
	cmpq	$0, 16(%rsp)
	je	.L61
	xorl	%r12d, %r12d
	movq	$0, (%rsp)
	xorl	%ebp, %ebp
	xorl	%r13d, %r13d
	xorl	%r15d, %r15d
	jmp	.L59
.L104:
	movq	%r14, %rdi
	call	free
.L70:
	movq	%r13, %rdi
	call	free
	movq	%rbp, %rdi
	call	free
	movq	(%rsp), %rdi
	call	free
	movq	%r12, %rdi
	call	free
	jmp	.L63
.L103:
	xorl	%edx, %edx
	testl	%eax, %eax
	je	.L66
	jmp	.L65
.L61:
	movq	%r14, %rdi
	call	free
	jmp	.L63
.L89:
	movl	$15, %edx
	jmp	.L67
.L88:
	movl	$14, %edx
	jmp	.L67
.L87:
	movl	$13, %edx
	jmp	.L67
.L86:
	movl	$12, %edx
	jmp	.L67
.L90:
	movl	$16, %edx
	jmp	.L67
.L77:
	movl	$3, %edx
	jmp	.L67
.L76:
	movl	$2, %edx
	jmp	.L67
.L75:
	movl	$1, %edx
	jmp	.L67
.L85:
	movl	$11, %edx
	jmp	.L67
.L84:
	movl	$10, %edx
	jmp	.L67
.L83:
	movl	$9, %edx
	jmp	.L67
.L82:
	movl	$8, %edx
	jmp	.L67
.L81:
	movl	$7, %edx
	jmp	.L67
.L80:
	movl	$6, %edx
	jmp	.L67
.L79:
	movl	$5, %edx
	jmp	.L67
.L78:
	movl	$4, %edx
	jmp	.L67
	.cfi_endproc
.LFE70:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE13:
	.section	.text.startup
.LHOTE13:
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC6:
	.long	16
	.long	16
	.long	16
	.long	16
	.align 16
.LC7:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC8:
	.long	8
	.long	8
	.long	8
	.long	8
	.align 16
.LC9:
	.long	12
	.long	12
	.long	12
	.long	12
	.align 16
.LC10:
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.align 16
.LC12:
	.long	0
	.long	1
	.long	2
	.long	3
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.5) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
