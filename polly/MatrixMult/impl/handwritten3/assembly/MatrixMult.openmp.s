	.text
	.file	"MatrixMult.openmp.ll"
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
	pushq	%rbx
	pushq	%rax
.Ltmp3:
	.cfi_offset %rbx, -24
	leaq	-16(%rbp), %rbx
	movl	$init_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$64, %r8d
	movl	$1, %r9d
	movq	%rbx, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	init_polly_subfn
	callq	GOMP_parallel_end
	addq	$8, %rsp
	popq	%rbx
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
.Ltmp4:
	.cfi_def_cfa_offset 16
.Ltmp5:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp6:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$16, %rsp
.Ltmp7:
	.cfi_offset %rbx, -32
.Ltmp8:
	.cfi_offset %r14, -24
	movl	%esi, %ebx
	movl	$8192, %edi             # imm = 0x2000
	callq	malloc
	movq	%rax, %r14
	cmpl	$2048, %ebx             # imm = 0x800
	jae	.LBB1_1
# BB#8:                                 # %polly.parallel.for
	movl	%ebx, -32(%rbp)
	movq	%r14, -24(%rbp)
	leaq	-32(%rbp), %rbx
	movl	$transpose_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$2, %r8d
	movl	$1, %r9d
	movq	%rbx, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	transpose_polly_subfn
	callq	GOMP_parallel_end
	jmp	.LBB1_7
.LBB1_1:                                # %polly.split_new_and_old
	movslq	%ebx, %rcx
	testq	%rcx, %rcx
	js	.LBB1_3
# BB#2:                                 # %polly.split_new_and_old
	cmpq	$2048, %rcx             # imm = 0x800
	jge	.LBB1_3
# BB#9:                                 # %polly.parallel.for2
	movl	%ebx, -32(%rbp)
	movq	%r14, -24(%rbp)
	leaq	-32(%rbp), %rbx
	movl	$transpose_polly_subfn_1, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$32, %r8d
	movl	$1, %r9d
	movq	%rbx, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	transpose_polly_subfn_1
	callq	GOMP_parallel_end
	jmp	.LBB1_7
.LBB1_3:                                # %for.cond1.preheader.preheader1
	movq	%r14, %r8
	addq	$12, %r8
	leaq	Y+24576(,%rcx,4), %rcx
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB1_4:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_5 Depth 2
	movq	%rcx, %rsi
	movq	%r8, %rdi
	movl	$64, %ebx
	.p2align	4, 0x90
.LBB1_5:                                # %for.body3
                                        #   Parent Loop BB1_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
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
	jne	.LBB1_5
# BB#6:                                 # %for.inc10
                                        #   in Loop: Header=BB1_4 Depth=1
	incq	%rdx
	addq	$256, %r8               # imm = 0x100
	addq	$524288, %rcx           # imm = 0x80000
	cmpq	$32, %rdx
	jne	.LBB1_4
.LBB1_7:                                # %for.end12
	movq	%r14, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
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
.Ltmp9:
	.cfi_def_cfa_offset 16
.Ltmp10:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp11:
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
.Ltmp12:
	.cfi_def_cfa_offset 16
.Ltmp13:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp14:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
.Ltmp15:
	.cfi_offset %rbx, -48
.Ltmp16:
	.cfi_offset %r12, -40
.Ltmp17:
	.cfi_offset %r14, -32
.Ltmp18:
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

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp19:
	.cfi_def_cfa_offset 16
.Ltmp20:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp21:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
.Ltmp22:
	.cfi_offset %rbx, -56
.Ltmp23:
	.cfi_offset %r12, -48
.Ltmp24:
	.cfi_offset %r13, -40
.Ltmp25:
	.cfi_offset %r14, -32
.Ltmp26:
	.cfi_offset %r15, -24
	xorl	%r15d, %r15d
	leaq	-64(%rbp), %rbx
	movl	$init_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$64, %r8d
	movl	$1, %r9d
	movq	%rbx, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	init_polly_subfn
	callq	GOMP_parallel_end
	movl	$Z, %r14d
	movl	$Y+24576, %eax
	.p2align	4, 0x90
.LBB4_1:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_4 Depth 2
	movq	%rax, -72(%rbp)         # 8-byte Spill
	movl	$8192, %edi             # imm = 0x2000
	callq	malloc
	movq	%rax, %rbx
	cmpl	$2048, %r15d            # imm = 0x800
	jae	.LBB4_7
# BB#2:                                 # %polly.parallel.for.i
                                        #   in Loop: Header=BB4_1 Depth=1
	movl	%r15d, -64(%rbp)
	movq	%rbx, -56(%rbp)
	movl	$transpose_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$2, %r8d
	movl	$1, %r9d
	leaq	-64(%rbp), %r12
	movq	%r12, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%r12, %rdi
	callq	transpose_polly_subfn
	jmp	.LBB4_3
	.p2align	4, 0x90
