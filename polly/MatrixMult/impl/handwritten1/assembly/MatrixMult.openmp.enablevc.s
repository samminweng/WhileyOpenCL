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
	movq	%rsi, (%rsp)            # 8-byte Spill
.Ltmp13:
	.loc	1 25 60 prologue_end    # MatrixMult.c:25:60
	movq	%rdi, 8(%rsp)           # 8-byte Spill
	movslq	%edi, %rbp
.Ltmp14:
	#DEBUG_VALUE: init:width <- [%RSP+8]
	.loc	1 25 59 is_stmt 0       # MatrixMult.c:25:59
	leaq	(,%rbp,8), %r12
	.loc	1 25 66                 # MatrixMult.c:25:66
	movslq	%esi, %rbx
	.loc	1 25 65                 # MatrixMult.c:25:65
	movq	%rbx, 32(%rsp)          # 8-byte Spill
.Ltmp15:
	#DEBUG_VALUE: init:height <- [%RSP+0]
	movq	%r12, %rdi
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
	movq	8(%rsp), %rax           # 8-byte Reload
	testl	%eax, %eax
	jle	.LBB0_8
# BB#2:                                 # %for.cond4.preheader.us.preheader
	movq	%rbp, 24(%rsp)          # 8-byte Spill
.Ltmp18:
	.loc	1 29 19                 # MatrixMult.c:29:19
	movq	8(%rsp), %rax           # 8-byte Reload
	leal	-1(%rax), %eax
	leaq	8(,%rax,8), %r14
	movq	(%rsp), %rax            # 8-byte Reload
	leal	-1(%rax), %r15d
	xorl	%ebx, %ebx
	testb	$7, %al
	je	.LBB0_5
# BB#3:                                 # %for.cond4.preheader.us.prol.preheader
	movq	(%rsp), %r13            # 8-byte Reload
	andl	$7, %r13d
	xorl	%ebx, %ebx
	movq	16(%rsp), %rbp          # 8-byte Reload
	.p2align	4, 0x90
.LBB0_4:                                # %for.cond4.preheader.us.prol
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 29 29 is_stmt 0       # MatrixMult.c:29:29
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movq	%r14, %rdx
	callq	memset
.Ltmp19:
	.loc	1 27 5 is_stmt 1 discriminator 1 # MatrixMult.c:27:5
	incq	%rbx
	addq	%r12, %rbp
	cmpl	%ebx, %r13d
	jne	.LBB0_4
.LBB0_5:                                # %for.cond4.preheader.us.preheader.split
.Ltmp20:
	.loc	1 29 19                 # MatrixMult.c:29:19
	cmpl	$7, %r15d
	movq	24(%rsp), %rbp          # 8-byte Reload
	jb	.LBB0_8
# BB#6:                                 # %for.cond4.preheader.us.preheader.split.split
	movq	(%rsp), %rax            # 8-byte Reload
	movl	%eax, %r13d
	subl	%ebx, %r13d
	imulq	%rbp, %rbx
	movq	16(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%rbx,8), %rbx
	shlq	$6, %rbp
	.p2align	4, 0x90
.LBB0_7:                                # %for.cond4.preheader.us
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 29 29 is_stmt 0       # MatrixMult.c:29:29
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movq	%r14, %rdx
	callq	memset
	leaq	(%rbx,%r12), %r15
	xorl	%esi, %esi
	movq	%r15, %rdi
	movq	%r14, %rdx
	callq	memset
	addq	%r12, %r15
	xorl	%esi, %esi
	movq	%r15, %rdi
	movq	%r14, %rdx
	callq	memset
	addq	%r12, %r15
	xorl	%esi, %esi
	movq	%r15, %rdi
	movq	%r14, %rdx
	callq	memset
	addq	%r12, %r15
	xorl	%esi, %esi
	movq	%r15, %rdi
	movq	%r14, %rdx
	callq	memset
	addq	%r12, %r15
	xorl	%esi, %esi
	movq	%r15, %rdi
	movq	%r14, %rdx
	callq	memset
	addq	%r12, %r15
	xorl	%esi, %esi
	movq	%r15, %rdi
	movq	%r14, %rdx
	callq	memset
	addq	%r12, %r15
	xorl	%esi, %esi
	movq	%r15, %rdi
	movq	%r14, %rdx
	callq	memset
.Ltmp21:
	.loc	1 27 5 is_stmt 1 discriminator 1 # MatrixMult.c:27:5
	addq	%rbp, %rbx
	addl	$-8, %r13d
	jne	.LBB0_7
.Ltmp22:
.LBB0_8:                                # %polly.parallel.for
	movq	32(%rsp), %r8           # 8-byte Reload
	decq	%r8
	sarq	$5, %r8
	movq	(%rsp), %r15            # 8-byte Reload
	movl	%r15d, 40(%rsp)
	movq	8(%rsp), %rbx           # 8-byte Reload
	movl	%ebx, 44(%rsp)
	movq	16(%rsp), %rbp          # 8-byte Reload
	movq	%rbp, 48(%rsp)
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
	.loc	1 39 17 discriminator 1 # MatrixMult.c:39:17
	movl	$16, %edi
	callq	malloc
.Ltmp23:
	#DEBUG_VALUE: init:m <- %RAX
	.loc	1 40 13                 # MatrixMult.c:40:13
	movq	%rbp, (%rax)
	.loc	1 41 14                 # MatrixMult.c:41:14
	movl	%ebx, 8(%rax)
	.loc	1 42 15                 # MatrixMult.c:42:15
	movl	%r15d, 12(%rax)
	.loc	1 44 5                  # MatrixMult.c:44:5
	addq	$56, %rsp
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
	subq	$72, %rsp
.Ltmp31:
	.cfi_def_cfa_offset 128
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
	movslq	8(%rsi), %r12
	.loc	1 50 21                 # MatrixMult.c:50:21
	movl	12(%rdi), %eax
.Ltmp38:
	#DEBUG_VALUE: mat_mult:height <- %EAX
	.loc	1 51 28                 # MatrixMult.c:51:28
	movl	%eax, 4(%rsp)           # 4-byte Spill
	movq	(%rdi), %r15
.Ltmp39:
	#DEBUG_VALUE: mat_mult:a_data <- %R15
	.loc	1 52 28                 # MatrixMult.c:52:28
	movq	(%rsi), %r13
.Ltmp40:
	#DEBUG_VALUE: mat_mult:b_data <- %R13
	.loc	1 53 66                 # MatrixMult.c:53:66
	movslq	%eax, %rbp
.Ltmp41:
	#DEBUG_VALUE: mat_mult:height <- [%RSP+4]
	.loc	1 53 65 is_stmt 0       # MatrixMult.c:53:65
	movq	%r12, %rdi
