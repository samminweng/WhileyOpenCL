	.text
	.file	"MatrixAdd.polly.ll"
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
	subq	$419430424, %rsp        # imm = 0x19000018
.Ltmp8:
	.cfi_def_cfa_offset 419430480
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
	leaq	8(%rsp), %rdi
.Ltmp15:
	#DEBUG_VALUE: init:t <- [%RDI+0]
	.loc	1 20 22 prologue_end    # MatrixAdd.c:20:22
	callq	time
	.loc	1 20 5 is_stmt 0 discriminator 1 # MatrixAdd.c:20:5
	movl	%eax, %edi
.Ltmp16:
	callq	srand
	leaq	16(%rsp), %r14
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
# BB#4:                                 # %polly.loop_preheader74.preheader
	leaq	20(%rsp), %r8
	xorl	%r10d, %r10d
	movl	$B+4, %r9d
	.p2align	4, 0x90
.LBB1_5:                                # %polly.loop_preheader74
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_10 Depth 2
                                        #       Child Loop BB1_11 Depth 3
                                        #         Child Loop BB1_12 Depth 4
	movq	%r10, %r12
	shlq	$5, %r12
	movq	%r8, %r11
	movq	%r9, %r14
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB1_10:                               # %polly.loop_preheader80
                                        #   Parent Loop BB1_5 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_11 Depth 3
                                        #         Child Loop BB1_12 Depth 4
	movq	%r15, %rdx
	shlq	$5, %rdx
	movq	%r11, %r13
	movq	%r14, %rsi
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_11:                               # %polly.loop_preheader86
                                        #   Parent Loop BB1_5 Depth=1
                                        #     Parent Loop BB1_10 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_12 Depth 4
	leaq	(%r12,%rax), %rcx
	shlq	$13, %rcx
	leaq	(%rcx,%rcx,4), %rcx
	leaq	16(%rsp,%rcx), %rdi
	movaps	112(%rdi,%rdx,4), %xmm0
	movaps	%xmm0, A+112(%rcx,%rdx,4)
	movaps	96(%rdi,%rdx,4), %xmm0
	movaps	%xmm0, A+96(%rcx,%rdx,4)
	movaps	80(%rdi,%rdx,4), %xmm0
	movaps	%xmm0, A+80(%rcx,%rdx,4)
	movaps	64(%rdi,%rdx,4), %xmm0
	movaps	%xmm0, A+64(%rcx,%rdx,4)
	movaps	48(%rdi,%rdx,4), %xmm0
	movaps	%xmm0, A+48(%rcx,%rdx,4)
	movaps	32(%rdi,%rdx,4), %xmm0
	movaps	%xmm0, A+32(%rcx,%rdx,4)
	movaps	16(%rdi,%rdx,4), %xmm0
	movaps	%xmm0, A+16(%rcx,%rdx,4)
	movaps	(%rdi,%rdx,4), %xmm0
	movaps	%xmm0, A(%rcx,%rdx,4)
	movq	%r13, %rdi
	movq	%rsi, %rbx
	movl	$32, %ecx
	.p2align	4, 0x90
.LBB1_12:                               # %polly.loop_header85
                                        #   Parent Loop BB1_5 Depth=1
                                        #     Parent Loop BB1_10 Depth=2
                                        #       Parent Loop BB1_11 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
.Ltmp23:
	.loc	1 30 27                 # MatrixAdd.c:30:27
	movl	$100, %ebp
	subl	-4(%rdi), %ebp
	movl	%ebp, -4(%rbx)
	movl	$100, %ebp
	subl	(%rdi), %ebp
	movl	%ebp, (%rbx)
	addq	$8, %rbx
	addq	$8, %rdi
	addq	$-2, %rcx
	jne	.LBB1_12
.Ltmp24:
# BB#8:                                 # %polly.loop_exit87
                                        #   in Loop: Header=BB1_11 Depth=3
	incq	%rax
	addq	$40960, %rsi            # imm = 0xA000
	addq	$40960, %r13            # imm = 0xA000
	cmpq	$32, %rax
	jne	.LBB1_11
