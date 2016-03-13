	.text
	.file	"MatrixAdd.openmp.ll"
	.file	1 "MatrixAdd.c"
	.globl	getRand
	.p2align	4, 0x90
	.type	getRand,@function
getRand:                                # @getRand
.Lfunc_begin0:
	.loc	1 8 0                   # MatrixAdd.c:8:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 9 12 prologue_end     # MatrixAdd.c:9:12
	pushq	%rax
.Ltmp0:
	.cfi_def_cfa_offset 16
	callq	rand
	.loc	1 9 19 is_stmt 0        # MatrixAdd.c:9:19
	cltq
	imulq	$1374389535, %rax, %rcx # imm = 0x51EB851F
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	imull	$100, %ecx, %ecx
	subl	%ecx, %eax
	.loc	1 9 5                   # MatrixAdd.c:9:5
	popq	%rcx
	retq
.Ltmp1:
.Lfunc_end0:
	.size	getRand, .Lfunc_end0-getRand
	.cfi_endproc

	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
.Lfunc_begin1:
	.loc	1 13 0 is_stmt 1        # MatrixAdd.c:13:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp2:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp3:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp4:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp5:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp6:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp7:
	.cfi_def_cfa_offset 56
	subq	$419430472, %rsp        # imm = 0x19000048
.Ltmp8:
	.cfi_def_cfa_offset 419430528
.Ltmp9:
	.cfi_offset %rbx, -56
.Ltmp10:
	.cfi_offset %r12, -48
.Ltmp11:
	.cfi_offset %r13, -40
.Ltmp12:
	.cfi_offset %r14, -32
.Ltmp13:
	.cfi_offset %r15, -24
.Ltmp14:
	.cfi_offset %rbp, -16
	leaq	56(%rsp), %rdi
.Ltmp15:
	#DEBUG_VALUE: init:t <- [%RDI+0]
	.loc	1 20 22 prologue_end    # MatrixAdd.c:20:22
	callq	time
	.loc	1 20 5 is_stmt 0 discriminator 1 # MatrixAdd.c:20:5
	movl	%eax, %edi
.Ltmp16:
	callq	srand
	leaq	64(%rsp), %r14
.Ltmp17:
	#DEBUG_VALUE: init:R <- [%R14+0]
	xorl	%r15d, %r15d
.Ltmp18:
	#DEBUG_VALUE: init:i <- 0
	.p2align	4, 0x90
.LBB1_1:                                # %for.cond2.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
	movq	%r14, %rbx
	movl	$10240, %r12d           # imm = 0x2800
	.p2align	4, 0x90
.LBB1_2:                                # %for.body5
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp19:
	.loc	1 23 23 is_stmt 1       # MatrixAdd.c:23:23
	callq	rand
	.loc	1 23 30 is_stmt 0       # MatrixAdd.c:23:30
	cltq
	imulq	$1374389535, %rax, %rcx # imm = 0x51EB851F
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	imull	$100, %ecx, %ecx
	subl	%ecx, %eax
	.loc	1 23 21                 # MatrixAdd.c:23:21
	movl	%eax, (%rbx)
.Ltmp20:
	.loc	1 22 9 is_stmt 1 discriminator 1 # MatrixAdd.c:22:9
	addq	$4, %rbx
	decq	%r12
	jne	.LBB1_2
.Ltmp21:
# BB#3:                                 # %for.inc9
                                        #   in Loop: Header=BB1_1 Depth=1
	.loc	1 21 5 discriminator 1  # MatrixAdd.c:21:5
	incq	%r15
	addq	$40960, %r14            # imm = 0xA000
	cmpq	$10240, %r15            # imm = 0x2800
	jne	.LBB1_1
