	.text
	.file	"llvm/MergeSort.original.copyreduced_dealloc.openmp.ll"
	.globl	sortV1
	.p2align	4, 0x90
	.type	sortV1,@function
sortV1:                                 # @sortV1
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp0:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp1:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp2:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp3:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp4:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp5:
	.cfi_def_cfa_offset 56
	subq	$200, %rsp
.Ltmp6:
	.cfi_def_cfa_offset 256
.Ltmp7:
	.cfi_offset %rbx, -56
.Ltmp8:
	.cfi_offset %r12, -48
.Ltmp9:
	.cfi_offset %r13, -40
.Ltmp10:
	.cfi_offset %r14, -32
.Ltmp11:
	.cfi_offset %r15, -24
.Ltmp12:
	.cfi_offset %rbp, -16
	movq	%rcx, %r13
	movq	%rsi, %r15
	movq	%rdi, %r12
	leaq	1(%r13), %rax
	cmpq	%r8, %rax
	jge	.LBB0_67
# BB#1:                                 # %if.end
	leaq	(%r8,%r13), %rax
	movq	%rax, %rbp
	shrq	$63, %rbp
	movq	%rax, 56(%rsp)          # 8-byte Spill
	addq	%rax, %rbp
	sarq	%rbp
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%r13, %rdx
	movq	%rbp, %rcx
	movq	%r8, 40(%rsp)           # 8-byte Spill
	callq	slice
	movq	%rbp, %r14
	subq	%r13, %r14
	xorl	%ebx, %ebx
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movq	%rbp, %r8
	callq	sortV1
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%rbp, %rdx
	movq	40(%rsp), %rcx          # 8-byte Reload
	callq	slice
	movq	40(%rsp), %rsi          # 8-byte Reload
	subq	%rbp, %rsi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rax, %rdi
	movq	%rsi, %r8
	callq	sortV1
	movq	%rbp, %r10
	movq	40(%rsp), %r11          # 8-byte Reload
	movq	%rax, %r15
	movq	%r11, %rbp
	subq	%r10, %rbp
	movq	%r13, 32(%rsp)          # 8-byte Spill
	jle	.LBB0_11
# BB#2:                                 # %if.end
	movq	%r11, %rcx
	subq	%r13, %rcx
	testq	%rcx, %rcx
	jle	.LBB0_11
# BB#3:                                 # %if.end
	testq	%r14, %r14
	movl	$0, %r13d
	movl	$0, %eax
	movq	64(%rsp), %rdi          # 8-byte Reload
	jle	.LBB0_12
# BB#4:                                 # %if.end49.preheader
	xorl	%ebx, %ebx
	xorl	%r13d, %r13d
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_5:                                # %if.end49
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rdi,%rax,8), %rdx
	movq	(%r15,%r13,8), %rsi
	cmpq	%rsi, %rdx
	jle	.LBB0_7
# BB#6:                                 # %blklab3
                                        #   in Loop: Header=BB0_5 Depth=1
	movq	%rsi, (%r12,%rbx,8)
	incq	%r13
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_7:                                # %if.end53
                                        #   in Loop: Header=BB0_5 Depth=1
	movq	%rdx, (%r12,%rbx,8)
	incq	%rax
.LBB0_8:                                # %blklab4
                                        #   in Loop: Header=BB0_5 Depth=1
	incq	%rbx
	cmpq	%rbp, %r13
	jge	.LBB0_12
# BB#9:                                 # %blklab4
                                        #   in Loop: Header=BB0_5 Depth=1
	cmpq	%rcx, %rbx
	jge	.LBB0_12
# BB#10:                                # %blklab4
                                        #   in Loop: Header=BB0_5 Depth=1
	cmpq	%r14, %rax
	jl	.LBB0_5
	jmp	.LBB0_12
.LBB0_11:
	xorl	%r13d, %r13d
	xorl	%eax, %eax
	movq	64(%rsp), %rdi          # 8-byte Reload
.LBB0_12:                               # %while.cond61.preheader
	cmpq	%r14, %rax
	jge	.LBB0_22
