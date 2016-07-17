	.text
	.file	"llvm/newTicTacToe.original.copyreduced_dealloc.openmp.ll"
	.globl	copy_Board
	.p2align	4, 0x90
	.type	copy_Board,@function
copy_Board:                             # @copy_Board
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp0:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp1:
	.cfi_def_cfa_offset 24
	pushq	%rax
.Ltmp2:
	.cfi_def_cfa_offset 32
.Ltmp3:
	.cfi_offset %rbx, -24
.Ltmp4:
	.cfi_offset %r14, -16
	movq	%rdi, %r14
	movl	$24, %edi
	callq	malloc
	movq	%rax, %rbx
	movq	8(%r14), %rsi
	movq	%rsi, 8(%rbx)
	movq	(%r14), %rdi
	callq	copy
	movq	%rax, (%rbx)
	movq	16(%r14), %rax
	movq	%rax, 16(%rbx)
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end0:
	.size	copy_Board, .Lfunc_end0-copy_Board
	.cfi_endproc

	.globl	copy_array_Board
	.p2align	4, 0x90
	.type	copy_array_Board,@function
copy_array_Board:                       # @copy_array_Board
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp5:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp6:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp7:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp8:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp9:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp10:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Ltmp11:
	.cfi_def_cfa_offset 64
.Ltmp12:
	.cfi_offset %rbx, -56
.Ltmp13:
	.cfi_offset %r12, -48
.Ltmp14:
	.cfi_offset %r13, -40
.Ltmp15:
	.cfi_offset %r14, -32
.Ltmp16:
	.cfi_offset %r15, -24
.Ltmp17:
	.cfi_offset %rbp, -16
	movq	%rsi, %r14
	movq	%rdi, %r12
	leaq	(,%r14,8), %rdi
	callq	malloc
	movq	%rax, %r15
	testq	%r14, %r14
	jle	.LBB1_3
# BB#1:
	movq	%r15, %r13
	.p2align	4, 0x90
.LBB1_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rbp
	movl	$24, %edi
	callq	malloc
	movq	%rax, %rbx
	movq	8(%rbp), %rsi
	movq	%rsi, 8(%rbx)
	movq	(%rbp), %rdi
	callq	copy
	movq	%rax, (%rbx)
	movq	16(%rbp), %rax
	movq	%rax, 16(%rbx)
	movq	%rbx, (%r13)
	addq	$8, %r13
	addq	$8, %r12
	decq	%r14
	jne	.LBB1_2
.LBB1_3:                                # %for.cond.cleanup
	movq	%r15, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end1:
	.size	copy_array_Board, .Lfunc_end1-copy_array_Board
	.cfi_endproc

	.globl	free_Board
	.p2align	4, 0x90
	.type	free_Board,@function
free_Board:                             # @free_Board
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp18:
	.cfi_def_cfa_offset 16
.Ltmp19:
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	(%rbx), %rdi
	callq	free
	movq	%rbx, %rdi
	popq	%rbx
	jmp	free                    # TAILCALL
.Lfunc_end2:
	.size	free_Board, .Lfunc_end2-free_Board
	.cfi_endproc

	.globl	printf_Board
	.p2align	4, 0x90
	.type	printf_Board,@function
printf_Board:                           # @printf_Board
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp20:
	.cfi_def_cfa_offset 16
.Ltmp21:
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movl	$123, %edi
	callq	putchar
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movq	(%rbx), %rdi
	movq	8(%rbx), %rsi
	callq	printf1DArray
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movq	16(%rbx), %rsi
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$125, %edi
	popq	%rbx
	jmp	putchar                 # TAILCALL
.Lfunc_end3:
	.size	printf_Board, .Lfunc_end3-printf_Board
	.cfi_endproc

	.globl	EmptyBoard
	.p2align	4, 0x90
	.type	EmptyBoard,@function
EmptyBoard:                             # @EmptyBoard
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp22:
	.cfi_def_cfa_offset 16
