	.text
	.file	"llvm/BubbleSort.original.openmp.naive_dealloc.disabledpattern.out.ll"
	.globl	_bubbleSort_
	.p2align	4, 0x90
	.type	_bubbleSort_,@function
_bubbleSort_:                           # @_bubbleSort_
	.cfi_startproc
# BB#0:                                 # %entry
	testq	%rsi, %rsi
	jle	.LBB0_9
# BB#1:
	movq	%rsi, %r8
	.p2align	4, 0x90
.LBB0_3:                                # %while.cond18.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
	cmpq	$2, %r8
	jl	.LBB0_9
# BB#4:                                 # %polly.loop_header.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	movq	%r8, %r9
	decq	%r9
	xorl	%r8d, %r8d
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_5:                                # %polly.loop_header
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rdi,%rax,8), %r10
	movq	8(%rdi,%rax,8), %rdx
	cmpq	%rdx, %r10
	jle	.LBB0_6
# BB#7:                                 # %polly.stmt.if.end26
                                        #   in Loop: Header=BB0_5 Depth=2
	movq	%rdx, (%rdi,%rax,8)
	movq	%r10, 8(%rdi,%rax,8)
	incq	%rax
	movq	%rax, %r8
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_6:                                # %polly.loop_header.polly.stmt.blklab4_crit_edge
                                        #   in Loop: Header=BB0_5 Depth=2
	incq	%rax
.LBB0_8:                                # %polly.stmt.blklab4
                                        #   in Loop: Header=BB0_5 Depth=2
	cmpq	%r9, %rax
	jne	.LBB0_5
# BB#2:                                 # %while.cond.loopexit
                                        #   in Loop: Header=BB0_3 Depth=1
	testq	%r8, %r8
	jg	.LBB0_3
.LBB0_9:                                # %if.end34
	movq	%rsi, (%rcx)
	movq	%rdi, %rax
	retq
.Lfunc_end0:
	.size	_bubbleSort_, .Lfunc_end0-_bubbleSort_
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI1_0:
	.quad	9223372036854775807     # 0x7fffffffffffffff
	.quad	9223372036854775807     # 0x7fffffffffffffff
.LCPI1_1:
	.quad	9223372036854775805     # 0x7ffffffffffffffd
	.quad	9223372036854775805     # 0x7ffffffffffffffd
.LCPI1_2:
	.quad	9223372036854775803     # 0x7ffffffffffffffb
	.quad	9223372036854775803     # 0x7ffffffffffffffb
.LCPI1_3:
	.quad	9223372036854775801     # 0x7ffffffffffffff9
	.quad	9223372036854775801     # 0x7ffffffffffffff9
.LCPI1_4:
	.quad	9223372036854775799     # 0x7ffffffffffffff7
	.quad	9223372036854775799     # 0x7ffffffffffffff7
.LCPI1_5:
	.quad	9223372036854775797     # 0x7ffffffffffffff5
	.quad	9223372036854775797     # 0x7ffffffffffffff5
.LCPI1_6:
	.quad	9223372036854775795     # 0x7ffffffffffffff3
	.quad	9223372036854775795     # 0x7ffffffffffffff3
.LCPI1_7:
	.quad	9223372036854775793     # 0x7ffffffffffffff1
	.quad	9223372036854775793     # 0x7ffffffffffffff1
.LCPI1_8:
	.quad	16                      # 0x10
	.quad	16                      # 0x10
.LCPI1_9:
	.quad	80                      # 0x50
	.quad	97                      # 0x61
.LCPI1_10:
	.quad	115                     # 0x73
	.quad	115                     # 0x73
.LCPI1_11:
	.quad	32                      # 0x20
	.quad	66                      # 0x42
.LCPI1_12:
	.quad	117                     # 0x75
	.quad	98                      # 0x62
.LCPI1_13:
	.quad	98                      # 0x62
	.quad	108                     # 0x6c
.LCPI1_14:
	.quad	101                     # 0x65
	.quad	83                      # 0x53
.LCPI1_15:
	.quad	111                     # 0x6f
	.quad	114                     # 0x72
.LCPI1_16:
	.quad	116                     # 0x74
	.quad	32                      # 0x20
