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
	subq	$104, %rsp
.Ltmp6:
	.cfi_def_cfa_offset 160
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
	#DEBUG_VALUE: findMoves:moves <- %RDI
	#DEBUG_VALUE: findMoves:moves_size <- %RSI
	#DEBUG_VALUE: findMoves:moves_has_ownership [bit_piece offset=0 size=1] <- %EDX
	#DEBUG_VALUE: findMoves:n <- %RCX
.Ltmp13:
	#DEBUG_VALUE: findMoves:_10_size <- %RCX
	#DEBUG_VALUE: findMoves:x_size <- %RCX
	#DEBUG_VALUE: findMoves:_12_size <- %RCX
	#DEBUG_VALUE: findMoves:y_size <- %RCX
	#DEBUG_VALUE: findMoves:_14_size <- %RCX
	#DEBUG_VALUE: findMoves:z_size <- %RCX
	movq	%rcx, %rbp
.Ltmp14:
	#DEBUG_VALUE: findMoves:z_size <- %RBP
	#DEBUG_VALUE: findMoves:_14_size <- %RBP
	#DEBUG_VALUE: findMoves:y_size <- %RBP
	#DEBUG_VALUE: findMoves:_12_size <- %RBP
	#DEBUG_VALUE: findMoves:x_size <- %RBP
	#DEBUG_VALUE: findMoves:_10_size <- %RBP
	#DEBUG_VALUE: findMoves:n <- %RBP
	movq	%rdi, 8(%rsp)           # 8-byte Spill
.Ltmp15:
	#DEBUG_VALUE: findMoves:_70 <- 0
	#DEBUG_VALUE: findMoves:_69 <- 0
	#DEBUG_VALUE: findMoves:_68 <- 0
	#DEBUG_VALUE: findMoves:_67 <- 0
	#DEBUG_VALUE: findMoves:_66 <- 0
	#DEBUG_VALUE: findMoves:_65 <- 0
	#DEBUG_VALUE: findMoves:_64 <- 0
	#DEBUG_VALUE: findMoves:_63 <- 0
	#DEBUG_VALUE: findMoves:_62 <- 0
	#DEBUG_VALUE: findMoves:_61 <- 0
	#DEBUG_VALUE: findMoves:_60 <- 0
	#DEBUG_VALUE: findMoves:_59 <- 0
	#DEBUG_VALUE: findMoves:_58 <- 0
	#DEBUG_VALUE: findMoves:_57 <- 0
	#DEBUG_VALUE: findMoves:_56 <- 0
	#DEBUG_VALUE: findMoves:_55 <- 0
	#DEBUG_VALUE: findMoves:_54 <- 0
	#DEBUG_VALUE: findMoves:_53 <- 0
	#DEBUG_VALUE: findMoves:_52 <- 0
	#DEBUG_VALUE: findMoves:_51 <- 0
	#DEBUG_VALUE: findMoves:_50 <- 0
	#DEBUG_VALUE: findMoves:_49 <- 0
	#DEBUG_VALUE: findMoves:_48 <- 0
	#DEBUG_VALUE: findMoves:_47 <- 0
	#DEBUG_VALUE: findMoves:_46 <- 0
	#DEBUG_VALUE: findMoves:_45 <- 0
	#DEBUG_VALUE: findMoves:_44 <- 0
	#DEBUG_VALUE: findMoves:_43 <- 0
	#DEBUG_VALUE: findMoves:_42 <- 0
	#DEBUG_VALUE: findMoves:_41 <- 0
	#DEBUG_VALUE: findMoves:_40 <- 0
	#DEBUG_VALUE: findMoves:_39 <- 0
	#DEBUG_VALUE: findMoves:_38 <- 0
	#DEBUG_VALUE: findMoves:_37 <- 0
	#DEBUG_VALUE: findMoves:_36 <- 0
	#DEBUG_VALUE: findMoves:_35 <- 0
	#DEBUG_VALUE: findMoves:_34 <- 0
	#DEBUG_VALUE: findMoves:_33 <- 0
	#DEBUG_VALUE: findMoves:_32 <- 0
	#DEBUG_VALUE: findMoves:_31 <- 0
	#DEBUG_VALUE: findMoves:_30 <- 0
	#DEBUG_VALUE: findMoves:_29 <- 0
	#DEBUG_VALUE: findMoves:_28 <- 0
	#DEBUG_VALUE: findMoves:_27 <- 0
	#DEBUG_VALUE: findMoves:_26 <- 0
	#DEBUG_VALUE: findMoves:_25 <- 0
	#DEBUG_VALUE: findMoves:_24 <- 0
	#DEBUG_VALUE: findMoves:_23 <- 0
	#DEBUG_VALUE: findMoves:_22 <- 0
	#DEBUG_VALUE: findMoves:_21 <- 0
	#DEBUG_VALUE: findMoves:_20 <- 0
	#DEBUG_VALUE: findMoves:_19 <- 0
	#DEBUG_VALUE: findMoves:_18 <- 0
	#DEBUG_VALUE: findMoves:_17 <- 0
	#DEBUG_VALUE: findMoves:_16 <- 0
	#DEBUG_VALUE: findMoves:_15 <- 0
	#DEBUG_VALUE: findMoves:_14_has_ownership <- 0
	#DEBUG_VALUE: findMoves:_13 <- 0
	#DEBUG_VALUE: findMoves:_12_has_ownership <- 0
	#DEBUG_VALUE: findMoves:_11 <- 0
	#DEBUG_VALUE: findMoves:_10_has_ownership <- 0
	#DEBUG_VALUE: findMoves:_9 <- 0
	#DEBUG_VALUE: findMoves:i <- 0
	#DEBUG_VALUE: findMoves:j <- 0
	#DEBUG_VALUE: findMoves:s <- 0
	#DEBUG_VALUE: findMoves:z_has_ownership <- 0
	#DEBUG_VALUE: findMoves:y_has_ownership <- 0
	#DEBUG_VALUE: findMoves:x_has_ownership <- 0
	#DEBUG_VALUE: findMoves:_2_has_ownership <- 0
	#DEBUG_VALUE: findMoves:_2_size <- 0
	#DEBUG_VALUE: findMoves:z_size <- 0
	#DEBUG_VALUE: findMoves:_14_size <- 0
	#DEBUG_VALUE: findMoves:y_size <- 0
	#DEBUG_VALUE: findMoves:_12_size <- 0
	#DEBUG_VALUE: findMoves:x_size <- 0
	#DEBUG_VALUE: findMoves:_10_size <- 0
	#DEBUG_VALUE: findMoves:moves <- [%RSP+8]
	.loc	1 83 2 prologue_end     # CoinGame.c:83:2
	xorl	%edi, %edi
	movl	%ebp, %esi
.Ltmp16:
	callq	gen1DArray
.Ltmp17:
	movq	%rax, %rbx
.Ltmp18:
	#DEBUG_VALUE: findMoves:_10 <- %RBX
	#DEBUG_VALUE: findMoves:x <- %RBX
	#DEBUG_VALUE: findMoves:x_has_ownership <- 1
	.loc	1 94 2                  # CoinGame.c:94:2
	xorl	%edi, %edi
	movl	%ebp, %esi
	callq	gen1DArray
	movq	%rax, %r12
.Ltmp19:
	#DEBUG_VALUE: findMoves:_12 <- %R12
	#DEBUG_VALUE: findMoves:y <- %R12
	#DEBUG_VALUE: findMoves:y_has_ownership <- 1
	.loc	1 105 2                 # CoinGame.c:105:2
	xorl	%edi, %edi
	movl	%ebp, %esi
	callq	gen1DArray
	movq	%rax, %r13
.Ltmp20:
	#DEBUG_VALUE: findMoves:_14 <- %R13
	#DEBUG_VALUE: findMoves:z <- %R13
	#DEBUG_VALUE: findMoves:z_has_ownership <- 1
	.loc	1 119 6                 # CoinGame.c:119:6
	testq	%rbp, %rbp
	jle	.LBB0_23