# BB#9:                                 # %polly.loop_exit81
                                        #   in Loop: Header=BB1_10 Depth=2
	incq	%r15
	subq	$-128, %r14
	subq	$-128, %r11
	cmpq	$320, %r15              # imm = 0x140
	jne	.LBB1_10
# BB#6:                                 # %polly.loop_exit75
                                        #   in Loop: Header=BB1_5 Depth=1
	incq	%r10
	addq	$1310720, %r9           # imm = 0x140000
	addq	$1310720, %r8           # imm = 0x140000
	cmpq	$320, %r10              # imm = 0x140
	jne	.LBB1_5
# BB#7:                                 # %polly.exiting
	.loc	1 33 1                  # MatrixAdd.c:33:1
	addq	$419430424, %rsp        # imm = 0x19000018
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
	xorl	%r8d, %r8d
.Ltmp26:
	#DEBUG_VALUE: mat_add:i <- 0
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB2_1:                                # %polly.loop_preheader34
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_6 Depth 2
                                        #       Child Loop BB2_7 Depth 3
                                        #         Child Loop BB2_8 Depth 4
	movq	%r8, %r10
	xorl	%r11d, %r11d
	.p2align	4, 0x90
.LBB2_6:                                # %polly.loop_preheader40
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_7 Depth 3
                                        #         Child Loop BB2_8 Depth 4
	movq	%r10, %rcx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB2_7:                                # %polly.loop_preheader46
                                        #   Parent Loop BB2_1 Depth=1
                                        #     Parent Loop BB2_6 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB2_8 Depth 4
	movq	%rcx, %rdi
	movl	$32, %edx
	.p2align	4, 0x90
.LBB2_8:                                # %polly.loop_header45
                                        #   Parent Loop BB2_1 Depth=1
                                        #     Parent Loop BB2_6 Depth=2
                                        #       Parent Loop BB2_7 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	B(%rdi), %esi
.Ltmp27:
	.loc	1 39 31 prologue_end    # MatrixAdd.c:39:31
	addl	A(%rdi), %esi
	movl	%esi, C(%rdi)
	movl	B+4(%rdi), %esi
	addl	A+4(%rdi), %esi
	movl	%esi, C+4(%rdi)
	addq	$8, %rdi
	addq	$-2, %rdx
	jne	.LBB2_8
.Ltmp28:
# BB#4:                                 # %polly.loop_exit47
                                        #   in Loop: Header=BB2_7 Depth=3
	incq	%rax
	addq	$40960, %rcx            # imm = 0xA000
	cmpq	$32, %rax
	jne	.LBB2_7
# BB#5:                                 # %polly.loop_exit41
                                        #   in Loop: Header=BB2_6 Depth=2
	incq	%r11
	subq	$-128, %r10
	cmpq	$320, %r11              # imm = 0x140
	jne	.LBB2_6
# BB#2:                                 # %polly.loop_exit35
                                        #   in Loop: Header=BB2_1 Depth=1
	incq	%r9
	addq	$1310720, %r8           # imm = 0x140000
	cmpq	$320, %r9               # imm = 0x140
	jne	.LBB2_1
# BB#3:                                 # %polly.exiting
	.loc	1 42 1                  # MatrixAdd.c:42:1
	retq
.Ltmp29:
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
.Ltmp30:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp31:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp32:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp33:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp34:
	.cfi_def_cfa_offset 48
.Ltmp35:
	.cfi_offset %rbx, -40
.Ltmp36:
	.cfi_offset %r12, -32
.Ltmp37:
	.cfi_offset %r14, -24
.Ltmp38:
	.cfi_offset %r15, -16
	movl	$C, %r14d
.Ltmp39:
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
.Ltmp40:
	.loc	1 50 27 prologue_end    # MatrixAdd.c:50:27
	movl	(%r12), %esi
	.loc	1 50 13 is_stmt 0       # MatrixAdd.c:50:13
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp41:
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
.Ltmp42:
	.loc	1 51 17 is_stmt 0       # MatrixAdd.c:51:17
	cmpl	$79, %eax
	jne	.LBB3_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB3_2 Depth=2
