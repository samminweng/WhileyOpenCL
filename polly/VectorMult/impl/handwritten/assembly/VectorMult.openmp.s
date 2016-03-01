	.text
	.file	"VectorMult.openmp.ll"
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
	leaq	-16(%rbp), %rbx
	movl	$main_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$32, %r8d
	movl	$1, %r9d
	movq	%rbx, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	main_polly_subfn
	callq	GOMP_parallel_end
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

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI1_0:
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	1                       # 0x1
	.text
	.p2align	4, 0x90
	.type	main_polly_subfn,@function
main_polly_subfn:                       # @main_polly_subfn
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp4:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp5:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp6:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp7:
	.cfi_def_cfa_offset 40
	subq	$24, %rsp
.Ltmp8:
	.cfi_def_cfa_offset 64
.Ltmp9:
	.cfi_offset %rbx, -40
.Ltmp10:
	.cfi_offset %r12, -32
.Ltmp11:
	.cfi_offset %r14, -24
.Ltmp12:
	.cfi_offset %r15, -16
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB1_2
# BB#1:
	movaps	.LCPI1_0(%rip), %xmm0   # xmm0 = [1,1,1,1]
	leaq	16(%rsp), %r14
	leaq	8(%rsp), %r15
	.p2align	4, 0x90
.LBB1_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_6 Depth 2
                                        #       Child Loop BB1_7 Depth 3
	movq	8(%rsp), %r8
	movq	16(%rsp), %rsi
	addq	$-2, %r8
	.p2align	4, 0x90
.LBB1_6:                                # %polly.loop_preheader3
                                        #   Parent Loop BB1_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_7 Depth 3
	movq	%rsi, %rcx
	shlq	$5, %rcx
	leaq	4(%rcx), %rdi
	leaq	8(%rcx), %rdx
	leaq	12(%rcx), %rax
	leaq	16(%rcx), %r12
	leaq	20(%rcx), %r11
	leaq	24(%rcx), %r10
	leaq	28(%rcx), %r9
	movl	$2097152, %ebx          # imm = 0x200000
	.p2align	4, 0x90
.LBB1_7:                                # %vector.body
                                        #   Parent Loop BB1_4 Depth=1
                                        #     Parent Loop BB1_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	decq	%rbx
	jne	.LBB1_7
# BB#5:                                 # %polly.loop_exit4
                                        #   in Loop: Header=BB1_6 Depth=2
	movaps	%xmm0, u(,%rcx,4)
	movaps	%xmm0, v(,%rcx,4)
	movaps	%xmm0, u(,%rdi,4)
	movaps	%xmm0, v(,%rdi,4)
	movaps	%xmm0, u(,%rdx,4)
	movaps	%xmm0, v(,%rdx,4)
	movaps	%xmm0, u(,%rax,4)
	movaps	%xmm0, v(,%rax,4)
	movaps	%xmm0, u(,%r12,4)
	movaps	%xmm0, v(,%r12,4)
	movaps	%xmm0, u(,%r11,4)
	movaps	%xmm0, v(,%r11,4)
	movaps	%xmm0, u(,%r10,4)
	movaps	%xmm0, v(,%r10,4)
	movaps	%xmm0, u(,%r9,4)
	movaps	%xmm0, v(,%r9,4)
	cmpq	%r8, %rsi
	leaq	1(%rsi), %rsi
	jle	.LBB1_6
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB1_4 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	movaps	.LCPI1_0(%rip), %xmm0   # xmm0 = [1,1,1,1]
	testb	%al, %al
	jne	.LBB1_4
.LBB1_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Lfunc_end1:
	.size	main_polly_subfn, .Lfunc_end1-main_polly_subfn
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
