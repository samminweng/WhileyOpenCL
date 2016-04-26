	.text
	.file	"llvm/GCD.openmp.enablevc.ll"
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
	testq	%rdi, %rdi
	je	.LBB1_4
# BB#1:                                 # %blklab7
	testq	%rsi, %rsi
	je	.LBB1_2
# BB#3:                                 # %blklab9
	movq	%rdi, %rax
	negq	%rax
	xorl	%r8d, %r8d
	cmpq	%rsi, %rdi
	cmovgq	%r8, %rax
	cmovgq	%rsi, %r8
	addq	%rsi, %rax
	subq	%r8, %rdi
	imulq	%rdx, %rdi
	addq	%rax, %rdi
	movq	(%rcx,%rdi,8), %rsi
.LBB1_4:                                # %cleanup
	movq	%rsi, %rax
	retq
.LBB1_2:
	movq	%rdi, %rsi
	movq	%rsi, %rax
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
	.quad	3                       # 0x3
.LCPI2_3:
	.quad	83                      # 0x53
	.quad	117                     # 0x75
.LCPI2_4:
	.quad	109                     # 0x6d
	.quad	58                      # 0x3a
.LCPI2_5:
	.quad	80                      # 0x50
	.quad	97                      # 0x61
.LCPI2_6:
	.quad	115                     # 0x73
	.quad	115                     # 0x73
.LCPI2_7:
	.quad	32                      # 0x20
	.quad	99                      # 0x63
.LCPI2_8:
	.quad	97                      # 0x61
	.quad	99                      # 0x63
.LCPI2_9:
	.quad	104                     # 0x68
	.quad	101                     # 0x65
.LCPI2_10:
	.quad	100                     # 0x64
	.quad	32                      # 0x20
.LCPI2_11:
	.quad	69                      # 0x45
	.quad	117                     # 0x75
.LCPI2_12:
	.quad	99                      # 0x63
	.quad	108                     # 0x6c
.LCPI2_13:
	.quad	105                     # 0x69
	.quad	100                     # 0x64
.LCPI2_14:
	.quad	32                      # 0x20
	.quad	71                      # 0x47
.LCPI2_15:
	.quad	67                      # 0x43
	.quad	68                      # 0x44
.LCPI2_16:
	.quad	32                      # 0x20
	.quad	116                     # 0x74
.LCPI2_17:
	.quad	101                     # 0x65
	.quad	115                     # 0x73
.LCPI2_18:
	.quad	116                     # 0x74
	.quad	32                      # 0x20
.LCPI2_19:
	.quad	99                      # 0x63
	.quad	97                      # 0x61
.LCPI2_20:
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
.Ltmp1:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp2:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp3:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp4:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp5:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp6:
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
.Ltmp7:
	.cfi_def_cfa_offset 80
.Ltmp8:
	.cfi_offset %rbx, -56
.Ltmp9:
	.cfi_offset %r12, -48
.Ltmp10:
	.cfi_offset %r13, -40
.Ltmp11:
	.cfi_offset %r14, -32
.Ltmp12:
	.cfi_offset %r15, -24
.Ltmp13:
	.cfi_offset %rbp, -16
	callq	convertArgsToIntArray
	movq	(%rax), %rdi
	callq	parseStringToInt
	testq	%rax, %rax
	je	.LBB2_21
# BB#1:                                 # %if.end
	movq	(%rax), %r14
	movl	$32, %edi
	callq	malloc
	movaps	.LCPI2_0(%rip), %xmm0   # xmm0 = [78,32]
	movups	%xmm0, (%rax)
	movdqa	.LCPI2_1(%rip), %xmm0   # xmm0 = [61,32]
	movdqu	%xmm0, 16(%rax)
	movl	$4, %esi
	movq	%rax, %rdi
	callq	printf_s
	xorl	%ebx, %ebx
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%r14, %rsi
	callq	printf
	movl	%r14d, %esi
	imull	%esi, %esi
	xorl	%edi, %edi
	callq	gen1DArray
	testq	%r14, %r14
	jle	.LBB2_20
# BB#2:                                 # %while.cond16.preheader.us.preheader
	leaq	-4(%r14), %rcx
	shrq	$2, %rcx
	leaq	1(%rcx), %rdx
	movq	%r14, %r11
	andq	$-4, %r11
	movq	%rdx, 16(%rsp)          # 8-byte Spill
	andl	$1, %edx
	leaq	(,%r14,8), %r12
	movq	%rdx, (%rsp)            # 8-byte Spill
	decq	%rdx
	subq	%rcx, %rdx
	movq	%rdx, 8(%rsp)           # 8-byte Spill
	xorl	%r13d, %r13d
	movl	$1, %r15d
	movd	%r15, %xmm0
	pslldq	$8, %xmm0               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7]
	movdqa	.LCPI2_2(%rip), %xmm1   # xmm1 = [2,3]
	movq	%rax, %rcx
	xorl	%ebx, %ebx
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB2_3:                                # %while.cond16.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_5 Depth 2
                                        #     Child Loop BB2_15 Depth 2
                                        #     Child Loop BB2_10 Depth 2
	testq	%r10, %r10
	je	.LBB2_8
