	.text
	.file	"llvm/MatrixMult.openmp.disablevc.ll"
	.file	1 "MatrixMult.c"
	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
.Lfunc_begin0:
	.loc	1 12 0                  # MatrixMult.c:12:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp0:
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
.Ltmp1:
	.cfi_def_cfa_offset 32
.Ltmp2:
	.cfi_offset %rbx, -16
	leaq	8(%rsp), %rbx
	movl	$init_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$7, %r8d
	movl	$1, %r9d
	movq	%rbx, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	init_polly_subfn
	callq	GOMP_parallel_end
.Ltmp3:
	.loc	1 33 1 prologue_end     # MatrixMult.c:33:1
	addq	$16, %rsp
	popq	%rbx
	retq
.Ltmp4:
.Lfunc_end0:
	.size	init, .Lfunc_end0-init
	.cfi_endproc

	.globl	mat_mult
	.p2align	4, 0x90
	.type	mat_mult,@function
mat_mult:                               # @mat_mult
.Lfunc_begin1:
	.loc	1 35 0                  # MatrixMult.c:35:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp5:
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
.Ltmp6:
	.cfi_def_cfa_offset 32
.Ltmp7:
	.cfi_offset %rbx, -16
.Ltmp8:
	#DEBUG_VALUE: mat_mult:i <- 0
	leaq	8(%rsp), %rbx
	movl	$mat_mult_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$7, %r8d
	movl	$1, %r9d
	movq	%rbx, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	mat_mult_polly_subfn
	callq	GOMP_parallel_end
	movl	$mat_mult_polly_subfn_4, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$7, %r8d
	movl	$1, %r9d
	movq	%rbx, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	mat_mult_polly_subfn_4
	callq	GOMP_parallel_end
.Ltmp9:
	.loc	1 44 1 prologue_end     # MatrixMult.c:44:1
	addq	$16, %rsp
	popq	%rbx
	retq
.Ltmp10:
.Lfunc_end1:
	.size	mat_mult, .Lfunc_end1-mat_mult
	.cfi_endproc

	.globl	print_array
	.p2align	4, 0x90
	.type	print_array,@function
print_array:                            # @print_array
.Lfunc_begin2:
	.loc	1 47 0                  # MatrixMult.c:47:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp11:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp12:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp13:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp14:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp15:
	.cfi_def_cfa_offset 48
.Ltmp16:
	.cfi_offset %rbx, -40
.Ltmp17:
	.cfi_offset %r12, -32
.Ltmp18:
	.cfi_offset %r14, -24
.Ltmp19:
	.cfi_offset %r15, -16
	movl	$C, %r14d
.Ltmp20:
	#DEBUG_VALUE: print_array:i <- 0
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB2_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
.Ltmp21:
	.loc	1 52 21 prologue_end    # MatrixMult.c:52:21
	movq	stdout(%rip), %rcx
	movq	%r14, %r12
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB2_2:                                # %for.body3
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 52 38 is_stmt 0       # MatrixMult.c:52:38
	movq	(%r12), %rdx
	.loc	1 52 13                 # MatrixMult.c:52:13
	movl	$.L.str, %esi
	xorl	%eax, %eax
	movq	%rcx, %rdi
	callq	fprintf
.Ltmp22:
	.loc	1 53 18 is_stmt 1       # MatrixMult.c:53:18
	movslq	%ebx, %rax
	imulq	$1717986919, %rax, %rcx # imm = 0x66666667
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	shll	$4, %ecx
	leal	(%rcx,%rcx,4), %ecx
	subl	%ecx, %eax
.Ltmp23:
	.loc	1 53 17 is_stmt 0       # MatrixMult.c:53:17
	cmpl	$79, %eax
	jne	.LBB2_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB2_2 Depth=2
.Ltmp24:
	.loc	1 53 37 discriminator 1 # MatrixMult.c:53:37
	movq	stdout(%rip), %rsi
	.loc	1 53 29 discriminator 1 # MatrixMult.c:53:29
	movl	$10, %edi
	callq	fputc
.Ltmp25:
.LBB2_4:                                # %for.inc
                                        #   in Loop: Header=BB2_2 Depth=2
	.loc	1 51 9 is_stmt 1 discriminator 1 # MatrixMult.c:51:9
	incq	%rbx
