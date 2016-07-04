	.text
	.file	"llvm/MatrixMult_transpose.copyreduced_dealloc.polly.ll"
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
	subq	$392, %rsp              # imm = 0x188
.Ltmp63:
	.cfi_def_cfa_offset 448
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
	movl	%ecx, 316(%rsp)         # 4-byte Spill
	movq	%rdx, %r14
	movl	%esi, 312(%rsp)         # 4-byte Spill
	movq	%rdi, %r12
	movq	16(%r14), %rbp
	movq	24(%r12), %r15
	movq	%r15, %rbx
	imulq	%rbp, %rbx
	xorl	%edi, %edi
	movl	%ebx, %esi
	callq	create1DArray
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	%r12, 368(%rsp)         # 8-byte Spill
	movq	(%r12), %rax
	movq	%rax, 88(%rsp)          # 8-byte Spill
	movq	%r14, 376(%rsp)         # 8-byte Spill
	movq	(%r14), %r14
	xorl	%edi, %edi
	movq	%rbx, 384(%rsp)         # 8-byte Spill
	movl	%ebx, %esi
	callq	create1DArray
	testq	%r15, %r15
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	%rbp, 32(%rsp)          # 8-byte Spill
	movq	%r15, 72(%rsp)          # 8-byte Spill
	jle	.LBB7_32
# BB#1:                                 # %polly.split_new_and_old412
	movq	%r15, %rcx
	decq	%rcx
	seto	%dl
	movq	%rcx, 320(%rsp)         # 8-byte Spill
	movq	%rcx, %rbx
	imulq	%rbp, %rbx
	seto	%cl
	orb	%dl, %cl
	addq	%rbp, %rbx
	seto	%r9b
	leaq	(%r14,%rbx,8), %rdx
	orb	%cl, %r9b
	cmpq	%rax, %rdx
	setbe	%r10b
	movq	%rbp, %rdx
	decq	%rdx
	seto	%cl
	movq	%rdx, 56(%rsp)          # 8-byte Spill
	imulq	%rbp, %rdx
	seto	%sil
	addq	%r15, %rdx
	movq	%rax, %rdi
	seto	%r8b
	leaq	(%rdi,%rdx,8), %rdx
	cmpq	%r14, %rdx
	setbe	%dl
	cmpq	%r15, %rbp
	jl	.LBB7_33
# BB#2:                                 # %polly.split_new_and_old412
	orb	%r10b, %dl
	je	.LBB7_33
# BB#3:                                 # %polly.split_new_and_old412
	orb	%sil, %cl
	orb	%r8b, %cl
	orb	%r9b, %cl
	xorb	$1, %cl
	testb	$1, %cl
	je	.LBB7_33
# BB#4:                                 # %polly.start414
	sarq	$5, 320(%rsp)           # 8-byte Folded Spill
	js	.LBB7_44
