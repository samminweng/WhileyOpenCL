	.text
	.file	"llvm/CoinGame.polly.enablevc.ll"
	.globl	findMoves
	.p2align	4, 0x90
	.type	findMoves,@function
findMoves:                              # @findMoves
.Lfunc_begin0:
	.file	1 "CoinGame.c"
	.loc	1 2 0                   # CoinGame.c:2:0
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
	cmpq	%r9, %rdx
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
.Ltmp12:
	#DEBUG_VALUE: findMoves:_11 <- 0
	#DEBUG_VALUE: findMoves:y <- 0
	#DEBUG_VALUE: findMoves:_12 <- 1
	.loc	1 14 12 prologue_end    # CoinGame.c:14:12
	leaq	(%r10,%rdx), %rbx
.Ltmp13:
	.loc	1 83 10                 # CoinGame.c:83:10
	leaq	(%rdx,%r9), %rcx
.Ltmp14:
	.loc	1 91 10                 # CoinGame.c:91:10
	testq	%rbx, %rbx
.Ltmp15:
	#DEBUG_VALUE: findMoves:_16 <- 0
	#DEBUG_VALUE: findMoves:_14 <- 1
	jle	.LBB0_4
.Ltmp16:
# BB#5:                                 # %if.end5
                                        #   in Loop: Header=BB0_3 Depth=2
	cmpq	$-3, %rcx
	movl	$0, %eax
	je	.LBB0_7
# BB#6:                                 # %if.end11
                                        #   in Loop: Header=BB0_3 Depth=2
.Ltmp17:
	#DEBUG_VALUE: findMoves:_17 <- 1
	#DEBUG_VALUE: findMoves:_21 <- 1
	.loc	1 105 8                 # CoinGame.c:105:8
	leaq	(%r14,%r9), %rax
	movq	-8(%rdi,%rax,8), %rax
.Ltmp18:
	#DEBUG_VALUE: findMoves:_23 <- %RAX
	#DEBUG_VALUE: findMoves:y <- %RAX
	jmp	.LBB0_7
.Ltmp19:
	.p2align	4, 0x90
.LBB0_4:                                #   in Loop: Header=BB0_3 Depth=2
	xorl	%eax, %eax
.LBB0_7:                                # %blklab4
                                        #   in Loop: Header=BB0_3 Depth=2
.Ltmp20:
	#DEBUG_VALUE: findMoves:_24 <- 0
	#DEBUG_VALUE: findMoves:x <- 0
	#DEBUG_VALUE: findMoves:_25 <- 2
	.loc	1 119 10                # CoinGame.c:119:10
	cmpq	$-4, %rcx
	movl	$0, %ecx
	je	.LBB0_9
.Ltmp21:
# BB#8:                                 # %if.end18
                                        #   in Loop: Header=BB0_3 Depth=2
	#DEBUG_VALUE: findMoves:_27 <- 2
	.loc	1 129 8                 # CoinGame.c:129:8
	movq	-16(%rdi,%r14,8), %rcx
.Ltmp22:
	#DEBUG_VALUE: findMoves:_31 <- %RCX
	#DEBUG_VALUE: findMoves:x <- %RCX
.LBB0_9:                                # %blklab5
                                        #   in Loop: Header=BB0_3 Depth=2
	.loc	1 81 9                  # CoinGame.c:81:9
	leaq	1(%rdx), %r11
.Ltmp23:
	#DEBUG_VALUE: findMoves:_35 <- 0
	#DEBUG_VALUE: findMoves:_33 <- 1
	#DEBUG_VALUE: findMoves:z <- 0
	#DEBUG_VALUE: findMoves:_32 <- 0
	#DEBUG_VALUE: findMoves:_13 <- %R11
	#DEBUG_VALUE: findMoves:_18 <- %R11
	#DEBUG_VALUE: findMoves:_52 <- %R11
	#DEBUG_VALUE: findMoves:i <- %R11
	.loc	1 145 10                # CoinGame.c:145:10
	cmpq	$2, %rbx
	movl	$0, %esi
	jl	.LBB0_11
.Ltmp24:
# BB#10:                                # %if.end26
                                        #   in Loop: Header=BB0_3 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R11
	#DEBUG_VALUE: findMoves:_52 <- %R11
	#DEBUG_VALUE: findMoves:_18 <- %R11
	#DEBUG_VALUE: findMoves:_13 <- %R11
	#DEBUG_VALUE: findMoves:_38 <- 2
	.loc	1 155 8                 # CoinGame.c:155:8
	movq	-16(%rdi,%r14,8), %rsi
