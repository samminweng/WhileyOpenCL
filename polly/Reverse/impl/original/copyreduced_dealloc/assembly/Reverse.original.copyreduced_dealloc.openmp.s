	.text
	.file	"llvm/Reverse.original.copyreduced_dealloc.openmp.ll"
	.globl	reverse
	.p2align	4, 0x90
	.type	reverse,@function
reverse:                                # @reverse
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp0:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp1:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp2:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp3:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp4:
	.cfi_def_cfa_offset 48
.Ltmp5:
	.cfi_offset %rbx, -40
.Ltmp6:
	.cfi_offset %r14, -32
.Ltmp7:
	.cfi_offset %r15, -24
.Ltmp8:
	.cfi_offset %rbp, -16
	movl	%edx, %r14d
	movq	%rsi, %rbx
	movq	%rdi, %r15
	xorl	%edi, %edi
	callq	create1DArray
	movq	%rax, %rbp
	movq	%r15, %rax
	movq	%rbx, %rcx
	.p2align	4, 0x90
.LBB0_1:                                # %blklab2
                                        # =>This Inner Loop Header: Depth=1
	testq	%rcx, %rcx
	jle	.LBB0_4
# BB#2:                                 # %if.end18
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	(%rax), %rdx
	movq	%rdx, -8(%rbp,%rcx,8)
	decq	%rcx
	addq	$8, %rax
	cmpq	%rbx, %rcx
	jle	.LBB0_1
# BB#3:                                 # %blklab3
	movq	stderr(%rip), %rcx
	movl	$.L.str, %edi
	movl	$4, %esi
	movl	$1, %edx
	callq	fwrite
	movl	$-1, %edi
	callq	exit
.LBB0_4:                                # %blklab0
	testb	%r14b, %r14b
	je	.LBB0_6
# BB#5:                                 # %if.then22
	movq	%r15, %rdi
	callq	free
.LBB0_6:                                # %if.end29
	movq	%rbp, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end0:
	.size	reverse, .Lfunc_end0-reverse
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
	.quad	82                      # 0x52
.LCPI1_3:
	.quad	101                     # 0x65
	.quad	118                     # 0x76
.LCPI1_4:
	.quad	101                     # 0x65
	.quad	114                     # 0x72
.LCPI1_5:
	.quad	115                     # 0x73
	.quad	101                     # 0x65
.LCPI1_6:
	.quad	32                      # 0x20
	.quad	116                     # 0x74
.LCPI1_7:
	.quad	101                     # 0x65
	.quad	115                     # 0x73
.LCPI1_8:
	.quad	116                     # 0x74
	.quad	32                      # 0x20
.LCPI1_9:
	.quad	99                      # 0x63
	.quad	97                      # 0x61
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp9:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp10:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp11:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp12:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp13:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp14:
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
.Ltmp15:
	.cfi_def_cfa_offset 112
.Ltmp16:
	.cfi_offset %rbx, -56
.Ltmp17:
	.cfi_offset %r12, -48
.Ltmp18:
	.cfi_offset %r13, -40
.Ltmp19:
	.cfi_offset %r14, -32
.Ltmp20:
	.cfi_offset %r15, -24
.Ltmp21:
	.cfi_offset %rbp, -16
	movl	%edi, %ebx
	callq	convertArgsToIntArray
	movq	%rax, %r14
	decl	%ebx
	movslq	%ebx, %r15
	movq	(%r14), %rdi
	callq	parseStringToInt
	movq	%rax, %r12
	testq	%r12, %r12
	je	.LBB1_7
# BB#1:                                 # %if.end8
	movq	(%r12), %rbx
	xorl	%edi, %edi
	movl	%ebx, %esi
	callq	create1DArray
	movq	%rax, %r13
	testq	%rbx, %rbx
	jle	.LBB1_2
