	.text
	.file	"llvm/CoinGame.openmp.enablevc.ll"
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
	subq	$24, %rsp
.Ltmp55:
	.cfi_def_cfa_offset 80
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
	xorl	%r12d, %r12d
	movl	$1, %ebx
	leaq	(%rsp), %r14
	movl	$findMoves_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$6, %r8d
	movl	$1, %r9d
	movq	%r14, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%r14, %rdi
	callq	findMoves_polly_subfn
	callq	GOMP_parallel_end
	movl	$findMoves_polly_subfn_10, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$6, %r8d
	movl	$1, %r9d
	movq	%r14, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%r14, %rdi
	callq	findMoves_polly_subfn_10
	callq	GOMP_parallel_end
	movl	$findMoves_polly_subfn_11, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$6, %r8d
	movl	$1, %r9d
	movq	%r14, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%r14, %rdi
	callq	findMoves_polly_subfn_11
	callq	GOMP_parallel_end
	movl	$2, %eax
	movl	V(%rip), %ecx
	movl	%ecx, 4(%rsp)           # 4-byte Spill
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB2_1:                                # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_13 Depth 2
                                        #     Child Loop BB2_15 Depth 2
                                        #     Child Loop BB2_17 Depth 2
                                        #     Child Loop BB2_6 Depth 2
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movq	%rbx, 16(%rsp)          # 8-byte Spill
	testq	%rax, %rax
	movl	$0, %r11d
	cmovnsq	%rax, %r11
	testq	%rbx, %rbx
	movl	$0, %edx
	cmovnsq	%rbx, %rdx
	testq	%r13, %r13
	jle	.LBB2_2
# BB#9:                                 # %polly.then
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	$7, %eax
	subl	%r13d, %eax
	testb	$1, %al
	movl	$0, %edi
	je	.LBB2_11
# BB#10:                                # %polly.loop_header239.prol
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	X-4(,%r13,4), %eax
.Ltmp63:
	.loc	1 139 13 prologue_end   # CoinGame.c:139:13
	addl	4(%rsp), %eax           # 4-byte Folded Reload
	movl	Z-4(,%r13,4), %esi
	.loc	1 139 30 is_stmt 0      # CoinGame.c:139:30
	addl	V-4(,%r13,4), %esi
	.loc	1 139 23                # CoinGame.c:139:23
	cmpl	%esi, %eax
.Ltmp64:
	.loc	1 139 8                 # CoinGame.c:139:8
	cmovgel	%eax, %esi
	movl	%esi, M-4(,%r13,4)
	movl	$1, %edi
.LBB2_11:                               # %polly.then.split
                                        #   in Loop: Header=BB2_1 Depth=1
	cmpq	$6, %r13
	je	.LBB2_2
# BB#12:                                # %polly.then.split.split
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	$7, %esi
	subq	%rdi, %rsi
	leaq	V(,%rdi,4), %r15
	imulq	$28, %rdi, %r14
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB2_13:                               # %polly.loop_header239
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	(%r15,%rdi), %rbp
	leaq	(%r14,%rbx), %r8
	movl	X-4(%r8,%r13,4), %r9d
.Ltmp65:
	.loc	1 139 13                # CoinGame.c:139:13
	addl	(%r15,%rdi), %r9d
	movl	Z-4(%r8,%r13,4), %r10d
	.loc	1 139 30                # CoinGame.c:139:30
	addl	-4(%rbp,%r13,4), %r10d
	.loc	1 139 23                # CoinGame.c:139:23
	cmpl	%r10d, %r9d
.Ltmp66:
	.loc	1 139 8                 # CoinGame.c:139:8
	cmovgel	%r9d, %r10d
	movl	%r10d, M-4(%r8,%r13,4)
	movl	X+24(%r8,%r13,4), %eax
.Ltmp67:
	.loc	1 139 13                # CoinGame.c:139:13
	addl	4(%r15,%rdi), %eax
	movl	Z+24(%r8,%r13,4), %ecx
	.loc	1 139 30                # CoinGame.c:139:30
	addl	(%rbp,%r13,4), %ecx
	.loc	1 139 23                # CoinGame.c:139:23
	cmpl	%ecx, %eax
.Ltmp68:
	.loc	1 139 8                 # CoinGame.c:139:8
	cmovgel	%eax, %ecx
	movl	%ecx, M+24(%r8,%r13,4)
	addq	$-2, %rsi
	addq	$8, %rdi
	addq	$56, %rbx
	cmpq	%r13, %rsi
	jne	.LBB2_13
