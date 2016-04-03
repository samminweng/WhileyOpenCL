	.text
	.file	"MatrixMult.openmp.disablevc.ll"
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
	movl	%ecx, 36(%rsp)          # 4-byte Spill
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
	cmpl	$7, 36(%rsp)            # 4-byte Folded Reload
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
.LBB0_8:                                # %polly.parallel.for
	movq	8(%rsp), %rbp           # 8-byte Reload
	movslq	%ebp, %r8
	decq	%r8
	sarq	$5, %r8
	movl	%ebp, 40(%rsp)
	movq	16(%rsp), %r15          # 8-byte Reload
	movl	%r15d, 44(%rsp)
	movq	24(%rsp), %rbx          # 8-byte Reload
	movq	%rbx, 48(%rsp)
	incq	%r8
	leaq	40(%rsp), %r14
	movl	$init_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r14, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%r14, %rdi
	callq	init_polly_subfn
	callq	GOMP_parallel_end
	.loc	1 30 17 discriminator 1 # MatrixMult.c:30:17
	movl	$16, %edi
	callq	malloc
.Ltmp28:
	#DEBUG_VALUE: init:m <- %RAX
	.loc	1 31 13                 # MatrixMult.c:31:13
	movq	%rbx, (%rax)
	.loc	1 32 14                 # MatrixMult.c:32:14
	movl	%r15d, 8(%rax)
	.loc	1 33 15                 # MatrixMult.c:33:15
	movl	%ebp, 12(%rax)
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
	subq	$104, %rsp
.Ltmp36:
	.cfi_def_cfa_offset 160
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
	movl	8(%rsi), %r13d
.Ltmp43:
	.loc	1 51 2 discriminator 1  # MatrixMult.c:51:2
	movslq	12(%rdi), %rbp
.Ltmp44:
	#DEBUG_VALUE: matmult:width <- %R13D
	.loc	1 42 28                 # MatrixMult.c:42:28
	movq	(%rdi), %rax
.Ltmp45:
	#DEBUG_VALUE: matmult:a_data <- [%RSP+0]
	.loc	1 43 28                 # MatrixMult.c:43:28
	movq	%rax, (%rsp)            # 8-byte Spill
	movq	(%rsi), %r12
.Ltmp46:
	#DEBUG_VALUE: matmult:b_data <- %R12
	.loc	1 46 45                 # MatrixMult.c:46:45
	movl	%ebp, %eax
	imull	%r13d, %eax
	.loc	1 46 39 is_stmt 0       # MatrixMult.c:46:39
	movslq	%eax, %r14
	.loc	1 46 51                 # MatrixMult.c:46:51
	shlq	$3, %r14
	.loc	1 46 32 discriminator 1 # MatrixMult.c:46:32
	movq	%r14, %rdi
.Ltmp47:
	callq	malloc
.Ltmp48:
	movq	%rax, %rbx
	.loc	1 48 22 is_stmt 1 discriminator 1 # MatrixMult.c:48:22
	movq	%r14, %rdi
	callq	malloc
	.loc	1 41 21                 # MatrixMult.c:41:21
	testq	%rbp, %rbp
.Ltmp49:
	#DEBUG_VALUE: matmult:j <- 0
	.loc	1 51 2 discriminator 1  # MatrixMult.c:51:2
	movslq	%r13d, %r15
	leaq	-1(%r15), %r14
	jle	.LBB1_1
.Ltmp50:
# BB#2:                                 # %for.cond11.preheader.lr.ph
	#DEBUG_VALUE: matmult:b_data <- %R12
	#DEBUG_VALUE: matmult:width <- %R13D
	imulq	%r15, %r14
	addq	%rbp, %r14
	leaq	(%r12,%r14,8), %rcx
	cmpq	%rax, %rcx
	setbe	%dl
	leaq	-1(%rbp), %r8
	movq	%r8, %rcx
	imulq	%rbp, %rcx
	addq	%r15, %rcx
	leaq	(%rax,%rcx,8), %rcx
	cmpq	%r12, %rcx
	setbe	%cl
	cmpl	%r15d, %ebp
	jne	.LBB1_4
.Ltmp51:
# BB#3:                                 # %for.cond11.preheader.lr.ph
	#DEBUG_VALUE: matmult:width <- %R13D
	#DEBUG_VALUE: matmult:b_data <- %R12
	orb	%cl, %dl
	je	.LBB1_4
.Ltmp52:
# BB#28:                                # %polly.parallel.for191
	#DEBUG_VALUE: matmult:b_data <- %R12
	#DEBUG_VALUE: matmult:width <- %R13D
	sarq	$5, %r8
	movl	%r13d, 16(%rsp)
	movl	%r13d, 20(%rsp)
	movq	%r12, 24(%rsp)
	movq	%rax, 32(%rsp)
	incq	%r8
	leaq	16(%rsp), %rsi
	movq	%rax, %r12
.Ltmp53:
	movl	$matmult_polly_subfn_5, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	leaq	16(%rsp), %rdi
	callq	matmult_polly_subfn_5
	callq	GOMP_parallel_end
	movq	%r12, %rax
	jmp	.LBB1_13
.Ltmp54:
.LBB1_1:                                # %entry.polly.split_new_and_old_crit_edge
	#DEBUG_VALUE: matmult:b_data <- %R12
	#DEBUG_VALUE: matmult:width <- %R13D
	imulq	%r15, %r14
	addq	%rbp, %r14
	jmp	.LBB1_13
