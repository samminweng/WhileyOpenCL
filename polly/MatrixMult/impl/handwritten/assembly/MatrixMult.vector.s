	.text
	.file	"MatrixMult.vector.ll"
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
	xorl	%eax, %eax
	movaps	.LCPI0_0(%rip), %xmm0   # xmm0 = [1,1]
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_1:                                # %vector.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	movq	%rax, %rdx
	movl	$1024, %esi             # imm = 0x400
	.p2align	4, 0x90
.LBB0_2:                                # %vector.body
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movaps	%xmm0, A(%rdx)
	movaps	%xmm0, A+16(%rdx)
	movaps	%xmm0, B(%rdx)
	movaps	%xmm0, B+16(%rdx)
	movaps	%xmm0, A+32(%rdx)
	movaps	%xmm0, A+48(%rdx)
	movaps	%xmm0, B+32(%rdx)
	movaps	%xmm0, B+48(%rdx)
	addq	$64, %rdx
	addq	$-8, %rsi
	jne	.LBB0_2
# BB#3:                                 # %for.inc10
                                        #   in Loop: Header=BB0_1 Depth=1
	incq	%rcx
	addq	$8192, %rax             # imm = 0x2000
	cmpq	$1024, %rcx             # imm = 0x400
	jne	.LBB0_1
# BB#4:                                 # %for.end12
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
	subq	$72, %rsp
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
	xorl	%eax, %eax
	movaps	.LCPI2_0(%rip), %xmm0   # xmm0 = [1,1]
	movl	$C+253952, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB2_1:                                # %vector.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
	movq	%rdx, %rdi
	movl	$1024, %ebx             # imm = 0x400
	.p2align	4, 0x90
.LBB2_2:                                # %vector.body
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movaps	%xmm0, A(%rdi)
	movaps	%xmm0, A+16(%rdi)
	movaps	%xmm0, B(%rdi)
	movaps	%xmm0, B+16(%rdi)
	movaps	%xmm0, A+32(%rdi)
	movaps	%xmm0, A+48(%rdi)
	movaps	%xmm0, B+32(%rdi)
	movaps	%xmm0, B+48(%rdi)
	addq	$64, %rdi
	addq	$-8, %rbx
	jne	.LBB2_2
# BB#3:                                 # %for.inc10.i
                                        #   in Loop: Header=BB2_1 Depth=1
	incq	%rsi
	addq	$8192, %rdx             # imm = 0x2000
	cmpq	$1024, %rsi             # imm = 0x400
	jne	.LBB2_1
# BB#4:
	xorps	%xmm0, %xmm0
	.p2align	4, 0x90
.LBB2_6:                                # %polly.loop_preheader2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_7 Depth 2
	movq	%rcx, %rdx
	movl	$32, %esi
	.p2align	4, 0x90
