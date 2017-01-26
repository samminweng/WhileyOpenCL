	.text
	.file	"llvm/SobelEdge.original.openmp.naive.disabledpattern.out.ll"
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
	subq	$152, %rsp
.Lcfi14:
	.cfi_def_cfa_offset 208
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
	movq	%r8, 40(%rsp)           # 8-byte Spill
	movq	%rcx, %r15
	movq	%rdx, %r12
	movq	%rsi, 24(%rsp)          # 8-byte Spill
	movq	%rdi, 16(%rsp)          # 8-byte Spill
	movq	%r15, %rbp
	imulq	%r12, %rbp
	movl	$32, %edi
	movq	%rbp, %rsi
	callq	create1DArray_BYTE
	movq	%rax, %rdi
	movq	%rbp, 32(%rsp)          # 8-byte Spill
	movq	%rbp, %rsi
	callq	copy1DArray_BYTE
	movq	%rax, 8(%rsp)           # 8-byte Spill
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
	movq	%rax, 72(%rsp)          # 8-byte Spill
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
	movq	%rax, 64(%rsp)          # 8-byte Spill
	testq	%r12, %r12
	jle	.LBB2_9
# BB#1:                                 # %while.cond28.preheader.preheader
	xorl	%eax, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	movq	%r12, 56(%rsp)          # 8-byte Spill
	movq	%r15, 48(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB2_2:                                # %while.cond28.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_5 Depth 2
	testq	%r15, %r15
	jle	.LBB2_3
# BB#4:                                 # %if.end32.preheader
                                        #   in Loop: Header=BB2_2 Depth=1
	movq	(%rsp), %rcx            # 8-byte Reload
	leaq	-1(%rcx), %rax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	leaq	1(%rcx), %rbp
	movq	8(%rsp), %rax           # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	xorl	%ebx, %ebx
	movq	%rbp, 88(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB2_5:                                # %if.end32
                                        #   Parent Loop BB2_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rax, 144(%rsp)         # 8-byte Spill
	movq	16(%rsp), %rdi          # 8-byte Reload
	movq	24(%rsp), %rsi          # 8-byte Reload
	callq	copy1DArray_BYTE
	movq	%rax, %r13
	movl	$9, %esi
	movq	72(%rsp), %rdi          # 8-byte Reload
	callq	copy1DArray_int64_t
	movq	%rax, %rcx
	leaq	-1(%rbx), %rax
	cqto
	idivq	%r15
	movq	%rbx, %r8
	movq	%rdx, %r14
	negq	%r14
	cmovlq	%rdx, %r14
	imulq	%r12, %r14
	movq	80(%rsp), %rax          # 8-byte Reload
	cqto
	idivq	%r12
	movq	%rdx, %rax
	negq	%rax
	cmovlq	%rdx, %rax
	leaq	(%rax,%r14), %rdx
	movq	%rdx, 128(%rsp)         # 8-byte Spill
	movq	%rax, %r10
	movzbl	(%r13,%rdx), %esi
	imulq	(%rcx), %rsi
	movq	(%rsp), %rax            # 8-byte Reload
	cqto
	idivq	%r12
	movq	%r12, %r9
	movq	%rdx, %rbx
	negq	%rbx
	cmovlq	%rdx, %rbx
	leaq	(%rbx,%r14), %rax
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movzbl	(%r13,%rax), %edi
	imulq	8(%rcx), %rdi
	addq	%rsi, %rdi
	movq	%rbp, %rax
	cqto
	idivq	%r9
	movq	%rdx, %rsi
	negq	%rsi
	cmovlq	%rdx, %rsi
	addq	%rsi, %r14
	movzbl	(%r13,%r14), %ebp
	imulq	16(%rcx), %rbp
	addq	%rdi, %rbp
	movq	%r8, %rax
	cqto
	idivq	%r15
	movq	%rdx, %r12
	negq	%r12
	cmovlq	%rdx, %r12
	imulq	%r9, %r12
	leaq	(%r12,%r10), %rax
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movzbl	(%r13,%rax), %eax
	imulq	24(%rcx), %rax
	addq	%rbp, %rax
	leaq	(%r12,%rbx), %rdx
	movq	%rdx, 104(%rsp)         # 8-byte Spill
	movzbl	(%r13,%rdx), %edx
	imulq	32(%rcx), %rdx
	addq	%rax, %rdx
	addq	%rsi, %r12
	movzbl	(%r13,%r12), %edi
	imulq	40(%rcx), %rdi
	addq	%rdx, %rdi
	incq	%r8
	movq	%r8, 136(%rsp)          # 8-byte Spill
	movq	%r8, %rax
	cqto
	idivq	%r15
	movq	%rdx, %r15
	negq	%r15
	cmovlq	%rdx, %r15
	imulq	%r9, %r15
	addq	%r15, %r10
	movq	%r10, 96(%rsp)          # 8-byte Spill
	movzbl	(%r13,%r10), %eax
	imulq	48(%rcx), %rax
	addq	%rdi, %rax
	addq	%r15, %rbx
	movzbl	(%r13,%rbx), %edx
	imulq	56(%rcx), %rdx
	addq	%rax, %rdx
	addq	%rsi, %r15
	movzbl	(%r13,%r15), %eax
	imulq	64(%rcx), %rax
	addq	%rdx, %rax
	movq	%rax, %r13
	negq	%r13
	cmovlq	%rax, %r13
	movq	16(%rsp), %rdi          # 8-byte Reload
	movq	24(%rsp), %rsi          # 8-byte Reload
	callq	copy1DArray_BYTE
	movq	%rax, %rbp
	movl	$9, %esi
	movq	64(%rsp), %rdi          # 8-byte Reload
	callq	copy1DArray_int64_t
	movq	128(%rsp), %rcx         # 8-byte Reload
	movzbl	(%rbp,%rcx), %ecx
	imulq	(%rax), %rcx
	movq	120(%rsp), %rdx         # 8-byte Reload
	movzbl	(%rbp,%rdx), %edx
	imulq	8(%rax), %rdx
	addq	%rcx, %rdx
	movzbl	(%rbp,%r14), %ecx
	imulq	16(%rax), %rcx
	addq	%rdx, %rcx
	movq	112(%rsp), %rdx         # 8-byte Reload
	movzbl	(%rbp,%rdx), %edx
	imulq	24(%rax), %rdx
	addq	%rcx, %rdx
	movq	104(%rsp), %rcx         # 8-byte Reload
	movzbl	(%rbp,%rcx), %ecx
	imulq	32(%rax), %rcx
	addq	%rdx, %rcx
	movzbl	(%rbp,%r12), %edx
	imulq	40(%rax), %rdx
	addq	%rcx, %rdx
	movq	96(%rsp), %rcx          # 8-byte Reload
	movzbl	(%rbp,%rcx), %ecx
	imulq	48(%rax), %rcx
	addq	%rdx, %rcx
	movzbl	(%rbp,%rbx), %edx
	imulq	56(%rax), %rdx
	addq	%rcx, %rdx
	movzbl	(%rbp,%r15), %ecx
	imulq	64(%rax), %rcx
	addq	%rdx, %rcx
	movq	%rcx, %rax
	negq	%rax
	cmovlq	%rcx, %rax
	addq	%r13, %rax
	cmpq	$64, %rax
	movq	144(%rsp), %rax         # 8-byte Reload
	jg	.LBB2_7
# BB#6:                                 # %if.end46
                                        #   in Loop: Header=BB2_5 Depth=2
	movb	$98, (%rax)
.LBB2_7:                                # %blklab12
                                        #   in Loop: Header=BB2_5 Depth=2
	movq	56(%rsp), %r12          # 8-byte Reload
	addq	%r12, %rax
	movq	136(%rsp), %rcx         # 8-byte Reload
	movq	48(%rsp), %r15          # 8-byte Reload
	cmpq	%rcx, %r15
	movq	88(%rsp), %rbp          # 8-byte Reload
	movq	%rcx, %rbx
	jne	.LBB2_5
	jmp	.LBB2_8
	.p2align	4, 0x90
.LBB2_3:                                # %while.cond28.preheader.blklab10_crit_edge
                                        #   in Loop: Header=BB2_2 Depth=1
	movq	(%rsp), %rbp            # 8-byte Reload
	incq	%rbp
.LBB2_8:                                # %blklab10
                                        #   in Loop: Header=BB2_2 Depth=1
	cmpq	%r12, %rbp
	movq	%rbp, (%rsp)            # 8-byte Spill
	jne	.LBB2_2
.LBB2_9:                                # %blklab8
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	32(%rsp), %rcx          # 8-byte Reload
	movq	%rcx, (%rax)
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$152, %rsp
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


	.ident	"clang version 5.0.0 (http://llvm.org/git/clang.git eeb00e3fd54addd6787926c7804bf7eadb3384d6) (http://llvm.org/git/llvm.git e8e3365d5266760f3d7ad247f21496bb69cfef39)"
	.section	".note.GNU-stack","",@progbits