.Ltmp25:
	#DEBUG_VALUE: findMoves:_40 <- %RSI
	#DEBUG_VALUE: findMoves:z <- %RSI
.LBB0_11:                               # %blklab6
                                        #   in Loop: Header=BB0_3 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R11
	#DEBUG_VALUE: findMoves:_52 <- %R11
	#DEBUG_VALUE: findMoves:_18 <- %R11
	#DEBUG_VALUE: findMoves:_13 <- %R11
	#DEBUG_VALUE: findMoves:x <- %RAX
	.loc	1 177 10                # CoinGame.c:177:10
	notq	%rax
.Ltmp26:
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
.Ltmp27:
	.loc	1 187 4                 # CoinGame.c:187:4
	cmovgeq	%rcx, %rbx
.Ltmp28:
	#DEBUG_VALUE: findMoves:_51 <- 1
	#DEBUG_VALUE: findMoves:_49 <- 1
	.loc	1 185 15                # CoinGame.c:185:15
	movq	%rbx, (%rdi,%r14,8)
	.loc	1 73 7                  # CoinGame.c:73:7
	leaq	1(%r14,%r9), %r14
	cmpq	%r11, %r8
	movq	%r11, %rdx
	jne	.LBB0_3
.Ltmp29:
# BB#12:                                # %blklab2
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: findMoves:_13 <- %R11
	#DEBUG_VALUE: findMoves:_18 <- %R11
	#DEBUG_VALUE: findMoves:_52 <- %R11
	#DEBUG_VALUE: findMoves:i <- %R11
	#DEBUG_VALUE: findMoves:_53 <- 1
	.loc	1 220 8                 # CoinGame.c:220:8
	incq	%r10
.Ltmp30:
	#DEBUG_VALUE: findMoves:s <- %R10
	#DEBUG_VALUE: findMoves:_54 <- %R10
	.loc	1 63 6                  # CoinGame.c:63:6
	decq	%r8
	cmpq	%r9, %r10
	jne	.LBB0_2
	jmp	.LBB0_13
.Ltmp31:
.LBB0_16:                               # %polly.loop_if
	.loc	1 63 7 is_stmt 0        # CoinGame.c:63:7
	testq	%rdx, %rdx
	jle	.LBB0_13
.Ltmp32:
# BB#17:                                # %polly.loop_preheader
	leaq	(,%rdx,8), %r8
	leaq	8(,%rdx,8), %r11
	movq	%rdx, %r10
	shlq	$4, %r10
	xorl	%r15d, %r15d
	movq	%rdi, %r9
	.p2align	4, 0x90
.LBB0_14:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_19 Depth 2
	movq	%rdx, %r14
	subq	%r15, %r14
	jle	.LBB0_15
# BB#18:                                # %polly.loop_preheader156
                                        #   in Loop: Header=BB0_14 Depth=1
	decq	%r14
	movq	$-1, %rbp
	movq	%r9, %r13
	.p2align	4, 0x90
.LBB0_19:                               # %polly.loop_header155
                                        #   Parent Loop BB0_14 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	3(%rbp), %rax
	leaq	1(%r15,%rbp), %r12
	cmpq	%rdx, %rax
	jg	.LBB0_20
# BB#21:                                # %polly.loop_header155
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
.LBB0_22:                               # %polly.cond166
                                        #   in Loop: Header=BB0_19 Depth=2
	leaq	4(%rbp), %rax
	cmpq	%rdx, %rax
	movl	$0, %eax
	jg	.LBB0_23
# BB#26:                                # %polly.stmt.if.end18
                                        #   in Loop: Header=BB0_19 Depth=2
	movq	(%r10,%r13), %rax
.LBB0_23:                               # %polly.cond176
                                        #   in Loop: Header=BB0_19 Depth=2
	cmpq	$1, %r12
	movl	$0, %ebx
	jle	.LBB0_24
# BB#27:                                # %polly.stmt.if.end26
                                        #   in Loop: Header=BB0_19 Depth=2
	movq	-16(%r13), %rbx
.LBB0_24:                               # %polly.stmt.blklab6
                                        #   in Loop: Header=BB0_19 Depth=2
