	.text
	.file	"llvm/CoinGame_array.openmp.ll"
	.globl	findMoves
	.p2align	4, 0x90
	.type	findMoves,@function
findMoves:                              # @findMoves
.Lfunc_begin0:
	.file	1 "CoinGame_array.c"
	.loc	1 2 0                   # CoinGame_array.c:2:0
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
	#DEBUG_VALUE: findMoves:moves <- %RDI
	#DEBUG_VALUE: findMoves:moves_size <- %RSI
	#DEBUG_VALUE: findMoves:moves_dealloc [bit_piece offset=0 size=1] <- %EDX
	#DEBUG_VALUE: findMoves:n <- %RCX
.Ltmp13:
	#DEBUG_VALUE: findMoves:_10_size <- %RCX
	#DEBUG_VALUE: findMoves:x_size <- %RCX
	#DEBUG_VALUE: findMoves:_12_size <- %RCX
	#DEBUG_VALUE: findMoves:y_size <- %RCX
	#DEBUG_VALUE: findMoves:_14_size <- %RCX
	#DEBUG_VALUE: findMoves:z_size <- %RCX
	movq	%rcx, %rbp
.Ltmp14:
	#DEBUG_VALUE: findMoves:z_size <- %RBP
	#DEBUG_VALUE: findMoves:_14_size <- %RBP
	#DEBUG_VALUE: findMoves:y_size <- %RBP
	#DEBUG_VALUE: findMoves:_12_size <- %RBP
	#DEBUG_VALUE: findMoves:x_size <- %RBP
	#DEBUG_VALUE: findMoves:_10_size <- %RBP
	#DEBUG_VALUE: findMoves:n <- %RBP
	movq	%rdi, 80(%rsp)          # 8-byte Spill
.Ltmp15:
	#DEBUG_VALUE: findMoves:_70 <- 0
	#DEBUG_VALUE: findMoves:_69 <- 0
	#DEBUG_VALUE: findMoves:_68 <- 0
	#DEBUG_VALUE: findMoves:_67 <- 0
	#DEBUG_VALUE: findMoves:_66 <- 0
	#DEBUG_VALUE: findMoves:_65 <- 0
	#DEBUG_VALUE: findMoves:_64 <- 0
	#DEBUG_VALUE: findMoves:_63 <- 0
	#DEBUG_VALUE: findMoves:_62 <- 0
	#DEBUG_VALUE: findMoves:_61 <- 0
	#DEBUG_VALUE: findMoves:_60 <- 0
	#DEBUG_VALUE: findMoves:_59 <- 0
	#DEBUG_VALUE: findMoves:_58 <- 0
	#DEBUG_VALUE: findMoves:_57 <- 0
	#DEBUG_VALUE: findMoves:_56 <- 0
	#DEBUG_VALUE: findMoves:_55 <- 0
	#DEBUG_VALUE: findMoves:_54 <- 0
	#DEBUG_VALUE: findMoves:_53 <- 0
	#DEBUG_VALUE: findMoves:_52 <- 0
	#DEBUG_VALUE: findMoves:_51 <- 0
	#DEBUG_VALUE: findMoves:_50 <- 0
	#DEBUG_VALUE: findMoves:_49 <- 0
	#DEBUG_VALUE: findMoves:_48 <- 0
	#DEBUG_VALUE: findMoves:_47 <- 0
	#DEBUG_VALUE: findMoves:_46 <- 0
	#DEBUG_VALUE: findMoves:_45 <- 0
	#DEBUG_VALUE: findMoves:_44 <- 0
	#DEBUG_VALUE: findMoves:_43 <- 0
	#DEBUG_VALUE: findMoves:_42 <- 0
	#DEBUG_VALUE: findMoves:_41 <- 0
	#DEBUG_VALUE: findMoves:_40 <- 0
	#DEBUG_VALUE: findMoves:_39 <- 0
	#DEBUG_VALUE: findMoves:_38 <- 0
	#DEBUG_VALUE: findMoves:_37 <- 0
	#DEBUG_VALUE: findMoves:_36 <- 0
	#DEBUG_VALUE: findMoves:_35 <- 0
	#DEBUG_VALUE: findMoves:_34 <- 0
	#DEBUG_VALUE: findMoves:_33 <- 0
	#DEBUG_VALUE: findMoves:_32 <- 0
	#DEBUG_VALUE: findMoves:_31 <- 0
	#DEBUG_VALUE: findMoves:_30 <- 0
	#DEBUG_VALUE: findMoves:_29 <- 0
	#DEBUG_VALUE: findMoves:_28 <- 0
	#DEBUG_VALUE: findMoves:_27 <- 0
	#DEBUG_VALUE: findMoves:_26 <- 0
	#DEBUG_VALUE: findMoves:_25 <- 0
	#DEBUG_VALUE: findMoves:_24 <- 0
	#DEBUG_VALUE: findMoves:_23 <- 0
	#DEBUG_VALUE: findMoves:_22 <- 0
	#DEBUG_VALUE: findMoves:_21 <- 0
	#DEBUG_VALUE: findMoves:_20 <- 0
	#DEBUG_VALUE: findMoves:_19 <- 0
	#DEBUG_VALUE: findMoves:_18 <- 0
	#DEBUG_VALUE: findMoves:_17 <- 0
	#DEBUG_VALUE: findMoves:_16 <- 0
	#DEBUG_VALUE: findMoves:_15 <- 0
	#DEBUG_VALUE: findMoves:_14_dealloc <- 0
	#DEBUG_VALUE: findMoves:_13 <- 0
	#DEBUG_VALUE: findMoves:_12_dealloc <- 0
	#DEBUG_VALUE: findMoves:_11 <- 0
	#DEBUG_VALUE: findMoves:_10_dealloc <- 0
	#DEBUG_VALUE: findMoves:_9 <- 0
	#DEBUG_VALUE: findMoves:i <- 0
	#DEBUG_VALUE: findMoves:j <- 0
	#DEBUG_VALUE: findMoves:s <- 0
	#DEBUG_VALUE: findMoves:z_dealloc <- 0
	#DEBUG_VALUE: findMoves:y_dealloc <- 0
	#DEBUG_VALUE: findMoves:x_dealloc <- 0
	#DEBUG_VALUE: findMoves:_2_dealloc <- 0
	#DEBUG_VALUE: findMoves:_2_size <- 0
	#DEBUG_VALUE: findMoves:z_size <- 0
	#DEBUG_VALUE: findMoves:_14_size <- 0
	#DEBUG_VALUE: findMoves:y_size <- 0
	#DEBUG_VALUE: findMoves:_12_size <- 0
	#DEBUG_VALUE: findMoves:x_size <- 0
	#DEBUG_VALUE: findMoves:_10_size <- 0
	#DEBUG_VALUE: findMoves:moves <- [%RSP+80]
	.loc	1 83 2 prologue_end     # CoinGame_array.c:83:2
	xorl	%edi, %edi
	movl	%ebp, %esi
.Ltmp16:
	callq	create1DArray
.Ltmp17:
	movq	%rax, %r15
.Ltmp18:
	#DEBUG_VALUE: findMoves:_10 <- %R15
	#DEBUG_VALUE: findMoves:x <- %R15
	#DEBUG_VALUE: findMoves:x_dealloc <- 1
	.loc	1 93 2                  # CoinGame_array.c:93:2
	xorl	%edi, %edi
	movl	%ebp, %esi
	callq	create1DArray
	movq	%rax, 96(%rsp)          # 8-byte Spill
.Ltmp19:
	#DEBUG_VALUE: findMoves:_12 <- [%RSP+96]
	#DEBUG_VALUE: findMoves:y <- [%RSP+96]
	#DEBUG_VALUE: findMoves:y_dealloc <- 1
	.loc	1 103 2                 # CoinGame_array.c:103:2
	xorl	%edi, %edi
	movl	%ebp, %esi
	callq	create1DArray
.Ltmp20:
	#DEBUG_VALUE: findMoves:_14 <- %RAX
	#DEBUG_VALUE: findMoves:z <- %RAX
	#DEBUG_VALUE: findMoves:z_dealloc <- 1
	.loc	1 116 6                 # CoinGame_array.c:116:6
	testq	%rbp, %rbp
	jle	.LBB0_25
