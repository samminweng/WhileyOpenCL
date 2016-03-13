	.text
	.file	"MatrixAdd.openmp.ll"
	.file	1 "MatrixAdd.c"
	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
.Lfunc_begin0:
	.loc	1 8 0                   # MatrixAdd.c:8:0
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
	leaq	(%rsp), %rdi
.Ltmp9:
	#DEBUG_VALUE: init:t <- [%RDI+0]
	.loc	1 13 22 prologue_end    # MatrixAdd.c:13:22
	callq	time
	.loc	1 13 5 is_stmt 0 discriminator 1 # MatrixAdd.c:13:5
	movl	%eax, %edi
.Ltmp10:
	callq	srand
	xorl	%r14d, %r14d
.Ltmp11:
	#DEBUG_VALUE: init:i <- 0
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB0_1:                                # %for.cond2.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	movq	%r14, %rbx
	movl	$10240, %r12d           # imm = 0x2800
	.p2align	4, 0x90
.LBB0_2:                                # %for.body5
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp12:
	.loc	1 16 21 is_stmt 1 discriminator 1 # MatrixAdd.c:16:21
	callq	rand
	.loc	1 16 28 is_stmt 0       # MatrixAdd.c:16:28
	cltq
	imulq	$1374389535, %rax, %rcx # imm = 0x51EB851F
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	imull	$100, %ecx, %ecx
	subl	%ecx, %eax
.Ltmp13:
	#DEBUG_VALUE: r <- %EAX
	.loc	1 17 21 is_stmt 1       # MatrixAdd.c:17:21
	addl	%eax, A(%rbx)
	.loc	1 18 31                 # MatrixAdd.c:18:31
	movl	$100, %ecx
	subl	%eax, %ecx
	.loc	1 18 21 is_stmt 0       # MatrixAdd.c:18:21
	addl	%ecx, B(%rbx)
.Ltmp14:
	.loc	1 15 9 is_stmt 1 discriminator 1 # MatrixAdd.c:15:9
	addq	$4, %rbx
	decq	%r12
	jne	.LBB0_2
.Ltmp15:
# BB#3:                                 # %for.inc22
                                        #   in Loop: Header=BB0_1 Depth=1
	#DEBUG_VALUE: r <- %EAX
	.loc	1 14 5 discriminator 1  # MatrixAdd.c:14:5
	incq	%r15
	addq	$40960, %r14            # imm = 0xA000
	cmpq	$10240, %r15            # imm = 0x2800
	jne	.LBB0_1
.Ltmp16:
# BB#4:                                 # %for.end24
	#DEBUG_VALUE: r <- %EAX
	.loc	1 21 1                  # MatrixAdd.c:21:1
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Ltmp17:
.Lfunc_end0:
	.size	init, .Lfunc_end0-init
	.cfi_endproc

	.globl	mat_add
	.p2align	4, 0x90
	.type	mat_add,@function
mat_add:                                # @mat_add
.Lfunc_begin1:
	.loc	1 23 0                  # MatrixAdd.c:23:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp18:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp19:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp20:
	.cfi_def_cfa_offset 32
	subq	$32, %rsp
.Ltmp21:
	.cfi_def_cfa_offset 64
.Ltmp22:
	.cfi_offset %rbx, -32
.Ltmp23:
	.cfi_offset %r14, -24
.Ltmp24:
	.cfi_offset %r15, -16
.Ltmp25:
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
	movq	%r9, %rax
	shlq	$18, %rax
	leaq	(%rax,%rax,4), %r10
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
.Ltmp26:
	.loc	1 27 31 prologue_end    # MatrixAdd.c:27:31
	addl	A(%rbx), %esi
	movl	%esi, C(%rbx)
	movl	B+4(%rbx), %esi
	addl	A+4(%rbx), %esi
	movl	%esi, C+4(%rbx)
	addq	$8, %rbx
	addq	$-2, %rdx
	jne	.LBB1_8
.Ltmp27:
# BB#9:                                 # %polly.loop_exit16.i
                                        #   in Loop: Header=BB1_10 Depth=4
	incq	%rax
	addq	$40960, %rcx            # imm = 0xA000
	cmpq	$32, %rax
	jne	.LBB1_10
# BB#4:                                 # %polly.loop_exit10.i
                                        #   in Loop: Header=BB1_7 Depth=3
	incq	%rdi
	subq	$-128, %r11
	cmpq	$320, %rdi              # imm = 0x140
	jne	.LBB1_7
