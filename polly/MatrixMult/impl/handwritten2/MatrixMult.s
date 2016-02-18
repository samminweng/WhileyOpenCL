	.text
	.file	"MatrixMult.openmp.ll"
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
	pushq	%rbx
	pushq	%rax
.Ltmp3:
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movl	$8388608, %edi          # imm = 0x800000
	callq	malloc
	movq	%rax, %rcx
	addq	$24, %rcx
	xorl	%edx, %edx
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_4:                                # %for.inc20
                                        #   in Loop: Header=BB0_1 Depth=1
	incq	%rdx
	addq	$8192, %rcx             # imm = 0x2000
.LBB0_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	cmpq	$1024, %rdx             # imm = 0x400
	movq	%rcx, %rsi
	movl	$0, %edi
	jne	.LBB0_2
	jmp	.LBB0_5
	.p2align	4, 0x90
.LBB0_3:                                # %for.inc
                                        #   in Loop: Header=BB0_2 Depth=2
	movq	%rbx, -24(%rsi)
	movq	%rbx, -16(%rsi)
	movq	%rbx, -8(%rsi)
	movq	%rbx, (%rsi)
	addq	$4, %rdi
	addq	$32, %rsi
.LBB0_2:                                # %for.cond1
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpq	$1023, %rdi             # imm = 0x3FF
	jle	.LBB0_3
	jmp	.LBB0_4
.LBB0_5:                                # %for.end21
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end0:
	.size	init_array, .Lfunc_end0-init_array
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %polly.split_new_and_old
	pushq	%rbp
.Ltmp4:
	.cfi_def_cfa_offset 16
.Ltmp5:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp6:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$32, %rsp
.Ltmp7:
	.cfi_offset %rbx, -48
.Ltmp8:
	.cfi_offset %r12, -40
.Ltmp9:
	.cfi_offset %r14, -32
.Ltmp10:
	.cfi_offset %r15, -24
	movl	$1, %edi
	callq	init_array
	movq	%rax, %r14
	movl	$1, %edi
	callq	init_array
	movq	%rax, %r12
	xorl	%r15d, %r15d
	xorl	%edi, %edi
	callq	init_array
	leaq	8388608(%r14), %rcx
	cmpq	%rax, %rcx
	setbe	%cl
	leaq	8388608(%rax), %rdi
	cmpq	%r14, %rdi
	setbe	%sil
	leaq	8388608(%r12), %rdx
	cmpq	%rax, %rdx
	setbe	%dl
	cmpq	%r12, %rdi
	setbe	%dil
	testb	%r15b, %r15b
	jne	.LBB1_3
# BB#1:                                 # %polly.split_new_and_old
	orb	%sil, %cl
	je	.LBB1_3
# BB#2:                                 # %polly.split_new_and_old
	orb	%dil, %dl
	je	.LBB1_3
	.p2align	4, 0x90
.LBB1_11:                               # %polly.loop_preheader8
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_12 Depth 2
                                        #       Child Loop BB1_13 Depth 3
	movq	%r15, %r8
	shlq	$13, %r8
	addq	%rax, %r8
	movq	%r12, %r9
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB1_12:                               # %polly.stmt.for.body5
                                        #   Parent Loop BB1_11 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_13 Depth 3
	movq	$0, -64(%rbp)
	movq	$-1, %rdi
	movq	%r14, %rcx
	movq	%r9, %rdx
	.p2align	4, 0x90
.LBB1_13:                               # %polly.cond
                                        #   Parent Loop BB1_11 Depth=1
                                        #     Parent Loop BB1_12 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	incq	%rdi
	movq	-64(%rbp), %rbx
	movq	%rbx, -56(%rbp)
	movq	%rbx, -48(%rbp)
	cmpq	$1024, %rdi             # imm = 0x400
	jge	.LBB1_14
# BB#16:                                # %polly.stmt.for.inc
                                        #   in Loop: Header=BB1_13 Depth=3
	movq	(%rcx), %rbx
	imulq	(%rdx), %rbx
	addq	-56(%rbp), %rbx
	movq	%rbx, -40(%rbp)
	movq	%rbx, -64(%rbp)
.LBB1_14:                               # %polly.merge
                                        #   in Loop: Header=BB1_13 Depth=3
	addq	$8192, %rdx             # imm = 0x2000
	addq	$8, %rcx
	cmpq	$1024, %rdi             # imm = 0x400
	jl	.LBB1_13
# BB#15:                                # %polly.stmt.for.end
                                        #   in Loop: Header=BB1_12 Depth=2
	movq	-48(%rbp), %rcx
	movq	%rcx, (%r8,%rsi,8)
	addq	$8, %r9
	cmpq	$1023, %rsi             # imm = 0x3FF
	leaq	1(%rsi), %rsi
	jl	.LBB1_12
# BB#10:                                # %polly.loop_exit9
                                        #   in Loop: Header=BB1_11 Depth=1
	addq	$8192, %r14             # imm = 0x2000
	cmpq	$1023, %r15             # imm = 0x3FF
	leaq	1(%r15), %r15
	jl	.LBB1_11
	jmp	.LBB1_17
	.p2align	4, 0x90
.LBB1_9:                                # %for.inc22
                                        #   in Loop: Header=BB1_3 Depth=1
	incq	%r15
	addq	$8192, %r14             # imm = 0x2000
.LBB1_3:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_5 Depth 2
                                        #       Child Loop BB1_6 Depth 3
	xorl	%r9d, %r9d
	cmpq	$1024, %r15             # imm = 0x400
	je	.LBB1_17
# BB#4:                                 #   in Loop: Header=BB1_3 Depth=1
	movq	%r15, %r8
	shlq	$10, %r8
	jmp	.LBB1_5
	.p2align	4, 0x90
.LBB1_8:                                # %for.inc19
                                        #   in Loop: Header=BB1_5 Depth=2
	leaq	(%r8,%r9), %rcx
	movq	%rsi, (%rax,%rcx,8)
	incq	%r9
.LBB1_5:                                # %for.cond3
                                        #   Parent Loop BB1_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_6 Depth 3
	cmpq	$1024, %r9              # imm = 0x400
	movq	%r14, %rdi
	movl	$0, %edx
	movl	$0, %esi
	jne	.LBB1_6
	jmp	.LBB1_9
	.p2align	4, 0x90
.LBB1_7:                                # %for.inc
                                        #   in Loop: Header=BB1_6 Depth=3
	movq	(%rdi), %rbx
	leaq	(%r12,%rdx), %rcx
	imulq	(%rcx,%r9,8), %rbx
	addq	%rbx, %rsi
	addq	$8192, %rdx             # imm = 0x2000
	addq	$8, %rdi
.LBB1_6:                                # %for.cond6
                                        #   Parent Loop BB1_3 Depth=1
                                        #     Parent Loop BB1_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpq	$8388608, %rdx          # imm = 0x800000
	jne	.LBB1_7
	jmp	.LBB1_8
.LBB1_17:                               # %for.end24
	movq	8388600(%rax), %rcx
	movl	$.L.str, %edi
	movl	$1024, %esi             # imm = 0x400
	movl	$1024, %edx             # imm = 0x400
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Pass %d X %d matrix test case (C[N][N] =%lld) \n "
	.size	.L.str, 49


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git c43284c4913e075fc10ac6dea2961788a660f09d) (http://llvm.org/git/llvm.git 7f53bedefce9ad990a1906fed303e104ff621783)"
	.section	".note.GNU-stack","",@progbits
