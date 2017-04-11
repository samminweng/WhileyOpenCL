	.text
	.file	"MatrixMult_original.c"
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
	pushq	%r15
.Lcfi31:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Lcfi32:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Lcfi33:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Lcfi34:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Lcfi35:
	.cfi_def_cfa_offset 48
	subq	$32, %rsp
.Lcfi36:
	.cfi_def_cfa_offset 80
.Lcfi37:
	.cfi_offset %rbx, -48
.Lcfi38:
	.cfi_offset %r12, -40
.Lcfi39:
	.cfi_offset %r13, -32
.Lcfi40:
	.cfi_offset %r14, -24
.Lcfi41:
	.cfi_offset %r15, -16
	movq	%rsi, %rbx
	movq	%rdi, %r14
	movq	%rbx, %r15
	imulq	%r14, %r15
	xorl	%edi, %edi
	movq	%r15, %rsi
	callq	create1DArray_int64_t
	movq	%rax, %r12
	testq	%rbx, %rbx
	jle	.LBB5_2
# BB#1:                                 # %polly.parallel.for
	leaq	-1(%rbx), %r8
	sarq	$5, %r8
	movq	%r14, 8(%rsp)
	movq	%rbx, 16(%rsp)
	movq	%r12, 24(%rsp)
	incq	%r8
	leaq	8(%rsp), %r13
	movl	$_init__polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r13, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%r13, %rdi
	callq	_init__polly_subfn
	callq	GOMP_parallel_end
.LBB5_2:                                # %if.end24
	movl	$32, %edi
	callq	malloc
	movq	%r15, 8(%rax)
	movq	%r12, (%rax)
	movq	%rbx, 24(%rax)
	movq	%r14, 16(%rax)
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
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
.Lcfi42:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi43:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi44:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi45:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi46:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi47:
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
.Lcfi48:
	.cfi_def_cfa_offset 112
.Lcfi49:
	.cfi_offset %rbx, -56
.Lcfi50:
	.cfi_offset %r12, -48
.Lcfi51:
	.cfi_offset %r13, -40
.Lcfi52:
	.cfi_offset %r14, -32
.Lcfi53:
	.cfi_offset %r15, -24
.Lcfi54:
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
	jne	.LBB6_18
	jmp	.LBB6_19
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
.Lcfi55:
	.cfi_def_cfa_offset 16
.Lcfi56:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi57:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-64, %rsp
	subq	$3343104, %rsp          # imm = 0x330300
.Lcfi58:
	.cfi_offset %rbx, -56
.Lcfi59:
	.cfi_offset %r12, -48
.Lcfi60:
	.cfi_offset %r13, -40
.Lcfi61:
	.cfi_offset %r14, -32
.Lcfi62:
	.cfi_offset %r15, -24
	movl	%ecx, 332(%rsp)         # 4-byte Spill
	movl	%esi, 328(%rsp)         # 4-byte Spill
	movq	%rdx, 344(%rsp)         # 8-byte Spill
	movq	16(%rdx), %rbx
	movq	%rdi, 336(%rsp)         # 8-byte Spill
	movq	24(%rdi), %r14
	movq	%r14, %rsi
	imulq	%rbx, %rsi
	xorl	%edi, %edi
	movq	%rsi, 440(%rsp)         # 8-byte Spill
	callq	create1DArray_int64_t
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movq	%r14, 24(%rsp)          # 8-byte Spill
	testq	%r14, %r14
	jle	.LBB7_93
# BB#1:                                 # %polly.split_new_and_old
	movq	336(%rsp), %rax         # 8-byte Reload
	movq	(%rax), %rdx
	movq	344(%rsp), %rax         # 8-byte Reload
	movq	(%rax), %rdi
	movq	24(%rsp), %rax          # 8-byte Reload
	decq	%rax
	seto	%r14b
	movq	%rax, 232(%rsp)         # 8-byte Spill
	imulq	%rbx, %rax
	seto	%r8b
	addq	%rbx, %rax
	seto	%r9b
	leaq	(%rdx,%rax,8), %rcx
	movq	8(%rsp), %rsi           # 8-byte Reload
	cmpq	%rsi, %rcx
	setbe	%cl
	leaq	(%rsi,%rax,8), %rax
	movq	%rdx, 216(%rsp)         # 8-byte Spill
	cmpq	%rdx, %rax
	movq	%rbx, %rdx
	setbe	%bl
	orb	%cl, %bl
	movq	%rdx, %rcx
	decq	%rcx
	seto	%r11b
	movq	%rcx, 112(%rsp)         # 8-byte Spill
	imulq	%rdx, %rcx
	seto	%r10b
	movq	%rdx, 16(%rsp)          # 8-byte Spill
	addq	%rdx, %rcx
	seto	%dl
	leaq	(%rdi,%rcx,8), %rcx
	cmpq	%rsi, %rcx
	setbe	%cl
	movq	%rdi, 104(%rsp)         # 8-byte Spill
	cmpq	%rdi, %rax
	setbe	%al
	cmpb	$1, %bl
	jne	.LBB7_82
# BB#2:                                 # %polly.split_new_and_old
	orb	%al, %cl
	je	.LBB7_82
# BB#3:                                 # %polly.split_new_and_old
	testb	%r9b, %r9b
	jne	.LBB7_82
# BB#4:                                 # %polly.split_new_and_old
	testb	%r8b, %r8b
	jne	.LBB7_82
# BB#5:                                 # %polly.split_new_and_old
	testb	%r14b, %r14b
	jne	.LBB7_82
# BB#6:                                 # %polly.split_new_and_old
	testb	%dl, %dl
	jne	.LBB7_82
# BB#7:                                 # %polly.split_new_and_old
	testb	%r10b, %r10b
	jne	.LBB7_82
# BB#8:                                 # %polly.split_new_and_old
	testb	%r11b, %r11b
	jne	.LBB7_82
# BB#9:                                 # %polly.split_new_and_old
	testb	%r14b, %r14b
	jne	.LBB7_82
# BB#10:                                # %polly.split_new_and_old
	testb	%r8b, %r8b
	jne	.LBB7_82
# BB#11:                                # %polly.split_new_and_old
	testb	%r9b, %r9b
	jne	.LBB7_82
# BB#12:                                # %polly.then
	movq	112(%rsp), %rax         # 8-byte Reload
	sarq	$10, %rax
	movq	%rax, 472(%rsp)         # 8-byte Spill
	movq	16(%rsp), %rbx          # 8-byte Reload
	movq	104(%rsp), %r8          # 8-byte Reload
	js	.LBB7_93