# BB#5:                                 # %polly.loop_exit4.i
                                        #   in Loop: Header=BB1_6 Depth=2
	addq	$1310720, %r10          # imm = 0x140000
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
	.loc	1 30 1                  # MatrixAdd.c:30:1
	addq	$32, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Ltmp28:
.Lfunc_end1:
	.size	mat_add, .Lfunc_end1-mat_add
	.cfi_endproc

	.globl	print_array
	.p2align	4, 0x90
	.type	print_array,@function
print_array:                            # @print_array
.Lfunc_begin2:
	.loc	1 33 0                  # MatrixAdd.c:33:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp29:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp30:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp31:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp32:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp33:
	.cfi_def_cfa_offset 48
.Ltmp34:
	.cfi_offset %rbx, -40
.Ltmp35:
	.cfi_offset %r12, -32
.Ltmp36:
	.cfi_offset %r14, -24
.Ltmp37:
	.cfi_offset %r15, -16
	movl	$C, %r14d
.Ltmp38:
	#DEBUG_VALUE: print_array:i <- 0
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB2_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
	movq	%r14, %r12
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB2_2:                                # %for.body3
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp39:
	.loc	1 38 27 prologue_end    # MatrixAdd.c:38:27
	movl	(%r12), %esi
	.loc	1 38 13 is_stmt 0       # MatrixAdd.c:38:13
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp40:
	.loc	1 39 18 is_stmt 1       # MatrixAdd.c:39:18
	movslq	%ebx, %rax
	imulq	$1717986919, %rax, %rcx # imm = 0x66666667
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	shll	$4, %ecx
	leal	(%rcx,%rcx,4), %ecx
	subl	%ecx, %eax
.Ltmp41:
	.loc	1 39 17 is_stmt 0       # MatrixAdd.c:39:17
	cmpl	$79, %eax
	jne	.LBB2_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB2_2 Depth=2
.Ltmp42:
	.loc	1 39 29 discriminator 1 # MatrixAdd.c:39:29
	movl	$10, %edi
	callq	putchar
.Ltmp43:
.LBB2_4:                                # %for.inc
                                        #   in Loop: Header=BB2_2 Depth=2
	.loc	1 37 9 is_stmt 1 discriminator 1 # MatrixAdd.c:37:9
	incq	%rbx
	addq	$4, %r12
	cmpq	$10240, %rbx            # imm = 0x2800
	jne	.LBB2_2
.Ltmp44:
# BB#5:                                 # %for.end
                                        #   in Loop: Header=BB2_1 Depth=1
	.loc	1 41 9                  # MatrixAdd.c:41:9
	movl	$10, %edi
	callq	putchar
.Ltmp45:
	.loc	1 36 5 discriminator 1  # MatrixAdd.c:36:5
	incq	%r15
	addq	$40960, %r14            # imm = 0xA000
	cmpq	$10240, %r15            # imm = 0x2800
	jne	.LBB2_1
.Ltmp46:
# BB#6:                                 # %for.end11
	.loc	1 43 1                  # MatrixAdd.c:43:1
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Ltmp47:
.Lfunc_end2:
	.size	print_array, .Lfunc_end2-print_array
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin3:
	.loc	1 46 0                  # MatrixAdd.c:46:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp48:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp49:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp50:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp51:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp52:
	.cfi_def_cfa_offset 48
.Ltmp53:
	.cfi_offset %rbx, -40
.Ltmp54:
	.cfi_offset %r12, -32
.Ltmp55:
	.cfi_offset %r14, -24
.Ltmp56:
	.cfi_offset %r15, -16
	leaq	(%rsp), %rdi
.Ltmp57:
	#DEBUG_VALUE: init:t <- [%RDI+0]
	.loc	1 13 22 prologue_end    # MatrixAdd.c:13:22
	callq	time
.Ltmp58:
	.loc	1 13 5 is_stmt 0 discriminator 1 # MatrixAdd.c:13:5
	movl	%eax, %edi
.Ltmp59:
	callq	srand
	xorl	%r14d, %r14d
.Ltmp60:
	#DEBUG_VALUE: init:i <- 0
	.loc	1 49 5 is_stmt 1        # MatrixAdd.c:49:5
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB3_1:                                # %for.cond2.preheader.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_2 Depth 2
	movq	%r14, %rbx
	movl	$10240, %r12d           # imm = 0x2800
	.p2align	4, 0x90
.LBB3_2:                                # %for.body5.i
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp61:
	.loc	1 16 21 discriminator 1 # MatrixAdd.c:16:21
	callq	rand