.Ltmp21:
# BB#1:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:z <- %R13
	#DEBUG_VALUE: findMoves:_14 <- %R13
	#DEBUG_VALUE: findMoves:y <- %R12
	#DEBUG_VALUE: findMoves:_12 <- %R12
	#DEBUG_VALUE: findMoves:x <- %RBX
	#DEBUG_VALUE: findMoves:_10 <- %RBX
	#DEBUG_VALUE: findMoves:n <- %RBP
	leaq	(%rbx,%rbp,8), %rax
	movq	8(%rsp), %rdx           # 8-byte Reload
	cmpq	%rdx, %rax
	setbe	(%rsp)                  # 1-byte Folded Spill
	movq	%rbp, %rcx
	imulq	%rcx, %rcx
	leaq	(%rdx,%rcx,8), %rcx
	cmpq	%rbx, %rcx
	setbe	%r9b
	leaq	(%r13,%rbp,8), %rsi
	cmpq	%rdx, %rsi
	setbe	24(%rsp)                # 1-byte Folded Spill
	cmpq	%r13, %rcx
	setbe	%r8b
	movq	%rbp, 16(%rsp)          # 8-byte Spill
	leaq	(%r12,%rbp,8), %rdi
	cmpq	%rdx, %rdi
	setbe	%r10b
	cmpq	%r12, %rcx
	setbe	%bpl
.Ltmp22:
	cmpq	%rbx, %rsi
	setbe	%r11b
	cmpq	%r13, %rax
	setbe	%r15b
	cmpq	%rbx, %rdi
	setbe	%r14b
	cmpq	%r12, %rax
	setbe	%al
	cmpq	%r13, %rdi
	setbe	%dl
	cmpq	%r12, %rsi
	setbe	%cl
	orb	%dl, %cl
	movzbl	%cl, %ecx
	cmpl	$1, %ecx
	jne	.LBB0_8
.Ltmp23:
# BB#2:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:_10 <- %RBX
	#DEBUG_VALUE: findMoves:x <- %RBX
	#DEBUG_VALUE: findMoves:_12 <- %R12
	#DEBUG_VALUE: findMoves:y <- %R12
	#DEBUG_VALUE: findMoves:_14 <- %R13
	#DEBUG_VALUE: findMoves:z <- %R13
	orb	%r14b, %al
	je	.LBB0_8
.Ltmp24:
# BB#3:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:z <- %R13
	#DEBUG_VALUE: findMoves:_14 <- %R13
	#DEBUG_VALUE: findMoves:y <- %R12
	#DEBUG_VALUE: findMoves:_12 <- %R12
	#DEBUG_VALUE: findMoves:x <- %RBX
	#DEBUG_VALUE: findMoves:_10 <- %RBX
	orb	%r11b, %r15b
	je	.LBB0_8
.Ltmp25:
# BB#4:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:_10 <- %RBX
	#DEBUG_VALUE: findMoves:x <- %RBX
	#DEBUG_VALUE: findMoves:_12 <- %R12
	#DEBUG_VALUE: findMoves:y <- %R12
	#DEBUG_VALUE: findMoves:_14 <- %R13
	#DEBUG_VALUE: findMoves:z <- %R13
	orb	%r10b, %bpl
	je	.LBB0_8
.Ltmp26:
# BB#5:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:z <- %R13
	#DEBUG_VALUE: findMoves:_14 <- %R13
	#DEBUG_VALUE: findMoves:y <- %R12
	#DEBUG_VALUE: findMoves:_12 <- %R12
	#DEBUG_VALUE: findMoves:x <- %RBX
	#DEBUG_VALUE: findMoves:_10 <- %RBX
	movabsq	$9223372036854775807, %rax # imm = 0x7FFFFFFFFFFFFFFF
	cmpq	%rax, 16(%rsp)          # 8-byte Folded Reload
	je	.LBB0_8
.Ltmp27:
# BB#6:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:_10 <- %RBX
	#DEBUG_VALUE: findMoves:x <- %RBX
	#DEBUG_VALUE: findMoves:_12 <- %R12
	#DEBUG_VALUE: findMoves:y <- %R12
	#DEBUG_VALUE: findMoves:_14 <- %R13
	#DEBUG_VALUE: findMoves:z <- %R13
	orb	(%rsp), %r9b            # 1-byte Folded Reload
	je	.LBB0_8
.Ltmp28:
# BB#7:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:z <- %R13
	#DEBUG_VALUE: findMoves:_14 <- %R13
	#DEBUG_VALUE: findMoves:y <- %R12
	#DEBUG_VALUE: findMoves:_12 <- %R12
	#DEBUG_VALUE: findMoves:x <- %RBX
	#DEBUG_VALUE: findMoves:_10 <- %RBX
	orb	24(%rsp), %r8b          # 1-byte Folded Reload
	je	.LBB0_8
.Ltmp29:
# BB#24:                                # %polly.loop_preheader
	#DEBUG_VALUE: findMoves:_10 <- %RBX
	#DEBUG_VALUE: findMoves:x <- %RBX
	#DEBUG_VALUE: findMoves:_12 <- %R12
	#DEBUG_VALUE: findMoves:y <- %R12
	#DEBUG_VALUE: findMoves:_14 <- %R13
	#DEBUG_VALUE: findMoves:z <- %R13
	movq	16(%rsp), %r8           # 8-byte Reload
	leaq	-1(%r8), %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	8(%rsp), %rax           # 8-byte Reload
	leaq	-8(%rax,%r8,8), %r9
	leaq	8(,%r8,8), %r10
	leaq	-16(%rax), %r11
	movq	%r8, %r14
	shlq	$4, %r14
	addq	%rax, %r14
	leaq	-2(%r8), %rcx
	movq	%rcx, 48(%rsp)          # 8-byte Spill
	movl	$1, %ecx
	movl	$2, %edx
	movq	%rax, %rbp
	xorl	%edi, %edi
	movq	%r10, 40(%rsp)          # 8-byte Spill
.Ltmp30:
	.p2align	4, 0x90
.LBB0_25:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_43 Depth 2
                                        #     Child Loop BB0_45 Depth 2
                                        #     Child Loop BB0_47 Depth 2
                                        #     Child Loop BB0_32 Depth 2
                                        #     Child Loop BB0_36 Depth 2
                                        #     Child Loop BB0_40 Depth 2
	movq	%rbp, 72(%rsp)          # 8-byte Spill
	movq	%r14, 96(%rsp)          # 8-byte Spill
	testq	%rdx, %rdx
	movl	$0, %ebp
	movq	%rdx, 80(%rsp)          # 8-byte Spill
	cmovnsq	%rdx, %rbp
	testq	%rcx, %rcx
	movl	$0, %r14d
	movq	%rcx, 88(%rsp)          # 8-byte Spill
	cmovnsq	%rcx, %r14
	movq	24(%rsp), %rax          # 8-byte Reload
	subq	%rdi, %rax
	movl	$0, %ecx
	cmovsq	%rcx, %rax
	movq	%r8, %r15
	movq	%rdi, (%rsp)            # 8-byte Spill
	subq	%rdi, %r15
	jle	.LBB0_27
# BB#26:                                # %polly.loop_header347.preheader
                                        #   in Loop: Header=BB0_25 Depth=1
	leaq	8(,%rax,8), %rdx
	movq	%rdx, 32(%rsp)          # 8-byte Spill
	xorl	%esi, %esi
	movq	%r12, %rdi
	movq	%r9, 64(%rsp)           # 8-byte Spill
	movq	%r11, 56(%rsp)          # 8-byte Spill
	callq	memset
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movq	32(%rsp), %rdx          # 8-byte Reload
	callq	memset
	xorl	%esi, %esi
	movq	%r13, %rdi
	movq	32(%rsp), %rdx          # 8-byte Reload
	callq	memset
	movq	56(%rsp), %r11          # 8-byte Reload
	movq	40(%rsp), %r10          # 8-byte Reload
	movq	64(%rsp), %r9           # 8-byte Reload
.LBB0_27:                               # %polly.loop_exit349
                                        #   in Loop: Header=BB0_25 Depth=1
	movl	$1, %eax
	subq	(%rsp), %rax            # 8-byte Folded Reload
	movl	$0, %ecx
	cmovnsq	%rax, %rcx
	movq	24(%rsp), %rdx          # 8-byte Reload
	cmpq	%r15, %rdx
	movq	%r15, %rax
	cmovleq	%rdx, %rax
	cmpq	%rax, %rcx
	jge	.LBB0_28
# BB#42:                                # %polly.loop_preheader358
                                        #   in Loop: Header=BB0_25 Depth=1
	movq	%r10, %rcx
	imulq	%r14, %rcx
	decq	%r14
	addq	%r9, %rcx
	decq	%rax
	.p2align	4, 0x90