.Ltmp26:
	.loc	1 52 21                 # MatrixMult.c:52:21
	movq	stdout(%rip), %rcx
.Ltmp27:
	.loc	1 51 9 discriminator 1  # MatrixMult.c:51:9
	addq	$8, %r12
	cmpq	$200, %rbx
	jne	.LBB2_2
.Ltmp28:
# BB#5:                                 # %for.end
                                        #   in Loop: Header=BB2_1 Depth=1
	.loc	1 55 9                  # MatrixMult.c:55:9
	movl	$10, %edi
	movq	%rcx, %rsi
	callq	fputc
.Ltmp29:
	.loc	1 50 5 discriminator 1  # MatrixMult.c:50:5
	incq	%r15
	addq	$1600, %r14             # imm = 0x640
	cmpq	$200, %r15
	jne	.LBB2_1
.Ltmp30:
# BB#6:                                 # %for.end11
	.loc	1 57 1                  # MatrixMult.c:57:1
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Ltmp31:
.Lfunc_end2:
	.size	print_array, .Lfunc_end2-print_array
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin3:
	.loc	1 60 0                  # MatrixMult.c:60:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 61 5 prologue_end     # MatrixMult.c:61:5
	subq	$40, %rsp
.Ltmp32:
	.cfi_def_cfa_offset 48
	callq	init
	.loc	1 62 5                  # MatrixMult.c:62:5
	callq	mat_mult
	.loc	1 64 5                  # MatrixMult.c:64:5
	movl	$.L.str.2, %edi
	movl	$200, %esi
	movl	$200, %edx
	xorl	%eax, %eax
	callq	printf
	.loc	1 66 19                 # MatrixMult.c:66:19
	movl	A+159996(%rip), %ecx
	.loc	1 67 19                 # MatrixMult.c:67:19
	movl	B+159996(%rip), %eax
	.loc	1 68 19                 # MatrixMult.c:68:19
	movq	C+319992(%rip), %rdx
	.loc	1 65 5                  # MatrixMult.c:65:5
	movq	%rdx, 24(%rsp)
	movl	%eax, (%rsp)
	movl	$199, 16(%rsp)
	movl	$199, 8(%rsp)
	movl	$.L.str.3, %edi
	movl	$199, %esi
	movl	$199, %edx
	movl	$199, %r8d
	movl	$199, %r9d
	xorl	%eax, %eax
	callq	printf
	.loc	1 69 5                  # MatrixMult.c:69:5
	xorl	%eax, %eax
	addq	$40, %rsp
	retq
.Ltmp33:
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc

	.p2align	4, 0x90
	.type	init_polly_subfn,@function
init_polly_subfn:                       # @init_polly_subfn
.Lfunc_begin4:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Ltmp34:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp35:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp36:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp37:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp38:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp39:
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
.Ltmp40:
	.cfi_def_cfa_offset 80
.Ltmp41:
	.cfi_offset %rbx, -56
.Ltmp42:
	.cfi_offset %r12, -48
.Ltmp43:
	.cfi_offset %r13, -40
.Ltmp44:
	.cfi_offset %r14, -32
.Ltmp45:
	.cfi_offset %r15, -24
.Ltmp46:
	.cfi_offset %rbp, -16
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB4_2
# BB#1:
	movl	$31, %r12d
	leaq	8(%rsp), %r15
	.p2align	4, 0x90
.LBB4_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_5 Depth 2
                                        #       Child Loop BB4_7 Depth 3
                                        #         Child Loop BB4_8 Depth 4
                                        #           Child Loop BB4_9 Depth 5
	movq	8(%rsp), %r8
	movq	16(%rsp), %r10
	addq	$-2, %r8
	imulq	$25600, %r10, %r9       # imm = 0x6400
	.p2align	4, 0x90
.LBB4_5:                                # %polly.loop_header
                                        #   Parent Loop BB4_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_7 Depth 3
                                        #         Child Loop BB4_8 Depth 4
                                        #           Child Loop BB4_9 Depth 5
	movq	%r10, %rsi
	shlq	$5, %rsi
	movl	$199, %edi
	subq	%rsi, %rdi
	cmpq	$31, %rdi
	cmovgq	%r12, %rdi
	testq	%rdi, %rdi
	js	.LBB4_12
