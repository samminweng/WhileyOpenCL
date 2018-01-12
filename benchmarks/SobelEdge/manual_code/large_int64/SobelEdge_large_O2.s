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
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	-1(%r8), %r12
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	32(%rsp), %rbx
	movq	%rdx, %r10
	subq	$1, %r9
	xorl	%r11d, %r11d
	leaq	72(%rbx), %rbp
.L9:
	movq	%r9, %rax
	xorl	%esi, %esi
	cqto
	idivq	%rcx
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	subl	%eax, %edx
	movslq	%edx, %rdx
	imulq	%r10, %rdx
	leaq	(%rdi,%rdx), %r8
.L8:
	leaq	(%r12,%rsi), %rax
	cqto
	idivq	%r10
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	subl	%eax, %edx
	movslq	%edx, %rdx
	movzbl	(%r8,%rdx), %eax
	imulq	(%rbx,%rsi,8), %rax
	addq	$1, %rsi
	addq	%rax, %r11
	cmpq	$3, %rsi
	jne	.L8
	addq	$24, %rbx
	addq	$1, %r9
	cmpq	%rbp, %rbx
	jne	.L9
	popq	%rbx
	.cfi_def_cfa_offset 24
	movq	%r11, %rax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
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
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%r8, %rbx
	movq	%rdx, %rbp
	subq	$200, %rsp
	.cfi_def_cfa_offset 256
	movq	%rdi, 8(%rsp)
	movq	%r8, %rdi
	movq	%rsi, 16(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 184(%rsp)
	xorl	%eax, %eax
	call	malloc
	testq	%rbx, %rbx
	movq	%rax, 24(%rsp)
	leaq	(%rax,%rbx), %rdx
	je	.L18
	.p2align 4,,10
	.p2align 3
.L25:
	movb	$32, (%rax)
	addq	$1, %rax
	cmpq	%rdx, %rax
	jne	.L25
.L18:
	xorl	%r13d, %r13d
	testq	%rbp, %rbp
	movq	$-1, 32(%rsp)
	movq	$0, 40(%rsp)
	movq	$1, 48(%rsp)
	movq	$-2, 56(%rsp)
	movq	$0, 64(%rsp)
	movq	$2, 72(%rsp)
	movq	$-1, 80(%rsp)
	movq	$0, 88(%rsp)
	movq	$1, 96(%rsp)
	movq	$1, 112(%rsp)
	movq	$2, 120(%rsp)
	movq	$1, 128(%rsp)
	movq	$0, 136(%rsp)
	movq	$0, 144(%rsp)
	movq	$0, 152(%rsp)
	movq	$-1, 160(%rsp)
	movq	$-2, 168(%rsp)
	movq	$-1, 176(%rsp)
	jle	.L16
	.p2align 4,,10
	.p2align 3
.L24:
	testq	%r12, %r12
	jle	.L22
	movq	%r13, %r14
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L20:
	subq	$8, %rsp
	.cfi_def_cfa_offset 264
	movq	%rbx, %r9
	movq	%r13, %r8
	leaq	40(%rsp), %rax
	movq	%r12, %rcx
	movq	%rbp, %rdx
	pushq	%rax
	.cfi_def_cfa_offset 272
	movq	32(%rsp), %rsi
	movq	24(%rsp), %rdi
	call	convolution
	popq	%rdx
	.cfi_def_cfa_offset 264
	movq	%rax, %r15
	movq	%r12, %rcx
	movq	%rbx, %r9
	movq	%r13, %r8
	movq	%rbp, %rdx
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 272
	movq	32(%rsp), %rsi
	movq	24(%rsp), %rdi
	call	convolution
	movq	%r15, %r10
	imulq	%r15, %r10
	imulq	%rax, %rax
	popq	%rcx
	.cfi_def_cfa_offset 264
	popq	%rsi
	.cfi_def_cfa_offset 256
	addq	%r10, %rax
	cmpq	$640000, %rax
	jle	.L19
	movq	24(%rsp), %rax
	movb	$98, (%rax,%r14)
.L19:
	addq	$1, %rbx
	addq	%rbp, %r14
	cmpq	%rbx, %r12
	jne	.L20
.L22:
	addq	$1, %r13
	cmpq	%r13, %rbp
	jne	.L24
.L16:
	movq	184(%rsp), %rsi
	xorq	%fs:40, %rsi
	movq	24(%rsp), %rax
	jne	.L32
	addq	$200, %rsp
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
.L32:
	.cfi_restore_state
	call	__stack_chk_fail
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
	jle	.L35
	.p2align 4,,10
	.p2align 3
.L42:
	testq	%r14, %r14
	jle	.L48
	movq	8(%rsp), %rax
	leaq	(%rax,%r12), %r15
	addq	%r14, %r12
	leaq	(%rax,%r12), %rbp
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L36:
	movl	$49, %edi
	addq	$1, %r15
	call	fputc
	cmpq	%rbp, %r15
	je	.L40
.L38:
	cmpb	$32, (%r15)
	movq	%rbx, %rsi
	jne	.L36
	movl	$48, %edi
	addq	$1, %r15
	call	fputc
	cmpq	%rbp, %r15
	jne	.L38
.L40:
	movq	%rbx, %rsi
	movl	$10, %edi
	addq	$1, %r13
	call	fputc
	cmpq	%r13, (%rsp)
	jne	.L42
.L35:
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
.L48:
	.cfi_restore_state
	addq	%r14, %r12
	jmp	.L40
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
.LCOLDB14:
	.section	.text.startup,"ax",@progbits
.LHOTB14:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB64:
	.cfi_startproc
	cmpq	$2, %rdi
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	jne	.L60
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movslq	%eax, %r12
	movl	$.LC9, %esi
	movl	$1, %edi
	imulq	$2000, %r12, %rbx
	movq	%r12, %rdx
	xorl	%eax, %eax
	call	__printf_chk
	movl	$.LC10, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	movq	%rbx, %rdx
	call	__printf_chk
	movq	%rbx, %rdi
	call	malloc
	testq	%rbx, %rbx
	movq	%rax, %rbp
	movq	%rax, %rdx
	leaq	(%rax,%rbx), %rcx
	je	.L54
	.p2align 4,,10
	.p2align 3
.L55:
	movb	$32, (%rdx)
	addq	$1, %rdx
	cmpq	%rdx, %rcx
	jne	.L55
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L53:
	movb	%dl, 0(%rbp,%rdx)
	addq	$1, %rdx
	cmpq	%rdx, %rbx
	jne	.L53
.L54:
	movzbl	1000(%rbp), %edx
	movl	$.LC11, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movq	%rbx, %r8
	movq	%r12, %rcx
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	movl	$2000, %edx
	call	sobelEdgeDetection
	movq	%rbx, %rdx
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
	movq	%rbp, %rdi
	call	free
	movq	%r12, %rdi
	call	free
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L60:
	.cfi_restore_state
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
.LCOLDE14:
	.section	.text.startup
.LHOTE14:
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
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.5) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
