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
	addq	$16384, %rdi            # imm = 0x4000
	decq	%rax
	jne	.LBB0_3
# BB#4:                                 # %polly.loop_exit9
                                        #   in Loop: Header=BB0_2 Depth=2
	incq	%rsi
	addq	$256, %rdx              # imm = 0x100
	cmpq	$64, %rsi
	jne	.LBB0_2
# BB#5:                                 # %polly.loop_exit3
                                        #   in Loop: Header=BB0_1 Depth=1
	incq	%r8
	addq	$524288, %rcx           # imm = 0x80000
	cmpq	$64, %r8
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
	cmpq	$2048, %rbx             # imm = 0x800
	jne	.LBB1_2
# BB#5:                                 # %for.end
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	$10, %edi
	movq	%rcx, %rsi
	callq	fputc
	incq	%r15
	addq	$16384, %r14            # imm = 0x4000
	cmpq	$2048, %r15             # imm = 0x800
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
	movl	$C+507904, %r11d
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
	addq	$16384, %rdx            # imm = 0x4000
	decq	%rsi
	jne	.LBB2_3
# BB#4:                                 # %polly.loop_exit9.i
                                        #   in Loop: Header=BB2_2 Depth=2
	incq	%rdi
	addq	$256, %rbx              # imm = 0x100
	cmpq	$64, %rdi
	jne	.LBB2_2
# BB#5:                                 # %polly.loop_exit3.i
                                        #   in Loop: Header=BB2_1 Depth=1
	incq	%rcx
	addq	$524288, %rax           # imm = 0x80000
	cmpq	$64, %rcx
	jne	.LBB2_1
