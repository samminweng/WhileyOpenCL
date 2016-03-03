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
	addq	$4096, %rdx             # imm = 0x1000
	cmpq	$31, %rdi
	jl	.LBB0_3
# BB#4:                                 # %polly.loop_exit40
                                        #   in Loop: Header=BB0_2 Depth=2
	subq	$-128, %rax
	cmpq	$31, %rsi
	leaq	1(%rsi), %rsi
	jl	.LBB0_2
# BB#5:                                 # %polly.loop_exit34
                                        #   in Loop: Header=BB0_1 Depth=1
	addq	$131072, %rcx           # imm = 0x20000
	cmpq	$31, %r8
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
	movl	$4096, %edi             # imm = 0x1000
	callq	malloc
	cmpl	$1024, %ebx             # imm = 0x400
	movslq	%ebx, %rcx
	jae	.LBB1_1
# BB#8:                                 # %polly.loop_preheader43
	leaq	Y+12288(,%rcx,4), %rcx
	movq	$-1, %rdx
	movl	$3, %esi
	.p2align	4, 0x90
.LBB1_9:                                # %polly.stmt.polly.stmt.for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	-12288(%rcx), %edi
	movl	%edi, -12(%rax,%rsi,4)
	movl	-8192(%rcx), %edi
	movl	%edi, -8(%rax,%rsi,4)
	movl	-4096(%rcx), %edi
	movl	%edi, -4(%rax,%rsi,4)
	movl	(%rcx), %edi
	movl	%edi, (%rax,%rsi,4)
	incq	%rdx
	addq	$4, %rsi
	addq	$16384, %rcx            # imm = 0x4000
	cmpq	$255, %rdx
	jl	.LBB1_9
	jmp	.LBB1_5
.LBB1_1:                                # %polly.split_new_and_old
	testq	%rcx, %rcx
	js	.LBB1_3
# BB#2:                                 # %polly.split_new_and_old
	cmpq	$1024, %rcx             # imm = 0x400
	jge	.LBB1_3
# BB#6:                                 # %polly.loop_preheader10
	leaq	Y+12288(,%rcx,4), %rcx
	movq	$-1, %rdx
	movl	$3, %esi
	.p2align	4, 0x90
.LBB1_7:                                # %polly.stmt.for.body13
                                        # =>This Inner Loop Header: Depth=1
	movl	-12288(%rcx), %edi
	movl	%edi, -12(%rax,%rsi,4)
	movl	-8192(%rcx), %edi
	movl	%edi, -8(%rax,%rsi,4)
	movl	-4096(%rcx), %edi
	movl	%edi, -4(%rax,%rsi,4)
	movl	(%rcx), %edi
	movl	%edi, (%rax,%rsi,4)
	incq	%rdx
	addq	$4, %rsi
	addq	$16384, %rcx            # imm = 0x4000
	cmpq	$255, %rdx
	jl	.LBB1_7
	jmp	.LBB1_5
.LBB1_3:                                # %for.body.preheader1
	leaq	Y+12288(,%rcx,4), %rcx
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB1_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	-12288(%rcx), %esi
	movl	%esi, (%rax,%rdx,4)
	movl	-8192(%rcx), %esi
	movl	%esi, 4(%rax,%rdx,4)
	movl	-4096(%rcx), %esi
	movl	%esi, 8(%rax,%rdx,4)
	movl	(%rcx), %esi
	movl	%esi, 12(%rax,%rdx,4)
	addq	$4, %rdx
	addq	$16384, %rcx            # imm = 0x4000
	cmpq	$1024, %rdx             # imm = 0x400
	jne	.LBB1_4
.LBB1_5:                                # %for.end
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
	movl	$0, -4(%rbp)
	addq	$240, %rdi
	addq	$240, %rsi
	movq	$-1, %rax
	.p2align	4, 0x90
