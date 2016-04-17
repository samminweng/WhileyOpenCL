	.text
	.file	"llvm/CoinGame.openmp.disablevc.ll"
	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
.Lfunc_begin0:
	.file	1 "CoinGame.c"
	.loc	1 2 0                   # CoinGame.c:2:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp0:
	.cfi_def_cfa_offset 16
.Ltmp1:
	.cfi_offset %rbx, -16
	#DEBUG_VALUE: init:n <- %RDI
.Ltmp2:
	#DEBUG_VALUE: init:_5_size <- %RDI
	#DEBUG_VALUE: init:coins_size <- %RDI
	movq	%rdi, %rbx
.Ltmp3:
	#DEBUG_VALUE: init:_10 <- 0
	#DEBUG_VALUE: init:_9 <- 0
	#DEBUG_VALUE: init:_8 <- 0
	#DEBUG_VALUE: init:_7 <- 0
	#DEBUG_VALUE: init:_6 <- 0
	#DEBUG_VALUE: init:_5_has_ownership <- 0
	#DEBUG_VALUE: init:_4 <- 0
	#DEBUG_VALUE: init:i <- 0
	#DEBUG_VALUE: init:coins_has_ownership <- 0
	#DEBUG_VALUE: init:_1_has_ownership <- 0
	#DEBUG_VALUE: init:_1_size <- 0
	#DEBUG_VALUE: init:coins_size <- 0
	#DEBUG_VALUE: init:_5_size <- 0
	#DEBUG_VALUE: init:n <- %RBX
	.loc	1 20 2 prologue_end     # CoinGame.c:20:2
	xorl	%edi, %edi
	movl	%ebx, %esi
	callq	gen1DArray
.Ltmp4:
	#DEBUG_VALUE: init:coins <- %RAX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:coins_has_ownership <- 1
	.loc	1 34 6                  # CoinGame.c:34:6
	testq	%rbx, %rbx
	jle	.LBB0_5
.Ltmp5:
# BB#1:                                 # %if.end7.preheader
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:coins <- %RAX
	#DEBUG_VALUE: init:n <- %RBX
	.loc	1 36 6                  # CoinGame.c:36:6
	leaq	-1(%rbx), %rdx
	xorl	%ecx, %ecx
	movq	%rbx, %rsi
	andq	$3, %rsi
	je	.LBB0_3
.Ltmp6:
	.p2align	4, 0x90
.LBB0_2:                                # %if.end7.prol
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 40 12                 # CoinGame.c:40:12
	addq	%rcx, (%rax,%rcx,8)
.Ltmp7:
	#DEBUG_VALUE: init:_9 <- 1
	.loc	1 44 8                  # CoinGame.c:44:8
	incq	%rcx
.Ltmp8:
	#DEBUG_VALUE: init:_10 <- %RCX
	#DEBUG_VALUE: init:i <- %RCX
	.loc	1 34 6                  # CoinGame.c:34:6
	cmpq	%rcx, %rsi
	jne	.LBB0_2
.Ltmp9:
.LBB0_3:                                # %if.end7.preheader.split
	.loc	1 36 6                  # CoinGame.c:36:6
	cmpq	$3, %rdx
	jb	.LBB0_5
	.p2align	4, 0x90
.LBB0_4:                                # %if.end7
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 40 12                 # CoinGame.c:40:12
	addq	%rcx, (%rax,%rcx,8)
	#DEBUG_VALUE: init:_9 <- 1
	.loc	1 36 6                  # CoinGame.c:36:6
	movq	8(%rax,%rcx,8), %rdx
	.loc	1 40 12                 # CoinGame.c:40:12
	leaq	1(%rcx,%rdx), %rdx
	movq	%rdx, 8(%rax,%rcx,8)
	.loc	1 36 6                  # CoinGame.c:36:6
	movq	16(%rax,%rcx,8), %rdx
	.loc	1 40 12                 # CoinGame.c:40:12
	leaq	2(%rcx,%rdx), %rdx
	movq	%rdx, 16(%rax,%rcx,8)
	.loc	1 36 6                  # CoinGame.c:36:6
	movq	24(%rax,%rcx,8), %rdx
	.loc	1 40 12                 # CoinGame.c:40:12
	leaq	3(%rcx,%rdx), %rdx
	movq	%rdx, 24(%rax,%rcx,8)
	.loc	1 44 8                  # CoinGame.c:44:8
	addq	$4, %rcx
	.loc	1 34 6                  # CoinGame.c:34:6
	cmpq	%rcx, %rbx
	jne	.LBB0_4
.Ltmp10:
.LBB0_5:                                # %if.end15
	.loc	1 55 2                  # CoinGame.c:55:2
	popq	%rbx
	retq
.Ltmp11:
.Lfunc_end0:
	.size	init, .Lfunc_end0-init
	.cfi_endproc

	.globl	getBobSum
	.p2align	4, 0x90
	.type	getBobSum,@function
getBobSum:                              # @getBobSum
.Lfunc_begin1:
	.loc	1 59 0                  # CoinGame.c:59:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp12:
	.cfi_def_cfa_offset 16
.Ltmp13:
	.cfi_offset %rbx, -16
	#DEBUG_VALUE: getBobSum:sum_alice <- %RDI
	#DEBUG_VALUE: getBobSum:coins <- %RSI
	#DEBUG_VALUE: getBobSum:coins_size <- %RDX
	#DEBUG_VALUE: getBobSum:coins_has_ownership [bit_piece offset=0 size=1] <- %ECX
.Ltmp14:
	#DEBUG_VALUE: getBobSum:coins_has_ownership [bit_piece offset=0 size=1] <- %CL
	#DEBUG_VALUE: getBobSum:n <- %R8
	#DEBUG_VALUE: getBobSum:_3 <- 0
	#DEBUG_VALUE: getBobSum:i <- 0
	#DEBUG_VALUE: getBobSum:sum <- 0
	#DEBUG_VALUE: getBobSum:_6 <- 0
	#DEBUG_VALUE: getBobSum:_7 <- 0
	#DEBUG_VALUE: getBobSum:_8 <- 0
	#DEBUG_VALUE: getBobSum:_9 <- 0
	#DEBUG_VALUE: getBobSum:_10 <- 0
	#DEBUG_VALUE: getBobSum:_11 <- 0
	#DEBUG_VALUE: getBobSum:_12 <- 0
	xorl	%ebx, %ebx
.Ltmp15:
	.loc	1 81 6 prologue_end     # CoinGame.c:81:6
	testq	%r8, %r8
	jle	.LBB1_6
.Ltmp16:
# BB#1:                                 # %if.end.preheader
	#DEBUG_VALUE: getBobSum:n <- %R8
	#DEBUG_VALUE: getBobSum:coins_has_ownership [bit_piece offset=0 size=1] <- %CL
	#DEBUG_VALUE: getBobSum:coins_size <- %RDX
	#DEBUG_VALUE: getBobSum:coins <- %RSI
	#DEBUG_VALUE: getBobSum:sum_alice <- %RDI
	.loc	1 83 6                  # CoinGame.c:83:6
	leaq	-1(%r8), %r9
	xorl	%eax, %eax
	movq	%r8, %rdx
.Ltmp17:
	xorl	%ebx, %ebx
	andq	$7, %rdx
	je	.LBB1_3
.Ltmp18:
	.p2align	4, 0x90
.LBB1_2:                                # %if.end.prol
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 85 9                  # CoinGame.c:85:9
	addq	(%rsi,%rax,8), %rbx
.Ltmp19:
	#DEBUG_VALUE: getBobSum:_10 <- 1
	#DEBUG_VALUE: getBobSum:_9 <- %RBX
	#DEBUG_VALUE: getBobSum:sum <- %RBX
	.loc	1 91 8                  # CoinGame.c:91:8
	incq	%rax
.Ltmp20:
	#DEBUG_VALUE: getBobSum:_11 <- %RAX
	#DEBUG_VALUE: getBobSum:i <- %RAX
	.loc	1 81 6                  # CoinGame.c:81:6
	cmpq	%rax, %rdx
	jne	.LBB1_2
.Ltmp21:
.LBB1_3:                                # %if.end.preheader.split
	.loc	1 83 6                  # CoinGame.c:83:6
	cmpq	$7, %r9
	jb	.LBB1_6
# BB#4:                                 # %if.end.preheader.split.split
	subq	%rax, %r8
	leaq	56(%rsi,%rax,8), %rax
	.p2align	4, 0x90
.LBB1_5:                                # %if.end
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 85 9                  # CoinGame.c:85:9
	addq	-56(%rax), %rbx
	#DEBUG_VALUE: getBobSum:_10 <- 1
.Ltmp22:
	#DEBUG_VALUE: getBobSum:_9 <- %RBX
	#DEBUG_VALUE: getBobSum:sum <- %RBX
	addq	-48(%rax), %rbx
.Ltmp23:
	addq	-40(%rax), %rbx
	addq	-32(%rax), %rbx
	addq	-24(%rax), %rbx
	addq	-16(%rax), %rbx
	addq	-8(%rax), %rbx
	addq	(%rax), %rbx
	.loc	1 81 6                  # CoinGame.c:81:6
	addq	$64, %rax
	addq	$-8, %r8
	jne	.LBB1_5
.Ltmp24:
.LBB1_6:                                # %blklab2
	.loc	1 100 9                 # CoinGame.c:100:9
	subq	%rdi, %rbx
.Ltmp25:
	#DEBUG_VALUE: getBobSum:_12 <- %RBX
	.loc	1 102 2                 # CoinGame.c:102:2
	testb	%cl, %cl
	je	.LBB1_8
.Ltmp26:
# BB#7:                                 # %if.then2
	#DEBUG_VALUE: getBobSum:_12 <- %RBX
	.loc	1 102 2 is_stmt 0 discriminator 1 # CoinGame.c:102:2
	movq	%rsi, %rdi
	callq	free
.Ltmp27:
	#DEBUG_VALUE: getBobSum:coins_has_ownership <- 0
