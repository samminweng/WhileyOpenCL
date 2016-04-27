	.text
	.file	"llvm/CoinGame.polly.enablevc.ll"
	.globl	findMoves
	.p2align	4, 0x90
	.type	findMoves,@function
findMoves:                              # @findMoves
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp0:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp1:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp2:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp3:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp4:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp5:
	.cfi_def_cfa_offset 56
	subq	$104, %rsp
.Ltmp6:
	.cfi_def_cfa_offset 160
.Ltmp7:
	.cfi_offset %rbx, -56
.Ltmp8:
	.cfi_offset %r12, -48
.Ltmp9:
	.cfi_offset %r13, -40
.Ltmp10:
	.cfi_offset %r14, -32
.Ltmp11:
	.cfi_offset %r15, -24
.Ltmp12:
	.cfi_offset %rbp, -16
	movq	%rcx, %rbp
	movq	%rdi, 16(%rsp)          # 8-byte Spill
	xorl	%edi, %edi
	movl	%ebp, %esi
	callq	gen1DArray
	movq	%rax, %rbx
	xorl	%edi, %edi
	movl	%ebp, %esi
	callq	gen1DArray
	movq	%rax, %r12
	xorl	%edi, %edi
	movl	%ebp, %esi
	callq	gen1DArray
	movq	%rax, %r13
	testq	%rbp, %rbp
	jle	.LBB0_23
# BB#1:                                 # %polly.split_new_and_old
	leaq	(%rbx,%rbp,8), %rax
	movq	16(%rsp), %rdx          # 8-byte Reload
	cmpq	%rdx, %rax
	setbe	(%rsp)                  # 1-byte Folded Spill
	movq	%rbp, %rcx
	imulq	%rcx, %rcx
	leaq	(%rdx,%rcx,8), %rcx
	cmpq	%rbx, %rcx
	setbe	%r9b
	leaq	(%r13,%rbp,8), %rsi
	cmpq	%rdx, %rsi
	setbe	24(%rsp)                # 1-byte Folded Spill
	cmpq	%r13, %rcx
	setbe	%r8b
	movq	%rbp, 8(%rsp)           # 8-byte Spill
	leaq	(%r12,%rbp,8), %rdi
	cmpq	%rdx, %rdi
	setbe	%r10b
	cmpq	%r12, %rcx
	setbe	%bpl
	cmpq	%rbx, %rsi
	setbe	%r11b
	cmpq	%r13, %rax
	setbe	%r15b
	cmpq	%rbx, %rdi
	setbe	%r14b
	cmpq	%r12, %rax
	setbe	%al
	cmpq	%r13, %rdi
	setbe	%dl
	cmpq	%r12, %rsi
	setbe	%cl
	orb	%dl, %cl
	movzbl	%cl, %ecx
	cmpl	$1, %ecx
	jne	.LBB0_8
# BB#2:                                 # %polly.split_new_and_old
	orb	%r14b, %al
	je	.LBB0_8
# BB#3:                                 # %polly.split_new_and_old
	orb	%r11b, %r15b
	je	.LBB0_8
# BB#4:                                 # %polly.split_new_and_old
	orb	%r10b, %bpl
	je	.LBB0_8
# BB#5:                                 # %polly.split_new_and_old
	movabsq	$9223372036854775807, %rax # imm = 0x7FFFFFFFFFFFFFFF
	cmpq	%rax, 8(%rsp)           # 8-byte Folded Reload
	je	.LBB0_8
# BB#6:                                 # %polly.split_new_and_old
	orb	(%rsp), %r9b            # 1-byte Folded Reload
	je	.LBB0_8
# BB#7:                                 # %polly.split_new_and_old
	orb	24(%rsp), %r8b          # 1-byte Folded Reload
	je	.LBB0_8
