	.text
	.file	"llvm/MergeSort.original.openmp.nocopy.disabledpattern.out.ll"
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
	movq	%r8, 240(%rsp)          # 8-byte Spill
	movq	%rcx, %rbp
	movq	%rdx, %r13
	movq	%rsi, %r8
	movq	$0, 256(%rsp)
	movq	$0, 248(%rsp)
	leaq	1(%r13), %rax
	cmpq	%rbp, %rax
	jge	.LBB0_13
# BB#1:                                 # %if.end
	leaq	(%rbp,%r13), %rax
	movq	%rax, %rbx
	shrq	$63, %rbx
	movq	%rax, 128(%rsp)         # 8-byte Spill
	addq	%rax, %rbx
	sarq	%rbx
	movq	%r8, %rsi
	movl	%r13d, %edx
	movl	%ebx, %ecx
	movq	%rbp, 40(%rsp)          # 8-byte Spill
	movq	%rdi, %rbp
	movq	%r8, %r14
	callq	slice
	movq	%rbx, %rsi
	subq	%r13, %rsi
	xorl	%r15d, %r15d
	leaq	256(%rsp), %r8
	xorl	%edx, %edx
	movq	%rax, 136(%rsp)         # 8-byte Spill
	movq	%rax, %rdi
	movq	%rsi, %rax
	movq	%rax, 104(%rsp)         # 8-byte Spill
	movq	%rbx, %rcx
	callq	_sortV1_
	movq	%rax, 200(%rsp)         # 8-byte Spill
	movq	%rbp, 48(%rsp)          # 8-byte Spill
	movq	%rbp, %rdi
	movq	%r14, 96(%rsp)          # 8-byte Spill
	movq	%r14, %rsi
	movl	%ebx, %edx
	movq	40(%rsp), %rcx          # 8-byte Reload
                                        # kill: %ECX<def> %ECX<kill> %RCX<kill>
	callq	slice
	movq	%rax, %r12
	movq	40(%rsp), %rsi          # 8-byte Reload
	subq	%rbx, %rsi
	leaq	248(%rsp), %r8
	xorl	%edx, %edx
	movq	%r12, %rdi
	movq	%rsi, %rcx
	callq	_sortV1_
	movq	%rbx, %r9
	movq	40(%rsp), %r10          # 8-byte Reload
	movq	%r10, %rbp
	subq	%r9, %rbp
	jle	.LBB0_2
# BB#14:                                # %if.end
	movq	%r10, %rcx
	subq	%r13, %rcx
	testq	%rcx, %rcx
	jle	.LBB0_2
# BB#15:                                # %if.end
	movq	104(%rsp), %rbx         # 8-byte Reload
	testq	%rbx, %rbx
	movl	$0, %r14d
	movl	$0, %eax
	movq	48(%rsp), %rdi          # 8-byte Reload
	movq	136(%rsp), %r11         # 8-byte Reload
	jle	.LBB0_3
# BB#16:                                # %if.end24.preheader
	xorl	%eax, %eax
	xorl	%r14d, %r14d
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB0_17:                               # %if.end24
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r11,%r15,8), %rdx
	movq	(%r12,%r14,8), %rsi
	cmpq	%rsi, %rdx
	jle	.LBB0_18
# BB#41:                                # %blklab3
                                        #   in Loop: Header=BB0_17 Depth=1
	movq	%rsi, (%rdi,%rax,8)
	incq	%r14
	jmp	.LBB0_42
	.p2align	4, 0x90
.LBB0_18:                               # %if.end29
                                        #   in Loop: Header=BB0_17 Depth=1
	movq	%rdx, (%rdi,%rax,8)
	incq	%r15
.LBB0_42:                               # %blklab4
                                        #   in Loop: Header=BB0_17 Depth=1
	incq	%rax
	cmpq	%rbp, %r14
	jge	.LBB0_3
# BB#43:                                # %blklab4
                                        #   in Loop: Header=BB0_17 Depth=1
	cmpq	%rcx, %rax
	jge	.LBB0_3
# BB#44:                                # %blklab4
                                        #   in Loop: Header=BB0_17 Depth=1
	cmpq	%rbx, %r15
	jl	.LBB0_17
	jmp	.LBB0_3