.LBB1_8:                                # %if.end3
	#DEBUG_VALUE: getBobSum:_12 <- %RBX
	.loc	1 103 2 is_stmt 1       # CoinGame.c:103:2
	movq	%rbx, %rax
	popq	%rbx
.Ltmp28:
	retq
.Ltmp29:
.Lfunc_end1:
	.size	getBobSum, .Lfunc_end1-getBobSum
	.cfi_endproc

	.globl	findMoves
	.p2align	4, 0x90
	.type	findMoves,@function
findMoves:                              # @findMoves
.Lfunc_begin2:
	.loc	1 107 0                 # CoinGame.c:107:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp30:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp31:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp32:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp33:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp34:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp35:
	.cfi_def_cfa_offset 56
	subq	$88, %rsp
.Ltmp36:
	.cfi_def_cfa_offset 144
.Ltmp37:
	.cfi_offset %rbx, -56
.Ltmp38:
	.cfi_offset %r12, -48
.Ltmp39:
	.cfi_offset %r13, -40
.Ltmp40:
	.cfi_offset %r14, -32
.Ltmp41:
	.cfi_offset %r15, -24
.Ltmp42:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: findMoves:coins <- %RDI
	#DEBUG_VALUE: findMoves:coins_size <- %RSI
	#DEBUG_VALUE: findMoves:coins_has_ownership [bit_piece offset=0 size=1] <- %EDX
	#DEBUG_VALUE: findMoves:n <- %RCX
	movq	%rcx, %r15
.Ltmp43:
	#DEBUG_VALUE: findMoves:n <- %R15
	movl	%edx, 20(%rsp)          # 4-byte Spill
.Ltmp44:
	#DEBUG_VALUE: findMoves:coins_has_ownership [bit_piece offset=0 size=1] <-  [complex expression]
	movq	%rdi, %r12
.Ltmp45:
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
	#DEBUG_VALUE: findMoves:_14 <- 0
	#DEBUG_VALUE: findMoves:_13 <- 0
	#DEBUG_VALUE: findMoves:_12_has_ownership <- 0
	#DEBUG_VALUE: findMoves:_12_size <- 0
	#DEBUG_VALUE: findMoves:_11 <- 0
	#DEBUG_VALUE: findMoves:_10 <- 0
	#DEBUG_VALUE: findMoves:z <- 0
	#DEBUG_VALUE: findMoves:x <- 0
	#DEBUG_VALUE: findMoves:y <- 0
	#DEBUG_VALUE: findMoves:i <- 0
	#DEBUG_VALUE: findMoves:j <- 0
	#DEBUG_VALUE: findMoves:s <- 0
	#DEBUG_VALUE: findMoves:moves_has_ownership <- 0
	#DEBUG_VALUE: findMoves:moves_size <- 0
	#DEBUG_VALUE: findMoves:_2_has_ownership <- 0
	#DEBUG_VALUE: findMoves:_2_size <- 0
	#DEBUG_VALUE: findMoves:coins <- %R12
	.loc	1 175 7 prologue_end    # CoinGame.c:175:7
	movq	%r15, %rbx
	imulq	%rbx, %rbx
.Ltmp46:
	#DEBUG_VALUE: findMoves:_12_size <- %RBX
	#DEBUG_VALUE: findMoves:_11 <- %RBX
	#DEBUG_VALUE: findMoves:moves_size <- %RBX
	.loc	1 178 2                 # CoinGame.c:178:2
	xorl	%edi, %edi
	movl	%ebx, %esi
.Ltmp47:
	callq	gen1DArray
.Ltmp48:
	movq	%rax, 8(%rsp)           # 8-byte Spill
.Ltmp49:
	#DEBUG_VALUE: findMoves:moves <- [%RSP+8]
	#DEBUG_VALUE: findMoves:_12 <- [%RSP+8]
	#DEBUG_VALUE: findMoves:moves_has_ownership <- 1
	.loc	1 192 6                 # CoinGame.c:192:6
	testq	%r15, %r15
	jle	.LBB2_15
.Ltmp50:
# BB#1:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:_12 <- [%RSP+8]
	#DEBUG_VALUE: findMoves:moves <- [%RSP+8]
	#DEBUG_VALUE: findMoves:moves_size <- %RBX
	#DEBUG_VALUE: findMoves:_11 <- %RBX
	#DEBUG_VALUE: findMoves:_12_size <- %RBX
	#DEBUG_VALUE: findMoves:coins <- %R12
	#DEBUG_VALUE: findMoves:n <- %R15
	leaq	(%r12,%r15,8), %rcx
	leaq	-1(%r15), %rax
	xorl	%edx, %edx
	cmpq	$1, %r15
	cmovleq	%rax, %rdx
	movq	%rdx, %rsi
	imulq	%r15, %rsi
	addq	%rdx, %rsi
	movq	8(%rsp), %rdi           # 8-byte Reload
	leaq	(%rdi,%rsi,8), %rdx
	cmpq	%rdx, %rcx
	setbe	%cl
	leaq	(%rdi,%rbx,8), %rdx
	cmpq	%r12, %rdx
	setbe	%dl
	movabsq	$1152921504606846976, %rsi # imm = 0x1000000000000000
	cmpq	%rsi, %r15
	jg	.LBB2_3
.Ltmp51:
# BB#2:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:n <- %R15
	#DEBUG_VALUE: findMoves:coins <- %R12
	#DEBUG_VALUE: findMoves:_12_size <- %RBX
	#DEBUG_VALUE: findMoves:_11 <- %RBX
	#DEBUG_VALUE: findMoves:moves_size <- %RBX
	#DEBUG_VALUE: findMoves:moves <- [%RSP+8]
	#DEBUG_VALUE: findMoves:_12 <- [%RSP+8]
	orb	%dl, %cl
	je	.LBB2_3
.Ltmp52:
# BB#18:                                # %polly.loop_preheader
	#DEBUG_VALUE: findMoves:_12 <- [%RSP+8]
	#DEBUG_VALUE: findMoves:moves <- [%RSP+8]
	#DEBUG_VALUE: findMoves:moves_size <- %RBX
	#DEBUG_VALUE: findMoves:_11 <- %RBX
	#DEBUG_VALUE: findMoves:_12_size <- %RBX
	#DEBUG_VALUE: findMoves:coins <- %R12
	#DEBUG_VALUE: findMoves:n <- %R15
	movq	8(%rsp), %rcx           # 8-byte Reload
	leaq	(%rcx,%rax,8), %rax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	leaq	8(,%r15,8), %r13
	movq	%r15, %rax
	shlq	$4, %rax
	addq	%rcx, %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	leaq	-16(%rcx), %rax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	xorl	%r10d, %r10d
.Ltmp53:
	.p2align	4, 0x90
.LBB2_19:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_21 Depth 2
                                        #     Child Loop BB2_28 Depth 2
	movq	%r15, %r11
	subq	%r10, %r11
	jle	.LBB2_20
# BB#27:                                # %polly.loop_preheader210
                                        #   in Loop: Header=BB2_19 Depth=1
	movq	80(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%r10,8), %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	72(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%r10,8), %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	64(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%r10,8), %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	leaq	(%r12,%r10,8), %rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	8(%rsp), %rax           # 8-byte Reload
	leaq	(%rax,%r10,8), %rax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	leaq	(%r10,%r15), %r14
	decq	%r11
	cmpq	$3, %r15
	movl	$0, %r8d
	movl	$0, %r9d
	jl	.LBB2_21
	.p2align	4, 0x90
.LBB2_28:                               # %polly.loop_header209.us
                                        #   Parent Loop BB2_19 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	2(%r9), %rax
	leaq	(%r9,%r10), %rsi
	cmpq	%r15, %rax
	jg	.LBB2_30
# BB#29:                                # %polly.loop_header209.us
                                        #   in Loop: Header=BB2_28 Depth=2
	testq	%rsi, %rsi
	jle	.LBB2_30
# BB#33:                                # %polly.cond220.thread.us
                                        #   in Loop: Header=BB2_28 Depth=2
	movq	%r9, %rax
	imulq	%r13, %rax
	movq	56(%rsp), %rcx          # 8-byte Reload
	movq	(%rcx,%rax), %rax
	testq	%r9, %r9
	sete	%r8b
	leaq	1(%r9), %rbp
	jmp	.LBB2_34
	.p2align	4, 0x90
.LBB2_30:                               # %polly.cond220.us
                                        #   in Loop: Header=BB2_28 Depth=2
	testq	%r9, %r9
	sete	%r8b
	leaq	1(%r9), %rbp
	cmpq	%r15, %rbp
	je	.LBB2_31
# BB#32:                                # %polly.cond220.us
                                        #   in Loop: Header=BB2_28 Depth=2
	testq	%r9, %r9
	movl	$0, %eax
	jne	.LBB2_42
	jmp	.LBB2_34
.LBB2_31:                               #   in Loop: Header=BB2_28 Depth=2
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB2_34:                               # %polly.cond224.us
                                        #   in Loop: Header=BB2_28 Depth=2
	testq	%rsi, %rsi
	setg	%cl
	leaq	3(%r9), %rdx
	cmpq	%r15, %rdx
	setle	%dl
	testb	%cl, %dl
	jne	.LBB2_36
# BB#35:                                # %polly.cond224.us
                                        #   in Loop: Header=BB2_28 Depth=2
	movq	%r9, %rcx
	orq	%r10, %rcx
	movl	$0, %ecx
	jne	.LBB2_37
.LBB2_36:                               # %polly.stmt.if.end30.us
                                        #   in Loop: Header=BB2_28 Depth=2
	movq	%r9, %rcx
	imulq	%r13, %rcx
	movq	32(%rsp), %rdx          # 8-byte Reload
	movq	(%rdx,%rcx), %rcx
.LBB2_37:                               # %polly.cond234.us
                                        #   in Loop: Header=BB2_28 Depth=2
	cmpq	$2, %rsi
	movl	$0, %edi
	jl	.LBB2_39
