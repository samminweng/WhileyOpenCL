	.text
	.file	"llvm/CoinGame.openmp.enablevc.ll"
	.globl	max
	.p2align	4, 0x90
	.type	max,@function
max:                                    # @max
	.cfi_startproc
# BB#0:                                 # %entry
	cmpq	%rsi, %rdi
	cmovlq	%rsi, %rdi
	movq	%rdi, %rax
	retq
.Lfunc_end0:
	.size	max, .Lfunc_end0-max
	.cfi_endproc

	.globl	min
	.p2align	4, 0x90
	.type	min,@function
min:                                    # @min
	.cfi_startproc
# BB#0:                                 # %entry
	cmpq	%rsi, %rdi
	cmovleq	%rdi, %rsi
	movq	%rsi, %rax
	retq
.Lfunc_end1:
	.size	min, .Lfunc_end1-min
	.cfi_endproc

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
	testq	%rcx, %rcx
	jle	.LBB2_36
# BB#1:                                 # %while.cond1.preheader.lr.ph
	leaq	8(,%rcx,8), %r13
	leaq	(%rcx,%rcx), %rax
	movq	%rax, -16(%rsp)         # 8-byte Spill
	movq	%rcx, %rax
	shlq	$4, %rax
	addq	%rdi, %rax
	movq	%rax, -32(%rsp)         # 8-byte Spill
	movq	%rcx, %rax
	negq	%rax
	movq	%rax, -40(%rsp)         # 8-byte Spill
	leaq	-8(%rdi,%rcx,8), %r12
	movabsq	$1152921504606846975, %rax # imm = 0xFFFFFFFFFFFFFFF
	movabsq	$9223372036854775805, %r15 # imm = 0x7FFFFFFFFFFFFFFD
	xorl	%edx, %edx
	incq	%rax
	movq	%rax, -24(%rsp)         # 8-byte Spill
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB2_2:                                # %while.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_4 Depth 2
                                        #     Child Loop BB2_7 Depth 2
	movq	-16(%rsp), %rax         # 8-byte Reload
	leaq	(%r10,%rax), %rax
	cmpq	-24(%rsp), %rax         # 8-byte Folded Reload
	movq	%rdx, -8(%rsp)          # 8-byte Spill
	jge	.LBB2_3
# BB#6:                                 # %if.end5.us.preheader
                                        #   in Loop: Header=BB2_2 Depth=1
	movq	-40(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%r10), %r8
	movq	%rdx, %rax
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB2_7:                                # %if.end5.us
                                        #   Parent Loop BB2_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%r14, %rbp
	leaq	(%r10,%rbp), %rdx
	leaq	1(%rbp), %r14
	testq	%rdx, %rdx
	jle	.LBB2_8
# BB#9:                                 # %if.end5.us
                                        #   in Loop: Header=BB2_7 Depth=2
	cmpq	%rcx, %r14
	movl	$0, %r9d
	jge	.LBB2_11
# BB#10:                                # %if.end11.us
                                        #   in Loop: Header=BB2_7 Depth=2
	movq	(%r12,%rax), %r9
	jmp	.LBB2_11
	.p2align	4, 0x90
.LBB2_8:                                #   in Loop: Header=BB2_7 Depth=2
	xorl	%r9d, %r9d
.LBB2_11:                               # %polly.preload.cond.us
                                        #   in Loop: Header=BB2_7 Depth=2
	cmpq	$1, %rdx
	setg	%r11b
	leaq	19(%r15), %rsi
	cmpq	%rsi, %rax
	setl	%bl
	testb	%bl, %r11b
	jne	.LBB2_16
# BB#12:                                # %polly.preload.cond.us
                                        #   in Loop: Header=BB2_7 Depth=2
	leaq	3(%rbp), %rsi
	cmpq	%rcx, %rsi
	jle	.LBB2_16
# BB#13:                                # %polly.preload.cond.us
                                        #   in Loop: Header=BB2_7 Depth=2
	movabsq	$1152921504606846975, %rsi # imm = 0xFFFFFFFFFFFFFFF
	cmpq	%rsi, %r10
	jg	.LBB2_16
# BB#14:                                # %polly.preload.cond.us
                                        #   in Loop: Header=BB2_7 Depth=2
	cmpq	%r15, %rbp
	jg	.LBB2_16
# BB#15:                                # %polly.preload.cond.us
                                        #   in Loop: Header=BB2_7 Depth=2
	leaq	18(%r15), %rsi
	cmpq	%rsi, %rax
	movl	$0, %ebx
	movl	$0, %esi
	jle	.LBB2_21
	.p2align	4, 0x90
.LBB2_16:                               # %blklab8.us
                                        #   in Loop: Header=BB2_7 Depth=2
	leaq	2(%rbp), %rsi
	cmpq	%rcx, %rsi
	movl	$0, %esi
	jge	.LBB2_18
