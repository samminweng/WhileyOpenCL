	.text
	.file	"MatrixMult.vector.ll"
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
# BB#0:                                 # %polly.split_new_and_old
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
.LBB0_1:                                # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
                                        #       Child Loop BB0_3 Depth 3
	movq	%rcx, %rax
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB0_2:                                # %polly.loop_header32
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_3 Depth 3
	movq	$-1, %rdi
	movq	%rax, %rdx
	.p2align	4, 0x90
.LBB0_3:                                # %polly.stmt.polly.loop_preheader20
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	%xmm0, X-112(%rdx)
	movaps	%xmm0, Y-112(%rdx)
	movaps	%xmm0, X-96(%rdx)
	movaps	%xmm0, Y-96(%rdx)
	movaps	%xmm0, X-80(%rdx)
	movaps	%xmm0, Y-80(%rdx)
	movaps	%xmm0, X-64(%rdx)
	movaps	%xmm0, Y-64(%rdx)
	movaps	%xmm0, X-48(%rdx)
	movaps	%xmm0, Y-48(%rdx)
	movaps	%xmm0, X-32(%rdx)
	movaps	%xmm0, Y-32(%rdx)
	movaps	%xmm0, X-16(%rdx)
	movaps	%xmm0, Y-16(%rdx)
	movaps	%xmm0, X(%rdx)
	movaps	%xmm0, Y(%rdx)
	incq	%rdi
	addq	$8192, %rdx             # imm = 0x2000
	cmpq	$31, %rdi
	jl	.LBB0_3
# BB#4:                                 # %polly.loop_exit40
                                        #   in Loop: Header=BB0_2 Depth=2
	subq	$-128, %rax
	cmpq	$63, %rsi
	leaq	1(%rsi), %rsi
	jl	.LBB0_2
# BB#5:                                 # %polly.loop_exit34
                                        #   in Loop: Header=BB0_1 Depth=1
	addq	$262144, %rcx           # imm = 0x40000
	cmpq	$63, %r8
	leaq	1(%r8), %r8
	jl	.LBB0_1
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
	movslq	%ebx, %r9
	jae	.LBB1_1
# BB#12:                                # %polly.loop_preheader80
	leaq	12(%rax), %r8
	leaq	Y+24576(,%r9,4), %r10
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB1_13:                               # %polly.loop_header79
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_14 Depth 2
	movq	$-1, %rbx
	movq	%r10, %rsi
	movq	%r8, %rdx
	.p2align	4, 0x90
.LBB1_14:                               # %polly.stmt.polly.loop_preheader14
                                        #   Parent Loop BB1_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-24576(%rsi), %ecx
	movl	%ecx, -12(%rdx)
	movl	-16384(%rsi), %ecx
	movl	%ecx, -8(%rdx)
	movl	-8192(%rsi), %ecx
	movl	%ecx, -4(%rdx)
	movl	(%rsi), %ecx
	movl	%ecx, (%rdx)
	incq	%rbx
	addq	$16, %rdx
	addq	$32768, %rsi            # imm = 0x8000
	cmpq	$7, %rbx
	jl	.LBB1_14
# BB#15:                                # %polly.loop_exit87
                                        #   in Loop: Header=BB1_13 Depth=1
	addq	$256, %r8               # imm = 0x100
	addq	$524288, %r10           # imm = 0x80000
	cmpq	$31, %rdi
	leaq	1(%rdi), %rdi
	jl	.LBB1_13
# BB#16:                                # %polly.loop_preheader119
	movq	%rax, %r8
	addq	$140, %r8
	leaq	Y+286720(,%r9,4), %r9
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB1_17:                               # %polly.loop_header118
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_18 Depth 2
	movq	$-1, %rdi
	movq	%r9, %rcx
	movq	%r8, %rdx
	.p2align	4, 0x90
.LBB1_18:                               # %polly.stmt.polly.loop_preheader14.1
                                        #   Parent Loop BB1_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-24576(%rcx), %ebx
	movl	%ebx, -12(%rdx)
	movl	-16384(%rcx), %ebx
	movl	%ebx, -8(%rdx)
	movl	-8192(%rcx), %ebx
	movl	%ebx, -4(%rdx)
	movl	(%rcx), %ebx
	movl	%ebx, (%rdx)
	incq	%rdi
	addq	$16, %rdx
	addq	$32768, %rcx            # imm = 0x8000
	cmpq	$7, %rdi
	jl	.LBB1_18
