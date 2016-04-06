	.text
	.file	"llvm/CoinGame.openmp.disablevc.ll"
	.file	1 "CoinGame.c"
	.globl	printMoves
	.p2align	4, 0x90
	.type	printMoves,@function
printMoves:                             # @printMoves
.Lfunc_begin0:
	.loc	1 26 0                  # CoinGame.c:26:0
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
	subq	$24, %rsp
.Ltmp6:
	.cfi_def_cfa_offset 80
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
.Ltmp13:
	#DEBUG_VALUE: printMoves:m <- 0
	#DEBUG_VALUE: printMoves:n <- 5
	movb	$1, %r12b
	movl	$5, %r14d
.Ltmp14:
	#DEBUG_VALUE: printMoves:alice <- 1
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB0_1:                                # %while.body
                                        # =>This Inner Loop Header: Depth=1
.Ltmp15:
	.loc	1 30 12 prologue_end    # CoinGame.c:30:12
	movq	%rbx, 16(%rsp)          # 8-byte Spill
	movl	%r14d, 12(%rsp)         # 4-byte Spill
	movslq	%r14d, %rbp
	.loc	1 30 16 is_stmt 0       # CoinGame.c:30:16
	leal	1(%rbx), %r13d
	.loc	1 30 12                 # CoinGame.c:30:12
	movslq	%r13d, %rax
	leaq	(,%rbp,4), %rcx
	leaq	(%rax,%rax,2), %rax
	movl	M(%rcx,%rax,8), %r15d
.Ltmp16:
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 31 12 is_stmt 1       # CoinGame.c:31:12
	movslq	%ebx, %r14
	leaq	(%r14,%r14,2), %rax
	movl	M-4(%rcx,%rax,8), %ebx
.Ltmp17:
	#DEBUG_VALUE: P2 <- %EBX
	.loc	1 32 7                  # CoinGame.c:32:7
	testb	%r12b, %r12b
	je	.LBB0_3
.Ltmp18:
# BB#2:                                 # %if.then
                                        #   in Loop: Header=BB0_1 Depth=1
	#DEBUG_VALUE: P2 <- %EBX
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 33 4                  # CoinGame.c:33:4
	movl	$.L.str, %edi
	jmp	.LBB0_4
.Ltmp19:
	.p2align	4, 0x90
.LBB0_3:                                # %if.else
                                        #   in Loop: Header=BB0_1 Depth=1
	#DEBUG_VALUE: P2 <- %EBX
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 35 4                  # CoinGame.c:35:4
	movl	$.L.str.1, %edi
.Ltmp20:
.LBB0_4:                                # %if.end
                                        #   in Loop: Header=BB0_1 Depth=1
	#DEBUG_VALUE: P1 <- %R15D
	#DEBUG_VALUE: P2 <- %EBX
	xorl	%eax, %eax
	callq	printf
.Ltmp21:
	.loc	1 37 10                 # CoinGame.c:37:10
	cmpl	%ebx, %r15d
	jle	.LBB0_5
.Ltmp22:
# BB#6:                                 # %if.else14
                                        #   in Loop: Header=BB0_1 Depth=1
	#DEBUG_VALUE: P2 <- %EBX
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 31 19                 # CoinGame.c:31:19
	leal	-1(%rbp), %r14d
.Ltmp23:
	.loc	1 41 26                 # CoinGame.c:41:26
	leal	1(%rbp), %esi
	.loc	1 41 31 is_stmt 0       # CoinGame.c:41:31
	movl	V(,%rbp,4), %edx
	.loc	1 41 4                  # CoinGame.c:41:4
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movq	16(%rsp), %rbx          # 8-byte Reload
.Ltmp24:
	jmp	.LBB0_7
.Ltmp25:
	.p2align	4, 0x90
.LBB0_5:                                # %if.then9
                                        #   in Loop: Header=BB0_1 Depth=1
	#DEBUG_VALUE: P2 <- %EBX
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 38 31 is_stmt 1       # CoinGame.c:38:31
	movl	V(,%r14,4), %edx
	.loc	1 38 4 is_stmt 0        # CoinGame.c:38:4
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	movl	%r13d, %esi
	callq	printf
	movl	%r13d, %ebx
.Ltmp26:
	movl	12(%rsp), %r14d         # 4-byte Reload
