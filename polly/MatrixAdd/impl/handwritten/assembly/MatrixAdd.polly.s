	.text
	.file	"MatrixAdd.polly.ll"
	.file	1 "MatrixAdd.c"
	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
.Lfunc_begin0:
	.loc	1 9 0                   # MatrixAdd.c:9:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp0:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp1:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp2:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp3:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp4:
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
.Ltmp5:
	.cfi_def_cfa_offset 64
.Ltmp6:
	.cfi_offset %rbx, -48
.Ltmp7:
	.cfi_offset %r12, -40
.Ltmp8:
	.cfi_offset %r13, -32
.Ltmp9:
	.cfi_offset %r14, -24
.Ltmp10:
	.cfi_offset %r15, -16
	leaq	8(%rsp), %rdi
.Ltmp11:
	#DEBUG_VALUE: init:t <- [%RDI+0]
	.loc	1 15 22 prologue_end    # MatrixAdd.c:15:22
	callq	time
	.loc	1 15 5 is_stmt 0 discriminator 1 # MatrixAdd.c:15:5
	movl	%eax, %edi
.Ltmp12:
	callq	srand
	movl	$R, %r15d
	xorl	%r14d, %r14d
.Ltmp13:
	#DEBUG_VALUE: init:i <- 0
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB0_1:                                # %for.cond2.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	movq	%r15, %rbx
	movl	$8000, %r13d            # imm = 0x1F40
	.p2align	4, 0x90
.LBB0_2:                                # %for.body5
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp14:
	.loc	1 19 23 is_stmt 1       # MatrixAdd.c:19:23
	callq	rand
	.loc	1 19 29 is_stmt 0       # MatrixAdd.c:19:29
	cltq
	imulq	$1374389535, %rax, %rcx # imm = 0x51EB851F
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	imull	$100, %ecx, %ecx
	subl	%ecx, %eax
	.loc	1 19 21                 # MatrixAdd.c:19:21
	movl	%eax, (%rbx)
.Ltmp15:
	.loc	1 17 9 is_stmt 1 discriminator 1 # MatrixAdd.c:17:9
	addq	$4, %rbx
	decq	%r13
	jne	.LBB0_2
.Ltmp16:
# BB#3:                                 # %for.inc9
                                        #   in Loop: Header=BB0_1 Depth=1
	.loc	1 16 5 discriminator 1  # MatrixAdd.c:16:5
	incq	%r12
	addq	$32000, %r15            # imm = 0x7D00
	cmpq	$8000, %r12             # imm = 0x1F40
	jne	.LBB0_1
.Ltmp17:
# BB#4:
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB0_5:                                # %polly.loop_preheader74
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_10 Depth 2
                                        #       Child Loop BB0_11 Depth 3
                                        #         Child Loop BB0_12 Depth 4
	movq	%r8, %r11
	shlq	$5, %r11
	movq	%r14, %r9
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB0_10:                               # %polly.loop_preheader80
                                        #   Parent Loop BB0_5 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_11 Depth 3
                                        #         Child Loop BB0_12 Depth 4
	movq	%r10, %rdi
	shlq	$5, %rdi
	movq	%r9, %rdx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_11:                               # %polly.loop_preheader86
                                        #   Parent Loop BB0_5 Depth=1
                                        #     Parent Loop BB0_10 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_12 Depth 4
	leaq	(%r11,%rax), %rcx
	imulq	$32000, %rcx, %rcx      # imm = 0x7D00
	movaps	R+112(%rcx,%rdi,4), %xmm0
	movaps	%xmm0, A+112(%rcx,%rdi,4)
	movaps	R+96(%rcx,%rdi,4), %xmm0
	movaps	%xmm0, A+96(%rcx,%rdi,4)
	movaps	R+80(%rcx,%rdi,4), %xmm0
	movaps	%xmm0, A+80(%rcx,%rdi,4)
	movaps	R+64(%rcx,%rdi,4), %xmm0
	movaps	%xmm0, A+64(%rcx,%rdi,4)
	movaps	R+48(%rcx,%rdi,4), %xmm0
	movaps	%xmm0, A+48(%rcx,%rdi,4)
	movaps	R+32(%rcx,%rdi,4), %xmm0
	movaps	%xmm0, A+32(%rcx,%rdi,4)
	movaps	R+16(%rcx,%rdi,4), %xmm0
	movaps	%xmm0, A+16(%rcx,%rdi,4)
	movaps	R(%rcx,%rdi,4), %xmm0
	movaps	%xmm0, A(%rcx,%rdi,4)
	movq	%rdx, %rbx
	movl	$32, %esi
	.p2align	4, 0x90
