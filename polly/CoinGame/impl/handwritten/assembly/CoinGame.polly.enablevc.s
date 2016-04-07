	.text
	.file	"llvm/CoinGame.polly.enablevc.ll"
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
	.loc	1 25 0                  # CoinGame.c:25:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 28 2 prologue_end     # CoinGame.c:28:2
	pushq	%rax
.Ltmp0:
	.cfi_def_cfa_offset 16
	movl	$.L.str, %edi
	movl	$6, %esi
	xorl	%eax, %eax
	callq	printf
.Ltmp1:
	#DEBUG_VALUE: init:i <- 0
	.loc	1 30 8                  # CoinGame.c:30:8
	movaps	.LCPI0_0(%rip), %xmm0   # xmm0 = [0,1,2,3]
	movaps	%xmm0, V(%rip)
	movabsq	$21474836484, %rax      # imm = 0x500000004
	movq	%rax, V+16(%rip)
.Ltmp2:
	.loc	1 32 1                  # CoinGame.c:32:1
	popq	%rax
	retq
.Ltmp3:
.Lfunc_end0:
	.size	init, .Lfunc_end0-init
	.cfi_endproc

	.globl	sumMoves
	.p2align	4, 0x90
	.type	sumMoves,@function
sumMoves:                               # @sumMoves
.Lfunc_begin1:
	.loc	1 34 0                  # CoinGame.c:34:0
	.cfi_startproc
# BB#0:                                 # %entry
	#DEBUG_VALUE: sumMoves:i <- 0
	#DEBUG_VALUE: sumMoves:j <- 5
	movl	$1, %r8d
	movl	$5, %edx
.Ltmp4:
	#DEBUG_VALUE: sumMoves:alice <- 1
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB1_1:                                # %while.body
                                        # =>This Inner Loop Header: Depth=1
.Ltmp5:
	.loc	1 38 12 prologue_end    # CoinGame.c:38:12
	movslq	%edx, %rsi
	.loc	1 38 16 is_stmt 0       # CoinGame.c:38:16
	leal	1(%rdi), %edx
	.loc	1 38 12                 # CoinGame.c:38:12
	movslq	%edx, %r10
	leaq	(,%rsi,4), %rax
	leaq	(%r10,%r10,2), %rdx
	movl	M(%rax,%rdx,8), %r9d
.Ltmp6:
	#DEBUG_VALUE: P1 <- %R9D
	.loc	1 39 19 is_stmt 1       # CoinGame.c:39:19
	leal	-1(%rsi), %edx
	.loc	1 39 12 is_stmt 0       # CoinGame.c:39:12
	movslq	%edi, %rcx
	leaq	(%rcx,%rcx,2), %rdi
.Ltmp7:
	.loc	1 41 10 is_stmt 1       # CoinGame.c:41:10
	cmpl	M-4(%rax,%rdi,8), %r9d
.Ltmp8:
	.loc	1 41 7 is_stmt 0        # CoinGame.c:41:7
	cmovlel	%esi, %edx
	movl	%ecx, %edi
	cmovlel	%r10d, %edi
	cmovgq	%rsi, %rcx
.Ltmp9:
	.loc	1 43 11 is_stmt 1       # CoinGame.c:43:11
	movl	V(,%rcx,4), %esi
.Ltmp10:
	.loc	1 50 7                  # CoinGame.c:50:7
	testl	%r8d, %r8d
.Ltmp11:
	.loc	1 50 7 is_stmt 0        # CoinGame.c:50:7
	je	.LBB1_3
.Ltmp12:
# BB#2:                                 # %if.then12
                                        #   in Loop: Header=BB1_1 Depth=1
	#DEBUG_VALUE: P1 <- %R9D
	.loc	1 51 14 is_stmt 1       # CoinGame.c:51:14
	addl	%esi, sum_alice(%rip)
.Ltmp13:
	#DEBUG_VALUE: sumMoves:alice <- 0
	xorl	%r8d, %r8d
	jmp	.LBB1_4
.Ltmp14:
	.p2align	4, 0x90
.LBB1_3:                                # %if.else14
                                        #   in Loop: Header=BB1_1 Depth=1
	#DEBUG_VALUE: P1 <- %R9D
	.loc	1 54 12                 # CoinGame.c:54:12
	addl	%esi, sum_bob(%rip)
.Ltmp15:
	#DEBUG_VALUE: sumMoves:alice <- 1
	movl	$1, %r8d
.Ltmp16:
.LBB1_4:                                # %while.cond.backedge
                                        #   in Loop: Header=BB1_1 Depth=1
	#DEBUG_VALUE: P1 <- %R9D
	.loc	1 37 2 discriminator 1  # CoinGame.c:37:2
	cmpl	%edx, %edi
	jle	.LBB1_1
.Ltmp17:
# BB#5:                                 # %while.end
	#DEBUG_VALUE: P1 <- %R9D
	.loc	1 59 1                  # CoinGame.c:59:1
	retq
.Ltmp18:
.Lfunc_end1:
	.size	sumMoves, .Lfunc_end1-sumMoves
	.cfi_endproc

	.globl	printMoves
	.p2align	4, 0x90
	.type	printMoves,@function
printMoves:                             # @printMoves
.Lfunc_begin2:
	.loc	1 62 0                  # CoinGame.c:62:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp19:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp20:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp21:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp22:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp23:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp24:
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
.Ltmp25:
	.cfi_def_cfa_offset 80
.Ltmp26:
	.cfi_offset %rbx, -56
.Ltmp27:
	.cfi_offset %r12, -48
