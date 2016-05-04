	.text
	.file	"llvm/CoinGame.polly.enablevc.ll"
	.globl	findMoves
	.p2align	4, 0x90
	.type	findMoves,@function
findMoves:                              # @findMoves
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
.Ltmp6:
	.cfi_offset %rbx, -56
.Ltmp7:
	.cfi_offset %r12, -48
.Ltmp8:
	.cfi_offset %r13, -40
.Ltmp9:
	.cfi_offset %r14, -32
.Ltmp10:
	.cfi_offset %r15, -24
.Ltmp11:
	.cfi_offset %rbp, -16
	movabsq	$9223372036854775807, %r9 # imm = 0x7FFFFFFFFFFFFFFF
	cmpq	%r9, %rcx
	jne	.LBB0_16
# BB#1:                                 # %while.cond1.preheader.preheader
	xorl	%r10d, %r10d
	movq	%r9, %r8
	.p2align	4, 0x90
.LBB0_2:                                # %while.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movq	%r10, %r14
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_3:                                # %if.end5
                                        #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	(%rdx,%r9), %rcx
	leaq	(%r10,%rdx), %rbx
	testq	%rbx, %rbx
	jle	.LBB0_4
# BB#5:                                 # %if.end5
                                        #   in Loop: Header=BB0_3 Depth=2
	cmpq	$-3, %rcx
	movl	$0, %eax
	je	.LBB0_7
# BB#6:                                 # %if.end11
                                        #   in Loop: Header=BB0_3 Depth=2
	leaq	(%r14,%r9), %rax
	movq	-8(%rdi,%rax,8), %rax
	jmp	.LBB0_7
	.p2align	4, 0x90
.LBB0_4:                                #   in Loop: Header=BB0_3 Depth=2
	xorl	%eax, %eax
.LBB0_7:                                # %blklab4
                                        #   in Loop: Header=BB0_3 Depth=2
	cmpq	$-4, %rcx
	movl	$0, %ecx
	je	.LBB0_9
# BB#8:                                 # %if.end18
                                        #   in Loop: Header=BB0_3 Depth=2
	movq	-16(%rdi,%r14,8), %rcx
.LBB0_9:                                # %blklab5
                                        #   in Loop: Header=BB0_3 Depth=2
	leaq	1(%rdx), %r11
	cmpq	$2, %rbx
	movl	$0, %esi
	jl	.LBB0_11
# BB#10:                                # %if.end26
                                        #   in Loop: Header=BB0_3 Depth=2
	movq	-16(%rdi,%r14,8), %rsi
.LBB0_11:                               # %blklab6
                                        #   in Loop: Header=BB0_3 Depth=2
	notq	%rax
	notq	%rcx
	cmpq	%rcx, %rax
	cmovgeq	%rax, %rcx
	negq	%rcx
	leaq	-1(%rdx,%rcx), %rcx
	notq	%rsi
	cmpq	%rsi, %rax
	cmovgeq	%rax, %rsi
	subq	%rsi, %rbx
	decq	%rbx
	cmpq	%rbx, %rcx
	cmovgeq	%rcx, %rbx
	movq	%rbx, (%rdi,%r14,8)
	leaq	1(%r14,%r9), %r14
	cmpq	%r11, %r8
	movq	%r11, %rdx
	jne	.LBB0_3
# BB#12:                                # %blklab2
                                        #   in Loop: Header=BB0_2 Depth=1
	incq	%r10
	decq	%r8
	cmpq	%r9, %r10
	jne	.LBB0_2
	jmp	.LBB0_13
.LBB0_16:                               # %polly.loop_if
	testq	%rcx, %rcx
	jle	.LBB0_13
# BB#17:                                # %polly.loop_preheader
	leaq	(,%rcx,8), %r8
	leaq	8(,%rcx,8), %r11
	movq	%rcx, %r10
	shlq	$4, %r10
	xorl	%r15d, %r15d
	movq	%rdi, %r9
	.p2align	4, 0x90
.LBB0_14:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_19 Depth 2
	movq	%rcx, %r14
	subq	%r15, %r14
	jle	.LBB0_15
