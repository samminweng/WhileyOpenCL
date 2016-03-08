	.text
	.file	"MatrixAdd.polly.ll"
	.file	1 "MatrixAdd.c"
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
	.loc	1 8 0                   # MatrixAdd.c:8:0
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
	xorl	%eax, %eax
.Ltmp3:
	.loc	1 13 21 prologue_end    # MatrixAdd.c:13:21
	movaps	.LCPI0_0(%rip), %xmm0   # xmm0 = [1,1]
	xorl	%ecx, %ecx
.Ltmp4:
	.p2align	4, 0x90
.LBB0_1:                                # %vector.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	.loc	1 12 9 discriminator 1  # MatrixAdd.c:12:9
	movq	%rax, %rdx
	movl	$1024, %esi             # imm = 0x400
	.p2align	4, 0x90
.LBB0_2:                                # %vector.body
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp5:
	.loc	1 13 21                 # MatrixAdd.c:13:21
	movaps	%xmm0, A(%rdx)
	movaps	%xmm0, A+16(%rdx)
	.loc	1 14 21                 # MatrixAdd.c:14:21
	movaps	%xmm0, B(%rdx)
	movaps	%xmm0, B+16(%rdx)
	.loc	1 13 21                 # MatrixAdd.c:13:21
	movaps	%xmm0, A+32(%rdx)
	movaps	%xmm0, A+48(%rdx)
	.loc	1 14 21                 # MatrixAdd.c:14:21
	movaps	%xmm0, B+32(%rdx)
	movaps	%xmm0, B+48(%rdx)
.Ltmp6:
	.loc	1 12 9 discriminator 1  # MatrixAdd.c:12:9
	addq	$64, %rdx
	addq	$-8, %rsi
	jne	.LBB0_2
.Ltmp7:
# BB#3:                                 # %for.inc10
                                        #   in Loop: Header=BB0_1 Depth=1
	.loc	1 11 5 discriminator 1  # MatrixAdd.c:11:5
	incq	%rcx
	addq	$8192, %rax             # imm = 0x2000
	cmpq	$1024, %rcx             # imm = 0x400
	jne	.LBB0_1
.Ltmp8:
# BB#4:                                 # %for.end12
	.loc	1 17 1                  # MatrixAdd.c:17:1
	popq	%rbp
	retq
.Ltmp9:
.Lfunc_end0:
	.size	init_array, .Lfunc_end0-init_array
	.cfi_endproc

	.globl	mat_add
	.p2align	4, 0x90
	.type	mat_add,@function
mat_add:                                # @mat_add
.Lfunc_begin1:
	.loc	1 19 0                  # MatrixAdd.c:19:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp10:
	.cfi_def_cfa_offset 16
.Ltmp11:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp12:
	.cfi_def_cfa_register %rbp
	xorl	%r8d, %r8d
	movl	$240, %ecx
	.p2align	4, 0x90
.LBB1_1:                                # %polly.loop_preheader2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
                                        #       Child Loop BB1_3 Depth 3
	movq	%rcx, %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB1_2:                                # %polly.loop_preheader8
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_3 Depth 3
	movq	%rdx, %rdi
	movl	$32, %eax
	.p2align	4, 0x90
