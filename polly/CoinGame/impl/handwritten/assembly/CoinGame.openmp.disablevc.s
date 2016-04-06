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
	.loc	1 31 0                  # CoinGame.c:31:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 34 2 prologue_end     # CoinGame.c:34:2
	pushq	%rax
.Ltmp0:
	.cfi_def_cfa_offset 16
	movl	$.L.str, %edi
	movl	$6, %esi
	xorl	%eax, %eax
	callq	printf
.Ltmp1:
	#DEBUG_VALUE: init:i <- 0
	.loc	1 36 8                  # CoinGame.c:36:8
	movaps	.LCPI0_0(%rip), %xmm0   # xmm0 = [0,1,2,3]
	movaps	%xmm0, V(%rip)
	movabsq	$21474836484, %rax      # imm = 0x500000004
	movq	%rax, V+16(%rip)
.Ltmp2:
	.loc	1 38 1                  # CoinGame.c:38:1
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
	.loc	1 40 0                  # CoinGame.c:40:0
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
	.loc	1 44 12 prologue_end    # CoinGame.c:44:12
	movslq	%edx, %rsi
	.loc	1 44 16 is_stmt 0       # CoinGame.c:44:16
	leal	1(%rdi), %edx
	.loc	1 44 12                 # CoinGame.c:44:12
	movslq	%edx, %r10
	leaq	(,%rsi,4), %rax
	leaq	(%r10,%r10,2), %rdx
	movl	M(%rax,%rdx,8), %r9d
.Ltmp6:
	#DEBUG_VALUE: P1 <- %R9D
	.loc	1 45 19 is_stmt 1       # CoinGame.c:45:19
	leal	-1(%rsi), %edx
	.loc	1 45 12 is_stmt 0       # CoinGame.c:45:12
	movslq	%edi, %rcx
	leaq	(%rcx,%rcx,2), %rdi
.Ltmp7:
	.loc	1 47 10 is_stmt 1       # CoinGame.c:47:10
	cmpl	M-4(%rax,%rdi,8), %r9d
.Ltmp8:
	.loc	1 47 7 is_stmt 0        # CoinGame.c:47:7
	cmovlel	%esi, %edx
	movl	%ecx, %edi
	cmovlel	%r10d, %edi
	cmovgq	%rsi, %rcx
.Ltmp9:
	.loc	1 49 11 is_stmt 1       # CoinGame.c:49:11
	movl	V(,%rcx,4), %esi
.Ltmp10:
	.loc	1 56 7                  # CoinGame.c:56:7
	testl	%r8d, %r8d
.Ltmp11:
	.loc	1 56 7 is_stmt 0        # CoinGame.c:56:7
	je	.LBB1_3
.Ltmp12:
# BB#2:                                 # %if.then12
                                        #   in Loop: Header=BB1_1 Depth=1
	#DEBUG_VALUE: P1 <- %R9D
	.loc	1 57 14 is_stmt 1       # CoinGame.c:57:14
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
	.loc	1 60 12                 # CoinGame.c:60:12
	addl	%esi, sum_bob(%rip)
.Ltmp15:
	#DEBUG_VALUE: sumMoves:alice <- 1
	movl	$1, %r8d
.Ltmp16:
.LBB1_4:                                # %while.cond.backedge
                                        #   in Loop: Header=BB1_1 Depth=1
	#DEBUG_VALUE: P1 <- %R9D
	.loc	1 43 2 discriminator 1  # CoinGame.c:43:2
	cmpl	%edx, %edi
	jle	.LBB1_1
.Ltmp17:
# BB#5:                                 # %while.end
	#DEBUG_VALUE: P1 <- %R9D
	.loc	1 65 1                  # CoinGame.c:65:1
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
	.loc	1 69 0                  # CoinGame.c:69:0
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
	.loc	1 73 12 prologue_end    # CoinGame.c:73:12
	movq	%rbx, 16(%rsp)          # 8-byte Spill
	movl	%r14d, 12(%rsp)         # 4-byte Spill
	movslq	%r14d, %rbp
	.loc	1 73 16 is_stmt 0       # CoinGame.c:73:16
	leal	1(%rbx), %r13d
	.loc	1 73 12                 # CoinGame.c:73:12
	movslq	%r13d, %rax
	leaq	(,%rbp,4), %rcx
	leaq	(%rax,%rax,2), %rax
	movl	M(%rcx,%rax,8), %r15d
.Ltmp35:
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 74 12 is_stmt 1       # CoinGame.c:74:12
	movslq	%ebx, %r14
	leaq	(%r14,%r14,2), %rax
	movl	M-4(%rcx,%rax,8), %ebx
