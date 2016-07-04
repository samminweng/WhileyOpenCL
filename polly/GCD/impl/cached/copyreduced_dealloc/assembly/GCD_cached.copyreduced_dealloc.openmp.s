	.text
	.file	"llvm/GCD_cached.copyreduced_dealloc.openmp.ll"
	.globl	gcd
	.p2align	4, 0x90
	.type	gcd,@function
gcd:                                    # @gcd
	.cfi_startproc
# BB#0:                                 # %entry
	testq	%rdi, %rdi
	je	.LBB0_1
# BB#2:                                 # %while.cond.preheader
	js	.LBB0_6
# BB#3:                                 # %blklab4.lr.ph.preheader
	testq	%rsi, %rsi
	je	.LBB0_8
	.p2align	4, 0x90
.LBB0_4:                                # %blklab4
                                        # =>This Inner Loop Header: Depth=1
	movq	%rdi, %rax
	subq	%rsi, %rax
	jle	.LBB0_7
# BB#5:                                 # %if.end9
                                        #   in Loop: Header=BB0_4 Depth=1
	movq	%rax, %rdi
	jns	.LBB0_4
	jmp	.LBB0_6
.LBB0_7:                                # %blklab5
                                        #   in Loop: Header=BB0_4 Depth=1
	subq	%rdi, %rsi
	jne	.LBB0_4
.LBB0_8:                                # %cleanup
	movq	%rdi, %rax
	retq
.LBB0_1:
	movq	%rsi, %rdi
	movq	%rdi, %rax
	retq
.LBB0_6:                                # %if.end3
	pushq	%rax
.Ltmp0:
	.cfi_def_cfa_offset 16
	movq	stderr(%rip), %rcx
	movl	$.L.str, %edi
	movl	$4, %esi
	movl	$1, %edx
	callq	fwrite
	movl	$-1, %edi
	callq	exit
.Lfunc_end0:
	.size	gcd, .Lfunc_end0-gcd
	.cfi_endproc

	.globl	gcd_cached
	.p2align	4, 0x90
	.type	gcd_cached,@function
gcd_cached:                             # @gcd_cached
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp1:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp2:
	.cfi_def_cfa_offset 24
	pushq	%rax
.Ltmp3:
	.cfi_def_cfa_offset 32
.Ltmp4:
	.cfi_offset %rbx, -24
.Ltmp5:
	.cfi_offset %r14, -16
	movq	%rsi, %r14
	movq	%rdi, %rbx
	testq	%rbx, %rbx
	je	.LBB1_3
# BB#1:                                 # %blklab7
	testq	%r14, %r14
	je	.LBB1_5
# BB#2:                                 # %blklab9
	movq	%rbx, %rax
	negq	%rax
	xorl	%esi, %esi
	cmpq	%r14, %rbx
	cmovgq	%rsi, %rax
	cmovgq	%r14, %rsi
	addq	%r14, %rax
	subq	%rsi, %rbx
	imulq	%rdx, %rbx
	addq	%rax, %rbx
	movq	(%rcx,%rbx,8), %r14
.LBB1_3:                                # %blklab9
	testb	%r9b, %r9b
	je	.LBB1_8
# BB#4:                                 # %if.then14
	movq	%rcx, %rdi
	callq	free
	jmp	.LBB1_8
.LBB1_5:                                # %if.end5
	testb	%r9b, %r9b
	je	.LBB1_7
# BB#6:                                 # %if.then7
	movq	%rcx, %rdi
	callq	free
.LBB1_7:
	movq	%rbx, %r14
.LBB1_8:                                # %cleanup
	movq	%r14, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end1:
	.size	gcd_cached, .Lfunc_end1-gcd_cached
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI2_0:
	.quad	78                      # 0x4e
	.quad	32                      # 0x20
.LCPI2_1:
	.quad	61                      # 0x3d
	.quad	32                      # 0x20
.LCPI2_2:
	.quad	2                       # 0x2
	.quad	2                       # 0x2
.LCPI2_3:
	.quad	4                       # 0x4
	.quad	4                       # 0x4
.LCPI2_4:
	.quad	6                       # 0x6
	.quad	6                       # 0x6
.LCPI2_5:
	.quad	8                       # 0x8
	.quad	8                       # 0x8
.LCPI2_6:
	.quad	83                      # 0x53
	.quad	117                     # 0x75
.LCPI2_7:
	.quad	109                     # 0x6d
	.quad	58                      # 0x3a
