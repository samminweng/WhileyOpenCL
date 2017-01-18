	.text
	.file	"llvm/SobelEdge.original.openmp.naive_dealloc.disabledpattern.out.ll"
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
	pushq	%rbp
.Lcfi0:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi1:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi2:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi3:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi4:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi5:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Lcfi6:
	.cfi_def_cfa_offset 64
.Lcfi7:
	.cfi_offset %rbx, -56
.Lcfi8:
	.cfi_offset %r12, -48
.Lcfi9:
	.cfi_offset %r13, -40
.Lcfi10:
	.cfi_offset %r14, -32
.Lcfi11:
	.cfi_offset %r15, -24
.Lcfi12:
	.cfi_offset %rbp, -16
	movl	%edx, %r10d
	movb	88(%rsp), %r15b
	movq	72(%rsp), %r14
	movq	64(%rsp), %r11
	leaq	-1(%r11), %rax
	leaq	-1(%r9), %rbx
	cqto
	idivq	%r8
	movq	%rdx, %rsi
	negq	%rsi
	cmovlq	%rdx, %rsi
	imulq	%rcx, %rsi
	movq	%rbx, %rax
	cqto
	idivq	%rcx
	movq	%rdx, %r12
	negq	%r12
	cmovlq	%rdx, %r12
	leaq	(%r12,%rsi), %rax
	movzbl	(%rdi,%rax), %r13d
	imulq	(%r14), %r13
	movq	%r9, %rax
	cqto
	idivq	%rcx
	movq	%rdx, %rbp
	negq	%rbp
	cmovlq	%rdx, %rbp
	leaq	(%rbp,%rsi), %rax
	movzbl	(%rdi,%rax), %ebx
	imulq	8(%r14), %rbx
	addq	%r13, %rbx
	leaq	1(%r9), %rax
	cqto
	idivq	%rcx
	movq	%rdx, %r9
	negq	%r9
	cmovlq	%rdx, %r9
	addq	%r9, %rsi
	movzbl	(%rdi,%rsi), %esi
	imulq	16(%r14), %rsi
	addq	%rbx, %rsi
	movq	%r11, %rax
	cqto
	idivq	%r8
	movq	%rdx, %rax
	negq	%rax
	cmovlq	%rdx, %rax
	imulq	%rcx, %rax
	leaq	(%r12,%rax), %rdx
	movzbl	(%rdi,%rdx), %edx
	imulq	24(%r14), %rdx
	addq	%rsi, %rdx
	leaq	(%rbp,%rax), %rsi
	movzbl	(%rdi,%rsi), %esi
	imulq	32(%r14), %rsi
	addq	%rdx, %rsi
	addq	%r9, %rax
	movzbl	(%rdi,%rax), %ebx
	imulq	40(%r14), %rbx
	addq	%rsi, %rbx
	incq	%r11
	movq	%r11, %rax
	cqto
	idivq	%r8
	movq	%rdx, %rax
	negq	%rax
	cmovlq	%rdx, %rax
	imulq	%rcx, %rax
	addq	%rax, %r12
	movzbl	(%rdi,%r12), %ecx
	imulq	48(%r14), %rcx
	addq	%rbx, %rcx
	addq	%rax, %rbp
	movzbl	(%rdi,%rbp), %ebp
	imulq	56(%r14), %rbp
	addq	%rcx, %rbp
	addq	%r9, %rax
	movzbl	(%rdi,%rax), %ebx
	imulq	64(%r14), %rbx
	testb	%r10b, %r10b
	je	.LBB1_2
# BB#1:                                 # %if.then20
	callq	free
.LBB1_2:                                # %if.end21
	addq	%rbp, %rbx
	testb	%r15b, %r15b
	je	.LBB1_4
# BB#3:                                 # %if.then23
	movq	%r14, %rdi
	callq	free
.LBB1_4:                                # %if.end24
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
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
.Lcfi13:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi14:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi15:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi16:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi17:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi18:
	.cfi_def_cfa_offset 56
	subq	$152, %rsp
.Lcfi19:
	.cfi_def_cfa_offset 208
.Lcfi20:
	.cfi_offset %rbx, -56
.Lcfi21:
	.cfi_offset %r12, -48
.Lcfi22:
	.cfi_offset %r13, -40
