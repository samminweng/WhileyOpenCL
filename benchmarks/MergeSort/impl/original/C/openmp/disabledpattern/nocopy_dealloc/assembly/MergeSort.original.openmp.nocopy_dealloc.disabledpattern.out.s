	.text
	.file	"llvm/MergeSort.original.openmp.nocopy_dealloc.disabledpattern.out.ll"
	.globl	_sortV1_
	.p2align	4, 0x90
	.type	_sortV1_,@function
_sortV1_:                               # @_sortV1_
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
	subq	$264, %rsp              # imm = 0x108
.Lcfi6:
	.cfi_def_cfa_offset 320
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
	movq	%r9, %rbx
	movq	%rcx, %r13
	movq	%rsi, %r15
	movq	$0, 256(%rsp)
	movq	$0, 248(%rsp)
	leaq	1(%r13), %rax
	cmpq	%r8, %rax
	jge	.LBB0_72
# BB#1:                                 # %if.end
	movq	%rbx, 88(%rsp)          # 8-byte Spill
	leaq	(%r8,%r13), %rax
	movq	%rax, %rbx
	shrq	$63, %rbx
	movq	%rax, 144(%rsp)         # 8-byte Spill
	addq	%rax, %rbx
	sarq	%rbx
	movq	%r15, %rsi
	movl	%r13d, %edx
	movl	%ebx, %ecx
	movq	%r8, 80(%rsp)           # 8-byte Spill
	movq	%rdi, %rbp
	callq	slice
	movq	%rbx, %r14
	subq	%r13, %r14
	xorl	%r12d, %r12d
	leaq	256(%rsp), %r9
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	%rax, %rdi
	movq	%r14, %rsi
	movq	%rbx, %r8
	callq	_sortV1_
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	%rbp, 40(%rsp)          # 8-byte Spill
	movq	%rbp, %rdi
	movq	80(%rsp), %rbp          # 8-byte Reload
	movq	%r15, %rsi
	movl	%ebx, %edx
	movl	%ebp, %ecx
	callq	slice
	movq	%rbp, %rsi
	subq	%rbx, %rsi
	leaq	248(%rsp), %r9
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	%rax, %rdi
	movq	%rsi, %r8
	callq	_sortV1_
	movq	%rbx, %r10
	movq	%rbp, %r11
	subq	%r10, %r11
	movq	%r13, 72(%rsp)          # 8-byte Spill
	movq	%r15, 240(%rsp)         # 8-byte Spill
	jle	.LBB0_11
# BB#2:                                 # %if.end
	movq	%rbp, %rcx
	subq	%r13, %rcx
	testq	%rcx, %rcx
	jle	.LBB0_11
# BB#3:                                 # %if.end
	testq	%r14, %r14
	movl	$0, %r13d
	movl	$0, %r15d
	movq	40(%rsp), %rdi          # 8-byte Reload
	movq	64(%rsp), %r9           # 8-byte Reload
	movq	56(%rsp), %rbx          # 8-byte Reload
	jle	.LBB0_12
# BB#4:                                 # %if.end77.preheader
	xorl	%r15d, %r15d
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB0_5:                                # %if.end77
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rbx,%r12,8), %rdx
	movq	(%r9,%r13,8), %rsi
	cmpq	%rsi, %rdx
	jle	.LBB0_7
# BB#6:                                 # %blklab3
                                        #   in Loop: Header=BB0_5 Depth=1
	movq	%rsi, (%rdi,%r15,8)
	incq	%r13
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_7:                                # %if.end82
                                        #   in Loop: Header=BB0_5 Depth=1
	movq	%rdx, (%rdi,%r15,8)
	incq	%r12
.LBB0_8:                                # %blklab4
                                        #   in Loop: Header=BB0_5 Depth=1
	incq	%r15
	cmpq	%r11, %r13
	jge	.LBB0_12
# BB#9:                                 # %blklab4
                                        #   in Loop: Header=BB0_5 Depth=1
	cmpq	%rcx, %r15
	jge	.LBB0_12
# BB#10:                                # %blklab4
                                        #   in Loop: Header=BB0_5 Depth=1
	cmpq	%r14, %r12
	jl	.LBB0_5
	jmp	.LBB0_12
.LBB0_11:
	xorl	%r13d, %r13d
	xorl	%r15d, %r15d
	movq	40(%rsp), %rdi          # 8-byte Reload
	movq	64(%rsp), %r9           # 8-byte Reload
	movq	56(%rsp), %rbx          # 8-byte Reload
.LBB0_12:                               # %while.cond90.preheader
	movq	%r14, %rdx
	subq	%r12, %rdx
	movq	%rax, 232(%rsp)         # 8-byte Spill
	jle	.LBB0_22
