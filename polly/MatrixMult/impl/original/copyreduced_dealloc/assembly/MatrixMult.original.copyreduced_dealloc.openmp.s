	.text
	.file	"llvm/MatrixMult.original.copyreduced_dealloc.openmp.ll"
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
	pushq	%r15
.Ltmp31:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp32:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp33:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp34:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp35:
	.cfi_def_cfa_offset 48
	subq	$32, %rsp
.Ltmp36:
	.cfi_def_cfa_offset 80
.Ltmp37:
	.cfi_offset %rbx, -48
.Ltmp38:
	.cfi_offset %r12, -40
.Ltmp39:
	.cfi_offset %r13, -32
.Ltmp40:
	.cfi_offset %r14, -24
.Ltmp41:
	.cfi_offset %r15, -16
	movq	%rsi, %rbx
	movq	%rdi, %r14
	movq	%rbx, %r15
	imulq	%r14, %r15
	xorl	%edi, %edi
	movl	%r15d, %esi
	callq	create1DArray
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
	movl	$init_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r13, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%r13, %rdi
	callq	init_polly_subfn
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
	.size	init, .Lfunc_end5-init
	.cfi_endproc

	.globl	print_mat
	.p2align	4, 0x90
	.type	print_mat,@function
print_mat:                              # @print_mat
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp42:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp43:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp44:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp45:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp46:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp47:
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
.Ltmp48:
	.cfi_def_cfa_offset 112
.Ltmp49:
	.cfi_offset %rbx, -56
.Ltmp50:
	.cfi_offset %r12, -48
.Ltmp51:
	.cfi_offset %r13, -40
.Ltmp52:
	.cfi_offset %r14, -32
.Ltmp53:
	.cfi_offset %r15, -24
.Ltmp54:
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
.LBB6_9:                                # %if.end9.us
                                        #   Parent Loop BB6_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rbx), %rax
	movq	(%rax,%r14), %rsi
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	callq	printf
	testb	$1, %r12b
	je	.LBB6_11
# BB#10:                                # %if.then11.us
                                        #   in Loop: Header=BB6_9 Depth=2
	movq	%rbp, %rdi
	callq	free
.LBB6_11:                               # %if.end12.us
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
# BB#13:                                # %if.then18.us
                                        #   in Loop: Header=BB6_8 Depth=1
	movq	(%rsp), %rdi            # 8-byte Reload
	callq	free
.LBB6_14:                               # %if.end19.us
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
.LBB6_3:                                # %while.cond3.preheader.preheader105
	xorl	%r14d, %r14d
                                        # implicit-def: %RAX
	movq	%rax, (%rsp)            # 8-byte Spill
	.p2align	4, 0x90
.LBB6_4:                                # %while.cond3.preheader
                                        # =>This Inner Loop Header: Depth=1
	testb	$1, %r14b
	je	.LBB6_6
# BB#5:                                 # %if.then18
                                        #   in Loop: Header=BB6_4 Depth=1
	movq	(%rsp), %rdi            # 8-byte Reload
	callq	free
.LBB6_6:                                # %if.end19
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
# BB#17:                                # %if.then23
	movq	(%rbx), %rdi
	callq	free
	movq	%rbx, %rdi
	callq	free
.LBB6_18:                               # %if.end27
	testb	%r15b, %r15b
	je	.LBB6_20
# BB#19:                                # %if.then29
	movq	%rbp, %rdi
	callq	free
.LBB6_20:                               # %if.end30
	testb	%r14b, %r14b
	je	.LBB6_21
# BB#22:                                # %if.then32
	movq	(%rsp), %rdi            # 8-byte Reload
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	free                    # TAILCALL
.LBB6_21:                               # %if.end33
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
.Ltmp55:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp56:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp57:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp58:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp59:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp60:
	.cfi_def_cfa_offset 56
	subq	$120, %rsp
.Ltmp61:
	.cfi_def_cfa_offset 176
.Ltmp62:
	.cfi_offset %rbx, -56
.Ltmp63:
	.cfi_offset %r12, -48
.Ltmp64:
	.cfi_offset %r13, -40
.Ltmp65:
	.cfi_offset %r14, -32
.Ltmp66:
	.cfi_offset %r15, -24
.Ltmp67:
	.cfi_offset %rbp, -16
	movl	%ecx, 36(%rsp)          # 4-byte Spill
	movl	%esi, 32(%rsp)          # 4-byte Spill
	movq	%rdx, 48(%rsp)          # 8-byte Spill
	movq	16(%rdx), %r15
	movq	%rdi, 40(%rsp)          # 8-byte Spill
	movq	24(%rdi), %rbx
	movq	%rbx, %rsi
	imulq	%r15, %rsi
	xorl	%edi, %edi
	movq	%rsi, 64(%rsp)          # 8-byte Spill
	callq	create1DArray
	movq	%rax, %rbp
	movq	%rbx, 8(%rsp)           # 8-byte Spill
	testq	%rbx, %rbx
	jle	.LBB7_13
