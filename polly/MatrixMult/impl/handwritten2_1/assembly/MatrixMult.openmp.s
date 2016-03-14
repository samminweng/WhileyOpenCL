	.text
	.file	"MatrixMult.openmp.ll"
	.file	1 "MatrixMult.c"
	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
.Lfunc_begin0:
	.loc	1 12 0                  # MatrixMult.c:12:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp0:
	.cfi_def_cfa_offset 16
.Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp2:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$32, %rsp
.Ltmp3:
	.cfi_offset %rbx, -48
.Ltmp4:
	.cfi_offset %r12, -40
.Ltmp5:
	.cfi_offset %r14, -32
.Ltmp6:
	.cfi_offset %r15, -24
	#DEBUG_VALUE: init:value <- %EDI
	#DEBUG_VALUE: init:width <- %ESI
	#DEBUG_VALUE: init:height <- %EDX
	movl	%edx, %ebx
.Ltmp7:
	#DEBUG_VALUE: init:height <- %EBX
	movl	%esi, %r14d
.Ltmp8:
	#DEBUG_VALUE: init:width <- %R14D
	movl	%edi, %r12d
.Ltmp9:
	#DEBUG_VALUE: init:value <- %R12D
	.loc	1 15 49 prologue_end    # MatrixMult.c:15:49
	movl	%ebx, %eax
	imull	%r14d, %eax
	.loc	1 15 43 is_stmt 0       # MatrixMult.c:15:43
	movslq	%eax, %rdi
	.loc	1 15 55                 # MatrixMult.c:15:55
	shlq	$2, %rdi
	.loc	1 15 36                 # MatrixMult.c:15:36
	callq	malloc
	movq	%rax, %r15
.Ltmp10:
	#DEBUG_VALUE: init:i <- 0
	.loc	1 16 14 is_stmt 1 discriminator 1 # MatrixMult.c:16:14
	testl	%ebx, %ebx
	jle	.LBB0_2
.Ltmp11:
# BB#1:                                 # %polly.parallel.for
	#DEBUG_VALUE: init:value <- %R12D
	#DEBUG_VALUE: init:width <- %R14D
	#DEBUG_VALUE: init:height <- %EBX
	movslq	%ebx, %r8
	decq	%r8
	sarq	$5, %r8
	movl	%r14d, -56(%rbp)
	movl	%ebx, -52(%rbp)
	movq	%r15, -48(%rbp)
	movl	%r12d, -40(%rbp)
	incq	%r8
	leaq	-56(%rbp), %r12
.Ltmp12:
	movl	$init_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r12, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%r12, %rdi
	callq	init_polly_subfn
	callq	GOMP_parallel_end
.Ltmp13:
.LBB0_2:                                # %for.end10
	#DEBUG_VALUE: init:width <- %R14D
	#DEBUG_VALUE: init:height <- %EBX
	.loc	1 21 44                 # MatrixMult.c:21:44
	movl	$16, %edi
	callq	malloc
.Ltmp14:
	#DEBUG_VALUE: init:matrix <- %RAX
	.loc	1 22 18                 # MatrixMult.c:22:18
	movq	%r15, (%rax)
	.loc	1 23 19                 # MatrixMult.c:23:19
	movl	%r14d, 8(%rax)
	.loc	1 24 20                 # MatrixMult.c:24:20
	movl	%ebx, 12(%rax)
	.loc	1 26 5                  # MatrixMult.c:26:5
	addq	$32, %rsp
	popq	%rbx
.Ltmp15:
	popq	%r12
	popq	%r14
.Ltmp16:
	popq	%r15
	popq	%rbp
	retq
.Ltmp17:
.Lfunc_end0:
	.size	init, .Lfunc_end0-init
	.cfi_endproc

	.globl	matrix_multiply
	.p2align	4, 0x90
	.type	matrix_multiply,@function
matrix_multiply:                        # @matrix_multiply
.Lfunc_begin1:
	.loc	1 29 0                  # MatrixMult.c:29:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp18:
	.cfi_def_cfa_offset 16
.Ltmp19:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp20:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$328, %rsp              # imm = 0x148
.Ltmp21:
	.cfi_offset %rbx, -56
.Ltmp22:
	.cfi_offset %r12, -48
.Ltmp23:
	.cfi_offset %r13, -40
.Ltmp24:
	.cfi_offset %r14, -32
.Ltmp25:
	.cfi_offset %r15, -24
	#DEBUG_VALUE: matrix_multiply:A <- %RDI
	#DEBUG_VALUE: matrix_multiply:B <- %RSI
	movq	%rdi, %r12
.Ltmp26:
	#DEBUG_VALUE: matrix_multiply:A <- %R12
	.loc	1 31 35 prologue_end    # MatrixMult.c:31:35
	movq	(%r12), %rax
.Ltmp27:
	#DEBUG_VALUE: matrix_multiply:A_data <- [%RBP+-64]
	.loc	1 32 35                 # MatrixMult.c:32:35
	movq	%rax, -64(%rbp)         # 8-byte Spill
	movq	(%rsi), %rax
.Ltmp28:
	#DEBUG_VALUE: matrix_multiply:B_data <- [%RBP+-56]
	.loc	1 39 22 discriminator 1 # MatrixMult.c:39:22
	movq	%rax, -56(%rbp)         # 8-byte Spill
	movl	8(%rsi), %ecx
	movl	%ecx, -76(%rbp)         # 4-byte Spill
	movslq	12(%r12), %rbx
.Ltmp29:
	#DEBUG_VALUE: matrix_multiply:width <- %ECX
	.loc	1 36 50                 # MatrixMult.c:36:50
	movq	%rbx, -88(%rbp)         # 8-byte Spill
	movl	%ebx, %eax
	imull	%ecx, %eax
.Ltmp30:
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-76]
	.loc	1 36 45 is_stmt 0       # MatrixMult.c:36:45
	movslq	%eax, %rdi
	.loc	1 36 57                 # MatrixMult.c:36:57
	shlq	$2, %rdi
	.loc	1 36 38                 # MatrixMult.c:36:38
	callq	malloc
	movq	%rax, %r15
	.loc	1 35 21 is_stmt 1       # MatrixMult.c:35:21
	movq	%r15, -160(%rbp)        # 8-byte Spill
	testq	%rbx, %rbx
.Ltmp31:
	#DEBUG_VALUE: matrix_multiply:i <- 0
	jle	.LBB1_14
.Ltmp32:
# BB#1:                                 # %polly.preload.cond179
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-76]
	#DEBUG_VALUE: matrix_multiply:B_data <- [%RBP+-56]
	#DEBUG_VALUE: matrix_multiply:A_data <- [%RBP+-64]
	#DEBUG_VALUE: matrix_multiply:A <- %R12
	#DEBUG_VALUE: matrix_multiply:B <- %RSI
	movl	-76(%rbp), %r13d        # 4-byte Reload
	movslq	%r13d, %rcx
	xorl	%eax, %eax
	testq	%rcx, %rcx
	jle	.LBB1_2
.Ltmp33:
# BB#55:                                # %polly.preload.exec181
	#DEBUG_VALUE: matrix_multiply:B <- %RSI
	#DEBUG_VALUE: matrix_multiply:A <- %R12
	#DEBUG_VALUE: matrix_multiply:A_data <- [%RBP+-64]
	#DEBUG_VALUE: matrix_multiply:B_data <- [%RBP+-56]
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-76]
	movq	8(%r12), %rax
.Ltmp34:
.LBB1_2:                                # %polly.cond185
	#DEBUG_VALUE: matrix_multiply:B <- %RSI
	#DEBUG_VALUE: matrix_multiply:A <- %R12
	#DEBUG_VALUE: matrix_multiply:A_data <- [%RBP+-64]
	#DEBUG_VALUE: matrix_multiply:B_data <- [%RBP+-56]
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-76]
	movq	%rax, -368(%rbp)
	movq	%rcx, %rdx
	movq	%rdx, -168(%rbp)        # 8-byte Spill
	testl	%edx, %edx
	setg	-41(%rbp)
	movq	%rdx, -352(%rbp)
	movq	-88(%rbp), %rcx         # 8-byte Reload
	movl	%ecx, -96(%rbp)
	movl	$0, -100(%rbp)
	testq	%rdx, %rdx
	jle	.LBB1_3
.Ltmp35:
# BB#56:                                # %polly.stmt.polly.preload.exec
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-76]
	#DEBUG_VALUE: matrix_multiply:B_data <- [%RBP+-56]
	#DEBUG_VALUE: matrix_multiply:A_data <- [%RBP+-64]
	#DEBUG_VALUE: matrix_multiply:A <- %R12
	#DEBUG_VALUE: matrix_multiply:B <- %RSI
	movq	%rax, %rcx
	shrq	$32, %rcx
	movl	%ecx, -96(%rbp)
	movl	%eax, -100(%rbp)
.Ltmp36:
.LBB1_3:                                # %polly.preload.merge
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-76]
	#DEBUG_VALUE: matrix_multiply:B_data <- [%RBP+-56]
	#DEBUG_VALUE: matrix_multiply:A_data <- [%RBP+-64]
	#DEBUG_VALUE: matrix_multiply:A <- %R12
	#DEBUG_VALUE: matrix_multiply:B <- %RSI
	movl	-96(%rbp), %r8d
	movslq	-100(%rbp), %r14
	movq	-352(%rbp), %r11
	movb	-41(%rbp), %r9b
	movq	%r14, %rax
	imulq	%r11, %rax
	movq	-56(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,4), %rax
	cmpq	%r15, %rax
	setbe	%r10b
	movq	-88(%rbp), %rax         # 8-byte Reload
	leaq	-1(%rax), %rbx
	movq	%rbx, %rdi
	imulq	%r11, %rdi
	imulq	%r11, %rax
	leaq	(%r15,%rax,4), %rsi
