	.text
	.file	"llvm/newTicTacToe.original.openmp.naive.disabledpattern.out.ll"
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
	pushq	%r15
.Lcfi22:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Lcfi23:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Lcfi24:
	.cfi_def_cfa_offset 32
.Lcfi25:
	.cfi_offset %rbx, -32
.Lcfi26:
	.cfi_offset %r14, -24
.Lcfi27:
	.cfi_offset %r15, -16
	movl	$9, %r15d
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
	movq	%rax, %r14
	movd	%r15, %xmm0
	movdqu	%xmm0, 8(%r14)
	movl	$9, %esi
	movq	%rbx, %rdi
	callq	copy1DArray_int64_t
	movq	%rax, (%r14)
	movq	%r14, %rax
	popq	%rbx
	popq	%r14
	popq	%r15
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
	testq	%rsi, %rsi
	jle	.LBB5_1
# BB#2:                                 # %polly.loop_header.preheader
	leaq	-1(%rsi), %r8
	movq	%rsi, %r9
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	andq	$3, %r9
	je	.LBB5_4
	.p2align	4, 0x90
.LBB5_3:                                # %polly.loop_header.prol
                                        # =>This Inner Loop Header: Depth=1
	xorl	%r10d, %r10d
	cmpq	%rdx, (%rdi,%rax,8)
	sete	%r10b
	addq	%r10, %rcx
	incq	%rax
	cmpq	%rax, %r9
	jne	.LBB5_3
.LBB5_4:                                # %polly.loop_header.prol.loopexit
	cmpq	$3, %r8
	jb	.LBB5_7
# BB#5:                                 # %polly.loop_header.preheader.new
	movq	%rsi, %r8
	subq	%rax, %r8
	leaq	24(%rdi,%rax,8), %rdi
	.p2align	4, 0x90
.LBB5_6:                                # %polly.loop_header
                                        # =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
	cmpq	%rdx, -24(%rdi)
	sete	%al
	addq	%rcx, %rax
	xorl	%ecx, %ecx
	cmpq	%rdx, -16(%rdi)
	sete	%cl
	addq	%rax, %rcx
	xorl	%eax, %eax
	cmpq	%rdx, -8(%rdi)
	sete	%al
	addq	%rcx, %rax
	xorl	%ecx, %ecx
	cmpq	%rdx, (%rdi)
	sete	%cl
	addq	%rax, %rcx
	addq	$32, %rdi
	addq	$-4, %r8
	jne	.LBB5_6
	jmp	.LBB5_7
.LBB5_1:
                                        # implicit-def: %RCX
.LBB5_7:                                # %polly.cond22
	xorl	%eax, %eax
	testq	%rsi, %rsi
	cmovgq	%rcx, %rax
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
.Lcfi28:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi29:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi30:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi31:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi32:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi33:
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
.Lcfi34:
	.cfi_def_cfa_offset 112
.Lcfi35:
	.cfi_offset %rbx, -56
.Lcfi36:
	.cfi_offset %r12, -48
.Lcfi37:
	.cfi_offset %r13, -40
.Lcfi38:
	.cfi_offset %r14, -32
.Lcfi39:
	.cfi_offset %r15, -24
.Lcfi40:
	.cfi_offset %rbp, -16
	movq	$0, 24(%rsp)
	movq	$0, 16(%rsp)
	leaq	24(%rsp), %rdx
	leaq	16(%rsp), %rcx
	callq	convertArgsToIntArray
	movq	(%rax), %rdi
	callq	parseStringToInt
	movq	(%rax), %rax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	testq	%rax, %rax
	jle	.LBB6_12
# BB#1:                                 # %if.end5.preheader
	xorl	%r13d, %r13d
	movl	$1, %r12d
	movd	%r12, %xmm0
	pslldq	$8, %xmm0               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7]
	movdqa	%xmm0, 32(%rsp)         # 16-byte Spill
	.p2align	4, 0x90