.LBB1_3:                                # %vector.body
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movdqa	B-240(%rdi), %xmm0
.Ltmp13:
	.loc	1 23 31 prologue_end    # MatrixAdd.c:23:31
	paddq	A-240(%rdi), %xmm0
	movdqa	%xmm0, C-240(%rdi)
	movdqa	B-224(%rdi), %xmm0
	paddq	A-224(%rdi), %xmm0
	movdqa	%xmm0, C-224(%rdi)
	movdqa	B-208(%rdi), %xmm0
	paddq	A-208(%rdi), %xmm0
	movdqa	%xmm0, C-208(%rdi)
	movdqa	B-192(%rdi), %xmm0
	paddq	A-192(%rdi), %xmm0
	movdqa	%xmm0, C-192(%rdi)
	movdqa	B-176(%rdi), %xmm0
	paddq	A-176(%rdi), %xmm0
	movdqa	%xmm0, C-176(%rdi)
	movdqa	B-160(%rdi), %xmm0
	paddq	A-160(%rdi), %xmm0
	movdqa	%xmm0, C-160(%rdi)
	movdqa	B-144(%rdi), %xmm0
	paddq	A-144(%rdi), %xmm0
	movdqa	%xmm0, C-144(%rdi)
	movdqa	B-128(%rdi), %xmm0
	paddq	A-128(%rdi), %xmm0
	movdqa	%xmm0, C-128(%rdi)
	movdqa	B-112(%rdi), %xmm0
	paddq	A-112(%rdi), %xmm0
	movdqa	%xmm0, C-112(%rdi)
	movdqa	B-96(%rdi), %xmm0
	paddq	A-96(%rdi), %xmm0
	movdqa	%xmm0, C-96(%rdi)
	movdqa	B-80(%rdi), %xmm0
	paddq	A-80(%rdi), %xmm0
	movdqa	%xmm0, C-80(%rdi)
	movdqa	B-64(%rdi), %xmm0
	paddq	A-64(%rdi), %xmm0
	movdqa	%xmm0, C-64(%rdi)
	movdqa	B-48(%rdi), %xmm0
	paddq	A-48(%rdi), %xmm0
	movdqa	%xmm0, C-48(%rdi)
	movdqa	B-32(%rdi), %xmm0
	paddq	A-32(%rdi), %xmm0
	movdqa	%xmm0, C-32(%rdi)
	movdqa	B-16(%rdi), %xmm0
	paddq	A-16(%rdi), %xmm0
	movdqa	%xmm0, C-16(%rdi)
	movdqa	B(%rdi), %xmm0
	paddq	A(%rdi), %xmm0
	movdqa	%xmm0, C(%rdi)
	addq	$8192, %rdi             # imm = 0x2000
	decq	%rax
	jne	.LBB1_3
.Ltmp14:
# BB#4:                                 # %polly.loop_exit9
                                        #   in Loop: Header=BB1_2 Depth=2
	incq	%rsi
	addq	$256, %rdx              # imm = 0x100
	cmpq	$32, %rsi
	jne	.LBB1_2
# BB#5:                                 # %polly.loop_exit3
                                        #   in Loop: Header=BB1_1 Depth=1
	incq	%r8
	addq	$262144, %rcx           # imm = 0x40000
	cmpq	$32, %r8
	jne	.LBB1_1
# BB#6:                                 # %polly.exiting
	.loc	1 27 1                  # MatrixAdd.c:27:1
	popq	%rbp
	retq
.Ltmp15:
.Lfunc_end1:
	.size	mat_add, .Lfunc_end1-mat_add
	.cfi_endproc

	.globl	print_array
	.p2align	4, 0x90
	.type	print_array,@function
print_array:                            # @print_array
.Lfunc_begin2:
	.loc	1 30 0                  # MatrixAdd.c:30:0
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
	.loc	1 35 21 prologue_end    # MatrixAdd.c:35:21
	movq	stdout(%rip), %rcx
	movq	%r14, %r12
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB2_2:                                # %for.body3
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 35 38 is_stmt 0       # MatrixAdd.c:35:38
	movq	(%r12), %rdx
	.loc	1 35 13                 # MatrixAdd.c:35:13
	movl	$.L.str, %esi
	xorl	%eax, %eax
	movq	%rcx, %rdi
	callq	fprintf
.Ltmp24:
	.loc	1 36 18 is_stmt 1       # MatrixAdd.c:36:18
	movslq	%ebx, %rax
	imulq	$1717986919, %rax, %rcx # imm = 0x66666667
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	shll	$4, %ecx
	leal	(%rcx,%rcx,4), %ecx
	subl	%ecx, %eax
.Ltmp25:
	.loc	1 36 17 is_stmt 0       # MatrixAdd.c:36:17
	cmpl	$79, %eax
	jne	.LBB2_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB2_2 Depth=2
