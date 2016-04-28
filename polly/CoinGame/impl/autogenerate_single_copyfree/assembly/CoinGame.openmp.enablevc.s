	.text
	.file	"llvm/CoinGame.openmp.enablevc.ll"
	.globl	max
	.p2align	4, 0x90
	.type	max,@function
max:                                    # @max
.Lfunc_begin0:
	.file	1 "CoinGame.c"
	.loc	1 2 0                   # CoinGame.c:2:0
	.cfi_startproc
# BB#0:                                 # %entry
	#DEBUG_VALUE: max:a <- %RDI
	#DEBUG_VALUE: max:b <- %RSI
	#DEBUG_VALUE: max:r <- 0
	.loc	1 5 6 prologue_end      # CoinGame.c:5:6
	cmpq	%rsi, %rdi
.Ltmp0:
	.loc	1 7 2                   # CoinGame.c:7:2
	cmovlq	%rsi, %rdi
.Ltmp1:
	.loc	1 17 1 discriminator 2  # CoinGame.c:17:1
	movq	%rdi, %rax
	retq
.Ltmp2:
.Lfunc_end0:
	.size	max, .Lfunc_end0-max
	.cfi_endproc

	.globl	min
	.p2align	4, 0x90
	.type	min,@function
min:                                    # @min
.Lfunc_begin1:
	.loc	1 19 0                  # CoinGame.c:19:0
	.cfi_startproc
# BB#0:                                 # %entry
	#DEBUG_VALUE: min:a <- %RDI
	#DEBUG_VALUE: min:b <- %RSI
	#DEBUG_VALUE: min:r <- 0
	.loc	1 22 6 prologue_end     # CoinGame.c:22:6
	cmpq	%rsi, %rdi
.Ltmp3:
	.loc	1 24 2                  # CoinGame.c:24:2
	cmovleq	%rdi, %rsi
.Ltmp4:
	.loc	1 34 1 discriminator 2  # CoinGame.c:34:1
	movq	%rsi, %rax
	retq
.Ltmp5:
.Lfunc_end1:
	.size	min, .Lfunc_end1-min
	.cfi_endproc

	.globl	findMoves
	.p2align	4, 0x90
	.type	findMoves,@function
findMoves:                              # @findMoves
.Lfunc_begin2:
	.loc	1 36 0                  # CoinGame.c:36:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 97 6 prologue_end     # CoinGame.c:97:6
	pushq	%rbp
.Ltmp6:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp7:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp8:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp9:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp10:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp11:
	.cfi_def_cfa_offset 56
.Ltmp12:
	.cfi_offset %rbx, -56
.Ltmp13:
	.cfi_offset %r12, -48
.Ltmp14:
	.cfi_offset %r13, -40
.Ltmp15:
	.cfi_offset %r14, -32
.Ltmp16:
	.cfi_offset %r15, -24
.Ltmp17:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: findMoves:moves <- %RDI
	#DEBUG_VALUE: findMoves:moves_size <- %RSI
	#DEBUG_VALUE: findMoves:moves_has_ownership [bit_piece offset=0 size=1] <- %EDX
	#DEBUG_VALUE: findMoves:n <- %RCX
.Ltmp18:
	#DEBUG_VALUE: findMoves:_2_size <- 0
	#DEBUG_VALUE: findMoves:_2_has_ownership <- 0
	#DEBUG_VALUE: findMoves:s <- 0
	#DEBUG_VALUE: findMoves:j <- 0
	#DEBUG_VALUE: findMoves:i <- 0
	#DEBUG_VALUE: findMoves:y <- 0
	#DEBUG_VALUE: findMoves:x <- 0
	#DEBUG_VALUE: findMoves:z <- 0
	#DEBUG_VALUE: findMoves:_9 <- 0
	#DEBUG_VALUE: findMoves:_10 <- 0
	#DEBUG_VALUE: findMoves:_11 <- 0
	#DEBUG_VALUE: findMoves:_12 <- 0
	#DEBUG_VALUE: findMoves:_13 <- 0
	#DEBUG_VALUE: findMoves:_14 <- 0
	#DEBUG_VALUE: findMoves:_15 <- 0
	#DEBUG_VALUE: findMoves:_16 <- 0
	#DEBUG_VALUE: findMoves:_17 <- 0
	#DEBUG_VALUE: findMoves:_18 <- 0
	#DEBUG_VALUE: findMoves:_19 <- 0
	#DEBUG_VALUE: findMoves:_20 <- 0
	#DEBUG_VALUE: findMoves:_21 <- 0
	#DEBUG_VALUE: findMoves:_22 <- 0
	#DEBUG_VALUE: findMoves:_23 <- 0
	#DEBUG_VALUE: findMoves:_24 <- 0
	#DEBUG_VALUE: findMoves:_25 <- 0
	#DEBUG_VALUE: findMoves:_26 <- 0
	#DEBUG_VALUE: findMoves:_27 <- 0
	#DEBUG_VALUE: findMoves:_28 <- 0
	#DEBUG_VALUE: findMoves:_29 <- 0
	#DEBUG_VALUE: findMoves:_30 <- 0
	#DEBUG_VALUE: findMoves:_31 <- 0
	#DEBUG_VALUE: findMoves:_32 <- 0
	#DEBUG_VALUE: findMoves:_33 <- 0
	#DEBUG_VALUE: findMoves:_34 <- 0
	#DEBUG_VALUE: findMoves:_35 <- 0
	#DEBUG_VALUE: findMoves:_36 <- 0
	#DEBUG_VALUE: findMoves:_37 <- 0
	#DEBUG_VALUE: findMoves:_38 <- 0
	#DEBUG_VALUE: findMoves:_39 <- 0
	#DEBUG_VALUE: findMoves:_40 <- 0
	#DEBUG_VALUE: findMoves:_41 <- 0
	#DEBUG_VALUE: findMoves:_42 <- 0
	#DEBUG_VALUE: findMoves:_43 <- 0
	#DEBUG_VALUE: findMoves:_44 <- 0
	#DEBUG_VALUE: findMoves:_45 <- 0
	#DEBUG_VALUE: findMoves:_46 <- 0
	#DEBUG_VALUE: findMoves:_47 <- 0
	#DEBUG_VALUE: findMoves:_48 <- 0
	#DEBUG_VALUE: findMoves:_49 <- 0
	#DEBUG_VALUE: findMoves:_50 <- 0
	#DEBUG_VALUE: findMoves:_51 <- 0
	#DEBUG_VALUE: findMoves:_52 <- 0
	#DEBUG_VALUE: findMoves:_53 <- 0
	testq	%rcx, %rcx
	jle	.LBB2_36
.Ltmp19:
# BB#1:                                 # %while.cond1.preheader.lr.ph
	#DEBUG_VALUE: findMoves:n <- %RCX
	#DEBUG_VALUE: findMoves:moves_has_ownership [bit_piece offset=0 size=1] <- %EDX
	#DEBUG_VALUE: findMoves:moves_size <- %RSI
	#DEBUG_VALUE: findMoves:moves <- %RDI
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
.Ltmp20:
	incq	%rax
	movq	%rax, -24(%rsp)         # 8-byte Spill
	xorl	%r10d, %r10d
.Ltmp21:
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
.Ltmp22:
	.loc	1 107 7                 # CoinGame.c:107:7
	movq	-40(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%r10), %r8
	movq	%rdx, %rax
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB2_7:                                # %if.end5.us
                                        #   Parent Loop BB2_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: findMoves:y <- 0
	#DEBUG_VALUE: findMoves:_11 <- 0
.Ltmp23:
	#DEBUG_VALUE: findMoves:_12 <- 1
	movq	%r14, %rbp
	.loc	1 115 9                 # CoinGame.c:115:9
	leaq	(%r10,%rbp), %rdx
	leaq	1(%rbp), %r14
