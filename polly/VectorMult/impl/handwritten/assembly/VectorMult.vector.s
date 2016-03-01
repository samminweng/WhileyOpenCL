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
# BB#0:                                 # %polly.split_new_and_old
	movq	$-1, %rax
	xorl	%ecx, %ecx
	movaps	.LCPI0_0(%rip), %xmm0   # xmm0 = [1,1,1,1]
	.p2align	4, 0x90
.LBB0_1:                                # %polly.stmt.polly.loop_exit3
                                        # =>This Inner Loop Header: Depth=1
	movaps	%xmm0, u(%rcx)
	movaps	%xmm0, v(%rcx)
	movaps	%xmm0, u+16(%rcx)
	movaps	%xmm0, v+16(%rcx)
	movaps	%xmm0, u+32(%rcx)
	movaps	%xmm0, v+32(%rcx)
	movaps	%xmm0, u+48(%rcx)
	movaps	%xmm0, v+48(%rcx)
	movaps	%xmm0, u+64(%rcx)
	movaps	%xmm0, v+64(%rcx)
	movaps	%xmm0, u+80(%rcx)
	movaps	%xmm0, v+80(%rcx)
	movaps	%xmm0, u+96(%rcx)
	movaps	%xmm0, v+96(%rcx)
	movaps	%xmm0, u+112(%rcx)
	movaps	%xmm0, v+112(%rcx)
	incq	%rax
	subq	$-128, %rcx
	cmpq	$31, %rax
	jl	.LBB0_1
# BB#2:                                 # %polly.exiting
	pushq	%rbp
.Ltmp0:
	.cfi_def_cfa_offset 16
.Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp2:
	.cfi_def_cfa_register %rbp
	movl	$6, %edi
	movl	$.L.str.1, %esi
	callq	setlocale
	movabsq	$68719476736, %rsi      # imm = 0x1000000000
	movl	$.L.str.2, %edi
	movl	$1024, %edx             # imm = 0x400
	xorl	%eax, %eax
	movq	%rsi, %rcx
	callq	printf
	xorl	%eax, %eax
	popq	%rbp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.type	u,@object               # @u
	.comm	u,4096,16
	.type	v,@object               # @v
	.comm	v,4096,16
	.type	.L.str.1,@object        # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.zero	1
	.size	.L.str.1, 1

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"Pass the %'lld vector multiplication test case with local vector size = %d\nThe Dot Product = %'lld\n"
	.size	.L.str.2, 100


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