# BB#4:                                 # %if.end21.us142.preheader
                                        #   in Loop: Header=BB2_3 Depth=1
	movq	%r10, %rdi
	negq	%rdi
	movq	%rcx, %rdx
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB2_5:                                # %if.end21.us142
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	testq	%rbp, %rbp
	movq	%r10, %rsi
	je	.LBB2_7
# BB#6:                                 # %blklab9.i.us147
                                        #   in Loop: Header=BB2_5 Depth=2
	cmpq	%rbp, %r10
	movq	%rdi, %rsi
	cmovgq	%r13, %rsi
	movl	$0, %r9d
	cmovgq	%rbp, %r9
	movq	%r10, %r8
	subq	%r9, %r8
	imulq	%r14, %r8
	addq	%rsi, %r8
	addq	%rbp, %r8
	movq	(%rax,%r8,8), %rsi
.LBB2_7:                                # %gcd_cached.exit.us156
                                        #   in Loop: Header=BB2_5 Depth=2
	movq	%rsi, (%rdx)
	addq	%rsi, %rbx
	incq	%rbp
	addq	$8, %rdx
	cmpq	%rbp, %r14
	jne	.LBB2_5
	jmp	.LBB2_19
	.p2align	4, 0x90
.LBB2_8:                                # %if.end21.us.us.preheader
                                        #   in Loop: Header=BB2_3 Depth=1
	cmpq	$3, %r14
	jbe	.LBB2_9
# BB#11:                                # %min.iters.checked
                                        #   in Loop: Header=BB2_3 Depth=1
	testq	%r11, %r11
	je	.LBB2_9
# BB#12:                                # %vector.ph
                                        #   in Loop: Header=BB2_3 Depth=1
	movq	(%rsp), %rdx            # 8-byte Reload
	cmpq	%rdx, 16(%rsp)          # 8-byte Folded Reload
	movd	%rbx, %xmm4
	pxor	%xmm2, %xmm2
	jne	.LBB2_14
# BB#13:                                #   in Loop: Header=BB2_3 Depth=1
	xorl	%ebx, %ebx
	movdqa	%xmm4, %xmm3
	jmp	.LBB2_16
	.p2align	4, 0x90
.LBB2_9:                                #   in Loop: Header=BB2_3 Depth=1
	xorl	%edx, %edx
	jmp	.LBB2_10
.LBB2_14:                               # %vector.ph.new
                                        #   in Loop: Header=BB2_3 Depth=1
	pxor	%xmm2, %xmm2
	movq	8(%rsp), %rdi           # 8-byte Reload
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB2_15:                               # %vector.body
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movd	%rbx, %xmm3
	pshufd	$68, %xmm3, %xmm5       # xmm5 = xmm3[0,1,0,1]
	movd	%r15, %xmm3
	pslldq	$8, %xmm3               # xmm3 = zero,zero,zero,zero,zero,zero,zero,zero,xmm3[0,1,2,3,4,5,6,7]
	movdqa	%xmm5, %xmm6
	paddq	%xmm3, %xmm6
	paddq	%xmm1, %xmm5
	movdqu	%xmm6, (%rcx,%rbx,8)
	movdqu	%xmm5, 16(%rcx,%rbx,8)
	paddq	%xmm4, %xmm6
	paddq	%xmm2, %xmm5
	leaq	4(%rbx), %rdx
	movd	%rdx, %xmm2
	pshufd	$68, %xmm2, %xmm2       # xmm2 = xmm2[0,1,0,1]
	paddq	%xmm2, %xmm3
	paddq	%xmm1, %xmm2
	movdqu	%xmm3, 32(%rcx,%rbx,8)
	movdqu	%xmm2, 48(%rcx,%rbx,8)
	paddq	%xmm6, %xmm3
	paddq	%xmm5, %xmm2
	addq	$8, %rbx
	addq	$2, %rdi
	movdqa	%xmm3, %xmm4
	jne	.LBB2_15
.LBB2_16:                               # %middle.block.unr-lcssa
                                        #   in Loop: Header=BB2_3 Depth=1
	cmpq	$0, (%rsp)              # 8-byte Folded Reload
	je	.LBB2_18
