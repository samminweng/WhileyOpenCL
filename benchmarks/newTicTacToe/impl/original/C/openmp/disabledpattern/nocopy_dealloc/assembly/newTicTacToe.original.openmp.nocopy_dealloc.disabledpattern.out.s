	.text
	.file	"llvm/newTicTacToe.original.openmp.nocopy_dealloc.disabledpattern.out.ll"
	.globl	copy_Board
	.p2align	4, 0x90
	.type	copy_Board,@function
copy_Board:                             # @copy_Board
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
	movl	$24, %edi
	callq	malloc
	movq	%rax, %rbx
	movq	8(%r14), %rsi
	movq	%rsi, 8(%rbx)
	movq	(%r14), %rdi
	callq	copy1DArray_int64_t
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
	movl	$24, %edi
	callq	malloc
	movq	%rax, %rbx
	movq	8(%rbp), %rsi
	movq	%rsi, 8(%rbx)
	movq	(%rbp), %rdi
	callq	copy1DArray_int64_t
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
	.size	free_Board, .Lfunc_end2-free_Board
	.cfi_endproc

	.globl	printf_Board
	.p2align	4, 0x90
	.type	printf_Board,@function
printf_Board:                           # @printf_Board
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
	movl	$125, %edi
	popq	%rbx
	jmp	putchar                 # TAILCALL
.Lfunc_end3:
	.size	printf_Board, .Lfunc_end3-printf_Board
	.cfi_endproc

	.globl	_EmptyBoard_
	.p2align	4, 0x90
	.type	_EmptyBoard_,@function
_EmptyBoard_:                           # @_EmptyBoard_
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Lcfi22:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Lcfi23:
	.cfi_def_cfa_offset 24
	pushq	%rax
.Lcfi24:
	.cfi_def_cfa_offset 32
.Lcfi25:
	.cfi_offset %rbx, -24