.Ltmp24:
	#DEBUG_VALUE: findMoves:_51 <- %R14
	#DEBUG_VALUE: findMoves:_18 <- %R14
	#DEBUG_VALUE: findMoves:_13 <- %R14
	#DEBUG_VALUE: findMoves:i <- %R14
	.loc	1 125 10                # CoinGame.c:125:10
	testq	%rdx, %rdx
	#DEBUG_VALUE: findMoves:_16 <- 0
.Ltmp25:
	#DEBUG_VALUE: findMoves:_14 <- 1
	jle	.LBB2_8
.Ltmp26:
# BB#9:                                 # %if.end5.us
                                        #   in Loop: Header=BB2_7 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R14
	#DEBUG_VALUE: findMoves:_13 <- %R14
	#DEBUG_VALUE: findMoves:_18 <- %R14
	#DEBUG_VALUE: findMoves:_51 <- %R14
	cmpq	%rcx, %r14
	movl	$0, %r9d
	jge	.LBB2_11
.Ltmp27:
# BB#10:                                # %if.end11.us
                                        #   in Loop: Header=BB2_7 Depth=2
	#DEBUG_VALUE: findMoves:_51 <- %R14
	#DEBUG_VALUE: findMoves:_18 <- %R14
	#DEBUG_VALUE: findMoves:_13 <- %R14
	#DEBUG_VALUE: findMoves:i <- %R14
	#DEBUG_VALUE: findMoves:_17 <- 1
	#DEBUG_VALUE: findMoves:_21 <- 1
	.loc	1 139 8                 # CoinGame.c:139:8
	movq	(%r12,%rax), %r9
.Ltmp28:
	#DEBUG_VALUE: findMoves:_23 <- %R9
	#DEBUG_VALUE: findMoves:y <- %R9
	jmp	.LBB2_11
.Ltmp29:
	.p2align	4, 0x90
.LBB2_8:                                #   in Loop: Header=BB2_7 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R14
	#DEBUG_VALUE: findMoves:_13 <- %R14
	#DEBUG_VALUE: findMoves:_18 <- %R14
	#DEBUG_VALUE: findMoves:_51 <- %R14
	xorl	%r9d, %r9d
.Ltmp30:
.LBB2_11:                               # %polly.preload.cond.us
                                        #   in Loop: Header=BB2_7 Depth=2
	#DEBUG_VALUE: findMoves:_51 <- %R14
	#DEBUG_VALUE: findMoves:_18 <- %R14
	#DEBUG_VALUE: findMoves:_13 <- %R14
	#DEBUG_VALUE: findMoves:i <- %R14
	cmpq	$1, %rdx
	setg	%r11b
	leaq	19(%r15), %rsi
	cmpq	%rsi, %rax
	setl	%bl
	testb	%bl, %r11b
	jne	.LBB2_16
.Ltmp31:
# BB#12:                                # %polly.preload.cond.us
                                        #   in Loop: Header=BB2_7 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R14
	#DEBUG_VALUE: findMoves:_13 <- %R14
	#DEBUG_VALUE: findMoves:_18 <- %R14
	#DEBUG_VALUE: findMoves:_51 <- %R14
	leaq	3(%rbp), %rsi
	cmpq	%rcx, %rsi
	jle	.LBB2_16
.Ltmp32:
# BB#13:                                # %polly.preload.cond.us
                                        #   in Loop: Header=BB2_7 Depth=2
	#DEBUG_VALUE: findMoves:_51 <- %R14
	#DEBUG_VALUE: findMoves:_18 <- %R14
	#DEBUG_VALUE: findMoves:_13 <- %R14
	#DEBUG_VALUE: findMoves:i <- %R14
	movabsq	$1152921504606846975, %rsi # imm = 0xFFFFFFFFFFFFFFF
	cmpq	%rsi, %r10
	jg	.LBB2_16
.Ltmp33:
# BB#14:                                # %polly.preload.cond.us
                                        #   in Loop: Header=BB2_7 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R14
	#DEBUG_VALUE: findMoves:_13 <- %R14
	#DEBUG_VALUE: findMoves:_18 <- %R14
	#DEBUG_VALUE: findMoves:_51 <- %R14
	cmpq	%r15, %rbp
	jg	.LBB2_16
.Ltmp34:
# BB#15:                                # %polly.preload.cond.us
                                        #   in Loop: Header=BB2_7 Depth=2
	#DEBUG_VALUE: findMoves:_51 <- %R14
	#DEBUG_VALUE: findMoves:_18 <- %R14
	#DEBUG_VALUE: findMoves:_13 <- %R14
	#DEBUG_VALUE: findMoves:i <- %R14
	leaq	18(%r15), %rsi
	cmpq	%rsi, %rax
	movl	$0, %ebx
	movl	$0, %esi
	jle	.LBB2_21
.Ltmp35:
	.p2align	4, 0x90
.LBB2_16:                               # %blklab8.us
                                        #   in Loop: Header=BB2_7 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R14
	#DEBUG_VALUE: findMoves:_13 <- %R14
	#DEBUG_VALUE: findMoves:_18 <- %R14
	#DEBUG_VALUE: findMoves:_51 <- %R14
	#DEBUG_VALUE: findMoves:x <- 0
	#DEBUG_VALUE: findMoves:_24 <- 0
	#DEBUG_VALUE: findMoves:_25 <- 2
	.loc	1 151 9                 # CoinGame.c:151:9
	leaq	2(%rbp), %rsi
.Ltmp36:
	#DEBUG_VALUE: findMoves:_28 <- %RSI
	#DEBUG_VALUE: findMoves:_26 <- %RSI
	.loc	1 153 7                 # CoinGame.c:153:7
	cmpq	%rcx, %rsi
	movl	$0, %esi
.Ltmp37:
	jge	.LBB2_18
.Ltmp38:
# BB#17:                                # %if.end18.us
                                        #   in Loop: Header=BB2_7 Depth=2
	#DEBUG_VALUE: findMoves:_51 <- %R14
	#DEBUG_VALUE: findMoves:_18 <- %R14
	#DEBUG_VALUE: findMoves:_13 <- %R14
	#DEBUG_VALUE: findMoves:i <- %R14
	#DEBUG_VALUE: findMoves:_27 <- 2
	.loc	1 163 8                 # CoinGame.c:163:8
	movq	-32(%rsp), %rsi         # 8-byte Reload
	movq	(%rsi,%rax), %rsi
.Ltmp39:
	#DEBUG_VALUE: findMoves:_31 <- %RSI
	#DEBUG_VALUE: findMoves:x <- %RSI
.LBB2_18:                               # %blklab9.us
                                        #   in Loop: Header=BB2_7 Depth=2
	#DEBUG_VALUE: findMoves:_51 <- %R14
	#DEBUG_VALUE: findMoves:_18 <- %R14
	#DEBUG_VALUE: findMoves:_13 <- %R14
	#DEBUG_VALUE: findMoves:i <- %R14
	#DEBUG_VALUE: findMoves:z <- 0
	#DEBUG_VALUE: findMoves:_32 <- 0
	#DEBUG_VALUE: findMoves:_33 <- 1
	#DEBUG_VALUE: findMoves:_35 <- 0
	.loc	1 179 10                # CoinGame.c:179:10
	cmpq	$2, %rdx
	jge	.LBB2_20
.Ltmp40:
# BB#19:                                #   in Loop: Header=BB2_7 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R14
	#DEBUG_VALUE: findMoves:_13 <- %R14
	#DEBUG_VALUE: findMoves:_18 <- %R14
	#DEBUG_VALUE: findMoves:_51 <- %R14
	xorl	%ebx, %ebx
	jmp	.LBB2_21
.Ltmp41:
	.p2align	4, 0x90