.Ltmp21:
# BB#1:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:z <- %RAX
	#DEBUG_VALUE: findMoves:_14 <- %RAX
	#DEBUG_VALUE: findMoves:x <- %R15
	#DEBUG_VALUE: findMoves:_10 <- %R15
	#DEBUG_VALUE: findMoves:n <- %RBP
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
.Ltmp22:
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
.Ltmp23:
# BB#2:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:x <- %R15
	#DEBUG_VALUE: findMoves:_10 <- %R15
	#DEBUG_VALUE: findMoves:n <- %RBP
	orb	%dil, %bl
	je	.LBB0_9
.Ltmp24:
# BB#3:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:x <- %R15
	#DEBUG_VALUE: findMoves:_10 <- %R15
	#DEBUG_VALUE: findMoves:n <- %RBP
	orb	%r14b, %dl
	je	.LBB0_9
.Ltmp25:
# BB#4:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:x <- %R15
	#DEBUG_VALUE: findMoves:_10 <- %R15
	#DEBUG_VALUE: findMoves:n <- %RBP
	orb	%r11b, %r12b
	je	.LBB0_9
.Ltmp26:
# BB#5:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:x <- %R15
	#DEBUG_VALUE: findMoves:_10 <- %R15
	#DEBUG_VALUE: findMoves:n <- %RBP
	orb	104(%rsp), %r9b         # 1-byte Folded Reload
	je	.LBB0_9
.Ltmp27:
# BB#6:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:x <- %R15
	#DEBUG_VALUE: findMoves:_10 <- %R15
	#DEBUG_VALUE: findMoves:n <- %RBP
	movabsq	$9223372036854775807, %rax # imm = 0x7FFFFFFFFFFFFFFF
	cmpq	%rax, %rbp
	je	.LBB0_9
.Ltmp28:
# BB#7:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:x <- %R15
	#DEBUG_VALUE: findMoves:_10 <- %R15
	#DEBUG_VALUE: findMoves:n <- %RBP
	movb	72(%rsp), %al           # 1-byte Reload
	orb	%al, 112(%rsp)          # 1-byte Folded Spill
	je	.LBB0_9
.Ltmp29:
# BB#8:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:x <- %R15
	#DEBUG_VALUE: findMoves:_10 <- %R15
	#DEBUG_VALUE: findMoves:n <- %RBP
	orb	32(%rsp), %r8b          # 1-byte Folded Reload
	orb	40(%rsp), %r8b          # 1-byte Folded Reload
	xorb	$1, %r8b
	je	.LBB0_9
.Ltmp30:
# BB#26:                                # %polly.loop_preheader
	#DEBUG_VALUE: findMoves:x <- %R15
	#DEBUG_VALUE: findMoves:_10 <- %R15
	#DEBUG_VALUE: findMoves:n <- %RBP
	leaq	8(,%rbp,8), %rbx
	leaq	-2(%rbp), %rax
	movq	%rax, 120(%rsp)         # 8-byte Spill
	xorl	%r12d, %r12d
	leaq	64(%rsp), %r14
	leaq	56(%rsp), %r13
	movq	80(%rsp), %r8           # 8-byte Reload
	movq	%rbp, 48(%rsp)          # 8-byte Spill
	movq	%rbx, 104(%rsp)         # 8-byte Spill
.Ltmp31:
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
.Ltmp32:
	.loc	1 218 7                 # CoinGame_array.c:218:7
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
	.loc	1 230 7                 # CoinGame_array.c:230:7
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
.Ltmp33:
	.loc	1 246 10                # CoinGame_array.c:246:10
	leaq	(%r12,%rcx), %rsi
	addq	(%rax,%rcx,8), %rsi
	cmpq	%rsi, %rdx
.Ltmp34:
	.loc	1 246 7 is_stmt 0       # CoinGame_array.c:246:7
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
.Ltmp35:
	#DEBUG_VALUE: findMoves:x <- %R15
	#DEBUG_VALUE: findMoves:_10 <- %R15
	#DEBUG_VALUE: findMoves:n <- %RBP
	.loc	1 126 7 is_stmt 1       # CoinGame_array.c:126:7
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
.Ltmp36:
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
	#DEBUG_VALUE: findMoves:_17 <- 0
	.loc	1 25 12                 # CoinGame_array.c:25:12
	leaq	(%r14,%rdx), %rbx
.Ltmp37:
	.loc	1 130 9                 # CoinGame_array.c:130:9
	movq	$0, (%r8,%rdx,8)
.Ltmp38:
	#DEBUG_VALUE: findMoves:_18 <- 1
	.loc	1 134 9                 # CoinGame_array.c:134:9
	leaq	1(%rdx), %r9
.Ltmp39:
	#DEBUG_VALUE: findMoves:_68 <- %R9
	#DEBUG_VALUE: findMoves:_24 <- %R9
	#DEBUG_VALUE: findMoves:_22 <- 0
	#DEBUG_VALUE: findMoves:_20 <- 1
	#DEBUG_VALUE: findMoves:_19 <- %R9
	#DEBUG_VALUE: findMoves:i <- %R9
	.loc	1 144 10                # CoinGame_array.c:144:10
	testq	%rbx, %rbx
	jle	.LBB0_14
.Ltmp40:
# BB#12:                                # %if.end37
                                        #   in Loop: Header=BB0_11 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R9
	#DEBUG_VALUE: findMoves:_19 <- %R9
	#DEBUG_VALUE: findMoves:_24 <- %R9
	#DEBUG_VALUE: findMoves:_68 <- %R9
	cmpq	%r13, %r9
	jge	.LBB0_14
.Ltmp41:
# BB#13:                                # %if.end45
                                        #   in Loop: Header=BB0_11 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R9
	#DEBUG_VALUE: findMoves:_19 <- %R9
	#DEBUG_VALUE: findMoves:_24 <- %R9
	#DEBUG_VALUE: findMoves:_68 <- %R9
	#DEBUG_VALUE: findMoves:_23 <- 1
	#DEBUG_VALUE: findMoves:_27 <- 1
	.loc	1 158 8                 # CoinGame_array.c:158:8
	movq	32(%rsp), %rcx          # 8-byte Reload
	movq	-8(%rcx,%rdi), %rcx
.Ltmp42:
	#DEBUG_VALUE: findMoves:_29 <- %RCX
	.loc	1 160 9                 # CoinGame_array.c:160:9
	movq	%rcx, (%r8,%rdx,8)
.Ltmp43:
.LBB0_14:                               # %blklab4
                                        #   in Loop: Header=BB0_11 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R9
	#DEBUG_VALUE: findMoves:_19 <- %R9
	#DEBUG_VALUE: findMoves:_24 <- %R9
	#DEBUG_VALUE: findMoves:_68 <- %R9
	#DEBUG_VALUE: findMoves:_30 <- 0
	.loc	1 166 9                 # CoinGame_array.c:166:9
	movq	$0, (%r15,%rdx,8)
.Ltmp44:
	#DEBUG_VALUE: findMoves:_31 <- 2
	.loc	1 170 9                 # CoinGame_array.c:170:9
	leaq	2(%rdx), %rcx
.Ltmp45:
	#DEBUG_VALUE: findMoves:_34 <- %RCX
	#DEBUG_VALUE: findMoves:_32 <- %RCX
	.loc	1 172 7                 # CoinGame_array.c:172:7
	cmpq	%r13, %rcx
	jge	.LBB0_16
.Ltmp46:
# BB#15:                                # %if.end56
                                        #   in Loop: Header=BB0_11 Depth=2
	#DEBUG_VALUE: findMoves:_32 <- %RCX
	#DEBUG_VALUE: findMoves:_34 <- %RCX
	#DEBUG_VALUE: findMoves:i <- %R9
	#DEBUG_VALUE: findMoves:_19 <- %R9
	#DEBUG_VALUE: findMoves:_24 <- %R9
	#DEBUG_VALUE: findMoves:_68 <- %R9
	#DEBUG_VALUE: findMoves:_33 <- 2
	.loc	1 182 8                 # CoinGame_array.c:182:8
	movq	(%r10,%rdi), %rcx
.Ltmp47:
	#DEBUG_VALUE: findMoves:_37 <- %RCX
	.loc	1 184 9                 # CoinGame_array.c:184:9
	movq	%rcx, (%r15,%rdx,8)
