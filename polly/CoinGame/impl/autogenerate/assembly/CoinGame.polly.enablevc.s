	.text
	.file	"llvm/CoinGame.polly.enablevc.ll"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI0_0:
	.quad	2                       # 0x2
	.quad	3                       # 0x3
	.text
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
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:coins <- %RAX
	#DEBUG_VALUE: init:coins_has_ownership <- 1
	.loc	1 34 6                  # CoinGame.c:34:6
	testq	%rbx, %rbx
	jle	.LBB0_10
.Ltmp5:
# BB#1:                                 # %if.end7.preheader
	#DEBUG_VALUE: init:coins <- %RAX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:n <- %RBX
	xorl	%edx, %edx
	.loc	1 36 6                  # CoinGame.c:36:6
	cmpq	$4, %rbx
	jb	.LBB0_9
.Ltmp6:
# BB#2:                                 # %min.iters.checked
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:coins <- %RAX
	xorl	%edx, %edx
	movq	%rbx, %rcx
	andq	$-4, %rcx
	je	.LBB0_9
.Ltmp7:
# BB#3:                                 # %vector.body.preheader
	#DEBUG_VALUE: init:coins <- %RAX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:n <- %RBX
	leaq	-4(%rcx), %rdi
	movq	%rdi, %rsi
	shrq	$2, %rsi
	xorl	%edx, %edx
	btq	$2, %rdi
	jb	.LBB0_5
.Ltmp8:
# BB#4:                                 # %vector.body.prol
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:coins <- %RAX
	movdqu	(%rax), %xmm0
	movdqu	16(%rax), %xmm1
	.loc	1 38 8                  # CoinGame.c:38:8
	movl	$1, %edx
	movd	%rdx, %xmm2
	pslldq	$8, %xmm2               # xmm2 = zero,zero,zero,zero,zero,zero,zero,zero,xmm2[0,1,2,3,4,5,6,7]
	paddq	%xmm0, %xmm2
	paddq	.LCPI0_0(%rip), %xmm1
	.loc	1 40 12                 # CoinGame.c:40:12
	movdqu	%xmm2, (%rax)
	movdqu	%xmm1, 16(%rax)
	movl	$4, %edx
.Ltmp9:
.LBB0_5:                                # %vector.body.preheader.split
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:coins <- %RAX
	testq	%rsi, %rsi
	je	.LBB0_8
.Ltmp10:
# BB#6:
	#DEBUG_VALUE: init:coins <- %RAX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:n <- %RBX
	movl	$1, %esi
	movd	%rsi, %xmm0
	pslldq	$8, %xmm0               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7]
	movdqa	.LCPI0_0(%rip), %xmm1   # xmm1 = [2,3]
.Ltmp11:
	.p2align	4, 0x90
.LBB0_7:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movd	%rdx, %xmm2
	pshufd	$68, %xmm2, %xmm2       # xmm2 = xmm2[0,1,0,1]
	.loc	1 36 6                  # CoinGame.c:36:6
	movdqu	(%rax,%rdx,8), %xmm3
	paddq	%xmm2, %xmm3
	movdqu	16(%rax,%rdx,8), %xmm4
	paddq	%xmm2, %xmm4
	.loc	1 38 8                  # CoinGame.c:38:8
	paddq	%xmm0, %xmm3
	paddq	%xmm1, %xmm4
	.loc	1 40 12                 # CoinGame.c:40:12
	movdqu	%xmm3, (%rax,%rdx,8)
	movdqu	%xmm4, 16(%rax,%rdx,8)
	.loc	1 36 6                  # CoinGame.c:36:6
	leaq	4(%rdx), %rsi
	movd	%rsi, %xmm2
	pshufd	$68, %xmm2, %xmm2       # xmm2 = xmm2[0,1,0,1]
	movdqu	32(%rax,%rdx,8), %xmm3
	paddq	%xmm2, %xmm3
	movdqu	48(%rax,%rdx,8), %xmm4
	paddq	%xmm2, %xmm4
	.loc	1 38 8                  # CoinGame.c:38:8
	paddq	%xmm0, %xmm3
	paddq	%xmm1, %xmm4
	.loc	1 40 12                 # CoinGame.c:40:12
	movdqu	%xmm3, 32(%rax,%rdx,8)
	movdqu	%xmm4, 48(%rax,%rdx,8)
	.loc	1 36 6                  # CoinGame.c:36:6
	addq	$8, %rdx
	cmpq	%rcx, %rdx
	jne	.LBB0_7
.LBB0_8:                                # %middle.block
	cmpq	%rbx, %rcx
	movq	%rcx, %rdx
	je	.LBB0_10
	.p2align	4, 0x90
.LBB0_9:                                # %if.end7
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 40 12                 # CoinGame.c:40:12
	addq	%rdx, (%rax,%rdx,8)
.Ltmp12:
	#DEBUG_VALUE: init:_9 <- 1
	.loc	1 44 8                  # CoinGame.c:44:8
	incq	%rdx
.Ltmp13:
	#DEBUG_VALUE: init:_10 <- %RDX
	#DEBUG_VALUE: init:i <- %RDX
	.loc	1 34 6                  # CoinGame.c:34:6
	cmpq	%rdx, %rbx
	jne	.LBB0_9
.Ltmp14:
.LBB0_10:                               # %if.end15
	.loc	1 55 2                  # CoinGame.c:55:2
	popq	%rbx
	retq
.Ltmp15:
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
.Ltmp16:
	.cfi_def_cfa_offset 16
.Ltmp17:
	.cfi_offset %rbx, -16
	#DEBUG_VALUE: getBobSum:sum_alice <- %RDI
	#DEBUG_VALUE: getBobSum:coins <- %RSI
	#DEBUG_VALUE: getBobSum:coins_size <- %RDX
	#DEBUG_VALUE: getBobSum:coins_has_ownership [bit_piece offset=0 size=1] <- %ECX
.Ltmp18:
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
.Ltmp19:
	.loc	1 81 6 prologue_end     # CoinGame.c:81:6
	testq	%r8, %r8
	jle	.LBB1_13
.Ltmp20:
# BB#1:                                 # %if.end.preheader
	#DEBUG_VALUE: getBobSum:n <- %R8
	#DEBUG_VALUE: getBobSum:coins_has_ownership [bit_piece offset=0 size=1] <- %CL
	#DEBUG_VALUE: getBobSum:coins_size <- %RDX
	#DEBUG_VALUE: getBobSum:coins <- %RSI
	#DEBUG_VALUE: getBobSum:sum_alice <- %RDI
	xorl	%edx, %edx
.Ltmp21:
	.loc	1 83 6                  # CoinGame.c:83:6
	cmpq	$4, %r8
	movl	$0, %ebx
	jb	.LBB1_11
.Ltmp22:
# BB#2:                                 # %min.iters.checked
	#DEBUG_VALUE: getBobSum:sum_alice <- %RDI
	#DEBUG_VALUE: getBobSum:coins <- %RSI
	#DEBUG_VALUE: getBobSum:coins_has_ownership [bit_piece offset=0 size=1] <- %CL
	#DEBUG_VALUE: getBobSum:n <- %R8
	xorl	%edx, %edx
	movq	%r8, %rax
	andq	$-4, %rax
	movl	$0, %ebx
	je	.LBB1_11
.Ltmp23:
# BB#3:                                 # %vector.body.preheader
	#DEBUG_VALUE: getBobSum:n <- %R8
	#DEBUG_VALUE: getBobSum:coins_has_ownership [bit_piece offset=0 size=1] <- %CL
	#DEBUG_VALUE: getBobSum:coins <- %RSI
	#DEBUG_VALUE: getBobSum:sum_alice <- %RDI
	leaq	-4(%rax), %r9
	movl	%r9d, %edx
	shrl	$2, %edx
	incl	%edx
	xorl	%ebx, %ebx
	andq	$3, %rdx
	je	.LBB1_4
.Ltmp24:
# BB#5:                                 # %vector.body.prol.preheader
	#DEBUG_VALUE: getBobSum:sum_alice <- %RDI
	#DEBUG_VALUE: getBobSum:coins <- %RSI
	#DEBUG_VALUE: getBobSum:coins_has_ownership [bit_piece offset=0 size=1] <- %CL
	#DEBUG_VALUE: getBobSum:n <- %R8
	negq	%rdx
	pxor	%xmm0, %xmm0
	xorl	%ebx, %ebx
	pxor	%xmm1, %xmm1
.Ltmp25:
	.p2align	4, 0x90
.LBB1_6:                                # %vector.body.prol
                                        # =>This Inner Loop Header: Depth=1
	movdqu	(%rsi,%rbx,8), %xmm2
	movdqu	16(%rsi,%rbx,8), %xmm3
	.loc	1 85 9                  # CoinGame.c:85:9
	paddq	%xmm2, %xmm0
	paddq	%xmm3, %xmm1
	.loc	1 83 6                  # CoinGame.c:83:6
	addq	$4, %rbx
	incq	%rdx
	jne	.LBB1_6
	jmp	.LBB1_7
.LBB1_4:
.Ltmp26:
	#DEBUG_VALUE: getBobSum:sum_alice <- %RDI
	#DEBUG_VALUE: getBobSum:coins <- %RSI
	#DEBUG_VALUE: getBobSum:coins_has_ownership [bit_piece offset=0 size=1] <- %CL
	#DEBUG_VALUE: getBobSum:n <- %R8
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
.Ltmp27:
.LBB1_7:                                # %vector.body.preheader.split
	cmpq	$12, %r9
	jb	.LBB1_10
# BB#8:                                 # %vector.body.preheader.split.split
	movq	%rax, %rdx
	subq	%rbx, %rdx
	leaq	112(%rsi,%rbx,8), %rbx
	.p2align	4, 0x90
.LBB1_9:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movdqu	-112(%rbx), %xmm2
	movdqu	-96(%rbx), %xmm3
	movdqu	-80(%rbx), %xmm4
	movdqu	-64(%rbx), %xmm5
	.loc	1 85 9                  # CoinGame.c:85:9
	paddq	%xmm0, %xmm2
	paddq	%xmm1, %xmm3
	paddq	%xmm4, %xmm2
	paddq	%xmm5, %xmm3
	.loc	1 83 6                  # CoinGame.c:83:6
	movdqu	-48(%rbx), %xmm4
	movdqu	-32(%rbx), %xmm5
	.loc	1 85 9                  # CoinGame.c:85:9
	paddq	%xmm2, %xmm4
	paddq	%xmm3, %xmm5
	.loc	1 83 6                  # CoinGame.c:83:6
	movdqu	-16(%rbx), %xmm0
	movdqu	(%rbx), %xmm1
	.loc	1 85 9                  # CoinGame.c:85:9
	paddq	%xmm4, %xmm0
	paddq	%xmm5, %xmm1
	.loc	1 83 6                  # CoinGame.c:83:6
	subq	$-128, %rbx
	addq	$-16, %rdx
	jne	.LBB1_9
.LBB1_10:                               # %middle.block
	.loc	1 85 9                  # CoinGame.c:85:9
	paddq	%xmm0, %xmm1
	pshufd	$78, %xmm1, %xmm0       # xmm0 = xmm1[2,3,0,1]
	paddq	%xmm1, %xmm0
	movd	%xmm0, %rbx
	cmpq	%r8, %rax
	movq	%rax, %rdx
	je	.LBB1_13