.LBB0_2:
	xorl	%r14d, %r14d
	xorl	%eax, %eax
	movq	48(%rsp), %rdi          # 8-byte Reload
	movq	104(%rsp), %rbx         # 8-byte Reload
.LBB0_3:                                # %while.cond37.preheader
	movq	%r13, 32(%rsp)          # 8-byte Spill
	movq	%rbx, %r13
	subq	%r15, %r13
	jle	.LBB0_4
# BB#19:                                # %if.end43.lr.ph
	movq	%r9, 112(%rsp)          # 8-byte Spill
	movq	%rbp, 56(%rsp)          # 8-byte Spill
	movq	%r12, 64(%rsp)          # 8-byte Spill
	movq	32(%rsp), %rbp          # 8-byte Reload
	movq	%rbp, %rcx
	negq	%rcx
	movq	%rcx, 88(%rsp)          # 8-byte Spill
	addq	%rax, %r13
	movq	%rax, %rdx
	addq	%rdx, %rdx
	seto	16(%rsp)                # 1-byte Folded Spill
	addq	%r10, %rdx
	seto	17(%rsp)                # 1-byte Folded Spill
	movq	%r15, %rcx
	addq	%rcx, %rcx
	movq	%rcx, 120(%rsp)         # 8-byte Spill
	seto	23(%rsp)                # 1-byte Folded Spill
	movq	%rbp, %rsi
	addq	%rcx, %rsi
	seto	22(%rsp)                # 1-byte Folded Spill
	movq	%rsi, %rcx
	addq	$-1, %rcx
	seto	15(%rsp)                # 1-byte Folded Spill
	cmpq	%rcx, %rdx
	setge	28(%rsp)                # 1-byte Folded Spill
	movq	%r10, %rcx
	addq	%rbp, %rcx
	seto	21(%rsp)                # 1-byte Folded Spill
	cmpq	$0, 128(%rsp)           # 8-byte Folded Reload
	sets	31(%rsp)                # 1-byte Folded Spill
	setns	%r9b
	movq	%rsi, %rcx
	addq	$2, %rcx
	seto	20(%rsp)                # 1-byte Folded Spill
	cmpq	%r10, %rcx
	setle	%bl
	movq	%rsi, %r8
	incq	%r8
	seto	18(%rsp)                # 1-byte Folded Spill
	movq	%rsi, %rdi
	sarq	$63, %rdi
	incq	%rdi
	movq	%rdi, %rcx
	shlq	$62, %rcx
	sarq	$62, %rcx
	xorq	%rcx, %rdi
	setne	13(%rsp)                # 1-byte Folded Spill
	movq	%rdx, %rdi
	sarq	$63, %rdi
	cmpq	%rsi, %rdx
	sbbq	%rcx, %rdi
	setge	24(%rsp)                # 1-byte Folded Spill
	movabsq	$-1152921504606846976, %rcx # imm = 0xF000000000000000
	cmpq	%rcx, %rax
	setl	%r11b
	cmpq	%r10, %r8
	setle	30(%rsp)                # 1-byte Folded Spill
	cmpq	%rcx, %r15
	setl	%r12b
	movabsq	$1152921504606846975, %rcx # imm = 0xFFFFFFFFFFFFFFF
	cmpq	%rcx, %r15
	setg	26(%rsp)                # 1-byte Folded Spill
	cmpq	%rcx, %rax
	movabsq	$-9223372036854775808, %rcx # imm = 0x8000000000000000
	setg	29(%rsp)                # 1-byte Folded Spill
	cmpq	%rcx, %r15
	sete	27(%rsp)                # 1-byte Folded Spill
	movq	%rbp, %rdx
	cmpq	%rcx, %rdx
	sete	%bpl
	decq	%rcx
	addq	%r10, %rcx
	seto	11(%rsp)                # 1-byte Folded Spill
	cmpq	120(%rsp), %rcx         # 8-byte Folded Reload
	movq	%rdx, %rcx
	setge	25(%rsp)                # 1-byte Folded Spill
	negq	%rcx
	movq	128(%rsp), %rdi         # 8-byte Reload
	movq	88(%rsp), %rdx          # 8-byte Reload
	seto	19(%rsp)                # 1-byte Folded Spill
	shrq	%rdi
	movq	%rdx, %rcx
	addq	%rdi, %rcx
	movq	%rdx, %r8
	seto	12(%rsp)                # 1-byte Folded Spill
	subq	%r10, %r8
	seto	14(%rsp)                # 1-byte Folded Spill
	shrq	%r8
	movq	%rdx, %rsi
	subq	%r8, %rsi
	seto	10(%rsp)                # 1-byte Folded Spill
	movl	%r9d, %r10d
	movb	%bl, 120(%rsp)          # 1-byte Spill
	andb	%bl, %r10b
	cmovneq	%rcx, %rsi
	movq	136(%rsp), %rbx         # 8-byte Reload
	leaq	(%rbx,%rsi,8), %rcx
	movq	48(%rsp), %rdx          # 8-byte Reload
	leaq	(%rdx,%rax,8), %rdx
	movq	%rdx, 216(%rsp)         # 8-byte Spill
	cmpq	%rdx, %rcx
	movq	%rax, %rcx
	setbe	%sil
	subq	32(%rsp), %rcx          # 8-byte Folded Reload
	seto	9(%rsp)                 # 1-byte Folded Spill
	subq	%r15, %rcx
	movq	%rcx, %rdx
	seto	7(%rsp)                 # 1-byte Folded Spill
	movq	%rdi, 232(%rsp)         # 8-byte Spill
	addq	%rdi, %rdx
	seto	8(%rsp)                 # 1-byte Folded Spill
	movq	%r8, 224(%rsp)          # 8-byte Spill
	subq	%r8, %rcx
	seto	6(%rsp)                 # 1-byte Folded Spill
	testb	%r10b, %r10b
	movq	48(%rsp), %rdi          # 8-byte Reload
	cmovneq	%rdx, %rcx
	leaq	(%rdi,%rcx,8), %rcx
	leaq	(%rbx,%r15,8), %rdx
	movq	%rdx, 208(%rsp)         # 8-byte Spill
	cmpq	%rdx, %rcx
	setbe	%cl
	orb	%sil, %cl
	cmpb	$1, %cl
	jne	.LBB0_22
