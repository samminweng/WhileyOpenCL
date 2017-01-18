	.text
	.file	"llvm/Reverse.original.openmp.nocopy_dealloc.disabledpattern.out.ll"
	.globl	_reverse_
	.p2align	4, 0x90
	.type	_reverse_,@function
_reverse_:                              # @_reverse_
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
	movq	%rcx, %r14
	movl	%edx, %r12d
	movq	%rsi, %r13
	movq	%rdi, %r15
	xorl	%edi, %edi
	callq	create1DArray_int64_t
	movq	%rax, %rbp
	testq	%r13, %r13
	jle	.LBB0_18
# BB#1:                                 # %polly.split_new_and_old
	movabsq	$1152921504606846975, %rsi # imm = 0xFFFFFFFFFFFFFFF
	addq	%r13, %rsi
	leaq	(%r15,%r13,8), %rcx
	movq	%r13, %rdx
	decq	%rdx
	seto	%al
	movq	%rdx, %rdi
	sarq	$63, %rdi
	andq	%rdx, %rdi
	leaq	(%rbp,%rdi,8), %rdx
	cmpq	%rdx, %rcx
	setbe	%cl
	leaq	(%rbp,%r13,8), %rdx
	cmpq	%r15, %rdx
	setbe	%bl
	shrq	$61, %rsi
	jne	.LBB0_4
# BB#2:                                 # %polly.split_new_and_old
	orb	%bl, %cl
	je	.LBB0_4
# BB#3:                                 # %polly.split_new_and_old
	xorb	$1, %al
	je	.LBB0_4