.LBB1_11:                               # %if.end.preheader27
	.loc	1 83 6                  # CoinGame.c:83:6
	subq	%rdx, %r8
	leaq	(%rsi,%rdx,8), %rax
	.p2align	4, 0x90
.LBB1_12:                               # %if.end
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 85 9                  # CoinGame.c:85:9
	addq	(%rax), %rbx
.Ltmp28:
	#DEBUG_VALUE: getBobSum:_10 <- 1
	#DEBUG_VALUE: getBobSum:_9 <- %RBX
	#DEBUG_VALUE: getBobSum:sum <- %RBX
	.loc	1 81 6                  # CoinGame.c:81:6
	addq	$8, %rax
	decq	%r8
	jne	.LBB1_12
.Ltmp29:
.LBB1_13:                               # %blklab2
	.loc	1 100 9                 # CoinGame.c:100:9
	subq	%rdi, %rbx
.Ltmp30:
	#DEBUG_VALUE: getBobSum:_12 <- %RBX
	.loc	1 102 2                 # CoinGame.c:102:2
	testb	%cl, %cl
	je	.LBB1_15
.Ltmp31:
# BB#14:                                # %if.then2
	#DEBUG_VALUE: getBobSum:_12 <- %RBX
	.loc	1 102 2 is_stmt 0 discriminator 1 # CoinGame.c:102:2
	movq	%rsi, %rdi
	callq	free
.Ltmp32:
	#DEBUG_VALUE: getBobSum:coins_has_ownership <- 0
.LBB1_15:                               # %if.end3
	#DEBUG_VALUE: getBobSum:_12 <- %RBX
	.loc	1 103 2 is_stmt 1       # CoinGame.c:103:2
	movq	%rbx, %rax
	popq	%rbx
.Ltmp33:
	retq
.Ltmp34:
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
.Ltmp35:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp36:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp37:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp38:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp39:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp40:
	.cfi_def_cfa_offset 56
	subq	$88, %rsp
.Ltmp41:
	.cfi_def_cfa_offset 144
.Ltmp42:
	.cfi_offset %rbx, -56
.Ltmp43:
	.cfi_offset %r12, -48
.Ltmp44:
	.cfi_offset %r13, -40
.Ltmp45:
	.cfi_offset %r14, -32
.Ltmp46:
	.cfi_offset %r15, -24
.Ltmp47:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: findMoves:coins <- %RDI
	#DEBUG_VALUE: findMoves:coins_size <- %RSI
	#DEBUG_VALUE: findMoves:coins_has_ownership [bit_piece offset=0 size=1] <- %EDX
	#DEBUG_VALUE: findMoves:n <- %RCX
	movq	%rcx, %r15
.Ltmp48:
	#DEBUG_VALUE: findMoves:n <- %R15
	movl	%edx, 20(%rsp)          # 4-byte Spill
.Ltmp49:
	#DEBUG_VALUE: findMoves:coins_has_ownership [bit_piece offset=0 size=1] <-  [complex expression]
	movq	%rdi, %r12
.Ltmp50:
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
.Ltmp51:
	#DEBUG_VALUE: findMoves:_12_size <- %RBX
	#DEBUG_VALUE: findMoves:_11 <- %RBX
	#DEBUG_VALUE: findMoves:moves_size <- %RBX
	.loc	1 178 2                 # CoinGame.c:178:2
	xorl	%edi, %edi
	movl	%ebx, %esi
.Ltmp52:
	callq	gen1DArray
.Ltmp53:
	movq	%rax, 8(%rsp)           # 8-byte Spill
.Ltmp54:
	#DEBUG_VALUE: findMoves:moves <- [%RSP+8]
	#DEBUG_VALUE: findMoves:_12 <- [%RSP+8]
	#DEBUG_VALUE: findMoves:moves_has_ownership <- 1
	.loc	1 192 6                 # CoinGame.c:192:6
	testq	%r15, %r15
	jle	.LBB2_15
.Ltmp55:
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
.Ltmp56:
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
.Ltmp57:
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
.Ltmp58:
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
.Ltmp59:
	.loc	1 290 8                 # CoinGame.c:290:8
	cmpq	%rax, %rcx
.Ltmp60:
	.loc	1 290 7 is_stmt 0       # CoinGame.c:290:7
	cmovgq	%rax, %rcx
.Ltmp61:
	.loc	1 296 8 is_stmt 1       # CoinGame.c:296:8
	cmpq	%rax, %rdi
.Ltmp62:
	.loc	1 296 7 is_stmt 0       # CoinGame.c:296:7
	cmovgq	%rax, %rdi
	.loc	1 304 11 is_stmt 1      # CoinGame.c:304:11
	addq	(%r12,%r9,8), %rcx
	.loc	1 308 11                # CoinGame.c:308:11
	movq	48(%rsp), %rax          # 8-byte Reload
	addq	(%rax,%r9,8), %rdi
.Ltmp63:
	.loc	1 310 10                # CoinGame.c:310:10
	cmpq	%rdi, %rcx
.Ltmp64:
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
.Ltmp65:
	.loc	1 290 8                 # CoinGame.c:290:8
	cmpq	%rax, %rcx
.Ltmp66:
	.loc	1 290 7 is_stmt 0       # CoinGame.c:290:7
	cmovgq	%rax, %rcx
.Ltmp67:
	.loc	1 296 8 is_stmt 1       # CoinGame.c:296:8
	cmpq	%rax, %rdi
.Ltmp68:
	.loc	1 296 7 is_stmt 0       # CoinGame.c:296:7
	cmovgq	%rax, %rdi
	.loc	1 304 11 is_stmt 1      # CoinGame.c:304:11
	addq	(%r12,%r8,8), %rcx
	.loc	1 308 11                # CoinGame.c:308:11
	movq	48(%rsp), %rax          # 8-byte Reload
	addq	(%rax,%r8,8), %rdi
.Ltmp69:
	.loc	1 310 10                # CoinGame.c:310:10
	cmpq	%rdi, %rcx
.Ltmp70:
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
.Ltmp71:
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
.Ltmp72:
	.p2align	4, 0x90
.LBB2_4:                                # %while.cond8.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_5 Depth 2
	leaq	(%r8,%rdi), %r14
	xorl	%ecx, %ecx
	movq	8(%rsp), %rsi           # 8-byte Reload
	movl	$2, %ebx
.Ltmp73:
	.p2align	4, 0x90
.LBB2_5:                                # %if.end13
                                        #   Parent Loop BB2_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 124 12                # CoinGame.c:124:12
	leaq	-2(%rdi,%rbx), %rbp
.Ltmp74:
	#DEBUG_VALUE: findMoves:_16 <- 1
	#DEBUG_VALUE: findMoves:_15 <- 0
	#DEBUG_VALUE: findMoves:y <- 0
	.loc	1 220 10                # CoinGame.c:220:10
	testq	%rbp, %rbp
	#DEBUG_VALUE: findMoves:_20 <- 0
.Ltmp75:
	#DEBUG_VALUE: findMoves:_18 <- 1
	jle	.LBB2_6
.Ltmp76:
# BB#7:                                 # %if.end13
                                        #   in Loop: Header=BB2_5 Depth=2
	.loc	1 212 10                # CoinGame.c:212:10
	leaq	-1(%rbx), %rax
	cmpq	%r15, %rax
	movl	$0, %eax
	jge	.LBB2_9
.Ltmp77:
# BB#8:                                 # %if.end21
                                        #   in Loop: Header=BB2_5 Depth=2
	#DEBUG_VALUE: findMoves:_21 <- 1
	#DEBUG_VALUE: findMoves:_25 <- 1
	.loc	1 234 8                 # CoinGame.c:234:8
	leaq	(%rsi,%r10), %rax
	movq	(%rax,%rdi,8), %rax
.Ltmp78:
	#DEBUG_VALUE: findMoves:_27 <- %RAX
	#DEBUG_VALUE: findMoves:y <- %RAX
	jmp	.LBB2_9
.Ltmp79:
	.p2align	4, 0x90
.LBB2_6:                                #   in Loop: Header=BB2_5 Depth=2
	xorl	%eax, %eax
.LBB2_9:                                # %blklab8
                                        #   in Loop: Header=BB2_5 Depth=2
	#DEBUG_VALUE: findMoves:x <- 0
	#DEBUG_VALUE: findMoves:_28 <- 0
.Ltmp80:
	#DEBUG_VALUE: findMoves:_29 <- 2
	.loc	1 248 7                 # CoinGame.c:248:7
	cmpq	%r15, %rbx
	movl	$0, %edx
	jge	.LBB2_11
# BB#10:                                # %if.end30
                                        #   in Loop: Header=BB2_5 Depth=2
.Ltmp81:
	#DEBUG_VALUE: findMoves:_31 <- 2
	.loc	1 258 8                 # CoinGame.c:258:8
	leaq	(%rsi,%r9), %rdx
	movq	(%rdx,%rdi,8), %rdx
.Ltmp82:
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
.Ltmp83:
# BB#12:                                # %if.end39
                                        #   in Loop: Header=BB2_5 Depth=2
	#DEBUG_VALUE: findMoves:_42 <- 2
	.loc	1 284 8                 # CoinGame.c:284:8
	movq	-16(%rsi,%rdi,8), %rbp
.Ltmp84:
	#DEBUG_VALUE: findMoves:_44 <- %RBP
	#DEBUG_VALUE: findMoves:z <- %RBP
.LBB2_13:                               # %blklab10
                                        #   in Loop: Header=BB2_5 Depth=2
	#DEBUG_VALUE: findMoves:x <- %RAX
	.loc	1 290 8                 # CoinGame.c:290:8
	cmpq	%rax, %rdx
.Ltmp85:
	.loc	1 290 7 is_stmt 0       # CoinGame.c:290:7
	cmovgq	%rax, %rdx
.Ltmp86:
	.loc	1 296 8 is_stmt 1       # CoinGame.c:296:8
	cmpq	%rax, %rbp
.Ltmp87:
	.loc	1 296 7 is_stmt 0       # CoinGame.c:296:7
	cmovgq	%rax, %rbp
	.loc	1 304 11 is_stmt 1      # CoinGame.c:304:11
	addq	-16(%r12,%rbx,8), %rdx
.Ltmp88:
	#DEBUG_VALUE: findMoves:_46 <- %RDX
	.loc	1 306 8                 # CoinGame.c:306:8
	leaq	(%r12,%rcx), %rax
.Ltmp89:
	.loc	1 308 11                # CoinGame.c:308:11
	addq	(%rax,%rdi,8), %rbp
.Ltmp90:
	#DEBUG_VALUE: findMoves:_48 <- %RBP
	.loc	1 310 10                # CoinGame.c:310:10
	cmpq	%rbp, %rdx
.Ltmp91:
	.loc	1 322 4                 # CoinGame.c:322:4
	cmovgeq	%rdx, %rbp
.Ltmp92:
	.loc	1 320 15                # CoinGame.c:320:15
	movq	%rbp, (%rsi,%rdi,8)
	.loc	1 202 7                 # CoinGame.c:202:7
	addq	%r11, %rsi
	leaq	1(%r14,%rbx), %rax