# BB#6:                                 #   in Loop: Header=BB4_5 Depth=2
	decq	%rdi
	movq	%r9, %r11
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB4_7:                                # %polly.loop_header2.us
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB4_8 Depth 4
                                        #           Child Loop BB4_9 Depth 5
	movq	%r13, %rax
	shlq	$5, %rax
	movl	$199, %ecx
	subq	%rax, %rcx
	cmpq	$31, %rcx
	movl	$31, %edx
	cmovleq	%rcx, %rdx
	decq	%rdx
	movq	%r11, %r14
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB4_8:                                # %polly.loop_header8.us
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_7 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB4_9 Depth 5
	leal	(%rbx,%rsi), %ebp
	movq	$-1, %rax
	movq	%r14, %rcx
	.p2align	4, 0x90
.LBB4_9:                                # %polly.loop_header15.us
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_7 Depth=3
                                        #         Parent Loop BB4_8 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	addl	%ebp, A(%rcx)
	addl	%ebp, B(%rcx)
	incq	%rax
	addq	$4, %rcx
	cmpq	%rdx, %rax
	jle	.LBB4_9
# BB#10:                                # %polly.loop_exit17.us
                                        #   in Loop: Header=BB4_8 Depth=4
	addq	$800, %r14              # imm = 0x320
	cmpq	%rdi, %rbx
	leaq	1(%rbx), %rbx
	jle	.LBB4_8
# BB#11:                                # %polly.loop_exit10.loopexit.us
                                        #   in Loop: Header=BB4_7 Depth=3
	incq	%r13
	subq	$-128, %r11
	cmpq	$7, %r13
	jne	.LBB4_7
.LBB4_12:                               # %polly.loop_exit4
                                        #   in Loop: Header=BB4_5 Depth=2
	addq	$25600, %r9             # imm = 0x6400
	cmpq	%r8, %r10
	leaq	1(%r10), %r10
	jle	.LBB4_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB4_4 Depth=1
	leaq	16(%rsp), %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB4_4
.LBB4_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end4:
	.size	init_polly_subfn, .Lfunc_end4-init_polly_subfn
	.cfi_endproc

	.p2align	4, 0x90
	.type	mat_mult_polly_subfn,@function
mat_mult_polly_subfn:                   # @mat_mult_polly_subfn
.Lfunc_begin5:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Ltmp47:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp48:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp49:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp50:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp51:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp52:
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
.Ltmp53:
	.cfi_def_cfa_offset 80
.Ltmp54:
	.cfi_offset %rbx, -56
.Ltmp55:
	.cfi_offset %r12, -48
.Ltmp56:
	.cfi_offset %r13, -40
.Ltmp57:
	.cfi_offset %r14, -32
.Ltmp58:
	.cfi_offset %r15, -24
.Ltmp59:
	.cfi_offset %rbp, -16
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB5_2
# BB#1:
	movl	$31, %r12d
	xorps	%xmm0, %xmm0
	.p2align	4, 0x90
.LBB5_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_5 Depth 2
                                        #       Child Loop BB5_7 Depth 3
                                        #       Child Loop BB5_9 Depth 3
                                        #       Child Loop BB5_11 Depth 3
                                        #       Child Loop BB5_13 Depth 3
                                        #       Child Loop BB5_15 Depth 3
                                        #       Child Loop BB5_17 Depth 3
                                        #       Child Loop BB5_19 Depth 3
	movq	8(%rsp), %r8
	movq	16(%rsp), %rcx
	addq	$-2, %r8
	imulq	$51200, %rcx, %rax      # imm = 0xC800
	leaq	C(%rax), %r9
	leaq	C+256(%rax), %r14
	leaq	C+512(%rax), %r11
	leaq	C+768(%rax), %r13
	leaq	C+1024(%rax), %r15
	leaq	C+1280(%rax), %rdx
	leaq	C+1536(%rax), %rsi
	.p2align	4, 0x90
.LBB5_5:                                # %polly.loop_header
                                        #   Parent Loop BB5_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_7 Depth 3
                                        #       Child Loop BB5_9 Depth 3
                                        #       Child Loop BB5_11 Depth 3
                                        #       Child Loop BB5_13 Depth 3
                                        #       Child Loop BB5_15 Depth 3
                                        #       Child Loop BB5_17 Depth 3
                                        #       Child Loop BB5_19 Depth 3
	movq	%rcx, %rax
	shlq	$5, %rax
	movl	$199, %edi
	subq	%rax, %rdi
	cmpq	$31, %rdi
	cmovgq	%r12, %rdi
	testq	%rdi, %rdi
	js	.LBB5_20
