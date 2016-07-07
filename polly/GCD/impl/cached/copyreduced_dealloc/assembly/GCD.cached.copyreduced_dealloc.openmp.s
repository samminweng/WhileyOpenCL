	.text
	.file	"llvm/GCD.cached.copyreduced_dealloc.openmp.ll"
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
	subq	$56, %rsp
.Ltmp12:
	.cfi_def_cfa_offset 112
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
	movl	%edi, %ebx
	callq	convertArgsToIntArray
	movq	%rax, %rbp
	decl	%ebx
	movslq	%ebx, %rbx
	movq	(%rbp), %rdi
	callq	parseStringToInt
	testq	%rax, %rax
	je	.LBB2_21
# BB#1:                                 # %if.end8
	movq	%rbx, 24(%rsp)          # 8-byte Spill
	movq	%rbp, 32(%rsp)          # 8-byte Spill
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	(%rax), %rbp
	xorl	%r14d, %r14d
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
	movq	%rbp, %rsi
	callq	printf
	movl	%ebp, %esi
	imull	%esi, %esi
	xorl	%edi, %edi
	callq	create1DArray
	movq	%rax, %rbx
	testq	%rbp, %rbp
	jle	.LBB2_20
# BB#2:                                 # %while.cond34.preheader.us.preheader
	leaq	-4(%rbp), %rax
	shrq	$2, %rax
	leal	1(%rax), %ecx
	movq	%rbp, %r15
	andq	$-4, %r15
	andl	$1, %ecx
	leaq	(,%rbp,8), %r12
	movq	%rcx, 48(%rsp)          # 8-byte Spill
	decq	%rcx
	movq	%rax, %r11
	subq	%rax, %rcx
	movq	%rcx, 40(%rsp)          # 8-byte Spill
	xorl	%edi, %edi
	movl	$1, %eax
	movd	%rax, %xmm8
	pslldq	$8, %xmm8               # xmm8 = zero,zero,zero,zero,zero,zero,zero,zero,xmm8[0,1,2,3,4,5,6,7]
	movdqa	.LCPI2_2(%rip), %xmm1   # xmm1 = [2,2]
	movdqa	.LCPI2_3(%rip), %xmm9   # xmm9 = [4,4]
	movdqa	.LCPI2_4(%rip), %xmm3   # xmm3 = [6,6]
	movdqa	.LCPI2_5(%rip), %xmm4   # xmm4 = [8,8]
	movq	%rbx, %rax
	xorl	%r14d, %r14d
	xorl	%r10d, %r10d
	jmp	.LBB2_3
.LBB2_13:                               #   in Loop: Header=BB2_3 Depth=1
	movdqa	%xmm8, %xmm2
.LBB2_16:                               # %middle.block.unr-lcssa
                                        #   in Loop: Header=BB2_3 Depth=1
	cmpq	$0, 48(%rsp)            # 8-byte Folded Reload
	je	.LBB2_18
# BB#17:                                # %middle.block.epilog-lcssa
                                        #   in Loop: Header=BB2_3 Depth=1
	movdqa	%xmm2, %xmm0
	paddq	%xmm1, %xmm0
	movd	%xmm2, %rcx
	addq	%rdx, %rcx
	movdqu	%xmm2, (%rbx,%rcx,8)
	movdqu	%xmm0, 16(%rbx,%rcx,8)
	paddq	%xmm0, %xmm6
	paddq	%xmm2, %xmm5
.LBB2_18:                               # %middle.block
                                        #   in Loop: Header=BB2_3 Depth=1
	cmpq	%r15, %rbp
	paddq	%xmm5, %xmm6
	pshufd	$78, %xmm6, %xmm0       # xmm0 = xmm6[2,3,0,1]
	paddq	%xmm6, %xmm0
	movd	%xmm0, %r14
	movq	%r15, %rdx
	jne	.LBB2_10
	jmp	.LBB2_19
	.p2align	4, 0x90