.LBB4_7:                                # %polly.parallel.for
                                        #   in Loop: Header=BB4_1 Depth=1
	movq	%r15, -64(%rbp)
	movq	%r15, -56(%rbp)
	movq	%rbx, -48(%rbp)
	movl	$main_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$32, %r8d
	movl	$1, %r9d
	leaq	-64(%rbp), %r12
	movq	%r12, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%r12, %rdi
	callq	main_polly_subfn
.LBB4_3:                                # %for.body3
                                        #   in Loop: Header=BB4_1 Depth=1
	callq	GOMP_parallel_end
	movq	%r14, %r12
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB4_4:                                # %for.body3
                                        #   Parent Loop BB4_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	X(%r13), %rdi
	movq	%rbx, %rsi
	callq	dot
	movl	%eax, (%r12)
	addq	$8192, %r13             # imm = 0x2000
	addq	$8192, %r12             # imm = 0x2000
	cmpq	$16777216, %r13         # imm = 0x1000000
	jne	.LBB4_4
# BB#5:                                 # %for.inc10
                                        #   in Loop: Header=BB4_1 Depth=1
	incq	%r15
	movq	-72(%rbp), %rax         # 8-byte Reload
	addq	$4, %rax
	addq	$4, %r14
	cmpq	$2048, %r15             # imm = 0x800
	jne	.LBB4_1
# BB#6:                                 # %for.end12
	movl	Z+16777212(%rip), %r9d
	movl	$.L.str.2, %edi
	movl	$2048, %esi             # imm = 0x800
	movl	$2048, %edx             # imm = 0x800
	movl	$2047, %ecx             # imm = 0x7FF
	movl	$2047, %r8d             # imm = 0x7FF
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	addq	$40, %rsp
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

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI5_0:
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	1                       # 0x1
	.text
	.p2align	4, 0x90
	.type	init_polly_subfn,@function
init_polly_subfn:                       # @init_polly_subfn
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp27:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp28:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp29:
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
.Ltmp30:
	.cfi_def_cfa_offset 48
.Ltmp31:
	.cfi_offset %rbx, -32
.Ltmp32:
	.cfi_offset %r14, -24