# BB#20:                                # %if.end43.lr.ph
	movb	31(%rsp), %r10b         # 1-byte Reload
	movb	28(%rsp), %dl           # 1-byte Reload
	andb	%r10b, %dl
	movb	120(%rsp), %bl          # 1-byte Reload
	orb	%bl, %dl
	movb	24(%rsp), %r8b          # 1-byte Reload
	andb	%r9b, %r8b
	movl	%r11d, %ecx
	andb	%r9b, %cl
	andb	%bl, %cl
	orb	%dl, %cl
	andb	%r10b, %r11b
	movb	30(%rsp), %sil          # 1-byte Reload
	andb	%sil, %r11b
	orb	%cl, %r11b
	orb	%r8b, %r11b
	movl	%r12d, %ecx
	andb	%r9b, %cl
	andb	%bl, %cl
	andb	%r10b, %r12b
	andb	%sil, %r12b
	orb	%cl, %r12b
	movb	26(%rsp), %dl           # 1-byte Reload
	movl	%edx, %ecx
	andb	%r9b, %cl
	andb	%bl, %cl
	orb	%r12b, %cl
	andb	%r10b, %dl
	andb	%sil, %dl
	orb	%cl, %dl
	movb	29(%rsp), %cl           # 1-byte Reload
	andb	%cl, %r9b
	andb	%bl, %r9b
	orb	%dl, %r9b
	orb	%r11b, %r9b
	andb	%r10b, %cl
	andb	%sil, %cl
	orb	27(%rsp), %cl           # 1-byte Folded Reload
	andb	25(%rsp), %bpl          # 1-byte Folded Reload
	orb	%cl, %bpl
	orb	%r9b, %bpl
	xorb	$1, %bpl
	testb	$1, %bpl
	je	.LBB0_22
