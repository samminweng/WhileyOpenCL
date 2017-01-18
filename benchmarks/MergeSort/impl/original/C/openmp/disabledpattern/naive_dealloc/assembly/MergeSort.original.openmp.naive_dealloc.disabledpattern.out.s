	.text
	.file	"llvm/MergeSort.original.openmp.naive_dealloc.disabledpattern.out.ll"
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
	subq	$280, %rsp              # imm = 0x118
.Lcfi6:
	.cfi_def_cfa_offset 336
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
	movq	%r9, %r15
	movq	%r8, %r12
	movq	%rcx, %rbp
	movq	%rsi, %r14
	movq	$0, 192(%rsp)
	movq	$0, 184(%rsp)
	leaq	1(%rbp), %rax
	cmpq	%r12, %rax
	jge	.LBB0_30
# BB#1:                                 # %polly.split_new_and_old1078
	movq	%r15, 80(%rsp)          # 8-byte Spill
	leaq	(%r12,%rbp), %rax
	movq	%rax, %rbx
	shrq	$63, %rbx
	movq	%rax, 72(%rsp)          # 8-byte Spill
	addq	%rax, %rbx
	sarq	%rbx
	movq	%rdi, 8(%rsp)           # 8-byte Spill
	movq	%r14, %rsi
	movl	%ebp, %edx
	movl	%ebx, %ecx
	callq	slice
	movq	%rbx, %r15
	movq	%rbp, 48(%rsp)          # 8-byte Spill
	subq	%rbp, %r15
	movq	%rax, 264(%rsp)         # 8-byte Spill
	movq	%rax, %rdi
	movq	%r15, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, %rbp
	movq	%rbp, %rdi
	movq	%r15, %rsi
	callq	copy1DArray_int64_t
	leaq	192(%rsp), %r9
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rax, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	%rbx, %r8
	callq	_sortV1_
	movq	%rax, %rbx
	testq	%rbp, %rbp
	je	.LBB0_3
# BB#2:                                 # %if.end26
	movq	%rbp, %rdi
	callq	free
.LBB0_3:                                # %polly.split_new_and_old1074
	movq	192(%rsp), %rsi
	movq	%rbx, 256(%rsp)         # 8-byte Spill
	movq	%rbx, %rdi
	callq	copy1DArray_int64_t
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	8(%rsp), %rdi           # 8-byte Reload
	movq	%r14, %rsi
	movq	56(%rsp), %rbx          # 8-byte Reload
	movl	%ebx, %edx
	movl	%r12d, %ecx
	callq	slice
	movq	%r12, %r13
	subq	%rbx, %r13
	movq	%rax, 248(%rsp)         # 8-byte Spill
	movq	%rax, %rdi
	movq	%r13, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, %rbp
	movq	%rbp, %rdi
	movq	%r13, %rsi
	callq	copy1DArray_int64_t
	leaq	184(%rsp), %r9
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rax, %rdi
	movq	%r13, %rsi
	movq	%r13, 112(%rsp)         # 8-byte Spill
	movq	%r13, %r8
	callq	_sortV1_
	movq	%rax, %rbx
	testq	%rbp, %rbp
	je	.LBB0_5
# BB#4:                                 # %if.end71
	movq	%rbp, %rdi
	callq	free
.LBB0_5:                                # %if.end79
	movq	184(%rsp), %rsi
	movq	%rbx, %rdi
	callq	copy1DArray_int64_t
	movq	%rax, %r9
	xorl	%esi, %esi
	movq	112(%rsp), %r11         # 8-byte Reload
	testq	%r11, %r11
	movq	%r14, 272(%rsp)         # 8-byte Spill
	jle	.LBB0_6
# BB#31:                                # %if.end79
	movq	%r12, %rax
	movq	48(%rsp), %rbp          # 8-byte Reload
	subq	%rbp, %rax
	testq	%rax, %rax
	movq	8(%rsp), %r8            # 8-byte Reload
	movq	64(%rsp), %r10          # 8-byte Reload
	jle	.LBB0_32
# BB#33:                                # %if.end79
	testq	%r15, %r15
	movl	$0, %r13d
	movl	$0, %ecx
	jle	.LBB0_7
# BB#34:                                # %if.end100.preheader
	xorl	%ecx, %ecx
	xorl	%r13d, %r13d
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB0_35:                               # %if.end100
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r10,%rsi,8), %rdx
	movq	(%r9,%r13,8), %rdi
	cmpq	%rdi, %rdx
	jle	.LBB0_36
# BB#60:                                # %blklab3
                                        #   in Loop: Header=BB0_35 Depth=1
	movq	%rdi, (%r8,%rcx,8)
	incq	%r13
	jmp	.LBB0_61
	.p2align	4, 0x90