.Ltmp27:
.LBB0_7:                                # %if.end19
                                        #   in Loop: Header=BB0_1 Depth=1
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 44 7 is_stmt 1        # CoinGame.c:44:7
	testb	%r12b, %r12b
	je	.LBB0_9
.Ltmp28:
# BB#8:                                 # %if.then21
                                        #   in Loop: Header=BB0_1 Depth=1
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 45 4                  # CoinGame.c:45:4
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB0_10
.Ltmp29:
	.p2align	4, 0x90
.LBB0_9:                                # %if.else23
                                        #   in Loop: Header=BB0_1 Depth=1
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 47 4                  # CoinGame.c:47:4
	movl	$.Lstr, %edi
	callq	puts
.Ltmp30:
.LBB0_10:                               # %if.end25
                                        #   in Loop: Header=BB0_1 Depth=1
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 49 9                  # CoinGame.c:49:9
	testb	%r12b, %r12b
	sete	%r12b
.Ltmp31:
	.loc	1 29 2 discriminator 1  # CoinGame.c:29:2
	cmpl	%r14d, %ebx
	jle	.LBB0_1
.Ltmp32:
# BB#11:                                # %while.end
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 52 4                  # CoinGame.c:52:4
	movl	M+20(%rip), %esi
	.loc	1 51 2                  # CoinGame.c:51:2
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
.Ltmp33:
	popq	%rbp
	jmp	printf                  # TAILCALL
.Ltmp34:
.Lfunc_end0:
	.size	printMoves, .Lfunc_end0-printMoves
	.cfi_endproc

	.globl	maxMoney
	.p2align	4, 0x90
	.type	maxMoney,@function
maxMoney:                               # @maxMoney
.Lfunc_begin1:
	.loc	1 55 0                  # CoinGame.c:55:0
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
	subq	$24, %rsp
.Ltmp41:
	.cfi_def_cfa_offset 80
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
.Ltmp48:
	#DEBUG_VALUE: maxMoney:i <- 0
	leaq	(%rsp), %rsi
	movl	$maxMoney_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$6, %r8d
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB1_8
# BB#1:
	leaq	16(%rsp), %r14
	leaq	8(%rsp), %r15
	.p2align	4, 0x90
.LBB1_3:                                # %polly.par.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_4 Depth 2
                                        #       Child Loop BB1_7 Depth 3
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	addq	$-2, %rax
	leaq	Y(,%rcx,4), %rbx
	.p2align	4, 0x90
.LBB1_4:                                # %polly.loop_header.i
                                        #   Parent Loop BB1_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_7 Depth 3
	movl	$5, %esi
	subq	%rcx, %rsi
	js	.LBB1_5
# BB#6:                                 # %polly.loop_preheader3.i
                                        #   in Loop: Header=BB1_4 Depth=2
	decq	%rsi
	movq	$-1, %rdi
	movq	%rbx, %rdx
	.p2align	4, 0x90
.LBB1_7:                                # %polly.loop_header2.i
                                        #   Parent Loop BB1_3 Depth=1
                                        #     Parent Loop BB1_4 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rdx)
	incq	%rdi
	addq	$28, %rdx
	cmpq	%rsi, %rdi
	jle	.LBB1_7
.LBB1_5:                                # %polly.loop_exit4.i
                                        #   in Loop: Header=BB1_4 Depth=2
	addq	$4, %rbx
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB1_4
# BB#2:                                 # %polly.par.checkNext.loopexit.i
                                        #   in Loop: Header=BB1_3 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB1_3
.LBB1_8:                                # %maxMoney_polly_subfn.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	leaq	(%rsp), %rsi
	movl	$maxMoney_polly_subfn_8, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$6, %r8d
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB1_16
# BB#9:
	leaq	16(%rsp), %r14
	leaq	8(%rsp), %r15
	.p2align	4, 0x90
.LBB1_11:                               # %polly.par.loadIVBounds.i387
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_12 Depth 2
                                        #       Child Loop BB1_15 Depth 3
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	addq	$-2, %rax
	leaq	X(,%rcx,4), %rbx
	.p2align	4, 0x90
.LBB1_12:                               # %polly.loop_header.i390
                                        #   Parent Loop BB1_11 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_15 Depth 3
	movl	$5, %esi
	subq	%rcx, %rsi
	js	.LBB1_13
# BB#14:                                # %polly.loop_preheader3.i401
                                        #   in Loop: Header=BB1_12 Depth=2
	decq	%rsi
	movq	$-1, %rdi
	movq	%rbx, %rdx
	.p2align	4, 0x90
