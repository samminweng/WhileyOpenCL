	.text
	.file	"llvm/MatrixMult.original.openmp.naive_dealloc.disabledpattern.out.ll"
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
	subq	$40, %rsp
.Lcfi41:
	.cfi_def_cfa_offset 96
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
	movq	%rsi, %r13
	movq	%rdi, %r15
	movq	%r13, %rbx
	imulq	%r15, %rbx
	xorl	%edi, %edi
	movq	%rbx, %rsi
	callq	create1DArray_int64_t
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, %r12
	testq	%r13, %r13
	jle	.LBB5_1
# BB#6:                                 # %polly.parallel.for
	leaq	-1(%r13), %r8
	sarq	$5, %r8
	movq	%r15, 16(%rsp)
	movq	%r13, 24(%rsp)
	movq	%r12, 32(%rsp)
	incq	%r8
	leaq	16(%rsp), %rbp
	movl	$_init__polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%rbp, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbp, %rdi
	callq	_init__polly_subfn
	callq	GOMP_parallel_end
.LBB5_1:                                # %if.end28
	movq	%r12, %rdi
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
	movq	%r13, 24(%rbp)
	movq	%r15, 16(%rbp)
	movq	%r14, %rdi
	callq	free
	testq	%r12, %r12
	je	.LBB5_3
# BB#2:                                 # %if.then39
	movq	%r12, %rdi
	callq	free
.LBB5_3:                                # %if.end40
	movq	8(%rsp), %rdi           # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB5_5
# BB#4:                                 # %if.then42
	callq	free
.LBB5_5:                                # %if.end43
	movq	%rbp, %rax
	addq	$40, %rsp
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
	subq	$136, %rsp
.Lcfi67:
	.cfi_def_cfa_offset 192
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
	movl	%ecx, 36(%rsp)          # 4-byte Spill
	movq	%rdx, %r15
	movl	%esi, 32(%rsp)          # 4-byte Spill
	movq	%rdi, %r13
	movq	16(%r15), %rbx
	movq	24(%r13), %r12
	movq	%r12, %rbp
	imulq	%rbx, %rbp
	xorl	%edi, %edi
	movq	%rbp, %rsi
	callq	create1DArray_int64_t
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	%rax, %rdi
	movq	%rbp, 64(%rsp)          # 8-byte Spill
	movq	%rbp, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, %r14
	movq	(%r13), %rdi
	movq	%r13, 48(%rsp)          # 8-byte Spill
	movq	8(%r13), %rsi
	callq	copy1DArray_int64_t
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	(%r15), %rdi
	movq	%r15, 56(%rsp)          # 8-byte Spill
	movq	8(%r15), %rsi
	callq	copy1DArray_int64_t
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movq	%r12, 24(%rsp)          # 8-byte Spill
	testq	%r12, %r12
	jle	.LBB7_15
# BB#1:                                 # %polly.split_new_and_old
	movq	24(%rsp), %r8           # 8-byte Reload
	decq	%r8
	seto	%cl
	movq	%r8, %rdx
	imulq	%rbx, %rdx
	seto	%al
	addq	%rbx, %rdx
	seto	%r9b
	movq	16(%rsp), %rdi          # 8-byte Reload
	leaq	(%rdi,%rdx,8), %rsi
	cmpq	%r14, %rsi
	setbe	%sil
	leaq	(%r14,%rdx,8), %r12
	cmpq	%rdi, %r12
	setbe	%dl
	orb	%sil, %dl
	movq	%rbx, %rsi
	decq	%rsi
	seto	%r15b
	imulq	%rbx, %rsi
	seto	%dil
	addq	%rbx, %rsi
	seto	%r11b
	movq	8(%rsp), %rbp           # 8-byte Reload
	leaq	(%rbp,%rsi,8), %rsi
	cmpq	%r14, %rsi
	setbe	%r10b
	cmpq	%rbp, %r12
	setbe	%sil
	cmpb	$1, %dl
	jne	.LBB7_4
# BB#2:                                 # %polly.split_new_and_old
	orb	%r10b, %sil
	je	.LBB7_4
# BB#3:                                 # %polly.split_new_and_old
	orb	%cl, %r11b
	orb	%al, %cl
	orb	%r15b, %cl
	orb	%dil, %cl
	orb	%r9b, %cl
	orb	%r11b, %cl
	orb	%r9b, %al
	orb	%cl, %al
	xorb	$1, %al
	testb	$1, %al
	je	.LBB7_4
# BB#28:                                # %polly.parallel.for
	sarq	$5, %r8
	movq	%rbx, 96(%rsp)
	movq	24(%rsp), %rax          # 8-byte Reload
	movq	%rax, 104(%rsp)
	movq	%r14, 112(%rsp)
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	%rax, 120(%rsp)
	movq	8(%rsp), %rax           # 8-byte Reload
	movq	%rax, 128(%rsp)
	incq	%r8
	leaq	96(%rsp), %r15
	movl	$_mat_mult__polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r15, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%r15, %rdi
	callq	_mat_mult__polly_subfn
	callq	GOMP_parallel_end
	jmp	.LBB7_15
.LBB7_4:                                # %while.cond43.preheader.preheader
	testq	%rbx, %rbx
	jle	.LBB7_15
