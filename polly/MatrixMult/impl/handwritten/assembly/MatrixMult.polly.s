	.text
	.file	"MatrixMult.polly.ll"
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
	xorl	%r8d, %r8d
	movl	$240, %ecx
	movaps	.LCPI0_0(%rip), %xmm0   # xmm0 = [1,1]
	.p2align	4, 0x90
.LBB0_1:                                # %polly.loop_preheader2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
                                        #       Child Loop BB0_3 Depth 3
	movq	%rcx, %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB0_2:                                # %polly.loop_preheader8
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_3 Depth 3
	movq	%rdx, %rdi
	movl	$32, %eax
	.p2align	4, 0x90
.LBB0_3:                                # %vector.body
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	%xmm0, A-240(%rdi)
	movaps	%xmm0, B-240(%rdi)
	movaps	%xmm0, A-224(%rdi)
	movaps	%xmm0, B-224(%rdi)
	movaps	%xmm0, A-208(%rdi)
	movaps	%xmm0, B-208(%rdi)
	movaps	%xmm0, A-192(%rdi)
	movaps	%xmm0, B-192(%rdi)
	movaps	%xmm0, A-176(%rdi)
	movaps	%xmm0, B-176(%rdi)
	movaps	%xmm0, A-160(%rdi)
	movaps	%xmm0, B-160(%rdi)
	movaps	%xmm0, A-144(%rdi)
	movaps	%xmm0, B-144(%rdi)
	movaps	%xmm0, A-128(%rdi)
	movaps	%xmm0, B-128(%rdi)
	movaps	%xmm0, A-112(%rdi)
	movaps	%xmm0, B-112(%rdi)
	movaps	%xmm0, A-96(%rdi)
	movaps	%xmm0, B-96(%rdi)
	movaps	%xmm0, A-80(%rdi)
	movaps	%xmm0, B-80(%rdi)
	movaps	%xmm0, A-64(%rdi)
	movaps	%xmm0, B-64(%rdi)
	movaps	%xmm0, A-48(%rdi)
	movaps	%xmm0, B-48(%rdi)
	movaps	%xmm0, A-32(%rdi)
	movaps	%xmm0, B-32(%rdi)
	movaps	%xmm0, A-16(%rdi)
	movaps	%xmm0, B-16(%rdi)
	movaps	%xmm0, A(%rdi)
	movaps	%xmm0, B(%rdi)
	addq	$8192, %rdi             # imm = 0x2000
	decq	%rax
	jne	.LBB0_3
# BB#4:                                 # %polly.loop_exit9
                                        #   in Loop: Header=BB0_2 Depth=2
	incq	%rsi
	addq	$256, %rdx              # imm = 0x100
	cmpq	$32, %rsi
	jne	.LBB0_2
# BB#5:                                 # %polly.loop_exit3
                                        #   in Loop: Header=BB0_1 Depth=1
	incq	%r8
	addq	$262144, %rcx           # imm = 0x40000
	cmpq	$32, %r8
	jne	.LBB0_1
# BB#6:                                 # %polly.exiting
	popq	%rbp
	retq
.Lfunc_end0:
	.size	init_array, .Lfunc_end0-init_array
	.cfi_endproc

	.globl	print_array
	.p2align	4, 0x90
	.type	print_array,@function
print_array:                            # @print_array
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp3:
	.cfi_def_cfa_offset 16
.Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp5:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
.Ltmp6:
	.cfi_offset %rbx, -48
.Ltmp7:
	.cfi_offset %r12, -40
.Ltmp8:
	.cfi_offset %r14, -32
.Ltmp9:
	.cfi_offset %r15, -24
	movl	$C, %r14d
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB1_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
	movq	stdout(%rip), %rcx
	movq	%r14, %r12
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB1_2:                                # %for.body3
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%r12), %rdx
	movl	$.L.str, %esi
	xorl	%eax, %eax
	movq	%rcx, %rdi
	callq	fprintf
	movslq	%ebx, %rax
	imulq	$1717986919, %rax, %rcx # imm = 0x66666667
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	shll	$4, %ecx
	leal	(%rcx,%rcx,4), %ecx
	subl	%ecx, %eax
	cmpl	$79, %eax
	jne	.LBB1_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB1_2 Depth=2
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	callq	fputc
.LBB1_4:                                # %for.inc
                                        #   in Loop: Header=BB1_2 Depth=2
	incq	%rbx
	movq	stdout(%rip), %rcx
	addq	$8, %r12
	cmpq	$1024, %rbx             # imm = 0x400
	jne	.LBB1_2
# BB#5:                                 # %for.end
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	$10, %edi
	movq	%rcx, %rsi
	callq	fputc
	incq	%r15
	addq	$8192, %r14             # imm = 0x2000
	cmpq	$1024, %r15             # imm = 0x400
	jne	.LBB1_1
# BB#6:                                 # %for.end11
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
.Ltmp13:
	.cfi_offset %rbx, -56
.Ltmp14:
	.cfi_offset %r12, -48
.Ltmp15:
	.cfi_offset %r13, -40
.Ltmp16:
	.cfi_offset %r14, -32