# BB#1:                                 # %polly.split_new_and_old
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	(%rax), %rbx
	movq	48(%rsp), %rax          # 8-byte Reload
	movq	(%rax), %rdi
	movq	8(%rsp), %r8            # 8-byte Reload
	decq	%r8
	seto	%cl
	movq	%r8, %rdx
	imulq	%r15, %rdx
	seto	%al
	addq	%r15, %rdx
	seto	%r9b
	leaq	(%rbx,%rdx,8), %rsi
	cmpq	%rbp, %rsi
	setbe	%r10b
	leaq	(%rbp,%rdx,8), %rsi
	movq	%rbx, 16(%rsp)          # 8-byte Spill
	cmpq	%rbx, %rsi
	setbe	%bl
	orb	%r10b, %bl
	movq	%r15, %rdx
	decq	%rdx
	seto	%r11b
	imulq	%r15, %rdx
	seto	%r12b
	addq	%r15, %rdx
	seto	%r14b
	leaq	(%rdi,%rdx,8), %rdx
	cmpq	%rbp, %rdx
	setbe	%dl
	movq	%rdi, 24(%rsp)          # 8-byte Spill
	cmpq	%rdi, %rsi
	setbe	%r10b
	cmpb	$1, %bl
	jne	.LBB7_4
# BB#2:                                 # %polly.split_new_and_old
	orb	%r10b, %dl
	je	.LBB7_4
# BB#3:                                 # %polly.split_new_and_old
	orb	%cl, %r14b
	orb	%al, %cl
	orb	%r11b, %cl
	orb	%r12b, %cl
	orb	%r9b, %cl
	orb	%r14b, %cl
	orb	%r9b, %al
	orb	%cl, %al
	xorb	$1, %al
	testb	$1, %al
	je	.LBB7_4
# BB#20:                                # %polly.parallel.for
	sarq	$5, %r8
	movq	%r15, 80(%rsp)
	movq	8(%rsp), %rax           # 8-byte Reload
	movq	%rax, 88(%rsp)
	movq	%rbp, 96(%rsp)
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	%rax, 104(%rsp)
	movq	24(%rsp), %rax          # 8-byte Reload
	movq	%rax, 112(%rsp)
	incq	%r8
	leaq	80(%rsp), %r14
	movl	$mat_mult_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r14, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%r14, %rdi
	callq	mat_mult_polly_subfn
	callq	GOMP_parallel_end
	jmp	.LBB7_13
.LBB7_4:                                # %while.cond33.preheader.preheader
	testq	%r15, %r15
	jle	.LBB7_13
# BB#5:                                 # %while.cond33.preheader.us.preheader
	movl	%r15d, %r14d
	andl	$1, %r14d
	movq	%r15, %rsi
	subq	%r14, %rsi
	leaq	(,%r15,8), %rdi
	movq	%r15, %rbx
	shlq	$4, %rbx
	movq	16(%rsp), %rax          # 8-byte Reload
	leaq	8(%rax), %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB7_6:                                # %while.cond33.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_7 Depth 2
                                        #       Child Loop BB7_19 Depth 3
	movq	%r9, 72(%rsp)           # 8-byte Spill
	imulq	%r15, %r9
	movq	24(%rsp), %r10          # 8-byte Reload
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB7_7:                                # %while.cond39.preheader.us.us
                                        #   Parent Loop BB7_6 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_19 Depth 3
	leaq	(%rdx,%r9), %r13
	cmpq	$1, %r15
	movq	(%rbp,%r13,8), %r12
	jne	.LBB7_18
# BB#8:                                 #   in Loop: Header=BB7_7 Depth=2
	xorl	%r8d, %r8d
	jmp	.LBB7_9
	.p2align	4, 0x90
.LBB7_18:                               # %while.cond39.preheader.us.us.new
                                        #   in Loop: Header=BB7_7 Depth=2
	movq	56(%rsp), %r11          # 8-byte Reload
	movq	%r10, %rax
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB7_19:                               # %if.end44.us.us
                                        #   Parent Loop BB7_6 Depth=1
                                        #     Parent Loop BB7_7 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	(%rax), %rcx
	imulq	-8(%r11), %rcx
	addq	%r12, %rcx
	movq	%rcx, (%rbp,%r13,8)
	movq	(%rdi,%rax), %r12
	imulq	(%r11), %r12
	addq	%rcx, %r12
	movq	%r12, (%rbp,%r13,8)
	addq	$2, %r8
	addq	%rbx, %rax
	addq	$16, %r11
	cmpq	%r8, %rsi
	jne	.LBB7_19
.LBB7_9:                                # %blklab17.loopexit.us.us.unr-lcssa
                                        #   in Loop: Header=BB7_7 Depth=2
	testq	%r14, %r14
	je	.LBB7_11
# BB#10:                                # %if.end44.us.us.epil
                                        #   in Loop: Header=BB7_7 Depth=2
	leaq	(%r8,%r9), %r11
	imulq	%r15, %r8
	addq	%rdx, %r8
	movq	24(%rsp), %rax          # 8-byte Reload
	movq	(%rax,%r8,8), %rcx
	movq	16(%rsp), %rax          # 8-byte Reload
	imulq	(%rax,%r11,8), %rcx
	addq	%r12, %rcx
	movq	%rcx, (%rbp,%r13,8)
.LBB7_11:                               # %blklab17.loopexit.us.us
                                        #   in Loop: Header=BB7_7 Depth=2
	incq	%rdx
	addq	$8, %r10
	cmpq	%r15, %rdx
	jne	.LBB7_7
