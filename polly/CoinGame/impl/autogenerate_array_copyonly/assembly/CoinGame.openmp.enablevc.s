	.text
	.file	"llvm/CoinGame.openmp.enablevc.ll"
	.globl	findMoves
	.p2align	4, 0x90
	.type	findMoves,@function
findMoves:                              # @findMoves
.Lfunc_begin0:
	.file	1 "CoinGame.c"
	.loc	1 2 0                   # CoinGame.c:2:0
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
	#DEBUG_VALUE: findMoves:n <- %RDX
.Ltmp13:
	#DEBUG_VALUE: findMoves:_10_size <- %RDX
	#DEBUG_VALUE: findMoves:x_size <- %RDX
	#DEBUG_VALUE: findMoves:_12_size <- %RDX
	#DEBUG_VALUE: findMoves:y_size <- %RDX
	#DEBUG_VALUE: findMoves:_14_size <- %RDX
	#DEBUG_VALUE: findMoves:z_size <- %RDX
	movq	%rdx, %rbx
.Ltmp14:
	#DEBUG_VALUE: findMoves:z_size <- %RBX
	#DEBUG_VALUE: findMoves:_14_size <- %RBX
	#DEBUG_VALUE: findMoves:y_size <- %RBX
	#DEBUG_VALUE: findMoves:_12_size <- %RBX
	#DEBUG_VALUE: findMoves:x_size <- %RBX
	#DEBUG_VALUE: findMoves:_10_size <- %RBX
	#DEBUG_VALUE: findMoves:n <- %RBX
	movq	%rdi, 48(%rsp)          # 8-byte Spill
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
	#DEBUG_VALUE: findMoves:_13 <- 0
	#DEBUG_VALUE: findMoves:_11 <- 0
	#DEBUG_VALUE: findMoves:_9 <- 0
	#DEBUG_VALUE: findMoves:i <- 0
	#DEBUG_VALUE: findMoves:j <- 0
	#DEBUG_VALUE: findMoves:s <- 0
	#DEBUG_VALUE: findMoves:_2_size <- 0
	#DEBUG_VALUE: findMoves:z_size <- 0
	#DEBUG_VALUE: findMoves:_14_size <- 0
	#DEBUG_VALUE: findMoves:y_size <- 0
	#DEBUG_VALUE: findMoves:_12_size <- 0
	#DEBUG_VALUE: findMoves:x_size <- 0
	#DEBUG_VALUE: findMoves:_10_size <- 0
	#DEBUG_VALUE: findMoves:moves <- [%RSP+48]
	.loc	1 75 2 prologue_end     # CoinGame.c:75:2
	xorl	%edi, %edi
	movl	%ebx, %esi
.Ltmp16:
	callq	gen1DArray
.Ltmp17:
	movq	%rax, %r15
.Ltmp18:
	#DEBUG_VALUE: findMoves:x <- %R15
	#DEBUG_VALUE: findMoves:_10 <- %R15
	.loc	1 81 2                  # CoinGame.c:81:2
	xorl	%edi, %edi
	movl	%ebx, %esi
	callq	gen1DArray
	movq	%rax, %rbp
.Ltmp19:
	#DEBUG_VALUE: findMoves:y <- %RBP
	#DEBUG_VALUE: findMoves:_12 <- %RBP
	.loc	1 87 2                  # CoinGame.c:87:2
	xorl	%edi, %edi
	movl	%ebx, %esi
	callq	gen1DArray
	movq	%rbp, %rsi
.Ltmp20:
	#DEBUG_VALUE: findMoves:y <- %RSI
	#DEBUG_VALUE: findMoves:_12 <- %RSI
	#DEBUG_VALUE: findMoves:z <- %RAX
	#DEBUG_VALUE: findMoves:_14 <- %RAX
	.loc	1 97 6                  # CoinGame.c:97:6
	testq	%rbx, %rbx
	jle	.LBB0_23
.Ltmp21:
# BB#1:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:_14 <- %RAX
	#DEBUG_VALUE: findMoves:z <- %RAX
	#DEBUG_VALUE: findMoves:_12 <- %RSI
	#DEBUG_VALUE: findMoves:y <- %RSI
	#DEBUG_VALUE: findMoves:_10 <- %R15
	#DEBUG_VALUE: findMoves:x <- %R15
	#DEBUG_VALUE: findMoves:n <- %RBX
	movq	%rbx, %rdx
	imulq	%rdx, %rdx
	movq	48(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rdx,8), %rdi
	cmpq	%rax, %rdi
	setbe	%r8b
	leaq	(%rax,%rbx,8), %rdx
	cmpq	%rcx, %rdx
	setbe	32(%rsp)                # 1-byte Folded Spill
	leaq	(%r15,%rbx,8), %rbp
	cmpq	%rax, %rbp
	setbe	%r10b
	cmpq	%r15, %rdx
	setbe	80(%rsp)                # 1-byte Folded Spill
	movq	%rbx, 40(%rsp)          # 8-byte Spill
	leaq	(%rsi,%rbx,8), %r14
	movq	%rax, 56(%rsp)          # 8-byte Spill
	cmpq	%rax, %r14
	setbe	%r12b
	cmpq	%rsi, %rdx
	setbe	%r9b
	cmpq	%rcx, %rbp
	setbe	%r11b
	cmpq	%r15, %rdi
	setbe	%bl
.Ltmp22:
	cmpq	%rcx, %r14
	setbe	%r13b
	cmpq	%rsi, %rdi
	setbe	%al
.Ltmp23:
	cmpq	%r15, %r14
	setbe	%cl
	movq	%rsi, 88(%rsp)          # 8-byte Spill
	cmpq	%rsi, %rbp
	setbe	%dl
	orb	%cl, %dl
	movzbl	%dl, %ecx
	cmpl	$1, %ecx
	jne	.LBB0_8
.Ltmp24:
# BB#2:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:x <- %R15
	#DEBUG_VALUE: findMoves:_10 <- %R15
	#DEBUG_VALUE: findMoves:y <- %RSI
	#DEBUG_VALUE: findMoves:_12 <- %RSI
	orb	%r13b, %al
	je	.LBB0_8
.Ltmp25:
# BB#3:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:_12 <- %RSI
	#DEBUG_VALUE: findMoves:y <- %RSI
	#DEBUG_VALUE: findMoves:_10 <- %R15
	#DEBUG_VALUE: findMoves:x <- %R15
	orb	%r11b, %bl
	je	.LBB0_8
.Ltmp26:
# BB#4:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:x <- %R15
	#DEBUG_VALUE: findMoves:_10 <- %R15
	#DEBUG_VALUE: findMoves:y <- %RSI
	#DEBUG_VALUE: findMoves:_12 <- %RSI
	orb	%r9b, %r12b
	je	.LBB0_8
.Ltmp27:
# BB#5:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:_12 <- %RSI
	#DEBUG_VALUE: findMoves:y <- %RSI
	#DEBUG_VALUE: findMoves:_10 <- %R15
	#DEBUG_VALUE: findMoves:x <- %R15
	orb	80(%rsp), %r10b         # 1-byte Folded Reload
	je	.LBB0_8
.Ltmp28:
# BB#6:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:x <- %R15
	#DEBUG_VALUE: findMoves:_10 <- %R15
	#DEBUG_VALUE: findMoves:y <- %RSI
	#DEBUG_VALUE: findMoves:_12 <- %RSI
	movabsq	$9223372036854775807, %rax # imm = 0x7FFFFFFFFFFFFFFF
	cmpq	%rax, 40(%rsp)          # 8-byte Folded Reload
	je	.LBB0_8
.Ltmp29:
# BB#7:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:_12 <- %RSI
	#DEBUG_VALUE: findMoves:y <- %RSI
	#DEBUG_VALUE: findMoves:_10 <- %R15
	#DEBUG_VALUE: findMoves:x <- %R15
	orb	32(%rsp), %r8b          # 1-byte Folded Reload
	je	.LBB0_8