.Lcfi23:
	.cfi_offset %r14, -32
.Lcfi24:
	.cfi_offset %r15, -24
.Lcfi25:
	.cfi_offset %rbp, -16
	movq	%r9, 136(%rsp)          # 8-byte Spill
	movq	%r8, %rbx
	movq	%rcx, %rbp
	movl	%edx, 52(%rsp)          # 4-byte Spill
	movq	%rsi, 96(%rsp)          # 8-byte Spill
	movq	%rdi, 64(%rsp)          # 8-byte Spill
	movq	%rbx, 40(%rsp)          # 8-byte Spill
	imulq	%rbp, %rbx
	movl	$32, %edi
	movq	%rbx, %rsi
	callq	create1DArray_BYTE
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	%rax, %rdi
	movq	%rbx, 128(%rsp)         # 8-byte Spill
	movq	%rbx, %rsi
	callq	copy1DArray_BYTE
	movq	%rax, 56(%rsp)          # 8-byte Spill
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
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movq	%rax, %rdi
	callq	copy1DArray_int64_t
	movq	%rax, 80(%rsp)          # 8-byte Spill
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
	movq	%rax, 104(%rsp)         # 8-byte Spill
	movq	%rax, %rdi
	callq	copy1DArray_int64_t
	movq	%rax, 72(%rsp)          # 8-byte Spill
	testq	%rbp, %rbp
	jle	.LBB2_8
# BB#1:                                 # %entry
	cmpq	$0, 40(%rsp)            # 8-byte Folded Reload
	jle	.LBB2_8
# BB#2:                                 # %while.cond68.preheader.us.preheader
	xorl	%eax, %eax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	56(%rsp), %r13          # 8-byte Reload
	movq	%rbp, 88(%rsp)          # 8-byte Spill
	movq	40(%rsp), %r15          # 8-byte Reload
	.p2align	4, 0x90
.LBB2_3:                                # %while.cond68.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_4 Depth 2
	movq	%r13, 144(%rsp)         # 8-byte Spill
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB2_4:                                # %if.end72.us
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	64(%rsp), %rbp          # 8-byte Reload
	movq	%rbp, %rdi
	movq	96(%rsp), %rsi          # 8-byte Reload
	callq	copy1DArray_BYTE
	movq	%rax, %r12
	movl	$9, %esi
	movq	80(%rsp), %rdi          # 8-byte Reload
	callq	copy1DArray_int64_t
	movq	%rax, 8(%rsp)
	movq	%r14, (%rsp)
	movl	$1, 24(%rsp)
	movl	$1, %edx
	movq	%r12, %rdi
	movq	88(%rsp), %rcx          # 8-byte Reload
	movq	%r15, %r8
	movq	32(%rsp), %r12          # 8-byte Reload
	movq	%r12, %r9
	callq	_convolution_
	movq	%rax, %rbx
	negq	%rbx
	cmovlq	%rax, %rbx
	movq	%rbp, %rdi
	movq	96(%rsp), %rsi          # 8-byte Reload
	callq	copy1DArray_BYTE
	movq	%rax, %rbp
	movl	$9, %esi
	movq	72(%rsp), %rdi          # 8-byte Reload
	callq	copy1DArray_int64_t
	movq	%rax, 8(%rsp)
	movq	%r14, (%rsp)
	movl	$1, 24(%rsp)
	movl	$1, %edx
	movq	%rbp, %rdi
	movq	88(%rsp), %rbp          # 8-byte Reload
	movq	%rbp, %rcx
	movq	%r15, %r8
	movq	%r12, %r9
	callq	_convolution_
	movq	%rax, %rcx
	negq	%rcx
	cmovlq	%rax, %rcx
	addq	%rbx, %rcx
	cmpq	$64, %rcx
	jg	.LBB2_6
# BB#5:                                 # %if.end86.us
                                        #   in Loop: Header=BB2_4 Depth=2
	movb	$98, (%r13)
.LBB2_6:                                # %blklab12.us
                                        #   in Loop: Header=BB2_4 Depth=2
	incq	%r14
	addq	%rbp, %r13
	cmpq	%r14, 40(%rsp)          # 8-byte Folded Reload
	jne	.LBB2_4