.Ltmp62:
	.loc	1 16 28 is_stmt 0       # MatrixAdd.c:16:28
	cltq
	imulq	$1374389535, %rax, %rcx # imm = 0x51EB851F
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	imull	$100, %ecx, %ecx
	subl	%ecx, %eax
.Ltmp63:
	#DEBUG_VALUE: r <- %EAX
	.loc	1 17 21 is_stmt 1       # MatrixAdd.c:17:21
	addl	%eax, A(%rbx)
	.loc	1 18 31                 # MatrixAdd.c:18:31
	movl	$100, %ecx
	subl	%eax, %ecx
	.loc	1 18 21 is_stmt 0       # MatrixAdd.c:18:21
	addl	%ecx, B(%rbx)
.Ltmp64:
	.loc	1 15 9 is_stmt 1 discriminator 1 # MatrixAdd.c:15:9
	addq	$4, %rbx
	decq	%r12
	jne	.LBB3_2
.Ltmp65:
# BB#3:                                 # %for.inc22.i
                                        #   in Loop: Header=BB3_1 Depth=1
	#DEBUG_VALUE: r <- %EAX
	.loc	1 14 5 discriminator 1  # MatrixAdd.c:14:5
	incq	%r15
	addq	$40960, %r14            # imm = 0xA000
	cmpq	$10240, %r15            # imm = 0x2800
	jne	.LBB3_1
.Ltmp66:
# BB#4:                                 # %init.exit
	#DEBUG_VALUE: r <- %EAX
	.loc	1 50 5                  # MatrixAdd.c:50:5
	callq	mat_add
	.loc	1 52 81                 # MatrixAdd.c:52:81
	movl	$419430396, %eax        # imm = 0x18FFFFFC
.Ltmp67:
	movl	C(%rax), %r9d
	.loc	1 52 5 is_stmt 0        # MatrixAdd.c:52:5
	movl	$.L.str.2, %edi
	movl	$10240, %esi            # imm = 0x2800
	movl	$10240, %edx            # imm = 0x2800
	movl	$10239, %ecx            # imm = 0x27FF
	movl	$10239, %r8d            # imm = 0x27FF
	xorl	%eax, %eax
	callq	printf
	.loc	1 53 5 is_stmt 1        # MatrixAdd.c:53:5
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Ltmp68:
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc
	.file	2 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file	3 "/usr/include/time.h"

	.p2align	4, 0x90
	.type	mat_add_polly_subfn,@function
mat_add_polly_subfn:                    # @mat_add_polly_subfn
.Lfunc_begin4:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp69:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp70:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp71:
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
.Ltmp72:
	.cfi_def_cfa_offset 48
.Ltmp73:
	.cfi_offset %rbx, -32
.Ltmp74:
	.cfi_offset %r14, -24
.Ltmp75:
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
	movq	%r9, %rax
	shlq	$18, %rax
	leaq	(%rax,%rax,4), %r10
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
	.loc	1 27 31                 # MatrixAdd.c:27:31
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
	addq	$40960, %rcx            # imm = 0xA000
	cmpq	$32, %rax
	jne	.LBB4_11
# BB#5:                                 # %polly.loop_exit10
                                        #   in Loop: Header=BB4_8 Depth=3
	incq	%rdi
	subq	$-128, %r11
	cmpq	$320, %rdi              # imm = 0x140
	jne	.LBB4_8
# BB#6:                                 # %polly.loop_exit4
                                        #   in Loop: Header=BB4_7 Depth=2
	addq	$1310720, %r10          # imm = 0x140000
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
	.asciz	"Pass %d X %d matrix test case (C[%d][%d] =%d) \n "
	.size	.L.str.2, 49

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
	.asciz	"init"                  # string offset=275
.Linfo_string10:
	.asciz	"t"                     # string offset=280
.Linfo_string11:
	.asciz	"long int"              # string offset=282
.Linfo_string12:
	.asciz	"__time_t"              # string offset=291
.Linfo_string13:
	.asciz	"time_t"                # string offset=300
.Linfo_string14:
	.asciz	"i"                     # string offset=307
.Linfo_string15:
	.asciz	"j"                     # string offset=309
.Linfo_string16:
	.asciz	"r"                     # string offset=311
.Linfo_string17:
	.asciz	"mat_add"               # string offset=313
.Linfo_string18:
	.asciz	"print_array"           # string offset=321
.Linfo_string19:
	.asciz	"main"                  # string offset=333