.LCPI1_17:
	.quad	116                     # 0x74
	.quad	101                     # 0x65
.LCPI1_18:
	.quad	115                     # 0x73
	.quad	116                     # 0x74
.LCPI1_19:
	.quad	32                      # 0x20
	.quad	99                      # 0x63
.LCPI1_20:
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
	subq	$72, %rsp
.Lcfi6:
	.cfi_def_cfa_offset 128
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
	movq	$0, (%rsp)
	movq	$0, 64(%rsp)
	movq	%rsp, %rdx
	leaq	64(%rsp), %rcx
	callq	convertArgsToIntArray
	movq	%rax, %r15
	movq	(%r15), %rdi
	callq	parseStringToInt
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	(%rax), %r13
	xorl	%edi, %edi
	movq	%r13, %rsi
	callq	create1DArray_int64_t
	movq	%rax, %r12
	movq	%r12, %rdi
	movq	%r13, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, %rbx
	testq	%r13, %r13
	js	.LBB1_1
# BB#17:                                # %polly.split_new_and_old203
	movabsq	$9223372036854775807, %rax # imm = 0x7FFFFFFFFFFFFFFF
	cmpq	%rax, %r13
	jne	.LBB1_29
# BB#18:                                # %vector.body.preheader.new
	incq	%rax
	movl	$1, %ecx
	movd	%rcx, %xmm0
	pslldq	$8, %xmm0               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7]
	movdqa	.LCPI1_0(%rip), %xmm8   # xmm8 = [9223372036854775807,9223372036854775807]
	movdqa	.LCPI1_1(%rip), %xmm9   # xmm9 = [9223372036854775805,9223372036854775805]
	movdqa	.LCPI1_2(%rip), %xmm10  # xmm10 = [9223372036854775803,9223372036854775803]
	movdqa	.LCPI1_3(%rip), %xmm11  # xmm11 = [9223372036854775801,9223372036854775801]
	movdqa	.LCPI1_4(%rip), %xmm5   # xmm5 = [9223372036854775799,9223372036854775799]
	movdqa	.LCPI1_5(%rip), %xmm6   # xmm6 = [9223372036854775797,9223372036854775797]
	movdqa	.LCPI1_6(%rip), %xmm7   # xmm7 = [9223372036854775795,9223372036854775795]
	movdqa	.LCPI1_7(%rip), %xmm1   # xmm1 = [9223372036854775793,9223372036854775793]
	movdqa	.LCPI1_8(%rip), %xmm2   # xmm2 = [16,16]
	.p2align	4, 0x90
.LBB1_19:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movdqa	%xmm8, %xmm3
	psubq	%xmm0, %xmm3
	movdqa	%xmm9, %xmm4
	psubq	%xmm0, %xmm4
	movdqu	%xmm3, (%rbx,%rax,8)
	movdqu	%xmm4, 16(%rbx,%rax,8)
	movdqa	%xmm10, %xmm3
	psubq	%xmm0, %xmm3
	movdqa	%xmm11, %xmm4
	psubq	%xmm0, %xmm4
	movdqu	%xmm3, 32(%rbx,%rax,8)
	movdqu	%xmm4, 48(%rbx,%rax,8)
	movdqa	%xmm5, %xmm3
	psubq	%xmm0, %xmm3
	movdqa	%xmm6, %xmm4
	psubq	%xmm0, %xmm4
	movdqu	%xmm3, 64(%rbx,%rax,8)
	movdqu	%xmm4, 80(%rbx,%rax,8)
	movdqa	%xmm7, %xmm3
	psubq	%xmm0, %xmm3
	movdqa	%xmm1, %xmm4
	psubq	%xmm0, %xmm4
	movdqu	%xmm3, 96(%rbx,%rax,8)
	movdqu	%xmm4, 112(%rbx,%rax,8)
	paddq	%xmm2, %xmm0
	addq	$16, %rax
	jne	.LBB1_19
	jmp	.LBB1_20