.LBB1_15:                               # %polly.loop_header2.i398
                                        #   Parent Loop BB1_11 Depth=1
                                        #     Parent Loop BB1_12 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rdx)
	incq	%rdi
	addq	$28, %rdx
	cmpq	%rsi, %rdi
	jle	.LBB1_15
.LBB1_13:                               # %polly.loop_exit4.i393
                                        #   in Loop: Header=BB1_12 Depth=2
	addq	$4, %rbx
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB1_12
# BB#10:                                # %polly.par.checkNext.loopexit.i383
                                        #   in Loop: Header=BB1_11 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB1_11
.LBB1_16:                               # %maxMoney_polly_subfn_8.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	leaq	(%rsp), %rsi
	movl	$maxMoney_polly_subfn_9, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$6, %r8d
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB1_26
# BB#17:
	leaq	16(%rsp), %r14
	leaq	8(%rsp), %r15
	.p2align	4, 0x90
.LBB1_19:                               # %polly.par.loadIVBounds.i408
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_20 Depth 2
                                        #       Child Loop BB1_23 Depth 3
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	addq	$-2, %rax
	leaq	Z(,%rcx,4), %rbx
	.p2align	4, 0x90
.LBB1_20:                               # %polly.loop_header.i411
                                        #   Parent Loop BB1_19 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_23 Depth 3
	movl	$5, %esi
	subq	%rcx, %rsi
	js	.LBB1_21
# BB#22:                                # %polly.loop_preheader3.i422
                                        #   in Loop: Header=BB1_20 Depth=2
	decq	%rsi
	movq	$-1, %rdi
	movq	%rbx, %rdx
	.p2align	4, 0x90
.LBB1_23:                               # %polly.loop_header2.i419
                                        #   Parent Loop BB1_19 Depth=1
                                        #     Parent Loop BB1_20 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rdx)
	incq	%rdi
	addq	$28, %rdx
	cmpq	%rsi, %rdi
	jle	.LBB1_23
.LBB1_21:                               # %polly.loop_exit4.i414
                                        #   in Loop: Header=BB1_20 Depth=2
	addq	$4, %rbx
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB1_20
# BB#18:                                # %polly.par.checkNext.loopexit.i404
                                        #   in Loop: Header=BB1_19 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB1_19
.LBB1_26:                               # %maxMoney_polly_subfn_9.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movl	$1, %r11d
	xorl	%r8d, %r8d
	movl	$2, %r14d
	movl	$4, %r9d
	movl	$3, %r10d
	xorl	%r12d, %r12d
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB1_27:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_36 Depth 2
                                        #     Child Loop BB1_38 Depth 2
                                        #     Child Loop BB1_39 Depth 2
                                        #     Child Loop BB1_32 Depth 2
	testq	%r14, %r14
	movl	$0, %esi
	cmovnsq	%r14, %rsi
	testq	%r11, %r11
	movl	$0, %eax
	cmovnsq	%r11, %rax
	movl	$1, %edi
	subq	%r13, %rdi
	cmovsq	%r8, %rdi
	movl	$5, %r15d
	subq	%r13, %r15
	cmpq	$4, %r15
	movq	%r15, %rdx
	cmovgq	%r9, %rdx
	cmpq	%rdx, %rdi
	jg	.LBB1_28
# BB#35:                                # %polly.loop_preheader321
                                        #   in Loop: Header=BB1_27 Depth=1
	imulq	$28, %rax, %rdi
	decq	%rax
	addq	%r12, %rdi
	decq	%rdx
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB1_36:                               # %polly.loop_header320
                                        #   Parent Loop BB1_27 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	M+20(%rdi,%rbx), %ebp
	movl	%ebp, Y(%rdi,%rbx)
	incq	%rax
	addq	$28, %rbx
	cmpq	%rdx, %rax
	jle	.LBB1_36
.LBB1_28:                               # %polly.loop_exit322
                                        #   in Loop: Header=BB1_27 Depth=1
	cmpq	$3, %r15
	movq	%r15, %rax
	cmovgq	%r10, %rax
	testq	%rax, %rax
	js	.LBB1_29
# BB#37:                                # %polly.loop_preheader331
                                        #   in Loop: Header=BB1_27 Depth=1
	decq	%rax
	movq	$-1, %rdx
	movq	%r12, %rdi
	.p2align	4, 0x90
