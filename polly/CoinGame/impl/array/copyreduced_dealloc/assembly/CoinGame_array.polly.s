	.text
	.file	"llvm/CoinGame_array.polly.ll"
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
	movq	%rdi, 16(%rsp)          # 8-byte Spill
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
	#DEBUG_VALUE: findMoves:moves <- [%RSP+16]
	.loc	1 83 2 prologue_end     # CoinGame_array.c:83:2
	xorl	%edi, %edi
	movl	%ebp, %esi
.Ltmp16:
	callq	create1DArray
.Ltmp17:
	movq	%rax, %r13
.Ltmp18:
	#DEBUG_VALUE: findMoves:_10 <- %R13
	#DEBUG_VALUE: findMoves:x <- %R13
	#DEBUG_VALUE: findMoves:x_dealloc <- 1
	.loc	1 93 2                  # CoinGame_array.c:93:2
	xorl	%edi, %edi
	movl	%ebp, %esi
	callq	create1DArray
	movq	%rax, %r12
.Ltmp19:
	#DEBUG_VALUE: findMoves:_12 <- %R12
	#DEBUG_VALUE: findMoves:y <- %R12
	#DEBUG_VALUE: findMoves:y_dealloc <- 1
	.loc	1 103 2                 # CoinGame_array.c:103:2
	xorl	%edi, %edi
	movl	%ebp, %esi
	callq	create1DArray
	movq	%rbp, %rdx
.Ltmp20:
	#DEBUG_VALUE: findMoves:n <- %RDX
	movq	%rax, %rbx
.Ltmp21:
	#DEBUG_VALUE: findMoves:_14 <- %RBX
	#DEBUG_VALUE: findMoves:z <- %RBX
	#DEBUG_VALUE: findMoves:z_dealloc <- 1
	.loc	1 116 6                 # CoinGame_array.c:116:6
	testq	%rdx, %rdx
	jle	.LBB0_24
.Ltmp22:
# BB#1:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:z <- %RBX
	#DEBUG_VALUE: findMoves:_14 <- %RBX
	#DEBUG_VALUE: findMoves:n <- %RDX
	#DEBUG_VALUE: findMoves:y <- %R12
	#DEBUG_VALUE: findMoves:_12 <- %R12
	#DEBUG_VALUE: findMoves:x <- %R13
	#DEBUG_VALUE: findMoves:_10 <- %R13
	movq	%rdx, %rax
	decq	%rax
	seto	%r10b
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	%rax, %rcx
	imulq	%rdx, %rcx
	seto	8(%rsp)                 # 1-byte Folded Spill
	addq	%rdx, %rcx
	seto	56(%rsp)                # 1-byte Folded Spill
	movq	16(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%rcx,8), %rsi
	cmpq	%r12, %rsi
	setbe	48(%rsp)                # 1-byte Folded Spill
	leaq	(%r12,%rdx,8), %rcx
	cmpq	%rax, %rcx
	setbe	40(%rsp)                # 1-byte Folded Spill
	leaq	(%r13,%rdx,8), %rdi
	cmpq	%r12, %rdi
	setbe	%bpl
	cmpq	%r13, %rcx
	setbe	32(%rsp)                # 1-byte Folded Spill
	movq	%rdx, 24(%rsp)          # 8-byte Spill
	movq	24(%rsp), %rdx          # 8-byte Reload
.Ltmp23:
	movq	%rbx, (%rsp)            # 8-byte Spill
	movq	(%rsp), %rbx            # 8-byte Reload
.Ltmp24:
	leaq	(%rbx,%rdx,8), %r8
	cmpq	%r12, %r8
	setbe	%r11b
	cmpq	(%rsp), %rcx            # 8-byte Folded Reload
	setbe	%r15b
	cmpq	%rax, %rdi
	setbe	%r14b
	cmpq	%r13, %rsi
	setbe	%dl
	cmpq	%rax, %r8
	setbe	%r9b
	cmpq	(%rsp), %rsi            # 8-byte Folded Reload
	setbe	%sil
	cmpq	%r13, %r8
	movq	(%rsp), %rbx            # 8-byte Reload
	movq	24(%rsp), %r8           # 8-byte Reload
	setbe	%cl
	cmpq	%rbx, %rdi
	setbe	%al
	orb	%cl, %al
	cmpb	$1, %al
	jne	.LBB0_9
