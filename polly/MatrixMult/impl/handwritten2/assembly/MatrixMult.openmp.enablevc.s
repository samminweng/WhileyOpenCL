	.text
	.file	"llvm/MatrixMult.openmp.enablevc.ll"
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
	movl	8(%rsi), %r14d
.Ltmp43:
	#DEBUG_VALUE: matmult:width <- %R14D
	movslq	12(%rdi), %rbp
	.loc	1 42 28                 # MatrixMult.c:42:28
	movq	%rbp, 48(%rsp)          # 8-byte Spill
	movq	(%rdi), %rax
.Ltmp44:
	#DEBUG_VALUE: matmult:a_data <- [%RSP+32]
	.loc	1 43 28                 # MatrixMult.c:43:28
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	(%rsi), %r12
.Ltmp45:
	#DEBUG_VALUE: matmult:b_data <- %R12
	.loc	1 46 45                 # MatrixMult.c:46:45
	movl	%ebp, %eax
	imull	%r14d, %eax
	.loc	1 46 39 is_stmt 0       # MatrixMult.c:46:39
	movslq	%eax, %rbx
	.loc	1 46 51                 # MatrixMult.c:46:51
	shlq	$3, %rbx
	.loc	1 46 32 discriminator 1 # MatrixMult.c:46:32
	movq	%rbx, %rdi
.Ltmp46:
	callq	malloc
.Ltmp47:
	movq	%rax, %r13
	.loc	1 47 22 is_stmt 1 discriminator 1 # MatrixMult.c:47:22
	movq	%rbx, %rdi
	callq	malloc
	.loc	1 41 21                 # MatrixMult.c:41:21
	testq	%rbp, %rbp
.Ltmp48:
	#DEBUG_VALUE: matmult:j <- 0
	.loc	1 49 2 discriminator 1  # MatrixMult.c:49:2
	movslq	%r14d, %r15
	jle	.LBB1_1
.Ltmp49:
# BB#2:                                 # %for.cond11.preheader.lr.ph
	#DEBUG_VALUE: matmult:b_data <- %R12
	#DEBUG_VALUE: matmult:width <- %R14D
	leaq	-1(%r15), %rbx
	imulq	%r15, %rbx
	addq	%rbp, %rbx
	leaq	(%r12,%rbx,8), %rcx
	cmpq	%rax, %rcx
	setbe	%dl
	movq	%rbp, %rcx
	imulq	%r15, %rcx
	leaq	(%rax,%rcx,8), %rcx
	cmpq	%r12, %rcx
	setbe	%cl
	cmpl	%ebp, %r15d
	movq	%r12, %rsi
	jl	.LBB1_4
.Ltmp50:
# BB#3:                                 # %for.cond11.preheader.lr.ph
	#DEBUG_VALUE: matmult:width <- %R14D
	#DEBUG_VALUE: matmult:b_data <- %R12
	orb	%cl, %dl
	je	.LBB1_4
.Ltmp51:
# BB#40:                                # %polly.parallel.for191
	#DEBUG_VALUE: matmult:b_data <- %R12
	#DEBUG_VALUE: matmult:width <- %R14D
	leaq	-1(%rbp), %r8
	sarq	$5, %r8
	movl	%r14d, 64(%rsp)
	movl	%ebp, 68(%rsp)
	movq	%rsi, 72(%rsp)
	movq	%rax, 80(%rsp)
	movq	%rax, 16(%rsp)          # 8-byte Spill
	incq	%r8
	leaq	64(%rsp), %r12
.Ltmp52:
	movl	$matmult_polly_subfn_5, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r12, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%r12, %rdi
	callq	matmult_polly_subfn_5
	callq	GOMP_parallel_end
	jmp	.LBB1_25
.Ltmp53:
.LBB1_1:                                # %entry.polly.split_new_and_old_crit_edge
	#DEBUG_VALUE: matmult:b_data <- %R12
	#DEBUG_VALUE: matmult:width <- %R14D
	movq	%rax, 16(%rsp)          # 8-byte Spill
	leaq	-1(%r15), %rbx
	imulq	%r15, %rbx
	addq	%rbp, %rbx
	jmp	.LBB1_25
.Ltmp54:
.LBB1_4:                                # %for.cond11.preheader.preheader
	#DEBUG_VALUE: matmult:width <- %R14D
	#DEBUG_VALUE: matmult:b_data <- %R12
	.loc	1 51 3 discriminator 1  # MatrixMult.c:51:3
	testl	%r14d, %r14d
	jle	.LBB1_5
.Ltmp55:
# BB#6:                                 # %for.cond11.preheader.us.preheader
	#DEBUG_VALUE: matmult:b_data <- %R12
	#DEBUG_VALUE: matmult:width <- %R14D
	movq	%rbx, 128(%rsp)         # 8-byte Spill
.Ltmp56:
	.loc	1 52 9                  # MatrixMult.c:52:9
	leal	-1(%r14), %ecx
	movq	%rcx, 176(%rsp)         # 8-byte Spill
	leaq	1(%rcx), %rdx
	movq	%rdx, 112(%rsp)         # 8-byte Spill
	leaq	(,%r15,8), %r8
	leaq	(,%rcx,8), %rcx
	.loc	1 52 29 is_stmt 0       # MatrixMult.c:52:29
	movq	%rcx, 168(%rsp)         # 8-byte Spill
	movabsq	$8589934588, %rdi       # imm = 0x1FFFFFFFC
	andq	%rdx, %rdi
	movq	%rdi, 96(%rsp)          # 8-byte Spill
	setne	%r9b
	.loc	1 52 9                  # MatrixMult.c:52:9
	leaq	-4(%rdi), %rdx
	shrq	$2, %rdx
	.loc	1 52 29                 # MatrixMult.c:52:29
	movq	%rdx, 160(%rsp)         # 8-byte Spill
	leal	1(%r14), %edi
	movl	%edi, 60(%rsp)          # 4-byte Spill
	cmpl	$1, %r14d
	sete	%cl
	andb	%r9b, %cl
	movb	%cl, 15(%rsp)           # 1-byte Spill
	.loc	1 52 21                 # MatrixMult.c:52:21
	andl	$1, %edx
	movq	%rdx, 152(%rsp)         # 8-byte Spill
	.loc	1 52 9                  # MatrixMult.c:52:9
	leaq	16(%rax), %rcx
	movq	%rcx, 144(%rsp)         # 8-byte Spill
	movq	%rax, 16(%rsp)          # 8-byte Spill
	leaq	16(%rsi), %rax
	movq	%rax, 136(%rsp)         # 8-byte Spill
	movq	%rsi, %rax
	movq	%r15, %rbx
	shlq	$5, %rbx
	movl	$4, %ecx
	movq	%rcx, 104(%rsp)         # 8-byte Spill
	xorl	%ecx, %ecx
	movq	%rcx, 120(%rsp)         # 8-byte Spill
	xorl	%ecx, %ecx
	movq	%rcx, 40(%rsp)          # 8-byte Spill
	xorl	%ecx, %ecx
	movq	%rcx, 24(%rsp)          # 8-byte Spill
.Ltmp57:
	.p2align	4, 0x90
.LBB1_7:                                # %for.cond11.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_15 Depth 2
                                        #     Child Loop BB1_19 Depth 2
                                        #     Child Loop BB1_22 Depth 2
	cmpq	$4, 112(%rsp)           # 8-byte Folded Reload
	movl	$0, %edx
	jb	.LBB1_17
# BB#8:                                 # %min.iters.checked
                                        #   in Loop: Header=BB1_7 Depth=1
	.loc	1 52 29                 # MatrixMult.c:52:29
	cmpb	$0, 15(%rsp)            # 1-byte Folded Reload
	movl	$0, %edx
	je	.LBB1_17
# BB#9:                                 # %vector.memcheck
                                        #   in Loop: Header=BB1_7 Depth=1
	.loc	1 52 9                  # MatrixMult.c:52:9
	movq	%r8, %rdx
	movq	24(%rsp), %rdi          # 8-byte Reload
	imulq	%rdi, %rdx
	movq	16(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rdx), %rcx
	movq	176(%rsp), %rsi         # 8-byte Reload
	leaq	(%rsi,%rdi), %rsi
	leaq	(%rax,%rsi,8), %rsi
	.loc	1 52 29                 # MatrixMult.c:52:29
	cmpq	%rsi, %rcx
	ja	.LBB1_11
# BB#10:                                # %vector.memcheck
                                        #   in Loop: Header=BB1_7 Depth=1
	.loc	1 52 9                  # MatrixMult.c:52:9
	addq	168(%rsp), %rdx         # 8-byte Folded Reload
	addq	16(%rsp), %rdx          # 8-byte Folded Reload
	movq	24(%rsp), %rcx          # 8-byte Reload
	leaq	(%rax,%rcx,8), %rcx
	cmpq	%rdx, %rcx
	movl	$0, %edx
	jbe	.LBB1_17
.LBB1_11:                               # %vector.body.preheader
                                        #   in Loop: Header=BB1_7 Depth=1
	.loc	1 52 21                 # MatrixMult.c:52:21
	cmpq	$0, 152(%rsp)           # 8-byte Folded Reload
	movl	$0, %esi
	jne	.LBB1_13
# BB#12:                                # %vector.body.prol
                                        #   in Loop: Header=BB1_7 Depth=1
	movq	24(%rsp), %rdx          # 8-byte Reload
	.loc	1 52 9                  # MatrixMult.c:52:9
	movq	%rdx, %rcx
	imulq	%r15, %rcx
	.loc	1 52 21                 # MatrixMult.c:52:21
	movups	(%rax,%rdx,8), %xmm0
	movups	16(%rax,%rdx,8), %xmm1
	movq	16(%rsp), %rdx          # 8-byte Reload
	.loc	1 52 19                 # MatrixMult.c:52:19
	movups	%xmm0, (%rdx,%rcx,8)
	movups	%xmm1, 16(%rdx,%rcx,8)
	movl	$4, %esi
.LBB1_13:                               # %vector.body.preheader.split
                                        #   in Loop: Header=BB1_7 Depth=1
	cmpq	$0, 160(%rsp)           # 8-byte Folded Reload
	je	.LBB1_16
# BB#14:                                # %vector.body.preheader.split.split
                                        #   in Loop: Header=BB1_7 Depth=1
	.loc	1 52 21                 # MatrixMult.c:52:21
	movq	96(%rsp), %rdx          # 8-byte Reload
	subq	%rsi, %rdx
	movq	40(%rsp), %rcx          # 8-byte Reload
	leaq	(%rsi,%rcx), %rcx
	movq	144(%rsp), %rdi         # 8-byte Reload
	leaq	(%rdi,%rcx,8), %rcx
	addq	104(%rsp), %rsi         # 8-byte Folded Reload
	movq	136(%rsp), %rdi         # 8-byte Reload
	leaq	(%rdi,%rsi,8), %rsi
	.p2align	4, 0x90
.LBB1_15:                               # %vector.body
                                        #   Parent Loop BB1_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movups	-48(%rsi), %xmm0
	movups	-32(%rsi), %xmm1
	.loc	1 52 19                 # MatrixMult.c:52:19
	movups	%xmm0, -16(%rcx)
	movups	%xmm1, (%rcx)
	.loc	1 52 21                 # MatrixMult.c:52:21
	movups	-16(%rsi), %xmm0
	movups	(%rsi), %xmm1
	.loc	1 52 19                 # MatrixMult.c:52:19
	movups	%xmm0, 16(%rcx)
	movups	%xmm1, 32(%rcx)
	.loc	1 52 29                 # MatrixMult.c:52:29
	addq	$64, %rcx
	addq	$64, %rsi
	addq	$-8, %rdx
	jne	.LBB1_15