.LBB2_7:                                # %polly.loop_preheader14
                                        #   Parent Loop BB2_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movaps	%xmm0, -253712(%rdx)
	movaps	%xmm0, -253728(%rdx)
	movaps	%xmm0, -253744(%rdx)
	movaps	%xmm0, -253760(%rdx)
	movaps	%xmm0, -253776(%rdx)
	movaps	%xmm0, -253792(%rdx)
	movaps	%xmm0, -253808(%rdx)
	movaps	%xmm0, -253824(%rdx)
	movaps	%xmm0, -253840(%rdx)
	movaps	%xmm0, -253856(%rdx)
	movaps	%xmm0, -253872(%rdx)
	movaps	%xmm0, -253888(%rdx)
	movaps	%xmm0, -253904(%rdx)
	movaps	%xmm0, -253920(%rdx)
	movaps	%xmm0, -253936(%rdx)
	movaps	%xmm0, -253952(%rdx)
	movaps	%xmm0, -245520(%rdx)
	movaps	%xmm0, -245536(%rdx)
	movaps	%xmm0, -245552(%rdx)
	movaps	%xmm0, -245568(%rdx)
	movaps	%xmm0, -245584(%rdx)
	movaps	%xmm0, -245600(%rdx)
	movaps	%xmm0, -245616(%rdx)
	movaps	%xmm0, -245632(%rdx)
	movaps	%xmm0, -245648(%rdx)
	movaps	%xmm0, -245664(%rdx)
	movaps	%xmm0, -245680(%rdx)
	movaps	%xmm0, -245696(%rdx)
	movaps	%xmm0, -245712(%rdx)
	movaps	%xmm0, -245728(%rdx)
	movaps	%xmm0, -245744(%rdx)
	movaps	%xmm0, -245760(%rdx)
	movaps	%xmm0, -237328(%rdx)
	movaps	%xmm0, -237344(%rdx)
	movaps	%xmm0, -237360(%rdx)
	movaps	%xmm0, -237376(%rdx)
	movaps	%xmm0, -237392(%rdx)
	movaps	%xmm0, -237408(%rdx)
	movaps	%xmm0, -237424(%rdx)
	movaps	%xmm0, -237440(%rdx)
	movaps	%xmm0, -237456(%rdx)
	movaps	%xmm0, -237472(%rdx)
	movaps	%xmm0, -237488(%rdx)
	movaps	%xmm0, -237504(%rdx)
	movaps	%xmm0, -237520(%rdx)
	movaps	%xmm0, -237536(%rdx)
	movaps	%xmm0, -237552(%rdx)
	movaps	%xmm0, -237568(%rdx)
	movaps	%xmm0, -229136(%rdx)
	movaps	%xmm0, -229152(%rdx)
	movaps	%xmm0, -229168(%rdx)
	movaps	%xmm0, -229184(%rdx)
	movaps	%xmm0, -229200(%rdx)
	movaps	%xmm0, -229216(%rdx)
	movaps	%xmm0, -229232(%rdx)
	movaps	%xmm0, -229248(%rdx)
	movaps	%xmm0, -229264(%rdx)
	movaps	%xmm0, -229280(%rdx)
	movaps	%xmm0, -229296(%rdx)
	movaps	%xmm0, -229312(%rdx)
	movaps	%xmm0, -229328(%rdx)
	movaps	%xmm0, -229344(%rdx)
	movaps	%xmm0, -229360(%rdx)
	movaps	%xmm0, -229376(%rdx)
	movaps	%xmm0, -220944(%rdx)
	movaps	%xmm0, -220960(%rdx)
	movaps	%xmm0, -220976(%rdx)
	movaps	%xmm0, -220992(%rdx)
	movaps	%xmm0, -221008(%rdx)
	movaps	%xmm0, -221024(%rdx)
	movaps	%xmm0, -221040(%rdx)
	movaps	%xmm0, -221056(%rdx)
	movaps	%xmm0, -221072(%rdx)
	movaps	%xmm0, -221088(%rdx)
	movaps	%xmm0, -221104(%rdx)
	movaps	%xmm0, -221120(%rdx)
	movaps	%xmm0, -221136(%rdx)
	movaps	%xmm0, -221152(%rdx)
	movaps	%xmm0, -221168(%rdx)
	movaps	%xmm0, -221184(%rdx)
	movaps	%xmm0, -212752(%rdx)
	movaps	%xmm0, -212768(%rdx)
	movaps	%xmm0, -212784(%rdx)
	movaps	%xmm0, -212800(%rdx)
	movaps	%xmm0, -212816(%rdx)
	movaps	%xmm0, -212832(%rdx)
	movaps	%xmm0, -212848(%rdx)
	movaps	%xmm0, -212864(%rdx)
	movaps	%xmm0, -212880(%rdx)
	movaps	%xmm0, -212896(%rdx)
	movaps	%xmm0, -212912(%rdx)
	movaps	%xmm0, -212928(%rdx)
	movaps	%xmm0, -212944(%rdx)
	movaps	%xmm0, -212960(%rdx)
	movaps	%xmm0, -212976(%rdx)
	movaps	%xmm0, -212992(%rdx)
	movaps	%xmm0, -204560(%rdx)
	movaps	%xmm0, -204576(%rdx)
	movaps	%xmm0, -204592(%rdx)
	movaps	%xmm0, -204608(%rdx)
	movaps	%xmm0, -204624(%rdx)
	movaps	%xmm0, -204640(%rdx)
	movaps	%xmm0, -204656(%rdx)
	movaps	%xmm0, -204672(%rdx)
	movaps	%xmm0, -204688(%rdx)
	movaps	%xmm0, -204704(%rdx)
	movaps	%xmm0, -204720(%rdx)
	movaps	%xmm0, -204736(%rdx)
	movaps	%xmm0, -204752(%rdx)
	movaps	%xmm0, -204768(%rdx)
	movaps	%xmm0, -204784(%rdx)
	movaps	%xmm0, -204800(%rdx)
	movaps	%xmm0, -196368(%rdx)
	movaps	%xmm0, -196384(%rdx)
	movaps	%xmm0, -196400(%rdx)
	movaps	%xmm0, -196416(%rdx)
	movaps	%xmm0, -196432(%rdx)
	movaps	%xmm0, -196448(%rdx)
	movaps	%xmm0, -196464(%rdx)
	movaps	%xmm0, -196480(%rdx)
	movaps	%xmm0, -196496(%rdx)
	movaps	%xmm0, -196512(%rdx)
	movaps	%xmm0, -196528(%rdx)
	movaps	%xmm0, -196544(%rdx)
	movaps	%xmm0, -196560(%rdx)
	movaps	%xmm0, -196576(%rdx)
	movaps	%xmm0, -196592(%rdx)
	movaps	%xmm0, -196608(%rdx)
	movaps	%xmm0, -188176(%rdx)
	movaps	%xmm0, -188192(%rdx)
	movaps	%xmm0, -188208(%rdx)
	movaps	%xmm0, -188224(%rdx)
	movaps	%xmm0, -188240(%rdx)
	movaps	%xmm0, -188256(%rdx)
	movaps	%xmm0, -188272(%rdx)
	movaps	%xmm0, -188288(%rdx)
	movaps	%xmm0, -188304(%rdx)
	movaps	%xmm0, -188320(%rdx)
	movaps	%xmm0, -188336(%rdx)
	movaps	%xmm0, -188352(%rdx)
	movaps	%xmm0, -188368(%rdx)
	movaps	%xmm0, -188384(%rdx)
	movaps	%xmm0, -188400(%rdx)
	movaps	%xmm0, -188416(%rdx)
	movaps	%xmm0, -179984(%rdx)
	movaps	%xmm0, -180000(%rdx)
	movaps	%xmm0, -180016(%rdx)
	movaps	%xmm0, -180032(%rdx)
	movaps	%xmm0, -180048(%rdx)
	movaps	%xmm0, -180064(%rdx)
	movaps	%xmm0, -180080(%rdx)
	movaps	%xmm0, -180096(%rdx)
	movaps	%xmm0, -180112(%rdx)
	movaps	%xmm0, -180128(%rdx)
	movaps	%xmm0, -180144(%rdx)
	movaps	%xmm0, -180160(%rdx)
	movaps	%xmm0, -180176(%rdx)
	movaps	%xmm0, -180192(%rdx)
	movaps	%xmm0, -180208(%rdx)
	movaps	%xmm0, -180224(%rdx)
	movaps	%xmm0, -171792(%rdx)
	movaps	%xmm0, -171808(%rdx)
	movaps	%xmm0, -171824(%rdx)
	movaps	%xmm0, -171840(%rdx)
	movaps	%xmm0, -171856(%rdx)
	movaps	%xmm0, -171872(%rdx)
	movaps	%xmm0, -171888(%rdx)
	movaps	%xmm0, -171904(%rdx)
	movaps	%xmm0, -171920(%rdx)
	movaps	%xmm0, -171936(%rdx)
	movaps	%xmm0, -171952(%rdx)
	movaps	%xmm0, -171968(%rdx)
	movaps	%xmm0, -171984(%rdx)
	movaps	%xmm0, -172000(%rdx)
	movaps	%xmm0, -172016(%rdx)
	movaps	%xmm0, -172032(%rdx)
	movaps	%xmm0, -163600(%rdx)
	movaps	%xmm0, -163616(%rdx)
	movaps	%xmm0, -163632(%rdx)
	movaps	%xmm0, -163648(%rdx)
	movaps	%xmm0, -163664(%rdx)
	movaps	%xmm0, -163680(%rdx)
	movaps	%xmm0, -163696(%rdx)
	movaps	%xmm0, -163712(%rdx)
	movaps	%xmm0, -163728(%rdx)
	movaps	%xmm0, -163744(%rdx)
	movaps	%xmm0, -163760(%rdx)
	movaps	%xmm0, -163776(%rdx)
	movaps	%xmm0, -163792(%rdx)
	movaps	%xmm0, -163808(%rdx)
	movaps	%xmm0, -163824(%rdx)
	movaps	%xmm0, -163840(%rdx)
	movaps	%xmm0, -155408(%rdx)
	movaps	%xmm0, -155424(%rdx)
	movaps	%xmm0, -155440(%rdx)
	movaps	%xmm0, -155456(%rdx)
	movaps	%xmm0, -155472(%rdx)
	movaps	%xmm0, -155488(%rdx)
	movaps	%xmm0, -155504(%rdx)
	movaps	%xmm0, -155520(%rdx)
	movaps	%xmm0, -155536(%rdx)
	movaps	%xmm0, -155552(%rdx)
	movaps	%xmm0, -155568(%rdx)
	movaps	%xmm0, -155584(%rdx)
	movaps	%xmm0, -155600(%rdx)
	movaps	%xmm0, -155616(%rdx)
	movaps	%xmm0, -155632(%rdx)
	movaps	%xmm0, -155648(%rdx)
	movaps	%xmm0, -147216(%rdx)
	movaps	%xmm0, -147232(%rdx)
	movaps	%xmm0, -147248(%rdx)
	movaps	%xmm0, -147264(%rdx)
	movaps	%xmm0, -147280(%rdx)
	movaps	%xmm0, -147296(%rdx)
	movaps	%xmm0, -147312(%rdx)
	movaps	%xmm0, -147328(%rdx)
	movaps	%xmm0, -147344(%rdx)
	movaps	%xmm0, -147360(%rdx)
	movaps	%xmm0, -147376(%rdx)
	movaps	%xmm0, -147392(%rdx)
	movaps	%xmm0, -147408(%rdx)
	movaps	%xmm0, -147424(%rdx)
	movaps	%xmm0, -147440(%rdx)
	movaps	%xmm0, -147456(%rdx)
	movaps	%xmm0, -139024(%rdx)
	movaps	%xmm0, -139040(%rdx)
	movaps	%xmm0, -139056(%rdx)
	movaps	%xmm0, -139072(%rdx)
	movaps	%xmm0, -139088(%rdx)
	movaps	%xmm0, -139104(%rdx)
	movaps	%xmm0, -139120(%rdx)
	movaps	%xmm0, -139136(%rdx)
	movaps	%xmm0, -139152(%rdx)
	movaps	%xmm0, -139168(%rdx)
	movaps	%xmm0, -139184(%rdx)
	movaps	%xmm0, -139200(%rdx)
	movaps	%xmm0, -139216(%rdx)
	movaps	%xmm0, -139232(%rdx)
	movaps	%xmm0, -139248(%rdx)
	movaps	%xmm0, -139264(%rdx)
	movaps	%xmm0, -130832(%rdx)
	movaps	%xmm0, -130848(%rdx)
	movaps	%xmm0, -130864(%rdx)
	movaps	%xmm0, -130880(%rdx)
	movaps	%xmm0, -130896(%rdx)
	movaps	%xmm0, -130912(%rdx)
	movaps	%xmm0, -130928(%rdx)
	movaps	%xmm0, -130944(%rdx)
	movaps	%xmm0, -130960(%rdx)
	movaps	%xmm0, -130976(%rdx)
	movaps	%xmm0, -130992(%rdx)
	movaps	%xmm0, -131008(%rdx)
	movaps	%xmm0, -131024(%rdx)
	movaps	%xmm0, -131040(%rdx)
	movaps	%xmm0, -131056(%rdx)
	movaps	%xmm0, -131072(%rdx)
	movaps	%xmm0, -122640(%rdx)
	movaps	%xmm0, -122656(%rdx)
	movaps	%xmm0, -122672(%rdx)
	movaps	%xmm0, -122688(%rdx)
	movaps	%xmm0, -122704(%rdx)
	movaps	%xmm0, -122720(%rdx)
	movaps	%xmm0, -122736(%rdx)
	movaps	%xmm0, -122752(%rdx)
	movaps	%xmm0, -122768(%rdx)
	movaps	%xmm0, -122784(%rdx)
	movaps	%xmm0, -122800(%rdx)
	movaps	%xmm0, -122816(%rdx)
	movaps	%xmm0, -122832(%rdx)
	movaps	%xmm0, -122848(%rdx)
	movaps	%xmm0, -122864(%rdx)
	movaps	%xmm0, -122880(%rdx)
	movaps	%xmm0, -114448(%rdx)
	movaps	%xmm0, -114464(%rdx)
	movaps	%xmm0, -114480(%rdx)
	movaps	%xmm0, -114496(%rdx)
	movaps	%xmm0, -114512(%rdx)
	movaps	%xmm0, -114528(%rdx)
	movaps	%xmm0, -114544(%rdx)
	movaps	%xmm0, -114560(%rdx)
	movaps	%xmm0, -114576(%rdx)
	movaps	%xmm0, -114592(%rdx)
	movaps	%xmm0, -114608(%rdx)
	movaps	%xmm0, -114624(%rdx)
	movaps	%xmm0, -114640(%rdx)
	movaps	%xmm0, -114656(%rdx)
	movaps	%xmm0, -114672(%rdx)
	movaps	%xmm0, -114688(%rdx)
	movaps	%xmm0, -106256(%rdx)
	movaps	%xmm0, -106272(%rdx)
	movaps	%xmm0, -106288(%rdx)
	movaps	%xmm0, -106304(%rdx)
	movaps	%xmm0, -106320(%rdx)
	movaps	%xmm0, -106336(%rdx)
	movaps	%xmm0, -106352(%rdx)
	movaps	%xmm0, -106368(%rdx)
	movaps	%xmm0, -106384(%rdx)
	movaps	%xmm0, -106400(%rdx)
	movaps	%xmm0, -106416(%rdx)
	movaps	%xmm0, -106432(%rdx)
	movaps	%xmm0, -106448(%rdx)
	movaps	%xmm0, -106464(%rdx)
	movaps	%xmm0, -106480(%rdx)
	movaps	%xmm0, -106496(%rdx)
	movaps	%xmm0, -98064(%rdx)
	movaps	%xmm0, -98080(%rdx)
	movaps	%xmm0, -98096(%rdx)
	movaps	%xmm0, -98112(%rdx)
	movaps	%xmm0, -98128(%rdx)
	movaps	%xmm0, -98144(%rdx)
	movaps	%xmm0, -98160(%rdx)
	movaps	%xmm0, -98176(%rdx)
	movaps	%xmm0, -98192(%rdx)
	movaps	%xmm0, -98208(%rdx)
	movaps	%xmm0, -98224(%rdx)
	movaps	%xmm0, -98240(%rdx)
	movaps	%xmm0, -98256(%rdx)
	movaps	%xmm0, -98272(%rdx)
	movaps	%xmm0, -98288(%rdx)
	movaps	%xmm0, -98304(%rdx)
	movaps	%xmm0, -89872(%rdx)
	movaps	%xmm0, -89888(%rdx)
	movaps	%xmm0, -89904(%rdx)
	movaps	%xmm0, -89920(%rdx)
	movaps	%xmm0, -89936(%rdx)
	movaps	%xmm0, -89952(%rdx)
	movaps	%xmm0, -89968(%rdx)
	movaps	%xmm0, -89984(%rdx)
	movaps	%xmm0, -90000(%rdx)
	movaps	%xmm0, -90016(%rdx)
	movaps	%xmm0, -90032(%rdx)
	movaps	%xmm0, -90048(%rdx)
	movaps	%xmm0, -90064(%rdx)
	movaps	%xmm0, -90080(%rdx)
	movaps	%xmm0, -90096(%rdx)
	movaps	%xmm0, -90112(%rdx)
	movaps	%xmm0, -81680(%rdx)
	movaps	%xmm0, -81696(%rdx)
	movaps	%xmm0, -81712(%rdx)
	movaps	%xmm0, -81728(%rdx)
	movaps	%xmm0, -81744(%rdx)
	movaps	%xmm0, -81760(%rdx)
	movaps	%xmm0, -81776(%rdx)
	movaps	%xmm0, -81792(%rdx)
	movaps	%xmm0, -81808(%rdx)
	movaps	%xmm0, -81824(%rdx)
	movaps	%xmm0, -81840(%rdx)
	movaps	%xmm0, -81856(%rdx)
	movaps	%xmm0, -81872(%rdx)
	movaps	%xmm0, -81888(%rdx)
	movaps	%xmm0, -81904(%rdx)
	movaps	%xmm0, -81920(%rdx)
	movaps	%xmm0, -73488(%rdx)
	movaps	%xmm0, -73504(%rdx)
	movaps	%xmm0, -73520(%rdx)
	movaps	%xmm0, -73536(%rdx)
	movaps	%xmm0, -73552(%rdx)
	movaps	%xmm0, -73568(%rdx)
	movaps	%xmm0, -73584(%rdx)
	movaps	%xmm0, -73600(%rdx)
	movaps	%xmm0, -73616(%rdx)
	movaps	%xmm0, -73632(%rdx)
	movaps	%xmm0, -73648(%rdx)
	movaps	%xmm0, -73664(%rdx)
	movaps	%xmm0, -73680(%rdx)
	movaps	%xmm0, -73696(%rdx)
	movaps	%xmm0, -73712(%rdx)
	movaps	%xmm0, -73728(%rdx)
	movaps	%xmm0, -65296(%rdx)
	movaps	%xmm0, -65312(%rdx)
	movaps	%xmm0, -65328(%rdx)
	movaps	%xmm0, -65344(%rdx)
	movaps	%xmm0, -65360(%rdx)
	movaps	%xmm0, -65376(%rdx)
	movaps	%xmm0, -65392(%rdx)
	movaps	%xmm0, -65408(%rdx)
	movaps	%xmm0, -65424(%rdx)
	movaps	%xmm0, -65440(%rdx)
	movaps	%xmm0, -65456(%rdx)
	movaps	%xmm0, -65472(%rdx)
	movaps	%xmm0, -65488(%rdx)
	movaps	%xmm0, -65504(%rdx)
	movaps	%xmm0, -65520(%rdx)
	movaps	%xmm0, -65536(%rdx)
	movaps	%xmm0, -57104(%rdx)
	movaps	%xmm0, -57120(%rdx)
	movaps	%xmm0, -57136(%rdx)
	movaps	%xmm0, -57152(%rdx)
	movaps	%xmm0, -57168(%rdx)
	movaps	%xmm0, -57184(%rdx)
	movaps	%xmm0, -57200(%rdx)
	movaps	%xmm0, -57216(%rdx)
	movaps	%xmm0, -57232(%rdx)
	movaps	%xmm0, -57248(%rdx)
	movaps	%xmm0, -57264(%rdx)
	movaps	%xmm0, -57280(%rdx)
	movaps	%xmm0, -57296(%rdx)
	movaps	%xmm0, -57312(%rdx)
	movaps	%xmm0, -57328(%rdx)
	movaps	%xmm0, -57344(%rdx)
	movaps	%xmm0, -48912(%rdx)
	movaps	%xmm0, -48928(%rdx)
	movaps	%xmm0, -48944(%rdx)
	movaps	%xmm0, -48960(%rdx)
	movaps	%xmm0, -48976(%rdx)
	movaps	%xmm0, -48992(%rdx)
	movaps	%xmm0, -49008(%rdx)
	movaps	%xmm0, -49024(%rdx)
	movaps	%xmm0, -49040(%rdx)
	movaps	%xmm0, -49056(%rdx)
	movaps	%xmm0, -49072(%rdx)
	movaps	%xmm0, -49088(%rdx)
	movaps	%xmm0, -49104(%rdx)
	movaps	%xmm0, -49120(%rdx)
	movaps	%xmm0, -49136(%rdx)
	movaps	%xmm0, -49152(%rdx)
	movaps	%xmm0, -40720(%rdx)
	movaps	%xmm0, -40736(%rdx)
	movaps	%xmm0, -40752(%rdx)
	movaps	%xmm0, -40768(%rdx)
	movaps	%xmm0, -40784(%rdx)
	movaps	%xmm0, -40800(%rdx)
	movaps	%xmm0, -40816(%rdx)
	movaps	%xmm0, -40832(%rdx)
	movaps	%xmm0, -40848(%rdx)
	movaps	%xmm0, -40864(%rdx)
	movaps	%xmm0, -40880(%rdx)
	movaps	%xmm0, -40896(%rdx)
	movaps	%xmm0, -40912(%rdx)
	movaps	%xmm0, -40928(%rdx)
	movaps	%xmm0, -40944(%rdx)
	movaps	%xmm0, -40960(%rdx)
	movaps	%xmm0, -32528(%rdx)
	movaps	%xmm0, -32544(%rdx)
	movaps	%xmm0, -32560(%rdx)
	movaps	%xmm0, -32576(%rdx)
	movaps	%xmm0, -32592(%rdx)
	movaps	%xmm0, -32608(%rdx)
	movaps	%xmm0, -32624(%rdx)
	movaps	%xmm0, -32640(%rdx)
	movaps	%xmm0, -32656(%rdx)
	movaps	%xmm0, -32672(%rdx)
	movaps	%xmm0, -32688(%rdx)
	movaps	%xmm0, -32704(%rdx)
	movaps	%xmm0, -32720(%rdx)
	movaps	%xmm0, -32736(%rdx)
	movaps	%xmm0, -32752(%rdx)
	movaps	%xmm0, -32768(%rdx)
	movaps	%xmm0, -24336(%rdx)
	movaps	%xmm0, -24352(%rdx)
	movaps	%xmm0, -24368(%rdx)
	movaps	%xmm0, -24384(%rdx)
	movaps	%xmm0, -24400(%rdx)
	movaps	%xmm0, -24416(%rdx)
	movaps	%xmm0, -24432(%rdx)
	movaps	%xmm0, -24448(%rdx)
	movaps	%xmm0, -24464(%rdx)
	movaps	%xmm0, -24480(%rdx)
	movaps	%xmm0, -24496(%rdx)
	movaps	%xmm0, -24512(%rdx)
	movaps	%xmm0, -24528(%rdx)
	movaps	%xmm0, -24544(%rdx)
	movaps	%xmm0, -24560(%rdx)
	movaps	%xmm0, -24576(%rdx)
	movaps	%xmm0, -16144(%rdx)
	movaps	%xmm0, -16160(%rdx)
	movaps	%xmm0, -16176(%rdx)
	movaps	%xmm0, -16192(%rdx)
	movaps	%xmm0, -16208(%rdx)
	movaps	%xmm0, -16224(%rdx)
	movaps	%xmm0, -16240(%rdx)
	movaps	%xmm0, -16256(%rdx)
	movaps	%xmm0, -16272(%rdx)
	movaps	%xmm0, -16288(%rdx)
	movaps	%xmm0, -16304(%rdx)
	movaps	%xmm0, -16320(%rdx)
	movaps	%xmm0, -16336(%rdx)
	movaps	%xmm0, -16352(%rdx)
	movaps	%xmm0, -16368(%rdx)
	movaps	%xmm0, -16384(%rdx)
	movaps	%xmm0, -7952(%rdx)
	movaps	%xmm0, -7968(%rdx)
	movaps	%xmm0, -7984(%rdx)
	movaps	%xmm0, -8000(%rdx)
	movaps	%xmm0, -8016(%rdx)
	movaps	%xmm0, -8032(%rdx)
	movaps	%xmm0, -8048(%rdx)
	movaps	%xmm0, -8064(%rdx)
	movaps	%xmm0, -8080(%rdx)
	movaps	%xmm0, -8096(%rdx)
	movaps	%xmm0, -8112(%rdx)
	movaps	%xmm0, -8128(%rdx)
	movaps	%xmm0, -8144(%rdx)
	movaps	%xmm0, -8160(%rdx)
	movaps	%xmm0, -8176(%rdx)
	movaps	%xmm0, -8192(%rdx)
	movaps	%xmm0, 240(%rdx)
	movaps	%xmm0, 224(%rdx)
	movaps	%xmm0, 208(%rdx)
	movaps	%xmm0, 192(%rdx)
	movaps	%xmm0, 176(%rdx)
	movaps	%xmm0, 160(%rdx)
	movaps	%xmm0, 144(%rdx)
	movaps	%xmm0, 128(%rdx)
	movaps	%xmm0, 112(%rdx)
	movaps	%xmm0, 96(%rdx)
	movaps	%xmm0, 80(%rdx)
	movaps	%xmm0, 64(%rdx)
	movaps	%xmm0, 48(%rdx)
	movaps	%xmm0, 32(%rdx)
	movaps	%xmm0, 16(%rdx)
	movaps	%xmm0, (%rdx)
	addq	$256, %rdx              # imm = 0x100
	decq	%rsi
	jne	.LBB2_7