.Ltmp28:
	.cfi_offset %r13, -40
.Ltmp29:
	.cfi_offset %r14, -32
.Ltmp30:
	.cfi_offset %r15, -24
.Ltmp31:
	.cfi_offset %rbp, -16
.Ltmp32:
	#DEBUG_VALUE: printMoves:i <- 0
	#DEBUG_VALUE: printMoves:j <- 5
	movb	$1, %r12b
	movl	$5, %r14d
.Ltmp33:
	#DEBUG_VALUE: printMoves:alice <- 1
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB2_1:                                # %while.body
                                        # =>This Inner Loop Header: Depth=1
.Ltmp34:
	.loc	1 66 12 prologue_end    # CoinGame.c:66:12
	movq	%rbx, 16(%rsp)          # 8-byte Spill
	movl	%r14d, 12(%rsp)         # 4-byte Spill
	movslq	%r14d, %rbp
	.loc	1 66 16 is_stmt 0       # CoinGame.c:66:16
	leal	1(%rbx), %r13d
	.loc	1 66 12                 # CoinGame.c:66:12
	movslq	%r13d, %rax
	leaq	(,%rbp,4), %rcx
	leaq	(%rax,%rax,2), %rax
	movl	M(%rcx,%rax,8), %r15d
.Ltmp35:
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 67 12 is_stmt 1       # CoinGame.c:67:12
	movslq	%ebx, %r14
	leaq	(%r14,%r14,2), %rax
	movl	M-4(%rcx,%rax,8), %ebx
.Ltmp36:
	#DEBUG_VALUE: P2 <- %EBX
	.loc	1 68 7                  # CoinGame.c:68:7
	testb	%r12b, %r12b
	je	.LBB2_3
.Ltmp37:
# BB#2:                                 # %if.then
                                        #   in Loop: Header=BB2_1 Depth=1
	#DEBUG_VALUE: P2 <- %EBX
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 69 4                  # CoinGame.c:69:4
	movl	$.L.str.1, %edi
	jmp	.LBB2_4
.Ltmp38:
	.p2align	4, 0x90
.LBB2_3:                                # %if.else
                                        #   in Loop: Header=BB2_1 Depth=1
	#DEBUG_VALUE: P2 <- %EBX
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 71 4                  # CoinGame.c:71:4
	movl	$.L.str.2, %edi
.Ltmp39:
.LBB2_4:                                # %if.end
                                        #   in Loop: Header=BB2_1 Depth=1
	#DEBUG_VALUE: P1 <- %R15D
	#DEBUG_VALUE: P2 <- %EBX
	xorl	%eax, %eax
	callq	printf
.Ltmp40:
	.loc	1 74 10                 # CoinGame.c:74:10
	cmpl	%ebx, %r15d
	jle	.LBB2_5
.Ltmp41:
# BB#6:                                 # %if.else14
                                        #   in Loop: Header=BB2_1 Depth=1
	#DEBUG_VALUE: P2 <- %EBX
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 67 19                 # CoinGame.c:67:19
	leal	-1(%rbp), %r14d
.Ltmp42:
	.loc	1 78 26                 # CoinGame.c:78:26
	leal	1(%rbp), %esi
	.loc	1 78 31 is_stmt 0       # CoinGame.c:78:31
	movl	V(,%rbp,4), %edx
	.loc	1 78 4                  # CoinGame.c:78:4
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	callq	printf
	movq	16(%rsp), %rbx          # 8-byte Reload
.Ltmp43:
	jmp	.LBB2_7
.Ltmp44:
	.p2align	4, 0x90
.LBB2_5:                                # %if.then9
                                        #   in Loop: Header=BB2_1 Depth=1
	#DEBUG_VALUE: P2 <- %EBX
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 75 31 is_stmt 1       # CoinGame.c:75:31
	movl	V(,%r14,4), %edx
	.loc	1 75 4 is_stmt 0        # CoinGame.c:75:4
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	movl	%r13d, %esi
	callq	printf
	movl	%r13d, %ebx
.Ltmp45:
	movl	12(%rsp), %r14d         # 4-byte Reload
.Ltmp46:
.LBB2_7:                                # %if.end19
                                        #   in Loop: Header=BB2_1 Depth=1
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 81 7 is_stmt 1        # CoinGame.c:81:7
	testb	%r12b, %r12b
	je	.LBB2_9
.Ltmp47:
# BB#8:                                 # %if.then21
                                        #   in Loop: Header=BB2_1 Depth=1
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 82 4                  # CoinGame.c:82:4
	movl	$.L.str.4, %edi
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB2_10
.Ltmp48:
	.p2align	4, 0x90
.LBB2_9:                                # %if.else23
                                        #   in Loop: Header=BB2_1 Depth=1
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 84 4                  # CoinGame.c:84:4
	movl	$.Lstr, %edi
	callq	puts
.Ltmp49:
.LBB2_10:                               # %if.end25
                                        #   in Loop: Header=BB2_1 Depth=1
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 86 9                  # CoinGame.c:86:9
	testb	%r12b, %r12b
	sete	%r12b
.Ltmp50:
	.loc	1 65 2 discriminator 1  # CoinGame.c:65:2
	cmpl	%r14d, %ebx
	jle	.LBB2_1
.Ltmp51:
# BB#11:                                # %while.end
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 89 1                  # CoinGame.c:89:1
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
.Ltmp52:
	popq	%rbp
	retq
.Ltmp53:
.Lfunc_end2:
	.size	printMoves, .Lfunc_end2-printMoves
	.cfi_endproc

	.globl	maxMoney
	.p2align	4, 0x90
	.type	maxMoney,@function