.Ltmp25:
# BB#2:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:y <- %R12
	#DEBUG_VALUE: findMoves:_12 <- %R12
	#DEBUG_VALUE: findMoves:x <- %R13
	#DEBUG_VALUE: findMoves:_10 <- %R13
	orb	%r9b, %sil
	je	.LBB0_9
.Ltmp26:
# BB#3:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:y <- %R12
	#DEBUG_VALUE: findMoves:_12 <- %R12
	#DEBUG_VALUE: findMoves:x <- %R13
	#DEBUG_VALUE: findMoves:_10 <- %R13
	orb	%r14b, %dl
	je	.LBB0_9
.Ltmp27:
# BB#4:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:y <- %R12
	#DEBUG_VALUE: findMoves:_12 <- %R12
	#DEBUG_VALUE: findMoves:x <- %R13
	#DEBUG_VALUE: findMoves:_10 <- %R13
	orb	%r11b, %r15b
	je	.LBB0_9
.Ltmp28:
# BB#5:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:y <- %R12
	#DEBUG_VALUE: findMoves:_12 <- %R12
	#DEBUG_VALUE: findMoves:x <- %R13
	#DEBUG_VALUE: findMoves:_10 <- %R13
	orb	32(%rsp), %bpl          # 1-byte Folded Reload
	je	.LBB0_9
.Ltmp29:
# BB#6:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:y <- %R12
	#DEBUG_VALUE: findMoves:_12 <- %R12
	#DEBUG_VALUE: findMoves:x <- %R13
	#DEBUG_VALUE: findMoves:_10 <- %R13
	movabsq	$9223372036854775807, %rax # imm = 0x7FFFFFFFFFFFFFFF
	cmpq	%rax, %r8
	je	.LBB0_9
.Ltmp30:
# BB#7:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:y <- %R12
	#DEBUG_VALUE: findMoves:_12 <- %R12
	#DEBUG_VALUE: findMoves:x <- %R13
	#DEBUG_VALUE: findMoves:_10 <- %R13
	movb	40(%rsp), %al           # 1-byte Reload
	orb	%al, 48(%rsp)           # 1-byte Folded Spill
	je	.LBB0_9
.Ltmp31:
# BB#8:                                 # %polly.split_new_and_old
	#DEBUG_VALUE: findMoves:y <- %R12
	#DEBUG_VALUE: findMoves:_12 <- %R12
	#DEBUG_VALUE: findMoves:x <- %R13
	#DEBUG_VALUE: findMoves:_10 <- %R13
	orb	8(%rsp), %r10b          # 1-byte Folded Reload
	orb	56(%rsp), %r10b         # 1-byte Folded Reload
	xorb	$1, %r10b
	je	.LBB0_9
.Ltmp32:
# BB#25:                                # %polly.loop_preheader
	#DEBUG_VALUE: findMoves:y <- %R12
	#DEBUG_VALUE: findMoves:_12 <- %R12
	#DEBUG_VALUE: findMoves:x <- %R13
	#DEBUG_VALUE: findMoves:_10 <- %R13
	movq	16(%rsp), %rax          # 8-byte Reload
	leaq	-8(%rax,%r8,8), %r9
	leaq	8(,%r8,8), %r10
	movq	%r8, %r11
	shlq	$4, %r11
	addq	%rax, %r11
	leaq	-16(%rax), %r14
	leaq	-2(%r8), %rcx
	movq	%rcx, 80(%rsp)          # 8-byte Spill
	movl	$1, %ecx
	movl	$2, %edx
	movq	%rax, %rdi
	xorl	%ebp, %ebp
	movq	%r10, 72(%rsp)          # 8-byte Spill
.Ltmp33:
	.p2align	4, 0x90
.LBB0_26:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_44 Depth 2
                                        #     Child Loop BB0_46 Depth 2
                                        #     Child Loop BB0_48 Depth 2
                                        #     Child Loop BB0_33 Depth 2
                                        #     Child Loop BB0_37 Depth 2
                                        #     Child Loop BB0_41 Depth 2
	movq	%rdi, 32(%rsp)          # 8-byte Spill
	movq	%r14, 56(%rsp)          # 8-byte Spill
	testq	%rdx, %rdx
	movq	%rbp, %rsi
	movl	$0, %ebp
	movq	%rdx, 40(%rsp)          # 8-byte Spill
	cmovnsq	%rdx, %rbp
	testq	%rcx, %rcx
	movl	$0, %r14d
	movq	%rcx, 48(%rsp)          # 8-byte Spill
	cmovnsq	%rcx, %r14
	movq	64(%rsp), %rdx          # 8-byte Reload
	movq	%rdx, %rax
	subq	%rsi, %rax
	movl	$0, %ecx
	cmovsq	%rcx, %rax
	movq	%r8, %r15
	movq	%rsi, 8(%rsp)           # 8-byte Spill
	subq	%rsi, %r15
	jle	.LBB0_28
