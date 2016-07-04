	.text
	.file	"llvm/CoinGame_original.polly.ll"
	.globl	findMoves
	.p2align	4, 0x90
	.type	findMoves,@function
findMoves:                              # @findMoves
.Lfunc_begin0:
	.file	1 "CoinGame_original.c"
	.loc	1 2 0                   # CoinGame_original.c:2:0
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
.Ltmp12:
	#DEBUG_VALUE: findMoves:_11 <- 0
	#DEBUG_VALUE: findMoves:y <- 0
	#DEBUG_VALUE: findMoves:_12 <- 1
	.loc	1 15 12 prologue_end    # CoinGame_original.c:15:12
	leaq	(%r10,%rdx), %rbx
.Ltmp13:
	.loc	1 84 10                 # CoinGame_original.c:84:10
	leaq	(%rdx,%r9), %rcx
.Ltmp14:
	.loc	1 92 10                 # CoinGame_original.c:92:10
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
	.loc	1 106 8                 # CoinGame_original.c:106:8
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
	.loc	1 120 10                # CoinGame_original.c:120:10
	cmpq	$-4, %rcx
	movl	$0, %ecx
	je	.LBB0_9
.Ltmp21:
# BB#8:                                 # %if.end18
                                        #   in Loop: Header=BB0_3 Depth=2
	#DEBUG_VALUE: findMoves:_27 <- 2
	.loc	1 130 8                 # CoinGame_original.c:130:8
	movq	-16(%rdi,%r14,8), %rcx
.Ltmp22:
	#DEBUG_VALUE: findMoves:_31 <- %RCX
	#DEBUG_VALUE: findMoves:x <- %RCX
.LBB0_9:                                # %blklab5
                                        #   in Loop: Header=BB0_3 Depth=2
	.loc	1 82 9                  # CoinGame_original.c:82:9
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
	.loc	1 146 10                # CoinGame_original.c:146:10
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
	.loc	1 156 8                 # CoinGame_original.c:156:8
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
	.loc	1 176 9                 # CoinGame_original.c:176:9
	notq	%rax
.Ltmp26:
	notq	%rcx
	cmpq	%rcx, %rax
	cmovgeq	%rax, %rcx
	negq	%rcx
	leaq	-1(%rdx,%rcx), %rcx
.Ltmp27:
	.loc	1 178 10                # CoinGame_original.c:178:10
	notq	%rsi
	cmpq	%rsi, %rax
	cmovgeq	%rax, %rsi
	subq	%rsi, %rbx
	decq	%rbx
	cmpq	%rbx, %rcx
.Ltmp28:
	.loc	1 188 4                 # CoinGame_original.c:188:4
	cmovgeq	%rcx, %rbx
.Ltmp29:
	#DEBUG_VALUE: findMoves:_51 <- 1
	#DEBUG_VALUE: findMoves:_49 <- 1
	.loc	1 186 15                # CoinGame_original.c:186:15
	movq	%rbx, (%rdi,%r14,8)
	.loc	1 74 7                  # CoinGame_original.c:74:7
	leaq	1(%r14,%r9), %r14
	cmpq	%r11, %r8
	movq	%r11, %rdx
	jne	.LBB0_3
.Ltmp30:
# BB#12:                                # %blklab2
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: findMoves:i <- %R11
	#DEBUG_VALUE: findMoves:_52 <- %R11
	#DEBUG_VALUE: findMoves:_18 <- %R11
	#DEBUG_VALUE: findMoves:_13 <- %R11
	#DEBUG_VALUE: findMoves:_53 <- 1
	.loc	1 221 8                 # CoinGame_original.c:221:8
	incq	%r10
.Ltmp31:
	#DEBUG_VALUE: findMoves:s <- %R10
	#DEBUG_VALUE: findMoves:_54 <- %R10
	.loc	1 64 6                  # CoinGame_original.c:64:6
	decq	%r8
	cmpq	%r9, %r10
	jne	.LBB0_2
	jmp	.LBB0_13
.Ltmp32:
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
.Ltmp33:
	.loc	1 176 9                 # CoinGame_original.c:176:9
	notq	%rsi
	notq	%rax
	cmpq	%rax, %rsi
	cmovgeq	%rsi, %rax
	movq	%rbp, %rdx
	subq	%rax, %rdx