.LBB0_12:                               # %polly.loop_header85
                                        #   Parent Loop BB0_5 Depth=1
                                        #     Parent Loop BB0_10 Depth=2
                                        #       Parent Loop BB0_11 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
.Ltmp18:
	.loc	1 26 27                 # MatrixAdd.c:26:27
	movl	$100, %ecx
	subl	R(%rbx), %ecx
	movl	%ecx, B(%rbx)
	movl	$100, %ecx
	subl	R+4(%rbx), %ecx
	movl	%ecx, B+4(%rbx)
	addq	$8, %rbx
	addq	$-2, %rsi
	jne	.LBB0_12
.Ltmp19:
# BB#8:                                 # %polly.loop_exit87
                                        #   in Loop: Header=BB0_11 Depth=3
	incq	%rax
	addq	$32000, %rdx            # imm = 0x7D00
	cmpq	$32, %rax
	jne	.LBB0_11
# BB#9:                                 # %polly.loop_exit81
                                        #   in Loop: Header=BB0_10 Depth=2
	incq	%r10
	subq	$-128, %r9
	cmpq	$250, %r10
	jne	.LBB0_10
# BB#6:                                 # %polly.loop_exit75
                                        #   in Loop: Header=BB0_5 Depth=1
	incq	%r8
	addq	$1024000, %r14          # imm = 0xFA000
	cmpq	$250, %r8
	jne	.LBB0_5
# BB#7:                                 # %polly.exiting
	.loc	1 29 1                  # MatrixAdd.c:29:1
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
.Ltmp20:
.Lfunc_end0:
	.size	init, .Lfunc_end0-init
	.cfi_endproc

	.globl	mat_add
	.p2align	4, 0x90
	.type	mat_add,@function
mat_add:                                # @mat_add
.Lfunc_begin1:
	.loc	1 31 0                  # MatrixAdd.c:31:0
	.cfi_startproc
# BB#0:                                 # %entry
	xorl	%r8d, %r8d
.Ltmp21:
	#DEBUG_VALUE: mat_add:i <- 0
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB1_1:                                # %polly.loop_preheader34
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_6 Depth 2
                                        #       Child Loop BB1_7 Depth 3
                                        #         Child Loop BB1_8 Depth 4
	movq	%r8, %r10
	xorl	%r11d, %r11d
	.p2align	4, 0x90
.LBB1_6:                                # %polly.loop_preheader40
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_7 Depth 3
                                        #         Child Loop BB1_8 Depth 4
	movq	%r10, %rcx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_7:                                # %polly.loop_preheader46
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_6 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_8 Depth 4
	movq	%rcx, %rdi
	movl	$32, %edx
	.p2align	4, 0x90
.LBB1_8:                                # %polly.loop_header45
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_6 Depth=2
                                        #       Parent Loop BB1_7 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	B(%rdi), %esi
.Ltmp22:
	.loc	1 35 31 prologue_end    # MatrixAdd.c:35:31
	addl	A(%rdi), %esi
	movl	%esi, C(%rdi)
	movl	B+4(%rdi), %esi
	addl	A+4(%rdi), %esi
	movl	%esi, C+4(%rdi)
	addq	$8, %rdi
	addq	$-2, %rdx
	jne	.LBB1_8
