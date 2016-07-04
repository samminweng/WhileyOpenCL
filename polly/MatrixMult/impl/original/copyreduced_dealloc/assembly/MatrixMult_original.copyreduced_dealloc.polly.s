	.text
	.file	"llvm/MatrixMult_original.copyreduced_dealloc.polly.ll"
	.globl	copy_Matrix
	.p2align	4, 0x90
	.type	copy_Matrix,@function
copy_Matrix:                            # @copy_Matrix
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
	movl	$32, %edi
	callq	malloc
	movq	%rax, %rbx
	movq	8(%r14), %rsi
	movq	%rsi, 8(%rbx)
	movq	(%r14), %rdi
	callq	copy
	movq	%rax, (%rbx)
	movups	16(%r14), %xmm0
	movups	%xmm0, 16(%rbx)
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end0:
	.size	copy_Matrix, .Lfunc_end0-copy_Matrix
	.cfi_endproc

	.globl	copy_array_Matrix
	.p2align	4, 0x90
	.type	copy_array_Matrix,@function
copy_array_Matrix:                      # @copy_array_Matrix
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
	movl	$32, %edi
	callq	malloc
	movq	%rax, %rbx
	movq	8(%rbp), %rsi
	movq	%rsi, 8(%rbx)
	movq	(%rbp), %rdi
	callq	copy
	movq	%rax, (%rbx)
	movups	16(%rbp), %xmm0
	movups	%xmm0, 16(%rbx)
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
	.size	copy_array_Matrix, .Lfunc_end1-copy_array_Matrix
	.cfi_endproc

	.globl	free_Matrix
	.p2align	4, 0x90
	.type	free_Matrix,@function
free_Matrix:                            # @free_Matrix
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
	.size	free_Matrix, .Lfunc_end2-free_Matrix
	.cfi_endproc

	.globl	printf_Matrix
	.p2align	4, 0x90
	.type	printf_Matrix,@function
printf_Matrix:                          # @printf_Matrix
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
	movl	$.L.str.4, %edi
	xorl	%eax, %eax
	callq	printf
	movq	24(%rbx), %rsi
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$125, %edi
	popq	%rbx
	jmp	putchar                 # TAILCALL
.Lfunc_end3:
	.size	printf_Matrix, .Lfunc_end3-printf_Matrix
	.cfi_endproc

	.globl	matrix
	.p2align	4, 0x90
	.type	matrix,@function
matrix:                                 # @matrix
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp22:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp23:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp24:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp25:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp26:
	.cfi_def_cfa_offset 48
.Ltmp27:
	.cfi_offset %rbx, -40
.Ltmp28:
	.cfi_offset %r12, -32
.Ltmp29:
	.cfi_offset %r14, -24