.Ltmp69:
.LBB2_2:                                # %polly.merge
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	$1, %eax
	subq	%r13, %rax
	movl	$0, %edi
	cmovnsq	%rax, %rdi
	movl	$5, %esi
	subq	%r13, %rsi
	cmpq	$4, %rsi
	movq	%rsi, %rax
	movl	$4, %ecx
	cmovgq	%rcx, %rax
	cmpq	%rax, %rdi
	jg	.LBB2_3
# BB#14:                                # %polly.loop_preheader253
                                        #   in Loop: Header=BB2_1 Depth=1
	imulq	$28, %rdx, %rdi
	decq	%rdx
	addq	%r12, %rdi
	decq	%rax
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB2_15:                               # %polly.loop_header252
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	M+20(%rdi,%rbx), %ecx
	movl	%ecx, Y(%rdi,%rbx)
	incq	%rdx
	addq	$28, %rbx
	cmpq	%rax, %rdx
	jle	.LBB2_15
.LBB2_3:                                # %polly.loop_exit254
                                        #   in Loop: Header=BB2_1 Depth=1
	cmpq	$3, %rsi
	movq	%rsi, %rax
	movl	$3, %ecx
	cmovgq	%rcx, %rax
	testq	%rax, %rax
	js	.LBB2_4
# BB#16:                                # %polly.loop_preheader266
                                        #   in Loop: Header=BB2_1 Depth=1
	decq	%rax
	movq	$-1, %rdx
	movq	%r12, %rdi
	.p2align	4, 0x90
.LBB2_17:                               # %polly.loop_header265
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	M+48(%rdi), %ecx
	movl	Y(%rdi), %ebp
.Ltmp70:
	.loc	1 119 17 is_stmt 1      # CoinGame.c:119:17
	cmpl	%ebp, %ecx
.Ltmp71:
	.loc	1 119 9 is_stmt 0       # CoinGame.c:119:9
	cmovgl	%ebp, %ecx
	movl	%ecx, X(%rdi)
	incq	%rdx
	addq	$28, %rdi
	cmpq	%rax, %rdx
	jle	.LBB2_17
.Ltmp72:
.LBB2_4:                                # %polly.loop_exit267
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	$2, %eax
	subq	%r13, %rax
	movl	$0, %edx
	cmovnsq	%rax, %rdx
	cmpq	%rsi, %rdx
	movq	16(%rsp), %rbx          # 8-byte Reload
	jg	.LBB2_7
# BB#5:                                 #   in Loop: Header=BB2_1 Depth=1
	imulq	$28, %r11, %rax
	decq	%r11
	.p2align	4, 0x90
.LBB2_6:                                # %polly.loop_header282
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	M-8(%rax,%r12), %ecx
	movl	Y(%rax,%r12), %edx
.Ltmp73:
	.loc	1 127 17 is_stmt 1      # CoinGame.c:127:17
	cmpl	%edx, %ecx
.Ltmp74:
	.loc	1 127 9 is_stmt 0       # CoinGame.c:127:9
	cmovgl	%edx, %ecx
	movl	%ecx, Z(%rax,%r12)
	incq	%r11
	addq	$28, %rax
	cmpq	%rsi, %r11
	jl	.LBB2_6
.Ltmp75:
.LBB2_7:                                # %polly.loop_exit284
                                        #   in Loop: Header=BB2_1 Depth=1
	incq	%r13
	decq	%rbx
	addq	$4, %r12
	movq	8(%rsp), %rax           # 8-byte Reload
	decq	%rax
	cmpq	$7, %r13
	jne	.LBB2_1
# BB#8:                                 # %polly.exiting
	.loc	1 152 9 is_stmt 1       # CoinGame.c:152:9
	movl	M+20(%rip), %eax
	.loc	1 152 2 is_stmt 0       # CoinGame.c:152:2
	addq	$24, %rsp
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
	pushq	%r13
.Ltmp86:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp87:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp88:
	.cfi_def_cfa_offset 48
	subq	$32, %rsp
.Ltmp89:
	.cfi_def_cfa_offset 80
.Ltmp90:
	.cfi_offset %rbx, -48
.Ltmp91:
	.cfi_offset %r12, -40
.Ltmp92:
	.cfi_offset %r13, -32
.Ltmp93:
	.cfi_offset %r14, -24
.Ltmp94:
	.cfi_offset %r15, -16
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB4_2
# BB#1:
	leaq	16(%rsp), %r14
	leaq	8(%rsp), %r15
	leaq	24(%rsp), %r12
	.p2align	4, 0x90
.LBB4_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_5 Depth 2
	movq	8(%rsp), %r13
	movq	16(%rsp), %rbx
	addq	$-2, %r13
	.p2align	4, 0x90
.LBB4_5:                                # %polly.loop_header
                                        #   Parent Loop BB4_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpq	$3, %rbx
	jge	.LBB4_7