.Ltmp36:
	#DEBUG_VALUE: P2 <- %EBX
	.loc	1 75 7                  # CoinGame.c:75:7
	testb	%r12b, %r12b
	je	.LBB2_3
.Ltmp37:
# BB#2:                                 # %if.then
                                        #   in Loop: Header=BB2_1 Depth=1
	#DEBUG_VALUE: P2 <- %EBX
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 76 4                  # CoinGame.c:76:4
	movl	$.L.str.1, %edi
	jmp	.LBB2_4
.Ltmp38:
	.p2align	4, 0x90
.LBB2_3:                                # %if.else
                                        #   in Loop: Header=BB2_1 Depth=1
	#DEBUG_VALUE: P2 <- %EBX
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 78 4                  # CoinGame.c:78:4
	movl	$.L.str.2, %edi
.Ltmp39:
.LBB2_4:                                # %if.end
                                        #   in Loop: Header=BB2_1 Depth=1
	#DEBUG_VALUE: P1 <- %R15D
	#DEBUG_VALUE: P2 <- %EBX
	xorl	%eax, %eax
	callq	printf
.Ltmp40:
	.loc	1 81 10                 # CoinGame.c:81:10
	cmpl	%ebx, %r15d
	jle	.LBB2_5
.Ltmp41:
# BB#6:                                 # %if.else14
                                        #   in Loop: Header=BB2_1 Depth=1
	#DEBUG_VALUE: P2 <- %EBX
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 74 19                 # CoinGame.c:74:19
	leal	-1(%rbp), %r14d
.Ltmp42:
	.loc	1 85 26                 # CoinGame.c:85:26
	leal	1(%rbp), %esi
	.loc	1 85 31 is_stmt 0       # CoinGame.c:85:31
	movl	V(,%rbp,4), %edx
	.loc	1 85 4                  # CoinGame.c:85:4
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
	.loc	1 82 31 is_stmt 1       # CoinGame.c:82:31
	movl	V(,%r14,4), %edx
	.loc	1 82 4 is_stmt 0        # CoinGame.c:82:4
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
	.loc	1 88 7 is_stmt 1        # CoinGame.c:88:7
	testb	%r12b, %r12b
	je	.LBB2_9
.Ltmp47:
# BB#8:                                 # %if.then21
                                        #   in Loop: Header=BB2_1 Depth=1
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 89 4                  # CoinGame.c:89:4
	movl	$.L.str.4, %edi
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB2_10
.Ltmp48:
	.p2align	4, 0x90
.LBB2_9:                                # %if.else23
                                        #   in Loop: Header=BB2_1 Depth=1
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 91 4                  # CoinGame.c:91:4
	movl	$.Lstr, %edi
	callq	puts
.Ltmp49:
.LBB2_10:                               # %if.end25
                                        #   in Loop: Header=BB2_1 Depth=1
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 93 9                  # CoinGame.c:93:9
	testb	%r12b, %r12b
	sete	%r12b
.Ltmp50:
	.loc	1 72 2 discriminator 1  # CoinGame.c:72:2
	cmpl	%r14d, %ebx
	jle	.LBB2_1
.Ltmp51:
# BB#11:                                # %while.end
	#DEBUG_VALUE: P1 <- %R15D
	.loc	1 96 1                  # CoinGame.c:96:1
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
	.loc	1 98 0                  # CoinGame.c:98:0
	.cfi_startproc
# BB#0:                                 # %entry
	xorl	%r10d, %r10d
.Ltmp54:
	#DEBUG_VALUE: maxMoney:s <- 0
	.p2align	4, 0x90
.LBB3_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_2 Depth 2
                                        #     Child Loop BB3_11 Depth 2
	movq	%r10, %rcx
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB3_2:                                # %for.body3
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp55:
	.loc	1 104 7 prologue_end    # CoinGame.c:104:7
	cmpl	$5, %r8d
	jg	.LBB3_10
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB3_2 Depth=2
.Ltmp56:
	.loc	1 105 5                 # CoinGame.c:105:5
	movslq	%r8d, %rsi
	.loc	1 105 13 is_stmt 0      # CoinGame.c:105:13
	leaq	(,%rsi,8), %rdx
	leaq	(%rdx,%rdx,2), %rdx
	movl	$0, X(%rdx,%rcx,4)
.Ltmp57:
	.loc	1 106 11 is_stmt 1      # CoinGame.c:106:11
	leal	2(%r8), %edi
.Ltmp58:
	.loc	1 106 9 is_stmt 0       # CoinGame.c:106:9
	cmpl	$5, %edi
	jg	.LBB3_5