.Ltmp48:
.LBB0_16:                               # %blklab5
                                        #   in Loop: Header=BB0_11 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R9
	#DEBUG_VALUE: findMoves:_19 <- %R9
	#DEBUG_VALUE: findMoves:_24 <- %R9
	#DEBUG_VALUE: findMoves:_68 <- %R9
	#DEBUG_VALUE: findMoves:_38 <- 0
	.loc	1 190 9                 # CoinGame_array.c:190:9
	movq	$0, (%rax,%rdx,8)
	#DEBUG_VALUE: findMoves:_41 <- 0
.Ltmp49:
	#DEBUG_VALUE: findMoves:_39 <- 1
	.loc	1 198 10                # CoinGame_array.c:198:10
	cmpq	$2, %rbx
	movl	$0, %ecx
	jl	.LBB0_18
.Ltmp50:
# BB#17:                                # %if.end67
                                        #   in Loop: Header=BB0_11 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R9
	#DEBUG_VALUE: findMoves:_19 <- %R9
	#DEBUG_VALUE: findMoves:_24 <- %R9
	#DEBUG_VALUE: findMoves:_68 <- %R9
	#DEBUG_VALUE: findMoves:_44 <- 2
	.loc	1 208 8                 # CoinGame_array.c:208:8
	movq	-16(%rdi), %rcx
.Ltmp51:
	#DEBUG_VALUE: findMoves:_46 <- %RCX
	.loc	1 210 9                 # CoinGame_array.c:210:9
	movq	%rcx, (%rax,%rdx,8)
.Ltmp52:
.LBB0_18:                               # %blklab6
                                        #   in Loop: Header=BB0_11 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R9
	#DEBUG_VALUE: findMoves:_19 <- %R9
	#DEBUG_VALUE: findMoves:_24 <- %R9
	#DEBUG_VALUE: findMoves:_68 <- %R9
	.loc	1 214 8                 # CoinGame_array.c:214:8
	movq	(%r15,%rdx,8), %rbp
.Ltmp53:
	#DEBUG_VALUE: findMoves:_47 <- %RBP
	.loc	1 216 8                 # CoinGame_array.c:216:8
	movq	(%r8,%rdx,8), %rsi
.Ltmp54:
	#DEBUG_VALUE: findMoves:_49 <- %RSI
	#DEBUG_VALUE: findMoves:_48 <- %RSI
	.loc	1 218 7                 # CoinGame_array.c:218:7
	cmpq	%rsi, %rbp
	jle	.LBB0_19
.Ltmp55:
# BB#20:                                # %if.end78
                                        #   in Loop: Header=BB0_11 Depth=2
	#DEBUG_VALUE: findMoves:_48 <- %RSI
	#DEBUG_VALUE: findMoves:_49 <- %RSI
	#DEBUG_VALUE: findMoves:_47 <- %RBP
	#DEBUG_VALUE: findMoves:i <- %R9
	#DEBUG_VALUE: findMoves:_19 <- %R9
	#DEBUG_VALUE: findMoves:_24 <- %R9
	#DEBUG_VALUE: findMoves:_68 <- %R9
	.loc	1 222 9                 # CoinGame_array.c:222:9
	movq	%rsi, (%r15,%rdx,8)
	movq	88(%rsp), %rax          # 8-byte Reload
	.loc	1 226 8                 # CoinGame_array.c:226:8
	movq	(%rax,%rdx,8), %rcx
	movq	%rsi, %rbp
.Ltmp56:
	.loc	1 228 8                 # CoinGame_array.c:228:8
	movq	(%r8,%rdx,8), %rsi
.Ltmp57:
	jmp	.LBB0_21
.Ltmp58:
	.p2align	4, 0x90
.LBB0_19:                               #   in Loop: Header=BB0_11 Depth=2
	#DEBUG_VALUE: findMoves:_48 <- %RSI
	#DEBUG_VALUE: findMoves:_49 <- %RSI
	#DEBUG_VALUE: findMoves:_47 <- %RBP
	#DEBUG_VALUE: findMoves:i <- %R9
	#DEBUG_VALUE: findMoves:_19 <- %R9
	#DEBUG_VALUE: findMoves:_24 <- %R9
	#DEBUG_VALUE: findMoves:_68 <- %R9
	movq	88(%rsp), %rax          # 8-byte Reload
.Ltmp59:
.LBB0_21:                               # %blklab7
                                        #   in Loop: Header=BB0_11 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R9
	#DEBUG_VALUE: findMoves:_19 <- %R9
	#DEBUG_VALUE: findMoves:_24 <- %R9
	#DEBUG_VALUE: findMoves:_68 <- %R9
	#DEBUG_VALUE: findMoves:_50 <- %RCX
	.loc	1 230 7                 # CoinGame_array.c:230:7
	cmpq	%rsi, %rcx
.Ltmp60:
	#DEBUG_VALUE: findMoves:_51 <- %RSI
	jle	.LBB0_23
.Ltmp61:
# BB#22:                                # %if.end86
                                        #   in Loop: Header=BB0_11 Depth=2
	#DEBUG_VALUE: findMoves:_51 <- %RSI
	#DEBUG_VALUE: findMoves:_50 <- %RCX
	#DEBUG_VALUE: findMoves:i <- %R9
	#DEBUG_VALUE: findMoves:_19 <- %R9
	#DEBUG_VALUE: findMoves:_24 <- %R9
	#DEBUG_VALUE: findMoves:_68 <- %R9
	.loc	1 234 9                 # CoinGame_array.c:234:9
	movq	%rsi, (%rax,%rdx,8)
	.loc	1 238 8                 # CoinGame_array.c:238:8
	movq	(%r15,%rdx,8), %rbp
.Ltmp62:
.LBB0_23:                               # %blklab8
                                        #   in Loop: Header=BB0_11 Depth=2
	#DEBUG_VALUE: findMoves:_51 <- %RSI
	#DEBUG_VALUE: findMoves:_50 <- %RCX
	#DEBUG_VALUE: findMoves:i <- %R9
	#DEBUG_VALUE: findMoves:_19 <- %R9
	#DEBUG_VALUE: findMoves:_24 <- %R9
	#DEBUG_VALUE: findMoves:_68 <- %R9
	#DEBUG_VALUE: findMoves:_53 <- %RBP
	.loc	1 244 9                 # CoinGame_array.c:244:9
	addq	%rbp, %rdx
.Ltmp63:
	.loc	1 246 10                # CoinGame_array.c:246:10
	notq	%rsi
.Ltmp64:
	notq	%rcx
.Ltmp65:
	cmpq	%rcx, %rsi
	cmovgeq	%rsi, %rcx
	subq	%rcx, %rbx
	decq	%rbx
	cmpq	%rbx, %rdx
.Ltmp66:
	.loc	1 258 4                 # CoinGame_array.c:258:4
	cmovgeq	%rdx, %rbx
.Ltmp67:
	#DEBUG_VALUE: findMoves:_67 <- 1
	#DEBUG_VALUE: findMoves:_65 <- 1
	.loc	1 256 15                # CoinGame_array.c:256:15
	movq	%rbx, (%rdi)
	.loc	1 126 7                 # CoinGame_array.c:126:7
	addq	%r11, %rdi
	cmpq	%r9, %r12
	movq	%r9, %rdx
	jne	.LBB0_11
.Ltmp68:
# BB#24:                                # %blklab2
                                        #   in Loop: Header=BB0_10 Depth=1
	#DEBUG_VALUE: findMoves:_53 <- %RBP
	#DEBUG_VALUE: findMoves:i <- %R9
	#DEBUG_VALUE: findMoves:_19 <- %R9
	#DEBUG_VALUE: findMoves:_24 <- %R9
	#DEBUG_VALUE: findMoves:_68 <- %R9
	#DEBUG_VALUE: findMoves:_69 <- 1
	.loc	1 293 8                 # CoinGame_array.c:293:8
	incq	%r14
.Ltmp69:
	#DEBUG_VALUE: findMoves:_70 <- %R14
	#DEBUG_VALUE: findMoves:s <- %R14
	.loc	1 116 6                 # CoinGame_array.c:116:6
	decq	%r12
	movq	40(%rsp), %rcx          # 8-byte Reload
	addq	$8, %rcx
	cmpq	%r13, %r14
	jne	.LBB0_10
