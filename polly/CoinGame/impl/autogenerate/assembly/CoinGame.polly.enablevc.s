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
.Ltmp114:
	movq	%rax, %r15
.Ltmp115:
	#DEBUG_VALUE: main:_7 <- %R15
	decl	%ebx
.Ltmp116:
	movslq	%ebx, %r14
.Ltmp117:
	#DEBUG_VALUE: main:_7_has_ownership <- 1
	#DEBUG_VALUE: main:_7_size <- %EBX
	.loc	1 404 5                 # CoinGame.c:404:5
	movq	(%r15), %rdi
.Ltmp118:
	#DEBUG_VALUE: main:_9 <- %RDI
	.loc	1 406 2                 # CoinGame.c:406:2
	callq	parseStringToInt
.Ltmp119:
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_6 <- %RAX
	.loc	1 410 9                 # CoinGame.c:410:9
	testq	%rax, %rax
.Ltmp120:
	.loc	1 410 5 is_stmt 0       # CoinGame.c:410:5
	je	.LBB3_12
.Ltmp121:
# BB#1:                                 # %if.end
	#DEBUG_VALUE: main:_6 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_7_size <- %EBX
	#DEBUG_VALUE: main:_7 <- %R15
	.loc	1 412 6 is_stmt 1       # CoinGame.c:412:6
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
	#DEBUG_VALUE: main:n <- %RBX
	.loc	1 20 2                  # CoinGame.c:20:2
	xorl	%edi, %edi
	movl	%ebx, %esi
	callq	gen1DArray
.Ltmp123:
	movq	%rax, %r12
.Ltmp124:
	#DEBUG_VALUE: init:_5 <- %R12
	#DEBUG_VALUE: init:coins <- %R12
	#DEBUG_VALUE: main:_10 <- %R12
	#DEBUG_VALUE: main:coins <- %R12
	#DEBUG_VALUE: init:coins_has_ownership <- 1
	.loc	1 34 6                  # CoinGame.c:34:6
	testq	%rbx, %rbx
	jle	.LBB3_11
.Ltmp125:
# BB#2:                                 # %if.end7.i.preheader
	#DEBUG_VALUE: main:_7 <- %R15
	#DEBUG_VALUE: main:coins <- %R12
	#DEBUG_VALUE: main:_10 <- %R12
	#DEBUG_VALUE: init:coins <- %R12
	#DEBUG_VALUE: init:_5 <- %R12
	#DEBUG_VALUE: main:n <- %RBX
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
	#DEBUG_VALUE: main:n <- %RBX
	#DEBUG_VALUE: init:_5 <- %R12
	#DEBUG_VALUE: init:coins <- %R12
	#DEBUG_VALUE: main:_10 <- %R12
	#DEBUG_VALUE: main:coins <- %R12
	#DEBUG_VALUE: main:_7 <- %R15
	xorl	%ecx, %ecx
	movq	%rbx, %rax
	andq	$-4, %rax
	je	.LBB3_10
.Ltmp127:
# BB#4:                                 # %vector.body.preheader
	#DEBUG_VALUE: main:_7 <- %R15
	#DEBUG_VALUE: main:coins <- %R12
	#DEBUG_VALUE: main:_10 <- %R12
	#DEBUG_VALUE: init:coins <- %R12
	#DEBUG_VALUE: init:_5 <- %R12
	#DEBUG_VALUE: main:n <- %RBX
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: init:_5_size <- %RBX
	.loc	1 415 8                 # CoinGame.c:415:8
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
	#DEBUG_VALUE: main:n <- %RBX
	#DEBUG_VALUE: init:_5 <- %R12
	#DEBUG_VALUE: init:coins <- %R12
	#DEBUG_VALUE: main:_10 <- %R12
	#DEBUG_VALUE: main:coins <- %R12
	#DEBUG_VALUE: main:_7 <- %R15
	.loc	1 36 6                  # CoinGame.c:36:6
	movdqu	(%r12), %xmm0
	movdqu	16(%r12), %xmm1
	.loc	1 38 8                  # CoinGame.c:38:8
	movl	$1, %ecx
	movd	%rcx, %xmm2
	pslldq	$8, %xmm2               # xmm2 = zero,zero,zero,zero,zero,zero,zero,zero,xmm2[0,1,2,3,4,5,6,7]
	paddq	%xmm0, %xmm2
	paddq	.LCPI3_0(%rip), %xmm1
	.loc	1 40 12                 # CoinGame.c:40:12
	movdqu	%xmm2, (%r12)
	movdqu	%xmm1, 16(%r12)
	movl	$4, %ecx
