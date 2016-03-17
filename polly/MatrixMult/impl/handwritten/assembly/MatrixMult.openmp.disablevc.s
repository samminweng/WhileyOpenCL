	.text
	.file	"MatrixMult.openmp.disablevc.ll"
	.file	1 "MatrixMult.c"
	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
.Lfunc_begin0:
	.loc	1 12 0                  # MatrixMult.c:12:0
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
	.loc	1 17 22 prologue_end    # MatrixMult.c:17:22
	xorl	%edi, %edi
	callq	time
	.loc	1 17 5 is_stmt 0 discriminator 1 # MatrixMult.c:17:5
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
	movl	$2000, %r12d            # imm = 0x7D0
	.p2align	4, 0x90
.LBB0_2:                                # %for.body5
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp11:
	.loc	1 21 23 is_stmt 1       # MatrixMult.c:21:23
	callq	rand
	.loc	1 21 29 is_stmt 0       # MatrixMult.c:21:29
	cltq
	imulq	$1717986919, %rax, %rcx # imm = 0x66666667
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$34, %rcx
	addl	%edx, %ecx
	addl	%ecx, %ecx
	leal	(%rcx,%rcx,4), %ecx
	subl	%ecx, %eax
	.loc	1 21 21                 # MatrixMult.c:21:21
	movl	%eax, (%rbx)
.Ltmp12:
	.loc	1 19 9 is_stmt 1 discriminator 1 # MatrixMult.c:19:9
	addq	$4, %rbx
	decq	%r12
	jne	.LBB0_2
.Ltmp13:
# BB#3:                                 # %for.inc9
                                        #   in Loop: Header=BB0_1 Depth=1
	.loc	1 18 5 discriminator 1  # MatrixMult.c:18:5
	incq	%r14
	addq	$8000, %r15             # imm = 0x1F40
	cmpq	$2000, %r14             # imm = 0x7D0
	jne	.LBB0_1
.Ltmp14:
# BB#4:                                 # %polly.parallel.for
	leaq	(%rsp), %rbx
	movl	$init_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$63, %r8d
	movl	$1, %r9d
	movq	%rbx, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	init_polly_subfn
	callq	GOMP_parallel_end
	.loc	1 33 1                  # MatrixMult.c:33:1
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

	.globl	mat_mult
	.p2align	4, 0x90
	.type	mat_mult,@function
mat_mult:                               # @mat_mult
.Lfunc_begin1:
	.loc	1 35 0                  # MatrixMult.c:35:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp16:
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
.Ltmp17:
	.cfi_def_cfa_offset 32
.Ltmp18:
	.cfi_offset %rbx, -16
.Ltmp19:
	#DEBUG_VALUE: mat_mult:i <- 0
	leaq	8(%rsp), %rbx
	movl	$mat_mult_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$63, %r8d
	movl	$1, %r9d
	movq	%rbx, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	mat_mult_polly_subfn
	callq	GOMP_parallel_end
	movl	$mat_mult_polly_subfn_2, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$63, %r8d
	movl	$1, %r9d
	movq	%rbx, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	mat_mult_polly_subfn_2
	callq	GOMP_parallel_end
.Ltmp20:
	.loc	1 44 1 prologue_end     # MatrixMult.c:44:1
	addq	$16, %rsp
	popq	%rbx
	retq
.Ltmp21:
.Lfunc_end1:
	.size	mat_mult, .Lfunc_end1-mat_mult
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin2:
	.loc	1 60 0                  # MatrixMult.c:60:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 61 5 prologue_end     # MatrixMult.c:61:5
	subq	$40, %rsp