.Ltmp37:
	cmpq	%rcx, %rsi
	setbe	%al
	addq	%r14, %rdi
	movq	-64(%rbp), %rdx         # 8-byte Reload
	leaq	(%rdx,%rdi,4), %rdi
	cmpq	%r15, %rdi
	setbe	%cl
	cmpq	%rdx, %rsi
	setbe	%dl
	orb	%cl, %dl
	movzbl	%dl, %ecx
	cmpl	$1, %ecx
	jne	.LBB1_6
.Ltmp38:
# BB#4:                                 # %polly.preload.merge
	#DEBUG_VALUE: matrix_multiply:A <- %R12
	#DEBUG_VALUE: matrix_multiply:A_data <- [%RBP+-64]
	#DEBUG_VALUE: matrix_multiply:B_data <- [%RBP+-56]
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-76]
	cmpl	%r14d, %r13d
	jl	.LBB1_6
.Ltmp39:
# BB#5:                                 # %polly.preload.merge
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-76]
	#DEBUG_VALUE: matrix_multiply:B_data <- [%RBP+-56]
	#DEBUG_VALUE: matrix_multiply:A_data <- [%RBP+-64]
	#DEBUG_VALUE: matrix_multiply:A <- %R12
	orb	%r10b, %al
	je	.LBB1_6
.Ltmp40:
# BB#39:                                # %polly.parallel.for37
	#DEBUG_VALUE: matrix_multiply:A <- %R12
	#DEBUG_VALUE: matrix_multiply:A_data <- [%RBP+-64]
	#DEBUG_VALUE: matrix_multiply:B_data <- [%RBP+-56]
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-76]
	sarq	$5, %rbx
	movq	-88(%rbp), %rax         # 8-byte Reload
	movl	%eax, -240(%rbp)
	movl	%r13d, -236(%rbp)
	movl	%r14d, -232(%rbp)
	movl	%r13d, -228(%rbp)
	movq	%r15, -224(%rbp)
	movq	%r12, -216(%rbp)
	incq	%rbx
	leaq	-240(%rbp), %rsi
	movl	$matrix_multiply_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%rbx, %r8
	callq	GOMP_parallel_loop_runtime_start
	leaq	-240(%rbp), %rdi
	callq	matrix_multiply_polly_subfn
	callq	GOMP_parallel_end
	movq	-88(%rbp), %rax         # 8-byte Reload
	movl	%eax, -240(%rbp)
	movl	%r13d, -236(%rbp)
	movl	%r14d, -232(%rbp)
	movl	%r13d, -228(%rbp)
	movq	%r15, -224(%rbp)
	movq	-64(%rbp), %rax         # 8-byte Reload
	movq	%rax, -216(%rbp)
	movq	-56(%rbp), %rax         # 8-byte Reload
	movq	%rax, -208(%rbp)
	movq	%r12, -200(%rbp)
	leaq	-240(%rbp), %r14
	movl	$matrix_multiply_polly_subfn_2, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r14, %rsi
	movq	%rbx, %r8
	callq	GOMP_parallel_loop_runtime_start
	movq	%r14, %rdi
	callq	matrix_multiply_polly_subfn_2
	callq	GOMP_parallel_end
	jmp	.LBB1_14
.Ltmp41:
.LBB1_6:                                # %for.cond7.preheader.preheader
	#DEBUG_VALUE: matrix_multiply:A <- %R12
	#DEBUG_VALUE: matrix_multiply:A_data <- [%RBP+-64]
	#DEBUG_VALUE: matrix_multiply:B_data <- [%RBP+-56]
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-76]
	.loc	1 39 9 discriminator 1  # MatrixMult.c:39:9
	testb	$1, %r9b
	je	.LBB1_7
.Ltmp42:
# BB#37:                                # %for.body11.preheader.us.preheader
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-76]
	#DEBUG_VALUE: matrix_multiply:B_data <- [%RBP+-56]
	#DEBUG_VALUE: matrix_multiply:A_data <- [%RBP+-64]
	#DEBUG_VALUE: matrix_multiply:A <- %R12
	.loc	1 41 26 discriminator 1 # MatrixMult.c:41:26
	movq	8(%r12), %rax
	.loc	1 41 22 is_stmt 0 discriminator 1 # MatrixMult.c:41:22
	movq	%rax, -320(%rbp)        # 8-byte Spill
	movslq	%eax, %rcx
.Ltmp43:
	.loc	1 37 15 is_stmt 1 discriminator 1 # MatrixMult.c:37:15
	movq	%rcx, -120(%rbp)        # 8-byte Spill
	sarq	$32, %rax
	movq	%rax, -264(%rbp)        # 8-byte Spill
.Ltmp44:
	.loc	1 42 71                 # MatrixMult.c:42:71
	movl	%ecx, %eax
	andl	$1, %eax
	movq	%rax, -288(%rbp)        # 8-byte Spill
	movq	%r11, %rdx