# BB#4:                                 # %if.then8
                                        #   in Loop: Header=BB3_2 Depth=2
.Ltmp59:
	.loc	1 107 26 is_stmt 1      # CoinGame.c:107:26
	movslq	%edi, %rdi
	leaq	(%rdi,%rdi,2), %r9
	leaq	(,%rcx,4), %rdi
	movl	M(%rdi,%r9,8), %edi
	.loc	1 107 14 is_stmt 0      # CoinGame.c:107:14
	movl	%edi, X(%rdx,%rcx,4)
.Ltmp60:
.LBB3_5:                                # %if.end
                                        #   in Loop: Header=BB3_2 Depth=2
	.loc	1 109 13 is_stmt 1      # CoinGame.c:109:13
	movl	$0, Y(%rdx,%rcx,4)
.Ltmp61:
	.loc	1 110 11                # CoinGame.c:110:11
	incl	%r8d
	.loc	1 110 19 is_stmt 0      # CoinGame.c:110:19
	testq	%rcx, %rcx
	jle	.LBB3_8
# BB#6:                                 # %if.end
                                        #   in Loop: Header=BB3_2 Depth=2
	cmpl	$5, %r8d
	jg	.LBB3_8
# BB#7:                                 # %if.then30
                                        #   in Loop: Header=BB3_2 Depth=2
.Ltmp62:
	.loc	1 111 26 is_stmt 1      # CoinGame.c:111:26
	movslq	%r8d, %rdi
	leaq	(%rdi,%rdi,2), %r9
	leaq	(,%rcx,4), %rdi
	movl	M-4(%rdi,%r9,8), %edi
	.loc	1 111 14 is_stmt 0      # CoinGame.c:111:14
	movl	%edi, Y(%rdx,%rcx,4)
.Ltmp63:
.LBB3_8:                                # %if.end46
                                        #   in Loop: Header=BB3_2 Depth=2
	.loc	1 113 13 is_stmt 1      # CoinGame.c:113:13
	movl	$0, Z(%rdx,%rcx,4)
	.loc	1 114 9                 # CoinGame.c:114:9
	cmpq	$2, %rcx
	jl	.LBB3_10
# BB#9:                                 # %if.then53
                                        #   in Loop: Header=BB3_2 Depth=2
.Ltmp64:
	.loc	1 115 25                # CoinGame.c:115:25
	leaq	(%rsi,%rsi,2), %rsi
	leaq	(,%rcx,4), %rdi
	movl	M-8(%rdi,%rsi,8), %esi
	.loc	1 115 14 is_stmt 0      # CoinGame.c:115:14
	movl	%esi, Z(%rdx,%rcx,4)
.Ltmp65:
.LBB3_10:                               # %for.inc
                                        #   in Loop: Header=BB3_2 Depth=2
	.loc	1 103 3 is_stmt 1 discriminator 1 # CoinGame.c:103:3
	incq	%rcx
	cmpl	$6, %ecx
	movl	$V, %esi
	movl	$0, %edi
	movl	$1, %r9d
	jne	.LBB3_2
.Ltmp66:
	.p2align	4, 0x90
.LBB3_11:                               # %for.inc180
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 125 15                # CoinGame.c:125:15
	movl	X(%rdi,%r10,4), %ecx
	movl	Y(%rdi,%r10,4), %eax
	cmpl	%eax, %ecx
	.loc	1 125 15 is_stmt 0 discriminator 1 # CoinGame.c:125:15
	cmovgl	%eax, %ecx
	.loc	1 125 15 discriminator 3 # CoinGame.c:125:15
	addl	(%rsi), %ecx
	movl	Z(%rdi,%r10,4), %edx
	cmpl	%edx, %eax
	cmovlel	%eax, %edx
	.loc	1 125 15 discriminator 6 # CoinGame.c:125:15
	addl	(%rsi,%r10,4), %edx
	cmpl	%edx, %ecx
	cmovgel	%ecx, %edx
	.loc	1 125 13 discriminator 15 # CoinGame.c:125:13
	movl	%edx, M(%rdi,%r10,4)
.Ltmp67:
	.loc	1 122 26 is_stmt 1 discriminator 2 # CoinGame.c:122:26
	leaq	(%r10,%r9), %rax
.Ltmp68:
	.loc	1 122 3 is_stmt 0 discriminator 3 # CoinGame.c:122:3
	cmpq	$5, %rax
	jg	.LBB3_13
# BB#12:                                # %for.inc180
                                        #   in Loop: Header=BB3_11 Depth=2
	movq	%r9, %rax
	incq	%rax
	addq	$28, %rdi
	addq	$4, %rsi
	cmpl	$6, %r9d
	movq	%rax, %r9
	jl	.LBB3_11
