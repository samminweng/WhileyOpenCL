	.text
	.file	"llvm/MatrixMult.polly.disablevc.ll"
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
	subq	$56, %rsp
.Ltmp6:
	.cfi_def_cfa_offset 112
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
	movq	%rbx, 8(%rsp)           # 8-byte Spill
.Ltmp14:
	.loc	1 16 48 prologue_end    # MatrixMult.c:16:48
	movq	%rdi, 16(%rsp)          # 8-byte Spill
	movl	%ebx, %eax
	imull	%edi, %eax
.Ltmp15:
	#DEBUG_VALUE: init:width <- [%RSP+16]
	.loc	1 16 42 is_stmt 0       # MatrixMult.c:16:42
	movslq	%eax, %rdi
	.loc	1 16 54                 # MatrixMult.c:16:54
	shlq	$3, %rdi
	.loc	1 16 35 discriminator 1 # MatrixMult.c:16:35
	callq	malloc
.Ltmp16:
	movq	%rax, 24(%rsp)          # 8-byte Spill
.Ltmp17:
	#DEBUG_VALUE: init:i <- 0
	.loc	1 18 5 is_stmt 1 discriminator 1 # MatrixMult.c:18:5
	testl	%ebx, %ebx
.Ltmp18:
	#DEBUG_VALUE: init:height <- [%RSP+8]
	jle	.LBB0_8
.Ltmp19:
# BB#1:                                 # %entry
	#DEBUG_VALUE: init:height <- [%RSP+8]
	movq	16(%rsp), %rax          # 8-byte Reload
	testl	%eax, %eax
	jle	.LBB0_8
.Ltmp20:
# BB#2:                                 # %for.cond3.preheader.us.preheader
	#DEBUG_VALUE: init:height <- [%RSP+8]
	movq	16(%rsp), %rax          # 8-byte Reload
	movslq	%eax, %r15
.Ltmp21:
	.loc	1 20 19                 # MatrixMult.c:20:19
	leaq	(,%r15,8), %r14
	leal	-1(%rax), %eax
	leaq	8(,%rax,8), %r13
	movq	8(%rsp), %rax           # 8-byte Reload
	leal	-1(%rax), %ecx
	movl	%ecx, 32(%rsp)          # 4-byte Spill
	xorl	%ebp, %ebp
	testb	$7, %al
	je	.LBB0_5
.Ltmp22:
# BB#3:                                 # %for.cond3.preheader.us.prol.preheader
	#DEBUG_VALUE: init:height <- [%RSP+8]
	movq	8(%rsp), %r12           # 8-byte Reload
	andl	$7, %r12d
	xorl	%ebp, %ebp
	movq	24(%rsp), %rbx          # 8-byte Reload
.Ltmp23:
	.p2align	4, 0x90
.LBB0_4:                                # %for.cond3.preheader.us.prol
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 20 29 is_stmt 0       # MatrixMult.c:20:29
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movq	%r13, %rdx
	callq	memset
.Ltmp24:
	.loc	1 18 5 is_stmt 1 discriminator 1 # MatrixMult.c:18:5
	incq	%rbp
	addq	%r14, %rbx
	cmpl	%ebp, %r12d
	jne	.LBB0_4
.LBB0_5:                                # %for.cond3.preheader.us.preheader.split
.Ltmp25:
	.loc	1 20 19                 # MatrixMult.c:20:19
	cmpl	$7, 32(%rsp)            # 4-byte Folded Reload
	jb	.LBB0_8
# BB#6:                                 # %for.cond3.preheader.us.preheader.split.split
	movq	8(%rsp), %rax           # 8-byte Reload
	movl	%eax, %r12d
	subl	%ebp, %r12d
	imulq	%r15, %rbp
	movq	24(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%rbp,8), %rbx
	shlq	$6, %r15
	.p2align	4, 0x90
.LBB0_7:                                # %for.cond3.preheader.us
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 20 29 is_stmt 0       # MatrixMult.c:20:29
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movq	%r13, %rdx
	callq	memset
	leaq	(%rbx,%r14), %rbp
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movq	%r13, %rdx
	callq	memset
	addq	%r14, %rbp
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movq	%r13, %rdx
	callq	memset
	addq	%r14, %rbp
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movq	%r13, %rdx
	callq	memset
	addq	%r14, %rbp
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movq	%r13, %rdx
	callq	memset
	addq	%r14, %rbp
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movq	%r13, %rdx
	callq	memset
	addq	%r14, %rbp
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movq	%r13, %rdx
	callq	memset
	addq	%r14, %rbp
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movq	%r13, %rdx
	callq	memset
.Ltmp26:
	.loc	1 18 5 is_stmt 1 discriminator 1 # MatrixMult.c:18:5
	addq	%r15, %rbx
	addl	$-8, %r12d
	jne	.LBB0_7
.Ltmp27:
.LBB0_8:                                # %polly.start
	movq	8(%rsp), %rax           # 8-byte Reload
	cltq
	movq	%rax, 40(%rsp)          # 8-byte Spill
	decq	%rax
	sarq	$5, %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	js	.LBB0_20
# BB#9:                                 # %polly.loop_preheader
	movq	16(%rsp), %rax          # 8-byte Reload
	movslq	%eax, %r12
	leaq	-1(%r12), %r13
	sarq	$5, %r13
	movq	%r12, %rax
	shlq	$8, %rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	leaq	(,%r12,8), %rbp
	xorl	%r15d, %r15d
	movq	24(%rsp), %r14          # 8-byte Reload
	.p2align	4, 0x90
.LBB0_10:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_13 Depth 2
                                        #       Child Loop BB0_15 Depth 3
                                        #         Child Loop BB0_16 Depth 4
	testq	%r13, %r13
	js	.LBB0_19