.LBB2_3:                                # %while.cond34.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_5 Depth 2
                                        #     Child Loop BB2_15 Depth 2
                                        #     Child Loop BB2_10 Depth 2
	testq	%r10, %r10
	je	.LBB2_8
# BB#4:                                 # %if.end39.us232.preheader
                                        #   in Loop: Header=BB2_3 Depth=1
	movq	%r10, %rdx
	negq	%rdx
	movq	%rax, %rsi
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB2_5:                                # %if.end39.us232
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	testq	%r13, %r13
	movq	%r10, %rcx
	je	.LBB2_7
# BB#6:                                 # %blklab9.i.us237
                                        #   in Loop: Header=BB2_5 Depth=2
	cmpq	%r13, %r10
	movq	%rdx, %rcx
	cmovgq	%rdi, %rcx
	movl	$0, %r8d
	cmovgq	%r13, %r8
	movq	%r10, %r9
	subq	%r8, %r9
	imulq	%rbp, %r9
	addq	%rcx, %r9
	addq	%r13, %r9
	movq	(%rbx,%r9,8), %rcx
.LBB2_7:                                # %gcd_cached.exit.us246
                                        #   in Loop: Header=BB2_5 Depth=2
	movq	%rcx, (%rsi)
	addq	%rcx, %r14
	incq	%r13
	addq	$8, %rsi
	cmpq	%r13, %rbp
	jne	.LBB2_5
	jmp	.LBB2_19
	.p2align	4, 0x90
.LBB2_8:                                # %if.end39.us.us.preheader
                                        #   in Loop: Header=BB2_3 Depth=1
	cmpq	$3, %rbp
	jbe	.LBB2_9
# BB#11:                                # %min.iters.checked
                                        #   in Loop: Header=BB2_3 Depth=1
	testq	%r15, %r15
	je	.LBB2_9
# BB#12:                                # %vector.ph
                                        #   in Loop: Header=BB2_3 Depth=1
	movq	%r10, %rdx
	imulq	%rbp, %rdx
	testq	%r11, %r11
	movd	%r14, %xmm5
	pxor	%xmm6, %xmm6
	je	.LBB2_13
# BB#14:                                # %vector.ph.new
                                        #   in Loop: Header=BB2_3 Depth=1
	movl	$1, %ecx
	movd	%rcx, %xmm2
	pslldq	$8, %xmm2               # xmm2 = zero,zero,zero,zero,zero,zero,zero,zero,xmm2[0,1,2,3,4,5,6,7]
	pxor	%xmm6, %xmm6
	movq	40(%rsp), %rsi          # 8-byte Reload
	.p2align	4, 0x90
.LBB2_15:                               # %vector.body
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movdqa	%xmm2, %xmm7
	paddq	%xmm1, %xmm7
	movdqa	%xmm2, %xmm0
	paddq	%xmm9, %xmm0
	movd	%xmm2, %rcx
	addq	%rdx, %rcx
	movdqu	%xmm2, (%rbx,%rcx,8)
	movdqu	%xmm7, 16(%rbx,%rcx,8)
	paddq	%xmm2, %xmm5
	paddq	%xmm6, %xmm7
	movdqa	%xmm2, %xmm6
	paddq	%xmm3, %xmm6
	paddq	%xmm4, %xmm2
	movd	%xmm0, %rcx
	addq	%rdx, %rcx
	movdqu	%xmm0, (%rbx,%rcx,8)
	movdqu	%xmm6, 16(%rbx,%rcx,8)
	paddq	%xmm0, %xmm5
	paddq	%xmm7, %xmm6
	addq	$2, %rsi
	jne	.LBB2_15
	jmp	.LBB2_16
	.p2align	4, 0x90
.LBB2_9:                                #   in Loop: Header=BB2_3 Depth=1
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB2_10:                               # %if.end39.us.us
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rdx, (%rax,%rdx,8)
	addq	%rdx, %r14
	incq	%rdx
	cmpq	%rdx, %rbp
	jne	.LBB2_10
