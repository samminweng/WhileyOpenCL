	.text
	.file	"llvm/MatrixMult.original.polly.nocopy.disabledpattern.out.ll"
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
	pushq	%r15
.Lcfi22:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Lcfi23:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Lcfi24:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Lcfi25:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Lcfi26:
	.cfi_def_cfa_offset 48
.Lcfi27:
	.cfi_offset %rbx, -40
.Lcfi28:
	.cfi_offset %r12, -32
.Lcfi29:
	.cfi_offset %r14, -24
.Lcfi30:
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
	.size	_matrix_, .Lfunc_end4-_matrix_
	.cfi_endproc

	.globl	_init_
	.p2align	4, 0x90
	.type	_init_,@function
_init_:                                 # @_init_
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Lcfi31:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi32:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi33:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi34:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi35:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi36:
	.cfi_def_cfa_offset 56
	subq	$104, %rsp
.Lcfi37:
	.cfi_def_cfa_offset 160
.Lcfi38:
	.cfi_offset %rbx, -56
.Lcfi39:
	.cfi_offset %r12, -48
.Lcfi40:
	.cfi_offset %r13, -40
.Lcfi41:
	.cfi_offset %r14, -32
.Lcfi42:
	.cfi_offset %r15, -24
.Lcfi43:
	.cfi_offset %rbp, -16
	movq	%rsi, %rbx
	movq	%rdi, 8(%rsp)           # 8-byte Spill
	imulq	%rdi, %rsi
	xorl	%edi, %edi
	movq	%rsi, 64(%rsp)          # 8-byte Spill
	callq	create1DArray_int64_t
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
# BB#4:                                 # %polly.loop_header60.preheader
                                        #   in Loop: Header=BB5_3 Depth=1
	movq	24(%rsp), %r11          # 8-byte Reload
	shlq	$5, %r11
	movq	16(%rsp), %rdx          # 8-byte Reload
	subq	%r11, %rdx
	decq	%rdx
	cmpq	$32, %rdx
	movl	$31, %ecx
	cmovgeq	%rcx, %rdx
	movq	%rdx, 96(%rsp)          # 8-byte Spill
	leaq	-1(%rdx), %r13
	movq	48(%rsp), %r15          # 8-byte Reload
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB5_5:                                # %polly.loop_header60
                                        #   Parent Loop BB5_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_18 Depth 3
                                        #         Child Loop BB5_21 Depth 4
                                        #       Child Loop BB5_8 Depth 3
                                        #         Child Loop BB5_9 Depth 4
                                        #         Child Loop BB5_11 Depth 4
	cmpq	$0, 96(%rsp)            # 8-byte Folded Reload
	js	.LBB5_13
# BB#6:                                 # %polly.loop_header69.preheader
                                        #   in Loop: Header=BB5_5 Depth=2
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
	js	.LBB5_16
# BB#7:                                 # %polly.loop_header69.us.preheader
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
.LBB5_8:                                # %polly.loop_header69.us
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
.LBB5_9:                                # %polly.loop_header78.us
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
.LBB5_11:                               # %polly.loop_header93.us
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
.LBB5_16:                               # %polly.loop_header69.preheader.split
                                        #   in Loop: Header=BB5_5 Depth=2
	cmpq	8(%rsp), %rcx           # 8-byte Folded Reload
	jl	.LBB5_13
# BB#17:                                # %polly.loop_header69.preheader172
                                        #   in Loop: Header=BB5_5 Depth=2
	movq	32(%rsp), %rdx          # 8-byte Reload
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB5_18:                               # %polly.loop_header69
                                        #   Parent Loop BB5_3 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_21 Depth 4
	testq	%r14, %r14
	je	.LBB5_19
# BB#20:                                # %polly.loop_header93.preheader
                                        #   in Loop: Header=BB5_18 Depth=3
	leaq	(%rbp,%r11), %rcx
	movq	%rdx, %rsi
	movq	%r14, %rdi
	.p2align	4, 0x90
.LBB5_21:                               # %polly.loop_header93
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
.LBB5_13:                               # %polly.loop_exit71
                                        #   in Loop: Header=BB5_5 Depth=2
	addq	$256, %r15              # imm = 0x100
	cmpq	56(%rsp), %r8           # 8-byte Folded Reload
	leaq	1(%r8), %r8
	jne	.LBB5_5
.LBB5_14:                               # %polly.loop_exit62
                                        #   in Loop: Header=BB5_3 Depth=1
	movq	72(%rsp), %rcx          # 8-byte Reload
	addq	%rcx, 32(%rsp)          # 8-byte Folded Spill
	addq	%rcx, 48(%rsp)          # 8-byte Folded Spill
	movq	24(%rsp), %rcx          # 8-byte Reload
	cmpq	80(%rsp), %rcx          # 8-byte Folded Reload
	leaq	1(%rcx), %rcx
	movq	%rcx, 24(%rsp)          # 8-byte Spill
	jne	.LBB5_3
.LBB5_15:                               # %blklab2
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
	.size	_init_, .Lfunc_end5-_init_
	.cfi_endproc

	.globl	_print_mat_
	.p2align	4, 0x90
	.type	_print_mat_,@function
