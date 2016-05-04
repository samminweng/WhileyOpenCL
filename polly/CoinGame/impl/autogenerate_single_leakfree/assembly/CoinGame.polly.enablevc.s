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
	movabsq	$9223372036854775805, %r9 # imm = 0x7FFFFFFFFFFFFFFD
	leaq	2(%r9), %r8
	cmpq	%r8, %rcx
	jne	.LBB0_16
# BB#1:                                 # %while.cond1.preheader.preheader
	xorl	%r10d, %r10d
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB0_2:                                # %while.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
.Ltmp12:
	.loc	1 73 7 prologue_end     # CoinGame.c:73:7
	leaq	(%r14,%r9), %r11
	movq	$-2, %rax
	movq	%r9, %r15
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB0_3:                                # %if.end5
                                        #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp13:
	#DEBUG_VALUE: findMoves:_11 <- 0
	#DEBUG_VALUE: findMoves:y <- 0
	#DEBUG_VALUE: findMoves:_12 <- 1
	.loc	1 81 9                  # CoinGame.c:81:9
	leaq	2(%r14,%rax), %rsi
.Ltmp14:
	.loc	1 91 10                 # CoinGame.c:91:10
	testq	%rsi, %rsi
.Ltmp15:
	#DEBUG_VALUE: findMoves:_16 <- 0
	#DEBUG_VALUE: findMoves:_14 <- 1
	jle	.LBB0_4
.Ltmp16:
# BB#5:                                 # %if.end5
                                        #   in Loop: Header=BB0_3 Depth=2
	.loc	1 83 10                 # CoinGame.c:83:10
	leaq	(%rax,%r9), %rcx
	cmpq	$-7, %rcx
	movl	$0, %ebx
	je	.LBB0_7
.Ltmp17:
# BB#6:                                 # %if.end11
                                        #   in Loop: Header=BB0_3 Depth=2
	#DEBUG_VALUE: findMoves:_17 <- 1
	#DEBUG_VALUE: findMoves:_21 <- 1
	.loc	1 105 8                 # CoinGame.c:105:8
	leaq	(%r11,%r12), %rcx
	movq	8(%rdi,%rcx,8), %rbx
.Ltmp18:
	#DEBUG_VALUE: findMoves:_23 <- %RBX
	#DEBUG_VALUE: findMoves:y <- %RBX
	jmp	.LBB0_7
.Ltmp19:
	.p2align	4, 0x90
.LBB0_4:                                #   in Loop: Header=BB0_3 Depth=2
	xorl	%ebx, %ebx
.LBB0_7:                                # %blklab4
                                        #   in Loop: Header=BB0_3 Depth=2
.Ltmp20:
	#DEBUG_VALUE: findMoves:_24 <- 0
	#DEBUG_VALUE: findMoves:x <- 0
	#DEBUG_VALUE: findMoves:_25 <- 2
	.loc	1 119 10                # CoinGame.c:119:10
	testq	%r15, %r15
	movl	$0, %edx
	je	.LBB0_9
.Ltmp21:
# BB#8:                                 # %if.end18
                                        #   in Loop: Header=BB0_3 Depth=2
	#DEBUG_VALUE: findMoves:_27 <- 2
	.loc	1 129 8                 # CoinGame.c:129:8
	leaq	(%r14,%r12), %rcx
	movq	-16(%rdi,%rcx,8), %rdx
.Ltmp22:
	#DEBUG_VALUE: findMoves:_31 <- %RDX
	#DEBUG_VALUE: findMoves:x <- %RDX
.LBB0_9:                                # %blklab5
                                        #   in Loop: Header=BB0_3 Depth=2
	#DEBUG_VALUE: findMoves:_32 <- 0
	#DEBUG_VALUE: findMoves:z <- 0
	#DEBUG_VALUE: findMoves:_33 <- 1
	#DEBUG_VALUE: findMoves:_35 <- 0
	.loc	1 145 10                # CoinGame.c:145:10
	cmpq	$2, %rsi
	movl	$0, %esi
	jl	.LBB0_11
.Ltmp23:
# BB#10:                                # %if.end26
                                        #   in Loop: Header=BB0_3 Depth=2
	#DEBUG_VALUE: findMoves:_38 <- 2
	.loc	1 155 8                 # CoinGame.c:155:8
	leaq	(%r14,%r12), %rsi
	movq	-16(%rdi,%rsi,8), %rsi
.Ltmp24:
	#DEBUG_VALUE: findMoves:_40 <- %RSI
	#DEBUG_VALUE: findMoves:z <- %RSI
.LBB0_11:                               # %blklab6
                                        #   in Loop: Header=BB0_3 Depth=2
	.loc	1 161 10                # CoinGame.c:161:10
	movq	%rdx, %rcx
	xorq	%rbx, %rcx
	cmpq	%rbx, %rdx
	cmovgeq	%r10, %rcx
	xorq	%rbx, %rcx
.Ltmp25:
	#DEBUG_VALUE: findMoves:_42 <- %RCX
	.loc	1 165 10                # CoinGame.c:165:10
	movq	%rsi, %rdx
	xorq	%rbx, %rdx
	cmpq	%rsi, %rbx
	cmovgeq	%r10, %rdx
	xorq	%rsi, %rdx