# BB#27:                                # %polly.loop_header394.preheader
                                        #   in Loop: Header=BB0_26 Depth=1
	leaq	8(,%rax,8), %rbx
	xorl	%esi, %esi
	movq	%r13, %rdi
	movq	%rbx, %rdx
	movq	%r9, 96(%rsp)           # 8-byte Spill
	movq	%r11, 88(%rsp)          # 8-byte Spill
	callq	memset
	xorl	%esi, %esi
	movq	(%rsp), %rdi            # 8-byte Reload
	movq	%rbx, %rdx
	callq	memset
	xorl	%esi, %esi
	movq	%r12, %rdi
	movq	%rbx, %rdx
	callq	memset
	movq	88(%rsp), %r11          # 8-byte Reload
	movq	72(%rsp), %r10          # 8-byte Reload
	movq	96(%rsp), %r9           # 8-byte Reload
	movq	64(%rsp), %rdx          # 8-byte Reload
	movq	24(%rsp), %r8           # 8-byte Reload
.LBB0_28:                               # %polly.loop_exit396
                                        #   in Loop: Header=BB0_26 Depth=1
	movl	$1, %eax
	subq	8(%rsp), %rax           # 8-byte Folded Reload
	movl	$0, %ecx
	cmovnsq	%rax, %rcx
	cmpq	%r15, %rdx
	movq	%r15, %rax
	cmovleq	%rdx, %rax
	cmpq	%rax, %rcx
	jge	.LBB0_29
# BB#43:                                # %polly.loop_preheader405
                                        #   in Loop: Header=BB0_26 Depth=1
	movq	%r10, %rcx
	imulq	%r14, %rcx
	decq	%r14
	addq	%r9, %rcx
	decq	%rax
	.p2align	4, 0x90
.LBB0_44:                               # %polly.loop_header404
                                        #   Parent Loop BB0_26 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rcx), %rdx
	movq	%rdx, 8(%r12,%r14,8)
	incq	%r14
	addq	%r10, %rcx
	cmpq	%rax, %r14
	jl	.LBB0_44
.LBB0_29:                               # %polly.loop_exit406
                                        #   in Loop: Header=BB0_26 Depth=1
	movq	80(%rsp), %rcx          # 8-byte Reload
	cmpq	%r15, %rcx
	movq	%r15, %rax
	cmovleq	%rcx, %rax
	testq	%rax, %rax
	movq	(%rsp), %rbx            # 8-byte Reload
	jle	.LBB0_30
# BB#45:                                # %polly.loop_preheader419
                                        #   in Loop: Header=BB0_26 Depth=1
	decq	%rax
	movq	$-1, %rcx
	movq	%r11, %rdx
	.p2align	4, 0x90
.LBB0_46:                               # %polly.loop_header418
                                        #   Parent Loop BB0_26 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rdx), %rsi
	movq	%rsi, 8(%r13,%rcx,8)
	incq	%rcx
	addq	%r10, %rdx
	cmpq	%rax, %rcx
	jl	.LBB0_46
.LBB0_30:                               # %polly.loop_exit420
                                        #   in Loop: Header=BB0_26 Depth=1
	movl	$2, %eax
	subq	8(%rsp), %rax           # 8-byte Folded Reload
	movl	$0, %ecx
	cmovnsq	%rax, %rcx
	cmpq	%r15, %rcx
	movq	56(%rsp), %r14          # 8-byte Reload
	movq	32(%rsp), %rdi          # 8-byte Reload
	jge	.LBB0_31
# BB#47:                                # %polly.loop_preheader435
                                        #   in Loop: Header=BB0_26 Depth=1
	movq	%r10, %rax
	imulq	%rbp, %rax
	decq	%rbp
	addq	%r14, %rax
	leaq	-1(%r15), %rcx
	.p2align	4, 0x90
