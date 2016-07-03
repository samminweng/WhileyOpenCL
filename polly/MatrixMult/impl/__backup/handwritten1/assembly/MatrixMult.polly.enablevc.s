	.text
	.file	"llvm/MatrixMult.polly.enablevc.ll"
	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
.Lfunc_begin0:
	.file	1 "MatrixMult.c"
	.loc	1 12 0                  # MatrixMult.c:12:0
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
	subq	$168, %rsp
.Ltmp6:
	.cfi_def_cfa_offset 224
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
	#DEBUG_VALUE: init:width <- %EDI
	#DEBUG_VALUE: init:height <- %ESI
	movq	%rsi, 24(%rsp)          # 8-byte Spill
.Ltmp13:
	.loc	1 25 60 prologue_end    # MatrixMult.c:25:60
	movq	%rdi, 32(%rsp)          # 8-byte Spill
	movslq	%edi, %r14
.Ltmp14:
	#DEBUG_VALUE: init:width <- [%RSP+32]
	.loc	1 25 59 is_stmt 0       # MatrixMult.c:25:59
	leaq	(,%r14,8), %r15
	.loc	1 25 66                 # MatrixMult.c:25:66
	movslq	%esi, %rbx
	.loc	1 25 65                 # MatrixMult.c:25:65
	movq	%rbx, 64(%rsp)          # 8-byte Spill
.Ltmp15:
	#DEBUG_VALUE: init:height <- [%RSP+24]
	movq	%r15, %rdi
	imulq	%rbx, %rdi
	.loc	1 25 35 discriminator 1 # MatrixMult.c:25:35
	callq	malloc
.Ltmp16:
	movq	%rax, 16(%rsp)          # 8-byte Spill
.Ltmp17:
	#DEBUG_VALUE: init:i <- 0
	.loc	1 27 5 is_stmt 1 discriminator 1 # MatrixMult.c:27:5
	testl	%ebx, %ebx
	jle	.LBB0_8
# BB#1:                                 # %entry
	movq	32(%rsp), %rax          # 8-byte Reload
	testl	%eax, %eax
	jle	.LBB0_8
# BB#2:                                 # %for.cond4.preheader.us.preheader
.Ltmp18:
	.loc	1 29 19                 # MatrixMult.c:29:19
	movq	32(%rsp), %rax          # 8-byte Reload
	leal	-1(%rax), %eax
	leaq	8(,%rax,8), %r12
	movq	24(%rsp), %rax          # 8-byte Reload
	leal	-1(%rax), %ecx
	movl	%ecx, 8(%rsp)           # 4-byte Spill
	xorl	%ebx, %ebx
	testb	$7, %al
	je	.LBB0_5
# BB#3:                                 # %for.cond4.preheader.us.prol.preheader
	movq	24(%rsp), %r13          # 8-byte Reload
	andl	$7, %r13d
	xorl	%ebx, %ebx
	movq	16(%rsp), %rbp          # 8-byte Reload
	.p2align	4, 0x90
.LBB0_4:                                # %for.cond4.preheader.us.prol
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 29 29 is_stmt 0       # MatrixMult.c:29:29
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movq	%r12, %rdx
	callq	memset
.Ltmp19:
	.loc	1 27 5 is_stmt 1 discriminator 1 # MatrixMult.c:27:5
	incq	%rbx
	addq	%r15, %rbp
	cmpl	%ebx, %r13d
	jne	.LBB0_4
.LBB0_5:                                # %for.cond4.preheader.us.preheader.split
.Ltmp20:
	.loc	1 29 19                 # MatrixMult.c:29:19
	cmpl	$7, 8(%rsp)             # 4-byte Folded Reload
	jb	.LBB0_8
# BB#6:                                 # %for.cond4.preheader.us.preheader.split.split
	movq	24(%rsp), %rax          # 8-byte Reload
	movl	%eax, %ecx
	subl	%ebx, %ecx
	imulq	%r14, %rbx
	movq	16(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%rbx,8), %r13
	movq	%r14, %rax
	shlq	$6, %rax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	.p2align	4, 0x90
.LBB0_7:                                # %for.cond4.preheader.us
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 29 29 is_stmt 0       # MatrixMult.c:29:29
	xorl	%esi, %esi
	movq	%r13, %rdi
	movq	%r12, %rdx
	movl	%ecx, %ebx
	callq	memset
	leaq	(%r13,%r15), %rbp
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movq	%r12, %rdx
	callq	memset
	addq	%r15, %rbp
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movq	%r12, %rdx
	callq	memset
	addq	%r15, %rbp
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movq	%r12, %rdx
	callq	memset
	addq	%r15, %rbp
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movq	%r12, %rdx
	callq	memset
	addq	%r15, %rbp
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movq	%r12, %rdx
	callq	memset
	addq	%r15, %rbp
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movq	%r12, %rdx
	callq	memset
	addq	%r15, %rbp
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movq	%r12, %rdx
	callq	memset
	movl	%ebx, %ecx
.Ltmp21:
	.loc	1 27 5 is_stmt 1 discriminator 1 # MatrixMult.c:27:5
	addq	8(%rsp), %r13           # 8-byte Folded Reload
	addl	$-8, %ecx
	jne	.LBB0_7
.Ltmp22:
.LBB0_8:                                # %polly.start
	movq	64(%rsp), %rax          # 8-byte Reload
	decq	%rax
	sarq	$5, %rax
	movq	%rax, 128(%rsp)         # 8-byte Spill
	js	.LBB0_25