.Ltmp23:
# BB#4:                                 # %polly.loop_exit47
                                        #   in Loop: Header=BB1_7 Depth=3
	incq	%rax
	addq	$32000, %rcx            # imm = 0x7D00
	cmpq	$32, %rax
	jne	.LBB1_7
# BB#5:                                 # %polly.loop_exit41
                                        #   in Loop: Header=BB1_6 Depth=2
	incq	%r11
	subq	$-128, %r10
	cmpq	$250, %r11
	jne	.LBB1_6
# BB#2:                                 # %polly.loop_exit35
                                        #   in Loop: Header=BB1_1 Depth=1
	incq	%r9
	addq	$1024000, %r8           # imm = 0xFA000
	cmpq	$250, %r9
	jne	.LBB1_1
# BB#3:                                 # %polly.exiting
	.loc	1 38 1                  # MatrixAdd.c:38:1
	retq
.Ltmp24:
.Lfunc_end1:
	.size	mat_add, .Lfunc_end1-mat_add
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin2:
	.loc	1 54 0                  # MatrixAdd.c:54:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp25:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp26:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp27:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp28:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp29:
	.cfi_def_cfa_offset 48
	subq	$48, %rsp
.Ltmp30:
	.cfi_def_cfa_offset 96
.Ltmp31:
	.cfi_offset %rbx, -48
.Ltmp32:
	.cfi_offset %r12, -40
.Ltmp33:
	.cfi_offset %r13, -32
.Ltmp34:
	.cfi_offset %r14, -24
.Ltmp35:
	.cfi_offset %r15, -16
	leaq	40(%rsp), %rdi
.Ltmp36:
	#DEBUG_VALUE: init:t <- [%RDI+0]
	.loc	1 15 22 prologue_end    # MatrixAdd.c:15:22
	callq	time
.Ltmp37:
	.loc	1 15 5 is_stmt 0 discriminator 1 # MatrixAdd.c:15:5
	movl	%eax, %edi
.Ltmp38:
	callq	srand
	movl	$R, %r15d
	xorl	%r14d, %r14d
.Ltmp39:
	#DEBUG_VALUE: init:i <- 0
	.loc	1 57 5 is_stmt 1        # MatrixAdd.c:57:5
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB2_1:                                # %for.cond2.preheader.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
	movq	%r15, %rbx
	movl	$8000, %r13d            # imm = 0x1F40
	.p2align	4, 0x90
.LBB2_2:                                # %for.body5.i
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp40:
	.loc	1 19 23                 # MatrixAdd.c:19:23
	callq	rand
	.loc	1 19 29 is_stmt 0       # MatrixAdd.c:19:29
	cltq
	imulq	$1374389535, %rax, %rcx # imm = 0x51EB851F
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	imull	$100, %ecx, %ecx
	subl	%ecx, %eax
	.loc	1 19 21                 # MatrixAdd.c:19:21
	movl	%eax, (%rbx)
.Ltmp41:
	.loc	1 17 9 is_stmt 1 discriminator 1 # MatrixAdd.c:17:9
	addq	$4, %rbx
	decq	%r13
	jne	.LBB2_2
.Ltmp42:
# BB#3:                                 # %for.inc9.i
                                        #   in Loop: Header=BB2_1 Depth=1
	.loc	1 16 5 discriminator 1  # MatrixAdd.c:16:5
	incq	%r12
	addq	$32000, %r15            # imm = 0x7D00
	cmpq	$8000, %r12             # imm = 0x1F40
	jne	.LBB2_1