.Ltmp70:
.LBB0_25:                               # %if.then114
	.loc	1 303 2 discriminator 1 # CoinGame_array.c:303:2
	movq	%r15, %rdi
	movq	%rax, %rbx
	callq	free
.Ltmp71:
	#DEBUG_VALUE: findMoves:x_dealloc <- 0
	.loc	1 304 2 discriminator 1 # CoinGame_array.c:304:2
	movq	96(%rsp), %rdi          # 8-byte Reload
	callq	free
.Ltmp72:
	#DEBUG_VALUE: findMoves:y_dealloc <- 0
	.loc	1 305 2 discriminator 1 # CoinGame_array.c:305:2
	movq	%rbx, %rdi
	callq	free
.Ltmp73:
	#DEBUG_VALUE: findMoves:z_dealloc <- 0
	.loc	1 309 2                 # CoinGame_array.c:309:2
	movq	80(%rsp), %rax          # 8-byte Reload
	addq	$136, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp74:
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
.Lfunc_begin1:
	.loc	1 313 0                 # CoinGame_array.c:313:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 344 2 prologue_end    # CoinGame_array.c:344:2
	pushq	%r15
.Ltmp75:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp76:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp77:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp78:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp79:
	.cfi_def_cfa_offset 48
.Ltmp80:
	.cfi_offset %rbx, -48
.Ltmp81:
	.cfi_offset %r12, -40
.Ltmp82:
	.cfi_offset %r13, -32
.Ltmp83:
	.cfi_offset %r14, -24
.Ltmp84:
	.cfi_offset %r15, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
.Ltmp85:
	#DEBUG_VALUE: main:max_dealloc <- 0
	#DEBUG_VALUE: main:n <- 0
	#DEBUG_VALUE: main:moves_size <- 0
	#DEBUG_VALUE: main:moves_dealloc <- 0
	#DEBUG_VALUE: main:sum_alice <- 0
	#DEBUG_VALUE: main:_5_dealloc <- 0
	#DEBUG_VALUE: main:_6_size <- 0
	#DEBUG_VALUE: main:_6_size_size <- 0
	#DEBUG_VALUE: main:_6_dealloc <- 0
	#DEBUG_VALUE: main:_7 <- 0
	#DEBUG_VALUE: main:_8_size <- 0
	#DEBUG_VALUE: main:_8_dealloc <- 0
	#DEBUG_VALUE: main:_9 <- 0
	#DEBUG_VALUE: main:_10 <- 0
	#DEBUG_VALUE: main:_11_size <- 0
	#DEBUG_VALUE: main:_11_dealloc <- 0
	#DEBUG_VALUE: main:_12_size <- 0
	#DEBUG_VALUE: main:_12_dealloc <- 0
	#DEBUG_VALUE: main:_13 <- 0
	#DEBUG_VALUE: main:_14 <- 0
	#DEBUG_VALUE: main:_15 <- 0
	#DEBUG_VALUE: main:_18_size <- 0
	#DEBUG_VALUE: main:_18_dealloc <- 0
	#DEBUG_VALUE: main:_23_size <- 0
	#DEBUG_VALUE: main:_23_dealloc <- 0
	callq	convertArgsToIntArray
.Ltmp86:
	#DEBUG_VALUE: main:_6 <- %RAX
	.loc	1 348 5                 # CoinGame_array.c:348:5
	movq	(%rax), %rdi
.Ltmp87:
	#DEBUG_VALUE: main:_8 <- %RDI
	.loc	1 351 2                 # CoinGame_array.c:351:2
	callq	parseStringToInt
.Ltmp88:
	movq	%rax, %r15
.Ltmp89:
	#DEBUG_VALUE: main:max <- %R15
	#DEBUG_VALUE: main:_5 <- %R15
	#DEBUG_VALUE: main:max_dealloc <- 1
	.loc	1 359 9                 # CoinGame_array.c:359:9
	testq	%r15, %r15
	je	.LBB1_2
.Ltmp90:
# BB#1:                                 # %if.then117
	#DEBUG_VALUE: main:_5 <- %R15
	#DEBUG_VALUE: main:max <- %R15
	.loc	1 361 6                 # CoinGame_array.c:361:6
	movq	(%r15), %rbx
	#DEBUG_VALUE: main:_9 <- 0
.Ltmp91:
	#DEBUG_VALUE: main:n <- %RBX
	.loc	1 365 7                 # CoinGame_array.c:365:7
	movl	%ebx, %esi
	imull	%esi, %esi
	.loc	1 368 2                 # CoinGame_array.c:368:2
	xorl	%edi, %edi
	callq	create1DArray
.Ltmp92:
	#DEBUG_VALUE: main:moves <- %RAX
	#DEBUG_VALUE: main:_11 <- %RAX
	#DEBUG_VALUE: main:_11_dealloc <- 0
	#DEBUG_VALUE: main:moves_dealloc <- 1
	.loc	1 377 8                 # CoinGame_array.c:377:8
	xorl	%edx, %edx
	movq	%rax, %rdi
	movq	%rbx, %rcx
	callq	findMoves
.Ltmp93:
	movq	%rax, %r14
.Ltmp94:
	#DEBUG_VALUE: main:_12 <- %R14
	#DEBUG_VALUE: main:moves <- %R14
	#DEBUG_VALUE: main:_13 <- 1
	#DEBUG_VALUE: main:_12_dealloc <- 0
	.loc	1 389 6                 # CoinGame_array.c:389:6
	movq	-8(%r14,%rbx,8), %r12
.Ltmp95:
	#DEBUG_VALUE: main:_18_size <- 50
	#DEBUG_VALUE: main:_15 <- %R12
	#DEBUG_VALUE: main:sum_alice <- %R12
	.loc	1 396 2                 # CoinGame_array.c:396:2
	xorl	%edi, %edi
	movl	$50, %esi
	callq	create1DArray
	movq	%rax, %r13
.Ltmp96:
	#DEBUG_VALUE: main:_18 <- %R13
	.loc	1 397 9                 # CoinGame_array.c:397:9
	movaps	.LCPI1_0(%rip), %xmm0   # xmm0 = [84,104]
	movups	%xmm0, (%r13)
	.loc	1 397 36 is_stmt 0      # CoinGame_array.c:397:36
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [101,32]
	movups	%xmm0, 16(%r13)
	movaps	%xmm0, %xmm1
	.loc	1 397 63                # CoinGame_array.c:397:63
	movaps	.LCPI1_2(%rip), %xmm0   # xmm0 = [116,111]
	movups	%xmm0, 32(%r13)
	.loc	1 397 91                # CoinGame_array.c:397:91
	movaps	.LCPI1_3(%rip), %xmm0   # xmm0 = [116,97]
	movups	%xmm0, 48(%r13)
	.loc	1 397 118               # CoinGame_array.c:397:118
	movaps	.LCPI1_4(%rip), %xmm0   # xmm0 = [108,32]
	movups	%xmm0, 64(%r13)
	.loc	1 397 146               # CoinGame_array.c:397:146
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [97,109]
	movups	%xmm0, 80(%r13)
	.loc	1 397 175               # CoinGame_array.c:397:175
	movaps	.LCPI1_6(%rip), %xmm0   # xmm0 = [111,117]
	movups	%xmm0, 96(%r13)
	.loc	1 397 205               # CoinGame_array.c:397:205
	movaps	.LCPI1_7(%rip), %xmm0   # xmm0 = [110,116]
	movups	%xmm0, 112(%r13)
	.loc	1 397 235               # CoinGame_array.c:397:235
	movaps	.LCPI1_8(%rip), %xmm0   # xmm0 = [32,111]
	movups	%xmm0, 128(%r13)
	.loc	1 397 264               # CoinGame_array.c:397:264
	movaps	.LCPI1_9(%rip), %xmm0   # xmm0 = [102,32]
	movups	%xmm0, 144(%r13)
	.loc	1 397 293               # CoinGame_array.c:397:293
	movaps	.LCPI1_10(%rip), %xmm0  # xmm0 = [109,111]
	movups	%xmm0, 160(%r13)
	.loc	1 397 323               # CoinGame_array.c:397:323
	movaps	.LCPI1_11(%rip), %xmm0  # xmm0 = [110,101]
	movups	%xmm0, 176(%r13)
	.loc	1 397 353               # CoinGame_array.c:397:353
	movaps	.LCPI1_12(%rip), %xmm0  # xmm0 = [121,32]
	movups	%xmm0, 192(%r13)
	.loc	1 397 382               # CoinGame_array.c:397:382
	movaps	.LCPI1_13(%rip), %xmm0  # xmm0 = [40,109]
	movups	%xmm0, 208(%r13)
	.loc	1 397 411               # CoinGame_array.c:397:411
	movaps	.LCPI1_14(%rip), %xmm0  # xmm0 = [97,120]
	movups	%xmm0, 224(%r13)
	.loc	1 397 440               # CoinGame_array.c:397:440
	movaps	.LCPI1_15(%rip), %xmm0  # xmm0 = [105,109]
	movups	%xmm0, 240(%r13)
	.loc	1 397 470               # CoinGame_array.c:397:470
	movaps	.LCPI1_16(%rip), %xmm0  # xmm0 = [117,109]
	movups	%xmm0, 256(%r13)
	.loc	1 397 500               # CoinGame_array.c:397:500
	movaps	.LCPI1_17(%rip), %xmm0  # xmm0 = [41,32]
	movups	%xmm0, 272(%r13)
	.loc	1 397 528               # CoinGame_array.c:397:528
	movaps	.LCPI1_18(%rip), %xmm0  # xmm0 = [65,108]
	movups	%xmm0, 288(%r13)
	.loc	1 397 557               # CoinGame_array.c:397:557
	movaps	.LCPI1_19(%rip), %xmm0  # xmm0 = [105,99]
	movups	%xmm0, 304(%r13)
	.loc	1 397 586               # CoinGame_array.c:397:586
	movups	%xmm1, 320(%r13)
	.loc	1 397 615               # CoinGame_array.c:397:615
	movaps	.LCPI1_20(%rip), %xmm0  # xmm0 = [103,101]
	movups	%xmm0, 336(%r13)
	.loc	1 397 645               # CoinGame_array.c:397:645
	movaps	.LCPI1_21(%rip), %xmm0  # xmm0 = [116,115]
	movups	%xmm0, 352(%r13)
	.loc	1 397 675               # CoinGame_array.c:397:675
	movaps	.LCPI1_22(%rip), %xmm0  # xmm0 = [32,105]
	movups	%xmm0, 368(%r13)
	.loc	1 397 704               # CoinGame_array.c:397:704
	movaps	.LCPI1_23(%rip), %xmm0  # xmm0 = [115,32]
	movups	%xmm0, 384(%r13)