.LBB6_2:                                # %if.end5
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_3 Depth 2
	xorl	%edi, %edi
	movl	$9, %esi
	callq	create1DArray_int64_t
	pxor	%xmm0, %xmm0
	movdqu	%xmm0, 48(%rax)
	movdqu	%xmm0, 32(%rax)
	movdqu	%xmm0, 16(%rax)
	movdqu	%xmm0, (%rax)
	movq	$0, 64(%rax)
	movl	$9, %esi
	movq	%rax, %rdi
	callq	copy1DArray_int64_t
	movq	%rax, %r14
	movl	$24, %edi
	callq	malloc
	movq	%rax, %rbx
	movq	$9, 8(%rbx)
	movl	$9, %esi
	movq	%r14, %rdi
	callq	copy1DArray_int64_t
	movq	%rax, (%rbx)
	movq	$0, 16(%rbx)
	xorl	%edi, %edi
	movl	$9, %esi
	callq	create1DArray_int64_t
	pxor	%xmm0, %xmm0
	movdqu	%xmm0, 48(%rax)
	movdqu	%xmm0, 32(%rax)
	movdqu	%xmm0, 16(%rax)
	movdqu	%xmm0, (%rax)
	movq	$0, 64(%rax)
	movl	$9, %esi
	movq	%rax, %rdi
	callq	copy1DArray_int64_t
	movq	%rax, %r15
	movl	$24, %edi
	callq	malloc
	movq	%rax, %r14
	movq	$9, 8(%r14)
	movl	$9, %esi
	movq	%r15, %rdi
	callq	copy1DArray_int64_t
	movq	%rax, (%r14)
	movq	$0, 16(%r14)
	xorl	%edi, %edi
	movl	$9, %esi
	callq	create1DArray_int64_t
	movaps	32(%rsp), %xmm0         # 16-byte Reload
	movups	%xmm0, (%rax)
	movaps	.LCPI6_0(%rip), %xmm0   # xmm0 = [2,3]
	movups	%xmm0, 16(%rax)
	movaps	.LCPI6_1(%rip), %xmm0   # xmm0 = [4,5]
	movups	%xmm0, 32(%rax)
	movdqa	.LCPI6_2(%rip), %xmm0   # xmm0 = [6,7]
	movdqu	%xmm0, 48(%rax)
	movq	$8, 64(%rax)
	movq	$-1, %rbp
	.p2align	4, 0x90
.LBB6_3:                                # %if.end24
                                        #   Parent Loop BB6_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	xorl	%edi, %edi
	movl	$9, %esi
	callq	create1DArray_int64_t
	movd	%r12, %xmm0
	pslldq	$8, %xmm0               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7]
	movdqu	%xmm0, (%rax)
	movaps	.LCPI6_0(%rip), %xmm0   # xmm0 = [2,3]
	movups	%xmm0, 16(%rax)
	movaps	.LCPI6_1(%rip), %xmm0   # xmm0 = [4,5]
	movups	%xmm0, 32(%rax)
	movdqa	.LCPI6_2(%rip), %xmm0   # xmm0 = [6,7]
	movdqu	%xmm0, 48(%rax)
	movq	$8, 64(%rax)
	movq	8(%rax,%rbp,8), %rax
	cmpq	$9, %rax
	ja	.LBB6_11
# BB#4:                                 # %polly.split_new_and_old
                                        #   in Loop: Header=BB6_3 Depth=2
	movq	%rbx, %rcx
	orq	%r14, %rcx
	jne	.LBB6_6
.LBB6_5:                                #   in Loop: Header=BB6_3 Depth=2
	xorl	%r14d, %r14d
	xorl	%ebx, %ebx
	jmp	.LBB6_10
	.p2align	4, 0x90
.LBB6_6:                                # %blklab19
                                        #   in Loop: Header=BB6_3 Depth=2
	testq	%rbx, %rbx
	je	.LBB6_8