# BB#9:                                 # %polly.loop_header.preheader
	leaq	-1(%r14), %rax
	sarq	$5, %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	%r14, %rax
	shrq	$2, %rax
	decq	%rax
	movq	%rax, 136(%rsp)         # 8-byte Spill
	movq	32(%rsp), %rax          # 8-byte Reload
	movl	%eax, %eax
	movl	%eax, %ecx
	andl	$3, %ecx
	movq	%rcx, 8(%rsp)           # 8-byte Spill
	movq	%r14, %rdx
	subq	%rcx, %rdx
	leaq	-1(%rcx), %rsi
	movq	%rsi, 96(%rsp)          # 8-byte Spill
	andl	$1, %eax
	movq	%rax, 104(%rsp)         # 8-byte Spill
	leaq	(,%rcx,8), %rax
	movq	%r15, %rcx
	subq	%rax, %rcx
	movq	16(%rsp), %rax          # 8-byte Reload
	addq	%rax, %rcx
	movq	%rcx, 152(%rsp)         # 8-byte Spill
	movq	%r14, %rcx
	shlq	$5, %rcx
	movq	%rcx, 120(%rsp)         # 8-byte Spill
	movq	%r14, %rcx
	shlq	$8, %rcx
	movq	%rcx, 112(%rsp)         # 8-byte Spill
	leaq	(%rax,%rdx,8), %rcx
	movq	%rcx, 160(%rsp)         # 8-byte Spill
	addq	$24, %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	shlq	$3, %rdx
	movq	%rdx, 88(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB0_10:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_12 Depth 2
                                        #       Child Loop BB0_28 Depth 3
                                        #         Child Loop BB0_34 Depth 4
                                        #       Child Loop BB0_15 Depth 3
                                        #         Child Loop BB0_16 Depth 4
                                        #         Child Loop BB0_22 Depth 4
	cmpq	$0, 72(%rsp)            # 8-byte Folded Reload
	js	.LBB0_24
# BB#11:                                # %polly.loop_header98.preheader
                                        #   in Loop: Header=BB0_10 Depth=1
	movq	48(%rsp), %r11          # 8-byte Reload
	shlq	$5, %r11
	movq	64(%rsp), %rcx          # 8-byte Reload
	subq	%r11, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovgq	%rax, %rcx
	movq	%rcx, 144(%rsp)         # 8-byte Spill
	leaq	-1(%rcx), %r10
	movq	56(%rsp), %rax          # 8-byte Reload
	movq	%rax, 80(%rsp)          # 8-byte Spill
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB0_12:                               # %polly.loop_header98
                                        #   Parent Loop BB0_10 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_28 Depth 3
                                        #         Child Loop BB0_34 Depth 4
                                        #       Child Loop BB0_15 Depth 3
                                        #         Child Loop BB0_16 Depth 4
                                        #         Child Loop BB0_22 Depth 4
	cmpq	$0, 144(%rsp)           # 8-byte Folded Reload
	js	.LBB0_27
# BB#13:                                # %polly.loop_header107.preheader
                                        #   in Loop: Header=BB0_12 Depth=2
	leaq	(,%r12,8), %rax
	movq	136(%rsp), %r8          # 8-byte Reload
	subq	%rax, %r8
	cmpq	$7, %r8
	movl	$7, %eax
	cmovgq	%rax, %r8
	movq	%r12, %rax
	shlq	$5, %rax
	orq	$31, %rax
	testq	%r8, %r8
	js	.LBB0_26
# BB#14:                                # %polly.loop_header107.us.preheader
                                        #   in Loop: Header=BB0_12 Depth=2
	decq	%r8
	cmpq	%r14, %rax
	setl	%al
	cmpq	$0, 8(%rsp)             # 8-byte Folded Reload
	sete	%dl
	orb	%al, %dl
	movq	40(%rsp), %r13          # 8-byte Reload
	movq	80(%rsp), %rax          # 8-byte Reload
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_15:                               # %polly.loop_header107.us
                                        #   Parent Loop BB0_10 Depth=1
                                        #     Parent Loop BB0_12 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_16 Depth 4
                                        #         Child Loop BB0_22 Depth 4
	leaq	(%rcx,%r11), %rbp
	movq	%rbp, %r9
	imulq	%r15, %r9
	movq	$-1, %rsi
	movq	%rax, %rbx
	.p2align	4, 0x90
.LBB0_16:                               # %polly.loop_header116.us
                                        #   Parent Loop BB0_10 Depth=1
                                        #     Parent Loop BB0_12 Depth=2
                                        #       Parent Loop BB0_15 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	addq	%rbp, -24(%rbx)
	addq	%rbp, -16(%rbx)
	addq	%rbp, -8(%rbx)
	addq	%rbp, (%rbx)
	incq	%rsi
	addq	$32, %rbx
	cmpq	%r8, %rsi
	jle	.LBB0_16
# BB#17:                                # %polly.cond.loopexit.us
                                        #   in Loop: Header=BB0_15 Depth=3
	testb	%dl, %dl
	jne	.LBB0_23
# BB#18:                                # %polly.loop_header132.us.preheader
                                        #   in Loop: Header=BB0_15 Depth=3
	cmpq	$0, 104(%rsp)           # 8-byte Folded Reload
	movl	$0, %edi
	je	.LBB0_20
# BB#19:                                # %polly.loop_header132.us.prol
                                        #   in Loop: Header=BB0_15 Depth=3
	addq	88(%rsp), %r9           # 8-byte Folded Reload
	movq	16(%rsp), %rsi          # 8-byte Reload
	addq	%rbp, (%rsi,%r9)
	movl	$1, %edi
.LBB0_20:                               # %polly.loop_header132.us.preheader.split
                                        #   in Loop: Header=BB0_15 Depth=3
	cmpq	$0, 96(%rsp)            # 8-byte Folded Reload
	je	.LBB0_23
# BB#21:                                # %polly.loop_header132.us.preheader.split.split
                                        #   in Loop: Header=BB0_15 Depth=3
	movq	8(%rsp), %rsi           # 8-byte Reload
	subq	%rdi, %rsi
	movq	160(%rsp), %rbx         # 8-byte Reload
	leaq	(%rbx,%rdi,8), %rbx
	movq	%r13, %rdi
	.p2align	4, 0x90
.LBB0_22:                               # %polly.loop_header132.us
                                        #   Parent Loop BB0_10 Depth=1
                                        #     Parent Loop BB0_12 Depth=2
                                        #       Parent Loop BB0_15 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	addq	%rbp, (%rbx,%rdi,8)
	addq	%rbp, 8(%rbx,%rdi,8)
	addq	$2, %rdi
	addq	$-2, %rsi
	jne	.LBB0_22
.LBB0_23:                               # %polly.merge.us
                                        #   in Loop: Header=BB0_15 Depth=3
	addq	%r15, %rax
	addq	%r14, %r13
	cmpq	%r10, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB0_15
	jmp	.LBB0_27
	.p2align	4, 0x90
.LBB0_26:                               # %polly.loop_header107.preheader.split
                                        #   in Loop: Header=BB0_12 Depth=2
	cmpq	%r14, %rax
	movq	40(%rsp), %rcx          # 8-byte Reload
	movl	$0, %edx
	jl	.LBB0_27
	.p2align	4, 0x90
.LBB0_28:                               # %polly.loop_header107
                                        #   Parent Loop BB0_10 Depth=1
                                        #     Parent Loop BB0_12 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_34 Depth 4
	cmpq	$0, 8(%rsp)             # 8-byte Folded Reload
	je	.LBB0_29
# BB#30:                                # %polly.loop_header132.preheader
                                        #   in Loop: Header=BB0_28 Depth=3
	leaq	(%rdx,%r11), %rbp
	cmpq	$0, 104(%rsp)           # 8-byte Folded Reload
	movl	$0, %esi
	je	.LBB0_32
# BB#31:                                # %polly.loop_header132.prol
                                        #   in Loop: Header=BB0_28 Depth=3
	movq	%rbp, %rax
	imulq	%r15, %rax
	addq	88(%rsp), %rax          # 8-byte Folded Reload
	movq	16(%rsp), %rsi          # 8-byte Reload
	addq	%rbp, (%rsi,%rax)
	movl	$1, %esi
.LBB0_32:                               # %polly.loop_header132.preheader.split
                                        #   in Loop: Header=BB0_28 Depth=3
	cmpq	$0, 96(%rsp)            # 8-byte Folded Reload
	je	.LBB0_29
# BB#33:                                # %polly.loop_header132.preheader.split.split
                                        #   in Loop: Header=BB0_28 Depth=3
	movq	8(%rsp), %rax           # 8-byte Reload
	subq	%rsi, %rax
	movq	152(%rsp), %rdi         # 8-byte Reload
	leaq	(%rdi,%rsi,8), %rsi
	movq	%rcx, %rdi
	.p2align	4, 0x90
.LBB0_34:                               # %polly.loop_header132
                                        #   Parent Loop BB0_10 Depth=1
                                        #     Parent Loop BB0_12 Depth=2
                                        #       Parent Loop BB0_28 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	addq	%rbp, (%rsi,%rdi,8)
	addq	%rbp, 8(%rsi,%rdi,8)
	addq	$2, %rdi
	addq	$-2, %rax
	jne	.LBB0_34
.LBB0_29:                               # %polly.merge
                                        #   in Loop: Header=BB0_28 Depth=3
	addq	%r14, %rcx
	cmpq	%r10, %rdx
	leaq	1(%rdx), %rdx
	jle	.LBB0_28
	.p2align	4, 0x90
.LBB0_27:                               # %polly.loop_exit109
                                        #   in Loop: Header=BB0_12 Depth=2
	addq	$256, 80(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	cmpq	72(%rsp), %r12          # 8-byte Folded Reload
	leaq	1(%r12), %r12
	jne	.LBB0_12
.LBB0_24:                               # %polly.loop_exit100
                                        #   in Loop: Header=BB0_10 Depth=1
	movq	40(%rsp), %rax          # 8-byte Reload
	addq	120(%rsp), %rax         # 8-byte Folded Reload
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movq	56(%rsp), %rax          # 8-byte Reload
	addq	112(%rsp), %rax         # 8-byte Folded Reload
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	48(%rsp), %rax          # 8-byte Reload
	cmpq	128(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	jne	.LBB0_10
.LBB0_25:                               # %polly.exiting
	.loc	1 39 17 discriminator 1 # MatrixMult.c:39:17
	movl	$16, %edi
	callq	malloc
.Ltmp23:
	#DEBUG_VALUE: init:m <- %RAX
	.loc	1 40 13                 # MatrixMult.c:40:13
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rcx, (%rax)
	.loc	1 41 14                 # MatrixMult.c:41:14
	movq	32(%rsp), %rcx          # 8-byte Reload
	movl	%ecx, 8(%rax)
	.loc	1 42 15                 # MatrixMult.c:42:15
	movq	24(%rsp), %rcx          # 8-byte Reload
	movl	%ecx, 12(%rax)
	.loc	1 44 5                  # MatrixMult.c:44:5
	addq	$168, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp24:
.Lfunc_end0:
	.size	init, .Lfunc_end0-init
	.cfi_endproc

	.globl	mat_mult
	.p2align	4, 0x90
	.type	mat_mult,@function
mat_mult:                               # @mat_mult
.Lfunc_begin1:
	.loc	1 47 0                  # MatrixMult.c:47:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 53 60 prologue_end    # MatrixMult.c:53:60
	pushq	%rbp
.Ltmp25:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp26:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp27:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp28:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp29:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp30:
	.cfi_def_cfa_offset 56
	subq	$440, %rsp              # imm = 0x1B8
.Ltmp31:
	.cfi_def_cfa_offset 496
.Ltmp32:
	.cfi_offset %rbx, -56
.Ltmp33:
	.cfi_offset %r12, -48
.Ltmp34:
	.cfi_offset %r13, -40
.Ltmp35:
	.cfi_offset %r14, -32
.Ltmp36:
	.cfi_offset %r15, -24
.Ltmp37:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: mat_mult:a <- %RDI
	#DEBUG_VALUE: mat_mult:b <- %RSI
	movslq	8(%rsi), %rbx
	.loc	1 50 21                 # MatrixMult.c:50:21
	movq	%rbx, 8(%rsp)           # 8-byte Spill
	movl	12(%rdi), %eax
.Ltmp38:
	#DEBUG_VALUE: mat_mult:height <- %EAX
	.loc	1 51 28                 # MatrixMult.c:51:28
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	(%rdi), %rbp
.Ltmp39:
	#DEBUG_VALUE: mat_mult:a_data <- %RBP
	.loc	1 52 28                 # MatrixMult.c:52:28
	movq	(%rsi), %r14
.Ltmp40:
	#DEBUG_VALUE: mat_mult:b_data <- %R14
	.loc	1 53 59                 # MatrixMult.c:53:59
	leaq	(,%rbx,8), %rdi
.Ltmp41:
	.loc	1 53 66 is_stmt 0       # MatrixMult.c:53:66
	movq	%rdi, 112(%rsp)         # 8-byte Spill
	movslq	%eax, %r15
.Ltmp42:
	#DEBUG_VALUE: mat_mult:height <- [%RSP+32]
	.loc	1 53 65                 # MatrixMult.c:53:65
	imulq	%r15, %rdi
	.loc	1 53 35 discriminator 1 # MatrixMult.c:53:35
	callq	malloc
.Ltmp43:
	movq	%rbx, %rdi
	movq	%rax, %r13
	.loc	1 49 20 is_stmt 1       # MatrixMult.c:49:20
	testq	%rdi, %rdi
	movl	%edi, %eax
.Ltmp44:
	#DEBUG_VALUE: mat_mult:i <- 0
	.loc	1 55 5 discriminator 1  # MatrixMult.c:55:5
	movq	%rax, 128(%rsp)         # 8-byte Spill
	jle	.LBB1_14
.Ltmp45:
# BB#1:                                 # %for.cond8.preheader.lr.ph
	#DEBUG_VALUE: mat_mult:b_data <- %R14
	#DEBUG_VALUE: mat_mult:a_data <- %RBP
	leaq	-1(%rdi), %rcx
	movq	%rcx, 184(%rsp)         # 8-byte Spill
	imulq	%rdi, %rcx
	addq	%r15, %rcx
	movq	%r14, 40(%rsp)          # 8-byte Spill
	leaq	(%r14,%rcx,8), %rax
	cmpq	%r13, %rax
	setbe	%al
	leaq	(%r13,%rcx,8), %rdx
	cmpq	%r14, %rdx
	setbe	%cl
	movq	%rdi, %rsi
	imulq	%rsi, %rsi
	movq	%rbp, 16(%rsp)          # 8-byte Spill
	leaq	(%rbp,%rsi,8), %rsi
	cmpq	%r13, %rsi
	setbe	%bl
	cmpq	%rbp, %rdx
	setbe	%dl
	orb	%bl, %dl
	movzbl	%dl, %edx
	cmpl	$1, %edx
	jne	.LBB1_4
.Ltmp46:
# BB#2:                                 # %for.cond8.preheader.lr.ph
	#DEBUG_VALUE: mat_mult:a_data <- %RBP
	#DEBUG_VALUE: mat_mult:b_data <- %R14
	movq	32(%rsp), %rdx          # 8-byte Reload
	cmpl	%edx, %edi
	jl	.LBB1_4
.Ltmp47:
# BB#3:                                 # %for.cond8.preheader.lr.ph
	#DEBUG_VALUE: mat_mult:b_data <- %R14
	#DEBUG_VALUE: mat_mult:a_data <- %RBP
	orb	%cl, %al
	je	.LBB1_4
.Ltmp48:
# BB#15:                                # %polly.start
	#DEBUG_VALUE: mat_mult:a_data <- %RBP
	#DEBUG_VALUE: mat_mult:b_data <- %R14
	movq	184(%rsp), %rax         # 8-byte Reload
	sarq	$5, %rax
	movq	%rax, 152(%rsp)         # 8-byte Spill
	js	.LBB1_14
.Ltmp49:
# BB#16:                                # %polly.loop_header.preheader
	#DEBUG_VALUE: mat_mult:b_data <- %R14
	#DEBUG_VALUE: mat_mult:a_data <- %RBP
	movq	%r15, 176(%rsp)         # 8-byte Spill
	leaq	-1(%r15), %rcx
	sarq	$5, %rcx
	movq	%rcx, 240(%rsp)         # 8-byte Spill
	movq	%r15, %rax
	shrq	$2, %rax
	movq	%rax, 144(%rsp)         # 8-byte Spill
	decq	%rax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	32(%rsp), %rax          # 8-byte Reload
	movl	%eax, %edx
	andl	$3, %edx
	movq	%rdx, 104(%rsp)         # 8-byte Spill
	movq	%rdi, %rax
	movq	%rdi, 8(%rsp)           # 8-byte Spill
	shlq	$8, %rax
	movq	%rax, 192(%rsp)         # 8-byte Spill
	leaq	(,%r15,8), %rax
	leaq	(,%rdx,8), %rdx
	movq	%rdx, 56(%rsp)          # 8-byte Spill
	subq	%rdx, %rax
	incq	%rcx
	movq	%rcx, 248(%rsp)         # 8-byte Spill
	incq	152(%rsp)               # 8-byte Folded Spill
	movq	%r13, %rcx
	addq	%rax, %rcx
	movq	%rcx, 48(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	%r13, 24(%rsp)          # 8-byte Spill
	movq	%r13, 232(%rsp)         # 8-byte Spill
.Ltmp50:
	.p2align	4, 0x90
.LBB1_17:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_19 Depth 2
                                        #       Child Loop BB1_42 Depth 3
                                        #       Child Loop BB1_22 Depth 3
	cmpq	$0, 240(%rsp)           # 8-byte Folded Reload
	js	.LBB1_24
# BB#18:                                # %polly.loop_header128.preheader
                                        #   in Loop: Header=BB1_17 Depth=1
	movq	72(%rsp), %rax          # 8-byte Reload
	shlq	$5, %rax
	movq	8(%rsp), %rcx           # 8-byte Reload
	subq	%rax, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovgq	%rax, %rcx
	movq	%rcx, 88(%rsp)          # 8-byte Spill
	leaq	-1(%rcx), %r14
	movq	24(%rsp), %rax          # 8-byte Reload
	movq	%rax, 96(%rsp)          # 8-byte Spill
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB1_19:                               # %polly.loop_header128
                                        #   Parent Loop BB1_17 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_42 Depth 3
                                        #       Child Loop BB1_22 Depth 3
	leaq	(,%r15,8), %rcx
	movq	%rcx, %rdx
	subq	144(%rsp), %rdx         # 8-byte Folded Reload
	cmpq	$-9, %rdx
	movq	$-8, %rax
	cmovleq	%rax, %rdx
	cmpq	$0, 88(%rsp)            # 8-byte Folded Reload
	js	.LBB1_41
# BB#20:                                # %polly.loop_header137.preheader
                                        #   in Loop: Header=BB1_19 Depth=2
	movq	%r15, %rax
	shlq	$5, %rax
	orq	$31, %rax
	cmpq	%rcx, 80(%rsp)          # 8-byte Folded Reload
	js	.LBB1_40
# BB#21:                                # %polly.loop_header137.us.preheader
                                        #   in Loop: Header=BB1_19 Depth=2
	movq	%rdx, %r13
	shlq	$5, %r13
	negq	%r13
	cmpq	176(%rsp), %rax         # 8-byte Folded Reload
	setl	%al
	cmpq	$0, 104(%rsp)           # 8-byte Folded Reload
	sete	%bl
	orb	%al, %bl
	movq	$-1, %r12
	movq	96(%rsp), %rbp          # 8-byte Reload
	movq	48(%rsp), %rax          # 8-byte Reload
	movq	%rax, (%rsp)            # 8-byte Spill
	.p2align	4, 0x90
.LBB1_22:                               # %polly.loop_header137.us
                                        #   Parent Loop BB1_17 Depth=1
                                        #     Parent Loop BB1_19 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movq	%r13, %rdx
	callq	memset
	testb	%bl, %bl
	jne	.LBB1_23
# BB#39:                                # %polly.loop_header162.preheader.us
                                        #   in Loop: Header=BB1_22 Depth=3
	xorl	%esi, %esi
	movq	(%rsp), %rdi            # 8-byte Reload
	movq	56(%rsp), %rdx          # 8-byte Reload
	callq	memset
.LBB1_23:                               # %polly.merge.us
                                        #   in Loop: Header=BB1_22 Depth=3
	incq	%r12
	movq	112(%rsp), %rax         # 8-byte Reload
	addq	%rax, (%rsp)            # 8-byte Folded Spill
	addq	%rax, %rbp
	cmpq	%r14, %r12
	jle	.LBB1_22
	jmp	.LBB1_41
	.p2align	4, 0x90
.LBB1_40:                               # %polly.loop_header137.preheader.split
                                        #   in Loop: Header=BB1_19 Depth=2
	movq	$-1, %rbx
	cmpq	176(%rsp), %rax         # 8-byte Folded Reload
	movq	48(%rsp), %rbp          # 8-byte Reload
	jl	.LBB1_41
	.p2align	4, 0x90
.LBB1_42:                               # %polly.loop_header137
                                        #   Parent Loop BB1_17 Depth=1
                                        #     Parent Loop BB1_19 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpq	$0, 104(%rsp)           # 8-byte Folded Reload
	je	.LBB1_43
# BB#44:                                # %polly.loop_header162.preheader
                                        #   in Loop: Header=BB1_42 Depth=3
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movq	56(%rsp), %rdx          # 8-byte Reload
	callq	memset
.LBB1_43:                               # %polly.merge
                                        #   in Loop: Header=BB1_42 Depth=3
	addq	112(%rsp), %rbp         # 8-byte Folded Reload
	incq	%rbx
	cmpq	%r14, %rbx
	jle	.LBB1_42
	.p2align	4, 0x90
.LBB1_41:                               # %polly.loop_exit139
                                        #   in Loop: Header=BB1_19 Depth=2
	incq	%r15
	addq	$256, 96(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	cmpq	248(%rsp), %r15         # 8-byte Folded Reload
	jne	.LBB1_19
.LBB1_24:                               # %polly.loop_exit130
                                        #   in Loop: Header=BB1_17 Depth=1
	movq	72(%rsp), %rax          # 8-byte Reload
	movq	%rax, %rcx
	incq	%rcx
	movq	%rcx, 72(%rsp)          # 8-byte Spill
	movq	192(%rsp), %rax         # 8-byte Reload
	addq	%rax, 48(%rsp)          # 8-byte Folded Spill
	addq	%rax, 24(%rsp)          # 8-byte Folded Spill
	cmpq	152(%rsp), %rcx         # 8-byte Folded Reload
	jne	.LBB1_17
# BB#25:                                # %polly.loop_header177.preheader
	shrq	$5, 184(%rsp)           # 8-byte Folded Spill
	movq	8(%rsp), %rdi           # 8-byte Reload
	movq	%rdi, %rax
	shrq	$2, %rax
	decq	%rax
	movq	%rax, 384(%rsp)         # 8-byte Spill
	movq	128(%rsp), %rax         # 8-byte Reload
	movl	%eax, %ecx
	andl	$3, %ecx
	movq	%rcx, 136(%rsp)         # 8-byte Spill
	movq	%rdi, %rdx
	subq	%rcx, %rdx
	movq	%rdx, 120(%rsp)         # 8-byte Spill
	leaq	-1(%rcx), %rsi
	movq	%rsi, 320(%rsp)         # 8-byte Spill
	andl	$1, %eax
	movq	%rax, 128(%rsp)         # 8-byte Spill
	movq	%rdx, %rax
	imulq	%rdi, %rax
	movq	%rax, 304(%rsp)         # 8-byte Spill
	leaq	1(%rdi), %rax
	subq	%rcx, %rax
	movq	%rax, 312(%rsp)         # 8-byte Spill
	leaq	(%rdi,%rdi), %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	%rdi, %rbp
	shlq	$5, %rbp
	leaq	(%rdi,%rdi,2), %rax
	movq	40(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rax,8), %rax
	movq	%rax, 344(%rsp)         # 8-byte Spill
	movq	16(%rsp), %rax          # 8-byte Reload
	leaq	24(%rax), %rax
	movq	%rax, 168(%rsp)         # 8-byte Spill
	movq	%rdi, %rax
	shlq	$4, %rax
	addq	%rcx, %rax
	movq	%rax, 336(%rsp)         # 8-byte Spill
	leaq	(%rcx,%rdi,8), %rax
	movq	%rax, 328(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 160(%rsp)         # 8-byte Spill
	movq	%rdx, 256(%rsp)         # 8-byte Spill
	movq	232(%rsp), %r13         # 8-byte Reload
	.p2align	4, 0x90
.LBB1_26:                               # %polly.loop_header177
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_28 Depth 2
                                        #       Child Loop BB1_29 Depth 3
                                        #         Child Loop BB1_31 Depth 4
                                        #           Child Loop BB1_57 Depth 5
                                        #             Child Loop BB1_65 Depth 6
                                        #           Child Loop BB1_34 Depth 5
                                        #             Child Loop BB1_35 Depth 6
                                        #             Child Loop BB1_50 Depth 6
	cmpq	$0, 240(%rsp)           # 8-byte Folded Reload
	js	.LBB1_46
# BB#27:                                # %polly.loop_header187.preheader
                                        #   in Loop: Header=BB1_26 Depth=1
	movq	160(%rsp), %rax         # 8-byte Reload
	shlq	$5, %rax
	movq	%rax, 408(%rsp)         # 8-byte Spill
	movq	%rdi, %rcx
	subq	%rax, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovgq	%rax, %rcx
	movq	%rcx, 392(%rsp)         # 8-byte Spill
	leaq	-1(%rcx), %rax
	movq	%rax, 424(%rsp)         # 8-byte Spill
	movq	328(%rsp), %rcx         # 8-byte Reload
	movq	336(%rsp), %rdx         # 8-byte Reload
	movq	344(%rsp), %r8          # 8-byte Reload
	movq	40(%rsp), %rbx          # 8-byte Reload
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_28:                               # %polly.loop_header187
                                        #   Parent Loop BB1_26 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_29 Depth 3
                                        #         Child Loop BB1_31 Depth 4
                                        #           Child Loop BB1_57 Depth 5
                                        #             Child Loop BB1_65 Depth 6
                                        #           Child Loop BB1_34 Depth 5
                                        #             Child Loop BB1_35 Depth 6
                                        #             Child Loop BB1_50 Depth 6
	movq	%rax, 352(%rsp)         # 8-byte Spill
	movq	%rbx, 208(%rsp)         # 8-byte Spill
	movq	%r8, 360(%rsp)          # 8-byte Spill
	movq	%rdx, 368(%rsp)         # 8-byte Spill
	movq	%rcx, 376(%rsp)         # 8-byte Spill
	movq	%rax, %rsi
	shlq	$5, %rsi
	movq	%rsi, 48(%rsp)          # 8-byte Spill
	movq	176(%rsp), %rax         # 8-byte Reload
	subq	%rsi, %rax
	decq	%rax
	cmpq	$31, %rax
	movl	$31, %esi
	cmovleq	%rax, %rsi
	movq	%rsi, 432(%rsp)         # 8-byte Spill
	leaq	-1(%rsi), %rax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movq	%rbx, 296(%rsp)         # 8-byte Spill
	movq	%rcx, 288(%rsp)         # 8-byte Spill
	movq	%rdx, 280(%rsp)         # 8-byte Spill
	movq	168(%rsp), %rax         # 8-byte Reload
	movq	%rax, 264(%rsp)         # 8-byte Spill
	movq	%r8, 272(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 200(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB1_29:                               # %polly.loop_header196
                                        #   Parent Loop BB1_26 Depth=1
                                        #     Parent Loop BB1_28 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_31 Depth 4
                                        #           Child Loop BB1_57 Depth 5
                                        #             Child Loop BB1_65 Depth 6
                                        #           Child Loop BB1_34 Depth 5
                                        #             Child Loop BB1_35 Depth 6
                                        #             Child Loop BB1_50 Depth 6
	cmpq	$0, 392(%rsp)           # 8-byte Folded Reload
	js	.LBB1_54
# BB#30:                                # %polly.loop_header204.preheader
                                        #   in Loop: Header=BB1_29 Depth=3
	cmpq	$0, 136(%rsp)           # 8-byte Folded Reload
	sete	%al
	movq	200(%rsp), %rdx         # 8-byte Reload
	leaq	(,%rdx,8), %rcx
	movq	384(%rsp), %rsi         # 8-byte Reload
	subq	%rcx, %rsi
	cmpq	$7, %rsi
	movl	$7, %ecx
	cmovgq	%rcx, %rsi
	movq	%rsi, 416(%rsp)         # 8-byte Spill
	shlq	$5, %rdx
	orq	$31, %rdx
	movq	%rdx, 400(%rsp)         # 8-byte Spill
	cmpq	%rdi, %rdx
	setl	%cl
	leaq	-1(%rsi), %r15
	orb	%al, %cl
	movb	%cl, 72(%rsp)           # 1-byte Spill
	movq	264(%rsp), %rax         # 8-byte Reload
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	256(%rsp), %rax         # 8-byte Reload
	movq	%rax, 224(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 216(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB1_31:                               # %polly.loop_header204
                                        #   Parent Loop BB1_26 Depth=1
                                        #     Parent Loop BB1_28 Depth=2
                                        #       Parent Loop BB1_29 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB1_57 Depth 5
                                        #             Child Loop BB1_65 Depth 6
                                        #           Child Loop BB1_34 Depth 5
                                        #             Child Loop BB1_35 Depth 6
                                        #             Child Loop BB1_50 Depth 6
	cmpq	$0, 432(%rsp)           # 8-byte Folded Reload
	js	.LBB1_53
# BB#32:                                # %polly.loop_header213.preheader
                                        #   in Loop: Header=BB1_31 Depth=4
	movq	408(%rsp), %rax         # 8-byte Reload
	movq	216(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	movq	%rcx, %rax
	imulq	112(%rsp), %rax         # 8-byte Folded Reload
	movq	%rax, 144(%rsp)         # 8-byte Spill
	movq	8(%rsp), %rax           # 8-byte Reload
	imulq	%rax, %rcx
	cmpq	$0, 416(%rsp)           # 8-byte Folded Reload
	js	.LBB1_55
# BB#33:                                # %polly.loop_header213.us.preheader
                                        #   in Loop: Header=BB1_31 Depth=4
	addq	120(%rsp), %rcx         # 8-byte Folded Reload
	movq	%rcx, 64(%rsp)          # 8-byte Spill
	movq	208(%rsp), %rax         # 8-byte Reload
	movq	%rax, 104(%rsp)         # 8-byte Spill
	movq	296(%rsp), %r9          # 8-byte Reload
	movq	288(%rsp), %rcx         # 8-byte Reload
	movq	280(%rsp), %r10         # 8-byte Reload
	movq	272(%rsp), %r11         # 8-byte Reload
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB1_34:                               # %polly.loop_header213.us
                                        #   Parent Loop BB1_26 Depth=1
                                        #     Parent Loop BB1_28 Depth=2
                                        #       Parent Loop BB1_29 Depth=3
                                        #         Parent Loop BB1_31 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB1_35 Depth 6
                                        #             Child Loop BB1_50 Depth 6
	movq	%rcx, 56(%rsp)          # 8-byte Spill
	movq	48(%rsp), %rax          # 8-byte Reload
	leaq	(%r12,%rax), %rdx
	movq	%rdx, 88(%rsp)          # 8-byte Spill
	movq	144(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rdx,8), %rax
	movq	%rax, (%rsp)            # 8-byte Spill
	movq	(%r13,%rax), %r8
	movq	$-1, %rbx
	movq	%r9, %rsi
	movq	%r10, %r14
	movq	80(%rsp), %rdi          # 8-byte Reload
	movq	%r11, %r13
	.p2align	4, 0x90
.LBB1_35:                               # %polly.loop_header223.us
                                        #   Parent Loop BB1_26 Depth=1
                                        #     Parent Loop BB1_28 Depth=2
                                        #       Parent Loop BB1_29 Depth=3
                                        #         Parent Loop BB1_31 Depth=4
                                        #           Parent Loop BB1_34 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	(%rsi), %rax
.Ltmp51:
	.loc	1 59 71                 # MatrixMult.c:59:71
	imulq	-24(%rdi), %rax
	.loc	1 59 51 is_stmt 0       # MatrixMult.c:59:51
	addq	%r8, %rax
	movq	(%rcx), %rdx
	.loc	1 59 71                 # MatrixMult.c:59:71
	imulq	-16(%rdi), %rdx
	.loc	1 59 51                 # MatrixMult.c:59:51
	addq	%rax, %rdx
	movq	(%r14), %rax
	.loc	1 59 71                 # MatrixMult.c:59:71
	imulq	-8(%rdi), %rax
	.loc	1 59 51                 # MatrixMult.c:59:51
	addq	%rdx, %rax
	movq	(%r13), %r8
	.loc	1 59 71                 # MatrixMult.c:59:71
	imulq	(%rdi), %r8
	.loc	1 59 51                 # MatrixMult.c:59:51
	addq	%rax, %r8
	incq	%rbx
	addq	%rbp, %r13
	addq	$32, %rdi
	addq	%rbp, %r14
	addq	%rbp, %rcx
	addq	%rbp, %rsi
	cmpq	%r15, %rbx
	jle	.LBB1_35
# BB#36:                                # %polly.cond243.loopexit.us
                                        #   in Loop: Header=BB1_34 Depth=5
	movq	232(%rsp), %r13         # 8-byte Reload
	movq	(%rsp), %rax            # 8-byte Reload
	movq	%r8, (%r13,%rax)
	cmpb	$0, 72(%rsp)            # 1-byte Folded Reload
	jne	.LBB1_52
# BB#37:                                # %polly.loop_header249.us.preheader
                                        #   in Loop: Header=BB1_34 Depth=5
	cmpq	$0, 128(%rsp)           # 8-byte Folded Reload
	jne	.LBB1_47
# BB#38:                                #   in Loop: Header=BB1_34 Depth=5
                                        # implicit-def: %RCX
	xorl	%eax, %eax
	jmp	.LBB1_48
	.p2align	4, 0x90
.LBB1_47:                               # %polly.loop_header249.us.prol
                                        #   in Loop: Header=BB1_34 Depth=5
	movq	88(%rsp), %rcx          # 8-byte Reload
	addq	304(%rsp), %rcx         # 8-byte Folded Reload
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	(%rax,%rcx,8), %rcx
	.loc	1 59 71                 # MatrixMult.c:59:71
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	64(%rsp), %rdx          # 8-byte Reload
	imulq	(%rax,%rdx,8), %rcx
	.loc	1 59 51                 # MatrixMult.c:59:51
	addq	%r8, %rcx
	movq	%rcx, %r8
	movl	$1, %eax
.LBB1_48:                               # %polly.loop_header249.us.preheader.split
                                        #   in Loop: Header=BB1_34 Depth=5
	cmpq	$0, 320(%rsp)           # 8-byte Folded Reload
	movq	24(%rsp), %r13          # 8-byte Reload
	je	.LBB1_51
# BB#49:                                # %polly.loop_header249.us.preheader.split.split
                                        #   in Loop: Header=BB1_34 Depth=5
	movq	136(%rsp), %rsi         # 8-byte Reload
	subq	%rax, %rsi
	movq	312(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	movq	8(%rsp), %rdx           # 8-byte Reload
	imulq	%rdx, %rcx
	movq	%r9, 88(%rsp)           # 8-byte Spill
	movq	104(%rsp), %r9          # 8-byte Reload
	leaq	(%r9,%rcx,8), %r14
	movq	224(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	movq	16(%rsp), %rdi          # 8-byte Reload
	leaq	(%rdi,%rcx,8), %rbx
	addq	120(%rsp), %rax         # 8-byte Folded Reload
	imulq	%rdx, %rax
	leaq	(%r9,%rax,8), %rdx
	movq	88(%rsp), %r9           # 8-byte Reload
	xorl	%eax, %eax
	movq	%r8, %rcx
	.p2align	4, 0x90
.LBB1_50:                               # %polly.loop_header249.us
                                        #   Parent Loop BB1_26 Depth=1
                                        #     Parent Loop BB1_28 Depth=2
                                        #       Parent Loop BB1_29 Depth=3
                                        #         Parent Loop BB1_31 Depth=4
                                        #           Parent Loop BB1_34 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	(%rdx,%rax,8), %rdi
	.loc	1 59 71                 # MatrixMult.c:59:71
	imulq	(%rbx), %rdi
	.loc	1 59 51                 # MatrixMult.c:59:51
	addq	%rcx, %rdi
	movq	(%r14,%rax,8), %rcx
	.loc	1 59 71                 # MatrixMult.c:59:71
	imulq	8(%rbx), %rcx
	.loc	1 59 51                 # MatrixMult.c:59:51
	addq	%rdi, %rcx
	addq	%r13, %rax
	addq	$16, %rbx
	addq	$-2, %rsi
	jne	.LBB1_50
.LBB1_51:                               # %polly.merge244.loopexit.us
                                        #   in Loop: Header=BB1_34 Depth=5
	movq	232(%rsp), %r13         # 8-byte Reload
	movq	(%rsp), %rax            # 8-byte Reload
	movq	%rcx, (%r13,%rax)
.LBB1_52:                               # %polly.merge244.us
                                        #   in Loop: Header=BB1_34 Depth=5
	addq	$8, %r11
	addq	$8, %r10
	movq	56(%rsp), %rcx          # 8-byte Reload
	addq	$8, %rcx
	addq	$8, %r9
	addq	$8, 104(%rsp)           # 8-byte Folded Spill
	cmpq	96(%rsp), %r12          # 8-byte Folded Reload
	leaq	1(%r12), %r12
	jle	.LBB1_34
	jmp	.LBB1_53
	.p2align	4, 0x90
.LBB1_55:                               # %polly.loop_header213.preheader.split
                                        #   in Loop: Header=BB1_31 Depth=4
	movq	%rcx, 64(%rsp)          # 8-byte Spill
	cmpq	%rax, 400(%rsp)         # 8-byte Folded Reload
	jl	.LBB1_53
# BB#56:                                # %polly.loop_header213.preheader392
                                        #   in Loop: Header=BB1_31 Depth=4
	movq	64(%rsp), %rax          # 8-byte Reload
	addq	120(%rsp), %rax         # 8-byte Folded Reload
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	208(%rsp), %r10         # 8-byte Reload
	xorl	%r11d, %r11d
	.p2align	4, 0x90
.LBB1_57:                               # %polly.loop_header213
                                        #   Parent Loop BB1_26 Depth=1
                                        #     Parent Loop BB1_28 Depth=2
                                        #       Parent Loop BB1_29 Depth=3
                                        #         Parent Loop BB1_31 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB1_65 Depth 6
	cmpq	$0, 136(%rsp)           # 8-byte Folded Reload
	je	.LBB1_61
# BB#58:                                # %polly.loop_header249.preheader
                                        #   in Loop: Header=BB1_57 Depth=5
	movq	48(%rsp), %rax          # 8-byte Reload
	leaq	(%r11,%rax), %rax
	cmpq	$0, 128(%rsp)           # 8-byte Folded Reload
	movq	144(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %r8
	movq	(%r13,%r8), %r9
	jne	.LBB1_62
# BB#59:                                #   in Loop: Header=BB1_57 Depth=5
                                        # implicit-def: %RDX
	xorl	%eax, %eax
	jmp	.LBB1_63
	.p2align	4, 0x90
.LBB1_62:                               # %polly.loop_header249.prol
                                        #   in Loop: Header=BB1_57 Depth=5
	addq	304(%rsp), %rax         # 8-byte Folded Reload
	movq	40(%rsp), %rcx          # 8-byte Reload
	movq	(%rcx,%rax,8), %rdx
	.loc	1 59 71                 # MatrixMult.c:59:71
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	64(%rsp), %rcx          # 8-byte Reload
	imulq	(%rax,%rcx,8), %rdx
	.loc	1 59 51                 # MatrixMult.c:59:51
	addq	%r9, %rdx
	movq	%rdx, %r9
	movl	$1, %eax
.LBB1_63:                               # %polly.loop_header249.preheader.split
                                        #   in Loop: Header=BB1_57 Depth=5
	movq	24(%rsp), %r12          # 8-byte Reload
	cmpq	$0, 320(%rsp)           # 8-byte Folded Reload
	je	.LBB1_60
# BB#64:                                # %polly.loop_header249.preheader.split.split
                                        #   in Loop: Header=BB1_57 Depth=5
	movq	136(%rsp), %rdi         # 8-byte Reload
	subq	%rax, %rdi
	movq	312(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	movq	8(%rsp), %rdx           # 8-byte Reload
	imulq	%rdx, %rcx
	leaq	(%r10,%rcx,8), %r14
	movq	224(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	movq	16(%rsp), %rsi          # 8-byte Reload
	leaq	(%rsi,%rcx,8), %rbx
	addq	120(%rsp), %rax         # 8-byte Folded Reload
	imulq	%rdx, %rax
	leaq	(%r10,%rax,8), %rax
	xorl	%ecx, %ecx
	movq	%r9, %rdx
	.p2align	4, 0x90
.LBB1_65:                               # %polly.loop_header249
                                        #   Parent Loop BB1_26 Depth=1
                                        #     Parent Loop BB1_28 Depth=2
                                        #       Parent Loop BB1_29 Depth=3
                                        #         Parent Loop BB1_31 Depth=4
                                        #           Parent Loop BB1_57 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	(%rax,%rcx,8), %rsi
	.loc	1 59 71                 # MatrixMult.c:59:71
	imulq	(%rbx), %rsi
	.loc	1 59 51                 # MatrixMult.c:59:51
	addq	%rdx, %rsi
	movq	(%r14,%rcx,8), %rdx
	.loc	1 59 71                 # MatrixMult.c:59:71
	imulq	8(%rbx), %rdx
	.loc	1 59 51                 # MatrixMult.c:59:51
	addq	%rsi, %rdx
	addq	%r12, %rcx
	addq	$16, %rbx
	addq	$-2, %rdi
	jne	.LBB1_65
.Ltmp52:
.LBB1_60:                               # %polly.merge244.loopexit
                                        #   in Loop: Header=BB1_57 Depth=5
	movq	%r12, 24(%rsp)          # 8-byte Spill
	movq	%rdx, (%r13,%r8)
.LBB1_61:                               # %polly.merge244
                                        #   in Loop: Header=BB1_57 Depth=5
	addq	$8, %r10
	cmpq	96(%rsp), %r11          # 8-byte Folded Reload
	leaq	1(%r11), %r11
	jle	.LBB1_57
	.p2align	4, 0x90
.LBB1_53:                               # %polly.loop_exit215
                                        #   in Loop: Header=BB1_31 Depth=4
	movq	8(%rsp), %rdi           # 8-byte Reload
	addq	%rdi, 224(%rsp)         # 8-byte Folded Spill
	movq	80(%rsp), %rax          # 8-byte Reload
	addq	112(%rsp), %rax         # 8-byte Folded Reload
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	216(%rsp), %rax         # 8-byte Reload
	cmpq	424(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 216(%rsp)         # 8-byte Spill
	jle	.LBB1_31
.LBB1_54:                               # %polly.loop_exit206
                                        #   in Loop: Header=BB1_29 Depth=3
	movq	192(%rsp), %rax         # 8-byte Reload
	addq	%rax, 272(%rsp)         # 8-byte Folded Spill
	addq	$256, 264(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x100
	addq	%rax, 280(%rsp)         # 8-byte Folded Spill
	addq	%rax, 288(%rsp)         # 8-byte Folded Spill
	addq	%rax, 296(%rsp)         # 8-byte Folded Spill
	movq	200(%rsp), %rax         # 8-byte Reload
	cmpq	184(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 200(%rsp)         # 8-byte Spill
	jne	.LBB1_29
# BB#45:                                # %polly.loop_exit198
                                        #   in Loop: Header=BB1_28 Depth=2
	movq	352(%rsp), %rax         # 8-byte Reload
	incq	%rax
	movq	208(%rsp), %rbx         # 8-byte Reload
	addq	$256, %rbx              # imm = 0x100
	movq	360(%rsp), %r8          # 8-byte Reload
	addq	$256, %r8               # imm = 0x100
	movq	368(%rsp), %rdx         # 8-byte Reload
	addq	$256, %rdx              # imm = 0x100
	movq	376(%rsp), %rcx         # 8-byte Reload
	addq	$256, %rcx              # imm = 0x100
	cmpq	248(%rsp), %rax         # 8-byte Folded Reload
	jne	.LBB1_28
.LBB1_46:                               # %polly.loop_exit189
                                        #   in Loop: Header=BB1_26 Depth=1
	movq	160(%rsp), %rax         # 8-byte Reload
	movq	%rax, %rcx
	incq	%rcx
	movq	%rcx, 160(%rsp)         # 8-byte Spill
	addq	%rbp, 256(%rsp)         # 8-byte Folded Spill
	movq	168(%rsp), %rax         # 8-byte Reload
	addq	192(%rsp), %rax         # 8-byte Folded Reload
	movq	%rax, 168(%rsp)         # 8-byte Spill
	cmpq	152(%rsp), %rcx         # 8-byte Folded Reload
	jne	.LBB1_26
	jmp	.LBB1_14
.LBB1_4:                                # %for.cond8.preheader.preheader
.Ltmp53:
	#DEBUG_VALUE: mat_mult:a_data <- %RBP
	#DEBUG_VALUE: mat_mult:b_data <- %R14
	.loc	1 56 9 is_stmt 1 discriminator 1 # MatrixMult.c:56:9
	movq	32(%rsp), %rax          # 8-byte Reload
	testl	%eax, %eax
	jle	.LBB1_14
.Ltmp54:
# BB#5:                                 # %for.cond8.preheader.us.preheader
	#DEBUG_VALUE: mat_mult:b_data <- %R14
	#DEBUG_VALUE: mat_mult:a_data <- %RBP
	.loc	1 58 13 discriminator 1 # MatrixMult.c:58:13
	movl	%edi, %r10d
	andl	$1, %r10d
.Ltmp55:
	.loc	1 57 19                 # MatrixMult.c:57:19
	leaq	(%rdi,%rdi), %r12
	xorl	%eax, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	xorl	%eax, %eax
.Ltmp56:
	.p2align	4, 0x90
.LBB1_6:                                # %for.cond8.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_7 Depth 2
                                        #       Child Loop BB1_11 Depth 3
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	%rax, %r11
	imulq	%rdi, %r11
	movq	40(%rsp), %r14          # 8-byte Reload
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB1_7:                                # %for.body11.us
                                        #   Parent Loop BB1_6 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_11 Depth 3
	.loc	1 57 25 is_stmt 0       # MatrixMult.c:57:25
	leaq	(%r15,%r11), %rdx
	testl	%r10d, %r10d
	.loc	1 57 29                 # MatrixMult.c:57:29
	movq	$0, (%r13,%rdx,8)
.Ltmp57:
	#DEBUG_VALUE: mat_mult:k <- 0
	movl	$0, %eax
	movl	$0, %ecx
	je	.LBB1_9
# BB#8:                                 # %for.body16.us.prol
                                        #   in Loop: Header=BB1_7 Depth=2
.Ltmp58:
	.loc	1 59 73 is_stmt 1       # MatrixMult.c:59:73
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	(%rax,%r15,8), %rax
	.loc	1 59 71 is_stmt 0       # MatrixMult.c:59:71
	movq	16(%rsp), %rcx          # 8-byte Reload
	imulq	(%rcx,%r11,8), %rax
	.loc	1 59 33                 # MatrixMult.c:59:33
	movq	%rax, (%r13,%rdx,8)
	movl	$1, %ecx
.LBB1_9:                                # %for.body11.us.split
                                        #   in Loop: Header=BB1_7 Depth=2
	cmpl	$1, %edi
	movq	%rdi, %r8
	je	.LBB1_12
# BB#10:                                # %for.body11.us.split.split
                                        #   in Loop: Header=BB1_7 Depth=2
	.loc	1 58 13 is_stmt 1 discriminator 1 # MatrixMult.c:58:13
	movl	%r8d, %ebx
	subl	%ecx, %ebx
	leaq	1(%rcx), %rsi
	imulq	%r8, %rsi
	leaq	(%r14,%rsi,8), %r9
	movq	(%rsp), %rsi            # 8-byte Reload
	leaq	(%rsi,%rcx), %rsi
	movq	16(%rsp), %rdi          # 8-byte Reload
	leaq	(%rdi,%rsi,8), %rbp
	imulq	%r8, %rcx
	leaq	(%r14,%rcx,8), %rsi
	.loc	1 59 35                 # MatrixMult.c:59:35
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_11:                               # %for.body16.us
                                        #   Parent Loop BB1_6 Depth=1
                                        #     Parent Loop BB1_7 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	.loc	1 59 73 is_stmt 0       # MatrixMult.c:59:73
	movq	(%rsi,%rcx,8), %rdi
	.loc	1 59 71                 # MatrixMult.c:59:71
	imulq	(%rbp), %rdi
	.loc	1 59 51                 # MatrixMult.c:59:51
	addq	%rax, %rdi
	.loc	1 59 33                 # MatrixMult.c:59:33
	movq	%rdi, (%r13,%rdx,8)
	.loc	1 59 73                 # MatrixMult.c:59:73
	movq	(%r9,%rcx,8), %rax
	.loc	1 59 71                 # MatrixMult.c:59:71
	imulq	8(%rbp), %rax
	.loc	1 59 51                 # MatrixMult.c:59:51
	addq	%rdi, %rax
	.loc	1 59 33                 # MatrixMult.c:59:33
	movq	%rax, (%r13,%rdx,8)
	.loc	1 58 13 is_stmt 1 discriminator 1 # MatrixMult.c:58:13
	addq	%r12, %rcx
	addq	$16, %rbp
	addl	$-2, %ebx
	jne	.LBB1_11
.Ltmp59:
.LBB1_12:                               # %for.inc35.us
                                        #   in Loop: Header=BB1_7 Depth=2
	.loc	1 56 9 discriminator 1  # MatrixMult.c:56:9
	incq	%r15
	addq	$8, %r14
	movq	32(%rsp), %rax          # 8-byte Reload
	cmpl	%eax, %r15d
	movq	%r8, %rdi
	jne	.LBB1_7
.Ltmp60:
# BB#13:                                # %for.inc38.loopexit.us
                                        #   in Loop: Header=BB1_6 Depth=1
	movq	56(%rsp), %rax          # 8-byte Reload
	.loc	1 55 5 discriminator 1  # MatrixMult.c:55:5
	incq	%rax
	addq	%rdi, (%rsp)            # 8-byte Folded Spill
	cmpl	%edi, %eax
	jne	.LBB1_6
.Ltmp61:
.LBB1_14:                               # %for.end40
	movq	%rdi, %rbx
	.loc	1 63 17 discriminator 1 # MatrixMult.c:63:17
	movl	$16, %edi
	callq	malloc
.Ltmp62:
	#DEBUG_VALUE: mat_mult:m <- %RAX
	.loc	1 64 14                 # MatrixMult.c:64:14
	movl	%ebx, 8(%rax)
	.loc	1 65 15                 # MatrixMult.c:65:15
	movq	32(%rsp), %rcx          # 8-byte Reload
	movl	%ecx, 12(%rax)
	.loc	1 66 13                 # MatrixMult.c:66:13
	movq	%r13, (%rax)
	.loc	1 67 5                  # MatrixMult.c:67:5
	addq	$440, %rsp              # imm = 0x1B8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp63:
.Lfunc_end1:
	.size	mat_mult, .Lfunc_end1-mat_mult
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin2:
	.loc	1 72 0                  # MatrixMult.c:72:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 75 12 prologue_end    # MatrixMult.c:75:12
	pushq	%r15
.Ltmp64:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp65:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp66:
	.cfi_def_cfa_offset 32
	subq	$64, %rsp
.Ltmp67:
	.cfi_def_cfa_offset 96
.Ltmp68:
	.cfi_offset %rbx, -32
.Ltmp69:
	.cfi_offset %r14, -24
.Ltmp70:
	.cfi_offset %r15, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
	movq	8(%rsi), %rdi
.Ltmp71:
	leaq	60(%rsp), %rdx
.Ltmp72:
	#DEBUG_VALUE: main:max <- [%RDX+0]
	.loc	1 75 5 is_stmt 0        # MatrixMult.c:75:5
	movl	$.L.str, %esi
.Ltmp73:
	xorl	%eax, %eax
	callq	__isoc99_sscanf
.Ltmp74:
	.loc	1 76 24 is_stmt 1       # MatrixMult.c:76:24
	movl	60(%rsp), %esi
.Ltmp75:
	#DEBUG_VALUE: main:max <- %ESI
	.loc	1 76 5 is_stmt 0        # MatrixMult.c:76:5
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp76:
	.loc	1 78 22 is_stmt 1       # MatrixMult.c:78:22
	movl	60(%rsp), %edi
.Ltmp77:
	#DEBUG_VALUE: main:max <- %EDI
	.loc	1 78 17 is_stmt 0 discriminator 1 # MatrixMult.c:78:17
	movl	%edi, %esi
	callq	init
.Ltmp78:
	movq	%rax, %r14
.Ltmp79:
	#DEBUG_VALUE: main:a <- %R14
	.loc	1 79 22 is_stmt 1       # MatrixMult.c:79:22
	movl	60(%rsp), %edi
.Ltmp80:
	#DEBUG_VALUE: main:max <- %EDI
	.loc	1 79 17 is_stmt 0 discriminator 1 # MatrixMult.c:79:17
	movl	%edi, %esi
	callq	init
.Ltmp81:
	movq	%rax, %rbx
.Ltmp82:
	#DEBUG_VALUE: main:b <- %RBX
	.loc	1 81 17 is_stmt 1 discriminator 1 # MatrixMult.c:81:17
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	mat_mult
	movq	%rax, %r15
.Ltmp83:
	#DEBUG_VALUE: main:c <- %R15
	.loc	1 83 48                 # MatrixMult.c:83:48
	movl	60(%rsp), %esi
.Ltmp84:
	#DEBUG_VALUE: main:max <- %ESI
	.loc	1 83 5 is_stmt 0        # MatrixMult.c:83:5
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	movl	%esi, %edx
	callq	printf
.Ltmp85:
	.loc	1 85 9 is_stmt 1        # MatrixMult.c:85:9
	movl	60(%rsp), %edx
.Ltmp86:
	#DEBUG_VALUE: main:max <- %EDX
	.loc	1 85 12 is_stmt 0       # MatrixMult.c:85:12
	leal	-1(%rdx), %esi
	.loc	1 85 47                 # MatrixMult.c:85:47
	movl	%edx, %eax
	imull	%eax, %eax
	.loc	1 85 28                 # MatrixMult.c:85:28
	cltq
	.loc	1 85 31                 # MatrixMult.c:85:31
	movq	(%r14), %rcx
	.loc	1 85 28                 # MatrixMult.c:85:28
	movq	-8(%rcx,%rax,8), %r8
	.loc	1 86 31 is_stmt 1       # MatrixMult.c:86:31
	movq	(%rbx), %rcx
	.loc	1 86 28 is_stmt 0       # MatrixMult.c:86:28
	movq	-8(%rcx,%rax,8), %rcx
	.loc	1 87 31 is_stmt 1       # MatrixMult.c:87:31
	movq	(%r15), %rdi
	.loc	1 87 28 is_stmt 0       # MatrixMult.c:87:28
	movq	-8(%rdi,%rax,8), %rax
	.loc	1 84 5 is_stmt 1        # MatrixMult.c:84:5
	movq	%rax, 48(%rsp)
	movl	%esi, 40(%rsp)
	movl	%edx, 32(%rsp)
	movl	%esi, 24(%rsp)
	movq	%rcx, 16(%rsp)
	movl	%esi, 8(%rsp)
	movl	%edx, (%rsp)
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	movl	%esi, %ecx
	movl	%esi, %r9d
	callq	printf
.Ltmp87:
	.loc	1 88 5                  # MatrixMult.c:88:5
	xorl	%eax, %eax
	addq	$64, %rsp
	popq	%rbx
.Ltmp88:
	popq	%r14
.Ltmp89:
	popq	%r15
.Ltmp90:
	retq
.Ltmp91:
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d"
	.size	.L.str, 3

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"N = %d\n"
	.size	.L.str.1, 8

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"Pass %d X %d matrix test case \n"
	.size	.L.str.2, 32

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"A[%dX%d+%d] = %lld, B[%dX%d+%d] =%lld, C[%dX%d+%d] =%lld \n"
	.size	.L.str.3, 59

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)" # string offset=0
.Linfo_string1:
	.asciz	"MatrixMult.c"          # string offset=165
.Linfo_string2:
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten1" # string offset=178
.Linfo_string3:
	.asciz	"long long int"         # string offset=246
.Linfo_string4:
	.asciz	"init"                  # string offset=260
.Linfo_string5:
	.asciz	"data"                  # string offset=265
.Linfo_string6:
	.asciz	"width"                 # string offset=270
.Linfo_string7:
	.asciz	"int"                   # string offset=276
.Linfo_string8:
	.asciz	"height"                # string offset=280
.Linfo_string9:
	.asciz	"Matrix"                # string offset=287
.Linfo_string10:
	.asciz	"mat_mult"              # string offset=294
.Linfo_string11:
	.asciz	"main"                  # string offset=303
.Linfo_string12:
	.asciz	"i"                     # string offset=308
.Linfo_string13:
	.asciz	"m"                     # string offset=310
.Linfo_string14:
	.asciz	"j"                     # string offset=312
.Linfo_string15:
	.asciz	"a"                     # string offset=314
.Linfo_string16:
	.asciz	"b"                     # string offset=316
.Linfo_string17:
	.asciz	"a_data"                # string offset=318
.Linfo_string18:
	.asciz	"b_data"                # string offset=325
.Linfo_string19:
	.asciz	"k"                     # string offset=332
.Linfo_string20:
	.asciz	"argc"                  # string offset=334
.Linfo_string21:
	.asciz	"args"                  # string offset=339
.Linfo_string22:
	.asciz	"char"                  # string offset=344
.Linfo_string23:
	.asciz	"max"                   # string offset=349
.Linfo_string24:
	.asciz	"c"                     # string offset=353
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp16-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	32                      # 32
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	84                      # super-register DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp16-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	24                      # 24
	.quad	0
	.quad	0
.Ldebug_loc2:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	80                      # super-register DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	32                      # 32
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Ltmp62-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp72-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	113                     # DW_OP_breg1
	.byte	0                       # 0
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp76-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	84                      # super-register DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp78-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	84                      # super-register DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	81                      # super-register DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp83-.Lfunc_begin0
	.quad	.Ltmp90-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
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
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	3                       # Abbreviation Code
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
	.byte	4                       # Abbreviation Code
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
	.byte	5                       # Abbreviation Code
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
	.byte	6                       # Abbreviation Code
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
	.byte	7                       # Abbreviation Code
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
	.byte	8                       # Abbreviation Code
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
	.byte	9                       # Abbreviation Code
	.byte	22                      # DW_TAG_typedef
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	10                      # Abbreviation Code
	.byte	19                      # DW_TAG_structure_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
	.byte	13                      # DW_TAG_member
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	56                      # DW_AT_data_member_location
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	526                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x207 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x5 DW_TAG_pointer_type
	.long	47                      # DW_AT_type
	.byte	3                       # Abbrev [3] 0x2f:0x7 DW_TAG_base_type
	.long	.Linfo_string3          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	4                       # Abbrev [4] 0x36:0x69 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string4          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	448                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	5                       # Abbrev [5] 0x4f:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	505                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x5e:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	505                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x6d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.long	505                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x79:0xf DW_TAG_variable
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	39                      # DW_AT_decl_line
	.long	448                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x88:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.long	505                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x93:0xb DW_TAG_variable
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	25                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	4                       # Abbrev [4] 0x9f:0xad DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	47                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	448                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	5                       # Abbrev [5] 0xb8:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	47                      # DW_AT_decl_line
	.long	448                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0xc7:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc4            # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	47                      # DW_AT_decl_line
	.long	448                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0xd6:0xf DW_TAG_variable
	.long	.Ldebug_loc5            # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	50                      # DW_AT_decl_line
	.long	505                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0xe5:0xf DW_TAG_variable
	.long	.Ldebug_loc6            # DW_AT_location
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	7                       # Abbrev [7] 0xf4:0xf DW_TAG_variable
	.long	.Ldebug_loc7            # DW_AT_location
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	52                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	6                       # Abbrev [6] 0x103:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	48                      # DW_AT_decl_line
	.long	505                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x10f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	48                      # DW_AT_decl_line
	.long	505                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x11b:0xf DW_TAG_variable
	.long	.Ldebug_loc8            # DW_AT_location
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	448                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x12a:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	48                      # DW_AT_decl_line
	.long	505                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x135:0xb DW_TAG_variable
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	49                      # DW_AT_decl_line
	.long	505                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x140:0xb DW_TAG_variable
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	53                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	4                       # Abbrev [4] 0x14c:0x74 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	71                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	505                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	5                       # Abbrev [5] 0x165:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc9            # DW_AT_location
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	71                      # DW_AT_decl_line
	.long	505                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x174:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	71                      # DW_AT_decl_line
	.long	512                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x183:0xf DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	74                      # DW_AT_decl_line
	.long	505                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x192:0xf DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	78                      # DW_AT_decl_line
	.long	448                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x1a1:0xf DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	79                      # DW_AT_decl_line
	.long	448                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x1b0:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	81                      # DW_AT_decl_line
	.long	448                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	2                       # Abbrev [2] 0x1c0:0x5 DW_TAG_pointer_type
	.long	453                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x1c5:0xb DW_TAG_typedef
	.long	464                     # DW_AT_type
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.byte	10                      # Abbrev [10] 0x1d0:0x29 DW_TAG_structure_type
	.byte	16                      # DW_AT_byte_size
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.byte	11                      # Abbrev [11] 0x1d4:0xc DW_TAG_member
	.long	.Linfo_string5          # DW_AT_name
	.long	42                      # DW_AT_type
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	11                      # Abbrev [11] 0x1e0:0xc DW_TAG_member
	.long	.Linfo_string6          # DW_AT_name
	.long	505                     # DW_AT_type
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	11                      # Abbrev [11] 0x1ec:0xc DW_TAG_member
	.long	.Linfo_string8          # DW_AT_name
	.long	505                     # DW_AT_type
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.byte	12                      # DW_AT_data_member_location
	.byte	0                       # End Of Children Mark
	.byte	3                       # Abbrev [3] 0x1f9:0x7 DW_TAG_base_type
	.long	.Linfo_string7          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	2                       # Abbrev [2] 0x200:0x5 DW_TAG_pointer_type
	.long	517                     # DW_AT_type
	.byte	2                       # Abbrev [2] 0x205:0x5 DW_TAG_pointer_type
	.long	522                     # DW_AT_type
	.byte	3                       # Abbrev [3] 0x20a:0x7 DW_TAG_base_type
	.long	.Linfo_string22         # DW_AT_name
	.byte	6                       # DW_AT_encoding
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
	.long	530                     # Compilation Unit Length
	.long	159                     # DIE offset
	.asciz	"mat_mult"              # External Name
	.long	54                      # DIE offset
	.asciz	"init"                  # External Name
	.long	332                     # DIE offset
	.asciz	"main"                  # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	530                     # Compilation Unit Length
	.long	453                     # DIE offset
	.asciz	"Matrix"                # External Name
	.long	47                      # DIE offset
	.asciz	"long long int"         # External Name
	.long	505                     # DIE offset
	.asciz	"int"                   # External Name
	.long	522                     # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
