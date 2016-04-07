	.text
	.file	"llvm/CoinGame.openmp.disablevc.ll"
	.file	1 "CoinGame.c"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI0_0:
	.long	0                       # 0x0
	.long	1                       # 0x1
	.long	2                       # 0x2
	.long	3                       # 0x3
	.text
	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
.Lfunc_begin0:
	.loc	1 26 0                  # CoinGame.c:26:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 29 2 prologue_end     # CoinGame.c:29:2
	pushq	%rax
.Ltmp0:
	.cfi_def_cfa_offset 16
	movl	$.L.str, %edi
	movl	$6, %esi
	xorl	%eax, %eax
	callq	printf
.Ltmp1:
	#DEBUG_VALUE: init:i <- 0
	.loc	1 31 8                  # CoinGame.c:31:8
	movaps	.LCPI0_0(%rip), %xmm0   # xmm0 = [0,1,2,3]
	movaps	%xmm0, V(%rip)
	movabsq	$21474836484, %rax      # imm = 0x500000004
	movq	%rax, V+16(%rip)
.Ltmp2:
	.loc	1 33 1                  # CoinGame.c:33:1
	popq	%rax
	retq
.Ltmp3:
.Lfunc_end0:
	.size	init, .Lfunc_end0-init
	.cfi_endproc

	.globl	play
	.p2align	4, 0x90
	.type	play,@function
play:                                   # @play
.Lfunc_begin1:
	.loc	1 35 0                  # CoinGame.c:35:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 40 7 prologue_end     # CoinGame.c:40:7
	pushq	%r15
.Ltmp4:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp5:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp6:
	.cfi_def_cfa_offset 32
.Ltmp7:
	.cfi_offset %rbx, -32
.Ltmp8:
	.cfi_offset %r14, -24
.Ltmp9:
	.cfi_offset %r15, -16
.Ltmp10:
	#DEBUG_VALUE: play:i <- 0
	#DEBUG_VALUE: play:j <- 5
	#DEBUG_VALUE: play:index <- 0
	movl	M+44(%rip), %eax
.Ltmp11:
	#DEBUG_VALUE: play:j <- 4
	.loc	1 40 19 is_stmt 0       # CoinGame.c:40:19
	cmpl	M+16(%rip), %eax
.Ltmp12:
	.loc	1 40 7                  # CoinGame.c:40:7
	setle	%al
	movzbl	%al, %edx
.Ltmp13:
	.loc	1 46 19 is_stmt 1       # CoinGame.c:46:19
	movl	$V, %eax
	movl	$V+20, %esi
	cmovleq	%rax, %rsi
.Ltmp14:
	.loc	1 40 7                  # CoinGame.c:40:7
	leal	4(%rdx), %ecx
.Ltmp15:
	.loc	1 46 19                 # CoinGame.c:46:19
	movl	(%rsi), %eax
.Ltmp16:
	.loc	1 42 17                 # CoinGame.c:42:17
	movl	%eax, coins(%rip)
.Ltmp17:
	.loc	1 40 11                 # CoinGame.c:40:11
	leal	1(%rdx), %eax
	.loc	1 40 7 is_stmt 0        # CoinGame.c:40:7
	leaq	(%rax,%rax,2), %rsi
	leaq	(,%rcx,4), %rdi
	movl	M(%rdi,%rsi,8), %r8d
	.loc	1 40 29                 # CoinGame.c:40:29
	leal	3(%rdx), %edi
	.loc	1 40 22                 # CoinGame.c:40:22
	leaq	(%rdx,%rdx,2), %rbx
	leaq	(,%rdi,4), %rsi
	.loc	1 40 19                 # CoinGame.c:40:19
	cmpl	M(%rsi,%rbx,8), %r8d
.Ltmp18:
	.loc	1 40 7                  # CoinGame.c:40:7
	cmovgl	%edx, %eax
	cmovgq	%rcx, %rdx
	cmovgl	%edi, %ecx
.Ltmp19:
	.loc	1 42 19 is_stmt 1       # CoinGame.c:42:19
	movl	V(,%rdx,4), %edx
.Ltmp20:
	.loc	1 46 17                 # CoinGame.c:46:17
	movl	%edx, coins+4(%rip)
.Ltmp21:
	.loc	1 40 7                  # CoinGame.c:40:7
	movl	%ecx, %r9d
	.loc	1 40 11 is_stmt 0       # CoinGame.c:40:11
	leal	1(%rax), %r10d
	.loc	1 40 7                  # CoinGame.c:40:7
	leaq	(%r10,%r10,2), %rdi
	leaq	(,%r9,4), %rbx
	movl	M(%rbx,%rdi,8), %r8d
	.loc	1 40 29                 # CoinGame.c:40:29
	leal	-1(%rcx), %edi
	.loc	1 40 22                 # CoinGame.c:40:22
	movl	%eax, %edx
	leaq	(%rdx,%rdx,2), %rsi
	.loc	1 40 19                 # CoinGame.c:40:19
	cmpl	M-4(%rbx,%rsi,8), %r8d
.Ltmp22:
	.loc	1 40 7                  # CoinGame.c:40:7
	cmovgq	%r9, %rdx
	cmovlel	%r10d, %eax
	cmovlel	%ecx, %edi