.Ltmp45:
	.loc	1 40 21                 # MatrixMult.c:40:21
	movq	%rdx, -112(%rbp)        # 8-byte Spill
	leaq	(,%rdx,4), %r9
	movq	%r9, -256(%rbp)         # 8-byte Spill
	leaq	(%rdx,%rdx), %rax
	movq	%rax, -328(%rbp)        # 8-byte Spill
	movq	-64(%rbp), %rax         # 8-byte Reload
	leaq	12(%rax), %rax
	movq	%rax, -144(%rbp)        # 8-byte Spill
	movq	-56(%rbp), %rax         # 8-byte Reload
	leaq	(%rax,%rdx,8), %rax
	movq	%rax, -248(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -152(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
.Ltmp46:
	.p2align	4, 0x90
.LBB1_38:                               # %for.body11.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_15 Depth 2
                                        #       Child Loop BB1_34 Depth 3
                                        #       Child Loop BB1_48 Depth 3
	movq	%rax, -272(%rbp)        # 8-byte Spill
	imulq	%rax, %rdx
	movq	%rdx, -72(%rbp)         # 8-byte Spill
	imulq	%rax, %r9
	addq	%r15, %r9
	movq	-248(%rbp), %rax        # 8-byte Reload
	movq	%rax, -176(%rbp)        # 8-byte Spill
	movq	-56(%rbp), %rax         # 8-byte Reload
	movq	%rax, -136(%rbp)        # 8-byte Spill
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB1_15:                               # %for.body11.us
                                        #   Parent Loop BB1_38 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_34 Depth 3
                                        #       Child Loop BB1_48 Depth 3
	.loc	1 40 27 is_stmt 0       # MatrixMult.c:40:27
	movq	-72(%rbp), %rax         # 8-byte Reload
	leaq	(%r8,%rax), %r10
	.loc	1 40 31                 # MatrixMult.c:40:31
	movl	$0, (%r15,%r10,4)
.Ltmp47:
	#DEBUG_VALUE: matrix_multiply:k <- 0
	.loc	1 41 13 is_stmt 1 discriminator 1 # MatrixMult.c:41:13
	movq	-320(%rbp), %rax        # 8-byte Reload
	testl	%eax, %eax
	jle	.LBB1_35
# BB#16:                                # %polly.preload.cond
                                        #   in Loop: Header=BB1_15 Depth=2
	xorl	%eax, %eax
	movq	-288(%rbp), %r14        # 8-byte Reload
	testq	%r14, %r14
	js	.LBB1_52
# BB#17:                                # %polly.preload.cond
                                        #   in Loop: Header=BB1_15 Depth=2
	jle	.LBB1_18
.LBB1_52:                               # %polly.preload.exec146
                                        #   in Loop: Header=BB1_15 Depth=2
	movq	-64(%rbp), %rax         # 8-byte Reload
	movq	-72(%rbp), %rcx         # 8-byte Reload
	movl	(%rax,%rcx,4), %eax
.LBB1_18:                               # %polly.preload.cond149
                                        #   in Loop: Header=BB1_15 Depth=2
	movl	%eax, -128(%rbp)        # 4-byte Spill
	movl	%eax, -356(%rbp)
	xorl	%r12d, %r12d
	testq	%r14, %r14
	js	.LBB1_53
# BB#19:                                # %polly.preload.cond149
                                        #   in Loop: Header=BB1_15 Depth=2
	jle	.LBB1_20
.LBB1_53:                               # %polly.preload.exec151
                                        #   in Loop: Header=BB1_15 Depth=2
	movq	-56(%rbp), %rax         # 8-byte Reload
	movl	(%rax,%r8,4), %r12d
.LBB1_20:                               # %polly.preload.merge150
                                        #   in Loop: Header=BB1_15 Depth=2
	testq	%r14, %r14
	sete	%al
	setne	%cl
	movabsq	$2305843009213693951, %rdx # imm = 0x1FFFFFFFFFFFFFFF
	movq	-72(%rbp), %rsi         # 8-byte Reload
	cmpq	%rdx, %rsi
	setle	%dl
	andb	%cl, %dl
	movabsq	$-2305843009213693952, %rcx # imm = 0xE000000000000000
	cmpq	%rcx, %rsi
	setge	%r13b
	andb	%dl, %r13b
	orb	%al, %r13b
	movq	-56(%rbp), %rdx         # 8-byte Reload
	leaq	4(%rdx,%r8,4), %rax
	leaq	(%r15,%r10,4), %rbx
	movq	%rbx, -312(%rbp)        # 8-byte Spill
	cmpq	%rbx, %rax
	setbe	%cl
	leaq	4(%r15,%r10,4), %r11
	movq	%r11, -304(%rbp)        # 8-byte Spill
	leaq	(%rdx,%r8,4), %rax
	movq	%rax, -296(%rbp)        # 8-byte Spill
	cmpq	%rax, %r11
	setbe	%dl
	movq	-64(%rbp), %rdi         # 8-byte Reload
	leaq	4(%rdi,%rsi,4), %rax
	cmpq	%rbx, %rax
	setbe	%bl
	leaq	(%rdi,%rsi,4), %rax
	cmpq	%rax, %r11
	setbe	%al
	movzbl	%r13b, %edi
	cmpl	$1, %edi
	movl	%r12d, -360(%rbp)
	jne	.LBB1_23
# BB#21:                                # %polly.preload.merge150
                                        #   in Loop: Header=BB1_15 Depth=2
	orb	%dl, %cl
	je	.LBB1_23
# BB#22:                                # %polly.preload.merge150
                                        #   in Loop: Header=BB1_15 Depth=2
	orb	%al, %bl
	je	.LBB1_23
# BB#49:                                # %polly.cond167
                                        #   in Loop: Header=BB1_15 Depth=2
	movl	$0, -92(%rbp)
	movq	$0, -192(%rbp)
	testq	%r14, %r14
	js	.LBB1_54
# BB#50:                                # %polly.cond167
                                        #   in Loop: Header=BB1_15 Depth=2
	jle	.LBB1_51
.LBB1_54:                               # %polly.stmt.for.body17.us.prol
                                        #   in Loop: Header=BB1_15 Depth=2
.Ltmp48:
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	-128(%rbp), %r12d       # 4-byte Folded Reload
	movl	%r12d, (%r9,%r8,4)
	movl	%r12d, -92(%rbp)
	movq	$1, -192(%rbp)
.LBB1_51:                               # %polly.exiting144
                                        #   in Loop: Header=BB1_15 Depth=2
	movl	-92(%rbp), %r13d
	movq	-192(%rbp), %rdx
	jmp	.LBB1_25
	.p2align	4, 0x90
.LBB1_23:                               # %for.body17.us.preheader
                                        #   in Loop: Header=BB1_15 Depth=2
	xorl	%r13d, %r13d
	testq	%r14, %r14
	movl	$0, %edx
	je	.LBB1_25
# BB#24:                                # %for.body17.us.prol
                                        #   in Loop: Header=BB1_15 Depth=2
	.loc	1 42 75 is_stmt 0       # MatrixMult.c:42:75
	movq	-56(%rbp), %rax         # 8-byte Reload
	movl	(%rax,%r8,4), %r13d
	.loc	1 42 74                 # MatrixMult.c:42:74
	movq	-64(%rbp), %rax         # 8-byte Reload
	movq	-72(%rbp), %rcx         # 8-byte Reload
	imull	(%rax,%rcx,4), %r13d
	.loc	1 42 35                 # MatrixMult.c:42:35
	movl	%r13d, (%r15,%r10,4)
	movl	$1, %edx
.LBB1_25:                               # %for.body17.us.preheader.split
                                        #   in Loop: Header=BB1_15 Depth=2
	cmpq	$1, -120(%rbp)          # 8-byte Folded Reload
	je	.LBB1_35
# BB#26:                                # %polly.split_new_and_old75
                                        #   in Loop: Header=BB1_15 Depth=2
	leaq	2(%rdx), %r11
	leaq	1(%rdx), %r15
	movq	%r15, -280(%rbp)        # 8-byte Spill
	testq	%r8, %r8
	movq	%r15, %rdi
	movq	-120(%rbp), %rax        # 8-byte Reload
	movq	%rax, %rcx
	cmovnsq	%rcx, %rdi
	cmpq	%r11, %rcx
	cmovlq	%r15, %rdi
	movq	-72(%rbp), %r14         # 8-byte Reload
	leaq	1(%rcx,%r14), %rbx
	leaq	2(%rdx,%r14), %rax
	cmovgeq	%rbx, %rax
	testq	%r8, %r8
	movq	%rdi, %rbx
	cmovsq	%rdx, %rbx
	leaq	-1(%rcx), %rsi
	cmpq	%rcx, %r15
	cmovlq	%rdi, %rbx
	testq	%r8, %r8
	cmovnsq	%rbx, %rsi
	cmpq	%r11, %rcx
	cmovlq	%rbx, %rsi
	movq	-168(%rbp), %rcx        # 8-byte Reload
	leaq	(%rcx,%r8), %rdi
	testq	%r8, %r8
	cmovnsq	%r8, %rdi
	leaq	-1(%rdx), %rbx
	testq	%r8, %r8
	cmovnsq	%rdx, %rbx
	leaq	1(%r8), %r11
	movq	%r11, -128(%rbp)        # 8-byte Spill
	testq	%r8, %r8
	leaq	1(%rcx,%r8), %rcx
	cmovnsq	%r11, %rcx
	movq	-112(%rbp), %r12        # 8-byte Reload
	imulq	%r12, %rsi
	addq	%rcx, %rsi
	movq	-56(%rbp), %r11         # 8-byte Reload
	leaq	(%r11,%rsi,4), %rcx
	movq	-312(%rbp), %r15        # 8-byte Reload
	cmpq	%r15, %rcx
	setbe	%cl
	imulq	%r12, %rbx
	addq	%rdi, %rbx
	leaq	(%r11,%rbx,4), %rsi
	movq	-304(%rbp), %rdi        # 8-byte Reload
	cmpq	%rsi, %rdi
	setbe	%r11b
	movq	-64(%rbp), %rsi         # 8-byte Reload
	leaq	(%rsi,%rax,4), %rax
	cmpq	%r15, %rax
	leaq	(%rdx,%r14), %rax
	setbe	%bl
	leaq	(%rsi,%rax,4), %rsi
	cmpq	%rsi, %rdi
	movabsq	$2305843009213693951, %rsi # imm = 0x1FFFFFFFFFFFFFFF
	leaq	-1(%rsi), %rsi
	setbe	%dil
	cmpq	%rsi, %rax
	jg	.LBB1_33
# BB#27:                                # %polly.split_new_and_old75
                                        #   in Loop: Header=BB1_15 Depth=2
	movabsq	$2305843009213693951, %rsi # imm = 0x1FFFFFFFFFFFFFFF
	cmpq	%rsi, -72(%rbp)         # 8-byte Folded Reload
	jg	.LBB1_33
# BB#28:                                # %polly.split_new_and_old75
                                        #   in Loop: Header=BB1_15 Depth=2
	movabsq	$-2305843009213693952, %rsi # imm = 0xE000000000000000
	cmpq	%rsi, -72(%rbp)         # 8-byte Folded Reload
	jl	.LBB1_33
# BB#29:                                # %polly.split_new_and_old75
                                        #   in Loop: Header=BB1_15 Depth=2
	movabsq	$-2305843009213693952, %rsi # imm = 0xE000000000000000
	cmpq	%rsi, %rax
	jl	.LBB1_33
# BB#30:                                # %polly.split_new_and_old75
                                        #   in Loop: Header=BB1_15 Depth=2
	movq	-128(%rbp), %rsi        # 8-byte Reload
	cmpq	%rsi, -168(%rbp)        # 8-byte Folded Reload
	jl	.LBB1_33
# BB#31:                                # %polly.split_new_and_old75
                                        #   in Loop: Header=BB1_15 Depth=2
	orb	%r11b, %cl
	je	.LBB1_33
# BB#32:                                # %polly.split_new_and_old75
                                        #   in Loop: Header=BB1_15 Depth=2
	orb	%dil, %bl
	je	.LBB1_33
# BB#46:                                # %polly.loop_if107
                                        #   in Loop: Header=BB1_15 Depth=2
	movl	%r13d, -80(%rbp)
	movq	%r12, %r10
	imulq	%rdx, %r10
	leaq	(%r8,%r10), %rcx
	movq	-56(%rbp), %rsi         # 8-byte Reload
	movl	(%rsi,%rcx,4), %ecx
	movq	-64(%rbp), %rdi         # 8-byte Reload
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	(%rdi,%rax,4), %ecx
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%r13d, %ecx
	movl	%ecx, (%r9,%r8,4)
	leaq	4(,%rdx,4), %rsi
	imulq	%r12, %rsi
	movq	-296(%rbp), %rbx        # 8-byte Reload
	movl	(%rsi,%rbx), %esi
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	4(%rdi,%rax,4), %esi
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%ecx, %esi
	movl	%esi, (%r9,%r8,4)
	movl	%esi, -80(%rbp)
	movq	-120(%rbp), %rax        # 8-byte Reload
	leaq	1(%rdx,%rax), %r14
	sarq	%r14
	subq	%rdx, %r14
	cmpq	$1, %r14
	movq	-160(%rbp), %r15        # 8-byte Reload
	jle	.LBB1_35
# BB#47:                                # %polly.loop_preheader109
                                        #   in Loop: Header=BB1_15 Depth=2
	leaq	(,%rdx,4), %r11
	addq	$12, %r11
	imulq	-112(%rbp), %r11        # 8-byte Folded Reload
	addq	-136(%rbp), %r11        # 8-byte Folded Reload
	movq	-144(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%rdx,4), %rcx
	addq	$4, %rdx
	movq	-176(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%r10,4), %r10
	xorl	%ebx, %ebx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB1_48:                               # %polly.stmt.for.body17.us116
                                        #   Parent Loop BB1_38 Depth=1
                                        #     Parent Loop BB1_15 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	(%r10,%rbx,8), %edi
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	-4(%rcx,%rsi,8), %edi
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	-80(%rbp), %edi
	movl	%edi, (%r9,%r8,4)
	movl	(%r11,%rbx,8), %eax
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	(%rcx,%rsi,8), %eax
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%edi, %eax
	movl	%eax, (%r9,%r8,4)
	movl	%eax, -80(%rbp)
	leaq	-1(%r14), %rax
	incq	%rsi
	addq	$2, %rdx
	addq	-112(%rbp), %rbx        # 8-byte Folded Reload
	cmpq	%rax, %rsi
	jl	.LBB1_48
	jmp	.LBB1_35
.LBB1_33:                               # %for.body17.us.preheader1
                                        #   in Loop: Header=BB1_15 Depth=2
	movq	-280(%rbp), %rax        # 8-byte Reload
	.loc	1 42 71                 # MatrixMult.c:42:71
	imulq	%r12, %rax
	movq	-136(%rbp), %rdi        # 8-byte Reload
	leaq	(%rdi,%rax,4), %rax
	movq	-152(%rbp), %rcx        # 8-byte Reload
	leaq	(%rcx,%rdx), %rcx
	movq	-64(%rbp), %rsi         # 8-byte Reload
	leaq	(%rsi,%rcx,4), %rcx
	movq	%r12, %rsi
	imulq	%rdx, %rsi
	leaq	(%rdi,%rsi,4), %rdi
	.loc	1 42 37                 # MatrixMult.c:42:37
	xorl	%esi, %esi
	movq	-160(%rbp), %r15        # 8-byte Reload
	.p2align	4, 0x90
.LBB1_34:                               # %for.body17.us
                                        #   Parent Loop BB1_38 Depth=1
                                        #     Parent Loop BB1_15 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	.loc	1 42 75                 # MatrixMult.c:42:75
	movl	(%rdi,%rsi,4), %ebx
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	(%rcx), %ebx
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%r13d, %ebx
	.loc	1 42 35                 # MatrixMult.c:42:35
	movl	%ebx, (%r15,%r10,4)
	.loc	1 42 75                 # MatrixMult.c:42:75
	movl	(%rax,%rsi,4), %r13d
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	4(%rcx), %r13d
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%ebx, %r13d
	.loc	1 42 35                 # MatrixMult.c:42:35
	movl	%r13d, (%r15,%r10,4)
.Ltmp49:
	.loc	1 41 13 is_stmt 1 discriminator 1 # MatrixMult.c:41:13
	addq	$2, %rdx
	.loc	1 41 22 is_stmt 0 discriminator 1 # MatrixMult.c:41:22
	addq	-328(%rbp), %rsi        # 8-byte Folded Reload
	addq	$8, %rcx
	cmpq	-120(%rbp), %rdx        # 8-byte Folded Reload
	.loc	1 41 13 discriminator 1 # MatrixMult.c:41:13
	jl	.LBB1_34
.Ltmp50:
	.p2align	4, 0x90
.LBB1_35:                               # %for.inc36.us
                                        #   in Loop: Header=BB1_15 Depth=2
	.loc	1 39 9 is_stmt 1 discriminator 1 # MatrixMult.c:39:9
	incq	%r8
	addq	$4, -136(%rbp)          # 8-byte Folded Spill
	addq	$4, -176(%rbp)          # 8-byte Folded Spill
	movq	-112(%rbp), %rdx        # 8-byte Reload
	.loc	1 39 18 is_stmt 0 discriminator 1 # MatrixMult.c:39:18
	cmpq	%rdx, %r8
	jl	.LBB1_15
.Ltmp51:
# BB#36:                                # %for.inc39.loopexit.us
                                        #   in Loop: Header=BB1_38 Depth=1
	movq	-272(%rbp), %rax        # 8-byte Reload
	.loc	1 37 5 is_stmt 1 discriminator 1 # MatrixMult.c:37:5
	incq	%rax
	addq	%rdx, -152(%rbp)        # 8-byte Folded Spill
	movq	-256(%rbp), %r9         # 8-byte Reload
	addq	%r9, -144(%rbp)         # 8-byte Folded Spill
	.loc	1 37 15 is_stmt 0 discriminator 1 # MatrixMult.c:37:15
	cmpq	-264(%rbp), %rax        # 8-byte Folded Reload
	jl	.LBB1_38
	jmp	.LBB1_14
.LBB1_7:                                # %for.inc39.preheader
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-76]
	#DEBUG_VALUE: matrix_multiply:B_data <- [%RBP+-56]
	#DEBUG_VALUE: matrix_multiply:A_data <- [%RBP+-64]
.Ltmp52:
	#DEBUG_VALUE: matrix_multiply:A <- %R12
	movslq	%r8d, %rax
	.loc	1 37 5 discriminator 1  # MatrixMult.c:37:5
	testq	%rax, %rax
	movl	$1, %ecx
	cmovgq	%rax, %rcx
	xorl	%esi, %esi
	cmpq	$16, %rcx
	jb	.LBB1_9
.Ltmp53:
# BB#8:                                 # %min.iters.checked
	#DEBUG_VALUE: matrix_multiply:A <- %R12
	#DEBUG_VALUE: matrix_multiply:A_data <- [%RBP+-64]
	#DEBUG_VALUE: matrix_multiply:B_data <- [%RBP+-56]
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-76]
	xorl	%esi, %esi
	movq	%rcx, %r8
	andq	$-16, %r8
	je	.LBB1_9