# BB#38:                                # %polly.stmt.if.end39.us
                                        #   in Loop: Header=BB2_28 Depth=2
	movq	%r9, %rdx
	imulq	%r13, %rdx
	movq	24(%rsp), %rdi          # 8-byte Reload
	movq	(%rdi,%rdx), %rdi
.LBB2_39:                               # %polly.cond244.us
                                        #   in Loop: Header=BB2_28 Depth=2
	testq	%rsi, %rsi
	setg	%dl
	cmpq	$2, %r14
	setg	%bl
	cmpq	$2, %r15
	je	.LBB2_41
# BB#40:                                # %polly.cond244.us
                                        #   in Loop: Header=BB2_28 Depth=2
	andb	%dl, %bl
	orb	%r8b, %bl
	je	.LBB2_42
.LBB2_41:                               # %polly.stmt.blklab10.us
                                        #   in Loop: Header=BB2_28 Depth=2
.Ltmp54:
	.loc	1 290 8                 # CoinGame.c:290:8
	cmpq	%rax, %rcx
.Ltmp55:
	.loc	1 290 7 is_stmt 0       # CoinGame.c:290:7
	cmovgq	%rax, %rcx
.Ltmp56:
	.loc	1 296 8 is_stmt 1       # CoinGame.c:296:8
	cmpq	%rax, %rdi
.Ltmp57:
	.loc	1 296 7 is_stmt 0       # CoinGame.c:296:7
	cmovgq	%rax, %rdi
	.loc	1 304 11 is_stmt 1      # CoinGame.c:304:11
	addq	(%r12,%r9,8), %rcx
	.loc	1 308 11                # CoinGame.c:308:11
	movq	48(%rsp), %rax          # 8-byte Reload
	addq	(%rax,%r9,8), %rdi
.Ltmp58:
	.loc	1 310 10                # CoinGame.c:310:10
	cmpq	%rdi, %rcx
.Ltmp59:
	.loc	1 322 4                 # CoinGame.c:322:4
	cmovgeq	%rcx, %rdi
	movq	%r9, %rax
	imulq	%r13, %rax
	movq	40(%rsp), %rcx          # 8-byte Reload
	movq	%rdi, (%rcx,%rax)
.LBB2_42:                               # %polly.merge221.us
                                        #   in Loop: Header=BB2_28 Depth=2
	cmpq	%r11, %r9
	movq	%rbp, %r9
	jl	.LBB2_28
	jmp	.LBB2_20
	.p2align	4, 0x90
.LBB2_21:                               # %polly.loop_header209
                                        #   Parent Loop BB2_19 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	2(%r8), %rax
	leaq	(%r8,%r10), %rsi
	cmpq	%r15, %rax
	jg	.LBB2_23
# BB#22:                                # %polly.loop_header209
                                        #   in Loop: Header=BB2_21 Depth=2
	testq	%rsi, %rsi
	jle	.LBB2_23
# BB#43:                                # %polly.cond220.thread
                                        #   in Loop: Header=BB2_21 Depth=2
	movq	%r8, %rax
	imulq	%r13, %rax
	movq	56(%rsp), %rcx          # 8-byte Reload
	movq	(%rcx,%rax), %rax
	testq	%r8, %r8
	sete	%r9b
	leaq	1(%r8), %rbp
	jmp	.LBB2_44
	.p2align	4, 0x90
.LBB2_23:                               # %polly.cond220
                                        #   in Loop: Header=BB2_21 Depth=2
	testq	%r8, %r8
	sete	%r9b
	leaq	1(%r8), %rbp
	cmpq	%r15, %rbp
	je	.LBB2_24
# BB#25:                                # %polly.cond220
                                        #   in Loop: Header=BB2_21 Depth=2
	testq	%r8, %r8
	movl	$0, %eax
	jne	.LBB2_26
	jmp	.LBB2_44
.LBB2_24:                               #   in Loop: Header=BB2_21 Depth=2
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB2_44:                               # %polly.cond224
                                        #   in Loop: Header=BB2_21 Depth=2
	leaq	3(%r8), %rcx
	cmpq	%r15, %rcx
	jg	.LBB2_45
# BB#46:                                # %polly.cond224
                                        #   in Loop: Header=BB2_21 Depth=2
	testq	%rsi, %rsi
	movl	$0, %ecx
	jle	.LBB2_47
# BB#51:                                # %polly.stmt.if.end30
                                        #   in Loop: Header=BB2_21 Depth=2
	movq	%r8, %rcx
	imulq	%r13, %rcx
	movq	32(%rsp), %rdx          # 8-byte Reload
	movq	(%rdx,%rcx), %rcx
	jmp	.LBB2_47
.LBB2_45:                               #   in Loop: Header=BB2_21 Depth=2
	xorl	%ecx, %ecx
.LBB2_47:                               # %polly.cond234
                                        #   in Loop: Header=BB2_21 Depth=2
	cmpq	$1, %rsi
	movl	$0, %edi
	jle	.LBB2_48
# BB#52:                                # %polly.stmt.if.end39
                                        #   in Loop: Header=BB2_21 Depth=2
	movq	%r8, %rdx
	imulq	%r13, %rdx
	movq	24(%rsp), %rdi          # 8-byte Reload
	movq	(%rdi,%rdx), %rdi
.LBB2_48:                               # %polly.cond244
                                        #   in Loop: Header=BB2_21 Depth=2
	cmpq	$2, %r14
	setg	%bl
	testq	%rsi, %rsi
	setg	%dl
	cmpq	$2, %r15
	je	.LBB2_50
# BB#49:                                # %polly.cond244
                                        #   in Loop: Header=BB2_21 Depth=2
	andb	%dl, %bl
	orb	%r9b, %bl
	je	.LBB2_26
.LBB2_50:                               # %polly.stmt.blklab10
                                        #   in Loop: Header=BB2_21 Depth=2
.Ltmp60:
	.loc	1 290 8                 # CoinGame.c:290:8
	cmpq	%rax, %rcx
.Ltmp61:
	.loc	1 290 7 is_stmt 0       # CoinGame.c:290:7
	cmovgq	%rax, %rcx
.Ltmp62:
	.loc	1 296 8 is_stmt 1       # CoinGame.c:296:8
	cmpq	%rax, %rdi
.Ltmp63:
	.loc	1 296 7 is_stmt 0       # CoinGame.c:296:7
	cmovgq	%rax, %rdi
	.loc	1 304 11 is_stmt 1      # CoinGame.c:304:11
	addq	(%r12,%r8,8), %rcx
	.loc	1 308 11                # CoinGame.c:308:11
	movq	48(%rsp), %rax          # 8-byte Reload
	addq	(%rax,%r8,8), %rdi
.Ltmp64:
	.loc	1 310 10                # CoinGame.c:310:10
	cmpq	%rdi, %rcx
.Ltmp65:
	.loc	1 322 4                 # CoinGame.c:322:4
	cmovgeq	%rcx, %rdi
	movq	%r8, %rax
	imulq	%r13, %rax
	movq	40(%rsp), %rcx          # 8-byte Reload
	movq	%rdi, (%rcx,%rax)
.LBB2_26:                               # %polly.merge221
                                        #   in Loop: Header=BB2_21 Depth=2
	cmpq	%r11, %r8
	movq	%rbp, %r8
	jl	.LBB2_21
.LBB2_20:                               # %polly.loop_exit211
                                        #   in Loop: Header=BB2_19 Depth=1
	incq	%r10
	cmpq	%r15, %r10
	jne	.LBB2_19
	jmp	.LBB2_15
.LBB2_3:                                # %while.cond8.preheader.preheader
.Ltmp66:
	#DEBUG_VALUE: findMoves:n <- %R15
	#DEBUG_VALUE: findMoves:coins <- %R12
	#DEBUG_VALUE: findMoves:_12_size <- %RBX
	#DEBUG_VALUE: findMoves:_11 <- %RBX
	#DEBUG_VALUE: findMoves:moves_size <- %RBX
	#DEBUG_VALUE: findMoves:moves <- [%RSP+8]
	#DEBUG_VALUE: findMoves:_12 <- [%RSP+8]
	.loc	1 202 7                 # CoinGame.c:202:7
	leaq	8(,%r15,8), %r11
	movq	%r15, %r9
	shlq	$4, %r9
	movq	%r15, %r8
	negq	%r8
	leaq	-8(,%r15,8), %r10
	xorl	%edi, %edi
.Ltmp67:
	.p2align	4, 0x90
.LBB2_4:                                # %while.cond8.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_5 Depth 2
	leaq	(%r8,%rdi), %r14
	xorl	%ecx, %ecx
	movq	8(%rsp), %rsi           # 8-byte Reload
	movl	$2, %ebx
.Ltmp68:
	.p2align	4, 0x90
.LBB2_5:                                # %if.end13
                                        #   Parent Loop BB2_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 124 12                # CoinGame.c:124:12
	leaq	-2(%rdi,%rbx), %rbp
.Ltmp69:
	#DEBUG_VALUE: findMoves:_16 <- 1
	#DEBUG_VALUE: findMoves:_15 <- 0
	#DEBUG_VALUE: findMoves:y <- 0
	.loc	1 220 10                # CoinGame.c:220:10
	testq	%rbp, %rbp
	#DEBUG_VALUE: findMoves:_20 <- 0
.Ltmp70:
	#DEBUG_VALUE: findMoves:_18 <- 1
	jle	.LBB2_6
.Ltmp71:
# BB#7:                                 # %if.end13
                                        #   in Loop: Header=BB2_5 Depth=2
	.loc	1 212 10                # CoinGame.c:212:10
	leaq	-1(%rbx), %rax
	cmpq	%r15, %rax
	movl	$0, %eax
	jge	.LBB2_9
.Ltmp72:
# BB#8:                                 # %if.end21
                                        #   in Loop: Header=BB2_5 Depth=2
	#DEBUG_VALUE: findMoves:_21 <- 1
	#DEBUG_VALUE: findMoves:_25 <- 1
	.loc	1 234 8                 # CoinGame.c:234:8
	leaq	(%rsi,%r10), %rax
	movq	(%rax,%rdi,8), %rax