# BB#6:                                 #   in Loop: Header=BB5_5 Depth=2
	decq	%rdi
	movq	$-1, %rbp
	movq	%r9, %rax
	movq	$-1, %rbx
	.p2align	4, 0x90
.LBB5_7:                                # %polly.loop_header8.us
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	%xmm0, 240(%rax)
	movaps	%xmm0, 224(%rax)
	movaps	%xmm0, 208(%rax)
	movaps	%xmm0, 192(%rax)
	movaps	%xmm0, 176(%rax)
	movaps	%xmm0, 160(%rax)
	movaps	%xmm0, 144(%rax)
	movaps	%xmm0, 128(%rax)
	movaps	%xmm0, 112(%rax)
	movaps	%xmm0, 96(%rax)
	movaps	%xmm0, 80(%rax)
	movaps	%xmm0, 64(%rax)
	movaps	%xmm0, 48(%rax)
	movaps	%xmm0, 32(%rax)
	movaps	%xmm0, 16(%rax)
	movaps	%xmm0, (%rax)
	incq	%rbx
	addq	$1600, %rax             # imm = 0x640
	cmpq	%rdi, %rbx
	jle	.LBB5_7
# BB#8:                                 #   in Loop: Header=BB5_5 Depth=2
	movq	%r14, %r10
	.p2align	4, 0x90
.LBB5_9:                                # %polly.loop_header8.us.1
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	%xmm0, 240(%r10)
	movaps	%xmm0, 224(%r10)
	movaps	%xmm0, 208(%r10)
	movaps	%xmm0, 192(%r10)
	movaps	%xmm0, 176(%r10)
	movaps	%xmm0, 160(%r10)
	movaps	%xmm0, 144(%r10)
	movaps	%xmm0, 128(%r10)
	movaps	%xmm0, 112(%r10)
	movaps	%xmm0, 96(%r10)
	movaps	%xmm0, 80(%r10)
	movaps	%xmm0, 64(%r10)
	movaps	%xmm0, 48(%r10)
	movaps	%xmm0, 32(%r10)
	movaps	%xmm0, 16(%r10)
	movaps	%xmm0, (%r10)
	incq	%rbp
	addq	$1600, %r10             # imm = 0x640
	movq	$-1, %rbx
	cmpq	%rdi, %rbp
	jle	.LBB5_9
# BB#10:                                #   in Loop: Header=BB5_5 Depth=2
	movq	%r11, %rax
	movq	$-1, %rbp
	.p2align	4, 0x90
.LBB5_11:                               # %polly.loop_header8.us.2
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	%xmm0, 240(%rax)
	movaps	%xmm0, 224(%rax)
	movaps	%xmm0, 208(%rax)
	movaps	%xmm0, 192(%rax)
	movaps	%xmm0, 176(%rax)
	movaps	%xmm0, 160(%rax)
	movaps	%xmm0, 144(%rax)
	movaps	%xmm0, 128(%rax)
	movaps	%xmm0, 112(%rax)
	movaps	%xmm0, 96(%rax)
	movaps	%xmm0, 80(%rax)
	movaps	%xmm0, 64(%rax)
	movaps	%xmm0, 48(%rax)
	movaps	%xmm0, 32(%rax)
	movaps	%xmm0, 16(%rax)
	movaps	%xmm0, (%rax)
	incq	%rbp
	addq	$1600, %rax             # imm = 0x640
	cmpq	%rdi, %rbp
	jle	.LBB5_11
# BB#12:                                #   in Loop: Header=BB5_5 Depth=2
	movq	%r13, %rax
	.p2align	4, 0x90
.LBB5_13:                               # %polly.loop_header8.us.3
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	%xmm0, 240(%rax)
	movaps	%xmm0, 224(%rax)
	movaps	%xmm0, 208(%rax)
	movaps	%xmm0, 192(%rax)
	movaps	%xmm0, 176(%rax)
	movaps	%xmm0, 160(%rax)
	movaps	%xmm0, 144(%rax)
	movaps	%xmm0, 128(%rax)
	movaps	%xmm0, 112(%rax)
	movaps	%xmm0, 96(%rax)
	movaps	%xmm0, 80(%rax)
	movaps	%xmm0, 64(%rax)
	movaps	%xmm0, 48(%rax)
	movaps	%xmm0, 32(%rax)
	movaps	%xmm0, 16(%rax)
	movaps	%xmm0, (%rax)
	incq	%rbx
	addq	$1600, %rax             # imm = 0x640
	movq	$-1, %rbp
	cmpq	%rdi, %rbx
	jle	.LBB5_13