.Ltmp34:
	.loc	1 178 10                # CoinGame_original.c:178:10
	notq	%rbx
	cmpq	%rbx, %rsi
	cmovgeq	%rsi, %rbx
	leaq	(%r15,%rbp), %rax
	subq	%rbx, %rax
	cmpq	%rax, %rdx
.Ltmp35:
	.loc	1 188 4                 # CoinGame_original.c:188:4
	cmovgeq	%rdx, %rax
	movq	%rax, (%r13)
	addq	%r11, %r13
	incq	%rbp
	cmpq	%r14, %rbp
	jl	.LBB0_19
.Ltmp36:
.LBB0_15:                               # %polly.loop_exit159
                                        #   in Loop: Header=BB0_14 Depth=1
	incq	%r15
	addq	$8, %r9
	cmpq	%rcx, %r15
	jne	.LBB0_14
.LBB0_13:                               # %if.end54
	.loc	1 231 2                 # CoinGame_original.c:231:2
	movq	%rdi, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp37:
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
	.loc	1 235 0                 # CoinGame_original.c:235:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 266 2 prologue_end    # CoinGame_original.c:266:2
	pushq	%r15
.Ltmp38:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp39:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp40:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp41:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp42:
	.cfi_def_cfa_offset 48
.Ltmp43:
	.cfi_offset %rbx, -48
.Ltmp44:
	.cfi_offset %r12, -40
.Ltmp45:
	.cfi_offset %r13, -32
.Ltmp46:
	.cfi_offset %r14, -24
.Ltmp47:
	.cfi_offset %r15, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
.Ltmp48:
	#DEBUG_VALUE: main:max_dealloc <- 0
	#DEBUG_VALUE: main:n <- 0
	#DEBUG_VALUE: main:moves_size <- 0
	#DEBUG_VALUE: main:moves_dealloc <- 0
	#DEBUG_VALUE: main:sum_alice <- 0
	#DEBUG_VALUE: main:_5_dealloc <- 0
	#DEBUG_VALUE: main:_6_size <- 0
	#DEBUG_VALUE: main:_6_size_size <- 0
	#DEBUG_VALUE: main:_6_dealloc <- 0
	#DEBUG_VALUE: main:_7 <- 0
	#DEBUG_VALUE: main:_8_size <- 0
	#DEBUG_VALUE: main:_8_dealloc <- 0
	#DEBUG_VALUE: main:_9 <- 0
	#DEBUG_VALUE: main:_10 <- 0
	#DEBUG_VALUE: main:_11_size <- 0
	#DEBUG_VALUE: main:_11_dealloc <- 0
	#DEBUG_VALUE: main:_12_size <- 0
	#DEBUG_VALUE: main:_12_dealloc <- 0
	#DEBUG_VALUE: main:_13 <- 0
	#DEBUG_VALUE: main:_14 <- 0
	#DEBUG_VALUE: main:_15 <- 0
	#DEBUG_VALUE: main:_18_size <- 0
	#DEBUG_VALUE: main:_18_dealloc <- 0
	#DEBUG_VALUE: main:_23_size <- 0
	#DEBUG_VALUE: main:_23_dealloc <- 0
	callq	convertArgsToIntArray
.Ltmp49:
	#DEBUG_VALUE: main:_6 <- %RAX
	.loc	1 270 5                 # CoinGame_original.c:270:5
	movq	(%rax), %rdi
.Ltmp50:
	#DEBUG_VALUE: main:_8 <- %RDI
	.loc	1 273 2                 # CoinGame_original.c:273:2
	callq	parseStringToInt
.Ltmp51:
	movq	%rax, %r15
.Ltmp52:
	#DEBUG_VALUE: main:max <- %R15
	#DEBUG_VALUE: main:_5 <- %R15
	#DEBUG_VALUE: main:max_dealloc <- 1
	.loc	1 281 9                 # CoinGame_original.c:281:9
	testq	%r15, %r15
	je	.LBB1_2
.Ltmp53:
# BB#1:                                 # %if.then117
	#DEBUG_VALUE: main:_5 <- %R15
	#DEBUG_VALUE: main:max <- %R15
	.loc	1 283 6                 # CoinGame_original.c:283:6
	movq	(%r15), %rbx
	#DEBUG_VALUE: main:_9 <- 0