# BB#11:                                # %polly.loop_header97.preheader
                                        #   in Loop: Header=BB0_10 Depth=1
	movq	%r15, %rbx
	shlq	$5, %rbx
	movq	40(%rsp), %rdi          # 8-byte Reload
	subq	%rbx, %rdi
	decq	%rdi
	cmpq	$31, %rdi
	movl	$31, %eax
	cmovgq	%rax, %rdi
	testq	%rdi, %rdi
	js	.LBB0_19
# BB#12:                                #   in Loop: Header=BB0_10 Depth=1
	decq	%rdi
	movq	%r14, %rax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_13:                               # %polly.loop_header97.us
                                        #   Parent Loop BB0_10 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_15 Depth 3
                                        #         Child Loop BB0_16 Depth 4
	movq	%rcx, %rdx
	shlq	$5, %rdx
	movq	%r12, %rsi
	subq	%rdx, %rsi
	decq	%rsi
	cmpq	$31, %rsi
	movl	$31, %edx
	cmovleq	%rsi, %rdx
	testq	%rdx, %rdx
	js	.LBB0_18
# BB#14:                                #   in Loop: Header=BB0_13 Depth=2
	decq	%rdx
	movq	%rax, %r11
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB0_15:                               # %polly.loop_header106.us.us
                                        #   Parent Loop BB0_10 Depth=1
                                        #     Parent Loop BB0_13 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_16 Depth 4
	leaq	(%r8,%rbx), %r9
	movq	$-1, %r10
	movq	%r11, %rsi
	.p2align	4, 0x90
.LBB0_16:                               # %polly.loop_header115.us.us
                                        #   Parent Loop BB0_10 Depth=1
                                        #     Parent Loop BB0_13 Depth=2
                                        #       Parent Loop BB0_15 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	addq	%r9, (%rsi)
	incq	%r10
	addq	$8, %rsi
	cmpq	%rdx, %r10
	jle	.LBB0_16
# BB#17:                                # %polly.loop_exit117.loopexit.us.us
                                        #   in Loop: Header=BB0_15 Depth=3
	addq	%rbp, %r11
	cmpq	%rdi, %r8
	leaq	1(%r8), %r8
	jle	.LBB0_15
.LBB0_18:                               # %polly.loop_exit108.loopexit.us
                                        #   in Loop: Header=BB0_13 Depth=2
	addq	$256, %rax              # imm = 0x100
	cmpq	%r13, %rcx
	leaq	1(%rcx), %rcx
	jne	.LBB0_13
.LBB0_19:                               # %polly.loop_exit99
                                        #   in Loop: Header=BB0_10 Depth=1
	addq	48(%rsp), %r14          # 8-byte Folded Reload
	cmpq	32(%rsp), %r15          # 8-byte Folded Reload
	leaq	1(%r15), %r15
	jne	.LBB0_10
.LBB0_20:                               # %polly.exiting
	.loc	1 30 17 discriminator 1 # MatrixMult.c:30:17
	movl	$16, %edi
	callq	malloc
.Ltmp28:
	#DEBUG_VALUE: init:m <- %RAX
	.loc	1 31 13                 # MatrixMult.c:31:13
	movq	24(%rsp), %rcx          # 8-byte Reload
	movq	%rcx, (%rax)
	.loc	1 32 14                 # MatrixMult.c:32:14
	movq	16(%rsp), %rcx          # 8-byte Reload
	movl	%ecx, 8(%rax)
	.loc	1 33 15                 # MatrixMult.c:33:15
	movq	8(%rsp), %rcx           # 8-byte Reload
	movl	%ecx, 12(%rax)
	.loc	1 35 5                  # MatrixMult.c:35:5
	addq	$56, %rsp
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
	subq	$184, %rsp
.Ltmp36:
	.cfi_def_cfa_offset 240
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
	movq	%rbx, 32(%rsp)          # 8-byte Spill
	movslq	12(%rdi), %rbp
.Ltmp43:
	#DEBUG_VALUE: matmult:width <- %EBX
	.loc	1 42 28                 # MatrixMult.c:42:28
	movq	%rbp, 8(%rsp)           # 8-byte Spill
	movq	(%rdi), %rax
.Ltmp44:
	#DEBUG_VALUE: matmult:a_data <- [%RSP+48]
	.loc	1 43 28                 # MatrixMult.c:43:28
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	(%rsi), %rax
.Ltmp45:
	#DEBUG_VALUE: matmult:b_data <- [%RSP+16]
	.loc	1 46 45                 # MatrixMult.c:46:45
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movl	%ebp, %eax
	imull	%ebx, %eax
	.loc	1 46 39 is_stmt 0       # MatrixMult.c:46:39
	movslq	%eax, %r14
	.loc	1 46 51                 # MatrixMult.c:46:51
	shlq	$3, %r14
	.loc	1 46 32 discriminator 1 # MatrixMult.c:46:32
	movq	%r14, %rdi
.Ltmp46:
	callq	malloc
.Ltmp47:
	movq	%rax, 56(%rsp)          # 8-byte Spill
	.loc	1 47 22 is_stmt 1 discriminator 1 # MatrixMult.c:47:22
	movq	%r14, %rdi
	callq	malloc
	movq	%rax, 40(%rsp)          # 8-byte Spill
	.loc	1 41 21                 # MatrixMult.c:41:21
	testq	%rbp, %rbp
.Ltmp48:
	#DEBUG_VALUE: matmult:j <- 0
	.loc	1 49 2 discriminator 1  # MatrixMult.c:49:2
	movslq	%ebx, %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	jle	.LBB1_10
