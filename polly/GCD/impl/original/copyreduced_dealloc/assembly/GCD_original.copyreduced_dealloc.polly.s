	.text
	.file	"llvm/GCD_original.copyreduced_dealloc.polly.ll"
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

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI1_0:
	.quad	78                      # 0x4e
	.quad	32                      # 0x20
.LCPI1_1:
	.quad	61                      # 0x3d
	.quad	32                      # 0x20
.LCPI1_2:
	.quad	83                      # 0x53
	.quad	117                     # 0x75
.LCPI1_3:
	.quad	109                     # 0x6d
	.quad	58                      # 0x3a
.LCPI1_4:
	.quad	80                      # 0x50
	.quad	97                      # 0x61
.LCPI1_5:
	.quad	115                     # 0x73
	.quad	115                     # 0x73
.LCPI1_6:
	.quad	32                      # 0x20
	.quad	69                      # 0x45
.LCPI1_7:
	.quad	117                     # 0x75
	.quad	99                      # 0x63
.LCPI1_8:
	.quad	108                     # 0x6c
	.quad	105                     # 0x69
.LCPI1_9:
	.quad	100                     # 0x64
	.quad	32                      # 0x20
.LCPI1_10:
	.quad	71                      # 0x47
	.quad	67                      # 0x43
.LCPI1_11:
	.quad	68                      # 0x44
	.quad	32                      # 0x20
.LCPI1_12:
	.quad	116                     # 0x74
	.quad	101                     # 0x65
.LCPI1_13:
	.quad	115                     # 0x73
	.quad	116                     # 0x74
.LCPI1_14:
	.quad	32                      # 0x20
	.quad	99                      # 0x63
.LCPI1_15:
	.quad	97                      # 0x61
	.quad	115                     # 0x73
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp1:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp2:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp3:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp4:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp5:
	.cfi_def_cfa_offset 48
.Ltmp6:
	.cfi_offset %rbx, -40
.Ltmp7:
	.cfi_offset %r12, -32
.Ltmp8:
	.cfi_offset %r14, -24
.Ltmp9:
	.cfi_offset %r15, -16
	callq	convertArgsToIntArray
	movq	(%rax), %rdi
	callq	parseStringToInt
	movq	%rax, %r14
	testq	%r14, %r14
	je	.LBB1_12
# BB#1:                                 # %if.end5
	movq	(%r14), %r12
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	movl	$4, %esi
	callq	create1DArray
	movq	%rax, %r15
	movaps	.LCPI1_0(%rip), %xmm0   # xmm0 = [78,32]
	movups	%xmm0, (%r15)
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [61,32]
	movups	%xmm0, 16(%r15)
	movl	$4, %esi
	movq	%r15, %rdi
	callq	printf_s
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%r12, %rsi
	callq	printf
	testq	%r12, %r12
	jle	.LBB1_11
# BB#2:                                 # %while.cond20.preheader.us.preheader
	leaq	-1(%r12), %rax
	leaq	-2(%r12), %rcx
	mulq	%rcx
	shldq	$63, %rax, %rdx
	leaq	-1(%r12,%rdx), %r8
	xorl	%ebx, %ebx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_3:                                # %while.cond20.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_5 Depth 2
                                        #       Child Loop BB1_7 Depth 3
	testq	%rcx, %rcx
	je	.LBB1_13
# BB#4:                                 # %if.end25.us174.preheader
                                        #   in Loop: Header=BB1_3 Depth=1
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB1_5:                                # %if.end25.us174
                                        #   Parent Loop BB1_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_7 Depth 3
	testq	%rdx, %rdx
	movq	%rdx, %rdi
	movq	%rcx, %rax
	je	.LBB1_9
	.p2align	4, 0x90
.LBB1_7:                                # %blklab4.i.us178
                                        #   Parent Loop BB1_3 Depth=1
                                        #     Parent Loop BB1_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	%rax, %rsi
	subq	%rdi, %rsi
	jle	.LBB1_8
# BB#6:                                 # %if.end9.i.us185
                                        #   in Loop: Header=BB1_7 Depth=3
	movq	%rsi, %rax
	jns	.LBB1_7
	jmp	.LBB1_14
.LBB1_8:                                # %blklab5.i.us181
                                        #   in Loop: Header=BB1_7 Depth=3
	subq	%rax, %rdi
	jne	.LBB1_7
.LBB1_9:                                # %gcd.exit.loopexit.us198
                                        #   in Loop: Header=BB1_5 Depth=2
	addq	%rax, %rbx
	incq	%rdx
	cmpq	%r12, %rdx
	jne	.LBB1_5
	jmp	.LBB1_10
	.p2align	4, 0x90
.LBB1_13:                               # %if.end25.us.us.us.preheader
                                        #   in Loop: Header=BB1_3 Depth=1
	addq	%r8, %rbx
.LBB1_10:                               # %blklab10.loopexit.us
                                        #   in Loop: Header=BB1_3 Depth=1
	incq	%rcx
	cmpq	%r12, %rcx
	jne	.LBB1_3
.LBB1_11:                               # %if.then83
	xorl	%edi, %edi
	movl	$5, %esi
	callq	create1DArray
	movq	%rax, %r12
	movaps	.LCPI1_2(%rip), %xmm0   # xmm0 = [83,117]
	movups	%xmm0, (%r12)
	movaps	.LCPI1_3(%rip), %xmm0   # xmm0 = [109,58]
	movups	%xmm0, 16(%r12)
	movq	$32, 32(%r12)
	movl	$5, %esi
	movq	%r12, %rdi
	callq	printf_s
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	printf
	xorl	%edi, %edi
	movl	$25, %esi
	callq	create1DArray
	movq	%rax, %rbx
	movaps	.LCPI1_4(%rip), %xmm0   # xmm0 = [80,97]
	movups	%xmm0, (%rbx)
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [115,115]
	movups	%xmm0, 16(%rbx)
	movaps	.LCPI1_6(%rip), %xmm0   # xmm0 = [32,69]
	movups	%xmm0, 32(%rbx)
	movaps	.LCPI1_7(%rip), %xmm0   # xmm0 = [117,99]
	movups	%xmm0, 48(%rbx)
	movaps	.LCPI1_8(%rip), %xmm0   # xmm0 = [108,105]
	movups	%xmm0, 64(%rbx)
	movaps	.LCPI1_9(%rip), %xmm0   # xmm0 = [100,32]
	movups	%xmm0, 80(%rbx)
	movaps	.LCPI1_10(%rip), %xmm0  # xmm0 = [71,67]
	movups	%xmm0, 96(%rbx)
	movaps	.LCPI1_11(%rip), %xmm0  # xmm0 = [68,32]
	movups	%xmm0, 112(%rbx)
	movaps	.LCPI1_12(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 128(%rbx)
	movaps	.LCPI1_13(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 144(%rbx)
	movaps	.LCPI1_14(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 160(%rbx)
	movaps	.LCPI1_15(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 176(%rbx)
	movq	$101, 192(%rbx)
	movl	$25, %esi
	movq	%rbx, %rdi
	callq	println_s
	movq	%r14, %rdi
	callq	free
	movq	%r15, %rdi
	callq	free
	movq	%r12, %rdi
	callq	free
	movq	%rbx, %rdi
	callq	free
.LBB1_12:                               # %if.end90
	xorl	%edi, %edi
	callq	exit
.LBB1_14:                               # %if.end3.i
	movq	stderr(%rip), %rcx
	movl	$.L.str, %edi
	movl	$4, %esi
	movl	$1, %edx
	callq	fwrite
	movl	$-1, %edi
	callq	exit
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
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
