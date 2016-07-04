	.text
	.file	"llvm/CoinGame_array.copyreduced_dealloc.polly.ll"
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
	callq	create1DArray
	movq	%rax, %r13
	xorl	%edi, %edi
	movl	%ebp, %esi
	callq	create1DArray
	movq	%rax, %r12
	xorl	%edi, %edi
	movl	%ebp, %esi
	callq	create1DArray
	movq	%rbp, %rdx
	movq	%rax, %rbx
	testq	%rdx, %rdx
	jle	.LBB0_24
# BB#1:                                 # %polly.split_new_and_old
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
	movq	%rbx, (%rsp)            # 8-byte Spill
	movq	(%rsp), %rbx            # 8-byte Reload
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
# BB#2:                                 # %polly.split_new_and_old
	orb	%r9b, %sil
	je	.LBB0_9
# BB#3:                                 # %polly.split_new_and_old
	orb	%r14b, %dl
	je	.LBB0_9
# BB#4:                                 # %polly.split_new_and_old
	orb	%r11b, %r15b
	je	.LBB0_9
# BB#5:                                 # %polly.split_new_and_old
	orb	32(%rsp), %bpl          # 1-byte Folded Reload
	je	.LBB0_9
# BB#6:                                 # %polly.split_new_and_old
	movabsq	$9223372036854775807, %rax # imm = 0x7FFFFFFFFFFFFFFF
	cmpq	%rax, %r8
	je	.LBB0_9
# BB#7:                                 # %polly.split_new_and_old
	movb	40(%rsp), %al           # 1-byte Reload
	orb	%al, 48(%rsp)           # 1-byte Folded Spill
	je	.LBB0_9
# BB#8:                                 # %polly.split_new_and_old
	orb	8(%rsp), %r10b          # 1-byte Folded Reload
	orb	56(%rsp), %r10b         # 1-byte Folded Reload
	xorb	$1, %r10b
	je	.LBB0_9
# BB#25:                                # %polly.loop_preheader
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
	leaq	(%rbp,%rcx), %rsi
	addq	(%rbx,%rcx,8), %rsi
	cmpq	%rsi, %rdx
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
	leaq	(,%r8,8), %r9
	leaq	8(,%r8,8), %r11
	movq	%r8, %r10
	shlq	$4, %r10
	xorl	%r14d, %r14d
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	%r8, %r15
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
	leaq	(%r14,%rax), %rcx
	movq	$0, (%r12,%rax,8)
	leaq	1(%rax), %rdx
	testq	%rcx, %rcx
	jle	.LBB0_14
# BB#12:                                # %if.end37
                                        #   in Loop: Header=BB0_11 Depth=2
	cmpq	%r8, %rdx
	jge	.LBB0_14
# BB#13:                                # %if.end45
                                        #   in Loop: Header=BB0_11 Depth=2
	movq	-8(%r9,%rdi), %rsi
	movq	%rsi, (%r12,%rax,8)
.LBB0_14:                               # %blklab4
                                        #   in Loop: Header=BB0_11 Depth=2
	movq	$0, (%r13,%rax,8)
	leaq	2(%rax), %rsi
	cmpq	%r8, %rsi
	jge	.LBB0_16
# BB#15:                                # %if.end56
                                        #   in Loop: Header=BB0_11 Depth=2
	movq	(%r10,%rdi), %rsi
	movq	%rsi, (%r13,%rax,8)
.LBB0_16:                               # %blklab5
                                        #   in Loop: Header=BB0_11 Depth=2
	movq	$0, (%rbx,%rax,8)
	cmpq	$2, %rcx
	movl	$0, %esi
	jl	.LBB0_18
# BB#17:                                # %if.end67
                                        #   in Loop: Header=BB0_11 Depth=2
	movq	-16(%rdi), %rsi
	movq	%rsi, (%rbx,%rax,8)
.LBB0_18:                               # %blklab6
                                        #   in Loop: Header=BB0_11 Depth=2
	movq	(%r13,%rax,8), %r8
	movq	(%r12,%rax,8), %rbp
	cmpq	%rbp, %r8
	jle	.LBB0_20
# BB#19:                                # %if.end78
                                        #   in Loop: Header=BB0_11 Depth=2
	movq	%rbp, (%r13,%rax,8)
	movq	(%rsp), %rsi            # 8-byte Reload
	movq	(%rsi,%rax,8), %rsi
	movq	%rbp, %r8
	movq	(%r12,%rax,8), %rbp
.LBB0_20:                               # %blklab7
                                        #   in Loop: Header=BB0_11 Depth=2
	cmpq	%rbp, %rsi
	jle	.LBB0_22
# BB#21:                                # %if.end86
                                        #   in Loop: Header=BB0_11 Depth=2
	movq	(%rsp), %rbx            # 8-byte Reload
	movq	%rbp, (%rbx,%rax,8)
	movq	(%r13,%rax,8), %r8
.LBB0_22:                               # %blklab8
                                        #   in Loop: Header=BB0_11 Depth=2
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
	movq	24(%rsp), %r8           # 8-byte Reload
	movq	(%rsp), %rbx            # 8-byte Reload
	jne	.LBB0_11
# BB#23:                                # %blklab2
                                        #   in Loop: Header=BB0_10 Depth=1
	incq	%r14
	decq	%r15
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$8, %rax
	cmpq	%r8, %r14
	jne	.LBB0_10