.Ltmp49:
# BB#1:                                 # %for.cond11.preheader.lr.ph
	#DEBUG_VALUE: matmult:width <- %EBX
	movq	8(%rsp), %rax           # 8-byte Reload
	cmpl	%eax, %ebx
	jge	.LBB1_62
.Ltmp50:
# BB#2:                                 # %for.cond11.preheader.preheader
	#DEBUG_VALUE: matmult:width <- %EBX
	.loc	1 51 3 discriminator 1  # MatrixMult.c:51:3
	testl	%ebx, %ebx
	jle	.LBB1_10
.Ltmp51:
# BB#3:                                 # %for.cond11.preheader.us.preheader
	#DEBUG_VALUE: matmult:width <- %EBX
	.loc	1 52 9                  # MatrixMult.c:52:9
	leal	-1(%rbx), %eax
	.loc	1 52 29 is_stmt 0       # MatrixMult.c:52:29
	movl	%eax, (%rsp)            # 4-byte Spill
	movl	%ebx, %r15d
	andl	$3, %r15d
	movq	24(%rsp), %rax          # 8-byte Reload
	.loc	1 52 9                  # MatrixMult.c:52:9
	leaq	(,%rax,8), %r13
	movq	%rax, %r14
	shlq	$5, %r14
	xorl	%r8d, %r8d
	movq	16(%rsp), %r10          # 8-byte Reload
	movq	40(%rsp), %rax          # 8-byte Reload
	xorl	%r11d, %r11d
.Ltmp52:
	.p2align	4, 0x90
.LBB1_4:                                # %for.cond11.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_5 Depth 2
                                        #     Child Loop BB1_8 Depth 2
	testl	%r15d, %r15d
	movq	%r10, %rcx
	movq	%rax, %rdx
	movl	$0, %ebp
	je	.LBB1_6
	.p2align	4, 0x90
.LBB1_5:                                # %for.body14.us.prol
                                        #   Parent Loop BB1_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 52 21                 # MatrixMult.c:52:21
	movq	(%rcx), %rsi
	.loc	1 52 19                 # MatrixMult.c:52:19
	movq	%rsi, (%rdx)
.Ltmp53:
	.loc	1 51 3 is_stmt 1 discriminator 1 # MatrixMult.c:51:3
	incq	%rbp
	addq	$8, %rdx
	addq	%r13, %rcx
	cmpl	%ebp, %r15d
	jne	.LBB1_5
.LBB1_6:                                # %for.cond11.preheader.us.split
                                        #   in Loop: Header=BB1_4 Depth=1
	cmpl	$3, (%rsp)              # 4-byte Folded Reload
	jb	.LBB1_9
# BB#7:                                 # %for.cond11.preheader.us.split.split
                                        #   in Loop: Header=BB1_4 Depth=1
.Ltmp54:
	.loc	1 52 29                 # MatrixMult.c:52:29
	leaq	3(%rbp), %rcx
	movq	24(%rsp), %rdx          # 8-byte Reload
	imulq	%rdx, %rcx
	movq	16(%rsp), %rdi          # 8-byte Reload
	leaq	(%rdi,%rcx,8), %r12
	leaq	2(%rbp), %rcx
	imulq	%rdx, %rcx
	leaq	(%rdi,%rcx,8), %rsi
	leaq	1(%rbp), %rcx
	imulq	%rdx, %rcx
	leaq	(%rdi,%rcx,8), %rcx
	imulq	%rbp, %rdx
	leaq	(%rdi,%rdx,8), %rdx
	movq	%r8, %r9
	.p2align	4, 0x90
.LBB1_8:                                # %for.body14.us
                                        #   Parent Loop BB1_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 52 21 is_stmt 0       # MatrixMult.c:52:21
	movq	(%rdx,%r9), %rdi
	.loc	1 52 19                 # MatrixMult.c:52:19
	movq	%rdi, (%rax,%rbp,8)
	.loc	1 52 21                 # MatrixMult.c:52:21
	movq	(%rcx,%r9), %rdi
	.loc	1 52 19                 # MatrixMult.c:52:19
	movq	%rdi, 8(%rax,%rbp,8)
	.loc	1 52 21                 # MatrixMult.c:52:21
	movq	(%rsi,%r9), %rdi
	.loc	1 52 19                 # MatrixMult.c:52:19
	movq	%rdi, 16(%rax,%rbp,8)
	.loc	1 52 21                 # MatrixMult.c:52:21
	movq	(%r12,%r9), %rdi
	.loc	1 52 19                 # MatrixMult.c:52:19
	movq	%rdi, 24(%rax,%rbp,8)
.Ltmp55:
	.loc	1 51 3 is_stmt 1 discriminator 1 # MatrixMult.c:51:3
	addq	$4, %rbp
	addq	%r14, %r9
	cmpl	%ebp, %ebx
	jne	.LBB1_8
.Ltmp56:
.LBB1_9:                                # %for.inc20.loopexit.us
                                        #   in Loop: Header=BB1_4 Depth=1
	.loc	1 49 2 discriminator 1  # MatrixMult.c:49:2
	incq	%r11
	addq	%r13, %rax
	addq	$8, %r10
	addq	$8, %r8
	movq	8(%rsp), %rcx           # 8-byte Reload
	cmpl	%ecx, %r11d
	jne	.LBB1_4
	jmp	.LBB1_10
.Ltmp57:
.LBB1_62:                               # %polly.start259
	#DEBUG_VALUE: matmult:width <- %EBX
	decq	%rax
	sarq	$5, %rax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	js	.LBB1_10