# BB#17:                                # %middle.block.epilog-lcssa
                                        #   in Loop: Header=BB2_3 Depth=1
	movq	%r10, %rdx
	imulq	%r14, %rdx
	movd	%rbx, %xmm4
	pshufd	$68, %xmm4, %xmm4       # xmm4 = xmm4[0,1,0,1]
	movdqa	%xmm4, %xmm5
	paddq	%xmm0, %xmm5
	paddq	%xmm1, %xmm4
	addq	%rbx, %rdx
	movdqu	%xmm5, (%rax,%rdx,8)
	movdqu	%xmm4, 16(%rax,%rdx,8)
	paddq	%xmm4, %xmm2
	paddq	%xmm5, %xmm3
.LBB2_18:                               # %middle.block
                                        #   in Loop: Header=BB2_3 Depth=1
	cmpq	%r11, %r14
	paddq	%xmm3, %xmm2
	pshufd	$78, %xmm2, %xmm3       # xmm3 = xmm2[2,3,0,1]
	paddq	%xmm2, %xmm3
	movd	%xmm3, %rbx
	movq	%r11, %rdx
	je	.LBB2_19
	.p2align	4, 0x90
.LBB2_10:                               # %if.end21.us.us
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rdx, (%rcx,%rdx,8)
	addq	%rdx, %rbx
	incq	%rdx
	cmpq	%rdx, %r14
	jne	.LBB2_10
.LBB2_19:                               # %blklab16.loopexit.us
                                        #   in Loop: Header=BB2_3 Depth=1
	incq	%r10
	addq	%r12, %rcx
	cmpq	%r14, %r10
	jne	.LBB2_3
.LBB2_20:                               # %blklab14
	movl	$40, %edi
	callq	malloc
	movaps	.LCPI2_3(%rip), %xmm0   # xmm0 = [83,117]
	movups	%xmm0, (%rax)
	movaps	.LCPI2_4(%rip), %xmm0   # xmm0 = [109,58]
	movups	%xmm0, 16(%rax)
	movq	$32, 32(%rax)
	movl	$5, %esi
	movq	%rax, %rdi
	callq	printf_s
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	printf
	movl	$256, %edi              # imm = 0x100
	callq	malloc
	movaps	.LCPI2_5(%rip), %xmm0   # xmm0 = [80,97]
	movups	%xmm0, (%rax)
	movaps	.LCPI2_6(%rip), %xmm0   # xmm0 = [115,115]
	movups	%xmm0, 16(%rax)
	movaps	.LCPI2_7(%rip), %xmm0   # xmm0 = [32,99]
	movups	%xmm0, 32(%rax)
	movaps	.LCPI2_8(%rip), %xmm0   # xmm0 = [97,99]
	movups	%xmm0, 48(%rax)
	movaps	.LCPI2_9(%rip), %xmm0   # xmm0 = [104,101]
	movups	%xmm0, 64(%rax)
	movaps	.LCPI2_10(%rip), %xmm0  # xmm0 = [100,32]
	movups	%xmm0, 80(%rax)
	movaps	.LCPI2_11(%rip), %xmm0  # xmm0 = [69,117]
	movups	%xmm0, 96(%rax)
	movaps	.LCPI2_12(%rip), %xmm0  # xmm0 = [99,108]
	movups	%xmm0, 112(%rax)
	movaps	.LCPI2_13(%rip), %xmm0  # xmm0 = [105,100]
	movups	%xmm0, 128(%rax)
	movaps	.LCPI2_14(%rip), %xmm0  # xmm0 = [32,71]
	movups	%xmm0, 144(%rax)
	movaps	.LCPI2_15(%rip), %xmm0  # xmm0 = [67,68]
	movups	%xmm0, 160(%rax)
	movaps	.LCPI2_16(%rip), %xmm0  # xmm0 = [32,116]
	movups	%xmm0, 176(%rax)
	movaps	.LCPI2_17(%rip), %xmm0  # xmm0 = [101,115]
	movups	%xmm0, 192(%rax)
	movaps	.LCPI2_18(%rip), %xmm0  # xmm0 = [116,32]
	movups	%xmm0, 208(%rax)
	movaps	.LCPI2_19(%rip), %xmm0  # xmm0 = [99,97]
	movups	%xmm0, 224(%rax)
	movaps	.LCPI2_20(%rip), %xmm0  # xmm0 = [115,101]
	movups	%xmm0, 240(%rax)
	movl	$32, %esi
	movq	%rax, %rdi
	callq	println_s
.LBB2_21:                               # %blklab13
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


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git 2af14cc4a90f43170f8ea9c1dfa0f71f46a0621c) (http://llvm.org/git/llvm.git 1e7e2b2b556977af8ccc12b7afba61302f3a2da9)"
	.section	".note.GNU-stack","",@progbits