.Ltmp93:
	#DEBUG_VALUE: findMoves:_59 <- 1
	#DEBUG_VALUE: findMoves:_57 <- 1
	incq	%rbx
	addq	$8, %rcx
	cmpq	$2, %rax
	jne	.LBB2_5
.Ltmp94:
# BB#14:                                # %blklab6
                                        #   in Loop: Header=BB2_4 Depth=1
	#DEBUG_VALUE: findMoves:_46 <- %RDX
	#DEBUG_VALUE: findMoves:_61 <- 1
	.loc	1 357 8                 # CoinGame.c:357:8
	incq	%rdi
.Ltmp95:
	#DEBUG_VALUE: findMoves:_62 <- %RDI
	#DEBUG_VALUE: findMoves:s <- %RDI
	.loc	1 192 6                 # CoinGame.c:192:6
	cmpq	%r15, %rdi
	jne	.LBB2_4
.Ltmp96:
.LBB2_15:                               # %blklab4
	.loc	1 366 2                 # CoinGame.c:366:2
	movl	20(%rsp), %eax          # 4-byte Reload
	testb	%al, %al
	je	.LBB2_17
# BB#16:                                # %if.then74
.Ltmp97:
	.loc	1 366 2 is_stmt 0 discriminator 1 # CoinGame.c:366:2
	movq	%r12, %rdi
	callq	free
.Ltmp98:
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
.Ltmp99:
.Lfunc_end2:
	.size	findMoves, .Lfunc_end2-findMoves
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI3_0:
	.quad	2                       # 0x2
	.quad	3                       # 0x3
.LCPI3_1:
	.quad	84                      # 0x54
	.quad	104                     # 0x68
.LCPI3_2:
	.quad	101                     # 0x65
	.quad	32                      # 0x20
.LCPI3_3:
	.quad	116                     # 0x74
	.quad	111                     # 0x6f
.LCPI3_4:
	.quad	116                     # 0x74
	.quad	97                      # 0x61
.LCPI3_5:
	.quad	108                     # 0x6c
	.quad	32                      # 0x20
.LCPI3_6:
	.quad	97                      # 0x61
	.quad	109                     # 0x6d
.LCPI3_7:
	.quad	111                     # 0x6f
	.quad	117                     # 0x75
.LCPI3_8:
	.quad	110                     # 0x6e
	.quad	116                     # 0x74
.LCPI3_9:
	.quad	32                      # 0x20
	.quad	111                     # 0x6f
.LCPI3_10:
	.quad	102                     # 0x66
	.quad	32                      # 0x20
.LCPI3_11:
	.quad	109                     # 0x6d
	.quad	111                     # 0x6f
.LCPI3_12:
	.quad	110                     # 0x6e
	.quad	101                     # 0x65
.LCPI3_13:
	.quad	121                     # 0x79
	.quad	32                      # 0x20
.LCPI3_14:
	.quad	40                      # 0x28
	.quad	109                     # 0x6d
.LCPI3_15:
	.quad	97                      # 0x61
	.quad	120                     # 0x78
.LCPI3_16:
	.quad	105                     # 0x69
	.quad	109                     # 0x6d
.LCPI3_17:
	.quad	117                     # 0x75
	.quad	109                     # 0x6d
.LCPI3_18:
	.quad	41                      # 0x29
	.quad	32                      # 0x20
.LCPI3_19:
	.quad	65                      # 0x41
	.quad	108                     # 0x6c
.LCPI3_20:
	.quad	105                     # 0x69
	.quad	99                      # 0x63
.LCPI3_21:
	.quad	103                     # 0x67
	.quad	101                     # 0x65
.LCPI3_22:
	.quad	116                     # 0x74
	.quad	115                     # 0x73
.LCPI3_23:
	.quad	32                      # 0x20
	.quad	105                     # 0x69
.LCPI3_24:
	.quad	115                     # 0x73
	.quad	32                      # 0x20
.LCPI3_25:
	.quad	66                      # 0x42
	.quad	111                     # 0x6f
.LCPI3_26:
	.quad	98                      # 0x62
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
.Ltmp100:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp101:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp102:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp103:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp104:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp105:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Ltmp106:
	.cfi_def_cfa_offset 64
.Ltmp107:
	.cfi_offset %rbx, -56
.Ltmp108:
	.cfi_offset %r12, -48
.Ltmp109:
	.cfi_offset %r13, -40
.Ltmp110:
	.cfi_offset %r14, -32
.Ltmp111:
	.cfi_offset %r15, -24
.Ltmp112:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
	movl	%edi, %ebx
.Ltmp113:
	#DEBUG_VALUE: main:_24_has_ownership <- 0
	#DEBUG_VALUE: main:_24_size <- 0
	#DEBUG_VALUE: main:_19_has_ownership <- 0
	#DEBUG_VALUE: main:_19_size <- 0
	#DEBUG_VALUE: main:_16 <- 0
	#DEBUG_VALUE: main:_15 <- 0
	#DEBUG_VALUE: main:_14 <- 0
	#DEBUG_VALUE: main:_13 <- 0
	#DEBUG_VALUE: main:_12_has_ownership <- 0
	#DEBUG_VALUE: main:_12_size <- 0
	#DEBUG_VALUE: main:_11_has_ownership <- 0
	#DEBUG_VALUE: main:_11_size <- 0
	#DEBUG_VALUE: main:_10_has_ownership <- 0
	#DEBUG_VALUE: main:_10_size <- 0
	#DEBUG_VALUE: main:_9 <- 0
	#DEBUG_VALUE: main:_8_has_ownership <- 0
	#DEBUG_VALUE: main:_8_size_size <- 0
	#DEBUG_VALUE: main:_8_size <- 0
	#DEBUG_VALUE: main:sum_bob <- 0
	#DEBUG_VALUE: main:sum_alice <- 0
	#DEBUG_VALUE: main:moves_has_ownership <- 0
	#DEBUG_VALUE: main:moves_size <- 0
	#DEBUG_VALUE: main:coins_has_ownership <- 0
	#DEBUG_VALUE: main:coins_size <- 0
	#DEBUG_VALUE: main:n <- 0
	#DEBUG_VALUE: main:argc <- %EBX
	.loc	1 405 2 prologue_end    # CoinGame.c:405:2
	callq	convertArgsToIntArray
.Ltmp114:
	movq	%rax, %r15
.Ltmp115:
	#DEBUG_VALUE: main:_8 <- %R15
	decl	%ebx
.Ltmp116:
	movslq	%ebx, %rbp
.Ltmp117:
	#DEBUG_VALUE: main:_8_has_ownership <- 1
	#DEBUG_VALUE: main:_8_size <- %EBX
	.loc	1 410 6                 # CoinGame.c:410:6
	movq	(%r15), %rdi
.Ltmp118:
	#DEBUG_VALUE: main:_10 <- %RDI
	.loc	1 412 2                 # CoinGame.c:412:2
	callq	parseStringToInt
.Ltmp119:
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_7 <- %RAX
	.loc	1 416 9                 # CoinGame.c:416:9
	testq	%rax, %rax
.Ltmp120:
	.loc	1 416 5 is_stmt 0       # CoinGame.c:416:5
	je	.LBB3_26
.Ltmp121:
# BB#1:                                 # %if.end
	#DEBUG_VALUE: main:_7 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_8_size <- %EBX
	#DEBUG_VALUE: main:_8 <- %R15
	.loc	1 418 6 is_stmt 1       # CoinGame.c:418:6
	movq	(%rax), %rbx
.Ltmp122:
	#DEBUG_VALUE: init:_10 <- 0
	#DEBUG_VALUE: init:_9 <- 0
	#DEBUG_VALUE: init:_8 <- 0
	#DEBUG_VALUE: init:_7 <- 0
	#DEBUG_VALUE: init:_6 <- 0
	#DEBUG_VALUE: init:_5_has_ownership <- 0
	#DEBUG_VALUE: init:_5_size <- %RBX
	#DEBUG_VALUE: init:_4 <- 0
	#DEBUG_VALUE: init:i <- 0
	#DEBUG_VALUE: init:coins_has_ownership <- 0
	#DEBUG_VALUE: init:_1_has_ownership <- 0
	#DEBUG_VALUE: init:_1_size <- 0
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: init:coins_size <- 0
	#DEBUG_VALUE: getBobSum:n <- %RBX
	#DEBUG_VALUE: main:n <- %RBX
	.loc	1 20 2                  # CoinGame.c:20:2
	xorl	%edi, %edi
	movl	%ebx, %esi
	callq	gen1DArray
.Ltmp123:
	movq	%rax, %r13
.Ltmp124:
	#DEBUG_VALUE: init:_5 <- %R13
	#DEBUG_VALUE: init:coins <- %R13
	#DEBUG_VALUE: main:_11 <- %R13
	#DEBUG_VALUE: main:coins <- %R13
	#DEBUG_VALUE: getBobSum:coins <- %R13
	#DEBUG_VALUE: init:coins_has_ownership <- 1
	.loc	1 34 6                  # CoinGame.c:34:6
	testq	%rbx, %rbx
	jle	.LBB3_11
.Ltmp125:
# BB#2:                                 # %if.end7.i.preheader
	#DEBUG_VALUE: main:_8 <- %R15
	#DEBUG_VALUE: getBobSum:coins <- %R13
	#DEBUG_VALUE: main:coins <- %R13
	#DEBUG_VALUE: main:_11 <- %R13
	#DEBUG_VALUE: init:coins <- %R13
	#DEBUG_VALUE: init:_5 <- %R13
	#DEBUG_VALUE: main:n <- %RBX
	#DEBUG_VALUE: getBobSum:n <- %RBX
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: init:_5_size <- %RBX
	xorl	%ecx, %ecx
	.loc	1 36 6                  # CoinGame.c:36:6
	cmpq	$4, %rbx
	jb	.LBB3_10
.Ltmp126:
# BB#3:                                 # %min.iters.checked
	#DEBUG_VALUE: init:_5_size <- %RBX
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: getBobSum:n <- %RBX
	#DEBUG_VALUE: main:n <- %RBX
	#DEBUG_VALUE: init:_5 <- %R13
	#DEBUG_VALUE: init:coins <- %R13
	#DEBUG_VALUE: main:_11 <- %R13
	#DEBUG_VALUE: main:coins <- %R13
	#DEBUG_VALUE: getBobSum:coins <- %R13
	#DEBUG_VALUE: main:_8 <- %R15
	xorl	%ecx, %ecx
	movq	%rbx, %rax
	andq	$-4, %rax
	je	.LBB3_10
.Ltmp127:
# BB#4:                                 # %vector.body.preheader
	#DEBUG_VALUE: main:_8 <- %R15
	#DEBUG_VALUE: getBobSum:coins <- %R13
	#DEBUG_VALUE: main:coins <- %R13
	#DEBUG_VALUE: main:_11 <- %R13
	#DEBUG_VALUE: init:coins <- %R13
	#DEBUG_VALUE: init:_5 <- %R13
	#DEBUG_VALUE: main:n <- %RBX
	#DEBUG_VALUE: getBobSum:n <- %RBX
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: init:_5_size <- %RBX
	.loc	1 421 8                 # CoinGame.c:421:8
	leaq	-4(%rax), %rsi
	movq	%rsi, %rdx
	shrq	$2, %rdx
	xorl	%ecx, %ecx
	btq	$2, %rsi
	jb	.LBB3_6