.Ltmp33:
	.loc	1 177 10 is_stmt 1      # CoinGame.c:177:10
	notq	%rsi
	notq	%rax
	cmpq	%rax, %rsi
	cmovgeq	%rsi, %rax
	movq	%rbp, %rcx
	subq	%rax, %rcx
	notq	%rbx
	cmpq	%rbx, %rsi
	cmovgeq	%rsi, %rbx
	leaq	(%r15,%rbp), %rax
	subq	%rbx, %rax
	cmpq	%rax, %rcx
.Ltmp34:
	.loc	1 187 4                 # CoinGame.c:187:4
	cmovgeq	%rcx, %rax
	movq	%rax, (%r13)
	addq	%r11, %r13
	incq	%rbp
	cmpq	%r14, %rbp
	jl	.LBB0_19
.Ltmp35:
.LBB0_15:                               # %polly.loop_exit157
                                        #   in Loop: Header=BB0_14 Depth=1
	incq	%r15
	addq	$8, %r9
	cmpq	%rdx, %r15
	jne	.LBB0_14
.LBB0_13:                               # %blklab0
	.loc	1 229 2                 # CoinGame.c:229:2
	movq	%rdi, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp36:
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
.Lfunc_begin1:
	.loc	1 233 0                 # CoinGame.c:233:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 255 2 prologue_end    # CoinGame.c:255:2
	pushq	%rbx
.Ltmp37:
	.cfi_def_cfa_offset 16
.Ltmp38:
	.cfi_offset %rbx, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
.Ltmp39:
	#DEBUG_VALUE: main:n <- 0
	#DEBUG_VALUE: main:moves_size <- 0
	#DEBUG_VALUE: main:sum_alice <- 0
	#DEBUG_VALUE: main:_6_size <- 0
	#DEBUG_VALUE: main:_6_size_size <- 0
	#DEBUG_VALUE: main:_7 <- 0
	#DEBUG_VALUE: main:_8_size <- 0
	#DEBUG_VALUE: main:_9 <- 0
	#DEBUG_VALUE: main:_10 <- 0
	#DEBUG_VALUE: main:_11_size <- 0
	#DEBUG_VALUE: main:_12_size <- 0
	#DEBUG_VALUE: main:_13 <- 0
	#DEBUG_VALUE: main:_14 <- 0
	#DEBUG_VALUE: main:_15 <- 0
	#DEBUG_VALUE: main:_18_size <- 0
	#DEBUG_VALUE: main:_23_size <- 0
	callq	convertArgsToIntArray
.Ltmp40:
	#DEBUG_VALUE: main:_6 <- %RAX
	.loc	1 259 5                 # CoinGame.c:259:5
	movq	(%rax), %rdi
.Ltmp41:
	#DEBUG_VALUE: main:_8 <- %RDI
	.loc	1 261 2                 # CoinGame.c:261:2
	callq	parseStringToInt
.Ltmp42:
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_5 <- %RAX
	.loc	1 265 9                 # CoinGame.c:265:9
	testq	%rax, %rax
	je	.LBB1_2
.Ltmp43:
# BB#1:                                 # %if.end
	#DEBUG_VALUE: main:_5 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	.loc	1 267 6                 # CoinGame.c:267:6
	movq	(%rax), %rbx
	#DEBUG_VALUE: main:_9 <- 0
.Ltmp44:
	#DEBUG_VALUE: main:n <- %RBX
	.loc	1 271 7                 # CoinGame.c:271:7
	movl	%ebx, %esi
	imull	%esi, %esi
	.loc	1 273 2                 # CoinGame.c:273:2
	xorl	%edi, %edi
	callq	gen1DArray
.Ltmp45:
	#DEBUG_VALUE: main:moves <- %RAX
	#DEBUG_VALUE: main:_11 <- %RAX
	.loc	1 278 8                 # CoinGame.c:278:8
	movq	%rax, %rdi
	movq	%rbx, %rdx
	callq	findMoves
.Ltmp46:
	#DEBUG_VALUE: main:_12 <- %RAX
	#DEBUG_VALUE: main:moves <- %RAX
	#DEBUG_VALUE: main:_13 <- 1
	.loc	1 286 6                 # CoinGame.c:286:6
	movq	-8(%rax,%rbx,8), %rbx
.Ltmp47:
	#DEBUG_VALUE: main:_18_size <- 50
	#DEBUG_VALUE: main:_15 <- %RBX
	#DEBUG_VALUE: main:sum_alice <- %RBX
	.loc	1 292 2                 # CoinGame.c:292:2
	movl	$400, %edi              # imm = 0x190
	callq	malloc
