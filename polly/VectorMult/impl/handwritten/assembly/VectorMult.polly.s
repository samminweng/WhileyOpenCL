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
	movl	$8388608, %eax          # imm = 0x800000
	.p2align	4, 0x90
.LBB0_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	decq	%rax
	jne	.LBB0_1
# BB#2:                                 # %vector.ph26.preheader
	movaps	.LCPI0_0(%rip), %xmm0   # xmm0 = [1,1,1,1]
	movaps	%xmm0, u(%rip)
	movaps	%xmm0, v(%rip)
	movaps	%xmm0, u+16(%rip)
	movaps	%xmm0, v+16(%rip)
	movaps	%xmm0, u+32(%rip)
	movaps	%xmm0, v+32(%rip)
	movaps	%xmm0, u+48(%rip)
	movaps	%xmm0, v+48(%rip)
	movaps	%xmm0, u+64(%rip)
	movaps	%xmm0, v+64(%rip)
	movaps	%xmm0, u+80(%rip)
	movaps	%xmm0, v+80(%rip)
	movaps	%xmm0, u+96(%rip)
	movaps	%xmm0, v+96(%rip)
	movaps	%xmm0, u+112(%rip)
	movaps	%xmm0, v+112(%rip)
	movl	$8388608, %eax          # imm = 0x800000
	.p2align	4, 0x90
.LBB0_3:                                # %vector.body22
                                        # =>This Inner Loop Header: Depth=1
	decq	%rax
	jne	.LBB0_3
# BB#4:                                 # %polly.loop_exit3.1
	pushq	%rbp
.Ltmp0:
	.cfi_def_cfa_offset 16
.Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp2:
	.cfi_def_cfa_register %rbp
	movaps	%xmm0, u+128(%rip)
	movaps	%xmm0, v+128(%rip)
	movaps	%xmm0, u+144(%rip)
	movaps	%xmm0, v+144(%rip)
	movaps	%xmm0, u+160(%rip)
	movaps	%xmm0, v+160(%rip)
	movaps	%xmm0, u+176(%rip)
	movaps	%xmm0, v+176(%rip)
	movaps	%xmm0, u+192(%rip)
	movaps	%xmm0, v+192(%rip)
	movaps	%xmm0, u+208(%rip)
	movaps	%xmm0, v+208(%rip)
	movaps	%xmm0, u+224(%rip)
	movaps	%xmm0, v+224(%rip)
	movaps	%xmm0, u+240(%rip)
	movaps	%xmm0, v+240(%rip)
	movl	$6, %edi
	movl	$.L.str.1, %esi
	callq	setlocale
	movabsq	$17179869184, %rsi      # imm = 0x400000000
	movl	$.L.str.2, %edi
	movl	$64, %edx
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
	.comm	u,256,16
	.type	v,@object               # @v
	.comm	v,256,16
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