.Ltmp33:
	.cfi_offset %r15, -16
	leaq	8(%rsp), %rdi
	leaq	(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB5_2
# BB#1:
	leaq	8(%rsp), %r14
	leaq	(%rsp), %r15
	.p2align	4, 0x90
.LBB5_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_7 Depth 2
                                        #       Child Loop BB5_8 Depth 3
                                        #         Child Loop BB5_9 Depth 4
	movq	(%rsp), %r8
	movq	8(%rsp), %rcx
	addq	$-2, %r8
	movq	%rcx, %rdx
	shlq	$18, %rdx
	orq	$112, %rdx
	.p2align	4, 0x90
.LBB5_7:                                # %polly.loop_preheader3
                                        #   Parent Loop BB5_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_8 Depth 3
                                        #         Child Loop BB5_9 Depth 4
	movq	%rdx, %rbx
	xorl	%edi, %edi
	movaps	.LCPI5_0(%rip), %xmm0   # xmm0 = [1,1,1,1]
	.p2align	4, 0x90
.LBB5_8:                                # %polly.loop_preheader9
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_7 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_9 Depth 4
	movq	%rbx, %rsi
	movl	$32, %eax
	.p2align	4, 0x90
.LBB5_9:                                # %vector.body
                                        #   Parent Loop BB5_4 Depth=1
                                        #     Parent Loop BB5_7 Depth=2
                                        #       Parent Loop BB5_8 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movaps	%xmm0, X-112(%rsi)
	movaps	%xmm0, Y-112(%rsi)
	movaps	%xmm0, X-96(%rsi)
	movaps	%xmm0, Y-96(%rsi)
	movaps	%xmm0, X-80(%rsi)
	movaps	%xmm0, Y-80(%rsi)
	movaps	%xmm0, X-64(%rsi)
	movaps	%xmm0, Y-64(%rsi)
	movaps	%xmm0, X-48(%rsi)
	movaps	%xmm0, Y-48(%rsi)
	movaps	%xmm0, X-32(%rsi)
	movaps	%xmm0, Y-32(%rsi)
	movaps	%xmm0, X-16(%rsi)
	movaps	%xmm0, Y-16(%rsi)
	movaps	%xmm0, X(%rsi)
	movaps	%xmm0, Y(%rsi)
	addq	$8192, %rsi             # imm = 0x2000
	decq	%rax
	jne	.LBB5_9
# BB#5:                                 # %polly.loop_exit10
                                        #   in Loop: Header=BB5_8 Depth=3
	incq	%rdi
	subq	$-128, %rbx
	cmpq	$64, %rdi
	jne	.LBB5_8
# BB#6:                                 # %polly.loop_exit4
                                        #   in Loop: Header=BB5_7 Depth=2
	addq	$262144, %rdx           # imm = 0x40000
	cmpq	%r8, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB5_7
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB5_4 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB5_4
.LBB5_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Lfunc_end5:
	.size	init_polly_subfn, .Lfunc_end5-init_polly_subfn
	.cfi_endproc

	.p2align	4, 0x90
	.type	transpose_polly_subfn,@function
transpose_polly_subfn:                  # @transpose_polly_subfn
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Ltmp34:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp35:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp36:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp37:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp38:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp39:
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
.Ltmp40:
	.cfi_def_cfa_offset 80
.Ltmp41:
	.cfi_offset %rbx, -56
.Ltmp42:
	.cfi_offset %r12, -48
.Ltmp43:
	.cfi_offset %r13, -40
.Ltmp44:
	.cfi_offset %r14, -32
.Ltmp45:
	.cfi_offset %r15, -24
.Ltmp46:
	.cfi_offset %rbp, -16
	movslq	(%rdi), %rbx
	movq	8(%rdi), %r12
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB6_2
# BB#1:                                 # %polly.par.loadIVBounds.preheader
	leaq	Y(,%rbx,4), %r13
	leaq	16(%rsp), %r14
	leaq	8(%rsp), %r15
	.p2align	4, 0x90
.LBB6_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_7 Depth 2
                                        #       Child Loop BB6_8 Depth 3
                                        #         Child Loop BB6_9 Depth 4
	movq	8(%rsp), %r8
	movq	16(%rsp), %r9
	addq	$-2, %r8
	movq	%r9, %r10
	shlq	$7, %r10
	addq	%r12, %r10
	movq	%r9, %r11
	shlq	$18, %r11
	addq	%r13, %r11
	.p2align	4, 0x90
.LBB6_7:                                # %polly.loop_preheader3
                                        #   Parent Loop BB6_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_8 Depth 3
                                        #         Child Loop BB6_9 Depth 4
	movq	%r11, %rcx
	movq	%r10, %rdx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB6_8:                                # %polly.loop_preheader9
                                        #   Parent Loop BB6_4 Depth=1
                                        #     Parent Loop BB6_7 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB6_9 Depth 4
	movq	%rcx, %rdi
	movq	%rdx, %rbx
	movl	$32, %esi
	.p2align	4, 0x90
.LBB6_9:                                # %polly.loop_header8
                                        #   Parent Loop BB6_4 Depth=1
                                        #     Parent Loop BB6_7 Depth=2
                                        #       Parent Loop BB6_8 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	(%rdi), %ebp
	movl	%ebp, (%rbx)
	addq	$4, %rbx
	addq	$8192, %rdi             # imm = 0x2000
	decq	%rsi
	jne	.LBB6_9
# BB#5:                                 # %polly.loop_exit10
                                        #   in Loop: Header=BB6_8 Depth=3
	incq	%rax
	addq	$256, %rdx              # imm = 0x100
	addq	$524288, %rcx           # imm = 0x80000
	cmpq	$32, %rax
	jne	.LBB6_8
# BB#6:                                 # %polly.loop_exit4
                                        #   in Loop: Header=BB6_7 Depth=2
	subq	$-128, %r10
	addq	$262144, %r11           # imm = 0x40000
	cmpq	%r8, %r9
	leaq	1(%r9), %r9
	jle	.LBB6_7
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB6_4 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB6_4
.LBB6_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end6:
	.size	transpose_polly_subfn, .Lfunc_end6-transpose_polly_subfn
	.cfi_endproc

	.p2align	4, 0x90
	.type	transpose_polly_subfn_1,@function
transpose_polly_subfn_1:                # @transpose_polly_subfn_1
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp47:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp48:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp49:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp50:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp51:
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
.Ltmp52:
	.cfi_def_cfa_offset 64
.Ltmp53:
	.cfi_offset %rbx, -48
.Ltmp54:
	.cfi_offset %r12, -40
.Ltmp55:
	.cfi_offset %r13, -32
.Ltmp56:
	.cfi_offset %r14, -24
.Ltmp57:
	.cfi_offset %r15, -16
	movq	8(%rdi), %r13
	addq	$12, %r13
	movslq	(%rdi), %rax
	leaq	Y+24576(,%rax,4), %r12
	leaq	8(%rsp), %r14
	leaq	(%rsp), %r15
	jmp	.LBB7_1
	.p2align	4, 0x90
.LBB7_2:                                # %polly.loop_preheader
                                        #   in Loop: Header=BB7_1 Depth=1
	movq	8(%rsp), %r9
	movq	(%rsp), %r8
	decq	%r8
	movq	%r9, %r10
	shlq	$8, %r10
	addq	%r13, %r10
	movq	%r9, %rbx
	shlq	$19, %rbx
	addq	%r12, %rbx
	.p2align	4, 0x90
.LBB7_3:                                # %polly.loop_header
                                        #   Parent Loop BB7_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_4 Depth 3
	movq	$-1, %rdi
	movq	%rbx, %rsi
	movq	%r10, %rdx
	movl	$60, %eax
	.p2align	4, 0x90
.LBB7_4:                                # %polly.stmt.for.body3
                                        #   Parent Loop BB7_1 Depth=1
                                        #     Parent Loop BB7_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-24576(%rsi), %ecx
	movl	%ecx, -12(%rdx)
	movl	-16384(%rsi), %ecx
	movl	%ecx, -8(%rdx)
	movl	-8192(%rsi), %ecx
	movl	%ecx, -4(%rdx)
	movl	(%rsi), %ecx
	movl	%ecx, (%rdx)
	incq	%rdi
	addq	$-4, %rax
	addq	$16, %rdx
	addq	$32768, %rsi            # imm = 0x8000
	cmpq	$15, %rdi
	jl	.LBB7_4
# BB#5:                                 # %polly.loop_exit4
                                        #   in Loop: Header=BB7_3 Depth=2
	leaq	-1(%r8), %rax
	addq	$256, %r10              # imm = 0x100
	addq	$524288, %rbx           # imm = 0x80000
	cmpq	%rax, %r9
	leaq	1(%r9), %r9
	jle	.LBB7_3
.LBB7_1:                                # %polly.par.checkNext
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_3 Depth 2
                                        #       Child Loop BB7_4 Depth 3
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB7_2
# BB#6:                                 # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
.Lfunc_end7:
	.size	transpose_polly_subfn_1, .Lfunc_end7-transpose_polly_subfn_1
	.cfi_endproc

	.p2align	4, 0x90
	.type	main_polly_subfn,@function
main_polly_subfn:                       # @main_polly_subfn
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp58:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp59:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp60:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp61:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp62:
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
.Ltmp63:
	.cfi_def_cfa_offset 64
.Ltmp64:
	.cfi_offset %rbx, -48
.Ltmp65:
	.cfi_offset %r12, -40
.Ltmp66:
	.cfi_offset %r13, -32
.Ltmp67:
	.cfi_offset %r14, -24
.Ltmp68:
	.cfi_offset %r15, -16
	movq	8(%rdi), %rax
	movq	16(%rdi), %r13
	addq	$12, %r13
	leaq	Y+24576(,%rax,4), %r12
	leaq	8(%rsp), %r14
	leaq	(%rsp), %r15
	jmp	.LBB8_1
	.p2align	4, 0x90
.LBB8_2:                                # %polly.loop_preheader
                                        #   in Loop: Header=BB8_1 Depth=1
	movq	8(%rsp), %r9
	movq	(%rsp), %r8
	decq	%r8
	movq	%r9, %r10
	shlq	$8, %r10
	addq	%r13, %r10
	movq	%r9, %rbx
	shlq	$19, %rbx
	addq	%r12, %rbx
	.p2align	4, 0x90
.LBB8_3:                                # %polly.loop_header
                                        #   Parent Loop BB8_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB8_4 Depth 3
	movq	$-1, %rdi
	movq	%rbx, %rsi
	movq	%r10, %rdx
	movl	$60, %eax
	.p2align	4, 0x90
.LBB8_4:                                # %polly.stmt.for.body3.i
                                        #   Parent Loop BB8_1 Depth=1
                                        #     Parent Loop BB8_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-24576(%rsi), %ecx
	movl	%ecx, -12(%rdx)
	movl	-16384(%rsi), %ecx
	movl	%ecx, -8(%rdx)
	movl	-8192(%rsi), %ecx
	movl	%ecx, -4(%rdx)
	movl	(%rsi), %ecx
	movl	%ecx, (%rdx)
	incq	%rdi
	addq	$-4, %rax
	addq	$16, %rdx
	addq	$32768, %rsi            # imm = 0x8000
	cmpq	$15, %rdi
	jl	.LBB8_4
# BB#5:                                 # %polly.loop_exit4
                                        #   in Loop: Header=BB8_3 Depth=2
	leaq	-1(%r8), %rax
	addq	$256, %r10              # imm = 0x100
	addq	$524288, %rbx           # imm = 0x80000
	cmpq	%rax, %r9
	leaq	1(%r9), %r9
	jle	.LBB8_3
.LBB8_1:                                # %polly.par.checkNext
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_3 Depth 2
                                        #       Child Loop BB8_4 Depth 3
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB8_2
# BB#6:                                 # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
.Lfunc_end8:
	.size	main_polly_subfn, .Lfunc_end8-main_polly_subfn
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