# BB#17:                                # %if.end18.us
                                        #   in Loop: Header=BB2_7 Depth=2
	movq	-32(%rsp), %rsi         # 8-byte Reload
	movq	(%rsi,%rax), %rsi
.LBB2_18:                               # %blklab9.us
                                        #   in Loop: Header=BB2_7 Depth=2
	cmpq	$2, %rdx
	jge	.LBB2_20
# BB#19:                                #   in Loop: Header=BB2_7 Depth=2
	xorl	%ebx, %ebx
	jmp	.LBB2_21
	.p2align	4, 0x90
.LBB2_20:                               # %if.end26.us
                                        #   in Loop: Header=BB2_7 Depth=2
	movq	-16(%rdi,%rax), %rbx
.LBB2_21:                               # %blklab10.us
                                        #   in Loop: Header=BB2_7 Depth=2
	notq	%rsi
	notq	%r9
	cmpq	%r9, %rsi
	cmovlq	%r9, %rsi
	negq	%rsi
	leaq	-1(%rbp,%rsi), %rsi
	notq	%rbx
	cmpq	%r9, %rbx
	cmovlq	%r9, %rbx
	subq	%rbx, %rdx
	decq	%rdx
	cmpq	%rdx, %rsi
	cmovgeq	%rsi, %rdx
	movq	%rdx, (%rdi,%rax)
	addq	%r13, %rax
	movq	%r8, %rdx
	addq	%r14, %rdx
	jne	.LBB2_7
	jmp	.LBB2_35
	.p2align	4, 0x90
.LBB2_3:                                # %if.end5.preheader
                                        #   in Loop: Header=BB2_2 Depth=1
	movq	-40(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%r10), %r14
	movq	%rdx, %rax
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB2_4:                                # %if.end5
                                        #   Parent Loop BB2_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%r9, %rbp
	leaq	(%r10,%rbp), %r8
	leaq	1(%rbp), %r9
	testq	%r8, %r8
	jle	.LBB2_5
# BB#22:                                # %if.end5
                                        #   in Loop: Header=BB2_4 Depth=2
	cmpq	%rcx, %r9
	movl	$0, %esi
	jge	.LBB2_24
# BB#23:                                # %if.end11
                                        #   in Loop: Header=BB2_4 Depth=2
	movq	(%r12,%rax), %rsi
	jmp	.LBB2_24
	.p2align	4, 0x90
.LBB2_5:                                #   in Loop: Header=BB2_4 Depth=2
	xorl	%esi, %esi
.LBB2_24:                               # %polly.preload.cond
                                        #   in Loop: Header=BB2_4 Depth=2
	cmpq	$1, %r8
	setg	%dl
	leaq	19(%r15), %rbx
	cmpq	%rbx, %rax
	setl	%bl
	testb	%bl, %dl
	jne	.LBB2_29
# BB#25:                                # %polly.preload.cond
                                        #   in Loop: Header=BB2_4 Depth=2
	leaq	3(%rbp), %rdx
	cmpq	%rcx, %rdx
	jle	.LBB2_29
# BB#26:                                # %polly.preload.cond
                                        #   in Loop: Header=BB2_4 Depth=2
	movabsq	$1152921504606846975, %rdx # imm = 0xFFFFFFFFFFFFFFF
	cmpq	%rdx, %r10
	jg	.LBB2_29
# BB#27:                                # %polly.preload.cond
                                        #   in Loop: Header=BB2_4 Depth=2
	cmpq	%r15, %rbp
	jg	.LBB2_29
# BB#28:                                # %polly.preload.cond
                                        #   in Loop: Header=BB2_4 Depth=2
	leaq	18(%r15), %rdx
	cmpq	%rdx, %rax
	movl	$0, %edx
	movl	$0, %ebx
	jle	.LBB2_34
	.p2align	4, 0x90
.LBB2_29:                               # %blklab8
                                        #   in Loop: Header=BB2_4 Depth=2
	leaq	2(%rbp), %rdx
	cmpq	%rcx, %rdx
	movl	$0, %ebx
	jge	.LBB2_31
# BB#30:                                # %if.end18
                                        #   in Loop: Header=BB2_4 Depth=2
	movq	-32(%rsp), %rdx         # 8-byte Reload
	movq	(%rdx,%rax), %rbx
.LBB2_31:                               # %blklab9
                                        #   in Loop: Header=BB2_4 Depth=2
	cmpq	$2, %r8
	jge	.LBB2_33
# BB#32:                                #   in Loop: Header=BB2_4 Depth=2
	xorl	%edx, %edx
	jmp	.LBB2_34
	.p2align	4, 0x90