.Ltmp23:
	.cfi_offset %rbx, -16
	xorl	%edi, %edi
	movl	$9, %esi
	callq	create1DArray
	movq	%rax, %rbx
	xorps	%xmm0, %xmm0
	movups	%xmm0, 48(%rbx)
	movups	%xmm0, 32(%rbx)
	movups	%xmm0, 16(%rbx)
	movups	%xmm0, (%rbx)
	movq	$0, 64(%rbx)
	movl	$24, %edi
	callq	malloc
	movl	$9, %ecx
	movd	%rcx, %xmm0
	movups	%xmm0, 8(%rax)
	movq	%rbx, (%rax)
	popq	%rbx
	retq
.Lfunc_end4:
	.size	EmptyBoard, .Lfunc_end4-EmptyBoard
	.cfi_endproc

	.globl	countOf
	.p2align	4, 0x90
	.type	countOf,@function
countOf:                                # @countOf
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp24:
	.cfi_def_cfa_offset 16
.Ltmp25:
	.cfi_offset %rbx, -16
	xorl	%ebx, %ebx
	testq	%rsi, %rsi
	jle	.LBB5_7
# BB#1:                                 # %if.end.preheader
	leaq	-1(%rsi), %rbx
	movl	%esi, %r8d
	andl	$3, %r8d
	xorl	%r9d, %r9d
	cmpq	$3, %rbx
	movl	$0, %ebx
	jb	.LBB5_4
# BB#2:                                 # %if.end.preheader.new
	subq	%r8, %rsi
	xorl	%r9d, %r9d
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB5_3:                                # %if.end
                                        # =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
	cmpq	%rcx, (%rdi,%r9,8)
	sete	%al
	addq	%rbx, %rax
	xorl	%ebx, %ebx
	cmpq	%rcx, 8(%rdi,%r9,8)
	sete	%bl
	addq	%rax, %rbx
	xorl	%eax, %eax
	cmpq	%rcx, 16(%rdi,%r9,8)
	sete	%al
	addq	%rbx, %rax
	xorl	%ebx, %ebx
	cmpq	%rcx, 24(%rdi,%r9,8)
	sete	%bl
	addq	%rax, %rbx
	addq	$4, %r9
	cmpq	%r9, %rsi
	jne	.LBB5_3
.LBB5_4:                                # %blklab11.loopexit.unr-lcssa
	testq	%r8, %r8
	je	.LBB5_7
# BB#5:                                 # %if.end.epil.preheader
	leaq	(%rdi,%r9,8), %rax
	negq	%r8
	.p2align	4, 0x90
.LBB5_6:                                # %if.end.epil
                                        # =>This Inner Loop Header: Depth=1
	xorl	%esi, %esi
	cmpq	%rcx, (%rax)
	sete	%sil
	addq	%rsi, %rbx
	addq	$8, %rax
	incq	%r8
	jne	.LBB5_6
.LBB5_7:                                # %blklab11
	testb	%dl, %dl
	je	.LBB5_9
# BB#8:                                 # %if.then5
	callq	free
.LBB5_9:                                # %if.end6
	movq	%rbx, %rax
	popq	%rbx
	retq
.Lfunc_end5:
	.size	countOf, .Lfunc_end5-countOf
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI6_0:
	.quad	2                       # 0x2
	.quad	3                       # 0x3
.LCPI6_1:
	.quad	4                       # 0x4
	.quad	5                       # 0x5
.LCPI6_2:
	.quad	6                       # 0x6
	.quad	7                       # 0x7
.LCPI6_3:
	.quad	80                      # 0x50
	.quad	97                      # 0x61
.LCPI6_4:
	.quad	115                     # 0x73
	.quad	115                     # 0x73
.LCPI6_5:
	.quad	32                      # 0x20
	.quad	110                     # 0x6e
.LCPI6_6:
	.quad	101                     # 0x65
	.quad	119                     # 0x77
.LCPI6_7:
	.quad	84                      # 0x54
	.quad	105                     # 0x69
.LCPI6_8:
	.quad	99                      # 0x63
	.quad	84                      # 0x54
.LCPI6_9:
	.quad	97                      # 0x61
	.quad	99                      # 0x63
.LCPI6_10:
	.quad	84                      # 0x54
	.quad	111                     # 0x6f