# BB#13:                                # %if.end96.lr.ph
	movq	%r11, 136(%rsp)         # 8-byte Spill
	movq	%r10, 104(%rsp)         # 8-byte Spill
	movq	72(%rsp), %rcx          # 8-byte Reload
	movq	%rcx, %rsi
	movq	%rcx, %rax
	negq	%rsi
	movq	%rsi, 128(%rsp)         # 8-byte Spill
	addq	%r15, %rdx
	movq	%rdx, 96(%rsp)          # 8-byte Spill
	movq	%r15, %rdx
	addq	%rdx, %rdx
	seto	23(%rsp)                # 1-byte Folded Spill
	addq	%rbp, %rdx
	seto	24(%rsp)                # 1-byte Folded Spill
	movq	%r12, %r9
	addq	%r9, %r9
	seto	30(%rsp)                # 1-byte Folded Spill
	movq	%rax, %rsi
	addq	%r9, %rsi
	seto	29(%rsp)                # 1-byte Folded Spill
	movq	%rsi, %rcx
	addq	$-1, %rcx
	seto	22(%rsp)                # 1-byte Folded Spill
	cmpq	%rcx, %rdx
	setge	36(%rsp)                # 1-byte Folded Spill
	movq	%rbp, %rcx
	addq	%rax, %rcx
	seto	28(%rsp)                # 1-byte Folded Spill
	cmpq	$0, 144(%rsp)           # 8-byte Folded Reload
	sets	39(%rsp)                # 1-byte Folded Spill
	setns	%r10b
	movq	%rsi, %rcx
	addq	$2, %rcx
	seto	27(%rsp)                # 1-byte Folded Spill
	cmpq	%rbp, %rcx
	setle	12(%rsp)                # 1-byte Folded Spill
	movq	%rsi, %r8
	incq	%r8
	seto	25(%rsp)                # 1-byte Folded Spill
	movq	%rsi, %rdi
	sarq	$63, %rdi
	incq	%rdi
	movq	%rdi, %rcx
	shlq	$62, %rcx
	sarq	$62, %rcx
	xorq	%rcx, %rdi
	setne	20(%rsp)                # 1-byte Folded Spill
	movq	%rdx, %rdi
	sarq	$63, %rdi
	cmpq	%rsi, %rdx
	sbbq	%rcx, %rdi
	setge	32(%rsp)                # 1-byte Folded Spill
	movabsq	$-1152921504606846976, %rdx # imm = 0xF000000000000000
	cmpq	%rdx, %r15
	setl	%dil
	cmpq	%rbp, %r8
	setle	38(%rsp)                # 1-byte Folded Spill
	cmpq	%rdx, %r12
	setl	%r11b
	movabsq	$1152921504606846975, %rcx # imm = 0xFFFFFFFFFFFFFFF
	cmpq	%rcx, %r12
	setg	34(%rsp)                # 1-byte Folded Spill
	cmpq	%rcx, %r15
	movabsq	$-9223372036854775808, %rcx # imm = 0x8000000000000000
	setg	37(%rsp)                # 1-byte Folded Spill
	cmpq	%rcx, %r12
	sete	35(%rsp)                # 1-byte Folded Spill
	cmpq	%rcx, %rax
	movq	%rbx, %r8
	sete	31(%rsp)                # 1-byte Folded Spill
	decq	%rcx
	addq	%rbp, %rcx
	seto	18(%rsp)                # 1-byte Folded Spill
	cmpq	%r9, %rcx
	movq	%rax, %rcx
	setge	33(%rsp)                # 1-byte Folded Spill
	negq	%rcx
	movq	144(%rsp), %r9          # 8-byte Reload
	seto	26(%rsp)                # 1-byte Folded Spill
	shrq	%r9
	movq	128(%rsp), %rdx         # 8-byte Reload
	movq	%rdx, %rcx
	addq	%r9, %rcx
	movq	%rdx, %rax
	seto	19(%rsp)                # 1-byte Folded Spill
	subq	%rbp, %rax
	seto	21(%rsp)                # 1-byte Folded Spill
	shrq	%rax
	movq	%rdx, %rsi
	subq	%rax, %rsi
	seto	17(%rsp)                # 1-byte Folded Spill
	movl	%r10d, %ebx
	andb	12(%rsp), %bl           # 1-byte Folded Reload
	cmovneq	%rcx, %rsi
	leaq	(%r8,%rsi,8), %rcx
	movq	40(%rsp), %rbp          # 8-byte Reload
	leaq	(%rbp,%r15,8), %rdx
	movq	%rdx, 216(%rsp)         # 8-byte Spill
	cmpq	%rdx, %rcx
	movq	%r15, %rcx
	setbe	%sil
	subq	72(%rsp), %rcx          # 8-byte Folded Reload
	seto	15(%rsp)                # 1-byte Folded Spill
	subq	%r12, %rcx
	movq	%rcx, %rdx
	seto	13(%rsp)                # 1-byte Folded Spill
	movq	%r9, 224(%rsp)          # 8-byte Spill
	addq	%r9, %rdx
	movq	%rax, %r9
	seto	14(%rsp)                # 1-byte Folded Spill
	subq	%r9, %rcx
	seto	16(%rsp)                # 1-byte Folded Spill
	testb	%bl, %bl
	cmovneq	%rdx, %rcx
	leaq	(%rbp,%rcx,8), %rcx
	leaq	(%r8,%r12,8), %rax
	movq	%rax, 208(%rsp)         # 8-byte Spill
	cmpq	%rax, %rcx
	setbe	%cl
	orb	%sil, %cl
	cmpb	$1, %cl
	jne	.LBB0_23