.Ltmp23:
	.loc	1 46 19 is_stmt 1       # CoinGame.c:46:19
	movl	V(,%rdx,4), %ecx
.Ltmp24:
	.loc	1 42 17                 # CoinGame.c:42:17
	movl	%ecx, coins+8(%rip)
.Ltmp25:
	.loc	1 40 7                  # CoinGame.c:40:7
	movslq	%edi, %rcx
	.loc	1 40 11 is_stmt 0       # CoinGame.c:40:11
	leal	1(%rax), %r9d
	.loc	1 40 7                  # CoinGame.c:40:7
	leaq	(,%rcx,4), %rsi
	leaq	(%r9,%r9,2), %rdi
	movl	M(%rsi,%rdi,8), %r8d
	.loc	1 40 29                 # CoinGame.c:40:29
	leal	-1(%rcx), %ebx
	.loc	1 40 22                 # CoinGame.c:40:22
	movl	%eax, %edi
	leaq	(%rdi,%rdi,2), %rdx
	.loc	1 40 19                 # CoinGame.c:40:19
	cmpl	M-4(%rsi,%rdx,8), %r8d
.Ltmp26:
	.loc	1 40 7                  # CoinGame.c:40:7
	cmovgq	%rcx, %rdi
	cmovlel	%r9d, %eax
	cmovlel	%ecx, %ebx
.Ltmp27:
	.loc	1 42 19 is_stmt 1       # CoinGame.c:42:19
	movl	V(,%rdi,4), %ecx
.Ltmp28:
	.loc	1 46 17                 # CoinGame.c:46:17
	movl	%ecx, coins+12(%rip)
.Ltmp29:
	.loc	1 40 7                  # CoinGame.c:40:7
	movslq	%ebx, %rcx
	.loc	1 40 11 is_stmt 0       # CoinGame.c:40:11
	leal	1(%rax), %edx
	.loc	1 40 7                  # CoinGame.c:40:7
	movslq	%edx, %rdx
	leaq	(,%rcx,4), %rsi
	leaq	(%rdx,%rdx,2), %rdi
	movl	M(%rsi,%rdi,8), %r8d
	.loc	1 40 29                 # CoinGame.c:40:29
	leal	-1(%rcx), %ebx
	.loc	1 40 22                 # CoinGame.c:40:22
	cltq
	leaq	(%rax,%rax,2), %rdi
	.loc	1 40 19                 # CoinGame.c:40:19
	cmpl	M-4(%rsi,%rdi,8), %r8d
.Ltmp30:
	.loc	1 40 7                  # CoinGame.c:40:7
	cmovlel	%ecx, %ebx
	cmovleq	%rax, %rcx
	cmovlel	%edx, %eax
.Ltmp31:
	.loc	1 46 19 is_stmt 1       # CoinGame.c:46:19
	movl	V(,%rcx,4), %ecx
.Ltmp32:
	.loc	1 42 17                 # CoinGame.c:42:17
	movl	%ecx, coins+16(%rip)
.Ltmp33:
	.loc	1 40 7                  # CoinGame.c:40:7
	movslq	%ebx, %rcx
	.loc	1 40 11 is_stmt 0       # CoinGame.c:40:11
	leal	1(%rax), %edx
	.loc	1 40 7                  # CoinGame.c:40:7
	movslq	%edx, %rdx
	leaq	(,%rcx,4), %rsi
	leaq	(%rdx,%rdx,2), %rdx
	movl	M(%rsi,%rdx,8), %edx
	.loc	1 40 22                 # CoinGame.c:40:22
	cltq
	leaq	(%rax,%rax,2), %rdi
	.loc	1 40 19                 # CoinGame.c:40:19
	cmpl	M-4(%rsi,%rdi,8), %edx
.Ltmp34:
	.loc	1 40 7                  # CoinGame.c:40:7
	cmovgq	%rcx, %rax
.Ltmp35:
	.loc	1 42 19 is_stmt 1       # CoinGame.c:42:19
	movl	V(,%rax,4), %eax
.Ltmp36:
	.loc	1 46 17                 # CoinGame.c:46:17
	movl	%eax, coins+20(%rip)
	xorl	%ebx, %ebx
.Ltmp37:
	.p2align	4, 0x90
.LBB1_1:                                # %for.body19
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 52 6                  # CoinGame.c:52:6
	movq	%rbx, %r15
	andq	$1, %r15
	jne	.LBB1_3
# BB#2:                                 # %if.then21
                                        #   in Loop: Header=BB1_1 Depth=1
.Ltmp38:
	.loc	1 53 4                  # CoinGame.c:53:4
	movl	$.L.str.1, %edi
	jmp	.LBB1_4
.Ltmp39:
	.p2align	4, 0x90
.LBB1_3:                                # %if.else22
                                        #   in Loop: Header=BB1_1 Depth=1
	.loc	1 55 4                  # CoinGame.c:55:4
	movl	$.L.str.2, %edi
.LBB1_4:                                # %if.end24
                                        #   in Loop: Header=BB1_1 Depth=1
	xorl	%eax, %eax
	callq	printf
.Ltmp40:
	.loc	1 51 2 discriminator 1  # CoinGame.c:51:2
	leaq	1(%rbx), %r14
