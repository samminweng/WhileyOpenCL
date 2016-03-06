	.text
	.file	"MatrixMult.vector.ll"
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
# BB#0:                                 # %polly.split_new_and_old
	pushq	%rbp
.Ltmp0:
	.cfi_def_cfa_offset 16
.Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp2:
	.cfi_def_cfa_register %rbp
	xorl	%r8d, %r8d
	movl	$240, %ecx
.Ltmp3:
	#DEBUG_VALUE: init_array:i <- 0
	movaps	.LCPI0_0(%rip), %xmm0   # xmm0 = [1,1]
	.p2align	4, 0x90
.LBB0_1:                                # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
                                        #       Child Loop BB0_3 Depth 3
	movq	%rcx, %rax
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB0_2:                                # %polly.loop_header34
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_3 Depth 3
	movq	$-1, %rdi
	movq	%rax, %rdx
	.p2align	4, 0x90
.LBB0_3:                                # %polly.stmt.polly.loop_preheader20
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	%xmm0, A-240(%rdx)
	movaps	%xmm0, B-240(%rdx)
	movaps	%xmm0, A-224(%rdx)
	movaps	%xmm0, B-224(%rdx)
	movaps	%xmm0, A-208(%rdx)
	movaps	%xmm0, B-208(%rdx)
	movaps	%xmm0, A-192(%rdx)
	movaps	%xmm0, B-192(%rdx)
	movaps	%xmm0, A-176(%rdx)
	movaps	%xmm0, B-176(%rdx)
	movaps	%xmm0, A-160(%rdx)
	movaps	%xmm0, B-160(%rdx)
	movaps	%xmm0, A-144(%rdx)
	movaps	%xmm0, B-144(%rdx)
	movaps	%xmm0, A-128(%rdx)
	movaps	%xmm0, B-128(%rdx)
	movaps	%xmm0, A-112(%rdx)
	movaps	%xmm0, B-112(%rdx)
	movaps	%xmm0, A-96(%rdx)
	movaps	%xmm0, B-96(%rdx)
	movaps	%xmm0, A-80(%rdx)
	movaps	%xmm0, B-80(%rdx)
	movaps	%xmm0, A-64(%rdx)
	movaps	%xmm0, B-64(%rdx)
	movaps	%xmm0, A-48(%rdx)
	movaps	%xmm0, B-48(%rdx)
	movaps	%xmm0, A-32(%rdx)
	movaps	%xmm0, B-32(%rdx)
	movaps	%xmm0, A-16(%rdx)
	movaps	%xmm0, B-16(%rdx)
	movaps	%xmm0, A(%rdx)
	movaps	%xmm0, B(%rdx)
	incq	%rdi
	addq	$8192, %rdx             # imm = 0x2000
	cmpq	$31, %rdi
	jl	.LBB0_3
# BB#4:                                 # %polly.loop_exit42
                                        #   in Loop: Header=BB0_2 Depth=2
	addq	$256, %rax              # imm = 0x100
	cmpq	$31, %rsi
	leaq	1(%rsi), %rsi
	jl	.LBB0_2
# BB#5:                                 # %polly.loop_exit36
                                        #   in Loop: Header=BB0_1 Depth=1
	addq	$262144, %rcx           # imm = 0x40000
	cmpq	$31, %r8
	leaq	1(%r8), %r8
	jl	.LBB0_1
# BB#6:                                 # %polly.exiting
.Ltmp4:
	.loc	1 17 1 prologue_end     # MatrixMult.c:17:1
	popq	%rbp
	retq
.Ltmp5:
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
.Ltmp6:
	.cfi_def_cfa_offset 16
.Ltmp7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp8:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
.Ltmp9:
	.cfi_offset %rbx, -48
.Ltmp10:
	.cfi_offset %r12, -40
.Ltmp11:
	.cfi_offset %r14, -32
.Ltmp12:
	.cfi_offset %r15, -24
	movl	$C, %r14d
.Ltmp13:
	#DEBUG_VALUE: print_array:i <- 0
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB1_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
.Ltmp14:
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
.Ltmp15:
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
.Ltmp16:
	.loc	1 26 17 is_stmt 0       # MatrixMult.c:26:17
	cmpl	$79, %eax
	jne	.LBB1_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB1_2 Depth=2
.Ltmp17:
	.loc	1 26 37 discriminator 1 # MatrixMult.c:26:37
	movq	stdout(%rip), %rsi
	.loc	1 26 29 discriminator 1 # MatrixMult.c:26:29
	movl	$10, %edi
	callq	fputc
.Ltmp18:
.LBB1_4:                                # %for.inc
                                        #   in Loop: Header=BB1_2 Depth=2
	.loc	1 24 9 is_stmt 1 discriminator 1 # MatrixMult.c:24:9
	incq	%rbx
.Ltmp19:
	.loc	1 25 21                 # MatrixMult.c:25:21
	movq	stdout(%rip), %rcx
.Ltmp20:
	.loc	1 24 9 discriminator 1  # MatrixMult.c:24:9
	addq	$8, %r12
	cmpq	$1024, %rbx             # imm = 0x400
	jne	.LBB1_2
.Ltmp21:
# BB#5:                                 # %for.end
                                        #   in Loop: Header=BB1_1 Depth=1
	.loc	1 28 9                  # MatrixMult.c:28:9
	movl	$10, %edi
	movq	%rcx, %rsi
	callq	fputc