.LBB2_33:                               # %if.end26
                                        #   in Loop: Header=BB2_4 Depth=2
	movq	-16(%rdi,%rax), %rdx
.LBB2_34:                               # %blklab10
                                        #   in Loop: Header=BB2_4 Depth=2
	notq	%rbx
	notq	%rsi
	cmpq	%rsi, %rbx
	cmovlq	%rsi, %rbx
	negq	%rbx
	leaq	-1(%rbp,%rbx), %rbp
	notq	%rdx
	cmpq	%rsi, %rdx
	cmovlq	%rsi, %rdx
	subq	%rdx, %r8
	decq	%r8
	cmpq	%r8, %rbp
	cmovgeq	%rbp, %r8
	movq	%r8, (%rdi,%rax)
	addq	%r13, %rax
	movq	%r14, %rdx
	addq	%r9, %rdx
	jne	.LBB2_4
.LBB2_35:                               # %blklab6
                                        #   in Loop: Header=BB2_2 Depth=1
	incq	%r10
	movq	-8(%rsp), %rdx          # 8-byte Reload
	addq	$8, %rdx
	cmpq	%rcx, %r10
	jne	.LBB2_2
.LBB2_36:                               # %if.end42
	movq	%rdi, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end2:
	.size	findMoves, .Lfunc_end2-findMoves
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI3_0:
	.quad	84                      # 0x54
	.quad	104                     # 0x68
.LCPI3_1:
	.quad	101                     # 0x65
	.quad	32                      # 0x20
.LCPI3_2:
	.quad	116                     # 0x74
	.quad	111                     # 0x6f
.LCPI3_3:
	.quad	116                     # 0x74
	.quad	97                      # 0x61
.LCPI3_4:
	.quad	108                     # 0x6c
	.quad	32                      # 0x20
.LCPI3_5:
	.quad	97                      # 0x61
	.quad	109                     # 0x6d
.LCPI3_6:
	.quad	111                     # 0x6f
	.quad	117                     # 0x75
.LCPI3_7:
	.quad	110                     # 0x6e
	.quad	116                     # 0x74
.LCPI3_8:
	.quad	32                      # 0x20
	.quad	111                     # 0x6f
.LCPI3_9:
	.quad	102                     # 0x66
	.quad	32                      # 0x20
.LCPI3_10:
	.quad	109                     # 0x6d
	.quad	111                     # 0x6f
.LCPI3_11:
	.quad	110                     # 0x6e
	.quad	101                     # 0x65
.LCPI3_12:
	.quad	121                     # 0x79
	.quad	32                      # 0x20
.LCPI3_13:
	.quad	40                      # 0x28
	.quad	109                     # 0x6d
.LCPI3_14:
	.quad	97                      # 0x61
	.quad	120                     # 0x78
.LCPI3_15:
	.quad	105                     # 0x69
	.quad	109                     # 0x6d
.LCPI3_16:
	.quad	117                     # 0x75
	.quad	109                     # 0x6d
.LCPI3_17:
	.quad	41                      # 0x29
	.quad	32                      # 0x20
.LCPI3_18:
	.quad	65                      # 0x41
	.quad	108                     # 0x6c
.LCPI3_19:
	.quad	105                     # 0x69
	.quad	99                      # 0x63
.LCPI3_20:
	.quad	103                     # 0x67
	.quad	101                     # 0x65
.LCPI3_21:
	.quad	116                     # 0x74
	.quad	115                     # 0x73
.LCPI3_22:
	.quad	32                      # 0x20
	.quad	105                     # 0x69
.LCPI3_23:
	.quad	115                     # 0x73
	.quad	32                      # 0x20
.LCPI3_24:
	.quad	80                      # 0x50
	.quad	97                      # 0x61
.LCPI3_25:
	.quad	115                     # 0x73
	.quad	115                     # 0x73
.LCPI3_26:
	.quad	32                      # 0x20
	.quad	67                      # 0x43
.LCPI3_27:
	.quad	111                     # 0x6f
	.quad	105                     # 0x69
.LCPI3_28:
	.quad	110                     # 0x6e
	.quad	71                      # 0x47
.LCPI3_29:
	.quad	116                     # 0x74
	.quad	101                     # 0x65
.LCPI3_30:
	.quad	115                     # 0x73
	.quad	116                     # 0x74
.LCPI3_31:
	.quad	32                      # 0x20
	.quad	99                      # 0x63
.LCPI3_32:
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
	jne	.LBB3_1
# BB#2:                                 # %if.end122.critedge
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	free2DArray
	xorl	%edi, %edi
	callq	exit