.Ltmp26:
	.loc	1 36 37 discriminator 1 # MatrixAdd.c:36:37
	movq	stdout(%rip), %rsi
	.loc	1 36 29 discriminator 1 # MatrixAdd.c:36:29
	movl	$10, %edi
	callq	fputc
.Ltmp27:
.LBB2_4:                                # %for.inc
                                        #   in Loop: Header=BB2_2 Depth=2
	.loc	1 34 9 is_stmt 1 discriminator 1 # MatrixAdd.c:34:9
	incq	%rbx
.Ltmp28:
	.loc	1 35 21                 # MatrixAdd.c:35:21
	movq	stdout(%rip), %rcx
.Ltmp29:
	.loc	1 34 9 discriminator 1  # MatrixAdd.c:34:9
	addq	$8, %r12
	cmpq	$1024, %rbx             # imm = 0x400
	jne	.LBB2_2
.Ltmp30:
# BB#5:                                 # %for.end
                                        #   in Loop: Header=BB2_1 Depth=1
	.loc	1 38 9                  # MatrixAdd.c:38:9
	movl	$10, %edi
	movq	%rcx, %rsi
	callq	fputc
.Ltmp31:
	.loc	1 33 5 discriminator 1  # MatrixAdd.c:33:5
	incq	%r15
	addq	$8192, %r14             # imm = 0x2000
	cmpq	$1024, %r15             # imm = 0x400
	jne	.LBB2_1
.Ltmp32:
# BB#6:                                 # %for.end11
	.loc	1 40 1                  # MatrixAdd.c:40:1
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp33:
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
	.loc	1 43 0                  # MatrixAdd.c:43:0
	.cfi_startproc
# BB#0:                                 # %entry
	xorl	%r8d, %r8d
.Ltmp34:
	.loc	1 13 21 prologue_end    # MatrixAdd.c:13:21
	movaps	.LCPI3_0(%rip), %xmm0   # xmm0 = [1,1]
.Ltmp35:
	.p2align	4, 0x90
.LBB3_1:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_2 Depth 2
                                        #       Child Loop BB3_3 Depth 3
                                        #     Child Loop BB3_7 Depth 2
                                        #       Child Loop BB3_8 Depth 3
                                        #         Child Loop BB3_9 Depth 4
	#DEBUG_VALUE: init_array:i <- 0
	.loc	1 49 9                  # MatrixAdd.c:49:9
	xorl	%eax, %eax
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB3_2:                                # %vector.ph9
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_3 Depth 3
	movq	%rax, %rcx
	movl	$1024, %esi             # imm = 0x400
	.p2align	4, 0x90
.LBB3_3:                                # %vector.body5
                                        #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
.Ltmp36:
	.loc	1 13 21                 # MatrixAdd.c:13:21
	movaps	%xmm0, A(%rcx)
	movaps	%xmm0, A+16(%rcx)
	.loc	1 14 21                 # MatrixAdd.c:14:21
	movaps	%xmm0, B(%rcx)
	movaps	%xmm0, B+16(%rcx)
	.loc	1 13 21                 # MatrixAdd.c:13:21
	movaps	%xmm0, A+32(%rcx)
	movaps	%xmm0, A+48(%rcx)
	.loc	1 14 21                 # MatrixAdd.c:14:21
	movaps	%xmm0, B+32(%rcx)
	movaps	%xmm0, B+48(%rcx)
.Ltmp37:
	.loc	1 12 9 discriminator 1  # MatrixAdd.c:12:9
	addq	$64, %rcx
	addq	$-8, %rsi
	jne	.LBB3_3
.Ltmp38:
# BB#4:                                 # %for.inc10.i
                                        #   in Loop: Header=BB3_2 Depth=2
	.loc	1 11 5 discriminator 1  # MatrixAdd.c:11:5
	incq	%rdx
	addq	$8192, %rax             # imm = 0x2000
	cmpq	$1024, %rdx             # imm = 0x400
.Ltmp39:
	.loc	1 50 9                  # MatrixAdd.c:50:9
	movl	$240, %ecx
	movl	$0, %r9d
	jne	.LBB3_2
	.p2align	4, 0x90