# BB#5:                                 # %while.cond43.preheader.us.preheader
	movl	%ebx, %r10d
	andl	$1, %r10d
	leaq	(%rbx,%rbx), %rcx
	xorl	%eax, %eax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%r10, 88(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB7_6:                                # %while.cond43.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_7 Depth 2
                                        #       Child Loop BB7_12 Depth 3
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	%rax, %rbp
	imulq	%rbx, %rbp
	movq	8(%rsp), %r15           # 8-byte Reload
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB7_7:                                # %while.cond48.preheader.us.us
                                        #   Parent Loop BB7_6 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_12 Depth 3
	leaq	(%r9,%rbp), %rdx
	testq	%r10, %r10
	movq	(%r14,%rdx,8), %rax
	jne	.LBB7_9
# BB#8:                                 #   in Loop: Header=BB7_7 Depth=2
	xorl	%r8d, %r8d
	jmp	.LBB7_10
	.p2align	4, 0x90
.LBB7_9:                                # %if.end52.us.us.prol
                                        #   in Loop: Header=BB7_7 Depth=2
	movq	8(%rsp), %rsi           # 8-byte Reload
	movq	(%rsi,%r9,8), %rsi
	movq	16(%rsp), %rdi          # 8-byte Reload
	imulq	(%rdi,%rbp,8), %rsi
	addq	%rsi, %rax
	movq	%rax, (%r14,%rdx,8)
	movl	$1, %r8d
.LBB7_10:                               # %if.end52.us.us.prol.loopexit
                                        #   in Loop: Header=BB7_7 Depth=2
	movq	%rbx, %r11
	cmpq	$1, %rbx
	je	.LBB7_13
# BB#11:                                # %while.cond48.preheader.us.us.new
                                        #   in Loop: Header=BB7_7 Depth=2
	movq	%rbp, %r12
	movq	%r11, %r10
	movq	%r10, %rdi
	subq	%r8, %rdi
	leaq	1(%r8), %rsi
	imulq	%r10, %rsi
	leaq	(%r15,%rsi,8), %rsi
	movq	40(%rsp), %rbx          # 8-byte Reload
	leaq	(%rbx,%r8), %rbx
	movq	16(%rsp), %rbp          # 8-byte Reload
	leaq	(%rbp,%rbx,8), %r13
	imulq	%r10, %r8
	movq	%r12, %rbp
	movq	88(%rsp), %r10          # 8-byte Reload
	leaq	(%r15,%r8,8), %r8
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB7_12:                               # %if.end52.us.us
                                        #   Parent Loop BB7_6 Depth=1
                                        #     Parent Loop BB7_7 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	(%r8,%r12,8), %rbx
	imulq	(%r13), %rbx
	addq	%rax, %rbx
	movq	%rbx, (%r14,%rdx,8)
	movq	(%rsi,%r12,8), %rax
	imulq	8(%r13), %rax
	addq	%rbx, %rax
	movq	%rax, (%r14,%rdx,8)
	addq	%rcx, %r12
	addq	$16, %r13
	addq	$-2, %rdi
	jne	.LBB7_12
.LBB7_13:                               # %blklab17.loopexit.us.us
                                        #   in Loop: Header=BB7_7 Depth=2
	incq	%r9
	addq	$8, %r15
	movq	%r11, %rbx
	cmpq	%rbx, %r9
	jne	.LBB7_7
# BB#14:                                # %blklab15.loopexit.us-lcssa.us.us
                                        #   in Loop: Header=BB7_6 Depth=1
	movq	80(%rsp), %rax          # 8-byte Reload
	incq	%rax
	addq	%rbx, 40(%rsp)          # 8-byte Folded Spill
	cmpq	24(%rsp), %rax          # 8-byte Folded Reload
	jne	.LBB7_6
.LBB7_15:                               # %if.end70
	movq	%r14, %rdi
	movq	64(%rsp), %r13          # 8-byte Reload
	movq	%r13, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, %r15
	movl	$32, %edi
	callq	malloc
	movq	%rax, %r12
	movq	%r13, 8(%r12)
	movq	%r15, %rdi
	movq	%r13, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, (%r12)
	movq	24(%rsp), %rax          # 8-byte Reload
	movq	%rax, 24(%r12)
	movq	%rbx, 16(%r12)
	movq	%r15, %rdi
	callq	free
	cmpb	$0, 32(%rsp)            # 1-byte Folded Reload
	je	.LBB7_17
# BB#16:                                # %if.then78
	movq	48(%rsp), %r15          # 8-byte Reload
	movq	(%r15), %rdi
	callq	free
	movq	%r15, %rdi
	callq	free
.LBB7_17:                               # %if.end79
	cmpb	$0, 36(%rsp)            # 1-byte Folded Reload
	je	.LBB7_19
# BB#18:                                # %if.then81
	movq	56(%rsp), %rbp          # 8-byte Reload
	movq	(%rbp), %rdi
	callq	free
	movq	%rbp, %rdi
	callq	free
.LBB7_19:                               # %if.end85
	testq	%r14, %r14
	je	.LBB7_21
# BB#20:                                # %if.then87
	movq	%r14, %rdi
	callq	free
.LBB7_21:                               # %if.end88
	movq	16(%rsp), %rdi          # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB7_23
# BB#22:                                # %if.then90
	callq	free
.LBB7_23:                               # %if.end91
	cmpq	$0, 8(%rsp)             # 8-byte Folded Reload
	je	.LBB7_25
# BB#24:                                # %if.then93
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	free
.LBB7_25:                               # %if.end94
	movq	72(%rsp), %rdi          # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB7_27
# BB#26:                                # %if.then96
	callq	free
.LBB7_27:                               # %if.end103
	movq	%r12, %rax
	addq	$136, %rsp
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

	.p2align	4, 0x90
	.type	_init__polly_subfn,@function
_init__polly_subfn:                     # @_init__polly_subfn
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Lcfi87:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi88:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi89:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi90:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi91:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi92:
	.cfi_def_cfa_offset 56
	subq	$136, %rsp
.Lcfi93:
	.cfi_def_cfa_offset 192
.Lcfi94:
	.cfi_offset %rbx, -56
.Lcfi95:
	.cfi_offset %r12, -48
.Lcfi96:
	.cfi_offset %r13, -40
.Lcfi97:
	.cfi_offset %r14, -32
.Lcfi98:
	.cfi_offset %r15, -24
.Lcfi99:
	.cfi_offset %rbp, -16
	movq	(%rdi), %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	8(%rdi), %rax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movq	16(%rdi), %rbx
	leaq	64(%rsp), %rdi
	leaq	56(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB9_2
# BB#1:                                 # %polly.par.loadIVBounds.lr.ph
	movq	32(%rsp), %rcx          # 8-byte Reload
	movl	%ecx, %ebp
	andl	$3, %ebp
	leaq	-1(%rcx), %rax
	sarq	$5, %rax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movq	%rcx, %rax
	shrq	$2, %rax
	decq	%rax
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movabsq	$2305843009213693948, %rax # imm = 0x1FFFFFFFFFFFFFFC
	andq	%rcx, %rax
	leaq	(%rbx,%rax,8), %rax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	%rcx, %rax
	shlq	$5, %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	%rcx, %rax
	shlq	$8, %rax
	movq	%rax, 104(%rsp)         # 8-byte Spill
	leaq	(,%rcx,8), %r12
	addq	$16, %rbx
	movq	%rbx, 88(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB9_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB9_5 Depth 2
                                        #       Child Loop BB9_7 Depth 3
                                        #         Child Loop BB9_19 Depth 4
                                        #           Child Loop BB9_20 Depth 5
                                        #         Child Loop BB9_10 Depth 4
                                        #           Child Loop BB9_11 Depth 5
                                        #           Child Loop BB9_13 Depth 5
	movq	56(%rsp), %rax
	movq	64(%rsp), %rcx
	addq	$-2, %rax
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movq	72(%rsp), %rax          # 8-byte Reload
	movq	%rcx, (%rsp)            # 8-byte Spill
	imulq	%rcx, %rax
	movq	80(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rax,8), %rcx
	movq	%rcx, 8(%rsp)           # 8-byte Spill
	movq	88(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rax,8), %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB9_5:                                # %polly.loop_header
                                        #   Parent Loop BB9_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB9_7 Depth 3
                                        #         Child Loop BB9_19 Depth 4
                                        #           Child Loop BB9_20 Depth 5
                                        #         Child Loop BB9_10 Depth 4
                                        #           Child Loop BB9_11 Depth 5
                                        #           Child Loop BB9_13 Depth 5
	cmpq	$0, 40(%rsp)            # 8-byte Folded Reload
	js	.LBB9_16
# BB#6:                                 # %polly.loop_header2.preheader
                                        #   in Loop: Header=BB9_5 Depth=2
	movq	(%rsp), %r11            # 8-byte Reload
	shlq	$5, %r11
	movq	96(%rsp), %rcx          # 8-byte Reload
	subq	%r11, %rcx
	decq	%rcx
	cmpq	$32, %rcx
	movl	$31, %eax
	cmovgeq	%rax, %rcx
	movq	%rcx, 128(%rsp)         # 8-byte Spill
	leaq	-1(%rcx), %rsi
	movq	24(%rsp), %rax          # 8-byte Reload
	movq	%rax, 48(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB9_7:                                # %polly.loop_header2
                                        #   Parent Loop BB9_4 Depth=1
                                        #     Parent Loop BB9_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB9_19 Depth 4
                                        #           Child Loop BB9_20 Depth 5
                                        #         Child Loop BB9_10 Depth 4
                                        #           Child Loop BB9_11 Depth 5
                                        #           Child Loop BB9_13 Depth 5
	cmpq	$0, 128(%rsp)           # 8-byte Folded Reload
	js	.LBB9_15
# BB#8:                                 # %polly.loop_header10.preheader
                                        #   in Loop: Header=BB9_7 Depth=3
	testq	%rbp, %rbp
	sete	%al
	movq	16(%rsp), %rdi          # 8-byte Reload
	leaq	(,%rdi,8), %rcx
	movq	120(%rsp), %rdx         # 8-byte Reload
	subq	%rcx, %rdx
	cmpq	$8, %rdx
	movl	$7, %ecx
	cmovgeq	%rcx, %rdx
	movq	%rdi, %rcx
	shlq	$5, %rcx
	orq	$31, %rcx
	cmpq	32(%rsp), %rcx          # 8-byte Folded Reload
	setl	%r8b
	orb	%al, %r8b
	testq	%rdx, %rdx
	js	.LBB9_17
# BB#9:                                 # %polly.loop_header10.us.preheader
                                        #   in Loop: Header=BB9_7 Depth=3
	decq	%rdx
	movq	8(%rsp), %r9            # 8-byte Reload
	movq	48(%rsp), %r14          # 8-byte Reload
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB9_10:                               # %polly.loop_header10.us
                                        #   Parent Loop BB9_4 Depth=1
                                        #     Parent Loop BB9_5 Depth=2
                                        #       Parent Loop BB9_7 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB9_11 Depth 5
                                        #           Child Loop BB9_13 Depth 5
	leaq	(%r13,%r11), %r15
	movd	%r15, %xmm0
	pshufd	$68, %xmm0, %xmm0       # xmm0 = xmm0[0,1,0,1]
	movq	$-1, %rax
	movq	%r14, %r10
	.p2align	4, 0x90
.LBB9_11:                               # %polly.loop_header19.us
                                        #   Parent Loop BB9_4 Depth=1
                                        #     Parent Loop BB9_5 Depth=2
                                        #       Parent Loop BB9_7 Depth=3
                                        #         Parent Loop BB9_10 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movdqu	-16(%r10), %xmm1
	paddq	%xmm0, %xmm1
	movdqu	%xmm1, -16(%r10)
	movdqu	(%r10), %xmm1
	paddq	%xmm0, %xmm1
	movdqu	%xmm1, (%r10)
	incq	%rax
	addq	$32, %r10
	cmpq	%rdx, %rax
	jle	.LBB9_11
# BB#12:                                # %polly.cond.loopexit.us
                                        #   in Loop: Header=BB9_10 Depth=4
	testb	%r8b, %r8b
	movq	%r9, %rax
	movq	%rbp, %rcx
	jne	.LBB9_14
	.p2align	4, 0x90
.LBB9_13:                               # %polly.loop_header34.us
                                        #   Parent Loop BB9_4 Depth=1
                                        #     Parent Loop BB9_5 Depth=2
                                        #       Parent Loop BB9_7 Depth=3
                                        #         Parent Loop BB9_10 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	addq	%r15, (%rax)
	addq	$8, %rax
	decq	%rcx
	jne	.LBB9_13
.LBB9_14:                               # %polly.merge.us
                                        #   in Loop: Header=BB9_10 Depth=4
	addq	%r12, %r14
	addq	%r12, %r9
	cmpq	%rsi, %r13
	leaq	1(%r13), %r13
	jle	.LBB9_10
	jmp	.LBB9_15
	.p2align	4, 0x90
.LBB9_17:                               # %polly.loop_header10.preheader.split
                                        #   in Loop: Header=BB9_7 Depth=3
	testb	%r8b, %r8b
	jne	.LBB9_15
# BB#18:                                # %polly.loop_header10.preheader110
                                        #   in Loop: Header=BB9_7 Depth=3
	movq	8(%rsp), %rbx           # 8-byte Reload
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB9_19:                               # %polly.loop_header10
                                        #   Parent Loop BB9_4 Depth=1
                                        #     Parent Loop BB9_5 Depth=2
                                        #       Parent Loop BB9_7 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB9_20 Depth 5
	leaq	(%rax,%r11), %rcx
	movq	%rbx, %rdx
	movq	%rbp, %rdi
	.p2align	4, 0x90
.LBB9_20:                               # %polly.loop_header34
                                        #   Parent Loop BB9_4 Depth=1
                                        #     Parent Loop BB9_5 Depth=2
                                        #       Parent Loop BB9_7 Depth=3
                                        #         Parent Loop BB9_19 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	addq	%rcx, (%rdx)
	addq	$8, %rdx
	decq	%rbp
	jne	.LBB9_20
# BB#21:                                # %polly.merge
                                        #   in Loop: Header=BB9_19 Depth=4
	addq	%r12, %rbx
	cmpq	%rsi, %rax
	leaq	1(%rax), %rax
	movq	%rdi, %rbp
	jle	.LBB9_19
	.p2align	4, 0x90
.LBB9_15:                               # %polly.loop_exit12
                                        #   in Loop: Header=BB9_7 Depth=3
	addq	$256, 48(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	movq	16(%rsp), %rax          # 8-byte Reload
	cmpq	40(%rsp), %rax          # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	jne	.LBB9_7
.LBB9_16:                               # %polly.loop_exit4
                                        #   in Loop: Header=BB9_5 Depth=2
	movq	104(%rsp), %rax         # 8-byte Reload
	addq	%rax, 8(%rsp)           # 8-byte Folded Spill
	addq	%rax, 24(%rsp)          # 8-byte Folded Spill
	movq	(%rsp), %rax            # 8-byte Reload
	cmpq	112(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, (%rsp)            # 8-byte Spill
	jle	.LBB9_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB9_4 Depth=1
	leaq	64(%rsp), %rdi
	leaq	56(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB9_4
.LBB9_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$136, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end9:
	.size	_init__polly_subfn, .Lfunc_end9-_init__polly_subfn
	.cfi_endproc

	.p2align	4, 0x90
	.type	_mat_mult__polly_subfn,@function
_mat_mult__polly_subfn:                 # @_mat_mult__polly_subfn
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Lcfi100:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi101:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi102:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi103:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi104:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi105:
	.cfi_def_cfa_offset 56
	subq	$456, %rsp              # imm = 0x1C8
.Lcfi106:
	.cfi_def_cfa_offset 512
.Lcfi107:
	.cfi_offset %rbx, -56
.Lcfi108:
	.cfi_offset %r12, -48
.Lcfi109:
	.cfi_offset %r13, -40
.Lcfi110:
	.cfi_offset %r14, -32
.Lcfi111:
	.cfi_offset %r15, -24
.Lcfi112:
	.cfi_offset %rbp, -16
	movq	(%rdi), %rax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	8(%rdi), %rax
	movq	%rax, 296(%rsp)         # 8-byte Spill
	movq	16(%rdi), %rbp
	movq	24(%rdi), %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	32(%rdi), %rax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	leaq	256(%rsp), %rdi
	leaq	248(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB10_2
# BB#1:                                 # %polly.par.loadIVBounds.lr.ph
	movq	16(%rsp), %rcx          # 8-byte Reload
	movl	%ecx, %eax
	andl	$3, %eax
	leaq	-1(%rcx), %rdx
	movq	%rdx, %rsi
	shrq	$5, %rsi
	movq	%rsi, 352(%rsp)         # 8-byte Spill
	sarq	$5, %rdx
	movq	%rdx, 112(%rsp)         # 8-byte Spill
	movq	%rcx, %rdx
	shrq	$2, %rdx
	decq	%rdx
	movq	%rdx, 344(%rsp)         # 8-byte Spill
	movq	%rcx, %rdx
	andq	$-4, %rdx
	movq	%rax, 96(%rsp)          # 8-byte Spill
	decq	%rax
	movq	%rax, 200(%rsp)         # 8-byte Spill
	movl	%ecx, %eax
	andl	$1, %eax
	movq	%rax, 192(%rsp)         # 8-byte Spill
	movq	%rdx, %rax
	imulq	%rcx, %rax
	movq	%rax, 176(%rsp)         # 8-byte Spill
	movq	%rdx, 24(%rsp)          # 8-byte Spill
	leaq	1(%rdx), %rax
	movq	%rax, 184(%rsp)         # 8-byte Spill
	leaq	(%rcx,%rcx), %r13
	movq	%rcx, %r14
	shlq	$5, %r14
	leaq	(%rcx,%rcx,2), %rax
	movq	40(%rsp), %rdx          # 8-byte Reload
	leaq	(%rdx,%rax,8), %rax
	movq	%rax, 288(%rsp)         # 8-byte Spill
	movq	%rcx, %rax
	shlq	$8, %rax
	movq	%rax, 128(%rsp)         # 8-byte Spill
	movq	32(%rsp), %rax          # 8-byte Reload
	leaq	24(%rax), %rax
	movq	%rax, 264(%rsp)         # 8-byte Spill
	movq	%rcx, %rax
	shlq	$4, %rax
	addq	%rdx, %rax
	movq	%rax, 280(%rsp)         # 8-byte Spill
	leaq	(,%rcx,8), %rax
	movq	%rax, 384(%rsp)         # 8-byte Spill
	leaq	(%rdx,%rcx,8), %rax
	movq	%rax, 272(%rsp)         # 8-byte Spill
	movq	%rbp, 208(%rsp)         # 8-byte Spill
	movq	%r13, 416(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB10_4:                               # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB10_5 Depth 2
                                        #       Child Loop BB10_7 Depth 3
                                        #         Child Loop BB10_8 Depth 4
                                        #           Child Loop BB10_10 Depth 5
                                        #             Child Loop BB10_30 Depth 6
                                        #               Child Loop BB10_35 Depth 7
                                        #             Child Loop BB10_13 Depth 6
                                        #               Child Loop BB10_14 Depth 7
                                        #               Child Loop BB10_23 Depth 7
	movq	248(%rsp), %rax
	movq	256(%rsp), %rcx
	addq	$-2, %rax
	movq	%rax, 304(%rsp)         # 8-byte Spill
	movq	%r14, %rax
	movq	%rcx, 56(%rsp)          # 8-byte Spill
	imulq	%rcx, %rax
	movq	24(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	movq	%rcx, 120(%rsp)         # 8-byte Spill
	movq	264(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %rax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB10_5:                               # %polly.loop_header
                                        #   Parent Loop BB10_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB10_7 Depth 3
                                        #         Child Loop BB10_8 Depth 4
                                        #           Child Loop BB10_10 Depth 5
                                        #             Child Loop BB10_30 Depth 6
                                        #               Child Loop BB10_35 Depth 7
                                        #             Child Loop BB10_13 Depth 6
                                        #               Child Loop BB10_14 Depth 7
                                        #               Child Loop BB10_23 Depth 7
	cmpq	$0, 112(%rsp)           # 8-byte Folded Reload
	js	.LBB10_19
# BB#6:                                 # %polly.loop_header3.preheader
                                        #   in Loop: Header=BB10_5 Depth=2
	movq	56(%rsp), %rcx          # 8-byte Reload
	shlq	$5, %rcx
	movq	296(%rsp), %rdx         # 8-byte Reload
	movq	%rcx, %rax
	movq	%rax, 368(%rsp)         # 8-byte Spill
	subq	%rcx, %rdx
	decq	%rdx
	cmpq	$32, %rdx
	movl	$31, %eax
	cmovgeq	%rax, %rdx
	movq	%rdx, 360(%rsp)         # 8-byte Spill
	leaq	-1(%rdx), %rax
	movq	%rax, 392(%rsp)         # 8-byte Spill
	movq	272(%rsp), %rcx         # 8-byte Reload
	movq	280(%rsp), %rdx         # 8-byte Reload
	movq	288(%rsp), %r8          # 8-byte Reload
	movq	40(%rsp), %rdi          # 8-byte Reload
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB10_7:                               # %polly.loop_header3
                                        #   Parent Loop BB10_4 Depth=1
                                        #     Parent Loop BB10_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB10_8 Depth 4
                                        #           Child Loop BB10_10 Depth 5
                                        #             Child Loop BB10_30 Depth 6
                                        #               Child Loop BB10_35 Depth 7
                                        #             Child Loop BB10_13 Depth 6
                                        #               Child Loop BB10_14 Depth 7
                                        #               Child Loop BB10_23 Depth 7
	movq	%rax, 312(%rsp)         # 8-byte Spill
	shlq	$5, %rax
	movq	16(%rsp), %rsi          # 8-byte Reload
	movq	%rbp, %rbx
	movq	%rax, %rbp
	movq	%rbp, 224(%rsp)         # 8-byte Spill
	movq	%rbx, %rbp
	subq	%rax, %rsi
	decq	%rsi
	cmpq	$32, %rsi
	movl	$31, %eax
	cmovgeq	%rax, %rsi
	movq	%rsi, 400(%rsp)         # 8-byte Spill
	leaq	-1(%rsi), %rax
	movq	%rax, 216(%rsp)         # 8-byte Spill
	movq	%rdi, 80(%rsp)          # 8-byte Spill
	movq	%rdi, 168(%rsp)         # 8-byte Spill
	movq	%rcx, 336(%rsp)         # 8-byte Spill
	movq	%rcx, 160(%rsp)         # 8-byte Spill
	movq	%rdx, 328(%rsp)         # 8-byte Spill
	movq	%rdx, 152(%rsp)         # 8-byte Spill
	movq	64(%rsp), %rax          # 8-byte Reload
	movq	%rax, 136(%rsp)         # 8-byte Spill
	movq	%r8, 320(%rsp)          # 8-byte Spill
	movq	%r8, 144(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB10_8:                               # %polly.loop_header10
                                        #   Parent Loop BB10_4 Depth=1
                                        #     Parent Loop BB10_5 Depth=2
                                        #       Parent Loop BB10_7 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB10_10 Depth 5
                                        #             Child Loop BB10_30 Depth 6
                                        #               Child Loop BB10_35 Depth 7
                                        #             Child Loop BB10_13 Depth 6
                                        #               Child Loop BB10_14 Depth 7
                                        #               Child Loop BB10_23 Depth 7
	cmpq	$0, 360(%rsp)           # 8-byte Folded Reload
	js	.LBB10_27
# BB#9:                                 # %polly.loop_header18.preheader
                                        #   in Loop: Header=BB10_8 Depth=4
	cmpq	$0, 96(%rsp)            # 8-byte Folded Reload
	sete	%al
	movq	72(%rsp), %rdx          # 8-byte Reload
	leaq	(,%rdx,8), %rcx
	movq	344(%rsp), %rsi         # 8-byte Reload
	subq	%rcx, %rsi
	cmpq	$8, %rsi
	movl	$7, %ecx
	cmovgeq	%rcx, %rsi
	movq	%rdx, %rcx
	shlq	$5, %rcx
	orq	$31, %rcx
	cmpq	16(%rsp), %rcx          # 8-byte Folded Reload
	setl	%cl
	orb	%al, %cl
	movb	%cl, 15(%rsp)           # 1-byte Spill
	movq	%rsi, 376(%rsp)         # 8-byte Spill
	leaq	-1(%rsi), %r11
	movq	136(%rsp), %rax         # 8-byte Reload
	movq	%rax, 104(%rsp)         # 8-byte Spill
	movq	120(%rsp), %rax         # 8-byte Reload
	movq	%rax, 48(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 88(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB10_10:                              # %polly.loop_header18
                                        #   Parent Loop BB10_4 Depth=1
                                        #     Parent Loop BB10_5 Depth=2
                                        #       Parent Loop BB10_7 Depth=3
                                        #         Parent Loop BB10_8 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB10_30 Depth 6
                                        #               Child Loop BB10_35 Depth 7
                                        #             Child Loop BB10_13 Depth 6
                                        #               Child Loop BB10_14 Depth 7
                                        #               Child Loop BB10_23 Depth 7
	cmpq	$0, 400(%rsp)           # 8-byte Folded Reload
	js	.LBB10_26
# BB#11:                                # %polly.loop_header27.preheader
                                        #   in Loop: Header=BB10_10 Depth=5
	movq	368(%rsp), %rax         # 8-byte Reload
	movq	88(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	imulq	16(%rsp), %rcx          # 8-byte Folded Reload
	cmpq	$0, 376(%rsp)           # 8-byte Folded Reload
	movq	%rcx, 232(%rsp)         # 8-byte Spill
	js	.LBB10_28
# BB#12:                                # %polly.loop_header27.us.preheader
                                        #   in Loop: Header=BB10_10 Depth=5
	movq	24(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	movq	%rax, 408(%rsp)         # 8-byte Spill
	movq	80(%rsp), %r8           # 8-byte Reload
	movq	168(%rsp), %r15         # 8-byte Reload
	movq	160(%rsp), %rsi         # 8-byte Reload
	movq	152(%rsp), %rdi         # 8-byte Reload
	movq	144(%rsp), %r12         # 8-byte Reload
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB10_13:                              # %polly.loop_header27.us
                                        #   Parent Loop BB10_4 Depth=1
                                        #     Parent Loop BB10_5 Depth=2
                                        #       Parent Loop BB10_7 Depth=3
                                        #         Parent Loop BB10_8 Depth=4
                                        #           Parent Loop BB10_10 Depth=5
                                        # =>          This Loop Header: Depth=6
                                        #               Child Loop BB10_14 Depth 7
                                        #               Child Loop BB10_23 Depth 7
	movq	%r8, 448(%rsp)          # 8-byte Spill
	movq	224(%rsp), %rax         # 8-byte Reload
	leaq	(%r9,%rax), %rax
	movq	%rax, 424(%rsp)         # 8-byte Spill
	leaq	(%rax,%rcx), %rax
	movq	%rbp, %rbx
	movq	%rax, 240(%rsp)         # 8-byte Spill
	movq	(%rbp,%rax,8), %r10
	movq	$-1, %rax
	movq	%r15, %rdx
	movq	%rsi, 440(%rsp)         # 8-byte Spill
	movq	%rsi, %rbp
	movq	%rdi, 432(%rsp)         # 8-byte Spill
	movq	%rdi, %rcx
	movq	104(%rsp), %r8          # 8-byte Reload
	movq	%r12, %r13
	.p2align	4, 0x90
.LBB10_14:                              # %polly.loop_header37.us
                                        #   Parent Loop BB10_4 Depth=1
                                        #     Parent Loop BB10_5 Depth=2
                                        #       Parent Loop BB10_7 Depth=3
                                        #         Parent Loop BB10_8 Depth=4
                                        #           Parent Loop BB10_10 Depth=5
                                        #             Parent Loop BB10_13 Depth=6
                                        # =>            This Inner Loop Header: Depth=7
	movq	(%r15), %rsi
	imulq	-24(%r8), %rsi
	addq	%r10, %rsi
	movq	(%rbp), %rdi
	imulq	-16(%r8), %rdi
	addq	%rsi, %rdi
	movq	(%rcx), %rsi
	imulq	-8(%r8), %rsi
	addq	%rdi, %rsi
	movq	(%r13), %r10
	imulq	(%r8), %r10
	addq	%rsi, %r10
	incq	%rax
	addq	%r14, %r13
	addq	$32, %r8
	addq	%r14, %rcx
	addq	%r14, %rbp
	addq	%r14, %r15
	cmpq	%r11, %rax
	jle	.LBB10_14
# BB#15:                                # %polly.cond.loopexit.us
                                        #   in Loop: Header=BB10_13 Depth=6
	movq	%rbx, %rbp
	movq	240(%rsp), %rax         # 8-byte Reload
	movq	%r10, (%rbp,%rax,8)
	cmpb	$0, 15(%rsp)            # 1-byte Folded Reload
	movq	416(%rsp), %r13         # 8-byte Reload
	movq	448(%rsp), %r8          # 8-byte Reload
	movq	%rdx, %r15
	jne	.LBB10_25
# BB#16:                                # %polly.loop_header56.us.preheader
                                        #   in Loop: Header=BB10_13 Depth=6
	cmpq	$0, 192(%rsp)           # 8-byte Folded Reload
	jne	.LBB10_20
# BB#17:                                #   in Loop: Header=BB10_13 Depth=6
                                        # implicit-def: %RAX
	xorl	%edi, %edi
	cmpq	$0, 200(%rsp)           # 8-byte Folded Reload
	jne	.LBB10_22
	jmp	.LBB10_24
	.p2align	4, 0x90
.LBB10_20:                              # %polly.loop_header56.us.prol
                                        #   in Loop: Header=BB10_13 Depth=6
	movq	424(%rsp), %rcx         # 8-byte Reload
	addq	176(%rsp), %rcx         # 8-byte Folded Reload
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	(%rax,%rcx,8), %rax
	movq	32(%rsp), %rcx          # 8-byte Reload
	movq	408(%rsp), %rdx         # 8-byte Reload
	imulq	(%rcx,%rdx,8), %rax
	addq	%r10, %rax
	movq	%rax, %r10
	movl	$1, %edi
	cmpq	$0, 200(%rsp)           # 8-byte Folded Reload
	je	.LBB10_24
.LBB10_22:                              # %polly.loop_header56.us.preheader.new
                                        #   in Loop: Header=BB10_13 Depth=6
	movq	96(%rsp), %rcx          # 8-byte Reload
	subq	%rdi, %rcx
	movq	184(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rdi), %rax
	movq	16(%rsp), %rdx          # 8-byte Reload
	imulq	%rdx, %rax
	leaq	(%r8,%rax,8), %rbp
	movq	48(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%rdi), %rax
	movq	32(%rsp), %rsi          # 8-byte Reload
	leaq	(%rsi,%rax,8), %rsi
	addq	24(%rsp), %rdi          # 8-byte Folded Reload
	imulq	%rdx, %rdi
	leaq	(%r8,%rdi,8), %rdi
	xorl	%ebx, %ebx
	movq	%r10, %rax
	.p2align	4, 0x90
.LBB10_23:                              # %polly.loop_header56.us
                                        #   Parent Loop BB10_4 Depth=1
                                        #     Parent Loop BB10_5 Depth=2
                                        #       Parent Loop BB10_7 Depth=3
                                        #         Parent Loop BB10_8 Depth=4
                                        #           Parent Loop BB10_10 Depth=5
                                        #             Parent Loop BB10_13 Depth=6
                                        # =>            This Inner Loop Header: Depth=7
	movq	(%rdi,%rbx,8), %rdx
	imulq	(%rsi), %rdx
	addq	%rax, %rdx
	movq	(%rbp,%rbx,8), %rax
	imulq	8(%rsi), %rax
	addq	%rdx, %rax
	addq	%r13, %rbx
	addq	$16, %rsi
	addq	$-2, %rcx
	jne	.LBB10_23
.LBB10_24:                              # %polly.merge.loopexit.us
                                        #   in Loop: Header=BB10_13 Depth=6
	movq	208(%rsp), %rbp         # 8-byte Reload
	movq	240(%rsp), %rcx         # 8-byte Reload
	movq	%rax, (%rbp,%rcx,8)
.LBB10_25:                              # %polly.merge.us
                                        #   in Loop: Header=BB10_13 Depth=6
	addq	$8, %r12
	movq	432(%rsp), %rdi         # 8-byte Reload
	addq	$8, %rdi
	movq	440(%rsp), %rsi         # 8-byte Reload
	addq	$8, %rsi
	addq	$8, %r15
	addq	$8, %r8
	cmpq	216(%rsp), %r9          # 8-byte Folded Reload
	leaq	1(%r9), %r9
	movq	232(%rsp), %rcx         # 8-byte Reload
	jle	.LBB10_13
	jmp	.LBB10_26
	.p2align	4, 0x90
.LBB10_28:                              # %polly.loop_header27.preheader.split
                                        #   in Loop: Header=BB10_10 Depth=5
	cmpb	$0, 15(%rsp)            # 1-byte Folded Reload
	jne	.LBB10_26
# BB#29:                                # %polly.loop_header27.preheader169
                                        #   in Loop: Header=BB10_10 Depth=5
	movq	24(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%rcx), %r9
	movq	80(%rsp), %r12          # 8-byte Reload
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB10_30:                              # %polly.loop_header27
                                        #   Parent Loop BB10_4 Depth=1
                                        #     Parent Loop BB10_5 Depth=2
                                        #       Parent Loop BB10_7 Depth=3
                                        #         Parent Loop BB10_8 Depth=4
                                        #           Parent Loop BB10_10 Depth=5
                                        # =>          This Loop Header: Depth=6
                                        #               Child Loop BB10_35 Depth 7
	movq	224(%rsp), %rax         # 8-byte Reload
	leaq	(%r15,%rax), %rax
	leaq	(%rax,%rcx), %r8
	cmpq	$0, 192(%rsp)           # 8-byte Folded Reload
	movq	(%rbp,%r8,8), %r10
	jne	.LBB10_32
# BB#31:                                #   in Loop: Header=BB10_30 Depth=6
                                        # implicit-def: %RAX
	xorl	%esi, %esi
	cmpq	$0, 200(%rsp)           # 8-byte Folded Reload
	jne	.LBB10_34
	jmp	.LBB10_36
	.p2align	4, 0x90
.LBB10_32:                              # %polly.loop_header56.prol
                                        #   in Loop: Header=BB10_30 Depth=6
	addq	176(%rsp), %rax         # 8-byte Folded Reload
	movq	40(%rsp), %rcx          # 8-byte Reload
	movq	(%rcx,%rax,8), %rax
	movq	32(%rsp), %rcx          # 8-byte Reload
	imulq	(%rcx,%r9,8), %rax
	addq	%r10, %rax
	movq	%rax, %r10
	movl	$1, %esi
	cmpq	$0, 200(%rsp)           # 8-byte Folded Reload
	je	.LBB10_36
.LBB10_34:                              # %polly.loop_header27.new
                                        #   in Loop: Header=BB10_30 Depth=6
	movq	96(%rsp), %rdi          # 8-byte Reload
	subq	%rsi, %rdi
	movq	184(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rsi), %rax
	movq	16(%rsp), %rdx          # 8-byte Reload
	imulq	%rdx, %rax
	leaq	(%r12,%rax,8), %rcx
	movq	48(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%rsi), %rax
	movq	32(%rsp), %rbx          # 8-byte Reload
	leaq	(%rbx,%rax,8), %rbx
	addq	24(%rsp), %rsi          # 8-byte Folded Reload
	imulq	%rdx, %rsi
	leaq	(%r12,%rsi,8), %rsi
	xorl	%ebp, %ebp
	movq	%r10, %rax
	.p2align	4, 0x90
.LBB10_35:                              # %polly.loop_header56
                                        #   Parent Loop BB10_4 Depth=1
                                        #     Parent Loop BB10_5 Depth=2
                                        #       Parent Loop BB10_7 Depth=3
                                        #         Parent Loop BB10_8 Depth=4
                                        #           Parent Loop BB10_10 Depth=5
                                        #             Parent Loop BB10_30 Depth=6
                                        # =>            This Inner Loop Header: Depth=7
	movq	(%rsi,%rbp,8), %rdx
	imulq	(%rbx), %rdx
	addq	%rax, %rdx
	movq	(%rcx,%rbp,8), %rax
	imulq	8(%rbx), %rax
	addq	%rdx, %rax
	addq	%r13, %rbp
	addq	$16, %rbx
	addq	$-2, %rdi
	jne	.LBB10_35
.LBB10_36:                              # %polly.merge.loopexit
                                        #   in Loop: Header=BB10_30 Depth=6
	movq	208(%rsp), %rbp         # 8-byte Reload
	movq	%rax, (%rbp,%r8,8)
	addq	$8, %r12
	cmpq	216(%rsp), %r15         # 8-byte Folded Reload
	leaq	1(%r15), %r15
	movq	232(%rsp), %rcx         # 8-byte Reload
	jle	.LBB10_30
	.p2align	4, 0x90
.LBB10_26:                              # %polly.loop_exit29
                                        #   in Loop: Header=BB10_10 Depth=5
	movq	48(%rsp), %rax          # 8-byte Reload
	addq	16(%rsp), %rax          # 8-byte Folded Reload
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	104(%rsp), %rax         # 8-byte Reload
	addq	384(%rsp), %rax         # 8-byte Folded Reload
	movq	%rax, 104(%rsp)         # 8-byte Spill
	movq	88(%rsp), %rax          # 8-byte Reload
	cmpq	392(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 88(%rsp)          # 8-byte Spill
	jle	.LBB10_10
.LBB10_27:                              # %polly.loop_exit20
                                        #   in Loop: Header=BB10_8 Depth=4
	movq	128(%rsp), %rax         # 8-byte Reload
	addq	%rax, 144(%rsp)         # 8-byte Folded Spill
	addq	$256, 136(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x100
	addq	%rax, 152(%rsp)         # 8-byte Folded Spill
	addq	%rax, 160(%rsp)         # 8-byte Folded Spill
	addq	%rax, 168(%rsp)         # 8-byte Folded Spill
	movq	72(%rsp), %rax          # 8-byte Reload
	cmpq	352(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	jne	.LBB10_8
# BB#18:                                # %polly.loop_exit12
                                        #   in Loop: Header=BB10_7 Depth=3
	movq	80(%rsp), %rdi          # 8-byte Reload
	addq	$256, %rdi              # imm = 0x100
	movq	320(%rsp), %r8          # 8-byte Reload
	addq	$256, %r8               # imm = 0x100
	movq	328(%rsp), %rdx         # 8-byte Reload
	addq	$256, %rdx              # imm = 0x100
	movq	336(%rsp), %rcx         # 8-byte Reload
	addq	$256, %rcx              # imm = 0x100
	movq	312(%rsp), %rax         # 8-byte Reload
	cmpq	112(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	jne	.LBB10_7
.LBB10_19:                              # %polly.loop_exit5
                                        #   in Loop: Header=BB10_5 Depth=2
	addq	%r14, 120(%rsp)         # 8-byte Folded Spill
	movq	64(%rsp), %rax          # 8-byte Reload
	addq	128(%rsp), %rax         # 8-byte Folded Reload
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	56(%rsp), %rax          # 8-byte Reload
	cmpq	304(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	jle	.LBB10_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB10_4 Depth=1
	leaq	256(%rsp), %rdi
	leaq	248(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB10_4
.LBB10_2:                               # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$456, %rsp              # imm = 0x1C8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end10:
	.size	_mat_mult__polly_subfn, .Lfunc_end10-_mat_mult__polly_subfn
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
