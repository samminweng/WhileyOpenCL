	.text
	.file	"llvm/BubbleSort.original.openmp.nocopy_dealloc.disabledpattern.out.ll"
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
	movq	$0, 8(%rsp)
	movq	$0, 64(%rsp)
	leaq	8(%rsp), %rdx
	leaq	64(%rsp), %rcx
	callq	convertArgsToIntArray
	movq	%rax, %r14
	movq	(%r14), %rdi
	callq	parseStringToInt
	movq	%rax, %r15
	testq	%r15, %r15
	je	.LBB1_1
# BB#2:                                 # %if.end14
	movq	(%r15), %r12
	xorl	%edi, %edi
	movq	%r12, %rsi
	callq	create1DArray_int64_t
	movq	%rax, %rbx
	testq	%r12, %r12
	js	.LBB1_15
# BB#3:                                 # %polly.split_new_and_old
	movabsq	$9223372036854775807, %rax # imm = 0x7FFFFFFFFFFFFFFF
	cmpq	%rax, %r12
	jne	.LBB1_22
# BB#4:                                 # %vector.body.preheader.new
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
.LBB1_5:                                # %vector.body
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
	jne	.LBB1_5
	jmp	.LBB1_6
.LBB1_22:                               # %polly.parallel.for
	movq	%r15, 48(%rsp)          # 8-byte Spill
	movq	%r14, 56(%rsp)          # 8-byte Spill
	movq	%r12, 32(%rsp)
	movq	%rbx, 40(%rsp)
	leaq	1(%r12), %r8
	leaq	32(%rsp), %rsi
	movl	$main_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	movq	32(%rsp), %r14
	movq	40(%rsp), %r15
	leaq	24(%rsp), %rdi
	leaq	16(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB1_27
# BB#23:
	leaq	24(%rsp), %r13
	leaq	16(%rsp), %rbp
	.p2align	4, 0x90
.LBB1_25:                               # %polly.par.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_26 Depth 2
	movq	16(%rsp), %rax
	movq	24(%rsp), %rcx
	addq	$-2, %rax
	movq	%r14, %rdx
	subq	%rcx, %rdx
	decq	%rcx
	.p2align	4, 0x90
.LBB1_26:                               # %polly.loop_header.i182
                                        #   Parent Loop BB1_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rdx, 8(%r15,%rcx,8)
	incq	%rcx
	decq	%rdx
	cmpq	%rax, %rcx
	jle	.LBB1_26
# BB#24:                                # %polly.par.checkNext.loopexit.i
                                        #   in Loop: Header=BB1_25 Depth=1
	movq	%r13, %rdi
	movq	%rbp, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB1_25
.LBB1_27:                               # %main_polly_subfn.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movq	56(%rsp), %r14          # 8-byte Reload
	movq	48(%rsp), %r15          # 8-byte Reload
.LBB1_6:                                # %if.end34
	testq	%r12, %r12
	jle	.LBB1_15
# BB#7:
	movq	%r12, %rax
	.p2align	4, 0x90
.LBB1_9:                                # %while.cond18.preheader.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_11 Depth 2
	cmpq	$2, %rax
	jl	.LBB1_15
# BB#10:                                # %polly.loop_header.preheader.i
                                        #   in Loop: Header=BB1_9 Depth=1
	movq	%rax, %rcx
	decq	%rcx
	xorl	%eax, %eax
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB1_11:                               # %polly.loop_header.i
                                        #   Parent Loop BB1_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rbx,%rdx,8), %rsi
	movq	8(%rbx,%rdx,8), %rdi
	cmpq	%rdi, %rsi
	jle	.LBB1_12
# BB#13:                                # %polly.stmt.if.end26.i
                                        #   in Loop: Header=BB1_11 Depth=2
	movq	%rdi, (%rbx,%rdx,8)
	movq	%rsi, 8(%rbx,%rdx,8)
	incq	%rdx
	movq	%rdx, %rax
	jmp	.LBB1_14
	.p2align	4, 0x90
.LBB1_12:                               # %polly.loop_header.polly.stmt.blklab4_crit_edge.i
                                        #   in Loop: Header=BB1_11 Depth=2
	incq	%rdx
.LBB1_14:                               # %polly.stmt.blklab4.i
                                        #   in Loop: Header=BB1_11 Depth=2
	cmpq	%rcx, %rdx
	jne	.LBB1_11
# BB#8:                                 # %while.cond.loopexit.i
                                        #   in Loop: Header=BB1_9 Depth=1
	testq	%rax, %rax
	jg	.LBB1_9
.LBB1_15:                               # %if.end86
	movq	(%rbx), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movq	-8(%rbx,%r12,8), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%edi, %edi
	movl	$25, %esi
	callq	create1DArray_int64_t
	movq	%rax, %r12
	movaps	.LCPI1_9(%rip), %xmm0   # xmm0 = [80,97]
	movups	%xmm0, (%r12)
	movaps	.LCPI1_10(%rip), %xmm0  # xmm0 = [115,115]
	movups	%xmm0, 16(%r12)
	movaps	.LCPI1_11(%rip), %xmm0  # xmm0 = [32,66]
	movups	%xmm0, 32(%r12)
	movaps	.LCPI1_12(%rip), %xmm0  # xmm0 = [117,98]
	movups	%xmm0, 48(%r12)
	movaps	.LCPI1_13(%rip), %xmm0  # xmm0 = [98,108]
	movups	%xmm0, 64(%r12)
	movaps	.LCPI1_14(%rip), %xmm0  # xmm0 = [101,83]
	movups	%xmm0, 80(%r12)
	movaps	.LCPI1_15(%rip), %xmm0  # xmm0 = [111,114]
	movups	%xmm0, 96(%r12)
	movaps	.LCPI1_16(%rip), %xmm0  # xmm0 = [116,32]
	movups	%xmm0, 112(%r12)
	movaps	.LCPI1_17(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 128(%r12)
	movaps	.LCPI1_18(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 144(%r12)
	movaps	.LCPI1_19(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 160(%r12)
	movaps	.LCPI1_20(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 176(%r12)
	movq	$101, 192(%r12)
	testq	%r12, %r12
	setne	%bpl
	movl	$25, %esi
	movq	%r12, %rdi
	callq	println_s
	movq	%r15, %rdi
	callq	free
	testq	%rbx, %rbx
	je	.LBB1_17
# BB#16:                                # %if.then88
	movq	%rbx, %rdi
	callq	free
.LBB1_17:                               # %if.end92
	testq	%r14, %r14
	je	.LBB1_19
.LBB1_18:                               # %if.then94
	movq	8(%rsp), %rsi
	movq	%r14, %rdi
	callq	free2DArray_int64_t
.LBB1_19:                               # %if.end104
	testb	%bpl, %bpl
	je	.LBB1_21
# BB#20:                                # %if.then106
	movq	%r12, %rdi
	callq	free
.LBB1_21:                               # %if.end107
	xorl	%edi, %edi
	callq	exit
.LBB1_1:
	xorl	%r12d, %r12d
	xorl	%ebp, %ebp
	testq	%r14, %r14
	jne	.LBB1_18
	jmp	.LBB1_19
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