.Ltmp97:
	#DEBUG_VALUE: main:_18_dealloc <- 1
	.loc	1 400 2 is_stmt 1       # CoinGame_array.c:400:2
	movl	$50, %esi
	movq	%r13, %rdi
	callq	printf_s
	.loc	1 404 2                 # CoinGame_array.c:404:2
	movl	$.L.str, %edi
	xorl	%eax, %eax
	movq	%r12, %rsi
	callq	printf
.Ltmp98:
	#DEBUG_VALUE: main:_23_size <- 23
	.loc	1 409 2                 # CoinGame_array.c:409:2
	xorl	%edi, %edi
	movl	$23, %esi
	callq	create1DArray
	movq	%rax, %rbx
.Ltmp99:
	#DEBUG_VALUE: main:_23 <- %RBX
	.loc	1 410 9                 # CoinGame_array.c:410:9
	movaps	.LCPI1_24(%rip), %xmm0  # xmm0 = [80,97]
	movups	%xmm0, (%rbx)
	.loc	1 410 35 is_stmt 0      # CoinGame_array.c:410:35
	movaps	.LCPI1_25(%rip), %xmm0  # xmm0 = [115,115]
	movups	%xmm0, 16(%rbx)
	.loc	1 410 63                # CoinGame_array.c:410:63
	movaps	.LCPI1_26(%rip), %xmm0  # xmm0 = [32,67]
	movups	%xmm0, 32(%rbx)
	.loc	1 410 89                # CoinGame_array.c:410:89
	movaps	.LCPI1_27(%rip), %xmm0  # xmm0 = [111,105]
	movups	%xmm0, 48(%rbx)
	.loc	1 410 117               # CoinGame_array.c:410:117
	movaps	.LCPI1_28(%rip), %xmm0  # xmm0 = [110,71]
	movups	%xmm0, 64(%rbx)
	.loc	1 397 146 is_stmt 1     # CoinGame_array.c:397:146
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [97,109]
	.loc	1 410 145               # CoinGame_array.c:410:145
	movups	%xmm0, 80(%rbx)
	.loc	1 397 36                # CoinGame_array.c:397:36
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [101,32]
	.loc	1 410 174               # CoinGame_array.c:410:174
	movups	%xmm0, 96(%rbx)
	.loc	1 410 203 is_stmt 0     # CoinGame_array.c:410:203
	movaps	.LCPI1_29(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 112(%rbx)
	.loc	1 410 233               # CoinGame_array.c:410:233
	movaps	.LCPI1_30(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 128(%rbx)
	.loc	1 410 263               # CoinGame_array.c:410:263
	movaps	.LCPI1_31(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 144(%rbx)
	.loc	1 410 291               # CoinGame_array.c:410:291
	movaps	.LCPI1_32(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 160(%rbx)
	.loc	1 410 320               # CoinGame_array.c:410:320
	movq	$101, 176(%rbx)
.Ltmp100:
	#DEBUG_VALUE: main:_23_dealloc <- 1
	.loc	1 413 2 is_stmt 1       # CoinGame_array.c:413:2
	movl	$23, %esi
	movq	%rbx, %rdi
	callq	println_s
.Ltmp101:
	.loc	1 417 2 discriminator 1 # CoinGame_array.c:417:2
	movq	%r15, %rdi
	callq	free
.Ltmp102:
	#DEBUG_VALUE: main:max_dealloc <- 0
	.loc	1 418 2 discriminator 1 # CoinGame_array.c:418:2
	movq	%r14, %rdi
	callq	free
.Ltmp103:
	#DEBUG_VALUE: main:moves_dealloc <- 0
	.loc	1 424 2 discriminator 1 # CoinGame_array.c:424:2
	movq	%r13, %rdi
	callq	free
.Ltmp104:
	#DEBUG_VALUE: main:_18_dealloc <- 0
	.loc	1 425 2 discriminator 1 # CoinGame_array.c:425:2
	movq	%rbx, %rdi
	callq	free
.Ltmp105:
	#DEBUG_VALUE: main:_23_dealloc <- 0
.LBB1_2:                                # %if.end139
	#DEBUG_VALUE: main:_5 <- %R15
	#DEBUG_VALUE: main:max <- %R15
	.loc	1 426 2                 # CoinGame_array.c:426:2
	xorl	%edi, %edi
	callq	exit
.Ltmp106:
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc

	.p2align	4, 0x90
	.type	findMoves_polly_subfn,@function
findMoves_polly_subfn:                  # @findMoves_polly_subfn
.Lfunc_begin2:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp107:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp108:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp109:
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
.Ltmp110:
	.cfi_def_cfa_offset 48
.Ltmp111:
	.cfi_offset %rbx, -32
.Ltmp112:
	.cfi_offset %r14, -24
.Ltmp113:
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
.Lfunc_begin3:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp114:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp115:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp116:
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
.Ltmp117:
	.cfi_def_cfa_offset 48
.Ltmp118:
	.cfi_offset %rbx, -32
.Ltmp119:
	.cfi_offset %r14, -24
.Ltmp120:
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
.Lfunc_begin4:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp121:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp122:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp123:
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
.Ltmp124:
	.cfi_def_cfa_offset 48
.Ltmp125:
	.cfi_offset %rbx, -32
.Ltmp126:
	.cfi_offset %r14, -24
.Ltmp127:
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
.Lfunc_begin5:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp128:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp129:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp130:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp131:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp132:
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
.Ltmp133:
	.cfi_def_cfa_offset 64
.Ltmp134:
	.cfi_offset %rbx, -48
.Ltmp135:
	.cfi_offset %r12, -40
.Ltmp136:
	.cfi_offset %r13, -32
.Ltmp137:
	.cfi_offset %r14, -24
.Ltmp138:
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
.Lfunc_begin6:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp139:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp140:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp141:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp142:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp143:
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
.Ltmp144:
	.cfi_def_cfa_offset 64
.Ltmp145:
	.cfi_offset %rbx, -48
.Ltmp146:
	.cfi_offset %r12, -40
.Ltmp147:
	.cfi_offset %r13, -32
.Ltmp148:
	.cfi_offset %r14, -24
.Ltmp149:
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
.Lfunc_begin7:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp150:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp151:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp152:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp153:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp154:
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
.Ltmp155:
	.cfi_def_cfa_offset 64
.Ltmp156:
	.cfi_offset %rbx, -48
.Ltmp157:
	.cfi_offset %r12, -40
.Ltmp158:
	.cfi_offset %r13, -32
.Ltmp159:
	.cfi_offset %r14, -24
.Ltmp160:
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
.Lfunc_begin8:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp161:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp162:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp163:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp164:
	.cfi_def_cfa_offset 40
	subq	$24, %rsp
.Ltmp165:
	.cfi_def_cfa_offset 64
.Ltmp166:
	.cfi_offset %rbx, -40
.Ltmp167:
	.cfi_offset %r12, -32
.Ltmp168:
	.cfi_offset %r14, -24
.Ltmp169:
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
	.loc	1 218 7                 # CoinGame_array.c:218:7
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
.Lfunc_begin9:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp170:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp171:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp172:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp173:
	.cfi_def_cfa_offset 40
	subq	$24, %rsp
.Ltmp174:
	.cfi_def_cfa_offset 64
.Ltmp175:
	.cfi_offset %rbx, -40
.Ltmp176:
	.cfi_offset %r12, -32
.Ltmp177:
	.cfi_offset %r14, -24
.Ltmp178:
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
	.loc	1 230 7                 # CoinGame_array.c:230:7
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

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git f82fb5beb88e841f7a00cfb2a2ceabe46bcb2a9b) (http://llvm.org/git/llvm.git bafbf2b643f118fd2ea402ed6cd204281c7e9e94)" # string offset=0
.Linfo_string1:
	.asciz	"CoinGame_array.c"      # string offset=165
.Linfo_string2:
	.asciz	"/home/mw169/workspace/WhileyOpenCL/polly/CoinGame/impl/array/copyreduced_dealloc" # string offset=182
.Linfo_string3:
	.asciz	"findMoves"             # string offset=263
.Linfo_string4:
	.asciz	"long long int"         # string offset=273
.Linfo_string5:
	.asciz	"main"                  # string offset=287
.Linfo_string6:
	.asciz	"int"                   # string offset=292
.Linfo_string7:
	.asciz	"moves"                 # string offset=296
.Linfo_string8:
	.asciz	"moves_size"            # string offset=302
.Linfo_string9:
	.asciz	"moves_dealloc"         # string offset=313
.Linfo_string10:
	.asciz	"_Bool"                 # string offset=327
.Linfo_string11:
	.asciz	"n"                     # string offset=333
.Linfo_string12:
	.asciz	"_10_size"              # string offset=335
.Linfo_string13:
	.asciz	"x_size"                # string offset=344
.Linfo_string14:
	.asciz	"_12_size"              # string offset=351
.Linfo_string15:
	.asciz	"y_size"                # string offset=360
.Linfo_string16:
	.asciz	"_14_size"              # string offset=367
.Linfo_string17:
	.asciz	"z_size"                # string offset=376
.Linfo_string18:
	.asciz	"_70"                   # string offset=383
.Linfo_string19:
	.asciz	"_69"                   # string offset=387
.Linfo_string20:
	.asciz	"_68"                   # string offset=391
.Linfo_string21:
	.asciz	"_67"                   # string offset=395
.Linfo_string22:
	.asciz	"_66"                   # string offset=399
.Linfo_string23:
	.asciz	"_65"                   # string offset=403
.Linfo_string24:
	.asciz	"_64"                   # string offset=407
.Linfo_string25:
	.asciz	"_63"                   # string offset=411
.Linfo_string26:
	.asciz	"_62"                   # string offset=415
.Linfo_string27:
	.asciz	"_61"                   # string offset=419
.Linfo_string28:
	.asciz	"_60"                   # string offset=423
.Linfo_string29:
	.asciz	"_59"                   # string offset=427
.Linfo_string30:
	.asciz	"_58"                   # string offset=431
.Linfo_string31:
	.asciz	"_57"                   # string offset=435
.Linfo_string32:
	.asciz	"_56"                   # string offset=439
.Linfo_string33:
	.asciz	"_55"                   # string offset=443
.Linfo_string34:
	.asciz	"_54"                   # string offset=447
.Linfo_string35:
	.asciz	"_53"                   # string offset=451
.Linfo_string36:
	.asciz	"_52"                   # string offset=455
.Linfo_string37:
	.asciz	"_51"                   # string offset=459
.Linfo_string38:
	.asciz	"_50"                   # string offset=463
.Linfo_string39:
	.asciz	"_49"                   # string offset=467
.Linfo_string40:
	.asciz	"_48"                   # string offset=471
.Linfo_string41:
	.asciz	"_47"                   # string offset=475
.Linfo_string42:
	.asciz	"_46"                   # string offset=479
.Linfo_string43:
	.asciz	"_45"                   # string offset=483
.Linfo_string44:
	.asciz	"_44"                   # string offset=487
.Linfo_string45:
	.asciz	"_43"                   # string offset=491
.Linfo_string46:
	.asciz	"_42"                   # string offset=495
.Linfo_string47:
	.asciz	"_41"                   # string offset=499
.Linfo_string48:
	.asciz	"_40"                   # string offset=503
.Linfo_string49:
	.asciz	"_39"                   # string offset=507
.Linfo_string50:
	.asciz	"_38"                   # string offset=511
.Linfo_string51:
	.asciz	"_37"                   # string offset=515
.Linfo_string52:
	.asciz	"_36"                   # string offset=519
.Linfo_string53:
	.asciz	"_35"                   # string offset=523
.Linfo_string54:
	.asciz	"_34"                   # string offset=527
.Linfo_string55:
	.asciz	"_33"                   # string offset=531
.Linfo_string56:
	.asciz	"_32"                   # string offset=535
.Linfo_string57:
	.asciz	"_31"                   # string offset=539
.Linfo_string58:
	.asciz	"_30"                   # string offset=543
.Linfo_string59:
	.asciz	"_29"                   # string offset=547
.Linfo_string60:
	.asciz	"_28"                   # string offset=551
.Linfo_string61:
	.asciz	"_27"                   # string offset=555
.Linfo_string62:
	.asciz	"_26"                   # string offset=559
.Linfo_string63:
	.asciz	"_25"                   # string offset=563
.Linfo_string64:
	.asciz	"_24"                   # string offset=567
.Linfo_string65:
	.asciz	"_23"                   # string offset=571
.Linfo_string66:
	.asciz	"_22"                   # string offset=575
.Linfo_string67:
	.asciz	"_21"                   # string offset=579
.Linfo_string68:
	.asciz	"_20"                   # string offset=583
.Linfo_string69:
	.asciz	"_19"                   # string offset=587
.Linfo_string70:
	.asciz	"_18"                   # string offset=591
.Linfo_string71:
	.asciz	"_17"                   # string offset=595
.Linfo_string72:
	.asciz	"_16"                   # string offset=599
.Linfo_string73:
	.asciz	"_15"                   # string offset=603
.Linfo_string74:
	.asciz	"_14_dealloc"           # string offset=607
.Linfo_string75:
	.asciz	"_13"                   # string offset=619
.Linfo_string76:
	.asciz	"_12_dealloc"           # string offset=623
.Linfo_string77:
	.asciz	"_11"                   # string offset=635
.Linfo_string78:
	.asciz	"_10_dealloc"           # string offset=639
.Linfo_string79:
	.asciz	"_9"                    # string offset=651
.Linfo_string80:
	.asciz	"i"                     # string offset=654
.Linfo_string81:
	.asciz	"j"                     # string offset=656
.Linfo_string82:
	.asciz	"s"                     # string offset=658
.Linfo_string83:
	.asciz	"z_dealloc"             # string offset=660
.Linfo_string84:
	.asciz	"y_dealloc"             # string offset=670
.Linfo_string85:
	.asciz	"x_dealloc"             # string offset=680
.Linfo_string86:
	.asciz	"_2_dealloc"            # string offset=690
.Linfo_string87:
	.asciz	"_2_size"               # string offset=701
.Linfo_string88:
	.asciz	"_10"                   # string offset=709
.Linfo_string89:
	.asciz	"x"                     # string offset=713
.Linfo_string90:
	.asciz	"_12"                   # string offset=715
.Linfo_string91:
	.asciz	"y"                     # string offset=719
.Linfo_string92:
	.asciz	"_14"                   # string offset=721
.Linfo_string93:
	.asciz	"z"                     # string offset=725
.Linfo_string94:
	.asciz	"_2"                    # string offset=727
.Linfo_string95:
	.asciz	"argc"                  # string offset=730
.Linfo_string96:
	.asciz	"args"                  # string offset=735
.Linfo_string97:
	.asciz	"char"                  # string offset=740
.Linfo_string98:
	.asciz	"max_dealloc"           # string offset=745
.Linfo_string99:
	.asciz	"sum_alice"             # string offset=757
.Linfo_string100:
	.asciz	"_5_dealloc"            # string offset=767
.Linfo_string101:
	.asciz	"_6_size"               # string offset=778
.Linfo_string102:
	.asciz	"_6_size_size"          # string offset=786
.Linfo_string103:
	.asciz	"_6_dealloc"            # string offset=799
.Linfo_string104:
	.asciz	"_7"                    # string offset=810
.Linfo_string105:
	.asciz	"_8_size"               # string offset=813
.Linfo_string106:
	.asciz	"_8_dealloc"            # string offset=821
.Linfo_string107:
	.asciz	"_11_size"              # string offset=832
.Linfo_string108:
	.asciz	"_11_dealloc"           # string offset=841
.Linfo_string109:
	.asciz	"_18_size"              # string offset=853
.Linfo_string110:
	.asciz	"_18_dealloc"           # string offset=862
.Linfo_string111:
	.asciz	"_23_size"              # string offset=874
.Linfo_string112:
	.asciz	"_23_dealloc"           # string offset=883
.Linfo_string113:
	.asciz	"_6"                    # string offset=895
.Linfo_string114:
	.asciz	"_8"                    # string offset=898
.Linfo_string115:
	.asciz	"max"                   # string offset=901
.Linfo_string116:
	.asciz	"_5"                    # string offset=905
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp17-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	208                     # 80
	.byte	0                       # 
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp16-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc2:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp17-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	81                      # super-register DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp35-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	89                      # DW_OP_reg9
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp67-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp67-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp62-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp62-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp60-.Lfunc_begin0
	.quad	.Ltmp64-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Ltmp57-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp58-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Ltmp57-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp58-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp58-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc23:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	89                      # DW_OP_reg9
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc33:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc34:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	89                      # DW_OP_reg9
	.quad	0
	.quad	0
.Ldebug_loc35:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc36:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	89                      # DW_OP_reg9
	.quad	0
	.quad	0
.Ldebug_loc37:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc38:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc39:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp19-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp72-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc40:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp18-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp71-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc41:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp35-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc42:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp35-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc43:
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	224                     # 96
	.byte	0                       # 
	.quad	0
	.quad	0
.Ldebug_loc44:
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	224                     # 96
	.byte	0                       # 
	.quad	0
	.quad	0
.Ldebug_loc45:
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp22-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc46:
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp22-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc47:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp86-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc48:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp86-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc49:
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp89-.Lfunc_begin0
	.quad	.Ltmp102-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp102-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc50:
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp99-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc51:
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp92-.Lfunc_begin0
	.quad	.Ltmp103-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp103-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc52:
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp95-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp95-.Lfunc_begin0
	.quad	.Ltmp105-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc53:
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp94-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc54:
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp95-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp95-.Lfunc_begin0
	.quad	.Ltmp105-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc55:
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp95-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp95-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	50                      # 50
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc56:
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp97-.Lfunc_begin0
	.quad	.Ltmp104-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp104-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc57:
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp98-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp98-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	23                      # 23
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc58:
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp100-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Ltmp105-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp105-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc59:
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc60:
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc61:
	.quad	.Ltmp89-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc62:
	.quad	.Ltmp89-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc63:
	.quad	.Ltmp92-.Lfunc_begin0
	.quad	.Ltmp93-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp94-.Lfunc_begin0
	.quad	.Ltmp105-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc64:
	.quad	.Ltmp92-.Lfunc_begin0
	.quad	.Ltmp93-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc65:
	.quad	.Ltmp94-.Lfunc_begin0
	.quad	.Ltmp105-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc66:
	.quad	.Ltmp96-.Lfunc_begin0
	.quad	.Ltmp105-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc67:
	.quad	.Ltmp99-.Lfunc_begin0
	.quad	.Ltmp105-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
	.section	.debug_abbrev,"",@progbits
.Lsection_abbrev:
	.byte	1                       # Abbreviation Code
	.byte	17                      # DW_TAG_compile_unit
	.byte	1                       # DW_CHILDREN_yes
	.byte	37                      # DW_AT_producer
	.byte	14                      # DW_FORM_strp
	.byte	19                      # DW_AT_language
	.byte	5                       # DW_FORM_data2
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	16                      # DW_AT_stmt_list
	.byte	23                      # DW_FORM_sec_offset
	.byte	27                      # DW_AT_comp_dir
	.byte	14                      # DW_FORM_strp
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	2                       # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	3                       # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	4                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	5                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	6                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	7                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	15                      # DW_FORM_udata
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	10                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	12                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	13                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	15                      # DW_FORM_udata
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	14                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	15                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	16                      # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	1892                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x75d DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x1 DW_TAG_pointer_type
	.byte	3                       # Abbrev [3] 0x2b:0x4ba DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1847                    # DW_AT_type
                                        # DW_AT_external
	.byte	4                       # Abbrev [4] 0x44:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1847                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x53:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x62:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1866                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x71:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x80:0xf DW_TAG_variable
	.long	.Ldebug_loc4            # DW_AT_location
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x8f:0xf DW_TAG_variable
	.long	.Ldebug_loc5            # DW_AT_location
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x9e:0xf DW_TAG_variable
	.long	.Ldebug_loc6            # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xad:0xf DW_TAG_variable
	.long	.Ldebug_loc7            # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xbc:0xf DW_TAG_variable
	.long	.Ldebug_loc8            # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	21                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xcb:0xf DW_TAG_variable
	.long	.Ldebug_loc9            # DW_AT_location
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xda:0xf DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	78                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xe9:0xf DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	77                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xf8:0xf DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	76                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x107:0xf DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	75                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x116:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	74                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x122:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	73                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x131:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	72                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x13d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	71                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x149:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x155:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	69                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x161:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	68                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x16d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	67                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x179:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	66                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x185:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	65                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x191:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x19d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x1a9:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1b5:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	61                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x1c4:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	60                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1d0:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1df:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	58                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1ee:0xf DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	57                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1fd:0xf DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	56                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x20c:0xf DW_TAG_variable
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	55                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x21b:0xf DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	54                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x22a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	53                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x236:0xf DW_TAG_variable
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	52                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x245:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x251:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	50                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x25d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	49                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x269:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	48                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x275:0xf DW_TAG_variable
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	47                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x284:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	46                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x290:0xf DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	45                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x29f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x2ab:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	43                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2b7:0xf DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	42                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2c6:0xf DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	41                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2d5:0xf DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	40                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2e4:0xf DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	39                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x2f3:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	38                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2ff:0xf DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	37                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x30e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x31a:0xf DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x329:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x335:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	33                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x341:0xf DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x350:0xf DW_TAG_variable
	.long	.Ldebug_loc32           # DW_AT_location
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x35f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string66         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	30                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x36b:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	29                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x377:0xf DW_TAG_variable
	.long	.Ldebug_loc33           # DW_AT_location
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	28                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x386:0xf DW_TAG_variable
	.long	.Ldebug_loc34           # DW_AT_location
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x395:0xf DW_TAG_variable
	.long	.Ldebug_loc35           # DW_AT_location
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3a4:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	25                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3b0:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	24                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3bc:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	23                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x3c8:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	22                      # DW_AT_decl_line
	.long	1866                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3d4:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string75         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	20                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x3e0:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string76         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
	.long	1866                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3ec:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string77         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	17                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x3f8:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string78         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	16                      # DW_AT_decl_line
	.long	1866                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x404:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x410:0xf DW_TAG_variable
	.long	.Ldebug_loc36           # DW_AT_location
	.long	.Linfo_string80         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x41f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string81         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x42b:0xf DW_TAG_variable
	.long	.Ldebug_loc37           # DW_AT_location
	.long	.Linfo_string82         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x43a:0xf DW_TAG_variable
	.long	.Ldebug_loc38           # DW_AT_location
	.long	.Linfo_string83         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.long	1866                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x449:0xf DW_TAG_variable
	.long	.Ldebug_loc39           # DW_AT_location
	.long	.Linfo_string84         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	1866                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x458:0xf DW_TAG_variable
	.long	.Ldebug_loc40           # DW_AT_location
	.long	.Linfo_string85         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	1866                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x467:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string86         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	1866                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x473:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string87         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x47f:0xf DW_TAG_variable
	.long	.Ldebug_loc41           # DW_AT_location
	.long	.Linfo_string88         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	1847                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x48e:0xf DW_TAG_variable
	.long	.Ldebug_loc42           # DW_AT_location
	.long	.Linfo_string89         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	1847                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x49d:0xf DW_TAG_variable
	.long	.Ldebug_loc43           # DW_AT_location
	.long	.Linfo_string90         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
	.long	1847                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x4ac:0xf DW_TAG_variable
	.long	.Ldebug_loc44           # DW_AT_location
	.long	.Linfo_string91         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.long	1847                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x4bb:0xf DW_TAG_variable
	.long	.Ldebug_loc45           # DW_AT_location
	.long	.Linfo_string92         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	21                      # DW_AT_decl_line
	.long	1847                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x4ca:0xf DW_TAG_variable
	.long	.Ldebug_loc46           # DW_AT_location
	.long	.Linfo_string93         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	1847                    # DW_AT_type
	.byte	8                       # Abbrev [8] 0x4d9:0xb DW_TAG_variable
	.long	.Linfo_string94         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	1847                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0x4e5:0x252 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	313                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1859                    # DW_AT_type
                                        # DW_AT_external
	.byte	10                      # Abbrev [10] 0x4ff:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc47           # DW_AT_location
	.long	.Linfo_string95         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	313                     # DW_AT_decl_line
	.long	1859                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x50f:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc48           # DW_AT_location
	.long	.Linfo_string96         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	313                     # DW_AT_decl_line
	.long	1873                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x51f:0x10 DW_TAG_variable
	.long	.Ldebug_loc49           # DW_AT_location
	.long	.Linfo_string98         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	315                     # DW_AT_decl_line
	.long	1866                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x52f:0x10 DW_TAG_variable
	.long	.Ldebug_loc50           # DW_AT_location
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	316                     # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x53f:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	317                     # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x54c:0x10 DW_TAG_variable
	.long	.Ldebug_loc51           # DW_AT_location
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	318                     # DW_AT_decl_line
	.long	1866                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x55c:0x10 DW_TAG_variable
	.long	.Ldebug_loc52           # DW_AT_location
	.long	.Linfo_string99         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	319                     # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x56c:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string100        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	321                     # DW_AT_decl_line
	.long	1866                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x579:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string101        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	322                     # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x586:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string102        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	322                     # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x593:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string103        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	323                     # DW_AT_decl_line
	.long	1866                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x5a0:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string104        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	324                     # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x5ad:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string105        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	325                     # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x5ba:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string106        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	326                     # DW_AT_decl_line
	.long	1866                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x5c7:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	327                     # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x5d4:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string88         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	328                     # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x5e1:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string107        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	329                     # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x5ee:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string108        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	330                     # DW_AT_decl_line
	.long	1866                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x5fb:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	331                     # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x608:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string76         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	332                     # DW_AT_decl_line
	.long	1866                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x615:0x10 DW_TAG_variable
	.long	.Ldebug_loc53           # DW_AT_location
	.long	.Linfo_string75         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	333                     # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x625:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string92         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	334                     # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x632:0x10 DW_TAG_variable
	.long	.Ldebug_loc54           # DW_AT_location
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	335                     # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x642:0x10 DW_TAG_variable
	.long	.Ldebug_loc55           # DW_AT_location
	.long	.Linfo_string109        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	337                     # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x652:0x10 DW_TAG_variable
	.long	.Ldebug_loc56           # DW_AT_location
	.long	.Linfo_string110        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	338                     # DW_AT_decl_line
	.long	1866                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x662:0x10 DW_TAG_variable
	.long	.Ldebug_loc57           # DW_AT_location
	.long	.Linfo_string111        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	341                     # DW_AT_decl_line
	.long	1852                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x672:0x10 DW_TAG_variable
	.long	.Ldebug_loc58           # DW_AT_location
	.long	.Linfo_string112        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	342                     # DW_AT_decl_line
	.long	1866                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x682:0x10 DW_TAG_variable
	.long	.Ldebug_loc59           # DW_AT_location
	.long	.Linfo_string113        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	322                     # DW_AT_decl_line
	.long	1890                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x692:0x10 DW_TAG_variable
	.long	.Ldebug_loc60           # DW_AT_location
	.long	.Linfo_string114        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	325                     # DW_AT_decl_line
	.long	1847                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x6a2:0x10 DW_TAG_variable
	.long	.Ldebug_loc61           # DW_AT_location
	.long	.Linfo_string115        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	314                     # DW_AT_decl_line
	.long	1847                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x6b2:0x10 DW_TAG_variable
	.long	.Ldebug_loc62           # DW_AT_location
	.long	.Linfo_string116        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	320                     # DW_AT_decl_line
	.long	1847                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x6c2:0x10 DW_TAG_variable
	.long	.Ldebug_loc63           # DW_AT_location
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	317                     # DW_AT_decl_line
	.long	1847                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x6d2:0x10 DW_TAG_variable
	.long	.Ldebug_loc64           # DW_AT_location
	.long	.Linfo_string77         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	329                     # DW_AT_decl_line
	.long	1847                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x6e2:0x10 DW_TAG_variable
	.long	.Ldebug_loc65           # DW_AT_location
	.long	.Linfo_string90         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	331                     # DW_AT_decl_line
	.long	1847                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x6f2:0x10 DW_TAG_variable
	.long	.Ldebug_loc66           # DW_AT_location
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	337                     # DW_AT_decl_line
	.long	1847                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x702:0x10 DW_TAG_variable
	.long	.Ldebug_loc67           # DW_AT_location
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	341                     # DW_AT_decl_line
	.long	1847                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x712:0xc DW_TAG_variable
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	336                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	14                      # Abbrev [14] 0x71e:0xc DW_TAG_variable
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	339                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	14                      # Abbrev [14] 0x72a:0xc DW_TAG_variable
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	340                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	15                      # Abbrev [15] 0x737:0x5 DW_TAG_pointer_type
	.long	1852                    # DW_AT_type
	.byte	16                      # Abbrev [16] 0x73c:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	16                      # Abbrev [16] 0x743:0x7 DW_TAG_base_type
	.long	.Linfo_string6          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	16                      # Abbrev [16] 0x74a:0x7 DW_TAG_base_type
	.long	.Linfo_string10         # DW_AT_name
	.byte	2                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	15                      # Abbrev [15] 0x751:0x5 DW_TAG_pointer_type
	.long	1878                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x756:0x5 DW_TAG_pointer_type
	.long	1883                    # DW_AT_type
	.byte	16                      # Abbrev [16] 0x75b:0x7 DW_TAG_base_type
	.long	.Linfo_string97         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	15                      # Abbrev [15] 0x762:0x5 DW_TAG_pointer_type
	.long	1847                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
	.section	.debug_macinfo,"",@progbits
.Ldebug_macinfo:
.Lcu_macro_begin0:
	.byte	0                       # End Of Macro List Mark
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end0-.LpubNames_begin0 # Length of Public Names Info
.LpubNames_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	1896                    # Compilation Unit Length
	.long	1253                    # DIE offset
	.asciz	"main"                  # External Name
	.long	43                      # DIE offset
	.asciz	"findMoves"             # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	1896                    # Compilation Unit Length
	.long	1852                    # DIE offset
	.asciz	"long long int"         # External Name
	.long	1859                    # DIE offset
	.asciz	"int"                   # External Name
	.long	1866                    # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	1883                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git f82fb5beb88e841f7a00cfb2a2ceabe46bcb2a9b) (http://llvm.org/git/llvm.git bafbf2b643f118fd2ea402ed6cd204281c7e9e94)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