.Ltmp69:
.LBB3_13:                               # %for.inc183
                                        #   in Loop: Header=BB3_1 Depth=1
	.loc	1 100 2 is_stmt 1 discriminator 1 # CoinGame.c:100:2
	incq	%r10
	cmpq	$6, %r10
	jne	.LBB3_1
.Ltmp70:
# BB#14:                                # %for.end185
	.loc	1 136 9                 # CoinGame.c:136:9
	movl	M+20(%rip), %eax
	.loc	1 136 2 is_stmt 0       # CoinGame.c:136:2
	retq
.Ltmp71:
.Lfunc_end3:
	.size	maxMoney, .Lfunc_end3-maxMoney
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin4:
	.loc	1 138 0 is_stmt 1       # CoinGame.c:138:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 140 2 prologue_end    # CoinGame.c:140:2
	pushq	%rax
.Ltmp72:
	.cfi_def_cfa_offset 16
	callq	maxMoney
.Ltmp73:
	#DEBUG_VALUE: sumMoves:j <- 5
	#DEBUG_VALUE: sumMoves:i <- 0
	movl	$1, %r8d
	movl	$5, %edx
.Ltmp74:
	#DEBUG_VALUE: sumMoves:alice <- 1
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB4_1:                                # %while.body.i
                                        # =>This Inner Loop Header: Depth=1
.Ltmp75:
	.loc	1 44 12                 # CoinGame.c:44:12
	movslq	%edx, %rsi
	.loc	1 44 16 is_stmt 0       # CoinGame.c:44:16
	leal	1(%rdi), %edx
	.loc	1 44 12                 # CoinGame.c:44:12
	movslq	%edx, %r10
	leaq	(,%rsi,4), %rax
	leaq	(%r10,%r10,2), %rdx
	movl	M(%rax,%rdx,8), %r9d
.Ltmp76:
	#DEBUG_VALUE: P1 <- %R9D
	.loc	1 45 19 is_stmt 1       # CoinGame.c:45:19
	leal	-1(%rsi), %edx
	.loc	1 45 12 is_stmt 0       # CoinGame.c:45:12
	movslq	%edi, %rcx
	leaq	(%rcx,%rcx,2), %rdi
.Ltmp77:
	.loc	1 47 10 is_stmt 1       # CoinGame.c:47:10
	cmpl	M-4(%rax,%rdi,8), %r9d
.Ltmp78:
	.loc	1 47 7 is_stmt 0        # CoinGame.c:47:7
	cmovlel	%esi, %edx
	movl	%ecx, %edi
	cmovlel	%r10d, %edi
	cmovgq	%rsi, %rcx
.Ltmp79:
	.loc	1 49 11 is_stmt 1       # CoinGame.c:49:11
	movl	V(,%rcx,4), %esi
.Ltmp80:
	.loc	1 56 7                  # CoinGame.c:56:7
	testl	%r8d, %r8d
.Ltmp81:
	.loc	1 56 7 is_stmt 0        # CoinGame.c:56:7
	je	.LBB4_3
.Ltmp82:
# BB#2:                                 # %if.then12.i
                                        #   in Loop: Header=BB4_1 Depth=1
	#DEBUG_VALUE: P1 <- %R9D
	.loc	1 57 14 is_stmt 1       # CoinGame.c:57:14
	addl	%esi, sum_alice(%rip)
.Ltmp83:
	#DEBUG_VALUE: sumMoves:alice <- 0
	xorl	%r8d, %r8d
	jmp	.LBB4_4
.Ltmp84:
	.p2align	4, 0x90
.LBB4_3:                                # %if.else14.i
                                        #   in Loop: Header=BB4_1 Depth=1
	#DEBUG_VALUE: P1 <- %R9D
	.loc	1 60 12                 # CoinGame.c:60:12
	addl	%esi, sum_bob(%rip)
.Ltmp85:
	#DEBUG_VALUE: sumMoves:alice <- 1
	movl	$1, %r8d
.Ltmp86:
.LBB4_4:                                # %while.cond.backedge.i
                                        #   in Loop: Header=BB4_1 Depth=1
	#DEBUG_VALUE: P1 <- %R9D
	.loc	1 43 2 discriminator 1  # CoinGame.c:43:2
	cmpl	%edx, %edi
	jle	.LBB4_1
.Ltmp87:
# BB#5:                                 # %sumMoves.exit
	#DEBUG_VALUE: P1 <- %R9D
	.loc	1 142 2                 # CoinGame.c:142:2
	callq	printMoves