.LBB0_43:                               # %polly.loop_header357
                                        #   Parent Loop BB0_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rcx), %rdx
	movq	%rdx, 8(%r12,%r14,8)
	incq	%r14
	addq	%r10, %rcx
	cmpq	%rax, %r14
	jl	.LBB0_43
.LBB0_28:                               # %polly.loop_exit359
                                        #   in Loop: Header=BB0_25 Depth=1
	movl	$2, %eax
	movq	(%rsp), %rdi            # 8-byte Reload
	subq	%rdi, %rax
	movl	$0, %ecx
	cmovnsq	%rax, %rcx
	cmpq	%r15, %rcx
	jge	.LBB0_29
# BB#44:                                # %polly.loop_preheader372
                                        #   in Loop: Header=BB0_25 Depth=1
	movq	%r10, %rax
	imulq	%rbp, %rax
	decq	%rbp
	addq	%r11, %rax
	leaq	-1(%r15), %rcx
	.p2align	4, 0x90
.LBB0_45:                               # %polly.loop_header371
                                        #   Parent Loop BB0_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rax), %rdx
	movq	%rdx, 8(%r13,%rbp,8)
	incq	%rbp
	addq	%r10, %rax
	cmpq	%rcx, %rbp
	jl	.LBB0_45
.LBB0_29:                               # %polly.loop_exit373
                                        #   in Loop: Header=BB0_25 Depth=1
	movq	48(%rsp), %rcx          # 8-byte Reload
	cmpq	%r15, %rcx
	movq	%r15, %rax
	cmovleq	%rcx, %rax
	testq	%rax, %rax
	movq	16(%rsp), %r8           # 8-byte Reload
	movq	96(%rsp), %r14          # 8-byte Reload
	movq	72(%rsp), %rbp          # 8-byte Reload
	jle	.LBB0_30
# BB#46:                                # %polly.loop_preheader388
                                        #   in Loop: Header=BB0_25 Depth=1
	decq	%rax
	movq	$-1, %rcx
	movq	%r14, %rdx
	.p2align	4, 0x90
.LBB0_47:                               # %polly.loop_header387
                                        #   Parent Loop BB0_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rdx), %rsi
	movq	%rsi, 8(%rbx,%rcx,8)
	incq	%rcx
	addq	%r10, %rdx
	cmpq	%rax, %rcx
	jl	.LBB0_47
.LBB0_30:                               # %polly.loop_exit389
                                        #   in Loop: Header=BB0_25 Depth=1
	testq	%r15, %r15
	jle	.LBB0_41
# BB#31:                                # %polly.loop_header403.preheader
                                        #   in Loop: Header=BB0_25 Depth=1
	decq	%r15
	movq	$-1, %rax
	.p2align	4, 0x90
.LBB0_32:                               # %polly.loop_header403
                                        #   Parent Loop BB0_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%r12,%rax,8), %rcx
.Ltmp31:
	.loc	1 221 7                 # CoinGame.c:221:7
	cmpq	%rcx, 8(%rbx,%rax,8)
	jle	.LBB0_34
# BB#33:                                # %polly.stmt.if.end72
                                        #   in Loop: Header=BB0_32 Depth=2
	movq	%rcx, 8(%rbx,%rax,8)
.LBB0_34:                               # %polly.stmt.blklab7.exit
                                        #   in Loop: Header=BB0_32 Depth=2
	incq	%rax
	cmpq	%r15, %rax
	jl	.LBB0_32
# BB#35:                                # %polly.loop_header416.preheader
                                        #   in Loop: Header=BB0_25 Depth=1
	movq	$-1, %rax
	.p2align	4, 0x90
.LBB0_36:                               # %polly.loop_header416
                                        #   Parent Loop BB0_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%r12,%rax,8), %rcx
	.loc	1 233 7                 # CoinGame.c:233:7
	cmpq	%rcx, 8(%r13,%rax,8)
	jle	.LBB0_38
# BB#37:                                # %polly.stmt.if.end80
                                        #   in Loop: Header=BB0_36 Depth=2
	movq	%rcx, 8(%r13,%rax,8)
.LBB0_38:                               # %polly.stmt.blklab8.exit
                                        #   in Loop: Header=BB0_36 Depth=2
	incq	%rax
	cmpq	%r15, %rax
	jl	.LBB0_36
# BB#39:                                # %polly.loop_preheader430
                                        #   in Loop: Header=BB0_25 Depth=1
	movq	%rbp, %rax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_40:                               # %polly.loop_header429
                                        #   Parent Loop BB0_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp32:
	.loc	1 249 10                # CoinGame.c:249:10
	leaq	(%rdi,%rcx), %rdx
	addq	(%r13,%rcx,8), %rdx
	movq	(%rbx,%rcx,8), %rsi
	addq	%rcx, %rsi
	cmpq	%rdx, %rsi
.Ltmp33:
	.loc	1 249 7 is_stmt 0       # CoinGame.c:249:7
	cmovlq	%rdx, %rsi
	movq	%rsi, (%rax)
	addq	%r10, %rax
	cmpq	%r15, %rcx
	leaq	1(%rcx), %rcx
	jl	.LBB0_40
.LBB0_41:                               # %polly.loop_exit431
                                        #   in Loop: Header=BB0_25 Depth=1
	incq	%rdi
	movq	88(%rsp), %rcx          # 8-byte Reload
	decq	%rcx
	addq	$8, %r9
	movq	80(%rsp), %rdx          # 8-byte Reload
	decq	%rdx
	addq	$8, %r11
	addq	$8, %r14
	addq	$8, %rbp
	cmpq	%r8, %rdi
	jne	.LBB0_25
	jmp	.LBB0_23
.LBB0_8:                                # %while.cond26.preheader.preheader
.Ltmp34:
	#DEBUG_VALUE: findMoves:_10 <- %RBX
	#DEBUG_VALUE: findMoves:x <- %RBX
	#DEBUG_VALUE: findMoves:_12 <- %R12
	#DEBUG_VALUE: findMoves:y <- %R12
	#DEBUG_VALUE: findMoves:_14 <- %R13
	#DEBUG_VALUE: findMoves:z <- %R13
	movq	16(%rsp), %rbp          # 8-byte Reload
	.loc	1 129 7 is_stmt 1       # CoinGame.c:129:7
	leaq	(,%rbp,8), %r9
	leaq	8(,%rbp,8), %r11
	movq	%rbp, %r10
	shlq	$4, %r10
	xorl	%r14d, %r14d
	movq	8(%rsp), %rax           # 8-byte Reload
	movq	%rbp, %r15
.Ltmp35:
	.p2align	4, 0x90
.LBB0_9:                                # %while.cond26.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_10 Depth 2
	movq	%rax, (%rsp)            # 8-byte Spill
	movq	%rax, %rdi
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_10:                               # %if.end31
                                        #   Parent Loop BB0_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: findMoves:_17 <- 0
	.loc	1 25 12                 # CoinGame.c:25:12
	leaq	(%r14,%rax), %rcx
.Ltmp36:
	.loc	1 133 9                 # CoinGame.c:133:9
	movq	$0, (%r12,%rax,8)
.Ltmp37:
	#DEBUG_VALUE: findMoves:_18 <- 1
	.loc	1 137 9                 # CoinGame.c:137:9
	leaq	1(%rax), %rdx
.Ltmp38:
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_22 <- 0
	#DEBUG_VALUE: findMoves:_20 <- 1
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:i <- %RDX
	.loc	1 147 10                # CoinGame.c:147:10
	testq	%rcx, %rcx
	jle	.LBB0_13
.Ltmp39:
# BB#11:                                # %if.end31
                                        #   in Loop: Header=BB0_10 Depth=2
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	cmpq	%rbp, %rdx
	jge	.LBB0_13
.Ltmp40:
# BB#12:                                # %if.end39
                                        #   in Loop: Header=BB0_10 Depth=2
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_23 <- 1
	#DEBUG_VALUE: findMoves:_27 <- 1
	.loc	1 161 8                 # CoinGame.c:161:8
	movq	-8(%r9,%rdi), %rsi
.Ltmp41:
	#DEBUG_VALUE: findMoves:_29 <- %RSI
	.loc	1 163 9                 # CoinGame.c:163:9
	movq	%rsi, (%r12,%rax,8)
