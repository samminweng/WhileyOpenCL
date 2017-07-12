	.file	"CoinGame_original.c"
	.text
	.globl	_findMoves_
	.type	_findMoves_, @function
_findMoves_:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movq	%rdi, -88(%rbp)
	movq	%rsi, -96(%rbp)
	movl	%edx, %eax
	movq	%rcx, -112(%rbp)
	movq	%r8, -120(%rbp)
	movb	%al, -100(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	movb	$0, -65(%rbp)
	movq	$0, -64(%rbp)
	jmp	.L2
.L5:
	movq	$0, -56(%rbp)
	jmp	.L3
.L4:
	movq	-56(%rbp), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -32(%rbp)
	movq	-56(%rbp), %rax
	addq	$1, %rax
	imulq	-112(%rbp), %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-56(%rbp), %rax
	addq	$2, %rax
	imulq	-112(%rbp), %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	leaq	0(,%rax,8), %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-56(%rbp), %rax
	imulq	-112(%rbp), %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	-16(%rax), %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-56(%rbp), %rax
	imulq	-112(%rbp), %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	leaq	0(,%rax,8), %rdx
	movq	-88(%rbp), %rax
	addq	%rax, %rdx
	movq	-16(%rbp), %rax
	xorq	-24(%rbp), %rax
	movq	%rax, %rcx
	movq	-16(%rbp), %rax
	cmpq	-24(%rbp), %rax
	setl	%al
	movzbl	%al, %eax
	negl	%eax
	cltq
	andq	%rcx, %rax
	xorq	-24(%rbp), %rax
	movq	%rax, %rcx
	movq	-56(%rbp), %rax
	leaq	(%rcx,%rax), %rsi
	movq	-16(%rbp), %rax
	xorq	-24(%rbp), %rax
	movq	%rax, %rcx
	movq	-16(%rbp), %rax
	cmpq	-24(%rbp), %rax
	setl	%al
	movzbl	%al, %eax
	negl	%eax
	cltq
	andq	%rcx, %rax
	xorq	-24(%rbp), %rax
	movq	%rax, %rcx
	movq	-56(%rbp), %rax
	leaq	(%rcx,%rax), %rdi
	movq	-24(%rbp), %rax
	xorq	-8(%rbp), %rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	cmpq	-8(%rbp), %rax
	setl	%al
	movzbl	%al, %eax
	negl	%eax
	cltq
	andq	%rcx, %rax
	xorq	-8(%rbp), %rax
	movq	%rax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	xorq	%rax, %rdi
	movq	-16(%rbp), %rax
	xorq	-24(%rbp), %rax
	movq	%rax, %rcx
	movq	-16(%rbp), %rax
	cmpq	-24(%rbp), %rax
	setl	%al
	movzbl	%al, %eax
	negl	%eax
	cltq
	andq	%rcx, %rax
	xorq	-24(%rbp), %rax
	movq	%rax, %rcx
	movq	-56(%rbp), %rax
	leaq	(%rcx,%rax), %r8
	movq	-24(%rbp), %rax
	xorq	-8(%rbp), %rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	cmpq	-8(%rbp), %rax
	setl	%al
	movzbl	%al, %eax
	negl	%eax
	cltq
	andq	%rcx, %rax
	xorq	-8(%rbp), %rax
	movq	%rax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	cmpq	%rax, %r8
	setl	%al
	movzbl	%al, %eax
	negl	%eax
	cltq
	andq	%rdi, %rax
	xorq	%rsi, %rax
	movq	%rax, (%rdx)
	addq	$1, -56(%rbp)
.L3:
	movq	-112(%rbp), %rax
	subq	-64(%rbp), %rax
	cmpq	-56(%rbp), %rax
	jg	.L4
	addq	$1, -64(%rbp)
.L2:
	movq	-64(%rbp), %rax
	cmpq	-112(%rbp), %rax
	jl	.L5
	cmpb	$0, -65(%rbp)
	je	.L6
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	$0, -48(%rbp)
	movb	$0, -65(%rbp)
.L6:
	movq	-120(%rbp), %rax
	movq	-96(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-88(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_findMoves_, .-_findMoves_
	.section	.rodata
.LC0:
	.string	"%ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$272, %rsp
	movl	%edi, -260(%rbp)
	movq	%rsi, -272(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movb	$0, -242(%rbp)
	movq	$0, -176(%rbp)
	movq	$0, -216(%rbp)
	movq	$0, -168(%rbp)
	movb	$0, -249(%rbp)
	movq	$0, -160(%rbp)
	movb	$0, -248(%rbp)
	movq	$0, -152(%rbp)
	movq	$0, -240(%rbp)
	movq	$0, -232(%rbp)
	movb	$0, -247(%rbp)
	movq	$0, -144(%rbp)
	movq	$0, -136(%rbp)
	movq	$0, -128(%rbp)
	movb	$0, -241(%rbp)
	movq	$0, -120(%rbp)
	movq	$0, -112(%rbp)
	movq	$0, -104(%rbp)
	movq	$0, -96(%rbp)
	movq	$0, -88(%rbp)
	movq	$0, -80(%rbp)
	movq	$0, -208(%rbp)
	movq	$0, -72(%rbp)
	movb	$0, -246(%rbp)
	movq	$0, -200(%rbp)
	movq	$0, -224(%rbp)
	movb	$0, -245(%rbp)
	movq	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -192(%rbp)
	movq	$0, -40(%rbp)
	movb	$0, -244(%rbp)
	movq	$0, -184(%rbp)
	movq	$0, -32(%rbp)
	movb	$0, -243(%rbp)
	cmpb	$0, -247(%rbp)
	je	.L9
	movq	-240(%rbp), %rdx
	movq	-152(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	free2DArray_int64_t
	movq	$0, -152(%rbp)
	movb	$0, -247(%rbp)
.L9:
	leaq	-232(%rbp), %rcx
	leaq	-240(%rbp), %rdx
	movq	-272(%rbp), %rsi
	movl	-260(%rbp), %eax
	movl	%eax, %edi
	call	convertArgsToIntArray
	movq	%rax, -152(%rbp)
	cmpq	$0, -152(%rbp)
	je	.L10
	movb	$1, -247(%rbp)
	jmp	.L11
.L10:
	movb	$0, -247(%rbp)
.L11:
	movq	$0, -144(%rbp)
	movq	-144(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-152(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -136(%rbp)
	movq	-232(%rbp), %rax
	movq	%rax, -128(%rbp)
	movb	$0, -241(%rbp)
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	parseStringToInt
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L12
	movb	$1, -248(%rbp)
	jmp	.L13
.L12:
	movb	$0, -248(%rbp)
.L13:
	movb	$0, -241(%rbp)
	cmpb	$0, -242(%rbp)
	je	.L14
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	$0, -16(%rbp)
	movb	$0, -242(%rbp)
.L14:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movzbl	-248(%rbp), %eax
	movb	%al, -242(%rbp)
	movb	$0, -248(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L41
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -176(%rbp)
	movq	$0, -120(%rbp)
	movq	$2, -112(%rbp)
	movq	-176(%rbp), %rdx
	movq	-112(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -104(%rbp)
	movq	$2, -96(%rbp)
	movq	-176(%rbp), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -88(%rbp)
	movq	-104(%rbp), %rax
	imulq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	cmpb	$0, -246(%rbp)
	je	.L17
	movq	-208(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	$0, -208(%rbp)
	movb	$0, -246(%rbp)
.L17:
	movq	-80(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	create1DArray_int64_t
	movq	%rax, -208(%rbp)
	cmpq	$0, -208(%rbp)
	je	.L18
	movb	$1, -246(%rbp)
	jmp	.L19
.L18:
	movb	$0, -246(%rbp)
.L19:
	cmpb	$0, -249(%rbp)
	je	.L20
	movq	-216(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	$0, -216(%rbp)
	movb	$0, -249(%rbp)
.L20:
	movq	-72(%rbp), %rax
	movq	%rax, -168(%rbp)
	movq	-208(%rbp), %rax
	movq	%rax, -216(%rbp)
	movzbl	-246(%rbp), %eax
	movb	%al, -249(%rbp)
	movb	$0, -246(%rbp)
	cmpb	$0, -245(%rbp)
	je	.L21
	movq	-200(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	$0, -200(%rbp)
	movb	$0, -245(%rbp)
.L21:
	leaq	-224(%rbp), %rcx
	movq	-176(%rbp), %rdx
	movq	-168(%rbp), %rsi
	movq	-216(%rbp), %rax
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	_findMoves_
	movq	%rax, -200(%rbp)
	movb	$0, -249(%rbp)
	cmpq	$0, -200(%rbp)
	je	.L22
	movb	$1, -245(%rbp)
	jmp	.L23
.L22:
	movb	$0, -245(%rbp)
.L23:
	cmpb	$0, -249(%rbp)
	je	.L24
	movq	-216(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	$0, -216(%rbp)
	movb	$0, -249(%rbp)
.L24:
	movq	-224(%rbp), %rax
	movq	%rax, -168(%rbp)
	movq	-200(%rbp), %rax
	movq	%rax, -216(%rbp)
	movzbl	-245(%rbp), %eax
	movb	%al, -249(%rbp)
	movb	$0, -245(%rbp)
	movq	$1, -64(%rbp)
	movq	-176(%rbp), %rax
	subq	-64(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-216(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -160(%rbp)
	cmpb	$0, -244(%rbp)
	je	.L25
	movq	-192(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	$0, -192(%rbp)
	movb	$0, -244(%rbp)
.L25:
	movq	$50, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	create1DArray_int64_t
	movq	%rax, -192(%rbp)
	movq	-192(%rbp), %rax
	movq	$84, (%rax)
	movq	-192(%rbp), %rax
	addq	$8, %rax
	movq	$104, (%rax)
	movq	-192(%rbp), %rax
	addq	$16, %rax
	movq	$101, (%rax)
	movq	-192(%rbp), %rax
	addq	$24, %rax
	movq	$32, (%rax)
	movq	-192(%rbp), %rax
	addq	$32, %rax
	movq	$116, (%rax)
	movq	-192(%rbp), %rax
	addq	$40, %rax
	movq	$111, (%rax)
	movq	-192(%rbp), %rax
	addq	$48, %rax
	movq	$116, (%rax)
	movq	-192(%rbp), %rax
	addq	$56, %rax
	movq	$97, (%rax)
	movq	-192(%rbp), %rax
	addq	$64, %rax
	movq	$108, (%rax)
	movq	-192(%rbp), %rax
	addq	$72, %rax
	movq	$32, (%rax)
	movq	-192(%rbp), %rax
	addq	$80, %rax
	movq	$97, (%rax)
	movq	-192(%rbp), %rax
	addq	$88, %rax
	movq	$109, (%rax)
	movq	-192(%rbp), %rax
	addq	$96, %rax
	movq	$111, (%rax)
	movq	-192(%rbp), %rax
	addq	$104, %rax
	movq	$117, (%rax)
	movq	-192(%rbp), %rax
	addq	$112, %rax
	movq	$110, (%rax)
	movq	-192(%rbp), %rax
	addq	$120, %rax
	movq	$116, (%rax)
	movq	-192(%rbp), %rax
	subq	$-128, %rax
	movq	$32, (%rax)
	movq	-192(%rbp), %rax
	addq	$136, %rax
	movq	$111, (%rax)
	movq	-192(%rbp), %rax
	addq	$144, %rax
	movq	$102, (%rax)
	movq	-192(%rbp), %rax
	addq	$152, %rax
	movq	$32, (%rax)
	movq	-192(%rbp), %rax
	addq	$160, %rax
	movq	$109, (%rax)
	movq	-192(%rbp), %rax
	addq	$168, %rax
	movq	$111, (%rax)
	movq	-192(%rbp), %rax
	addq	$176, %rax
	movq	$110, (%rax)
	movq	-192(%rbp), %rax
	addq	$184, %rax
	movq	$101, (%rax)
	movq	-192(%rbp), %rax
	addq	$192, %rax
	movq	$121, (%rax)
	movq	-192(%rbp), %rax
	addq	$200, %rax
	movq	$32, (%rax)
	movq	-192(%rbp), %rax
	addq	$208, %rax
	movq	$40, (%rax)
	movq	-192(%rbp), %rax
	addq	$216, %rax
	movq	$109, (%rax)
	movq	-192(%rbp), %rax
	addq	$224, %rax
	movq	$97, (%rax)
	movq	-192(%rbp), %rax
	addq	$232, %rax
	movq	$120, (%rax)
	movq	-192(%rbp), %rax
	addq	$240, %rax
	movq	$105, (%rax)
	movq	-192(%rbp), %rax
	addq	$248, %rax
	movq	$109, (%rax)
	movq	-192(%rbp), %rax
	addq	$256, %rax
	movq	$117, (%rax)
	movq	-192(%rbp), %rax
	addq	$264, %rax
	movq	$109, (%rax)
	movq	-192(%rbp), %rax
	addq	$272, %rax
	movq	$41, (%rax)
	movq	-192(%rbp), %rax
	addq	$280, %rax
	movq	$32, (%rax)
	movq	-192(%rbp), %rax
	addq	$288, %rax
	movq	$65, (%rax)
	movq	-192(%rbp), %rax
	addq	$296, %rax
	movq	$108, (%rax)
	movq	-192(%rbp), %rax
	addq	$304, %rax
	movq	$105, (%rax)
	movq	-192(%rbp), %rax
	addq	$312, %rax
	movq	$99, (%rax)
	movq	-192(%rbp), %rax
	addq	$320, %rax
	movq	$101, (%rax)
	movq	-192(%rbp), %rax
	addq	$328, %rax
	movq	$32, (%rax)
	movq	-192(%rbp), %rax
	addq	$336, %rax
	movq	$103, (%rax)
	movq	-192(%rbp), %rax
	addq	$344, %rax
	movq	$101, (%rax)
	movq	-192(%rbp), %rax
	addq	$352, %rax
	movq	$116, (%rax)
	movq	-192(%rbp), %rax
	addq	$360, %rax
	movq	$115, (%rax)
	movq	-192(%rbp), %rax
	addq	$368, %rax
	movq	$32, (%rax)
	movq	-192(%rbp), %rax
	addq	$376, %rax
	movq	$105, (%rax)
	movq	-192(%rbp), %rax
	addq	$384, %rax
	movq	$115, (%rax)
	movq	-192(%rbp), %rax
	addq	$392, %rax
	movq	$32, (%rax)
	cmpq	$0, -192(%rbp)
	je	.L26
	movb	$1, -244(%rbp)
	jmp	.L27
.L26:
	movb	$0, -244(%rbp)
.L27:
	movq	-40(%rbp), %rdx
	movq	-192(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	printf_s
	movq	-160(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	cmpb	$0, -243(%rbp)
	je	.L28
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	$0, -184(%rbp)
	movb	$0, -243(%rbp)
.L28:
	movq	$23, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	create1DArray_int64_t
	movq	%rax, -184(%rbp)
	movq	-184(%rbp), %rax
	movq	$80, (%rax)
	movq	-184(%rbp), %rax
	addq	$8, %rax
	movq	$97, (%rax)
	movq	-184(%rbp), %rax
	addq	$16, %rax
	movq	$115, (%rax)
	movq	-184(%rbp), %rax
	addq	$24, %rax
	movq	$115, (%rax)
	movq	-184(%rbp), %rax
	addq	$32, %rax
	movq	$32, (%rax)
	movq	-184(%rbp), %rax
	addq	$40, %rax
	movq	$67, (%rax)
	movq	-184(%rbp), %rax
	addq	$48, %rax
	movq	$111, (%rax)
	movq	-184(%rbp), %rax
	addq	$56, %rax
	movq	$105, (%rax)
	movq	-184(%rbp), %rax
	addq	$64, %rax
	movq	$110, (%rax)
	movq	-184(%rbp), %rax
	addq	$72, %rax
	movq	$71, (%rax)
	movq	-184(%rbp), %rax
	addq	$80, %rax
	movq	$97, (%rax)
	movq	-184(%rbp), %rax
	addq	$88, %rax
	movq	$109, (%rax)
	movq	-184(%rbp), %rax
	addq	$96, %rax
	movq	$101, (%rax)
	movq	-184(%rbp), %rax
	addq	$104, %rax
	movq	$32, (%rax)
	movq	-184(%rbp), %rax
	addq	$112, %rax
	movq	$116, (%rax)
	movq	-184(%rbp), %rax
	addq	$120, %rax
	movq	$101, (%rax)
	movq	-184(%rbp), %rax
	subq	$-128, %rax
	movq	$115, (%rax)
	movq	-184(%rbp), %rax
	addq	$136, %rax
	movq	$116, (%rax)
	movq	-184(%rbp), %rax
	addq	$144, %rax
	movq	$32, (%rax)
	movq	-184(%rbp), %rax
	addq	$152, %rax
	movq	$99, (%rax)
	movq	-184(%rbp), %rax
	addq	$160, %rax
	movq	$97, (%rax)
	movq	-184(%rbp), %rax
	addq	$168, %rax
	movq	$115, (%rax)
	movq	-184(%rbp), %rax
	addq	$176, %rax
	movq	$101, (%rax)
	cmpq	$0, -184(%rbp)
	je	.L29
	movb	$1, -243(%rbp)
	jmp	.L30
.L29:
	movb	$0, -243(%rbp)
.L30:
	movq	-32(%rbp), %rdx
	movq	-184(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	println_s
	jmp	.L16
.L41:
	nop
.L16:
	cmpb	$0, -242(%rbp)
	je	.L31
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	$0, -16(%rbp)
	movb	$0, -242(%rbp)
.L31:
	cmpb	$0, -249(%rbp)
	je	.L32
	movq	-216(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	$0, -216(%rbp)
	movb	$0, -249(%rbp)
.L32:
	cmpb	$0, -248(%rbp)
	je	.L33
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	$0, -24(%rbp)
	movb	$0, -248(%rbp)
.L33:
	cmpb	$0, -247(%rbp)
	je	.L34
	movq	-240(%rbp), %rdx
	movq	-152(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	free2DArray_int64_t
	movq	$0, -152(%rbp)
	movb	$0, -247(%rbp)
.L34:
	cmpb	$0, -241(%rbp)
	je	.L35
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	$0, -136(%rbp)
	movb	$0, -241(%rbp)
.L35:
	cmpb	$0, -246(%rbp)
	je	.L36
	movq	-208(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	$0, -208(%rbp)
	movb	$0, -246(%rbp)
.L36:
	cmpb	$0, -245(%rbp)
	je	.L37
	movq	-200(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	$0, -200(%rbp)
	movb	$0, -245(%rbp)
.L37:
	cmpb	$0, -244(%rbp)
	je	.L38
	movq	-192(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	$0, -192(%rbp)
	movb	$0, -244(%rbp)
.L38:
	cmpb	$0, -243(%rbp)
	je	.L39
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	$0, -184(%rbp)
	movb	$0, -243(%rbp)
.L39:
	movl	$0, %edi
	call	exit
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