.Ltmp54:
# BB#42:                                # %polly.loop_if
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-76]
	#DEBUG_VALUE: matrix_multiply:B_data <- [%RBP+-56]
	#DEBUG_VALUE: matrix_multiply:A_data <- [%RBP+-64]
	#DEBUG_VALUE: matrix_multiply:A <- %R12
	leaq	-16(%r8), %rsi
	movq	%rsi, -336(%rbp)
	shrl	$4, %esi
	incl	%esi
	andl	$7, %esi
	movq	$0, -184(%rbp)
	testq	%rsi, %rsi
	jle	.LBB1_40
.Ltmp55:
# BB#43:                                # %polly.loop_preheader
	#DEBUG_VALUE: matrix_multiply:A <- %R12
	#DEBUG_VALUE: matrix_multiply:A_data <- [%RBP+-64]
	#DEBUG_VALUE: matrix_multiply:B_data <- [%RBP+-56]
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-76]
	xorl	%edi, %edi
	movl	$16, %ebx
	leaq	-1(%rsi), %rdx
.Ltmp56:
	.p2align	4, 0x90
.LBB1_44:                               # %polly.stmt.vector.body.prol
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbx, -344(%rbp)
	addq	$16, %rbx
	cmpq	%rdx, %rdi
	leaq	1(%rdi), %rdi
	jl	.LBB1_44
.LBB1_40:                               # %polly.cond
	testq	%rsi, %rsi
	jle	.LBB1_41
# BB#45:                                # %polly.stmt.vector.body.preheader.split.loopexit
	movq	-344(%rbp), %rdx
	movq	%rdx, -184(%rbp)
.LBB1_41:                               # %polly.exiting
	movq	-184(%rbp), %rsi
	movq	-336(%rbp), %rdx
# BB#10:                                # %vector.body.preheader.split
	cmpq	$112, %rdx
	jb	.LBB1_13
# BB#11:                                # %vector.body.preheader.split.split
	movq	%r8, %rdx
	subq	%rsi, %rdx
	.p2align	4, 0x90
.LBB1_12:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	addq	$-128, %rdx
	jne	.LBB1_12
.LBB1_13:                               # %middle.block
	cmpq	%r8, %rcx
	movq	%r8, %rsi
	je	.LBB1_14
	.p2align	4, 0x90
.LBB1_9:                                # %for.inc39
                                        # =>This Inner Loop Header: Depth=1
	incq	%rsi
	.loc	1 37 15 discriminator 1 # MatrixMult.c:37:15
	cmpq	%rax, %rsi
	jl	.LBB1_9
.Ltmp57:
.LBB1_14:                               # %for.end41
	.loc	1 47 39 is_stmt 1       # MatrixMult.c:47:39
	movl	$16, %edi
	callq	malloc
.Ltmp58:
	#DEBUG_VALUE: matrix_multiply:C <- %RAX
	.loc	1 48 13                 # MatrixMult.c:48:13
	movq	%r15, (%rax)
	.loc	1 49 14                 # MatrixMult.c:49:14
	movl	-76(%rbp), %ecx         # 4-byte Reload
	movl	%ecx, 8(%rax)
	.loc	1 50 15                 # MatrixMult.c:50:15
	movq	-88(%rbp), %rcx         # 8-byte Reload
	movl	%ecx, 12(%rax)
	.loc	1 52 5                  # MatrixMult.c:52:5
	addq	$328, %rsp              # imm = 0x148
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp59:
.Lfunc_end1:
	.size	matrix_multiply, .Lfunc_end1-matrix_multiply
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin2:
	.loc	1 86 0                  # MatrixMult.c:86:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp60:
	.cfi_def_cfa_offset 16
.Ltmp61:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp62:
	.cfi_def_cfa_register %rbp
.Ltmp63:
	.loc	1 99 19 prologue_end    # MatrixMult.c:99:19
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
.Ltmp64:
	.cfi_offset %rbx, -56
.Ltmp65:
	.cfi_offset %r12, -48
.Ltmp66:
	.cfi_offset %r13, -40
.Ltmp67:
	.cfi_offset %r14, -32
.Ltmp68:
	.cfi_offset %r15, -24
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
	callq	convertArgsToIntArray
	.loc	1 100 32                # MatrixMult.c:100:32
	movq	(%rax), %rdi
.Ltmp69:
	.loc	1 100 15 is_stmt 0      # MatrixMult.c:100:15
	callq	parseStringToInt
	movq	%rax, %rbx
.Ltmp70:
	#DEBUG_VALUE: init:height <- %EBX
	#DEBUG_VALUE: init:width <- %EBX
	#DEBUG_VALUE: init:value <- 1
	#DEBUG_VALUE: main:height <- %EBX
	#DEBUG_VALUE: main:width <- %EBX
	#DEBUG_VALUE: main:max <- %EBX
	#DEBUG_VALUE: init:width <- %EBX
	#DEBUG_VALUE: init:height <- %EBX
	.loc	1 15 55 is_stmt 1       # MatrixMult.c:15:55
	imull	%eax, %eax
	shlq	$2, %rax
	movabsq	$17179869180, %r15      # imm = 0x3FFFFFFFC
	andq	%rax, %r15
	.loc	1 15 36 is_stmt 0       # MatrixMult.c:15:36
	movq	%r15, %rdi
	callq	malloc
	movq	%rax, %r12
.Ltmp71:
	#DEBUG_VALUE: init:i <- 0
	.loc	1 16 5 is_stmt 1 discriminator 1 # MatrixMult.c:16:5
	testl	%ebx, %ebx
	jle	.LBB2_2