.Ltmp42:
	imulq	%rbp, %rdi
	shlq	$3, %rdi
	.loc	1 53 35 discriminator 1 # MatrixMult.c:53:35
	callq	malloc
.Ltmp43:
	movq	%rax, %rbx
	.loc	1 49 20 is_stmt 1       # MatrixMult.c:49:20
	testq	%r12, %r12
.Ltmp44:
	#DEBUG_VALUE: mat_mult:i <- 0
	jle	.LBB1_14
.Ltmp45:
# BB#1:                                 # %for.cond8.preheader.lr.ph
	#DEBUG_VALUE: mat_mult:b_data <- %R13
	#DEBUG_VALUE: mat_mult:a_data <- %R15
	leaq	-1(%r12), %r14
	movq	%r14, %rcx
	imulq	%r12, %rcx
	addq	%rbp, %rcx
	movq	%r13, 8(%rsp)           # 8-byte Spill
	leaq	(%r13,%rcx,8), %rax
	cmpq	%rbx, %rax
	setbe	%al
	leaq	(%rbx,%rcx,8), %rdx
	cmpq	%r13, %rdx
	setbe	%dil
	movq	%r12, %rsi
	imulq	%rsi, %rsi
	movq	%r15, 16(%rsp)          # 8-byte Spill
	leaq	(%r15,%rsi,8), %rsi
	cmpq	%rbx, %rsi
	setbe	%cl
	cmpq	%r15, %rdx
	setbe	%dl
	orb	%cl, %dl
	movzbl	%dl, %ecx
	cmpl	$1, %ecx
	jne	.LBB1_4
.Ltmp46:
# BB#2:                                 # %for.cond8.preheader.lr.ph
	#DEBUG_VALUE: mat_mult:a_data <- %R15
	#DEBUG_VALUE: mat_mult:b_data <- %R13
	cmpl	4(%rsp), %r12d          # 4-byte Folded Reload
	jl	.LBB1_4
.Ltmp47:
# BB#3:                                 # %for.cond8.preheader.lr.ph
	#DEBUG_VALUE: mat_mult:b_data <- %R13
	#DEBUG_VALUE: mat_mult:a_data <- %R15
	orb	%dil, %al
	je	.LBB1_4
.Ltmp48:
# BB#15:                                # %polly.parallel.for
	#DEBUG_VALUE: mat_mult:a_data <- %R15
	#DEBUG_VALUE: mat_mult:b_data <- %R13
	sarq	$5, %r14
	movl	4(%rsp), %ebp           # 4-byte Reload
	movl	%ebp, 32(%rsp)
	movl	%r12d, 36(%rsp)
	movq	%rbx, 40(%rsp)
	incq	%r14
	leaq	32(%rsp), %r15
.Ltmp49:
	movl	$mat_mult_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r15, %rsi
	movq	%r14, %r8
	callq	GOMP_parallel_loop_runtime_start
	movq	%r15, %rdi
	callq	mat_mult_polly_subfn
	callq	GOMP_parallel_end
	movl	%ebp, 32(%rsp)
	movl	%r12d, 36(%rsp)
	movq	%rbx, 40(%rsp)
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	%rax, 48(%rsp)
	movq	8(%rsp), %rax           # 8-byte Reload
	movq	%rax, 56(%rsp)
	leaq	32(%rsp), %r15
	movl	$mat_mult_polly_subfn_4, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r15, %rsi
	movq	%r14, %r8
	callq	GOMP_parallel_loop_runtime_start
	movq	%r15, %rdi
	callq	mat_mult_polly_subfn_4
	callq	GOMP_parallel_end
	jmp	.LBB1_14
.Ltmp50:
.LBB1_4:                                # %for.cond8.preheader.preheader
	#DEBUG_VALUE: mat_mult:a_data <- %R15
	#DEBUG_VALUE: mat_mult:b_data <- %R13
	.loc	1 56 9 discriminator 1  # MatrixMult.c:56:9
	cmpl	$0, 4(%rsp)             # 4-byte Folded Reload
	jle	.LBB1_14
.Ltmp51:
# BB#5:                                 # %for.cond8.preheader.us.preheader
	#DEBUG_VALUE: mat_mult:b_data <- %R13
	#DEBUG_VALUE: mat_mult:a_data <- %R15
	.loc	1 58 13 discriminator 1 # MatrixMult.c:58:13
	movl	%r12d, %ebp
	andl	$1, %ebp
.Ltmp52:
	.loc	1 57 19                 # MatrixMult.c:57:19
	leaq	(%r12,%r12), %rcx
	xorl	%eax, %eax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
.Ltmp53:
	.p2align	4, 0x90
.LBB1_6:                                # %for.cond8.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_7 Depth 2
                                        #       Child Loop BB1_11 Depth 3
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	%rax, %r11
	imulq	%r12, %r11
	movq	8(%rsp), %r9            # 8-byte Reload
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB1_7:                                # %for.body11.us
                                        #   Parent Loop BB1_6 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_11 Depth 3
	.loc	1 57 25 is_stmt 0       # MatrixMult.c:57:25
	leaq	(%r10,%r11), %rdx
	testl	%ebp, %ebp
	.loc	1 57 29                 # MatrixMult.c:57:29
	movq	$0, (%rbx,%rdx,8)
.Ltmp54:
	#DEBUG_VALUE: mat_mult:k <- 0
	movl	$0, %eax
	movl	$0, %r14d
	je	.LBB1_9
# BB#8:                                 # %for.body16.us.prol
                                        #   in Loop: Header=BB1_7 Depth=2
.Ltmp55:
	.loc	1 59 73 is_stmt 1       # MatrixMult.c:59:73
	movq	8(%rsp), %rax           # 8-byte Reload
	movq	(%rax,%r10,8), %rax
	.loc	1 59 71 is_stmt 0       # MatrixMult.c:59:71
	movq	16(%rsp), %rsi          # 8-byte Reload
	imulq	(%rsi,%r11,8), %rax
	.loc	1 59 33                 # MatrixMult.c:59:33
	movq	%rax, (%rbx,%rdx,8)
	movl	$1, %r14d
.LBB1_9:                                # %for.body11.us.split
                                        #   in Loop: Header=BB1_7 Depth=2
	cmpl	$1, %r12d
	je	.LBB1_12
