	.text
	.file	"llvm/Fibonacci.original.copyreduced_dealloc.openmp.ll"
	.globl	fibonacci
	.p2align	4, 0x90
	.type	fibonacci,@function
fibonacci:                              # @fibonacci
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp0:
	.cfi_def_cfa_offset 16
.Ltmp1:
	.cfi_offset %rbx, -16
	movq	%rcx, %rbx
	cmpq	$1, %rbx
	jle	.LBB0_1
# BB#2:                                 # %blklab0
	leaq	-1(%rbx), %rcx
	xorl	%edx, %edx
	callq	fibonacci
	movq	-16(%rax,%rbx,8), %rcx
	addq	-8(%rax,%rbx,8), %rcx
	movq	%rcx, (%rax,%rbx,8)
	popq	%rbx
	retq
.LBB0_1:                                # %if.end
	movl	$1, %eax
	movd	%rax, %xmm0
	pslldq	$8, %xmm0               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7]
	movdqu	%xmm0, (%rdi)
	movq	%rdi, %rax
	popq	%rbx
	retq
.Lfunc_end0:
	.size	fibonacci, .Lfunc_end0-fibonacci
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI1_0:
	.quad	80                      # 0x50
	.quad	97                      # 0x61
.LCPI1_1:
	.quad	115                     # 0x73
	.quad	115                     # 0x73
.LCPI1_2:
	.quad	32                      # 0x20
	.quad	70                      # 0x46
.LCPI1_3:
	.quad	105                     # 0x69
	.quad	98                      # 0x62
.LCPI1_4:
	.quad	111                     # 0x6f
	.quad	110                     # 0x6e
.LCPI1_5:
	.quad	97                      # 0x61
	.quad	99                      # 0x63
.LCPI1_6:
	.quad	99                      # 0x63
	.quad	105                     # 0x69
.LCPI1_7:
	.quad	32                      # 0x20
	.quad	116                     # 0x74
.LCPI1_8:
	.quad	101                     # 0x65
	.quad	115                     # 0x73
.LCPI1_9:
	.quad	116                     # 0x74
	.quad	32                      # 0x20
.LCPI1_10:
	.quad	99                      # 0x63
	.quad	97                      # 0x61
.LCPI1_11:
	.quad	115                     # 0x73
	.quad	101                     # 0x65
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp2:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp3:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp4:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp5:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp6:
	.cfi_def_cfa_offset 48
.Ltmp7:
	.cfi_offset %rbx, -48
.Ltmp8:
	.cfi_offset %r12, -40
.Ltmp9:
	.cfi_offset %r13, -32
.Ltmp10:
	.cfi_offset %r14, -24
.Ltmp11:
	.cfi_offset %r15, -16
	movl	%edi, %ebx
	callq	convertArgsToIntArray
	movq	%rax, %r15
	decl	%ebx
	movslq	%ebx, %r14
	movq	(%r15), %rdi
	callq	parseStringToInt
	movq	%rax, %r12
	testq	%r12, %r12
	jne	.LBB1_1
# BB#2:                                 # %if.end91.critedge
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	free2DArray
	xorl	%edi, %edi
	callq	exit
.LBB1_1:                                # %if.then72
	movq	(%r12), %rbx
	xorl	%edi, %edi
	movl	%ebx, %esi
	callq	create1DArray
	leaq	-1(%rbx), %rcx
	xorl	%edx, %edx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	fibonacci
	movq	%rax, %r13
	movq	-24(%r13,%rbx,8), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movq	-16(%r13,%rbx,8), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movq	-8(%r13,%rbx,8), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%edi, %edi
	movl	$24, %esi
	callq	create1DArray
	movq	%rax, %rbx
	movaps	.LCPI1_0(%rip), %xmm0   # xmm0 = [80,97]
	movups	%xmm0, (%rbx)
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [115,115]
	movups	%xmm0, 16(%rbx)
	movaps	.LCPI1_2(%rip), %xmm0   # xmm0 = [32,70]
	movups	%xmm0, 32(%rbx)
	movaps	.LCPI1_3(%rip), %xmm0   # xmm0 = [105,98]
	movups	%xmm0, 48(%rbx)
	movaps	.LCPI1_4(%rip), %xmm0   # xmm0 = [111,110]
	movups	%xmm0, 64(%rbx)
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [97,99]
	movups	%xmm0, 80(%rbx)
	movaps	.LCPI1_6(%rip), %xmm0   # xmm0 = [99,105]
	movups	%xmm0, 96(%rbx)
	movaps	.LCPI1_7(%rip), %xmm0   # xmm0 = [32,116]
	movups	%xmm0, 112(%rbx)
	movaps	.LCPI1_8(%rip), %xmm0   # xmm0 = [101,115]
	movups	%xmm0, 128(%rbx)
	movaps	.LCPI1_9(%rip), %xmm0   # xmm0 = [116,32]
	movups	%xmm0, 144(%rbx)
	movaps	.LCPI1_10(%rip), %xmm0  # xmm0 = [99,97]
	movups	%xmm0, 160(%rbx)
	movaps	.LCPI1_11(%rip), %xmm0  # xmm0 = [115,101]
	movups	%xmm0, 176(%rbx)
	movl	$24, %esi
	movq	%rbx, %rdi
	callq	println_s
	movq	%r12, %rdi
	callq	free
	movq	%r13, %rdi
	callq	free
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	free2DArray
	movq	%rbx, %rdi
	callq	free
	xorl	%edi, %edi
	callq	exit
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%lld\n"
	.size	.L.str, 6


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git aec29e5973c27bcbc3c1cf54295e3778050a73cd) (http://llvm.org/git/llvm.git 4c6356e8c64e246972f760a1f05bc0f365b090ad)"
	.section	".note.GNU-stack","",@progbits