.LBB0_24:                               # %if.then114
	movq	%r13, %rdi
	callq	free
	movq	%r12, %rdi
	callq	free
	movq	%rbx, %rdi
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
	pushq	%r15
.Ltmp13:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp14:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp15:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp16:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp17:
	.cfi_def_cfa_offset 48
.Ltmp18:
	.cfi_offset %rbx, -48
.Ltmp19:
	.cfi_offset %r12, -40
.Ltmp20:
	.cfi_offset %r13, -32
.Ltmp21:
	.cfi_offset %r14, -24
.Ltmp22:
	.cfi_offset %r15, -16
	callq	convertArgsToIntArray
	movq	(%rax), %rdi
	callq	parseStringToInt
	movq	%rax, %r15
	testq	%r15, %r15
	je	.LBB1_2
# BB#1:                                 # %if.then117
	movq	(%r15), %rbx
	movl	%ebx, %esi
	imull	%esi, %esi
	xorl	%edi, %edi
	callq	create1DArray
	xorl	%edx, %edx
	movq	%rax, %rdi
	movq	%rbx, %rcx
	callq	findMoves
	movq	%rax, %r14
	movq	-8(%r14,%rbx,8), %r12
	xorl	%edi, %edi
	movl	$50, %esi
	callq	create1DArray
	movq	%rax, %r13
	movaps	.LCPI1_0(%rip), %xmm0   # xmm0 = [84,104]
	movups	%xmm0, (%r13)
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [101,32]
	movups	%xmm0, 16(%r13)
	movaps	%xmm0, %xmm1
	movaps	.LCPI1_2(%rip), %xmm0   # xmm0 = [116,111]
	movups	%xmm0, 32(%r13)
	movaps	.LCPI1_3(%rip), %xmm0   # xmm0 = [116,97]
	movups	%xmm0, 48(%r13)
	movaps	.LCPI1_4(%rip), %xmm0   # xmm0 = [108,32]
	movups	%xmm0, 64(%r13)
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [97,109]
	movups	%xmm0, 80(%r13)
	movaps	.LCPI1_6(%rip), %xmm0   # xmm0 = [111,117]
	movups	%xmm0, 96(%r13)
	movaps	.LCPI1_7(%rip), %xmm0   # xmm0 = [110,116]
	movups	%xmm0, 112(%r13)
	movaps	.LCPI1_8(%rip), %xmm0   # xmm0 = [32,111]
	movups	%xmm0, 128(%r13)
	movaps	.LCPI1_9(%rip), %xmm0   # xmm0 = [102,32]
	movups	%xmm0, 144(%r13)
	movaps	.LCPI1_10(%rip), %xmm0  # xmm0 = [109,111]
	movups	%xmm0, 160(%r13)
	movaps	.LCPI1_11(%rip), %xmm0  # xmm0 = [110,101]
	movups	%xmm0, 176(%r13)
	movaps	.LCPI1_12(%rip), %xmm0  # xmm0 = [121,32]
	movups	%xmm0, 192(%r13)
	movaps	.LCPI1_13(%rip), %xmm0  # xmm0 = [40,109]
	movups	%xmm0, 208(%r13)
	movaps	.LCPI1_14(%rip), %xmm0  # xmm0 = [97,120]
	movups	%xmm0, 224(%r13)
	movaps	.LCPI1_15(%rip), %xmm0  # xmm0 = [105,109]
	movups	%xmm0, 240(%r13)
	movaps	.LCPI1_16(%rip), %xmm0  # xmm0 = [117,109]
	movups	%xmm0, 256(%r13)
	movaps	.LCPI1_17(%rip), %xmm0  # xmm0 = [41,32]
	movups	%xmm0, 272(%r13)
	movaps	.LCPI1_18(%rip), %xmm0  # xmm0 = [65,108]
	movups	%xmm0, 288(%r13)
	movaps	.LCPI1_19(%rip), %xmm0  # xmm0 = [105,99]
	movups	%xmm0, 304(%r13)
	movups	%xmm1, 320(%r13)
	movaps	.LCPI1_20(%rip), %xmm0  # xmm0 = [103,101]
	movups	%xmm0, 336(%r13)
	movaps	.LCPI1_21(%rip), %xmm0  # xmm0 = [116,115]
	movups	%xmm0, 352(%r13)
	movaps	.LCPI1_22(%rip), %xmm0  # xmm0 = [32,105]
	movups	%xmm0, 368(%r13)
	movaps	.LCPI1_23(%rip), %xmm0  # xmm0 = [115,32]
	movups	%xmm0, 384(%r13)
	movl	$50, %esi
	movq	%r13, %rdi
	callq	printf_s
	movl	$.L.str, %edi
	xorl	%eax, %eax
	movq	%r12, %rsi
	callq	printf
	xorl	%edi, %edi
	movl	$23, %esi
	callq	create1DArray
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
	movq	%r15, %rdi
	callq	free
	movq	%r14, %rdi
	callq	free
	movq	%r13, %rdi
	callq	free
	movq	%rbx, %rdi
	callq	free
.LBB1_2:                                # %if.end139
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


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git f82fb5beb88e841f7a00cfb2a2ceabe46bcb2a9b) (http://llvm.org/git/llvm.git bafbf2b643f118fd2ea402ed6cd204281c7e9e94)"
	.section	".note.GNU-stack","",@progbits
