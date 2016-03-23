	.text
	.file	"MatrixMult.openmp.enablevc.ll"
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
.Ltmp3:
	#DEBUG_VALUE: i <- 0
	leaq	8(%rsp), %rbx
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
.Ltmp4:
	.loc	1 33 1 prologue_end     # MatrixMult.c:33:1
	addq	$16, %rsp
	popq	%rbx
	retq
.Ltmp5:
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
.Ltmp6:
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
.Ltmp7:
	.cfi_def_cfa_offset 32
.Ltmp8:
	.cfi_offset %rbx, -16
.Ltmp9:
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
	movl	$mat_mult_polly_subfn_4, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$63, %r8d
	movl	$1, %r9d
	movq	%rbx, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	mat_mult_polly_subfn_4
	callq	GOMP_parallel_end
.Ltmp10:
	.loc	1 44 1 prologue_end     # MatrixMult.c:44:1
	addq	$16, %rsp
	popq	%rbx
	retq
.Ltmp11:
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
.Ltmp12:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp13:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp14:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp15:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp16:
	.cfi_def_cfa_offset 48
.Ltmp17:
	.cfi_offset %rbx, -40
.Ltmp18:
	.cfi_offset %r12, -32
.Ltmp19:
	.cfi_offset %r14, -24
.Ltmp20:
	.cfi_offset %r15, -16
	movl	$C, %r14d
.Ltmp21:
	#DEBUG_VALUE: print_array:i <- 0
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB2_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
.Ltmp22:
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
.Ltmp23:
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
.Ltmp24:
	.loc	1 53 17 is_stmt 0       # MatrixMult.c:53:17
	cmpl	$79, %eax
	jne	.LBB2_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB2_2 Depth=2
.Ltmp25:
	.loc	1 53 37 discriminator 1 # MatrixMult.c:53:37
	movq	stdout(%rip), %rsi
	.loc	1 53 29 discriminator 1 # MatrixMult.c:53:29
	movl	$10, %edi
	callq	fputc
.Ltmp26:
.LBB2_4:                                # %for.inc
                                        #   in Loop: Header=BB2_2 Depth=2
	.loc	1 51 9 is_stmt 1 discriminator 1 # MatrixMult.c:51:9
	incq	%rbx
.Ltmp27:
	.loc	1 52 21                 # MatrixMult.c:52:21
	movq	stdout(%rip), %rcx
.Ltmp28:
	.loc	1 51 9 discriminator 1  # MatrixMult.c:51:9
	addq	$8, %r12
	cmpq	$2000, %rbx             # imm = 0x7D0
	jne	.LBB2_2
.Ltmp29:
# BB#5:                                 # %for.end
                                        #   in Loop: Header=BB2_1 Depth=1
	.loc	1 55 9                  # MatrixMult.c:55:9
	movl	$10, %edi
	movq	%rcx, %rsi
	callq	fputc
.Ltmp30:
	.loc	1 50 5 discriminator 1  # MatrixMult.c:50:5
	incq	%r15
	addq	$16000, %r14            # imm = 0x3E80
	cmpq	$2000, %r15             # imm = 0x7D0
	jne	.LBB2_1
.Ltmp31:
# BB#6:                                 # %for.end11
	.loc	1 57 1                  # MatrixMult.c:57:1
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Ltmp32:
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
.Ltmp33:
	.cfi_def_cfa_offset 48
	callq	init
	.loc	1 62 5                  # MatrixMult.c:62:5
	callq	mat_mult
	.loc	1 64 5                  # MatrixMult.c:64:5
	movl	$.L.str.2, %edi
	movl	$2000, %esi             # imm = 0x7D0
	movl	$2000, %edx             # imm = 0x7D0
	xorl	%eax, %eax
	callq	printf
	.loc	1 66 19                 # MatrixMult.c:66:19
	movl	A+15999996(%rip), %ecx
	.loc	1 67 19                 # MatrixMult.c:67:19
	movl	B+15999996(%rip), %eax
	.loc	1 68 19                 # MatrixMult.c:68:19
	movl	$31999992, %edx         # imm = 0x1E847F8
	movq	C(%rdx), %rdx
	.loc	1 65 5                  # MatrixMult.c:65:5
	movq	%rdx, 24(%rsp)
	movl	%eax, (%rsp)
	movl	$1999, 16(%rsp)         # imm = 0x7CF
	movl	$1999, 8(%rsp)          # imm = 0x7CF
	movl	$.L.str.3, %edi
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
.Ltmp34:
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
.Ltmp35:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp36:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp37:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp38:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp39:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp40:
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
.Ltmp41:
	.cfi_def_cfa_offset 80