# BB#6:                                 # %polly.loop_preheader3
                                        #   in Loop: Header=BB4_5 Depth=2
	movl	$0, X(,%rbx,4)
	movl	$0, X+28(,%rbx,4)
	movl	$0, X+56(,%rbx,4)
	movl	$0, X+84(,%rbx,4)
	cmpq	$2, %rbx
	je	.LBB4_8
.LBB4_7:                                # %polly.parallel.for
                                        #   in Loop: Header=BB4_5 Depth=2
	movq	%rbx, 24(%rsp)
	movl	$findMoves_polly_subfn_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$2, %r8d
	movl	$1, %r9d
	movq	%r12, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%r12, %rdi
	callq	findMoves_polly_subfn_polly_subfn
	callq	GOMP_parallel_end
.LBB4_8:                                # %polly.merge10
                                        #   in Loop: Header=BB4_5 Depth=2
	cmpq	%r13, %rbx
	leaq	1(%rbx), %rbx
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
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
.Lfunc_end4:
	.size	findMoves_polly_subfn, .Lfunc_end4-findMoves_polly_subfn
	.cfi_endproc

	.p2align	4, 0x90
	.type	findMoves_polly_subfn_polly_subfn,@function
findMoves_polly_subfn_polly_subfn:      # @findMoves_polly_subfn_polly_subfn
.Lfunc_begin5:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
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
	subq	$40, %rsp
.Ltmp101:
	.cfi_def_cfa_offset 96
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
	movq	(%rdi), %rbx
	leaq	24(%rsp), %rdi
	leaq	16(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB5_2
# BB#1:                                 # %polly.par.loadIVBounds.preheader
	movl	$1, %r13d
	movq	%rbx, %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	subq	%rax, %r13
	movq	%r13, %rbx
	shrq	$63, %rbx
	movq	%rax, %rbp
	negq	%rbp
	movl	$5, %ecx
	subq	%rax, %rcx
	movq	%rcx, 8(%rsp)           # 8-byte Spill
	movl	$4, %r15d
	subq	%rax, %r15
	leaq	X+112(,%rax,4), %r14
	leaq	X(,%rax,4), %r12
	.p2align	4, 0x90
.LBB5_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_23 Depth 2
                                        #     Child Loop BB5_24 Depth 2
                                        #       Child Loop BB5_26 Depth 3
                                        #     Child Loop BB5_17 Depth 2
                                        #       Child Loop BB5_19 Depth 3
                                        #     Child Loop BB5_12 Depth 2
                                        #       Child Loop BB5_14 Depth 3
                                        #     Child Loop BB5_6 Depth 2
                                        #       Child Loop BB5_10 Depth 3
                                        #       Child Loop BB5_9 Depth 3
	movq	16(%rsp), %rax
	movq	24(%rsp), %rcx
	addq	$-2, %rax
	cmpq	$3, 32(%rsp)            # 8-byte Folded Reload
	jl	.LBB5_16
# BB#5:                                 # %polly.par.loadIVBounds.split.us
                                        #   in Loop: Header=BB5_4 Depth=1
	cmpq	$0, 8(%rsp)             # 8-byte Folded Reload
	js	.LBB5_12
	.p2align	4, 0x90
.LBB5_6:                                # %polly.loop_header.us.us
                                        #   Parent Loop BB5_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_10 Depth 3
                                        #       Child Loop BB5_9 Depth 3
	movq	$-1, %rdx
	cmpq	$1, %rcx
	movq	%r12, %rsi
	jne	.LBB5_10
# BB#7:                                 # %polly.then.us.us
                                        #   in Loop: Header=BB5_6 Depth=2
	testq	%r13, %r13
	js	.LBB5_11
# BB#8:                                 #   in Loop: Header=BB5_6 Depth=2
	movq	$-1, %rdx
	movq	%r14, %rsi
	.p2align	4, 0x90
.LBB5_9:                                # %polly.loop_header2.us.us
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rsi)
	incq	%rdx
	addq	$28, %rsi
	cmpq	%rbp, %rdx
	jle	.LBB5_9
	jmp	.LBB5_11
	.p2align	4, 0x90
.LBB5_10:                               # %polly.loop_header15.us.us
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rsi)
	incq	%rdx
	addq	$28, %rsi
	cmpq	%r15, %rdx
	jle	.LBB5_10
.LBB5_11:                               # %polly.merge.us.us
                                        #   in Loop: Header=BB5_6 Depth=2
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB5_6
	jmp	.LBB5_3
	.p2align	4, 0x90
.LBB5_12:                               # %polly.loop_header.us
                                        #   Parent Loop BB5_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_14 Depth 3
	cmpq	$1, %rcx
	setne	%dl
	orb	%bl, %dl
	jne	.LBB5_15