.LBB2_20:                               # %if.end26.us
                                        #   in Loop: Header=BB2_7 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R14
	#DEBUG_VALUE: findMoves:_13 <- %R14
	#DEBUG_VALUE: findMoves:_18 <- %R14
	#DEBUG_VALUE: findMoves:_51 <- %R14
	#DEBUG_VALUE: findMoves:_38 <- 2
	.loc	1 189 8                 # CoinGame.c:189:8
	movq	-16(%rdi,%rax), %rbx
.Ltmp42:
	#DEBUG_VALUE: findMoves:_40 <- %RBX
	#DEBUG_VALUE: findMoves:z <- %RBX
.LBB2_21:                               # %blklab10.us
                                        #   in Loop: Header=BB2_7 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R14
	#DEBUG_VALUE: findMoves:_13 <- %R14
	#DEBUG_VALUE: findMoves:_18 <- %R14
	#DEBUG_VALUE: findMoves:_51 <- %R14
	#DEBUG_VALUE: min:r <- 0
	#DEBUG_VALUE: min:r <- 0
	#DEBUG_VALUE: max:r <- 0
	#DEBUG_VALUE: min:a <- %RSI
	#DEBUG_VALUE: min:b <- %R9
	#DEBUG_VALUE: min:b <- %RBX
	.loc	1 5 6                   # CoinGame.c:5:6
	notq	%rsi
.Ltmp43:
	notq	%r9
.Ltmp44:
	cmpq	%r9, %rsi
	cmovlq	%r9, %rsi
	negq	%rsi
	leaq	-1(%rbp,%rsi), %rsi
	notq	%rbx
.Ltmp45:
	cmpq	%r9, %rbx
	cmovlq	%r9, %rbx
	subq	%rbx, %rdx
	decq	%rdx
	cmpq	%rdx, %rsi
.Ltmp46:
	.loc	1 7 2                   # CoinGame.c:7:2
	cmovgeq	%rsi, %rdx
.Ltmp47:
	#DEBUG_VALUE: findMoves:_50 <- 1
	#DEBUG_VALUE: findMoves:_48 <- 1
	#DEBUG_VALUE: findMoves:_41 <- %RDX
	.loc	1 209 15                # CoinGame.c:209:15
	movq	%rdx, (%rdi,%rax)
	.loc	1 107 7                 # CoinGame.c:107:7
	addq	%r13, %rax
	movq	%r8, %rdx
.Ltmp48:
	addq	%r14, %rdx
	jne	.LBB2_7
	jmp	.LBB2_35
.Ltmp49:
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
.Ltmp50:
	#DEBUG_VALUE: findMoves:y <- 0
	#DEBUG_VALUE: findMoves:_11 <- 0
	#DEBUG_VALUE: findMoves:_12 <- 1
	movq	%r9, %rbp
	.loc	1 115 9                 # CoinGame.c:115:9
	leaq	(%r10,%rbp), %r8
	leaq	1(%rbp), %r9
.Ltmp51:
	#DEBUG_VALUE: findMoves:_51 <- %R9
	#DEBUG_VALUE: findMoves:_18 <- %R9
	#DEBUG_VALUE: findMoves:_13 <- %R9
	#DEBUG_VALUE: findMoves:i <- %R9
	.loc	1 125 10                # CoinGame.c:125:10
	testq	%r8, %r8
	#DEBUG_VALUE: findMoves:_16 <- 0
	#DEBUG_VALUE: findMoves:_14 <- 1
	jle	.LBB2_5
.Ltmp52:
# BB#22:                                # %if.end5
                                        #   in Loop: Header=BB2_4 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R9
	#DEBUG_VALUE: findMoves:_13 <- %R9
	#DEBUG_VALUE: findMoves:_18 <- %R9
	#DEBUG_VALUE: findMoves:_51 <- %R9
	cmpq	%rcx, %r9
	movl	$0, %esi
	jge	.LBB2_24
.Ltmp53:
# BB#23:                                # %if.end11
                                        #   in Loop: Header=BB2_4 Depth=2
	#DEBUG_VALUE: findMoves:_51 <- %R9
	#DEBUG_VALUE: findMoves:_18 <- %R9
	#DEBUG_VALUE: findMoves:_13 <- %R9
	#DEBUG_VALUE: findMoves:i <- %R9
	#DEBUG_VALUE: findMoves:_17 <- 1
	#DEBUG_VALUE: findMoves:_21 <- 1
	.loc	1 139 8                 # CoinGame.c:139:8
	movq	(%r12,%rax), %rsi
.Ltmp54:
	#DEBUG_VALUE: findMoves:_23 <- %RSI
	#DEBUG_VALUE: findMoves:y <- %RSI
	jmp	.LBB2_24
.Ltmp55:
	.p2align	4, 0x90
.LBB2_5:                                #   in Loop: Header=BB2_4 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R9
	#DEBUG_VALUE: findMoves:_13 <- %R9
	#DEBUG_VALUE: findMoves:_18 <- %R9
	#DEBUG_VALUE: findMoves:_51 <- %R9
	xorl	%esi, %esi
.Ltmp56:
.LBB2_24:                               # %polly.preload.cond
                                        #   in Loop: Header=BB2_4 Depth=2
	#DEBUG_VALUE: findMoves:_51 <- %R9
	#DEBUG_VALUE: findMoves:_18 <- %R9
	#DEBUG_VALUE: findMoves:_13 <- %R9
	#DEBUG_VALUE: findMoves:i <- %R9
	cmpq	$1, %r8
	setg	%dl
	leaq	19(%r15), %rbx
	cmpq	%rbx, %rax
	setl	%bl
	testb	%bl, %dl
	jne	.LBB2_29
.Ltmp57:
# BB#25:                                # %polly.preload.cond
                                        #   in Loop: Header=BB2_4 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R9
	#DEBUG_VALUE: findMoves:_13 <- %R9
	#DEBUG_VALUE: findMoves:_18 <- %R9
	#DEBUG_VALUE: findMoves:_51 <- %R9
	leaq	3(%rbp), %rdx
	cmpq	%rcx, %rdx
	jle	.LBB2_29
.Ltmp58:
# BB#26:                                # %polly.preload.cond
                                        #   in Loop: Header=BB2_4 Depth=2
	#DEBUG_VALUE: findMoves:_51 <- %R9
	#DEBUG_VALUE: findMoves:_18 <- %R9
	#DEBUG_VALUE: findMoves:_13 <- %R9
	#DEBUG_VALUE: findMoves:i <- %R9
	movabsq	$1152921504606846975, %rdx # imm = 0xFFFFFFFFFFFFFFF
	cmpq	%rdx, %r10
	jg	.LBB2_29
.Ltmp59:
# BB#27:                                # %polly.preload.cond
                                        #   in Loop: Header=BB2_4 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R9
	#DEBUG_VALUE: findMoves:_13 <- %R9
	#DEBUG_VALUE: findMoves:_18 <- %R9
	#DEBUG_VALUE: findMoves:_51 <- %R9
	cmpq	%r15, %rbp
	jg	.LBB2_29
.Ltmp60:
# BB#28:                                # %polly.preload.cond
                                        #   in Loop: Header=BB2_4 Depth=2
	#DEBUG_VALUE: findMoves:_51 <- %R9
	#DEBUG_VALUE: findMoves:_18 <- %R9
	#DEBUG_VALUE: findMoves:_13 <- %R9
	#DEBUG_VALUE: findMoves:i <- %R9
	leaq	18(%r15), %rdx
	cmpq	%rdx, %rax
	movl	$0, %edx
	movl	$0, %ebx
	jle	.LBB2_34
.Ltmp61:
	.p2align	4, 0x90
