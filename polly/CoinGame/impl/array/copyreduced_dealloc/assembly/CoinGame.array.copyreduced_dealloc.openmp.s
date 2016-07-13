	.text
	.file	"llvm/CoinGame.array.copyreduced_dealloc.openmp.ll"
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
	subq	$136, %rsp
.Ltmp6:
	.cfi_def_cfa_offset 192
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
	movq	%rdi, 80(%rsp)          # 8-byte Spill
	xorl	%edi, %edi
	movl	%ebp, %esi
	callq	create1DArray
	movq	%rax, %r15
	xorl	%edi, %edi
	movl	%ebp, %esi
	callq	create1DArray
	movq	%rax, 96(%rsp)          # 8-byte Spill
	xorl	%edi, %edi
	movl	%ebp, %esi
	callq	create1DArray
	testq	%rbp, %rbp
	jle	.LBB0_25
# BB#1:                                 # %polly.split_new_and_old
	movq	%rbp, %rcx
	decq	%rcx
	movq	%rax, %r10
	seto	%r8b
	movq	%rcx, 128(%rsp)         # 8-byte Spill
	imulq	%rbp, %rcx
	seto	32(%rsp)                # 1-byte Folded Spill
	addq	%rbp, %rcx
	seto	40(%rsp)                # 1-byte Folded Spill
	movq	80(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%rcx,8), %rbx
	movq	96(%rsp), %rdx          # 8-byte Reload
	cmpq	%rdx, %rbx
	setbe	112(%rsp)               # 1-byte Folded Spill
	leaq	(%rdx,%rbp,8), %rcx
	cmpq	%rax, %rcx
	setbe	72(%rsp)                # 1-byte Folded Spill
	leaq	(%r15,%rbp,8), %rsi
	cmpq	%rdx, %rsi
	setbe	%r9b
	cmpq	%r15, %rcx
	setbe	104(%rsp)               # 1-byte Folded Spill
	leaq	(%r10,%rbp,8), %r13
	cmpq	%rdx, %r13
	setbe	%r11b
	cmpq	%r10, %rcx
	setbe	%r12b
	cmpq	%rax, %rsi
	setbe	%r14b
	cmpq	%r15, %rbx
	setbe	%dl
	cmpq	%rax, %r13
	setbe	%dil
	cmpq	%r10, %rbx
	setbe	%bl
	cmpq	%r15, %r13
	setbe	%cl
	movq	%r10, 88(%rsp)          # 8-byte Spill
	cmpq	%r10, %rsi
	setbe	%al
	orb	%cl, %al
	cmpb	$1, %al
	jne	.LBB0_9
# BB#2:                                 # %polly.split_new_and_old
	orb	%dil, %bl
	je	.LBB0_9
# BB#3:                                 # %polly.split_new_and_old
	orb	%r14b, %dl
	je	.LBB0_9
# BB#4:                                 # %polly.split_new_and_old
	orb	%r11b, %r12b
	je	.LBB0_9
# BB#5:                                 # %polly.split_new_and_old
	orb	104(%rsp), %r9b         # 1-byte Folded Reload
	je	.LBB0_9
# BB#6:                                 # %polly.split_new_and_old
	movabsq	$9223372036854775807, %rax # imm = 0x7FFFFFFFFFFFFFFF
	cmpq	%rax, %rbp
	je	.LBB0_9
# BB#7:                                 # %polly.split_new_and_old
	movb	72(%rsp), %al           # 1-byte Reload
	orb	%al, 112(%rsp)          # 1-byte Folded Spill
	je	.LBB0_9
# BB#8:                                 # %polly.split_new_and_old
	orb	32(%rsp), %r8b          # 1-byte Folded Reload
	orb	40(%rsp), %r8b          # 1-byte Folded Reload
	xorb	$1, %r8b
	je	.LBB0_9
