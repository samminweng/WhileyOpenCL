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
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leal	-1(%r9), %r15d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%edx, %r13d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leal	2(%r9), %ebp
	xorl	%ebx, %ebx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	80(%rsp), %r14d
	movl	104(%rsp), %eax
	movq	88(%rsp), %r12
	leal	-1(%r14), %r11d
	movl	%eax, 12(%rsp)
	addl	$2, %r14d
.L10:
	movl	%r11d, %eax
	movl	%r15d, %esi
	movq	%r12, %r10
	cltd
	idivl	%r8d
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	movl	%edx, %r9d
	subl	%eax, %r9d
	imull	%ecx, %r9d
.L8:
	movl	%esi, %eax
	addl	$1, %esi
	addq	$8, %r10
	cltd
	idivl	%ecx
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	subl	%eax, %edx
	addl	%r9d, %edx
	movslq	%edx, %rdx
	movzbl	(%rdi,%rdx), %eax
	imull	-8(%r10), %eax
	addl	%eax, %ebx
	cmpl	%esi, %ebp
	jne	.L8
.L9:
	addl	$1, %r11d
	addq	$24, %r12
	cmpl	%r11d, %r14d
	jne	.L10
.L11:
	testb	%r13b, %r13b
	jne	.L17
.L12:
	cmpb	$0, 12(%rsp)
	je	.L13
	movq	88(%rsp), %rdi
	call	free
.L13:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%ebx, %eax
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
.L17:
	.cfi_restore_state
	call	free
	jmp	.L12
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
	movl	%r8d, %ebp
	movl	%ecx, %ebx
	xorl	%r13d, %r13d
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	cltq
	movq	%rdi, (%rsp)
	movq	%rsi, 8(%rsp)
	movl	$32, %edi
	movq	%rax, %rsi
	movl	%edx, 52(%rsp)
	movq	%r9, 56(%rsp)
	movq	%rax, 40(%rsp)
	call	create1DArray_BYTE
	xorl	%edi, %edi
	movl	$9, %esi
	movq	%rax, 32(%rsp)
	call	create1DArray_int64_t
	xorl	%edi, %edi
	movq	$-1, (%rax)
	movq	$0, 8(%rax)
	movq	$1, 16(%rax)
	movq	$-2, 24(%rax)
	movl	$9, %esi
	movq	$0, 32(%rax)
	movq	$2, 40(%rax)
	movq	$-1, 48(%rax)
	movq	$0, 56(%rax)
	movq	$1, 64(%rax)
	movq	%rax, 16(%rsp)
	call	create1DArray_int64_t
	testl	%ebx, %ebx
	movq	%rax, 24(%rsp)
	movq	$1, (%rax)
	movq	$2, 8(%rax)
	movq	$1, 16(%rax)
	movq	$0, 24(%rax)
	movq	$0, 32(%rax)
	movq	$0, 40(%rax)
	movq	$-1, 48(%rax)
	movq	$-2, 56(%rax)
	movq	$-1, 64(%rax)
	jle	.L23
	.p2align 4,,10
	.p2align 3
.L28:
	xorl	%r14d, %r14d
	testl	%ebp, %ebp
	movl	%r13d, %r12d
	jle	.L26
	.p2align 4,,10
	.p2align 3
.L29:
	pushq	$0
	.cfi_def_cfa_offset 136
	pushq	$9
	.cfi_def_cfa_offset 144
	xorl	%edx, %edx
	pushq	32(%rsp)
	.cfi_def_cfa_offset 152
	pushq	%r14
	.cfi_def_cfa_offset 160
	movl	%r13d, %r9d
	movq	40(%rsp), %rsi
	movq	32(%rsp), %rdi
	movl	%ebp, %r8d
	movl	%ebx, %ecx
	call	_convolution_
	addq	$32, %rsp
	.cfi_def_cfa_offset 128
	movl	%eax, %r15d
	xorl	%edx, %edx
	pushq	$0
	.cfi_def_cfa_offset 136
	pushq	$9
	.cfi_def_cfa_offset 144
	movl	%r13d, %r9d
	pushq	40(%rsp)
	.cfi_def_cfa_offset 152
	pushq	%r14
	.cfi_def_cfa_offset 160
	movl	%ebp, %r8d
	movq	40(%rsp), %rsi
	movq	32(%rsp), %rdi
	movl	%ebx, %ecx
	call	_convolution_
	movl	%r15d, %r11d
	addq	$32, %rsp
	.cfi_def_cfa_offset 128
	imull	%r15d, %r11d
	imull	%eax, %eax
	addl	%r11d, %eax
	cmpl	$640000, %eax
	jle	.L25
	movq	32(%rsp), %rdx
	movslq	%r12d, %rax
	movb	$98, (%rdx,%rax)