# BB#18:                                # %polly.loop_preheader158
                                        #   in Loop: Header=BB0_14 Depth=1
	decq	%r14
	movq	$-1, %rbp
	movq	%r9, %r13
	.p2align	4, 0x90
.LBB0_19:                               # %polly.loop_header157
                                        #   Parent Loop BB0_14 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	3(%rbp), %rax
	leaq	1(%r15,%rbp), %r12
	cmpq	%rcx, %rax
	jg	.LBB0_20
# BB#21:                                # %polly.loop_header157
                                        #   in Loop: Header=BB0_19 Depth=2
	testq	%r12, %r12
	movl	$0, %esi
	jle	.LBB0_22
# BB#25:                                # %polly.stmt.if.end11
                                        #   in Loop: Header=BB0_19 Depth=2
	movq	-8(%r8,%r13), %rsi
	jmp	.LBB0_22
	.p2align	4, 0x90
.LBB0_20:                               #   in Loop: Header=BB0_19 Depth=2
	xorl	%esi, %esi
.LBB0_22:                               # %polly.cond168
                                        #   in Loop: Header=BB0_19 Depth=2
	leaq	4(%rbp), %rax
	cmpq	%rcx, %rax
	movl	$0, %eax
	jg	.LBB0_23
# BB#26:                                # %polly.stmt.if.end18
                                        #   in Loop: Header=BB0_19 Depth=2
	movq	(%r10,%r13), %rax
.LBB0_23:                               # %polly.cond178
                                        #   in Loop: Header=BB0_19 Depth=2
	cmpq	$1, %r12
	movl	$0, %ebx
	jle	.LBB0_24
# BB#27:                                # %polly.stmt.if.end26
                                        #   in Loop: Header=BB0_19 Depth=2
	movq	-16(%r13), %rbx
.LBB0_24:                               # %polly.stmt.blklab6
                                        #   in Loop: Header=BB0_19 Depth=2
	notq	%rsi
	notq	%rax
	cmpq	%rax, %rsi
	cmovgeq	%rsi, %rax
	movq	%rbp, %rdx
	subq	%rax, %rdx
	notq	%rbx
	cmpq	%rbx, %rsi
	cmovgeq	%rsi, %rbx
	leaq	(%r15,%rbp), %rax
	subq	%rbx, %rax
	cmpq	%rax, %rdx
	cmovgeq	%rdx, %rax
	movq	%rax, (%r13)
	addq	%r11, %r13
	incq	%rbp
	cmpq	%r14, %rbp
	jl	.LBB0_19
.LBB0_15:                               # %polly.loop_exit159
                                        #   in Loop: Header=BB0_14 Depth=1
	incq	%r15
	addq	$8, %r9
	cmpq	%rcx, %r15
	jne	.LBB0_14
.LBB0_13:                               # %if.end54
	movq	%rdi, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end0:
	.size	findMoves, .Lfunc_end0-findMoves
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI1_0:
	.quad	84                      # 0x54
	.quad	104                     # 0x68
.LCPI1_1:
	.quad	101                     # 0x65
	.quad	32                      # 0x20
.LCPI1_2:
	.quad	116                     # 0x74
	.quad	111                     # 0x6f
.LCPI1_3:
	.quad	116                     # 0x74
	.quad	97                      # 0x61
.LCPI1_4:
	.quad	108                     # 0x6c
	.quad	32                      # 0x20
.LCPI1_5:
	.quad	97                      # 0x61
	.quad	109                     # 0x6d
.LCPI1_6:
	.quad	111                     # 0x6f
	.quad	117                     # 0x75
.LCPI1_7:
	.quad	110                     # 0x6e
	.quad	116                     # 0x74
.LCPI1_8:
	.quad	32                      # 0x20
	.quad	111                     # 0x6f
.LCPI1_9:
	.quad	102                     # 0x66
	.quad	32                      # 0x20
.LCPI1_10:
	.quad	109                     # 0x6d
	.quad	111                     # 0x6f
.LCPI1_11:
	.quad	110                     # 0x6e
	.quad	101                     # 0x65
.LCPI1_12:
	.quad	121                     # 0x79
	.quad	32                      # 0x20
.LCPI1_13:
	.quad	40                      # 0x28
	.quad	109                     # 0x6d