.LBB2_19:                               # %blklab16.loopexit.us
                                        #   in Loop: Header=BB2_3 Depth=1
	incq	%r10
	addq	%r12, %rax
	cmpq	%rbp, %r10
	jne	.LBB2_3
.LBB2_20:                               # %if.then101
	xorl	%edi, %edi
	movl	$5, %esi
	callq	create1DArray
	movq	%rax, %r15
	movaps	.LCPI2_6(%rip), %xmm0   # xmm0 = [83,117]
	movups	%xmm0, (%r15)
	movaps	.LCPI2_7(%rip), %xmm0   # xmm0 = [109,58]
	movups	%xmm0, 16(%r15)
	movq	$32, 32(%r15)
	movl	$5, %esi
	movq	%r15, %rdi
	callq	printf_s
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%r14, %rsi
	callq	printf
	xorl	%edi, %edi
	movl	$32, %esi
	callq	create1DArray
	movq	%rax, %rbp
	movaps	.LCPI2_8(%rip), %xmm0   # xmm0 = [80,97]
	movups	%xmm0, (%rbp)
	movaps	.LCPI2_9(%rip), %xmm0   # xmm0 = [115,115]
	movups	%xmm0, 16(%rbp)
	movaps	.LCPI2_10(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 32(%rbp)
	movaps	.LCPI2_11(%rip), %xmm0  # xmm0 = [97,99]
	movups	%xmm0, 48(%rbp)
	movaps	.LCPI2_12(%rip), %xmm0  # xmm0 = [104,101]
	movups	%xmm0, 64(%rbp)
	movaps	.LCPI2_13(%rip), %xmm0  # xmm0 = [100,32]
	movups	%xmm0, 80(%rbp)
	movaps	.LCPI2_14(%rip), %xmm0  # xmm0 = [69,117]
	movups	%xmm0, 96(%rbp)
	movaps	.LCPI2_15(%rip), %xmm0  # xmm0 = [99,108]
	movups	%xmm0, 112(%rbp)
	movaps	.LCPI2_16(%rip), %xmm0  # xmm0 = [105,100]
	movups	%xmm0, 128(%rbp)
	movaps	.LCPI2_17(%rip), %xmm0  # xmm0 = [32,71]
	movups	%xmm0, 144(%rbp)
	movaps	.LCPI2_18(%rip), %xmm0  # xmm0 = [67,68]
	movups	%xmm0, 160(%rbp)
	movaps	.LCPI2_19(%rip), %xmm0  # xmm0 = [32,116]
	movups	%xmm0, 176(%rbp)
	movaps	.LCPI2_20(%rip), %xmm0  # xmm0 = [101,115]
	movups	%xmm0, 192(%rbp)
	movaps	.LCPI2_21(%rip), %xmm0  # xmm0 = [116,32]
	movups	%xmm0, 208(%rbp)
	movaps	.LCPI2_22(%rip), %xmm0  # xmm0 = [99,97]
	movups	%xmm0, 224(%rbp)
	movaps	.LCPI2_23(%rip), %xmm0  # xmm0 = [115,101]
	movups	%xmm0, 240(%rbp)
	movl	$32, %esi
	movq	%rbp, %rdi
	callq	println_s
	movq	16(%rsp), %rdi          # 8-byte Reload
	callq	free
	movq	%rbx, %rdi
	callq	free
	movq	32(%rsp), %rdi          # 8-byte Reload
	movq	24(%rsp), %rsi          # 8-byte Reload
	callq	free2DArray
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	free
	movq	%r15, %rdi
	callq	free
	movq	%rbp, %rdi
	callq	free
	xorl	%edi, %edi
	callq	exit
.LBB2_21:                               # %if.end123.critedge
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	callq	free2DArray
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
