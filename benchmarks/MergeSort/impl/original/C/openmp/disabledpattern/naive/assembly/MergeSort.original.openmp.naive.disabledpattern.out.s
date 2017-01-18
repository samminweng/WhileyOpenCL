	.text
	.file	"llvm/MergeSort.original.openmp.naive.disabledpattern.out.ll"
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
	subq	$248, %rsp
.Lcfi6:
	.cfi_def_cfa_offset 304
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
	movq	%rcx, %r15
	movq	%rdx, %r13
	movq	$0, 208(%rsp)
	movq	$0, 200(%rsp)
	leaq	1(%r13), %rax
	cmpq	%r15, %rax
	jge	.LBB0_67
# BB#1:                                 # %if.end
	movq	%r8, 72(%rsp)           # 8-byte Spill
	leaq	(%r15,%r13), %rax
	movq	%rax, %rbx
	shrq	$63, %rbx
	movq	%rax, 128(%rsp)         # 8-byte Spill
	addq	%rax, %rbx
	sarq	%rbx
	movl	%r13d, %edx
	movl	%ebx, %ecx
	movq	%rdi, %rbp
	movq	%rsi, 64(%rsp)          # 8-byte Spill
	callq	slice
	movq	%rbx, %r14
	subq	%r13, %r14
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	copy1DArray_int64_t
	xorl	%r12d, %r12d
	leaq	208(%rsp), %r8
	xorl	%edx, %edx
	movq	%rax, %rdi
	movq	%r14, %rax
	movq	%rax, 104(%rsp)         # 8-byte Spill
	movq	%r14, %rsi
	movq	%rbx, %rcx
	callq	_sortV1_
	movq	208(%rsp), %rsi
	movq	%rax, %rdi
	callq	copy1DArray_int64_t
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movq	%rbp, 48(%rsp)          # 8-byte Spill
	movq	%rbp, %rdi
	movq	64(%rsp), %rsi          # 8-byte Reload
	movl	%ebx, %edx
	movl	%r15d, %ecx
	callq	slice
	movq	%r15, %rbp
	subq	%rbx, %rbp
	movq	%rax, %rdi
	movq	%rbp, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, %rdi
	movq	%rbp, %rsi
	callq	copy1DArray_int64_t
	leaq	200(%rsp), %r8
	xorl	%edx, %edx
	movq	%rax, %rdi
	movq	%rbp, %rsi
	movq	%rbp, %rcx
	callq	_sortV1_
	movq	200(%rsp), %rsi
	movq	%rax, %rdi
	callq	copy1DArray_int64_t
	movq	%rbx, %r10
	movq	%r15, %r11
	subq	%r10, %r11
	movq	%r13, 32(%rsp)          # 8-byte Spill
	jle	.LBB0_11
# BB#2:                                 # %if.end
	movq	%r15, %rcx
	subq	%r13, %rcx
	testq	%rcx, %rcx
	jle	.LBB0_11
# BB#3:                                 # %if.end
	movq	%r15, %rbp
	movq	104(%rsp), %r15         # 8-byte Reload
	testq	%r15, %r15
	movl	$0, %r14d
	movl	$0, %r13d
	movq	48(%rsp), %rdi          # 8-byte Reload
	movq	40(%rsp), %rbx          # 8-byte Reload
	movq	72(%rsp), %r8           # 8-byte Reload
	jle	.LBB0_12
# BB#4:                                 # %if.end30.preheader
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB0_5:                                # %if.end30
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rbx,%r12,8), %rdx
	movq	(%rax,%r14,8), %rsi
	cmpq	%rsi, %rdx
	jle	.LBB0_7
# BB#6:                                 # %blklab3
                                        #   in Loop: Header=BB0_5 Depth=1
	movq	%rsi, (%rdi,%r13,8)
	incq	%r14
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_7:                                # %if.end35
                                        #   in Loop: Header=BB0_5 Depth=1
	movq	%rdx, (%rdi,%r13,8)
	incq	%r12
.LBB0_8:                                # %blklab4
                                        #   in Loop: Header=BB0_5 Depth=1
	incq	%r13
	cmpq	%r11, %r14
	jge	.LBB0_12
# BB#9:                                 # %blklab4
                                        #   in Loop: Header=BB0_5 Depth=1
	cmpq	%rcx, %r13
	jge	.LBB0_12
