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
	xorl	%eax, %eax
	movdqa	.LCPI0_0(%rip), %xmm0   # xmm0 = [1,1,1,1]
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_1:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	movslq	%eax, %rdx
	movl	$0, p(,%rcx,4)
	movq	$-262144, %rsi          # imm = 0xFFFFFFFFFFFC0000
	.p2align	4, 0x90
.LBB0_2:                                # %vector.body
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movdqu	%xmm0, u+262144(%rsi,%rdx,4)
	movdqu	%xmm0, u+262160(%rsi,%rdx,4)
	movdqu	%xmm0, v+262144(%rsi,%rdx,4)
	movdqu	%xmm0, v+262160(%rsi,%rdx,4)
	movdqu	%xmm0, u+262176(%rsi,%rdx,4)
	movdqu	%xmm0, u+262192(%rsi,%rdx,4)
	movdqu	%xmm0, v+262176(%rsi,%rdx,4)
	movdqu	%xmm0, v+262192(%rsi,%rdx,4)
	movdqu	%xmm0, u+262208(%rsi,%rdx,4)
	movdqu	%xmm0, u+262224(%rsi,%rdx,4)
	movdqu	%xmm0, v+262208(%rsi,%rdx,4)
	movdqu	%xmm0, v+262224(%rsi,%rdx,4)
	movdqu	%xmm0, u+262240(%rsi,%rdx,4)
	movdqu	%xmm0, u+262256(%rsi,%rdx,4)
	movdqu	%xmm0, v+262240(%rsi,%rdx,4)
	movdqu	%xmm0, v+262256(%rsi,%rdx,4)
	addq	$128, %rsi
	jne	.LBB0_2
# BB#3:                                 # %for.inc24
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$65536, p(,%rcx,4)      # imm = 0x10000
	incq	%rcx
	addl	$65536, %eax            # imm = 0x10000
	cmpq	$65536, %rcx            # imm = 0x10000
	jne	.LBB0_1
# BB#4:
	pxor	%xmm0, %xmm0
	movq	$-262144, %rax          # imm = 0xFFFFFFFFFFFC0000
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB0_5:                                # %vector.body5
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
	jne	.LBB0_5
# BB#6:                                 # %middle.block6
	paddq	%xmm0, %xmm1
	pshufd	$78, %xmm1, %xmm0       # xmm0 = xmm1[2,3,0,1]
	paddq	%xmm1, %xmm0
	movd	%xmm0, %rax
	movabsq	$4294967296, %rcx       # imm = 0x100000000
	cmpq	%rcx, %rax
	jne	.LBB0_8
# BB#7:                                 # %if.end
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
	popq	%rbp
	retq
.LBB0_8:                                # %if.then
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$-2, %edi
	callq	exit
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.type	p,@object               # @p
	.comm	p,1,4
	.type	u,@object               # @u
	.comm	u,1,4
	.type	v,@object               # @v
	.comm	v,1,4
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