# BB#14:                                #   in Loop: Header=BB5_5 Depth=2
	movq	%r15, %rax
	movq	$-1, %rbx
	.p2align	4, 0x90
.LBB5_15:                               # %polly.loop_header8.us.4
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	%xmm0, 240(%rax)
	movaps	%xmm0, 224(%rax)
	movaps	%xmm0, 208(%rax)
	movaps	%xmm0, 192(%rax)
	movaps	%xmm0, 176(%rax)
	movaps	%xmm0, 160(%rax)
	movaps	%xmm0, 144(%rax)
	movaps	%xmm0, 128(%rax)
	movaps	%xmm0, 112(%rax)
	movaps	%xmm0, 96(%rax)
	movaps	%xmm0, 80(%rax)
	movaps	%xmm0, 64(%rax)
	movaps	%xmm0, 48(%rax)
	movaps	%xmm0, 32(%rax)
	movaps	%xmm0, 16(%rax)
	movaps	%xmm0, (%rax)
	incq	%rbx
	addq	$1600, %rax             # imm = 0x640
	cmpq	%rdi, %rbx
	jle	.LBB5_15
# BB#16:                                #   in Loop: Header=BB5_5 Depth=2
	movq	%rdx, %rax
	.p2align	4, 0x90
.LBB5_17:                               # %polly.loop_header8.us.5
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	%xmm0, 240(%rax)
	movaps	%xmm0, 224(%rax)
	movaps	%xmm0, 208(%rax)
	movaps	%xmm0, 192(%rax)
	movaps	%xmm0, 176(%rax)
	movaps	%xmm0, 160(%rax)
	movaps	%xmm0, 144(%rax)
	movaps	%xmm0, 128(%rax)
	movaps	%xmm0, 112(%rax)
	movaps	%xmm0, 96(%rax)
	movaps	%xmm0, 80(%rax)
	movaps	%xmm0, 64(%rax)
	movaps	%xmm0, 48(%rax)
	movaps	%xmm0, 32(%rax)
	movaps	%xmm0, 16(%rax)
	movaps	%xmm0, (%rax)
	incq	%rbp
	addq	$1600, %rax             # imm = 0x640
	movq	$-1, %rbx
	cmpq	%rdi, %rbp
	jle	.LBB5_17
# BB#18:                                #   in Loop: Header=BB5_5 Depth=2
	movq	%rsi, %rax
	.p2align	4, 0x90
.LBB5_19:                               # %polly.loop_header8.us.6
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	%xmm0, 48(%rax)
	movaps	%xmm0, 32(%rax)
	movaps	%xmm0, 16(%rax)
	movaps	%xmm0, (%rax)
	incq	%rbx
	addq	$1600, %rax             # imm = 0x640
	cmpq	%rdi, %rbx
	jle	.LBB5_19
.LBB5_20:                               # %polly.loop_exit4
                                        #   in Loop: Header=BB5_5 Depth=2
	addq	$51200, %r9             # imm = 0xC800
	addq	$51200, %r14            # imm = 0xC800
	addq	$51200, %r11            # imm = 0xC800
	addq	$51200, %r13            # imm = 0xC800
	addq	$51200, %r15            # imm = 0xC800
	addq	$51200, %rdx            # imm = 0xC800
	addq	$51200, %rsi            # imm = 0xC800
	cmpq	%r8, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB5_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB5_4 Depth=1
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	xorps	%xmm0, %xmm0
	testb	%al, %al
	jne	.LBB5_4
.LBB5_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end5:
	.size	mat_mult_polly_subfn, .Lfunc_end5-mat_mult_polly_subfn
	.cfi_endproc

	.p2align	4, 0x90
	.type	mat_mult_polly_subfn_4,@function
mat_mult_polly_subfn_4:                 # @mat_mult_polly_subfn_4
.Lfunc_begin6:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Ltmp60:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp61:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp62:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp63:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp64:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp65:
	.cfi_def_cfa_offset 56
	subq	$104, %rsp