# BB#10:                                # %blklab4
                                        #   in Loop: Header=BB0_5 Depth=1
	cmpq	%r15, %r12
	jl	.LBB0_5
	jmp	.LBB0_12
.LBB0_11:
	movq	%r15, %rbp
	xorl	%r14d, %r14d
	xorl	%r13d, %r13d
	movq	48(%rsp), %rdi          # 8-byte Reload
	movq	40(%rsp), %rbx          # 8-byte Reload
	movq	72(%rsp), %r8           # 8-byte Reload
	movq	104(%rsp), %r15         # 8-byte Reload
.LBB0_12:                               # %while.cond43.preheader
	subq	%r12, %r15
	jle	.LBB0_22
# BB#13:                                # %if.end49.lr.ph
	movq	%r11, 112(%rsp)         # 8-byte Spill
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	%r10, 56(%rsp)          # 8-byte Spill
	movq	32(%rsp), %rax          # 8-byte Reload
	movq	%rax, %rcx
	negq	%rax
	movq	%rax, 192(%rsp)         # 8-byte Spill
	addq	%r13, %r15
	movq	%r13, %r8
	addq	%r8, %r8
	seto	16(%rsp)                # 1-byte Folded Spill
	movq	%rbp, %rax
	addq	%rax, %r8
	seto	17(%rsp)                # 1-byte Folded Spill
	movq	%r12, %rdx
	addq	%rdx, %rdx
	seto	23(%rsp)                # 1-byte Folded Spill
	movq	%rcx, %r9
	addq	%rdx, %r9
	seto	22(%rsp)                # 1-byte Folded Spill
	movq	%r9, %rsi
	addq	$-1, %rsi
	seto	15(%rsp)                # 1-byte Folded Spill
	cmpq	%rsi, %r8
	setge	28(%rsp)                # 1-byte Folded Spill
	movq	%rax, %rsi
	addq	%rcx, %rsi
	seto	21(%rsp)                # 1-byte Folded Spill
	cmpq	$0, 128(%rsp)           # 8-byte Folded Reload
	sets	31(%rsp)                # 1-byte Folded Spill
	setns	%r11b
	movq	%r9, %rdi
	addq	$2, %rdi
	seto	20(%rsp)                # 1-byte Folded Spill
	cmpq	%rax, %rdi
	setle	6(%rsp)                 # 1-byte Folded Spill
	movq	%r9, %rdi
	incq	%rdi
	seto	18(%rsp)                # 1-byte Folded Spill
	movq	%r9, %rbp
	sarq	$63, %rbp
	incq	%rbp
	movq	%rbp, %rsi
	shlq	$62, %rsi
	sarq	$62, %rsi
	xorq	%rsi, %rbp
	setne	13(%rsp)                # 1-byte Folded Spill
	movq	%r8, %rcx
	sarq	$63, %rcx
	cmpq	%r9, %r8
	sbbq	%rsi, %rcx
	setge	24(%rsp)                # 1-byte Folded Spill
	movabsq	$-1152921504606846976, %rcx # imm = 0xF000000000000000
	cmpq	%rcx, %r13
	setl	%r8b
	cmpq	%rax, %rdi
	setle	30(%rsp)                # 1-byte Folded Spill
	cmpq	%rcx, %r12
	movq	%rbx, %rbp
	setl	%r10b
	movabsq	$1152921504606846975, %rsi # imm = 0xFFFFFFFFFFFFFFF
	cmpq	%rsi, %r12
	setg	26(%rsp)                # 1-byte Folded Spill
	cmpq	%rsi, %r13
	movabsq	$-9223372036854775808, %rsi # imm = 0x8000000000000000
	setg	29(%rsp)                # 1-byte Folded Spill
	cmpq	%rsi, %r12
	sete	27(%rsp)                # 1-byte Folded Spill
	movq	32(%rsp), %rcx          # 8-byte Reload
	cmpq	%rsi, %rcx
	sete	%r9b
	decq	%rsi
	addq	%rax, %rsi
	seto	11(%rsp)                # 1-byte Folded Spill
	cmpq	%rdx, %rsi
	movq	%rcx, %rdx
	setge	25(%rsp)                # 1-byte Folded Spill
	negq	%rdx
	movq	128(%rsp), %rdi         # 8-byte Reload
	seto	19(%rsp)                # 1-byte Folded Spill
	shrq	%rdi
	movq	192(%rsp), %rdx         # 8-byte Reload
	movq	%rdx, %rsi
	addq	%rdi, %rsi
	movq	%rdx, %rcx
	seto	12(%rsp)                # 1-byte Folded Spill
	movq	%rax, 80(%rsp)          # 8-byte Spill
	subq	%rax, %rcx
	seto	14(%rsp)                # 1-byte Folded Spill
	shrq	%rcx
	movq	%rdx, %rbx
	subq	%rcx, %rbx
	seto	10(%rsp)                # 1-byte Folded Spill
	movl	%r11d, %edx
	andb	6(%rsp), %dl            # 1-byte Folded Reload
	cmovneq	%rsi, %rbx
	leaq	(%rbp,%rbx,8), %rsi
	movq	48(%rsp), %rbx          # 8-byte Reload
	leaq	(%rbx,%r13,8), %rax
	movq	%rax, 224(%rsp)         # 8-byte Spill
	cmpq	%rax, %rsi
	movq	%r13, %rsi
	setbe	%al
	subq	32(%rsp), %rsi          # 8-byte Folded Reload
	seto	9(%rsp)                 # 1-byte Folded Spill
	subq	%r12, %rsi
	movq	%rsi, %rbp
	seto	8(%rsp)                 # 1-byte Folded Spill
	movq	%rdi, 240(%rsp)         # 8-byte Spill
	addq	%rdi, %rbp
	seto	%dil
	movq	%rcx, 232(%rsp)         # 8-byte Spill
	subq	%rcx, %rsi
	seto	7(%rsp)                 # 1-byte Folded Spill
	testb	%dl, %dl
	cmovneq	%rbp, %rsi
	leaq	(%rbx,%rsi,8), %rdx
	movq	40(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%r12,8), %rcx
	movq	%rcx, 216(%rsp)         # 8-byte Spill
	cmpq	%rcx, %rdx
	setbe	%dl
	orb	%al, %dl
	cmpb	$1, %dl
	jne	.LBB0_23