.Ltmp26:
	#DEBUG_VALUE: findMoves:_44 <- %RDX
	.loc	1 169 10                # CoinGame.c:169:10
	leaq	2(%rax,%rcx), %rcx
.Ltmp27:
	leaq	(%r14,%rax), %rsi
	leaq	2(%rdx,%rsi), %rdx
.Ltmp28:
	movq	%rdx, %rsi
	xorq	%rcx, %rsi
	cmpq	%rdx, %rcx
	cmovgeq	%r10, %rsi
	xorq	%rcx, %rsi
.Ltmp29:
	#DEBUG_VALUE: findMoves:_41 <- %RSI
	.loc	1 175 4                 # CoinGame.c:175:4
	leaq	(%r14,%r12), %rcx
	.loc	1 175 15 is_stmt 0      # CoinGame.c:175:15
	movq	%rsi, (%rdi,%rcx,8)
	.loc	1 73 7 is_stmt 1        # CoinGame.c:73:7
	leaq	3(%r12,%r9), %r12
	decq	%r15
	leaq	1(%r11,%rax), %rcx
.Ltmp30:
	#DEBUG_VALUE: findMoves:_50 <- 1
	#DEBUG_VALUE: findMoves:_48 <- 1
	incq	%rax
	cmpq	$-6, %rcx
	jne	.LBB0_3
.Ltmp31:
# BB#12:                                # %blklab2
                                        #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: findMoves:_41 <- %RSI
	#DEBUG_VALUE: findMoves:_52 <- 1
	.loc	1 196 8                 # CoinGame.c:196:8
	incq	%r14
.Ltmp32:
	#DEBUG_VALUE: findMoves:s <- %R14
	#DEBUG_VALUE: findMoves:_53 <- %R14
	.loc	1 63 6                  # CoinGame.c:63:6
	cmpq	%r8, %r14
	jne	.LBB0_2
	jmp	.LBB0_13
.Ltmp33:
.LBB0_16:                               # %polly.loop_if
	.loc	1 63 7 is_stmt 0        # CoinGame.c:63:7
	testq	%rcx, %rcx
	jle	.LBB0_13
.Ltmp34:
# BB#17:                                # %polly.loop_preheader
	leaq	(,%rcx,8), %r8
	leaq	8(,%rcx,8), %r11
	movq	%rcx, %r10
	shlq	$4, %r10
	xorl	%r15d, %r15d
	movq	%rdi, -8(%rsp)          # 8-byte Spill
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB0_14:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_19 Depth 2
	movq	%rcx, %r14
	subq	%r12, %r14
	jle	.LBB0_15
# BB#18:                                # %polly.loop_preheader158
                                        #   in Loop: Header=BB0_14 Depth=1
	decq	%r14
	movq	$-1, %rbx
	movq	-8(%rsp), %rdx          # 8-byte Reload
	.p2align	4, 0x90
.LBB0_19:                               # %polly.loop_header157
                                        #   Parent Loop BB0_14 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	3(%rbx), %rax
	leaq	1(%r12,%rbx), %rbp
	cmpq	%rcx, %rax
	jg	.LBB0_20
# BB#21:                                # %polly.loop_header157
                                        #   in Loop: Header=BB0_19 Depth=2
	testq	%rbp, %rbp
	movl	$0, %eax
	jle	.LBB0_22
# BB#25:                                # %polly.stmt.if.end11
                                        #   in Loop: Header=BB0_19 Depth=2
	movq	-8(%r8,%rdx), %rax
	jmp	.LBB0_22
	.p2align	4, 0x90
.LBB0_20:                               #   in Loop: Header=BB0_19 Depth=2
	xorl	%eax, %eax
.LBB0_22:                               # %polly.cond168
                                        #   in Loop: Header=BB0_19 Depth=2
	leaq	4(%rbx), %rsi
	cmpq	%rcx, %rsi
	movl	$0, %r13d
	jg	.LBB0_23
# BB#26:                                # %polly.stmt.if.end18
                                        #   in Loop: Header=BB0_19 Depth=2
	movq	(%r10,%rdx), %r13
.LBB0_23:                               # %polly.cond178
                                        #   in Loop: Header=BB0_19 Depth=2
	cmpq	$1, %rbp
	movl	$0, %r9d
	jle	.LBB0_24
# BB#27:                                # %polly.stmt.if.end26
                                        #   in Loop: Header=BB0_19 Depth=2
	movq	-16(%rdx), %r9
.LBB0_24:                               # %polly.stmt.blklab6
                                        #   in Loop: Header=BB0_19 Depth=2