.LCPI6_11:
	.quad	101                     # 0x65
	.quad	32                      # 0x20
.LCPI6_12:
	.quad	116                     # 0x74
	.quad	101                     # 0x65
.LCPI6_13:
	.quad	115                     # 0x73
	.quad	116                     # 0x74
.LCPI6_14:
	.quad	32                      # 0x20
	.quad	99                      # 0x63
.LCPI6_15:
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
.Ltmp26:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp27:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp28:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp29:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp30:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp31:
	.cfi_def_cfa_offset 56
	subq	$152, %rsp
.Ltmp32:
	.cfi_def_cfa_offset 208
.Ltmp33:
	.cfi_offset %rbx, -56
.Ltmp34:
	.cfi_offset %r12, -48
.Ltmp35:
	.cfi_offset %r13, -40
.Ltmp36:
	.cfi_offset %r14, -32
.Ltmp37:
	.cfi_offset %r15, -24
.Ltmp38:
	.cfi_offset %rbp, -16
	movl	%edi, %ebx
	callq	convertArgsToIntArray
	movq	%rax, %rbp
	decl	%ebx
	movslq	%ebx, %rbx
	movq	(%rbp), %rdi
	callq	parseStringToInt
	testq	%rax, %rax
	je	.LBB6_1
# BB#2:                                 # %if.end8
	movq	%rbx, 88(%rsp)          # 8-byte Spill
	movq	%rbp, 96(%rsp)          # 8-byte Spill
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	(%rax), %rax
	movq	%rax, 104(%rsp)         # 8-byte Spill
	testq	%rax, %rax
	jle	.LBB6_3
# BB#4:                                 # %if.end15.preheader
	xorl	%r15d, %r15d
	movl	$9, %eax
	movd	%rax, %xmm0
	movaps	%xmm0, 112(%rsp)        # 16-byte Spill
	movl	$1, %eax
	movd	%rax, %xmm0
	pslldq	$8, %xmm0               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7]
	movdqa	%xmm0, 128(%rsp)        # 16-byte Spill
                                        # implicit-def: %AL
	movb	%al, 15(%rsp)           # 1-byte Spill
                                        # implicit-def: %AL
	movq	%rax, 56(%rsp)          # 8-byte Spill
                                        # implicit-def: %RAX
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movl	$0, %eax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movl	$0, %ebx
	movl	$0, %eax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	xorl	%ecx, %ecx
                                        # implicit-def: %R14
	xorl	%eax, %eax
	movq	%rax, 16(%rsp)          # 8-byte Spill
                                        # implicit-def: %R13
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB6_5:                                # %if.end15
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_10 Depth 2
	movq	%rcx, 64(%rsp)          # 8-byte Spill
	xorl	%edi, %edi
	movl	$9, %esi
	callq	create1DArray
	movq	%rax, %rbp
	pxor	%xmm0, %xmm0
	movdqu	%xmm0, 48(%rbp)
	movdqu	%xmm0, 32(%rbp)
	movdqu	%xmm0, 16(%rbp)
	movdqu	%xmm0, (%rbp)
	movq	$0, 64(%rbp)
	movl	$24, %edi
	callq	malloc
	movaps	112(%rsp), %xmm0        # 16-byte Reload
	movups	%xmm0, 8(%rax)
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	%rbp, (%rax)
	testb	$1, %r12b
	je	.LBB6_7
# BB#6:                                 # %if.then18
                                        #   in Loop: Header=BB6_5 Depth=1
	movq	(%r14), %rdi
	callq	free
	movq	%r14, %rdi
	callq	free
.LBB6_7:                                # %if.end24
                                        #   in Loop: Header=BB6_5 Depth=1
	xorl	%edi, %edi
	movl	$9, %esi
	callq	create1DArray
	movq	%rax, %r14
	xorps	%xmm0, %xmm0
	movups	%xmm0, 48(%r14)
	movups	%xmm0, 32(%r14)
	movups	%xmm0, 16(%r14)
	movups	%xmm0, (%r14)
	movq	$0, 64(%r14)
	movl	$24, %edi
	callq	malloc
	movq	%rax, %rbp
	movl	$9, %eax
	movd	%rax, %xmm0
	movdqu	%xmm0, 8(%rbp)
	movq	%r14, (%rbp)
	movq	16(%rsp), %rax          # 8-byte Reload
	testb	$1, %al
	je	.LBB6_9
