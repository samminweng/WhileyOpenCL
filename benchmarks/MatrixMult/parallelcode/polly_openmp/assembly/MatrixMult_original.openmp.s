	.text
	.file	"polly_openmp/MatrixMult_original.c"
	.globl	_init_                  # -- Begin function _init_
	.p2align	4, 0x90
	.type	_init_,@function
_init_:                                 # @_init_
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
	subq	$24, %rsp
.Lcfi4:
	.cfi_def_cfa_offset 64
.Lcfi5:
	.cfi_offset %rbx, -40
.Lcfi6:
	.cfi_offset %r12, -32
.Lcfi7:
	.cfi_offset %r14, -24
.Lcfi8:
	.cfi_offset %r15, -16
	movq	%r8, %r14
	movq	%rsi, %r15
	movq	%rdi, %rbx
	leaq	-1(%rcx), %r8
	sarq	$5, %r8
	movq	%rcx, (%rsp)
	movq	%rdx, 8(%rsp)
	movq	%rbx, 16(%rsp)
	incq	%r8
	movq	%rsp, %r12
	movl	$_init__polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r12, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%r12, %rdi
	callq	_init__polly_subfn
	callq	GOMP_parallel_end
	movq	%r15, (%r14)
	movq	%rbx, %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Lfunc_end0:
	.size	_init_, .Lfunc_end0-_init_
	.cfi_endproc
                                        # -- End function
	.globl	_mat_mult_              # -- Begin function _mat_mult_
	.p2align	4, 0x90
	.type	_mat_mult_,@function
_mat_mult_:                             # @_mat_mult_
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Lcfi9:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi10:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi11:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi12:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi13:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi14:
	.cfi_def_cfa_offset 56
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
	movq	%r9, -48(%rsp)          # 8-byte Spill
	movq	%r8, -56(%rsp)          # 8-byte Spill
	movq	%rdx, -40(%rsp)         # 8-byte Spill
	movq	%rdi, -64(%rsp)         # 8-byte Spill
	cmpq	$0, 64(%rsp)
	jle	.LBB1_13
# BB#1:                                 # %entry
	cmpq	$0, 56(%rsp)
	jle	.LBB1_13
# BB#2:                                 # %polly.loop_header.us.preheader
	movq	56(%rsp), %rax
	leaq	-1(%rax), %rcx
	movq	%rcx, -8(%rsp)          # 8-byte Spill
	movl	%eax, %edx
	andl	$3, %edx
	movq	%rax, %r13
	subq	%rdx, %r13
	leaq	(,%rax,8), %rcx
	leaq	(%rcx,%rcx,2), %r15
	movq	%rax, %r12
	shlq	$5, %r12
	movq	%rax, %rbx
	shlq	$4, %rbx
	movq	%rdx, -16(%rsp)         # 8-byte Spill
	negq	%rdx
	movq	%rdx, -24(%rsp)         # 8-byte Spill
	xorl	%edx, %edx
	movq	-64(%rsp), %rax         # 8-byte Reload
	leaq	24(%rax), %r11
	.p2align	4, 0x90
.LBB1_3:                                # %polly.loop_header.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_4 Depth 2
                                        #       Child Loop BB1_7 Depth 3
                                        #       Child Loop BB1_10 Depth 3
	movq	%rdx, -32(%rsp)         # 8-byte Spill
	movq	%rdx, %rax
	imulq	56(%rsp), %rax
	movq	-56(%rsp), %rdx         # 8-byte Reload
	leaq	(%rdx,%rax,8), %r9
	movq	-40(%rsp), %r14         # 8-byte Reload
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB1_4:                                # %polly.loop_preheader83.us
                                        #   Parent Loop BB1_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_7 Depth 3
                                        #       Child Loop BB1_10 Depth 3
	cmpq	$3, -8(%rsp)            # 8-byte Folded Reload
	jae	.LBB1_6
# BB#5:                                 #   in Loop: Header=BB1_4 Depth=2
	xorl	%edx, %edx
	xorl	%ebp, %ebp
	cmpq	$0, -16(%rsp)           # 8-byte Folded Reload
	jne	.LBB1_9
	jmp	.LBB1_11
	.p2align	4, 0x90
