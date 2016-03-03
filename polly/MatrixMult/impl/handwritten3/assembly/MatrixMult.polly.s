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
	subq	$128, %rsp
	leaq	-256(%rbp), %rax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB2_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movdqu	(%rdi,%rcx,4), %xmm0
	movdqu	(%rsi,%rcx,4), %xmm1
	pshufd	$245, %xmm1, %xmm2      # xmm2 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm2, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	movdqu	16(%rdi,%rcx,4), %xmm0
	movdqu	16(%rsi,%rcx,4), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	movdqu	32(%rdi,%rcx,4), %xmm0
	movdqu	32(%rsi,%rcx,4), %xmm1
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	paddd	%xmm2, %xmm1
	movdqu	48(%rdi,%rcx,4), %xmm0
	movdqu	48(%rsi,%rcx,4), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	movdqu	64(%rdi,%rcx,4), %xmm0
	movdqu	64(%rsi,%rcx,4), %xmm1
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	paddd	%xmm2, %xmm1
	movdqu	80(%rdi,%rcx,4), %xmm0
	movdqu	80(%rsi,%rcx,4), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	movdqu	96(%rdi,%rcx,4), %xmm0
	movdqu	96(%rsi,%rcx,4), %xmm1
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	paddd	%xmm2, %xmm1
	movdqu	112(%rdi,%rcx,4), %xmm0
	movdqu	112(%rsi,%rcx,4), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	movdqu	128(%rdi,%rcx,4), %xmm0
	movdqu	128(%rsi,%rcx,4), %xmm1
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	paddd	%xmm2, %xmm1
	movdqu	144(%rdi,%rcx,4), %xmm0
	movdqu	144(%rsi,%rcx,4), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	movdqu	160(%rdi,%rcx,4), %xmm0
	movdqu	160(%rsi,%rcx,4), %xmm1
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	paddd	%xmm2, %xmm1
	movdqu	176(%rdi,%rcx,4), %xmm0
	movdqu	176(%rsi,%rcx,4), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	movdqu	192(%rdi,%rcx,4), %xmm0
	movdqu	192(%rsi,%rcx,4), %xmm1
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	paddd	%xmm2, %xmm1
	movdqu	208(%rdi,%rcx,4), %xmm0
	movdqu	208(%rsi,%rcx,4), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	movdqu	224(%rdi,%rcx,4), %xmm0
	movdqu	224(%rsi,%rcx,4), %xmm1
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	paddd	%xmm2, %xmm1
	movdqu	240(%rdi,%rcx,4), %xmm0
	movdqu	240(%rsi,%rcx,4), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	pshufd	$78, %xmm2, %xmm0       # xmm0 = xmm2[2,3,0,1]
	paddd	%xmm2, %xmm0
	pshufd	$229, %xmm0, %xmm1      # xmm1 = xmm0[1,1,2,3]
	paddd	%xmm0, %xmm1
	movd	%xmm1, (%rax)
	addq	$64, %rcx
	addq	$4, %rax
	cmpq	$2048, %rcx             # imm = 0x800
	jne	.LBB2_1
# BB#2:                                 # %polly.stmt.for.inc22.preheader
	movl	-252(%rbp), %eax
	addl	-256(%rbp), %eax
	addl	-248(%rbp), %eax
	addl	-244(%rbp), %eax
	addl	-240(%rbp), %eax
	addl	-236(%rbp), %eax
	addl	-232(%rbp), %eax
	addl	-228(%rbp), %eax
	addl	-224(%rbp), %eax
	addl	-220(%rbp), %eax
	addl	-216(%rbp), %eax
	addl	-212(%rbp), %eax
	addl	-208(%rbp), %eax
	addl	-204(%rbp), %eax
	addl	-200(%rbp), %eax
	addl	-196(%rbp), %eax
	addl	-192(%rbp), %eax
	addl	-188(%rbp), %eax
	addl	-184(%rbp), %eax
	addl	-180(%rbp), %eax
	addl	-176(%rbp), %eax
	addl	-172(%rbp), %eax
	addl	-168(%rbp), %eax
	addl	-164(%rbp), %eax
	addl	-160(%rbp), %eax
	addl	-156(%rbp), %eax
	addl	-152(%rbp), %eax
	addl	-148(%rbp), %eax
	addl	-144(%rbp), %eax
	addl	-140(%rbp), %eax
	addl	-136(%rbp), %eax
	addl	-132(%rbp), %eax
	addq	$128, %rsp
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
	subq	$24, %rsp
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
	xorl	%r14d, %r14d
	movl	$112, %eax
	movaps	.LCPI4_0(%rip), %xmm0   # xmm0 = [1,1,1,1]
	movl	$Z, %r12d
	movl	$Y+286720, %ecx
	movq	%rcx, -48(%rbp)         # 8-byte Spill
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
	movl	$Y+24576, %ebx
	.p2align	4, 0x90
.LBB4_7:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_9 Depth 2
                                        #       Child Loop BB4_10 Depth 3
                                        #     Child Loop BB4_22 Depth 2
                                        #       Child Loop BB4_23 Depth 3
                                        #     Child Loop BB4_14 Depth 2
                                        #       Child Loop BB4_15 Depth 3
                                        #     Child Loop BB4_18 Depth 2
	movl	$8192, %edi             # imm = 0x2000
	callq	malloc
	movq	%rax, %r13
	cmpl	$2048, %r14d            # imm = 0x800
	jae	.LBB4_8