# BB#13:                                # %polly.loop_header.preheader
	movabsq	$-6148914691236517205, %rcx # imm = 0xAAAAAAAAAAAAAAAB
	movq	112(%rsp), %rdi         # 8-byte Reload
	movq	%rdi, %rax
	mulq	%rcx
	shrq	$8, %rdx
	movq	%rdx, 504(%rsp)         # 8-byte Spill
	movq	232(%rsp), %rax         # 8-byte Reload
	movq	%rax, %rcx
	sarq	$6, %rcx
	movq	%rcx, 400(%rsp)         # 8-byte Spill
	shrq	$2, %rdi
	movq	%rdi, 464(%rsp)         # 8-byte Spill
	movq	%rax, %rcx
	shrq	$2, %rcx
	movq	%rbx, %rax
	shrq	$2, %rax
	decq	%rax
	movq	%rax, 456(%rsp)         # 8-byte Spill
	movq	24(%rsp), %rax          # 8-byte Reload
	movq	%rax, %rdx
	shrq	$2, %rdx
	decq	%rdx
	movq	%rdx, 544(%rsp)         # 8-byte Spill
	movl	%eax, %edx
	andl	$3, %edx
	movq	%rdx, 136(%rsp)         # 8-byte Spill
	andq	$-4, %rax
	movq	%rax, %rdx
	imulq	%rbx, %rdx
	movq	%rdx, 632(%rsp)         # 8-byte Spill
	leaq	2(%rax), %rdx
	orq	$1, %rax
	imulq	%rbx, %rax
	movq	%rax, 640(%rsp)         # 8-byte Spill
	movq	%rdx, 448(%rsp)         # 8-byte Spill
	imulq	%rbx, %rdx
	movq	%rdx, 624(%rsp)         # 8-byte Spill
	movq	%rbx, %rax
	shlq	$10, %rax
	leaq	(%rax,%rax,2), %rax
	movq	%rax, 496(%rsp)         # 8-byte Spill
	movq	%rbx, %rax
	shlq	$9, %rax
	movq	%rax, 568(%rsp)         # 8-byte Spill
	movq	%rcx, 552(%rsp)         # 8-byte Spill
	leaq	(%rcx,%rcx,2), %rax
	shlq	$12, %rax
	leaq	720(%rsp,%rax), %rax
	movq	%rax, 488(%rsp)         # 8-byte Spill
	movq	8(%rsp), %rax           # 8-byte Reload
	movq	%rax, %rcx
	addq	$48, %rcx
	movq	%rcx, 360(%rsp)         # 8-byte Spill
	movq	%rbx, %rcx
	shlq	$5, %rcx
	movq	%rcx, 696(%rsp)         # 8-byte Spill
	movq	%rbx, %rcx
	negq	%rcx
	movq	%rcx, 392(%rsp)         # 8-byte Spill
	leaq	(,%rbx,8), %r14
	xorl	%edi, %edi
	movq	%rax, 352(%rsp)         # 8-byte Spill
	xorl	%r11d, %r11d
	movq	%r14, 432(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB7_14:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_15 Depth 2
                                        #       Child Loop BB7_18 Depth 3
                                        #         Child Loop BB7_19 Depth 4
                                        #       Child Loop BB7_23 Depth 3
                                        #         Child Loop BB7_27 Depth 4
                                        #           Child Loop BB7_28 Depth 5
                                        #         Child Loop BB7_33 Depth 4
                                        #           Child Loop BB7_35 Depth 5
                                        #             Child Loop BB7_37 Depth 6
                                        #           Child Loop BB7_42 Depth 5
                                        #         Child Loop BB7_54 Depth 4
                                        #           Child Loop BB7_57 Depth 5
                                        #             Child Loop BB7_59 Depth 6
                                        #               Child Loop BB7_63 Depth 7
                                        #                 Child Loop BB7_68 Depth 8
                                        #                 Child Loop BB7_74 Depth 8
	testb	$3, %bl
	setne	%al
	movq	%r11, %rsi
	shlq	$10, %rsi
	movq	%rsi, %rcx
	subq	%rbx, %rcx
	movq	%rcx, 680(%rsp)         # 8-byte Spill
	movq	448(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rsi), %rcx
	movq	%rcx, 648(%rsp)         # 8-byte Spill
	leaq	1023(%rsi), %rcx
	movq	112(%rsp), %r9          # 8-byte Reload
	cmpq	%rcx, %r9
	movq	%rcx, %rdx
	cmovleq	%r9, %rdx
	cmpq	%rbx, %rcx
	setge	%cl
	andb	%al, %cl
	movb	%cl, 6(%rsp)            # 1-byte Spill
	movq	%r11, %rax
	shlq	$8, %rax
	movq	464(%rsp), %rbx         # 8-byte Reload
	subq	%rax, %rbx
	cmpq	$256, %rbx              # imm = 0x100
	movl	$255, %ecx
	cmovgeq	%rcx, %rbx
	movq	%rsi, 120(%rsp)         # 8-byte Spill
	subq	%rsi, %r9
	movq	%r9, 656(%rsp)          # 8-byte Spill
	movq	%rbx, 576(%rsp)         # 8-byte Spill
	leaq	-1(%rbx), %rsi
	movq	%rsi, 672(%rsp)         # 8-byte Spill
	movq	456(%rsp), %rsi         # 8-byte Reload
	subq	%rax, %rsi
	cmpq	$256, %rsi              # imm = 0x100
	cmovgeq	%rcx, %rsi
	movq	%rsi, 560(%rsp)         # 8-byte Spill
	leaq	-1(%rsi), %rax
	movq	%rax, 664(%rsp)         # 8-byte Spill
	movq	%rdx, 512(%rsp)         # 8-byte Spill
	leaq	-1(%rdx), %rax
	movq	%rax, 536(%rsp)         # 8-byte Spill
	movq	216(%rsp), %rax         # 8-byte Reload
	movq	%rax, 376(%rsp)         # 8-byte Spill
	movl	$0, %eax
	movq	%rax, 368(%rsp)         # 8-byte Spill
	movq	%r8, 104(%rsp)          # 8-byte Spill
	movq	%r8, 224(%rsp)          # 8-byte Spill
	movq	%rdi, 480(%rsp)         # 8-byte Spill
	movq	%rdi, 384(%rsp)         # 8-byte Spill
	xorl	%r15d, %r15d
	movq	$-1, %r12
	xorl	%eax, %eax
	movq	%rax, 168(%rsp)         # 8-byte Spill
	movq	%r11, 584(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB7_15:                               # %polly.loop_header270
                                        #   Parent Loop BB7_14 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_18 Depth 3
                                        #         Child Loop BB7_19 Depth 4
                                        #       Child Loop BB7_23 Depth 3
                                        #         Child Loop BB7_27 Depth 4
                                        #           Child Loop BB7_28 Depth 5
                                        #         Child Loop BB7_33 Depth 4
                                        #           Child Loop BB7_35 Depth 5
                                        #             Child Loop BB7_37 Depth 6
                                        #           Child Loop BB7_42 Depth 5
                                        #         Child Loop BB7_54 Depth 4
                                        #           Child Loop BB7_57 Depth 5
                                        #             Child Loop BB7_59 Depth 6
                                        #               Child Loop BB7_63 Depth 7
                                        #                 Child Loop BB7_68 Depth 8
                                        #                 Child Loop BB7_74 Depth 8
	movq	512(%rsp), %rax         # 8-byte Reload
	cmpq	%rax, 120(%rsp)         # 8-byte Folded Reload
	jg	.LBB7_21
# BB#16:                                # %polly.loop_header278.preheader
                                        #   in Loop: Header=BB7_15 Depth=2
	movq	168(%rsp), %rax         # 8-byte Reload
	shlq	$7, %rax
	leaq	(%rax,%rax,2), %rcx
	leaq	383(%rax,%rax,2), %r10
	movq	112(%rsp), %rax         # 8-byte Reload
	cmpq	%r10, %rax
	cmovleq	%rax, %r10
	cmpq	%r10, %rcx
	jg	.LBB7_21
# BB#17:                                #   in Loop: Header=BB7_15 Depth=2
	decq	%r10
	movq	224(%rsp), %r8          # 8-byte Reload
	movq	120(%rsp), %r9          # 8-byte Reload
	.p2align	4, 0x90
.LBB7_18:                               # %polly.loop_header278
                                        #   Parent Loop BB7_14 Depth=1
                                        #     Parent Loop BB7_15 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB7_19 Depth 4
	movq	%r9, %rcx
	shrq	$2, %rcx
	addq	384(%rsp), %rcx         # 8-byte Folded Reload
	leaq	(%rcx,%rcx,2), %rax
	shlq	$9, %rax
	addq	%r15, %rax
	movl	%r9d, %edi
	andl	$3, %edi
	movq	%r8, %rcx
	movq	%r12, %rbx
	.p2align	4, 0x90
.LBB7_19:                               # %polly.loop_header287
                                        #   Parent Loop BB7_14 Depth=1
                                        #     Parent Loop BB7_15 Depth=2
                                        #       Parent Loop BB7_18 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	(%rcx), %rdx
	movq	%rax, %rsi
	orq	%rdi, %rsi
	movq	%rdx, 197312(%rsp,%rsi,8)
	incq	%rbx
	addq	$4, %rax
	addq	%r14, %rcx
	cmpq	%r10, %rbx
	jle	.LBB7_19
# BB#20:                                # %polly.loop_exit289
                                        #   in Loop: Header=BB7_18 Depth=3
	addq	$8, %r8
	cmpq	536(%rsp), %r9          # 8-byte Folded Reload
	leaq	1(%r9), %r9
	jle	.LBB7_18
.LBB7_21:                               # %polly.loop_exit280
                                        #   in Loop: Header=BB7_15 Depth=2
	cmpq	$0, 400(%rsp)           # 8-byte Folded Reload
	js	.LBB7_80
# BB#22:                                # %polly.loop_header303.preheader
                                        #   in Loop: Header=BB7_15 Depth=2
	movq	168(%rsp), %rax         # 8-byte Reload
	movq	%rax, %rcx
	shlq	$7, %rax
	leaq	(%rax,%rax,2), %rdx
	movq	%rdx, 528(%rsp)         # 8-byte Spill
	leaq	383(%rax,%rax,2), %rdx
	movq	112(%rsp), %rax         # 8-byte Reload
	cmpq	%rdx, %rax
	cmovleq	%rax, %rdx
	movq	%rdx, 520(%rsp)         # 8-byte Spill
	leaq	-1(%rdx), %r10
	imulq	$-384, %rcx, %rcx       # imm = 0xFE80
	addq	%rax, %rcx
	cmpq	$384, %rcx              # imm = 0x180
	movl	$383, %eax              # imm = 0x17F
	cmovgeq	%rax, %rcx
	movq	%rcx, 264(%rsp)         # 8-byte Spill
	leaq	-1(%rcx), %rbx
	movq	352(%rsp), %rax         # 8-byte Reload
	movq	%rax, 416(%rsp)         # 8-byte Spill
	movq	360(%rsp), %rax         # 8-byte Reload
	movq	%rax, 408(%rsp)         # 8-byte Spill
	movq	488(%rsp), %rcx         # 8-byte Reload
	movq	376(%rsp), %r13         # 8-byte Reload
	movq	368(%rsp), %rax         # 8-byte Reload
	movq	%rax, 424(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%r15, 608(%rsp)         # 8-byte Spill
	movq	%r12, 600(%rsp)         # 8-byte Spill
	movq	%r10, 592(%rsp)         # 8-byte Spill
	movq	%rbx, 272(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB7_23:                               # %polly.loop_header303
                                        #   Parent Loop BB7_14 Depth=1
                                        #     Parent Loop BB7_15 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB7_27 Depth 4
                                        #           Child Loop BB7_28 Depth 5
                                        #         Child Loop BB7_33 Depth 4
                                        #           Child Loop BB7_35 Depth 5
                                        #             Child Loop BB7_37 Depth 6
                                        #           Child Loop BB7_42 Depth 5
                                        #         Child Loop BB7_54 Depth 4
                                        #           Child Loop BB7_57 Depth 5
                                        #             Child Loop BB7_59 Depth 6
                                        #               Child Loop BB7_63 Depth 7
                                        #                 Child Loop BB7_68 Depth 8
                                        #                 Child Loop BB7_74 Depth 8
	movq	%rcx, 128(%rsp)         # 8-byte Spill
	movq	%rax, 240(%rsp)         # 8-byte Spill
	shlq	$6, %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	testq	%r11, %r11
	jne	.LBB7_30
# BB#24:                                # %polly.then313
                                        #   in Loop: Header=BB7_23 Depth=3
	movq	32(%rsp), %rcx          # 8-byte Reload
	movq	%rcx, %r8
	orq	$63, %r8
	movq	232(%rsp), %rax         # 8-byte Reload
	cmpq	%r8, %rax
	cmovleq	%rax, %r8
	cmpq	%r8, %rcx
	jg	.LBB7_30
# BB#25:                                # %polly.loop_header316.preheader
                                        #   in Loop: Header=BB7_23 Depth=3
	movq	520(%rsp), %rax         # 8-byte Reload
	cmpq	%rax, 528(%rsp)         # 8-byte Folded Reload
	jg	.LBB7_30
# BB#26:                                # %polly.loop_header316.preheader867
                                        #   in Loop: Header=BB7_23 Depth=3
	decq	%r8
	movq	%r13, %rcx
	movq	32(%rsp), %r9           # 8-byte Reload
	.p2align	4, 0x90
.LBB7_27:                               # %polly.loop_header316
                                        #   Parent Loop BB7_14 Depth=1
                                        #     Parent Loop BB7_15 Depth=2
                                        #       Parent Loop BB7_23 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB7_28 Depth 5
	movq	%r9, %rsi
	shrq	$2, %rsi
	addq	424(%rsp), %rsi         # 8-byte Folded Reload
	leaq	(%rsi,%rsi,2), %rdx
	shlq	$9, %rdx
	addq	%r15, %rdx
	movl	%r9d, %edi
	andl	$3, %edi
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB7_28:                               # %polly.loop_header325
                                        #   Parent Loop BB7_14 Depth=1
                                        #     Parent Loop BB7_15 Depth=2
                                        #       Parent Loop BB7_23 Depth=3
                                        #         Parent Loop BB7_27 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movq	(%rcx,%rbx,8), %rax
	movq	%rdx, %rsi
	orq	%rdi, %rsi
	movq	%rax, 704(%rsp,%rsi,8)
	leaq	1(%r12,%rbx), %rax
	incq	%rbx
	addq	$4, %rdx
	cmpq	%r10, %rax
	jle	.LBB7_28
# BB#29:                                # %polly.loop_exit327
                                        #   in Loop: Header=BB7_27 Depth=4
	addq	%r14, %rcx
	cmpq	%r8, %r9
	leaq	1(%r9), %r9
	jle	.LBB7_27
	.p2align	4, 0x90
.LBB7_30:                               # %polly.cond340
                                        #   in Loop: Header=BB7_23 Depth=3
	movq	%r13, 616(%rsp)         # 8-byte Spill
	movq	32(%rsp), %rax          # 8-byte Reload
	orq	$4, %rax
	cmpq	%rax, 24(%rsp)          # 8-byte Folded Reload
	jl	.LBB7_51
# BB#31:                                # %polly.cond340
                                        #   in Loop: Header=BB7_23 Depth=3
	cmpq	$0, 560(%rsp)           # 8-byte Folded Reload
	js	.LBB7_51
# BB#32:                                # %polly.loop_header346.preheader
                                        #   in Loop: Header=BB7_23 Depth=3
	cmpq	$0, 264(%rsp)           # 8-byte Folded Reload
	sets	%al
	movq	240(%rsp), %rcx         # 8-byte Reload
	shlq	$4, %rcx
	movq	544(%rsp), %rdx         # 8-byte Reload
	subq	%rcx, %rdx
	cmpq	$16, %rdx
	movl	$15, %ecx
	cmovgeq	%rcx, %rdx
	movq	%rdx, 688(%rsp)         # 8-byte Spill
	leaq	-1(%rdx), %rcx
	movq	%rcx, 192(%rsp)         # 8-byte Spill
	movq	32(%rsp), %rcx          # 8-byte Reload
	orq	$63, %rcx
	cmpq	24(%rsp), %rcx          # 8-byte Folded Reload
	setl	%cl
	orb	%al, %cl
	movb	%cl, 7(%rsp)            # 1-byte Spill
	leaq	197336(%rsp), %rax
	movq	%rax, 144(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB7_33:                               # %polly.loop_header346
                                        #   Parent Loop BB7_14 Depth=1
                                        #     Parent Loop BB7_15 Depth=2
                                        #       Parent Loop BB7_23 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB7_35 Depth 5
                                        #             Child Loop BB7_37 Depth 6
                                        #           Child Loop BB7_42 Depth 5
	cmpq	$0, 688(%rsp)           # 8-byte Folded Reload
	js	.LBB7_39
# BB#34:                                # %polly.loop_header356.preheader
                                        #   in Loop: Header=BB7_33 Depth=4
	movq	120(%rsp), %rax         # 8-byte Reload
	movq	56(%rsp), %rcx          # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, %rcx
	orq	$1, %rcx
	movq	%rcx, 184(%rsp)         # 8-byte Spill
	movq	%rax, %rcx
	orq	$2, %rcx
	movq	%rcx, 176(%rsp)         # 8-byte Spill
	movq	%rax, 256(%rsp)         # 8-byte Spill
	orq	$3, %rax
	movq	%rax, 248(%rsp)         # 8-byte Spill
	leaq	728(%rsp), %rax
	movq	%rax, 152(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB7_35:                               # %polly.loop_header356
                                        #   Parent Loop BB7_14 Depth=1
                                        #     Parent Loop BB7_15 Depth=2
                                        #       Parent Loop BB7_23 Depth=3
                                        #         Parent Loop BB7_33 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB7_37 Depth 6
	cmpq	$0, 264(%rsp)           # 8-byte Folded Reload
	movq	8(%rsp), %r15           # 8-byte Reload
	movq	272(%rsp), %r9          # 8-byte Reload
	js	.LBB7_38
# BB#36:                                # %polly.loop_header365.preheader
                                        #   in Loop: Header=BB7_35 Depth=5
	movq	32(%rsp), %rax          # 8-byte Reload
	movq	64(%rsp), %rcx          # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, %rcx
	movq	16(%rsp), %r10          # 8-byte Reload
	imulq	%r10, %rcx
	movq	256(%rsp), %rsi         # 8-byte Reload
	leaq	(%rcx,%rsi), %rdi
	movq	%rdi, 40(%rsp)          # 8-byte Spill
	movq	184(%rsp), %rdi         # 8-byte Reload
	leaq	(%rcx,%rdi), %rbx
	movq	%rbx, 96(%rsp)          # 8-byte Spill
	movq	176(%rsp), %rbx         # 8-byte Reload
	leaq	(%rcx,%rbx), %rdx
	movq	%rdx, 88(%rsp)          # 8-byte Spill
	movq	248(%rsp), %r8          # 8-byte Reload
	leaq	(%rcx,%r8), %rcx
	movq	%rcx, 48(%rsp)          # 8-byte Spill
	movq	%rax, %rcx
	orq	$1, %rcx
	imulq	%r10, %rcx
	leaq	(%rcx,%rsi), %rdx
	movq	%rdx, 80(%rsp)          # 8-byte Spill
	leaq	(%rcx,%rdi), %rdx
	movq	%rdx, 72(%rsp)          # 8-byte Spill
	leaq	(%rcx,%rbx), %rdx
	movq	%rdx, 320(%rsp)         # 8-byte Spill
	leaq	(%rcx,%r8), %rcx
	movq	%rcx, 312(%rsp)         # 8-byte Spill
	movq	%rax, %rcx
	orq	$2, %rcx
	imulq	%r10, %rcx
	leaq	(%rcx,%rsi), %rdx
	movq	%rdx, 304(%rsp)         # 8-byte Spill
	leaq	(%rcx,%rdi), %rdx
	movq	%rdx, 208(%rsp)         # 8-byte Spill
	leaq	(%rcx,%rbx), %rdx
	movq	%rdx, 200(%rsp)         # 8-byte Spill
	leaq	(%rcx,%r8), %rcx
	movq	%rcx, 296(%rsp)         # 8-byte Spill
	orq	$3, %rax
	imulq	%r10, %rax
	leaq	(%rax,%rsi), %rcx
	movq	%rcx, 288(%rsp)         # 8-byte Spill
	leaq	(%rax,%rdi), %rcx
	movq	%rcx, 160(%rsp)         # 8-byte Spill
	leaq	(%rax,%rbx), %rcx
	movq	%rcx, 280(%rsp)         # 8-byte Spill
	leaq	(%rax,%r8), %r14
	movq	$-1, %r11
	movq	152(%rsp), %rsi         # 8-byte Reload
	movq	144(%rsp), %rbx         # 8-byte Reload
	.p2align	4, 0x90
.LBB7_37:                               # %polly.loop_header365
                                        #   Parent Loop BB7_14 Depth=1
                                        #     Parent Loop BB7_15 Depth=2
                                        #       Parent Loop BB7_23 Depth=3
                                        #         Parent Loop BB7_33 Depth=4
                                        #           Parent Loop BB7_35 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	%r9, %rcx
	movq	-24(%rsi), %r9
	movq	-24(%rbx), %r12
	movq	%r12, %rdi
	imulq	%r9, %rdi
	movq	40(%rsp), %rdx          # 8-byte Reload
	addq	%rdi, (%r15,%rdx,8)
	movq	-16(%rbx), %r10
	movq	%r10, %rdi
	imulq	%r9, %rdi
	movq	96(%rsp), %rdx          # 8-byte Reload
	addq	%rdi, (%r15,%rdx,8)
	movq	-8(%rbx), %r8
	movq	%r8, %rdi
	imulq	%r9, %rdi
	movq	88(%rsp), %rdx          # 8-byte Reload
	addq	%rdi, (%r15,%rdx,8)
	movq	(%rbx), %rdi
	imulq	%rdi, %r9
	movq	48(%rsp), %rdx          # 8-byte Reload
	addq	%r9, (%r15,%rdx,8)
	movq	%rcx, %r9
	movq	-16(%rsi), %rcx
	movq	%r12, %rdx
	imulq	%rcx, %rdx
	movq	80(%rsp), %r13          # 8-byte Reload
	addq	%rdx, (%r15,%r13,8)
	movq	%r10, %rdx
	imulq	%rcx, %rdx
	movq	72(%rsp), %rax          # 8-byte Reload
	addq	%rdx, (%r15,%rax,8)
	movq	%r8, %rdx
	imulq	%rcx, %rdx
	movq	320(%rsp), %rax         # 8-byte Reload
	addq	%rdx, (%r15,%rax,8)
	imulq	%rdi, %rcx
	movq	312(%rsp), %rax         # 8-byte Reload
	addq	%rcx, (%r15,%rax,8)
	movq	-8(%rsi), %rcx
	movq	%r12, %rdx
	imulq	%rcx, %rdx
	movq	304(%rsp), %rax         # 8-byte Reload
	addq	%rdx, (%r15,%rax,8)
	movq	%r10, %rdx
	imulq	%rcx, %rdx
	movq	208(%rsp), %rax         # 8-byte Reload
	addq	%rdx, (%r15,%rax,8)
	movq	%r8, %rdx
	imulq	%rcx, %rdx
	movq	200(%rsp), %rax         # 8-byte Reload
	addq	%rdx, (%r15,%rax,8)
	imulq	%rdi, %rcx
	movq	296(%rsp), %rax         # 8-byte Reload
	addq	%rcx, (%r15,%rax,8)
	movq	(%rsi), %rcx
	imulq	%rcx, %r12
	movq	288(%rsp), %rax         # 8-byte Reload
	addq	%r12, (%r15,%rax,8)
	imulq	%rcx, %r10
	movq	160(%rsp), %rax         # 8-byte Reload
	addq	%r10, (%r15,%rax,8)
	imulq	%rcx, %r8
	movq	280(%rsp), %rax         # 8-byte Reload
	addq	%r8, (%r15,%rax,8)
	imulq	%rcx, %rdi
	addq	%rdi, (%r15,%r14,8)
	incq	%r11
	addq	$32, %rbx
	addq	$32, %rsi
	cmpq	%r9, %r11
	jle	.LBB7_37
.LBB7_38:                               # %polly.loop_exit367
                                        #   in Loop: Header=BB7_35 Depth=5
	addq	$12288, 152(%rsp)       # 8-byte Folded Spill
                                        # imm = 0x3000
	movq	64(%rsp), %rax          # 8-byte Reload
	cmpq	192(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	jle	.LBB7_35
.LBB7_39:                               # %polly.cond672
                                        #   in Loop: Header=BB7_33 Depth=4
	cmpb	$0, 7(%rsp)             # 1-byte Folded Reload
	movq	128(%rsp), %rdi         # 8-byte Reload
	jne	.LBB7_50
# BB#40:                                # %polly.loop_header677.preheader
                                        #   in Loop: Header=BB7_33 Depth=4
	cmpq	$0, 136(%rsp)           # 8-byte Folded Reload
	je	.LBB7_50
# BB#41:                                # %polly.loop_header687.lver.check.preheader
                                        #   in Loop: Header=BB7_33 Depth=4
	movq	648(%rsp), %rax         # 8-byte Reload
	movq	56(%rsp), %rcx          # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	120(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rcx,4), %rcx
	movq	632(%rsp), %rax         # 8-byte Reload
	leaq	(%rcx,%rax), %rdx
	movq	%rdx, %rax
	orq	$1, %rax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movq	%rdx, %rax
	orq	$2, %rax
	movq	%rax, 88(%rsp)          # 8-byte Spill
	movq	%rdx, %rax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movq	%rdx, %r10
	orq	$3, %r10
	movq	640(%rsp), %rax         # 8-byte Reload
	leaq	(%rcx,%rax), %r12
	addq	624(%rsp), %rcx         # 8-byte Folded Reload
	movq	%rcx, 80(%rsp)          # 8-byte Spill
	orq	$1, %rcx
	movq	%rcx, 72(%rsp)          # 8-byte Spill
	movq	$-1, %r9
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB7_42:                               # %polly.loop_header687.lver.check
                                        #   Parent Loop BB7_14 Depth=1
                                        #     Parent Loop BB7_15 Depth=2
                                        #       Parent Loop BB7_23 Depth=3
                                        #         Parent Loop BB7_33 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	cmpq	$1, 16(%rsp)            # 8-byte Folded Reload
	movq	144(%rsp), %rax         # 8-byte Reload
	movq	-24(%rax,%r8), %r15
	movq	-16(%rax,%r8), %rdx
	movq	-8(%rax,%r8), %r13
	movq	(%rax,%r8), %rsi
	jne	.LBB7_46
# BB#43:                                # %polly.loop_header687
                                        #   in Loop: Header=BB7_42 Depth=5
	movq	-16(%rdi,%r8), %rbx
	movq	%r15, %rdi
	imulq	%rbx, %rdi
	movq	%r13, %rax
	imulq	%rbx, %rax
	movq	8(%rsp), %r14           # 8-byte Reload
	movq	48(%rsp), %rcx          # 8-byte Reload
	addq	(%r14,%rcx,8), %rax
	movq	40(%rsp), %rcx          # 8-byte Reload
	addq	%rdi, (%r14,%rcx,8)
	movq	%rdx, %rdi
	imulq	%rbx, %rdi
	movq	96(%rsp), %rcx          # 8-byte Reload
	addq	%rdi, (%r14,%rcx,8)
	movq	128(%rsp), %rdi         # 8-byte Reload
	movq	88(%rsp), %rcx          # 8-byte Reload
	movq	%rax, (%r14,%rcx,8)
	imulq	%rsi, %rbx
	addq	(%r14,%r10,8), %rbx
	cmpq	$1, 136(%rsp)           # 8-byte Folded Reload
	movq	%rbx, (%r14,%r10,8)
	je	.LBB7_49
# BB#44:                                # %polly.loop_header687.1
                                        #   in Loop: Header=BB7_42 Depth=5
	movq	-8(%rdi,%r8), %r11
	movq	%r15, %rax
	imulq	%r11, %rax
	addq	%rax, (%r14,%r12,8)
	movq	%rdx, %rax
	imulq	%r11, %rax
	addq	%rax, 8(%r14,%r12,8)
	movq	%r13, %rax
	imulq	%r11, %rax
	addq	%rbx, %rax
	imulq	%rsi, %r11
	addq	24(%r14,%r12,8), %r11
	cmpq	$2, 136(%rsp)           # 8-byte Folded Reload
	movq	%rax, 16(%r14,%r12,8)
	movq	%r11, 24(%r14,%r12,8)
	je	.LBB7_49
# BB#45:                                # %polly.loop_header687.2
                                        #   in Loop: Header=BB7_42 Depth=5
	movq	(%rdi,%r8), %rax
	imulq	%rax, %r15
	movq	80(%rsp), %rcx          # 8-byte Reload
	addq	%r15, (%r14,%rcx,8)
	imulq	%rax, %rdx
	movq	72(%rsp), %rbx          # 8-byte Reload
	addq	%rdx, (%r14,%rbx,8)
	imulq	%rax, %r13
	addq	%r11, %r13
	movq	%r13, 16(%r14,%rcx,8)
	imulq	%rax, %rsi
	addq	%rsi, 24(%r14,%rcx,8)
	jmp	.LBB7_49
	.p2align	4, 0x90
.LBB7_46:                               # %polly.loop_header687.lver.orig
                                        #   in Loop: Header=BB7_42 Depth=5
	movq	-16(%rdi,%r8), %rbx
	movq	%r15, %rdi
	imulq	%rbx, %rdi
	movq	8(%rsp), %rcx           # 8-byte Reload
	movq	40(%rsp), %rax          # 8-byte Reload
	addq	%rdi, (%rcx,%rax,8)
	movq	%rdx, %rdi
	imulq	%rbx, %rdi
	movq	96(%rsp), %rax          # 8-byte Reload
	addq	%rdi, (%rcx,%rax,8)
	movq	%r13, %rdi
	imulq	%rbx, %rdi
	movq	88(%rsp), %rax          # 8-byte Reload
	addq	%rdi, (%rcx,%rax,8)
	movq	128(%rsp), %rdi         # 8-byte Reload
	imulq	%rsi, %rbx
	addq	%rbx, (%rcx,%r10,8)
	cmpq	$1, 136(%rsp)           # 8-byte Folded Reload
	je	.LBB7_49
# BB#47:                                # %polly.loop_header687.lver.orig.1
                                        #   in Loop: Header=BB7_42 Depth=5
	movq	-8(%rdi,%r8), %rax
	movq	%r15, %rdi
	imulq	%rax, %rdi
	addq	%rdi, (%rcx,%r12,8)
	movq	%rdx, %rdi
	imulq	%rax, %rdi
	addq	%rdi, 8(%rcx,%r12,8)
	movq	%r13, %rdi
	imulq	%rax, %rdi
	addq	%rdi, 16(%rcx,%r12,8)
	movq	128(%rsp), %rdi         # 8-byte Reload
	imulq	%rsi, %rax
	addq	%rax, 24(%rcx,%r12,8)
	cmpq	$2, 136(%rsp)           # 8-byte Folded Reload
	je	.LBB7_49
# BB#48:                                # %polly.loop_header687.lver.orig.2
                                        #   in Loop: Header=BB7_42 Depth=5
	movq	(%rdi,%r8), %rax
	imulq	%rax, %r15
	movq	80(%rsp), %r11          # 8-byte Reload
	addq	%r15, (%rcx,%r11,8)
	imulq	%rax, %rdx
	movq	72(%rsp), %rbx          # 8-byte Reload
	addq	%rdx, (%rcx,%rbx,8)
	imulq	%rax, %r13
	addq	%r13, 16(%rcx,%r11,8)
	imulq	%rax, %rsi
	addq	%rsi, 24(%rcx,%r11,8)
	.p2align	4, 0x90
.LBB7_49:                               # %polly.loop_exit689
                                        #   in Loop: Header=BB7_42 Depth=5
	incq	%r9
	addq	$32, %r8
	cmpq	272(%rsp), %r9          # 8-byte Folded Reload
	jle	.LBB7_42
.LBB7_50:                               # %polly.merge673
                                        #   in Loop: Header=BB7_33 Depth=4
	addq	$12288, 144(%rsp)       # 8-byte Folded Spill
                                        # imm = 0x3000
	movq	56(%rsp), %rax          # 8-byte Reload
	cmpq	664(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	jle	.LBB7_33
.LBB7_51:                               # %polly.cond722
                                        #   in Loop: Header=BB7_23 Depth=3
	movq	32(%rsp), %rax          # 8-byte Reload
	orq	$3, %rax
	movq	%rax, 248(%rsp)         # 8-byte Spill
	cmpq	24(%rsp), %rax          # 8-byte Folded Reload
	setge	%al
	cmpq	$0, 576(%rsp)           # 8-byte Folded Reload
	movq	432(%rsp), %r14         # 8-byte Reload
	js	.LBB7_79
# BB#52:                                # %polly.cond722
                                        #   in Loop: Header=BB7_23 Depth=3
	orb	6(%rsp), %al            # 1-byte Folded Reload
	je	.LBB7_79
# BB#53:                                # %polly.loop_header729.preheader
                                        #   in Loop: Header=BB7_23 Depth=3
	movq	240(%rsp), %rax         # 8-byte Reload
	shlq	$4, %rax
	movq	552(%rsp), %rcx         # 8-byte Reload
	subq	%rax, %rcx
	cmpq	$16, %rcx
	movl	$15, %eax
	cmovgeq	%rax, %rcx
	movq	232(%rsp), %rax         # 8-byte Reload
	subq	32(%rsp), %rax          # 8-byte Folded Reload
	movq	%rax, 144(%rsp)         # 8-byte Spill
	movq	%rcx, 56(%rsp)          # 8-byte Spill
	leaq	-1(%rcx), %rax
	movq	%rax, 280(%rsp)         # 8-byte Spill
	movq	416(%rsp), %rax         # 8-byte Reload
	movq	%rax, 184(%rsp)         # 8-byte Spill
	leaq	197312(%rsp), %rax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	392(%rsp), %rsi         # 8-byte Reload
	movq	408(%rsp), %rax         # 8-byte Reload
	movq	%rax, 176(%rsp)         # 8-byte Spill
	leaq	197360(%rsp), %rax
	movq	%rax, 152(%rsp)         # 8-byte Spill
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB7_54:                               # %polly.loop_header729
                                        #   Parent Loop BB7_14 Depth=1
                                        #     Parent Loop BB7_15 Depth=2
                                        #       Parent Loop BB7_23 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB7_57 Depth 5
                                        #             Child Loop BB7_59 Depth 6
                                        #               Child Loop BB7_63 Depth 7
                                        #                 Child Loop BB7_68 Depth 8
                                        #                 Child Loop BB7_74 Depth 8
	movq	248(%rsp), %rax         # 8-byte Reload
	cmpq	24(%rsp), %rax          # 8-byte Folded Reload
	setge	%r8b
	cmpq	$-5, %rsi
	movq	$-4, %rdx
	movq	%rsi, 256(%rsp)         # 8-byte Spill
	cmovgq	%rsi, %rdx
	movq	$-2, %rax
	subq	%rdx, %rax
	cmpq	$-2, %rax
	movq	$-1, %rdi
	cmovleq	%rdi, %rax
	movq	680(%rsp), %rdx         # 8-byte Reload
	leaq	(%rdx,%rcx,4), %rdx
	cmpq	$-5, %rdx
	movq	$-4, %rsi
	cmovgq	%rdx, %rsi
	movq	$-2, %r9
	subq	%rsi, %r9
	cmpq	$-2, %r9
	cmovleq	%rdi, %r9
	cmpq	$-5, %rdx
	movq	$-4, %rsi
	cmovleq	%rsi, %rdx
	movq	$-2, %r13
	subq	%rdx, %r13
	cmpq	$-2, %r13
	cmovleq	%rdi, %r13
	movq	120(%rsp), %rdx         # 8-byte Reload
	movq	%rcx, 192(%rsp)         # 8-byte Spill
	leaq	(%rdx,%rcx,4), %rdx
	movq	%rdx, 320(%rsp)         # 8-byte Spill
	orq	$3, %rdx
	cmpq	16(%rsp), %rdx          # 8-byte Folded Reload
	setge	%dl
	cmpq	$0, 56(%rsp)            # 8-byte Folded Reload
	js	.LBB7_78
# BB#55:                                # %polly.loop_header729
                                        #   in Loop: Header=BB7_54 Depth=4
	orb	%dl, %r8b
	je	.LBB7_78
# BB#56:                                # %polly.loop_header743.preheader
                                        #   in Loop: Header=BB7_54 Depth=4
	addq	$-2, %rax
	shrq	$2, %rax
	leal	1(%rax), %ecx
	andl	$1, %ecx
	decq	%rcx
	subq	%rax, %rcx
	movq	%rcx, 88(%rsp)          # 8-byte Spill
	movq	192(%rsp), %rcx         # 8-byte Reload
	leaq	(,%rcx,4), %rax
	addq	$-2, %r9
	shrq	$2, %r9
	movq	%r9, 40(%rsp)           # 8-byte Spill
	leaq	1(%r9), %rdx
	movq	%rdx, 96(%rsp)          # 8-byte Spill
	addq	$2, %r13
	movq	656(%rsp), %rdx         # 8-byte Reload
	subq	%rax, %rdx
	cmpq	$4, %rdx
	movl	$3, %eax
	cmovgeq	%rax, %rdx
	movq	%rcx, %rax
	shlq	$7, %rax
	leaq	(%rax,%rax,2), %rax
	movq	%rax, 288(%rsp)         # 8-byte Spill
	movq	%rdx, 304(%rsp)         # 8-byte Spill
	leaq	-1(%rdx), %rcx
	movq	%r13, %r15
	andq	$-4, %r15
	movq	184(%rsp), %rax         # 8-byte Reload
	movq	%rax, 208(%rsp)         # 8-byte Spill
	movq	176(%rsp), %rax         # 8-byte Reload
	movq	%rax, 200(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 160(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB7_57:                               # %polly.loop_header743
                                        #   Parent Loop BB7_14 Depth=1
                                        #     Parent Loop BB7_15 Depth=2
                                        #       Parent Loop BB7_23 Depth=3
                                        #         Parent Loop BB7_54 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB7_59 Depth 6
                                        #               Child Loop BB7_63 Depth 7
                                        #                 Child Loop BB7_68 Depth 8
                                        #                 Child Loop BB7_74 Depth 8
	cmpq	$0, 264(%rsp)           # 8-byte Folded Reload
	js	.LBB7_77
# BB#58:                                # %polly.loop_header756.preheader
                                        #   in Loop: Header=BB7_57 Depth=5
	movq	160(%rsp), %rdx         # 8-byte Reload
	leaq	(,%rdx,4), %rax
	movq	144(%rsp), %rsi         # 8-byte Reload
	subq	%rax, %rsi
	cmpq	$4, %rsi
	movl	$3, %eax
	cmovgeq	%rax, %rsi
	movq	32(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%rdx,4), %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	%rdx, %rax
	shlq	$7, %rax
	leaq	(%rax,%rax,2), %rax
	movq	%rax, 296(%rsp)         # 8-byte Spill
	movq	%rsi, 312(%rsp)         # 8-byte Spill
	leaq	-1(%rsi), %r12
	movq	64(%rsp), %r11          # 8-byte Reload
	movq	152(%rsp), %r10         # 8-byte Reload
	xorl	%eax, %eax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB7_59:                               # %polly.loop_header756
                                        #   Parent Loop BB7_14 Depth=1
                                        #     Parent Loop BB7_15 Depth=2
                                        #       Parent Loop BB7_23 Depth=3
                                        #         Parent Loop BB7_54 Depth=4
                                        #           Parent Loop BB7_57 Depth=5
                                        # =>          This Loop Header: Depth=6
                                        #               Child Loop BB7_63 Depth 7
                                        #                 Child Loop BB7_68 Depth 8
                                        #                 Child Loop BB7_74 Depth 8
	cmpq	$0, 312(%rsp)           # 8-byte Folded Reload
	js	.LBB7_76
# BB#60:                                # %polly.loop_header765.preheader
                                        #   in Loop: Header=BB7_59 Depth=6
	cmpq	$0, 304(%rsp)           # 8-byte Folded Reload
	js	.LBB7_76
# BB#61:                                # %polly.loop_header765.us.preheader
                                        #   in Loop: Header=BB7_59 Depth=6
	movq	296(%rsp), %rax         # 8-byte Reload
	movq	48(%rsp), %rdx          # 8-byte Reload
	movq	%rdx, %rsi
	leaq	(%rsi,%rax), %rax
	shlq	$2, %rax
	movq	288(%rsp), %rdx         # 8-byte Reload
	leaq	(%rsi,%rdx), %rdx
	shlq	$2, %rdx
	movq	%rdx, 80(%rsp)          # 8-byte Spill
	movq	208(%rsp), %rbx         # 8-byte Reload
	movq	200(%rsp), %r8          # 8-byte Reload
	xorl	%r9d, %r9d
	jmp	.LBB7_63
.LBB7_62:                               #   in Loop: Header=BB7_63 Depth=7
	xorl	%r14d, %r14d
	testb	$1, 96(%rsp)            # 1-byte Folded Reload
	jne	.LBB7_70
	jmp	.LBB7_71
	.p2align	4, 0x90
.LBB7_63:                               # %polly.loop_header765.us
                                        #   Parent Loop BB7_14 Depth=1
                                        #     Parent Loop BB7_15 Depth=2
                                        #       Parent Loop BB7_23 Depth=3
                                        #         Parent Loop BB7_54 Depth=4
                                        #           Parent Loop BB7_57 Depth=5
                                        #             Parent Loop BB7_59 Depth=6
                                        # =>            This Loop Header: Depth=7
                                        #                 Child Loop BB7_68 Depth 8
                                        #                 Child Loop BB7_74 Depth 8
	leaq	(%r9,%rax), %rdx
	cmpq	$4, %r13
	movq	704(%rsp,%rdx,8), %rdx
	jb	.LBB7_72
# BB#65:                                # %min.iters.checked
                                        #   in Loop: Header=BB7_63 Depth=7
	testq	%r15, %r15
	je	.LBB7_72
# BB#66:                                # %vector.ph
                                        #   in Loop: Header=BB7_63 Depth=7
	cmpq	$0, 40(%rsp)            # 8-byte Folded Reload
	movd	%rdx, %xmm0
	pshufd	$68, %xmm0, %xmm0       # xmm0 = xmm0[0,1,0,1]
	je	.LBB7_62
# BB#67:                                # %vector.ph.new
                                        #   in Loop: Header=BB7_63 Depth=7
	movq	88(%rsp), %rdi          # 8-byte Reload
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB7_68:                               # %vector.body
                                        #   Parent Loop BB7_14 Depth=1
                                        #     Parent Loop BB7_15 Depth=2
                                        #       Parent Loop BB7_23 Depth=3
                                        #         Parent Loop BB7_54 Depth=4
                                        #           Parent Loop BB7_57 Depth=5
                                        #             Parent Loop BB7_59 Depth=6
                                        #               Parent Loop BB7_63 Depth=7
                                        # =>              This Inner Loop Header: Depth=8
	movdqu	-48(%r8,%r14,8), %xmm5
	movdqu	-32(%r8,%r14,8), %xmm8
	movdqa	-48(%r10,%r14,8), %xmm2
	movdqa	-32(%r10,%r14,8), %xmm6
	movdqa	%xmm0, %xmm1
	psrlq	$32, %xmm1
	movdqa	%xmm2, %xmm3
	pmuludq	%xmm1, %xmm3
	movdqa	%xmm2, %xmm7
	psrlq	$32, %xmm7
	pmuludq	%xmm0, %xmm7
	paddq	%xmm3, %xmm7
	psllq	$32, %xmm7
	pmuludq	%xmm0, %xmm2
	movdqa	%xmm6, %xmm4
	pmuludq	%xmm1, %xmm4
	movdqa	%xmm6, %xmm3
	psrlq	$32, %xmm3
	pmuludq	%xmm0, %xmm3
	paddq	%xmm4, %xmm3
	psllq	$32, %xmm3
	pmuludq	%xmm0, %xmm6
	paddq	%xmm5, %xmm2
	paddq	%xmm7, %xmm2
	paddq	%xmm8, %xmm6
	paddq	%xmm3, %xmm6
	movdqu	%xmm2, -48(%r8,%r14,8)
	movdqu	%xmm6, -32(%r8,%r14,8)
	movdqu	-16(%r8,%r14,8), %xmm4
	movdqu	(%r8,%r14,8), %xmm5
	movdqa	-16(%r10,%r14,8), %xmm2
	movdqa	(%r10,%r14,8), %xmm3
	movdqa	%xmm2, %xmm6
	pmuludq	%xmm1, %xmm6
	movdqa	%xmm2, %xmm7
	psrlq	$32, %xmm7
	pmuludq	%xmm0, %xmm7
	paddq	%xmm6, %xmm7
	psllq	$32, %xmm7
	pmuludq	%xmm0, %xmm2
	pmuludq	%xmm3, %xmm1
	movdqa	%xmm3, %xmm6
	psrlq	$32, %xmm6
	pmuludq	%xmm0, %xmm6
	paddq	%xmm1, %xmm6
	psllq	$32, %xmm6
	pmuludq	%xmm0, %xmm3
	paddq	%xmm4, %xmm2
	paddq	%xmm7, %xmm2
	paddq	%xmm5, %xmm3
	paddq	%xmm6, %xmm3
	movdqu	%xmm2, -16(%r8,%r14,8)
	movdqu	%xmm3, (%r8,%r14,8)
	addq	$8, %r14
	addq	$2, %rdi
	jne	.LBB7_68
# BB#69:                                # %middle.block.unr-lcssa
                                        #   in Loop: Header=BB7_63 Depth=7
	testb	$1, 96(%rsp)            # 1-byte Folded Reload
	je	.LBB7_71
.LBB7_70:                               # %vector.body.epil
                                        #   in Loop: Header=BB7_63 Depth=7
	movq	72(%rsp), %rsi          # 8-byte Reload
	leaq	(%rsi,%r9), %rdi
	imulq	16(%rsp), %rdi          # 8-byte Folded Reload
	addq	320(%rsp), %rdi         # 8-byte Folded Reload
	addq	%r14, %rdi
	movq	8(%rsp), %rsi           # 8-byte Reload
	movdqu	(%rsi,%rdi,8), %xmm4
	movdqu	16(%rsi,%rdi,8), %xmm1
	addq	80(%rsp), %r14          # 8-byte Folded Reload
	movdqa	197312(%rsp,%r14,8), %xmm2
	movdqa	197328(%rsp,%r14,8), %xmm3
	movdqa	%xmm0, %xmm5
	psrlq	$32, %xmm5
	movdqa	%xmm2, %xmm6
	pmuludq	%xmm5, %xmm6
	movdqa	%xmm2, %xmm7
	psrlq	$32, %xmm7
	pmuludq	%xmm0, %xmm7
	paddq	%xmm6, %xmm7
	psllq	$32, %xmm7
	pmuludq	%xmm0, %xmm2
	pmuludq	%xmm3, %xmm5
	movdqa	%xmm3, %xmm6
	psrlq	$32, %xmm6
	pmuludq	%xmm0, %xmm6
	paddq	%xmm5, %xmm6
	psllq	$32, %xmm6
	pmuludq	%xmm0, %xmm3
	paddq	%xmm4, %xmm2
	paddq	%xmm7, %xmm2
	paddq	%xmm1, %xmm3
	paddq	%xmm6, %xmm3
	movdqu	%xmm2, (%rsi,%rdi,8)
	movdqu	%xmm3, 16(%rsi,%rdi,8)
.LBB7_71:                               # %middle.block
                                        #   in Loop: Header=BB7_63 Depth=7
	cmpq	%r15, %r13
	movq	%r15, %rdi
	movq	432(%rsp), %r14         # 8-byte Reload
	jne	.LBB7_73
	jmp	.LBB7_75
	.p2align	4, 0x90
.LBB7_72:                               #   in Loop: Header=BB7_63 Depth=7
	xorl	%edi, %edi
.LBB7_73:                               # %polly.loop_header774.us.preheader
                                        #   in Loop: Header=BB7_63 Depth=7
	decq	%rdi
	.p2align	4, 0x90
.LBB7_74:                               # %polly.loop_header774.us
                                        #   Parent Loop BB7_14 Depth=1
                                        #     Parent Loop BB7_15 Depth=2
                                        #       Parent Loop BB7_23 Depth=3
                                        #         Parent Loop BB7_54 Depth=4
                                        #           Parent Loop BB7_57 Depth=5
                                        #             Parent Loop BB7_59 Depth=6
                                        #               Parent Loop BB7_63 Depth=7
                                        # =>              This Inner Loop Header: Depth=8
	movq	8(%r11,%rdi,8), %rsi
	imulq	%rdx, %rsi
	addq	%rsi, 8(%rbx,%rdi,8)
	incq	%rdi
	cmpq	%rcx, %rdi
	jle	.LBB7_74
.LBB7_75:                               # %polly.loop_exit776.loopexit.us
                                        #   in Loop: Header=BB7_63 Depth=7
	addq	%r14, %r8
	addq	%r14, %rbx
	cmpq	%r12, %r9
	leaq	1(%r9), %r9
	jle	.LBB7_63
.LBB7_76:                               # %polly.loop_exit767
                                        #   in Loop: Header=BB7_59 Depth=6
	addq	$32, %r10
	addq	$32, %r11
	movq	272(%rsp), %rbx         # 8-byte Reload
	movq	48(%rsp), %rax          # 8-byte Reload
	cmpq	%rbx, %rax
	leaq	1(%rax), %rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	jle	.LBB7_59
.LBB7_77:                               # %polly.loop_exit758
                                        #   in Loop: Header=BB7_57 Depth=5
	movq	696(%rsp), %rax         # 8-byte Reload
	addq	%rax, 200(%rsp)         # 8-byte Folded Spill
	addq	%rax, 208(%rsp)         # 8-byte Folded Spill
	movq	160(%rsp), %rax         # 8-byte Reload
	cmpq	280(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 160(%rsp)         # 8-byte Spill
	jle	.LBB7_57
.LBB7_78:                               # %polly.merge738
                                        #   in Loop: Header=BB7_54 Depth=4
	addq	$12288, 152(%rsp)       # 8-byte Folded Spill
                                        # imm = 0x3000
	addq	$32, 176(%rsp)          # 8-byte Folded Spill
	movq	256(%rsp), %rsi         # 8-byte Reload
	addq	$4, %rsi
	addq	$12288, 64(%rsp)        # 8-byte Folded Spill
                                        # imm = 0x3000
	addq	$32, 184(%rsp)          # 8-byte Folded Spill
	movq	192(%rsp), %rcx         # 8-byte Reload
	cmpq	672(%rsp), %rcx         # 8-byte Folded Reload
	leaq	1(%rcx), %rcx
	jle	.LBB7_54
.LBB7_79:                               # %polly.merge723
                                        #   in Loop: Header=BB7_23 Depth=3
	addq	$-16, 424(%rsp)         # 8-byte Folded Spill
	movq	568(%rsp), %rax         # 8-byte Reload
	movq	616(%rsp), %r13         # 8-byte Reload
	addq	%rax, %r13
	movq	128(%rsp), %rcx         # 8-byte Reload
	addq	$-196608, %rcx          # imm = 0xFFFD0000
	addq	%rax, 408(%rsp)         # 8-byte Folded Spill
	addq	%rax, 416(%rsp)         # 8-byte Folded Spill
	movq	240(%rsp), %rax         # 8-byte Reload
	cmpq	400(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	584(%rsp), %r11         # 8-byte Reload
	movq	608(%rsp), %r15         # 8-byte Reload
	movq	600(%rsp), %r12         # 8-byte Reload
	movq	592(%rsp), %r10         # 8-byte Reload
	jne	.LBB7_23
.LBB7_80:                               # %polly.loop_exit305
                                        #   in Loop: Header=BB7_15 Depth=2
	addq	$384, %r12              # imm = 0x180
	addq	$1536, %r15             # imm = 0x600
	decq	384(%rsp)               # 8-byte Folded Spill
	movq	224(%rsp), %rax         # 8-byte Reload
	addq	496(%rsp), %rax         # 8-byte Folded Reload
	movq	%rax, 224(%rsp)         # 8-byte Spill
	decq	368(%rsp)               # 8-byte Folded Spill
	addq	$3072, 376(%rsp)        # 8-byte Folded Spill
                                        # imm = 0xC00
	movq	168(%rsp), %rax         # 8-byte Reload
	cmpq	504(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 168(%rsp)         # 8-byte Spill
	jl	.LBB7_15
# BB#81:                                # %polly.loop_exit272
                                        #   in Loop: Header=BB7_14 Depth=1
	movq	480(%rsp), %rdi         # 8-byte Reload
	addq	$-256, %rdi
	movq	104(%rsp), %r8          # 8-byte Reload
	addq	$8192, %r8              # imm = 0x2000
	addq	$8192, 360(%rsp)        # 8-byte Folded Spill
                                        # imm = 0x2000
	addq	$1024, 392(%rsp)        # 8-byte Folded Spill
                                        # imm = 0x400
	addq	$8192, 352(%rsp)        # 8-byte Folded Spill
                                        # imm = 0x2000
	cmpq	472(%rsp), %r11         # 8-byte Folded Reload
	leaq	1(%r11), %r11
	movq	16(%rsp), %rbx          # 8-byte Reload
	jne	.LBB7_14
	jmp	.LBB7_93
.LBB7_82:                               # %while.cond34.preheader.preheader
	movq	16(%rsp), %rbx          # 8-byte Reload
	testq	%rbx, %rbx
	movq	104(%rsp), %r8          # 8-byte Reload
	jle	.LBB7_93
# BB#83:                                # %while.cond34.preheader.us.preheader
	movl	%ebx, %r9d
	andl	$1, %r9d
	movq	%rbx, %r15
	subq	%r9, %r15
	leaq	(,%rbx,8), %r12
	movq	%rbx, %r13
	shlq	$4, %r13
	movq	216(%rsp), %rax         # 8-byte Reload
	leaq	8(%rax), %rdi
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB7_84:                               # %while.cond34.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_85 Depth 2
                                        #       Child Loop BB7_88 Depth 3
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movq	%rax, %r10
	imulq	%rbx, %r10
	movq	%r8, %r11
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB7_85:                               # %while.cond39.preheader.us.us
                                        #   Parent Loop BB7_84 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_88 Depth 3
	leaq	(%r14,%r10), %rax
	cmpq	$1, %rbx
	movq	8(%rsp), %rcx           # 8-byte Reload
	movq	(%rcx,%rax,8), %rbx
	jne	.LBB7_87
# BB#86:                                #   in Loop: Header=BB7_85 Depth=2
	xorl	%ecx, %ecx
	jmp	.LBB7_89
	.p2align	4, 0x90
.LBB7_87:                               # %while.cond39.preheader.us.us.new
                                        #   in Loop: Header=BB7_85 Depth=2
	movq	%r11, %rdx
	xorl	%ecx, %ecx
	movq	8(%rsp), %r8            # 8-byte Reload
	.p2align	4, 0x90
.LBB7_88:                               # %if.end43.us.us
                                        #   Parent Loop BB7_84 Depth=1
                                        #     Parent Loop BB7_85 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	(%rdx), %rsi
	imulq	-8(%rdi,%rcx,8), %rsi
	addq	%rbx, %rsi
	movq	%rsi, (%r8,%rax,8)
	movq	(%rdx,%r12), %rbx
	imulq	(%rdi,%rcx,8), %rbx
	addq	%rsi, %rbx
	movq	%rbx, (%r8,%rax,8)
	addq	$2, %rcx
	addq	%r13, %rdx
	cmpq	%rcx, %r15
	jne	.LBB7_88
.LBB7_89:                               # %blklab17.loopexit.us.us.unr-lcssa
                                        #   in Loop: Header=BB7_85 Depth=2
	testq	%r9, %r9
	movq	104(%rsp), %r8          # 8-byte Reload
	je	.LBB7_91
# BB#90:                                # %if.end43.us.us.epil
                                        #   in Loop: Header=BB7_85 Depth=2
	leaq	(%rcx,%r10), %rdx
	imulq	16(%rsp), %rcx          # 8-byte Folded Reload
	addq	%r14, %rcx
	movq	(%r8,%rcx,8), %rcx
	movq	216(%rsp), %rsi         # 8-byte Reload
	imulq	(%rsi,%rdx,8), %rcx
	addq	%rbx, %rcx
	movq	8(%rsp), %rdx           # 8-byte Reload
	movq	%rcx, (%rdx,%rax,8)
.LBB7_91:                               # %blklab17.loopexit.us.us
                                        #   in Loop: Header=BB7_85 Depth=2
	incq	%r14
	addq	$8, %r11
	movq	16(%rsp), %rbx          # 8-byte Reload
	cmpq	%rbx, %r14
	jne	.LBB7_85
# BB#92:                                # %blklab15.loopexit.us-lcssa.us.us
                                        #   in Loop: Header=BB7_84 Depth=1
	movq	40(%rsp), %rax          # 8-byte Reload
	incq	%rax
	addq	%r12, %rdi
	cmpq	24(%rsp), %rax          # 8-byte Folded Reload
	jne	.LBB7_84
.LBB7_93:                               # %if.end61
	movl	$32, %edi
	callq	malloc
	movq	%rbx, %rcx
	movq	%rax, %rbx
	movq	440(%rsp), %rax         # 8-byte Reload
	movq	%rax, 8(%rbx)
	movq	8(%rsp), %rax           # 8-byte Reload
	movq	%rax, (%rbx)
	movq	24(%rsp), %rax          # 8-byte Reload
	movq	%rax, 24(%rbx)
	movq	%rcx, 16(%rbx)
	cmpb	$0, 328(%rsp)           # 1-byte Folded Reload
	je	.LBB7_95
# BB#94:                                # %if.then69
	movq	336(%rsp), %r14         # 8-byte Reload
	movq	(%r14), %rdi
	callq	free
	movq	%r14, %rdi
	callq	free
.LBB7_95:                               # %if.end70
	cmpb	$0, 332(%rsp)           # 1-byte Folded Reload
	je	.LBB7_97
# BB#96:                                # %if.then72
	movq	344(%rsp), %r14         # 8-byte Reload
	movq	(%r14), %rdi
	callq	free
	movq	%r14, %rdi
	callq	free
.LBB7_97:                               # %if.end94
	movq	%rbx, %rax
	leaq	-40(%rbp), %rsp
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
.Lcfi63:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi64:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi65:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi66:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi67:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi68:
	.cfi_def_cfa_offset 56
	subq	$104, %rsp
.Lcfi69:
	.cfi_def_cfa_offset 160
.Lcfi70:
	.cfi_offset %rbx, -56
.Lcfi71:
	.cfi_offset %r12, -48
.Lcfi72:
	.cfi_offset %r13, -40
.Lcfi73:
	.cfi_offset %r14, -32
.Lcfi74:
	.cfi_offset %r15, -24
.Lcfi75:
	.cfi_offset %rbp, -16
	movq	$0, 48(%rsp)
	movq	$0, 96(%rsp)
	leaq	48(%rsp), %rdx
	leaq	96(%rsp), %rcx
	callq	convertArgsToIntArray
	movq	%rax, %rbx
	movq	(%rbx), %rdi
	callq	parseStringToInt
	testq	%rax, %rax
	jne	.LBB8_2
# BB#1:
	xorl	%r14d, %r14d
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	xorl	%eax, %eax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	xorl	%ebp, %ebp
	xorl	%r15d, %r15d
	testq	%rbx, %rbx
	jne	.LBB8_14
	jmp	.LBB8_15
.LBB8_2:                                # %if.end14
	movq	%rbx, 32(%rsp)          # 8-byte Spill
	movq	%rax, 88(%rsp)          # 8-byte Spill
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
	testq	%rax, %rax
	setne	%cl
	movq	%rcx, 16(%rsp)          # 8-byte Spill
	movl	$7, %esi
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	%rax, %rdi
	callq	printf_s
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	printf
	movq	%rbx, %rbp
	imulq	%rbp, %rbp
	xorl	%edi, %edi
	movq	%rbp, %rsi
	callq	create1DArray_int64_t
	movq	%rax, %r14
	testq	%rbx, %rbx
	jle	.LBB8_4
# BB#3:                                 # %polly.parallel.for.i
	leaq	-1(%rbx), %r8
	sarq	$5, %r8
	movq	%rbx, 56(%rsp)
	movq	%rbx, 64(%rsp)
	movq	%r14, 72(%rsp)
	incq	%r8
	leaq	56(%rsp), %r15
	movl	$_init__polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r15, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%r15, %rdi
	callq	_init__polly_subfn
	callq	GOMP_parallel_end
.LBB8_4:                                # %_init_.exit
	movl	$32, %edi
	callq	malloc
	movq	%rax, %r13
	movq	%rbp, 8(%r13)
	movq	%r14, (%r13)
	movq	%rbx, 24(%r13)
	movq	%rbx, 16(%r13)
	xorl	%edi, %edi
	movq	%rbp, %rsi
	callq	create1DArray_int64_t
	movq	%rax, %r15
	testq	%rbx, %rbx
	jle	.LBB8_6
# BB#5:                                 # %polly.parallel.for.i325
	leaq	-1(%rbx), %r8
	sarq	$5, %r8
	movq	%rbx, 56(%rsp)
	movq	%rbx, 64(%rsp)
	movq	%r15, 72(%rsp)
	incq	%r8
	leaq	56(%rsp), %r14
	movl	$_init__polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r14, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%r14, %rdi
	callq	_init__polly_subfn
	callq	GOMP_parallel_end
.LBB8_6:                                # %if.end146
	movl	$32, %edi
	callq	malloc
	movq	%rax, %r14
	movq	%rbp, 8(%r14)
	movq	%r15, (%r14)
	movq	%rbx, 24(%r14)
	movq	%rbx, 16(%r14)
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	callq	_mat_mult_
	movq	%rax, %r15
	xorl	%edi, %edi
	movl	$27, %esi
	callq	create1DArray_int64_t
	movq	%rax, %r12
	movaps	.LCPI8_3(%rip), %xmm0   # xmm0 = [77,97]
	movups	%xmm0, (%r12)
	movaps	.LCPI8_4(%rip), %xmm0   # xmm0 = [116,114]
	movups	%xmm0, 16(%r12)
	movaps	.LCPI8_5(%rip), %xmm0   # xmm0 = [105,120]
	movups	%xmm0, 32(%r12)
	movaps	.LCPI8_6(%rip), %xmm0   # xmm0 = [32,67]
	movups	%xmm0, 48(%r12)
	movaps	.LCPI8_7(%rip), %xmm0   # xmm0 = [91,115]
	movups	%xmm0, 64(%r12)
	movaps	.LCPI8_8(%rip), %xmm1   # xmm1 = [105,122]
	movups	%xmm1, 80(%r12)
	movaps	.LCPI8_9(%rip), %xmm2   # xmm2 = [101,45]
	movups	%xmm2, 96(%r12)
	movaps	.LCPI8_10(%rip), %xmm3  # xmm3 = [49,93]
	movups	%xmm3, 112(%r12)
	movups	%xmm0, 128(%r12)
	movups	%xmm1, 144(%r12)
	movups	%xmm2, 160(%r12)
	movups	%xmm3, 176(%r12)
	movaps	.LCPI8_2(%rip), %xmm0   # xmm0 = [32,61]
	movups	%xmm0, 192(%r12)
	movq	$32, 208(%r12)
	testq	%r12, %r12
	setne	%al
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movl	$27, %esi
	movq	%r12, %rdi
	callq	printf_s
	movq	(%r15), %rax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	-8(%rax,%rbp,8), %rsi
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%edi, %edi
	movl	$25, %esi
	callq	create1DArray_int64_t
	movq	%rax, %rbp
	movaps	.LCPI8_11(%rip), %xmm0  # xmm0 = [80,97]
	movups	%xmm0, (%rbp)
	movaps	.LCPI8_12(%rip), %xmm0  # xmm0 = [115,115]
	movups	%xmm0, 16(%rbp)
	movaps	.LCPI8_13(%rip), %xmm0  # xmm0 = [32,77]
	movups	%xmm0, 32(%rbp)
	movaps	.LCPI8_14(%rip), %xmm0  # xmm0 = [97,116]
	movups	%xmm0, 48(%rbp)
	movaps	.LCPI8_15(%rip), %xmm0  # xmm0 = [114,105]
	movups	%xmm0, 64(%rbp)
	movaps	.LCPI8_16(%rip), %xmm0  # xmm0 = [120,77]
	movups	%xmm0, 80(%rbp)
	movaps	.LCPI8_17(%rip), %xmm0  # xmm0 = [117,108]
	movups	%xmm0, 96(%rbp)
	movaps	.LCPI8_18(%rip), %xmm0  # xmm0 = [116,32]
	movups	%xmm0, 112(%rbp)
	movaps	.LCPI8_19(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 128(%rbp)
	movaps	.LCPI8_20(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 144(%rbp)
	movaps	.LCPI8_21(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 160(%rbp)
	movaps	.LCPI8_22(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 176(%rbp)
	movq	$101, 192(%rbp)
	testq	%rbp, %rbp
	setne	%bl
	movl	$25, %esi
	movq	%rbp, %rdi
	callq	println_s
	movq	88(%rsp), %rdi          # 8-byte Reload
	callq	free
	testq	%r13, %r13
	movq	%rbx, 8(%rsp)           # 8-byte Spill
	je	.LBB8_8
# BB#7:                                 # %if.then148
	movq	(%r13), %rdi
	callq	free
	movq	%r13, %rdi
	callq	free
.LBB8_8:                                # %if.end149
	testq	%r14, %r14
	movq	16(%rsp), %r13          # 8-byte Reload
	je	.LBB8_10
# BB#9:                                 # %if.then151
	movq	(%r14), %rdi
	callq	free
	movq	%r14, %rdi
	callq	free
.LBB8_10:                               # %if.end152
	testq	%r15, %r15
	movq	32(%rsp), %rbx          # 8-byte Reload
	movq	24(%rsp), %r14          # 8-byte Reload
	je	.LBB8_12
# BB#11:                                # %if.then154
	movq	80(%rsp), %rdi          # 8-byte Reload
	callq	free
	movq	%r15, %rdi
	callq	free
.LBB8_12:                               # %if.end158
	movq	8(%rsp), %r15           # 8-byte Reload
	testq	%rbx, %rbx
	je	.LBB8_15
.LBB8_14:                               # %if.then160
	movq	48(%rsp), %rsi
	movq	%rbx, %rdi
	callq	free2DArray_int64_t
.LBB8_15:                               # %if.end164
	testb	%r13b, %r13b
	jne	.LBB8_16
# BB#17:                                # %if.end176
	cmpb	$0, 40(%rsp)            # 1-byte Folded Reload
	jne	.LBB8_18
.LBB8_19:                               # %if.end182
	testb	%r15b, %r15b
	jne	.LBB8_20
.LBB8_21:                               # %if.end185
	xorl	%edi, %edi
	callq	exit
.LBB8_16:                               # %if.then166
	movq	%r14, %rdi
	callq	free
	cmpb	$0, 40(%rsp)            # 1-byte Folded Reload
	je	.LBB8_19
.LBB8_18:                               # %if.then178
	movq	%r12, %rdi
	callq	free
	testb	%r15b, %r15b
	je	.LBB8_21
.LBB8_20:                               # %if.then184
	movq	%rbp, %rdi
	callq	free
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
.Lcfi76:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi77:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi78:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi79:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi80:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi81:
	.cfi_def_cfa_offset 56
	subq	$136, %rsp
.Lcfi82:
	.cfi_def_cfa_offset 192
.Lcfi83:
	.cfi_offset %rbx, -56
.Lcfi84:
	.cfi_offset %r12, -48
.Lcfi85:
	.cfi_offset %r13, -40
.Lcfi86:
	.cfi_offset %r14, -32
.Lcfi87:
	.cfi_offset %r15, -24
.Lcfi88:
	.cfi_offset %rbp, -16
	movq	(%rdi), %rbx
	movq	8(%rdi), %rax
	movq	%rax, 88(%rsp)          # 8-byte Spill
	movq	16(%rdi), %r13
	leaq	56(%rsp), %rdi
	leaq	48(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB9_2
# BB#1:                                 # %polly.par.loadIVBounds.lr.ph
	movl	%ebx, %ebp
	andl	$3, %ebp
	leaq	-1(%rbx), %rax
	sarq	$5, %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	%rbx, %rax
	shrq	$2, %rax
	decq	%rax
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movq	%rbx, %rax
	andq	$-4, %rax
	movq	%rax, 128(%rsp)         # 8-byte Spill
	leaq	16(%r13,%rax,8), %rax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	%rbx, %rax
	shlq	$5, %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	%rbx, %rax
	shlq	$8, %rax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	leaq	(,%rbx,8), %r15
	leaq	16(%r13), %rax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB9_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB9_5 Depth 2
                                        #       Child Loop BB9_7 Depth 3
                                        #         Child Loop BB9_20 Depth 4
                                        #         Child Loop BB9_10 Depth 4
                                        #           Child Loop BB9_11 Depth 5
	movq	48(%rsp), %rax
	movq	56(%rsp), %rcx
	addq	$-2, %rax
	movq	%rax, 104(%rsp)         # 8-byte Spill
	movq	%rcx, %rax
	shlq	$5, %rax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movq	72(%rsp), %rax          # 8-byte Reload
	movq	%rcx, (%rsp)            # 8-byte Spill
	imulq	%rcx, %rax
	movq	80(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rax,8), %rcx
	movq	%rcx, 16(%rsp)          # 8-byte Spill
	movq	64(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rax,8), %rax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	.p2align	4, 0x90
.LBB9_5:                                # %polly.loop_header
                                        #   Parent Loop BB9_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB9_7 Depth 3
                                        #         Child Loop BB9_20 Depth 4
                                        #         Child Loop BB9_10 Depth 4
                                        #           Child Loop BB9_11 Depth 5
	cmpq	$0, 24(%rsp)            # 8-byte Folded Reload
	js	.LBB9_16
# BB#6:                                 # %polly.loop_header2.preheader
                                        #   in Loop: Header=BB9_5 Depth=2
	movq	(%rsp), %rcx            # 8-byte Reload
	shlq	$5, %rcx
	movq	88(%rsp), %rdx          # 8-byte Reload
	subq	%rcx, %rdx
	decq	%rdx
	cmpq	$32, %rdx
	movl	$31, %eax
	cmovgeq	%rax, %rdx
	movq	%rdx, 120(%rsp)         # 8-byte Spill
	leaq	-1(%rdx), %rax
	movq	8(%rsp), %rdx           # 8-byte Reload
	movq	%rdx, 32(%rsp)          # 8-byte Spill
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB9_7:                                # %polly.loop_header2
                                        #   Parent Loop BB9_4 Depth=1
                                        #     Parent Loop BB9_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB9_20 Depth 4
                                        #         Child Loop BB9_10 Depth 4
                                        #           Child Loop BB9_11 Depth 5
	cmpq	$0, 120(%rsp)           # 8-byte Folded Reload
	js	.LBB9_15
# BB#8:                                 # %polly.loop_header10.preheader
                                        #   in Loop: Header=BB9_7 Depth=3
	testq	%rbp, %rbp
	sete	%dl
	leaq	(,%r8,8), %rsi
	movq	112(%rsp), %r9          # 8-byte Reload
	subq	%rsi, %r9
	cmpq	$8, %r9
	movl	$7, %esi
	cmovgeq	%rsi, %r9
	movq	%r8, %rsi
	shlq	$5, %rsi
	orq	$31, %rsi
	cmpq	%rbx, %rsi
	setl	%r10b
	orb	%dl, %r10b
	testq	%r9, %r9
	js	.LBB9_17
# BB#9:                                 # %polly.loop_header10.us.preheader
                                        #   in Loop: Header=BB9_7 Depth=3
	decq	%r9
	movq	32(%rsp), %rsi          # 8-byte Reload
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB9_10:                               # %polly.loop_header10.us
                                        #   Parent Loop BB9_4 Depth=1
                                        #     Parent Loop BB9_5 Depth=2
                                        #       Parent Loop BB9_7 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB9_11 Depth 5
	leaq	(%r14,%rcx), %rdx
	movq	%rdx, %rdi
	imulq	%rbx, %rdi
	movd	%rdx, %xmm0
	pshufd	$68, %xmm0, %xmm0       # xmm0 = xmm0[0,1,0,1]
	movq	$-1, %r12
	movq	%rsi, %r11
	.p2align	4, 0x90
.LBB9_11:                               # %polly.loop_header19.us
                                        #   Parent Loop BB9_4 Depth=1
                                        #     Parent Loop BB9_5 Depth=2
                                        #       Parent Loop BB9_7 Depth=3
                                        #         Parent Loop BB9_10 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movdqu	-16(%r11), %xmm1
	movdqu	(%r11), %xmm2
	paddq	%xmm0, %xmm1
	movdqu	%xmm1, -16(%r11)
	paddq	%xmm0, %xmm2
	movdqu	%xmm2, (%r11)
	incq	%r12
	addq	$32, %r11
	cmpq	%r9, %r12
	jle	.LBB9_11
# BB#12:                                # %polly.cond.loopexit.us
                                        #   in Loop: Header=BB9_10 Depth=4
	testb	%r10b, %r10b
	jne	.LBB9_14
# BB#13:                                # %polly.loop_header34.us
                                        #   in Loop: Header=BB9_10 Depth=4
	addq	128(%rsp), %rdi         # 8-byte Folded Reload
	addq	%rdx, (%r13,%rdi,8)
	cmpq	$1, %rbp
	je	.LBB9_14
# BB#23:                                # %polly.loop_header34.us.1
                                        #   in Loop: Header=BB9_10 Depth=4
	addq	%rdx, 8(%r13,%rdi,8)
	cmpq	$2, %rbp
	je	.LBB9_14
# BB#24:                                # %polly.loop_header34.us.2
                                        #   in Loop: Header=BB9_10 Depth=4
	addq	%rdx, 16(%r13,%rdi,8)
	.p2align	4, 0x90
.LBB9_14:                               # %polly.merge.us
                                        #   in Loop: Header=BB9_10 Depth=4
	addq	%r15, %rsi
	cmpq	%rax, %r14
	leaq	1(%r14), %r14
	jle	.LBB9_10
	jmp	.LBB9_15
	.p2align	4, 0x90
.LBB9_17:                               # %polly.loop_header10.preheader.split
                                        #   in Loop: Header=BB9_7 Depth=3
	testb	%r10b, %r10b
	jne	.LBB9_15
# BB#18:                                # %polly.loop_header10.preheader85
                                        #   in Loop: Header=BB9_7 Depth=3
	movq	16(%rsp), %rdx          # 8-byte Reload
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB9_20:                               # %polly.loop_header34
                                        #   Parent Loop BB9_4 Depth=1
                                        #     Parent Loop BB9_5 Depth=2
                                        #       Parent Loop BB9_7 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	40(%rsp), %rsi          # 8-byte Reload
	leaq	(%rsi,%rdi), %rsi
	addq	%rsi, -16(%rdx)
	cmpq	$1, %rbp
	je	.LBB9_19
# BB#21:                                # %polly.loop_header34.1
                                        #   in Loop: Header=BB9_20 Depth=4
	addq	%rsi, -8(%rdx)
	cmpq	$2, %rbp
	je	.LBB9_19
# BB#22:                                # %polly.loop_header34.2
                                        #   in Loop: Header=BB9_20 Depth=4
	addq	%rsi, (%rdx)
.LBB9_19:                               # %polly.merge
                                        #   in Loop: Header=BB9_20 Depth=4
	addq	%r15, %rdx
	cmpq	%rax, %rdi
	leaq	1(%rdi), %rdi
	jle	.LBB9_20
	.p2align	4, 0x90
.LBB9_15:                               # %polly.loop_exit12
                                        #   in Loop: Header=BB9_7 Depth=3
	addq	$256, 32(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	cmpq	24(%rsp), %r8           # 8-byte Folded Reload
	leaq	1(%r8), %r8
	jne	.LBB9_7
.LBB9_16:                               # %polly.loop_exit4
                                        #   in Loop: Header=BB9_5 Depth=2
	addq	$32, 40(%rsp)           # 8-byte Folded Spill
	movq	96(%rsp), %rax          # 8-byte Reload
	addq	%rax, 16(%rsp)          # 8-byte Folded Spill
	addq	%rax, 8(%rsp)           # 8-byte Folded Spill
	movq	(%rsp), %rax            # 8-byte Reload
	cmpq	104(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, (%rsp)            # 8-byte Spill
	jle	.LBB9_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB9_4 Depth=1
	leaq	56(%rsp), %rdi
	leaq	48(%rsp), %rsi
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


	.ident	"clang version 5.0.0 (http://llvm.org/git/clang.git bab530ebdca2d56efb23f0da9e1b4303d02965b4) (http://llvm.org/git/llvm.git 251a136db40c5dcc80bd9dafec1c1d75d6be72b0)"
	.section	".note.GNU-stack","",@progbits