# BB#21:                                # %if.end43.lr.ph
	movb	18(%rsp), %r8b          # 1-byte Reload
	movl	%r8d, %edx
	movb	16(%rsp), %bl           # 1-byte Reload
	orb	%bl, %dl
	movb	23(%rsp), %sil          # 1-byte Reload
	orb	%sil, %bl
	movb	17(%rsp), %cl           # 1-byte Reload
	orb	%cl, %bl
	movb	22(%rsp), %r9b          # 1-byte Reload
	orb	%r9b, %bl
	movb	21(%rsp), %r10b         # 1-byte Reload
	movb	15(%rsp), %r12b         # 1-byte Reload
	orb	%r10b, %r12b
	orb	%bl, %r12b
	orb	%cl, %dl
	movb	20(%rsp), %r11b         # 1-byte Reload
	movl	%r11d, %ecx
	orb	%sil, %cl
	orb	%r9b, %cl
	orb	%cl, %r12b
	orb	%sil, %dl
	orb	%r12b, %dl
	orb	%r9b, %dl
	movb	13(%rsp), %bl           # 1-byte Reload
	orb	%r10b, %bl
	orb	%dl, %bl
	orb	%r8b, %cl
	orb	%r10b, %cl
	movl	%ecx, %edx
	orb	%r11b, %dl
	orb	%sil, %dl
	orb	%bl, %dl
	movl	%r9d, %ebx
	orb	%r8b, %bl
	orb	%r10b, %bl
	orb	%r11b, %bl
	orb	%sil, %bl
	orb	%r9b, %bl
	orb	%r8b, %bl
	orb	%r10b, %bl
	orb	%dl, %bl
	orb	11(%rsp), %cl           # 1-byte Folded Reload
	orb	%sil, %cl
	orb	%r9b, %cl
	orb	%r11b, %cl
	orb	%bl, %cl
	movl	%r10d, %edx
	movb	19(%rsp), %bl           # 1-byte Reload
	orb	%bl, %dl
	orb	12(%rsp), %dl           # 1-byte Folded Reload
	movb	14(%rsp), %r8b          # 1-byte Reload
	orb	%r8b, %dl
	orb	10(%rsp), %dl           # 1-byte Folded Reload
	orb	%sil, %dl
	orb	%r9b, %dl
	orb	%r11b, %dl
	orb	%r10b, %dl
	orb	9(%rsp), %dl            # 1-byte Folded Reload
	orb	7(%rsp), %dl            # 1-byte Folded Reload
	orb	8(%rsp), %dl            # 1-byte Folded Reload
	orb	%cl, %dl
	orb	%r8b, %bl
	orb	6(%rsp), %bl            # 1-byte Folded Reload
	orb	%dl, %bl
	xorb	$1, %bl
	testb	$1, %bl
	je	.LBB0_22
# BB#56:                                # %polly.cond902
	subq	%r15, 88(%rsp)          # 8-byte Folded Spill
	cmpq	$0, 128(%rsp)           # 8-byte Folded Reload
	js	.LBB0_57
