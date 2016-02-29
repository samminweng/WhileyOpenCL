	.text
	.file	"VectorMult.openmp.ll"
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %polly.loop_preheader
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
	pushq	%rbx
	subq	$24, %rsp
.Ltmp3:
	.cfi_offset %rbx, -40
.Ltmp4:
	.cfi_offset %r14, -32
.Ltmp5:
	.cfi_offset %r15, -24
	movl	$65536, %edi            # imm = 0x10000
	callq	malloc
	movq	%rax, %r14
	xorl	%r15d, %r15d
	xorl	%esi, %esi
	movl	$65536, %edx            # imm = 0x10000
	movq	%r14, %rdi
	callq	memset
	movq	%r14, %r8
	addq	$12, %r8
	.p2align	4, 0x90
.LBB0_1:                                # %polly.loop_preheader48
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
                                        #       Child Loop BB0_3 Depth 3
                                        #         Child Loop BB0_4 Depth 4
	movq	%r15, %rax
	shlq	$7, %rax
	leaq	u(%rax), %r10
	leaq	v(%rax), %rdx
	movq	%r8, %rdi
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB0_2:                                # %polly.loop_header47
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_3 Depth 3
                                        #         Child Loop BB0_4 Depth 4
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_3:                                # %polly.loop_header53
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_4 Depth 4
	movq	$-1, %rbx
	movq	%rdi, %rsi
	movl	$28, %ecx
	.p2align	4, 0x90
.LBB0_4:                                # %polly.stmt.polly.loop_header20
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        #       Parent Loop BB0_3 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	incl	-12(%rsi)
	incl	-8(%rsi)
	incl	-4(%rsi)
	incl	(%rsi)
	incq	%rbx
	addq	$-4, %rcx
	addq	$16, %rsi
	cmpq	$7, %rbx
	jl	.LBB0_4
# BB#5:                                 # %polly.stmt.polly.loop_exit22
                                        #   in Loop: Header=BB0_3 Depth=3
	movl	$1, (%r10,%rax,4)
	movl	$1, (%rdx,%rax,4)
	cmpq	$31, %rax
	leaq	1(%rax), %rax
	jl	.LBB0_3
# BB#6:                                 # %polly.loop_exit55
                                        #   in Loop: Header=BB0_2 Depth=2
	subq	$-128, %rdi
	cmpq	$511, %r9               # imm = 0x1FF
	leaq	1(%r9), %r9
	jl	.LBB0_2
# BB#7:                                 # %polly.loop_exit49
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpq	$32767, %r15            # imm = 0x7FFF
	leaq	1(%r15), %r15
	jl	.LBB0_1
# BB#8:                                 # %polly.stmt.polly.stmt.for.inc22.preheader
	movq	$0, -32(%rbp)
	movq	$-1, %rax
	movl	$3, %ecx
	.p2align	4, 0x90
.LBB0_9:                                # %polly.stmt.polly.stmt.for.inc22
                                        # =>This Inner Loop Header: Depth=1
	movslq	-12(%r14,%rcx,4), %rdx
	addq	-32(%rbp), %rdx
	movslq	-8(%r14,%rcx,4), %rsi
	addq	%rdx, %rsi
	movslq	-4(%r14,%rcx,4), %rdx
	addq	%rsi, %rdx
	movslq	(%r14,%rcx,4), %rsi
	addq	%rdx, %rsi
	movq	%rsi, -32(%rbp)
	movq	%rsi, -40(%rbp)
	incq	%rax
	addq	$4, %rcx
	cmpq	$4095, %rax             # imm = 0xFFF
	jl	.LBB0_9
# BB#10:                                # %polly.exiting46
	movq	-40(%rbp), %rax
	movabsq	$17179869184, %rbx      # imm = 0x400000000
	cmpq	%rbx, %rax
	jne	.LBB0_12
# BB#11:                                # %if.end
	movl	$6, %edi
	movl	$.L.str.1, %esi
	callq	setlocale
	movl	$.L.str.2, %edi
	movl	$1048576, %edx          # imm = 0x100000
	xorl	%eax, %eax
	movq	%rbx, %rsi
	movq	%rbx, %rcx
	callq	printf
	xorl	%eax, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB0_12:                               # %if.then
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$-2, %edi
	callq	exit
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.type	u,@object               # @u
	.comm	u,4194304,16
	.type	v,@object               # @v
	.comm	v,4194304,16
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
	.asciz	"Pass the %'lld vector multiplication test case with local vectors = %d size.\nThe Dot Product = %'lld\n"
	.size	.L.str.2, 102


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