.Linfo_string20:
	.asciz	"k"                     # string offset=338
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Ltmp9-.Lfunc_begin0
	.quad	.Ltmp10-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	117                     # DW_OP_breg5
	.byte	0                       # 0
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	80                      # super-register DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc2:
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	117                     # DW_OP_breg5
	.byte	0                       # 0
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	80                      # super-register DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
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
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	12                      # Abbreviation Code
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
	.byte	13                      # Abbreviation Code
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
	.byte	14                      # Abbreviation Code
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
	.byte	15                      # Abbreviation Code
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
	.byte	16                      # Abbreviation Code
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	17                      # Abbreviation Code
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
	.byte	18                      # Abbreviation Code
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
	.byte	19                      # Abbreviation Code
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
	.long	500                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x1ed DW_TAG_compile_unit
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
	.byte	7                       # Abbrev [7] 0x92:0x3f DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	310                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0xa5:0x9 DW_TAG_variable
	.long	.Ldebug_loc0            # DW_AT_location
	.long	318                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0xae:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	329                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0xb4:0x5 DW_TAG_variable
	.long	340                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0xb9:0x17 DW_TAG_lexical_block
	.quad	.Ltmp12                 # DW_AT_low_pc
	.long	.Ltmp14-.Ltmp12         # DW_AT_high_pc
	.byte	8                       # Abbrev [8] 0xc6:0x9 DW_TAG_variable
	.long	.Ldebug_loc1            # DW_AT_location
	.long	352                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0xd1:0x38 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	23                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	13                      # Abbrev [13] 0xe6:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	24                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	14                      # Abbrev [14] 0xf2:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	24                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	14                      # Abbrev [14] 0xfd:0xb DW_TAG_variable
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	24                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x109:0x2d DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	13                      # Abbrev [13] 0x11e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	14                      # Abbrev [14] 0x12a:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	15                      # Abbrev [15] 0x136:0x37 DW_TAG_subprogram
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	14                      # Abbrev [14] 0x13e:0xb DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	365                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x149:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	14                      # Abbrev [14] 0x154:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	16                      # Abbrev [16] 0x15f:0xd DW_TAG_lexical_block
	.byte	14                      # Abbrev [14] 0x160:0xb DW_TAG_variable
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	16                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x16d:0xb DW_TAG_typedef
	.long	376                     # DW_AT_type
	.long	.Linfo_string13         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	75                      # DW_AT_decl_line
	.byte	17                      # Abbrev [17] 0x178:0xb DW_TAG_typedef
	.long	387                     # DW_AT_type
	.long	.Linfo_string12         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	139                     # DW_AT_decl_line
	.byte	5                       # Abbrev [5] 0x183:0x7 DW_TAG_base_type
	.long	.Linfo_string11         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	18                      # Abbrev [18] 0x18a:0x6d DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	45                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	14                      # Abbrev [14] 0x1a3:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	47                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	14                      # Abbrev [14] 0x1ae:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	47                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	14                      # Abbrev [14] 0x1b9:0xb DW_TAG_variable
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	47                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	19                      # Abbrev [19] 0x1c4:0x32 DW_TAG_inlined_subroutine
	.long	310                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	49                      # DW_AT_call_line
	.byte	8                       # Abbrev [8] 0x1cf:0x9 DW_TAG_variable
	.long	.Ldebug_loc2            # DW_AT_location
	.long	318                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x1d8:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	329                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x1de:0x17 DW_TAG_lexical_block
	.quad	.Ltmp61                 # DW_AT_low_pc
	.long	.Ltmp64-.Ltmp61         # DW_AT_high_pc
	.byte	8                       # Abbrev [8] 0x1eb:0x9 DW_TAG_variable
	.long	.Ldebug_loc3            # DW_AT_location
	.long	352                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.quad	.Ltmp61-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
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
	.long	504                     # Compilation Unit Length
	.long	42                      # DIE offset
	.asciz	"A"                     # External Name
	.long	97                      # DIE offset
	.asciz	"B"                     # External Name
	.long	118                     # DIE offset
	.asciz	"C"                     # External Name
	.long	310                     # DIE offset
	.asciz	"init"                  # External Name
	.long	394                     # DIE offset
	.asciz	"main"                  # External Name
	.long	209                     # DIE offset
	.asciz	"mat_add"               # External Name
	.long	265                     # DIE offset
	.asciz	"print_array"           # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	504                     # Compilation Unit Length
	.long	376                     # DIE offset
	.asciz	"__time_t"              # External Name
	.long	365                     # DIE offset
	.asciz	"time_t"                # External Name
	.long	139                     # DIE offset
	.asciz	"unsigned int"          # External Name
	.long	83                      # DIE offset
	.asciz	"int"                   # External Name
	.long	387                     # DIE offset
	.asciz	"long int"              # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