.LBB1_29:                               # %polly.parallel.for
	movq	%r12, 40(%rsp)          # 8-byte Spill
	movq	%r15, 48(%rsp)          # 8-byte Spill
	movq	%r13, 24(%rsp)
	movq	%rbx, 32(%rsp)
	leaq	1(%r13), %r8
	leaq	24(%rsp), %rsi
	movl	$main_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	movq	24(%rsp), %r15
	movq	32(%rsp), %r12
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB1_34
# BB#30:
	leaq	16(%rsp), %r14
	leaq	8(%rsp), %rbp
	.p2align	4, 0x90
.LBB1_32:                               # %polly.par.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_33 Depth 2
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	addq	$-2, %rax
	movq	%r15, %rdx
	subq	%rcx, %rdx
	decq	%rcx
	.p2align	4, 0x90
.LBB1_33:                               # %polly.loop_header.i210
                                        #   Parent Loop BB1_32 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rdx, 8(%r12,%rcx,8)
	incq	%rcx
	decq	%rdx
	cmpq	%rax, %rcx
	jle	.LBB1_33
# BB#31:                                # %polly.par.checkNext.loopexit.i
                                        #   in Loop: Header=BB1_32 Depth=1
	movq	%r14, %rdi
	movq	%rbp, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB1_32
.LBB1_34:                               # %main_polly_subfn.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movq	48(%rsp), %r15          # 8-byte Reload
	movq	40(%rsp), %r12          # 8-byte Reload
.LBB1_20:                               # %if.end42
	movq	%rbx, %rdi
	movq	%r13, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, %rbp
	testq	%r13, %r13
	jle	.LBB1_2
# BB#21:
	movq	%r13, %rax
	.p2align	4, 0x90
.LBB1_23:                               # %while.cond18.preheader.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_25 Depth 2
	cmpq	$2, %rax
	jl	.LBB1_2
# BB#24:                                # %polly.loop_header.preheader.i
                                        #   in Loop: Header=BB1_23 Depth=1
	movq	%rax, %rcx
	decq	%rcx
	xorl	%eax, %eax
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB1_25:                               # %polly.loop_header.i
                                        #   Parent Loop BB1_23 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rbp,%rdx,8), %rsi
	movq	8(%rbp,%rdx,8), %rdi
	cmpq	%rdi, %rsi
	jle	.LBB1_26
# BB#27:                                # %polly.stmt.if.end26.i
                                        #   in Loop: Header=BB1_25 Depth=2
	movq	%rdi, (%rbp,%rdx,8)
	movq	%rsi, 8(%rbp,%rdx,8)
	incq	%rdx
	movq	%rdx, %rax
	jmp	.LBB1_28
	.p2align	4, 0x90
.LBB1_26:                               # %polly.loop_header.polly.stmt.blklab4_crit_edge.i
                                        #   in Loop: Header=BB1_25 Depth=2
	incq	%rdx
.LBB1_28:                               # %polly.stmt.blklab4.i
                                        #   in Loop: Header=BB1_25 Depth=2
	cmpq	%rcx, %rdx
	jne	.LBB1_25
# BB#22:                                # %while.cond.loopexit.i
                                        #   in Loop: Header=BB1_23 Depth=1
	testq	%rax, %rax
	jg	.LBB1_23
.LBB1_2:                                # %polly.split_new_and_old
	testq	%rbx, %rbx
	je	.LBB1_4
.LBB1_3:                                # %if.end47
	movq	%rbx, %rdi
	callq	free