.LCPI2_8:
	.quad	80                      # 0x50
	.quad	97                      # 0x61
.LCPI2_9:
	.quad	115                     # 0x73
	.quad	115                     # 0x73
.LCPI2_10:
	.quad	32                      # 0x20
	.quad	99                      # 0x63
.LCPI2_11:
	.quad	97                      # 0x61
	.quad	99                      # 0x63
.LCPI2_12:
	.quad	104                     # 0x68
	.quad	101                     # 0x65
.LCPI2_13:
	.quad	100                     # 0x64
	.quad	32                      # 0x20
.LCPI2_14:
	.quad	69                      # 0x45
	.quad	117                     # 0x75
.LCPI2_15:
	.quad	99                      # 0x63
	.quad	108                     # 0x6c
.LCPI2_16:
	.quad	105                     # 0x69
	.quad	100                     # 0x64
.LCPI2_17:
	.quad	32                      # 0x20
	.quad	71                      # 0x47
.LCPI2_18:
	.quad	67                      # 0x43
	.quad	68                      # 0x44
.LCPI2_19:
	.quad	32                      # 0x20
	.quad	116                     # 0x74
.LCPI2_20:
	.quad	101                     # 0x65
	.quad	115                     # 0x73
.LCPI2_21:
	.quad	116                     # 0x74
	.quad	32                      # 0x20
.LCPI2_22:
	.quad	99                      # 0x63
	.quad	97                      # 0x61
.LCPI2_23:
	.quad	115                     # 0x73
	.quad	101                     # 0x65
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp6:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp7:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp8:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp9:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp10:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp11:
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
.Ltmp12:
	.cfi_def_cfa_offset 96
.Ltmp13:
	.cfi_offset %rbx, -56
.Ltmp14:
	.cfi_offset %r12, -48
.Ltmp15:
	.cfi_offset %r13, -40
.Ltmp16:
	.cfi_offset %r14, -32
.Ltmp17:
	.cfi_offset %r15, -24
.Ltmp18:
	.cfi_offset %rbp, -16
	callq	convertArgsToIntArray
	movq	(%rax), %rdi
	callq	parseStringToInt
	testq	%rax, %rax
	je	.LBB2_21
# BB#1:                                 # %if.end5
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	(%rax), %r13
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	movl	$4, %esi
	callq	create1DArray
	movaps	.LCPI2_0(%rip), %xmm0   # xmm0 = [78,32]
	movups	%xmm0, (%rax)
	movdqa	.LCPI2_1(%rip), %xmm0   # xmm0 = [61,32]
	movdqu	%xmm0, 16(%rax)
	movl	$4, %esi
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movq	%rax, %rdi
	callq	printf_s
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%r13, %rsi
	callq	printf
	movl	%r13d, %esi
	imull	%esi, %esi
	xorl	%edi, %edi
	callq	create1DArray
	movq	%rax, %r12
	testq	%r13, %r13
	jle	.LBB2_20
# BB#2:                                 # %while.cond31.preheader.us.preheader
	leaq	-4(%r13), %rax
	shrq	$2, %rax
	leal	1(%rax), %ecx
	movq	%r13, %rdx
	andq	$-4, %rdx
	andl	$1, %ecx
	leaq	(,%r13,8), %rsi
	movq	%rcx, 32(%rsp)          # 8-byte Spill
	decq	%rcx
	movq	%rax, %r11
	subq	%rax, %rcx
	movq	%rcx, 24(%rsp)          # 8-byte Spill
	xorl	%edi, %edi
	movl	$1, %eax
	movd	%rax, %xmm8
	pslldq	$8, %xmm8               # xmm8 = zero,zero,zero,zero,zero,zero,zero,zero,xmm8[0,1,2,3,4,5,6,7]
	movdqa	.LCPI2_2(%rip), %xmm1   # xmm1 = [2,2]
	movdqa	.LCPI2_3(%rip), %xmm9   # xmm9 = [4,4]
	movdqa	.LCPI2_4(%rip), %xmm3   # xmm3 = [6,6]
	movdqa	.LCPI2_5(%rip), %xmm4   # xmm4 = [8,8]
	movq	%r12, %r14
	xorl	%ebx, %ebx
	xorl	%r10d, %r10d
	jmp	.LBB2_3
.LBB2_13:                               #   in Loop: Header=BB2_3 Depth=1
	movdqa	%xmm8, %xmm2