# BB#13:                                # %if.end66.lr.ph
	movq	%rbp, 48(%rsp)          # 8-byte Spill
	movq	%r10, 72(%rsp)          # 8-byte Spill
	movq	32(%rsp), %r9           # 8-byte Reload
	movq	%r9, %rdx
	negq	%rdx
	movq	%rdx, 160(%rsp)         # 8-byte Spill
	addq	%rbx, %r14
	subq	%rax, %r14
	movq	%rbx, %r8
	addq	%r8, %r8
	seto	14(%rsp)                # 1-byte Folded Spill
	addq	%r11, %r8
	seto	15(%rsp)                # 1-byte Folded Spill
	movq	%rax, %rdx
	addq	%rdx, %rdx
	seto	21(%rsp)                # 1-byte Folded Spill
	movq	%r9, %rcx
	addq	%rdx, %rcx
	seto	20(%rsp)                # 1-byte Folded Spill
	movq	%rcx, %rsi
	addq	$-1, %rsi
	seto	13(%rsp)                # 1-byte Folded Spill
	cmpq	%rsi, %r8
	setge	27(%rsp)                # 1-byte Folded Spill
	movq	%r11, %rsi
	addq	%r9, %rsi
	seto	19(%rsp)                # 1-byte Folded Spill
	cmpq	$0, 56(%rsp)            # 8-byte Folded Reload
	sets	31(%rsp)                # 1-byte Folded Spill
	setns	%r10b
	movq	%rcx, %rdi
	addq	$2, %rdi
	seto	18(%rsp)                # 1-byte Folded Spill
	cmpq	%r11, %rdi
	setle	96(%rsp)                # 1-byte Folded Spill
	movq	%rcx, %rdi
	incq	%rdi
	seto	16(%rsp)                # 1-byte Folded Spill
	movq	%rcx, %rbp
	sarq	$63, %rbp
	incq	%rbp
	movq	%rbp, %rsi
	shlq	$62, %rsi
	sarq	$62, %rsi
	xorq	%rsi, %rbp
	setne	11(%rsp)                # 1-byte Folded Spill
	movq	%r8, %rbp
	sarq	$63, %rbp
	cmpq	%rcx, %r8
	sbbq	%rsi, %rbp
	setge	23(%rsp)                # 1-byte Folded Spill
	movabsq	$-1152921504606846976, %rcx # imm = 0xF000000000000000
	cmpq	%rcx, %rbx
	setl	22(%rsp)                # 1-byte Folded Spill
	cmpq	%r11, %rdi
	setle	30(%rsp)                # 1-byte Folded Spill
	cmpq	%rcx, %rax
	setl	%r8b
	movabsq	$1152921504606846975, %rsi # imm = 0xFFFFFFFFFFFFFFF
	cmpq	%rsi, %rax
	setg	25(%rsp)                # 1-byte Folded Spill
	cmpq	%rsi, %rbx
	movabsq	$-9223372036854775808, %rsi # imm = 0x8000000000000000
	setg	28(%rsp)                # 1-byte Folded Spill
	cmpq	%rsi, %rax
	sete	26(%rsp)                # 1-byte Folded Spill
	cmpq	%rsi, %r9
	sete	29(%rsp)                # 1-byte Folded Spill
	decq	%rsi
	addq	%r11, %rsi
	seto	9(%rsp)                 # 1-byte Folded Spill
	cmpq	%rdx, %rsi
	setge	24(%rsp)                # 1-byte Folded Spill
	negq	%r9
	movq	56(%rsp), %rdi          # 8-byte Reload
	seto	17(%rsp)                # 1-byte Folded Spill
	shrq	%rdi
	movq	160(%rsp), %r9          # 8-byte Reload
	movq	%r9, %rsi
	addq	%rdi, %rsi
	movq	%r9, %rcx
	seto	10(%rsp)                # 1-byte Folded Spill
	subq	%r11, %rcx
	seto	12(%rsp)                # 1-byte Folded Spill
	shrq	%rcx
	movq	%r9, %rbp
	subq	%rcx, %rbp
	seto	8(%rsp)                 # 1-byte Folded Spill
	movl	%r10d, %r11d
	andb	96(%rsp), %r11b         # 1-byte Folded Reload
	cmovneq	%rsi, %rbp
	movq	64(%rsp), %rdx          # 8-byte Reload
	leaq	(%rdx,%rbp,8), %rsi
	leaq	(%r12,%rbx,8), %rdx
	movq	%rdx, 176(%rsp)         # 8-byte Spill
	cmpq	%rdx, %rsi
	movq	%rbx, %rsi
	setbe	%r9b
	subq	32(%rsp), %rsi          # 8-byte Folded Reload
	seto	6(%rsp)                 # 1-byte Folded Spill
	subq	%rax, %rsi
	movq	%rsi, %rbp
	seto	4(%rsp)                 # 1-byte Folded Spill
	movq	%rdi, 192(%rsp)         # 8-byte Spill
	addq	%rdi, %rbp
	seto	5(%rsp)                 # 1-byte Folded Spill
	movq	%rcx, 184(%rsp)         # 8-byte Spill
	subq	%rcx, %rsi
	seto	7(%rsp)                 # 1-byte Folded Spill
	testb	%r11b, %r11b
	movq	64(%rsp), %rdi          # 8-byte Reload
	cmovneq	%rbp, %rsi
	leaq	(%r12,%rsi,8), %rsi
	leaq	(%rdi,%rax,8), %rcx
	movq	%rcx, 168(%rsp)         # 8-byte Spill
	cmpq	%rcx, %rsi
	setbe	%dl
	orb	%r9b, %dl
	cmpb	$1, %dl
	jne	.LBB0_23