.Ltmp42:
	.cfi_offset %rbx, -56
.Ltmp43:
	.cfi_offset %r12, -48
.Ltmp44:
	.cfi_offset %r13, -40
.Ltmp45:
	.cfi_offset %r14, -32
.Ltmp46:
	.cfi_offset %r15, -24
.Ltmp47:
	.cfi_offset %rbp, -16
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB4_2
# BB#1:
	movl	$31, %r12d
	movl	$7, %r13d
	leaq	8(%rsp), %r15
	.p2align	4, 0x90
.LBB4_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_6 Depth 2
                                        #       Child Loop BB4_12 Depth 3
                                        #         Child Loop BB4_8 Depth 4
                                        #           Child Loop BB4_9 Depth 5
	movq	8(%rsp), %r8
	movq	16(%rsp), %r10
	addq	$-2, %r8
	imulq	$256000, %r10, %r9      # imm = 0x3E800
	.p2align	4, 0x90
.LBB4_6:                                # %polly.loop_preheader3
                                        #   Parent Loop BB4_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_12 Depth 3
                                        #         Child Loop BB4_8 Depth 4
                                        #           Child Loop BB4_9 Depth 5
	movq	%r10, %rsi
	shlq	$5, %rsi
	movl	$1999, %edi             # imm = 0x7CF
	subq	%rsi, %rdi
	cmpq	$31, %rdi
	cmovgq	%r12, %rdi
	testq	%rdi, %rdi
	js	.LBB4_5
# BB#7:                                 #   in Loop: Header=BB4_6 Depth=2
	decq	%rdi
	movq	%r9, %r11
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB4_12:                               # %polly.loop_header8.preheader.us
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_6 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB4_8 Depth 4
                                        #           Child Loop BB4_9 Depth 5
	leaq	(,%rdx,8), %rax
	movl	$499, %ecx              # imm = 0x1F3
	subq	%rax, %rcx
	cmpq	$7, %rcx
	cmovgq	%r13, %rcx
	decq	%rcx
	movq	%r11, %r14
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB4_8:                                # %polly.loop_header8.us
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_6 Depth=2
                                        #       Parent Loop BB4_12 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB4_9 Depth 5
	leal	(%rax,%rsi), %ebx
	.loc	1 29 31                 # MatrixMult.c:29:31
	movd	%ebx, %xmm0
	pshufd	$0, %xmm0, %xmm0        # xmm0 = xmm0[0,0,0,0]
	movq	$-1, %rbp
	movq	%r14, %rbx
	.p2align	4, 0x90
.LBB4_9:                                # %polly.loop_preheader23.us
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_6 Depth=2
                                        #       Parent Loop BB4_12 Depth=3
                                        #         Parent Loop BB4_8 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movdqa	A(%rbx), %xmm1
	paddd	%xmm0, %xmm1
	movdqa	%xmm1, A(%rbx)
	movdqa	B(%rbx), %xmm1
	.loc	1 30 31                 # MatrixMult.c:30:31
	paddd	%xmm0, %xmm1
	movdqa	%xmm1, B(%rbx)
	incq	%rbp
	addq	$16, %rbx
	cmpq	%rcx, %rbp
	jle	.LBB4_9