maxMoney:                               # @maxMoney
.Lfunc_begin3:
	.loc	1 91 0                  # CoinGame.c:91:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp54:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp55:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp56:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp57:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp58:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp59:
	.cfi_def_cfa_offset 56
.Ltmp60:
	.cfi_offset %rbx, -56
.Ltmp61:
	.cfi_offset %r12, -48
.Ltmp62:
	.cfi_offset %r13, -40
.Ltmp63:
	.cfi_offset %r14, -32
.Ltmp64:
	.cfi_offset %r15, -24
.Ltmp65:
	.cfi_offset %rbp, -16
	xorl	%eax, %eax
.Ltmp66:
	#DEBUG_VALUE: maxMoney:s <- 0
	movl	$1, %r8d
	xorl	%ecx, %ecx
	jmp	.LBB3_1
.LBB3_15:                               # %polly.merge240.thread
                                        #   in Loop: Header=BB3_1 Depth=1
	incq	%rdx
	movq	%rdx, %rcx
	.p2align	4, 0x90
.LBB3_1:                                # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_10 Depth 2
                                        #     Child Loop BB3_12 Depth 2
                                        #     Child Loop BB3_14 Depth 2
                                        #     Child Loop BB3_5 Depth 2
	movq	%rcx, %rdx
	cmpq	$3, %rdx
	jge	.LBB3_8
# BB#2:                                 # %polly.loop_preheader233
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	$0, X(,%rdx,4)
	movl	$0, X+28(,%rdx,4)
	movl	$0, X+56(,%rdx,4)
	movl	$0, X+84(,%rdx,4)
	cmpq	$2, %rdx
	movl	$3, %ecx
	je	.LBB3_1
# BB#3:                                 # %polly.loop_preheader244.split
                                        #   in Loop: Header=BB3_1 Depth=1
	cmpq	%rdx, %r8
	js	.LBB3_15
# BB#4:                                 # %polly.loop_header253.us542.1.preheader
                                        #   in Loop: Header=BB3_1 Depth=1
	movq	%rdx, %rsi
	negq	%rsi
	leaq	X+112(,%rdx,4), %rdi
	movq	$-1, %rbx
	.p2align	4, 0x90
.LBB3_5:                                # %polly.loop_header253.us542.1
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$0, (%rdi)
	incq	%rbx
	addq	$28, %rdi
	cmpq	%rsi, %rbx
	jle	.LBB3_5
	jmp	.LBB3_6
	.p2align	4, 0x90
.LBB3_8:                                # %polly.loop_preheader244.split.us
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	$4, %esi
	subq	%rdx, %rsi
	cmpq	%rdx, %r8
	js	.LBB3_9
# BB#11:                                # %polly.loop_header267.us.us.preheader
                                        #   in Loop: Header=BB3_1 Depth=1
	movq	%rdx, %rdi
	negq	%rdi
	leaq	X(,%rdx,4), %rbx
	movq	$-1, %rcx
	.p2align	4, 0x90
.LBB3_12:                               # %polly.loop_header267.us.us
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$0, (%rbx)
	incq	%rcx
	addq	$28, %rbx
	cmpq	%rsi, %rcx
	jle	.LBB3_12
# BB#13:                                # %polly.loop_header253.us.us.1.preheader
                                        #   in Loop: Header=BB3_1 Depth=1
	leaq	X+112(,%rdx,4), %rsi
	movq	$-1, %rbx
	.p2align	4, 0x90
.LBB3_14:                               # %polly.loop_header253.us.us.1
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$0, (%rsi)
	incq	%rbx
	addq	$28, %rsi
	cmpq	%rdi, %rbx
	jle	.LBB3_14
	jmp	.LBB3_6
.LBB3_9:                                # %polly.loop_header267.us.preheader
                                        #   in Loop: Header=BB3_1 Depth=1
	leaq	X(,%rdx,4), %rdi
	movq	$-1, %rbx
	.p2align	4, 0x90
.LBB3_10:                               # %polly.loop_header267.us
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$0, (%rdi)
	incq	%rbx
	addq	$28, %rdi
	cmpq	%rsi, %rbx
	jle	.LBB3_10
.LBB3_6:                                # %polly.merge240
                                        #   in Loop: Header=BB3_1 Depth=1
	leaq	1(%rdx), %rcx
	cmpq	$5, %rdx
	jl	.LBB3_1
# BB#7:
	movl	$1, %r8d
	xorl	%ecx, %ecx
	jmp	.LBB3_19
.LBB3_30:                               # %polly.merge297.thread
                                        #   in Loop: Header=BB3_19 Depth=1
	incq	%rsi
	movq	%rsi, %rax
	jmp	.LBB3_19
	.p2align	4, 0x90
.LBB3_16:                               # %polly.merge297
                                        #   in Loop: Header=BB3_19 Depth=1
	leaq	1(%rsi), %rax
	cmpq	$5, %rsi
	jl	.LBB3_19
	jmp	.LBB3_17
	.p2align	4, 0x90
.LBB3_18:                               # %polly.loop_preheader289
                                        #   in Loop: Header=BB3_19 Depth=1
	movl	$0, Y(,%rsi,4)
	movl	$0, Y+28(,%rsi,4)
	movl	$0, Y+56(,%rsi,4)
	movl	$0, Y+84(,%rsi,4)
	cmpq	$2, %rsi
	movl	$3, %eax
	jne	.LBB3_27