# BB#14:                                # %if.end66.lr.ph
	movb	31(%rsp), %r11b         # 1-byte Reload
	movb	27(%rsp), %cl           # 1-byte Reload
	andb	%r11b, %cl
	movb	96(%rsp), %bpl          # 1-byte Reload
	orb	%bpl, %cl
	movl	%r8d, %r9d
	movb	22(%rsp), %r8b          # 1-byte Reload
	movb	23(%rsp), %sil          # 1-byte Reload
	andb	%r10b, %sil
	movl	%r8d, %edx
	andb	%r10b, %dl
	andb	%bpl, %dl
	orb	%cl, %dl
	andb	%r11b, %r8b
	movb	30(%rsp), %cl           # 1-byte Reload
	andb	%cl, %r8b
	orb	%dl, %r8b
	orb	%sil, %r8b
	movl	%r9d, %edx
	andb	%r10b, %dl
	andb	%bpl, %dl
	andb	%r11b, %r9b
	movl	%ecx, %esi
	andb	%sil, %r9b
	orb	%dl, %r9b
	movb	25(%rsp), %cl           # 1-byte Reload
	movl	%ecx, %edx
	andb	%r10b, %dl
	andb	%bpl, %dl
	orb	%r9b, %dl
	andb	%r11b, %cl
	andb	%sil, %cl
	orb	%dl, %cl
	movb	28(%rsp), %dl           # 1-byte Reload
	andb	%dl, %r10b
	andb	%bpl, %r10b
	orb	%cl, %r10b
	orb	%r8b, %r10b
	andb	%r11b, %dl
	andb	%sil, %dl
	orb	26(%rsp), %dl           # 1-byte Folded Reload
	movb	29(%rsp), %cl           # 1-byte Reload
	andb	24(%rsp), %cl           # 1-byte Folded Reload
	orb	%dl, %cl
	orb	%r10b, %cl
	xorb	$1, %cl
	testb	$1, %cl
	je	.LBB0_23
# BB#15:                                # %if.end66.lr.ph
	movb	16(%rsp), %bpl          # 1-byte Reload
	movl	%ebp, %edx
	movb	14(%rsp), %cl           # 1-byte Reload
	orb	%cl, %dl
	movb	21(%rsp), %r8b          # 1-byte Reload
	orb	%r8b, %cl
	movb	15(%rsp), %r11b         # 1-byte Reload
	orb	%r11b, %cl
	movb	20(%rsp), %r9b          # 1-byte Reload
	orb	%r9b, %cl
	movb	19(%rsp), %r10b         # 1-byte Reload
	movb	13(%rsp), %sil          # 1-byte Reload
	orb	%r10b, %sil
	orb	%cl, %sil
	orb	%r11b, %dl
	movb	18(%rsp), %r11b         # 1-byte Reload
	movl	%r11d, %ecx
	orb	%r8b, %cl
	orb	%r9b, %cl
	orb	%cl, %sil
	orb	%r8b, %dl
	orb	%sil, %dl
	orb	%r9b, %dl
	movq	%r15, 96(%rsp)          # 8-byte Spill
	movb	11(%rsp), %r15b         # 1-byte Reload
	orb	%r10b, %r15b
	orb	%dl, %r15b
	orb	%bpl, %cl
	orb	%r10b, %cl
	movl	%ecx, %esi
	orb	%r11b, %sil
	orb	%r8b, %sil
	orb	%r15b, %sil
	movq	96(%rsp), %r15          # 8-byte Reload
	movl	%r9d, %edx
	orb	%bpl, %dl
	orb	%r10b, %dl
	orb	%r11b, %dl
	orb	%r8b, %dl
	orb	%r9b, %dl
	orb	%bpl, %dl
	orb	%r10b, %dl
	orb	%sil, %dl
	orb	9(%rsp), %cl            # 1-byte Folded Reload
	orb	%r8b, %cl
	orb	%r9b, %cl
	orb	%r11b, %cl
	orb	%dl, %cl
	movl	%r10d, %edx
	movb	17(%rsp), %sil          # 1-byte Reload
	orb	%sil, %dl
	orb	10(%rsp), %dl           # 1-byte Folded Reload
	movb	12(%rsp), %bpl          # 1-byte Reload
	orb	%bpl, %dl
	orb	8(%rsp), %dl            # 1-byte Folded Reload
	orb	%r8b, %dl
	orb	%r9b, %dl
	orb	%r11b, %dl
	orb	%r10b, %dl
	orb	6(%rsp), %dl            # 1-byte Folded Reload
	orb	4(%rsp), %dl            # 1-byte Folded Reload
	orb	5(%rsp), %dl            # 1-byte Folded Reload
	orb	%cl, %dl
	orb	%bpl, %sil
	orb	7(%rsp), %sil           # 1-byte Folded Reload
	orb	%dl, %sil
	xorb	$1, %sil
	testb	$1, %sil
	je	.LBB0_23