# BB#5:                                 # %polly.loop_header462.preheader
	movb	%r9b, 15(%rsp)          # 1-byte Spill
	movq	%rbx, 272(%rsp)         # 8-byte Spill
	sarq	$5, 56(%rsp)            # 8-byte Folded Spill
	movq	%rbp, %rax
	shrq	$2, %rax
	movl	%ebp, %ecx
	andl	$3, %ecx
	movq	%rbp, %rsi
	andq	$-4, %rsi
	leaq	-1(%rcx), %rdx
	movq	%rdx, 240(%rsp)         # 8-byte Spill
	movl	%ebp, %edx
	andl	$1, %edx
	movq	%rcx, 224(%rsp)         # 8-byte Spill
	movq	%rcx, %r10
	movq	%rdx, 232(%rsp)         # 8-byte Spill
	subq	%rdx, %r10
	leaq	1(%rsi), %rcx
	imulq	%rbp, %rcx
	movq	16(%rsp), %rdx          # 8-byte Reload
	leaq	(%rdx,%rcx,8), %r11
	movq	%rbp, %r12
	shlq	$4, %r12
	movq	%rsi, 176(%rsp)         # 8-byte Spill
	leaq	8(%r14,%rsi,8), %rcx
	movq	%rcx, 120(%rsp)         # 8-byte Spill
	movq	%rbp, %rcx
	shlq	$8, %rcx
	movq	%rcx, 136(%rsp)         # 8-byte Spill
	leaq	(,%rbp,8), %rcx
	movq	%rcx, 96(%rsp)          # 8-byte Spill
	movq	%rbp, %rcx
	imulq	%rax, %rcx
	decq	%rax
	movq	%rax, 128(%rsp)         # 8-byte Spill
	shlq	$5, %rcx
	addq	%rdx, %rcx
	movq	%rcx, 80(%rsp)          # 8-byte Spill
	leaq	(%rbp,%rbp,2), %rax
	leaq	(%rdx,%rax,8), %rax
	movq	%rax, 360(%rsp)         # 8-byte Spill
	movq	%rbp, %r15
	shlq	$5, %r15
	movq	%r14, 48(%rsp)          # 8-byte Spill
	leaq	24(%r14), %rax
	movq	%rax, 352(%rsp)         # 8-byte Spill
	leaq	(%rdx,%r12), %rax
	movq	%rax, 344(%rsp)         # 8-byte Spill
	leaq	(%rdx,%rbp,8), %rax
	movq	%rax, 336(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movq	%rdx, 328(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 104(%rsp)         # 8-byte Spill
	movq	%r10, 296(%rsp)         # 8-byte Spill
	movq	%r11, 288(%rsp)         # 8-byte Spill
	movq	%r12, 280(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB7_6:                                # %polly.loop_header462
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_8 Depth 2
                                        #       Child Loop BB7_22 Depth 3
                                        #         Child Loop BB7_25 Depth 4
                                        #       Child Loop BB7_11 Depth 3
                                        #         Child Loop BB7_12 Depth 4
                                        #         Child Loop BB7_16 Depth 4
	cmpq	$0, 56(%rsp)            # 8-byte Folded Reload
	js	.LBB7_30
# BB#7:                                 # %polly.loop_header472.preheader
                                        #   in Loop: Header=BB7_6 Depth=1
	movq	104(%rsp), %rcx         # 8-byte Reload
	shlq	$5, %rcx
	movq	72(%rsp), %rdx          # 8-byte Reload
	movq	%rcx, %rax
	movq	%rax, 248(%rsp)         # 8-byte Spill
	subq	%rcx, %rdx
	decq	%rdx
	cmpq	$31, %rdx
	movl	$31, %eax
	cmovgq	%rax, %rdx
	movq	%rdx, 200(%rsp)         # 8-byte Spill
	leaq	-1(%rdx), %rax
	movq	%rax, 192(%rsp)         # 8-byte Spill
	movq	328(%rsp), %rax         # 8-byte Reload
	movq	%rax, 160(%rsp)         # 8-byte Spill
	movq	336(%rsp), %rax         # 8-byte Reload
	movq	%rax, 152(%rsp)         # 8-byte Spill
	movq	344(%rsp), %rax         # 8-byte Reload
	movq	%rax, 144(%rsp)         # 8-byte Spill
	movq	352(%rsp), %rax         # 8-byte Reload
	movq	%rax, 216(%rsp)         # 8-byte Spill
	movq	360(%rsp), %rax         # 8-byte Reload
	movq	%rax, 208(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 168(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB7_8:                                # %polly.loop_header472
                                        #   Parent Loop BB7_6 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_22 Depth 3
                                        #         Child Loop BB7_25 Depth 4
                                        #       Child Loop BB7_11 Depth 3
                                        #         Child Loop BB7_12 Depth 4
                                        #         Child Loop BB7_16 Depth 4
	cmpq	$0, 200(%rsp)           # 8-byte Folded Reload
	js	.LBB7_29
# BB#9:                                 # %polly.loop_header481.preheader
                                        #   in Loop: Header=BB7_8 Depth=2
	movq	168(%rsp), %rcx         # 8-byte Reload
	leaq	(,%rcx,8), %rax
	movq	128(%rsp), %rbx         # 8-byte Reload
	subq	%rax, %rbx
	cmpq	$7, %rbx
	movl	$7, %eax
	cmovgq	%rax, %rbx
	movq	%rcx, %rax
	shlq	$5, %rax
	orq	$31, %rax
	testq	%rbx, %rbx
	js	.LBB7_20
# BB#10:                                # %polly.loop_header481.us.preheader
                                        #   in Loop: Header=BB7_8 Depth=2
	decq	%rbx
	cmpq	32(%rsp), %rax          # 8-byte Folded Reload
	setl	%al
	cmpq	$0, 224(%rsp)           # 8-byte Folded Reload
	sete	%cl
	orb	%al, %cl
	movb	%cl, 304(%rsp)          # 1-byte Spill
	movq	120(%rsp), %rax         # 8-byte Reload
	movq	%rax, 264(%rsp)         # 8-byte Spill
	movq	112(%rsp), %rax         # 8-byte Reload
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	160(%rsp), %rsi         # 8-byte Reload
	movq	152(%rsp), %r14         # 8-byte Reload
	movq	144(%rsp), %r8          # 8-byte Reload
	movq	216(%rsp), %r9          # 8-byte Reload
	movq	208(%rsp), %rax         # 8-byte Reload
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB7_11:                               # %polly.loop_header481.us
                                        #   Parent Loop BB7_6 Depth=1
                                        #     Parent Loop BB7_8 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB7_12 Depth 4
                                        #         Child Loop BB7_16 Depth 4
	movq	248(%rsp), %rcx         # 8-byte Reload
	leaq	(%r13,%rcx), %rcx
	movq	%rcx, 256(%rsp)         # 8-byte Spill
	imulq	32(%rsp), %rcx          # 8-byte Folded Reload
	movq	%rcx, 184(%rsp)         # 8-byte Spill
	movq	$-1, %rdi
	movq	%rsi, 40(%rsp)          # 8-byte Spill
	movq	%r14, %rcx
	movq	%r8, %rbp
	movq	%r9, %r12
	movq	%rax, %r11
	.p2align	4, 0x90
.LBB7_12:                               # %polly.loop_header491.us
                                        #   Parent Loop BB7_6 Depth=1
                                        #     Parent Loop BB7_8 Depth=2
                                        #       Parent Loop BB7_11 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	-24(%r12), %r10
	movq	%r10, (%rsi)
	movq	-16(%r12), %rdx
	movq	%rdx, (%rcx)
	movq	-8(%r12), %rdx
	movq	%rdx, (%rbp)
	movq	(%r12), %rdx
	movq	%rdx, (%r11)
	incq	%rdi
	addq	%r15, %r11
	addq	$32, %r12
	addq	%r15, %rbp
	addq	%r15, %rcx
	addq	%r15, %rsi
	cmpq	%rbx, %rdi
	jle	.LBB7_12
# BB#13:                                # %polly.cond508.loopexit.us
                                        #   in Loop: Header=BB7_11 Depth=3
	cmpb	$0, 304(%rsp)           # 1-byte Folded Reload
	movq	296(%rsp), %r10         # 8-byte Reload
	movq	288(%rsp), %r11         # 8-byte Reload
	movq	280(%rsp), %r12         # 8-byte Reload
	jne	.LBB7_19
# BB#14:                                # %polly.loop_header514.us.preheader
                                        #   in Loop: Header=BB7_11 Depth=3
	cmpq	$0, 240(%rsp)           # 8-byte Folded Reload
	movl	$0, %ecx
	movq	80(%rsp), %rbp          # 8-byte Reload
	je	.LBB7_17
# BB#15:                                # %polly.loop_header514.us.preheader.new
                                        #   in Loop: Header=BB7_11 Depth=3
	movq	264(%rsp), %rsi         # 8-byte Reload
	movq	64(%rsp), %rdi          # 8-byte Reload
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB7_16:                               # %polly.loop_header514.us
                                        #   Parent Loop BB7_6 Depth=1
                                        #     Parent Loop BB7_8 Depth=2
                                        #       Parent Loop BB7_11 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	-8(%rsi), %rdx
	movq	%rdx, (%rbp,%rdi)
	movq	(%rsi), %rdx
	movq	%rdx, (%r11,%rdi)
	addq	$2, %rcx
	addq	%r12, %rdi
	addq	$16, %rsi
	cmpq	%rcx, %r10
	jne	.LBB7_16
.LBB7_17:                               # %polly.merge509.us.loopexit.unr-lcssa
                                        #   in Loop: Header=BB7_11 Depth=3
	cmpq	$0, 232(%rsp)           # 8-byte Folded Reload
	je	.LBB7_19
# BB#18:                                # %polly.loop_header514.us.epil
                                        #   in Loop: Header=BB7_11 Depth=3
	addq	176(%rsp), %rcx         # 8-byte Folded Reload
	movq	184(%rsp), %rsi         # 8-byte Reload
	addq	%rcx, %rsi
	movq	48(%rsp), %rdx          # 8-byte Reload
	movq	(%rdx,%rsi,8), %rdx
	imulq	32(%rsp), %rcx          # 8-byte Folded Reload
	addq	256(%rsp), %rcx         # 8-byte Folded Reload
	movq	16(%rsp), %rsi          # 8-byte Reload
	movq	%rdx, (%rsi,%rcx,8)
.LBB7_19:                               # %polly.merge509.us
                                        #   in Loop: Header=BB7_11 Depth=3
	addq	$8, %rax
	movq	96(%rsp), %rcx          # 8-byte Reload
	addq	%rcx, %r9
	addq	$8, %r8
	addq	$8, %r14
	movq	40(%rsp), %rsi          # 8-byte Reload
	addq	$8, %rsi
	addq	$8, 64(%rsp)            # 8-byte Folded Spill
	addq	%rcx, 264(%rsp)         # 8-byte Folded Spill
	cmpq	192(%rsp), %r13         # 8-byte Folded Reload
	leaq	1(%r13), %r13
	jle	.LBB7_11
	jmp	.LBB7_29
	.p2align	4, 0x90
.LBB7_20:                               # %polly.loop_header481.preheader.split
                                        #   in Loop: Header=BB7_8 Depth=2
	cmpq	32(%rsp), %rax          # 8-byte Folded Reload
	jl	.LBB7_29
# BB#21:                                # %polly.loop_header481.preheader750
                                        #   in Loop: Header=BB7_8 Depth=2
	movq	120(%rsp), %r9          # 8-byte Reload
	movq	112(%rsp), %rbp         # 8-byte Reload
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB7_22:                               # %polly.loop_header481
                                        #   Parent Loop BB7_6 Depth=1
                                        #     Parent Loop BB7_8 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB7_25 Depth 4
	cmpq	$0, 224(%rsp)           # 8-byte Folded Reload
	je	.LBB7_28
# BB#23:                                # %polly.loop_header514.preheader
                                        #   in Loop: Header=BB7_22 Depth=3
	cmpq	$0, 240(%rsp)           # 8-byte Folded Reload
	movl	$0, %edi
	movq	80(%rsp), %rax          # 8-byte Reload
	je	.LBB7_26
# BB#24:                                # %polly.loop_header514.preheader.new
                                        #   in Loop: Header=BB7_22 Depth=3
	movq	%r9, %rdx
	movq	%rbp, %rcx
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB7_25:                               # %polly.loop_header514
                                        #   Parent Loop BB7_6 Depth=1
                                        #     Parent Loop BB7_8 Depth=2
                                        #       Parent Loop BB7_22 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	-8(%rdx), %rbx
	movq	%rbx, (%rax,%rcx)
	movq	(%rdx), %rbx
	movq	%rbx, (%r11,%rcx)
	addq	$2, %rdi
	addq	%r12, %rcx
	addq	$16, %rdx
	cmpq	%rdi, %r10
	jne	.LBB7_25
.LBB7_26:                               # %polly.merge509.loopexit.unr-lcssa
                                        #   in Loop: Header=BB7_22 Depth=3
	cmpq	$0, 232(%rsp)           # 8-byte Folded Reload
	je	.LBB7_28
# BB#27:                                # %polly.loop_header514.epil
                                        #   in Loop: Header=BB7_22 Depth=3
	movq	248(%rsp), %rax         # 8-byte Reload
	leaq	(%rsi,%rax), %r8
	movq	%r8, %rdx
	movq	32(%rsp), %rbx          # 8-byte Reload
	imulq	%rbx, %rdx
	addq	176(%rsp), %rdi         # 8-byte Folded Reload
	addq	%rdi, %rdx
	movq	48(%rsp), %rcx          # 8-byte Reload
	movq	(%rcx,%rdx,8), %rdx
	imulq	%rbx, %rdi
	addq	%r8, %rdi
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rdx, (%rcx,%rdi,8)
.LBB7_28:                               # %polly.merge509
                                        #   in Loop: Header=BB7_22 Depth=3
	addq	$8, %rbp
	addq	96(%rsp), %r9           # 8-byte Folded Reload
	cmpq	192(%rsp), %rsi         # 8-byte Folded Reload
	leaq	1(%rsi), %rsi
	jle	.LBB7_22
	.p2align	4, 0x90
.LBB7_29:                               # %polly.loop_exit483
                                        #   in Loop: Header=BB7_8 Depth=2
	movq	136(%rsp), %rax         # 8-byte Reload
	addq	%rax, 208(%rsp)         # 8-byte Folded Spill
	addq	$256, 216(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x100
	addq	%rax, 144(%rsp)         # 8-byte Folded Spill
	addq	%rax, 152(%rsp)         # 8-byte Folded Spill
	addq	%rax, 160(%rsp)         # 8-byte Folded Spill
	movq	168(%rsp), %rax         # 8-byte Reload
	cmpq	56(%rsp), %rax          # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 168(%rsp)         # 8-byte Spill
	jne	.LBB7_8
.LBB7_30:                               # %polly.loop_exit474
                                        #   in Loop: Header=BB7_6 Depth=1
	addq	$256, 112(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x100
	movq	136(%rsp), %rax         # 8-byte Reload
	addq	%rax, 120(%rsp)         # 8-byte Folded Spill
	addq	$256, 360(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x100
	addq	%rax, 352(%rsp)         # 8-byte Folded Spill
	addq	$256, 344(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x100
	addq	$256, 336(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x100
	addq	$256, 328(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x100
	movq	104(%rsp), %rax         # 8-byte Reload
	cmpq	320(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 104(%rsp)         # 8-byte Spill
	jne	.LBB7_6
# BB#31:
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	32(%rsp), %rbp          # 8-byte Reload
	movq	72(%rsp), %r15          # 8-byte Reload
	jmp	.LBB7_43
.LBB7_32:                               # %entry.polly.split_new_and_old_crit_edge
	movq	%r15, %rbx
	decq	%rbx
	seto	%dl
	imulq	%rbp, %rbx
	seto	%cl
	orb	%dl, %cl
	addq	%rbp, %rbx
	seto	%r9b
	orb	%cl, %r9b
	jmp	.LBB7_45
.LBB7_33:                               # %while.cond39.preheader.preheader
	testq	%rbp, %rbp
	jle	.LBB7_44
# BB#34:                                # %while.cond39.preheader.us.preheader
	movq	%r14, 48(%rsp)          # 8-byte Spill
	movb	%r9b, 15(%rsp)          # 1-byte Spill
	movq	%rbx, 272(%rsp)         # 8-byte Spill
	movq	%rbp, %r11
	shlq	$5, %r11
	leaq	(,%rbp,8), %r14
	xorl	%r9d, %r9d
	xorl	%eax, %eax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	xorl	%r10d, %r10d
	movq	16(%rsp), %r13          # 8-byte Reload
	.p2align	4, 0x90
.LBB7_35:                               # %while.cond39.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_37 Depth 2
                                        #     Child Loop BB7_40 Depth 2
	cmpq	$4, %rbp
	movl	%ebp, %r8d
	andl	$3, %r8d
	cmpq	$3, 56(%rsp)            # 8-byte Folded Reload
	movl	$0, %ebx
	jb	.LBB7_38
# BB#36:                                # %if.end44.us.preheader.new
                                        #   in Loop: Header=BB7_35 Depth=1
	movq	32(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rcx,2), %rax
	leaq	(%r13,%rax,8), %r15
	movq	48(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%r9,8), %rdx
	movq	%rcx, %rdi
	shlq	$4, %rdi
	addq	%r13, %rdi
	leaq	(%r13,%rcx,8), %r12
	subq	%r8, %rcx
	movq	40(%rsp), %rsi          # 8-byte Reload
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB7_37:                               # %if.end44.us
                                        #   Parent Loop BB7_35 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rdx), %rax
	movq	%rax, (%r13,%rsi)
	movq	8(%rdx), %rax
	movq	%rax, (%r12,%rsi)
	movq	16(%rdx), %rax
	movq	%rax, (%rdi,%rsi)
	movq	24(%rdx), %rax
	movq	%rax, (%r15,%rsi)
	addq	$4, %rbx
	addq	%r11, %rsi
	addq	$32, %rdx
	cmpq	%rbx, %rcx
	jne	.LBB7_37
.LBB7_38:                               # %blklab15.loopexit.us.loopexit.unr-lcssa
                                        #   in Loop: Header=BB7_35 Depth=1
	testq	%r8, %r8
	movq	32(%rsp), %rbp          # 8-byte Reload
	je	.LBB7_41
# BB#39:                                # %if.end44.us.epil.preheader
                                        #   in Loop: Header=BB7_35 Depth=1
	movq	%rbp, %rax
	imulq	%rbx, %rax
	addq	%r10, %rax
	movq	16(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rax,8), %rax
	addq	%r9, %rbx
	movq	48(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rbx,8), %rcx
	negq	%r8
	.p2align	4, 0x90
.LBB7_40:                               # %if.end44.us.epil
                                        #   Parent Loop BB7_35 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	%r14, %rax
	addq	$8, %rcx
	incq	%r8
	jne	.LBB7_40
.LBB7_41:                               # %blklab15.loopexit.us
                                        #   in Loop: Header=BB7_35 Depth=1
	incq	%r10
	addq	$8, 40(%rsp)            # 8-byte Folded Spill
	addq	%rbp, %r9
	movq	72(%rsp), %r15          # 8-byte Reload
	cmpq	%r15, %r10
	jne	.LBB7_35
# BB#42:
	movq	16(%rsp), %rax          # 8-byte Reload
.LBB7_43:                               # %polly.split_new_and_old
	movq	24(%rsp), %rsi          # 8-byte Reload
	movq	272(%rsp), %rbx         # 8-byte Reload
	movb	15(%rsp), %r9b          # 1-byte Reload
	jmp	.LBB7_46
.LBB7_44:
	movq	16(%rsp), %rax          # 8-byte Reload
.LBB7_45:                               # %polly.split_new_and_old
	movq	24(%rsp), %rsi          # 8-byte Reload
.LBB7_46:                               # %polly.split_new_and_old
	leaq	(%rax,%rbx,8), %rcx
	cmpq	%rsi, %rcx
	setbe	%dil
	leaq	(%rsi,%rbx,8), %rcx
	cmpq	%rax, %rcx
	setbe	%dl
	orb	%dil, %dl
	movq	88(%rsp), %rdi          # 8-byte Reload
	leaq	(%rdi,%rbx,8), %rax
	cmpq	%rsi, %rax
	setbe	%al
	cmpq	%rdi, %rcx
	setbe	%cl
	cmpb	$1, %dl
	jne	.LBB7_87
# BB#47:                                # %polly.split_new_and_old
	orb	%cl, %al
	je	.LBB7_87
# BB#48:                                # %polly.split_new_and_old
	xorb	$1, %r9b
	je	.LBB7_87
# BB#49:                                # %polly.start
	leaq	-1(%r15), %rax
	sarq	$5, %rax
	movq	%rax, 120(%rsp)         # 8-byte Spill
	js	.LBB7_99
# BB#50:                                # %polly.loop_header.preheader
	leaq	-1(%rbp), %rax
	movq	%rax, %rcx
	sarq	$5, %rcx
	movq	%rcx, 56(%rsp)          # 8-byte Spill
	shrq	$5, %rax
	movq	%rax, 168(%rsp)         # 8-byte Spill
	movq	%rbp, %rax
	shrq	$2, %rax
	decq	%rax
	movq	%rax, 216(%rsp)         # 8-byte Spill
	movl	%ebp, %edx
	andl	$3, %edx
	movq	%rbp, %rsi
	andq	$-4, %rsi
	leaq	-1(%rdx), %rax
	movq	%rax, 192(%rsp)         # 8-byte Spill
	movq	16(%rsp), %rcx          # 8-byte Reload
	leaq	24(%rcx,%rsi,8), %rax
	movq	%rax, 152(%rsp)         # 8-byte Spill
	movq	%rbp, %rax
	shlq	$8, %rax
	movq	%rax, 112(%rsp)         # 8-byte Spill
	leaq	(,%rbp,8), %rax
	movq	%rax, 296(%rsp)         # 8-byte Spill
	movq	88(%rsp), %rax          # 8-byte Reload
	movq	%rsi, 160(%rsp)         # 8-byte Spill
	leaq	24(%rax,%rsi,8), %rsi
	movq	%rsi, 144(%rsp)         # 8-byte Spill
	movq	%rbp, %rsi
	shlq	$5, %rsi
	movq	%rsi, 104(%rsp)         # 8-byte Spill
	movq	%rdx, 64(%rsp)          # 8-byte Spill
	negq	%rdx
	movq	%rdx, 256(%rsp)         # 8-byte Spill
	leaq	24(%rcx), %rcx
	movq	%rcx, 136(%rsp)         # 8-byte Spill
	leaq	24(%rax), %rax
	movq	%rax, 200(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 128(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB7_51:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_53 Depth 2
                                        #       Child Loop BB7_54 Depth 3
                                        #         Child Loop BB7_56 Depth 4
                                        #           Child Loop BB7_73 Depth 5
                                        #             Child Loop BB7_77 Depth 6
                                        #             Child Loop BB7_80 Depth 6
                                        #           Child Loop BB7_59 Depth 5
                                        #             Child Loop BB7_60 Depth 6
                                        #             Child Loop BB7_65 Depth 6
                                        #             Child Loop BB7_68 Depth 6
	cmpq	$0, 56(%rsp)            # 8-byte Folded Reload
	movq	24(%rsp), %rbx          # 8-byte Reload
	js	.LBB7_86
# BB#52:                                # %polly.loop_header339.preheader
                                        #   in Loop: Header=BB7_51 Depth=1
	movq	128(%rsp), %rcx         # 8-byte Reload
	shlq	$5, %rcx
	movq	72(%rsp), %rdx          # 8-byte Reload
	movq	%rcx, %rax
	movq	%rax, 240(%rsp)         # 8-byte Spill
	subq	%rcx, %rdx
	decq	%rdx
	cmpq	$31, %rdx
	movl	$31, %eax
	cmovgq	%rax, %rdx
	movq	%rdx, 224(%rsp)         # 8-byte Spill
	leaq	-1(%rdx), %rax
	movq	%rax, 304(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB7_53:                               # %polly.loop_header339
                                        #   Parent Loop BB7_51 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_54 Depth 3
                                        #         Child Loop BB7_56 Depth 4
                                        #           Child Loop BB7_73 Depth 5
                                        #             Child Loop BB7_77 Depth 6
                                        #             Child Loop BB7_80 Depth 6
                                        #           Child Loop BB7_59 Depth 5
                                        #             Child Loop BB7_60 Depth 6
                                        #             Child Loop BB7_65 Depth 6
                                        #             Child Loop BB7_68 Depth 6
	movq	%rax, 208(%rsp)         # 8-byte Spill
	movq	%rax, %rcx
	shlq	$5, %rcx
	movq	%rbp, %rax
	movq	%rcx, 280(%rsp)         # 8-byte Spill
	subq	%rcx, %rax
	decq	%rax
	cmpq	$31, %rax
	movl	$31, %ecx
	cmovleq	%rax, %rcx
	movq	%rcx, 248(%rsp)         # 8-byte Spill
	leaq	-1(%rcx), %rax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movq	200(%rsp), %rax         # 8-byte Reload
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	136(%rsp), %rax         # 8-byte Reload
	movq	%rax, 176(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB7_54:                               # %polly.loop_header347
                                        #   Parent Loop BB7_51 Depth=1
                                        #     Parent Loop BB7_53 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB7_56 Depth 4
                                        #           Child Loop BB7_73 Depth 5
                                        #             Child Loop BB7_77 Depth 6
                                        #             Child Loop BB7_80 Depth 6
                                        #           Child Loop BB7_59 Depth 5
                                        #             Child Loop BB7_60 Depth 6
                                        #             Child Loop BB7_65 Depth 6
                                        #             Child Loop BB7_68 Depth 6
	cmpq	$0, 224(%rsp)           # 8-byte Folded Reload
	js	.LBB7_84
# BB#55:                                # %polly.loop_header355.preheader
                                        #   in Loop: Header=BB7_54 Depth=3
	cmpq	$0, 64(%rsp)            # 8-byte Folded Reload
	sete	%al
	movq	80(%rsp), %rdx          # 8-byte Reload
	leaq	(,%rdx,8), %rcx
	movq	216(%rsp), %rsi         # 8-byte Reload
	subq	%rcx, %rsi
	cmpq	$7, %rsi
	movl	$7, %ecx
	cmovgq	%rcx, %rsi
	shlq	$5, %rdx
	orq	$31, %rdx
	movq	%rdx, 232(%rsp)         # 8-byte Spill
	cmpq	%rbp, %rdx
	setl	%cl
	movq	%rsi, 288(%rsp)         # 8-byte Spill
	leaq	-1(%rsi), %r15
	orb	%al, %cl
	movb	%cl, 264(%rsp)          # 1-byte Spill
	movq	48(%rsp), %r9           # 8-byte Reload
	movq	176(%rsp), %r12         # 8-byte Reload
	movq	160(%rsp), %rax         # 8-byte Reload
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movq	144(%rsp), %r10         # 8-byte Reload
	movq	152(%rsp), %r14         # 8-byte Reload
	xorl	%eax, %eax
	movq	%rax, 184(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB7_56:                               # %polly.loop_header355
                                        #   Parent Loop BB7_51 Depth=1
                                        #     Parent Loop BB7_53 Depth=2
                                        #       Parent Loop BB7_54 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB7_73 Depth 5
                                        #             Child Loop BB7_77 Depth 6
                                        #             Child Loop BB7_80 Depth 6
                                        #           Child Loop BB7_59 Depth 5
                                        #             Child Loop BB7_60 Depth 6
                                        #             Child Loop BB7_65 Depth 6
                                        #             Child Loop BB7_68 Depth 6
	cmpq	$0, 248(%rsp)           # 8-byte Folded Reload
	js	.LBB7_83
# BB#57:                                # %polly.loop_header364.preheader
                                        #   in Loop: Header=BB7_56 Depth=4
	movq	240(%rsp), %rax         # 8-byte Reload
	movq	184(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax), %r8
	movq	32(%rsp), %rax          # 8-byte Reload
	imulq	%rax, %r8
	addq	280(%rsp), %r8          # 8-byte Folded Reload
	cmpq	$0, 288(%rsp)           # 8-byte Folded Reload
	js	.LBB7_71
# BB#58:                                # %polly.loop_header364.us.preheader
                                        #   in Loop: Header=BB7_56 Depth=4
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB7_59:                               # %polly.loop_header364.us
                                        #   Parent Loop BB7_51 Depth=1
                                        #     Parent Loop BB7_53 Depth=2
                                        #       Parent Loop BB7_54 Depth=3
                                        #         Parent Loop BB7_56 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB7_60 Depth 6
                                        #             Child Loop BB7_65 Depth 6
                                        #             Child Loop BB7_68 Depth 6
	leaq	(%r8,%rax), %r13
	movq	(%rbx,%r13,8), %rdx
	movq	$-1, %rcx
	movq	%r9, %rsi
	movq	%r12, %rdi
	.p2align	4, 0x90
.LBB7_60:                               # %polly.loop_header374.us
                                        #   Parent Loop BB7_51 Depth=1
                                        #     Parent Loop BB7_53 Depth=2
                                        #       Parent Loop BB7_54 Depth=3
                                        #         Parent Loop BB7_56 Depth=4
                                        #           Parent Loop BB7_59 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	-24(%rdi), %rbp
	movq	-16(%rdi), %r11
	imulq	-24(%rsi), %rbp
	addq	%rdx, %rbp
	imulq	-16(%rsi), %r11
	addq	%rbp, %r11
	movq	-8(%rdi), %rbp
	imulq	-8(%rsi), %rbp
	addq	%r11, %rbp
	movq	(%rdi), %rdx
	imulq	(%rsi), %rdx
	addq	%rbp, %rdx
	incq	%rcx
	addq	$32, %rdi
	addq	$32, %rsi
	cmpq	%r15, %rcx
	jle	.LBB7_60
# BB#61:                                # %polly.cond.loopexit.us
                                        #   in Loop: Header=BB7_59 Depth=5
	movq	24(%rsp), %rbx          # 8-byte Reload
	movq	%rdx, (%rbx,%r13,8)
	cmpb	$0, 264(%rsp)           # 1-byte Folded Reload
	jne	.LBB7_70
# BB#62:                                # %polly.loop_header393.us.preheader
                                        #   in Loop: Header=BB7_59 Depth=5
	cmpq	$3, 192(%rsp)           # 8-byte Folded Reload
	jae	.LBB7_64
# BB#63:                                #   in Loop: Header=BB7_59 Depth=5
	xorl	%edi, %edi
	jmp	.LBB7_66
	.p2align	4, 0x90
.LBB7_64:                               # %polly.loop_header393.us.preheader.new
                                        #   in Loop: Header=BB7_59 Depth=5
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB7_65:                               # %polly.loop_header393.us
                                        #   Parent Loop BB7_51 Depth=1
                                        #     Parent Loop BB7_53 Depth=2
                                        #       Parent Loop BB7_54 Depth=3
                                        #         Parent Loop BB7_56 Depth=4
                                        #           Parent Loop BB7_59 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	-24(%r14,%rdi,8), %rcx
	imulq	-24(%r10,%rdi,8), %rcx
	addq	%rdx, %rcx
	movq	-16(%r14,%rdi,8), %rdx
	imulq	-16(%r10,%rdi,8), %rdx
	addq	%rcx, %rdx
	movq	-8(%r14,%rdi,8), %rcx
	imulq	-8(%r10,%rdi,8), %rcx
	addq	%rdx, %rcx
	movq	(%r14,%rdi,8), %rdx
	imulq	(%r10,%rdi,8), %rdx
	addq	%rcx, %rdx
	addq	$4, %rdi
	jne	.LBB7_65
.LBB7_66:                               # %polly.merge.loopexit.us.unr-lcssa
                                        #   in Loop: Header=BB7_59 Depth=5
	cmpq	$0, 64(%rsp)            # 8-byte Folded Reload
	je	.LBB7_69
# BB#67:                                # %polly.loop_header393.us.epil.preheader
                                        #   in Loop: Header=BB7_59 Depth=5
	addq	96(%rsp), %rdi          # 8-byte Folded Reload
	movq	16(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rdi,8), %rcx
	movq	88(%rsp), %rsi          # 8-byte Reload
	leaq	(%rsi,%rdi,8), %rsi
	movq	256(%rsp), %rdi         # 8-byte Reload
	.p2align	4, 0x90
.LBB7_68:                               # %polly.loop_header393.us.epil
                                        #   Parent Loop BB7_51 Depth=1
                                        #     Parent Loop BB7_53 Depth=2
                                        #       Parent Loop BB7_54 Depth=3
                                        #         Parent Loop BB7_56 Depth=4
                                        #           Parent Loop BB7_59 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	(%rcx), %rbp
	imulq	(%rsi), %rbp
	addq	%rbp, %rdx
	addq	$8, %rcx
	addq	$8, %rsi
	incq	%rdi
	jne	.LBB7_68
.LBB7_69:                               # %polly.merge.loopexit.us
                                        #   in Loop: Header=BB7_59 Depth=5
	movq	%rdx, (%rbx,%r13,8)
.LBB7_70:                               # %polly.merge.us
                                        #   in Loop: Header=BB7_59 Depth=5
	cmpq	40(%rsp), %rax          # 8-byte Folded Reload
	leaq	1(%rax), %rax
	jle	.LBB7_59
	jmp	.LBB7_83
	.p2align	4, 0x90
.LBB7_71:                               # %polly.loop_header364.preheader.split
                                        #   in Loop: Header=BB7_56 Depth=4
	cmpq	%rax, 232(%rsp)         # 8-byte Folded Reload
	jl	.LBB7_83
# BB#72:                                # %polly.loop_header364.preheader747
                                        #   in Loop: Header=BB7_56 Depth=4
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB7_73:                               # %polly.loop_header364
                                        #   Parent Loop BB7_51 Depth=1
                                        #     Parent Loop BB7_53 Depth=2
                                        #       Parent Loop BB7_54 Depth=3
                                        #         Parent Loop BB7_56 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB7_77 Depth 6
                                        #             Child Loop BB7_80 Depth 6
	cmpq	$0, 64(%rsp)            # 8-byte Folded Reload
	je	.LBB7_82
# BB#74:                                # %polly.loop_header393.preheader
                                        #   in Loop: Header=BB7_73 Depth=5
	leaq	(%r8,%rax), %r11
	cmpq	$3, 192(%rsp)           # 8-byte Folded Reload
	movq	(%rbx,%r11,8), %rbp
	jae	.LBB7_76
# BB#75:                                #   in Loop: Header=BB7_73 Depth=5
	xorl	%edi, %edi
	jmp	.LBB7_78
	.p2align	4, 0x90
.LBB7_76:                               # %polly.loop_header393.preheader.new
                                        #   in Loop: Header=BB7_73 Depth=5
	movq	%r10, %rcx
	movq	%r14, %rsi
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB7_77:                               # %polly.loop_header393
                                        #   Parent Loop BB7_51 Depth=1
                                        #     Parent Loop BB7_53 Depth=2
                                        #       Parent Loop BB7_54 Depth=3
                                        #         Parent Loop BB7_56 Depth=4
                                        #           Parent Loop BB7_73 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	-24(%rsi), %rdx
	movq	-16(%rsi), %rbx
	imulq	-24(%rcx), %rdx
	addq	%rbp, %rdx
	imulq	-16(%rcx), %rbx
	addq	%rdx, %rbx
	movq	-8(%rsi), %rdx
	imulq	-8(%rcx), %rdx
	addq	%rbx, %rdx
	movq	(%rsi), %rbp
	imulq	(%rcx), %rbp
	addq	%rdx, %rbp
	addq	$32, %rsi
	addq	$32, %rcx
	addq	$4, %rdi
	jne	.LBB7_77
.LBB7_78:                               # %polly.merge.loopexit.unr-lcssa
                                        #   in Loop: Header=BB7_73 Depth=5
	cmpq	$0, 64(%rsp)            # 8-byte Folded Reload
	movq	16(%rsp), %rbx          # 8-byte Reload
	je	.LBB7_81
# BB#79:                                # %polly.loop_header393.epil.preheader
                                        #   in Loop: Header=BB7_73 Depth=5
	addq	96(%rsp), %rdi          # 8-byte Folded Reload
	leaq	(%rbx,%rdi,8), %rcx
	movq	88(%rsp), %rdx          # 8-byte Reload
	leaq	(%rdx,%rdi,8), %rsi
	movq	256(%rsp), %rdi         # 8-byte Reload
	.p2align	4, 0x90
.LBB7_80:                               # %polly.loop_header393.epil
                                        #   Parent Loop BB7_51 Depth=1
                                        #     Parent Loop BB7_53 Depth=2
                                        #       Parent Loop BB7_54 Depth=3
                                        #         Parent Loop BB7_56 Depth=4
                                        #           Parent Loop BB7_73 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	(%rcx), %rdx
	imulq	(%rsi), %rdx
	addq	%rdx, %rbp
	addq	$8, %rcx
	addq	$8, %rsi
	incq	%rdi
	jne	.LBB7_80
.LBB7_81:                               # %polly.merge.loopexit
                                        #   in Loop: Header=BB7_73 Depth=5
	movq	24(%rsp), %rcx          # 8-byte Reload
	movq	%rbp, (%rcx,%r11,8)
	movq	%rcx, %rbx
.LBB7_82:                               # %polly.merge
                                        #   in Loop: Header=BB7_73 Depth=5
	cmpq	40(%rsp), %rax          # 8-byte Folded Reload
	leaq	1(%rax), %rax
	jle	.LBB7_73
	.p2align	4, 0x90
.LBB7_83:                               # %polly.loop_exit366
                                        #   in Loop: Header=BB7_56 Depth=4
	movq	296(%rsp), %rax         # 8-byte Reload
	addq	%rax, %r14
	addq	%rax, %r10
	movq	32(%rsp), %rbp          # 8-byte Reload
	addq	%rbp, 96(%rsp)          # 8-byte Folded Spill
	addq	%rax, %r12
	addq	%rax, %r9
	movq	184(%rsp), %rax         # 8-byte Reload
	cmpq	304(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 184(%rsp)         # 8-byte Spill
	jle	.LBB7_56
.LBB7_84:                               # %polly.loop_exit357
                                        #   in Loop: Header=BB7_54 Depth=3
	addq	$256, 176(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x100
	addq	$256, 48(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	movq	80(%rsp), %rax          # 8-byte Reload
	cmpq	168(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	jne	.LBB7_54
# BB#85:                                # %polly.loop_exit349
                                        #   in Loop: Header=BB7_53 Depth=2
	movq	208(%rsp), %rax         # 8-byte Reload
	cmpq	56(%rsp), %rax          # 8-byte Folded Reload
	leaq	1(%rax), %rax
	jne	.LBB7_53
.LBB7_86:                               # %polly.loop_exit341
                                        #   in Loop: Header=BB7_51 Depth=1
	movq	112(%rsp), %rax         # 8-byte Reload
	addq	%rax, 152(%rsp)         # 8-byte Folded Spill
	addq	%rax, 144(%rsp)         # 8-byte Folded Spill
	movq	104(%rsp), %rcx         # 8-byte Reload
	addq	%rcx, 160(%rsp)         # 8-byte Folded Spill
	addq	%rax, 136(%rsp)         # 8-byte Folded Spill
	addq	%rax, 200(%rsp)         # 8-byte Folded Spill
	movq	128(%rsp), %rax         # 8-byte Reload
	cmpq	120(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 128(%rsp)         # 8-byte Spill
	jne	.LBB7_51
	jmp	.LBB7_99
.LBB7_87:                               # %while.cond51.preheader
	testq	%r15, %r15
	jle	.LBB7_99
# BB#88:                                # %while.cond51.preheader
	testq	%rbp, %rbp
	jle	.LBB7_99
# BB#89:                                # %while.cond57.preheader.us.preheader
	movl	%ebp, %r14d
	andl	$1, %r14d
	movq	%rbp, %r13
	subq	%r14, %r13
	movq	16(%rsp), %r10          # 8-byte Reload
	addq	$8, %r10
	leaq	(,%rbp,8), %rax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movq	88(%rsp), %rax          # 8-byte Reload
	leaq	8(%rax), %r11
	xorl	%r9d, %r9d
	movq	24(%rsp), %r8           # 8-byte Reload
	.p2align	4, 0x90
.LBB7_90:                               # %while.cond57.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_91 Depth 2
                                        #       Child Loop BB7_94 Depth 3
	movq	%r9, %r15
	imulq	%rbp, %r15
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB7_91:                               # %while.cond63.preheader.us.us
                                        #   Parent Loop BB7_90 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_94 Depth 3
	leaq	(%r12,%r15), %rbx
	cmpq	$1, %rbp
	movq	24(%rsp), %rax          # 8-byte Reload
	movq	(%rax,%rbx,8), %rdx
	jne	.LBB7_93
# BB#92:                                #   in Loop: Header=BB7_91 Depth=2
	xorl	%edi, %edi
	jmp	.LBB7_95
	.p2align	4, 0x90
.LBB7_93:                               # %while.cond63.preheader.us.us.new
                                        #   in Loop: Header=BB7_91 Depth=2
	movq	%r11, %rax
	movq	%r10, %rcx
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB7_94:                               # %if.end68.us.us
                                        #   Parent Loop BB7_90 Depth=1
                                        #     Parent Loop BB7_91 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-8(%rcx), %rsi
	imulq	-8(%rax), %rsi
	addq	%rdx, %rsi
	movq	%rsi, (%r8,%rbx,8)
	movq	(%rcx), %rdx
	imulq	(%rax), %rdx
	addq	%rsi, %rdx
	movq	%rdx, (%r8,%rbx,8)
	addq	$2, %rdi
	addq	$16, %rcx
	addq	$16, %rax
	cmpq	%rdi, %r13
	jne	.LBB7_94
.LBB7_95:                               # %blklab21.loopexit.us.us.unr-lcssa
                                        #   in Loop: Header=BB7_91 Depth=2
	testq	%r14, %r14
	je	.LBB7_97
# BB#96:                                # %if.end68.us.us.epil
                                        #   in Loop: Header=BB7_91 Depth=2
	addq	%r15, %rdi
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	(%rax,%rdi,8), %rax
	movq	88(%rsp), %rcx          # 8-byte Reload
	imulq	(%rcx,%rdi,8), %rax
	addq	%rdx, %rax
	movq	24(%rsp), %rcx          # 8-byte Reload
	movq	%rax, (%rcx,%rbx,8)
.LBB7_97:                               # %blklab21.loopexit.us.us
                                        #   in Loop: Header=BB7_91 Depth=2
	incq	%r12
	cmpq	%rbp, %r12
	jne	.LBB7_91
# BB#98:                                # %blklab19.loopexit.us-lcssa.us.us
                                        #   in Loop: Header=BB7_90 Depth=1
	incq	%r9
	movq	40(%rsp), %rax          # 8-byte Reload
	addq	%rax, %r10
	addq	%rax, %r11
	cmpq	72(%rsp), %r9           # 8-byte Folded Reload
	jne	.LBB7_90
.LBB7_99:                               # %if.end88
	movl	$32, %edi
	callq	malloc
	movq	%rax, %r12
	movq	384(%rsp), %rax         # 8-byte Reload
	movq	%rax, 8(%r12)
	movq	24(%rsp), %rax          # 8-byte Reload
	movq	%rax, (%r12)
	movq	72(%rsp), %rax          # 8-byte Reload
	movq	%rax, 24(%r12)
	movq	%rbp, 16(%r12)
	movl	312(%rsp), %eax         # 4-byte Reload
	testb	%al, %al
	je	.LBB7_101
# BB#100:                               # %if.then92
	movq	368(%rsp), %rbp         # 8-byte Reload
	movq	(%rbp), %rdi
	callq	free
	movq	%rbp, %rdi
	callq	free
.LBB7_101:                              # %if.end93
	movl	316(%rsp), %eax         # 4-byte Reload
	testb	%al, %al
	movq	16(%rsp), %rbx          # 8-byte Reload
	je	.LBB7_103
# BB#102:                               # %if.then95
	movq	376(%rsp), %rbx         # 8-byte Reload
	movq	(%rbx), %rdi
	callq	free
	movq	%rbx, %rdi
	movq	16(%rsp), %rbx          # 8-byte Reload
	callq	free
.LBB7_103:                              # %if.then110
	movq	%rbx, %rdi
	callq	free
	movq	%r12, %rax
	addq	$392, %rsp              # imm = 0x188
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
# BB#2:                                 # %blklab24
	movq	(%rbx), %rcx
	cmpq	%rdx, -8(%rcx,%r15,8)
	jne	.LBB8_7
# BB#3:                                 # %blklab25
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
