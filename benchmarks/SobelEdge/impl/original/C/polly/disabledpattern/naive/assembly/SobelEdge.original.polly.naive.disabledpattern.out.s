	.text
	.file	"llvm/SobelEdge.original.polly.naive.disabledpattern.out.ll"
	.globl	_wrap_
	.p2align	4, 0x90
	.type	_wrap_,@function
_wrap_:                                 # @_wrap_
	.cfi_startproc
# BB#0:                                 # %entry
	cmpq	%rdi, %rsi
	jle	.LBB0_1
# BB#2:                                 # %blklab0
	movq	%rdi, %rax
	sarq	$63, %rax
	xorq	%rdi, %rax
	retq
.LBB0_1:                                # %if.end
	notq	%rdi
	leaq	(%rdi,%rsi,2), %rax
	retq
.Lfunc_end0:
	.size	_wrap_, .Lfunc_end0-_wrap_
	.cfi_endproc

	.globl	_convolution_
	.p2align	4, 0x90
	.type	_convolution_,@function
_convolution_:                          # @_convolution_
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Lcfi0:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Lcfi1:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Lcfi2:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Lcfi3:
	.cfi_def_cfa_offset 40
.Lcfi4:
	.cfi_offset %rbx, -40
.Lcfi5:
	.cfi_offset %r12, -32
.Lcfi6:
	.cfi_offset %r14, -24
.Lcfi7:
	.cfi_offset %r15, -16
	movq	%rdx, %r10
	movq	40(%rsp), %r11
	leaq	-1(%r9), %rax
	leaq	-1(%r8), %rbx
	cqto
	idivq	%rcx
	movq	%rdx, %rsi
	negq	%rsi
	cmovlq	%rdx, %rsi
	imulq	%r10, %rsi
	movq	%rbx, %rax
	cqto
	idivq	%r10
	movq	%rdx, %r14
	negq	%r14
	cmovlq	%rdx, %r14
	leaq	(%r14,%rsi), %rax
	movzbl	(%rdi,%rax), %r15d
	imulq	(%r11), %r15
	movq	%r8, %rax
	cqto
	idivq	%r10
	movq	%rdx, %r12
	negq	%r12
	cmovlq	%rdx, %r12
	leaq	(%r12,%rsi), %rax
	movzbl	(%rdi,%rax), %ebx
	imulq	8(%r11), %rbx
	addq	%r15, %rbx
	leaq	1(%r8), %rax
	cqto
	idivq	%r10
	movq	%rdx, %r8
	negq	%r8
	cmovlq	%rdx, %r8
	addq	%r8, %rsi
	movzbl	(%rdi,%rsi), %esi
	imulq	16(%r11), %rsi
	addq	%rbx, %rsi
	movq	%r9, %rax
	cqto
	idivq	%rcx
	movq	%rdx, %rax
	negq	%rax
	cmovlq	%rdx, %rax
	imulq	%r10, %rax
	leaq	(%r14,%rax), %rdx
	movzbl	(%rdi,%rdx), %edx
	imulq	24(%r11), %rdx
	addq	%rsi, %rdx
	leaq	(%r12,%rax), %rsi
	movzbl	(%rdi,%rsi), %esi
	imulq	32(%r11), %rsi
	addq	%rdx, %rsi
	addq	%r8, %rax
	movzbl	(%rdi,%rax), %ebx
	imulq	40(%r11), %rbx
	addq	%rsi, %rbx
	leaq	1(%r9), %rax
	cqto
	idivq	%rcx
	movq	%rdx, %rax
	negq	%rax
	cmovlq	%rdx, %rax
	imulq	%r10, %rax
	addq	%rax, %r14
	movzbl	(%rdi,%r14), %ecx
	imulq	48(%r11), %rcx
	addq	%rbx, %rcx
	addq	%rax, %r12
	movzbl	(%rdi,%r12), %edx
	imulq	56(%r11), %rdx
	addq	%rcx, %rdx
	addq	%r8, %rax
	movzbl	(%rdi,%rax), %eax
	imulq	64(%r11), %rax
	addq	%rdx, %rax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Lfunc_end1:
	.size	_convolution_, .Lfunc_end1-_convolution_
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI2_0:
	.quad	1                       # 0x1
	.quad	-2                      # 0xfffffffffffffffe
.LCPI2_1:
	.quad	1                       # 0x1
	.quad	2                       # 0x2