.LBB0_48:                               # %polly.loop_header434
                                        #   Parent Loop BB0_26 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rax), %rdx
	movq	%rdx, 8(%rbx,%rbp,8)
	incq	%rbp
	addq	%r10, %rax
	cmpq	%rcx, %rbp
	jl	.LBB0_48
.LBB0_31:                               # %polly.loop_exit436
                                        #   in Loop: Header=BB0_26 Depth=1
	testq	%r15, %r15
	movq	8(%rsp), %rbp           # 8-byte Reload
	jle	.LBB0_42
# BB#32:                                # %polly.loop_header450.preheader
                                        #   in Loop: Header=BB0_26 Depth=1
	decq	%r15
	movq	$-1, %rax
	.p2align	4, 0x90
.LBB0_33:                               # %polly.loop_header450
                                        #   Parent Loop BB0_26 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%r12,%rax,8), %rcx
.Ltmp34:
	.loc	1 218 7                 # CoinGame_array.c:218:7
	cmpq	%rcx, 8(%r13,%rax,8)
	jle	.LBB0_35
# BB#34:                                # %polly.stmt.if.end78
                                        #   in Loop: Header=BB0_33 Depth=2
	movq	%rcx, 8(%r13,%rax,8)
.LBB0_35:                               # %polly.stmt.blklab7.exit
                                        #   in Loop: Header=BB0_33 Depth=2
	incq	%rax
	cmpq	%r15, %rax
	jl	.LBB0_33
# BB#36:                                # %polly.loop_header463.preheader
                                        #   in Loop: Header=BB0_26 Depth=1
	movq	$-1, %rax
	.p2align	4, 0x90
.LBB0_37:                               # %polly.loop_header463
                                        #   Parent Loop BB0_26 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%r12,%rax,8), %rcx
	.loc	1 230 7                 # CoinGame_array.c:230:7
	cmpq	%rcx, 8(%rbx,%rax,8)
	jle	.LBB0_39
# BB#38:                                # %polly.stmt.if.end86
                                        #   in Loop: Header=BB0_37 Depth=2
	movq	%rcx, 8(%rbx,%rax,8)
.LBB0_39:                               # %polly.stmt.blklab8.exit
                                        #   in Loop: Header=BB0_37 Depth=2
	incq	%rax
	cmpq	%r15, %rax
	jl	.LBB0_37
# BB#40:                                # %polly.loop_preheader477
                                        #   in Loop: Header=BB0_26 Depth=1
	movq	%rdi, %rax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_41:                               # %polly.loop_header476
                                        #   Parent Loop BB0_26 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%r13,%rcx,8), %rdx
	addq	%rcx, %rdx
.Ltmp35:
	.loc	1 246 10                # CoinGame_array.c:246:10
	leaq	(%rbp,%rcx), %rsi
	addq	(%rbx,%rcx,8), %rsi
	cmpq	%rsi, %rdx
.Ltmp36:
	.loc	1 246 7 is_stmt 0       # CoinGame_array.c:246:7
	cmovgeq	%rdx, %rsi
	movq	%rsi, (%rax)
	addq	%r10, %rax
	cmpq	%r15, %rcx
	leaq	1(%rcx), %rcx
	jl	.LBB0_41
.LBB0_42:                               # %polly.loop_exit478
                                        #   in Loop: Header=BB0_26 Depth=1
	incq	%rbp
	movq	48(%rsp), %rcx          # 8-byte Reload
	decq	%rcx
	addq	$8, %r9
	addq	$8, %r11
	movq	40(%rsp), %rdx          # 8-byte Reload
	decq	%rdx
	addq	$8, %r14
	addq	$8, %rdi
	cmpq	%r8, %rbp
	jne	.LBB0_26
	jmp	.LBB0_24
.LBB0_9:                                # %while.cond32.preheader.preheader
.Ltmp37:
	#DEBUG_VALUE: findMoves:y <- %R12
	#DEBUG_VALUE: findMoves:_12 <- %R12
	#DEBUG_VALUE: findMoves:x <- %R13
	#DEBUG_VALUE: findMoves:_10 <- %R13
	.loc	1 126 7 is_stmt 1       # CoinGame_array.c:126:7
	leaq	(,%r8,8), %r9
	leaq	8(,%r8,8), %r11
	movq	%r8, %r10
	shlq	$4, %r10
	xorl	%r14d, %r14d
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	%r8, %r15
.Ltmp38:
	.p2align	4, 0x90