# BB#10:                                # %polly.loop_exit17.us
                                        #   in Loop: Header=BB4_8 Depth=4
	addq	$8000, %r14             # imm = 0x1F40
	cmpq	%rdi, %rax
	leaq	1(%rax), %rax
	jle	.LBB4_8
# BB#11:                                # %polly.loop_exit10.loopexit.us
                                        #   in Loop: Header=BB4_12 Depth=3
	incq	%rdx
	subq	$-128, %r11
	cmpq	$63, %rdx
	jne	.LBB4_12
.LBB4_5:                                # %polly.loop_exit4
                                        #   in Loop: Header=BB4_6 Depth=2
	addq	$256000, %r9            # imm = 0x3E800
	cmpq	%r8, %r10
	leaq	1(%r10), %r10
	jle	.LBB4_6
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
.Ltmp48:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp49:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp50:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp51:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp52:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp53:
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
.Ltmp54:
	.cfi_def_cfa_offset 96
.Ltmp55:
	.cfi_offset %rbx, -56
.Ltmp56:
	.cfi_offset %r12, -48
.Ltmp57:
	.cfi_offset %r13, -40
.Ltmp58:
	.cfi_offset %r14, -32
.Ltmp59:
	.cfi_offset %r15, -24
.Ltmp60:
	.cfi_offset %rbp, -16
	jmp	.LBB5_1
	.p2align	4, 0x90
.LBB5_2:                                # %polly.par.loadIVBounds
                                        #   in Loop: Header=BB5_1 Depth=1
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	addq	$-2, %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	imulq	$512000, %rcx, %rax     # imm = 0x7D000
	leaq	C(%rax), %rax
	movq	%rax, (%rsp)            # 8-byte Spill
	.p2align	4, 0x90
.LBB5_4:                                # %polly.loop_preheader3
                                        #   Parent Loop BB5_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_6 Depth 3
                                        #         Child Loop BB5_7 Depth 4
	movq	%rcx, 32(%rsp)          # 8-byte Spill
	movq	%rcx, %rax
	shlq	$5, %rax
	movl	$1999, %r14d            # imm = 0x7CF
	subq	%rax, %r14
	cmpq	$31, %r14
	movl	$31, %eax
	cmovgq	%rax, %r14
	testq	%r14, %r14
	js	.LBB5_3
# BB#5:                                 #   in Loop: Header=BB5_4 Depth=2
	decq	%r14
	movq	(%rsp), %r13            # 8-byte Reload
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB5_6:                                # %polly.loop_header8.preheader.us
                                        #   Parent Loop BB5_1 Depth=1
                                        #     Parent Loop BB5_4 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_7 Depth 4
	leaq	-500(,%r15,8), %r12
	cmpq	$-9, %r12
	movq	$-8, %rax
	cmovleq	%rax, %r12
	shlq	$5, %r12
	negq	%r12
	movq	$-1, %rbp
	movq	%r13, %rbx
	.p2align	4, 0x90
.LBB5_7:                                # %polly.loop_header8.us
                                        #   Parent Loop BB5_1 Depth=1
                                        #     Parent Loop BB5_4 Depth=2
                                        #       Parent Loop BB5_6 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movq	%r12, %rdx
	callq	memset
	incq	%rbp
	addq	$16000, %rbx            # imm = 0x3E80
	cmpq	%r14, %rbp
	jle	.LBB5_7
# BB#8:                                 # %polly.loop_exit10.loopexit.us
                                        #   in Loop: Header=BB5_6 Depth=3
	incq	%r15
	addq	$256, %r13              # imm = 0x100
	cmpq	$63, %r15
	jne	.LBB5_6
.LBB5_3:                                # %polly.loop_exit4
                                        #   in Loop: Header=BB5_4 Depth=2
	addq	$512000, (%rsp)         # 8-byte Folded Spill
                                        # imm = 0x7D000
	movq	32(%rsp), %rcx          # 8-byte Reload
	cmpq	24(%rsp), %rcx          # 8-byte Folded Reload
	leaq	1(%rcx), %rcx
	jle	.LBB5_4