# BB#14:                                # %if.end96.lr.ph
	movb	39(%rsp), %al           # 1-byte Reload
	movb	36(%rsp), %bl           # 1-byte Reload
	andb	%al, %bl
	movb	12(%rsp), %bpl          # 1-byte Reload
	orb	%bpl, %bl
	movb	32(%rsp), %dl           # 1-byte Reload
	andb	%r10b, %dl
	movl	%edi, %ecx
	andb	%r10b, %cl
	andb	%bpl, %cl
	orb	%bl, %cl
	andb	%al, %dil
	movb	38(%rsp), %sil          # 1-byte Reload
	andb	%sil, %dil
	orb	%cl, %dil
	orb	%dl, %dil
	movl	%r11d, %ecx
	andb	%r10b, %cl
	andb	%bpl, %cl
	andb	%al, %r11b
	andb	%sil, %r11b
	orb	%cl, %r11b
	movb	34(%rsp), %bl           # 1-byte Reload
	movl	%ebx, %ecx
	andb	%r10b, %cl
	andb	%bpl, %cl
	orb	%r11b, %cl
	andb	%al, %bl
	andb	%sil, %bl
	orb	%cl, %bl
	movb	37(%rsp), %cl           # 1-byte Reload
	andb	%cl, %r10b
	andb	%bpl, %r10b
	orb	%bl, %r10b
	orb	%dil, %r10b
	andb	%al, %cl
	andb	%sil, %cl
	orb	35(%rsp), %cl           # 1-byte Folded Reload
	movb	31(%rsp), %al           # 1-byte Reload
	andb	33(%rsp), %al           # 1-byte Folded Reload
	orb	%cl, %al
	orb	%r10b, %al
	xorb	$1, %al
	testb	$1, %al
	je	.LBB0_23
# BB#15:                                # %if.end96.lr.ph
	movb	25(%rsp), %r10b         # 1-byte Reload
	movl	%r10d, %edx
	movb	23(%rsp), %bl           # 1-byte Reload
	orb	%bl, %dl
	movb	30(%rsp), %sil          # 1-byte Reload
	orb	%sil, %bl
	movb	24(%rsp), %cl           # 1-byte Reload
	orb	%cl, %bl
	movb	29(%rsp), %r11b         # 1-byte Reload
	orb	%r11b, %bl
	movb	28(%rsp), %dil          # 1-byte Reload
	movb	22(%rsp), %al           # 1-byte Reload
	orb	%dil, %al
	orb	%bl, %al
	orb	%cl, %dl
	movb	27(%rsp), %r8b          # 1-byte Reload
	movl	%r8d, %ecx
	orb	%sil, %cl
	orb	%r11b, %cl
	orb	%cl, %al
	orb	%sil, %dl
	orb	%al, %dl
	orb	%r11b, %dl
	movb	20(%rsp), %al           # 1-byte Reload
	orb	%dil, %al
	orb	%dl, %al
	orb	%r10b, %cl
	orb	%dil, %cl
	movl	%ecx, %edx
	orb	%r8b, %dl
	orb	%sil, %dl
	orb	%al, %dl
	movl	%r11d, %ebx
	orb	%r10b, %bl
	orb	%dil, %bl
	orb	%r8b, %bl
	orb	%sil, %bl
	orb	%r11b, %bl
	orb	%r10b, %bl
	orb	%dil, %bl
	orb	%dl, %bl
	orb	18(%rsp), %cl           # 1-byte Folded Reload
	orb	%sil, %cl
	orb	%r11b, %cl
	orb	%r8b, %cl
	orb	%bl, %cl
	movl	%edi, %edx
	movb	26(%rsp), %bl           # 1-byte Reload
	orb	%bl, %dl
	orb	19(%rsp), %dl           # 1-byte Folded Reload
	movb	21(%rsp), %al           # 1-byte Reload
	orb	%al, %dl
	orb	17(%rsp), %dl           # 1-byte Folded Reload
	orb	%sil, %dl
	orb	%r11b, %dl
	orb	%r8b, %dl
	orb	%dil, %dl
	orb	15(%rsp), %dl           # 1-byte Folded Reload
	orb	13(%rsp), %dl           # 1-byte Folded Reload
	orb	14(%rsp), %dl           # 1-byte Folded Reload
	orb	%cl, %dl
	orb	%al, %bl
	orb	16(%rsp), %bl           # 1-byte Folded Reload
	orb	%dl, %bl
	xorb	$1, %bl
	testb	$1, %bl
	je	.LBB0_23
# BB#16:                                # %polly.cond1007
	subq	%r12, 128(%rsp)         # 8-byte Folded Spill
	cmpq	$0, 144(%rsp)           # 8-byte Folded Reload
	js	.LBB0_29