.Ltmp73:
	#DEBUG_VALUE: findMoves:_27 <- %RAX
	#DEBUG_VALUE: findMoves:y <- %RAX
	jmp	.LBB2_9
.Ltmp74:
	.p2align	4, 0x90
.LBB2_6:                                #   in Loop: Header=BB2_5 Depth=2
	xorl	%eax, %eax
.LBB2_9:                                # %blklab8
                                        #   in Loop: Header=BB2_5 Depth=2
	#DEBUG_VALUE: findMoves:x <- 0
	#DEBUG_VALUE: findMoves:_28 <- 0
.Ltmp75:
	#DEBUG_VALUE: findMoves:_29 <- 2
	.loc	1 248 7                 # CoinGame.c:248:7
	cmpq	%r15, %rbx
	movl	$0, %edx
	jge	.LBB2_11
# BB#10:                                # %if.end30
                                        #   in Loop: Header=BB2_5 Depth=2
.Ltmp76:
	#DEBUG_VALUE: findMoves:_31 <- 2
	.loc	1 258 8                 # CoinGame.c:258:8
	leaq	(%rsi,%r9), %rdx
	movq	(%rdx,%rdi,8), %rdx
.Ltmp77:
	#DEBUG_VALUE: findMoves:_35 <- %RDX
	#DEBUG_VALUE: findMoves:x <- %RDX
.LBB2_11:                               # %blklab9
                                        #   in Loop: Header=BB2_5 Depth=2
	#DEBUG_VALUE: findMoves:z <- 0
	#DEBUG_VALUE: findMoves:_36 <- 0
	#DEBUG_VALUE: findMoves:_37 <- 1
	#DEBUG_VALUE: findMoves:_39 <- 0
	.loc	1 274 10                # CoinGame.c:274:10
	cmpq	$2, %rbp
	movl	$0, %ebp
	jl	.LBB2_13
.Ltmp78:
# BB#12:                                # %if.end39
                                        #   in Loop: Header=BB2_5 Depth=2
	#DEBUG_VALUE: findMoves:_42 <- 2
	.loc	1 284 8                 # CoinGame.c:284:8
	movq	-16(%rsi,%rdi,8), %rbp
.Ltmp79:
	#DEBUG_VALUE: findMoves:_44 <- %RBP
	#DEBUG_VALUE: findMoves:z <- %RBP
.LBB2_13:                               # %blklab10
                                        #   in Loop: Header=BB2_5 Depth=2
	#DEBUG_VALUE: findMoves:x <- %RAX
	.loc	1 290 8                 # CoinGame.c:290:8
	cmpq	%rax, %rdx
.Ltmp80:
	.loc	1 290 7 is_stmt 0       # CoinGame.c:290:7
	cmovgq	%rax, %rdx
.Ltmp81:
	.loc	1 296 8 is_stmt 1       # CoinGame.c:296:8
	cmpq	%rax, %rbp
.Ltmp82:
	.loc	1 296 7 is_stmt 0       # CoinGame.c:296:7
	cmovgq	%rax, %rbp
	.loc	1 304 11 is_stmt 1      # CoinGame.c:304:11
	addq	-16(%r12,%rbx,8), %rdx
.Ltmp83:
	#DEBUG_VALUE: findMoves:_46 <- %RDX
	.loc	1 306 8                 # CoinGame.c:306:8
	leaq	(%r12,%rcx), %rax
.Ltmp84:
	.loc	1 308 11                # CoinGame.c:308:11
	addq	(%rax,%rdi,8), %rbp
.Ltmp85:
	#DEBUG_VALUE: findMoves:_48 <- %RBP
	.loc	1 310 10                # CoinGame.c:310:10
	cmpq	%rbp, %rdx
.Ltmp86:
	.loc	1 322 4                 # CoinGame.c:322:4
	cmovgeq	%rdx, %rbp
.Ltmp87:
	.loc	1 320 15                # CoinGame.c:320:15
	movq	%rbp, (%rsi,%rdi,8)
	.loc	1 202 7                 # CoinGame.c:202:7
	addq	%r11, %rsi
	leaq	1(%r14,%rbx), %rax
.Ltmp88:
	#DEBUG_VALUE: findMoves:_59 <- 1
	#DEBUG_VALUE: findMoves:_57 <- 1
	incq	%rbx
	addq	$8, %rcx
	cmpq	$2, %rax
	jne	.LBB2_5
.Ltmp89:
# BB#14:                                # %blklab6
                                        #   in Loop: Header=BB2_4 Depth=1
	#DEBUG_VALUE: findMoves:_46 <- %RDX
	#DEBUG_VALUE: findMoves:_61 <- 1
	.loc	1 357 8                 # CoinGame.c:357:8
	incq	%rdi
.Ltmp90:
	#DEBUG_VALUE: findMoves:_62 <- %RDI
	#DEBUG_VALUE: findMoves:s <- %RDI
	.loc	1 192 6                 # CoinGame.c:192:6
	cmpq	%r15, %rdi
	jne	.LBB2_4
.Ltmp91:
.LBB2_15:                               # %blklab4
	.loc	1 366 2                 # CoinGame.c:366:2
	movl	20(%rsp), %eax          # 4-byte Reload
	testb	%al, %al
	je	.LBB2_17
# BB#16:                                # %if.then74
.Ltmp92:
	.loc	1 366 2 is_stmt 0 discriminator 1 # CoinGame.c:366:2
	movq	%r12, %rdi
	callq	free
.Ltmp93:
	#DEBUG_VALUE: findMoves:coins_has_ownership <- 0
.LBB2_17:                               # %if.end81
	.loc	1 369 2 is_stmt 1       # CoinGame.c:369:2
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp94:
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
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin3:
	.loc	1 373 0                 # CoinGame.c:373:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp95:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp96:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp97:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp98:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp99:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp100:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Ltmp101:
	.cfi_def_cfa_offset 64
.Ltmp102:
	.cfi_offset %rbx, -56
.Ltmp103:
	.cfi_offset %r12, -48
.Ltmp104:
	.cfi_offset %r13, -40
.Ltmp105:
	.cfi_offset %r14, -32
.Ltmp106:
	.cfi_offset %r15, -24
.Ltmp107:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
	movl	%edi, %ebx
.Ltmp108:
	#DEBUG_VALUE: main:_17_has_ownership <- 0
	#DEBUG_VALUE: main:_17_size <- 0
	#DEBUG_VALUE: main:_14 <- 0
	#DEBUG_VALUE: main:_13 <- 0
	#DEBUG_VALUE: main:_12 <- 0
	#DEBUG_VALUE: main:_11_has_ownership <- 0
	#DEBUG_VALUE: main:_11_size <- 0
	#DEBUG_VALUE: main:_10_has_ownership <- 0
	#DEBUG_VALUE: main:_10_size <- 0
	#DEBUG_VALUE: main:_9_has_ownership <- 0
	#DEBUG_VALUE: main:_9_size <- 0
	#DEBUG_VALUE: main:_8 <- 0
	#DEBUG_VALUE: main:_7_has_ownership <- 0
	#DEBUG_VALUE: main:_7_size_size <- 0
	#DEBUG_VALUE: main:_7_size <- 0
	#DEBUG_VALUE: main:sum_alice <- 0
	#DEBUG_VALUE: main:moves_has_ownership <- 0
	#DEBUG_VALUE: main:moves_size <- 0
	#DEBUG_VALUE: main:coins_has_ownership <- 0
	#DEBUG_VALUE: main:coins_size <- 0
	#DEBUG_VALUE: main:n <- 0
	#DEBUG_VALUE: main:argc <- %EBX
	.loc	1 399 2 prologue_end    # CoinGame.c:399:2
	callq	convertArgsToIntArray
.Ltmp109:
	movq	%rax, %r15
.Ltmp110:
	#DEBUG_VALUE: main:_7 <- %R15
	decl	%ebx
.Ltmp111:
	movslq	%ebx, %r14
.Ltmp112:
	#DEBUG_VALUE: main:_7_has_ownership <- 1
	#DEBUG_VALUE: main:_7_size <- %EBX
	.loc	1 404 5                 # CoinGame.c:404:5
	movq	(%r15), %rdi
.Ltmp113:
	#DEBUG_VALUE: main:_9 <- %RDI
	.loc	1 406 2                 # CoinGame.c:406:2
	callq	parseStringToInt
.Ltmp114:
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_6 <- %RAX
	.loc	1 410 9                 # CoinGame.c:410:9
	testq	%rax, %rax
.Ltmp115:
	.loc	1 410 5 is_stmt 0       # CoinGame.c:410:5
	je	.LBB3_7
.Ltmp116:
# BB#1:                                 # %if.end
	#DEBUG_VALUE: main:_6 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_7_size <- %EBX
	#DEBUG_VALUE: main:_7 <- %R15
	.loc	1 412 6 is_stmt 1       # CoinGame.c:412:6
	movq	(%rax), %rbp
.Ltmp117:
	#DEBUG_VALUE: init:_10 <- 0
	#DEBUG_VALUE: init:_9 <- 0
	#DEBUG_VALUE: init:_8 <- 0
	#DEBUG_VALUE: init:_7 <- 0
	#DEBUG_VALUE: init:_6 <- 0
	#DEBUG_VALUE: init:_5_has_ownership <- 0
	#DEBUG_VALUE: init:_5_size <- %RBP
	#DEBUG_VALUE: init:_4 <- 0
	#DEBUG_VALUE: init:i <- 0
	#DEBUG_VALUE: init:coins_has_ownership <- 0
	#DEBUG_VALUE: init:_1_has_ownership <- 0
	#DEBUG_VALUE: init:_1_size <- 0
	#DEBUG_VALUE: init:n <- %RBP
	#DEBUG_VALUE: init:coins_size <- 0
	#DEBUG_VALUE: main:n <- %RBP
	.loc	1 20 2                  # CoinGame.c:20:2
	xorl	%edi, %edi
	movl	%ebp, %esi
	callq	gen1DArray
.Ltmp118:
	movq	%rax, %rbx