.LBB2_29:                               # %blklab8
                                        #   in Loop: Header=BB2_4 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R9
	#DEBUG_VALUE: findMoves:_13 <- %R9
	#DEBUG_VALUE: findMoves:_18 <- %R9
	#DEBUG_VALUE: findMoves:_51 <- %R9
	#DEBUG_VALUE: findMoves:x <- 0
	#DEBUG_VALUE: findMoves:_24 <- 0
	#DEBUG_VALUE: findMoves:_25 <- 2
	.loc	1 151 9                 # CoinGame.c:151:9
	leaq	2(%rbp), %rdx
.Ltmp62:
	#DEBUG_VALUE: findMoves:_28 <- %RDX
	#DEBUG_VALUE: findMoves:_26 <- %RDX
	.loc	1 153 7                 # CoinGame.c:153:7
	cmpq	%rcx, %rdx
	movl	$0, %ebx
	jge	.LBB2_31
.Ltmp63:
# BB#30:                                # %if.end18
                                        #   in Loop: Header=BB2_4 Depth=2
	#DEBUG_VALUE: findMoves:_51 <- %R9
	#DEBUG_VALUE: findMoves:_18 <- %R9
	#DEBUG_VALUE: findMoves:_13 <- %R9
	#DEBUG_VALUE: findMoves:i <- %R9
	#DEBUG_VALUE: findMoves:_26 <- %RDX
	#DEBUG_VALUE: findMoves:_28 <- %RDX
	#DEBUG_VALUE: findMoves:_27 <- 2
	.loc	1 163 8                 # CoinGame.c:163:8
	movq	-32(%rsp), %rdx         # 8-byte Reload
.Ltmp64:
	movq	(%rdx,%rax), %rbx
.Ltmp65:
	#DEBUG_VALUE: findMoves:_31 <- %RBX
	#DEBUG_VALUE: findMoves:x <- %RBX
.LBB2_31:                               # %blklab9
                                        #   in Loop: Header=BB2_4 Depth=2
	#DEBUG_VALUE: findMoves:_51 <- %R9
	#DEBUG_VALUE: findMoves:_18 <- %R9
	#DEBUG_VALUE: findMoves:_13 <- %R9
	#DEBUG_VALUE: findMoves:i <- %R9
	#DEBUG_VALUE: findMoves:z <- 0
	#DEBUG_VALUE: findMoves:_32 <- 0
	#DEBUG_VALUE: findMoves:_33 <- 1
	#DEBUG_VALUE: findMoves:_35 <- 0
	.loc	1 179 10                # CoinGame.c:179:10
	cmpq	$2, %r8
	jge	.LBB2_33
.Ltmp66:
# BB#32:                                #   in Loop: Header=BB2_4 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R9
	#DEBUG_VALUE: findMoves:_13 <- %R9
	#DEBUG_VALUE: findMoves:_18 <- %R9
	#DEBUG_VALUE: findMoves:_51 <- %R9
	xorl	%edx, %edx
	jmp	.LBB2_34
.Ltmp67:
	.p2align	4, 0x90
.LBB2_33:                               # %if.end26
                                        #   in Loop: Header=BB2_4 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R9
	#DEBUG_VALUE: findMoves:_13 <- %R9
	#DEBUG_VALUE: findMoves:_18 <- %R9
	#DEBUG_VALUE: findMoves:_51 <- %R9
	#DEBUG_VALUE: findMoves:_38 <- 2
	.loc	1 189 8                 # CoinGame.c:189:8
	movq	-16(%rdi,%rax), %rdx
.Ltmp68:
	#DEBUG_VALUE: findMoves:_40 <- %RDX
	#DEBUG_VALUE: findMoves:z <- %RDX
.LBB2_34:                               # %blklab10
                                        #   in Loop: Header=BB2_4 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R9
	#DEBUG_VALUE: findMoves:_13 <- %R9
	#DEBUG_VALUE: findMoves:_18 <- %R9
	#DEBUG_VALUE: findMoves:_51 <- %R9
	#DEBUG_VALUE: min:r <- 0
	#DEBUG_VALUE: min:r <- 0
	#DEBUG_VALUE: max:r <- 0
	#DEBUG_VALUE: min:a <- %RBX
	#DEBUG_VALUE: min:b <- %RSI
	#DEBUG_VALUE: min:b <- %RDX
	.loc	1 5 6                   # CoinGame.c:5:6
	notq	%rbx
.Ltmp69:
	notq	%rsi
.Ltmp70:
	cmpq	%rsi, %rbx
	cmovlq	%rsi, %rbx
	negq	%rbx
	leaq	-1(%rbp,%rbx), %rbp
	notq	%rdx
.Ltmp71:
	cmpq	%rsi, %rdx
	cmovlq	%rsi, %rdx
	subq	%rdx, %r8
	decq	%r8
	cmpq	%r8, %rbp
.Ltmp72:
	.loc	1 7 2                   # CoinGame.c:7:2
	cmovgeq	%rbp, %r8
.Ltmp73:
	#DEBUG_VALUE: findMoves:_50 <- 1
	#DEBUG_VALUE: findMoves:_48 <- 1
	#DEBUG_VALUE: findMoves:_41 <- %R8
	.loc	1 209 15                # CoinGame.c:209:15
	movq	%r8, (%rdi,%rax)
	.loc	1 107 7                 # CoinGame.c:107:7
	addq	%r13, %rax
	movq	%r14, %rdx
	addq	%r9, %rdx
	jne	.LBB2_4
.Ltmp74:
.LBB2_35:                               # %blklab6
                                        #   in Loop: Header=BB2_2 Depth=1
	#DEBUG_VALUE: findMoves:_52 <- 1
	.loc	1 230 8                 # CoinGame.c:230:8
	incq	%r10
.Ltmp75:
	#DEBUG_VALUE: findMoves:_53 <- %R10
	#DEBUG_VALUE: findMoves:s <- %R10
	movq	-8(%rsp), %rdx          # 8-byte Reload
	.loc	1 97 6                  # CoinGame.c:97:6
	addq	$8, %rdx
	cmpq	%rcx, %r10
	jne	.LBB2_2
.Ltmp76:
.LBB2_36:                               # %if.end42
	.loc	1 240 2                 # CoinGame.c:240:2
	movq	%rdi, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp77:
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
.Lfunc_begin3:
	.loc	1 244 0                 # CoinGame.c:244:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp78:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp79:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp80:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp81:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp82:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp83:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Ltmp84:
	.cfi_def_cfa_offset 64
.Ltmp85:
	.cfi_offset %rbx, -56
.Ltmp86:
	.cfi_offset %r12, -48
.Ltmp87:
	.cfi_offset %r13, -40
.Ltmp88:
	.cfi_offset %r14, -32
.Ltmp89:
	.cfi_offset %r15, -24
.Ltmp90:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
	movl	%edi, %ebx
.Ltmp91:
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
	.loc	1 273 2 prologue_end    # CoinGame.c:273:2
	callq	convertArgsToIntArray
.Ltmp92:
	movq	%rax, %r15
.Ltmp93:
	#DEBUG_VALUE: main:_6 <- %R15
	decl	%ebx
.Ltmp94:
	movslq	%ebx, %r14
.Ltmp95:
	#DEBUG_VALUE: main:_6_has_ownership <- 1
	#DEBUG_VALUE: main:_6_size <- %EBX
	.loc	1 278 5                 # CoinGame.c:278:5
	movq	(%r15), %rdi
.Ltmp96:
	#DEBUG_VALUE: main:_8 <- %RDI
	.loc	1 280 2                 # CoinGame.c:280:2
	callq	parseStringToInt
.Ltmp97:
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_5 <- %RAX
	.loc	1 284 9                 # CoinGame.c:284:9
	testq	%rax, %rax
	jne	.LBB3_1
.Ltmp98:
# BB#2:                                 # %if.end122.critedge
	#DEBUG_VALUE: main:_5 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_6_size <- %EBX
	#DEBUG_VALUE: main:_6 <- %R15
	.loc	1 345 2 discriminator 1 # CoinGame.c:345:2
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	free2DArray
.Ltmp99:
	#DEBUG_VALUE: main:_6_has_ownership <- 0
	.loc	1 351 2                 # CoinGame.c:351:2
	xorl	%edi, %edi
	callq	exit