# BB#8:                                 # %if.then27
                                        #   in Loop: Header=BB6_5 Depth=1
	movq	(%r13), %rdi
	callq	free
	movq	%r13, %rdi
	callq	free
.LBB6_9:                                # %while.cond31.preheader
                                        #   in Loop: Header=BB6_5 Depth=1
	movb	$1, %r12b
	movq	%rbp, %r13
	movb	$1, %al
	movq	%rax, 16(%rsp)          # 8-byte Spill
	xorl	%ebp, %ebp
	movq	24(%rsp), %r14          # 8-byte Reload
	jmp	.LBB6_10
	.p2align	4, 0x90
.LBB6_45:                               # %blklab20
                                        #   in Loop: Header=BB6_10 Depth=2
	movq	%r13, %r14
	incq	%rbp
	movb	$1, %bl
	movq	%r15, %r13
	movb	$1, %r15b
.LBB6_10:                               # %while.cond31
                                        #   Parent Loop BB6_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	testb	$1, %bl
	je	.LBB6_12
# BB#11:                                # %if.then34
                                        #   in Loop: Header=BB6_10 Depth=2
	movq	40(%rsp), %rdi          # 8-byte Reload
	callq	free
.LBB6_12:                               # %if.end35
                                        #   in Loop: Header=BB6_10 Depth=2
	xorl	%edi, %edi
	movl	$9, %esi
	callq	create1DArray
	movq	%rax, %rbx
	movaps	128(%rsp), %xmm0        # 16-byte Reload
	movups	%xmm0, (%rbx)
	movaps	.LCPI6_0(%rip), %xmm0   # xmm0 = [2,3]
	movups	%xmm0, 16(%rbx)
	movaps	.LCPI6_1(%rip), %xmm0   # xmm0 = [4,5]
	movups	%xmm0, 32(%rbx)
	movdqa	.LCPI6_2(%rip), %xmm0   # xmm0 = [6,7]
	movdqu	%xmm0, 48(%rbx)
	movq	$8, 64(%rbx)
	cmpq	$8, %rbp
	movq	%rbx, 40(%rsp)          # 8-byte Spill
	jg	.LBB6_13
# BB#25:                                # %if.end50
                                        #   in Loop: Header=BB6_10 Depth=2
	testb	$1, %r15b
	je	.LBB6_27
# BB#26:                                # %if.then52
                                        #   in Loop: Header=BB6_10 Depth=2
	movq	32(%rsp), %rdi          # 8-byte Reload
	callq	free
.LBB6_27:                               # %if.end53
                                        #   in Loop: Header=BB6_10 Depth=2
	xorl	%edi, %edi
	movl	$9, %esi
	callq	create1DArray
	movl	$1, %ecx
	movd	%rcx, %xmm0
	pslldq	$8, %xmm0               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7]
	movdqu	%xmm0, (%rax)
	movaps	.LCPI6_0(%rip), %xmm0   # xmm0 = [2,3]
	movups	%xmm0, 16(%rax)
	movaps	.LCPI6_1(%rip), %xmm0   # xmm0 = [4,5]
	movups	%xmm0, 32(%rax)
	movdqa	.LCPI6_2(%rip), %xmm0   # xmm0 = [6,7]
	movdqu	%xmm0, 48(%rax)
	movq	$8, 64(%rax)
	movq	%rax, %rcx
	movq	%rcx, 32(%rsp)          # 8-byte Spill
	movq	(%rax,%rbp,8), %rdi
	movb	$1, %r15b
	cmpq	$9, %rdi
	ja	.LBB6_13
# BB#28:                                # %polly.preload.cond
                                        #   in Loop: Header=BB6_10 Depth=2
	testq	%r13, %r13
	movq	%rbp, 24(%rsp)          # 8-byte Spill
	je	.LBB6_29