.Ltmp22:
	.loc	1 23 5 discriminator 1  # MatrixMult.c:23:5
	incq	%r15
	addq	$8192, %r14             # imm = 0x2000
	cmpq	$1024, %r15             # imm = 0x400
	jne	.LBB1_1
.Ltmp23:
# BB#6:                                 # %for.end11
	.loc	1 30 1                  # MatrixMult.c:30:1
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp24:
.Lfunc_end1:
	.size	print_array, .Lfunc_end1-print_array
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI2_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin2:
	.loc	1 33 0                  # MatrixMult.c:33:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp25:
	.cfi_def_cfa_offset 16
.Ltmp26:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp27:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
.Ltmp28:
	.cfi_offset %rbx, -56
.Ltmp29:
	.cfi_offset %r12, -48
.Ltmp30:
	.cfi_offset %r13, -40
.Ltmp31:
	.cfi_offset %r14, -32
.Ltmp32:
	.cfi_offset %r15, -24
	xorl	%r8d, %r8d
	movl	$240, %eax
.Ltmp33:
	#DEBUG_VALUE: init_array:i <- 0
	.loc	1 37 5 prologue_end     # MatrixMult.c:37:5
	movaps	.LCPI2_0(%rip), %xmm0   # xmm0 = [1,1]
	movl	$C+253952, %r9d
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB2_1:                                # %polly.loop_preheader2.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
                                        #       Child Loop BB2_3 Depth 3
	movq	%rax, %rbx
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB2_2:                                # %polly.loop_preheader8.i
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_3 Depth 3
	movq	%rbx, %rdx
	movl	$32, %esi
	.p2align	4, 0x90
.LBB2_3:                                # %polly.loop_preheader20.i
                                        #   Parent Loop BB2_1 Depth=1
                                        #     Parent Loop BB2_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	%xmm0, A-240(%rdx)
	movaps	%xmm0, B-240(%rdx)
	movaps	%xmm0, A-224(%rdx)
	movaps	%xmm0, B-224(%rdx)
	movaps	%xmm0, A-208(%rdx)
	movaps	%xmm0, B-208(%rdx)
	movaps	%xmm0, A-192(%rdx)
	movaps	%xmm0, B-192(%rdx)
	movaps	%xmm0, A-176(%rdx)
	movaps	%xmm0, B-176(%rdx)
	movaps	%xmm0, A-160(%rdx)
	movaps	%xmm0, B-160(%rdx)
	movaps	%xmm0, A-144(%rdx)
	movaps	%xmm0, B-144(%rdx)
	movaps	%xmm0, A-128(%rdx)
	movaps	%xmm0, B-128(%rdx)
	movaps	%xmm0, A-112(%rdx)
	movaps	%xmm0, B-112(%rdx)
	movaps	%xmm0, A-96(%rdx)
	movaps	%xmm0, B-96(%rdx)
	movaps	%xmm0, A-80(%rdx)
	movaps	%xmm0, B-80(%rdx)
	movaps	%xmm0, A-64(%rdx)
	movaps	%xmm0, B-64(%rdx)
	movaps	%xmm0, A-48(%rdx)
	movaps	%xmm0, B-48(%rdx)
	movaps	%xmm0, A-32(%rdx)
	movaps	%xmm0, B-32(%rdx)
	movaps	%xmm0, A-16(%rdx)
	movaps	%xmm0, B-16(%rdx)
	movaps	%xmm0, A(%rdx)
	movaps	%xmm0, B(%rdx)
	addq	$8192, %rdx             # imm = 0x2000
	decq	%rsi
	jne	.LBB2_3
# BB#4:                                 # %polly.loop_exit9.i
                                        #   in Loop: Header=BB2_2 Depth=2
	incq	%rdi
	addq	$256, %rbx              # imm = 0x100
	cmpq	$32, %rdi
	jne	.LBB2_2
# BB#5:                                 # %polly.loop_exit3.i
                                        #   in Loop: Header=BB2_1 Depth=1
	incq	%rcx
	addq	$262144, %rax           # imm = 0x40000
	cmpq	$32, %rcx
	jne	.LBB2_1
# BB#6:
	xorps	%xmm0, %xmm0
	xorl	%eax, %eax
	movl	$A+24, %ecx
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB2_8:                                # %polly.loop_preheader2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_9 Depth 2
	movq	%r9, %rdi
	movl	$32, %edx
	.p2align	4, 0x90