.Ltmp55:
.LBB1_4:                                # %for.cond11.preheader.preheader
	#DEBUG_VALUE: matmult:width <- %R13D
	#DEBUG_VALUE: matmult:b_data <- %R12
	.loc	1 53 3 discriminator 1  # MatrixMult.c:53:3
	testl	%r13d, %r13d
	jle	.LBB1_13
.Ltmp56:
# BB#5:                                 # %for.cond11.preheader.us.preheader
	#DEBUG_VALUE: matmult:b_data <- %R12
	#DEBUG_VALUE: matmult:width <- %R13D
	movq	%r14, 56(%rsp)          # 8-byte Spill
.Ltmp57:
	.loc	1 54 9                  # MatrixMult.c:54:9
	leal	-1(%r13), %ecx
	.loc	1 54 30 is_stmt 0       # MatrixMult.c:54:30
	movl	%ecx, 52(%rsp)          # 4-byte Spill
	movl	%r13d, %ecx
	andl	$3, %ecx
	.loc	1 54 9                  # MatrixMult.c:54:9
	leaq	(,%rbp,8), %rdx
	movq	%rdx, 80(%rsp)          # 8-byte Spill
	movq	%rbp, 8(%rsp)           # 8-byte Spill
	leaq	(,%r15,8), %rsi
	movq	%r15, %r14
	shlq	$5, %r14
	xorl	%ebp, %ebp
	movq	%r12, %rdx
	movq	%r12, 72(%rsp)          # 8-byte Spill
	movq	%rax, %r12
.Ltmp58:
	movq	%rax, 64(%rsp)          # 8-byte Spill
	xorl	%edi, %edi
.Ltmp59:
	.p2align	4, 0x90
.LBB1_6:                                # %for.cond11.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_7 Depth 2
                                        #     Child Loop BB1_10 Depth 2
	movq	%rdi, 88(%rsp)          # 8-byte Spill
	movq	%rdx, 96(%rsp)          # 8-byte Spill
	movq	%rbp, %r8
	testl	%ecx, %ecx
	movq	%rdx, %rax
	movq	%r12, %rbp
	movl	$0, %edx
	je	.LBB1_8
	.p2align	4, 0x90
.LBB1_7:                                # %for.body14.us.prol
                                        #   Parent Loop BB1_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 54 22                 # MatrixMult.c:54:22
	movq	(%rax), %rdi
	.loc	1 54 20                 # MatrixMult.c:54:20
	movq	%rdi, (%rbp)
.Ltmp60:
	.loc	1 53 3 is_stmt 1 discriminator 1 # MatrixMult.c:53:3
	incq	%rdx
	addq	$8, %rbp
	addq	%rsi, %rax
	cmpl	%edx, %ecx
	jne	.LBB1_7
.LBB1_8:                                # %for.cond11.preheader.us.split
                                        #   in Loop: Header=BB1_6 Depth=1
	cmpl	$3, 52(%rsp)            # 4-byte Folded Reload
	movq	%r8, %rbp
	jb	.LBB1_11
# BB#9:                                 # %for.cond11.preheader.us.split.split
                                        #   in Loop: Header=BB1_6 Depth=1
.Ltmp61:
	.loc	1 54 30                 # MatrixMult.c:54:30
	leaq	3(%rdx), %rax
	imulq	%r15, %rax
	movq	72(%rsp), %rdi          # 8-byte Reload
	leaq	(%rdi,%rax,8), %r8
	leaq	2(%rdx), %rax
	imulq	%r15, %rax
	leaq	(%rdi,%rax,8), %r9
	leaq	1(%rdx), %rax
	imulq	%r15, %rax
	leaq	(%rdi,%rax,8), %r10
	movq	%r15, %rax
	imulq	%rdx, %rax
	leaq	(%rdi,%rax,8), %r11
	movq	%rbp, %rax
	.p2align	4, 0x90
.LBB1_10:                               # %for.body14.us
                                        #   Parent Loop BB1_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 54 22 is_stmt 0       # MatrixMult.c:54:22
	movq	(%r11,%rax), %rdi
	.loc	1 54 20                 # MatrixMult.c:54:20
	movq	%rdi, (%r12,%rdx,8)
	.loc	1 54 22                 # MatrixMult.c:54:22
	movq	(%r10,%rax), %rdi
	.loc	1 54 20                 # MatrixMult.c:54:20
	movq	%rdi, 8(%r12,%rdx,8)
	.loc	1 54 22                 # MatrixMult.c:54:22
	movq	(%r9,%rax), %rdi
	.loc	1 54 20                 # MatrixMult.c:54:20
	movq	%rdi, 16(%r12,%rdx,8)
	.loc	1 54 22                 # MatrixMult.c:54:22
	movq	(%r8,%rax), %rdi
	.loc	1 54 20                 # MatrixMult.c:54:20
	movq	%rdi, 24(%r12,%rdx,8)
.Ltmp62:
	.loc	1 53 3 is_stmt 1 discriminator 1 # MatrixMult.c:53:3
	addq	$4, %rdx
	addq	%r14, %rax
	cmpl	%edx, %r13d
	jne	.LBB1_10
.Ltmp63:
.LBB1_11:                               # %for.inc20.loopexit.us
                                        #   in Loop: Header=BB1_6 Depth=1
	movq	88(%rsp), %rdi          # 8-byte Reload
	.loc	1 51 2 discriminator 1  # MatrixMult.c:51:2
	incq	%rdi
	addq	80(%rsp), %r12          # 8-byte Folded Reload
	movq	96(%rsp), %rdx          # 8-byte Reload
	addq	$8, %rdx
	addq	$8, %rbp
	movq	8(%rsp), %rax           # 8-byte Reload
	cmpl	%eax, %edi
	jne	.LBB1_6