.Ltmp42:
.LBB0_13:                               # %blklab4
                                        #   in Loop: Header=BB0_10 Depth=2
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_30 <- 0
	.loc	1 169 9                 # CoinGame.c:169:9
	movq	$0, (%rbx,%rax,8)
.Ltmp43:
	#DEBUG_VALUE: findMoves:_31 <- 2
	.loc	1 173 9                 # CoinGame.c:173:9
	leaq	2(%rax), %rsi
.Ltmp44:
	#DEBUG_VALUE: findMoves:_34 <- %RSI
	#DEBUG_VALUE: findMoves:_32 <- %RSI
	.loc	1 175 7                 # CoinGame.c:175:7
	cmpq	%rbp, %rsi
	jge	.LBB0_15
.Ltmp45:
# BB#14:                                # %if.end50
                                        #   in Loop: Header=BB0_10 Depth=2
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_32 <- %RSI
	#DEBUG_VALUE: findMoves:_34 <- %RSI
	#DEBUG_VALUE: findMoves:_33 <- 2
	.loc	1 185 8                 # CoinGame.c:185:8
	movq	(%r10,%rdi), %rsi
.Ltmp46:
	#DEBUG_VALUE: findMoves:_37 <- %RSI
	.loc	1 187 9                 # CoinGame.c:187:9
	movq	%rsi, (%rbx,%rax,8)
.Ltmp47:
.LBB0_15:                               # %blklab5
                                        #   in Loop: Header=BB0_10 Depth=2
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_38 <- 0
	.loc	1 193 9                 # CoinGame.c:193:9
	movq	$0, (%r13,%rax,8)
	#DEBUG_VALUE: findMoves:_41 <- 0
.Ltmp48:
	#DEBUG_VALUE: findMoves:_39 <- 1
	.loc	1 201 10                # CoinGame.c:201:10
	cmpq	$2, %rcx
	movl	$0, %esi
	jl	.LBB0_17
.Ltmp49:
# BB#16:                                # %if.end61
                                        #   in Loop: Header=BB0_10 Depth=2
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_44 <- 2
	.loc	1 211 8                 # CoinGame.c:211:8
	movq	-16(%rdi), %rsi
.Ltmp50:
	#DEBUG_VALUE: findMoves:_46 <- %RSI
	.loc	1 213 9                 # CoinGame.c:213:9
	movq	%rsi, (%r13,%rax,8)
.Ltmp51:
.LBB0_17:                               # %blklab6
                                        #   in Loop: Header=BB0_10 Depth=2
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	.loc	1 217 8                 # CoinGame.c:217:8
	movq	(%rbx,%rax,8), %r8
.Ltmp52:
	#DEBUG_VALUE: findMoves:_47 <- %R8
	.loc	1 219 8                 # CoinGame.c:219:8
	movq	(%r12,%rax,8), %rbp
.Ltmp53:
	#DEBUG_VALUE: findMoves:_49 <- %RBP
	#DEBUG_VALUE: findMoves:_48 <- %RBP
	.loc	1 221 7                 # CoinGame.c:221:7
	cmpq	%rbp, %r8
	jle	.LBB0_19
.Ltmp54:
# BB#18:                                # %if.end72
                                        #   in Loop: Header=BB0_10 Depth=2
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_48 <- %RBP
	#DEBUG_VALUE: findMoves:_49 <- %RBP
	#DEBUG_VALUE: findMoves:_47 <- %R8
	.loc	1 225 9                 # CoinGame.c:225:9
	movq	%rbp, (%rbx,%rax,8)
	.loc	1 229 8                 # CoinGame.c:229:8
	movq	(%r13,%rax,8), %rsi
	movq	%rbp, %r8
.Ltmp55:
	.loc	1 231 8                 # CoinGame.c:231:8
	movq	(%r12,%rax,8), %rbp
.Ltmp56:
.LBB0_19:                               # %blklab7
                                        #   in Loop: Header=BB0_10 Depth=2
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_50 <- %RSI
	.loc	1 233 7                 # CoinGame.c:233:7
	cmpq	%rbp, %rsi
.Ltmp57:
	#DEBUG_VALUE: findMoves:_51 <- %RBP
	jle	.LBB0_21
.Ltmp58:
# BB#20:                                # %if.end80
                                        #   in Loop: Header=BB0_10 Depth=2
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_51 <- %RBP
	#DEBUG_VALUE: findMoves:_50 <- %RSI
	.loc	1 237 9                 # CoinGame.c:237:9
	movq	%rbp, (%r13,%rax,8)
	.loc	1 241 8                 # CoinGame.c:241:8
	movq	(%rbx,%rax,8), %r8
.Ltmp59:
.LBB0_21:                               # %blklab8
                                        #   in Loop: Header=BB0_10 Depth=2
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_51 <- %RBP
	#DEBUG_VALUE: findMoves:_50 <- %RSI
	#DEBUG_VALUE: findMoves:_53 <- %R8
	.loc	1 249 10                # CoinGame.c:249:10
	addq	%r8, %rax
	notq	%rbp
.Ltmp60:
	notq	%rsi
.Ltmp61:
	cmpq	%rsi, %rbp
	cmovgeq	%rbp, %rsi
	subq	%rsi, %rcx
	decq	%rcx
	cmpq	%rcx, %rax
.Ltmp62:
	.loc	1 261 4                 # CoinGame.c:261:4
	cmovgeq	%rax, %rcx
.Ltmp63:
	#DEBUG_VALUE: findMoves:_67 <- 1
	#DEBUG_VALUE: findMoves:_65 <- 1
	.loc	1 259 15                # CoinGame.c:259:15
	movq	%rcx, (%rdi)
	.loc	1 129 7                 # CoinGame.c:129:7
	addq	%r11, %rdi
	cmpq	%rdx, %r15
	movq	%rdx, %rax
	movq	16(%rsp), %rbp          # 8-byte Reload
	jne	.LBB0_10
.Ltmp64:
# BB#22:                                # %blklab2
                                        #   in Loop: Header=BB0_9 Depth=1
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_53 <- %R8
	#DEBUG_VALUE: findMoves:_69 <- 1
	.loc	1 296 8                 # CoinGame.c:296:8
	incq	%r14
.Ltmp65:
	#DEBUG_VALUE: findMoves:_70 <- %R14
	#DEBUG_VALUE: findMoves:s <- %R14
	.loc	1 119 6                 # CoinGame.c:119:6
	decq	%r15
	movq	(%rsp), %rax            # 8-byte Reload
	addq	$8, %rax
	cmpq	%rbp, %r14
	jne	.LBB0_9
.Ltmp66:
.LBB0_23:                               # %if.then108
	.loc	1 306 2 discriminator 1 # CoinGame.c:306:2
	movq	%rbx, %rdi
	callq	free
.Ltmp67:
	#DEBUG_VALUE: findMoves:x_has_ownership <- 0
	.loc	1 307 2 discriminator 1 # CoinGame.c:307:2
	movq	%r12, %rdi
	callq	free
.Ltmp68:
	#DEBUG_VALUE: findMoves:y_has_ownership <- 0
	.loc	1 308 2 discriminator 1 # CoinGame.c:308:2
	movq	%r13, %rdi
	callq	free
.Ltmp69:
	#DEBUG_VALUE: findMoves:z_has_ownership <- 0
	.loc	1 312 2                 # CoinGame.c:312:2
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$104, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp70:
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
	.loc	1 316 0                 # CoinGame.c:316:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp71:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp72:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp73:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp74:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp75:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp76:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Ltmp77:
	.cfi_def_cfa_offset 64
.Ltmp78:
	.cfi_offset %rbx, -56
.Ltmp79:
	.cfi_offset %r12, -48
.Ltmp80:
	.cfi_offset %r13, -40
.Ltmp81:
	.cfi_offset %r14, -32
.Ltmp82:
	.cfi_offset %r15, -24
.Ltmp83:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
	movl	%edi, %ebx
.Ltmp84:
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
	.loc	1 345 2 prologue_end    # CoinGame.c:345:2
	callq	convertArgsToIntArray
.Ltmp85:
	movq	%rax, %r15
.Ltmp86:
	#DEBUG_VALUE: main:_6 <- %R15
	decl	%ebx
.Ltmp87:
	movslq	%ebx, %r14