.Ltmp100:
.LBB3_1:                                # %if.then103
	#DEBUG_VALUE: main:_5 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_6_size <- %EBX
	#DEBUG_VALUE: main:_6 <- %R15
	.loc	1 286 6                 # CoinGame.c:286:6
	movq	(%rax), %rbx
.Ltmp101:
	#DEBUG_VALUE: main:_9 <- 0
	#DEBUG_VALUE: main:n <- %RBX
	.loc	1 290 7                 # CoinGame.c:290:7
	movl	%ebx, %esi
	imull	%esi, %esi
	.loc	1 293 2                 # CoinGame.c:293:2
	xorl	%edi, %edi
	callq	gen1DArray
.Ltmp102:
	#DEBUG_VALUE: main:moves <- %RAX
	#DEBUG_VALUE: main:_11 <- %RAX
	#DEBUG_VALUE: main:_11_has_ownership <- 0
	#DEBUG_VALUE: main:moves_has_ownership <- 0
	.loc	1 304 8                 # CoinGame.c:304:8
	xorl	%edx, %edx
	movq	%rax, %rdi
	movq	%rbx, %rcx
	callq	findMoves
.Ltmp103:
	movq	%rax, %r12
.Ltmp104:
	#DEBUG_VALUE: main:_12 <- %R12
	#DEBUG_VALUE: main:moves <- %R12
	#DEBUG_VALUE: main:_13 <- 1
	#DEBUG_VALUE: main:_12_has_ownership <- 0
	#DEBUG_VALUE: main:moves_has_ownership <- 1
	.loc	1 316 6                 # CoinGame.c:316:6
	movq	-8(%r12,%rbx,8), %r13
.Ltmp105:
	#DEBUG_VALUE: main:_18_size <- 50
	#DEBUG_VALUE: main:_15 <- %R13
	#DEBUG_VALUE: main:sum_alice <- %R13
	.loc	1 323 2                 # CoinGame.c:323:2
	movl	$400, %edi              # imm = 0x190
	callq	malloc
	movq	%rax, %rbp
.Ltmp106:
	#DEBUG_VALUE: main:_18 <- %RBP
	.loc	1 324 9                 # CoinGame.c:324:9
	movaps	.LCPI3_0(%rip), %xmm0   # xmm0 = [84,104]
	movups	%xmm0, (%rbp)
	.loc	1 324 36 is_stmt 0      # CoinGame.c:324:36
	movaps	.LCPI3_1(%rip), %xmm0   # xmm0 = [101,32]
	movups	%xmm0, 16(%rbp)
	movaps	%xmm0, %xmm1
	.loc	1 324 63                # CoinGame.c:324:63
	movaps	.LCPI3_2(%rip), %xmm0   # xmm0 = [116,111]
	movups	%xmm0, 32(%rbp)
	.loc	1 324 91                # CoinGame.c:324:91
	movaps	.LCPI3_3(%rip), %xmm0   # xmm0 = [116,97]
	movups	%xmm0, 48(%rbp)
	.loc	1 324 118               # CoinGame.c:324:118
	movaps	.LCPI3_4(%rip), %xmm0   # xmm0 = [108,32]
	movups	%xmm0, 64(%rbp)
	.loc	1 324 146               # CoinGame.c:324:146
	movaps	.LCPI3_5(%rip), %xmm0   # xmm0 = [97,109]
	movups	%xmm0, 80(%rbp)
	.loc	1 324 175               # CoinGame.c:324:175
	movaps	.LCPI3_6(%rip), %xmm0   # xmm0 = [111,117]
	movups	%xmm0, 96(%rbp)
	.loc	1 324 205               # CoinGame.c:324:205
	movaps	.LCPI3_7(%rip), %xmm0   # xmm0 = [110,116]
	movups	%xmm0, 112(%rbp)
	.loc	1 324 235               # CoinGame.c:324:235
	movaps	.LCPI3_8(%rip), %xmm0   # xmm0 = [32,111]
	movups	%xmm0, 128(%rbp)
	.loc	1 324 264               # CoinGame.c:324:264
	movaps	.LCPI3_9(%rip), %xmm0   # xmm0 = [102,32]
	movups	%xmm0, 144(%rbp)
	.loc	1 324 293               # CoinGame.c:324:293
	movaps	.LCPI3_10(%rip), %xmm0  # xmm0 = [109,111]
	movups	%xmm0, 160(%rbp)
	.loc	1 324 323               # CoinGame.c:324:323
	movaps	.LCPI3_11(%rip), %xmm0  # xmm0 = [110,101]
	movups	%xmm0, 176(%rbp)
	.loc	1 324 353               # CoinGame.c:324:353
	movaps	.LCPI3_12(%rip), %xmm0  # xmm0 = [121,32]
	movups	%xmm0, 192(%rbp)
	.loc	1 324 382               # CoinGame.c:324:382
	movaps	.LCPI3_13(%rip), %xmm0  # xmm0 = [40,109]
	movups	%xmm0, 208(%rbp)
	.loc	1 324 411               # CoinGame.c:324:411
	movaps	.LCPI3_14(%rip), %xmm0  # xmm0 = [97,120]
	movups	%xmm0, 224(%rbp)
	.loc	1 324 440               # CoinGame.c:324:440
	movaps	.LCPI3_15(%rip), %xmm0  # xmm0 = [105,109]
	movups	%xmm0, 240(%rbp)
	.loc	1 324 470               # CoinGame.c:324:470
	movaps	.LCPI3_16(%rip), %xmm0  # xmm0 = [117,109]
	movups	%xmm0, 256(%rbp)
	.loc	1 324 500               # CoinGame.c:324:500
	movaps	.LCPI3_17(%rip), %xmm0  # xmm0 = [41,32]
	movups	%xmm0, 272(%rbp)
	.loc	1 324 528               # CoinGame.c:324:528
	movaps	.LCPI3_18(%rip), %xmm0  # xmm0 = [65,108]
	movups	%xmm0, 288(%rbp)
	.loc	1 324 557               # CoinGame.c:324:557
	movaps	.LCPI3_19(%rip), %xmm0  # xmm0 = [105,99]
	movups	%xmm0, 304(%rbp)
	.loc	1 324 586               # CoinGame.c:324:586
	movups	%xmm1, 320(%rbp)
	.loc	1 324 615               # CoinGame.c:324:615
	movaps	.LCPI3_20(%rip), %xmm0  # xmm0 = [103,101]
	movups	%xmm0, 336(%rbp)
	.loc	1 324 645               # CoinGame.c:324:645
	movaps	.LCPI3_21(%rip), %xmm0  # xmm0 = [116,115]
	movups	%xmm0, 352(%rbp)
	.loc	1 324 675               # CoinGame.c:324:675
	movaps	.LCPI3_22(%rip), %xmm0  # xmm0 = [32,105]
	movups	%xmm0, 368(%rbp)
	.loc	1 324 704               # CoinGame.c:324:704
	movaps	.LCPI3_23(%rip), %xmm0  # xmm0 = [115,32]
	movups	%xmm0, 384(%rbp)
.Ltmp107:
	#DEBUG_VALUE: main:_18_has_ownership <- 1
	.loc	1 327 2 is_stmt 1       # CoinGame.c:327:2
	movl	$50, %esi
	movq	%rbp, %rdi
	callq	printf_s
	.loc	1 331 2                 # CoinGame.c:331:2
	movl	$.L.str, %edi
	xorl	%eax, %eax
	movq	%r13, %rsi
	callq	printf
.Ltmp108:
	#DEBUG_VALUE: main:_23_size <- 23
	.loc	1 336 2                 # CoinGame.c:336:2
	movl	$184, %edi
	callq	malloc
	movq	%rax, %rbx