.Ltmp64:
# BB#12:
	movq	8(%rsp), %rbp           # 8-byte Reload
	movq	64(%rsp), %rax          # 8-byte Reload
	movq	56(%rsp), %r14          # 8-byte Reload
.LBB1_13:                               # %polly.split_new_and_old
	movq	%rbp, 8(%rsp)           # 8-byte Spill
	movq	%r15, %rcx
	imulq	%rcx, %rcx
	movq	(%rsp), %rdx            # 8-byte Reload
	leaq	(%rdx,%rcx,8), %rcx
	cmpq	%rbx, %rcx
	setbe	%sil
	leaq	(%rbx,%r14,8), %rcx
	cmpq	%rdx, %rcx
	setbe	%cl
	cmpl	%ebp, %r13d
	jl	.LBB1_15
# BB#14:                                # %polly.split_new_and_old
	orb	%cl, %sil
	je	.LBB1_15
# BB#27:                                # %polly.parallel.for
	movq	%rbp, %r15
	decq	%r15
	sarq	$5, %r15
	movl	%ebp, 16(%rsp)
	movl	%r13d, 20(%rsp)
	movq	%rbx, 24(%rsp)
	incq	%r15
	leaq	16(%rsp), %r12
	movq	%rax, %r14
	movl	$matmult_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r12, %rsi
	movq	%r15, %r8
	callq	GOMP_parallel_loop_runtime_start
	movq	%r12, %rdi
	callq	matmult_polly_subfn
	callq	GOMP_parallel_end
	movl	%ebp, 16(%rsp)
	movl	%r13d, 20(%rsp)
	movq	%rbx, 24(%rsp)
	movq	(%rsp), %rax            # 8-byte Reload
	movq	%rax, 32(%rsp)
	movq	%r14, 40(%rsp)
	leaq	16(%rsp), %r14
	movl	$matmult_polly_subfn_4, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r14, %rsi
	movq	%r15, %r8
	callq	GOMP_parallel_loop_runtime_start
	movq	%r14, %rdi
	callq	matmult_polly_subfn_4
	callq	GOMP_parallel_end
	jmp	.LBB1_26
.LBB1_15:                               # %for.cond23.preheader
	movq	%rax, %r12
.Ltmp65:
	.loc	1 57 2 discriminator 1  # MatrixMult.c:57:2
	testl	%ebp, %ebp
	jle	.LBB1_26
# BB#16:                                # %for.cond23.preheader
	testl	%r13d, %r13d
	jle	.LBB1_26
# BB#17:                                # %for.cond27.preheader.us.preheader
.Ltmp66:
	.loc	1 62 23                 # MatrixMult.c:62:23
	movl	%r13d, %r8d
	andl	$1, %r8d
	xorl	%r9d, %r9d
.Ltmp67:
	.p2align	4, 0x90
.LBB1_18:                               # %for.cond27.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_19 Depth 2
                                        #       Child Loop BB1_23 Depth 3
	movl	$1, %r10d
	xorl	%r11d, %r11d
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB1_19:                               # %for.body30.us.us
                                        #   Parent Loop BB1_18 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_23 Depth 3
	.loc	1 60 10                 # MatrixMult.c:60:10
	movq	%r14, %rcx
	imulq	%r15, %rcx
	.loc	1 60 16 is_stmt 0       # MatrixMult.c:60:16
	leaq	(%rcx,%r9), %rbp
	testl	%r8d, %r8d
	.loc	1 60 20                 # MatrixMult.c:60:20
	movq	$0, (%rbx,%rbp,8)
.Ltmp68:
	#DEBUG_VALUE: matmult:k <- 0
	movl	$0, %eax
	movl	$0, %esi
	je	.LBB1_21
# BB#20:                                # %for.body38.us.us.prol
                                        #   in Loop: Header=BB1_19 Depth=2
.Ltmp69:
	.loc	1 62 59 is_stmt 1       # MatrixMult.c:62:59
	movq	(%r12,%rcx,8), %rax
	.loc	1 62 58 is_stmt 0       # MatrixMult.c:62:58
	movq	(%rsp), %rdx            # 8-byte Reload
	imulq	(%rdx,%rcx,8), %rax
	.loc	1 62 21                 # MatrixMult.c:62:21
	movq	%rax, (%rbx,%rbp,8)
	movl	$1, %esi
.LBB1_21:                               # %for.body30.us.us.split
                                        #   in Loop: Header=BB1_19 Depth=2
	cmpl	$1, %r13d
	je	.LBB1_24
# BB#22:                                # %for.body30.us.us.split.split
                                        #   in Loop: Header=BB1_19 Depth=2
	.loc	1 62 23                 # MatrixMult.c:62:23
	movl	%r13d, %ecx
	subl	%esi, %ecx
	leaq	(%rsi,%r11), %rdx
	leaq	(%r12,%rdx,8), %rdx
	addq	%r10, %rsi
	movq	(%rsp), %rdi            # 8-byte Reload
	leaq	(%rdi,%rsi,8), %rsi
	.p2align	4, 0x90