.LBB3_19:                               # %polly.loop_header278
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_22 Depth 2
                                        #     Child Loop BB3_24 Depth 2
                                        #     Child Loop BB3_26 Depth 2
                                        #     Child Loop BB3_29 Depth 2
	movq	%rax, %rsi
	cmpq	$3, %rsi
	jl	.LBB3_18
# BB#20:                                # %polly.loop_preheader301.split.us
                                        #   in Loop: Header=BB3_19 Depth=1
	movl	$4, %eax
	subq	%rsi, %rax
	cmpq	%rsi, %r8
	js	.LBB3_21
# BB#23:                                # %polly.loop_header329.us.us.preheader
                                        #   in Loop: Header=BB3_19 Depth=1
	movq	%rsi, %rdi
	negq	%rdi
	leaq	Y(,%rsi,4), %rbx
	movq	$-1, %rdx
	.p2align	4, 0x90
.LBB3_24:                               # %polly.loop_header329.us.us
                                        #   Parent Loop BB3_19 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$0, (%rbx)
	incq	%rdx
	addq	$28, %rbx
	cmpq	%rax, %rdx
	jle	.LBB3_24
# BB#25:                                # %polly.loop_header311.us.us.1.preheader
                                        #   in Loop: Header=BB3_19 Depth=1
	leaq	Y+112(,%rsi,4), %rax
	movq	$-1, %rbx
	.p2align	4, 0x90
.LBB3_26:                               # %polly.loop_header311.us.us.1
                                        #   Parent Loop BB3_19 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$0, (%rax)
	incq	%rbx
	addq	$28, %rax
	cmpq	%rdi, %rbx
	jle	.LBB3_26
	jmp	.LBB3_16
	.p2align	4, 0x90
.LBB3_27:                               # %polly.loop_preheader301.split
                                        #   in Loop: Header=BB3_19 Depth=1
	cmpq	%rsi, %r8
	js	.LBB3_30
# BB#28:                                # %polly.loop_header311.us521.1.preheader
                                        #   in Loop: Header=BB3_19 Depth=1
	movq	%rsi, %rax
	negq	%rax
	leaq	Y+112(,%rsi,4), %rdi
	movq	$-1, %rbx
	.p2align	4, 0x90
.LBB3_29:                               # %polly.loop_header311.us521.1
                                        #   Parent Loop BB3_19 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$0, (%rdi)
	incq	%rbx
	addq	$28, %rdi
	cmpq	%rax, %rbx
	jle	.LBB3_29
	jmp	.LBB3_16
.LBB3_21:                               # %polly.loop_header329.us.preheader
                                        #   in Loop: Header=BB3_19 Depth=1
	leaq	Y(,%rsi,4), %rdi
	movq	$-1, %rbx
	.p2align	4, 0x90
.LBB3_22:                               # %polly.loop_header329.us
                                        #   Parent Loop BB3_19 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$0, (%rdi)
	incq	%rbx
	addq	$28, %rdi
	cmpq	%rax, %rbx
	jle	.LBB3_22
	jmp	.LBB3_16
.LBB3_17:
	movl	$1, %eax
	jmp	.LBB3_42
.LBB3_53:                               # %polly.merge361.thread
                                        #   in Loop: Header=BB3_42 Depth=1
	incq	%rdx
	movq	%rdx, %rcx
	jmp	.LBB3_42
	.p2align	4, 0x90
.LBB3_31:                               # %polly.merge361
                                        #   in Loop: Header=BB3_42 Depth=1
	leaq	1(%rdx), %rcx
	cmpq	$5, %rdx
	jl	.LBB3_42
	jmp	.LBB3_32
	.p2align	4, 0x90
.LBB3_41:                               # %polly.loop_preheader353
                                        #   in Loop: Header=BB3_42 Depth=1
	movl	$0, Z(,%rdx,4)
	movl	$0, Z+28(,%rdx,4)
	movl	$0, Z+56(,%rdx,4)
	movl	$0, Z+84(,%rdx,4)
	cmpq	$2, %rdx
	movl	$3, %ecx
	jne	.LBB3_50
.LBB3_42:                               # %polly.loop_header342
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_45 Depth 2
                                        #     Child Loop BB3_47 Depth 2
                                        #     Child Loop BB3_49 Depth 2
                                        #     Child Loop BB3_52 Depth 2
	movq	%rcx, %rdx
	cmpq	$3, %rdx
	jl	.LBB3_41
# BB#43:                                # %polly.loop_preheader365.split.us
                                        #   in Loop: Header=BB3_42 Depth=1
	movl	$4, %ecx
	subq	%rdx, %rcx
	cmpq	%rdx, %rax
	js	.LBB3_44
# BB#46:                                # %polly.loop_header391.us.us.preheader
                                        #   in Loop: Header=BB3_42 Depth=1
	movq	%rdx, %rsi
	negq	%rsi
	leaq	Z(,%rdx,4), %rdi
	movq	$-1, %rbx
	.p2align	4, 0x90
.LBB3_47:                               # %polly.loop_header391.us.us
                                        #   Parent Loop BB3_42 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$0, (%rdi)
	incq	%rbx
	addq	$28, %rdi
	cmpq	%rcx, %rbx
	jle	.LBB3_47
# BB#48:                                # %polly.loop_header375.us.us.1.preheader
                                        #   in Loop: Header=BB3_42 Depth=1
	leaq	Z+112(,%rdx,4), %rcx
	movq	$-1, %rdi
	.p2align	4, 0x90