# BB#12:                                # %blklab15.loopexit.us-lcssa.us.us
                                        #   in Loop: Header=BB7_6 Depth=1
	movq	72(%rsp), %r9           # 8-byte Reload
	incq	%r9
	addq	%rdi, 56(%rsp)          # 8-byte Folded Spill
	cmpq	8(%rsp), %r9            # 8-byte Folded Reload
	jne	.LBB7_6
.LBB7_13:                               # %if.end62
	movl	$32, %edi
	callq	malloc
	movq	%rax, %r14
	movq	64(%rsp), %rax          # 8-byte Reload
	movq	%rax, 8(%r14)
	movq	%rbp, (%r14)
	movq	8(%rsp), %rax           # 8-byte Reload
	movq	%rax, 24(%r14)
	movq	%r15, 16(%r14)
	movl	32(%rsp), %eax          # 4-byte Reload
	testb	%al, %al
	je	.LBB7_15
# BB#14:                                # %if.then66
	movq	40(%rsp), %rbx          # 8-byte Reload
	movq	(%rbx), %rdi
	callq	free
	movq	%rbx, %rdi
	callq	free
.LBB7_15:                               # %if.end67
	movl	36(%rsp), %eax          # 4-byte Reload
	testb	%al, %al
	je	.LBB7_17
# BB#16:                                # %if.then69
	movq	48(%rsp), %rbx          # 8-byte Reload
	movq	(%rbx), %rdi
	callq	free
	movq	%rbx, %rdi
	callq	free
.LBB7_17:                               # %if.end91
	movq	%r14, %rax
	addq	$120, %rsp
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
.Ltmp68:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp69:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp70:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp71:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp72:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp73:
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
.Ltmp74:
	.cfi_def_cfa_offset 112
.Ltmp75:
	.cfi_offset %rbx, -56
.Ltmp76:
	.cfi_offset %r12, -48
.Ltmp77:
	.cfi_offset %r13, -40
.Ltmp78:
	.cfi_offset %r14, -32
.Ltmp79:
	.cfi_offset %r15, -24
.Ltmp80:
	.cfi_offset %rbp, -16
	movl	%edi, %ebx
	callq	convertArgsToIntArray
	movq	%rax, %rbp
	decl	%ebx
	movslq	%ebx, %rbx
	movq	(%rbp), %rdi
	callq	parseStringToInt
	testq	%rax, %rax
	jne	.LBB8_1
# BB#6:                                 # %if.end161.critedge
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	callq	free2DArray
	xorl	%edi, %edi
	callq	exit
.LBB8_1:                                # %if.end8
	movq	%rbx, 40(%rsp)          # 8-byte Spill
	movq	%rbp, 48(%rsp)          # 8-byte Spill
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	(%rax), %rbp
	xorl	%edi, %edi
	movl	$7, %esi
	callq	create1DArray
	movq	%rax, %r13
	movaps	.LCPI8_0(%rip), %xmm0   # xmm0 = [115,105]
	movups	%xmm0, (%r13)
	movaps	.LCPI8_1(%rip), %xmm0   # xmm0 = [122,101]
	movups	%xmm0, 16(%r13)
	movaps	.LCPI8_2(%rip), %xmm0   # xmm0 = [32,61]
	movups	%xmm0, 32(%r13)
	movq	$32, 48(%r13)
	movl	$7, %esi
	movq	%r13, %rdi
	callq	printf_s
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	movq	%rbp, %rsi
	callq	printf
	movq	%rbp, %r15
	imulq	%r15, %r15
	xorl	%edi, %edi
	movl	%r15d, %esi
	callq	create1DArray
	movq	%rax, %r14
	testq	%rbp, %rbp
	jle	.LBB8_3
# BB#2:                                 # %polly.parallel.for.i
	leaq	-1(%rbp), %r8
	sarq	$5, %r8
	movq	%rbp, 8(%rsp)
	movq	%rbp, 16(%rsp)
	movq	%r14, 24(%rsp)
	incq	%r8
	leaq	8(%rsp), %rbx
	movl	$init_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%rbx, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	init_polly_subfn
	callq	GOMP_parallel_end
.LBB8_3:                                # %init.exit
	movl	$32, %edi
	callq	malloc
	movq	%rax, %rbx
	movq	%r15, 8(%rbx)
	movq	%r14, (%rbx)
	movq	%rbp, 24(%rbx)
	movq	%rbp, 16(%rbx)
	xorl	%edi, %edi
	movl	%r15d, %esi
	callq	create1DArray
	movq	%rax, %r14
	testq	%rbp, %rbp
	jle	.LBB8_5
# BB#4:                                 # %polly.parallel.for.i296
	leaq	-1(%rbp), %r8
	sarq	$5, %r8
	movq	%rbp, 8(%rsp)
	movq	%rbp, 16(%rsp)
	movq	%r14, 24(%rsp)
	incq	%r8
	leaq	8(%rsp), %r12
	movl	$init_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r12, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%r12, %rdi
	callq	init_polly_subfn
	callq	GOMP_parallel_end