.LCPI1_14:
	.quad	97                      # 0x61
	.quad	120                     # 0x78
.LCPI1_15:
	.quad	105                     # 0x69
	.quad	109                     # 0x6d
.LCPI1_16:
	.quad	117                     # 0x75
	.quad	109                     # 0x6d
.LCPI1_17:
	.quad	41                      # 0x29
	.quad	32                      # 0x20
.LCPI1_18:
	.quad	65                      # 0x41
	.quad	108                     # 0x6c
.LCPI1_19:
	.quad	105                     # 0x69
	.quad	99                      # 0x63
.LCPI1_20:
	.quad	103                     # 0x67
	.quad	101                     # 0x65
.LCPI1_21:
	.quad	116                     # 0x74
	.quad	115                     # 0x73
.LCPI1_22:
	.quad	32                      # 0x20
	.quad	105                     # 0x69
.LCPI1_23:
	.quad	115                     # 0x73
	.quad	32                      # 0x20
.LCPI1_24:
	.quad	80                      # 0x50
	.quad	97                      # 0x61
.LCPI1_25:
	.quad	115                     # 0x73
	.quad	115                     # 0x73
.LCPI1_26:
	.quad	32                      # 0x20
	.quad	67                      # 0x43
.LCPI1_27:
	.quad	111                     # 0x6f
	.quad	105                     # 0x69
.LCPI1_28:
	.quad	110                     # 0x6e
	.quad	71                      # 0x47
.LCPI1_29:
	.quad	116                     # 0x74
	.quad	101                     # 0x65
.LCPI1_30:
	.quad	115                     # 0x73
	.quad	116                     # 0x74
.LCPI1_31:
	.quad	32                      # 0x20
	.quad	99                      # 0x63
.LCPI1_32:
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
.Ltmp12:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp13:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp14:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp15:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp16:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp17:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Ltmp18:
	.cfi_def_cfa_offset 64
.Ltmp19:
	.cfi_offset %rbx, -56
.Ltmp20:
	.cfi_offset %r12, -48
.Ltmp21:
	.cfi_offset %r13, -40
.Ltmp22:
	.cfi_offset %r14, -32
.Ltmp23:
	.cfi_offset %r15, -24
.Ltmp24:
	.cfi_offset %rbp, -16
	movl	%edi, %ebx
	callq	convertArgsToIntArray
	movq	%rax, %r15
	decl	%ebx
	movslq	%ebx, %r14
	movq	(%r15), %rdi
	callq	parseStringToInt
	testq	%rax, %rax
	jne	.LBB1_1
# BB#2:                                 # %if.end122.critedge
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	free2DArray
	xorl	%edi, %edi
	callq	exit