.Ltmp41:
	.loc	1 57 29                 # CoinGame.c:57:29
	movl	coins(,%rbx,4), %edx
	.loc	1 57 3 is_stmt 0        # CoinGame.c:57:3
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	movl	%r14d, %esi
	callq	printf
.Ltmp42:
	.loc	1 60 17 is_stmt 1       # CoinGame.c:60:17
	movl	coins(,%rbx,4), %eax
.Ltmp43:
	.loc	1 59 6                  # CoinGame.c:59:6
	testq	%r15, %r15
	jne	.LBB1_8
# BB#5:                                 # %if.then31
                                        #   in Loop: Header=BB1_1 Depth=1
.Ltmp44:
	.loc	1 60 14                 # CoinGame.c:60:14
	addl	%eax, sum_alice(%rip)
	.loc	1 61 4                  # CoinGame.c:61:4
	movl	$.L.str.4, %edi
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB1_6
.Ltmp45:
	.p2align	4, 0x90
.LBB1_8:                                # %if.else36
                                        #   in Loop: Header=BB1_1 Depth=1
	.loc	1 63 12                 # CoinGame.c:63:12
	addl	%eax, sum_bob(%rip)
	.loc	1 64 4                  # CoinGame.c:64:4
	movl	$.Lstr, %edi
	callq	puts
.Ltmp46:
.LBB1_6:                                # %for.cond17.backedge
                                        #   in Loop: Header=BB1_1 Depth=1
	.loc	1 51 2 discriminator 1  # CoinGame.c:51:2
	cmpq	$6, %r14
	movq	%r14, %rbx
	jne	.LBB1_1
.Ltmp47:
# BB#7:                                 # %for.end44
	.loc	1 68 1                  # CoinGame.c:68:1
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Ltmp48:
.Lfunc_end1:
	.size	play, .Lfunc_end1-play
	.cfi_endproc

	.globl	findMoves
	.p2align	4, 0x90
	.type	findMoves,@function
findMoves:                              # @findMoves
.Lfunc_begin2:
	.loc	1 103 0                 # CoinGame.c:103:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp49:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp50:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp51:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp52:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp53:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp54:
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
.Ltmp55:
	.cfi_def_cfa_offset 112
.Ltmp56:
	.cfi_offset %rbx, -56
.Ltmp57:
	.cfi_offset %r12, -48
.Ltmp58:
	.cfi_offset %r13, -40
.Ltmp59:
	.cfi_offset %r14, -32
.Ltmp60:
	.cfi_offset %r15, -24
.Ltmp61:
	.cfi_offset %rbp, -16
