	.text
	.file	"VectorMult.polly.ll"
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
	pushq	%rbx
	pushq	%rax
.Ltmp3:
	.cfi_offset %rbx, -40
.Ltmp4:
	.cfi_offset %r14, -32
.Ltmp5:
	.cfi_offset %r15, -24
	movl	$1048576, %edi          # imm = 0x100000
	callq	malloc
	movq	%rax, %r14
	xorl	%r15d, %r15d
	xorl	%esi, %esi
	movl	$1048576, %edx          # imm = 0x100000
	movq	%r14, %rdi
	callq	memset
	movq	%r14, %r8
	addq	$12, %r8
	.p2align	4, 0x90
.LBB0_1:                                # %polly.loop_preheader9
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_10 Depth 2
                                        #       Child Loop BB0_11 Depth 3
                                        #         Child Loop BB0_12 Depth 4
	movq	%r15, %rcx
	shlq	$5, %rcx
	movq	%r8, %rbx
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB0_10:                               # %polly.loop_preheader15
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_11 Depth 3
                                        #         Child Loop BB0_12 Depth 4
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB0_11:                               # %polly.loop_preheader21
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_10 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_12 Depth 4
	leaq	(%rdi,%rcx), %rax
	movq	%rbx, %rdx
	movl	$32, %esi
	.p2align	4, 0x90
.LBB0_12:                               # %polly.loop_header20
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_10 Depth=2
                                        #       Parent Loop BB0_11 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	incl	-12(%rdx)
	incl	-8(%rdx)
	incl	-4(%rdx)
	incl	(%rdx)
	addq	$16, %rdx
	addq	$-4, %rsi
	jne	.LBB0_12
# BB#8:                                 # %polly.loop_exit22
                                        #   in Loop: Header=BB0_11 Depth=3
	movl	$1, u(,%rax,4)
	movl	$1, v(,%rax,4)
	incq	%rdi
	cmpq	$32, %rdi
	jne	.LBB0_11
# BB#9:                                 # %polly.loop_exit16
                                        #   in Loop: Header=BB0_10 Depth=2
	incq	%r9
	subq	$-128, %rbx
	cmpq	$8192, %r9              # imm = 0x2000
	jne	.LBB0_10
# BB#5:                                 # %polly.loop_exit10
                                        #   in Loop: Header=BB0_1 Depth=1
	incq	%r15
	cmpq	$128, %r15
	jne	.LBB0_1
# BB#6:                                 # %polly.stmt.for.inc22.preheader
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_7:                                # %polly.stmt.for.inc22
                                        # =>This Inner Loop Header: Depth=1
	movslq	(%r14,%rax,4), %rdx
	addq	%rcx, %rdx
	movslq	4(%r14,%rax,4), %rcx
	addq	%rdx, %rcx
	movslq	8(%r14,%rax,4), %rdx
	addq	%rcx, %rdx
	movslq	12(%r14,%rax,4), %rcx
	addq	%rdx, %rcx
	addq	$4, %rax
	cmpq	$262144, %rax           # imm = 0x40000
	jne	.LBB0_7
# BB#3:                                 # %polly.exiting
	cmpq	$1073741824, %rcx       # imm = 0x40000000
	jne	.LBB0_4
# BB#2:                                 # %if.end
	movl	$6, %edi
	movl	$.L.str.1, %esi
	callq	setlocale
	movl	$.L.str.2, %edi
	movl	$1073741824, %esi       # imm = 0x40000000
	movl	$4096, %edx             # imm = 0x1000
	movl	$1073741824, %ecx       # imm = 0x40000000
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB0_4:                                # %if.then
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$-2, %edi
	callq	exit
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.type	u,@object               # @u
	.comm	u,16384,16
	.type	v,@object               # @v
	.comm	v,16384,16
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


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git 3f10def1e46ea783186be08e2138d0f76a707712) (http://llvm.org/git/llvm.git 626ceb277f4fd20c1899e04490b0ea6c2b1a0da8)"
	.section	".note.GNU-stack","",@progbits