.Ltmp129:
.LBB3_6:                                # %vector.body.preheader.split
	#DEBUG_VALUE: init:_5_size <- %RBX
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: main:n <- %RBX
	#DEBUG_VALUE: init:_5 <- %R12
	#DEBUG_VALUE: init:coins <- %R12
	#DEBUG_VALUE: main:_10 <- %R12
	#DEBUG_VALUE: main:coins <- %R12
	#DEBUG_VALUE: main:_7 <- %R15
	.loc	1 415 8                 # CoinGame.c:415:8
	testq	%rdx, %rdx
	je	.LBB3_9
.Ltmp130:
# BB#7:
	#DEBUG_VALUE: main:_7 <- %R15
	#DEBUG_VALUE: main:coins <- %R12
	#DEBUG_VALUE: main:_10 <- %R12
	#DEBUG_VALUE: init:coins <- %R12
	#DEBUG_VALUE: init:_5 <- %R12
	#DEBUG_VALUE: main:n <- %RBX
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
	movdqu	(%r12,%rcx,8), %xmm3
	paddq	%xmm2, %xmm3
	movdqu	16(%r12,%rcx,8), %xmm4
	paddq	%xmm2, %xmm4
	.loc	1 38 8                  # CoinGame.c:38:8
	paddq	%xmm0, %xmm3
	paddq	%xmm1, %xmm4
	.loc	1 40 12                 # CoinGame.c:40:12
	movdqu	%xmm3, (%r12,%rcx,8)
	movdqu	%xmm4, 16(%r12,%rcx,8)
	.loc	1 36 6                  # CoinGame.c:36:6
	leaq	4(%rcx), %rdx
.Ltmp133:
	.loc	1 415 8                 # CoinGame.c:415:8
	movd	%rdx, %xmm2
	pshufd	$68, %xmm2, %xmm2       # xmm2 = xmm2[0,1,0,1]
.Ltmp134:
	.loc	1 36 6                  # CoinGame.c:36:6
	movdqu	32(%r12,%rcx,8), %xmm3
	paddq	%xmm2, %xmm3
	movdqu	48(%r12,%rcx,8), %xmm4
	paddq	%xmm2, %xmm4
	.loc	1 38 8                  # CoinGame.c:38:8
	paddq	%xmm0, %xmm3
	paddq	%xmm1, %xmm4
	.loc	1 40 12                 # CoinGame.c:40:12
	movdqu	%xmm3, 32(%r12,%rcx,8)
	movdqu	%xmm4, 48(%r12,%rcx,8)
	.loc	1 36 6                  # CoinGame.c:36:6
	addq	$8, %rcx
	cmpq	%rax, %rcx
	jne	.LBB3_8
.Ltmp135:
.LBB3_9:                                # %middle.block
	cmpq	%rax, %rbx
	.loc	1 415 8                 # CoinGame.c:415:8
	movq	%rax, %rcx
	je	.LBB3_11
	.p2align	4, 0x90
.LBB3_10:                               # %if.end7.i
                                        # =>This Inner Loop Header: Depth=1
.Ltmp136:
	.loc	1 40 12                 # CoinGame.c:40:12
	addq	%rcx, (%r12,%rcx,8)
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
.LBB3_11:                               # %if.then74
	#DEBUG_VALUE: main:coins_size <- 0
	#DEBUG_VALUE: main:coins_has_ownership <- 1
	#DEBUG_VALUE: main:_10_has_ownership <- 0
	#DEBUG_VALUE: main:_11_size <- 0
	.loc	1 426 8                 # CoinGame.c:426:8
	xorl	%edx, %edx
	movq	%r12, %rdi
	movq	%rbx, %rcx
	callq	findMoves
	movq	%rax, %r13
