	.text
	.file	"MatrixAdd.openmp.ll"
	.file	1 "MatrixAdd.c"
	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
.Lfunc_begin0:
	.loc	1 11 0                  # MatrixAdd.c:11:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp0:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp1:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp2:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp3:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp4:
	.cfi_def_cfa_offset 48
.Ltmp5:
	.cfi_offset %rbx, -40
.Ltmp6:
	.cfi_offset %r12, -32
.Ltmp7:
	.cfi_offset %r14, -24
.Ltmp8:
	.cfi_offset %r15, -16
	xorl	%r14d, %r14d
.Ltmp9:
	.loc	1 16 22 prologue_end    # MatrixAdd.c:16:22
	xorl	%edi, %edi
	callq	time
	.loc	1 16 5 is_stmt 0 discriminator 1 # MatrixAdd.c:16:5
	movl	%eax, %edi
	callq	srand
	movl	$R, %r15d
.Ltmp10:
	#DEBUG_VALUE: init:i <- 0
	.p2align	4, 0x90
.LBB0_1:                                # %for.cond2.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	movq	%r15, %rbx
	movl	$8000, %r12d            # imm = 0x1F40
	.p2align	4, 0x90
.LBB0_2:                                # %for.body5
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp11:
	.loc	1 20 23 is_stmt 1       # MatrixAdd.c:20:23
	callq	rand
	.loc	1 20 29 is_stmt 0       # MatrixAdd.c:20:29
	cltq
	imulq	$1374389535, %rax, %rcx # imm = 0x51EB851F
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	imull	$100, %ecx, %ecx
	subl	%ecx, %eax
	.loc	1 20 21                 # MatrixAdd.c:20:21
	movl	%eax, (%rbx)
.Ltmp12:
	.loc	1 18 9 is_stmt 1 discriminator 1 # MatrixAdd.c:18:9
	addq	$4, %rbx
	decq	%r12
	jne	.LBB0_2
.Ltmp13:
# BB#3:                                 # %for.inc9
                                        #   in Loop: Header=BB0_1 Depth=1
	.loc	1 17 5 discriminator 1  # MatrixAdd.c:17:5
	incq	%r14
	addq	$32000, %r15            # imm = 0x7D00
	cmpq	$8000, %r14             # imm = 0x1F40
	jne	.LBB0_1
.Ltmp14:
# BB#4:                                 # %polly.parallel.for
	leaq	(%rsp), %rbx
	movl	$init_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$250, %r8d
	movl	$1, %r9d
	movq	%rbx, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	init_polly_subfn
	callq	GOMP_parallel_end
	.loc	1 30 1                  # MatrixAdd.c:30:1
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Ltmp15:
.Lfunc_end0:
	.size	init, .Lfunc_end0-init
	.cfi_endproc

	.globl	mat_add
	.p2align	4, 0x90
	.type	mat_add,@function
mat_add:                                # @mat_add
.Lfunc_begin1:
	.loc	1 32 0                  # MatrixAdd.c:32:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp16:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp17:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp18:
	.cfi_def_cfa_offset 32
	subq	$32, %rsp
.Ltmp19:
	.cfi_def_cfa_offset 64
.Ltmp20:
	.cfi_offset %rbx, -32
.Ltmp21:
	.cfi_offset %r14, -24
.Ltmp22:
	.cfi_offset %r15, -16