.LBB2_16:                               # %middle.block.unr-lcssa
                                        #   in Loop: Header=BB2_3 Depth=1
	cmpq	$0, 32(%rsp)            # 8-byte Folded Reload
	je	.LBB2_18
# BB#17:                                # %middle.block.epilog-lcssa
                                        #   in Loop: Header=BB2_3 Depth=1
	movdqa	%xmm2, %xmm0
	paddq	%xmm1, %xmm0
	movd	%xmm2, %rax
	addq	%rbp, %rax
	movdqu	%xmm2, (%r12,%rax,8)
	movdqu	%xmm0, 16(%r12,%rax,8)
	paddq	%xmm0, %xmm6
	paddq	%xmm2, %xmm5
.LBB2_18:                               # %middle.block
                                        #   in Loop: Header=BB2_3 Depth=1
	cmpq	%rdx, %r13
	paddq	%xmm5, %xmm6
	pshufd	$78, %xmm6, %xmm0       # xmm0 = xmm6[2,3,0,1]
	paddq	%xmm6, %xmm0
	movd	%xmm0, %rbx
	movq	%rdx, %rax
	jne	.LBB2_10
	jmp	.LBB2_19
	.p2align	4, 0x90
.LBB2_3:                                # %while.cond31.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_5 Depth 2
                                        #     Child Loop BB2_15 Depth 2
                                        #     Child Loop BB2_10 Depth 2
	testq	%r10, %r10
	je	.LBB2_8
# BB#4:                                 # %if.end36.us228.preheader
                                        #   in Loop: Header=BB2_3 Depth=1
	movq	%r10, %rbp
	negq	%rbp
	movq	%r14, %rax
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB2_5:                                # %if.end36.us228
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	testq	%r15, %r15
	movq	%r10, %rcx
	je	.LBB2_7
# BB#6:                                 # %blklab9.i.us233
                                        #   in Loop: Header=BB2_5 Depth=2
	cmpq	%r15, %r10
	movq	%rbp, %rcx
	cmovgq	%rdi, %rcx
	movl	$0, %r8d
	cmovgq	%r15, %r8
	movq	%r10, %r9
	subq	%r8, %r9
	imulq	%r13, %r9
	addq	%rcx, %r9
	addq	%r15, %r9
	movq	(%r12,%r9,8), %rcx
.LBB2_7:                                # %gcd_cached.exit.us242
                                        #   in Loop: Header=BB2_5 Depth=2
	movq	%rcx, (%rax)
	addq	%rcx, %rbx
	incq	%r15
	addq	$8, %rax
	cmpq	%r15, %r13
	jne	.LBB2_5
	jmp	.LBB2_19
	.p2align	4, 0x90
.LBB2_8:                                # %if.end36.us.us.preheader
                                        #   in Loop: Header=BB2_3 Depth=1
	cmpq	$3, %r13
	jbe	.LBB2_9
# BB#11:                                # %min.iters.checked
                                        #   in Loop: Header=BB2_3 Depth=1
	testq	%rdx, %rdx
	je	.LBB2_9
# BB#12:                                # %vector.ph
                                        #   in Loop: Header=BB2_3 Depth=1
	movq	%r10, %rbp
	imulq	%r13, %rbp
	testq	%r11, %r11
	movd	%rbx, %xmm5
	pxor	%xmm6, %xmm6
	je	.LBB2_13
# BB#14:                                # %vector.ph.new
                                        #   in Loop: Header=BB2_3 Depth=1
	movl	$1, %eax
	movd	%rax, %xmm2
	pslldq	$8, %xmm2               # xmm2 = zero,zero,zero,zero,zero,zero,zero,zero,xmm2[0,1,2,3,4,5,6,7]
	pxor	%xmm6, %xmm6
	movq	24(%rsp), %rbx          # 8-byte Reload
	.p2align	4, 0x90
.LBB2_15:                               # %vector.body
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movdqa	%xmm2, %xmm7
	paddq	%xmm1, %xmm7
	movdqa	%xmm2, %xmm0
	paddq	%xmm9, %xmm0
	movd	%xmm2, %rax
	addq	%rbp, %rax
	movdqu	%xmm2, (%r12,%rax,8)
	movdqu	%xmm7, 16(%r12,%rax,8)
	paddq	%xmm2, %xmm5
	paddq	%xmm6, %xmm7
	movdqa	%xmm2, %xmm6
	paddq	%xmm3, %xmm6
	paddq	%xmm4, %xmm2
	movd	%xmm0, %rax
	addq	%rbp, %rax
	movdqu	%xmm0, (%r12,%rax,8)
	movdqu	%xmm6, 16(%r12,%rax,8)
	paddq	%xmm0, %xmm5
	paddq	%xmm7, %xmm6
	addq	$2, %rbx
	jne	.LBB2_15
	jmp	.LBB2_16
	.p2align	4, 0x90