.Ltmp35:
	.loc	1 161 10 is_stmt 1      # CoinGame.c:161:10
	movq	%r13, %rbp
	xorq	%rax, %rbp
	cmpq	%rax, %r13
	cmovgeq	%r15, %rbp
	xorq	%rax, %rbp
	.loc	1 165 10                # CoinGame.c:165:10
	movq	%r9, %rsi
	xorq	%rax, %rsi
	cmpq	%r9, %rax
	cmovgeq	%r15, %rsi
	xorq	%r9, %rsi
	.loc	1 169 10                # CoinGame.c:169:10
	leaq	1(%rbx,%rbp), %rax
	leaq	(%r12,%rbx), %rbp
	leaq	1(%rsi,%rbp), %rbp
	movq	%rbp, %rsi
	xorq	%rax, %rsi
	cmpq	%rbp, %rax
	cmovgeq	%r15, %rsi
	xorq	%rax, %rsi
	movq	%rsi, (%rdx)
	addq	%r11, %rdx
	incq	%rbx
	cmpq	%r14, %rbx
	jl	.LBB0_19
.Ltmp36:
.LBB0_15:                               # %polly.loop_exit159
                                        #   in Loop: Header=BB0_14 Depth=1
	incq	%r12
	addq	$8, -8(%rsp)            # 8-byte Folded Spill
	cmpq	%rcx, %r12
	jne	.LBB0_14
.LBB0_13:                               # %if.end58
	.loc	1 206 2                 # CoinGame.c:206:2
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
	.loc	1 210 0                 # CoinGame.c:210:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp38:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp39:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp40:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp41:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp42:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp43:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Ltmp44:
	.cfi_def_cfa_offset 64
.Ltmp45:
	.cfi_offset %rbx, -56
.Ltmp46:
	.cfi_offset %r12, -48
.Ltmp47:
	.cfi_offset %r13, -40
.Ltmp48:
	.cfi_offset %r14, -32
.Ltmp49:
	.cfi_offset %r15, -24
.Ltmp50:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
	movl	%edi, %ebx
.Ltmp51:
	#DEBUG_VALUE: main:_23_has_ownership <- 0
	#DEBUG_VALUE: main:_23_size <- 0
	#DEBUG_VALUE: main:_18_has_ownership <- 0
	#DEBUG_VALUE: main:_18_size <- 0
	#DEBUG_VALUE: main:_15 <- 0
	#DEBUG_VALUE: main:_14 <- 0
	#DEBUG_VALUE: main:_13 <- 0
	#DEBUG_VALUE: main:_12_has_ownership <- 0
	#DEBUG_VALUE: main:_12_size <- 0
	#DEBUG_VALUE: main:_11_has_ownership <- 0
	#DEBUG_VALUE: main:_11_size <- 0
	#DEBUG_VALUE: main:_10 <- 0
	#DEBUG_VALUE: main:_9 <- 0
	#DEBUG_VALUE: main:_8_has_ownership <- 0
	#DEBUG_VALUE: main:_8_size <- 0
	#DEBUG_VALUE: main:_7 <- 0
	#DEBUG_VALUE: main:_6_has_ownership <- 0
	#DEBUG_VALUE: main:_6_size_size <- 0
	#DEBUG_VALUE: main:_6_size <- 0
	#DEBUG_VALUE: main:sum_alice <- 0
	#DEBUG_VALUE: main:moves_has_ownership <- 0
	#DEBUG_VALUE: main:moves_size <- 0
	#DEBUG_VALUE: main:n <- 0
	#DEBUG_VALUE: main:argc <- %EBX
	.loc	1 239 2 prologue_end    # CoinGame.c:239:2
	callq	convertArgsToIntArray
.Ltmp52:
	movq	%rax, %r15
.Ltmp53:
	#DEBUG_VALUE: main:_6 <- %R15
	decl	%ebx
.Ltmp54:
	movslq	%ebx, %r14
.Ltmp55:
	#DEBUG_VALUE: main:_6_has_ownership <- 1
	#DEBUG_VALUE: main:_6_size <- %EBX
	.loc	1 244 5                 # CoinGame.c:244:5
	movq	(%r15), %rdi
.Ltmp56:
	#DEBUG_VALUE: main:_8 <- %RDI
	.loc	1 247 2                 # CoinGame.c:247:2
	callq	parseStringToInt
.Ltmp57:
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_5 <- %RAX
	.loc	1 251 9                 # CoinGame.c:251:9
	testq	%rax, %rax
	jne	.LBB1_1
.Ltmp58:
# BB#2:                                 # %if.end122.critedge
	#DEBUG_VALUE: main:_5 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_6_size <- %EBX
	#DEBUG_VALUE: main:_6 <- %R15
	.loc	1 312 2 discriminator 1 # CoinGame.c:312:2
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	free2DArray
.Ltmp59:
	#DEBUG_VALUE: main:_6_has_ownership <- 0
	.loc	1 318 2                 # CoinGame.c:318:2
	xorl	%edi, %edi
	callq	exit
.Ltmp60:
.LBB1_1:                                # %if.then103
	#DEBUG_VALUE: main:_5 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_6_size <- %EBX
	#DEBUG_VALUE: main:_6 <- %R15
	.loc	1 253 6                 # CoinGame.c:253:6
	movq	(%rax), %rbx