.Ltmp72:
# BB#1:                                 # %polly.parallel.for.i
	#DEBUG_VALUE: init:height <- %EBX
	#DEBUG_VALUE: init:width <- %EBX
	#DEBUG_VALUE: main:max <- %EBX
	#DEBUG_VALUE: main:width <- %EBX
	#DEBUG_VALUE: main:height <- %EBX
	#DEBUG_VALUE: init:width <- %EBX
	#DEBUG_VALUE: init:height <- %EBX
	#DEBUG_VALUE: main:args <- %RSI
	.loc	1 105 7                 # MatrixMult.c:105:7
	movslq	%ebx, %r8
	decq	%r8
	sarq	$5, %r8
	movl	%ebx, -64(%rbp)
	movl	%ebx, -60(%rbp)
	movq	%r12, -56(%rbp)
	movl	$1, -48(%rbp)
	incq	%r8
	leaq	-64(%rbp), %r14
	movl	$init_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r14, %rsi
.Ltmp73:
	callq	GOMP_parallel_loop_runtime_start
	movq	%r14, %rdi
	callq	init_polly_subfn
	callq	GOMP_parallel_end
.Ltmp74:
.LBB2_2:                                # %init.exit
	#DEBUG_VALUE: init:height <- %EBX
	#DEBUG_VALUE: init:width <- %EBX
	#DEBUG_VALUE: main:max <- %EBX
	#DEBUG_VALUE: main:width <- %EBX
	#DEBUG_VALUE: main:height <- %EBX
	#DEBUG_VALUE: init:width <- %EBX
	#DEBUG_VALUE: init:height <- %EBX
	.loc	1 21 44                 # MatrixMult.c:21:44
	movl	$16, %edi
	callq	malloc
	movq	%rax, %r14
	.loc	1 22 18                 # MatrixMult.c:22:18
	movq	%r12, (%r14)
	.loc	1 23 19                 # MatrixMult.c:23:19
	movl	%ebx, 8(%r14)
	.loc	1 24 20                 # MatrixMult.c:24:20
	movl	%ebx, 12(%r14)
.Ltmp75:
	#DEBUG_VALUE: init:value <- 1
	.loc	1 15 36                 # MatrixMult.c:15:36
	movq	%r15, %rdi
	callq	malloc
	movq	%rax, %r15
.Ltmp76:
	#DEBUG_VALUE: init:i <- 0
	.loc	1 106 7                 # MatrixMult.c:106:7
	movq	%rbx, %r13
	shlq	$32, %r13
.Ltmp77:
	.loc	1 16 5 discriminator 1  # MatrixMult.c:16:5
	testl	%ebx, %ebx
	jle	.LBB2_4
.Ltmp78:
# BB#3:                                 # %polly.parallel.for.i15
	#DEBUG_VALUE: init:height <- %EBX
	#DEBUG_VALUE: init:width <- %EBX
	#DEBUG_VALUE: main:height <- %EBX
	#DEBUG_VALUE: main:width <- %EBX
	#DEBUG_VALUE: main:max <- %EBX
	#DEBUG_VALUE: init:width <- %EBX
	#DEBUG_VALUE: init:height <- %EBX
	.loc	1 106 7                 # MatrixMult.c:106:7
	movq	%r13, %r8
	sarq	$32, %r8
	decq	%r8
	sarq	$5, %r8
	movl	%ebx, -64(%rbp)
	movl	%ebx, -60(%rbp)
	movq	%r15, -56(%rbp)
	movl	$1, -48(%rbp)
	incq	%r8
	leaq	-64(%rbp), %r12
	movl	$init_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r12, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%r12, %rdi
	callq	init_polly_subfn
	callq	GOMP_parallel_end
.Ltmp79:
.LBB2_4:                                # %init.exit16
	#DEBUG_VALUE: init:height <- %EBX
	#DEBUG_VALUE: init:width <- %EBX
	#DEBUG_VALUE: main:height <- %EBX
	#DEBUG_VALUE: main:width <- %EBX
	#DEBUG_VALUE: main:max <- %EBX
	#DEBUG_VALUE: init:width <- %EBX
	#DEBUG_VALUE: init:height <- %EBX
	.loc	1 21 44                 # MatrixMult.c:21:44
	movl	$16, %edi
	callq	malloc
.Ltmp80:
	#DEBUG_VALUE: init:matrix <- %RAX
	#DEBUG_VALUE: main:B <- %RAX
	.loc	1 22 18                 # MatrixMult.c:22:18
	movq	%r15, (%rax)
	.loc	1 23 19                 # MatrixMult.c:23:19
	movl	%ebx, 8(%rax)
	.loc	1 24 20                 # MatrixMult.c:24:20
	movl	%ebx, 12(%rax)
.Ltmp81:
	.loc	1 108 7                 # MatrixMult.c:108:7
	movq	%r14, %rdi
	movq	%rax, %rsi
	callq	matrix_multiply
.Ltmp82:
	#DEBUG_VALUE: main:C <- %RAX
	.loc	1 109 75                # MatrixMult.c:109:75
	leal	-1(%rbx), %ecx
	.loc	1 109 86 is_stmt 0      # MatrixMult.c:109:86
	imulq	%rbx, %r13
	movabsq	$-4294967296, %rdx      # imm = 0xFFFFFFFF00000000
	addq	%r13, %rdx
	.loc	1 109 90                # MatrixMult.c:109:90
	movq	(%rax), %rax
.Ltmp83:
	.loc	1 109 86                # MatrixMult.c:109:86
	sarq	$30, %rdx
	movl	(%rax,%rdx), %r9d
	.loc	1 109 5                 # MatrixMult.c:109:5
	movl	$.L.str, %edi
	xorl	%eax, %eax
	movl	%ebx, %esi
	movl	%ebx, %edx
	movl	%ecx, %r8d
	callq	printf
	.loc	1 111 5 is_stmt 1       # MatrixMult.c:111:5
	xorl	%eax, %eax
	addq	$24, %rsp
	popq	%rbx
.Ltmp84:
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp85:
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
.Ltmp86:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp87:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp88:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp89:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp90:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp91:
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
.Ltmp92:
	.cfi_def_cfa_offset 96
.Ltmp93:
	.cfi_offset %rbx, -56
.Ltmp94:
	.cfi_offset %r12, -48
.Ltmp95:
	.cfi_offset %r13, -40
.Ltmp96:
	.cfi_offset %r14, -32
.Ltmp97:
	.cfi_offset %r15, -24
.Ltmp98:
	.cfi_offset %rbp, -16
	movslq	(%rdi), %r12
	movslq	4(%rdi), %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	8(%rdi), %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movl	16(%rdi), %ebp
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB3_2
# BB#1:                                 # %polly.par.loadIVBounds.preheader
	leaq	-1(%r12), %r14
	sarq	$5, %r14
	movq	%r12, %rax
	shlq	$7, %rax
	movq	%rax, (%rsp)            # 8-byte Spill
	leaq	(,%r12,4), %r13
	.p2align	4, 0x90
.LBB3_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_5 Depth 2
                                        #       Child Loop BB3_8 Depth 3
                                        #         Child Loop BB3_10 Depth 4
                                        #           Child Loop BB3_11 Depth 5
	movq	8(%rsp), %r8
	movq	16(%rsp), %r10
	addq	$-2, %r8
	movq	(%rsp), %r9             # 8-byte Reload
	imulq	%r10, %r9
	addq	24(%rsp), %r9           # 8-byte Folded Reload
	.p2align	4, 0x90
.LBB3_5:                                # %polly.loop_header
                                        #   Parent Loop BB3_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_8 Depth 3
                                        #         Child Loop BB3_10 Depth 4
                                        #           Child Loop BB3_11 Depth 5
	testq	%r14, %r14
	js	.LBB3_14
# BB#6:                                 # %polly.loop_header2.preheader
                                        #   in Loop: Header=BB3_5 Depth=2
	movq	%r10, %rax
	shlq	$5, %rax
	movq	32(%rsp), %rsi          # 8-byte Reload
	subq	%rax, %rsi
	decq	%rsi
	cmpq	$31, %rsi
	movl	$31, %eax
	cmovgq	%rax, %rsi
	testq	%rsi, %rsi
	js	.LBB3_14
# BB#7:                                 #   in Loop: Header=BB3_5 Depth=2
	decq	%rsi
	movq	%r9, %r11
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB3_8:                                # %polly.loop_header10.preheader.us
                                        #   Parent Loop BB3_4 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB3_10 Depth 4
                                        #           Child Loop BB3_11 Depth 5
	movq	%rax, %rcx
	shlq	$5, %rcx
	movq	%r12, %rdi
	subq	%rcx, %rdi
	decq	%rdi
	cmpq	$31, %rdi
	movl	$31, %edx
	cmovleq	%rdi, %rdx
	testq	%rdx, %rdx
	js	.LBB3_13
# BB#9:                                 #   in Loop: Header=BB3_8 Depth=3
	decq	%rdx
	movq	%r11, %r15
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB3_10:                               # %polly.stmt.for.body6.preheader.us.us
                                        #   Parent Loop BB3_4 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        #       Parent Loop BB3_8 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB3_11 Depth 5
	movq	$-1, %rdi
	movq	%r15, %rcx
	.p2align	4, 0x90
.LBB3_11:                               # %polly.stmt.for.body6.us.us
                                        #   Parent Loop BB3_4 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        #       Parent Loop BB3_8 Depth=3
                                        #         Parent Loop BB3_10 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movl	%ebp, (%rcx)
	incq	%rdi
	addq	$4, %rcx
	cmpq	%rdx, %rdi
	jle	.LBB3_11
# BB#12:                                # %polly.loop_exit21.loopexit.us.us
                                        #   in Loop: Header=BB3_10 Depth=4
	addq	%r13, %r15
	cmpq	%rsi, %rbx
	leaq	1(%rbx), %rbx
	jle	.LBB3_10
.LBB3_13:                               # %polly.loop_exit12.loopexit.us
                                        #   in Loop: Header=BB3_8 Depth=3
	subq	$-128, %r11
	cmpq	%r14, %rax
	leaq	1(%rax), %rax
	jne	.LBB3_8