.Ltmp88:
	#DEBUG_VALUE: main:_6_has_ownership <- 1
	#DEBUG_VALUE: main:_6_size <- %EBX
	.loc	1 350 5                 # CoinGame.c:350:5
	movq	(%r15), %rdi
.Ltmp89:
	#DEBUG_VALUE: main:_8 <- %RDI
	.loc	1 352 2                 # CoinGame.c:352:2
	callq	parseStringToInt
.Ltmp90:
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_5 <- %RAX
	.loc	1 356 9                 # CoinGame.c:356:9
	testq	%rax, %rax
	jne	.LBB1_1
.Ltmp91:
# BB#2:                                 # %if.end122.critedge
	#DEBUG_VALUE: main:_5 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_6_size <- %EBX
	#DEBUG_VALUE: main:_6 <- %R15
	.loc	1 417 2 discriminator 1 # CoinGame.c:417:2
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	free2DArray
.Ltmp92:
	#DEBUG_VALUE: main:_6_has_ownership <- 0
	.loc	1 423 2                 # CoinGame.c:423:2
	xorl	%edi, %edi
	callq	exit
.Ltmp93:
.LBB1_1:                                # %if.then103
	#DEBUG_VALUE: main:_5 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_6_size <- %EBX
	#DEBUG_VALUE: main:_6 <- %R15
	.loc	1 358 6                 # CoinGame.c:358:6
	movq	(%rax), %rbx
.Ltmp94:
	#DEBUG_VALUE: main:_9 <- 0
	#DEBUG_VALUE: main:n <- %RBX
	.loc	1 362 7                 # CoinGame.c:362:7
	movl	%ebx, %esi
	imull	%esi, %esi
	.loc	1 365 2                 # CoinGame.c:365:2
	xorl	%edi, %edi
	callq	gen1DArray
.Ltmp95:
	#DEBUG_VALUE: main:moves <- %RAX
	#DEBUG_VALUE: main:_11 <- %RAX
	#DEBUG_VALUE: main:_11_has_ownership <- 0
	#DEBUG_VALUE: main:moves_has_ownership <- 0
	.loc	1 376 8                 # CoinGame.c:376:8
	xorl	%edx, %edx
	movq	%rax, %rdi
	movq	%rbx, %rcx
	callq	findMoves
.Ltmp96:
	movq	%rax, %r12
.Ltmp97:
	#DEBUG_VALUE: main:_12 <- %R12
	#DEBUG_VALUE: main:moves <- %R12
	#DEBUG_VALUE: main:_13 <- 1
	#DEBUG_VALUE: main:_12_has_ownership <- 0
	#DEBUG_VALUE: main:moves_has_ownership <- 1
	.loc	1 388 6                 # CoinGame.c:388:6
	movq	-8(%r12,%rbx,8), %r13
.Ltmp98:
	#DEBUG_VALUE: main:_18_size <- 50
	#DEBUG_VALUE: main:_15 <- %R13
	#DEBUG_VALUE: main:sum_alice <- %R13
	.loc	1 395 2                 # CoinGame.c:395:2
	movl	$400, %edi              # imm = 0x190
	callq	malloc
	movq	%rax, %rbp
.Ltmp99:
	#DEBUG_VALUE: main:_18 <- %RBP
	.loc	1 396 9                 # CoinGame.c:396:9
	movaps	.LCPI1_0(%rip), %xmm0   # xmm0 = [84,104]
	movups	%xmm0, (%rbp)
	.loc	1 396 36 is_stmt 0      # CoinGame.c:396:36
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [101,32]
	movups	%xmm0, 16(%rbp)
	movaps	%xmm0, %xmm1
	.loc	1 396 63                # CoinGame.c:396:63
	movaps	.LCPI1_2(%rip), %xmm0   # xmm0 = [116,111]
	movups	%xmm0, 32(%rbp)
	.loc	1 396 91                # CoinGame.c:396:91
	movaps	.LCPI1_3(%rip), %xmm0   # xmm0 = [116,97]
	movups	%xmm0, 48(%rbp)
	.loc	1 396 118               # CoinGame.c:396:118
	movaps	.LCPI1_4(%rip), %xmm0   # xmm0 = [108,32]
	movups	%xmm0, 64(%rbp)
	.loc	1 396 146               # CoinGame.c:396:146
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [97,109]
	movups	%xmm0, 80(%rbp)
	.loc	1 396 175               # CoinGame.c:396:175
	movaps	.LCPI1_6(%rip), %xmm0   # xmm0 = [111,117]
	movups	%xmm0, 96(%rbp)
	.loc	1 396 205               # CoinGame.c:396:205
	movaps	.LCPI1_7(%rip), %xmm0   # xmm0 = [110,116]
	movups	%xmm0, 112(%rbp)
	.loc	1 396 235               # CoinGame.c:396:235
	movaps	.LCPI1_8(%rip), %xmm0   # xmm0 = [32,111]
	movups	%xmm0, 128(%rbp)
	.loc	1 396 264               # CoinGame.c:396:264
	movaps	.LCPI1_9(%rip), %xmm0   # xmm0 = [102,32]
	movups	%xmm0, 144(%rbp)
	.loc	1 396 293               # CoinGame.c:396:293
	movaps	.LCPI1_10(%rip), %xmm0  # xmm0 = [109,111]
	movups	%xmm0, 160(%rbp)
	.loc	1 396 323               # CoinGame.c:396:323
	movaps	.LCPI1_11(%rip), %xmm0  # xmm0 = [110,101]
	movups	%xmm0, 176(%rbp)
	.loc	1 396 353               # CoinGame.c:396:353
	movaps	.LCPI1_12(%rip), %xmm0  # xmm0 = [121,32]
	movups	%xmm0, 192(%rbp)
	.loc	1 396 382               # CoinGame.c:396:382
	movaps	.LCPI1_13(%rip), %xmm0  # xmm0 = [40,109]
	movups	%xmm0, 208(%rbp)
	.loc	1 396 411               # CoinGame.c:396:411
	movaps	.LCPI1_14(%rip), %xmm0  # xmm0 = [97,120]
	movups	%xmm0, 224(%rbp)
	.loc	1 396 440               # CoinGame.c:396:440
	movaps	.LCPI1_15(%rip), %xmm0  # xmm0 = [105,109]
	movups	%xmm0, 240(%rbp)
	.loc	1 396 470               # CoinGame.c:396:470
	movaps	.LCPI1_16(%rip), %xmm0  # xmm0 = [117,109]
	movups	%xmm0, 256(%rbp)
	.loc	1 396 500               # CoinGame.c:396:500
	movaps	.LCPI1_17(%rip), %xmm0  # xmm0 = [41,32]
	movups	%xmm0, 272(%rbp)
	.loc	1 396 528               # CoinGame.c:396:528
	movaps	.LCPI1_18(%rip), %xmm0  # xmm0 = [65,108]
	movups	%xmm0, 288(%rbp)
	.loc	1 396 557               # CoinGame.c:396:557
	movaps	.LCPI1_19(%rip), %xmm0  # xmm0 = [105,99]
	movups	%xmm0, 304(%rbp)
	.loc	1 396 586               # CoinGame.c:396:586
	movups	%xmm1, 320(%rbp)
	.loc	1 396 615               # CoinGame.c:396:615
	movaps	.LCPI1_20(%rip), %xmm0  # xmm0 = [103,101]
	movups	%xmm0, 336(%rbp)
	.loc	1 396 645               # CoinGame.c:396:645
	movaps	.LCPI1_21(%rip), %xmm0  # xmm0 = [116,115]
	movups	%xmm0, 352(%rbp)
	.loc	1 396 675               # CoinGame.c:396:675
	movaps	.LCPI1_22(%rip), %xmm0  # xmm0 = [32,105]
	movups	%xmm0, 368(%rbp)
	.loc	1 396 704               # CoinGame.c:396:704
	movaps	.LCPI1_23(%rip), %xmm0  # xmm0 = [115,32]
	movups	%xmm0, 384(%rbp)
.Ltmp100:
	#DEBUG_VALUE: main:_18_has_ownership <- 1
	.loc	1 399 2 is_stmt 1       # CoinGame.c:399:2
	movl	$50, %esi
	movq	%rbp, %rdi
	callq	printf_s
	.loc	1 403 2                 # CoinGame.c:403:2
	movl	$.L.str, %edi
	xorl	%eax, %eax
	movq	%r13, %rsi
	callq	printf