.LBB8_5:                                # %if.then130
	movl	$32, %edi
	callq	malloc
	movq	%r15, 8(%rax)
	movq	%r14, (%rax)
	movq	%rbp, 24(%rax)
	movq	%rbp, 16(%rax)
	movl	$1, %esi
	movl	$1, %ecx
	movq	%rbx, %rdi
	movq	%rax, %rdx
	callq	mat_mult
	movq	%rax, %r14
	xorl	%edi, %edi
	movl	$27, %esi
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
	movq	(%r14), %r12
	movq	-8(%r12,%r15,8), %rsi
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%edi, %edi
	movl	$25, %esi
	callq	create1DArray
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
	movq	32(%rsp), %rdi          # 8-byte Reload
	callq	free
	movq	%r12, %rdi
	callq	free
	movq	%r14, %rdi
	callq	free
	movq	48(%rsp), %rdi          # 8-byte Reload
	movq	40(%rsp), %rsi          # 8-byte Reload
	callq	free2DArray
	movq	%r13, %rdi
	callq	free
	movq	%rbp, %rdi
	callq	free
	movq	%rbx, %rdi
	callq	free
	xorl	%edi, %edi
	callq	exit
.Lfunc_end8:
	.size	main, .Lfunc_end8-main
	.cfi_endproc

	.p2align	4, 0x90
	.type	init_polly_subfn,@function
init_polly_subfn:                       # @init_polly_subfn
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Ltmp81:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp82:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp83:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp84:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp85:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp86:
	.cfi_def_cfa_offset 56
	subq	$136, %rsp
.Ltmp87:
	.cfi_def_cfa_offset 192
.Ltmp88:
	.cfi_offset %rbx, -56
.Ltmp89:
	.cfi_offset %r12, -48
.Ltmp90:
	.cfi_offset %r13, -40
.Ltmp91:
	.cfi_offset %r14, -32
.Ltmp92:
	.cfi_offset %r15, -24
.Ltmp93:
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
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovgq	%rax, %rcx
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
	cmpq	$7, %rdx
	movl	$7, %ecx
	cmovgq	%rcx, %rdx
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
# BB#18:                                # %polly.loop_header10.preheader116
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
	.size	init_polly_subfn, .Lfunc_end9-init_polly_subfn
	.cfi_endproc

	.p2align	4, 0x90
	.type	mat_mult_polly_subfn,@function
mat_mult_polly_subfn:                   # @mat_mult_polly_subfn
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Ltmp94:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp95:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp96:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp97:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp98:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp99:
	.cfi_def_cfa_offset 56
	subq	$456, %rsp              # imm = 0x1C8
.Ltmp100:
	.cfi_def_cfa_offset 512
.Ltmp101:
	.cfi_offset %rbx, -56
.Ltmp102:
	.cfi_offset %r12, -48
.Ltmp103:
	.cfi_offset %r13, -40
.Ltmp104:
	.cfi_offset %r14, -32
.Ltmp105:
	.cfi_offset %r15, -24