.LBB2_9:                                # %polly.loop_preheader14
                                        #   Parent Loop BB2_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movaps	%xmm0, -253712(%rdi)
	movaps	%xmm0, -253728(%rdi)
	movaps	%xmm0, -253744(%rdi)
	movaps	%xmm0, -253760(%rdi)
	movaps	%xmm0, -253776(%rdi)
	movaps	%xmm0, -253792(%rdi)
	movaps	%xmm0, -253808(%rdi)
	movaps	%xmm0, -253824(%rdi)
	movaps	%xmm0, -253840(%rdi)
	movaps	%xmm0, -253856(%rdi)
	movaps	%xmm0, -253872(%rdi)
	movaps	%xmm0, -253888(%rdi)
	movaps	%xmm0, -253904(%rdi)
	movaps	%xmm0, -253920(%rdi)
	movaps	%xmm0, -253936(%rdi)
	movaps	%xmm0, -253952(%rdi)
	movaps	%xmm0, -245520(%rdi)
	movaps	%xmm0, -245536(%rdi)
	movaps	%xmm0, -245552(%rdi)
	movaps	%xmm0, -245568(%rdi)
	movaps	%xmm0, -245584(%rdi)
	movaps	%xmm0, -245600(%rdi)
	movaps	%xmm0, -245616(%rdi)
	movaps	%xmm0, -245632(%rdi)
	movaps	%xmm0, -245648(%rdi)
	movaps	%xmm0, -245664(%rdi)
	movaps	%xmm0, -245680(%rdi)
	movaps	%xmm0, -245696(%rdi)
	movaps	%xmm0, -245712(%rdi)
	movaps	%xmm0, -245728(%rdi)
	movaps	%xmm0, -245744(%rdi)
	movaps	%xmm0, -245760(%rdi)
	movaps	%xmm0, -237328(%rdi)
	movaps	%xmm0, -237344(%rdi)
	movaps	%xmm0, -237360(%rdi)
	movaps	%xmm0, -237376(%rdi)
	movaps	%xmm0, -237392(%rdi)
	movaps	%xmm0, -237408(%rdi)
	movaps	%xmm0, -237424(%rdi)
	movaps	%xmm0, -237440(%rdi)
	movaps	%xmm0, -237456(%rdi)
	movaps	%xmm0, -237472(%rdi)
	movaps	%xmm0, -237488(%rdi)
	movaps	%xmm0, -237504(%rdi)
	movaps	%xmm0, -237520(%rdi)
	movaps	%xmm0, -237536(%rdi)
	movaps	%xmm0, -237552(%rdi)
	movaps	%xmm0, -237568(%rdi)
	movaps	%xmm0, -229136(%rdi)
	movaps	%xmm0, -229152(%rdi)
	movaps	%xmm0, -229168(%rdi)
	movaps	%xmm0, -229184(%rdi)
	movaps	%xmm0, -229200(%rdi)
	movaps	%xmm0, -229216(%rdi)
	movaps	%xmm0, -229232(%rdi)
	movaps	%xmm0, -229248(%rdi)
	movaps	%xmm0, -229264(%rdi)
	movaps	%xmm0, -229280(%rdi)
	movaps	%xmm0, -229296(%rdi)
	movaps	%xmm0, -229312(%rdi)
	movaps	%xmm0, -229328(%rdi)
	movaps	%xmm0, -229344(%rdi)
	movaps	%xmm0, -229360(%rdi)
	movaps	%xmm0, -229376(%rdi)
	movaps	%xmm0, -220944(%rdi)
	movaps	%xmm0, -220960(%rdi)
	movaps	%xmm0, -220976(%rdi)
	movaps	%xmm0, -220992(%rdi)
	movaps	%xmm0, -221008(%rdi)
	movaps	%xmm0, -221024(%rdi)
	movaps	%xmm0, -221040(%rdi)
	movaps	%xmm0, -221056(%rdi)
	movaps	%xmm0, -221072(%rdi)
	movaps	%xmm0, -221088(%rdi)
	movaps	%xmm0, -221104(%rdi)
	movaps	%xmm0, -221120(%rdi)
	movaps	%xmm0, -221136(%rdi)
	movaps	%xmm0, -221152(%rdi)
	movaps	%xmm0, -221168(%rdi)
	movaps	%xmm0, -221184(%rdi)
	movaps	%xmm0, -212752(%rdi)
	movaps	%xmm0, -212768(%rdi)
	movaps	%xmm0, -212784(%rdi)
	movaps	%xmm0, -212800(%rdi)
	movaps	%xmm0, -212816(%rdi)
	movaps	%xmm0, -212832(%rdi)
	movaps	%xmm0, -212848(%rdi)
	movaps	%xmm0, -212864(%rdi)
	movaps	%xmm0, -212880(%rdi)
	movaps	%xmm0, -212896(%rdi)
	movaps	%xmm0, -212912(%rdi)
	movaps	%xmm0, -212928(%rdi)
	movaps	%xmm0, -212944(%rdi)
	movaps	%xmm0, -212960(%rdi)
	movaps	%xmm0, -212976(%rdi)
	movaps	%xmm0, -212992(%rdi)
	movaps	%xmm0, -204560(%rdi)
	movaps	%xmm0, -204576(%rdi)
	movaps	%xmm0, -204592(%rdi)
	movaps	%xmm0, -204608(%rdi)
	movaps	%xmm0, -204624(%rdi)
	movaps	%xmm0, -204640(%rdi)
	movaps	%xmm0, -204656(%rdi)
	movaps	%xmm0, -204672(%rdi)
	movaps	%xmm0, -204688(%rdi)
	movaps	%xmm0, -204704(%rdi)
	movaps	%xmm0, -204720(%rdi)
	movaps	%xmm0, -204736(%rdi)
	movaps	%xmm0, -204752(%rdi)
	movaps	%xmm0, -204768(%rdi)
	movaps	%xmm0, -204784(%rdi)
	movaps	%xmm0, -204800(%rdi)
	movaps	%xmm0, -196368(%rdi)
	movaps	%xmm0, -196384(%rdi)
	movaps	%xmm0, -196400(%rdi)
	movaps	%xmm0, -196416(%rdi)
	movaps	%xmm0, -196432(%rdi)
	movaps	%xmm0, -196448(%rdi)
	movaps	%xmm0, -196464(%rdi)
	movaps	%xmm0, -196480(%rdi)
	movaps	%xmm0, -196496(%rdi)
	movaps	%xmm0, -196512(%rdi)
	movaps	%xmm0, -196528(%rdi)
	movaps	%xmm0, -196544(%rdi)
	movaps	%xmm0, -196560(%rdi)
	movaps	%xmm0, -196576(%rdi)
	movaps	%xmm0, -196592(%rdi)
	movaps	%xmm0, -196608(%rdi)
	movaps	%xmm0, -188176(%rdi)
	movaps	%xmm0, -188192(%rdi)
	movaps	%xmm0, -188208(%rdi)
	movaps	%xmm0, -188224(%rdi)
	movaps	%xmm0, -188240(%rdi)
	movaps	%xmm0, -188256(%rdi)
	movaps	%xmm0, -188272(%rdi)
	movaps	%xmm0, -188288(%rdi)
	movaps	%xmm0, -188304(%rdi)
	movaps	%xmm0, -188320(%rdi)
	movaps	%xmm0, -188336(%rdi)
	movaps	%xmm0, -188352(%rdi)
	movaps	%xmm0, -188368(%rdi)
	movaps	%xmm0, -188384(%rdi)
	movaps	%xmm0, -188400(%rdi)
	movaps	%xmm0, -188416(%rdi)
	movaps	%xmm0, -179984(%rdi)
	movaps	%xmm0, -180000(%rdi)
	movaps	%xmm0, -180016(%rdi)
	movaps	%xmm0, -180032(%rdi)
	movaps	%xmm0, -180048(%rdi)
	movaps	%xmm0, -180064(%rdi)
	movaps	%xmm0, -180080(%rdi)
	movaps	%xmm0, -180096(%rdi)
	movaps	%xmm0, -180112(%rdi)
	movaps	%xmm0, -180128(%rdi)
	movaps	%xmm0, -180144(%rdi)
	movaps	%xmm0, -180160(%rdi)
	movaps	%xmm0, -180176(%rdi)
	movaps	%xmm0, -180192(%rdi)
	movaps	%xmm0, -180208(%rdi)
	movaps	%xmm0, -180224(%rdi)
	movaps	%xmm0, -171792(%rdi)
	movaps	%xmm0, -171808(%rdi)
	movaps	%xmm0, -171824(%rdi)
	movaps	%xmm0, -171840(%rdi)
	movaps	%xmm0, -171856(%rdi)
	movaps	%xmm0, -171872(%rdi)
	movaps	%xmm0, -171888(%rdi)
	movaps	%xmm0, -171904(%rdi)
	movaps	%xmm0, -171920(%rdi)
	movaps	%xmm0, -171936(%rdi)
	movaps	%xmm0, -171952(%rdi)
	movaps	%xmm0, -171968(%rdi)
	movaps	%xmm0, -171984(%rdi)
	movaps	%xmm0, -172000(%rdi)
	movaps	%xmm0, -172016(%rdi)
	movaps	%xmm0, -172032(%rdi)
	movaps	%xmm0, -163600(%rdi)
	movaps	%xmm0, -163616(%rdi)
	movaps	%xmm0, -163632(%rdi)
	movaps	%xmm0, -163648(%rdi)
	movaps	%xmm0, -163664(%rdi)
	movaps	%xmm0, -163680(%rdi)
	movaps	%xmm0, -163696(%rdi)
	movaps	%xmm0, -163712(%rdi)
	movaps	%xmm0, -163728(%rdi)
	movaps	%xmm0, -163744(%rdi)
	movaps	%xmm0, -163760(%rdi)
	movaps	%xmm0, -163776(%rdi)
	movaps	%xmm0, -163792(%rdi)
	movaps	%xmm0, -163808(%rdi)
	movaps	%xmm0, -163824(%rdi)
	movaps	%xmm0, -163840(%rdi)
	movaps	%xmm0, -155408(%rdi)
	movaps	%xmm0, -155424(%rdi)
	movaps	%xmm0, -155440(%rdi)
	movaps	%xmm0, -155456(%rdi)
	movaps	%xmm0, -155472(%rdi)
	movaps	%xmm0, -155488(%rdi)
	movaps	%xmm0, -155504(%rdi)
	movaps	%xmm0, -155520(%rdi)
	movaps	%xmm0, -155536(%rdi)
	movaps	%xmm0, -155552(%rdi)
	movaps	%xmm0, -155568(%rdi)
	movaps	%xmm0, -155584(%rdi)
	movaps	%xmm0, -155600(%rdi)
	movaps	%xmm0, -155616(%rdi)
	movaps	%xmm0, -155632(%rdi)
	movaps	%xmm0, -155648(%rdi)
	movaps	%xmm0, -147216(%rdi)
	movaps	%xmm0, -147232(%rdi)
	movaps	%xmm0, -147248(%rdi)
	movaps	%xmm0, -147264(%rdi)
	movaps	%xmm0, -147280(%rdi)
	movaps	%xmm0, -147296(%rdi)
	movaps	%xmm0, -147312(%rdi)
	movaps	%xmm0, -147328(%rdi)
	movaps	%xmm0, -147344(%rdi)
	movaps	%xmm0, -147360(%rdi)
	movaps	%xmm0, -147376(%rdi)
	movaps	%xmm0, -147392(%rdi)
	movaps	%xmm0, -147408(%rdi)
	movaps	%xmm0, -147424(%rdi)
	movaps	%xmm0, -147440(%rdi)
	movaps	%xmm0, -147456(%rdi)
	movaps	%xmm0, -139024(%rdi)
	movaps	%xmm0, -139040(%rdi)
	movaps	%xmm0, -139056(%rdi)
	movaps	%xmm0, -139072(%rdi)
	movaps	%xmm0, -139088(%rdi)
	movaps	%xmm0, -139104(%rdi)
	movaps	%xmm0, -139120(%rdi)
	movaps	%xmm0, -139136(%rdi)
	movaps	%xmm0, -139152(%rdi)
	movaps	%xmm0, -139168(%rdi)
	movaps	%xmm0, -139184(%rdi)
	movaps	%xmm0, -139200(%rdi)
	movaps	%xmm0, -139216(%rdi)
	movaps	%xmm0, -139232(%rdi)
	movaps	%xmm0, -139248(%rdi)
	movaps	%xmm0, -139264(%rdi)
	movaps	%xmm0, -130832(%rdi)
	movaps	%xmm0, -130848(%rdi)
	movaps	%xmm0, -130864(%rdi)
	movaps	%xmm0, -130880(%rdi)
	movaps	%xmm0, -130896(%rdi)
	movaps	%xmm0, -130912(%rdi)
	movaps	%xmm0, -130928(%rdi)
	movaps	%xmm0, -130944(%rdi)
	movaps	%xmm0, -130960(%rdi)
	movaps	%xmm0, -130976(%rdi)
	movaps	%xmm0, -130992(%rdi)
	movaps	%xmm0, -131008(%rdi)
	movaps	%xmm0, -131024(%rdi)
	movaps	%xmm0, -131040(%rdi)
	movaps	%xmm0, -131056(%rdi)
	movaps	%xmm0, -131072(%rdi)
	movaps	%xmm0, -122640(%rdi)
	movaps	%xmm0, -122656(%rdi)
	movaps	%xmm0, -122672(%rdi)
	movaps	%xmm0, -122688(%rdi)
	movaps	%xmm0, -122704(%rdi)
	movaps	%xmm0, -122720(%rdi)
	movaps	%xmm0, -122736(%rdi)
	movaps	%xmm0, -122752(%rdi)
	movaps	%xmm0, -122768(%rdi)
	movaps	%xmm0, -122784(%rdi)
	movaps	%xmm0, -122800(%rdi)
	movaps	%xmm0, -122816(%rdi)
	movaps	%xmm0, -122832(%rdi)
	movaps	%xmm0, -122848(%rdi)
	movaps	%xmm0, -122864(%rdi)
	movaps	%xmm0, -122880(%rdi)
	movaps	%xmm0, -114448(%rdi)
	movaps	%xmm0, -114464(%rdi)
	movaps	%xmm0, -114480(%rdi)
	movaps	%xmm0, -114496(%rdi)
	movaps	%xmm0, -114512(%rdi)
	movaps	%xmm0, -114528(%rdi)
	movaps	%xmm0, -114544(%rdi)
	movaps	%xmm0, -114560(%rdi)
	movaps	%xmm0, -114576(%rdi)
	movaps	%xmm0, -114592(%rdi)
	movaps	%xmm0, -114608(%rdi)
	movaps	%xmm0, -114624(%rdi)
	movaps	%xmm0, -114640(%rdi)
	movaps	%xmm0, -114656(%rdi)
	movaps	%xmm0, -114672(%rdi)
	movaps	%xmm0, -114688(%rdi)
	movaps	%xmm0, -106256(%rdi)
	movaps	%xmm0, -106272(%rdi)
	movaps	%xmm0, -106288(%rdi)
	movaps	%xmm0, -106304(%rdi)
	movaps	%xmm0, -106320(%rdi)
	movaps	%xmm0, -106336(%rdi)
	movaps	%xmm0, -106352(%rdi)
	movaps	%xmm0, -106368(%rdi)
	movaps	%xmm0, -106384(%rdi)
	movaps	%xmm0, -106400(%rdi)
	movaps	%xmm0, -106416(%rdi)
	movaps	%xmm0, -106432(%rdi)
	movaps	%xmm0, -106448(%rdi)
	movaps	%xmm0, -106464(%rdi)
	movaps	%xmm0, -106480(%rdi)
	movaps	%xmm0, -106496(%rdi)
	movaps	%xmm0, -98064(%rdi)
	movaps	%xmm0, -98080(%rdi)
	movaps	%xmm0, -98096(%rdi)
	movaps	%xmm0, -98112(%rdi)
	movaps	%xmm0, -98128(%rdi)
	movaps	%xmm0, -98144(%rdi)
	movaps	%xmm0, -98160(%rdi)
	movaps	%xmm0, -98176(%rdi)
	movaps	%xmm0, -98192(%rdi)
	movaps	%xmm0, -98208(%rdi)
	movaps	%xmm0, -98224(%rdi)
	movaps	%xmm0, -98240(%rdi)
	movaps	%xmm0, -98256(%rdi)
	movaps	%xmm0, -98272(%rdi)
	movaps	%xmm0, -98288(%rdi)
	movaps	%xmm0, -98304(%rdi)
	movaps	%xmm0, -89872(%rdi)
	movaps	%xmm0, -89888(%rdi)
	movaps	%xmm0, -89904(%rdi)
	movaps	%xmm0, -89920(%rdi)
	movaps	%xmm0, -89936(%rdi)
	movaps	%xmm0, -89952(%rdi)
	movaps	%xmm0, -89968(%rdi)
	movaps	%xmm0, -89984(%rdi)
	movaps	%xmm0, -90000(%rdi)
	movaps	%xmm0, -90016(%rdi)
	movaps	%xmm0, -90032(%rdi)
	movaps	%xmm0, -90048(%rdi)
	movaps	%xmm0, -90064(%rdi)
	movaps	%xmm0, -90080(%rdi)
	movaps	%xmm0, -90096(%rdi)
	movaps	%xmm0, -90112(%rdi)
	movaps	%xmm0, -81680(%rdi)
	movaps	%xmm0, -81696(%rdi)
	movaps	%xmm0, -81712(%rdi)
	movaps	%xmm0, -81728(%rdi)
	movaps	%xmm0, -81744(%rdi)
	movaps	%xmm0, -81760(%rdi)
	movaps	%xmm0, -81776(%rdi)
	movaps	%xmm0, -81792(%rdi)
	movaps	%xmm0, -81808(%rdi)
	movaps	%xmm0, -81824(%rdi)
	movaps	%xmm0, -81840(%rdi)
	movaps	%xmm0, -81856(%rdi)
	movaps	%xmm0, -81872(%rdi)
	movaps	%xmm0, -81888(%rdi)
	movaps	%xmm0, -81904(%rdi)
	movaps	%xmm0, -81920(%rdi)
	movaps	%xmm0, -73488(%rdi)
	movaps	%xmm0, -73504(%rdi)
	movaps	%xmm0, -73520(%rdi)
	movaps	%xmm0, -73536(%rdi)
	movaps	%xmm0, -73552(%rdi)
	movaps	%xmm0, -73568(%rdi)
	movaps	%xmm0, -73584(%rdi)
	movaps	%xmm0, -73600(%rdi)
	movaps	%xmm0, -73616(%rdi)
	movaps	%xmm0, -73632(%rdi)
	movaps	%xmm0, -73648(%rdi)
	movaps	%xmm0, -73664(%rdi)
	movaps	%xmm0, -73680(%rdi)
	movaps	%xmm0, -73696(%rdi)
	movaps	%xmm0, -73712(%rdi)
	movaps	%xmm0, -73728(%rdi)
	movaps	%xmm0, -65296(%rdi)
	movaps	%xmm0, -65312(%rdi)
	movaps	%xmm0, -65328(%rdi)
	movaps	%xmm0, -65344(%rdi)
	movaps	%xmm0, -65360(%rdi)
	movaps	%xmm0, -65376(%rdi)
	movaps	%xmm0, -65392(%rdi)
	movaps	%xmm0, -65408(%rdi)
	movaps	%xmm0, -65424(%rdi)
	movaps	%xmm0, -65440(%rdi)
	movaps	%xmm0, -65456(%rdi)
	movaps	%xmm0, -65472(%rdi)
	movaps	%xmm0, -65488(%rdi)
	movaps	%xmm0, -65504(%rdi)
	movaps	%xmm0, -65520(%rdi)
	movaps	%xmm0, -65536(%rdi)
	movaps	%xmm0, -57104(%rdi)
	movaps	%xmm0, -57120(%rdi)
	movaps	%xmm0, -57136(%rdi)
	movaps	%xmm0, -57152(%rdi)
	movaps	%xmm0, -57168(%rdi)
	movaps	%xmm0, -57184(%rdi)
	movaps	%xmm0, -57200(%rdi)
	movaps	%xmm0, -57216(%rdi)
	movaps	%xmm0, -57232(%rdi)
	movaps	%xmm0, -57248(%rdi)
	movaps	%xmm0, -57264(%rdi)
	movaps	%xmm0, -57280(%rdi)
	movaps	%xmm0, -57296(%rdi)
	movaps	%xmm0, -57312(%rdi)
	movaps	%xmm0, -57328(%rdi)
	movaps	%xmm0, -57344(%rdi)
	movaps	%xmm0, -48912(%rdi)
	movaps	%xmm0, -48928(%rdi)
	movaps	%xmm0, -48944(%rdi)
	movaps	%xmm0, -48960(%rdi)
	movaps	%xmm0, -48976(%rdi)
	movaps	%xmm0, -48992(%rdi)
	movaps	%xmm0, -49008(%rdi)
	movaps	%xmm0, -49024(%rdi)
	movaps	%xmm0, -49040(%rdi)
	movaps	%xmm0, -49056(%rdi)
	movaps	%xmm0, -49072(%rdi)
	movaps	%xmm0, -49088(%rdi)
	movaps	%xmm0, -49104(%rdi)
	movaps	%xmm0, -49120(%rdi)
	movaps	%xmm0, -49136(%rdi)
	movaps	%xmm0, -49152(%rdi)
	movaps	%xmm0, -40720(%rdi)
	movaps	%xmm0, -40736(%rdi)
	movaps	%xmm0, -40752(%rdi)
	movaps	%xmm0, -40768(%rdi)
	movaps	%xmm0, -40784(%rdi)
	movaps	%xmm0, -40800(%rdi)
	movaps	%xmm0, -40816(%rdi)
	movaps	%xmm0, -40832(%rdi)
	movaps	%xmm0, -40848(%rdi)
	movaps	%xmm0, -40864(%rdi)
	movaps	%xmm0, -40880(%rdi)
	movaps	%xmm0, -40896(%rdi)
	movaps	%xmm0, -40912(%rdi)
	movaps	%xmm0, -40928(%rdi)
	movaps	%xmm0, -40944(%rdi)
	movaps	%xmm0, -40960(%rdi)
	movaps	%xmm0, -32528(%rdi)
	movaps	%xmm0, -32544(%rdi)
	movaps	%xmm0, -32560(%rdi)
	movaps	%xmm0, -32576(%rdi)
	movaps	%xmm0, -32592(%rdi)
	movaps	%xmm0, -32608(%rdi)
	movaps	%xmm0, -32624(%rdi)
	movaps	%xmm0, -32640(%rdi)
	movaps	%xmm0, -32656(%rdi)
	movaps	%xmm0, -32672(%rdi)
	movaps	%xmm0, -32688(%rdi)
	movaps	%xmm0, -32704(%rdi)
	movaps	%xmm0, -32720(%rdi)
	movaps	%xmm0, -32736(%rdi)
	movaps	%xmm0, -32752(%rdi)
	movaps	%xmm0, -32768(%rdi)
	movaps	%xmm0, -24336(%rdi)
	movaps	%xmm0, -24352(%rdi)
	movaps	%xmm0, -24368(%rdi)
	movaps	%xmm0, -24384(%rdi)
	movaps	%xmm0, -24400(%rdi)
	movaps	%xmm0, -24416(%rdi)
	movaps	%xmm0, -24432(%rdi)
	movaps	%xmm0, -24448(%rdi)
	movaps	%xmm0, -24464(%rdi)
	movaps	%xmm0, -24480(%rdi)
	movaps	%xmm0, -24496(%rdi)
	movaps	%xmm0, -24512(%rdi)
	movaps	%xmm0, -24528(%rdi)
	movaps	%xmm0, -24544(%rdi)
	movaps	%xmm0, -24560(%rdi)
	movaps	%xmm0, -24576(%rdi)
	movaps	%xmm0, -16144(%rdi)
	movaps	%xmm0, -16160(%rdi)
	movaps	%xmm0, -16176(%rdi)
	movaps	%xmm0, -16192(%rdi)
	movaps	%xmm0, -16208(%rdi)
	movaps	%xmm0, -16224(%rdi)
	movaps	%xmm0, -16240(%rdi)
	movaps	%xmm0, -16256(%rdi)
	movaps	%xmm0, -16272(%rdi)
	movaps	%xmm0, -16288(%rdi)
	movaps	%xmm0, -16304(%rdi)
	movaps	%xmm0, -16320(%rdi)
	movaps	%xmm0, -16336(%rdi)
	movaps	%xmm0, -16352(%rdi)
	movaps	%xmm0, -16368(%rdi)
	movaps	%xmm0, -16384(%rdi)
	movaps	%xmm0, -7952(%rdi)
	movaps	%xmm0, -7968(%rdi)
	movaps	%xmm0, -7984(%rdi)
	movaps	%xmm0, -8000(%rdi)
	movaps	%xmm0, -8016(%rdi)
	movaps	%xmm0, -8032(%rdi)
	movaps	%xmm0, -8048(%rdi)
	movaps	%xmm0, -8064(%rdi)
	movaps	%xmm0, -8080(%rdi)
	movaps	%xmm0, -8096(%rdi)
	movaps	%xmm0, -8112(%rdi)
	movaps	%xmm0, -8128(%rdi)
	movaps	%xmm0, -8144(%rdi)
	movaps	%xmm0, -8160(%rdi)
	movaps	%xmm0, -8176(%rdi)
	movaps	%xmm0, -8192(%rdi)
	movaps	%xmm0, 240(%rdi)
	movaps	%xmm0, 224(%rdi)
	movaps	%xmm0, 208(%rdi)
	movaps	%xmm0, 192(%rdi)
	movaps	%xmm0, 176(%rdi)
	movaps	%xmm0, 160(%rdi)
	movaps	%xmm0, 144(%rdi)
	movaps	%xmm0, 128(%rdi)
	movaps	%xmm0, 112(%rdi)
	movaps	%xmm0, 96(%rdi)
	movaps	%xmm0, 80(%rdi)
	movaps	%xmm0, 64(%rdi)
	movaps	%xmm0, 48(%rdi)
	movaps	%xmm0, 32(%rdi)
	movaps	%xmm0, 16(%rdi)
	movaps	%xmm0, (%rdi)
	addq	$256, %rdi              # imm = 0x100
	decq	%rdx
	jne	.LBB2_9