.LBB3_49:                               # %polly.loop_header375.us.us.1
                                        #   Parent Loop BB3_42 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$0, (%rcx)
	incq	%rdi
	addq	$28, %rcx
	cmpq	%rsi, %rdi
	jle	.LBB3_49
	jmp	.LBB3_31
	.p2align	4, 0x90
.LBB3_50:                               # %polly.loop_preheader365.split
                                        #   in Loop: Header=BB3_42 Depth=1
	cmpq	%rdx, %rax
	js	.LBB3_53
# BB#51:                                # %polly.loop_header375.us500.1.preheader
                                        #   in Loop: Header=BB3_42 Depth=1
	movq	%rdx, %rcx
	negq	%rcx
	leaq	Z+112(,%rdx,4), %rsi
	movq	$-1, %rdi
	.p2align	4, 0x90
.LBB3_52:                               # %polly.loop_header375.us500.1
                                        #   Parent Loop BB3_42 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$0, (%rsi)
	incq	%rdi
	addq	$28, %rsi
	cmpq	%rcx, %rdi
	jle	.LBB3_52
	jmp	.LBB3_31
.LBB3_44:                               # %polly.loop_header391.us.preheader
                                        #   in Loop: Header=BB3_42 Depth=1
	leaq	Z(,%rdx,4), %rsi
	movq	$-1, %rdi
	.p2align	4, 0x90
.LBB3_45:                               # %polly.loop_header391.us
                                        #   Parent Loop BB3_42 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$0, (%rsi)
	incq	%rdi
	addq	$28, %rsi
	cmpq	%rcx, %rdi
	jle	.LBB3_45
	jmp	.LBB3_31
.LBB3_32:                               # %polly.loop_header402.preheader
	movl	V(%rip), %eax
	movl	%eax, -20(%rsp)         # 4-byte Spill
	movl	$1, %eax
	xorl	%r12d, %r12d
	movl	$2, %ecx
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB3_33:                               # %polly.loop_header402
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_58 Depth 2
                                        #     Child Loop BB3_60 Depth 2
                                        #     Child Loop BB3_62 Depth 2
                                        #     Child Loop BB3_38 Depth 2
	movq	%rcx, -16(%rsp)         # 8-byte Spill
	movq	%rax, -8(%rsp)          # 8-byte Spill
	testq	%rcx, %rcx
	movl	$0, %r14d
	cmovnsq	%rcx, %r14
	testq	%rax, %rax
	movl	$0, %ecx
	cmovnsq	%rax, %rcx
	testq	%r13, %r13
	jle	.LBB3_34
# BB#54:                                # %polly.then410
                                        #   in Loop: Header=BB3_33 Depth=1
	movl	$7, %edx
	subl	%r13d, %edx
	testb	$1, %dl
	movl	$0, %edx
	je	.LBB3_56
# BB#55:                                # %polly.loop_header412.prol
                                        #   in Loop: Header=BB3_33 Depth=1
	movl	X-4(,%r13,4), %edx
.Ltmp67:
	.loc	1 127 13 prologue_end   # CoinGame.c:127:13
	addl	-20(%rsp), %edx         # 4-byte Folded Reload
	movl	Z-4(,%r13,4), %esi
	.loc	1 127 30 is_stmt 0      # CoinGame.c:127:30
	addl	V-4(,%r13,4), %esi
	.loc	1 127 23                # CoinGame.c:127:23
	cmpl	%esi, %edx
.Ltmp68:
	.loc	1 127 8                 # CoinGame.c:127:8
	cmovgel	%edx, %esi
	movl	%esi, M-4(,%r13,4)
	movl	$1, %edx
.LBB3_56:                               # %polly.then410.split
                                        #   in Loop: Header=BB3_33 Depth=1
	cmpq	$6, %r13
	je	.LBB3_34
# BB#57:                                # %polly.then410.split.split
                                        #   in Loop: Header=BB3_33 Depth=1
	movl	$7, %ebx
	subq	%rdx, %rbx
	leaq	V(,%rdx,4), %r11
	imulq	$28, %rdx, %r15
	xorl	%edx, %edx
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB3_58:                               # %polly.loop_header412
                                        #   Parent Loop BB3_33 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	(%r11,%rdi), %rbp
	leaq	(%r15,%rdx), %r8
	movl	X-4(%r8,%r13,4), %r9d
.Ltmp69:
	.loc	1 127 13                # CoinGame.c:127:13
	addl	(%r11,%rdi), %r9d
	movl	Z-4(%r8,%r13,4), %r10d
	.loc	1 127 30                # CoinGame.c:127:30
	addl	-4(%rbp,%r13,4), %r10d
	.loc	1 127 23                # CoinGame.c:127:23
	cmpl	%r10d, %r9d
.Ltmp70:
	.loc	1 127 8                 # CoinGame.c:127:8
	cmovgel	%r9d, %r10d
	movl	%r10d, M-4(%r8,%r13,4)
	movl	X+24(%r8,%r13,4), %esi
.Ltmp71:
	.loc	1 127 13                # CoinGame.c:127:13
	addl	4(%r11,%rdi), %esi
	movl	Z+24(%r8,%r13,4), %eax
	.loc	1 127 30                # CoinGame.c:127:30
	addl	(%rbp,%r13,4), %eax
	.loc	1 127 23                # CoinGame.c:127:23
	cmpl	%eax, %esi
.Ltmp72:
	.loc	1 127 8                 # CoinGame.c:127:8
	cmovgel	%esi, %eax
	movl	%eax, M+24(%r8,%r13,4)
	addq	$-2, %rbx
	addq	$8, %rdi
	addq	$56, %rdx
	cmpq	%r13, %rbx
	jne	.LBB3_58