# BB#17:                                # %polly.parallel.for1021
	movq	%r15, 152(%rsp)
	movq	128(%rsp), %r8          # 8-byte Reload
	movq	72(%rsp), %rax          # 8-byte Reload
	movq	%rax, 160(%rsp)
	movq	%r12, 168(%rsp)
	movq	80(%rsp), %rbp          # 8-byte Reload
	movq	%rbp, 176(%rsp)
	movq	48(%rsp), %rax          # 8-byte Reload
	movq	%rax, 184(%rsp)
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	%rax, 192(%rsp)
	movq	104(%rsp), %rax         # 8-byte Reload
	movq	%rax, 200(%rsp)
	addq	224(%rsp), %r8          # 8-byte Folded Reload
	leaq	152(%rsp), %rsi
	movl	$_sortV1__polly_subfn_3, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	movq	152(%rsp), %r15
	movq	168(%rsp), %r12
	movq	184(%rsp), %rbx
	movq	192(%rsp), %r14
	leaq	120(%rsp), %rdi
	leaq	112(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB0_34
# BB#18:                                # %polly.par.loadIVBounds.preheader.i
	leaq	(%rbx,%r12,8), %rbx
	leaq	(%r14,%r15,8), %r14
	leaq	120(%rsp), %r15
	leaq	112(%rsp), %r12
	.p2align	4, 0x90
.LBB0_19:                               # %polly.par.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_20 Depth 2
	movq	112(%rsp), %rax
	movq	120(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB0_20:                               # %polly.loop_header.i
                                        #   Parent Loop BB0_19 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%rbx,%rcx,8), %rdx
	movq	%rdx, 8(%r14,%rcx,8)
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB0_20
# BB#21:                                # %polly.par.checkNext.loopexit.i
                                        #   in Loop: Header=BB0_19 Depth=1
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_19
	jmp	.LBB0_34
.LBB0_22:
	movq	48(%rsp), %r8           # 8-byte Reload
	movq	88(%rsp), %rbx          # 8-byte Reload
	cmpq	%r11, %r13
	jl	.LBB0_51
	jmp	.LBB0_68
.LBB0_23:                               # %if.end96.preheader
	movq	104(%rsp), %r10         # 8-byte Reload
	movq	%r10, %rcx
	subq	%r12, %rcx
	subq	72(%rsp), %rcx          # 8-byte Folded Reload
	cmpq	$3, %rcx
	movq	%r15, %rsi
	movq	%r12, %rbp
	movq	88(%rsp), %rbx          # 8-byte Reload
	movq	40(%rsp), %rdi          # 8-byte Reload
	movq	136(%rsp), %r11         # 8-byte Reload
	jbe	.LBB0_41
# BB#24:                                # %min.iters.checked
	movq	%rcx, %r8
	andq	$-4, %r8
	movq	%r15, %rsi
	movq	%r12, %rbp
	je	.LBB0_41
# BB#25:                                # %vector.memcheck
	movq	56(%rsp), %rdx          # 8-byte Reload
	leaq	(%rdx,%r14,8), %rdx
	cmpq	%rdx, 216(%rsp)         # 8-byte Folded Reload
	jae	.LBB0_27
# BB#26:                                # %vector.memcheck
	leaq	(%r15,%r10), %rdx
	movq	72(%rsp), %rsi          # 8-byte Reload
	leaq	(%r12,%rsi), %rsi
	subq	%rsi, %rdx
	leaq	(%rdi,%rdx,8), %rdx
	cmpq	%rdx, 208(%rsp)         # 8-byte Folded Reload
	movq	%r15, %rsi
	movq	%r12, %rbp
	jb	.LBB0_41
.LBB0_27:                               # %vector.body.preheader
	leaq	-4(%r8), %rsi
	movq	%rsi, %rdx
	shrq	$2, %rdx
	btl	$2, %esi
	jb	.LBB0_35
# BB#28:                                # %vector.body.prol
	movq	56(%rsp), %rsi          # 8-byte Reload
	movups	(%rsi,%r12,8), %xmm0
	movups	16(%rsi,%r12,8), %xmm1
	movups	%xmm0, (%rdi,%r15,8)
	movups	%xmm1, 16(%rdi,%r15,8)
	movl	$4, %r9d
	testq	%rdx, %rdx
	jne	.LBB0_36
	jmp	.LBB0_38
.LBB0_29:                               # %polly.parallel.for1011
	movq	128(%rsp), %rbp         # 8-byte Reload
	subq	%r9, %rbp
	movq	%r15, 152(%rsp)
	movq	%rbp, %r8
	movq	72(%rsp), %rax          # 8-byte Reload
	movq	%rax, 160(%rsp)
	movq	%r12, 168(%rsp)
	movq	80(%rsp), %rbp          # 8-byte Reload
	movq	%rbp, 176(%rsp)
	movq	48(%rsp), %rax          # 8-byte Reload
	movq	%rax, 184(%rsp)
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	%rax, 192(%rsp)
	movq	104(%rsp), %rax         # 8-byte Reload
	movq	%rax, 200(%rsp)
	leaq	152(%rsp), %rsi
	movl	$_sortV1__polly_subfn_2, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	movq	152(%rsp), %r15
	movq	168(%rsp), %r12
	movq	184(%rsp), %rbx
	movq	192(%rsp), %r14
	leaq	120(%rsp), %rdi
	leaq	112(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB0_34
# BB#30:                                # %polly.par.loadIVBounds.preheader.i1040
	leaq	(%rbx,%r12,8), %rbx
	leaq	(%r14,%r15,8), %r14
	leaq	120(%rsp), %r15
	leaq	112(%rsp), %r12
	.p2align	4, 0x90
.LBB0_31:                               # %polly.par.loadIVBounds.i1045
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_32 Depth 2
	movq	112(%rsp), %rax
	movq	120(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB0_32:                               # %polly.loop_header.i1052
                                        #   Parent Loop BB0_31 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%rbx,%rcx,8), %rdx
	movq	%rdx, 8(%r14,%rcx,8)
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB0_32
# BB#33:                                # %polly.par.checkNext.loopexit.i1041
                                        #   in Loop: Header=BB0_31 Depth=1
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_31
.LBB0_34:                               # %_sortV1__polly_subfn_2.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movq	88(%rsp), %rbx          # 8-byte Reload
	movq	40(%rsp), %rdi          # 8-byte Reload
	movq	48(%rsp), %r8           # 8-byte Reload
	movq	104(%rsp), %r10         # 8-byte Reload
	movq	64(%rsp), %r9           # 8-byte Reload
	movq	136(%rsp), %r11         # 8-byte Reload
	jmp	.LBB0_50
.LBB0_35:
	xorl	%r9d, %r9d
	testq	%rdx, %rdx
	je	.LBB0_38
.LBB0_36:                               # %vector.body.preheader.new
	movq	%r8, %rsi
	subq	%r9, %rsi
	leaq	(%r12,%r9), %rdx
	movq	%rbx, %r14
	movq	56(%rsp), %rbx          # 8-byte Reload
	leaq	48(%rbx,%rdx,8), %rbp
	movq	%r14, %rbx
	addq	%r15, %r9
	leaq	48(%rdi,%r9,8), %rdx
	.p2align	4, 0x90
.LBB0_37:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movups	-48(%rbp), %xmm0
	movups	-32(%rbp), %xmm1
	movups	%xmm0, -48(%rdx)
	movups	%xmm1, -32(%rdx)
	movups	-16(%rbp), %xmm0
	movups	(%rbp), %xmm1
	movups	%xmm0, -16(%rdx)
	movups	%xmm1, (%rdx)
	addq	$64, %rbp
	addq	$64, %rdx
	addq	$-8, %rsi
	jne	.LBB0_37
.LBB0_38:                               # %middle.block
	cmpq	%r8, %rcx
	jne	.LBB0_40
# BB#39:
	movq	80(%rsp), %rbp          # 8-byte Reload
	movq	48(%rsp), %r8           # 8-byte Reload
	movq	64(%rsp), %r9           # 8-byte Reload
	jmp	.LBB0_50
.LBB0_40:
	leaq	(%r15,%r8), %rsi
	addq	%r12, %r8
	movq	%r8, %rbp
.LBB0_41:                               # %if.end96.preheader1123
	leaq	(%r15,%r10), %rcx
	movl	%ecx, %edx
	subl	%esi, %edx
	subl	%r12d, %edx
	movq	72(%rsp), %rbx          # 8-byte Reload
	subl	%ebx, %edx
	leaq	-1(%r15,%r10), %r14
	subq	%rsi, %r14
	subq	%r12, %r14
	subq	%rbx, %r14
	andq	$3, %rdx
	je	.LBB0_44
# BB#42:                                # %if.end96.prol.preheader
	negq	%rdx
	movq	48(%rsp), %r8           # 8-byte Reload
	movq	64(%rsp), %r9           # 8-byte Reload
	movq	56(%rsp), %rax          # 8-byte Reload
	.p2align	4, 0x90
.LBB0_43:                               # %if.end96.prol
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rax,%rbp,8), %rbx
	movq	%rbx, (%rdi,%rsi,8)
	incq	%rsi
	incq	%rbp
	incq	%rdx
	jne	.LBB0_43
	jmp	.LBB0_45
.LBB0_44:
	movq	48(%rsp), %r8           # 8-byte Reload
	movq	64(%rsp), %r9           # 8-byte Reload
.LBB0_45:                               # %if.end96.prol.loopexit
	cmpq	$3, %r14
	jae	.LBB0_47
# BB#46:
	movq	88(%rsp), %rbx          # 8-byte Reload
	jmp	.LBB0_49
.LBB0_47:                               # %if.end96.preheader1123.new
	subq	%rsi, %rcx
	subq	%r12, %rcx
	subq	72(%rsp), %rcx          # 8-byte Folded Reload
	leaq	24(%rdi,%rsi,8), %rax
	movq	56(%rsp), %rdx          # 8-byte Reload
	leaq	24(%rdx,%rbp,8), %rdx
	movq	88(%rsp), %rbx          # 8-byte Reload
	.p2align	4, 0x90
.LBB0_48:                               # %if.end96
                                        # =>This Inner Loop Header: Depth=1
	movq	-24(%rdx), %rsi
	movq	%rsi, -24(%rax)
	movq	-16(%rdx), %rsi
	movq	%rsi, -16(%rax)
	movq	-8(%rdx), %rsi
	movq	%rsi, -8(%rax)
	movq	(%rdx), %rsi
	movq	%rsi, (%rax)
	addq	$32, %rax
	addq	$32, %rdx
	addq	$-4, %rcx
	jne	.LBB0_48
.LBB0_49:
	movq	80(%rsp), %rbp          # 8-byte Reload
.LBB0_50:
	movq	96(%rsp), %r15          # 8-byte Reload
	cmpq	%r11, %r13
	jge	.LBB0_68
.LBB0_51:                               # %if.end107.preheader
	movq	%rbp, %rax
	subq	%r13, %rax
	subq	%r10, %rax
	cmpq	$3, %rax
	jbe	.LBB0_62
# BB#52:                                # %min.iters.checked1084
	movq	%rax, %rcx
	andq	$-4, %rcx
	je	.LBB0_62
# BB#53:                                # %vector.memcheck1101
	leaq	(%rdi,%r15,8), %rdx
	leaq	(%r9,%r11,8), %rsi
	cmpq	%rsi, %rdx
	jae	.LBB0_55
# BB#54:                                # %vector.memcheck1101
	leaq	(%r15,%rbp), %rdx
	leaq	(%r13,%r10), %rsi
	subq	%rsi, %rdx
	leaq	(%rdi,%rdx,8), %rdx
	leaq	(%r9,%r13,8), %rsi
	cmpq	%rdx, %rsi
	jb	.LBB0_62
.LBB0_55:                               # %vector.body1080.preheader
	leaq	-4(%rcx), %rsi
	movq	%rsi, %rdx
	shrq	$2, %rdx
	btl	$2, %esi
	jb	.LBB0_57
# BB#56:                                # %vector.body1080.prol
	movups	(%r9,%r13,8), %xmm0
	movups	16(%r9,%r13,8), %xmm1
	movq	%r15, %rsi
	movups	%xmm0, (%rdi,%rsi,8)
	movups	%xmm1, 16(%rdi,%rsi,8)
	movl	$4, %ebp
	testq	%rdx, %rdx
	jne	.LBB0_58
	jmp	.LBB0_60
.LBB0_57:
	xorl	%ebp, %ebp
	testq	%rdx, %rdx
	je	.LBB0_60
.LBB0_58:                               # %vector.body1080.preheader.new
	movq	%rcx, %rdx
	subq	%rbp, %rdx
	leaq	(%r13,%rbp), %rsi
	leaq	48(%r9,%rsi,8), %rsi
	addq	%r15, %rbp
	leaq	48(%rdi,%rbp,8), %rbp
	.p2align	4, 0x90
.LBB0_59:                               # %vector.body1080
                                        # =>This Inner Loop Header: Depth=1
	movups	-48(%rsi), %xmm0
	movups	-32(%rsi), %xmm1
	movups	%xmm0, -48(%rbp)
	movups	%xmm1, -32(%rbp)
	movups	-16(%rsi), %xmm0
	movups	(%rsi), %xmm1
	movups	%xmm0, -16(%rbp)
	movups	%xmm1, (%rbp)
	addq	$64, %rsi
	addq	$64, %rbp
	addq	$-8, %rdx
	jne	.LBB0_59
.LBB0_60:                               # %middle.block1081
	cmpq	%rcx, %rax
	movq	80(%rsp), %rbp          # 8-byte Reload
	je	.LBB0_68
# BB#61:
	addq	%rcx, %r15
	addq	%rcx, %r13
.LBB0_62:                               # %if.end107.preheader1122
	movl	%ebp, %ecx
	subl	%r13d, %ecx
	subl	%r10d, %ecx
	leaq	-1(%rbp), %rax
	subq	%r13, %rax
	subq	%r10, %rax
	andq	$3, %rcx
	je	.LBB0_65
# BB#63:                                # %if.end107.prol.preheader
	negq	%rcx
	.p2align	4, 0x90
.LBB0_64:                               # %if.end107.prol
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r9,%r13,8), %rdx
	movq	%rdx, (%rdi,%r15,8)
	incq	%r15
	incq	%r13
	incq	%rcx
	jne	.LBB0_64
.LBB0_65:                               # %if.end107.prol.loopexit
	cmpq	$3, %rax
	jb	.LBB0_68
# BB#66:                                # %if.end107.preheader1122.new
	leaq	24(%rdi,%r15,8), %rax
	subq	%r13, %rbp
	subq	%r10, %rbp
	leaq	24(%r9,%r13,8), %rcx
	.p2align	4, 0x90
.LBB0_67:                               # %if.end107
                                        # =>This Inner Loop Header: Depth=1
	movq	-24(%rcx), %rdx
	movq	%rdx, -24(%rax)
	movq	-16(%rcx), %rdx
	movq	%rdx, -16(%rax)
	movq	-8(%rcx), %rdx
	movq	%rdx, -8(%rax)
	movq	(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$32, %rax
	addq	$32, %rcx
	addq	$-4, %rbp
	jne	.LBB0_67
.LBB0_68:                               # %if.end114
	testq	%r8, %r8
	je	.LBB0_70
# BB#69:                                # %if.then116
	movq	%r8, %rdi
	callq	free
	movq	40(%rsp), %rdi          # 8-byte Reload
.LBB0_70:                               # %if.end117
	movq	232(%rsp), %rax         # 8-byte Reload
	testq	%rax, %rax
	movq	240(%rsp), %r15         # 8-byte Reload
	je	.LBB0_72
# BB#71:                                # %if.then119
	movq	%rax, %rdi
	callq	free
	movq	40(%rsp), %rdi          # 8-byte Reload
.LBB0_72:                               # %if.end132
	movq	%r15, (%rbx)
	movq	%rdi, %rax
	addq	$264, %rsp              # imm = 0x108
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end0:
	.size	_sortV1_, .Lfunc_end0-_sortV1_
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
	.quad	77                      # 0x4d
.LCPI1_3:
	.quad	101                     # 0x65
	.quad	114                     # 0x72
.LCPI1_4:
	.quad	103                     # 0x67
	.quad	101                     # 0x65
.LCPI1_5:
	.quad	115                     # 0x73
	.quad	111                     # 0x6f
.LCPI1_6:
	.quad	114                     # 0x72
	.quad	116                     # 0x74
.LCPI1_7:
	.quad	32                      # 0x20
	.quad	116                     # 0x74
.LCPI1_8:
	.quad	101                     # 0x65
	.quad	115                     # 0x73
.LCPI1_9:
	.quad	116                     # 0x74
	.quad	32                      # 0x20
.LCPI1_10:
	.quad	99                      # 0x63
	.quad	97                      # 0x61
.LCPI1_11:
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
# BB#10:                                # %polly.parallel.for
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
	je	.LBB1_15
# BB#11:
	leaq	16(%rsp), %r13
	leaq	8(%rsp), %rbp
	.p2align	4, 0x90
.LBB1_13:                               # %polly.par.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_14 Depth 2
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	addq	$-2, %rax
	movq	%rbx, %rdx
	subq	%rcx, %rdx
	decq	%rcx
	.p2align	4, 0x90
.LBB1_14:                               # %polly.loop_header.i
                                        #   Parent Loop BB1_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rdx, 8(%r15,%rcx,8)
	incq	%rcx
	decq	%rdx
	cmpq	%rax, %rcx
	jle	.LBB1_14
# BB#12:                                # %polly.par.checkNext.loopexit.i
                                        #   in Loop: Header=BB1_13 Depth=1
	movq	%r13, %rdi
	movq	%rbp, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB1_13
.LBB1_15:                               # %main_polly_subfn.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
.LBB1_3:                                # %if.end85
	leaq	56(%rsp), %r9
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%r14, %r8
	callq	_sortV1_
	movq	%rax, %r13
	movq	(%r13), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movq	-8(%r12,%r14,8), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%edi, %edi
	movl	$24, %esi
	callq	create1DArray_int64_t
	movq	%rax, %rbx
	movaps	.LCPI1_0(%rip), %xmm0   # xmm0 = [80,97]
	movups	%xmm0, (%rbx)
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [115,115]
	movups	%xmm0, 16(%rbx)
	movaps	.LCPI1_2(%rip), %xmm0   # xmm0 = [32,77]
	movups	%xmm0, 32(%rbx)
	movaps	.LCPI1_3(%rip), %xmm0   # xmm0 = [101,114]
	movups	%xmm0, 48(%rbx)
	movaps	.LCPI1_4(%rip), %xmm0   # xmm0 = [103,101]
	movups	%xmm0, 64(%rbx)
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [115,111]
	movups	%xmm0, 80(%rbx)
	movaps	.LCPI1_6(%rip), %xmm0   # xmm0 = [114,116]
	movups	%xmm0, 96(%rbx)
	movaps	.LCPI1_7(%rip), %xmm0   # xmm0 = [32,116]
	movups	%xmm0, 112(%rbx)
	movaps	.LCPI1_8(%rip), %xmm0   # xmm0 = [101,115]
	movups	%xmm0, 128(%rbx)
	movaps	.LCPI1_9(%rip), %xmm0   # xmm0 = [116,32]
	movups	%xmm0, 144(%rbx)
	movaps	.LCPI1_10(%rip), %xmm0  # xmm0 = [99,97]
	movups	%xmm0, 160(%rbx)
	movaps	.LCPI1_11(%rip), %xmm0  # xmm0 = [115,101]
	movups	%xmm0, 176(%rbx)
	testq	%rbx, %rbx
	setne	%r14b
	movl	$24, %esi
	movq	%rbx, %rdi
	callq	println_s
	movq	40(%rsp), %rdi          # 8-byte Reload
	callq	free
	testq	%r13, %r13
	movq	48(%rsp), %rbp          # 8-byte Reload
	je	.LBB1_5
# BB#4:                                 # %if.then87
	movq	%r13, %rdi
	callq	free
.LBB1_5:                                # %if.end91
	testq	%rbp, %rbp
	je	.LBB1_7
.LBB1_6:                                # %if.then93
	movq	(%rsp), %rsi
	movq	%rbp, %rdi
	callq	free2DArray_int64_t
.LBB1_7:                                # %if.end103
	testb	%r14b, %r14b
	je	.LBB1_9
# BB#8:                                 # %if.then105
	movq	%rbx, %rdi
	callq	free
.LBB1_9:                                # %if.end106
	xorl	%edi, %edi
	callq	exit
.LBB1_1:
	xorl	%ebx, %ebx
	xorl	%r14d, %r14d
	testq	%rbp, %rbp
	jne	.LBB1_6
	jmp	.LBB1_7
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc

	.p2align	4, 0x90
	.type	_sortV1__polly_subfn_2,@function
_sortV1__polly_subfn_2:                 # @_sortV1__polly_subfn_2
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Lcfi26:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Lcfi27:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Lcfi28:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Lcfi29:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Lcfi30:
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
.Lcfi31:
	.cfi_def_cfa_offset 64
.Lcfi32:
	.cfi_offset %rbx, -48
.Lcfi33:
	.cfi_offset %r12, -40
.Lcfi34:
	.cfi_offset %r13, -32
.Lcfi35:
	.cfi_offset %r14, -24
.Lcfi36:
	.cfi_offset %r15, -16
	movq	(%rdi), %r14
	movq	16(%rdi), %r15
	movq	32(%rdi), %rbx
	movq	40(%rdi), %r13
	leaq	8(%rsp), %rdi
	movq	%rsp, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB2_2
# BB#1:                                 # %polly.par.loadIVBounds.preheader
	leaq	(%rbx,%r15,8), %r12
	leaq	(%r13,%r14,8), %rbx
	leaq	8(%rsp), %r14
	movq	%rsp, %r15
	.p2align	4, 0x90
.LBB2_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_5 Depth 2
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB2_5:                                # %polly.loop_header
                                        #   Parent Loop BB2_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%r12,%rcx,8), %rdx
	movq	%rdx, 8(%rbx,%rcx,8)
	incq	%rcx
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
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
.Lfunc_end2:
	.size	_sortV1__polly_subfn_2, .Lfunc_end2-_sortV1__polly_subfn_2
	.cfi_endproc

	.p2align	4, 0x90
	.type	_sortV1__polly_subfn_3,@function
_sortV1__polly_subfn_3:                 # @_sortV1__polly_subfn_3
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Lcfi37:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Lcfi38:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Lcfi39:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Lcfi40:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Lcfi41:
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
.Lcfi42:
	.cfi_def_cfa_offset 64
.Lcfi43:
	.cfi_offset %rbx, -48
.Lcfi44:
	.cfi_offset %r12, -40
.Lcfi45:
	.cfi_offset %r13, -32
.Lcfi46:
	.cfi_offset %r14, -24
.Lcfi47:
	.cfi_offset %r15, -16
	movq	(%rdi), %r14
	movq	16(%rdi), %r15
	movq	32(%rdi), %rbx
	movq	40(%rdi), %r13
	leaq	8(%rsp), %rdi
	movq	%rsp, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB3_2
# BB#1:                                 # %polly.par.loadIVBounds.preheader
	leaq	(%rbx,%r15,8), %r12
	leaq	(%r13,%r14,8), %rbx
	leaq	8(%rsp), %r14
	movq	%rsp, %r15
	.p2align	4, 0x90
.LBB3_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_5 Depth 2
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB3_5:                                # %polly.loop_header
                                        #   Parent Loop BB3_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%r12,%rcx,8), %rdx
	movq	%rdx, 8(%rbx,%rcx,8)
	incq	%rcx
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
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
.Lfunc_end3:
	.size	_sortV1__polly_subfn_3, .Lfunc_end3-_sortV1__polly_subfn_3
	.cfi_endproc

	.p2align	4, 0x90
	.type	main_polly_subfn,@function
main_polly_subfn:                       # @main_polly_subfn
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Lcfi48:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Lcfi49:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Lcfi50:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Lcfi51:
	.cfi_def_cfa_offset 40
	subq	$24, %rsp
.Lcfi52:
	.cfi_def_cfa_offset 64
.Lcfi53:
	.cfi_offset %rbx, -40
.Lcfi54:
	.cfi_offset %r12, -32
.Lcfi55:
	.cfi_offset %r14, -24
.Lcfi56:
	.cfi_offset %r15, -16
	movq	(%rdi), %r12
	movq	8(%rdi), %rbx
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB4_2
# BB#1:
	leaq	16(%rsp), %r14
	leaq	8(%rsp), %r15
	.p2align	4, 0x90
.LBB4_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_5 Depth 2
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	addq	$-2, %rax
	movq	%r12, %rdx
	subq	%rcx, %rdx
	decq	%rcx
	.p2align	4, 0x90
.LBB4_5:                                # %polly.loop_header
                                        #   Parent Loop BB4_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rdx, 8(%rbx,%rcx,8)
	incq	%rcx
	decq	%rdx
	cmpq	%rax, %rcx
	jle	.LBB4_5
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB4_4 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB4_4
.LBB4_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Lfunc_end4:
	.size	main_polly_subfn, .Lfunc_end4-main_polly_subfn
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%ld\n"
	.size	.L.str, 5


	.ident	"clang version 4.0.0 (http://llvm.org/git/clang.git 9b9db7fa41a1905899dbcbcc6cbdd05d2511da8e) (http://llvm.org/git/llvm.git fd456e365e09d54850dabc6a2f840a0c2eae7c27)"
	.section	".note.GNU-stack","",@progbits
