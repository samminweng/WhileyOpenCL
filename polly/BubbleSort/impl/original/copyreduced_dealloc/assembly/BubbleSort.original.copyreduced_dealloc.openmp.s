	.text
	.file	"llvm/BubbleSort.original.copyreduced_dealloc.openmp.ll"
	.globl	bubbleSort
	.p2align	4, 0x90
	.type	bubbleSort,@function
bubbleSort:                             # @bubbleSort
	.cfi_startproc
# BB#0:                                 # %entry
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_2:                                # %while.cond18.preheader
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpq	$2, %rsi
	jl	.LBB0_8
# BB#3:                                 # %polly.loop_header.preheader
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	%rsi, %r8
	decq	%r8
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_4:                                # %polly.loop_header
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rdi,%rcx,8), %rdx
	movq	8(%rdi,%rcx,8), %rax
	cmpq	%rax, %rdx
	jle	.LBB0_5
# BB#6:                                 # %polly.stmt.if.end26
                                        #   in Loop: Header=BB0_4 Depth=2
	movq	%rax, (%rdi,%rcx,8)
	movq	%rdx, 8(%rdi,%rcx,8)
	incq	%rcx
	movq	%rcx, %rsi
	jmp	.LBB0_7
	.p2align	4, 0x90
.LBB0_5:                                # %polly.loop_header.polly.stmt.blklab4_crit_edge
                                        #   in Loop: Header=BB0_4 Depth=2
	incq	%rcx
.LBB0_7:                                # %polly.stmt.blklab4
                                        #   in Loop: Header=BB0_4 Depth=2
	cmpq	%r8, %rcx
	jne	.LBB0_4
.LBB0_1:                                # %while.cond.loopexit
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
	testq	%rsi, %rsi
	jg	.LBB0_2
.LBB0_8:                                # %if.end34
	movq	%rdi, %rax
	retq
.Lfunc_end0:
	.size	bubbleSort, .Lfunc_end0-bubbleSort
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI1_0:
	.quad	9223372036854775807     # 0x7fffffffffffffff
	.quad	9223372036854775807     # 0x7fffffffffffffff
.LCPI1_1:
	.quad	9223372036854775805     # 0x7ffffffffffffffd
	.quad	9223372036854775805     # 0x7ffffffffffffffd
.LCPI1_2:
	.quad	8                       # 0x8
	.quad	8                       # 0x8
.LCPI1_3:
	.quad	9223372036854775803     # 0x7ffffffffffffffb
	.quad	9223372036854775803     # 0x7ffffffffffffffb
.LCPI1_4:
	.quad	9223372036854775801     # 0x7ffffffffffffff9
	.quad	9223372036854775801     # 0x7ffffffffffffff9
.LCPI1_5:
	.quad	80                      # 0x50
	.quad	97                      # 0x61
.LCPI1_6:
	.quad	115                     # 0x73
	.quad	115                     # 0x73
.LCPI1_7:
	.quad	32                      # 0x20
	.quad	66                      # 0x42
.LCPI1_8:
	.quad	117                     # 0x75
	.quad	98                      # 0x62
.LCPI1_9:
	.quad	98                      # 0x62
	.quad	108                     # 0x6c
.LCPI1_10:
	.quad	101                     # 0x65
	.quad	83                      # 0x53
.LCPI1_11:
	.quad	111                     # 0x6f
	.quad	114                     # 0x72
.LCPI1_12:
	.quad	116                     # 0x74
	.quad	32                      # 0x20
.LCPI1_13:
	.quad	116                     # 0x74
	.quad	101                     # 0x65
.LCPI1_14:
	.quad	115                     # 0x73
	.quad	116                     # 0x74
.LCPI1_15:
	.quad	32                      # 0x20
	.quad	99                      # 0x63
.LCPI1_16:
	.quad	97                      # 0x61
	.quad	115                     # 0x73
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
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
	pushq	%r13
.Ltmp3:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp4:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp5:
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
.Ltmp6:
	.cfi_def_cfa_offset 112
.Ltmp7:
	.cfi_offset %rbx, -56
.Ltmp8:
	.cfi_offset %r12, -48
.Ltmp9:
	.cfi_offset %r13, -40
.Ltmp10:
	.cfi_offset %r14, -32
.Ltmp11:
	.cfi_offset %r15, -24