_print_mat_:                            # @_print_mat_
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Lcfi44:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi45:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi46:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi47:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi48:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi49:
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
.Lcfi50:
	.cfi_def_cfa_offset 80
.Lcfi51:
	.cfi_offset %rbx, -56
.Lcfi52:
	.cfi_offset %r12, -48
.Lcfi53:
	.cfi_offset %r13, -40
.Lcfi54:
	.cfi_offset %r14, -32
.Lcfi55:
	.cfi_offset %r15, -24
.Lcfi56:
	.cfi_offset %rbp, -16
	movq	%rsi, %rbx
	movq	24(%rbx), %r14
	testq	%r14, %r14
	jle	.LBB6_7
# BB#1:                                 # %while.cond3.preheader.preheader
	movq	16(%rbx), %r15
	testq	%r15, %r15
	jle	.LBB6_6
# BB#2:                                 # %while.cond3.preheader.us.preheader
	leaq	(,%r15,8), %rcx
	movq	%rcx, 8(%rsp)           # 8-byte Spill
	xorl	%r12d, %r12d
	xorl	%ebp, %ebp
	movq	%r15, 16(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB6_3:                                # %while.cond3.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_4 Depth 2
	movq	%r12, %r13
	.p2align	4, 0x90
.LBB6_4:                                # %if.end7.us
                                        #   Parent Loop BB6_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rbx), %rax
	movq	(%rax,%r13), %rsi
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%edi, %edi
	movl	$1, %esi
	callq	create1DArray_int64_t
	movq	$32, (%rax)
	movl	$1, %esi
	movq	%rax, %rdi
	callq	printf_s
	addq	$8, %r13
	decq	%r15
	jne	.LBB6_4
# BB#5:                                 # %blklab8.loopexit.us
                                        #   in Loop: Header=BB6_3 Depth=1
	incq	%rbp
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	create1DArray_int64_t
	xorl	%esi, %esi
	movq	%rax, %rdi
	callq	println_s
	addq	8(%rsp), %r12           # 8-byte Folded Reload
	cmpq	%r14, %rbp
	movq	16(%rsp), %r15          # 8-byte Reload
	jne	.LBB6_3
	jmp	.LBB6_7
	.p2align	4, 0x90
.LBB6_6:                                # %while.cond3.preheader
                                        # =>This Inner Loop Header: Depth=1
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	create1DArray_int64_t
	xorl	%esi, %esi
	movq	%rax, %rdi
	callq	println_s
	decq	%r14
	jne	.LBB6_6
.LBB6_7:                                # %blklab6
	addq	$24, %rsp
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
.Lcfi57:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi58:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi59:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi60:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi61:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi62:
	.cfi_def_cfa_offset 56
	subq	$440, %rsp              # imm = 0x1B8
.Lcfi63:
	.cfi_def_cfa_offset 496
.Lcfi64:
	.cfi_offset %rbx, -56
.Lcfi65:
	.cfi_offset %r12, -48
.Lcfi66:
	.cfi_offset %r13, -40
.Lcfi67:
	.cfi_offset %r14, -32
.Lcfi68:
	.cfi_offset %r15, -24
.Lcfi69:
	.cfi_offset %rbp, -16
	movq	%rsi, %r15
	movq	%rdi, %r12
	movq	16(%r15), %rbx
	movq	24(%r12), %rbp
	movq	%rbp, %rsi
	imulq	%rbx, %rsi
	xorl	%edi, %edi
	movq	%rsi, 264(%rsp)         # 8-byte Spill
	callq	create1DArray_int64_t
	movq	%rbx, %rsi
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	%rbp, 40(%rsp)          # 8-byte Spill
	testq	%rbp, %rbp
	jle	.LBB7_15
# BB#1:                                 # %polly.split_new_and_old
	movq	(%r12), %r12
	movq	(%r15), %r15
	movq	%rsi, %rcx
	decq	%rcx
	seto	%al
	movq	%rcx, %r13
	imulq	%rsi, %rcx
	seto	%r11b
	addq	%rsi, %rcx
	seto	%r9b
	leaq	(%r15,%rcx,8), %rcx
	movq	16(%rsp), %rdi          # 8-byte Reload
	cmpq	%rdi, %rcx
	setbe	%r10b
	movq	40(%rsp), %rdx          # 8-byte Reload
	decq	%rdx
	seto	%r14b
	movq	%rdx, 136(%rsp)         # 8-byte Spill
	imulq	%rsi, %rdx
	seto	%r8b
	movq	%rsi, 8(%rsp)           # 8-byte Spill
	addq	%rsi, %rdx
	seto	%bl
	leaq	(%rdi,%rdx,8), %rbp
	movq	%r15, 32(%rsp)          # 8-byte Spill
	cmpq	%r15, %rbp
	setbe	%cl
	orb	%r10b, %cl
	leaq	(%r12,%rdx,8), %rdx
	cmpq	%rdi, %rdx
	setbe	%dl
	movq	%r12, 24(%rsp)          # 8-byte Spill
	cmpq	%r12, %rbp
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
# BB#16:                                # %polly.start
	sarq	$5, 136(%rsp)           # 8-byte Folded Spill
	movq	8(%rsp), %rsi           # 8-byte Reload
	js	.LBB7_15
# BB#17:                                # %polly.loop_header.preheader
	movq	%r13, %rax
	sarq	$5, %rax
	movq	%rax, 144(%rsp)         # 8-byte Spill
	shrq	$5, %r13
	movq	%r13, 336(%rsp)         # 8-byte Spill
	movq	%rsi, %rax
	shrq	$2, %rax
	decq	%rax
	movq	%rax, 328(%rsp)         # 8-byte Spill
	movl	%esi, %eax
	andl	$3, %eax
	movq	%rsi, %rdx
	andq	$-4, %rdx
	movq	%rax, 56(%rsp)          # 8-byte Spill
	decq	%rax
	movq	%rax, 232(%rsp)         # 8-byte Spill
	movl	%esi, %eax
	andl	$1, %eax
	movq	%rax, 224(%rsp)         # 8-byte Spill
	movq	%rdx, %rax
	imulq	%rsi, %rax
	movq	%rax, 208(%rsp)         # 8-byte Spill
	leaq	1(%rdx), %rax
	movq	%rax, 216(%rsp)         # 8-byte Spill
	leaq	(%rsi,%rsi), %rax
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	%rsi, %r13
	shlq	$5, %r13
	leaq	(%rsi,%rsi,2), %rax
	movq	32(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rax,8), %rax
	movq	%rax, 288(%rsp)         # 8-byte Spill
	movq	%rsi, %rax
	shlq	$8, %rax
	movq	%rax, 160(%rsp)         # 8-byte Spill
	movq	24(%rsp), %rax          # 8-byte Reload
	leaq	24(%rax), %rax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	leaq	(,%rsi,8), %rax
	movq	%rax, 376(%rsp)         # 8-byte Spill
	movq	%rsi, %rax
	shlq	$4, %rax
	addq	%rcx, %rax
	movq	%rax, 280(%rsp)         # 8-byte Spill
	leaq	(%rcx,%rsi,8), %rax
	movq	%rax, 272(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	%rdx, 48(%rsp)          # 8-byte Spill
	movq	%rdx, 152(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB7_18:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_20 Depth 2
                                        #       Child Loop BB7_21 Depth 3
                                        #         Child Loop BB7_23 Depth 4
                                        #           Child Loop BB7_43 Depth 5
                                        #             Child Loop BB7_51 Depth 6
                                        #           Child Loop BB7_26 Depth 5
                                        #             Child Loop BB7_27 Depth 6
                                        #             Child Loop BB7_36 Depth 6
	cmpq	$0, 144(%rsp)           # 8-byte Folded Reload
	js	.LBB7_32
# BB#19:                                # %polly.loop_header184.preheader
                                        #   in Loop: Header=BB7_18 Depth=1
	movq	72(%rsp), %rcx          # 8-byte Reload
	shlq	$5, %rcx
	movq	40(%rsp), %rdx          # 8-byte Reload
	movq	%rcx, %rax
	movq	%rax, 360(%rsp)         # 8-byte Spill
	subq	%rcx, %rdx
	decq	%rdx
	cmpq	$32, %rdx
	movl	$31, %eax
	cmovgeq	%rax, %rdx
	movq	%rdx, 344(%rsp)         # 8-byte Spill
	leaq	-1(%rdx), %rax
	movq	%rax, 384(%rsp)         # 8-byte Spill
	movq	272(%rsp), %rcx         # 8-byte Reload
	movq	280(%rsp), %rdx         # 8-byte Reload
	movq	288(%rsp), %r8          # 8-byte Reload
	movq	32(%rsp), %rbp          # 8-byte Reload
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB7_20:                               # %polly.loop_header184
                                        #   Parent Loop BB7_18 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_21 Depth 3
                                        #         Child Loop BB7_23 Depth 4
                                        #           Child Loop BB7_43 Depth 5
                                        #             Child Loop BB7_51 Depth 6
                                        #           Child Loop BB7_26 Depth 5
                                        #             Child Loop BB7_27 Depth 6
                                        #             Child Loop BB7_36 Depth 6
	movq	%rax, 296(%rsp)         # 8-byte Spill
	shlq	$5, %rax
	movq	%rsi, %rdi
	movq	%rax, %rbx
	movq	%rbx, 240(%rsp)         # 8-byte Spill
	subq	%rax, %rdi
	decq	%rdi
	cmpq	$32, %rdi
	movl	$31, %eax
	cmovgeq	%rax, %rdi
	movq	%rdi, 392(%rsp)         # 8-byte Spill
	leaq	-1(%rdi), %rax
	movq	%rax, 256(%rsp)         # 8-byte Spill
	movq	%rbp, 96(%rsp)          # 8-byte Spill
	movq	%rbp, 200(%rsp)         # 8-byte Spill
	movq	%rcx, 320(%rsp)         # 8-byte Spill
	movq	%rcx, 192(%rsp)         # 8-byte Spill
	movq	%rdx, 312(%rsp)         # 8-byte Spill
	movq	%rdx, 184(%rsp)         # 8-byte Spill
	movq	80(%rsp), %rax          # 8-byte Reload
	movq	%rax, 168(%rsp)         # 8-byte Spill
	movq	%r8, 304(%rsp)          # 8-byte Spill
	movq	%r8, 176(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 88(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB7_21:                               # %polly.loop_header192
                                        #   Parent Loop BB7_18 Depth=1
                                        #     Parent Loop BB7_20 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB7_23 Depth 4
                                        #           Child Loop BB7_43 Depth 5
                                        #             Child Loop BB7_51 Depth 6
                                        #           Child Loop BB7_26 Depth 5
                                        #             Child Loop BB7_27 Depth 6
                                        #             Child Loop BB7_36 Depth 6
	cmpq	$0, 344(%rsp)           # 8-byte Folded Reload
	js	.LBB7_40
# BB#22:                                # %polly.loop_header200.preheader
                                        #   in Loop: Header=BB7_21 Depth=3
	cmpq	$0, 56(%rsp)            # 8-byte Folded Reload
	sete	%al
	movq	88(%rsp), %rdi          # 8-byte Reload
	leaq	(,%rdi,8), %rcx
	movq	328(%rsp), %rbp         # 8-byte Reload
	subq	%rcx, %rbp
	movq	16(%rsp), %rbx          # 8-byte Reload
	cmpq	$8, %rbp
	movl	$7, %edx
	cmovgeq	%rdx, %rbp
	shlq	$5, %rdi
	orq	$31, %rdi
	movq	%rdi, 352(%rsp)         # 8-byte Spill
	cmpq	%rsi, %rdi
	setl	%dl
	movq	%rbp, 368(%rsp)         # 8-byte Spill
	leaq	-1(%rbp), %r15
	orb	%al, %dl
	movb	%dl, 7(%rsp)            # 1-byte Spill
	movq	168(%rsp), %rax         # 8-byte Reload
	movq	%rax, 128(%rsp)         # 8-byte Spill
	movq	152(%rsp), %rax         # 8-byte Reload
	movq	%rax, 112(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 104(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB7_23:                               # %polly.loop_header200
                                        #   Parent Loop BB7_18 Depth=1
                                        #     Parent Loop BB7_20 Depth=2
                                        #       Parent Loop BB7_21 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB7_43 Depth 5
                                        #             Child Loop BB7_51 Depth 6
                                        #           Child Loop BB7_26 Depth 5
                                        #             Child Loop BB7_27 Depth 6
                                        #             Child Loop BB7_36 Depth 6
	cmpq	$0, 392(%rsp)           # 8-byte Folded Reload
	js	.LBB7_39
# BB#24:                                # %polly.loop_header209.preheader
                                        #   in Loop: Header=BB7_23 Depth=4
	movq	360(%rsp), %rax         # 8-byte Reload
	movq	104(%rsp), %rdx         # 8-byte Reload
	leaq	(%rdx,%rax), %rdx
	movq	8(%rsp), %rax           # 8-byte Reload
	imulq	%rax, %rdx
	cmpq	$0, 368(%rsp)           # 8-byte Folded Reload
	movq	%rdx, 248(%rsp)         # 8-byte Spill
	js	.LBB7_41
# BB#25:                                # %polly.loop_header209.us.preheader
                                        #   in Loop: Header=BB7_23 Depth=4
	movq	48(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%rdx), %rax
	movq	%rax, 400(%rsp)         # 8-byte Spill
	movq	96(%rsp), %r14          # 8-byte Reload
	movq	200(%rsp), %rsi         # 8-byte Reload
	movq	192(%rsp), %rdi         # 8-byte Reload
	movq	184(%rsp), %r10         # 8-byte Reload
	movq	176(%rsp), %r9          # 8-byte Reload
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB7_26:                               # %polly.loop_header209.us
                                        #   Parent Loop BB7_18 Depth=1
                                        #     Parent Loop BB7_20 Depth=2
                                        #       Parent Loop BB7_21 Depth=3
                                        #         Parent Loop BB7_23 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB7_27 Depth 6
                                        #             Child Loop BB7_36 Depth 6
	movq	%r14, 424(%rsp)         # 8-byte Spill
	movq	240(%rsp), %rax         # 8-byte Reload
	leaq	(%r12,%rax), %rax
	movq	%rax, 408(%rsp)         # 8-byte Spill
	leaq	(%rax,%rdx), %rax
	movq	%rbx, %rcx
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	(%rbx,%rax,8), %r11
	movq	$-1, %rbx
	movq	%rsi, 432(%rsp)         # 8-byte Spill
	movq	%rsi, %rdx
	movq	%rdi, 416(%rsp)         # 8-byte Spill
	movq	%rdi, %r14
	movq	%r10, %rbp
	movq	128(%rsp), %r8          # 8-byte Reload
	movq	%r9, %rdi
	.p2align	4, 0x90
.LBB7_27:                               # %polly.loop_header219.us
                                        #   Parent Loop BB7_18 Depth=1
                                        #     Parent Loop BB7_20 Depth=2
                                        #       Parent Loop BB7_21 Depth=3
                                        #         Parent Loop BB7_23 Depth=4
                                        #           Parent Loop BB7_26 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	(%rdx), %rax
	imulq	-24(%r8), %rax
	addq	%r11, %rax
	movq	(%r14), %rsi
	imulq	-16(%r8), %rsi
	addq	%rax, %rsi
	movq	(%rbp), %rax
	imulq	-8(%r8), %rax
	addq	%rsi, %rax
	movq	(%rdi), %r11
	imulq	(%r8), %r11
	addq	%rax, %r11
	incq	%rbx
	addq	%r13, %rdi
	addq	$32, %r8
	addq	%r13, %rbp
	addq	%r13, %r14
	addq	%r13, %rdx
	cmpq	%r15, %rbx
	jle	.LBB7_27
# BB#28:                                # %polly.cond.loopexit.us
                                        #   in Loop: Header=BB7_26 Depth=5
	movq	%rcx, %rbx
	movq	64(%rsp), %rax          # 8-byte Reload
	movq	%r11, (%rbx,%rax,8)
	cmpb	$0, 7(%rsp)             # 1-byte Folded Reload
	movq	424(%rsp), %r14         # 8-byte Reload
	jne	.LBB7_38
# BB#29:                                # %polly.loop_header238.us.preheader
                                        #   in Loop: Header=BB7_26 Depth=5
	cmpq	$0, 224(%rsp)           # 8-byte Folded Reload
	jne	.LBB7_33
# BB#30:                                #   in Loop: Header=BB7_26 Depth=5
                                        # implicit-def: %RDX
	xorl	%eax, %eax
	jmp	.LBB7_34
	.p2align	4, 0x90
.LBB7_33:                               # %polly.loop_header238.us.prol
                                        #   in Loop: Header=BB7_26 Depth=5
	movq	408(%rsp), %rcx         # 8-byte Reload
	addq	208(%rsp), %rcx         # 8-byte Folded Reload
	movq	32(%rsp), %rax          # 8-byte Reload
	movq	(%rax,%rcx,8), %rdx
	movq	24(%rsp), %rax          # 8-byte Reload
	movq	400(%rsp), %rcx         # 8-byte Reload
	imulq	(%rax,%rcx,8), %rdx
	addq	%r11, %rdx
	movq	%rdx, %r11
	movl	$1, %eax
.LBB7_34:                               # %polly.loop_header238.us.prol.loopexit
                                        #   in Loop: Header=BB7_26 Depth=5
	movq	120(%rsp), %r8          # 8-byte Reload
	cmpq	$0, 232(%rsp)           # 8-byte Folded Reload
	je	.LBB7_37
# BB#35:                                # %polly.loop_header238.us.preheader.new
                                        #   in Loop: Header=BB7_26 Depth=5
	movq	56(%rsp), %rdi          # 8-byte Reload
	subq	%rax, %rdi
	movq	216(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	movq	8(%rsp), %rdx           # 8-byte Reload
	imulq	%rdx, %rcx
	leaq	(%r14,%rcx,8), %rbp
	movq	112(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	movq	24(%rsp), %rsi          # 8-byte Reload
	leaq	(%rsi,%rcx,8), %rbx
	addq	48(%rsp), %rax          # 8-byte Folded Reload
	imulq	%rdx, %rax
	leaq	(%r14,%rax,8), %rsi
	xorl	%eax, %eax
	movq	%r11, %rdx
	.p2align	4, 0x90
.LBB7_36:                               # %polly.loop_header238.us
                                        #   Parent Loop BB7_18 Depth=1
                                        #     Parent Loop BB7_20 Depth=2
                                        #       Parent Loop BB7_21 Depth=3
                                        #         Parent Loop BB7_23 Depth=4
                                        #           Parent Loop BB7_26 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	(%rsi,%rax,8), %rcx
	imulq	(%rbx), %rcx
	addq	%rdx, %rcx
	movq	(%rbp,%rax,8), %rdx
	imulq	8(%rbx), %rdx
	addq	%rcx, %rdx
	addq	%r8, %rax
	addq	$16, %rbx
	addq	$-2, %rdi
	jne	.LBB7_36
.LBB7_37:                               # %polly.merge.loopexit.us
                                        #   in Loop: Header=BB7_26 Depth=5
	movq	16(%rsp), %rbx          # 8-byte Reload
	movq	64(%rsp), %rax          # 8-byte Reload
	movq	%rdx, (%rbx,%rax,8)
.LBB7_38:                               # %polly.merge.us
                                        #   in Loop: Header=BB7_26 Depth=5
	addq	$8, %r9
	addq	$8, %r10
	movq	416(%rsp), %rdi         # 8-byte Reload
	addq	$8, %rdi
	movq	432(%rsp), %rsi         # 8-byte Reload
	addq	$8, %rsi
	addq	$8, %r14
	cmpq	256(%rsp), %r12         # 8-byte Folded Reload
	leaq	1(%r12), %r12
	movq	248(%rsp), %rdx         # 8-byte Reload
	jle	.LBB7_26
	jmp	.LBB7_39
	.p2align	4, 0x90
.LBB7_41:                               # %polly.loop_header209.preheader.split
                                        #   in Loop: Header=BB7_23 Depth=4
	cmpq	%rax, 352(%rsp)         # 8-byte Folded Reload
	jl	.LBB7_39
# BB#42:                                # %polly.loop_header209.preheader382
                                        #   in Loop: Header=BB7_23 Depth=4
	movq	48(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%rdx), %r8
	movq	96(%rsp), %r11          # 8-byte Reload
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB7_43:                               # %polly.loop_header209
                                        #   Parent Loop BB7_18 Depth=1
                                        #     Parent Loop BB7_20 Depth=2
                                        #       Parent Loop BB7_21 Depth=3
                                        #         Parent Loop BB7_23 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB7_51 Depth 6
	cmpq	$0, 56(%rsp)            # 8-byte Folded Reload
	je	.LBB7_47
# BB#44:                                # %polly.loop_header238.preheader
                                        #   in Loop: Header=BB7_43 Depth=5
	movq	240(%rsp), %rax         # 8-byte Reload
	leaq	(%r14,%rax), %rax
	leaq	(%rax,%rdx), %r9
	cmpq	$0, 224(%rsp)           # 8-byte Folded Reload
	movq	(%rbx,%r9,8), %r10
	jne	.LBB7_48
# BB#45:                                #   in Loop: Header=BB7_43 Depth=5
                                        # implicit-def: %RAX
	xorl	%edx, %edx
	jmp	.LBB7_49
	.p2align	4, 0x90
.LBB7_48:                               # %polly.loop_header238.prol
                                        #   in Loop: Header=BB7_43 Depth=5
	addq	208(%rsp), %rax         # 8-byte Folded Reload
	movq	32(%rsp), %rcx          # 8-byte Reload
	movq	(%rcx,%rax,8), %rax
	movq	24(%rsp), %rcx          # 8-byte Reload
	imulq	(%rcx,%r8,8), %rax
	addq	%r10, %rax
	movq	%rax, %r10
	movl	$1, %edx
.LBB7_49:                               # %polly.loop_header238.prol.loopexit
                                        #   in Loop: Header=BB7_43 Depth=5
	cmpq	$0, 232(%rsp)           # 8-byte Folded Reload
	movq	120(%rsp), %r12         # 8-byte Reload
	je	.LBB7_46
# BB#50:                                # %polly.loop_header238.preheader.new
                                        #   in Loop: Header=BB7_43 Depth=5
	movq	56(%rsp), %rbp          # 8-byte Reload
	subq	%rdx, %rbp
	movq	216(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rdx), %rax
	movq	8(%rsp), %rsi           # 8-byte Reload
	imulq	%rsi, %rax
	leaq	(%r11,%rax,8), %rcx
	movq	112(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rdx), %rax
	movq	24(%rsp), %rdi          # 8-byte Reload
	leaq	(%rdi,%rax,8), %rdi
	addq	48(%rsp), %rdx          # 8-byte Folded Reload
	imulq	%rsi, %rdx
	leaq	(%r11,%rdx,8), %rbx
	xorl	%edx, %edx
	movq	%r10, %rax
	.p2align	4, 0x90
.LBB7_51:                               # %polly.loop_header238
                                        #   Parent Loop BB7_18 Depth=1
                                        #     Parent Loop BB7_20 Depth=2
                                        #       Parent Loop BB7_21 Depth=3
                                        #         Parent Loop BB7_23 Depth=4
                                        #           Parent Loop BB7_43 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	(%rbx,%rdx,8), %rsi
	imulq	(%rdi), %rsi
	addq	%rax, %rsi
	movq	(%rcx,%rdx,8), %rax
	imulq	8(%rdi), %rax
	addq	%rsi, %rax
	addq	%r12, %rdx
	addq	$16, %rdi
	addq	$-2, %rbp
	jne	.LBB7_51
.LBB7_46:                               # %polly.merge.loopexit
                                        #   in Loop: Header=BB7_43 Depth=5
	movq	16(%rsp), %rbx          # 8-byte Reload
	movq	%rax, (%rbx,%r9,8)
	movq	248(%rsp), %rdx         # 8-byte Reload
.LBB7_47:                               # %polly.merge
                                        #   in Loop: Header=BB7_43 Depth=5
	addq	$8, %r11
	cmpq	256(%rsp), %r14         # 8-byte Folded Reload
	leaq	1(%r14), %r14
	jle	.LBB7_43
	.p2align	4, 0x90
.LBB7_39:                               # %polly.loop_exit211
                                        #   in Loop: Header=BB7_23 Depth=4
	movq	8(%rsp), %rsi           # 8-byte Reload
	addq	%rsi, 112(%rsp)         # 8-byte Folded Spill
	movq	128(%rsp), %rax         # 8-byte Reload
	addq	376(%rsp), %rax         # 8-byte Folded Reload
	movq	%rax, 128(%rsp)         # 8-byte Spill
	movq	104(%rsp), %rax         # 8-byte Reload
	cmpq	384(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 104(%rsp)         # 8-byte Spill
	jle	.LBB7_23
.LBB7_40:                               # %polly.loop_exit202
                                        #   in Loop: Header=BB7_21 Depth=3
	movq	160(%rsp), %rax         # 8-byte Reload
	addq	%rax, 176(%rsp)         # 8-byte Folded Spill
	addq	$256, 168(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x100
	addq	%rax, 184(%rsp)         # 8-byte Folded Spill
	addq	%rax, 192(%rsp)         # 8-byte Folded Spill
	addq	%rax, 200(%rsp)         # 8-byte Folded Spill
	movq	88(%rsp), %rax          # 8-byte Reload
	cmpq	336(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 88(%rsp)          # 8-byte Spill
	jne	.LBB7_21
# BB#31:                                # %polly.loop_exit194
                                        #   in Loop: Header=BB7_20 Depth=2
	movq	96(%rsp), %rbp          # 8-byte Reload
	addq	$256, %rbp              # imm = 0x100
	movq	304(%rsp), %r8          # 8-byte Reload
	addq	$256, %r8               # imm = 0x100
	movq	312(%rsp), %rdx         # 8-byte Reload
	addq	$256, %rdx              # imm = 0x100
	movq	320(%rsp), %rcx         # 8-byte Reload
	addq	$256, %rcx              # imm = 0x100
	movq	296(%rsp), %rax         # 8-byte Reload
	cmpq	144(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	jne	.LBB7_20
.LBB7_32:                               # %polly.loop_exit186
                                        #   in Loop: Header=BB7_18 Depth=1
	addq	%r13, 152(%rsp)         # 8-byte Folded Spill
	movq	80(%rsp), %rax          # 8-byte Reload
	addq	160(%rsp), %rax         # 8-byte Folded Reload
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	72(%rsp), %rax          # 8-byte Reload
	cmpq	136(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	jne	.LBB7_18
	jmp	.LBB7_15
.LBB7_4:                                # %while.cond7.preheader.preheader
	movq	8(%rsp), %rsi           # 8-byte Reload
	testq	%rsi, %rsi
	jle	.LBB7_15
# BB#5:                                 # %while.cond7.preheader.us.preheader
	movl	%esi, %r10d
	andl	$1, %r10d
	leaq	(%rsi,%rsi), %r12
	xorl	%r9d, %r9d
	xorl	%eax, %eax
	movq	16(%rsp), %r8           # 8-byte Reload
	.p2align	4, 0x90
.LBB7_6:                                # %while.cond7.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_7 Depth 2
                                        #       Child Loop BB7_12 Depth 3
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	%rax, %r11
	imulq	%rsi, %r11
	movq	32(%rsp), %r14          # 8-byte Reload
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB7_7:                                # %while.cond12.preheader.us.us
                                        #   Parent Loop BB7_6 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_12 Depth 3
	leaq	(%r15,%r11), %rdx
	testq	%r10, %r10
	movq	16(%rsp), %rdi          # 8-byte Reload
	movq	(%rdi,%rdx,8), %rax
	jne	.LBB7_9
# BB#8:                                 #   in Loop: Header=BB7_7 Depth=2
	xorl	%ecx, %ecx
	cmpq	$1, %rsi
	jne	.LBB7_11
	jmp	.LBB7_13
	.p2align	4, 0x90
.LBB7_9:                                # %if.end16.us.us.prol
                                        #   in Loop: Header=BB7_7 Depth=2
	movq	32(%rsp), %rcx          # 8-byte Reload
	movq	(%rcx,%r15,8), %rcx
	movq	24(%rsp), %rbp          # 8-byte Reload
	imulq	(%rbp,%r11,8), %rcx
	addq	%rcx, %rax
	movq	%rax, (%rdi,%rdx,8)
	movl	$1, %ecx
	cmpq	$1, %rsi
	je	.LBB7_13
.LBB7_11:                               # %while.cond12.preheader.us.us.new
                                        #   in Loop: Header=BB7_7 Depth=2
	movq	8(%rsp), %rdi           # 8-byte Reload
	movq	%rdi, %rbx
	subq	%rcx, %rbx
	leaq	1(%rcx), %rsi
	imulq	%rdi, %rsi
	leaq	(%r14,%rsi,8), %r13
	leaq	(%r9,%rcx), %rsi
	movq	24(%rsp), %rbp          # 8-byte Reload
	leaq	(%rbp,%rsi,8), %rbp
	imulq	%rdi, %rcx
	leaq	(%r14,%rcx,8), %rsi
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB7_12:                               # %if.end16.us.us
                                        #   Parent Loop BB7_6 Depth=1
                                        #     Parent Loop BB7_7 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	(%rsi,%rcx,8), %rdi
	imulq	(%rbp), %rdi
	addq	%rax, %rdi
	movq	%rdi, (%r8,%rdx,8)
	movq	(%r13,%rcx,8), %rax
	imulq	8(%rbp), %rax
	addq	%rdi, %rax
	movq	%rax, (%r8,%rdx,8)
	addq	%r12, %rcx
	addq	$16, %rbp
	addq	$-2, %rbx
	jne	.LBB7_12
.LBB7_13:                               # %blklab17.loopexit.us.us
                                        #   in Loop: Header=BB7_7 Depth=2
	incq	%r15
	addq	$8, %r14
	movq	8(%rsp), %rsi           # 8-byte Reload
	cmpq	%rsi, %r15
	jne	.LBB7_7
# BB#14:                                # %blklab15.loopexit.us-lcssa.us.us
                                        #   in Loop: Header=BB7_6 Depth=1
	movq	64(%rsp), %rax          # 8-byte Reload
	incq	%rax
	addq	%rsi, %r9
	cmpq	40(%rsp), %rax          # 8-byte Folded Reload
	jne	.LBB7_6
.LBB7_15:                               # %blklab13
	movl	$32, %edi
	movq	%rsi, %rbx
	callq	malloc
	movq	264(%rsp), %rcx         # 8-byte Reload
	movq	%rcx, 8(%rax)
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rcx, (%rax)
	movq	40(%rsp), %rcx          # 8-byte Reload
	movq	%rcx, 24(%rax)
	movq	%rbx, 16(%rax)
	addq	$440, %rsp              # imm = 0x1B8
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
	pushq	%r14
.Lcfi70:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Lcfi71:
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
.Lcfi72:
	.cfi_def_cfa_offset 48
.Lcfi73:
	.cfi_offset %rbx, -24
.Lcfi74:
	.cfi_offset %r14, -16
	movq	$0, 16(%rsp)
	movq	$0, 8(%rsp)
	leaq	16(%rsp), %rdx
	leaq	8(%rsp), %rcx
	callq	convertArgsToIntArray
	movq	(%rax), %rdi
	callq	parseStringToInt
	testq	%rax, %rax
	je	.LBB8_2
# BB#1:                                 # %if.end
	movq	(%rax), %rbx
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
	movq	%rax, %rdi
	callq	printf_s
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	printf
	movq	%rbx, %rdi
	movq	%rbx, %rsi
	callq	_init_
	movq	%rax, %r14
	movq	%rbx, %rdi
	movq	%rbx, %rsi
	callq	_init_
	movq	%r14, %rdi
	movq	%rax, %rsi
	callq	_mat_mult_
	movq	%rax, %r14
	xorl	%edi, %edi
	movl	$27, %esi
	callq	create1DArray_int64_t
	movaps	.LCPI8_3(%rip), %xmm0   # xmm0 = [77,97]
	movups	%xmm0, (%rax)
	movaps	.LCPI8_4(%rip), %xmm0   # xmm0 = [116,114]
	movups	%xmm0, 16(%rax)
	movaps	.LCPI8_5(%rip), %xmm0   # xmm0 = [105,120]
	movups	%xmm0, 32(%rax)
	movaps	.LCPI8_6(%rip), %xmm0   # xmm0 = [32,67]
	movups	%xmm0, 48(%rax)
	movaps	.LCPI8_7(%rip), %xmm0   # xmm0 = [91,115]
	movups	%xmm0, 64(%rax)
	movaps	.LCPI8_8(%rip), %xmm1   # xmm1 = [105,122]
	movups	%xmm1, 80(%rax)
	movaps	.LCPI8_9(%rip), %xmm2   # xmm2 = [101,45]
	movups	%xmm2, 96(%rax)
	movaps	.LCPI8_10(%rip), %xmm3  # xmm3 = [49,93]
	movups	%xmm3, 112(%rax)
	movups	%xmm0, 128(%rax)
	movups	%xmm1, 144(%rax)
	movups	%xmm2, 160(%rax)
	movups	%xmm3, 176(%rax)
	movaps	.LCPI8_2(%rip), %xmm0   # xmm0 = [32,61]
	movups	%xmm0, 192(%rax)
	movq	$32, 208(%rax)
	movl	$27, %esi
	movq	%rax, %rdi
	callq	printf_s
	movq	(%r14), %rax
	imulq	%rbx, %rbx
	movq	-8(%rax,%rbx,8), %rsi
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%edi, %edi
	movl	$25, %esi
	callq	create1DArray_int64_t
	movaps	.LCPI8_11(%rip), %xmm0  # xmm0 = [80,97]
	movups	%xmm0, (%rax)
	movaps	.LCPI8_12(%rip), %xmm0  # xmm0 = [115,115]
	movups	%xmm0, 16(%rax)
	movaps	.LCPI8_13(%rip), %xmm0  # xmm0 = [32,77]
	movups	%xmm0, 32(%rax)
	movaps	.LCPI8_14(%rip), %xmm0  # xmm0 = [97,116]
	movups	%xmm0, 48(%rax)
	movaps	.LCPI8_15(%rip), %xmm0  # xmm0 = [114,105]
	movups	%xmm0, 64(%rax)
	movaps	.LCPI8_16(%rip), %xmm0  # xmm0 = [120,77]
	movups	%xmm0, 80(%rax)
	movaps	.LCPI8_17(%rip), %xmm0  # xmm0 = [117,108]
	movups	%xmm0, 96(%rax)
	movaps	.LCPI8_18(%rip), %xmm0  # xmm0 = [116,32]
	movups	%xmm0, 112(%rax)
	movaps	.LCPI8_19(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 128(%rax)
	movaps	.LCPI8_20(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 144(%rax)
	movaps	.LCPI8_21(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 160(%rax)
	movaps	.LCPI8_22(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 176(%rax)
	movq	$101, 192(%rax)
	movl	$25, %esi
	movq	%rax, %rdi
	callq	println_s
.LBB8_2:                                # %blklab19
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
