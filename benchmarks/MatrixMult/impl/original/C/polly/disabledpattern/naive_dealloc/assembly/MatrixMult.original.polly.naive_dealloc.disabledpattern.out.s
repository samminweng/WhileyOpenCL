	.text
	.file	"llvm/MatrixMult.original.polly.naive_dealloc.disabledpattern.out.ll"
	.globl	copy_Matrix
	.p2align	4, 0x90
	.type	copy_Matrix,@function
copy_Matrix:                            # @copy_Matrix
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Lcfi0:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Lcfi1:
	.cfi_def_cfa_offset 24
	pushq	%rax
.Lcfi2:
	.cfi_def_cfa_offset 32
.Lcfi3:
	.cfi_offset %rbx, -24
.Lcfi4:
	.cfi_offset %r14, -16
	movq	%rdi, %r14
	movl	$32, %edi
	callq	malloc
	movq	%rax, %rbx
	movq	8(%r14), %rsi
	movq	%rsi, 8(%rbx)
	movq	(%r14), %rdi
	callq	copy1DArray_int64_t
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
.Lcfi5:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi6:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi7:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi8:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi9:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi10:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Lcfi11:
	.cfi_def_cfa_offset 64
.Lcfi12:
	.cfi_offset %rbx, -56
.Lcfi13:
	.cfi_offset %r12, -48
.Lcfi14:
	.cfi_offset %r13, -40
.Lcfi15:
	.cfi_offset %r14, -32
.Lcfi16:
	.cfi_offset %r15, -24
.Lcfi17:
	.cfi_offset %rbp, -16
	movq	%rsi, %r14
	movq	%rdi, %r12
	leaq	(,%r14,8), %rdi
	callq	malloc
	movq	%rax, %r15
	testq	%r14, %r14
	je	.LBB1_3
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
	callq	copy1DArray_int64_t
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
.Lcfi18:
	.cfi_def_cfa_offset 16
.Lcfi19:
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
.Lcfi20:
	.cfi_def_cfa_offset 16
.Lcfi21:
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movl	$123, %edi
	callq	putchar
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movq	(%rbx), %rdi
	movq	8(%rbx), %rsi
	callq	printf1DArray_int64_t
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

	.globl	_matrix_
	.p2align	4, 0x90
	.type	_matrix_,@function
_matrix_:                               # @_matrix_
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Lcfi22:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi23:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi24:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi25:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi26:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi27:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Lcfi28:
	.cfi_def_cfa_offset 64
.Lcfi29:
	.cfi_offset %rbx, -56
.Lcfi30:
	.cfi_offset %r12, -48
.Lcfi31:
	.cfi_offset %r13, -40
.Lcfi32:
	.cfi_offset %r14, -32
.Lcfi33:
	.cfi_offset %r15, -24
.Lcfi34:
	.cfi_offset %rbp, -16
	movl	%r8d, %r15d
	movq	%rcx, %rbp
	movq	%rdx, %r14
	movq	%rsi, %r12
	movq	%rdi, %r13
	movl	$32, %edi
	callq	malloc
	movq	%rax, %rbx
	movq	%rbp, 8(%rbx)
	movq	%r14, %rdi
	movq	%rbp, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, (%rbx)
	movq	%r12, 24(%rbx)
	movq	%r13, 16(%rbx)
	testb	%r15b, %r15b
	je	.LBB4_2
# BB#1:                                 # %if.then9
	movq	%r14, %rdi
	callq	free
.LBB4_2:                                # %if.end13
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end4:
	.size	_matrix_, .Lfunc_end4-_matrix_
	.cfi_endproc

	.globl	_init_
	.p2align	4, 0x90
	.type	_init_,@function
_init_:                                 # @_init_
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Lcfi35:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi36:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi37:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi38:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi39:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi40:
	.cfi_def_cfa_offset 56
	subq	$104, %rsp
.Lcfi41:
	.cfi_def_cfa_offset 160
.Lcfi42:
	.cfi_offset %rbx, -56
.Lcfi43:
	.cfi_offset %r12, -48
.Lcfi44:
	.cfi_offset %r13, -40
.Lcfi45:
	.cfi_offset %r14, -32
.Lcfi46:
	.cfi_offset %r15, -24
.Lcfi47:
	.cfi_offset %rbp, -16
	movq	%rsi, %rbx
	movq	%rbx, %rbp
	movq	%rdi, (%rsp)            # 8-byte Spill
	imulq	%rdi, %rbp
	xorl	%edi, %edi
	movq	%rbp, %rsi
	callq	create1DArray_int64_t
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	%rax, %rdi
	movq	%rbp, 56(%rsp)          # 8-byte Spill
	movq	%rbp, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	%rbx, 8(%rsp)           # 8-byte Spill
	testq	%rbx, %rbx
	jle	.LBB5_1
# BB#6:                                 # %polly.start
	movq	8(%rsp), %rax           # 8-byte Reload
	decq	%rax
	sarq	$5, %rax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	js	.LBB5_1