# BB#30:                                # %polly.preload.cond
                                        #   in Loop: Header=BB6_10 Depth=2
	testq	%r14, %r14
	movl	$0, %r9d
	jne	.LBB6_31
# BB#46:                                # %polly.preload.exec
                                        #   in Loop: Header=BB6_10 Depth=2
	movq	(%r13), %r9
	jmp	.LBB6_31
	.p2align	4, 0x90
.LBB6_29:                               #   in Loop: Header=BB6_10 Depth=2
	xorl	%r9d, %r9d
.LBB6_31:                               # %polly.preload.cond292
                                        #   in Loop: Header=BB6_10 Depth=2
	testq	%r14, %r14
	movl	$0, %ebp
	je	.LBB6_32
# BB#47:                                # %polly.preload.exec294
                                        #   in Loop: Header=BB6_10 Depth=2
	movq	(%r14), %rbp
.LBB6_32:                               # %polly.preload.merge293
                                        #   in Loop: Header=BB6_10 Depth=2
	testq	%r13, %r13
	setg	%cl
	sets	%dl
	testq	%r14, %r14
	setne	%r8b
	movq	%r12, 72(%rsp)          # 8-byte Spill
                                        # kill: %R12B<def> %R12B<kill> %R12<kill>
	andb	$1, %r12b
	movq	%rdi, %rax
	incq	%rax
	seto	%r10b
	leaq	(%r9,%rax,8), %rbx
	leaq	16(%r13), %rsi
	cmpq	%rsi, %rbx
	setbe	%r15b
	leaq	24(%r13), %rsi
	leaq	(%r9,%rdi,8), %r11
	cmpq	%r11, %rsi
	setbe	%bl
	orb	%r15b, %bl
	leaq	(%rbp,%rax,8), %rax
	leaq	16(%r14), %rsi
	cmpq	%rsi, %rax
	setbe	%al
	leaq	24(%r14), %rsi
	leaq	(%rbp,%rdi,8), %rbp
	cmpq	%rbp, %rsi
	setbe	%r9b
	cmpb	$1, %bl
	jne	.LBB6_36
# BB#33:                                # %polly.preload.merge293
                                        #   in Loop: Header=BB6_10 Depth=2
	andb	%r12b, %dl
	orb	%r8b, %dl
	andb	%r12b, %cl
	orb	%dl, %cl
	xorb	$1, %cl
	je	.LBB6_36
# BB#34:                                # %polly.preload.merge293
                                        #   in Loop: Header=BB6_10 Depth=2
	orb	%r9b, %al
	je	.LBB6_36
# BB#35:                                # %polly.preload.merge293
                                        #   in Loop: Header=BB6_10 Depth=2
	xorb	$1, %r10b
	je	.LBB6_36
# BB#48:                                # %polly.cond
                                        #   in Loop: Header=BB6_10 Depth=2
	testq	%r14, %r14
	je	.LBB6_49
# BB#51:                                # %polly.stmt.if.end77
                                        #   in Loop: Header=BB6_10 Depth=2
	movq	$1, (%rbp)
	incq	16(%r14)
	movzbl	15(%rsp), %eax          # 1-byte Folded Reload
	movb	%al, %r12b
	xorl	%r15d, %r15d
	movq	56(%rsp), %rax          # 8-byte Reload
                                        # kill: %AL<def> %AL<kill> %RAX<kill> %RAX<def>
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	48(%rsp), %r13          # 8-byte Reload
	movq	24(%rsp), %rbp          # 8-byte Reload
	jmp	.LBB6_45
	.p2align	4, 0x90
.LBB6_36:                               # %blklab19
                                        #   in Loop: Header=BB6_10 Depth=2
	testq	%r14, %r14
	je	.LBB6_42
# BB#37:                                # %if.end77
                                        #   in Loop: Header=BB6_10 Depth=2
	movq	(%r14), %rax
	movq	$1, (%rax,%rdi,8)
	incq	16(%r14)
	movq	16(%rsp), %rax          # 8-byte Reload
	testb	$1, %al
	movq	24(%rsp), %rbp          # 8-byte Reload
	je	.LBB6_39