.Ltmp73:
.LBB3_34:                               # %polly.merge409
                                        #   in Loop: Header=BB3_33 Depth=1
	movl	$1, %edx
	subq	%r13, %rdx
	movl	$0, %esi
	cmovnsq	%rdx, %rsi
	movl	$5, %ebx
	subq	%r13, %rbx
	cmpq	$4, %rbx
	movq	%rbx, %rdx
	movl	$4, %eax
	cmovgq	%rax, %rdx
	cmpq	%rdx, %rsi
	jg	.LBB3_35
# BB#59:                                # %polly.loop_preheader429
                                        #   in Loop: Header=BB3_33 Depth=1
	imulq	$28, %rcx, %rsi
	decq	%rcx
	addq	%r12, %rsi
	decq	%rdx
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB3_60:                               # %polly.loop_header428
                                        #   Parent Loop BB3_33 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	M+20(%rsi,%rdi), %eax
	movl	%eax, Y(%rsi,%rdi)
	incq	%rcx
	addq	$28, %rdi
	cmpq	%rdx, %rcx
	jle	.LBB3_60
.LBB3_35:                               # %polly.loop_exit430
                                        #   in Loop: Header=BB3_33 Depth=1
	cmpq	$3, %rbx
	movq	%rbx, %rcx
	movl	$3, %eax
	cmovgq	%rax, %rcx
	testq	%rcx, %rcx
	js	.LBB3_36
# BB#61:                                # %polly.loop_preheader443
                                        #   in Loop: Header=BB3_33 Depth=1
	decq	%rcx
	movq	$-1, %rdx
	movq	%r12, %rsi
	.p2align	4, 0x90
.LBB3_62:                               # %polly.loop_header442
                                        #   Parent Loop BB3_33 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	M+48(%rsi), %eax
	movl	Y(%rsi), %edi
.Ltmp74:
	.loc	1 107 17 is_stmt 1      # CoinGame.c:107:17
	cmpl	%edi, %eax
.Ltmp75:
	.loc	1 107 9 is_stmt 0       # CoinGame.c:107:9
	cmovgl	%edi, %eax
	movl	%eax, X(%rsi)
	incq	%rdx
	addq	$28, %rsi
	cmpq	%rcx, %rdx
	jle	.LBB3_62
.Ltmp76:
.LBB3_36:                               # %polly.loop_exit444
                                        #   in Loop: Header=BB3_33 Depth=1
	movl	$2, %ecx
	subq	%r13, %rcx
	movl	$0, %edx
	cmovnsq	%rcx, %rdx
	cmpq	%rbx, %rdx
	jg	.LBB3_39
# BB#37:                                #   in Loop: Header=BB3_33 Depth=1
	imulq	$28, %r14, %rcx
	decq	%r14
	.p2align	4, 0x90
.LBB3_38:                               # %polly.loop_header459
                                        #   Parent Loop BB3_33 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	M-8(%rcx,%r12), %eax
	movl	Y(%rcx,%r12), %edx
.Ltmp77:
	.loc	1 115 17 is_stmt 1      # CoinGame.c:115:17
	cmpl	%edx, %eax
.Ltmp78:
	.loc	1 115 9 is_stmt 0       # CoinGame.c:115:9
	cmovgl	%edx, %eax
	movl	%eax, Z(%rcx,%r12)
	incq	%r14
	addq	$28, %rcx
	cmpq	%rbx, %r14
	jl	.LBB3_38
.Ltmp79:
.LBB3_39:                               # %polly.loop_exit461
                                        #   in Loop: Header=BB3_33 Depth=1
	incq	%r13
	movq	-8(%rsp), %rax          # 8-byte Reload
	decq	%rax
	addq	$4, %r12
	movq	-16(%rsp), %rcx         # 8-byte Reload
	decq	%rcx
	cmpq	$7, %r13
	jne	.LBB3_33
# BB#40:                                # %polly.exiting
	.loc	1 140 9 is_stmt 1       # CoinGame.c:140:9
	movl	M+20(%rip), %eax
	.loc	1 140 2 is_stmt 0       # CoinGame.c:140:2
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp80:
.Lfunc_end3:
	.size	maxMoney, .Lfunc_end3-maxMoney
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin4:
	.loc	1 142 0 is_stmt 1       # CoinGame.c:142:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 144 2 prologue_end    # CoinGame.c:144:2
	pushq	%rax
.Ltmp81:
	.cfi_def_cfa_offset 16
	callq	maxMoney
.Ltmp82:
	#DEBUG_VALUE: sumMoves:j <- 5
	#DEBUG_VALUE: sumMoves:i <- 0
	movl	$1, %r8d
	movl	$5, %edx
.Ltmp83:
	#DEBUG_VALUE: sumMoves:alice <- 1
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB4_1:                                # %while.body.i
                                        # =>This Inner Loop Header: Depth=1
.Ltmp84:
	.loc	1 38 12                 # CoinGame.c:38:12
	movslq	%edx, %rsi
	.loc	1 38 16 is_stmt 0       # CoinGame.c:38:16
	leal	1(%rdi), %edx
	.loc	1 38 12                 # CoinGame.c:38:12
	movslq	%edx, %r10
	leaq	(,%rsi,4), %rax
	leaq	(%r10,%r10,2), %rdx
	movl	M(%rax,%rdx,8), %r9d
.Ltmp85:
	#DEBUG_VALUE: P1 <- %R9D
	.loc	1 39 19 is_stmt 1       # CoinGame.c:39:19
	leal	-1(%rsi), %edx
	.loc	1 39 12 is_stmt 0       # CoinGame.c:39:12
	movslq	%edi, %rcx
	leaq	(%rcx,%rcx,2), %rdi