.LBB2_1:                                # %polly.stmt.vector.body
                                        # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %ecx
	movl	%ecx, -12(%rbp)
	movd	%ecx, %xmm9
	movdqu	-240(%rdi), %xmm4
	movdqu	-224(%rdi), %xmm5
	movdqu	-208(%rdi), %xmm2
	movdqu	-192(%rdi), %xmm8
	movdqu	-240(%rsi), %xmm6
	movdqu	-224(%rsi), %xmm7
	movdqu	-208(%rsi), %xmm0
	movdqu	-192(%rsi), %xmm1
	pshufd	$245, %xmm6, %xmm3      # xmm3 = xmm6[1,1,3,3]
	pmuludq	%xmm4, %xmm6
	pshufd	$232, %xmm6, %xmm6      # xmm6 = xmm6[0,2,2,3]
	pshufd	$245, %xmm4, %xmm4      # xmm4 = xmm4[1,1,3,3]
	pmuludq	%xmm3, %xmm4
	pshufd	$232, %xmm4, %xmm3      # xmm3 = xmm4[0,2,2,3]
	punpckldq	%xmm3, %xmm6    # xmm6 = xmm6[0],xmm3[0],xmm6[1],xmm3[1]
	paddd	%xmm9, %xmm6
	pshufd	$245, %xmm7, %xmm3      # xmm3 = xmm7[1,1,3,3]
	pmuludq	%xmm5, %xmm7
	pshufd	$232, %xmm7, %xmm4      # xmm4 = xmm7[0,2,2,3]
	pshufd	$245, %xmm5, %xmm5      # xmm5 = xmm5[1,1,3,3]
	pmuludq	%xmm3, %xmm5
	pshufd	$232, %xmm5, %xmm3      # xmm3 = xmm5[0,2,2,3]
	punpckldq	%xmm3, %xmm4    # xmm4 = xmm4[0],xmm3[0],xmm4[1],xmm3[1]
	paddd	%xmm6, %xmm4
	pshufd	$245, %xmm0, %xmm3      # xmm3 = xmm0[1,1,3,3]
	pmuludq	%xmm2, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	pshufd	$245, %xmm2, %xmm2      # xmm2 = xmm2[1,1,3,3]
	pmuludq	%xmm3, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	punpckldq	%xmm2, %xmm0    # xmm0 = xmm0[0],xmm2[0],xmm0[1],xmm2[1]
	paddd	%xmm4, %xmm0
	pshufd	$245, %xmm1, %xmm2      # xmm2 = xmm1[1,1,3,3]
	pmuludq	%xmm8, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm8, %xmm3      # xmm3 = xmm8[1,1,3,3]
	pmuludq	%xmm2, %xmm3
	pshufd	$232, %xmm3, %xmm2      # xmm2 = xmm3[0,2,2,3]
	punpckldq	%xmm2, %xmm1    # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
	paddd	%xmm0, %xmm1
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
	movd	%xmm1, -4(%rbp)
	movd	%xmm1, -8(%rbp)
	incq	%rax
	addq	$256, %rsi              # imm = 0x100
	addq	$256, %rdi              # imm = 0x100
	cmpq	$15, %rax
	jl	.LBB2_1
# BB#2:                                 # %polly.exiting16
	movl	-8(%rbp), %eax
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
	cmpq	$1024, %rbx             # imm = 0x400
	jne	.LBB3_2
# BB#5:                                 # %for.end
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	$10, %edi
	movq	%rcx, %rsi
	callq	fputc
	incq	%r15
	addq	$4096, %r14             # imm = 0x1000
	cmpq	$1024, %r15             # imm = 0x400
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
	xorl	%r8d, %r8d
	movl	$112, %ecx
	movdqa	.LCPI4_0(%rip), %xmm0   # xmm0 = [1,1,1,1]
	.p2align	4, 0x90
.LBB4_1:                                # %polly.loop_preheader2.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_2 Depth 2
                                        #       Child Loop BB4_3 Depth 3
	movq	%rcx, %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB4_2:                                # %polly.loop_preheader8.i
                                        #   Parent Loop BB4_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_3 Depth 3
	movq	%rdx, %rdi
	movl	$32, %eax
	.p2align	4, 0x90
.LBB4_3:                                # %polly.loop_preheader20.i
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
	addq	$4096, %rdi             # imm = 0x1000
	decq	%rax
	jne	.LBB4_3