.LBB0_10:                               # %while.cond32.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_11 Depth 2
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movq	%rax, %rdi
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_11:                               # %if.end37
                                        #   Parent Loop BB0_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: findMoves:_17 <- 0
	.loc	1 25 12                 # CoinGame_array.c:25:12
	leaq	(%r14,%rax), %rcx
.Ltmp39:
	.loc	1 130 9                 # CoinGame_array.c:130:9
	movq	$0, (%r12,%rax,8)
.Ltmp40:
	#DEBUG_VALUE: findMoves:_18 <- 1
	.loc	1 134 9                 # CoinGame_array.c:134:9
	leaq	1(%rax), %rdx
.Ltmp41:
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_22 <- 0
	#DEBUG_VALUE: findMoves:_20 <- 1
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:i <- %RDX
	.loc	1 144 10                # CoinGame_array.c:144:10
	testq	%rcx, %rcx
	jle	.LBB0_14
.Ltmp42:
# BB#12:                                # %if.end37
                                        #   in Loop: Header=BB0_11 Depth=2
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	cmpq	%r8, %rdx
	jge	.LBB0_14
.Ltmp43:
# BB#13:                                # %if.end45
                                        #   in Loop: Header=BB0_11 Depth=2
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_23 <- 1
	#DEBUG_VALUE: findMoves:_27 <- 1
	.loc	1 158 8                 # CoinGame_array.c:158:8
	movq	-8(%r9,%rdi), %rsi
.Ltmp44:
	#DEBUG_VALUE: findMoves:_29 <- %RSI
	.loc	1 160 9                 # CoinGame_array.c:160:9
	movq	%rsi, (%r12,%rax,8)
.Ltmp45:
.LBB0_14:                               # %blklab4
                                        #   in Loop: Header=BB0_11 Depth=2
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_30 <- 0
	.loc	1 166 9                 # CoinGame_array.c:166:9
	movq	$0, (%r13,%rax,8)
.Ltmp46:
	#DEBUG_VALUE: findMoves:_31 <- 2
	.loc	1 170 9                 # CoinGame_array.c:170:9
	leaq	2(%rax), %rsi
.Ltmp47:
	#DEBUG_VALUE: findMoves:_34 <- %RSI
	#DEBUG_VALUE: findMoves:_32 <- %RSI
	.loc	1 172 7                 # CoinGame_array.c:172:7
	cmpq	%r8, %rsi
	jge	.LBB0_16
.Ltmp48:
# BB#15:                                # %if.end56
                                        #   in Loop: Header=BB0_11 Depth=2
	#DEBUG_VALUE: findMoves:_32 <- %RSI
	#DEBUG_VALUE: findMoves:_34 <- %RSI
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_33 <- 2
	.loc	1 182 8                 # CoinGame_array.c:182:8
	movq	(%r10,%rdi), %rsi
.Ltmp49:
	#DEBUG_VALUE: findMoves:_37 <- %RSI
	.loc	1 184 9                 # CoinGame_array.c:184:9
	movq	%rsi, (%r13,%rax,8)
.Ltmp50:
.LBB0_16:                               # %blklab5
                                        #   in Loop: Header=BB0_11 Depth=2
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_38 <- 0
	.loc	1 190 9                 # CoinGame_array.c:190:9
	movq	$0, (%rbx,%rax,8)
	#DEBUG_VALUE: findMoves:_41 <- 0
.Ltmp51:
	#DEBUG_VALUE: findMoves:_39 <- 1
	.loc	1 198 10                # CoinGame_array.c:198:10
	cmpq	$2, %rcx
	movl	$0, %esi
	jl	.LBB0_18
.Ltmp52:
# BB#17:                                # %if.end67
                                        #   in Loop: Header=BB0_11 Depth=2
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_44 <- 2
	.loc	1 208 8                 # CoinGame_array.c:208:8
	movq	-16(%rdi), %rsi
.Ltmp53:
	#DEBUG_VALUE: findMoves:_46 <- %RSI
	.loc	1 210 9                 # CoinGame_array.c:210:9
	movq	%rsi, (%rbx,%rax,8)
