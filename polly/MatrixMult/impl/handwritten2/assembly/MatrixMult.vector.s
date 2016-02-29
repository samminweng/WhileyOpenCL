	.text
	.file	"MatrixMult.vector.ll"
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
	subq	$488, %rsp              # imm = 0x1E8
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
	movq	%rdi, %r12
	movq	(%r12), %r14
	movq	(%rsi), %r15
	movl	8(%rsi), %ecx
	movl	%ecx, -324(%rbp)        # 4-byte Spill
	movl	%ecx, %r13d
	movslq	12(%r12), %rbx
	movq	%rbx, -248(%rbp)        # 8-byte Spill
	movl	%ebx, %eax
	imull	%ecx, %eax
	movslq	%eax, %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, %rdx
	movq	%rdx, -184(%rbp)        # 8-byte Spill
	testq	%rbx, %rbx
	jle	.LBB1_17
# BB#1:                                 # %for.cond7.preheader.lr.ph
	movl	-324(%rbp), %r11d       # 4-byte Reload
	movslq	%r11d, %rsi
	xorl	%ecx, %ecx
	testl	%esi, %esi
	movq	-248(%rbp), %r9         # 8-byte Reload
	jle	.LBB1_2
# BB#29:                                # %polly.preload.exec
	movq	8(%r12), %rcx
	movq	%rcx, %r9
	shrq	$32, %r9
.LBB1_2:                                # %polly.preload.merge
	movq	%rcx, -256(%rbp)        # 8-byte Spill
	movslq	%ecx, %rax
	movq	%rax, -200(%rbp)        # 8-byte Spill
	movq	%rax, %rcx
	movq	%rsi, %rdi
	imulq	%rdi, %rcx
	movq	%r15, -112(%rbp)        # 8-byte Spill
	leaq	(%r15,%rcx,4), %rcx
	cmpq	%rdx, %rcx
	setbe	%r8b
	movq	-248(%rbp), %rcx        # 8-byte Reload
	leaq	-1(%rcx), %rsi
	movq	%rsi, -336(%rbp)        # 8-byte Spill
	imulq	%rdi, %rsi
	movq	%rdx, %rbx
	movq	%rcx, %rdx
	imulq	%rdi, %rdx
	movq	%rdi, %r10
	leaq	(%rbx,%rdx,4), %rdi
	cmpq	%r15, %rdi
	setbe	%dl
	addq	%rax, %rsi
	movq	%r14, -96(%rbp)         # 8-byte Spill
	leaq	(%r14,%rsi,4), %rsi
	cmpq	%rbx, %rsi
	movq	%rbx, %rsi
	setbe	%bl
	cmpq	%r14, %rdi
	setbe	%cl
	orb	%bl, %cl
	movzbl	%cl, %ecx
	cmpl	$1, %ecx
	jne	.LBB1_5
# BB#3:                                 # %polly.preload.merge
	movq	-256(%rbp), %rcx        # 8-byte Reload
	cmpl	%ecx, %r11d
	jl	.LBB1_5
# BB#4:                                 # %polly.preload.merge
	orb	%r8b, %dl
	je	.LBB1_5
# BB#38:                                # %polly.start
	sarq	$5, -336(%rbp)          # 8-byte Folded Spill
	movq	%rsi, %rdx
	js	.LBB1_17