.Ltmp128:
# BB#5:                                 # %vector.body.prol
	#DEBUG_VALUE: init:_5_size <- %RBX
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: getBobSum:n <- %RBX
	#DEBUG_VALUE: main:n <- %RBX
	#DEBUG_VALUE: init:_5 <- %R13
	#DEBUG_VALUE: init:coins <- %R13
	#DEBUG_VALUE: main:_11 <- %R13
	#DEBUG_VALUE: main:coins <- %R13
	#DEBUG_VALUE: getBobSum:coins <- %R13
	#DEBUG_VALUE: main:_8 <- %R15
	.loc	1 36 6                  # CoinGame.c:36:6
	movdqu	(%r13), %xmm0
	movdqu	16(%r13), %xmm1
	.loc	1 38 8                  # CoinGame.c:38:8
	movl	$1, %ecx
	movd	%rcx, %xmm2
	pslldq	$8, %xmm2               # xmm2 = zero,zero,zero,zero,zero,zero,zero,zero,xmm2[0,1,2,3,4,5,6,7]
	paddq	%xmm0, %xmm2
	paddq	.LCPI3_0(%rip), %xmm1
	.loc	1 40 12                 # CoinGame.c:40:12
	movdqu	%xmm2, (%r13)
	movdqu	%xmm1, 16(%r13)
	movl	$4, %ecx
.Ltmp129:
.LBB3_6:                                # %vector.body.preheader.split
	#DEBUG_VALUE: init:_5_size <- %RBX
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: getBobSum:n <- %RBX
	#DEBUG_VALUE: main:n <- %RBX
	#DEBUG_VALUE: init:_5 <- %R13
	#DEBUG_VALUE: init:coins <- %R13
	#DEBUG_VALUE: main:_11 <- %R13
	#DEBUG_VALUE: main:coins <- %R13
	#DEBUG_VALUE: getBobSum:coins <- %R13
	#DEBUG_VALUE: main:_8 <- %R15
	.loc	1 421 8                 # CoinGame.c:421:8
	testq	%rdx, %rdx
	je	.LBB3_9
.Ltmp130:
# BB#7:
	#DEBUG_VALUE: main:_8 <- %R15
	#DEBUG_VALUE: getBobSum:coins <- %R13
	#DEBUG_VALUE: main:coins <- %R13
	#DEBUG_VALUE: main:_11 <- %R13
	#DEBUG_VALUE: init:coins <- %R13
	#DEBUG_VALUE: init:_5 <- %R13
	#DEBUG_VALUE: main:n <- %RBX
	#DEBUG_VALUE: getBobSum:n <- %RBX
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: init:_5_size <- %RBX
	movl	$1, %edx
	movd	%rdx, %xmm0
	pslldq	$8, %xmm0               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7]
	movdqa	.LCPI3_0(%rip), %xmm1   # xmm1 = [2,3]
.Ltmp131:
	.p2align	4, 0x90
.LBB3_8:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movd	%rcx, %xmm2
	pshufd	$68, %xmm2, %xmm2       # xmm2 = xmm2[0,1,0,1]
.Ltmp132:
	.loc	1 36 6                  # CoinGame.c:36:6
	movdqu	(%r13,%rcx,8), %xmm3
	paddq	%xmm2, %xmm3
	movdqu	16(%r13,%rcx,8), %xmm4
	paddq	%xmm2, %xmm4
	.loc	1 38 8                  # CoinGame.c:38:8
	paddq	%xmm0, %xmm3
	paddq	%xmm1, %xmm4
	.loc	1 40 12                 # CoinGame.c:40:12
	movdqu	%xmm3, (%r13,%rcx,8)
	movdqu	%xmm4, 16(%r13,%rcx,8)
	.loc	1 36 6                  # CoinGame.c:36:6
	leaq	4(%rcx), %rdx
.Ltmp133:
	.loc	1 421 8                 # CoinGame.c:421:8
	movd	%rdx, %xmm2
	pshufd	$68, %xmm2, %xmm2       # xmm2 = xmm2[0,1,0,1]
.Ltmp134:
	.loc	1 36 6                  # CoinGame.c:36:6
	movdqu	32(%r13,%rcx,8), %xmm3
	paddq	%xmm2, %xmm3
	movdqu	48(%r13,%rcx,8), %xmm4
	paddq	%xmm2, %xmm4
	.loc	1 38 8                  # CoinGame.c:38:8
	paddq	%xmm0, %xmm3
	paddq	%xmm1, %xmm4
	.loc	1 40 12                 # CoinGame.c:40:12
	movdqu	%xmm3, 32(%r13,%rcx,8)
	movdqu	%xmm4, 48(%r13,%rcx,8)
	.loc	1 36 6                  # CoinGame.c:36:6
	addq	$8, %rcx
	cmpq	%rax, %rcx
	jne	.LBB3_8
.Ltmp135:
.LBB3_9:                                # %middle.block
	cmpq	%rax, %rbx
	.loc	1 421 8                 # CoinGame.c:421:8
	movq	%rax, %rcx
	je	.LBB3_11
	.p2align	4, 0x90
.LBB3_10:                               # %if.end7.i
                                        # =>This Inner Loop Header: Depth=1
.Ltmp136:
	.loc	1 40 12                 # CoinGame.c:40:12
	addq	%rcx, (%r13,%rcx,8)
.Ltmp137:
	#DEBUG_VALUE: init:_9 <- 1
	.loc	1 44 8                  # CoinGame.c:44:8
	incq	%rcx
.Ltmp138:
	#DEBUG_VALUE: init:_10 <- %RCX
	#DEBUG_VALUE: init:i <- %RCX
	.loc	1 34 6                  # CoinGame.c:34:6
	cmpq	%rcx, %rbx
	jne	.LBB3_10
.Ltmp139:
.LBB3_11:                               # %init.exit
	#DEBUG_VALUE: main:coins_size <- 0
	#DEBUG_VALUE: main:coins_has_ownership <- 1
	#DEBUG_VALUE: main:_11_has_ownership <- 0
	#DEBUG_VALUE: main:_12_size <- 0
	movq	%rbp, (%rsp)            # 8-byte Spill
	.loc	1 432 8                 # CoinGame.c:432:8
	xorl	%r14d, %r14d
	xorl	%edx, %edx
	movq	%r13, %rdi
	movq	%rbx, %rcx
	callq	findMoves
	movq	%rax, %r12
.Ltmp140:
	#DEBUG_VALUE: main:moves <- %R12
	#DEBUG_VALUE: main:_12 <- %R12
	#DEBUG_VALUE: main:_13 <- 1
	#DEBUG_VALUE: main:_12_has_ownership <- 0
	#DEBUG_VALUE: main:moves_has_ownership <- 1
	#DEBUG_VALUE: main:moves_size <- 0
	.loc	1 444 6                 # CoinGame.c:444:6
	movq	-8(%r12,%rbx,8), %rbp
.Ltmp141:
	#DEBUG_VALUE: getBobSum:_12 <- 0
	#DEBUG_VALUE: getBobSum:_11 <- 0
	#DEBUG_VALUE: getBobSum:_10 <- 0
	#DEBUG_VALUE: getBobSum:_9 <- 0
	#DEBUG_VALUE: getBobSum:_8 <- 0
	#DEBUG_VALUE: getBobSum:_7 <- 0
	#DEBUG_VALUE: getBobSum:_6 <- 0
	#DEBUG_VALUE: getBobSum:sum <- 0
	#DEBUG_VALUE: getBobSum:i <- 0
	#DEBUG_VALUE: getBobSum:_3 <- 0
	#DEBUG_VALUE: getBobSum:coins_has_ownership [bit_piece offset=0 size=1] <- 0
	#DEBUG_VALUE: getBobSum:sum_alice <- %RBP
	#DEBUG_VALUE: main:_15 <- %RBP
	#DEBUG_VALUE: main:sum_alice <- %RBP
	.loc	1 81 6                  # CoinGame.c:81:6
	testq	%rbx, %rbx
	jle	.LBB3_24
.Ltmp142:
# BB#12:                                # %if.end.i.preheader
	#DEBUG_VALUE: main:sum_alice <- %RBP
	#DEBUG_VALUE: main:_15 <- %RBP
	#DEBUG_VALUE: getBobSum:sum_alice <- %RBP
	#DEBUG_VALUE: main:_12 <- %R12
	#DEBUG_VALUE: main:moves <- %R12
	xorl	%ecx, %ecx
	.loc	1 83 6                  # CoinGame.c:83:6
	cmpq	$4, %rbx
	movl	$0, %r14d
	jb	.LBB3_22
.Ltmp143:
# BB#13:                                # %min.iters.checked299
	#DEBUG_VALUE: main:moves <- %R12
	#DEBUG_VALUE: main:_12 <- %R12
	#DEBUG_VALUE: getBobSum:sum_alice <- %RBP
	#DEBUG_VALUE: main:_15 <- %RBP
	#DEBUG_VALUE: main:sum_alice <- %RBP
	xorl	%ecx, %ecx
	movq	%rbx, %rax
	andq	$-4, %rax
	movl	$0, %r14d
	je	.LBB3_22
.Ltmp144:
# BB#14:                                # %vector.body295.preheader
	#DEBUG_VALUE: main:sum_alice <- %RBP
	#DEBUG_VALUE: main:_15 <- %RBP
	#DEBUG_VALUE: getBobSum:sum_alice <- %RBP
	#DEBUG_VALUE: main:_12 <- %R12
	#DEBUG_VALUE: main:moves <- %R12
	leaq	-4(%rax), %rcx
	movl	%ecx, %esi
	shrl	$2, %esi
	incl	%esi
	xorl	%edx, %edx
	andq	$3, %rsi
	je	.LBB3_15
.Ltmp145:
# BB#16:                                # %vector.body295.prol.preheader
	#DEBUG_VALUE: main:moves <- %R12
	#DEBUG_VALUE: main:_12 <- %R12
	#DEBUG_VALUE: getBobSum:sum_alice <- %RBP
	#DEBUG_VALUE: main:_15 <- %RBP
	#DEBUG_VALUE: main:sum_alice <- %RBP
	negq	%rsi
	pxor	%xmm0, %xmm0
	xorl	%edx, %edx
	pxor	%xmm1, %xmm1
.Ltmp146:
	.p2align	4, 0x90
.LBB3_17:                               # %vector.body295.prol
                                        # =>This Inner Loop Header: Depth=1
	movdqu	(%r13,%rdx,8), %xmm2
	movdqu	16(%r13,%rdx,8), %xmm3
	.loc	1 85 9                  # CoinGame.c:85:9
	paddq	%xmm2, %xmm0
	paddq	%xmm3, %xmm1
	.loc	1 83 6                  # CoinGame.c:83:6
	addq	$4, %rdx
	incq	%rsi
	jne	.LBB3_17
	jmp	.LBB3_18