.Ltmp54:
.LBB0_18:                               # %blklab6
                                        #   in Loop: Header=BB0_11 Depth=2
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	.loc	1 214 8                 # CoinGame_array.c:214:8
	movq	(%r13,%rax,8), %r8
.Ltmp55:
	#DEBUG_VALUE: findMoves:_47 <- %R8
	.loc	1 216 8                 # CoinGame_array.c:216:8
	movq	(%r12,%rax,8), %rbp
.Ltmp56:
	#DEBUG_VALUE: findMoves:_49 <- %RBP
	#DEBUG_VALUE: findMoves:_48 <- %RBP
	.loc	1 218 7                 # CoinGame_array.c:218:7
	cmpq	%rbp, %r8
	jle	.LBB0_20
.Ltmp57:
# BB#19:                                # %if.end78
                                        #   in Loop: Header=BB0_11 Depth=2
	#DEBUG_VALUE: findMoves:_48 <- %RBP
	#DEBUG_VALUE: findMoves:_49 <- %RBP
	#DEBUG_VALUE: findMoves:_47 <- %R8
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	.loc	1 222 9                 # CoinGame_array.c:222:9
	movq	%rbp, (%r13,%rax,8)
	.loc	1 226 8                 # CoinGame_array.c:226:8
	movq	(%rsp), %rsi            # 8-byte Reload
	movq	(%rsi,%rax,8), %rsi
	movq	%rbp, %r8
.Ltmp58:
	.loc	1 228 8                 # CoinGame_array.c:228:8
	movq	(%r12,%rax,8), %rbp
.Ltmp59:
.LBB0_20:                               # %blklab7
                                        #   in Loop: Header=BB0_11 Depth=2
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_50 <- %RSI
	.loc	1 230 7                 # CoinGame_array.c:230:7
	cmpq	%rbp, %rsi
.Ltmp60:
	#DEBUG_VALUE: findMoves:_51 <- %RBP
	jle	.LBB0_22
.Ltmp61:
# BB#21:                                # %if.end86
                                        #   in Loop: Header=BB0_11 Depth=2
	#DEBUG_VALUE: findMoves:_51 <- %RBP
	#DEBUG_VALUE: findMoves:_50 <- %RSI
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	.loc	1 234 9                 # CoinGame_array.c:234:9
	movq	(%rsp), %rbx            # 8-byte Reload
	movq	%rbp, (%rbx,%rax,8)
	.loc	1 238 8                 # CoinGame_array.c:238:8
	movq	(%r13,%rax,8), %r8
.Ltmp62:
.LBB0_22:                               # %blklab8
                                        #   in Loop: Header=BB0_11 Depth=2
	#DEBUG_VALUE: findMoves:_51 <- %RBP
	#DEBUG_VALUE: findMoves:_50 <- %RSI
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_53 <- %R8
	.loc	1 244 9                 # CoinGame_array.c:244:9
	addq	%r8, %rax
.Ltmp63:
	.loc	1 246 10                # CoinGame_array.c:246:10
	notq	%rbp
.Ltmp64:
	notq	%rsi
.Ltmp65:
	cmpq	%rsi, %rbp
	cmovgeq	%rbp, %rsi
	subq	%rsi, %rcx
	decq	%rcx
	cmpq	%rcx, %rax
.Ltmp66:
	.loc	1 258 4                 # CoinGame_array.c:258:4
	cmovgeq	%rax, %rcx
.Ltmp67:
	#DEBUG_VALUE: findMoves:_67 <- 1
	#DEBUG_VALUE: findMoves:_65 <- 1
	.loc	1 256 15                # CoinGame_array.c:256:15
	movq	%rcx, (%rdi)
	.loc	1 126 7                 # CoinGame_array.c:126:7
	addq	%r11, %rdi
	cmpq	%rdx, %r15
	movq	%rdx, %rax
	movq	24(%rsp), %r8           # 8-byte Reload
.Ltmp68:
	movq	(%rsp), %rbx            # 8-byte Reload
	jne	.LBB0_11
.Ltmp69:
# BB#23:                                # %blklab2
                                        #   in Loop: Header=BB0_10 Depth=1
	#DEBUG_VALUE: findMoves:i <- %RDX
	#DEBUG_VALUE: findMoves:_19 <- %RDX
	#DEBUG_VALUE: findMoves:_24 <- %RDX
	#DEBUG_VALUE: findMoves:_68 <- %RDX
	#DEBUG_VALUE: findMoves:_69 <- 1
	.loc	1 293 8                 # CoinGame_array.c:293:8
	incq	%r14