.LBB3_1:                                # %if.then103
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
	movaps	.LCPI3_0(%rip), %xmm0   # xmm0 = [84,104]
	movups	%xmm0, (%rbp)
	movaps	.LCPI3_1(%rip), %xmm0   # xmm0 = [101,32]
	movups	%xmm0, 16(%rbp)
	movaps	%xmm0, %xmm1
	movaps	.LCPI3_2(%rip), %xmm0   # xmm0 = [116,111]
	movups	%xmm0, 32(%rbp)
	movaps	.LCPI3_3(%rip), %xmm0   # xmm0 = [116,97]
	movups	%xmm0, 48(%rbp)
	movaps	.LCPI3_4(%rip), %xmm0   # xmm0 = [108,32]
	movups	%xmm0, 64(%rbp)
	movaps	.LCPI3_5(%rip), %xmm0   # xmm0 = [97,109]
	movups	%xmm0, 80(%rbp)
	movaps	.LCPI3_6(%rip), %xmm0   # xmm0 = [111,117]
	movups	%xmm0, 96(%rbp)
	movaps	.LCPI3_7(%rip), %xmm0   # xmm0 = [110,116]
	movups	%xmm0, 112(%rbp)
	movaps	.LCPI3_8(%rip), %xmm0   # xmm0 = [32,111]
	movups	%xmm0, 128(%rbp)
	movaps	.LCPI3_9(%rip), %xmm0   # xmm0 = [102,32]
	movups	%xmm0, 144(%rbp)
	movaps	.LCPI3_10(%rip), %xmm0  # xmm0 = [109,111]
	movups	%xmm0, 160(%rbp)
	movaps	.LCPI3_11(%rip), %xmm0  # xmm0 = [110,101]
	movups	%xmm0, 176(%rbp)
	movaps	.LCPI3_12(%rip), %xmm0  # xmm0 = [121,32]
	movups	%xmm0, 192(%rbp)
	movaps	.LCPI3_13(%rip), %xmm0  # xmm0 = [40,109]
	movups	%xmm0, 208(%rbp)
	movaps	.LCPI3_14(%rip), %xmm0  # xmm0 = [97,120]
	movups	%xmm0, 224(%rbp)
	movaps	.LCPI3_15(%rip), %xmm0  # xmm0 = [105,109]
	movups	%xmm0, 240(%rbp)
	movaps	.LCPI3_16(%rip), %xmm0  # xmm0 = [117,109]
	movups	%xmm0, 256(%rbp)
	movaps	.LCPI3_17(%rip), %xmm0  # xmm0 = [41,32]
	movups	%xmm0, 272(%rbp)
	movaps	.LCPI3_18(%rip), %xmm0  # xmm0 = [65,108]
	movups	%xmm0, 288(%rbp)
	movaps	.LCPI3_19(%rip), %xmm0  # xmm0 = [105,99]
	movups	%xmm0, 304(%rbp)
	movups	%xmm1, 320(%rbp)
	movaps	.LCPI3_20(%rip), %xmm0  # xmm0 = [103,101]
	movups	%xmm0, 336(%rbp)
	movaps	.LCPI3_21(%rip), %xmm0  # xmm0 = [116,115]
	movups	%xmm0, 352(%rbp)
	movaps	.LCPI3_22(%rip), %xmm0  # xmm0 = [32,105]
	movups	%xmm0, 368(%rbp)
	movaps	.LCPI3_23(%rip), %xmm0  # xmm0 = [115,32]
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
	movaps	.LCPI3_24(%rip), %xmm0  # xmm0 = [80,97]
	movups	%xmm0, (%rbx)
	movaps	.LCPI3_25(%rip), %xmm0  # xmm0 = [115,115]
	movups	%xmm0, 16(%rbx)
	movaps	.LCPI3_26(%rip), %xmm0  # xmm0 = [32,67]
	movups	%xmm0, 32(%rbx)
	movaps	.LCPI3_27(%rip), %xmm0  # xmm0 = [111,105]
	movups	%xmm0, 48(%rbx)
	movaps	.LCPI3_28(%rip), %xmm0  # xmm0 = [110,71]
	movups	%xmm0, 64(%rbx)
	movaps	.LCPI3_5(%rip), %xmm0   # xmm0 = [97,109]
	movups	%xmm0, 80(%rbx)
	movaps	.LCPI3_1(%rip), %xmm0   # xmm0 = [101,32]
	movups	%xmm0, 96(%rbx)
	movaps	.LCPI3_29(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 112(%rbx)
	movaps	.LCPI3_30(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 128(%rbx)
	movaps	.LCPI3_31(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 144(%rbx)
	movaps	.LCPI3_32(%rip), %xmm0  # xmm0 = [97,115]
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
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%lld\n"
	.size	.L.str, 6


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git 2af14cc4a90f43170f8ea9c1dfa0f71f46a0621c) (http://llvm.org/git/llvm.git 1e7e2b2b556977af8ccc12b7afba61302f3a2da9)"
	.section	".note.GNU-stack","",@progbits