# BB#5:                                 # %polly.loop_exit3
                                        #   in Loop: Header=BB2_6 Depth=1
	incq	%rax
	addq	$262144, %rcx           # imm = 0x40000
	cmpq	$32, %rax
	jne	.LBB2_6
# BB#10:                                # %polly.split_new_and_old
	xorl	%eax, %eax
	movl	$A+24, %ecx
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB2_11:                               # %polly.loop_preheader94
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_14 Depth 2
                                        #       Child Loop BB2_15 Depth 3
                                        #         Child Loop BB2_18 Depth 4
                                        #           Child Loop BB2_19 Depth 5
                                        #             Child Loop BB2_20 Depth 6
	movq	%rax, -64(%rbp)         # 8-byte Spill
	shlq	$18, %rax
	leaq	C(%rax), %rax
	movq	%rax, -72(%rbp)         # 8-byte Spill
	movl	$B+24576, %r15d
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB2_14:                               # %polly.loop_preheader100
                                        #   Parent Loop BB2_11 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_15 Depth 3
                                        #         Child Loop BB2_18 Depth 4
                                        #           Child Loop BB2_19 Depth 5
                                        #             Child Loop BB2_20 Depth 6
	movq	%rax, -80(%rbp)         # 8-byte Spill
	movq	%r15, -88(%rbp)         # 8-byte Spill
	movq	%rax, %r13
	shlq	$8, %r13
	addq	-72(%rbp), %r13         # 8-byte Folded Reload
	movq	-48(%rbp), %r9          # 8-byte Reload
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB2_15:                               # %polly.loop_header99
                                        #   Parent Loop BB2_11 Depth=1
                                        #     Parent Loop BB2_14 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB2_18 Depth 4
                                        #           Child Loop BB2_19 Depth 5
                                        #             Child Loop BB2_20 Depth 6
	movq	%rcx, -96(%rbp)         # 8-byte Spill
	movq	%r9, -104(%rbp)         # 8-byte Spill
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB2_18:                               # %polly.loop_preheader112
                                        #   Parent Loop BB2_11 Depth=1
                                        #     Parent Loop BB2_14 Depth=2
                                        #       Parent Loop BB2_15 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB2_19 Depth 5
                                        #             Child Loop BB2_20 Depth 6
	movq	%r12, %rax
	shlq	$13, %rax
	addq	%r13, %rax
	movq	%r15, %r10
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB2_19:                               # %polly.stmt.polly.loop_preheader56
                                        #   Parent Loop BB2_11 Depth=1
                                        #     Parent Loop BB2_14 Depth=2
                                        #       Parent Loop BB2_15 Depth=3
                                        #         Parent Loop BB2_18 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB2_20 Depth 6
	movq	(%rax,%rdi,8), %rsi
	movq	%rsi, -56(%rbp)
	movq	$-1, %r8
	movq	%r9, %rbx
	movq	%r10, %rsi
	.p2align	4, 0x90
