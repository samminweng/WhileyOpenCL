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
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	leal	-1(%r8), %r14d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	leal	2(%r8), %r12d
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	48(%rsp), %r13
	leal	-1(%r9), %ebp
	movl	%edx, %r11d
	addl	$2, %r9d
	xorl	%ebx, %ebx
.L9:
	movl	%ebp, %eax
	movl	%r14d, %esi
	movq	%r13, %r10
	cltd
	idivl	%ecx
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	movl	%edx, %r8d
	subl	%eax, %r8d
	imull	%r11d, %r8d
.L8:
	movl	%esi, %eax
	addl	$1, %esi
	addq	$4, %r10
	cltd
	idivl	%r11d
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	subl	%eax, %edx
	addl	%r8d, %edx
	movslq	%edx, %rdx
	movzbl	(%rdi,%rdx), %eax
	imull	-4(%r10), %eax
	addl	%eax, %ebx
	cmpl	%esi, %r12d
	jne	.L8
	addl	$1, %ebp
	addq	$12, %r13
	cmpl	%ebp, %r9d
	jne	.L9
	movl	%ebx, %eax
	popq	%rbx
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
	movl	%ecx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%r8, %rbx
	movl	%edx, %ebp
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	movq	%rdi, 8(%rsp)
	movq	%r8, %rdi
	movq	%rsi, 16(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 120(%rsp)
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
	xorl	%r14d, %r14d
	testl	%ebp, %ebp
	movl	$-1, 32(%rsp)
	movl	$0, 36(%rsp)
	movl	$1, 40(%rsp)
	movl	$-2, 44(%rsp)
	movl	$0, 48(%rsp)
	movl	$2, 52(%rsp)
	movl	$-1, 56(%rsp)
	movl	$0, 60(%rsp)
	movl	$1, 64(%rsp)
	movl	$1, 80(%rsp)
	movl	$2, 84(%rsp)
	movl	$1, 88(%rsp)
	movl	$0, 92(%rsp)
	movl	$0, 96(%rsp)
	movl	$0, 100(%rsp)
	movl	$-1, 104(%rsp)
	movl	$-2, 108(%rsp)
	movl	$-1, 112(%rsp)
	jle	.L16
	.p2align 4,,10
	.p2align 3
.L24:
	testl	%r12d, %r12d
	jle	.L22
	movl	%r14d, %r13d
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L20:
	subq	$8, %rsp
	.cfi_def_cfa_offset 200
	movl	%ebx, %r9d
	movl	%r14d, %r8d
	leaq	40(%rsp), %rax
	movl	%r12d, %ecx
	movl	%ebp, %edx
	pushq	%rax
	.cfi_def_cfa_offset 208
	movq	32(%rsp), %rsi
	movq	24(%rsp), %rdi
	call	convolution
	popq	%rdx
	.cfi_def_cfa_offset 200
	movl	%eax, %r15d
	movl	%r12d, %ecx
	movl	%ebx, %r9d
	movl	%r14d, %r8d
	movl	%ebp, %edx
	leaq	88(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 208
	movq	32(%rsp), %rsi
	movq	24(%rsp), %rdi
	call	convolution
	movl	%r15d, %r10d
	imull	%r15d, %r10d
	imull	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 200
	popq	%rsi
	.cfi_def_cfa_offset 192
	addl	%r10d, %eax
	cmpl	$640000, %eax
	jle	.L19
	movq	24(%rsp), %rcx
	movslq	%r13d, %rax
	movb	$98, (%rcx,%rax)
.L19:
	addl	$1, %ebx
	addl	%ebp, %r13d
	cmpl	%ebx, %r12d
	jne	.L20
.L22:
	addl	$1, %r14d
	cmpl	%r14d, %ebp
	jne	.L24
.L16:
	movq	120(%rsp), %rdi
	xorq	%fs:40, %rdi
	movq	24(%rsp), %rax
	jne	.L32
	addq	$136, %rsp
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
	jle	.L35
	.p2align 4,,10
	.p2align 3
.L41:
	testl	%r14d, %r14d
	jle	.L40
	movq	16(%rsp), %rax
	movslq	%r13d, %rbx
	leaq	(%rax,%rbx), %r15
	addq	24(%rsp), %rbx
	addq	%rax, %rbx
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L36:
	movl	$49, %edi
	addq	$1, %r15
	call	fputc
	cmpq	%rbx, %r15
	je	.L40
.L38:
	cmpb	$32, (%r15)
	movq	%rbp, %rsi
	jne	.L36
	movl	$48, %edi
	addq	$1, %r15
	call	fputc
	cmpq	%rbx, %r15
	jne	.L38
.L40:
	movq	%rbp, %rsi
	movl	$10, %edi
	addl	$1, %r12d
	call	fputc
	addl	%r14d, %r13d
	cmpl	%r12d, 12(%rsp)
	jne	.L41
.L35:
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
.LCOLDB14:
	.section	.text.startup,"ax",@progbits
.LHOTB14:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB64:
	.cfi_startproc
	cmpl	$2, %edi
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	jne	.L57
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	%rax, %r12
	movl	%eax, %edx
	movl	$.LC9, %esi
	imull	$2000, %r12d, %ebx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movl	$.LC10, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	%ebx, %edx
	movslq	%ebx, %rbx
	call	__printf_chk
	movq	%rbx, %rdi
	call	malloc
	testq	%rbx, %rbx
	movq	%rax, %rbp
	leaq	(%rax,%rbx), %rdx
	je	.L51
	.p2align 4,,10
	.p2align 3
.L52:
	movb	$32, (%rax)
	addq	$1, %rax
	cmpq	%rdx, %rax
	jne	.L52
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L50:
	movb	%al, 0(%rbp,%rax)
	addq	$1, %rax
	cmpq	%rax, %rbx
	jne	.L50
.L51:
	movzbl	1000(%rbp), %edx
	movl	$.LC11, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movq	%rbx, %r8
	movl	%r12d, %ecx
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
.L57:
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
	.align 4
	.type	TH, @object
	.size	TH, 4
TH:
	.long	640000
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.5) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