.Lcfi26:
	.cfi_offset %r14, -16
	movl	$9, %r14d
	xorl	%edi, %edi
	movl	$9, %esi
	callq	create1DArray_int64_t
	movq	%rax, %rbx
	xorps	%xmm0, %xmm0
	movups	%xmm0, 48(%rbx)
	movups	%xmm0, 32(%rbx)
	movups	%xmm0, 16(%rbx)
	movups	%xmm0, (%rbx)
	movq	$0, 64(%rbx)
	movl	$24, %edi
	callq	malloc
	movd	%r14, %xmm0
	movdqu	%xmm0, 8(%rax)
	movq	%rbx, (%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end4:
	.size	_EmptyBoard_, .Lfunc_end4-_EmptyBoard_
	.cfi_endproc

	.globl	_countOf_
	.p2align	4, 0x90
	.type	_countOf_,@function
_countOf_:                              # @_countOf_
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Lcfi27:
	.cfi_def_cfa_offset 16
.Lcfi28:
	.cfi_offset %rbx, -16
	testq	%rsi, %rsi
	jle	.LBB5_1
# BB#2:                                 # %if.end.preheader
	leaq	-1(%rsi), %r8
	movq	%rsi, %r9
	xorl	%r10d, %r10d
	xorl	%ebx, %ebx
	andq	$3, %r9
	je	.LBB5_4
	.p2align	4, 0x90
.LBB5_3:                                # %if.end.prol
                                        # =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
	cmpq	%rcx, (%rdi,%r10,8)
	sete	%al
	addq	%rax, %rbx
	incq	%r10
	cmpq	%r10, %r9
	jne	.LBB5_3
.LBB5_4:                                # %if.end.prol.loopexit
	cmpq	$3, %r8
	jb	.LBB5_7
# BB#5:                                 # %if.end.preheader.new
	subq	%r10, %rsi
	leaq	24(%rdi,%r10,8), %r8
	.p2align	4, 0x90
.LBB5_6:                                # %if.end
                                        # =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
	cmpq	%rcx, -24(%r8)
	sete	%al
	addq	%rbx, %rax
	xorl	%ebx, %ebx
	cmpq	%rcx, -16(%r8)
	sete	%bl
	addq	%rax, %rbx
	xorl	%eax, %eax
	cmpq	%rcx, -8(%r8)
	sete	%al
	addq	%rbx, %rax
	xorl	%ebx, %ebx
	cmpq	%rcx, (%r8)
	sete	%bl
	addq	%rax, %rbx
	addq	$32, %r8
	addq	$-4, %rsi
	jne	.LBB5_6
	jmp	.LBB5_7
.LBB5_1:
	xorl	%ebx, %ebx
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
	.size	_countOf_, .Lfunc_end5-_countOf_
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
.Lcfi29:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi30:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi31:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi32:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi33:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi34:
	.cfi_def_cfa_offset 56
	subq	$136, %rsp
.Lcfi35:
	.cfi_def_cfa_offset 192
.Lcfi36:
	.cfi_offset %rbx, -56
.Lcfi37:
	.cfi_offset %r12, -48
.Lcfi38:
	.cfi_offset %r13, -40
.Lcfi39:
	.cfi_offset %r14, -32
.Lcfi40:
	.cfi_offset %r15, -24
.Lcfi41:
	.cfi_offset %rbp, -16
	movq	$0, 48(%rsp)
	movq	$0, 88(%rsp)
	leaq	48(%rsp), %rdx
	leaq	88(%rsp), %rcx
	callq	convertArgsToIntArray
	movq	%rax, %r14
	movq	(%r14), %rdi
	callq	parseStringToInt
	testq	%rax, %rax
	je	.LBB6_1
# BB#2:                                 # %if.end14
	movq	%r14, 40(%rsp)          # 8-byte Spill
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	(%rax), %rax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	testq	%rax, %rax
	jle	.LBB6_3
# BB#4:                                 # %if.end20.preheader
	xorl	%eax, %eax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movl	$9, %eax
	movd	%rax, %xmm0
	movdqa	%xmm0, 96(%rsp)         # 16-byte Spill
	movl	$1, %eax
	movd	%rax, %xmm0
	pslldq	$8, %xmm0               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7]
	movdqa	%xmm0, 112(%rsp)        # 16-byte Spill
	movl	$0, %ebx
	movl	$0, %eax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movl	$0, %r15d
	movl	$0, %eax
	movq	%rax, 8(%rsp)           # 8-byte Spill
                                        # implicit-def: %R14
	xorl	%eax, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
                                        # implicit-def: %RAX
	movq	%rax, 16(%rsp)          # 8-byte Spill
                                        # implicit-def: %R13
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB6_5:                                # %if.end20
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_12 Depth 2
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	(%rsp), %rax            # 8-byte Reload
	movl	%eax, %r12d
	xorl	%edi, %edi
	movl	$9, %esi
	callq	create1DArray_int64_t
	movq	%rax, %rbp
	pxor	%xmm0, %xmm0
	movdqu	%xmm0, 48(%rbp)
	movdqu	%xmm0, 32(%rbp)
	movdqu	%xmm0, 16(%rbp)
	movdqu	%xmm0, (%rbp)
	movq	$0, 64(%rbp)
	movl	$24, %edi
	callq	malloc
	movaps	96(%rsp), %xmm0         # 16-byte Reload
	movups	%xmm0, 8(%rax)
	movq	%rbp, (%rax)
	movq	%rax, 72(%rsp)          # 8-byte Spill
	testq	%rax, %rax
	setne	%al
	movq	%rax, (%rsp)            # 8-byte Spill
	testb	$1, %r12b
	je	.LBB6_7
# BB#6:                                 # %if.then27
                                        #   in Loop: Header=BB6_5 Depth=1
	movq	(%r13), %rdi
	callq	free
	movq	16(%rsp), %rdi          # 8-byte Reload
	callq	free