.Ltmp22:
# BB#4:                                 # %polly.parallel.for
	leaq	64(%rsp), %rax
	movq	%rax, 16(%rsp)
	leaq	16(%rsp), %rsi
	movl	$init_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$320, %r8d              # imm = 0x140
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	movq	16(%rsp), %rax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	leaq	32(%rsp), %rdi
	leaq	24(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB1_15
# BB#5:                                 # %polly.par.loadIVBounds.i.preheader
	addq	$4, 8(%rsp)             # 8-byte Folded Spill
	.p2align	4, 0x90
.LBB1_7:                                # %polly.par.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_10 Depth 2
                                        #       Child Loop BB1_11 Depth 3
                                        #         Child Loop BB1_14 Depth 4
                                        #           Child Loop BB1_12 Depth 5
	movq	24(%rsp), %rax
	movq	32(%rsp), %rcx
	addq	$-2, %rax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movq	%rcx, %rax
	shlq	$18, %rax
	leaq	(%rax,%rax,4), %r10
	movq	8(%rsp), %rax           # 8-byte Reload
	leaq	(%rax,%r10), %r11
	.p2align	4, 0x90
.LBB1_10:                               # %polly.loop_preheader3.i
                                        #   Parent Loop BB1_7 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_11 Depth 3
                                        #         Child Loop BB1_14 Depth 4
                                        #           Child Loop BB1_12 Depth 5
	movq	%rcx, 48(%rsp)          # 8-byte Spill
	movq	%r11, %r13
	movq	%r10, %r8
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB1_11:                               # %polly.loop_preheader9.i
                                        #   Parent Loop BB1_7 Depth=1
                                        #     Parent Loop BB1_10 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_14 Depth 4
                                        #           Child Loop BB1_12 Depth 5
	movq	%r13, %rdi
	movq	%r8, %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB1_14:                               # %polly.loop_preheader15.i
                                        #   Parent Loop BB1_7 Depth=1
                                        #     Parent Loop BB1_10 Depth=2
                                        #       Parent Loop BB1_11 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB1_12 Depth 5
	movq	%rdi, %rcx
	movq	%rdx, %rbp
	movl	$32, %r14d
	.p2align	4, 0x90
.LBB1_12:                               # %polly.loop_header14.i
                                        #   Parent Loop BB1_7 Depth=1
                                        #     Parent Loop BB1_10 Depth=2
                                        #       Parent Loop BB1_11 Depth=3
                                        #         Parent Loop BB1_14 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movl	-4(%rcx), %r15d
	movl	%r15d, A(%rbp)
.Ltmp23:
	.loc	1 30 27                 # MatrixAdd.c:30:27
	movl	$100, %r12d
	subl	%r15d, %r12d
	movl	%r12d, B(%rbp)
	movl	(%rcx), %ebx
	movl	%ebx, A+4(%rbp)
	movl	$100, %eax
	subl	%ebx, %eax
	movl	%eax, B+4(%rbp)
	addq	$8, %rbp
	addq	$8, %rcx
	addq	$-2, %r14
	jne	.LBB1_12
.Ltmp24:
# BB#13:                                # %polly.loop_exit16.i
                                        #   in Loop: Header=BB1_14 Depth=4
	incq	%rsi
	addq	$40960, %rdx            # imm = 0xA000
	addq	$40960, %rdi            # imm = 0xA000
	cmpq	$32, %rsi
	jne	.LBB1_14
# BB#8:                                 # %polly.loop_exit10.i
                                        #   in Loop: Header=BB1_11 Depth=3
	incq	%r9
	subq	$-128, %r8
	subq	$-128, %r13
	cmpq	$320, %r9               # imm = 0x140
	jne	.LBB1_11
# BB#9:                                 # %polly.loop_exit4.i
                                        #   in Loop: Header=BB1_10 Depth=2
	addq	$1310720, %r10          # imm = 0x140000
	addq	$1310720, %r11          # imm = 0x140000
	movq	48(%rsp), %rcx          # 8-byte Reload
	cmpq	40(%rsp), %rcx          # 8-byte Folded Reload
	leaq	1(%rcx), %rcx
	jle	.LBB1_10
# BB#6:                                 # %polly.par.checkNext.loopexit.i
                                        #   in Loop: Header=BB1_7 Depth=1
	leaq	32(%rsp), %rdi
	leaq	24(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB1_7
.LBB1_15:                               # %init_polly_subfn.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	.loc	1 33 1                  # MatrixAdd.c:33:1
	addq	$419430472, %rsp        # imm = 0x19000048
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp25:
.Lfunc_end1:
	.size	init, .Lfunc_end1-init
	.cfi_endproc

	.globl	mat_add
	.p2align	4, 0x90
	.type	mat_add,@function
mat_add:                                # @mat_add
.Lfunc_begin2:
	.loc	1 35 0                  # MatrixAdd.c:35:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp26:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp27:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp28:
	.cfi_def_cfa_offset 32
	subq	$32, %rsp
.Ltmp29:
	.cfi_def_cfa_offset 64
.Ltmp30:
	.cfi_offset %rbx, -32
.Ltmp31:
	.cfi_offset %r14, -24
.Ltmp32:
	.cfi_offset %r15, -16
.Ltmp33:
	#DEBUG_VALUE: mat_add:i <- 0
	leaq	8(%rsp), %rsi
	movl	$mat_add_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$320, %r8d              # imm = 0x140
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	leaq	24(%rsp), %rdi
	leaq	16(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB2_11
# BB#1:
	leaq	24(%rsp), %r14
	leaq	16(%rsp), %r15
	.p2align	4, 0x90
.LBB2_3:                                # %polly.par.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_6 Depth 2
                                        #       Child Loop BB2_7 Depth 3
                                        #         Child Loop BB2_10 Depth 4
                                        #           Child Loop BB2_8 Depth 5
	movq	16(%rsp), %r8
	movq	24(%rsp), %r9
	addq	$-2, %r8
	movq	%r9, %rax
	shlq	$18, %rax
	leaq	(%rax,%rax,4), %r10
	.p2align	4, 0x90
.LBB2_6:                                # %polly.loop_preheader3.i
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_7 Depth 3
                                        #         Child Loop BB2_10 Depth 4
                                        #           Child Loop BB2_8 Depth 5
	movq	%r10, %r11
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB2_7:                                # %polly.loop_preheader9.i
                                        #   Parent Loop BB2_3 Depth=1
                                        #     Parent Loop BB2_6 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB2_10 Depth 4
                                        #           Child Loop BB2_8 Depth 5
	movq	%r11, %rcx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB2_10:                               # %polly.loop_preheader15.i
                                        #   Parent Loop BB2_3 Depth=1
                                        #     Parent Loop BB2_6 Depth=2
                                        #       Parent Loop BB2_7 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB2_8 Depth 5
	movq	%rcx, %rbx
	movl	$32, %edx
	.p2align	4, 0x90
.LBB2_8:                                # %polly.loop_header14.i
                                        #   Parent Loop BB2_3 Depth=1
                                        #     Parent Loop BB2_6 Depth=2
                                        #       Parent Loop BB2_7 Depth=3
                                        #         Parent Loop BB2_10 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movl	B(%rbx), %esi
.Ltmp34:
	.loc	1 39 31 prologue_end    # MatrixAdd.c:39:31
	addl	A(%rbx), %esi
	movl	%esi, C(%rbx)
	movl	B+4(%rbx), %esi
	addl	A+4(%rbx), %esi
	movl	%esi, C+4(%rbx)
	addq	$8, %rbx
	addq	$-2, %rdx
	jne	.LBB2_8
.Ltmp35:
# BB#9:                                 # %polly.loop_exit16.i
                                        #   in Loop: Header=BB2_10 Depth=4
	incq	%rax
	addq	$40960, %rcx            # imm = 0xA000
	cmpq	$32, %rax
	jne	.LBB2_10
# BB#4:                                 # %polly.loop_exit10.i
                                        #   in Loop: Header=BB2_7 Depth=3
	incq	%rdi
	subq	$-128, %r11
	cmpq	$320, %rdi              # imm = 0x140
	jne	.LBB2_7
# BB#5:                                 # %polly.loop_exit4.i
                                        #   in Loop: Header=BB2_6 Depth=2
	addq	$1310720, %r10          # imm = 0x140000
	cmpq	%r8, %r9
	leaq	1(%r9), %r9
	jle	.LBB2_6
# BB#2:                                 # %polly.par.checkNext.loopexit.i
                                        #   in Loop: Header=BB2_3 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB2_3
.LBB2_11:                               # %mat_add_polly_subfn.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	.loc	1 42 1                  # MatrixAdd.c:42:1
	addq	$32, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Ltmp36:
.Lfunc_end2:
	.size	mat_add, .Lfunc_end2-mat_add
	.cfi_endproc

	.globl	print_array
	.p2align	4, 0x90
	.type	print_array,@function
print_array:                            # @print_array
.Lfunc_begin3:
	.loc	1 45 0                  # MatrixAdd.c:45:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp37:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp38:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp39:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp40:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp41:
	.cfi_def_cfa_offset 48
.Ltmp42:
	.cfi_offset %rbx, -40
.Ltmp43:
	.cfi_offset %r12, -32
.Ltmp44:
	.cfi_offset %r14, -24
.Ltmp45:
	.cfi_offset %r15, -16
	movl	$C, %r14d
.Ltmp46:
	#DEBUG_VALUE: print_array:i <- 0
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB3_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_2 Depth 2
	movq	%r14, %r12
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB3_2:                                # %for.body3
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp47:
	.loc	1 50 27 prologue_end    # MatrixAdd.c:50:27
	movl	(%r12), %esi
	.loc	1 50 13 is_stmt 0       # MatrixAdd.c:50:13
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp48:
	.loc	1 51 18 is_stmt 1       # MatrixAdd.c:51:18
	movslq	%ebx, %rax
	imulq	$1717986919, %rax, %rcx # imm = 0x66666667
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	shll	$4, %ecx
	leal	(%rcx,%rcx,4), %ecx
	subl	%ecx, %eax
.Ltmp49:
	.loc	1 51 17 is_stmt 0       # MatrixAdd.c:51:17
	cmpl	$79, %eax
	jne	.LBB3_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB3_2 Depth=2
.Ltmp50:
	.loc	1 51 29 discriminator 1 # MatrixAdd.c:51:29
	movl	$10, %edi
	callq	putchar
.Ltmp51:
.LBB3_4:                                # %for.inc
                                        #   in Loop: Header=BB3_2 Depth=2
	.loc	1 49 9 is_stmt 1 discriminator 1 # MatrixAdd.c:49:9
	incq	%rbx
	addq	$4, %r12
	cmpq	$10240, %rbx            # imm = 0x2800
	jne	.LBB3_2
.Ltmp52:
# BB#5:                                 # %for.end
                                        #   in Loop: Header=BB3_1 Depth=1
	.loc	1 53 9                  # MatrixAdd.c:53:9
	movl	$10, %edi
	callq	putchar
.Ltmp53:
	.loc	1 48 5 discriminator 1  # MatrixAdd.c:48:5
	incq	%r15
	addq	$40960, %r14            # imm = 0xA000
	cmpq	$10240, %r15            # imm = 0x2800
	jne	.LBB3_1
.Ltmp54:
# BB#6:                                 # %for.end11
	.loc	1 55 1                  # MatrixAdd.c:55:1
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Ltmp55:
.Lfunc_end3:
	.size	print_array, .Lfunc_end3-print_array
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin4:
	.loc	1 58 0                  # MatrixAdd.c:58:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 61 5 prologue_end     # MatrixAdd.c:61:5
	subq	$40, %rsp
.Ltmp56:
	.cfi_def_cfa_offset 48
	callq	init
	.loc	1 62 5                  # MatrixAdd.c:62:5
	callq	mat_add
	.loc	1 64 5                  # MatrixAdd.c:64:5
	movl	$.L.str.2, %edi
	movl	$10240, %esi            # imm = 0x2800
	movl	$10240, %edx            # imm = 0x2800
	xorl	%eax, %eax
	callq	printf
	movl	$419430396, %eax        # imm = 0x18FFFFFC
	.loc	1 66 19                 # MatrixAdd.c:66:19
	movl	A(%rax), %ecx
	.loc	1 67 19                 # MatrixAdd.c:67:19
	movl	B(%rax), %edx
	.loc	1 68 19                 # MatrixAdd.c:68:19
	movl	C(%rax), %eax
	.loc	1 65 5                  # MatrixAdd.c:65:5
	movl	%eax, 24(%rsp)
	movl	%edx, (%rsp)
	movl	$10239, 16(%rsp)        # imm = 0x27FF
	movl	$10239, 8(%rsp)         # imm = 0x27FF
	movl	$.L.str.3, %edi
	movl	$10239, %esi            # imm = 0x27FF
	movl	$10239, %edx            # imm = 0x27FF
	movl	$10239, %r8d            # imm = 0x27FF
	movl	$10239, %r9d            # imm = 0x27FF
	xorl	%eax, %eax
	callq	printf
	.loc	1 69 5                  # MatrixAdd.c:69:5
	xorl	%eax, %eax
	addq	$40, %rsp
	retq
.Ltmp57:
.Lfunc_end4:
	.size	main, .Lfunc_end4-main
	.cfi_endproc

	.p2align	4, 0x90
	.type	init_polly_subfn,@function
init_polly_subfn:                       # @init_polly_subfn
.Lfunc_begin5:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Ltmp58:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp59:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp60:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp61:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp62:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp63:
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
.Ltmp64:
	.cfi_def_cfa_offset 96
.Ltmp65:
	.cfi_offset %rbx, -56
.Ltmp66:
	.cfi_offset %r12, -48
.Ltmp67:
	.cfi_offset %r13, -40
.Ltmp68:
	.cfi_offset %r14, -32
.Ltmp69:
	.cfi_offset %r15, -24
.Ltmp70:
	.cfi_offset %rbp, -16
	movq	(%rdi), %rax
	movq	%rax, (%rsp)            # 8-byte Spill
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB5_2
# BB#1:                                 # %polly.par.loadIVBounds.preheader
	addq	$4, (%rsp)              # 8-byte Folded Spill
	.p2align	4, 0x90
.LBB5_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_7 Depth 2
                                        #       Child Loop BB5_8 Depth 3
                                        #         Child Loop BB5_11 Depth 4
                                        #           Child Loop BB5_9 Depth 5
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	addq	$-2, %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	%rcx, %rax
	shlq	$18, %rax
	leaq	(%rax,%rax,4), %r10
	movq	(%rsp), %rax            # 8-byte Reload
	leaq	(%rax,%r10), %r11
	.p2align	4, 0x90
.LBB5_7:                                # %polly.loop_preheader3
                                        #   Parent Loop BB5_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_8 Depth 3
                                        #         Child Loop BB5_11 Depth 4
                                        #           Child Loop BB5_9 Depth 5
	movq	%rcx, 32(%rsp)          # 8-byte Spill
	movq	%r11, %r13
	movq	%r10, %r8
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB5_8:                                # %polly.loop_preheader9
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_7 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_11 Depth 4
                                        #           Child Loop BB5_9 Depth 5
	movq	%r13, %rdi
	movq	%r8, %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB5_11:                               # %polly.loop_preheader15
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_7 Depth=2
                                        #       Parent Loop BB5_8 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB5_9 Depth 5
	movq	%rdi, %rcx
	movq	%rdx, %rbp
	movl	$32, %r14d
	.p2align	4, 0x90
.LBB5_9:                                # %polly.loop_header14
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_7 Depth=2
                                        #       Parent Loop BB5_8 Depth=3
                                        #         Parent Loop BB5_11 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movl	-4(%rcx), %r15d
	movl	%r15d, A(%rbp)
	.loc	1 30 27                 # MatrixAdd.c:30:27
	movl	$100, %r12d
	subl	%r15d, %r12d
	movl	%r12d, B(%rbp)
	movl	(%rcx), %ebx
	movl	%ebx, A+4(%rbp)
	movl	$100, %eax
	subl	%ebx, %eax
	movl	%eax, B+4(%rbp)
	addq	$8, %rbp
	addq	$8, %rcx
	addq	$-2, %r14
	jne	.LBB5_9
# BB#10:                                # %polly.loop_exit16
                                        #   in Loop: Header=BB5_11 Depth=4
	incq	%rsi
	addq	$40960, %rdx            # imm = 0xA000
	addq	$40960, %rdi            # imm = 0xA000
	cmpq	$32, %rsi
	jne	.LBB5_11
# BB#5:                                 # %polly.loop_exit10
                                        #   in Loop: Header=BB5_8 Depth=3
	incq	%r9
	subq	$-128, %r8
	subq	$-128, %r13
	cmpq	$320, %r9               # imm = 0x140
	jne	.LBB5_8
# BB#6:                                 # %polly.loop_exit4
                                        #   in Loop: Header=BB5_7 Depth=2
	addq	$1310720, %r10          # imm = 0x140000
	addq	$1310720, %r11          # imm = 0x140000
	movq	32(%rsp), %rcx          # 8-byte Reload
	cmpq	24(%rsp), %rcx          # 8-byte Folded Reload
	leaq	1(%rcx), %rcx
	jle	.LBB5_7
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB5_4 Depth=1
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB5_4
.LBB5_2:                                # %polly.par.exit
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
	.size	init_polly_subfn, .Lfunc_end5-init_polly_subfn
	.cfi_endproc

	.p2align	4, 0x90
	.type	mat_add_polly_subfn,@function
mat_add_polly_subfn:                    # @mat_add_polly_subfn
.Lfunc_begin6:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp71:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp72:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp73:
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
.Ltmp74:
	.cfi_def_cfa_offset 48
.Ltmp75:
	.cfi_offset %rbx, -32
.Ltmp76:
	.cfi_offset %r14, -24
.Ltmp77:
	.cfi_offset %r15, -16
	leaq	8(%rsp), %rdi
	leaq	(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB6_2
# BB#1:
	leaq	8(%rsp), %r14
	leaq	(%rsp), %r15
	.p2align	4, 0x90
.LBB6_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_7 Depth 2
                                        #       Child Loop BB6_8 Depth 3
                                        #         Child Loop BB6_11 Depth 4
                                        #           Child Loop BB6_9 Depth 5
	movq	(%rsp), %r8
	movq	8(%rsp), %r9
	addq	$-2, %r8
	movq	%r9, %rax
	shlq	$18, %rax
	leaq	(%rax,%rax,4), %r10
	.p2align	4, 0x90
.LBB6_7:                                # %polly.loop_preheader3
                                        #   Parent Loop BB6_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_8 Depth 3
                                        #         Child Loop BB6_11 Depth 4
                                        #           Child Loop BB6_9 Depth 5
	movq	%r10, %r11
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB6_8:                                # %polly.loop_preheader9
                                        #   Parent Loop BB6_4 Depth=1
                                        #     Parent Loop BB6_7 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB6_11 Depth 4
                                        #           Child Loop BB6_9 Depth 5
	movq	%r11, %rcx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB6_11:                               # %polly.loop_preheader15
                                        #   Parent Loop BB6_4 Depth=1
                                        #     Parent Loop BB6_7 Depth=2
                                        #       Parent Loop BB6_8 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB6_9 Depth 5
	movq	%rcx, %rbx
	movl	$32, %edx
	.p2align	4, 0x90
.LBB6_9:                                # %polly.loop_header14
                                        #   Parent Loop BB6_4 Depth=1
                                        #     Parent Loop BB6_7 Depth=2
                                        #       Parent Loop BB6_8 Depth=3
                                        #         Parent Loop BB6_11 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movl	B(%rbx), %esi
	.loc	1 39 31                 # MatrixAdd.c:39:31
	addl	A(%rbx), %esi
	movl	%esi, C(%rbx)
	movl	B+4(%rbx), %esi
	addl	A+4(%rbx), %esi
	movl	%esi, C+4(%rbx)
	addq	$8, %rbx
	addq	$-2, %rdx
	jne	.LBB6_9
# BB#10:                                # %polly.loop_exit16
                                        #   in Loop: Header=BB6_11 Depth=4
	incq	%rax
	addq	$40960, %rcx            # imm = 0xA000
	cmpq	$32, %rax
	jne	.LBB6_11
# BB#5:                                 # %polly.loop_exit10
                                        #   in Loop: Header=BB6_8 Depth=3
	incq	%rdi
	subq	$-128, %r11
	cmpq	$320, %rdi              # imm = 0x140
	jne	.LBB6_8
# BB#6:                                 # %polly.loop_exit4
                                        #   in Loop: Header=BB6_7 Depth=2
	addq	$1310720, %r10          # imm = 0x140000
	cmpq	%r8, %r9
	leaq	1(%r9), %r9
	jle	.LBB6_7
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB6_4 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB6_4
.LBB6_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Lfunc_end6:
	.size	mat_add_polly_subfn, .Lfunc_end6-mat_add_polly_subfn
	.cfi_endproc

	.type	A,@object               # @A
	.comm	A,419430400,16
	.type	B,@object               # @B
	.comm	B,419430400,16
	.type	C,@object               # @C
	.comm	C,419430400,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d "
	.size	.L.str, 4

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"Pass %d X %d matrix test case \n"
	.size	.L.str.2, 32

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"A[%d][%d] = %d, B[%d][%d] =%d, C[%d][%d] =%d \n"
	.size	.L.str.3, 47

	.file	2 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file	3 "/usr/include/time.h"
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
	.asciz	"unsigned int"          # string offset=262
.Linfo_string9:
	.asciz	"getRand"               # string offset=275
.Linfo_string10:
	.asciz	"init"                  # string offset=283
.Linfo_string11:
	.asciz	"mat_add"               # string offset=288
.Linfo_string12:
	.asciz	"print_array"           # string offset=296
.Linfo_string13:
	.asciz	"main"                  # string offset=308
.Linfo_string14:
	.asciz	"R"                     # string offset=313
.Linfo_string15:
	.asciz	"t"                     # string offset=315
.Linfo_string16:
	.asciz	"long int"              # string offset=317
.Linfo_string17:
	.asciz	"__time_t"              # string offset=326
.Linfo_string18:
	.asciz	"time_t"                # string offset=335
.Linfo_string19:
	.asciz	"i"                     # string offset=342
.Linfo_string20:
	.asciz	"j"                     # string offset=344
.Linfo_string21:
	.asciz	"k"                     # string offset=346
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp16-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	117                     # DW_OP_breg5
	.byte	0                       # 0
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
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
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
	.byte	10                      # Abbreviation Code
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
	.byte	11                      # Abbreviation Code
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
	.byte	12                      # Abbreviation Code
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
	.byte	13                      # Abbreviation Code
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
	.byte	14                      # Abbreviation Code
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
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	432                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x1a9 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin0 # DW_AT_high_pc
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
	.short	10240                   # DW_AT_count
	.byte	4                       # Abbrev [4] 0x4b:0x7 DW_TAG_subrange_type
	.long	90                      # DW_AT_type
	.short	10240                   # DW_AT_count
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
	.byte	5                       # Abbrev [5] 0x8b:0x7 DW_TAG_base_type
	.long	.Linfo_string8          # DW_AT_name
	.byte	7                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	7                       # Abbrev [7] 0x92:0x19 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	83                      # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0xab:0x4b DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	9                       # Abbrev [9] 0xc0:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.asciz	"\300"
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
	.long	63                      # DW_AT_type
	.byte	10                      # Abbrev [10] 0xcf:0xf DW_TAG_variable
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	17                      # DW_AT_decl_line
	.long	406                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0xde:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0xea:0xb DW_TAG_variable
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	8                       # Abbrev [8] 0xf6:0x38 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	11                      # Abbrev [11] 0x10b:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x117:0xb DW_TAG_variable
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x122:0xb DW_TAG_variable
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	8                       # Abbrev [8] 0x12e:0x2d DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	11                      # Abbrev [11] 0x143:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	46                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x14f:0xb DW_TAG_variable
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	46                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	13                      # Abbrev [13] 0x15b:0x3b DW_TAG_subprogram
	.quad	.Lfunc_begin4           # DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin4 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	57                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	12                      # Abbrev [12] 0x174:0xb DW_TAG_variable
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x17f:0xb DW_TAG_variable
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x18a:0xb DW_TAG_variable
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	14                      # Abbrev [14] 0x196:0xb DW_TAG_typedef
	.long	417                     # DW_AT_type
	.long	.Linfo_string18         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	75                      # DW_AT_decl_line
	.byte	14                      # Abbrev [14] 0x1a1:0xb DW_TAG_typedef
	.long	428                     # DW_AT_type
	.long	.Linfo_string17         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	139                     # DW_AT_decl_line
	.byte	5                       # Abbrev [5] 0x1ac:0x7 DW_TAG_base_type
	.long	.Linfo_string16         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
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
	.long	436                     # Compilation Unit Length
	.long	42                      # DIE offset
	.asciz	"A"                     # External Name
	.long	97                      # DIE offset
	.asciz	"B"                     # External Name
	.long	118                     # DIE offset
	.asciz	"C"                     # External Name
	.long	171                     # DIE offset
	.asciz	"init"                  # External Name
	.long	146                     # DIE offset
	.asciz	"getRand"               # External Name
	.long	347                     # DIE offset
	.asciz	"main"                  # External Name
	.long	246                     # DIE offset
	.asciz	"mat_add"               # External Name
	.long	302                     # DIE offset
	.asciz	"print_array"           # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	436                     # Compilation Unit Length
	.long	417                     # DIE offset
	.asciz	"__time_t"              # External Name
	.long	406                     # DIE offset
	.asciz	"time_t"                # External Name
	.long	139                     # DIE offset
	.asciz	"unsigned int"          # External Name
	.long	83                      # DIE offset
	.asciz	"int"                   # External Name
	.long	428                     # DIE offset
	.asciz	"long int"              # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