.LCPI2_2:
	.quad	-1                      # 0xffffffffffffffff
	.quad	-2                      # 0xfffffffffffffffe
	.text
	.globl	_sobelEdgeDetection_
	.p2align	4, 0x90
	.type	_sobelEdgeDetection_,@function
_sobelEdgeDetection_:                   # @_sobelEdgeDetection_
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Lcfi8:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi9:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi10:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi11:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi12:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi13:
	.cfi_def_cfa_offset 56
	subq	$104, %rsp
.Lcfi14:
	.cfi_def_cfa_offset 160
.Lcfi15:
	.cfi_offset %rbx, -56
.Lcfi16:
	.cfi_offset %r12, -48
.Lcfi17:
	.cfi_offset %r13, -40
.Lcfi18:
	.cfi_offset %r14, -32
.Lcfi19:
	.cfi_offset %r15, -24
.Lcfi20:
	.cfi_offset %rbp, -16
	movq	%r8, 64(%rsp)           # 8-byte Spill
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%rsi, 96(%rsp)          # 8-byte Spill
	movq	%rdi, 48(%rsp)          # 8-byte Spill
	movq	%rbx, %r12
	imulq	%rbp, %rbx
	movl	$32, %edi
	movq	%rbx, %rsi
	callq	create1DArray_BYTE
	movq	%rax, %rdi
	movq	%rbx, 56(%rsp)          # 8-byte Spill
	movq	%rbx, %rsi
	callq	copy1DArray_BYTE
	movq	%rax, 40(%rsp)          # 8-byte Spill
	xorl	%edi, %edi
	movl	$9, %esi
	callq	create1DArray_int64_t
	movq	$-1, %rcx
	movd	%rcx, %xmm0
	movdqu	%xmm0, (%rax)
	movaps	.LCPI2_0(%rip), %xmm1   # xmm1 = [1,18446744073709551614]
	movups	%xmm1, 16(%rax)
	movl	$2, %ecx
	movd	%rcx, %xmm1
	pslldq	$8, %xmm1               # xmm1 = zero,zero,zero,zero,zero,zero,zero,zero,xmm1[0,1,2,3,4,5,6,7]
	movdqu	%xmm1, 32(%rax)
	movdqu	%xmm0, 48(%rax)
	movq	$1, 64(%rax)
	movl	$9, %esi
	movq	%rax, %rdi
	callq	copy1DArray_int64_t
	movq	%rax, 88(%rsp)          # 8-byte Spill
	xorl	%edi, %edi
	movl	$9, %esi
	callq	create1DArray_int64_t
	movaps	.LCPI2_1(%rip), %xmm0   # xmm0 = [1,2]
	movups	%xmm0, (%rax)
	movq	$1, 16(%rax)
	xorps	%xmm0, %xmm0
	movups	%xmm0, 24(%rax)
	movq	$0, 40(%rax)
	movaps	.LCPI2_2(%rip), %xmm0   # xmm0 = [18446744073709551615,18446744073709551614]
	movups	%xmm0, 48(%rax)
	movq	$-1, 64(%rax)
	movl	$9, %esi
	movq	%rax, %rdi
	callq	copy1DArray_int64_t
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	%rbp, 32(%rsp)          # 8-byte Spill
	testq	%rbp, %rbp
	jle	.LBB2_8
# BB#1:                                 # %entry
	testq	%r12, %r12
	jle	.LBB2_8
# BB#2:                                 # %while.cond28.preheader.us.preheader
	xorl	%eax, %eax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	40(%rsp), %r15          # 8-byte Reload
	.p2align	4, 0x90