.Ltmp140:
	#DEBUG_VALUE: main:moves <- %R13
	#DEBUG_VALUE: main:_11 <- %R13
	#DEBUG_VALUE: main:_12 <- 1
	#DEBUG_VALUE: main:_11_has_ownership <- 0
	#DEBUG_VALUE: main:moves_has_ownership <- 1
	#DEBUG_VALUE: main:moves_size <- 0
	.loc	1 438 6                 # CoinGame.c:438:6
	movq	-8(%r13,%rbx,8), %rbp
.Ltmp141:
	#DEBUG_VALUE: main:_17_size <- 50
	#DEBUG_VALUE: main:_14 <- %RBP
	#DEBUG_VALUE: main:sum_alice <- %RBP
	.loc	1 445 2                 # CoinGame.c:445:2
	movl	$400, %edi              # imm = 0x190
	callq	malloc
	movq	%rax, %rbx
.Ltmp142:
	#DEBUG_VALUE: main:_17 <- %RBX
	.loc	1 446 9                 # CoinGame.c:446:9
	movaps	.LCPI3_1(%rip), %xmm0   # xmm0 = [84,104]
	movups	%xmm0, (%rbx)
	.loc	1 446 36 is_stmt 0      # CoinGame.c:446:36
	movaps	.LCPI3_2(%rip), %xmm0   # xmm0 = [101,32]
	movups	%xmm0, 16(%rbx)
	.loc	1 446 63                # CoinGame.c:446:63
	movaps	.LCPI3_3(%rip), %xmm1   # xmm1 = [116,111]
	movups	%xmm1, 32(%rbx)
	.loc	1 446 91                # CoinGame.c:446:91
	movaps	.LCPI3_4(%rip), %xmm1   # xmm1 = [116,97]
	movups	%xmm1, 48(%rbx)
	.loc	1 446 118               # CoinGame.c:446:118
	movaps	.LCPI3_5(%rip), %xmm1   # xmm1 = [108,32]
	movups	%xmm1, 64(%rbx)
	.loc	1 446 146               # CoinGame.c:446:146
	movaps	.LCPI3_6(%rip), %xmm1   # xmm1 = [97,109]
	movups	%xmm1, 80(%rbx)
	.loc	1 446 175               # CoinGame.c:446:175
	movaps	.LCPI3_7(%rip), %xmm1   # xmm1 = [111,117]
	movups	%xmm1, 96(%rbx)
	.loc	1 446 205               # CoinGame.c:446:205
	movaps	.LCPI3_8(%rip), %xmm1   # xmm1 = [110,116]
	movups	%xmm1, 112(%rbx)
	.loc	1 446 235               # CoinGame.c:446:235
	movaps	.LCPI3_9(%rip), %xmm1   # xmm1 = [32,111]
	movups	%xmm1, 128(%rbx)
	.loc	1 446 264               # CoinGame.c:446:264
	movaps	.LCPI3_10(%rip), %xmm1  # xmm1 = [102,32]
	movups	%xmm1, 144(%rbx)
	.loc	1 446 293               # CoinGame.c:446:293
	movaps	.LCPI3_11(%rip), %xmm1  # xmm1 = [109,111]
	movups	%xmm1, 160(%rbx)
	.loc	1 446 323               # CoinGame.c:446:323
	movaps	.LCPI3_12(%rip), %xmm1  # xmm1 = [110,101]
	movups	%xmm1, 176(%rbx)
	.loc	1 446 353               # CoinGame.c:446:353
	movaps	.LCPI3_13(%rip), %xmm1  # xmm1 = [121,32]
	movups	%xmm1, 192(%rbx)
	.loc	1 446 382               # CoinGame.c:446:382
	movaps	.LCPI3_14(%rip), %xmm1  # xmm1 = [40,109]
	movups	%xmm1, 208(%rbx)
	.loc	1 446 411               # CoinGame.c:446:411
	movaps	.LCPI3_15(%rip), %xmm1  # xmm1 = [97,120]
	movups	%xmm1, 224(%rbx)
	.loc	1 446 440               # CoinGame.c:446:440
	movaps	.LCPI3_16(%rip), %xmm1  # xmm1 = [105,109]
	movups	%xmm1, 240(%rbx)
	.loc	1 446 470               # CoinGame.c:446:470
	movaps	.LCPI3_17(%rip), %xmm1  # xmm1 = [117,109]
	movups	%xmm1, 256(%rbx)
	.loc	1 446 500               # CoinGame.c:446:500
	movaps	.LCPI3_18(%rip), %xmm1  # xmm1 = [41,32]
	movups	%xmm1, 272(%rbx)
	.loc	1 446 528               # CoinGame.c:446:528
	movaps	.LCPI3_19(%rip), %xmm1  # xmm1 = [65,108]
	movups	%xmm1, 288(%rbx)
	.loc	1 446 557               # CoinGame.c:446:557
	movaps	.LCPI3_20(%rip), %xmm1  # xmm1 = [105,99]
	movups	%xmm1, 304(%rbx)
	.loc	1 446 586               # CoinGame.c:446:586
	movups	%xmm0, 320(%rbx)
	.loc	1 446 615               # CoinGame.c:446:615
	movaps	.LCPI3_21(%rip), %xmm0  # xmm0 = [103,101]
	movups	%xmm0, 336(%rbx)
	.loc	1 446 645               # CoinGame.c:446:645
	movaps	.LCPI3_22(%rip), %xmm0  # xmm0 = [116,115]
	movups	%xmm0, 352(%rbx)
	.loc	1 446 675               # CoinGame.c:446:675
	movaps	.LCPI3_23(%rip), %xmm0  # xmm0 = [32,105]
	movups	%xmm0, 368(%rbx)
	.loc	1 446 704               # CoinGame.c:446:704
	movaps	.LCPI3_24(%rip), %xmm0  # xmm0 = [115,32]
	movups	%xmm0, 384(%rbx)