.LBB6_7:                                # %if.end33
                                        #   in Loop: Header=BB6_5 Depth=1
	xorl	%edi, %edi
	movl	$9, %esi
	callq	create1DArray_int64_t
	movq	%rax, %rbp
	xorps	%xmm0, %xmm0
	movups	%xmm0, 48(%rbp)
	movups	%xmm0, 32(%rbp)
	movups	%xmm0, 16(%rbp)
	movups	%xmm0, (%rbp)
	movq	$0, 64(%rbp)
	movl	$24, %edi
	callq	malloc
	movq	%rax, %r12
	movl	$9, %eax
	movd	%rax, %xmm0
	movdqu	%xmm0, 8(%r12)
	movq	%rbp, (%r12)
	testq	%r12, %r12
	setne	%bpl
	testb	$1, 8(%rsp)             # 1-byte Folded Reload
	je	.LBB6_9
# BB#8:                                 # %if.then40
                                        #   in Loop: Header=BB6_5 Depth=1
	movq	(%r14), %rdi
	callq	free
	movq	%r14, %rdi
	callq	free
.LBB6_9:                                # %while.cond44.preheader
                                        #   in Loop: Header=BB6_5 Depth=1
	movq	72(%rsp), %r13          # 8-byte Reload
	movq	%r13, 16(%rsp)          # 8-byte Spill
	movq	%r12, %r14
	movb	%bpl, %al
	movq	%rax, 8(%rsp)           # 8-byte Spill
	xorl	%r12d, %r12d
	testb	$1, 32(%rsp)            # 1-byte Folded Reload
	je	.LBB6_12
	jmp	.LBB6_11
	.p2align	4, 0x90
.LBB6_27:                               # %blklab20
                                        #   in Loop: Header=BB6_12 Depth=2
	incq	%r12
	movq	%r14, 16(%rsp)          # 8-byte Spill
	movq	%r14, %r13
	movq	%rbp, %r14
	testb	$1, 32(%rsp)            # 1-byte Folded Reload
	je	.LBB6_12
.LBB6_11:                               # %if.then47
                                        #   in Loop: Header=BB6_5 Depth=1
	movq	%r15, %rdi
	callq	free
.LBB6_12:                               # %if.end48
                                        #   Parent Loop BB6_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	xorl	%edi, %edi
	movl	$9, %esi
	callq	create1DArray_int64_t
	movq	%rax, %r15
	movaps	112(%rsp), %xmm0        # 16-byte Reload
	movups	%xmm0, (%r15)
	movaps	.LCPI6_0(%rip), %xmm0   # xmm0 = [2,3]
	movups	%xmm0, 16(%r15)
	movaps	.LCPI6_1(%rip), %xmm0   # xmm0 = [4,5]
	movups	%xmm0, 32(%r15)
	movdqa	.LCPI6_2(%rip), %xmm0   # xmm0 = [6,7]
	movdqu	%xmm0, 48(%r15)
	movq	$8, 64(%r15)
	testq	%r15, %r15
	setne	%bpl
	cmpq	$8, %r12
	movq	%rbp, 32(%rsp)          # 8-byte Spill
	jg	.LBB6_28
# BB#13:                                # %if.end65
                                        #   in Loop: Header=BB6_12 Depth=2
	testb	$1, 24(%rsp)            # 1-byte Folded Reload
	je	.LBB6_15
# BB#14:                                # %if.then67
                                        #   in Loop: Header=BB6_12 Depth=2
	movq	%rbx, %rdi
	callq	free
.LBB6_15:                               # %if.end68
                                        #   in Loop: Header=BB6_12 Depth=2
	xorl	%edi, %edi
	movl	$9, %esi
	callq	create1DArray_int64_t
	movq	%rax, %rbx
	movl	$1, %eax
	movd	%rax, %xmm0
	pslldq	$8, %xmm0               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7]
	movdqu	%xmm0, (%rbx)
	movaps	.LCPI6_0(%rip), %xmm0   # xmm0 = [2,3]
	movups	%xmm0, 16(%rbx)
	movaps	.LCPI6_1(%rip), %xmm0   # xmm0 = [4,5]
	movups	%xmm0, 32(%rbx)
	movdqa	.LCPI6_2(%rip), %xmm0   # xmm0 = [6,7]
	movdqu	%xmm0, 48(%rbx)
	movq	$8, 64(%rbx)
	testq	%rbx, %rbx
	setne	%al
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	(%rbx,%r12,8), %rax
	cmpq	$9, %rax
	ja	.LBB6_28