.Ltmp48:
	#DEBUG_VALUE: main:_18 <- %RAX
	.loc	1 293 9                 # CoinGame.c:293:9
	movaps	.LCPI1_0(%rip), %xmm0   # xmm0 = [84,104]
	movups	%xmm0, (%rax)
	.loc	1 293 36 is_stmt 0      # CoinGame.c:293:36
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [101,32]
	movups	%xmm0, 16(%rax)
	movaps	%xmm0, %xmm1
	.loc	1 293 63                # CoinGame.c:293:63
	movaps	.LCPI1_2(%rip), %xmm0   # xmm0 = [116,111]
	movups	%xmm0, 32(%rax)
	.loc	1 293 91                # CoinGame.c:293:91
	movaps	.LCPI1_3(%rip), %xmm0   # xmm0 = [116,97]
	movups	%xmm0, 48(%rax)
	.loc	1 293 118               # CoinGame.c:293:118
	movaps	.LCPI1_4(%rip), %xmm0   # xmm0 = [108,32]
	movups	%xmm0, 64(%rax)
	.loc	1 293 146               # CoinGame.c:293:146
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [97,109]
	movups	%xmm0, 80(%rax)
	.loc	1 293 175               # CoinGame.c:293:175
	movaps	.LCPI1_6(%rip), %xmm0   # xmm0 = [111,117]
	movups	%xmm0, 96(%rax)
	.loc	1 293 205               # CoinGame.c:293:205
	movaps	.LCPI1_7(%rip), %xmm0   # xmm0 = [110,116]
	movups	%xmm0, 112(%rax)
	.loc	1 293 235               # CoinGame.c:293:235
	movaps	.LCPI1_8(%rip), %xmm0   # xmm0 = [32,111]
	movups	%xmm0, 128(%rax)
	.loc	1 293 264               # CoinGame.c:293:264
	movaps	.LCPI1_9(%rip), %xmm0   # xmm0 = [102,32]
	movups	%xmm0, 144(%rax)
	.loc	1 293 293               # CoinGame.c:293:293
	movaps	.LCPI1_10(%rip), %xmm0  # xmm0 = [109,111]
	movups	%xmm0, 160(%rax)
	.loc	1 293 323               # CoinGame.c:293:323
	movaps	.LCPI1_11(%rip), %xmm0  # xmm0 = [110,101]
	movups	%xmm0, 176(%rax)
	.loc	1 293 353               # CoinGame.c:293:353
	movaps	.LCPI1_12(%rip), %xmm0  # xmm0 = [121,32]
	movups	%xmm0, 192(%rax)
	.loc	1 293 382               # CoinGame.c:293:382
	movaps	.LCPI1_13(%rip), %xmm0  # xmm0 = [40,109]
	movups	%xmm0, 208(%rax)
	.loc	1 293 411               # CoinGame.c:293:411
	movaps	.LCPI1_14(%rip), %xmm0  # xmm0 = [97,120]
	movups	%xmm0, 224(%rax)
	.loc	1 293 440               # CoinGame.c:293:440
	movaps	.LCPI1_15(%rip), %xmm0  # xmm0 = [105,109]
	movups	%xmm0, 240(%rax)
	.loc	1 293 470               # CoinGame.c:293:470
	movaps	.LCPI1_16(%rip), %xmm0  # xmm0 = [117,109]
	movups	%xmm0, 256(%rax)
	.loc	1 293 500               # CoinGame.c:293:500
	movaps	.LCPI1_17(%rip), %xmm0  # xmm0 = [41,32]
	movups	%xmm0, 272(%rax)
	.loc	1 293 528               # CoinGame.c:293:528
	movaps	.LCPI1_18(%rip), %xmm0  # xmm0 = [65,108]
	movups	%xmm0, 288(%rax)
	.loc	1 293 557               # CoinGame.c:293:557
	movaps	.LCPI1_19(%rip), %xmm0  # xmm0 = [105,99]
	movups	%xmm0, 304(%rax)
	.loc	1 293 586               # CoinGame.c:293:586
	movups	%xmm1, 320(%rax)
	.loc	1 293 615               # CoinGame.c:293:615
	movaps	.LCPI1_20(%rip), %xmm0  # xmm0 = [103,101]
	movups	%xmm0, 336(%rax)
	.loc	1 293 645               # CoinGame.c:293:645
	movaps	.LCPI1_21(%rip), %xmm0  # xmm0 = [116,115]
	movups	%xmm0, 352(%rax)
	.loc	1 293 675               # CoinGame.c:293:675
	movaps	.LCPI1_22(%rip), %xmm0  # xmm0 = [32,105]
	movups	%xmm0, 368(%rax)
	.loc	1 293 704               # CoinGame.c:293:704
	movaps	.LCPI1_23(%rip), %xmm0  # xmm0 = [115,32]
	movups	%xmm0, 384(%rax)
	.loc	1 295 2 is_stmt 1       # CoinGame.c:295:2
	movl	$50, %esi
	movq	%rax, %rdi
	callq	printf_s