# BB#13:                                #   in Loop: Header=BB5_12 Depth=2
	movq	$-1, %rdx
	movq	%r14, %rsi
	.p2align	4, 0x90
.LBB5_14:                               # %polly.loop_header2.us
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_12 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rsi)
	incq	%rdx
	addq	$28, %rsi
	cmpq	%rbp, %rdx
	jle	.LBB5_14
.LBB5_15:                               # %polly.merge.us
                                        #   in Loop: Header=BB5_12 Depth=2
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB5_12
	jmp	.LBB5_3
	.p2align	4, 0x90
.LBB5_16:                               # %polly.par.loadIVBounds.split
                                        #   in Loop: Header=BB5_4 Depth=1
	cmpq	$0, 8(%rsp)             # 8-byte Folded Reload
	js	.LBB5_21
	.p2align	4, 0x90
.LBB5_17:                               # %polly.loop_header.us29
                                        #   Parent Loop BB5_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_19 Depth 3
	cmpq	$1, %rcx
	setne	%dl
	orb	%bl, %dl
	jne	.LBB5_20
# BB#18:                                #   in Loop: Header=BB5_17 Depth=2
	movq	$-1, %rdx
	movq	%r14, %rsi
	.p2align	4, 0x90
.LBB5_19:                               # %polly.loop_header2.us39
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_17 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rsi)
	incq	%rdx
	addq	$28, %rsi
	cmpq	%rbp, %rdx
	jle	.LBB5_19
.LBB5_20:                               # %polly.merge.us44
                                        #   in Loop: Header=BB5_17 Depth=2
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB5_17
	jmp	.LBB5_3
.LBB5_21:                               # %polly.par.loadIVBounds.split.split
                                        #   in Loop: Header=BB5_4 Depth=1
	testq	%r13, %r13
	js	.LBB5_22
	.p2align	4, 0x90
.LBB5_24:                               # %polly.loop_header.us51
                                        #   Parent Loop BB5_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_26 Depth 3
	cmpq	$1, %rcx
	jne	.LBB5_27
# BB#25:                                #   in Loop: Header=BB5_24 Depth=2
	movq	$-1, %rdx
	movq	%r14, %rsi
	.p2align	4, 0x90
.LBB5_26:                               # %polly.loop_header2.us61
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_24 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rsi)
	incq	%rdx
	addq	$28, %rsi
	cmpq	%rbp, %rdx
	jle	.LBB5_26
.LBB5_27:                               # %polly.merge.us66
                                        #   in Loop: Header=BB5_24 Depth=2
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB5_24
	jmp	.LBB5_3
.LBB5_22:                               # %polly.loop_header.preheader
                                        #   in Loop: Header=BB5_4 Depth=1
	decq	%rcx
	.p2align	4, 0x90
.LBB5_23:                               # %polly.loop_header
                                        #   Parent Loop BB5_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB5_23
	.p2align	4, 0x90