# BB#7:                                 # %blklab10.loopexit.us
                                        #   in Loop: Header=BB2_3 Depth=1
	movq	32(%rsp), %rax          # 8-byte Reload
	movq	%rax, %rcx
	incq	%rcx
	movq	144(%rsp), %r13         # 8-byte Reload
	incq	%r13
	movq	%rcx, %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	cmpq	%rbp, %rcx
	jne	.LBB2_3
.LBB2_8:                                # %blklab8
	cmpb	$0, 52(%rsp)            # 1-byte Folded Reload
	je	.LBB2_10
# BB#9:                                 # %if.then91
	movq	64(%rsp), %rdi          # 8-byte Reload
	callq	free
.LBB2_10:                               # %if.end95
	movq	80(%rsp), %rdi          # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB2_12
# BB#11:                                # %if.then97
	callq	free
.LBB2_12:                               # %if.end98
	movq	72(%rsp), %rdi          # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB2_14
# BB#13:                                # %if.then100
	callq	free
.LBB2_14:                               # %if.end101
	movq	120(%rsp), %rdi         # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB2_16
# BB#15:                                # %if.then103
	callq	free
.LBB2_16:                               # %if.end104
	movq	112(%rsp), %rdi         # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB2_18
# BB#17:                                # %if.then106
	callq	free
.LBB2_18:                               # %if.end107
	movq	104(%rsp), %rdi         # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB2_20
# BB#19:                                # %if.then109
	callq	free
.LBB2_20:                               # %if.end110
	movq	136(%rsp), %rax         # 8-byte Reload
	movq	128(%rsp), %rcx         # 8-byte Reload
	movq	%rcx, (%rax)
	movq	56(%rsp), %rax          # 8-byte Reload
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
.Lcfi26:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi27:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi28:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi29:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi30:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi31:
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
.Lcfi32:
	.cfi_def_cfa_offset 112
.Lcfi33:
	.cfi_offset %rbx, -56
.Lcfi34:
	.cfi_offset %r12, -48
.Lcfi35:
	.cfi_offset %r13, -40
.Lcfi36:
	.cfi_offset %r14, -32
.Lcfi37:
	.cfi_offset %r15, -24
.Lcfi38:
	.cfi_offset %rbp, -16
	movl	%r9d, 4(%rsp)           # 4-byte Spill
	movq	%rcx, 8(%rsp)           # 8-byte Spill
	movq	%rdx, %r14
	movq	%rsi, %rbp
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	movl	$2, %esi
	callq	create1DArray_int64_t
	movq	%rax, %r12
	movaps	.LCPI3_0(%rip), %xmm0   # xmm0 = [80,49]
	movups	%xmm0, (%r12)
	movl	$2, %esi
	movq	%r12, %rdi
	callq	println_s
	xorl	%r13d, %r13d
	movl	$.L.str, %edi
	xorl	%eax, %eax
	movq	%rbp, %rsi
	callq	printf
	xorl	%edi, %edi
	movl	$1, %esi
	callq	create1DArray_int64_t
	movq	%rax, %r15
	movq	$32, (%r15)
	movl	$1, %esi
	movq	%r15, %rdi
	callq	printf_s
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%r14, %rsi
	callq	printf
	movq	%r14, 16(%rsp)          # 8-byte Spill
	testq	%r14, %r14
	jle	.LBB3_1
# BB#3:                                 # %while.cond18.preheader.preheader
	testq	%rbp, %rbp
	movq	%rbp, %r14
	jle	.LBB3_4
