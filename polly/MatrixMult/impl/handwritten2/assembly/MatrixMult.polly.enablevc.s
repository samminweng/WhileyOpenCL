	.text
	.file	"MatrixMult.polly.enablevc.ll"
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
	movl	%esi, %ebx
.Ltmp13:
	#DEBUG_VALUE: init:height <- %EBX
	movq	%rbx, (%rsp)            # 8-byte Spill
.Ltmp14:
	.loc	1 16 48 prologue_end    # MatrixMult.c:16:48
	movq	%rdi, 24(%rsp)          # 8-byte Spill
	movl	%ebx, %eax
	imull	%edi, %eax
.Ltmp15:
	#DEBUG_VALUE: init:width <- [%RSP+24]
	.loc	1 16 42 is_stmt 0       # MatrixMult.c:16:42
	movslq	%eax, %rdi
	.loc	1 16 54                 # MatrixMult.c:16:54
	shlq	$3, %rdi
	.loc	1 16 35 discriminator 1 # MatrixMult.c:16:35
	callq	malloc
.Ltmp16:
	movq	%rax, 8(%rsp)           # 8-byte Spill
.Ltmp17:
	#DEBUG_VALUE: init:i <- 0
	.loc	1 18 5 is_stmt 1 discriminator 1 # MatrixMult.c:18:5
	testl	%ebx, %ebx
.Ltmp18:
	#DEBUG_VALUE: init:height <- [%RSP+0]
	jle	.LBB0_8
.Ltmp19:
# BB#1:                                 # %entry
	#DEBUG_VALUE: init:height <- [%RSP+0]
	movq	24(%rsp), %rax          # 8-byte Reload
	testl	%eax, %eax
	jle	.LBB0_8
.Ltmp20:
# BB#2:                                 # %for.cond3.preheader.us.preheader
	#DEBUG_VALUE: init:height <- [%RSP+0]
	movq	24(%rsp), %rax          # 8-byte Reload
	movslq	%eax, %rcx
.Ltmp21:
	.loc	1 20 19                 # MatrixMult.c:20:19
	movq	%rcx, 16(%rsp)          # 8-byte Spill
	leaq	(,%rcx,8), %r15
	leal	-1(%rax), %eax
	leaq	8(,%rax,8), %r12
	movq	(%rsp), %rax            # 8-byte Reload
	leal	-1(%rax), %r14d
	xorl	%ebx, %ebx
	testb	$7, %al
	je	.LBB0_5
.Ltmp22:
# BB#3:                                 # %for.cond3.preheader.us.prol.preheader
	#DEBUG_VALUE: init:height <- [%RSP+0]
	movq	(%rsp), %r13            # 8-byte Reload
	andl	$7, %r13d
	xorl	%ebx, %ebx
	movq	8(%rsp), %rbp           # 8-byte Reload
.Ltmp23:
	.p2align	4, 0x90
.LBB0_4:                                # %for.cond3.preheader.us.prol
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 20 29 is_stmt 0       # MatrixMult.c:20:29
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movq	%r12, %rdx
	callq	memset
.Ltmp24:
	.loc	1 18 5 is_stmt 1 discriminator 1 # MatrixMult.c:18:5
	incq	%rbx
	addq	%r15, %rbp
	cmpl	%ebx, %r13d
	jne	.LBB0_4
.LBB0_5:                                # %for.cond3.preheader.us.preheader.split
.Ltmp25:
	.loc	1 20 19                 # MatrixMult.c:20:19
	cmpl	$7, %r14d
	movq	16(%rsp), %rcx          # 8-byte Reload
	jb	.LBB0_8
# BB#6:                                 # %for.cond3.preheader.us.preheader.split.split
	movq	(%rsp), %rax            # 8-byte Reload
	movl	%eax, %r14d
	subl	%ebx, %r14d
	imulq	%rcx, %rbx
	movq	8(%rsp), %rax           # 8-byte Reload
	leaq	(%rax,%rbx,8), %r13
	shlq	$6, %rcx
	movq	%rcx, %rbx
	.p2align	4, 0x90
.LBB0_7:                                # %for.cond3.preheader.us
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 20 29 is_stmt 0       # MatrixMult.c:20:29
	xorl	%esi, %esi
	movq	%r13, %rdi
	movq	%r12, %rdx
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
.Ltmp26:
	.loc	1 18 5 is_stmt 1 discriminator 1 # MatrixMult.c:18:5
	addq	%rbx, %r13
	addl	$-8, %r14d
	jne	.LBB0_7
.Ltmp27:
.LBB0_8:                                # %polly.start
	movq	(%rsp), %rax            # 8-byte Reload
	cltq
	movq	%rax, 104(%rsp)         # 8-byte Spill
	decq	%rax
	sarq	$5, %rax
	movq	%rax, 128(%rsp)         # 8-byte Spill
	js	.LBB0_27