.LBB1_6:                                # %polly.loop_header82.us.preheader
                                        #   in Loop: Header=BB1_4 Depth=2
	movq	%r14, %r10
	xorl	%edx, %edx
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB1_7:                                # %polly.loop_header82.us
                                        #   Parent Loop BB1_3 Depth=1
                                        #     Parent Loop BB1_4 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	(%r10), %rax
	imulq	-24(%r11,%rbp,8), %rax
	addq	%rdx, %rax
	movq	(%r10,%rcx), %rdx
	imulq	-16(%r11,%rbp,8), %rdx
	addq	%rax, %rdx
	movq	(%r10,%rbx), %rax
	imulq	-8(%r11,%rbp,8), %rax
	addq	%rdx, %rax
	movq	(%r10,%r15), %rdx
	imulq	(%r11,%rbp,8), %rdx
	addq	%rax, %rdx
	addq	$4, %rbp
	addq	%r12, %r10
	cmpq	%rbp, %r13
	jne	.LBB1_7
# BB#8:                                 # %polly.stmt.blklab8.us.unr-lcssa
                                        #   in Loop: Header=BB1_4 Depth=2
	cmpq	$0, -16(%rsp)           # 8-byte Folded Reload
	je	.LBB1_11
.LBB1_9:                                # %polly.loop_header82.us.epil.preheader
                                        #   in Loop: Header=BB1_4 Depth=2
	movq	56(%rsp), %rax
	imulq	%rbp, %rax
	leaq	(%r14,%rax,8), %rdi
	movq	-64(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rbp,8), %rbp
	movq	-24(%rsp), %rax         # 8-byte Reload
	.p2align	4, 0x90
.LBB1_10:                               # %polly.loop_header82.us.epil
                                        #   Parent Loop BB1_3 Depth=1
                                        #     Parent Loop BB1_4 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	(%rdi), %rsi
	imulq	(%rbp), %rsi
	addq	%rsi, %rdx
	addq	%rcx, %rdi
	addq	$8, %rbp
	incq	%rax
	jne	.LBB1_10
.LBB1_11:                               # %polly.stmt.blklab8.us
                                        #   in Loop: Header=BB1_4 Depth=2
	movq	%rdx, (%r9,%r8,8)
	incq	%r8
	addq	$8, %r14
	cmpq	56(%rsp), %r8
	jne	.LBB1_4
# BB#12:                                # %polly.loop_exit76.loopexit.us
                                        #   in Loop: Header=BB1_3 Depth=1
	movq	-32(%rsp), %rdx         # 8-byte Reload
	incq	%rdx
	addq	%rcx, %r11
	addq	%rcx, -64(%rsp)         # 8-byte Folded Spill
	cmpq	64(%rsp), %rdx
	jne	.LBB1_3