.Ltmp58:
# BB#63:                                # %polly.loop_preheader264
	#DEBUG_VALUE: matmult:width <- %EBX
	movq	24(%rsp), %rax          # 8-byte Reload
	leaq	-1(%rax), %r14
	sarq	$5, %r14
	movq	%rax, %r15
	shlq	$8, %r15
	leaq	(,%rax,8), %rax
	xorl	%ecx, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movq	40(%rsp), %rcx          # 8-byte Reload
	movq	%rcx, 72(%rsp)          # 8-byte Spill
.Ltmp59:
	.p2align	4, 0x90
.LBB1_52:                               # %polly.loop_header263
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_55 Depth 2
                                        #       Child Loop BB1_57 Depth 3
                                        #         Child Loop BB1_58 Depth 4
	testq	%r14, %r14
	js	.LBB1_61
# BB#53:                                # %polly.loop_header273.preheader
                                        #   in Loop: Header=BB1_52 Depth=1
	movq	(%rsp), %rdx            # 8-byte Reload
	shlq	$5, %rdx
	movq	8(%rsp), %rcx           # 8-byte Reload
	subq	%rdx, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %edx
	cmovgq	%rdx, %rcx
	testq	%rcx, %rcx
	js	.LBB1_61
# BB#54:                                #   in Loop: Header=BB1_52 Depth=1
	decq	%rcx
	movq	16(%rsp), %r13          # 8-byte Reload
	movq	72(%rsp), %rdx          # 8-byte Reload
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB1_55:                               # %polly.loop_header273.us
                                        #   Parent Loop BB1_52 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_57 Depth 3
                                        #         Child Loop BB1_58 Depth 4
	movq	%rsi, %rdi
	shlq	$5, %rdi
	movq	24(%rsp), %rbp          # 8-byte Reload
	subq	%rdi, %rbp
	decq	%rbp
	cmpq	$31, %rbp
	movl	$31, %edi
	cmovleq	%rbp, %rdi
	testq	%rdi, %rdi
	js	.LBB1_60
# BB#56:                                #   in Loop: Header=BB1_55 Depth=2
	decq	%rdi
	movq	%r13, %r10
	movq	%rdx, %r11
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB1_57:                               # %polly.loop_header282.us.us
                                        #   Parent Loop BB1_52 Depth=1
                                        #     Parent Loop BB1_55 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_58 Depth 4
	movq	$-1, %r12
	movq	%r10, %rbp
	movq	%r11, %r9
	.p2align	4, 0x90
.LBB1_58:                               # %polly.loop_header291.us.us
                                        #   Parent Loop BB1_52 Depth=1
                                        #     Parent Loop BB1_55 Depth=2
                                        #       Parent Loop BB1_57 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	(%rbp), %rbx
	movq	%rbx, (%r9)
	incq	%r12
	addq	$8, %r9
	addq	%rax, %rbp
	cmpq	%rdi, %r12
	jle	.LBB1_58
# BB#59:                                # %polly.loop_exit293.loopexit.us.us
                                        #   in Loop: Header=BB1_57 Depth=3
	addq	%rax, %r11
	addq	$8, %r10
	cmpq	%rcx, %r8
	leaq	1(%r8), %r8
	jle	.LBB1_57
.LBB1_60:                               # %polly.loop_exit284.loopexit.us
                                        #   in Loop: Header=BB1_55 Depth=2
	addq	$256, %rdx              # imm = 0x100
	addq	%r15, %r13
	cmpq	%r14, %rsi
	leaq	1(%rsi), %rsi
	jne	.LBB1_55