.LBB1_16:                               # %middle.block
                                        #   in Loop: Header=BB1_7 Depth=1
	movq	96(%rsp), %rdx          # 8-byte Reload
	cmpq	%rdx, 112(%rsp)         # 8-byte Folded Reload
	je	.LBB1_23
	.p2align	4, 0x90
.LBB1_17:                               # %for.body14.us.preheader
                                        #   in Loop: Header=BB1_7 Depth=1
	movl	%edx, %edi
	orl	$1, %edi
	movl	60(%rsp), %ecx          # 4-byte Reload
	subl	%edi, %ecx
	movl	%r14d, %r9d
	subl	%edi, %r9d
	andl	$3, %ecx
	je	.LBB1_20
# BB#18:                                # %for.body14.us.prol.preheader
                                        #   in Loop: Header=BB1_7 Depth=1
	movq	40(%rsp), %rsi          # 8-byte Reload
	leaq	(%rdx,%rsi), %rdi
	movq	16(%rsp), %rsi          # 8-byte Reload
	leaq	(%rsi,%rdi,8), %rbp
	movq	%r15, %rdi
	imulq	%rdx, %rdi
	addq	24(%rsp), %rdi          # 8-byte Folded Reload
	leaq	(%rax,%rdi,8), %rdi
	negl	%ecx
	.p2align	4, 0x90
.LBB1_19:                               # %for.body14.us.prol
                                        #   Parent Loop BB1_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 52 21                 # MatrixMult.c:52:21
	movq	(%rdi), %rsi
	.loc	1 52 19                 # MatrixMult.c:52:19
	movq	%rsi, (%rbp)
.Ltmp58:
	.loc	1 51 3 is_stmt 1 discriminator 1 # MatrixMult.c:51:3
	incq	%rdx
	addq	$8, %rbp
	addq	%r8, %rdi
	incl	%ecx
	jne	.LBB1_19
.LBB1_20:                               # %for.body14.us.preheader.split
                                        #   in Loop: Header=BB1_7 Depth=1
.Ltmp59:
	.loc	1 52 29                 # MatrixMult.c:52:29
	cmpl	$3, %r9d
	jb	.LBB1_23
# BB#21:                                # %for.body14.us.preheader.split.split
                                        #   in Loop: Header=BB1_7 Depth=1
	movl	%r14d, %esi
	subl	%edx, %esi
	movq	40(%rsp), %rcx          # 8-byte Reload
	leaq	(%rdx,%rcx), %rcx
	movq	16(%rsp), %rdi          # 8-byte Reload
	leaq	(%rdi,%rcx,8), %rcx
	leaq	3(%rdx), %rdi
	imulq	%r15, %rdi
	leaq	(%rax,%rdi,8), %r12
	leaq	2(%rdx), %rdi
	imulq	%r15, %rdi
	leaq	(%rax,%rdi,8), %r11
	leaq	1(%rdx), %rdi
	imulq	%r15, %rdi
	leaq	(%rax,%rdi,8), %r9
	imulq	%r15, %rdx
	leaq	(%rax,%rdx,8), %rbp
	movq	120(%rsp), %rdi         # 8-byte Reload
	.p2align	4, 0x90
.LBB1_22:                               # %for.body14.us
                                        #   Parent Loop BB1_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 52 21 is_stmt 0       # MatrixMult.c:52:21
	movq	(%rbp,%rdi), %r10
	.loc	1 52 19                 # MatrixMult.c:52:19
	movq	%r10, (%rcx)
	.loc	1 52 21                 # MatrixMult.c:52:21
	movq	(%r9,%rdi), %rdx
	.loc	1 52 19                 # MatrixMult.c:52:19
	movq	%rdx, 8(%rcx)
	.loc	1 52 21                 # MatrixMult.c:52:21
	movq	(%r11,%rdi), %rdx
	.loc	1 52 19                 # MatrixMult.c:52:19
	movq	%rdx, 16(%rcx)
	.loc	1 52 21                 # MatrixMult.c:52:21
	movq	(%r12,%rdi), %rdx
	.loc	1 52 19                 # MatrixMult.c:52:19
	movq	%rdx, 24(%rcx)
.Ltmp60:
	.loc	1 51 3 is_stmt 1 discriminator 1 # MatrixMult.c:51:3
	addq	$32, %rcx
	addq	%rbx, %rdi
	addl	$-4, %esi
	jne	.LBB1_22
.Ltmp61:
.LBB1_23:                               # %for.inc20.loopexit.us
                                        #   in Loop: Header=BB1_7 Depth=1
	movq	24(%rsp), %rcx          # 8-byte Reload
	.loc	1 49 2 discriminator 1  # MatrixMult.c:49:2
	incq	%rcx
	movq	%rcx, 24(%rsp)          # 8-byte Spill
	addq	%r15, 40(%rsp)          # 8-byte Folded Spill
	incq	104(%rsp)               # 8-byte Folded Spill
	addq	$8, 120(%rsp)           # 8-byte Folded Spill
	movq	48(%rsp), %rbp          # 8-byte Reload
	cmpl	%ebp, %ecx
	jne	.LBB1_7
.Ltmp62:
# BB#24:
	movq	128(%rsp), %rbx         # 8-byte Reload
	jmp	.LBB1_25
.LBB1_5:
.Ltmp63:
	#DEBUG_VALUE: matmult:b_data <- %R12
	#DEBUG_VALUE: matmult:width <- %R14D
	movq	%rax, 16(%rsp)          # 8-byte Spill
.Ltmp64:
.LBB1_25:                               # %polly.split_new_and_old
	movq	%rbp, 48(%rsp)          # 8-byte Spill
	movq	%r15, %rax
	imulq	%rax, %rax
	movq	32(%rsp), %rdx          # 8-byte Reload
	leaq	(%rdx,%rax,8), %rax
	cmpq	%r13, %rax
	setbe	%al
	leaq	(%r13,%rbx,8), %rcx
	cmpq	%rdx, %rcx
	setbe	%cl
	cmpl	%ebp, %r14d
	jl	.LBB1_27
# BB#26:                                # %polly.split_new_and_old
	orb	%cl, %al
	je	.LBB1_27
# BB#39:                                # %polly.parallel.for
	movq	%rbp, %r15
	decq	%r15
	sarq	$5, %r15
	movl	%ebp, 64(%rsp)
	movl	%r14d, 68(%rsp)
	movq	%r13, 72(%rsp)
	incq	%r15
	leaq	64(%rsp), %rbx
	movl	$matmult_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%rbx, %rsi
	movq	%r15, %r8
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	matmult_polly_subfn
	callq	GOMP_parallel_end
	movl	%ebp, 64(%rsp)
	movl	%r14d, 68(%rsp)
	movq	%r13, 72(%rsp)
	movq	32(%rsp), %rax          # 8-byte Reload
	movq	%rax, 80(%rsp)
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	%rax, 88(%rsp)
	leaq	64(%rsp), %rbx
	movl	$matmult_polly_subfn_4, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%rbx, %rsi
	movq	%r15, %r8
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	matmult_polly_subfn_4
	callq	GOMP_parallel_end
	jmp	.LBB1_38
.LBB1_27:                               # %for.cond23.preheader
.Ltmp65:
	.loc	1 55 2 discriminator 1  # MatrixMult.c:55:2
	testl	%ebp, %ebp
	jle	.LBB1_38
# BB#28:                                # %for.cond23.preheader
	testl	%r14d, %r14d
	jle	.LBB1_38
# BB#29:                                # %for.cond27.preheader.us.preheader
.Ltmp66:
	.loc	1 60 23                 # MatrixMult.c:60:23
	movl	%r14d, %r8d
	andl	$1, %r8d
	xorl	%r9d, %r9d
.Ltmp67:
	.p2align	4, 0x90
.LBB1_30:                               # %for.cond27.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_31 Depth 2
                                        #       Child Loop BB1_35 Depth 3
	movl	$1, %r10d
	xorl	%r11d, %r11d
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB1_31:                               # %for.body30.us.us
                                        #   Parent Loop BB1_30 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_35 Depth 3
	.loc	1 58 10                 # MatrixMult.c:58:10
	movq	%rdi, %rcx
	imulq	%r15, %rcx
	.loc	1 58 16 is_stmt 0       # MatrixMult.c:58:16
	leaq	(%rcx,%r9), %rbp
	testl	%r8d, %r8d
	.loc	1 58 20                 # MatrixMult.c:58:20
	movq	$0, (%r13,%rbp,8)
.Ltmp68:
	#DEBUG_VALUE: matmult:k <- 0
	movl	$0, %eax
	movl	$0, %esi
	je	.LBB1_33
# BB#32:                                # %for.body38.us.us.prol
                                        #   in Loop: Header=BB1_31 Depth=2
.Ltmp69:
	.loc	1 60 59 is_stmt 1       # MatrixMult.c:60:59
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	(%rax,%rcx,8), %rax
	.loc	1 60 58 is_stmt 0       # MatrixMult.c:60:58
	movq	32(%rsp), %rdx          # 8-byte Reload
	imulq	(%rdx,%rcx,8), %rax
	.loc	1 60 21                 # MatrixMult.c:60:21
	movq	%rax, (%r13,%rbp,8)
	movl	$1, %esi
.LBB1_33:                               # %for.body30.us.us.split
                                        #   in Loop: Header=BB1_31 Depth=2
	cmpl	$1, %r14d
	je	.LBB1_36
# BB#34:                                # %for.body30.us.us.split.split
                                        #   in Loop: Header=BB1_31 Depth=2
	.loc	1 60 23                 # MatrixMult.c:60:23
	movl	%r14d, %ecx
	subl	%esi, %ecx
	leaq	(%rsi,%r11), %rdx
	movq	16(%rsp), %rbx          # 8-byte Reload
	leaq	(%rbx,%rdx,8), %rdx
	addq	%r10, %rsi
	movq	32(%rsp), %rbx          # 8-byte Reload
	leaq	(%rbx,%rsi,8), %rsi
	.p2align	4, 0x90
.LBB1_35:                               # %for.body38.us.us
                                        #   Parent Loop BB1_30 Depth=1
                                        #     Parent Loop BB1_31 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	.loc	1 60 59                 # MatrixMult.c:60:59
	movq	(%rdx), %r12
	.loc	1 60 58                 # MatrixMult.c:60:58
	imulq	-8(%rsi), %r12
	.loc	1 60 39                 # MatrixMult.c:60:39
	addq	%rax, %r12
	.loc	1 60 21                 # MatrixMult.c:60:21
	movq	%r12, (%r13,%rbp,8)
	.loc	1 60 59                 # MatrixMult.c:60:59
	movq	8(%rdx), %rax
	.loc	1 60 58                 # MatrixMult.c:60:58
	imulq	(%rsi), %rax
	.loc	1 60 39                 # MatrixMult.c:60:39
	addq	%r12, %rax
	.loc	1 60 21                 # MatrixMult.c:60:21
	movq	%rax, (%r13,%rbp,8)
.Ltmp70:
	.loc	1 59 4 is_stmt 1 discriminator 1 # MatrixMult.c:59:4
	addq	$16, %rdx
	addq	$16, %rsi
	addl	$-2, %ecx
	jne	.LBB1_35
