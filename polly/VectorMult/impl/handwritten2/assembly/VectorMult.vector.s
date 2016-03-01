	.text
	.file	"VectorMult.vector.ll"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI0_0:
	.long	1024                    # 0x400
	.long	1024                    # 0x400
	.long	1024                    # 0x400
	.long	1024                    # 0x400
.LCPI0_1:
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
# BB#0:                                 # %polly.split_new_and_old
	pushq	%rbp
.Ltmp0:
	.cfi_def_cfa_offset 16
.Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp2:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$72, %rsp
.Ltmp3:
	.cfi_offset %rbx, -24
	movq	$-1, %rax
	movl	$240, %edx
	movaps	.LCPI0_0(%rip), %xmm0   # xmm0 = [1024,1024,1024,1024]
	xorl	%ecx, %ecx
	movq	$-1, %rsi
	.p2align	4, 0x90
.LBB0_1:                                # %polly.stmt.vector.body
                                        # =>This Inner Loop Header: Depth=1
	movaps	%xmm0, sum-240(%rdx)
	movaps	%xmm0, sum-224(%rdx)
	movaps	%xmm0, sum-208(%rdx)
	movaps	%xmm0, sum-192(%rdx)
	movaps	%xmm0, sum-176(%rdx)
	movaps	%xmm0, sum-160(%rdx)
	movaps	%xmm0, sum-144(%rdx)
	movaps	%xmm0, sum-128(%rdx)
	movaps	%xmm0, sum-112(%rdx)
	movaps	%xmm0, sum-96(%rdx)
	movaps	%xmm0, sum-80(%rdx)
	movaps	%xmm0, sum-64(%rdx)
	movaps	%xmm0, sum-48(%rdx)
	movaps	%xmm0, sum-32(%rdx)
	movaps	%xmm0, sum-16(%rdx)
	movaps	%xmm0, sum(%rdx)
	incq	%rsi
	addq	$256, %rdx              # imm = 0x100
	cmpq	$1048575, %rsi          # imm = 0xFFFFF
	jl	.LBB0_1
# BB#2:
	movdqa	.LCPI0_1(%rip), %xmm0   # xmm0 = [1,1,1,1]
	.p2align	4, 0x90
.LBB0_3:                                # %polly.stmt.polly.loop_exit9
                                        # =>This Inner Loop Header: Depth=1
	movdqa	%xmm0, u(%rcx)
	movdqa	%xmm0, v(%rcx)
	movdqa	%xmm0, p(%rcx)
	movdqa	%xmm0, u+16(%rcx)
	movdqa	%xmm0, v+16(%rcx)
	movdqa	%xmm0, p+16(%rcx)
	movdqa	%xmm0, u+32(%rcx)
	movdqa	%xmm0, v+32(%rcx)
	movdqa	%xmm0, p+32(%rcx)
	movdqa	%xmm0, u+48(%rcx)
	movdqa	%xmm0, v+48(%rcx)
	movdqa	%xmm0, p+48(%rcx)
	movdqa	%xmm0, u+64(%rcx)
	movdqa	%xmm0, v+64(%rcx)
	movdqa	%xmm0, p+64(%rcx)
	movdqa	%xmm0, u+80(%rcx)
	movdqa	%xmm0, v+80(%rcx)
	movdqa	%xmm0, p+80(%rcx)
	movdqa	%xmm0, u+96(%rcx)
	movdqa	%xmm0, v+96(%rcx)
	movdqa	%xmm0, p+96(%rcx)
	movdqa	%xmm0, u+112(%rcx)
	movdqa	%xmm0, v+112(%rcx)
	movdqa	%xmm0, p+112(%rcx)
	incq	%rax
	subq	$-128, %rcx
	cmpq	$31, %rax
	jl	.LBB0_3
# BB#4:                                 # %polly.stmt.vector.body60.preheader
	pxor	%xmm0, %xmm0
	movdqa	%xmm0, -32(%rbp)
	movdqa	%xmm0, -48(%rbp)
	movq	$-1, %rax
	movl	$24, %ecx
	.p2align	4, 0x90
.LBB0_5:                                # %polly.stmt.vector.body60
                                        # =>This Inner Loop Header: Depth=1
	movq	sum-24(%rcx), %xmm0     # xmm0 = mem[0],zero
	movq	sum-16(%rcx), %xmm1     # xmm1 = mem[0],zero
	movdqa	%xmm0, %xmm2
	psrad	$31, %xmm2
	punpckldq	%xmm2, %xmm0    # xmm0 = xmm0[0],xmm2[0],xmm0[1],xmm2[1]
	movdqa	%xmm1, %xmm2
	psrad	$31, %xmm2
	punpckldq	%xmm2, %xmm1    # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
	paddq	-32(%rbp), %xmm0
	paddq	-48(%rbp), %xmm1
	movq	sum-8(%rcx), %xmm2      # xmm2 = mem[0],zero
	movq	sum(%rcx), %xmm3        # xmm3 = mem[0],zero
	movdqa	%xmm2, %xmm4
	psrad	$31, %xmm4
	punpckldq	%xmm4, %xmm2    # xmm2 = xmm2[0],xmm4[0],xmm2[1],xmm4[1]
	movdqa	%xmm3, %xmm4
	psrad	$31, %xmm4
	punpckldq	%xmm4, %xmm3    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
	paddq	%xmm0, %xmm2
	paddq	%xmm1, %xmm3
	movdqa	%xmm2, -32(%rbp)
	movdqa	%xmm3, -48(%rbp)
	movdqa	%xmm2, -64(%rbp)
	movdqa	%xmm3, -80(%rbp)
	incq	%rax
	addq	$32, %rcx
	cmpq	$8388607, %rax          # imm = 0x7FFFFF
	jl	.LBB0_5
# BB#6:                                 # %polly.exiting
	movdqa	-80(%rbp), %xmm0
	movdqa	-64(%rbp), %xmm1
	movabsq	$68719476736, %rbx      # imm = 0x1000000000
	paddq	%xmm1, %xmm0
	pshufd	$78, %xmm0, %xmm1       # xmm1 = xmm0[2,3,0,1]
	paddq	%xmm0, %xmm1
	movd	%xmm1, %rax
	cmpq	%rbx, %rax
	jne	.LBB0_8
# BB#7:                                 # %if.end
	movl	$6, %edi
	movl	$.L.str.1, %esi
	callq	setlocale
	movl	$.L.str.2, %edi
	movl	$1024, %edx             # imm = 0x400
	xorl	%eax, %eax
	movq	%rbx, %rsi
	movq	%rbx, %rcx
	callq	printf
	xorl	%eax, %eax
	addq	$72, %rsp
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
	.comm	u,4096,16
	.type	v,@object               # @v
	.comm	v,4096,16
	.type	p,@object               # @p
	.comm	p,4096,16
	.type	sum,@object             # @sum
	.comm	sum,268435456,16
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