# BB#21:                                # %polly.parallel.for
	movl	%r12d, 12(%rsp)         # 4-byte Spill
	movq	%r14, 64(%rsp)          # 8-byte Spill
	movq	%r13, 32(%rsp)
	movq	%r15, 56(%rsp)          # 8-byte Spill
	movq	%r15, 40(%rsp)
	movq	%rbp, 48(%rsp)
	leaq	32(%rsp), %rsi
	movl	$_reverse__polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r13, %r8
	callq	GOMP_parallel_loop_runtime_start
	movq	32(%rsp), %r14
	movq	40(%rsp), %r12
	movq	48(%rsp), %rbx
	leaq	24(%rsp), %rdi
	leaq	16(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB0_26
# BB#22:                                # %polly.par.loadIVBounds.preheader.i
	leaq	-8(%rbx,%r14,8), %r15
	leaq	24(%rsp), %rbx
	leaq	16(%rsp), %r14
	.p2align	4, 0x90
.LBB0_24:                               # %polly.par.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_25 Depth 2
	movq	16(%rsp), %rax
	movq	24(%rsp), %rsi
	addq	$-2, %rax
	leaq	-1(%rsi), %rcx
	shlq	$3, %rsi
	movq	%r15, %rdx
	subq	%rsi, %rdx
	.p2align	4, 0x90
.LBB0_25:                               # %polly.loop_header.i
                                        #   Parent Loop BB0_24 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%r12,%rcx,8), %rsi
	movq	%rsi, (%rdx)
	incq	%rcx
	addq	$-8, %rdx
	cmpq	%rax, %rcx
	jle	.LBB0_25
# BB#23:                                # %polly.par.checkNext.loopexit.i
                                        #   in Loop: Header=BB0_24 Depth=1
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_24
.LBB0_26:                               # %_reverse__polly_subfn.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movq	64(%rsp), %r14          # 8-byte Reload
	movq	56(%rsp), %r15          # 8-byte Reload
	movl	12(%rsp), %r12d         # 4-byte Reload
	testb	%r12b, %r12b
	jne	.LBB0_19
	jmp	.LBB0_20
.LBB0_4:                                # %if.end10.preheader
	movq	%r13, %rdi
	notq	%rdi
	cmpq	$-3, %rdi
	movq	$-2, %rax
	cmovgq	%rdi, %rax
	leaq	2(%rax,%r13), %rax
	cmpq	$4, %rax
	movq	%r13, %rsi
	jb	.LBB0_16
# BB#5:                                 # %min.iters.checked
	movq	%rax, %rcx
	andq	$-4, %rcx
	movq	%r13, %rsi
	je	.LBB0_16
# BB#6:                                 # %vector.memcheck
	cmpq	$-3, %rdi
	movq	$-2, %rsi
	cmovleq	%rsi, %rdi
	subq	%rdi, %rsi
	leaq	(%rbp,%rsi,8), %rsi
	addq	%r13, %rdi
	leaq	16(%r15,%rdi,8), %rdi
	cmpq	%rdi, %rsi
	jae	.LBB0_8
# BB#7:                                 # %vector.memcheck
	cmpq	%r15, %rdx
	movq	%r13, %rsi
	ja	.LBB0_16
.LBB0_8:                                # %vector.body.preheader
	leaq	-4(%rcx), %rsi
	movq	%rsi, %rdx
	shrq	$2, %rdx
	btl	$2, %esi
	jb	.LBB0_9
# BB#10:                                # %vector.body.prol
	movdqu	(%r15), %xmm0
	movdqu	16(%r15), %xmm1
	pshufd	$78, %xmm0, %xmm0       # xmm0 = xmm0[2,3,0,1]
	movdqu	%xmm0, -16(%rbp,%r13,8)
	pshufd	$78, %xmm1, %xmm0       # xmm0 = xmm1[2,3,0,1]
	movdqu	%xmm0, -32(%rbp,%r13,8)
	movl	$4, %edi
	testq	%rdx, %rdx
	jne	.LBB0_12
	jmp	.LBB0_14
.LBB0_9:
	xorl	%edi, %edi
	testq	%rdx, %rdx
	je	.LBB0_14
.LBB0_12:                               # %vector.body.preheader.new
	movq	%rcx, %rdx
	subq	%rdi, %rdx
	leaq	48(%r15,%rdi,8), %rsi
	leaq	-2(%r13), %rbx
	subq	%rdi, %rbx
	leaq	(%rbp,%rbx,8), %rdi
	.p2align	4, 0x90
.LBB0_13:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movdqu	-48(%rsi), %xmm0
	movdqu	-32(%rsi), %xmm1
	pshufd	$78, %xmm0, %xmm0       # xmm0 = xmm0[2,3,0,1]
	movdqu	%xmm0, (%rdi)
	pshufd	$78, %xmm1, %xmm0       # xmm0 = xmm1[2,3,0,1]
	movdqu	%xmm0, -16(%rdi)
	movdqu	-16(%rsi), %xmm0
	movdqu	(%rsi), %xmm1
	pshufd	$78, %xmm0, %xmm0       # xmm0 = xmm0[2,3,0,1]
	movdqu	%xmm0, -32(%rdi)
	pshufd	$78, %xmm1, %xmm0       # xmm0 = xmm1[2,3,0,1]
	movdqu	%xmm0, -48(%rdi)
	addq	$64, %rsi
	addq	$-64, %rdi
	addq	$-8, %rdx
	jne	.LBB0_13
.LBB0_14:                               # %middle.block
	cmpq	%rcx, %rax
	je	.LBB0_18
# BB#15:
	movq	%r13, %rsi
	subq	%rcx, %rsi
.LBB0_16:                               # %if.end10.preheader71
	movq	%r13, %rax
	subq	%rsi, %rax
	incq	%rsi
	leaq	(%r15,%rax,8), %rax
	.p2align	4, 0x90
.LBB0_17:                               # %if.end10
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rax), %rcx
	movq	%rcx, -16(%rbp,%rsi,8)
	decq	%rsi
	addq	$8, %rax
	cmpq	$1, %rsi
	jg	.LBB0_17
.LBB0_18:                               # %blklab0
	testb	%r12b, %r12b
	je	.LBB0_20
.LBB0_19:                               # %if.then14
	movq	%r15, %rdi
	callq	free
.LBB0_20:                               # %if.end21
	movq	%r13, (%r14)
	movq	%rbp, %rax
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end0:
	.size	_reverse_, .Lfunc_end0-_reverse_
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI1_0:
	.quad	80                      # 0x50
	.quad	97                      # 0x61
.LCPI1_1:
	.quad	115                     # 0x73
	.quad	115                     # 0x73
.LCPI1_2:
	.quad	32                      # 0x20
	.quad	82                      # 0x52
.LCPI1_3:
	.quad	101                     # 0x65
	.quad	118                     # 0x76
.LCPI1_4:
	.quad	101                     # 0x65
	.quad	114                     # 0x72
.LCPI1_5:
	.quad	115                     # 0x73
	.quad	101                     # 0x65
.LCPI1_6:
	.quad	32                      # 0x20
	.quad	116                     # 0x74
