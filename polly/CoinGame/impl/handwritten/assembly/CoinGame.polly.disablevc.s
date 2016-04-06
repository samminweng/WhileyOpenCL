	.text
	.file	"llvm/CoinGame.polly.disablevc.ll"
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
# BB#0:                                 # %polly.loop_header341.4
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
	pushq	%rax
.Ltmp41:
	.cfi_def_cfa_offset 64
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
	movl	$0, Y+28(%rip)
	movl	$0, Y+56(%rip)
	movl	$0, Y+84(%rip)
	movl	$0, Y+112(%rip)
	movl	$0, Y+140(%rip)
	movl	$0, Y+32(%rip)
	movl	$0, Y+60(%rip)
	movl	$0, Y+88(%rip)
	movl	$0, Y+116(%rip)
	movl	$0, Y+36(%rip)
	movl	$0, Y+64(%rip)
	movl	$0, Y+92(%rip)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, Y(%rip)
	movl	$0, Y+40(%rip)
	movl	$0, Y+68(%rip)
	movl	$0, Y+44(%rip)
	movq	$0, Y+16(%rip)
	movl	$0, X+28(%rip)
	movl	$0, X+56(%rip)
	movl	$0, X+84(%rip)
	movl	$0, X+112(%rip)
	movl	$0, X+140(%rip)
	movl	$0, X+32(%rip)
	movl	$0, X+60(%rip)
	movl	$0, X+88(%rip)
	movl	$0, X+116(%rip)
	movl	$0, X+36(%rip)
	movl	$0, X+64(%rip)
	movl	$0, X+92(%rip)
	movaps	%xmm0, X(%rip)
	movl	$0, X+40(%rip)
	movl	$0, X+68(%rip)
	movl	$0, X+44(%rip)
	movq	$0, X+16(%rip)
	movl	$0, Z+28(%rip)
	movl	$0, Z+56(%rip)
	movl	$0, Z+84(%rip)
	movl	$0, Z+112(%rip)
	movl	$0, Z+140(%rip)
	movl	$0, Z+32(%rip)
	movl	$0, Z+60(%rip)
	movl	$0, Z+88(%rip)
	movl	$0, Z+116(%rip)
	movl	$0, Z+36(%rip)
	movl	$0, Z+64(%rip)
	movl	$0, Z+92(%rip)
	movaps	%xmm0, Z(%rip)
	movl	$0, Z+40(%rip)
	movl	$0, Z+68(%rip)
	movl	$0, Z+44(%rip)
	movq	$0, Z+16(%rip)
	movl	$1, %r11d
	xorl	%r8d, %r8d
	movl	$2, %r14d
	movl	$4, %r9d
	movl	$3, %r10d
	xorl	%r12d, %r12d
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB1_1:                                # %polly.loop_header350
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_12 Depth 2
                                        #     Child Loop BB1_14 Depth 2
                                        #     Child Loop BB1_15 Depth 2
                                        #     Child Loop BB1_6 Depth 2
	testq	%r14, %r14
	movl	$0, %edi
	cmovnsq	%r14, %rdi
	testq	%r11, %r11
	movl	$0, %ebx
	cmovnsq	%r11, %rbx
	movl	$1, %ecx
	subq	%r13, %rcx
	cmovsq	%r8, %rcx
	movl	$5, %r15d
	subq	%r13, %r15
	cmpq	$4, %r15
	movq	%r15, %rax
	cmovgq	%r9, %rax
	cmpq	%rax, %rcx
	jg	.LBB1_2
# BB#11:                                # %polly.loop_preheader357
                                        #   in Loop: Header=BB1_1 Depth=1
	imulq	$28, %rbx, %rdx
	decq	%rbx
	addq	%r12, %rdx
	decq	%rax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_12:                               # %polly.loop_header356
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	M+20(%rdx,%rcx), %ebp
	movl	%ebp, Y(%rdx,%rcx)
	incq	%rbx
	addq	$28, %rcx
	cmpq	%rax, %rbx
	jle	.LBB1_12
.LBB1_2:                                # %polly.loop_exit358
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpq	$3, %r15
	movq	%r15, %rax
	cmovgq	%r10, %rax
	testq	%rax, %rax
	js	.LBB1_3
# BB#13:                                # %polly.loop_preheader369
                                        #   in Loop: Header=BB1_1 Depth=1
	decq	%rax
	movq	$-1, %rdx
	movq	%r12, %rcx
	.p2align	4, 0x90
.LBB1_14:                               # %polly.loop_header368
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	M+48(%rcx), %ebx
	movl	%ebx, X(%rcx)
	incq	%rdx
	addq	$28, %rcx
	cmpq	%rax, %rdx
	jle	.LBB1_14
.LBB1_3:                                # %polly.cond
                                        #   in Loop: Header=BB1_1 Depth=1
	testq	%r13, %r13
	movl	$0, %ebx
	movl	$V, %edx
	movl	$7, %eax
	jle	.LBB1_4
	.p2align	4, 0x90
.LBB1_15:                               # %polly.loop_header381
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	X-4(%rbx,%r13,4), %ecx
	movl	Y-4(%rbx,%r13,4), %ebp
.Ltmp49:
	.loc	1 76 14 prologue_end    # CoinGame.c:76:14
	cmpl	%ebp, %ecx
	.loc	1 76 14 is_stmt 0 discriminator 1 # CoinGame.c:76:14
	cmovgl	%ebp, %ecx
	.loc	1 76 14 discriminator 3 # CoinGame.c:76:14
	addl	(%rdx), %ecx
	movl	Z-4(%rbx,%r13,4), %esi
	cmpl	%esi, %ebp
	cmovlel	%ebp, %esi
	.loc	1 76 14 discriminator 6 # CoinGame.c:76:14
	addl	-4(%rdx,%r13,4), %esi
	cmpl	%esi, %ecx
	cmovgel	%ecx, %esi
	movl	%esi, M-4(%rbx,%r13,4)
	decq	%rax
	addq	$4, %rdx
	addq	$28, %rbx
	cmpq	%r13, %rax
	jne	.LBB1_15
.Ltmp50:
.LBB1_4:                                # %polly.merge
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	$2, %eax
	subq	%r13, %rax
	movl	$0, %ecx
	cmovnsq	%rax, %rcx
	cmpq	%r15, %rcx
	jg	.LBB1_7
# BB#5:                                 #   in Loop: Header=BB1_1 Depth=1
	imulq	$28, %rdi, %rax
	decq	%rdi
	.p2align	4, 0x90
.LBB1_6:                                # %polly.loop_header406
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	M-8(%rax,%r12), %ecx
	movl	%ecx, Z(%rax,%r12)
	incq	%rdi
	addq	$28, %rax
	cmpq	%r15, %rdi
	jl	.LBB1_6
.LBB1_7:                                # %polly.loop_exit408
                                        #   in Loop: Header=BB1_1 Depth=1
	incq	%r13
	decq	%r11
	addq	$4, %r12
	decq	%r14
	cmpq	$7, %r13
	jne	.LBB1_1
# BB#8:
	movq	$-144, %rbx
	.p2align	4, 0x90
.LBB1_9:                                # %for.cond186.preheader
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
	jne	.LBB1_9
.Ltmp54:
# BB#10:                                # %for.end199
	.loc	1 94 9                  # CoinGame.c:94:9
	movl	M+20(%rip), %eax
	.loc	1 94 2 is_stmt 0        # CoinGame.c:94:2
	addq	$8, %rsp
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