.LBB1_4:                                # %blklab5
	movq	%rbp, %rdi
	movq	%r13, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, %r14
	movq	(%r14), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movq	-8(%r14,%r13,8), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%edi, %edi
	movl	$25, %esi
	callq	create1DArray_int64_t
	movq	%rax, %rbx
	movaps	.LCPI1_9(%rip), %xmm0   # xmm0 = [80,97]
	movups	%xmm0, (%rbx)
	movaps	.LCPI1_10(%rip), %xmm0  # xmm0 = [115,115]
	movups	%xmm0, 16(%rbx)
	movaps	.LCPI1_11(%rip), %xmm0  # xmm0 = [32,66]
	movups	%xmm0, 32(%rbx)
	movaps	.LCPI1_12(%rip), %xmm0  # xmm0 = [117,98]
	movups	%xmm0, 48(%rbx)
	movaps	.LCPI1_13(%rip), %xmm0  # xmm0 = [98,108]
	movups	%xmm0, 64(%rbx)
	movaps	.LCPI1_14(%rip), %xmm0  # xmm0 = [101,83]
	movups	%xmm0, 80(%rbx)
	movaps	.LCPI1_15(%rip), %xmm0  # xmm0 = [111,114]
	movups	%xmm0, 96(%rbx)
	movaps	.LCPI1_16(%rip), %xmm0  # xmm0 = [116,32]
	movups	%xmm0, 112(%rbx)
	movaps	.LCPI1_17(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 128(%rbx)
	movaps	.LCPI1_18(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 144(%rbx)
	movaps	.LCPI1_19(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 160(%rbx)
	movaps	.LCPI1_20(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 176(%rbx)
	movq	$101, 192(%rbx)
	movl	$25, %esi
	movq	%rbx, %rdi
	callq	println_s
	testq	%r14, %r14
	je	.LBB1_6
# BB#5:                                 # %if.then102
	movq	%r14, %rdi
	callq	free
.LBB1_6:                                # %if.end103
	movq	56(%rsp), %rdi          # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB1_8
# BB#7:                                 # %if.then105
	callq	free
.LBB1_8:                                # %if.end106
	testq	%r15, %r15
	je	.LBB1_10
# BB#9:                                 # %if.then108
	movq	(%rsp), %rsi
	movq	%r15, %rdi
	callq	free2DArray_int64_t
.LBB1_10:                               # %if.end112
	testq	%r12, %r12
	je	.LBB1_12
# BB#11:                                # %if.then114
	movq	%r12, %rdi
	callq	free
.LBB1_12:                               # %if.end115
	testq	%rbp, %rbp
	je	.LBB1_14
# BB#13:                                # %if.then117
	movq	%rbp, %rdi
	callq	free
.LBB1_14:                               # %if.end118
	testq	%rbx, %rbx
	je	.LBB1_16
# BB#15:                                # %if.then120
	movq	%rbx, %rdi
	callq	free
.LBB1_16:                               # %if.end121
	xorl	%edi, %edi
	callq	exit
.LBB1_1:                                # %if.end42.thread
	movq	%rbx, %rdi
	movq	%r13, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, %rbp
	testq	%rbx, %rbx
	jne	.LBB1_3
	jmp	.LBB1_4
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc

	.p2align	4, 0x90
	.type	main_polly_subfn,@function
main_polly_subfn:                       # @main_polly_subfn
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Lcfi13:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Lcfi14:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Lcfi15:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Lcfi16:
	.cfi_def_cfa_offset 40
	subq	$24, %rsp
.Lcfi17:
	.cfi_def_cfa_offset 64
.Lcfi18:
	.cfi_offset %rbx, -40
.Lcfi19:
	.cfi_offset %r12, -32
.Lcfi20:
	.cfi_offset %r14, -24
.Lcfi21:
	.cfi_offset %r15, -16
	movq	(%rdi), %r12
	movq	8(%rdi), %rbx
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB2_2
# BB#1:
	leaq	16(%rsp), %r14
	leaq	8(%rsp), %r15
	.p2align	4, 0x90
.LBB2_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_5 Depth 2
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	addq	$-2, %rax
	movq	%r12, %rdx
	subq	%rcx, %rdx
	decq	%rcx
	.p2align	4, 0x90
.LBB2_5:                                # %polly.loop_header
                                        #   Parent Loop BB2_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rdx, 8(%rbx,%rcx,8)
	incq	%rcx
	decq	%rdx
	cmpq	%rax, %rcx
	jle	.LBB2_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB2_4 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB2_4
.LBB2_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Lfunc_end2:
	.size	main_polly_subfn, .Lfunc_end2-main_polly_subfn
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%ld\n"
	.size	.L.str, 5


	.ident	"clang version 4.0.0 (http://llvm.org/git/clang.git 9b9db7fa41a1905899dbcbcc6cbdd05d2511da8e) (http://llvm.org/git/llvm.git fd456e365e09d54850dabc6a2f840a0c2eae7c27)"
	.section	".note.GNU-stack","",@progbits