.LCPI1_7:
	.quad	101                     # 0x65
	.quad	115                     # 0x73
.LCPI1_8:
	.quad	116                     # 0x74
	.quad	32                      # 0x20
.LCPI1_9:
	.quad	99                      # 0x63
	.quad	97                      # 0x61
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
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
	subq	$72, %rsp
.Lcfi19:
	.cfi_def_cfa_offset 128
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
	movq	$0, (%rsp)
	movq	$0, 64(%rsp)
	movq	$0, 56(%rsp)
	movq	%rsp, %rdx
	leaq	64(%rsp), %rcx
	callq	convertArgsToIntArray
	movq	%rax, %rbp
	movq	(%rbp), %rdi
	callq	parseStringToInt
	testq	%rax, %rax
	je	.LBB1_1
# BB#2:                                 # %if.end14
	movq	%rbp, 48(%rsp)          # 8-byte Spill
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movq	(%rax), %r14
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	create1DArray_int64_t
	movq	%rax, %r12
	testq	%r14, %r14
	jle	.LBB1_3
# BB#12:                                # %polly.parallel.for
	movq	%r14, 24(%rsp)
	movq	%r12, 32(%rsp)
	leaq	24(%rsp), %rsi
	movl	$main_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r14, %r8
	callq	GOMP_parallel_loop_runtime_start
	movq	24(%rsp), %rbx
	movq	32(%rsp), %r15
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB1_17
# BB#13:
	leaq	16(%rsp), %r13
	leaq	8(%rsp), %rbp
	.p2align	4, 0x90
.LBB1_15:                               # %polly.par.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_16 Depth 2
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	addq	$-2, %rax
	movq	%rbx, %rdx
	subq	%rcx, %rdx
	decq	%rcx
	.p2align	4, 0x90
.LBB1_16:                               # %polly.loop_header.i
                                        #   Parent Loop BB1_15 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rdx, 8(%r15,%rcx,8)
	incq	%rcx
	decq	%rdx
	cmpq	%rax, %rcx
	jle	.LBB1_16
# BB#14:                                # %polly.par.checkNext.loopexit.i
                                        #   in Loop: Header=BB1_15 Depth=1
	movq	%r13, %rdi
	movq	%rbp, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB1_15
.LBB1_17:                               # %main_polly_subfn.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
.LBB1_3:                                # %if.end34
	leaq	56(%rsp), %rcx
	xorl	%edx, %edx
	movq	%r12, %rdi
	movq	%r14, %rsi
	callq	_reverse_
	movq	%rax, %r13
	testq	%r12, %r12
	movq	48(%rsp), %rbp          # 8-byte Reload
	je	.LBB1_5
# BB#4:                                 # %if.then41
	movq	%r12, %rdi
	callq	free
.LBB1_5:                                # %if.end82
	movq	(%r13), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movq	-8(%r13,%r14,8), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%edi, %edi
	movl	$22, %esi
	callq	create1DArray_int64_t
	movq	%rax, %rbx
	movaps	.LCPI1_0(%rip), %xmm0   # xmm0 = [80,97]
	movups	%xmm0, (%rbx)
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [115,115]
	movups	%xmm0, 16(%rbx)
	movaps	.LCPI1_2(%rip), %xmm0   # xmm0 = [32,82]
	movups	%xmm0, 32(%rbx)
	movaps	.LCPI1_3(%rip), %xmm0   # xmm0 = [101,118]
	movups	%xmm0, 48(%rbx)
	movaps	.LCPI1_4(%rip), %xmm0   # xmm0 = [101,114]
	movups	%xmm0, 64(%rbx)
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [115,101]
	movups	%xmm0, 80(%rbx)
	movaps	.LCPI1_6(%rip), %xmm1   # xmm1 = [32,116]
	movups	%xmm1, 96(%rbx)
	movaps	.LCPI1_7(%rip), %xmm1   # xmm1 = [101,115]
	movups	%xmm1, 112(%rbx)
	movaps	.LCPI1_8(%rip), %xmm1   # xmm1 = [116,32]
	movups	%xmm1, 128(%rbx)
	movaps	.LCPI1_9(%rip), %xmm1   # xmm1 = [99,97]
	movups	%xmm1, 144(%rbx)
	movups	%xmm0, 160(%rbx)
	testq	%rbx, %rbx
	setne	%r14b
	movl	$22, %esi
	movq	%rbx, %rdi
	callq	println_s
	movq	40(%rsp), %rdi          # 8-byte Reload
	callq	free
	testq	%r13, %r13
	je	.LBB1_7