.Ltmp12:
	.cfi_offset %rbp, -16
	movl	%edi, %ebx
	callq	convertArgsToIntArray
	movq	%rax, %r15
	decl	%ebx
	movslq	%ebx, %r14
	movq	(%r15), %rdi
	callq	parseStringToInt
	movq	%rax, %rbp
	testq	%rbp, %rbp
	je	.LBB1_15
# BB#1:                                 # %if.end8
	movq	(%rbp), %r13
	xorl	%edi, %edi
	movl	%r13d, %esi
	callq	create1DArray
	movq	%rax, %rbx
	testq	%r13, %r13
	js	.LBB1_14
# BB#2:                                 # %polly.split_new_and_old
	movabsq	$9223372036854775807, %rax # imm = 0x7FFFFFFFFFFFFFFF
	cmpq	%rax, %r13
	jne	.LBB1_17
# BB#3:                                 # %vector.body.preheader.new
	movl	$1, %eax
	movd	%rax, %xmm2
	pslldq	$8, %xmm2               # xmm2 = zero,zero,zero,zero,zero,zero,zero,zero,xmm2[0,1,2,3,4,5,6,7]
	movabsq	$-2305843009213693952, %rax # imm = 0xE000000000000000
	movdqa	.LCPI1_0(%rip), %xmm0   # xmm0 = [9223372036854775807,9223372036854775807]
	movdqa	.LCPI1_1(%rip), %xmm1   # xmm1 = [9223372036854775805,9223372036854775805]
	movdqa	.LCPI1_2(%rip), %xmm3   # xmm3 = [8,8]
	movdqa	.LCPI1_3(%rip), %xmm4   # xmm4 = [9223372036854775803,9223372036854775803]
	movdqa	.LCPI1_4(%rip), %xmm5   # xmm5 = [9223372036854775801,9223372036854775801]
	.p2align	4, 0x90
.LBB1_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movdqa	%xmm0, %xmm6
	psubq	%xmm2, %xmm6
	movdqa	%xmm1, %xmm7
	psubq	%xmm2, %xmm7
	movd	%xmm2, %rcx
	movdqu	%xmm6, (%rbx,%rcx,8)
	movdqu	%xmm7, 16(%rbx,%rcx,8)
	movdqa	%xmm4, %xmm6
	psubq	%xmm2, %xmm6
	movdqa	%xmm5, %xmm7
	psubq	%xmm2, %xmm7
	paddq	%xmm3, %xmm2
	movdqu	%xmm6, 32(%rbx,%rcx,8)
	movdqu	%xmm7, 48(%rbx,%rcx,8)
	addq	$2, %rax
	jne	.LBB1_4
	jmp	.LBB1_5