# BB#38:                                # %if.then81
                                        #   in Loop: Header=BB6_10 Depth=2
	movq	(%r13), %rdi
	callq	free
	movq	%r13, %rdi
	callq	free
.LBB6_39:                               # %if.end82
                                        #   in Loop: Header=BB6_10 Depth=2
	movl	$24, %edi
	callq	malloc
	movq	%rax, %r15
	movq	8(%r14), %rsi
	movq	%rsi, 8(%r15)
	movq	(%r14), %rdi
	callq	copy
	movq	%rax, (%r15)
	movq	16(%r14), %rax
	movq	%rax, 16(%r15)
	movb	$1, %al
	movq	%rax, 16(%rsp)          # 8-byte Spill
	xorl	%r13d, %r13d
	testb	%r12b, %r12b
	jne	.LBB6_41
# BB#40:                                #   in Loop: Header=BB6_10 Depth=2
	xorl	%r12d, %r12d
	jmp	.LBB6_45
.LBB6_42:                               # %blklab22
                                        #   in Loop: Header=BB6_10 Depth=2
	testq	%r13, %r13
	movq	24(%rsp), %rbp          # 8-byte Reload
	je	.LBB6_43
# BB#44:                                # %if.end90
                                        #   in Loop: Header=BB6_10 Depth=2
	movq	(%r13), %rax
	movq	$2, (%rax,%rdi,8)
	incq	16(%r13)
	movq	16(%rsp), %rax          # 8-byte Reload
	andb	$1, %al
	xorl	%r15d, %r15d
	movb	%al, %r12b
	xorl	%eax, %eax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	jmp	.LBB6_45
.LBB6_49:                               # %polly.cond317
                                        #   in Loop: Header=BB6_10 Depth=2
	testq	%r13, %r13
	je	.LBB6_50
# BB#52:                                # %polly.stmt.if.end90
                                        #   in Loop: Header=BB6_10 Depth=2
	movq	$2, (%r11)
	incq	16(%r13)
	movq	16(%rsp), %rax          # 8-byte Reload
	andb	$1, %al
	xorl	%ecx, %ecx
	movq	%rcx, 56(%rsp)          # 8-byte Spill
	movl	%eax, %ecx
	movb	%cl, 15(%rsp)           # 1-byte Spill
	movq	%r13, 48(%rsp)          # 8-byte Spill
	movb	%al, %r12b
	xorl	%r15d, %r15d
	xorl	%eax, %eax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	24(%rsp), %rbp          # 8-byte Reload
	jmp	.LBB6_45
.LBB6_41:                               # %if.then85
                                        #   in Loop: Header=BB6_10 Depth=2
	movq	(%r14), %rdi
	callq	free
	movq	%r14, %rdi
	callq	free
	xorl	%r12d, %r12d
	xorl	%r13d, %r13d
	jmp	.LBB6_45
.LBB6_43:                               #   in Loop: Header=BB6_10 Depth=2
	xorl	%r15d, %r15d
	xorl	%r13d, %r13d
	movq	72(%rsp), %r12          # 8-byte Reload
	jmp	.LBB6_45
