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
	movl	$65536, %edi            # imm = 0x10000
	callq	malloc
	movq	%rax, %r15
	xorl	%r14d, %r14d
	xorl	%esi, %esi
	movl	$65536, %edx            # imm = 0x10000
	movq	%r15, %rdi
	callq	memset
	movq	%r15, %r8
	addq	$12, %r8
	.p2align	4, 0x90
.LBB0_1:                                # %polly.loop_preheader9
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_10 Depth 2
                                        #       Child Loop BB0_11 Depth 3
                                        #         Child Loop BB0_12 Depth 4
	movq	%r14, %rcx
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
	cmpq	$512, %r9               # imm = 0x200
	jne	.LBB0_10
# BB#5:                                 # %polly.loop_exit10
                                        #   in Loop: Header=BB0_1 Depth=1
	incq	%r14
	cmpq	$32768, %r14            # imm = 0x8000
	jne	.LBB0_1
# BB#6:                                 # %polly.stmt.for.inc22.preheader
	xorl	%ecx, %ecx
	movabsq	$17179869184, %r14      # imm = 0x400000000
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_7:                                # %polly.stmt.for.inc22
                                        # =>This Inner Loop Header: Depth=1
	movslq	(%r15,%rax,4), %rdx
	addq	%rcx, %rdx
	movslq	4(%r15,%rax,4), %rcx
	addq	%rdx, %rcx
	movslq	8(%r15,%rax,4), %rdx
	addq	%rcx, %rdx
	movslq	12(%r15,%rax,4), %rcx
	addq	%rdx, %rcx
	addq	$4, %rax
	cmpq	$16384, %rax            # imm = 0x4000
	jne	.LBB0_7
# BB#3:                                 # %polly.exiting
	cmpq	%r14, %rcx
	jne	.LBB0_4
# BB#2:                                 # %if.end
	movl	$6, %edi
	movl	$.L.str.1, %esi
	callq	setlocale
	movl	$.L.str.2, %edi
	movl	$1048576, %edx          # imm = 0x100000
	xorl	%eax, %eax
	movq	%r14, %rsi
	movq	%r14, %rcx
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