.LBB3_7:                                # %polly.loop_preheader2.i
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_8 Depth 3
                                        #         Child Loop BB3_9 Depth 4
	movq	%rcx, %rax
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB3_8:                                # %polly.loop_preheader8.i
                                        #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_7 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB3_9 Depth 4
	movq	%rax, %rsi
	movl	$32, %edx
	.p2align	4, 0x90
.LBB3_9:                                # %vector.body
                                        #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_7 Depth=2
                                        #       Parent Loop BB3_8 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movdqa	B-240(%rsi), %xmm1
.Ltmp40:
	.loc	1 23 31                 # MatrixAdd.c:23:31
	paddq	A-240(%rsi), %xmm1
.Ltmp41:
	.loc	1 50 9                  # MatrixAdd.c:50:9
	movdqa	%xmm1, C-240(%rsi)
	movdqa	B-224(%rsi), %xmm1
.Ltmp42:
	.loc	1 23 31                 # MatrixAdd.c:23:31
	paddq	A-224(%rsi), %xmm1
.Ltmp43:
	.loc	1 50 9                  # MatrixAdd.c:50:9
	movdqa	%xmm1, C-224(%rsi)
	movdqa	B-208(%rsi), %xmm1
.Ltmp44:
	.loc	1 23 31                 # MatrixAdd.c:23:31
	paddq	A-208(%rsi), %xmm1
.Ltmp45:
	.loc	1 50 9                  # MatrixAdd.c:50:9
	movdqa	%xmm1, C-208(%rsi)
	movdqa	B-192(%rsi), %xmm1
.Ltmp46:
	.loc	1 23 31                 # MatrixAdd.c:23:31
	paddq	A-192(%rsi), %xmm1
.Ltmp47:
	.loc	1 50 9                  # MatrixAdd.c:50:9
	movdqa	%xmm1, C-192(%rsi)
	movdqa	B-176(%rsi), %xmm1
.Ltmp48:
	.loc	1 23 31                 # MatrixAdd.c:23:31
	paddq	A-176(%rsi), %xmm1
.Ltmp49:
	.loc	1 50 9                  # MatrixAdd.c:50:9
	movdqa	%xmm1, C-176(%rsi)
	movdqa	B-160(%rsi), %xmm1
.Ltmp50:
	.loc	1 23 31                 # MatrixAdd.c:23:31
	paddq	A-160(%rsi), %xmm1
.Ltmp51:
	.loc	1 50 9                  # MatrixAdd.c:50:9
	movdqa	%xmm1, C-160(%rsi)
	movdqa	B-144(%rsi), %xmm1
.Ltmp52:
	.loc	1 23 31                 # MatrixAdd.c:23:31
	paddq	A-144(%rsi), %xmm1
.Ltmp53:
	.loc	1 50 9                  # MatrixAdd.c:50:9
	movdqa	%xmm1, C-144(%rsi)
	movdqa	B-128(%rsi), %xmm1
.Ltmp54:
	.loc	1 23 31                 # MatrixAdd.c:23:31
	paddq	A-128(%rsi), %xmm1
.Ltmp55:
	.loc	1 50 9                  # MatrixAdd.c:50:9
	movdqa	%xmm1, C-128(%rsi)
	movdqa	B-112(%rsi), %xmm1
.Ltmp56:
	.loc	1 23 31                 # MatrixAdd.c:23:31
	paddq	A-112(%rsi), %xmm1
.Ltmp57:
	.loc	1 50 9                  # MatrixAdd.c:50:9
	movdqa	%xmm1, C-112(%rsi)
	movdqa	B-96(%rsi), %xmm1
.Ltmp58:
	.loc	1 23 31                 # MatrixAdd.c:23:31
	paddq	A-96(%rsi), %xmm1
.Ltmp59:
	.loc	1 50 9                  # MatrixAdd.c:50:9
	movdqa	%xmm1, C-96(%rsi)
	movdqa	B-80(%rsi), %xmm1
.Ltmp60:
	.loc	1 23 31                 # MatrixAdd.c:23:31
	paddq	A-80(%rsi), %xmm1