.Ltmp143:
	#DEBUG_VALUE: main:_17_has_ownership <- 1
	.loc	1 449 2 is_stmt 1       # CoinGame.c:449:2
	movl	$50, %esi
	movq	%rbx, %rdi
	callq	printf_s
	.loc	1 453 2                 # CoinGame.c:453:2
	movl	$.L.str, %edi
	xorl	%eax, %eax
	movq	%rbp, %rsi
	callq	printf
.Ltmp144:
	.loc	1 457 2 discriminator 1 # CoinGame.c:457:2
	movq	%r12, %rdi
	callq	free
.Ltmp145:
	#DEBUG_VALUE: main:coins_has_ownership <- 0
	.loc	1 458 2 discriminator 1 # CoinGame.c:458:2
	movq	%r13, %rdi
	callq	free
.Ltmp146:
	#DEBUG_VALUE: main:moves_has_ownership <- 0
	.loc	1 459 2 discriminator 1 # CoinGame.c:459:2
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	free2DArray
.Ltmp147:
	#DEBUG_VALUE: main:_7_has_ownership <- 0
	.loc	1 463 2 discriminator 1 # CoinGame.c:463:2
	movq	%rbx, %rdi
	callq	free
.Ltmp148:
	#DEBUG_VALUE: main:_17_has_ownership <- 0
	.loc	1 464 2                 # CoinGame.c:464:2
	xorl	%edi, %edi
	callq	exit
.Ltmp149:
.LBB3_12:                               # %if.end93.critedge
	#DEBUG_VALUE: main:_6 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_7_size <- %EBX
	#DEBUG_VALUE: main:_7 <- %R15
	.loc	1 459 2 discriminator 1 # CoinGame.c:459:2
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	free2DArray
.Ltmp150:
	#DEBUG_VALUE: main:_7_has_ownership <- 0
	.loc	1 464 2                 # CoinGame.c:464:2
	xorl	%edi, %edi
	callq	exit
.Ltmp151:
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
	.asciz	"_5"                    # string offset=371