.Ltmp109:
	#DEBUG_VALUE: main:_23 <- %RBX
	.loc	1 337 9                 # CoinGame.c:337:9
	movaps	.LCPI3_24(%rip), %xmm0  # xmm0 = [80,97]
	movups	%xmm0, (%rbx)
	.loc	1 337 35 is_stmt 0      # CoinGame.c:337:35
	movaps	.LCPI3_25(%rip), %xmm0  # xmm0 = [115,115]
	movups	%xmm0, 16(%rbx)
	.loc	1 337 63                # CoinGame.c:337:63
	movaps	.LCPI3_26(%rip), %xmm0  # xmm0 = [32,67]
	movups	%xmm0, 32(%rbx)
	.loc	1 337 89                # CoinGame.c:337:89
	movaps	.LCPI3_27(%rip), %xmm0  # xmm0 = [111,105]
	movups	%xmm0, 48(%rbx)
	.loc	1 337 117               # CoinGame.c:337:117
	movaps	.LCPI3_28(%rip), %xmm0  # xmm0 = [110,71]
	movups	%xmm0, 64(%rbx)
	.loc	1 324 146 is_stmt 1     # CoinGame.c:324:146
	movaps	.LCPI3_5(%rip), %xmm0   # xmm0 = [97,109]
	.loc	1 337 145               # CoinGame.c:337:145
	movups	%xmm0, 80(%rbx)
	.loc	1 324 36                # CoinGame.c:324:36
	movaps	.LCPI3_1(%rip), %xmm0   # xmm0 = [101,32]
	.loc	1 337 174               # CoinGame.c:337:174
	movups	%xmm0, 96(%rbx)
	.loc	1 337 203 is_stmt 0     # CoinGame.c:337:203
	movaps	.LCPI3_29(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 112(%rbx)
	.loc	1 337 233               # CoinGame.c:337:233
	movaps	.LCPI3_30(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 128(%rbx)
	.loc	1 337 263               # CoinGame.c:337:263
	movaps	.LCPI3_31(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 144(%rbx)
	.loc	1 337 291               # CoinGame.c:337:291
	movaps	.LCPI3_32(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 160(%rbx)
	.loc	1 337 320               # CoinGame.c:337:320
	movq	$101, 176(%rbx)
.Ltmp110:
	#DEBUG_VALUE: main:_23_has_ownership <- 1
	.loc	1 340 2 is_stmt 1       # CoinGame.c:340:2
	movl	$23, %esi
	movq	%rbx, %rdi
	callq	println_s
.Ltmp111:
	.loc	1 344 2 discriminator 1 # CoinGame.c:344:2
	movq	%r12, %rdi
	callq	free
.Ltmp112:
	#DEBUG_VALUE: main:moves_has_ownership <- 0
	.loc	1 345 2 discriminator 1 # CoinGame.c:345:2
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	free2DArray
.Ltmp113:
	#DEBUG_VALUE: main:_6_has_ownership <- 0
	.loc	1 349 2 discriminator 1 # CoinGame.c:349:2
	movq	%rbp, %rdi
	callq	free
.Ltmp114:
	#DEBUG_VALUE: main:_18_has_ownership <- 0
	.loc	1 350 2 discriminator 1 # CoinGame.c:350:2
	movq	%rbx, %rdi
	callq	free
.Ltmp115:
	#DEBUG_VALUE: main:_23_has_ownership <- 0
	.loc	1 351 2                 # CoinGame.c:351:2
	xorl	%edi, %edi
	callq	exit
.Ltmp116:
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%lld\n"
	.size	.L.str, 6

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git 2af14cc4a90f43170f8ea9c1dfa0f71f46a0621c) (http://llvm.org/git/llvm.git 1e7e2b2b556977af8ccc12b7afba61302f3a2da9)" # string offset=0
.Linfo_string1:
	.asciz	"CoinGame.c"            # string offset=165
.Linfo_string2:
	.asciz	"/home/mw169/workspace/WhileyOpenCL/polly/CoinGame/impl/autogenerate_ifconverter_copyfree" # string offset=176
.Linfo_string3:
	.asciz	"max"                   # string offset=265
.Linfo_string4:
	.asciz	"long long int"         # string offset=269
.Linfo_string5:
	.asciz	"a"                     # string offset=283
.Linfo_string6:
	.asciz	"b"                     # string offset=285
.Linfo_string7:
	.asciz	"r"                     # string offset=287
.Linfo_string8:
	.asciz	"min"                   # string offset=289
.Linfo_string9:
	.asciz	"findMoves"             # string offset=293
.Linfo_string10:
	.asciz	"main"                  # string offset=303
.Linfo_string11:
	.asciz	"int"                   # string offset=308
.Linfo_string12:
	.asciz	"moves"                 # string offset=312
.Linfo_string13:
	.asciz	"moves_size"            # string offset=318
.Linfo_string14:
	.asciz	"moves_has_ownership"   # string offset=329
.Linfo_string15:
	.asciz	"_Bool"                 # string offset=349
.Linfo_string16:
	.asciz	"n"                     # string offset=355
.Linfo_string17:
	.asciz	"_2_size"               # string offset=357
.Linfo_string18:
	.asciz	"_2_has_ownership"      # string offset=365
.Linfo_string19:
	.asciz	"s"                     # string offset=382
.Linfo_string20:
	.asciz	"j"                     # string offset=384
.Linfo_string21:
	.asciz	"i"                     # string offset=386
.Linfo_string22:
	.asciz	"y"                     # string offset=388
.Linfo_string23:
	.asciz	"x"                     # string offset=390
.Linfo_string24:
	.asciz	"z"                     # string offset=392
.Linfo_string25:
	.asciz	"_9"                    # string offset=394
.Linfo_string26:
	.asciz	"_10"                   # string offset=397
.Linfo_string27:
	.asciz	"_11"                   # string offset=401
.Linfo_string28:
	.asciz	"_12"                   # string offset=405
.Linfo_string29:
	.asciz	"_13"                   # string offset=409
.Linfo_string30:
	.asciz	"_14"                   # string offset=413
.Linfo_string31:
	.asciz	"_15"                   # string offset=417
.Linfo_string32:
	.asciz	"_16"                   # string offset=421
.Linfo_string33:
	.asciz	"_17"                   # string offset=425
.Linfo_string34:
	.asciz	"_18"                   # string offset=429
.Linfo_string35:
	.asciz	"_19"                   # string offset=433
.Linfo_string36:
	.asciz	"_20"                   # string offset=437
.Linfo_string37:
	.asciz	"_21"                   # string offset=441
.Linfo_string38:
	.asciz	"_22"                   # string offset=445
.Linfo_string39:
	.asciz	"_23"                   # string offset=449
.Linfo_string40:
	.asciz	"_24"                   # string offset=453
.Linfo_string41:
	.asciz	"_25"                   # string offset=457
.Linfo_string42:
	.asciz	"_26"                   # string offset=461
.Linfo_string43:
	.asciz	"_27"                   # string offset=465
.Linfo_string44:
	.asciz	"_28"                   # string offset=469
.Linfo_string45:
	.asciz	"_29"                   # string offset=473
.Linfo_string46:
	.asciz	"_30"                   # string offset=477
.Linfo_string47:
	.asciz	"_31"                   # string offset=481
.Linfo_string48:
	.asciz	"_32"                   # string offset=485
.Linfo_string49:
	.asciz	"_33"                   # string offset=489
.Linfo_string50:
	.asciz	"_34"                   # string offset=493
.Linfo_string51:
	.asciz	"_35"                   # string offset=497
.Linfo_string52:
	.asciz	"_36"                   # string offset=501
.Linfo_string53:
	.asciz	"_37"                   # string offset=505
.Linfo_string54:
	.asciz	"_38"                   # string offset=509
.Linfo_string55:
	.asciz	"_39"                   # string offset=513
.Linfo_string56:
	.asciz	"_40"                   # string offset=517
.Linfo_string57:
	.asciz	"_41"                   # string offset=521
.Linfo_string58:
	.asciz	"_42"                   # string offset=525
.Linfo_string59:
	.asciz	"_43"                   # string offset=529
.Linfo_string60:
	.asciz	"_44"                   # string offset=533
.Linfo_string61:
	.asciz	"_45"                   # string offset=537
.Linfo_string62:
	.asciz	"_46"                   # string offset=541
.Linfo_string63:
	.asciz	"_47"                   # string offset=545
.Linfo_string64:
	.asciz	"_48"                   # string offset=549
.Linfo_string65:
	.asciz	"_49"                   # string offset=553
.Linfo_string66:
	.asciz	"_50"                   # string offset=557
.Linfo_string67:
	.asciz	"_51"                   # string offset=561
.Linfo_string68:
	.asciz	"_52"                   # string offset=565
.Linfo_string69:
	.asciz	"_53"                   # string offset=569
.Linfo_string70:
	.asciz	"_2"                    # string offset=573
.Linfo_string71:
	.asciz	"argc"                  # string offset=576
.Linfo_string72:
	.asciz	"args"                  # string offset=581
.Linfo_string73:
	.asciz	"char"                  # string offset=586
.Linfo_string74:
	.asciz	"_23_has_ownership"     # string offset=591
.Linfo_string75:
	.asciz	"_23_size"              # string offset=609
.Linfo_string76:
	.asciz	"_18_has_ownership"     # string offset=618
.Linfo_string77:
	.asciz	"_18_size"              # string offset=636
.Linfo_string78:
	.asciz	"_12_has_ownership"     # string offset=645
.Linfo_string79:
	.asciz	"_12_size"              # string offset=663
.Linfo_string80:
	.asciz	"_11_has_ownership"     # string offset=672
.Linfo_string81:
	.asciz	"_11_size"              # string offset=690
.Linfo_string82:
	.asciz	"_8_has_ownership"      # string offset=699
.Linfo_string83:
	.asciz	"_8_size"               # string offset=716
.Linfo_string84:
	.asciz	"_7"                    # string offset=724
.Linfo_string85:
	.asciz	"_6_has_ownership"      # string offset=727
.Linfo_string86:
	.asciz	"_6_size_size"          # string offset=744
.Linfo_string87:
	.asciz	"_6_size"               # string offset=757
.Linfo_string88:
	.asciz	"sum_alice"             # string offset=765
.Linfo_string89:
	.asciz	"_6"                    # string offset=775
.Linfo_string90:
	.asciz	"_8"                    # string offset=778
.Linfo_string91:
	.asciz	"_5"                    # string offset=781
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp4-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc2:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp21-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	81                      # super-register DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp76-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	90                      # DW_OP_reg10
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp24-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp24-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	89                      # DW_OP_reg9
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp28-.Lfunc_begin0
	.quad	.Ltmp29-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	89                      # DW_OP_reg9
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp61-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp65-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp65-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp23-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp24-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp24-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	89                      # DW_OP_reg9
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp25-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp25-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp27-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp24-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp24-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	89                      # DW_OP_reg9
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp27-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp28-.Lfunc_begin0
	.quad	.Ltmp29-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	89                      # DW_OP_reg9
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp35-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp36-.Lfunc_begin0
	.quad	.Ltmp37-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp62-.Lfunc_begin0
	.quad	.Ltmp64-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp36-.Lfunc_begin0
	.quad	.Ltmp37-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp62-.Lfunc_begin0
	.quad	.Ltmp64-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp65-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc23:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp24-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp24-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	89                      # DW_OP_reg9
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp76-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	90                      # DW_OP_reg10
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc33:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc34:
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp110-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp110-.Lfunc_begin0
	.quad	.Ltmp115-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp115-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc35:
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp108-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp108-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	23                      # 23
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc36:
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp107-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp107-.Lfunc_begin0
	.quad	.Ltmp114-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp114-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc37:
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp105-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp105-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	50                      # 50
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc38:
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp105-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp105-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc39:
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp104-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp104-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc40:
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp95-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp95-.Lfunc_begin0
	.quad	.Ltmp99-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp99-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc41:
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp95-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp95-.Lfunc_begin0
	.quad	.Ltmp101-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc42:
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp105-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp105-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc43:
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp104-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp104-.Lfunc_begin0
	.quad	.Ltmp112-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp112-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc44:
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp101-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp101-.Lfunc_begin0
	.quad	.Ltmp109-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc45:
	.quad	.Ltmp93-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc46:
	.quad	.Ltmp96-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc47:
	.quad	.Ltmp97-.Lfunc_begin0
	.quad	.Ltmp99-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Ltmp102-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc48:
	.quad	.Ltmp97-.Lfunc_begin0
	.quad	.Ltmp99-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Ltmp102-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc49:
	.quad	.Ltmp102-.Lfunc_begin0
	.quad	.Ltmp103-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp104-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc50:
	.quad	.Ltmp102-.Lfunc_begin0
	.quad	.Ltmp103-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc51:
	.quad	.Ltmp104-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc52:
	.quad	.Ltmp106-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc53:
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
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
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	4                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	5                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	6                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	7                       # Abbreviation Code
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
	.byte	8                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
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
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
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
	.byte	32                      # DW_AT_inline
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	12                      # Abbreviation Code
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
	.byte	13                      # Abbreviation Code
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
	.byte	15                      # Abbreviation Code
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
	.byte	16                      # Abbreviation Code
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
	.byte	17                      # Abbreviation Code
	.byte	29                      # DW_TAG_inlined_subroutine
	.byte	1                       # DW_CHILDREN_yes
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	85                      # DW_AT_ranges
	.byte	23                      # DW_FORM_sec_offset
	.byte	88                      # DW_AT_call_file
	.byte	11                      # DW_FORM_data1
	.byte	89                      # DW_AT_call_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	18                      # Abbreviation Code
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
	.byte	19                      # Abbreviation Code
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
	.byte	20                      # Abbreviation Code
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
	.byte	21                      # Abbreviation Code
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
	.byte	22                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	1624                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x651 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x1 DW_TAG_pointer_type
	.byte	3                       # Abbrev [3] 0x2b:0x2a DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	151                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x3e:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	163                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x47:0x7 DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	84
	.long	174                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x4e:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	185                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x55:0x42 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	197                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0x6e:0xd DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	85
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x7b:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x8a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	20                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	11                      # Abbrev [11] 0x97:0x2e DW_TAG_subprogram
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	197                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	12                      # Abbrev [12] 0xa3:0xb DW_TAG_formal_parameter
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0xae:0xb DW_TAG_formal_parameter
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0xb9:0xb DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	14                      # Abbrev [14] 0xc5:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # Abbrev [7] 0xcc:0x33d DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1586                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	9                       # Abbrev [9] 0xe5:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	1586                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0xf4:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x103:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc4            # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	1598                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0x112:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc5            # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x121:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	37                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x12d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	38                      # DW_AT_decl_line
	.long	1598                    # DW_AT_type
	.byte	16                      # Abbrev [16] 0x139:0xf DW_TAG_variable
	.long	.Ldebug_loc6            # DW_AT_location
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	39                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x148:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	40                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x154:0xf DW_TAG_variable
	.long	.Ldebug_loc7            # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	41                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x163:0xf DW_TAG_variable
	.long	.Ldebug_loc8            # DW_AT_location
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	42                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x172:0xf DW_TAG_variable
	.long	.Ldebug_loc9            # DW_AT_location
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	43                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x181:0xf DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x190:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	45                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x19c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	46                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1a8:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	47                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x1b4:0xf DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	48                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x1c3:0xf DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	49                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x1d2:0xf DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	50                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1e1:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1ed:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	52                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x1f9:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	53                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x208:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	54                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x217:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	55                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x223:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	56                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x22f:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	57                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x23e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	58                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x24a:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x259:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	60                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x265:0xf DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	61                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x274:0xf DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x283:0xf DW_TAG_variable
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x292:0xf DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x2a1:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	65                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x2ad:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	66                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x2b9:0xf DW_TAG_variable
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	67                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x2c8:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	68                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x2d4:0xf DW_TAG_variable
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	69                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x2e3:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x2ef:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	71                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x2fb:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	72                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x307:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	73                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x313:0xf DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	74                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x322:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	75                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x32e:0xf DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	76                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x33d:0xf DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	77                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x34c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	78                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x358:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	79                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x364:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	80                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x370:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	81                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x37c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	82                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x388:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	83                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x394:0xf DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	84                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x3a3:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	85                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x3af:0xf DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	.Linfo_string66         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	86                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x3be:0xf DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	87                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x3cd:0xf DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	88                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x3dc:0xf DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	89                      # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x3eb:0xb DW_TAG_variable
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	37                      # DW_AT_decl_line
	.long	1586                    # DW_AT_type
	.byte	17                      # Abbrev [17] 0x3f6:0x12 DW_TAG_inlined_subroutine
	.long	151                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	203                     # DW_AT_call_line
	.byte	6                       # Abbrev [6] 0x401:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	185                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x409:0x229 DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	244                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1591                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	9                       # Abbrev [9] 0x422:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc32           # DW_AT_location
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	244                     # DW_AT_decl_line
	.long	1591                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0x431:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc33           # DW_AT_location
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	244                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x440:0x10 DW_TAG_variable
	.long	.Ldebug_loc34           # DW_AT_location
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	271                     # DW_AT_decl_line
	.long	1598                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x450:0x10 DW_TAG_variable
	.long	.Ldebug_loc35           # DW_AT_location
	.long	.Linfo_string75         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	270                     # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x460:0x10 DW_TAG_variable
	.long	.Ldebug_loc36           # DW_AT_location
	.long	.Linfo_string76         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	267                     # DW_AT_decl_line
	.long	1598                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x470:0x10 DW_TAG_variable
	.long	.Ldebug_loc37           # DW_AT_location
	.long	.Linfo_string77         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	266                     # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x480:0x10 DW_TAG_variable
	.long	.Ldebug_loc38           # DW_AT_location
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	264                     # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	19                      # Abbrev [19] 0x490:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	263                     # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x49d:0x10 DW_TAG_variable
	.long	.Ldebug_loc39           # DW_AT_location
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	262                     # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x4ad:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string78         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	261                     # DW_AT_decl_line
	.long	1598                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x4ba:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	260                     # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x4c7:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string80         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	259                     # DW_AT_decl_line
	.long	1598                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x4d4:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string81         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	258                     # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	19                      # Abbrev [19] 0x4e1:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	257                     # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	19                      # Abbrev [19] 0x4ee:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	256                     # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x4fb:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string82         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	255                     # DW_AT_decl_line
	.long	1598                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x507:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string83         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	254                     # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x513:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string84         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	253                     # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x51f:0xf DW_TAG_variable
	.long	.Ldebug_loc40           # DW_AT_location
	.long	.Linfo_string85         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	252                     # DW_AT_decl_line
	.long	1598                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x52e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string86         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	251                     # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x53a:0xf DW_TAG_variable
	.long	.Ldebug_loc41           # DW_AT_location
	.long	.Linfo_string87         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	251                     # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x549:0xf DW_TAG_variable
	.long	.Ldebug_loc42           # DW_AT_location
	.long	.Linfo_string88         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	249                     # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x558:0xf DW_TAG_variable
	.long	.Ldebug_loc43           # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	248                     # DW_AT_decl_line
	.long	1598                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x567:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	247                     # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x573:0xf DW_TAG_variable
	.long	.Ldebug_loc44           # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	246                     # DW_AT_decl_line
	.long	197                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x582:0xf DW_TAG_variable
	.long	.Ldebug_loc45           # DW_AT_location
	.long	.Linfo_string89         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	251                     # DW_AT_decl_line
	.long	1622                    # DW_AT_type
	.byte	16                      # Abbrev [16] 0x591:0xf DW_TAG_variable
	.long	.Ldebug_loc46           # DW_AT_location
	.long	.Linfo_string90         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	254                     # DW_AT_decl_line
	.long	1586                    # DW_AT_type
	.byte	16                      # Abbrev [16] 0x5a0:0xf DW_TAG_variable
	.long	.Ldebug_loc47           # DW_AT_location
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	245                     # DW_AT_decl_line
	.long	1586                    # DW_AT_type
	.byte	16                      # Abbrev [16] 0x5af:0xf DW_TAG_variable
	.long	.Ldebug_loc48           # DW_AT_location
	.long	.Linfo_string91         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	250                     # DW_AT_decl_line
	.long	1586                    # DW_AT_type
	.byte	16                      # Abbrev [16] 0x5be:0xf DW_TAG_variable
	.long	.Ldebug_loc49           # DW_AT_location
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	247                     # DW_AT_decl_line
	.long	1586                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x5cd:0x10 DW_TAG_variable
	.long	.Ldebug_loc50           # DW_AT_location
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	258                     # DW_AT_decl_line
	.long	1586                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x5dd:0x10 DW_TAG_variable
	.long	.Ldebug_loc51           # DW_AT_location
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	260                     # DW_AT_decl_line
	.long	1586                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x5ed:0x10 DW_TAG_variable
	.long	.Ldebug_loc52           # DW_AT_location
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	266                     # DW_AT_decl_line
	.long	1586                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x5fd:0x10 DW_TAG_variable
	.long	.Ldebug_loc53           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	270                     # DW_AT_decl_line
	.long	1586                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x60d:0xc DW_TAG_variable
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	265                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	21                      # Abbrev [21] 0x619:0xc DW_TAG_variable
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	268                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	21                      # Abbrev [21] 0x625:0xc DW_TAG_variable
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	269                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	22                      # Abbrev [22] 0x632:0x5 DW_TAG_pointer_type
	.long	197                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x637:0x7 DW_TAG_base_type
	.long	.Linfo_string11         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	14                      # Abbrev [14] 0x63e:0x7 DW_TAG_base_type
	.long	.Linfo_string15         # DW_AT_name
	.byte	2                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	22                      # Abbrev [22] 0x645:0x5 DW_TAG_pointer_type
	.long	1610                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x64a:0x5 DW_TAG_pointer_type
	.long	1615                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x64f:0x7 DW_TAG_base_type
	.long	.Linfo_string73         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	22                      # Abbrev [22] 0x656:0x5 DW_TAG_pointer_type
	.long	1586                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	0
	.quad	0
	.section	.debug_macinfo,"",@progbits
.Ldebug_macinfo:
.Lcu_macro_begin0:
	.byte	0                       # End Of Macro List Mark
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end0-.LpubNames_begin0 # Length of Public Names Info
.LpubNames_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	1628                    # Compilation Unit Length
	.long	85                      # DIE offset
	.asciz	"min"                   # External Name
	.long	1033                    # DIE offset
	.asciz	"main"                  # External Name
	.long	151                     # DIE offset
	.asciz	"max"                   # External Name
	.long	204                     # DIE offset
	.asciz	"findMoves"             # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	1628                    # Compilation Unit Length
	.long	197                     # DIE offset
	.asciz	"long long int"         # External Name
	.long	1591                    # DIE offset
	.asciz	"int"                   # External Name
	.long	1598                    # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	1615                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git 2af14cc4a90f43170f8ea9c1dfa0f71f46a0621c) (http://llvm.org/git/llvm.git 1e7e2b2b556977af8ccc12b7afba61302f3a2da9)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
