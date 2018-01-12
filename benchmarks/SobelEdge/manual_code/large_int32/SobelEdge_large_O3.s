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
	movl	%edi, %eax
	sarl	$31, %eax
	xorl	%edi, %eax
	cmpl	%esi, %edi
	jge	.L6
	rep ret
	.p2align 4,,10
	.p2align 3
.L6:
	notl	%edi
	leal	(%rdi,%rsi,2), %eax
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
	leal	-1(%r8), %eax
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%edx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	cltd
	movq	32(%rsp), %rbp
	idivl	%r12d
	movl	%edx, %eax
	movl	%edx, %ebx
	sarl	$31, %eax
	xorl	%eax, %ebx
	subl	%eax, %ebx
	movl	%r8d, %eax
	cltd
	idivl	%r12d
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	movl	%edx, %r11d
	subl	%eax, %r11d
	leal	1(%r8), %eax
	cltd
	idivl	%r12d
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	movl	%edx, %r8d
	subl	%eax, %r8d
	leal	-1(%r9), %eax
	cltd
	idivl	%ecx
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	movl	%edx, %esi
	subl	%eax, %esi
	imull	%r12d, %esi
	leal	(%r11,%rsi), %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	imull	4(%rbp), %eax
	movl	%eax, %edx
	leal	(%rbx,%rsi), %eax
	addl	%r8d, %esi
	movslq	%esi, %rsi
	cltq
	movzbl	(%rdi,%rsi), %esi
	movzbl	(%rdi,%rax), %eax
	imull	0(%rbp), %eax
	imull	8(%rbp), %esi
	addl	%edx, %eax
	addl	%eax, %esi
	movl	%r9d, %eax
	cltd
	idivl	%ecx
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	movl	%edx, %r10d
	subl	%eax, %r10d
	imull	%r12d, %r10d
	leal	(%r10,%rbx), %eax
	cltq
	movzbl	(%rdi,%rax), %eax
	imull	12(%rbp), %eax
	leal	(%rax,%rsi), %edx
	leal	(%r10,%r11), %eax
	addl	%r8d, %r10d
	movslq	%r10d, %r10
	cltq
	movzbl	(%rdi,%rax), %esi
	imull	16(%rbp), %esi
	leal	(%rsi,%rdx), %eax
	movzbl	(%rdi,%r10), %esi
	imull	20(%rbp), %esi
	addl	%eax, %esi
	leal	1(%r9), %eax
	cltd
	idivl	%ecx
	movl	%edx, %ecx
	movl	%edx, %eax
	sarl	$31, %ecx
	xorl	%ecx, %eax
	subl	%ecx, %eax
	imull	%eax, %r12d
	addl	%r12d, %ebx
	addl	%r12d, %r11d
	addl	%r12d, %r8d
	movslq	%ebx, %rbx
	movslq	%r11d, %r11
	movslq	%r8d, %r8
	movzbl	(%rdi,%rbx), %ecx
	movzbl	(%rdi,%r11), %eax
	imull	24(%rbp), %ecx
	imull	28(%rbp), %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	addl	%esi, %ecx
	leal	(%rax,%rcx), %esi
	movzbl	(%rdi,%r8), %eax
	imull	32(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	addl	%esi, %eax
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
	movl	%edx, %r15d
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
	movq	%rdi, %rbx
	movq	%r8, %rdi
	movl	%ecx, %ebp
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	call	malloc
	testq	%r12, %r12
	movq	%rax, 8(%rsp)
	je	.L13
	movq	%rax, %rdi
	movq	%r12, %rdx
	movl	$32, %esi
	call	memset
.L13:
	testl	%r15d, %r15d
	movl	$1, 24(%rsp)
	movl	$0, 20(%rsp)
	jle	.L12
	.p2align 4,,10
	.p2align 3
.L19:
	testl	%ebp, %ebp
	jle	.L24
	movl	20(%rsp), %esi
	movl	24(%rsp), %edi
	xorl	%r8d, %r8d
	movl	%esi, %eax
	movl	%edi, 28(%rsp)
	movl	%esi, %r12d
	subl	$1, %eax
	cltd
	idivl	%r15d
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	movl	%edx, %r11d
	subl	%eax, %r11d
	movl	%esi, %eax
	cltd
	idivl	%r15d
	movl	%edi, %eax
	movl	%edx, %r14d
	cltd
	idivl	%r15d
	movslq	%edx, %rax
	movslq	%r11d, %rdx
	movzbl	(%rbx,%rax), %r9d
	movzbl	(%rbx,%rdx), %edi
	movq	%rax, %r13
	movl	%r9d, %esi
	.p2align 4,,10
	.p2align 3
.L15:
	leal	-1(%r8), %eax
	negl	%edi
	addl	$1, %r8d
	cltd
	idivl	%ebp
	movl	%edx, %eax
	movl	%edx, %ecx
	sarl	$31, %eax
	xorl	%eax, %ecx
	subl	%eax, %ecx
	imull	%r15d, %ecx
	leal	(%r11,%rcx), %eax
	cltq
	movzbl	(%rbx,%rax), %r9d
	leal	0(%r13,%rcx), %eax
	addl	%r14d, %ecx
	movslq	%ecx, %rcx
	cltq
	movzbl	(%rbx,%rcx), %ecx
	movzbl	(%rbx,%rax), %r10d
	leal	(%r9,%rcx,2), %ecx
	movl	%r10d, %eax
	subl	%r9d, %eax
	addl	%ecx, %r10d
	leal	(%rax,%rdi,2), %eax
	leal	(%rax,%rsi,2), %esi
	movl	%r8d, %eax
	cltd
	idivl	%ebp
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	subl	%eax, %edx
	imull	%r15d, %edx
	leal	(%r11,%rdx), %eax
	cltq
	movzbl	(%rbx,%rax), %edi
	movl	%esi, %eax
	leal	0(%r13,%rdx), %esi
	addl	%r14d, %edx
	movslq	%edx, %rdx
	movslq	%esi, %rsi
	movzbl	(%rbx,%rdx), %edx
	movzbl	(%rbx,%rsi), %esi
	subl	%edi, %r10d
	subl	%edi, %eax
	negl	%edx
	addl	%esi, %eax
	leal	(%r10,%rdx,2), %edx
	imull	%eax, %eax
	subl	%esi, %edx
	imull	%edx, %edx
	addl	%edx, %eax
	cmpl	$640000, %eax
	jle	.L14
	movq	8(%rsp), %rcx
	movslq	%r12d, %rax
	movb	$98, (%rcx,%rax)
.L14:
	addl	%r15d, %r12d
	cmpl	%r8d, %ebp
	jne	.L15
.L18:
	addl	$1, 20(%rsp)
	addl	$1, 24(%rsp)
	cmpl	28(%rsp), %r15d
	jg	.L19
.L12:
	movq	8(%rsp), %rax
	addq	$40, %rsp
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
.L24:
	.cfi_restore_state
	movl	24(%rsp), %eax
	movl	%eax, 28(%rsp)
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
	.string	"%d %d\n"
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
	movl	%edi, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	$.LC4, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%esi, %ebx
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movl	%esi, 12(%rsp)
	movl	$.LC3, %esi
	movq	%rdx, 16(%rsp)
	call	fopen
	movl	$3, %edx
	movq	%rax, %rbp
	movq	%rax, %rcx
	movl	$1, %esi
	movl	$.LC5, %edi
	call	fwrite
	xorl	%eax, %eax
	movl	%ebx, %r8d
	movl	%r14d, %ecx
	movl	$.LC6, %edx
	movl	$1, %esi
	movq	%rbp, %rdi
	call	__fprintf_chk
	leal	-1(%r14), %eax
	addq	$1, %rax
	testl	%ebx, %ebx
	movq	%rax, 24(%rsp)
	jle	.L27
	.p2align 4,,10
	.p2align 3
.L33:
	testl	%r14d, %r14d
	jle	.L32
	movq	16(%rsp), %rax
	movslq	%r13d, %rbx
	leaq	(%rax,%rbx), %r15
	addq	24(%rsp), %rbx
	addq	%rax, %rbx
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L28:
	movl	$49, %edi
	addq	$1, %r15
	call	fputc
	cmpq	%rbx, %r15
	je	.L32
.L30:
	cmpb	$32, (%r15)
	movq	%rbp, %rsi
	jne	.L28
	movl	$48, %edi
	addq	$1, %r15
	call	fputc
	cmpq	%rbx, %r15
	jne	.L30
.L32:
	movq	%rbp, %rsi
	movl	$10, %edi
	addl	$1, %r12d
	call	fputc
	addl	%r14d, %r13d
	cmpl	%r12d, 12(%rsp)
	jne	.L33
.L27:
	addq	$40, %rsp
	.cfi_def_cfa_offset 56
	movq	%rbp, %rdi
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
	.string	"height=%d\n"
.LC10:
	.string	"size=%d\n"
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
.LCOLDB20:
	.section	.text.startup,"ax",@progbits
.LHOTB20:
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
	cmpl	$2, %edi
	jne	.L75
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	%rax, %r12
	movl	%eax, %edx
	movl	$.LC9, %esi
	imull	$2000, %r12d, %ebp
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movl	$.LC10, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	%ebp, %edx
	movslq	%ebp, %rbp
	call	__printf_chk
	movq	%rbp, %rdi
	call	malloc
	testq	%rbp, %rbp
	movq	%rax, %rbx
	je	.L50
	movq	%rbp, %rdx
	movl	$32, %esi
	movq	%rax, %rdi
	call	memset
	movq	%rbx, %rax
	negq	%rax
	andl	$15, %eax
	cmpq	%rbp, %rax
	cmova	%rbp, %rax
	cmpq	$17, %rbp
	ja	.L76
	movq	%rbp, %rax
.L41:
	cmpq	$1, %rax
	movb	$0, (%rbx)
	je	.L53
	cmpq	$2, %rax
	movb	$1, 1(%rbx)
	je	.L54
	cmpq	$3, %rax
	movb	$2, 2(%rbx)
	je	.L55
	cmpq	$4, %rax
	movb	$3, 3(%rbx)
	je	.L56
	cmpq	$5, %rax
	movb	$4, 4(%rbx)
	je	.L57
	cmpq	$6, %rax
	movb	$5, 5(%rbx)
	je	.L58
	cmpq	$7, %rax
	movb	$6, 6(%rbx)
	je	.L59
	cmpq	$8, %rax
	movb	$7, 7(%rbx)
	je	.L60
	cmpq	$9, %rax
	movb	$8, 8(%rbx)
	je	.L61
	cmpq	$10, %rax
	movb	$9, 9(%rbx)
	je	.L62
	cmpq	$11, %rax
	movb	$10, 10(%rbx)
	je	.L63
	cmpq	$12, %rax
	movb	$11, 11(%rbx)
	je	.L64
	cmpq	$13, %rax
	movb	$12, 12(%rbx)
	je	.L65
	cmpq	$14, %rax
	movb	$13, 13(%rbx)
	je	.L66
	cmpq	$15, %rax
	movb	$14, 14(%rbx)
	je	.L67
	cmpq	$17, %rax
	movb	$15, 15(%rbx)
	jne	.L68
	movb	$16, 16(%rbx)
	movl	$17, %edx
	movl	$17, %ecx
.L43:
	cmpq	%rax, %rbp
	je	.L50
	movq	%rax, %rsi
	movq	%rdx, %rax
.L42:
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
	jbe	.L45
	movl	%ecx, 12(%rsp)
	addq	%rbx, %rsi
	xorl	%edi, %edi
	movd	12(%rsp), %xmm6
	movdqa	.LC15(%rip), %xmm9
	pshufd	$0, %xmm6, %xmm1
	movdqa	.LC16(%rip), %xmm8
	movdqa	.LC17(%rip), %xmm7
	paddd	.LC14(%rip), %xmm1
	movdqa	.LC18(%rip), %xmm6
	movdqa	.LC19(%rip), %xmm3
.L46:
	movdqa	%xmm1, %xmm2
	movdqa	%xmm1, %xmm4
	movdqa	%xmm1, %xmm0
	movq	%rdi, %r10
	paddd	%xmm8, %xmm2
	punpcklwd	%xmm2, %xmm4
	addq	$1, %rdi
	punpckhwd	%xmm2, %xmm0
	salq	$4, %r10
	movdqa	%xmm1, %xmm5
	cmpq	%rdi, %rdx
	movdqa	%xmm4, %xmm2
	punpckhwd	%xmm0, %xmm4
	paddd	%xmm6, %xmm5
	punpcklwd	%xmm0, %xmm2
	movdqa	%xmm1, %xmm0
	paddd	%xmm9, %xmm1
	paddd	%xmm7, %xmm0
	punpcklwd	%xmm4, %xmm2
	movdqa	%xmm0, %xmm4
	punpcklwd	%xmm5, %xmm0
	punpckhwd	%xmm5, %xmm4
	movdqa	%xmm0, %xmm5
	pand	%xmm3, %xmm2
	punpckhwd	%xmm4, %xmm5
	punpcklwd	%xmm4, %xmm0
	punpcklwd	%xmm5, %xmm0
	pand	%xmm3, %xmm0
	packuswb	%xmm0, %xmm2
	movaps	%xmm2, (%rsi,%r10)
	ja	.L46
	addl	%r8d, %ecx
	addq	%r8, %rax
	cmpq	%r8, %r9
	je	.L50
.L45:
	leal	1(%rcx), %edx
	movb	%cl, (%rbx,%rax)
	movslq	%edx, %rax
	cmpq	%rax, %rbp
	jbe	.L50
	movb	%dl, (%rbx,%rax)
	leal	2(%rcx), %edx
	movslq	%edx, %rax
	cmpq	%rax, %rbp
	jbe	.L50
	movb	%dl, (%rbx,%rax)
	leal	3(%rcx), %edx
	movslq	%edx, %rax
	cmpq	%rax, %rbp
	jbe	.L50
	movb	%dl, (%rbx,%rax)
	leal	4(%rcx), %edx
	movslq	%edx, %rax
	cmpq	%rax, %rbp
	jbe	.L50
	movb	%dl, (%rbx,%rax)
	leal	5(%rcx), %edx
	movslq	%edx, %rax
	cmpq	%rax, %rbp
	jbe	.L50
	movb	%dl, (%rbx,%rax)
	leal	6(%rcx), %edx
	movslq	%edx, %rax
	cmpq	%rax, %rbp
	jbe	.L50
	movb	%dl, (%rbx,%rax)
	leal	7(%rcx), %edx
	movslq	%edx, %rax
	cmpq	%rax, %rbp
	jbe	.L50
	movb	%dl, (%rbx,%rax)
	leal	8(%rcx), %edx
	movslq	%edx, %rax
	cmpq	%rax, %rbp
	jbe	.L50
	movb	%dl, (%rbx,%rax)
	leal	9(%rcx), %edx
	movslq	%edx, %rax
	cmpq	%rax, %rbp
	jbe	.L50
	movb	%dl, (%rbx,%rax)
	leal	10(%rcx), %edx
	movslq	%edx, %rax
	cmpq	%rax, %rbp
	jbe	.L50
	movb	%dl, (%rbx,%rax)
	leal	11(%rcx), %edx
	movslq	%edx, %rax
	cmpq	%rax, %rbp
	jbe	.L50
	movb	%dl, (%rbx,%rax)
	leal	12(%rcx), %edx
	movslq	%edx, %rax
	cmpq	%rax, %rbp
	jbe	.L50
	movb	%dl, (%rbx,%rax)
	leal	13(%rcx), %edx
	movslq	%edx, %rax
	cmpq	%rax, %rbp
	jbe	.L50
	movb	%dl, (%rbx,%rax)
	leal	14(%rcx), %eax
	movslq	%eax, %rdx
	cmpq	%rdx, %rbp
	jbe	.L50
	movb	%al, (%rbx,%rdx)
.L50:
	movzbl	1000(%rbx), %edx
	movl	$.LC11, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movq	%rbp, %r8
	movl	%r12d, %ecx
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
.L76:
	.cfi_restore_state
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	testq	%rax, %rax
	je	.L42
	jmp	.L41
.L68:
	movl	$16, %edx
	movl	$16, %ecx
	jmp	.L43
.L59:
	movl	$7, %edx
	movl	$7, %ecx
	jmp	.L43
.L60:
	movl	$8, %edx
	movl	$8, %ecx
	jmp	.L43
.L61:
	movl	$9, %edx
	movl	$9, %ecx
	jmp	.L43
.L62:
	movl	$10, %edx
	movl	$10, %ecx
	jmp	.L43
.L63:
	movl	$11, %edx
	movl	$11, %ecx
	jmp	.L43
.L64:
	movl	$12, %edx
	movl	$12, %ecx
	jmp	.L43
.L65:
	movl	$13, %edx
	movl	$13, %ecx
	jmp	.L43
.L66:
	movl	$14, %edx
	movl	$14, %ecx
	jmp	.L43
.L55:
	movl	$3, %edx
	movl	$3, %ecx
	jmp	.L43
.L56:
	movl	$4, %edx
	movl	$4, %ecx
	jmp	.L43
.L57:
	movl	$5, %edx
	movl	$5, %ecx
	jmp	.L43
.L58:
	movl	$6, %edx
	movl	$6, %ecx
	jmp	.L43
.L53:
	movl	$1, %edx
	movl	$1, %ecx
	jmp	.L43
.L54:
	movl	$2, %edx
	movl	$2, %ecx
	jmp	.L43
.L67:
	movl	$15, %edx
	movl	$15, %ecx
	jmp	.L43
.L75:
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
.LCOLDE20:
	.section	.text.startup
.LHOTE20:
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
	.align 4
	.type	TH, @object
	.size	TH, 4
TH:
	.long	640000
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC14:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC15:
	.long	16
	.long	16
	.long	16
	.long	16
	.align 16
.LC16:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC17:
	.long	8
	.long	8
	.long	8
	.long	8
	.align 16
.LC18:
	.long	12
	.long	12
	.long	12
	.long	12
	.align 16
.LC19:
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