# BB#24:                                # %polly.loop_preheader
	movq	8(%rsp), %r8            # 8-byte Reload
	leaq	-1(%r8), %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	16(%rsp), %rax          # 8-byte Reload
	leaq	-8(%rax,%r8,8), %r9
	leaq	8(,%r8,8), %r10
	leaq	-16(%rax), %r11
	movq	%r8, %r14
	shlq	$4, %r14
	addq	%rax, %r14
	leaq	-2(%r8), %rcx
	movq	%rcx, 48(%rsp)          # 8-byte Spill
	movl	$1, %ecx
	movl	$2, %edx
	movq	%rax, %rbp
	xorl	%edi, %edi
	movq	%r10, 40(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB0_25:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_43 Depth 2
                                        #     Child Loop BB0_45 Depth 2
                                        #     Child Loop BB0_47 Depth 2
                                        #     Child Loop BB0_32 Depth 2
                                        #     Child Loop BB0_36 Depth 2
                                        #     Child Loop BB0_40 Depth 2
	movq	%rbp, 72(%rsp)          # 8-byte Spill
	movq	%r14, 96(%rsp)          # 8-byte Spill
	testq	%rdx, %rdx
	movl	$0, %ebp
	movq	%rdx, 80(%rsp)          # 8-byte Spill
	cmovnsq	%rdx, %rbp
	testq	%rcx, %rcx
	movl	$0, %r14d
	movq	%rcx, 88(%rsp)          # 8-byte Spill
	cmovnsq	%rcx, %r14
	movq	24(%rsp), %rax          # 8-byte Reload
	subq	%rdi, %rax
	movl	$0, %ecx
	cmovsq	%rcx, %rax
	movq	%r8, %r15
	movq	%rdi, (%rsp)            # 8-byte Spill
	subq	%rdi, %r15
	jle	.LBB0_27
# BB#26:                                # %polly.loop_header347.preheader
                                        #   in Loop: Header=BB0_25 Depth=1
	leaq	8(,%rax,8), %rdx
	movq	%rdx, 32(%rsp)          # 8-byte Spill
	xorl	%esi, %esi
	movq	%r12, %rdi
	movq	%r9, 64(%rsp)           # 8-byte Spill
	movq	%r11, 56(%rsp)          # 8-byte Spill
	callq	memset
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movq	32(%rsp), %rdx          # 8-byte Reload
	callq	memset
	xorl	%esi, %esi
	movq	%r13, %rdi
	movq	32(%rsp), %rdx          # 8-byte Reload
	callq	memset
	movq	56(%rsp), %r11          # 8-byte Reload
	movq	40(%rsp), %r10          # 8-byte Reload
	movq	64(%rsp), %r9           # 8-byte Reload
.LBB0_27:                               # %polly.loop_exit349
                                        #   in Loop: Header=BB0_25 Depth=1
	movl	$1, %eax
	subq	(%rsp), %rax            # 8-byte Folded Reload
	movl	$0, %ecx
	cmovnsq	%rax, %rcx
	movq	24(%rsp), %rdx          # 8-byte Reload
	cmpq	%r15, %rdx
	movq	%r15, %rax
	cmovleq	%rdx, %rax
	cmpq	%rax, %rcx
	jge	.LBB0_28
# BB#42:                                # %polly.loop_preheader358
                                        #   in Loop: Header=BB0_25 Depth=1
	movq	%r10, %rcx
	imulq	%r14, %rcx
	decq	%r14
	addq	%r9, %rcx
	decq	%rax
	.p2align	4, 0x90
.LBB0_43:                               # %polly.loop_header357
                                        #   Parent Loop BB0_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rcx), %rdx
	movq	%rdx, 8(%r12,%r14,8)
	incq	%r14
	addq	%r10, %rcx
	cmpq	%rax, %r14
	jl	.LBB0_43
.LBB0_28:                               # %polly.loop_exit359
                                        #   in Loop: Header=BB0_25 Depth=1
	movl	$2, %eax
	movq	(%rsp), %rdi            # 8-byte Reload
	subq	%rdi, %rax
	movl	$0, %ecx
	cmovnsq	%rax, %rcx
	cmpq	%r15, %rcx
	jge	.LBB0_29
# BB#44:                                # %polly.loop_preheader372
                                        #   in Loop: Header=BB0_25 Depth=1
	movq	%r10, %rax
	imulq	%rbp, %rax
	decq	%rbp
	addq	%r11, %rax
	leaq	-1(%r15), %rcx
	.p2align	4, 0x90
.LBB0_45:                               # %polly.loop_header371
                                        #   Parent Loop BB0_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rax), %rdx
	movq	%rdx, 8(%r13,%rbp,8)
	incq	%rbp
	addq	%r10, %rax
	cmpq	%rcx, %rbp
	jl	.LBB0_45
.LBB0_29:                               # %polly.loop_exit373
                                        #   in Loop: Header=BB0_25 Depth=1
	movq	48(%rsp), %rcx          # 8-byte Reload
	cmpq	%r15, %rcx
	movq	%r15, %rax
	cmovleq	%rcx, %rax
	testq	%rax, %rax
	movq	8(%rsp), %r8            # 8-byte Reload
	movq	96(%rsp), %r14          # 8-byte Reload
	movq	72(%rsp), %rbp          # 8-byte Reload
	jle	.LBB0_30
# BB#46:                                # %polly.loop_preheader388
                                        #   in Loop: Header=BB0_25 Depth=1
	decq	%rax
	movq	$-1, %rcx
	movq	%r14, %rdx
	.p2align	4, 0x90
.LBB0_47:                               # %polly.loop_header387
                                        #   Parent Loop BB0_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rdx), %rsi
	movq	%rsi, 8(%rbx,%rcx,8)
	incq	%rcx
	addq	%r10, %rdx
	cmpq	%rax, %rcx
	jl	.LBB0_47
.LBB0_30:                               # %polly.loop_exit389
                                        #   in Loop: Header=BB0_25 Depth=1
	testq	%r15, %r15
	jle	.LBB0_41
# BB#31:                                # %polly.loop_header403.preheader
                                        #   in Loop: Header=BB0_25 Depth=1
	decq	%r15
	movq	$-1, %rax
	.p2align	4, 0x90
.LBB0_32:                               # %polly.loop_header403
                                        #   Parent Loop BB0_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%r12,%rax,8), %rcx
	cmpq	%rcx, 8(%rbx,%rax,8)
	jle	.LBB0_34
# BB#33:                                # %polly.stmt.if.end72
                                        #   in Loop: Header=BB0_32 Depth=2
	movq	%rcx, 8(%rbx,%rax,8)
.LBB0_34:                               # %polly.stmt.blklab7.exit
                                        #   in Loop: Header=BB0_32 Depth=2
	incq	%rax
	cmpq	%r15, %rax
	jl	.LBB0_32
# BB#35:                                # %polly.loop_header416.preheader
                                        #   in Loop: Header=BB0_25 Depth=1
	movq	$-1, %rax
	.p2align	4, 0x90
.LBB0_36:                               # %polly.loop_header416
                                        #   Parent Loop BB0_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%r12,%rax,8), %rcx
	cmpq	%rcx, 8(%r13,%rax,8)
	jle	.LBB0_38
# BB#37:                                # %polly.stmt.if.end80
                                        #   in Loop: Header=BB0_36 Depth=2
	movq	%rcx, 8(%r13,%rax,8)
.LBB0_38:                               # %polly.stmt.blklab8.exit
                                        #   in Loop: Header=BB0_36 Depth=2
	incq	%rax
	cmpq	%r15, %rax
	jl	.LBB0_36
# BB#39:                                # %polly.loop_preheader430
                                        #   in Loop: Header=BB0_25 Depth=1
	movq	%rbp, %rax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_40:                               # %polly.loop_header429
                                        #   Parent Loop BB0_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	(%rdi,%rcx), %rdx
	addq	(%r13,%rcx,8), %rdx
	movq	(%rbx,%rcx,8), %rsi
	addq	%rcx, %rsi
	cmpq	%rdx, %rsi
	cmovlq	%rdx, %rsi
	movq	%rsi, (%rax)
	addq	%r10, %rax
	cmpq	%r15, %rcx
	leaq	1(%rcx), %rcx
	jl	.LBB0_40
.LBB0_41:                               # %polly.loop_exit431
                                        #   in Loop: Header=BB0_25 Depth=1
	incq	%rdi
	movq	88(%rsp), %rcx          # 8-byte Reload
	decq	%rcx
	addq	$8, %r9
	movq	80(%rsp), %rdx          # 8-byte Reload
	decq	%rdx
	addq	$8, %r11
	addq	$8, %r14
	addq	$8, %rbp
	cmpq	%r8, %rdi
	jne	.LBB0_25
	jmp	.LBB0_23
.LBB0_8:                                # %while.cond26.preheader.preheader
	movq	8(%rsp), %rbp           # 8-byte Reload
	leaq	(,%rbp,8), %r9
	leaq	8(,%rbp,8), %r11
	movq	%rbp, %r10
	shlq	$4, %r10
	xorl	%r14d, %r14d
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	%rbp, %r15
	.p2align	4, 0x90
.LBB0_9:                                # %while.cond26.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_10 Depth 2
	movq	%rax, (%rsp)            # 8-byte Spill
	movq	%rax, %rdi
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_10:                               # %if.end31
                                        #   Parent Loop BB0_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	(%r14,%rax), %rcx
	movq	$0, (%r12,%rax,8)
	leaq	1(%rax), %rdx
	testq	%rcx, %rcx
	jle	.LBB0_13
# BB#11:                                # %if.end31
                                        #   in Loop: Header=BB0_10 Depth=2
	cmpq	%rbp, %rdx
	jge	.LBB0_13
# BB#12:                                # %if.end39
                                        #   in Loop: Header=BB0_10 Depth=2
	movq	-8(%r9,%rdi), %rsi
	movq	%rsi, (%r12,%rax,8)
.LBB0_13:                               # %blklab4
                                        #   in Loop: Header=BB0_10 Depth=2
	movq	$0, (%rbx,%rax,8)
	leaq	2(%rax), %rsi
	cmpq	%rbp, %rsi
	jge	.LBB0_15
# BB#14:                                # %if.end50
                                        #   in Loop: Header=BB0_10 Depth=2
	movq	(%r10,%rdi), %rsi
	movq	%rsi, (%rbx,%rax,8)
.LBB0_15:                               # %blklab5
                                        #   in Loop: Header=BB0_10 Depth=2
	movq	$0, (%r13,%rax,8)
	cmpq	$2, %rcx
	movl	$0, %esi
	jl	.LBB0_17
# BB#16:                                # %if.end61
                                        #   in Loop: Header=BB0_10 Depth=2
	movq	-16(%rdi), %rsi
	movq	%rsi, (%r13,%rax,8)
.LBB0_17:                               # %blklab6
                                        #   in Loop: Header=BB0_10 Depth=2
	movq	(%rbx,%rax,8), %r8
	movq	(%r12,%rax,8), %rbp
	cmpq	%rbp, %r8
	jle	.LBB0_19
# BB#18:                                # %if.end72
                                        #   in Loop: Header=BB0_10 Depth=2
	movq	%rbp, (%rbx,%rax,8)
	movq	(%r13,%rax,8), %rsi
	movq	%rbp, %r8
	movq	(%r12,%rax,8), %rbp
.LBB0_19:                               # %blklab7
                                        #   in Loop: Header=BB0_10 Depth=2
	cmpq	%rbp, %rsi
	jle	.LBB0_21
# BB#20:                                # %if.end80
                                        #   in Loop: Header=BB0_10 Depth=2
	movq	%rbp, (%r13,%rax,8)
	movq	(%rbx,%rax,8), %r8
.LBB0_21:                               # %blklab8
                                        #   in Loop: Header=BB0_10 Depth=2
	addq	%r8, %rax
	notq	%rbp
	notq	%rsi
	cmpq	%rsi, %rbp
	cmovgeq	%rbp, %rsi
	subq	%rsi, %rcx
	decq	%rcx
	cmpq	%rcx, %rax
	cmovgeq	%rax, %rcx
	movq	%rcx, (%rdi)
	addq	%r11, %rdi
	cmpq	%rdx, %r15
	movq	%rdx, %rax
	movq	8(%rsp), %rbp           # 8-byte Reload
	jne	.LBB0_10
# BB#22:                                # %blklab2
                                        #   in Loop: Header=BB0_9 Depth=1
	incq	%r14
	decq	%r15
	movq	(%rsp), %rax            # 8-byte Reload
	addq	$8, %rax
	cmpq	%rbp, %r14
	jne	.LBB0_9
.LBB0_23:                               # %if.then108
	movq	%rbx, %rdi
	callq	free
	movq	%r12, %rdi
	callq	free
	movq	%r13, %rdi
	callq	free
	movq	16(%rsp), %rax          # 8-byte Reload
	addq	$104, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end0:
	.size	findMoves, .Lfunc_end0-findMoves
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI1_0:
	.quad	84                      # 0x54
	.quad	104                     # 0x68
.LCPI1_1:
	.quad	101                     # 0x65
	.quad	32                      # 0x20
.LCPI1_2:
	.quad	116                     # 0x74
	.quad	111                     # 0x6f
.LCPI1_3:
	.quad	116                     # 0x74
	.quad	97                      # 0x61
.LCPI1_4:
	.quad	108                     # 0x6c
	.quad	32                      # 0x20
.LCPI1_5:
	.quad	97                      # 0x61
	.quad	109                     # 0x6d
.LCPI1_6:
	.quad	111                     # 0x6f
	.quad	117                     # 0x75
.LCPI1_7:
	.quad	110                     # 0x6e
	.quad	116                     # 0x74
.LCPI1_8:
	.quad	32                      # 0x20
	.quad	111                     # 0x6f
.LCPI1_9:
	.quad	102                     # 0x66
	.quad	32                      # 0x20
.LCPI1_10:
	.quad	109                     # 0x6d
	.quad	111                     # 0x6f
.LCPI1_11:
	.quad	110                     # 0x6e
	.quad	101                     # 0x65
.LCPI1_12:
	.quad	121                     # 0x79
	.quad	32                      # 0x20
.LCPI1_13:
	.quad	40                      # 0x28
	.quad	109                     # 0x6d
.LCPI1_14:
	.quad	97                      # 0x61
	.quad	120                     # 0x78
.LCPI1_15:
	.quad	105                     # 0x69
	.quad	109                     # 0x6d
.LCPI1_16:
	.quad	117                     # 0x75
	.quad	109                     # 0x6d
.LCPI1_17:
	.quad	41                      # 0x29
	.quad	32                      # 0x20
.LCPI1_18:
	.quad	65                      # 0x41
	.quad	108                     # 0x6c
.LCPI1_19:
	.quad	105                     # 0x69
	.quad	99                      # 0x63
.LCPI1_20:
	.quad	103                     # 0x67
	.quad	101                     # 0x65
.LCPI1_21:
	.quad	116                     # 0x74
	.quad	115                     # 0x73
.LCPI1_22:
	.quad	32                      # 0x20
	.quad	105                     # 0x69
.LCPI1_23:
	.quad	115                     # 0x73
	.quad	32                      # 0x20
.LCPI1_24:
	.quad	80                      # 0x50
	.quad	97                      # 0x61
.LCPI1_25:
	.quad	115                     # 0x73
	.quad	115                     # 0x73
.LCPI1_26:
	.quad	32                      # 0x20
	.quad	67                      # 0x43
.LCPI1_27:
	.quad	111                     # 0x6f
	.quad	105                     # 0x69
.LCPI1_28:
	.quad	110                     # 0x6e
	.quad	71                      # 0x47
.LCPI1_29:
	.quad	116                     # 0x74
	.quad	101                     # 0x65
.LCPI1_30:
	.quad	115                     # 0x73
	.quad	116                     # 0x74
.LCPI1_31:
	.quad	32                      # 0x20
	.quad	99                      # 0x63
.LCPI1_32:
	.quad	97                      # 0x61
	.quad	115                     # 0x73
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp13:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp14:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp15:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp16:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp17:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp18:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Ltmp19:
	.cfi_def_cfa_offset 64
.Ltmp20:
	.cfi_offset %rbx, -56
.Ltmp21:
	.cfi_offset %r12, -48
.Ltmp22:
	.cfi_offset %r13, -40
.Ltmp23:
	.cfi_offset %r14, -32
.Ltmp24:
	.cfi_offset %r15, -24
.Ltmp25:
	.cfi_offset %rbp, -16
	movl	%edi, %ebx
	callq	convertArgsToIntArray
	movq	%rax, %r15
	decl	%ebx
	movslq	%ebx, %r14
	movq	(%r15), %rdi
	callq	parseStringToInt
	testq	%rax, %rax
	jne	.LBB1_1
# BB#2:                                 # %if.end122.critedge
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	free2DArray
	xorl	%edi, %edi
	callq	exit
.LBB1_1:                                # %if.then103
	movq	(%rax), %rbx
	movl	%ebx, %esi
	imull	%esi, %esi
	xorl	%edi, %edi
	callq	gen1DArray
	xorl	%edx, %edx
	movq	%rax, %rdi
	movq	%rbx, %rcx
	callq	findMoves
	movq	%rax, %r12
	movq	-8(%r12,%rbx,8), %r13
	movl	$400, %edi              # imm = 0x190
	callq	malloc
	movq	%rax, %rbp
	movaps	.LCPI1_0(%rip), %xmm0   # xmm0 = [84,104]
	movups	%xmm0, (%rbp)
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [101,32]
	movups	%xmm0, 16(%rbp)
	movaps	%xmm0, %xmm1
	movaps	.LCPI1_2(%rip), %xmm0   # xmm0 = [116,111]
	movups	%xmm0, 32(%rbp)
	movaps	.LCPI1_3(%rip), %xmm0   # xmm0 = [116,97]
	movups	%xmm0, 48(%rbp)
	movaps	.LCPI1_4(%rip), %xmm0   # xmm0 = [108,32]
	movups	%xmm0, 64(%rbp)
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [97,109]
	movups	%xmm0, 80(%rbp)
	movaps	.LCPI1_6(%rip), %xmm0   # xmm0 = [111,117]
	movups	%xmm0, 96(%rbp)
	movaps	.LCPI1_7(%rip), %xmm0   # xmm0 = [110,116]
	movups	%xmm0, 112(%rbp)
	movaps	.LCPI1_8(%rip), %xmm0   # xmm0 = [32,111]
	movups	%xmm0, 128(%rbp)
	movaps	.LCPI1_9(%rip), %xmm0   # xmm0 = [102,32]
	movups	%xmm0, 144(%rbp)
	movaps	.LCPI1_10(%rip), %xmm0  # xmm0 = [109,111]
	movups	%xmm0, 160(%rbp)
	movaps	.LCPI1_11(%rip), %xmm0  # xmm0 = [110,101]
	movups	%xmm0, 176(%rbp)
	movaps	.LCPI1_12(%rip), %xmm0  # xmm0 = [121,32]
	movups	%xmm0, 192(%rbp)
	movaps	.LCPI1_13(%rip), %xmm0  # xmm0 = [40,109]
	movups	%xmm0, 208(%rbp)
	movaps	.LCPI1_14(%rip), %xmm0  # xmm0 = [97,120]
	movups	%xmm0, 224(%rbp)
	movaps	.LCPI1_15(%rip), %xmm0  # xmm0 = [105,109]
	movups	%xmm0, 240(%rbp)
	movaps	.LCPI1_16(%rip), %xmm0  # xmm0 = [117,109]
	movups	%xmm0, 256(%rbp)
	movaps	.LCPI1_17(%rip), %xmm0  # xmm0 = [41,32]
	movups	%xmm0, 272(%rbp)
	movaps	.LCPI1_18(%rip), %xmm0  # xmm0 = [65,108]
	movups	%xmm0, 288(%rbp)
	movaps	.LCPI1_19(%rip), %xmm0  # xmm0 = [105,99]
	movups	%xmm0, 304(%rbp)
	movups	%xmm1, 320(%rbp)
	movaps	.LCPI1_20(%rip), %xmm0  # xmm0 = [103,101]
	movups	%xmm0, 336(%rbp)
	movaps	.LCPI1_21(%rip), %xmm0  # xmm0 = [116,115]
	movups	%xmm0, 352(%rbp)
	movaps	.LCPI1_22(%rip), %xmm0  # xmm0 = [32,105]
	movups	%xmm0, 368(%rbp)
	movaps	.LCPI1_23(%rip), %xmm0  # xmm0 = [115,32]
	movups	%xmm0, 384(%rbp)
	movl	$50, %esi
	movq	%rbp, %rdi
	callq	printf_s
	movl	$.L.str, %edi
	xorl	%eax, %eax
	movq	%r13, %rsi
	callq	printf
	movl	$184, %edi
	callq	malloc
	movq	%rax, %rbx
	movaps	.LCPI1_24(%rip), %xmm0  # xmm0 = [80,97]
	movups	%xmm0, (%rbx)
	movaps	.LCPI1_25(%rip), %xmm0  # xmm0 = [115,115]
	movups	%xmm0, 16(%rbx)
	movaps	.LCPI1_26(%rip), %xmm0  # xmm0 = [32,67]
	movups	%xmm0, 32(%rbx)
	movaps	.LCPI1_27(%rip), %xmm0  # xmm0 = [111,105]
	movups	%xmm0, 48(%rbx)
	movaps	.LCPI1_28(%rip), %xmm0  # xmm0 = [110,71]
	movups	%xmm0, 64(%rbx)
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [97,109]
	movups	%xmm0, 80(%rbx)
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [101,32]
	movups	%xmm0, 96(%rbx)
	movaps	.LCPI1_29(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 112(%rbx)
	movaps	.LCPI1_30(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 128(%rbx)
	movaps	.LCPI1_31(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 144(%rbx)
	movaps	.LCPI1_32(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 160(%rbx)
	movq	$101, 176(%rbx)
	movl	$23, %esi
	movq	%rbx, %rdi
	callq	println_s
	movq	%r12, %rdi
	callq	free
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	free2DArray
	movq	%rbp, %rdi
	callq	free
	movq	%rbx, %rdi
	callq	free
	xorl	%edi, %edi
	callq	exit
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%lld\n"
	.size	.L.str, 6


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git 2af14cc4a90f43170f8ea9c1dfa0f71f46a0621c) (http://llvm.org/git/llvm.git 1e7e2b2b556977af8ccc12b7afba61302f3a2da9)"
	.section	".note.GNU-stack","",@progbits