# BB#6:
	xorps	%xmm0, %xmm0
	xorl	%eax, %eax
	movl	$A+8, %ecx
	movq	%rcx, -88(%rbp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB2_8:                                # %polly.loop_preheader2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_9 Depth 2
	movq	%r11, %rdi
	movl	$64, %edx
	.p2align	4, 0x90
.LBB2_9:                                # %polly.loop_preheader14
                                        #   Parent Loop BB2_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movaps	%xmm0, -507664(%rdi)
	movaps	%xmm0, -507680(%rdi)
	movaps	%xmm0, -507696(%rdi)
	movaps	%xmm0, -507712(%rdi)
	movaps	%xmm0, -507728(%rdi)
	movaps	%xmm0, -507744(%rdi)
	movaps	%xmm0, -507760(%rdi)
	movaps	%xmm0, -507776(%rdi)
	movaps	%xmm0, -507792(%rdi)
	movaps	%xmm0, -507808(%rdi)
	movaps	%xmm0, -507824(%rdi)
	movaps	%xmm0, -507840(%rdi)
	movaps	%xmm0, -507856(%rdi)
	movaps	%xmm0, -507872(%rdi)
	movaps	%xmm0, -507888(%rdi)
	movaps	%xmm0, -507904(%rdi)
	movaps	%xmm0, -491280(%rdi)
	movaps	%xmm0, -491296(%rdi)
	movaps	%xmm0, -491312(%rdi)
	movaps	%xmm0, -491328(%rdi)
	movaps	%xmm0, -491344(%rdi)
	movaps	%xmm0, -491360(%rdi)
	movaps	%xmm0, -491376(%rdi)
	movaps	%xmm0, -491392(%rdi)
	movaps	%xmm0, -491408(%rdi)
	movaps	%xmm0, -491424(%rdi)
	movaps	%xmm0, -491440(%rdi)
	movaps	%xmm0, -491456(%rdi)
	movaps	%xmm0, -491472(%rdi)
	movaps	%xmm0, -491488(%rdi)
	movaps	%xmm0, -491504(%rdi)
	movaps	%xmm0, -491520(%rdi)
	movaps	%xmm0, -474896(%rdi)
	movaps	%xmm0, -474912(%rdi)
	movaps	%xmm0, -474928(%rdi)
	movaps	%xmm0, -474944(%rdi)
	movaps	%xmm0, -474960(%rdi)
	movaps	%xmm0, -474976(%rdi)
	movaps	%xmm0, -474992(%rdi)
	movaps	%xmm0, -475008(%rdi)
	movaps	%xmm0, -475024(%rdi)
	movaps	%xmm0, -475040(%rdi)
	movaps	%xmm0, -475056(%rdi)
	movaps	%xmm0, -475072(%rdi)
	movaps	%xmm0, -475088(%rdi)
	movaps	%xmm0, -475104(%rdi)
	movaps	%xmm0, -475120(%rdi)
	movaps	%xmm0, -475136(%rdi)
	movaps	%xmm0, -458512(%rdi)
	movaps	%xmm0, -458528(%rdi)
	movaps	%xmm0, -458544(%rdi)
	movaps	%xmm0, -458560(%rdi)
	movaps	%xmm0, -458576(%rdi)
	movaps	%xmm0, -458592(%rdi)
	movaps	%xmm0, -458608(%rdi)
	movaps	%xmm0, -458624(%rdi)
	movaps	%xmm0, -458640(%rdi)
	movaps	%xmm0, -458656(%rdi)
	movaps	%xmm0, -458672(%rdi)
	movaps	%xmm0, -458688(%rdi)
	movaps	%xmm0, -458704(%rdi)
	movaps	%xmm0, -458720(%rdi)
	movaps	%xmm0, -458736(%rdi)
	movaps	%xmm0, -458752(%rdi)
	movaps	%xmm0, -442128(%rdi)
	movaps	%xmm0, -442144(%rdi)
	movaps	%xmm0, -442160(%rdi)
	movaps	%xmm0, -442176(%rdi)
	movaps	%xmm0, -442192(%rdi)
	movaps	%xmm0, -442208(%rdi)
	movaps	%xmm0, -442224(%rdi)
	movaps	%xmm0, -442240(%rdi)
	movaps	%xmm0, -442256(%rdi)
	movaps	%xmm0, -442272(%rdi)
	movaps	%xmm0, -442288(%rdi)
	movaps	%xmm0, -442304(%rdi)
	movaps	%xmm0, -442320(%rdi)
	movaps	%xmm0, -442336(%rdi)
	movaps	%xmm0, -442352(%rdi)
	movaps	%xmm0, -442368(%rdi)
	movaps	%xmm0, -425744(%rdi)
	movaps	%xmm0, -425760(%rdi)
	movaps	%xmm0, -425776(%rdi)
	movaps	%xmm0, -425792(%rdi)
	movaps	%xmm0, -425808(%rdi)
	movaps	%xmm0, -425824(%rdi)
	movaps	%xmm0, -425840(%rdi)
	movaps	%xmm0, -425856(%rdi)
	movaps	%xmm0, -425872(%rdi)
	movaps	%xmm0, -425888(%rdi)
	movaps	%xmm0, -425904(%rdi)
	movaps	%xmm0, -425920(%rdi)
	movaps	%xmm0, -425936(%rdi)
	movaps	%xmm0, -425952(%rdi)
	movaps	%xmm0, -425968(%rdi)
	movaps	%xmm0, -425984(%rdi)
	movaps	%xmm0, -409360(%rdi)
	movaps	%xmm0, -409376(%rdi)
	movaps	%xmm0, -409392(%rdi)
	movaps	%xmm0, -409408(%rdi)
	movaps	%xmm0, -409424(%rdi)
	movaps	%xmm0, -409440(%rdi)
	movaps	%xmm0, -409456(%rdi)
	movaps	%xmm0, -409472(%rdi)
	movaps	%xmm0, -409488(%rdi)
	movaps	%xmm0, -409504(%rdi)
	movaps	%xmm0, -409520(%rdi)
	movaps	%xmm0, -409536(%rdi)
	movaps	%xmm0, -409552(%rdi)
	movaps	%xmm0, -409568(%rdi)
	movaps	%xmm0, -409584(%rdi)
	movaps	%xmm0, -409600(%rdi)
	movaps	%xmm0, -392976(%rdi)
	movaps	%xmm0, -392992(%rdi)
	movaps	%xmm0, -393008(%rdi)
	movaps	%xmm0, -393024(%rdi)
	movaps	%xmm0, -393040(%rdi)
	movaps	%xmm0, -393056(%rdi)
	movaps	%xmm0, -393072(%rdi)
	movaps	%xmm0, -393088(%rdi)
	movaps	%xmm0, -393104(%rdi)
	movaps	%xmm0, -393120(%rdi)
	movaps	%xmm0, -393136(%rdi)
	movaps	%xmm0, -393152(%rdi)
	movaps	%xmm0, -393168(%rdi)
	movaps	%xmm0, -393184(%rdi)
	movaps	%xmm0, -393200(%rdi)
	movaps	%xmm0, -393216(%rdi)
	movaps	%xmm0, -376592(%rdi)
	movaps	%xmm0, -376608(%rdi)
	movaps	%xmm0, -376624(%rdi)
	movaps	%xmm0, -376640(%rdi)
	movaps	%xmm0, -376656(%rdi)
	movaps	%xmm0, -376672(%rdi)
	movaps	%xmm0, -376688(%rdi)
	movaps	%xmm0, -376704(%rdi)
	movaps	%xmm0, -376720(%rdi)
	movaps	%xmm0, -376736(%rdi)
	movaps	%xmm0, -376752(%rdi)
	movaps	%xmm0, -376768(%rdi)
	movaps	%xmm0, -376784(%rdi)
	movaps	%xmm0, -376800(%rdi)
	movaps	%xmm0, -376816(%rdi)
	movaps	%xmm0, -376832(%rdi)
	movaps	%xmm0, -360208(%rdi)
	movaps	%xmm0, -360224(%rdi)
	movaps	%xmm0, -360240(%rdi)
	movaps	%xmm0, -360256(%rdi)
	movaps	%xmm0, -360272(%rdi)
	movaps	%xmm0, -360288(%rdi)
	movaps	%xmm0, -360304(%rdi)
	movaps	%xmm0, -360320(%rdi)
	movaps	%xmm0, -360336(%rdi)
	movaps	%xmm0, -360352(%rdi)
	movaps	%xmm0, -360368(%rdi)
	movaps	%xmm0, -360384(%rdi)
	movaps	%xmm0, -360400(%rdi)
	movaps	%xmm0, -360416(%rdi)
	movaps	%xmm0, -360432(%rdi)
	movaps	%xmm0, -360448(%rdi)
	movaps	%xmm0, -343824(%rdi)
	movaps	%xmm0, -343840(%rdi)
	movaps	%xmm0, -343856(%rdi)
	movaps	%xmm0, -343872(%rdi)
	movaps	%xmm0, -343888(%rdi)
	movaps	%xmm0, -343904(%rdi)
	movaps	%xmm0, -343920(%rdi)
	movaps	%xmm0, -343936(%rdi)
	movaps	%xmm0, -343952(%rdi)
	movaps	%xmm0, -343968(%rdi)
	movaps	%xmm0, -343984(%rdi)
	movaps	%xmm0, -344000(%rdi)
	movaps	%xmm0, -344016(%rdi)
	movaps	%xmm0, -344032(%rdi)
	movaps	%xmm0, -344048(%rdi)
	movaps	%xmm0, -344064(%rdi)
	movaps	%xmm0, -327440(%rdi)
	movaps	%xmm0, -327456(%rdi)
	movaps	%xmm0, -327472(%rdi)
	movaps	%xmm0, -327488(%rdi)
	movaps	%xmm0, -327504(%rdi)
	movaps	%xmm0, -327520(%rdi)
	movaps	%xmm0, -327536(%rdi)
	movaps	%xmm0, -327552(%rdi)
	movaps	%xmm0, -327568(%rdi)
	movaps	%xmm0, -327584(%rdi)
	movaps	%xmm0, -327600(%rdi)
	movaps	%xmm0, -327616(%rdi)
	movaps	%xmm0, -327632(%rdi)
	movaps	%xmm0, -327648(%rdi)
	movaps	%xmm0, -327664(%rdi)
	movaps	%xmm0, -327680(%rdi)
	movaps	%xmm0, -311056(%rdi)
	movaps	%xmm0, -311072(%rdi)
	movaps	%xmm0, -311088(%rdi)
	movaps	%xmm0, -311104(%rdi)
	movaps	%xmm0, -311120(%rdi)
	movaps	%xmm0, -311136(%rdi)
	movaps	%xmm0, -311152(%rdi)
	movaps	%xmm0, -311168(%rdi)
	movaps	%xmm0, -311184(%rdi)
	movaps	%xmm0, -311200(%rdi)
	movaps	%xmm0, -311216(%rdi)
	movaps	%xmm0, -311232(%rdi)
	movaps	%xmm0, -311248(%rdi)
	movaps	%xmm0, -311264(%rdi)
	movaps	%xmm0, -311280(%rdi)
	movaps	%xmm0, -311296(%rdi)
	movaps	%xmm0, -294672(%rdi)
	movaps	%xmm0, -294688(%rdi)
	movaps	%xmm0, -294704(%rdi)
	movaps	%xmm0, -294720(%rdi)
	movaps	%xmm0, -294736(%rdi)
	movaps	%xmm0, -294752(%rdi)
	movaps	%xmm0, -294768(%rdi)
	movaps	%xmm0, -294784(%rdi)
	movaps	%xmm0, -294800(%rdi)
	movaps	%xmm0, -294816(%rdi)
	movaps	%xmm0, -294832(%rdi)
	movaps	%xmm0, -294848(%rdi)
	movaps	%xmm0, -294864(%rdi)
	movaps	%xmm0, -294880(%rdi)
	movaps	%xmm0, -294896(%rdi)
	movaps	%xmm0, -294912(%rdi)
	movaps	%xmm0, -278288(%rdi)
	movaps	%xmm0, -278304(%rdi)
	movaps	%xmm0, -278320(%rdi)
	movaps	%xmm0, -278336(%rdi)
	movaps	%xmm0, -278352(%rdi)
	movaps	%xmm0, -278368(%rdi)
	movaps	%xmm0, -278384(%rdi)
	movaps	%xmm0, -278400(%rdi)
	movaps	%xmm0, -278416(%rdi)
	movaps	%xmm0, -278432(%rdi)
	movaps	%xmm0, -278448(%rdi)
	movaps	%xmm0, -278464(%rdi)
	movaps	%xmm0, -278480(%rdi)
	movaps	%xmm0, -278496(%rdi)
	movaps	%xmm0, -278512(%rdi)
	movaps	%xmm0, -278528(%rdi)
	movaps	%xmm0, -261904(%rdi)
	movaps	%xmm0, -261920(%rdi)
	movaps	%xmm0, -261936(%rdi)
	movaps	%xmm0, -261952(%rdi)
	movaps	%xmm0, -261968(%rdi)
	movaps	%xmm0, -261984(%rdi)
	movaps	%xmm0, -262000(%rdi)
	movaps	%xmm0, -262016(%rdi)
	movaps	%xmm0, -262032(%rdi)
	movaps	%xmm0, -262048(%rdi)
	movaps	%xmm0, -262064(%rdi)
	movaps	%xmm0, -262080(%rdi)
	movaps	%xmm0, -262096(%rdi)
	movaps	%xmm0, -262112(%rdi)
	movaps	%xmm0, -262128(%rdi)
	movaps	%xmm0, -262144(%rdi)
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
	addq	$524288, %r11           # imm = 0x80000
	cmpq	$64, %r8
	jne	.LBB2_8
	.p2align	4, 0x90
.LBB2_11:                               # %polly.loop_preheader26
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_14 Depth 2
                                        #       Child Loop BB2_15 Depth 3
                                        #         Child Loop BB2_18 Depth 4
                                        #           Child Loop BB2_19 Depth 5
                                        #             Child Loop BB2_20 Depth 6
	movq	%rax, -96(%rbp)         # 8-byte Spill
	shlq	$5, %rax
	movq	%rax, -48(%rbp)         # 8-byte Spill
	movl	$B+16384, %ecx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB2_14:                               # %polly.loop_preheader32
                                        #   Parent Loop BB2_11 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_15 Depth 3
                                        #         Child Loop BB2_18 Depth 4
                                        #           Child Loop BB2_19 Depth 5
                                        #             Child Loop BB2_20 Depth 6
	movq	%rax, -80(%rbp)         # 8-byte Spill
	movq	%rcx, -72(%rbp)         # 8-byte Spill
	movq	%rax, %rdi
	shlq	$5, %rdi
	movq	-88(%rbp), %r8          # 8-byte Reload
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
	movq	%rcx, -64(%rbp)         # 8-byte Spill
	movq	%r8, -56(%rbp)          # 8-byte Spill
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB2_18:                               # %polly.loop_preheader44
                                        #   Parent Loop BB2_11 Depth=1
                                        #     Parent Loop BB2_14 Depth=2
                                        #       Parent Loop BB2_15 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB2_19 Depth 5
                                        #             Child Loop BB2_20 Depth 6
	movq	-48(%rbp), %rax         # 8-byte Reload
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
	shlq	$14, %rax
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
	movq	-16384(%rdx), %r15
	imulq	-8(%rbx), %r15
	addq	%r10, %r15
	movq	(%rdx), %r10
	imulq	(%rbx), %r10
	addq	%r15, %r10
	addq	$32768, %rdx            # imm = 0x8000
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
	addq	$16384, %r8             # imm = 0x4000
	cmpq	$32, %rcx
	jne	.LBB2_18
# BB#12:                                # %polly.loop_exit39
                                        #   in Loop: Header=BB2_15 Depth=3
	movq	-64(%rbp), %rcx         # 8-byte Reload
	incq	%rcx
	addq	$524288, %r13           # imm = 0x80000
	movq	-56(%rbp), %r8          # 8-byte Reload
	addq	$256, %r8               # imm = 0x100
	cmpq	$64, %rcx
	jne	.LBB2_15
# BB#13:                                # %polly.loop_exit33
                                        #   in Loop: Header=BB2_14 Depth=2
	movq	-80(%rbp), %rax         # 8-byte Reload
	incq	%rax
	movq	-72(%rbp), %rcx         # 8-byte Reload
	addq	$256, %rcx              # imm = 0x100
	cmpq	$64, %rax
	jne	.LBB2_14
# BB#10:                                # %polly.loop_exit27
                                        #   in Loop: Header=BB2_11 Depth=1
	movq	-96(%rbp), %rax         # 8-byte Reload
	incq	%rax
	addq	$524288, -88(%rbp)      # 8-byte Folded Spill
                                        # imm = 0x80000
	cmpq	$64, %rax
	jne	.LBB2_11
# BB#21:                                # %polly.exiting
	movl	$33554424, %eax         # imm = 0x1FFFFF8
	movq	C(%rax), %rcx
	movl	$.L.str.2, %edi
	movl	$2048, %esi             # imm = 0x800
	movl	$2048, %edx             # imm = 0x800
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
	.comm	A,33554432,16
	.type	B,@object               # @B
	.comm	B,33554432,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%lld "
	.size	.L.str, 6

	.type	C,@object               # @C
	.comm	C,33554432,16
	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"Pass %d X %d matrix test case (C[N][N] =%lld) \n "
	.size	.L.str.2, 49


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git c43284c4913e075fc10ac6dea2961788a660f09d) (http://llvm.org/git/llvm.git 7f53bedefce9ad990a1906fed303e104ff621783)"
	.section	".note.GNU-stack","",@progbits