# BB#14:                                # %if.end49.lr.ph
	movb	31(%rsp), %bpl          # 1-byte Reload
	movb	28(%rsp), %al           # 1-byte Reload
	andb	%bpl, %al
	movb	6(%rsp), %bl            # 1-byte Reload
	orb	%bl, %al
	movb	24(%rsp), %cl           # 1-byte Reload
	andb	%r11b, %cl
	movl	%r8d, %edx
	andb	%r11b, %dl
	andb	%bl, %dl
	orb	%al, %dl
	andb	%bpl, %r8b
	movb	30(%rsp), %sil          # 1-byte Reload
	andb	%sil, %r8b
	orb	%dl, %r8b
	orb	%cl, %r8b
	movl	%r10d, %edx
	andb	%r11b, %dl
	andb	%bl, %dl
	andb	%bpl, %r10b
	andb	%sil, %r10b
	orb	%dl, %r10b
	movb	26(%rsp), %al           # 1-byte Reload
	movl	%eax, %edx
	andb	%r11b, %dl
	andb	%bl, %dl
	orb	%r10b, %dl
	andb	%bpl, %al
	andb	%sil, %al
	orb	%dl, %al
	movb	29(%rsp), %dl           # 1-byte Reload
	andb	%dl, %r11b
	andb	%bl, %r11b
	orb	%al, %r11b
	orb	%r8b, %r11b
	andb	%bpl, %dl
	andb	%sil, %dl
	orb	27(%rsp), %dl           # 1-byte Folded Reload
	andb	25(%rsp), %r9b          # 1-byte Folded Reload
	orb	%dl, %r9b
	orb	%r11b, %r9b
	xorb	$1, %r9b
	testb	$1, %r9b
	je	.LBB0_23