.LBB3_15:
.Ltmp147:
	#DEBUG_VALUE: main:moves <- %R12
	#DEBUG_VALUE: main:_12 <- %R12
	#DEBUG_VALUE: getBobSum:sum_alice <- %RBP
	#DEBUG_VALUE: main:_15 <- %RBP
	#DEBUG_VALUE: main:sum_alice <- %RBP
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
.Ltmp148:
.LBB3_18:                               # %vector.body295.preheader.split
	cmpq	$12, %rcx
	jb	.LBB3_21
# BB#19:                                # %vector.body295.preheader.split.split
	movq	%rax, %rcx
	subq	%rdx, %rcx
	leaq	112(%r13,%rdx,8), %rdx
	.p2align	4, 0x90
.LBB3_20:                               # %vector.body295
                                        # =>This Inner Loop Header: Depth=1
	movdqu	-112(%rdx), %xmm2
	movdqu	-96(%rdx), %xmm3
	movdqu	-80(%rdx), %xmm4
	movdqu	-64(%rdx), %xmm5
	.loc	1 85 9                  # CoinGame.c:85:9
	paddq	%xmm0, %xmm2
	paddq	%xmm1, %xmm3
	paddq	%xmm4, %xmm2
	paddq	%xmm5, %xmm3
	.loc	1 83 6                  # CoinGame.c:83:6
	movdqu	-48(%rdx), %xmm4
	movdqu	-32(%rdx), %xmm5
	.loc	1 85 9                  # CoinGame.c:85:9
	paddq	%xmm2, %xmm4
	paddq	%xmm3, %xmm5
	.loc	1 83 6                  # CoinGame.c:83:6
	movdqu	-16(%rdx), %xmm0
	movdqu	(%rdx), %xmm1
	.loc	1 85 9                  # CoinGame.c:85:9
	paddq	%xmm4, %xmm0
	paddq	%xmm5, %xmm1
	.loc	1 83 6                  # CoinGame.c:83:6
	subq	$-128, %rdx
	addq	$-16, %rcx
	jne	.LBB3_20
.LBB3_21:                               # %middle.block296
	.loc	1 85 9                  # CoinGame.c:85:9
	paddq	%xmm0, %xmm1
	pshufd	$78, %xmm1, %xmm0       # xmm0 = xmm1[2,3,0,1]
	paddq	%xmm1, %xmm0
	movd	%xmm0, %r14
	cmpq	%rax, %rbx
	movq	%rax, %rcx
	je	.LBB3_24
.LBB3_22:                               # %if.end.i.preheader318
	.loc	1 83 6                  # CoinGame.c:83:6
	subq	%rcx, %rbx
	leaq	(%r13,%rcx,8), %rax
	.p2align	4, 0x90
.LBB3_23:                               # %if.end.i
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 85 9                  # CoinGame.c:85:9
	addq	(%rax), %r14
.Ltmp149:
	#DEBUG_VALUE: getBobSum:_10 <- 1
	#DEBUG_VALUE: getBobSum:_9 <- %R14
	#DEBUG_VALUE: getBobSum:sum <- %R14
	.loc	1 81 6                  # CoinGame.c:81:6
	addq	$8, %rax
	decq	%rbx
	jne	.LBB3_23
.Ltmp150:
.LBB3_24:                               # %getBobSum.exit
	.loc	1 100 9                 # CoinGame.c:100:9
	subq	%rbp, %r14
.Ltmp151:
	#DEBUG_VALUE: getBobSum:_12 <- %R14
	#DEBUG_VALUE: main:_16 <- %R14
	#DEBUG_VALUE: main:sum_bob <- %R14
	.loc	1 455 6                 # CoinGame.c:455:6
	cmpq	%r14, %rbp
	jge	.LBB3_25
.Ltmp152:
# BB#28:                                # %if.end22
	#DEBUG_VALUE: main:sum_bob <- %R14
	#DEBUG_VALUE: main:_16 <- %R14
	#DEBUG_VALUE: getBobSum:_12 <- %R14
	.loc	1 457 11                # CoinGame.c:457:11
	movq	stderr(%rip), %rcx
	.loc	1 457 3 is_stmt 0       # CoinGame.c:457:3
	movl	$.L.str, %edi
	movl	$4, %esi
	movl	$1, %edx
	callq	fwrite
	.loc	1 458 3 is_stmt 1       # CoinGame.c:458:3
	movl	$-1, %edi
	callq	exit
.Ltmp153:
.LBB3_25:                               # %if.then133
	#DEBUG_VALUE: main:sum_bob <- %R14
	#DEBUG_VALUE: main:_16 <- %R14
	#DEBUG_VALUE: getBobSum:_12 <- %R14
	#DEBUG_VALUE: main:_19_size <- 50
	.loc	1 467 2                 # CoinGame.c:467:2
	movl	$400, %edi              # imm = 0x190
	callq	malloc
	movq	%rax, %rbx
.Ltmp154:
	#DEBUG_VALUE: main:_19 <- %RBX
	.loc	1 468 9                 # CoinGame.c:468:9
	movaps	.LCPI3_1(%rip), %xmm0   # xmm0 = [84,104]
	movups	%xmm0, (%rbx)
	.loc	1 468 36 is_stmt 0      # CoinGame.c:468:36
	movaps	.LCPI3_2(%rip), %xmm0   # xmm0 = [101,32]
	movups	%xmm0, 16(%rbx)
	movaps	%xmm0, %xmm1
	.loc	1 468 63                # CoinGame.c:468:63
	movaps	.LCPI3_3(%rip), %xmm0   # xmm0 = [116,111]
	movups	%xmm0, 32(%rbx)
	.loc	1 468 91                # CoinGame.c:468:91
	movaps	.LCPI3_4(%rip), %xmm0   # xmm0 = [116,97]
	movups	%xmm0, 48(%rbx)
	.loc	1 468 118               # CoinGame.c:468:118
	movaps	.LCPI3_5(%rip), %xmm0   # xmm0 = [108,32]
	movups	%xmm0, 64(%rbx)
	.loc	1 468 146               # CoinGame.c:468:146
	movaps	.LCPI3_6(%rip), %xmm0   # xmm0 = [97,109]
	movups	%xmm0, 80(%rbx)
	.loc	1 468 175               # CoinGame.c:468:175
	movaps	.LCPI3_7(%rip), %xmm0   # xmm0 = [111,117]
	movups	%xmm0, 96(%rbx)
	.loc	1 468 205               # CoinGame.c:468:205
	movaps	.LCPI3_8(%rip), %xmm0   # xmm0 = [110,116]
	movups	%xmm0, 112(%rbx)
	.loc	1 468 235               # CoinGame.c:468:235
	movaps	.LCPI3_9(%rip), %xmm0   # xmm0 = [32,111]
	movups	%xmm0, 128(%rbx)
	.loc	1 468 264               # CoinGame.c:468:264
	movaps	.LCPI3_10(%rip), %xmm0  # xmm0 = [102,32]
	movups	%xmm0, 144(%rbx)
	.loc	1 468 293               # CoinGame.c:468:293
	movaps	.LCPI3_11(%rip), %xmm0  # xmm0 = [109,111]
	movups	%xmm0, 160(%rbx)
	.loc	1 468 323               # CoinGame.c:468:323
	movaps	.LCPI3_12(%rip), %xmm0  # xmm0 = [110,101]
	movups	%xmm0, 176(%rbx)
	.loc	1 468 353               # CoinGame.c:468:353
	movaps	.LCPI3_13(%rip), %xmm0  # xmm0 = [121,32]
	movups	%xmm0, 192(%rbx)
	.loc	1 468 382               # CoinGame.c:468:382
	movaps	.LCPI3_14(%rip), %xmm0  # xmm0 = [40,109]
	movups	%xmm0, 208(%rbx)
	.loc	1 468 411               # CoinGame.c:468:411
	movaps	.LCPI3_15(%rip), %xmm0  # xmm0 = [97,120]
	movups	%xmm0, 224(%rbx)
	.loc	1 468 440               # CoinGame.c:468:440
	movaps	.LCPI3_16(%rip), %xmm0  # xmm0 = [105,109]
	movups	%xmm0, 240(%rbx)
	.loc	1 468 470               # CoinGame.c:468:470
	movaps	.LCPI3_17(%rip), %xmm0  # xmm0 = [117,109]
	movups	%xmm0, 256(%rbx)
	.loc	1 468 500               # CoinGame.c:468:500
	movaps	.LCPI3_18(%rip), %xmm0  # xmm0 = [41,32]
	movups	%xmm0, 272(%rbx)
	.loc	1 468 528               # CoinGame.c:468:528
	movaps	.LCPI3_19(%rip), %xmm0  # xmm0 = [65,108]
	movups	%xmm0, 288(%rbx)
	.loc	1 468 557               # CoinGame.c:468:557
	movaps	.LCPI3_20(%rip), %xmm0  # xmm0 = [105,99]
	movups	%xmm0, 304(%rbx)
	.loc	1 468 586               # CoinGame.c:468:586
	movups	%xmm1, 320(%rbx)
	.loc	1 468 615               # CoinGame.c:468:615
	movaps	.LCPI3_21(%rip), %xmm0  # xmm0 = [103,101]
	movups	%xmm0, 336(%rbx)
	.loc	1 468 645               # CoinGame.c:468:645
	movaps	.LCPI3_22(%rip), %xmm0  # xmm0 = [116,115]
	movups	%xmm0, 352(%rbx)
	.loc	1 468 675               # CoinGame.c:468:675
	movaps	.LCPI3_23(%rip), %xmm0  # xmm0 = [32,105]
	movups	%xmm0, 368(%rbx)
	.loc	1 468 704               # CoinGame.c:468:704
	movaps	.LCPI3_24(%rip), %xmm0  # xmm0 = [115,32]
	movups	%xmm0, 384(%rbx)
.Ltmp155:
	#DEBUG_VALUE: main:_19_has_ownership <- 1
	.loc	1 471 2 is_stmt 1       # CoinGame.c:471:2
	movl	$50, %esi
	movq	%rbx, %rdi
	callq	printf_s
	.loc	1 475 2                 # CoinGame.c:475:2
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%rbp, %rsi
	callq	printf
.Ltmp156:
	#DEBUG_VALUE: main:_24_size <- 48
	.loc	1 480 2                 # CoinGame.c:480:2
	movl	$384, %edi              # imm = 0x180
	callq	malloc
	movq	%rax, %rbp