# BB#10:                                # %for.body11.us.split.split
                                        #   in Loop: Header=BB1_7 Depth=2
	.loc	1 58 13 is_stmt 1 discriminator 1 # MatrixMult.c:58:13
	movl	%r12d, %edi
	subl	%r14d, %edi
	movl	%ebp, %r13d
	leaq	1(%r14), %rbp
	imulq	%r12, %rbp
	leaq	(%r9,%rbp,8), %r8
	movq	24(%rsp), %rsi          # 8-byte Reload
	leaq	(%rsi,%r14), %rbp
	movq	16(%rsp), %rsi          # 8-byte Reload
	leaq	(%rsi,%rbp,8), %r15
	movl	%r13d, %ebp
	imulq	%r12, %r14
	leaq	(%r9,%r14,8), %r13
	.loc	1 59 35                 # MatrixMult.c:59:35
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB1_11:                               # %for.body16.us
                                        #   Parent Loop BB1_6 Depth=1
                                        #     Parent Loop BB1_7 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	.loc	1 59 73 is_stmt 0       # MatrixMult.c:59:73
	movq	(%r13,%r14,8), %rsi
	.loc	1 59 71                 # MatrixMult.c:59:71
	imulq	(%r15), %rsi
	.loc	1 59 51                 # MatrixMult.c:59:51
	addq	%rax, %rsi
	.loc	1 59 33                 # MatrixMult.c:59:33
	movq	%rsi, (%rbx,%rdx,8)
	.loc	1 59 73                 # MatrixMult.c:59:73
	movq	(%r8,%r14,8), %rax
	.loc	1 59 71                 # MatrixMult.c:59:71
	imulq	8(%r15), %rax
	.loc	1 59 51                 # MatrixMult.c:59:51
	addq	%rsi, %rax
	.loc	1 59 33                 # MatrixMult.c:59:33
	movq	%rax, (%rbx,%rdx,8)
	.loc	1 58 13 is_stmt 1 discriminator 1 # MatrixMult.c:58:13
	addq	%rcx, %r14
	addq	$16, %r15
	addl	$-2, %edi
	jne	.LBB1_11
.Ltmp56:
.LBB1_12:                               # %for.inc35.us
                                        #   in Loop: Header=BB1_7 Depth=2
	.loc	1 56 9 discriminator 1  # MatrixMult.c:56:9
	incq	%r10
	addq	$8, %r9
	cmpl	4(%rsp), %r10d          # 4-byte Folded Reload
	jne	.LBB1_7
.Ltmp57:
# BB#13:                                # %for.inc38.loopexit.us
                                        #   in Loop: Header=BB1_6 Depth=1
	movq	64(%rsp), %rax          # 8-byte Reload
	.loc	1 55 5 discriminator 1  # MatrixMult.c:55:5
	incq	%rax
	addq	%r12, 24(%rsp)          # 8-byte Folded Spill
	cmpl	%r12d, %eax
	jne	.LBB1_6
.Ltmp58:
.LBB1_14:                               # %for.end40
	.loc	1 63 17 discriminator 1 # MatrixMult.c:63:17
	movl	$16, %edi
	callq	malloc
.Ltmp59:
	#DEBUG_VALUE: mat_mult:m <- %RAX
	.loc	1 64 14                 # MatrixMult.c:64:14
	movl	%r12d, 8(%rax)
	.loc	1 65 15                 # MatrixMult.c:65:15
	movl	4(%rsp), %ecx           # 4-byte Reload
	movl	%ecx, 12(%rax)
	.loc	1 66 13                 # MatrixMult.c:66:13
	movq	%rbx, (%rax)
	.loc	1 67 5                  # MatrixMult.c:67:5
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp60:
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
.Ltmp61:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp62:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp63:
	.cfi_def_cfa_offset 32
	subq	$64, %rsp
.Ltmp64:
	.cfi_def_cfa_offset 96
.Ltmp65:
	.cfi_offset %rbx, -32
.Ltmp66:
	.cfi_offset %r14, -24
.Ltmp67:
	.cfi_offset %r15, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
	movq	8(%rsi), %rdi
.Ltmp68:
	leaq	60(%rsp), %rdx
.Ltmp69:
	#DEBUG_VALUE: main:max <- [%RDX+0]
	.loc	1 75 5 is_stmt 0        # MatrixMult.c:75:5
	movl	$.L.str, %esi
.Ltmp70:
	xorl	%eax, %eax
	callq	__isoc99_sscanf
.Ltmp71:
	.loc	1 76 24 is_stmt 1       # MatrixMult.c:76:24
	movl	60(%rsp), %esi
.Ltmp72:
	#DEBUG_VALUE: main:max <- %ESI
	.loc	1 76 5 is_stmt 0        # MatrixMult.c:76:5
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp73:
	.loc	1 78 22 is_stmt 1       # MatrixMult.c:78:22
	movl	60(%rsp), %edi
.Ltmp74:
	#DEBUG_VALUE: main:max <- %EDI
	.loc	1 78 17 is_stmt 0 discriminator 1 # MatrixMult.c:78:17
	movl	%edi, %esi
	callq	init
.Ltmp75:
	movq	%rax, %r14
.Ltmp76:
	#DEBUG_VALUE: main:a <- %R14
	.loc	1 79 22 is_stmt 1       # MatrixMult.c:79:22
	movl	60(%rsp), %edi
.Ltmp77:
	#DEBUG_VALUE: main:max <- %EDI
	.loc	1 79 17 is_stmt 0 discriminator 1 # MatrixMult.c:79:17
	movl	%edi, %esi
	callq	init
.Ltmp78:
	movq	%rax, %rbx
.Ltmp79:
	#DEBUG_VALUE: main:b <- %RBX
	.loc	1 81 17 is_stmt 1 discriminator 1 # MatrixMult.c:81:17
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	mat_mult
	movq	%rax, %r15
.Ltmp80:
	#DEBUG_VALUE: main:c <- %R15
	.loc	1 83 48                 # MatrixMult.c:83:48
	movl	60(%rsp), %esi
.Ltmp81:
	#DEBUG_VALUE: main:max <- %ESI
	.loc	1 83 5 is_stmt 0        # MatrixMult.c:83:5
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	movl	%esi, %edx
	callq	printf
.Ltmp82:
	.loc	1 85 9 is_stmt 1        # MatrixMult.c:85:9
	movl	60(%rsp), %edx
.Ltmp83:
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
.Ltmp84:
	.loc	1 88 5                  # MatrixMult.c:88:5
	xorl	%eax, %eax
	addq	$64, %rsp
	popq	%rbx
.Ltmp85:
	popq	%r14
.Ltmp86:
	popq	%r15
.Ltmp87:
	retq
.Ltmp88:
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
.Ltmp89:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp90:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp91:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp92:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp93:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp94:
	.cfi_def_cfa_offset 56
	subq	$136, %rsp
.Ltmp95:
	.cfi_def_cfa_offset 192
.Ltmp96:
	.cfi_offset %rbx, -56
.Ltmp97:
	.cfi_offset %r12, -48
.Ltmp98:
	.cfi_offset %r13, -40
.Ltmp99:
	.cfi_offset %r14, -32
.Ltmp100:
	.cfi_offset %r15, -24