.Ltmp22:
	.cfi_def_cfa_offset 48
	callq	init
	.loc	1 62 5                  # MatrixMult.c:62:5
	callq	mat_mult
	.loc	1 64 5                  # MatrixMult.c:64:5
	movl	$.L.str, %edi
	movl	$2000, %esi             # imm = 0x7D0
	movl	$2000, %edx             # imm = 0x7D0
	xorl	%eax, %eax
	callq	printf
	.loc	1 66 19                 # MatrixMult.c:66:19
	movl	A+15999996(%rip), %ecx
	.loc	1 67 19                 # MatrixMult.c:67:19
	movl	B+15999996(%rip), %eax
	.loc	1 68 19                 # MatrixMult.c:68:19
	movl	C+15999996(%rip), %edx
	.loc	1 65 5                  # MatrixMult.c:65:5
	movl	%edx, 24(%rsp)
	movl	%eax, (%rsp)
	movl	$1999, 16(%rsp)         # imm = 0x7CF
	movl	$1999, 8(%rsp)          # imm = 0x7CF
	movl	$.L.str.1, %edi
	movl	$1999, %esi             # imm = 0x7CF
	movl	$1999, %edx             # imm = 0x7CF
	movl	$1999, %r8d             # imm = 0x7CF
	movl	$1999, %r9d             # imm = 0x7CF
	xorl	%eax, %eax
	callq	printf
	.loc	1 69 5                  # MatrixMult.c:69:5
	xorl	%eax, %eax
	addq	$40, %rsp
	retq
.Ltmp23:
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
.Ltmp24:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp25:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp26:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp27:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp28:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp29:
	.cfi_def_cfa_offset 56
	subq	$88, %rsp
.Ltmp30:
	.cfi_def_cfa_offset 144
.Ltmp31:
	.cfi_offset %rbx, -56
.Ltmp32:
	.cfi_offset %r12, -48
.Ltmp33:
	.cfi_offset %r13, -40
.Ltmp34:
	.cfi_offset %r14, -32
.Ltmp35:
	.cfi_offset %r15, -24
.Ltmp36:
	.cfi_offset %rbp, -16
	jmp	.LBB3_1
	.p2align	4, 0x90
.LBB3_2:                                # %polly.par.loadIVBounds
                                        #   in Loop: Header=BB3_1 Depth=1
	movq	24(%rsp), %rax
	movq	32(%rsp), %rcx
	addq	$-2, %rax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	imulq	$256000, %rcx, %rax     # imm = 0x3E800
	leaq	A(%rax), %rdx
	movq	%rdx, 16(%rsp)          # 8-byte Spill
	leaq	R(%rax), %rdx
	movq	%rdx, 8(%rsp)           # 8-byte Spill
	leaq	B(%rax), %rax
	movq	%rax, (%rsp)            # 8-byte Spill
	.p2align	4, 0x90
.LBB3_4:                                # %polly.loop_preheader3
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_6 Depth 3
                                        #         Child Loop BB3_7 Depth 4
	movq	%rcx, 48(%rsp)          # 8-byte Spill
	movq	%rcx, %rax
	shlq	$5, %rax
	movl	$1999, %r14d            # imm = 0x7CF
	subq	%rax, %r14
	cmpq	$31, %r14
	movl	$31, %eax
	cmovgq	%rax, %r14
	testq	%r14, %r14
	js	.LBB3_3