.Ltmp54:
	#DEBUG_VALUE: main:n <- %RBX
	.loc	1 287 7                 # CoinGame_original.c:287:7
	movl	%ebx, %esi
	imull	%esi, %esi
	.loc	1 290 2                 # CoinGame_original.c:290:2
	xorl	%edi, %edi
	callq	create1DArray
.Ltmp55:
	#DEBUG_VALUE: main:moves <- %RAX
	#DEBUG_VALUE: main:_11 <- %RAX
	#DEBUG_VALUE: main:_11_dealloc <- 0
	#DEBUG_VALUE: main:moves_dealloc <- 1
	.loc	1 299 8                 # CoinGame_original.c:299:8
	xorl	%edx, %edx
	movq	%rax, %rdi
	movq	%rbx, %rcx
	callq	findMoves
.Ltmp56:
	movq	%rax, %r14
.Ltmp57:
	#DEBUG_VALUE: main:_12 <- %R14
	#DEBUG_VALUE: main:moves <- %R14
	#DEBUG_VALUE: main:_13 <- 1
	#DEBUG_VALUE: main:_12_dealloc <- 0
	.loc	1 311 6                 # CoinGame_original.c:311:6
	movq	-8(%r14,%rbx,8), %r12
.Ltmp58:
	#DEBUG_VALUE: main:_18_size <- 50
	#DEBUG_VALUE: main:_15 <- %R12
	#DEBUG_VALUE: main:sum_alice <- %R12
	.loc	1 318 2                 # CoinGame_original.c:318:2
	xorl	%edi, %edi
	movl	$50, %esi
	callq	create1DArray
	movq	%rax, %r13
.Ltmp59:
	#DEBUG_VALUE: main:_18 <- %R13
	.loc	1 319 9                 # CoinGame_original.c:319:9
	movaps	.LCPI1_0(%rip), %xmm0   # xmm0 = [84,104]
	movups	%xmm0, (%r13)
	.loc	1 319 36 is_stmt 0      # CoinGame_original.c:319:36
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [101,32]
	movups	%xmm0, 16(%r13)
	movaps	%xmm0, %xmm1
	.loc	1 319 63                # CoinGame_original.c:319:63
	movaps	.LCPI1_2(%rip), %xmm0   # xmm0 = [116,111]
	movups	%xmm0, 32(%r13)
	.loc	1 319 91                # CoinGame_original.c:319:91
	movaps	.LCPI1_3(%rip), %xmm0   # xmm0 = [116,97]
	movups	%xmm0, 48(%r13)
	.loc	1 319 118               # CoinGame_original.c:319:118
	movaps	.LCPI1_4(%rip), %xmm0   # xmm0 = [108,32]
	movups	%xmm0, 64(%r13)
	.loc	1 319 146               # CoinGame_original.c:319:146
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [97,109]
	movups	%xmm0, 80(%r13)
	.loc	1 319 175               # CoinGame_original.c:319:175
	movaps	.LCPI1_6(%rip), %xmm0   # xmm0 = [111,117]
	movups	%xmm0, 96(%r13)
	.loc	1 319 205               # CoinGame_original.c:319:205
	movaps	.LCPI1_7(%rip), %xmm0   # xmm0 = [110,116]
	movups	%xmm0, 112(%r13)
	.loc	1 319 235               # CoinGame_original.c:319:235
	movaps	.LCPI1_8(%rip), %xmm0   # xmm0 = [32,111]
	movups	%xmm0, 128(%r13)
	.loc	1 319 264               # CoinGame_original.c:319:264
	movaps	.LCPI1_9(%rip), %xmm0   # xmm0 = [102,32]
	movups	%xmm0, 144(%r13)
	.loc	1 319 293               # CoinGame_original.c:319:293
	movaps	.LCPI1_10(%rip), %xmm0  # xmm0 = [109,111]
	movups	%xmm0, 160(%r13)
	.loc	1 319 323               # CoinGame_original.c:319:323
	movaps	.LCPI1_11(%rip), %xmm0  # xmm0 = [110,101]
	movups	%xmm0, 176(%r13)
	.loc	1 319 353               # CoinGame_original.c:319:353
	movaps	.LCPI1_12(%rip), %xmm0  # xmm0 = [121,32]
	movups	%xmm0, 192(%r13)
	.loc	1 319 382               # CoinGame_original.c:319:382
	movaps	.LCPI1_13(%rip), %xmm0  # xmm0 = [40,109]
	movups	%xmm0, 208(%r13)
	.loc	1 319 411               # CoinGame_original.c:319:411
	movaps	.LCPI1_14(%rip), %xmm0  # xmm0 = [97,120]
	movups	%xmm0, 224(%r13)
	.loc	1 319 440               # CoinGame_original.c:319:440
	movaps	.LCPI1_15(%rip), %xmm0  # xmm0 = [105,109]
	movups	%xmm0, 240(%r13)
	.loc	1 319 470               # CoinGame_original.c:319:470
	movaps	.LCPI1_16(%rip), %xmm0  # xmm0 = [117,109]
	movups	%xmm0, 256(%r13)
	.loc	1 319 500               # CoinGame_original.c:319:500
	movaps	.LCPI1_17(%rip), %xmm0  # xmm0 = [41,32]
	movups	%xmm0, 272(%r13)
	.loc	1 319 528               # CoinGame_original.c:319:528
	movaps	.LCPI1_18(%rip), %xmm0  # xmm0 = [65,108]
	movups	%xmm0, 288(%r13)
	.loc	1 319 557               # CoinGame_original.c:319:557
	movaps	.LCPI1_19(%rip), %xmm0  # xmm0 = [105,99]
	movups	%xmm0, 304(%r13)
	.loc	1 319 586               # CoinGame_original.c:319:586
	movups	%xmm1, 320(%r13)
	.loc	1 319 615               # CoinGame_original.c:319:615
	movaps	.LCPI1_20(%rip), %xmm0  # xmm0 = [103,101]
	movups	%xmm0, 336(%r13)
	.loc	1 319 645               # CoinGame_original.c:319:645
	movaps	.LCPI1_21(%rip), %xmm0  # xmm0 = [116,115]
	movups	%xmm0, 352(%r13)
	.loc	1 319 675               # CoinGame_original.c:319:675
	movaps	.LCPI1_22(%rip), %xmm0  # xmm0 = [32,105]
	movups	%xmm0, 368(%r13)
	.loc	1 319 704               # CoinGame_original.c:319:704
	movaps	.LCPI1_23(%rip), %xmm0  # xmm0 = [115,32]
	movups	%xmm0, 384(%r13)