.Ltmp61:
	.loc	1 50 9                  # MatrixAdd.c:50:9
	movdqa	%xmm1, C-80(%rsi)
	movdqa	B-64(%rsi), %xmm1
.Ltmp62:
	.loc	1 23 31                 # MatrixAdd.c:23:31
	paddq	A-64(%rsi), %xmm1
.Ltmp63:
	.loc	1 50 9                  # MatrixAdd.c:50:9
	movdqa	%xmm1, C-64(%rsi)
	movdqa	B-48(%rsi), %xmm1
.Ltmp64:
	.loc	1 23 31                 # MatrixAdd.c:23:31
	paddq	A-48(%rsi), %xmm1
.Ltmp65:
	.loc	1 50 9                  # MatrixAdd.c:50:9
	movdqa	%xmm1, C-48(%rsi)
	movdqa	B-32(%rsi), %xmm1
.Ltmp66:
	.loc	1 23 31                 # MatrixAdd.c:23:31
	paddq	A-32(%rsi), %xmm1
.Ltmp67:
	.loc	1 50 9                  # MatrixAdd.c:50:9
	movdqa	%xmm1, C-32(%rsi)
	movdqa	B-16(%rsi), %xmm1
.Ltmp68:
	.loc	1 23 31                 # MatrixAdd.c:23:31
	paddq	A-16(%rsi), %xmm1
.Ltmp69:
	.loc	1 50 9                  # MatrixAdd.c:50:9
	movdqa	%xmm1, C-16(%rsi)
	movdqa	B(%rsi), %xmm1
.Ltmp70:
	.loc	1 23 31                 # MatrixAdd.c:23:31
	paddq	A(%rsi), %xmm1
.Ltmp71:
	.loc	1 50 9                  # MatrixAdd.c:50:9
	movdqa	%xmm1, C(%rsi)
	addq	$8192, %rsi             # imm = 0x2000
	decq	%rdx
	jne	.LBB3_9
# BB#5:                                 # %polly.loop_exit9.i
                                        #   in Loop: Header=BB3_8 Depth=3
	incq	%rdi
	addq	$256, %rax              # imm = 0x100
	cmpq	$32, %rdi
	jne	.LBB3_8
# BB#6:                                 # %polly.loop_exit3.i
                                        #   in Loop: Header=BB3_7 Depth=2
	incq	%r9
	addq	$262144, %rcx           # imm = 0x40000
	cmpq	$32, %r9
	jne	.LBB3_7
.Ltmp72:
# BB#10:                                # %mat_add.exit
                                        #   in Loop: Header=BB3_1 Depth=1
	.loc	1 48 20 discriminator 2 # MatrixAdd.c:48:20
	incl	%r8d
.Ltmp73:
	#DEBUG_VALUE: main:r <- %R8D
	.loc	1 48 5 is_stmt 0 discriminator 1 # MatrixAdd.c:48:5
	cmpl	$100, %r8d
	jne	.LBB3_1
.Ltmp74:
# BB#11:                                # %for.end
	#DEBUG_VALUE: main:r <- %R8D
	pushq	%rbp
.Ltmp75:
	.cfi_def_cfa_offset 16
.Ltmp76:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp77:
	.cfi_def_cfa_register %rbp
	.loc	1 53 83 is_stmt 1       # MatrixAdd.c:53:83
	movq	C+8388600(%rip), %r9
	.loc	1 53 5 is_stmt 0        # MatrixAdd.c:53:5
	movl	$.L.str.2, %edi
	movl	$1024, %esi             # imm = 0x400
	movl	$1024, %edx             # imm = 0x400
	movl	$1023, %ecx             # imm = 0x3FF
	movl	$1023, %r8d             # imm = 0x3FF
.Ltmp78:
	xorl	%eax, %eax
	callq	printf
	.loc	1 54 5 is_stmt 1        # MatrixAdd.c:54:5
	xorl	%eax, %eax
	popq	%rbp
	retq