.Ltmp66:
	.cfi_def_cfa_offset 160
.Ltmp67:
	.cfi_offset %rbx, -56
.Ltmp68:
	.cfi_offset %r12, -48
.Ltmp69:
	.cfi_offset %r13, -40
.Ltmp70:
	.cfi_offset %r14, -32
.Ltmp71:
	.cfi_offset %r15, -24
.Ltmp72:
	.cfi_offset %rbp, -16
	jmp	.LBB6_1
	.p2align	4, 0x90
.LBB6_2:                                # %polly.par.loadIVBounds
                                        #   in Loop: Header=BB6_1 Depth=1
	movq	32(%rsp), %rax
	movq	40(%rsp), %rcx
	addq	$-2, %rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	imulq	$25600, %rcx, %rax      # imm = 0x6400
	leaq	A(%rax), %rax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	.p2align	4, 0x90
.LBB6_3:                                # %polly.loop_header
                                        #   Parent Loop BB6_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_5 Depth 3
                                        #         Child Loop BB6_6 Depth 4
                                        #           Child Loop BB6_7 Depth 5
                                        #             Child Loop BB6_8 Depth 6
                                        #               Child Loop BB6_9 Depth 7
	movq	%rcx, 56(%rsp)          # 8-byte Spill
	shlq	$5, %rcx
	movq	%rcx, 96(%rsp)          # 8-byte Spill
	movl	$199, %edx
	subq	%rcx, %rdx
	cmpq	$31, %rdx
	movl	$31, %eax
	cmovgq	%rax, %rdx
	movq	%rdx, 16(%rsp)          # 8-byte Spill
	testq	%rdx, %rdx
	js	.LBB6_14
# BB#4:                                 #   in Loop: Header=BB6_3 Depth=2
	decq	16(%rsp)                # 8-byte Folded Spill
	movl	$B, %esi
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB6_5:                                # %polly.loop_header2.us
                                        #   Parent Loop BB6_1 Depth=1
                                        #     Parent Loop BB6_3 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB6_6 Depth 4
                                        #           Child Loop BB6_7 Depth 5
                                        #             Child Loop BB6_8 Depth 6
                                        #               Child Loop BB6_9 Depth 7
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	%rsi, 72(%rsp)          # 8-byte Spill
	shlq	$5, %rax
	movl	$199, %ecx
	subq	%rax, %rcx
	cmpq	$31, %rcx
	movl	$31, %edx
	cmovleq	%rcx, %rdx
	decq	%rdx
	movq	8(%rsp), %rcx           # 8-byte Reload
	movq	%rsi, 24(%rsp)          # 8-byte Spill
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB6_6:                                # %polly.loop_header8.us.us
                                        #   Parent Loop BB6_1 Depth=1
                                        #     Parent Loop BB6_3 Depth=2
                                        #       Parent Loop BB6_5 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB6_7 Depth 5
                                        #             Child Loop BB6_8 Depth 6
                                        #               Child Loop BB6_9 Depth 7
	movq	%rsi, 80(%rsp)          # 8-byte Spill
	movq	%rcx, 88(%rsp)          # 8-byte Spill
	shlq	$5, %rsi
	movl	$199, %ebp
	subq	%rsi, %rbp
	cmpq	$31, %rbp
	movl	$31, %r14d
	cmovleq	%rbp, %r14
	decq	%r14
	movq	%rcx, %rbp
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB6_7:                                # %polly.loop_header14.us.us
                                        #   Parent Loop BB6_1 Depth=1
                                        #     Parent Loop BB6_3 Depth=2
                                        #       Parent Loop BB6_5 Depth=3
                                        #         Parent Loop BB6_6 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB6_8 Depth 6
                                        #               Child Loop BB6_9 Depth 7
	movq	96(%rsp), %rcx          # 8-byte Reload
	leaq	(%r12,%rcx), %r8
	movq	24(%rsp), %rsi          # 8-byte Reload
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB6_8:                                # %polly.loop_header21.us.us
                                        #   Parent Loop BB6_1 Depth=1
                                        #     Parent Loop BB6_3 Depth=2
                                        #       Parent Loop BB6_5 Depth=3
                                        #         Parent Loop BB6_6 Depth=4
                                        #           Parent Loop BB6_7 Depth=5
                                        # =>          This Loop Header: Depth=6
                                        #               Child Loop BB6_9 Depth 7
	leaq	(%r10,%rax), %rbx
	imulq	$1600, %r8, %rdi        # imm = 0x640
	leaq	C(%rdi,%rbx,8), %r11
	movq	C(%rdi,%rbx,8), %r13
	movq	$-1, %rbx
	movq	%rbp, %r15
	movq	%rsi, %r9
	.p2align	4, 0x90