.LBB5_1:                                # %polly.par.setup
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_4 Depth 2
                                        #       Child Loop BB5_6 Depth 3
                                        #         Child Loop BB5_7 Depth 4
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB5_2
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
.Ltmp61:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp62:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp63:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp64:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp65:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp66:
	.cfi_def_cfa_offset 56
	subq	$104, %rsp
.Ltmp67:
	.cfi_def_cfa_offset 160
.Ltmp68:
	.cfi_offset %rbx, -56
.Ltmp69:
	.cfi_offset %r12, -48
.Ltmp70:
	.cfi_offset %r13, -40
.Ltmp71:
	.cfi_offset %r14, -32
.Ltmp72:
	.cfi_offset %r15, -24
.Ltmp73:
	.cfi_offset %rbp, -16
	jmp	.LBB6_1
	.p2align	4, 0x90
.LBB6_2:                                # %polly.par.loadIVBounds
                                        #   in Loop: Header=BB6_1 Depth=1
	movq	32(%rsp), %rax
	movq	40(%rsp), %rcx
	addq	$-2, %rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	imulq	$256000, %rcx, %rax     # imm = 0x3E800
	leaq	A+12(%rax), %rax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	.p2align	4, 0x90
.LBB6_4:                                # %polly.loop_preheader3
                                        #   Parent Loop BB6_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_6 Depth 3
                                        #         Child Loop BB6_7 Depth 4
                                        #           Child Loop BB6_8 Depth 5
                                        #             Child Loop BB6_9 Depth 6
                                        #               Child Loop BB6_10 Depth 7
	movq	%rcx, 56(%rsp)          # 8-byte Spill
	shlq	$5, %rcx
	movq	%rcx, 96(%rsp)          # 8-byte Spill
	movl	$1999, %edx             # imm = 0x7CF
	subq	%rcx, %rdx
	cmpq	$31, %rdx
	movl	$31, %eax
	cmovgq	%rax, %rdx
	movq	%rdx, 16(%rsp)          # 8-byte Spill
	testq	%rdx, %rdx
	js	.LBB6_3
# BB#5:                                 #   in Loop: Header=BB6_4 Depth=2
	decq	16(%rsp)                # 8-byte Folded Spill
	movl	$B, %esi
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB6_6:                                # %polly.loop_preheader9.us
                                        #   Parent Loop BB6_1 Depth=1
                                        #     Parent Loop BB6_4 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB6_7 Depth 4
                                        #           Child Loop BB6_8 Depth 5
                                        #             Child Loop BB6_9 Depth 6
                                        #               Child Loop BB6_10 Depth 7
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	%rsi, 72(%rsp)          # 8-byte Spill
	movq	%rax, %rcx
	shlq	$5, %rcx
	movl	$1999, %edx             # imm = 0x7CF
	subq	%rcx, %rdx
	cmpq	$31, %rdx
	movl	$31, %eax
	cmovleq	%rdx, %rax
	decq	%rax
	movq	8(%rsp), %rdi           # 8-byte Reload
	movq	%rsi, 24(%rsp)          # 8-byte Spill
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB6_7:                                # %polly.loop_header14.preheader.us.us
                                        #   Parent Loop BB6_1 Depth=1
                                        #     Parent Loop BB6_4 Depth=2
                                        #       Parent Loop BB6_6 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB6_8 Depth 5
                                        #             Child Loop BB6_9 Depth 6
                                        #               Child Loop BB6_10 Depth 7
	movq	%rdx, 80(%rsp)          # 8-byte Spill
	movq	%rdi, 88(%rsp)          # 8-byte Spill
	leaq	(,%rdx,8), %rdx
	movl	$499, %r15d             # imm = 0x1F3
	subq	%rdx, %r15
	cmpq	$7, %r15
	movl	$7, %edx
	cmovgq	%rdx, %r15
	decq	%r15
	movq	%rdi, %rdx
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB6_8:                                # %polly.loop_header14.us.us
                                        #   Parent Loop BB6_1 Depth=1
                                        #     Parent Loop BB6_4 Depth=2
                                        #       Parent Loop BB6_6 Depth=3
                                        #         Parent Loop BB6_7 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB6_9 Depth 6
                                        #               Child Loop BB6_10 Depth 7
	movq	96(%rsp), %rsi          # 8-byte Reload
	leaq	(%r8,%rsi), %r9
	movq	24(%rsp), %r14          # 8-byte Reload
	xorl	%r11d, %r11d
	.p2align	4, 0x90