.Ltmp61:
	#DEBUG_VALUE: main:_9 <- 0
	#DEBUG_VALUE: main:n <- %RBX
	.loc	1 257 7                 # CoinGame.c:257:7
	movl	%ebx, %esi
	imull	%esi, %esi
	.loc	1 260 2                 # CoinGame.c:260:2
	xorl	%edi, %edi
	callq	gen1DArray
.Ltmp62:
	#DEBUG_VALUE: main:moves <- %RAX
	#DEBUG_VALUE: main:_11 <- %RAX
	#DEBUG_VALUE: main:_11_has_ownership <- 0
	#DEBUG_VALUE: main:moves_has_ownership <- 0
	.loc	1 271 8                 # CoinGame.c:271:8
	xorl	%edx, %edx
	movq	%rax, %rdi
	movq	%rbx, %rcx
	callq	findMoves
.Ltmp63:
	movq	%rax, %r12
.Ltmp64:
	#DEBUG_VALUE: main:_12 <- %R12
	#DEBUG_VALUE: main:moves <- %R12
	#DEBUG_VALUE: main:_13 <- 1
	#DEBUG_VALUE: main:_12_has_ownership <- 0
	#DEBUG_VALUE: main:moves_has_ownership <- 1
	.loc	1 283 6                 # CoinGame.c:283:6
	movq	-8(%r12,%rbx,8), %r13
.Ltmp65:
	#DEBUG_VALUE: main:_18_size <- 50
	#DEBUG_VALUE: main:_15 <- %R13
	#DEBUG_VALUE: main:sum_alice <- %R13
	.loc	1 290 2                 # CoinGame.c:290:2
	movl	$400, %edi              # imm = 0x190
	callq	malloc
	movq	%rax, %rbp
.Ltmp66:
	#DEBUG_VALUE: main:_18 <- %RBP
	.loc	1 291 9                 # CoinGame.c:291:9
	movaps	.LCPI1_0(%rip), %xmm0   # xmm0 = [84,104]
	movups	%xmm0, (%rbp)
	.loc	1 291 36 is_stmt 0      # CoinGame.c:291:36
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [101,32]
	movups	%xmm0, 16(%rbp)
	movaps	%xmm0, %xmm1
	.loc	1 291 63                # CoinGame.c:291:63
	movaps	.LCPI1_2(%rip), %xmm0   # xmm0 = [116,111]
	movups	%xmm0, 32(%rbp)
	.loc	1 291 91                # CoinGame.c:291:91
	movaps	.LCPI1_3(%rip), %xmm0   # xmm0 = [116,97]
	movups	%xmm0, 48(%rbp)
	.loc	1 291 118               # CoinGame.c:291:118
	movaps	.LCPI1_4(%rip), %xmm0   # xmm0 = [108,32]
	movups	%xmm0, 64(%rbp)
	.loc	1 291 146               # CoinGame.c:291:146
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [97,109]
	movups	%xmm0, 80(%rbp)
	.loc	1 291 175               # CoinGame.c:291:175
	movaps	.LCPI1_6(%rip), %xmm0   # xmm0 = [111,117]
	movups	%xmm0, 96(%rbp)
	.loc	1 291 205               # CoinGame.c:291:205
	movaps	.LCPI1_7(%rip), %xmm0   # xmm0 = [110,116]
	movups	%xmm0, 112(%rbp)
	.loc	1 291 235               # CoinGame.c:291:235
	movaps	.LCPI1_8(%rip), %xmm0   # xmm0 = [32,111]
	movups	%xmm0, 128(%rbp)
	.loc	1 291 264               # CoinGame.c:291:264
	movaps	.LCPI1_9(%rip), %xmm0   # xmm0 = [102,32]
	movups	%xmm0, 144(%rbp)
	.loc	1 291 293               # CoinGame.c:291:293
	movaps	.LCPI1_10(%rip), %xmm0  # xmm0 = [109,111]
	movups	%xmm0, 160(%rbp)
	.loc	1 291 323               # CoinGame.c:291:323
	movaps	.LCPI1_11(%rip), %xmm0  # xmm0 = [110,101]
	movups	%xmm0, 176(%rbp)
	.loc	1 291 353               # CoinGame.c:291:353
	movaps	.LCPI1_12(%rip), %xmm0  # xmm0 = [121,32]
	movups	%xmm0, 192(%rbp)
	.loc	1 291 382               # CoinGame.c:291:382
	movaps	.LCPI1_13(%rip), %xmm0  # xmm0 = [40,109]
	movups	%xmm0, 208(%rbp)
	.loc	1 291 411               # CoinGame.c:291:411
	movaps	.LCPI1_14(%rip), %xmm0  # xmm0 = [97,120]
	movups	%xmm0, 224(%rbp)
	.loc	1 291 440               # CoinGame.c:291:440
	movaps	.LCPI1_15(%rip), %xmm0  # xmm0 = [105,109]
	movups	%xmm0, 240(%rbp)
	.loc	1 291 470               # CoinGame.c:291:470
	movaps	.LCPI1_16(%rip), %xmm0  # xmm0 = [117,109]
	movups	%xmm0, 256(%rbp)
	.loc	1 291 500               # CoinGame.c:291:500
	movaps	.LCPI1_17(%rip), %xmm0  # xmm0 = [41,32]
	movups	%xmm0, 272(%rbp)
	.loc	1 291 528               # CoinGame.c:291:528
	movaps	.LCPI1_18(%rip), %xmm0  # xmm0 = [65,108]
	movups	%xmm0, 288(%rbp)
	.loc	1 291 557               # CoinGame.c:291:557
	movaps	.LCPI1_19(%rip), %xmm0  # xmm0 = [105,99]
	movups	%xmm0, 304(%rbp)
	.loc	1 291 586               # CoinGame.c:291:586
	movups	%xmm1, 320(%rbp)
	.loc	1 291 615               # CoinGame.c:291:615
	movaps	.LCPI1_20(%rip), %xmm0  # xmm0 = [103,101]
	movups	%xmm0, 336(%rbp)
	.loc	1 291 645               # CoinGame.c:291:645
	movaps	.LCPI1_21(%rip), %xmm0  # xmm0 = [116,115]
	movups	%xmm0, 352(%rbp)
	.loc	1 291 675               # CoinGame.c:291:675
	movaps	.LCPI1_22(%rip), %xmm0  # xmm0 = [32,105]
	movups	%xmm0, 368(%rbp)
	.loc	1 291 704               # CoinGame.c:291:704
	movaps	.LCPI1_23(%rip), %xmm0  # xmm0 = [115,32]
	movups	%xmm0, 384(%rbp)