# BB#16:                                # %blklab19
                                        #   in Loop: Header=BB6_12 Depth=2
	testq	%r13, %r13
	je	.LBB6_22
# BB#17:                                # %if.end92
                                        #   in Loop: Header=BB6_12 Depth=2
	movq	(%r13), %rcx
	movq	$1, (%rcx,%rax,8)
	incq	16(%r13)
	testb	$1, 8(%rsp)             # 1-byte Folded Reload
	je	.LBB6_19
# BB#18:                                # %if.then96
                                        #   in Loop: Header=BB6_12 Depth=2
	movq	(%r14), %rdi
	callq	free
	movq	%r14, %rdi
	callq	free
.LBB6_19:                               # %if.end97
                                        #   in Loop: Header=BB6_12 Depth=2
	movl	$24, %edi
	callq	malloc
	movq	%rax, %rbp
	movq	8(%r13), %rsi
	movq	%rsi, 8(%rbp)
	movq	(%r13), %rdi
	callq	copy1DArray_int64_t
	movq	%rax, (%rbp)
	movq	16(%r13), %rax
	movq	%rax, 16(%rbp)
	testq	%rbp, %rbp
	setne	%al
	movq	%rax, 8(%rsp)           # 8-byte Spill
	testb	$1, (%rsp)              # 1-byte Folded Reload
	je	.LBB6_20
# BB#21:                                # %if.then104
                                        #   in Loop: Header=BB6_12 Depth=2
	movq	(%r13), %rdi
	callq	free
	movq	16(%rsp), %rdi          # 8-byte Reload
	callq	free
.LBB6_20:                               #   in Loop: Header=BB6_12 Depth=2
	xorl	%r14d, %r14d
	xorl	%eax, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	jmp	.LBB6_27
	.p2align	4, 0x90
.LBB6_22:                               # %blklab22
                                        #   in Loop: Header=BB6_12 Depth=2
	testq	%r14, %r14
	je	.LBB6_23
# BB#24:                                # %if.end108
                                        #   in Loop: Header=BB6_12 Depth=2
	movq	(%r14), %rcx
	movq	$2, (%rcx,%rax,8)
	incq	16(%r14)
	testb	$1, (%rsp)              # 1-byte Folded Reload
	je	.LBB6_26
# BB#25:                                # %if.then115
                                        #   in Loop: Header=BB6_12 Depth=2
	movq	16(%rsp), %rdi          # 8-byte Reload
	callq	free
.LBB6_26:                               # %if.end116
                                        #   in Loop: Header=BB6_12 Depth=2
	movq	8(%rsp), %rax           # 8-byte Reload
	andb	$1, %al
	xorl	%ebp, %ebp
                                        # kill: %AL<def> %AL<kill> %RAX<kill> %RAX<def>
	movq	%rax, (%rsp)            # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	jmp	.LBB6_27
	.p2align	4, 0x90
.LBB6_23:                               #   in Loop: Header=BB6_12 Depth=2
	xorl	%r14d, %r14d
	xorl	%ebp, %ebp
	jmp	.LBB6_27
	.p2align	4, 0x90
.LBB6_28:                               # %blklab17
                                        #   in Loop: Header=BB6_5 Depth=1
	movq	80(%rsp), %rax          # 8-byte Reload
	incq	%rax
	cmpq	64(%rsp), %rax          # 8-byte Folded Reload
	jne	.LBB6_5
