	.text
	.file	"MatrixMult.openmp.ll"
	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
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
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
.Ltmp3:
	.cfi_offset %rbx, -56
.Ltmp4:
	.cfi_offset %r12, -48
.Ltmp5:
	.cfi_offset %r13, -40
.Ltmp6:
	.cfi_offset %r14, -32
.Ltmp7:
	.cfi_offset %r15, -24
	movl	%edx, %r15d
	movl	%esi, %r14d
	movl	%edi, %ebx
	movl	%r15d, %eax
	imull	%r14d, %eax
	movslq	%eax, %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%r14, %r10
	testl	%r15d, %r15d
	jle	.LBB0_14
# BB#1:                                 # %for.cond3.preheader.lr.ph
	testl	%r10d, %r10d
	jle	.LBB0_14
# BB#2:                                 # %for.body6.preheader.us.preheader
	movslq	%r10d, %r14
	leal	-1(%r10), %r12d
	incq	%r12
	movabsq	$8589934584, %r11       # imm = 0x1FFFFFFF8
	andq	%r12, %r11
	leaq	-8(%r11), %rcx
	movq	%rcx, -80(%rbp)         # 8-byte Spill
	shrl	$3, %ecx
	incl	%ecx
	movd	%ebx, %xmm0
	pshufd	$0, %xmm0, %xmm0        # xmm0 = xmm0[0,0,0,0]
	andl	$3, %ecx
	movq	%rcx, -72(%rbp)         # 8-byte Spill
	leaq	16(%rax), %r8
	movq	%r8, -48(%rbp)          # 8-byte Spill
	leaq	(,%r14,4), %r13
	movq	%r13, -64(%rbp)         # 8-byte Spill
	negq	%rcx
	movq	%rcx, -56(%rbp)         # 8-byte Spill
	movl	$16, %edi
	xorl	%esi, %esi
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB0_3:                                # %for.body6.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_8 Depth 2
                                        #     Child Loop BB0_11 Depth 2
                                        #     Child Loop BB0_5 Depth 2
	cmpq	$7, %r12
	movl	$0, %edx
	jbe	.LBB0_4
# BB#6:                                 # %min.iters.checked
                                        #   in Loop: Header=BB0_3 Depth=1
	testq	%r11, %r11
	movl	$0, %edx
	je	.LBB0_4
# BB#7:                                 # %vector.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	movl	%r15d, %r13d
	movq	%r10, %r15
	cmpq	$0, -72(%rbp)           # 8-byte Folded Reload
	movq	-56(%rbp), %rdx         # 8-byte Reload
	movq	%r8, %rcx
	movl	$0, %r10d
	je	.LBB0_9
	.p2align	4, 0x90
.LBB0_8:                                # %vector.body.prol
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movdqu	%xmm0, -16(%rcx)
	movdqu	%xmm0, (%rcx)
	addq	$8, %r10
	addq	$32, %rcx
	incq	%rdx
	jne	.LBB0_8
.LBB0_9:                                # %vector.ph.split
                                        #   in Loop: Header=BB0_3 Depth=1
	cmpq	$24, -80(%rbp)          # 8-byte Folded Reload
	jb	.LBB0_12
# BB#10:                                # %vector.ph.split.split
                                        #   in Loop: Header=BB0_3 Depth=1
	movq	%r11, %rdx
	subq	%r10, %rdx
	addq	%rdi, %r10
	movq	-48(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%r10,4), %rcx
	.p2align	4, 0x90
.LBB0_11:                               # %vector.body
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movdqu	%xmm0, -80(%rcx)
	movdqu	%xmm0, -64(%rcx)
	movdqu	%xmm0, -48(%rcx)
	movdqu	%xmm0, -32(%rcx)
	movdqu	%xmm0, -16(%rcx)
	movdqu	%xmm0, (%rcx)
	movdqu	%xmm0, 16(%rcx)
	movdqu	%xmm0, 32(%rcx)
	subq	$-128, %rcx
	addq	$-32, %rdx
	jne	.LBB0_11
.LBB0_12:                               # %middle.block
                                        #   in Loop: Header=BB0_3 Depth=1
	cmpq	%r11, %r12
	movq	%r11, %rdx
	movq	%r15, %r10
	movl	%r13d, %r15d
	movq	-64(%rbp), %r13         # 8-byte Reload
	je	.LBB0_13
	.p2align	4, 0x90
.LBB0_4:                                # %for.body6.us.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	movl	%r10d, %ecx
	subl	%edx, %ecx
	addq	%rsi, %rdx
	leaq	(%rax,%rdx,4), %rdx
	.p2align	4, 0x90
.LBB0_5:                                # %for.body6.us
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%ebx, (%rdx)
	addq	$4, %rdx
	decl	%ecx
	jne	.LBB0_5
.LBB0_13:                               # %for.inc8.loopexit.us
                                        #   in Loop: Header=BB0_3 Depth=1
	incq	%r9
	addq	%r13, %r8
	addq	%r14, %rdi
	addq	%r14, %rsi
	cmpl	%r15d, %r9d
	jne	.LBB0_3