# BB#4:                                 # %polly.loop_exit9.i
                                        #   in Loop: Header=BB4_2 Depth=2
	incq	%rsi
	subq	$-128, %rdx
	cmpq	$32, %rsi
	jne	.LBB4_2
# BB#5:                                 # %polly.loop_exit3.i
                                        #   in Loop: Header=BB4_1 Depth=1
	incq	%r8
	addq	$131072, %rcx           # imm = 0x20000
	cmpq	$32, %r8
	jne	.LBB4_1
# BB#6:                                 # %polly.loop_preheader.preheader
	pushq	%rbp
.Ltmp17:
	.cfi_def_cfa_offset 16
.Ltmp18:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp19:
	.cfi_def_cfa_register %rbp
	subq	$4096, %rsp             # imm = 0x1000
	leaq	-4084(%rbp), %r8
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB4_7:                                # %polly.loop_preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_8 Depth 2
                                        #     Child Loop BB4_9 Depth 2
                                        #       Child Loop BB4_10 Depth 3
	movq	$-4194304, %rdx         # imm = 0xFFFFFFFFFFC00000
	movq	%r8, %rdi
	.p2align	4, 0x90
.LBB4_8:                                # %polly.stmt.for.body3
                                        #   Parent Loop BB4_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	Y+4194304(%rdx,%r9,4), %eax
	movl	%eax, -12(%rdi)
	movl	Y+4198400(%rdx,%r9,4), %eax
	movl	%eax, -8(%rdi)
	movl	Y+4202496(%rdx,%r9,4), %eax
	movl	%eax, -4(%rdi)
	movl	Y+4206592(%rdx,%r9,4), %eax
	movl	%eax, (%rdi)
	addq	$16, %rdi
	addq	$16384, %rdx            # imm = 0x4000
	movl	$X+240, %eax
	movl	$0, %esi
	jne	.LBB4_8
	.p2align	4, 0x90