.LBB2_9:                                #   in Loop: Header=BB2_3 Depth=1
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB2_10:                               # %if.end36.us.us
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rax, (%r14,%rax,8)
	addq	%rax, %rbx
	incq	%rax
	cmpq	%rax, %r13
	jne	.LBB2_10
.LBB2_19:                               # %blklab16.loopexit.us
                                        #   in Loop: Header=BB2_3 Depth=1
	incq	%r10
	addq	%rsi, %r14
	cmpq	%r13, %r10
	jne	.LBB2_3
.LBB2_20:                               # %if.then98
	xorl	%edi, %edi
	movl	$5, %esi
	callq	create1DArray
	movq	%rax, %r13
	movaps	.LCPI2_6(%rip), %xmm0   # xmm0 = [83,117]
	movups	%xmm0, (%r13)
	movaps	.LCPI2_7(%rip), %xmm0   # xmm0 = [109,58]
	movups	%xmm0, 16(%r13)
	movq	$32, 32(%r13)
	movl	$5, %esi
	movq	%r13, %rdi
	callq	printf_s
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	printf
	xorl	%edi, %edi
	movl	$32, %esi
	callq	create1DArray
	movq	%rax, %rbx
	movaps	.LCPI2_8(%rip), %xmm0   # xmm0 = [80,97]
	movups	%xmm0, (%rbx)
	movaps	.LCPI2_9(%rip), %xmm0   # xmm0 = [115,115]
	movups	%xmm0, 16(%rbx)
	movaps	.LCPI2_10(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 32(%rbx)
	movaps	.LCPI2_11(%rip), %xmm0  # xmm0 = [97,99]
	movups	%xmm0, 48(%rbx)
	movaps	.LCPI2_12(%rip), %xmm0  # xmm0 = [104,101]
	movups	%xmm0, 64(%rbx)
	movaps	.LCPI2_13(%rip), %xmm0  # xmm0 = [100,32]
	movups	%xmm0, 80(%rbx)
	movaps	.LCPI2_14(%rip), %xmm0  # xmm0 = [69,117]
	movups	%xmm0, 96(%rbx)
	movaps	.LCPI2_15(%rip), %xmm0  # xmm0 = [99,108]
	movups	%xmm0, 112(%rbx)
	movaps	.LCPI2_16(%rip), %xmm0  # xmm0 = [105,100]
	movups	%xmm0, 128(%rbx)
	movaps	.LCPI2_17(%rip), %xmm0  # xmm0 = [32,71]
	movups	%xmm0, 144(%rbx)
	movaps	.LCPI2_18(%rip), %xmm0  # xmm0 = [67,68]
	movups	%xmm0, 160(%rbx)
	movaps	.LCPI2_19(%rip), %xmm0  # xmm0 = [32,116]
	movups	%xmm0, 176(%rbx)
	movaps	.LCPI2_20(%rip), %xmm0  # xmm0 = [101,115]
	movups	%xmm0, 192(%rbx)
	movaps	.LCPI2_21(%rip), %xmm0  # xmm0 = [116,32]
	movups	%xmm0, 208(%rbx)
	movaps	.LCPI2_22(%rip), %xmm0  # xmm0 = [99,97]
	movups	%xmm0, 224(%rbx)
	movaps	.LCPI2_23(%rip), %xmm0  # xmm0 = [115,101]
	movups	%xmm0, 240(%rbx)
	movl	$32, %esi
	movq	%rbx, %rdi
	callq	println_s
	movq	16(%rsp), %rdi          # 8-byte Reload
	callq	free
	movq	%r12, %rdi
	callq	free
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	free
	movq	%r13, %rdi
	callq	free
	movq	%rbx, %rdi
	callq	free
.LBB2_21:                               # %if.end120
	xorl	%edi, %edi
	callq	exit
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"fail"
	.size	.L.str, 5

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"%lld\n"
	.size	.L.str.1, 6


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git f82fb5beb88e841f7a00cfb2a2ceabe46bcb2a9b) (http://llvm.org/git/llvm.git bafbf2b643f118fd2ea402ed6cd204281c7e9e94)"
	.section	".note.GNU-stack","",@progbits