.LBB2_20:                               # %polly.stmt.polly.loop_preheader62
                                        #   Parent Loop BB2_11 Depth=1
                                        #     Parent Loop BB2_14 Depth=2
                                        #       Parent Loop BB2_15 Depth=3
                                        #         Parent Loop BB2_18 Depth=4
                                        #           Parent Loop BB2_19 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	-24576(%rsi), %r11
	imulq	-24(%rbx), %r11
	addq	-56(%rbp), %r11
	movq	-16384(%rsi), %r14
	imulq	-16(%rbx), %r14
	addq	%r11, %r14
	movq	-8192(%rsi), %rcx
	imulq	-8(%rbx), %rcx
	addq	%r14, %rcx
	movq	(%rsi), %rdx
	imulq	(%rbx), %rdx
	addq	%rcx, %rdx
	movq	%rdx, -56(%rbp)
	movq	%rdx, -112(%rbp)
	incq	%r8
	addq	$32768, %rsi            # imm = 0x8000
	addq	$32, %rbx
	cmpq	$7, %r8
	jl	.LBB2_20
# BB#16:                                # %polly.stmt.polly.loop_exit57
                                        #   in Loop: Header=BB2_19 Depth=5
	movq	-112(%rbp), %rsi
	movq	%rsi, (%rax,%rdi,8)
	addq	$8, %r10
	cmpq	$31, %rdi
	leaq	1(%rdi), %rdi
	jl	.LBB2_19