.LBB1_38:                               # %polly.loop_header330
                                        #   Parent Loop BB1_27 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	M+48(%rdi), %ebx
	movl	%ebx, X(%rdi)
	incq	%rdx
	addq	$28, %rdi
	cmpq	%rax, %rdx
	jle	.LBB1_38
.LBB1_29:                               # %polly.cond
                                        #   in Loop: Header=BB1_27 Depth=1
	testq	%r13, %r13
	movl	$0, %eax
	movl	$V, %edx
	movl	$7, %edi
	jle	.LBB1_30
	.p2align	4, 0x90
.LBB1_39:                               # %polly.loop_header343
                                        #   Parent Loop BB1_27 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	X-4(%rax,%r13,4), %ebx
	movl	Y-4(%rax,%r13,4), %ebp
.Ltmp49:
	.loc	1 76 14 prologue_end    # CoinGame.c:76:14
	cmpl	%ebp, %ebx
	.loc	1 76 14 is_stmt 0 discriminator 1 # CoinGame.c:76:14
	cmovgl	%ebp, %ebx
	.loc	1 76 14 discriminator 3 # CoinGame.c:76:14
	addl	(%rdx), %ebx
	movl	Z-4(%rax,%r13,4), %ecx
	cmpl	%ecx, %ebp
	cmovlel	%ebp, %ecx
	.loc	1 76 14 discriminator 6 # CoinGame.c:76:14
	addl	-4(%rdx,%r13,4), %ecx
	cmpl	%ecx, %ebx
	cmovgel	%ebx, %ecx
	movl	%ecx, M-4(%rax,%r13,4)
	decq	%rdi
	addq	$4, %rdx
	addq	$28, %rax
	cmpq	%r13, %rdi
	jne	.LBB1_39
.Ltmp50:
.LBB1_30:                               # %polly.merge
                                        #   in Loop: Header=BB1_27 Depth=1
	movl	$2, %eax
	subq	%r13, %rax
	movl	$0, %edx
	cmovnsq	%rax, %rdx
	cmpq	%r15, %rdx
	jg	.LBB1_33
# BB#31:                                #   in Loop: Header=BB1_27 Depth=1
	imulq	$28, %rsi, %rax
	decq	%rsi
	.p2align	4, 0x90
.LBB1_32:                               # %polly.loop_header368
                                        #   Parent Loop BB1_27 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	M-8(%rax,%r12), %ecx
	movl	%ecx, Z(%rax,%r12)
	incq	%rsi
	addq	$28, %rax
	cmpq	%r15, %rsi
	jl	.LBB1_32
.LBB1_33:                               # %polly.loop_exit370
                                        #   in Loop: Header=BB1_27 Depth=1
	incq	%r13
	decq	%r11
	addq	$4, %r12
	decq	%r14
	cmpq	$7, %r13
	jne	.LBB1_27
# BB#34:
	movq	$-144, %rbx
	.p2align	4, 0x90
.LBB1_24:                               # %for.cond186.preheader
                                        # =>This Inner Loop Header: Depth=1
.Ltmp51:
	.loc	1 89 19 is_stmt 1       # CoinGame.c:89:19
	movl	M+144(%rbx), %esi
	.loc	1 89 4 is_stmt 0        # CoinGame.c:89:4
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 89 19                 # CoinGame.c:89:19
	movl	M+148(%rbx), %esi
	.loc	1 89 4                  # CoinGame.c:89:4
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 89 19                 # CoinGame.c:89:19
	movl	M+152(%rbx), %esi
	.loc	1 89 4                  # CoinGame.c:89:4
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 89 19                 # CoinGame.c:89:19
	movl	M+156(%rbx), %esi
	.loc	1 89 4                  # CoinGame.c:89:4
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 89 19                 # CoinGame.c:89:19
	movl	M+160(%rbx), %esi
	.loc	1 89 4                  # CoinGame.c:89:4
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 89 19                 # CoinGame.c:89:19
	movl	M+164(%rbx), %esi
	.loc	1 89 4                  # CoinGame.c:89:4
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp52:
	.loc	1 91 3 is_stmt 1        # CoinGame.c:91:3
	movl	$10, %edi
	callq	putchar
.Ltmp53:
	.loc	1 87 2 discriminator 1  # CoinGame.c:87:2
	addq	$24, %rbx
	jne	.LBB1_24
