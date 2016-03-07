	.text
	.file	"MatrixMult.polly.ll"
	.file	1 "MatrixMult.c"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI0_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
	.text
	.globl	init_array
	.p2align	4, 0x90
	.type	init_array,@function
init_array:                             # @init_array
.Lfunc_begin0:
	.loc	1 8 0                   # MatrixMult.c:8:0
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
	movq	$-8192, %rax            # imm = 0xFFFFFFFFFFFFE000
.Ltmp3:
	.loc	1 13 21 prologue_end    # MatrixMult.c:13:21
	movaps	.LCPI0_0(%rip), %xmm0   # xmm0 = [1,1]
	.p2align	4, 0x90
.LBB0_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movaps	%xmm0, A+8192(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8192(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8208(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8208(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8224(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8224(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8240(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8240(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8256(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8256(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8272(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8272(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8288(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8288(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8304(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8304(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8320(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8320(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8336(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8336(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8352(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8352(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8368(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8368(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8384(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8384(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8400(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8400(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8416(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8416(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8432(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8432(%rax)
.Ltmp4:
	.loc	1 11 5 discriminator 1  # MatrixMult.c:11:5
	addq	$256, %rax              # imm = 0x100
	jne	.LBB0_1
.Ltmp5:
# BB#2:                                 # %for.end12
	.loc	1 17 1                  # MatrixMult.c:17:1
	popq	%rbp
	retq
.Ltmp6:
.Lfunc_end0:
	.size	init_array, .Lfunc_end0-init_array
	.cfi_endproc

	.globl	mat_mult
	.p2align	4, 0x90
	.type	mat_mult,@function
mat_mult:                               # @mat_mult
.Lfunc_begin1:
	.loc	1 19 0                  # MatrixMult.c:19:0
	.cfi_startproc
# BB#0:                                 # %entry.split
	pushq	%rbp
.Ltmp7:
	.cfi_def_cfa_offset 16
.Ltmp8:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp9:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
.Ltmp10:
	.cfi_offset %rbx, -32
.Ltmp11:
	.cfi_offset %r14, -24
.Ltmp12:
	#DEBUG_VALUE: mat_mult:i <- 0
	xorl	%r14d, %r14d
	movl	$C, %edi
	xorl	%esi, %esi
	movl	$8192, %edx             # imm = 0x2000
	callq	memset
	movl	$A+8, %r8d
	.p2align	4, 0x90
.LBB1_1:                                # %polly.loop_preheader15
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_6 Depth 2
                                        #       Child Loop BB1_4 Depth 3
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_6:                                # %polly.loop_preheader21
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_4 Depth 3
	movq	%r14, %rax
	shlq	$8, %rax
	leaq	C(%rax,%rcx,8), %rdx
	movq	C(%rax,%rcx,8), %rsi
	movq	$-8192, %rdi            # imm = 0xFFFFFFFFFFFFE000
	movq	%r8, %rax
	.p2align	4, 0x90
.LBB1_4:                                # %polly.stmt.for.body8
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	B+8192(%rdi,%rcx,8), %rbx
.Ltmp13:
	.loc	1 25 45 prologue_end    # MatrixMult.c:25:45
	imulq	-8(%rax), %rbx
	.loc	1 25 35 is_stmt 0       # MatrixMult.c:25:35
	addq	%rsi, %rbx
	movq	B+8448(%rdi,%rcx,8), %rsi
	.loc	1 25 45                 # MatrixMult.c:25:45
	imulq	(%rax), %rsi
	.loc	1 25 35                 # MatrixMult.c:25:35
	addq	%rbx, %rsi
	addq	$16, %rax
	addq	$512, %rdi              # imm = 0x200
	jne	.LBB1_4
.Ltmp14:
# BB#5:                                 # %polly.loop_exit22
                                        #   in Loop: Header=BB1_6 Depth=2
	movq	%rsi, (%rdx)
	incq	%rcx
	cmpq	$32, %rcx
	jne	.LBB1_6
# BB#2:                                 # %polly.loop_exit16
                                        #   in Loop: Header=BB1_1 Depth=1
	incq	%r14
	addq	$256, %r8               # imm = 0x100
	cmpq	$32, %r14
	jne	.LBB1_1
# BB#3:                                 # %polly.exiting
	.loc	1 29 1 is_stmt 1        # MatrixMult.c:29:1
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Ltmp15:
.Lfunc_end1:
	.size	mat_mult, .Lfunc_end1-mat_mult
	.cfi_endproc

	.globl	print_array
	.p2align	4, 0x90
	.type	print_array,@function
print_array:                            # @print_array
.Lfunc_begin2:
	.loc	1 32 0                  # MatrixMult.c:32:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp16:
	.cfi_def_cfa_offset 16
.Ltmp17:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp18:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
.Ltmp19:
	.cfi_offset %rbx, -48
.Ltmp20:
	.cfi_offset %r12, -40
.Ltmp21:
	.cfi_offset %r14, -32
.Ltmp22:
	.cfi_offset %r15, -24
	movl	$C, %r14d
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB2_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
.Ltmp23:
	.loc	1 37 21 prologue_end    # MatrixMult.c:37:21
	movq	stdout(%rip), %rcx
	movq	%r14, %rbx
	movl	$32, %r12d
	.p2align	4, 0x90
.LBB2_2:                                # %for.body3
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 37 38 is_stmt 0       # MatrixMult.c:37:38
	movq	(%rbx), %rdx
	.loc	1 37 13                 # MatrixMult.c:37:13
	movl	$.L.str, %esi
	xorl	%eax, %eax
	movq	%rcx, %rdi
	callq	fprintf
	.loc	1 37 21                 # MatrixMult.c:37:21
	movq	stdout(%rip), %rcx
.Ltmp24:
	.loc	1 36 9 is_stmt 1 discriminator 1 # MatrixMult.c:36:9
	addq	$8, %rbx
	decq	%r12
	jne	.LBB2_2
.Ltmp25:
# BB#3:                                 # %for.end
                                        #   in Loop: Header=BB2_1 Depth=1
	.loc	1 40 9                  # MatrixMult.c:40:9
	movl	$10, %edi
	movq	%rcx, %rsi
	callq	fputc
.Ltmp26:
	.loc	1 35 5 discriminator 1  # MatrixMult.c:35:5
	incq	%r15
	addq	$256, %r14              # imm = 0x100
	cmpq	$32, %r15
	jne	.LBB2_1
.Ltmp27:
# BB#4:                                 # %for.end11
	.loc	1 42 1                  # MatrixMult.c:42:1
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp28:
.Lfunc_end2:
	.size	print_array, .Lfunc_end2-print_array
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI3_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin3:
	.loc	1 45 0                  # MatrixMult.c:45:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp29:
	.cfi_def_cfa_offset 16
.Ltmp30:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp31:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
.Ltmp32:
	.cfi_offset %rbx, -32
.Ltmp33:
	.cfi_offset %r14, -24
	xorl	%r14d, %r14d
.Ltmp34:
	.loc	1 13 21 prologue_end    # MatrixMult.c:13:21
	movaps	.LCPI3_0(%rip), %xmm0   # xmm0 = [1,1]
	.p2align	4, 0x90
.LBB3_1:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_2 Depth 2
                                        #     Child Loop BB3_6 Depth 2
                                        #       Child Loop BB3_7 Depth 3
                                        #         Child Loop BB3_8 Depth 4
	movq	$-8192, %rax            # imm = 0xFFFFFFFFFFFFE000
.Ltmp35:
	#DEBUG_VALUE: init_array:i <- 0
	.p2align	4, 0x90
.LBB3_2:                                # %vector.body
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movaps	%xmm0, A+8192(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8192(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8208(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8208(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8224(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8224(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8240(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8240(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8256(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8256(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8272(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8272(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8288(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8288(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8304(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8304(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8320(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8320(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8336(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8336(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8352(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8352(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8368(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8368(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8384(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8384(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8400(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8400(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8416(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8416(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8432(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8432(%rax)
.Ltmp36:
	.loc	1 11 5 discriminator 1  # MatrixMult.c:11:5
	addq	$256, %rax              # imm = 0x100
	jne	.LBB3_2
.Ltmp37:
# BB#3:                                 # %init_array.exit
                                        #   in Loop: Header=BB3_1 Depth=1
	#DEBUG_VALUE: mat_mult:i <- 0
	.loc	1 52 9                  # MatrixMult.c:52:9
	movl	$C, %edi
	xorl	%esi, %esi
	movl	$8192, %edx             # imm = 0x2000
	callq	memset
	movl	$A+8, %r8d
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB3_6:                                # %polly.loop_preheader15.i
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_7 Depth 3
                                        #         Child Loop BB3_8 Depth 4
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB3_7:                                # %polly.loop_preheader21.i
                                        #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_6 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB3_8 Depth 4
	movq	%r9, %rax
	shlq	$8, %rax
	leaq	C(%rax,%rdx,8), %rsi
	movq	C(%rax,%rdx,8), %rdi
	movq	$-8192, %rbx            # imm = 0xFFFFFFFFFFFFE000
	movq	%r8, %rax
	.p2align	4, 0x90
.LBB3_8:                                # %polly.stmt.for.body8.i
                                        #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_6 Depth=2
                                        #       Parent Loop BB3_7 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	B+8192(%rbx,%rdx,8), %rcx
.Ltmp38:
	.loc	1 25 45                 # MatrixMult.c:25:45
	imulq	-8(%rax), %rcx
	.loc	1 25 35 is_stmt 0       # MatrixMult.c:25:35
	addq	%rdi, %rcx
.Ltmp39:
	.loc	1 52 9 is_stmt 1        # MatrixMult.c:52:9
	movq	B+8448(%rbx,%rdx,8), %rdi
.Ltmp40:
	.loc	1 25 45                 # MatrixMult.c:25:45
	imulq	(%rax), %rdi
	.loc	1 25 35 is_stmt 0       # MatrixMult.c:25:35
	addq	%rcx, %rdi
.Ltmp41:
	.loc	1 52 9 is_stmt 1        # MatrixMult.c:52:9
	addq	$16, %rax
	addq	$512, %rbx              # imm = 0x200
	jne	.LBB3_8
# BB#4:                                 # %polly.loop_exit22.i
                                        #   in Loop: Header=BB3_7 Depth=3
	movq	%rdi, (%rsi)
	incq	%rdx
	cmpq	$32, %rdx
	jne	.LBB3_7
# BB#5:                                 # %polly.loop_exit16.i
                                        #   in Loop: Header=BB3_6 Depth=2
	incq	%r9
	addq	$256, %r8               # imm = 0x100
	cmpq	$32, %r9
	jne	.LBB3_6
.Ltmp42:
# BB#9:                                 # %mat_mult.exit
                                        #   in Loop: Header=BB3_1 Depth=1
	.loc	1 50 22 discriminator 2 # MatrixMult.c:50:22
	incl	%r14d
.Ltmp43:
	#DEBUG_VALUE: main:r <- %R14D
	.loc	1 50 5 is_stmt 0 discriminator 1 # MatrixMult.c:50:5
	cmpl	$10000, %r14d           # imm = 0x2710
.Ltmp44:
	.loc	1 13 21 is_stmt 1       # MatrixMult.c:13:21
	movaps	.LCPI3_0(%rip), %xmm0   # xmm0 = [1,1]
	jne	.LBB3_1
.Ltmp45:
# BB#10:                                # %for.end
	#DEBUG_VALUE: main:r <- %R14D
	.loc	1 55 71                 # MatrixMult.c:55:71
	movq	C+8184(%rip), %rcx
	.loc	1 55 5 is_stmt 0        # MatrixMult.c:55:5
	movl	$.L.str.2, %edi
	movl	$32, %esi
	movl	$32, %edx
	xorl	%eax, %eax
	callq	printf
	.loc	1 56 5 is_stmt 1        # MatrixMult.c:56:5
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
.Ltmp46:
	popq	%rbp
	retq
.Ltmp47:
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc

	.type	A,@object               # @A
	.comm	A,8192,16
	.type	B,@object               # @B
	.comm	B,8192,16
	.type	C,@object               # @C
	.comm	C,8192,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%lld "
	.size	.L.str, 6

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"Pass %d X %d matrix test case (C[N][N] =%lld) \n "
	.size	.L.str.2, 49

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
	.asciz	"long long int"         # string offset=247
.Linfo_string5:
	.asciz	"sizetype"              # string offset=261
.Linfo_string6:
	.asciz	"B"                     # string offset=270
.Linfo_string7:
	.asciz	"C"                     # string offset=272
.Linfo_string8:
	.asciz	"init_array"            # string offset=274
.Linfo_string9:
	.asciz	"i"                     # string offset=285
.Linfo_string10:
	.asciz	"int"                   # string offset=287
.Linfo_string11:
	.asciz	"mat_mult"              # string offset=291
.Linfo_string12:
	.asciz	"print_array"           # string offset=300
.Linfo_string13:
	.asciz	"main"                  # string offset=312
.Linfo_string14:
	.asciz	"r"                     # string offset=317
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	94                      # super-register DW_OP_reg14
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
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	49                      # DW_AT_abstract_origin
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
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	49                      # DW_AT_abstract_origin
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
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	14                      # Abbreviation Code
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
	.byte	3                       # Abbrev [3] 0x3f:0x12 DW_TAG_array_type
	.long	81                      # DW_AT_type
	.byte	4                       # Abbrev [4] 0x44:0x6 DW_TAG_subrange_type
	.long	88                      # DW_AT_type
	.byte	32                      # DW_AT_count
	.byte	4                       # Abbrev [4] 0x4a:0x6 DW_TAG_subrange_type
	.long	88                      # DW_AT_type
	.byte	32                      # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x51:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	6                       # Abbrev [6] 0x58:0x7 DW_TAG_base_type
	.long	.Linfo_string5          # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	2                       # Abbrev [2] 0x5f:0x15 DW_TAG_variable
	.long	.Linfo_string6          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	B
	.byte	2                       # Abbrev [2] 0x74:0x15 DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	C
	.byte	7                       # Abbrev [7] 0x89:0x13 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	203                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x9c:0x1a DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	230                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0xaf:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	238                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	10                      # Abbrev [10] 0xb6:0x15 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
                                        # DW_AT_external
	.byte	11                      # Abbrev [11] 0xcb:0x14 DW_TAG_subprogram
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	12                      # Abbrev [12] 0xd3:0xb DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	223                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0xdf:0x7 DW_TAG_base_type
	.long	.Linfo_string10         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	11                      # Abbrev [11] 0xe6:0x14 DW_TAG_subprogram
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	12                      # Abbrev [12] 0xee:0xb DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	20                      # DW_AT_decl_line
	.long	223                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	13                      # Abbrev [13] 0xfa:0x4d DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
	.long	223                     # DW_AT_type
                                        # DW_AT_external
	.byte	14                      # Abbrev [14] 0x113:0xf DW_TAG_variable
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	49                      # DW_AT_decl_line
	.long	223                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x122:0x12 DW_TAG_inlined_subroutine
	.long	203                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	51                      # DW_AT_call_line
	.byte	9                       # Abbrev [9] 0x12d:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	211                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	15                      # Abbrev [15] 0x134:0x12 DW_TAG_inlined_subroutine
	.long	230                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges1         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	52                      # DW_AT_call_line
	.byte	9                       # Abbrev [9] 0x13f:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	238                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Ltmp37-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	0
	.quad	0
.Ldebug_ranges1:
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
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
	.long	328                     # Compilation Unit Length
	.long	42                      # DIE offset
	.asciz	"A"                     # External Name
	.long	95                      # DIE offset
	.asciz	"B"                     # External Name
	.long	116                     # DIE offset
	.asciz	"C"                     # External Name
	.long	230                     # DIE offset
	.asciz	"mat_mult"              # External Name
	.long	203                     # DIE offset
	.asciz	"init_array"            # External Name
	.long	250                     # DIE offset
	.asciz	"main"                  # External Name
	.long	182                     # DIE offset
	.asciz	"print_array"           # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	328                     # Compilation Unit Length
	.long	81                      # DIE offset
	.asciz	"long long int"         # External Name
	.long	223                     # DIE offset
	.asciz	"int"                   # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