.Ltmp43:
	.loc	1 51 29 discriminator 1 # MatrixAdd.c:51:29
	movl	$10, %edi
	callq	putchar
.Ltmp44:
.LBB3_4:                                # %for.inc
                                        #   in Loop: Header=BB3_2 Depth=2
	.loc	1 49 9 is_stmt 1 discriminator 1 # MatrixAdd.c:49:9
	incq	%rbx
	addq	$4, %r12
	cmpq	$10240, %rbx            # imm = 0x2800
	jne	.LBB3_2
.Ltmp45:
# BB#5:                                 # %for.end
                                        #   in Loop: Header=BB3_1 Depth=1
	.loc	1 53 9                  # MatrixAdd.c:53:9
	movl	$10, %edi
	callq	putchar
.Ltmp46:
	.loc	1 48 5 discriminator 1  # MatrixAdd.c:48:5
	incq	%r15
	addq	$40960, %r14            # imm = 0xA000
	cmpq	$10240, %r15            # imm = 0x2800
	jne	.LBB3_1
.Ltmp47:
# BB#6:                                 # %for.end11
	.loc	1 55 1                  # MatrixAdd.c:55:1
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Ltmp48:
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
.Ltmp49:
	.cfi_def_cfa_offset 48
	callq	init
	xorl	%r8d, %r8d
.Ltmp50:
	#DEBUG_VALUE: mat_add:i <- 0
	.loc	1 62 5                  # MatrixAdd.c:62:5
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB4_3:                                # %polly.loop_preheader34.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_4 Depth 2
                                        #       Child Loop BB4_7 Depth 3
                                        #         Child Loop BB4_5 Depth 4
	movq	%r8, %r10
	xorl	%r11d, %r11d
	.p2align	4, 0x90
.LBB4_4:                                # %polly.loop_preheader40.i
                                        #   Parent Loop BB4_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_7 Depth 3
                                        #         Child Loop BB4_5 Depth 4
	movq	%r10, %rcx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB4_7:                                # %polly.loop_preheader46.i
                                        #   Parent Loop BB4_3 Depth=1
                                        #     Parent Loop BB4_4 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB4_5 Depth 4
	movq	%rcx, %rdi
	movl	$32, %edx
	.p2align	4, 0x90
.LBB4_5:                                # %polly.loop_header45.i
                                        #   Parent Loop BB4_3 Depth=1
                                        #     Parent Loop BB4_4 Depth=2
                                        #       Parent Loop BB4_7 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	B(%rdi), %esi
.Ltmp51:
	.loc	1 39 31                 # MatrixAdd.c:39:31
	addl	A(%rdi), %esi
.Ltmp52:
	.loc	1 62 5                  # MatrixAdd.c:62:5
	movl	%esi, C(%rdi)
	movl	B+4(%rdi), %esi
.Ltmp53:
	.loc	1 39 31                 # MatrixAdd.c:39:31
	addl	A+4(%rdi), %esi
.Ltmp54:
	.loc	1 62 5                  # MatrixAdd.c:62:5
	movl	%esi, C+4(%rdi)
	addq	$8, %rdi
	addq	$-2, %rdx
	jne	.LBB4_5
# BB#6:                                 # %polly.loop_exit47.i
                                        #   in Loop: Header=BB4_7 Depth=3
	incq	%rax
	addq	$40960, %rcx            # imm = 0xA000
	cmpq	$32, %rax
	jne	.LBB4_7
# BB#1:                                 # %polly.loop_exit41.i
                                        #   in Loop: Header=BB4_4 Depth=2
	incq	%r11
	subq	$-128, %r10
	cmpq	$320, %r11              # imm = 0x140
	jne	.LBB4_4
# BB#2:                                 # %polly.loop_exit35.i
                                        #   in Loop: Header=BB4_3 Depth=1
	incq	%r9
	addq	$1310720, %r8           # imm = 0x140000
	cmpq	$320, %r9               # imm = 0x140
	jne	.LBB4_3
# BB#8:                                 # %mat_add.exit
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
.Ltmp55:
.Lfunc_end4:
	.size	main, .Lfunc_end4-main
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
	.asciz	"mat_add"               # string offset=275