# BB#15:                                # %if.end49.lr.ph
	movb	18(%rsp), %r9b          # 1-byte Reload
	movl	%r9d, %edx
	movb	16(%rsp), %bl           # 1-byte Reload
	orb	%bl, %dl
	movb	23(%rsp), %sil          # 1-byte Reload
	orb	%sil, %bl
	movb	17(%rsp), %cl           # 1-byte Reload
	orb	%cl, %bl
	movb	22(%rsp), %r10b         # 1-byte Reload
	orb	%r10b, %bl
	movl	%edi, %ebp
	movb	21(%rsp), %dil          # 1-byte Reload
	movb	15(%rsp), %al           # 1-byte Reload
	orb	%dil, %al
	orb	%bl, %al
	orb	%cl, %dl
	movb	20(%rsp), %r8b          # 1-byte Reload
	movl	%r8d, %ecx
	orb	%sil, %cl
	orb	%r10b, %cl
	orb	%cl, %al
	orb	%sil, %dl
	orb	%al, %dl
	orb	%r10b, %dl
	movb	13(%rsp), %al           # 1-byte Reload
	orb	%dil, %al
	orb	%dl, %al
	orb	%r9b, %cl
	orb	%dil, %cl
	movl	%ecx, %edx
	orb	%r8b, %dl
	orb	%sil, %dl
	orb	%al, %dl
	movl	%r10d, %ebx
	orb	%r9b, %bl
	orb	%dil, %bl
	orb	%r8b, %bl
	orb	%sil, %bl
	orb	%r10b, %bl
	orb	%r9b, %bl
	orb	%dil, %bl
	orb	%dl, %bl
	orb	11(%rsp), %cl           # 1-byte Folded Reload
	orb	%sil, %cl
	orb	%r10b, %cl
	orb	%r8b, %cl
	orb	%bl, %cl
	movl	%edi, %edx
	movb	19(%rsp), %bl           # 1-byte Reload
	orb	%bl, %dl
	orb	12(%rsp), %dl           # 1-byte Folded Reload
	movb	14(%rsp), %al           # 1-byte Reload
	orb	%al, %dl
	orb	10(%rsp), %dl           # 1-byte Folded Reload
	orb	%sil, %dl
	orb	%r10b, %dl
	orb	%r8b, %dl
	orb	%dil, %dl
	orb	9(%rsp), %dl            # 1-byte Folded Reload
	orb	8(%rsp), %dl            # 1-byte Folded Reload
	orb	%bpl, %dl
	orb	%cl, %dl
	orb	%al, %bl
	orb	7(%rsp), %bl            # 1-byte Folded Reload
	orb	%dl, %bl
	xorb	$1, %bl
	testb	$1, %bl
	je	.LBB0_23
# BB#16:                                # %polly.cond914
	movq	192(%rsp), %r8          # 8-byte Reload
	subq	%r12, %r8
	cmpq	$0, 128(%rsp)           # 8-byte Folded Reload
	js	.LBB0_29