# BB#21:                                # %polly.loop_preheader.i
                                        #   in Loop: Header=BB4_7 Depth=1
	leaq	12(%r13), %r8
	movq	%rbx, %rcx
	movq	%rbx, -56(%rbp)         # 8-byte Spill
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB4_22:                               # %polly.loop_preheader8.i10
                                        #   Parent Loop BB4_7 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_23 Depth 3
	movq	%rcx, %rsi
	movq	%r8, %rdi
	movl	$32, %ebx
	.p2align	4, 0x90
.LBB4_23:                               # %polly.loop_header7.i
                                        #   Parent Loop BB4_7 Depth=1
                                        #     Parent Loop BB4_22 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-24576(%rsi), %eax
	movl	%eax, -12(%rdi)
	movl	-16384(%rsi), %eax
	movl	%eax, -8(%rdi)
	movl	-8192(%rsi), %eax
	movl	%eax, -4(%rdi)
	movl	(%rsi), %eax
	movl	%eax, (%rdi)
	addq	$16, %rdi
	addq	$32768, %rsi            # imm = 0x8000
	addq	$-4, %rbx
	jne	.LBB4_23
# BB#12:                                # %polly.loop_exit9.i5
                                        #   in Loop: Header=BB4_22 Depth=2
	incq	%rdx
	addq	$256, %r8               # imm = 0x100
	addq	$524288, %rcx           # imm = 0x80000
	cmpq	$32, %rdx
	jne	.LBB4_22
# BB#13:                                # %polly.loop_preheader8.1.i.preheader
                                        #   in Loop: Header=BB4_7 Depth=1
	movq	%r13, %r8
	addq	$140, %r8
	movq	-48(%rbp), %rcx         # 8-byte Reload
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB4_14:                               # %polly.loop_preheader8.1.i
                                        #   Parent Loop BB4_7 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_15 Depth 3
	movq	%rcx, %rsi
	movq	%r8, %rdi
	movl	$32, %ebx
	.p2align	4, 0x90
.LBB4_15:                               # %polly.loop_header7.1.i
                                        #   Parent Loop BB4_7 Depth=1
                                        #     Parent Loop BB4_14 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-24576(%rsi), %eax
	movl	%eax, -12(%rdi)
	movl	-16384(%rsi), %eax
	movl	%eax, -8(%rdi)
	movl	-8192(%rsi), %eax
	movl	%eax, -4(%rdi)
	movl	(%rsi), %eax
	movl	%eax, (%rdi)
	addq	$16, %rdi
	addq	$32768, %rsi            # imm = 0x8000
	addq	$-4, %rbx
	jne	.LBB4_15
# BB#16:                                # %polly.loop_exit9.1.i
                                        #   in Loop: Header=BB4_14 Depth=2
	incq	%rdx
	addq	$256, %r8               # imm = 0x100
	addq	$524288, %rcx           # imm = 0x80000
	cmpq	$32, %rdx
	jne	.LBB4_14
	jmp	.LBB4_17
	.p2align	4, 0x90
.LBB4_8:                                # %for.cond1.preheader.i.preheader
                                        #   in Loop: Header=BB4_7 Depth=1
	movq	%r13, %r8
	addq	$12, %r8
	movq	%rbx, %rcx
	movq	%rbx, -56(%rbp)         # 8-byte Spill
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB4_9:                                # %for.cond1.preheader.i
                                        #   Parent Loop BB4_7 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_10 Depth 3
	movq	%rcx, %rsi
	movq	%r8, %rdi
	movl	$64, %ebx
	.p2align	4, 0x90
.LBB4_10:                               # %for.body3.i
                                        #   Parent Loop BB4_7 Depth=1
                                        #     Parent Loop BB4_9 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-24576(%rsi), %eax
	movl	%eax, -12(%rdi)
	movl	-16384(%rsi), %eax
	movl	%eax, -8(%rdi)
	movl	-8192(%rsi), %eax
	movl	%eax, -4(%rdi)
	movl	(%rsi), %eax
	movl	%eax, (%rdi)
	addq	$16, %rdi
	addq	$32768, %rsi            # imm = 0x8000
	addq	$-4, %rbx
	jne	.LBB4_10
# BB#11:                                # %for.inc10.i
                                        #   in Loop: Header=BB4_9 Depth=2
	incq	%rdx
	addq	$256, %r8               # imm = 0x100
	addq	$524288, %rcx           # imm = 0x80000
	cmpq	$32, %rdx
	jne	.LBB4_9
.LBB4_17:                               #   in Loop: Header=BB4_7 Depth=1
	movq	%r12, %rbx
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB4_18:                               # %for.body3
                                        #   Parent Loop BB4_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	X(%r15), %rdi
	movq	%r13, %rsi
	callq	dot
	movl	%eax, (%rbx)
	addq	$8192, %r15             # imm = 0x2000
	addq	$8192, %rbx             # imm = 0x2000
	cmpq	$16777216, %r15         # imm = 0x1000000
	jne	.LBB4_18
# BB#19:                                # %for.inc10
                                        #   in Loop: Header=BB4_7 Depth=1
	incq	%r14
	movq	-56(%rbp), %rbx         # 8-byte Reload
	addq	$4, %rbx
	addq	$4, -48(%rbp)           # 8-byte Folded Spill
	addq	$4, %r12
	cmpq	$2048, %r14             # imm = 0x800
	jne	.LBB4_7
# BB#20:                                # %for.end12
	movl	Z+16777212(%rip), %r9d
	movl	$.L.str.2, %edi
	movl	$2048, %esi             # imm = 0x800
	movl	$2048, %edx             # imm = 0x800
	movl	$2047, %ecx             # imm = 0x7FF
	movl	$2047, %r8d             # imm = 0x7FF
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	addq	$24, %rsp
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