# BB#7:                                 # %polly.loop_exit3
                                        #   in Loop: Header=BB2_8 Depth=1
	incq	%r8
	addq	$262144, %r9            # imm = 0x40000
	cmpq	$32, %r8
	jne	.LBB2_8
	.p2align	4, 0x90
.LBB2_11:                               # %polly.loop_preheader32
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_14 Depth 2
                                        #       Child Loop BB2_15 Depth 3
                                        #         Child Loop BB2_18 Depth 4
                                        #           Child Loop BB2_19 Depth 5
                                        #             Child Loop BB2_20 Depth 6
	movq	%rax, -56(%rbp)         # 8-byte Spill
	shlq	$5, %rax
	movq	%rax, -96(%rbp)         # 8-byte Spill
	movl	$B+24576, %ecx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB2_14:                               # %polly.loop_preheader38
                                        #   Parent Loop BB2_11 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_15 Depth 3
                                        #         Child Loop BB2_18 Depth 4
                                        #           Child Loop BB2_19 Depth 5
                                        #             Child Loop BB2_20 Depth 6
	movq	%rax, -64(%rbp)         # 8-byte Spill
	movq	%rcx, -72(%rbp)         # 8-byte Spill
	movq	%rax, %rdi
	shlq	$5, %rdi
	movq	-48(%rbp), %r10         # 8-byte Reload
	movq	%rcx, %r13
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB2_15:                               # %polly.loop_preheader44
                                        #   Parent Loop BB2_11 Depth=1
                                        #     Parent Loop BB2_14 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB2_18 Depth 4
                                        #           Child Loop BB2_19 Depth 5
                                        #             Child Loop BB2_20 Depth 6
	movq	%rcx, -80(%rbp)         # 8-byte Spill
	movq	%r10, -88(%rbp)         # 8-byte Spill
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB2_18:                               # %polly.loop_preheader50
                                        #   Parent Loop BB2_11 Depth=1
                                        #     Parent Loop BB2_14 Depth=2
                                        #       Parent Loop BB2_15 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB2_19 Depth 5
                                        #             Child Loop BB2_20 Depth 6
	movq	-96(%rbp), %rax         # 8-byte Reload
	leaq	(%r12,%rax), %r15
	movq	%r13, %r8
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB2_19:                               # %polly.loop_preheader56
                                        #   Parent Loop BB2_11 Depth=1
                                        #     Parent Loop BB2_14 Depth=2
                                        #       Parent Loop BB2_15 Depth=3
                                        #         Parent Loop BB2_18 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB2_20 Depth 6
	leaq	(%rsi,%rdi), %rdx
	movq	%r15, %rax
	shlq	$13, %rax
	leaq	C(%rax,%rdx,8), %r9
	movq	C(%rax,%rdx,8), %r14
	movq	%r10, %rbx
	movq	%r8, %rdx
	movl	$8, %r11d
	.p2align	4, 0x90