.LBB1_61:                               # %polly.loop_exit275
                                        #   in Loop: Header=BB1_52 Depth=1
	addq	%r15, 72(%rsp)          # 8-byte Folded Spill
	addq	$256, 16(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	movq	(%rsp), %rcx            # 8-byte Reload
	cmpq	64(%rsp), %rcx          # 8-byte Folded Reload
	leaq	1(%rcx), %rcx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movq	32(%rsp), %rbx          # 8-byte Reload
	jne	.LBB1_52
.LBB1_10:                               # %polly.split_new_and_old
	movq	%rbx, 32(%rsp)          # 8-byte Spill
	movq	24(%rsp), %r15          # 8-byte Reload
	leaq	-1(%r15), %rcx
	movq	%rcx, 96(%rsp)          # 8-byte Spill
	imulq	%r15, %rcx
	movq	%r15, %rax
	imulq	%rax, %rax
	movq	48(%rsp), %rsi          # 8-byte Reload
	leaq	(%rsi,%rax,8), %rax
	movq	56(%rsp), %r12          # 8-byte Reload
	cmpq	%r12, %rax
	setbe	%al
	movq	8(%rsp), %rdx           # 8-byte Reload
	addq	%rdx, %rcx
	leaq	(%r12,%rcx,8), %rcx
	cmpq	%rsi, %rcx
	setbe	%cl
	cmpl	%edx, %ebx
	jl	.LBB1_12
# BB#11:                                # %polly.split_new_and_old
	orb	%cl, %al
	je	.LBB1_12
# BB#50:                                # %polly.start
	leaq	-1(%rdx), %rax
	sarq	$5, %rax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	js	.LBB1_23
# BB#51:                                # %polly.loop_preheader
	movq	96(%rsp), %rcx          # 8-byte Reload
	sarq	$5, %rcx
	movq	%rcx, 112(%rsp)         # 8-byte Spill
	incq	%rcx
	movq	%rcx, 128(%rsp)         # 8-byte Spill
	incq	80(%rsp)                # 8-byte Folded Spill
	movq	%r15, %rcx
	shlq	$8, %rcx
	movq	%rcx, 120(%rsp)         # 8-byte Spill
	leaq	(,%r15,8), %rdi
	movq	%r15, %r13
	xorl	%r10d, %r10d
	movl	$31, %r8d
	movq	%r12, %r9
	movq	8(%rsp), %rbx           # 8-byte Reload
	.p2align	4, 0x90
.LBB1_24:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_27 Depth 2
                                        #       Child Loop BB1_29 Depth 3
                                        #         Child Loop BB1_30 Depth 4
	cmpq	$0, 112(%rsp)           # 8-byte Folded Reload
	js	.LBB1_33
# BB#25:                                # %polly.loop_header169.preheader
                                        #   in Loop: Header=BB1_24 Depth=1
	movq	%r10, %rax
	shlq	$5, %rax
	movq	%rbx, %r15
	subq	%rax, %r15
	decq	%r15
	cmpq	$31, %r15
	cmovgq	%r8, %r15
	testq	%r15, %r15
	js	.LBB1_33
# BB#26:                                #   in Loop: Header=BB1_24 Depth=1
	decq	%r15
	movq	%r9, %r11
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB1_27:                               # %polly.loop_header169.us
                                        #   Parent Loop BB1_24 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_29 Depth 3
                                        #         Child Loop BB1_30 Depth 4
	movq	%r14, %rax
	shlq	$5, %rax
	movq	%r13, %rcx
	subq	%rax, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %edx
	cmovleq	%rcx, %rdx
	testq	%rdx, %rdx
	js	.LBB1_32
# BB#28:                                #   in Loop: Header=BB1_27 Depth=2
	decq	%rdx
	movq	%r11, %rbp
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_29:                               # %polly.loop_header178.us.us
                                        #   Parent Loop BB1_24 Depth=1
                                        #     Parent Loop BB1_27 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_30 Depth 4
	movq	$-1, %rsi
	movq	%rbp, %rax
	.p2align	4, 0x90
.LBB1_30:                               # %polly.loop_header187.us.us
                                        #   Parent Loop BB1_24 Depth=1
                                        #     Parent Loop BB1_27 Depth=2
                                        #       Parent Loop BB1_29 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	$0, (%rax)
	incq	%rsi
	addq	%rdi, %rax
	cmpq	%rdx, %rsi
	jle	.LBB1_30
# BB#31:                                # %polly.loop_exit189.loopexit.us.us
                                        #   in Loop: Header=BB1_29 Depth=3
	addq	$8, %rbp
	cmpq	%r15, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB1_29
.LBB1_32:                               # %polly.loop_exit180.loopexit.us
                                        #   in Loop: Header=BB1_27 Depth=2
	incq	%r14
	addq	120(%rsp), %r11         # 8-byte Folded Reload
	cmpq	128(%rsp), %r14         # 8-byte Folded Reload
	jne	.LBB1_27
.LBB1_33:                               # %polly.loop_exit171
                                        #   in Loop: Header=BB1_24 Depth=1
	incq	%r10
	addq	$256, %r9               # imm = 0x100
	cmpq	80(%rsp), %r10          # 8-byte Folded Reload
	jne	.LBB1_24
# BB#34:                                # %polly.loop_preheader199
	shrq	$5, 96(%rsp)            # 8-byte Folded Spill
	xorl	%eax, %eax
	movq	%rax, 88(%rsp)          # 8-byte Spill
	movq	%r13, %rax
	.p2align	4, 0x90
.LBB1_35:                               # %polly.loop_header198
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_37 Depth 2
                                        #       Child Loop BB1_38 Depth 3
                                        #         Child Loop BB1_41 Depth 4
                                        #           Child Loop BB1_43 Depth 5
                                        #             Child Loop BB1_44 Depth 6
	cmpq	$0, 112(%rsp)           # 8-byte Folded Reload
	js	.LBB1_49
# BB#36:                                # %polly.loop_header208.preheader
                                        #   in Loop: Header=BB1_35 Depth=1
	movq	88(%rsp), %rcx          # 8-byte Reload
	shlq	$5, %rcx
	movq	%rcx, 176(%rsp)         # 8-byte Spill
	movq	8(%rsp), %rdx           # 8-byte Reload
	subq	%rcx, %rdx
	decq	%rdx
	cmpq	$31, %rdx
	movl	$31, %ecx
	cmovgq	%rcx, %rdx
	movq	%rdx, 168(%rsp)         # 8-byte Spill
	leaq	-1(%rdx), %rcx
	movq	%rcx, 72(%rsp)          # 8-byte Spill
	movq	48(%rsp), %rcx          # 8-byte Reload
	movq	40(%rsp), %rdx          # 8-byte Reload
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB1_37:                               # %polly.loop_header208
                                        #   Parent Loop BB1_35 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_38 Depth 3
                                        #         Child Loop BB1_41 Depth 4
                                        #           Child Loop BB1_43 Depth 5
                                        #             Child Loop BB1_44 Depth 6
	movq	%r13, 136(%rsp)         # 8-byte Spill
	movq	%rdx, 144(%rsp)         # 8-byte Spill
	movq	%rcx, 152(%rsp)         # 8-byte Spill
	shlq	$5, %r13
	subq	%r13, %rax
	decq	%rax
	cmpq	$31, %rax
	movl	$31, %esi
	cmovleq	%rax, %rsi
	movq	%rsi, 160(%rsp)         # 8-byte Spill
	leaq	-1(%rsi), %r15
	movq	%rcx, 64(%rsp)          # 8-byte Spill
	movq	%rdx, 56(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 104(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB1_38:                               # %polly.loop_header216
                                        #   Parent Loop BB1_35 Depth=1
                                        #     Parent Loop BB1_37 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_41 Depth 4
                                        #           Child Loop BB1_43 Depth 5
                                        #             Child Loop BB1_44 Depth 6
	cmpq	$0, 168(%rsp)           # 8-byte Folded Reload
	js	.LBB1_47
# BB#39:                                # %polly.loop_header224.preheader
                                        #   in Loop: Header=BB1_38 Depth=3
	movq	104(%rsp), %rax         # 8-byte Reload
	shlq	$5, %rax
	movq	24(%rsp), %rcx          # 8-byte Reload
	subq	%rax, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovleq	%rcx, %rax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	cmpq	$0, 160(%rsp)           # 8-byte Folded Reload
	js	.LBB1_47
# BB#40:                                #   in Loop: Header=BB1_38 Depth=3
	movq	16(%rsp), %rax          # 8-byte Reload
	leaq	-1(%rax), %r9
	xorl	%eax, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	.p2align	4, 0x90
.LBB1_41:                               # %polly.loop_header224.us
                                        #   Parent Loop BB1_35 Depth=1
                                        #     Parent Loop BB1_37 Depth=2
                                        #       Parent Loop BB1_38 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB1_43 Depth 5
                                        #             Child Loop BB1_44 Depth 6
	cmpq	$0, 16(%rsp)            # 8-byte Folded Reload
	js	.LBB1_46
# BB#42:                                #   in Loop: Header=BB1_41 Depth=4
	movq	176(%rsp), %rax         # 8-byte Reload
	movq	(%rsp), %rcx            # 8-byte Reload
	leaq	(%rcx,%rax), %rdx
	shlq	$3, %rdx
	movq	64(%rsp), %rsi          # 8-byte Reload
	movq	56(%rsp), %r8           # 8-byte Reload
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB1_43:                               # %polly.loop_header233.us.us
                                        #   Parent Loop BB1_35 Depth=1
                                        #     Parent Loop BB1_37 Depth=2
                                        #       Parent Loop BB1_38 Depth=3
                                        #         Parent Loop BB1_41 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB1_44 Depth 6
	leaq	(%rbp,%r13), %rcx
	imulq	%rdi, %rcx
	addq	%rdx, %rcx
	movq	(%r12,%rcx), %r11
	movq	%r12, %r14
	movq	$-1, %r10
	movq	%rsi, %rax
	movq	%r8, %r12
	.p2align	4, 0x90
.LBB1_44:                               # %polly.loop_header242.us.us
                                        #   Parent Loop BB1_35 Depth=1
                                        #     Parent Loop BB1_37 Depth=2
                                        #       Parent Loop BB1_38 Depth=3
                                        #         Parent Loop BB1_41 Depth=4
                                        #           Parent Loop BB1_43 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	(%r12), %rbx
.Ltmp60:
	.loc	1 60 58                 # MatrixMult.c:60:58
	imulq	(%rax), %rbx
	.loc	1 60 39 is_stmt 0       # MatrixMult.c:60:39
	addq	%rbx, %r11
	incq	%r10
	addq	$8, %r12
	addq	$8, %rax
	cmpq	%r9, %r10
	jle	.LBB1_44
.Ltmp61:
# BB#45:                                # %polly.loop_exit244.loopexit.us.us
                                        #   in Loop: Header=BB1_43 Depth=5
	movq	%r14, %r12
	movq	%r11, (%r12,%rcx)
	addq	%rdi, %r8
	addq	%rdi, %rsi
	cmpq	%r15, %rbp
	leaq	1(%rbp), %rbp
	jle	.LBB1_43
.LBB1_46:                               # %polly.loop_exit235.loopexit.us
                                        #   in Loop: Header=BB1_41 Depth=4
	movq	(%rsp), %rax            # 8-byte Reload
	cmpq	72(%rsp), %rax          # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, (%rsp)            # 8-byte Spill
	jle	.LBB1_41
.LBB1_47:                               # %polly.loop_exit226
                                        #   in Loop: Header=BB1_38 Depth=3
	addq	$256, 56(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	addq	$256, 64(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	movq	104(%rsp), %rax         # 8-byte Reload
	cmpq	96(%rsp), %rax          # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 104(%rsp)         # 8-byte Spill
	jne	.LBB1_38
# BB#48:                                # %polly.loop_exit218
                                        #   in Loop: Header=BB1_37 Depth=2
	movq	136(%rsp), %r13         # 8-byte Reload
	incq	%r13
	movq	120(%rsp), %rax         # 8-byte Reload
	movq	144(%rsp), %rdx         # 8-byte Reload
	addq	%rax, %rdx
	movq	152(%rsp), %rcx         # 8-byte Reload
	addq	%rax, %rcx
	cmpq	128(%rsp), %r13         # 8-byte Folded Reload
	movq	24(%rsp), %rax          # 8-byte Reload
	jne	.LBB1_37
.LBB1_49:                               # %polly.loop_exit210
                                        #   in Loop: Header=BB1_35 Depth=1
	movq	88(%rsp), %rcx          # 8-byte Reload
	incq	%rcx
	movq	%rcx, 88(%rsp)          # 8-byte Spill
	cmpq	80(%rsp), %rcx          # 8-byte Folded Reload
	jne	.LBB1_35
	jmp	.LBB1_23
.LBB1_12:                               # %for.cond23.preheader
	.loc	1 55 2 is_stmt 1 discriminator 1 # MatrixMult.c:55:2
	testl	%edx, %edx
	jle	.LBB1_23
# BB#13:                                # %for.cond23.preheader
	movq	32(%rsp), %rax          # 8-byte Reload
	testl	%eax, %eax
	jle	.LBB1_23
# BB#14:                                # %for.cond27.preheader.us.preheader
.Ltmp62:
	.loc	1 60 23                 # MatrixMult.c:60:23
	movq	32(%rsp), %rax          # 8-byte Reload
	movl	%eax, %r8d
	andl	$1, %r8d
	xorl	%r9d, %r9d
	movq	32(%rsp), %r13          # 8-byte Reload
.Ltmp63:
	.p2align	4, 0x90
.LBB1_15:                               # %for.cond27.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_16 Depth 2
                                        #       Child Loop BB1_20 Depth 3
	movq	%r12, %rdx
	movl	$1, %r10d
	xorl	%r11d, %r11d
	xorl	%r14d, %r14d
	movq	48(%rsp), %r12          # 8-byte Reload
	.p2align	4, 0x90
.LBB1_16:                               # %for.body30.us.us
                                        #   Parent Loop BB1_15 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_20 Depth 3
	.loc	1 58 10                 # MatrixMult.c:58:10
	movq	%r14, %rcx
	imulq	%r15, %rcx
	.loc	1 58 16 is_stmt 0       # MatrixMult.c:58:16
	leaq	(%rcx,%r9), %rbp
	testl	%r8d, %r8d
	.loc	1 58 20                 # MatrixMult.c:58:20
	movq	$0, (%rdx,%rbp,8)
.Ltmp64:
	#DEBUG_VALUE: matmult:k <- 0
	movl	$0, %eax
	movl	$0, %esi
	je	.LBB1_18
# BB#17:                                # %for.body38.us.us.prol
                                        #   in Loop: Header=BB1_16 Depth=2
.Ltmp65:
	.loc	1 60 59 is_stmt 1       # MatrixMult.c:60:59
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	(%rax,%rcx,8), %rax
	.loc	1 60 58 is_stmt 0       # MatrixMult.c:60:58
	imulq	(%r12,%rcx,8), %rax
	.loc	1 60 21                 # MatrixMult.c:60:21
	movq	%rax, (%rdx,%rbp,8)
	movl	$1, %esi
.LBB1_18:                               # %for.body30.us.us.split
                                        #   in Loop: Header=BB1_16 Depth=2
	cmpl	$1, %r13d
	movq	%rdx, %rbx
	je	.LBB1_21
# BB#19:                                # %for.body30.us.us.split.split
                                        #   in Loop: Header=BB1_16 Depth=2
	.loc	1 60 23                 # MatrixMult.c:60:23
	movl	%r13d, %ecx
	subl	%esi, %ecx
	leaq	(%rsi,%r11), %rdx
	movq	40(%rsp), %rdi          # 8-byte Reload
	leaq	(%rdi,%rdx,8), %rdx
	addq	%r10, %rsi
	leaq	(%r12,%rsi,8), %rsi
	.p2align	4, 0x90
.LBB1_20:                               # %for.body38.us.us
                                        #   Parent Loop BB1_15 Depth=1
                                        #     Parent Loop BB1_16 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	.loc	1 60 59                 # MatrixMult.c:60:59
	movq	(%rdx), %rdi
	.loc	1 60 58                 # MatrixMult.c:60:58
	imulq	-8(%rsi), %rdi
	.loc	1 60 39                 # MatrixMult.c:60:39
	addq	%rax, %rdi
	.loc	1 60 21                 # MatrixMult.c:60:21
	movq	%rdi, (%rbx,%rbp,8)
	.loc	1 60 59                 # MatrixMult.c:60:59
	movq	8(%rdx), %rax
	.loc	1 60 58                 # MatrixMult.c:60:58
	imulq	(%rsi), %rax
	.loc	1 60 39                 # MatrixMult.c:60:39
	addq	%rdi, %rax
	.loc	1 60 21                 # MatrixMult.c:60:21
	movq	%rax, (%rbx,%rbp,8)
.Ltmp66:
	.loc	1 59 4 is_stmt 1 discriminator 1 # MatrixMult.c:59:4
	addq	$16, %rdx
	addq	$16, %rsi
	addl	$-2, %ecx
	jne	.LBB1_20
.Ltmp67:
.LBB1_21:                               # %for.inc60.loopexit.us.us
                                        #   in Loop: Header=BB1_16 Depth=2
	movq	%rbx, %rdx
	.loc	1 57 3 discriminator 1  # MatrixMult.c:57:3
	incq	%r14
	addq	%r15, %r11
	addq	%r15, %r10
	cmpl	%r13d, %r14d
	jne	.LBB1_16
.Ltmp68:
# BB#22:                                # %for.inc63.loopexit.us-lcssa.us.us
                                        #   in Loop: Header=BB1_15 Depth=1
	.loc	1 55 2 discriminator 1  # MatrixMult.c:55:2
	incq	%r9
	movq	8(%rsp), %rax           # 8-byte Reload
	cmpl	%eax, %r9d
	movq	%rdx, %r12
	jne	.LBB1_15
.Ltmp69:
.LBB1_23:                               # %for.end65
	.loc	1 66 17 discriminator 1 # MatrixMult.c:66:17
	movl	$16, %edi
	callq	malloc
.Ltmp70:
	#DEBUG_VALUE: matmult:m <- %RAX
	.loc	1 67 14                 # MatrixMult.c:67:14
	movq	32(%rsp), %rcx          # 8-byte Reload
	movl	%ecx, 8(%rax)
	.loc	1 68 15                 # MatrixMult.c:68:15
	movq	8(%rsp), %rcx           # 8-byte Reload
	movl	%ecx, 12(%rax)
	.loc	1 69 13                 # MatrixMult.c:69:13
	movq	%r12, (%rax)
	.loc	1 70 5                  # MatrixMult.c:70:5
	addq	$184, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp71:
.Lfunc_end1:
	.size	matmult, .Lfunc_end1-matmult
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin2:
	.loc	1 73 0                  # MatrixMult.c:73:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 76 12 prologue_end    # MatrixMult.c:76:12
	pushq	%r15
.Ltmp72:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp73:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp74:
	.cfi_def_cfa_offset 32
	subq	$64, %rsp
.Ltmp75:
	.cfi_def_cfa_offset 96
.Ltmp76:
	.cfi_offset %rbx, -32
.Ltmp77:
	.cfi_offset %r14, -24
.Ltmp78:
	.cfi_offset %r15, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
	movq	8(%rsi), %rdi
.Ltmp79:
	leaq	60(%rsp), %rdx
.Ltmp80:
	#DEBUG_VALUE: main:max <- [%RDX+0]
	.loc	1 76 5 is_stmt 0        # MatrixMult.c:76:5
	movl	$.L.str, %esi
.Ltmp81:
	xorl	%eax, %eax
	callq	__isoc99_sscanf
.Ltmp82:
	.loc	1 77 24 is_stmt 1       # MatrixMult.c:77:24
	movl	60(%rsp), %esi
.Ltmp83:
	#DEBUG_VALUE: main:max <- %ESI
	.loc	1 77 5 is_stmt 0        # MatrixMult.c:77:5
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp84:
	.loc	1 79 22 is_stmt 1       # MatrixMult.c:79:22
	movl	60(%rsp), %edi
.Ltmp85:
	#DEBUG_VALUE: main:max <- %EDI
	.loc	1 79 17 is_stmt 0 discriminator 1 # MatrixMult.c:79:17
	movl	%edi, %esi
	callq	init
.Ltmp86:
	movq	%rax, %r14
.Ltmp87:
	#DEBUG_VALUE: main:a <- %R14
	.loc	1 80 22 is_stmt 1       # MatrixMult.c:80:22
	movl	60(%rsp), %edi
.Ltmp88:
	#DEBUG_VALUE: main:max <- %EDI
	.loc	1 80 17 is_stmt 0 discriminator 1 # MatrixMult.c:80:17
	movl	%edi, %esi
	callq	init
.Ltmp89:
	movq	%rax, %rbx
.Ltmp90:
	#DEBUG_VALUE: main:b <- %RBX
	.loc	1 82 17 is_stmt 1 discriminator 1 # MatrixMult.c:82:17
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	matmult
	movq	%rax, %r15
.Ltmp91:
	#DEBUG_VALUE: main:c <- %R15
	.loc	1 87 48                 # MatrixMult.c:87:48
	movl	60(%rsp), %esi
.Ltmp92:
	#DEBUG_VALUE: main:max <- %ESI
	.loc	1 87 5 is_stmt 0        # MatrixMult.c:87:5
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	movl	%esi, %edx
	callq	printf
.Ltmp93:
	.loc	1 89 9 is_stmt 1        # MatrixMult.c:89:9
	movl	60(%rsp), %edx
.Ltmp94:
	#DEBUG_VALUE: main:max <- %EDX
	.loc	1 89 12 is_stmt 0       # MatrixMult.c:89:12
	leal	-1(%rdx), %esi
	.loc	1 89 47                 # MatrixMult.c:89:47
	movl	%edx, %eax
	imull	%eax, %eax
	.loc	1 89 28                 # MatrixMult.c:89:28
	cltq
	.loc	1 89 31                 # MatrixMult.c:89:31
	movq	(%r14), %rcx
	.loc	1 89 28                 # MatrixMult.c:89:28
	movq	-8(%rcx,%rax,8), %r8
	.loc	1 90 31 is_stmt 1       # MatrixMult.c:90:31
	movq	(%rbx), %rcx
	.loc	1 90 28 is_stmt 0       # MatrixMult.c:90:28
	movq	-8(%rcx,%rax,8), %rcx
	.loc	1 91 31 is_stmt 1       # MatrixMult.c:91:31
	movq	(%r15), %rdi
	.loc	1 91 28 is_stmt 0       # MatrixMult.c:91:28
	movq	-8(%rdi,%rax,8), %rax
	.loc	1 88 5 is_stmt 1        # MatrixMult.c:88:5
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
.Ltmp95:
	.loc	1 93 5                  # MatrixMult.c:93:5
	xorl	%eax, %eax
	addq	$64, %rsp
	popq	%rbx
.Ltmp96:
	popq	%r14
.Ltmp97:
	popq	%r15
.Ltmp98:
	retq
.Ltmp99:
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
	.byte	16                      # 16
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
	.byte	8                       # 8
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
	.quad	.Ltmp46-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	48                      # 48
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	16                      # 16
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	113                     # DW_OP_breg1
	.byte	0                       # 0
	.quad	.Ltmp83-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	84                      # super-register DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp86-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp92-.Lfunc_begin0
	.quad	.Ltmp93-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	84                      # super-register DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp94-.Lfunc_begin0
	.quad	.Ltmp95-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	81                      # super-register DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp90-.Lfunc_begin0
	.quad	.Ltmp96-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp98-.Lfunc_begin0
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
	.byte	66                      # DW_AT_decl_line
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
	.byte	47                      # DW_AT_decl_line
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
	.byte	73                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	516                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	5                       # Abbrev [5] 0x170:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc9            # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	73                      # DW_AT_decl_line
	.long	516                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x17f:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	73                      # DW_AT_decl_line
	.long	523                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x18e:0xf DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	75                      # DW_AT_decl_line
	.long	516                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x19d:0xf DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	79                      # DW_AT_decl_line
	.long	459                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x1ac:0xf DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	80                      # DW_AT_decl_line
	.long	459                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x1bb:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	82                      # DW_AT_decl_line
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