.Ltmp157:
	#DEBUG_VALUE: main:_24 <- %RBP
	.loc	1 468 9                 # CoinGame.c:468:9
	movaps	.LCPI3_1(%rip), %xmm0   # xmm0 = [84,104]
	.loc	1 481 9                 # CoinGame.c:481:9
	movups	%xmm0, (%rbp)
	.loc	1 468 36                # CoinGame.c:468:36
	movaps	.LCPI3_2(%rip), %xmm0   # xmm0 = [101,32]
	.loc	1 481 36                # CoinGame.c:481:36
	movups	%xmm0, 16(%rbp)
	.loc	1 468 63                # CoinGame.c:468:63
	movaps	.LCPI3_3(%rip), %xmm0   # xmm0 = [116,111]
	.loc	1 481 63                # CoinGame.c:481:63
	movups	%xmm0, 32(%rbp)
	.loc	1 468 91                # CoinGame.c:468:91
	movaps	.LCPI3_4(%rip), %xmm0   # xmm0 = [116,97]
	.loc	1 481 91                # CoinGame.c:481:91
	movups	%xmm0, 48(%rbp)
	.loc	1 468 118               # CoinGame.c:468:118
	movaps	.LCPI3_5(%rip), %xmm0   # xmm0 = [108,32]
	.loc	1 481 118               # CoinGame.c:481:118
	movups	%xmm0, 64(%rbp)
	.loc	1 468 146               # CoinGame.c:468:146
	movaps	.LCPI3_6(%rip), %xmm0   # xmm0 = [97,109]
	.loc	1 481 146               # CoinGame.c:481:146
	movups	%xmm0, 80(%rbp)
	.loc	1 468 175               # CoinGame.c:468:175
	movaps	.LCPI3_7(%rip), %xmm0   # xmm0 = [111,117]
	.loc	1 481 175               # CoinGame.c:481:175
	movups	%xmm0, 96(%rbp)
	.loc	1 468 205               # CoinGame.c:468:205
	movaps	.LCPI3_8(%rip), %xmm0   # xmm0 = [110,116]
	.loc	1 481 205               # CoinGame.c:481:205
	movups	%xmm0, 112(%rbp)
	.loc	1 468 235               # CoinGame.c:468:235
	movaps	.LCPI3_9(%rip), %xmm0   # xmm0 = [32,111]
	.loc	1 481 235               # CoinGame.c:481:235
	movups	%xmm0, 128(%rbp)
	.loc	1 468 264               # CoinGame.c:468:264
	movaps	.LCPI3_10(%rip), %xmm0  # xmm0 = [102,32]
	.loc	1 481 264               # CoinGame.c:481:264
	movups	%xmm0, 144(%rbp)
	.loc	1 468 293               # CoinGame.c:468:293
	movaps	.LCPI3_11(%rip), %xmm0  # xmm0 = [109,111]
	.loc	1 481 293               # CoinGame.c:481:293
	movups	%xmm0, 160(%rbp)
	.loc	1 468 323               # CoinGame.c:468:323
	movaps	.LCPI3_12(%rip), %xmm0  # xmm0 = [110,101]
	.loc	1 481 323               # CoinGame.c:481:323
	movups	%xmm0, 176(%rbp)
	.loc	1 468 353               # CoinGame.c:468:353
	movaps	.LCPI3_13(%rip), %xmm0  # xmm0 = [121,32]
	.loc	1 481 353               # CoinGame.c:481:353
	movups	%xmm0, 192(%rbp)
	.loc	1 468 382               # CoinGame.c:468:382
	movaps	.LCPI3_14(%rip), %xmm0  # xmm0 = [40,109]
	.loc	1 481 382               # CoinGame.c:481:382
	movups	%xmm0, 208(%rbp)
	.loc	1 468 411               # CoinGame.c:468:411
	movaps	.LCPI3_15(%rip), %xmm0  # xmm0 = [97,120]
	.loc	1 481 411               # CoinGame.c:481:411
	movups	%xmm0, 224(%rbp)
	.loc	1 468 440               # CoinGame.c:468:440
	movaps	.LCPI3_16(%rip), %xmm0  # xmm0 = [105,109]
	.loc	1 481 440               # CoinGame.c:481:440
	movups	%xmm0, 240(%rbp)
	.loc	1 468 470               # CoinGame.c:468:470
	movaps	.LCPI3_17(%rip), %xmm0  # xmm0 = [117,109]
	.loc	1 481 470               # CoinGame.c:481:470
	movups	%xmm0, 256(%rbp)
	.loc	1 468 500               # CoinGame.c:468:500
	movaps	.LCPI3_18(%rip), %xmm0  # xmm0 = [41,32]
	.loc	1 481 500               # CoinGame.c:481:500
	movups	%xmm0, 272(%rbp)
	.loc	1 481 528 is_stmt 0     # CoinGame.c:481:528
	movaps	.LCPI3_25(%rip), %xmm0  # xmm0 = [66,111]
	movups	%xmm0, 288(%rbp)
	.loc	1 481 557               # CoinGame.c:481:557
	movaps	.LCPI3_26(%rip), %xmm0  # xmm0 = [98,32]
	movups	%xmm0, 304(%rbp)
	.loc	1 468 615 is_stmt 1     # CoinGame.c:468:615
	movaps	.LCPI3_21(%rip), %xmm0  # xmm0 = [103,101]
	.loc	1 481 585               # CoinGame.c:481:585
	movups	%xmm0, 320(%rbp)
	.loc	1 468 645               # CoinGame.c:468:645
	movaps	.LCPI3_22(%rip), %xmm0  # xmm0 = [116,115]
	.loc	1 481 615               # CoinGame.c:481:615
	movups	%xmm0, 336(%rbp)
	.loc	1 468 675               # CoinGame.c:468:675
	movaps	.LCPI3_23(%rip), %xmm0  # xmm0 = [32,105]
	.loc	1 481 645               # CoinGame.c:481:645
	movups	%xmm0, 352(%rbp)
	.loc	1 468 704               # CoinGame.c:468:704
	movaps	.LCPI3_24(%rip), %xmm0  # xmm0 = [115,32]
	.loc	1 481 674               # CoinGame.c:481:674
	movups	%xmm0, 368(%rbp)
.Ltmp158:
	#DEBUG_VALUE: main:_24_has_ownership <- 1
	.loc	1 484 2                 # CoinGame.c:484:2
	movl	$48, %esi
	movq	%rbp, %rdi
	callq	printf_s
	.loc	1 488 2                 # CoinGame.c:488:2
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%r14, %rsi
	callq	printf
.Ltmp159:
	.loc	1 492 2 discriminator 1 # CoinGame.c:492:2
	movq	%r13, %rdi
	callq	free
.Ltmp160:
	#DEBUG_VALUE: main:coins_has_ownership <- 0
	.loc	1 493 2 discriminator 1 # CoinGame.c:493:2
	movq	%r12, %rdi
	callq	free
.Ltmp161:
	#DEBUG_VALUE: main:moves_has_ownership <- 0
	.loc	1 494 2 discriminator 1 # CoinGame.c:494:2
	movq	%r15, %rdi
	movq	(%rsp), %rsi            # 8-byte Reload
	callq	free2DArray
.Ltmp162:
	#DEBUG_VALUE: main:_8_has_ownership <- 0
	.loc	1 498 2 discriminator 1 # CoinGame.c:498:2
	movq	%rbx, %rdi
	callq	free
.Ltmp163:
	#DEBUG_VALUE: main:_19_has_ownership <- 0
	.loc	1 499 2 discriminator 1 # CoinGame.c:499:2
	movq	%rbp, %rdi
	callq	free
.Ltmp164:
	#DEBUG_VALUE: main:_24_has_ownership <- 0
	.loc	1 500 2                 # CoinGame.c:500:2
	xorl	%edi, %edi
	callq	exit
.Ltmp165:
.LBB3_26:                               # %if.end155.critedge
	#DEBUG_VALUE: main:_7 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_8_size <- %EBX
	#DEBUG_VALUE: main:_8 <- %R15
	.loc	1 494 2 discriminator 1 # CoinGame.c:494:2
	movq	%r15, %rdi
	movq	%rbp, %rsi
	callq	free2DArray
.Ltmp166:
	#DEBUG_VALUE: main:_8_has_ownership <- 0
	.loc	1 500 2                 # CoinGame.c:500:2
	xorl	%edi, %edi
	callq	exit
.Ltmp167:
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
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
	.asciz	"_5"                    # string offset=371
.Linfo_string21:
	.asciz	"coins"                 # string offset=374
.Linfo_string22:
	.asciz	"_1"                    # string offset=380
.Linfo_string23:
	.asciz	"getBobSum"             # string offset=383
.Linfo_string24:
	.asciz	"sum_alice"             # string offset=393
.Linfo_string25:
	.asciz	"_12"                   # string offset=403
.Linfo_string26:
	.asciz	"_11"                   # string offset=407
.Linfo_string27:
	.asciz	"sum"                   # string offset=411
.Linfo_string28:
	.asciz	"_3"                    # string offset=415
.Linfo_string29:
	.asciz	"findMoves"             # string offset=418
.Linfo_string30:
	.asciz	"main"                  # string offset=428
.Linfo_string31:
	.asciz	"int"                   # string offset=433
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
	.asciz	"_24_has_ownership"     # string offset=754
.Linfo_string99:
	.asciz	"_24_size"              # string offset=772
.Linfo_string100:
	.asciz	"_19_has_ownership"     # string offset=781
.Linfo_string101:
	.asciz	"_19_size"              # string offset=799
.Linfo_string102:
	.asciz	"_11_has_ownership"     # string offset=808
.Linfo_string103:
	.asciz	"_11_size"              # string offset=826
.Linfo_string104:
	.asciz	"_10_has_ownership"     # string offset=835
.Linfo_string105:
	.asciz	"_10_size"              # string offset=853
.Linfo_string106:
	.asciz	"_8_has_ownership"      # string offset=862
.Linfo_string107:
	.asciz	"_8_size_size"          # string offset=879
.Linfo_string108:
	.asciz	"_8_size"               # string offset=892
.Linfo_string109:
	.asciz	"sum_bob"               # string offset=900
.Linfo_string110:
	.asciz	"max"                   # string offset=908
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp3-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp3-.Lfunc_begin0
	.quad	.Ltmp11-.Lfunc_begin0
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
	.quad	.Ltmp13-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Ltmp3-.Lfunc_begin0
	.quad	.Ltmp12-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp12-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Ltmp3-.Lfunc_begin0
	.quad	.Ltmp13-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
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
	.quad	.Ltmp11-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Ltmp4-.Lfunc_begin0
	.quad	.Ltmp11-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp25-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp26-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp25-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp26-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp21-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp18-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	82                      # super-register DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp25-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	82                      # super-register DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	1                       # 1
	.quad	.Ltmp26-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	82                      # super-register DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	1                       # 1
	.quad	.Ltmp32-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp25-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	.Ltmp26-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp28-.Lfunc_begin0
	.quad	.Ltmp29-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp28-.Lfunc_begin0
	.quad	.Ltmp29-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp28-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp30-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp30-.Lfunc_begin0
	.quad	.Ltmp33-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	.Ltmp71-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	81                      # super-register DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	5                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	20                      # 20
	.byte	157                     # DW_OP_bit_piece
	.byte	1                       # 1
	.byte	0                       # 0
	.quad	.Ltmp98-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp71-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp95-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp95-.Lfunc_begin0
	.quad	.Ltmp96-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc23:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp94-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp93-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp93-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp93-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp93-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp90-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp90-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp96-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp83-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp81-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc33:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp80-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc34:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp78-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc35:
	.quad	.Ltmp50-.Lfunc_begin0
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
.Ldebug_loc36:
	.quad	.Ltmp50-.Lfunc_begin0
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
.Ldebug_loc37:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc38:
	.quad	.Ltmp50-.Lfunc_begin0
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
.Ldebug_loc39:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp71-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc40:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp71-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc41:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc42:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc43:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp78-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc44:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp95-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp95-.Lfunc_begin0
	.quad	.Ltmp96-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc45:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc46:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp71-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc47:
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
	.quad	.Ltmp71-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
	.quad	0
	.quad	0