.Ltmp17:
	.cfi_offset %r15, -24
	xorl	%r8d, %r8d
	movl	$240, %eax
	movaps	.LCPI2_0(%rip), %xmm0   # xmm0 = [1,1]
	movl	$C+253952, %r11d
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
.LBB2_3:                                # %vector.body
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
	movl	$A+8, %ecx
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB2_8:                                # %polly.loop_preheader2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_9 Depth 2
	movq	%r11, %rdi
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
	addq	$262144, %r11           # imm = 0x40000
	cmpq	$32, %r8
	jne	.LBB2_8
	.p2align	4, 0x90
.LBB2_11:                               # %polly.loop_preheader26
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_14 Depth 2
                                        #       Child Loop BB2_15 Depth 3
                                        #         Child Loop BB2_18 Depth 4
                                        #           Child Loop BB2_19 Depth 5
                                        #             Child Loop BB2_20 Depth 6
	movq	%rax, -56(%rbp)         # 8-byte Spill
	shlq	$5, %rax
	movq	%rax, -96(%rbp)         # 8-byte Spill
	movl	$B+8192, %ecx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB2_14:                               # %polly.loop_preheader32
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
	movq	-48(%rbp), %r8          # 8-byte Reload
	movq	%rcx, %r13
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB2_15:                               # %polly.loop_preheader38
                                        #   Parent Loop BB2_11 Depth=1
                                        #     Parent Loop BB2_14 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB2_18 Depth 4
                                        #           Child Loop BB2_19 Depth 5
                                        #             Child Loop BB2_20 Depth 6
	movq	%rcx, -80(%rbp)         # 8-byte Spill
	movq	%r8, -88(%rbp)          # 8-byte Spill
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB2_18:                               # %polly.loop_preheader44
                                        #   Parent Loop BB2_11 Depth=1
                                        #     Parent Loop BB2_14 Depth=2
                                        #       Parent Loop BB2_15 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB2_19 Depth 5
                                        #             Child Loop BB2_20 Depth 6
	movq	-96(%rbp), %rax         # 8-byte Reload
	leaq	(%rcx,%rax), %r12
	movq	%r13, %r11
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB2_19:                               # %polly.loop_preheader50
                                        #   Parent Loop BB2_11 Depth=1
                                        #     Parent Loop BB2_14 Depth=2
                                        #       Parent Loop BB2_15 Depth=3
                                        #         Parent Loop BB2_18 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB2_20 Depth 6
	leaq	(%rsi,%rdi), %rdx
	movq	%r12, %rax
	shlq	$13, %rax
	leaq	C(%rax,%rdx,8), %r9
	movq	C(%rax,%rdx,8), %r10
	movq	%r8, %rbx
	movq	%r11, %rdx
	movl	$32, %r14d
	.p2align	4, 0x90
.LBB2_20:                               # %polly.loop_header49
                                        #   Parent Loop BB2_11 Depth=1
                                        #     Parent Loop BB2_14 Depth=2
                                        #       Parent Loop BB2_15 Depth=3
                                        #         Parent Loop BB2_18 Depth=4
                                        #           Parent Loop BB2_19 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	-8192(%rdx), %r15
	imulq	-8(%rbx), %r15
	addq	%r10, %r15
	movq	(%rdx), %r10
	imulq	(%rbx), %r10
	addq	%r15, %r10
	addq	$16384, %rdx            # imm = 0x4000
	addq	$16, %rbx
	addq	$-2, %r14
	jne	.LBB2_20
# BB#16:                                # %polly.loop_exit51
                                        #   in Loop: Header=BB2_19 Depth=5
	movq	%r10, (%r9)
	incq	%rsi
	addq	$8, %r11
	cmpq	$32, %rsi
	jne	.LBB2_19
# BB#17:                                # %polly.loop_exit45
                                        #   in Loop: Header=BB2_18 Depth=4
	incq	%rcx
	addq	$8192, %r8              # imm = 0x2000
	cmpq	$32, %rcx
	jne	.LBB2_18
# BB#12:                                # %polly.loop_exit39
                                        #   in Loop: Header=BB2_15 Depth=3
	movq	-80(%rbp), %rcx         # 8-byte Reload
	incq	%rcx
	addq	$262144, %r13           # imm = 0x40000
	movq	-88(%rbp), %r8          # 8-byte Reload
	addq	$256, %r8               # imm = 0x100
	cmpq	$32, %rcx
	jne	.LBB2_15
# BB#13:                                # %polly.loop_exit33
                                        #   in Loop: Header=BB2_14 Depth=2
	movq	-64(%rbp), %rax         # 8-byte Reload
	incq	%rax
	movq	-72(%rbp), %rcx         # 8-byte Reload
	addq	$256, %rcx              # imm = 0x100
	cmpq	$32, %rax
	jne	.LBB2_14
# BB#10:                                # %polly.loop_exit27
                                        #   in Loop: Header=BB2_11 Depth=1
	movq	-56(%rbp), %rax         # 8-byte Reload
	incq	%rax
	addq	$262144, -48(%rbp)      # 8-byte Folded Spill
                                        # imm = 0x40000
	cmpq	$32, %rax
	jne	.LBB2_11
# BB#21:                                # %polly.exiting
	movq	C+8388600(%rip), %rcx
	movl	$.L.str.2, %edi
	movl	$1024, %esi             # imm = 0x400
	movl	$1024, %edx             # imm = 0x400
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
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


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