# BB#17:                                # %polly.parallel.for928
	movq	%r13, 136(%rsp)
	movq	32(%rsp), %rax          # 8-byte Reload
	movq	%rax, 144(%rsp)
	movq	%r12, 152(%rsp)
	movq	80(%rsp), %r13          # 8-byte Reload
	movq	%r13, 160(%rsp)
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	%rax, 168(%rsp)
	movq	48(%rsp), %rax          # 8-byte Reload
	movq	%rax, 176(%rsp)
	movq	56(%rsp), %rax          # 8-byte Reload
	movq	%rax, 184(%rsp)
	addq	240(%rsp), %r8          # 8-byte Folded Reload
	leaq	136(%rsp), %rsi
	movl	$_sortV1__polly_subfn_3, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	movq	136(%rsp), %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	152(%rsp), %r12
	movq	168(%rsp), %rbp
	movq	176(%rsp), %rbx
	leaq	96(%rsp), %rdi
	leaq	88(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB0_34
# BB#18:                                # %polly.par.loadIVBounds.preheader.i
	leaq	(%rbp,%r12,8), %rbp
	movq	32(%rsp), %rax          # 8-byte Reload
	leaq	(%rbx,%rax,8), %r12
	leaq	88(%rsp), %rbx
	.p2align	4, 0x90
.LBB0_19:                               # %polly.par.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_20 Depth 2
	movq	88(%rsp), %rax
	movq	96(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB0_20:                               # %polly.loop_header.i
                                        #   Parent Loop BB0_19 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%rbp,%rcx,8), %rdx
	movq	%rdx, 8(%r12,%rcx,8)
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB0_20
# BB#21:                                # %polly.par.checkNext.loopexit.i
                                        #   in Loop: Header=BB0_19 Depth=1
	leaq	96(%rsp), %rdi
	movq	%rbx, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_19
	jmp	.LBB0_34
.LBB0_22:
	movq	%r13, %r15
	movq	64(%rsp), %rsi          # 8-byte Reload
	movq	%rbp, %r13
	cmpq	%r11, %r14
	jl	.LBB0_50
	jmp	.LBB0_67
.LBB0_23:                               # %if.end49.preheader
	movq	56(%rsp), %r10          # 8-byte Reload
	movq	%r10, %rcx
	subq	%r12, %rcx
	subq	32(%rsp), %rcx          # 8-byte Folded Reload
	cmpq	$3, %rcx
	movq	%r13, %rsi
	movq	%r12, %rbx
	movq	72(%rsp), %r8           # 8-byte Reload
	movq	48(%rsp), %rdi          # 8-byte Reload
	movq	120(%rsp), %rax         # 8-byte Reload
	movq	112(%rsp), %r11         # 8-byte Reload
	jbe	.LBB0_41
# BB#24:                                # %min.iters.checked
	movq	%rcx, %rdx
	andq	$-4, %rdx
	movq	%r13, %rsi
	movq	%r12, %rbx
	je	.LBB0_41
# BB#25:                                # %vector.memcheck
	movq	40(%rsp), %rsi          # 8-byte Reload
	movq	104(%rsp), %rbp         # 8-byte Reload
	leaq	(%rsi,%rbp,8), %rsi
	movq	216(%rsp), %rbp         # 8-byte Reload
	cmpq	%rsi, 224(%rsp)         # 8-byte Folded Reload
	jae	.LBB0_27
# BB#26:                                # %vector.memcheck
	leaq	(%r13,%r10), %rsi
	movq	%rbp, %rbx
	movq	32(%rsp), %rbp          # 8-byte Reload
	leaq	(%r12,%rbp), %rbp
	subq	%rbp, %rsi
	leaq	(%rdi,%rsi,8), %rsi
	cmpq	%rsi, %rbx
	movq	%r13, %rsi
	movq	%r12, %rbx
	jb	.LBB0_41
.LBB0_27:                               # %vector.body.preheader
	leaq	-4(%rdx), %rsi
	movq	%rsi, %rbx
	shrq	$2, %rbx
	btl	$2, %esi
	jb	.LBB0_35
# BB#28:                                # %vector.body.prol
	movq	40(%rsp), %r9           # 8-byte Reload
	movups	(%r9,%r12,8), %xmm0
	movups	16(%r9,%r12,8), %xmm1
	movups	%xmm0, (%rdi,%r13,8)
	movups	%xmm1, 16(%rdi,%r13,8)
	movl	$4, %ebp
	testq	%rbx, %rbx
	jne	.LBB0_36
	jmp	.LBB0_38
.LBB0_29:                               # %polly.parallel.for918
	subq	232(%rsp), %r8          # 8-byte Folded Reload
	movq	%r13, 136(%rsp)
	movq	32(%rsp), %rax          # 8-byte Reload
	movq	%rax, 144(%rsp)
	movq	%r12, 152(%rsp)
	movq	80(%rsp), %r13          # 8-byte Reload
	movq	%r13, 160(%rsp)
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	%rax, 168(%rsp)
	movq	48(%rsp), %rax          # 8-byte Reload
	movq	%rax, 176(%rsp)
	movq	56(%rsp), %rax          # 8-byte Reload
	movq	%rax, 184(%rsp)
	leaq	136(%rsp), %rsi
	movl	$_sortV1__polly_subfn_2, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	movq	136(%rsp), %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	152(%rsp), %r12
	movq	168(%rsp), %rbp
	movq	176(%rsp), %rbx
	leaq	96(%rsp), %rdi
	leaq	88(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB0_34
# BB#30:                                # %polly.par.loadIVBounds.preheader.i947
	leaq	(%rbp,%r12,8), %rbp
	movq	32(%rsp), %rax          # 8-byte Reload
	leaq	(%rbx,%rax,8), %r12
	leaq	88(%rsp), %rbx
	.p2align	4, 0x90
.LBB0_31:                               # %polly.par.loadIVBounds.i952
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_32 Depth 2
	movq	88(%rsp), %rax
	movq	96(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB0_32:                               # %polly.loop_header.i959
                                        #   Parent Loop BB0_31 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%rbp,%rcx,8), %rdx
	movq	%rdx, 8(%r12,%rcx,8)
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB0_32
# BB#33:                                # %polly.par.checkNext.loopexit.i948
                                        #   in Loop: Header=BB0_31 Depth=1
	leaq	96(%rsp), %rdi
	movq	%rbx, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_31
.LBB0_34:                               # %_sortV1__polly_subfn_2.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movq	72(%rsp), %r8           # 8-byte Reload
	movq	48(%rsp), %rdi          # 8-byte Reload
	movq	64(%rsp), %rsi          # 8-byte Reload
	movq	56(%rsp), %r10          # 8-byte Reload
	movq	120(%rsp), %rax         # 8-byte Reload
	movq	112(%rsp), %r11         # 8-byte Reload
	cmpq	%r11, %r14
	jl	.LBB0_50
	jmp	.LBB0_67
.LBB0_35:
	xorl	%ebp, %ebp
	movq	40(%rsp), %r9           # 8-byte Reload
	testq	%rbx, %rbx
	je	.LBB0_38
.LBB0_36:                               # %vector.body.preheader.new
	movq	%rdx, %rsi
	subq	%rbp, %rsi
	leaq	(%r12,%rbp), %rbx
	leaq	48(%r9,%rbx,8), %rbx
	addq	%r13, %rbp
	leaq	48(%rdi,%rbp,8), %rbp
	.p2align	4, 0x90
.LBB0_37:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movups	-48(%rbx), %xmm0
	movups	-32(%rbx), %xmm1
	movups	%xmm0, -48(%rbp)
	movups	%xmm1, -32(%rbp)
	movups	-16(%rbx), %xmm0
	movups	(%rbx), %xmm1
	movups	%xmm0, -16(%rbp)
	movups	%xmm1, (%rbp)
	addq	$64, %rbx
	addq	$64, %rbp
	addq	$-8, %rsi
	jne	.LBB0_37
.LBB0_38:                               # %middle.block
	cmpq	%rdx, %rcx
	jne	.LBB0_40
# BB#39:
	movq	80(%rsp), %r13          # 8-byte Reload
	jmp	.LBB0_49
.LBB0_40:
	leaq	(%r13,%rdx), %rsi
	addq	%r12, %rdx
	movq	%rdx, %rbx
.LBB0_41:                               # %if.end49.preheader1021
	leaq	(%r13,%r10), %rcx
	movl	%ecx, %edx
	subl	%esi, %edx
	subl	%r12d, %edx
	movq	32(%rsp), %rbp          # 8-byte Reload
	subl	%ebp, %edx
	leaq	-1(%r13,%r10), %r10
	subq	%rsi, %r10
	subq	%r12, %r10
	subq	%rbp, %r10
	andq	$3, %rdx
	je	.LBB0_44
# BB#42:                                # %if.end49.prol.preheader
	negq	%rdx
	movq	80(%rsp), %r13          # 8-byte Reload
	movq	40(%rsp), %r9           # 8-byte Reload
	.p2align	4, 0x90
.LBB0_43:                               # %if.end49.prol
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r9,%rbx,8), %rbp
	movq	%rbp, (%rdi,%rsi,8)
	incq	%rsi
	incq	%rbx
	incq	%rdx
	jne	.LBB0_43
	jmp	.LBB0_45
.LBB0_44:
	movq	80(%rsp), %r13          # 8-byte Reload
.LBB0_45:                               # %if.end49.prol.loopexit
	cmpq	$3, %r10
	jae	.LBB0_47
# BB#46:
	movq	56(%rsp), %r10          # 8-byte Reload
	jmp	.LBB0_49
.LBB0_47:                               # %if.end49.preheader1021.new
	subq	%rsi, %rcx
	subq	%r12, %rcx
	subq	32(%rsp), %rcx          # 8-byte Folded Reload
	leaq	24(%rdi,%rsi,8), %rbp
	movq	40(%rsp), %rdx          # 8-byte Reload
	leaq	24(%rdx,%rbx,8), %rdx
	movq	56(%rsp), %r10          # 8-byte Reload
	.p2align	4, 0x90
.LBB0_48:                               # %if.end49
                                        # =>This Inner Loop Header: Depth=1
	movq	-24(%rdx), %rsi
	movq	%rsi, -24(%rbp)
	movq	-16(%rdx), %rsi
	movq	%rsi, -16(%rbp)
	movq	-8(%rdx), %rsi
	movq	%rsi, -8(%rbp)
	movq	(%rdx), %rsi
	movq	%rsi, (%rbp)
	addq	$32, %rbp
	addq	$32, %rdx
	addq	$-4, %rcx
	jne	.LBB0_48
.LBB0_49:
	movq	64(%rsp), %rsi          # 8-byte Reload
	cmpq	%r11, %r14
	jge	.LBB0_67
.LBB0_50:                               # %if.end60.preheader
	movq	%r13, %rbx
	subq	%r14, %rbx
	subq	%r10, %rbx
	cmpq	$3, %rbx
	jbe	.LBB0_61
# BB#51:                                # %min.iters.checked982
	movq	%rbx, %r12
	andq	$-4, %r12
	je	.LBB0_61
# BB#52:                                # %vector.memcheck999
	leaq	(%rdi,%r15,8), %rdx
	leaq	(%rax,%r11,8), %rcx
	cmpq	%rcx, %rdx
	jae	.LBB0_54
# BB#53:                                # %vector.memcheck999
	leaq	(%r15,%r13), %rdx
	leaq	(%r14,%r10), %rcx
	subq	%rcx, %rdx
	leaq	(%rdi,%rdx,8), %rdx
	leaq	(%rax,%r14,8), %rcx
	cmpq	%rdx, %rcx
	jb	.LBB0_61
.LBB0_54:                               # %vector.body978.preheader
	leaq	-4(%r12), %rdx
	movq	%rdx, %r9
	shrq	$2, %r9
	btl	$2, %edx
	jb	.LBB0_56
# BB#55:                                # %vector.body978.prol
	movups	(%rax,%r14,8), %xmm0
	movups	16(%rax,%r14,8), %xmm1
	movups	%xmm0, (%rdi,%r15,8)
	movups	%xmm1, 16(%rdi,%r15,8)
	movl	$4, %ebp
	testq	%r9, %r9
	jne	.LBB0_57
	jmp	.LBB0_59
.LBB0_56:
	xorl	%ebp, %ebp
	testq	%r9, %r9
	je	.LBB0_59
.LBB0_57:                               # %vector.body978.preheader.new
	movq	%r12, %rdx
	subq	%rbp, %rdx
	leaq	(%r14,%rbp), %rcx
	leaq	48(%rax,%rcx,8), %rcx
	addq	%r15, %rbp
	leaq	48(%rdi,%rbp,8), %rbp
	.p2align	4, 0x90
.LBB0_58:                               # %vector.body978
                                        # =>This Inner Loop Header: Depth=1
	movups	-48(%rcx), %xmm0
	movups	-32(%rcx), %xmm1
	movups	%xmm0, -48(%rbp)
	movups	%xmm1, -32(%rbp)
	movups	-16(%rcx), %xmm0
	movups	(%rcx), %xmm1
	movups	%xmm0, -16(%rbp)
	movups	%xmm1, (%rbp)
	addq	$64, %rcx
	addq	$64, %rbp
	addq	$-8, %rdx
	jne	.LBB0_58
.LBB0_59:                               # %middle.block979
	cmpq	%r12, %rbx
	je	.LBB0_67
# BB#60:
	addq	%r12, %r15
	addq	%r12, %r14
.LBB0_61:                               # %if.end60.preheader1020
	movl	%r13d, %ecx
	subl	%r14d, %ecx
	subl	%r10d, %ecx
	leaq	-1(%r13), %rbp
	subq	%r14, %rbp
	subq	%r10, %rbp
	andq	$3, %rcx
	je	.LBB0_64
# BB#62:                                # %if.end60.prol.preheader
	negq	%rcx
	.p2align	4, 0x90
.LBB0_63:                               # %if.end60.prol
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rax,%r14,8), %rdx
	movq	%rdx, (%rdi,%r15,8)
	incq	%r15
	incq	%r14
	incq	%rcx
	jne	.LBB0_63
.LBB0_64:                               # %if.end60.prol.loopexit
	cmpq	$3, %rbp
	jb	.LBB0_67
# BB#65:                                # %if.end60.preheader1020.new
	leaq	24(%rdi,%r15,8), %rbp
	subq	%r14, %r13
	subq	%r10, %r13
	leaq	24(%rax,%r14,8), %rcx
	.p2align	4, 0x90
.LBB0_66:                               # %if.end60
                                        # =>This Inner Loop Header: Depth=1
	movq	-24(%rcx), %rdx
	movq	%rdx, -24(%rbp)
	movq	-16(%rcx), %rdx
	movq	%rdx, -16(%rbp)
	movq	-8(%rcx), %rdx
	movq	%rdx, -8(%rbp)
	movq	(%rcx), %rdx
	movq	%rdx, (%rbp)
	addq	$32, %rbp
	addq	$32, %rcx
	addq	$-4, %r13
	jne	.LBB0_66
.LBB0_67:                               # %blklab0
	movq	%rsi, (%r8)
	movq	%rdi, %rax
	addq	$248, %rsp
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
	subq	$56, %rsp
.Lcfi19:
	.cfi_def_cfa_offset 112
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
	movq	$0, 48(%rsp)
	movq	$0, 40(%rsp)
	movq	$0, (%rsp)
	leaq	48(%rsp), %rdx
	leaq	40(%rsp), %rcx
	callq	convertArgsToIntArray
	movq	(%rax), %rdi
	callq	parseStringToInt
	movq	(%rax), %r15
	xorl	%edi, %edi
	movq	%r15, %rsi
	callq	create1DArray_int64_t
	movq	%rax, %rdi
	movq	%r15, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, %r14
	testq	%r15, %r15
	jle	.LBB1_7
# BB#1:                                 # %polly.parallel.for
	movq	%r15, 24(%rsp)
	movq	%r14, 32(%rsp)
	leaq	24(%rsp), %rsi
	movl	$main_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r15, %r8
	callq	GOMP_parallel_loop_runtime_start
	movq	24(%rsp), %rbx
	movq	32(%rsp), %rbp
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB1_6
# BB#2:
	leaq	16(%rsp), %r12
	leaq	8(%rsp), %r13
	.p2align	4, 0x90
.LBB1_4:                                # %polly.par.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_5 Depth 2
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	addq	$-2, %rax
	movq	%rbx, %rdx
	subq	%rcx, %rdx
	decq	%rcx
	.p2align	4, 0x90
.LBB1_5:                                # %polly.loop_header.i
                                        #   Parent Loop BB1_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rdx, 8(%rbp,%rcx,8)
	incq	%rcx
	decq	%rdx
	cmpq	%rax, %rcx
	jle	.LBB1_5
# BB#3:                                 # %polly.par.checkNext.loopexit.i
                                        #   in Loop: Header=BB1_4 Depth=1
	movq	%r12, %rdi
	movq	%r13, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB1_4
.LBB1_6:                                # %main_polly_subfn.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
.LBB1_7:                                # %blklab10
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	copy1DArray_int64_t
	movq	%rsp, %r8
	xorl	%edx, %edx
	movq	%rax, %rdi
	movq	%r15, %rsi
	movq	%r15, %rcx
	callq	_sortV1_
	movq	(%rsp), %rsi
	movq	%rax, %rdi
	callq	copy1DArray_int64_t
	movq	%rax, %rbx
	movq	(%rbx), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movq	-8(%rbx,%r15,8), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%edi, %edi
	movl	$24, %esi
	callq	create1DArray_int64_t
	movaps	.LCPI1_0(%rip), %xmm0   # xmm0 = [80,97]
	movups	%xmm0, (%rax)
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [115,115]
	movups	%xmm0, 16(%rax)
	movaps	.LCPI1_2(%rip), %xmm0   # xmm0 = [32,77]
	movups	%xmm0, 32(%rax)
	movaps	.LCPI1_3(%rip), %xmm0   # xmm0 = [101,114]
	movups	%xmm0, 48(%rax)
	movaps	.LCPI1_4(%rip), %xmm0   # xmm0 = [103,101]
	movups	%xmm0, 64(%rax)
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [115,111]
	movups	%xmm0, 80(%rax)
	movaps	.LCPI1_6(%rip), %xmm0   # xmm0 = [114,116]
	movups	%xmm0, 96(%rax)
	movaps	.LCPI1_7(%rip), %xmm0   # xmm0 = [32,116]
	movups	%xmm0, 112(%rax)
	movaps	.LCPI1_8(%rip), %xmm0   # xmm0 = [101,115]
	movups	%xmm0, 128(%rax)
	movaps	.LCPI1_9(%rip), %xmm0   # xmm0 = [116,32]
	movups	%xmm0, 144(%rax)
	movaps	.LCPI1_10(%rip), %xmm0  # xmm0 = [99,97]
	movups	%xmm0, 160(%rax)
	movaps	.LCPI1_11(%rip), %xmm0  # xmm0 = [115,101]
	movups	%xmm0, 176(%rax)
	movl	$24, %esi
	movq	%rax, %rdi
	callq	println_s
	xorl	%edi, %edi
	callq	exit
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