.Ltmp60:
	#DEBUG_VALUE: main:_18_dealloc <- 1
	.loc	1 322 2 is_stmt 1       # CoinGame_original.c:322:2
	movl	$50, %esi
	movq	%r13, %rdi
	callq	printf_s
	.loc	1 326 2                 # CoinGame_original.c:326:2
	movl	$.L.str, %edi
	xorl	%eax, %eax
	movq	%r12, %rsi
	callq	printf
.Ltmp61:
	#DEBUG_VALUE: main:_23_size <- 23
	.loc	1 331 2                 # CoinGame_original.c:331:2
	xorl	%edi, %edi
	movl	$23, %esi
	callq	create1DArray
	movq	%rax, %rbx
.Ltmp62:
	#DEBUG_VALUE: main:_23 <- %RBX
	.loc	1 332 9                 # CoinGame_original.c:332:9
	movaps	.LCPI1_24(%rip), %xmm0  # xmm0 = [80,97]
	movups	%xmm0, (%rbx)
	.loc	1 332 35 is_stmt 0      # CoinGame_original.c:332:35
	movaps	.LCPI1_25(%rip), %xmm0  # xmm0 = [115,115]
	movups	%xmm0, 16(%rbx)
	.loc	1 332 63                # CoinGame_original.c:332:63
	movaps	.LCPI1_26(%rip), %xmm0  # xmm0 = [32,67]
	movups	%xmm0, 32(%rbx)
	.loc	1 332 89                # CoinGame_original.c:332:89
	movaps	.LCPI1_27(%rip), %xmm0  # xmm0 = [111,105]
	movups	%xmm0, 48(%rbx)
	.loc	1 332 117               # CoinGame_original.c:332:117
	movaps	.LCPI1_28(%rip), %xmm0  # xmm0 = [110,71]
	movups	%xmm0, 64(%rbx)
	.loc	1 319 146 is_stmt 1     # CoinGame_original.c:319:146
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [97,109]
	.loc	1 332 145               # CoinGame_original.c:332:145
	movups	%xmm0, 80(%rbx)
	.loc	1 319 36                # CoinGame_original.c:319:36
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [101,32]
	.loc	1 332 174               # CoinGame_original.c:332:174
	movups	%xmm0, 96(%rbx)
	.loc	1 332 203 is_stmt 0     # CoinGame_original.c:332:203
	movaps	.LCPI1_29(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 112(%rbx)
	.loc	1 332 233               # CoinGame_original.c:332:233
	movaps	.LCPI1_30(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 128(%rbx)
	.loc	1 332 263               # CoinGame_original.c:332:263
	movaps	.LCPI1_31(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 144(%rbx)
	.loc	1 332 291               # CoinGame_original.c:332:291
	movaps	.LCPI1_32(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 160(%rbx)
	.loc	1 332 320               # CoinGame_original.c:332:320
	movq	$101, 176(%rbx)
.Ltmp63:
	#DEBUG_VALUE: main:_23_dealloc <- 1
	.loc	1 335 2 is_stmt 1       # CoinGame_original.c:335:2
	movl	$23, %esi
	movq	%rbx, %rdi
	callq	println_s
.Ltmp64:
	.loc	1 339 2 discriminator 1 # CoinGame_original.c:339:2
	movq	%r15, %rdi
	callq	free
.Ltmp65:
	#DEBUG_VALUE: main:max_dealloc <- 0
	.loc	1 340 2 discriminator 1 # CoinGame_original.c:340:2
	movq	%r14, %rdi
	callq	free
.Ltmp66:
	#DEBUG_VALUE: main:moves_dealloc <- 0
	.loc	1 346 2 discriminator 1 # CoinGame_original.c:346:2
	movq	%r13, %rdi
	callq	free
.Ltmp67:
	#DEBUG_VALUE: main:_18_dealloc <- 0
	.loc	1 347 2 discriminator 1 # CoinGame_original.c:347:2
	movq	%rbx, %rdi
	callq	free
.Ltmp68:
	#DEBUG_VALUE: main:_23_dealloc <- 0
.LBB1_2:                                # %if.end139
	#DEBUG_VALUE: main:_5 <- %R15
	#DEBUG_VALUE: main:max <- %R15
	.loc	1 348 2                 # CoinGame_original.c:348:2
	xorl	%edi, %edi
	callq	exit
.Ltmp69:
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
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git f82fb5beb88e841f7a00cfb2a2ceabe46bcb2a9b) (http://llvm.org/git/llvm.git bafbf2b643f118fd2ea402ed6cd204281c7e9e94)" # string offset=0
.Linfo_string1:
	.asciz	"CoinGame_original.c"   # string offset=165
.Linfo_string2:
	.asciz	"/home/mw169/workspace/WhileyOpenCL/polly/CoinGame/impl/original/copyreduced_dealloc" # string offset=185
.Linfo_string3:
	.asciz	"findMoves"             # string offset=269
.Linfo_string4:
	.asciz	"long long int"         # string offset=279
.Linfo_string5:
	.asciz	"main"                  # string offset=293
.Linfo_string6:
	.asciz	"int"                   # string offset=298
.Linfo_string7:
	.asciz	"_11"                   # string offset=302
.Linfo_string8:
	.asciz	"y"                     # string offset=306
.Linfo_string9:
	.asciz	"_12"                   # string offset=308
.Linfo_string10:
	.asciz	"_16"                   # string offset=312
.Linfo_string11:
	.asciz	"_14"                   # string offset=316
.Linfo_string12:
	.asciz	"_17"                   # string offset=320
.Linfo_string13:
	.asciz	"_21"                   # string offset=324
.Linfo_string14:
	.asciz	"_23"                   # string offset=328
.Linfo_string15:
	.asciz	"_24"                   # string offset=332
.Linfo_string16:
	.asciz	"x"                     # string offset=336
.Linfo_string17:
	.asciz	"_25"                   # string offset=338
.Linfo_string18:
	.asciz	"_27"                   # string offset=342
.Linfo_string19:
	.asciz	"_31"                   # string offset=346
.Linfo_string20:
	.asciz	"_35"                   # string offset=350
.Linfo_string21:
	.asciz	"_33"                   # string offset=354
.Linfo_string22:
	.asciz	"z"                     # string offset=358
.Linfo_string23:
	.asciz	"_32"                   # string offset=360
.Linfo_string24:
	.asciz	"_13"                   # string offset=364
.Linfo_string25:
	.asciz	"_18"                   # string offset=368
.Linfo_string26:
	.asciz	"_52"                   # string offset=372
.Linfo_string27:
	.asciz	"i"                     # string offset=376
.Linfo_string28:
	.asciz	"_38"                   # string offset=378
.Linfo_string29:
	.asciz	"_40"                   # string offset=382
.Linfo_string30:
	.asciz	"_51"                   # string offset=386
.Linfo_string31:
	.asciz	"_49"                   # string offset=390
.Linfo_string32:
	.asciz	"_53"                   # string offset=394
.Linfo_string33:
	.asciz	"s"                     # string offset=398
.Linfo_string34:
	.asciz	"_54"                   # string offset=400
.Linfo_string35:
	.asciz	"moves"                 # string offset=404
.Linfo_string36:
	.asciz	"moves_size"            # string offset=410
.Linfo_string37:
	.asciz	"moves_dealloc"         # string offset=421
.Linfo_string38:
	.asciz	"_Bool"                 # string offset=435
.Linfo_string39:
	.asciz	"n"                     # string offset=441
.Linfo_string40:
	.asciz	"_2"                    # string offset=443
.Linfo_string41:
	.asciz	"_2_size"               # string offset=446
.Linfo_string42:
	.asciz	"_2_dealloc"            # string offset=454
.Linfo_string43:
	.asciz	"j"                     # string offset=465
.Linfo_string44:
	.asciz	"_9"                    # string offset=467
.Linfo_string45:
	.asciz	"_10"                   # string offset=470
.Linfo_string46:
	.asciz	"_15"                   # string offset=474
.Linfo_string47:
	.asciz	"_19"                   # string offset=478
.Linfo_string48:
	.asciz	"_20"                   # string offset=482
.Linfo_string49:
	.asciz	"_22"                   # string offset=486
.Linfo_string50:
	.asciz	"_26"                   # string offset=490
.Linfo_string51:
	.asciz	"_28"                   # string offset=494
.Linfo_string52:
	.asciz	"_29"                   # string offset=498
.Linfo_string53:
	.asciz	"_30"                   # string offset=502
.Linfo_string54:
	.asciz	"_34"                   # string offset=506
.Linfo_string55:
	.asciz	"_36"                   # string offset=510
.Linfo_string56:
	.asciz	"_37"                   # string offset=514
.Linfo_string57:
	.asciz	"_39"                   # string offset=518
.Linfo_string58:
	.asciz	"_41"                   # string offset=522
.Linfo_string59:
	.asciz	"_42"                   # string offset=526
.Linfo_string60:
	.asciz	"_43"                   # string offset=530
.Linfo_string61:
	.asciz	"_44"                   # string offset=534
.Linfo_string62:
	.asciz	"_45"                   # string offset=538
.Linfo_string63:
	.asciz	"_46"                   # string offset=542
.Linfo_string64:
	.asciz	"_47"                   # string offset=546
.Linfo_string65:
	.asciz	"_48"                   # string offset=550
.Linfo_string66:
	.asciz	"_50"                   # string offset=554
.Linfo_string67:
	.asciz	"argc"                  # string offset=558
.Linfo_string68:
	.asciz	"args"                  # string offset=563
.Linfo_string69:
	.asciz	"char"                  # string offset=568
.Linfo_string70:
	.asciz	"max_dealloc"           # string offset=573
.Linfo_string71:
	.asciz	"sum_alice"             # string offset=585
.Linfo_string72:
	.asciz	"_5_dealloc"            # string offset=595
.Linfo_string73:
	.asciz	"_6_size"               # string offset=606
.Linfo_string74:
	.asciz	"_6_size_size"          # string offset=614
.Linfo_string75:
	.asciz	"_6_dealloc"            # string offset=627
.Linfo_string76:
	.asciz	"_7"                    # string offset=638
.Linfo_string77:
	.asciz	"_8_size"               # string offset=641
.Linfo_string78:
	.asciz	"_8_dealloc"            # string offset=649
.Linfo_string79:
	.asciz	"_11_size"              # string offset=660
.Linfo_string80:
	.asciz	"_11_dealloc"           # string offset=669
.Linfo_string81:
	.asciz	"_12_size"              # string offset=681
.Linfo_string82:
	.asciz	"_12_dealloc"           # string offset=690
.Linfo_string83:
	.asciz	"_18_size"              # string offset=702
.Linfo_string84:
	.asciz	"_18_dealloc"           # string offset=711
.Linfo_string85:
	.asciz	"_23_size"              # string offset=723
.Linfo_string86:
	.asciz	"_23_dealloc"           # string offset=732
.Linfo_string87:
	.asciz	"_6"                    # string offset=744
.Linfo_string88:
	.asciz	"_8"                    # string offset=747
.Linfo_string89:
	.asciz	"max"                   # string offset=750
.Linfo_string90:
	.asciz	"_5"                    # string offset=754
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
	.quad	.Ltmp32-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	91                      # DW_OP_reg11
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp32-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	91                      # DW_OP_reg11
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp32-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	91                      # DW_OP_reg11
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp32-.Lfunc_begin0
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
	.quad	.Ltmp31-.Lfunc_begin0
	.quad	.Ltmp32-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	90                      # DW_OP_reg10
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp31-.Lfunc_begin0
	.quad	.Ltmp32-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	90                      # DW_OP_reg10
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp65-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Ltmp62-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp58-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp57-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp58-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp58-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	50                      # 50
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp60-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp67-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp61-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp61-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	23                      # 23
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc23:
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Ltmp62-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
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
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	15                      # DW_FORM_udata
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
	.byte	10                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	12                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	13                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	14                      # Abbreviation Code
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
	.long	1392                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x569 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x1 DW_TAG_pointer_type
	.byte	3                       # Abbrev [3] 0x2b:0x2e3 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1347                    # DW_AT_type
                                        # DW_AT_external
	.byte	4                       # Abbrev [4] 0x44:0xb DW_TAG_formal_parameter
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1347                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x4f:0xb DW_TAG_formal_parameter
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x5a:0xb DW_TAG_formal_parameter
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1366                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x65:0xb DW_TAG_formal_parameter
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x70:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x7c:0xf DW_TAG_variable
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x8b:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x97:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xa3:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	16                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xaf:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xbb:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	23                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0xc7:0xf DW_TAG_variable
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	25                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xd6:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0xe2:0xf DW_TAG_variable
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xf1:0xc DW_TAG_variable
	.byte	2                       # DW_AT_const_value
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xfd:0xc DW_TAG_variable
	.byte	2                       # DW_AT_const_value
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	29                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x109:0xf DW_TAG_variable
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	33                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x118:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	37                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x124:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x130:0xf DW_TAG_variable
	.long	.Ldebug_loc4            # DW_AT_location
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x13f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x14b:0xf DW_TAG_variable
	.long	.Ldebug_loc5            # DW_AT_location
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x15a:0xf DW_TAG_variable
	.long	.Ldebug_loc6            # DW_AT_location
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	20                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x169:0xf DW_TAG_variable
	.long	.Ldebug_loc7            # DW_AT_location
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	54                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x178:0xf DW_TAG_variable
	.long	.Ldebug_loc8            # DW_AT_location
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x187:0xc DW_TAG_variable
	.byte	2                       # DW_AT_const_value
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	40                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x193:0xf DW_TAG_variable
	.long	.Ldebug_loc9            # DW_AT_location
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	42                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1a2:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	53                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1ae:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1ba:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	55                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x1c6:0xf DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x1d5:0xf DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	56                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x1e4:0xb DW_TAG_variable
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	1347                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x1ef:0xb DW_TAG_variable
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x1fa:0xb DW_TAG_variable
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	1366                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x205:0xb DW_TAG_variable
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x210:0xb DW_TAG_variable
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x21b:0xb DW_TAG_variable
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x226:0xb DW_TAG_variable
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	17                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x231:0xb DW_TAG_variable
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	21                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x23c:0xb DW_TAG_variable
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	22                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x247:0xb DW_TAG_variable
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	24                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x252:0xb DW_TAG_variable
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	28                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x25d:0xb DW_TAG_variable
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	30                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x268:0xb DW_TAG_variable
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x273:0xb DW_TAG_variable
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x27e:0xb DW_TAG_variable
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x289:0xb DW_TAG_variable
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	38                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x294:0xb DW_TAG_variable
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	39                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x29f:0xb DW_TAG_variable
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	41                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x2aa:0xb DW_TAG_variable
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	43                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x2b5:0xb DW_TAG_variable
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x2c0:0xb DW_TAG_variable
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	45                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x2cb:0xb DW_TAG_variable
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	46                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x2d6:0xb DW_TAG_variable
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	47                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x2e1:0xb DW_TAG_variable
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	48                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x2ec:0xb DW_TAG_variable
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	49                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x2f7:0xb DW_TAG_variable
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	50                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x302:0xb DW_TAG_variable
	.long	.Linfo_string66         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	52                      # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	3                       # Abbrev [3] 0x30e:0x235 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	235                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1359                    # DW_AT_type
                                        # DW_AT_external
	.byte	8                       # Abbrev [8] 0x327:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	235                     # DW_AT_decl_line
	.long	1359                    # DW_AT_type
	.byte	8                       # Abbrev [8] 0x336:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	235                     # DW_AT_decl_line
	.long	1373                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x345:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	237                     # DW_AT_decl_line
	.long	1366                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x354:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	238                     # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x363:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	239                     # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x36f:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	240                     # DW_AT_decl_line
	.long	1366                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x37e:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	241                     # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0x38d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	243                     # DW_AT_decl_line
	.long	1366                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x399:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	244                     # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x3a5:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	244                     # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0x3b1:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string75         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	245                     # DW_AT_decl_line
	.long	1366                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x3bd:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string76         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	246                     # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x3c9:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string77         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	247                     # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0x3d5:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string78         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	248                     # DW_AT_decl_line
	.long	1366                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x3e1:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	249                     # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x3ed:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	250                     # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x3f9:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	251                     # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0x405:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string80         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	252                     # DW_AT_decl_line
	.long	1366                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x411:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string81         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	253                     # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0x41d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string82         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	254                     # DW_AT_decl_line
	.long	1366                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x429:0xf DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	255                     # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x438:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	256                     # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x445:0x10 DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	257                     # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x455:0x10 DW_TAG_variable
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string83         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	259                     # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x465:0x10 DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string84         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	260                     # DW_AT_decl_line
	.long	1366                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x475:0x10 DW_TAG_variable
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string85         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	263                     # DW_AT_decl_line
	.long	1352                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x485:0x10 DW_TAG_variable
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string86         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	264                     # DW_AT_decl_line
	.long	1366                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x495:0xf DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string87         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	244                     # DW_AT_decl_line
	.long	1390                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x4a4:0xf DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string88         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	247                     # DW_AT_decl_line
	.long	1347                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x4b3:0xf DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	.Linfo_string89         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	236                     # DW_AT_decl_line
	.long	1347                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x4c2:0xf DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	.Linfo_string90         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	242                     # DW_AT_decl_line
	.long	1347                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x4d1:0xf DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	239                     # DW_AT_decl_line
	.long	1347                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x4e0:0xf DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	251                     # DW_AT_decl_line
	.long	1347                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x4ef:0xf DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	253                     # DW_AT_decl_line
	.long	1347                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x4fe:0x10 DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	259                     # DW_AT_decl_line
	.long	1347                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x50e:0x10 DW_TAG_variable
	.long	.Ldebug_loc32           # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	263                     # DW_AT_decl_line
	.long	1347                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x51e:0xc DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	258                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x52a:0xc DW_TAG_variable
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	261                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x536:0xc DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	262                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	13                      # Abbrev [13] 0x543:0x5 DW_TAG_pointer_type
	.long	1352                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x548:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	14                      # Abbrev [14] 0x54f:0x7 DW_TAG_base_type
	.long	.Linfo_string6          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	14                      # Abbrev [14] 0x556:0x7 DW_TAG_base_type
	.long	.Linfo_string38         # DW_AT_name
	.byte	2                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	13                      # Abbrev [13] 0x55d:0x5 DW_TAG_pointer_type
	.long	1378                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x562:0x5 DW_TAG_pointer_type
	.long	1383                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x567:0x7 DW_TAG_base_type
	.long	.Linfo_string69         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	13                      # Abbrev [13] 0x56e:0x5 DW_TAG_pointer_type
	.long	1347                    # DW_AT_type
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
	.long	1396                    # Compilation Unit Length
	.long	782                     # DIE offset
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
	.long	1396                    # Compilation Unit Length
	.long	1352                    # DIE offset
	.asciz	"long long int"         # External Name
	.long	1359                    # DIE offset
	.asciz	"int"                   # External Name
	.long	1366                    # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	1383                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git f82fb5beb88e841f7a00cfb2a2ceabe46bcb2a9b) (http://llvm.org/git/llvm.git bafbf2b643f118fd2ea402ed6cd204281c7e9e94)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