# BB#19:                                # %polly.loop_exit126
                                        #   in Loop: Header=BB1_17 Depth=1
	addq	$256, %r8               # imm = 0x100
	addq	$524288, %r9            # imm = 0x80000
	cmpq	$31, %rsi
	leaq	1(%rsi), %rsi
	jl	.LBB1_17
	jmp	.LBB1_7
.LBB1_1:                                # %polly.split_new_and_old
	testq	%r9, %r9
	js	.LBB1_3
# BB#2:                                 # %polly.split_new_and_old
	cmpq	$2048, %r9              # imm = 0x800
	jge	.LBB1_3
# BB#8:                                 # %polly.loop_preheader37
	movq	%rax, %r8
	addq	$12, %r8
	leaq	Y+24576(,%r9,4), %r9
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB1_9:                                # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_10 Depth 2
	movq	$-1, %rdi
	movq	%r9, %rcx
	movq	%r8, %rdx
	movl	$60, %ebx
	.p2align	4, 0x90
.LBB1_10:                               # %polly.stmt.for.body3
                                        #   Parent Loop BB1_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-24576(%rcx), %esi
	movl	%esi, -12(%rdx)
	movl	-16384(%rcx), %esi
	movl	%esi, -8(%rdx)
	movl	-8192(%rcx), %esi
	movl	%esi, -4(%rdx)
	movl	(%rcx), %esi
	movl	%esi, (%rdx)
	incq	%rdi
	addq	$-4, %rbx
	addq	$16, %rdx
	addq	$32768, %rcx            # imm = 0x8000
	cmpq	$15, %rdi
	jl	.LBB1_10
# BB#11:                                # %polly.loop_exit40
                                        #   in Loop: Header=BB1_9 Depth=1
	addq	$256, %r8               # imm = 0x100
	addq	$524288, %r9            # imm = 0x80000
	cmpq	$31, %r10
	leaq	1(%r10), %r10
	jl	.LBB1_9
	jmp	.LBB1_7
.LBB1_3:                                # %for.cond1.preheader.preheader1
	movq	%rax, %r8
	addq	$12, %r8
	leaq	Y+24576(,%r9,4), %r9
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB1_4:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_5 Depth 2
	movq	%r9, %rdi
	movq	%r8, %rdx
	movl	$64, %ebx
	.p2align	4, 0x90
.LBB1_5:                                # %for.body3
                                        #   Parent Loop BB1_4 Depth=1
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
	jne	.LBB1_5
# BB#6:                                 # %for.inc10
                                        #   in Loop: Header=BB1_4 Depth=1
	incq	%rsi
	addq	$256, %r8               # imm = 0x100
	addq	$524288, %r9            # imm = 0x80000
	cmpq	$32, %rsi
	jne	.LBB1_4
.LBB1_7:                                # %for.end12
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
# BB#0:                                 # %polly.loop_preheader
	pushq	%rbp
.Ltmp7:
	.cfi_def_cfa_offset 16
.Ltmp8:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp9:
	.cfi_def_cfa_register %rbp
	subq	$128, %rsp
	addq	$240, %rdi
	addq	$240, %rsi
	movq	$-1, %rax
	.p2align	4, 0x90