.Ltmp119:
	#DEBUG_VALUE: init:coins <- %RBX
	#DEBUG_VALUE: init:_5 <- %RBX
	#DEBUG_VALUE: main:_10 <- %RBX
	#DEBUG_VALUE: main:coins <- %RBX
	#DEBUG_VALUE: init:coins_has_ownership <- 1
	.loc	1 34 6                  # CoinGame.c:34:6
	testq	%rbp, %rbp
	jle	.LBB3_6
.Ltmp120:
# BB#2:                                 # %if.end7.i.preheader
	#DEBUG_VALUE: main:_7 <- %R15
	#DEBUG_VALUE: main:coins <- %RBX
	#DEBUG_VALUE: main:_10 <- %RBX
	#DEBUG_VALUE: init:_5 <- %RBX
	#DEBUG_VALUE: init:coins <- %RBX
	#DEBUG_VALUE: main:n <- %RBP
	#DEBUG_VALUE: init:n <- %RBP
	#DEBUG_VALUE: init:_5_size <- %RBP
	.loc	1 36 6                  # CoinGame.c:36:6
	leaq	-1(%rbp), %rcx
	xorl	%eax, %eax
	movq	%rbp, %rdx
	andq	$3, %rdx
	je	.LBB3_4
.Ltmp121:
	.p2align	4, 0x90
.LBB3_3:                                # %if.end7.i.prol
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 40 12                 # CoinGame.c:40:12
	addq	%rax, (%rbx,%rax,8)
.Ltmp122:
	#DEBUG_VALUE: init:_9 <- 1
	.loc	1 44 8                  # CoinGame.c:44:8
	incq	%rax
.Ltmp123:
	#DEBUG_VALUE: init:_10 <- %RAX
	#DEBUG_VALUE: init:i <- %RAX
	.loc	1 34 6                  # CoinGame.c:34:6
	cmpq	%rax, %rdx
	jne	.LBB3_3
.Ltmp124:
.LBB3_4:                                # %if.end7.i.preheader.split
	.loc	1 36 6                  # CoinGame.c:36:6
	cmpq	$3, %rcx
	jb	.LBB3_6
	.p2align	4, 0x90
.LBB3_5:                                # %if.end7.i
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 40 12                 # CoinGame.c:40:12
	addq	%rax, (%rbx,%rax,8)
	#DEBUG_VALUE: init:_9 <- 1
	.loc	1 36 6                  # CoinGame.c:36:6
	movq	8(%rbx,%rax,8), %rcx
	.loc	1 40 12                 # CoinGame.c:40:12
	leaq	1(%rax,%rcx), %rcx
	movq	%rcx, 8(%rbx,%rax,8)
	.loc	1 36 6                  # CoinGame.c:36:6
	movq	16(%rbx,%rax,8), %rcx
	.loc	1 40 12                 # CoinGame.c:40:12
	leaq	2(%rax,%rcx), %rcx
	movq	%rcx, 16(%rbx,%rax,8)
	.loc	1 36 6                  # CoinGame.c:36:6
	movq	24(%rbx,%rax,8), %rcx
	.loc	1 40 12                 # CoinGame.c:40:12
	leaq	3(%rax,%rcx), %rcx
	movq	%rcx, 24(%rbx,%rax,8)
	.loc	1 44 8                  # CoinGame.c:44:8
	addq	$4, %rax
	.loc	1 34 6                  # CoinGame.c:34:6
	cmpq	%rax, %rbp
	jne	.LBB3_5
.Ltmp125:
.LBB3_6:                                # %if.then74
	#DEBUG_VALUE: main:coins_size <- 0
	#DEBUG_VALUE: main:coins_has_ownership <- 1
	#DEBUG_VALUE: main:_10_has_ownership <- 0
	#DEBUG_VALUE: main:_11_size <- 0
	.loc	1 426 8                 # CoinGame.c:426:8
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rcx
	callq	findMoves
	movq	%rax, %r13
.Ltmp126:
	#DEBUG_VALUE: main:moves <- %R13
	#DEBUG_VALUE: main:_11 <- %R13
	#DEBUG_VALUE: main:_12 <- 1
	#DEBUG_VALUE: main:_11_has_ownership <- 0
	#DEBUG_VALUE: main:moves_has_ownership <- 1
	#DEBUG_VALUE: main:moves_size <- 0
	.loc	1 438 6                 # CoinGame.c:438:6
	movq	-8(%r13,%rbp,8), %rbp
.Ltmp127:
	#DEBUG_VALUE: main:_17_size <- 50
	#DEBUG_VALUE: main:_14 <- %RBP
	#DEBUG_VALUE: main:sum_alice <- %RBP
	.loc	1 445 2                 # CoinGame.c:445:2
	movl	$400, %edi              # imm = 0x190
	callq	malloc
	movq	%rax, %r12
.Ltmp128:
	#DEBUG_VALUE: main:_17 <- %R12
	.loc	1 446 9                 # CoinGame.c:446:9
	movaps	.LCPI3_0(%rip), %xmm0   # xmm0 = [84,104]
	movups	%xmm0, (%r12)
	.loc	1 446 36 is_stmt 0      # CoinGame.c:446:36
	movaps	.LCPI3_1(%rip), %xmm0   # xmm0 = [101,32]
	movups	%xmm0, 16(%r12)
	.loc	1 446 63                # CoinGame.c:446:63
	movaps	.LCPI3_2(%rip), %xmm1   # xmm1 = [116,111]
	movups	%xmm1, 32(%r12)
	.loc	1 446 91                # CoinGame.c:446:91
	movaps	.LCPI3_3(%rip), %xmm1   # xmm1 = [116,97]
	movups	%xmm1, 48(%r12)
	.loc	1 446 118               # CoinGame.c:446:118
	movaps	.LCPI3_4(%rip), %xmm1   # xmm1 = [108,32]
	movups	%xmm1, 64(%r12)
	.loc	1 446 146               # CoinGame.c:446:146
	movaps	.LCPI3_5(%rip), %xmm1   # xmm1 = [97,109]
	movups	%xmm1, 80(%r12)
	.loc	1 446 175               # CoinGame.c:446:175
	movaps	.LCPI3_6(%rip), %xmm1   # xmm1 = [111,117]
	movups	%xmm1, 96(%r12)
	.loc	1 446 205               # CoinGame.c:446:205
	movaps	.LCPI3_7(%rip), %xmm1   # xmm1 = [110,116]
	movups	%xmm1, 112(%r12)
	.loc	1 446 235               # CoinGame.c:446:235
	movaps	.LCPI3_8(%rip), %xmm1   # xmm1 = [32,111]
	movups	%xmm1, 128(%r12)
	.loc	1 446 264               # CoinGame.c:446:264
	movaps	.LCPI3_9(%rip), %xmm1   # xmm1 = [102,32]
	movups	%xmm1, 144(%r12)
	.loc	1 446 293               # CoinGame.c:446:293
	movaps	.LCPI3_10(%rip), %xmm1  # xmm1 = [109,111]
	movups	%xmm1, 160(%r12)
	.loc	1 446 323               # CoinGame.c:446:323
	movaps	.LCPI3_11(%rip), %xmm1  # xmm1 = [110,101]
	movups	%xmm1, 176(%r12)
	.loc	1 446 353               # CoinGame.c:446:353
	movaps	.LCPI3_12(%rip), %xmm1  # xmm1 = [121,32]
	movups	%xmm1, 192(%r12)
	.loc	1 446 382               # CoinGame.c:446:382
	movaps	.LCPI3_13(%rip), %xmm1  # xmm1 = [40,109]
	movups	%xmm1, 208(%r12)
	.loc	1 446 411               # CoinGame.c:446:411
	movaps	.LCPI3_14(%rip), %xmm1  # xmm1 = [97,120]
	movups	%xmm1, 224(%r12)
	.loc	1 446 440               # CoinGame.c:446:440
	movaps	.LCPI3_15(%rip), %xmm1  # xmm1 = [105,109]
	movups	%xmm1, 240(%r12)
	.loc	1 446 470               # CoinGame.c:446:470
	movaps	.LCPI3_16(%rip), %xmm1  # xmm1 = [117,109]
	movups	%xmm1, 256(%r12)
	.loc	1 446 500               # CoinGame.c:446:500
	movaps	.LCPI3_17(%rip), %xmm1  # xmm1 = [41,32]
	movups	%xmm1, 272(%r12)
	.loc	1 446 528               # CoinGame.c:446:528
	movaps	.LCPI3_18(%rip), %xmm1  # xmm1 = [65,108]
	movups	%xmm1, 288(%r12)
	.loc	1 446 557               # CoinGame.c:446:557
	movaps	.LCPI3_19(%rip), %xmm1  # xmm1 = [105,99]
	movups	%xmm1, 304(%r12)
	.loc	1 446 586               # CoinGame.c:446:586
	movups	%xmm0, 320(%r12)
	.loc	1 446 615               # CoinGame.c:446:615
	movaps	.LCPI3_20(%rip), %xmm0  # xmm0 = [103,101]
	movups	%xmm0, 336(%r12)
	.loc	1 446 645               # CoinGame.c:446:645
	movaps	.LCPI3_21(%rip), %xmm0  # xmm0 = [116,115]
	movups	%xmm0, 352(%r12)
	.loc	1 446 675               # CoinGame.c:446:675
	movaps	.LCPI3_22(%rip), %xmm0  # xmm0 = [32,105]
	movups	%xmm0, 368(%r12)
	.loc	1 446 704               # CoinGame.c:446:704
	movaps	.LCPI3_23(%rip), %xmm0  # xmm0 = [115,32]
	movups	%xmm0, 384(%r12)
.Ltmp129:
	#DEBUG_VALUE: main:_17_has_ownership <- 1
	.loc	1 449 2 is_stmt 1       # CoinGame.c:449:2
	movl	$50, %esi
	movq	%r12, %rdi
	callq	printf_s
	.loc	1 453 2                 # CoinGame.c:453:2
	movl	$.L.str, %edi
	xorl	%eax, %eax
	movq	%rbp, %rsi
	callq	printf