.Ltmp67:
	#DEBUG_VALUE: main:_18_has_ownership <- 1
	.loc	1 294 2 is_stmt 1       # CoinGame.c:294:2
	movl	$50, %esi
	movq	%rbp, %rdi
	callq	printf_s
	.loc	1 298 2                 # CoinGame.c:298:2
	movl	$.L.str, %edi
	xorl	%eax, %eax
	movq	%r13, %rsi
	callq	printf
.Ltmp68:
	#DEBUG_VALUE: main:_23_size <- 23
	.loc	1 303 2                 # CoinGame.c:303:2
	movl	$184, %edi
	callq	malloc
	movq	%rax, %rbx
.Ltmp69:
	#DEBUG_VALUE: main:_23 <- %RBX
	.loc	1 304 9                 # CoinGame.c:304:9
	movaps	.LCPI1_24(%rip), %xmm0  # xmm0 = [80,97]
	movups	%xmm0, (%rbx)
	.loc	1 304 35 is_stmt 0      # CoinGame.c:304:35
	movaps	.LCPI1_25(%rip), %xmm0  # xmm0 = [115,115]
	movups	%xmm0, 16(%rbx)
	.loc	1 304 63                # CoinGame.c:304:63
	movaps	.LCPI1_26(%rip), %xmm0  # xmm0 = [32,67]
	movups	%xmm0, 32(%rbx)
	.loc	1 304 89                # CoinGame.c:304:89
	movaps	.LCPI1_27(%rip), %xmm0  # xmm0 = [111,105]
	movups	%xmm0, 48(%rbx)
	.loc	1 304 117               # CoinGame.c:304:117
	movaps	.LCPI1_28(%rip), %xmm0  # xmm0 = [110,71]
	movups	%xmm0, 64(%rbx)
	.loc	1 291 146 is_stmt 1     # CoinGame.c:291:146
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [97,109]
	.loc	1 304 145               # CoinGame.c:304:145
	movups	%xmm0, 80(%rbx)
	.loc	1 291 36                # CoinGame.c:291:36
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [101,32]
	.loc	1 304 174               # CoinGame.c:304:174
	movups	%xmm0, 96(%rbx)
	.loc	1 304 203 is_stmt 0     # CoinGame.c:304:203
	movaps	.LCPI1_29(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 112(%rbx)
	.loc	1 304 233               # CoinGame.c:304:233
	movaps	.LCPI1_30(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 128(%rbx)
	.loc	1 304 263               # CoinGame.c:304:263
	movaps	.LCPI1_31(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 144(%rbx)
	.loc	1 304 291               # CoinGame.c:304:291
	movaps	.LCPI1_32(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 160(%rbx)
	.loc	1 304 320               # CoinGame.c:304:320
	movq	$101, 176(%rbx)
.Ltmp70:
	#DEBUG_VALUE: main:_23_has_ownership <- 1
	.loc	1 307 2 is_stmt 1       # CoinGame.c:307:2
	movl	$23, %esi
	movq	%rbx, %rdi
	callq	println_s
.Ltmp71:
	.loc	1 311 2 discriminator 1 # CoinGame.c:311:2
	movq	%r12, %rdi
	callq	free
.Ltmp72:
	#DEBUG_VALUE: main:moves_has_ownership <- 0
	.loc	1 312 2 discriminator 1 # CoinGame.c:312:2
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	free2DArray
.Ltmp73:
	#DEBUG_VALUE: main:_6_has_ownership <- 0
	.loc	1 316 2 discriminator 1 # CoinGame.c:316:2
	movq	%rbp, %rdi
	callq	free
.Ltmp74:
	#DEBUG_VALUE: main:_18_has_ownership <- 0
	.loc	1 317 2 discriminator 1 # CoinGame.c:317:2
	movq	%rbx, %rdi
	callq	free
.Ltmp75:
	#DEBUG_VALUE: main:_23_has_ownership <- 0
	.loc	1 318 2                 # CoinGame.c:318:2
	xorl	%edi, %edi
	callq	exit
.Ltmp76:
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
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git adeb741e4ef2208282d408214f045b0ce284645a) (http://llvm.org/git/llvm.git 1b960de1374531cbb65e712c7e5843720761e455)" # string offset=0
.Linfo_string1:
	.asciz	"CoinGame.c"            # string offset=165
.Linfo_string2:
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/autogenerate_single_leakfree" # string offset=176
.Linfo_string3:
	.asciz	"findMoves"             # string offset=258
.Linfo_string4:
	.asciz	"long long int"         # string offset=268
.Linfo_string5:
	.asciz	"main"                  # string offset=282
.Linfo_string6:
	.asciz	"int"                   # string offset=287
.Linfo_string7:
	.asciz	"_11"                   # string offset=291
.Linfo_string8:
	.asciz	"y"                     # string offset=295
.Linfo_string9:
	.asciz	"_12"                   # string offset=297
.Linfo_string10:
	.asciz	"_16"                   # string offset=301
.Linfo_string11:
	.asciz	"_14"                   # string offset=305
.Linfo_string12:
	.asciz	"_17"                   # string offset=309
.Linfo_string13:
	.asciz	"_21"                   # string offset=313
.Linfo_string14:
	.asciz	"_23"                   # string offset=317
.Linfo_string15:
	.asciz	"_24"                   # string offset=321
.Linfo_string16:
	.asciz	"x"                     # string offset=325
.Linfo_string17:
	.asciz	"_25"                   # string offset=327
.Linfo_string18:
	.asciz	"_27"                   # string offset=331
.Linfo_string19:
	.asciz	"_31"                   # string offset=335
.Linfo_string20:
	.asciz	"_32"                   # string offset=339
.Linfo_string21:
	.asciz	"z"                     # string offset=343
.Linfo_string22:
	.asciz	"_33"                   # string offset=345
.Linfo_string23:
	.asciz	"_35"                   # string offset=349
.Linfo_string24:
	.asciz	"_38"                   # string offset=353
.Linfo_string25:
	.asciz	"_40"                   # string offset=357
.Linfo_string26:
	.asciz	"_42"                   # string offset=361
.Linfo_string27:
	.asciz	"_44"                   # string offset=365
.Linfo_string28:
	.asciz	"_41"                   # string offset=369
.Linfo_string29:
	.asciz	"_50"                   # string offset=373
.Linfo_string30:
	.asciz	"_48"                   # string offset=377
.Linfo_string31:
	.asciz	"_52"                   # string offset=381
.Linfo_string32:
	.asciz	"s"                     # string offset=385
.Linfo_string33:
	.asciz	"_53"                   # string offset=387
.Linfo_string34:
	.asciz	"moves"                 # string offset=391
.Linfo_string35:
	.asciz	"moves_size"            # string offset=397
.Linfo_string36:
	.asciz	"moves_has_ownership"   # string offset=408
.Linfo_string37:
	.asciz	"_Bool"                 # string offset=428
.Linfo_string38:
	.asciz	"n"                     # string offset=434
.Linfo_string39:
	.asciz	"_2"                    # string offset=436
.Linfo_string40:
	.asciz	"_2_size"               # string offset=439
.Linfo_string41:
	.asciz	"_2_has_ownership"      # string offset=447
.Linfo_string42:
	.asciz	"j"                     # string offset=464
.Linfo_string43:
	.asciz	"i"                     # string offset=466
.Linfo_string44:
	.asciz	"_9"                    # string offset=468
.Linfo_string45:
	.asciz	"_10"                   # string offset=471
.Linfo_string46:
	.asciz	"_13"                   # string offset=475
.Linfo_string47:
	.asciz	"_15"                   # string offset=479
.Linfo_string48:
	.asciz	"_18"                   # string offset=483
.Linfo_string49:
	.asciz	"_19"                   # string offset=487
.Linfo_string50:
	.asciz	"_20"                   # string offset=491
.Linfo_string51:
	.asciz	"_22"                   # string offset=495
.Linfo_string52:
	.asciz	"_26"                   # string offset=499
.Linfo_string53:
	.asciz	"_28"                   # string offset=503
.Linfo_string54:
	.asciz	"_29"                   # string offset=507
.Linfo_string55:
	.asciz	"_30"                   # string offset=511
.Linfo_string56:
	.asciz	"_34"                   # string offset=515
.Linfo_string57:
	.asciz	"_36"                   # string offset=519
.Linfo_string58:
	.asciz	"_37"                   # string offset=523
.Linfo_string59:
	.asciz	"_39"                   # string offset=527
.Linfo_string60:
	.asciz	"_43"                   # string offset=531
.Linfo_string61:
	.asciz	"_45"                   # string offset=535
.Linfo_string62:
	.asciz	"_46"                   # string offset=539
.Linfo_string63:
	.asciz	"_47"                   # string offset=543
.Linfo_string64:
	.asciz	"_49"                   # string offset=547
.Linfo_string65:
	.asciz	"_51"                   # string offset=551
.Linfo_string66:
	.asciz	"argc"                  # string offset=555
.Linfo_string67:
	.asciz	"args"                  # string offset=560
.Linfo_string68:
	.asciz	"char"                  # string offset=565
.Linfo_string69:
	.asciz	"_23_has_ownership"     # string offset=570
.Linfo_string70:
	.asciz	"_23_size"              # string offset=588
.Linfo_string71:
	.asciz	"_18_has_ownership"     # string offset=597
.Linfo_string72:
	.asciz	"_18_size"              # string offset=615
.Linfo_string73:
	.asciz	"_12_has_ownership"     # string offset=624
.Linfo_string74:
	.asciz	"_12_size"              # string offset=642
.Linfo_string75:
	.asciz	"_11_has_ownership"     # string offset=651
.Linfo_string76:
	.asciz	"_11_size"              # string offset=669
.Linfo_string77:
	.asciz	"_8_has_ownership"      # string offset=678
.Linfo_string78:
	.asciz	"_8_size"               # string offset=695
.Linfo_string79:
	.asciz	"_7"                    # string offset=703
.Linfo_string80:
	.asciz	"_6_has_ownership"      # string offset=706
.Linfo_string81:
	.asciz	"_6_size_size"          # string offset=723
.Linfo_string82:
	.asciz	"_6_size"               # string offset=736
.Linfo_string83:
	.asciz	"sum_alice"             # string offset=744
.Linfo_string84:
	.asciz	"_6"                    # string offset=754
.Linfo_string85:
	.asciz	"_8"                    # string offset=757
.Linfo_string86:
	.asciz	"max"                   # string offset=760
.Linfo_string87:
	.asciz	"_5"                    # string offset=764
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Ltmp18-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp19-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp19-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
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
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Ltmp22-.Lfunc_begin0
	.quad	.Ltmp22-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Ltmp22-.Lfunc_begin0
	.quad	.Ltmp24-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp24-.Lfunc_begin0
	.quad	.Ltmp24-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Ltmp24-.Lfunc_begin0
	.quad	.Ltmp24-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Ltmp25-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Ltmp26-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Ltmp29-.Lfunc_begin0
	.quad	.Ltmp33-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Ltmp32-.Lfunc_begin0
	.quad	.Ltmp33-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Ltmp32-.Lfunc_begin0
	.quad	.Ltmp33-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	23                      # 23
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp67-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp65-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	50                      # 50
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp65-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp64-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp64-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Ltmp61-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp65-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp64-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp64-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp72-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc23:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp61-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp61-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Ltmp56-.Lfunc_begin0
	.quad	.Ltmp57-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp60-.Lfunc_begin0
	.quad	.Ltmp62-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp60-.Lfunc_begin0
	.quad	.Ltmp62-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Ltmp62-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp64-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Ltmp62-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Ltmp64-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
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
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
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
	.long	1345                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x53a DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x1 DW_TAG_pointer_type
	.byte	3                       # Abbrev [3] 0x2b:0x2d4 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1300                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	4                       # Abbrev [4] 0x44:0xb DW_TAG_formal_parameter
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1300                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x4f:0xb DW_TAG_formal_parameter
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x5a:0xb DW_TAG_formal_parameter
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1319                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x65:0xb DW_TAG_formal_parameter
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x70:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x7c:0xf DW_TAG_variable
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x8b:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x97:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xa3:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	16                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xaf:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xbb:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	23                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0xc7:0xf DW_TAG_variable
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	25                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xd6:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0xe2:0xf DW_TAG_variable
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xf1:0xc DW_TAG_variable
	.byte	2                       # DW_AT_const_value
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xfd:0xc DW_TAG_variable
	.byte	2                       # DW_AT_const_value
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	29                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x109:0xf DW_TAG_variable
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	33                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x118:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x124:0xf DW_TAG_variable
	.long	.Ldebug_loc4            # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x133:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x13f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	37                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x14b:0xc DW_TAG_variable
	.byte	2                       # DW_AT_const_value
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	40                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x157:0xf DW_TAG_variable
	.long	.Ldebug_loc5            # DW_AT_location
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	42                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x166:0xf DW_TAG_variable
	.long	.Ldebug_loc6            # DW_AT_location
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x175:0xf DW_TAG_variable
	.long	.Ldebug_loc7            # DW_AT_location
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	46                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x184:0xf DW_TAG_variable
	.long	.Ldebug_loc8            # DW_AT_location
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	43                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x193:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	52                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x19f:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	50                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1ab:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	54                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x1b7:0xf DW_TAG_variable
	.long	.Ldebug_loc9            # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x1c6:0xf DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	55                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x1d5:0xb DW_TAG_variable
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	1300                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x1e0:0xb DW_TAG_variable
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x1eb:0xb DW_TAG_variable
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	1319                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x1f6:0xb DW_TAG_variable
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x201:0xb DW_TAG_variable
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x20c:0xb DW_TAG_variable
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x217:0xb DW_TAG_variable
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x222:0xb DW_TAG_variable
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x22d:0xb DW_TAG_variable
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	17                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x238:0xb DW_TAG_variable
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	20                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x243:0xb DW_TAG_variable
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	21                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x24e:0xb DW_TAG_variable
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	22                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x259:0xb DW_TAG_variable
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	24                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x264:0xb DW_TAG_variable
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	28                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x26f:0xb DW_TAG_variable
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	30                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x27a:0xb DW_TAG_variable
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x285:0xb DW_TAG_variable
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x290:0xb DW_TAG_variable
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x29b:0xb DW_TAG_variable
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	38                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x2a6:0xb DW_TAG_variable
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	39                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x2b1:0xb DW_TAG_variable
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	41                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x2bc:0xb DW_TAG_variable
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	45                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x2c7:0xb DW_TAG_variable
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	47                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x2d2:0xb DW_TAG_variable
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	48                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x2dd:0xb DW_TAG_variable
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	49                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x2e8:0xb DW_TAG_variable
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x2f3:0xb DW_TAG_variable
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	53                      # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	3                       # Abbrev [3] 0x2ff:0x215 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	210                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1312                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0x318:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string66         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	210                     # DW_AT_decl_line
	.long	1312                    # DW_AT_type
	.byte	8                       # Abbrev [8] 0x327:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	210                     # DW_AT_decl_line
	.long	1326                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x336:0xf DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	237                     # DW_AT_decl_line
	.long	1319                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x345:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	236                     # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x354:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	233                     # DW_AT_decl_line
	.long	1319                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x363:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	232                     # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x372:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	230                     # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x381:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	229                     # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x38d:0xf DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	228                     # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0x39c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	227                     # DW_AT_decl_line
	.long	1319                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x3a8:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	226                     # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0x3b4:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string75         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	225                     # DW_AT_decl_line
	.long	1319                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x3c0:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string76         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	224                     # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x3cc:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	223                     # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x3d8:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	222                     # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0x3e4:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string77         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	221                     # DW_AT_decl_line
	.long	1319                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x3f0:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string78         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	220                     # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x3fc:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	219                     # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x408:0xf DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string80         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	218                     # DW_AT_decl_line
	.long	1319                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x417:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string81         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	217                     # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x423:0xf DW_TAG_variable
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string82         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	217                     # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x432:0xf DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string83         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	215                     # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x441:0xf DW_TAG_variable
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	214                     # DW_AT_decl_line
	.long	1319                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x450:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	213                     # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x45c:0xf DW_TAG_variable
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	212                     # DW_AT_decl_line
	.long	1305                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x46b:0xf DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string84         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	217                     # DW_AT_decl_line
	.long	1343                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x47a:0xf DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string85         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	220                     # DW_AT_decl_line
	.long	1300                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x489:0xf DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	.Linfo_string86         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	211                     # DW_AT_decl_line
	.long	1300                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x498:0xf DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	.Linfo_string87         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	216                     # DW_AT_decl_line
	.long	1300                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x4a7:0xf DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	213                     # DW_AT_decl_line
	.long	1300                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x4b6:0xf DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	224                     # DW_AT_decl_line
	.long	1300                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x4c5:0xf DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	226                     # DW_AT_decl_line
	.long	1300                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x4d4:0xf DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	232                     # DW_AT_decl_line
	.long	1300                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x4e3:0xf DW_TAG_variable
	.long	.Ldebug_loc32           # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	236                     # DW_AT_decl_line
	.long	1300                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x4f2:0xb DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	231                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	7                       # Abbrev [7] 0x4fd:0xb DW_TAG_variable
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	234                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	7                       # Abbrev [7] 0x508:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	235                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	10                      # Abbrev [10] 0x514:0x5 DW_TAG_pointer_type
	.long	1305                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x519:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	11                      # Abbrev [11] 0x520:0x7 DW_TAG_base_type
	.long	.Linfo_string6          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	11                      # Abbrev [11] 0x527:0x7 DW_TAG_base_type
	.long	.Linfo_string37         # DW_AT_name
	.byte	2                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	10                      # Abbrev [10] 0x52e:0x5 DW_TAG_pointer_type
	.long	1331                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x533:0x5 DW_TAG_pointer_type
	.long	1336                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x538:0x7 DW_TAG_base_type
	.long	.Linfo_string68         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	10                      # Abbrev [10] 0x53f:0x5 DW_TAG_pointer_type
	.long	1300                    # DW_AT_type
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
	.long	1349                    # Compilation Unit Length
	.long	767                     # DIE offset
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
	.long	1349                    # Compilation Unit Length
	.long	1305                    # DIE offset
	.asciz	"long long int"         # External Name
	.long	1312                    # DIE offset
	.asciz	"int"                   # External Name
	.long	1319                    # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	1336                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git adeb741e4ef2208282d408214f045b0ce284645a) (http://llvm.org/git/llvm.git 1b960de1374531cbb65e712c7e5843720761e455)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
