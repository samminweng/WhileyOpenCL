	.text
	.file	"VectorMult.polly.ll"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI0_0:
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	1                       # 0x1
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
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
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
.Ltmp3:
	.cfi_offset %rbx, -48
.Ltmp4:
	.cfi_offset %r12, -40
.Ltmp5:
	.cfi_offset %r14, -32
.Ltmp6:
	.cfi_offset %r15, -24
	xorl	%r14d, %r14d
	movl	$p, %edi
	xorl	%esi, %esi
	movl	$262144, %edx           # imm = 0x40000
	callq	memset
	movdqa	.LCPI0_0(%rip), %xmm8   # xmm8 = [1,1,1,1]
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB0_1:                                # %polly.loop_preheader8
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
                                        #       Child Loop BB0_3 Depth 3
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_2:                                # %polly.loop_preheader14
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_3 Depth 3
	movq	%rcx, %rdx
	shlq	$5, %rdx
	movq	%rcx, %rax
	shlq	$7, %rax
	leaq	4(%rdx), %r12
	leaq	8(%rdx), %rdi
	leaq	12(%rdx), %r15
	leaq	16(%rdx), %rbx
	leaq	20(%rdx), %r9
	leaq	24(%rdx), %r10
	leaq	28(%rdx), %r11
	movdqa	p(%rax), %xmm0
	movdqa	p+16(,%rdx,4), %xmm7
	movdqa	p+32(,%rdx,4), %xmm6
	movdqa	p+48(,%rdx,4), %xmm5
	movdqa	p+64(,%rdx,4), %xmm4
	movdqa	p+80(,%rdx,4), %xmm3
	movdqa	p+96(,%rdx,4), %xmm2
	movdqa	p+112(,%rdx,4), %xmm1
	movq	%r14, %rax
	movl	$32, %esi
	.p2align	4, 0x90
.LBB0_3:                                # %vector.body
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	paddd	%xmm8, %xmm0
	paddd	%xmm8, %xmm7
	paddd	%xmm8, %xmm6
	paddd	%xmm8, %xmm5
	paddd	%xmm8, %xmm4
	paddd	%xmm8, %xmm3
	paddd	%xmm8, %xmm2
	paddd	%xmm8, %xmm1
	movl	$1, u(%rax)
	movl	$1, v(%rax)
	addq	$4, %rax
	decq	%rsi
	jne	.LBB0_3
# BB#4:                                 # %polly.loop_exit15
                                        #   in Loop: Header=BB0_2 Depth=2
	movdqa	%xmm0, p(,%rdx,4)
	movdqa	%xmm7, p(,%r12,4)
	movdqa	%xmm6, p(,%rdi,4)
	movdqa	%xmm5, p(,%r15,4)
	movdqa	%xmm4, p(,%rbx,4)
	movdqa	%xmm3, p(,%r9,4)
	movdqa	%xmm2, p(,%r10,4)
	movdqa	%xmm1, p(,%r11,4)
	incq	%rcx
	cmpq	$2048, %rcx             # imm = 0x800
	jne	.LBB0_2
# BB#5:                                 # %polly.loop_exit9
                                        #   in Loop: Header=BB0_1 Depth=1
	incq	%r8
	subq	$-128, %r14
	cmpq	$2048, %r8              # imm = 0x800
	jne	.LBB0_1
# BB#6:
	pxor	%xmm0, %xmm0
	movq	$-262144, %rax          # imm = 0xFFFFFFFFFFFC0000
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB0_7:                                # %vector.body43
                                        # =>This Inner Loop Header: Depth=1
	movq	p+262144(%rax), %xmm2   # xmm2 = mem[0],zero
	movq	p+262152(%rax), %xmm3   # xmm3 = mem[0],zero
	movdqa	%xmm2, %xmm4
	psrad	$31, %xmm4
	punpckldq	%xmm4, %xmm2    # xmm2 = xmm2[0],xmm4[0],xmm2[1],xmm4[1]
	movdqa	%xmm3, %xmm4
	psrad	$31, %xmm4
	punpckldq	%xmm4, %xmm3    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
	paddq	%xmm0, %xmm2
	paddq	%xmm1, %xmm3
	movq	p+262160(%rax), %xmm0   # xmm0 = mem[0],zero
	movq	p+262168(%rax), %xmm1   # xmm1 = mem[0],zero
	movdqa	%xmm0, %xmm4
	psrad	$31, %xmm4
	punpckldq	%xmm4, %xmm0    # xmm0 = xmm0[0],xmm4[0],xmm0[1],xmm4[1]
	movdqa	%xmm1, %xmm4
	psrad	$31, %xmm4
	punpckldq	%xmm4, %xmm1    # xmm1 = xmm1[0],xmm4[0],xmm1[1],xmm4[1]
	paddq	%xmm2, %xmm0
	paddq	%xmm3, %xmm1
	addq	$32, %rax
	jne	.LBB0_7
# BB#8:                                 # %middle.block44
	paddq	%xmm0, %xmm1
	pshufd	$78, %xmm1, %xmm0       # xmm0 = xmm1[2,3,0,1]
	paddq	%xmm1, %xmm0
	movd	%xmm0, %rax
	movabsq	$4294967296, %rcx       # imm = 0x100000000
	cmpq	%rcx, %rax
	jne	.LBB0_10
# BB#9:                                 # %if.end
	movl	$6, %edi
	movl	$.L.str.1, %esi
	callq	setlocale
	movabsq	$4294967296, %rcx       # imm = 0x100000000
	movl	$.L.str.2, %edi
	movl	$65536, %esi            # imm = 0x10000
	movl	$65536, %edx            # imm = 0x10000
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB0_10:                               # %if.then
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$-2, %edi
	callq	exit
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.type	p,@object               # @p
	.comm	p,262144,16
	.type	u,@object               # @u
	.comm	u,262144,16
	.type	v,@object               # @v
	.comm	v,262144,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"fail to multiply two unit vectors"
	.size	.L.str, 34

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.zero	1
	.size	.L.str.1, 1

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"Pass the %'d X %'d vector multiplication test case with dot Product = %'lld"
	.size	.L.str.2, 76


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