.LBB2_20:                               # %polly.loop_preheader62
                                        #   Parent Loop BB2_11 Depth=1
                                        #     Parent Loop BB2_14 Depth=2
                                        #       Parent Loop BB2_15 Depth=3
                                        #         Parent Loop BB2_18 Depth=4
                                        #           Parent Loop BB2_19 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	-24576(%rdx), %rax
.Ltmp34:
	.loc	1 43 45                 # MatrixMult.c:43:45
	imulq	-24(%rbx), %rax
	.loc	1 43 35 is_stmt 0       # MatrixMult.c:43:35
	addq	%r14, %rax
	movq	-16384(%rdx), %rcx
	.loc	1 43 45                 # MatrixMult.c:43:45
	imulq	-16(%rbx), %rcx
	.loc	1 43 35                 # MatrixMult.c:43:35
	addq	%rax, %rcx
	movq	-8192(%rdx), %rax
	.loc	1 43 45                 # MatrixMult.c:43:45
	imulq	-8(%rbx), %rax
	.loc	1 43 35                 # MatrixMult.c:43:35
	addq	%rcx, %rax
	movq	(%rdx), %r14
	.loc	1 43 45                 # MatrixMult.c:43:45
	imulq	(%rbx), %r14
	.loc	1 43 35                 # MatrixMult.c:43:35
	addq	%rax, %r14
	addq	$32768, %rdx            # imm = 0x8000
	addq	$32, %rbx
	decq	%r11
	jne	.LBB2_20