.LBB2_3:                                # %while.cond28.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_4 Depth 2
	movq	%r15, 72(%rsp)          # 8-byte Spill
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB2_4:                                # %if.end32.us
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	48(%rsp), %rdi          # 8-byte Reload
	movq	96(%rsp), %rbp          # 8-byte Reload
	movq	%rbp, %rsi
	callq	copy1DArray_BYTE
	movq	%r12, %r14
	movq	%rax, %r12
	movl	$9, %esi
	movq	88(%rsp), %rdi          # 8-byte Reload
	callq	copy1DArray_int64_t
	movq	%rax, (%rsp)
	movq	%r12, %rdi
	movq	32(%rsp), %r12          # 8-byte Reload
	movq	%r12, %rdx
	movq	%r14, %rcx
	movq	24(%rsp), %rax          # 8-byte Reload
	movq	%rax, %r8
	movq	%r8, 24(%rsp)           # 8-byte Spill
	movq	%r13, %r9
	callq	_convolution_
	movq	%rax, %rbx
	negq	%rbx
	cmovlq	%rax, %rbx
	movq	48(%rsp), %rdi          # 8-byte Reload
	movq	%rbp, %rsi
	callq	copy1DArray_BYTE
	movq	%rax, %rbp
	movl	$9, %esi
	movq	80(%rsp), %rdi          # 8-byte Reload
	callq	copy1DArray_int64_t
	movq	%rax, (%rsp)
	movq	%rbp, %rdi
	movq	%r12, %rdx
	movq	%r14, %r12
	movq	%r14, %rcx
	movq	24(%rsp), %r8           # 8-byte Reload
	movq	%r13, %r9
	callq	_convolution_
	movq	%rax, %rcx
	negq	%rcx
	cmovlq	%rax, %rcx
	addq	%rbx, %rcx
	cmpq	$64, %rcx
	jg	.LBB2_6
# BB#5:                                 # %if.end46.us
                                        #   in Loop: Header=BB2_4 Depth=2
	movb	$98, (%r15)
.LBB2_6:                                # %blklab12.us
                                        #   in Loop: Header=BB2_4 Depth=2
	incq	%r13
	addq	32(%rsp), %r15          # 8-byte Folded Reload
	cmpq	%r13, %r12
	jne	.LBB2_4
# BB#7:                                 # %blklab10.loopexit.us
                                        #   in Loop: Header=BB2_3 Depth=1
	movq	24(%rsp), %rax          # 8-byte Reload
	movq	%rax, %rcx
	incq	%rcx
	movq	72(%rsp), %r15          # 8-byte Reload
	incq	%r15
	movq	%rcx, %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	cmpq	32(%rsp), %rcx          # 8-byte Folded Reload
	jne	.LBB2_3
.LBB2_8:                                # %blklab8
	movq	64(%rsp), %rax          # 8-byte Reload
	movq	56(%rsp), %rcx          # 8-byte Reload
	movq	%rcx, (%rax)
	movq	40(%rsp), %rax          # 8-byte Reload
	addq	$104, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end2:
	.size	_sobelEdgeDetection_, .Lfunc_end2-_sobelEdgeDetection_
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI3_0:
	.quad	80                      # 0x50
	.quad	49                      # 0x31
	.text
	.globl	_print_pbm_
	.p2align	4, 0x90
	.type	_print_pbm_,@function
_print_pbm_:                            # @_print_pbm_
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Lcfi21:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi22:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi23:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi24:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi25:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi26:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Lcfi27:
	.cfi_def_cfa_offset 64
.Lcfi28:
	.cfi_offset %rbx, -56
.Lcfi29:
	.cfi_offset %r12, -48
.Lcfi30:
	.cfi_offset %r13, -40
.Lcfi31:
	.cfi_offset %r14, -32
.Lcfi32:
	.cfi_offset %r15, -24
.Lcfi33:
	.cfi_offset %rbp, -16
	movq	%rcx, %r12
	movq	%rdx, %r14
	movq	%rsi, %r15
	xorl	%edi, %edi
	movl	$2, %esi
	callq	create1DArray_int64_t
	movaps	.LCPI3_0(%rip), %xmm0   # xmm0 = [80,49]
	movups	%xmm0, (%rax)
	movl	$2, %esi
	movq	%rax, %rdi
	callq	println_s
	movl	$.L.str, %edi
	xorl	%eax, %eax
	movq	%r15, %rsi
	callq	printf
	xorl	%edi, %edi
	movl	$1, %esi
	callq	create1DArray_int64_t
	movq	$32, (%rax)
	movl	$1, %esi
	movq	%rax, %rdi
	callq	printf_s
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%r14, %rsi
	callq	printf
	testq	%r14, %r14
	jle	.LBB3_10
# BB#1:                                 # %while.cond6.preheader.preheader
	testq	%r15, %r15
	jle	.LBB3_9
# BB#2:                                 # %while.cond6.preheader.us.preheader
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB3_3:                                # %while.cond6.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_4 Depth 2
	movq	%r12, %rbx
	movq	%r15, %rbp
	.p2align	4, 0x90
.LBB3_4:                                # %if.end10.us
                                        #   Parent Loop BB3_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpb	$32, (%rbx)
	jne	.LBB3_5