.Ltmp88:
	.loc	1 144 6                 # CoinGame.c:144:6
	movl	sum_alice(%rip), %esi
	.loc	1 144 16 is_stmt 0      # CoinGame.c:144:16
	cmpl	M+20(%rip), %esi
	jne	.LBB4_6
.Ltmp89:
# BB#8:                                 # %if.end
	.loc	1 149 5 is_stmt 1       # CoinGame.c:149:5
	cmpl	sum_bob(%rip), %esi
	jl	.LBB4_9
# BB#10:                                # %if.end5
	.loc	1 154 2                 # CoinGame.c:154:2
	movl	$.L.str.8, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 155 64                # CoinGame.c:155:64
	movl	sum_bob(%rip), %esi
	.loc	1 155 2 is_stmt 0       # CoinGame.c:155:2
	movl	$.L.str.9, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 156 1 is_stmt 1       # CoinGame.c:156:1
	xorl	%eax, %eax
	popq	%rcx
	retq
.LBB4_6:                                # %if.then
.Ltmp90:
	.loc	1 145 3                 # CoinGame.c:145:3
	movl	$.L.str.6, %edi
	jmp	.LBB4_7
.Ltmp91:
.LBB4_9:                                # %if.then3
	.loc	1 150 3                 # CoinGame.c:150:3
	movl	$.L.str.7, %edi
.Ltmp92:
.LBB4_7:                                # %if.then
	.loc	1 145 3                 # CoinGame.c:145:3
	xorl	%eax, %eax
	callq	printf
	.loc	1 146 3                 # CoinGame.c:146:3
	movl	$-1, %edi
	callq	exit
.Ltmp93:
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

	.type	X,@object               # @X
	.comm	X,144,16
	.type	Y,@object               # @Y
	.comm	Y,144,16
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
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp83-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Lfunc_end4-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
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
	.long	75                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	29                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	sum_alice
	.byte	2                       # Abbrev [2] 0x6e:0x15 DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.long	75                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	29                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	sum_bob
	.byte	2                       # Abbrev [2] 0x83:0x15 DW_TAG_variable
	.long	.Linfo_string8          # DW_AT_name
	.long	152                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	23                      # DW_AT_decl_line
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
	.byte	26                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	X
	.byte	2                       # Abbrev [2] 0xbf:0x15 DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.long	152                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	Y
	.byte	2                       # Abbrev [2] 0xd4:0x15 DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.long	152                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	28                      # DW_AT_decl_line
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
	.byte	31                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0xfe:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
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
	.byte	69                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0x16a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	8                       # Abbrev [8] 0x176:0xc DW_TAG_variable
	.byte	5                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	14                      # Abbrev [14] 0x182:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	71                      # DW_AT_decl_line
	.long	670                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x18e:0x2c DW_TAG_lexical_block
	.quad	.Ltmp34                 # DW_AT_low_pc
	.long	.Ltmp50-.Ltmp34         # DW_AT_high_pc
	.byte	15                      # Abbrev [15] 0x19b:0xf DW_TAG_variable
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	73                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1aa:0xf DW_TAG_variable
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	74                      # DW_AT_decl_line
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
	.byte	98                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0x1d4:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	99                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	17                      # Abbrev [17] 0x1e0:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	99                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	17                      # Abbrev [17] 0x1eb:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	99                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	18                      # Abbrev [18] 0x1f7:0x4d DW_TAG_subprogram
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	40                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	17                      # Abbrev [17] 0x1ff:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	41                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	17                      # Abbrev [17] 0x20a:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	41                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	17                      # Abbrev [17] 0x215:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	42                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	19                      # Abbrev [19] 0x220:0x23 DW_TAG_lexical_block
	.byte	17                      # Abbrev [17] 0x221:0xb DW_TAG_variable
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	17                      # Abbrev [17] 0x22c:0xb DW_TAG_variable
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	45                      # DW_AT_decl_line
	.long	75                      # DW_AT_type
	.byte	17                      # Abbrev [17] 0x237:0xb DW_TAG_variable
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	46                      # DW_AT_decl_line
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
	.byte	138                     # DW_AT_decl_line
	.long	75                      # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	20                      # Abbrev [20] 0x25d:0x40 DW_TAG_inlined_subroutine
	.long	503                     # DW_AT_abstract_origin
	.quad	.Ltmp75                 # DW_AT_low_pc
	.long	.Ltmp87-.Ltmp75         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	141                     # DW_AT_call_line
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
	.quad	.Ltmp75                 # DW_AT_low_pc
	.long	.Ltmp86-.Ltmp75         # DW_AT_high_pc
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