.LBB4_9:                                # %for.body10
                                        #   Parent Loop BB4_7 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_10 Depth 3
	xorl	%edi, %edi
	movq	%rax, %rdx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB4_10:                               # %vector.body
                                        #   Parent Loop BB4_7 Depth=1
                                        #     Parent Loop BB4_9 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movd	%ecx, %xmm9
	movdqa	-240(%rdx), %xmm4
	movdqa	-224(%rdx), %xmm5
	movdqa	-208(%rdx), %xmm2
	movdqa	-192(%rdx), %xmm8
	movdqa	-4096(%rbp,%rdi), %xmm6
	movdqa	-4080(%rbp,%rdi), %xmm7
	movdqa	-4064(%rbp,%rdi), %xmm0
	movdqa	-4048(%rbp,%rdi), %xmm1
	pshufd	$245, %xmm6, %xmm3      # xmm3 = xmm6[1,1,3,3]
	pmuludq	%xmm4, %xmm6
	pshufd	$232, %xmm6, %xmm6      # xmm6 = xmm6[0,2,2,3]
	pshufd	$245, %xmm4, %xmm4      # xmm4 = xmm4[1,1,3,3]
	pmuludq	%xmm3, %xmm4
	pshufd	$232, %xmm4, %xmm3      # xmm3 = xmm4[0,2,2,3]
	punpckldq	%xmm3, %xmm6    # xmm6 = xmm6[0],xmm3[0],xmm6[1],xmm3[1]
	paddd	%xmm9, %xmm6
	pshufd	$245, %xmm7, %xmm3      # xmm3 = xmm7[1,1,3,3]
	pmuludq	%xmm5, %xmm7
	pshufd	$232, %xmm7, %xmm4      # xmm4 = xmm7[0,2,2,3]
	pshufd	$245, %xmm5, %xmm5      # xmm5 = xmm5[1,1,3,3]
	pmuludq	%xmm3, %xmm5
	pshufd	$232, %xmm5, %xmm3      # xmm3 = xmm5[0,2,2,3]
	punpckldq	%xmm3, %xmm4    # xmm4 = xmm4[0],xmm3[0],xmm4[1],xmm3[1]
	paddd	%xmm6, %xmm4
	pshufd	$245, %xmm0, %xmm3      # xmm3 = xmm0[1,1,3,3]
	pmuludq	%xmm2, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	pshufd	$245, %xmm2, %xmm2      # xmm2 = xmm2[1,1,3,3]
	pmuludq	%xmm3, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	punpckldq	%xmm2, %xmm0    # xmm0 = xmm0[0],xmm2[0],xmm0[1],xmm2[1]
	paddd	%xmm4, %xmm0
	pshufd	$245, %xmm1, %xmm2      # xmm2 = xmm1[1,1,3,3]
	pmuludq	%xmm8, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm8, %xmm3      # xmm3 = xmm8[1,1,3,3]
	pmuludq	%xmm2, %xmm3
	pshufd	$232, %xmm3, %xmm2      # xmm2 = xmm3[0,2,2,3]
	punpckldq	%xmm2, %xmm1    # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
	paddd	%xmm0, %xmm1
	movdqa	-176(%rdx), %xmm0
	movdqa	-4032(%rbp,%rdi), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	movdqa	-160(%rdx), %xmm0
	movdqa	-4016(%rbp,%rdi), %xmm1
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	paddd	%xmm2, %xmm1
	movdqa	-144(%rdx), %xmm0
	movdqa	-4000(%rbp,%rdi), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	movdqa	-128(%rdx), %xmm0
	movdqa	-3984(%rbp,%rdi), %xmm1
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	paddd	%xmm2, %xmm1
	movdqa	-112(%rdx), %xmm0
	movdqa	-3968(%rbp,%rdi), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	movdqa	-96(%rdx), %xmm0
	movdqa	-3952(%rbp,%rdi), %xmm1
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	paddd	%xmm2, %xmm1
	movdqa	-80(%rdx), %xmm0
	movdqa	-3936(%rbp,%rdi), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	movdqa	-64(%rdx), %xmm0
	movdqa	-3920(%rbp,%rdi), %xmm1
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	paddd	%xmm2, %xmm1
	movdqa	-48(%rdx), %xmm0
	movdqa	-3904(%rbp,%rdi), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	movdqa	-32(%rdx), %xmm0
	movdqa	-3888(%rbp,%rdi), %xmm1
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	paddd	%xmm2, %xmm1
	movdqa	-16(%rdx), %xmm0
	movdqa	-3872(%rbp,%rdi), %xmm2
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm1, %xmm2
	movdqa	(%rdx), %xmm0
	movdqa	-3856(%rbp,%rdi), %xmm1
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
	movd	%xmm1, %ecx
	addq	$256, %rdi              # imm = 0x100
	addq	$256, %rdx              # imm = 0x100
	cmpq	$4096, %rdi             # imm = 0x1000
	jne	.LBB4_10
# BB#11:                                # %dot.exit
                                        #   in Loop: Header=BB4_9 Depth=2
	movq	%rsi, %rdx
	shlq	$12, %rdx
	movl	%ecx, Z(%rdx,%r9,4)
	incq	%rsi
	addq	$4096, %rax             # imm = 0x1000
	cmpq	$1024, %rsi             # imm = 0x400
	jne	.LBB4_9
# BB#12:                                # %for.inc22
                                        #   in Loop: Header=BB4_7 Depth=1
	incq	%r9
	cmpq	$1024, %r9              # imm = 0x400
	jne	.LBB4_7
# BB#13:                                # %for.end24
	movl	Z+4194300(%rip), %r9d
	movl	$.L.str.2, %edi
	movl	$1024, %esi             # imm = 0x400
	movl	$1024, %edx             # imm = 0x400
	movl	$1023, %ecx             # imm = 0x3FF
	movl	$1023, %r8d             # imm = 0x3FF
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	addq	$4096, %rsp             # imm = 0x1000
	popq	%rbp
	retq
.Lfunc_end4:
	.size	main, .Lfunc_end4-main
	.cfi_endproc

	.type	X,@object               # @X
	.comm	X,4194304,16
	.type	Y,@object               # @Y
	.comm	Y,4194304,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d "
	.size	.L.str, 4

	.type	Z,@object               # @Z
	.comm	Z,4194304,16
	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"Pass %d X %d matrix test case (C[%d][%d]=%d)\n"
	.size	.L.str.2, 46


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
