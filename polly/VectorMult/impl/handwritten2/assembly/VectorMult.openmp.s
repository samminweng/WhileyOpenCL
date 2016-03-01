	.text
	.file	"VectorMult.openmp.ll"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI0_0:
	.long	1024                    # 0x400
	.long	1024                    # 0x400
	.long	1024                    # 0x400
	.long	1024                    # 0x400
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %polly.split_new_and_old47
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
	movl	$240, %ecx
	movdqa	.LCPI0_0(%rip), %xmm0   # xmm0 = [1024,1024,1024,1024]
	.p2align	4, 0x90
.LBB0_1:                                # %polly.stmt.vector.body
                                        # =>This Inner Loop Header: Depth=1
	movdqa	%xmm0, sum-240(%rcx)
	movdqa	%xmm0, sum-224(%rcx)
	movdqa	%xmm0, sum-208(%rcx)
	movdqa	%xmm0, sum-192(%rcx)
	movdqa	%xmm0, sum-176(%rcx)
	movdqa	%xmm0, sum-160(%rcx)
	movdqa	%xmm0, sum-144(%rcx)
	movdqa	%xmm0, sum-128(%rcx)
	movdqa	%xmm0, sum-112(%rcx)
	movdqa	%xmm0, sum-96(%rcx)
	movdqa	%xmm0, sum-80(%rcx)
	movdqa	%xmm0, sum-64(%rcx)
	movdqa	%xmm0, sum-48(%rcx)
	movdqa	%xmm0, sum-32(%rcx)
	movdqa	%xmm0, sum-16(%rcx)
	movdqa	%xmm0, sum(%rcx)
	incq	%rax
	addq	$256, %rcx              # imm = 0x100
	cmpq	$1048575, %rax          # imm = 0xFFFFF
	jl	.LBB0_1
# BB#2:                                 # %polly.start
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
	pxor	%xmm0, %xmm0
	movdqa	%xmm0, -32(%rbp)
	movdqa	%xmm0, -48(%rbp)
	movq	$-1, %rax
	movl	$24, %ecx
	.p2align	4, 0x90
.LBB0_3:                                # %polly.stmt.vector.body11
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
	jl	.LBB0_3
# BB#4:                                 # %polly.exiting
	movdqa	-64(%rbp), %xmm1
	movdqa	-80(%rbp), %xmm0
	movabsq	$68719476736, %rbx      # imm = 0x1000000000
	paddq	%xmm1, %xmm0
	pshufd	$78, %xmm0, %xmm1       # xmm1 = xmm0[2,3,0,1]
	paddq	%xmm0, %xmm1
	movd	%xmm1, %rax
	cmpq	%rbx, %rax
	jne	.LBB0_6
# BB#5:                                 # %if.end
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
.LBB0_6:                                # %if.then
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$-2, %edi
	callq	exit
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
	movq	16(%rsp), %rdi
	addq	$-2, %r8
	.p2align	4, 0x90
.LBB1_6:                                # %polly.loop_preheader3
                                        #   Parent Loop BB1_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_7 Depth 3
	movq	%rdi, %rcx
	shlq	$5, %rcx
	leaq	4(%rcx), %rsi
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
	movaps	%xmm0, p(,%rcx,4)
	movaps	%xmm0, u(,%rsi,4)
	movaps	%xmm0, v(,%rsi,4)
	movaps	%xmm0, p(,%rsi,4)
	movaps	%xmm0, u(,%rdx,4)
	movaps	%xmm0, v(,%rdx,4)
	movaps	%xmm0, p(,%rdx,4)
	movaps	%xmm0, u(,%rax,4)
	movaps	%xmm0, v(,%rax,4)
	movaps	%xmm0, p(,%rax,4)
	movaps	%xmm0, u(,%r12,4)
	movaps	%xmm0, v(,%r12,4)
	movaps	%xmm0, p(,%r12,4)
	movaps	%xmm0, u(,%r11,4)
	movaps	%xmm0, v(,%r11,4)
	movaps	%xmm0, p(,%r11,4)
	movaps	%xmm0, u(,%r10,4)
	movaps	%xmm0, v(,%r10,4)
	movaps	%xmm0, p(,%r10,4)
	movaps	%xmm0, u(,%r9,4)
	movaps	%xmm0, v(,%r9,4)
	movaps	%xmm0, p(,%r9,4)
	cmpq	%r8, %rdi
	leaq	1(%rdi), %rdi
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
