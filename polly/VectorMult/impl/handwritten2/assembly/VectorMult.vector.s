	.text
	.file	"VectorMult.vector.ll"
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
	pushq	%rbx
	pushq	%rax
.Ltmp3:
	.cfi_offset %rbx, -24
	xorl	%eax, %eax
	movdqa	.LCPI0_0(%rip), %xmm0   # xmm0 = [1,1,1,1]
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_1:                                # %vector.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	movq	$-1024, %rdx            # imm = 0xFFFFFFFFFFFFFC00
	.p2align	4, 0x90
.LBB0_2:                                # %vector.body
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movdqa	%xmm0, u+1024(%rdx)
	movdqa	%xmm0, u+1040(%rdx)
	movdqa	%xmm0, v+1024(%rdx)
	movdqa	%xmm0, v+1040(%rdx)
	movdqa	%xmm0, p+1024(%rdx)
	movdqa	%xmm0, p+1040(%rdx)
	movdqa	%xmm0, u+1056(%rdx)
	movdqa	%xmm0, u+1072(%rdx)
	movdqa	%xmm0, v+1056(%rdx)
	movdqa	%xmm0, v+1072(%rdx)
	movdqa	%xmm0, p+1056(%rdx)
	movdqa	%xmm0, p+1072(%rdx)
	addq	$64, %rdx
	jne	.LBB0_2
# BB#3:                                 # %for.end
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$256, sum(,%rcx,4)      # imm = 0x100
	incq	%rcx
	cmpq	$268435456, %rcx        # imm = 0x10000000
	jne	.LBB0_1
# BB#4:
	pxor	%xmm0, %xmm0
	movabsq	$68719476736, %rbx      # imm = 0x1000000000
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB0_5:                                # %vector.body2
                                        # =>This Inner Loop Header: Depth=1
	movq	sum(%rax), %xmm2        # xmm2 = mem[0],zero
	movq	sum+8(%rax), %xmm3      # xmm3 = mem[0],zero
	movdqa	%xmm2, %xmm4
	psrad	$31, %xmm4
	punpckldq	%xmm4, %xmm2    # xmm2 = xmm2[0],xmm4[0],xmm2[1],xmm4[1]
	movdqa	%xmm3, %xmm4
	psrad	$31, %xmm4
	punpckldq	%xmm4, %xmm3    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
	paddq	%xmm0, %xmm2
	paddq	%xmm1, %xmm3
	movq	sum+16(%rax), %xmm0     # xmm0 = mem[0],zero
	movq	sum+24(%rax), %xmm1     # xmm1 = mem[0],zero
	movdqa	%xmm0, %xmm4
	psrad	$31, %xmm4
	punpckldq	%xmm4, %xmm0    # xmm0 = xmm0[0],xmm4[0],xmm0[1],xmm4[1]
	movdqa	%xmm1, %xmm4
	psrad	$31, %xmm4
	punpckldq	%xmm4, %xmm1    # xmm1 = xmm1[0],xmm4[0],xmm1[1],xmm4[1]
	paddq	%xmm2, %xmm0
	paddq	%xmm3, %xmm1
	addq	$32, %rax
	cmpq	$1073741824, %rax       # imm = 0x40000000
	jne	.LBB0_5
# BB#6:                                 # %middle.block3
	paddq	%xmm0, %xmm1
	pshufd	$78, %xmm1, %xmm0       # xmm0 = xmm1[2,3,0,1]
	paddq	%xmm1, %xmm0
	movd	%xmm0, %rax
	cmpq	%rbx, %rax
	jne	.LBB0_8
# BB#7:                                 # %if.end
	movl	$6, %edi
	movl	$.L.str.1, %esi
	callq	setlocale
	movl	$.L.str.2, %edi
	movl	$256, %edx              # imm = 0x100
	xorl	%eax, %eax
	movq	%rbx, %rsi
	movq	%rbx, %rcx
	callq	printf
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
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

	.type	u,@object               # @u
	.comm	u,1024,16
	.type	v,@object               # @v
	.comm	v,1024,16
	.type	p,@object               # @p
	.comm	p,1024,16
	.type	sum,@object             # @sum
	.comm	sum,1073741824,16
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
	.asciz	"Pass the %'lld vector multiplication test case with local vector size = %d\nThe Dot Product = %'lld\n"
	.size	.L.str.2, 100


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