.Ltmp30:
# BB#24:                                # %polly.loop_preheader
	#DEBUG_VALUE: findMoves:x <- %R15
	#DEBUG_VALUE: findMoves:_10 <- %R15
	#DEBUG_VALUE: findMoves:y <- %RSI
	#DEBUG_VALUE: findMoves:_12 <- %RSI
	movq	40(%rsp), %rax          # 8-byte Reload
	leaq	8(,%rax,8), %rdi
	leaq	-1(%rax), %rcx
	movq	%rcx, 112(%rsp)         # 8-byte Spill
	leaq	-2(%rax), %rcx
	movq	%rcx, 104(%rsp)         # 8-byte Spill
	xorl	%ebx, %ebx
	leaq	72(%rsp), %r14
	leaq	64(%rsp), %r13
	movq	48(%rsp), %r8           # 8-byte Reload
	movq	88(%rsp), %rcx          # 8-byte Reload
	movq	56(%rsp), %r12          # 8-byte Reload
	movq	%rdi, 120(%rsp)         # 8-byte Spill
.Ltmp31:
	.p2align	4, 0x90
.LBB0_25:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_26 Depth 2
                                        #       Child Loop BB0_28 Depth 3
                                        #     Child Loop BB0_30 Depth 2
                                        #       Child Loop BB0_32 Depth 3
                                        #     Child Loop BB0_34 Depth 2
                                        #       Child Loop BB0_36 Depth 3
                                        #     Child Loop BB0_40 Depth 2
                                        #       Child Loop BB0_41 Depth 3
                                        #     Child Loop BB0_45 Depth 2
                                        #       Child Loop BB0_46 Depth 3
                                        #     Child Loop BB0_50 Depth 2
                                        #       Child Loop BB0_51 Depth 3
                                        #     Child Loop BB0_53 Depth 2
                                        #       Child Loop BB0_55 Depth 3
                                        #     Child Loop BB0_59 Depth 2
                                        #       Child Loop BB0_61 Depth 3
                                        #     Child Loop BB0_67 Depth 2
	movq	%r8, 128(%rsp)          # 8-byte Spill
	movq	%rax, %r8
	subq	%rbx, %r8
	movq	%rax, (%rsp)
	movq	%rbx, %rbp
	movq	%rbx, 8(%rsp)
	movq	%rcx, 16(%rsp)
	movl	$findMoves_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	leaq	(%rsp), %rsi
	movq	%r8, 32(%rsp)           # 8-byte Spill
	callq	GOMP_parallel_loop_runtime_start
	movq	16(%rsp), %rbx
	jmp	.LBB0_26
	.p2align	4, 0x90