.Ltmp86:
	.loc	1 41 10 is_stmt 1       # CoinGame.c:41:10
	cmpl	M-4(%rax,%rdi,8), %r9d
.Ltmp87:
	.loc	1 41 7 is_stmt 0        # CoinGame.c:41:7
	cmovlel	%esi, %edx
	movl	%ecx, %edi
	cmovlel	%r10d, %edi
	cmovgq	%rsi, %rcx
.Ltmp88:
	.loc	1 43 11 is_stmt 1       # CoinGame.c:43:11
	movl	V(,%rcx,4), %esi
.Ltmp89:
	.loc	1 50 7                  # CoinGame.c:50:7
	testl	%r8d, %r8d
.Ltmp90:
	.loc	1 50 7 is_stmt 0        # CoinGame.c:50:7
	je	.LBB4_3
.Ltmp91:
# BB#2:                                 # %if.then12.i
                                        #   in Loop: Header=BB4_1 Depth=1
	#DEBUG_VALUE: P1 <- %R9D
	.loc	1 51 14 is_stmt 1       # CoinGame.c:51:14
	addl	%esi, sum_alice(%rip)
.Ltmp92:
	#DEBUG_VALUE: sumMoves:alice <- 0
	xorl	%r8d, %r8d
	jmp	.LBB4_4
.Ltmp93:
	.p2align	4, 0x90
.LBB4_3:                                # %if.else14.i
                                        #   in Loop: Header=BB4_1 Depth=1
	#DEBUG_VALUE: P1 <- %R9D
	.loc	1 54 12                 # CoinGame.c:54:12
	addl	%esi, sum_bob(%rip)
.Ltmp94:
	#DEBUG_VALUE: sumMoves:alice <- 1
	movl	$1, %r8d
.Ltmp95:
.LBB4_4:                                # %while.cond.backedge.i
                                        #   in Loop: Header=BB4_1 Depth=1
	#DEBUG_VALUE: P1 <- %R9D
	.loc	1 37 2 discriminator 1  # CoinGame.c:37:2
	cmpl	%edx, %edi
	jle	.LBB4_1
.Ltmp96:
# BB#5:                                 # %sumMoves.exit
	#DEBUG_VALUE: P1 <- %R9D
	.loc	1 148 6                 # CoinGame.c:148:6
	movl	sum_alice(%rip), %esi
	.loc	1 148 16 is_stmt 0      # CoinGame.c:148:16
	cmpl	M+20(%rip), %esi
	jne	.LBB4_6
.Ltmp97:
# BB#8:                                 # %if.end
	#DEBUG_VALUE: P1 <- %R9D
	.loc	1 153 6 is_stmt 1       # CoinGame.c:153:6
	cmpl	sum_bob(%rip), %esi
	jl	.LBB4_9
.Ltmp98:
# BB#10:                                # %if.end5
	#DEBUG_VALUE: P1 <- %R9D
	.loc	1 158 2                 # CoinGame.c:158:2
	movl	$.L.str.8, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp99:
	.loc	1 159 65                # CoinGame.c:159:65
	movl	sum_bob(%rip), %esi
	.loc	1 159 2 is_stmt 0       # CoinGame.c:159:2
	movl	$.L.str.9, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 160 1 is_stmt 1       # CoinGame.c:160:1
	xorl	%eax, %eax
	popq	%rcx
	retq
.LBB4_6:                                # %if.then
.Ltmp100:
	#DEBUG_VALUE: P1 <- %R9D
	.loc	1 149 3                 # CoinGame.c:149:3
	movl	$.L.str.6, %edi
	jmp	.LBB4_7
.Ltmp101:
.LBB4_9:                                # %if.then3
	#DEBUG_VALUE: P1 <- %R9D
	.loc	1 154 3                 # CoinGame.c:154:3
	movl	$.L.str.7, %edi
.Ltmp102:
.LBB4_7:                                # %if.then
	#DEBUG_VALUE: P1 <- %R9D
	.loc	1 149 3                 # CoinGame.c:149:3
	xorl	%eax, %eax
	callq	printf
.Ltmp103:
	.loc	1 150 3                 # CoinGame.c:150:3
	movl	$-1, %edi
	callq	exit
.Ltmp104:
.Lfunc_end4:
	.size	main, .Lfunc_end4-main
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
	.asciz	"sumMoves"              # string offset=282
.Linfo_string13:
	.asciz	"j"                     # string offset=291
.Linfo_string14:
	.asciz	"i"                     # string offset=293
.Linfo_string15:
	.asciz	"alice"                 # string offset=295
.Linfo_string16:
	.asciz	"P1"                    # string offset=301
.Linfo_string17:
	.asciz	"P2"                    # string offset=304
.Linfo_string18:
	.asciz	"coin"                  # string offset=307
.Linfo_string19:
	.asciz	"init"                  # string offset=312
.Linfo_string20:
	.asciz	"printMoves"            # string offset=317
.Linfo_string21:
	.asciz	"maxMoney"              # string offset=328
.Linfo_string22:
	.asciz	"main"                  # string offset=337
.Linfo_string23:
	.asciz	"_Bool"                 # string offset=342