# BB#26:                                # %polly.loop_preheader
	leaq	8(,%rbp,8), %rbx
	leaq	-2(%rbp), %rax
	movq	%rax, 120(%rsp)         # 8-byte Spill
	xorl	%r12d, %r12d
	leaq	64(%rsp), %r14
	leaq	56(%rsp), %r13
	movq	80(%rsp), %r8           # 8-byte Reload
	movq	%rbp, 48(%rsp)          # 8-byte Spill
	movq	%rbx, 104(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB0_27:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_28 Depth 2
                                        #       Child Loop BB0_30 Depth 3
                                        #     Child Loop BB0_32 Depth 2
                                        #       Child Loop BB0_34 Depth 3
                                        #     Child Loop BB0_36 Depth 2
                                        #       Child Loop BB0_38 Depth 3
                                        #     Child Loop BB0_42 Depth 2
                                        #       Child Loop BB0_43 Depth 3
                                        #     Child Loop BB0_47 Depth 2
                                        #       Child Loop BB0_48 Depth 3
                                        #     Child Loop BB0_52 Depth 2
                                        #       Child Loop BB0_53 Depth 3
                                        #     Child Loop BB0_55 Depth 2
                                        #       Child Loop BB0_57 Depth 3
                                        #     Child Loop BB0_61 Depth 2
                                        #       Child Loop BB0_63 Depth 3
                                        #     Child Loop BB0_69 Depth 2
	movq	%r8, 112(%rsp)          # 8-byte Spill
	movq	%rbp, %r8
	subq	%r12, %r8
	movq	%rbp, (%rsp)
	movq	%r12, 8(%rsp)
	movq	%r15, 16(%rsp)
	movl	$findMoves_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	leaq	(%rsp), %rsi
	movq	%r8, 32(%rsp)           # 8-byte Spill
	callq	GOMP_parallel_loop_runtime_start
	movq	16(%rsp), %rbx
	jmp	.LBB0_28
	.p2align	4, 0x90
.LBB0_29:                               # %polly.par.loadIVBounds.i
                                        #   in Loop: Header=BB0_28 Depth=2
	movq	56(%rsp), %rax
	movq	64(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB0_30:                               # %polly.loop_header.i
                                        #   Parent Loop BB0_27 Depth=1
                                        #     Parent Loop BB0_28 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	$0, 8(%rbx,%rcx,8)
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB0_30
.LBB0_28:                               # %polly.par.checkNext.loopexit.i
                                        #   Parent Loop BB0_27 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_30 Depth 3
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_29
# BB#31:                                # %findMoves_polly_subfn.exit
                                        #   in Loop: Header=BB0_27 Depth=1
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movq	48(%rsp), %rax          # 8-byte Reload
	movq	%rax, (%rsp)
	movq	%r12, 8(%rsp)
	movq	88(%rsp), %rax          # 8-byte Reload
	movq	%rax, 16(%rsp)
	movl	$findMoves_polly_subfn_1, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	leaq	(%rsp), %rsi
	movq	32(%rsp), %r8           # 8-byte Reload
	callq	GOMP_parallel_loop_runtime_start
	movq	16(%rsp), %rbx
	jmp	.LBB0_32
	.p2align	4, 0x90
.LBB0_33:                               # %polly.par.loadIVBounds.i439
                                        #   in Loop: Header=BB0_32 Depth=2
	movq	56(%rsp), %rax
	movq	64(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB0_34:                               # %polly.loop_header.i444
                                        #   Parent Loop BB0_27 Depth=1
                                        #     Parent Loop BB0_32 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	$0, 8(%rbx,%rcx,8)
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB0_34
.LBB0_32:                               # %polly.par.checkNext.loopexit.i435
                                        #   Parent Loop BB0_27 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_34 Depth 3
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_33
# BB#35:                                # %findMoves_polly_subfn_1.exit
                                        #   in Loop: Header=BB0_27 Depth=1
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movq	48(%rsp), %rax          # 8-byte Reload
	movq	%rax, (%rsp)
	movq	%r12, 8(%rsp)
	movq	96(%rsp), %rax          # 8-byte Reload
	movq	%rax, 16(%rsp)
	movl	$findMoves_polly_subfn_2, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	leaq	(%rsp), %rsi
	movq	32(%rsp), %r8           # 8-byte Reload
	callq	GOMP_parallel_loop_runtime_start
	movq	16(%rsp), %rbx
	jmp	.LBB0_36
	.p2align	4, 0x90
.LBB0_37:                               # %polly.par.loadIVBounds.i451
                                        #   in Loop: Header=BB0_36 Depth=2
	movq	56(%rsp), %rax
	movq	64(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB0_38:                               # %polly.loop_header.i456
                                        #   Parent Loop BB0_27 Depth=1
                                        #     Parent Loop BB0_36 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	$0, 8(%rbx,%rcx,8)
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB0_38
.LBB0_36:                               # %polly.par.checkNext.loopexit.i447
                                        #   Parent Loop BB0_27 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_38 Depth 3
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_37
# BB#39:                                # %findMoves_polly_subfn_2.exit
                                        #   in Loop: Header=BB0_27 Depth=1
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movl	$1, %eax
	subq	%r12, %rax
	movl	$0, %ecx
	cmovnsq	%rax, %rcx
	movq	128(%rsp), %rax         # 8-byte Reload
	movq	32(%rsp), %rdx          # 8-byte Reload
	cmpq	%rdx, %rax
	movq	%rdx, %r8
	cmovleq	%rax, %r8
	movq	48(%rsp), %rax          # 8-byte Reload
	movq	%rax, (%rsp)
	movq	%r12, 40(%rsp)          # 8-byte Spill
	movq	%r12, 8(%rsp)
	movq	80(%rsp), %rax          # 8-byte Reload
	movq	%rax, 16(%rsp)
	movq	96(%rsp), %rax          # 8-byte Reload
	movq	%rax, 24(%rsp)
	movl	$findMoves_polly_subfn_3, %edi
	xorl	%edx, %edx
	movl	$1, %r9d
	leaq	(%rsp), %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	(%rsp), %rbp
	movq	8(%rsp), %r12
	movq	16(%rsp), %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	24(%rsp), %rbx
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB0_44
# BB#40:                                # %polly.par.loadIVBounds.preheader.i
                                        #   in Loop: Header=BB0_27 Depth=1
	movq	%rbp, %rax
	leaq	8(,%rax,8), %rbp
	addq	%rax, %r12
	movq	72(%rsp), %rax          # 8-byte Reload
	leaq	-8(%rax,%r12,8), %r12
	.p2align	4, 0x90
.LBB0_42:                               # %polly.par.loadIVBounds.i465
                                        #   Parent Loop BB0_27 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_43 Depth 3
	movq	56(%rsp), %rax
	movq	64(%rsp), %rcx
	addq	$-2, %rax
	movq	%rbp, %rdx
	imulq	%rcx, %rdx
	decq	%rcx
	addq	%r12, %rdx
	.p2align	4, 0x90
.LBB0_43:                               # %polly.loop_header.i469
                                        #   Parent Loop BB0_27 Depth=1
                                        #     Parent Loop BB0_42 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	(%rdx), %rsi
	movq	%rsi, 8(%rbx,%rcx,8)
	incq	%rcx
	addq	%rbp, %rdx
	cmpq	%rax, %rcx
	jle	.LBB0_43
# BB#41:                                # %polly.par.checkNext.loopexit.i461
                                        #   in Loop: Header=BB0_42 Depth=2
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_42
.LBB0_44:                               # %findMoves_polly_subfn_3.exit
                                        #   in Loop: Header=BB0_27 Depth=1
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movq	120(%rsp), %rax         # 8-byte Reload
	movq	32(%rsp), %rcx          # 8-byte Reload
	cmpq	%rcx, %rax
	movq	%rcx, %r8
	cmovleq	%rax, %r8
	movq	48(%rsp), %rax          # 8-byte Reload
	movq	%rax, (%rsp)
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	%rax, 8(%rsp)
	movq	80(%rsp), %rax          # 8-byte Reload
	movq	%rax, 16(%rsp)
	movq	%r15, 24(%rsp)
	movl	$findMoves_polly_subfn_4, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	leaq	(%rsp), %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	(%rsp), %rbp
	movq	8(%rsp), %r12
	movq	16(%rsp), %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	24(%rsp), %rbx
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB0_49
# BB#45:                                # %polly.par.loadIVBounds.preheader.i478
                                        #   in Loop: Header=BB0_27 Depth=1
	leaq	(%r12,%rbp,2), %rax
	leaq	8(,%rbp,8), %rbp
	movq	72(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rax,8), %r12
	.p2align	4, 0x90
.LBB0_47:                               # %polly.par.loadIVBounds.i483
                                        #   Parent Loop BB0_27 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_48 Depth 3
	movq	56(%rsp), %rax
	movq	64(%rsp), %rcx
	addq	$-2, %rax
	movq	%rbp, %rdx
	imulq	%rcx, %rdx
	decq	%rcx
	addq	%r12, %rdx
	.p2align	4, 0x90
.LBB0_48:                               # %polly.loop_header.i491
                                        #   Parent Loop BB0_27 Depth=1
                                        #     Parent Loop BB0_47 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	(%rdx), %rsi
	movq	%rsi, 8(%rbx,%rcx,8)
	incq	%rcx
	addq	%rbp, %rdx
	cmpq	%rax, %rcx
	jle	.LBB0_48
# BB#46:                                # %polly.par.checkNext.loopexit.i479
                                        #   in Loop: Header=BB0_47 Depth=2
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_47
.LBB0_49:                               # %findMoves_polly_subfn_4.exit
                                        #   in Loop: Header=BB0_27 Depth=1
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movl	$2, %eax
	movq	40(%rsp), %rdx          # 8-byte Reload
	subq	%rdx, %rax
	movl	$0, %ecx
	cmovnsq	%rax, %rcx
	movq	48(%rsp), %rax          # 8-byte Reload
	movq	%rax, (%rsp)
	movq	%rdx, 8(%rsp)
	movq	80(%rsp), %rax          # 8-byte Reload
	movq	%rax, 16(%rsp)
	movq	88(%rsp), %rax          # 8-byte Reload
	movq	%rax, 24(%rsp)
	movl	$findMoves_polly_subfn_5, %edi
	xorl	%edx, %edx
	movl	$1, %r9d
	leaq	(%rsp), %rsi
	movq	32(%rsp), %r8           # 8-byte Reload
	callq	GOMP_parallel_loop_runtime_start
	movq	(%rsp), %rbp
	movq	8(%rsp), %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	16(%rsp), %r12
	movq	24(%rsp), %rbx
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB0_54
# BB#50:                                # %polly.par.loadIVBounds.preheader.i500
                                        #   in Loop: Header=BB0_27 Depth=1
	leaq	8(,%rbp,8), %rbp
	movq	72(%rsp), %rax          # 8-byte Reload
	leaq	-16(%r12,%rax,8), %r12
	.p2align	4, 0x90
.LBB0_52:                               # %polly.par.loadIVBounds.i505
                                        #   Parent Loop BB0_27 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_53 Depth 3
	movq	56(%rsp), %rax
	movq	64(%rsp), %rcx
	addq	$-2, %rax
	movq	%rbp, %rdx
	imulq	%rcx, %rdx
	decq	%rcx
	addq	%r12, %rdx
	.p2align	4, 0x90
.LBB0_53:                               # %polly.loop_header.i513
                                        #   Parent Loop BB0_27 Depth=1
                                        #     Parent Loop BB0_52 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	(%rdx), %rsi
	movq	%rsi, 8(%rbx,%rcx,8)
	incq	%rcx
	addq	%rbp, %rdx
	cmpq	%rax, %rcx
	jle	.LBB0_53
# BB#51:                                # %polly.par.checkNext.loopexit.i501
                                        #   in Loop: Header=BB0_52 Depth=2
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_52
.LBB0_54:                               # %findMoves_polly_subfn_5.exit
                                        #   in Loop: Header=BB0_27 Depth=1
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movq	48(%rsp), %rax          # 8-byte Reload
	movq	%rax, (%rsp)
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	%rax, 8(%rsp)
	movq	%r15, 16(%rsp)
	movq	96(%rsp), %rax          # 8-byte Reload
	movq	%rax, 24(%rsp)
	movl	$findMoves_polly_subfn_6, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	leaq	(%rsp), %rsi
	movq	32(%rsp), %r8           # 8-byte Reload
	callq	GOMP_parallel_loop_runtime_start
	movq	16(%rsp), %rbx
	movq	24(%rsp), %r12
	jmp	.LBB0_55
	.p2align	4, 0x90
.LBB0_56:                               # %polly.par.loadIVBounds.i522
                                        #   in Loop: Header=BB0_55 Depth=2
	movq	56(%rsp), %rax
	movq	64(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB0_57:                               # %polly.loop_header.i527
                                        #   Parent Loop BB0_27 Depth=1
                                        #     Parent Loop BB0_55 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	8(%r12,%rcx,8), %rdx
	cmpq	%rdx, 8(%rbx,%rcx,8)
	jle	.LBB0_59
# BB#58:                                # %polly.stmt.if.end78.i
                                        #   in Loop: Header=BB0_57 Depth=3
	movq	%rdx, 8(%rbx,%rcx,8)
.LBB0_59:                               # %polly.stmt.blklab7.exit.i
                                        #   in Loop: Header=BB0_57 Depth=3
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB0_57
.LBB0_55:                               # %polly.par.checkNext.loopexit.i518
                                        #   Parent Loop BB0_27 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_57 Depth 3
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_56
# BB#60:                                # %findMoves_polly_subfn_6.exit
                                        #   in Loop: Header=BB0_27 Depth=1
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movq	48(%rsp), %rax          # 8-byte Reload
	movq	%rax, (%rsp)
	movq	40(%rsp), %r12          # 8-byte Reload
	movq	%r12, 8(%rsp)
	movq	88(%rsp), %rax          # 8-byte Reload
	movq	%rax, 16(%rsp)
	movq	96(%rsp), %rax          # 8-byte Reload
	movq	%rax, 24(%rsp)
	movl	$findMoves_polly_subfn_7, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	leaq	(%rsp), %rsi
	movq	32(%rsp), %r8           # 8-byte Reload
	callq	GOMP_parallel_loop_runtime_start
	movq	16(%rsp), %rbx
	movq	24(%rsp), %rbp
	jmp	.LBB0_61
	.p2align	4, 0x90
.LBB0_62:                               # %polly.par.loadIVBounds.i538
                                        #   in Loop: Header=BB0_61 Depth=2
	movq	56(%rsp), %rax
	movq	64(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB0_63:                               # %polly.loop_header.i544
                                        #   Parent Loop BB0_27 Depth=1
                                        #     Parent Loop BB0_61 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	8(%rbp,%rcx,8), %rdx
	cmpq	%rdx, 8(%rbx,%rcx,8)
	jle	.LBB0_65
# BB#64:                                # %polly.stmt.if.end86.i
                                        #   in Loop: Header=BB0_63 Depth=3
	movq	%rdx, 8(%rbx,%rcx,8)
.LBB0_65:                               # %polly.stmt.blklab8.exit.i
                                        #   in Loop: Header=BB0_63 Depth=3
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB0_63
.LBB0_61:                               # %polly.par.checkNext.loopexit.i534
                                        #   Parent Loop BB0_27 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_63 Depth 3
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_62
# BB#66:                                # %findMoves_polly_subfn_7.exit
                                        #   in Loop: Header=BB0_27 Depth=1
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movq	32(%rsp), %rbp          # 8-byte Reload
	testq	%rbp, %rbp
	movq	88(%rsp), %rax          # 8-byte Reload
	movq	104(%rsp), %rbx         # 8-byte Reload
	movq	112(%rsp), %r8          # 8-byte Reload
	jle	.LBB0_67
# BB#68:                                # %polly.loop_preheader421
                                        #   in Loop: Header=BB0_27 Depth=1
	decq	%rbp
	movq	%r8, %rdi
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_69:                               # %polly.loop_header420
                                        #   Parent Loop BB0_27 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%r15,%rcx,8), %rdx
	addq	%rcx, %rdx
	leaq	(%r12,%rcx), %rsi
	addq	(%rax,%rcx,8), %rsi
	cmpq	%rsi, %rdx
	cmovgeq	%rdx, %rsi
	movq	%rsi, (%rdi)
	addq	%rbx, %rdi
	cmpq	%rbp, %rcx
	leaq	1(%rcx), %rcx
	jl	.LBB0_69
.LBB0_67:                               # %polly.loop_exit422
                                        #   in Loop: Header=BB0_27 Depth=1
	incq	%r12
	addq	$8, %r8
	movq	48(%rsp), %rbp          # 8-byte Reload
	cmpq	%rbp, %r12
	jne	.LBB0_27
	jmp	.LBB0_25
.LBB0_9:                                # %while.cond32.preheader.preheader
	leaq	(,%rbp,8), %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	leaq	8(,%rbp,8), %r11
	movq	%rbp, %r10
	shlq	$4, %r10
	xorl	%r14d, %r14d
	movq	80(%rsp), %rcx          # 8-byte Reload
	movq	%rbp, %r12
	movq	%rbp, %r13
	movq	88(%rsp), %rax          # 8-byte Reload
	movq	96(%rsp), %r8           # 8-byte Reload
	.p2align	4, 0x90
.LBB0_10:                               # %while.cond32.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_11 Depth 2
	movq	%rcx, 40(%rsp)          # 8-byte Spill
	movq	%rcx, %rdi
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_11:                               # %if.end37
                                        #   Parent Loop BB0_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	(%r14,%rdx), %rbx
	movq	$0, (%r8,%rdx,8)
	leaq	1(%rdx), %r9
	testq	%rbx, %rbx
	jle	.LBB0_14
# BB#12:                                # %if.end37
                                        #   in Loop: Header=BB0_11 Depth=2
	cmpq	%r13, %r9
	jge	.LBB0_14
# BB#13:                                # %if.end45
                                        #   in Loop: Header=BB0_11 Depth=2
	movq	32(%rsp), %rcx          # 8-byte Reload
	movq	-8(%rcx,%rdi), %rcx
	movq	%rcx, (%r8,%rdx,8)
.LBB0_14:                               # %blklab4
                                        #   in Loop: Header=BB0_11 Depth=2
	movq	$0, (%r15,%rdx,8)
	leaq	2(%rdx), %rcx
	cmpq	%r13, %rcx
	jge	.LBB0_16
# BB#15:                                # %if.end56
                                        #   in Loop: Header=BB0_11 Depth=2
	movq	(%r10,%rdi), %rcx
	movq	%rcx, (%r15,%rdx,8)
.LBB0_16:                               # %blklab5
                                        #   in Loop: Header=BB0_11 Depth=2
	movq	$0, (%rax,%rdx,8)
	cmpq	$2, %rbx
	movl	$0, %ecx
	jl	.LBB0_18
# BB#17:                                # %if.end67
                                        #   in Loop: Header=BB0_11 Depth=2
	movq	-16(%rdi), %rcx
	movq	%rcx, (%rax,%rdx,8)
.LBB0_18:                               # %blklab6
                                        #   in Loop: Header=BB0_11 Depth=2
	movq	(%r15,%rdx,8), %rbp
	movq	(%r8,%rdx,8), %rsi
	cmpq	%rsi, %rbp
	jle	.LBB0_19
# BB#20:                                # %if.end78
                                        #   in Loop: Header=BB0_11 Depth=2
	movq	%rsi, (%r15,%rdx,8)
	movq	88(%rsp), %rax          # 8-byte Reload
	movq	(%rax,%rdx,8), %rcx
	movq	%rsi, %rbp
	movq	(%r8,%rdx,8), %rsi
	jmp	.LBB0_21
	.p2align	4, 0x90
.LBB0_19:                               #   in Loop: Header=BB0_11 Depth=2
	movq	88(%rsp), %rax          # 8-byte Reload
.LBB0_21:                               # %blklab7
                                        #   in Loop: Header=BB0_11 Depth=2
	cmpq	%rsi, %rcx
	jle	.LBB0_23
# BB#22:                                # %if.end86
                                        #   in Loop: Header=BB0_11 Depth=2
	movq	%rsi, (%rax,%rdx,8)
	movq	(%r15,%rdx,8), %rbp
.LBB0_23:                               # %blklab8
                                        #   in Loop: Header=BB0_11 Depth=2
	addq	%rbp, %rdx
	notq	%rsi
	notq	%rcx
	cmpq	%rcx, %rsi
	cmovgeq	%rsi, %rcx
	subq	%rcx, %rbx
	decq	%rbx
	cmpq	%rbx, %rdx
	cmovgeq	%rdx, %rbx
	movq	%rbx, (%rdi)
	addq	%r11, %rdi
	cmpq	%r9, %r12
	movq	%r9, %rdx
	jne	.LBB0_11
# BB#24:                                # %blklab2
                                        #   in Loop: Header=BB0_10 Depth=1
	incq	%r14
	decq	%r12
	movq	40(%rsp), %rcx          # 8-byte Reload
	addq	$8, %rcx
	cmpq	%r13, %r14
	jne	.LBB0_10
.LBB0_25:                               # %if.then114
	movq	%r15, %rdi
	movq	%rax, %rbx
	callq	free
	movq	96(%rsp), %rdi          # 8-byte Reload
	callq	free
	movq	%rbx, %rdi
	callq	free
	movq	80(%rsp), %rax          # 8-byte Reload
	addq	$136, %rsp
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
	movq	%rax, %r12
	testq	%r12, %r12
	jne	.LBB1_1
# BB#2:                                 # %if.end144.critedge
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	free2DArray
	xorl	%edi, %edi
	callq	exit
.LBB1_1:                                # %if.then122
	movq	(%r12), %rbx
	movl	%ebx, %esi
	imull	%esi, %esi
	xorl	%edi, %edi
	callq	create1DArray
	xorl	%edx, %edx
	movq	%rax, %rdi
	movq	%rbx, %rcx
	callq	findMoves
	movq	%rax, %r13
	movq	-8(%r13,%rbx,8), %rbp
	xorl	%edi, %edi
	movl	$50, %esi
	callq	create1DArray
	movq	%rax, %rbx
	movaps	.LCPI1_0(%rip), %xmm0   # xmm0 = [84,104]
	movups	%xmm0, (%rbx)
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [101,32]
	movups	%xmm0, 16(%rbx)
	movaps	%xmm0, %xmm1
	movaps	.LCPI1_2(%rip), %xmm0   # xmm0 = [116,111]
	movups	%xmm0, 32(%rbx)
	movaps	.LCPI1_3(%rip), %xmm0   # xmm0 = [116,97]
	movups	%xmm0, 48(%rbx)
	movaps	.LCPI1_4(%rip), %xmm0   # xmm0 = [108,32]
	movups	%xmm0, 64(%rbx)
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [97,109]
	movups	%xmm0, 80(%rbx)
	movaps	.LCPI1_6(%rip), %xmm0   # xmm0 = [111,117]
	movups	%xmm0, 96(%rbx)
	movaps	.LCPI1_7(%rip), %xmm0   # xmm0 = [110,116]
	movups	%xmm0, 112(%rbx)
	movaps	.LCPI1_8(%rip), %xmm0   # xmm0 = [32,111]
	movups	%xmm0, 128(%rbx)
	movaps	.LCPI1_9(%rip), %xmm0   # xmm0 = [102,32]
	movups	%xmm0, 144(%rbx)
	movaps	.LCPI1_10(%rip), %xmm0  # xmm0 = [109,111]
	movups	%xmm0, 160(%rbx)
	movaps	.LCPI1_11(%rip), %xmm0  # xmm0 = [110,101]
	movups	%xmm0, 176(%rbx)
	movaps	.LCPI1_12(%rip), %xmm0  # xmm0 = [121,32]
	movups	%xmm0, 192(%rbx)
	movaps	.LCPI1_13(%rip), %xmm0  # xmm0 = [40,109]
	movups	%xmm0, 208(%rbx)
	movaps	.LCPI1_14(%rip), %xmm0  # xmm0 = [97,120]
	movups	%xmm0, 224(%rbx)
	movaps	.LCPI1_15(%rip), %xmm0  # xmm0 = [105,109]
	movups	%xmm0, 240(%rbx)
	movaps	.LCPI1_16(%rip), %xmm0  # xmm0 = [117,109]
	movups	%xmm0, 256(%rbx)
	movaps	.LCPI1_17(%rip), %xmm0  # xmm0 = [41,32]
	movups	%xmm0, 272(%rbx)
	movaps	.LCPI1_18(%rip), %xmm0  # xmm0 = [65,108]
	movups	%xmm0, 288(%rbx)
	movaps	.LCPI1_19(%rip), %xmm0  # xmm0 = [105,99]
	movups	%xmm0, 304(%rbx)
	movups	%xmm1, 320(%rbx)
	movaps	.LCPI1_20(%rip), %xmm0  # xmm0 = [103,101]
	movups	%xmm0, 336(%rbx)
	movaps	.LCPI1_21(%rip), %xmm0  # xmm0 = [116,115]
	movups	%xmm0, 352(%rbx)
	movaps	.LCPI1_22(%rip), %xmm0  # xmm0 = [32,105]
	movups	%xmm0, 368(%rbx)
	movaps	.LCPI1_23(%rip), %xmm0  # xmm0 = [115,32]
	movups	%xmm0, 384(%rbx)
	movl	$50, %esi
	movq	%rbx, %rdi
	callq	printf_s
	movl	$.L.str, %edi
	xorl	%eax, %eax
	movq	%rbp, %rsi
	callq	printf
	xorl	%edi, %edi
	movl	$23, %esi
	callq	create1DArray
	movq	%rax, %rbp
	movaps	.LCPI1_24(%rip), %xmm0  # xmm0 = [80,97]
	movups	%xmm0, (%rbp)
	movaps	.LCPI1_25(%rip), %xmm0  # xmm0 = [115,115]
	movups	%xmm0, 16(%rbp)
	movaps	.LCPI1_26(%rip), %xmm0  # xmm0 = [32,67]
	movups	%xmm0, 32(%rbp)
	movaps	.LCPI1_27(%rip), %xmm0  # xmm0 = [111,105]
	movups	%xmm0, 48(%rbp)
	movaps	.LCPI1_28(%rip), %xmm0  # xmm0 = [110,71]
	movups	%xmm0, 64(%rbp)
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [97,109]
	movups	%xmm0, 80(%rbp)
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [101,32]
	movups	%xmm0, 96(%rbp)
	movaps	.LCPI1_29(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 112(%rbp)
	movaps	.LCPI1_30(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 128(%rbp)
	movaps	.LCPI1_31(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 144(%rbp)
	movaps	.LCPI1_32(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 160(%rbp)
	movq	$101, 176(%rbp)
	movl	$23, %esi
	movq	%rbp, %rdi
	callq	println_s
	movq	%r12, %rdi
	callq	free
	movq	%r13, %rdi
	callq	free
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	free2DArray
	movq	%rbx, %rdi
	callq	free
	movq	%rbp, %rdi
	callq	free
	xorl	%edi, %edi
	callq	exit
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc

	.p2align	4, 0x90
	.type	findMoves_polly_subfn,@function
findMoves_polly_subfn:                  # @findMoves_polly_subfn
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp26:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp27:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp28:
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
.Ltmp29:
	.cfi_def_cfa_offset 48
.Ltmp30:
	.cfi_offset %rbx, -32
.Ltmp31:
	.cfi_offset %r14, -24
.Ltmp32:
	.cfi_offset %r15, -16
	movq	16(%rdi), %rbx
	leaq	8(%rsp), %rdi
	leaq	(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB2_2
# BB#1:
	leaq	8(%rsp), %r14
	leaq	(%rsp), %r15
	.p2align	4, 0x90
.LBB2_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_5 Depth 2
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB2_5:                                # %polly.loop_header
                                        #   Parent Loop BB2_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	$0, 8(%rbx,%rcx,8)
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB2_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB2_4 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB2_4
.LBB2_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Lfunc_end2:
	.size	findMoves_polly_subfn, .Lfunc_end2-findMoves_polly_subfn
	.cfi_endproc

	.p2align	4, 0x90
	.type	findMoves_polly_subfn_1,@function
findMoves_polly_subfn_1:                # @findMoves_polly_subfn_1
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp33:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp34:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp35:
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
.Ltmp36:
	.cfi_def_cfa_offset 48
.Ltmp37:
	.cfi_offset %rbx, -32
.Ltmp38:
	.cfi_offset %r14, -24
.Ltmp39:
	.cfi_offset %r15, -16
	movq	16(%rdi), %rbx
	leaq	8(%rsp), %rdi
	leaq	(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB3_2
# BB#1:
	leaq	8(%rsp), %r14
	leaq	(%rsp), %r15
	.p2align	4, 0x90
.LBB3_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_5 Depth 2
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB3_5:                                # %polly.loop_header
                                        #   Parent Loop BB3_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	$0, 8(%rbx,%rcx,8)
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB3_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB3_4 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB3_4
.LBB3_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Lfunc_end3:
	.size	findMoves_polly_subfn_1, .Lfunc_end3-findMoves_polly_subfn_1
	.cfi_endproc

	.p2align	4, 0x90
	.type	findMoves_polly_subfn_2,@function
findMoves_polly_subfn_2:                # @findMoves_polly_subfn_2
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp40:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp41:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp42:
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
.Ltmp43:
	.cfi_def_cfa_offset 48
.Ltmp44:
	.cfi_offset %rbx, -32
.Ltmp45:
	.cfi_offset %r14, -24
.Ltmp46:
	.cfi_offset %r15, -16
	movq	16(%rdi), %rbx
	leaq	8(%rsp), %rdi
	leaq	(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB4_2
# BB#1:
	leaq	8(%rsp), %r14
	leaq	(%rsp), %r15
	.p2align	4, 0x90
.LBB4_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_5 Depth 2
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB4_5:                                # %polly.loop_header
                                        #   Parent Loop BB4_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	$0, 8(%rbx,%rcx,8)
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB4_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB4_4 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB4_4
.LBB4_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Lfunc_end4:
	.size	findMoves_polly_subfn_2, .Lfunc_end4-findMoves_polly_subfn_2
	.cfi_endproc

	.p2align	4, 0x90
	.type	findMoves_polly_subfn_3,@function
findMoves_polly_subfn_3:                # @findMoves_polly_subfn_3
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp47:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp48:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp49:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp50:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp51:
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
.Ltmp52:
	.cfi_def_cfa_offset 64
.Ltmp53:
	.cfi_offset %rbx, -48
.Ltmp54:
	.cfi_offset %r12, -40
.Ltmp55:
	.cfi_offset %r13, -32
.Ltmp56:
	.cfi_offset %r14, -24
.Ltmp57:
	.cfi_offset %r15, -16
	movq	(%rdi), %rbx
	movq	8(%rdi), %r14
	movq	16(%rdi), %r15
	movq	24(%rdi), %r12
	leaq	8(%rsp), %rdi
	leaq	(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB5_2
# BB#1:                                 # %polly.par.loadIVBounds.preheader
	addq	%rbx, %r14
	leaq	8(,%rbx,8), %rbx
	leaq	-8(%r15,%r14,8), %r13
	leaq	8(%rsp), %r14
	leaq	(%rsp), %r15
	.p2align	4, 0x90
.LBB5_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_5 Depth 2
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	addq	$-2, %rax
	movq	%rbx, %rdx
	imulq	%rcx, %rdx
	decq	%rcx
	addq	%r13, %rdx
	.p2align	4, 0x90
.LBB5_5:                                # %polly.loop_header
                                        #   Parent Loop BB5_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rdx), %rsi
	movq	%rsi, 8(%r12,%rcx,8)
	incq	%rcx
	addq	%rbx, %rdx
	cmpq	%rax, %rcx
	jle	.LBB5_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB5_4 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB5_4
.LBB5_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
.Lfunc_end5:
	.size	findMoves_polly_subfn_3, .Lfunc_end5-findMoves_polly_subfn_3
	.cfi_endproc

	.p2align	4, 0x90
	.type	findMoves_polly_subfn_4,@function
findMoves_polly_subfn_4:                # @findMoves_polly_subfn_4
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp58:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp59:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp60:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp61:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp62:
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
.Ltmp63:
	.cfi_def_cfa_offset 64
.Ltmp64:
	.cfi_offset %rbx, -48
.Ltmp65:
	.cfi_offset %r12, -40
.Ltmp66:
	.cfi_offset %r13, -32
.Ltmp67:
	.cfi_offset %r14, -24
.Ltmp68:
	.cfi_offset %r15, -16
	movq	(%rdi), %rbx
	movq	8(%rdi), %r15
	movq	16(%rdi), %r14
	movq	24(%rdi), %r12
	leaq	8(%rsp), %rdi
	leaq	(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB6_2
# BB#1:                                 # %polly.par.loadIVBounds.preheader
	leaq	(%r15,%rbx,2), %rax
	leaq	8(,%rbx,8), %rbx
	leaq	(%r14,%rax,8), %r13
	leaq	8(%rsp), %r14
	leaq	(%rsp), %r15
	.p2align	4, 0x90
.LBB6_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_5 Depth 2
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	addq	$-2, %rax
	movq	%rbx, %rdx
	imulq	%rcx, %rdx
	decq	%rcx
	addq	%r13, %rdx
	.p2align	4, 0x90
.LBB6_5:                                # %polly.loop_header
                                        #   Parent Loop BB6_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rdx), %rsi
	movq	%rsi, 8(%r12,%rcx,8)
	incq	%rcx
	addq	%rbx, %rdx
	cmpq	%rax, %rcx
	jle	.LBB6_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB6_4 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB6_4
.LBB6_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
.Lfunc_end6:
	.size	findMoves_polly_subfn_4, .Lfunc_end6-findMoves_polly_subfn_4
	.cfi_endproc

	.p2align	4, 0x90
	.type	findMoves_polly_subfn_5,@function
findMoves_polly_subfn_5:                # @findMoves_polly_subfn_5
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp69:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp70:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp71:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp72:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp73:
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
.Ltmp74:
	.cfi_def_cfa_offset 64
.Ltmp75:
	.cfi_offset %rbx, -48
.Ltmp76:
	.cfi_offset %r12, -40
.Ltmp77:
	.cfi_offset %r13, -32
.Ltmp78:
	.cfi_offset %r14, -24
.Ltmp79:
	.cfi_offset %r15, -16
	movq	(%rdi), %rbx
	movq	8(%rdi), %r14
	movq	16(%rdi), %r15
	movq	24(%rdi), %r12
	leaq	8(%rsp), %rdi
	leaq	(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB7_2
# BB#1:                                 # %polly.par.loadIVBounds.preheader
	leaq	8(,%rbx,8), %rbx
	leaq	-16(%r15,%r14,8), %r13
	leaq	8(%rsp), %r14
	leaq	(%rsp), %r15
	.p2align	4, 0x90
.LBB7_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_5 Depth 2
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	addq	$-2, %rax
	movq	%rbx, %rdx
	imulq	%rcx, %rdx
	decq	%rcx
	addq	%r13, %rdx
	.p2align	4, 0x90
.LBB7_5:                                # %polly.loop_header
                                        #   Parent Loop BB7_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rdx), %rsi
	movq	%rsi, 8(%r12,%rcx,8)
	incq	%rcx
	addq	%rbx, %rdx
	cmpq	%rax, %rcx
	jle	.LBB7_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB7_4 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB7_4
.LBB7_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
.Lfunc_end7:
	.size	findMoves_polly_subfn_5, .Lfunc_end7-findMoves_polly_subfn_5
	.cfi_endproc

	.p2align	4, 0x90
	.type	findMoves_polly_subfn_6,@function
findMoves_polly_subfn_6:                # @findMoves_polly_subfn_6
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp80:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp81:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp82:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp83:
	.cfi_def_cfa_offset 40
	subq	$24, %rsp
.Ltmp84:
	.cfi_def_cfa_offset 64
.Ltmp85:
	.cfi_offset %rbx, -40
.Ltmp86:
	.cfi_offset %r12, -32
.Ltmp87:
	.cfi_offset %r14, -24
.Ltmp88:
	.cfi_offset %r15, -16
	movq	16(%rdi), %rbx
	movq	24(%rdi), %r12
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB8_2
# BB#1:
	leaq	16(%rsp), %r14
	leaq	8(%rsp), %r15
	.p2align	4, 0x90
.LBB8_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_5 Depth 2
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB8_5:                                # %polly.loop_header
                                        #   Parent Loop BB8_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%r12,%rcx,8), %rdx
	cmpq	%rdx, 8(%rbx,%rcx,8)
	jle	.LBB8_7
# BB#6:                                 # %polly.stmt.if.end78
                                        #   in Loop: Header=BB8_5 Depth=2
	movq	%rdx, 8(%rbx,%rcx,8)
.LBB8_7:                                # %polly.stmt.blklab7.exit
                                        #   in Loop: Header=BB8_5 Depth=2
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB8_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB8_4 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB8_4
.LBB8_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Lfunc_end8:
	.size	findMoves_polly_subfn_6, .Lfunc_end8-findMoves_polly_subfn_6
	.cfi_endproc

	.p2align	4, 0x90
	.type	findMoves_polly_subfn_7,@function
findMoves_polly_subfn_7:                # @findMoves_polly_subfn_7
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp89:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp90:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp91:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp92:
	.cfi_def_cfa_offset 40
	subq	$24, %rsp
.Ltmp93:
	.cfi_def_cfa_offset 64
.Ltmp94:
	.cfi_offset %rbx, -40
.Ltmp95:
	.cfi_offset %r12, -32
.Ltmp96:
	.cfi_offset %r14, -24
.Ltmp97:
	.cfi_offset %r15, -16
	movq	16(%rdi), %rbx
	movq	24(%rdi), %r12
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB9_2
# BB#1:
	leaq	16(%rsp), %r14
	leaq	8(%rsp), %r15
	.p2align	4, 0x90
.LBB9_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB9_5 Depth 2
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB9_5:                                # %polly.loop_header
                                        #   Parent Loop BB9_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%r12,%rcx,8), %rdx
	cmpq	%rdx, 8(%rbx,%rcx,8)
	jle	.LBB9_7
# BB#6:                                 # %polly.stmt.if.end86
                                        #   in Loop: Header=BB9_5 Depth=2
	movq	%rdx, 8(%rbx,%rcx,8)
.LBB9_7:                                # %polly.stmt.blklab8.exit
                                        #   in Loop: Header=BB9_5 Depth=2
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB9_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB9_4 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB9_4
.LBB9_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Lfunc_end9:
	.size	findMoves_polly_subfn_7, .Lfunc_end9-findMoves_polly_subfn_7
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%lld\n"
	.size	.L.str, 6


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git aec29e5973c27bcbc3c1cf54295e3778050a73cd) (http://llvm.org/git/llvm.git 4c6356e8c64e246972f760a1f05bc0f365b090ad)"
	.section	".note.GNU-stack","",@progbits