.Ltmp101:
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
	.loc	1 35 47                 # MatrixMult.c:35:47
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
	.type	mat_mult_polly_subfn,@function
mat_mult_polly_subfn:                   # @mat_mult_polly_subfn
.Lfunc_begin4:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Ltmp102:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp103:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp104:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp105:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp106:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp107:
	.cfi_def_cfa_offset 56
	subq	$168, %rsp
.Ltmp108:
	.cfi_def_cfa_offset 224
.Ltmp109:
	.cfi_offset %rbx, -56
.Ltmp110:
	.cfi_offset %r12, -48
.Ltmp111:
	.cfi_offset %r13, -40
.Ltmp112:
	.cfi_offset %r14, -32
.Ltmp113:
	.cfi_offset %r15, -24
.Ltmp114:
	.cfi_offset %rbp, -16
	movl	(%rdi), %ebx
	movslq	4(%rdi), %rbp
	movq	8(%rdi), %rax
	movq	%rax, 104(%rsp)         # 8-byte Spill
	leaq	80(%rsp), %rdi
	leaq	72(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB4_2
# BB#1:                                 # %polly.par.loadIVBounds.lr.ph
	movslq	%ebx, %rax
	movq	%rax, 136(%rsp)         # 8-byte Spill
	andl	$3, %ebx
	movq	%rbx, 144(%rsp)         # 8-byte Spill
	leaq	-1(%rax), %rcx
	sarq	$5, %rcx
	movq	%rcx, 40(%rsp)          # 8-byte Spill
	movq	%rax, %rcx
	shrq	$2, %rcx
	movq	%rcx, 152(%rsp)         # 8-byte Spill
	decq	%rcx
	movq	%rcx, 128(%rsp)         # 8-byte Spill
	movq	%rbp, 112(%rsp)         # 8-byte Spill
	leaq	(,%rbp,8), %r12
	movq	%rbp, %rcx
	shlq	$8, %rcx
	movq	%rcx, 24(%rsp)          # 8-byte Spill
	subq	%rbx, %rax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	shlq	$5, %rbp
	movq	%rbp, 88(%rsp)          # 8-byte Spill
	leaq	(,%rbx,8), %rax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB4_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_5 Depth 2
                                        #       Child Loop BB4_7 Depth 3
                                        #         Child Loop BB4_15 Depth 4
                                        #         Child Loop BB4_11 Depth 4
                                        #         Child Loop BB4_10 Depth 4
	movq	72(%rsp), %rax
	movq	80(%rsp), %rcx
	movq	%rcx, 8(%rsp)           # 8-byte Spill
	addq	$-2, %rax
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	88(%rsp), %rax          # 8-byte Reload
	imulq	%rcx, %rax
	addq	96(%rsp), %rax          # 8-byte Folded Reload
	movq	24(%rsp), %rdx          # 8-byte Reload
	imulq	%rcx, %rdx
	movq	104(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %rax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	addq	%rcx, %rdx
	movq	%rdx, 32(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB4_5:                                # %polly.loop_header
                                        #   Parent Loop BB4_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_7 Depth 3
                                        #         Child Loop BB4_15 Depth 4
                                        #         Child Loop BB4_11 Depth 4
                                        #         Child Loop BB4_10 Depth 4
	cmpq	$0, 40(%rsp)            # 8-byte Folded Reload
	js	.LBB4_14
# BB#6:                                 # %polly.loop_header3.preheader
                                        #   in Loop: Header=BB4_5 Depth=2
	movq	8(%rsp), %rax           # 8-byte Reload
	shlq	$5, %rax
	movq	112(%rsp), %rcx         # 8-byte Reload
	subq	%rax, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovgq	%rax, %rcx
	movq	%rcx, 160(%rsp)         # 8-byte Spill
	leaq	-1(%rcx), %rsi
	movq	32(%rsp), %rax          # 8-byte Reload
	movq	%rax, 48(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB4_7:                                # %polly.loop_header3
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB4_15 Depth 4
                                        #         Child Loop BB4_11 Depth 4
                                        #         Child Loop BB4_10 Depth 4
	movq	%rax, 56(%rsp)          # 8-byte Spill
	leaq	(,%rax,8), %rax
	movq	%rax, %rcx
	subq	152(%rsp), %rcx         # 8-byte Folded Reload
	cmpq	$-9, %rcx
	movq	$-8, %rdx
	cmovleq	%rdx, %rcx
	movq	$-2, %r13
	subq	%rcx, %r13
	cmpq	$-2, %r13
	movq	$-1, %rcx
	cmovleq	%rcx, %r13
	cmpq	$0, 160(%rsp)           # 8-byte Folded Reload
	js	.LBB4_13
# BB#8:                                 # %polly.loop_header11.preheader
                                        #   in Loop: Header=BB4_7 Depth=3
	movq	144(%rsp), %rcx         # 8-byte Reload
	testl	%ecx, %ecx
	sete	%dl
	movq	56(%rsp), %rcx          # 8-byte Reload
	shlq	$5, %rcx
	orq	$31, %rcx
	cmpq	136(%rsp), %rcx         # 8-byte Folded Reload
	setl	%cl
	orb	%dl, %cl
	cmpq	%rax, 128(%rsp)         # 8-byte Folded Reload
	js	.LBB4_12
# BB#9:                                 # %polly.loop_header11.preheader.split.us
                                        #   in Loop: Header=BB4_7 Depth=3
	shlq	$5, %r13
	addq	$64, %r13
	movq	$-1, %r15
	testb	%cl, %cl
	movq	48(%rsp), %rax          # 8-byte Reload
	movq	%rax, %r14
	movq	16(%rsp), %rbx          # 8-byte Reload
	movq	%rax, %rbp
	je	.LBB4_11
	.p2align	4, 0x90
.LBB4_10:                               # %polly.loop_header11.us.us
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_7 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	%rsi, %rbx
	xorl	%esi, %esi
	movq	%r14, %rdi
	movq	%r13, %rdx
	callq	memset
	movq	%rbx, %rsi
	incq	%r15
	addq	%r12, %r14
	cmpq	%rsi, %r15
	jle	.LBB4_10
	jmp	.LBB4_13
	.p2align	4, 0x90
.LBB4_11:                               # %polly.loop_header11.us
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_7 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	%rsi, %r14
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movq	%r13, %rdx
	callq	memset
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movq	64(%rsp), %rdx          # 8-byte Reload
	callq	memset
	movq	%r14, %rsi
	incq	%r15
	addq	%r12, %rbp
	addq	%r12, %rbx
	cmpq	%rsi, %r15
	jle	.LBB4_11
	jmp	.LBB4_13
	.p2align	4, 0x90
.LBB4_12:                               # %polly.loop_header11.preheader.split
                                        #   in Loop: Header=BB4_7 Depth=3
	movq	$-1, %rbp
	testb	%cl, %cl
	movq	16(%rsp), %rbx          # 8-byte Reload
	jne	.LBB4_13
	.p2align	4, 0x90
.LBB4_15:                               # %polly.loop_header11
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_7 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	%rsi, %r14
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movq	64(%rsp), %rdx          # 8-byte Reload
	callq	memset
	movq	%r14, %rsi
	incq	%rbp
	addq	%r12, %rbx
	cmpq	%rsi, %rbp
	jle	.LBB4_15
	.p2align	4, 0x90
.LBB4_13:                               # %polly.loop_exit13
                                        #   in Loop: Header=BB4_7 Depth=3
	addq	$256, 48(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	movq	56(%rsp), %rax          # 8-byte Reload
	cmpq	40(%rsp), %rax          # 8-byte Folded Reload
	leaq	1(%rax), %rax
	jne	.LBB4_7
.LBB4_14:                               # %polly.loop_exit5
                                        #   in Loop: Header=BB4_5 Depth=2
	movq	24(%rsp), %rax          # 8-byte Reload
	addq	%rax, 16(%rsp)          # 8-byte Folded Spill
	addq	%rax, 32(%rsp)          # 8-byte Folded Spill
	movq	8(%rsp), %rax           # 8-byte Reload
	cmpq	120(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	jle	.LBB4_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB4_4 Depth=1
	leaq	80(%rsp), %rdi
	leaq	72(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB4_4
.LBB4_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$168, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end4:
	.size	mat_mult_polly_subfn, .Lfunc_end4-mat_mult_polly_subfn
	.cfi_endproc

	.p2align	4, 0x90
	.type	mat_mult_polly_subfn_4,@function
mat_mult_polly_subfn_4:                 # @mat_mult_polly_subfn_4
.Lfunc_begin5:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Ltmp115:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp116:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp117:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp118:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp119:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp120:
	.cfi_def_cfa_offset 56
	subq	$456, %rsp              # imm = 0x1C8
.Ltmp121:
	.cfi_def_cfa_offset 512
.Ltmp122:
	.cfi_offset %rbx, -56
.Ltmp123:
	.cfi_offset %r12, -48
.Ltmp124:
	.cfi_offset %r13, -40
.Ltmp125:
	.cfi_offset %r14, -32
.Ltmp126:
	.cfi_offset %r15, -24
.Ltmp127:
	.cfi_offset %rbp, -16
	movslq	(%rdi), %rax
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movl	4(%rdi), %ebx
	movq	8(%rdi), %rbp
	movq	16(%rdi), %rax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	24(%rdi), %r14
	leaq	256(%rsp), %rdi
	leaq	248(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB5_2
# BB#1:                                 # %polly.par.loadIVBounds.lr.ph
	movslq	%ebx, %rcx
	movq	%rcx, 8(%rsp)           # 8-byte Spill
	movl	%ebx, %edx
	andl	$3, %edx
	movq	%rdx, 104(%rsp)         # 8-byte Spill
	leaq	-1(%rcx), %rax
	shrq	$5, %rax
	movq	%rax, 352(%rsp)         # 8-byte Spill
	movq	120(%rsp), %rax         # 8-byte Reload
	decq	%rax
	sarq	$5, %rax
	movq	%rax, 128(%rsp)         # 8-byte Spill
	movq	%rcx, %rax
	shrq	$2, %rax
	decq	%rax
	movq	%rax, 344(%rsp)         # 8-byte Spill
	movq	%rcx, %rax
	subq	%rdx, %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	leaq	-1(%rdx), %rsi
	movq	%rsi, 208(%rsp)         # 8-byte Spill
	andl	$1, %ebx
	movq	%rbx, 216(%rsp)         # 8-byte Spill
	imulq	%rcx, %rax
	movq	%rax, 192(%rsp)         # 8-byte Spill
	leaq	1(%rcx), %rax
	subq	%rdx, %rax
	movq	%rax, 200(%rsp)         # 8-byte Spill
	leaq	(%rcx,%rcx), %rax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	negq	%rdx
	movq	%rdx, 272(%rsp)         # 8-byte Spill
	movq	%rcx, %r13
	shlq	$5, %r13
	leaq	(%rcx,%rcx,2), %rax
	movq	%r14, 96(%rsp)          # 8-byte Spill
	leaq	(%r14,%rax,8), %rax
	movq	%rax, 296(%rsp)         # 8-byte Spill
	movq	%rcx, %rax
	shlq	$8, %rax
	movq	%rax, 144(%rsp)         # 8-byte Spill
	movq	%rcx, %rax
	shlq	$4, %rax
	addq	%r14, %rax
	movq	%rax, 288(%rsp)         # 8-byte Spill
	movq	16(%rsp), %rax          # 8-byte Reload
	leaq	24(%rax), %rax
	movq	%rax, 264(%rsp)         # 8-byte Spill
	leaq	(,%rcx,8), %rax
	movq	%rax, 384(%rsp)         # 8-byte Spill
	leaq	(%r14,%rcx,8), %rax
	movq	%rax, 280(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB5_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_5 Depth 2
                                        #       Child Loop BB5_7 Depth 3
                                        #         Child Loop BB5_8 Depth 4
                                        #           Child Loop BB5_10 Depth 5
                                        #             Child Loop BB5_30 Depth 6
                                        #               Child Loop BB5_35 Depth 7
                                        #             Child Loop BB5_13 Depth 6
                                        #               Child Loop BB5_14 Depth 7
                                        #               Child Loop BB5_23 Depth 7
	movq	248(%rsp), %rax
	movq	256(%rsp), %rcx
	movq	%rcx, 56(%rsp)          # 8-byte Spill
	addq	$-2, %rax
	movq	%rax, 304(%rsp)         # 8-byte Spill
	movq	%rcx, %rax
	shlq	$5, %rax
	orq	$1, %rax
	imulq	8(%rsp), %rax           # 8-byte Folded Reload
	addq	272(%rsp), %rax         # 8-byte Folded Reload
	movq	%rax, 136(%rsp)         # 8-byte Spill
	movq	%r13, %rax
	imulq	%rcx, %rax
	movq	264(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %rax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	%rbp, %rbx
	.p2align	4, 0x90
.LBB5_5:                                # %polly.loop_header
                                        #   Parent Loop BB5_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_7 Depth 3
                                        #         Child Loop BB5_8 Depth 4
                                        #           Child Loop BB5_10 Depth 5
                                        #             Child Loop BB5_30 Depth 6
                                        #               Child Loop BB5_35 Depth 7
                                        #             Child Loop BB5_13 Depth 6
                                        #               Child Loop BB5_14 Depth 7
                                        #               Child Loop BB5_23 Depth 7
	cmpq	$0, 128(%rsp)           # 8-byte Folded Reload
	js	.LBB5_19
# BB#6:                                 # %polly.loop_header5.preheader
                                        #   in Loop: Header=BB5_5 Depth=2
	movq	56(%rsp), %rax          # 8-byte Reload
	shlq	$5, %rax
	movq	%rax, 368(%rsp)         # 8-byte Spill
	movq	8(%rsp), %rcx           # 8-byte Reload
	subq	%rax, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovgq	%rax, %rcx
	movq	%rcx, 360(%rsp)         # 8-byte Spill
	leaq	-1(%rcx), %rax
	movq	%rax, 392(%rsp)         # 8-byte Spill
	movq	280(%rsp), %rcx         # 8-byte Reload
	movq	288(%rsp), %rsi         # 8-byte Reload
	movq	296(%rsp), %r8          # 8-byte Reload
	movq	96(%rsp), %rbp          # 8-byte Reload
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB5_7:                                # %polly.loop_header5
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_8 Depth 4
                                        #           Child Loop BB5_10 Depth 5
                                        #             Child Loop BB5_30 Depth 6
                                        #               Child Loop BB5_35 Depth 7
                                        #             Child Loop BB5_13 Depth 6
                                        #               Child Loop BB5_14 Depth 7
                                        #               Child Loop BB5_23 Depth 7
	movq	%rax, 312(%rsp)         # 8-byte Spill
	movq	%rbp, 80(%rsp)          # 8-byte Spill
	movq	%r8, 320(%rsp)          # 8-byte Spill
	movq	%rsi, 328(%rsp)         # 8-byte Spill
	movq	%rcx, 336(%rsp)         # 8-byte Spill
	movq	%rax, %rdi
	shlq	$5, %rdi
	movq	%rdi, 232(%rsp)         # 8-byte Spill
	movq	120(%rsp), %rax         # 8-byte Reload
	subq	%rdi, %rax
	decq	%rax
	cmpq	$31, %rax
	movl	$31, %edi
	cmovleq	%rax, %rdi
	movq	%rdi, 400(%rsp)         # 8-byte Spill
	leaq	-1(%rdi), %rax
	movq	%rax, 224(%rsp)         # 8-byte Spill
	movq	%rbp, 184(%rsp)         # 8-byte Spill
	movq	%rcx, 176(%rsp)         # 8-byte Spill
	movq	%rsi, 168(%rsp)         # 8-byte Spill
	movq	64(%rsp), %rax          # 8-byte Reload
	movq	%rax, 152(%rsp)         # 8-byte Spill
	movq	%r8, 160(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB5_8:                                # %polly.loop_header12
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB5_10 Depth 5
                                        #             Child Loop BB5_30 Depth 6
                                        #               Child Loop BB5_35 Depth 7
                                        #             Child Loop BB5_13 Depth 6
                                        #               Child Loop BB5_14 Depth 7
                                        #               Child Loop BB5_23 Depth 7
	cmpq	$0, 360(%rsp)           # 8-byte Folded Reload
	js	.LBB5_27
# BB#9:                                 # %polly.loop_header20.preheader
                                        #   in Loop: Header=BB5_8 Depth=4
	movq	104(%rsp), %rax         # 8-byte Reload
	testl	%eax, %eax
	sete	%al
	movq	72(%rsp), %rsi          # 8-byte Reload
	leaq	(,%rsi,8), %rcx
	movq	344(%rsp), %rdi         # 8-byte Reload
	subq	%rcx, %rdi
	cmpq	$7, %rdi
	movl	$7, %ecx
	cmovgq	%rcx, %rdi
	movq	%rdi, 376(%rsp)         # 8-byte Spill
	movq	%rsi, %rcx
	shlq	$5, %rcx
	orq	$31, %rcx
	cmpq	8(%rsp), %rcx           # 8-byte Folded Reload
	setl	%cl
	orb	%al, %cl
	movb	%cl, 7(%rsp)            # 1-byte Spill
	leaq	-1(%rdi), %r11
	movq	152(%rsp), %rax         # 8-byte Reload
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movq	136(%rsp), %rax         # 8-byte Reload
	movq	%rax, 32(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 88(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB5_10:                               # %polly.loop_header20
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        #         Parent Loop BB5_8 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB5_30 Depth 6
                                        #               Child Loop BB5_35 Depth 7
                                        #             Child Loop BB5_13 Depth 6
                                        #               Child Loop BB5_14 Depth 7
                                        #               Child Loop BB5_23 Depth 7
	cmpq	$0, 400(%rsp)           # 8-byte Folded Reload
	js	.LBB5_26
# BB#11:                                # %polly.loop_header29.preheader
                                        #   in Loop: Header=BB5_10 Depth=5
	movq	368(%rsp), %rax         # 8-byte Reload
	movq	88(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	imulq	8(%rsp), %rcx           # 8-byte Folded Reload
	movq	%rcx, 240(%rsp)         # 8-byte Spill
	cmpq	$0, 376(%rsp)           # 8-byte Folded Reload
	js	.LBB5_28
# BB#12:                                # %polly.loop_header29.us.preheader
                                        #   in Loop: Header=BB5_10 Depth=5
	movq	24(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	movq	%rax, 408(%rsp)         # 8-byte Spill
	movq	80(%rsp), %r12          # 8-byte Reload
	movq	184(%rsp), %rsi         # 8-byte Reload
	movq	176(%rsp), %rdi         # 8-byte Reload
	movq	168(%rsp), %rdx         # 8-byte Reload
	movq	160(%rsp), %r14         # 8-byte Reload
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB5_13:                               # %polly.loop_header29.us
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        #         Parent Loop BB5_8 Depth=4
                                        #           Parent Loop BB5_10 Depth=5
                                        # =>          This Loop Header: Depth=6
                                        #               Child Loop BB5_14 Depth 7
                                        #               Child Loop BB5_23 Depth 7
	movq	%r12, 424(%rsp)         # 8-byte Spill
	movq	%rdx, 432(%rsp)         # 8-byte Spill
	movq	%rdi, 440(%rsp)         # 8-byte Spill
	movq	%rsi, 448(%rsp)         # 8-byte Spill
	movq	232(%rsp), %rax         # 8-byte Reload
	leaq	(%r9,%rax), %rax
	movq	%rax, 416(%rsp)         # 8-byte Spill
	leaq	(%rax,%rcx), %rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	(%rbx,%rax,8), %r10
	movq	$-1, %rax
	movq	%rsi, %r12
	movq	%rdi, %rbp
	movq	%rdx, %rcx
	movq	112(%rsp), %r8          # 8-byte Reload
	movq	%r14, %r15
	.p2align	4, 0x90
.LBB5_14:                               # %polly.loop_header39.us
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        #         Parent Loop BB5_8 Depth=4
                                        #           Parent Loop BB5_10 Depth=5
                                        #             Parent Loop BB5_13 Depth=6
                                        # =>            This Inner Loop Header: Depth=7
	movq	(%r12), %rsi
	.loc	1 59 71                 # MatrixMult.c:59:71
	imulq	-24(%r8), %rsi
	.loc	1 59 51 is_stmt 0       # MatrixMult.c:59:51
	addq	%r10, %rsi
	movq	(%rbp), %rdi
	.loc	1 59 71                 # MatrixMult.c:59:71
	imulq	-16(%r8), %rdi
	.loc	1 59 51                 # MatrixMult.c:59:51
	addq	%rsi, %rdi
	movq	(%rcx), %rsi
	.loc	1 59 71                 # MatrixMult.c:59:71
	imulq	-8(%r8), %rsi
	.loc	1 59 51                 # MatrixMult.c:59:51
	addq	%rdi, %rsi
	movq	(%r15), %r10
	.loc	1 59 71                 # MatrixMult.c:59:71
	imulq	(%r8), %r10
	.loc	1 59 51                 # MatrixMult.c:59:51
	addq	%rsi, %r10
	incq	%rax
	addq	%r13, %r15
	addq	$32, %r8
	addq	%r13, %rcx
	addq	%r13, %rbp
	addq	%r13, %r12
	cmpq	%r11, %rax
	jle	.LBB5_14
# BB#15:                                # %polly.cond.loopexit.us
                                        #   in Loop: Header=BB5_13 Depth=6
	movq	48(%rsp), %rax          # 8-byte Reload
	movq	%r10, (%rbx,%rax,8)
	cmpb	$0, 7(%rsp)             # 1-byte Folded Reload
	movq	424(%rsp), %r12         # 8-byte Reload
	jne	.LBB5_25
# BB#16:                                # %polly.loop_header59.us.preheader
                                        #   in Loop: Header=BB5_13 Depth=6
	cmpq	$0, 216(%rsp)           # 8-byte Folded Reload
	jne	.LBB5_20
# BB#17:                                #   in Loop: Header=BB5_13 Depth=6
	movq	%rbx, %r8
                                        # implicit-def: %RAX
	xorl	%edi, %edi
	jmp	.LBB5_21
	.p2align	4, 0x90
.LBB5_20:                               # %polly.loop_header59.us.prol
                                        #   in Loop: Header=BB5_13 Depth=6
	movq	%rbx, %r8
	movq	416(%rsp), %rcx         # 8-byte Reload
	addq	192(%rsp), %rcx         # 8-byte Folded Reload
	movq	96(%rsp), %rax          # 8-byte Reload
	movq	(%rax,%rcx,8), %rax
	.loc	1 59 71                 # MatrixMult.c:59:71
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	408(%rsp), %rdx         # 8-byte Reload
	imulq	(%rcx,%rdx,8), %rax
	.loc	1 59 51                 # MatrixMult.c:59:51
	addq	%r10, %rax
	movq	%rax, %r10
	movl	$1, %edi
.LBB5_21:                               # %polly.loop_header59.us.preheader.split
                                        #   in Loop: Header=BB5_13 Depth=6
	movq	40(%rsp), %r15          # 8-byte Reload
	cmpq	$0, 208(%rsp)           # 8-byte Folded Reload
	je	.LBB5_24
# BB#22:                                # %polly.loop_header59.us.preheader.split.split
                                        #   in Loop: Header=BB5_13 Depth=6
	movq	104(%rsp), %rcx         # 8-byte Reload
	subq	%rdi, %rcx
	movq	200(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rdi), %rax
	movq	8(%rsp), %rbx           # 8-byte Reload
	imulq	%rbx, %rax
	leaq	(%r12,%rax,8), %rbp
	movq	32(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%rdi), %rax
	movq	16(%rsp), %rdx          # 8-byte Reload
	leaq	(%rdx,%rax,8), %rsi
	addq	24(%rsp), %rdi          # 8-byte Folded Reload
	imulq	%rbx, %rdi
	leaq	(%r12,%rdi,8), %rdi
	xorl	%ebx, %ebx
	movq	%r10, %rax
	.p2align	4, 0x90
.LBB5_23:                               # %polly.loop_header59.us
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        #         Parent Loop BB5_8 Depth=4
                                        #           Parent Loop BB5_10 Depth=5
                                        #             Parent Loop BB5_13 Depth=6
                                        # =>            This Inner Loop Header: Depth=7
	movq	(%rdi,%rbx,8), %rdx
	.loc	1 59 71                 # MatrixMult.c:59:71
	imulq	(%rsi), %rdx
	.loc	1 59 51                 # MatrixMult.c:59:51
	addq	%rax, %rdx
	movq	(%rbp,%rbx,8), %rax
	.loc	1 59 71                 # MatrixMult.c:59:71
	imulq	8(%rsi), %rax
	.loc	1 59 51                 # MatrixMult.c:59:51
	addq	%rdx, %rax
	addq	%r15, %rbx
	addq	$16, %rsi
	addq	$-2, %rcx
	jne	.LBB5_23
.LBB5_24:                               # %polly.merge.loopexit.us
                                        #   in Loop: Header=BB5_13 Depth=6
	movq	%r15, 40(%rsp)          # 8-byte Spill
	movq	%r8, %rbx
	movq	48(%rsp), %rcx          # 8-byte Reload
	movq	%rax, (%rbx,%rcx,8)
.LBB5_25:                               # %polly.merge.us
                                        #   in Loop: Header=BB5_13 Depth=6
	addq	$8, %r14
	movq	432(%rsp), %rdx         # 8-byte Reload
	addq	$8, %rdx
	movq	440(%rsp), %rdi         # 8-byte Reload
	addq	$8, %rdi
	movq	448(%rsp), %rsi         # 8-byte Reload
	addq	$8, %rsi
	addq	$8, %r12
	cmpq	224(%rsp), %r9          # 8-byte Folded Reload
	leaq	1(%r9), %r9
	movq	240(%rsp), %rcx         # 8-byte Reload
	jle	.LBB5_13
	jmp	.LBB5_26
	.p2align	4, 0x90
.LBB5_28:                               # %polly.loop_header29.preheader.split
                                        #   in Loop: Header=BB5_10 Depth=5
	cmpb	$0, 7(%rsp)             # 1-byte Folded Reload
	jne	.LBB5_26
# BB#29:                                # %polly.loop_header29.preheader147
                                        #   in Loop: Header=BB5_10 Depth=5
	movq	24(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	80(%rsp), %r15          # 8-byte Reload
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB5_30:                               # %polly.loop_header29
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        #         Parent Loop BB5_8 Depth=4
                                        #           Parent Loop BB5_10 Depth=5
                                        # =>          This Loop Header: Depth=6
                                        #               Child Loop BB5_35 Depth 7
	movq	232(%rsp), %rax         # 8-byte Reload
	leaq	(%r14,%rax), %rax
	leaq	(%rax,%rcx), %r8
	cmpq	$0, 216(%rsp)           # 8-byte Folded Reload
	movq	(%rbx,%r8,8), %r10
	movq	%rbx, %r12
	jne	.LBB5_32
# BB#31:                                #   in Loop: Header=BB5_30 Depth=6
                                        # implicit-def: %RAX
	xorl	%esi, %esi
	jmp	.LBB5_33
	.p2align	4, 0x90
.LBB5_32:                               # %polly.loop_header59.prol
                                        #   in Loop: Header=BB5_30 Depth=6
	addq	192(%rsp), %rax         # 8-byte Folded Reload
	movq	96(%rsp), %rcx          # 8-byte Reload
	movq	(%rcx,%rax,8), %rax
	.loc	1 59 71                 # MatrixMult.c:59:71
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	48(%rsp), %rdx          # 8-byte Reload
	imulq	(%rcx,%rdx,8), %rax
	.loc	1 59 51                 # MatrixMult.c:59:51
	addq	%r10, %rax
	movq	%rax, %r10
	movl	$1, %esi
.LBB5_33:                               # %polly.loop_header29.split
                                        #   in Loop: Header=BB5_30 Depth=6
	cmpq	$0, 208(%rsp)           # 8-byte Folded Reload
	movq	40(%rsp), %r9           # 8-byte Reload
	je	.LBB5_36
# BB#34:                                # %polly.loop_header29.split.split
                                        #   in Loop: Header=BB5_30 Depth=6
	movq	104(%rsp), %rdi         # 8-byte Reload
	subq	%rsi, %rdi
	movq	200(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rsi), %rax
	movq	8(%rsp), %rbp           # 8-byte Reload
	imulq	%rbp, %rax
	leaq	(%r15,%rax,8), %rcx
	movq	32(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%rsi), %rax
	movq	16(%rsp), %rdx          # 8-byte Reload
	leaq	(%rdx,%rax,8), %rbx
	addq	24(%rsp), %rsi          # 8-byte Folded Reload
	imulq	%rbp, %rsi
	leaq	(%r15,%rsi,8), %rsi
	xorl	%ebp, %ebp
	movq	%r10, %rax
	.p2align	4, 0x90
.LBB5_35:                               # %polly.loop_header59
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        #         Parent Loop BB5_8 Depth=4
                                        #           Parent Loop BB5_10 Depth=5
                                        #             Parent Loop BB5_30 Depth=6
                                        # =>            This Inner Loop Header: Depth=7
	movq	(%rsi,%rbp,8), %rdx
	.loc	1 59 71                 # MatrixMult.c:59:71
	imulq	(%rbx), %rdx
	.loc	1 59 51                 # MatrixMult.c:59:51
	addq	%rax, %rdx
	movq	(%rcx,%rbp,8), %rax
	.loc	1 59 71                 # MatrixMult.c:59:71
	imulq	8(%rbx), %rax
	.loc	1 59 51                 # MatrixMult.c:59:51
	addq	%rdx, %rax
	addq	%r9, %rbp
	addq	$16, %rbx
	addq	$-2, %rdi
	jne	.LBB5_35
.LBB5_36:                               # %polly.merge.loopexit
                                        #   in Loop: Header=BB5_30 Depth=6
	movq	%r12, %rbx
	movq	%rax, (%rbx,%r8,8)
	addq	$8, %r15
	cmpq	224(%rsp), %r14         # 8-byte Folded Reload
	leaq	1(%r14), %r14
	movq	240(%rsp), %rcx         # 8-byte Reload
	jle	.LBB5_30
	.p2align	4, 0x90
.LBB5_26:                               # %polly.loop_exit31
                                        #   in Loop: Header=BB5_10 Depth=5
	movq	32(%rsp), %rax          # 8-byte Reload
	addq	8(%rsp), %rax           # 8-byte Folded Reload
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	112(%rsp), %rax         # 8-byte Reload
	addq	384(%rsp), %rax         # 8-byte Folded Reload
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movq	88(%rsp), %rax          # 8-byte Reload
	cmpq	392(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 88(%rsp)          # 8-byte Spill
	jle	.LBB5_10
.LBB5_27:                               # %polly.loop_exit22
                                        #   in Loop: Header=BB5_8 Depth=4
	movq	144(%rsp), %rax         # 8-byte Reload
	addq	%rax, 160(%rsp)         # 8-byte Folded Spill
	addq	$256, 152(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x100
	addq	%rax, 168(%rsp)         # 8-byte Folded Spill
	addq	%rax, 176(%rsp)         # 8-byte Folded Spill
	addq	%rax, 184(%rsp)         # 8-byte Folded Spill
	movq	72(%rsp), %rax          # 8-byte Reload
	cmpq	352(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	jne	.LBB5_8
# BB#18:                                # %polly.loop_exit14
                                        #   in Loop: Header=BB5_7 Depth=3
	movq	80(%rsp), %rbp          # 8-byte Reload
	addq	$256, %rbp              # imm = 0x100
	movq	320(%rsp), %r8          # 8-byte Reload
	addq	$256, %r8               # imm = 0x100
	movq	328(%rsp), %rsi         # 8-byte Reload
	addq	$256, %rsi              # imm = 0x100
	movq	336(%rsp), %rcx         # 8-byte Reload
	addq	$256, %rcx              # imm = 0x100
	movq	312(%rsp), %rax         # 8-byte Reload
	cmpq	128(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	jne	.LBB5_7
.LBB5_19:                               # %polly.loop_exit7
                                        #   in Loop: Header=BB5_5 Depth=2
	addq	%r13, 136(%rsp)         # 8-byte Folded Spill
	movq	64(%rsp), %rax          # 8-byte Reload
	addq	144(%rsp), %rax         # 8-byte Folded Reload
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	56(%rsp), %rax          # 8-byte Reload
	cmpq	304(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	jle	.LBB5_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB5_4 Depth=1
	movq	%rbx, %rbp
	leaq	256(%rsp), %rdi
	leaq	248(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB5_4
.LBB5_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$456, %rsp              # imm = 0x1C8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end5:
	.size	mat_mult_polly_subfn_4, .Lfunc_end5-mat_mult_polly_subfn_4
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
	.byte	8                       # 8
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
	.byte	0                       # 0
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
	.quad	.Ltmp42-.Lfunc_begin0
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
	.quad	.Ltmp41-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	80                      # super-register DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	113                     # DW_OP_breg1
	.byte	0                       # 0
	.quad	.Ltmp72-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	84                      # super-register DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp78-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp81-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	84                      # super-register DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp83-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	81                      # super-register DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Ltmp86-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
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