.LBB6_9:                                # %polly.loop_header28.us.us
                                        #   Parent Loop BB6_1 Depth=1
                                        #     Parent Loop BB6_3 Depth=2
                                        #       Parent Loop BB6_5 Depth=3
                                        #         Parent Loop BB6_6 Depth=4
                                        #           Parent Loop BB6_7 Depth=5
                                        #             Parent Loop BB6_8 Depth=6
                                        # =>            This Inner Loop Header: Depth=7
	.loc	1 41 37                 # MatrixMult.c:41:37
	movslq	(%r9), %rdi
	movslq	(%r15), %rcx
	.loc	1 41 45 is_stmt 0       # MatrixMult.c:41:45
	imulq	%rdi, %rcx
	.loc	1 41 35                 # MatrixMult.c:41:35
	addq	%rcx, %r13
	incq	%rbx
	addq	$800, %r9               # imm = 0x320
	addq	$4, %r15
	cmpq	%r14, %rbx
	jle	.LBB6_9
# BB#10:                                # %polly.loop_exit30.us.us
                                        #   in Loop: Header=BB6_8 Depth=6
	movq	%r13, (%r11)
	addq	$4, %rsi
	cmpq	%rdx, %r10
	leaq	1(%r10), %r10
	jle	.LBB6_8
# BB#11:                                # %polly.loop_exit23.us.us
                                        #   in Loop: Header=BB6_7 Depth=5
	addq	$800, %rbp              # imm = 0x320
	cmpq	16(%rsp), %r12          # 8-byte Folded Reload
	leaq	1(%r12), %r12
	jle	.LBB6_7
# BB#12:                                # %polly.loop_exit16.loopexit.us.us
                                        #   in Loop: Header=BB6_6 Depth=4
	movq	80(%rsp), %rsi          # 8-byte Reload
	incq	%rsi
	addq	$25600, 24(%rsp)        # 8-byte Folded Spill
                                        # imm = 0x6400
	movq	88(%rsp), %rcx          # 8-byte Reload
	subq	$-128, %rcx
	cmpq	$7, %rsi
	jne	.LBB6_6
# BB#13:                                # %polly.loop_exit10.us-lcssa.us.us
                                        #   in Loop: Header=BB6_5 Depth=3
	movq	64(%rsp), %rax          # 8-byte Reload
	incq	%rax
	movq	72(%rsp), %rsi          # 8-byte Reload
	subq	$-128, %rsi
	cmpq	$7, %rax
	jne	.LBB6_5