# BB#16:                                # %polly.cond977
	movq	160(%rsp), %r8          # 8-byte Reload
	subq	%rax, %r8
	cmpq	$0, 56(%rsp)            # 8-byte Folded Reload
	js	.LBB0_34
# BB#17:                                # %polly.parallel.for991
	movq	%rbx, 104(%rsp)
	movq	32(%rsp), %rcx          # 8-byte Reload
	movq	%rcx, 112(%rsp)
	movq	%rax, 120(%rsp)
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	%rax, 128(%rsp)
	movq	%rdi, 136(%rsp)
	movq	%r12, 144(%rsp)
	movq	72(%rsp), %rax          # 8-byte Reload
	movq	%rax, 152(%rsp)
	addq	192(%rsp), %r8          # 8-byte Folded Reload
	leaq	104(%rsp), %rsi
	movl	$sortV1_polly_subfn_3, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	movq	104(%rsp), %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	120(%rsp), %rbx
	movq	136(%rsp), %rbp
	movq	144(%rsp), %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	leaq	88(%rsp), %rdi
	leaq	80(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB0_39
# BB#18:                                # %polly.par.loadIVBounds.preheader.i
	leaq	(%rbp,%rbx,8), %rbx
	movq	32(%rsp), %rax          # 8-byte Reload
	movq	56(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rax,8), %rbp
	.p2align	4, 0x90
.LBB0_19:                               # %polly.par.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_20 Depth 2
	movq	80(%rsp), %rax
	movq	88(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB0_20:                               # %polly.loop_header.i
                                        #   Parent Loop BB0_19 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%rbx,%rcx,8), %rdx
	movq	%rdx, 8(%rbp,%rcx,8)
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB0_20
# BB#21:                                # %polly.par.checkNext.loopexit.i
                                        #   in Loop: Header=BB0_19 Depth=1
	leaq	88(%rsp), %rdi
	leaq	80(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_19
	jmp	.LBB0_39
.LBB0_22:
	movq	%rbx, %r14
	jmp	.LBB0_48
.LBB0_23:                               # %if.end66.preheader
	movq	72(%rsp), %r10          # 8-byte Reload
	movq	%r10, %r11
	subq	%rax, %r11
	movq	32(%rsp), %r8           # 8-byte Reload
	subq	%r8, %r11
	cmpq	$3, %r11
	movq	%rbx, %rdx
	movq	%rax, %rbp
	jbe	.LBB0_41
# BB#24:                                # %min.iters.checked
	movq	%r11, %r9
	andq	$-4, %r9
	movq	%rbx, %rdx
	movq	%rax, %rbp
	je	.LBB0_41
# BB#25:                                # %vector.memcheck
	leaq	-1(%r10), %rdx
	subq	%r8, %rdx
	leaq	(%rdi,%rdx,8), %rdx
	cmpq	%rdx, 176(%rsp)         # 8-byte Folded Reload
	ja	.LBB0_27
# BB#26:                                # %vector.memcheck
	leaq	-1(%rbx,%r10), %rdx
	leaq	(%rax,%r8), %rsi
	subq	%rsi, %rdx
	leaq	(%r12,%rdx,8), %rdx
	cmpq	%rdx, 168(%rsp)         # 8-byte Folded Reload
	movq	%rbx, %rdx
	movq	%rax, %rbp
	jbe	.LBB0_41
.LBB0_27:                               # %vector.body.preheader
	leaq	-4(%r9), %r10
	shrq	$2, %r10
	leal	1(%r10), %r8d
	andl	$1, %r8d
	xorl	%ecx, %ecx
	testq	%r10, %r10
	je	.LBB0_30
# BB#28:                                # %vector.body.preheader.new
	leaq	48(%rdi,%rax,8), %rbp
	leaq	48(%r12,%rbx,8), %rdx
	leaq	-1(%r8), %rsi
	subq	%r10, %rsi
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_29:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movups	-48(%rbp,%rcx,8), %xmm0
	movups	-32(%rbp,%rcx,8), %xmm1
	movups	%xmm0, -48(%rdx,%rcx,8)
	movups	%xmm1, -32(%rdx,%rcx,8)
	movups	-16(%rbp,%rcx,8), %xmm0
	movups	(%rbp,%rcx,8), %xmm1
	movups	%xmm0, -16(%rdx,%rcx,8)
	movups	%xmm1, (%rdx,%rcx,8)
	addq	$8, %rcx
	addq	$2, %rsi
	jne	.LBB0_29
.LBB0_30:                               # %middle.block.unr-lcssa
	testq	%r8, %r8
	je	.LBB0_32
# BB#31:                                # %vector.body.epil
	leaq	(%rbx,%rcx), %rdx
	addq	%rax, %rcx
	movups	(%rdi,%rcx,8), %xmm0
	movups	16(%rdi,%rcx,8), %xmm1
	movups	%xmm0, (%r12,%rdx,8)
	movups	%xmm1, 16(%r12,%rdx,8)
.LBB0_32:                               # %middle.block
	cmpq	%r9, %r11
	movq	72(%rsp), %r10          # 8-byte Reload
	jne	.LBB0_40
# BB#33:
	movq	40(%rsp), %r11          # 8-byte Reload
	jmp	.LBB0_47
.LBB0_34:                               # %polly.parallel.for981
	subq	184(%rsp), %r8          # 8-byte Folded Reload
	movq	%rbx, 104(%rsp)
	movq	32(%rsp), %rcx          # 8-byte Reload
	movq	%rcx, 112(%rsp)
	movq	%rax, 120(%rsp)
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	%rax, 128(%rsp)
	movq	%rdi, 136(%rsp)
	movq	%r12, 144(%rsp)
	movq	72(%rsp), %rax          # 8-byte Reload
	movq	%rax, 152(%rsp)
	leaq	104(%rsp), %rsi
	movl	$sortV1_polly_subfn_2, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	movq	104(%rsp), %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	120(%rsp), %rbx
	movq	136(%rsp), %rbp
	movq	144(%rsp), %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	leaq	88(%rsp), %rdi
	leaq	80(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB0_39
# BB#35:                                # %polly.par.loadIVBounds.preheader.i1010
	leaq	(%rbp,%rbx,8), %rbx
	movq	32(%rsp), %rax          # 8-byte Reload
	movq	56(%rsp), %rcx          # 8-byte Reload
	leaq	(%rcx,%rax,8), %rbp
	.p2align	4, 0x90
.LBB0_36:                               # %polly.par.loadIVBounds.i1015
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_37 Depth 2
	movq	80(%rsp), %rax
	movq	88(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB0_37:                               # %polly.loop_header.i1022
                                        #   Parent Loop BB0_36 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%rbx,%rcx,8), %rdx
	movq	%rdx, 8(%rbp,%rcx,8)
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB0_37
# BB#38:                                # %polly.par.checkNext.loopexit.i1011
                                        #   in Loop: Header=BB0_36 Depth=1
	leaq	88(%rsp), %rdi
	leaq	80(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_36
.LBB0_39:                               # %sortV1_polly_subfn_2.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movq	64(%rsp), %rdi          # 8-byte Reload
	movq	40(%rsp), %r11          # 8-byte Reload
	movq	72(%rsp), %r10          # 8-byte Reload
	jmp	.LBB0_47
.LBB0_40:
	leaq	(%rbx,%r9), %rdx
	addq	%rax, %r9
	movq	%r9, %rbp
	movq	32(%rsp), %r8           # 8-byte Reload
.LBB0_41:                               # %if.end66.preheader1075
	leaq	(%rbx,%r10), %rcx
	subl	%edx, %ecx
	subl	%eax, %ecx
	subl	%r8d, %ecx
	leaq	-1(%rbx,%r10), %rsi
	subq	%rdx, %rsi
	subq	%rax, %rsi
	subq	%r8, %rsi
	andl	$3, %ecx
	cmpq	$3, %rsi
	movq	40(%rsp), %r11          # 8-byte Reload
	jb	.LBB0_44
# BB#42:                                # %if.end66.preheader1075.new
	addq	%rdx, %rax
	addq	%r8, %rax
	addq	%rcx, %rax
	subq	%rbx, %rax
	subq	%r10, %rax
	.p2align	4, 0x90
.LBB0_43:                               # %if.end66
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rdi,%rbp,8), %rsi
	movq	%rsi, (%r12,%rdx,8)
	movq	8(%rdi,%rbp,8), %rsi
	movq	%rsi, 8(%r12,%rdx,8)
	movq	16(%rdi,%rbp,8), %rsi
	movq	%rsi, 16(%r12,%rdx,8)
	movq	24(%rdi,%rbp,8), %rsi
	movq	%rsi, 24(%r12,%rdx,8)
	addq	$4, %rdx
	addq	$4, %rbp
	addq	$4, %rax
	jne	.LBB0_43
.LBB0_44:                               # %while.cond71.preheader.loopexit.unr-lcssa
	testq	%rcx, %rcx
	je	.LBB0_47
# BB#45:                                # %if.end66.epil.preheader
	leaq	(%r12,%rdx,8), %rax
	leaq	(%rdi,%rbp,8), %rdx
	negq	%rcx
	.p2align	4, 0x90
.LBB0_46:                               # %if.end66.epil
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rdx), %rsi
	movq	%rsi, (%rax)
	addq	$8, %rax
	addq	$8, %rdx
	incq	%rcx
	jne	.LBB0_46
.LBB0_47:
	movq	48(%rsp), %rbp          # 8-byte Reload
.LBB0_48:                               # %while.cond71.preheader
	cmpq	%rbp, %r13
	jge	.LBB0_66
# BB#49:                                # %if.end76.preheader
	movq	%r11, %rax
	subq	%r13, %rax
	subq	%r10, %rax
	cmpq	$3, %rax
	jbe	.LBB0_60
# BB#50:                                # %min.iters.checked1042
	movq	%rax, %r9
	andq	$-4, %r9
	je	.LBB0_60
# BB#51:                                # %vector.memcheck1059
	leaq	(%r12,%r14,8), %rdx
	leaq	-1(%r11), %rsi
	subq	%r10, %rsi
	leaq	(%r15,%rsi,8), %rsi
	cmpq	%rsi, %rdx
	ja	.LBB0_53
# BB#52:                                # %vector.memcheck1059
	leaq	-1(%r14,%r11), %rdx
	leaq	(%r13,%r10), %rsi
	subq	%rsi, %rdx
	leaq	(%r12,%rdx,8), %rdx
	leaq	(%r15,%r13,8), %rsi
	cmpq	%rdx, %rsi
	jbe	.LBB0_60
.LBB0_53:                               # %vector.body1038.preheader
	movq	%rbp, 48(%rsp)          # 8-byte Spill
	leaq	-4(%r9), %rdx
	shrq	$2, %rdx
	leal	1(%rdx), %r8d
	andl	$1, %r8d
	xorl	%esi, %esi
	testq	%rdx, %rdx
	je	.LBB0_56
# BB#54:                                # %vector.body1038.preheader.new
	leaq	48(%r15,%r13,8), %rcx
	leaq	48(%r12,%r14,8), %rbp
	leaq	-1(%r8), %rbx
	subq	%rdx, %rbx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB0_55:                               # %vector.body1038
                                        # =>This Inner Loop Header: Depth=1
	movups	-48(%rcx,%rsi,8), %xmm0
	movups	-32(%rcx,%rsi,8), %xmm1
	movups	%xmm0, -48(%rbp,%rsi,8)
	movups	%xmm1, -32(%rbp,%rsi,8)
	movups	-16(%rcx,%rsi,8), %xmm0
	movups	(%rcx,%rsi,8), %xmm1
	movups	%xmm0, -16(%rbp,%rsi,8)
	movups	%xmm1, (%rbp,%rsi,8)
	addq	$8, %rsi
	addq	$2, %rbx
	jne	.LBB0_55
.LBB0_56:                               # %middle.block1039.unr-lcssa
	testq	%r8, %r8
	je	.LBB0_58
# BB#57:                                # %vector.body1038.epil
	leaq	(%r14,%rsi), %rdx
	addq	%r13, %rsi
	movups	(%r15,%rsi,8), %xmm0
	movups	16(%r15,%rsi,8), %xmm1
	movups	%xmm0, (%r12,%rdx,8)
	movups	%xmm1, 16(%r12,%rdx,8)
.LBB0_58:                               # %middle.block1039
	cmpq	%r9, %rax
	movq	48(%rsp), %rbp          # 8-byte Reload
	je	.LBB0_66
# BB#59:
	addq	%r9, %r14
	addq	%r9, %r13
.LBB0_60:                               # %if.end76.preheader1074
	movl	%r11d, %eax
	subl	%r13d, %eax
	subl	%r10d, %eax
	decq	%r11
	subq	%r13, %r11
	subq	%r10, %r11
	andl	$3, %eax
	cmpq	$3, %r11
	jb	.LBB0_63
# BB#61:                                # %if.end76.preheader1074.new
	subq	%rax, %rbp
	.p2align	4, 0x90
.LBB0_62:                               # %if.end76
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r15,%r13,8), %rcx
	movq	%rcx, (%r12,%r14,8)
	movq	8(%r15,%r13,8), %rcx
	movq	%rcx, 8(%r12,%r14,8)
	movq	16(%r15,%r13,8), %rcx
	movq	%rcx, 16(%r12,%r14,8)
	movq	24(%r15,%r13,8), %rcx
	movq	%rcx, 24(%r12,%r14,8)
	addq	$4, %r14
	addq	$4, %r13
	cmpq	%r13, %rbp
	jne	.LBB0_62
.LBB0_63:                               # %if.then85.loopexit.unr-lcssa
	testq	%rax, %rax
	je	.LBB0_66
# BB#64:                                # %if.end76.epil.preheader
	leaq	(%r12,%r14,8), %rcx
	leaq	(%r15,%r13,8), %rdx
	negq	%rax
	.p2align	4, 0x90
.LBB0_65:                               # %if.end76.epil
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rdx), %rsi
	movq	%rsi, (%rcx)
	addq	$8, %rcx
	addq	$8, %rdx
	incq	%rax
	jne	.LBB0_65
.LBB0_66:                               # %if.then85
	callq	free
	movq	%r15, %rdi
	callq	free
.LBB0_67:                               # %if.end101
	movq	%r12, %rax
	addq	$200, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end0:
	.size	sortV1, .Lfunc_end0-sortV1
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
.Ltmp13:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp14:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp15:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp16:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp17:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp18:
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
.Ltmp19:
	.cfi_def_cfa_offset 112
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
.Ltmp25:
	.cfi_offset %rbp, -16
	movl	%edi, %ebx
	callq	convertArgsToIntArray
	movq	%rax, %rbp
	decl	%ebx
	movslq	%ebx, %rbx
	movq	(%rbp), %rdi
	callq	parseStringToInt
	testq	%rax, %rax
	je	.LBB1_3
# BB#1:                                 # %if.end8
	movq	%rbx, 40(%rsp)          # 8-byte Spill
	movq	%rbp, 48(%rsp)          # 8-byte Spill
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	(%rax), %rbx
	xorl	%edi, %edi
	movl	%ebx, %esi
	callq	create1DArray
	movq	%rax, %r13
	testq	%rbx, %rbx
	jle	.LBB1_2
# BB#5:                                 # %polly.parallel.for
	movq	%rbx, 16(%rsp)
	movq	%r13, 24(%rsp)
	leaq	16(%rsp), %rsi
	movl	$main_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%rbx, %r8
	callq	GOMP_parallel_loop_runtime_start
	movq	16(%rsp), %r15
	movq	24(%rsp), %r12
	leaq	8(%rsp), %rdi
	leaq	(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB1_10
# BB#6:
	leaq	8(%rsp), %rbp
	leaq	(%rsp), %r14
	.p2align	4, 0x90
.LBB1_8:                                # %polly.par.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_9 Depth 2
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	addq	$-2, %rax
	movq	%r15, %rdx
	subq	%rcx, %rdx
	decq	%rcx
	.p2align	4, 0x90
.LBB1_9:                                # %polly.loop_header.i
                                        #   Parent Loop BB1_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rdx, 8(%r12,%rcx,8)
	incq	%rcx
	decq	%rdx
	cmpq	%rax, %rcx
	jle	.LBB1_9
# BB#7:                                 # %polly.par.checkNext.loopexit.i
                                        #   in Loop: Header=BB1_8 Depth=1
	movq	%rbp, %rdi
	movq	%r14, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB1_8
.LBB1_10:                               # %main_polly_subfn.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
.LBB1_2:                                # %if.then73
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%r13, %rdi
	movq	%rbx, %rsi
	movq	%rbx, %r8
	callq	sortV1
	movq	%rax, %r13
	movq	(%r13), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movq	-8(%r13,%rbx,8), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%edi, %edi
	movl	$24, %esi
	callq	create1DArray
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
	movq	32(%rsp), %rdi          # 8-byte Reload
	callq	free
	movq	%r13, %rdi
	callq	free
	movq	48(%rsp), %rdi          # 8-byte Reload
	movq	40(%rsp), %rsi          # 8-byte Reload
	callq	free2DArray
	movq	%rbx, %rdi
	callq	free
	xorl	%edi, %edi
	callq	exit
.LBB1_3:                                # %if.end92.critedge
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	callq	free2DArray
	xorl	%edi, %edi
	callq	exit
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc

	.p2align	4, 0x90
	.type	sortV1_polly_subfn_2,@function
sortV1_polly_subfn_2:                   # @sortV1_polly_subfn_2
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp26:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp27:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp28:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp29:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp30:
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
.Ltmp31:
	.cfi_def_cfa_offset 64
.Ltmp32:
	.cfi_offset %rbx, -48
.Ltmp33:
	.cfi_offset %r12, -40
.Ltmp34:
	.cfi_offset %r13, -32
.Ltmp35:
	.cfi_offset %r14, -24
.Ltmp36:
	.cfi_offset %r15, -16
	movq	(%rdi), %r14
	movq	16(%rdi), %r15
	movq	32(%rdi), %rbx
	movq	40(%rdi), %r13
	leaq	8(%rsp), %rdi
	leaq	(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB2_2
# BB#1:                                 # %polly.par.loadIVBounds.preheader
	leaq	(%rbx,%r15,8), %r12
	leaq	(%r13,%r14,8), %rbx
	leaq	8(%rsp), %r14
	leaq	(%rsp), %r15
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
	.size	sortV1_polly_subfn_2, .Lfunc_end2-sortV1_polly_subfn_2
	.cfi_endproc

	.p2align	4, 0x90
	.type	sortV1_polly_subfn_3,@function
sortV1_polly_subfn_3:                   # @sortV1_polly_subfn_3
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp37:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp38:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp39:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp40:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp41:
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
.Ltmp42:
	.cfi_def_cfa_offset 64
.Ltmp43:
	.cfi_offset %rbx, -48
.Ltmp44:
	.cfi_offset %r12, -40
.Ltmp45:
	.cfi_offset %r13, -32
.Ltmp46:
	.cfi_offset %r14, -24
.Ltmp47:
	.cfi_offset %r15, -16
	movq	(%rdi), %r14
	movq	16(%rdi), %r15
	movq	32(%rdi), %rbx
	movq	40(%rdi), %r13
	leaq	8(%rsp), %rdi
	leaq	(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB3_2
# BB#1:                                 # %polly.par.loadIVBounds.preheader
	leaq	(%rbx,%r15,8), %r12
	leaq	(%r13,%r14,8), %rbx
	leaq	8(%rsp), %r14
	leaq	(%rsp), %r15
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
	.size	sortV1_polly_subfn_3, .Lfunc_end3-sortV1_polly_subfn_3
	.cfi_endproc

	.p2align	4, 0x90
	.type	main_polly_subfn,@function
main_polly_subfn:                       # @main_polly_subfn
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r15
.Ltmp48:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp49:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp50:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp51:
	.cfi_def_cfa_offset 40
	subq	$24, %rsp
.Ltmp52:
	.cfi_def_cfa_offset 64
.Ltmp53:
	.cfi_offset %rbx, -40
.Ltmp54:
	.cfi_offset %r12, -32
.Ltmp55:
	.cfi_offset %r14, -24
.Ltmp56:
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
	.asciz	"%lld\n"
	.size	.L.str, 6


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git aec29e5973c27bcbc3c1cf54295e3778050a73cd) (http://llvm.org/git/llvm.git 4c6356e8c64e246972f760a1f05bc0f365b090ad)"
	.section	".note.GNU-stack","",@progbits