.Ltmp62:
	#DEBUG_VALUE: findMoves:s <- 0
	leaq	8(%rsp), %rsi
	movl	$findMoves_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$6, %r8d
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	leaq	24(%rsp), %rdi
	leaq	16(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB2_8
# BB#1:
	leaq	24(%rsp), %r14
	leaq	16(%rsp), %r15
	.p2align	4, 0x90
.LBB2_3:                                # %polly.par.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_4 Depth 2
                                        #       Child Loop BB2_7 Depth 3
	movq	16(%rsp), %rax
	movq	24(%rsp), %rcx
	addq	$-2, %rax
	leaq	X(,%rcx,4), %rbx
	.p2align	4, 0x90
.LBB2_4:                                # %polly.loop_header.i
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_7 Depth 3
	movl	$5, %esi
	subq	%rcx, %rsi
	js	.LBB2_5
# BB#6:                                 # %polly.loop_preheader3.i
                                        #   in Loop: Header=BB2_4 Depth=2
	decq	%rsi
	movq	$-1, %rdi
	movq	%rbx, %rdx
	.p2align	4, 0x90
.LBB2_7:                                # %polly.loop_header2.i
                                        #   Parent Loop BB2_3 Depth=1
                                        #     Parent Loop BB2_4 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rdx)
	incq	%rdi
	addq	$28, %rdx
	cmpq	%rsi, %rdi
	jle	.LBB2_7
.LBB2_5:                                # %polly.loop_exit4.i
                                        #   in Loop: Header=BB2_4 Depth=2
	addq	$4, %rbx
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB2_4
# BB#2:                                 # %polly.par.checkNext.loopexit.i
                                        #   in Loop: Header=BB2_3 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB2_3
.LBB2_8:                                # %findMoves_polly_subfn.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	leaq	8(%rsp), %rsi
	movl	$findMoves_polly_subfn_10, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$6, %r8d
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	leaq	24(%rsp), %rdi
	leaq	16(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB2_16
# BB#9:
	leaq	24(%rsp), %r14
	leaq	16(%rsp), %r15
	.p2align	4, 0x90
.LBB2_11:                               # %polly.par.loadIVBounds.i304
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_12 Depth 2
                                        #       Child Loop BB2_15 Depth 3
	movq	16(%rsp), %rax
	movq	24(%rsp), %rcx
	addq	$-2, %rax
	leaq	Y(,%rcx,4), %rbx
	.p2align	4, 0x90
.LBB2_12:                               # %polly.loop_header.i307
                                        #   Parent Loop BB2_11 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_15 Depth 3
	movl	$5, %esi
	subq	%rcx, %rsi
	js	.LBB2_13
# BB#14:                                # %polly.loop_preheader3.i318
                                        #   in Loop: Header=BB2_12 Depth=2
	decq	%rsi
	movq	$-1, %rdi
	movq	%rbx, %rdx
	.p2align	4, 0x90
.LBB2_15:                               # %polly.loop_header2.i315
                                        #   Parent Loop BB2_11 Depth=1
                                        #     Parent Loop BB2_12 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rdx)
	incq	%rdi
	addq	$28, %rdx
	cmpq	%rsi, %rdi
	jle	.LBB2_15
.LBB2_13:                               # %polly.loop_exit4.i310
                                        #   in Loop: Header=BB2_12 Depth=2
	addq	$4, %rbx
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB2_12
# BB#10:                                # %polly.par.checkNext.loopexit.i300
                                        #   in Loop: Header=BB2_11 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB2_11
.LBB2_16:                               # %findMoves_polly_subfn_10.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	leaq	8(%rsp), %rsi
	movl	$findMoves_polly_subfn_11, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$6, %r8d
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	leaq	24(%rsp), %rdi
	leaq	16(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB2_24
# BB#17:
	leaq	24(%rsp), %r14
	leaq	16(%rsp), %r15
	.p2align	4, 0x90
.LBB2_19:                               # %polly.par.loadIVBounds.i325
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_20 Depth 2
                                        #       Child Loop BB2_23 Depth 3
	movq	16(%rsp), %rax
	movq	24(%rsp), %rcx
	addq	$-2, %rax
	leaq	Z(,%rcx,4), %rbx
	.p2align	4, 0x90
.LBB2_20:                               # %polly.loop_header.i328
                                        #   Parent Loop BB2_19 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_23 Depth 3
	movl	$5, %esi
	subq	%rcx, %rsi
	js	.LBB2_21
# BB#22:                                # %polly.loop_preheader3.i339
                                        #   in Loop: Header=BB2_20 Depth=2
	decq	%rsi
	movq	$-1, %rdi
	movq	%rbx, %rdx
	.p2align	4, 0x90
.LBB2_23:                               # %polly.loop_header2.i336
                                        #   Parent Loop BB2_19 Depth=1
                                        #     Parent Loop BB2_20 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rdx)
	incq	%rdi
	addq	$28, %rdx
	cmpq	%rsi, %rdi
	jle	.LBB2_23
.LBB2_21:                               # %polly.loop_exit4.i331
                                        #   in Loop: Header=BB2_20 Depth=2
	addq	$4, %rbx
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB2_20
# BB#18:                                # %polly.par.checkNext.loopexit.i321
                                        #   in Loop: Header=BB2_19 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB2_19
.LBB2_24:                               # %findMoves_polly_subfn_11.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movl	$1, %eax
	xorl	%r12d, %r12d
	movl	$2, %ecx
	movl	V(%rip), %edx
	movl	%edx, 36(%rsp)          # 4-byte Spill
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB2_25:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_37 Depth 2
                                        #     Child Loop BB2_39 Depth 2
                                        #     Child Loop BB2_41 Depth 2
                                        #     Child Loop BB2_30 Depth 2
	movq	%rcx, 40(%rsp)          # 8-byte Spill
	movq	%rax, 48(%rsp)          # 8-byte Spill
	testq	%rcx, %rcx
	movl	$0, %r14d
	cmovnsq	%rcx, %r14
	testq	%rax, %rax
	movl	$0, %ebx
	cmovnsq	%rax, %rbx
	testq	%r13, %r13
	jle	.LBB2_26
# BB#33:                                # %polly.then
                                        #   in Loop: Header=BB2_25 Depth=1
	movl	$7, %eax
	subl	%r13d, %eax
	testb	$1, %al
	movl	$0, %ecx
	je	.LBB2_35
# BB#34:                                # %polly.loop_header239.prol
                                        #   in Loop: Header=BB2_25 Depth=1
	movl	X-4(,%r13,4), %eax
.Ltmp63:
	.loc	1 139 13 prologue_end   # CoinGame.c:139:13
	addl	36(%rsp), %eax          # 4-byte Folded Reload
	movl	Z-4(,%r13,4), %ecx
	.loc	1 139 30 is_stmt 0      # CoinGame.c:139:30
	addl	V-4(,%r13,4), %ecx
	.loc	1 139 23                # CoinGame.c:139:23
	cmpl	%ecx, %eax
.Ltmp64:
	.loc	1 139 8                 # CoinGame.c:139:8
	cmovgel	%eax, %ecx
	movl	%ecx, M-4(,%r13,4)
	movl	$1, %ecx
.LBB2_35:                               # %polly.then.split
                                        #   in Loop: Header=BB2_25 Depth=1
	cmpq	$6, %r13
	je	.LBB2_26
# BB#36:                                # %polly.then.split.split
                                        #   in Loop: Header=BB2_25 Depth=1
	movl	$7, %eax
	subq	%rcx, %rax
	leaq	V(,%rcx,4), %r11
	imulq	$28, %rcx, %r15
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB2_37:                               # %polly.loop_header239
                                        #   Parent Loop BB2_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	(%r11,%rsi), %rbp
	leaq	(%r15,%rcx), %r8
	movl	X-4(%r8,%r13,4), %r9d
.Ltmp65:
	.loc	1 139 13                # CoinGame.c:139:13
	addl	(%r11,%rsi), %r9d
	movl	Z-4(%r8,%r13,4), %r10d
	.loc	1 139 30                # CoinGame.c:139:30
	addl	-4(%rbp,%r13,4), %r10d
	.loc	1 139 23                # CoinGame.c:139:23
	cmpl	%r10d, %r9d
.Ltmp66:
	.loc	1 139 8                 # CoinGame.c:139:8
	cmovgel	%r9d, %r10d
	movl	%r10d, M-4(%r8,%r13,4)
	movl	X+24(%r8,%r13,4), %edx
.Ltmp67:
	.loc	1 139 13                # CoinGame.c:139:13
	addl	4(%r11,%rsi), %edx
	movl	Z+24(%r8,%r13,4), %edi
	.loc	1 139 30                # CoinGame.c:139:30
	addl	(%rbp,%r13,4), %edi
	.loc	1 139 23                # CoinGame.c:139:23
	cmpl	%edi, %edx
.Ltmp68:
	.loc	1 139 8                 # CoinGame.c:139:8
	cmovgel	%edx, %edi
	movl	%edi, M+24(%r8,%r13,4)
	addq	$-2, %rax
	addq	$8, %rsi
	addq	$56, %rcx
	cmpq	%r13, %rax
	jne	.LBB2_37
.Ltmp69:
.LBB2_26:                               # %polly.merge
                                        #   in Loop: Header=BB2_25 Depth=1
	movl	$1, %eax
	subq	%r13, %rax
	movl	$0, %edx
	cmovnsq	%rax, %rdx
	movl	$5, %eax
	subq	%r13, %rax
	cmpq	$4, %rax
	movq	%rax, %rcx
	movl	$4, %esi
	cmovgq	%rsi, %rcx
	cmpq	%rcx, %rdx
	jg	.LBB2_27
# BB#38:                                # %polly.loop_preheader253
                                        #   in Loop: Header=BB2_25 Depth=1
	imulq	$28, %rbx, %rdx
	decq	%rbx
	addq	%r12, %rdx
	decq	%rcx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB2_39:                               # %polly.loop_header252
                                        #   Parent Loop BB2_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	M+20(%rdx,%rsi), %edi
	movl	%edi, Y(%rdx,%rsi)
	incq	%rbx
	addq	$28, %rsi
	cmpq	%rcx, %rbx
	jle	.LBB2_39
.LBB2_27:                               # %polly.loop_exit254
                                        #   in Loop: Header=BB2_25 Depth=1
	cmpq	$3, %rax
	movq	%rax, %rcx
	movl	$3, %edx
	cmovgq	%rdx, %rcx
	testq	%rcx, %rcx
	js	.LBB2_28
# BB#40:                                # %polly.loop_preheader266
                                        #   in Loop: Header=BB2_25 Depth=1
	decq	%rcx
	movq	$-1, %rdx
	movq	%r12, %rsi
	.p2align	4, 0x90
.LBB2_41:                               # %polly.loop_header265
                                        #   Parent Loop BB2_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	M+48(%rsi), %edi
	movl	Y(%rsi), %ebp
.Ltmp70:
	.loc	1 119 17 is_stmt 1      # CoinGame.c:119:17
	cmpl	%ebp, %edi
.Ltmp71:
	.loc	1 119 9 is_stmt 0       # CoinGame.c:119:9
	cmovgl	%ebp, %edi
	movl	%edi, X(%rsi)
	incq	%rdx
	addq	$28, %rsi
	cmpq	%rcx, %rdx
	jle	.LBB2_41
.Ltmp72:
.LBB2_28:                               # %polly.loop_exit267
                                        #   in Loop: Header=BB2_25 Depth=1
	movl	$2, %ecx
	subq	%r13, %rcx
	movl	$0, %edx
	cmovnsq	%rcx, %rdx
	cmpq	%rax, %rdx
	jg	.LBB2_31
# BB#29:                                #   in Loop: Header=BB2_25 Depth=1
	imulq	$28, %r14, %rcx
	decq	%r14
	.p2align	4, 0x90
.LBB2_30:                               # %polly.loop_header282
                                        #   Parent Loop BB2_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	M-8(%rcx,%r12), %edx
	movl	Y(%rcx,%r12), %esi
.Ltmp73:
	.loc	1 127 17 is_stmt 1      # CoinGame.c:127:17
	cmpl	%esi, %edx
.Ltmp74:
	.loc	1 127 9 is_stmt 0       # CoinGame.c:127:9
	cmovgl	%esi, %edx
	movl	%edx, Z(%rcx,%r12)
	incq	%r14
	addq	$28, %rcx
	cmpq	%rax, %r14
	jl	.LBB2_30
.Ltmp75:
.LBB2_31:                               # %polly.loop_exit284
                                        #   in Loop: Header=BB2_25 Depth=1
	incq	%r13
	movq	48(%rsp), %rax          # 8-byte Reload
	decq	%rax
	addq	$4, %r12
	movq	40(%rsp), %rcx          # 8-byte Reload
	decq	%rcx
	cmpq	$7, %r13
	jne	.LBB2_25
# BB#32:                                # %polly.exiting
	.loc	1 152 9 is_stmt 1       # CoinGame.c:152:9
	movl	M+20(%rip), %eax
	.loc	1 152 2 is_stmt 0       # CoinGame.c:152:2
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp76:
.Lfunc_end2:
	.size	findMoves, .Lfunc_end2-findMoves
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin3:
	.loc	1 154 0 is_stmt 1       # CoinGame.c:154:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 156 2 prologue_end    # CoinGame.c:156:2
	pushq	%rax
.Ltmp77:
	.cfi_def_cfa_offset 16
	callq	findMoves
	.loc	1 157 2                 # CoinGame.c:157:2
	callq	play
.Ltmp78:
	.loc	1 160 6                 # CoinGame.c:160:6
	movl	sum_alice(%rip), %esi
	.loc	1 160 16 is_stmt 0      # CoinGame.c:160:16
	cmpl	M+20(%rip), %esi
	jne	.LBB3_1
.Ltmp79:
# BB#3:                                 # %if.end
	.loc	1 165 6 is_stmt 1       # CoinGame.c:165:6
	cmpl	sum_bob(%rip), %esi
	jl	.LBB3_4
# BB#5:                                 # %if.end5
	.loc	1 170 2                 # CoinGame.c:170:2
	movl	$.L.str.8, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 171 65                # CoinGame.c:171:65
	movl	sum_bob(%rip), %esi
	.loc	1 171 2 is_stmt 0       # CoinGame.c:171:2
	movl	$.L.str.9, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 172 1 is_stmt 1       # CoinGame.c:172:1
	xorl	%eax, %eax
	popq	%rcx
	retq
.LBB3_1:                                # %if.then
.Ltmp80:
	.loc	1 161 3                 # CoinGame.c:161:3
	movl	$.L.str.6, %edi
	jmp	.LBB3_2
.Ltmp81:
.LBB3_4:                                # %if.then3
	.loc	1 166 3                 # CoinGame.c:166:3
	movl	$.L.str.7, %edi
.Ltmp82:
.LBB3_2:                                # %if.then
	.loc	1 161 3                 # CoinGame.c:161:3
	xorl	%eax, %eax
	callq	printf
	.loc	1 162 3                 # CoinGame.c:162:3
	movl	$-1, %edi
	callq	exit
.Ltmp83:
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc

	.p2align	4, 0x90
	.type	findMoves_polly_subfn,@function
findMoves_polly_subfn:                  # @findMoves_polly_subfn
.Lfunc_begin4:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp84:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp85:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp86:
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
.Ltmp87:
	.cfi_def_cfa_offset 48
.Ltmp88:
	.cfi_offset %rbx, -32
.Ltmp89:
	.cfi_offset %r14, -24
.Ltmp90:
	.cfi_offset %r15, -16
	leaq	8(%rsp), %rdi
	leaq	(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB4_2
# BB#1:
	leaq	8(%rsp), %r14
	leaq	(%rsp), %r15
	.p2align	4, 0x90
.LBB4_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_5 Depth 2
                                        #       Child Loop BB4_8 Depth 3
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	addq	$-2, %rax
	leaq	X(,%rcx,4), %rbx
	.p2align	4, 0x90
.LBB4_5:                                # %polly.loop_header
                                        #   Parent Loop BB4_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_8 Depth 3
	movl	$5, %esi
	subq	%rcx, %rsi
	js	.LBB4_6
# BB#7:                                 # %polly.loop_preheader3
                                        #   in Loop: Header=BB4_5 Depth=2
	decq	%rsi
	movq	$-1, %rdi
	movq	%rbx, %rdx
	.p2align	4, 0x90
.LBB4_8:                                # %polly.loop_header2
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rdx)
	incq	%rdi
	addq	$28, %rdx
	cmpq	%rsi, %rdi
	jle	.LBB4_8
.LBB4_6:                                # %polly.loop_exit4
                                        #   in Loop: Header=BB4_5 Depth=2
	addq	$4, %rbx
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB4_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB4_4 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB4_4
.LBB4_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Lfunc_end4:
	.size	findMoves_polly_subfn, .Lfunc_end4-findMoves_polly_subfn
	.cfi_endproc

	.p2align	4, 0x90
	.type	findMoves_polly_subfn_10,@function
findMoves_polly_subfn_10:               # @findMoves_polly_subfn_10
.Lfunc_begin5:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp91:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp92:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp93:
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
.Ltmp94:
	.cfi_def_cfa_offset 48
.Ltmp95:
	.cfi_offset %rbx, -32
.Ltmp96:
	.cfi_offset %r14, -24
.Ltmp97:
	.cfi_offset %r15, -16
	leaq	8(%rsp), %rdi
	leaq	(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB5_2
# BB#1:
	leaq	8(%rsp), %r14
	leaq	(%rsp), %r15
	.p2align	4, 0x90
.LBB5_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_5 Depth 2
                                        #       Child Loop BB5_8 Depth 3
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	addq	$-2, %rax
	leaq	Y(,%rcx,4), %rbx
	.p2align	4, 0x90
.LBB5_5:                                # %polly.loop_header
                                        #   Parent Loop BB5_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_8 Depth 3
	movl	$5, %esi
	subq	%rcx, %rsi
	js	.LBB5_6
# BB#7:                                 # %polly.loop_preheader3
                                        #   in Loop: Header=BB5_5 Depth=2
	decq	%rsi
	movq	$-1, %rdi
	movq	%rbx, %rdx
	.p2align	4, 0x90
.LBB5_8:                                # %polly.loop_header2
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rdx)
	incq	%rdi
	addq	$28, %rdx
	cmpq	%rsi, %rdi
	jle	.LBB5_8
.LBB5_6:                                # %polly.loop_exit4
                                        #   in Loop: Header=BB5_5 Depth=2
	addq	$4, %rbx
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB5_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB5_4 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB5_4
.LBB5_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Lfunc_end5:
	.size	findMoves_polly_subfn_10, .Lfunc_end5-findMoves_polly_subfn_10
	.cfi_endproc

	.p2align	4, 0x90
	.type	findMoves_polly_subfn_11,@function
findMoves_polly_subfn_11:               # @findMoves_polly_subfn_11
.Lfunc_begin6:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp98:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp99:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp100:
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
.Ltmp101:
	.cfi_def_cfa_offset 48
.Ltmp102:
	.cfi_offset %rbx, -32
.Ltmp103:
	.cfi_offset %r14, -24
.Ltmp104:
	.cfi_offset %r15, -16
	leaq	8(%rsp), %rdi
	leaq	(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB6_2
# BB#1:
	leaq	8(%rsp), %r14
	leaq	(%rsp), %r15
	.p2align	4, 0x90
.LBB6_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_5 Depth 2
                                        #       Child Loop BB6_8 Depth 3
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	addq	$-2, %rax
	leaq	Z(,%rcx,4), %rbx
	.p2align	4, 0x90
.LBB6_5:                                # %polly.loop_header
                                        #   Parent Loop BB6_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_8 Depth 3
	movl	$5, %esi
	subq	%rcx, %rsi
	js	.LBB6_6
# BB#7:                                 # %polly.loop_preheader3
                                        #   in Loop: Header=BB6_5 Depth=2
	decq	%rsi
	movq	$-1, %rdi
	movq	%rbx, %rdx
	.p2align	4, 0x90
.LBB6_8:                                # %polly.loop_header2
                                        #   Parent Loop BB6_4 Depth=1
                                        #     Parent Loop BB6_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rdx)
	incq	%rdi
	addq	$28, %rdx
	cmpq	%rsi, %rdi
	jle	.LBB6_8
.LBB6_6:                                # %polly.loop_exit4
                                        #   in Loop: Header=BB6_5 Depth=2
	addq	$4, %rbx
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB6_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB6_4 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB6_4
.LBB6_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Lfunc_end6:
	.size	findMoves_polly_subfn_11, .Lfunc_end6-findMoves_polly_subfn_11
	.cfi_endproc

	.type	V,@object               # @V
	.data
	.globl	V
	.p2align	4
V:
	.long	6                       # 0x6
	.long	5                       # 0x5
	.long	2                       # 0x2
	.long	7                       # 0x7
	.long	3                       # 0x3
	.long	5                       # 0x5
	.size	V, 24

	.type	sum_alice,@object       # @sum_alice
	.bss
	.globl	sum_alice
	.p2align	2
sum_alice:
	.long	0                       # 0x0
	.size	sum_alice, 4

	.type	sum_bob,@object         # @sum_bob
	.globl	sum_bob
	.p2align	2
sum_bob:
	.long	0                       # 0x0
	.size	sum_bob, 4

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Number of coins = %d\n"
	.size	.L.str, 22

	.type	M,@object               # @M
	.comm	M,144,16
	.type	coins,@object           # @coins
	.comm	coins,24,16
	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"Alice take coin "
	.size	.L.str.1, 17

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"Bob take coin "
	.size	.L.str.2, 15

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"(%d, $%d)"
	.size	.L.str.3, 10

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	", "
	.size	.L.str.4, 3

	.type	Y,@object               # @Y
	.comm	Y,144,16
	.type	X,@object               # @X
	.comm	X,144,16
	.type	Z,@object               # @Z
	.comm	Z,144,16
	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"Alice's sum is Wrong!!!"
	.size	.L.str.6, 24

	.type	.L.str.7,@object        # @.str.7
.L.str.7:
	.asciz	"Alice's sum <= Bob's sum!!!"
	.size	.L.str.7, 28

	.type	.L.str.8,@object        # @.str.8
.L.str.8:
	.asciz	"\nThe total amount of money (maximum) Alice get is %d."
	.size	.L.str.8, 54

	.type	.L.str.9,@object        # @.str.9
.L.str.9:
	.asciz	"\nThe total amount of money (maximum) Bob get is %d."
	.size	.L.str.9, 52

	.type	.Lstr,@object           # @str
.Lstr:
	.asciz	"."
	.size	.Lstr, 2

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)" # string offset=0
.Linfo_string1:
	.asciz	"CoinGame.c"            # string offset=165
.Linfo_string2:
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/handwritten" # string offset=176
.Linfo_string3:
	.asciz	"V"                     # string offset=241
.Linfo_string4:
	.asciz	"int"                   # string offset=243
.Linfo_string5:
	.asciz	"sizetype"              # string offset=247
.Linfo_string6:
	.asciz	"sum_alice"             # string offset=256
.Linfo_string7:
	.asciz	"sum_bob"               # string offset=266
.Linfo_string8:
	.asciz	"M"                     # string offset=274
.Linfo_string9:
	.asciz	"X"                     # string offset=276
.Linfo_string10:
	.asciz	"Y"                     # string offset=278
.Linfo_string11:
	.asciz	"Z"                     # string offset=280
.Linfo_string12:
	.asciz	"coins"                 # string offset=282
.Linfo_string13:
	.asciz	"init"                  # string offset=288
.Linfo_string14:
	.asciz	"play"                  # string offset=293
.Linfo_string15:
	.asciz	"findMoves"             # string offset=298
.Linfo_string16:
	.asciz	"main"                  # string offset=308
.Linfo_string17:
	.asciz	"i"                     # string offset=313
.Linfo_string18:
	.asciz	"j"                     # string offset=315
.Linfo_string19:
	.asciz	"index"                 # string offset=317
.Linfo_string20:
	.asciz	"s"                     # string offset=323
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Ltmp10-.Lfunc_begin0
	.quad	.Ltmp11-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	5                       # 5
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp11-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	4                       # 4
	.byte	159                     # DW_OP_stack_value
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
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	3                       # Abbreviation Code
	.byte	1                       # DW_TAG_array_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	4                       # Abbreviation Code
	.byte	33                      # DW_TAG_subrange_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	55                      # DW_AT_count
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	5                       # Abbreviation Code
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
	.byte	6                       # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
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
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
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
	.byte	9                       # Abbreviation Code
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
	.byte	10                      # Abbreviation Code
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
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
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
	.byte	12                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	0                       # DW_CHILDREN_no
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
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	431                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x1a8 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x15 DW_TAG_variable
	.long	.Linfo_string3          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	V
	.byte	3                       # Abbrev [3] 0x3f:0xc DW_TAG_array_type
	.long	75                      # DW_AT_type
	.byte	4                       # Abbrev [4] 0x44:0x6 DW_TAG_subrange_type
	.long	82                      # DW_AT_type
	.byte	6                       # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x4b:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	6                       # Abbrev [6] 0x52:0x7 DW_TAG_base_type
	.long	.Linfo_string5          # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	2                       # Abbrev [2] 0x59:0x15 DW_TAG_variable
	.long	.Linfo_string6          # DW_AT_name
	.long	75                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	24                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	sum_alice
	.byte	2                       # Abbrev [2] 0x6e:0x15 DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.long	75                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	24                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	sum_bob
	.byte	2                       # Abbrev [2] 0x83:0x15 DW_TAG_variable
	.long	.Linfo_string8          # DW_AT_name
	.long	152                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	17                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	M
	.byte	3                       # Abbrev [3] 0x98:0x12 DW_TAG_array_type
	.long	75                      # DW_AT_type
	.byte	4                       # Abbrev [4] 0x9d:0x6 DW_TAG_subrange_type
	.long	82                      # DW_AT_type
	.byte	6                       # DW_AT_count
	.byte	4                       # Abbrev [4] 0xa3:0x6 DW_TAG_subrange_type
	.long	82                      # DW_AT_type
	.byte	6                       # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	2                       # Abbrev [2] 0xaa:0x15 DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.long	152                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	20                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	X
	.byte	2                       # Abbrev [2] 0xbf:0x15 DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.long	152                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	21                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	Y
	.byte	2                       # Abbrev [2] 0xd4:0x15 DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.long	152                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	22                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	Z
	.byte	2                       # Abbrev [2] 0xe9:0x15 DW_TAG_variable
	.long	.Linfo_string12         # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	23                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	coins
	.byte	7                       # Abbrev [7] 0xfe:0x22 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0x113:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x120:0x3d DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0x135:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x141:0xf DW_TAG_variable
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	8                       # Abbrev [8] 0x150:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	38                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	10                      # Abbrev [10] 0x15d:0x3c DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	103                     # DW_AT_decl_line
	.long	75                      # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0x176:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	104                     # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	11                      # Abbrev [11] 0x182:0xb DW_TAG_variable
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	104                     # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	11                      # Abbrev [11] 0x18d:0xb DW_TAG_variable
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	104                     # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x199:0x19 DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	154                     # DW_AT_decl_line
	.long	75                      # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
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
	.long	435                     # Compilation Unit Length
	.long	288                     # DIE offset
	.asciz	"play"                  # External Name
	.long	89                      # DIE offset
	.asciz	"sum_alice"             # External Name
	.long	254                     # DIE offset
	.asciz	"init"                  # External Name
	.long	409                     # DIE offset
	.asciz	"main"                  # External Name
	.long	42                      # DIE offset
	.asciz	"V"                     # External Name
	.long	110                     # DIE offset
	.asciz	"sum_bob"               # External Name
	.long	170                     # DIE offset
	.asciz	"X"                     # External Name
	.long	191                     # DIE offset
	.asciz	"Y"                     # External Name
	.long	212                     # DIE offset
	.asciz	"Z"                     # External Name
	.long	349                     # DIE offset
	.asciz	"findMoves"             # External Name
	.long	233                     # DIE offset
	.asciz	"coins"                 # External Name
	.long	131                     # DIE offset
	.asciz	"M"                     # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	435                     # Compilation Unit Length
	.long	75                      # DIE offset
	.asciz	"int"                   # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