.Ldebug_loc48:
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
	.quad	.Ltmp71-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
	.quad	0
	.quad	0
.Ldebug_loc49:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp113-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp116-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc50:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp114-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc51:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp158-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp158-.Lfunc_begin0
	.quad	.Ltmp164-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp164-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc52:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp156-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp156-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	48                      # 48
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc53:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp155-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp155-.Lfunc_begin0
	.quad	.Ltmp163-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp163-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc54:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp153-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp153-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	50                      # 50
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc55:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp151-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp151-.Lfunc_begin0
	.quad	.Ltmp165-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc56:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp141-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp146-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp147-.Lfunc_begin0
	.quad	.Ltmp148-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc57:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp140-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp140-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc58:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp117-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp117-.Lfunc_begin0
	.quad	.Ltmp162-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp162-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc59:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp117-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp117-.Lfunc_begin0
	.quad	.Ltmp122-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp165-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc60:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp151-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp151-.Lfunc_begin0
	.quad	.Ltmp165-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc61:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp141-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp146-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp147-.Lfunc_begin0
	.quad	.Ltmp148-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc62:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp140-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp140-.Lfunc_begin0
	.quad	.Ltmp161-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp161-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc63:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp139-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp139-.Lfunc_begin0
	.quad	.Ltmp160-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp160-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc64:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp122-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp122-.Lfunc_begin0
	.quad	.Ltmp131-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc65:
	.quad	.Ltmp115-.Lfunc_begin0
	.quad	.Ltmp131-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp165-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc66:
	.quad	.Ltmp118-.Lfunc_begin0
	.quad	.Ltmp119-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc67:
	.quad	.Ltmp119-.Lfunc_begin0
	.quad	.Ltmp123-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp165-.Lfunc_begin0
	.quad	.Ltmp166-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc68:
	.quad	.Ltmp119-.Lfunc_begin0
	.quad	.Ltmp123-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp165-.Lfunc_begin0
	.quad	.Ltmp166-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc69:
	.quad	.Ltmp122-.Lfunc_begin0
	.quad	.Ltmp138-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp138-.Lfunc_begin0
	.quad	.Ltmp139-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc70:
	.quad	.Ltmp122-.Lfunc_begin0
	.quad	.Ltmp137-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp137-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc71:
	.quad	.Ltmp122-.Lfunc_begin0
	.quad	.Ltmp131-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc72:
	.quad	.Ltmp122-.Lfunc_begin0
	.quad	.Ltmp138-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp138-.Lfunc_begin0
	.quad	.Ltmp139-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc73:
	.quad	.Ltmp122-.Lfunc_begin0
	.quad	.Ltmp124-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp124-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc74:
	.quad	.Ltmp122-.Lfunc_begin0
	.quad	.Ltmp131-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc75:
	.quad	.Ltmp122-.Lfunc_begin0
	.quad	.Ltmp131-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc76:
	.quad	.Ltmp124-.Lfunc_begin0
	.quad	.Ltmp131-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc77:
	.quad	.Ltmp124-.Lfunc_begin0
	.quad	.Ltmp131-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc78:
	.quad	.Ltmp124-.Lfunc_begin0
	.quad	.Ltmp131-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc79:
	.quad	.Ltmp124-.Lfunc_begin0
	.quad	.Ltmp131-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc80:
	.quad	.Ltmp124-.Lfunc_begin0
	.quad	.Ltmp131-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc81:
	.quad	.Ltmp140-.Lfunc_begin0
	.quad	.Ltmp146-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	.Ltmp147-.Lfunc_begin0
	.quad	.Ltmp148-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc82:
	.quad	.Ltmp140-.Lfunc_begin0
	.quad	.Ltmp146-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	.Ltmp147-.Lfunc_begin0
	.quad	.Ltmp148-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc83:
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp151-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp151-.Lfunc_begin0
	.quad	.Ltmp165-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc84:
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp149-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp149-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc85:
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp149-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp149-.Lfunc_begin0
	.quad	.Ltmp150-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc86:
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp149-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp149-.Lfunc_begin0
	.quad	.Ltmp150-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc87:
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp146-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp147-.Lfunc_begin0
	.quad	.Ltmp148-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc88:
	.quad	.Ltmp154-.Lfunc_begin0
	.quad	.Ltmp165-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc89:
	.quad	.Ltmp157-.Lfunc_begin0
	.quad	.Ltmp165-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
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
	.byte	85                      # DW_AT_ranges
	.byte	23                      # DW_FORM_sec_offset
	.byte	88                      # DW_AT_call_file
	.byte	11                      # DW_FORM_data1
	.byte	89                      # DW_AT_call_line
	.byte	5                       # DW_FORM_data2
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	26                      # Abbreviation Code
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
	.byte	27                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	2620                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0xa35 DW_TAG_compile_unit
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
	.long	1298                    # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x3e:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	1310                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x47:0x9 DW_TAG_variable
	.long	.Ldebug_loc1            # DW_AT_location
	.long	1387                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x50:0x9 DW_TAG_variable
	.long	.Ldebug_loc2            # DW_AT_location
	.long	1453                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x59:0x9 DW_TAG_variable
	.long	.Ldebug_loc3            # DW_AT_location
	.long	1321                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x62:0x9 DW_TAG_variable
	.long	.Ldebug_loc4            # DW_AT_location
	.long	1332                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x6b:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1343                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x71:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1354                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x77:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1365                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x7d:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1376                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x83:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1398                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x89:0x9 DW_TAG_variable
	.long	.Ldebug_loc5            # DW_AT_location
	.long	1409                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x92:0x9 DW_TAG_variable
	.long	.Ldebug_loc6            # DW_AT_location
	.long	1420                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x9b:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1431                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xa1:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1442                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0xa7:0x9 DW_TAG_variable
	.long	.Ldebug_loc7            # DW_AT_location
	.long	1464                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0xb0:0x9 DW_TAG_variable
	.long	.Ldebug_loc8            # DW_AT_location
	.long	1475                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0xb9:0x5 DW_TAG_variable
	.long	1486                    # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	3                       # Abbrev [3] 0xbf:0x89 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	1517                    # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0xd2:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc9            # DW_AT_location
	.long	1529                    # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0xdb:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc10           # DW_AT_location
	.long	1540                    # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0xe4:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc11           # DW_AT_location
	.long	1551                    # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0xed:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc12           # DW_AT_location
	.long	1562                    # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0xf6:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc13           # DW_AT_location
	.long	1573                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xff:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1683                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x105:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1672                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x10b:0x9 DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	1661                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x114:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1650                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x11a:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1639                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x120:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1628                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x126:0x9 DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	1617                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x12f:0x9 DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	1606                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x138:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1595                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x13e:0x9 DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	1584                    # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0x148:0x3ca DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	107                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1498                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	10                      # Abbrev [10] 0x161:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	107                     # DW_AT_decl_line
	.long	1498                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x170:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	107                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x17f:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	107                     # DW_AT_decl_line
	.long	1510                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x18e:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	107                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x19d:0xf DW_TAG_variable
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	171                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1ac:0xf DW_TAG_variable
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	170                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1bb:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	169                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1c7:0xf DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	168                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1d6:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	167                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1e2:0xf DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	166                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1f1:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	165                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1fd:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	164                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x209:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	163                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x215:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	162                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x221:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	161                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x22d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	160                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x239:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	159                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x245:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	158                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x251:0xf DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	157                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x260:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	156                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x26c:0xf DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	155                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x27b:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	154                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x287:0xf DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	153                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x296:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	152                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x2a2:0xf DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	151                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x2b1:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	150                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x2bd:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	149                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x2c9:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	148                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x2d5:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	147                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x2e1:0xf DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	146                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x2f0:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	145                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x2fc:0xf DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	144                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x30b:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	143                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x317:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	142                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x323:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	141                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x32f:0xf DW_TAG_variable
	.long	.Ldebug_loc32           # DW_AT_location
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	140                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x33e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	139                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x34a:0xf DW_TAG_variable
	.long	.Ldebug_loc33           # DW_AT_location
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	138                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x359:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string66         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	137                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x365:0xf DW_TAG_variable
	.long	.Ldebug_loc34           # DW_AT_location
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	136                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x374:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	135                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x380:0xf DW_TAG_variable
	.long	.Ldebug_loc35           # DW_AT_location
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	134                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x38f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	133                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x39b:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	132                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x3a7:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	131                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x3b3:0xf DW_TAG_variable
	.long	.Ldebug_loc36           # DW_AT_location
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	130                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x3c2:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	129                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x3ce:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string75         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	128                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x3da:0xf DW_TAG_variable
	.long	.Ldebug_loc37           # DW_AT_location
	.long	.Linfo_string76         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	127                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x3e9:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string77         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	126                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x3f5:0xf DW_TAG_variable
	.long	.Ldebug_loc38           # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	125                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x404:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	124                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x410:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string80         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	123                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x41c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string81         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	122                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x428:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string82         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	121                     # DW_AT_decl_line
	.long	1510                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x434:0xf DW_TAG_variable
	.long	.Ldebug_loc39           # DW_AT_location
	.long	.Linfo_string83         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	120                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x443:0xf DW_TAG_variable
	.long	.Ldebug_loc40           # DW_AT_location
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	119                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x452:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	118                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x45e:0xf DW_TAG_variable
	.long	.Ldebug_loc41           # DW_AT_location
	.long	.Linfo_string84         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	117                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x46d:0xf DW_TAG_variable
	.long	.Ldebug_loc42           # DW_AT_location
	.long	.Linfo_string85         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	116                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x47c:0xf DW_TAG_variable
	.long	.Ldebug_loc43           # DW_AT_location
	.long	.Linfo_string86         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	115                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x48b:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	114                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x497:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string87         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	113                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x4a3:0xf DW_TAG_variable
	.long	.Ldebug_loc44           # DW_AT_location
	.long	.Linfo_string88         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	112                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x4b2:0xf DW_TAG_variable
	.long	.Ldebug_loc45           # DW_AT_location
	.long	.Linfo_string89         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	111                     # DW_AT_decl_line
	.long	1510                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x4c1:0xf DW_TAG_variable
	.long	.Ldebug_loc46           # DW_AT_location
	.long	.Linfo_string90         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	110                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x4d0:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string91         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	109                     # DW_AT_decl_line
	.long	1510                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x4dc:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string92         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	108                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x4e8:0xf DW_TAG_variable
	.long	.Ldebug_loc47           # DW_AT_location
	.long	.Linfo_string93         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	110                     # DW_AT_decl_line
	.long	1498                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x4f7:0xf DW_TAG_variable
	.long	.Ldebug_loc48           # DW_AT_location
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	120                     # DW_AT_decl_line
	.long	1498                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x506:0xb DW_TAG_variable
	.long	.Linfo_string94         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	108                     # DW_AT_decl_line
	.long	1498                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	15                      # Abbrev [15] 0x512:0xc8 DW_TAG_subprogram
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1498                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	16                      # Abbrev [16] 0x51e:0xb DW_TAG_formal_parameter
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x529:0xb DW_TAG_variable
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x534:0xb DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x53f:0xb DW_TAG_variable
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x54a:0xb DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x555:0xb DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x560:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.long	1510                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x56b:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x576:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x581:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x58c:0xb DW_TAG_variable
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	1510                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x597:0xb DW_TAG_variable
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	1510                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x5a2:0xb DW_TAG_variable
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x5ad:0xb DW_TAG_variable
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x5b8:0xb DW_TAG_variable
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	1498                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x5c3:0xb DW_TAG_variable
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	1498                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x5ce:0xb DW_TAG_variable
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	1498                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x5da:0x5 DW_TAG_pointer_type
	.long	1503                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x5df:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	18                      # Abbrev [18] 0x5e6:0x7 DW_TAG_base_type
	.long	.Linfo_string12         # DW_AT_name
	.byte	2                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	15                      # Abbrev [15] 0x5ed:0xb2 DW_TAG_subprogram
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1503                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	16                      # Abbrev [16] 0x5f9:0xb DW_TAG_formal_parameter
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	16                      # Abbrev [16] 0x604:0xb DW_TAG_formal_parameter
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	1498                    # DW_AT_type
	.byte	16                      # Abbrev [16] 0x60f:0xb DW_TAG_formal_parameter
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	16                      # Abbrev [16] 0x61a:0xb DW_TAG_formal_parameter
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	1510                    # DW_AT_type
	.byte	16                      # Abbrev [16] 0x625:0xb DW_TAG_formal_parameter
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x630:0xb DW_TAG_variable
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	69                      # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x63b:0xb DW_TAG_variable
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	68                      # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x646:0xb DW_TAG_variable
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	67                      # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x651:0xb DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	66                      # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x65c:0xb DW_TAG_variable
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	65                      # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x667:0xb DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x672:0xb DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x67d:0xb DW_TAG_variable
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x688:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	61                      # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x693:0xb DW_TAG_variable
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	60                      # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	19                      # Abbrev [19] 0x69f:0x383 DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	373                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	2594                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	20                      # Abbrev [20] 0x6b9:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc49           # DW_AT_location
	.long	.Linfo_string95         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	373                     # DW_AT_decl_line
	.long	2594                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x6c9:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc50           # DW_AT_location
	.long	.Linfo_string96         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	373                     # DW_AT_decl_line
	.long	2601                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x6d9:0x10 DW_TAG_variable
	.long	.Ldebug_loc51           # DW_AT_location
	.long	.Linfo_string98         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	402                     # DW_AT_decl_line
	.long	1510                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x6e9:0x10 DW_TAG_variable
	.long	.Ldebug_loc52           # DW_AT_location
	.long	.Linfo_string99         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	401                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x6f9:0x10 DW_TAG_variable
	.long	.Ldebug_loc53           # DW_AT_location
	.long	.Linfo_string100        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	398                     # DW_AT_decl_line
	.long	1510                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x709:0x10 DW_TAG_variable
	.long	.Ldebug_loc54           # DW_AT_location
	.long	.Linfo_string101        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	397                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x719:0x10 DW_TAG_variable
	.long	.Ldebug_loc55           # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	395                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x729:0x10 DW_TAG_variable
	.long	.Ldebug_loc56           # DW_AT_location
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	394                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x739:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string80         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	393                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x746:0x10 DW_TAG_variable
	.long	.Ldebug_loc57           # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	392                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x756:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string82         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	391                     # DW_AT_decl_line
	.long	1510                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x763:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string83         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	390                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x770:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string102        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	389                     # DW_AT_decl_line
	.long	1510                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x77d:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string103        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	388                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x78a:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string104        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	387                     # DW_AT_decl_line
	.long	1510                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x797:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string105        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	386                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x7a4:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	385                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x7b1:0x10 DW_TAG_variable
	.long	.Ldebug_loc58           # DW_AT_location
	.long	.Linfo_string106        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	384                     # DW_AT_decl_line
	.long	1510                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x7c1:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string107        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	383                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x7ce:0x10 DW_TAG_variable
	.long	.Ldebug_loc59           # DW_AT_location
	.long	.Linfo_string108        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	383                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x7de:0x10 DW_TAG_variable
	.long	.Ldebug_loc60           # DW_AT_location
	.long	.Linfo_string109        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	381                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x7ee:0x10 DW_TAG_variable
	.long	.Ldebug_loc61           # DW_AT_location
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	380                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x7fe:0x10 DW_TAG_variable
	.long	.Ldebug_loc62           # DW_AT_location
	.long	.Linfo_string89         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	379                     # DW_AT_decl_line
	.long	1510                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x80e:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string90         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	378                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x81b:0x10 DW_TAG_variable
	.long	.Ldebug_loc63           # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	377                     # DW_AT_decl_line
	.long	1510                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x82b:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	376                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x838:0x10 DW_TAG_variable
	.long	.Ldebug_loc64           # DW_AT_location
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	375                     # DW_AT_decl_line
	.long	1503                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x848:0x10 DW_TAG_variable
	.long	.Ldebug_loc65           # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	383                     # DW_AT_decl_line
	.long	2618                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x858:0x10 DW_TAG_variable
	.long	.Ldebug_loc66           # DW_AT_location
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	386                     # DW_AT_decl_line
	.long	1498                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x868:0x10 DW_TAG_variable
	.long	.Ldebug_loc67           # DW_AT_location
	.long	.Linfo_string110        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	374                     # DW_AT_decl_line
	.long	1498                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x878:0x10 DW_TAG_variable
	.long	.Ldebug_loc68           # DW_AT_location
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	382                     # DW_AT_decl_line
	.long	1498                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x888:0x10 DW_TAG_variable
	.long	.Ldebug_loc78           # DW_AT_location
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	388                     # DW_AT_decl_line
	.long	1498                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x898:0x10 DW_TAG_variable
	.long	.Ldebug_loc79           # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	376                     # DW_AT_decl_line
	.long	1498                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x8a8:0x10 DW_TAG_variable
	.long	.Ldebug_loc81           # DW_AT_location
	.long	.Linfo_string93         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	378                     # DW_AT_decl_line
	.long	1498                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x8b8:0x10 DW_TAG_variable
	.long	.Ldebug_loc82           # DW_AT_location
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	390                     # DW_AT_decl_line
	.long	1498                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x8c8:0x10 DW_TAG_variable
	.long	.Ldebug_loc88           # DW_AT_location
	.long	.Linfo_string75         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	397                     # DW_AT_decl_line
	.long	1498                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x8d8:0x10 DW_TAG_variable
	.long	.Ldebug_loc89           # DW_AT_location
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	401                     # DW_AT_decl_line
	.long	1498                    # DW_AT_type
	.byte	24                      # Abbrev [24] 0x8e8:0xc DW_TAG_variable
	.long	.Linfo_string77         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	396                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	24                      # Abbrev [24] 0x8f4:0xc DW_TAG_variable
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	399                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	24                      # Abbrev [24] 0x900:0xc DW_TAG_variable
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	400                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	24                      # Abbrev [24] 0x90c:0xc DW_TAG_variable
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	403                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	25                      # Abbrev [25] 0x918:0x85 DW_TAG_inlined_subroutine
	.long	1298                    # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.short	421                     # DW_AT_call_line
	.byte	4                       # Abbrev [4] 0x924:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc74           # DW_AT_location
	.long	1310                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x92d:0x9 DW_TAG_variable
	.long	.Ldebug_loc69           # DW_AT_location
	.long	1321                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x936:0x9 DW_TAG_variable
	.long	.Ldebug_loc70           # DW_AT_location
	.long	1332                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x93f:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1343                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x945:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1354                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x94b:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1365                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x951:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1376                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x957:0x9 DW_TAG_variable
	.long	.Ldebug_loc71           # DW_AT_location
	.long	1387                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x960:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1398                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x966:0x9 DW_TAG_variable
	.long	.Ldebug_loc72           # DW_AT_location
	.long	1409                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x96f:0x9 DW_TAG_variable
	.long	.Ldebug_loc73           # DW_AT_location
	.long	1420                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x978:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1431                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x97e:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1442                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x984:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1453                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x98a:0x9 DW_TAG_variable
	.long	.Ldebug_loc76           # DW_AT_location
	.long	1464                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x993:0x9 DW_TAG_variable
	.long	.Ldebug_loc77           # DW_AT_location
	.long	1475                    # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	26                      # Abbrev [26] 0x99d:0x84 DW_TAG_inlined_subroutine
	.long	1517                    # DW_AT_abstract_origin
	.quad	.Ltmp141                # DW_AT_low_pc
	.long	.Ltmp151-.Ltmp141       # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.short	449                     # DW_AT_call_line
	.byte	4                       # Abbrev [4] 0x9b1:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc87           # DW_AT_location
	.long	1529                    # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x9ba:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc80           # DW_AT_location
	.long	1540                    # DW_AT_abstract_origin
	.byte	27                      # Abbrev [27] 0x9c3:0xc DW_TAG_formal_parameter
	.byte	6                       # DW_AT_location
	.byte	16
	.byte	0
	.byte	159
	.byte	157
	.byte	1
	.byte	0
	.long	1562                    # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x9cf:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc75           # DW_AT_location
	.long	1573                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x9d8:0x9 DW_TAG_variable
	.long	.Ldebug_loc83           # DW_AT_location
	.long	1584                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x9e1:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1595                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x9e7:0x9 DW_TAG_variable
	.long	.Ldebug_loc84           # DW_AT_location
	.long	1606                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x9f0:0x9 DW_TAG_variable
	.long	.Ldebug_loc85           # DW_AT_location
	.long	1617                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x9f9:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1628                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x9ff:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1639                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xa05:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1650                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0xa0b:0x9 DW_TAG_variable
	.long	.Ldebug_loc86           # DW_AT_location
	.long	1661                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xa14:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1672                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xa1a:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1683                    # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	18                      # Abbrev [18] 0xa22:0x7 DW_TAG_base_type
	.long	.Linfo_string31         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	17                      # Abbrev [17] 0xa29:0x5 DW_TAG_pointer_type
	.long	2606                    # DW_AT_type
	.byte	17                      # Abbrev [17] 0xa2e:0x5 DW_TAG_pointer_type
	.long	2611                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0xa33:0x7 DW_TAG_base_type
	.long	.Linfo_string97         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	17                      # Abbrev [17] 0xa3a:0x5 DW_TAG_pointer_type
	.long	1498                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp122-.Lfunc_begin0
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp128-.Lfunc_begin0
	.quad	.Ltmp129-.Lfunc_begin0
	.quad	.Ltmp132-.Lfunc_begin0
	.quad	.Ltmp133-.Lfunc_begin0
	.quad	.Ltmp134-.Lfunc_begin0
	.quad	.Ltmp135-.Lfunc_begin0
	.quad	.Ltmp136-.Lfunc_begin0
	.quad	.Ltmp139-.Lfunc_begin0
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
	.long	2624                    # Compilation Unit Length
	.long	1298                    # DIE offset
	.asciz	"init"                  # External Name
	.long	1695                    # DIE offset
	.asciz	"main"                  # External Name
	.long	1517                    # DIE offset
	.asciz	"getBobSum"             # External Name
	.long	328                     # DIE offset
	.asciz	"findMoves"             # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	2624                    # Compilation Unit Length
	.long	1503                    # DIE offset
	.asciz	"long long int"         # External Name
	.long	1510                    # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	2594                    # DIE offset
	.asciz	"int"                   # External Name
	.long	2611                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
