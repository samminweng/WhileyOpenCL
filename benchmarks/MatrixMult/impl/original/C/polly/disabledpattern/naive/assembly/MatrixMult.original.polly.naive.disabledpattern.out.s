	.text
	.file	"llvm/MatrixMult.original.polly.naive.disabledpattern.out.ll"
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
	pushq	%r13
.Lcfi24:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Lcfi25:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Lcfi26:
	.cfi_def_cfa_offset 48
.Lcfi27:
	.cfi_offset %rbx, -48
.Lcfi28:
	.cfi_offset %r12, -40
.Lcfi29:
	.cfi_offset %r13, -32
.Lcfi30:
	.cfi_offset %r14, -24
.Lcfi31:
	.cfi_offset %r15, -16
	movq	%rcx, %r13
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %r12
	movl	$32, %edi
	callq	malloc
	movq	%rax, %rbx
	movq	%r13, 8(%rbx)
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, (%rbx)
	movq	%r15, 24(%rbx)
	movq	%r12, 16(%rbx)
	movq	%rbx, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
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
.Lcfi32:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi33:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi34:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi35:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi36:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi37:
	.cfi_def_cfa_offset 56
	subq	$104, %rsp
.Lcfi38:
	.cfi_def_cfa_offset 160
.Lcfi39:
	.cfi_offset %rbx, -56
.Lcfi40:
	.cfi_offset %r12, -48
.Lcfi41:
	.cfi_offset %r13, -40
.Lcfi42:
	.cfi_offset %r14, -32
.Lcfi43:
	.cfi_offset %r15, -24