.Ltmp79:
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc

	.type	A,@object               # @A
	.comm	A,8388608,16
	.type	B,@object               # @B
	.comm	B,8388608,16
	.type	C,@object               # @C
	.comm	C,8388608,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%lld "
	.size	.L.str, 6

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"Pass %d X %d matrix test case (C[%d][%d] =%lld) \n "
	.size	.L.str.2, 51

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
	.asciz	"long long int"         # string offset=245
.Linfo_string5:
	.asciz	"sizetype"              # string offset=259
.Linfo_string6:
	.asciz	"B"                     # string offset=268
.Linfo_string7:
	.asciz	"C"                     # string offset=270
.Linfo_string8:
	.asciz	"init_array"            # string offset=272
.Linfo_string9:
	.asciz	"i"                     # string offset=283
.Linfo_string10:
	.asciz	"int"                   # string offset=285
.Linfo_string11:
	.asciz	"mat_add"               # string offset=289
.Linfo_string12:
	.asciz	"print_array"           # string offset=297
.Linfo_string13:
	.asciz	"main"                  # string offset=309
.Linfo_string14:
	.asciz	"r"                     # string offset=314
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp78-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	88                      # super-register DW_OP_reg8
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
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
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
	.byte	9                       # Abbreviation Code
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
	.byte	13                      # Abbreviation Code
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
	.byte	14                      # Abbreviation Code
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
	.byte	15                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	16                      # Abbreviation Code
	.byte	29                      # DW_TAG_inlined_subroutine
	.byte	0                       # DW_CHILDREN_no
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
	.long	300                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x125 DW_TAG_compile_unit
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
	.byte	3                       # Abbrev [3] 0x3f:0x14 DW_TAG_array_type
	.long	83                      # DW_AT_type
	.byte	4                       # Abbrev [4] 0x44:0x7 DW_TAG_subrange_type
	.long	90                      # DW_AT_type
	.short	1024                    # DW_AT_count
	.byte	4                       # Abbrev [4] 0x4b:0x7 DW_TAG_subrange_type
	.long	90                      # DW_AT_type
	.short	1024                    # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x53:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
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
	.byte	7                       # Abbrev [7] 0x8b:0x13 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	198                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x9e:0x13 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	225                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0xb1:0x15 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	29                      # DW_AT_decl_line
                                        # DW_AT_external
	.byte	9                       # Abbrev [9] 0xc6:0x14 DW_TAG_subprogram
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	10                      # Abbrev [10] 0xce:0xb DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0xda:0x7 DW_TAG_base_type
	.long	.Linfo_string10         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	11                      # Abbrev [11] 0xe1:0x8 DW_TAG_subprogram
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	12                      # Abbrev [12] 0xe9:0x46 DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	42                      # DW_AT_decl_line
	.long	218                     # DW_AT_type
                                        # DW_AT_external
	.byte	13                      # Abbrev [13] 0x102:0xf DW_TAG_variable
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	47                      # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x111:0x12 DW_TAG_inlined_subroutine
	.long	198                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	49                      # DW_AT_call_line
	.byte	15                      # Abbrev [15] 0x11c:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	206                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	16                      # Abbrev [16] 0x123:0xb DW_TAG_inlined_subroutine
	.long	225                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges1         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	50                      # DW_AT_call_line
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	0
	.quad	0
.Ldebug_ranges1:
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.quad	.Ltmp61-.Lfunc_begin0
	.quad	.Ltmp62-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Ltmp64-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
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
	.long	304                     # Compilation Unit Length
	.long	42                      # DIE offset
	.asciz	"A"                     # External Name
	.long	97                      # DIE offset
	.asciz	"B"                     # External Name
	.long	118                     # DIE offset
	.asciz	"C"                     # External Name
	.long	198                     # DIE offset
	.asciz	"init_array"            # External Name
	.long	233                     # DIE offset
	.asciz	"main"                  # External Name
	.long	225                     # DIE offset
	.asciz	"mat_add"               # External Name
	.long	177                     # DIE offset
	.asciz	"print_array"           # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	304                     # Compilation Unit Length
	.long	83                      # DIE offset
	.asciz	"long long int"         # External Name
	.long	218                     # DIE offset
	.asciz	"int"                   # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