# BB#39:                                # %polly.loop_preheader
	movq	-200(%rbp), %rax        # 8-byte Reload
	decq	%rax
	movq	%rax, -344(%rbp)        # 8-byte Spill
	movq	%r10, -48(%rbp)         # 8-byte Spill
	leaq	-1(%r10), %rbx
	sarq	$5, %rbx
	movq	%rbx, -192(%rbp)        # 8-byte Spill
	movq	%r10, %rax
	shrq	$2, %rax
	movq	%rax, -64(%rbp)         # 8-byte Spill
	decq	%rax
	movq	%rax, -72(%rbp)         # 8-byte Spill
	movl	%r13d, %ecx
	movq	%r13, -88(%rbp)         # 8-byte Spill
	andl	$3, %ecx
	movq	%rcx, -152(%rbp)        # 8-byte Spill
	leaq	(,%r10,4), %rax
	movq	%rax, -168(%rbp)        # 8-byte Spill
	shlq	$7, %r10
	movq	%r10, -352(%rbp)        # 8-byte Spill
	leaq	(,%rcx,4), %rcx
	movq	%rcx, -56(%rbp)         # 8-byte Spill
	subq	%rcx, %rax
	addq	%rdx, %rax
	movq	%rax, -128(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -104(%rbp)        # 8-byte Spill
	movq	%rdx, -176(%rbp)        # 8-byte Spill
	.p2align	4, 0x90
.LBB1_30:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_32 Depth 2
                                        #       Child Loop BB1_44 Depth 3
                                        #       Child Loop BB1_35 Depth 3
	testq	%rbx, %rbx
	js	.LBB1_42
# BB#31:                                # %polly.loop_header28.preheader
                                        #   in Loop: Header=BB1_30 Depth=1
	movq	-104(%rbp), %rax        # 8-byte Reload
	shlq	$5, %rax
	movq	-248(%rbp), %rcx        # 8-byte Reload
	subq	%rax, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovgq	%rax, %rcx
	movq	%rcx, -240(%rbp)        # 8-byte Spill
	leaq	-1(%rcx), %rax
	movq	%rax, -80(%rbp)         # 8-byte Spill
	movq	-176(%rbp), %rax        # 8-byte Reload
	movq	%rax, -136(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_32:                               # %polly.loop_header28
                                        #   Parent Loop BB1_30 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_44 Depth 3
                                        #       Child Loop BB1_35 Depth 3
	movq	%rax, -144(%rbp)        # 8-byte Spill
	leaq	(,%rax,8), %rcx
	movq	%rcx, %r13
	subq	-64(%rbp), %r13         # 8-byte Folded Reload
	cmpq	$-9, %r13
	movq	$-8, %rax
	cmovleq	%rax, %r13
	cmpq	$0, -240(%rbp)          # 8-byte Folded Reload
	js	.LBB1_41
# BB#33:                                # %polly.loop_header37.preheader
                                        #   in Loop: Header=BB1_32 Depth=2
	movq	-144(%rbp), %rax        # 8-byte Reload
	shlq	$5, %rax
	orq	$31, %rax
	movq	-72(%rbp), %rdx         # 8-byte Reload
	cmpq	%rcx, %rdx
	js	.LBB1_40
# BB#34:                                # %polly.loop_preheader55.preheader.us.preheader
                                        #   in Loop: Header=BB1_32 Depth=2
	shlq	$4, %r13
	negq	%r13
	cmpq	-48(%rbp), %rax         # 8-byte Folded Reload
	setl	%al
	cmpq	$0, -152(%rbp)          # 8-byte Folded Reload
	sete	%r15b
	orb	%al, %r15b
	movq	$-1, %rbx
	movq	-128(%rbp), %r12        # 8-byte Reload
	movq	-136(%rbp), %r14        # 8-byte Reload
	.p2align	4, 0x90
.LBB1_35:                               # %polly.loop_preheader55.preheader.us
                                        #   Parent Loop BB1_30 Depth=1
                                        #     Parent Loop BB1_32 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	xorl	%esi, %esi
	movq	%r14, %rdi
	movq	%r13, %rdx
	callq	memset
	testb	%r15b, %r15b
	jne	.LBB1_37
# BB#36:                                # %polly.stmt.for.body1171.preheader.us
                                        #   in Loop: Header=BB1_35 Depth=3
	xorl	%esi, %esi
	movq	%r12, %rdi
	movq	-56(%rbp), %rdx         # 8-byte Reload
	callq	memset
.LBB1_37:                               # %polly.merge.us
                                        #   in Loop: Header=BB1_35 Depth=3
	movq	-168(%rbp), %rax        # 8-byte Reload
	addq	%rax, %r14
	addq	%rax, %r12
	incq	%rbx
	cmpq	-80(%rbp), %rbx         # 8-byte Folded Reload
	jle	.LBB1_35
	jmp	.LBB1_41
	.p2align	4, 0x90
.LBB1_40:                               # %polly.loop_header37.preheader.split
                                        #   in Loop: Header=BB1_32 Depth=2
	movq	$-1, %rbx
	cmpq	-48(%rbp), %rax         # 8-byte Folded Reload
	movq	-128(%rbp), %r14        # 8-byte Reload
	jl	.LBB1_41
	.p2align	4, 0x90
.LBB1_44:                               # %polly.then
                                        #   Parent Loop BB1_30 Depth=1
                                        #     Parent Loop BB1_32 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpq	$0, -152(%rbp)          # 8-byte Folded Reload
	je	.LBB1_43
# BB#45:                                # %polly.stmt.for.body1171.preheader
                                        #   in Loop: Header=BB1_44 Depth=3
	xorl	%esi, %esi
	movq	%r14, %rdi
	movq	-56(%rbp), %rdx         # 8-byte Reload
	callq	memset
.LBB1_43:                               # %polly.merge
                                        #   in Loop: Header=BB1_44 Depth=3
	addq	-168(%rbp), %r14        # 8-byte Folded Reload
	incq	%rbx
	cmpq	-80(%rbp), %rbx         # 8-byte Folded Reload
	jle	.LBB1_44
	.p2align	4, 0x90
.LBB1_41:                               # %polly.loop_exit39
                                        #   in Loop: Header=BB1_32 Depth=2
	subq	$-128, -136(%rbp)       # 8-byte Folded Spill
	movq	-192(%rbp), %rbx        # 8-byte Reload
	movq	-144(%rbp), %rax        # 8-byte Reload
	cmpq	%rbx, %rax
	leaq	1(%rax), %rax
	jne	.LBB1_32
.LBB1_42:                               # %polly.loop_exit30
                                        #   in Loop: Header=BB1_30 Depth=1
	movq	-352(%rbp), %rax        # 8-byte Reload
	addq	%rax, -128(%rbp)        # 8-byte Folded Spill
	addq	%rax, -176(%rbp)        # 8-byte Folded Spill
	movq	-104(%rbp), %rax        # 8-byte Reload
	cmpq	-336(%rbp), %rax        # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, -104(%rbp)        # 8-byte Spill
	jne	.LBB1_30
# BB#18:                                # %polly.cond75
	movq	-248(%rbp), %rax        # 8-byte Reload
	testl	%eax, %eax
	setle	%cl
	jle	.LBB1_46
# BB#19:
	xorl	%eax, %eax
	movq	-184(%rbp), %rdx        # 8-byte Reload
	jmp	.LBB1_20
.LBB1_5:                                # %for.cond7.preheader.preheader
	testl	%r11d, %r11d
	movq	%rsi, %rdx
	jle	.LBB1_17
# BB#6:                                 # %for.body11.preheader.us.preheader
	movslq	%r9d, %rax
	movq	%rax, -144(%rbp)        # 8-byte Spill
	movq	%r10, -48(%rbp)         # 8-byte Spill
	leaq	(,%r10,4), %rax
	movq	%rax, -136(%rbp)        # 8-byte Spill
	testq	%r10, %r10
	movl	$1, %eax
	cmovgq	%r10, %rax
	shlq	$2, %rax
	movq	%rax, -240(%rbp)        # 8-byte Spill
	movslq	8(%r12), %r12
	movl	%r12d, %eax
	andl	$1, %eax
	movq	%rax, -80(%rbp)         # 8-byte Spill
	leaq	(%r10,%r10), %r15
	xorl	%eax, %eax
	movq	%rax, -56(%rbp)         # 8-byte Spill
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_7:                                # %for.body11.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_9 Depth 2
                                        #       Child Loop BB1_13 Depth 3
	testl	%r12d, %r12d
	jle	.LBB1_15
# BB#8:                                 # %for.body11.us.us.preheader
                                        #   in Loop: Header=BB1_7 Depth=1
	movq	%rcx, -152(%rbp)        # 8-byte Spill
	movq	%rcx, %r8
	imulq	-48(%rbp), %r8          # 8-byte Folded Reload
	movq	-112(%rbp), %r9         # 8-byte Reload
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB1_9:                                # %for.body11.us.us
                                        #   Parent Loop BB1_7 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_13 Depth 3
	leaq	(%r10,%r8), %rsi
	xorl	%edi, %edi
	cmpq	$0, -80(%rbp)           # 8-byte Folded Reload
	movl	$0, (%rdx,%rsi,4)
	movl	$0, %eax
	je	.LBB1_11
# BB#10:                                # %for.body17.us.us.prol
                                        #   in Loop: Header=BB1_9 Depth=2
	movq	-112(%rbp), %rax        # 8-byte Reload
	movl	(%rax,%r10,4), %edi
	movq	-96(%rbp), %rax         # 8-byte Reload
	imull	(%rax,%r8,4), %edi
	movl	%edi, (%rdx,%rsi,4)
	movl	$1, %eax
.LBB1_11:                               # %for.body11.us.us.split
                                        #   in Loop: Header=BB1_9 Depth=2
	cmpl	$1, %r12d
	movq	%rdx, %r13
	je	.LBB1_14
# BB#12:                                # %for.body11.us.us.split.split
                                        #   in Loop: Header=BB1_9 Depth=2
	leaq	1(%rax), %rcx
	movq	-48(%rbp), %rbx         # 8-byte Reload
	imulq	%rbx, %rcx
	leaq	(%r9,%rcx,4), %r11
	movq	-56(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	movq	-96(%rbp), %rdx         # 8-byte Reload
	leaq	(%rdx,%rcx,4), %rdx
	movq	%rbx, %rcx
	imulq	%rax, %rcx
	leaq	(%r9,%rcx,4), %rbx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_13:                               # %for.body17.us.us
                                        #   Parent Loop BB1_7 Depth=1
                                        #     Parent Loop BB1_9 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	(%rbx,%rcx,4), %r14d
	imull	(%rdx), %r14d
	addl	%edi, %r14d
	movl	%r14d, (%r13,%rsi,4)
	movl	(%r11,%rcx,4), %edi
	imull	4(%rdx), %edi
	addl	%r14d, %edi
	movl	%edi, (%r13,%rsi,4)
	addq	$2, %rax
	addq	%r15, %rcx
	addq	$8, %rdx
	cmpq	%r12, %rax
	jl	.LBB1_13
.LBB1_14:                               # %for.inc36.loopexit.us.us
                                        #   in Loop: Header=BB1_9 Depth=2
	incq	%r10
	addq	$4, %r9
	cmpq	-48(%rbp), %r10         # 8-byte Folded Reload
	movq	%r13, %rdx
	jl	.LBB1_9
	jmp	.LBB1_16
	.p2align	4, 0x90
.LBB1_15:                               # %for.body11.us462.preheader
                                        #   in Loop: Header=BB1_7 Depth=1
	movq	-136(%rbp), %rdi        # 8-byte Reload
	imulq	%rcx, %rdi
	movq	%rcx, -152(%rbp)        # 8-byte Spill
	addq	%rdx, %rdi
	xorl	%esi, %esi
	movq	%rdx, %rbx
	movq	-240(%rbp), %rdx        # 8-byte Reload
	callq	memset
	movq	%rbx, %rdx
.LBB1_16:                               # %for.inc39.loopexit.us
                                        #   in Loop: Header=BB1_7 Depth=1
	movq	-152(%rbp), %rcx        # 8-byte Reload
	incq	%rcx
	movq	-56(%rbp), %rax         # 8-byte Reload
	addq	-48(%rbp), %rax         # 8-byte Folded Reload
	movq	%rax, -56(%rbp)         # 8-byte Spill
	cmpq	-144(%rbp), %rcx        # 8-byte Folded Reload
	jl	.LBB1_7
	jmp	.LBB1_17
.LBB1_46:                               # %polly.then77
	movb	$1, %al
	testq	%rbx, %rbx
	movq	-184(%rbp), %rdx        # 8-byte Reload
	js	.LBB1_20
# BB#47:                                # %polly.loop_header81.preheader
	movb	%cl, -56(%rbp)          # 1-byte Spill
	movq	-88(%rbp), %rcx         # 8-byte Reload
	andq	$3, %rcx
	je	.LBB1_48
# BB#59:                                # %polly.loop_header81.preheader486
	shlq	$2, %rcx
	movq	%rcx, -88(%rbp)         # 8-byte Spill
	movq	-168(%rbp), %rax        # 8-byte Reload
	subq	%rcx, %rax
	movq	%rdx, %rcx
	addq	%rax, %rcx
	movq	%rcx, -80(%rbp)         # 8-byte Spill
	movq	%rbx, -192(%rbp)        # 8-byte Spill
	leaq	1(%rbx), %r15
	negq	-64(%rbp)               # 8-byte Folded Spill
	movl	$31, %ebx
	movq	%rdx, %r12
	movq	-72(%rbp), %r14         # 8-byte Reload
	.p2align	4, 0x90
.LBB1_60:                               # %polly.loop_header81
                                        # =>This Inner Loop Header: Depth=1
	testq	%r14, %r14
	js	.LBB1_62
# BB#61:                                # %polly.loop_preheader100.preheader
                                        #   in Loop: Header=BB1_60 Depth=1
	movq	-64(%rbp), %rax         # 8-byte Reload
	cmpq	$-9, %rax
	movq	%rdx, %r13
	movq	$-8, %rdx
	cmovgq	%rax, %rdx
	shlq	$4, %rdx
	negq	%rdx
	xorl	%esi, %esi
	movq	%r12, %rdi
	callq	memset
	movq	%r13, %rdx
.LBB1_62:                               # %polly.cond110
                                        #   in Loop: Header=BB1_60 Depth=1
	cmpq	-48(%rbp), %rbx         # 8-byte Folded Reload
	jl	.LBB1_64
# BB#63:                                # %polly.stmt.for.body11125.preheader
                                        #   in Loop: Header=BB1_60 Depth=1
	xorl	%esi, %esi
	movq	-80(%rbp), %rdi         # 8-byte Reload
	movq	%rdx, %r13
	movq	-88(%rbp), %rdx         # 8-byte Reload
	callq	memset
	movq	%r13, %rdx
.LBB1_64:                               # %polly.merge111
                                        #   in Loop: Header=BB1_60 Depth=1
	addq	$32, %rbx
	subq	$-128, %r12
	addq	$-8, %r14
	addq	$8, -64(%rbp)           # 8-byte Folded Spill
	decq	%r15
	jne	.LBB1_60
	jmp	.LBB1_65
.LBB1_48:                               # %polly.loop_header81.us.preheader
	movq	%rdx, %r14
	xorl	%eax, %eax
	testb	$1, %bl
	jne	.LBB1_51
# BB#49:                                # %polly.loop_header81.us.prol
	movl	$1, %eax
	cmpq	$0, -64(%rbp)           # 8-byte Folded Reload
	je	.LBB1_51
# BB#50:                                # %polly.loop_preheader100.preheader.us.prol
	movq	-64(%rbp), %rax         # 8-byte Reload
	negq	%rax
	cmpq	$-9, %rax
	movq	$-8, %rdx
	cmovgq	%rax, %rdx
	shlq	$4, %rdx
	negq	%rdx
	xorl	%esi, %esi
	movq	%r14, %rdi
	callq	memset
	movl	$1, %eax
.LBB1_51:                               # %polly.loop_header81.us.preheader.split
	testq	%rbx, %rbx
	je	.LBB1_52
# BB#53:                                # %polly.loop_header81.us.preheader.split.split
	movq	%rax, %rcx
	shlq	$7, %rcx
	movq	%r14, %rdx
	leaq	128(%rcx,%rdx), %r14
	movq	%rbx, -192(%rbp)        # 8-byte Spill
	leaq	1(%rbx), %r15
	subq	%rax, %r15
	movq	-64(%rbp), %rsi         # 8-byte Reload
	leaq	-9(%rsi), %r12
	leaq	(,%rax,8), %rcx
	subq	%rcx, %r12
	leaq	8(,%rax,8), %rbx
	subq	%rsi, %rbx
	.p2align	4, 0x90
.LBB1_54:                               # %polly.loop_header81.us
                                        # =>This Inner Loop Header: Depth=1
	movq	%r12, %rax
	addq	$8, %rax
	js	.LBB1_55
# BB#58:                                # %polly.loop_preheader100.preheader.us
                                        #   in Loop: Header=BB1_54 Depth=1
	movq	%rdx, %r13
	leaq	-8(%rbx), %rdx
	cmpq	$-9, %rdx
	movq	$-8, %rax
	cmovleq	%rax, %rdx
	shlq	$4, %rdx
	negq	%rdx
	leaq	-128(%r14), %rdi
	xorl	%esi, %esi
	callq	memset
	movq	%r13, %rdx
.LBB1_55:                               # %polly.cond110.us
                                        #   in Loop: Header=BB1_54 Depth=1
	testq	%r12, %r12
	js	.LBB1_57
# BB#56:                                # %polly.loop_preheader100.preheader.us.1
                                        #   in Loop: Header=BB1_54 Depth=1
	cmpq	$-9, %rbx
	movq	%rdx, %r13
	movq	$-8, %rdx
	cmovgq	%rbx, %rdx
	shlq	$4, %rdx
	negq	%rdx
	xorl	%esi, %esi
	movq	%r14, %rdi
	callq	memset
	movq	%r13, %rdx
.LBB1_57:                               # %polly.cond110.us.1
                                        #   in Loop: Header=BB1_54 Depth=1
	addq	$256, %r14              # imm = 0x100
	addq	$-16, %r12
	addq	$16, %rbx
	addq	$-2, %r15
	jne	.LBB1_54
.LBB1_65:
	movb	-56(%rbp), %al          # 1-byte Reload
	movq	-192(%rbp), %rbx        # 8-byte Reload
.LBB1_20:                               # %polly.merge76
	movl	%eax, -428(%rbp)        # 4-byte Spill
	cmpq	$0, -336(%rbp)          # 8-byte Folded Reload
	js	.LBB1_21
# BB#66:                                # %polly.loop_preheader133
	movq	-344(%rbp), %rax        # 8-byte Reload
	sarq	$5, %rax
	movq	%rax, -464(%rbp)        # 8-byte Spill
	movq	-200(%rbp), %rcx        # 8-byte Reload
	movq	%rcx, %rax
	shrq	$2, %rax
	decq	%rax
	movq	%rax, -512(%rbp)        # 8-byte Spill
	movq	-256(%rbp), %rax        # 8-byte Reload
	movl	%eax, %edi
	andl	$3, %edi
	movq	%rdi, -88(%rbp)         # 8-byte Spill
	movq	%rcx, %r8
	subq	%rdi, %r8
	movq	%r8, -208(%rbp)         # 8-byte Spill
	leaq	-1(%rdi), %rsi
	movq	%rsi, -320(%rbp)        # 8-byte Spill
	andl	$1, %eax
	movq	%rax, -232(%rbp)        # 8-byte Spill
	movq	%r8, %rax
	movq	-48(%rbp), %rsi         # 8-byte Reload
	imulq	%rsi, %rax
	movq	%rax, -304(%rbp)        # 8-byte Spill
	leaq	1(%rcx), %rax
	subq	%rdi, %rax
	movq	%rax, -312(%rbp)        # 8-byte Spill
	leaq	(%rsi,%rsi), %rax
	movq	%rax, -224(%rbp)        # 8-byte Spill
	movq	%rsi, %rax
	shlq	$5, %rax
	movq	%rax, -504(%rbp)        # 8-byte Spill
	leaq	(%rsi,%rsi,2), %rax
	movq	-112(%rbp), %rcx        # 8-byte Reload
	leaq	(%rcx,%rax,4), %rax
	movq	%rax, -496(%rbp)        # 8-byte Spill
	movq	%rsi, %r12
	shlq	$4, %r12
	movq	-96(%rbp), %rax         # 8-byte Reload
	leaq	12(%rax), %rax
	movq	%rax, -384(%rbp)        # 8-byte Spill
	leaq	(%rcx,%rsi,8), %rax
	movq	%rax, -488(%rbp)        # 8-byte Spill
	leaq	(%rcx,%rsi,4), %rax
	movq	%rax, -480(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -376(%rbp)        # 8-byte Spill
	movq	%r8, -400(%rbp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB1_67:                               # %polly.loop_header132
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_69 Depth 2
                                        #       Child Loop BB1_71 Depth 3
                                        #         Child Loop BB1_73 Depth 4
                                        #           Child Loop BB1_95 Depth 5
                                        #             Child Loop BB1_101 Depth 6
                                        #           Child Loop BB1_79 Depth 5
                                        #             Child Loop BB1_80 Depth 6
                                        #             Child Loop BB1_87 Depth 6
	testq	%rbx, %rbx
	js	.LBB1_77
# BB#68:                                # %polly.loop_header142.preheader
                                        #   in Loop: Header=BB1_67 Depth=1
	movq	-376(%rbp), %rax        # 8-byte Reload
	shlq	$5, %rax
	movq	%rax, -416(%rbp)        # 8-byte Spill
	movq	-248(%rbp), %rcx        # 8-byte Reload
	subq	%rax, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovgq	%rax, %rcx
	movq	%rcx, -520(%rbp)        # 8-byte Spill
	leaq	-1(%rcx), %rax
	movq	%rax, -424(%rbp)        # 8-byte Spill
	movq	-480(%rbp), %rax        # 8-byte Reload
	movq	%rax, -456(%rbp)        # 8-byte Spill
	movq	-488(%rbp), %rax        # 8-byte Reload
	movq	%rax, -448(%rbp)        # 8-byte Spill
	movq	-496(%rbp), %rax        # 8-byte Reload
	movq	%rax, -440(%rbp)        # 8-byte Spill
	movq	-112(%rbp), %rax        # 8-byte Reload
	movq	%rax, -160(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -392(%rbp)        # 8-byte Spill
	.p2align	4, 0x90
.LBB1_69:                               # %polly.loop_header142
                                        #   Parent Loop BB1_67 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_71 Depth 3
                                        #         Child Loop BB1_73 Depth 4
                                        #           Child Loop BB1_95 Depth 5
                                        #             Child Loop BB1_101 Depth 6
                                        #           Child Loop BB1_79 Depth 5
                                        #             Child Loop BB1_80 Depth 6
                                        #             Child Loop BB1_87 Depth 6
	cmpq	$0, -464(%rbp)          # 8-byte Folded Reload
	js	.LBB1_76
# BB#70:                                # %polly.loop_header152.preheader
                                        #   in Loop: Header=BB1_69 Depth=2
	movq	-392(%rbp), %rcx        # 8-byte Reload
	shlq	$5, %rcx
	movq	%rcx, -128(%rbp)        # 8-byte Spill
	movq	-48(%rbp), %rax         # 8-byte Reload
	subq	%rcx, %rax
	decq	%rax
	cmpq	$31, %rax
	movl	$31, %ecx
	cmovleq	%rax, %rcx
	movq	%rcx, -368(%rbp)        # 8-byte Spill
	leaq	-1(%rcx), %rax
	movq	%rax, -136(%rbp)        # 8-byte Spill
	movq	-160(%rbp), %rax        # 8-byte Reload
	movq	%rax, -296(%rbp)        # 8-byte Spill
	movq	-456(%rbp), %rax        # 8-byte Reload
	movq	%rax, -288(%rbp)        # 8-byte Spill
	movq	-448(%rbp), %rax        # 8-byte Reload
	movq	%rax, -280(%rbp)        # 8-byte Spill
	movq	-384(%rbp), %rax        # 8-byte Reload
	movq	%rax, -472(%rbp)        # 8-byte Spill
	movq	-440(%rbp), %rax        # 8-byte Reload
	movq	%rax, -360(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -408(%rbp)        # 8-byte Spill
	.p2align	4, 0x90
.LBB1_71:                               # %polly.loop_header152
                                        #   Parent Loop BB1_67 Depth=1
                                        #     Parent Loop BB1_69 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_73 Depth 4
                                        #           Child Loop BB1_95 Depth 5
                                        #             Child Loop BB1_101 Depth 6
                                        #           Child Loop BB1_79 Depth 5
                                        #             Child Loop BB1_80 Depth 6
                                        #             Child Loop BB1_87 Depth 6
	cmpq	$0, -520(%rbp)          # 8-byte Folded Reload
	js	.LBB1_92
# BB#72:                                # %polly.loop_header161.preheader
                                        #   in Loop: Header=BB1_71 Depth=3
	cmpq	$0, -88(%rbp)           # 8-byte Folded Reload
	sete	%al
	movq	-408(%rbp), %rsi        # 8-byte Reload
	leaq	(,%rsi,8), %rcx
	movq	-512(%rbp), %rdi        # 8-byte Reload
	subq	%rcx, %rdi
	cmpq	$7, %rdi
	movl	$7, %ecx
	cmovgq	%rcx, %rdi
	movq	%rdi, -264(%rbp)        # 8-byte Spill
	shlq	$5, %rsi
	leaq	-1(%rdi), %r9
	orq	$31, %rsi
	movq	%rsi, -528(%rbp)        # 8-byte Spill
	cmpq	-200(%rbp), %rsi        # 8-byte Folded Reload
	setl	%cl
	orb	%al, %cl
	movb	%cl, -104(%rbp)         # 1-byte Spill
	movq	-472(%rbp), %rax        # 8-byte Reload
	movq	%rax, -72(%rbp)         # 8-byte Spill
	movq	-400(%rbp), %rax        # 8-byte Reload
	movq	%rax, -216(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -272(%rbp)        # 8-byte Spill
	.p2align	4, 0x90
.LBB1_73:                               # %polly.loop_header161
                                        #   Parent Loop BB1_67 Depth=1
                                        #     Parent Loop BB1_69 Depth=2
                                        #       Parent Loop BB1_71 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB1_95 Depth 5
                                        #             Child Loop BB1_101 Depth 6
                                        #           Child Loop BB1_79 Depth 5
                                        #             Child Loop BB1_80 Depth 6
                                        #             Child Loop BB1_87 Depth 6
	cmpq	$0, -368(%rbp)          # 8-byte Folded Reload
	js	.LBB1_91
# BB#74:                                # %polly.loop_header170.preheader
                                        #   in Loop: Header=BB1_73 Depth=4
	movq	-416(%rbp), %rax        # 8-byte Reload
	movq	-272(%rbp), %rcx        # 8-byte Reload
	leaq	(%rcx,%rax), %rax
	movq	%rax, %rcx
	imulq	-168(%rbp), %rcx        # 8-byte Folded Reload
	movq	%rcx, -64(%rbp)         # 8-byte Spill
	imulq	-48(%rbp), %rax         # 8-byte Folded Reload
	cmpq	$0, -264(%rbp)          # 8-byte Folded Reload
	js	.LBB1_89
# BB#75:                                # %polly.loop_preheader189.preheader.us.preheader
                                        #   in Loop: Header=BB1_73 Depth=4
	addq	-208(%rbp), %rax        # 8-byte Folded Reload
	movq	%rax, -120(%rbp)        # 8-byte Spill
	movq	-160(%rbp), %rax        # 8-byte Reload
	movq	%rax, -144(%rbp)        # 8-byte Spill
	movq	-296(%rbp), %r13        # 8-byte Reload
	movq	-288(%rbp), %r14        # 8-byte Reload
	movq	-280(%rbp), %rbx        # 8-byte Reload
	movq	-360(%rbp), %r15        # 8-byte Reload
	xorl	%r11d, %r11d
	.p2align	4, 0x90
.LBB1_79:                               # %polly.loop_preheader189.preheader.us
                                        #   Parent Loop BB1_67 Depth=1
                                        #     Parent Loop BB1_69 Depth=2
                                        #       Parent Loop BB1_71 Depth=3
                                        #         Parent Loop BB1_73 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB1_80 Depth 6
                                        #             Child Loop BB1_87 Depth 6
	movq	%rbx, -152(%rbp)        # 8-byte Spill
	movq	%r14, -56(%rbp)         # 8-byte Spill
	movq	-128(%rbp), %rax        # 8-byte Reload
	leaq	(%r11,%rax), %rsi
	movq	%rsi, -240(%rbp)        # 8-byte Spill
	movq	-64(%rbp), %rax         # 8-byte Reload
	leaq	(%rax,%rsi,4), %rax
	movq	%rax, -80(%rbp)         # 8-byte Spill
	movl	(%rdx,%rax), %r8d
	movq	$-1, %rdi
	movq	%r13, %rsi
	movq	-72(%rbp), %r10         # 8-byte Reload
	movq	%r15, %rax
	.p2align	4, 0x90
.LBB1_80:                               # %polly.loop_preheader189.us
                                        #   Parent Loop BB1_67 Depth=1
                                        #     Parent Loop BB1_69 Depth=2
                                        #       Parent Loop BB1_71 Depth=3
                                        #         Parent Loop BB1_73 Depth=4
                                        #           Parent Loop BB1_79 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movl	(%rsi), %ecx
	imull	-12(%r10), %ecx
	addl	%r8d, %ecx
	movl	(%r14), %edx
	imull	-8(%r10), %edx
	addl	%ecx, %edx
	movl	(%rbx), %ecx
	imull	-4(%r10), %ecx
	addl	%edx, %ecx
	movl	(%rax), %r8d
	imull	(%r10), %r8d
	addl	%ecx, %r8d
	incq	%rdi
	addq	%r12, %rax
	addq	$16, %r10
	addq	%r12, %rbx
	addq	%r12, %r14
	addq	%r12, %rsi
	cmpq	%r9, %rdi
	jle	.LBB1_80
# BB#81:                                # %polly.cond202.loopexit.us
                                        #   in Loop: Header=BB1_79 Depth=5
	movq	-184(%rbp), %rdx        # 8-byte Reload
	movq	-80(%rbp), %rax         # 8-byte Reload
	movl	%r8d, (%rdx,%rax)
	cmpb	$0, -104(%rbp)          # 1-byte Folded Reload
	jne	.LBB1_78
# BB#82:                                # %polly.loop_header208.us.preheader
                                        #   in Loop: Header=BB1_79 Depth=5
	cmpq	$0, -232(%rbp)          # 8-byte Folded Reload
	jne	.LBB1_84
# BB#83:                                #   in Loop: Header=BB1_79 Depth=5
	movq	%r13, -176(%rbp)        # 8-byte Spill
                                        # implicit-def: %EAX
	xorl	%ecx, %ecx
	jmp	.LBB1_85
	.p2align	4, 0x90
.LBB1_84:                               # %polly.loop_header208.us.prol
                                        #   in Loop: Header=BB1_79 Depth=5
	movq	%r13, -176(%rbp)        # 8-byte Spill
	movq	-240(%rbp), %rcx        # 8-byte Reload
	addq	-304(%rbp), %rcx        # 8-byte Folded Reload
	movq	-112(%rbp), %rax        # 8-byte Reload
	movl	(%rax,%rcx,4), %eax
	movq	-96(%rbp), %rcx         # 8-byte Reload
	movq	-120(%rbp), %rdx        # 8-byte Reload
	imull	(%rcx,%rdx,4), %eax
	addl	%r8d, %eax
	movl	%eax, %r8d
	movl	$1, %ecx
.LBB1_85:                               # %polly.loop_header208.us.preheader.split
                                        #   in Loop: Header=BB1_79 Depth=5
	cmpq	$0, -320(%rbp)          # 8-byte Folded Reload
	movq	-224(%rbp), %r14        # 8-byte Reload
	je	.LBB1_88
# BB#86:                                # %polly.loop_header208.us.preheader.split.split
                                        #   in Loop: Header=BB1_79 Depth=5
	movq	-88(%rbp), %rsi         # 8-byte Reload
	subq	%rcx, %rsi
	movq	-312(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	movq	-48(%rbp), %rdi         # 8-byte Reload
	imulq	%rdi, %rax
	movq	-144(%rbp), %r13        # 8-byte Reload
	leaq	(%r13,%rax,4), %r10
	movq	-216(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	movq	-96(%rbp), %rdx         # 8-byte Reload
	leaq	(%rdx,%rax,4), %rbx
	addq	-208(%rbp), %rcx        # 8-byte Folded Reload
	imulq	%rdi, %rcx
	leaq	(%r13,%rcx,4), %rcx
	xorl	%edx, %edx
	movl	%r8d, %eax
	.p2align	4, 0x90
.LBB1_87:                               # %polly.loop_header208.us
                                        #   Parent Loop BB1_67 Depth=1
                                        #     Parent Loop BB1_69 Depth=2
                                        #       Parent Loop BB1_71 Depth=3
                                        #         Parent Loop BB1_73 Depth=4
                                        #           Parent Loop BB1_79 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movl	(%rcx,%rdx,4), %edi
	imull	(%rbx), %edi
	addl	%eax, %edi
	movl	(%r10,%rdx,4), %eax
	imull	4(%rbx), %eax
	addl	%edi, %eax
	addq	%r14, %rdx
	addq	$8, %rbx
	addq	$-2, %rsi
	jne	.LBB1_87
.LBB1_88:                               # %polly.merge203.loopexit.us
                                        #   in Loop: Header=BB1_79 Depth=5
	movq	-184(%rbp), %rdx        # 8-byte Reload
	movq	-80(%rbp), %rcx         # 8-byte Reload
	movl	%eax, (%rdx,%rcx)
	movq	-176(%rbp), %r13        # 8-byte Reload
.LBB1_78:                               # %polly.merge203.us
                                        #   in Loop: Header=BB1_79 Depth=5
	addq	$4, %r15
	movq	-152(%rbp), %rbx        # 8-byte Reload
	addq	$4, %rbx
	movq	-56(%rbp), %r14         # 8-byte Reload
	addq	$4, %r14
	addq	$4, %r13
	addq	$4, -144(%rbp)          # 8-byte Folded Spill
	cmpq	-136(%rbp), %r11        # 8-byte Folded Reload
	leaq	1(%r11), %r11
	jle	.LBB1_79
	jmp	.LBB1_91
	.p2align	4, 0x90
.LBB1_89:                               # %polly.loop_header170.preheader.split
                                        #   in Loop: Header=BB1_73 Depth=4
	movq	%rax, -120(%rbp)        # 8-byte Spill
	movq	-528(%rbp), %rax        # 8-byte Reload
	cmpq	-200(%rbp), %rax        # 8-byte Folded Reload
	jl	.LBB1_91
# BB#90:                                # %polly.then204.preheader
                                        #   in Loop: Header=BB1_73 Depth=4
	movq	-120(%rbp), %rax        # 8-byte Reload
	addq	-208(%rbp), %rax        # 8-byte Folded Reload
	movq	%rax, -120(%rbp)        # 8-byte Spill
	movq	-160(%rbp), %r11        # 8-byte Reload
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB1_95:                               # %polly.then204
                                        #   Parent Loop BB1_67 Depth=1
                                        #     Parent Loop BB1_69 Depth=2
                                        #       Parent Loop BB1_71 Depth=3
                                        #         Parent Loop BB1_73 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB1_101 Depth 6
	cmpq	$0, -88(%rbp)           # 8-byte Folded Reload
	je	.LBB1_94
# BB#96:                                # %polly.loop_header208.preheader
                                        #   in Loop: Header=BB1_95 Depth=5
	movq	-128(%rbp), %rax        # 8-byte Reload
	leaq	(%r14,%rax), %rax
	cmpq	$0, -232(%rbp)          # 8-byte Folded Reload
	movq	-64(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,4), %r8
	movl	(%rdx,%r8), %r10d
	jne	.LBB1_98
# BB#97:                                #   in Loop: Header=BB1_95 Depth=5
                                        # implicit-def: %ECX
	xorl	%eax, %eax
	jmp	.LBB1_99
	.p2align	4, 0x90
.LBB1_98:                               # %polly.loop_header208.prol
                                        #   in Loop: Header=BB1_95 Depth=5
	addq	-304(%rbp), %rax        # 8-byte Folded Reload
	movq	-112(%rbp), %rcx        # 8-byte Reload
	movl	(%rcx,%rax,4), %ecx
	movq	-96(%rbp), %rax         # 8-byte Reload
	movq	-120(%rbp), %rdx        # 8-byte Reload
	imull	(%rax,%rdx,4), %ecx
	addl	%r10d, %ecx
	movl	%ecx, %r10d
	movl	$1, %eax
.LBB1_99:                               # %polly.loop_header208.preheader.split
                                        #   in Loop: Header=BB1_95 Depth=5
	cmpq	$0, -320(%rbp)          # 8-byte Folded Reload
	movq	-224(%rbp), %r13        # 8-byte Reload
	je	.LBB1_93
# BB#100:                               # %polly.loop_header208.preheader.split.split
                                        #   in Loop: Header=BB1_95 Depth=5
	movq	-88(%rbp), %rdi         # 8-byte Reload
	subq	%rax, %rdi
	movq	-312(%rbp), %rcx        # 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	movq	-48(%rbp), %rsi         # 8-byte Reload
	imulq	%rsi, %rcx
	leaq	(%r11,%rcx,4), %r15
	movq	-216(%rbp), %rcx        # 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	movq	-96(%rbp), %rdx         # 8-byte Reload
	leaq	(%rdx,%rcx,4), %rbx
	addq	-208(%rbp), %rax        # 8-byte Folded Reload
	imulq	%rsi, %rax
	leaq	(%r11,%rax,4), %rax
	xorl	%edx, %edx
	movl	%r10d, %ecx
	.p2align	4, 0x90
.LBB1_101:                              # %polly.loop_header208
                                        #   Parent Loop BB1_67 Depth=1
                                        #     Parent Loop BB1_69 Depth=2
                                        #       Parent Loop BB1_71 Depth=3
                                        #         Parent Loop BB1_73 Depth=4
                                        #           Parent Loop BB1_95 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movl	(%rax,%rdx,4), %esi
	imull	(%rbx), %esi
	addl	%ecx, %esi
	movl	(%r15,%rdx,4), %ecx
	imull	4(%rbx), %ecx
	addl	%esi, %ecx
	addq	%r13, %rdx
	addq	$8, %rbx
	addq	$-2, %rdi
	jne	.LBB1_101
.LBB1_93:                               # %polly.merge203.loopexit
                                        #   in Loop: Header=BB1_95 Depth=5
	movq	-184(%rbp), %rdx        # 8-byte Reload
	movl	%ecx, (%rdx,%r8)
.LBB1_94:                               # %polly.merge203
                                        #   in Loop: Header=BB1_95 Depth=5
	addq	$4, %r11
	cmpq	-136(%rbp), %r14        # 8-byte Folded Reload
	leaq	1(%r14), %r14
	jle	.LBB1_95
	.p2align	4, 0x90
.LBB1_91:                               # %polly.loop_exit172
                                        #   in Loop: Header=BB1_73 Depth=4
	movq	-216(%rbp), %rax        # 8-byte Reload
	addq	-48(%rbp), %rax         # 8-byte Folded Reload
	movq	%rax, -216(%rbp)        # 8-byte Spill
	movq	-72(%rbp), %rax         # 8-byte Reload
	addq	-168(%rbp), %rax        # 8-byte Folded Reload
	movq	%rax, -72(%rbp)         # 8-byte Spill
	movq	-272(%rbp), %rax        # 8-byte Reload
	cmpq	-424(%rbp), %rax        # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, -272(%rbp)        # 8-byte Spill
	jle	.LBB1_73
.LBB1_92:                               # %polly.loop_exit163
                                        #   in Loop: Header=BB1_71 Depth=3
	movq	-352(%rbp), %rax        # 8-byte Reload
	addq	%rax, -360(%rbp)        # 8-byte Folded Spill
	subq	$-128, -472(%rbp)       # 8-byte Folded Spill
	addq	%rax, -280(%rbp)        # 8-byte Folded Spill
	addq	%rax, -288(%rbp)        # 8-byte Folded Spill
	addq	%rax, -296(%rbp)        # 8-byte Folded Spill
	movq	-408(%rbp), %rax        # 8-byte Reload
	cmpq	-464(%rbp), %rax        # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, -408(%rbp)        # 8-byte Spill
	jne	.LBB1_71
.LBB1_76:                               # %polly.loop_exit154
                                        #   in Loop: Header=BB1_69 Depth=2
	subq	$-128, -160(%rbp)       # 8-byte Folded Spill
	subq	$-128, -440(%rbp)       # 8-byte Folded Spill
	subq	$-128, -448(%rbp)       # 8-byte Folded Spill
	subq	$-128, -456(%rbp)       # 8-byte Folded Spill
	movq	-192(%rbp), %rbx        # 8-byte Reload
	movq	-392(%rbp), %rax        # 8-byte Reload
	cmpq	%rbx, %rax
	leaq	1(%rax), %rax
	movq	%rax, -392(%rbp)        # 8-byte Spill
	jne	.LBB1_69
.LBB1_77:                               # %polly.loop_exit144
                                        #   in Loop: Header=BB1_67 Depth=1
	movq	-400(%rbp), %rax        # 8-byte Reload
	addq	-504(%rbp), %rax        # 8-byte Folded Reload
	movq	%rax, -400(%rbp)        # 8-byte Spill
	movq	-384(%rbp), %rax        # 8-byte Reload
	addq	-352(%rbp), %rax        # 8-byte Folded Reload
	movq	%rax, -384(%rbp)        # 8-byte Spill
	movq	-376(%rbp), %rax        # 8-byte Reload
	cmpq	-336(%rbp), %rax        # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, -376(%rbp)        # 8-byte Spill
	jne	.LBB1_67
.LBB1_21:                               # %polly.cond231
	movl	-428(%rbp), %eax        # 4-byte Reload
	testb	%al, %al
	je	.LBB1_17
# BB#22:                                # %polly.then233
	testq	%rbx, %rbx
	js	.LBB1_17
# BB#23:                                # %polly.loop_header237.preheader
	sarq	$5, -344(%rbp)          # 8-byte Folded Spill
	movq	-200(%rbp), %rcx        # 8-byte Reload
	movq	%rcx, %rax
	shrq	$2, %rax
	decq	%rax
	movq	%rax, -416(%rbp)        # 8-byte Spill
	movq	-256(%rbp), %rdi        # 8-byte Reload
	movl	%edi, %esi
	andl	$3, %esi
	movq	%rsi, -232(%rbp)        # 8-byte Spill
	movq	%rcx, %rax
	subq	%rsi, %rax
	movq	%rax, -224(%rbp)        # 8-byte Spill
	leaq	-1(%rsi), %rbx
	movq	%rbx, -216(%rbp)        # 8-byte Spill
	andl	$1, %edi
	movq	%rdi, -256(%rbp)        # 8-byte Spill
	movq	%rax, %rdi
	movq	-48(%rbp), %rbx         # 8-byte Reload
	imulq	%rbx, %rdi
	movq	%rdi, -312(%rbp)        # 8-byte Spill
	incq	%rcx
	subq	%rsi, %rcx
	movq	%rcx, -208(%rbp)        # 8-byte Spill
	leaq	(%rbx,%rbx), %rcx
	movq	%rcx, -72(%rbp)         # 8-byte Spill
	movq	-96(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,4), %rax
	movq	%rax, -104(%rbp)        # 8-byte Spill
	leaq	(%rbx,%rbx,2), %rax
	movq	%rdx, %r8
	movq	%r8, -184(%rbp)         # 8-byte Spill
	movq	-112(%rbp), %rdx        # 8-byte Reload
	leaq	(%rdx,%rax,4), %rax
	movq	%rax, -296(%rbp)        # 8-byte Spill
	movq	%rbx, %rsi
	shlq	$4, %rsi
	leaq	12(%rcx), %rax
	movq	%rax, -360(%rbp)        # 8-byte Spill
	leaq	(%rdx,%rbx,8), %rax
	movq	%rax, -288(%rbp)        # 8-byte Spill
	leaq	(%rdx,%rbx,4), %rax
	movq	%rax, -280(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -160(%rbp)        # 8-byte Spill
	movq	%rdx, -264(%rbp)        # 8-byte Spill
	movq	%r8, %rdx
	.p2align	4, 0x90
.LBB1_24:                               # %polly.loop_header237
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_26 Depth 2
                                        #       Child Loop BB1_118 Depth 3
                                        #         Child Loop BB1_124 Depth 4
                                        #       Child Loop BB1_103 Depth 3
                                        #         Child Loop BB1_104 Depth 4
                                        #         Child Loop BB1_111 Depth 4
	cmpq	$0, -344(%rbp)          # 8-byte Folded Reload
	js	.LBB1_115
# BB#25:                                # %polly.loop_header247.preheader
                                        #   in Loop: Header=BB1_24 Depth=1
	movq	-160(%rbp), %rax        # 8-byte Reload
	shlq	$5, %rax
	movq	%rax, -128(%rbp)        # 8-byte Spill
	movq	-48(%rbp), %rcx         # 8-byte Reload
	subq	%rax, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovgq	%rax, %rcx
	movq	%rcx, -424(%rbp)        # 8-byte Spill
	leaq	-1(%rcx), %rax
	movq	%rax, -64(%rbp)         # 8-byte Spill
	movq	-264(%rbp), %rax        # 8-byte Reload
	movq	%rax, -304(%rbp)        # 8-byte Spill
	movq	-280(%rbp), %rax        # 8-byte Reload
	movq	%rax, -272(%rbp)        # 8-byte Spill
	movq	-288(%rbp), %rax        # 8-byte Reload
	movq	%rax, -168(%rbp)        # 8-byte Spill
	movq	-360(%rbp), %rax        # 8-byte Reload
	movq	%rax, -176(%rbp)        # 8-byte Spill
	movq	-296(%rbp), %rax        # 8-byte Reload
	movq	%rax, -368(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -120(%rbp)        # 8-byte Spill
	.p2align	4, 0x90
.LBB1_26:                               # %polly.loop_header247
                                        #   Parent Loop BB1_24 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_118 Depth 3
                                        #         Child Loop BB1_124 Depth 4
                                        #       Child Loop BB1_103 Depth 3
                                        #         Child Loop BB1_104 Depth 4
                                        #         Child Loop BB1_111 Depth 4
	cmpq	$0, -424(%rbp)          # 8-byte Folded Reload
	js	.LBB1_114
# BB#27:                                # %polly.loop_header256.preheader
                                        #   in Loop: Header=BB1_26 Depth=2
	movq	-120(%rbp), %rcx        # 8-byte Reload
	leaq	(,%rcx,8), %rax
	movq	-416(%rbp), %r11        # 8-byte Reload
	subq	%rax, %r11
	cmpq	$7, %r11
	movl	$7, %eax
	cmovgq	%rax, %r11
	movq	%rcx, %rax
	shlq	$5, %rax
	orq	$31, %rax
	testq	%r11, %r11
	js	.LBB1_113
# BB#28:                                # %polly.loop_preheader275.preheader.us.preheader
                                        #   in Loop: Header=BB1_26 Depth=2
	decq	%r11
	cmpq	-200(%rbp), %rax        # 8-byte Folded Reload
	setl	%al
	cmpq	$0, -232(%rbp)          # 8-byte Folded Reload
	sete	%cl
	orb	%al, %cl
	movb	%cl, -88(%rbp)          # 1-byte Spill
	movq	-264(%rbp), %r13        # 8-byte Reload
	movq	-304(%rbp), %r10        # 8-byte Reload
	movq	-272(%rbp), %r14        # 8-byte Reload
	movq	-168(%rbp), %r15        # 8-byte Reload
	movq	-368(%rbp), %r12        # 8-byte Reload
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB1_103:                              # %polly.loop_preheader275.preheader.us
                                        #   Parent Loop BB1_24 Depth=1
                                        #     Parent Loop BB1_26 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_104 Depth 4
                                        #         Child Loop BB1_111 Depth 4
	movq	%rbx, -136(%rbp)        # 8-byte Spill
	movq	%r15, -144(%rbp)        # 8-byte Spill
	movq	%r13, -152(%rbp)        # 8-byte Spill
	movq	%r14, -56(%rbp)         # 8-byte Spill
	movq	%r10, -80(%rbp)         # 8-byte Spill
	movq	-128(%rbp), %rax        # 8-byte Reload
	leaq	(%rbx,%rax), %rax
	movq	%rax, -240(%rbp)        # 8-byte Spill
	movl	(%rdx,%rax,4), %r9d
	movq	$-1, %rbx
	movq	-176(%rbp), %r8         # 8-byte Reload
	movq	%r12, %r13
	.p2align	4, 0x90
.LBB1_104:                              # %polly.loop_preheader275.us
                                        #   Parent Loop BB1_24 Depth=1
                                        #     Parent Loop BB1_26 Depth=2
                                        #       Parent Loop BB1_103 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	(%r10), %eax
	imull	-12(%r8), %eax
	addl	%r9d, %eax
	movl	(%r14), %ecx
	imull	-8(%r8), %ecx
	addl	%eax, %ecx
	movl	(%r15), %eax
	imull	-4(%r8), %eax
	addl	%ecx, %eax
	movl	(%r13), %r9d
	imull	(%r8), %r9d
	addl	%eax, %r9d
	incq	%rbx
	addq	%rsi, %r13
	addq	$16, %r8
	addq	%rsi, %r15
	addq	%rsi, %r14
	addq	%rsi, %r10
	cmpq	%r11, %rbx
	jle	.LBB1_104
# BB#105:                               # %polly.cond297.loopexit.us
                                        #   in Loop: Header=BB1_103 Depth=3
	movq	-240(%rbp), %r10        # 8-byte Reload
	movl	%r9d, (%rdx,%r10,4)
	cmpb	$0, -88(%rbp)           # 1-byte Folded Reload
	movq	-152(%rbp), %r13        # 8-byte Reload
	jne	.LBB1_102
# BB#106:                               # %polly.loop_header303.us.preheader
                                        #   in Loop: Header=BB1_103 Depth=3
	cmpq	$0, -256(%rbp)          # 8-byte Folded Reload
	jne	.LBB1_108
# BB#107:                               #   in Loop: Header=BB1_103 Depth=3
	movq	%r12, -320(%rbp)        # 8-byte Spill
                                        # implicit-def: %EBX
	xorl	%ecx, %ecx
	jmp	.LBB1_109
	.p2align	4, 0x90
.LBB1_108:                              # %polly.loop_header303.us.prol
                                        #   in Loop: Header=BB1_103 Depth=3
	movq	%r12, -320(%rbp)        # 8-byte Spill
	movq	-312(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%r10), %rax
	movq	-112(%rbp), %rcx        # 8-byte Reload
	movl	(%rcx,%rax,4), %ebx
	movq	-96(%rbp), %rax         # 8-byte Reload
	movq	-224(%rbp), %rcx        # 8-byte Reload
	imull	(%rax,%rcx,4), %ebx
	addl	%r9d, %ebx
	movl	%ebx, %r9d
	movl	$1, %ecx
.LBB1_109:                              # %polly.loop_header303.us.preheader.split
                                        #   in Loop: Header=BB1_103 Depth=3
	movq	-232(%rbp), %r14        # 8-byte Reload
	movq	-72(%rbp), %r15         # 8-byte Reload
	movq	-104(%rbp), %rdx        # 8-byte Reload
	cmpq	$0, -216(%rbp)          # 8-byte Folded Reload
	je	.LBB1_112
# BB#110:                               # %polly.loop_header303.us.preheader.split.split
                                        #   in Loop: Header=BB1_103 Depth=3
	movq	-208(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	movq	-48(%rbp), %rdi         # 8-byte Reload
	imulq	%rdi, %rax
	leaq	(%r13,%rax,4), %r8
	movq	-224(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	imulq	%rdi, %rax
	leaq	(%r13,%rax,4), %r12
	xorl	%eax, %eax
	movl	%r9d, %ebx
	.p2align	4, 0x90
.LBB1_111:                              # %polly.loop_header303.us
                                        #   Parent Loop BB1_24 Depth=1
                                        #     Parent Loop BB1_26 Depth=2
                                        #       Parent Loop BB1_103 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	(%r12,%rax,4), %edi
	imull	(%rdx,%rcx,4), %edi
	addl	%ebx, %edi
	movl	(%r8,%rax,4), %ebx
	imull	4(%rdx,%rcx,4), %ebx
	addl	%edi, %ebx
	addq	$2, %rcx
	addq	%r15, %rax
	cmpq	%rcx, %r14
	jne	.LBB1_111
.LBB1_112:                              # %polly.merge298.loopexit.us
                                        #   in Loop: Header=BB1_103 Depth=3
	movq	%rdx, -104(%rbp)        # 8-byte Spill
	movq	%r15, -72(%rbp)         # 8-byte Spill
	movq	-184(%rbp), %rdx        # 8-byte Reload
	movl	%ebx, (%rdx,%r10,4)
	movq	-320(%rbp), %r12        # 8-byte Reload
.LBB1_102:                              # %polly.merge298.us
                                        #   in Loop: Header=BB1_103 Depth=3
	addq	$4, %r12
	movq	-144(%rbp), %r15        # 8-byte Reload
	addq	$4, %r15
	movq	-56(%rbp), %r14         # 8-byte Reload
	addq	$4, %r14
	movq	-80(%rbp), %r10         # 8-byte Reload
	addq	$4, %r10
	addq	$4, %r13
	movq	-136(%rbp), %rbx        # 8-byte Reload
	cmpq	-64(%rbp), %rbx         # 8-byte Folded Reload
	leaq	1(%rbx), %rbx
	jle	.LBB1_103
	jmp	.LBB1_114
	.p2align	4, 0x90
.LBB1_113:                              # %polly.loop_header256.preheader.split
                                        #   in Loop: Header=BB1_26 Depth=2
	cmpq	-200(%rbp), %rax        # 8-byte Folded Reload
	movq	-264(%rbp), %r10        # 8-byte Reload
	movl	$0, %r11d
	jl	.LBB1_114
	.p2align	4, 0x90
.LBB1_118:                              # %polly.then299
                                        #   Parent Loop BB1_24 Depth=1
                                        #     Parent Loop BB1_26 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_124 Depth 4
	movq	-232(%rbp), %r13        # 8-byte Reload
	testq	%r13, %r13
	je	.LBB1_117
# BB#119:                               # %polly.loop_header303.preheader
                                        #   in Loop: Header=BB1_118 Depth=3
	movq	-128(%rbp), %rax        # 8-byte Reload
	leaq	(%r11,%rax), %r8
	movq	-256(%rbp), %rax        # 8-byte Reload
	testq	%rax, %rax
	movl	(%rdx,%r8,4), %r9d
	movq	-104(%rbp), %rbx        # 8-byte Reload
	jne	.LBB1_121
# BB#120:                               #   in Loop: Header=BB1_118 Depth=3
                                        # implicit-def: %ECX
	xorl	%edi, %edi
	jmp	.LBB1_122
	.p2align	4, 0x90
.LBB1_121:                              # %polly.loop_header303.prol
                                        #   in Loop: Header=BB1_118 Depth=3
	movq	-312(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%r8), %rax
	movq	-112(%rbp), %rcx        # 8-byte Reload
	movl	(%rcx,%rax,4), %ecx
	movq	-96(%rbp), %rax         # 8-byte Reload
	movq	-224(%rbp), %rdx        # 8-byte Reload
	imull	(%rax,%rdx,4), %ecx
	addl	%r9d, %ecx
	movl	%ecx, %r9d
	movl	$1, %edi
.LBB1_122:                              # %polly.loop_header303.preheader.split
                                        #   in Loop: Header=BB1_118 Depth=3
	cmpq	$0, -216(%rbp)          # 8-byte Folded Reload
	movq	-72(%rbp), %r15         # 8-byte Reload
	je	.LBB1_116
# BB#123:                               # %polly.loop_header303.preheader.split.split
                                        #   in Loop: Header=BB1_118 Depth=3
	movq	-208(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%rdi), %rax
	movq	-48(%rbp), %rcx         # 8-byte Reload
	imulq	%rcx, %rax
	leaq	(%r10,%rax,4), %r14
	movq	-224(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%rdi), %rax
	imulq	%rcx, %rax
	leaq	(%r10,%rax,4), %r12
	xorl	%eax, %eax
	movl	%r9d, %ecx
	.p2align	4, 0x90
.LBB1_124:                              # %polly.loop_header303
                                        #   Parent Loop BB1_24 Depth=1
                                        #     Parent Loop BB1_26 Depth=2
                                        #       Parent Loop BB1_118 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	(%r12,%rax,4), %edx
	imull	(%rbx,%rdi,4), %edx
	addl	%ecx, %edx
	movl	(%r14,%rax,4), %ecx
	imull	4(%rbx,%rdi,4), %ecx
	addl	%edx, %ecx
	addq	$2, %rdi
	addq	%r15, %rax
	cmpq	%rdi, %r13
	jne	.LBB1_124
.LBB1_116:                              # %polly.merge298.loopexit
                                        #   in Loop: Header=BB1_118 Depth=3
	movq	-184(%rbp), %rdx        # 8-byte Reload
	movl	%ecx, (%rdx,%r8,4)
.LBB1_117:                              # %polly.merge298
                                        #   in Loop: Header=BB1_118 Depth=3
	addq	$4, %r10
	cmpq	-64(%rbp), %r11         # 8-byte Folded Reload
	leaq	1(%r11), %r11
	jle	.LBB1_118
	.p2align	4, 0x90
.LBB1_114:                              # %polly.loop_exit258
                                        #   in Loop: Header=BB1_26 Depth=2
	movq	-352(%rbp), %rax        # 8-byte Reload
	addq	%rax, -368(%rbp)        # 8-byte Folded Spill
	subq	$-128, -176(%rbp)       # 8-byte Folded Spill
	addq	%rax, -168(%rbp)        # 8-byte Folded Spill
	addq	%rax, -272(%rbp)        # 8-byte Folded Spill
	addq	%rax, -304(%rbp)        # 8-byte Folded Spill
	movq	-120(%rbp), %rax        # 8-byte Reload
	cmpq	-344(%rbp), %rax        # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, -120(%rbp)        # 8-byte Spill
	jne	.LBB1_26
.LBB1_115:                              # %polly.loop_exit249
                                        #   in Loop: Header=BB1_24 Depth=1
	subq	$-128, -264(%rbp)       # 8-byte Folded Spill
	subq	$-128, -296(%rbp)       # 8-byte Folded Spill
	subq	$-128, -288(%rbp)       # 8-byte Folded Spill
	subq	$-128, -280(%rbp)       # 8-byte Folded Spill
	movq	-192(%rbp), %rax        # 8-byte Reload
	movq	-160(%rbp), %rcx        # 8-byte Reload
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	movq	%rcx, -160(%rbp)        # 8-byte Spill
	jne	.LBB1_24
.LBB1_17:                               # %for.end41
	movl	$16, %edi
	movq	%rdx, %rbx
	callq	malloc
	movq	%rbx, (%rax)
	movl	-324(%rbp), %ecx        # 4-byte Reload
	movl	%ecx, 8(%rax)
	movq	-248(%rbp), %rcx        # 8-byte Reload
	movl	%ecx, 12(%rax)
	addq	$488, %rsp              # imm = 0x1E8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB1_52:
	movb	-56(%rbp), %al          # 1-byte Reload
	movq	%r14, %rdx
	jmp	.LBB1_20
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

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Pass %d X %d matrix test case (C[%d][%d]=%d)\n"
	.size	.L.str, 46


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