.LBB1_13:                               # %polly.exiting
	movq	-48(%rsp), %rax         # 8-byte Reload
	movq	72(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	-56(%rsp), %rax         # 8-byte Reload
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end1:
	.size	_mat_mult_, .Lfunc_end1-_mat_mult_
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4               # -- Begin function main
.LCPI2_0:
	.quad	115                     # 0x73
	.quad	105                     # 0x69
.LCPI2_1:
	.quad	122                     # 0x7a
	.quad	101                     # 0x65
.LCPI2_2:
	.quad	32                      # 0x20
	.quad	61                      # 0x3d
.LCPI2_3:
	.quad	77                      # 0x4d
	.quad	97                      # 0x61
.LCPI2_4:
	.quad	116                     # 0x74
	.quad	114                     # 0x72
.LCPI2_5:
	.quad	105                     # 0x69
	.quad	120                     # 0x78
.LCPI2_6:
	.quad	32                      # 0x20
	.quad	67                      # 0x43
.LCPI2_7:
	.quad	91                      # 0x5b
	.quad	115                     # 0x73
.LCPI2_8:
	.quad	105                     # 0x69
	.quad	122                     # 0x7a
.LCPI2_9:
	.quad	101                     # 0x65
	.quad	45                      # 0x2d
.LCPI2_10:
	.quad	49                      # 0x31
	.quad	93                      # 0x5d
.LCPI2_11:
	.quad	80                      # 0x50
	.quad	97                      # 0x61
.LCPI2_12:
	.quad	115                     # 0x73
	.quad	115                     # 0x73
.LCPI2_13:
	.quad	32                      # 0x20
	.quad	77                      # 0x4d
.LCPI2_14:
	.quad	97                      # 0x61
	.quad	116                     # 0x74
.LCPI2_15:
	.quad	114                     # 0x72
	.quad	105                     # 0x69
.LCPI2_16:
	.quad	120                     # 0x78
	.quad	77                      # 0x4d
.LCPI2_17:
	.quad	117                     # 0x75
	.quad	108                     # 0x6c
.LCPI2_18:
	.quad	116                     # 0x74
	.quad	32                      # 0x20
.LCPI2_19:
	.quad	116                     # 0x74
	.quad	101                     # 0x65
.LCPI2_20:
	.quad	115                     # 0x73
	.quad	116                     # 0x74
.LCPI2_21:
	.quad	32                      # 0x20
	.quad	99                      # 0x63
.LCPI2_22:
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
	subq	$120, %rsp
.Lcfi27:
	.cfi_def_cfa_offset 176
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
	movq	$0, 112(%rsp)
	movq	$0, 104(%rsp)
	leaq	112(%rsp), %rdx
	leaq	104(%rsp), %rcx
	callq	convertArgsToIntArray
	movq	(%rax), %rdi
	callq	parseStringToInt
	testq	%rax, %rax
	je	.LBB2_14
# BB#1:                                 # %if.end
	movq	(%rax), %r15
	xorl	%edi, %edi
	movl	$7, %esi
	callq	create1DArray_int64_t
	movaps	.LCPI2_0(%rip), %xmm0   # xmm0 = [115,105]
	movups	%xmm0, (%rax)
	movaps	.LCPI2_1(%rip), %xmm0   # xmm0 = [122,101]
	movups	%xmm0, 16(%rax)
	movaps	.LCPI2_2(%rip), %xmm0   # xmm0 = [32,61]
	movups	%xmm0, 32(%rax)
	movq	$32, 48(%rax)
	movl	$7, %esi
	movq	%rax, %rdi
	callq	printf_s
	movl	$.L.str, %edi
	xorl	%eax, %eax
	movq	%r15, %rsi
	callq	printf
	movq	%r15, %rbp
	imulq	%rbp, %rbp
	xorl	%edi, %edi
	movq	%rbp, %rsi
	callq	create1DArray_int64_t
	leaq	-1(%r15), %rbx
	movq	%rbx, 88(%rsp)          # 8-byte Spill
	sarq	$5, %rbx
	movq	%r15, 24(%rsp)
	movq	%r15, 32(%rsp)
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movq	%rax, 40(%rsp)
	incq	%rbx
	leaq	24(%rsp), %r13
	movl	$_init__polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r13, %rsi
	movq	%rbx, %r8
	callq	GOMP_parallel_loop_runtime_start
	movq	%r13, %rdi
	callq	_init__polly_subfn
	callq	GOMP_parallel_end
	xorl	%edi, %edi
	movq	%rbp, %rsi
	callq	create1DArray_int64_t
	movq	%r15, 24(%rsp)
	movq	%r15, 32(%rsp)
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	%rax, 40(%rsp)
	leaq	24(%rsp), %r14
	movl	$_init__polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r14, %rsi
	movq	%rbx, %r8
	callq	GOMP_parallel_loop_runtime_start
	movq	%r14, %rdi
	callq	_init__polly_subfn
	callq	GOMP_parallel_end
	xorl	%edi, %edi
	movq	%rbp, %rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	%rbp, %rsi
	callq	create1DArray_int64_t
	movq	%rax, 16(%rsp)          # 8-byte Spill
	testq	%r15, %r15
	jle	.LBB2_13
# BB#2:                                 # %polly.loop_header.us.i.preheader
	movl	%r15d, %eax
	andl	$3, %eax
	movq	%r15, %r14
	subq	%rax, %r14
	leaq	(,%r15,8), %rdx
	leaq	(%rdx,%rdx,2), %r10
	movq	%r15, %r12
	shlq	$5, %r12
	movq	8(%rsp), %rbp           # 8-byte Reload
	addq	$24, %rbp
	movq	%r15, %rbx
	shlq	$4, %rbx
	movq	%rax, 80(%rsp)          # 8-byte Spill
	negq	%rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%r15, %r11
	.p2align	4, 0x90
.LBB2_3:                                # %polly.loop_header.us.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_4 Depth 2
                                        #       Child Loop BB2_7 Depth 3
                                        #       Child Loop BB2_10 Depth 3
	movq	%rax, 64(%rsp)          # 8-byte Spill
	imulq	%r15, %rax
	movq	16(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rax,8), %rax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movq	56(%rsp), %r8           # 8-byte Reload
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB2_4:                                # %polly.loop_preheader83.us.i
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_7 Depth 3
                                        #       Child Loop BB2_10 Depth 3
	cmpq	$3, 88(%rsp)            # 8-byte Folded Reload
	jae	.LBB2_6
# BB#5:                                 #   in Loop: Header=BB2_4 Depth=2
	xorl	%r9d, %r9d
	xorl	%r15d, %r15d
	cmpq	$0, 80(%rsp)            # 8-byte Folded Reload
	jne	.LBB2_9
	jmp	.LBB2_11
	.p2align	4, 0x90
.LBB2_6:                                # %polly.loop_header82.us.i.preheader
                                        #   in Loop: Header=BB2_4 Depth=2
	movq	%r8, %rax
	xorl	%r9d, %r9d
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB2_7:                                # %polly.loop_header82.us.i
                                        #   Parent Loop BB2_3 Depth=1
                                        #     Parent Loop BB2_4 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	(%rax), %rcx
	imulq	-24(%rbp,%r15,8), %rcx
	addq	%r9, %rcx
	movq	(%rax,%rdx), %rsi
	imulq	-16(%rbp,%r15,8), %rsi
	addq	%rcx, %rsi
	movq	(%rax,%rbx), %rcx
	imulq	-8(%rbp,%r15,8), %rcx
	addq	%rsi, %rcx
	movq	(%rax,%r10), %r9
	imulq	(%rbp,%r15,8), %r9
	addq	%rcx, %r9
	addq	$4, %r15
	addq	%r12, %rax
	cmpq	%r15, %r14
	jne	.LBB2_7
# BB#8:                                 # %polly.stmt.blklab8.us.i.unr-lcssa
                                        #   in Loop: Header=BB2_4 Depth=2
	cmpq	$0, 80(%rsp)            # 8-byte Folded Reload
	je	.LBB2_11
.LBB2_9:                                # %polly.loop_header82.us.i.epil.preheader
                                        #   in Loop: Header=BB2_4 Depth=2
	movq	%r11, %rax
	imulq	%r15, %rax
	leaq	(%r8,%rax,8), %rax
	movq	8(%rsp), %rcx           # 8-byte Reload
	leaq	(%rcx,%r15,8), %rcx
	movq	72(%rsp), %rsi          # 8-byte Reload
	.p2align	4, 0x90
.LBB2_10:                               # %polly.loop_header82.us.i.epil
                                        #   Parent Loop BB2_3 Depth=1
                                        #     Parent Loop BB2_4 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	(%rax), %rdi
	imulq	(%rcx), %rdi
	addq	%rdi, %r9
	addq	%rdx, %rax
	addq	$8, %rcx
	incq	%rsi
	jne	.LBB2_10
.LBB2_11:                               # %polly.stmt.blklab8.us.i
                                        #   in Loop: Header=BB2_4 Depth=2
	movq	96(%rsp), %rax          # 8-byte Reload
	movq	%r9, (%rax,%r13,8)
	incq	%r13
	addq	$8, %r8
	movq	%r11, %r15
	cmpq	%r15, %r13
	jne	.LBB2_4
# BB#12:                                # %polly.loop_exit76.loopexit.us.i
                                        #   in Loop: Header=BB2_3 Depth=1
	movq	64(%rsp), %rax          # 8-byte Reload
	incq	%rax
	addq	%rdx, %rbp
	addq	%rdx, 8(%rsp)           # 8-byte Folded Spill
	cmpq	%r15, %rax
	jne	.LBB2_3
.LBB2_13:                               # %_mat_mult_.exit
	xorl	%edi, %edi
	movl	$27, %esi
	callq	create1DArray_int64_t
	movaps	.LCPI2_3(%rip), %xmm0   # xmm0 = [77,97]
	movups	%xmm0, (%rax)
	movaps	.LCPI2_4(%rip), %xmm0   # xmm0 = [116,114]
	movups	%xmm0, 16(%rax)
	movaps	.LCPI2_5(%rip), %xmm0   # xmm0 = [105,120]
	movups	%xmm0, 32(%rax)
	movaps	.LCPI2_6(%rip), %xmm0   # xmm0 = [32,67]
	movups	%xmm0, 48(%rax)
	movaps	.LCPI2_7(%rip), %xmm0   # xmm0 = [91,115]
	movups	%xmm0, 64(%rax)
	movaps	.LCPI2_8(%rip), %xmm1   # xmm1 = [105,122]
	movups	%xmm1, 80(%rax)
	movaps	.LCPI2_9(%rip), %xmm2   # xmm2 = [101,45]
	movups	%xmm2, 96(%rax)
	movaps	.LCPI2_10(%rip), %xmm3  # xmm3 = [49,93]
	movups	%xmm3, 112(%rax)
	movups	%xmm0, 128(%rax)
	movups	%xmm1, 144(%rax)
	movups	%xmm2, 160(%rax)
	movups	%xmm3, 176(%rax)
	movaps	.LCPI2_2(%rip), %xmm0   # xmm0 = [32,61]
	movups	%xmm0, 192(%rax)
	movq	$32, 208(%rax)
	movl	$27, %esi
	movq	%rax, %rdi
	callq	printf_s
	movq	48(%rsp), %rax          # 8-byte Reload
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	-8(%rcx,%rax,8), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%edi, %edi
	movl	$25, %esi
	callq	create1DArray_int64_t
	movaps	.LCPI2_11(%rip), %xmm0  # xmm0 = [80,97]
	movups	%xmm0, (%rax)
	movaps	.LCPI2_12(%rip), %xmm0  # xmm0 = [115,115]
	movups	%xmm0, 16(%rax)
	movaps	.LCPI2_13(%rip), %xmm0  # xmm0 = [32,77]
	movups	%xmm0, 32(%rax)
	movaps	.LCPI2_14(%rip), %xmm0  # xmm0 = [97,116]
	movups	%xmm0, 48(%rax)
	movaps	.LCPI2_15(%rip), %xmm0  # xmm0 = [114,105]
	movups	%xmm0, 64(%rax)
	movaps	.LCPI2_16(%rip), %xmm0  # xmm0 = [120,77]
	movups	%xmm0, 80(%rax)
	movaps	.LCPI2_17(%rip), %xmm0  # xmm0 = [117,108]
	movups	%xmm0, 96(%rax)
	movaps	.LCPI2_18(%rip), %xmm0  # xmm0 = [116,32]
	movups	%xmm0, 112(%rax)
	movaps	.LCPI2_19(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 128(%rax)
	movaps	.LCPI2_20(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 144(%rax)
	movaps	.LCPI2_21(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 160(%rax)
	movaps	.LCPI2_22(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 176(%rax)
	movq	$101, 192(%rax)
	movl	$25, %esi
	movq	%rax, %rdi
	callq	println_s
.LBB2_14:                               # %blklab10
	xorl	%edi, %edi
	callq	exit
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function _init__polly_subfn
	.type	_init__polly_subfn,@function
_init__polly_subfn:                     # @_init__polly_subfn
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Lcfi34:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi35:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi36:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Lcfi37:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Lcfi38:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Lcfi39:
	.cfi_def_cfa_offset 56
	subq	$200, %rsp
.Lcfi40:
	.cfi_def_cfa_offset 256
.Lcfi41:
	.cfi_offset %rbx, -56
.Lcfi42:
	.cfi_offset %r12, -48
.Lcfi43:
	.cfi_offset %r13, -40
.Lcfi44:
	.cfi_offset %r14, -32
.Lcfi45:
	.cfi_offset %r15, -24
.Lcfi46:
	.cfi_offset %rbp, -16
	movq	(%rdi), %rax
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	8(%rdi), %rbx
	movq	16(%rdi), %rax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	leaq	96(%rsp), %rdi
	leaq	88(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	movq	%rbx, %r10
	testb	%al, %al
	je	.LBB3_2
# BB#1:                                 # %polly.par.loadIVBounds.preheader
	leaq	-1(%r10), %rax
	sarq	$5, %rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	16(%rsp), %rax          # 8-byte Reload
	leaq	112(%rax), %rcx
	movq	%rcx, 104(%rsp)         # 8-byte Spill
	movq	%r10, %rcx
	shlq	$5, %rcx
	movq	%rcx, 24(%rsp)          # 8-byte Spill
	movq	%r10, %rcx
	shlq	$8, %rcx
	movq	%rcx, 128(%rsp)         # 8-byte Spill
	leaq	(,%r10,8), %r13
	movq	%r10, %rcx
	negq	%rcx
	movq	%rcx, 112(%rsp)         # 8-byte Spill
	leaq	16(%rax), %rax
	movq	%rax, 168(%rsp)         # 8-byte Spill
	movq	%r10, 80(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB3_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_5 Depth 2
                                        #       Child Loop BB3_8 Depth 3
                                        #         Child Loop BB3_10 Depth 4
                                        #           Child Loop BB3_16 Depth 5
                                        #           Child Loop BB3_19 Depth 5
                                        #           Child Loop BB3_22 Depth 5
	movq	88(%rsp), %rax
	decq	%rax
	movq	%rax, 136(%rsp)         # 8-byte Spill
	movq	96(%rsp), %rax
	movq	24(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 8(%rsp)           # 8-byte Spill
	imulq	%rax, %rcx
	movq	104(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%rcx,8), %rax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	%rcx, (%rsp)            # 8-byte Spill
	leaq	(%rax,%rcx,8), %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB3_5:                                # %polly.loop_header
                                        #   Parent Loop BB3_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_8 Depth 3
                                        #         Child Loop BB3_10 Depth 4
                                        #           Child Loop BB3_16 Depth 5
                                        #           Child Loop BB3_19 Depth 5
                                        #           Child Loop BB3_22 Depth 5
	cmpq	$0, 48(%rsp)            # 8-byte Folded Reload
	js	.LBB3_25
# BB#6:                                 # %polly.loop_header2.preheader
                                        #   in Loop: Header=BB3_5 Depth=2
	movq	8(%rsp), %rsi           # 8-byte Reload
	shlq	$5, %rsi
	movq	120(%rsp), %r12         # 8-byte Reload
	subq	%rsi, %r12
	decq	%r12
	cmpq	$32, %r12
	movl	$31, %eax
	cmovgeq	%rax, %r12
	testq	%r12, %r12
	js	.LBB3_25
# BB#7:                                 # %polly.loop_header2.us.preheader
                                        #   in Loop: Header=BB3_5 Depth=2
	movq	32(%rsp), %rax          # 8-byte Reload
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	(%rsp), %rax            # 8-byte Reload
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	112(%rsp), %rcx         # 8-byte Reload
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	%rax, 56(%rsp)          # 8-byte Spill
	xorl	%r15d, %r15d
	movq	%rsi, 184(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB3_8:                                # %polly.loop_header2.us
                                        #   Parent Loop BB3_4 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB3_10 Depth 4
                                        #           Child Loop BB3_16 Depth 5
                                        #           Child Loop BB3_19 Depth 5
                                        #           Child Loop BB3_22 Depth 5
	cmpq	$-33, %rcx
	movq	$-32, %rax
	movq	%rcx, 152(%rsp)         # 8-byte Spill
	cmovgq	%rcx, %rax
	movq	%r15, 144(%rsp)         # 8-byte Spill
	shlq	$5, %r15
	movq	%r10, %rbx
	subq	%r15, %rbx
	subq	%r10, %r15
	cmpq	$-33, %r15
	movq	$-32, %rcx
	cmovleq	%rcx, %r15
	decq	%rbx
	cmpq	$32, %rbx
	movl	$31, %ecx
	cmovgeq	%rcx, %rbx
	testq	%rbx, %rbx
	js	.LBB3_24
# BB#9:                                 # %polly.loop_header9.us.us.preheader
                                        #   in Loop: Header=BB3_8 Depth=3
	movq	$-4, %rcx
	subq	%rax, %rcx
	shrq	$2, %rcx
	leal	1(%rcx), %eax
	andl	$3, %eax
	movq	%rax, %rdx
	negq	%rdx
	movq	%rdx, 176(%rsp)         # 8-byte Spill
	decq	%rax
	subq	%rcx, %rax
	movq	%rax, 160(%rsp)         # 8-byte Spill
	movq	$-4, %rax
	subq	%r15, %rax
	movq	%rax, 192(%rsp)         # 8-byte Spill
	shrq	$2, %rax
	incq	%rax
	negq	%r15
	movq	%r15, %rbp
	andq	$-4, %rbp
	movq	72(%rsp), %rdx          # 8-byte Reload
	movq	64(%rsp), %r14          # 8-byte Reload
	movq	56(%rsp), %r8           # 8-byte Reload
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB3_10:                               # %polly.loop_header9.us.us
                                        #   Parent Loop BB3_4 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        #       Parent Loop BB3_8 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB3_16 Depth 5
                                        #           Child Loop BB3_19 Depth 5
                                        #           Child Loop BB3_22 Depth 5
	leaq	(%r9,%rsi), %r11
	cmpq	$4, %r15
	jb	.LBB3_11
# BB#12:                                # %polly.loop_header9.us.us
                                        #   in Loop: Header=BB3_10 Depth=4
	testq	%rbp, %rbp
	movl	$0, %edi
	je	.LBB3_21
# BB#13:                                # %vector.ph
                                        #   in Loop: Header=BB3_10 Depth=4
	cmpq	$12, 192(%rsp)          # 8-byte Folded Reload
	movq	%r11, %xmm0
	pshufd	$68, %xmm0, %xmm0       # xmm0 = xmm0[0,1,0,1]
	jae	.LBB3_15
# BB#14:                                #   in Loop: Header=BB3_10 Depth=4
	xorl	%r10d, %r10d
	testb	$3, %al
	jne	.LBB3_18
	jmp	.LBB3_20
	.p2align	4, 0x90
.LBB3_11:                               #   in Loop: Header=BB3_10 Depth=4
	xorl	%edi, %edi
	jmp	.LBB3_21
	.p2align	4, 0x90
.LBB3_15:                               # %vector.body.preheader
                                        #   in Loop: Header=BB3_10 Depth=4
	movq	160(%rsp), %rdi         # 8-byte Reload
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB3_16:                               # %vector.body
                                        #   Parent Loop BB3_4 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        #       Parent Loop BB3_8 Depth=3
                                        #         Parent Loop BB3_10 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movdqu	%xmm0, -112(%r8,%r10,8)
	movdqu	%xmm0, -96(%r8,%r10,8)
	movdqu	%xmm0, -80(%r8,%r10,8)
	movdqu	%xmm0, -64(%r8,%r10,8)
	movdqu	%xmm0, -48(%r8,%r10,8)
	movdqu	%xmm0, -32(%r8,%r10,8)
	movdqu	%xmm0, -16(%r8,%r10,8)
	movdqu	%xmm0, (%r8,%r10,8)
	addq	$16, %r10
	addq	$4, %rdi
	jne	.LBB3_16
# BB#17:                                # %middle.block.unr-lcssa
                                        #   in Loop: Header=BB3_10 Depth=4
	testb	$3, %al
	je	.LBB3_20
.LBB3_18:                               # %vector.body.epil.preheader
                                        #   in Loop: Header=BB3_10 Depth=4
	addq	%r14, %r10
	movq	168(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%r10,8), %rdi
	movq	176(%rsp), %rcx         # 8-byte Reload
	.p2align	4, 0x90
.LBB3_19:                               # %vector.body.epil
                                        #   Parent Loop BB3_4 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        #       Parent Loop BB3_8 Depth=3
                                        #         Parent Loop BB3_10 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movdqu	%xmm0, -16(%rdi)
	movdqu	%xmm0, (%rdi)
	addq	$32, %rdi
	incq	%rcx
	jne	.LBB3_19
.LBB3_20:                               # %middle.block
                                        #   in Loop: Header=BB3_10 Depth=4
	cmpq	%r15, %rbp
	movq	%rbp, %rdi
	movq	80(%rsp), %r10          # 8-byte Reload
	movq	184(%rsp), %rsi         # 8-byte Reload
	je	.LBB3_23
.LBB3_21:                               # %polly.loop_header17.us.us.preheader
                                        #   in Loop: Header=BB3_10 Depth=4
	decq	%rdi
	.p2align	4, 0x90
.LBB3_22:                               # %polly.loop_header17.us.us
                                        #   Parent Loop BB3_4 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        #       Parent Loop BB3_8 Depth=3
                                        #         Parent Loop BB3_10 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movq	%r11, 8(%rdx,%rdi,8)
	incq	%rdi
	cmpq	%rbx, %rdi
	jl	.LBB3_22
.LBB3_23:                               # %polly.loop_exit19.loopexit.us.us
                                        #   in Loop: Header=BB3_10 Depth=4
	addq	%r13, %r8
	addq	%r10, %r14
	addq	%r13, %rdx
	cmpq	%r12, %r9
	leaq	1(%r9), %r9
	jl	.LBB3_10
.LBB3_24:                               # %polly.loop_exit11.loopexit.us
                                        #   in Loop: Header=BB3_8 Depth=3
	addq	$256, 56(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	movq	152(%rsp), %rcx         # 8-byte Reload
	addq	$32, %rcx
	addq	$32, 64(%rsp)           # 8-byte Folded Spill
	addq	$256, 72(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	movq	144(%rsp), %r15         # 8-byte Reload
	cmpq	48(%rsp), %r15          # 8-byte Folded Reload
	leaq	1(%r15), %r15
	jne	.LBB3_8
.LBB3_25:                               # %polly.loop_exit4
                                        #   in Loop: Header=BB3_5 Depth=2
	movq	128(%rsp), %rax         # 8-byte Reload
	addq	%rax, 40(%rsp)          # 8-byte Folded Spill
	movq	(%rsp), %rcx            # 8-byte Reload
	addq	24(%rsp), %rcx          # 8-byte Folded Reload
	movq	%rcx, (%rsp)            # 8-byte Spill
	addq	%rax, 32(%rsp)          # 8-byte Folded Spill
	movq	8(%rsp), %rax           # 8-byte Reload
	cmpq	136(%rsp), %rax         # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	jl	.LBB3_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB3_4 Depth=1
	leaq	96(%rsp), %rdi
	leaq	88(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	movq	80(%rsp), %r10          # 8-byte Reload
	testb	%al, %al
	jne	.LBB3_4
.LBB3_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$200, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end3:
	.size	_init__polly_subfn, .Lfunc_end3-_init__polly_subfn
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%ld\n"
	.size	.L.str, 5


	.ident	"clang version 5.0.0 (http://llvm.org/git/clang.git bd8aa3a7c974c9404a21faf306aad785cf0a7549) (http://llvm.org/git/llvm.git b618c820b01fb49ce529b7cc08c354958d3e3a13)"
	.section	".note.GNU-stack","",@progbits