.LBB0_36:                               # %if.end105
                                        #   in Loop: Header=BB0_35 Depth=1
	movq	%rdx, (%r8,%rcx,8)
	incq	%rsi
.LBB0_61:                               # %blklab4
                                        #   in Loop: Header=BB0_35 Depth=1
	incq	%rcx
	cmpq	%r11, %r13
	jge	.LBB0_7
# BB#62:                                # %blklab4
                                        #   in Loop: Header=BB0_35 Depth=1
	cmpq	%rax, %rcx
	jge	.LBB0_7
# BB#63:                                # %blklab4
                                        #   in Loop: Header=BB0_35 Depth=1
	cmpq	%r15, %rsi
	jl	.LBB0_35
	jmp	.LBB0_7
.LBB0_6:
	xorl	%r13d, %r13d
	xorl	%ecx, %ecx
	movq	8(%rsp), %r8            # 8-byte Reload
	movq	64(%rsp), %r10          # 8-byte Reload
	movq	48(%rsp), %rbp          # 8-byte Reload
	jmp	.LBB0_7
.LBB0_32:
	xorl	%r13d, %r13d
	xorl	%ecx, %ecx
.LBB0_7:                                # %while.cond113.preheader
	movq	%r15, %r14
	subq	%rsi, %r14
	movq	%rbx, 240(%rsp)         # 8-byte Spill
	jle	.LBB0_8
# BB#37:                                # %if.end119.lr.ph
	movq	%r9, 88(%rsp)           # 8-byte Spill
	movq	%rbp, %rdi
	negq	%rdi
	addq	%rcx, %r14
	movq	%rcx, %r9
	addq	%r9, %r9
	seto	30(%rsp)                # 1-byte Folded Spill
	addq	%r12, %r9
	seto	33(%rsp)                # 1-byte Folded Spill
	movq	%rsi, %rax
	addq	%rax, %rax
	movq	%rax, 120(%rsp)         # 8-byte Spill
	seto	37(%rsp)                # 1-byte Folded Spill
	movq	%rbp, %rbx
	addq	%rax, %rbx
	seto	36(%rsp)                # 1-byte Folded Spill
	movq	%rbx, %rdx
	addq	$-1, %rdx
	seto	29(%rsp)                # 1-byte Folded Spill
	cmpq	%rdx, %r9
	setge	43(%rsp)                # 1-byte Folded Spill
	movq	%r12, %rdx
	addq	%rbp, %rdx
	seto	35(%rsp)                # 1-byte Folded Spill
	cmpq	$0, 72(%rsp)            # 8-byte Folded Reload
	sets	47(%rsp)                # 1-byte Folded Spill
	setns	%r10b
	movq	%rbx, %rdx
	addq	$2, %rdx
	seto	34(%rsp)                # 1-byte Folded Spill
	cmpq	%r12, %rdx
	setle	7(%rsp)                 # 1-byte Folded Spill
	movq	%rbx, %r8
	incq	%r8
	seto	6(%rsp)                 # 1-byte Folded Spill
	movq	%rbp, %r11
	movq	%rbx, %rbp
	sarq	$63, %rbp
	incq	%rbp
	movq	%rbp, %rdx
	shlq	$62, %rdx
	sarq	$62, %rdx
	xorq	%rdx, %rbp
	setne	28(%rsp)                # 1-byte Folded Spill
	movq	%r9, %rax
	sarq	$63, %rax
	cmpq	%rbx, %r9
	sbbq	%rdx, %rax
	setge	39(%rsp)                # 1-byte Folded Spill
	movabsq	$-1152921504606846976, %rax # imm = 0xF000000000000000
	cmpq	%rax, %rcx
	setl	%bpl
	cmpq	%r12, %r8
	setle	46(%rsp)                # 1-byte Folded Spill
	cmpq	%rax, %rsi
	setl	38(%rsp)                # 1-byte Folded Spill
	movabsq	$1152921504606846975, %rax # imm = 0xFFFFFFFFFFFFFFF
	cmpq	%rax, %rsi
	setg	41(%rsp)                # 1-byte Folded Spill
	cmpq	%rax, %rcx
	movabsq	$-9223372036854775808, %rdx # imm = 0x8000000000000000
	setg	44(%rsp)                # 1-byte Folded Spill
	cmpq	%rdx, %rsi
	sete	42(%rsp)                # 1-byte Folded Spill
	cmpq	%rdx, %r11
	sete	45(%rsp)                # 1-byte Folded Spill
	decq	%rdx
	addq	%r12, %rdx
	seto	26(%rsp)                # 1-byte Folded Spill
	cmpq	120(%rsp), %rdx         # 8-byte Folded Reload
	setge	40(%rsp)                # 1-byte Folded Spill
	negq	%r11
	movq	72(%rsp), %r9           # 8-byte Reload
	seto	32(%rsp)                # 1-byte Folded Spill
	shrq	%r9
	movq	%rdi, %rdx
	addq	%r9, %rdx
	movq	%rdi, %r8
	seto	27(%rsp)                # 1-byte Folded Spill
	subq	%r12, %r8
	seto	31(%rsp)                # 1-byte Folded Spill
	shrq	%r8
	movq	%rdi, 232(%rsp)         # 8-byte Spill
	subq	%r8, %rdi
	seto	25(%rsp)                # 1-byte Folded Spill
	movl	%r10d, %ebx
	andb	7(%rsp), %bl            # 1-byte Folded Reload
	cmovneq	%rdx, %rdi
	movq	64(%rsp), %r11          # 8-byte Reload
	leaq	(%r11,%rdi,8), %rdx
	movq	8(%rsp), %rdi           # 8-byte Reload
	leaq	(%rdi,%rcx,8), %rax
	movq	%rax, 208(%rsp)         # 8-byte Spill
	cmpq	%rax, %rdx
	movq	%rcx, %rdx
	setbe	120(%rsp)               # 1-byte Folded Spill
	subq	48(%rsp), %rdx          # 8-byte Folded Reload
	seto	24(%rsp)                # 1-byte Folded Spill
	subq	%rsi, %rdx
	movq	%rdx, %rax
	seto	23(%rsp)                # 1-byte Folded Spill
	movq	%r9, 224(%rsp)          # 8-byte Spill
	addq	%r9, %rax
	seto	22(%rsp)                # 1-byte Folded Spill
	movq	%r8, 216(%rsp)          # 8-byte Spill
	subq	%r8, %rdx
	seto	%r8b
	testb	%bl, %bl
	cmovneq	%rax, %rdx
	leaq	(%rdi,%rdx,8), %rax
	leaq	(%r11,%rsi,8), %rdx
	movq	%rdx, 200(%rsp)         # 8-byte Spill
	cmpq	%rdx, %rax
	setbe	%al
	orb	120(%rsp), %al          # 1-byte Folded Reload
	cmpb	$1, %al
	jne	.LBB0_40