.Ltmp54:
# BB#25:                                # %for.end199
	.loc	1 94 9                  # CoinGame.c:94:9
	movl	M+20(%rip), %eax
	.loc	1 94 2 is_stmt 0        # CoinGame.c:94:2
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp55:
.Lfunc_end1:
	.size	maxMoney, .Lfunc_end1-maxMoney
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin2:
	.loc	1 96 0 is_stmt 1        # CoinGame.c:96:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 97 2 prologue_end     # CoinGame.c:97:2
	pushq	%rax
.Ltmp56:
	.cfi_def_cfa_offset 16
	callq	maxMoney
	.loc	1 98 2                  # CoinGame.c:98:2
	callq	printMoves
	.loc	1 99 1                  # CoinGame.c:99:1
	xorl	%eax, %eax
	popq	%rcx
	retq
.Ltmp57:
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc

	.p2align	4, 0x90
	.type	maxMoney_polly_subfn,@function
maxMoney_polly_subfn:                   # @maxMoney_polly_subfn
.Lfunc_begin3:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp58:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp59:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp60:
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
.Ltmp61:
	.cfi_def_cfa_offset 48
.Ltmp62:
	.cfi_offset %rbx, -32
.Ltmp63:
	.cfi_offset %r14, -24
.Ltmp64:
	.cfi_offset %r15, -16
	leaq	8(%rsp), %rdi
	leaq	(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB3_2
# BB#1:
	leaq	8(%rsp), %r14
	leaq	(%rsp), %r15
	.p2align	4, 0x90
.LBB3_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_5 Depth 2
                                        #       Child Loop BB3_8 Depth 3
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	addq	$-2, %rax
	leaq	Y(,%rcx,4), %rbx
	.p2align	4, 0x90
.LBB3_5:                                # %polly.loop_header
                                        #   Parent Loop BB3_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_8 Depth 3
	movl	$5, %esi
	subq	%rcx, %rsi
	js	.LBB3_6
# BB#7:                                 # %polly.loop_preheader3
                                        #   in Loop: Header=BB3_5 Depth=2
	decq	%rsi
	movq	$-1, %rdi
	movq	%rbx, %rdx
	.p2align	4, 0x90
.LBB3_8:                                # %polly.loop_header2
                                        #   Parent Loop BB3_4 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rdx)
	incq	%rdi
	addq	$28, %rdx
	cmpq	%rsi, %rdi
	jle	.LBB3_8
.LBB3_6:                                # %polly.loop_exit4
                                        #   in Loop: Header=BB3_5 Depth=2
	addq	$4, %rbx
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB3_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB3_4 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB3_4
.LBB3_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Lfunc_end3:
	.size	maxMoney_polly_subfn, .Lfunc_end3-maxMoney_polly_subfn
	.cfi_endproc

	.p2align	4, 0x90
	.type	maxMoney_polly_subfn_8,@function
maxMoney_polly_subfn_8:                 # @maxMoney_polly_subfn_8
.Lfunc_begin4:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp65:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp66:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp67:
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
.Ltmp68:
	.cfi_def_cfa_offset 48
.Ltmp69:
	.cfi_offset %rbx, -32
.Ltmp70:
	.cfi_offset %r14, -24
.Ltmp71:
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
	.size	maxMoney_polly_subfn_8, .Lfunc_end4-maxMoney_polly_subfn_8
	.cfi_endproc

	.p2align	4, 0x90
	.type	maxMoney_polly_subfn_9,@function
maxMoney_polly_subfn_9:                 # @maxMoney_polly_subfn_9
.Lfunc_begin5:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp72:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp73:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp74:
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
.Ltmp75:
	.cfi_def_cfa_offset 48
.Ltmp76:
	.cfi_offset %rbx, -32
.Ltmp77:
	.cfi_offset %r14, -24
.Ltmp78:
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
	leaq	Z(,%rcx,4), %rbx
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
	.size	maxMoney_polly_subfn_9, .Lfunc_end5-maxMoney_polly_subfn_9
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

	.type	M,@object               # @M
	.comm	M,144,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Alice take coin no. "
	.size	.L.str, 21

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"Bob take coin no. "
	.size	.L.str.1, 19

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"(%d, $%d)"
	.size	.L.str.2, 10

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	", "
	.size	.L.str.3, 3

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"\nThe total amount of money (maximum) Alice get is %d.\n"
	.size	.L.str.5, 55

	.type	X,@object               # @X
	.comm	X,144,16
	.type	Y,@object               # @Y
	.comm	Y,144,16
	.type	Z,@object               # @Z
	.comm	Z,144,16
	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	" %d "
	.size	.L.str.6, 5

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
	.asciz	"M"                     # string offset=256
.Linfo_string7:
	.asciz	"X"                     # string offset=258
.Linfo_string8:
	.asciz	"Y"                     # string offset=260
.Linfo_string9:
	.asciz	"Z"                     # string offset=262
.Linfo_string10:
	.asciz	"printMoves"            # string offset=264
.Linfo_string11:
	.asciz	"maxMoney"              # string offset=275
.Linfo_string12:
	.asciz	"main"                  # string offset=284
.Linfo_string13:
	.asciz	"m"                     # string offset=289
.Linfo_string14:
	.asciz	"n"                     # string offset=291
.Linfo_string15:
	.asciz	"alice"                 # string offset=293
.Linfo_string16:
	.asciz	"_Bool"                 # string offset=299
.Linfo_string17:
	.asciz	"P1"                    # string offset=305
.Linfo_string18:
	.asciz	"P2"                    # string offset=308
.Linfo_string19:
	.asciz	"i"                     # string offset=311
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Ltmp16-.Lfunc_begin0
	.quad	.Ltmp33-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	95                      # super-register DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Ltmp17-.Lfunc_begin0
	.quad	.Ltmp24-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp25-.Lfunc_begin0
	.quad	.Ltmp26-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
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
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
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
	.long	382                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x177 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x15 DW_TAG_variable
	.long	.Linfo_string3          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	20                      # DW_AT_decl_line
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
	.long	110                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	21                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	M
	.byte	3                       # Abbrev [3] 0x6e:0x12 DW_TAG_array_type
	.long	75                      # DW_AT_type
	.byte	4                       # Abbrev [4] 0x73:0x6 DW_TAG_subrange_type
	.long	82                      # DW_AT_type
	.byte	6                       # DW_AT_count
	.byte	4                       # Abbrev [4] 0x79:0x6 DW_TAG_subrange_type
	.long	82                      # DW_AT_type
	.byte	6                       # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	2                       # Abbrev [2] 0x80:0x15 DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.long	110                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	22                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	X
	.byte	2                       # Abbrev [2] 0x95:0x15 DW_TAG_variable
	.long	.Linfo_string8          # DW_AT_name
	.long	110                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	23                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	Y
	.byte	2                       # Abbrev [2] 0xaa:0x15 DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.long	110                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	24                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	Z
	.byte	7                       # Abbrev [7] 0xbf:0x66 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0xd4:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	8                       # Abbrev [8] 0xe0:0xc DW_TAG_variable
	.byte	5                       # DW_AT_const_value
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0xec:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	28                      # DW_AT_decl_line
	.long	378                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0xf8:0x2c DW_TAG_lexical_block
	.quad	.Ltmp15                 # DW_AT_low_pc
	.long	.Ltmp31-.Ltmp15         # DW_AT_high_pc
	.byte	11                      # Abbrev [11] 0x105:0xf DW_TAG_variable
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	30                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	11                      # Abbrev [11] 0x114:0xf DW_TAG_variable
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x125:0x3c DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	55                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0x13e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	57                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	13                      # Abbrev [13] 0x14a:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	57                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	13                      # Abbrev [13] 0x155:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	57                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	14                      # Abbrev [14] 0x161:0x19 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	96                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	5                       # Abbrev [5] 0x17a:0x7 DW_TAG_base_type
	.long	.Linfo_string16         # DW_AT_name
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
	.long	386                     # Compilation Unit Length
	.long	353                     # DIE offset
	.asciz	"main"                  # External Name
	.long	42                      # DIE offset
	.asciz	"V"                     # External Name
	.long	191                     # DIE offset
	.asciz	"printMoves"            # External Name
	.long	128                     # DIE offset
	.asciz	"X"                     # External Name
	.long	149                     # DIE offset
	.asciz	"Y"                     # External Name
	.long	170                     # DIE offset
	.asciz	"Z"                     # External Name
	.long	89                      # DIE offset
	.asciz	"M"                     # External Name
	.long	293                     # DIE offset
	.asciz	"maxMoney"              # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	386                     # Compilation Unit Length
	.long	75                      # DIE offset
	.asciz	"int"                   # External Name
	.long	378                     # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
