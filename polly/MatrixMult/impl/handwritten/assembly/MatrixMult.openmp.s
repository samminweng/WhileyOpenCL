	.text
	.file	"MatrixMult.openmp.ll"
	.file	1 "MatrixMult.c"
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
	pushq	%rbx
	pushq	%rax
.Ltmp3:
	.cfi_offset %rbx, -24
.Ltmp4:
	#DEBUG_VALUE: init_array:i <- 0
	leaq	-16(%rbp), %rbx
	movl	$init_array_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$32, %r8d
	movl	$1, %r9d
	movq	%rbx, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	init_array_polly_subfn
	callq	GOMP_parallel_end
.Ltmp5:
	.loc	1 17 1 prologue_end     # MatrixMult.c:17:1
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Ltmp6:
.Lfunc_end0:
	.size	init_array, .Lfunc_end0-init_array
	.cfi_endproc

	.globl	print_array
	.p2align	4, 0x90
	.type	print_array,@function
print_array:                            # @print_array
.Lfunc_begin1:
	.loc	1 20 0                  # MatrixMult.c:20:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp7:
	.cfi_def_cfa_offset 16
.Ltmp8:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp9:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
.Ltmp10:
	.cfi_offset %rbx, -48
.Ltmp11:
	.cfi_offset %r12, -40
.Ltmp12:
	.cfi_offset %r14, -32
.Ltmp13:
	.cfi_offset %r15, -24
	movl	$C, %r14d
.Ltmp14:
	#DEBUG_VALUE: print_array:i <- 0
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB1_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
.Ltmp15:
	.loc	1 25 21 prologue_end    # MatrixMult.c:25:21
	movq	stdout(%rip), %rcx
	movq	%r14, %r12
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB1_2:                                # %for.body3
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 25 38 is_stmt 0       # MatrixMult.c:25:38
	movq	(%r12), %rdx
	.loc	1 25 13                 # MatrixMult.c:25:13
	movl	$.L.str, %esi
	xorl	%eax, %eax
	movq	%rcx, %rdi
	callq	fprintf
.Ltmp16:
	.loc	1 26 18 is_stmt 1       # MatrixMult.c:26:18
	movslq	%ebx, %rax
	imulq	$1717986919, %rax, %rcx # imm = 0x66666667
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	shll	$4, %ecx
	leal	(%rcx,%rcx,4), %ecx
	subl	%ecx, %eax
.Ltmp17:
	.loc	1 26 17 is_stmt 0       # MatrixMult.c:26:17
	cmpl	$79, %eax
	jne	.LBB1_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB1_2 Depth=2
.Ltmp18:
	.loc	1 26 37 discriminator 1 # MatrixMult.c:26:37
	movq	stdout(%rip), %rsi
	.loc	1 26 29 discriminator 1 # MatrixMult.c:26:29
	movl	$10, %edi
	callq	fputc
.Ltmp19:
.LBB1_4:                                # %for.inc
                                        #   in Loop: Header=BB1_2 Depth=2
	.loc	1 24 9 is_stmt 1 discriminator 1 # MatrixMult.c:24:9
	incq	%rbx
.Ltmp20:
	.loc	1 25 21                 # MatrixMult.c:25:21
	movq	stdout(%rip), %rcx
.Ltmp21:
	.loc	1 24 9 discriminator 1  # MatrixMult.c:24:9
	addq	$8, %r12
	cmpq	$1024, %rbx             # imm = 0x400
	jne	.LBB1_2
.Ltmp22:
# BB#5:                                 # %for.end
                                        #   in Loop: Header=BB1_1 Depth=1
	.loc	1 28 9                  # MatrixMult.c:28:9
	movl	$10, %edi
	movq	%rcx, %rsi
	callq	fputc
.Ltmp23:
	.loc	1 23 5 discriminator 1  # MatrixMult.c:23:5
	incq	%r15
	addq	$8192, %r14             # imm = 0x2000
	cmpq	$1024, %r15             # imm = 0x400
	jne	.LBB1_1
.Ltmp24:
# BB#6:                                 # %for.end11
	.loc	1 30 1                  # MatrixMult.c:30:1
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp25:
.Lfunc_end1:
	.size	print_array, .Lfunc_end1-print_array
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin2:
	.loc	1 33 0                  # MatrixMult.c:33:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp26:
	.cfi_def_cfa_offset 16
.Ltmp27:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp28:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
.Ltmp29:
	.cfi_offset %rbx, -24
.Ltmp30:
	#DEBUG_VALUE: init_array:i <- 0
	leaq	-16(%rbp), %rbx
.Ltmp31:
	.loc	1 37 5 prologue_end     # MatrixMult.c:37:5
	movl	$init_array_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$32, %r8d
	movl	$1, %r9d
	movq	%rbx, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	init_array_polly_subfn
	callq	GOMP_parallel_end
.Ltmp32:
	#DEBUG_VALUE: main:i <- 0
	movl	$main_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$32, %r8d
	movl	$1, %r9d
	movq	%rbx, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	main_polly_subfn
	callq	GOMP_parallel_end
	movl	$main_polly_subfn_1, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$32, %r8d
	movl	$1, %r9d
	movq	%rbx, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	main_polly_subfn_1
	callq	GOMP_parallel_end
	.loc	1 47 71                 # MatrixMult.c:47:71
	movq	C+8388600(%rip), %rcx
	.loc	1 47 5 is_stmt 0        # MatrixMult.c:47:5
	movl	$.L.str.2, %edi
	movl	$1024, %esi             # imm = 0x400
	movl	$1024, %edx             # imm = 0x400
	xorl	%eax, %eax
	callq	printf
	.loc	1 48 5 is_stmt 1        # MatrixMult.c:48:5
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Ltmp33:
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI3_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
	.text
	.p2align	4, 0x90
	.type	init_array_polly_subfn,@function