.Linfo_string21:
	.asciz	"coins"                 # string offset=374
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
	.quad	.Ltmp143-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp143-.Lfunc_begin0
	.quad	.Ltmp148-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp148-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc52:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp141-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	50                      # 50
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc53:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp141-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp149-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc54:
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
.Ldebug_loc55:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp117-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp117-.Lfunc_begin0
	.quad	.Ltmp147-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp147-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc56:
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
	.quad	.Ltmp149-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc57:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp141-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp149-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc58:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp140-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp140-.Lfunc_begin0
	.quad	.Ltmp146-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp146-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc59:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp139-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp139-.Lfunc_begin0
	.quad	.Ltmp145-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp145-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc60:
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
.Ldebug_loc61:
	.quad	.Ltmp115-.Lfunc_begin0
	.quad	.Ltmp131-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp149-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc62:
	.quad	.Ltmp118-.Lfunc_begin0
	.quad	.Ltmp119-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc63:
	.quad	.Ltmp119-.Lfunc_begin0
	.quad	.Ltmp123-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp149-.Lfunc_begin0
	.quad	.Ltmp150-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc64:
	.quad	.Ltmp119-.Lfunc_begin0
	.quad	.Ltmp123-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp149-.Lfunc_begin0
	.quad	.Ltmp150-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc65:
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
.Ldebug_loc66:
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
.Ldebug_loc67:
	.quad	.Ltmp122-.Lfunc_begin0
	.quad	.Ltmp131-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc68:
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
.Ldebug_loc69:
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
.Ldebug_loc70:
	.quad	.Ltmp122-.Lfunc_begin0
	.quad	.Ltmp131-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc71:
	.quad	.Ltmp124-.Lfunc_begin0
	.quad	.Ltmp131-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc72:
	.quad	.Ltmp124-.Lfunc_begin0
	.quad	.Ltmp131-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc73:
	.quad	.Ltmp124-.Lfunc_begin0
	.quad	.Ltmp131-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc74:
	.quad	.Ltmp124-.Lfunc_begin0
	.quad	.Ltmp131-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc75:
	.quad	.Ltmp140-.Lfunc_begin0
	.quad	.Ltmp149-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc76:
	.quad	.Ltmp140-.Lfunc_begin0
	.quad	.Ltmp149-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc77:
	.quad	.Ltmp142-.Lfunc_begin0
	.quad	.Ltmp149-.Lfunc_begin0
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
	.byte	85                      # DW_AT_ranges
	.byte	23                      # DW_FORM_sec_offset
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
	.long	2302                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x8f7 DW_TAG_compile_unit
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
	.long	1394                    # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x3e:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	1406                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x47:0x9 DW_TAG_variable
	.long	.Ldebug_loc1            # DW_AT_location
	.long	1483                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x50:0x9 DW_TAG_variable
	.long	.Ldebug_loc2            # DW_AT_location
	.long	1549                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x59:0x9 DW_TAG_variable
	.long	.Ldebug_loc3            # DW_AT_location
	.long	1417                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x62:0x9 DW_TAG_variable
	.long	.Ldebug_loc4            # DW_AT_location
	.long	1428                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x6b:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1439                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x71:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1450                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x77:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1461                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x7d:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1472                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x83:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1494                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x89:0x9 DW_TAG_variable
	.long	.Ldebug_loc5            # DW_AT_location
	.long	1505                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x92:0x9 DW_TAG_variable
	.long	.Ldebug_loc6            # DW_AT_location
	.long	1516                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x9b:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1527                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xa1:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1538                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0xa7:0x9 DW_TAG_variable
	.long	.Ldebug_loc7            # DW_AT_location
	.long	1560                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0xb0:0x9 DW_TAG_variable
	.long	.Ldebug_loc8            # DW_AT_location
	.long	1571                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0xb9:0x5 DW_TAG_variable
	.long	1582                    # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0xbf:0xe9 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1599                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	10                      # Abbrev [10] 0xd8:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc9            # DW_AT_location
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0xe7:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	1594                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0xf6:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x105:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	1606                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x114:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x123:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	60                      # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x12f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	61                      # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x13b:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x14a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x156:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x162:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	65                      # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x16e:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	66                      # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x17d:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	67                      # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x18c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	68                      # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x198:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	69                      # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0x1a8:0x3ca DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	107                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1594                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	10                      # Abbrev [10] 0x1c1:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	107                     # DW_AT_decl_line
	.long	1594                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1d0:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	107                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1df:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	107                     # DW_AT_decl_line
	.long	1606                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1ee:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	107                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1fd:0xf DW_TAG_variable
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	171                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x20c:0xf DW_TAG_variable
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	170                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x21b:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	169                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x227:0xf DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	168                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x236:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	167                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x242:0xf DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	166                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x251:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	165                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x25d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	164                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x269:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	163                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x275:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	162                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x281:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	161                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x28d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	160                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x299:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	159                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x2a5:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	158                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x2b1:0xf DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	157                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x2c0:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	156                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x2cc:0xf DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	155                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x2db:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	154                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x2e7:0xf DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	153                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x2f6:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	152                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x302:0xf DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	151                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x311:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	150                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x31d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	149                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x329:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	148                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x335:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	147                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x341:0xf DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	146                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x350:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	145                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x35c:0xf DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	144                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x36b:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	143                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x377:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	142                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x383:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	141                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x38f:0xf DW_TAG_variable
	.long	.Ldebug_loc32           # DW_AT_location
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	140                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x39e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	139                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x3aa:0xf DW_TAG_variable
	.long	.Ldebug_loc33           # DW_AT_location
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	138                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x3b9:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string66         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	137                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x3c5:0xf DW_TAG_variable
	.long	.Ldebug_loc34           # DW_AT_location
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	136                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x3d4:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	135                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x3e0:0xf DW_TAG_variable
	.long	.Ldebug_loc35           # DW_AT_location
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	134                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x3ef:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	133                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x3fb:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	132                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x407:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	131                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x413:0xf DW_TAG_variable
	.long	.Ldebug_loc36           # DW_AT_location
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	130                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x422:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	129                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x42e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string75         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	128                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x43a:0xf DW_TAG_variable
	.long	.Ldebug_loc37           # DW_AT_location
	.long	.Linfo_string76         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	127                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x449:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string77         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	126                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x455:0xf DW_TAG_variable
	.long	.Ldebug_loc38           # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	125                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x464:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	124                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x470:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string80         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	123                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x47c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string81         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	122                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x488:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string82         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	121                     # DW_AT_decl_line
	.long	1606                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x494:0xf DW_TAG_variable
	.long	.Ldebug_loc39           # DW_AT_location
	.long	.Linfo_string83         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	120                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x4a3:0xf DW_TAG_variable
	.long	.Ldebug_loc40           # DW_AT_location
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	119                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x4b2:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	118                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x4be:0xf DW_TAG_variable
	.long	.Ldebug_loc41           # DW_AT_location
	.long	.Linfo_string84         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	117                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x4cd:0xf DW_TAG_variable
	.long	.Ldebug_loc42           # DW_AT_location
	.long	.Linfo_string85         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	116                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x4dc:0xf DW_TAG_variable
	.long	.Ldebug_loc43           # DW_AT_location
	.long	.Linfo_string86         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	115                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x4eb:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	114                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x4f7:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string87         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	113                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x503:0xf DW_TAG_variable
	.long	.Ldebug_loc44           # DW_AT_location
	.long	.Linfo_string88         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	112                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x512:0xf DW_TAG_variable
	.long	.Ldebug_loc45           # DW_AT_location
	.long	.Linfo_string89         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	111                     # DW_AT_decl_line
	.long	1606                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x521:0xf DW_TAG_variable
	.long	.Ldebug_loc46           # DW_AT_location
	.long	.Linfo_string90         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	110                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x530:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string91         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	109                     # DW_AT_decl_line
	.long	1606                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x53c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string92         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	108                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x548:0xf DW_TAG_variable
	.long	.Ldebug_loc47           # DW_AT_location
	.long	.Linfo_string93         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	110                     # DW_AT_decl_line
	.long	1594                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x557:0xf DW_TAG_variable
	.long	.Ldebug_loc48           # DW_AT_location
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	120                     # DW_AT_decl_line
	.long	1594                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x566:0xb DW_TAG_variable
	.long	.Linfo_string94         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	108                     # DW_AT_decl_line
	.long	1594                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	15                      # Abbrev [15] 0x572:0xc8 DW_TAG_subprogram
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1594                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	16                      # Abbrev [16] 0x57e:0xb DW_TAG_formal_parameter
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x589:0xb DW_TAG_variable
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x594:0xb DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x59f:0xb DW_TAG_variable
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x5aa:0xb DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x5b5:0xb DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x5c0:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.long	1606                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x5cb:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x5d6:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x5e1:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x5ec:0xb DW_TAG_variable
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	1606                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x5f7:0xb DW_TAG_variable
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	1606                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x602:0xb DW_TAG_variable
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x60d:0xb DW_TAG_variable
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x618:0xb DW_TAG_variable
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	1594                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x623:0xb DW_TAG_variable
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	1594                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x62e:0xb DW_TAG_variable
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	1594                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x63a:0x5 DW_TAG_pointer_type
	.long	1599                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x63f:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	18                      # Abbrev [18] 0x646:0x7 DW_TAG_base_type
	.long	.Linfo_string12         # DW_AT_name
	.byte	2                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	19                      # Abbrev [19] 0x64d:0x297 DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	373                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	2276                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	20                      # Abbrev [20] 0x667:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc49           # DW_AT_location
	.long	.Linfo_string95         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	373                     # DW_AT_decl_line
	.long	2276                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x677:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc50           # DW_AT_location
	.long	.Linfo_string96         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	373                     # DW_AT_decl_line
	.long	2283                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x687:0x10 DW_TAG_variable
	.long	.Ldebug_loc51           # DW_AT_location
	.long	.Linfo_string98         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	396                     # DW_AT_decl_line
	.long	1606                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x697:0x10 DW_TAG_variable
	.long	.Ldebug_loc52           # DW_AT_location
	.long	.Linfo_string99         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	395                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x6a7:0x10 DW_TAG_variable
	.long	.Ldebug_loc53           # DW_AT_location
	.long	.Linfo_string80         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	393                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x6b7:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string81         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	392                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x6c4:0x10 DW_TAG_variable
	.long	.Ldebug_loc54           # DW_AT_location
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	391                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x6d4:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string100        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	390                     # DW_AT_decl_line
	.long	1606                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x6e1:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string101        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	389                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x6ee:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string102        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	388                     # DW_AT_decl_line
	.long	1606                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x6fb:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string103        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	387                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x708:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string104        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	386                     # DW_AT_decl_line
	.long	1606                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x715:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string105        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	385                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x722:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	384                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x72f:0x10 DW_TAG_variable
	.long	.Ldebug_loc55           # DW_AT_location
	.long	.Linfo_string106        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	383                     # DW_AT_decl_line
	.long	1606                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x73f:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string107        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	382                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x74c:0x10 DW_TAG_variable
	.long	.Ldebug_loc56           # DW_AT_location
	.long	.Linfo_string108        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	382                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x75c:0x10 DW_TAG_variable
	.long	.Ldebug_loc57           # DW_AT_location
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	380                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x76c:0x10 DW_TAG_variable
	.long	.Ldebug_loc58           # DW_AT_location
	.long	.Linfo_string89         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	379                     # DW_AT_decl_line
	.long	1606                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x77c:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string90         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	378                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x789:0x10 DW_TAG_variable
	.long	.Ldebug_loc59           # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	377                     # DW_AT_decl_line
	.long	1606                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x799:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	376                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x7a6:0x10 DW_TAG_variable
	.long	.Ldebug_loc60           # DW_AT_location
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	375                     # DW_AT_decl_line
	.long	1599                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x7b6:0x10 DW_TAG_variable
	.long	.Ldebug_loc61           # DW_AT_location
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	382                     # DW_AT_decl_line
	.long	2300                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x7c6:0x10 DW_TAG_variable
	.long	.Ldebug_loc62           # DW_AT_location
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	385                     # DW_AT_decl_line
	.long	1594                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x7d6:0x10 DW_TAG_variable
	.long	.Ldebug_loc63           # DW_AT_location
	.long	.Linfo_string109        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	374                     # DW_AT_decl_line
	.long	1594                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x7e6:0x10 DW_TAG_variable
	.long	.Ldebug_loc64           # DW_AT_location
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	381                     # DW_AT_decl_line
	.long	1594                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x7f6:0x10 DW_TAG_variable
	.long	.Ldebug_loc73           # DW_AT_location
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	387                     # DW_AT_decl_line
	.long	1594                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x806:0x10 DW_TAG_variable
	.long	.Ldebug_loc74           # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	376                     # DW_AT_decl_line
	.long	1594                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x816:0x10 DW_TAG_variable
	.long	.Ldebug_loc75           # DW_AT_location
	.long	.Linfo_string93         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	378                     # DW_AT_decl_line
	.long	1594                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x826:0x10 DW_TAG_variable
	.long	.Ldebug_loc76           # DW_AT_location
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	389                     # DW_AT_decl_line
	.long	1594                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x836:0x10 DW_TAG_variable
	.long	.Ldebug_loc77           # DW_AT_location
	.long	.Linfo_string77         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	395                     # DW_AT_decl_line
	.long	1594                    # DW_AT_type
	.byte	24                      # Abbrev [24] 0x846:0xc DW_TAG_variable
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	394                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	24                      # Abbrev [24] 0x852:0xc DW_TAG_variable
	.long	.Linfo_string76         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	397                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	25                      # Abbrev [25] 0x85e:0x85 DW_TAG_inlined_subroutine
	.long	1394                    # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.short	415                     # DW_AT_call_line
	.byte	4                       # Abbrev [4] 0x86a:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc70           # DW_AT_location
	.long	1406                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x873:0x9 DW_TAG_variable
	.long	.Ldebug_loc65           # DW_AT_location
	.long	1417                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x87c:0x9 DW_TAG_variable
	.long	.Ldebug_loc66           # DW_AT_location
	.long	1428                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x885:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1439                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x88b:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1450                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x891:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1461                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x897:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1472                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x89d:0x9 DW_TAG_variable
	.long	.Ldebug_loc67           # DW_AT_location
	.long	1483                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x8a6:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1494                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x8ac:0x9 DW_TAG_variable
	.long	.Ldebug_loc68           # DW_AT_location
	.long	1505                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x8b5:0x9 DW_TAG_variable
	.long	.Ldebug_loc69           # DW_AT_location
	.long	1516                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x8be:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1527                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x8c4:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1538                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x8ca:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1549                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x8d0:0x9 DW_TAG_variable
	.long	.Ldebug_loc71           # DW_AT_location
	.long	1560                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x8d9:0x9 DW_TAG_variable
	.long	.Ldebug_loc72           # DW_AT_location
	.long	1571                    # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	18                      # Abbrev [18] 0x8e4:0x7 DW_TAG_base_type
	.long	.Linfo_string26         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	17                      # Abbrev [17] 0x8eb:0x5 DW_TAG_pointer_type
	.long	2288                    # DW_AT_type
	.byte	17                      # Abbrev [17] 0x8f0:0x5 DW_TAG_pointer_type
	.long	2293                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x8f5:0x7 DW_TAG_base_type
	.long	.Linfo_string97         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	17                      # Abbrev [17] 0x8fc:0x5 DW_TAG_pointer_type
	.long	1594                    # DW_AT_type
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
	.long	2306                    # Compilation Unit Length
	.long	1394                    # DIE offset
	.asciz	"init"                  # External Name
	.long	1613                    # DIE offset
	.asciz	"main"                  # External Name
	.long	191                     # DIE offset
	.asciz	"getBobSum"             # External Name
	.long	424                     # DIE offset
	.asciz	"findMoves"             # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	2306                    # Compilation Unit Length
	.long	1599                    # DIE offset
	.asciz	"long long int"         # External Name
	.long	1606                    # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	2276                    # DIE offset
	.asciz	"int"                   # External Name
	.long	2293                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