.Ltmp130:
	.loc	1 457 2 discriminator 1 # CoinGame.c:457:2
	movq	%rbx, %rdi
	callq	free
.Ltmp131:
	#DEBUG_VALUE: main:coins_has_ownership <- 0
	.loc	1 458 2 discriminator 1 # CoinGame.c:458:2
	movq	%r13, %rdi
	callq	free
.Ltmp132:
	#DEBUG_VALUE: main:moves_has_ownership <- 0
	.loc	1 459 2 discriminator 1 # CoinGame.c:459:2
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	free2DArray
.Ltmp133:
	#DEBUG_VALUE: main:_7_has_ownership <- 0
	.loc	1 463 2 discriminator 1 # CoinGame.c:463:2
	movq	%r12, %rdi
	callq	free
.Ltmp134:
	#DEBUG_VALUE: main:_17_has_ownership <- 0
	.loc	1 464 2                 # CoinGame.c:464:2
	xorl	%edi, %edi
	callq	exit
.Ltmp135:
.LBB3_7:                                # %if.end93.critedge
	#DEBUG_VALUE: main:_6 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_7_size <- %EBX
	#DEBUG_VALUE: main:_7 <- %R15
	.loc	1 459 2 discriminator 1 # CoinGame.c:459:2
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	free2DArray
.Ltmp136:
	#DEBUG_VALUE: main:_7_has_ownership <- 0
	.loc	1 464 2                 # CoinGame.c:464:2
	xorl	%edi, %edi
	callq	exit
.Ltmp137:
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
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)" # string offset=0
.Linfo_string1:
	.asciz	"CoinGame.c"            # string offset=165
.Linfo_string2:
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/autogenerate" # string offset=176
.Linfo_string3:
	.asciz	"init"                  # string offset=242
.Linfo_string4:
	.asciz	"long long int"         # string offset=247
.Linfo_string5:
	.asciz	"n"                     # string offset=261
.Linfo_string6:
	.asciz	"_10"                   # string offset=263
.Linfo_string7:
	.asciz	"_9"                    # string offset=267
.Linfo_string8:
	.asciz	"_8"                    # string offset=270
.Linfo_string9:
	.asciz	"_7"                    # string offset=273
.Linfo_string10:
	.asciz	"_6"                    # string offset=276
.Linfo_string11:
	.asciz	"_5_has_ownership"      # string offset=279
.Linfo_string12:
	.asciz	"_Bool"                 # string offset=296
.Linfo_string13:
	.asciz	"_5_size"               # string offset=302
.Linfo_string14:
	.asciz	"_4"                    # string offset=310
.Linfo_string15:
	.asciz	"i"                     # string offset=313
.Linfo_string16:
	.asciz	"coins_has_ownership"   # string offset=315
.Linfo_string17:
	.asciz	"_1_has_ownership"      # string offset=335
.Linfo_string18:
	.asciz	"_1_size"               # string offset=352
.Linfo_string19:
	.asciz	"coins_size"            # string offset=360
.Linfo_string20:
	.asciz	"coins"                 # string offset=371
.Linfo_string21:
	.asciz	"_5"                    # string offset=377
.Linfo_string22:
	.asciz	"_1"                    # string offset=380
.Linfo_string23:
	.asciz	"getBobSum"             # string offset=383
.Linfo_string24:
	.asciz	"findMoves"             # string offset=393
.Linfo_string25:
	.asciz	"main"                  # string offset=403
.Linfo_string26:
	.asciz	"int"                   # string offset=408
.Linfo_string27:
	.asciz	"sum_alice"             # string offset=412
.Linfo_string28:
	.asciz	"_3"                    # string offset=422
.Linfo_string29:
	.asciz	"sum"                   # string offset=425
.Linfo_string30:
	.asciz	"_11"                   # string offset=429
.Linfo_string31:
	.asciz	"_12"                   # string offset=433
.Linfo_string32:
	.asciz	"_62"                   # string offset=437
.Linfo_string33:
	.asciz	"_61"                   # string offset=441
.Linfo_string34:
	.asciz	"_60"                   # string offset=445
.Linfo_string35:
	.asciz	"_59"                   # string offset=449
.Linfo_string36:
	.asciz	"_58"                   # string offset=453
.Linfo_string37:
	.asciz	"_57"                   # string offset=457
.Linfo_string38:
	.asciz	"_56"                   # string offset=461
.Linfo_string39:
	.asciz	"_55"                   # string offset=465
.Linfo_string40:
	.asciz	"_54"                   # string offset=469
.Linfo_string41:
	.asciz	"_53"                   # string offset=473
.Linfo_string42:
	.asciz	"_52"                   # string offset=477
.Linfo_string43:
	.asciz	"_51"                   # string offset=481
.Linfo_string44:
	.asciz	"_50"                   # string offset=485
.Linfo_string45:
	.asciz	"_49"                   # string offset=489
.Linfo_string46:
	.asciz	"_48"                   # string offset=493
.Linfo_string47:
	.asciz	"_47"                   # string offset=497
.Linfo_string48:
	.asciz	"_46"                   # string offset=501
.Linfo_string49:
	.asciz	"_45"                   # string offset=505
.Linfo_string50:
	.asciz	"_44"                   # string offset=509
.Linfo_string51:
	.asciz	"_43"                   # string offset=513
.Linfo_string52:
	.asciz	"_42"                   # string offset=517
.Linfo_string53:
	.asciz	"_41"                   # string offset=521
.Linfo_string54:
	.asciz	"_40"                   # string offset=525
.Linfo_string55:
	.asciz	"_39"                   # string offset=529
.Linfo_string56:
	.asciz	"_38"                   # string offset=533
.Linfo_string57:
	.asciz	"_37"                   # string offset=537
.Linfo_string58:
	.asciz	"_36"                   # string offset=541
.Linfo_string59:
	.asciz	"_35"                   # string offset=545
.Linfo_string60:
	.asciz	"_34"                   # string offset=549
.Linfo_string61:
	.asciz	"_33"                   # string offset=553
.Linfo_string62:
	.asciz	"_32"                   # string offset=557
.Linfo_string63:
	.asciz	"_31"                   # string offset=561
.Linfo_string64:
	.asciz	"_30"                   # string offset=565
.Linfo_string65:
	.asciz	"_29"                   # string offset=569
.Linfo_string66:
	.asciz	"_28"                   # string offset=573
.Linfo_string67:
	.asciz	"_27"                   # string offset=577
.Linfo_string68:
	.asciz	"_26"                   # string offset=581
.Linfo_string69:
	.asciz	"_25"                   # string offset=585
.Linfo_string70:
	.asciz	"_24"                   # string offset=589
.Linfo_string71:
	.asciz	"_23"                   # string offset=593
.Linfo_string72:
	.asciz	"_22"                   # string offset=597
.Linfo_string73:
	.asciz	"_21"                   # string offset=601
.Linfo_string74:
	.asciz	"_20"                   # string offset=605
.Linfo_string75:
	.asciz	"_19"                   # string offset=609
.Linfo_string76:
	.asciz	"_18"                   # string offset=613
.Linfo_string77:
	.asciz	"_17"                   # string offset=617
.Linfo_string78:
	.asciz	"_16"                   # string offset=621
.Linfo_string79:
	.asciz	"_15"                   # string offset=625
.Linfo_string80:
	.asciz	"_14"                   # string offset=629
.Linfo_string81:
	.asciz	"_13"                   # string offset=633
.Linfo_string82:
	.asciz	"_12_has_ownership"     # string offset=637
.Linfo_string83:
	.asciz	"_12_size"              # string offset=655
.Linfo_string84:
	.asciz	"z"                     # string offset=664
.Linfo_string85:
	.asciz	"x"                     # string offset=666
.Linfo_string86:
	.asciz	"y"                     # string offset=668
.Linfo_string87:
	.asciz	"j"                     # string offset=670
.Linfo_string88:
	.asciz	"s"                     # string offset=672
.Linfo_string89:
	.asciz	"moves_has_ownership"   # string offset=674
.Linfo_string90:
	.asciz	"moves_size"            # string offset=694
.Linfo_string91:
	.asciz	"_2_has_ownership"      # string offset=705
.Linfo_string92:
	.asciz	"_2_size"               # string offset=722
.Linfo_string93:
	.asciz	"moves"                 # string offset=730
.Linfo_string94:
	.asciz	"_2"                    # string offset=736
.Linfo_string95:
	.asciz	"argc"                  # string offset=739
.Linfo_string96:
	.asciz	"args"                  # string offset=744
.Linfo_string97:
	.asciz	"char"                  # string offset=749
.Linfo_string98:
	.asciz	"_17_has_ownership"     # string offset=754
.Linfo_string99:
	.asciz	"_17_size"              # string offset=772
.Linfo_string100:
	.asciz	"_11_has_ownership"     # string offset=781
.Linfo_string101:
	.asciz	"_11_size"              # string offset=799
.Linfo_string102:
	.asciz	"_10_has_ownership"     # string offset=808
.Linfo_string103:
	.asciz	"_10_size"              # string offset=826
.Linfo_string104:
	.asciz	"_9_has_ownership"      # string offset=835
.Linfo_string105:
	.asciz	"_9_size"               # string offset=852
.Linfo_string106:
	.asciz	"_7_has_ownership"      # string offset=860
.Linfo_string107:
	.asciz	"_7_size_size"          # string offset=877
.Linfo_string108:
	.asciz	"_7_size"               # string offset=890