.Ltmp23:
	#DEBUG_VALUE: mat_add:i <- 0
	leaq	8(%rsp), %rsi
	movl	$mat_add_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$250, %r8d
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	leaq	24(%rsp), %rdi
	leaq	16(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB1_11
# BB#1:
	leaq	24(%rsp), %r14
	leaq	16(%rsp), %r15
	.p2align	4, 0x90
.LBB1_3:                                # %polly.par.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_6 Depth 2
                                        #       Child Loop BB1_7 Depth 3
                                        #         Child Loop BB1_10 Depth 4
                                        #           Child Loop BB1_8 Depth 5
	movq	16(%rsp), %r8
	movq	24(%rsp), %r9
	addq	$-2, %r8
	imulq	$1024000, %r9, %r10     # imm = 0xFA000
	.p2align	4, 0x90
.LBB1_6:                                # %polly.loop_preheader3.i
                                        #   Parent Loop BB1_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_7 Depth 3
                                        #         Child Loop BB1_10 Depth 4
                                        #           Child Loop BB1_8 Depth 5
	movq	%r10, %r11
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB1_7:                                # %polly.loop_preheader9.i
                                        #   Parent Loop BB1_3 Depth=1
                                        #     Parent Loop BB1_6 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_10 Depth 4
                                        #           Child Loop BB1_8 Depth 5
	movq	%r11, %rcx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_10:                               # %polly.loop_preheader15.i
                                        #   Parent Loop BB1_3 Depth=1
                                        #     Parent Loop BB1_6 Depth=2
                                        #       Parent Loop BB1_7 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB1_8 Depth 5
	movq	%rcx, %rbx
	movl	$32, %edx
	.p2align	4, 0x90
.LBB1_8:                                # %polly.loop_header14.i
                                        #   Parent Loop BB1_3 Depth=1
                                        #     Parent Loop BB1_6 Depth=2
                                        #       Parent Loop BB1_7 Depth=3
                                        #         Parent Loop BB1_10 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movl	B(%rbx), %esi
.Ltmp24:
	.loc	1 37 31 prologue_end    # MatrixAdd.c:37:31
	addl	A(%rbx), %esi
	movl	%esi, C(%rbx)
	movl	B+4(%rbx), %esi
	addl	A+4(%rbx), %esi
	movl	%esi, C+4(%rbx)
	addq	$8, %rbx
	addq	$-2, %rdx
	jne	.LBB1_8
.Ltmp25:
# BB#9:                                 # %polly.loop_exit16.i
                                        #   in Loop: Header=BB1_10 Depth=4
	incq	%rax
	addq	$32000, %rcx            # imm = 0x7D00
	cmpq	$32, %rax
	jne	.LBB1_10
# BB#4:                                 # %polly.loop_exit10.i
                                        #   in Loop: Header=BB1_7 Depth=3
	incq	%rdi
	subq	$-128, %r11
	cmpq	$250, %rdi
	jne	.LBB1_7
# BB#5:                                 # %polly.loop_exit4.i
                                        #   in Loop: Header=BB1_6 Depth=2
	addq	$1024000, %r10          # imm = 0xFA000
	cmpq	%r8, %r9
	leaq	1(%r9), %r9
	jle	.LBB1_6
# BB#2:                                 # %polly.par.checkNext.loopexit.i
                                        #   in Loop: Header=BB1_3 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB1_3
.LBB1_11:                               # %mat_add_polly_subfn.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	.loc	1 40 1                  # MatrixAdd.c:40:1
	addq	$32, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Ltmp26:
.Lfunc_end1:
	.size	mat_add, .Lfunc_end1-mat_add
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin2:
	.loc	1 56 0                  # MatrixAdd.c:56:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 59 5 prologue_end     # MatrixAdd.c:59:5
	subq	$40, %rsp
.Ltmp27:
	.cfi_def_cfa_offset 48
	callq	init
	.loc	1 60 5                  # MatrixAdd.c:60:5
	callq	mat_add
	.loc	1 62 5                  # MatrixAdd.c:62:5
	movl	$.L.str, %edi
	movl	$8000, %esi             # imm = 0x1F40
	movl	$8000, %edx             # imm = 0x1F40
	xorl	%eax, %eax
	callq	printf
	movl	$255999996, %eax        # imm = 0xF423FFC
	.loc	1 64 19                 # MatrixAdd.c:64:19
	movl	A(%rax), %ecx
	.loc	1 65 19                 # MatrixAdd.c:65:19
	movl	B(%rax), %edx
	.loc	1 66 19                 # MatrixAdd.c:66:19
	movl	C(%rax), %eax
	.loc	1 63 5                  # MatrixAdd.c:63:5
	movl	%eax, 24(%rsp)
	movl	%edx, (%rsp)
	movl	$7999, 16(%rsp)         # imm = 0x1F3F
	movl	$7999, 8(%rsp)          # imm = 0x1F3F
	movl	$.L.str.1, %edi
	movl	$7999, %esi             # imm = 0x1F3F
	movl	$7999, %edx             # imm = 0x1F3F
	movl	$7999, %r8d             # imm = 0x1F3F
	movl	$7999, %r9d             # imm = 0x1F3F
	xorl	%eax, %eax
	callq	printf
	.loc	1 67 5                  # MatrixAdd.c:67:5
	xorl	%eax, %eax
	addq	$40, %rsp
	retq
.Ltmp28:
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
.Ltmp29:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp30:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp31:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp32:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp33:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp34:
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
.Ltmp35:
	.cfi_def_cfa_offset 80
.Ltmp36:
	.cfi_offset %rbx, -56
.Ltmp37:
	.cfi_offset %r12, -48
.Ltmp38:
	.cfi_offset %r13, -40
.Ltmp39:
	.cfi_offset %r14, -32
.Ltmp40:
	.cfi_offset %r15, -24
.Ltmp41:
	.cfi_offset %rbp, -16
	jmp	.LBB3_1
	.p2align	4, 0x90
.LBB3_2:                                # %polly.par.loadIVBounds
                                        #   in Loop: Header=BB3_1 Depth=1
	movq	8(%rsp), %r8
	movq	16(%rsp), %r9
	addq	$-2, %r8
	imulq	$1024000, %r9, %r10     # imm = 0xFA000
	xorl	%r11d, %r11d
	movq	%r9, %r12
	.p2align	4, 0x90
.LBB3_5:                                # %polly.loop_preheader3
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_6 Depth 3
                                        #         Child Loop BB3_9 Depth 4
                                        #           Child Loop BB3_7 Depth 5
	leaq	(%r9,%r11), %rbx
	shlq	$5, %rbx
	movq	%r10, %r13
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB3_6:                                # %polly.loop_preheader9
                                        #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB3_9 Depth 4
                                        #           Child Loop BB3_7 Depth 5
	movq	%r15, %rcx
	shlq	$5, %rcx
	movq	%r13, %rax
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB3_9:                                # %polly.loop_preheader15
                                        #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        #       Parent Loop BB3_6 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB3_7 Depth 5
	leaq	(%rbx,%rdi), %rdx
	imulq	$32000, %rdx, %rdx      # imm = 0x7D00
	movaps	R+112(%rdx,%rcx,4), %xmm0
	movaps	%xmm0, A+112(%rdx,%rcx,4)
	movaps	R+96(%rdx,%rcx,4), %xmm0
	movaps	%xmm0, A+96(%rdx,%rcx,4)
	movaps	R+80(%rdx,%rcx,4), %xmm0
	movaps	%xmm0, A+80(%rdx,%rcx,4)
	movaps	R+64(%rdx,%rcx,4), %xmm0
	movaps	%xmm0, A+64(%rdx,%rcx,4)
	movaps	R+48(%rdx,%rcx,4), %xmm0
	movaps	%xmm0, A+48(%rdx,%rcx,4)
	movaps	R+32(%rdx,%rcx,4), %xmm0
	movaps	%xmm0, A+32(%rdx,%rcx,4)
	movaps	R+16(%rdx,%rcx,4), %xmm0
	movaps	%xmm0, A+16(%rdx,%rcx,4)
	movaps	R(%rdx,%rcx,4), %xmm0
	movaps	%xmm0, A(%rdx,%rcx,4)
	movq	%rax, %rsi
	movl	$32, %ebp
	.p2align	4, 0x90
.LBB3_7:                                # %polly.loop_header14
                                        #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        #       Parent Loop BB3_6 Depth=3
                                        #         Parent Loop BB3_9 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	.loc	1 27 27                 # MatrixAdd.c:27:27
	movl	$100, %r14d
	subl	R(%rsi), %r14d
	movl	%r14d, B(%rsi)
	movl	$100, %edx
	subl	R+4(%rsi), %edx
	movl	%edx, B+4(%rsi)
	addq	$8, %rsi
	addq	$-2, %rbp
	jne	.LBB3_7
# BB#8:                                 # %polly.loop_exit16
                                        #   in Loop: Header=BB3_9 Depth=4
	incq	%rdi
	addq	$32000, %rax            # imm = 0x7D00
	cmpq	$32, %rdi
	jne	.LBB3_9
# BB#3:                                 # %polly.loop_exit10
                                        #   in Loop: Header=BB3_6 Depth=3
	incq	%r15
	subq	$-128, %r13
	cmpq	$250, %r15
	jne	.LBB3_6
# BB#4:                                 # %polly.loop_exit4
                                        #   in Loop: Header=BB3_5 Depth=2
	incq	%r11
	addq	$1024000, %r10          # imm = 0xFA000
	cmpq	%r8, %r12
	leaq	1(%r12), %r12
	jle	.LBB3_5
.LBB3_1:                                # %polly.par.setup
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_5 Depth 2
                                        #       Child Loop BB3_6 Depth 3
                                        #         Child Loop BB3_9 Depth 4
                                        #           Child Loop BB3_7 Depth 5
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB3_2
# BB#10:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$24, %rsp
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
	.type	mat_add_polly_subfn,@function
mat_add_polly_subfn:                    # @mat_add_polly_subfn
.Lfunc_begin4:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp42:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp43:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp44:
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
.Ltmp45:
	.cfi_def_cfa_offset 48
.Ltmp46:
	.cfi_offset %rbx, -32
.Ltmp47:
	.cfi_offset %r14, -24
.Ltmp48:
	.cfi_offset %r15, -16
	leaq	8(%rsp), %rdi
	leaq	(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB4_2
# BB#1:
	leaq	8(%rsp), %r14
	leaq	(%rsp), %r15
	.p2align	4, 0x90
.LBB4_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_7 Depth 2
                                        #       Child Loop BB4_8 Depth 3
                                        #         Child Loop BB4_11 Depth 4
                                        #           Child Loop BB4_9 Depth 5
	movq	(%rsp), %r8
	movq	8(%rsp), %r9
	addq	$-2, %r8
	imulq	$1024000, %r9, %r10     # imm = 0xFA000
	.p2align	4, 0x90
.LBB4_7:                                # %polly.loop_preheader3
                                        #   Parent Loop BB4_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_8 Depth 3
                                        #         Child Loop BB4_11 Depth 4
                                        #           Child Loop BB4_9 Depth 5
	movq	%r10, %r11
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB4_8:                                # %polly.loop_preheader9
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_7 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB4_11 Depth 4
                                        #           Child Loop BB4_9 Depth 5
	movq	%r11, %rcx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB4_11:                               # %polly.loop_preheader15
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_7 Depth=2
                                        #       Parent Loop BB4_8 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB4_9 Depth 5
	movq	%rcx, %rbx
	movl	$32, %edx
	.p2align	4, 0x90
.LBB4_9:                                # %polly.loop_header14
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_7 Depth=2
                                        #       Parent Loop BB4_8 Depth=3
                                        #         Parent Loop BB4_11 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movl	B(%rbx), %esi
	.loc	1 37 31                 # MatrixAdd.c:37:31
	addl	A(%rbx), %esi
	movl	%esi, C(%rbx)
	movl	B+4(%rbx), %esi
	addl	A+4(%rbx), %esi
	movl	%esi, C+4(%rbx)
	addq	$8, %rbx
	addq	$-2, %rdx
	jne	.LBB4_9
# BB#10:                                # %polly.loop_exit16
                                        #   in Loop: Header=BB4_11 Depth=4
	incq	%rax
	addq	$32000, %rcx            # imm = 0x7D00
	cmpq	$32, %rax
	jne	.LBB4_11
# BB#5:                                 # %polly.loop_exit10
                                        #   in Loop: Header=BB4_8 Depth=3
	incq	%rdi
	subq	$-128, %r11
	cmpq	$250, %rdi
	jne	.LBB4_8
# BB#6:                                 # %polly.loop_exit4
                                        #   in Loop: Header=BB4_7 Depth=2
	addq	$1024000, %r10          # imm = 0xFA000
	cmpq	%r8, %r9
	leaq	1(%r9), %r9
	jle	.LBB4_7
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB4_4 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB4_4
.LBB4_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Lfunc_end4:
	.size	mat_add_polly_subfn, .Lfunc_end4-mat_add_polly_subfn
	.cfi_endproc

	.type	R,@object               # @R
	.comm	R,256000000,16
	.type	A,@object               # @A
	.comm	A,256000000,16
	.type	B,@object               # @B
	.comm	B,256000000,16
	.type	C,@object               # @C
	.comm	C,256000000,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Pass %d X %d matrix test case \n"
	.size	.L.str, 32

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"A[%d][%d] = %d, B[%d][%d] =%d, C[%d][%d] =%d \n"
	.size	.L.str.1, 47

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)" # string offset=0
.Linfo_string1:
	.asciz	"MatrixAdd.c"           # string offset=165
.Linfo_string2:
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten" # string offset=177
.Linfo_string3:
	.asciz	"A"                     # string offset=243
.Linfo_string4:
	.asciz	"int"                   # string offset=245
.Linfo_string5:
	.asciz	"sizetype"              # string offset=249
.Linfo_string6:
	.asciz	"B"                     # string offset=258
.Linfo_string7:
	.asciz	"C"                     # string offset=260
.Linfo_string8:
	.asciz	"R"                     # string offset=262
.Linfo_string9:
	.asciz	"unsigned int"          # string offset=264
.Linfo_string10:
	.asciz	"init"                  # string offset=277
.Linfo_string11:
	.asciz	"mat_add"               # string offset=282
.Linfo_string12:
	.asciz	"main"                  # string offset=290
.Linfo_string13:
	.asciz	"i"                     # string offset=295
.Linfo_string14:
	.asciz	"j"                     # string offset=297
.Linfo_string15:
	.asciz	"k"                     # string offset=299
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
	.byte	5                       # DW_FORM_data2
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
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	324                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x13d DW_TAG_compile_unit
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
	.byte	3                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	A
	.byte	3                       # Abbrev [3] 0x3f:0x14 DW_TAG_array_type
	.long	83                      # DW_AT_type
	.byte	4                       # Abbrev [4] 0x44:0x7 DW_TAG_subrange_type
	.long	90                      # DW_AT_type
	.short	8000                    # DW_AT_count
	.byte	4                       # Abbrev [4] 0x4b:0x7 DW_TAG_subrange_type
	.long	90                      # DW_AT_type
	.short	8000                    # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x53:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	6                       # Abbrev [6] 0x5a:0x7 DW_TAG_base_type
	.long	.Linfo_string5          # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	2                       # Abbrev [2] 0x61:0x15 DW_TAG_variable
	.long	.Linfo_string6          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	B
	.byte	2                       # Abbrev [2] 0x76:0x15 DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	C
	.byte	2                       # Abbrev [2] 0x8b:0x15 DW_TAG_variable
	.long	.Linfo_string8          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	R
	.byte	5                       # Abbrev [5] 0xa0:0x7 DW_TAG_base_type
	.long	.Linfo_string9          # DW_AT_name
	.byte	7                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	7                       # Abbrev [7] 0xa7:0x2d DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0xbc:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0xc8:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0xd4:0x38 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0xe9:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0xf5:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x100:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	10                      # Abbrev [10] 0x10c:0x3b DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	55                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	9                       # Abbrev [9] 0x125:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	57                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x130:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	57                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x13b:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	57                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
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
	.long	328                     # Compilation Unit Length
	.long	42                      # DIE offset
	.asciz	"A"                     # External Name
	.long	97                      # DIE offset
	.asciz	"B"                     # External Name
	.long	118                     # DIE offset
	.asciz	"C"                     # External Name
	.long	167                     # DIE offset
	.asciz	"init"                  # External Name
	.long	139                     # DIE offset
	.asciz	"R"                     # External Name
	.long	268                     # DIE offset
	.asciz	"main"                  # External Name
	.long	212                     # DIE offset
	.asciz	"mat_add"               # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	328                     # Compilation Unit Length
	.long	160                     # DIE offset
	.asciz	"unsigned int"          # External Name
	.long	83                      # DIE offset
	.asciz	"int"                   # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