.Linfo_string24:
	.asciz	"s"                     # string offset=348
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Ltmp4-.Lfunc_begin0
	.quad	.Ltmp13-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Ltmp6-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	89                      # super-register DW_OP_reg9
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc2:
	.quad	.Ltmp35-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	95                      # super-register DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Ltmp36-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Ltmp83-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp92-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp94-.Lfunc_begin0
	.quad	.Lfunc_end4-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp99-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	89                      # super-register DW_OP_reg9
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Ltmp103-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	89                      # super-register DW_OP_reg9
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
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
	.byte	10                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	12                      # Abbreviation Code
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	13                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	14                      # Abbreviation Code
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
	.byte	15                      # Abbreviation Code
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
	.byte	16                      # Abbreviation Code
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
	.byte	17                      # Abbreviation Code
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
	.byte	18                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
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
	.byte	32                      # DW_AT_inline
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	19                      # Abbreviation Code
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	20                      # Abbreviation Code
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
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	674                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x29b DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin0 # DW_AT_high_pc
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
	.byte	23                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	sum_alice
	.byte	2                       # Abbrev [2] 0x6e:0x15 DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.long	75                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	23                      # DW_AT_decl_line
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
	.byte	7                       # Abbrev [7] 0xe9:0x22 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	25                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0xfe:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0x10b:0x4a DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	503                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x11e:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	522                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x124:0x6 DW_TAG_variable
	.byte	5                       # DW_AT_const_value
	.long	511                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x12a:0x9 DW_TAG_variable
	.long	.Ldebug_loc0            # DW_AT_location
	.long	533                     # DW_AT_abstract_origin
	.byte	12                      # Abbrev [12] 0x133:0x21 DW_TAG_lexical_block
	.quad	.Ltmp5                  # DW_AT_low_pc
	.long	.Ltmp16-.Ltmp5          # DW_AT_high_pc
	.byte	11                      # Abbrev [11] 0x140:0x9 DW_TAG_variable
	.long	.Ldebug_loc1            # DW_AT_location
	.long	545                     # DW_AT_abstract_origin
	.byte	13                      # Abbrev [13] 0x149:0x5 DW_TAG_variable
	.long	556                     # DW_AT_abstract_origin
	.byte	13                      # Abbrev [13] 0x14e:0x5 DW_TAG_variable
	.long	567                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x155:0x66 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0x16a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	8                       # Abbrev [8] 0x176:0xc DW_TAG_variable
	.byte	5                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	14                      # Abbrev [14] 0x182:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	670                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x18e:0x2c DW_TAG_lexical_block
	.quad	.Ltmp34                 # DW_AT_low_pc
	.long	.Ltmp50-.Ltmp34         # DW_AT_high_pc
	.byte	15                      # Abbrev [15] 0x19b:0xf DW_TAG_variable
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	66                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1aa:0xf DW_TAG_variable
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	67                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	16                      # Abbrev [16] 0x1bb:0x3c DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	91                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0x1d4:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	92                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	17                      # Abbrev [17] 0x1e0:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	92                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	17                      # Abbrev [17] 0x1eb:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	92                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	18                      # Abbrev [18] 0x1f7:0x4d DW_TAG_subprogram
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	17                      # Abbrev [17] 0x1ff:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	17                      # Abbrev [17] 0x20a:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	17                      # Abbrev [17] 0x215:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	19                      # Abbrev [19] 0x220:0x23 DW_TAG_lexical_block
	.byte	17                      # Abbrev [17] 0x221:0xb DW_TAG_variable
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	38                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	17                      # Abbrev [17] 0x22c:0xb DW_TAG_variable
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	39                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	17                      # Abbrev [17] 0x237:0xb DW_TAG_variable
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	40                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	16                      # Abbrev [16] 0x244:0x5a DW_TAG_subprogram
	.quad	.Lfunc_begin4           # DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin4 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	142                     # DW_AT_decl_line
	.long	75                      # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	20                      # Abbrev [20] 0x25d:0x40 DW_TAG_inlined_subroutine
	.long	503                     # DW_AT_abstract_origin
	.quad	.Ltmp84                 # DW_AT_low_pc
	.long	.Ltmp96-.Ltmp84         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	145                     # DW_AT_call_line
	.byte	10                      # Abbrev [10] 0x270:0x6 DW_TAG_variable
	.byte	5                       # DW_AT_const_value
	.long	511                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x276:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	522                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x27c:0x9 DW_TAG_variable
	.long	.Ldebug_loc4            # DW_AT_location
	.long	533                     # DW_AT_abstract_origin
	.byte	12                      # Abbrev [12] 0x285:0x17 DW_TAG_lexical_block
	.quad	.Ltmp84                 # DW_AT_low_pc
	.long	.Ltmp95-.Ltmp84         # DW_AT_high_pc
	.byte	11                      # Abbrev [11] 0x292:0x9 DW_TAG_variable
	.long	.Ldebug_loc5            # DW_AT_location
	.long	545                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x29e:0x7 DW_TAG_base_type
	.long	.Linfo_string23         # DW_AT_name
	.byte	2                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
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
	.long	678                     # Compilation Unit Length
	.long	341                     # DIE offset
	.asciz	"printMoves"            # External Name
	.long	89                      # DIE offset
	.asciz	"sum_alice"             # External Name
	.long	233                     # DIE offset
	.asciz	"init"                  # External Name
	.long	580                     # DIE offset
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
	.long	131                     # DIE offset
	.asciz	"M"                     # External Name
	.long	443                     # DIE offset
	.asciz	"maxMoney"              # External Name
	.long	503                     # DIE offset
	.asciz	"sumMoves"              # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	678                     # Compilation Unit Length
	.long	75                      # DIE offset
	.asciz	"int"                   # External Name
	.long	670                     # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