.LBB1_1:                                # %if.then103
	movq	(%rax), %rbx
	movl	%ebx, %esi
	imull	%esi, %esi
	xorl	%edi, %edi
	callq	gen1DArray
	xorl	%edx, %edx
	movq	%rax, %rdi
	movq	%rbx, %rcx
	callq	findMoves
	movq	%rax, %r12
	movq	-8(%r12,%rbx,8), %r13
	movl	$400, %edi              # imm = 0x190
	callq	malloc
	movq	%rax, %rbp
	movaps	.LCPI1_0(%rip), %xmm0   # xmm0 = [84,104]
	movups	%xmm0, (%rbp)
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [101,32]
	movups	%xmm0, 16(%rbp)
	movaps	%xmm0, %xmm1
	movaps	.LCPI1_2(%rip), %xmm0   # xmm0 = [116,111]
	movups	%xmm0, 32(%rbp)
	movaps	.LCPI1_3(%rip), %xmm0   # xmm0 = [116,97]
	movups	%xmm0, 48(%rbp)
	movaps	.LCPI1_4(%rip), %xmm0   # xmm0 = [108,32]
	movups	%xmm0, 64(%rbp)
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [97,109]
	movups	%xmm0, 80(%rbp)
	movaps	.LCPI1_6(%rip), %xmm0   # xmm0 = [111,117]
	movups	%xmm0, 96(%rbp)
	movaps	.LCPI1_7(%rip), %xmm0   # xmm0 = [110,116]
	movups	%xmm0, 112(%rbp)
	movaps	.LCPI1_8(%rip), %xmm0   # xmm0 = [32,111]
	movups	%xmm0, 128(%rbp)
	movaps	.LCPI1_9(%rip), %xmm0   # xmm0 = [102,32]
	movups	%xmm0, 144(%rbp)
	movaps	.LCPI1_10(%rip), %xmm0  # xmm0 = [109,111]
	movups	%xmm0, 160(%rbp)
	movaps	.LCPI1_11(%rip), %xmm0  # xmm0 = [110,101]
	movups	%xmm0, 176(%rbp)
	movaps	.LCPI1_12(%rip), %xmm0  # xmm0 = [121,32]
	movups	%xmm0, 192(%rbp)
	movaps	.LCPI1_13(%rip), %xmm0  # xmm0 = [40,109]
	movups	%xmm0, 208(%rbp)
	movaps	.LCPI1_14(%rip), %xmm0  # xmm0 = [97,120]
	movups	%xmm0, 224(%rbp)
	movaps	.LCPI1_15(%rip), %xmm0  # xmm0 = [105,109]
	movups	%xmm0, 240(%rbp)
	movaps	.LCPI1_16(%rip), %xmm0  # xmm0 = [117,109]
	movups	%xmm0, 256(%rbp)
	movaps	.LCPI1_17(%rip), %xmm0  # xmm0 = [41,32]
	movups	%xmm0, 272(%rbp)
	movaps	.LCPI1_18(%rip), %xmm0  # xmm0 = [65,108]
	movups	%xmm0, 288(%rbp)
	movaps	.LCPI1_19(%rip), %xmm0  # xmm0 = [105,99]
	movups	%xmm0, 304(%rbp)
	movups	%xmm1, 320(%rbp)
	movaps	.LCPI1_20(%rip), %xmm0  # xmm0 = [103,101]
	movups	%xmm0, 336(%rbp)
	movaps	.LCPI1_21(%rip), %xmm0  # xmm0 = [116,115]
	movups	%xmm0, 352(%rbp)
	movaps	.LCPI1_22(%rip), %xmm0  # xmm0 = [32,105]
	movups	%xmm0, 368(%rbp)
	movaps	.LCPI1_23(%rip), %xmm0  # xmm0 = [115,32]
	movups	%xmm0, 384(%rbp)
	movl	$50, %esi
	movq	%rbp, %rdi
	callq	printf_s
	movl	$.L.str, %edi
	xorl	%eax, %eax
	movq	%r13, %rsi
	callq	printf
	movl	$184, %edi
	callq	malloc
	movq	%rax, %rbx
	movaps	.LCPI1_24(%rip), %xmm0  # xmm0 = [80,97]
	movups	%xmm0, (%rbx)
	movaps	.LCPI1_25(%rip), %xmm0  # xmm0 = [115,115]
	movups	%xmm0, 16(%rbx)
	movaps	.LCPI1_26(%rip), %xmm0  # xmm0 = [32,67]
	movups	%xmm0, 32(%rbx)
	movaps	.LCPI1_27(%rip), %xmm0  # xmm0 = [111,105]
	movups	%xmm0, 48(%rbx)
	movaps	.LCPI1_28(%rip), %xmm0  # xmm0 = [110,71]
	movups	%xmm0, 64(%rbx)
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [97,109]
	movups	%xmm0, 80(%rbx)
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [101,32]
	movups	%xmm0, 96(%rbx)
	movaps	.LCPI1_29(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 112(%rbx)
	movaps	.LCPI1_30(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 128(%rbx)
	movaps	.LCPI1_31(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 144(%rbx)
	movaps	.LCPI1_32(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 160(%rbx)
	movq	$101, 176(%rbx)
	movl	$23, %esi
	movq	%rbx, %rdi
	callq	println_s
	movq	%r12, %rdi
	callq	free
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	free2DArray
	movq	%rbp, %rdi
	callq	free
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


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git f0413f80c8330e9495069bc2d1358908bba19914) (http://llvm.org/git/llvm.git 84bc70bd9cdc366afa53717cb14d6abb7f201138)"
	.section	".note.GNU-stack","",@progbits