.Ltmp35:
# BB#16:                                # %polly.loop_exit57
                                        #   in Loop: Header=BB2_19 Depth=5
	movq	%r14, (%r9)
	incq	%rsi
	addq	$8, %r8
	cmpq	$32, %rsi
	jne	.LBB2_19
# BB#17:                                # %polly.loop_exit51
                                        #   in Loop: Header=BB2_18 Depth=4
	incq	%r12
	addq	$8192, %r10             # imm = 0x2000
	cmpq	$32, %r12
	jne	.LBB2_18
# BB#12:                                # %polly.loop_exit45
                                        #   in Loop: Header=BB2_15 Depth=3
	movq	-80(%rbp), %rcx         # 8-byte Reload
	incq	%rcx
	addq	$262144, %r13           # imm = 0x40000
	movq	-88(%rbp), %r10         # 8-byte Reload
	addq	$256, %r10              # imm = 0x100
	cmpq	$32, %rcx
	jne	.LBB2_15
# BB#13:                                # %polly.loop_exit39
                                        #   in Loop: Header=BB2_14 Depth=2
	movq	-64(%rbp), %rax         # 8-byte Reload
	incq	%rax
	movq	-72(%rbp), %rcx         # 8-byte Reload
	addq	$256, %rcx              # imm = 0x100
	cmpq	$32, %rax
	jne	.LBB2_14