# BB#9:                                 # %polly.parallel.for
	movq	%r12, 32(%rsp)          # 8-byte Spill
	movq	%r15, 40(%rsp)          # 8-byte Spill
	movq	%r14, 48(%rsp)          # 8-byte Spill
	movq	%rbx, 16(%rsp)
	movq	%r13, 24(%rsp)
	leaq	16(%rsp), %rsi
	movl	$main_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%rbx, %r8
	callq	GOMP_parallel_loop_runtime_start
	movq	16(%rsp), %r15
	movq	24(%rsp), %r12
	leaq	8(%rsp), %rdi
	leaq	(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB1_14
# BB#10:
	leaq	8(%rsp), %rbp
	leaq	(%rsp), %r14
	.p2align	4, 0x90
.LBB1_12:                               # %polly.par.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_13 Depth 2
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	addq	$-2, %rax
	movq	%r15, %rdx
	subq	%rcx, %rdx
	decq	%rcx
	.p2align	4, 0x90
.LBB1_13:                               # %polly.loop_header.i
                                        #   Parent Loop BB1_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rdx, 8(%r12,%rcx,8)
	incq	%rcx
	decq	%rdx
	cmpq	%rax, %rcx
	jle	.LBB1_13
# BB#11:                                # %polly.par.checkNext.loopexit.i
                                        #   in Loop: Header=BB1_12 Depth=1
	movq	%rbp, %rdi
	movq	%r14, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB1_12
.LBB1_14:                               # %main_polly_subfn.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movq	48(%rsp), %r14          # 8-byte Reload
	movq	40(%rsp), %r15          # 8-byte Reload
	movq	32(%rsp), %r12          # 8-byte Reload
.LBB1_2:                                # %if.end28
	xorl	%edi, %edi
	movl	%ebx, %esi
	callq	create1DArray
	movq	%rax, %rbp
	movq	%r13, %rax
	movq	%rbx, %rcx
	.p2align	4, 0x90
.LBB1_3:                                # %blklab2.i
                                        # =>This Inner Loop Header: Depth=1
	testq	%rcx, %rcx
	jle	.LBB1_6
# BB#4:                                 # %if.end18.i
                                        #   in Loop: Header=BB1_3 Depth=1
	movq	(%rax), %rdx
	movq	%rdx, -8(%rbp,%rcx,8)
	decq	%rcx
	addq	$8, %rax
	cmpq	%rbx, %rcx
	jle	.LBB1_3
# BB#5:                                 # %blklab3.i
	movq	stderr(%rip), %rcx
	movl	$.L.str, %edi
	movl	$4, %esi
	movl	$1, %edx
	callq	fwrite
	movl	$-1, %edi
	callq	exit
.LBB1_6:                                # %if.then71
	movq	%r13, %rdi
	callq	free
	movq	(%rbp), %rsi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movq	-8(%rbp,%rbx,8), %rsi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%edi, %edi
	movl	$22, %esi
	callq	create1DArray
	movq	%rax, %rbx
	movaps	.LCPI1_0(%rip), %xmm0   # xmm0 = [80,97]
	movups	%xmm0, (%rbx)
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [115,115]
	movups	%xmm0, 16(%rbx)
	movaps	.LCPI1_2(%rip), %xmm0   # xmm0 = [32,82]
	movups	%xmm0, 32(%rbx)
	movaps	.LCPI1_3(%rip), %xmm0   # xmm0 = [101,118]
	movups	%xmm0, 48(%rbx)
	movaps	.LCPI1_4(%rip), %xmm0   # xmm0 = [101,114]
	movups	%xmm0, 64(%rbx)
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [115,101]
	movups	%xmm0, 80(%rbx)
	movaps	.LCPI1_6(%rip), %xmm1   # xmm1 = [32,116]
	movups	%xmm1, 96(%rbx)
	movaps	.LCPI1_7(%rip), %xmm1   # xmm1 = [101,115]
	movups	%xmm1, 112(%rbx)
	movaps	.LCPI1_8(%rip), %xmm1   # xmm1 = [116,32]
	movups	%xmm1, 128(%rbx)
	movaps	.LCPI1_9(%rip), %xmm1   # xmm1 = [99,97]
	movups	%xmm1, 144(%rbx)
	movups	%xmm0, 160(%rbx)
	movl	$22, %esi
	movq	%rbx, %rdi
	callq	printf_s
	movq	%r12, %rdi
	callq	free
	movq	%rbp, %rdi
	callq	free
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	free2DArray
	movq	%rbx, %rdi
	callq	free
	xorl	%edi, %edi
	callq	exit
.LBB1_7:                                # %if.end90.critedge
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	free2DArray
	xorl	%edi, %edi
	callq	exit
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc

	.p2align	4, 0x90
	.type	main_polly_subfn,@function
main_polly_subfn:                       # @main_polly_subfn
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp22:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp23:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp24:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp25:
	.cfi_def_cfa_offset 40
	subq	$24, %rsp
.Ltmp26:
	.cfi_def_cfa_offset 64
.Ltmp27:
	.cfi_offset %rbx, -40
.Ltmp28:
	.cfi_offset %r12, -32
.Ltmp29:
	.cfi_offset %r14, -24
.Ltmp30:
	.cfi_offset %r15, -16
	movq	(%rdi), %r12
	movq	8(%rdi), %rbx
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB2_2
# BB#1:
	leaq	16(%rsp), %r14
	leaq	8(%rsp), %r15
	.p2align	4, 0x90
.LBB2_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_5 Depth 2
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	addq	$-2, %rax
	movq	%r12, %rdx
	subq	%rcx, %rdx
	decq	%rcx
	.p2align	4, 0x90
.LBB2_5:                                # %polly.loop_header
                                        #   Parent Loop BB2_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rdx, 8(%rbx,%rcx,8)
	incq	%rcx
	decq	%rdx
	cmpq	%rax, %rcx
	jle	.LBB2_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB2_4 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB2_4
.LBB2_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Lfunc_end2:
	.size	main_polly_subfn, .Lfunc_end2-main_polly_subfn
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"fail"
	.size	.L.str, 5

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"%lld\n"
	.size	.L.str.1, 6


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git aec29e5973c27bcbc3c1cf54295e3778050a73cd) (http://llvm.org/git/llvm.git 4c6356e8c64e246972f760a1f05bc0f365b090ad)"
	.section	".note.GNU-stack","",@progbits