.LBB6_50:                               #   in Loop: Header=BB6_10 Depth=2
	movq	72(%rsp), %r12          # 8-byte Reload
	movl	%r12d, %eax
	movb	%al, 15(%rsp)           # 1-byte Spill
	movq	16(%rsp), %rax          # 8-byte Reload
                                        # kill: %AL<def> %AL<kill> %RAX<kill> %RAX<def>
	movq	%rax, 56(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	xorl	%r15d, %r15d
	xorl	%r13d, %r13d
	movq	24(%rsp), %rbp          # 8-byte Reload
	jmp	.LBB6_45
	.p2align	4, 0x90
.LBB6_13:                               #   in Loop: Header=BB6_5 Depth=1
	movq	64(%rsp), %rcx          # 8-byte Reload
	incq	%rcx
	movb	$1, %bl
	cmpq	104(%rsp), %rcx         # 8-byte Folded Reload
	jne	.LBB6_5
# BB#14:                                # %if.then139.loopexit
	movb	$1, %bpl
.LBB6_15:                               # %if.then139
	xorl	%edi, %edi
	movl	$27, %esi
	callq	create1DArray
	movq	%rax, %rbx
	movaps	.LCPI6_3(%rip), %xmm0   # xmm0 = [80,97]
	movups	%xmm0, (%rbx)
	movaps	.LCPI6_4(%rip), %xmm0   # xmm0 = [115,115]
	movups	%xmm0, 16(%rbx)
	movaps	.LCPI6_5(%rip), %xmm0   # xmm0 = [32,110]
	movups	%xmm0, 32(%rbx)
	movaps	.LCPI6_6(%rip), %xmm0   # xmm0 = [101,119]
	movups	%xmm0, 48(%rbx)
	movaps	.LCPI6_7(%rip), %xmm0   # xmm0 = [84,105]
	movups	%xmm0, 64(%rbx)
	movaps	.LCPI6_8(%rip), %xmm0   # xmm0 = [99,84]
	movups	%xmm0, 80(%rbx)
	movaps	.LCPI6_9(%rip), %xmm0   # xmm0 = [97,99]
	movups	%xmm0, 96(%rbx)
	movaps	.LCPI6_10(%rip), %xmm0  # xmm0 = [84,111]
	movups	%xmm0, 112(%rbx)
	movaps	.LCPI6_11(%rip), %xmm0  # xmm0 = [101,32]
	movups	%xmm0, 128(%rbx)
	movaps	.LCPI6_12(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 144(%rbx)
	movaps	.LCPI6_13(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 160(%rbx)
	movaps	.LCPI6_14(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 176(%rbx)
	movaps	.LCPI6_15(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 192(%rbx)
	movq	$101, 208(%rbx)
	movl	$27, %esi
	movq	%rbx, %rdi
	callq	println_s
	movq	80(%rsp), %rdi          # 8-byte Reload
	callq	free
	testb	$1, %r12b
	je	.LBB6_17
# BB#16:                                # %if.then142
	movq	(%r14), %rdi
	callq	free
	movq	%r14, %rdi
	callq	free
.LBB6_17:                               # %if.end143
	movq	16(%rsp), %rax          # 8-byte Reload
	testb	$1, %al
	je	.LBB6_19
# BB#18:                                # %if.then145
	movq	(%r13), %rdi
	callq	free
	movq	%r13, %rdi
	callq	free
.LBB6_19:                               # %if.then151
	movq	96(%rsp), %rdi          # 8-byte Reload
	movq	88(%rsp), %rsi          # 8-byte Reload
	callq	free2DArray
	testb	%bpl, %bpl
	je	.LBB6_21
# BB#20:                                # %if.then163
	movq	40(%rsp), %rdi          # 8-byte Reload
	callq	free
.LBB6_21:                               # %if.end164
	testb	$1, %r15b
	je	.LBB6_23
# BB#22:                                # %if.then166
	movq	32(%rsp), %rdi          # 8-byte Reload
	callq	free
.LBB6_23:                               # %if.then169
	movq	%rbx, %rdi
	callq	free
	xorl	%edi, %edi
	callq	exit
.LBB6_1:                                # %if.end167.thread
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	callq	free2DArray
	xorl	%edi, %edi
	callq	exit
.LBB6_3:
	xorl	%eax, %eax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	xorl	%r15d, %r15d
	xorl	%eax, %eax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	xorl	%ebp, %ebp
                                        # implicit-def: %R14
	xorl	%eax, %eax
	movq	%rax, 16(%rsp)          # 8-byte Spill
                                        # implicit-def: %R13
	xorl	%r12d, %r12d
	jmp	.LBB6_15
.Lfunc_end6:
	.size	main, .Lfunc_end6-main
	.cfi_endproc

	.type	.L.str.1,@object        # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	" pieces:"
	.size	.L.str.1, 9

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	" move:"
	.size	.L.str.2, 7

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"%lld"
	.size	.L.str.3, 5


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git aec29e5973c27bcbc3c1cf54295e3778050a73cd) (http://llvm.org/git/llvm.git 4c6356e8c64e246972f760a1f05bc0f365b090ad)"
	.section	".note.GNU-stack","",@progbits