# BB#6:                                 # %if.end16.us
                                        #   in Loop: Header=BB3_4 Depth=2
	movl	$.L.str, %edi
	xorl	%esi, %esi
	jmp	.LBB3_7
	.p2align	4, 0x90
.LBB3_5:                                # %blklab17.us
                                        #   in Loop: Header=BB3_4 Depth=2
	movl	$.L.str, %edi
	movl	$1, %esi
.LBB3_7:                                # %blklab18.us
                                        #   in Loop: Header=BB3_4 Depth=2
	xorl	%eax, %eax
	callq	printf
	xorl	%edi, %edi
	movl	$1, %esi
	callq	create1DArray_int64_t
	movq	$32, (%rax)
	movl	$1, %esi
	movq	%rax, %rdi
	callq	printf_s
	incq	%rbx
	decq	%rbp
	jne	.LBB3_4
# BB#8:                                 # %blklab15.loopexit.us
                                        #   in Loop: Header=BB3_3 Depth=1
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	create1DArray_int64_t
	xorl	%esi, %esi
	movq	%rax, %rdi
	callq	println_s
	incq	%r13
	addq	%r15, %r12
	cmpq	%r14, %r13
	jne	.LBB3_3
	jmp	.LBB3_10
	.p2align	4, 0x90
.LBB3_9:                                # %while.cond6.preheader
                                        # =>This Inner Loop Header: Depth=1
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	create1DArray_int64_t
	xorl	%esi, %esi
	movq	%rax, %rdi
	callq	println_s
	decq	%r14
	jne	.LBB3_9
.LBB3_10:                               # %blklab13
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end3:
	.size	_print_pbm_, .Lfunc_end3-_print_pbm_
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Lcfi34:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Lcfi35:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Lcfi36:
	.cfi_def_cfa_offset 32
	subq	$48, %rsp
.Lcfi37:
	.cfi_def_cfa_offset 80
.Lcfi38:
	.cfi_offset %rbx, -32
.Lcfi39:
	.cfi_offset %r14, -24
.Lcfi40:
	.cfi_offset %rbp, -16
	movq	%rsi, %rbx
	movl	%edi, %ebp
	movq	$0, 40(%rsp)
	movq	$0, 16(%rsp)
	movq	$0, 32(%rsp)
	movq	$0, 24(%rsp)
	movq	$0, 8(%rsp)
	movq	$0, (%rsp)
	leaq	40(%rsp), %rdx
	leaq	16(%rsp), %rcx
	callq	convertArgsToIntArray
	movq	(%rax), %rdi
	movq	16(%rsp), %rsi
	callq	Reader
	movq	%rax, %r14
	leaq	32(%rsp), %rdx
	leaq	24(%rsp), %rcx
	movl	%ebp, %edi
	movq	%rbx, %rsi
	callq	convertArgsToIntArray
	movq	8(%rax), %rdi
	callq	parseStringToInt
	movq	(%rax), %rbx
	leaq	8(%rsp), %rsi
	movq	%r14, %rdi
	callq	readAll
	movq	8(%rsp), %rbp
	movq	%rax, %rdi
	movq	%rbp, %rsi
	callq	copy1DArray_BYTE
	movq	%rax, %rdi
	movq	%rbp, %rsi
	callq	copy1DArray_BYTE
	movq	%rsp, %r8
	movq	%rax, %rdi
	movq	%rbp, %rsi
	movq	%rbx, %rdx
	movq	%rbx, %rcx
	callq	_sobelEdgeDetection_
	movq	(%rsp), %rbp
	movq	%rax, %rdi
	movq	%rbp, %rsi
	callq	copy1DArray_BYTE
	movq	%rax, %rdi
	movq	%rbp, %rsi
	callq	copy1DArray_BYTE
	movq	%rbx, %rsi
	movq	%rbx, %rdx
	movq	%rax, %rcx
	callq	_print_pbm_
	xorl	%edi, %edi
	callq	exit
.Lfunc_end4:
	.size	main, .Lfunc_end4-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%ld"
	.size	.L.str, 4

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"%ld\n"
	.size	.L.str.1, 5


	.ident	"clang version 4.0.0 (http://llvm.org/git/clang.git 9b9db7fa41a1905899dbcbcc6cbdd05d2511da8e) (http://llvm.org/git/llvm.git fd456e365e09d54850dabc6a2f840a0c2eae7c27)"
	.section	".note.GNU-stack","",@progbits