.LBB6_9:                                # %polly.loop_header21.us.us
                                        #   Parent Loop BB6_1 Depth=1
                                        #     Parent Loop BB6_4 Depth=2
                                        #       Parent Loop BB6_6 Depth=3
                                        #         Parent Loop BB6_7 Depth=4
                                        #           Parent Loop BB6_8 Depth=5
                                        # =>          This Loop Header: Depth=6
                                        #               Child Loop BB6_10 Depth 7
	leaq	(%r11,%rcx), %rsi
	imulq	$16000, %r9, %rbx       # imm = 0x3E80
	leaq	C(%rbx,%rsi,8), %r13
	movq	C(%rbx,%rsi,8), %rsi
	movq	$-1, %rbx
	movq	%rdx, %r12
	movq	%r14, %r10
	.p2align	4, 0x90
.LBB6_10:                               # %polly.loop_preheader36.us.us
                                        #   Parent Loop BB6_1 Depth=1
                                        #     Parent Loop BB6_4 Depth=2
                                        #       Parent Loop BB6_6 Depth=3
                                        #         Parent Loop BB6_7 Depth=4
                                        #           Parent Loop BB6_8 Depth=5
                                        #             Parent Loop BB6_9 Depth=6
                                        # =>            This Inner Loop Header: Depth=7
	.loc	1 41 37                 # MatrixMult.c:41:37
	movslq	(%r10), %rdi
	movslq	-12(%r12), %rbp
	.loc	1 41 45 is_stmt 0       # MatrixMult.c:41:45
	imulq	%rdi, %rbp
	.loc	1 41 35                 # MatrixMult.c:41:35
	addq	%rsi, %rbp
	.loc	1 41 37                 # MatrixMult.c:41:37
	movslq	8000(%r10), %rsi
	movslq	-8(%r12), %rdi
	.loc	1 41 45                 # MatrixMult.c:41:45
	imulq	%rsi, %rdi
	.loc	1 41 35                 # MatrixMult.c:41:35
	addq	%rbp, %rdi
	.loc	1 41 37                 # MatrixMult.c:41:37
	movslq	16000(%r10), %rsi
	movslq	-4(%r12), %rbp
	.loc	1 41 45                 # MatrixMult.c:41:45
	imulq	%rsi, %rbp
	.loc	1 41 35                 # MatrixMult.c:41:35
	addq	%rdi, %rbp
	.loc	1 41 37                 # MatrixMult.c:41:37
	movslq	24000(%r10), %rdi
	movslq	(%r12), %rsi
	.loc	1 41 45                 # MatrixMult.c:41:45
	imulq	%rdi, %rsi
	.loc	1 41 35                 # MatrixMult.c:41:35
	addq	%rbp, %rsi
	incq	%rbx
	addq	$32000, %r10            # imm = 0x7D00
	addq	$16, %r12
	cmpq	%r15, %rbx
	jle	.LBB6_10
# BB#11:                                # %polly.loop_exit30.us.us
                                        #   in Loop: Header=BB6_9 Depth=6
	movq	%rsi, (%r13)
	addq	$4, %r14
	cmpq	%rax, %r11
	leaq	1(%r11), %r11
	jle	.LBB6_9
# BB#12:                                # %polly.loop_exit23.us.us
                                        #   in Loop: Header=BB6_8 Depth=5
	addq	$8000, %rdx             # imm = 0x1F40
	cmpq	16(%rsp), %r8           # 8-byte Folded Reload
	leaq	1(%r8), %r8
	jle	.LBB6_8