init_array_polly_subfn:                 # @init_array_polly_subfn
.Lfunc_begin3:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp34:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp35:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp36:
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
.Ltmp37:
	.cfi_def_cfa_offset 48
.Ltmp38:
	.cfi_offset %rbx, -32
.Ltmp39:
	.cfi_offset %r14, -24
.Ltmp40:
	.cfi_offset %r15, -16
	leaq	8(%rsp), %rdi
	leaq	(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB3_2
# BB#1:
	leaq	8(%rsp), %r14
	leaq	(%rsp), %r15
	.p2align	4, 0x90
.LBB3_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_7 Depth 2
                                        #       Child Loop BB3_8 Depth 3
                                        #         Child Loop BB3_9 Depth 4
	movq	(%rsp), %r8
	movq	8(%rsp), %rcx
	addq	$-2, %r8
	movq	%rcx, %rdx
	shlq	$18, %rdx
	orq	$240, %rdx
	.p2align	4, 0x90
.LBB3_7:                                # %polly.loop_preheader3
                                        #   Parent Loop BB3_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_8 Depth 3
                                        #         Child Loop BB3_9 Depth 4
	movq	%rdx, %rbx
	xorl	%edi, %edi
	movaps	.LCPI3_0(%rip), %xmm0   # xmm0 = [1,1]
	.p2align	4, 0x90
.LBB3_8:                                # %polly.loop_preheader9
                                        #   Parent Loop BB3_4 Depth=1
                                        #     Parent Loop BB3_7 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB3_9 Depth 4
	movq	%rbx, %rsi
	movl	$32, %eax
	.p2align	4, 0x90
.LBB3_9:                                # %vector.body
                                        #   Parent Loop BB3_4 Depth=1
                                        #     Parent Loop BB3_7 Depth=2
                                        #       Parent Loop BB3_8 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movaps	%xmm0, A-240(%rsi)
	movaps	%xmm0, B-240(%rsi)
	movaps	%xmm0, A-224(%rsi)
	movaps	%xmm0, B-224(%rsi)
	movaps	%xmm0, A-208(%rsi)
	movaps	%xmm0, B-208(%rsi)
	movaps	%xmm0, A-192(%rsi)
	movaps	%xmm0, B-192(%rsi)
	movaps	%xmm0, A-176(%rsi)
	movaps	%xmm0, B-176(%rsi)
	movaps	%xmm0, A-160(%rsi)
	movaps	%xmm0, B-160(%rsi)
	movaps	%xmm0, A-144(%rsi)
	movaps	%xmm0, B-144(%rsi)
	movaps	%xmm0, A-128(%rsi)
	movaps	%xmm0, B-128(%rsi)
	movaps	%xmm0, A-112(%rsi)
	movaps	%xmm0, B-112(%rsi)
	movaps	%xmm0, A-96(%rsi)
	movaps	%xmm0, B-96(%rsi)
	movaps	%xmm0, A-80(%rsi)
	movaps	%xmm0, B-80(%rsi)
	movaps	%xmm0, A-64(%rsi)
	movaps	%xmm0, B-64(%rsi)
	movaps	%xmm0, A-48(%rsi)
	movaps	%xmm0, B-48(%rsi)
	movaps	%xmm0, A-32(%rsi)
	movaps	%xmm0, B-32(%rsi)
	movaps	%xmm0, A-16(%rsi)
	movaps	%xmm0, B-16(%rsi)
	movaps	%xmm0, A(%rsi)
	movaps	%xmm0, B(%rsi)
	addq	$8192, %rsi             # imm = 0x2000
	decq	%rax
	jne	.LBB3_9
# BB#5:                                 # %polly.loop_exit10
                                        #   in Loop: Header=BB3_8 Depth=3
	incq	%rdi
	addq	$256, %rbx              # imm = 0x100
	cmpq	$32, %rdi
	jne	.LBB3_8
# BB#6:                                 # %polly.loop_exit4
                                        #   in Loop: Header=BB3_7 Depth=2
	addq	$262144, %rdx           # imm = 0x40000
	cmpq	%r8, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB3_7
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB3_4 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB3_4
.LBB3_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Lfunc_end3:
	.size	init_array_polly_subfn, .Lfunc_end3-init_array_polly_subfn
	.cfi_endproc

	.p2align	4, 0x90
	.type	main_polly_subfn,@function
main_polly_subfn:                       # @main_polly_subfn
.Lfunc_begin4:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r14
.Ltmp41:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp42:
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
.Ltmp43:
	.cfi_def_cfa_offset 48
.Ltmp44:
	.cfi_offset %rbx, -24
.Ltmp45:
	.cfi_offset %r14, -16
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB4_2
# BB#1:
	leaq	16(%rsp), %r14
	leaq	8(%rsp), %rbx
	.p2align	4, 0x90
.LBB4_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_6 Depth 2
                                        #       Child Loop BB4_7 Depth 3
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	addq	$-2, %rax
	movq	%rcx, %rdx
	shlq	$18, %rdx
	leaq	C+253952(%rdx), %rdx
	.p2align	4, 0x90
.LBB4_6:                                # %polly.loop_preheader3
                                        #   Parent Loop BB4_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_7 Depth 3
	movq	%rdx, %rsi
	movl	$32, %edi
	xorps	%xmm0, %xmm0
	.p2align	4, 0x90
.LBB4_7:                                # %polly.loop_preheader15
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	%xmm0, -253712(%rsi)
	movaps	%xmm0, -253728(%rsi)
	movaps	%xmm0, -253744(%rsi)
	movaps	%xmm0, -253760(%rsi)
	movaps	%xmm0, -253776(%rsi)
	movaps	%xmm0, -253792(%rsi)
	movaps	%xmm0, -253808(%rsi)
	movaps	%xmm0, -253824(%rsi)
	movaps	%xmm0, -253840(%rsi)
	movaps	%xmm0, -253856(%rsi)
	movaps	%xmm0, -253872(%rsi)
	movaps	%xmm0, -253888(%rsi)
	movaps	%xmm0, -253904(%rsi)
	movaps	%xmm0, -253920(%rsi)
	movaps	%xmm0, -253936(%rsi)
	movaps	%xmm0, -253952(%rsi)
	movaps	%xmm0, -245520(%rsi)
	movaps	%xmm0, -245536(%rsi)
	movaps	%xmm0, -245552(%rsi)
	movaps	%xmm0, -245568(%rsi)
	movaps	%xmm0, -245584(%rsi)
	movaps	%xmm0, -245600(%rsi)
	movaps	%xmm0, -245616(%rsi)
	movaps	%xmm0, -245632(%rsi)
	movaps	%xmm0, -245648(%rsi)
	movaps	%xmm0, -245664(%rsi)
	movaps	%xmm0, -245680(%rsi)
	movaps	%xmm0, -245696(%rsi)
	movaps	%xmm0, -245712(%rsi)
	movaps	%xmm0, -245728(%rsi)
	movaps	%xmm0, -245744(%rsi)
	movaps	%xmm0, -245760(%rsi)
	movaps	%xmm0, -237328(%rsi)
	movaps	%xmm0, -237344(%rsi)
	movaps	%xmm0, -237360(%rsi)
	movaps	%xmm0, -237376(%rsi)
	movaps	%xmm0, -237392(%rsi)
	movaps	%xmm0, -237408(%rsi)
	movaps	%xmm0, -237424(%rsi)
	movaps	%xmm0, -237440(%rsi)
	movaps	%xmm0, -237456(%rsi)
	movaps	%xmm0, -237472(%rsi)
	movaps	%xmm0, -237488(%rsi)
	movaps	%xmm0, -237504(%rsi)
	movaps	%xmm0, -237520(%rsi)
	movaps	%xmm0, -237536(%rsi)
	movaps	%xmm0, -237552(%rsi)
	movaps	%xmm0, -237568(%rsi)
	movaps	%xmm0, -229136(%rsi)
	movaps	%xmm0, -229152(%rsi)
	movaps	%xmm0, -229168(%rsi)
	movaps	%xmm0, -229184(%rsi)
	movaps	%xmm0, -229200(%rsi)
	movaps	%xmm0, -229216(%rsi)
	movaps	%xmm0, -229232(%rsi)
	movaps	%xmm0, -229248(%rsi)
	movaps	%xmm0, -229264(%rsi)
	movaps	%xmm0, -229280(%rsi)
	movaps	%xmm0, -229296(%rsi)
	movaps	%xmm0, -229312(%rsi)
	movaps	%xmm0, -229328(%rsi)
	movaps	%xmm0, -229344(%rsi)
	movaps	%xmm0, -229360(%rsi)
	movaps	%xmm0, -229376(%rsi)
	movaps	%xmm0, -220944(%rsi)
	movaps	%xmm0, -220960(%rsi)
	movaps	%xmm0, -220976(%rsi)
	movaps	%xmm0, -220992(%rsi)
	movaps	%xmm0, -221008(%rsi)
	movaps	%xmm0, -221024(%rsi)
	movaps	%xmm0, -221040(%rsi)
	movaps	%xmm0, -221056(%rsi)
	movaps	%xmm0, -221072(%rsi)
	movaps	%xmm0, -221088(%rsi)
	movaps	%xmm0, -221104(%rsi)
	movaps	%xmm0, -221120(%rsi)
	movaps	%xmm0, -221136(%rsi)
	movaps	%xmm0, -221152(%rsi)
	movaps	%xmm0, -221168(%rsi)
	movaps	%xmm0, -221184(%rsi)
	movaps	%xmm0, -212752(%rsi)
	movaps	%xmm0, -212768(%rsi)
	movaps	%xmm0, -212784(%rsi)
	movaps	%xmm0, -212800(%rsi)
	movaps	%xmm0, -212816(%rsi)
	movaps	%xmm0, -212832(%rsi)
	movaps	%xmm0, -212848(%rsi)
	movaps	%xmm0, -212864(%rsi)
	movaps	%xmm0, -212880(%rsi)
	movaps	%xmm0, -212896(%rsi)
	movaps	%xmm0, -212912(%rsi)
	movaps	%xmm0, -212928(%rsi)
	movaps	%xmm0, -212944(%rsi)
	movaps	%xmm0, -212960(%rsi)
	movaps	%xmm0, -212976(%rsi)
	movaps	%xmm0, -212992(%rsi)
	movaps	%xmm0, -204560(%rsi)
	movaps	%xmm0, -204576(%rsi)
	movaps	%xmm0, -204592(%rsi)
	movaps	%xmm0, -204608(%rsi)
	movaps	%xmm0, -204624(%rsi)
	movaps	%xmm0, -204640(%rsi)
	movaps	%xmm0, -204656(%rsi)
	movaps	%xmm0, -204672(%rsi)
	movaps	%xmm0, -204688(%rsi)
	movaps	%xmm0, -204704(%rsi)
	movaps	%xmm0, -204720(%rsi)
	movaps	%xmm0, -204736(%rsi)
	movaps	%xmm0, -204752(%rsi)
	movaps	%xmm0, -204768(%rsi)
	movaps	%xmm0, -204784(%rsi)
	movaps	%xmm0, -204800(%rsi)
	movaps	%xmm0, -196368(%rsi)
	movaps	%xmm0, -196384(%rsi)
	movaps	%xmm0, -196400(%rsi)
	movaps	%xmm0, -196416(%rsi)
	movaps	%xmm0, -196432(%rsi)
	movaps	%xmm0, -196448(%rsi)
	movaps	%xmm0, -196464(%rsi)
	movaps	%xmm0, -196480(%rsi)
	movaps	%xmm0, -196496(%rsi)
	movaps	%xmm0, -196512(%rsi)
	movaps	%xmm0, -196528(%rsi)
	movaps	%xmm0, -196544(%rsi)
	movaps	%xmm0, -196560(%rsi)
	movaps	%xmm0, -196576(%rsi)
	movaps	%xmm0, -196592(%rsi)
	movaps	%xmm0, -196608(%rsi)
	movaps	%xmm0, -188176(%rsi)
	movaps	%xmm0, -188192(%rsi)
	movaps	%xmm0, -188208(%rsi)
	movaps	%xmm0, -188224(%rsi)
	movaps	%xmm0, -188240(%rsi)
	movaps	%xmm0, -188256(%rsi)
	movaps	%xmm0, -188272(%rsi)
	movaps	%xmm0, -188288(%rsi)
	movaps	%xmm0, -188304(%rsi)
	movaps	%xmm0, -188320(%rsi)
	movaps	%xmm0, -188336(%rsi)
	movaps	%xmm0, -188352(%rsi)
	movaps	%xmm0, -188368(%rsi)
	movaps	%xmm0, -188384(%rsi)
	movaps	%xmm0, -188400(%rsi)
	movaps	%xmm0, -188416(%rsi)
	movaps	%xmm0, -179984(%rsi)
	movaps	%xmm0, -180000(%rsi)
	movaps	%xmm0, -180016(%rsi)
	movaps	%xmm0, -180032(%rsi)
	movaps	%xmm0, -180048(%rsi)
	movaps	%xmm0, -180064(%rsi)
	movaps	%xmm0, -180080(%rsi)
	movaps	%xmm0, -180096(%rsi)
	movaps	%xmm0, -180112(%rsi)
	movaps	%xmm0, -180128(%rsi)
	movaps	%xmm0, -180144(%rsi)
	movaps	%xmm0, -180160(%rsi)
	movaps	%xmm0, -180176(%rsi)
	movaps	%xmm0, -180192(%rsi)
	movaps	%xmm0, -180208(%rsi)
	movaps	%xmm0, -180224(%rsi)
	movaps	%xmm0, -171792(%rsi)
	movaps	%xmm0, -171808(%rsi)
	movaps	%xmm0, -171824(%rsi)
	movaps	%xmm0, -171840(%rsi)
	movaps	%xmm0, -171856(%rsi)
	movaps	%xmm0, -171872(%rsi)
	movaps	%xmm0, -171888(%rsi)
	movaps	%xmm0, -171904(%rsi)
	movaps	%xmm0, -171920(%rsi)
	movaps	%xmm0, -171936(%rsi)
	movaps	%xmm0, -171952(%rsi)
	movaps	%xmm0, -171968(%rsi)
	movaps	%xmm0, -171984(%rsi)
	movaps	%xmm0, -172000(%rsi)
	movaps	%xmm0, -172016(%rsi)
	movaps	%xmm0, -172032(%rsi)
	movaps	%xmm0, -163600(%rsi)
	movaps	%xmm0, -163616(%rsi)
	movaps	%xmm0, -163632(%rsi)
	movaps	%xmm0, -163648(%rsi)
	movaps	%xmm0, -163664(%rsi)
	movaps	%xmm0, -163680(%rsi)
	movaps	%xmm0, -163696(%rsi)
	movaps	%xmm0, -163712(%rsi)
	movaps	%xmm0, -163728(%rsi)
	movaps	%xmm0, -163744(%rsi)
	movaps	%xmm0, -163760(%rsi)
	movaps	%xmm0, -163776(%rsi)
	movaps	%xmm0, -163792(%rsi)
	movaps	%xmm0, -163808(%rsi)
	movaps	%xmm0, -163824(%rsi)
	movaps	%xmm0, -163840(%rsi)
	movaps	%xmm0, -155408(%rsi)
	movaps	%xmm0, -155424(%rsi)
	movaps	%xmm0, -155440(%rsi)
	movaps	%xmm0, -155456(%rsi)
	movaps	%xmm0, -155472(%rsi)
	movaps	%xmm0, -155488(%rsi)
	movaps	%xmm0, -155504(%rsi)
	movaps	%xmm0, -155520(%rsi)
	movaps	%xmm0, -155536(%rsi)
	movaps	%xmm0, -155552(%rsi)
	movaps	%xmm0, -155568(%rsi)
	movaps	%xmm0, -155584(%rsi)
	movaps	%xmm0, -155600(%rsi)
	movaps	%xmm0, -155616(%rsi)
	movaps	%xmm0, -155632(%rsi)
	movaps	%xmm0, -155648(%rsi)
	movaps	%xmm0, -147216(%rsi)
	movaps	%xmm0, -147232(%rsi)
	movaps	%xmm0, -147248(%rsi)
	movaps	%xmm0, -147264(%rsi)
	movaps	%xmm0, -147280(%rsi)
	movaps	%xmm0, -147296(%rsi)
	movaps	%xmm0, -147312(%rsi)
	movaps	%xmm0, -147328(%rsi)
	movaps	%xmm0, -147344(%rsi)
	movaps	%xmm0, -147360(%rsi)
	movaps	%xmm0, -147376(%rsi)
	movaps	%xmm0, -147392(%rsi)
	movaps	%xmm0, -147408(%rsi)
	movaps	%xmm0, -147424(%rsi)
	movaps	%xmm0, -147440(%rsi)
	movaps	%xmm0, -147456(%rsi)
	movaps	%xmm0, -139024(%rsi)
	movaps	%xmm0, -139040(%rsi)
	movaps	%xmm0, -139056(%rsi)
	movaps	%xmm0, -139072(%rsi)
	movaps	%xmm0, -139088(%rsi)
	movaps	%xmm0, -139104(%rsi)
	movaps	%xmm0, -139120(%rsi)
	movaps	%xmm0, -139136(%rsi)
	movaps	%xmm0, -139152(%rsi)
	movaps	%xmm0, -139168(%rsi)
	movaps	%xmm0, -139184(%rsi)
	movaps	%xmm0, -139200(%rsi)
	movaps	%xmm0, -139216(%rsi)
	movaps	%xmm0, -139232(%rsi)
	movaps	%xmm0, -139248(%rsi)
	movaps	%xmm0, -139264(%rsi)
	movaps	%xmm0, -130832(%rsi)
	movaps	%xmm0, -130848(%rsi)
	movaps	%xmm0, -130864(%rsi)
	movaps	%xmm0, -130880(%rsi)
	movaps	%xmm0, -130896(%rsi)
	movaps	%xmm0, -130912(%rsi)
	movaps	%xmm0, -130928(%rsi)
	movaps	%xmm0, -130944(%rsi)
	movaps	%xmm0, -130960(%rsi)
	movaps	%xmm0, -130976(%rsi)
	movaps	%xmm0, -130992(%rsi)
	movaps	%xmm0, -131008(%rsi)
	movaps	%xmm0, -131024(%rsi)
	movaps	%xmm0, -131040(%rsi)
	movaps	%xmm0, -131056(%rsi)
	movaps	%xmm0, -131072(%rsi)
	movaps	%xmm0, -122640(%rsi)
	movaps	%xmm0, -122656(%rsi)
	movaps	%xmm0, -122672(%rsi)
	movaps	%xmm0, -122688(%rsi)
	movaps	%xmm0, -122704(%rsi)
	movaps	%xmm0, -122720(%rsi)
	movaps	%xmm0, -122736(%rsi)
	movaps	%xmm0, -122752(%rsi)
	movaps	%xmm0, -122768(%rsi)
	movaps	%xmm0, -122784(%rsi)
	movaps	%xmm0, -122800(%rsi)
	movaps	%xmm0, -122816(%rsi)
	movaps	%xmm0, -122832(%rsi)
	movaps	%xmm0, -122848(%rsi)
	movaps	%xmm0, -122864(%rsi)
	movaps	%xmm0, -122880(%rsi)
	movaps	%xmm0, -114448(%rsi)
	movaps	%xmm0, -114464(%rsi)
	movaps	%xmm0, -114480(%rsi)
	movaps	%xmm0, -114496(%rsi)
	movaps	%xmm0, -114512(%rsi)
	movaps	%xmm0, -114528(%rsi)
	movaps	%xmm0, -114544(%rsi)
	movaps	%xmm0, -114560(%rsi)
	movaps	%xmm0, -114576(%rsi)
	movaps	%xmm0, -114592(%rsi)
	movaps	%xmm0, -114608(%rsi)
	movaps	%xmm0, -114624(%rsi)
	movaps	%xmm0, -114640(%rsi)
	movaps	%xmm0, -114656(%rsi)
	movaps	%xmm0, -114672(%rsi)
	movaps	%xmm0, -114688(%rsi)
	movaps	%xmm0, -106256(%rsi)
	movaps	%xmm0, -106272(%rsi)
	movaps	%xmm0, -106288(%rsi)
	movaps	%xmm0, -106304(%rsi)
	movaps	%xmm0, -106320(%rsi)
	movaps	%xmm0, -106336(%rsi)
	movaps	%xmm0, -106352(%rsi)
	movaps	%xmm0, -106368(%rsi)
	movaps	%xmm0, -106384(%rsi)
	movaps	%xmm0, -106400(%rsi)
	movaps	%xmm0, -106416(%rsi)
	movaps	%xmm0, -106432(%rsi)
	movaps	%xmm0, -106448(%rsi)
	movaps	%xmm0, -106464(%rsi)
	movaps	%xmm0, -106480(%rsi)
	movaps	%xmm0, -106496(%rsi)
	movaps	%xmm0, -98064(%rsi)
	movaps	%xmm0, -98080(%rsi)
	movaps	%xmm0, -98096(%rsi)
	movaps	%xmm0, -98112(%rsi)
	movaps	%xmm0, -98128(%rsi)
	movaps	%xmm0, -98144(%rsi)
	movaps	%xmm0, -98160(%rsi)
	movaps	%xmm0, -98176(%rsi)
	movaps	%xmm0, -98192(%rsi)
	movaps	%xmm0, -98208(%rsi)
	movaps	%xmm0, -98224(%rsi)
	movaps	%xmm0, -98240(%rsi)
	movaps	%xmm0, -98256(%rsi)
	movaps	%xmm0, -98272(%rsi)
	movaps	%xmm0, -98288(%rsi)
	movaps	%xmm0, -98304(%rsi)
	movaps	%xmm0, -89872(%rsi)
	movaps	%xmm0, -89888(%rsi)
	movaps	%xmm0, -89904(%rsi)
	movaps	%xmm0, -89920(%rsi)
	movaps	%xmm0, -89936(%rsi)
	movaps	%xmm0, -89952(%rsi)
	movaps	%xmm0, -89968(%rsi)
	movaps	%xmm0, -89984(%rsi)
	movaps	%xmm0, -90000(%rsi)
	movaps	%xmm0, -90016(%rsi)
	movaps	%xmm0, -90032(%rsi)
	movaps	%xmm0, -90048(%rsi)
	movaps	%xmm0, -90064(%rsi)
	movaps	%xmm0, -90080(%rsi)
	movaps	%xmm0, -90096(%rsi)
	movaps	%xmm0, -90112(%rsi)
	movaps	%xmm0, -81680(%rsi)
	movaps	%xmm0, -81696(%rsi)
	movaps	%xmm0, -81712(%rsi)
	movaps	%xmm0, -81728(%rsi)
	movaps	%xmm0, -81744(%rsi)
	movaps	%xmm0, -81760(%rsi)
	movaps	%xmm0, -81776(%rsi)
	movaps	%xmm0, -81792(%rsi)
	movaps	%xmm0, -81808(%rsi)
	movaps	%xmm0, -81824(%rsi)
	movaps	%xmm0, -81840(%rsi)
	movaps	%xmm0, -81856(%rsi)
	movaps	%xmm0, -81872(%rsi)
	movaps	%xmm0, -81888(%rsi)
	movaps	%xmm0, -81904(%rsi)
	movaps	%xmm0, -81920(%rsi)
	movaps	%xmm0, -73488(%rsi)
	movaps	%xmm0, -73504(%rsi)
	movaps	%xmm0, -73520(%rsi)
	movaps	%xmm0, -73536(%rsi)
	movaps	%xmm0, -73552(%rsi)
	movaps	%xmm0, -73568(%rsi)
	movaps	%xmm0, -73584(%rsi)
	movaps	%xmm0, -73600(%rsi)
	movaps	%xmm0, -73616(%rsi)
	movaps	%xmm0, -73632(%rsi)
	movaps	%xmm0, -73648(%rsi)
	movaps	%xmm0, -73664(%rsi)
	movaps	%xmm0, -73680(%rsi)
	movaps	%xmm0, -73696(%rsi)
	movaps	%xmm0, -73712(%rsi)
	movaps	%xmm0, -73728(%rsi)
	movaps	%xmm0, -65296(%rsi)
	movaps	%xmm0, -65312(%rsi)
	movaps	%xmm0, -65328(%rsi)
	movaps	%xmm0, -65344(%rsi)
	movaps	%xmm0, -65360(%rsi)
	movaps	%xmm0, -65376(%rsi)
	movaps	%xmm0, -65392(%rsi)
	movaps	%xmm0, -65408(%rsi)
	movaps	%xmm0, -65424(%rsi)
	movaps	%xmm0, -65440(%rsi)
	movaps	%xmm0, -65456(%rsi)
	movaps	%xmm0, -65472(%rsi)
	movaps	%xmm0, -65488(%rsi)
	movaps	%xmm0, -65504(%rsi)
	movaps	%xmm0, -65520(%rsi)
	movaps	%xmm0, -65536(%rsi)
	movaps	%xmm0, -57104(%rsi)
	movaps	%xmm0, -57120(%rsi)
	movaps	%xmm0, -57136(%rsi)
	movaps	%xmm0, -57152(%rsi)
	movaps	%xmm0, -57168(%rsi)
	movaps	%xmm0, -57184(%rsi)
	movaps	%xmm0, -57200(%rsi)
	movaps	%xmm0, -57216(%rsi)
	movaps	%xmm0, -57232(%rsi)
	movaps	%xmm0, -57248(%rsi)
	movaps	%xmm0, -57264(%rsi)
	movaps	%xmm0, -57280(%rsi)
	movaps	%xmm0, -57296(%rsi)
	movaps	%xmm0, -57312(%rsi)
	movaps	%xmm0, -57328(%rsi)
	movaps	%xmm0, -57344(%rsi)
	movaps	%xmm0, -48912(%rsi)
	movaps	%xmm0, -48928(%rsi)
	movaps	%xmm0, -48944(%rsi)
	movaps	%xmm0, -48960(%rsi)
	movaps	%xmm0, -48976(%rsi)
	movaps	%xmm0, -48992(%rsi)
	movaps	%xmm0, -49008(%rsi)
	movaps	%xmm0, -49024(%rsi)
	movaps	%xmm0, -49040(%rsi)
	movaps	%xmm0, -49056(%rsi)
	movaps	%xmm0, -49072(%rsi)
	movaps	%xmm0, -49088(%rsi)
	movaps	%xmm0, -49104(%rsi)
	movaps	%xmm0, -49120(%rsi)
	movaps	%xmm0, -49136(%rsi)
	movaps	%xmm0, -49152(%rsi)
	movaps	%xmm0, -40720(%rsi)
	movaps	%xmm0, -40736(%rsi)
	movaps	%xmm0, -40752(%rsi)
	movaps	%xmm0, -40768(%rsi)
	movaps	%xmm0, -40784(%rsi)
	movaps	%xmm0, -40800(%rsi)
	movaps	%xmm0, -40816(%rsi)
	movaps	%xmm0, -40832(%rsi)
	movaps	%xmm0, -40848(%rsi)
	movaps	%xmm0, -40864(%rsi)
	movaps	%xmm0, -40880(%rsi)
	movaps	%xmm0, -40896(%rsi)
	movaps	%xmm0, -40912(%rsi)
	movaps	%xmm0, -40928(%rsi)
	movaps	%xmm0, -40944(%rsi)
	movaps	%xmm0, -40960(%rsi)
	movaps	%xmm0, -32528(%rsi)
	movaps	%xmm0, -32544(%rsi)
	movaps	%xmm0, -32560(%rsi)
	movaps	%xmm0, -32576(%rsi)
	movaps	%xmm0, -32592(%rsi)
	movaps	%xmm0, -32608(%rsi)
	movaps	%xmm0, -32624(%rsi)
	movaps	%xmm0, -32640(%rsi)
	movaps	%xmm0, -32656(%rsi)
	movaps	%xmm0, -32672(%rsi)
	movaps	%xmm0, -32688(%rsi)
	movaps	%xmm0, -32704(%rsi)
	movaps	%xmm0, -32720(%rsi)
	movaps	%xmm0, -32736(%rsi)
	movaps	%xmm0, -32752(%rsi)
	movaps	%xmm0, -32768(%rsi)
	movaps	%xmm0, -24336(%rsi)
	movaps	%xmm0, -24352(%rsi)
	movaps	%xmm0, -24368(%rsi)
	movaps	%xmm0, -24384(%rsi)
	movaps	%xmm0, -24400(%rsi)
	movaps	%xmm0, -24416(%rsi)
	movaps	%xmm0, -24432(%rsi)
	movaps	%xmm0, -24448(%rsi)
	movaps	%xmm0, -24464(%rsi)
	movaps	%xmm0, -24480(%rsi)
	movaps	%xmm0, -24496(%rsi)
	movaps	%xmm0, -24512(%rsi)
	movaps	%xmm0, -24528(%rsi)
	movaps	%xmm0, -24544(%rsi)
	movaps	%xmm0, -24560(%rsi)
	movaps	%xmm0, -24576(%rsi)
	movaps	%xmm0, -16144(%rsi)
	movaps	%xmm0, -16160(%rsi)
	movaps	%xmm0, -16176(%rsi)
	movaps	%xmm0, -16192(%rsi)
	movaps	%xmm0, -16208(%rsi)
	movaps	%xmm0, -16224(%rsi)
	movaps	%xmm0, -16240(%rsi)
	movaps	%xmm0, -16256(%rsi)
	movaps	%xmm0, -16272(%rsi)
	movaps	%xmm0, -16288(%rsi)
	movaps	%xmm0, -16304(%rsi)
	movaps	%xmm0, -16320(%rsi)
	movaps	%xmm0, -16336(%rsi)
	movaps	%xmm0, -16352(%rsi)
	movaps	%xmm0, -16368(%rsi)
	movaps	%xmm0, -16384(%rsi)
	movaps	%xmm0, -7952(%rsi)
	movaps	%xmm0, -7968(%rsi)
	movaps	%xmm0, -7984(%rsi)
	movaps	%xmm0, -8000(%rsi)
	movaps	%xmm0, -8016(%rsi)
	movaps	%xmm0, -8032(%rsi)
	movaps	%xmm0, -8048(%rsi)
	movaps	%xmm0, -8064(%rsi)
	movaps	%xmm0, -8080(%rsi)
	movaps	%xmm0, -8096(%rsi)
	movaps	%xmm0, -8112(%rsi)
	movaps	%xmm0, -8128(%rsi)
	movaps	%xmm0, -8144(%rsi)
	movaps	%xmm0, -8160(%rsi)
	movaps	%xmm0, -8176(%rsi)
	movaps	%xmm0, -8192(%rsi)
	movaps	%xmm0, 240(%rsi)
	movaps	%xmm0, 224(%rsi)
	movaps	%xmm0, 208(%rsi)
	movaps	%xmm0, 192(%rsi)
	movaps	%xmm0, 176(%rsi)
	movaps	%xmm0, 160(%rsi)
	movaps	%xmm0, 144(%rsi)
	movaps	%xmm0, 128(%rsi)
	movaps	%xmm0, 112(%rsi)
	movaps	%xmm0, 96(%rsi)
	movaps	%xmm0, 80(%rsi)
	movaps	%xmm0, 64(%rsi)
	movaps	%xmm0, 48(%rsi)
	movaps	%xmm0, 32(%rsi)
	movaps	%xmm0, 16(%rsi)
	movaps	%xmm0, (%rsi)
	addq	$256, %rsi              # imm = 0x100
	decq	%rdi
	jne	.LBB4_7
# BB#5:                                 # %polly.loop_exit4
                                        #   in Loop: Header=BB4_6 Depth=2
	addq	$262144, %rdx           # imm = 0x40000
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB4_6
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB4_4 Depth=1
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB4_4
.LBB4_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end4:
	.size	main_polly_subfn, .Lfunc_end4-main_polly_subfn
	.cfi_endproc

	.p2align	4, 0x90
	.type	main_polly_subfn_1,@function
main_polly_subfn_1:                     # @main_polly_subfn_1
.Lfunc_begin5:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Ltmp46:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp47:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp48:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp49:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp50:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp51:
	.cfi_def_cfa_offset 56
	subq	$72, %rsp
.Ltmp52:
	.cfi_def_cfa_offset 128
.Ltmp53:
	.cfi_offset %rbx, -56
.Ltmp54:
	.cfi_offset %r12, -48
.Ltmp55:
	.cfi_offset %r13, -40
.Ltmp56:
	.cfi_offset %r14, -32
.Ltmp57:
	.cfi_offset %r15, -24
.Ltmp58:
	.cfi_offset %rbp, -16
	jmp	.LBB5_1
	.p2align	4, 0x90
.LBB5_2:                                # %polly.par.loadIVBounds
                                        #   in Loop: Header=BB5_1 Depth=1
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	addq	$-2, %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	%rcx, %rax
	shlq	$18, %rax
	leaq	A(%rax), %rax
	movq	%rax, (%rsp)            # 8-byte Spill
	.p2align	4, 0x90
.LBB5_5:                                # %polly.loop_preheader3
                                        #   Parent Loop BB5_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_6 Depth 3
                                        #         Child Loop BB5_9 Depth 4
                                        #           Child Loop BB5_10 Depth 5
                                        #             Child Loop BB5_13 Depth 6
                                        #               Child Loop BB5_11 Depth 7
	movq	%rcx, 32(%rsp)          # 8-byte Spill
	movq	%rcx, %rsi
	shlq	$5, %rsi
	movl	$B, %eax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB5_6:                                # %polly.loop_preheader9
                                        #   Parent Loop BB5_1 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_9 Depth 4
                                        #           Child Loop BB5_10 Depth 5
                                        #             Child Loop BB5_13 Depth 6
                                        #               Child Loop BB5_11 Depth 7
	movq	%rcx, 40(%rsp)          # 8-byte Spill
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	%rcx, %rbx
	shlq	$5, %rbx
	movq	(%rsp), %r10            # 8-byte Reload
	movq	%rax, %rdx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB5_9:                                # %polly.loop_preheader15
                                        #   Parent Loop BB5_1 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_6 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB5_10 Depth 5
                                        #             Child Loop BB5_13 Depth 6
                                        #               Child Loop BB5_11 Depth 7
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	%r10, 64(%rsp)          # 8-byte Spill
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB5_10:                               # %polly.loop_preheader21
                                        #   Parent Loop BB5_1 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_6 Depth=3
                                        #         Parent Loop BB5_9 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB5_13 Depth 6
                                        #               Child Loop BB5_11 Depth 7
	leaq	(%rcx,%rsi), %rdi
	movq	%rdx, %r11
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB5_13:                               # %polly.loop_preheader27
                                        #   Parent Loop BB5_1 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_6 Depth=3
                                        #         Parent Loop BB5_9 Depth=4
                                        #           Parent Loop BB5_10 Depth=5
                                        # =>          This Loop Header: Depth=6
                                        #               Child Loop BB5_11 Depth 7
	leaq	(%r15,%rbx), %rax
	movq	%rdi, %rbp
	shlq	$13, %rbp
	leaq	C(%rbp,%rax,8), %r8
	movq	C(%rbp,%rax,8), %r9
	movq	%r10, %rax
	movq	%r11, %r14
	movl	$32, %r12d
	.p2align	4, 0x90
.LBB5_11:                               # %polly.loop_header26
                                        #   Parent Loop BB5_1 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_6 Depth=3
                                        #         Parent Loop BB5_9 Depth=4
                                        #           Parent Loop BB5_10 Depth=5
                                        #             Parent Loop BB5_13 Depth=6
                                        # =>            This Inner Loop Header: Depth=7
	movq	(%r14), %r13
	.loc	1 43 45                 # MatrixMult.c:43:45
	imulq	(%rax), %r13
	.loc	1 43 35 is_stmt 0       # MatrixMult.c:43:35
	addq	%r13, %r9
	addq	$8192, %r14             # imm = 0x2000
	addq	$8, %rax
	decq	%r12
	jne	.LBB5_11
# BB#12:                                # %polly.loop_exit28
                                        #   in Loop: Header=BB5_13 Depth=6
	movq	%r9, (%r8)
	incq	%r15
	addq	$8, %r11
	cmpq	$32, %r15
	jne	.LBB5_13
# BB#7:                                 # %polly.loop_exit22
                                        #   in Loop: Header=BB5_10 Depth=5
	incq	%rcx
	addq	$8192, %r10             # imm = 0x2000
	cmpq	$32, %rcx
	jne	.LBB5_10
# BB#8:                                 # %polly.loop_exit16
                                        #   in Loop: Header=BB5_9 Depth=4
	movq	56(%rsp), %rax          # 8-byte Reload
	incq	%rax
	addq	$262144, %rdx           # imm = 0x40000
	movq	64(%rsp), %r10          # 8-byte Reload
	addq	$256, %r10              # imm = 0x100
	cmpq	$32, %rax
	jne	.LBB5_9
# BB#3:                                 # %polly.loop_exit10
                                        #   in Loop: Header=BB5_6 Depth=3
	movq	40(%rsp), %rcx          # 8-byte Reload
	incq	%rcx
	movq	48(%rsp), %rax          # 8-byte Reload
	addq	$256, %rax              # imm = 0x100
	cmpq	$32, %rcx
	jne	.LBB5_6
# BB#4:                                 # %polly.loop_exit4
                                        #   in Loop: Header=BB5_5 Depth=2
	addq	$262144, (%rsp)         # 8-byte Folded Spill
                                        # imm = 0x40000
	movq	32(%rsp), %rcx          # 8-byte Reload
	cmpq	24(%rsp), %rcx          # 8-byte Folded Reload
	leaq	1(%rcx), %rcx
	jle	.LBB5_5
.LBB5_1:                                # %polly.par.setup
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_5 Depth 2
                                        #       Child Loop BB5_6 Depth 3
                                        #         Child Loop BB5_9 Depth 4
                                        #           Child Loop BB5_10 Depth 5
                                        #             Child Loop BB5_13 Depth 6
                                        #               Child Loop BB5_11 Depth 7
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB5_2
# BB#14:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end5:
	.size	main_polly_subfn_1, .Lfunc_end5-main_polly_subfn_1
	.cfi_endproc

	.type	A,@object               # @A
	.comm	A,8388608,16
	.type	B,@object               # @B
	.comm	B,8388608,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%lld "
	.size	.L.str, 6

	.type	C,@object               # @C
	.comm	C,8388608,16
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
	.asciz	"print_array"           # string offset=285
.Linfo_string10:
	.asciz	"main"                  # string offset=297
.Linfo_string11:
	.asciz	"int"                   # string offset=302
.Linfo_string12:
	.asciz	"i"                     # string offset=306
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
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	249                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0xf2 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
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
	.byte	7                       # Abbrev [7] 0x8b:0x22 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
                                        # DW_AT_external
	.byte	8                       # Abbrev [8] 0xa0:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	245                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0xad:0x22 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
                                        # DW_AT_external
	.byte	8                       # Abbrev [8] 0xc2:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	21                      # DW_AT_decl_line
	.long	245                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0xcf:0x26 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
	.long	245                     # DW_AT_type
                                        # DW_AT_external
	.byte	8                       # Abbrev [8] 0xe8:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	245                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0xf5:0x7 DW_TAG_base_type
	.long	.Linfo_string11         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
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
	.long	253                     # Compilation Unit Length
	.long	42                      # DIE offset
	.asciz	"A"                     # External Name
	.long	97                      # DIE offset
	.asciz	"B"                     # External Name
	.long	118                     # DIE offset
	.asciz	"C"                     # External Name
	.long	139                     # DIE offset
	.asciz	"init_array"            # External Name
	.long	207                     # DIE offset
	.asciz	"main"                  # External Name
	.long	173                     # DIE offset
	.asciz	"print_array"           # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	253                     # Compilation Unit Length
	.long	83                      # DIE offset
	.asciz	"long long int"         # External Name
	.long	245                     # DIE offset
	.asciz	"int"                   # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