# BB#10:                                # %polly.loop_exit33
                                        #   in Loop: Header=BB2_11 Depth=1
	movq	-56(%rbp), %rax         # 8-byte Reload
	incq	%rax
	addq	$262144, -48(%rbp)      # 8-byte Folded Spill
                                        # imm = 0x40000
	cmpq	$32, %rax
	jne	.LBB2_11
# BB#21:                                # %polly.exiting
	.loc	1 47 71 is_stmt 1       # MatrixMult.c:47:71
	movq	C+8388600(%rip), %rcx
	.loc	1 47 5 is_stmt 0        # MatrixMult.c:47:5
	movl	$.L.str.2, %edi
	movl	$1024, %esi             # imm = 0x400
	movl	$1024, %edx             # imm = 0x400
	xorl	%eax, %eax
	callq	printf
	.loc	1 48 5 is_stmt 1        # MatrixMult.c:48:5
	xorl	%eax, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp36:
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
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
	.long	236                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0xe5 DW_TAG_compile_unit
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
	.long	232                     # DW_AT_type
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
	.long	232                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0xcf:0x19 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
	.long	232                     # DW_AT_type
                                        # DW_AT_external
	.byte	5                       # Abbrev [5] 0xe8:0x7 DW_TAG_base_type
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
	.long	240                     # Compilation Unit Length
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
	.long	240                     # Compilation Unit Length
	.long	83                      # DIE offset
	.asciz	"long long int"         # External Name
	.long	232                     # DIE offset
	.asciz	"int"                   # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
