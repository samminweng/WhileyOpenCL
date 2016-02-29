	.text
	.file	"MatrixMult.polly.ll"
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
	subq	$56, %rsp
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
	movl	%edx, %r14d
	movl	%r14d, -48(%rbp)        # 4-byte Spill
	movl	%esi, -44(%rbp)         # 4-byte Spill
	movl	%edi, %ebx
	movl	%r14d, %eax
	imull	%esi, %eax
	movslq	%eax, %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, -72(%rbp)         # 8-byte Spill
	testl	%r14d, %r14d
	jle	.LBB0_13
# BB#1:                                 # %for.cond3.preheader.lr.ph
	movslq	-48(%rbp), %rax         # 4-byte Folded Reload
	movq	%rax, -80(%rbp)         # 8-byte Spill
	decq	%rax
	sarq	$5, %rax
	movq	%rax, -96(%rbp)         # 8-byte Spill
	js	.LBB0_13
# BB#2:                                 # %polly.loop_preheader
	movslq	-44(%rbp), %r13         # 4-byte Folded Reload
	leaq	-1(%r13), %rsi
	sarq	$5, %rsi
	movq	%r13, %rax
	shlq	$7, %rax
	movq	%rax, -88(%rbp)         # 8-byte Spill
	leaq	(,%r13,4), %rax
	xorl	%ecx, %ecx
	movq	%rcx, -64(%rbp)         # 8-byte Spill
	movq	-72(%rbp), %rcx         # 8-byte Reload
	movq	%rcx, -56(%rbp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB0_3:                                # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
                                        #       Child Loop BB0_8 Depth 3
                                        #         Child Loop BB0_9 Depth 4
	testq	%rsi, %rsi
	js	.LBB0_12
# BB#4:                                 # %polly.loop_header5.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	movq	-64(%rbp), %rcx         # 8-byte Reload
	shlq	$5, %rcx
	movq	-80(%rbp), %rdi         # 8-byte Reload
	subq	%rcx, %rdi
	decq	%rdi
	cmpq	$31, %rdi
	movl	$31, %ecx
	cmovgq	%rcx, %rdi
	testq	%rdi, %rdi
	js	.LBB0_12
# BB#5:                                 #   in Loop: Header=BB0_3 Depth=1
	decq	%rdi
	movq	-56(%rbp), %r12         # 8-byte Reload
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB0_6:                                # %polly.loop_header14.preheader.us
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_8 Depth 3
                                        #         Child Loop BB0_9 Depth 4
	movq	%r14, %rcx
	shlq	$5, %rcx
	movq	%r13, %rdx
	subq	%rcx, %rdx
	decq	%rdx
	cmpq	$31, %rdx
	movl	$31, %r15d
	cmovleq	%rdx, %r15
	testq	%r15, %r15
	js	.LBB0_11
# BB#7:                                 #   in Loop: Header=BB0_6 Depth=2
	decq	%r15
	movq	%r12, %r11
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB0_8:                                # %polly.stmt.for.body6.preheader.us.us
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_9 Depth 4
	movq	$-1, %r9
	movq	%r11, %r10
	.p2align	4, 0x90
.LBB0_9:                                # %polly.stmt.for.body6.us.us
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        #       Parent Loop BB0_8 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	%ebx, (%r10)
	incq	%r9
	addq	$4, %r10
	cmpq	%r15, %r9
	jle	.LBB0_9
# BB#10:                                # %polly.loop_exit25.loopexit.us.us
                                        #   in Loop: Header=BB0_8 Depth=3
	addq	%rax, %r11
	cmpq	%rdi, %r8
	leaq	1(%r8), %r8
	jle	.LBB0_8
.LBB0_11:                               # %polly.loop_exit16.loopexit.us
                                        #   in Loop: Header=BB0_6 Depth=2
	subq	$-128, %r12
	cmpq	%rsi, %r14
	leaq	1(%r14), %r14
	jne	.LBB0_6
.LBB0_12:                               # %polly.loop_exit7
                                        #   in Loop: Header=BB0_3 Depth=1
	movq	-56(%rbp), %rcx         # 8-byte Reload
	addq	-88(%rbp), %rcx         # 8-byte Folded Reload
	movq	%rcx, -56(%rbp)         # 8-byte Spill
	movq	-64(%rbp), %rcx         # 8-byte Reload
	cmpq	-96(%rbp), %rcx         # 8-byte Folded Reload
	leaq	1(%rcx), %rcx
	movq	%rcx, -64(%rbp)         # 8-byte Spill
	jne	.LBB0_3
.LBB0_13:                               # %for.end10
	movl	$16, %edi
	callq	malloc
	movq	-72(%rbp), %rcx         # 8-byte Reload
	movq	%rcx, (%rax)
	movl	-44(%rbp), %ecx         # 4-byte Reload
	movl	%ecx, 8(%rax)
	movl	-48(%rbp), %ecx         # 4-byte Reload
	movl	%ecx, 12(%rax)
	addq	$56, %rsp
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
	subq	$280, %rsp              # imm = 0x118
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
	movq	%rdi, %r15
	movq	(%r15), %r14
	movq	(%rsi), %r12
	movl	8(%rsi), %ecx
	movl	%ecx, -44(%rbp)         # 4-byte Spill
	movslq	12(%r15), %rbx
	movq	%rbx, -128(%rbp)        # 8-byte Spill
	movl	%ebx, %eax
	imull	%ecx, %eax
	movslq	%eax, %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, %r11
	testq	%rbx, %rbx
	jle	.LBB1_17
# BB#1:                                 # %for.cond7.preheader.lr.ph
	movslq	-44(%rbp), %rax         # 4-byte Folded Reload
	xorl	%ecx, %ecx
	testl	%eax, %eax
	movq	-128(%rbp), %r9         # 8-byte Reload
	jle	.LBB1_2
# BB#33:                                # %polly.preload.exec
	movq	8(%r15), %rcx
	movq	%rcx, %r9
	shrq	$32, %r9
.LBB1_2:                                # %polly.preload.merge
	movslq	%ecx, %rbx
	movq	%rbx, -184(%rbp)        # 8-byte Spill
	movq	%rbx, %rdx
	imulq	%rax, %rdx
	leaq	(%r12,%rdx,4), %rdx
	cmpq	%r11, %rdx
	setbe	%r8b
	movq	-128(%rbp), %rdx        # 8-byte Reload
	leaq	-1(%rdx), %rsi
	movq	%rsi, -168(%rbp)        # 8-byte Spill
	imulq	%rax, %rsi
	movq	%rdx, %rdi
	imulq	%rax, %rdi
	movq	%rax, %r10
	leaq	(%r11,%rdi,4), %rdi
	cmpq	%r12, %rdi
	setbe	%r13b
	addq	%rbx, %rsi
	leaq	(%r14,%rsi,4), %rsi
	cmpq	%r11, %rsi
	setbe	%dl
	cmpq	%r14, %rdi
	movq	%r14, %rsi
	setbe	%al
	orb	%dl, %al
	movzbl	%al, %eax
	cmpl	$1, %eax
	jne	.LBB1_5
# BB#3:                                 # %polly.preload.merge
	cmpl	%ecx, -44(%rbp)         # 4-byte Folded Reload
	jl	.LBB1_5
# BB#4:                                 # %polly.preload.merge
	orb	%r8b, %r13b
	je	.LBB1_5
# BB#42:                                # %polly.start
	movq	%rsi, -120(%rbp)        # 8-byte Spill
	sarq	$5, -168(%rbp)          # 8-byte Folded Spill
	movq	%r10, %rbx
	movq	%rbx, -72(%rbp)         # 8-byte Spill
	js	.LBB1_17
# BB#43:                                # %polly.loop_preheader
	movq	-184(%rbp), %rax        # 8-byte Reload
	decq	%rax
	movq	%rax, -176(%rbp)        # 8-byte Spill
	leaq	-1(%rbx), %rdx
	sarq	$5, %rdx
	movq	%rdx, -144(%rbp)        # 8-byte Spill
	leaq	(,%rbx,4), %r15
	movq	%rbx, %rax
	shlq	$7, %rax
	movq	%rax, -112(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -64(%rbp)         # 8-byte Spill
	movq	%r11, -80(%rbp)         # 8-byte Spill
	movq	%r11, -160(%rbp)        # 8-byte Spill
	.p2align	4, 0x90
.LBB1_34:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_37 Depth 2
                                        #       Child Loop BB1_39 Depth 3
	testq	%rdx, %rdx
	js	.LBB1_41
# BB#35:                                # %polly.loop_header28.preheader
                                        #   in Loop: Header=BB1_34 Depth=1
	movq	-64(%rbp), %rax         # 8-byte Reload
	shlq	$5, %rax
	movq	-128(%rbp), %r13        # 8-byte Reload
	subq	%rax, %r13
	decq	%r13
	cmpq	$31, %r13
	movl	$31, %eax
	cmovgq	%rax, %r13
	testq	%r13, %r13
	js	.LBB1_41
# BB#36:                                #   in Loop: Header=BB1_34 Depth=1
	decq	%r13
	movq	-80(%rbp), %rax         # 8-byte Reload
	movq	%rax, -88(%rbp)         # 8-byte Spill
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_37:                               # %polly.loop_header37.preheader.us
                                        #   Parent Loop BB1_34 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_39 Depth 3
	movq	%rax, -96(%rbp)         # 8-byte Spill
	shlq	$5, %rax
	movq	%rax, %rcx
	subq	%rbx, %rcx
	cmpq	$-33, %rcx
	movq	$-32, %rdx
	cmovleq	%rdx, %rcx
	cmpq	%rbx, %rax
	jge	.LBB1_40
# BB#38:                                #   in Loop: Header=BB1_37 Depth=2
	shlq	$2, %rcx
	negq	%rcx
	movq	%rcx, -56(%rbp)         # 8-byte Spill
	movq	$-1, %rbx
	movq	-88(%rbp), %r14         # 8-byte Reload
	.p2align	4, 0x90
.LBB1_39:                               # %polly.stmt.for.body11.preheader.us.us
                                        #   Parent Loop BB1_34 Depth=1
                                        #     Parent Loop BB1_37 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	xorl	%esi, %esi
	movq	%r14, %rdi
	movq	-56(%rbp), %rdx         # 8-byte Reload
	callq	memset
	incq	%rbx
	addq	%r15, %r14
	cmpq	%r13, %rbx
	jle	.LBB1_39
.LBB1_40:                               # %polly.loop_exit39.loopexit.us
                                        #   in Loop: Header=BB1_37 Depth=2
	subq	$-128, -88(%rbp)        # 8-byte Folded Spill
	movq	-144(%rbp), %rdx        # 8-byte Reload
	movq	-96(%rbp), %rax         # 8-byte Reload
	cmpq	%rdx, %rax
	leaq	1(%rax), %rax
	movq	-72(%rbp), %rbx         # 8-byte Reload
	jne	.LBB1_37
.LBB1_41:                               # %polly.loop_exit30
                                        #   in Loop: Header=BB1_34 Depth=1
	movq	-80(%rbp), %rax         # 8-byte Reload
	addq	-112(%rbp), %rax        # 8-byte Folded Reload
	movq	%rax, -80(%rbp)         # 8-byte Spill
	movq	-64(%rbp), %rax         # 8-byte Reload
	cmpq	-168(%rbp), %rax        # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, -64(%rbp)         # 8-byte Spill
	jne	.LBB1_34
# BB#18:                                # %polly.cond
	movq	-128(%rbp), %rax        # 8-byte Reload
	testl	%eax, %eax
	setle	%cl
	jle	.LBB1_44
# BB#19:
	xorl	%eax, %eax
	movq	-160(%rbp), %r11        # 8-byte Reload
	jmp	.LBB1_20
.LBB1_5:                                # %for.cond7.preheader.preheader
	movq	%rsi, -120(%rbp)        # 8-byte Spill
	cmpl	$0, -44(%rbp)           # 4-byte Folded Reload
	movq	%r10, %rax
	movq	%rax, -72(%rbp)         # 8-byte Spill
	jle	.LBB1_17
# BB#6:                                 # %for.body11.preheader.us.preheader
	movslq	%r9d, %rcx
	movq	%rcx, -80(%rbp)         # 8-byte Spill
	leaq	(,%rax,4), %rcx
	movq	%rcx, -112(%rbp)        # 8-byte Spill
	testq	%rax, %rax
	movl	$1, %ecx
	cmovgq	%rax, %rcx
	shlq	$2, %rcx
	movq	%rcx, -136(%rbp)        # 8-byte Spill
	movslq	8(%r15), %r15
	movl	%r15d, %ecx
	andl	$1, %ecx
	movq	%rcx, -96(%rbp)         # 8-byte Spill
	leaq	(%rax,%rax), %r14
	xorl	%ecx, %ecx
	movq	%rcx, -88(%rbp)         # 8-byte Spill
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_7:                                # %for.body11.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_9 Depth 2
                                        #       Child Loop BB1_13 Depth 3
	testl	%r15d, %r15d
	jle	.LBB1_15
# BB#8:                                 # %for.body11.us.us.preheader
                                        #   in Loop: Header=BB1_7 Depth=1
	movq	%rcx, %rdx
	movq	%rcx, -64(%rbp)         # 8-byte Spill
	imulq	%rax, %rdx
	movq	%rdx, -56(%rbp)         # 8-byte Spill
	movq	%r12, %r9
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB1_9:                                # %for.body11.us.us
                                        #   Parent Loop BB1_7 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_13 Depth 3
	movq	-56(%rbp), %rax         # 8-byte Reload
	leaq	(%r10,%rax), %rsi
	xorl	%edi, %edi
	cmpq	$0, -96(%rbp)           # 8-byte Folded Reload
	movl	$0, (%r11,%rsi,4)
	movl	$0, %eax
	je	.LBB1_11
# BB#10:                                # %for.body17.us.us.prol
                                        #   in Loop: Header=BB1_9 Depth=2
	movl	(%r12,%r10,4), %edi
	movq	-120(%rbp), %rax        # 8-byte Reload
	movq	-56(%rbp), %rcx         # 8-byte Reload
	imull	(%rax,%rcx,4), %edi
	movl	%edi, (%r11,%rsi,4)
	movl	$1, %eax
.LBB1_11:                               # %for.body11.us.us.split
                                        #   in Loop: Header=BB1_9 Depth=2
	cmpl	$1, %r15d
	je	.LBB1_14
# BB#12:                                # %for.body11.us.us.split.split
                                        #   in Loop: Header=BB1_9 Depth=2
	leaq	1(%rax), %rcx
	movq	-72(%rbp), %rbx         # 8-byte Reload
	imulq	%rbx, %rcx
	leaq	(%r9,%rcx,4), %r13
	movq	-88(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	movq	-120(%rbp), %rdx        # 8-byte Reload
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
	movl	(%rbx,%rcx,4), %r8d
	imull	(%rdx), %r8d
	addl	%edi, %r8d
	movl	%r8d, (%r11,%rsi,4)
	movl	(%r13,%rcx,4), %edi
	imull	4(%rdx), %edi
	addl	%r8d, %edi
	movl	%edi, (%r11,%rsi,4)
	addq	$2, %rax
	addq	%r14, %rcx
	addq	$8, %rdx
	cmpq	%r15, %rax
	jl	.LBB1_13
.LBB1_14:                               # %for.inc36.loopexit.us.us
                                        #   in Loop: Header=BB1_9 Depth=2
	incq	%r10
	addq	$4, %r9
	movq	-72(%rbp), %rax         # 8-byte Reload
	cmpq	%rax, %r10
	jl	.LBB1_9
	jmp	.LBB1_16
	.p2align	4, 0x90
.LBB1_15:                               # %for.body11.us271.preheader
                                        #   in Loop: Header=BB1_7 Depth=1
	movq	%rax, %r13
	movq	-112(%rbp), %rdi        # 8-byte Reload
	imulq	%rcx, %rdi
	movq	%rcx, -64(%rbp)         # 8-byte Spill
	addq	%r11, %rdi
	xorl	%esi, %esi
	movq	-136(%rbp), %rdx        # 8-byte Reload
	movq	%r11, %rbx
	callq	memset
	movq	%r13, %rax
	movq	%rbx, %r11
.LBB1_16:                               # %for.inc39.loopexit.us
                                        #   in Loop: Header=BB1_7 Depth=1
	movq	-64(%rbp), %rcx         # 8-byte Reload
	incq	%rcx
	addq	%rax, -88(%rbp)         # 8-byte Folded Spill
	cmpq	-80(%rbp), %rcx         # 8-byte Folded Reload
	jl	.LBB1_7
	jmp	.LBB1_17
.LBB1_44:                               # %polly.then
	movb	$1, %al
	testq	%rdx, %rdx
	movq	-160(%rbp), %r11        # 8-byte Reload
	js	.LBB1_20
# BB#45:                                # %polly.loop_header57.preheader
	movb	%cl, -96(%rbp)          # 1-byte Spill
	xorl	%r14d, %r14d
	testb	$1, %dl
	movq	%rdx, %r13
	jne	.LBB1_48
# BB#46:                                # %polly.loop_header57.prol
	movl	$1, %r14d
	cmpl	$0, -44(%rbp)           # 4-byte Folded Reload
	jle	.LBB1_48
# BB#47:                                # %polly.stmt.for.body1174.preheader.prol
	movq	%rbx, %rax
	negq	%rax
	cmpq	$-33, %rax
	movq	$-32, %rdx
	cmovgq	%rax, %rdx
	shlq	$2, %rdx
	negq	%rdx
	xorl	%esi, %esi
	movq	%r11, %rdi
	movq	%r11, %r14
	callq	memset
	movq	%r14, %r11
	movl	$1, %r14d
.LBB1_48:                               # %polly.loop_header57.preheader.split
	movq	%r13, %rcx
	testq	%rcx, %rcx
	je	.LBB1_49
# BB#50:                                # %polly.loop_header57.preheader.split.split
	leaq	1(%rcx), %r13
	movq	%rcx, -144(%rbp)        # 8-byte Spill
	subq	%r14, %r13
	movq	%r14, %rax
	shlq	$7, %rax
	leaq	128(%rax,%r11), %rdi
	shlq	$5, %r14
	addq	$32, %r14
	movq	%rbx, %rax
	negq	%rax
	movq	%rax, -56(%rbp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB1_51:                               # %polly.loop_header57
                                        # =>This Inner Loop Header: Depth=1
	leaq	-32(%r14), %rax
	cmpq	%rbx, %rax
	jge	.LBB1_53
# BB#52:                                # %polly.stmt.for.body1174.preheader
                                        #   in Loop: Header=BB1_51 Depth=1
	movq	-56(%rbp), %rax         # 8-byte Reload
	leaq	-32(%rax,%r14), %rdx
	cmpq	$-33, %rdx
	movq	$-32, %rax
	cmovleq	%rax, %rdx
	shlq	$2, %rdx
	negq	%rdx
	movq	%rdi, %rbx
	leaq	-128(%rbx), %rdi
	xorl	%esi, %esi
	callq	memset
	movq	%rbx, %rdi
	movq	-72(%rbp), %rbx         # 8-byte Reload
	movq	-160(%rbp), %r11        # 8-byte Reload
.LBB1_53:                               # %polly.loop_exit68
                                        #   in Loop: Header=BB1_51 Depth=1
	cmpq	%rbx, %r14
	jge	.LBB1_55
# BB#54:                                # %polly.stmt.for.body1174.preheader.1
                                        #   in Loop: Header=BB1_51 Depth=1
	movq	-56(%rbp), %rax         # 8-byte Reload
	leaq	(%rax,%r14), %rdx
	cmpq	$-33, %rdx
	movq	$-32, %rax
	cmovleq	%rax, %rdx
	shlq	$2, %rdx
	negq	%rdx
	xorl	%esi, %esi
	movq	%rdi, %rbx
	callq	memset
	movq	%rbx, %rdi
	movq	-72(%rbp), %rbx         # 8-byte Reload
	movq	-160(%rbp), %r11        # 8-byte Reload
.LBB1_55:                               # %polly.loop_exit68.1
                                        #   in Loop: Header=BB1_51 Depth=1
	addq	$256, %rdi              # imm = 0x100
	addq	$64, %r14
	addq	$-2, %r13
	jne	.LBB1_51
# BB#56:
	movb	-96(%rbp), %al          # 1-byte Reload
	movq	-144(%rbp), %rdx        # 8-byte Reload
	jmp	.LBB1_20
.LBB1_49:
	movb	-96(%rbp), %al          # 1-byte Reload
	movq	%rcx, %rdx
.LBB1_20:                               # %polly.merge
	movl	%eax, -228(%rbp)        # 4-byte Spill
	cmpq	$0, -168(%rbp)          # 8-byte Folded Reload
	js	.LBB1_21
# BB#57:                                # %polly.loop_preheader82
	movq	-176(%rbp), %rax        # 8-byte Reload
	sarq	$5, %rax
	movq	%rax, -240(%rbp)        # 8-byte Spill
	movq	%rbx, %rax
	shlq	$5, %rax
	movq	%rax, -272(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -200(%rbp)        # 8-byte Spill
	movl	$1, %eax
	movd	%rax, %xmm0
	pslldq	$8, %xmm0               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7]
	xorl	%eax, %eax
	movq	%rax, -192(%rbp)        # 8-byte Spill
	.p2align	4, 0x90
.LBB1_58:                               # %polly.loop_header81
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_60 Depth 2
                                        #       Child Loop BB1_62 Depth 3
                                        #         Child Loop BB1_65 Depth 4
                                        #           Child Loop BB1_67 Depth 5
                                        #             Child Loop BB1_78 Depth 6
                                        #             Child Loop BB1_70 Depth 6
	testq	%rdx, %rdx
	js	.LBB1_72
# BB#59:                                # %polly.loop_header91.preheader
                                        #   in Loop: Header=BB1_58 Depth=1
	movq	-192(%rbp), %rax        # 8-byte Reload
	shlq	$5, %rax
	movq	%rax, -304(%rbp)        # 8-byte Spill
	movq	-128(%rbp), %rdx        # 8-byte Reload
	subq	%rax, %rdx
	decq	%rdx
	cmpq	$31, %rdx
	movl	$31, %eax
	cmovgq	%rax, %rdx
	movq	%rdx, -288(%rbp)        # 8-byte Spill
	leaq	-1(%rdx), %rax
	movq	%rax, -312(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -256(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -208(%rbp)        # 8-byte Spill
	.p2align	4, 0x90
.LBB1_60:                               # %polly.loop_header91
                                        #   Parent Loop BB1_58 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_62 Depth 3
                                        #         Child Loop BB1_65 Depth 4
                                        #           Child Loop BB1_67 Depth 5
                                        #             Child Loop BB1_78 Depth 6
                                        #             Child Loop BB1_70 Depth 6
	cmpq	$0, -240(%rbp)          # 8-byte Folded Reload
	js	.LBB1_71
# BB#61:                                # %polly.loop_header101.preheader
                                        #   in Loop: Header=BB1_60 Depth=2
	movq	-208(%rbp), %rdx        # 8-byte Reload
	shlq	$5, %rdx
	movq	%rdx, -96(%rbp)         # 8-byte Spill
	movq	%rbx, %rax
	subq	%rdx, %rax
	decq	%rax
	cmpq	$31, %rax
	movl	$31, %edx
	cmovleq	%rax, %rdx
	movq	%rdx, -280(%rbp)        # 8-byte Spill
	leaq	-1(%rdx), %rax
	movq	%rax, -88(%rbp)         # 8-byte Spill
	movq	-200(%rbp), %rax        # 8-byte Reload
	movq	%rax, -248(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -80(%rbp)         # 8-byte Spill
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_62:                               # %polly.loop_header101
                                        #   Parent Loop BB1_58 Depth=1
                                        #     Parent Loop BB1_60 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_65 Depth 4
                                        #           Child Loop BB1_67 Depth 5
                                        #             Child Loop BB1_78 Depth 6
                                        #             Child Loop BB1_70 Depth 6
	movq	%rax, -296(%rbp)        # 8-byte Spill
	shlq	$5, %rax
	movq	%rax, -104(%rbp)        # 8-byte Spill
	subq	-184(%rbp), %rax        # 8-byte Folded Reload
	cmpq	$-33, %rax
	movq	$-32, %rdx
	cmovleq	%rdx, %rax
	movq	$-2, %rdx
	subq	%rax, %rdx
	cmpq	$-2, %rdx
	movq	$-1, %rax
	cmovleq	%rax, %rdx
	cmpq	$0, -288(%rbp)          # 8-byte Folded Reload
	js	.LBB1_82
# BB#63:                                # %polly.loop_header110.preheader
                                        #   in Loop: Header=BB1_62 Depth=3
	movq	-184(%rbp), %rax        # 8-byte Reload
	subq	-104(%rbp), %rax        # 8-byte Folded Reload
	decq	%rax
	cmpq	$31, %rax
	movl	$31, %esi
	cmovleq	%rax, %rsi
	movq	%rsi, -264(%rbp)        # 8-byte Spill
	cmpq	$0, -280(%rbp)          # 8-byte Folded Reload
	js	.LBB1_82
# BB#64:                                # %polly.loop_header119.preheader.us.preheader
                                        #   in Loop: Header=BB1_62 Depth=3
	movq	%rdx, %r9
	leaq	-2(%r9), %rcx
	shrq	$2, %rcx
	movq	%rcx, -136(%rbp)        # 8-byte Spill
	addq	$2, %r9
	movq	%r9, -56(%rbp)          # 8-byte Spill
	movq	-264(%rbp), %rax        # 8-byte Reload
	leaq	-1(%rax), %r8
	cmpl	$1, -44(%rbp)           # 4-byte Folded Reload
	sete	%al
	andq	$-4, %r9
	setne	%dl
	andb	%al, %dl
	movb	%dl, -112(%rbp)         # 1-byte Spill
	movq	-104(%rbp), %xmm1       # 8-byte Folded Reload
                                        # xmm1 = mem[0],zero
	pshufd	$68, %xmm1, %xmm1       # xmm1 = xmm1[0,1,0,1]
	andl	$1, %ecx
	movq	%rcx, -224(%rbp)        # 8-byte Spill
	movq	-248(%rbp), %rax        # 8-byte Reload
	movq	%rax, -64(%rbp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -216(%rbp)        # 8-byte Spill
	.p2align	4, 0x90
.LBB1_65:                               # %polly.loop_header119.preheader.us
                                        #   Parent Loop BB1_58 Depth=1
                                        #     Parent Loop BB1_60 Depth=2
                                        #       Parent Loop BB1_62 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB1_67 Depth 5
                                        #             Child Loop BB1_78 Depth 6
                                        #             Child Loop BB1_70 Depth 6
	cmpq	$0, -264(%rbp)          # 8-byte Folded Reload
	js	.LBB1_81
# BB#66:                                # %polly.loop_header128.preheader.us.us.preheader
                                        #   in Loop: Header=BB1_65 Depth=4
	movq	-304(%rbp), %rax        # 8-byte Reload
	movq	-216(%rbp), %rcx        # 8-byte Reload
	leaq	(%rcx,%rax), %r10
	imulq	-72(%rbp), %r10         # 8-byte Folded Reload
	movq	-104(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%r10), %rax
	movq	%rax, -152(%rbp)        # 8-byte Spill
	movq	-256(%rbp), %r13        # 8-byte Reload
	xorl	%ebx, %ebx
	jmp	.LBB1_67
.LBB1_75:                               #   in Loop: Header=BB1_67 Depth=5
                                        # implicit-def: %XMM3
	xorl	%r11d, %r11d
.LBB1_77:                               # %vector.ph.split
                                        #   in Loop: Header=BB1_67 Depth=5
	cmpq	$0, -136(%rbp)          # 8-byte Folded Reload
	je	.LBB1_79
	.p2align	4, 0x90
.LBB1_78:                               # %vector.body
                                        #   Parent Loop BB1_58 Depth=1
                                        #     Parent Loop BB1_60 Depth=2
                                        #       Parent Loop BB1_62 Depth=3
                                        #         Parent Loop BB1_65 Depth=4
                                        #           Parent Loop BB1_67 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movd	%r11, %xmm3
	pshufd	$68, %xmm3, %xmm3       # xmm3 = xmm3[0,1,0,1]
	paddq	%xmm1, %xmm3
	paddq	%xmm0, %xmm3
	movd	%xmm3, %rax
	leaq	(%rax,%r10), %rcx
	movdqu	(%rdx,%rcx,4), %xmm4
	addq	%rsi, %rax
	movdqu	(%r12,%rax,4), %xmm3
	pshufd	$245, %xmm3, %xmm5      # xmm5 = xmm3[1,1,3,3]
	pmuludq	%xmm4, %xmm3
	pshufd	$232, %xmm3, %xmm3      # xmm3 = xmm3[0,2,2,3]
	pshufd	$245, %xmm4, %xmm4      # xmm4 = xmm4[1,1,3,3]
	pmuludq	%xmm5, %xmm4
	pshufd	$232, %xmm4, %xmm4      # xmm4 = xmm4[0,2,2,3]
	punpckldq	%xmm4, %xmm3    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
	paddd	%xmm2, %xmm3
	leaq	4(%r11), %rax
	movd	%rax, %xmm2
	pshufd	$68, %xmm2, %xmm2       # xmm2 = xmm2[0,1,0,1]
	paddq	%xmm1, %xmm2
	paddq	%xmm0, %xmm2
	movd	%xmm2, %rax
	leaq	(%rax,%r10), %rcx
	movdqu	(%rdx,%rcx,4), %xmm4
	addq	%rsi, %rax
	movdqu	(%r12,%rax,4), %xmm2
	pshufd	$245, %xmm2, %xmm5      # xmm5 = xmm2[1,1,3,3]
	pmuludq	%xmm4, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm4, %xmm4      # xmm4 = xmm4[1,1,3,3]
	pmuludq	%xmm5, %xmm4
	pshufd	$232, %xmm4, %xmm4      # xmm4 = xmm4[0,2,2,3]
	punpckldq	%xmm4, %xmm2    # xmm2 = xmm2[0],xmm4[0],xmm2[1],xmm4[1]
	paddd	%xmm3, %xmm2
	addq	$8, %r11
	cmpq	%r9, %r11
	movdqa	%xmm2, %xmm3
	jne	.LBB1_78
.LBB1_79:                               # %middle.block
                                        #   in Loop: Header=BB1_67 Depth=5
	pshufd	$78, %xmm3, %xmm2       # xmm2 = xmm3[2,3,0,1]
	paddd	%xmm3, %xmm2
	pshufd	$229, %xmm2, %xmm3      # xmm3 = xmm2[1,1,2,3]
	paddd	%xmm2, %xmm3
	movd	%xmm3, %eax
	cmpq	%r9, -56(%rbp)          # 8-byte Folded Reload
	movq	%r9, %rdx
	movq	%rdi, %r11
	jne	.LBB1_69
	jmp	.LBB1_80
	.p2align	4, 0x90
.LBB1_67:                               # %polly.loop_header128.preheader.us.us
                                        #   Parent Loop BB1_58 Depth=1
                                        #     Parent Loop BB1_60 Depth=2
                                        #       Parent Loop BB1_62 Depth=3
                                        #         Parent Loop BB1_65 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB1_78 Depth 6
                                        #             Child Loop BB1_70 Depth 6
	movq	-96(%rbp), %rax         # 8-byte Reload
	leaq	(%rbx,%rax), %rsi
	leaq	(%rsi,%r10), %r14
	movl	(%r11,%r14,4), %eax
	cmpq	$3, -56(%rbp)           # 8-byte Folded Reload
	jbe	.LBB1_68
# BB#73:                                # %min.iters.checked
                                        #   in Loop: Header=BB1_67 Depth=5
	cmpb	$0, -112(%rbp)          # 1-byte Folded Reload
	je	.LBB1_68
# BB#74:                                # %vector.ph
                                        #   in Loop: Header=BB1_67 Depth=5
	movd	%eax, %xmm2
	cmpq	$0, -224(%rbp)          # 8-byte Folded Reload
	movq	-120(%rbp), %rdx        # 8-byte Reload
	movq	%r11, %rdi
	jne	.LBB1_75
# BB#76:                                # %vector.body.prol
                                        #   in Loop: Header=BB1_67 Depth=5
	movq	-152(%rbp), %rax        # 8-byte Reload
	movdqu	(%rdx,%rax,4), %xmm4
	movq	-104(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%rsi), %rax
	movdqu	(%r12,%rax,4), %xmm3
	pshufd	$245, %xmm3, %xmm5      # xmm5 = xmm3[1,1,3,3]
	pmuludq	%xmm4, %xmm3
	pshufd	$232, %xmm3, %xmm3      # xmm3 = xmm3[0,2,2,3]
	pshufd	$245, %xmm4, %xmm4      # xmm4 = xmm4[1,1,3,3]
	pmuludq	%xmm5, %xmm4
	pshufd	$232, %xmm4, %xmm4      # xmm4 = xmm4[0,2,2,3]
	punpckldq	%xmm4, %xmm3    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
	paddd	%xmm2, %xmm3
	movl	$4, %r11d
	movdqa	%xmm3, %xmm2
	jmp	.LBB1_77
	.p2align	4, 0x90
.LBB1_68:                               #   in Loop: Header=BB1_67 Depth=5
	xorl	%edx, %edx
.LBB1_69:                               # %polly.loop_header128.us.us.preheader
                                        #   in Loop: Header=BB1_67 Depth=5
	movq	-80(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rdx), %rsi
	imulq	-72(%rbp), %rsi         # 8-byte Folded Reload
	addq	%r13, %rsi
	leaq	(%r12,%rsi,4), %rsi
	movq	-64(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rdx), %rcx
	leaq	-1(%rdx), %rdi
	movq	-120(%rbp), %rdx        # 8-byte Reload
	leaq	(%rdx,%rcx,4), %rdx
	.p2align	4, 0x90
.LBB1_70:                               # %polly.loop_header128.us.us
                                        #   Parent Loop BB1_58 Depth=1
                                        #     Parent Loop BB1_60 Depth=2
                                        #       Parent Loop BB1_62 Depth=3
                                        #         Parent Loop BB1_65 Depth=4
                                        #           Parent Loop BB1_67 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movl	(%rsi), %ecx
	imull	(%rdx), %ecx
	addl	%ecx, %eax
	incq	%rdi
	addq	%r15, %rsi
	addq	$4, %rdx
	cmpq	%r8, %rdi
	jle	.LBB1_70
.LBB1_80:                               # %polly.loop_exit130.loopexit.us.us
                                        #   in Loop: Header=BB1_67 Depth=5
	movl	%eax, (%r11,%r14,4)
	incq	%r13
	cmpq	-88(%rbp), %rbx         # 8-byte Folded Reload
	leaq	1(%rbx), %rbx
	jle	.LBB1_67
.LBB1_81:                               # %polly.loop_exit121.loopexit.us
                                        #   in Loop: Header=BB1_65 Depth=4
	movq	-72(%rbp), %rbx         # 8-byte Reload
	addq	%rbx, -64(%rbp)         # 8-byte Folded Spill
	movq	-216(%rbp), %rax        # 8-byte Reload
	cmpq	-312(%rbp), %rax        # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, -216(%rbp)        # 8-byte Spill
	jle	.LBB1_65
.LBB1_82:                               # %polly.loop_exit112
                                        #   in Loop: Header=BB1_62 Depth=3
	addq	$32, -80(%rbp)          # 8-byte Folded Spill
	addq	$32, -248(%rbp)         # 8-byte Folded Spill
	movq	-296(%rbp), %rax        # 8-byte Reload
	cmpq	-240(%rbp), %rax        # 8-byte Folded Reload
	leaq	1(%rax), %rax
	jne	.LBB1_62
.LBB1_71:                               # %polly.loop_exit103
                                        #   in Loop: Header=BB1_60 Depth=2
	addq	$32, -256(%rbp)         # 8-byte Folded Spill
	movq	-144(%rbp), %rdx        # 8-byte Reload
	movq	-208(%rbp), %rax        # 8-byte Reload
	cmpq	%rdx, %rax
	leaq	1(%rax), %rax
	movq	%rax, -208(%rbp)        # 8-byte Spill
	jne	.LBB1_60
.LBB1_72:                               # %polly.loop_exit93
                                        #   in Loop: Header=BB1_58 Depth=1
	movq	-200(%rbp), %rax        # 8-byte Reload
	addq	-272(%rbp), %rax        # 8-byte Folded Reload
	movq	%rax, -200(%rbp)        # 8-byte Spill
	movq	-192(%rbp), %rax        # 8-byte Reload
	cmpq	-168(%rbp), %rax        # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, -192(%rbp)        # 8-byte Spill
	jne	.LBB1_58
.LBB1_21:                               # %polly.cond142
	movl	-228(%rbp), %eax        # 4-byte Reload
	testb	%al, %al
	je	.LBB1_17
# BB#22:                                # %polly.then144
	testq	%rdx, %rdx
	js	.LBB1_17
# BB#23:                                # %polly.loop_header148.preheader
	sarq	$5, -176(%rbp)          # 8-byte Folded Spill
	xorl	%eax, %eax
	movq	%rax, -104(%rbp)        # 8-byte Spill
	movl	$1, %eax
	movd	%rax, %xmm0
	pslldq	$8, %xmm0               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7]
	xorl	%eax, %eax
	movq	%rax, -152(%rbp)        # 8-byte Spill
	.p2align	4, 0x90
.LBB1_24:                               # %polly.loop_header148
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_27 Depth 2
                                        #       Child Loop BB1_29 Depth 3
                                        #         Child Loop BB1_88 Depth 4
                                        #         Child Loop BB1_32 Depth 4
	cmpq	$0, -176(%rbp)          # 8-byte Folded Reload
	js	.LBB1_92
# BB#25:                                # %polly.loop_header158.preheader
                                        #   in Loop: Header=BB1_24 Depth=1
	movq	-152(%rbp), %rax        # 8-byte Reload
	shlq	$5, %rax
	movq	%rax, -96(%rbp)         # 8-byte Spill
	movq	-72(%rbp), %rcx         # 8-byte Reload
	subq	%rax, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovgq	%rax, %rcx
	movq	%rcx, -56(%rbp)         # 8-byte Spill
	testq	%rcx, %rcx
	js	.LBB1_92
# BB#26:                                #   in Loop: Header=BB1_24 Depth=1
	decq	-56(%rbp)               # 8-byte Folded Spill
	xorl	%eax, %eax
	movq	%rax, -88(%rbp)         # 8-byte Spill
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_27:                               # %polly.loop_header167.preheader.us
                                        #   Parent Loop BB1_24 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_29 Depth 3
                                        #         Child Loop BB1_88 Depth 4
                                        #         Child Loop BB1_32 Depth 4
	movq	%rax, -224(%rbp)        # 8-byte Spill
	movq	%rax, %rsi
	shlq	$5, %rsi
	movq	%rsi, -136(%rbp)        # 8-byte Spill
	movq	%rsi, %rax
	movq	-184(%rbp), %rcx        # 8-byte Reload
	subq	%rcx, %rax
	cmpq	$-33, %rax
	movq	$-32, %rdx
	cmovleq	%rdx, %rax
	movq	$-2, %r9
	subq	%rax, %r9
	cmpq	$-2, %r9
	movq	$-1, %rax
	cmovleq	%rax, %r9
	movq	%rcx, %rax
	subq	%rsi, %rax
	decq	%rax
	cmpq	$31, %rax
	movl	$31, %r10d
	cmovleq	%rax, %r10
	testq	%r10, %r10
	js	.LBB1_91
# BB#28:                                # %polly.loop_header176.preheader.us.us.preheader
                                        #   in Loop: Header=BB1_27 Depth=2
	leaq	-2(%r9), %rcx
	shrq	$2, %rcx
	movq	%rcx, -80(%rbp)         # 8-byte Spill
	addq	$2, %r9
	decq	%r10
	cmpl	$1, -44(%rbp)           # 4-byte Folded Reload
	sete	%al
	movq	%r9, %r14
	andq	$-4, %r14
	setne	%dl
	andb	%al, %dl
	movb	%dl, -64(%rbp)          # 1-byte Spill
	movq	-136(%rbp), %xmm1       # 8-byte Folded Reload
                                        # xmm1 = mem[0],zero
	pshufd	$68, %xmm1, %xmm1       # xmm1 = xmm1[0,1,0,1]
	andl	$1, %ecx
	movq	%rcx, -112(%rbp)        # 8-byte Spill
	movq	-104(%rbp), %rbx        # 8-byte Reload
	xorl	%r8d, %r8d
	jmp	.LBB1_29
.LBB1_85:                               #   in Loop: Header=BB1_29 Depth=3
                                        # implicit-def: %XMM3
	xorl	%ecx, %ecx
.LBB1_87:                               # %vector.ph341.split
                                        #   in Loop: Header=BB1_29 Depth=3
	cmpq	$0, -80(%rbp)           # 8-byte Folded Reload
	je	.LBB1_89
	.p2align	4, 0x90
.LBB1_88:                               # %vector.body328
                                        #   Parent Loop BB1_24 Depth=1
                                        #     Parent Loop BB1_27 Depth=2
                                        #       Parent Loop BB1_29 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movd	%rcx, %xmm3
	pshufd	$68, %xmm3, %xmm3       # xmm3 = xmm3[0,1,0,1]
	paddq	%xmm1, %xmm3
	paddq	%xmm0, %xmm3
	movd	%xmm3, %rdx
	movdqu	(%rsi,%rdx,4), %xmm3
	addq	%rax, %rdx
	movdqu	(%r12,%rdx,4), %xmm4
	pshufd	$245, %xmm4, %xmm5      # xmm5 = xmm4[1,1,3,3]
	pmuludq	%xmm3, %xmm4
	pshufd	$232, %xmm4, %xmm4      # xmm4 = xmm4[0,2,2,3]
	pshufd	$245, %xmm3, %xmm3      # xmm3 = xmm3[1,1,3,3]
	pmuludq	%xmm5, %xmm3
	pshufd	$232, %xmm3, %xmm3      # xmm3 = xmm3[0,2,2,3]
	punpckldq	%xmm3, %xmm4    # xmm4 = xmm4[0],xmm3[0],xmm4[1],xmm3[1]
	paddd	%xmm2, %xmm4
	leaq	4(%rcx), %rdx
	movd	%rdx, %xmm2
	pshufd	$68, %xmm2, %xmm2       # xmm2 = xmm2[0,1,0,1]
	paddq	%xmm1, %xmm2
	paddq	%xmm0, %xmm2
	movd	%xmm2, %rdx
	movdqu	(%rsi,%rdx,4), %xmm3
	addq	%rax, %rdx
	movdqu	(%r12,%rdx,4), %xmm2
	pshufd	$245, %xmm2, %xmm5      # xmm5 = xmm2[1,1,3,3]
	pmuludq	%xmm3, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm3, %xmm3      # xmm3 = xmm3[1,1,3,3]
	pmuludq	%xmm5, %xmm3
	pshufd	$232, %xmm3, %xmm3      # xmm3 = xmm3[0,2,2,3]
	punpckldq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
	paddd	%xmm4, %xmm2
	addq	$8, %rcx
	cmpq	%r14, %rcx
	movdqa	%xmm2, %xmm3
	jne	.LBB1_88
.LBB1_89:                               # %middle.block329
                                        #   in Loop: Header=BB1_29 Depth=3
	pshufd	$78, %xmm3, %xmm2       # xmm2 = xmm3[2,3,0,1]
	paddd	%xmm3, %xmm2
	pshufd	$229, %xmm2, %xmm3      # xmm3 = xmm2[1,1,2,3]
	paddd	%xmm2, %xmm3
	movd	%xmm3, %ecx
	cmpq	%r14, %r9
	movq	%r14, %r11
	jne	.LBB1_31
	jmp	.LBB1_90
	.p2align	4, 0x90
.LBB1_29:                               # %polly.loop_header176.preheader.us.us
                                        #   Parent Loop BB1_24 Depth=1
                                        #     Parent Loop BB1_27 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_88 Depth 4
                                        #         Child Loop BB1_32 Depth 4
	movq	-96(%rbp), %rax         # 8-byte Reload
	leaq	(%r8,%rax), %rax
	movl	(%r11,%rax,4), %ecx
	movq	%r11, %r13
	cmpq	$3, %r9
	jbe	.LBB1_30
# BB#83:                                # %min.iters.checked334
                                        #   in Loop: Header=BB1_29 Depth=3
	cmpb	$0, -64(%rbp)           # 1-byte Folded Reload
	je	.LBB1_30
# BB#84:                                # %vector.ph341
                                        #   in Loop: Header=BB1_29 Depth=3
	movd	%ecx, %xmm2
	cmpq	$0, -112(%rbp)          # 8-byte Folded Reload
	movq	-120(%rbp), %rsi        # 8-byte Reload
	jne	.LBB1_85
# BB#86:                                # %vector.body328.prol
                                        #   in Loop: Header=BB1_29 Depth=3
	movq	-136(%rbp), %rcx        # 8-byte Reload
	movdqu	(%rsi,%rcx,4), %xmm4
	leaq	(%rcx,%rax), %rcx
	movdqu	(%r12,%rcx,4), %xmm3
	pshufd	$245, %xmm3, %xmm5      # xmm5 = xmm3[1,1,3,3]
	pmuludq	%xmm4, %xmm3
	pshufd	$232, %xmm3, %xmm3      # xmm3 = xmm3[0,2,2,3]
	pshufd	$245, %xmm4, %xmm4      # xmm4 = xmm4[1,1,3,3]
	pmuludq	%xmm5, %xmm4
	pshufd	$232, %xmm4, %xmm4      # xmm4 = xmm4[0,2,2,3]
	punpckldq	%xmm4, %xmm3    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
	paddd	%xmm2, %xmm3
	movl	$4, %ecx
	movdqa	%xmm3, %xmm2
	jmp	.LBB1_87
	.p2align	4, 0x90
.LBB1_30:                               # %polly.loop_header176.us.us.preheader
                                        #   in Loop: Header=BB1_29 Depth=3
	xorl	%r11d, %r11d
.LBB1_31:                               # %polly.loop_header176.us.us.preheader
                                        #   in Loop: Header=BB1_29 Depth=3
	movq	-88(%rbp), %rdx         # 8-byte Reload
	leaq	(%rdx,%r11), %rdx
	decq	%r11
	movq	-72(%rbp), %rdi         # 8-byte Reload
	imulq	%rdx, %rdi
	addq	%rbx, %rdi
	leaq	(%r12,%rdi,4), %rdi
	movq	-120(%rbp), %rsi        # 8-byte Reload
	leaq	(%rsi,%rdx,4), %rdx
	.p2align	4, 0x90
.LBB1_32:                               # %polly.loop_header176.us.us
                                        #   Parent Loop BB1_24 Depth=1
                                        #     Parent Loop BB1_27 Depth=2
                                        #       Parent Loop BB1_29 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	(%rdi), %esi
	imull	(%rdx), %esi
	addl	%esi, %ecx
	incq	%r11
	addq	%r15, %rdi
	addq	$4, %rdx
	cmpq	%r10, %r11
	jle	.LBB1_32
.LBB1_90:                               # %polly.loop_exit178.loopexit.us.us
                                        #   in Loop: Header=BB1_29 Depth=3
	movq	%r13, %r11
	movl	%ecx, (%r11,%rax,4)
	incq	%rbx
	cmpq	-56(%rbp), %r8          # 8-byte Folded Reload
	leaq	1(%r8), %r8
	jle	.LBB1_29
.LBB1_91:                               # %polly.loop_exit169.loopexit.us
                                        #   in Loop: Header=BB1_27 Depth=2
	addq	$32, -88(%rbp)          # 8-byte Folded Spill
	movq	-224(%rbp), %rax        # 8-byte Reload
	cmpq	-176(%rbp), %rax        # 8-byte Folded Reload
	leaq	1(%rax), %rax
	jne	.LBB1_27
.LBB1_92:                               # %polly.loop_exit160
                                        #   in Loop: Header=BB1_24 Depth=1
	addq	$32, -104(%rbp)         # 8-byte Folded Spill
	movq	-144(%rbp), %rax        # 8-byte Reload
	movq	-152(%rbp), %rcx        # 8-byte Reload
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	movq	%rcx, -152(%rbp)        # 8-byte Spill
	jne	.LBB1_24
.LBB1_17:                               # %for.end41
	movl	$16, %edi
	movq	%r11, %rbx
	callq	malloc
	movq	%rbx, (%rax)
	movl	-44(%rbp), %ecx         # 4-byte Reload
	movl	%ecx, 8(%rax)
	movq	-128(%rbp), %rcx        # 8-byte Reload
	movl	%ecx, 12(%rax)
	addq	$280, %rsp              # imm = 0x118
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
	pushq	%r14
	pushq	%rbx
.Ltmp19:
	.cfi_offset %rbx, -32
.Ltmp20:
	.cfi_offset %r14, -24
	callq	convertArgsToIntArray
	movq	(%rax), %rdi
	callq	parseStringToInt
	movq	%rax, %rbx
	movl	$1, %edi
	movl	%ebx, %esi
	movl	%ebx, %edx
	callq	init
	movq	%rax, %r14
	movl	$1, %edi
	movl	%ebx, %esi
	movl	%ebx, %edx
	callq	init
	movq	%r14, %rdi
	movq	%rax, %rsi
	callq	matrix_multiply
	leal	-1(%rbx), %ecx
	movl	%ebx, %edx
	imull	%edx, %edx
	shlq	$32, %rdx
	movabsq	$-4294967296, %rsi      # imm = 0xFFFFFFFF00000000
	addq	%rdx, %rsi
	movq	(%rax), %rax
	sarq	$30, %rsi
	movl	(%rax,%rsi), %r9d
	movl	$.L.str, %edi
	xorl	%eax, %eax
	movl	%ebx, %esi
	movl	%ebx, %edx
	movl	%ecx, %r8d
	callq	printf
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
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