.LBB0_27:                               # %polly.par.loadIVBounds.i
                                        #   in Loop: Header=BB0_26 Depth=2
	movq	64(%rsp), %rax
	movq	72(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB0_28:                               # %polly.loop_header.i
                                        #   Parent Loop BB0_25 Depth=1
                                        #     Parent Loop BB0_26 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	$0, 8(%rbx,%rcx,8)
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB0_28
.LBB0_26:                               # %polly.par.checkNext.loopexit.i
                                        #   Parent Loop BB0_25 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_28 Depth 3
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_27
# BB#29:                                # %findMoves_polly_subfn.exit
                                        #   in Loop: Header=BB0_25 Depth=1
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	%rax, (%rsp)
	movq	%rbp, 8(%rsp)
	movq	%r15, 16(%rsp)
	movl	$findMoves_polly_subfn_1, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	leaq	(%rsp), %rsi
	movq	32(%rsp), %r8           # 8-byte Reload
	callq	GOMP_parallel_loop_runtime_start
	movq	16(%rsp), %rbx
	jmp	.LBB0_30
	.p2align	4, 0x90
.LBB0_31:                               # %polly.par.loadIVBounds.i336
                                        #   in Loop: Header=BB0_30 Depth=2
	movq	64(%rsp), %rax
	movq	72(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB0_32:                               # %polly.loop_header.i341
                                        #   Parent Loop BB0_25 Depth=1
                                        #     Parent Loop BB0_30 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	$0, 8(%rbx,%rcx,8)
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB0_32
.LBB0_30:                               # %polly.par.checkNext.loopexit.i332
                                        #   Parent Loop BB0_25 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_32 Depth 3
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_31
# BB#33:                                # %findMoves_polly_subfn_1.exit
                                        #   in Loop: Header=BB0_25 Depth=1
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	%rax, (%rsp)
	movq	%rbp, 8(%rsp)
	movq	%r12, 16(%rsp)
	movl	$findMoves_polly_subfn_2, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	leaq	(%rsp), %rsi
	movq	32(%rsp), %r8           # 8-byte Reload
	callq	GOMP_parallel_loop_runtime_start
	movq	16(%rsp), %rbx
	jmp	.LBB0_34
	.p2align	4, 0x90
.LBB0_35:                               # %polly.par.loadIVBounds.i348
                                        #   in Loop: Header=BB0_34 Depth=2
	movq	64(%rsp), %rax
	movq	72(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB0_36:                               # %polly.loop_header.i353
                                        #   Parent Loop BB0_25 Depth=1
                                        #     Parent Loop BB0_34 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	$0, 8(%rbx,%rcx,8)
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB0_36
.LBB0_34:                               # %polly.par.checkNext.loopexit.i344
                                        #   Parent Loop BB0_25 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_36 Depth 3
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_35
# BB#37:                                # %findMoves_polly_subfn_2.exit
                                        #   in Loop: Header=BB0_25 Depth=1
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movl	$1, %eax
	subq	%rbp, %rax
	movl	$0, %ecx
	cmovnsq	%rax, %rcx
	movq	112(%rsp), %rax         # 8-byte Reload
	movq	32(%rsp), %rdx          # 8-byte Reload
	cmpq	%rdx, %rax
	movq	%rdx, %r8
	cmovleq	%rax, %r8
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	%rax, (%rsp)
	movq	%rbp, 80(%rsp)          # 8-byte Spill
	movq	%rbp, 8(%rsp)
	movq	48(%rsp), %rax          # 8-byte Reload
	movq	%rax, 16(%rsp)
	movq	88(%rsp), %rax          # 8-byte Reload
	movq	%rax, 24(%rsp)
	movl	$findMoves_polly_subfn_3, %edi
	xorl	%edx, %edx
	movl	$1, %r9d
	leaq	(%rsp), %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	(%rsp), %rbp
	movq	8(%rsp), %r12
	movq	16(%rsp), %rax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movq	24(%rsp), %rbx
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB0_42
# BB#38:                                # %polly.par.loadIVBounds.preheader.i
                                        #   in Loop: Header=BB0_25 Depth=1
	movq	%rbp, %rax
	leaq	8(,%rax,8), %rbp
	addq	%rax, %r12
	movq	96(%rsp), %rax          # 8-byte Reload
	leaq	-8(%rax,%r12,8), %r12
	.p2align	4, 0x90
.LBB0_40:                               # %polly.par.loadIVBounds.i362
                                        #   Parent Loop BB0_25 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_41 Depth 3
	movq	64(%rsp), %rax
	movq	72(%rsp), %rcx
	addq	$-2, %rax
	movq	%rbp, %rdx
	imulq	%rcx, %rdx
	decq	%rcx
	addq	%r12, %rdx
	.p2align	4, 0x90
.LBB0_41:                               # %polly.loop_header.i366
                                        #   Parent Loop BB0_25 Depth=1
                                        #     Parent Loop BB0_40 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	(%rdx), %rsi
	movq	%rsi, 8(%rbx,%rcx,8)
	incq	%rcx
	addq	%rbp, %rdx
	cmpq	%rax, %rcx
	jle	.LBB0_41
# BB#39:                                # %polly.par.checkNext.loopexit.i358
                                        #   in Loop: Header=BB0_40 Depth=2
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_40
.LBB0_42:                               # %findMoves_polly_subfn_3.exit
                                        #   in Loop: Header=BB0_25 Depth=1
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movq	104(%rsp), %rax         # 8-byte Reload
	movq	32(%rsp), %rcx          # 8-byte Reload
	cmpq	%rcx, %rax
	movq	%rcx, %r8
	cmovleq	%rax, %r8
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	%rax, (%rsp)
	movq	80(%rsp), %rax          # 8-byte Reload
	movq	%rax, 8(%rsp)
	movq	48(%rsp), %rax          # 8-byte Reload
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
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movq	24(%rsp), %rbx
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB0_47
# BB#43:                                # %polly.par.loadIVBounds.preheader.i375
                                        #   in Loop: Header=BB0_25 Depth=1
	leaq	(%r12,%rbp,2), %rax
	leaq	8(,%rbp,8), %rbp
	movq	96(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rax,8), %r12
	.p2align	4, 0x90
.LBB0_45:                               # %polly.par.loadIVBounds.i380
                                        #   Parent Loop BB0_25 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_46 Depth 3
	movq	64(%rsp), %rax
	movq	72(%rsp), %rcx
	addq	$-2, %rax
	movq	%rbp, %rdx
	imulq	%rcx, %rdx
	decq	%rcx
	addq	%r12, %rdx
	.p2align	4, 0x90
.LBB0_46:                               # %polly.loop_header.i388
                                        #   Parent Loop BB0_25 Depth=1
                                        #     Parent Loop BB0_45 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	(%rdx), %rsi
	movq	%rsi, 8(%rbx,%rcx,8)
	incq	%rcx
	addq	%rbp, %rdx
	cmpq	%rax, %rcx
	jle	.LBB0_46
# BB#44:                                # %polly.par.checkNext.loopexit.i376
                                        #   in Loop: Header=BB0_45 Depth=2
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_45
.LBB0_47:                               # %findMoves_polly_subfn_4.exit
                                        #   in Loop: Header=BB0_25 Depth=1
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movl	$2, %eax
	movq	80(%rsp), %rdx          # 8-byte Reload
	subq	%rdx, %rax
	movl	$0, %ecx
	cmovnsq	%rax, %rcx
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	%rax, (%rsp)
	movq	%rdx, 8(%rsp)
	movq	48(%rsp), %rax          # 8-byte Reload
	movq	%rax, 16(%rsp)
	movq	56(%rsp), %rax          # 8-byte Reload
	movq	%rax, 24(%rsp)
	movl	$findMoves_polly_subfn_5, %edi
	xorl	%edx, %edx
	movl	$1, %r9d
	leaq	(%rsp), %rsi
	movq	32(%rsp), %r8           # 8-byte Reload
	callq	GOMP_parallel_loop_runtime_start
	movq	(%rsp), %rbp
	movq	8(%rsp), %rax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movq	16(%rsp), %r12
	movq	24(%rsp), %rbx
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB0_52
# BB#48:                                # %polly.par.loadIVBounds.preheader.i397
                                        #   in Loop: Header=BB0_25 Depth=1
	leaq	8(,%rbp,8), %rbp
	movq	96(%rsp), %rax          # 8-byte Reload
	leaq	-16(%r12,%rax,8), %r12
	.p2align	4, 0x90
.LBB0_50:                               # %polly.par.loadIVBounds.i402
                                        #   Parent Loop BB0_25 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_51 Depth 3
	movq	64(%rsp), %rax
	movq	72(%rsp), %rcx
	addq	$-2, %rax
	movq	%rbp, %rdx
	imulq	%rcx, %rdx
	decq	%rcx
	addq	%r12, %rdx
	.p2align	4, 0x90
.LBB0_51:                               # %polly.loop_header.i410
                                        #   Parent Loop BB0_25 Depth=1
                                        #     Parent Loop BB0_50 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	(%rdx), %rsi
	movq	%rsi, 8(%rbx,%rcx,8)
	incq	%rcx
	addq	%rbp, %rdx
	cmpq	%rax, %rcx
	jle	.LBB0_51
# BB#49:                                # %polly.par.checkNext.loopexit.i398
                                        #   in Loop: Header=BB0_50 Depth=2
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_50
.LBB0_52:                               # %findMoves_polly_subfn_5.exit
                                        #   in Loop: Header=BB0_25 Depth=1
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	%rax, (%rsp)
	movq	80(%rsp), %rax          # 8-byte Reload
	movq	%rax, 8(%rsp)
	movq	%r15, 16(%rsp)
	movq	88(%rsp), %rax          # 8-byte Reload
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
	jmp	.LBB0_53
	.p2align	4, 0x90
.LBB0_54:                               # %polly.par.loadIVBounds.i419
                                        #   in Loop: Header=BB0_53 Depth=2
	movq	64(%rsp), %rax
	movq	72(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB0_55:                               # %polly.loop_header.i424
                                        #   Parent Loop BB0_25 Depth=1
                                        #     Parent Loop BB0_53 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	8(%r12,%rcx,8), %rdx
.Ltmp32:
	.loc	1 199 7                 # CoinGame.c:199:7
	cmpq	%rdx, 8(%rbx,%rcx,8)
	jle	.LBB0_57
# BB#56:                                # %polly.stmt.if.end55.i
                                        #   in Loop: Header=BB0_55 Depth=3
	movq	%rdx, 8(%rbx,%rcx,8)
.LBB0_57:                               # %polly.stmt.blklab7.exit.i
                                        #   in Loop: Header=BB0_55 Depth=3
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB0_55
.LBB0_53:                               # %polly.par.checkNext.loopexit.i415
                                        #   Parent Loop BB0_25 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_55 Depth 3
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_54
# BB#58:                                # %findMoves_polly_subfn_6.exit
                                        #   in Loop: Header=BB0_25 Depth=1
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	%rax, (%rsp)
	movq	80(%rsp), %rax          # 8-byte Reload
	movq	%rax, 8(%rsp)
	movq	56(%rsp), %rax          # 8-byte Reload
	movq	%rax, 16(%rsp)
	movq	88(%rsp), %rax          # 8-byte Reload
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
	jmp	.LBB0_59
	.p2align	4, 0x90
.LBB0_60:                               # %polly.par.loadIVBounds.i435
                                        #   in Loop: Header=BB0_59 Depth=2
	movq	64(%rsp), %rax
	movq	72(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB0_61:                               # %polly.loop_header.i441
                                        #   Parent Loop BB0_25 Depth=1
                                        #     Parent Loop BB0_59 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	8(%rbp,%rcx,8), %rdx
	.loc	1 211 7                 # CoinGame.c:211:7
	cmpq	%rdx, 8(%rbx,%rcx,8)
	jle	.LBB0_63
# BB#62:                                # %polly.stmt.if.end63.i
                                        #   in Loop: Header=BB0_61 Depth=3
	movq	%rdx, 8(%rbx,%rcx,8)
.LBB0_63:                               # %polly.stmt.blklab8.exit.i
                                        #   in Loop: Header=BB0_61 Depth=3
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB0_61
.LBB0_59:                               # %polly.par.checkNext.loopexit.i431
                                        #   Parent Loop BB0_25 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_61 Depth 3
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_60
# BB#64:                                # %findMoves_polly_subfn_7.exit
                                        #   in Loop: Header=BB0_25 Depth=1
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movq	32(%rsp), %rbp          # 8-byte Reload
	testq	%rbp, %rbp
	movq	56(%rsp), %r12          # 8-byte Reload
	movq	120(%rsp), %rdi         # 8-byte Reload
	movq	128(%rsp), %r8          # 8-byte Reload
	movq	80(%rsp), %rbx          # 8-byte Reload
	jle	.LBB0_65
# BB#66:                                # %polly.loop_preheader318
                                        #   in Loop: Header=BB0_25 Depth=1
	decq	%rbp
	movq	%r8, %rax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_67:                               # %polly.loop_header317
                                        #   Parent Loop BB0_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp33:
	.loc	1 227 10                # CoinGame.c:227:10
	leaq	(%rbx,%rcx), %rdx
	addq	(%r12,%rcx,8), %rdx
	movq	(%r15,%rcx,8), %rsi
	addq	%rcx, %rsi
	cmpq	%rdx, %rsi
.Ltmp34:
	.loc	1 227 7 is_stmt 0       # CoinGame.c:227:7
	cmovlq	%rdx, %rsi
	movq	%rsi, (%rax)
	addq	%rdi, %rax
	cmpq	%rbp, %rcx
	leaq	1(%rcx), %rcx
	jl	.LBB0_67
.LBB0_65:                               # %polly.loop_exit319
                                        #   in Loop: Header=BB0_25 Depth=1
	incq	%rbx
	addq	$8, %r8
	movq	40(%rsp), %rax          # 8-byte Reload
	cmpq	%rax, %rbx
	movq	88(%rsp), %rcx          # 8-byte Reload
	jne	.LBB0_25
	jmp	.LBB0_23
.LBB0_8:                                # %while.cond9.preheader.preheader
.Ltmp35:
	#DEBUG_VALUE: findMoves:x <- %R15
	#DEBUG_VALUE: findMoves:_10 <- %R15
	#DEBUG_VALUE: findMoves:y <- %RSI
	#DEBUG_VALUE: findMoves:_12 <- %RSI
	movq	40(%rsp), %r13          # 8-byte Reload
	.loc	1 107 7 is_stmt 1       # CoinGame.c:107:7
	leaq	8(,%r13,8), %r11
	movq	%r13, %r9
	shlq	$4, %r9
	leaq	-8(,%r13,8), %r10
	movq	%r13, %rax
	negq	%rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	xorl	%r12d, %r12d
	movq	88(%rsp), %r8           # 8-byte Reload
	movq	56(%rsp), %rbp          # 8-byte Reload
.Ltmp36:
	.p2align	4, 0x90
.LBB0_9:                                # %while.cond9.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_10 Depth 2
	movq	32(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%r12), %r14
	movq	48(%rsp), %rsi          # 8-byte Reload
	xorl	%ecx, %ecx
.Ltmp37:
	.p2align	4, 0x90
.LBB0_10:                               # %if.end14
                                        #   Parent Loop BB0_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: findMoves:_17 <- 0
	.loc	1 18 12                 # CoinGame.c:18:12
	leaq	(%r12,%rcx), %rbx
.Ltmp38:
	.loc	1 111 9                 # CoinGame.c:111:9
	movq	$0, (%r8,%rcx,8)
.Ltmp39:
	#DEBUG_VALUE: findMoves:_18 <- 1
	.loc	1 115 9                 # CoinGame.c:115:9
	leaq	1(%rcx), %rdx
.Ltmp40:
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_22 <- 0
	#DEBUG_VALUE: findMoves:_20 <- 1
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:i <- %RDX
	.loc	1 125 10                # CoinGame.c:125:10
	testq	%rbx, %rbx
	jle	.LBB0_13
.Ltmp41:
# BB#11:                                # %if.end14
                                        #   in Loop: Header=BB0_10 Depth=2
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	cmpq	%r13, %rdx
	jge	.LBB0_13
.Ltmp42:
# BB#12:                                # %if.end22
                                        #   in Loop: Header=BB0_10 Depth=2
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_23 <- 1
	#DEBUG_VALUE: findMoves:_27 <- 1
	.loc	1 139 8                 # CoinGame.c:139:8
	leaq	(%rsi,%r10), %rax
	movq	(%rax,%r12,8), %rax
.Ltmp43:
	#DEBUG_VALUE: findMoves:_29 <- %RAX
	.loc	1 141 9                 # CoinGame.c:141:9
	movq	%rax, (%r8,%rcx,8)
.Ltmp44:
.LBB0_13:                               # %blklab4
                                        #   in Loop: Header=BB0_10 Depth=2
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_30 <- 0
	.loc	1 147 9                 # CoinGame.c:147:9
	movq	$0, (%r15,%rcx,8)
.Ltmp45:
	#DEBUG_VALUE: findMoves:_31 <- 2
	.loc	1 151 9                 # CoinGame.c:151:9
	leaq	2(%rcx), %rax
.Ltmp46:
	#DEBUG_VALUE: findMoves:_34 <- %RAX
	#DEBUG_VALUE: findMoves:_32 <- %RAX
	.loc	1 153 7                 # CoinGame.c:153:7
	cmpq	%r13, %rax
	jge	.LBB0_15
.Ltmp47:
# BB#14:                                # %if.end33
                                        #   in Loop: Header=BB0_10 Depth=2
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_32 <- %RAX
	#DEBUG_VALUE: findMoves:_34 <- %RAX
	#DEBUG_VALUE: findMoves:_33 <- 2
	.loc	1 163 8                 # CoinGame.c:163:8
	leaq	(%rsi,%r9), %rax
.Ltmp48:
	movq	(%rax,%r12,8), %rax
.Ltmp49:
	#DEBUG_VALUE: findMoves:_37 <- %RAX
	.loc	1 165 9                 # CoinGame.c:165:9
	movq	%rax, (%r15,%rcx,8)
.Ltmp50:
.LBB0_15:                               # %blklab5
                                        #   in Loop: Header=BB0_10 Depth=2
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_38 <- 0
	.loc	1 171 9                 # CoinGame.c:171:9
	movq	$0, (%rbp,%rcx,8)
	#DEBUG_VALUE: findMoves:_41 <- 0
.Ltmp51:
	#DEBUG_VALUE: findMoves:_39 <- 1
	.loc	1 179 10                # CoinGame.c:179:10
	cmpq	$2, %rbx
	movl	$0, %eax
	jl	.LBB0_17
.Ltmp52:
# BB#16:                                # %if.end44
                                        #   in Loop: Header=BB0_10 Depth=2
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_44 <- 2
	.loc	1 189 8                 # CoinGame.c:189:8
	movq	-16(%rsi,%r12,8), %rax
.Ltmp53:
	#DEBUG_VALUE: findMoves:_46 <- %RAX
	.loc	1 191 9                 # CoinGame.c:191:9
	movq	%rax, (%rbp,%rcx,8)
.Ltmp54:
.LBB0_17:                               # %blklab6
                                        #   in Loop: Header=BB0_10 Depth=2
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	.loc	1 195 8                 # CoinGame.c:195:8
	movq	(%r15,%rcx,8), %rbp
.Ltmp55:
	#DEBUG_VALUE: findMoves:_47 <- %RBP
	.loc	1 197 8                 # CoinGame.c:197:8
	movq	(%r8,%rcx,8), %rdi
.Ltmp56:
	#DEBUG_VALUE: findMoves:_49 <- %RDI
	#DEBUG_VALUE: findMoves:_48 <- %RDI
	.loc	1 199 7                 # CoinGame.c:199:7
	cmpq	%rdi, %rbp
	jle	.LBB0_19
.Ltmp57:
# BB#18:                                # %if.end55
                                        #   in Loop: Header=BB0_10 Depth=2
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_48 <- %RDI
	#DEBUG_VALUE: findMoves:_49 <- %RDI
	#DEBUG_VALUE: findMoves:_47 <- %RBP
	.loc	1 203 9                 # CoinGame.c:203:9
	movq	%rdi, (%r15,%rcx,8)
	.loc	1 207 8                 # CoinGame.c:207:8
	movq	56(%rsp), %rax          # 8-byte Reload
	movq	(%rax,%rcx,8), %rax
	movq	%rdi, %rbp
.Ltmp58:
	.loc	1 209 8                 # CoinGame.c:209:8
	movq	(%r8,%rcx,8), %rdi
.Ltmp59:
.LBB0_19:                               # %blklab7
                                        #   in Loop: Header=BB0_10 Depth=2
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_50 <- %RAX
	.loc	1 211 7                 # CoinGame.c:211:7
	cmpq	%rdi, %rax
.Ltmp60:
	#DEBUG_VALUE: findMoves:_51 <- %RDI
	jle	.LBB0_21
.Ltmp61:
# BB#20:                                # %if.end63
                                        #   in Loop: Header=BB0_10 Depth=2
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_51 <- %RDI
	#DEBUG_VALUE: findMoves:_50 <- %RAX
	.loc	1 215 9                 # CoinGame.c:215:9
	movq	56(%rsp), %rbp          # 8-byte Reload
	movq	%rdi, (%rbp,%rcx,8)
	.loc	1 219 8                 # CoinGame.c:219:8
	movq	(%r15,%rcx,8), %rbp
.Ltmp62:
.LBB0_21:                               # %blklab8
                                        #   in Loop: Header=BB0_10 Depth=2
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_51 <- %RDI
	#DEBUG_VALUE: findMoves:_50 <- %RAX
	#DEBUG_VALUE: findMoves:_53 <- %RBP
	.loc	1 227 10                # CoinGame.c:227:10
	notq	%rdi
.Ltmp63:
	notq	%rax
.Ltmp64:
	cmpq	%rax, %rdi
	cmovgeq	%rdi, %rax
	subq	%rax, %rbx
	decq	%rbx
	addq	%rbp, %rcx
	cmpq	%rbx, %rcx
.Ltmp65:
	.loc	1 239 4                 # CoinGame.c:239:4
	cmovlq	%rbx, %rcx
.Ltmp66:
	#DEBUG_VALUE: findMoves:_67 <- 1
	#DEBUG_VALUE: findMoves:_65 <- 1
	.loc	1 237 15                # CoinGame.c:237:15
	movq	%rcx, (%rsi,%r12,8)
	.loc	1 107 7                 # CoinGame.c:107:7
	addq	%r11, %rsi
	movq	%r14, %rax
	addq	%rdx, %rax
	movq	%rdx, %rcx
	movq	88(%rsp), %r8           # 8-byte Reload
	movq	56(%rsp), %rbp          # 8-byte Reload
.Ltmp67:
	jne	.LBB0_10
.Ltmp68:
# BB#22:                                # %blklab2
                                        #   in Loop: Header=BB0_9 Depth=1
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_69 <- 1
	.loc	1 274 8                 # CoinGame.c:274:8
	incq	%r12
.Ltmp69:
	#DEBUG_VALUE: findMoves:_70 <- %R12
	#DEBUG_VALUE: findMoves:s <- %R12
	.loc	1 97 6                  # CoinGame.c:97:6
	cmpq	%r13, %r12
	jne	.LBB0_9
.Ltmp70:
.LBB0_23:                               # %blklab0
	.loc	1 283 2                 # CoinGame.c:283:2
	movq	48(%rsp), %rax          # 8-byte Reload
	addq	$136, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp71:
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
	.loc	1 287 0                 # CoinGame.c:287:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 309 2 prologue_end    # CoinGame.c:309:2
	pushq	%rbx
.Ltmp72:
	.cfi_def_cfa_offset 16
.Ltmp73:
	.cfi_offset %rbx, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
.Ltmp74:
	#DEBUG_VALUE: main:n <- 0
	#DEBUG_VALUE: main:moves_size <- 0
	#DEBUG_VALUE: main:sum_alice <- 0
	#DEBUG_VALUE: main:_6_size <- 0
	#DEBUG_VALUE: main:_6_size_size <- 0
	#DEBUG_VALUE: main:_7 <- 0
	#DEBUG_VALUE: main:_8_size <- 0
	#DEBUG_VALUE: main:_9 <- 0
	#DEBUG_VALUE: main:_10 <- 0
	#DEBUG_VALUE: main:_11_size <- 0
	#DEBUG_VALUE: main:_12_size <- 0
	#DEBUG_VALUE: main:_13 <- 0
	#DEBUG_VALUE: main:_14 <- 0
	#DEBUG_VALUE: main:_15 <- 0
	#DEBUG_VALUE: main:_18_size <- 0
	#DEBUG_VALUE: main:_23_size <- 0
	callq	convertArgsToIntArray
.Ltmp75:
	#DEBUG_VALUE: main:_6 <- %RAX
	.loc	1 313 5                 # CoinGame.c:313:5
	movq	(%rax), %rdi
.Ltmp76:
	#DEBUG_VALUE: main:_8 <- %RDI
	.loc	1 315 2                 # CoinGame.c:315:2
	callq	parseStringToInt
.Ltmp77:
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_5 <- %RAX
	.loc	1 319 9                 # CoinGame.c:319:9
	testq	%rax, %rax
	je	.LBB1_2
.Ltmp78:
# BB#1:                                 # %if.end
	#DEBUG_VALUE: main:_5 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	.loc	1 321 6                 # CoinGame.c:321:6
	movq	(%rax), %rbx
	#DEBUG_VALUE: main:_9 <- 0
.Ltmp79:
	#DEBUG_VALUE: main:n <- %RBX
	.loc	1 325 7                 # CoinGame.c:325:7
	movl	%ebx, %esi
	imull	%esi, %esi
	.loc	1 327 2                 # CoinGame.c:327:2
	xorl	%edi, %edi
	callq	gen1DArray
.Ltmp80:
	#DEBUG_VALUE: main:moves <- %RAX
	#DEBUG_VALUE: main:_11 <- %RAX
	.loc	1 332 8                 # CoinGame.c:332:8
	movq	%rax, %rdi
	movq	%rbx, %rdx
	callq	findMoves
.Ltmp81:
	#DEBUG_VALUE: main:_12 <- %RAX
	#DEBUG_VALUE: main:moves <- %RAX
	#DEBUG_VALUE: main:_13 <- 1
	.loc	1 340 6                 # CoinGame.c:340:6
	movq	-8(%rax,%rbx,8), %rbx
.Ltmp82:
	#DEBUG_VALUE: main:_18_size <- 50
	#DEBUG_VALUE: main:_15 <- %RBX
	#DEBUG_VALUE: main:sum_alice <- %RBX
	.loc	1 346 2                 # CoinGame.c:346:2
	movl	$400, %edi              # imm = 0x190
	callq	malloc
.Ltmp83:
	#DEBUG_VALUE: main:_18 <- %RAX
	.loc	1 347 9                 # CoinGame.c:347:9
	movaps	.LCPI1_0(%rip), %xmm0   # xmm0 = [84,104]
	movups	%xmm0, (%rax)
	.loc	1 347 36 is_stmt 0      # CoinGame.c:347:36
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [101,32]
	movups	%xmm0, 16(%rax)
	movaps	%xmm0, %xmm1
	.loc	1 347 63                # CoinGame.c:347:63
	movaps	.LCPI1_2(%rip), %xmm0   # xmm0 = [116,111]
	movups	%xmm0, 32(%rax)
	.loc	1 347 91                # CoinGame.c:347:91
	movaps	.LCPI1_3(%rip), %xmm0   # xmm0 = [116,97]
	movups	%xmm0, 48(%rax)
	.loc	1 347 118               # CoinGame.c:347:118
	movaps	.LCPI1_4(%rip), %xmm0   # xmm0 = [108,32]
	movups	%xmm0, 64(%rax)
	.loc	1 347 146               # CoinGame.c:347:146
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [97,109]
	movups	%xmm0, 80(%rax)
	.loc	1 347 175               # CoinGame.c:347:175
	movaps	.LCPI1_6(%rip), %xmm0   # xmm0 = [111,117]
	movups	%xmm0, 96(%rax)
	.loc	1 347 205               # CoinGame.c:347:205
	movaps	.LCPI1_7(%rip), %xmm0   # xmm0 = [110,116]
	movups	%xmm0, 112(%rax)
	.loc	1 347 235               # CoinGame.c:347:235
	movaps	.LCPI1_8(%rip), %xmm0   # xmm0 = [32,111]
	movups	%xmm0, 128(%rax)
	.loc	1 347 264               # CoinGame.c:347:264
	movaps	.LCPI1_9(%rip), %xmm0   # xmm0 = [102,32]
	movups	%xmm0, 144(%rax)
	.loc	1 347 293               # CoinGame.c:347:293
	movaps	.LCPI1_10(%rip), %xmm0  # xmm0 = [109,111]
	movups	%xmm0, 160(%rax)
	.loc	1 347 323               # CoinGame.c:347:323
	movaps	.LCPI1_11(%rip), %xmm0  # xmm0 = [110,101]
	movups	%xmm0, 176(%rax)
	.loc	1 347 353               # CoinGame.c:347:353
	movaps	.LCPI1_12(%rip), %xmm0  # xmm0 = [121,32]
	movups	%xmm0, 192(%rax)
	.loc	1 347 382               # CoinGame.c:347:382
	movaps	.LCPI1_13(%rip), %xmm0  # xmm0 = [40,109]
	movups	%xmm0, 208(%rax)
	.loc	1 347 411               # CoinGame.c:347:411
	movaps	.LCPI1_14(%rip), %xmm0  # xmm0 = [97,120]
	movups	%xmm0, 224(%rax)
	.loc	1 347 440               # CoinGame.c:347:440
	movaps	.LCPI1_15(%rip), %xmm0  # xmm0 = [105,109]
	movups	%xmm0, 240(%rax)
	.loc	1 347 470               # CoinGame.c:347:470
	movaps	.LCPI1_16(%rip), %xmm0  # xmm0 = [117,109]
	movups	%xmm0, 256(%rax)
	.loc	1 347 500               # CoinGame.c:347:500
	movaps	.LCPI1_17(%rip), %xmm0  # xmm0 = [41,32]
	movups	%xmm0, 272(%rax)
	.loc	1 347 528               # CoinGame.c:347:528
	movaps	.LCPI1_18(%rip), %xmm0  # xmm0 = [65,108]
	movups	%xmm0, 288(%rax)
	.loc	1 347 557               # CoinGame.c:347:557
	movaps	.LCPI1_19(%rip), %xmm0  # xmm0 = [105,99]
	movups	%xmm0, 304(%rax)
	.loc	1 347 586               # CoinGame.c:347:586
	movups	%xmm1, 320(%rax)
	.loc	1 347 615               # CoinGame.c:347:615
	movaps	.LCPI1_20(%rip), %xmm0  # xmm0 = [103,101]
	movups	%xmm0, 336(%rax)
	.loc	1 347 645               # CoinGame.c:347:645
	movaps	.LCPI1_21(%rip), %xmm0  # xmm0 = [116,115]
	movups	%xmm0, 352(%rax)
	.loc	1 347 675               # CoinGame.c:347:675
	movaps	.LCPI1_22(%rip), %xmm0  # xmm0 = [32,105]
	movups	%xmm0, 368(%rax)
	.loc	1 347 704               # CoinGame.c:347:704
	movaps	.LCPI1_23(%rip), %xmm0  # xmm0 = [115,32]
	movups	%xmm0, 384(%rax)
	.loc	1 349 2 is_stmt 1       # CoinGame.c:349:2
	movl	$50, %esi
	movq	%rax, %rdi
	callq	printf_s
.Ltmp84:
	.loc	1 353 2                 # CoinGame.c:353:2
	movl	$.L.str, %edi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	printf
.Ltmp85:
	#DEBUG_VALUE: main:_23_size <- 23
	.loc	1 357 2                 # CoinGame.c:357:2
	movl	$184, %edi
	callq	malloc
.Ltmp86:
	#DEBUG_VALUE: main:_23 <- %RAX
	.loc	1 358 9                 # CoinGame.c:358:9
	movaps	.LCPI1_24(%rip), %xmm0  # xmm0 = [80,97]
	movups	%xmm0, (%rax)
	.loc	1 358 35 is_stmt 0      # CoinGame.c:358:35
	movaps	.LCPI1_25(%rip), %xmm0  # xmm0 = [115,115]
	movups	%xmm0, 16(%rax)
	.loc	1 358 63                # CoinGame.c:358:63
	movaps	.LCPI1_26(%rip), %xmm0  # xmm0 = [32,67]
	movups	%xmm0, 32(%rax)
	.loc	1 358 89                # CoinGame.c:358:89
	movaps	.LCPI1_27(%rip), %xmm0  # xmm0 = [111,105]
	movups	%xmm0, 48(%rax)
	.loc	1 358 117               # CoinGame.c:358:117
	movaps	.LCPI1_28(%rip), %xmm0  # xmm0 = [110,71]
	movups	%xmm0, 64(%rax)
	.loc	1 347 146 is_stmt 1     # CoinGame.c:347:146
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [97,109]
	.loc	1 358 145               # CoinGame.c:358:145
	movups	%xmm0, 80(%rax)
	.loc	1 347 36                # CoinGame.c:347:36
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [101,32]
	.loc	1 358 174               # CoinGame.c:358:174
	movups	%xmm0, 96(%rax)
	.loc	1 358 203 is_stmt 0     # CoinGame.c:358:203
	movaps	.LCPI1_29(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 112(%rax)
	.loc	1 358 233               # CoinGame.c:358:233
	movaps	.LCPI1_30(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 128(%rax)
	.loc	1 358 263               # CoinGame.c:358:263
	movaps	.LCPI1_31(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 144(%rax)
	.loc	1 358 291               # CoinGame.c:358:291
	movaps	.LCPI1_32(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 160(%rax)
	.loc	1 358 320               # CoinGame.c:358:320
	movq	$101, 176(%rax)
	.loc	1 360 2 is_stmt 1       # CoinGame.c:360:2
	movl	$23, %esi
	movq	%rax, %rdi
	callq	println_s
.Ltmp87:
.LBB1_2:                                # %blklab11
	.loc	1 364 2                 # CoinGame.c:364:2
	xorl	%edi, %edi
	callq	exit
.Ltmp88:
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
.Ltmp89:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp90:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp91:
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
.Ltmp92:
	.cfi_def_cfa_offset 48
.Ltmp93:
	.cfi_offset %rbx, -32
.Ltmp94:
	.cfi_offset %r14, -24
.Ltmp95:
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
.Ltmp96:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp97:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp98:
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
.Ltmp99:
	.cfi_def_cfa_offset 48
.Ltmp100:
	.cfi_offset %rbx, -32
.Ltmp101:
	.cfi_offset %r14, -24
.Ltmp102:
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
.Ltmp103:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp104:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp105:
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
.Ltmp106:
	.cfi_def_cfa_offset 48
.Ltmp107:
	.cfi_offset %rbx, -32
.Ltmp108:
	.cfi_offset %r14, -24
.Ltmp109:
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
.Ltmp110:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp111:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp112:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp113:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp114:
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
.Ltmp115:
	.cfi_def_cfa_offset 64
.Ltmp116:
	.cfi_offset %rbx, -48
.Ltmp117:
	.cfi_offset %r12, -40
.Ltmp118:
	.cfi_offset %r13, -32
.Ltmp119:
	.cfi_offset %r14, -24
.Ltmp120:
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
.Ltmp121:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp122:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp123:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp124:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp125:
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
.Ltmp126:
	.cfi_def_cfa_offset 64
.Ltmp127:
	.cfi_offset %rbx, -48
.Ltmp128:
	.cfi_offset %r12, -40
.Ltmp129:
	.cfi_offset %r13, -32
.Ltmp130:
	.cfi_offset %r14, -24
.Ltmp131:
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
.Ltmp132:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp133:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp134:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp135:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp136:
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
.Ltmp137:
	.cfi_def_cfa_offset 64
.Ltmp138:
	.cfi_offset %rbx, -48
.Ltmp139:
	.cfi_offset %r12, -40
.Ltmp140:
	.cfi_offset %r13, -32
.Ltmp141:
	.cfi_offset %r14, -24
.Ltmp142:
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
.Ltmp143:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp144:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp145:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp146:
	.cfi_def_cfa_offset 40
	subq	$24, %rsp
.Ltmp147:
	.cfi_def_cfa_offset 64
.Ltmp148:
	.cfi_offset %rbx, -40
.Ltmp149:
	.cfi_offset %r12, -32
.Ltmp150:
	.cfi_offset %r14, -24
.Ltmp151:
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
	.loc	1 199 7                 # CoinGame.c:199:7
	cmpq	%rdx, 8(%rbx,%rcx,8)
	jle	.LBB8_7
# BB#6:                                 # %polly.stmt.if.end55
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
.Ltmp152:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp153:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp154:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp155:
	.cfi_def_cfa_offset 40
	subq	$24, %rsp
.Ltmp156:
	.cfi_def_cfa_offset 64
.Ltmp157:
	.cfi_offset %rbx, -40
.Ltmp158:
	.cfi_offset %r12, -32
.Ltmp159:
	.cfi_offset %r14, -24
.Ltmp160:
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
	.loc	1 211 7                 # CoinGame.c:211:7
	cmpq	%rdx, 8(%rbx,%rcx,8)
	jle	.LBB9_7
# BB#6:                                 # %polly.stmt.if.end63
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
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git 83402ed45b681e9f38ce6626e5899c19159ceb29) (http://llvm.org/git/llvm.git 4fc8e6fd79f212952e8f538b6d5d9d78098b4505)" # string offset=0
.Linfo_string1:
	.asciz	"CoinGame.c"            # string offset=165
.Linfo_string2:
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/autogenerate_array_copyonly" # string offset=176
.Linfo_string3:
	.asciz	"findMoves"             # string offset=257
.Linfo_string4:
	.asciz	"long long int"         # string offset=267
.Linfo_string5:
	.asciz	"main"                  # string offset=281
.Linfo_string6:
	.asciz	"int"                   # string offset=286
.Linfo_string7:
	.asciz	"moves"                 # string offset=290
.Linfo_string8:
	.asciz	"moves_size"            # string offset=296
.Linfo_string9:
	.asciz	"n"                     # string offset=307
.Linfo_string10:
	.asciz	"_10_size"              # string offset=309
.Linfo_string11:
	.asciz	"x_size"                # string offset=318
.Linfo_string12:
	.asciz	"_12_size"              # string offset=325
.Linfo_string13:
	.asciz	"y_size"                # string offset=334
.Linfo_string14:
	.asciz	"_14_size"              # string offset=341
.Linfo_string15:
	.asciz	"z_size"                # string offset=350
.Linfo_string16:
	.asciz	"_70"                   # string offset=357
.Linfo_string17:
	.asciz	"_69"                   # string offset=361
.Linfo_string18:
	.asciz	"_68"                   # string offset=365
.Linfo_string19:
	.asciz	"_67"                   # string offset=369
.Linfo_string20:
	.asciz	"_66"                   # string offset=373
.Linfo_string21:
	.asciz	"_65"                   # string offset=377
.Linfo_string22:
	.asciz	"_64"                   # string offset=381
.Linfo_string23:
	.asciz	"_63"                   # string offset=385
.Linfo_string24:
	.asciz	"_62"                   # string offset=389
.Linfo_string25:
	.asciz	"_61"                   # string offset=393
.Linfo_string26:
	.asciz	"_60"                   # string offset=397
.Linfo_string27:
	.asciz	"_59"                   # string offset=401
.Linfo_string28:
	.asciz	"_58"                   # string offset=405
.Linfo_string29:
	.asciz	"_57"                   # string offset=409
.Linfo_string30:
	.asciz	"_56"                   # string offset=413
.Linfo_string31:
	.asciz	"_55"                   # string offset=417
.Linfo_string32:
	.asciz	"_54"                   # string offset=421
.Linfo_string33:
	.asciz	"_53"                   # string offset=425
.Linfo_string34:
	.asciz	"_52"                   # string offset=429
.Linfo_string35:
	.asciz	"_51"                   # string offset=433
.Linfo_string36:
	.asciz	"_50"                   # string offset=437
.Linfo_string37:
	.asciz	"_49"                   # string offset=441
.Linfo_string38:
	.asciz	"_48"                   # string offset=445
.Linfo_string39:
	.asciz	"_47"                   # string offset=449
.Linfo_string40:
	.asciz	"_46"                   # string offset=453
.Linfo_string41:
	.asciz	"_45"                   # string offset=457
.Linfo_string42:
	.asciz	"_44"                   # string offset=461
.Linfo_string43:
	.asciz	"_43"                   # string offset=465
.Linfo_string44:
	.asciz	"_42"                   # string offset=469
.Linfo_string45:
	.asciz	"_41"                   # string offset=473
.Linfo_string46:
	.asciz	"_40"                   # string offset=477
.Linfo_string47:
	.asciz	"_39"                   # string offset=481
.Linfo_string48:
	.asciz	"_38"                   # string offset=485
.Linfo_string49:
	.asciz	"_37"                   # string offset=489
.Linfo_string50:
	.asciz	"_36"                   # string offset=493
.Linfo_string51:
	.asciz	"_35"                   # string offset=497
.Linfo_string52:
	.asciz	"_34"                   # string offset=501
.Linfo_string53:
	.asciz	"_33"                   # string offset=505
.Linfo_string54:
	.asciz	"_32"                   # string offset=509
.Linfo_string55:
	.asciz	"_31"                   # string offset=513
.Linfo_string56:
	.asciz	"_30"                   # string offset=517
.Linfo_string57:
	.asciz	"_29"                   # string offset=521
.Linfo_string58:
	.asciz	"_28"                   # string offset=525
.Linfo_string59:
	.asciz	"_27"                   # string offset=529
.Linfo_string60:
	.asciz	"_26"                   # string offset=533
.Linfo_string61:
	.asciz	"_25"                   # string offset=537
.Linfo_string62:
	.asciz	"_24"                   # string offset=541
.Linfo_string63:
	.asciz	"_23"                   # string offset=545
.Linfo_string64:
	.asciz	"_22"                   # string offset=549
.Linfo_string65:
	.asciz	"_21"                   # string offset=553
.Linfo_string66:
	.asciz	"_20"                   # string offset=557
.Linfo_string67:
	.asciz	"_19"                   # string offset=561
.Linfo_string68:
	.asciz	"_18"                   # string offset=565
.Linfo_string69:
	.asciz	"_17"                   # string offset=569
.Linfo_string70:
	.asciz	"_16"                   # string offset=573
.Linfo_string71:
	.asciz	"_15"                   # string offset=577
.Linfo_string72:
	.asciz	"_13"                   # string offset=581
.Linfo_string73:
	.asciz	"_11"                   # string offset=585
.Linfo_string74:
	.asciz	"_9"                    # string offset=589
.Linfo_string75:
	.asciz	"i"                     # string offset=592
.Linfo_string76:
	.asciz	"j"                     # string offset=594
.Linfo_string77:
	.asciz	"s"                     # string offset=596
.Linfo_string78:
	.asciz	"_2_size"               # string offset=598
.Linfo_string79:
	.asciz	"x"                     # string offset=606
.Linfo_string80:
	.asciz	"_10"                   # string offset=608
.Linfo_string81:
	.asciz	"y"                     # string offset=612
.Linfo_string82:
	.asciz	"_12"                   # string offset=614
.Linfo_string83:
	.asciz	"z"                     # string offset=618
.Linfo_string84:
	.asciz	"_14"                   # string offset=620
.Linfo_string85:
	.asciz	"_2"                    # string offset=624
.Linfo_string86:
	.asciz	"argc"                  # string offset=627
.Linfo_string87:
	.asciz	"args"                  # string offset=632
.Linfo_string88:
	.asciz	"char"                  # string offset=637
.Linfo_string89:
	.asciz	"sum_alice"             # string offset=642
.Linfo_string90:
	.asciz	"_6_size"               # string offset=652
.Linfo_string91:
	.asciz	"_6_size_size"          # string offset=660
.Linfo_string92:
	.asciz	"_7"                    # string offset=673
.Linfo_string93:
	.asciz	"_8_size"               # string offset=676
.Linfo_string94:
	.asciz	"_11_size"              # string offset=684
.Linfo_string95:
	.asciz	"_18_size"              # string offset=693
.Linfo_string96:
	.asciz	"_23_size"              # string offset=702
.Linfo_string97:
	.asciz	"_6"                    # string offset=711
.Linfo_string98:
	.asciz	"_8"                    # string offset=714
.Linfo_string99:
	.asciz	"max"                   # string offset=717
.Linfo_string100:
	.asciz	"_5"                    # string offset=721
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp17-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	48                      # 48
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
	.quad	.Ltmp14-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp22-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
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
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
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
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
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
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
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
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc10:
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
.Ldebug_loc11:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp62-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp62-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp60-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp64-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp56-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp56-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
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
	.quad	.Ltmp54-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
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
	.quad	.Ltmp50-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
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
	.quad	.Ltmp48-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
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
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
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
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc33:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
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
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc35:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc36:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc37:
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
.Ldebug_loc38:
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
.Ldebug_loc39:
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp35-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc40:
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp35-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc41:
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp23-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc42:
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp23-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc43:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc44:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc45:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc46:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc47:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp81-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc48:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc49:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	50                      # 50
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc50:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	23                      # 23
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc51:
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc52:
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc53:
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp80-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc54:
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp80-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc55:
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc56:
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc57:
	.quad	.Ltmp81-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc58:
	.quad	.Ltmp83-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc59:
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
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
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.byte	25                      # DW_FORM_flag_present
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
	.ascii	"\347\177"              # DW_AT_APPLE_omit_frame_ptr
	.byte	25                      # DW_FORM_flag_present
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
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
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
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.ascii	"\347\177"              # DW_AT_APPLE_omit_frame_ptr
	.byte	25                      # DW_FORM_flag_present
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
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
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
	.byte	10                      # Abbreviation Code
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
	.byte	11                      # Abbreviation Code
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
	.byte	12                      # Abbreviation Code
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
	.byte	13                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	14                      # Abbreviation Code
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
	.long	1648                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x669 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x1 DW_TAG_pointer_type
	.byte	3                       # Abbrev [3] 0x2b:0x44e DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1610                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	4                       # Abbrev [4] 0x44:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1610                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x53:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x62:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x71:0xf DW_TAG_variable
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x80:0xf DW_TAG_variable
	.long	.Ldebug_loc4            # DW_AT_location
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x8f:0xf DW_TAG_variable
	.long	.Ldebug_loc5            # DW_AT_location
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x9e:0xf DW_TAG_variable
	.long	.Ldebug_loc6            # DW_AT_location
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xad:0xf DW_TAG_variable
	.long	.Ldebug_loc7            # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xbc:0xf DW_TAG_variable
	.long	.Ldebug_loc8            # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xcb:0xf DW_TAG_variable
	.long	.Ldebug_loc9            # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	71                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xda:0xf DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xe9:0xf DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	69                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xf8:0xf DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	68                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x107:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	67                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x113:0xf DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	66                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x122:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	65                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x12e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x13a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x146:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x152:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	61                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x15e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	60                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x16a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x176:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	58                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x182:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	57                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x18e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	56                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x19a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	55                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1a6:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	54                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x1b5:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	53                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1c1:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	52                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1d0:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1df:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	50                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1ee:0xf DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	49                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1fd:0xf DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	48                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x20c:0xf DW_TAG_variable
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	47                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x21b:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	46                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x227:0xf DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	45                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x236:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x242:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	43                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x24e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	42                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x25a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	41                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x266:0xf DW_TAG_variable
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	40                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x275:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	39                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x281:0xf DW_TAG_variable
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	38                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x290:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	37                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x29c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2a8:0xf DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2b7:0xf DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2c6:0xf DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	33                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2d5:0xf DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x2e4:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2f0:0xf DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	30                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x2ff:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	29                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x30b:0xf DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	28                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x31a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x326:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x332:0xf DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	25                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x341:0xf DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	24                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x350:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	23                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x35c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	22                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x368:0xf DW_TAG_variable
	.long	.Ldebug_loc32           # DW_AT_location
	.long	.Linfo_string66         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	21                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x377:0xf DW_TAG_variable
	.long	.Ldebug_loc33           # DW_AT_location
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	20                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x386:0xf DW_TAG_variable
	.long	.Ldebug_loc34           # DW_AT_location
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x395:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3a1:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	17                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3ad:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	16                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3b9:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3c5:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3d1:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x3dd:0xf DW_TAG_variable
	.long	.Ldebug_loc35           # DW_AT_location
	.long	.Linfo_string75         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3ec:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string76         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x3f8:0xf DW_TAG_variable
	.long	.Ldebug_loc36           # DW_AT_location
	.long	.Linfo_string77         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x407:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string78         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x413:0xf DW_TAG_variable
	.long	.Ldebug_loc37           # DW_AT_location
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	1610                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x422:0xf DW_TAG_variable
	.long	.Ldebug_loc38           # DW_AT_location
	.long	.Linfo_string80         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	1610                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x431:0xf DW_TAG_variable
	.long	.Ldebug_loc39           # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	1610                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x440:0xf DW_TAG_variable
	.long	.Ldebug_loc40           # DW_AT_location
	.long	.Linfo_string82         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
	.long	1610                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x44f:0xf DW_TAG_variable
	.long	.Ldebug_loc41           # DW_AT_location
	.long	.Linfo_string83         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	1610                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x45e:0xf DW_TAG_variable
	.long	.Ldebug_loc42           # DW_AT_location
	.long	.Linfo_string84         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	1610                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x46d:0xb DW_TAG_variable
	.long	.Linfo_string85         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	1610                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	8                       # Abbrev [8] 0x479:0x1d1 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	287                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1622                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	9                       # Abbrev [9] 0x493:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc43           # DW_AT_location
	.long	.Linfo_string86         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	287                     # DW_AT_decl_line
	.long	1622                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0x4a3:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc44           # DW_AT_location
	.long	.Linfo_string87         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	287                     # DW_AT_decl_line
	.long	1629                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x4b3:0x10 DW_TAG_variable
	.long	.Ldebug_loc45           # DW_AT_location
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	289                     # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x4c3:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	290                     # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x4d0:0x10 DW_TAG_variable
	.long	.Ldebug_loc46           # DW_AT_location
	.long	.Linfo_string89         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	291                     # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x4e0:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string90         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	293                     # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x4ed:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string91         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	293                     # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x4fa:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string92         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	294                     # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x507:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string93         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	295                     # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x514:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	296                     # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x521:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string80         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	297                     # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x52e:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string94         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	298                     # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x53b:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	299                     # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x548:0x10 DW_TAG_variable
	.long	.Ldebug_loc47           # DW_AT_location
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	300                     # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x558:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string84         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	301                     # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x565:0x10 DW_TAG_variable
	.long	.Ldebug_loc48           # DW_AT_location
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	302                     # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x575:0x10 DW_TAG_variable
	.long	.Ldebug_loc49           # DW_AT_location
	.long	.Linfo_string95         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	304                     # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x585:0x10 DW_TAG_variable
	.long	.Ldebug_loc50           # DW_AT_location
	.long	.Linfo_string96         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	307                     # DW_AT_decl_line
	.long	1615                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x595:0x10 DW_TAG_variable
	.long	.Ldebug_loc51           # DW_AT_location
	.long	.Linfo_string97         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	293                     # DW_AT_decl_line
	.long	1646                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x5a5:0x10 DW_TAG_variable
	.long	.Ldebug_loc52           # DW_AT_location
	.long	.Linfo_string98         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	295                     # DW_AT_decl_line
	.long	1610                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x5b5:0x10 DW_TAG_variable
	.long	.Ldebug_loc53           # DW_AT_location
	.long	.Linfo_string99         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	288                     # DW_AT_decl_line
	.long	1610                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x5c5:0x10 DW_TAG_variable
	.long	.Ldebug_loc54           # DW_AT_location
	.long	.Linfo_string100        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	292                     # DW_AT_decl_line
	.long	1610                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x5d5:0x10 DW_TAG_variable
	.long	.Ldebug_loc55           # DW_AT_location
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	290                     # DW_AT_decl_line
	.long	1610                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x5e5:0x10 DW_TAG_variable
	.long	.Ldebug_loc56           # DW_AT_location
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	298                     # DW_AT_decl_line
	.long	1610                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x5f5:0x10 DW_TAG_variable
	.long	.Ldebug_loc57           # DW_AT_location
	.long	.Linfo_string82         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	299                     # DW_AT_decl_line
	.long	1610                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x605:0x10 DW_TAG_variable
	.long	.Ldebug_loc58           # DW_AT_location
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	304                     # DW_AT_decl_line
	.long	1610                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x615:0x10 DW_TAG_variable
	.long	.Ldebug_loc59           # DW_AT_location
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	307                     # DW_AT_decl_line
	.long	1610                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x625:0xc DW_TAG_variable
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	303                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x631:0xc DW_TAG_variable
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	305                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x63d:0xc DW_TAG_variable
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	306                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	13                      # Abbrev [13] 0x64a:0x5 DW_TAG_pointer_type
	.long	1615                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x64f:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	14                      # Abbrev [14] 0x656:0x7 DW_TAG_base_type
	.long	.Linfo_string6          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	13                      # Abbrev [13] 0x65d:0x5 DW_TAG_pointer_type
	.long	1634                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x662:0x5 DW_TAG_pointer_type
	.long	1639                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x667:0x7 DW_TAG_base_type
	.long	.Linfo_string88         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	13                      # Abbrev [13] 0x66e:0x5 DW_TAG_pointer_type
	.long	1610                    # DW_AT_type
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
	.long	1652                    # Compilation Unit Length
	.long	1145                    # DIE offset
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
	.long	1652                    # Compilation Unit Length
	.long	1615                    # DIE offset
	.asciz	"long long int"         # External Name
	.long	1622                    # DIE offset
	.asciz	"int"                   # External Name
	.long	1639                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git 83402ed45b681e9f38ce6626e5899c19159ceb29) (http://llvm.org/git/llvm.git 4fc8e6fd79f212952e8f538b6d5d9d78098b4505)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