.LBB6_14:                               # %polly.loop_exit4
                                        #   in Loop: Header=BB6_3 Depth=2
	addq	$25600, 8(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x6400
	movq	56(%rsp), %rcx          # 8-byte Reload
	cmpq	48(%rsp), %rcx          # 8-byte Folded Reload
	leaq	1(%rcx), %rcx
	jle	.LBB6_3
.LBB6_1:                                # %polly.par.setup
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_3 Depth 2
                                        #       Child Loop BB6_5 Depth 3
                                        #         Child Loop BB6_6 Depth 4
                                        #           Child Loop BB6_7 Depth 5
                                        #             Child Loop BB6_8 Depth 6
                                        #               Child Loop BB6_9 Depth 7
	leaq	40(%rsp), %rdi
	leaq	32(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB6_2
# BB#15:                                # %polly.par.exit
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
	.size	mat_mult_polly_subfn_4, .Lfunc_end6-mat_mult_polly_subfn_4
	.cfi_endproc

	.type	A,@object               # @A
	.comm	A,160000,16
	.type	B,@object               # @B
	.comm	B,160000,16
	.type	C,@object               # @C
	.comm	C,320000,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%lld "
	.size	.L.str, 6

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"Pass %d X %d matrix test case \n"
	.size	.L.str.2, 32

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"A[%d][%d] = %d, B[%d][%d] =%d, C[%d][%d] =%lld \n"
	.size	.L.str.3, 49

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)" # string offset=0
.Linfo_string1:
	.asciz	"MatrixMult.c"          # string offset=165
.Linfo_string2:
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten" # string offset=178
.Linfo_string3:
	.asciz	"A"                     # string offset=245
.Linfo_string4:
	.asciz	"int"                   # string offset=247
.Linfo_string5:
	.asciz	"sizetype"              # string offset=251
.Linfo_string6:
	.asciz	"B"                     # string offset=260
.Linfo_string7:
	.asciz	"C"                     # string offset=262
.Linfo_string8:
	.asciz	"long long int"         # string offset=264
.Linfo_string9:
	.asciz	"init"                  # string offset=278
.Linfo_string10:
	.asciz	"mat_mult"              # string offset=283
.Linfo_string11:
	.asciz	"print_array"           # string offset=292
.Linfo_string12:
	.asciz	"main"                  # string offset=304
.Linfo_string13:
	.asciz	"i"                     # string offset=309
.Linfo_string14:
	.asciz	"j"                     # string offset=311
.Linfo_string15:
	.asciz	"k"                     # string offset=313
	.section	.debug_loc,"",@progbits
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
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
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
	.byte	9                       # Abbreviation Code
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
	.byte	10                      # Abbreviation Code
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
	.byte	11                      # Abbreviation Code
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
	.long	306                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x12b DW_TAG_compile_unit
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
	.byte	7                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	A
	.byte	3                       # Abbrev [3] 0x3f:0x12 DW_TAG_array_type
	.long	81                      # DW_AT_type
	.byte	4                       # Abbrev [4] 0x44:0x6 DW_TAG_subrange_type
	.long	88                      # DW_AT_type
	.byte	200                     # DW_AT_count
	.byte	4                       # Abbrev [4] 0x4a:0x6 DW_TAG_subrange_type
	.long	88                      # DW_AT_type
	.byte	200                     # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x51:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	6                       # Abbrev [6] 0x58:0x7 DW_TAG_base_type
	.long	.Linfo_string5          # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	2                       # Abbrev [2] 0x5f:0x15 DW_TAG_variable
	.long	.Linfo_string6          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	B
	.byte	2                       # Abbrev [2] 0x74:0x15 DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.long	137                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	C
	.byte	3                       # Abbrev [3] 0x89:0x12 DW_TAG_array_type
	.long	155                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x8e:0x6 DW_TAG_subrange_type
	.long	88                      # DW_AT_type
	.byte	200                     # DW_AT_count
	.byte	4                       # Abbrev [4] 0x94:0x6 DW_TAG_subrange_type
	.long	88                      # DW_AT_type
	.byte	200                     # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x9b:0x7 DW_TAG_base_type
	.long	.Linfo_string8          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # Abbrev [7] 0xa2:0x15 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0xb7:0x38 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	9                       # Abbrev [9] 0xcc:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	81                      # DW_AT_type
	.byte	10                      # Abbrev [10] 0xd8:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	81                      # DW_AT_type
	.byte	10                      # Abbrev [10] 0xe3:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	81                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	8                       # Abbrev [8] 0xef:0x2d DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	46                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	9                       # Abbrev [9] 0x104:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	48                      # DW_AT_decl_line
	.long	81                      # DW_AT_type
	.byte	10                      # Abbrev [10] 0x110:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	48                      # DW_AT_decl_line
	.long	81                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	11                      # Abbrev [11] 0x11c:0x19 DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	81                      # DW_AT_type
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
	.long	310                     # Compilation Unit Length
	.long	42                      # DIE offset
	.asciz	"A"                     # External Name
	.long	95                      # DIE offset
	.asciz	"B"                     # External Name
	.long	116                     # DIE offset
	.asciz	"C"                     # External Name
	.long	162                     # DIE offset
	.asciz	"init"                  # External Name
	.long	284                     # DIE offset
	.asciz	"main"                  # External Name
	.long	183                     # DIE offset
	.asciz	"mat_mult"              # External Name
	.long	239                     # DIE offset
	.asciz	"print_array"           # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	310                     # Compilation Unit Length
	.long	81                      # DIE offset
	.asciz	"int"                   # External Name
	.long	155                     # DIE offset
	.asciz	"long long int"         # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