.L25:
	addl	$1, %r14d
	addl	%ebx, %r12d
	cmpl	%r14d, %ebp
	jne	.L29
.L26:
	addl	$1, %r13d
	cmpl	%r13d, %ebx
	jne	.L28
.L23:
	cmpb	$0, 52(%rsp)
	jne	.L35
.L21:
	movq	16(%rsp), %rdi
	call	free
	movq	24(%rsp), %rdi
	call	free
	movq	56(%rsp), %rax
	movq	40(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	32(%rsp), %rax
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
.L35:
	.cfi_restore_state
	movq	(%rsp), %rdi
	call	free
	jmp	.L21
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
	jle	.L37
	leal	-1(%r14), %eax
	xorl	%r13d, %r13d
	movb	$0, 7(%rsp)
	xorl	%r12d, %r12d
	addq	$1, %rax
	movq	%rax, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L45:
	testl	%r14d, %r14d
	jle	.L43
	movq	8(%rsp), %rax
	movslq	%r13d, %rbx
	leaq	(%rax,%rbx), %r15
	addq	16(%rsp), %rbx
	addq	%rax, %rbx
	jmp	.L44
	.p2align 4,,10
	.p2align 3
.L41:
.L42:
	xorl	%eax, %eax
	movl	$1, %edx
	movl	$.LC3, %esi
	movl	$1, %edi
	addq	$1, %r15
	call	__printf_chk
	cmpq	%rbx, %r15
	je	.L43
.L44:
	cmpb	$32, (%r15)
	jne	.L41
	xorl	%edx, %edx
	xorl	%eax, %eax
	movl	$.LC3, %esi
	movl	$1, %edi
	addq	$1, %r15
	call	__printf_chk
	cmpq	%rbx, %r15
	jne	.L44
.L43:
	cmpb	$0, 7(%rsp)
	jne	.L58
.L40:
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
	jne	.L45
.L46:
	cmpb	$0, 44(%rsp)
	jne	.L49
.L47:
	movq	24(%rsp), %rdi
	call	free
	movq	32(%rsp), %rdi
	call	free
	cmpb	$0, 7(%rsp)
	movq	%rbp, %rdi
	jne	.L55
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
.L58:
	.cfi_restore_state
	movq	%rbp, %rdi
	call	free
	jmp	.L40
.L37:
	cmpb	$0, 44(%rsp)
	jne	.L59
	movq	24(%rsp), %rdi
	call	free
	movq	32(%rsp), %rdi
.L55:
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
.L59:
	.cfi_restore_state
	movb	$0, 7(%rsp)
.L49:
	movq	8(%rsp), %rdi
	call	free
	jmp	.L47
	.cfi_endproc
.LFE69:
	.size	_print_pbm_, .-_print_pbm_
	.section	.text.unlikely
.LCOLDE5:
	.text
.LHOTE5:
	.section	.rodata.str1.1
.LC6:
	.string	"%u\n"
	.section	.text.unlikely
.LCOLDB7:
	.section	.text.startup,"ax",@progbits
.LHOTB7:
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
	je	.L84
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
	jle	.L69
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L63:
	movb	%al, (%r15,%rax)
	addq	$1, %rax
	cmpl	%eax, %r12d
	jg	.L63
.L69:
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
	movl	$.LC6, %esi
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
	je	.L85
.L64:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L67:
	movq	(%r14,%rbx,8), %rdi
	call	free
	movq	$0, (%r14,%rbx,8)
	addq	$1, %rbx
	cmpq	%rbx, 16(%rsp)
	ja	.L67
	movq	%r14, %rdi
	call	free
	testb	%r15b, %r15b
	jne	.L71
.L68:
	xorl	%edi, %edi
	call	exit
	.p2align 4,,10
	.p2align 3
.L84:
	cmpq	$0, 16(%rsp)
	je	.L66
	xorl	%r12d, %r12d
	movq	$0, (%rsp)
	xorl	%ebp, %ebp
	xorl	%r13d, %r13d
	xorl	%r15d, %r15d
	jmp	.L64
.L85:
	movq	%r14, %rdi
	call	free
.L71:
	movq	%r13, %rdi
	call	free
	movq	%rbp, %rdi
	call	free
	movq	(%rsp), %rdi
	call	free
	movq	%r12, %rdi
	call	free
	jmp	.L68
.L66:
	movq	%r14, %rdi
	call	free
	jmp	.L68
	.cfi_endproc
.LFE70:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE7:
	.section	.text.startup
.LHOTE7:
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.5) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