.LBB5_3:                                # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB5_4 Depth=1
	leaq	24(%rsp), %rdi
	leaq	16(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB5_4
.LBB5_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end5:
	.size	findMoves_polly_subfn_polly_subfn, .Lfunc_end5-findMoves_polly_subfn_polly_subfn
	.cfi_endproc

	.p2align	4, 0x90
	.type	findMoves_polly_subfn_10,@function
findMoves_polly_subfn_10:               # @findMoves_polly_subfn_10
.Lfunc_begin6:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp108:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp109:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp110:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp111:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp112:
	.cfi_def_cfa_offset 48
	subq	$32, %rsp
.Ltmp113:
	.cfi_def_cfa_offset 80
.Ltmp114:
	.cfi_offset %rbx, -48
.Ltmp115:
	.cfi_offset %r12, -40
.Ltmp116:
	.cfi_offset %r13, -32
.Ltmp117:
	.cfi_offset %r14, -24
.Ltmp118:
	.cfi_offset %r15, -16
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB6_2
# BB#1:
	leaq	16(%rsp), %r14
	leaq	8(%rsp), %r15
	leaq	24(%rsp), %r12
	.p2align	4, 0x90
.LBB6_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_5 Depth 2
	movq	8(%rsp), %r13
	movq	16(%rsp), %rbx
	addq	$-2, %r13
	.p2align	4, 0x90
.LBB6_5:                                # %polly.loop_header
                                        #   Parent Loop BB6_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpq	$3, %rbx
	jge	.LBB6_7
# BB#6:                                 # %polly.loop_preheader3
                                        #   in Loop: Header=BB6_5 Depth=2
	movl	$0, Y(,%rbx,4)
	movl	$0, Y+28(,%rbx,4)
	movl	$0, Y+56(,%rbx,4)
	movl	$0, Y+84(,%rbx,4)
	cmpq	$2, %rbx
	je	.LBB6_8
.LBB6_7:                                # %polly.parallel.for
                                        #   in Loop: Header=BB6_5 Depth=2
	movq	%rbx, 24(%rsp)
	movl	$findMoves_polly_subfn_10_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$2, %r8d
	movl	$1, %r9d
	movq	%r12, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%r12, %rdi
	callq	findMoves_polly_subfn_10_polly_subfn
	callq	GOMP_parallel_end
.LBB6_8:                                # %polly.merge10
                                        #   in Loop: Header=BB6_5 Depth=2
	cmpq	%r13, %rbx
	leaq	1(%rbx), %rbx
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
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
.Lfunc_end6:
	.size	findMoves_polly_subfn_10, .Lfunc_end6-findMoves_polly_subfn_10
	.cfi_endproc

	.p2align	4, 0x90
	.type	findMoves_polly_subfn_10_polly_subfn,@function
findMoves_polly_subfn_10_polly_subfn:   # @findMoves_polly_subfn_10_polly_subfn
.Lfunc_begin7:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Ltmp119:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp120:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp121:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp122:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp123:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp124:
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
.Ltmp125:
	.cfi_def_cfa_offset 96
.Ltmp126:
	.cfi_offset %rbx, -56
.Ltmp127:
	.cfi_offset %r12, -48
.Ltmp128:
	.cfi_offset %r13, -40
.Ltmp129:
	.cfi_offset %r14, -32
.Ltmp130:
	.cfi_offset %r15, -24
.Ltmp131:
	.cfi_offset %rbp, -16
	movq	(%rdi), %rbx
	leaq	24(%rsp), %rdi
	leaq	16(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB7_2
# BB#1:                                 # %polly.par.loadIVBounds.preheader
	movl	$1, %r13d
	movq	%rbx, %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	subq	%rax, %r13
	movq	%r13, %rbx
	shrq	$63, %rbx
	movq	%rax, %rbp
	negq	%rbp
	movl	$5, %ecx
	subq	%rax, %rcx
	movq	%rcx, 8(%rsp)           # 8-byte Spill
	movl	$4, %r15d
	subq	%rax, %r15
	leaq	Y+112(,%rax,4), %r14
	leaq	Y(,%rax,4), %r12
	.p2align	4, 0x90
.LBB7_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_23 Depth 2
                                        #     Child Loop BB7_24 Depth 2
                                        #       Child Loop BB7_26 Depth 3
                                        #     Child Loop BB7_17 Depth 2
                                        #       Child Loop BB7_19 Depth 3
                                        #     Child Loop BB7_12 Depth 2
                                        #       Child Loop BB7_14 Depth 3
                                        #     Child Loop BB7_6 Depth 2
                                        #       Child Loop BB7_10 Depth 3
                                        #       Child Loop BB7_9 Depth 3
	movq	16(%rsp), %rax
	movq	24(%rsp), %rcx
	addq	$-2, %rax
	cmpq	$3, 32(%rsp)            # 8-byte Folded Reload
	jl	.LBB7_16
# BB#5:                                 # %polly.par.loadIVBounds.split.us
                                        #   in Loop: Header=BB7_4 Depth=1
	cmpq	$0, 8(%rsp)             # 8-byte Folded Reload
	js	.LBB7_12
	.p2align	4, 0x90
.LBB7_6:                                # %polly.loop_header.us.us
                                        #   Parent Loop BB7_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_10 Depth 3
                                        #       Child Loop BB7_9 Depth 3
	movq	$-1, %rdx
	cmpq	$1, %rcx
	movq	%r12, %rsi
	jne	.LBB7_10
# BB#7:                                 # %polly.then.us.us
                                        #   in Loop: Header=BB7_6 Depth=2
	testq	%r13, %r13
	js	.LBB7_11
# BB#8:                                 #   in Loop: Header=BB7_6 Depth=2
	movq	$-1, %rdx
	movq	%r14, %rsi
	.p2align	4, 0x90
.LBB7_9:                                # %polly.loop_header2.us.us
                                        #   Parent Loop BB7_4 Depth=1
                                        #     Parent Loop BB7_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rsi)
	incq	%rdx
	addq	$28, %rsi
	cmpq	%rbp, %rdx
	jle	.LBB7_9
	jmp	.LBB7_11
	.p2align	4, 0x90
.LBB7_10:                               # %polly.loop_header15.us.us
                                        #   Parent Loop BB7_4 Depth=1
                                        #     Parent Loop BB7_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rsi)
	incq	%rdx
	addq	$28, %rsi
	cmpq	%r15, %rdx
	jle	.LBB7_10
.LBB7_11:                               # %polly.merge.us.us
                                        #   in Loop: Header=BB7_6 Depth=2
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB7_6
	jmp	.LBB7_3
	.p2align	4, 0x90
.LBB7_12:                               # %polly.loop_header.us
                                        #   Parent Loop BB7_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_14 Depth 3
	cmpq	$1, %rcx
	setne	%dl
	orb	%bl, %dl
	jne	.LBB7_15
# BB#13:                                #   in Loop: Header=BB7_12 Depth=2
	movq	$-1, %rdx
	movq	%r14, %rsi
	.p2align	4, 0x90
.LBB7_14:                               # %polly.loop_header2.us
                                        #   Parent Loop BB7_4 Depth=1
                                        #     Parent Loop BB7_12 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rsi)
	incq	%rdx
	addq	$28, %rsi
	cmpq	%rbp, %rdx
	jle	.LBB7_14
.LBB7_15:                               # %polly.merge.us
                                        #   in Loop: Header=BB7_12 Depth=2
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB7_12
	jmp	.LBB7_3
	.p2align	4, 0x90
.LBB7_16:                               # %polly.par.loadIVBounds.split
                                        #   in Loop: Header=BB7_4 Depth=1
	cmpq	$0, 8(%rsp)             # 8-byte Folded Reload
	js	.LBB7_21
	.p2align	4, 0x90
.LBB7_17:                               # %polly.loop_header.us31
                                        #   Parent Loop BB7_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_19 Depth 3
	cmpq	$1, %rcx
	setne	%dl
	orb	%bl, %dl
	jne	.LBB7_20
# BB#18:                                #   in Loop: Header=BB7_17 Depth=2
	movq	$-1, %rdx
	movq	%r14, %rsi
	.p2align	4, 0x90
.LBB7_19:                               # %polly.loop_header2.us41
                                        #   Parent Loop BB7_4 Depth=1
                                        #     Parent Loop BB7_17 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rsi)
	incq	%rdx
	addq	$28, %rsi
	cmpq	%rbp, %rdx
	jle	.LBB7_19
.LBB7_20:                               # %polly.merge.us46
                                        #   in Loop: Header=BB7_17 Depth=2
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB7_17
	jmp	.LBB7_3
.LBB7_21:                               # %polly.par.loadIVBounds.split.split
                                        #   in Loop: Header=BB7_4 Depth=1
	testq	%r13, %r13
	js	.LBB7_22
	.p2align	4, 0x90
.LBB7_24:                               # %polly.loop_header.us53
                                        #   Parent Loop BB7_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_26 Depth 3
	cmpq	$1, %rcx
	jne	.LBB7_27
# BB#25:                                #   in Loop: Header=BB7_24 Depth=2
	movq	$-1, %rdx
	movq	%r14, %rsi
	.p2align	4, 0x90
.LBB7_26:                               # %polly.loop_header2.us63
                                        #   Parent Loop BB7_4 Depth=1
                                        #     Parent Loop BB7_24 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rsi)
	incq	%rdx
	addq	$28, %rsi
	cmpq	%rbp, %rdx
	jle	.LBB7_26
.LBB7_27:                               # %polly.merge.us68
                                        #   in Loop: Header=BB7_24 Depth=2
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB7_24
	jmp	.LBB7_3
.LBB7_22:                               # %polly.loop_header.preheader
                                        #   in Loop: Header=BB7_4 Depth=1
	decq	%rcx
	.p2align	4, 0x90
.LBB7_23:                               # %polly.loop_header
                                        #   Parent Loop BB7_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB7_23
	.p2align	4, 0x90
.LBB7_3:                                # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB7_4 Depth=1
	leaq	24(%rsp), %rdi
	leaq	16(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB7_4
.LBB7_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end7:
	.size	findMoves_polly_subfn_10_polly_subfn, .Lfunc_end7-findMoves_polly_subfn_10_polly_subfn
	.cfi_endproc

	.p2align	4, 0x90
	.type	findMoves_polly_subfn_11,@function
findMoves_polly_subfn_11:               # @findMoves_polly_subfn_11
.Lfunc_begin8:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp132:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp133:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp134:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp135:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp136:
	.cfi_def_cfa_offset 48
	subq	$32, %rsp
.Ltmp137:
	.cfi_def_cfa_offset 80
.Ltmp138:
	.cfi_offset %rbx, -48
.Ltmp139:
	.cfi_offset %r12, -40
.Ltmp140:
	.cfi_offset %r13, -32
.Ltmp141:
	.cfi_offset %r14, -24
.Ltmp142:
	.cfi_offset %r15, -16
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB8_2
# BB#1:
	leaq	16(%rsp), %r14
	leaq	8(%rsp), %r15
	leaq	24(%rsp), %r12
	.p2align	4, 0x90
.LBB8_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_5 Depth 2
	movq	8(%rsp), %r13
	movq	16(%rsp), %rbx
	addq	$-2, %r13
	.p2align	4, 0x90
.LBB8_5:                                # %polly.loop_header
                                        #   Parent Loop BB8_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpq	$3, %rbx
	jge	.LBB8_7
# BB#6:                                 # %polly.loop_preheader3
                                        #   in Loop: Header=BB8_5 Depth=2
	movl	$0, Z(,%rbx,4)
	movl	$0, Z+28(,%rbx,4)
	movl	$0, Z+56(,%rbx,4)
	movl	$0, Z+84(,%rbx,4)
	cmpq	$2, %rbx
	je	.LBB8_8
.LBB8_7:                                # %polly.parallel.for
                                        #   in Loop: Header=BB8_5 Depth=2
	movq	%rbx, 24(%rsp)
	movl	$findMoves_polly_subfn_11_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$2, %r8d
	movl	$1, %r9d
	movq	%r12, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%r12, %rdi
	callq	findMoves_polly_subfn_11_polly_subfn
	callq	GOMP_parallel_end
.LBB8_8:                                # %polly.merge10
                                        #   in Loop: Header=BB8_5 Depth=2
	cmpq	%r13, %rbx
	leaq	1(%rbx), %rbx
	jle	.LBB8_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB8_4 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB8_4
.LBB8_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
.Lfunc_end8:
	.size	findMoves_polly_subfn_11, .Lfunc_end8-findMoves_polly_subfn_11
	.cfi_endproc

	.p2align	4, 0x90
	.type	findMoves_polly_subfn_11_polly_subfn,@function
findMoves_polly_subfn_11_polly_subfn:   # @findMoves_polly_subfn_11_polly_subfn
.Lfunc_begin9:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Ltmp143:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp144:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp145:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp146:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp147:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp148:
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
.Ltmp149:
	.cfi_def_cfa_offset 96
.Ltmp150:
	.cfi_offset %rbx, -56
.Ltmp151:
	.cfi_offset %r12, -48
.Ltmp152:
	.cfi_offset %r13, -40
.Ltmp153:
	.cfi_offset %r14, -32
.Ltmp154:
	.cfi_offset %r15, -24
.Ltmp155:
	.cfi_offset %rbp, -16
	movq	(%rdi), %rbx
	leaq	24(%rsp), %rdi
	leaq	16(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB9_2
# BB#1:                                 # %polly.par.loadIVBounds.preheader
	movl	$1, %r13d
	movq	%rbx, %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	subq	%rax, %r13
	movq	%r13, %rbx
	shrq	$63, %rbx
	movq	%rax, %rbp
	negq	%rbp
	movl	$5, %ecx
	subq	%rax, %rcx
	movq	%rcx, 8(%rsp)           # 8-byte Spill
	movl	$4, %r15d
	subq	%rax, %r15
	leaq	Z+112(,%rax,4), %r14
	leaq	Z(,%rax,4), %r12
	.p2align	4, 0x90
.LBB9_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB9_23 Depth 2
                                        #     Child Loop BB9_24 Depth 2
                                        #       Child Loop BB9_26 Depth 3
                                        #     Child Loop BB9_17 Depth 2
                                        #       Child Loop BB9_19 Depth 3
                                        #     Child Loop BB9_12 Depth 2
                                        #       Child Loop BB9_14 Depth 3
                                        #     Child Loop BB9_6 Depth 2
                                        #       Child Loop BB9_10 Depth 3
                                        #       Child Loop BB9_9 Depth 3
	movq	16(%rsp), %rax
	movq	24(%rsp), %rcx
	addq	$-2, %rax
	cmpq	$3, 32(%rsp)            # 8-byte Folded Reload
	jl	.LBB9_16
# BB#5:                                 # %polly.par.loadIVBounds.split.us
                                        #   in Loop: Header=BB9_4 Depth=1
	cmpq	$0, 8(%rsp)             # 8-byte Folded Reload
	js	.LBB9_12
	.p2align	4, 0x90
.LBB9_6:                                # %polly.loop_header.us.us
                                        #   Parent Loop BB9_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB9_10 Depth 3
                                        #       Child Loop BB9_9 Depth 3
	movq	$-1, %rdx
	cmpq	$1, %rcx
	movq	%r12, %rsi
	jne	.LBB9_10
# BB#7:                                 # %polly.then.us.us
                                        #   in Loop: Header=BB9_6 Depth=2
	testq	%r13, %r13
	js	.LBB9_11
# BB#8:                                 #   in Loop: Header=BB9_6 Depth=2
	movq	$-1, %rdx
	movq	%r14, %rsi
	.p2align	4, 0x90
.LBB9_9:                                # %polly.loop_header2.us.us
                                        #   Parent Loop BB9_4 Depth=1
                                        #     Parent Loop BB9_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rsi)
	incq	%rdx
	addq	$28, %rsi
	cmpq	%rbp, %rdx
	jle	.LBB9_9
	jmp	.LBB9_11
	.p2align	4, 0x90
.LBB9_10:                               # %polly.loop_header15.us.us
                                        #   Parent Loop BB9_4 Depth=1
                                        #     Parent Loop BB9_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rsi)
	incq	%rdx
	addq	$28, %rsi
	cmpq	%r15, %rdx
	jle	.LBB9_10
.LBB9_11:                               # %polly.merge.us.us
                                        #   in Loop: Header=BB9_6 Depth=2
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB9_6
	jmp	.LBB9_3
	.p2align	4, 0x90
.LBB9_12:                               # %polly.loop_header.us
                                        #   Parent Loop BB9_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB9_14 Depth 3
	cmpq	$1, %rcx
	setne	%dl
	orb	%bl, %dl
	jne	.LBB9_15
# BB#13:                                #   in Loop: Header=BB9_12 Depth=2
	movq	$-1, %rdx
	movq	%r14, %rsi
	.p2align	4, 0x90
.LBB9_14:                               # %polly.loop_header2.us
                                        #   Parent Loop BB9_4 Depth=1
                                        #     Parent Loop BB9_12 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rsi)
	incq	%rdx
	addq	$28, %rsi
	cmpq	%rbp, %rdx
	jle	.LBB9_14
.LBB9_15:                               # %polly.merge.us
                                        #   in Loop: Header=BB9_12 Depth=2
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB9_12
	jmp	.LBB9_3
	.p2align	4, 0x90
.LBB9_16:                               # %polly.par.loadIVBounds.split
                                        #   in Loop: Header=BB9_4 Depth=1
	cmpq	$0, 8(%rsp)             # 8-byte Folded Reload
	js	.LBB9_21
	.p2align	4, 0x90
.LBB9_17:                               # %polly.loop_header.us29
                                        #   Parent Loop BB9_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB9_19 Depth 3
	cmpq	$1, %rcx
	setne	%dl
	orb	%bl, %dl
	jne	.LBB9_20
# BB#18:                                #   in Loop: Header=BB9_17 Depth=2
	movq	$-1, %rdx
	movq	%r14, %rsi
	.p2align	4, 0x90
.LBB9_19:                               # %polly.loop_header2.us39
                                        #   Parent Loop BB9_4 Depth=1
                                        #     Parent Loop BB9_17 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rsi)
	incq	%rdx
	addq	$28, %rsi
	cmpq	%rbp, %rdx
	jle	.LBB9_19
.LBB9_20:                               # %polly.merge.us44
                                        #   in Loop: Header=BB9_17 Depth=2
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB9_17
	jmp	.LBB9_3
.LBB9_21:                               # %polly.par.loadIVBounds.split.split
                                        #   in Loop: Header=BB9_4 Depth=1
	testq	%r13, %r13
	js	.LBB9_22
	.p2align	4, 0x90
.LBB9_24:                               # %polly.loop_header.us51
                                        #   Parent Loop BB9_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB9_26 Depth 3
	cmpq	$1, %rcx
	jne	.LBB9_27
# BB#25:                                #   in Loop: Header=BB9_24 Depth=2
	movq	$-1, %rdx
	movq	%r14, %rsi
	.p2align	4, 0x90
.LBB9_26:                               # %polly.loop_header2.us61
                                        #   Parent Loop BB9_4 Depth=1
                                        #     Parent Loop BB9_24 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, (%rsi)
	incq	%rdx
	addq	$28, %rsi
	cmpq	%rbp, %rdx
	jle	.LBB9_26
.LBB9_27:                               # %polly.merge.us66
                                        #   in Loop: Header=BB9_24 Depth=2
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB9_24
	jmp	.LBB9_3
.LBB9_22:                               # %polly.loop_header.preheader
                                        #   in Loop: Header=BB9_4 Depth=1
	decq	%rcx
	.p2align	4, 0x90
.LBB9_23:                               # %polly.loop_header
                                        #   Parent Loop BB9_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB9_23
	.p2align	4, 0x90
.LBB9_3:                                # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB9_4 Depth=1
	leaq	24(%rsp), %rdi
	leaq	16(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB9_4
.LBB9_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end9:
	.size	findMoves_polly_subfn_11_polly_subfn, .Lfunc_end9-findMoves_polly_subfn_11_polly_subfn
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
