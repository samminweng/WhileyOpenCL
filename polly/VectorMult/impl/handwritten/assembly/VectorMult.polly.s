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
	pushq	%rbx
	pushq	%rax
.Ltmp3:
	.cfi_offset %rbx, -24
	xorl	%esi, %esi
	movaps	.LCPI0_0(%rip), %xmm0   # xmm0 = [1,1,1,1]
	.p2align	4, 0x90
.LBB0_3:                                # %polly.loop_preheader2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
	movq	%rsi, %rax
	shlq	$5, %rax
	leaq	4(%rax), %rdi
	leaq	8(%rax), %rdx
	leaq	12(%rax), %rcx
	leaq	16(%rax), %r11
	leaq	20(%rax), %r10
	leaq	24(%rax), %r9
	leaq	28(%rax), %r8
	movl	$2097152, %ebx          # imm = 0x200000
	.p2align	4, 0x90
.LBB0_4:                                # %vector.body
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	decq	%rbx
	jne	.LBB0_4
# BB#2:                                 # %polly.loop_exit3
                                        #   in Loop: Header=BB0_3 Depth=1
	movaps	%xmm0, u(,%rax,4)
	movaps	%xmm0, v(,%rax,4)
	movaps	%xmm0, u(,%rdi,4)
	movaps	%xmm0, v(,%rdi,4)
	movaps	%xmm0, u(,%rdx,4)
	movaps	%xmm0, v(,%rdx,4)
	movaps	%xmm0, u(,%rcx,4)
	movaps	%xmm0, v(,%rcx,4)
	movaps	%xmm0, u(,%r11,4)
	movaps	%xmm0, v(,%r11,4)
	movaps	%xmm0, u(,%r10,4)
	movaps	%xmm0, v(,%r10,4)
	movaps	%xmm0, u(,%r9,4)
	movaps	%xmm0, v(,%r9,4)
	movaps	%xmm0, u(,%r8,4)
	movaps	%xmm0, v(,%r8,4)
	incq	%rsi
	cmpq	$32, %rsi
	jne	.LBB0_3
# BB#1:                                 # %polly.exiting
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
	addq	$8, %rsp
	popq	%rbx
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