.LBB1_23:                               # %for.body38.us.us
                                        #   Parent Loop BB1_18 Depth=1
                                        #     Parent Loop BB1_19 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	.loc	1 62 59                 # MatrixMult.c:62:59
	movq	(%rdx), %rdi
	.loc	1 62 58                 # MatrixMult.c:62:58
	imulq	-8(%rsi), %rdi
	.loc	1 62 39                 # MatrixMult.c:62:39
	addq	%rax, %rdi
	.loc	1 62 21                 # MatrixMult.c:62:21
	movq	%rdi, (%rbx,%rbp,8)
	.loc	1 62 59                 # MatrixMult.c:62:59
	movq	8(%rdx), %rax
	.loc	1 62 58                 # MatrixMult.c:62:58
	imulq	(%rsi), %rax
	.loc	1 62 39                 # MatrixMult.c:62:39
	addq	%rdi, %rax
	.loc	1 62 21                 # MatrixMult.c:62:21
	movq	%rax, (%rbx,%rbp,8)
.Ltmp70:
	.loc	1 61 4 is_stmt 1 discriminator 1 # MatrixMult.c:61:4
	addq	$16, %rdx
	addq	$16, %rsi
	addl	$-2, %ecx
	jne	.LBB1_23
.Ltmp71:
.LBB1_24:                               # %for.inc60.loopexit.us.us
                                        #   in Loop: Header=BB1_19 Depth=2
	.loc	1 59 3 discriminator 1  # MatrixMult.c:59:3
	incq	%r14
	addq	%r15, %r11
	addq	%r15, %r10
	cmpl	%r13d, %r14d
	jne	.LBB1_19
.Ltmp72:
# BB#25:                                # %for.inc63.loopexit.us-lcssa.us.us
                                        #   in Loop: Header=BB1_18 Depth=1
	.loc	1 57 2 discriminator 1  # MatrixMult.c:57:2
	incq	%r9
	movq	8(%rsp), %rbp           # 8-byte Reload
	cmpl	%ebp, %r9d
	jne	.LBB1_18
.Ltmp73:
.LBB1_26:                               # %for.end65
	.loc	1 68 17 discriminator 1 # MatrixMult.c:68:17
	movl	$16, %edi
	callq	malloc
.Ltmp74:
	#DEBUG_VALUE: matmult:m <- %RAX
	.loc	1 69 14                 # MatrixMult.c:69:14
	movl	%r13d, 8(%rax)
	.loc	1 70 15                 # MatrixMult.c:70:15
	movl	%ebp, 12(%rax)
	.loc	1 71 13                 # MatrixMult.c:71:13
	movq	%rbx, (%rax)
	.loc	1 72 5                  # MatrixMult.c:72:5
	addq	$104, %rsp
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

	.p2align	4, 0x90
	.type	init_polly_subfn,@function
init_polly_subfn:                       # @init_polly_subfn
.Lfunc_begin3:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Ltmp104:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp105:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp106:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp107:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp108:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp109:
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
.Ltmp110:
	.cfi_def_cfa_offset 112
.Ltmp111:
	.cfi_offset %rbx, -56
.Ltmp112:
	.cfi_offset %r12, -48
.Ltmp113:
	.cfi_offset %r13, -40
.Ltmp114:
	.cfi_offset %r14, -32
.Ltmp115:
	.cfi_offset %r15, -24