# BB#38:                                # %if.end119.lr.ph
	movb	47(%rsp), %dl           # 1-byte Reload
	movb	43(%rsp), %dil          # 1-byte Reload
	andb	%dl, %dil
	movb	7(%rsp), %bl            # 1-byte Reload
	orb	%bl, %dil
	movb	39(%rsp), %r9b          # 1-byte Reload
	andb	%r10b, %r9b
	movl	%ebp, %eax
	andb	%r10b, %al
	andb	%bl, %al
	orb	%dil, %al
	andb	%dl, %bpl
	movb	46(%rsp), %dil          # 1-byte Reload
	andb	%dil, %bpl
	orb	%al, %bpl
	orb	%r9b, %bpl
	movb	38(%rsp), %al           # 1-byte Reload
	movl	%eax, %r9d
	andb	%r10b, %r9b
	andb	%bl, %r9b
	andb	%dl, %al
	andb	%dil, %al
	orb	%r9b, %al
	movb	41(%rsp), %r9b          # 1-byte Reload
	movl	%r9d, %r11d
	andb	%r10b, %r11b
	andb	%bl, %r11b
	orb	%al, %r11b
	andb	%dl, %r9b
	andb	%dil, %r9b
	orb	%r11b, %r9b
	movb	44(%rsp), %r11b         # 1-byte Reload
	andb	%r11b, %r10b
	andb	%bl, %r10b
	orb	%r9b, %r10b
	orb	%bpl, %r10b
	andb	%dl, %r11b
	andb	%dil, %r11b
	orb	42(%rsp), %r11b         # 1-byte Folded Reload
	movb	45(%rsp), %al           # 1-byte Reload
	andb	40(%rsp), %al           # 1-byte Folded Reload
	orb	%r11b, %al
	orb	%r10b, %al
	xorb	$1, %al
	testb	$1, %al
	je	.LBB0_40