.Ltmp71:
.LBB1_36:                               # %for.inc60.loopexit.us.us
                                        #   in Loop: Header=BB1_31 Depth=2
	.loc	1 57 3 discriminator 1  # MatrixMult.c:57:3
	incq	%rdi
	addq	%r15, %r11
	addq	%r15, %r10
	cmpl	%r14d, %edi
	jne	.LBB1_31
.Ltmp72:
# BB#37:                                # %for.inc63.loopexit.us-lcssa.us.us
                                        #   in Loop: Header=BB1_30 Depth=1
	.loc	1 55 2 discriminator 1  # MatrixMult.c:55:2
	incq	%r9
	movq	48(%rsp), %rbp          # 8-byte Reload
	cmpl	%ebp, %r9d
	jne	.LBB1_30
.Ltmp73:
.LBB1_38:                               # %for.end65
	.loc	1 66 17 discriminator 1 # MatrixMult.c:66:17
	movl	$16, %edi
	callq	malloc
.Ltmp74:
	#DEBUG_VALUE: matmult:m <- %RAX
	.loc	1 67 14                 # MatrixMult.c:67:14
	movl	%r14d, 8(%rax)
	.loc	1 68 15                 # MatrixMult.c:68:15
	movl	%ebp, 12(%rax)
	.loc	1 69 13                 # MatrixMult.c:69:13
	movq	%r13, (%rax)
	.loc	1 70 5                  # MatrixMult.c:70:5
	addq	$184, %rsp
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
	.loc	1 73 0                  # MatrixMult.c:73:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 76 12 prologue_end    # MatrixMult.c:76:12
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
	.loc	1 76 5 is_stmt 0        # MatrixMult.c:76:5
	movl	$.L.str, %esi
.Ltmp85:
	xorl	%eax, %eax
	callq	__isoc99_sscanf
.Ltmp86:
	.loc	1 77 24 is_stmt 1       # MatrixMult.c:77:24
	movl	60(%rsp), %esi
.Ltmp87:
	#DEBUG_VALUE: main:max <- %ESI
	.loc	1 77 5 is_stmt 0        # MatrixMult.c:77:5
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp88:
	.loc	1 79 22 is_stmt 1       # MatrixMult.c:79:22
	movl	60(%rsp), %edi
.Ltmp89:
	#DEBUG_VALUE: main:max <- %EDI
	.loc	1 79 17 is_stmt 0 discriminator 1 # MatrixMult.c:79:17
	movl	%edi, %esi
	callq	init
.Ltmp90:
	movq	%rax, %r14
.Ltmp91:
	#DEBUG_VALUE: main:a <- %R14
	.loc	1 80 22 is_stmt 1       # MatrixMult.c:80:22
	movl	60(%rsp), %edi
.Ltmp92:
	#DEBUG_VALUE: main:max <- %EDI
	.loc	1 80 17 is_stmt 0 discriminator 1 # MatrixMult.c:80:17
	movl	%edi, %esi
	callq	init
.Ltmp93:
	movq	%rax, %rbx
.Ltmp94:
	#DEBUG_VALUE: main:b <- %RBX
	.loc	1 82 17 is_stmt 1 discriminator 1 # MatrixMult.c:82:17
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	matmult
	movq	%rax, %r15
.Ltmp95:
	#DEBUG_VALUE: main:c <- %R15
	.loc	1 87 48                 # MatrixMult.c:87:48
	movl	60(%rsp), %esi
.Ltmp96:
	#DEBUG_VALUE: main:max <- %ESI
	.loc	1 87 5 is_stmt 0        # MatrixMult.c:87:5
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	movl	%esi, %edx
	callq	printf
.Ltmp97:
	.loc	1 89 9 is_stmt 1        # MatrixMult.c:89:9
	movl	60(%rsp), %edx
.Ltmp98:
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
.Ltmp99:
	.loc	1 93 5                  # MatrixMult.c:93:5
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
	subq	$136, %rsp