.LBB2_1:                                # %polly.stmt.vector.body
                                        # =>This Inner Loop Header: Depth=1
	movdqu	-240(%rdi), %xmm2
	movdqu	-224(%rdi), %xmm3
	movdqu	-208(%rdi), %xmm4
	movdqu	-192(%rdi), %xmm8
	movdqu	-240(%rsi), %xmm5
	movdqu	-224(%rsi), %xmm6
	movdqu	-208(%rsi), %xmm7
	movdqu	-192(%rsi), %xmm1
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
	movdqu	-176(%rdi), %xmm0
	movdqu	-176(%rsi), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	movdqu	-160(%rdi), %xmm0
	movdqu	-160(%rsi), %xmm1
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	paddd	%xmm2, %xmm1
	movdqu	-144(%rdi), %xmm0
	movdqu	-144(%rsi), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	movdqu	-128(%rdi), %xmm0
	movdqu	-128(%rsi), %xmm1
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	paddd	%xmm2, %xmm1
	movdqu	-112(%rdi), %xmm0
	movdqu	-112(%rsi), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	movdqu	-96(%rdi), %xmm0
	movdqu	-96(%rsi), %xmm1
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	paddd	%xmm2, %xmm1
	movdqu	-80(%rdi), %xmm0
	movdqu	-80(%rsi), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	movdqu	-64(%rdi), %xmm0
	movdqu	-64(%rsi), %xmm1
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	paddd	%xmm2, %xmm1
	movdqu	-48(%rdi), %xmm0
	movdqu	-48(%rsi), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	movdqu	-32(%rdi), %xmm0
	movdqu	-32(%rsi), %xmm1
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	paddd	%xmm2, %xmm1
	movdqu	-16(%rdi), %xmm0
	movdqu	-16(%rsi), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	movdqu	(%rdi), %xmm0
	movdqu	(%rsi), %xmm1
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
	movd	%xmm1, -252(%rbp,%rax,4)
	incq	%rax
	addq	$256, %rsi              # imm = 0x100
	addq	$256, %rdi              # imm = 0x100
	cmpq	$31, %rax
	jl	.LBB2_1
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
# BB#0:                                 # %polly.split_new_and_old
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
	xorl	%r14d, %r14d
	movl	$112, %eax
	movaps	.LCPI4_0(%rip), %xmm0   # xmm0 = [1,1,1,1]
	movl	$Z, %r15d
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB4_1:                                # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_2 Depth 2
                                        #       Child Loop BB4_3 Depth 3
	movq	%rax, %rbx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB4_2:                                # %polly.loop_header1
                                        #   Parent Loop BB4_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_3 Depth 3
	movq	$-1, %rdi
	movq	%rbx, %rdx
	.p2align	4, 0x90
.LBB4_3:                                # %polly.stmt.polly.loop_preheader20.i
                                        #   Parent Loop BB4_1 Depth=1
                                        #     Parent Loop BB4_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	%xmm0, X-112(%rdx)
	movaps	%xmm0, Y-112(%rdx)
	movaps	%xmm0, X-96(%rdx)
	movaps	%xmm0, Y-96(%rdx)
	movaps	%xmm0, X-80(%rdx)
	movaps	%xmm0, Y-80(%rdx)
	movaps	%xmm0, X-64(%rdx)
	movaps	%xmm0, Y-64(%rdx)
	movaps	%xmm0, X-48(%rdx)
	movaps	%xmm0, Y-48(%rdx)
	movaps	%xmm0, X-32(%rdx)
	movaps	%xmm0, Y-32(%rdx)
	movaps	%xmm0, X-16(%rdx)
	movaps	%xmm0, Y-16(%rdx)
	movaps	%xmm0, X(%rdx)
	movaps	%xmm0, Y(%rdx)
	incq	%rdi
	addq	$8192, %rdx             # imm = 0x2000
	cmpq	$31, %rdi
	jl	.LBB4_3
# BB#4:                                 # %polly.loop_exit9
                                        #   in Loop: Header=BB4_2 Depth=2
	subq	$-128, %rbx
	cmpq	$63, %rsi
	leaq	1(%rsi), %rsi
	jl	.LBB4_2
# BB#5:                                 # %polly.loop_exit3
                                        #   in Loop: Header=BB4_1 Depth=1
	addq	$262144, %rax           # imm = 0x40000
	cmpq	$63, %rcx
	leaq	1(%rcx), %rcx
	jl	.LBB4_1
	.p2align	4, 0x90
.LBB4_6:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_7 Depth 2
	movl	%r14d, %esi
	callq	transpose
	movq	%rax, %r12
	movq	%r15, %r13
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB4_7:                                # %for.body3
                                        #   Parent Loop BB4_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	X(%rbx), %rdi
	movq	%r12, %rsi
	callq	dot
	movl	%eax, (%r13)
	addq	$8192, %rbx             # imm = 0x2000
	addq	$8192, %r13             # imm = 0x2000
	cmpq	$16777216, %rbx         # imm = 0x1000000
	jne	.LBB4_7
# BB#8:                                 # %for.inc10
                                        #   in Loop: Header=BB4_6 Depth=1
	incq	%r14
	addq	$4, %r15
	cmpq	$2048, %r14             # imm = 0x800
	jne	.LBB4_6
# BB#9:                                 # %for.end12
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