# BB#62:                                # %polly.parallel.for916
	movq	%rax, 144(%rsp)
	movq	32(%rsp), %rax          # 8-byte Reload
	movq	%rax, 152(%rsp)
	movq	%r15, 160(%rsp)
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	%rax, 168(%rsp)
	movq	200(%rsp), %rax         # 8-byte Reload
	movq	%rax, 176(%rsp)
	movq	%rdi, 184(%rsp)
	movq	112(%rsp), %rax         # 8-byte Reload
	movq	%rax, %rbx
	movq	%rax, 192(%rsp)
	movq	88(%rsp), %r8           # 8-byte Reload
	addq	232(%rsp), %r8          # 8-byte Folded Reload
	leaq	144(%rsp), %rsi
	movl	$_sortV1__polly_subfn_3, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	movq	144(%rsp), %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	160(%rsp), %r12
	movq	176(%rsp), %rbp
	movq	184(%rsp), %r15
	leaq	80(%rsp), %rdi
	leaq	72(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB0_67
# BB#63:                                # %polly.par.loadIVBounds.preheader.i
	leaq	(%rbp,%r12,8), %rbp
	movq	32(%rsp), %rax          # 8-byte Reload
	leaq	(%r15,%rax,8), %r12
	leaq	72(%rsp), %r15
	.p2align	4, 0x90
.LBB0_65:                               # %polly.par.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_66 Depth 2
	movq	72(%rsp), %rax
	movq	80(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB0_66:                               # %polly.loop_header.i
                                        #   Parent Loop BB0_65 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%rbp,%rcx,8), %rdx
	movq	%rdx, 8(%r12,%rcx,8)
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB0_66
# BB#64:                                # %polly.par.checkNext.loopexit.i
                                        #   in Loop: Header=BB0_65 Depth=1
	leaq	80(%rsp), %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_65
	jmp	.LBB0_67
.LBB0_4:
	movq	%rax, %r13
	movq	96(%rsp), %r8           # 8-byte Reload
	cmpq	%rbp, %r14
	jl	.LBB0_6
	jmp	.LBB0_13
.LBB0_22:                               # %if.end43.preheader
	movq	112(%rsp), %r9          # 8-byte Reload
	movq	%r9, %rcx
	subq	%r15, %rcx
	subq	32(%rsp), %rcx          # 8-byte Folded Reload
	cmpq	$3, %rcx
	movq	%rax, %rsi
	movq	%r15, %rbx
	movq	40(%rsp), %r10          # 8-byte Reload
	movq	96(%rsp), %r8           # 8-byte Reload
	movq	136(%rsp), %r11         # 8-byte Reload
	jbe	.LBB0_23
# BB#29:                                # %min.iters.checked
	movq	%rcx, %rdx
	andq	$-4, %rdx
	movq	%rax, %rsi
	movq	%r15, %rbx
	je	.LBB0_23
# BB#30:                                # %vector.memcheck
	movq	104(%rsp), %rsi         # 8-byte Reload
	leaq	(%r11,%rsi,8), %rsi
	cmpq	%rsi, 216(%rsp)         # 8-byte Folded Reload
	jae	.LBB0_32
# BB#31:                                # %vector.memcheck
	leaq	(%rax,%r9), %rsi
	movq	%r9, %rbx
	movq	32(%rsp), %rbp          # 8-byte Reload
	leaq	(%r15,%rbp), %rbp
	subq	%rbp, %rsi
	leaq	(%rdi,%rsi,8), %rsi
	cmpq	%rsi, 208(%rsp)         # 8-byte Folded Reload
	movq	%rax, %rsi
	movq	%r15, %rbx
	jb	.LBB0_23
.LBB0_32:                               # %vector.body.preheader
	leaq	-4(%rdx), %rsi
	movq	%rsi, %rbx
	shrq	$2, %rbx
	btl	$2, %esi
	jb	.LBB0_33
# BB#34:                                # %vector.body.prol
	movups	(%r11,%r15,8), %xmm0
	movups	16(%r11,%r15,8), %xmm1
	movups	%xmm0, (%rdi,%rax,8)
	movups	%xmm1, 16(%rdi,%rax,8)
	movl	$4, %ebp
	testq	%rbx, %rbx
	jne	.LBB0_36
	jmp	.LBB0_38
.LBB0_57:                               # %polly.parallel.for906
	movq	88(%rsp), %r8           # 8-byte Reload
	subq	224(%rsp), %r8          # 8-byte Folded Reload
	movq	%rax, 144(%rsp)
	movq	32(%rsp), %rax          # 8-byte Reload
	movq	%rax, 152(%rsp)
	movq	%r15, 160(%rsp)
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	%rax, 168(%rsp)
	movq	200(%rsp), %rax         # 8-byte Reload
	movq	%rax, 176(%rsp)
	movq	%rdi, 184(%rsp)
	movq	112(%rsp), %rax         # 8-byte Reload
	movq	%rax, %rbx
	movq	%rax, 192(%rsp)
	leaq	144(%rsp), %rsi
	movl	$_sortV1__polly_subfn_2, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	movq	144(%rsp), %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	160(%rsp), %r12
	movq	176(%rsp), %rbp
	movq	184(%rsp), %r15
	leaq	80(%rsp), %rdi
	leaq	72(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB0_67
# BB#58:                                # %polly.par.loadIVBounds.preheader.i935
	leaq	(%rbp,%r12,8), %rbp
	movq	32(%rsp), %rax          # 8-byte Reload
	leaq	(%r15,%rax,8), %r12
	leaq	72(%rsp), %r15
	.p2align	4, 0x90
.LBB0_60:                               # %polly.par.loadIVBounds.i940
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_61 Depth 2
	movq	72(%rsp), %rax
	movq	80(%rsp), %rcx
	addq	$-2, %rax
	decq	%rcx
	.p2align	4, 0x90
.LBB0_61:                               # %polly.loop_header.i947
                                        #   Parent Loop BB0_60 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%rbp,%rcx,8), %rdx
	movq	%rdx, 8(%r12,%rcx,8)
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB0_61
# BB#59:                                # %polly.par.checkNext.loopexit.i936
                                        #   in Loop: Header=BB0_60 Depth=1
	leaq	80(%rsp), %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_60
.LBB0_67:                               # %_sortV1__polly_subfn_2.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movq	40(%rsp), %r10          # 8-byte Reload
	movq	48(%rsp), %rdi          # 8-byte Reload
	movq	96(%rsp), %r8           # 8-byte Reload
	movq	%rbx, %r9
	jmp	.LBB0_39
.LBB0_33:
	xorl	%ebp, %ebp
	testq	%rbx, %rbx
	je	.LBB0_38
.LBB0_36:                               # %vector.body.preheader.new
	movq	%rdx, %rsi
	subq	%rbp, %rsi
	leaq	(%r15,%rbp), %rbx
	leaq	48(%r11,%rbx,8), %rbx
	addq	%rax, %rbp
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
	je	.LBB0_39
# BB#40:
	leaq	(%rax,%rdx), %rsi
	addq	%r15, %rdx
	movq	%rdx, %rbx
.LBB0_23:                               # %if.end43.preheader1015
	leaq	(%rax,%r9), %rcx
	movl	%ecx, %edx
	subl	%esi, %edx
	subl	%r15d, %edx
	movq	32(%rsp), %rbp          # 8-byte Reload
	subl	%ebp, %edx
	leaq	-1(%rax,%r9), %rax
	subq	%rsi, %rax
	subq	%r15, %rax
	subq	%rbp, %rax
	andq	$3, %rdx
	je	.LBB0_26
# BB#24:                                # %if.end43.prol.preheader
	negq	%rdx
	.p2align	4, 0x90
.LBB0_25:                               # %if.end43.prol
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r11,%rbx,8), %rbp
	movq	%rbp, (%rdi,%rsi,8)
	incq	%rsi
	incq	%rbx
	incq	%rdx
	jne	.LBB0_25
.LBB0_26:                               # %if.end43.prol.loopexit
	cmpq	$3, %rax
	jb	.LBB0_39
# BB#27:                                # %if.end43.preheader1015.new
	subq	%rsi, %rcx
	subq	%r15, %rcx
	subq	32(%rsp), %rcx          # 8-byte Folded Reload
	leaq	24(%rdi,%rsi,8), %rax
	leaq	24(%r11,%rbx,8), %rdx
	.p2align	4, 0x90
.LBB0_28:                               # %if.end43
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
	jne	.LBB0_28
.LBB0_39:
	movq	64(%rsp), %r12          # 8-byte Reload
	movq	56(%rsp), %rbp          # 8-byte Reload
	cmpq	%rbp, %r14
	jge	.LBB0_13
.LBB0_6:                                # %if.end54.preheader
	movq	%r10, %rax
	subq	%r14, %rax
	subq	%r9, %rax
	cmpq	$3, %rax
	jbe	.LBB0_7
# BB#45:                                # %min.iters.checked976
	movq	%rax, %rcx
	andq	$-4, %rcx
	je	.LBB0_7
# BB#46:                                # %vector.memcheck993
	leaq	(%rdi,%r13,8), %rdx
	leaq	(%r12,%rbp,8), %rsi
	cmpq	%rsi, %rdx
	jae	.LBB0_48
# BB#47:                                # %vector.memcheck993
	leaq	(%r13,%r10), %rdx
	leaq	(%r14,%r9), %rsi
	subq	%rsi, %rdx
	leaq	(%rdi,%rdx,8), %rdx
	leaq	(%r12,%r14,8), %rsi
	cmpq	%rdx, %rsi
	jb	.LBB0_7
.LBB0_48:                               # %vector.body972.preheader
	leaq	-4(%rcx), %rsi
	movq	%rsi, %rdx
	shrq	$2, %rdx
	btl	$2, %esi
	jb	.LBB0_49
# BB#50:                                # %vector.body972.prol
	movups	(%r12,%r14,8), %xmm0
	movq	%r12, %rbx
	movups	16(%r12,%r14,8), %xmm1
	movups	%xmm0, (%rdi,%r13,8)
	movups	%xmm1, 16(%rdi,%r13,8)
	movl	$4, %ebp
	testq	%rdx, %rdx
	jne	.LBB0_52
	jmp	.LBB0_54
.LBB0_49:
	movq	%r12, %rbx
	xorl	%ebp, %ebp
	testq	%rdx, %rdx
	je	.LBB0_54
.LBB0_52:                               # %vector.body972.preheader.new
	movq	%rcx, %rdx
	subq	%rbp, %rdx
	leaq	(%r14,%rbp), %rsi
	leaq	48(%rbx,%rsi,8), %rsi
	addq	%r13, %rbp
	leaq	48(%rdi,%rbp,8), %rbp
	.p2align	4, 0x90
.LBB0_53:                               # %vector.body972
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
	jne	.LBB0_53
.LBB0_54:                               # %middle.block973
	cmpq	%rcx, %rax
	movq	%rbx, %r12
	je	.LBB0_13
# BB#55:
	addq	%rcx, %r13
	addq	%rcx, %r14
.LBB0_7:                                # %if.end54.preheader1014
	movl	%r10d, %ecx
	subl	%r14d, %ecx
	subl	%r9d, %ecx
	leaq	-1(%r10), %rax
	subq	%r14, %rax
	subq	%r9, %rax
	andq	$3, %rcx
	je	.LBB0_10
# BB#8:                                 # %if.end54.prol.preheader
	negq	%rcx
	.p2align	4, 0x90
.LBB0_9:                                # %if.end54.prol
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r12,%r14,8), %rdx
	movq	%rdx, (%rdi,%r13,8)
	incq	%r13
	incq	%r14
	incq	%rcx
	jne	.LBB0_9
.LBB0_10:                               # %if.end54.prol.loopexit
	cmpq	$3, %rax
	jb	.LBB0_13
# BB#11:                                # %if.end54.preheader1014.new
	leaq	24(%rdi,%r13,8), %rax
	subq	%r14, %r10
	subq	%r9, %r10
	leaq	24(%r12,%r14,8), %rcx
	.p2align	4, 0x90
.LBB0_12:                               # %if.end54
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
	addq	$-4, %r10
	jne	.LBB0_12
.LBB0_13:                               # %blklab0
	movq	240(%rsp), %rax         # 8-byte Reload
	movq	%r8, (%rax)
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
	movq	$0, 32(%rsp)
	leaq	48(%rsp), %rdx
	leaq	40(%rsp), %rcx
	callq	convertArgsToIntArray
	movq	(%rax), %rdi
	callq	parseStringToInt
	testq	%rax, %rax
	je	.LBB1_3
# BB#1:                                 # %if.end
	movq	(%rax), %r15
	xorl	%edi, %edi
	movq	%r15, %rsi
	callq	create1DArray_int64_t
	movq	%rax, %r14
	testq	%r15, %r15
	jle	.LBB1_2
# BB#4:                                 # %polly.parallel.for
	movq	%r15, 16(%rsp)
	movq	%r14, 24(%rsp)
	leaq	16(%rsp), %rsi
	movl	$main_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1, %r9d
	movq	%r15, %r8
	callq	GOMP_parallel_loop_runtime_start
	movq	16(%rsp), %rbx
	movq	24(%rsp), %rbp
	leaq	8(%rsp), %rdi
	movq	%rsp, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB1_9
# BB#5:
	leaq	8(%rsp), %r12
	movq	%rsp, %r13
	.p2align	4, 0x90
.LBB1_7:                                # %polly.par.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_8 Depth 2
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	addq	$-2, %rax
	movq	%rbx, %rdx
	subq	%rcx, %rdx
	decq	%rcx
	.p2align	4, 0x90
.LBB1_8:                                # %polly.loop_header.i
                                        #   Parent Loop BB1_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rdx, 8(%rbp,%rcx,8)
	incq	%rcx
	decq	%rdx
	cmpq	%rax, %rcx
	jle	.LBB1_8
# BB#6:                                 # %polly.par.checkNext.loopexit.i
                                        #   in Loop: Header=BB1_7 Depth=1
	movq	%r12, %rdi
	movq	%r13, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB1_7
.LBB1_9:                                # %main_polly_subfn.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
.LBB1_2:                                # %blklab10
	leaq	32(%rsp), %r8
	xorl	%edx, %edx
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%r15, %rcx
	callq	_sortV1_
	movq	(%rax), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movq	-8(%r14,%r15,8), %rsi
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
.LBB1_3:                                # %blklab9
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