.Linfo_string10:
	.asciz	"i"                     # string offset=283
.Linfo_string11:
	.asciz	"j"                     # string offset=285
.Linfo_string12:
	.asciz	"k"                     # string offset=287
.Linfo_string13:
	.asciz	"getRand"               # string offset=289
.Linfo_string14:
	.asciz	"init"                  # string offset=297
.Linfo_string15:
	.asciz	"print_array"           # string offset=302
.Linfo_string16:
	.asciz	"main"                  # string offset=314
.Linfo_string17:
	.asciz	"R"                     # string offset=319
.Linfo_string18:
	.asciz	"t"                     # string offset=321
.Linfo_string19:
	.asciz	"long int"              # string offset=323
.Linfo_string20:
	.asciz	"__time_t"              # string offset=332
.Linfo_string21:
	.asciz	"time_t"                # string offset=341
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
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	14                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	15                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	16                      # Abbreviation Code
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
	.byte	17                      # Abbreviation Code
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
	.byte	18                      # Abbreviation Code
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
	.byte	19                      # Abbreviation Code
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
	.long	471                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x1d0 DW_TAG_compile_unit
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
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	83                      # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0xab:0x4a DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	9                       # Abbrev [9] 0xc0:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	16
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
	.long	63                      # DW_AT_type
	.byte	10                      # Abbrev [10] 0xce:0xf DW_TAG_variable
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	17                      # DW_AT_decl_line
	.long	445                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0xdd:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0xe9:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	13                      # Abbrev [13] 0xf5:0x24 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	326                     # DW_AT_abstract_origin
	.byte	14                      # Abbrev [14] 0x108:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	334                     # DW_AT_abstract_origin
	.byte	15                      # Abbrev [15] 0x10e:0x5 DW_TAG_variable
	.long	345                     # DW_AT_abstract_origin
	.byte	15                      # Abbrev [15] 0x113:0x5 DW_TAG_variable
	.long	356                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	8                       # Abbrev [8] 0x119:0x2d DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	11                      # Abbrev [11] 0x12e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	46                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x13a:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	46                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	16                      # Abbrev [16] 0x146:0x2a DW_TAG_subprogram
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	12                      # Abbrev [12] 0x14e:0xb DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x159:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x164:0xb DW_TAG_variable
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x170:0x4d DW_TAG_subprogram
	.quad	.Lfunc_begin4           # DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin4 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	57                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	12                      # Abbrev [12] 0x189:0xb DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x194:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x19f:0xb DW_TAG_variable
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	18                      # Abbrev [18] 0x1aa:0x12 DW_TAG_inlined_subroutine
	.long	326                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	62                      # DW_AT_call_line
	.byte	14                      # Abbrev [14] 0x1b5:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	334                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	19                      # Abbrev [19] 0x1bd:0xb DW_TAG_typedef
	.long	456                     # DW_AT_type
	.long	.Linfo_string21         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	75                      # DW_AT_decl_line
	.byte	19                      # Abbrev [19] 0x1c8:0xb DW_TAG_typedef
	.long	467                     # DW_AT_type
	.long	.Linfo_string20         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	139                     # DW_AT_decl_line
	.byte	5                       # Abbrev [5] 0x1d3:0x7 DW_TAG_base_type
	.long	.Linfo_string19         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
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
	.long	475                     # Compilation Unit Length
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
	.long	368                     # DIE offset
	.asciz	"main"                  # External Name
	.long	326                     # DIE offset
	.asciz	"mat_add"               # External Name
	.long	281                     # DIE offset
	.asciz	"print_array"           # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	475                     # Compilation Unit Length
	.long	456                     # DIE offset
	.asciz	"__time_t"              # External Name
	.long	445                     # DIE offset
	.asciz	"time_t"                # External Name
	.long	139                     # DIE offset
	.asciz	"unsigned int"          # External Name
	.long	83                      # DIE offset
	.asciz	"int"                   # External Name
	.long	467                     # DIE offset
	.asciz	"long int"              # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