.Linfo_string109:
	.asciz	"max"                   # string offset=898
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp3-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp3-.Lfunc_begin0
	.quad	.Ltmp6-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Ltmp2-.Lfunc_begin0
	.quad	.Ltmp3-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp3-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc2:
	.quad	.Ltmp2-.Lfunc_begin0
	.quad	.Ltmp3-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp3-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Ltmp3-.Lfunc_begin0
	.quad	.Ltmp8-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp8-.Lfunc_begin0
	.quad	.Ltmp9-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Ltmp3-.Lfunc_begin0
	.quad	.Ltmp7-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp7-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Ltmp3-.Lfunc_begin0
	.quad	.Ltmp8-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp8-.Lfunc_begin0
	.quad	.Ltmp9-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Ltmp3-.Lfunc_begin0
	.quad	.Ltmp4-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp4-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Ltmp4-.Lfunc_begin0
	.quad	.Ltmp6-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Ltmp4-.Lfunc_begin0
	.quad	.Ltmp6-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp18-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp18-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp17-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	82                      # super-register DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp18-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	82                      # super-register DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	1                       # 1
	.quad	.Ltmp27-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp18-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp21-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp19-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp21-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp22-.Lfunc_begin0
	.quad	.Ltmp23-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp19-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp21-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp22-.Lfunc_begin0
	.quad	.Ltmp23-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp19-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp21-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp25-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp25-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	81                      # super-register DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	5                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	20                      # 20
	.byte	157                     # DW_OP_bit_piece
	.byte	1                       # 1
	.byte	0                       # 0
	.quad	.Ltmp93-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc23:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp90-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp90-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp89-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp83-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp78-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc33:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc34:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp76-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc35:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc36:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc37:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp72-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc38:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp72-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc39:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc40:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc41:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc42:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc43:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc44:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc45:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc46:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp90-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp90-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc47:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc48:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc49:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
	.quad	0
	.quad	0
.Ldebug_loc50:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
	.quad	0
	.quad	0