# BB#5:                                 #   in Loop: Header=BB3_4 Depth=2
	decq	%r14
	movq	(%rsp), %rcx            # 8-byte Reload
	movq	8(%rsp), %rdx           # 8-byte Reload
	movq	16(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB3_6:                                # %polly.loop_header8.preheader.us
                                        #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_4 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB3_7 Depth 4
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	%rsi, 64(%rsp)          # 8-byte Spill
	movq	%rdx, 72(%rsp)          # 8-byte Spill
	movq	%rcx, 80(%rsp)          # 8-byte Spill
	movq	%rax, %r12
	shlq	$5, %r12
	addq	$-2000, %r12            # imm = 0xFFFFFFFFFFFFF830
	cmpq	$-33, %r12
	movq	$-32, %rax
	cmovleq	%rax, %r12
	shlq	$2, %r12
	negq	%r12
	movq	$-1, %r15
	movq	%rcx, %r13
	movq	%rdx, %rbx
	movq	%rsi, %rbp
	.p2align	4, 0x90
.LBB3_7:                                # %polly.loop_header8.us
                                        #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_4 Depth=2
                                        #       Parent Loop BB3_6 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	callq	memcpy
	movq	%r13, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	callq	memcpy
	incq	%r15
	addq	$8000, %rbp             # imm = 0x1F40
	addq	$8000, %rbx             # imm = 0x1F40
	addq	$8000, %r13             # imm = 0x1F40
	cmpq	%r14, %r15
	jle	.LBB3_7
# BB#8:                                 # %polly.loop_exit10.loopexit.us
                                        #   in Loop: Header=BB3_6 Depth=3
	movq	56(%rsp), %rax          # 8-byte Reload
	incq	%rax
	movq	64(%rsp), %rsi          # 8-byte Reload
	subq	$-128, %rsi
	movq	72(%rsp), %rdx          # 8-byte Reload
	subq	$-128, %rdx
	movq	80(%rsp), %rcx          # 8-byte Reload
	subq	$-128, %rcx
	cmpq	$63, %rax
	jne	.LBB3_6
.LBB3_3:                                # %polly.loop_exit4
                                        #   in Loop: Header=BB3_4 Depth=2
	addq	$256000, 16(%rsp)       # 8-byte Folded Spill
                                        # imm = 0x3E800
	addq	$256000, 8(%rsp)        # 8-byte Folded Spill
                                        # imm = 0x3E800
	addq	$256000, (%rsp)         # 8-byte Folded Spill
                                        # imm = 0x3E800
	movq	48(%rsp), %rcx          # 8-byte Reload
	cmpq	40(%rsp), %rcx          # 8-byte Folded Reload
	leaq	1(%rcx), %rcx
	jle	.LBB3_4
.LBB3_1:                                # %polly.par.setup
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_4 Depth 2
                                        #       Child Loop BB3_6 Depth 3
                                        #         Child Loop BB3_7 Depth 4
	leaq	32(%rsp), %rdi
	leaq	24(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB3_2
# BB#9:                                 # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$88, %rsp
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
.Ltmp37:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp38:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp39:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp40:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp41:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp42:
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
.Ltmp43:
	.cfi_def_cfa_offset 96
.Ltmp44:
	.cfi_offset %rbx, -56
.Ltmp45:
	.cfi_offset %r12, -48
.Ltmp46:
	.cfi_offset %r13, -40
.Ltmp47:
	.cfi_offset %r14, -32
.Ltmp48:
	.cfi_offset %r15, -24
.Ltmp49:
	.cfi_offset %rbp, -16
	jmp	.LBB4_1
	.p2align	4, 0x90
.LBB4_2:                                # %polly.par.loadIVBounds
                                        #   in Loop: Header=BB4_1 Depth=1
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	addq	$-2, %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	imulq	$256000, %rcx, %rax     # imm = 0x3E800
	leaq	C(%rax), %rax
	movq	%rax, (%rsp)            # 8-byte Spill
	.p2align	4, 0x90
.LBB4_4:                                # %polly.loop_preheader3
                                        #   Parent Loop BB4_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_6 Depth 3
                                        #         Child Loop BB4_7 Depth 4
	movq	%rcx, 32(%rsp)          # 8-byte Spill
	movq	%rcx, %rax
	shlq	$5, %rax
	movl	$1999, %r14d            # imm = 0x7CF
	subq	%rax, %r14
	cmpq	$31, %r14
	movl	$31, %eax
	cmovgq	%rax, %r14
	testq	%r14, %r14
	js	.LBB4_3
# BB#5:                                 #   in Loop: Header=BB4_4 Depth=2
	decq	%r14
	movq	(%rsp), %r13            # 8-byte Reload
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB4_6:                                # %polly.loop_header8.preheader.us
                                        #   Parent Loop BB4_1 Depth=1
                                        #     Parent Loop BB4_4 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB4_7 Depth 4
	movq	%r15, %r12
	shlq	$5, %r12
	addq	$-2000, %r12            # imm = 0xFFFFFFFFFFFFF830
	cmpq	$-33, %r12
	movq	$-32, %rax
	cmovleq	%rax, %r12
	shlq	$2, %r12
	negq	%r12
	movq	$-1, %rbp
	movq	%r13, %rbx
	.p2align	4, 0x90
.LBB4_7:                                # %polly.loop_header8.us
                                        #   Parent Loop BB4_1 Depth=1
                                        #     Parent Loop BB4_4 Depth=2
                                        #       Parent Loop BB4_6 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movq	%r12, %rdx
	callq	memset
	incq	%rbp
	addq	$8000, %rbx             # imm = 0x1F40
	cmpq	%r14, %rbp
	jle	.LBB4_7
# BB#8:                                 # %polly.loop_exit10.loopexit.us
                                        #   in Loop: Header=BB4_6 Depth=3
	incq	%r15
	subq	$-128, %r13
	cmpq	$63, %r15
	jne	.LBB4_6
.LBB4_3:                                # %polly.loop_exit4
                                        #   in Loop: Header=BB4_4 Depth=2
	addq	$256000, (%rsp)         # 8-byte Folded Spill
                                        # imm = 0x3E800
	movq	32(%rsp), %rcx          # 8-byte Reload
	cmpq	24(%rsp), %rcx          # 8-byte Folded Reload
	leaq	1(%rcx), %rcx
	jle	.LBB4_4
.LBB4_1:                                # %polly.par.setup
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_4 Depth 2
                                        #       Child Loop BB4_6 Depth 3
                                        #         Child Loop BB4_7 Depth 4
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB4_2
# BB#9:                                 # %polly.par.exit
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
	.size	mat_mult_polly_subfn, .Lfunc_end4-mat_mult_polly_subfn
	.cfi_endproc

	.p2align	4, 0x90
	.type	mat_mult_polly_subfn_2,@function
mat_mult_polly_subfn_2:                 # @mat_mult_polly_subfn_2
.Lfunc_begin5:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Ltmp50:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp51:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp52:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp53:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp54:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp55:
	.cfi_def_cfa_offset 56
	subq	$88, %rsp
.Ltmp56:
	.cfi_def_cfa_offset 144
.Ltmp57:
	.cfi_offset %rbx, -56
.Ltmp58:
	.cfi_offset %r12, -48
.Ltmp59:
	.cfi_offset %r13, -40
.Ltmp60:
	.cfi_offset %r14, -32
.Ltmp61:
	.cfi_offset %r15, -24
.Ltmp62:
	.cfi_offset %rbp, -16
	jmp	.LBB5_1
	.p2align	4, 0x90
.LBB5_2:                                # %polly.par.loadIVBounds
                                        #   in Loop: Header=BB5_1 Depth=1
	movq	16(%rsp), %rax
	movq	24(%rsp), %rcx
	addq	$-2, %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	imulq	$256000, %rcx, %rax     # imm = 0x3E800
	leaq	A(%rax), %rax
	movq	%rax, (%rsp)            # 8-byte Spill
	.p2align	4, 0x90
.LBB5_4:                                # %polly.loop_preheader3
                                        #   Parent Loop BB5_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_6 Depth 3
                                        #         Child Loop BB5_7 Depth 4
                                        #           Child Loop BB5_8 Depth 5
                                        #             Child Loop BB5_9 Depth 6
                                        #               Child Loop BB5_10 Depth 7
	movq	%rcx, 40(%rsp)          # 8-byte Spill
	shlq	$5, %rcx
	movq	%rcx, 80(%rsp)          # 8-byte Spill
	movl	$1999, %edx             # imm = 0x7CF
	subq	%rcx, %rdx
	cmpq	$31, %rdx
	movl	$31, %eax
	cmovgq	%rax, %rdx
	movq	%rdx, 8(%rsp)           # 8-byte Spill
	testq	%rdx, %rdx
	js	.LBB5_3
# BB#5:                                 #   in Loop: Header=BB5_4 Depth=2
	decq	8(%rsp)                 # 8-byte Folded Spill
	movl	$B, %esi
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB5_6:                                # %polly.loop_preheader9.us
                                        #   Parent Loop BB5_1 Depth=1
                                        #     Parent Loop BB5_4 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_7 Depth 4
                                        #           Child Loop BB5_8 Depth 5
                                        #             Child Loop BB5_9 Depth 6
                                        #               Child Loop BB5_10 Depth 7
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	%rsi, 56(%rsp)          # 8-byte Spill
	shlq	$5, %rax
	movl	$1999, %ecx             # imm = 0x7CF
	subq	%rax, %rcx
	cmpq	$31, %rcx
	movl	$31, %edx
	cmovleq	%rcx, %rdx
	decq	%rdx
	movq	(%rsp), %rdi            # 8-byte Reload
	movq	%rsi, %rcx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB5_7:                                # %polly.loop_header14.preheader.us.us
                                        #   Parent Loop BB5_1 Depth=1
                                        #     Parent Loop BB5_4 Depth=2
                                        #       Parent Loop BB5_6 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB5_8 Depth 5
                                        #             Child Loop BB5_9 Depth 6
                                        #               Child Loop BB5_10 Depth 7
	movq	%rsi, 64(%rsp)          # 8-byte Spill
	movq	%rdi, 72(%rsp)          # 8-byte Spill
	shlq	$5, %rsi
	movl	$1999, %ebp             # imm = 0x7CF
	subq	%rsi, %rbp
	cmpq	$31, %rbp
	movl	$31, %r14d
	cmovleq	%rbp, %r14
	decq	%r14
	movq	%rdi, %rbp
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB5_8:                                # %polly.loop_header14.us.us
                                        #   Parent Loop BB5_1 Depth=1
                                        #     Parent Loop BB5_4 Depth=2
                                        #       Parent Loop BB5_6 Depth=3
                                        #         Parent Loop BB5_7 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB5_9 Depth 6
                                        #               Child Loop BB5_10 Depth 7
	movq	80(%rsp), %rsi          # 8-byte Reload
	leaq	(%r12,%rsi), %r8
	movq	%rcx, %rsi
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB5_9:                                # %polly.loop_header21.us.us
                                        #   Parent Loop BB5_1 Depth=1
                                        #     Parent Loop BB5_4 Depth=2
                                        #       Parent Loop BB5_6 Depth=3
                                        #         Parent Loop BB5_7 Depth=4
                                        #           Parent Loop BB5_8 Depth=5
                                        # =>          This Loop Header: Depth=6
                                        #               Child Loop BB5_10 Depth 7
	leaq	(%r10,%rax), %rbx
	imulq	$8000, %r8, %rdi        # imm = 0x1F40
	leaq	C(%rdi,%rbx,4), %r11
	movl	C(%rdi,%rbx,4), %r13d
	movq	$-1, %rbx
	movq	%rbp, %r15
	movq	%rsi, %r9
	.p2align	4, 0x90
.LBB5_10:                               # %polly.loop_header28.us.us
                                        #   Parent Loop BB5_1 Depth=1
                                        #     Parent Loop BB5_4 Depth=2
                                        #       Parent Loop BB5_6 Depth=3
                                        #         Parent Loop BB5_7 Depth=4
                                        #           Parent Loop BB5_8 Depth=5
                                        #             Parent Loop BB5_9 Depth=6
                                        # =>            This Inner Loop Header: Depth=7
	movl	(%r9), %edi
	.loc	1 41 45                 # MatrixMult.c:41:45
	imull	(%r15), %edi
	.loc	1 41 35 is_stmt 0       # MatrixMult.c:41:35
	addl	%edi, %r13d
	incq	%rbx
	addq	$8000, %r9              # imm = 0x1F40
	addq	$4, %r15
	cmpq	%r14, %rbx
	jle	.LBB5_10
# BB#11:                                # %polly.loop_exit30.us.us
                                        #   in Loop: Header=BB5_9 Depth=6
	movl	%r13d, (%r11)
	addq	$4, %rsi
	cmpq	%rdx, %r10
	leaq	1(%r10), %r10
	jle	.LBB5_9
# BB#12:                                # %polly.loop_exit23.us.us
                                        #   in Loop: Header=BB5_8 Depth=5
	addq	$8000, %rbp             # imm = 0x1F40
	cmpq	8(%rsp), %r12           # 8-byte Folded Reload
	leaq	1(%r12), %r12
	jle	.LBB5_8
# BB#13:                                # %polly.loop_exit16.loopexit.us.us
                                        #   in Loop: Header=BB5_7 Depth=4
	movq	64(%rsp), %rsi          # 8-byte Reload
	incq	%rsi
	addq	$256000, %rcx           # imm = 0x3E800
	movq	72(%rsp), %rdi          # 8-byte Reload
	subq	$-128, %rdi
	cmpq	$63, %rsi
	jne	.LBB5_7
# BB#14:                                # %polly.loop_exit10.us-lcssa.us.us
                                        #   in Loop: Header=BB5_6 Depth=3
	movq	48(%rsp), %rax          # 8-byte Reload
	incq	%rax
	movq	56(%rsp), %rsi          # 8-byte Reload
	subq	$-128, %rsi
	cmpq	$63, %rax
	jne	.LBB5_6
.LBB5_3:                                # %polly.loop_exit4
                                        #   in Loop: Header=BB5_4 Depth=2
	addq	$256000, (%rsp)         # 8-byte Folded Spill
                                        # imm = 0x3E800
	movq	40(%rsp), %rcx          # 8-byte Reload
	cmpq	32(%rsp), %rcx          # 8-byte Folded Reload
	leaq	1(%rcx), %rcx
	jle	.LBB5_4
.LBB5_1:                                # %polly.par.setup
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_4 Depth 2
                                        #       Child Loop BB5_6 Depth 3
                                        #         Child Loop BB5_7 Depth 4
                                        #           Child Loop BB5_8 Depth 5
                                        #             Child Loop BB5_9 Depth 6
                                        #               Child Loop BB5_10 Depth 7
	leaq	24(%rsp), %rdi
	leaq	16(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB5_2
# BB#15:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end5:
	.size	mat_mult_polly_subfn_2, .Lfunc_end5-mat_mult_polly_subfn_2
	.cfi_endproc

	.type	R,@object               # @R
	.comm	R,16000000,16
	.type	A,@object               # @A
	.comm	A,16000000,16
	.type	B,@object               # @B
	.comm	B,16000000,16
	.type	C,@object               # @C
	.comm	C,16000000,16
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
	.asciz	"R"                     # string offset=264
.Linfo_string9:
	.asciz	"unsigned int"          # string offset=266
.Linfo_string10:
	.asciz	"init"                  # string offset=279
.Linfo_string11:
	.asciz	"mat_mult"              # string offset=284
.Linfo_string12:
	.asciz	"main"                  # string offset=293
.Linfo_string13:
	.asciz	"i"                     # string offset=298
.Linfo_string14:
	.asciz	"j"                     # string offset=300
.Linfo_string15:
	.asciz	"k"                     # string offset=302
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
	.long	290                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x11b DW_TAG_compile_unit
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
	.byte	7                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	A
	.byte	3                       # Abbrev [3] 0x3f:0x14 DW_TAG_array_type
	.long	83                      # DW_AT_type
	.byte	4                       # Abbrev [4] 0x44:0x7 DW_TAG_subrange_type
	.long	90                      # DW_AT_type
	.short	2000                    # DW_AT_count
	.byte	4                       # Abbrev [4] 0x4b:0x7 DW_TAG_subrange_type
	.long	90                      # DW_AT_type
	.short	2000                    # DW_AT_count
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
	.byte	8                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	B
	.byte	2                       # Abbrev [2] 0x76:0x15 DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	C
	.byte	2                       # Abbrev [2] 0x8b:0x15 DW_TAG_variable
	.long	.Linfo_string8          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
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
	.byte	12                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0xbc:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0xc8:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
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
	.byte	35                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0xe9:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0xf5:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x100:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	10                      # Abbrev [10] 0x10c:0x19 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
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
	.long	294                     # Compilation Unit Length
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
	.long	212                     # DIE offset
	.asciz	"mat_mult"              # External Name
	.long	268                     # DIE offset
	.asciz	"main"                  # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	294                     # Compilation Unit Length
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