.LBB3_14:                               # %polly.loop_exit4
                                        #   in Loop: Header=BB3_5 Depth=2
	addq	(%rsp), %r9             # 8-byte Folded Reload
	cmpq	%r8, %r10
	leaq	1(%r10), %r10
	jle	.LBB3_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB3_4 Depth=1
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB3_4
.LBB3_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$40, %rsp
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
	.type	matrix_multiply_polly_subfn,@function
matrix_multiply_polly_subfn:            # @matrix_multiply_polly_subfn
.Lfunc_begin4:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Ltmp99:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp100:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp101:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp102:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp103:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp104:
	.cfi_def_cfa_offset 56
	subq	$88, %rsp
.Ltmp105:
	.cfi_def_cfa_offset 144
.Ltmp106:
	.cfi_offset %rbx, -56
.Ltmp107:
	.cfi_offset %r12, -48
.Ltmp108:
	.cfi_offset %r13, -40
.Ltmp109:
	.cfi_offset %r14, -32
.Ltmp110:
	.cfi_offset %r15, -24
.Ltmp111:
	.cfi_offset %rbp, -16
	movslq	(%rdi), %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movslq	4(%rdi), %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movslq	12(%rdi), %rbx
	movq	16(%rdi), %rax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	leaq	56(%rsp), %rdi
	leaq	48(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB4_2
# BB#1:                                 # %polly.par.loadIVBounds.preheader
	movq	24(%rsp), %rax          # 8-byte Reload
	decq	%rax
	sarq	$5, %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	leaq	(,%rbx,4), %r13
	shlq	$7, %rbx
	movq	%rbx, 16(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB4_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_5 Depth 2
                                        #       Child Loop BB4_8 Depth 3
                                        #         Child Loop BB4_10 Depth 4
	movq	48(%rsp), %rax
	movq	56(%rsp), %rcx
	movq	%rcx, 8(%rsp)           # 8-byte Spill
	addq	$-2, %rax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	16(%rsp), %rax          # 8-byte Reload
	imulq	%rcx, %rax
	addq	64(%rsp), %rax          # 8-byte Folded Reload
	movq	%rax, (%rsp)            # 8-byte Spill
	.p2align	4, 0x90
.LBB4_5:                                # %polly.loop_header
                                        #   Parent Loop BB4_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_8 Depth 3
                                        #         Child Loop BB4_10 Depth 4
	cmpq	$0, 32(%rsp)            # 8-byte Folded Reload
	js	.LBB4_12
# BB#6:                                 # %polly.loop_header2.preheader
                                        #   in Loop: Header=BB4_5 Depth=2
	movq	8(%rsp), %rax           # 8-byte Reload
	shlq	$5, %rax
	movq	72(%rsp), %r14          # 8-byte Reload
	subq	%rax, %r14
	decq	%r14
	cmpq	$31, %r14
	movl	$31, %eax
	cmovgq	%rax, %r14
	testq	%r14, %r14
	js	.LBB4_12
# BB#7:                                 #   in Loop: Header=BB4_5 Depth=2
	decq	%r14
	movq	(%rsp), %rax            # 8-byte Reload
	movq	%rax, 40(%rsp)          # 8-byte Spill
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB4_8:                                # %polly.loop_header10.preheader.us
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB4_10 Depth 4
	movq	%rbp, %rcx
	shlq	$5, %rcx
	movq	%rcx, %rdx
	movq	24(%rsp), %rsi          # 8-byte Reload
	subq	%rsi, %rdx
	cmpq	$-33, %rdx
	movq	$-32, %rax
	cmovleq	%rax, %rdx
	movq	$-2, %rax
	subq	%rdx, %rax
	cmpq	$-2, %rax
	movq	$-1, %r15
	cmovleq	%r15, %rax
	cmpq	%rsi, %rcx
	jge	.LBB4_11
# BB#9:                                 #   in Loop: Header=BB4_8 Depth=3
	leaq	8(,%rax,4), %r12
	movq	40(%rsp), %rbx          # 8-byte Reload
	.p2align	4, 0x90
.LBB4_10:                               # %polly.stmt.for.body11.preheader.us.us
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_8 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movq	%r12, %rdx
	callq	memset
	incq	%r15
	addq	%r13, %rbx
	cmpq	%r14, %r15
	jle	.LBB4_10
.LBB4_11:                               # %polly.loop_exit12.loopexit.us
                                        #   in Loop: Header=BB4_8 Depth=3
	subq	$-128, 40(%rsp)         # 8-byte Folded Spill
	cmpq	32(%rsp), %rbp          # 8-byte Folded Reload
	leaq	1(%rbp), %rbp
	jne	.LBB4_8
.LBB4_12:                               # %polly.loop_exit4
                                        #   in Loop: Header=BB4_5 Depth=2
	movq	(%rsp), %rax            # 8-byte Reload
	addq	16(%rsp), %rax          # 8-byte Folded Reload
	movq	%rax, (%rsp)            # 8-byte Spill
	movq	8(%rsp), %rax           # 8-byte Reload
	cmpq	80(%rsp), %rax          # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	jle	.LBB4_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB4_4 Depth=1
	leaq	56(%rsp), %rdi
	leaq	48(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB4_4
.LBB4_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end4:
	.size	matrix_multiply_polly_subfn, .Lfunc_end4-matrix_multiply_polly_subfn
	.cfi_endproc

	.p2align	4, 0x90
	.type	matrix_multiply_polly_subfn_2,@function
matrix_multiply_polly_subfn_2:          # @matrix_multiply_polly_subfn_2
.Lfunc_begin5:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Ltmp112:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp113:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp114:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp115:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp116:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp117:
	.cfi_def_cfa_offset 56
	subq	$280, %rsp              # imm = 0x118
.Ltmp118:
	.cfi_def_cfa_offset 336
.Ltmp119:
	.cfi_offset %rbx, -56
.Ltmp120:
	.cfi_offset %r12, -48
.Ltmp121:
	.cfi_offset %r13, -40
.Ltmp122:
	.cfi_offset %r14, -32
.Ltmp123:
	.cfi_offset %r15, -24
.Ltmp124:
	.cfi_offset %rbp, -16
	movslq	(%rdi), %rax
	movq	%rax, 152(%rsp)         # 8-byte Spill
	movslq	4(%rdi), %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movslq	8(%rdi), %rbx
	movslq	12(%rdi), %rbp
	movq	16(%rdi), %r14
	movq	%r14, 232(%rsp)         # 8-byte Spill
	movq	24(%rdi), %r15
	movq	32(%rdi), %r12
	leaq	144(%rsp), %rdi
	leaq	136(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB5_2
# BB#1:                                 # %polly.par.loadIVBounds.preheader
	movq	56(%rsp), %rax          # 8-byte Reload
	decq	%rax
	sarq	$5, %rax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	%rbx, 88(%rsp)          # 8-byte Spill
	leaq	-1(%rbx), %rax
	sarq	$5, %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	negq	%rbx
	movq	%rbx, 168(%rsp)         # 8-byte Spill
	leaq	(,%rbp,4), %r13
	movq	%rbp, %rax
	movq	%rbp, %rbx
	shlq	$5, %rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movl	$1, %eax
	movd	%rax, %xmm0
	pslldq	$8, %xmm0               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7]
	movdqa	%xmm0, 256(%rsp)        # 16-byte Spill
	.p2align	4, 0x90
.LBB5_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_5 Depth 2
                                        #       Child Loop BB5_7 Depth 3
                                        #         Child Loop BB5_9 Depth 4
                                        #           Child Loop BB5_12 Depth 5
                                        #             Child Loop BB5_14 Depth 6
                                        #               Child Loop BB5_22 Depth 7
                                        #               Child Loop BB5_17 Depth 7
	movq	136(%rsp), %rax
	movq	144(%rsp), %rcx
	movq	%rcx, 16(%rsp)          # 8-byte Spill
	addq	$-2, %rax
	movq	%rax, 160(%rsp)         # 8-byte Spill
	movq	48(%rsp), %rax          # 8-byte Reload
	imulq	%rcx, %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB5_5:                                # %polly.loop_header
                                        #   Parent Loop BB5_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_7 Depth 3
                                        #         Child Loop BB5_9 Depth 4
                                        #           Child Loop BB5_12 Depth 5
                                        #             Child Loop BB5_14 Depth 6
                                        #               Child Loop BB5_22 Depth 7
                                        #               Child Loop BB5_17 Depth 7
	cmpq	$0, 64(%rsp)            # 8-byte Folded Reload
	movdqa	256(%rsp), %xmm5        # 16-byte Reload
	js	.LBB5_19
# BB#6:                                 # %polly.loop_header4.preheader
                                        #   in Loop: Header=BB5_5 Depth=2
	movq	16(%rsp), %rax          # 8-byte Reload
	shlq	$5, %rax
	movq	%rax, 208(%rsp)         # 8-byte Spill
	movq	152(%rsp), %rcx         # 8-byte Reload
	subq	%rax, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovgq	%rax, %rcx
	movq	%rcx, 184(%rsp)         # 8-byte Spill
	leaq	-1(%rcx), %rax
	movq	%rax, 216(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB5_7:                                # %polly.loop_header4
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_9 Depth 4
                                        #           Child Loop BB5_12 Depth 5
                                        #             Child Loop BB5_14 Depth 6
                                        #               Child Loop BB5_22 Depth 7
                                        #               Child Loop BB5_17 Depth 7
	cmpq	$0, 72(%rsp)            # 8-byte Folded Reload
	js	.LBB5_18
# BB#8:                                 # %polly.loop_header13.preheader
                                        #   in Loop: Header=BB5_7 Depth=3
	movq	32(%rsp), %rcx          # 8-byte Reload
	shlq	$5, %rcx
	movq	%rcx, 248(%rsp)         # 8-byte Spill
	movq	56(%rsp), %rax          # 8-byte Reload
	subq	%rcx, %rax
	decq	%rax
	cmpq	$31, %rax
	movl	$31, %ecx
	cmovleq	%rax, %rcx
	movq	%rcx, 176(%rsp)         # 8-byte Spill
	leaq	-1(%rcx), %rax
	movq	%rax, 240(%rsp)         # 8-byte Spill
	movq	24(%rsp), %rax          # 8-byte Reload
	movq	%rax, 80(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movq	168(%rsp), %rcx         # 8-byte Reload
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB5_9:                                # %polly.loop_header13
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB5_12 Depth 5
                                        #             Child Loop BB5_14 Depth 6
                                        #               Child Loop BB5_22 Depth 7
                                        #               Child Loop BB5_17 Depth 7
	movq	%rdx, 192(%rsp)         # 8-byte Spill
	movq	%rcx, 200(%rsp)         # 8-byte Spill
	cmpq	$-33, %rcx
	movq	$-32, %rax
	cmovgq	%rcx, %rax
	movq	$-2, %r9
	subq	%rax, %r9
	cmpq	$-2, %r9
	movq	$-1, %rsi
	cmovleq	%rsi, %r9
	movq	%rdx, %rax
	shlq	$5, %rax
	movq	%rax, %rcx
	subq	88(%rsp), %rcx          # 8-byte Folded Reload
	cmpq	$-33, %rcx
	movq	$-32, %rdx
	cmovleq	%rdx, %rcx
	movq	$-2, %rdx
	subq	%rcx, %rdx
	cmpq	$-2, %rdx
	cmovleq	%rsi, %rdx
	cmpq	$0, 184(%rsp)           # 8-byte Folded Reload
	js	.LBB5_26
# BB#10:                                # %polly.loop_header22.preheader
                                        #   in Loop: Header=BB5_9 Depth=4
	movq	88(%rsp), %rcx          # 8-byte Reload
	subq	%rax, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %esi
	cmovleq	%rcx, %rsi
	movq	%rsi, 104(%rsp)         # 8-byte Spill
	cmpq	$0, 176(%rsp)           # 8-byte Folded Reload
	js	.LBB5_26
# BB#11:                                # %polly.loop_header31.preheader.us.preheader
                                        #   in Loop: Header=BB5_9 Depth=4
	addq	$2, %r9
	andq	$-4, %r9
	movq	%rdx, %rsi
	addq	$2, %rsi
	movq	%rsi, 128(%rsp)         # 8-byte Spill
	movq	104(%rsp), %rcx         # 8-byte Reload
	decq	%rcx
	cmpl	$1, %ebx
	sete	%dil
	andq	$-4, %rsi
	movq	%rsi, 224(%rsp)         # 8-byte Spill
	setne	%dl
	andb	%dil, %dl
	movb	%dl, 15(%rsp)           # 1-byte Spill
	movd	%rax, %xmm0
	pshufd	$68, %xmm0, %xmm0       # xmm0 = xmm0[0,1,0,1]
	movq	80(%rsp), %rax          # 8-byte Reload
	movq	%rax, 120(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB5_12:                               # %polly.loop_header31.preheader.us
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        #         Parent Loop BB5_9 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB5_14 Depth 6
                                        #               Child Loop BB5_22 Depth 7
                                        #               Child Loop BB5_17 Depth 7
	cmpq	$0, 104(%rsp)           # 8-byte Folded Reload
	js	.LBB5_25
# BB#13:                                #   in Loop: Header=BB5_12 Depth=5
	movq	208(%rsp), %rax         # 8-byte Reload
	movq	40(%rsp), %rdx          # 8-byte Reload
	leaq	(%rdx,%rax), %rsi
	imulq	%rbx, %rsi
	movq	96(%rsp), %rbp          # 8-byte Reload
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB5_14:                               # %polly.loop_header40.preheader.us.us
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        #         Parent Loop BB5_9 Depth=4
                                        #           Parent Loop BB5_12 Depth=5
                                        # =>          This Loop Header: Depth=6
                                        #               Child Loop BB5_22 Depth 7
                                        #               Child Loop BB5_17 Depth 7
	movq	248(%rsp), %rax         # 8-byte Reload
	leaq	(%r8,%rax), %rdx
	leaq	(%rdx,%rsi), %r10
	movl	(%r14,%r10,4), %r11d
	cmpq	$3, 128(%rsp)           # 8-byte Folded Reload
	jbe	.LBB5_15
# BB#20:                                # %min.iters.checked
                                        #   in Loop: Header=BB5_14 Depth=6
	cmpb	$0, 15(%rsp)            # 1-byte Folded Reload
	je	.LBB5_15
# BB#21:                                # %vector.ph
                                        #   in Loop: Header=BB5_14 Depth=6
	movq	%rbx, %r14
	movd	%r11d, %xmm1
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB5_22:                               # %vector.body
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        #         Parent Loop BB5_9 Depth=4
                                        #           Parent Loop BB5_12 Depth=5
                                        #             Parent Loop BB5_14 Depth=6
                                        # =>            This Inner Loop Header: Depth=7
	movd	%rax, %xmm2
	pshufd	$68, %xmm2, %xmm2       # xmm2 = xmm2[0,1,0,1]
	paddq	%xmm0, %xmm2
	paddq	%xmm5, %xmm2
	movd	%xmm2, %rdi
	leaq	(%rdi,%rsi), %rbx
	movdqu	(%r15,%rbx,4), %xmm2
	addq	%rdx, %rdi
	movdqu	(%r12,%rdi,4), %xmm3
	.loc	1 42 74                 # MatrixMult.c:42:74
	pshufd	$245, %xmm3, %xmm4      # xmm4 = xmm3[1,1,3,3]
	pmuludq	%xmm2, %xmm3
	pshufd	$232, %xmm3, %xmm3      # xmm3 = xmm3[0,2,2,3]
	pshufd	$245, %xmm2, %xmm2      # xmm2 = xmm2[1,1,3,3]
	pmuludq	%xmm4, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	punpckldq	%xmm2, %xmm3    # xmm3 = xmm3[0],xmm2[0],xmm3[1],xmm2[1]
	.loc	1 42 55 is_stmt 0       # MatrixMult.c:42:55
	paddd	%xmm3, %xmm1
	addq	$4, %rax
	cmpq	%rax, %r9
	jne	.LBB5_22
# BB#23:                                # %middle.block
                                        #   in Loop: Header=BB5_14 Depth=6
	pshufd	$78, %xmm1, %xmm2       # xmm2 = xmm1[2,3,0,1]
	paddd	%xmm1, %xmm2
	pshufd	$229, %xmm2, %xmm1      # xmm1 = xmm2[1,1,2,3]
	paddd	%xmm2, %xmm1
	movd	%xmm1, %r11d
	movq	224(%rsp), %rax         # 8-byte Reload
	cmpq	%rax, 128(%rsp)         # 8-byte Folded Reload
	movq	%rax, %rdx
	movq	%r14, %rbx
	jne	.LBB5_16
	jmp	.LBB5_24
	.p2align	4, 0x90
.LBB5_15:                               #   in Loop: Header=BB5_14 Depth=6
	xorl	%edx, %edx
.LBB5_16:                               # %polly.loop_header40.us.us.preheader
                                        #   in Loop: Header=BB5_14 Depth=6
	movq	112(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rdx), %rax
	imulq	%rbx, %rax
	addq	%rbp, %rax
	leaq	(%r12,%rax,4), %rax
	movq	120(%rsp), %rdi         # 8-byte Reload
	leaq	(%rdi,%rdx), %rdi
	decq	%rdx
	leaq	(%r15,%rdi,4), %r14
	.p2align	4, 0x90
.LBB5_17:                               # %polly.loop_header40.us.us
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_7 Depth=3
                                        #         Parent Loop BB5_9 Depth=4
                                        #           Parent Loop BB5_12 Depth=5
                                        #             Parent Loop BB5_14 Depth=6
                                        # =>            This Inner Loop Header: Depth=7
	movl	(%rax), %edi
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	(%r14), %edi
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%edi, %r11d
	incq	%rdx
	addq	%r13, %rax
	addq	$4, %r14
	cmpq	%rcx, %rdx
	jle	.LBB5_17
.LBB5_24:                               # %polly.loop_exit42.loopexit.us.us
                                        #   in Loop: Header=BB5_14 Depth=6
	movq	232(%rsp), %r14         # 8-byte Reload
	movl	%r11d, (%r14,%r10,4)
	incq	%rbp
	cmpq	240(%rsp), %r8          # 8-byte Folded Reload
	leaq	1(%r8), %r8
	jle	.LBB5_14
.LBB5_25:                               # %polly.loop_exit33.loopexit.us
                                        #   in Loop: Header=BB5_12 Depth=5
	addq	%rbx, 120(%rsp)         # 8-byte Folded Spill
	movq	40(%rsp), %rax          # 8-byte Reload
	cmpq	216(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	jle	.LBB5_12
.LBB5_26:                               # %polly.loop_exit24
                                        #   in Loop: Header=BB5_9 Depth=4
	movq	200(%rsp), %rcx         # 8-byte Reload
	addq	$32, %rcx
	addq	$32, 112(%rsp)          # 8-byte Folded Spill
	addq	$32, 80(%rsp)           # 8-byte Folded Spill
	movq	192(%rsp), %rdx         # 8-byte Reload
	cmpq	72(%rsp), %rdx          # 8-byte Folded Reload
	leaq	1(%rdx), %rdx
	jne	.LBB5_9
.LBB5_18:                               # %polly.loop_exit15
                                        #   in Loop: Header=BB5_7 Depth=3
	addq	$32, 96(%rsp)           # 8-byte Folded Spill
	movq	32(%rsp), %rax          # 8-byte Reload
	cmpq	64(%rsp), %rax          # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	jne	.LBB5_7
.LBB5_19:                               # %polly.loop_exit6
                                        #   in Loop: Header=BB5_5 Depth=2
	movq	24(%rsp), %rax          # 8-byte Reload
	addq	48(%rsp), %rax          # 8-byte Folded Reload
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	16(%rsp), %rax          # 8-byte Reload
	cmpq	160(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	jle	.LBB5_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB5_4 Depth=1
	leaq	144(%rsp), %rdi
	leaq	136(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB5_4
.LBB5_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$280, %rsp              # imm = 0x118
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end5:
	.size	matrix_multiply_polly_subfn_2, .Lfunc_end5-matrix_multiply_polly_subfn_2
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Pass %d X %d matrix test case (C[%d][%d]=%d)\n"
	.size	.L.str, 46

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)" # string offset=0
.Linfo_string1:
	.asciz	"MatrixMult.c"          # string offset=165
.Linfo_string2:
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten2" # string offset=178
.Linfo_string3:
	.asciz	"int"                   # string offset=246
.Linfo_string4:
	.asciz	"data"                  # string offset=250
.Linfo_string5:
	.asciz	"width"                 # string offset=255
.Linfo_string6:
	.asciz	"height"                # string offset=261
.Linfo_string7:
	.asciz	"Matrix"                # string offset=268
.Linfo_string8:
	.asciz	"init"                  # string offset=275
.Linfo_string9:
	.asciz	"value"                 # string offset=280
.Linfo_string10:
	.asciz	"i"                     # string offset=286
.Linfo_string11:
	.asciz	"matrix"                # string offset=288
.Linfo_string12:
	.asciz	"matrix_multiply"       # string offset=295
.Linfo_string13:
	.asciz	"main"                  # string offset=311
.Linfo_string14:
	.asciz	"A"                     # string offset=316
.Linfo_string15:
	.asciz	"B"                     # string offset=318
.Linfo_string16:
	.asciz	"A_data"                # string offset=320
.Linfo_string17:
	.asciz	"B_data"                # string offset=327
.Linfo_string18:
	.asciz	"k"                     # string offset=334
.Linfo_string19:
	.asciz	"C"                     # string offset=336
.Linfo_string20:
	.asciz	"argc"                  # string offset=338
.Linfo_string21:
	.asciz	"args"                  # string offset=343
.Linfo_string22:
	.asciz	"char"                  # string offset=348
.Linfo_string23:
	.asciz	"max"                   # string offset=353
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp9-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp9-.Lfunc_begin0
	.quad	.Ltmp12-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	92                      # super-register DW_OP_reg12
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp8-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	84                      # super-register DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp8-.Lfunc_begin0
	.quad	.Ltmp16-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	94                      # super-register DW_OP_reg14
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc2:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp7-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	81                      # super-register DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp7-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp26-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp26-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp37-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Ltmp29-.Lfunc_begin0
	.quad	.Ltmp30-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	82                      # super-register DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp30-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	118                     # DW_OP_breg6
	.byte	180                     # -76
	.byte	127                     # 
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
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
	.byte	5                       # Abbreviation Code
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
	.byte	6                       # Abbreviation Code
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
	.byte	7                       # Abbreviation Code
	.byte	55                      # DW_TAG_restrict_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
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
	.byte	24                      # DW_FORM_exprloc
	.byte	49                      # DW_AT_abstract_origin
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
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	13                      # Abbreviation Code
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
	.byte	14                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
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
	.byte	17                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
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
	.byte	32                      # DW_AT_inline
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	18                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
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
	.byte	19                      # Abbreviation Code
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
	.byte	20                      # Abbreviation Code
	.byte	29                      # DW_TAG_inlined_subroutine
	.byte	1                       # DW_CHILDREN_yes
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	85                      # DW_AT_ranges
	.byte	23                      # DW_FORM_sec_offset
	.byte	88                      # DW_AT_call_file
	.byte	11                      # DW_FORM_data1
	.byte	89                      # DW_AT_call_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	21                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	22                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	623                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x268 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x5 DW_TAG_pointer_type
	.long	47                      # DW_AT_type
	.byte	3                       # Abbrev [3] 0x2f:0x7 DW_TAG_base_type
	.long	.Linfo_string3          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	2                       # Abbrev [2] 0x36:0x5 DW_TAG_pointer_type
	.long	59                      # DW_AT_type
	.byte	4                       # Abbrev [4] 0x3b:0xb DW_TAG_typedef
	.long	70                      # DW_AT_type
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.byte	5                       # Abbrev [5] 0x46:0x29 DW_TAG_structure_type
	.byte	16                      # DW_AT_byte_size
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.byte	6                       # Abbrev [6] 0x4a:0xc DW_TAG_member
	.long	.Linfo_string4          # DW_AT_name
	.long	111                     # DW_AT_type
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	6                       # Abbrev [6] 0x56:0xc DW_TAG_member
	.long	.Linfo_string5          # DW_AT_name
	.long	47                      # DW_AT_type
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	6                       # Abbrev [6] 0x62:0xc DW_TAG_member
	.long	.Linfo_string6          # DW_AT_name
	.long	47                      # DW_AT_type
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.byte	12                      # DW_AT_data_member_location
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x6f:0x5 DW_TAG_restrict_type
	.long	42                      # DW_AT_type
	.byte	8                       # Abbrev [8] 0x74:0x3c DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	312                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x87:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	324                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x90:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	335                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x99:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	346                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0xa2:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	357                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0xa8:0x7 DW_TAG_variable
	.byte	1                       # DW_AT_location
	.byte	80
	.long	368                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0xb0:0x88 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	29                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	380                     # DW_AT_type
                                        # DW_AT_external
	.byte	13                      # Abbrev [13] 0xc9:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	29                      # DW_AT_decl_line
	.long	380                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0xd8:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc4            # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	29                      # DW_AT_decl_line
	.long	380                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0xe7:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	64
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
	.long	111                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0xf5:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	72
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
	.long	111                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x103:0xf DW_TAG_variable
	.long	.Ldebug_loc5            # DW_AT_location
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	47                      # DW_AT_type
	.byte	16                      # Abbrev [16] 0x112:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	30                      # DW_AT_decl_line
	.long	47                      # DW_AT_type
	.byte	16                      # Abbrev [16] 0x11e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	30                      # DW_AT_decl_line
	.long	47                      # DW_AT_type
	.byte	14                      # Abbrev [14] 0x12a:0xd DW_TAG_variable
	.byte	1                       # DW_AT_location
	.byte	80
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	47                      # DW_AT_decl_line
	.long	380                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x138:0x44 DW_TAG_subprogram
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	380                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	18                      # Abbrev [18] 0x144:0xb DW_TAG_formal_parameter
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	47                      # DW_AT_type
	.byte	18                      # Abbrev [18] 0x14f:0xb DW_TAG_formal_parameter
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	47                      # DW_AT_type
	.byte	18                      # Abbrev [18] 0x15a:0xb DW_TAG_formal_parameter
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	47                      # DW_AT_type
	.byte	19                      # Abbrev [19] 0x165:0xb DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
	.long	47                      # DW_AT_type
	.byte	19                      # Abbrev [19] 0x170:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	21                      # DW_AT_decl_line
	.long	380                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x17c:0x5 DW_TAG_restrict_type
	.long	54                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x181:0xe0 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	85                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	47                      # DW_AT_type
                                        # DW_AT_external
	.byte	13                      # Abbrev [13] 0x19a:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc6            # DW_AT_location
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	85                      # DW_AT_decl_line
	.long	47                      # DW_AT_type
	.byte	13                      # Abbrev [13] 0x1a9:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc7            # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	85                      # DW_AT_decl_line
	.long	609                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1b8:0xf DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	97                      # DW_AT_decl_line
	.long	47                      # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1c7:0xf DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	97                      # DW_AT_decl_line
	.long	47                      # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1d6:0xf DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	100                     # DW_AT_decl_line
	.long	47                      # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1e5:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	95                      # DW_AT_decl_line
	.long	380                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1f4:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	96                      # DW_AT_decl_line
	.long	380                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x203:0x2a DW_TAG_inlined_subroutine
	.long	312                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	105                     # DW_AT_call_line
	.byte	21                      # Abbrev [21] 0x20e:0x6 DW_TAG_formal_parameter
	.byte	1                       # DW_AT_const_value
	.long	324                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x214:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc9            # DW_AT_location
	.long	335                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x21d:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc8            # DW_AT_location
	.long	346                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x226:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	357                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	20                      # Abbrev [20] 0x22d:0x33 DW_TAG_inlined_subroutine
	.long	312                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges1         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	106                     # DW_AT_call_line
	.byte	21                      # Abbrev [21] 0x238:0x6 DW_TAG_formal_parameter
	.byte	1                       # DW_AT_const_value
	.long	324                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x23e:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc13           # DW_AT_location
	.long	335                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x247:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc14           # DW_AT_location
	.long	346                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x250:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	357                     # DW_AT_abstract_origin
	.byte	22                      # Abbrev [22] 0x256:0x9 DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	368                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	2                       # Abbrev [2] 0x261:0x5 DW_TAG_pointer_type
	.long	614                     # DW_AT_type
	.byte	2                       # Abbrev [2] 0x266:0x5 DW_TAG_pointer_type
	.long	619                     # DW_AT_type
	.byte	3                       # Abbrev [3] 0x26b:0x7 DW_TAG_base_type
	.long	.Linfo_string22         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	0
	.quad	0
.Ldebug_ranges1:
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.quad	0
	.quad	0
	.section	.debug_macinfo,"",@progbits
.Ldebug_macinfo:
.Lcu_macro_begin0:
	.byte	0                       # End Of Macro List Mark
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end0-.LpubNames_begin0 # Length of Public Names Info
.LpubNames_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	627                     # Compilation Unit Length
	.long	312                     # DIE offset
	.asciz	"init"                  # External Name
	.long	176                     # DIE offset
	.asciz	"matrix_multiply"       # External Name
	.long	385                     # DIE offset
	.asciz	"main"                  # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	627                     # Compilation Unit Length
	.long	59                      # DIE offset
	.asciz	"Matrix"                # External Name
	.long	47                      # DIE offset
	.asciz	"int"                   # External Name
	.long	619                     # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