.Lcfi44:
	.cfi_offset %rbp, -16
	movq	%rsi, %rbx
	movq	%rbx, %rbp
	movq	%rdi, 8(%rsp)           # 8-byte Spill
	imulq	%rdi, %rbp
	xorl	%edi, %edi
	movq	%rbp, %rsi
	callq	create1DArray_int64_t
	movq	%rax, %rdi
	movq	%rbp, 64(%rsp)          # 8-byte Spill
	movq	%rbp, %rsi
	callq	copy1DArray_int64_t
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
	leaq	(,%rcx,8), %rbx
	addq	$16, %rdx
	movq	%rdx, 48(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 24(%rsp)          # 8-byte Spill
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
# BB#4:                                 # %polly.loop_header65.preheader
                                        #   in Loop: Header=BB5_3 Depth=1
	movq	24(%rsp), %r11          # 8-byte Reload
	shlq	$5, %r11
	movq	16(%rsp), %rcx          # 8-byte Reload
	subq	%r11, %rcx
	decq	%rcx
	cmpq	$32, %rcx
	movl	$31, %eax
	cmovgeq	%rax, %rcx
	movq	%rcx, 96(%rsp)          # 8-byte Spill
	leaq	-1(%rcx), %rax
	movq	48(%rsp), %r15          # 8-byte Reload
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB5_5:                                # %polly.loop_header65
                                        #   Parent Loop BB5_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_18 Depth 3
                                        #         Child Loop BB5_21 Depth 4
                                        #       Child Loop BB5_8 Depth 3
                                        #         Child Loop BB5_9 Depth 4
                                        #         Child Loop BB5_11 Depth 4
	cmpq	$0, 96(%rsp)            # 8-byte Folded Reload
	js	.LBB5_13
# BB#6:                                 # %polly.loop_header74.preheader
                                        #   in Loop: Header=BB5_5 Depth=2
	leaq	(,%r8,8), %rcx
	movq	88(%rsp), %rsi          # 8-byte Reload
	subq	%rcx, %rsi
	cmpq	$8, %rsi
	movl	$7, %ecx
	cmovgeq	%rcx, %rsi
	movq	%r8, %rcx
	shlq	$5, %rcx
	orq	$31, %rcx
	testq	%rsi, %rsi
	js	.LBB5_16
# BB#7:                                 # %polly.loop_header74.us.preheader
                                        #   in Loop: Header=BB5_5 Depth=2
	decq	%rsi
	cmpq	8(%rsp), %rcx           # 8-byte Folded Reload
	setl	%cl
	testq	%r14, %r14
	sete	%r13b
	orb	%cl, %r13b
	movq	32(%rsp), %r10          # 8-byte Reload
	movq	%r15, %rdx
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB5_8:                                # %polly.loop_header74.us
                                        #   Parent Loop BB5_3 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_9 Depth 4
                                        #         Child Loop BB5_11 Depth 4
	leaq	(%rbp,%r11), %r9
	movd	%r9, %xmm0
	pshufd	$68, %xmm0, %xmm0       # xmm0 = xmm0[0,1,0,1]
	movq	$-1, %rcx
	movq	%rdx, %r12
	.p2align	4, 0x90
.LBB5_9:                                # %polly.loop_header83.us
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
	incq	%rcx
	addq	$32, %r12
	cmpq	%rsi, %rcx
	jle	.LBB5_9
# BB#10:                                # %polly.cond.loopexit.us
                                        #   in Loop: Header=BB5_8 Depth=3
	testb	%r13b, %r13b
	movq	%r10, %rcx
	movq	%r14, %rdi
	jne	.LBB5_12
	.p2align	4, 0x90
.LBB5_11:                               # %polly.loop_header98.us
                                        #   Parent Loop BB5_3 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_8 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	addq	%r9, (%rcx)
	addq	$8, %rcx
	decq	%rdi
	jne	.LBB5_11
.LBB5_12:                               # %polly.merge.us
                                        #   in Loop: Header=BB5_8 Depth=3
	addq	%rbx, %rdx
	addq	%rbx, %r10
	cmpq	%rax, %rbp
	leaq	1(%rbp), %rbp
	jle	.LBB5_8
	jmp	.LBB5_13
	.p2align	4, 0x90
.LBB5_16:                               # %polly.loop_header74.preheader.split
                                        #   in Loop: Header=BB5_5 Depth=2
	cmpq	8(%rsp), %rcx           # 8-byte Folded Reload
	jl	.LBB5_13
# BB#17:                                # %polly.loop_header74.preheader177
                                        #   in Loop: Header=BB5_5 Depth=2
	movq	32(%rsp), %rsi          # 8-byte Reload
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB5_18:                               # %polly.loop_header74
                                        #   Parent Loop BB5_3 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_21 Depth 4
	testq	%r14, %r14
	je	.LBB5_19
# BB#20:                                # %polly.loop_header98.preheader
                                        #   in Loop: Header=BB5_18 Depth=3
	leaq	(%rbp,%r11), %rcx
	movq	%rsi, %rdx
	movq	%r14, %rdi
	.p2align	4, 0x90
.LBB5_21:                               # %polly.loop_header98
                                        #   Parent Loop BB5_3 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_18 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	addq	%rcx, (%rdx)
	addq	$8, %rdx
	decq	%rdi
	jne	.LBB5_21
.LBB5_19:                               # %polly.merge
                                        #   in Loop: Header=BB5_18 Depth=3
	addq	%rbx, %rsi
	cmpq	%rax, %rbp
	leaq	1(%rbp), %rbp
	jle	.LBB5_18
	.p2align	4, 0x90
.LBB5_13:                               # %polly.loop_exit76
                                        #   in Loop: Header=BB5_5 Depth=2
	addq	$256, %r15              # imm = 0x100
	cmpq	56(%rsp), %r8           # 8-byte Folded Reload
	leaq	1(%r8), %r8
	jne	.LBB5_5
.LBB5_14:                               # %polly.loop_exit67
                                        #   in Loop: Header=BB5_3 Depth=1
	movq	72(%rsp), %rax          # 8-byte Reload
	addq	%rax, 32(%rsp)          # 8-byte Folded Spill
	addq	%rax, 48(%rsp)          # 8-byte Folded Spill
	movq	24(%rsp), %rax          # 8-byte Reload
	cmpq	80(%rsp), %rax          # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	jne	.LBB5_3
.LBB5_15:                               # %blklab2
	movq	40(%rsp), %rdi          # 8-byte Reload
	movq	64(%rsp), %rbx          # 8-byte Reload
	movq	%rbx, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, %r12
	movl	$32, %edi
	callq	malloc
	movq	%rax, %r13
	movq	%rbx, 8(%r13)
	movq	%r12, %rdi
	movq	%rbx, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, (%r13)
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	%rax, 24(%r13)
	movq	8(%rsp), %rax           # 8-byte Reload
	movq	%rax, 16(%r13)
	movq	%r13, %rax
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
.Lcfi45:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi46:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi47:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi48:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi49:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi50:
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
.Lcfi51:
	.cfi_def_cfa_offset 80
.Lcfi52:
	.cfi_offset %rbx, -56
.Lcfi53:
	.cfi_offset %r12, -48
.Lcfi54:
	.cfi_offset %r13, -40
.Lcfi55:
	.cfi_offset %r14, -32
.Lcfi56:
	.cfi_offset %r15, -24
.Lcfi57:
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
.Lcfi58:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi59:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi60:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi61:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi62:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi63:
	.cfi_def_cfa_offset 56
	subq	$440, %rsp              # imm = 0x1B8
.Lcfi64:
	.cfi_def_cfa_offset 496
.Lcfi65:
	.cfi_offset %rbx, -56
.Lcfi66:
	.cfi_offset %r12, -48
.Lcfi67:
	.cfi_offset %r13, -40
.Lcfi68:
	.cfi_offset %r14, -32
.Lcfi69:
	.cfi_offset %r15, -24
.Lcfi70:
	.cfi_offset %rbp, -16
	movq	%rsi, %r12
	movq	%rdi, %r15
	movq	16(%r12), %rbx
	movq	24(%r15), %r14
	movq	%r14, %rbp
	imulq	%rbx, %rbp
	xorl	%edi, %edi
	movq	%rbp, %rsi
	callq	create1DArray_int64_t
	movq	%rax, %rdi
	movq	%rbp, 280(%rsp)         # 8-byte Spill
	movq	%rbp, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, %rbp
	movq	(%r15), %rdi
	movq	8(%r15), %rsi
	callq	copy1DArray_int64_t
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	(%r12), %rdi
	movq	8(%r12), %rsi
	callq	copy1DArray_int64_t
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	%r14, 48(%rsp)          # 8-byte Spill
	testq	%r14, %r14
	jle	.LBB7_15
# BB#1:                                 # %polly.split_new_and_old
	movq	48(%rsp), %rdx          # 8-byte Reload
	decq	%rdx
	seto	%cl
	movq	%rdx, 144(%rsp)         # 8-byte Spill
	imulq	%rbx, %rdx
	seto	%al
	addq	%rbx, %rdx
	seto	%r8b
	movq	24(%rsp), %rdi          # 8-byte Reload
	leaq	(%rdi,%rdx,8), %rsi
	cmpq	%rbp, %rsi
	setbe	%r9b
	leaq	(%rbp,%rdx,8), %rsi
	cmpq	%rdi, %rsi
	setbe	%dl
	orb	%r9b, %dl
	movq	%rbx, %rdi
	decq	%rdi
	seto	%r15b
	movq	%rbp, 40(%rsp)          # 8-byte Spill
	movq	%rdi, %r14
	movq	%rdi, %rbp
	imulq	%rbx, %rbp
	seto	%r11b
	movq	%rbx, 16(%rsp)          # 8-byte Spill
	addq	%rbx, %rbp
	seto	%r10b
	movq	32(%rsp), %rbx          # 8-byte Reload
	leaq	(%rbx,%rbp,8), %rbp
	cmpq	40(%rsp), %rbp          # 8-byte Folded Reload
	movq	40(%rsp), %rbp          # 8-byte Reload
	setbe	%r9b
	cmpq	%rbx, %rsi
	setbe	%bl
	cmpb	$1, %dl
	jne	.LBB7_4
# BB#2:                                 # %polly.split_new_and_old
	orb	%r9b, %bl
	je	.LBB7_4
# BB#3:                                 # %polly.split_new_and_old
	orb	%cl, %r10b
	orb	%al, %cl
	orb	%r15b, %cl
	orb	%r11b, %cl
	orb	%r8b, %cl
	orb	%r10b, %cl
	orb	%r8b, %al
	orb	%cl, %al
	xorb	$1, %al
	testb	$1, %al
	je	.LBB7_4
# BB#16:                                # %polly.start
	sarq	$5, 144(%rsp)           # 8-byte Folded Spill
	movq	16(%rsp), %rbx          # 8-byte Reload
	js	.LBB7_15
# BB#17:                                # %polly.loop_header.preheader
	movq	%r14, %rax
	sarq	$5, %rax
	movq	%rax, 152(%rsp)         # 8-byte Spill
	shrq	$5, %r14
	movq	%r14, 352(%rsp)         # 8-byte Spill
	movq	%rbx, %rax
	shrq	$2, %rax
	decq	%rax
	movq	%rax, 344(%rsp)         # 8-byte Spill
	movl	%ebx, %eax
	andl	$3, %eax
	movq	%rbx, %rdx
	andq	$-4, %rdx
	movq	%rax, 64(%rsp)          # 8-byte Spill
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
	movq	%rax, 128(%rsp)         # 8-byte Spill
	movq	%rbx, %r13
	shlq	$5, %r13
	leaq	(%rbx,%rbx,2), %rax
	movq	32(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rax,8), %rax
	movq	%rax, 304(%rsp)         # 8-byte Spill
	movq	%rbx, %rax
	shlq	$8, %rax
	movq	%rax, 168(%rsp)         # 8-byte Spill
	movq	24(%rsp), %rax          # 8-byte Reload
	leaq	24(%rax), %rax
	movq	%rax, 88(%rsp)          # 8-byte Spill
	leaq	(,%rbx,8), %rax
	movq	%rax, 392(%rsp)         # 8-byte Spill
	movq	%rbx, %rax
	shlq	$4, %rax
	addq	%rcx, %rax
	movq	%rax, 296(%rsp)         # 8-byte Spill
	leaq	(%rcx,%rbx,8), %rax
	movq	%rax, 288(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	%rdx, 56(%rsp)          # 8-byte Spill
	movq	%rdx, 160(%rsp)         # 8-byte Spill
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
	cmpq	$0, 152(%rsp)           # 8-byte Folded Reload
	js	.LBB7_32
# BB#19:                                # %polly.loop_header186.preheader
                                        #   in Loop: Header=BB7_18 Depth=1
	movq	80(%rsp), %rcx          # 8-byte Reload
	shlq	$5, %rcx
	movq	48(%rsp), %rdx          # 8-byte Reload
	movq	%rcx, %rax
	movq	%rax, 376(%rsp)         # 8-byte Spill
	subq	%rcx, %rdx
	decq	%rdx
	cmpq	$32, %rdx
	movl	$31, %eax
	cmovgeq	%rax, %rdx
	movq	%rdx, 360(%rsp)         # 8-byte Spill
	leaq	-1(%rdx), %rax
	movq	%rax, 400(%rsp)         # 8-byte Spill
	movq	288(%rsp), %rcx         # 8-byte Reload
	movq	296(%rsp), %r9          # 8-byte Reload
	movq	304(%rsp), %r8          # 8-byte Reload
	movq	32(%rsp), %rdi          # 8-byte Reload
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB7_20:                               # %polly.loop_header186
                                        #   Parent Loop BB7_18 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_21 Depth 3
                                        #         Child Loop BB7_23 Depth 4
                                        #           Child Loop BB7_43 Depth 5
                                        #             Child Loop BB7_51 Depth 6
                                        #           Child Loop BB7_26 Depth 5
                                        #             Child Loop BB7_27 Depth 6
                                        #             Child Loop BB7_36 Depth 6
	movq	%rax, 312(%rsp)         # 8-byte Spill
	shlq	$5, %rax
	movq	%rbx, %rdx
	movq	%rax, %rsi
	movq	%rsi, 248(%rsp)         # 8-byte Spill
	subq	%rax, %rdx
	decq	%rdx
	cmpq	$32, %rdx
	movl	$31, %eax
	cmovgeq	%rax, %rdx
	movq	%rdx, 408(%rsp)         # 8-byte Spill
	leaq	-1(%rdx), %rax
	movq	%rax, 264(%rsp)         # 8-byte Spill
	movq	%rdi, 104(%rsp)         # 8-byte Spill
	movq	%rdi, 208(%rsp)         # 8-byte Spill
	movq	%rcx, 336(%rsp)         # 8-byte Spill
	movq	%rcx, 200(%rsp)         # 8-byte Spill
	movq	%r9, 328(%rsp)          # 8-byte Spill
	movq	%r9, 192(%rsp)          # 8-byte Spill
	movq	88(%rsp), %rax          # 8-byte Reload
	movq	%rax, 176(%rsp)         # 8-byte Spill
	movq	%r8, 320(%rsp)          # 8-byte Spill
	movq	%r8, 184(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB7_21:                               # %polly.loop_header194
                                        #   Parent Loop BB7_18 Depth=1
                                        #     Parent Loop BB7_20 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB7_23 Depth 4
                                        #           Child Loop BB7_43 Depth 5
                                        #             Child Loop BB7_51 Depth 6
                                        #           Child Loop BB7_26 Depth 5
                                        #             Child Loop BB7_27 Depth 6
                                        #             Child Loop BB7_36 Depth 6
	cmpq	$0, 360(%rsp)           # 8-byte Folded Reload
	js	.LBB7_40
# BB#22:                                # %polly.loop_header202.preheader
                                        #   in Loop: Header=BB7_21 Depth=3
	cmpq	$0, 64(%rsp)            # 8-byte Folded Reload
	sete	%al
	movq	96(%rsp), %rdx          # 8-byte Reload
	leaq	(,%rdx,8), %rcx
	movq	344(%rsp), %rsi         # 8-byte Reload
	subq	%rcx, %rsi
	cmpq	$8, %rsi
	movl	$7, %ecx
	cmovgeq	%rcx, %rsi
	shlq	$5, %rdx
	orq	$31, %rdx
	movq	%rdx, 368(%rsp)         # 8-byte Spill
	cmpq	%rbx, %rdx
	setl	%cl
	movq	%rsi, 384(%rsp)         # 8-byte Spill
	leaq	-1(%rsi), %r12
	orb	%al, %cl
	movb	%cl, 15(%rsp)           # 1-byte Spill
	movq	176(%rsp), %rax         # 8-byte Reload
	movq	%rax, 136(%rsp)         # 8-byte Spill
	movq	160(%rsp), %rax         # 8-byte Reload
	movq	%rax, 120(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 112(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB7_23:                               # %polly.loop_header202
                                        #   Parent Loop BB7_18 Depth=1
                                        #     Parent Loop BB7_20 Depth=2
                                        #       Parent Loop BB7_21 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB7_43 Depth 5
                                        #             Child Loop BB7_51 Depth 6
                                        #           Child Loop BB7_26 Depth 5
                                        #             Child Loop BB7_27 Depth 6
                                        #             Child Loop BB7_36 Depth 6
	cmpq	$0, 408(%rsp)           # 8-byte Folded Reload
	js	.LBB7_39
# BB#24:                                # %polly.loop_header211.preheader
                                        #   in Loop: Header=BB7_23 Depth=4
	movq	376(%rsp), %rax         # 8-byte Reload
	movq	112(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	movq	16(%rsp), %rax          # 8-byte Reload
	imulq	%rax, %rcx
	cmpq	$0, 384(%rsp)           # 8-byte Folded Reload
	movq	%rcx, 256(%rsp)         # 8-byte Spill
	js	.LBB7_41
# BB#25:                                # %polly.loop_header211.us.preheader
                                        #   in Loop: Header=BB7_23 Depth=4
	movq	56(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	movq	%rax, 416(%rsp)         # 8-byte Spill
	movq	104(%rsp), %rax         # 8-byte Reload
	movq	%rax, 272(%rsp)         # 8-byte Spill
	movq	208(%rsp), %rsi         # 8-byte Reload
	movq	200(%rsp), %r14         # 8-byte Reload
	movq	192(%rsp), %r10         # 8-byte Reload
	movq	184(%rsp), %r9          # 8-byte Reload
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB7_26:                               # %polly.loop_header211.us
                                        #   Parent Loop BB7_18 Depth=1
                                        #     Parent Loop BB7_20 Depth=2
                                        #       Parent Loop BB7_21 Depth=3
                                        #         Parent Loop BB7_23 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB7_27 Depth 6
                                        #             Child Loop BB7_36 Depth 6
	movq	248(%rsp), %rax         # 8-byte Reload
	leaq	(%r15,%rax), %rax
	movq	%rax, 424(%rsp)         # 8-byte Spill
	leaq	(%rax,%rcx), %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	(%rbp,%rax,8), %r11
	movq	$-1, %rbx
	movq	%rsi, 432(%rsp)         # 8-byte Spill
	movq	%r14, %rdi
	movq	%r10, %rcx
	movq	136(%rsp), %r8          # 8-byte Reload
	movq	%r9, %rbp
	.p2align	4, 0x90
.LBB7_27:                               # %polly.loop_header221.us
                                        #   Parent Loop BB7_18 Depth=1
                                        #     Parent Loop BB7_20 Depth=2
                                        #       Parent Loop BB7_21 Depth=3
                                        #         Parent Loop BB7_23 Depth=4
                                        #           Parent Loop BB7_26 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	(%rsi), %rax
	imulq	-24(%r8), %rax
	addq	%r11, %rax
	movq	(%rdi), %rdx
	imulq	-16(%r8), %rdx
	addq	%rax, %rdx
	movq	(%rcx), %rax
	imulq	-8(%r8), %rax
	addq	%rdx, %rax
	movq	(%rbp), %r11
	imulq	(%r8), %r11
	addq	%rax, %r11
	incq	%rbx
	addq	%r13, %rbp
	addq	$32, %r8
	addq	%r13, %rcx
	addq	%r13, %rdi
	addq	%r13, %rsi
	cmpq	%r12, %rbx
	jle	.LBB7_27
# BB#28:                                # %polly.cond.loopexit.us
                                        #   in Loop: Header=BB7_26 Depth=5
	movq	40(%rsp), %rbp          # 8-byte Reload
	movq	72(%rsp), %rax          # 8-byte Reload
	movq	%r11, (%rbp,%rax,8)
	cmpb	$0, 15(%rsp)            # 1-byte Folded Reload
	jne	.LBB7_38
# BB#29:                                # %polly.loop_header240.us.preheader
                                        #   in Loop: Header=BB7_26 Depth=5
	cmpq	$0, 232(%rsp)           # 8-byte Folded Reload
	jne	.LBB7_33
# BB#30:                                #   in Loop: Header=BB7_26 Depth=5
                                        # implicit-def: %RCX
	xorl	%eax, %eax
	jmp	.LBB7_34
	.p2align	4, 0x90
.LBB7_33:                               # %polly.loop_header240.us.prol
                                        #   in Loop: Header=BB7_26 Depth=5
	movq	424(%rsp), %rcx         # 8-byte Reload
	addq	216(%rsp), %rcx         # 8-byte Folded Reload
	movq	32(%rsp), %rax          # 8-byte Reload
	movq	(%rax,%rcx,8), %rcx
	movq	24(%rsp), %rax          # 8-byte Reload
	movq	416(%rsp), %rdx         # 8-byte Reload
	imulq	(%rax,%rdx,8), %rcx
	addq	%r11, %rcx
	movq	%rcx, %r11
	movl	$1, %eax
.LBB7_34:                               # %polly.loop_header240.us.prol.loopexit
                                        #   in Loop: Header=BB7_26 Depth=5
	movq	128(%rsp), %r8          # 8-byte Reload
	cmpq	$0, 240(%rsp)           # 8-byte Folded Reload
	je	.LBB7_37
# BB#35:                                # %polly.loop_header240.us.preheader.new
                                        #   in Loop: Header=BB7_26 Depth=5
	movq	64(%rsp), %rsi          # 8-byte Reload
	subq	%rax, %rsi
	movq	224(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	movq	16(%rsp), %rdx          # 8-byte Reload
	imulq	%rdx, %rcx
	movq	272(%rsp), %rbx         # 8-byte Reload
	leaq	(%rbx,%rcx,8), %rdi
	movq	120(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	movq	24(%rsp), %rbp          # 8-byte Reload
	leaq	(%rbp,%rcx,8), %rbp
	addq	56(%rsp), %rax          # 8-byte Folded Reload
	imulq	%rdx, %rax
	leaq	(%rbx,%rax,8), %rbx
	xorl	%eax, %eax
	movq	%r11, %rcx
	.p2align	4, 0x90
.LBB7_36:                               # %polly.loop_header240.us
                                        #   Parent Loop BB7_18 Depth=1
                                        #     Parent Loop BB7_20 Depth=2
                                        #       Parent Loop BB7_21 Depth=3
                                        #         Parent Loop BB7_23 Depth=4
                                        #           Parent Loop BB7_26 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	(%rbx,%rax,8), %rdx
	imulq	(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rdi,%rax,8), %rcx
	imulq	8(%rbp), %rcx
	addq	%rdx, %rcx
	addq	%r8, %rax
	addq	$16, %rbp
	addq	$-2, %rsi
	jne	.LBB7_36
.LBB7_37:                               # %polly.merge.loopexit.us
                                        #   in Loop: Header=BB7_26 Depth=5
	movq	40(%rsp), %rbp          # 8-byte Reload
	movq	72(%rsp), %rax          # 8-byte Reload
	movq	%rcx, (%rbp,%rax,8)
.LBB7_38:                               # %polly.merge.us
                                        #   in Loop: Header=BB7_26 Depth=5
	addq	$8, %r9
	addq	$8, %r10
	addq	$8, %r14
	movq	432(%rsp), %rsi         # 8-byte Reload
	addq	$8, %rsi
	addq	$8, 272(%rsp)           # 8-byte Folded Spill
	cmpq	264(%rsp), %r15         # 8-byte Folded Reload
	leaq	1(%r15), %r15
	movq	256(%rsp), %rcx         # 8-byte Reload
	jle	.LBB7_26
	jmp	.LBB7_39
	.p2align	4, 0x90
.LBB7_41:                               # %polly.loop_header211.preheader.split
                                        #   in Loop: Header=BB7_23 Depth=4
	cmpq	%rax, 368(%rsp)         # 8-byte Folded Reload
	jl	.LBB7_39
# BB#42:                                # %polly.loop_header211.preheader384
                                        #   in Loop: Header=BB7_23 Depth=4
	movq	56(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%rcx), %r8
	movq	104(%rsp), %r11         # 8-byte Reload
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB7_43:                               # %polly.loop_header211
                                        #   Parent Loop BB7_18 Depth=1
                                        #     Parent Loop BB7_20 Depth=2
                                        #       Parent Loop BB7_21 Depth=3
                                        #         Parent Loop BB7_23 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB7_51 Depth 6
	cmpq	$0, 64(%rsp)            # 8-byte Folded Reload
	je	.LBB7_47
# BB#44:                                # %polly.loop_header240.preheader
                                        #   in Loop: Header=BB7_43 Depth=5
	movq	248(%rsp), %rax         # 8-byte Reload
	leaq	(%r14,%rax), %rax
	leaq	(%rax,%rcx), %r9
	cmpq	$0, 232(%rsp)           # 8-byte Folded Reload
	movq	(%rbp,%r9,8), %r10
	jne	.LBB7_48
# BB#45:                                #   in Loop: Header=BB7_43 Depth=5
                                        # implicit-def: %RAX
	xorl	%edx, %edx
	jmp	.LBB7_49
	.p2align	4, 0x90
.LBB7_48:                               # %polly.loop_header240.prol
                                        #   in Loop: Header=BB7_43 Depth=5
	addq	216(%rsp), %rax         # 8-byte Folded Reload
	movq	32(%rsp), %rcx          # 8-byte Reload
	movq	(%rcx,%rax,8), %rax
	movq	24(%rsp), %rcx          # 8-byte Reload
	imulq	(%rcx,%r8,8), %rax
	addq	%r10, %rax
	movq	%rax, %r10
	movl	$1, %edx
.LBB7_49:                               # %polly.loop_header240.prol.loopexit
                                        #   in Loop: Header=BB7_43 Depth=5
	cmpq	$0, 240(%rsp)           # 8-byte Folded Reload
	movq	128(%rsp), %r15         # 8-byte Reload
	je	.LBB7_46
# BB#50:                                # %polly.loop_header240.preheader.new
                                        #   in Loop: Header=BB7_43 Depth=5
	movq	64(%rsp), %rbp          # 8-byte Reload
	subq	%rdx, %rbp
	movq	224(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rdx), %rax
	movq	16(%rsp), %rsi          # 8-byte Reload
	imulq	%rsi, %rax
	leaq	(%r11,%rax,8), %rcx
	movq	120(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rdx), %rax
	movq	24(%rsp), %rdi          # 8-byte Reload
	leaq	(%rdi,%rax,8), %rdi
	addq	56(%rsp), %rdx          # 8-byte Folded Reload
	imulq	%rsi, %rdx
	leaq	(%r11,%rdx,8), %rbx
	xorl	%edx, %edx
	movq	%r10, %rax
	.p2align	4, 0x90
.LBB7_51:                               # %polly.loop_header240
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
	addq	%r15, %rdx
	addq	$16, %rdi
	addq	$-2, %rbp
	jne	.LBB7_51
.LBB7_46:                               # %polly.merge.loopexit
                                        #   in Loop: Header=BB7_43 Depth=5
	movq	40(%rsp), %rbp          # 8-byte Reload
	movq	%rax, (%rbp,%r9,8)
	movq	256(%rsp), %rcx         # 8-byte Reload
.LBB7_47:                               # %polly.merge
                                        #   in Loop: Header=BB7_43 Depth=5
	addq	$8, %r11
	cmpq	264(%rsp), %r14         # 8-byte Folded Reload
	leaq	1(%r14), %r14
	jle	.LBB7_43
	.p2align	4, 0x90
.LBB7_39:                               # %polly.loop_exit213
                                        #   in Loop: Header=BB7_23 Depth=4
	movq	16(%rsp), %rbx          # 8-byte Reload
	addq	%rbx, 120(%rsp)         # 8-byte Folded Spill
	movq	136(%rsp), %rax         # 8-byte Reload
	addq	392(%rsp), %rax         # 8-byte Folded Reload
	movq	%rax, 136(%rsp)         # 8-byte Spill
	movq	112(%rsp), %rax         # 8-byte Reload
	cmpq	400(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 112(%rsp)         # 8-byte Spill
	jle	.LBB7_23
.LBB7_40:                               # %polly.loop_exit204
                                        #   in Loop: Header=BB7_21 Depth=3
	movq	168(%rsp), %rax         # 8-byte Reload
	addq	%rax, 184(%rsp)         # 8-byte Folded Spill
	addq	$256, 176(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x100
	addq	%rax, 192(%rsp)         # 8-byte Folded Spill
	addq	%rax, 200(%rsp)         # 8-byte Folded Spill
	addq	%rax, 208(%rsp)         # 8-byte Folded Spill
	movq	96(%rsp), %rax          # 8-byte Reload
	cmpq	352(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	jne	.LBB7_21
# BB#31:                                # %polly.loop_exit196
                                        #   in Loop: Header=BB7_20 Depth=2
	movq	104(%rsp), %rdi         # 8-byte Reload
	addq	$256, %rdi              # imm = 0x100
	movq	320(%rsp), %r8          # 8-byte Reload
	addq	$256, %r8               # imm = 0x100
	movq	328(%rsp), %r9          # 8-byte Reload
	addq	$256, %r9               # imm = 0x100
	movq	336(%rsp), %rcx         # 8-byte Reload
	addq	$256, %rcx              # imm = 0x100
	movq	312(%rsp), %rax         # 8-byte Reload
	cmpq	152(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	jne	.LBB7_20
.LBB7_32:                               # %polly.loop_exit188
                                        #   in Loop: Header=BB7_18 Depth=1
	addq	%r13, 160(%rsp)         # 8-byte Folded Spill
	movq	88(%rsp), %rax          # 8-byte Reload
	addq	168(%rsp), %rax         # 8-byte Folded Reload
	movq	%rax, 88(%rsp)          # 8-byte Spill
	movq	80(%rsp), %rax          # 8-byte Reload
	cmpq	144(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	jne	.LBB7_18
	jmp	.LBB7_15
.LBB7_4:                                # %while.cond10.preheader.preheader
	movq	16(%rsp), %rbx          # 8-byte Reload
	testq	%rbx, %rbx
	jle	.LBB7_15
# BB#5:                                 # %while.cond10.preheader.us.preheader
	movl	%ebx, %r10d
	andl	$1, %r10d
	leaq	(%rbx,%rbx), %r12
	xorl	%r9d, %r9d
	xorl	%eax, %eax
	movq	40(%rsp), %r8           # 8-byte Reload
	.p2align	4, 0x90
.LBB7_6:                                # %while.cond10.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_7 Depth 2
                                        #       Child Loop BB7_12 Depth 3
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	%rax, %r11
	imulq	%rbx, %r11
	movq	32(%rsp), %r14          # 8-byte Reload
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB7_7:                                # %while.cond15.preheader.us.us
                                        #   Parent Loop BB7_6 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_12 Depth 3
	leaq	(%r15,%r11), %rdx
	testq	%r10, %r10
	movq	(%rbp,%rdx,8), %rax
	jne	.LBB7_9
# BB#8:                                 #   in Loop: Header=BB7_7 Depth=2
	xorl	%ecx, %ecx
	cmpq	$1, %rbx
	jne	.LBB7_11
	jmp	.LBB7_13
	.p2align	4, 0x90
.LBB7_9:                                # %if.end19.us.us.prol
                                        #   in Loop: Header=BB7_7 Depth=2
	movq	32(%rsp), %rcx          # 8-byte Reload
	movq	(%rcx,%r15,8), %rcx
	movq	24(%rsp), %rsi          # 8-byte Reload
	imulq	(%rsi,%r11,8), %rcx
	addq	%rcx, %rax
	movq	%rax, (%rbp,%rdx,8)
	movl	$1, %ecx
	cmpq	$1, %rbx
	je	.LBB7_13
.LBB7_11:                               # %while.cond15.preheader.us.us.new
                                        #   in Loop: Header=BB7_7 Depth=2
	movq	16(%rsp), %rdi          # 8-byte Reload
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
.LBB7_12:                               # %if.end19.us.us
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
	movq	16(%rsp), %rbx          # 8-byte Reload
	cmpq	%rbx, %r15
	movq	%r8, %rbp
	jne	.LBB7_7
# BB#14:                                # %blklab15.loopexit.us-lcssa.us.us
                                        #   in Loop: Header=BB7_6 Depth=1
	movq	72(%rsp), %rax          # 8-byte Reload
	incq	%rax
	addq	%rbx, %r9
	cmpq	48(%rsp), %rax          # 8-byte Folded Reload
	jne	.LBB7_6
.LBB7_15:                               # %blklab13
	movq	%rbp, %rdi
	movq	280(%rsp), %rbp         # 8-byte Reload
	movq	%rbp, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, %r15
	movl	$32, %edi
	callq	malloc
	movq	%rbx, %r14
	movq	%rax, %rbx
	movq	%rbp, 8(%rbx)
	movq	%r15, %rdi
	movq	%rbp, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, (%rbx)
	movq	48(%rsp), %rax          # 8-byte Reload
	movq	%rax, 24(%rbx)
	movq	%r14, 16(%rbx)
	movq	%rbx, %rax
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
	pushq	%r15
.Lcfi71:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Lcfi72:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Lcfi73:
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
.Lcfi74:
	.cfi_def_cfa_offset 48
.Lcfi75:
	.cfi_offset %rbx, -32
.Lcfi76:
	.cfi_offset %r14, -24
.Lcfi77:
	.cfi_offset %r15, -16
	movq	$0, 8(%rsp)
	movq	$0, (%rsp)
	leaq	8(%rsp), %rdx
	movq	%rsp, %rcx
	callq	convertArgsToIntArray
	movq	(%rax), %rdi
	callq	parseStringToInt
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
	movq	%rax, %rdi
	callq	copy_Matrix
	movq	%rax, %r14
	movq	%rbx, %rdi
	movq	%rbx, %rsi
	callq	_init_
	movq	%rax, %rdi
	callq	copy_Matrix
	movq	%rax, %r15
	movq	%r14, %rdi
	callq	copy_Matrix
	movq	%rax, %r14
	movq	%r15, %rdi
	callq	copy_Matrix
	movq	%r14, %rdi
	movq	%rax, %rsi
	callq	_mat_mult_
	movq	%rax, %rdi
	callq	copy_Matrix
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