.LBB0_14:                               # %for.end10
	movl	$16, %edi
	movq	%rax, %rbx
	movq	%r10, %r14
	callq	malloc
	movq	%rbx, (%rax)
	movl	%r14d, 8(%rax)
	movl	%r15d, 12(%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end0:
	.size	init, .Lfunc_end0-init
	.cfi_endproc

	.globl	matrix_multiply
	.p2align	4, 0x90
	.type	matrix_multiply,@function
matrix_multiply:                        # @matrix_multiply
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp8:
	.cfi_def_cfa_offset 16
.Ltmp9:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp10:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$136, %rsp
.Ltmp11:
	.cfi_offset %rbx, -56
.Ltmp12:
	.cfi_offset %r12, -48
.Ltmp13:
	.cfi_offset %r13, -40
.Ltmp14:
	.cfi_offset %r14, -32
.Ltmp15:
	.cfi_offset %r15, -24
	movq	%rdi, -48(%rbp)         # 8-byte Spill
	movq	(%rdi), %rax
	movq	%rax, -64(%rbp)         # 8-byte Spill
	movq	(%rsi), %r13
	movl	8(%rsi), %ecx
	movl	%ecx, -52(%rbp)         # 4-byte Spill
	movslq	12(%rdi), %r14
	movq	%r14, -80(%rbp)         # 8-byte Spill
	movl	%r14d, %eax
	imull	%ecx, %eax
	movslq	%eax, %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, %r15
	testq	%r14, %r14
	jle	.LBB1_16
# BB#1:                                 # %for.cond7.preheader.lr.ph
	movl	-52(%rbp), %ebx         # 4-byte Reload
	movslq	%ebx, %rax
	xorl	%r11d, %r11d
	testl	%eax, %eax
	movq	-80(%rbp), %r12         # 8-byte Reload
	movl	%r12d, %r9d
	jle	.LBB1_2
# BB#28:                                # %polly.preload.exec
	movq	-48(%rbp), %rcx         # 8-byte Reload
	movq	8(%rcx), %r11
	movq	%r11, %r9
	shrq	$32, %r9
.LBB1_2:                                # %polly.preload.merge
	movslq	%r11d, %rsi
	movq	%rsi, %rcx
	imulq	%rax, %rcx
	movq	%r13, -72(%rbp)         # 8-byte Spill
	leaq	(%r13,%rcx,4), %rcx
	cmpq	%r15, %rcx
	setbe	%r8b
	leaq	-1(%r12), %r14
	movq	%r14, %rdi
	imulq	%rax, %rdi
	movq	%r12, %rdx
	imulq	%rax, %rdx
	movq	%rax, %r10
	leaq	(%r15,%rdx,4), %rcx
	cmpq	%r13, %rcx
	setbe	%dl
	addq	%rsi, %rdi
	movq	-64(%rbp), %r13         # 8-byte Reload
	leaq	(%r13,%rdi,4), %rsi
	cmpq	%r15, %rsi
	setbe	%al
	cmpq	%r13, %rcx
	setbe	%cl
	orb	%al, %cl
	movzbl	%cl, %eax
	cmpl	$1, %eax
	jne	.LBB1_5
# BB#3:                                 # %polly.preload.merge
	cmpl	%r11d, %ebx
	jl	.LBB1_5
# BB#4:                                 # %polly.preload.merge
	orb	%r8b, %dl
	je	.LBB1_5
# BB#27:                                # %polly.parallel.for37
	sarq	$5, %r14
	movl	%r12d, -136(%rbp)
	movl	%ebx, -132(%rbp)
	movl	%r11d, -128(%rbp)
	movl	%ebx, -124(%rbp)
	movq	%r15, -120(%rbp)
	movq	-48(%rbp), %rax         # 8-byte Reload
	movq	%rax, -112(%rbp)
	incq	%r14
	leaq	-136(%rbp), %rsi
	movl	$matrix_multiply_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r14, %r8
	movq	%r11, %r13
	callq	GOMP_parallel_loop_runtime_start
	leaq	-136(%rbp), %rdi
	callq	matrix_multiply_polly_subfn
	callq	GOMP_parallel_end
	movl	%r12d, -136(%rbp)
	movl	%ebx, -132(%rbp)
	movl	%r13d, -128(%rbp)
	movl	%ebx, -124(%rbp)
	movq	%r15, -120(%rbp)
	movq	-64(%rbp), %rax         # 8-byte Reload
	movq	%rax, -112(%rbp)
	movq	-72(%rbp), %rax         # 8-byte Reload
	movq	%rax, -104(%rbp)
	movq	-48(%rbp), %rax         # 8-byte Reload
	movq	%rax, -96(%rbp)
	leaq	-136(%rbp), %rbx
	movl	$matrix_multiply_polly_subfn_2, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%rbx, %rsi
	movq	%r14, %r8
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	matrix_multiply_polly_subfn_2
	callq	GOMP_parallel_end
	jmp	.LBB1_16
.LBB1_5:                                # %for.cond7.preheader.preheader
	testl	%ebx, %ebx
	jle	.LBB1_6
# BB#25:                                # %for.body11.preheader.us.preheader
	movq	-48(%rbp), %rax         # 8-byte Reload
	movq	8(%rax), %rax
	movq	%rax, -168(%rbp)        # 8-byte Spill
	movslq	%eax, %rdx
	movq	%rax, %rcx
	sarq	$32, %rcx
	movq	%rcx, -144(%rbp)        # 8-byte Spill
	andl	$1, %eax
	movq	%rax, -160(%rbp)        # 8-byte Spill
	movq	%r10, %rbx
	leaq	(%rbx,%rbx), %rsi
	xorl	%eax, %eax
	movq	%rax, -88(%rbp)         # 8-byte Spill
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_26:                               # %for.body11.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_17 Depth 2
                                        #       Child Loop BB1_22 Depth 3
	movq	%rax, -152(%rbp)        # 8-byte Spill
	imulq	%rbx, %rax
	movq	%rax, -48(%rbp)         # 8-byte Spill
	movq	-72(%rbp), %rcx         # 8-byte Reload
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_17:                               # %for.body11.us
                                        #   Parent Loop BB1_26 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_22 Depth 3
	movq	-48(%rbp), %rdi         # 8-byte Reload
	leaq	(%rax,%rdi), %r8
	movl	$0, (%r15,%r8,4)
	movq	-168(%rbp), %rdi        # 8-byte Reload
	testl	%edi, %edi
	jle	.LBB1_23
# BB#18:                                # %for.body17.us.preheader
                                        #   in Loop: Header=BB1_17 Depth=2
	xorl	%r12d, %r12d
	cmpq	$0, -160(%rbp)          # 8-byte Folded Reload
	movl	$0, %r10d
	je	.LBB1_20
# BB#19:                                # %for.body17.us.prol
                                        #   in Loop: Header=BB1_17 Depth=2
	movq	-72(%rbp), %rdi         # 8-byte Reload
	movl	(%rdi,%rax,4), %r12d
	movq	-64(%rbp), %rdi         # 8-byte Reload
	movq	%rbx, %r9
	movq	-48(%rbp), %rbx         # 8-byte Reload
	imull	(%rdi,%rbx,4), %r12d
	movq	%r9, %rbx
	movl	%r12d, (%r15,%r8,4)
	movl	$1, %r10d
.LBB1_20:                               # %for.body17.us.preheader.split
                                        #   in Loop: Header=BB1_17 Depth=2
	cmpq	$1, %rdx
	je	.LBB1_23
# BB#21:                                # %for.body17.us.preheader.split.split
                                        #   in Loop: Header=BB1_17 Depth=2
	leaq	1(%r10), %rdi
	imulq	%rbx, %rdi
	leaq	(%rcx,%rdi,4), %r13
	movq	-88(%rbp), %rdi         # 8-byte Reload
	leaq	(%rdi,%r10), %rdi
	movq	%rbx, %r11
	movq	-64(%rbp), %rbx         # 8-byte Reload
	leaq	(%rbx,%rdi,4), %r9
	movq	%r11, %rbx
	movq	%rbx, %rdi
	imulq	%r10, %rdi
	leaq	(%rcx,%rdi,4), %r11
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB1_22:                               # %for.body17.us
                                        #   Parent Loop BB1_26 Depth=1
                                        #     Parent Loop BB1_17 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	(%r11,%r14,4), %edi
	imull	(%r9), %edi
	addl	%r12d, %edi
	movl	%edi, (%r15,%r8,4)
	movl	(%r13,%r14,4), %r12d
	imull	4(%r9), %r12d
	addl	%edi, %r12d
	movl	%r12d, (%r15,%r8,4)
	addq	$2, %r10
	addq	%rsi, %r14
	addq	$8, %r9
	cmpq	%rdx, %r10
	jl	.LBB1_22
.LBB1_23:                               # %for.inc36.us
                                        #   in Loop: Header=BB1_17 Depth=2
	incq	%rax
	addq	$4, %rcx
	cmpq	%rbx, %rax
	jl	.LBB1_17
# BB#24:                                # %for.inc39.loopexit.us
                                        #   in Loop: Header=BB1_26 Depth=1
	movq	-152(%rbp), %rax        # 8-byte Reload
	incq	%rax
	addq	%rbx, -88(%rbp)         # 8-byte Folded Spill
	cmpq	-144(%rbp), %rax        # 8-byte Folded Reload
	jl	.LBB1_26
	jmp	.LBB1_16
.LBB1_6:                                # %for.inc39.preheader
	movslq	%r9d, %rax
	testq	%rax, %rax
	movl	$1, %ecx
	cmovgq	%rax, %rcx
	xorl	%esi, %esi
	cmpq	$16, %rcx
	jb	.LBB1_15
# BB#7:                                 # %min.iters.checked
	xorl	%esi, %esi
	movq	%rcx, %rdx
	andq	$-16, %rdx
	je	.LBB1_15
# BB#8:                                 # %vector.body.preheader
	leaq	-16(%rdx), %r8
	movl	%r8d, %edi
	shrl	$4, %edi
	incl	%edi
	xorl	%esi, %esi
	andq	$7, %rdi
	je	.LBB1_11
# BB#9:                                 # %vector.body.prol.preheader
	negq	%rdi
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB1_10:                               # %vector.body.prol
                                        # =>This Inner Loop Header: Depth=1
	addq	$16, %rsi
	incq	%rdi
	jne	.LBB1_10
.LBB1_11:                               # %vector.body.preheader.split
	cmpq	$112, %r8
	jb	.LBB1_14
# BB#12:                                # %vector.body.preheader.split.split
	movq	%rdx, %rdi
	subq	%rsi, %rdi
	.p2align	4, 0x90
.LBB1_13:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	addq	$-128, %rdi
	jne	.LBB1_13
.LBB1_14:                               # %middle.block
	cmpq	%rdx, %rcx
	movq	%rdx, %rsi
	je	.LBB1_16
	.p2align	4, 0x90
.LBB1_15:                               # %for.inc39
                                        # =>This Inner Loop Header: Depth=1
	incq	%rsi
	cmpq	%rax, %rsi
	jl	.LBB1_15
.LBB1_16:                               # %for.end41
	movl	$16, %edi
	callq	malloc
	movq	%r15, (%rax)
	movl	-52(%rbp), %ecx         # 4-byte Reload
	movl	%ecx, 8(%rax)
	movq	-80(%rbp), %rcx         # 8-byte Reload
	movl	%ecx, 12(%rax)
	addq	$136, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end1:
	.size	matrix_multiply, .Lfunc_end1-matrix_multiply
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI2_0:
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
.Ltmp16:
	.cfi_def_cfa_offset 16
.Ltmp17:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp18:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
.Ltmp19:
	.cfi_offset %rbx, -56
.Ltmp20:
	.cfi_offset %r12, -48
.Ltmp21:
	.cfi_offset %r13, -40
.Ltmp22:
	.cfi_offset %r14, -32
.Ltmp23:
	.cfi_offset %r15, -24
	movl	$4294967295, %r13d      # imm = 0xFFFFFFFF
	callq	convertArgsToIntArray
	movq	(%rax), %rdi
	callq	parseStringToInt
	movq	%rax, %rbx
	imull	%eax, %eax
	shlq	$2, %rax
	movabsq	$17179869180, %rdi      # imm = 0x3FFFFFFFC
	andq	%rax, %rdi
	movq	%rdi, -48(%rbp)         # 8-byte Spill
	callq	malloc
	movq	%rax, %r12
	testl	%ebx, %ebx
	jle	.LBB2_9
# BB#1:                                 # %for.cond3.preheader.lr.ph.i
	movslq	%ebx, %r9
	leal	(%r9,%r13), %r11d
	incq	%r11
	movl	%r9d, %r8d
	andl	$7, %r8d
	movq	%r11, %r15
	subq	%r8, %r15
	leaq	16(%r12), %rdi
	leaq	(,%r9,4), %r10
	xorl	%eax, %eax
	movaps	.LCPI2_0(%rip), %xmm0   # xmm0 = [1,1,1,1]
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB2_2:                                # %for.body6.preheader.us.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_6 Depth 2
                                        #     Child Loop BB2_4 Depth 2
	cmpq	$7, %r11
	movl	$0, %esi
	jbe	.LBB2_3
# BB#5:                                 # %min.iters.checked
                                        #   in Loop: Header=BB2_2 Depth=1
	testq	%r15, %r15
	movl	$0, %esi
	movq	%rdi, %rcx
	movq	%r15, %r14
	je	.LBB2_3
	.p2align	4, 0x90
.LBB2_6:                                # %vector.body
                                        #   Parent Loop BB2_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movups	%xmm0, -16(%rcx)
	movups	%xmm0, (%rcx)
	addq	$32, %rcx
	addq	$-8, %r14
	jne	.LBB2_6
# BB#7:                                 # %middle.block
                                        #   in Loop: Header=BB2_2 Depth=1
	testq	%r8, %r8
	movq	%r15, %rsi
	je	.LBB2_8
.LBB2_3:                                # %for.body6.us.i.preheader
                                        #   in Loop: Header=BB2_2 Depth=1
	movl	%ebx, %ecx
	subl	%esi, %ecx
	addq	%rax, %rsi
	leaq	(%r12,%rsi,4), %rsi
	.p2align	4, 0x90
.LBB2_4:                                # %for.body6.us.i
                                        #   Parent Loop BB2_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$1, (%rsi)
	addq	$4, %rsi
	decl	%ecx
	jne	.LBB2_4
.LBB2_8:                                # %for.inc8.loopexit.us.i
                                        #   in Loop: Header=BB2_2 Depth=1
	incq	%rdx
	addq	%r10, %rdi
	addq	%r9, %rax
	cmpl	%ebx, %edx
	jne	.LBB2_2
.LBB2_9:                                # %init.exit
	movl	$16, %edi
	callq	malloc
	movq	%rax, -56(%rbp)         # 8-byte Spill
	movq	%r12, (%rax)
	movl	%ebx, 8(%rax)
	movl	%ebx, 12(%rax)
	movq	-48(%rbp), %rdi         # 8-byte Reload
	callq	malloc
	movq	%rax, %r15
	movq	%rbx, %r12
	shlq	$32, %r12
	testl	%ebx, %ebx
	jle	.LBB2_18
# BB#10:                                # %for.cond3.preheader.lr.ph.i7
	movq	%r12, %r9
	sarq	$32, %r9
	addl	%ebx, %r13d
	incq	%r13
	movl	%ebx, %r8d
	andl	$7, %r8d
	movq	%r13, %r14
	subq	%r8, %r14
	leaq	16(%r15), %rsi
	movq	%r12, %r10
	sarq	$30, %r10
	xorl	%ecx, %ecx
	movaps	.LCPI2_0(%rip), %xmm0   # xmm0 = [1,1,1,1]
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB2_11:                               # %for.body6.preheader.us.i15
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_15 Depth 2
                                        #     Child Loop BB2_13 Depth 2
	cmpq	$7, %r13
	movl	$0, %edx
	jbe	.LBB2_12
# BB#14:                                # %min.iters.checked42
                                        #   in Loop: Header=BB2_11 Depth=1
	testq	%r14, %r14
	movl	$0, %edx
	movq	%rsi, %rdi
	movq	%r14, %r11
	je	.LBB2_12
	.p2align	4, 0x90
.LBB2_15:                               # %vector.body38
                                        #   Parent Loop BB2_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movups	%xmm0, -16(%rdi)
	movups	%xmm0, (%rdi)
	addq	$32, %rdi
	addq	$-8, %r11
	jne	.LBB2_15
# BB#16:                                # %middle.block39
                                        #   in Loop: Header=BB2_11 Depth=1
	testq	%r8, %r8
	movq	%r14, %rdx
	je	.LBB2_17
.LBB2_12:                               # %for.body6.us.i13.preheader
                                        #   in Loop: Header=BB2_11 Depth=1
	movl	%ebx, %edi
	subl	%edx, %edi
	addq	%rcx, %rdx
	leaq	(%r15,%rdx,4), %rdx
	.p2align	4, 0x90
.LBB2_13:                               # %for.body6.us.i13
                                        #   Parent Loop BB2_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$1, (%rdx)
	addq	$4, %rdx
	decl	%edi
	jne	.LBB2_13
.LBB2_17:                               # %for.inc8.loopexit.us.i19
                                        #   in Loop: Header=BB2_11 Depth=1
	incq	%rax
	addq	%r10, %rsi
	addq	%r9, %rcx
	cmpl	%ebx, %eax
	jne	.LBB2_11
.LBB2_18:                               # %init.exit23
	movl	$16, %edi
	callq	malloc
	movq	%r15, (%rax)
	movl	%ebx, 8(%rax)
	movl	%ebx, 12(%rax)
	movq	-56(%rbp), %rdi         # 8-byte Reload
	movq	%rax, %rsi
	callq	matrix_multiply
	leal	-1(%rbx), %ecx
	imulq	%rbx, %r12
	movabsq	$-4294967296, %rdx      # imm = 0xFFFFFFFF00000000
	addq	%r12, %rdx
	movq	(%rax), %rax
	sarq	$30, %rdx
	movl	(%rax,%rdx), %r9d
	movl	$.L.str, %edi
	xorl	%eax, %eax
	movl	%ebx, %esi
	movl	%ebx, %edx
	movl	%ecx, %r8d
	callq	printf
	xorl	%eax, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc

	.p2align	4, 0x90
	.type	matrix_multiply_polly_subfn,@function
matrix_multiply_polly_subfn:            # @matrix_multiply_polly_subfn
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Ltmp24:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp25:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp26:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp27:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp28:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp29:
	.cfi_def_cfa_offset 56
	subq	$88, %rsp
.Ltmp30:
	.cfi_def_cfa_offset 144
.Ltmp31:
	.cfi_offset %rbx, -56
.Ltmp32:
	.cfi_offset %r12, -48
.Ltmp33:
	.cfi_offset %r13, -40
.Ltmp34:
	.cfi_offset %r14, -32
.Ltmp35:
	.cfi_offset %r15, -24
.Ltmp36:
	.cfi_offset %rbp, -16
	movslq	(%rdi), %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movslq	4(%rdi), %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movslq	12(%rdi), %rbx
	movq	16(%rdi), %rax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	leaq	56(%rsp), %rdi
	leaq	48(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB3_2
# BB#1:                                 # %polly.par.loadIVBounds.preheader
	movq	24(%rsp), %rax          # 8-byte Reload
	decq	%rax
	sarq	$5, %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	leaq	(,%rbx,4), %r13
	shlq	$7, %rbx
	movq	%rbx, 16(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB3_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_5 Depth 2
                                        #       Child Loop BB3_8 Depth 3
                                        #         Child Loop BB3_10 Depth 4
	movq	48(%rsp), %rax
	movq	56(%rsp), %rcx
	movq	%rcx, 8(%rsp)           # 8-byte Spill
	addq	$-2, %rax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	16(%rsp), %rax          # 8-byte Reload
	imulq	%rcx, %rax
	addq	64(%rsp), %rax          # 8-byte Folded Reload
	movq	%rax, (%rsp)            # 8-byte Spill
	.p2align	4, 0x90
.LBB3_5:                                # %polly.loop_header
                                        #   Parent Loop BB3_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_8 Depth 3
                                        #         Child Loop BB3_10 Depth 4
	cmpq	$0, 32(%rsp)            # 8-byte Folded Reload
	js	.LBB3_12
# BB#6:                                 # %polly.loop_header2.preheader
                                        #   in Loop: Header=BB3_5 Depth=2
	movq	8(%rsp), %rax           # 8-byte Reload
	shlq	$5, %rax
	movq	72(%rsp), %r14          # 8-byte Reload
	subq	%rax, %r14
	decq	%r14
	cmpq	$31, %r14
	movl	$31, %eax
	cmovgq	%rax, %r14
	testq	%r14, %r14
	js	.LBB3_12
# BB#7:                                 #   in Loop: Header=BB3_5 Depth=2
	decq	%r14
	movq	(%rsp), %rax            # 8-byte Reload
	movq	%rax, 40(%rsp)          # 8-byte Spill
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB3_8:                                # %polly.loop_header10.preheader.us
                                        #   Parent Loop BB3_4 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB3_10 Depth 4
	movq	%rbp, %rcx
	shlq	$5, %rcx
	movq	%rcx, %rdx
	movq	24(%rsp), %rsi          # 8-byte Reload
	subq	%rsi, %rdx
	cmpq	$-33, %rdx
	movq	$-32, %rax
	cmovleq	%rax, %rdx
	movq	$-2, %rax
	subq	%rdx, %rax
	cmpq	$-2, %rax
	movq	$-1, %r15
	cmovleq	%r15, %rax
	cmpq	%rsi, %rcx
	jge	.LBB3_11
# BB#9:                                 #   in Loop: Header=BB3_8 Depth=3
	leaq	8(,%rax,4), %r12
	movq	40(%rsp), %rbx          # 8-byte Reload
	.p2align	4, 0x90
.LBB3_10:                               # %polly.stmt.for.body11.preheader.us.us
                                        #   Parent Loop BB3_4 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        #       Parent Loop BB3_8 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movq	%r12, %rdx
	callq	memset
	incq	%r15
	addq	%r13, %rbx
	cmpq	%r14, %r15
	jle	.LBB3_10
.LBB3_11:                               # %polly.loop_exit12.loopexit.us
                                        #   in Loop: Header=BB3_8 Depth=3
	subq	$-128, 40(%rsp)         # 8-byte Folded Spill
	cmpq	32(%rsp), %rbp          # 8-byte Folded Reload
	leaq	1(%rbp), %rbp
	jne	.LBB3_8
.LBB3_12:                               # %polly.loop_exit4
                                        #   in Loop: Header=BB3_5 Depth=2
	movq	(%rsp), %rax            # 8-byte Reload
	addq	16(%rsp), %rax          # 8-byte Folded Reload
	movq	%rax, (%rsp)            # 8-byte Spill
	movq	8(%rsp), %rax           # 8-byte Reload
	cmpq	80(%rsp), %rax          # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	jle	.LBB3_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB3_4 Depth=1
	leaq	56(%rsp), %rdi
	leaq	48(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB3_4
.LBB3_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end3:
	.size	matrix_multiply_polly_subfn, .Lfunc_end3-matrix_multiply_polly_subfn
	.cfi_endproc

	.p2align	4, 0x90
	.type	matrix_multiply_polly_subfn_2,@function
matrix_multiply_polly_subfn_2:          # @matrix_multiply_polly_subfn_2
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Ltmp37:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp38:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp39:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp40:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp41:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp42:
	.cfi_def_cfa_offset 56
	subq	$280, %rsp              # imm = 0x118
.Ltmp43:
	.cfi_def_cfa_offset 336
.Ltmp44:
	.cfi_offset %rbx, -56
.Ltmp45:
	.cfi_offset %r12, -48
.Ltmp46:
	.cfi_offset %r13, -40
.Ltmp47:
	.cfi_offset %r14, -32
.Ltmp48:
	.cfi_offset %r15, -24
.Ltmp49:
	.cfi_offset %rbp, -16
	movslq	(%rdi), %rax
	movq	%rax, 152(%rsp)         # 8-byte Spill
	movslq	4(%rdi), %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movslq	8(%rdi), %rbx
	movslq	12(%rdi), %rbp
	movq	16(%rdi), %r14
	movq	%r14, 232(%rsp)         # 8-byte Spill
	movq	24(%rdi), %r15
	movq	32(%rdi), %r12
	leaq	144(%rsp), %rdi
	leaq	136(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB4_2
# BB#1:                                 # %polly.par.loadIVBounds.preheader
	movq	56(%rsp), %rax          # 8-byte Reload
	decq	%rax
	sarq	$5, %rax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	%rbx, 88(%rsp)          # 8-byte Spill
	leaq	-1(%rbx), %rax
	sarq	$5, %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	negq	%rbx
	movq	%rbx, 168(%rsp)         # 8-byte Spill
	leaq	(,%rbp,4), %r13
	movq	%rbp, %rax
	movq	%rbp, %rbx
	shlq	$5, %rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movl	$1, %eax
	movd	%rax, %xmm0
	pslldq	$8, %xmm0               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7]
	movdqa	%xmm0, 256(%rsp)        # 16-byte Spill
	.p2align	4, 0x90
.LBB4_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_5 Depth 2
                                        #       Child Loop BB4_7 Depth 3
                                        #         Child Loop BB4_9 Depth 4
                                        #           Child Loop BB4_12 Depth 5
                                        #             Child Loop BB4_14 Depth 6
                                        #               Child Loop BB4_22 Depth 7
                                        #               Child Loop BB4_17 Depth 7
	movq	136(%rsp), %rax
	movq	144(%rsp), %rcx
	movq	%rcx, 16(%rsp)          # 8-byte Spill
	addq	$-2, %rax
	movq	%rax, 160(%rsp)         # 8-byte Spill
	movq	48(%rsp), %rax          # 8-byte Reload
	imulq	%rcx, %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB4_5:                                # %polly.loop_header
                                        #   Parent Loop BB4_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_7 Depth 3
                                        #         Child Loop BB4_9 Depth 4
                                        #           Child Loop BB4_12 Depth 5
                                        #             Child Loop BB4_14 Depth 6
                                        #               Child Loop BB4_22 Depth 7
                                        #               Child Loop BB4_17 Depth 7
	cmpq	$0, 64(%rsp)            # 8-byte Folded Reload
	movdqa	256(%rsp), %xmm5        # 16-byte Reload
	js	.LBB4_19
# BB#6:                                 # %polly.loop_header4.preheader
                                        #   in Loop: Header=BB4_5 Depth=2
	movq	16(%rsp), %rax          # 8-byte Reload
	shlq	$5, %rax
	movq	%rax, 208(%rsp)         # 8-byte Spill
	movq	152(%rsp), %rcx         # 8-byte Reload
	subq	%rax, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovgq	%rax, %rcx
	movq	%rcx, 184(%rsp)         # 8-byte Spill
	leaq	-1(%rcx), %rax
	movq	%rax, 216(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB4_7:                                # %polly.loop_header4
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB4_9 Depth 4
                                        #           Child Loop BB4_12 Depth 5
                                        #             Child Loop BB4_14 Depth 6
                                        #               Child Loop BB4_22 Depth 7
                                        #               Child Loop BB4_17 Depth 7
	cmpq	$0, 72(%rsp)            # 8-byte Folded Reload
	js	.LBB4_18
# BB#8:                                 # %polly.loop_header13.preheader
                                        #   in Loop: Header=BB4_7 Depth=3
	movq	32(%rsp), %rcx          # 8-byte Reload
	shlq	$5, %rcx
	movq	%rcx, 248(%rsp)         # 8-byte Spill
	movq	56(%rsp), %rax          # 8-byte Reload
	subq	%rcx, %rax
	decq	%rax
	cmpq	$31, %rax
	movl	$31, %ecx
	cmovleq	%rax, %rcx
	movq	%rcx, 176(%rsp)         # 8-byte Spill
	leaq	-1(%rcx), %rax
	movq	%rax, 240(%rsp)         # 8-byte Spill
	movq	24(%rsp), %rax          # 8-byte Reload
	movq	%rax, 80(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movq	168(%rsp), %rcx         # 8-byte Reload
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB4_9:                                # %polly.loop_header13
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_7 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB4_12 Depth 5
                                        #             Child Loop BB4_14 Depth 6
                                        #               Child Loop BB4_22 Depth 7
                                        #               Child Loop BB4_17 Depth 7
	movq	%rdx, 192(%rsp)         # 8-byte Spill
	movq	%rcx, 200(%rsp)         # 8-byte Spill
	cmpq	$-33, %rcx
	movq	$-32, %rax
	cmovgq	%rcx, %rax
	movq	$-2, %r9
	subq	%rax, %r9
	cmpq	$-2, %r9
	movq	$-1, %rsi
	cmovleq	%rsi, %r9
	movq	%rdx, %rax
	shlq	$5, %rax
	movq	%rax, %rcx
	subq	88(%rsp), %rcx          # 8-byte Folded Reload
	cmpq	$-33, %rcx
	movq	$-32, %rdx
	cmovleq	%rdx, %rcx
	movq	$-2, %rdx
	subq	%rcx, %rdx
	cmpq	$-2, %rdx
	cmovleq	%rsi, %rdx
	cmpq	$0, 184(%rsp)           # 8-byte Folded Reload
	js	.LBB4_26
# BB#10:                                # %polly.loop_header22.preheader
                                        #   in Loop: Header=BB4_9 Depth=4
	movq	88(%rsp), %rcx          # 8-byte Reload
	subq	%rax, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %esi
	cmovleq	%rcx, %rsi
	movq	%rsi, 104(%rsp)         # 8-byte Spill
	cmpq	$0, 176(%rsp)           # 8-byte Folded Reload
	js	.LBB4_26
# BB#11:                                # %polly.loop_header31.preheader.us.preheader
                                        #   in Loop: Header=BB4_9 Depth=4
	addq	$2, %r9
	andq	$-4, %r9
	movq	%rdx, %rsi
	addq	$2, %rsi
	movq	%rsi, 128(%rsp)         # 8-byte Spill
	movq	104(%rsp), %rcx         # 8-byte Reload
	decq	%rcx
	cmpl	$1, %ebx
	sete	%dil
	andq	$-4, %rsi
	movq	%rsi, 224(%rsp)         # 8-byte Spill
	setne	%dl
	andb	%dil, %dl
	movb	%dl, 15(%rsp)           # 1-byte Spill
	movd	%rax, %xmm0
	pshufd	$68, %xmm0, %xmm0       # xmm0 = xmm0[0,1,0,1]
	movq	80(%rsp), %rax          # 8-byte Reload
	movq	%rax, 120(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB4_12:                               # %polly.loop_header31.preheader.us
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_7 Depth=3
                                        #         Parent Loop BB4_9 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB4_14 Depth 6
                                        #               Child Loop BB4_22 Depth 7
                                        #               Child Loop BB4_17 Depth 7
	cmpq	$0, 104(%rsp)           # 8-byte Folded Reload
	js	.LBB4_25
# BB#13:                                #   in Loop: Header=BB4_12 Depth=5
	movq	208(%rsp), %rax         # 8-byte Reload
	movq	40(%rsp), %rdx          # 8-byte Reload
	leaq	(%rdx,%rax), %rsi
	imulq	%rbx, %rsi
	movq	96(%rsp), %rbp          # 8-byte Reload
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB4_14:                               # %polly.loop_header40.preheader.us.us
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_7 Depth=3
                                        #         Parent Loop BB4_9 Depth=4
                                        #           Parent Loop BB4_12 Depth=5
                                        # =>          This Loop Header: Depth=6
                                        #               Child Loop BB4_22 Depth 7
                                        #               Child Loop BB4_17 Depth 7
	movq	248(%rsp), %rax         # 8-byte Reload
	leaq	(%r8,%rax), %rdx
	leaq	(%rdx,%rsi), %r10
	movl	(%r14,%r10,4), %r11d
	cmpq	$3, 128(%rsp)           # 8-byte Folded Reload
	jbe	.LBB4_15
# BB#20:                                # %min.iters.checked
                                        #   in Loop: Header=BB4_14 Depth=6
	cmpb	$0, 15(%rsp)            # 1-byte Folded Reload
	je	.LBB4_15
# BB#21:                                # %vector.ph
                                        #   in Loop: Header=BB4_14 Depth=6
	movq	%rbx, %r14
	movd	%r11d, %xmm1
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB4_22:                               # %vector.body
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_7 Depth=3
                                        #         Parent Loop BB4_9 Depth=4
                                        #           Parent Loop BB4_12 Depth=5
                                        #             Parent Loop BB4_14 Depth=6
                                        # =>            This Inner Loop Header: Depth=7
	movd	%rax, %xmm2
	pshufd	$68, %xmm2, %xmm2       # xmm2 = xmm2[0,1,0,1]
	paddq	%xmm0, %xmm2
	paddq	%xmm5, %xmm2
	movd	%xmm2, %rdi
	leaq	(%rdi,%rsi), %rbx
	movdqu	(%r15,%rbx,4), %xmm2
	addq	%rdx, %rdi
	movdqu	(%r12,%rdi,4), %xmm3
	pshufd	$245, %xmm3, %xmm4      # xmm4 = xmm3[1,1,3,3]
	pmuludq	%xmm2, %xmm3
	pshufd	$232, %xmm3, %xmm3      # xmm3 = xmm3[0,2,2,3]
	pshufd	$245, %xmm2, %xmm2      # xmm2 = xmm2[1,1,3,3]
	pmuludq	%xmm4, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	punpckldq	%xmm2, %xmm3    # xmm3 = xmm3[0],xmm2[0],xmm3[1],xmm2[1]
	paddd	%xmm3, %xmm1
	addq	$4, %rax
	cmpq	%rax, %r9
	jne	.LBB4_22
# BB#23:                                # %middle.block
                                        #   in Loop: Header=BB4_14 Depth=6
	pshufd	$78, %xmm1, %xmm2       # xmm2 = xmm1[2,3,0,1]
	paddd	%xmm1, %xmm2
	pshufd	$229, %xmm2, %xmm1      # xmm1 = xmm2[1,1,2,3]
	paddd	%xmm2, %xmm1
	movd	%xmm1, %r11d
	movq	224(%rsp), %rax         # 8-byte Reload
	cmpq	%rax, 128(%rsp)         # 8-byte Folded Reload
	movq	%rax, %rdx
	movq	%r14, %rbx
	jne	.LBB4_16
	jmp	.LBB4_24
	.p2align	4, 0x90
.LBB4_15:                               #   in Loop: Header=BB4_14 Depth=6
	xorl	%edx, %edx
.LBB4_16:                               # %polly.loop_header40.us.us.preheader
                                        #   in Loop: Header=BB4_14 Depth=6
	movq	112(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rdx), %rax
	imulq	%rbx, %rax
	addq	%rbp, %rax
	leaq	(%r12,%rax,4), %rax
	movq	120(%rsp), %rdi         # 8-byte Reload
	leaq	(%rdi,%rdx), %rdi
	decq	%rdx
	leaq	(%r15,%rdi,4), %r14
	.p2align	4, 0x90
.LBB4_17:                               # %polly.loop_header40.us.us
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_7 Depth=3
                                        #         Parent Loop BB4_9 Depth=4
                                        #           Parent Loop BB4_12 Depth=5
                                        #             Parent Loop BB4_14 Depth=6
                                        # =>            This Inner Loop Header: Depth=7
	movl	(%rax), %edi
	imull	(%r14), %edi
	addl	%edi, %r11d
	incq	%rdx
	addq	%r13, %rax
	addq	$4, %r14
	cmpq	%rcx, %rdx
	jle	.LBB4_17
.LBB4_24:                               # %polly.loop_exit42.loopexit.us.us
                                        #   in Loop: Header=BB4_14 Depth=6
	movq	232(%rsp), %r14         # 8-byte Reload
	movl	%r11d, (%r14,%r10,4)
	incq	%rbp
	cmpq	240(%rsp), %r8          # 8-byte Folded Reload
	leaq	1(%r8), %r8
	jle	.LBB4_14
.LBB4_25:                               # %polly.loop_exit33.loopexit.us
                                        #   in Loop: Header=BB4_12 Depth=5
	addq	%rbx, 120(%rsp)         # 8-byte Folded Spill
	movq	40(%rsp), %rax          # 8-byte Reload
	cmpq	216(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	jle	.LBB4_12
.LBB4_26:                               # %polly.loop_exit24
                                        #   in Loop: Header=BB4_9 Depth=4
	movq	200(%rsp), %rcx         # 8-byte Reload
	addq	$32, %rcx
	addq	$32, 112(%rsp)          # 8-byte Folded Spill
	addq	$32, 80(%rsp)           # 8-byte Folded Spill
	movq	192(%rsp), %rdx         # 8-byte Reload
	cmpq	72(%rsp), %rdx          # 8-byte Folded Reload
	leaq	1(%rdx), %rdx
	jne	.LBB4_9
.LBB4_18:                               # %polly.loop_exit15
                                        #   in Loop: Header=BB4_7 Depth=3
	addq	$32, 96(%rsp)           # 8-byte Folded Spill
	movq	32(%rsp), %rax          # 8-byte Reload
	cmpq	64(%rsp), %rax          # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	jne	.LBB4_7
.LBB4_19:                               # %polly.loop_exit6
                                        #   in Loop: Header=BB4_5 Depth=2
	movq	24(%rsp), %rax          # 8-byte Reload
	addq	48(%rsp), %rax          # 8-byte Folded Reload
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	16(%rsp), %rax          # 8-byte Reload
	cmpq	160(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	jle	.LBB4_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB4_4 Depth=1
	leaq	144(%rsp), %rdi
	leaq	136(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB4_4
.LBB4_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$280, %rsp              # imm = 0x118
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end4:
	.size	matrix_multiply_polly_subfn_2, .Lfunc_end4-matrix_multiply_polly_subfn_2
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Pass %d X %d matrix test case (C[%d][%d]=%d)\n"
	.size	.L.str, 46


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