# BB#9:                                 # %while.cond18.preheader.us.preheader
	movq	%r15, 24(%rsp)          # 8-byte Spill
	movq	%r12, 32(%rsp)          # 8-byte Spill
	movq	8(%rsp), %r15           # 8-byte Reload
	movl	$0, (%rsp)              # 4-byte Folded Spill
                                        # implicit-def: %RBP
	xorl	%r13d, %r13d
	xorl	%ebx, %ebx
	xorl	%r12d, %r12d
	movq	%r14, 40(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB3_10:                               # %while.cond18.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_11 Depth 2
	movq	%r15, 48(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB3_11:                               # %if.end22.us
                                        #   Parent Loop BB3_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpb	$32, (%r15)
	jne	.LBB3_12
# BB#13:                                # %if.end28.us
                                        #   in Loop: Header=BB3_11 Depth=2
	movl	$.L.str, %edi
	xorl	%esi, %esi
	jmp	.LBB3_14
	.p2align	4, 0x90
.LBB3_12:                               # %blklab17.us
                                        #   in Loop: Header=BB3_11 Depth=2
	movl	$.L.str, %edi
	movl	$1, %esi
.LBB3_14:                               # %blklab18.us
                                        #   in Loop: Header=BB3_11 Depth=2
	xorl	%eax, %eax
	callq	printf
	testb	$1, %r13b
	je	.LBB3_16
# BB#15:                                # %if.then32.us
                                        #   in Loop: Header=BB3_11 Depth=2
	movq	%rbx, %rdi
	callq	free
.LBB3_16:                               # %if.end33.us
                                        #   in Loop: Header=BB3_11 Depth=2
	xorl	%edi, %edi
	movl	$1, %esi
	callq	create1DArray_int64_t
	movq	%rax, %rbx
	movq	$32, (%rbx)
	testq	%rbx, %rbx
	setne	%r13b
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	printf_s
	incq	%r15
	decq	%r14
	jne	.LBB3_11
# BB#17:                                # %polly.split_new_and_old.loopexit.us
                                        #   in Loop: Header=BB3_10 Depth=1
	cmpb	$0, (%rsp)              # 1-byte Folded Reload
	je	.LBB3_19
# BB#18:                                # %if.then43.us
                                        #   in Loop: Header=BB3_10 Depth=1
	movq	%rbp, %rdi
	callq	free
.LBB3_19:                               # %if.end44.us
                                        #   in Loop: Header=BB3_10 Depth=1
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	create1DArray_int64_t
	movq	%rax, %rbp
	testq	%rbp, %rbp
	setne	%al
	movl	%eax, (%rsp)            # 4-byte Spill
	xorl	%esi, %esi
	movq	%rbp, %rdi
	callq	println_s
	incq	%r12
	movq	40(%rsp), %r14          # 8-byte Reload
	movq	48(%rsp), %r15          # 8-byte Reload
	addq	%r14, %r15
	cmpq	16(%rsp), %r12          # 8-byte Folded Reload
	jne	.LBB3_10
# BB#20:                                # %blklab13.loopexit
	movq	8(%rsp), %rdi           # 8-byte Reload
	movq	32(%rsp), %r12          # 8-byte Reload
	movl	4(%rsp), %eax           # 4-byte Reload
	movq	24(%rsp), %r15          # 8-byte Reload
	testb	%al, %al
	jne	.LBB3_22
	jmp	.LBB3_23
.LBB3_1:
                                        # implicit-def: %RBP
	movl	$0, (%rsp)              # 4-byte Folded Spill
	jmp	.LBB3_2
.LBB3_4:                                # %while.cond18.preheader.preheader155
	xorl	%r13d, %r13d
                                        # implicit-def: %RBP
	movq	16(%rsp), %r14          # 8-byte Reload
	.p2align	4, 0x90
.LBB3_5:                                # %while.cond18.preheader
                                        # =>This Inner Loop Header: Depth=1
	testb	%r13b, %r13b
	je	.LBB3_7
# BB#6:                                 # %if.then43
                                        #   in Loop: Header=BB3_5 Depth=1
	movq	%rbp, %rdi
	callq	free
.LBB3_7:                                # %if.end44
                                        #   in Loop: Header=BB3_5 Depth=1
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	create1DArray_int64_t
	movq	%rax, %rbp
	testq	%rbp, %rbp
	setne	%r13b
	xorl	%esi, %esi
	movq	%rbp, %rdi
	callq	println_s
	decq	%r14
	jne	.LBB3_5
# BB#8:
	movl	%r13d, (%rsp)           # 4-byte Spill
	xorl	%r13d, %r13d
.LBB3_2:                                # %blklab13
	movq	8(%rsp), %rdi           # 8-byte Reload
	movl	4(%rsp), %eax           # 4-byte Reload
	testb	%al, %al
	je	.LBB3_23
.LBB3_22:                               # %if.then53
	callq	free
.LBB3_23:                               # %if.end54
	testq	%r12, %r12
	je	.LBB3_25
# BB#24:                                # %if.then56
	movq	%r12, %rdi
	callq	free
.LBB3_25:                               # %if.end57
	testq	%r15, %r15
	je	.LBB3_27
# BB#26:                                # %if.then59
	movq	%r15, %rdi
	callq	free
.LBB3_27:                               # %if.end60
	testb	%r13b, %r13b
	je	.LBB3_29
# BB#28:                                # %if.then62
	movq	%rbx, %rdi
	callq	free
.LBB3_29:                               # %if.end63
	cmpb	$0, (%rsp)              # 1-byte Folded Reload
	je	.LBB3_30
# BB#31:                                # %if.then65
	movq	%rbp, %rdi
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	free                    # TAILCALL
.LBB3_30:                               # %if.end66
	addq	$56, %rsp
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
.Lcfi39:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi40:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi41:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi42:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi43:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi44:
	.cfi_def_cfa_offset 56
	subq	$88, %rsp
.Lcfi45:
	.cfi_def_cfa_offset 144
.Lcfi46:
	.cfi_offset %rbx, -56
.Lcfi47:
	.cfi_offset %r12, -48
.Lcfi48:
	.cfi_offset %r13, -40
.Lcfi49:
	.cfi_offset %r14, -32
.Lcfi50:
	.cfi_offset %r15, -24
.Lcfi51:
	.cfi_offset %rbp, -16
	movq	%rsi, %rbx
	movl	%edi, %ebp
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movq	$0, 24(%rsp)
	movq	$0, 80(%rsp)
	movq	$0, 16(%rsp)
	movq	$0, 8(%rsp)
	leaq	40(%rsp), %rdx
	leaq	32(%rsp), %rcx
	callq	convertArgsToIntArray
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	(%rax), %rdi
	movq	32(%rsp), %rsi
	callq	Reader
	movq	%rax, %r13
	leaq	24(%rsp), %rdx
	leaq	80(%rsp), %rcx
	movl	%ebp, %edi
	movq	%rbx, %rsi
	callq	convertArgsToIntArray
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	8(%rax), %rdi
	callq	parseStringToInt
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	(%rax), %r15
	leaq	16(%rsp), %rsi
	movq	%r13, %rdi
	callq	readAll
	movq	16(%rsp), %rbx
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	copy1DArray_BYTE
	movq	%rax, %r14
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	copy1DArray_BYTE
	leaq	8(%rsp), %r9
	movl	$1, %edx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rcx
	movq	%r15, %r8
	callq	_sobelEdgeDetection_
	movq	%rax, %rbx
	movq	8(%rsp), %rbp
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	callq	copy1DArray_BYTE
	movq	%rax, %r12
	movq	%r12, %rdi
	movq	%rbp, %rsi
	callq	copy1DArray_BYTE
	movl	$1, %r9d
	movq	%r15, %rsi
	movq	%r15, %rdx
	movq	%rax, %rcx
	callq	_print_pbm_
	testq	%r13, %r13
	je	.LBB4_2
# BB#1:                                 # %if.then63
	movq	%r13, %rdi
	callq	fclose
.LBB4_2:                                # %if.end68
	testq	%r14, %r14
	je	.LBB4_4
# BB#3:                                 # %if.then70
	movq	%r14, %rdi
	callq	free
.LBB4_4:                                # %if.end71
	testq	%r12, %r12
	je	.LBB4_6
# BB#5:                                 # %if.then73
	movq	%r12, %rdi
	callq	free
.LBB4_6:                                # %if.end74
	movq	56(%rsp), %rdi          # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB4_8
# BB#7:                                 # %if.then76
	movq	40(%rsp), %rsi
	callq	free2DArray_int64_t
.LBB4_8:                                # %if.end80
	movq	48(%rsp), %rdi          # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB4_10
# BB#9:                                 # %if.then82
	callq	free
.LBB4_10:                               # %if.end83
	movq	72(%rsp), %rdi          # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB4_12
# BB#11:                                # %if.then85
	movq	24(%rsp), %rsi
	callq	free2DArray_int64_t
.LBB4_12:                               # %if.end89
	movq	64(%rsp), %rdi          # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB4_14
# BB#13:                                # %if.then91
	callq	free
.LBB4_14:                               # %if.end92
	testq	%rbx, %rbx
	je	.LBB4_16
# BB#15:                                # %if.then94
	movq	%rbx, %rdi
	callq	free
.LBB4_16:                               # %if.end95
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