.Ltmp30:
	.cfi_offset %r15, -16
	movq	%rcx, %rbx
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %r12
	movl	$32, %edi
	callq	malloc
	movq	%rbx, 8(%rax)
	movq	%r14, (%rax)
	movq	%r15, 24(%rax)
	movq	%r12, 16(%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Lfunc_end4:
	.size	matrix, .Lfunc_end4-matrix
	.cfi_endproc

	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp31:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp32:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp33:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp34:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp35:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp36:
	.cfi_def_cfa_offset 56
	subq	$104, %rsp
.Ltmp37:
	.cfi_def_cfa_offset 160
.Ltmp38:
	.cfi_offset %rbx, -56
.Ltmp39:
	.cfi_offset %r12, -48
.Ltmp40:
	.cfi_offset %r13, -40
.Ltmp41:
	.cfi_offset %r14, -32
.Ltmp42:
	.cfi_offset %r15, -24
.Ltmp43:
	.cfi_offset %rbp, -16
	movq	%rsi, %rbx
	movq	%rdi, 8(%rsp)           # 8-byte Spill
	imulq	%rdi, %rsi
	xorl	%edi, %edi
	movq	%rsi, 64(%rsp)          # 8-byte Spill
	callq	create1DArray
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movq	%rbx, 16(%rsp)          # 8-byte Spill
	testq	%rbx, %rbx
	jle	.LBB5_15
# BB#1:                                 # %polly.start
	movq	16(%rsp), %rax          # 8-byte Reload
	decq	%rax
	sarq	$5, %rax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	js	.LBB5_15
# BB#2:                                 # %polly.loop_header.preheader
	movq	8(%rsp), %rcx           # 8-byte Reload
	leaq	-1(%rcx), %rax
	sarq	$5, %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	%rcx, %rax
	shrq	$2, %rax
	decq	%rax
	movq	%rax, 88(%rsp)          # 8-byte Spill
	movl	%ecx, %r14d
	andl	$3, %r14d
	movabsq	$2305843009213693948, %rax # imm = 0x1FFFFFFFFFFFFFFC
	andq	%rcx, %rax
	movq	40(%rsp), %rdx          # 8-byte Reload
	leaq	(%rdx,%rax,8), %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	%rcx, %rax
	shlq	$8, %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	leaq	(,%rcx,8), %rax
	addq	$16, %rdx
	movq	%rdx, 48(%rsp)          # 8-byte Spill
	xorl	%ecx, %ecx
	movq	%rcx, 24(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB5_3:                                # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_5 Depth 2
                                        #       Child Loop BB5_18 Depth 3
                                        #         Child Loop BB5_21 Depth 4
                                        #       Child Loop BB5_8 Depth 3
                                        #         Child Loop BB5_9 Depth 4
                                        #         Child Loop BB5_11 Depth 4
	cmpq	$0, 56(%rsp)            # 8-byte Folded Reload
	js	.LBB5_14
# BB#4:                                 # %polly.loop_header91.preheader
                                        #   in Loop: Header=BB5_3 Depth=1
	movq	24(%rsp), %r11          # 8-byte Reload
	shlq	$5, %r11
	movq	16(%rsp), %rdx          # 8-byte Reload
	subq	%r11, %rdx
	decq	%rdx
	cmpq	$31, %rdx
	movl	$31, %ecx
	cmovgq	%rcx, %rdx
	movq	%rdx, 96(%rsp)          # 8-byte Spill
	leaq	-1(%rdx), %r13
	movq	48(%rsp), %r15          # 8-byte Reload
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB5_5:                                # %polly.loop_header91
                                        #   Parent Loop BB5_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_18 Depth 3
                                        #         Child Loop BB5_21 Depth 4
                                        #       Child Loop BB5_8 Depth 3
                                        #         Child Loop BB5_9 Depth 4
                                        #         Child Loop BB5_11 Depth 4
	cmpq	$0, 96(%rsp)            # 8-byte Folded Reload
	js	.LBB5_13
# BB#6:                                 # %polly.loop_header100.preheader
                                        #   in Loop: Header=BB5_5 Depth=2
	leaq	(,%r8,8), %rcx
	movq	88(%rsp), %rdx          # 8-byte Reload
	subq	%rcx, %rdx
	cmpq	$7, %rdx
	movl	$7, %ecx
	cmovgq	%rcx, %rdx
	movq	%r8, %rcx
	shlq	$5, %rcx
	orq	$31, %rcx
	testq	%rdx, %rdx
	js	.LBB5_16
# BB#7:                                 # %polly.loop_header100.us.preheader
                                        #   in Loop: Header=BB5_5 Depth=2
	decq	%rdx
	cmpq	8(%rsp), %rcx           # 8-byte Folded Reload
	setl	%cl
	testq	%r14, %r14
	sete	%bpl
	orb	%cl, %bpl
	movq	32(%rsp), %r10          # 8-byte Reload
	movq	%r15, %rcx
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB5_8:                                # %polly.loop_header100.us
                                        #   Parent Loop BB5_3 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_9 Depth 4
                                        #         Child Loop BB5_11 Depth 4
	leaq	(%rbx,%r11), %r9
	movd	%r9, %xmm0
	pshufd	$68, %xmm0, %xmm0       # xmm0 = xmm0[0,1,0,1]
	movq	$-1, %rdi
	movq	%rcx, %r12
	.p2align	4, 0x90
.LBB5_9:                                # %polly.loop_header109.us
                                        #   Parent Loop BB5_3 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_8 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movdqu	-16(%r12), %xmm1
	paddq	%xmm0, %xmm1
	movdqu	%xmm1, -16(%r12)
	movdqu	(%r12), %xmm1
	paddq	%xmm0, %xmm1
	movdqu	%xmm1, (%r12)
	incq	%rdi
	addq	$32, %r12
	cmpq	%rdx, %rdi
	jle	.LBB5_9
# BB#10:                                # %polly.cond.loopexit.us
                                        #   in Loop: Header=BB5_8 Depth=3
	testb	%bpl, %bpl
	movq	%r10, %rdi
	movq	%r14, %rsi
	jne	.LBB5_12
	.p2align	4, 0x90
.LBB5_11:                               # %polly.loop_header124.us
                                        #   Parent Loop BB5_3 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_8 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	addq	%r9, (%rdi)
	addq	$8, %rdi
	decq	%rsi
	jne	.LBB5_11
.LBB5_12:                               # %polly.merge.us
                                        #   in Loop: Header=BB5_8 Depth=3
	addq	%rax, %rcx
	addq	%rax, %r10
	cmpq	%r13, %rbx
	leaq	1(%rbx), %rbx
	jle	.LBB5_8
	jmp	.LBB5_13
	.p2align	4, 0x90
.LBB5_16:                               # %polly.loop_header100.preheader.split
                                        #   in Loop: Header=BB5_5 Depth=2
	cmpq	8(%rsp), %rcx           # 8-byte Folded Reload
	jl	.LBB5_13
# BB#17:                                # %polly.loop_header100.preheader209
                                        #   in Loop: Header=BB5_5 Depth=2
	movq	32(%rsp), %rdx          # 8-byte Reload
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB5_18:                               # %polly.loop_header100
                                        #   Parent Loop BB5_3 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_21 Depth 4
	testq	%r14, %r14
	je	.LBB5_19
# BB#20:                                # %polly.loop_header124.preheader
                                        #   in Loop: Header=BB5_18 Depth=3
	leaq	(%rbp,%r11), %rcx
	movq	%rdx, %rsi
	movq	%r14, %rdi
	.p2align	4, 0x90
.LBB5_21:                               # %polly.loop_header124
                                        #   Parent Loop BB5_3 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_18 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	addq	%rcx, (%rsi)
	addq	$8, %rsi
	decq	%rdi
	jne	.LBB5_21
.LBB5_19:                               # %polly.merge
                                        #   in Loop: Header=BB5_18 Depth=3
	addq	%rax, %rdx
	cmpq	%r13, %rbp
	leaq	1(%rbp), %rbp
	jle	.LBB5_18
	.p2align	4, 0x90
.LBB5_13:                               # %polly.loop_exit102
                                        #   in Loop: Header=BB5_5 Depth=2
	addq	$256, %r15              # imm = 0x100
	cmpq	56(%rsp), %r8           # 8-byte Folded Reload
	leaq	1(%r8), %r8
	jne	.LBB5_5
.LBB5_14:                               # %polly.loop_exit93
                                        #   in Loop: Header=BB5_3 Depth=1
	movq	72(%rsp), %rcx          # 8-byte Reload
	addq	%rcx, 32(%rsp)          # 8-byte Folded Spill
	addq	%rcx, 48(%rsp)          # 8-byte Folded Spill
	movq	24(%rsp), %rcx          # 8-byte Reload
	cmpq	80(%rsp), %rcx          # 8-byte Folded Reload
	leaq	1(%rcx), %rcx
	movq	%rcx, 24(%rsp)          # 8-byte Spill
	jne	.LBB5_3
.LBB5_15:                               # %if.end24
	movl	$32, %edi
	callq	malloc
	movq	64(%rsp), %rcx          # 8-byte Reload
	movq	%rcx, 8(%rax)
	movq	40(%rsp), %rcx          # 8-byte Reload
	movq	%rcx, (%rax)
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rcx, 24(%rax)
	movq	8(%rsp), %rcx           # 8-byte Reload
	movq	%rcx, 16(%rax)
	addq	$104, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end5:
	.size	init, .Lfunc_end5-init
	.cfi_endproc

	.globl	print_mat
	.p2align	4, 0x90
	.type	print_mat,@function
print_mat:                              # @print_mat
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp44:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp45:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp46:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp47:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp48:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp49:
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
.Ltmp50:
	.cfi_def_cfa_offset 112
.Ltmp51:
	.cfi_offset %rbx, -56
.Ltmp52:
	.cfi_offset %r12, -48
.Ltmp53:
	.cfi_offset %r13, -40
.Ltmp54:
	.cfi_offset %r14, -32
.Ltmp55:
	.cfi_offset %r15, -24
.Ltmp56:
	.cfi_offset %rbp, -16
	movl	%edx, %r12d
	movq	%rsi, %rbx
	movq	24(%rbx), %r13
	xorl	%ebp, %ebp
	testq	%r13, %r13
	jle	.LBB6_1
# BB#2:                                 # %while.cond3.preheader.preheader
	movq	16(%rbx), %r15
	testq	%r15, %r15
	jle	.LBB6_3
# BB#7:                                 # %while.cond3.preheader.us.preheader
	movq	%r13, 32(%rsp)          # 8-byte Spill
	movl	%r12d, 12(%rsp)         # 4-byte Spill
	leaq	(,%r15,8), %rax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	xorl	%r13d, %r13d
	xorl	%edx, %edx
                                        # implicit-def: %RAX
	movq	%rax, (%rsp)            # 8-byte Spill
	xorl	%ebp, %ebp
	xorl	%r14d, %r14d
	movq	%r15, 24(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB6_8:                                # %while.cond3.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_9 Depth 2
	movq	%r14, 48(%rsp)          # 8-byte Spill
	movq	%r13, %r14
	movq	%rdx, 40(%rsp)          # 8-byte Spill
	movl	%edx, %r12d
	.p2align	4, 0x90
.LBB6_9:                                # %if.end7.us
                                        #   Parent Loop BB6_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rbx), %rax
	movq	(%rax,%r14), %rsi
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	callq	printf
	testb	$1, %r12b
	je	.LBB6_11
# BB#10:                                # %if.then8.us
                                        #   in Loop: Header=BB6_9 Depth=2
	movq	%rbp, %rdi
	callq	free
.LBB6_11:                               # %if.end9.us
                                        #   in Loop: Header=BB6_9 Depth=2
	xorl	%edi, %edi
	movl	$1, %esi
	callq	create1DArray
	movq	%rax, %rbp
	movq	$32, (%rbp)
	movl	$1, %esi
	movq	%rbp, %rdi
	callq	printf_s
	addq	$8, %r14
	decq	%r15
	movb	$1, %r12b
	jne	.LBB6_9
# BB#12:                                # %blklab8.loopexit.us
                                        #   in Loop: Header=BB6_8 Depth=1
	movq	48(%rsp), %r14          # 8-byte Reload
	incq	%r14
	movq	40(%rsp), %rax          # 8-byte Reload
	testb	$1, %al
	je	.LBB6_14
# BB#13:                                # %if.then15.us
                                        #   in Loop: Header=BB6_8 Depth=1
	movq	(%rsp), %rdi            # 8-byte Reload
	callq	free
.LBB6_14:                               # %if.end16.us
                                        #   in Loop: Header=BB6_8 Depth=1
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	create1DArray
	xorl	%esi, %esi
	movq	%rax, (%rsp)            # 8-byte Spill
	movq	%rax, %rdi
	callq	println_s
	addq	16(%rsp), %r13          # 8-byte Folded Reload
	movb	$1, %dl
	cmpq	32(%rsp), %r14          # 8-byte Folded Reload
	movq	24(%rsp), %r15          # 8-byte Reload
	jne	.LBB6_8
# BB#15:                                # %blklab6.loopexit
	movb	$1, %r14b
	movb	$1, %r15b
	movl	12(%rsp), %r12d         # 4-byte Reload
	jmp	.LBB6_16
.LBB6_1:
	xorl	%r14d, %r14d
                                        # implicit-def: %RAX
	movq	%rax, (%rsp)            # 8-byte Spill
	xorl	%r15d, %r15d
	jmp	.LBB6_16
.LBB6_3:                                # %while.cond3.preheader.preheader100
	xorl	%r14d, %r14d
                                        # implicit-def: %RAX
	movq	%rax, (%rsp)            # 8-byte Spill
	.p2align	4, 0x90
.LBB6_4:                                # %while.cond3.preheader
                                        # =>This Inner Loop Header: Depth=1
	testb	$1, %r14b
	je	.LBB6_6
# BB#5:                                 # %if.then15
                                        #   in Loop: Header=BB6_4 Depth=1
	movq	(%rsp), %rdi            # 8-byte Reload
	callq	free
.LBB6_6:                                # %if.end16
                                        #   in Loop: Header=BB6_4 Depth=1
	xorl	%r15d, %r15d
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	create1DArray
	xorl	%esi, %esi
	movq	%rax, (%rsp)            # 8-byte Spill
	movq	%rax, %rdi
	callq	println_s
	decq	%r13
	movb	$1, %r14b
	movl	$0, %ebp
	jne	.LBB6_4
.LBB6_16:                               # %blklab6
	testb	%r12b, %r12b
	je	.LBB6_18
# BB#17:                                # %if.then20
	movq	(%rbx), %rdi
	callq	free
	movq	%rbx, %rdi
	callq	free
.LBB6_18:                               # %if.end24
	testb	%r15b, %r15b
	je	.LBB6_20
# BB#19:                                # %if.then26
	movq	%rbp, %rdi
	callq	free
.LBB6_20:                               # %if.end27
	testb	%r14b, %r14b
	je	.LBB6_21
# BB#22:                                # %if.then29
	movq	(%rsp), %rdi            # 8-byte Reload
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	free                    # TAILCALL
.LBB6_21:                               # %if.end30
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end6:
	.size	print_mat, .Lfunc_end6-print_mat
	.cfi_endproc

	.globl	mat_mult
	.p2align	4, 0x90
	.type	mat_mult,@function
mat_mult:                               # @mat_mult
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp57:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp58:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp59:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp60:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp61:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp62:
	.cfi_def_cfa_offset 56
	subq	$472, %rsp              # imm = 0x1D8
.Ltmp63:
	.cfi_def_cfa_offset 528
.Ltmp64:
	.cfi_offset %rbx, -56
.Ltmp65:
	.cfi_offset %r12, -48
.Ltmp66:
	.cfi_offset %r13, -40
.Ltmp67:
	.cfi_offset %r14, -32
.Ltmp68:
	.cfi_offset %r15, -24
.Ltmp69:
	.cfi_offset %rbp, -16
	movl	%ecx, 108(%rsp)         # 4-byte Spill
	movl	%esi, 104(%rsp)         # 4-byte Spill
	movq	%rdx, 120(%rsp)         # 8-byte Spill
	movq	16(%rdx), %rbx
	movq	%rdi, 112(%rsp)         # 8-byte Spill
	movq	24(%rdi), %rbp
	movq	%rbp, %rsi
	imulq	%rbx, %rsi
	xorl	%edi, %edi
	movq	%rsi, 280(%rsp)         # 8-byte Spill
	callq	create1DArray
	movq	%rbx, %rdx
	movq	%rax, %rbx
	movq	%rbp, 56(%rsp)          # 8-byte Spill
	testq	%rbp, %rbp
	jle	.LBB7_13
# BB#1:                                 # %polly.split_new_and_old
	movq	112(%rsp), %rax         # 8-byte Reload
	movq	(%rax), %r15
	movq	120(%rsp), %rax         # 8-byte Reload
	movq	(%rax), %rdi
	movq	%rdx, %rbp
	decq	%rbp
	seto	%al
	movq	%rbx, %rsi
	movq	%rbp, %r12
	movq	%rbp, %rcx
	imulq	%rdx, %rcx
	seto	%r11b
	addq	%rdx, %rcx
	seto	%r9b
	leaq	(%rdi,%rcx,8), %rcx
	cmpq	%rsi, %rcx
	setbe	%r10b
	movq	56(%rsp), %rbp          # 8-byte Reload
	decq	%rbp
	seto	%r14b
	movq	%rdx, %rcx
	movq	%rbp, 128(%rsp)         # 8-byte Spill
	movq	%rbp, %rdx
	imulq	%rcx, %rdx
	seto	%r8b
	movq	%rcx, 24(%rsp)          # 8-byte Spill
	addq	%rcx, %rdx
	seto	%bl
	leaq	(%rsi,%rdx,8), %rbp
	movq	%rdi, 32(%rsp)          # 8-byte Spill
	cmpq	%rdi, %rbp
	setbe	%cl
	orb	%r10b, %cl
	leaq	(%r15,%rdx,8), %rdx
	movq	%rsi, 16(%rsp)          # 8-byte Spill
	cmpq	%rsi, %rdx
	setbe	%dl
	movq	%r15, 40(%rsp)          # 8-byte Spill
	cmpq	%r15, %rbp
	setbe	%r10b
	cmpb	$1, %cl
	jne	.LBB7_4
# BB#2:                                 # %polly.split_new_and_old
	orb	%r10b, %dl
	je	.LBB7_4
# BB#3:                                 # %polly.split_new_and_old
	orb	%r11b, %al
	orb	%r14b, %al
	orb	%r8b, %al
	orb	%al, %r9b
	orb	%r9b, %bl
	xorb	$1, %bl
	testb	$1, %bl
	je	.LBB7_4
# BB#20:                                # %polly.start
	sarq	$5, 128(%rsp)           # 8-byte Folded Spill
	movq	24(%rsp), %rdx          # 8-byte Reload
	movq	16(%rsp), %rbx          # 8-byte Reload
	js	.LBB7_13
# BB#21:                                # %polly.loop_header.preheader
	movq	%r12, %rax
	sarq	$5, %rax
	movq	%rax, 144(%rsp)         # 8-byte Spill
	shrq	$5, %r12
	movq	%r12, 360(%rsp)         # 8-byte Spill
	movq	%rdx, %rax
	shrq	$2, %rax
	movl	%edx, %ecx
	andl	$3, %ecx
	movq	%rdx, %rbp
	andq	$-4, %rbp
	leaq	-1(%rcx), %rsi
	movq	%rsi, 248(%rsp)         # 8-byte Spill
	movl	%edx, %esi
	andl	$1, %esi
	movq	%rcx, 208(%rsp)         # 8-byte Spill
	movq	%rcx, %r14
	movq	%rsi, 240(%rsp)         # 8-byte Spill
	subq	%rsi, %r14
	leaq	1(%rbp), %rcx
	imulq	%rdx, %rcx
	movq	32(%rsp), %rdi          # 8-byte Reload
	leaq	(%rdi,%rcx,8), %r13
	movq	16(%rsp), %rbx          # 8-byte Reload
	movq	%rdx, %rcx
	shlq	$4, %rcx
	movq	40(%rsp), %rsi          # 8-byte Reload
	movq	%rbp, 216(%rsp)         # 8-byte Spill
	leaq	8(%rsi,%rbp,8), %rbp
	movq	%rbp, 152(%rsp)         # 8-byte Spill
	movq	%rdx, %rbp
	shlq	$8, %rbp
	movq	%rbp, 160(%rsp)         # 8-byte Spill
	leaq	(,%rdx,8), %rbp
	movq	%rbp, 400(%rsp)         # 8-byte Spill
	movq	%rdx, %rbp
	imulq	%rax, %rbp
	decq	%rax
	movq	%rax, 352(%rsp)         # 8-byte Spill
	shlq	$5, %rbp
	addq	%rdi, %rbp
	movq	%rbp, 224(%rsp)         # 8-byte Spill
	leaq	(%rdx,%rdx,2), %rax
	leaq	(%rdi,%rax,8), %rax
	movq	%rax, 304(%rsp)         # 8-byte Spill
	movq	%rdx, %r12
	shlq	$5, %r12
	leaq	24(%rsi), %rax
	movq	%rax, 136(%rsp)         # 8-byte Spill
	movq	%rcx, 232(%rsp)         # 8-byte Spill
	leaq	(%rdi,%rcx), %rax
	movq	%rax, 296(%rsp)         # 8-byte Spill
	leaq	(%rdi,%rdx,8), %rax
	movq	%rax, 288(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	%r13, 432(%rsp)         # 8-byte Spill
	movq	%r14, 424(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB7_22:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_24 Depth 2
                                        #       Child Loop BB7_25 Depth 3
                                        #         Child Loop BB7_27 Depth 4
                                        #           Child Loop BB7_47 Depth 5
                                        #             Child Loop BB7_55 Depth 6
                                        #           Child Loop BB7_30 Depth 5
                                        #             Child Loop BB7_31 Depth 6
                                        #             Child Loop BB7_38 Depth 6
	cmpq	$0, 144(%rsp)           # 8-byte Folded Reload
	js	.LBB7_36
# BB#23:                                # %polly.loop_header258.preheader
                                        #   in Loop: Header=BB7_22 Depth=1
	movq	72(%rsp), %rcx          # 8-byte Reload
	shlq	$5, %rcx
	movq	56(%rsp), %rsi          # 8-byte Reload
	movq	%rcx, %rax
	movq	%rax, 384(%rsp)         # 8-byte Spill
	subq	%rcx, %rsi
	decq	%rsi
	cmpq	$31, %rsi
	movl	$31, %eax
	cmovgq	%rax, %rsi
	movq	%rsi, 368(%rsp)         # 8-byte Spill
	leaq	-1(%rsi), %rax
	movq	%rax, 408(%rsp)         # 8-byte Spill
	movq	32(%rsp), %rcx          # 8-byte Reload
	movq	288(%rsp), %rsi         # 8-byte Reload
	movq	296(%rsp), %rdi         # 8-byte Reload
	movq	304(%rsp), %rbp         # 8-byte Reload
	xorl	%eax, %eax
	movq	%rax, 88(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB7_24:                               # %polly.loop_header258
                                        #   Parent Loop BB7_22 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_25 Depth 3
                                        #         Child Loop BB7_27 Depth 4
                                        #           Child Loop BB7_47 Depth 5
                                        #             Child Loop BB7_55 Depth 6
                                        #           Child Loop BB7_30 Depth 5
                                        #             Child Loop BB7_31 Depth 6
                                        #             Child Loop BB7_38 Depth 6
	movq	%rax, 312(%rsp)         # 8-byte Spill
	movq	%rax, %rbx
	shlq	$5, %rbx
	movq	%rdx, %rax
	movq	%rbx, %rdx
	movq	%rdx, 264(%rsp)         # 8-byte Spill
	subq	%rbx, %rax
	decq	%rax
	cmpq	$31, %rax
	movl	$31, %edx
	cmovleq	%rax, %rdx
	movq	%rdx, 416(%rsp)         # 8-byte Spill
	leaq	-1(%rdx), %rax
	movq	%rax, 272(%rsp)         # 8-byte Spill
	movq	%rcx, 344(%rsp)         # 8-byte Spill
	movq	%rcx, 200(%rsp)         # 8-byte Spill
	movq	%rsi, 336(%rsp)         # 8-byte Spill
	movq	%rsi, 192(%rsp)         # 8-byte Spill
	movq	%rdi, 328(%rsp)         # 8-byte Spill
	movq	%rdi, 184(%rsp)         # 8-byte Spill
	movq	136(%rsp), %rax         # 8-byte Reload
	movq	%rax, 168(%rsp)         # 8-byte Spill
	movq	%rbp, 320(%rsp)         # 8-byte Spill
	movq	%rbp, 176(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB7_25:                               # %polly.loop_header266
                                        #   Parent Loop BB7_22 Depth=1
                                        #     Parent Loop BB7_24 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB7_27 Depth 4
                                        #           Child Loop BB7_47 Depth 5
                                        #             Child Loop BB7_55 Depth 6
                                        #           Child Loop BB7_30 Depth 5
                                        #             Child Loop BB7_31 Depth 6
                                        #             Child Loop BB7_38 Depth 6
	cmpq	$0, 368(%rsp)           # 8-byte Folded Reload
	js	.LBB7_44
# BB#26:                                # %polly.loop_header274.preheader
                                        #   in Loop: Header=BB7_25 Depth=3
	cmpq	$0, 208(%rsp)           # 8-byte Folded Reload
	sete	%al
	movq	80(%rsp), %rsi          # 8-byte Reload
	leaq	(,%rsi,8), %rcx
	movq	352(%rsp), %rdi         # 8-byte Reload
	subq	%rcx, %rdi
	cmpq	$7, %rdi
	movl	$7, %ecx
	cmovgq	%rcx, %rdi
	shlq	$5, %rsi
	orq	$31, %rsi
	movq	%rsi, 376(%rsp)         # 8-byte Spill
	cmpq	24(%rsp), %rsi          # 8-byte Folded Reload
	setl	%cl
	movq	%rdi, 392(%rsp)         # 8-byte Spill
	leaq	-1(%rdi), %r10
	orb	%al, %cl
	movb	%cl, 15(%rsp)           # 1-byte Spill
	movq	168(%rsp), %rax         # 8-byte Reload
	movq	%rax, 256(%rsp)         # 8-byte Spill
	movq	152(%rsp), %r15         # 8-byte Reload
	xorl	%eax, %eax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB7_27:                               # %polly.loop_header274
                                        #   Parent Loop BB7_22 Depth=1
                                        #     Parent Loop BB7_24 Depth=2
                                        #       Parent Loop BB7_25 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB7_47 Depth 5
                                        #             Child Loop BB7_55 Depth 6
                                        #           Child Loop BB7_30 Depth 5
                                        #             Child Loop BB7_31 Depth 6
                                        #             Child Loop BB7_38 Depth 6
	cmpq	$0, 416(%rsp)           # 8-byte Folded Reload
	js	.LBB7_43
# BB#28:                                # %polly.loop_header283.preheader
                                        #   in Loop: Header=BB7_27 Depth=4
	movq	384(%rsp), %rax         # 8-byte Reload
	movq	96(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rax), %rbp
	movq	24(%rsp), %rax          # 8-byte Reload
	imulq	%rax, %rbp
	cmpq	$0, 392(%rsp)           # 8-byte Folded Reload
	movq	%rbp, 64(%rsp)          # 8-byte Spill
	js	.LBB7_45
# BB#29:                                # %polly.loop_header283.us.preheader
                                        #   in Loop: Header=BB7_27 Depth=4
	movq	88(%rsp), %rax          # 8-byte Reload
	movq	%rax, %rbx
	movq	200(%rsp), %rsi         # 8-byte Reload
	movq	192(%rsp), %r8          # 8-byte Reload
	movq	184(%rsp), %r9          # 8-byte Reload
	movq	176(%rsp), %rcx         # 8-byte Reload
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB7_30:                               # %polly.loop_header283.us
                                        #   Parent Loop BB7_22 Depth=1
                                        #     Parent Loop BB7_24 Depth=2
                                        #       Parent Loop BB7_25 Depth=3
                                        #         Parent Loop BB7_27 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB7_31 Depth 6
                                        #             Child Loop BB7_38 Depth 6
	movq	%rbx, 456(%rsp)         # 8-byte Spill
	movq	264(%rsp), %rax         # 8-byte Reload
	movq	%rdx, 448(%rsp)         # 8-byte Spill
	leaq	(%rdx,%rax), %rax
	movq	%rax, 440(%rsp)         # 8-byte Spill
	leaq	(%rax,%rbp), %rdx
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	%rdx, %rbx
	movq	(%rax,%rdx,8), %rdi
	movq	$-1, %r14
	movq	%rsi, 48(%rsp)          # 8-byte Spill
	movq	%r8, %rbp
	movq	%r9, %rdx
	movq	%r9, %r11
	movq	256(%rsp), %r13         # 8-byte Reload
	movq	%rcx, 464(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB7_31:                               # %polly.loop_header293.us
                                        #   Parent Loop BB7_22 Depth=1
                                        #     Parent Loop BB7_24 Depth=2
                                        #       Parent Loop BB7_25 Depth=3
                                        #         Parent Loop BB7_27 Depth=4
                                        #           Parent Loop BB7_30 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	(%rsi), %rax
	imulq	-24(%r13), %rax
	addq	%rdi, %rax
	movq	(%r8), %rdi
	imulq	-16(%r13), %rdi
	addq	%rax, %rdi
	movq	(%r11), %rax
	imulq	-8(%r13), %rax
	addq	%rdi, %rax
	movq	(%rcx), %rdi
	imulq	(%r13), %rdi
	addq	%rax, %rdi
	incq	%r14
	addq	%r12, %rcx
	addq	$32, %r13
	addq	%r12, %r11
	addq	%r12, %r8
	addq	%r12, %rsi
	cmpq	%r10, %r14
	jle	.LBB7_31
# BB#32:                                # %polly.cond.loopexit.us
                                        #   in Loop: Header=BB7_30 Depth=5
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	%rbx, %r11
	movq	%rdi, (%rax,%r11,8)
	cmpb	$0, 15(%rsp)            # 1-byte Folded Reload
	movq	424(%rsp), %r14         # 8-byte Reload
	movq	432(%rsp), %r13         # 8-byte Reload
	movq	456(%rsp), %rbx         # 8-byte Reload
	movq	%rbp, %r8
	movq	%rdx, %r9
	movq	64(%rsp), %rbp          # 8-byte Reload
	jne	.LBB7_42
# BB#33:                                # %polly.loop_header312.us.preheader
                                        #   in Loop: Header=BB7_30 Depth=5
	cmpq	$0, 248(%rsp)           # 8-byte Folded Reload
	je	.LBB7_34
# BB#37:                                # %polly.loop_header312.us.preheader.new
                                        #   in Loop: Header=BB7_30 Depth=5
	movq	%rbx, %rax
	xorl	%esi, %esi
	movq	232(%rsp), %rdx         # 8-byte Reload
	movq	224(%rsp), %rbp         # 8-byte Reload
	.p2align	4, 0x90
.LBB7_38:                               # %polly.loop_header312.us
                                        #   Parent Loop BB7_22 Depth=1
                                        #     Parent Loop BB7_24 Depth=2
                                        #       Parent Loop BB7_25 Depth=3
                                        #         Parent Loop BB7_27 Depth=4
                                        #           Parent Loop BB7_30 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	(%rbp,%rax), %rcx
	imulq	-8(%r15,%rsi,8), %rcx
	addq	%rdi, %rcx
	movq	(%r13,%rax), %rdi
	imulq	(%r15,%rsi,8), %rdi
	addq	%rcx, %rdi
	addq	$2, %rsi
	addq	%rdx, %rax
	cmpq	%rsi, %r14
	jne	.LBB7_38
	jmp	.LBB7_39
.LBB7_34:                               #   in Loop: Header=BB7_30 Depth=5
	xorl	%esi, %esi
.LBB7_39:                               # %polly.merge.loopexit.us.unr-lcssa
                                        #   in Loop: Header=BB7_30 Depth=5
	cmpq	$0, 240(%rsp)           # 8-byte Folded Reload
	movq	64(%rsp), %rbp          # 8-byte Reload
	je	.LBB7_41
# BB#40:                                # %polly.merge.loopexit.us.epilog-lcssa
                                        #   in Loop: Header=BB7_30 Depth=5
	addq	216(%rsp), %rsi         # 8-byte Folded Reload
	movq	%rsi, %rax
	imulq	24(%rsp), %rax          # 8-byte Folded Reload
	addq	440(%rsp), %rax         # 8-byte Folded Reload
	movq	32(%rsp), %rcx          # 8-byte Reload
	movq	(%rcx,%rax,8), %rax
	addq	%rbp, %rsi
	movq	40(%rsp), %rcx          # 8-byte Reload
	imulq	(%rcx,%rsi,8), %rax
	addq	%rax, %rdi
.LBB7_41:                               # %polly.merge.loopexit.us
                                        #   in Loop: Header=BB7_30 Depth=5
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	%rdi, (%rax,%r11,8)
.LBB7_42:                               # %polly.merge.us
                                        #   in Loop: Header=BB7_30 Depth=5
	movq	464(%rsp), %rcx         # 8-byte Reload
	addq	$8, %rcx
	addq	$8, %r9
	addq	$8, %r8
	movq	48(%rsp), %rsi          # 8-byte Reload
	addq	$8, %rsi
	addq	$8, %rbx
	movq	448(%rsp), %rdx         # 8-byte Reload
	cmpq	272(%rsp), %rdx         # 8-byte Folded Reload
	leaq	1(%rdx), %rdx
	jle	.LBB7_30
	jmp	.LBB7_43
	.p2align	4, 0x90
.LBB7_45:                               # %polly.loop_header283.preheader.split
                                        #   in Loop: Header=BB7_27 Depth=4
	cmpq	%rax, 376(%rsp)         # 8-byte Folded Reload
	jl	.LBB7_43
# BB#46:                                # %polly.loop_header283.preheader470
                                        #   in Loop: Header=BB7_27 Depth=4
	movq	88(%rsp), %r11          # 8-byte Reload
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB7_47:                               # %polly.loop_header283
                                        #   Parent Loop BB7_22 Depth=1
                                        #     Parent Loop BB7_24 Depth=2
                                        #       Parent Loop BB7_25 Depth=3
                                        #         Parent Loop BB7_27 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB7_55 Depth 6
	cmpq	$0, 208(%rsp)           # 8-byte Folded Reload
	je	.LBB7_53
# BB#48:                                # %polly.loop_header312.preheader
                                        #   in Loop: Header=BB7_47 Depth=5
	movq	264(%rsp), %rax         # 8-byte Reload
	leaq	(%rbx,%rax), %rcx
	leaq	(%rcx,%rbp), %r9
	cmpq	$0, 248(%rsp)           # 8-byte Folded Reload
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	(%rax,%r9,8), %rbp
	movq	%rcx, 48(%rsp)          # 8-byte Spill
	je	.LBB7_49
# BB#54:                                # %polly.loop_header312.preheader.new
                                        #   in Loop: Header=BB7_47 Depth=5
	movq	%r15, %rax
	movq	%r11, %rdx
	xorl	%ecx, %ecx
	movq	232(%rsp), %rsi         # 8-byte Reload
	movq	224(%rsp), %r8          # 8-byte Reload
	.p2align	4, 0x90
.LBB7_55:                               # %polly.loop_header312
                                        #   Parent Loop BB7_22 Depth=1
                                        #     Parent Loop BB7_24 Depth=2
                                        #       Parent Loop BB7_25 Depth=3
                                        #         Parent Loop BB7_27 Depth=4
                                        #           Parent Loop BB7_47 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	(%r8,%rdx), %rdi
	imulq	-8(%rax), %rdi
	addq	%rbp, %rdi
	movq	(%r13,%rdx), %rbp
	imulq	(%rax), %rbp
	addq	%rdi, %rbp
	addq	$2, %rcx
	addq	%rsi, %rdx
	addq	$16, %rax
	cmpq	%rcx, %r14
	jne	.LBB7_55
	jmp	.LBB7_50
	.p2align	4, 0x90
.LBB7_49:                               #   in Loop: Header=BB7_47 Depth=5
	xorl	%ecx, %ecx
.LBB7_50:                               # %polly.merge.loopexit.unr-lcssa
                                        #   in Loop: Header=BB7_47 Depth=5
	cmpq	$0, 240(%rsp)           # 8-byte Folded Reload
	je	.LBB7_52
# BB#51:                                # %polly.merge.loopexit.epilog-lcssa
                                        #   in Loop: Header=BB7_47 Depth=5
	addq	216(%rsp), %rcx         # 8-byte Folded Reload
	movq	%rcx, %rax
	imulq	24(%rsp), %rax          # 8-byte Folded Reload
	addq	48(%rsp), %rax          # 8-byte Folded Reload
	movq	32(%rsp), %rdx          # 8-byte Reload
	movq	(%rdx,%rax,8), %rax
	addq	64(%rsp), %rcx          # 8-byte Folded Reload
	movq	40(%rsp), %rdx          # 8-byte Reload
	imulq	(%rdx,%rcx,8), %rax
	addq	%rax, %rbp
.LBB7_52:                               # %polly.merge.loopexit
                                        #   in Loop: Header=BB7_47 Depth=5
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	%rbp, (%rax,%r9,8)
	movq	64(%rsp), %rbp          # 8-byte Reload
.LBB7_53:                               # %polly.merge
                                        #   in Loop: Header=BB7_47 Depth=5
	addq	$8, %r11
	cmpq	272(%rsp), %rbx         # 8-byte Folded Reload
	leaq	1(%rbx), %rbx
	jle	.LBB7_47
	.p2align	4, 0x90
.LBB7_43:                               # %polly.loop_exit285
                                        #   in Loop: Header=BB7_27 Depth=4
	movq	400(%rsp), %rax         # 8-byte Reload
	addq	%rax, %r15
	addq	%rax, 256(%rsp)         # 8-byte Folded Spill
	movq	96(%rsp), %rax          # 8-byte Reload
	cmpq	408(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	jle	.LBB7_27
.LBB7_44:                               # %polly.loop_exit276
                                        #   in Loop: Header=BB7_25 Depth=3
	movq	160(%rsp), %rax         # 8-byte Reload
	addq	%rax, 176(%rsp)         # 8-byte Folded Spill
	addq	$256, 168(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x100
	addq	%rax, 184(%rsp)         # 8-byte Folded Spill
	addq	%rax, 192(%rsp)         # 8-byte Folded Spill
	addq	%rax, 200(%rsp)         # 8-byte Folded Spill
	movq	80(%rsp), %rax          # 8-byte Reload
	cmpq	360(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	jne	.LBB7_25
# BB#35:                                # %polly.loop_exit268
                                        #   in Loop: Header=BB7_24 Depth=2
	movq	16(%rsp), %rbx          # 8-byte Reload
	addq	$256, 88(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	movq	320(%rsp), %rbp         # 8-byte Reload
	addq	$256, %rbp              # imm = 0x100
	movq	328(%rsp), %rdi         # 8-byte Reload
	addq	$256, %rdi              # imm = 0x100
	movq	336(%rsp), %rsi         # 8-byte Reload
	addq	$256, %rsi              # imm = 0x100
	movq	344(%rsp), %rcx         # 8-byte Reload
	addq	$256, %rcx              # imm = 0x100
	movq	312(%rsp), %rax         # 8-byte Reload
	cmpq	144(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	24(%rsp), %rdx          # 8-byte Reload
	jne	.LBB7_24
.LBB7_36:                               # %polly.loop_exit260
                                        #   in Loop: Header=BB7_22 Depth=1
	movq	160(%rsp), %rax         # 8-byte Reload
	addq	%rax, 152(%rsp)         # 8-byte Folded Spill
	addq	%rax, 136(%rsp)         # 8-byte Folded Spill
	movq	72(%rsp), %rax          # 8-byte Reload
	cmpq	128(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	jne	.LBB7_22
	jmp	.LBB7_13
.LBB7_4:                                # %while.cond27.preheader.preheader
	movq	24(%rsp), %rdx          # 8-byte Reload
	testq	%rdx, %rdx
	movq	16(%rsp), %rbx          # 8-byte Reload
	jle	.LBB7_13
# BB#5:                                 # %while.cond27.preheader.us.preheader
	movl	%edx, %r10d
	andl	$1, %r10d
	movq	%rdx, %r12
	subq	%r10, %r12
	leaq	(,%rdx,8), %r13
	movq	%rdx, %rsi
	shlq	$4, %rsi
	movq	40(%rsp), %rax          # 8-byte Reload
	leaq	8(%rax), %r9
	xorl	%eax, %eax
	movq	16(%rsp), %r8           # 8-byte Reload
	.p2align	4, 0x90
.LBB7_6:                                # %while.cond27.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_7 Depth 2
                                        #       Child Loop BB7_19 Depth 3
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	%rax, %r11
	imulq	%rdx, %r11
	movq	32(%rsp), %r14          # 8-byte Reload
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB7_7:                                # %while.cond33.preheader.us.us
                                        #   Parent Loop BB7_6 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_19 Depth 3
	leaq	(%r15,%r11), %rax
	cmpq	$1, %rdx
	movq	(%rbx,%rax,8), %rbp
	jne	.LBB7_18
# BB#8:                                 #   in Loop: Header=BB7_7 Depth=2
	xorl	%ebx, %ebx
	jmp	.LBB7_9
	.p2align	4, 0x90
.LBB7_18:                               # %while.cond33.preheader.us.us.new
                                        #   in Loop: Header=BB7_7 Depth=2
	movq	%r9, %rdi
	movq	%r14, %rcx
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB7_19:                               # %if.end38.us.us
                                        #   Parent Loop BB7_6 Depth=1
                                        #     Parent Loop BB7_7 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	(%rcx), %rdx
	imulq	-8(%rdi), %rdx
	addq	%rbp, %rdx
	movq	%rdx, (%r8,%rax,8)
	movq	(%r13,%rcx), %rbp
	imulq	(%rdi), %rbp
	addq	%rdx, %rbp
	movq	%rbp, (%r8,%rax,8)
	addq	$2, %rbx
	addq	%rsi, %rcx
	addq	$16, %rdi
	cmpq	%rbx, %r12
	jne	.LBB7_19
.LBB7_9:                                # %blklab17.loopexit.us.us.unr-lcssa
                                        #   in Loop: Header=BB7_7 Depth=2
	testq	%r10, %r10
	movq	24(%rsp), %rdx          # 8-byte Reload
	je	.LBB7_11
# BB#10:                                # %if.end38.us.us.epil
                                        #   in Loop: Header=BB7_7 Depth=2
	leaq	(%rbx,%r11), %rcx
	imulq	%rdx, %rbx
	addq	%r15, %rbx
	movq	32(%rsp), %rdi          # 8-byte Reload
	movq	(%rdi,%rbx,8), %rdi
	movq	40(%rsp), %rbx          # 8-byte Reload
	imulq	(%rbx,%rcx,8), %rdi
	addq	%rbp, %rdi
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rdi, (%rcx,%rax,8)
.LBB7_11:                               # %blklab17.loopexit.us.us
                                        #   in Loop: Header=BB7_7 Depth=2
	incq	%r15
	addq	$8, %r14
	cmpq	%rdx, %r15
	movq	16(%rsp), %rbx          # 8-byte Reload
	jne	.LBB7_7
# BB#12:                                # %blklab15.loopexit.us-lcssa.us.us
                                        #   in Loop: Header=BB7_6 Depth=1
	movq	48(%rsp), %rax          # 8-byte Reload
	incq	%rax
	addq	%r13, %r9
	cmpq	56(%rsp), %rax          # 8-byte Folded Reload
	jne	.LBB7_6
.LBB7_13:                               # %if.end56
	movl	$32, %edi
	movq	%rdx, %r14
	movq	%rbx, %rbp
	callq	malloc
	movq	%rax, %rbx
	movq	280(%rsp), %rax         # 8-byte Reload
	movq	%rax, 8(%rbx)
	movq	%rbp, (%rbx)
	movq	56(%rsp), %rax          # 8-byte Reload
	movq	%rax, 24(%rbx)
	movq	%r14, 16(%rbx)
	movl	104(%rsp), %eax         # 4-byte Reload
	testb	%al, %al
	je	.LBB7_15
# BB#14:                                # %if.then60
	movq	112(%rsp), %rbp         # 8-byte Reload
	movq	(%rbp), %rdi
	callq	free
	movq	%rbp, %rdi
	callq	free
.LBB7_15:                               # %if.end61
	movl	108(%rsp), %eax         # 4-byte Reload
	testb	%al, %al
	je	.LBB7_17
# BB#16:                                # %if.then63
	movq	120(%rsp), %rbp         # 8-byte Reload
	movq	(%rbp), %rdi
	callq	free
	movq	%rbp, %rdi
	callq	free
.LBB7_17:                               # %if.end85
	movq	%rbx, %rax
	addq	$472, %rsp              # imm = 0x1D8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end7:
	.size	mat_mult, .Lfunc_end7-mat_mult
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI8_0:
	.quad	115                     # 0x73
	.quad	105                     # 0x69
.LCPI8_1:
	.quad	122                     # 0x7a
	.quad	101                     # 0x65
.LCPI8_2:
	.quad	32                      # 0x20
	.quad	61                      # 0x3d
.LCPI8_3:
	.quad	77                      # 0x4d
	.quad	97                      # 0x61
.LCPI8_4:
	.quad	116                     # 0x74
	.quad	114                     # 0x72
.LCPI8_5:
	.quad	105                     # 0x69
	.quad	120                     # 0x78
.LCPI8_6:
	.quad	32                      # 0x20
	.quad	67                      # 0x43
.LCPI8_7:
	.quad	91                      # 0x5b
	.quad	115                     # 0x73
.LCPI8_8:
	.quad	105                     # 0x69
	.quad	122                     # 0x7a
.LCPI8_9:
	.quad	101                     # 0x65
	.quad	45                      # 0x2d
.LCPI8_10:
	.quad	49                      # 0x31
	.quad	93                      # 0x5d
.LCPI8_11:
	.quad	80                      # 0x50
	.quad	97                      # 0x61
.LCPI8_12:
	.quad	115                     # 0x73
	.quad	115                     # 0x73
.LCPI8_13:
	.quad	32                      # 0x20
	.quad	77                      # 0x4d
.LCPI8_14:
	.quad	97                      # 0x61
	.quad	116                     # 0x74
.LCPI8_15:
	.quad	114                     # 0x72
	.quad	105                     # 0x69
.LCPI8_16:
	.quad	120                     # 0x78
	.quad	77                      # 0x4d
.LCPI8_17:
	.quad	117                     # 0x75
	.quad	108                     # 0x6c
.LCPI8_18:
	.quad	116                     # 0x74
	.quad	32                      # 0x20
.LCPI8_19:
	.quad	116                     # 0x74
	.quad	101                     # 0x65
.LCPI8_20:
	.quad	115                     # 0x73
	.quad	116                     # 0x74
.LCPI8_21:
	.quad	32                      # 0x20
	.quad	99                      # 0x63
.LCPI8_22:
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
.Ltmp70:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp71:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp72:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp73:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp74:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp75:
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
.Ltmp76:
	.cfi_def_cfa_offset 80
.Ltmp77:
	.cfi_offset %rbx, -56
.Ltmp78:
	.cfi_offset %r12, -48
.Ltmp79:
	.cfi_offset %r13, -40
.Ltmp80:
	.cfi_offset %r14, -32
.Ltmp81:
	.cfi_offset %r15, -24
.Ltmp82:
	.cfi_offset %rbp, -16
	callq	convertArgsToIntArray
	movq	(%rax), %rdi
	callq	parseStringToInt
	movq	%rax, %r14
	testq	%r14, %r14
	je	.LBB8_6
# BB#1:                                 # %if.end5
	movq	(%r14), %rbp
	xorl	%edi, %edi
	movl	$7, %esi
	callq	create1DArray
	movq	%rax, %r12
	movaps	.LCPI8_0(%rip), %xmm0   # xmm0 = [115,105]
	movups	%xmm0, (%r12)
	movaps	.LCPI8_1(%rip), %xmm0   # xmm0 = [122,101]
	movups	%xmm0, 16(%r12)
	movaps	.LCPI8_2(%rip), %xmm0   # xmm0 = [32,61]
	movups	%xmm0, 32(%r12)
	movq	$32, 48(%r12)
	movl	$7, %esi
	movq	%r12, %rdi
	callq	printf_s
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	movq	%rbp, %rsi
	callq	printf
	movq	%rbp, %rdi
	movq	%rbp, %rsi
	callq	init
	movq	%rax, %r13
	movq	%rbp, %rdi
	movq	%rbp, %rsi
	callq	init
	movq	%rax, %rbx
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	movq	%r13, %rdi
	movq	%rbx, %rdx
	callq	mat_mult
	movq	(%r13), %rcx
	leaq	-1(%rbp), %rdx
	movq	%rbp, %r15
	imulq	%r15, %r15
	cmpq	%rdx, -8(%rcx,%r15,8)
	jne	.LBB8_7
# BB#2:                                 # %blklab20
	movq	(%rbx), %rcx
	cmpq	%rdx, -8(%rcx,%r15,8)
	jne	.LBB8_7
# BB#3:                                 # %blklab21
	movq	%rbx, 16(%rsp)          # 8-byte Spill
	movq	(%rax), %rbx
	cmpq	$2000, %rbp             # imm = 0x7D0
	jne	.LBB8_5
# BB#4:                                 # %if.end71
	movl	$3996001000, %ecx       # imm = 0xEE2E22E8
	cmpq	%rcx, -8(%rbx,%r15,8)
	jne	.LBB8_7
.LBB8_5:                                # %if.then158
	xorl	%edi, %edi
	movl	$27, %esi
	movq	%rax, 8(%rsp)           # 8-byte Spill
	callq	create1DArray
	movq	%rax, %rbp
	movaps	.LCPI8_3(%rip), %xmm0   # xmm0 = [77,97]
	movups	%xmm0, (%rbp)
	movaps	.LCPI8_4(%rip), %xmm0   # xmm0 = [116,114]
	movups	%xmm0, 16(%rbp)
	movaps	.LCPI8_5(%rip), %xmm0   # xmm0 = [105,120]
	movups	%xmm0, 32(%rbp)
	movaps	.LCPI8_6(%rip), %xmm0   # xmm0 = [32,67]
	movups	%xmm0, 48(%rbp)
	movaps	.LCPI8_7(%rip), %xmm0   # xmm0 = [91,115]
	movups	%xmm0, 64(%rbp)
	movaps	.LCPI8_8(%rip), %xmm1   # xmm1 = [105,122]
	movups	%xmm1, 80(%rbp)
	movaps	.LCPI8_9(%rip), %xmm2   # xmm2 = [101,45]
	movups	%xmm2, 96(%rbp)
	movaps	.LCPI8_10(%rip), %xmm3  # xmm3 = [49,93]
	movups	%xmm3, 112(%rbp)
	movups	%xmm0, 128(%rbp)
	movups	%xmm1, 144(%rbp)
	movups	%xmm2, 160(%rbp)
	movups	%xmm3, 176(%rbp)
	movaps	.LCPI8_2(%rip), %xmm0   # xmm0 = [32,61]
	movups	%xmm0, 192(%rbp)
	movq	$32, 208(%rbp)
	movl	$27, %esi
	movq	%rbp, %rdi
	callq	printf_s
	movq	-8(%rbx,%r15,8), %rsi
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%edi, %edi
	movl	$25, %esi
	callq	create1DArray
	movq	%rax, %r15
	movaps	.LCPI8_11(%rip), %xmm0  # xmm0 = [80,97]
	movups	%xmm0, (%r15)
	movaps	.LCPI8_12(%rip), %xmm0  # xmm0 = [115,115]
	movups	%xmm0, 16(%r15)
	movaps	.LCPI8_13(%rip), %xmm0  # xmm0 = [32,77]
	movups	%xmm0, 32(%r15)
	movaps	.LCPI8_14(%rip), %xmm0  # xmm0 = [97,116]
	movups	%xmm0, 48(%r15)
	movaps	.LCPI8_15(%rip), %xmm0  # xmm0 = [114,105]
	movups	%xmm0, 64(%r15)
	movaps	.LCPI8_16(%rip), %xmm0  # xmm0 = [120,77]
	movups	%xmm0, 80(%r15)
	movaps	.LCPI8_17(%rip), %xmm0  # xmm0 = [117,108]
	movups	%xmm0, 96(%r15)
	movaps	.LCPI8_18(%rip), %xmm0  # xmm0 = [116,32]
	movups	%xmm0, 112(%r15)
	movaps	.LCPI8_19(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 128(%r15)
	movaps	.LCPI8_20(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 144(%r15)
	movaps	.LCPI8_21(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 160(%r15)
	movaps	.LCPI8_22(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 176(%r15)
	movq	$101, 192(%r15)
	movl	$25, %esi
	movq	%r15, %rdi
	callq	println_s
	movq	%r14, %rdi
	callq	free
	movq	(%r13), %rdi
	callq	free
	movq	%r13, %rdi
	callq	free
	movq	16(%rsp), %rbx          # 8-byte Reload
	movq	(%rbx), %rdi
	callq	free
	movq	%rbx, %rdi
	callq	free
	movq	8(%rsp), %rbx           # 8-byte Reload
	movq	(%rbx), %rdi
	callq	free
	movq	%rbx, %rdi
	callq	free
	movq	%r12, %rdi
	callq	free
	movq	%rbp, %rdi
	callq	free
	movq	%r15, %rdi
	callq	free
.LBB8_6:                                # %if.end204
	xorl	%edi, %edi
	callq	exit
.LBB8_7:                                # %if.end53
	movq	stderr(%rip), %rcx
	movl	$.L.str.7, %edi
	movl	$4, %esi
	movl	$1, %edx
	callq	fwrite
	movl	$-1, %edi
	callq	exit
.Lfunc_end8:
	.size	main, .Lfunc_end8-main
	.cfi_endproc

	.type	.L.str.1,@object        # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	" data:"
	.size	.L.str.1, 7

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	" width:"
	.size	.L.str.2, 8

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"%lld"
	.size	.L.str.3, 5

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	" height:"
	.size	.L.str.4, 9

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"%lld\n"
	.size	.L.str.6, 6

	.type	.L.str.7,@object        # @.str.7
.L.str.7:
	.asciz	"fail"
	.size	.L.str.7, 5


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git f82fb5beb88e841f7a00cfb2a2ceabe46bcb2a9b) (http://llvm.org/git/llvm.git bafbf2b643f118fd2ea402ed6cd204281c7e9e94)"
	.section	".note.GNU-stack","",@progbits