# BB#17:                                # %polly.loop_exit113
                                        #   in Loop: Header=BB2_18 Depth=4
	addq	$8192, %r9              # imm = 0x2000
	cmpq	$31, %r12
	leaq	1(%r12), %r12
	jl	.LBB2_18
# BB#12:                                # %polly.loop_exit107
                                        #   in Loop: Header=BB2_15 Depth=3
	addq	$262144, %r15           # imm = 0x40000
	movq	-104(%rbp), %r9         # 8-byte Reload
	addq	$256, %r9               # imm = 0x100
	movq	-96(%rbp), %rcx         # 8-byte Reload
	cmpq	$31, %rcx
	leaq	1(%rcx), %rcx
	jl	.LBB2_15
# BB#13:                                # %polly.loop_exit101
                                        #   in Loop: Header=BB2_14 Depth=2
	movq	-88(%rbp), %r15         # 8-byte Reload
	addq	$256, %r15              # imm = 0x100
	movq	-80(%rbp), %rax         # 8-byte Reload
	cmpq	$31, %rax
	leaq	1(%rax), %rax
	jl	.LBB2_14
# BB#8:                                 # %polly.loop_exit95
                                        #   in Loop: Header=BB2_11 Depth=1
	addq	$262144, -48(%rbp)      # 8-byte Folded Spill
                                        # imm = 0x40000
	movq	-64(%rbp), %rax         # 8-byte Reload
	cmpq	$31, %rax
	leaq	1(%rax), %rax
	jl	.LBB2_11
# BB#9:                                 # %polly.exiting
	movq	C+8388600(%rip), %rcx
	movl	$.L.str.2, %edi
	movl	$1024, %esi             # imm = 0x400
	movl	$1024, %edx             # imm = 0x400
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	addq	$72, %rsp
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