# BB#39:                                # %if.end119.lr.ph
	movb	6(%rsp), %dl            # 1-byte Reload
	movb	30(%rsp), %bl           # 1-byte Reload
	orb	%bl, %dl
	movb	37(%rsp), %dil          # 1-byte Reload
	orb	%dil, %bl
	movb	33(%rsp), %al           # 1-byte Reload
	orb	%al, %bl
	movl	%r8d, %r11d
	movb	36(%rsp), %r8b          # 1-byte Reload
	orb	%r8b, %bl
	movb	35(%rsp), %r9b          # 1-byte Reload
	movb	29(%rsp), %bpl          # 1-byte Reload
	orb	%r9b, %bpl
	orb	%bl, %bpl
	orb	%al, %dl
	movb	34(%rsp), %r10b         # 1-byte Reload
	movl	%r10d, %eax
	orb	%dil, %al
	orb	%r8b, %al
	orb	%al, %bpl
	orb	%dil, %dl
	orb	%bpl, %dl
	orb	%r8b, %dl
	movb	28(%rsp), %bl           # 1-byte Reload
	orb	%r9b, %bl
	orb	%dl, %bl
	movb	6(%rsp), %bpl           # 1-byte Reload
	orb	%bpl, %al
	orb	%r9b, %al
	movl	%eax, %edx
	orb	%r10b, %dl
	orb	%dil, %dl
	orb	%bl, %dl
	movl	%r8d, %ebx
	orb	%bpl, %bl
	orb	%r9b, %bl
	orb	%r10b, %bl
	orb	%dil, %bl
	orb	%r8b, %bl
	orb	%bpl, %bl
	orb	%r9b, %bl
	orb	%dl, %bl
	orb	26(%rsp), %al           # 1-byte Folded Reload
	orb	%dil, %al
	orb	%r8b, %al
	orb	%r10b, %al
	orb	%bl, %al
	movl	%r9d, %edx
	movb	32(%rsp), %bl           # 1-byte Reload
	orb	%bl, %dl
	orb	27(%rsp), %dl           # 1-byte Folded Reload
	movb	31(%rsp), %bpl          # 1-byte Reload
	orb	%bpl, %dl
	orb	25(%rsp), %dl           # 1-byte Folded Reload
	orb	%dil, %dl
	orb	%r8b, %dl
	orb	%r10b, %dl
	orb	%r9b, %dl
	orb	24(%rsp), %dl           # 1-byte Folded Reload
	orb	23(%rsp), %dl           # 1-byte Folded Reload
	orb	22(%rsp), %dl           # 1-byte Folded Reload
	orb	%bl, %dl
	orb	%al, %dl
	orb	%bpl, %r11b
	orb	%dl, %r11b
	xorb	$1, %r11b
	testb	$1, %r11b
	je	.LBB0_40
# BB#75:                                # %polly.cond1049
	movq	232(%rsp), %r8          # 8-byte Reload
	subq	%rsi, %r8
	cmpq	$0, 72(%rsp)            # 8-byte Folded Reload
	js	.LBB0_76