# BB#7:                                 # %polly.loop_header.preheader
	movq	(%rsp), %rcx            # 8-byte Reload
	leaq	-1(%rcx), %rax
	sarq	$5, %rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	%rcx, %rax
	shrq	$2, %rax
	decq	%rax
	movq	%rax, 88(%rsp)          # 8-byte Spill
	movl	%ecx, %r15d
	andl	$3, %r15d
	movabsq	$2305843009213693948, %rax # imm = 0x1FFFFFFFFFFFFFFC
	andq	%rcx, %rax
	movq	32(%rsp), %rdx          # 8-byte Reload
	leaq	(%rdx,%rax,8), %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	%rcx, %rax
	shlq	$8, %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	leaq	(,%rcx,8), %rax
	leaq	16(%rdx), %rcx
	movq	%rcx, 40(%rsp)          # 8-byte Spill
	xorl	%ecx, %ecx
	movq	%rcx, 16(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB5_8:                                # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_10 Depth 2
                                        #       Child Loop BB5_22 Depth 3
                                        #         Child Loop BB5_25 Depth 4
                                        #       Child Loop BB5_13 Depth 3
                                        #         Child Loop BB5_14 Depth 4
                                        #         Child Loop BB5_16 Depth 4
	cmpq	$0, 48(%rsp)            # 8-byte Folded Reload
	js	.LBB5_19
# BB#9:                                 # %polly.loop_header103.preheader
                                        #   in Loop: Header=BB5_8 Depth=1
	movq	16(%rsp), %rbp          # 8-byte Reload
	shlq	$5, %rbp
	movq	8(%rsp), %rdx           # 8-byte Reload
	subq	%rbp, %rdx
	decq	%rdx
	cmpq	$32, %rdx
	movl	$31, %ecx
	cmovgeq	%rcx, %rdx
	movq	%rdx, 96(%rsp)          # 8-byte Spill
	leaq	-1(%rdx), %r11
	movq	40(%rsp), %r13          # 8-byte Reload
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB5_10:                               # %polly.loop_header103
                                        #   Parent Loop BB5_8 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_22 Depth 3
                                        #         Child Loop BB5_25 Depth 4
                                        #       Child Loop BB5_13 Depth 3
                                        #         Child Loop BB5_14 Depth 4
                                        #         Child Loop BB5_16 Depth 4
	cmpq	$0, 96(%rsp)            # 8-byte Folded Reload
	js	.LBB5_18
# BB#11:                                # %polly.loop_header112.preheader
                                        #   in Loop: Header=BB5_10 Depth=2
	leaq	(,%r8,8), %rcx
	movq	88(%rsp), %rdx          # 8-byte Reload
	subq	%rcx, %rdx
	cmpq	$8, %rdx
	movl	$7, %ecx
	cmovgeq	%rcx, %rdx
	movq	%r8, %rcx
	shlq	$5, %rcx
	orq	$31, %rcx
	testq	%rdx, %rdx
	js	.LBB5_20
# BB#12:                                # %polly.loop_header112.us.preheader
                                        #   in Loop: Header=BB5_10 Depth=2
	decq	%rdx
	cmpq	(%rsp), %rcx            # 8-byte Folded Reload
	setl	%cl
	testq	%r15, %r15
	sete	%r14b
	orb	%cl, %r14b
	movq	24(%rsp), %r10          # 8-byte Reload
	movq	%r13, %rcx
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB5_13:                               # %polly.loop_header112.us
                                        #   Parent Loop BB5_8 Depth=1
                                        #     Parent Loop BB5_10 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_14 Depth 4
                                        #         Child Loop BB5_16 Depth 4
	leaq	(%rbx,%rbp), %r9
	movd	%r9, %xmm0
	pshufd	$68, %xmm0, %xmm0       # xmm0 = xmm0[0,1,0,1]
	movq	$-1, %rdi
	movq	%rcx, %r12
	.p2align	4, 0x90
.LBB5_14:                               # %polly.loop_header121.us
                                        #   Parent Loop BB5_8 Depth=1
                                        #     Parent Loop BB5_10 Depth=2
                                        #       Parent Loop BB5_13 Depth=3
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
	jle	.LBB5_14
# BB#15:                                # %polly.cond.loopexit.us
                                        #   in Loop: Header=BB5_13 Depth=3
	testb	%r14b, %r14b
	movq	%r10, %rdi
	movq	%r15, %rsi
	jne	.LBB5_17
	.p2align	4, 0x90
.LBB5_16:                               # %polly.loop_header136.us
                                        #   Parent Loop BB5_8 Depth=1
                                        #     Parent Loop BB5_10 Depth=2
                                        #       Parent Loop BB5_13 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	addq	%r9, (%rdi)
	addq	$8, %rdi
	decq	%rsi
	jne	.LBB5_16
.LBB5_17:                               # %polly.merge.us
                                        #   in Loop: Header=BB5_13 Depth=3
	addq	%rax, %rcx
	addq	%rax, %r10
	cmpq	%r11, %rbx
	leaq	1(%rbx), %rbx
	jle	.LBB5_13
	jmp	.LBB5_18
	.p2align	4, 0x90
.LBB5_20:                               # %polly.loop_header112.preheader.split
                                        #   in Loop: Header=BB5_10 Depth=2
	cmpq	(%rsp), %rcx            # 8-byte Folded Reload
	jl	.LBB5_18
# BB#21:                                # %polly.loop_header112.preheader215
                                        #   in Loop: Header=BB5_10 Depth=2
	movq	24(%rsp), %rdx          # 8-byte Reload
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB5_22:                               # %polly.loop_header112
                                        #   Parent Loop BB5_8 Depth=1
                                        #     Parent Loop BB5_10 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_25 Depth 4
	testq	%r15, %r15
	je	.LBB5_23
# BB#24:                                # %polly.loop_header136.preheader
                                        #   in Loop: Header=BB5_22 Depth=3
	leaq	(%rbx,%rbp), %rcx
	movq	%rdx, %rsi
	movq	%r15, %rdi
	.p2align	4, 0x90
.LBB5_25:                               # %polly.loop_header136
                                        #   Parent Loop BB5_8 Depth=1
                                        #     Parent Loop BB5_10 Depth=2
                                        #       Parent Loop BB5_22 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	addq	%rcx, (%rsi)
	addq	$8, %rsi
	decq	%rdi
	jne	.LBB5_25
.LBB5_23:                               # %polly.merge
                                        #   in Loop: Header=BB5_22 Depth=3
	addq	%rax, %rdx
	cmpq	%r11, %rbx
	leaq	1(%rbx), %rbx
	jle	.LBB5_22
	.p2align	4, 0x90
.LBB5_18:                               # %polly.loop_exit114
                                        #   in Loop: Header=BB5_10 Depth=2
	addq	$256, %r13              # imm = 0x100
	cmpq	48(%rsp), %r8           # 8-byte Folded Reload
	leaq	1(%r8), %r8
	jne	.LBB5_10
.LBB5_19:                               # %polly.loop_exit105
                                        #   in Loop: Header=BB5_8 Depth=1
	movq	72(%rsp), %rcx          # 8-byte Reload
	addq	%rcx, 24(%rsp)          # 8-byte Folded Spill
	addq	%rcx, 40(%rsp)          # 8-byte Folded Spill
	movq	16(%rsp), %rcx          # 8-byte Reload
	cmpq	80(%rsp), %rcx          # 8-byte Folded Reload
	leaq	1(%rcx), %rcx
	movq	%rcx, 16(%rsp)          # 8-byte Spill
	jne	.LBB5_8
.LBB5_1:                                # %if.end28
	movq	32(%rsp), %r15          # 8-byte Reload
	movq	%r15, %rdi
	movq	56(%rsp), %rbx          # 8-byte Reload
	movq	%rbx, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, %r14
	movl	$32, %edi
	callq	malloc
	movq	%rax, %rbp
	movq	%rbx, 8(%rbp)
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, (%rbp)
	movq	8(%rsp), %rax           # 8-byte Reload
	movq	%rax, 24(%rbp)
	movq	(%rsp), %rax            # 8-byte Reload
	movq	%rax, 16(%rbp)
	movq	%r14, %rdi
	callq	free
	testq	%r15, %r15
	je	.LBB5_3
# BB#2:                                 # %if.then39
	movq	%r15, %rdi
	callq	free
.LBB5_3:                                # %if.end40
	movq	64(%rsp), %rdi          # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB5_5
# BB#4:                                 # %if.then42
	callq	free
.LBB5_5:                                # %if.end43
	movq	%rbp, %rax
	addq	$104, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end5:
	.size	_init_, .Lfunc_end5-_init_
	.cfi_endproc

	.globl	_print_mat_
	.p2align	4, 0x90
	.type	_print_mat_,@function
_print_mat_:                            # @_print_mat_
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Lcfi48:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi49:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi50:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi51:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi52:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi53:
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
.Lcfi54:
	.cfi_def_cfa_offset 112
.Lcfi55:
	.cfi_offset %rbx, -56
.Lcfi56:
	.cfi_offset %r12, -48
.Lcfi57:
	.cfi_offset %r13, -40
.Lcfi58:
	.cfi_offset %r14, -32
.Lcfi59:
	.cfi_offset %r15, -24
.Lcfi60:
	.cfi_offset %rbp, -16
	movl	%edx, %r15d
	movq	%rsi, %rbx
	movq	24(%rbx), %r14
	testq	%r14, %r14
	jle	.LBB6_1
# BB#2:                                 # %while.cond3.preheader.preheader
	movq	16(%rbx), %rcx
	testq	%rcx, %rcx
	jle	.LBB6_3
# BB#8:                                 # %while.cond3.preheader.us.preheader
	movq	%r14, 32(%rsp)          # 8-byte Spill
	movl	%r15d, 12(%rsp)         # 4-byte Spill
	leaq	(,%rcx,8), %rax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	xorl	%edx, %edx
	xorl	%eax, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
                                        # implicit-def: %R12
	xorl	%r14d, %r14d
	xorl	%ebp, %ebp
	xorl	%r13d, %r13d
	movq	%rcx, 24(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB6_9:                                # %while.cond3.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_10 Depth 2
	movq	%r12, 40(%rsp)          # 8-byte Spill
	movq	%rdx, 48(%rsp)          # 8-byte Spill
	movq	%rdx, %r12
	movq	%rcx, %r15
	.p2align	4, 0x90
.LBB6_10:                               # %if.end9.us
                                        #   Parent Loop BB6_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rbx), %rax
	movq	(%rax,%r12), %rsi
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	callq	printf
	testb	$1, %r14b
	je	.LBB6_12
# BB#11:                                # %if.then11.us
                                        #   in Loop: Header=BB6_10 Depth=2
	movq	%rbp, %rdi
	callq	free
.LBB6_12:                               # %if.end12.us
                                        #   in Loop: Header=BB6_10 Depth=2
	xorl	%edi, %edi
	movl	$1, %esi
	callq	create1DArray_int64_t
	movq	%rax, %rbp
	movq	$32, (%rbp)
	testq	%rbp, %rbp
	setne	%r14b
	movl	$1, %esi
	movq	%rbp, %rdi
	callq	printf_s
	addq	$8, %r12
	decq	%r15
	jne	.LBB6_10
# BB#13:                                # %polly.split_new_and_old.loopexit.us
                                        #   in Loop: Header=BB6_9 Depth=1
	cmpb	$0, (%rsp)              # 1-byte Folded Reload
	je	.LBB6_15
# BB#14:                                # %if.then21.us
                                        #   in Loop: Header=BB6_9 Depth=1
	movq	40(%rsp), %rdi          # 8-byte Reload
	callq	free
.LBB6_15:                               # %polly.merge_new_and_old.us
                                        #   in Loop: Header=BB6_9 Depth=1
	incq	%r13
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	create1DArray_int64_t
	movq	%rax, %r12
	testq	%r12, %r12
	setne	%al
	movq	%rax, (%rsp)            # 8-byte Spill
	xorl	%esi, %esi
	movq	%r12, %rdi
	callq	println_s
	movq	48(%rsp), %rdx          # 8-byte Reload
	addq	16(%rsp), %rdx          # 8-byte Folded Reload
	cmpq	32(%rsp), %r13          # 8-byte Folded Reload
	movq	24(%rsp), %rcx          # 8-byte Reload
	jne	.LBB6_9
# BB#16:                                # %blklab6.loopexit
	movl	12(%rsp), %r15d         # 4-byte Reload
	movq	(%rsp), %r13            # 8-byte Reload
	testb	%r15b, %r15b
	jne	.LBB6_18
	jmp	.LBB6_19
.LBB6_1:
	xorl	%ebp, %ebp
	xorl	%r14d, %r14d
                                        # implicit-def: %R12
	xorl	%r13d, %r13d
	testb	%r15b, %r15b
	jne	.LBB6_18
	jmp	.LBB6_19
.LBB6_3:                                # %while.cond3.preheader.preheader114
	xorl	%r13d, %r13d
                                        # implicit-def: %R12
	.p2align	4, 0x90
.LBB6_4:                                # %while.cond3.preheader
                                        # =>This Inner Loop Header: Depth=1
	testb	%r13b, %r13b
	je	.LBB6_6
# BB#5:                                 # %if.then21
                                        #   in Loop: Header=BB6_4 Depth=1
	movq	%r12, %rdi
	callq	free
.LBB6_6:                                # %polly.merge_new_and_old
                                        #   in Loop: Header=BB6_4 Depth=1
	xorl	%ebp, %ebp
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	create1DArray_int64_t
	movq	%rax, %r12
	testq	%r12, %r12
	setne	%r13b
	xorl	%esi, %esi
	movq	%r12, %rdi
	callq	println_s
	decq	%r14
	jne	.LBB6_4
# BB#7:
	xorl	%r14d, %r14d
	testb	%r15b, %r15b
	je	.LBB6_19
.LBB6_18:                               # %if.then29
	movq	(%rbx), %rdi
	callq	free
	movq	%rbx, %rdi
	callq	free
.LBB6_19:                               # %if.end33
	testb	%r14b, %r14b
	je	.LBB6_21
# BB#20:                                # %if.then35
	movq	%rbp, %rdi
	callq	free
.LBB6_21:                               # %if.end36
	testb	%r13b, %r13b
	je	.LBB6_22
# BB#23:                                # %if.then38
	movq	%r12, %rdi
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	free                    # TAILCALL
.LBB6_22:                               # %if.end39
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end6:
	.size	_print_mat_, .Lfunc_end6-_print_mat_
	.cfi_endproc

	.globl	_mat_mult_
	.p2align	4, 0x90
	.type	_mat_mult_,@function
_mat_mult_:                             # @_mat_mult_
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Lcfi61:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi62:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi63:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi64:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi65:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi66:
	.cfi_def_cfa_offset 56
	subq	$472, %rsp              # imm = 0x1D8
.Lcfi67:
	.cfi_def_cfa_offset 528
.Lcfi68:
	.cfi_offset %rbx, -56
.Lcfi69:
	.cfi_offset %r12, -48
.Lcfi70:
	.cfi_offset %r13, -40
.Lcfi71:
	.cfi_offset %r14, -32
.Lcfi72:
	.cfi_offset %r15, -24
.Lcfi73:
	.cfi_offset %rbp, -16
	movl	%ecx, 140(%rsp)         # 4-byte Spill
	movq	%rdx, %r12
	movl	%esi, 136(%rsp)         # 4-byte Spill
	movq	%rdi, %rbp
	movq	16(%r12), %r14
	movq	24(%rbp), %r15
	movq	%r15, %rbx
	imulq	%r14, %rbx
	xorl	%edi, %edi
	movq	%rbx, %rsi
	callq	create1DArray_int64_t
	movq	%rax, 312(%rsp)         # 8-byte Spill
	movq	%rax, %rdi
	movq	%rbx, 304(%rsp)         # 8-byte Spill
	movq	%rbx, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, %r13
	movq	(%rbp), %rdi
	movq	%rbp, 288(%rsp)         # 8-byte Spill
	movq	8(%rbp), %rsi
	callq	copy1DArray_int64_t
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movq	(%r12), %rdi
	movq	%r12, 296(%rsp)         # 8-byte Spill
	movq	8(%r12), %rsi
	movq	%r14, %rbx
	callq	copy1DArray_int64_t
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	%r15, 40(%rsp)          # 8-byte Spill
	testq	%r15, %r15
	jle	.LBB7_15
# BB#1:                                 # %polly.split_new_and_old
	movq	40(%rsp), %rdx          # 8-byte Reload
	decq	%rdx
	seto	%cl
	movq	%rdx, 144(%rsp)         # 8-byte Spill
	imulq	%rbx, %rdx
	seto	%al
	addq	%rbx, %rdx
	seto	%r8b
	movq	8(%rsp), %rdi           # 8-byte Reload
	leaq	(%rdi,%rdx,8), %rsi
	cmpq	%r13, %rsi
	setbe	%sil
	leaq	(%r13,%rdx,8), %r14
	cmpq	%rdi, %r14
	setbe	%dl
	orb	%sil, %dl
	movq	%rbx, %rsi
	decq	%rsi
	seto	%r11b
	movq	%rsi, %r15
	movq	%rsi, %rbp
	imulq	%rbx, %rbp
	seto	%dil
	movq	%rbx, 24(%rsp)          # 8-byte Spill
	addq	%rbx, %rbp
	seto	%r10b
	movq	16(%rsp), %rsi          # 8-byte Reload
	leaq	(%rsi,%rbp,8), %rbp
	cmpq	%r13, %rbp
	setbe	%r9b
	cmpq	%rsi, %r14
	setbe	%bl
	cmpb	$1, %dl
	movq	%r13, 248(%rsp)         # 8-byte Spill
	jne	.LBB7_4
# BB#2:                                 # %polly.split_new_and_old
	orb	%r9b, %bl
	je	.LBB7_4
# BB#3:                                 # %polly.split_new_and_old
	orb	%cl, %r10b
	orb	%al, %cl
	orb	%r11b, %cl
	orb	%dil, %cl
	orb	%r8b, %cl
	orb	%r10b, %cl
	orb	%r8b, %al
	orb	%cl, %al
	xorb	$1, %al
	testb	$1, %al
	je	.LBB7_4
# BB#28:                                # %polly.start
	sarq	$5, 144(%rsp)           # 8-byte Folded Spill
	movq	24(%rsp), %rbx          # 8-byte Reload
	js	.LBB7_15
# BB#29:                                # %polly.loop_header.preheader
	movq	%r15, %rax
	sarq	$5, %rax
	movq	%rax, 152(%rsp)         # 8-byte Spill
	shrq	$5, %r15
	movq	%r15, 384(%rsp)         # 8-byte Spill
	movq	%rbx, %rax
	shrq	$2, %rax
	decq	%rax
	movq	%rax, 376(%rsp)         # 8-byte Spill
	movl	%ebx, %eax
	andl	$3, %eax
	movq	%rbx, %rdx
	andq	$-4, %rdx
	movq	%rax, 56(%rsp)          # 8-byte Spill
	decq	%rax
	movq	%rax, 240(%rsp)         # 8-byte Spill
	movl	%ebx, %eax
	andl	$1, %eax
	movq	%rax, 232(%rsp)         # 8-byte Spill
	movq	%rdx, %rax
	imulq	%rbx, %rax
	movq	%rax, 216(%rsp)         # 8-byte Spill
	leaq	1(%rdx), %rax
	movq	%rax, 224(%rsp)         # 8-byte Spill
	leaq	(%rbx,%rbx), %rax
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movq	%rbx, %r14
	shlq	$5, %r14
	leaq	(%rbx,%rbx,2), %rax
	movq	16(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rax,8), %rax
	movq	%rax, 336(%rsp)         # 8-byte Spill
	movq	%rbx, %rax
	shlq	$8, %rax
	movq	%rax, 168(%rsp)         # 8-byte Spill
	movq	8(%rsp), %rax           # 8-byte Reload
	leaq	24(%rax), %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	leaq	(,%rbx,8), %rax
	movq	%rax, 424(%rsp)         # 8-byte Spill
	movq	%rbx, %rax
	shlq	$4, %rax
	addq	%rcx, %rax
	movq	%rax, 328(%rsp)         # 8-byte Spill
	leaq	(%rcx,%rbx,8), %rax
	movq	%rax, 320(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	%rdx, 48(%rsp)          # 8-byte Spill
	movq	%rdx, 160(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB7_30:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_32 Depth 2
                                        #       Child Loop BB7_33 Depth 3
                                        #         Child Loop BB7_35 Depth 4
                                        #           Child Loop BB7_55 Depth 5
                                        #             Child Loop BB7_63 Depth 6
                                        #           Child Loop BB7_38 Depth 5
                                        #             Child Loop BB7_39 Depth 6
                                        #             Child Loop BB7_48 Depth 6
	cmpq	$0, 152(%rsp)           # 8-byte Folded Reload
	js	.LBB7_44
# BB#31:                                # %polly.loop_header279.preheader
                                        #   in Loop: Header=BB7_30 Depth=1
	movq	64(%rsp), %rcx          # 8-byte Reload
	shlq	$5, %rcx
	movq	40(%rsp), %rdx          # 8-byte Reload
	movq	%rcx, %rax
	movq	%rax, 408(%rsp)         # 8-byte Spill
	subq	%rcx, %rdx
	decq	%rdx
	cmpq	$32, %rdx
	movl	$31, %eax
	cmovgeq	%rax, %rdx
	movq	%rdx, 392(%rsp)         # 8-byte Spill
	leaq	-1(%rdx), %rax
	movq	%rax, 432(%rsp)         # 8-byte Spill
	movq	320(%rsp), %rcx         # 8-byte Reload
	movq	328(%rsp), %rdx         # 8-byte Reload
	movq	336(%rsp), %r8          # 8-byte Reload
	movq	16(%rsp), %rdi          # 8-byte Reload
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB7_32:                               # %polly.loop_header279
                                        #   Parent Loop BB7_30 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_33 Depth 3
                                        #         Child Loop BB7_35 Depth 4
                                        #           Child Loop BB7_55 Depth 5
                                        #             Child Loop BB7_63 Depth 6
                                        #           Child Loop BB7_38 Depth 5
                                        #             Child Loop BB7_39 Depth 6
                                        #             Child Loop BB7_48 Depth 6
	movq	%rax, 344(%rsp)         # 8-byte Spill
	shlq	$5, %rax
	movq	%rbx, %rsi
	movq	%rax, %rbp
	movq	%rbp, 256(%rsp)         # 8-byte Spill
	subq	%rax, %rsi
	decq	%rsi
	cmpq	$32, %rsi
	movl	$31, %eax
	cmovgeq	%rax, %rsi
	movq	%rsi, 440(%rsp)         # 8-byte Spill
	leaq	-1(%rsi), %rax
	movq	%rax, 272(%rsp)         # 8-byte Spill
	movq	%rdi, 88(%rsp)          # 8-byte Spill
	movq	%rdi, 208(%rsp)         # 8-byte Spill
	movq	%rcx, 368(%rsp)         # 8-byte Spill
	movq	%rcx, 200(%rsp)         # 8-byte Spill
	movq	%rdx, 360(%rsp)         # 8-byte Spill
	movq	%rdx, 192(%rsp)         # 8-byte Spill
	movq	72(%rsp), %rax          # 8-byte Reload
	movq	%rax, 176(%rsp)         # 8-byte Spill
	movq	%r8, 352(%rsp)          # 8-byte Spill
	movq	%r8, 184(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB7_33:                               # %polly.loop_header287
                                        #   Parent Loop BB7_30 Depth=1
                                        #     Parent Loop BB7_32 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB7_35 Depth 4
                                        #           Child Loop BB7_55 Depth 5
                                        #             Child Loop BB7_63 Depth 6
                                        #           Child Loop BB7_38 Depth 5
                                        #             Child Loop BB7_39 Depth 6
                                        #             Child Loop BB7_48 Depth 6
	cmpq	$0, 392(%rsp)           # 8-byte Folded Reload
	js	.LBB7_52
# BB#34:                                # %polly.loop_header295.preheader
                                        #   in Loop: Header=BB7_33 Depth=3
	cmpq	$0, 56(%rsp)            # 8-byte Folded Reload
	sete	%al
	movq	80(%rsp), %rdx          # 8-byte Reload
	leaq	(,%rdx,8), %rcx
	movq	376(%rsp), %rsi         # 8-byte Reload
	subq	%rcx, %rsi
	cmpq	$8, %rsi
	movl	$7, %ecx
	cmovgeq	%rcx, %rsi
	shlq	$5, %rdx
	orq	$31, %rdx
	movq	%rdx, 400(%rsp)         # 8-byte Spill
	cmpq	%rbx, %rdx
	setl	%cl
	movq	%rsi, 416(%rsp)         # 8-byte Spill
	leaq	-1(%rsi), %r10
	orb	%al, %cl
	movb	%cl, 7(%rsp)            # 1-byte Spill
	movq	176(%rsp), %rax         # 8-byte Reload
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	160(%rsp), %rax         # 8-byte Reload
	movq	%rax, 104(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB7_35:                               # %polly.loop_header295
                                        #   Parent Loop BB7_30 Depth=1
                                        #     Parent Loop BB7_32 Depth=2
                                        #       Parent Loop BB7_33 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB7_55 Depth 5
                                        #             Child Loop BB7_63 Depth 6
                                        #           Child Loop BB7_38 Depth 5
                                        #             Child Loop BB7_39 Depth 6
                                        #             Child Loop BB7_48 Depth 6
	cmpq	$0, 440(%rsp)           # 8-byte Folded Reload
	js	.LBB7_51
# BB#36:                                # %polly.loop_header304.preheader
                                        #   in Loop: Header=BB7_35 Depth=4
	movq	408(%rsp), %rax         # 8-byte Reload
	movq	96(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	movq	24(%rsp), %rax          # 8-byte Reload
	imulq	%rax, %rcx
	cmpq	$0, 416(%rsp)           # 8-byte Folded Reload
	movq	%rcx, 264(%rsp)         # 8-byte Spill
	js	.LBB7_53
# BB#37:                                # %polly.loop_header304.us.preheader
                                        #   in Loop: Header=BB7_35 Depth=4
	movq	48(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	movq	%rax, 448(%rsp)         # 8-byte Spill
	movq	88(%rsp), %rax          # 8-byte Reload
	movq	%rax, 280(%rsp)         # 8-byte Spill
	movq	208(%rsp), %rdx         # 8-byte Reload
	movq	200(%rsp), %rsi         # 8-byte Reload
	movq	192(%rsp), %r11         # 8-byte Reload
	movq	184(%rsp), %r9          # 8-byte Reload
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB7_38:                               # %polly.loop_header304.us
                                        #   Parent Loop BB7_30 Depth=1
                                        #     Parent Loop BB7_32 Depth=2
                                        #       Parent Loop BB7_33 Depth=3
                                        #         Parent Loop BB7_35 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB7_39 Depth 6
                                        #             Child Loop BB7_48 Depth 6
	movq	256(%rsp), %rax         # 8-byte Reload
	leaq	(%r12,%rax), %rax
	movq	%rax, 456(%rsp)         # 8-byte Spill
	leaq	(%rax,%rcx), %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	(%r13,%rax,8), %r8
	movq	$-1, %r15
	movq	%rdx, 128(%rsp)         # 8-byte Spill
	movq	%rsi, 464(%rsp)         # 8-byte Spill
	movq	%r11, %rdi
	movq	120(%rsp), %rcx         # 8-byte Reload
	movq	%r9, %rax
	.p2align	4, 0x90
.LBB7_39:                               # %polly.loop_header314.us
                                        #   Parent Loop BB7_30 Depth=1
                                        #     Parent Loop BB7_32 Depth=2
                                        #       Parent Loop BB7_33 Depth=3
                                        #         Parent Loop BB7_35 Depth=4
                                        #           Parent Loop BB7_38 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	(%rdx), %r13
	imulq	-24(%rcx), %r13
	addq	%r8, %r13
	movq	(%rsi), %rbx
	imulq	-16(%rcx), %rbx
	addq	%r13, %rbx
	movq	(%rdi), %rbp
	imulq	-8(%rcx), %rbp
	addq	%rbx, %rbp
	movq	(%rax), %r8
	imulq	(%rcx), %r8
	addq	%rbp, %r8
	incq	%r15
	addq	%r14, %rax
	addq	$32, %rcx
	addq	%r14, %rdi
	addq	%r14, %rsi
	addq	%r14, %rdx
	cmpq	%r10, %r15
	jle	.LBB7_39
# BB#40:                                # %polly.cond.loopexit.us
                                        #   in Loop: Header=BB7_38 Depth=5
	movq	248(%rsp), %r13         # 8-byte Reload
	movq	32(%rsp), %rax          # 8-byte Reload
	movq	%r8, (%r13,%rax,8)
	cmpb	$0, 7(%rsp)             # 1-byte Folded Reload
	jne	.LBB7_50
# BB#41:                                # %polly.loop_header333.us.preheader
                                        #   in Loop: Header=BB7_38 Depth=5
	cmpq	$0, 232(%rsp)           # 8-byte Folded Reload
	jne	.LBB7_45
# BB#42:                                #   in Loop: Header=BB7_38 Depth=5
                                        # implicit-def: %RAX
	xorl	%edi, %edi
	movq	8(%rsp), %rsi           # 8-byte Reload
	jmp	.LBB7_46
	.p2align	4, 0x90
.LBB7_45:                               # %polly.loop_header333.us.prol
                                        #   in Loop: Header=BB7_38 Depth=5
	movq	456(%rsp), %rcx         # 8-byte Reload
	addq	216(%rsp), %rcx         # 8-byte Folded Reload
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	(%rax,%rcx,8), %rax
	movq	8(%rsp), %rsi           # 8-byte Reload
	movq	448(%rsp), %rcx         # 8-byte Reload
	imulq	(%rsi,%rcx,8), %rax
	addq	%r8, %rax
	movq	%rax, %r8
	movl	$1, %edi
.LBB7_46:                               # %polly.loop_header333.us.prol.loopexit
                                        #   in Loop: Header=BB7_38 Depth=5
	movq	112(%rsp), %r15         # 8-byte Reload
	cmpq	$0, 240(%rsp)           # 8-byte Folded Reload
	je	.LBB7_49
# BB#47:                                # %polly.loop_header333.us.preheader.new
                                        #   in Loop: Header=BB7_38 Depth=5
	movq	56(%rsp), %rcx          # 8-byte Reload
	subq	%rdi, %rcx
	movq	224(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rdi), %rax
	movq	24(%rsp), %rbx          # 8-byte Reload
	imulq	%rbx, %rax
	movq	280(%rsp), %rbp         # 8-byte Reload
	leaq	(%rbp,%rax,8), %rdx
	movq	104(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rdi), %rax
	leaq	(%rsi,%rax,8), %rsi
	addq	48(%rsp), %rdi          # 8-byte Folded Reload
	imulq	%rbx, %rdi
	leaq	(%rbp,%rdi,8), %rdi
	xorl	%ebp, %ebp
	movq	%r8, %rax
	.p2align	4, 0x90
.LBB7_48:                               # %polly.loop_header333.us
                                        #   Parent Loop BB7_30 Depth=1
                                        #     Parent Loop BB7_32 Depth=2
                                        #       Parent Loop BB7_33 Depth=3
                                        #         Parent Loop BB7_35 Depth=4
                                        #           Parent Loop BB7_38 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	(%rdi,%rbp,8), %rbx
	imulq	(%rsi), %rbx
	addq	%rax, %rbx
	movq	(%rdx,%rbp,8), %rax
	imulq	8(%rsi), %rax
	addq	%rbx, %rax
	addq	%r15, %rbp
	addq	$16, %rsi
	addq	$-2, %rcx
	jne	.LBB7_48
.LBB7_49:                               # %polly.merge.loopexit.us
                                        #   in Loop: Header=BB7_38 Depth=5
	movq	32(%rsp), %rcx          # 8-byte Reload
	movq	%rax, (%r13,%rcx,8)
.LBB7_50:                               # %polly.merge.us
                                        #   in Loop: Header=BB7_38 Depth=5
	addq	$8, %r9
	addq	$8, %r11
	movq	464(%rsp), %rsi         # 8-byte Reload
	addq	$8, %rsi
	movq	128(%rsp), %rdx         # 8-byte Reload
	addq	$8, %rdx
	addq	$8, 280(%rsp)           # 8-byte Folded Spill
	cmpq	272(%rsp), %r12         # 8-byte Folded Reload
	leaq	1(%r12), %r12
	movq	264(%rsp), %rcx         # 8-byte Reload
	jle	.LBB7_38
	jmp	.LBB7_51
	.p2align	4, 0x90
.LBB7_53:                               # %polly.loop_header304.preheader.split
                                        #   in Loop: Header=BB7_35 Depth=4
	cmpq	%rax, 400(%rsp)         # 8-byte Folded Reload
	jl	.LBB7_51
# BB#54:                                # %polly.loop_header304.preheader477
                                        #   in Loop: Header=BB7_35 Depth=4
	movq	48(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	88(%rsp), %r15          # 8-byte Reload
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB7_55:                               # %polly.loop_header304
                                        #   Parent Loop BB7_30 Depth=1
                                        #     Parent Loop BB7_32 Depth=2
                                        #       Parent Loop BB7_33 Depth=3
                                        #         Parent Loop BB7_35 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB7_63 Depth 6
	cmpq	$0, 56(%rsp)            # 8-byte Folded Reload
	je	.LBB7_59
# BB#56:                                # %polly.loop_header333.preheader
                                        #   in Loop: Header=BB7_55 Depth=5
	movq	256(%rsp), %rax         # 8-byte Reload
	leaq	(%r12,%rax), %rax
	leaq	(%rax,%rcx), %r9
	cmpq	$0, 232(%rsp)           # 8-byte Folded Reload
	movq	(%r13,%r9,8), %r11
	jne	.LBB7_60
# BB#57:                                #   in Loop: Header=BB7_55 Depth=5
                                        # implicit-def: %RCX
	xorl	%edx, %edx
	jmp	.LBB7_61
	.p2align	4, 0x90
.LBB7_60:                               # %polly.loop_header333.prol
                                        #   in Loop: Header=BB7_55 Depth=5
	addq	216(%rsp), %rax         # 8-byte Folded Reload
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	(%rcx,%rax,8), %rcx
	movq	8(%rsp), %rax           # 8-byte Reload
	movq	32(%rsp), %rdx          # 8-byte Reload
	imulq	(%rax,%rdx,8), %rcx
	addq	%r11, %rcx
	movq	%rcx, %r11
	movl	$1, %edx
.LBB7_61:                               # %polly.loop_header333.prol.loopexit
                                        #   in Loop: Header=BB7_55 Depth=5
	cmpq	$0, 240(%rsp)           # 8-byte Folded Reload
	movq	112(%rsp), %r8          # 8-byte Reload
	je	.LBB7_58
# BB#62:                                # %polly.loop_header333.preheader.new
                                        #   in Loop: Header=BB7_55 Depth=5
	movq	56(%rsp), %rbp          # 8-byte Reload
	subq	%rdx, %rbp
	movq	224(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rdx), %rax
	movq	24(%rsp), %rbx          # 8-byte Reload
	imulq	%rbx, %rax
	leaq	(%r15,%rax,8), %rax
	movq	104(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rdx), %rcx
	movq	8(%rsp), %rsi           # 8-byte Reload
	leaq	(%rsi,%rcx,8), %rdi
	addq	48(%rsp), %rdx          # 8-byte Folded Reload
	imulq	%rbx, %rdx
	leaq	(%r15,%rdx,8), %rbx
	xorl	%edx, %edx
	movq	%r11, %rcx
	.p2align	4, 0x90
.LBB7_63:                               # %polly.loop_header333
                                        #   Parent Loop BB7_30 Depth=1
                                        #     Parent Loop BB7_32 Depth=2
                                        #       Parent Loop BB7_33 Depth=3
                                        #         Parent Loop BB7_35 Depth=4
                                        #           Parent Loop BB7_55 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	(%rbx,%rdx,8), %rsi
	imulq	(%rdi), %rsi
	addq	%rcx, %rsi
	movq	(%rax,%rdx,8), %rcx
	imulq	8(%rdi), %rcx
	addq	%rsi, %rcx
	addq	%r8, %rdx
	addq	$16, %rdi
	addq	$-2, %rbp
	jne	.LBB7_63
.LBB7_58:                               # %polly.merge.loopexit
                                        #   in Loop: Header=BB7_55 Depth=5
	movq	%rcx, (%r13,%r9,8)
	movq	264(%rsp), %rcx         # 8-byte Reload
.LBB7_59:                               # %polly.merge
                                        #   in Loop: Header=BB7_55 Depth=5
	addq	$8, %r15
	cmpq	272(%rsp), %r12         # 8-byte Folded Reload
	leaq	1(%r12), %r12
	jle	.LBB7_55
	.p2align	4, 0x90
.LBB7_51:                               # %polly.loop_exit306
                                        #   in Loop: Header=BB7_35 Depth=4
	movq	24(%rsp), %rbx          # 8-byte Reload
	addq	%rbx, 104(%rsp)         # 8-byte Folded Spill
	movq	120(%rsp), %rax         # 8-byte Reload
	addq	424(%rsp), %rax         # 8-byte Folded Reload
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	96(%rsp), %rax          # 8-byte Reload
	cmpq	432(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	jle	.LBB7_35
.LBB7_52:                               # %polly.loop_exit297
                                        #   in Loop: Header=BB7_33 Depth=3
	movq	168(%rsp), %rax         # 8-byte Reload
	addq	%rax, 184(%rsp)         # 8-byte Folded Spill
	addq	$256, 176(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x100
	addq	%rax, 192(%rsp)         # 8-byte Folded Spill
	addq	%rax, 200(%rsp)         # 8-byte Folded Spill
	addq	%rax, 208(%rsp)         # 8-byte Folded Spill
	movq	80(%rsp), %rax          # 8-byte Reload
	cmpq	384(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	jne	.LBB7_33
# BB#43:                                # %polly.loop_exit289
                                        #   in Loop: Header=BB7_32 Depth=2
	movq	88(%rsp), %rdi          # 8-byte Reload
	addq	$256, %rdi              # imm = 0x100
	movq	352(%rsp), %r8          # 8-byte Reload
	addq	$256, %r8               # imm = 0x100
	movq	360(%rsp), %rdx         # 8-byte Reload
	addq	$256, %rdx              # imm = 0x100
	movq	368(%rsp), %rcx         # 8-byte Reload
	addq	$256, %rcx              # imm = 0x100
	movq	344(%rsp), %rax         # 8-byte Reload
	cmpq	152(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	jne	.LBB7_32
.LBB7_44:                               # %polly.loop_exit281
                                        #   in Loop: Header=BB7_30 Depth=1
	addq	%r14, 160(%rsp)         # 8-byte Folded Spill
	movq	72(%rsp), %rax          # 8-byte Reload
	addq	168(%rsp), %rax         # 8-byte Folded Reload
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	64(%rsp), %rax          # 8-byte Reload
	cmpq	144(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	jne	.LBB7_30
	jmp	.LBB7_15
.LBB7_4:                                # %while.cond43.preheader.preheader
	movq	24(%rsp), %rbx          # 8-byte Reload
	testq	%rbx, %rbx
	jle	.LBB7_15
# BB#5:                                 # %while.cond43.preheader.us.preheader
	movl	%ebx, %r10d
	andl	$1, %r10d
	leaq	(%rbx,%rbx), %r12
	xorl	%eax, %eax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	248(%rsp), %r8          # 8-byte Reload
	movq	24(%rsp), %r9           # 8-byte Reload
	.p2align	4, 0x90
.LBB7_6:                                # %while.cond43.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_7 Depth 2
                                        #       Child Loop BB7_12 Depth 3
	movq	%rax, 128(%rsp)         # 8-byte Spill
	movq	%rax, %r11
	imulq	%rbx, %r11
	movq	16(%rsp), %r14          # 8-byte Reload
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB7_7:                                # %while.cond48.preheader.us.us
                                        #   Parent Loop BB7_6 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_12 Depth 3
	leaq	(%r15,%r11), %rdx
	testq	%r10, %r10
	movq	(%r13,%rdx,8), %rax
	jne	.LBB7_9
# BB#8:                                 #   in Loop: Header=BB7_7 Depth=2
	xorl	%ecx, %ecx
	cmpq	$1, %rbx
	jne	.LBB7_11
	jmp	.LBB7_13
	.p2align	4, 0x90
.LBB7_9:                                # %if.end52.us.us.prol
                                        #   in Loop: Header=BB7_7 Depth=2
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	(%rcx,%r15,8), %rcx
	movq	8(%rsp), %rsi           # 8-byte Reload
	imulq	(%rsi,%r11,8), %rcx
	addq	%rcx, %rax
	movq	%rax, (%r13,%rdx,8)
	movl	$1, %ecx
	cmpq	$1, %rbx
	je	.LBB7_13
.LBB7_11:                               # %while.cond48.preheader.us.us.new
                                        #   in Loop: Header=BB7_7 Depth=2
	movq	%r9, %rbp
	subq	%rcx, %rbp
	leaq	1(%rcx), %rsi
	imulq	%r9, %rsi
	leaq	(%r14,%rsi,8), %r13
	movq	32(%rsp), %rsi          # 8-byte Reload
	leaq	(%rsi,%rcx), %rsi
	movq	8(%rsp), %rdi           # 8-byte Reload
	leaq	(%rdi,%rsi,8), %rbx
	imulq	%r9, %rcx
	leaq	(%r14,%rcx,8), %rsi
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB7_12:                               # %if.end52.us.us
                                        #   Parent Loop BB7_6 Depth=1
                                        #     Parent Loop BB7_7 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	(%rsi,%rcx,8), %rdi
	imulq	(%rbx), %rdi
	addq	%rax, %rdi
	movq	%rdi, (%r8,%rdx,8)
	movq	(%r13,%rcx,8), %rax
	imulq	8(%rbx), %rax
	addq	%rdi, %rax
	movq	%rax, (%r8,%rdx,8)
	addq	%r12, %rcx
	addq	$16, %rbx
	addq	$-2, %rbp
	jne	.LBB7_12
.LBB7_13:                               # %blklab17.loopexit.us.us
                                        #   in Loop: Header=BB7_7 Depth=2
	incq	%r15
	addq	$8, %r14
	movq	24(%rsp), %rbx          # 8-byte Reload
	cmpq	%rbx, %r15
	movq	%r8, %r13
	jne	.LBB7_7
# BB#14:                                # %blklab15.loopexit.us-lcssa.us.us
                                        #   in Loop: Header=BB7_6 Depth=1
	movq	128(%rsp), %rax         # 8-byte Reload
	incq	%rax
	addq	%rbx, 32(%rsp)          # 8-byte Folded Spill
	cmpq	40(%rsp), %rax          # 8-byte Folded Reload
	jne	.LBB7_6
.LBB7_15:                               # %if.end70
	movq	%r13, %rdi
	movq	304(%rsp), %rbp         # 8-byte Reload
	movq	%rbp, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, %r15
	movl	$32, %edi
	callq	malloc
	movq	%rax, %r12
	movq	%rbp, 8(%r12)
	movq	%r15, %rdi
	movq	%rbp, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, (%r12)
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	%rax, 24(%r12)
	movq	%rbx, 16(%r12)
	movq	%r15, %rdi
	callq	free
	cmpb	$0, 136(%rsp)           # 1-byte Folded Reload
	je	.LBB7_17
# BB#16:                                # %if.then78
	movq	288(%rsp), %rbx         # 8-byte Reload
	movq	(%rbx), %rdi
	callq	free
	movq	%rbx, %rdi
	callq	free
.LBB7_17:                               # %if.end79
	cmpb	$0, 140(%rsp)           # 1-byte Folded Reload
	je	.LBB7_19
# BB#18:                                # %if.then81
	movq	296(%rsp), %rbx         # 8-byte Reload
	movq	(%rbx), %rdi
	callq	free
	movq	%rbx, %rdi
	callq	free
.LBB7_19:                               # %if.end85
	testq	%r13, %r13
	movq	8(%rsp), %rbx           # 8-byte Reload
	je	.LBB7_21
# BB#20:                                # %if.then87
	movq	%r13, %rdi
	callq	free
.LBB7_21:                               # %if.end88
	testq	%rbx, %rbx
	je	.LBB7_23
# BB#22:                                # %if.then90
	movq	%rbx, %rdi
	callq	free
.LBB7_23:                               # %if.end91
	movq	16(%rsp), %rdi          # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB7_25
# BB#24:                                # %if.then93
	callq	free
.LBB7_25:                               # %if.end94
	movq	312(%rsp), %rdi         # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB7_27
# BB#26:                                # %if.then96
	callq	free
.LBB7_27:                               # %if.end103
	movq	%r12, %rax
	addq	$472, %rsp              # imm = 0x1D8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end7:
	.size	_mat_mult_, .Lfunc_end7-_mat_mult_
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
.Lcfi74:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi75:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi76:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi77:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi78:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi79:
	.cfi_def_cfa_offset 56
	subq	$120, %rsp
.Lcfi80:
	.cfi_def_cfa_offset 176
.Lcfi81:
	.cfi_offset %rbx, -56
.Lcfi82:
	.cfi_offset %r12, -48
.Lcfi83:
	.cfi_offset %r13, -40
.Lcfi84:
	.cfi_offset %r14, -32
.Lcfi85:
	.cfi_offset %r15, -24
.Lcfi86:
	.cfi_offset %rbp, -16
	movq	$0, 8(%rsp)
	movq	$0, 112(%rsp)
	leaq	8(%rsp), %rdx
	leaq	112(%rsp), %rcx
	callq	convertArgsToIntArray
	movq	%rax, 104(%rsp)         # 8-byte Spill
	movq	(%rax), %rdi
	callq	parseStringToInt
	movq	%rax, 88(%rsp)          # 8-byte Spill
	movq	(%rax), %r14
	xorl	%edi, %edi
	movl	$7, %esi
	callq	create1DArray_int64_t
	movaps	.LCPI8_0(%rip), %xmm0   # xmm0 = [115,105]
	movups	%xmm0, (%rax)
	movaps	.LCPI8_1(%rip), %xmm0   # xmm0 = [122,101]
	movups	%xmm0, 16(%rax)
	movaps	.LCPI8_2(%rip), %xmm0   # xmm0 = [32,61]
	movups	%xmm0, 32(%rax)
	movq	$32, 48(%rax)
	movl	$7, %esi
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movq	%rax, %rdi
	callq	printf_s
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	movq	%r14, %rsi
	callq	printf
	movq	%r14, %rdi
	movq	%r14, %rsi
	callq	_init_
	movq	%rax, %rbp
	movl	$32, %edi
	callq	malloc
	movq	%rax, %rbx
	movq	%rbx, 24(%rsp)          # 8-byte Spill
	movq	8(%rbp), %r13
	movq	%r13, 8(%rbx)
	movq	(%rbp), %rdi
	movq	%r13, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	%rax, (%rbx)
	movq	16(%rbp), %rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	%rax, 16(%rbx)
	movq	%rbp, 80(%rsp)          # 8-byte Spill
	movq	24(%rbp), %rax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movq	%rax, 24(%rbx)
	movq	%r14, 56(%rsp)          # 8-byte Spill
	movq	%r14, %rdi
	movq	%r14, %rsi
	callq	_init_
	movq	%rax, %rbx
	movl	$32, %edi
	callq	malloc
	movq	%rax, %rbp
	movq	8(%rbx), %r15
	movq	%r15, 8(%rbp)
	movq	(%rbx), %rdi
	movq	%r15, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, %r14
	movq	%r14, (%rbp)
	movq	16(%rbx), %rax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	%rax, 16(%rbp)
	movq	%rbx, 72(%rsp)          # 8-byte Spill
	movq	24(%rbx), %rax
	movq	%rbp, 64(%rsp)          # 8-byte Spill
	movq	%rax, 24(%rbp)
	movq	%rax, %rbp
	movl	$32, %edi
	callq	malloc
	movq	%rax, %r12
	movq	%r13, 8(%r12)
	movq	32(%rsp), %rdi          # 8-byte Reload
	movq	%r13, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, (%r12)
	movq	48(%rsp), %rax          # 8-byte Reload
	movq	%rax, 16(%r12)
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	%rax, 24(%r12)
	movl	$32, %edi
	callq	malloc
	movq	%rax, %rbx
	movq	%r15, 8(%rbx)
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, (%rbx)
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	%rax, 16(%rbx)
	movq	%rbp, 24(%rbx)
	movl	$1, %esi
	movl	$1, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	callq	_mat_mult_
	movq	%rax, %r12
	movl	$32, %edi
	callq	malloc
	movq	%rax, %r13
	movq	8(%r12), %rsi
	movq	%rsi, 8(%r13)
	movq	(%r12), %rdi
	callq	copy1DArray_int64_t
	movq	%rax, %rbx
	movq	%rbx, (%r13)
	movups	16(%r12), %xmm0
	movups	%xmm0, 16(%r13)
	xorl	%edi, %edi
	movl	$27, %esi
	callq	create1DArray_int64_t
	movq	%rax, %r14
	movaps	.LCPI8_3(%rip), %xmm0   # xmm0 = [77,97]
	movups	%xmm0, (%r14)
	movaps	.LCPI8_4(%rip), %xmm0   # xmm0 = [116,114]
	movups	%xmm0, 16(%r14)
	movaps	.LCPI8_5(%rip), %xmm0   # xmm0 = [105,120]
	movups	%xmm0, 32(%r14)
	movaps	.LCPI8_6(%rip), %xmm0   # xmm0 = [32,67]
	movups	%xmm0, 48(%r14)
	movaps	.LCPI8_7(%rip), %xmm0   # xmm0 = [91,115]
	movups	%xmm0, 64(%r14)
	movaps	.LCPI8_8(%rip), %xmm1   # xmm1 = [105,122]
	movups	%xmm1, 80(%r14)
	movaps	.LCPI8_9(%rip), %xmm2   # xmm2 = [101,45]
	movups	%xmm2, 96(%r14)
	movaps	.LCPI8_10(%rip), %xmm3  # xmm3 = [49,93]
	movups	%xmm3, 112(%r14)
	movups	%xmm0, 128(%r14)
	movups	%xmm1, 144(%r14)
	movups	%xmm2, 160(%r14)
	movups	%xmm3, 176(%r14)
	movaps	.LCPI8_2(%rip), %xmm0   # xmm0 = [32,61]
	movups	%xmm0, 192(%r14)
	movq	$32, 208(%r14)
	movl	$27, %esi
	movq	%r14, %rdi
	callq	printf_s
	movq	56(%rsp), %rax          # 8-byte Reload
	imulq	%rax, %rax
	movq	-8(%rbx,%rax,8), %rsi
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%edi, %edi
	movl	$25, %esi
	callq	create1DArray_int64_t
	movq	%rax, %rbx
	movaps	.LCPI8_11(%rip), %xmm0  # xmm0 = [80,97]
	movups	%xmm0, (%rbx)
	movaps	.LCPI8_12(%rip), %xmm0  # xmm0 = [115,115]
	movups	%xmm0, 16(%rbx)
	movaps	.LCPI8_13(%rip), %xmm0  # xmm0 = [32,77]
	movups	%xmm0, 32(%rbx)
	movaps	.LCPI8_14(%rip), %xmm0  # xmm0 = [97,116]
	movups	%xmm0, 48(%rbx)
	movaps	.LCPI8_15(%rip), %xmm0  # xmm0 = [114,105]
	movups	%xmm0, 64(%rbx)
	movaps	.LCPI8_16(%rip), %xmm0  # xmm0 = [120,77]
	movups	%xmm0, 80(%rbx)
	movaps	.LCPI8_17(%rip), %xmm0  # xmm0 = [117,108]
	movups	%xmm0, 96(%rbx)
	movaps	.LCPI8_18(%rip), %xmm0  # xmm0 = [116,32]
	movups	%xmm0, 112(%rbx)
	movaps	.LCPI8_19(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 128(%rbx)
	movaps	.LCPI8_20(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 144(%rbx)
	movaps	.LCPI8_21(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 160(%rbx)
	movaps	.LCPI8_22(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 176(%rbx)
	movq	$101, 192(%rbx)
	movl	$25, %esi
	movq	%rbx, %rdi
	callq	println_s
	movq	24(%rsp), %rcx          # 8-byte Reload
	movq	%rcx, %rbp
	testq	%rcx, %rcx
	je	.LBB8_2
# BB#1:                                 # %if.then165
	movq	(%rbp), %rdi
	callq	free
	movq	%rbp, %rdi
	callq	free
.LBB8_2:                                # %if.end166
	movq	64(%rsp), %rbp          # 8-byte Reload
	testq	%rbp, %rbp
	je	.LBB8_4
# BB#3:                                 # %if.then168
	movq	(%rbp), %rdi
	callq	free
	movq	%rbp, %rdi
	callq	free
.LBB8_4:                                # %if.end169
	testq	%r13, %r13
	movq	80(%rsp), %r15          # 8-byte Reload
	je	.LBB8_6
# BB#5:                                 # %if.then171
	movq	(%r13), %rdi
	callq	free
	movq	%r13, %rdi
	callq	free
.LBB8_6:                                # %if.end172
	movq	88(%rsp), %rdi          # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB8_8
# BB#7:                                 # %if.then174
	callq	free
.LBB8_8:                                # %if.end175
	movq	104(%rsp), %rdi         # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB8_10
# BB#9:                                 # %if.then177
	movq	8(%rsp), %rsi
	callq	free2DArray_int64_t
.LBB8_10:                               # %if.end181
	movq	96(%rsp), %rdi          # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB8_12
# BB#11:                                # %if.then183
	callq	free
.LBB8_12:                               # %if.end184
	testq	%r15, %r15
	je	.LBB8_14
# BB#13:                                # %if.then186
	movq	(%r15), %rdi
	callq	free
	movq	%r15, %rdi
	callq	free
.LBB8_14:                               # %if.end187
	movq	72(%rsp), %rbp          # 8-byte Reload
	testq	%rbp, %rbp
	je	.LBB8_16
# BB#15:                                # %if.then189
	movq	(%rbp), %rdi
	callq	free
	movq	%rbp, %rdi
	callq	free
.LBB8_16:                               # %if.end190
	testq	%r12, %r12
	je	.LBB8_18
# BB#17:                                # %if.then192
	movq	(%r12), %rdi
	callq	free
	movq	%r12, %rdi
	callq	free
.LBB8_18:                               # %if.end193
	testq	%r14, %r14
	je	.LBB8_20
# BB#19:                                # %if.then195
	movq	%r14, %rdi
	callq	free
.LBB8_20:                               # %if.end199
	testq	%rbx, %rbx
	je	.LBB8_22
# BB#21:                                # %if.then201
	movq	%rbx, %rdi
	callq	free
.LBB8_22:                               # %if.end202
	xorl	%edi, %edi
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
	.asciz	"%ld"
	.size	.L.str.3, 4

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	" height:"
	.size	.L.str.4, 9

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"%ld\n"
	.size	.L.str.6, 5


	.ident	"clang version 4.0.0 (http://llvm.org/git/clang.git 9b9db7fa41a1905899dbcbcc6cbdd05d2511da8e) (http://llvm.org/git/llvm.git fd456e365e09d54850dabc6a2f840a0c2eae7c27)"
	.section	".note.GNU-stack","",@progbits