.Ltmp106:
	.cfi_offset %rbp, -16
	movq	(%rdi), %rax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movq	8(%rdi), %rax
	movq	%rax, 288(%rsp)         # 8-byte Spill
	movq	16(%rdi), %r15
	movq	24(%rdi), %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	32(%rdi), %rax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	leaq	240(%rsp), %rdi
	leaq	232(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB10_2
# BB#1:                                 # %polly.par.loadIVBounds.lr.ph
	movq	8(%rsp), %rdx           # 8-byte Reload
	movl	%edx, %ecx
	andl	$3, %ecx
	leaq	-1(%rdx), %rax
	movq	%rax, %rsi
	shrq	$5, %rsi
	movq	%rsi, 360(%rsp)         # 8-byte Spill
	sarq	$5, %rax
	movq	%rax, 88(%rsp)          # 8-byte Spill
	movq	%rdx, %rax
	shrq	$2, %rax
	movq	%rdx, %rdi
	andq	$-4, %rdi
	leaq	-1(%rcx), %rsi
	movq	%rsi, 200(%rsp)         # 8-byte Spill
	movl	%edx, %esi
	andl	$1, %esi
	movq	%rcx, 352(%rsp)         # 8-byte Spill
	movq	%rcx, %r13
	movq	%rsi, 192(%rsp)         # 8-byte Spill
	subq	%rsi, %r13
	leaq	1(%rdi), %rcx
	imulq	%rdx, %rcx
	movq	16(%rsp), %rsi          # 8-byte Reload
	leaq	(%rsi,%rcx,8), %rcx
	movq	%rcx, 184(%rsp)         # 8-byte Spill
	movq	%rdx, %rbp
	shlq	$4, %rbp
	movq	72(%rsp), %rcx          # 8-byte Reload
	movq	%rdi, 160(%rsp)         # 8-byte Spill
	leaq	8(%rcx,%rdi,8), %rdi
	movq	%rdi, 256(%rsp)         # 8-byte Spill
	movq	%rdx, %r12
	shlq	$5, %r12
	movq	%rdx, %rdi
	shlq	$8, %rdi
	movq	%rdi, 112(%rsp)         # 8-byte Spill
	movq	%rdx, %rdi
	imulq	%rax, %rdi
	decq	%rax
	movq	%rax, 344(%rsp)         # 8-byte Spill
	shlq	$5, %rdi
	addq	%rsi, %rdi
	movq	%rdi, 168(%rsp)         # 8-byte Spill
	leaq	(%rdx,%rdx,2), %rax
	leaq	(%rsi,%rax,8), %rax
	movq	%rax, 280(%rsp)         # 8-byte Spill
	leaq	(,%rdx,8), %rax
	movq	%rax, 392(%rsp)         # 8-byte Spill
	leaq	24(%rcx), %rax
	movq	%rax, 248(%rsp)         # 8-byte Spill
	movq	%rbp, 176(%rsp)         # 8-byte Spill
	leaq	(%rsi,%rbp), %rax
	movq	%rax, 272(%rsp)         # 8-byte Spill
	leaq	(%rsi,%rdx,8), %rax
	movq	%rax, 264(%rsp)         # 8-byte Spill
	movq	%r15, 424(%rsp)         # 8-byte Spill
	movq	%r13, 416(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB10_4:                               # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB10_5 Depth 2
                                        #       Child Loop BB10_7 Depth 3
                                        #         Child Loop BB10_8 Depth 4
                                        #           Child Loop BB10_10 Depth 5
                                        #             Child Loop BB10_30 Depth 6
                                        #               Child Loop BB10_36 Depth 7
                                        #             Child Loop BB10_13 Depth 6
                                        #               Child Loop BB10_14 Depth 7
                                        #               Child Loop BB10_21 Depth 7
	movq	232(%rsp), %rax
	movq	240(%rsp), %rcx
	addq	$-2, %rax
	movq	%rax, 296(%rsp)         # 8-byte Spill
	movq	%r12, %rax
	movq	%rcx, 40(%rsp)          # 8-byte Spill
	imulq	%rcx, %rax
	movq	256(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %rcx
	movq	%rcx, 104(%rsp)         # 8-byte Spill
	movq	248(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %rax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB10_5:                               # %polly.loop_header
                                        #   Parent Loop BB10_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB10_7 Depth 3
                                        #         Child Loop BB10_8 Depth 4
                                        #           Child Loop BB10_10 Depth 5
                                        #             Child Loop BB10_30 Depth 6
                                        #               Child Loop BB10_36 Depth 7
                                        #             Child Loop BB10_13 Depth 6
                                        #               Child Loop BB10_14 Depth 7
                                        #               Child Loop BB10_21 Depth 7
	cmpq	$0, 88(%rsp)            # 8-byte Folded Reload
	js	.LBB10_19
# BB#6:                                 # %polly.loop_header5.preheader
                                        #   in Loop: Header=BB10_5 Depth=2
	movq	40(%rsp), %rcx          # 8-byte Reload
	shlq	$5, %rcx
	movq	288(%rsp), %rdx         # 8-byte Reload
	movq	%rcx, %rax
	movq	%rax, 376(%rsp)         # 8-byte Spill
	subq	%rcx, %rdx
	decq	%rdx
	cmpq	$31, %rdx
	movl	$31, %eax
	cmovgq	%rax, %rdx
	movq	%rdx, 368(%rsp)         # 8-byte Spill
	leaq	-1(%rdx), %rax
	movq	%rax, 400(%rsp)         # 8-byte Spill
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	264(%rsp), %rdx         # 8-byte Reload
	movq	272(%rsp), %rsi         # 8-byte Reload
	movq	280(%rsp), %rdi         # 8-byte Reload
	xorl	%eax, %eax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB10_7:                               # %polly.loop_header5
                                        #   Parent Loop BB10_4 Depth=1
                                        #     Parent Loop BB10_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB10_8 Depth 4
                                        #           Child Loop BB10_10 Depth 5
                                        #             Child Loop BB10_30 Depth 6
                                        #               Child Loop BB10_36 Depth 7
                                        #             Child Loop BB10_13 Depth 6
                                        #               Child Loop BB10_14 Depth 7
                                        #               Child Loop BB10_21 Depth 7
	movq	%rax, 304(%rsp)         # 8-byte Spill
	movq	%rax, %rbx
	shlq	$5, %rbx
	movq	8(%rsp), %rax           # 8-byte Reload
	movq	%rbx, %rbp
	movq	%rbp, 224(%rsp)         # 8-byte Spill
	subq	%rbx, %rax
	decq	%rax
	cmpq	$31, %rax
	movl	$31, %ebp
	cmovleq	%rax, %rbp
	movq	%rbp, 408(%rsp)         # 8-byte Spill
	leaq	-1(%rbp), %rax
	movq	%rax, 216(%rsp)         # 8-byte Spill
	movq	%rcx, 336(%rsp)         # 8-byte Spill
	movq	%rcx, 152(%rsp)         # 8-byte Spill
	movq	%rdx, 328(%rsp)         # 8-byte Spill
	movq	%rdx, 144(%rsp)         # 8-byte Spill
	movq	%rsi, 320(%rsp)         # 8-byte Spill
	movq	%rsi, 136(%rsp)         # 8-byte Spill
	movq	96(%rsp), %rax          # 8-byte Reload
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	%rdi, 312(%rsp)         # 8-byte Spill
	movq	%rdi, 128(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB10_8:                               # %polly.loop_header12
                                        #   Parent Loop BB10_4 Depth=1
                                        #     Parent Loop BB10_5 Depth=2
                                        #       Parent Loop BB10_7 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB10_10 Depth 5
                                        #             Child Loop BB10_30 Depth 6
                                        #               Child Loop BB10_36 Depth 7
                                        #             Child Loop BB10_13 Depth 6
                                        #               Child Loop BB10_14 Depth 7
                                        #               Child Loop BB10_21 Depth 7
	cmpq	$0, 368(%rsp)           # 8-byte Folded Reload
	js	.LBB10_27
# BB#9:                                 # %polly.loop_header20.preheader
                                        #   in Loop: Header=BB10_8 Depth=4
	cmpq	$0, 352(%rsp)           # 8-byte Folded Reload
	sete	%al
	movq	48(%rsp), %rdx          # 8-byte Reload
	leaq	(,%rdx,8), %rcx
	movq	344(%rsp), %rsi         # 8-byte Reload
	subq	%rcx, %rsi
	cmpq	$7, %rsi
	movl	$7, %ecx
	cmovgq	%rcx, %rsi
	movq	%rdx, %rcx
	shlq	$5, %rcx
	orq	$31, %rcx
	cmpq	8(%rsp), %rcx           # 8-byte Folded Reload
	setl	%cl
	orb	%al, %cl
	movb	%cl, 7(%rsp)            # 1-byte Spill
	movq	%rsi, 384(%rsp)         # 8-byte Spill
	leaq	-1(%rsi), %r14
	movq	120(%rsp), %rax         # 8-byte Reload
	movq	%rax, 208(%rsp)         # 8-byte Spill
	movq	104(%rsp), %r10         # 8-byte Reload
	xorl	%eax, %eax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB10_10:                              # %polly.loop_header20
                                        #   Parent Loop BB10_4 Depth=1
                                        #     Parent Loop BB10_5 Depth=2
                                        #       Parent Loop BB10_7 Depth=3
                                        #         Parent Loop BB10_8 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB10_30 Depth 6
                                        #               Child Loop BB10_36 Depth 7
                                        #             Child Loop BB10_13 Depth 6
                                        #               Child Loop BB10_14 Depth 7
                                        #               Child Loop BB10_21 Depth 7
	cmpq	$0, 408(%rsp)           # 8-byte Folded Reload
	js	.LBB10_26
# BB#11:                                # %polly.loop_header29.preheader
                                        #   in Loop: Header=BB10_10 Depth=5
	movq	376(%rsp), %rax         # 8-byte Reload
	movq	64(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rax), %rax
	imulq	8(%rsp), %rax           # 8-byte Folded Reload
	movq	%rax, 24(%rsp)          # 8-byte Spill
	cmpq	$0, 384(%rsp)           # 8-byte Folded Reload
	js	.LBB10_28
# BB#12:                                # %polly.loop_header29.us.preheader
                                        #   in Loop: Header=BB10_10 Depth=5
	movq	56(%rsp), %rax          # 8-byte Reload
	movq	%rax, %rdx
	movq	152(%rsp), %rcx         # 8-byte Reload
	movq	144(%rsp), %rsi         # 8-byte Reload
	movq	136(%rsp), %r11         # 8-byte Reload
	movq	128(%rsp), %r9          # 8-byte Reload
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB10_13:                              # %polly.loop_header29.us
                                        #   Parent Loop BB10_4 Depth=1
                                        #     Parent Loop BB10_5 Depth=2
                                        #       Parent Loop BB10_7 Depth=3
                                        #         Parent Loop BB10_8 Depth=4
                                        #           Parent Loop BB10_10 Depth=5
                                        # =>          This Loop Header: Depth=6
                                        #               Child Loop BB10_14 Depth 7
                                        #               Child Loop BB10_21 Depth 7
	movq	224(%rsp), %rax         # 8-byte Reload
	leaq	(%r8,%rax), %rdi
	movq	24(%rsp), %rax          # 8-byte Reload
	movq	%rdi, 432(%rsp)         # 8-byte Spill
	leaq	(%rdi,%rax), %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	(%r15,%rax,8), %rdi
	movq	$-1, %rbx
	movq	%rcx, 80(%rsp)          # 8-byte Spill
	movq	%rsi, 448(%rsp)         # 8-byte Spill
	movq	%r11, %rax
	movq	208(%rsp), %r13         # 8-byte Reload
	movq	%r9, 440(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB10_14:                              # %polly.loop_header39.us
                                        #   Parent Loop BB10_4 Depth=1
                                        #     Parent Loop BB10_5 Depth=2
                                        #       Parent Loop BB10_7 Depth=3
                                        #         Parent Loop BB10_8 Depth=4
                                        #           Parent Loop BB10_10 Depth=5
                                        #             Parent Loop BB10_13 Depth=6
                                        # =>            This Inner Loop Header: Depth=7
	movq	(%rcx), %r15
	imulq	-24(%r13), %r15
	addq	%rdi, %r15
	movq	(%rsi), %rdi
	imulq	-16(%r13), %rdi
	addq	%r15, %rdi
	movq	(%r11), %rbp
	imulq	-8(%r13), %rbp
	addq	%rdi, %rbp
	movq	(%r9), %rdi
	imulq	(%r13), %rdi
	addq	%rbp, %rdi
	incq	%rbx
	addq	%r12, %r9
	addq	$32, %r13
	addq	%r12, %r11
	addq	%r12, %rsi
	addq	%r12, %rcx
	cmpq	%r14, %rbx
	jle	.LBB10_14
# BB#15:                                # %polly.cond.loopexit.us
                                        #   in Loop: Header=BB10_13 Depth=6
	movq	424(%rsp), %r15         # 8-byte Reload
	movq	32(%rsp), %rcx          # 8-byte Reload
	movq	%rdi, (%r15,%rcx,8)
	cmpb	$0, 7(%rsp)             # 1-byte Folded Reload
	movq	416(%rsp), %r13         # 8-byte Reload
	movq	%rax, %r11
	jne	.LBB10_25
# BB#16:                                # %polly.loop_header58.us.preheader
                                        #   in Loop: Header=BB10_13 Depth=6
	cmpq	$0, 200(%rsp)           # 8-byte Folded Reload
	je	.LBB10_17
# BB#20:                                # %polly.loop_header58.us.preheader.new
                                        #   in Loop: Header=BB10_13 Depth=6
	movq	%rdx, %r9
	movq	%rdx, %rsi
	xorl	%ecx, %ecx
	movq	184(%rsp), %rbx         # 8-byte Reload
	movq	176(%rsp), %rax         # 8-byte Reload
	movq	168(%rsp), %rdx         # 8-byte Reload
	.p2align	4, 0x90
.LBB10_21:                              # %polly.loop_header58.us
                                        #   Parent Loop BB10_4 Depth=1
                                        #     Parent Loop BB10_5 Depth=2
                                        #       Parent Loop BB10_7 Depth=3
                                        #         Parent Loop BB10_8 Depth=4
                                        #           Parent Loop BB10_10 Depth=5
                                        #             Parent Loop BB10_13 Depth=6
                                        # =>            This Inner Loop Header: Depth=7
	movq	(%rdx,%rsi), %rbp
	imulq	-8(%r10,%rcx,8), %rbp
	addq	%rdi, %rbp
	movq	(%rbx,%rsi), %rdi
	imulq	(%r10,%rcx,8), %rdi
	addq	%rbp, %rdi
	addq	$2, %rcx
	addq	%rax, %rsi
	cmpq	%rcx, %r13
	jne	.LBB10_21
	jmp	.LBB10_22
.LBB10_17:                              #   in Loop: Header=BB10_13 Depth=6
	movq	%rdx, %r9
	xorl	%ecx, %ecx
.LBB10_22:                              # %polly.merge.loopexit.us.unr-lcssa
                                        #   in Loop: Header=BB10_13 Depth=6
	cmpq	$0, 192(%rsp)           # 8-byte Folded Reload
	je	.LBB10_24
# BB#23:                                # %polly.merge.loopexit.us.epilog-lcssa
                                        #   in Loop: Header=BB10_13 Depth=6
	addq	160(%rsp), %rcx         # 8-byte Folded Reload
	movq	%rcx, %rsi
	imulq	8(%rsp), %rsi           # 8-byte Folded Reload
	addq	432(%rsp), %rsi         # 8-byte Folded Reload
	movq	16(%rsp), %rbp          # 8-byte Reload
	movq	(%rbp,%rsi,8), %rsi
	addq	24(%rsp), %rcx          # 8-byte Folded Reload
	movq	72(%rsp), %rbp          # 8-byte Reload
	imulq	(%rbp,%rcx,8), %rsi
	addq	%rsi, %rdi
.LBB10_24:                              # %polly.merge.loopexit.us
                                        #   in Loop: Header=BB10_13 Depth=6
	movq	32(%rsp), %rax          # 8-byte Reload
	movq	%rdi, (%r15,%rax,8)
	movq	%r9, %rdx
.LBB10_25:                              # %polly.merge.us
                                        #   in Loop: Header=BB10_13 Depth=6
	movq	440(%rsp), %r9          # 8-byte Reload
	addq	$8, %r9
	addq	$8, %r11
	movq	448(%rsp), %rsi         # 8-byte Reload
	addq	$8, %rsi
	movq	80(%rsp), %rcx          # 8-byte Reload
	addq	$8, %rcx
	addq	$8, %rdx
	cmpq	216(%rsp), %r8          # 8-byte Folded Reload
	leaq	1(%r8), %r8
	jle	.LBB10_13
	jmp	.LBB10_26
	.p2align	4, 0x90
.LBB10_28:                              # %polly.loop_header29.preheader.split
                                        #   in Loop: Header=BB10_10 Depth=5
	cmpb	$0, 7(%rsp)             # 1-byte Folded Reload
	jne	.LBB10_26
# BB#29:                                # %polly.loop_header29.preheader185
                                        #   in Loop: Header=BB10_10 Depth=5
	movq	56(%rsp), %r11          # 8-byte Reload
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB10_30:                              # %polly.loop_header29
                                        #   Parent Loop BB10_4 Depth=1
                                        #     Parent Loop BB10_5 Depth=2
                                        #       Parent Loop BB10_7 Depth=3
                                        #         Parent Loop BB10_8 Depth=4
                                        #           Parent Loop BB10_10 Depth=5
                                        # =>          This Loop Header: Depth=6
                                        #               Child Loop BB10_36 Depth 7
	movq	224(%rsp), %rax         # 8-byte Reload
	leaq	(%rdx,%rax), %rcx
	movq	24(%rsp), %rax          # 8-byte Reload
	leaq	(%rcx,%rax), %rax
	cmpq	$0, 200(%rsp)           # 8-byte Folded Reload
	movq	(%r15,%rax,8), %rdi
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	%rcx, 80(%rsp)          # 8-byte Spill
	je	.LBB10_31
# BB#35:                                # %polly.loop_header29.new
                                        #   in Loop: Header=BB10_30 Depth=6
	movq	%r10, %rbx
	movq	%r11, %rax
	xorl	%ebp, %ebp
	movq	184(%rsp), %rcx         # 8-byte Reload
	movq	176(%rsp), %r8          # 8-byte Reload
	movq	168(%rsp), %r9          # 8-byte Reload
	.p2align	4, 0x90
.LBB10_36:                              # %polly.loop_header58
                                        #   Parent Loop BB10_4 Depth=1
                                        #     Parent Loop BB10_5 Depth=2
                                        #       Parent Loop BB10_7 Depth=3
                                        #         Parent Loop BB10_8 Depth=4
                                        #           Parent Loop BB10_10 Depth=5
                                        #             Parent Loop BB10_30 Depth=6
                                        # =>            This Inner Loop Header: Depth=7
	movq	(%r9,%rax), %rsi
	imulq	-8(%rbx), %rsi
	addq	%rdi, %rsi
	movq	(%rcx,%rax), %rdi
	imulq	(%rbx), %rdi
	addq	%rsi, %rdi
	addq	$2, %rbp
	addq	%r8, %rax
	addq	$16, %rbx
	cmpq	%rbp, %r13
	jne	.LBB10_36
	jmp	.LBB10_32
	.p2align	4, 0x90
.LBB10_31:                              #   in Loop: Header=BB10_30 Depth=6
	xorl	%ebp, %ebp
.LBB10_32:                              # %polly.merge.loopexit.unr-lcssa
                                        #   in Loop: Header=BB10_30 Depth=6
	cmpq	$0, 192(%rsp)           # 8-byte Folded Reload
	je	.LBB10_34
# BB#33:                                # %polly.merge.loopexit.epilog-lcssa
                                        #   in Loop: Header=BB10_30 Depth=6
	addq	160(%rsp), %rbp         # 8-byte Folded Reload
	movq	%rbp, %rax
	imulq	8(%rsp), %rax           # 8-byte Folded Reload
	addq	80(%rsp), %rax          # 8-byte Folded Reload
	movq	16(%rsp), %rsi          # 8-byte Reload
	movq	(%rsi,%rax,8), %rax
	addq	24(%rsp), %rbp          # 8-byte Folded Reload
	movq	72(%rsp), %rsi          # 8-byte Reload
	imulq	(%rsi,%rbp,8), %rax
	addq	%rax, %rdi
.LBB10_34:                              # %polly.merge.loopexit
                                        #   in Loop: Header=BB10_30 Depth=6
	movq	32(%rsp), %rax          # 8-byte Reload
	movq	%rdi, (%r15,%rax,8)
	addq	$8, %r11
	cmpq	216(%rsp), %rdx         # 8-byte Folded Reload
	leaq	1(%rdx), %rdx
	jle	.LBB10_30
	.p2align	4, 0x90
.LBB10_26:                              # %polly.loop_exit31
                                        #   in Loop: Header=BB10_10 Depth=5
	movq	392(%rsp), %rax         # 8-byte Reload
	addq	%rax, %r10
	addq	%rax, 208(%rsp)         # 8-byte Folded Spill
	movq	64(%rsp), %rax          # 8-byte Reload
	cmpq	400(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	jle	.LBB10_10
.LBB10_27:                              # %polly.loop_exit22
                                        #   in Loop: Header=BB10_8 Depth=4
	movq	112(%rsp), %rax         # 8-byte Reload
	addq	%rax, 128(%rsp)         # 8-byte Folded Spill
	addq	$256, 120(%rsp)         # 8-byte Folded Spill
                                        # imm = 0x100
	addq	%rax, 136(%rsp)         # 8-byte Folded Spill
	addq	%rax, 144(%rsp)         # 8-byte Folded Spill
	addq	%rax, 152(%rsp)         # 8-byte Folded Spill
	movq	48(%rsp), %rax          # 8-byte Reload
	cmpq	360(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	jne	.LBB10_8
# BB#18:                                # %polly.loop_exit14
                                        #   in Loop: Header=BB10_7 Depth=3
	addq	$256, 56(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	movq	312(%rsp), %rdi         # 8-byte Reload
	addq	$256, %rdi              # imm = 0x100
	movq	320(%rsp), %rsi         # 8-byte Reload
	addq	$256, %rsi              # imm = 0x100
	movq	328(%rsp), %rdx         # 8-byte Reload
	addq	$256, %rdx              # imm = 0x100
	movq	336(%rsp), %rcx         # 8-byte Reload
	addq	$256, %rcx              # imm = 0x100
	movq	304(%rsp), %rax         # 8-byte Reload
	cmpq	88(%rsp), %rax          # 8-byte Folded Reload
	leaq	1(%rax), %rax
	jne	.LBB10_7
.LBB10_19:                              # %polly.loop_exit7
                                        #   in Loop: Header=BB10_5 Depth=2
	movq	112(%rsp), %rax         # 8-byte Reload
	addq	%rax, 104(%rsp)         # 8-byte Folded Spill
	addq	%rax, 96(%rsp)          # 8-byte Folded Spill
	movq	40(%rsp), %rax          # 8-byte Reload
	cmpq	296(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	jle	.LBB10_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB10_4 Depth=1
	leaq	240(%rsp), %rdi
	leaq	232(%rsp), %rsi
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
	.size	mat_mult_polly_subfn, .Lfunc_end10-mat_mult_polly_subfn
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


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git f82fb5beb88e841f7a00cfb2a2ceabe46bcb2a9b) (http://llvm.org/git/llvm.git bafbf2b643f118fd2ea402ed6cd204281c7e9e94)"
	.section	".note.GNU-stack","",@progbits