# BB#81:                                # %polly.parallel.for1063
	movq	%rcx, 128(%rsp)
	movq	48(%rsp), %rax          # 8-byte Reload
	movq	%rax, 136(%rsp)
	movq	%rsi, 144(%rsp)
	movq	%r12, 152(%rsp)
	movq	64(%rsp), %rax          # 8-byte Reload
	movq	%rax, 160(%rsp)
	movq	8(%rsp), %rax           # 8-byte Reload
	movq	%rax, 168(%rsp)
	movq	56(%rsp), %rax          # 8-byte Reload
	movq	%rax, 176(%rsp)
	addq	224(%rsp), %r8          # 8-byte Folded Reload
	leaq	128(%rsp), %rsi
	movl	$_sortV1__polly_subfn_3, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	movq	128(%rsp), %rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	144(%rsp), %r15
	movq	160(%rsp), %rbp
	movq	168(%rsp), %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	leaq	104(%rsp), %rdi
	leaq	96(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	movq	80(%rsp), %rbx          # 8-byte Reload
	je	.LBB0_86
# BB#82:                                # %polly.par.loadIVBounds.preheader.i
	leaq	(%rbp,%r15,8), %r15
	movq	48(%rsp), %rax          # 8-byte Reload
	movq	72(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rax,8), %rbp
	.p2align	4, 0x90
.LBB0_84:                               # %polly.par.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_85 Depth 2
	movq	96(%rsp), %rax
	movq	104(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB0_85:                               # %polly.loop_header.i
                                        #   Parent Loop BB0_84 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%r15,%rcx,8), %rdx
	movq	%rdx, 8(%rbp,%rcx,8)
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB0_85
# BB#83:                                # %polly.par.checkNext.loopexit.i
                                        #   in Loop: Header=BB0_84 Depth=1
	leaq	104(%rsp), %rdi
	leaq	96(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_84
	jmp	.LBB0_86
.LBB0_8:
	movq	%rcx, %r14
.LBB0_9:                                # %while.cond124.preheader
	movq	80(%rsp), %r15          # 8-byte Reload
	cmpq	%r11, %r13
	jl	.LBB0_11
	jmp	.LBB0_18
.LBB0_40:                               # %if.end119.preheader
	movq	56(%rsp), %rdx          # 8-byte Reload
	subq	%rsi, %rdx
	movq	48(%rsp), %rbp          # 8-byte Reload
	subq	%rbp, %rdx
	cmpq	$3, %rdx
	movq	%rcx, %rdi
	movq	%rsi, %rax
	movq	80(%rsp), %rbx          # 8-byte Reload
	movq	64(%rsp), %r10          # 8-byte Reload
	movq	112(%rsp), %r11         # 8-byte Reload
	jbe	.LBB0_41
# BB#48:                                # %min.iters.checked
	movq	%rdx, %r8
	andq	$-4, %r8
	movq	%rcx, %rdi
	movq	%rsi, %rax
	je	.LBB0_41
# BB#49:                                # %vector.memcheck
	leaq	(%r10,%r15,8), %rax
	cmpq	%rax, 208(%rsp)         # 8-byte Folded Reload
	jae	.LBB0_51
# BB#50:                                # %vector.memcheck
	movq	56(%rsp), %rax          # 8-byte Reload
	leaq	(%rcx,%rax), %rax
	leaq	(%rsi,%rbp), %rdi
	subq	%rdi, %rax
	movq	8(%rsp), %rdi           # 8-byte Reload
	leaq	(%rdi,%rax,8), %rax
	cmpq	%rax, 200(%rsp)         # 8-byte Folded Reload
	movq	%rcx, %rdi
	movq	%rsi, %rax
	jb	.LBB0_41
.LBB0_51:                               # %vector.body.preheader
	leaq	-4(%r8), %rdi
	movq	%rdi, %rax
	shrq	$2, %rax
	btl	$2, %edi
	jb	.LBB0_52
# BB#53:                                # %vector.body.prol
	movups	(%r10,%rsi,8), %xmm0
	movups	16(%r10,%rsi,8), %xmm1
	movq	8(%rsp), %rdi           # 8-byte Reload
	movups	%xmm0, (%rdi,%rcx,8)
	movups	%xmm1, 16(%rdi,%rcx,8)
	movl	$4, %r9d
	jmp	.LBB0_54
.LBB0_76:                               # %polly.parallel.for1053
	subq	216(%rsp), %r8          # 8-byte Folded Reload
	movq	%rcx, 128(%rsp)
	movq	48(%rsp), %rax          # 8-byte Reload
	movq	%rax, 136(%rsp)
	movq	%rsi, 144(%rsp)
	movq	%r12, 152(%rsp)
	movq	64(%rsp), %rax          # 8-byte Reload
	movq	%rax, 160(%rsp)
	movq	8(%rsp), %rax           # 8-byte Reload
	movq	%rax, 168(%rsp)
	movq	56(%rsp), %rax          # 8-byte Reload
	movq	%rax, 176(%rsp)
	leaq	128(%rsp), %rsi
	movl	$_sortV1__polly_subfn_2, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	movq	128(%rsp), %rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	144(%rsp), %r15
	movq	160(%rsp), %rbp
	movq	168(%rsp), %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	leaq	104(%rsp), %rdi
	leaq	96(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	movq	80(%rsp), %rbx          # 8-byte Reload
	je	.LBB0_86
# BB#77:                                # %polly.par.loadIVBounds.preheader.i1090
	leaq	(%rbp,%r15,8), %r15
	movq	48(%rsp), %rax          # 8-byte Reload
	movq	72(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rax,8), %rbp
	.p2align	4, 0x90
.LBB0_79:                               # %polly.par.loadIVBounds.i1095
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_80 Depth 2
	movq	96(%rsp), %rax
	movq	104(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB0_80:                               # %polly.loop_header.i1102
                                        #   Parent Loop BB0_79 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%r15,%rcx,8), %rdx
	movq	%rdx, 8(%rbp,%rcx,8)
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB0_80
# BB#78:                                # %polly.par.checkNext.loopexit.i1091
                                        #   in Loop: Header=BB0_79 Depth=1
	leaq	104(%rsp), %rdi
	leaq	96(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_79
.LBB0_86:                               # %_sortV1__polly_subfn_2.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movq	8(%rsp), %r8            # 8-byte Reload
	movq	64(%rsp), %r10          # 8-byte Reload
	movq	88(%rsp), %r9           # 8-byte Reload
	movq	112(%rsp), %r11         # 8-byte Reload
	movq	%rbx, %r15
	cmpq	%r11, %r13
	jl	.LBB0_11
	jmp	.LBB0_18
.LBB0_52:
	xorl	%r9d, %r9d
.LBB0_54:                               # %vector.body.prol.loopexit
	movq	%rbx, %r15
	testq	%rax, %rax
	je	.LBB0_57
# BB#55:                                # %vector.body.preheader.new
	movq	%r8, %rax
	subq	%r9, %rax
	leaq	(%rsi,%r9), %rdi
	leaq	48(%r10,%rdi,8), %rdi
	addq	%rcx, %r9
	movq	8(%rsp), %rbp           # 8-byte Reload
	leaq	48(%rbp,%r9,8), %rbp
	.p2align	4, 0x90
.LBB0_56:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movups	-48(%rdi), %xmm0
	movups	-32(%rdi), %xmm1
	movups	%xmm0, -48(%rbp)
	movups	%xmm1, -32(%rbp)
	movups	-16(%rdi), %xmm0
	movups	(%rdi), %xmm1
	movups	%xmm0, -16(%rbp)
	movups	%xmm1, (%rbp)
	addq	$64, %rdi
	addq	$64, %rbp
	addq	$-8, %rax
	jne	.LBB0_56
.LBB0_57:                               # %middle.block
	cmpq	%r8, %rdx
	jne	.LBB0_59
# BB#58:
	movq	8(%rsp), %r8            # 8-byte Reload
	movq	88(%rsp), %r9           # 8-byte Reload
	cmpq	%r11, %r13
	jl	.LBB0_11
	jmp	.LBB0_18
.LBB0_59:
	leaq	(%rcx,%r8), %rdi
	addq	%rsi, %r8
	movq	%r8, %rax
	movq	48(%rsp), %rbp          # 8-byte Reload
.LBB0_41:                               # %if.end119.preheader1199
	movq	56(%rsp), %rbx          # 8-byte Reload
	movq	%rbp, %r8
	leaq	(%rcx,%rbx), %rbp
	movl	%ebp, %edx
	subl	%edi, %edx
	subl	%esi, %edx
	subl	%r8d, %edx
	leaq	-1(%rcx,%rbx), %rcx
	subq	%rdi, %rcx
	subq	%rsi, %rcx
	subq	%r8, %rcx
	andq	$3, %rdx
	je	.LBB0_42
# BB#43:                                # %if.end119.prol.preheader
	negq	%rdx
	movq	8(%rsp), %r8            # 8-byte Reload
	movq	88(%rsp), %r9           # 8-byte Reload
	.p2align	4, 0x90
.LBB0_44:                               # %if.end119.prol
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r10,%rax,8), %rbx
	movq	%rbx, (%r8,%rdi,8)
	incq	%rdi
	incq	%rax
	incq	%rdx
	jne	.LBB0_44
	jmp	.LBB0_45
.LBB0_42:
	movq	8(%rsp), %r8            # 8-byte Reload
	movq	88(%rsp), %r9           # 8-byte Reload
.LBB0_45:                               # %if.end119.prol.loopexit
	cmpq	$3, %rcx
	jb	.LBB0_9
# BB#46:                                # %if.end119.preheader1199.new
	subq	%rdi, %rbp
	subq	%rsi, %rbp
	subq	48(%rsp), %rbp          # 8-byte Folded Reload
	leaq	24(%r8,%rdi,8), %rcx
	leaq	24(%r10,%rax,8), %rax
	movq	80(%rsp), %r15          # 8-byte Reload
	.p2align	4, 0x90
.LBB0_47:                               # %if.end119
                                        # =>This Inner Loop Header: Depth=1
	movq	-24(%rax), %rdx
	movq	%rdx, -24(%rcx)
	movq	-16(%rax), %rdx
	movq	%rdx, -16(%rcx)
	movq	-8(%rax), %rdx
	movq	%rdx, -8(%rcx)
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	addq	$32, %rcx
	addq	$32, %rax
	addq	$-4, %rbp
	jne	.LBB0_47
# BB#10:                                # %while.cond124.preheader
	cmpq	%r11, %r13
	jge	.LBB0_18
.LBB0_11:                               # %if.end130.preheader
	movq	%r12, %rax
	subq	%r13, %rax
	subq	56(%rsp), %rax          # 8-byte Folded Reload
	cmpq	$3, %rax
	jbe	.LBB0_12
# BB#64:                                # %min.iters.checked1160
	movq	%rax, %rcx
	andq	$-4, %rcx
	je	.LBB0_12
# BB#65:                                # %vector.memcheck1177
	leaq	(%r8,%r14,8), %rdx
	leaq	(%r9,%r11,8), %rsi
	cmpq	%rsi, %rdx
	jae	.LBB0_67
# BB#66:                                # %vector.memcheck1177
	leaq	(%r14,%r12), %rdx
	movq	56(%rsp), %rsi          # 8-byte Reload
	leaq	(%r13,%rsi), %rsi
	subq	%rsi, %rdx
	leaq	(%r8,%rdx,8), %rdx
	leaq	(%r9,%r13,8), %rsi
	cmpq	%rdx, %rsi
	jb	.LBB0_12
.LBB0_67:                               # %vector.body1156.preheader
	leaq	-4(%rcx), %rsi
	movq	%rsi, %rdx
	shrq	$2, %rdx
	btl	$2, %esi
	jb	.LBB0_68
# BB#69:                                # %vector.body1156.prol
	movups	(%r9,%r13,8), %xmm0
	movups	16(%r9,%r13,8), %xmm1
	movups	%xmm0, (%r8,%r14,8)
	movups	%xmm1, 16(%r8,%r14,8)
	movl	$4, %edi
	testq	%rdx, %rdx
	jne	.LBB0_71
	jmp	.LBB0_73
.LBB0_68:
	xorl	%edi, %edi
	testq	%rdx, %rdx
	je	.LBB0_73
.LBB0_71:                               # %vector.body1156.preheader.new
	movq	%rcx, %rdx
	subq	%rdi, %rdx
	leaq	(%r13,%rdi), %rsi
	leaq	48(%r9,%rsi,8), %rsi
	addq	%r14, %rdi
	leaq	48(%r8,%rdi,8), %rdi
	.p2align	4, 0x90
.LBB0_72:                               # %vector.body1156
                                        # =>This Inner Loop Header: Depth=1
	movups	-48(%rsi), %xmm0
	movups	-32(%rsi), %xmm1
	movups	%xmm0, -48(%rdi)
	movups	%xmm1, -32(%rdi)
	movups	-16(%rsi), %xmm0
	movups	(%rsi), %xmm1
	movups	%xmm0, -16(%rdi)
	movups	%xmm1, (%rdi)
	addq	$64, %rsi
	addq	$64, %rdi
	addq	$-8, %rdx
	jne	.LBB0_72
.LBB0_73:                               # %middle.block1157
	cmpq	%rcx, %rax
	je	.LBB0_18
# BB#74:
	addq	%rcx, %r14
	addq	%rcx, %r13
.LBB0_12:                               # %if.end130.preheader1198
	movl	%r12d, %ecx
	subl	%r13d, %ecx
	movq	56(%rsp), %rax          # 8-byte Reload
	movq	%rax, %rdx
	subl	%edx, %ecx
	leaq	-1(%r12), %rax
	subq	%r13, %rax
	subq	%rdx, %rax
	andq	$3, %rcx
	je	.LBB0_15
# BB#13:                                # %if.end130.prol.preheader
	negq	%rcx
	.p2align	4, 0x90
.LBB0_14:                               # %if.end130.prol
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r9,%r13,8), %rdx
	movq	%rdx, (%r8,%r14,8)
	incq	%r14
	incq	%r13
	incq	%rcx
	jne	.LBB0_14
.LBB0_15:                               # %if.end130.prol.loopexit
	cmpq	$3, %rax
	jb	.LBB0_18
# BB#16:                                # %if.end130.preheader1198.new
	leaq	24(%r8,%r14,8), %rax
	subq	%r13, %r12
	subq	56(%rsp), %r12          # 8-byte Folded Reload
	leaq	24(%r9,%r13,8), %rcx
	.p2align	4, 0x90
.LBB0_17:                               # %if.end130
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
	addq	$-4, %r12
	jne	.LBB0_17
.LBB0_18:                               # %if.end137
	testq	%r10, %r10
	je	.LBB0_20
# BB#19:                                # %if.then139
	movq	%r10, %rdi
	movq	%r9, %rbx
	callq	free
	movq	%rbx, %r9
.LBB0_20:                               # %if.end140
	testq	%r9, %r9
	movq	272(%rsp), %r14         # 8-byte Reload
	movq	264(%rsp), %rbp         # 8-byte Reload
	movq	256(%rsp), %rbx         # 8-byte Reload
	je	.LBB0_22
# BB#21:                                # %if.then142
	movq	%r9, %rdi
	callq	free
.LBB0_22:                               # %if.end143
	testq	%rbp, %rbp
	je	.LBB0_24
# BB#23:                                # %if.then145
	movq	%rbp, %rdi
	callq	free
.LBB0_24:                               # %if.end146
	testq	%rbx, %rbx
	je	.LBB0_26
# BB#25:                                # %if.then148
	movq	%rbx, %rdi
	callq	free
.LBB0_26:                               # %if.end149
	movq	248(%rsp), %rdi         # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB0_28
# BB#27:                                # %if.then151
	callq	free
.LBB0_28:                               # %if.end152
	movq	240(%rsp), %rax         # 8-byte Reload
	testq	%rax, %rax
	movq	8(%rsp), %rdi           # 8-byte Reload
	je	.LBB0_30
# BB#29:                                # %if.then154
	movq	%rax, %rdi
	callq	free
	movq	8(%rsp), %rdi           # 8-byte Reload
.LBB0_30:                               # %if.end155
	movq	%r14, (%r15)
	movq	%rdi, %rax
	addq	$280, %rsp              # imm = 0x118
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
	subq	$88, %rsp
.Lcfi19:
	.cfi_def_cfa_offset 144
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
	movq	$0, 16(%rsp)
	movq	$0, 80(%rsp)
	movq	$0, 8(%rsp)
	leaq	16(%rsp), %rdx
	leaq	80(%rsp), %rcx
	callq	convertArgsToIntArray
	movq	%rax, %r12
	movq	(%r12), %rdi
	callq	parseStringToInt
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	(%rax), %r15
	xorl	%edi, %edi
	movq	%r15, %rsi
	callq	create1DArray_int64_t
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	%rax, %rdi
	movq	%r15, %rsi
	callq	copy1DArray_int64_t
	movq	%rax, %r14
	testq	%r15, %r15
	jle	.LBB1_1
# BB#16:                                # %polly.parallel.for
	movq	%r12, 56(%rsp)          # 8-byte Spill
	movq	%r15, 40(%rsp)
	movq	%r14, 48(%rsp)
	leaq	40(%rsp), %rsi
	movl	$main_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r15, %r8
	callq	GOMP_parallel_loop_runtime_start
	movq	40(%rsp), %rbp
	movq	48(%rsp), %r12
	leaq	32(%rsp), %rdi
	leaq	24(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB1_21
# BB#17:
	leaq	32(%rsp), %r13
	leaq	24(%rsp), %rbx
	.p2align	4, 0x90
.LBB1_19:                               # %polly.par.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_20 Depth 2
	movq	24(%rsp), %rax
	movq	32(%rsp), %rcx
	addq	$-2, %rax
	movq	%rbp, %rdx
	subq	%rcx, %rdx
	decq	%rcx
	.p2align	4, 0x90
.LBB1_20:                               # %polly.loop_header.i
                                        #   Parent Loop BB1_19 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rdx, 8(%r12,%rcx,8)
	incq	%rcx
	decq	%rdx
	cmpq	%rax, %rcx
	jle	.LBB1_20
# BB#18:                                # %polly.par.checkNext.loopexit.i
                                        #   in Loop: Header=BB1_19 Depth=1
	movq	%r13, %rdi
	movq	%rbx, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB1_19
.LBB1_21:                               # %main_polly_subfn.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movq	56(%rsp), %r12          # 8-byte Reload
.LBB1_1:                                # %polly.split_new_and_old
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	copy1DArray_int64_t
	leaq	8(%rsp), %r9
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rax, %rdi
	movq	%r15, %rsi
	movq	%r15, %r8
	callq	_sortV1_
	movq	%rax, %r13
	testq	%r14, %r14
	je	.LBB1_3
# BB#2:                                 # %if.end47
	movq	%r14, %rdi
	callq	free
.LBB1_3:                                # %blklab9
	movq	8(%rsp), %rsi
	movq	%r13, %rdi
	callq	copy1DArray_int64_t
	movq	%rax, %rbp
	movq	(%rbp), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movq	-8(%rbp,%r15,8), %rsi
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
	movl	$24, %esi
	movq	%rbx, %rdi
	callq	println_s
	testq	%rbp, %rbp
	je	.LBB1_5
# BB#4:                                 # %if.then101
	movq	%rbp, %rdi
	callq	free
.LBB1_5:                                # %if.end102
	movq	64(%rsp), %rdi          # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB1_7
# BB#6:                                 # %if.then104
	callq	free
.LBB1_7:                                # %if.end105
	testq	%r12, %r12
	je	.LBB1_9
# BB#8:                                 # %if.then107
	movq	16(%rsp), %rsi
	movq	%r12, %rdi
	callq	free2DArray_int64_t
.LBB1_9:                                # %if.end111
	movq	72(%rsp), %rdi          # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB1_11
# BB#10:                                # %if.then113
	callq	free
.LBB1_11:                               # %if.end114
	testq	%r13, %r13
	je	.LBB1_13
# BB#12:                                # %if.then116
	movq	%r13, %rdi
	callq	free
.LBB1_13:                               # %if.end117
	testq	%rbx, %rbx
	je	.LBB1_15
# BB#14:                                # %if.then119
	movq	%rbx, %rdi
	callq	free
.LBB1_15:                               # %if.end120
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