.Ltmp70:
	#DEBUG_VALUE: findMoves:_70 <- %R14
	#DEBUG_VALUE: findMoves:s <- %R14
	.loc	1 116 6                 # CoinGame_array.c:116:6
	decq	%r15
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$8, %rax
	cmpq	%r8, %r14
	jne	.LBB0_10
.Ltmp71:
.LBB0_24:                               # %if.then114
	.loc	1 303 2 discriminator 1 # CoinGame_array.c:303:2
	movq	%r13, %rdi
	callq	free
.Ltmp72:
	#DEBUG_VALUE: findMoves:x_dealloc <- 0
	.loc	1 304 2 discriminator 1 # CoinGame_array.c:304:2
	movq	%r12, %rdi
	callq	free
.Ltmp73:
	#DEBUG_VALUE: findMoves:y_dealloc <- 0
	.loc	1 305 2 discriminator 1 # CoinGame_array.c:305:2
	movq	%rbx, %rdi
	callq	free
.Ltmp74:
	#DEBUG_VALUE: findMoves:z_dealloc <- 0
	.loc	1 309 2                 # CoinGame_array.c:309:2
	movq	16(%rsp), %rax          # 8-byte Reload
	addq	$104, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp75:
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
.Ltmp76:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp77:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp78:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp79:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp80:
	.cfi_def_cfa_offset 48
.Ltmp81:
	.cfi_offset %rbx, -48
.Ltmp82:
	.cfi_offset %r12, -40
.Ltmp83:
	.cfi_offset %r13, -32
.Ltmp84:
	.cfi_offset %r14, -24
.Ltmp85:
	.cfi_offset %r15, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
.Ltmp86:
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
.Ltmp87:
	#DEBUG_VALUE: main:_6 <- %RAX
	.loc	1 348 5                 # CoinGame_array.c:348:5
	movq	(%rax), %rdi
.Ltmp88:
	#DEBUG_VALUE: main:_8 <- %RDI
	.loc	1 351 2                 # CoinGame_array.c:351:2
	callq	parseStringToInt
.Ltmp89:
	movq	%rax, %r15
.Ltmp90:
	#DEBUG_VALUE: main:max <- %R15
	#DEBUG_VALUE: main:_5 <- %R15
	#DEBUG_VALUE: main:max_dealloc <- 1
	.loc	1 359 9                 # CoinGame_array.c:359:9
	testq	%r15, %r15
	je	.LBB1_2
.Ltmp91:
# BB#1:                                 # %if.then117
	#DEBUG_VALUE: main:_5 <- %R15
	#DEBUG_VALUE: main:max <- %R15
	.loc	1 361 6                 # CoinGame_array.c:361:6
	movq	(%r15), %rbx
	#DEBUG_VALUE: main:_9 <- 0
.Ltmp92:
	#DEBUG_VALUE: main:n <- %RBX
	.loc	1 365 7                 # CoinGame_array.c:365:7
	movl	%ebx, %esi
	imull	%esi, %esi
	.loc	1 368 2                 # CoinGame_array.c:368:2
	xorl	%edi, %edi
	callq	create1DArray
.Ltmp93:
	#DEBUG_VALUE: main:moves <- %RAX
	#DEBUG_VALUE: main:_11 <- %RAX
	#DEBUG_VALUE: main:_11_dealloc <- 0
	#DEBUG_VALUE: main:moves_dealloc <- 1
	.loc	1 377 8                 # CoinGame_array.c:377:8
	xorl	%edx, %edx
	movq	%rax, %rdi
	movq	%rbx, %rcx
	callq	findMoves
.Ltmp94:
	movq	%rax, %r14
.Ltmp95:
	#DEBUG_VALUE: main:_12 <- %R14
	#DEBUG_VALUE: main:moves <- %R14
	#DEBUG_VALUE: main:_13 <- 1
	#DEBUG_VALUE: main:_12_dealloc <- 0
	.loc	1 389 6                 # CoinGame_array.c:389:6
	movq	-8(%r14,%rbx,8), %r12