# BB#13:                                # %polly.loop_exit16.loopexit.us.us
                                        #   in Loop: Header=BB6_7 Depth=4
	movq	80(%rsp), %rdx          # 8-byte Reload
	incq	%rdx
	addq	$256000, 24(%rsp)       # 8-byte Folded Spill
                                        # imm = 0x3E800
	movq	88(%rsp), %rdi          # 8-byte Reload
	subq	$-128, %rdi
	cmpq	$63, %rdx
	jne	.LBB6_7
# BB#14:                                # %polly.loop_exit10.us-lcssa.us.us
                                        #   in Loop: Header=BB6_6 Depth=3
	movq	64(%rsp), %rax          # 8-byte Reload
	incq	%rax
	movq	72(%rsp), %rsi          # 8-byte Reload
	subq	$-128, %rsi
	cmpq	$63, %rax
	jne	.LBB6_6
.LBB6_3:                                # %polly.loop_exit4
                                        #   in Loop: Header=BB6_4 Depth=2
	addq	$256000, 8(%rsp)        # 8-byte Folded Spill
                                        # imm = 0x3E800
	movq	56(%rsp), %rcx          # 8-byte Reload
	cmpq	48(%rsp), %rcx          # 8-byte Folded Reload
	leaq	1(%rcx), %rcx
	jle	.LBB6_4
.LBB6_1:                                # %polly.par.setup
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_4 Depth 2
                                        #       Child Loop BB6_6 Depth 3
                                        #         Child Loop BB6_7 Depth 4
                                        #           Child Loop BB6_8 Depth 5
                                        #             Child Loop BB6_9 Depth 6
                                        #               Child Loop BB6_10 Depth 7
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
	.comm	A,16000000,16
	.type	B,@object               # @B
	.comm	B,16000000,16
	.type	C,@object               # @C
	.comm	C,32000000,16
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
	.long	310                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x12f DW_TAG_compile_unit
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
	.long	139                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	C
	.byte	3                       # Abbrev [3] 0x8b:0x14 DW_TAG_array_type
	.long	159                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x90:0x7 DW_TAG_subrange_type
	.long	90                      # DW_AT_type
	.short	2000                    # DW_AT_count
	.byte	4                       # Abbrev [4] 0x97:0x7 DW_TAG_subrange_type
	.long	90                      # DW_AT_type
	.short	2000                    # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x9f:0x7 DW_TAG_base_type
	.long	.Linfo_string8          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # Abbrev [7] 0xa6:0x15 DW_TAG_subprogram
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
	.byte	8                       # Abbrev [8] 0xbb:0x38 DW_TAG_subprogram
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
	.byte	9                       # Abbrev [9] 0xd0:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	10                      # Abbrev [10] 0xdc:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	10                      # Abbrev [10] 0xe7:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	8                       # Abbrev [8] 0xf3:0x2d DW_TAG_subprogram
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
	.byte	9                       # Abbrev [9] 0x108:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	48                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	10                      # Abbrev [10] 0x114:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	48                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	11                      # Abbrev [11] 0x120:0x19 DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
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
	.long	314                     # Compilation Unit Length
	.long	42                      # DIE offset
	.asciz	"A"                     # External Name
	.long	97                      # DIE offset
	.asciz	"B"                     # External Name
	.long	118                     # DIE offset
	.asciz	"C"                     # External Name
	.long	166                     # DIE offset
	.asciz	"init"                  # External Name
	.long	288                     # DIE offset
	.asciz	"main"                  # External Name
	.long	187                     # DIE offset
	.asciz	"mat_mult"              # External Name
	.long	243                     # DIE offset
	.asciz	"print_array"           # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	314                     # Compilation Unit Length
	.long	83                      # DIE offset
	.asciz	"int"                   # External Name
	.long	159                     # DIE offset
	.asciz	"long long int"         # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
