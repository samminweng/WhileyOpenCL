	.file	"SobelEdge_large.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.globl	wrap
	.type	wrap, @function
wrap:
.LFB60:
	.cfi_startproc
	movq	%rdi, %rax
	sarq	$63, %rax
	xorq	%rdi, %rax
	cmpq	%rsi, %rdi
	jge	.L6
	rep ret
	.p2align 4,,10
	.p2align 3
.L6:
	notq	%rdi
	leaq	(%rdi,%rsi,2), %rax
	ret
	.cfi_endproc
.LFE60:
	.size	wrap, .-wrap
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.text.unlikely
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.globl	convolution
	.type	convolution, @function
convolution:
.LFB61:
	.cfi_startproc
	leaq	-1(%r8), %rax
	movq	%rdx, %r10
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	cqto
	movq	32(%rsp), %rbp
	idivq	%r10
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	subl	%eax, %edx
	movq	%r8, %rax
	movslq	%edx, %rbx
	cqto
	idivq	%r10
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	subl	%eax, %edx
	leaq	1(%r8), %rax
	movslq	%edx, %r11
	cqto
	idivq	%r10
	movl	%edx, %esi
	movl	%edx, %eax
	sarl	$31, %esi
	xorl	%esi, %eax
	subl	%esi, %eax
	movslq	%eax, %r8
	leaq	-1(%r9), %rax
	cqto
	idivq	%rcx
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	subl	%eax, %edx
	leaq	(%rdi,%r11), %rax
	movslq	%edx, %rdx
	imulq	%r10, %rdx
	movzbl	(%rax,%rdx), %esi
	leaq	(%rdi,%rbx), %rax
	imulq	8(%rbp), %rsi
	movzbl	(%rax,%rdx), %eax
	imulq	0(%rbp), %rax
	addq	%rsi, %rax
	leaq	(%rdi,%r8), %rsi
	movzbl	(%rsi,%rdx), %esi
	imulq	16(%rbp), %rsi
	addq	%rax, %rsi
	movq	%r9, %rax
	cqto
	idivq	%rcx
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	subl	%eax, %edx
	movslq	%edx, %rdx
	imulq	%r10, %rdx
	addq	%rdi, %rdx
	movzbl	(%rdx,%rbx), %eax
	imulq	24(%rbp), %rax
	leaq	(%rax,%rsi), %r12
	movzbl	(%rdx,%r11), %esi
	imulq	32(%rbp), %rsi
	leaq	(%rsi,%r12), %rax
	movzbl	(%rdx,%r8), %esi
	imulq	40(%rbp), %rsi
	addq	%rax, %rsi
	leaq	1(%r9), %rax
	cqto
	idivq	%rcx
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	subl	%eax, %edx
	movslq	%edx, %rdx
	imulq	%rdx, %r10
	addq	%rdi, %r10
	movzbl	(%r10,%rbx), %edx
	movzbl	(%r10,%r11), %eax
	imulq	48(%rbp), %rdx
	imulq	56(%rbp), %rax
	popq	%rbx
	.cfi_def_cfa_offset 24
	addq	%rsi, %rdx
	leaq	(%rax,%rdx), %rsi
	movzbl	(%r10,%r8), %eax
	imulq	64(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	addq	%rsi, %rax
	ret
	.cfi_endproc
.LFE61:
	.size	convolution, .-convolution
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.section	.text.unlikely
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4,,15
	.globl	sobelEdgeDetection
	.type	sobelEdgeDetection, @function
sobelEdgeDetection:
.LFB62:
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
	movq	%r8, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, %rbp
	movq	%rcx, %rbx
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	%rdi, 24(%rsp)
	movq	%r8, %rdi
	call	malloc
	testq	%r12, %r12
	movq	%rax, %r15
	je	.L13
	movq	%r12, %rdx
	movl	$32, %esi
	movq	%rax, %rdi
	call	memset
.L13:
	testq	%rbp, %rbp
	movq	$1, 8(%rsp)
	movq	$0, (%rsp)
	jle	.L12
	.p2align 4,,10
	.p2align 3
.L19:
	testq	%rbx, %rbx
	jle	.L25
	movq	(%rsp), %r11
	movq	8(%rsp), %rdi
	xorl	%r8d, %r8d
	movq	%r11, %rax
	movq	%rdi, 16(%rsp)
	subq	$1, %rax
	cqto
	idivq	%rbp
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	subl	%eax, %edx
	movq	%r11, %rax
	movslq	%edx, %rsi
	cqto
	idivq	%rbp
	movq	%rdi, %rax
	movl	%edx, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %edx
	subl	%ecx, %edx
	movslq	%edx, %rcx
	cqto
	idivq	%rbp
	movq	24(%rsp), %rax
	leaq	(%rax,%rcx), %r12
	leaq	(%rax,%rsi), %r14
	movl	%edx, %edi
	sarl	$31, %edi
	xorl	%edi, %edx
	subl	%edi, %edx
	movzbl	(%rax,%rsi), %edi
	movslq	%edx, %rdx
	movzbl	(%rax,%rdx), %r9d
	leaq	(%rax,%rdx), %r13
	movq	%r9, %rsi
	.p2align 4,,10
	.p2align 3
.L15:
	leaq	-1(%r8), %rax
	negq	%rdi
	addq	$1, %r8
	cqto
	idivq	%rbx
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	subl	%eax, %edx
	movslq	%edx, %rcx
	imulq	%rbp, %rcx
	movzbl	0(%r13,%rcx), %r10d
	movzbl	(%r14,%rcx), %r9d
	movzbl	(%r12,%rcx), %ecx
	movq	%r10, %rax
	subq	%r9, %rax
	leaq	(%r9,%rcx,2), %rcx
	leaq	(%rax,%rdi,2), %rax
	addq	%rcx, %r10
	leaq	(%rax,%rsi,2), %rsi
	movq	%r8, %rax
	cqto
	idivq	%rbx
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	subl	%eax, %edx
	movslq	%edx, %rax
	imulq	%rbp, %rax
	movzbl	(%r14,%rax), %edi
	subq	%rdi, %rsi
	subq	%rdi, %r10
	movq	%rsi, %rdx
	movzbl	0(%r13,%rax), %esi
	movzbl	(%r12,%rax), %eax
	negq	%rax
	addq	%rsi, %rdx
	leaq	(%r10,%rax,2), %rax
	imulq	%rdx, %rdx
	subq	%rsi, %rax
	imulq	%rax, %rax
	addq	%rdx, %rax
	cmpq	$640000, %rax
	jle	.L14
	movb	$98, (%r15,%r11)
.L14:
	addq	%rbp, %r11
	cmpq	%r8, %rbx
	jne	.L15
.L18:
	addq	$1, (%rsp)
	addq	$1, 8(%rsp)
	cmpq	16(%rsp), %rbp
	jg	.L19
.L12:
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r15, %rax
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
.L25:
	.cfi_restore_state
	movq	8(%rsp), %rax
	movq	%rax, 16(%rsp)
	jmp	.L18
	.cfi_endproc
.LFE62:
	.size	sobelEdgeDetection, .-sobelEdgeDetection
	.section	.text.unlikely
.LCOLDE2:
	.text
.LHOTE2:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"w+"
.LC4:
	.string	"output.pbm"
.LC5:
	.string	"P1\n"
.LC6:
	.string	"%ld %ld\n"
	.section	.text.unlikely
.LCOLDB7:
	.text
.LHOTB7:
	.p2align 4,,15
	.globl	print_pbm
	.type	print_pbm, @function
print_pbm:
.LFB63:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r14
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	$.LC4, %edi
	xorl	%r12d, %r12d
	xorl	%r13d, %r13d
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%rsi, (%rsp)
	movl	$.LC3, %esi
	movq	%rdx, 8(%rsp)
	call	fopen
	movl	$3, %edx
	movq	%rax, %rbx
	movq	%rax, %rcx
	movl	$1, %esi
	movl	$.LC5, %edi
	call	fwrite
	xorl	%eax, %eax
	movq	%r15, %r8
	movq	%r14, %rcx
	movl	$.LC6, %edx
	movl	$1, %esi
	movq	%rbx, %rdi
	call	__fprintf_chk
	testq	%r15, %r15
	jle	.L28
	.p2align 4,,10
	.p2align 3
.L35:
	testq	%r14, %r14
	jle	.L41
	movq	8(%rsp), %rax
	leaq	(%rax,%r12), %r15
	addq	%r14, %r12
	leaq	(%rax,%r12), %rbp
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L29:
	movl	$49, %edi
	addq	$1, %r15
	call	fputc
	cmpq	%r15, %rbp
	je	.L33
.L31:
	cmpb	$32, (%r15)
	movq	%rbx, %rsi
	jne	.L29
	movl	$48, %edi
	addq	$1, %r15
	call	fputc
	cmpq	%r15, %rbp
	jne	.L31
.L33:
	movq	%rbx, %rsi
	movl	$10, %edi
	addq	$1, %r13
	call	fputc
	cmpq	%r13, (%rsp)
	jne	.L35
.L28:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbx, %rdi
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
	jmp	fclose
.L41:
	.cfi_restore_state
	addq	%r14, %r12
	jmp	.L33
	.cfi_endproc
.LFE63:
	.size	print_pbm, .-print_pbm
	.section	.text.unlikely
.LCOLDE7:
	.text
.LHOTE7:
	.section	.rodata.str1.1
.LC8:
	.string	"Height is required"
.LC9:
	.string	"height=%ld\n"
.LC10:
	.string	"size=%ld\n"
.LC11:
	.string	"pixels[1000]=%d\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC12:
	.string	"Blurred Image sizes: %zu bytes\n"
	.section	.rodata.str1.1
.LC13:
	.string	"newPixels[1000]=%d\n"
	.section	.text.unlikely
.LCOLDB23:
	.section	.text.startup,"ax",@progbits
.LHOTB23:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB64:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	cmpq	$2, %rdi
	jne	.L64
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movslq	%eax, %r12
	movl	$.LC9, %esi
	movl	$1, %edi
	imulq	$2000, %r12, %rbp
	movq	%r12, %rdx
	xorl	%eax, %eax
	call	__printf_chk
	movl	$.LC10, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	movq	%rbp, %rdx
	call	__printf_chk
	movq	%rbp, %rdi
	call	malloc
	testq	%rbp, %rbp
	movq	%rax, %rbx
	je	.L54
	movl	$32, %esi
	movq	%rbp, %rdx
	movq	%rax, %rdi
	call	memset
	movq	%rbx, %rsi
	negq	%rsi
	andl	$15, %esi
	cmpq	%rbp, %rsi
	cmova	%rbp, %rsi
	cmpq	$18, %rbp
	ja	.L65
	movq	%rbp, %rsi
.L45:
	movq	%rsi, %rcx
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L47:
	movb	%dl, (%rbx,%rdx)
	addq	$1, %rdx
	cmpq	%rsi, %rdx
	movq	%rdx, %rax
	jne	.L47
	cmpq	%rsi, %rbp
	je	.L54
.L46:
	movq	%rbp, %r9
	leaq	-1(%rbp), %rdi
	subq	%rsi, %r9
	leaq	-16(%r9), %rdx
	subq	%rsi, %rdi
	shrq	$4, %rdx
	addq	$1, %rdx
	movq	%rdx, %r8
	salq	$4, %r8
	cmpq	$14, %rdi
	jbe	.L49
	leaq	1(%rcx), %rdi
	movq	%rcx, 8(%rsp)
	addq	%rbx, %rsi
	movq	8(%rsp), %xmm2
	movq	%rdi, 8(%rsp)
	xorl	%edi, %edi
	movhps	8(%rsp), %xmm2
	movdqa	.LC14(%rip), %xmm11
	movdqa	.LC15(%rip), %xmm10
	movdqa	.LC16(%rip), %xmm9
	movdqa	.LC17(%rip), %xmm8
	movdqa	.LC18(%rip), %xmm7
	movdqa	.LC19(%rip), %xmm6
	movdqa	.LC20(%rip), %xmm5
	movdqa	.LC21(%rip), %xmm4
	movdqa	.LC22(%rip), %xmm3
.L50:
	movdqa	%xmm2, %xmm0
	movdqa	%xmm2, %xmm1
	movdqa	%xmm2, %xmm12
	movq	%rdi, %r10
	paddq	%xmm10, %xmm0
	shufps	$136, %xmm0, %xmm1
	addq	$1, %rdi
	paddq	%xmm8, %xmm12
	movdqa	%xmm2, %xmm13
	salq	$4, %r10
	cmpq	%rdi, %rdx
	movdqa	%xmm1, %xmm0
	movdqa	%xmm2, %xmm1
	paddq	%xmm4, %xmm13
	paddq	%xmm9, %xmm1
	shufps	$136, %xmm12, %xmm1
	movdqa	%xmm0, %xmm12
	punpcklwd	%xmm1, %xmm0
	punpckhwd	%xmm1, %xmm12
	movdqa	%xmm0, %xmm1
	punpcklwd	%xmm12, %xmm0
	punpckhwd	%xmm12, %xmm1
	movdqa	%xmm2, %xmm12
	paddq	%xmm6, %xmm12
	punpcklwd	%xmm1, %xmm0
	movdqa	%xmm2, %xmm1
	paddq	%xmm7, %xmm1
	shufps	$136, %xmm12, %xmm1
	movdqa	%xmm2, %xmm12
	pand	%xmm3, %xmm0
	paddq	%xmm11, %xmm2
	paddq	%xmm5, %xmm12
	shufps	$136, %xmm13, %xmm12
	movdqa	%xmm1, %xmm13
	punpcklwd	%xmm12, %xmm1
	punpckhwd	%xmm12, %xmm13
	movdqa	%xmm1, %xmm12
	punpcklwd	%xmm13, %xmm1
	punpckhwd	%xmm13, %xmm12
	punpcklwd	%xmm12, %xmm1
	pand	%xmm3, %xmm1
	packuswb	%xmm1, %xmm0
	movaps	%xmm0, (%rsi,%r10)
	ja	.L50
	addq	%r8, %rcx
	addq	%r8, %rax
	cmpq	%r8, %r9
	je	.L54
.L49:
	movb	%cl, (%rbx,%rax)
	leaq	1(%rcx), %rax
	cmpq	%rax, %rbp
	jbe	.L54
	movb	%al, 1(%rbx,%rcx)
	leaq	2(%rcx), %rax
	cmpq	%rax, %rbp
	jbe	.L54
	movb	%al, 2(%rbx,%rcx)
	leaq	3(%rcx), %rax
	cmpq	%rax, %rbp
	jbe	.L54
	movb	%al, 3(%rbx,%rcx)
	leaq	4(%rcx), %rax
	cmpq	%rax, %rbp
	jbe	.L54
	movb	%al, 4(%rbx,%rcx)
	leaq	5(%rcx), %rax
	cmpq	%rax, %rbp
	jbe	.L54
	movb	%al, 5(%rbx,%rcx)
	leaq	6(%rcx), %rax
	cmpq	%rax, %rbp
	jbe	.L54
	movb	%al, 6(%rbx,%rcx)
	leaq	7(%rcx), %rax
	cmpq	%rax, %rbp
	jbe	.L54
	movb	%al, 7(%rbx,%rcx)
	leaq	8(%rcx), %rax
	cmpq	%rax, %rbp
	jbe	.L54
	movb	%al, 8(%rbx,%rcx)
	leaq	9(%rcx), %rax
	cmpq	%rax, %rbp
	jbe	.L54
	movb	%al, 9(%rbx,%rcx)
	leaq	10(%rcx), %rax
	cmpq	%rax, %rbp
	jbe	.L54
	movb	%al, 10(%rbx,%rcx)
	leaq	11(%rcx), %rax
	cmpq	%rax, %rbp
	jbe	.L54
	movb	%al, 11(%rbx,%rcx)
	leaq	12(%rcx), %rax
	cmpq	%rax, %rbp
	jbe	.L54
	movb	%al, 12(%rbx,%rcx)
	leaq	13(%rcx), %rax
	cmpq	%rax, %rbp
	jbe	.L54
	movb	%al, 13(%rbx,%rcx)
	leaq	14(%rcx), %rax
	cmpq	%rax, %rbp
	jbe	.L54
	movb	%al, 14(%rbx,%rcx)
.L54:
	movzbl	1000(%rbx), %edx
	movl	$.LC11, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movq	%rbp, %r8
	movq	%r12, %rcx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movl	$2000, %edx
	call	sobelEdgeDetection
	movq	%rbp, %rdx
	movq	%rax, %r12
	movl	$.LC12, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movzbl	1000(%r12), %edx
	movl	$.LC13, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movq	%rbx, %rdi
	call	free
	movq	%r12, %rdi
	call	free
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L65:
	.cfi_restore_state
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	testq	%rsi, %rsi
	je	.L46
	jmp	.L45
.L64:
	movl	$1, %edi
	movl	$.LC8, %esi
	xorl	%eax, %eax
	call	__printf_chk
	orl	$-1, %edi
	call	exit
	.cfi_endproc
.LFE64:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE23:
	.section	.text.startup
.LHOTE23:
	.globl	BLACK
	.section	.rodata
	.type	BLACK, @object
	.size	BLACK, 1
BLACK:
	.byte	98
	.globl	SPACE
	.type	SPACE, @object
	.size	SPACE, 1
SPACE:
	.byte	32
	.globl	TH
	.align 8
	.type	TH, @object
	.size	TH, 8
TH:
	.quad	640000
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC14:
	.quad	16
	.quad	16
	.align 16
.LC15:
	.quad	2
	.quad	2
	.align 16
.LC16:
	.quad	4
	.quad	4
	.align 16
.LC17:
	.quad	6
	.quad	6
	.align 16
.LC18:
	.quad	8
	.quad	8
	.align 16
.LC19:
	.quad	10
	.quad	10
	.align 16
.LC20:
	.quad	12
	.quad	12
	.align 16
.LC21:
	.quad	14
	.quad	14
	.align 16
.LC22:
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.5) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