.Ltmp43:
# BB#4:
	.loc	1 57 5                  # MatrixAdd.c:57:5
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB2_7:                                # %polly.loop_preheader74.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_8 Depth 2
                                        #       Child Loop BB2_11 Depth 3
                                        #         Child Loop BB2_9 Depth 4
	movq	%r8, %r11
	shlq	$5, %r11
	movq	%r14, %r9
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB2_8:                                # %polly.loop_preheader80.i
                                        #   Parent Loop BB2_7 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_11 Depth 3
                                        #         Child Loop BB2_9 Depth 4
	movq	%r10, %rdi
	shlq	$5, %rdi
	movq	%r9, %rdx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB2_11:                               # %polly.loop_preheader86.i
                                        #   Parent Loop BB2_7 Depth=1
                                        #     Parent Loop BB2_8 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB2_9 Depth 4
	leaq	(%rax,%r11), %rcx
	imulq	$32000, %rcx, %rcx      # imm = 0x7D00
	movaps	R+112(%rcx,%rdi,4), %xmm0
	movaps	%xmm0, A+112(%rcx,%rdi,4)
	movaps	R+96(%rcx,%rdi,4), %xmm0
	movaps	%xmm0, A+96(%rcx,%rdi,4)
	movaps	R+80(%rcx,%rdi,4), %xmm0
	movaps	%xmm0, A+80(%rcx,%rdi,4)
	movaps	R+64(%rcx,%rdi,4), %xmm0
	movaps	%xmm0, A+64(%rcx,%rdi,4)
	movaps	R+48(%rcx,%rdi,4), %xmm0
	movaps	%xmm0, A+48(%rcx,%rdi,4)
	movaps	R+32(%rcx,%rdi,4), %xmm0
	movaps	%xmm0, A+32(%rcx,%rdi,4)
	movaps	R+16(%rcx,%rdi,4), %xmm0
	movaps	%xmm0, A+16(%rcx,%rdi,4)
	movaps	R(%rcx,%rdi,4), %xmm0
	movaps	%xmm0, A(%rcx,%rdi,4)
	movq	%rdx, %rbx
	movl	$32, %esi
	.p2align	4, 0x90
.LBB2_9:                                # %polly.loop_header85.i
                                        #   Parent Loop BB2_7 Depth=1
                                        #     Parent Loop BB2_8 Depth=2
                                        #       Parent Loop BB2_11 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
.Ltmp44:
	.loc	1 26 27                 # MatrixAdd.c:26:27
	movl	$100, %ecx
	subl	R(%rbx), %ecx
.Ltmp45:
	.loc	1 57 5                  # MatrixAdd.c:57:5
	movl	%ecx, B(%rbx)
.Ltmp46:
	.loc	1 26 27                 # MatrixAdd.c:26:27
	movl	$100, %ecx
	subl	R+4(%rbx), %ecx
.Ltmp47:
	.loc	1 57 5                  # MatrixAdd.c:57:5
	movl	%ecx, B+4(%rbx)
	addq	$8, %rbx
	addq	$-2, %rsi
	jne	.LBB2_9
# BB#10:                                # %polly.loop_exit87.i
                                        #   in Loop: Header=BB2_11 Depth=3
	incq	%rax
	addq	$32000, %rdx            # imm = 0x7D00
	cmpq	$32, %rax
	jne	.LBB2_11
# BB#5:                                 # %polly.loop_exit81.i
                                        #   in Loop: Header=BB2_8 Depth=2
	incq	%r10
	subq	$-128, %r9
	cmpq	$250, %r10
	jne	.LBB2_8
# BB#6:                                 # %polly.loop_exit75.i
                                        #   in Loop: Header=BB2_7 Depth=1
	incq	%r8
	addq	$1024000, %r14          # imm = 0xFA000
	cmpq	$250, %r8
	jne	.LBB2_7
# BB#15:                                # %init.exit
	xorl	%r8d, %r8d