.Ltmp49:
	.loc	1 299 2                 # CoinGame.c:299:2
	movl	$.L.str, %edi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	printf
.Ltmp50:
	#DEBUG_VALUE: main:_23_size <- 23
	.loc	1 303 2                 # CoinGame.c:303:2
	movl	$184, %edi
	callq	malloc
.Ltmp51:
	#DEBUG_VALUE: main:_23 <- %RAX
	.loc	1 304 9                 # CoinGame.c:304:9
	movaps	.LCPI1_24(%rip), %xmm0  # xmm0 = [80,97]
	movups	%xmm0, (%rax)
	.loc	1 304 35 is_stmt 0      # CoinGame.c:304:35
	movaps	.LCPI1_25(%rip), %xmm0  # xmm0 = [115,115]
	movups	%xmm0, 16(%rax)
	.loc	1 304 63                # CoinGame.c:304:63
	movaps	.LCPI1_26(%rip), %xmm0  # xmm0 = [32,67]
	movups	%xmm0, 32(%rax)
	.loc	1 304 89                # CoinGame.c:304:89
	movaps	.LCPI1_27(%rip), %xmm0  # xmm0 = [111,105]
	movups	%xmm0, 48(%rax)
	.loc	1 304 117               # CoinGame.c:304:117
	movaps	.LCPI1_28(%rip), %xmm0  # xmm0 = [110,71]
	movups	%xmm0, 64(%rax)
	.loc	1 293 146 is_stmt 1     # CoinGame.c:293:146
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [97,109]
	.loc	1 304 145               # CoinGame.c:304:145
	movups	%xmm0, 80(%rax)
	.loc	1 293 36                # CoinGame.c:293:36
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [101,32]
	.loc	1 304 174               # CoinGame.c:304:174
	movups	%xmm0, 96(%rax)
	.loc	1 304 203 is_stmt 0     # CoinGame.c:304:203
	movaps	.LCPI1_29(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 112(%rax)
	.loc	1 304 233               # CoinGame.c:304:233
	movaps	.LCPI1_30(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 128(%rax)
	.loc	1 304 263               # CoinGame.c:304:263
	movaps	.LCPI1_31(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 144(%rax)
	.loc	1 304 291               # CoinGame.c:304:291
	movaps	.LCPI1_32(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 160(%rax)
	.loc	1 304 320               # CoinGame.c:304:320
	movq	$101, 176(%rax)
	.loc	1 306 2 is_stmt 1       # CoinGame.c:306:2
	movl	$23, %esi
	movq	%rax, %rdi
	callq	println_s
.Ltmp52:
.LBB1_2:                                # %blklab11
	.loc	1 310 2                 # CoinGame.c:310:2
	xorl	%edi, %edi
	callq	exit
.Ltmp53:
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%lld\n"
	.size	.L.str, 6

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git 83402ed45b681e9f38ce6626e5899c19159ceb29) (http://llvm.org/git/llvm.git 4fc8e6fd79f212952e8f538b6d5d9d78098b4505)" # string offset=0
.Linfo_string1:
	.asciz	"CoinGame.c"            # string offset=165
.Linfo_string2:
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/autogenerate_copyonly" # string offset=176
.Linfo_string3:
	.asciz	"findMoves"             # string offset=251
.Linfo_string4:
	.asciz	"long long int"         # string offset=261
.Linfo_string5:
	.asciz	"main"                  # string offset=275
.Linfo_string6:
	.asciz	"int"                   # string offset=280
.Linfo_string7:
	.asciz	"_11"                   # string offset=284
.Linfo_string8:
	.asciz	"y"                     # string offset=288
.Linfo_string9:
	.asciz	"_12"                   # string offset=290
.Linfo_string10:
	.asciz	"_16"                   # string offset=294
.Linfo_string11:
	.asciz	"_14"                   # string offset=298
.Linfo_string12:
	.asciz	"_17"                   # string offset=302
.Linfo_string13:
	.asciz	"_21"                   # string offset=306
.Linfo_string14:
	.asciz	"_23"                   # string offset=310
.Linfo_string15:
	.asciz	"_24"                   # string offset=314
.Linfo_string16:
	.asciz	"x"                     # string offset=318
.Linfo_string17:
	.asciz	"_25"                   # string offset=320
.Linfo_string18:
	.asciz	"_27"                   # string offset=324
.Linfo_string19:
	.asciz	"_31"                   # string offset=328
.Linfo_string20:
	.asciz	"_35"                   # string offset=332
.Linfo_string21:
	.asciz	"_33"                   # string offset=336
.Linfo_string22:
	.asciz	"z"                     # string offset=340
.Linfo_string23:
	.asciz	"_32"                   # string offset=342
.Linfo_string24:
	.asciz	"_13"                   # string offset=346
.Linfo_string25:
	.asciz	"_18"                   # string offset=350
.Linfo_string26:
	.asciz	"_52"                   # string offset=354
.Linfo_string27:
	.asciz	"i"                     # string offset=358
.Linfo_string28:
	.asciz	"_38"                   # string offset=360
.Linfo_string29:
	.asciz	"_40"                   # string offset=364
.Linfo_string30:
	.asciz	"_51"                   # string offset=368
.Linfo_string31:
	.asciz	"_49"                   # string offset=372
.Linfo_string32:
	.asciz	"_53"                   # string offset=376
.Linfo_string33:
	.asciz	"s"                     # string offset=380
.Linfo_string34:
	.asciz	"_54"                   # string offset=382
.Linfo_string35:
	.asciz	"moves"                 # string offset=386
.Linfo_string36:
	.asciz	"moves_size"            # string offset=392
.Linfo_string37:
	.asciz	"n"                     # string offset=403
.Linfo_string38:
	.asciz	"_2"                    # string offset=405
.Linfo_string39:
	.asciz	"_2_size"               # string offset=408
.Linfo_string40:
	.asciz	"j"                     # string offset=416
.Linfo_string41:
	.asciz	"_9"                    # string offset=418
.Linfo_string42:
	.asciz	"_10"                   # string offset=421
.Linfo_string43:
	.asciz	"_15"                   # string offset=425
.Linfo_string44:
	.asciz	"_19"                   # string offset=429
.Linfo_string45:
	.asciz	"_20"                   # string offset=433
.Linfo_string46:
	.asciz	"_22"                   # string offset=437
.Linfo_string47:
	.asciz	"_26"                   # string offset=441
.Linfo_string48:
	.asciz	"_28"                   # string offset=445
.Linfo_string49:
	.asciz	"_29"                   # string offset=449
.Linfo_string50:
	.asciz	"_30"                   # string offset=453
.Linfo_string51:
	.asciz	"_34"                   # string offset=457
.Linfo_string52:
	.asciz	"_36"                   # string offset=461
.Linfo_string53:
	.asciz	"_37"                   # string offset=465
.Linfo_string54:
	.asciz	"_39"                   # string offset=469
.Linfo_string55:
	.asciz	"_41"                   # string offset=473
.Linfo_string56:
	.asciz	"_42"                   # string offset=477
.Linfo_string57:
	.asciz	"_43"                   # string offset=481
.Linfo_string58:
	.asciz	"_44"                   # string offset=485
.Linfo_string59:
	.asciz	"_45"                   # string offset=489
.Linfo_string60:
	.asciz	"_46"                   # string offset=493
.Linfo_string61:
	.asciz	"_47"                   # string offset=497
.Linfo_string62:
	.asciz	"_48"                   # string offset=501
.Linfo_string63:
	.asciz	"_50"                   # string offset=505
.Linfo_string64:
	.asciz	"argc"                  # string offset=509
.Linfo_string65:
	.asciz	"args"                  # string offset=514
.Linfo_string66:
	.asciz	"char"                  # string offset=519
.Linfo_string67:
	.asciz	"sum_alice"             # string offset=524
.Linfo_string68:
	.asciz	"_6_size"               # string offset=534
.Linfo_string69:
	.asciz	"_6_size_size"          # string offset=542
.Linfo_string70:
	.asciz	"_7"                    # string offset=555
.Linfo_string71:
	.asciz	"_8_size"               # string offset=558
.Linfo_string72:
	.asciz	"_11_size"              # string offset=566
.Linfo_string73:
	.asciz	"_12_size"              # string offset=575
.Linfo_string74:
	.asciz	"_18_size"              # string offset=584
.Linfo_string75:
	.asciz	"_23_size"              # string offset=593
.Linfo_string76:
	.asciz	"_6"                    # string offset=602
.Linfo_string77:
	.asciz	"_8"                    # string offset=605
.Linfo_string78:
	.asciz	"max"                   # string offset=608
.Linfo_string79:
	.asciz	"_5"                    # string offset=612
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Ltmp12-.Lfunc_begin0
	.quad	.Ltmp18-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp19-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp19-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc2:
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp22-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp22-.Lfunc_begin0
	.quad	.Ltmp22-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp25-.Lfunc_begin0
	.quad	.Ltmp26-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Ltmp22-.Lfunc_begin0
	.quad	.Ltmp22-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp25-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp25-.Lfunc_begin0
	.quad	.Ltmp25-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	91                      # DW_OP_reg11
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	91                      # DW_OP_reg11
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	91                      # DW_OP_reg11
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	91                      # DW_OP_reg11
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Ltmp25-.Lfunc_begin0
	.quad	.Ltmp25-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Ltmp30-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	90                      # DW_OP_reg10
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp30-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	90                      # DW_OP_reg10
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	50                      # 50
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	23                      # 23
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc23:
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
	.section	.debug_abbrev,"",@progbits
.Lsection_abbrev:
	.byte	1                       # Abbreviation Code
	.byte	17                      # DW_TAG_compile_unit
	.byte	1                       # DW_CHILDREN_yes
	.byte	37                      # DW_AT_producer
	.byte	14                      # DW_FORM_strp
	.byte	19                      # DW_AT_language
	.byte	5                       # DW_FORM_data2
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	16                      # DW_AT_stmt_list
	.byte	23                      # DW_FORM_sec_offset
	.byte	27                      # DW_AT_comp_dir
	.byte	14                      # DW_FORM_strp
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.byte	25                      # DW_FORM_flag_present
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	2                       # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	3                       # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.ascii	"\347\177"              # DW_AT_APPLE_omit_frame_ptr
	.byte	25                      # DW_FORM_flag_present
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	4                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	5                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	6                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	7                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	10                      # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	1232                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x4c9 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x1 DW_TAG_pointer_type
	.byte	3                       # Abbrev [3] 0x2b:0x2cd DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1194                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	4                       # Abbrev [4] 0x44:0xb DW_TAG_formal_parameter
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1194                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x4f:0xb DW_TAG_formal_parameter
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x5a:0xb DW_TAG_formal_parameter
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x65:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x71:0xf DW_TAG_variable
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x80:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x8c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	17                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x98:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xa4:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xb0:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	22                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0xbc:0xf DW_TAG_variable
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	24                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xcb:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	25                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0xd7:0xf DW_TAG_variable
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xe6:0xc DW_TAG_variable
	.byte	2                       # DW_AT_const_value
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xf2:0xc DW_TAG_variable
	.byte	2                       # DW_AT_const_value
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	28                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0xfe:0xf DW_TAG_variable
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x10d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x119:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x125:0xf DW_TAG_variable
	.long	.Ldebug_loc4            # DW_AT_location
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x134:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	33                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x140:0xf DW_TAG_variable
	.long	.Ldebug_loc5            # DW_AT_location
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x14f:0xf DW_TAG_variable
	.long	.Ldebug_loc6            # DW_AT_location
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x15e:0xf DW_TAG_variable
	.long	.Ldebug_loc7            # DW_AT_location
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	53                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x16d:0xf DW_TAG_variable
	.long	.Ldebug_loc8            # DW_AT_location
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x17c:0xc DW_TAG_variable
	.byte	2                       # DW_AT_const_value
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	39                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x188:0xf DW_TAG_variable
	.long	.Ldebug_loc9            # DW_AT_location
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	41                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x197:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	52                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1a3:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	50                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1af:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	54                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x1bb:0xf DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x1ca:0xf DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	55                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x1d9:0xb DW_TAG_variable
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	1194                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x1e4:0xb DW_TAG_variable
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x1ef:0xb DW_TAG_variable
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x1fa:0xb DW_TAG_variable
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x205:0xb DW_TAG_variable
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x210:0xb DW_TAG_variable
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	16                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x21b:0xb DW_TAG_variable
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	20                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x226:0xb DW_TAG_variable
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	21                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x231:0xb DW_TAG_variable
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	23                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x23c:0xb DW_TAG_variable
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x247:0xb DW_TAG_variable
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	29                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x252:0xb DW_TAG_variable
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	30                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x25d:0xb DW_TAG_variable
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x268:0xb DW_TAG_variable
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x273:0xb DW_TAG_variable
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	37                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x27e:0xb DW_TAG_variable
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	38                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x289:0xb DW_TAG_variable
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	40                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x294:0xb DW_TAG_variable
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	42                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x29f:0xb DW_TAG_variable
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	43                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x2aa:0xb DW_TAG_variable
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x2b5:0xb DW_TAG_variable
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	45                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x2c0:0xb DW_TAG_variable
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	46                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x2cb:0xb DW_TAG_variable
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	47                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x2d6:0xb DW_TAG_variable
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	48                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x2e1:0xb DW_TAG_variable
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	49                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x2ec:0xb DW_TAG_variable
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	3                       # Abbrev [3] 0x2f8:0x1b2 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	233                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1206                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0x311:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	233                     # DW_AT_decl_line
	.long	1206                    # DW_AT_type
	.byte	8                       # Abbrev [8] 0x320:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	233                     # DW_AT_decl_line
	.long	1213                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x32f:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	235                     # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x33e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	236                     # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x34a:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	237                     # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x359:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	239                     # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x365:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	239                     # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x371:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	240                     # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x37d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	241                     # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x389:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	242                     # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x395:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	243                     # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x3a1:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	244                     # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x3ad:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	245                     # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3b9:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	246                     # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x3c8:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	247                     # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3d4:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	248                     # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3e3:0xf DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	250                     # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3f2:0xf DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string75         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	253                     # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x401:0xf DW_TAG_variable
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string76         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	239                     # DW_AT_decl_line
	.long	1230                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x410:0xf DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string77         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	241                     # DW_AT_decl_line
	.long	1194                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x41f:0xf DW_TAG_variable
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	234                     # DW_AT_decl_line
	.long	1194                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x42e:0xf DW_TAG_variable
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	238                     # DW_AT_decl_line
	.long	1194                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x43d:0xf DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	236                     # DW_AT_decl_line
	.long	1194                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x44c:0xf DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	244                     # DW_AT_decl_line
	.long	1194                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x45b:0xf DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	245                     # DW_AT_decl_line
	.long	1194                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x46a:0xf DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	250                     # DW_AT_decl_line
	.long	1194                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x479:0xf DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	253                     # DW_AT_decl_line
	.long	1194                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x488:0xb DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	249                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	7                       # Abbrev [7] 0x493:0xb DW_TAG_variable
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	251                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	7                       # Abbrev [7] 0x49e:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	252                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0x4aa:0x5 DW_TAG_pointer_type
	.long	1199                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x4af:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	10                      # Abbrev [10] 0x4b6:0x7 DW_TAG_base_type
	.long	.Linfo_string6          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	9                       # Abbrev [9] 0x4bd:0x5 DW_TAG_pointer_type
	.long	1218                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0x4c2:0x5 DW_TAG_pointer_type
	.long	1223                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x4c7:0x7 DW_TAG_base_type
	.long	.Linfo_string66         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	9                       # Abbrev [9] 0x4ce:0x5 DW_TAG_pointer_type
	.long	1194                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
	.section	.debug_macinfo,"",@progbits
.Ldebug_macinfo:
.Lcu_macro_begin0:
	.byte	0                       # End Of Macro List Mark
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end0-.LpubNames_begin0 # Length of Public Names Info
.LpubNames_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	1236                    # Compilation Unit Length
	.long	760                     # DIE offset
	.asciz	"main"                  # External Name
	.long	43                      # DIE offset
	.asciz	"findMoves"             # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	1236                    # Compilation Unit Length
	.long	1199                    # DIE offset
	.asciz	"long long int"         # External Name
	.long	1206                    # DIE offset
	.asciz	"int"                   # External Name
	.long	1223                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git 83402ed45b681e9f38ce6626e5899c19159ceb29) (http://llvm.org/git/llvm.git 4fc8e6fd79f212952e8f538b6d5d9d78098b4505)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