.Ltmp110:
	.cfi_def_cfa_offset 192
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
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movl	4(%rdi), %ebx
	movq	8(%rdi), %rbp
	leaq	72(%rsp), %rdi
	leaq	64(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB3_2
# BB#1:                                 # %polly.par.loadIVBounds.lr.ph
	movslq	%ebx, %rcx
	movq	%rcx, 120(%rsp)         # 8-byte Spill
	andl	$3, %ebx
	leaq	-1(%rcx), %rax
	sarq	$5, %rax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movq	%rcx, %rax
	shrq	$2, %rax
	decq	%rax
	movq	%rax, 112(%rsp)         # 8-byte Spill
	leaq	-1(%rbx), %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	leaq	(,%rbx,8), %rax
	movq	%rbp, %rdx
	subq	%rax, %rdx
	movq	%rdx, 80(%rsp)          # 8-byte Spill
	leaq	(,%rcx,8), %r12
	shlq	$8, %rcx
	movq	%rcx, 24(%rsp)          # 8-byte Spill
	addq	$16, %rbp
	movq	%rbp, 88(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB3_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_5 Depth 2
                                        #       Child Loop BB3_7 Depth 3
                                        #         Child Loop BB3_21 Depth 4
                                        #           Child Loop BB3_22 Depth 5
                                        #           Child Loop BB3_25 Depth 5
                                        #         Child Loop BB3_10 Depth 4
                                        #           Child Loop BB3_11 Depth 5
                                        #           Child Loop BB3_14 Depth 5
                                        #           Child Loop BB3_16 Depth 5
	movq	64(%rsp), %rax
	movq	72(%rsp), %rcx
	movq	%rcx, 8(%rsp)           # 8-byte Spill
	addq	$-2, %rax
	movq	%rax, 104(%rsp)         # 8-byte Spill
	movq	%rcx, %rax
	shlq	$5, %rax
	orq	$1, %rax
	imulq	%r12, %rax
	addq	80(%rsp), %rax          # 8-byte Folded Reload
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	24(%rsp), %rax          # 8-byte Reload
	imulq	%rcx, %rax
	addq	88(%rsp), %rax          # 8-byte Folded Reload
	movq	%rax, 32(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB3_5:                                # %polly.loop_header
                                        #   Parent Loop BB3_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_7 Depth 3
                                        #         Child Loop BB3_21 Depth 4
                                        #           Child Loop BB3_22 Depth 5
                                        #           Child Loop BB3_25 Depth 5
                                        #         Child Loop BB3_10 Depth 4
                                        #           Child Loop BB3_11 Depth 5
                                        #           Child Loop BB3_14 Depth 5
                                        #           Child Loop BB3_16 Depth 5
	cmpq	$0, 40(%rsp)            # 8-byte Folded Reload
	js	.LBB3_20
# BB#6:                                 # %polly.loop_header2.preheader
                                        #   in Loop: Header=BB3_5 Depth=2
	movq	8(%rsp), %r13           # 8-byte Reload
	shlq	$5, %r13
	movq	96(%rsp), %rcx          # 8-byte Reload
	subq	%r13, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovgq	%rax, %rcx
	movq	%rcx, 128(%rsp)         # 8-byte Spill
	leaq	-1(%rcx), %rsi
	movq	32(%rsp), %rax          # 8-byte Reload
	movq	%rax, 48(%rsp)          # 8-byte Spill
	xorl	%r11d, %r11d
	.p2align	4, 0x90
.LBB3_7:                                # %polly.loop_header2
                                        #   Parent Loop BB3_4 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB3_21 Depth 4
                                        #           Child Loop BB3_22 Depth 5
                                        #           Child Loop BB3_25 Depth 5
                                        #         Child Loop BB3_10 Depth 4
                                        #           Child Loop BB3_11 Depth 5
                                        #           Child Loop BB3_14 Depth 5
                                        #           Child Loop BB3_16 Depth 5
	cmpq	$0, 128(%rsp)           # 8-byte Folded Reload
	js	.LBB3_19
# BB#8:                                 # %polly.loop_header10.preheader
                                        #   in Loop: Header=BB3_7 Depth=3
	testl	%ebx, %ebx
	sete	%al
	leaq	(,%r11,8), %rcx
	movq	112(%rsp), %rdx         # 8-byte Reload
	subq	%rcx, %rdx
	cmpq	$7, %rdx
	movl	$7, %ecx
	cmovgq	%rcx, %rdx
	movq	%r11, %rcx
	shlq	$5, %rcx
	orq	$31, %rcx
	cmpq	120(%rsp), %rcx         # 8-byte Folded Reload
	setl	%r8b
	orb	%al, %r8b
	testq	%rdx, %rdx
	js	.LBB3_18
# BB#9:                                 #   in Loop: Header=BB3_7 Depth=3
	decq	%rdx
	movq	16(%rsp), %r9           # 8-byte Reload
	movq	48(%rsp), %r10          # 8-byte Reload
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB3_10:                               # %polly.loop_header10.us
                                        #   Parent Loop BB3_4 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        #       Parent Loop BB3_7 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB3_11 Depth 5
                                        #           Child Loop BB3_14 Depth 5
                                        #           Child Loop BB3_16 Depth 5
	leaq	(%r15,%r13), %r14
	.loc	1 26 47                 # MatrixMult.c:26:47
	movd	%r14, %xmm0
	pshufd	$68, %xmm0, %xmm0       # xmm0 = xmm0[0,1,0,1]
	movq	$-1, %rax
	movq	%r10, %rcx
	.p2align	4, 0x90
.LBB3_11:                               # %polly.loop_header19.us
                                        #   Parent Loop BB3_4 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        #       Parent Loop BB3_7 Depth=3
                                        #         Parent Loop BB3_10 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movdqu	-16(%rcx), %xmm1
	paddq	%xmm0, %xmm1
	movdqu	%xmm1, -16(%rcx)
	movdqu	(%rcx), %xmm1
	paddq	%xmm0, %xmm1
	movdqu	%xmm1, (%rcx)
	incq	%rax
	addq	$32, %rcx
	cmpq	%rdx, %rax
	jle	.LBB3_11
# BB#12:                                # %polly.cond.loopexit.us
                                        #   in Loop: Header=BB3_10 Depth=4
	testb	%r8b, %r8b
	jne	.LBB3_17
# BB#13:                                # %polly.loop_header35.preheader.us
                                        #   in Loop: Header=BB3_10 Depth=4
	testq	%rbx, %rbx
	movq	%r9, %rcx
	movl	$0, %eax
	je	.LBB3_15
	.p2align	4, 0x90
.LBB3_14:                               # %polly.loop_header35.us.prol
                                        #   Parent Loop BB3_4 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        #       Parent Loop BB3_7 Depth=3
                                        #         Parent Loop BB3_10 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	addq	%r14, (%rcx)
	incq	%rax
	addq	$8, %rcx
	cmpq	%rax, %rbx
	jne	.LBB3_14
.LBB3_15:                               # %polly.loop_header35.preheader.us.split
                                        #   in Loop: Header=BB3_10 Depth=4
	cmpq	$3, 56(%rsp)            # 8-byte Folded Reload
	jb	.LBB3_17
	.p2align	4, 0x90
.LBB3_16:                               # %polly.loop_header35.us
                                        #   Parent Loop BB3_4 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        #       Parent Loop BB3_7 Depth=3
                                        #         Parent Loop BB3_10 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	addq	%r14, (%r9,%rax,8)
	addq	%r14, 8(%r9,%rax,8)
	addq	%r14, 16(%r9,%rax,8)
	addq	%r14, 24(%r9,%rax,8)
	addq	$4, %rax
	cmpq	%rax, %rbx
	jne	.LBB3_16
.LBB3_17:                               # %polly.merge.us
                                        #   in Loop: Header=BB3_10 Depth=4
	addq	%r12, %r10
	addq	%r12, %r9
	cmpq	%rsi, %r15
	leaq	1(%r15), %r15
	jle	.LBB3_10
	jmp	.LBB3_19
	.p2align	4, 0x90
.LBB3_18:                               # %polly.loop_header10.preheader.split
                                        #   in Loop: Header=BB3_7 Depth=3
	testb	%r8b, %r8b
	movq	16(%rsp), %rdi          # 8-byte Reload
	movl	$0, %eax
	jne	.LBB3_19
	.p2align	4, 0x90
.LBB3_21:                               # %polly.loop_header10
                                        #   Parent Loop BB3_4 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        #       Parent Loop BB3_7 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB3_22 Depth 5
                                        #           Child Loop BB3_25 Depth 5
	leaq	(%rax,%r13), %rcx
	testq	%rbx, %rbx
	movq	%rdi, %rdx
	movl	$0, %ebp
	je	.LBB3_23
	.p2align	4, 0x90
.LBB3_22:                               # %polly.loop_header35.prol
                                        #   Parent Loop BB3_4 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        #       Parent Loop BB3_7 Depth=3
                                        #         Parent Loop BB3_21 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	addq	%rcx, (%rdx)
	incq	%rbp
	addq	$8, %rdx
	cmpq	%rbp, %rbx
	jne	.LBB3_22
.LBB3_23:                               # %polly.loop_header10.split
                                        #   in Loop: Header=BB3_21 Depth=4
	cmpq	$2, 56(%rsp)            # 8-byte Folded Reload
	jbe	.LBB3_24
	.p2align	4, 0x90
.LBB3_25:                               # %polly.loop_header35
                                        #   Parent Loop BB3_4 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        #       Parent Loop BB3_7 Depth=3
                                        #         Parent Loop BB3_21 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	addq	%rcx, (%rdi,%rbp,8)
	addq	%rcx, 8(%rdi,%rbp,8)
	addq	%rcx, 16(%rdi,%rbp,8)
	addq	%rcx, 24(%rdi,%rbp,8)
	addq	$4, %rbp
	cmpq	%rbp, %rbx
	jne	.LBB3_25
.LBB3_24:                               # %polly.merge
                                        #   in Loop: Header=BB3_21 Depth=4
	addq	%r12, %rdi
	cmpq	%rsi, %rax
	leaq	1(%rax), %rax
	jle	.LBB3_21
	.p2align	4, 0x90
.LBB3_19:                               # %polly.loop_exit12
                                        #   in Loop: Header=BB3_7 Depth=3
	addq	$256, 48(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	cmpq	40(%rsp), %r11          # 8-byte Folded Reload
	leaq	1(%r11), %r11
	jne	.LBB3_7
.LBB3_20:                               # %polly.loop_exit4
                                        #   in Loop: Header=BB3_5 Depth=2
	movq	24(%rsp), %rax          # 8-byte Reload
	addq	%rax, 16(%rsp)          # 8-byte Folded Spill
	addq	%rax, 32(%rsp)          # 8-byte Folded Spill
	movq	8(%rsp), %rax           # 8-byte Reload
	cmpq	104(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	jle	.LBB3_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB3_4 Depth=1
	leaq	72(%rsp), %rdi
	leaq	64(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB3_4
.LBB3_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$136, %rsp
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
	subq	$296, %rsp              # imm = 0x128
.Ltmp123:
	.cfi_def_cfa_offset 352
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
	movq	%rax, 240(%rsp)         # 8-byte Spill
	movl	4(%rdi), %ebp
	movq	8(%rdi), %rbx
	leaq	200(%rsp), %rdi
	leaq	192(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB4_2
# BB#1:                                 # %polly.par.loadIVBounds.lr.ph
	movslq	%ebp, %rcx
	movq	%rcx, 264(%rsp)         # 8-byte Spill
	andl	$3, %ebp
	movq	%rbp, 48(%rsp)          # 8-byte Spill
	leaq	-1(%rcx), %rax
	sarq	$5, %rax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movq	%rcx, %rax
	shrq	$2, %rax
	decq	%rax
	movq	%rax, 256(%rsp)         # 8-byte Spill
	leaq	-1(%rbp), %rax
	movq	%rax, 176(%rsp)         # 8-byte Spill
	movq	%rcx, %rax
	subq	%rbp, %rax
	movq	%rax, 160(%rsp)         # 8-byte Spill
	imulq	%rcx, %rax
	movq	%rbx, 40(%rsp)          # 8-byte Spill
	leaq	(%rbx,%rax,8), %rax
	movq	%rax, 232(%rsp)         # 8-byte Spill
	leaq	(,%rcx,8), %rax
	movq	%rax, 168(%rsp)         # 8-byte Spill
	leaq	3(%rcx), %rax
	subq	%rbp, %rax
	movq	%rax, 152(%rsp)         # 8-byte Spill
	movq	%rcx, %r13
	shlq	$5, %r13
	leaq	2(%rcx), %rax
	subq	%rbp, %rax
	movq	%rax, 144(%rsp)         # 8-byte Spill
	leaq	1(%rcx), %rax
	subq	%rbp, %rax
	movq	%rax, 136(%rsp)         # 8-byte Spill
	leaq	(%rcx,%rcx,2), %rax
	leaq	(%rbx,%rax,8), %rax
	movq	%rax, 224(%rsp)         # 8-byte Spill
	movq	%rcx, %rax
	shlq	$8, %rax
	movq	%rax, 272(%rsp)         # 8-byte Spill
	movq	%rcx, %rax
	shlq	$4, %rax
	addq	%rbx, %rax
	movq	%rax, 216(%rsp)         # 8-byte Spill
	leaq	(%rbx,%rcx,8), %rax
	movq	%rax, 208(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB4_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_5 Depth 2
                                        #       Child Loop BB4_7 Depth 3
                                        #         Child Loop BB4_24 Depth 4
                                        #           Child Loop BB4_25 Depth 5
                                        #           Child Loop BB4_28 Depth 5
                                        #         Child Loop BB4_13 Depth 4
                                        #           Child Loop BB4_14 Depth 5
                                        #           Child Loop BB4_16 Depth 5
                                        #           Child Loop BB4_19 Depth 5
                                        #         Child Loop BB4_10 Depth 4
                                        #           Child Loop BB4_11 Depth 5
	movq	192(%rsp), %rax
	movq	200(%rsp), %rcx
	movq	%rcx, 8(%rsp)           # 8-byte Spill
	addq	$-2, %rax
	movq	%rax, 248(%rsp)         # 8-byte Spill
	shlq	$8, %rcx
	movq	%rcx, 24(%rsp)          # 8-byte Spill
	movq	232(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	224(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	movq	%rax, 88(%rsp)          # 8-byte Spill
	movq	216(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	208(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	40(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB4_5:                                # %polly.loop_header
                                        #   Parent Loop BB4_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_7 Depth 3
                                        #         Child Loop BB4_24 Depth 4
                                        #           Child Loop BB4_25 Depth 5
                                        #           Child Loop BB4_28 Depth 5
                                        #         Child Loop BB4_13 Depth 4
                                        #           Child Loop BB4_14 Depth 5
                                        #           Child Loop BB4_16 Depth 5
                                        #           Child Loop BB4_19 Depth 5
                                        #         Child Loop BB4_10 Depth 4
                                        #           Child Loop BB4_11 Depth 5
	cmpq	$0, 96(%rsp)            # 8-byte Folded Reload
	js	.LBB4_23
# BB#6:                                 # %polly.loop_header3.preheader
                                        #   in Loop: Header=BB4_5 Depth=2
	movq	8(%rsp), %rax           # 8-byte Reload
	shlq	$5, %rax
	movq	240(%rsp), %rcx         # 8-byte Reload
	subq	%rax, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovgq	%rax, %rcx
	movq	%rcx, 280(%rsp)         # 8-byte Spill
	leaq	-1(%rcx), %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	64(%rsp), %rax          # 8-byte Reload
	movq	%rax, 128(%rsp)         # 8-byte Spill
	movq	72(%rsp), %rax          # 8-byte Reload
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	80(%rsp), %rax          # 8-byte Reload
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movq	88(%rsp), %rax          # 8-byte Reload
	movq	%rax, 104(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB4_7:                                # %polly.loop_header3
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB4_24 Depth 4
                                        #           Child Loop BB4_25 Depth 5
                                        #           Child Loop BB4_28 Depth 5
                                        #         Child Loop BB4_13 Depth 4
                                        #           Child Loop BB4_14 Depth 5
                                        #           Child Loop BB4_16 Depth 5
                                        #           Child Loop BB4_19 Depth 5
                                        #         Child Loop BB4_10 Depth 4
                                        #           Child Loop BB4_11 Depth 5
	cmpq	$0, 280(%rsp)           # 8-byte Folded Reload
	js	.LBB4_22
# BB#8:                                 # %polly.loop_header11.preheader
                                        #   in Loop: Header=BB4_7 Depth=3
	movq	48(%rsp), %rax          # 8-byte Reload
	testl	%eax, %eax
	sete	%cl
	movq	32(%rsp), %rdx          # 8-byte Reload
	leaq	(,%rdx,8), %rax
	movq	256(%rsp), %r14         # 8-byte Reload
	subq	%rax, %r14
	cmpq	$7, %r14
	movl	$7, %eax
	cmovgq	%rax, %r14
	movq	%rdx, %rax
	shlq	$5, %rax
	orq	$31, %rax
	cmpq	264(%rsp), %rax         # 8-byte Folded Reload
	setl	%al
	orb	%cl, %al
	testq	%r14, %r14
	js	.LBB4_21
# BB#9:                                 # %polly.loop_header11.preheader.split.us
                                        #   in Loop: Header=BB4_7 Depth=3
	decq	%r14
	testb	%al, %al
	movq	128(%rsp), %r9          # 8-byte Reload
	movq	%r9, %r15
	movq	120(%rsp), %r11         # 8-byte Reload
	movq	%r11, %rsi
	movq	112(%rsp), %rbp         # 8-byte Reload
	movq	%rbp, %r10
	movq	104(%rsp), %r12         # 8-byte Reload
	movq	%r12, %r8
	movl	$0, %edi
	movq	24(%rsp), %rdx          # 8-byte Reload
	movq	%rdx, 184(%rsp)         # 8-byte Spill
	movq	16(%rsp), %rdx          # 8-byte Reload
	movl	$0, %eax
	je	.LBB4_13
	.p2align	4, 0x90
.LBB4_10:                               # %polly.loop_header11.us.us
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_7 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB4_11 Depth 5
	movq	$-1, %rdx
	movq	%r15, %rax
	movq	%rsi, %rbx
	movq	%r10, %rcx
	movq	%r8, %rbp
	.p2align	4, 0x90
.LBB4_11:                               # %polly.loop_header20.us.us
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_7 Depth=3
                                        #         Parent Loop BB4_10 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movq	$0, (%rax)
	movq	$0, (%rbx)
	movq	$0, (%rcx)
	movq	$0, (%rbp)
	incq	%rdx
	addq	%r13, %rbp
	addq	%r13, %rcx
	addq	%r13, %rbx
	addq	%r13, %rax
	cmpq	%r14, %rdx
	jle	.LBB4_11
# BB#12:                                # %polly.cond.loopexit.us.us
                                        #   in Loop: Header=BB4_10 Depth=4
	addq	$8, %r8
	addq	$8, %r10
	addq	$8, %rsi
	addq	$8, %r15
	cmpq	56(%rsp), %rdi          # 8-byte Folded Reload
	leaq	1(%rdi), %rdi
	jle	.LBB4_10
	jmp	.LBB4_22
	.p2align	4, 0x90
.LBB4_13:                               # %polly.loop_header11.us
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_7 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB4_14 Depth 5
                                        #           Child Loop BB4_16 Depth 5
                                        #           Child Loop BB4_19 Depth 5
	movq	%rax, 288(%rsp)         # 8-byte Spill
	movq	$-1, %rax
	movq	%r9, %rcx
	movq	%r11, %rdi
	movq	%rbp, %rbx
	movq	%rbx, %r15
	movq	%r12, %rbx
	.p2align	4, 0x90
.LBB4_14:                               # %polly.loop_header20.us
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_7 Depth=3
                                        #         Parent Loop BB4_13 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movq	$0, (%rcx)
	movq	$0, (%rdi)
	movq	$0, (%rbp)
	movq	$0, (%rbx)
	incq	%rax
	addq	%r13, %rbx
	addq	%r13, %rbp
	addq	%r13, %rdi
	addq	%r13, %rcx
	cmpq	%r14, %rax
	jle	.LBB4_14
# BB#15:                                # %polly.loop_header36.us.preheader
                                        #   in Loop: Header=BB4_13 Depth=4
	movq	48(%rsp), %rdi          # 8-byte Reload
	testq	%rdi, %rdi
	movq	%rdx, %r8
	movq	%r8, %rcx
	movl	$0, %eax
	movq	184(%rsp), %r10         # 8-byte Reload
	movq	168(%rsp), %rsi         # 8-byte Reload
	je	.LBB4_17
	.p2align	4, 0x90
.LBB4_16:                               # %polly.loop_header36.us.prol
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_7 Depth=3
                                        #         Parent Loop BB4_13 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movq	$0, (%rcx)
	incq	%rax
	addq	%rsi, %rcx
	cmpq	%rax, %rdi
	jne	.LBB4_16
.LBB4_17:                               # %polly.loop_header36.us.preheader.split
                                        #   in Loop: Header=BB4_13 Depth=4
	cmpq	$3, 176(%rsp)           # 8-byte Folded Reload
	jb	.LBB4_20
# BB#18:                                # %polly.loop_header36.us.preheader.split.split
                                        #   in Loop: Header=BB4_13 Depth=4
	movq	%rdi, %rcx
	subq	%rax, %rcx
	movq	152(%rsp), %rdx         # 8-byte Reload
	leaq	(%rdx,%rax), %rdi
	imulq	%rsi, %rdi
	addq	%r10, %rdi
	movq	144(%rsp), %rdx         # 8-byte Reload
	leaq	(%rdx,%rax), %rbp
	imulq	%rsi, %rbp
	addq	%r10, %rbp
	movq	136(%rsp), %rdx         # 8-byte Reload
	leaq	(%rdx,%rax), %rbx
	imulq	%rsi, %rbx
	addq	%r10, %rbx
	addq	160(%rsp), %rax         # 8-byte Folded Reload
	imulq	%rsi, %rax
	addq	%r10, %rax
	movq	40(%rsp), %rdx          # 8-byte Reload
	.p2align	4, 0x90
.LBB4_19:                               # %polly.loop_header36.us
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_7 Depth=3
                                        #         Parent Loop BB4_13 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movq	$0, (%rax,%rdx)
	movq	$0, (%rbx,%rdx)
	movq	$0, (%rbp,%rdx)
	movq	$0, (%rdi,%rdx)
	addq	%r13, %rdx
	addq	$-4, %rcx
	jne	.LBB4_19
.LBB4_20:                               # %polly.merge.loopexit.us
                                        #   in Loop: Header=BB4_13 Depth=4
	addq	$8, %r12
	movq	%r15, %rbp
	addq	$8, %rbp
	addq	$8, %r11
	addq	$8, %r9
	addq	$8, %r8
	movq	%r8, %rdx
	addq	$8, %r10
	movq	%r10, 184(%rsp)         # 8-byte Spill
	movq	288(%rsp), %rax         # 8-byte Reload
	cmpq	56(%rsp), %rax          # 8-byte Folded Reload
	leaq	1(%rax), %rax
	jle	.LBB4_13
	jmp	.LBB4_22
	.p2align	4, 0x90
.LBB4_21:                               # %polly.loop_header11.preheader.split
                                        #   in Loop: Header=BB4_7 Depth=3
	testb	%al, %al
	movq	24(%rsp), %r10          # 8-byte Reload
	movq	16(%rsp), %r9           # 8-byte Reload
	movl	$0, %r8d
	jne	.LBB4_22
	.p2align	4, 0x90
.LBB4_24:                               # %polly.loop_header11
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_7 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB4_25 Depth 5
                                        #           Child Loop BB4_28 Depth 5
	movq	48(%rsp), %rsi          # 8-byte Reload
	testq	%rsi, %rsi
	movq	%r9, %rcx
	movl	$0, %eax
	movq	168(%rsp), %rdx         # 8-byte Reload
	je	.LBB4_26
	.p2align	4, 0x90
.LBB4_25:                               # %polly.loop_header36.prol
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_7 Depth=3
                                        #         Parent Loop BB4_24 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movq	$0, (%rcx)
	incq	%rax
	addq	%rdx, %rcx
	cmpq	%rax, %rsi
	jne	.LBB4_25
.LBB4_26:                               # %polly.loop_header11.split
                                        #   in Loop: Header=BB4_24 Depth=4
	cmpq	$3, 176(%rsp)           # 8-byte Folded Reload
	jb	.LBB4_29
# BB#27:                                # %polly.loop_header11.split.split
                                        #   in Loop: Header=BB4_24 Depth=4
	movq	%rsi, %rcx
	subq	%rax, %rcx
	movq	152(%rsp), %rsi         # 8-byte Reload
	leaq	(%rsi,%rax), %rbp
	imulq	%rdx, %rbp
	addq	%r10, %rbp
	movq	144(%rsp), %rsi         # 8-byte Reload
	leaq	(%rsi,%rax), %rdi
	imulq	%rdx, %rdi
	addq	%r10, %rdi
	movq	136(%rsp), %rsi         # 8-byte Reload
	leaq	(%rsi,%rax), %rbx
	imulq	%rdx, %rbx
	addq	%r10, %rbx
	addq	160(%rsp), %rax         # 8-byte Folded Reload
	imulq	%rdx, %rax
	addq	%r10, %rax
	movq	40(%rsp), %rsi          # 8-byte Reload
	.p2align	4, 0x90
.LBB4_28:                               # %polly.loop_header36
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_7 Depth=3
                                        #         Parent Loop BB4_24 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movq	$0, (%rax,%rsi)
	movq	$0, (%rbx,%rsi)
	movq	$0, (%rdi,%rsi)
	movq	$0, (%rbp,%rsi)
	addq	%r13, %rsi
	addq	$-4, %rcx
	jne	.LBB4_28
.LBB4_29:                               # %polly.merge
                                        #   in Loop: Header=BB4_24 Depth=4
	addq	$8, %r9
	addq	$8, %r10
	cmpq	56(%rsp), %r8           # 8-byte Folded Reload
	leaq	1(%r8), %r8
	jle	.LBB4_24
	.p2align	4, 0x90
.LBB4_22:                               # %polly.loop_exit13
                                        #   in Loop: Header=BB4_7 Depth=3
	movq	272(%rsp), %rax         # 8-byte Reload
	addq	%rax, 104(%rsp)         # 8-byte Folded Spill
	addq	%rax, 112(%rsp)         # 8-byte Folded Spill
	addq	%rax, 120(%rsp)         # 8-byte Folded Spill
	addq	%rax, 128(%rsp)         # 8-byte Folded Spill
	movq	32(%rsp), %rax          # 8-byte Reload
	cmpq	96(%rsp), %rax          # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	jne	.LBB4_7
.LBB4_23:                               # %polly.loop_exit5
                                        #   in Loop: Header=BB4_5 Depth=2
	addq	$256, 16(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	addq	$256, 24(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	addq	$256, 88(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	addq	$256, 80(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	addq	$256, 72(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	addq	$256, 64(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	movq	8(%rsp), %rax           # 8-byte Reload
	cmpq	248(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	jle	.LBB4_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB4_4 Depth=1
	leaq	200(%rsp), %rdi
	leaq	192(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB4_4
.LBB4_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$296, %rsp              # imm = 0x128
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
	subq	$312, %rsp              # imm = 0x138
.Ltmp136:
	.cfi_def_cfa_offset 368
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
	movq	%rax, 184(%rsp)         # 8-byte Spill
	movl	4(%rdi), %ebx
	movq	8(%rdi), %rbp
	movq	16(%rdi), %rax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	24(%rdi), %rax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	leaq	152(%rsp), %rdi
	leaq	144(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB5_2
# BB#1:                                 # %polly.par.loadIVBounds.lr.ph
	movslq	%ebx, %r12
	movq	%r12, 304(%rsp)         # 8-byte Spill
	movl	%ebx, %eax
	andl	$3, %eax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	leaq	-1(%r12), %rcx
	movq	%rcx, %rdx
	shrq	$5, %rdx
	movq	%rdx, 248(%rsp)         # 8-byte Spill
	sarq	$5, %rcx
	movq	%rcx, 80(%rsp)          # 8-byte Spill
	movq	%r12, %rcx
	shrq	$2, %rcx
	decq	%rcx
	movq	%rcx, 240(%rsp)         # 8-byte Spill
	movq	%r12, %rcx
	subq	%rax, %rcx
	movq	%rcx, 64(%rsp)          # 8-byte Spill
	leaq	-1(%rax), %rcx
	movq	%rcx, 104(%rsp)         # 8-byte Spill
	andl	$1, %ebx
	movq	%rbx, 112(%rsp)         # 8-byte Spill
	movq	%r12, %rcx
	shlq	$5, %rcx
	movq	%rcx, 208(%rsp)         # 8-byte Spill
	leaq	1(%r12), %rcx
	subq	%rax, %rcx
	movq	%rcx, 176(%rsp)         # 8-byte Spill
	movq	8(%rsp), %rax           # 8-byte Reload
	leaq	24(%rax), %rax
	movq	%rax, 168(%rsp)         # 8-byte Spill
	movq	%r12, %rax
	shlq	$8, %rax
	movq	%rax, 200(%rsp)         # 8-byte Spill
	leaq	(,%r12,8), %rax
	movq	%rax, 296(%rsp)         # 8-byte Spill
	movq	16(%rsp), %rax          # 8-byte Reload
	leaq	24(%rax), %rax
	movq	%rax, 160(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB5_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_5 Depth 2
                                        #       Child Loop BB5_7 Depth 3
                                        #         Child Loop BB5_8 Depth 4
                                        #           Child Loop BB5_10 Depth 5
                                        #             Child Loop BB5_28 Depth 6
                                        #               Child Loop BB5_33 Depth 7
                                        #             Child Loop BB5_12 Depth 6
                                        #               Child Loop BB5_13 Depth 7
                                        #               Child Loop BB5_22 Depth 7
	movq	144(%rsp), %rax
	movq	152(%rsp), %rcx
	movq	%rcx, 24(%rsp)          # 8-byte Spill
	addq	$-2, %rax
	movq	%rax, 192(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB5_5:                                # %polly.loop_header
                                        #   Parent Loop BB5_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_7 Depth 3
                                        #         Child Loop BB5_8 Depth 4
                                        #           Child Loop BB5_10 Depth 5
                                        #             Child Loop BB5_28 Depth 6
                                        #               Child Loop BB5_33 Depth 7
                                        #             Child Loop BB5_12 Depth 6
                                        #               Child Loop BB5_13 Depth 7
                                        #               Child Loop BB5_22 Depth 7
	cmpq	$0, 80(%rsp)            # 8-byte Folded Reload
	js	.LBB5_18
# BB#6:                                 # %polly.loop_header4.preheader
                                        #   in Loop: Header=BB5_5 Depth=2
	movq	24(%rsp), %rax          # 8-byte Reload
	shlq	$5, %rax
	movq	%rax, 264(%rsp)         # 8-byte Spill
	movq	184(%rsp), %rcx         # 8-byte Reload
	subq	%rax, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovgq	%rax, %rcx
	movq	%rcx, 256(%rsp)         # 8-byte Spill
	leaq	-1(%rcx), %rax
	movq	%rax, 280(%rsp)         # 8-byte Spill
	movq	160(%rsp), %rcx         # 8-byte Reload
	movq	168(%rsp), %rdx         # 8-byte Reload
	movq	176(%rsp), %rax         # 8-byte Reload
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	64(%rsp), %rax          # 8-byte Reload
	movq	%rax, 40(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB5_7:                                # %polly.loop_header4
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_8 Depth 4
                                        #           Child Loop BB5_10 Depth 5
                                        #             Child Loop BB5_28 Depth 6
                                        #               Child Loop BB5_33 Depth 7
                                        #             Child Loop BB5_12 Depth 6
                                        #               Child Loop BB5_13 Depth 7
                                        #               Child Loop BB5_22 Depth 7
	movq	%rax, 216(%rsp)         # 8-byte Spill
	movq	%rdx, 224(%rsp)         # 8-byte Spill
	movq	%rcx, 232(%rsp)         # 8-byte Spill
	movq	%rax, %rsi
	shlq	$5, %rsi
	movq	%rsi, 128(%rsp)         # 8-byte Spill
	movq	%r12, %rax
	subq	%rsi, %rax
	decq	%rax
	cmpq	$31, %rax
	movl	$31, %esi
	cmovleq	%rax, %rsi
	movq	%rsi, 288(%rsp)         # 8-byte Spill
	leaq	-1(%rsi), %rax
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	%rcx, 96(%rsp)          # 8-byte Spill
	movq	%rdx, 88(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB5_8:                                # %polly.loop_header11
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB5_10 Depth 5
                                        #             Child Loop BB5_28 Depth 6
                                        #               Child Loop BB5_33 Depth 7
                                        #             Child Loop BB5_12 Depth 6
                                        #               Child Loop BB5_13 Depth 7
                                        #               Child Loop BB5_22 Depth 7
	cmpq	$0, 256(%rsp)           # 8-byte Folded Reload
	js	.LBB5_27
# BB#9:                                 # %polly.loop_header19.preheader
                                        #   in Loop: Header=BB5_8 Depth=4
	movq	72(%rsp), %rax          # 8-byte Reload
	testl	%eax, %eax
	sete	%al
	movq	32(%rsp), %rdx          # 8-byte Reload
	leaq	(,%rdx,8), %rcx
	movq	240(%rsp), %rsi         # 8-byte Reload
	subq	%rcx, %rsi
	cmpq	$7, %rsi
	movl	$7, %ecx
	cmovgq	%rcx, %rsi
	movq	%rsi, 272(%rsp)         # 8-byte Spill
	movq	%rdx, %rcx
	shlq	$5, %rcx
	orq	$31, %rcx
	cmpq	%r12, %rcx
	setl	%cl
	orb	%al, %cl
	movb	%cl, 7(%rsp)            # 1-byte Spill
	leaq	-1(%rsi), %rcx
	xorl	%eax, %eax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB5_10:                               # %polly.loop_header19
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        #         Parent Loop BB5_8 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB5_28 Depth 6
                                        #               Child Loop BB5_33 Depth 7
                                        #             Child Loop BB5_12 Depth 6
                                        #               Child Loop BB5_13 Depth 7
                                        #               Child Loop BB5_22 Depth 7
	cmpq	$0, 288(%rsp)           # 8-byte Folded Reload
	js	.LBB5_26
# BB#11:                                # %polly.loop_header28.preheader
                                        #   in Loop: Header=BB5_10 Depth=5
	movq	264(%rsp), %rax         # 8-byte Reload
	movq	56(%rsp), %rdx          # 8-byte Reload
	leaq	(%rdx,%rax), %rax
	movq	%rax, 136(%rsp)         # 8-byte Spill
	cmpq	$0, 272(%rsp)           # 8-byte Folded Reload
	movq	48(%rsp), %r9           # 8-byte Reload
	movq	40(%rsp), %r8           # 8-byte Reload
	movq	96(%rsp), %r10          # 8-byte Reload
	movq	88(%rsp), %r11          # 8-byte Reload
	movl	$0, %r15d
	js	.LBB5_25
	.p2align	4, 0x90
.LBB5_12:                               # %polly.loop_header28.us
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        #         Parent Loop BB5_8 Depth=4
                                        #           Parent Loop BB5_10 Depth=5
                                        # =>          This Loop Header: Depth=6
                                        #               Child Loop BB5_13 Depth 7
                                        #               Child Loop BB5_22 Depth 7
	movq	128(%rsp), %rax         # 8-byte Reload
	leaq	(%r15,%rax), %rax
	imulq	%r12, %rax
	movq	136(%rsp), %rdx         # 8-byte Reload
	leaq	(%rdx,%rax), %r14
	movq	(%rbp,%r14,8), %rdi
	movq	$-1, %rdx
	movq	%r10, %rbx
	movq	%r11, %r12
	.p2align	4, 0x90
.LBB5_13:                               # %polly.loop_header38.us
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        #         Parent Loop BB5_8 Depth=4
                                        #           Parent Loop BB5_10 Depth=5
                                        #             Parent Loop BB5_12 Depth=6
                                        # =>            This Inner Loop Header: Depth=7
	movq	-24(%r12), %rsi
	movq	-16(%r12), %r13
	.loc	1 60 58                 # MatrixMult.c:60:58
	imulq	-24(%rbx), %rsi
	.loc	1 60 39 is_stmt 0       # MatrixMult.c:60:39
	addq	%rdi, %rsi
	.loc	1 60 58                 # MatrixMult.c:60:58
	imulq	-16(%rbx), %r13
	.loc	1 60 39                 # MatrixMult.c:60:39
	addq	%rsi, %r13
	movq	-8(%r12), %rsi
	.loc	1 60 58                 # MatrixMult.c:60:58
	imulq	-8(%rbx), %rsi
	.loc	1 60 39                 # MatrixMult.c:60:39
	addq	%r13, %rsi
	movq	(%r12), %rdi
	.loc	1 60 58                 # MatrixMult.c:60:58
	imulq	(%rbx), %rdi
	.loc	1 60 39                 # MatrixMult.c:60:39
	addq	%rsi, %rdi
	incq	%rdx
	addq	$32, %r12
	addq	$32, %rbx
	cmpq	%rcx, %rdx
	jle	.LBB5_13
# BB#14:                                # %polly.cond.loopexit.us
                                        #   in Loop: Header=BB5_12 Depth=6
	movq	%rdi, (%rbp,%r14,8)
	cmpb	$0, 7(%rsp)             # 1-byte Folded Reload
	jne	.LBB5_24
# BB#15:                                # %polly.loop_header59.preheader.us
                                        #   in Loop: Header=BB5_12 Depth=6
	cmpq	$0, 112(%rsp)           # 8-byte Folded Reload
	jne	.LBB5_19
# BB#16:                                #   in Loop: Header=BB5_12 Depth=6
	movq	%rbp, %r12
                                        # implicit-def: %RDX
	xorl	%esi, %esi
	jmp	.LBB5_20
	.p2align	4, 0x90
.LBB5_19:                               # %polly.loop_header59.us.prol
                                        #   in Loop: Header=BB5_12 Depth=6
	movq	%rbp, %r12
	addq	64(%rsp), %rax          # 8-byte Folded Reload
	movq	8(%rsp), %rdx           # 8-byte Reload
	movq	(%rdx,%rax,8), %rdx
	.loc	1 60 58                 # MatrixMult.c:60:58
	movq	16(%rsp), %rsi          # 8-byte Reload
	imulq	(%rsi,%rax,8), %rdx
	.loc	1 60 39                 # MatrixMult.c:60:39
	addq	%rdi, %rdx
	movq	%rdx, %rdi
	movl	$1, %esi
.LBB5_20:                               # %polly.loop_header59.preheader.us.split
                                        #   in Loop: Header=BB5_12 Depth=6
	cmpq	$0, 104(%rsp)           # 8-byte Folded Reload
	je	.LBB5_23
# BB#21:                                # %polly.loop_header59.preheader.us.split.split
                                        #   in Loop: Header=BB5_12 Depth=6
	movq	72(%rsp), %rax          # 8-byte Reload
	subq	%rsi, %rax
	leaq	(%rsi,%r8), %rdx
	movq	8(%rsp), %rbx           # 8-byte Reload
	leaq	(%rbx,%rdx,8), %rbx
	addq	%r9, %rsi
	movq	16(%rsp), %rdx          # 8-byte Reload
	leaq	(%rdx,%rsi,8), %rsi
	.p2align	4, 0x90
.LBB5_22:                               # %polly.loop_header59.us
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        #         Parent Loop BB5_8 Depth=4
                                        #           Parent Loop BB5_10 Depth=5
                                        #             Parent Loop BB5_12 Depth=6
                                        # =>            This Inner Loop Header: Depth=7
	movq	(%rbx), %rbp
	movq	8(%rbx), %rdx
	.loc	1 60 58                 # MatrixMult.c:60:58
	imulq	-8(%rsi), %rbp
	.loc	1 60 39                 # MatrixMult.c:60:39
	addq	%rdi, %rbp
	.loc	1 60 58                 # MatrixMult.c:60:58
	imulq	(%rsi), %rdx
	.loc	1 60 39                 # MatrixMult.c:60:39
	addq	%rbp, %rdx
	addq	$16, %rbx
	addq	$16, %rsi
	addq	$-2, %rax
	movq	%rdx, %rdi
	jne	.LBB5_22
.LBB5_23:                               # %polly.merge.loopexit.us
                                        #   in Loop: Header=BB5_12 Depth=6
	movq	%r12, %rbp
	movq	%rdx, (%rbp,%r14,8)
.LBB5_24:                               # %polly.merge.us
                                        #   in Loop: Header=BB5_12 Depth=6
	movq	296(%rsp), %rax         # 8-byte Reload
	addq	%rax, %r11
	addq	%rax, %r10
	movq	304(%rsp), %r12         # 8-byte Reload
	addq	%r12, %r8
	addq	%r12, %r9
	cmpq	120(%rsp), %r15         # 8-byte Folded Reload
	leaq	1(%r15), %r15
	jle	.LBB5_12
	jmp	.LBB5_26
	.p2align	4, 0x90
.LBB5_25:                               # %polly.loop_header28.preheader.split
                                        #   in Loop: Header=BB5_10 Depth=5
	cmpb	$0, 7(%rsp)             # 1-byte Folded Reload
	movq	48(%rsp), %r10          # 8-byte Reload
	movq	40(%rsp), %r8           # 8-byte Reload
	movl	$0, %r11d
	jne	.LBB5_26
	.p2align	4, 0x90
.LBB5_28:                               # %polly.loop_header28
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        #         Parent Loop BB5_8 Depth=4
                                        #           Parent Loop BB5_10 Depth=5
                                        # =>          This Loop Header: Depth=6
                                        #               Child Loop BB5_33 Depth 7
	movq	128(%rsp), %rax         # 8-byte Reload
	leaq	(%r11,%rax), %rax
	imulq	%r12, %rax
	movq	136(%rsp), %rdx         # 8-byte Reload
	leaq	(%rdx,%rax), %r9
	cmpq	$0, 112(%rsp)           # 8-byte Folded Reload
	movq	(%rbp,%r9,8), %rbx
	movq	%rbp, %r14
	jne	.LBB5_30
# BB#29:                                #   in Loop: Header=BB5_28 Depth=6
                                        # implicit-def: %RDX
	xorl	%ebp, %ebp
	jmp	.LBB5_31
	.p2align	4, 0x90
.LBB5_30:                               # %polly.loop_header59.prol
                                        #   in Loop: Header=BB5_28 Depth=6
	addq	64(%rsp), %rax          # 8-byte Folded Reload
	movq	8(%rsp), %rdx           # 8-byte Reload
	movq	(%rdx,%rax,8), %rdx
	.loc	1 60 58                 # MatrixMult.c:60:58
	movq	16(%rsp), %rsi          # 8-byte Reload
	imulq	(%rsi,%rax,8), %rdx
	.loc	1 60 39                 # MatrixMult.c:60:39
	addq	%rbx, %rdx
	movq	%rdx, %rbx
	movl	$1, %ebp
.LBB5_31:                               # %polly.loop_header28.split
                                        #   in Loop: Header=BB5_28 Depth=6
	cmpq	$0, 104(%rsp)           # 8-byte Folded Reload
	je	.LBB5_34
# BB#32:                                # %polly.loop_header28.split.split
                                        #   in Loop: Header=BB5_28 Depth=6
	movq	72(%rsp), %rax          # 8-byte Reload
	subq	%rbp, %rax
	leaq	(%rbp,%r8), %rdx
	movq	8(%rsp), %rsi           # 8-byte Reload
	leaq	(%rsi,%rdx,8), %rsi
	addq	%r10, %rbp
	movq	16(%rsp), %rdx          # 8-byte Reload
	leaq	(%rdx,%rbp,8), %rbp
	.p2align	4, 0x90
.LBB5_33:                               # %polly.loop_header59
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        #         Parent Loop BB5_8 Depth=4
                                        #           Parent Loop BB5_10 Depth=5
                                        #             Parent Loop BB5_28 Depth=6
                                        # =>            This Inner Loop Header: Depth=7
	movq	(%rsi), %rdi
	movq	8(%rsi), %rdx
	.loc	1 60 58                 # MatrixMult.c:60:58
	imulq	-8(%rbp), %rdi
	.loc	1 60 39                 # MatrixMult.c:60:39
	addq	%rbx, %rdi
	.loc	1 60 58                 # MatrixMult.c:60:58
	imulq	(%rbp), %rdx
	.loc	1 60 39                 # MatrixMult.c:60:39
	addq	%rdi, %rdx
	addq	$16, %rsi
	addq	$16, %rbp
	addq	$-2, %rax
	movq	%rdx, %rbx
	jne	.LBB5_33
.LBB5_34:                               # %polly.merge.loopexit
                                        #   in Loop: Header=BB5_28 Depth=6
	movq	%r14, %rbp
	movq	%rdx, (%rbp,%r9,8)
	addq	%r12, %r8
	addq	%r12, %r10
	cmpq	120(%rsp), %r11         # 8-byte Folded Reload
	leaq	1(%r11), %r11
	jle	.LBB5_28
	.p2align	4, 0x90
.LBB5_26:                               # %polly.loop_exit30
                                        #   in Loop: Header=BB5_10 Depth=5
	movq	56(%rsp), %rax          # 8-byte Reload
	cmpq	280(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	jle	.LBB5_10
.LBB5_27:                               # %polly.loop_exit21
                                        #   in Loop: Header=BB5_8 Depth=4
	addq	$256, 88(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	addq	$256, 96(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	movq	32(%rsp), %rax          # 8-byte Reload
	cmpq	248(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	jne	.LBB5_8
# BB#17:                                # %polly.loop_exit13
                                        #   in Loop: Header=BB5_7 Depth=3
	movq	208(%rsp), %rax         # 8-byte Reload
	addq	%rax, 40(%rsp)          # 8-byte Folded Spill
	addq	%rax, 48(%rsp)          # 8-byte Folded Spill
	movq	200(%rsp), %rax         # 8-byte Reload
	movq	224(%rsp), %rdx         # 8-byte Reload
	addq	%rax, %rdx
	movq	232(%rsp), %rcx         # 8-byte Reload
	addq	%rax, %rcx
	movq	216(%rsp), %rax         # 8-byte Reload
	cmpq	80(%rsp), %rax          # 8-byte Folded Reload
	leaq	1(%rax), %rax
	jne	.LBB5_7
.LBB5_18:                               # %polly.loop_exit6
                                        #   in Loop: Header=BB5_5 Depth=2
	movq	24(%rsp), %rax          # 8-byte Reload
	cmpq	192(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	jle	.LBB5_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB5_4 Depth=1
	leaq	152(%rsp), %rdi
	leaq	144(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB5_4
.LBB5_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$312, %rsp              # imm = 0x138
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
	subq	$360, %rsp              # imm = 0x168
.Ltmp149:
	.cfi_def_cfa_offset 416
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
	movl	(%rdi), %ebx
	movslq	4(%rdi), %rax
	movq	%rax, 264(%rsp)         # 8-byte Spill
	movq	8(%rdi), %rbp
	movq	16(%rdi), %rax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	leaq	216(%rsp), %rdi
	leaq	208(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB6_2
# BB#1:                                 # %polly.par.loadIVBounds.lr.ph
	movslq	%ebx, %r15
	movq	%r15, 312(%rsp)         # 8-byte Spill
	movl	%ebx, %eax
	andl	$3, %eax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	leaq	-1(%r15), %rcx
	sarq	$5, %rcx
	movq	%rcx, 112(%rsp)         # 8-byte Spill
	movq	%r15, %rcx
	shrq	$2, %rcx
	decq	%rcx
	movq	%rcx, 280(%rsp)         # 8-byte Spill
	movq	%r15, %rcx
	subq	%rax, %rcx
	movq	%rcx, 24(%rsp)          # 8-byte Spill
	leaq	-1(%rax), %rdx
	movq	%rdx, 176(%rsp)         # 8-byte Spill
	andl	$1, %ebx
	movq	%rbx, 184(%rsp)         # 8-byte Spill
	imulq	%r15, %rcx
	movq	%rcx, 160(%rsp)         # 8-byte Spill
	movq	%rax, %rcx
	negq	%rcx
	movq	%rcx, 256(%rsp)         # 8-byte Spill
	movq	%r15, %r14
	shlq	$5, %r14
	leaq	1(%r15), %rcx
	subq	%rax, %rcx
	movq	%rcx, 168(%rsp)         # 8-byte Spill
	leaq	(%r15,%r15), %r12
	movq	%r12, 304(%rsp)         # 8-byte Spill
	movq	8(%rsp), %rax           # 8-byte Reload
	leaq	24(%rax), %rax
	movq	%rax, 248(%rsp)         # 8-byte Spill
	movq	%r15, %rax
	shlq	$8, %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	leaq	(%r15,%r15,2), %rax
	movq	%rbp, 72(%rsp)          # 8-byte Spill
	leaq	(%rbp,%rax,8), %rax
	movq	%rax, 240(%rsp)         # 8-byte Spill
	movq	%r15, %rax
	shlq	$4, %rax
	addq	%rbp, %rax
	movq	%rax, 232(%rsp)         # 8-byte Spill
	leaq	(,%r15,8), %rax
	movq	%rax, 296(%rsp)         # 8-byte Spill
	leaq	(%rbp,%r15,8), %rax
	movq	%rax, 224(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB6_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_5 Depth 2
                                        #       Child Loop BB6_7 Depth 3
                                        #         Child Loop BB6_22 Depth 4
                                        #           Child Loop BB6_26 Depth 5
                                        #         Child Loop BB6_10 Depth 4
                                        #           Child Loop BB6_11 Depth 5
                                        #           Child Loop BB6_17 Depth 5
	movq	208(%rsp), %rax
	movq	216(%rsp), %rcx
	movq	%rcx, 40(%rsp)          # 8-byte Spill
	addq	$-2, %rax
	movq	%rax, 272(%rsp)         # 8-byte Spill
	movq	%rcx, %rax
	shlq	$5, %rax
	orq	$1, %rax
	imulq	%r15, %rax
	addq	256(%rsp), %rax         # 8-byte Folded Reload
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	%rcx, %rdx
	shlq	$8, %rdx
	movq	72(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%rdx), %rax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	56(%rsp), %rax          # 8-byte Reload
	imulq	%rcx, %rax
	addq	248(%rsp), %rax         # 8-byte Folded Reload
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	240(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rdx), %rax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movq	232(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rdx), %rax
	movq	%rax, 88(%rsp)          # 8-byte Spill
	addq	224(%rsp), %rdx         # 8-byte Folded Reload
	movq	%rdx, 104(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB6_5:                                # %polly.loop_header
                                        #   Parent Loop BB6_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_7 Depth 3
                                        #         Child Loop BB6_22 Depth 4
                                        #           Child Loop BB6_26 Depth 5
                                        #         Child Loop BB6_10 Depth 4
                                        #           Child Loop BB6_11 Depth 5
                                        #           Child Loop BB6_17 Depth 5
	cmpq	$0, 112(%rsp)           # 8-byte Folded Reload
	js	.LBB6_21
# BB#6:                                 # %polly.loop_header4.preheader
                                        #   in Loop: Header=BB6_5 Depth=2
	movq	40(%rsp), %rax          # 8-byte Reload
	shlq	$5, %rax
	movq	%rax, 192(%rsp)         # 8-byte Spill
	movq	264(%rsp), %rcx         # 8-byte Reload
	subq	%rax, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovgq	%rax, %rcx
	movq	%rcx, 288(%rsp)         # 8-byte Spill
	leaq	-1(%rcx), %rax
	movq	%rax, 200(%rsp)         # 8-byte Spill
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	%rax, 152(%rsp)         # 8-byte Spill
	movq	104(%rsp), %rax         # 8-byte Reload
	movq	%rax, 144(%rsp)         # 8-byte Spill
	movq	88(%rsp), %rax          # 8-byte Reload
	movq	%rax, 136(%rsp)         # 8-byte Spill
	movq	96(%rsp), %rax          # 8-byte Reload
	movq	%rax, 128(%rsp)         # 8-byte Spill
	movq	32(%rsp), %rax          # 8-byte Reload
	movq	%rax, 120(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB6_7:                                # %polly.loop_header4
                                        #   Parent Loop BB6_4 Depth=1
                                        #     Parent Loop BB6_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB6_22 Depth 4
                                        #           Child Loop BB6_26 Depth 5
                                        #         Child Loop BB6_10 Depth 4
                                        #           Child Loop BB6_11 Depth 5
                                        #           Child Loop BB6_17 Depth 5
	cmpq	$0, 288(%rsp)           # 8-byte Folded Reload
	js	.LBB6_20
# BB#8:                                 # %polly.loop_header12.preheader
                                        #   in Loop: Header=BB6_7 Depth=3
	movq	80(%rsp), %rax          # 8-byte Reload
	testl	%eax, %eax
	sete	%al
	movq	64(%rsp), %rdx          # 8-byte Reload
	leaq	(,%rdx,8), %rcx
	movq	280(%rsp), %r8          # 8-byte Reload
	subq	%rcx, %r8
	cmpq	$7, %r8
	movl	$7, %ecx
	cmovgq	%rcx, %r8
	movq	%rdx, %rcx
	shlq	$5, %rcx
	orq	$31, %rcx
	cmpq	%r15, %rcx
	setl	%cl
	orb	%al, %cl
	movb	%cl, 7(%rsp)            # 1-byte Spill
	testq	%r8, %r8
	js	.LBB6_19
# BB#9:                                 #   in Loop: Header=BB6_7 Depth=3
	decq	%r8
	movq	16(%rsp), %rbx          # 8-byte Reload
	movq	48(%rsp), %r10          # 8-byte Reload
	movq	152(%rsp), %rdx         # 8-byte Reload
	movq	144(%rsp), %rsi         # 8-byte Reload
	movq	136(%rsp), %rbp         # 8-byte Reload
	movq	128(%rsp), %r9          # 8-byte Reload
	movq	120(%rsp), %r11         # 8-byte Reload
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB6_10:                               # %polly.loop_header12.us
                                        #   Parent Loop BB6_4 Depth=1
                                        #     Parent Loop BB6_5 Depth=2
                                        #       Parent Loop BB6_7 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB6_11 Depth 5
                                        #           Child Loop BB6_17 Depth 5
	movq	%rbp, 328(%rsp)         # 8-byte Spill
	movq	%rsi, 336(%rsp)         # 8-byte Spill
	movq	%rdx, 344(%rsp)         # 8-byte Spill
	movq	%r10, 352(%rsp)         # 8-byte Spill
	movq	192(%rsp), %rax         # 8-byte Reload
	leaq	(%r13,%rax), %rcx
	movq	%rcx, 320(%rsp)         # 8-byte Spill
	imulq	%r15, %rcx
	movq	$-1, %r10
	movq	%rdx, %rax
	movq	%rsi, %rdx
	movq	%r9, %r12
	movq	%r11, %rdi
	.p2align	4, 0x90
.LBB6_11:                               # %polly.loop_header21.us
                                        #   Parent Loop BB6_4 Depth=1
                                        #     Parent Loop BB6_5 Depth=2
                                        #       Parent Loop BB6_7 Depth=3
                                        #         Parent Loop BB6_10 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movq	(%rax), %r15
	movq	%r15, -24(%rdi)
	movq	(%rdx), %rsi
	movq	%rsi, -16(%rdi)
	movq	(%rbp), %rsi
	movq	%rsi, -8(%rdi)
	movq	(%r12), %rsi
	movq	%rsi, (%rdi)
	incq	%r10
	addq	$32, %rdi
	addq	%r14, %r12
	addq	%r14, %rbp
	addq	%r14, %rdx
	addq	%r14, %rax
	cmpq	%r8, %r10
	jle	.LBB6_11
# BB#12:                                # %polly.cond.loopexit.us
                                        #   in Loop: Header=BB6_10 Depth=4
	movb	7(%rsp), %al            # 1-byte Reload
	testb	%al, %al
	movq	312(%rsp), %r15         # 8-byte Reload
	movq	304(%rsp), %r12         # 8-byte Reload
	movq	352(%rsp), %r10         # 8-byte Reload
	jne	.LBB6_18
# BB#13:                                # %polly.loop_header38.us.preheader
                                        #   in Loop: Header=BB6_10 Depth=4
	cmpq	$0, 184(%rsp)           # 8-byte Folded Reload
	movl	$0, %edi
	je	.LBB6_15
# BB#14:                                # %polly.loop_header38.us.prol
                                        #   in Loop: Header=BB6_10 Depth=4
	movq	320(%rsp), %rdx         # 8-byte Reload
	addq	160(%rsp), %rdx         # 8-byte Folded Reload
	movq	72(%rsp), %rax          # 8-byte Reload
	movq	(%rax,%rdx,8), %rax
	addq	24(%rsp), %rcx          # 8-byte Folded Reload
	movq	8(%rsp), %rdx           # 8-byte Reload
	movq	%rax, (%rdx,%rcx,8)
	movl	$1, %edi
.LBB6_15:                               # %polly.loop_header38.us.preheader.split
                                        #   in Loop: Header=BB6_10 Depth=4
	cmpq	$0, 176(%rsp)           # 8-byte Folded Reload
	je	.LBB6_18
# BB#16:                                # %polly.loop_header38.us.preheader.split.split
                                        #   in Loop: Header=BB6_10 Depth=4
	movq	80(%rsp), %rax          # 8-byte Reload
	subq	%rdi, %rax
	leaq	(%rdi,%r10), %rcx
	movq	8(%rsp), %rdx           # 8-byte Reload
	leaq	(%rdx,%rcx,8), %rcx
	movq	168(%rsp), %rdx         # 8-byte Reload
	leaq	(%rdx,%rdi), %rdx
	imulq	%r15, %rdx
	leaq	(%rbx,%rdx,8), %rdx
	addq	24(%rsp), %rdi          # 8-byte Folded Reload
	imulq	%r15, %rdi
	leaq	(%rbx,%rdi,8), %rdi
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB6_17:                               # %polly.loop_header38.us
                                        #   Parent Loop BB6_4 Depth=1
                                        #     Parent Loop BB6_5 Depth=2
                                        #       Parent Loop BB6_7 Depth=3
                                        #         Parent Loop BB6_10 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movq	(%rdi,%rbp,8), %rsi
	movq	%rsi, (%rcx)
	movq	(%rdx,%rbp,8), %rsi
	movq	%rsi, 8(%rcx)
	addq	$16, %rcx
	addq	%r12, %rbp
	addq	$-2, %rax
	jne	.LBB6_17
.LBB6_18:                               # %polly.merge.us
                                        #   in Loop: Header=BB6_10 Depth=4
	addq	296(%rsp), %r11         # 8-byte Folded Reload
	addq	$8, %r9
	movq	328(%rsp), %rbp         # 8-byte Reload
	addq	$8, %rbp
	movq	336(%rsp), %rsi         # 8-byte Reload
	addq	$8, %rsi
	movq	344(%rsp), %rdx         # 8-byte Reload
	addq	$8, %rdx
	addq	%r15, %r10
	addq	$8, %rbx
	cmpq	200(%rsp), %r13         # 8-byte Folded Reload
	leaq	1(%r13), %r13
	jle	.LBB6_10
	jmp	.LBB6_20
	.p2align	4, 0x90
.LBB6_19:                               # %polly.loop_header12.preheader.split
                                        #   in Loop: Header=BB6_7 Depth=3
	testb	%cl, %cl
	movq	16(%rsp), %r9           # 8-byte Reload
	movq	48(%rsp), %r8           # 8-byte Reload
	movl	$0, %esi
	jne	.LBB6_20
	.p2align	4, 0x90
.LBB6_22:                               # %polly.loop_header12
                                        #   Parent Loop BB6_4 Depth=1
                                        #     Parent Loop BB6_5 Depth=2
                                        #       Parent Loop BB6_7 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB6_26 Depth 5
	cmpq	$0, 184(%rsp)           # 8-byte Folded Reload
	movl	$0, %edx
	je	.LBB6_24
# BB#23:                                # %polly.loop_header38.prol
                                        #   in Loop: Header=BB6_22 Depth=4
	movq	192(%rsp), %rax         # 8-byte Reload
	leaq	(%rsi,%rax), %rcx
	movq	160(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rcx), %rdx
	imulq	%r15, %rcx
	movq	72(%rsp), %rax          # 8-byte Reload
	movq	(%rax,%rdx,8), %rdx
	addq	24(%rsp), %rcx          # 8-byte Folded Reload
	movq	8(%rsp), %rax           # 8-byte Reload
	movq	%rdx, (%rax,%rcx,8)
	movl	$1, %edx
.LBB6_24:                               # %polly.loop_header12.split
                                        #   in Loop: Header=BB6_22 Depth=4
	cmpq	$0, 176(%rsp)           # 8-byte Folded Reload
	je	.LBB6_27
# BB#25:                                # %polly.loop_header12.split.split
                                        #   in Loop: Header=BB6_22 Depth=4
	movq	80(%rsp), %rcx          # 8-byte Reload
	subq	%rdx, %rcx
	leaq	(%rdx,%r8), %rdi
	movq	8(%rsp), %rax           # 8-byte Reload
	leaq	(%rax,%rdi,8), %rdi
	movq	168(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rdx), %rbp
	imulq	%r15, %rbp
	leaq	(%r9,%rbp,8), %rbp
	addq	24(%rsp), %rdx          # 8-byte Folded Reload
	imulq	%r15, %rdx
	leaq	(%r9,%rdx,8), %rbx
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB6_26:                               # %polly.loop_header38
                                        #   Parent Loop BB6_4 Depth=1
                                        #     Parent Loop BB6_5 Depth=2
                                        #       Parent Loop BB6_7 Depth=3
                                        #         Parent Loop BB6_22 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movq	(%rbx,%rdx,8), %rax
	movq	%rax, (%rdi)
	movq	(%rbp,%rdx,8), %rax
	movq	%rax, 8(%rdi)
	addq	$16, %rdi
	addq	%r12, %rdx
	addq	$-2, %rcx
	jne	.LBB6_26
.LBB6_27:                               # %polly.merge
                                        #   in Loop: Header=BB6_22 Depth=4
	addq	%r15, %r8
	addq	$8, %r9
	cmpq	200(%rsp), %rsi         # 8-byte Folded Reload
	leaq	1(%rsi), %rsi
	jle	.LBB6_22
	.p2align	4, 0x90
.LBB6_20:                               # %polly.loop_exit14
                                        #   in Loop: Header=BB6_7 Depth=3
	addq	$256, 120(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x100
	movq	56(%rsp), %rax          # 8-byte Reload
	addq	%rax, 128(%rsp)         # 8-byte Folded Spill
	addq	%rax, 136(%rsp)         # 8-byte Folded Spill
	addq	%rax, 144(%rsp)         # 8-byte Folded Spill
	addq	%rax, 152(%rsp)         # 8-byte Folded Spill
	movq	64(%rsp), %rax          # 8-byte Reload
	cmpq	112(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	jne	.LBB6_7
.LBB6_21:                               # %polly.loop_exit6
                                        #   in Loop: Header=BB6_5 Depth=2
	addq	%r14, 48(%rsp)          # 8-byte Folded Spill
	addq	$256, 16(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	movq	32(%rsp), %rax          # 8-byte Reload
	addq	56(%rsp), %rax          # 8-byte Folded Reload
	movq	%rax, 32(%rsp)          # 8-byte Spill
	addq	$256, 96(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	addq	$256, 88(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	addq	$256, 104(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x100
	movq	40(%rsp), %rax          # 8-byte Reload
	cmpq	272(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	jle	.LBB6_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB6_4 Depth=1
	leaq	216(%rsp), %rdi
	leaq	208(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB6_4
.LBB6_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$360, %rsp              # imm = 0x168
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
	.quad	.Ltmp57-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	94                      # super-register DW_OP_reg14
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Ltmp64-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	94                      # super-register DW_OP_reg14
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	32                      # 32
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp57-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Ltmp64-.Lfunc_begin0
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