# BB#9:                                 # %polly.loop_preheader
	movq	24(%rsp), %rax          # 8-byte Reload
	movslq	%eax, %r11
	leaq	(,%r11,8), %rsi
	leaq	-1(%r11), %rcx
	sarq	$5, %rcx
	movq	%rcx, 64(%rsp)          # 8-byte Spill
	movq	%r11, %rcx
	shrq	$2, %rcx
	decq	%rcx
	movq	%rcx, 136(%rsp)         # 8-byte Spill
	movl	%eax, %eax
	movl	%eax, %ecx
	andl	$3, %ecx
	movq	%rcx, 16(%rsp)          # 8-byte Spill
	movq	%r11, %rdx
	subq	%rcx, %rdx
	leaq	-1(%rcx), %rdi
	movq	%rdi, 88(%rsp)          # 8-byte Spill
	andl	$1, %eax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	leaq	(,%rcx,8), %rax
	movq	%rsi, %rcx
	subq	%rax, %rcx
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	%rax, %rcx
	movq	%rcx, 152(%rsp)         # 8-byte Spill
	movq	%r11, %rcx
	shlq	$5, %rcx
	movq	%rcx, 120(%rsp)         # 8-byte Spill
	movq	%r11, %rcx
	shlq	$8, %rcx
	movq	%rcx, 112(%rsp)         # 8-byte Spill
	leaq	(%rax,%rdx,8), %rcx
	movq	%rcx, 160(%rsp)         # 8-byte Spill
	addq	$24, %rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	shlq	$3, %rdx
	movq	%rdx, 80(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB0_10:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_12 Depth 2
                                        #       Child Loop BB0_28 Depth 3
                                        #         Child Loop BB0_34 Depth 4
                                        #       Child Loop BB0_15 Depth 3
                                        #         Child Loop BB0_16 Depth 4
                                        #         Child Loop BB0_22 Depth 4
	cmpq	$0, 64(%rsp)            # 8-byte Folded Reload
	js	.LBB0_26
# BB#11:                                # %polly.loop_header97.preheader
                                        #   in Loop: Header=BB0_10 Depth=1
	movq	40(%rsp), %r14          # 8-byte Reload
	shlq	$5, %r14
	movq	104(%rsp), %rcx         # 8-byte Reload
	subq	%r14, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovgq	%rax, %rcx
	movq	%rcx, 144(%rsp)         # 8-byte Spill
	leaq	-1(%rcx), %r13
	movq	48(%rsp), %rax          # 8-byte Reload
	movq	%rax, 72(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB0_12:                               # %polly.loop_header97
                                        #   Parent Loop BB0_10 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_28 Depth 3
                                        #         Child Loop BB0_34 Depth 4
                                        #       Child Loop BB0_15 Depth 3
                                        #         Child Loop BB0_16 Depth 4
                                        #         Child Loop BB0_22 Depth 4
	cmpq	$0, 144(%rsp)           # 8-byte Folded Reload
	js	.LBB0_25
# BB#13:                                # %polly.loop_header106.preheader
                                        #   in Loop: Header=BB0_12 Depth=2
	movq	56(%rsp), %rcx          # 8-byte Reload
	leaq	(,%rcx,8), %rax
	movq	136(%rsp), %r9          # 8-byte Reload
	subq	%rax, %r9
	cmpq	$7, %r9
	movl	$7, %eax
	cmovgq	%rax, %r9
	movq	%rcx, %rax
	shlq	$5, %rax
	orq	$31, %rax
	testq	%r9, %r9
	js	.LBB0_24
# BB#14:                                # %polly.loop_header106.us.preheader
                                        #   in Loop: Header=BB0_12 Depth=2
	decq	%r9
	cmpq	%r11, %rax
	setl	%al
	cmpq	$0, 16(%rsp)            # 8-byte Folded Reload
	sete	%r12b
	orb	%al, %r12b
	movq	32(%rsp), %r8           # 8-byte Reload
	movq	72(%rsp), %rdi          # 8-byte Reload
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB0_15:                               # %polly.loop_header106.us
                                        #   Parent Loop BB0_10 Depth=1
                                        #     Parent Loop BB0_12 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_16 Depth 4
                                        #         Child Loop BB0_22 Depth 4
	leaq	(%r15,%r14), %rbp
	movq	%rbp, %rax
	imulq	%rsi, %rax
	movq	$-1, %r10
	movq	%rdi, %rbx
	.p2align	4, 0x90
.LBB0_16:                               # %polly.loop_header115.us
                                        #   Parent Loop BB0_10 Depth=1
                                        #     Parent Loop BB0_12 Depth=2
                                        #       Parent Loop BB0_15 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	addq	%rbp, -24(%rbx)
	addq	%rbp, -16(%rbx)
	addq	%rbp, -8(%rbx)
	addq	%rbp, (%rbx)
	incq	%r10
	addq	$32, %rbx
	cmpq	%r9, %r10
	jle	.LBB0_16
# BB#17:                                # %polly.cond.loopexit.us
                                        #   in Loop: Header=BB0_15 Depth=3
	testb	%r12b, %r12b
	jne	.LBB0_23
# BB#18:                                # %polly.loop_header131.us.preheader
                                        #   in Loop: Header=BB0_15 Depth=3
	cmpq	$0, 96(%rsp)            # 8-byte Folded Reload
	movl	$0, %ecx
	je	.LBB0_20
# BB#19:                                # %polly.loop_header131.us.prol
                                        #   in Loop: Header=BB0_15 Depth=3
	addq	80(%rsp), %rax          # 8-byte Folded Reload
	movq	8(%rsp), %rcx           # 8-byte Reload
	addq	%rbp, (%rcx,%rax)
	movl	$1, %ecx
.LBB0_20:                               # %polly.loop_header131.us.preheader.split
                                        #   in Loop: Header=BB0_15 Depth=3
	cmpq	$0, 88(%rsp)            # 8-byte Folded Reload
	je	.LBB0_23
# BB#21:                                # %polly.loop_header131.us.preheader.split.split
                                        #   in Loop: Header=BB0_15 Depth=3
	movq	16(%rsp), %rax          # 8-byte Reload
	subq	%rcx, %rax
	movq	160(%rsp), %rdx         # 8-byte Reload
	leaq	(%rdx,%rcx,8), %rbx
	movq	%r8, %rcx
	.p2align	4, 0x90
.LBB0_22:                               # %polly.loop_header131.us
                                        #   Parent Loop BB0_10 Depth=1
                                        #     Parent Loop BB0_12 Depth=2
                                        #       Parent Loop BB0_15 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	addq	%rbp, (%rbx,%rcx,8)
	addq	%rbp, 8(%rbx,%rcx,8)
	addq	$2, %rcx
	addq	$-2, %rax
	jne	.LBB0_22
.LBB0_23:                               # %polly.merge.us
                                        #   in Loop: Header=BB0_15 Depth=3
	addq	%rsi, %rdi
	addq	%r11, %r8
	cmpq	%r13, %r15
	leaq	1(%r15), %r15
	jle	.LBB0_15
	jmp	.LBB0_25
	.p2align	4, 0x90
.LBB0_24:                               # %polly.loop_header106.preheader.split
                                        #   in Loop: Header=BB0_12 Depth=2
	cmpq	%r11, %rax
	movq	32(%rsp), %rdx          # 8-byte Reload
	movl	$0, %ebx
	jl	.LBB0_25
	.p2align	4, 0x90
.LBB0_28:                               # %polly.loop_header106
                                        #   Parent Loop BB0_10 Depth=1
                                        #     Parent Loop BB0_12 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_34 Depth 4
	cmpq	$0, 16(%rsp)            # 8-byte Folded Reload
	je	.LBB0_29
# BB#30:                                # %polly.loop_header131.preheader
                                        #   in Loop: Header=BB0_28 Depth=3
	leaq	(%rbx,%r14), %rax
	cmpq	$0, 96(%rsp)            # 8-byte Folded Reload
	movl	$0, %ecx
	je	.LBB0_32
# BB#31:                                # %polly.loop_header131.prol
                                        #   in Loop: Header=BB0_28 Depth=3
	movq	%rax, %rcx
	imulq	%rsi, %rcx
	addq	80(%rsp), %rcx          # 8-byte Folded Reload
	movq	8(%rsp), %rdi           # 8-byte Reload
	addq	%rax, (%rdi,%rcx)
	movl	$1, %ecx
.LBB0_32:                               # %polly.loop_header131.preheader.split
                                        #   in Loop: Header=BB0_28 Depth=3
	cmpq	$0, 88(%rsp)            # 8-byte Folded Reload
	je	.LBB0_29
# BB#33:                                # %polly.loop_header131.preheader.split.split
                                        #   in Loop: Header=BB0_28 Depth=3
	movq	16(%rsp), %rdi          # 8-byte Reload
	subq	%rcx, %rdi
	movq	152(%rsp), %rbp         # 8-byte Reload
	leaq	(%rbp,%rcx,8), %rcx
	movq	%rdx, %rbp
	.p2align	4, 0x90
.LBB0_34:                               # %polly.loop_header131
                                        #   Parent Loop BB0_10 Depth=1
                                        #     Parent Loop BB0_12 Depth=2
                                        #       Parent Loop BB0_28 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	addq	%rax, (%rcx,%rbp,8)
	addq	%rax, 8(%rcx,%rbp,8)
	addq	$2, %rbp
	addq	$-2, %rdi
	jne	.LBB0_34
.LBB0_29:                               # %polly.merge
                                        #   in Loop: Header=BB0_28 Depth=3
	addq	%r11, %rdx
	cmpq	%r13, %rbx
	leaq	1(%rbx), %rbx
	jle	.LBB0_28
	.p2align	4, 0x90
.LBB0_25:                               # %polly.loop_exit108
                                        #   in Loop: Header=BB0_12 Depth=2
	addq	$256, 72(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	movq	56(%rsp), %rax          # 8-byte Reload
	cmpq	64(%rsp), %rax          # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	jne	.LBB0_12
.LBB0_26:                               # %polly.loop_exit99
                                        #   in Loop: Header=BB0_10 Depth=1
	movq	32(%rsp), %rax          # 8-byte Reload
	addq	120(%rsp), %rax         # 8-byte Folded Reload
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	48(%rsp), %rax          # 8-byte Reload
	addq	112(%rsp), %rax         # 8-byte Folded Reload
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	40(%rsp), %rax          # 8-byte Reload
	cmpq	128(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	jne	.LBB0_10
.LBB0_27:                               # %polly.exiting
	.loc	1 30 17 discriminator 1 # MatrixMult.c:30:17
	movl	$16, %edi
	callq	malloc
.Ltmp28:
	#DEBUG_VALUE: init:m <- %RAX
	.loc	1 31 13                 # MatrixMult.c:31:13
	movq	8(%rsp), %rcx           # 8-byte Reload
	movq	%rcx, (%rax)
	.loc	1 32 14                 # MatrixMult.c:32:14
	movq	24(%rsp), %rcx          # 8-byte Reload
	movl	%ecx, 8(%rax)
	.loc	1 33 15                 # MatrixMult.c:33:15
	movq	(%rsp), %rcx            # 8-byte Reload
	movl	%ecx, 12(%rax)
	.loc	1 35 5                  # MatrixMult.c:35:5
	addq	$168, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp29:
.Lfunc_end0:
	.size	init, .Lfunc_end0-init
	.cfi_endproc

	.globl	matmult
	.p2align	4, 0x90
	.type	matmult,@function
matmult:                                # @matmult
.Lfunc_begin1:
	.loc	1 38 0                  # MatrixMult.c:38:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 40 20 prologue_end    # MatrixMult.c:40:20
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
	subq	$344, %rsp              # imm = 0x158
.Ltmp36:
	.cfi_def_cfa_offset 400
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
	#DEBUG_VALUE: matmult:a <- %RDI
	#DEBUG_VALUE: matmult:b <- %RSI
	movl	8(%rsi), %ebx
.Ltmp43:
	.loc	1 51 2 discriminator 1  # MatrixMult.c:51:2
	movq	%rbx, 8(%rsp)           # 8-byte Spill
	movslq	12(%rdi), %rbp
.Ltmp44:
	#DEBUG_VALUE: matmult:width <- %EBX
	.loc	1 42 28                 # MatrixMult.c:42:28
	movq	%rbp, 40(%rsp)          # 8-byte Spill
	movq	(%rdi), %rax
.Ltmp45:
	#DEBUG_VALUE: matmult:a_data <- [%RSP+112]
	.loc	1 43 28                 # MatrixMult.c:43:28
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movq	(%rsi), %rax
.Ltmp46:
	#DEBUG_VALUE: matmult:b_data <- [%RSP+16]
	.loc	1 46 45                 # MatrixMult.c:46:45
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movl	%ebp, %eax
	imull	%ebx, %eax
	.loc	1 46 39 is_stmt 0       # MatrixMult.c:46:39
	movslq	%eax, %r15
	.loc	1 46 51                 # MatrixMult.c:46:51
	shlq	$3, %r15
	.loc	1 46 32 discriminator 1 # MatrixMult.c:46:32
	movq	%r15, %rdi
.Ltmp47:
	callq	malloc
.Ltmp48:
	movq	%rax, 296(%rsp)         # 8-byte Spill
	.loc	1 48 22 is_stmt 1 discriminator 1 # MatrixMult.c:48:22
	movq	%r15, %rdi
	callq	malloc
	movq	%rax, 64(%rsp)          # 8-byte Spill
	.loc	1 41 21                 # MatrixMult.c:41:21
	testq	%rbp, %rbp
.Ltmp49:
	#DEBUG_VALUE: matmult:j <- 0
	.loc	1 51 2 discriminator 1  # MatrixMult.c:51:2
	movslq	%ebx, %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
.Ltmp50:
	#DEBUG_VALUE: matmult:width <- [%RSP+8]
	jle	.LBB1_10
.Ltmp51:
# BB#1:                                 # %for.cond11.preheader.lr.ph
	#DEBUG_VALUE: matmult:width <- [%RSP+8]
	movq	8(%rsp), %rax           # 8-byte Reload
	movq	40(%rsp), %rcx          # 8-byte Reload
	cmpl	%eax, %ecx
	jne	.LBB1_2
.Ltmp52:
# BB#97:                                # %polly.start314
	#DEBUG_VALUE: matmult:width <- [%RSP+8]
	leaq	-1(%rcx), %rax
	sarq	$5, %rax
	movq	%rax, 328(%rsp)         # 8-byte Spill
	js	.LBB1_10
.Ltmp53:
# BB#98:                                # %polly.loop_preheader319
	#DEBUG_VALUE: matmult:width <- [%RSP+8]
	movq	40(%rsp), %rcx          # 8-byte Reload
	leaq	(,%rcx,8), %r13
	movq	32(%rsp), %rdx          # 8-byte Reload
	leaq	-1(%rdx), %rax
	sarq	$5, %rax
	movq	%rax, 248(%rsp)         # 8-byte Spill
	movq	%rdx, %rax
	shrq	$2, %rax
	decq	%rax
	movq	%rax, 336(%rsp)         # 8-byte Spill
	movq	8(%rsp), %rax           # 8-byte Reload
	movl	%eax, %esi
	andl	$3, %esi
	movq	%rsi, 24(%rsp)          # 8-byte Spill
	movq	%rdx, %rdi
	subq	%rsi, %rdi
	movq	%rdi, 208(%rsp)         # 8-byte Spill
	leaq	-1(%rsi), %rbp
	movq	%rbp, 144(%rsp)         # 8-byte Spill
	andl	$1, %eax
	movq	%rax, 104(%rsp)         # 8-byte Spill
	movq	%rdi, %rax
	imulq	%rdx, %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	leaq	(,%rdi,8), %rax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	shlq	$8, %rcx
	movq	%rcx, 320(%rsp)         # 8-byte Spill
	leaq	1(%rdx), %rax
	subq	%rsi, %rax
	movq	%rax, 200(%rsp)         # 8-byte Spill
	leaq	(%rdx,%rdx,2), %rax
	movq	16(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rax,8), %rax
	movq	%rax, 280(%rsp)         # 8-byte Spill
	movq	%rdx, %rax
	shlq	$8, %rax
	movq	%rax, 288(%rsp)         # 8-byte Spill
	movq	%rdx, %r10
	shlq	$5, %r10
	movq	%rdx, %rax
	shlq	$4, %rax
	addq	%rcx, %rax
	movq	%rax, 240(%rsp)         # 8-byte Spill
	leaq	(%rdx,%rdx), %rax
	movq	%rax, 128(%rsp)         # 8-byte Spill
	movq	64(%rsp), %rax          # 8-byte Reload
	leaq	24(%rax), %rsi
	movq	%rsi, 232(%rsp)         # 8-byte Spill
	leaq	(%rcx,%rdx,8), %rdx
	movq	%rdx, 256(%rsp)         # 8-byte Spill
	xorl	%edx, %edx
	movq	%rdx, 264(%rsp)         # 8-byte Spill
	movq	%rcx, 168(%rsp)         # 8-byte Spill
	movq	%rax, 272(%rsp)         # 8-byte Spill
.Ltmp54:
	.p2align	4, 0x90
.LBB1_83:                               # %polly.loop_header318
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_85 Depth 2
                                        #       Child Loop BB1_102 Depth 3
                                        #         Child Loop BB1_108 Depth 4
                                        #       Child Loop BB1_88 Depth 3
                                        #         Child Loop BB1_89 Depth 4
                                        #         Child Loop BB1_95 Depth 4
	cmpq	$0, 248(%rsp)           # 8-byte Folded Reload
	js	.LBB1_101
# BB#84:                                # %polly.loop_header328.preheader
                                        #   in Loop: Header=BB1_83 Depth=1
	movq	264(%rsp), %rax         # 8-byte Reload
	shlq	$5, %rax
	movq	%rax, 216(%rsp)         # 8-byte Spill
	movq	40(%rsp), %rcx          # 8-byte Reload
	subq	%rax, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovgq	%rax, %rcx
	movq	%rcx, 304(%rsp)         # 8-byte Spill
	leaq	-1(%rcx), %rax
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	168(%rsp), %rax         # 8-byte Reload
	movq	%rax, 192(%rsp)         # 8-byte Spill
	movq	256(%rsp), %rax         # 8-byte Reload
	movq	%rax, 184(%rsp)         # 8-byte Spill
	movq	240(%rsp), %rax         # 8-byte Reload
	movq	%rax, 176(%rsp)         # 8-byte Spill
	movq	280(%rsp), %rax         # 8-byte Reload
	movq	%rax, 88(%rsp)          # 8-byte Spill
	movq	232(%rsp), %rax         # 8-byte Reload
	movq	%rax, 312(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB1_85:                               # %polly.loop_header328
                                        #   Parent Loop BB1_83 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_102 Depth 3
                                        #         Child Loop BB1_108 Depth 4
                                        #       Child Loop BB1_88 Depth 3
                                        #         Child Loop BB1_89 Depth 4
                                        #         Child Loop BB1_95 Depth 4
	cmpq	$0, 304(%rsp)           # 8-byte Folded Reload
	js	.LBB1_100
# BB#86:                                # %polly.loop_header337.preheader
                                        #   in Loop: Header=BB1_85 Depth=2
	movq	48(%rsp), %rdx          # 8-byte Reload
	leaq	(,%rdx,8), %rcx
	movq	336(%rsp), %rax         # 8-byte Reload
	subq	%rcx, %rax
	cmpq	$7, %rax
	movl	$7, %ecx
	cmovgq	%rcx, %rax
	movq	%rdx, %rcx
	shlq	$5, %rcx
	orq	$31, %rcx
	testq	%rax, %rax
	js	.LBB1_99
# BB#87:                                # %polly.loop_header337.us.preheader
                                        #   in Loop: Header=BB1_85 Depth=2
	decq	%rax
	cmpq	32(%rsp), %rcx          # 8-byte Folded Reload
	setl	%cl
	cmpq	$0, 24(%rsp)            # 8-byte Folded Reload
	sete	%dl
	orb	%cl, %dl
	movb	%dl, 152(%rsp)          # 1-byte Spill
	movq	168(%rsp), %r9          # 8-byte Reload
	movq	272(%rsp), %rcx         # 8-byte Reload
	movq	%rcx, 224(%rsp)         # 8-byte Spill
	movq	192(%rsp), %rsi         # 8-byte Reload
	movq	184(%rsp), %rdi         # 8-byte Reload
	movq	176(%rsp), %r14         # 8-byte Reload
	movq	88(%rsp), %r11          # 8-byte Reload
	movq	312(%rsp), %r15         # 8-byte Reload
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB1_88:                               # %polly.loop_header337.us
                                        #   Parent Loop BB1_83 Depth=1
                                        #     Parent Loop BB1_85 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_89 Depth 4
                                        #         Child Loop BB1_95 Depth 4
	movq	%rdi, 136(%rsp)         # 8-byte Spill
	movq	%rsi, 160(%rsp)         # 8-byte Spill
	movq	%r9, 80(%rsp)           # 8-byte Spill
	movq	216(%rsp), %rcx         # 8-byte Reload
	leaq	(%r12,%rcx), %rcx
	movq	%rcx, 72(%rsp)          # 8-byte Spill
	imulq	%r13, %rcx
	movq	%r13, %rbx
	movq	$-1, %rdx
	movq	%rsi, %r13
	movq	%r14, %rbp
	movq	%r11, %r8
	movq	%r15, %r9
	.p2align	4, 0x90
.LBB1_89:                               # %polly.loop_header347.us
                                        #   Parent Loop BB1_83 Depth=1
                                        #     Parent Loop BB1_85 Depth=2
                                        #       Parent Loop BB1_88 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	(%r13), %rsi
	movq	%rsi, -24(%r9)
	movq	(%rdi), %rsi
	movq	%rsi, -16(%r9)
	movq	(%rbp), %rsi
	movq	%rsi, -8(%r9)
	movq	(%r8), %rsi
	movq	%rsi, (%r9)
	incq	%rdx
	addq	$32, %r9
	addq	%r10, %r8
	addq	%r10, %rbp
	addq	%r10, %rdi
	addq	%r10, %r13
	cmpq	%rax, %rdx
	jle	.LBB1_89
# BB#90:                                # %polly.cond365.loopexit.us
                                        #   in Loop: Header=BB1_88 Depth=3
	cmpb	$0, 152(%rsp)           # 1-byte Folded Reload
	movq	%rbx, %r13
	movq	128(%rsp), %r8          # 8-byte Reload
	movq	80(%rsp), %r9           # 8-byte Reload
	jne	.LBB1_96
# BB#91:                                # %polly.loop_header371.us.preheader
                                        #   in Loop: Header=BB1_88 Depth=3
	cmpq	$0, 104(%rsp)           # 8-byte Folded Reload
	movl	$0, %esi
	je	.LBB1_93
# BB#92:                                # %polly.loop_header371.us.prol
                                        #   in Loop: Header=BB1_88 Depth=3
	movq	72(%rsp), %rsi          # 8-byte Reload
	addq	56(%rsp), %rsi          # 8-byte Folded Reload
	movq	16(%rsp), %rdx          # 8-byte Reload
	movq	(%rdx,%rsi,8), %rdx
	addq	96(%rsp), %rcx          # 8-byte Folded Reload
	movq	64(%rsp), %rsi          # 8-byte Reload
	movq	%rdx, (%rsi,%rcx)
	movl	$1, %esi
.LBB1_93:                               # %polly.loop_header371.us.preheader.split
                                        #   in Loop: Header=BB1_88 Depth=3
	cmpq	$0, 144(%rsp)           # 8-byte Folded Reload
	je	.LBB1_96
# BB#94:                                # %polly.loop_header371.us.preheader.split.split
                                        #   in Loop: Header=BB1_88 Depth=3
	movq	24(%rsp), %rcx          # 8-byte Reload
	subq	%rsi, %rcx
	movq	208(%rsp), %rdx         # 8-byte Reload
	leaq	(%rdx,%rsi), %rbp
	movq	224(%rsp), %rdx         # 8-byte Reload
	leaq	(%rdx,%rbp,8), %rdx
	addq	200(%rsp), %rsi         # 8-byte Folded Reload
	movq	32(%rsp), %rbx          # 8-byte Reload
	imulq	%rbx, %rsi
	leaq	(%r9,%rsi,8), %rdi
	imulq	%rbx, %rbp
	leaq	(%r9,%rbp,8), %rbp
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB1_95:                               # %polly.loop_header371.us
                                        #   Parent Loop BB1_83 Depth=1
                                        #     Parent Loop BB1_85 Depth=2
                                        #       Parent Loop BB1_88 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	(%rbp,%rsi,8), %rbx
	movq	%rbx, (%rdx)
	movq	(%rdi,%rsi,8), %rbx
	movq	%rbx, 8(%rdx)
	addq	$16, %rdx
	addq	%r8, %rsi
	addq	$-2, %rcx
	jne	.LBB1_95
.LBB1_96:                               # %polly.merge366.us
                                        #   in Loop: Header=BB1_88 Depth=3
	addq	%r13, %r15
	addq	$8, %r11
	addq	$8, %r14
	movq	136(%rsp), %rdi         # 8-byte Reload
	addq	$8, %rdi
	movq	160(%rsp), %rsi         # 8-byte Reload
	addq	$8, %rsi
	addq	%r13, 224(%rsp)         # 8-byte Folded Spill
	addq	$8, %r9
	cmpq	120(%rsp), %r12         # 8-byte Folded Reload
	leaq	1(%r12), %r12
	jle	.LBB1_88
	jmp	.LBB1_100
	.p2align	4, 0x90
.LBB1_99:                               # %polly.loop_header337.preheader.split
                                        #   in Loop: Header=BB1_85 Depth=2
	cmpq	32(%rsp), %rcx          # 8-byte Folded Reload
	movq	168(%rsp), %r9          # 8-byte Reload
	movq	272(%rsp), %r8          # 8-byte Reload
	movl	$0, %r14d
	jl	.LBB1_100
	.p2align	4, 0x90
.LBB1_102:                              # %polly.loop_header337
                                        #   Parent Loop BB1_83 Depth=1
                                        #     Parent Loop BB1_85 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_108 Depth 4
	cmpq	$0, 24(%rsp)            # 8-byte Folded Reload
	movq	32(%rsp), %r11          # 8-byte Reload
	movq	128(%rsp), %rdx         # 8-byte Reload
	je	.LBB1_103
# BB#104:                               # %polly.loop_header371.preheader
                                        #   in Loop: Header=BB1_102 Depth=3
	cmpq	$0, 104(%rsp)           # 8-byte Folded Reload
	movl	$0, %ecx
	je	.LBB1_106
# BB#105:                               # %polly.loop_header371.prol
                                        #   in Loop: Header=BB1_102 Depth=3
	movq	216(%rsp), %rax         # 8-byte Reload
	leaq	(%r14,%rax), %rcx
	movq	56(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%rcx), %rsi
	imulq	%r13, %rcx
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	(%rax,%rsi,8), %rsi
	addq	96(%rsp), %rcx          # 8-byte Folded Reload
	movq	64(%rsp), %rax          # 8-byte Reload
	movq	%rsi, (%rax,%rcx)
	movl	$1, %ecx
.LBB1_106:                              # %polly.loop_header371.preheader.split
                                        #   in Loop: Header=BB1_102 Depth=3
	cmpq	$0, 144(%rsp)           # 8-byte Folded Reload
	je	.LBB1_103
# BB#107:                               # %polly.loop_header371.preheader.split.split
                                        #   in Loop: Header=BB1_102 Depth=3
	movq	24(%rsp), %rsi          # 8-byte Reload
	subq	%rcx, %rsi
	movq	208(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rcx), %rbx
	leaq	(%r8,%rbx,8), %rdi
	addq	200(%rsp), %rcx         # 8-byte Folded Reload
	imulq	%r11, %rcx
	leaq	(%r9,%rcx,8), %rbp
	imulq	%r11, %rbx
	leaq	(%r9,%rbx,8), %rbx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_108:                              # %polly.loop_header371
                                        #   Parent Loop BB1_83 Depth=1
                                        #     Parent Loop BB1_85 Depth=2
                                        #       Parent Loop BB1_102 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	(%rbx,%rcx,8), %rax
	movq	%rax, (%rdi)
	movq	(%rbp,%rcx,8), %rax
	movq	%rax, 8(%rdi)
	addq	$16, %rdi
	addq	%rdx, %rcx
	addq	$-2, %rsi
	jne	.LBB1_108
.LBB1_103:                              # %polly.merge366
                                        #   in Loop: Header=BB1_102 Depth=3
	movq	%rdx, 128(%rsp)         # 8-byte Spill
	addq	%r13, %r8
	addq	$8, %r9
	cmpq	120(%rsp), %r14         # 8-byte Folded Reload
	leaq	1(%r14), %r14
	jle	.LBB1_102
	.p2align	4, 0x90
.LBB1_100:                              # %polly.loop_exit339
                                        #   in Loop: Header=BB1_85 Depth=2
	addq	$256, 312(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x100
	movq	288(%rsp), %rax         # 8-byte Reload
	addq	%rax, 88(%rsp)          # 8-byte Folded Spill
	addq	%rax, 176(%rsp)         # 8-byte Folded Spill
	addq	%rax, 184(%rsp)         # 8-byte Folded Spill
	addq	%rax, 192(%rsp)         # 8-byte Folded Spill
	movq	48(%rsp), %rax          # 8-byte Reload
	cmpq	248(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	jne	.LBB1_85
.LBB1_101:                              # %polly.loop_exit330
                                        #   in Loop: Header=BB1_83 Depth=1
	movq	320(%rsp), %rax         # 8-byte Reload
	addq	%rax, 272(%rsp)         # 8-byte Folded Spill
	addq	$256, 168(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x100
	addq	%rax, 232(%rsp)         # 8-byte Folded Spill
	addq	$256, 280(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x100
	addq	$256, 240(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x100
	addq	$256, 256(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x100
	movq	264(%rsp), %rax         # 8-byte Reload
	cmpq	328(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 264(%rsp)         # 8-byte Spill
	jne	.LBB1_83
	jmp	.LBB1_10
.LBB1_2:                                # %for.cond11.preheader.preheader
.Ltmp55:
	#DEBUG_VALUE: matmult:width <- [%RSP+8]
	.loc	1 53 3 discriminator 1  # MatrixMult.c:53:3
	testl	%eax, %eax
	jle	.LBB1_10
.Ltmp56:
# BB#3:                                 # %for.cond11.preheader.us.preheader
	#DEBUG_VALUE: matmult:width <- [%RSP+8]
	movq	8(%rsp), %rax           # 8-byte Reload
.Ltmp57:
	.loc	1 54 9                  # MatrixMult.c:54:9
	leal	-1(%rax), %ecx
	.loc	1 54 30 is_stmt 0       # MatrixMult.c:54:30
	movl	%ecx, 160(%rsp)         # 4-byte Spill
	movl	%eax, %r13d
	andl	$3, %r13d
	.loc	1 54 9                  # MatrixMult.c:54:9
	movq	40(%rsp), %rax          # 8-byte Reload
	leaq	(,%rax,8), %rax
	movq	%rax, 136(%rsp)         # 8-byte Spill
	movq	32(%rsp), %rax          # 8-byte Reload
	leaq	(,%rax,8), %r12
	movq	%rax, %r15
	shlq	$5, %r15
	xorl	%eax, %eax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	16(%rsp), %r11          # 8-byte Reload
	movq	64(%rsp), %rax          # 8-byte Reload
	xorl	%r14d, %r14d
	movq	8(%rsp), %r10           # 8-byte Reload
.Ltmp58:
	.p2align	4, 0x90
.LBB1_4:                                # %for.cond11.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_5 Depth 2
                                        #     Child Loop BB1_8 Depth 2
	testl	%r13d, %r13d
	movq	%r11, %rcx
	movq	%rax, %rdx
	movl	$0, %esi
	je	.LBB1_6
	.p2align	4, 0x90
.LBB1_5:                                # %for.body14.us.prol
                                        #   Parent Loop BB1_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 54 22                 # MatrixMult.c:54:22
	movq	(%rcx), %rdi
	.loc	1 54 20                 # MatrixMult.c:54:20
	movq	%rdi, (%rdx)
.Ltmp59:
	.loc	1 53 3 is_stmt 1 discriminator 1 # MatrixMult.c:53:3
	incq	%rsi
	addq	$8, %rdx
	addq	%r12, %rcx
	cmpl	%esi, %r13d
	jne	.LBB1_5
.LBB1_6:                                # %for.cond11.preheader.us.split
                                        #   in Loop: Header=BB1_4 Depth=1
	cmpl	$3, 160(%rsp)           # 4-byte Folded Reload
	jb	.LBB1_9
# BB#7:                                 # %for.cond11.preheader.us.split.split
                                        #   in Loop: Header=BB1_4 Depth=1
.Ltmp60:
	.loc	1 54 30                 # MatrixMult.c:54:30
	leaq	3(%rsi), %rcx
	movq	32(%rsp), %rdi          # 8-byte Reload
	imulq	%rdi, %rcx
	movq	16(%rsp), %rbx          # 8-byte Reload
	leaq	(%rbx,%rcx,8), %r9
	leaq	2(%rsi), %rcx
	imulq	%rdi, %rcx
	leaq	(%rbx,%rcx,8), %rcx
	leaq	1(%rsi), %rdx
	imulq	%rdi, %rdx
	leaq	(%rbx,%rdx,8), %rbp
	movq	%rdi, %rdx
	imulq	%rsi, %rdx
	leaq	(%rbx,%rdx,8), %rdi
	movq	80(%rsp), %rdx          # 8-byte Reload
	.p2align	4, 0x90
.LBB1_8:                                # %for.body14.us
                                        #   Parent Loop BB1_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 54 22 is_stmt 0       # MatrixMult.c:54:22
	movq	(%rdi,%rdx), %r8
	.loc	1 54 20                 # MatrixMult.c:54:20
	movq	%r8, (%rax,%rsi,8)
	.loc	1 54 22                 # MatrixMult.c:54:22
	movq	(%rbp,%rdx), %rbx
	.loc	1 54 20                 # MatrixMult.c:54:20
	movq	%rbx, 8(%rax,%rsi,8)
	.loc	1 54 22                 # MatrixMult.c:54:22
	movq	(%rcx,%rdx), %rbx
	.loc	1 54 20                 # MatrixMult.c:54:20
	movq	%rbx, 16(%rax,%rsi,8)
	.loc	1 54 22                 # MatrixMult.c:54:22
	movq	(%r9,%rdx), %rbx
	.loc	1 54 20                 # MatrixMult.c:54:20
	movq	%rbx, 24(%rax,%rsi,8)
.Ltmp61:
	.loc	1 53 3 is_stmt 1 discriminator 1 # MatrixMult.c:53:3
	addq	$4, %rsi
	addq	%r15, %rdx
	cmpl	%esi, %r10d
	jne	.LBB1_8
.Ltmp62:
.LBB1_9:                                # %for.inc20.loopexit.us
                                        #   in Loop: Header=BB1_4 Depth=1
	.loc	1 51 2 discriminator 1  # MatrixMult.c:51:2
	incq	%r14
	addq	136(%rsp), %rax         # 8-byte Folded Reload
	addq	$8, %r11
	addq	$8, 80(%rsp)            # 8-byte Folded Spill
	movq	40(%rsp), %rcx          # 8-byte Reload
	cmpl	%ecx, %r14d
	jne	.LBB1_4
.Ltmp63:
.LBB1_10:                               # %polly.split_new_and_old
	movq	32(%rsp), %rbx          # 8-byte Reload
	leaq	-1(%rbx), %rcx
	movq	%rcx, 248(%rsp)         # 8-byte Spill
	imulq	%rbx, %rcx
	movq	%rbx, %rax
	imulq	%rax, %rax
	movq	112(%rsp), %rdx         # 8-byte Reload
	leaq	(%rdx,%rax,8), %rax
	movq	296(%rsp), %rdi         # 8-byte Reload
	cmpq	%rdi, %rax
	setbe	%al
	movq	40(%rsp), %rsi          # 8-byte Reload
	addq	%rsi, %rcx
	leaq	(%rdi,%rcx,8), %rcx
	cmpq	%rdx, %rcx
	setbe	%cl
	movq	8(%rsp), %rdx           # 8-byte Reload
	cmpl	%esi, %edx
	jl	.LBB1_12
# BB#11:                                # %polly.split_new_and_old
	orb	%cl, %al
	je	.LBB1_12
# BB#38:                                # %polly.start
	leaq	-1(%rsi), %rax
	sarq	$5, %rax
	movq	%rax, 232(%rsp)         # 8-byte Spill
	js	.LBB1_23
# BB#39:                                # %polly.loop_preheader
	leaq	(,%rbx,8), %rax
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	248(%rsp), %rcx         # 8-byte Reload
	sarq	$5, %rcx
	movq	%rcx, 256(%rsp)         # 8-byte Spill
	movq	%rbx, %rax
	shrq	$2, %rax
	decq	%rax
	movq	%rax, 304(%rsp)         # 8-byte Spill
	movq	8(%rsp), %rax           # 8-byte Reload
	movl	%eax, %edx
	andl	$3, %edx
	movq	%rdx, 24(%rsp)          # 8-byte Spill
	movq	%rbx, %rax
	subq	%rdx, %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	incq	%rcx
	movq	%rcx, 288(%rsp)         # 8-byte Spill
	incq	232(%rsp)               # 8-byte Folded Spill
	leaq	-1(%rdx), %rcx
	movq	%rcx, 216(%rsp)         # 8-byte Spill
	imulq	%rbx, %rax
	leaq	(%rdi,%rax,8), %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	leaq	3(%rbx), %rax
	subq	%rdx, %rax
	movq	%rax, 136(%rsp)         # 8-byte Spill
	movq	%rbx, %r10
	shlq	$5, %r10
	movq	%r10, 280(%rsp)         # 8-byte Spill
	leaq	2(%rbx), %rax
	subq	%rdx, %rax
	movq	%rax, 128(%rsp)         # 8-byte Spill
	leaq	1(%rbx), %rax
	subq	%rdx, %rax
	movq	%rax, 224(%rsp)         # 8-byte Spill
	leaq	(%rbx,%rbx,2), %rax
	leaq	(%rdi,%rax,8), %rax
	movq	%rax, 192(%rsp)         # 8-byte Spill
	movq	%rbx, %rax
	shlq	$8, %rax
	movq	%rax, 168(%rsp)         # 8-byte Spill
	movq	%rbx, %rax
	shlq	$4, %rax
	addq	%rdi, %rax
	movq	%rax, 184(%rsp)         # 8-byte Spill
	leaq	(%rdi,%rbx,8), %rax
	movq	%rax, 176(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movq	%rdi, 88(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB1_24:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_26 Depth 2
                                        #       Child Loop BB1_56 Depth 3
                                        #         Child Loop BB1_59 Depth 4
                                        #         Child Loop BB1_62 Depth 4
                                        #       Child Loop BB1_29 Depth 3
                                        #         Child Loop BB1_30 Depth 4
                                        #         Child Loop BB1_33 Depth 4
                                        #         Child Loop BB1_36 Depth 4
	cmpq	$0, 256(%rsp)           # 8-byte Folded Reload
	js	.LBB1_42
# BB#25:                                # %polly.loop_header169.preheader
                                        #   in Loop: Header=BB1_24 Depth=1
	movq	48(%rsp), %rax          # 8-byte Reload
	shlq	$5, %rax
	movq	40(%rsp), %rcx          # 8-byte Reload
	subq	%rax, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovgq	%rax, %rcx
	movq	%rcx, 16(%rsp)          # 8-byte Spill
	leaq	-1(%rcx), %rax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	88(%rsp), %rax          # 8-byte Reload
	movq	%rax, 144(%rsp)         # 8-byte Spill
	movq	176(%rsp), %rax         # 8-byte Reload
	movq	%rax, 104(%rsp)         # 8-byte Spill
	movq	184(%rsp), %rax         # 8-byte Reload
	movq	%rax, 208(%rsp)         # 8-byte Spill
	movq	192(%rsp), %rax         # 8-byte Reload
	movq	%rax, 200(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 152(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB1_26:                               # %polly.loop_header169
                                        #   Parent Loop BB1_24 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_56 Depth 3
                                        #         Child Loop BB1_59 Depth 4
                                        #         Child Loop BB1_62 Depth 4
                                        #       Child Loop BB1_29 Depth 3
                                        #         Child Loop BB1_30 Depth 4
                                        #         Child Loop BB1_33 Depth 4
                                        #         Child Loop BB1_36 Depth 4
	cmpq	$0, 16(%rsp)            # 8-byte Folded Reload
	js	.LBB1_41
# BB#27:                                # %polly.loop_header178.preheader
                                        #   in Loop: Header=BB1_26 Depth=2
	movq	152(%rsp), %rdx         # 8-byte Reload
	leaq	(,%rdx,8), %rcx
	movq	304(%rsp), %rax         # 8-byte Reload
	subq	%rcx, %rax
	cmpq	$7, %rax
	movl	$7, %ecx
	cmovgq	%rcx, %rax
	movq	%rdx, %rcx
	shlq	$5, %rcx
	orq	$31, %rcx
	testq	%rax, %rax
	js	.LBB1_40
# BB#28:                                # %polly.loop_header178.us.preheader
                                        #   in Loop: Header=BB1_26 Depth=2
	decq	%rax
	cmpq	32(%rsp), %rcx          # 8-byte Folded Reload
	setl	%cl
	cmpq	$0, 24(%rsp)            # 8-byte Folded Reload
	sete	%dl
	orb	%cl, %dl
	movb	%dl, 160(%rsp)          # 1-byte Spill
	movq	96(%rsp), %r12          # 8-byte Reload
	movq	56(%rsp), %r13          # 8-byte Reload
	movq	144(%rsp), %rdx         # 8-byte Reload
	movq	104(%rsp), %r8          # 8-byte Reload
	movq	208(%rsp), %r14         # 8-byte Reload
	movq	200(%rsp), %r15         # 8-byte Reload
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB1_29:                               # %polly.loop_header178.us
                                        #   Parent Loop BB1_24 Depth=1
                                        #     Parent Loop BB1_26 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_30 Depth 4
                                        #         Child Loop BB1_33 Depth 4
                                        #         Child Loop BB1_36 Depth 4
	movq	$-1, %rcx
	movq	%rdx, %rdi
	movq	%r8, %rbp
	movq	%r14, %rbx
	movq	%r15, %rsi
	.p2align	4, 0x90
.LBB1_30:                               # %polly.loop_header187.us
                                        #   Parent Loop BB1_24 Depth=1
                                        #     Parent Loop BB1_26 Depth=2
                                        #       Parent Loop BB1_29 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	$0, (%rdi)
	movq	$0, (%rbp)
	movq	$0, (%rbx)
	movq	$0, (%rsi)
	incq	%rcx
	addq	%r10, %rsi
	addq	%r10, %rbx
	addq	%r10, %rbp
	addq	%r10, %rdi
	cmpq	%rax, %rcx
	jle	.LBB1_30
# BB#31:                                # %polly.cond.loopexit.us
                                        #   in Loop: Header=BB1_29 Depth=3
	cmpb	$0, 160(%rsp)           # 1-byte Folded Reload
	jne	.LBB1_37
# BB#32:                                # %polly.loop_header203.us.preheader
                                        #   in Loop: Header=BB1_29 Depth=3
	movq	24(%rsp), %rbp          # 8-byte Reload
	testq	%rbp, %rbp
	movq	%r13, %rsi
	movl	$0, %ecx
	movq	120(%rsp), %rdi         # 8-byte Reload
	je	.LBB1_34
	.p2align	4, 0x90
.LBB1_33:                               # %polly.loop_header203.us.prol
                                        #   Parent Loop BB1_24 Depth=1
                                        #     Parent Loop BB1_26 Depth=2
                                        #       Parent Loop BB1_29 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	$0, (%rsi)
	incq	%rcx
	addq	%rdi, %rsi
	cmpq	%rcx, %rbp
	jne	.LBB1_33
.LBB1_34:                               # %polly.loop_header203.us.preheader.split
                                        #   in Loop: Header=BB1_29 Depth=3
	cmpq	$3, 216(%rsp)           # 8-byte Folded Reload
	jb	.LBB1_37
# BB#35:                                # %polly.loop_header203.us.preheader.split.split
                                        #   in Loop: Header=BB1_29 Depth=3
	movq	24(%rsp), %rbx          # 8-byte Reload
	subq	%rcx, %rbx
	movq	136(%rsp), %rsi         # 8-byte Reload
	leaq	(%rsi,%rcx), %rdi
	movq	120(%rsp), %rbp         # 8-byte Reload
	imulq	%rbp, %rdi
	addq	%r12, %rdi
	movq	128(%rsp), %rsi         # 8-byte Reload
	leaq	(%rsi,%rcx), %r11
	imulq	%rbp, %r11
	addq	%r12, %r11
	movq	224(%rsp), %rsi         # 8-byte Reload
	leaq	(%rsi,%rcx), %rsi
	imulq	%rbp, %rsi
	addq	%r12, %rsi
	addq	72(%rsp), %rcx          # 8-byte Folded Reload
	imulq	%rbp, %rcx
	addq	%r12, %rcx
	movq	296(%rsp), %rbp         # 8-byte Reload
	.p2align	4, 0x90
.LBB1_36:                               # %polly.loop_header203.us
                                        #   Parent Loop BB1_24 Depth=1
                                        #     Parent Loop BB1_26 Depth=2
                                        #       Parent Loop BB1_29 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	$0, (%rcx,%rbp)
	movq	$0, (%rsi,%rbp)
	movq	$0, (%r11,%rbp)
	movq	$0, (%rdi,%rbp)
	addq	%r10, %rbp
	addq	$-4, %rbx
	jne	.LBB1_36
.LBB1_37:                               # %polly.merge.us
                                        #   in Loop: Header=BB1_29 Depth=3
	addq	$8, %r15
	addq	$8, %r14
	addq	$8, %r8
	addq	$8, %rdx
	addq	$8, %r13
	addq	$8, %r12
	cmpq	80(%rsp), %r9           # 8-byte Folded Reload
	leaq	1(%r9), %r9
	jle	.LBB1_29
	jmp	.LBB1_41
	.p2align	4, 0x90
.LBB1_40:                               # %polly.loop_header178.preheader.split
                                        #   in Loop: Header=BB1_26 Depth=2
	cmpq	32(%rsp), %rcx          # 8-byte Folded Reload
	movq	96(%rsp), %rax          # 8-byte Reload
	movq	56(%rsp), %r8           # 8-byte Reload
	movl	$0, %r9d
	jl	.LBB1_41
	.p2align	4, 0x90
.LBB1_56:                               # %polly.loop_header178
                                        #   Parent Loop BB1_24 Depth=1
                                        #     Parent Loop BB1_26 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_59 Depth 4
                                        #         Child Loop BB1_62 Depth 4
	movq	24(%rsp), %rdi          # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB1_57
# BB#58:                                # %polly.loop_header203.preheader
                                        #   in Loop: Header=BB1_56 Depth=3
	movq	%r8, %rcx
	movl	$0, %esi
	movq	120(%rsp), %rdx         # 8-byte Reload
	je	.LBB1_60
	.p2align	4, 0x90
.LBB1_59:                               # %polly.loop_header203.prol
                                        #   Parent Loop BB1_24 Depth=1
                                        #     Parent Loop BB1_26 Depth=2
                                        #       Parent Loop BB1_56 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	$0, (%rcx)
	incq	%rsi
	addq	%rdx, %rcx
	cmpq	%rsi, %rdi
	jne	.LBB1_59
.LBB1_60:                               # %polly.loop_header203.preheader.split
                                        #   in Loop: Header=BB1_56 Depth=3
	cmpq	$3, 216(%rsp)           # 8-byte Folded Reload
	jb	.LBB1_57
# BB#61:                                # %polly.loop_header203.preheader.split.split
                                        #   in Loop: Header=BB1_56 Depth=3
	movq	%rdi, %rbp
	subq	%rsi, %rbp
	movq	136(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rsi), %rdi
	movq	120(%rsp), %rdx         # 8-byte Reload
	imulq	%rdx, %rdi
	addq	%rax, %rdi
	movq	128(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rsi), %rbx
	imulq	%rdx, %rbx
	addq	%rax, %rbx
	movq	224(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rsi), %rcx
	imulq	%rdx, %rcx
	addq	%rax, %rcx
	addq	72(%rsp), %rsi          # 8-byte Folded Reload
	imulq	%rdx, %rsi
	addq	%rax, %rsi
	movq	296(%rsp), %rdx         # 8-byte Reload
	.p2align	4, 0x90
.LBB1_62:                               # %polly.loop_header203
                                        #   Parent Loop BB1_24 Depth=1
                                        #     Parent Loop BB1_26 Depth=2
                                        #       Parent Loop BB1_56 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	$0, (%rsi,%rdx)
	movq	$0, (%rcx,%rdx)
	movq	$0, (%rbx,%rdx)
	movq	$0, (%rdi,%rdx)
	addq	%r10, %rdx
	addq	$-4, %rbp
	jne	.LBB1_62
.LBB1_57:                               # %polly.merge
                                        #   in Loop: Header=BB1_56 Depth=3
	addq	$8, %r8
	addq	$8, %rax
	cmpq	80(%rsp), %r9           # 8-byte Folded Reload
	leaq	1(%r9), %r9
	jle	.LBB1_56
	.p2align	4, 0x90
.LBB1_41:                               # %polly.loop_exit180
                                        #   in Loop: Header=BB1_26 Depth=2
	movq	152(%rsp), %rax         # 8-byte Reload
	movq	%rax, %rcx
	incq	%rcx
	movq	%rcx, 152(%rsp)         # 8-byte Spill
	movq	168(%rsp), %rax         # 8-byte Reload
	addq	%rax, 200(%rsp)         # 8-byte Folded Spill
	addq	%rax, 208(%rsp)         # 8-byte Folded Spill
	addq	%rax, 104(%rsp)         # 8-byte Folded Spill
	addq	%rax, 144(%rsp)         # 8-byte Folded Spill
	cmpq	288(%rsp), %rcx         # 8-byte Folded Reload
	jne	.LBB1_26
.LBB1_42:                               # %polly.loop_exit171
                                        #   in Loop: Header=BB1_24 Depth=1
	movq	48(%rsp), %rax          # 8-byte Reload
	incq	%rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	addq	$256, 56(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	addq	$256, 96(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	addq	$256, 192(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x100
	addq	$256, 184(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x100
	addq	$256, 176(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x100
	addq	$256, 88(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	cmpq	232(%rsp), %rax         # 8-byte Folded Reload
	jne	.LBB1_24
# BB#43:                                # %polly.loop_preheader219
	shrq	$5, 248(%rsp)           # 8-byte Folded Spill
	movq	8(%rsp), %rax           # 8-byte Reload
	andl	$1, %eax
	movq	%rax, 152(%rsp)         # 8-byte Spill
	movq	72(%rsp), %rax          # 8-byte Reload
	leaq	(,%rax,8), %rax
	movq	%rax, 144(%rsp)         # 8-byte Spill
	movq	64(%rsp), %rax          # 8-byte Reload
	addq	$24, %rax
	movq	%rax, 328(%rsp)         # 8-byte Spill
	movq	112(%rsp), %rax         # 8-byte Reload
	leaq	24(%rax), %rax
	movq	%rax, 320(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 240(%rsp)         # 8-byte Spill
	movq	296(%rsp), %rdi         # 8-byte Reload
	movq	32(%rsp), %r15          # 8-byte Reload
	movq	120(%rsp), %rsi         # 8-byte Reload
	.p2align	4, 0x90
.LBB1_44:                               # %polly.loop_header218
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_46 Depth 2
                                        #       Child Loop BB1_47 Depth 3
                                        #         Child Loop BB1_49 Depth 4
                                        #           Child Loop BB1_76 Depth 5
                                        #             Child Loop BB1_82 Depth 6
                                        #           Child Loop BB1_51 Depth 5
                                        #             Child Loop BB1_52 Depth 6
                                        #             Child Loop BB1_68 Depth 6
	cmpq	$0, 256(%rsp)           # 8-byte Folded Reload
	js	.LBB1_64
# BB#45:                                # %polly.loop_header228.preheader
                                        #   in Loop: Header=BB1_44 Depth=1
	movq	240(%rsp), %rax         # 8-byte Reload
	shlq	$5, %rax
	movq	%rax, 184(%rsp)         # 8-byte Spill
	movq	40(%rsp), %rcx          # 8-byte Reload
	subq	%rax, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovgq	%rax, %rcx
	movq	%rcx, 312(%rsp)         # 8-byte Spill
	leaq	-1(%rcx), %rax
	movq	%rax, 200(%rsp)         # 8-byte Spill
	movq	320(%rsp), %rcx         # 8-byte Reload
	movq	328(%rsp), %rdx         # 8-byte Reload
	movq	72(%rsp), %rax          # 8-byte Reload
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	64(%rsp), %rax          # 8-byte Reload
	movq	%rax, 56(%rsp)          # 8-byte Spill
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB1_46:                               # %polly.loop_header228
                                        #   Parent Loop BB1_44 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_47 Depth 3
                                        #         Child Loop BB1_49 Depth 4
                                        #           Child Loop BB1_76 Depth 5
                                        #             Child Loop BB1_82 Depth 6
                                        #           Child Loop BB1_51 Depth 5
                                        #             Child Loop BB1_52 Depth 6
                                        #             Child Loop BB1_68 Depth 6
	movq	%rbp, 264(%rsp)         # 8-byte Spill
	movq	%rdx, 336(%rsp)         # 8-byte Spill
	movq	%rcx, 272(%rsp)         # 8-byte Spill
	shlq	$5, %rbp
	movq	%rbp, 128(%rsp)         # 8-byte Spill
	movq	%r15, %rax
	subq	%rbp, %rax
	decq	%rax
	cmpq	$31, %rax
	movl	$31, %ebp
	cmovleq	%rax, %rbp
	movq	%rbp, 208(%rsp)         # 8-byte Spill
	leaq	-1(%rbp), %rax
	movq	%rax, 160(%rsp)         # 8-byte Spill
	movq	%rcx, 96(%rsp)          # 8-byte Spill
	movq	%rdx, 48(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 88(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB1_47:                               # %polly.loop_header237
                                        #   Parent Loop BB1_44 Depth=1
                                        #     Parent Loop BB1_46 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_49 Depth 4
                                        #           Child Loop BB1_76 Depth 5
                                        #             Child Loop BB1_82 Depth 6
                                        #           Child Loop BB1_51 Depth 5
                                        #             Child Loop BB1_52 Depth 6
                                        #             Child Loop BB1_68 Depth 6
	cmpq	$0, 312(%rsp)           # 8-byte Folded Reload
	js	.LBB1_73
# BB#48:                                # %polly.loop_header245.preheader
                                        #   in Loop: Header=BB1_47 Depth=3
	cmpq	$0, 24(%rsp)            # 8-byte Folded Reload
	sete	%al
	movq	88(%rsp), %rdx          # 8-byte Reload
	leaq	(,%rdx,8), %rcx
	movq	304(%rsp), %rbp         # 8-byte Reload
	subq	%rcx, %rbp
	cmpq	$7, %rbp
	movl	$7, %ecx
	cmovgq	%rcx, %rbp
	movq	%rbp, 192(%rsp)         # 8-byte Spill
	shlq	$5, %rdx
	orq	$31, %rdx
	movq	%rdx, 176(%rsp)         # 8-byte Spill
	cmpq	%r15, %rdx
	setl	%cl
	leaq	-1(%rbp), %r11
	orb	%al, %cl
	movb	%cl, 224(%rsp)          # 1-byte Spill
	xorl	%eax, %eax
	movq	%rax, 104(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB1_49:                               # %polly.loop_header245
                                        #   Parent Loop BB1_44 Depth=1
                                        #     Parent Loop BB1_46 Depth=2
                                        #       Parent Loop BB1_47 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB1_76 Depth 5
                                        #             Child Loop BB1_82 Depth 6
                                        #           Child Loop BB1_51 Depth 5
                                        #             Child Loop BB1_52 Depth 6
                                        #             Child Loop BB1_68 Depth 6
	cmpq	$0, 208(%rsp)           # 8-byte Folded Reload
	js	.LBB1_72
# BB#50:                                # %polly.loop_header254.preheader
                                        #   in Loop: Header=BB1_49 Depth=4
	movq	184(%rsp), %rax         # 8-byte Reload
	movq	104(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax), %rax
	shlq	$3, %rax
	movq	%rax, 136(%rsp)         # 8-byte Spill
	cmpq	$0, 192(%rsp)           # 8-byte Folded Reload
	movq	16(%rsp), %r13          # 8-byte Reload
	movq	56(%rsp), %r9           # 8-byte Reload
	movq	96(%rsp), %r8           # 8-byte Reload
	movq	48(%rsp), %r14          # 8-byte Reload
	movl	$0, %edx
	js	.LBB1_71
	.p2align	4, 0x90
.LBB1_51:                               # %polly.loop_header254.us
                                        #   Parent Loop BB1_44 Depth=1
                                        #     Parent Loop BB1_46 Depth=2
                                        #       Parent Loop BB1_47 Depth=3
                                        #         Parent Loop BB1_49 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB1_52 Depth 6
                                        #             Child Loop BB1_68 Depth 6
	movq	128(%rsp), %rax         # 8-byte Reload
	leaq	(%rdx,%rax), %r12
	movq	%r12, %rbx
	imulq	%rsi, %rbx
	movq	136(%rsp), %rax         # 8-byte Reload
	leaq	(%rbx,%rax), %rax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	imulq	%r15, %r12
	movq	(%rdi,%rax), %rcx
	movq	%rdi, %r15
	movq	$-1, %rax
	movq	%r8, %rbp
	movq	%r14, %rsi
	.p2align	4, 0x90
.LBB1_52:                               # %polly.loop_header264.us
                                        #   Parent Loop BB1_44 Depth=1
                                        #     Parent Loop BB1_46 Depth=2
                                        #       Parent Loop BB1_47 Depth=3
                                        #         Parent Loop BB1_49 Depth=4
                                        #           Parent Loop BB1_51 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	-24(%rsi), %rdi
	movq	-16(%rsi), %r10
.Ltmp64:
	.loc	1 62 58                 # MatrixMult.c:62:58
	imulq	-24(%rbp), %rdi
	.loc	1 62 39 is_stmt 0       # MatrixMult.c:62:39
	addq	%rcx, %rdi
	.loc	1 62 58                 # MatrixMult.c:62:58
	imulq	-16(%rbp), %r10
	.loc	1 62 39                 # MatrixMult.c:62:39
	addq	%rdi, %r10
	movq	-8(%rsi), %rdi
	.loc	1 62 58                 # MatrixMult.c:62:58
	imulq	-8(%rbp), %rdi
	.loc	1 62 39                 # MatrixMult.c:62:39
	addq	%r10, %rdi
	movq	(%rsi), %rcx
	.loc	1 62 58                 # MatrixMult.c:62:58
	imulq	(%rbp), %rcx
	.loc	1 62 39                 # MatrixMult.c:62:39
	addq	%rdi, %rcx
	incq	%rax
	addq	$32, %rsi
	addq	$32, %rbp
	cmpq	%r11, %rax
	jle	.LBB1_52
# BB#53:                                # %polly.cond285.loopexit.us
                                        #   in Loop: Header=BB1_51 Depth=5
	movq	%r15, %rdi
	movq	80(%rsp), %rax          # 8-byte Reload
	movq	%rcx, (%rdi,%rax)
	cmpb	$0, 224(%rsp)           # 1-byte Folded Reload
	movq	32(%rsp), %r15          # 8-byte Reload
	jne	.LBB1_70
# BB#54:                                # %polly.loop_header291.us.preheader
                                        #   in Loop: Header=BB1_51 Depth=5
	cmpq	$0, 152(%rsp)           # 8-byte Folded Reload
	jne	.LBB1_65
# BB#55:                                #   in Loop: Header=BB1_51 Depth=5
	movq	%rdi, %r10
                                        # implicit-def: %RBX
	xorl	%edi, %edi
	jmp	.LBB1_66
	.p2align	4, 0x90
.LBB1_65:                               # %polly.loop_header291.us.prol
                                        #   in Loop: Header=BB1_51 Depth=5
	movq	%rdi, %r10
	addq	72(%rsp), %r12          # 8-byte Folded Reload
	addq	144(%rsp), %rbx         # 8-byte Folded Reload
	movq	64(%rsp), %rax          # 8-byte Reload
	movq	(%rax,%rbx), %rbx
	.loc	1 62 58                 # MatrixMult.c:62:58
	movq	112(%rsp), %rax         # 8-byte Reload
	imulq	(%rax,%r12,8), %rbx
	.loc	1 62 39                 # MatrixMult.c:62:39
	addq	%rcx, %rbx
	movq	%rbx, %rcx
	movl	$1, %edi
.LBB1_66:                               # %polly.loop_header291.us.preheader.split
                                        #   in Loop: Header=BB1_51 Depth=5
	cmpq	$0, 216(%rsp)           # 8-byte Folded Reload
	je	.LBB1_69
# BB#67:                                # %polly.loop_header291.us.preheader.split.split
                                        #   in Loop: Header=BB1_51 Depth=5
	movq	24(%rsp), %rax          # 8-byte Reload
	subq	%rdi, %rax
	movq	72(%rsp), %rsi          # 8-byte Reload
	leaq	(%rsi,%rdi), %rsi
	leaq	(%r9,%rsi,8), %rsi
	addq	%r13, %rdi
	movq	112(%rsp), %rbp         # 8-byte Reload
	leaq	(%rbp,%rdi,8), %rdi
	.p2align	4, 0x90
.LBB1_68:                               # %polly.loop_header291.us
                                        #   Parent Loop BB1_44 Depth=1
                                        #     Parent Loop BB1_46 Depth=2
                                        #       Parent Loop BB1_47 Depth=3
                                        #         Parent Loop BB1_49 Depth=4
                                        #           Parent Loop BB1_51 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	(%rsi), %rbp
	movq	8(%rsi), %rbx
	.loc	1 62 58                 # MatrixMult.c:62:58
	imulq	(%rdi), %rbp
	.loc	1 62 39                 # MatrixMult.c:62:39
	addq	%rcx, %rbp
	.loc	1 62 58                 # MatrixMult.c:62:58
	imulq	8(%rdi), %rbx
	.loc	1 62 39                 # MatrixMult.c:62:39
	addq	%rbp, %rbx
	addq	$16, %rsi
	addq	$16, %rdi
	addq	$-2, %rax
	movq	%rbx, %rcx
	jne	.LBB1_68
.LBB1_69:                               # %polly.merge286.loopexit.us
                                        #   in Loop: Header=BB1_51 Depth=5
	movq	%r10, %rdi
	movq	80(%rsp), %rax          # 8-byte Reload
	movq	%rbx, (%rdi,%rax)
.LBB1_70:                               # %polly.merge286.us
                                        #   in Loop: Header=BB1_51 Depth=5
	movq	120(%rsp), %rsi         # 8-byte Reload
	addq	%rsi, %r14
	addq	%rsi, %r8
	addq	%rsi, %r9
	addq	%r15, %r13
	cmpq	160(%rsp), %rdx         # 8-byte Folded Reload
	leaq	1(%rdx), %rdx
	jle	.LBB1_51
	jmp	.LBB1_72
	.p2align	4, 0x90
.LBB1_71:                               # %polly.loop_header254.preheader.split
                                        #   in Loop: Header=BB1_49 Depth=4
	cmpq	%r15, 176(%rsp)         # 8-byte Folded Reload
	movq	16(%rsp), %r9           # 8-byte Reload
	movq	56(%rsp), %r10          # 8-byte Reload
	movl	$0, %ebp
	jl	.LBB1_72
	.p2align	4, 0x90
.LBB1_76:                               # %polly.loop_header254
                                        #   Parent Loop BB1_44 Depth=1
                                        #     Parent Loop BB1_46 Depth=2
                                        #       Parent Loop BB1_47 Depth=3
                                        #         Parent Loop BB1_49 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB1_82 Depth 6
	movq	24(%rsp), %r13          # 8-byte Reload
	testq	%r13, %r13
	je	.LBB1_75
# BB#77:                                # %polly.loop_header291.preheader
                                        #   in Loop: Header=BB1_76 Depth=5
	movq	128(%rsp), %rax         # 8-byte Reload
	leaq	(%rbp,%rax), %rcx
	movq	%rcx, %rdx
	imulq	%rsi, %rdx
	movq	136(%rsp), %rax         # 8-byte Reload
	leaq	(%rdx,%rax), %r8
	cmpq	$0, 152(%rsp)           # 8-byte Folded Reload
	movq	(%rdi,%r8), %rax
	movq	%rsi, %r12
	movq	%rdi, %r14
	jne	.LBB1_79
# BB#78:                                #   in Loop: Header=BB1_76 Depth=5
                                        # implicit-def: %RBX
	xorl	%edx, %edx
	jmp	.LBB1_80
	.p2align	4, 0x90
.LBB1_79:                               # %polly.loop_header291.prol
                                        #   in Loop: Header=BB1_76 Depth=5
	imulq	%r15, %rcx
	addq	72(%rsp), %rcx          # 8-byte Folded Reload
	addq	144(%rsp), %rdx         # 8-byte Folded Reload
	movq	64(%rsp), %rsi          # 8-byte Reload
	movq	(%rsi,%rdx), %rbx
	.loc	1 62 58                 # MatrixMult.c:62:58
	movq	112(%rsp), %rdx         # 8-byte Reload
	imulq	(%rdx,%rcx,8), %rbx
	.loc	1 62 39                 # MatrixMult.c:62:39
	addq	%rax, %rbx
	movq	%rbx, %rax
	movl	$1, %edx
.LBB1_80:                               # %polly.loop_header291.preheader.split
                                        #   in Loop: Header=BB1_76 Depth=5
	cmpq	$0, 216(%rsp)           # 8-byte Folded Reload
	je	.LBB1_74
# BB#81:                                # %polly.loop_header291.preheader.split.split
                                        #   in Loop: Header=BB1_76 Depth=5
	movq	%r13, %rdi
	subq	%rdx, %rdi
	movq	72(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rdx), %rcx
	leaq	(%r10,%rcx,8), %rcx
	addq	%r9, %rdx
	movq	112(%rsp), %rsi         # 8-byte Reload
	leaq	(%rsi,%rdx,8), %rdx
	.p2align	4, 0x90
.LBB1_82:                               # %polly.loop_header291
                                        #   Parent Loop BB1_44 Depth=1
                                        #     Parent Loop BB1_46 Depth=2
                                        #       Parent Loop BB1_47 Depth=3
                                        #         Parent Loop BB1_49 Depth=4
                                        #           Parent Loop BB1_76 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	(%rcx), %rsi
	movq	8(%rcx), %rbx
	.loc	1 62 58                 # MatrixMult.c:62:58
	imulq	(%rdx), %rsi
	.loc	1 62 39                 # MatrixMult.c:62:39
	addq	%rax, %rsi
	.loc	1 62 58                 # MatrixMult.c:62:58
	imulq	8(%rdx), %rbx
	.loc	1 62 39                 # MatrixMult.c:62:39
	addq	%rsi, %rbx
	addq	$16, %rcx
	addq	$16, %rdx
	addq	$-2, %rdi
	movq	%rbx, %rax
	jne	.LBB1_82
.Ltmp65:
.LBB1_74:                               # %polly.merge286.loopexit
                                        #   in Loop: Header=BB1_76 Depth=5
	movq	%r14, %rdi
	movq	%rbx, (%rdi,%r8)
	movq	%r12, %rsi
.LBB1_75:                               # %polly.merge286
                                        #   in Loop: Header=BB1_76 Depth=5
	addq	%rsi, %r10
	addq	%r15, %r9
	cmpq	160(%rsp), %rbp         # 8-byte Folded Reload
	leaq	1(%rbp), %rbp
	jle	.LBB1_76
	.p2align	4, 0x90
.LBB1_72:                               # %polly.loop_exit256
                                        #   in Loop: Header=BB1_49 Depth=4
	movq	104(%rsp), %rax         # 8-byte Reload
	cmpq	200(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 104(%rsp)         # 8-byte Spill
	jle	.LBB1_49
.LBB1_73:                               # %polly.loop_exit247
                                        #   in Loop: Header=BB1_47 Depth=3
	addq	$256, 48(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	addq	$256, 96(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	movq	88(%rsp), %rax          # 8-byte Reload
	cmpq	248(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 88(%rsp)          # 8-byte Spill
	jne	.LBB1_47
# BB#63:                                # %polly.loop_exit239
                                        #   in Loop: Header=BB1_46 Depth=2
	movq	264(%rsp), %rbp         # 8-byte Reload
	incq	%rbp
	movq	168(%rsp), %rcx         # 8-byte Reload
	addq	%rcx, 56(%rsp)          # 8-byte Folded Spill
	movq	280(%rsp), %rax         # 8-byte Reload
	addq	%rax, 16(%rsp)          # 8-byte Folded Spill
	movq	336(%rsp), %rdx         # 8-byte Reload
	addq	%rcx, %rdx
	movq	272(%rsp), %rax         # 8-byte Reload
	addq	%rcx, %rax
	movq	%rax, %rcx
	cmpq	288(%rsp), %rbp         # 8-byte Folded Reload
	jne	.LBB1_46
.LBB1_64:                               # %polly.loop_exit230
                                        #   in Loop: Header=BB1_44 Depth=1
	movq	240(%rsp), %rax         # 8-byte Reload
	incq	%rax
	movq	%rax, 240(%rsp)         # 8-byte Spill
	cmpq	232(%rsp), %rax         # 8-byte Folded Reload
	jne	.LBB1_44
	jmp	.LBB1_23
.LBB1_12:                               # %for.cond23.preheader
	.loc	1 57 2 is_stmt 1 discriminator 1 # MatrixMult.c:57:2
	testl	%esi, %esi
	jle	.LBB1_23
# BB#13:                                # %for.cond23.preheader
	movq	8(%rsp), %rax           # 8-byte Reload
	testl	%eax, %eax
	jle	.LBB1_23
# BB#14:                                # %for.cond27.preheader.us.preheader
.Ltmp66:
	.loc	1 62 23                 # MatrixMult.c:62:23
	movq	8(%rsp), %rax           # 8-byte Reload
	movl	%eax, %r8d
	andl	$1, %r8d
	xorl	%r9d, %r9d
	movq	8(%rsp), %r14           # 8-byte Reload
.Ltmp67:
	.p2align	4, 0x90
.LBB1_15:                               # %for.cond27.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_16 Depth 2
                                        #       Child Loop BB1_20 Depth 3
	movq	%rdi, %rdx
	movl	$1, %r10d
	xorl	%r11d, %r11d
	movq	%rbx, %r12
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB1_16:                               # %for.body30.us.us
                                        #   Parent Loop BB1_15 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_20 Depth 3
	.loc	1 60 10                 # MatrixMult.c:60:10
	movq	%r15, %rax
	imulq	%r12, %rax
	.loc	1 60 16 is_stmt 0       # MatrixMult.c:60:16
	leaq	(%rax,%r9), %rbp
	testl	%r8d, %r8d
	.loc	1 60 20                 # MatrixMult.c:60:20
	movq	$0, (%rdx,%rbp,8)
.Ltmp68:
	#DEBUG_VALUE: matmult:k <- 0
	movl	$0, %ebx
	movl	$0, %ecx
	je	.LBB1_18
# BB#17:                                # %for.body38.us.us.prol
                                        #   in Loop: Header=BB1_16 Depth=2
.Ltmp69:
	.loc	1 62 59 is_stmt 1       # MatrixMult.c:62:59
	movq	64(%rsp), %rcx          # 8-byte Reload
	movq	(%rcx,%rax,8), %rbx
	.loc	1 62 58 is_stmt 0       # MatrixMult.c:62:58
	movq	112(%rsp), %rcx         # 8-byte Reload
	imulq	(%rcx,%rax,8), %rbx
	.loc	1 62 21                 # MatrixMult.c:62:21
	movq	%rbx, (%rdx,%rbp,8)
	movl	$1, %ecx
.LBB1_18:                               # %for.body30.us.us.split
                                        #   in Loop: Header=BB1_16 Depth=2
	cmpl	$1, %r14d
	movq	%rdx, %rdi
	je	.LBB1_21
# BB#19:                                # %for.body30.us.us.split.split
                                        #   in Loop: Header=BB1_16 Depth=2
	.loc	1 62 23                 # MatrixMult.c:62:23
	movl	%r14d, %eax
	subl	%ecx, %eax
	leaq	(%rcx,%r11), %rdx
	movq	64(%rsp), %rsi          # 8-byte Reload
	leaq	(%rsi,%rdx,8), %rdx
	addq	%r10, %rcx
	movq	112(%rsp), %rsi         # 8-byte Reload
	leaq	(%rsi,%rcx,8), %rcx
	.p2align	4, 0x90
.LBB1_20:                               # %for.body38.us.us
                                        #   Parent Loop BB1_15 Depth=1
                                        #     Parent Loop BB1_16 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	.loc	1 62 59                 # MatrixMult.c:62:59
	movq	(%rdx), %rsi
	.loc	1 62 58                 # MatrixMult.c:62:58
	imulq	-8(%rcx), %rsi
	.loc	1 62 39                 # MatrixMult.c:62:39
	addq	%rbx, %rsi
	.loc	1 62 21                 # MatrixMult.c:62:21
	movq	%rsi, (%rdi,%rbp,8)
	.loc	1 62 59                 # MatrixMult.c:62:59
	movq	8(%rdx), %rbx
	.loc	1 62 58                 # MatrixMult.c:62:58
	imulq	(%rcx), %rbx
	.loc	1 62 39                 # MatrixMult.c:62:39
	addq	%rsi, %rbx
	.loc	1 62 21                 # MatrixMult.c:62:21
	movq	%rbx, (%rdi,%rbp,8)
.Ltmp70:
	.loc	1 61 4 is_stmt 1 discriminator 1 # MatrixMult.c:61:4
	addq	$16, %rdx
	addq	$16, %rcx
	addl	$-2, %eax
	jne	.LBB1_20
.Ltmp71:
.LBB1_21:                               # %for.inc60.loopexit.us.us
                                        #   in Loop: Header=BB1_16 Depth=2
	movq	%rdi, %rdx
	.loc	1 59 3 discriminator 1  # MatrixMult.c:59:3
	incq	%r15
	addq	%r12, %r11
	addq	%r12, %r10
	cmpl	%r14d, %r15d
	jne	.LBB1_16
.Ltmp72:
# BB#22:                                # %for.inc63.loopexit.us-lcssa.us.us
                                        #   in Loop: Header=BB1_15 Depth=1
	.loc	1 57 2 discriminator 1  # MatrixMult.c:57:2
	incq	%r9
	movq	40(%rsp), %rax          # 8-byte Reload
	cmpl	%eax, %r9d
	movq	%rdx, %rdi
	movq	%r12, %rbx
	jne	.LBB1_15
.Ltmp73:
.LBB1_23:                               # %for.end65
	movq	%rdi, %rbx
	.loc	1 68 17 discriminator 1 # MatrixMult.c:68:17
	movl	$16, %edi
	callq	malloc
.Ltmp74:
	#DEBUG_VALUE: matmult:m <- %RAX
	.loc	1 69 14                 # MatrixMult.c:69:14
	movq	8(%rsp), %rcx           # 8-byte Reload
	movl	%ecx, 8(%rax)
	.loc	1 70 15                 # MatrixMult.c:70:15
	movq	40(%rsp), %rcx          # 8-byte Reload
	movl	%ecx, 12(%rax)
	.loc	1 71 13                 # MatrixMult.c:71:13
	movq	%rbx, (%rax)
	.loc	1 72 5                  # MatrixMult.c:72:5
	addq	$344, %rsp              # imm = 0x158
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp75:
.Lfunc_end1:
	.size	matmult, .Lfunc_end1-matmult
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin2:
	.loc	1 75 0                  # MatrixMult.c:75:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 78 12 prologue_end    # MatrixMult.c:78:12
	pushq	%r15
.Ltmp76:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp77:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp78:
	.cfi_def_cfa_offset 32
	subq	$64, %rsp
.Ltmp79:
	.cfi_def_cfa_offset 96
.Ltmp80:
	.cfi_offset %rbx, -32
.Ltmp81:
	.cfi_offset %r14, -24
.Ltmp82:
	.cfi_offset %r15, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
	movq	8(%rsi), %rdi
.Ltmp83:
	leaq	60(%rsp), %rdx
.Ltmp84:
	#DEBUG_VALUE: main:max <- [%RDX+0]
	.loc	1 78 5 is_stmt 0        # MatrixMult.c:78:5
	movl	$.L.str, %esi
.Ltmp85:
	xorl	%eax, %eax
	callq	__isoc99_sscanf
.Ltmp86:
	.loc	1 79 24 is_stmt 1       # MatrixMult.c:79:24
	movl	60(%rsp), %esi
.Ltmp87:
	#DEBUG_VALUE: main:max <- %ESI
	.loc	1 79 5 is_stmt 0        # MatrixMult.c:79:5
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp88:
	.loc	1 81 22 is_stmt 1       # MatrixMult.c:81:22
	movl	60(%rsp), %edi
.Ltmp89:
	#DEBUG_VALUE: main:max <- %EDI
	.loc	1 81 17 is_stmt 0 discriminator 1 # MatrixMult.c:81:17
	movl	%edi, %esi
	callq	init
.Ltmp90:
	movq	%rax, %r14
.Ltmp91:
	#DEBUG_VALUE: main:a <- %R14
	.loc	1 82 22 is_stmt 1       # MatrixMult.c:82:22
	movl	60(%rsp), %edi
.Ltmp92:
	#DEBUG_VALUE: main:max <- %EDI
	.loc	1 82 17 is_stmt 0 discriminator 1 # MatrixMult.c:82:17
	movl	%edi, %esi
	callq	init
.Ltmp93:
	movq	%rax, %rbx
.Ltmp94:
	#DEBUG_VALUE: main:b <- %RBX
	.loc	1 84 17 is_stmt 1 discriminator 1 # MatrixMult.c:84:17
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	matmult
	movq	%rax, %r15
.Ltmp95:
	#DEBUG_VALUE: main:c <- %R15
	.loc	1 89 48                 # MatrixMult.c:89:48
	movl	60(%rsp), %esi
.Ltmp96:
	#DEBUG_VALUE: main:max <- %ESI
	.loc	1 89 5 is_stmt 0        # MatrixMult.c:89:5
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	movl	%esi, %edx
	callq	printf
.Ltmp97:
	.loc	1 91 9 is_stmt 1        # MatrixMult.c:91:9
	movl	60(%rsp), %edx
.Ltmp98:
	#DEBUG_VALUE: main:max <- %EDX
	.loc	1 91 12 is_stmt 0       # MatrixMult.c:91:12
	leal	-1(%rdx), %esi
	.loc	1 91 47                 # MatrixMult.c:91:47
	movl	%edx, %eax
	imull	%eax, %eax
	.loc	1 91 28                 # MatrixMult.c:91:28
	cltq
	.loc	1 91 31                 # MatrixMult.c:91:31
	movq	(%r14), %rcx
	.loc	1 91 28                 # MatrixMult.c:91:28
	movq	-8(%rcx,%rax,8), %r8
	.loc	1 92 31 is_stmt 1       # MatrixMult.c:92:31
	movq	(%rbx), %rcx
	.loc	1 92 28 is_stmt 0       # MatrixMult.c:92:28
	movq	-8(%rcx,%rax,8), %rcx
	.loc	1 93 31 is_stmt 1       # MatrixMult.c:93:31
	movq	(%r15), %rdi
	.loc	1 93 28 is_stmt 0       # MatrixMult.c:93:28
	movq	-8(%rdi,%rax,8), %rax
	.loc	1 90 5 is_stmt 1        # MatrixMult.c:90:5
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
.Ltmp99:
	.loc	1 95 5                  # MatrixMult.c:95:5
	xorl	%eax, %eax
	addq	$64, %rsp
	popq	%rbx
.Ltmp100:
	popq	%r14
.Ltmp101:
	popq	%r15
.Ltmp102:
	retq
.Ltmp103:
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
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten2" # string offset=178
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
	.asciz	"matmult"               # string offset=294
.Linfo_string11:
	.asciz	"main"                  # string offset=302
.Linfo_string12:
	.asciz	"i"                     # string offset=307
.Linfo_string13:
	.asciz	"m"                     # string offset=309
.Linfo_string14:
	.asciz	"j"                     # string offset=311
.Linfo_string15:
	.asciz	"a"                     # string offset=313
.Linfo_string16:
	.asciz	"b"                     # string offset=315
.Linfo_string17:
	.asciz	"a_data"                # string offset=317
.Linfo_string18:
	.asciz	"b_data"                # string offset=324
.Linfo_string19:
	.asciz	"k"                     # string offset=331
.Linfo_string20:
	.asciz	"b_t"                   # string offset=333
.Linfo_string21:
	.asciz	"argc"                  # string offset=337
.Linfo_string22:
	.asciz	"args"                  # string offset=342
.Linfo_string23:
	.asciz	"char"                  # string offset=347
.Linfo_string24:
	.asciz	"max"                   # string offset=352
.Linfo_string25:
	.asciz	"c"                     # string offset=356
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp16-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	24                      # 24
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp13-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	84                      # super-register DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Ltmp18-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp23-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	0                       # 0
	.quad	0
	.quad	0
.Ldebug_loc2:
	.quad	.Ltmp28-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	240                     # 112
	.byte	0                       # 
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	16                      # 16
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	.Ltmp86-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	113                     # DW_OP_breg1
	.byte	0                       # 0
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	84                      # super-register DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp89-.Lfunc_begin0
	.quad	.Ltmp90-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp92-.Lfunc_begin0
	.quad	.Ltmp93-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp96-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	84                      # super-register DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp98-.Lfunc_begin0
	.quad	.Ltmp99-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	81                      # super-register DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp101-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp94-.Lfunc_begin0
	.quad	.Ltmp100-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp95-.Lfunc_begin0
	.quad	.Ltmp102-.Lfunc_begin0
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
	.long	537                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x212 DW_TAG_compile_unit
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
	.long	459                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	5                       # Abbrev [5] 0x4f:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	516                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x5e:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	516                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x6d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.long	516                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x79:0xf DW_TAG_variable
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	30                      # DW_AT_decl_line
	.long	459                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x88:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.long	516                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x93:0xb DW_TAG_variable
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	16                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	4                       # Abbrev [4] 0x9f:0xb8 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	38                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	459                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	5                       # Abbrev [5] 0xb8:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	38                      # DW_AT_decl_line
	.long	459                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0xc7:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc4            # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	38                      # DW_AT_decl_line
	.long	459                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0xd6:0xf DW_TAG_variable
	.long	.Ldebug_loc5            # DW_AT_location
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	40                      # DW_AT_decl_line
	.long	516                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0xe5:0xf DW_TAG_variable
	.long	.Ldebug_loc6            # DW_AT_location
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	42                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	7                       # Abbrev [7] 0xf4:0xf DW_TAG_variable
	.long	.Ldebug_loc7            # DW_AT_location
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	43                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	6                       # Abbrev [6] 0x103:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	39                      # DW_AT_decl_line
	.long	516                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x10f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	39                      # DW_AT_decl_line
	.long	516                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x11b:0xf DW_TAG_variable
	.long	.Ldebug_loc8            # DW_AT_location
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	68                      # DW_AT_decl_line
	.long	459                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x12a:0xb DW_TAG_variable
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	39                      # DW_AT_decl_line
	.long	516                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x135:0xb DW_TAG_variable
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	41                      # DW_AT_decl_line
	.long	516                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x140:0xb DW_TAG_variable
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	46                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	8                       # Abbrev [8] 0x14b:0xb DW_TAG_variable
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	48                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	4                       # Abbrev [4] 0x157:0x74 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	75                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	516                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	5                       # Abbrev [5] 0x170:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc9            # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	75                      # DW_AT_decl_line
	.long	516                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x17f:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	75                      # DW_AT_decl_line
	.long	523                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x18e:0xf DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	77                      # DW_AT_decl_line
	.long	516                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x19d:0xf DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	81                      # DW_AT_decl_line
	.long	459                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x1ac:0xf DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	82                      # DW_AT_decl_line
	.long	459                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x1bb:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	84                      # DW_AT_decl_line
	.long	459                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	2                       # Abbrev [2] 0x1cb:0x5 DW_TAG_pointer_type
	.long	464                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x1d0:0xb DW_TAG_typedef
	.long	475                     # DW_AT_type
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.byte	10                      # Abbrev [10] 0x1db:0x29 DW_TAG_structure_type
	.byte	16                      # DW_AT_byte_size
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.byte	11                      # Abbrev [11] 0x1df:0xc DW_TAG_member
	.long	.Linfo_string5          # DW_AT_name
	.long	42                      # DW_AT_type
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	11                      # Abbrev [11] 0x1eb:0xc DW_TAG_member
	.long	.Linfo_string6          # DW_AT_name
	.long	516                     # DW_AT_type
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	11                      # Abbrev [11] 0x1f7:0xc DW_TAG_member
	.long	.Linfo_string8          # DW_AT_name
	.long	516                     # DW_AT_type
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.byte	12                      # DW_AT_data_member_location
	.byte	0                       # End Of Children Mark
	.byte	3                       # Abbrev [3] 0x204:0x7 DW_TAG_base_type
	.long	.Linfo_string7          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	2                       # Abbrev [2] 0x20b:0x5 DW_TAG_pointer_type
	.long	528                     # DW_AT_type
	.byte	2                       # Abbrev [2] 0x210:0x5 DW_TAG_pointer_type
	.long	533                     # DW_AT_type
	.byte	3                       # Abbrev [3] 0x215:0x7 DW_TAG_base_type
	.long	.Linfo_string23         # DW_AT_name
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
	.long	541                     # Compilation Unit Length
	.long	54                      # DIE offset
	.asciz	"init"                  # External Name
	.long	159                     # DIE offset
	.asciz	"matmult"               # External Name
	.long	343                     # DIE offset
	.asciz	"main"                  # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	541                     # Compilation Unit Length
	.long	464                     # DIE offset
	.asciz	"Matrix"                # External Name
	.long	47                      # DIE offset
	.asciz	"long long int"         # External Name
	.long	516                     # DIE offset
	.asciz	"int"                   # External Name
	.long	533                     # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