.Ltmp48:
	#DEBUG_VALUE: mat_add:i <- 0
	.loc	1 58 5                  # MatrixAdd.c:58:5
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB2_16:                               # %polly.loop_preheader34.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_17 Depth 2
                                        #       Child Loop BB2_20 Depth 3
                                        #         Child Loop BB2_18 Depth 4
	movq	%r8, %r10
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB2_17:                               # %polly.loop_preheader40.i
                                        #   Parent Loop BB2_16 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_20 Depth 3
                                        #         Child Loop BB2_18 Depth 4
	movq	%r10, %rax
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB2_20:                               # %polly.loop_preheader46.i
                                        #   Parent Loop BB2_16 Depth=1
                                        #     Parent Loop BB2_17 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB2_18 Depth 4
	movq	%rax, %rdi
	movl	$32, %ecx
	.p2align	4, 0x90
.LBB2_18:                               # %polly.loop_header45.i
                                        #   Parent Loop BB2_16 Depth=1
                                        #     Parent Loop BB2_17 Depth=2
                                        #       Parent Loop BB2_20 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	B(%rdi), %edx
.Ltmp49:
	.loc	1 35 31                 # MatrixAdd.c:35:31
	addl	A(%rdi), %edx
.Ltmp50:
	.loc	1 58 5                  # MatrixAdd.c:58:5
	movl	%edx, C(%rdi)
	movl	B+4(%rdi), %edx
.Ltmp51:
	.loc	1 35 31                 # MatrixAdd.c:35:31
	addl	A+4(%rdi), %edx
.Ltmp52:
	.loc	1 58 5                  # MatrixAdd.c:58:5
	movl	%edx, C+4(%rdi)
	addq	$8, %rdi
	addq	$-2, %rcx
	jne	.LBB2_18
# BB#19:                                # %polly.loop_exit47.i
                                        #   in Loop: Header=BB2_20 Depth=3
	incq	%rbx
	addq	$32000, %rax            # imm = 0x7D00
	cmpq	$32, %rbx
	jne	.LBB2_20
# BB#12:                                # %polly.loop_exit41.i
                                        #   in Loop: Header=BB2_17 Depth=2
	incq	%rsi
	subq	$-128, %r10
	cmpq	$250, %rsi
	jne	.LBB2_17
# BB#13:                                # %polly.loop_exit35.i
                                        #   in Loop: Header=BB2_16 Depth=1
	incq	%r9
	addq	$1024000, %r8           # imm = 0xFA000
	cmpq	$250, %r9
	jne	.LBB2_16
# BB#14:                                # %mat_add.exit
	.loc	1 60 5                  # MatrixAdd.c:60:5
	movl	$.L.str, %edi
	movl	$8000, %esi             # imm = 0x1F40
	movl	$8000, %edx             # imm = 0x1F40
	xorl	%eax, %eax
	callq	printf
	movl	$255999996, %eax        # imm = 0xF423FFC
	.loc	1 62 19                 # MatrixAdd.c:62:19
	movl	A(%rax), %ecx
	.loc	1 63 19                 # MatrixAdd.c:63:19
	movl	B(%rax), %edx
	.loc	1 64 19                 # MatrixAdd.c:64:19
	movl	C(%rax), %eax
	.loc	1 61 5                  # MatrixAdd.c:61:5
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
	.loc	1 65 5                  # MatrixAdd.c:65:5
	xorl	%eax, %eax
	addq	$48, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
.Ltmp53:
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
	.file	2 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file	3 "/usr/include/time.h"

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
	.asciz	"t"                     # string offset=282
.Linfo_string12:
	.asciz	"long int"              # string offset=284
.Linfo_string13:
	.asciz	"__time_t"              # string offset=293
.Linfo_string14:
	.asciz	"time_t"                # string offset=302
.Linfo_string15:
	.asciz	"i"                     # string offset=309
.Linfo_string16:
	.asciz	"j"                     # string offset=311
.Linfo_string17:
	.asciz	"mat_add"               # string offset=313
.Linfo_string18:
	.asciz	"k"                     # string offset=321