# BB#6:                                 # %if.then84
	movq	%r13, %rdi
	callq	free
.LBB1_7:                                # %if.end88
	testq	%rbp, %rbp
	je	.LBB1_9
.LBB1_8:                                # %if.then90
	movq	(%rsp), %rsi
	movq	%rbp, %rdi
	callq	free2DArray_int64_t
.LBB1_9:                                # %if.end100
	testb	%r14b, %r14b
	je	.LBB1_11
# BB#10:                                # %if.then102
	movq	%rbx, %rdi
	callq	free
.LBB1_11:                               # %if.end103
	xorl	%edi, %edi
	callq	exit
.LBB1_1:
	xorl	%ebx, %ebx
	xorl	%r14d, %r14d
	testq	%rbp, %rbp
	jne	.LBB1_8
	jmp	.LBB1_9
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc

	.p2align	4, 0x90
	.type	_reverse__polly_subfn,@function
_reverse__polly_subfn:                  # @_reverse__polly_subfn
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Lcfi26:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Lcfi27:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Lcfi28:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Lcfi29:
	.cfi_def_cfa_offset 40
	subq	$24, %rsp
.Lcfi30:
	.cfi_def_cfa_offset 64
.Lcfi31:
	.cfi_offset %rbx, -40
.Lcfi32:
	.cfi_offset %r12, -32
.Lcfi33:
	.cfi_offset %r14, -24
.Lcfi34:
	.cfi_offset %r15, -16
	movq	(%rdi), %r14
	movq	8(%rdi), %rbx
	movq	16(%rdi), %r15
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB2_2
# BB#1:                                 # %polly.par.loadIVBounds.preheader
	leaq	-8(%r15,%r14,8), %r12
	leaq	16(%rsp), %r14
	leaq	8(%rsp), %r15
	.p2align	4, 0x90
.LBB2_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_5 Depth 2
	movq	8(%rsp), %rax
	movq	16(%rsp), %rsi
	addq	$-2, %rax
	leaq	-1(%rsi), %rcx
	shlq	$3, %rsi
	movq	%r12, %rdx
	subq	%rsi, %rdx
	.p2align	4, 0x90
.LBB2_5:                                # %polly.loop_header
                                        #   Parent Loop BB2_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%rbx,%rcx,8), %rsi
	movq	%rsi, (%rdx)
	incq	%rcx
	addq	$-8, %rdx
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
	.size	_reverse__polly_subfn, .Lfunc_end2-_reverse__polly_subfn
	.cfi_endproc

	.p2align	4, 0x90
	.type	main_polly_subfn,@function
main_polly_subfn:                       # @main_polly_subfn
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Lcfi35:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Lcfi36:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Lcfi37:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Lcfi38:
	.cfi_def_cfa_offset 40
	subq	$24, %rsp
.Lcfi39:
	.cfi_def_cfa_offset 64
.Lcfi40:
	.cfi_offset %rbx, -40
.Lcfi41:
	.cfi_offset %r12, -32
.Lcfi42:
	.cfi_offset %r14, -24
.Lcfi43:
	.cfi_offset %r15, -16
	movq	(%rdi), %r12
	movq	8(%rdi), %rbx
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB3_2
# BB#1:
	leaq	16(%rsp), %r14
	leaq	8(%rsp), %r15
	.p2align	4, 0x90
.LBB3_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_5 Depth 2
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	addq	$-2, %rax
	movq	%r12, %rdx
	subq	%rcx, %rdx
	decq	%rcx
	.p2align	4, 0x90
.LBB3_5:                                # %polly.loop_header
                                        #   Parent Loop BB3_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rdx, 8(%rbx,%rcx,8)
	incq	%rcx
	decq	%rdx
	cmpq	%rax, %rcx
	jle	.LBB3_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB3_4 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB3_4
.LBB3_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Lfunc_end3:
	.size	main_polly_subfn, .Lfunc_end3-main_polly_subfn
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%ld\n"
	.size	.L.str, 5


	.ident	"clang version 4.0.0 (http://llvm.org/git/clang.git 9b9db7fa41a1905899dbcbcc6cbdd05d2511da8e) (http://llvm.org/git/llvm.git fd456e365e09d54850dabc6a2f840a0c2eae7c27)"
	.section	".note.GNU-stack","",@progbits