.Ltmp101:
	#DEBUG_VALUE: main:_23_size <- 23
	.loc	1 408 2                 # CoinGame.c:408:2
	movl	$184, %edi
	callq	malloc
	movq	%rax, %rbx
.Ltmp102:
	#DEBUG_VALUE: main:_23 <- %RBX
	.loc	1 409 9                 # CoinGame.c:409:9
	movaps	.LCPI1_24(%rip), %xmm0  # xmm0 = [80,97]
	movups	%xmm0, (%rbx)
	.loc	1 409 35 is_stmt 0      # CoinGame.c:409:35
	movaps	.LCPI1_25(%rip), %xmm0  # xmm0 = [115,115]
	movups	%xmm0, 16(%rbx)
	.loc	1 409 63                # CoinGame.c:409:63
	movaps	.LCPI1_26(%rip), %xmm0  # xmm0 = [32,67]
	movups	%xmm0, 32(%rbx)
	.loc	1 409 89                # CoinGame.c:409:89
	movaps	.LCPI1_27(%rip), %xmm0  # xmm0 = [111,105]
	movups	%xmm0, 48(%rbx)
	.loc	1 409 117               # CoinGame.c:409:117
	movaps	.LCPI1_28(%rip), %xmm0  # xmm0 = [110,71]
	movups	%xmm0, 64(%rbx)
	.loc	1 396 146 is_stmt 1     # CoinGame.c:396:146
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [97,109]
	.loc	1 409 145               # CoinGame.c:409:145
	movups	%xmm0, 80(%rbx)
	.loc	1 396 36                # CoinGame.c:396:36
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [101,32]
	.loc	1 409 174               # CoinGame.c:409:174
	movups	%xmm0, 96(%rbx)
	.loc	1 409 203 is_stmt 0     # CoinGame.c:409:203
	movaps	.LCPI1_29(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 112(%rbx)
	.loc	1 409 233               # CoinGame.c:409:233
	movaps	.LCPI1_30(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 128(%rbx)
	.loc	1 409 263               # CoinGame.c:409:263
	movaps	.LCPI1_31(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 144(%rbx)
	.loc	1 409 291               # CoinGame.c:409:291
	movaps	.LCPI1_32(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 160(%rbx)
	.loc	1 409 320               # CoinGame.c:409:320
	movq	$101, 176(%rbx)
.Ltmp103:
	#DEBUG_VALUE: main:_23_has_ownership <- 1
	.loc	1 412 2 is_stmt 1       # CoinGame.c:412:2
	movl	$23, %esi
	movq	%rbx, %rdi
	callq	println_s
.Ltmp104:
	.loc	1 416 2 discriminator 1 # CoinGame.c:416:2
	movq	%r12, %rdi
	callq	free
.Ltmp105:
	#DEBUG_VALUE: main:moves_has_ownership <- 0
	.loc	1 417 2 discriminator 1 # CoinGame.c:417:2
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	free2DArray
.Ltmp106:
	#DEBUG_VALUE: main:_6_has_ownership <- 0
	.loc	1 421 2 discriminator 1 # CoinGame.c:421:2
	movq	%rbp, %rdi
	callq	free
.Ltmp107:
	#DEBUG_VALUE: main:_18_has_ownership <- 0
	.loc	1 422 2 discriminator 1 # CoinGame.c:422:2
	movq	%rbx, %rdi
	callq	free
.Ltmp108:
	#DEBUG_VALUE: main:_23_has_ownership <- 0
	.loc	1 423 2                 # CoinGame.c:423:2
	xorl	%edi, %edi
	callq	exit
.Ltmp109:
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
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/autogenerate_array_leakfree" # string offset=176
.Linfo_string3:
	.asciz	"findMoves"             # string offset=257
.Linfo_string4:
	.asciz	"long long int"         # string offset=267
.Linfo_string5:
	.asciz	"main"                  # string offset=281
.Linfo_string6:
	.asciz	"int"                   # string offset=286
.Linfo_string7:
	.asciz	"moves"                 # string offset=290
.Linfo_string8:
	.asciz	"moves_size"            # string offset=296
.Linfo_string9:
	.asciz	"moves_has_ownership"   # string offset=307
.Linfo_string10:
	.asciz	"_Bool"                 # string offset=327
.Linfo_string11:
	.asciz	"n"                     # string offset=333
.Linfo_string12:
	.asciz	"_10_size"              # string offset=335
.Linfo_string13:
	.asciz	"x_size"                # string offset=344
.Linfo_string14:
	.asciz	"_12_size"              # string offset=351
.Linfo_string15:
	.asciz	"y_size"                # string offset=360
.Linfo_string16:
	.asciz	"_14_size"              # string offset=367
.Linfo_string17:
	.asciz	"z_size"                # string offset=376
.Linfo_string18:
	.asciz	"_70"                   # string offset=383
.Linfo_string19:
	.asciz	"_69"                   # string offset=387
.Linfo_string20:
	.asciz	"_68"                   # string offset=391
.Linfo_string21:
	.asciz	"_67"                   # string offset=395
.Linfo_string22:
	.asciz	"_66"                   # string offset=399
.Linfo_string23:
	.asciz	"_65"                   # string offset=403
.Linfo_string24:
	.asciz	"_64"                   # string offset=407
.Linfo_string25:
	.asciz	"_63"                   # string offset=411
.Linfo_string26:
	.asciz	"_62"                   # string offset=415
.Linfo_string27:
	.asciz	"_61"                   # string offset=419
.Linfo_string28:
	.asciz	"_60"                   # string offset=423
.Linfo_string29:
	.asciz	"_59"                   # string offset=427
.Linfo_string30:
	.asciz	"_58"                   # string offset=431
.Linfo_string31:
	.asciz	"_57"                   # string offset=435
.Linfo_string32:
	.asciz	"_56"                   # string offset=439
.Linfo_string33:
	.asciz	"_55"                   # string offset=443
.Linfo_string34:
	.asciz	"_54"                   # string offset=447
.Linfo_string35:
	.asciz	"_53"                   # string offset=451
.Linfo_string36:
	.asciz	"_52"                   # string offset=455
.Linfo_string37:
	.asciz	"_51"                   # string offset=459
.Linfo_string38:
	.asciz	"_50"                   # string offset=463
.Linfo_string39:
	.asciz	"_49"                   # string offset=467
.Linfo_string40:
	.asciz	"_48"                   # string offset=471
.Linfo_string41:
	.asciz	"_47"                   # string offset=475
.Linfo_string42:
	.asciz	"_46"                   # string offset=479
.Linfo_string43:
	.asciz	"_45"                   # string offset=483
.Linfo_string44:
	.asciz	"_44"                   # string offset=487
.Linfo_string45:
	.asciz	"_43"                   # string offset=491
.Linfo_string46:
	.asciz	"_42"                   # string offset=495
.Linfo_string47:
	.asciz	"_41"                   # string offset=499
.Linfo_string48:
	.asciz	"_40"                   # string offset=503
.Linfo_string49:
	.asciz	"_39"                   # string offset=507
.Linfo_string50:
	.asciz	"_38"                   # string offset=511
.Linfo_string51:
	.asciz	"_37"                   # string offset=515
.Linfo_string52:
	.asciz	"_36"                   # string offset=519
.Linfo_string53:
	.asciz	"_35"                   # string offset=523
.Linfo_string54:
	.asciz	"_34"                   # string offset=527
.Linfo_string55:
	.asciz	"_33"                   # string offset=531
.Linfo_string56:
	.asciz	"_32"                   # string offset=535
.Linfo_string57:
	.asciz	"_31"                   # string offset=539
.Linfo_string58:
	.asciz	"_30"                   # string offset=543
.Linfo_string59:
	.asciz	"_29"                   # string offset=547
.Linfo_string60:
	.asciz	"_28"                   # string offset=551
.Linfo_string61:
	.asciz	"_27"                   # string offset=555
.Linfo_string62:
	.asciz	"_26"                   # string offset=559
.Linfo_string63:
	.asciz	"_25"                   # string offset=563
.Linfo_string64:
	.asciz	"_24"                   # string offset=567
.Linfo_string65:
	.asciz	"_23"                   # string offset=571
.Linfo_string66:
	.asciz	"_22"                   # string offset=575
.Linfo_string67:
	.asciz	"_21"                   # string offset=579
.Linfo_string68:
	.asciz	"_20"                   # string offset=583
.Linfo_string69:
	.asciz	"_19"                   # string offset=587
.Linfo_string70:
	.asciz	"_18"                   # string offset=591
.Linfo_string71:
	.asciz	"_17"                   # string offset=595
.Linfo_string72:
	.asciz	"_16"                   # string offset=599
.Linfo_string73:
	.asciz	"_15"                   # string offset=603
.Linfo_string74:
	.asciz	"_14_has_ownership"     # string offset=607
.Linfo_string75:
	.asciz	"_13"                   # string offset=625
.Linfo_string76:
	.asciz	"_12_has_ownership"     # string offset=629
.Linfo_string77:
	.asciz	"_11"                   # string offset=647
.Linfo_string78:
	.asciz	"_10_has_ownership"     # string offset=651
.Linfo_string79:
	.asciz	"_9"                    # string offset=669
.Linfo_string80:
	.asciz	"i"                     # string offset=672
.Linfo_string81:
	.asciz	"j"                     # string offset=674
.Linfo_string82:
	.asciz	"s"                     # string offset=676
.Linfo_string83:
	.asciz	"z_has_ownership"       # string offset=678
.Linfo_string84:
	.asciz	"y_has_ownership"       # string offset=694
.Linfo_string85:
	.asciz	"x_has_ownership"       # string offset=710
.Linfo_string86:
	.asciz	"_2_has_ownership"      # string offset=726
.Linfo_string87:
	.asciz	"_2_size"               # string offset=743
.Linfo_string88:
	.asciz	"_10"                   # string offset=751
.Linfo_string89:
	.asciz	"x"                     # string offset=755
.Linfo_string90:
	.asciz	"_12"                   # string offset=757
.Linfo_string91:
	.asciz	"y"                     # string offset=761
.Linfo_string92:
	.asciz	"_14"                   # string offset=763
.Linfo_string93:
	.asciz	"z"                     # string offset=767
.Linfo_string94:
	.asciz	"_2"                    # string offset=769
.Linfo_string95:
	.asciz	"argc"                  # string offset=772
.Linfo_string96:
	.asciz	"args"                  # string offset=777
.Linfo_string97:
	.asciz	"char"                  # string offset=782
.Linfo_string98:
	.asciz	"_23_has_ownership"     # string offset=787
.Linfo_string99:
	.asciz	"_23_size"              # string offset=805
.Linfo_string100:
	.asciz	"_18_has_ownership"     # string offset=814
.Linfo_string101:
	.asciz	"_18_size"              # string offset=832
.Linfo_string102:
	.asciz	"_11_has_ownership"     # string offset=841
.Linfo_string103:
	.asciz	"_11_size"              # string offset=859
.Linfo_string104:
	.asciz	"_8_has_ownership"      # string offset=868
.Linfo_string105:
	.asciz	"_8_size"               # string offset=885
.Linfo_string106:
	.asciz	"_7"                    # string offset=893
.Linfo_string107:
	.asciz	"_6_has_ownership"      # string offset=896
.Linfo_string108:
	.asciz	"_6_size_size"          # string offset=913
.Linfo_string109:
	.asciz	"_6_size"               # string offset=926
.Linfo_string110:
	.asciz	"sum_alice"             # string offset=934
.Linfo_string111:
	.asciz	"_6"                    # string offset=944
.Linfo_string112:
	.asciz	"_8"                    # string offset=947
.Linfo_string113:
	.asciz	"max"                   # string offset=950
.Linfo_string114:
	.asciz	"_5"                    # string offset=954
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp17-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp16-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc2:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp17-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	81                      # super-register DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp22-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp65-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp64-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp64-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp57-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp56-.Lfunc_begin0
	.quad	.Ltmp61-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc23:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc33:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc34:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc35:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp37-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp37-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc36:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc37:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp65-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc38:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc39:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp19-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc40:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp18-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp67-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc41:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp30-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc42:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp30-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc43:
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp30-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc44:
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp30-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc45:
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp30-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc46:
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp30-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc47:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc48:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc49:
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	.Ltmp103-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp103-.Lfunc_begin0
	.quad	.Ltmp108-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp108-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc50:
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	.Ltmp101-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp101-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	23                      # 23
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc51:
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	.Ltmp100-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Ltmp107-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp107-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc52:
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	.Ltmp98-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp98-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	50                      # 50
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc53:
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	.Ltmp98-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp98-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc54:
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp97-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc55:
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp92-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc56:
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc57:
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	.Ltmp98-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp98-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc58:
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp97-.Lfunc_begin0
	.quad	.Ltmp105-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp105-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc59:
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp94-.Lfunc_begin0
	.quad	.Ltmp102-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc60:
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc61:
	.quad	.Ltmp89-.Lfunc_begin0
	.quad	.Ltmp90-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc62:
	.quad	.Ltmp90-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp93-.Lfunc_begin0
	.quad	.Ltmp95-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc63:
	.quad	.Ltmp90-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp93-.Lfunc_begin0
	.quad	.Ltmp95-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc64:
	.quad	.Ltmp95-.Lfunc_begin0
	.quad	.Ltmp96-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp97-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc65:
	.quad	.Ltmp95-.Lfunc_begin0
	.quad	.Ltmp96-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc66:
	.quad	.Ltmp97-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc67:
	.quad	.Ltmp99-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc68:
	.quad	.Ltmp102-.Lfunc_begin0
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
	.byte	5                       # Abbreviation Code
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
	.byte	6                       # Abbreviation Code
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
	.byte	7                       # Abbreviation Code
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
	.byte	8                       # Abbreviation Code
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
	.byte	9                       # Abbreviation Code
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
	.byte	5                       # DW_FORM_data2
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
	.byte	10                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
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
	.byte	13                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	15                      # DW_FORM_udata
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
	.byte	14                      # Abbreviation Code
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
	.byte	15                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	16                      # Abbreviation Code
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
	.long	1869                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x746 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x1 DW_TAG_pointer_type
	.byte	3                       # Abbrev [3] 0x2b:0x4ba DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1824                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	4                       # Abbrev [4] 0x44:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1824                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x53:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x62:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1843                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x71:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x80:0xf DW_TAG_variable
	.long	.Ldebug_loc4            # DW_AT_location
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x8f:0xf DW_TAG_variable
	.long	.Ldebug_loc5            # DW_AT_location
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x9e:0xf DW_TAG_variable
	.long	.Ldebug_loc6            # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xad:0xf DW_TAG_variable
	.long	.Ldebug_loc7            # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xbc:0xf DW_TAG_variable
	.long	.Ldebug_loc8            # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	21                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xcb:0xf DW_TAG_variable
	.long	.Ldebug_loc9            # DW_AT_location
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xda:0xf DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	78                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xe9:0xf DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	77                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xf8:0xf DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	76                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x107:0xf DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	75                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x116:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	74                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x122:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	73                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x131:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	72                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x13d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	71                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x149:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x155:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	69                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x161:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	68                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x16d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	67                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x179:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	66                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x185:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	65                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x191:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x19d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x1a9:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1b5:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	61                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x1c4:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	60                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1d0:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1df:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	58                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1ee:0xf DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	57                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1fd:0xf DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	56                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x20c:0xf DW_TAG_variable
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	55                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x21b:0xf DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	54                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x22a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	53                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x236:0xf DW_TAG_variable
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	52                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x245:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x251:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	50                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x25d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	49                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x269:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	48                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x275:0xf DW_TAG_variable
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	47                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x284:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	46                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x290:0xf DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	45                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x29f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x2ab:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	43                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2b7:0xf DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	42                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2c6:0xf DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	41                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2d5:0xf DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	40                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2e4:0xf DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	39                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x2f3:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	38                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2ff:0xf DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	37                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x30e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x31a:0xf DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x329:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x335:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	33                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x341:0xf DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x350:0xf DW_TAG_variable
	.long	.Ldebug_loc32           # DW_AT_location
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x35f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string66         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	30                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x36b:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	29                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x377:0xf DW_TAG_variable
	.long	.Ldebug_loc33           # DW_AT_location
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	28                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x386:0xf DW_TAG_variable
	.long	.Ldebug_loc34           # DW_AT_location
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x395:0xf DW_TAG_variable
	.long	.Ldebug_loc35           # DW_AT_location
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3a4:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	25                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3b0:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	24                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3bc:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	23                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x3c8:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	22                      # DW_AT_decl_line
	.long	1843                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3d4:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string75         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	20                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x3e0:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string76         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
	.long	1843                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3ec:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string77         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	17                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x3f8:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string78         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	16                      # DW_AT_decl_line
	.long	1843                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x404:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x410:0xf DW_TAG_variable
	.long	.Ldebug_loc36           # DW_AT_location
	.long	.Linfo_string80         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x41f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string81         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x42b:0xf DW_TAG_variable
	.long	.Ldebug_loc37           # DW_AT_location
	.long	.Linfo_string82         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x43a:0xf DW_TAG_variable
	.long	.Ldebug_loc38           # DW_AT_location
	.long	.Linfo_string83         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.long	1843                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x449:0xf DW_TAG_variable
	.long	.Ldebug_loc39           # DW_AT_location
	.long	.Linfo_string84         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	1843                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x458:0xf DW_TAG_variable
	.long	.Ldebug_loc40           # DW_AT_location
	.long	.Linfo_string85         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	1843                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x467:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string86         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	1843                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x473:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string87         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x47f:0xf DW_TAG_variable
	.long	.Ldebug_loc41           # DW_AT_location
	.long	.Linfo_string88         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	1824                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x48e:0xf DW_TAG_variable
	.long	.Ldebug_loc42           # DW_AT_location
	.long	.Linfo_string89         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	1824                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x49d:0xf DW_TAG_variable
	.long	.Ldebug_loc43           # DW_AT_location
	.long	.Linfo_string90         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
	.long	1824                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x4ac:0xf DW_TAG_variable
	.long	.Ldebug_loc44           # DW_AT_location
	.long	.Linfo_string91         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.long	1824                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x4bb:0xf DW_TAG_variable
	.long	.Ldebug_loc45           # DW_AT_location
	.long	.Linfo_string92         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	21                      # DW_AT_decl_line
	.long	1824                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x4ca:0xf DW_TAG_variable
	.long	.Ldebug_loc46           # DW_AT_location
	.long	.Linfo_string93         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	1824                    # DW_AT_type
	.byte	8                       # Abbrev [8] 0x4d9:0xb DW_TAG_variable
	.long	.Linfo_string94         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	1824                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0x4e5:0x23b DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	316                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1836                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	10                      # Abbrev [10] 0x4ff:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc47           # DW_AT_location
	.long	.Linfo_string95         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	316                     # DW_AT_decl_line
	.long	1836                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x50f:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc48           # DW_AT_location
	.long	.Linfo_string96         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	316                     # DW_AT_decl_line
	.long	1850                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x51f:0x10 DW_TAG_variable
	.long	.Ldebug_loc49           # DW_AT_location
	.long	.Linfo_string98         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	343                     # DW_AT_decl_line
	.long	1843                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x52f:0x10 DW_TAG_variable
	.long	.Ldebug_loc50           # DW_AT_location
	.long	.Linfo_string99         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	342                     # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x53f:0x10 DW_TAG_variable
	.long	.Ldebug_loc51           # DW_AT_location
	.long	.Linfo_string100        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	339                     # DW_AT_decl_line
	.long	1843                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x54f:0x10 DW_TAG_variable
	.long	.Ldebug_loc52           # DW_AT_location
	.long	.Linfo_string101        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	338                     # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x55f:0x10 DW_TAG_variable
	.long	.Ldebug_loc53           # DW_AT_location
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	336                     # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x56f:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string92         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	335                     # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x57c:0x10 DW_TAG_variable
	.long	.Ldebug_loc54           # DW_AT_location
	.long	.Linfo_string75         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	334                     # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x58c:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string76         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	333                     # DW_AT_decl_line
	.long	1843                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x599:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	332                     # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x5a6:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string102        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	331                     # DW_AT_decl_line
	.long	1843                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x5b3:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string103        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	330                     # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x5c0:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string88         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	329                     # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x5cd:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	328                     # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x5da:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string104        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	327                     # DW_AT_decl_line
	.long	1843                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x5e7:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string105        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	326                     # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x5f4:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string106        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	325                     # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x601:0x10 DW_TAG_variable
	.long	.Ldebug_loc55           # DW_AT_location
	.long	.Linfo_string107        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	324                     # DW_AT_decl_line
	.long	1843                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x611:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string108        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	323                     # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x61e:0x10 DW_TAG_variable
	.long	.Ldebug_loc56           # DW_AT_location
	.long	.Linfo_string109        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	323                     # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x62e:0x10 DW_TAG_variable
	.long	.Ldebug_loc57           # DW_AT_location
	.long	.Linfo_string110        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	321                     # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x63e:0x10 DW_TAG_variable
	.long	.Ldebug_loc58           # DW_AT_location
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	320                     # DW_AT_decl_line
	.long	1843                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x64e:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	319                     # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x65b:0x10 DW_TAG_variable
	.long	.Ldebug_loc59           # DW_AT_location
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	318                     # DW_AT_decl_line
	.long	1829                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x66b:0x10 DW_TAG_variable
	.long	.Ldebug_loc60           # DW_AT_location
	.long	.Linfo_string111        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	323                     # DW_AT_decl_line
	.long	1867                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x67b:0x10 DW_TAG_variable
	.long	.Ldebug_loc61           # DW_AT_location
	.long	.Linfo_string112        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	326                     # DW_AT_decl_line
	.long	1824                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x68b:0x10 DW_TAG_variable
	.long	.Ldebug_loc62           # DW_AT_location
	.long	.Linfo_string113        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	317                     # DW_AT_decl_line
	.long	1824                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x69b:0x10 DW_TAG_variable
	.long	.Ldebug_loc63           # DW_AT_location
	.long	.Linfo_string114        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	322                     # DW_AT_decl_line
	.long	1824                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x6ab:0x10 DW_TAG_variable
	.long	.Ldebug_loc64           # DW_AT_location
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	319                     # DW_AT_decl_line
	.long	1824                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x6bb:0x10 DW_TAG_variable
	.long	.Ldebug_loc65           # DW_AT_location
	.long	.Linfo_string77         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	330                     # DW_AT_decl_line
	.long	1824                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x6cb:0x10 DW_TAG_variable
	.long	.Ldebug_loc66           # DW_AT_location
	.long	.Linfo_string90         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	332                     # DW_AT_decl_line
	.long	1824                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x6db:0x10 DW_TAG_variable
	.long	.Ldebug_loc67           # DW_AT_location
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	338                     # DW_AT_decl_line
	.long	1824                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x6eb:0x10 DW_TAG_variable
	.long	.Ldebug_loc68           # DW_AT_location
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	342                     # DW_AT_decl_line
	.long	1824                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x6fb:0xc DW_TAG_variable
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	337                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	14                      # Abbrev [14] 0x707:0xc DW_TAG_variable
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	340                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	14                      # Abbrev [14] 0x713:0xc DW_TAG_variable
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	341                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	15                      # Abbrev [15] 0x720:0x5 DW_TAG_pointer_type
	.long	1829                    # DW_AT_type
	.byte	16                      # Abbrev [16] 0x725:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	16                      # Abbrev [16] 0x72c:0x7 DW_TAG_base_type
	.long	.Linfo_string6          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	16                      # Abbrev [16] 0x733:0x7 DW_TAG_base_type
	.long	.Linfo_string10         # DW_AT_name
	.byte	2                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	15                      # Abbrev [15] 0x73a:0x5 DW_TAG_pointer_type
	.long	1855                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x73f:0x5 DW_TAG_pointer_type
	.long	1860                    # DW_AT_type
	.byte	16                      # Abbrev [16] 0x744:0x7 DW_TAG_base_type
	.long	.Linfo_string97         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	15                      # Abbrev [15] 0x74b:0x5 DW_TAG_pointer_type
	.long	1824                    # DW_AT_type
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
	.long	1873                    # Compilation Unit Length
	.long	1253                    # DIE offset
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
	.long	1873                    # Compilation Unit Length
	.long	1829                    # DIE offset
	.asciz	"long long int"         # External Name
	.long	1836                    # DIE offset
	.asciz	"int"                   # External Name
	.long	1843                    # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	1860                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git 83402ed45b681e9f38ce6626e5899c19159ceb29) (http://llvm.org/git/llvm.git 4fc8e6fd79f212952e8f538b6d5d9d78098b4505)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