.LBB1_17:                               # %polly.parallel.for
	movq	%rbp, 32(%rsp)          # 8-byte Spill
	movq	%r14, 40(%rsp)          # 8-byte Spill
	movq	%r15, 48(%rsp)          # 8-byte Spill
	movq	%r13, 16(%rsp)
	movq	%rbx, 24(%rsp)
	leaq	1(%r13), %r8
	leaq	16(%rsp), %rsi
	movl	$main_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	movq	16(%rsp), %r15
	movq	24(%rsp), %r12
	leaq	8(%rsp), %rdi
	leaq	(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB1_22
# BB#18:
	leaq	8(%rsp), %rbp
	leaq	(%rsp), %r14
	.p2align	4, 0x90
.LBB1_20:                               # %polly.par.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_21 Depth 2
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	addq	$-2, %rax
	movq	%r15, %rdx
	subq	%rcx, %rdx
	decq	%rcx
	.p2align	4, 0x90
.LBB1_21:                               # %polly.loop_header.i165
                                        #   Parent Loop BB1_20 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rdx, 8(%r12,%rcx,8)
	incq	%rcx
	decq	%rdx
	cmpq	%rax, %rcx
	jle	.LBB1_21
# BB#19:                                # %polly.par.checkNext.loopexit.i
                                        #   in Loop: Header=BB1_20 Depth=1
	movq	%rbp, %rdi
	movq	%r14, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB1_20
.LBB1_22:                               # %main_polly_subfn.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movq	48(%rsp), %r15          # 8-byte Reload
	movq	40(%rsp), %r14          # 8-byte Reload
	movq	32(%rsp), %rbp          # 8-byte Reload
.LBB1_5:                                # %if.end28
	testq	%r13, %r13
	jle	.LBB1_14
# BB#6:
	movq	%r13, %rax
	.p2align	4, 0x90
.LBB1_8:                                # %while.cond18.preheader.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_10 Depth 2
	cmpq	$2, %rax
	jl	.LBB1_14
# BB#9:                                 # %polly.loop_header.preheader.i
                                        #   in Loop: Header=BB1_8 Depth=1
	movq	%rax, %rcx
	decq	%rcx
	xorl	%eax, %eax
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB1_10:                               # %polly.loop_header.i
                                        #   Parent Loop BB1_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rbx,%rdx,8), %rsi
	movq	8(%rbx,%rdx,8), %rdi
	cmpq	%rdi, %rsi
	jle	.LBB1_11
# BB#12:                                # %polly.stmt.if.end26.i
                                        #   in Loop: Header=BB1_10 Depth=2
	movq	%rdi, (%rbx,%rdx,8)
	movq	%rsi, 8(%rbx,%rdx,8)
	incq	%rdx
	movq	%rdx, %rax
	jmp	.LBB1_13
	.p2align	4, 0x90
.LBB1_11:                               # %polly.loop_header.polly.stmt.blklab4_crit_edge.i
                                        #   in Loop: Header=BB1_10 Depth=2
	incq	%rdx
.LBB1_13:                               # %polly.stmt.blklab4.i
                                        #   in Loop: Header=BB1_10 Depth=2
	cmpq	%rcx, %rdx
	jne	.LBB1_10
# BB#7:                                 # %while.cond.loopexit.i
                                        #   in Loop: Header=BB1_8 Depth=1
	testq	%rax, %rax
	jg	.LBB1_8
.LBB1_14:                               # %if.then74
	movq	(%rbx), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movq	-8(%rbx,%r13,8), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%edi, %edi
	movl	$25, %esi
	callq	create1DArray
	movq	%rax, %r13
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [80,97]
	movups	%xmm0, (%r13)
	movaps	.LCPI1_6(%rip), %xmm0   # xmm0 = [115,115]
	movups	%xmm0, 16(%r13)
	movaps	.LCPI1_7(%rip), %xmm0   # xmm0 = [32,66]
	movups	%xmm0, 32(%r13)
	movaps	.LCPI1_8(%rip), %xmm0   # xmm0 = [117,98]
	movups	%xmm0, 48(%r13)
	movaps	.LCPI1_9(%rip), %xmm0   # xmm0 = [98,108]
	movups	%xmm0, 64(%r13)
	movaps	.LCPI1_10(%rip), %xmm0  # xmm0 = [101,83]
	movups	%xmm0, 80(%r13)
	movaps	.LCPI1_11(%rip), %xmm0  # xmm0 = [111,114]
	movups	%xmm0, 96(%r13)
	movaps	.LCPI1_12(%rip), %xmm0  # xmm0 = [116,32]
	movups	%xmm0, 112(%r13)
	movaps	.LCPI1_13(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 128(%r13)
	movaps	.LCPI1_14(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 144(%r13)
	movaps	.LCPI1_15(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 160(%r13)
	movaps	.LCPI1_16(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 176(%r13)
	movq	$101, 192(%r13)
	movl	$25, %esi
	movq	%r13, %rdi
	callq	println_s
	movq	%rbp, %rdi
	callq	free
	movq	%rbx, %rdi
	callq	free
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	free2DArray
	movq	%r13, %rdi
	callq	free
	xorl	%edi, %edi
	callq	exit
.LBB1_15:                               # %if.end93.critedge
	movq	%r15, %rdi
	movq	%r14, %rsi
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
.Ltmp13:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp14:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp15:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp16:
	.cfi_def_cfa_offset 40
	subq	$24, %rsp
.Ltmp17:
	.cfi_def_cfa_offset 64
.Ltmp18:
	.cfi_offset %rbx, -40
.Ltmp19:
	.cfi_offset %r12, -32
.Ltmp20:
	.cfi_offset %r14, -24
.Ltmp21:
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
	.asciz	"%lld\n"
	.size	.L.str, 6


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git aec29e5973c27bcbc3c1cf54295e3778050a73cd) (http://llvm.org/git/llvm.git 4c6356e8c64e246972f760a1f05bc0f365b090ad)"
	.section	".note.GNU-stack","",@progbits