# BB#7:                                 # %if.end44
                                        #   in Loop: Header=BB6_3 Depth=2
	movq	(%rbx), %rcx
	movq	$1, (%rcx,%rax,8)
	incq	16(%rbx)
	movl	$24, %edi
	callq	malloc
	movq	%rax, %r14
	movq	8(%rbx), %rsi
	movq	%rsi, 8(%r14)
	movq	(%rbx), %rdi
	callq	copy1DArray_int64_t
	movq	%rax, (%r14)
	movq	16(%rbx), %rax
	movq	%rax, 16(%r14)
	xorl	%ebx, %ebx
	jmp	.LBB6_10
.LBB6_8:                                # %blklab22
                                        #   in Loop: Header=BB6_3 Depth=2
	testq	%r14, %r14
	je	.LBB6_5
# BB#9:                                 # %if.end50
                                        #   in Loop: Header=BB6_3 Depth=2
	movq	(%r14), %rcx
	movq	$2, (%rcx,%rax,8)
	incq	16(%r14)
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
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB6_10:                               # %blklab20
                                        #   in Loop: Header=BB6_3 Depth=2
	xorl	%edi, %edi
	movl	$9, %esi
	callq	create1DArray_int64_t
	movd	%r12, %xmm0
	pslldq	$8, %xmm0               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7]
	movdqu	%xmm0, (%rax)
	movaps	.LCPI6_0(%rip), %xmm0   # xmm0 = [2,3]
	movups	%xmm0, 16(%rax)
	movaps	.LCPI6_1(%rip), %xmm0   # xmm0 = [4,5]
	movups	%xmm0, 32(%rax)
	movdqa	.LCPI6_2(%rip), %xmm0   # xmm0 = [6,7]
	movdqu	%xmm0, 48(%rax)
	movq	$8, 64(%rax)
	incq	%rbp
	cmpq	$8, %rbp
	jl	.LBB6_3
.LBB6_11:                               # %blklab17
                                        #   in Loop: Header=BB6_2 Depth=1
	incq	%r13
	cmpq	8(%rsp), %r13           # 8-byte Folded Reload
	jne	.LBB6_2
.LBB6_12:                               # %blklab15
	xorl	%edi, %edi
	movl	$27, %esi
	callq	create1DArray_int64_t
	movaps	.LCPI6_3(%rip), %xmm0   # xmm0 = [80,97]
	movups	%xmm0, (%rax)
	movaps	.LCPI6_4(%rip), %xmm0   # xmm0 = [115,115]
	movups	%xmm0, 16(%rax)
	movaps	.LCPI6_5(%rip), %xmm0   # xmm0 = [32,110]
	movups	%xmm0, 32(%rax)
	movaps	.LCPI6_6(%rip), %xmm0   # xmm0 = [101,119]
	movups	%xmm0, 48(%rax)
	movaps	.LCPI6_7(%rip), %xmm0   # xmm0 = [84,105]
	movups	%xmm0, 64(%rax)
	movaps	.LCPI6_8(%rip), %xmm0   # xmm0 = [99,84]
	movups	%xmm0, 80(%rax)
	movaps	.LCPI6_9(%rip), %xmm0   # xmm0 = [97,99]
	movups	%xmm0, 96(%rax)
	movaps	.LCPI6_10(%rip), %xmm0  # xmm0 = [84,111]
	movups	%xmm0, 112(%rax)
	movaps	.LCPI6_11(%rip), %xmm0  # xmm0 = [101,32]
	movups	%xmm0, 128(%rax)
	movaps	.LCPI6_12(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 144(%rax)
	movaps	.LCPI6_13(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 160(%rax)
	movaps	.LCPI6_14(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 176(%rax)
	movaps	.LCPI6_15(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 192(%rax)
	movq	$101, 208(%rax)
	movl	$27, %esi
	movq	%rax, %rdi
	callq	println_s
	xorl	%edi, %edi
	callq	exit
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