.LBB6_29:                               # %if.end161
	xorl	%edi, %edi
	movl	$27, %esi
	callq	create1DArray_int64_t
	movq	%rax, %rbp
	movaps	.LCPI6_3(%rip), %xmm0   # xmm0 = [80,97]
	movups	%xmm0, (%rbp)
	movaps	.LCPI6_4(%rip), %xmm0   # xmm0 = [115,115]
	movups	%xmm0, 16(%rbp)
	movaps	.LCPI6_5(%rip), %xmm0   # xmm0 = [32,110]
	movups	%xmm0, 32(%rbp)
	movaps	.LCPI6_6(%rip), %xmm0   # xmm0 = [101,119]
	movups	%xmm0, 48(%rbp)
	movaps	.LCPI6_7(%rip), %xmm0   # xmm0 = [84,105]
	movups	%xmm0, 64(%rbp)
	movaps	.LCPI6_8(%rip), %xmm0   # xmm0 = [99,84]
	movups	%xmm0, 80(%rbp)
	movaps	.LCPI6_9(%rip), %xmm0   # xmm0 = [97,99]
	movups	%xmm0, 96(%rbp)
	movaps	.LCPI6_10(%rip), %xmm0  # xmm0 = [84,111]
	movups	%xmm0, 112(%rbp)
	movaps	.LCPI6_11(%rip), %xmm0  # xmm0 = [101,32]
	movups	%xmm0, 128(%rbp)
	movaps	.LCPI6_12(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 144(%rbp)
	movaps	.LCPI6_13(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 160(%rbp)
	movaps	.LCPI6_14(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 176(%rbp)
	movaps	.LCPI6_15(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 192(%rbp)
	movq	$101, 208(%rbp)
	testq	%rbp, %rbp
	setne	%r12b
	movl	$27, %esi
	movq	%rbp, %rdi
	callq	println_s
	movq	56(%rsp), %rdi          # 8-byte Reload
	callq	free
	testb	$1, (%rsp)              # 1-byte Folded Reload
	je	.LBB6_31
# BB#30:                                # %if.then163
	movq	(%r13), %rdi
	callq	free
	movq	16(%rsp), %rdi          # 8-byte Reload
	callq	free
.LBB6_31:                               # %if.end164
	testb	$1, 8(%rsp)             # 1-byte Folded Reload
	je	.LBB6_33
# BB#32:                                # %if.then166
	movq	(%r14), %rdi
	callq	free
	movq	%r14, %rdi
	callq	free
.LBB6_33:                               # %if.end170
	movq	40(%rsp), %r14          # 8-byte Reload
	movq	24(%rsp), %r13          # 8-byte Reload
	testq	%r14, %r14
	je	.LBB6_36
.LBB6_35:                               # %if.then172
	movq	48(%rsp), %rsi
	movq	%r14, %rdi
	callq	free2DArray_int64_t
.LBB6_36:                               # %if.end182
	cmpb	$0, 32(%rsp)            # 1-byte Folded Reload
	je	.LBB6_38
# BB#37:                                # %if.then184
	movq	%r15, %rdi
	callq	free
.LBB6_38:                               # %if.end185
	testb	$1, %r13b
	je	.LBB6_40
# BB#39:                                # %if.then187
	movq	%rbx, %rdi
	callq	free
.LBB6_40:                               # %if.end188
	testb	%r12b, %r12b
	je	.LBB6_42
# BB#41:                                # %if.then190
	movq	%rbp, %rdi
	callq	free
.LBB6_42:                               # %if.end191
	xorl	%edi, %edi
	callq	exit
.LBB6_1:
	xorl	%r12d, %r12d
	xorl	%ebp, %ebp
	xorl	%r13d, %r13d
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	xorl	%r15d, %r15d
	testq	%r14, %r14
	jne	.LBB6_35
	jmp	.LBB6_36
.LBB6_3:
	xorl	%eax, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
                                        # implicit-def: %RAX
	movq	%rax, 16(%rsp)          # 8-byte Spill
                                        # implicit-def: %R13
                                        # implicit-def: %R14
	movl	$0, %eax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	xorl	%r15d, %r15d
	xorl	%eax, %eax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	jmp	.LBB6_29
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
	.asciz	"%ld"
	.size	.L.str.3, 4


	.ident	"clang version 4.0.0 (http://llvm.org/git/clang.git 9b9db7fa41a1905899dbcbcc6cbdd05d2511da8e) (http://llvm.org/git/llvm.git fd456e365e09d54850dabc6a2f840a0c2eae7c27)"
	.section	".note.GNU-stack","",@progbits