.Ldebug_loc51:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp108-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp108-.Lfunc_begin0
	.quad	.Ltmp111-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc52:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp109-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc53:
	.quad	.Ltmp108-.Lfunc_begin0
	.quad	.Ltmp129-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp129-.Lfunc_begin0
	.quad	.Ltmp134-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp134-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc54:
	.quad	.Ltmp108-.Lfunc_begin0
	.quad	.Ltmp127-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	50                      # 50
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc55:
	.quad	.Ltmp108-.Lfunc_begin0
	.quad	.Ltmp127-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp135-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc56:
	.quad	.Ltmp108-.Lfunc_begin0
	.quad	.Ltmp126-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp126-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc57:
	.quad	.Ltmp108-.Lfunc_begin0
	.quad	.Ltmp112-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp112-.Lfunc_begin0
	.quad	.Ltmp133-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp133-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc58:
	.quad	.Ltmp108-.Lfunc_begin0
	.quad	.Ltmp112-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp112-.Lfunc_begin0
	.quad	.Ltmp119-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp135-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc59:
	.quad	.Ltmp108-.Lfunc_begin0
	.quad	.Ltmp127-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp135-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc60:
	.quad	.Ltmp108-.Lfunc_begin0
	.quad	.Ltmp126-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp126-.Lfunc_begin0
	.quad	.Ltmp132-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp132-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc61:
	.quad	.Ltmp108-.Lfunc_begin0
	.quad	.Ltmp125-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp131-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp131-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc62:
	.quad	.Ltmp108-.Lfunc_begin0
	.quad	.Ltmp117-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp117-.Lfunc_begin0
	.quad	.Ltmp121-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc63:
	.quad	.Ltmp110-.Lfunc_begin0
	.quad	.Ltmp121-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp135-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc64:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp114-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc65:
	.quad	.Ltmp114-.Lfunc_begin0
	.quad	.Ltmp118-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp135-.Lfunc_begin0
	.quad	.Ltmp136-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc66:
	.quad	.Ltmp114-.Lfunc_begin0
	.quad	.Ltmp118-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp135-.Lfunc_begin0
	.quad	.Ltmp136-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc67:
	.quad	.Ltmp117-.Lfunc_begin0
	.quad	.Ltmp123-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp123-.Lfunc_begin0
	.quad	.Ltmp124-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc68:
	.quad	.Ltmp117-.Lfunc_begin0
	.quad	.Ltmp122-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp122-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc69:
	.quad	.Ltmp117-.Lfunc_begin0
	.quad	.Ltmp121-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc70:
	.quad	.Ltmp117-.Lfunc_begin0
	.quad	.Ltmp123-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp123-.Lfunc_begin0
	.quad	.Ltmp124-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc71:
	.quad	.Ltmp117-.Lfunc_begin0
	.quad	.Ltmp119-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp119-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc72:
	.quad	.Ltmp117-.Lfunc_begin0
	.quad	.Ltmp121-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc73:
	.quad	.Ltmp119-.Lfunc_begin0
	.quad	.Ltmp121-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc74:
	.quad	.Ltmp119-.Lfunc_begin0
	.quad	.Ltmp121-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc75:
	.quad	.Ltmp119-.Lfunc_begin0
	.quad	.Ltmp121-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc76:
	.quad	.Ltmp119-.Lfunc_begin0
	.quad	.Ltmp121-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc77:
	.quad	.Ltmp126-.Lfunc_begin0
	.quad	.Ltmp135-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc78:
	.quad	.Ltmp126-.Lfunc_begin0
	.quad	.Ltmp135-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc79:
	.quad	.Ltmp128-.Lfunc_begin0
	.quad	.Ltmp135-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
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
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
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
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	15                      # DW_FORM_udata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	49                      # DW_AT_abstract_origin
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
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
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
	.byte	12                      # Abbreviation Code
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
	.byte	11                      # DW_FORM_data1
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
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	15                      # Abbreviation Code
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
	.byte	16                      # Abbreviation Code
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
	.byte	17                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	18                      # Abbreviation Code
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
	.byte	19                      # Abbreviation Code
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
	.byte	20                      # Abbreviation Code
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
	.byte	21                      # Abbreviation Code
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
	.byte	22                      # Abbreviation Code
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
	.byte	23                      # Abbreviation Code
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
	.byte	24                      # Abbreviation Code
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
	.byte	25                      # Abbreviation Code
	.byte	29                      # DW_TAG_inlined_subroutine
	.byte	1                       # DW_CHILDREN_yes
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	88                      # DW_AT_call_file
	.byte	11                      # DW_FORM_data1
	.byte	89                      # DW_AT_call_line
	.byte	5                       # DW_FORM_data2
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	2316                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x905 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x1 DW_TAG_pointer_type
	.byte	3                       # Abbrev [3] 0x2b:0x94 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	1400                    # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x3e:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	1412                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x47:0x9 DW_TAG_variable
	.long	.Ldebug_loc1            # DW_AT_location
	.long	1489                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x50:0x9 DW_TAG_variable
	.long	.Ldebug_loc2            # DW_AT_location
	.long	1555                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x59:0x9 DW_TAG_variable
	.long	.Ldebug_loc3            # DW_AT_location
	.long	1423                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x62:0x9 DW_TAG_variable
	.long	.Ldebug_loc4            # DW_AT_location
	.long	1434                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x6b:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1445                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x71:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1456                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x77:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1467                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x7d:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1478                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x83:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1500                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x89:0x9 DW_TAG_variable
	.long	.Ldebug_loc5            # DW_AT_location
	.long	1511                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x92:0x9 DW_TAG_variable
	.long	.Ldebug_loc6            # DW_AT_location
	.long	1522                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x9b:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1533                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xa1:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1544                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0xa7:0x9 DW_TAG_variable
	.long	.Ldebug_loc7            # DW_AT_location
	.long	1566                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0xb0:0x9 DW_TAG_variable
	.long	.Ldebug_loc8            # DW_AT_location
	.long	1577                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0xb9:0x5 DW_TAG_variable
	.long	1588                    # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0xbf:0xef DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1605                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	10                      # Abbrev [10] 0xd8:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc9            # DW_AT_location
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0xe7:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	1600                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0xf6:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x105:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	1612                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x114:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x123:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	60                      # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x12f:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	61                      # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x13e:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x14d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x159:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x165:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	65                      # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x171:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	66                      # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x180:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	67                      # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x18f:0xf DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	68                      # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x19e:0xf DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	69                      # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0x1ae:0x3ca DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	107                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1600                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	10                      # Abbrev [10] 0x1c7:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	107                     # DW_AT_decl_line
	.long	1600                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1d6:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	107                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1e5:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	107                     # DW_AT_decl_line
	.long	1612                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1f4:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	107                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x203:0xf DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	171                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x212:0xf DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	170                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x221:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	169                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x22d:0xf DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	168                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x23c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	167                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x248:0xf DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	166                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x257:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	165                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x263:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	164                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x26f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	163                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x27b:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	162                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x287:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	161                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x293:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	160                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x29f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	159                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x2ab:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	158                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x2b7:0xf DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	157                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x2c6:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	156                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x2d2:0xf DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	155                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x2e1:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	154                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x2ed:0xf DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	153                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x2fc:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	152                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x308:0xf DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	151                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x317:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	150                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x323:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	149                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x32f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	148                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x33b:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	147                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x347:0xf DW_TAG_variable
	.long	.Ldebug_loc32           # DW_AT_location
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	146                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x356:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	145                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x362:0xf DW_TAG_variable
	.long	.Ldebug_loc33           # DW_AT_location
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	144                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x371:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	143                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x37d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	142                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x389:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	141                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x395:0xf DW_TAG_variable
	.long	.Ldebug_loc34           # DW_AT_location
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	140                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x3a4:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	139                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x3b0:0xf DW_TAG_variable
	.long	.Ldebug_loc35           # DW_AT_location
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	138                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x3bf:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string66         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	137                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x3cb:0xf DW_TAG_variable
	.long	.Ldebug_loc36           # DW_AT_location
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	136                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x3da:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	135                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x3e6:0xf DW_TAG_variable
	.long	.Ldebug_loc37           # DW_AT_location
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	134                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x3f5:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	133                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x401:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	132                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x40d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	131                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x419:0xf DW_TAG_variable
	.long	.Ldebug_loc38           # DW_AT_location
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	130                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x428:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	129                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x434:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string75         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	128                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x440:0xf DW_TAG_variable
	.long	.Ldebug_loc39           # DW_AT_location
	.long	.Linfo_string76         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	127                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x44f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string77         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	126                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x45b:0xf DW_TAG_variable
	.long	.Ldebug_loc40           # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	125                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x46a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	124                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x476:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string80         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	123                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x482:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string81         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	122                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x48e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string82         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	121                     # DW_AT_decl_line
	.long	1612                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x49a:0xf DW_TAG_variable
	.long	.Ldebug_loc41           # DW_AT_location
	.long	.Linfo_string83         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	120                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x4a9:0xf DW_TAG_variable
	.long	.Ldebug_loc42           # DW_AT_location
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	119                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x4b8:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	118                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x4c4:0xf DW_TAG_variable
	.long	.Ldebug_loc43           # DW_AT_location
	.long	.Linfo_string84         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	117                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x4d3:0xf DW_TAG_variable
	.long	.Ldebug_loc44           # DW_AT_location
	.long	.Linfo_string85         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	116                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x4e2:0xf DW_TAG_variable
	.long	.Ldebug_loc45           # DW_AT_location
	.long	.Linfo_string86         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	115                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x4f1:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	114                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x4fd:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string87         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	113                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x509:0xf DW_TAG_variable
	.long	.Ldebug_loc46           # DW_AT_location
	.long	.Linfo_string88         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	112                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x518:0xf DW_TAG_variable
	.long	.Ldebug_loc47           # DW_AT_location
	.long	.Linfo_string89         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	111                     # DW_AT_decl_line
	.long	1612                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x527:0xf DW_TAG_variable
	.long	.Ldebug_loc48           # DW_AT_location
	.long	.Linfo_string90         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	110                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x536:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string91         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	109                     # DW_AT_decl_line
	.long	1612                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x542:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string92         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	108                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x54e:0xf DW_TAG_variable
	.long	.Ldebug_loc49           # DW_AT_location
	.long	.Linfo_string93         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	110                     # DW_AT_decl_line
	.long	1600                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x55d:0xf DW_TAG_variable
	.long	.Ldebug_loc50           # DW_AT_location
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	120                     # DW_AT_decl_line
	.long	1600                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x56c:0xb DW_TAG_variable
	.long	.Linfo_string94         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	108                     # DW_AT_decl_line
	.long	1600                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	15                      # Abbrev [15] 0x578:0xc8 DW_TAG_subprogram
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1600                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	16                      # Abbrev [16] 0x584:0xb DW_TAG_formal_parameter
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x58f:0xb DW_TAG_variable
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x59a:0xb DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x5a5:0xb DW_TAG_variable
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x5b0:0xb DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x5bb:0xb DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x5c6:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.long	1612                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x5d1:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x5dc:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x5e7:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x5f2:0xb DW_TAG_variable
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	1612                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x5fd:0xb DW_TAG_variable
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	1612                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x608:0xb DW_TAG_variable
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x613:0xb DW_TAG_variable
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x61e:0xb DW_TAG_variable
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	1600                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x629:0xb DW_TAG_variable
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	1600                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x634:0xb DW_TAG_variable
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	1600                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x640:0x5 DW_TAG_pointer_type
	.long	1605                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x645:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	18                      # Abbrev [18] 0x64c:0x7 DW_TAG_base_type
	.long	.Linfo_string12         # DW_AT_name
	.byte	2                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	19                      # Abbrev [19] 0x653:0x29f DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	373                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	2290                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	20                      # Abbrev [20] 0x66d:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc51           # DW_AT_location
	.long	.Linfo_string95         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	373                     # DW_AT_decl_line
	.long	2290                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x67d:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc52           # DW_AT_location
	.long	.Linfo_string96         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	373                     # DW_AT_decl_line
	.long	2297                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x68d:0x10 DW_TAG_variable
	.long	.Ldebug_loc53           # DW_AT_location
	.long	.Linfo_string98         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	396                     # DW_AT_decl_line
	.long	1612                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x69d:0x10 DW_TAG_variable
	.long	.Ldebug_loc54           # DW_AT_location
	.long	.Linfo_string99         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	395                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x6ad:0x10 DW_TAG_variable
	.long	.Ldebug_loc55           # DW_AT_location
	.long	.Linfo_string80         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	393                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x6bd:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string81         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	392                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x6ca:0x10 DW_TAG_variable
	.long	.Ldebug_loc56           # DW_AT_location
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	391                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x6da:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string100        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	390                     # DW_AT_decl_line
	.long	1612                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x6e7:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string101        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	389                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x6f4:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string102        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	388                     # DW_AT_decl_line
	.long	1612                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x701:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string103        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	387                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x70e:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string104        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	386                     # DW_AT_decl_line
	.long	1612                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x71b:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string105        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	385                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x728:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	384                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x735:0x10 DW_TAG_variable
	.long	.Ldebug_loc57           # DW_AT_location
	.long	.Linfo_string106        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	383                     # DW_AT_decl_line
	.long	1612                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x745:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string107        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	382                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x752:0x10 DW_TAG_variable
	.long	.Ldebug_loc58           # DW_AT_location
	.long	.Linfo_string108        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	382                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x762:0x10 DW_TAG_variable
	.long	.Ldebug_loc59           # DW_AT_location
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	380                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x772:0x10 DW_TAG_variable
	.long	.Ldebug_loc60           # DW_AT_location
	.long	.Linfo_string89         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	379                     # DW_AT_decl_line
	.long	1612                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x782:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string90         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	378                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x78f:0x10 DW_TAG_variable
	.long	.Ldebug_loc61           # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	377                     # DW_AT_decl_line
	.long	1612                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x79f:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	376                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x7ac:0x10 DW_TAG_variable
	.long	.Ldebug_loc62           # DW_AT_location
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	375                     # DW_AT_decl_line
	.long	1605                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x7bc:0x10 DW_TAG_variable
	.long	.Ldebug_loc63           # DW_AT_location
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	382                     # DW_AT_decl_line
	.long	2314                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x7cc:0x10 DW_TAG_variable
	.long	.Ldebug_loc64           # DW_AT_location
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	385                     # DW_AT_decl_line
	.long	1600                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x7dc:0x10 DW_TAG_variable
	.long	.Ldebug_loc65           # DW_AT_location
	.long	.Linfo_string109        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	374                     # DW_AT_decl_line
	.long	1600                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x7ec:0x10 DW_TAG_variable
	.long	.Ldebug_loc66           # DW_AT_location
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	381                     # DW_AT_decl_line
	.long	1600                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x7fc:0x10 DW_TAG_variable
	.long	.Ldebug_loc75           # DW_AT_location
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	387                     # DW_AT_decl_line
	.long	1600                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x80c:0x10 DW_TAG_variable
	.long	.Ldebug_loc76           # DW_AT_location
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	376                     # DW_AT_decl_line
	.long	1600                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x81c:0x10 DW_TAG_variable
	.long	.Ldebug_loc77           # DW_AT_location
	.long	.Linfo_string93         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	378                     # DW_AT_decl_line
	.long	1600                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x82c:0x10 DW_TAG_variable
	.long	.Ldebug_loc78           # DW_AT_location
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	389                     # DW_AT_decl_line
	.long	1600                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x83c:0x10 DW_TAG_variable
	.long	.Ldebug_loc79           # DW_AT_location
	.long	.Linfo_string77         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	395                     # DW_AT_decl_line
	.long	1600                    # DW_AT_type
	.byte	24                      # Abbrev [24] 0x84c:0xc DW_TAG_variable
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	394                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	24                      # Abbrev [24] 0x858:0xc DW_TAG_variable
	.long	.Linfo_string76         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	397                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	25                      # Abbrev [25] 0x864:0x8d DW_TAG_inlined_subroutine
	.long	1400                    # DW_AT_abstract_origin
	.quad	.Ltmp117                # DW_AT_low_pc
	.long	.Ltmp125-.Ltmp117       # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.short	415                     # DW_AT_call_line
	.byte	4                       # Abbrev [4] 0x878:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc72           # DW_AT_location
	.long	1412                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x881:0x9 DW_TAG_variable
	.long	.Ldebug_loc67           # DW_AT_location
	.long	1423                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x88a:0x9 DW_TAG_variable
	.long	.Ldebug_loc68           # DW_AT_location
	.long	1434                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x893:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1445                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x899:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1456                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x89f:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1467                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x8a5:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1478                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x8ab:0x9 DW_TAG_variable
	.long	.Ldebug_loc69           # DW_AT_location
	.long	1489                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x8b4:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1500                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x8ba:0x9 DW_TAG_variable
	.long	.Ldebug_loc70           # DW_AT_location
	.long	1511                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x8c3:0x9 DW_TAG_variable
	.long	.Ldebug_loc71           # DW_AT_location
	.long	1522                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x8cc:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1533                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x8d2:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1544                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x8d8:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1555                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x8de:0x9 DW_TAG_variable
	.long	.Ldebug_loc73           # DW_AT_location
	.long	1566                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x8e7:0x9 DW_TAG_variable
	.long	.Ldebug_loc74           # DW_AT_location
	.long	1577                    # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	18                      # Abbrev [18] 0x8f2:0x7 DW_TAG_base_type
	.long	.Linfo_string26         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	17                      # Abbrev [17] 0x8f9:0x5 DW_TAG_pointer_type
	.long	2302                    # DW_AT_type
	.byte	17                      # Abbrev [17] 0x8fe:0x5 DW_TAG_pointer_type
	.long	2307                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x903:0x7 DW_TAG_base_type
	.long	.Linfo_string97         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	17                      # Abbrev [17] 0x90a:0x5 DW_TAG_pointer_type
	.long	1600                    # DW_AT_type
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
	.long	2320                    # Compilation Unit Length
	.long	1400                    # DIE offset
	.asciz	"init"                  # External Name
	.long	1619                    # DIE offset
	.asciz	"main"                  # External Name
	.long	191                     # DIE offset
	.asciz	"getBobSum"             # External Name
	.long	430                     # DIE offset
	.asciz	"findMoves"             # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	2320                    # Compilation Unit Length
	.long	1605                    # DIE offset
	.asciz	"long long int"         # External Name
	.long	1612                    # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	2290                    # DIE offset
	.asciz	"int"                   # External Name
	.long	2307                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0: