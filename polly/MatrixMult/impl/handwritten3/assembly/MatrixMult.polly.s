	.text
	.file	"MatrixMult.polly.ll"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI0_0:
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	1                       # 0x1
	.text
	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp0:
	.cfi_def_cfa_offset 16
.Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp2:
	.cfi_def_cfa_register %rbp
	xorl	%r8d, %r8d
	movl	$112, %ecx
	movaps	.LCPI0_0(%rip), %xmm0   # xmm0 = [1,1,1,1]
	.p2align	4, 0x90
.LBB0_1:                                # %polly.loop_preheader2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
                                        #       Child Loop BB0_3 Depth 3
	movq	%rcx, %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB0_2:                                # %polly.loop_preheader8
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_3 Depth 3
	movq	%rdx, %rdi
	movl	$32, %eax
	.p2align	4, 0x90
.LBB0_3:                                # %vector.body
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	%xmm0, X-112(%rdi)
	movaps	%xmm0, Y-112(%rdi)
	movaps	%xmm0, X-96(%rdi)
	movaps	%xmm0, Y-96(%rdi)
	movaps	%xmm0, X-80(%rdi)
	movaps	%xmm0, Y-80(%rdi)
	movaps	%xmm0, X-64(%rdi)
	movaps	%xmm0, Y-64(%rdi)
	movaps	%xmm0, X-48(%rdi)
	movaps	%xmm0, Y-48(%rdi)
	movaps	%xmm0, X-32(%rdi)
	movaps	%xmm0, Y-32(%rdi)
	movaps	%xmm0, X-16(%rdi)
	movaps	%xmm0, Y-16(%rdi)
	movaps	%xmm0, X(%rdi)
	movaps	%xmm0, Y(%rdi)
	addq	$8192, %rdi             # imm = 0x2000
	decq	%rax
	jne	.LBB0_3
# BB#4:                                 # %polly.loop_exit9
                                        #   in Loop: Header=BB0_2 Depth=2
	incq	%rsi
	subq	$-128, %rdx
	cmpq	$64, %rsi
	jne	.LBB0_2
# BB#5:                                 # %polly.loop_exit3
                                        #   in Loop: Header=BB0_1 Depth=1
	incq	%r8
	addq	$262144, %rcx           # imm = 0x40000
	cmpq	$64, %r8
	jne	.LBB0_1
# BB#6:                                 # %polly.exiting
	popq	%rbp
	retq
.Lfunc_end0:
	.size	init, .Lfunc_end0-init
	.cfi_endproc

	.globl	transpose
	.p2align	4, 0x90
	.type	transpose,@function
transpose:                              # @transpose
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp3:
	.cfi_def_cfa_offset 16
.Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp5:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
.Ltmp6:
	.cfi_offset %rbx, -24
	movl	%esi, %ebx
	movl	$8192, %edi             # imm = 0x2000
	callq	malloc
	cmpl	$2048, %ebx             # imm = 0x800
	movslq	%ebx, %r8
	jae	.LBB1_1
# BB#11:                                # %polly.loop_preheader
	leaq	12(%rax), %r9
	leaq	Y+24576(,%r8,4), %r10
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB1_12:                               # %polly.loop_preheader8
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_13 Depth 2
	movq	%r10, %rsi
	movq	%r9, %rdx
	movl	$32, %ecx
	.p2align	4, 0x90
.LBB1_13:                               # %polly.loop_header7
                                        #   Parent Loop BB1_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-24576(%rsi), %ebx
	movl	%ebx, -12(%rdx)
	movl	-16384(%rsi), %ebx
	movl	%ebx, -8(%rdx)
	movl	-8192(%rsi), %ebx
	movl	%ebx, -4(%rdx)
	movl	(%rsi), %ebx
	movl	%ebx, (%rdx)
	addq	$16, %rdx
	addq	$32768, %rsi            # imm = 0x8000
	addq	$-4, %rcx
	jne	.LBB1_13
# BB#6:                                 # %polly.loop_exit9
                                        #   in Loop: Header=BB1_12 Depth=1
	incq	%rdi
	addq	$256, %r9               # imm = 0x100
	addq	$524288, %r10           # imm = 0x80000
	cmpq	$32, %rdi
	jne	.LBB1_12
# BB#7:                                 # %polly.loop_preheader8.1.preheader
	movq	%rax, %r9
	addq	$140, %r9
	leaq	Y+286720(,%r8,4), %r8
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB1_8:                                # %polly.loop_preheader8.1
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_9 Depth 2
	movq	%r8, %rdi
	movq	%r9, %rdx
	movl	$32, %ebx
	.p2align	4, 0x90
.LBB1_9:                                # %polly.loop_header7.1
                                        #   Parent Loop BB1_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-24576(%rdi), %ecx
	movl	%ecx, -12(%rdx)
	movl	-16384(%rdi), %ecx
	movl	%ecx, -8(%rdx)
	movl	-8192(%rdi), %ecx
	movl	%ecx, -4(%rdx)
	movl	(%rdi), %ecx
	movl	%ecx, (%rdx)
	addq	$16, %rdx
	addq	$32768, %rdi            # imm = 0x8000
	addq	$-4, %rbx
	jne	.LBB1_9
# BB#10:                                # %polly.loop_exit9.1
                                        #   in Loop: Header=BB1_8 Depth=1
	incq	%rsi
	addq	$256, %r9               # imm = 0x100
	addq	$524288, %r8            # imm = 0x80000
	cmpq	$32, %rsi
	jne	.LBB1_8
	jmp	.LBB1_5
.LBB1_1:                                # %for.cond1.preheader.preheader
	movq	%rax, %r9
	addq	$12, %r9
	leaq	Y+24576(,%r8,4), %r8
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB1_2:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_3 Depth 2
	movq	%r8, %rdi
	movq	%r9, %rdx
	movl	$64, %ebx
	.p2align	4, 0x90
.LBB1_3:                                # %for.body3
                                        #   Parent Loop BB1_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-24576(%rdi), %ecx
	movl	%ecx, -12(%rdx)
	movl	-16384(%rdi), %ecx
	movl	%ecx, -8(%rdx)
	movl	-8192(%rdi), %ecx
	movl	%ecx, -4(%rdx)
	movl	(%rdi), %ecx
	movl	%ecx, (%rdx)
	addq	$16, %rdx
	addq	$32768, %rdi            # imm = 0x8000
	addq	$-4, %rbx
	jne	.LBB1_3
# BB#4:                                 # %for.inc10
                                        #   in Loop: Header=BB1_2 Depth=1
	incq	%rsi
	addq	$256, %r9               # imm = 0x100
	addq	$524288, %r8            # imm = 0x80000
	cmpq	$32, %rsi
	jne	.LBB1_2
.LBB1_5:                                # %for.end12
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end1:
	.size	transpose, .Lfunc_end1-transpose
	.cfi_endproc

	.globl	dot
	.p2align	4, 0x90
	.type	dot,@function
dot:                                    # @dot
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp7:
	.cfi_def_cfa_offset 16
.Ltmp8:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp9:
	.cfi_def_cfa_register %rbp
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB2_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movdqu	(%rdi,%rcx), %xmm2
	movdqu	16(%rdi,%rcx), %xmm3
	movdqu	32(%rdi,%rcx), %xmm4
	movdqu	48(%rdi,%rcx), %xmm8
	movdqu	(%rsi,%rcx), %xmm5
	movdqu	16(%rsi,%rcx), %xmm6
	movdqu	32(%rsi,%rcx), %xmm7
	movdqu	48(%rsi,%rcx), %xmm1
	pshufd	$245, %xmm5, %xmm0      # xmm0 = xmm5[1,1,3,3]
	pmuludq	%xmm2, %xmm5
	pshufd	$232, %xmm5, %xmm5      # xmm5 = xmm5[0,2,2,3]
	pshufd	$245, %xmm2, %xmm2      # xmm2 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm0      # xmm0 = xmm2[0,2,2,3]
	punpckldq	%xmm0, %xmm5    # xmm5 = xmm5[0],xmm0[0],xmm5[1],xmm0[1]
	pshufd	$245, %xmm6, %xmm0      # xmm0 = xmm6[1,1,3,3]
	pmuludq	%xmm3, %xmm6
	pshufd	$232, %xmm6, %xmm2      # xmm2 = xmm6[0,2,2,3]
	pshufd	$245, %xmm3, %xmm3      # xmm3 = xmm3[1,1,3,3]
	pmuludq	%xmm0, %xmm3
	pshufd	$232, %xmm3, %xmm0      # xmm0 = xmm3[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm5, %xmm2
	pshufd	$245, %xmm7, %xmm0      # xmm0 = xmm7[1,1,3,3]
	pmuludq	%xmm4, %xmm7
	pshufd	$232, %xmm7, %xmm3      # xmm3 = xmm7[0,2,2,3]
	pshufd	$245, %xmm4, %xmm4      # xmm4 = xmm4[1,1,3,3]
	pmuludq	%xmm0, %xmm4
	pshufd	$232, %xmm4, %xmm0      # xmm0 = xmm4[0,2,2,3]
	punpckldq	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1]
	paddd	%xmm2, %xmm3
	pshufd	$245, %xmm1, %xmm0      # xmm0 = xmm1[1,1,3,3]
	pmuludq	%xmm8, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm8, %xmm2      # xmm2 = xmm8[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm0      # xmm0 = xmm2[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	paddd	%xmm3, %xmm1
	movdqu	64(%rdi,%rcx), %xmm0
	movdqu	64(%rsi,%rcx), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	movdqu	80(%rdi,%rcx), %xmm0
	movdqu	80(%rsi,%rcx), %xmm1
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	paddd	%xmm2, %xmm1
	movdqu	96(%rdi,%rcx), %xmm0
	movdqu	96(%rsi,%rcx), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	movdqu	112(%rdi,%rcx), %xmm0
	movdqu	112(%rsi,%rcx), %xmm1
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	paddd	%xmm2, %xmm1
	movdqu	128(%rdi,%rcx), %xmm0
	movdqu	128(%rsi,%rcx), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	movdqu	144(%rdi,%rcx), %xmm0
	movdqu	144(%rsi,%rcx), %xmm1
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	paddd	%xmm2, %xmm1
	movdqu	160(%rdi,%rcx), %xmm0
	movdqu	160(%rsi,%rcx), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	movdqu	176(%rdi,%rcx), %xmm0
	movdqu	176(%rsi,%rcx), %xmm1
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	paddd	%xmm2, %xmm1
	movdqu	192(%rdi,%rcx), %xmm0
	movdqu	192(%rsi,%rcx), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	movdqu	208(%rdi,%rcx), %xmm0
	movdqu	208(%rsi,%rcx), %xmm1
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	paddd	%xmm2, %xmm1
	movdqu	224(%rdi,%rcx), %xmm0
	movdqu	224(%rsi,%rcx), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	movdqu	240(%rdi,%rcx), %xmm0
	movdqu	240(%rsi,%rcx), %xmm1
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	paddd	%xmm2, %xmm1
	pshufd	$78, %xmm1, %xmm0       # xmm0 = xmm1[2,3,0,1]
	paddd	%xmm1, %xmm0
	pshufd	$229, %xmm0, %xmm1      # xmm1 = xmm0[1,1,2,3]
	paddd	%xmm0, %xmm1
	movd	%xmm1, %edx
	addl	%edx, %eax
	addq	$256, %rcx              # imm = 0x100
	cmpq	$8192, %rcx             # imm = 0x2000
	jne	.LBB2_1
# BB#2:                                 # %polly.exiting
	popq	%rbp
	retq
.Lfunc_end2:
	.size	dot, .Lfunc_end2-dot
	.cfi_endproc

	.globl	print_array
	.p2align	4, 0x90
	.type	print_array,@function
print_array:                            # @print_array
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp10:
	.cfi_def_cfa_offset 16
.Ltmp11:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp12:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
.Ltmp13:
	.cfi_offset %rbx, -48
.Ltmp14:
	.cfi_offset %r12, -40
.Ltmp15:
	.cfi_offset %r14, -32
.Ltmp16:
	.cfi_offset %r15, -24
	movl	$Z, %r14d
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB3_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_2 Depth 2
	movq	stdout(%rip), %rcx
	movq	%r14, %r12
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB3_2:                                # %for.body3
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	(%r12), %edx
	movl	$.L.str, %esi
	xorl	%eax, %eax
	movq	%rcx, %rdi
	callq	fprintf
	movslq	%ebx, %rax
	imulq	$1717986919, %rax, %rcx # imm = 0x66666667
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	shll	$4, %ecx
	leal	(%rcx,%rcx,4), %ecx
	subl	%ecx, %eax
	cmpl	$79, %eax
	jne	.LBB3_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB3_2 Depth=2
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	callq	fputc
.LBB3_4:                                # %for.inc
                                        #   in Loop: Header=BB3_2 Depth=2
	incq	%rbx
	movq	stdout(%rip), %rcx
	addq	$4, %r12
	cmpq	$2048, %rbx             # imm = 0x800
	jne	.LBB3_2
# BB#5:                                 # %for.end
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	$10, %edi
	movq	%rcx, %rsi
	callq	fputc
	incq	%r15
	addq	$8192, %r14             # imm = 0x2000
	cmpq	$2048, %r15             # imm = 0x800
	jne	.LBB3_1
# BB#6:                                 # %for.end11
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end3:
	.size	print_array, .Lfunc_end3-print_array
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI4_0:
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	1                       # 0x1
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp17:
	.cfi_def_cfa_offset 16
.Ltmp18:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp19:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
.Ltmp20:
	.cfi_offset %rbx, -56
.Ltmp21:
	.cfi_offset %r12, -48
.Ltmp22:
	.cfi_offset %r13, -40
.Ltmp23:
	.cfi_offset %r14, -32
.Ltmp24:
	.cfi_offset %r15, -24
	xorl	%r13d, %r13d
	movl	$112, %eax
	movdqa	.LCPI4_0(%rip), %xmm0   # xmm0 = [1,1,1,1]
	movl	$Y+24576, %r14d
	movl	$Y+286720, %r15d
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB4_1:                                # %polly.loop_preheader2.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_2 Depth 2
                                        #       Child Loop BB4_3 Depth 3
	movq	%rax, %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB4_2:                                # %polly.loop_preheader8.i
                                        #   Parent Loop BB4_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_3 Depth 3
	movq	%rdx, %rdi
	movl	$32, %ebx
	.p2align	4, 0x90
.LBB4_3:                                # %vector.body
                                        #   Parent Loop BB4_1 Depth=1
                                        #     Parent Loop BB4_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movdqa	%xmm0, X-112(%rdi)
	movdqa	%xmm0, Y-112(%rdi)
	movdqa	%xmm0, X-96(%rdi)
	movdqa	%xmm0, Y-96(%rdi)
	movdqa	%xmm0, X-80(%rdi)
	movdqa	%xmm0, Y-80(%rdi)
	movdqa	%xmm0, X-64(%rdi)
	movdqa	%xmm0, Y-64(%rdi)
	movdqa	%xmm0, X-48(%rdi)
	movdqa	%xmm0, Y-48(%rdi)
	movdqa	%xmm0, X-32(%rdi)
	movdqa	%xmm0, Y-32(%rdi)
	movdqa	%xmm0, X-16(%rdi)
	movdqa	%xmm0, Y-16(%rdi)
	movdqa	%xmm0, X(%rdi)
	movdqa	%xmm0, Y(%rdi)
	addq	$8192, %rdi             # imm = 0x2000
	decq	%rbx
	jne	.LBB4_3
# BB#4:                                 # %polly.loop_exit9.i
                                        #   in Loop: Header=BB4_2 Depth=2
	incq	%rsi
	subq	$-128, %rdx
	cmpq	$64, %rsi
	jne	.LBB4_2
# BB#5:                                 # %polly.loop_exit3.i
                                        #   in Loop: Header=BB4_1 Depth=1
	incq	%rcx
	addq	$262144, %rax           # imm = 0x40000
	cmpq	$64, %rcx
	jne	.LBB4_1
# BB#6:
	movl	$16777216, %eax         # imm = 0x1000000
	leaq	X(%rax), %r12
	.p2align	4, 0x90
.LBB4_7:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_8 Depth 2
                                        #       Child Loop BB4_9 Depth 3
                                        #     Child Loop BB4_24 Depth 2
                                        #       Child Loop BB4_25 Depth 3
                                        #     Child Loop BB4_21 Depth 2
                                        #       Child Loop BB4_22 Depth 3
                                        #     Child Loop BB4_14 Depth 2
                                        #       Child Loop BB4_15 Depth 3
                                        #     Child Loop BB4_27 Depth 2
                                        #       Child Loop BB4_28 Depth 3
	movl	$8192, %edi             # imm = 0x2000
	callq	malloc
	leaq	12(%rax), %r8
	movq	%r14, %r9
	xorl	%esi, %esi
	cmpl	$2048, %r13d            # imm = 0x800
	jae	.LBB4_8
	.p2align	4, 0x90
.LBB4_24:                               # %polly.loop_preheader8.i28
                                        #   Parent Loop BB4_7 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_25 Depth 3
	movq	%r9, %rdi
	movq	%r8, %rcx
	movl	$32, %ebx
	.p2align	4, 0x90
.LBB4_25:                               # %polly.loop_header7.i
                                        #   Parent Loop BB4_7 Depth=1
                                        #     Parent Loop BB4_24 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-24576(%rdi), %edx
	movl	%edx, -12(%rcx)
	movl	-16384(%rdi), %edx
	movl	%edx, -8(%rcx)
	movl	-8192(%rdi), %edx
	movl	%edx, -4(%rcx)
	movl	(%rdi), %edx
	movl	%edx, (%rcx)
	addq	$16, %rcx
	addq	$32768, %rdi            # imm = 0x8000
	addq	$-4, %rbx
	jne	.LBB4_25
# BB#19:                                # %polly.loop_exit9.i23
                                        #   in Loop: Header=BB4_24 Depth=2
	incq	%rsi
	addq	$256, %r8               # imm = 0x100
	addq	$524288, %r9            # imm = 0x80000
	cmpq	$32, %rsi
	jne	.LBB4_24
# BB#20:                                # %polly.loop_preheader8.1.i.preheader
                                        #   in Loop: Header=BB4_7 Depth=1
	leaq	140(%rax), %r8
	movq	%r15, %r9
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB4_21:                               # %polly.loop_preheader8.1.i
                                        #   Parent Loop BB4_7 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_22 Depth 3
	movq	%r9, %rdi
	movq	%r8, %rcx
	movl	$32, %ebx
	.p2align	4, 0x90
.LBB4_22:                               # %polly.loop_header7.1.i
                                        #   Parent Loop BB4_7 Depth=1
                                        #     Parent Loop BB4_21 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-24576(%rdi), %edx
	movl	%edx, -12(%rcx)
	movl	-16384(%rdi), %edx
	movl	%edx, -8(%rcx)
	movl	-8192(%rdi), %edx
	movl	%edx, -4(%rcx)
	movl	(%rdi), %edx
	movl	%edx, (%rcx)
	addq	$16, %rcx
	addq	$32768, %rdi            # imm = 0x8000
	addq	$-4, %rbx
	jne	.LBB4_22
# BB#23:                                # %polly.loop_exit9.1.i
                                        #   in Loop: Header=BB4_21 Depth=2
	incq	%rsi
	addq	$256, %r8               # imm = 0x100
	addq	$524288, %r9            # imm = 0x80000
	cmpq	$32, %rsi
	jne	.LBB4_21
	jmp	.LBB4_11
	.p2align	4, 0x90
.LBB4_8:                                # %for.cond1.preheader.i
                                        #   Parent Loop BB4_7 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_9 Depth 3
	movq	%r9, %rdi
	movq	%r8, %rcx
	movl	$64, %ebx
	.p2align	4, 0x90
.LBB4_9:                                # %for.body3.i
                                        #   Parent Loop BB4_7 Depth=1
                                        #     Parent Loop BB4_8 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-24576(%rdi), %edx
	movl	%edx, -12(%rcx)
	movl	-16384(%rdi), %edx
	movl	%edx, -8(%rcx)
	movl	-8192(%rdi), %edx
	movl	%edx, -4(%rcx)
	movl	(%rdi), %edx
	movl	%edx, (%rcx)
	addq	$16, %rcx
	addq	$32768, %rdi            # imm = 0x8000
	addq	$-4, %rbx
	jne	.LBB4_9
# BB#10:                                # %for.inc10.i
                                        #   in Loop: Header=BB4_8 Depth=2
	incq	%rsi
	addq	$256, %r8               # imm = 0x100
	addq	$524288, %r9            # imm = 0x80000
	cmpq	$32, %rsi
	jne	.LBB4_8
.LBB4_11:                               # %transpose.exit
                                        #   in Loop: Header=BB4_7 Depth=1
	leaq	8192(%rax), %rdx
	leaq	Z(,%r13,4), %rcx
	cmpq	%rcx, %rdx
	setbe	%dil
	leaq	Z+16769028(,%r13,4), %rsi
	cmpq	%rax, %rsi
	setbe	%r8b
	cmpq	%r12, %rcx
	setae	%dl
	movl	$X, %ebx
	cmpq	%rbx, %rsi
	setbe	%bl
	orb	%dl, %bl
	movzbl	%bl, %edx
	cmpl	$1, %edx
	jne	.LBB4_13
# BB#12:                                # %transpose.exit
                                        #   in Loop: Header=BB4_7 Depth=1
	orb	%dil, %r8b
	je	.LBB4_13
# BB#26:                                # %vector.ph45.preheader
                                        #   in Loop: Header=BB4_7 Depth=1
	movl	$X+48, %edx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB4_27:                               # %vector.ph45
                                        #   Parent Loop BB4_7 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_28 Depth 3
	pxor	%xmm0, %xmm0
	movq	%rdx, %rdi
	xorl	%ebx, %ebx
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB4_28:                               # %vector.body41
                                        #   Parent Loop BB4_7 Depth=1
                                        #     Parent Loop BB4_27 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movdqu	(%rax,%rbx,4), %xmm2
	movdqu	16(%rax,%rbx,4), %xmm4
	movdqa	-48(%rdi), %xmm5
	movdqa	-32(%rdi), %xmm6
	movdqa	-16(%rdi), %xmm7
	movdqa	(%rdi), %xmm8
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm5, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm5, %xmm5      # xmm5 = xmm5[1,1,3,3]
	pmuludq	%xmm3, %xmm5
	pshufd	$232, %xmm5, %xmm3      # xmm3 = xmm5[0,2,2,3]
	punpckldq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
	pshufd	$245, %xmm4, %xmm3      # xmm3 = xmm4[1,1,3,3]
	pmuludq	%xmm6, %xmm4
	pshufd	$232, %xmm4, %xmm4      # xmm4 = xmm4[0,2,2,3]
	pshufd	$245, %xmm6, %xmm5      # xmm5 = xmm6[1,1,3,3]
	pmuludq	%xmm3, %xmm5
	pshufd	$232, %xmm5, %xmm3      # xmm3 = xmm5[0,2,2,3]
	punpckldq	%xmm3, %xmm4    # xmm4 = xmm4[0],xmm3[0],xmm4[1],xmm3[1]
	paddd	%xmm0, %xmm2
	paddd	%xmm1, %xmm4
	movdqu	32(%rax,%rbx,4), %xmm0
	movdqu	48(%rax,%rbx,4), %xmm1
	pshufd	$245, %xmm0, %xmm3      # xmm3 = xmm0[1,1,3,3]
	pmuludq	%xmm7, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	pshufd	$245, %xmm7, %xmm5      # xmm5 = xmm7[1,1,3,3]
	pmuludq	%xmm3, %xmm5
	pshufd	$232, %xmm5, %xmm3      # xmm3 = xmm5[0,2,2,3]
	punpckldq	%xmm3, %xmm0    # xmm0 = xmm0[0],xmm3[0],xmm0[1],xmm3[1]
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm8, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm8, %xmm5      # xmm5 = xmm8[1,1,3,3]
	pmuludq	%xmm3, %xmm5
	pshufd	$232, %xmm5, %xmm3      # xmm3 = xmm5[0,2,2,3]
	punpckldq	%xmm3, %xmm1    # xmm1 = xmm1[0],xmm3[0],xmm1[1],xmm3[1]
	paddd	%xmm2, %xmm0
	paddd	%xmm4, %xmm1
	addq	$16, %rbx
	addq	$64, %rdi
	cmpq	$2048, %rbx             # imm = 0x800
	jne	.LBB4_28
# BB#29:                                # %middle.block42
                                        #   in Loop: Header=BB4_27 Depth=2
	paddd	%xmm0, %xmm1
	pshufd	$78, %xmm1, %xmm0       # xmm0 = xmm1[2,3,0,1]
	paddd	%xmm1, %xmm0
	pshufd	$229, %xmm0, %xmm1      # xmm1 = xmm0[1,1,2,3]
	paddd	%xmm0, %xmm1
	movq	%rsi, %rdi
	shlq	$13, %rdi
	movd	%xmm1, (%rcx,%rdi)
	incq	%rsi
	addq	$8192, %rdx             # imm = 0x2000
	cmpq	$2048, %rsi             # imm = 0x800
	jne	.LBB4_27
	jmp	.LBB4_17
	.p2align	4, 0x90
.LBB4_13:                               # %vector.ph65.preheader
                                        #   in Loop: Header=BB4_7 Depth=1
	movl	$X+48, %ecx
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB4_14:                               # %vector.ph65
                                        #   Parent Loop BB4_7 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_15 Depth 3
	pxor	%xmm0, %xmm0
	movq	%rcx, %rsi
	xorl	%edi, %edi
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB4_15:                               # %vector.body61
                                        #   Parent Loop BB4_7 Depth=1
                                        #     Parent Loop BB4_14 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movdqu	(%rax,%rdi,4), %xmm2
	movdqu	16(%rax,%rdi,4), %xmm4
	movdqa	-48(%rsi), %xmm5
	movdqa	-32(%rsi), %xmm6
	movdqa	-16(%rsi), %xmm7
	movdqa	(%rsi), %xmm8
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm5, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm5, %xmm5      # xmm5 = xmm5[1,1,3,3]
	pmuludq	%xmm3, %xmm5
	pshufd	$232, %xmm5, %xmm3      # xmm3 = xmm5[0,2,2,3]
	punpckldq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
	pshufd	$245, %xmm4, %xmm3      # xmm3 = xmm4[1,1,3,3]
	pmuludq	%xmm6, %xmm4
	pshufd	$232, %xmm4, %xmm4      # xmm4 = xmm4[0,2,2,3]
	pshufd	$245, %xmm6, %xmm5      # xmm5 = xmm6[1,1,3,3]
	pmuludq	%xmm3, %xmm5
	pshufd	$232, %xmm5, %xmm3      # xmm3 = xmm5[0,2,2,3]
	punpckldq	%xmm3, %xmm4    # xmm4 = xmm4[0],xmm3[0],xmm4[1],xmm3[1]
	paddd	%xmm0, %xmm2
	paddd	%xmm1, %xmm4
	movdqu	32(%rax,%rdi,4), %xmm0
	movdqu	48(%rax,%rdi,4), %xmm1
	pshufd	$245, %xmm0, %xmm3      # xmm3 = xmm0[1,1,3,3]
	pmuludq	%xmm7, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	pshufd	$245, %xmm7, %xmm5      # xmm5 = xmm7[1,1,3,3]
	pmuludq	%xmm3, %xmm5
	pshufd	$232, %xmm5, %xmm3      # xmm3 = xmm5[0,2,2,3]
	punpckldq	%xmm3, %xmm0    # xmm0 = xmm0[0],xmm3[0],xmm0[1],xmm3[1]
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm8, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm8, %xmm5      # xmm5 = xmm8[1,1,3,3]
	pmuludq	%xmm3, %xmm5
	pshufd	$232, %xmm5, %xmm3      # xmm3 = xmm5[0,2,2,3]
	punpckldq	%xmm3, %xmm1    # xmm1 = xmm1[0],xmm3[0],xmm1[1],xmm3[1]
	paddd	%xmm2, %xmm0
	paddd	%xmm4, %xmm1
	addq	$16, %rdi
	addq	$64, %rsi
	cmpq	$2048, %rdi             # imm = 0x800
	jne	.LBB4_15
# BB#16:                                # %middle.block62
                                        #   in Loop: Header=BB4_14 Depth=2
	paddd	%xmm0, %xmm1
	pshufd	$78, %xmm1, %xmm0       # xmm0 = xmm1[2,3,0,1]
	paddd	%xmm1, %xmm0
	pshufd	$229, %xmm0, %xmm1      # xmm1 = xmm0[1,1,2,3]
	paddd	%xmm0, %xmm1
	movq	%rdx, %rsi
	shlq	$13, %rsi
	movd	%xmm1, Z(%rsi,%r13,4)
	incq	%rdx
	addq	$8192, %rcx             # imm = 0x2000
	cmpq	$2048, %rdx             # imm = 0x800
	jne	.LBB4_14
.LBB4_17:                               # %for.end17
                                        #   in Loop: Header=BB4_7 Depth=1
	movq	%rax, %rdi
	callq	free
	incq	%r13
	addq	$4, %r14
	addq	$4, %r15
	cmpq	$2048, %r13             # imm = 0x800
	jne	.LBB4_7
# BB#18:                                # %for.end20
	movl	Z+16777212(%rip), %r9d
	movl	$.L.str.2, %edi
	movl	$2048, %esi             # imm = 0x800
	movl	$2048, %edx             # imm = 0x800
	movl	$2047, %ecx             # imm = 0x7FF
	movl	$2047, %r8d             # imm = 0x7FF
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end4:
	.size	main, .Lfunc_end4-main
	.cfi_endproc

	.type	X,@object               # @X
	.comm	X,16777216,16
	.type	Y,@object               # @Y
	.comm	Y,16777216,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d "
	.size	.L.str, 4

	.type	Z,@object               # @Z
	.comm	Z,16777216,16
	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"Pass %d X %d matrix test case (C[%d][%d]=%d)\n"
	.size	.L.str.2, 46


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