.Ltmp96:
	#DEBUG_VALUE: main:_18_size <- 50
	#DEBUG_VALUE: main:_15 <- %R12
	#DEBUG_VALUE: main:sum_alice <- %R12
	.loc	1 396 2                 # CoinGame_array.c:396:2
	xorl	%edi, %edi
	movl	$50, %esi
	callq	create1DArray
	movq	%rax, %r13
.Ltmp97:
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
.Ltmp98:
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
.Ltmp99:
	#DEBUG_VALUE: main:_23_size <- 23
	.loc	1 409 2                 # CoinGame_array.c:409:2
	xorl	%edi, %edi
	movl	$23, %esi
	callq	create1DArray
	movq	%rax, %rbx
.Ltmp100:
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
.Ltmp101:
	#DEBUG_VALUE: main:_23_dealloc <- 1
	.loc	1 413 2 is_stmt 1       # CoinGame_array.c:413:2
	movl	$23, %esi
	movq	%rbx, %rdi
	callq	println_s
.Ltmp102:
	.loc	1 417 2 discriminator 1 # CoinGame_array.c:417:2
	movq	%r15, %rdi
	callq	free
.Ltmp103:
	#DEBUG_VALUE: main:max_dealloc <- 0
	.loc	1 418 2 discriminator 1 # CoinGame_array.c:418:2
	movq	%r14, %rdi
	callq	free
.Ltmp104:
	#DEBUG_VALUE: main:moves_dealloc <- 0
	.loc	1 424 2 discriminator 1 # CoinGame_array.c:424:2
	movq	%r13, %rdi
	callq	free
.Ltmp105:
	#DEBUG_VALUE: main:_18_dealloc <- 0
	.loc	1 425 2 discriminator 1 # CoinGame_array.c:425:2
	movq	%rbx, %rdi
	callq	free
.Ltmp106:
	#DEBUG_VALUE: main:_23_dealloc <- 0
.LBB1_2:                                # %if.end139
	#DEBUG_VALUE: main:_5 <- %R15
	#DEBUG_VALUE: main:max <- %R15
	.loc	1 426 2                 # CoinGame_array.c:426:2
	xorl	%edi, %edi
	callq	exit
.Ltmp107:
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
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
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	16                      # 16
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
	.quad	.Ltmp20-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp23-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
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
	.quad	.Ltmp70-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
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
	.quad	.Ltmp68-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
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
	.byte	86                      # DW_OP_reg6
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
	.byte	84                      # DW_OP_reg4
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
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp56-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc22:
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
.Ldebug_loc23:
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
.Ldebug_loc24:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
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
	.quad	.Ltmp49-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc28:
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
.Ldebug_loc29:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc33:
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
.Ldebug_loc34:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
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
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc36:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc37:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc38:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp21-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp74-.Lfunc_begin0
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
.Ldebug_loc40:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp18-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp18-.Lfunc_begin0
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
.Ldebug_loc41:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp33-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	.Ltmp37-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc42:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp33-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	.Ltmp37-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc43:
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp33-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	.Ltmp37-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc44:
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp33-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	.Ltmp37-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc45:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp24-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc46:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp24-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc47:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc48:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc49:
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp90-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp90-.Lfunc_begin0
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
.Ldebug_loc50:
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp92-.Lfunc_begin0
	.quad	.Ltmp100-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc51:
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp93-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp93-.Lfunc_begin0
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
.Ldebug_loc52:
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp96-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp96-.Lfunc_begin0
	.quad	.Ltmp106-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc53:
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp95-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp95-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc54:
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp96-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp96-.Lfunc_begin0
	.quad	.Ltmp106-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc55:
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp96-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp96-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	50                      # 50
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc56:
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp98-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp98-.Lfunc_begin0
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
.Ldebug_loc57:
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp99-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp99-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	23                      # 23
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc58:
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp101-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp101-.Lfunc_begin0
	.quad	.Ltmp106-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp106-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc59:
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc60:
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc61:
	.quad	.Ltmp90-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc62:
	.quad	.Ltmp90-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc63:
	.quad	.Ltmp93-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp95-.Lfunc_begin0
	.quad	.Ltmp106-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc64:
	.quad	.Ltmp93-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc65:
	.quad	.Ltmp95-.Lfunc_begin0
	.quad	.Ltmp106-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc66:
	.quad	.Ltmp97-.Lfunc_begin0
	.quad	.Ltmp106-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc67:
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Ltmp106-.Lfunc_begin0
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