.Ltmp116:
	.cfi_offset %rbp, -16
	movslq	(%rdi), %rax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movslq	4(%rdi), %r13
	movq	8(%rdi), %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	leaq	24(%rsp), %rdi
	leaq	16(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB3_2
# BB#1:                                 # %polly.par.loadIVBounds.preheader
	leaq	-1(%r13), %r12
	sarq	$5, %r12
	movq	%r13, %rax
	shlq	$8, %rax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	leaq	(,%r13,8), %r15
	.p2align	4, 0x90
.LBB3_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_5 Depth 2
                                        #       Child Loop BB3_8 Depth 3
                                        #         Child Loop BB3_10 Depth 4
                                        #           Child Loop BB3_11 Depth 5
	movq	16(%rsp), %rax
	movq	24(%rsp), %r10
	addq	$-2, %rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	8(%rsp), %r9            # 8-byte Reload
	imulq	%r10, %r9
	addq	32(%rsp), %r9           # 8-byte Folded Reload
	.p2align	4, 0x90
.LBB3_5:                                # %polly.loop_header
                                        #   Parent Loop BB3_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_8 Depth 3
                                        #         Child Loop BB3_10 Depth 4
                                        #           Child Loop BB3_11 Depth 5
	testq	%r12, %r12
	js	.LBB3_14
# BB#6:                                 # %polly.loop_header2.preheader
                                        #   in Loop: Header=BB3_5 Depth=2
	movq	%r10, %rsi
	shlq	$5, %rsi
	movq	40(%rsp), %rdi          # 8-byte Reload
	subq	%rsi, %rdi
	decq	%rdi
	cmpq	$31, %rdi
	movl	$31, %eax
	cmovgq	%rax, %rdi
	testq	%rdi, %rdi
	js	.LBB3_14
# BB#7:                                 #   in Loop: Header=BB3_5 Depth=2
	decq	%rdi
	movq	%r9, %r11
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB3_8:                                # %polly.loop_header2.us
                                        #   Parent Loop BB3_4 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB3_10 Depth 4
                                        #           Child Loop BB3_11 Depth 5
	movq	%rdx, %rax
	shlq	$5, %rax
	movq	%r13, %rbp
	subq	%rax, %rbp
	decq	%rbp
	cmpq	$31, %rbp
	movl	$31, %ecx
	cmovleq	%rbp, %rcx
	testq	%rcx, %rcx
	js	.LBB3_13
# BB#9:                                 #   in Loop: Header=BB3_8 Depth=3
	decq	%rcx
	movq	%r11, %r8
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB3_10:                               # %polly.loop_header10.us.us
                                        #   Parent Loop BB3_4 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        #       Parent Loop BB3_8 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB3_11 Depth 5
	leaq	(%rbp,%rsi), %rax
	movq	$-1, %r14
	movq	%r8, %rbx
	.p2align	4, 0x90
.LBB3_11:                               # %polly.loop_header19.us.us
                                        #   Parent Loop BB3_4 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        #       Parent Loop BB3_8 Depth=3
                                        #         Parent Loop BB3_10 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	addq	%rax, (%rbx)
	incq	%r14
	addq	$8, %rbx
	cmpq	%rcx, %r14
	jle	.LBB3_11
# BB#12:                                # %polly.loop_exit21.loopexit.us.us
                                        #   in Loop: Header=BB3_10 Depth=4
	addq	%r15, %r8
	cmpq	%rdi, %rbp
	leaq	1(%rbp), %rbp
	jle	.LBB3_10
.LBB3_13:                               # %polly.loop_exit12.loopexit.us
                                        #   in Loop: Header=BB3_8 Depth=3
	addq	$256, %r11              # imm = 0x100
	cmpq	%r12, %rdx
	leaq	1(%rdx), %rdx
	jne	.LBB3_8
.LBB3_14:                               # %polly.loop_exit4
                                        #   in Loop: Header=BB3_5 Depth=2
	addq	8(%rsp), %r9            # 8-byte Folded Reload
	cmpq	48(%rsp), %r10          # 8-byte Folded Reload
	leaq	1(%r10), %r10
	jle	.LBB3_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB3_4 Depth=1
	leaq	24(%rsp), %rdi
	leaq	16(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB3_4
.LBB3_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end3:
	.size	init_polly_subfn, .Lfunc_end3-init_polly_subfn
	.cfi_endproc

	.p2align	4, 0x90
	.type	matmult_polly_subfn,@function
matmult_polly_subfn:                    # @matmult_polly_subfn
.Lfunc_begin4:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Ltmp117:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp118:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp119:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp120:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp121:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp122:
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
.Ltmp123:
	.cfi_def_cfa_offset 96
.Ltmp124:
	.cfi_offset %rbx, -56
.Ltmp125:
	.cfi_offset %r12, -48
.Ltmp126:
	.cfi_offset %r13, -40
.Ltmp127:
	.cfi_offset %r14, -32
.Ltmp128:
	.cfi_offset %r15, -24
.Ltmp129:
	.cfi_offset %rbp, -16
	movslq	(%rdi), %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movslq	4(%rdi), %r13
	movq	8(%rdi), %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB4_2
# BB#1:                                 # %polly.par.loadIVBounds.preheader
	leaq	-1(%r13), %r12
	sarq	$5, %r12
	movq	%r13, %r14
	shlq	$8, %r14
	leaq	(,%r13,8), %r15
	.p2align	4, 0x90
.LBB4_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_5 Depth 2
                                        #       Child Loop BB4_8 Depth 3
                                        #         Child Loop BB4_10 Depth 4
                                        #           Child Loop BB4_11 Depth 5
	movq	8(%rsp), %r8
	movq	16(%rsp), %r10
	addq	$-2, %r8
	movq	%r10, %r9
	shlq	$8, %r9
	addq	24(%rsp), %r9           # 8-byte Folded Reload
	.p2align	4, 0x90
.LBB4_5:                                # %polly.loop_header
                                        #   Parent Loop BB4_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_8 Depth 3
                                        #         Child Loop BB4_10 Depth 4
                                        #           Child Loop BB4_11 Depth 5
	testq	%r12, %r12
	js	.LBB4_14
# BB#6:                                 # %polly.loop_header3.preheader
                                        #   in Loop: Header=BB4_5 Depth=2
	movq	%r10, %rax
	shlq	$5, %rax
	movq	32(%rsp), %rsi          # 8-byte Reload
	subq	%rax, %rsi
	decq	%rsi
	cmpq	$31, %rsi
	movl	$31, %eax
	cmovgq	%rax, %rsi
	testq	%rsi, %rsi
	js	.LBB4_14
# BB#7:                                 #   in Loop: Header=BB4_5 Depth=2
	decq	%rsi
	movq	%r9, %r11
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB4_8:                                # %polly.loop_header3.us
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB4_10 Depth 4
                                        #           Child Loop BB4_11 Depth 5
	movq	%rax, %rcx
	shlq	$5, %rcx
	movq	%r13, %rdi
	subq	%rcx, %rdi
	decq	%rdi
	cmpq	$31, %rdi
	movl	$31, %edx
	cmovleq	%rdi, %rdx
	testq	%rdx, %rdx
	js	.LBB4_13
# BB#9:                                 #   in Loop: Header=BB4_8 Depth=3
	decq	%rdx
	movq	%r11, %rdi
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB4_10:                               # %polly.loop_header11.us.us
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_8 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB4_11 Depth 5
	movq	$-1, %rbp
	movq	%rdi, %rcx
	.p2align	4, 0x90
.LBB4_11:                               # %polly.loop_header20.us.us
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_8 Depth=3
                                        #         Parent Loop BB4_10 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movq	$0, (%rcx)
	incq	%rbp
	addq	%r15, %rcx
	cmpq	%rdx, %rbp
	jle	.LBB4_11
# BB#12:                                # %polly.loop_exit22.loopexit.us.us
                                        #   in Loop: Header=BB4_10 Depth=4
	addq	$8, %rdi
	cmpq	%rsi, %rbx
	leaq	1(%rbx), %rbx
	jle	.LBB4_10
.LBB4_13:                               # %polly.loop_exit13.loopexit.us
                                        #   in Loop: Header=BB4_8 Depth=3
	addq	%r14, %r11
	cmpq	%r12, %rax
	leaq	1(%rax), %rax
	jne	.LBB4_8
.LBB4_14:                               # %polly.loop_exit5
                                        #   in Loop: Header=BB4_5 Depth=2
	addq	$256, %r9               # imm = 0x100
	cmpq	%r8, %r10
	leaq	1(%r10), %r10
	jle	.LBB4_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB4_4 Depth=1
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB4_4
.LBB4_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end4:
	.size	matmult_polly_subfn, .Lfunc_end4-matmult_polly_subfn
	.cfi_endproc

	.p2align	4, 0x90
	.type	matmult_polly_subfn_4,@function
matmult_polly_subfn_4:                  # @matmult_polly_subfn_4
.Lfunc_begin5:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Ltmp130:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp131:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp132:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp133:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp134:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp135:
	.cfi_def_cfa_offset 56
	subq	$184, %rsp
.Ltmp136:
	.cfi_def_cfa_offset 240
.Ltmp137:
	.cfi_offset %rbx, -56
.Ltmp138:
	.cfi_offset %r12, -48
.Ltmp139:
	.cfi_offset %r13, -40
.Ltmp140:
	.cfi_offset %r14, -32
.Ltmp141:
	.cfi_offset %r15, -24
.Ltmp142:
	.cfi_offset %rbp, -16
	movslq	(%rdi), %rax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movslq	4(%rdi), %rbp
	movq	8(%rdi), %rbx
	movq	16(%rdi), %rax
	movq	%rax, 88(%rsp)          # 8-byte Spill
	movq	24(%rdi), %rax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	leaq	72(%rsp), %rdi
	leaq	64(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB5_2
# BB#1:                                 # %polly.par.loadIVBounds.lr.ph
	movq	%rbp, 24(%rsp)          # 8-byte Spill
	leaq	-1(%rbp), %rax
	movq	%rax, %rcx
	shrq	$5, %rcx
	movq	%rcx, 152(%rsp)         # 8-byte Spill
	sarq	$5, %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	%rbp, %rax
	shlq	$8, %rax
	movq	%rax, 112(%rsp)         # 8-byte Spill
	leaq	(,%rbp,8), %r14
	.p2align	4, 0x90
.LBB5_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_5 Depth 2
                                        #       Child Loop BB5_7 Depth 3
                                        #         Child Loop BB5_8 Depth 4
                                        #           Child Loop BB5_11 Depth 5
                                        #             Child Loop BB5_13 Depth 6
                                        #               Child Loop BB5_14 Depth 7
	movq	64(%rsp), %rax
	movq	72(%rsp), %rcx
	movq	%rcx, (%rsp)            # 8-byte Spill
	addq	$-2, %rax
	movq	%rax, 104(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB5_5:                                # %polly.loop_header
                                        #   Parent Loop BB5_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_7 Depth 3
                                        #         Child Loop BB5_8 Depth 4
                                        #           Child Loop BB5_11 Depth 5
                                        #             Child Loop BB5_13 Depth 6
                                        #               Child Loop BB5_14 Depth 7
	cmpq	$0, 32(%rsp)            # 8-byte Folded Reload
	js	.LBB5_19
# BB#6:                                 # %polly.loop_header4.preheader
                                        #   in Loop: Header=BB5_5 Depth=2
	movq	(%rsp), %rax            # 8-byte Reload
	shlq	$5, %rax
	movq	%rax, 168(%rsp)         # 8-byte Spill
	movq	96(%rsp), %rcx          # 8-byte Reload
	subq	%rax, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovgq	%rax, %rcx
	movq	%rcx, 160(%rsp)         # 8-byte Spill
	leaq	-1(%rcx), %rax
	movq	%rax, 176(%rsp)         # 8-byte Spill
	movq	88(%rsp), %rcx          # 8-byte Reload
	movq	80(%rsp), %rdx          # 8-byte Reload
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB5_7:                                # %polly.loop_header4
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_8 Depth 4
                                        #           Child Loop BB5_11 Depth 5
                                        #             Child Loop BB5_13 Depth 6
                                        #               Child Loop BB5_14 Depth 7
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	%rdx, 128(%rsp)         # 8-byte Spill
	movq	%rcx, 136(%rsp)         # 8-byte Spill
	movq	%rax, %rbp
	shlq	$5, %rbp
	movq	24(%rsp), %rax          # 8-byte Reload
	subq	%rbp, %rax
	decq	%rax
	cmpq	$31, %rax
	movl	$31, %esi
	cmovleq	%rax, %rsi
	movq	%rsi, 144(%rsp)         # 8-byte Spill
	leaq	-1(%rsi), %r8
	movq	%rcx, 48(%rsp)          # 8-byte Spill
	movq	%rdx, 40(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	.p2align	4, 0x90
.LBB5_8:                                # %polly.loop_header11
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB5_11 Depth 5
                                        #             Child Loop BB5_13 Depth 6
                                        #               Child Loop BB5_14 Depth 7
	cmpq	$0, 160(%rsp)           # 8-byte Folded Reload
	js	.LBB5_17
# BB#9:                                 # %polly.loop_header19.preheader
                                        #   in Loop: Header=BB5_8 Depth=4
	movq	8(%rsp), %rax           # 8-byte Reload
	shlq	$5, %rax
	movq	24(%rsp), %rcx          # 8-byte Reload
	subq	%rax, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovleq	%rcx, %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	cmpq	$0, 144(%rsp)           # 8-byte Folded Reload
	js	.LBB5_17
# BB#10:                                #   in Loop: Header=BB5_8 Depth=4
	movq	56(%rsp), %rax          # 8-byte Reload
	decq	%rax
	xorl	%ecx, %ecx
	movq	%rcx, 16(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB5_11:                               # %polly.loop_header19.us
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        #         Parent Loop BB5_8 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB5_13 Depth 6
                                        #               Child Loop BB5_14 Depth 7
	cmpq	$0, 56(%rsp)            # 8-byte Folded Reload
	js	.LBB5_16
# BB#12:                                #   in Loop: Header=BB5_11 Depth=5
	movq	168(%rsp), %rcx         # 8-byte Reload
	movq	16(%rsp), %rdx          # 8-byte Reload
	leaq	(%rdx,%rcx), %rcx
	movq	48(%rsp), %r11          # 8-byte Reload
	movq	40(%rsp), %r15          # 8-byte Reload
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB5_13:                               # %polly.loop_header28.us.us
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        #         Parent Loop BB5_8 Depth=4
                                        #           Parent Loop BB5_11 Depth=5
                                        # =>          This Loop Header: Depth=6
                                        #               Child Loop BB5_14 Depth 7
	leaq	(%r10,%rbp), %rdi
	imulq	24(%rsp), %rdi          # 8-byte Folded Reload
	addq	%rcx, %rdi
	movq	(%rbx,%rdi,8), %r9
	movq	$-1, %r12
	movq	%r11, %rsi
	movq	%r15, %rdx
	.p2align	4, 0x90
.LBB5_14:                               # %polly.loop_header37.us.us
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        #         Parent Loop BB5_8 Depth=4
                                        #           Parent Loop BB5_11 Depth=5
                                        #             Parent Loop BB5_13 Depth=6
                                        # =>            This Inner Loop Header: Depth=7
	movq	(%rdx), %r13
	.loc	1 62 58                 # MatrixMult.c:62:58
	imulq	(%rsi), %r13
	.loc	1 62 39 is_stmt 0       # MatrixMult.c:62:39
	addq	%r13, %r9
	incq	%r12
	addq	$8, %rdx
	addq	$8, %rsi
	cmpq	%rax, %r12
	jle	.LBB5_14
# BB#15:                                # %polly.loop_exit39.loopexit.us.us
                                        #   in Loop: Header=BB5_13 Depth=6
	movq	%r9, (%rbx,%rdi,8)
	addq	%r14, %r15
	addq	%r14, %r11
	cmpq	%r8, %r10
	leaq	1(%r10), %r10
	jle	.LBB5_13
.LBB5_16:                               # %polly.loop_exit30.loopexit.us
                                        #   in Loop: Header=BB5_11 Depth=5
	movq	16(%rsp), %rcx          # 8-byte Reload
	cmpq	176(%rsp), %rcx         # 8-byte Folded Reload
	leaq	1(%rcx), %rcx
	movq	%rcx, 16(%rsp)          # 8-byte Spill
	jle	.LBB5_11
.LBB5_17:                               # %polly.loop_exit21
                                        #   in Loop: Header=BB5_8 Depth=4
	addq	$256, 40(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	addq	$256, 48(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	movq	8(%rsp), %rax           # 8-byte Reload
	cmpq	152(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	jne	.LBB5_8
# BB#18:                                # %polly.loop_exit13
                                        #   in Loop: Header=BB5_7 Depth=3
	movq	112(%rsp), %rax         # 8-byte Reload
	movq	128(%rsp), %rdx         # 8-byte Reload
	addq	%rax, %rdx
	movq	136(%rsp), %rcx         # 8-byte Reload
	addq	%rax, %rcx
	movq	120(%rsp), %rax         # 8-byte Reload
	cmpq	32(%rsp), %rax          # 8-byte Folded Reload
	leaq	1(%rax), %rax
	jne	.LBB5_7
.LBB5_19:                               # %polly.loop_exit6
                                        #   in Loop: Header=BB5_5 Depth=2
	movq	(%rsp), %rax            # 8-byte Reload
	cmpq	104(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, (%rsp)            # 8-byte Spill
	jle	.LBB5_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB5_4 Depth=1
	leaq	72(%rsp), %rdi
	leaq	64(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB5_4
.LBB5_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$184, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end5:
	.size	matmult_polly_subfn_4, .Lfunc_end5-matmult_polly_subfn_4
	.cfi_endproc

	.p2align	4, 0x90
	.type	matmult_polly_subfn_5,@function
matmult_polly_subfn_5:                  # @matmult_polly_subfn_5
.Lfunc_begin6:
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
	subq	$104, %rsp
.Ltmp149:
	.cfi_def_cfa_offset 160
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
	movslq	(%rdi), %rbx
	movslq	4(%rdi), %rbp
	movq	8(%rdi), %rax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	16(%rdi), %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	leaq	48(%rsp), %rdi
	leaq	40(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB6_2
# BB#1:                                 # %polly.par.loadIVBounds.preheader
	movq	%rbx, 96(%rsp)          # 8-byte Spill
	leaq	-1(%rbx), %r14
	sarq	$5, %r14
	movq	%rbp, 72(%rsp)          # 8-byte Spill
	movq	%rbp, %rax
	shlq	$8, %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	leaq	(,%rbp,8), %r13
	movq	%rbx, %rax
	shlq	$8, %rax
	movq	%rax, 88(%rsp)          # 8-byte Spill
	leaq	(,%rbx,8), %r12
	.p2align	4, 0x90
.LBB6_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_5 Depth 2
                                        #       Child Loop BB6_8 Depth 3
                                        #         Child Loop BB6_10 Depth 4
                                        #           Child Loop BB6_11 Depth 5
	movq	40(%rsp), %rax
	movq	48(%rsp), %rcx
	movq	%rcx, 16(%rsp)          # 8-byte Spill
	addq	$-2, %rax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	24(%rsp), %rax          # 8-byte Reload
	imulq	%rcx, %rax
	addq	56(%rsp), %rax          # 8-byte Folded Reload
	movq	%rax, 8(%rsp)           # 8-byte Spill
	shlq	$8, %rcx
	addq	64(%rsp), %rcx          # 8-byte Folded Reload
	movq	%rcx, 32(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB6_5:                                # %polly.loop_header
                                        #   Parent Loop BB6_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_8 Depth 3
                                        #         Child Loop BB6_10 Depth 4
                                        #           Child Loop BB6_11 Depth 5
	testq	%r14, %r14
	js	.LBB6_14
# BB#6:                                 # %polly.loop_header4.preheader
                                        #   in Loop: Header=BB6_5 Depth=2
	movq	16(%rsp), %rax          # 8-byte Reload
	shlq	$5, %rax
	movq	72(%rsp), %rdi          # 8-byte Reload
	subq	%rax, %rdi
	decq	%rdi
	cmpq	$31, %rdi
	movl	$31, %eax
	cmovgq	%rax, %rdi
	testq	%rdi, %rdi
	js	.LBB6_14
# BB#7:                                 #   in Loop: Header=BB6_5 Depth=2
	decq	%rdi
	movq	32(%rsp), %rax          # 8-byte Reload
	movq	8(%rsp), %rdx           # 8-byte Reload
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB6_8:                                # %polly.loop_header4.us
                                        #   Parent Loop BB6_4 Depth=1
                                        #     Parent Loop BB6_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB6_10 Depth 4
                                        #           Child Loop BB6_11 Depth 5
	movq	%rsi, %rcx
	shlq	$5, %rcx
	movq	96(%rsp), %rbp          # 8-byte Reload
	subq	%rcx, %rbp
	decq	%rbp
	cmpq	$31, %rbp
	movl	$31, %ecx
	cmovleq	%rbp, %rcx
	testq	%rcx, %rcx
	js	.LBB6_13
# BB#9:                                 #   in Loop: Header=BB6_8 Depth=3
	decq	%rcx
	movq	%rax, %r11
	movq	%rdx, %rbp
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB6_10:                               # %polly.loop_header12.us.us
                                        #   Parent Loop BB6_4 Depth=1
                                        #     Parent Loop BB6_5 Depth=2
                                        #       Parent Loop BB6_8 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB6_11 Depth 5
	movq	$-1, %r10
	movq	%r11, %r15
	movq	%rbp, %r8
	.p2align	4, 0x90
.LBB6_11:                               # %polly.loop_header21.us.us
                                        #   Parent Loop BB6_4 Depth=1
                                        #     Parent Loop BB6_5 Depth=2
                                        #       Parent Loop BB6_8 Depth=3
                                        #         Parent Loop BB6_10 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movq	(%r15), %rbx
	movq	%rbx, (%r8)
	incq	%r10
	addq	$8, %r8
	addq	%r12, %r15
	cmpq	%rcx, %r10
	jle	.LBB6_11
# BB#12:                                # %polly.loop_exit23.loopexit.us.us
                                        #   in Loop: Header=BB6_10 Depth=4
	addq	%r13, %rbp
	addq	$8, %r11
	cmpq	%rdi, %r9
	leaq	1(%r9), %r9
	jle	.LBB6_10
.LBB6_13:                               # %polly.loop_exit14.loopexit.us
                                        #   in Loop: Header=BB6_8 Depth=3
	addq	$256, %rdx              # imm = 0x100
	addq	88(%rsp), %rax          # 8-byte Folded Reload
	cmpq	%r14, %rsi
	leaq	1(%rsi), %rsi
	jne	.LBB6_8
.LBB6_14:                               # %polly.loop_exit6
                                        #   in Loop: Header=BB6_5 Depth=2
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	24(%rsp), %rax          # 8-byte Folded Reload
	movq	%rax, 8(%rsp)           # 8-byte Spill
	addq	$256, 32(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	movq	16(%rsp), %rax          # 8-byte Reload
	cmpq	80(%rsp), %rax          # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	jle	.LBB6_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB6_4 Depth=1
	leaq	48(%rsp), %rdi
	leaq	40(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB6_4
.LBB6_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$104, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end6:
	.size	matmult_polly_subfn_5, .Lfunc_end6-matmult_polly_subfn_5
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
	.quad	.Ltmp59-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	93                      # super-register DW_OP_reg13
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	0                       # 0
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
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