.Linfo_string19:
	.asciz	"main"                  # string offset=323
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Ltmp11-.Lfunc_begin0
	.quad	.Ltmp12-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	117                     # DW_OP_breg5
	.byte	0                       # 0
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Ltmp36-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
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
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.ascii	"\347\177"              # DW_AT_APPLE_omit_frame_ptr
	.byte	25                      # DW_FORM_flag_present
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	10                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
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
	.byte	32                      # DW_AT_inline
	.byte	11                      # DW_FORM_data1
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
	.byte	14                      # Abbreviation Code
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
	.byte	15                      # Abbreviation Code
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
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	457                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x1c2 DW_TAG_compile_unit
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
	.byte	7                       # Abbrev [7] 0xa7:0x28 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	243                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0xba:0x9 DW_TAG_variable
	.long	.Ldebug_loc0            # DW_AT_location
	.long	251                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0xc3:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	262                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0xc9:0x5 DW_TAG_variable
	.long	273                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0xcf:0x24 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	314                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0xe2:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	322                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0xe8:0x5 DW_TAG_variable
	.long	333                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0xed:0x5 DW_TAG_variable
	.long	344                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	11                      # Abbrev [11] 0xf3:0x2a DW_TAG_subprogram
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	12                      # Abbrev [12] 0xfb:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
	.long	285                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x106:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x111:0xb DW_TAG_variable
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	13                      # Abbrev [13] 0x11d:0xb DW_TAG_typedef
	.long	296                     # DW_AT_type
	.long	.Linfo_string14         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	75                      # DW_AT_decl_line
	.byte	13                      # Abbrev [13] 0x128:0xb DW_TAG_typedef
	.long	307                     # DW_AT_type
	.long	.Linfo_string13         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	139                     # DW_AT_decl_line
	.byte	5                       # Abbrev [5] 0x133:0x7 DW_TAG_base_type
	.long	.Linfo_string12         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	11                      # Abbrev [11] 0x13a:0x2a DW_TAG_subprogram
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	12                      # Abbrev [12] 0x142:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x14d:0xb DW_TAG_variable
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x158:0xb DW_TAG_variable
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	14                      # Abbrev [14] 0x164:0x68 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	53                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	12                      # Abbrev [12] 0x17d:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	55                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x188:0xb DW_TAG_variable
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	55                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x193:0xb DW_TAG_variable
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	55                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	15                      # Abbrev [15] 0x19e:0x1b DW_TAG_inlined_subroutine
	.long	243                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	57                      # DW_AT_call_line
	.byte	8                       # Abbrev [8] 0x1a9:0x9 DW_TAG_variable
	.long	.Ldebug_loc1            # DW_AT_location
	.long	251                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x1b2:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	262                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	15                      # Abbrev [15] 0x1b9:0x12 DW_TAG_inlined_subroutine
	.long	314                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges1         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	58                      # DW_AT_call_line
	.byte	9                       # Abbrev [9] 0x1c4:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	322                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp36-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	0
	.quad	0
.Ldebug_ranges1:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
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
	.long	461                     # Compilation Unit Length
	.long	42                      # DIE offset
	.asciz	"A"                     # External Name
	.long	97                      # DIE offset
	.asciz	"B"                     # External Name
	.long	118                     # DIE offset
	.asciz	"C"                     # External Name
	.long	243                     # DIE offset
	.asciz	"init"                  # External Name
	.long	139                     # DIE offset
	.asciz	"R"                     # External Name
	.long	356                     # DIE offset
	.asciz	"main"                  # External Name
	.long	314                     # DIE offset
	.asciz	"mat_add"               # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	461                     # Compilation Unit Length
	.long	296                     # DIE offset
	.asciz	"__time_t"              # External Name
	.long	285                     # DIE offset
	.asciz	"time_t"                # External Name
	.long	160                     # DIE offset
	.asciz	"unsigned int"          # External Name
	.long	83                      # DIE offset
	.asciz	"int"                   # External Name
	.long	307                     # DIE offset
	.asciz	"long int"              # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
