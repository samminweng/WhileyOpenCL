	.text
	.file	"llvm/NQueens.integer.copyreduced_dealloc.openmp.ll"
	.globl	copy_POS
	.p2align	4, 0x90
	.type	copy_POS,@function
copy_POS:                               # @copy_POS
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp0:
	.cfi_def_cfa_offset 16
.Ltmp1:
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movl	$16, %edi
	callq	malloc
	movups	(%rbx), %xmm0
	movups	%xmm0, (%rax)
	popq	%rbx
	retq
.Lfunc_end0:
	.size	copy_POS, .Lfunc_end0-copy_POS
	.cfi_endproc

	.globl	copy_array_POS
	.p2align	4, 0x90
	.type	copy_array_POS,@function
copy_array_POS:                         # @copy_array_POS
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp2:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp3:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp4:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp5:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp6:
	.cfi_def_cfa_offset 48
.Ltmp7:
	.cfi_offset %rbx, -48
.Ltmp8:
	.cfi_offset %r12, -40
.Ltmp9:
	.cfi_offset %r13, -32
.Ltmp10:
	.cfi_offset %r14, -24
.Ltmp11:
	.cfi_offset %r15, -16
	movq	%rsi, %r14
	movq	%rdi, %r12
	leaq	(,%r14,8), %rdi
	callq	malloc
	movq	%rax, %r15
	testq	%r14, %r14
	jle	.LBB1_3
# BB#1:
	movq	%r15, %rbx
	.p2align	4, 0x90
.LBB1_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r12), %r13
	movl	$16, %edi
	callq	malloc
	movups	(%r13), %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, (%rbx)
	addq	$8, %rbx
	addq	$8, %r12
	decq	%r14
	jne	.LBB1_2
.LBB1_3:                                # %for.cond.cleanup
	movq	%r15, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
.Lfunc_end1:
	.size	copy_array_POS, .Lfunc_end1-copy_array_POS
	.cfi_endproc

	.globl	free_POS
	.p2align	4, 0x90
	.type	free_POS,@function
free_POS:                               # @free_POS
	.cfi_startproc
# BB#0:                                 # %entry
	jmp	free                    # TAILCALL
.Lfunc_end2:
	.size	free_POS, .Lfunc_end2-free_POS
	.cfi_endproc

	.globl	printf_POS
	.p2align	4, 0x90
	.type	printf_POS,@function
printf_POS:                             # @printf_POS
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp12:
	.cfi_def_cfa_offset 16
.Ltmp13:
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movl	$123, %edi
	callq	putchar
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movq	(%rbx), %rsi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	callq	printf
	movq	8(%rbx), %rsi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$125, %edi
	popq	%rbx
	jmp	putchar                 # TAILCALL
.Lfunc_end3:
	.size	printf_POS, .Lfunc_end3-printf_POS
	.cfi_endproc

	.globl	conflict
	.p2align	4, 0x90
	.type	conflict,@function
conflict:                               # @conflict
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp14:
	.cfi_def_cfa_offset 16
.Ltmp15:
	.cfi_offset %rbx, -16
	movq	(%rdi), %rax
	subq	%rdx, %rax
	je	.LBB4_2
# BB#1:                                 # %entry
	movq	8(%rdi), %rdx
	subq	%rcx, %rdx
	je	.LBB4_2
# BB#4:                                 # %blklab0
	movq	%rdx, %rcx
	negq	%rcx
	cmovlq	%rdx, %rcx
	movq	%rax, %rdx
	negq	%rdx
	cmovlq	%rax, %rdx
	xorl	%ebx, %ebx
	cmpq	%rdx, %rcx
	sete	%bl
	testb	%sil, %sil
	je	.LBB4_6
# BB#5:                                 # %if.then14
	callq	free
	jmp	.LBB4_6
.LBB4_2:                                # %blklab1
	movl	$1, %ebx
	testb	%sil, %sil
	je	.LBB4_6
# BB#3:                                 # %if.then6
	callq	free
	movl	$1, %ebx
.LBB4_6:                                # %cleanup
	movq	%rbx, %rax
	popq	%rbx
	retq
.Lfunc_end4:
	.size	conflict, .Lfunc_end4-conflict
	.cfi_endproc

	.globl	run
	.p2align	4, 0x90
	.type	run,@function
run:                                    # @run
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp16:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp17:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp18:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp19:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp20:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp21:
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
.Ltmp22:
	.cfi_def_cfa_offset 96
.Ltmp23:
	.cfi_offset %rbx, -56
.Ltmp24:
	.cfi_offset %r12, -48
.Ltmp25:
	.cfi_offset %r13, -40
.Ltmp26:
	.cfi_offset %r14, -32
.Ltmp27:
	.cfi_offset %r15, -24
.Ltmp28:
	.cfi_offset %rbp, -16
	movq	%r8, %r14
	movq	%rcx, %r15
	movq	%rsi, %rbp
	movq	%rdi, %r12
	cmpq	%r15, %r14
	jne	.LBB5_6
# BB#1:                                 # %if.end
	movl	$1, %r13d
	testb	%dl, %dl
	je	.LBB5_28
# BB#2:                                 # %for.cond.preheader
	testq	%rbp, %rbp
	jle	.LBB5_5
# BB#3:
	movq	%r12, %rbx
	.p2align	4, 0x90
.LBB5_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rdi
	callq	free
	movq	$0, (%rbx)
	addq	$8, %rbx
	decq	%rbp
	jne	.LBB5_4
.LBB5_5:                                # %for.cond.cleanup
	movq	%r12, %rdi
	callq	free
	movl	$1, %r13d
	jmp	.LBB5_28
.LBB5_6:                                # %blklab6
	cmpq	%rbp, %r15
	jge	.LBB5_34
# BB#7:                                 # %blklab6
	cmpq	%rbp, %r14
	jne	.LBB5_34
# BB#8:                                 # %blklab10.lr.ph
	xorl	%r13d, %r13d
	testq	%r14, %r14
	jle	.LBB5_27
# BB#9:                                 # %blklab14.preheader.lr.ph
	leaq	1(%r15), %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	leaq	(,%r14,8), %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	testq	%r15, %r15
	jle	.LBB5_10
# BB#18:                                # %blklab14.preheader.us.preheader
	xorl	%r8d, %r8d
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB5_19:                               # %blklab14.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_20 Depth 2
                                        #     Child Loop BB5_24 Depth 2
	movb	$1, %bl
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB5_20:                               # %polly.split_new_and_old.us
                                        #   Parent Loop BB5_19 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	testb	$1, %bl
	movl	$0, %ecx
	je	.LBB5_32
# BB#21:                                # %blklab20.us
                                        #   in Loop: Header=BB5_20 Depth=2
	movq	(%r12,%rax,8), %rcx
	movq	(%rcx), %rsi
	subq	%r15, %rsi
	je	.LBB5_22
# BB#29:                                # %blklab20.us
                                        #   in Loop: Header=BB5_20 Depth=2
	movq	8(%rcx), %rdi
	subq	%r8, %rdi
	movl	$1, %ecx
	je	.LBB5_31
# BB#30:                                # %blklab0.i.us
                                        #   in Loop: Header=BB5_20 Depth=2
	movq	%rdi, %rbp
	negq	%rbp
	cmovlq	%rdi, %rbp
	movq	%rsi, %rdi
	negq	%rdi
	cmovlq	%rsi, %rdi
	xorl	%ecx, %ecx
	cmpq	%rdi, %rbp
	sete	%cl
	jmp	.LBB5_31
.LBB5_22:                               #   in Loop: Header=BB5_20 Depth=2
	movl	$1, %ecx
.LBB5_31:                               # %conflict.exit.us
                                        #   in Loop: Header=BB5_20 Depth=2
	xorq	$1, %rcx
.LBB5_32:                               # %blklab18.us
                                        #   in Loop: Header=BB5_20 Depth=2
	incq	%rax
	testq	%rcx, %rcx
	setne	%bl
	cmpq	%rax, %r15
	jne	.LBB5_20
# BB#33:                                # %blklab14.blklab12_crit_edge.us
                                        #   in Loop: Header=BB5_19 Depth=1
	testq	%rcx, %rcx
	je	.LBB5_26
# BB#23:                                # %for.body.i.us.preheader
                                        #   in Loop: Header=BB5_19 Depth=1
	movq	%r13, 16(%rsp)          # 8-byte Spill
	movl	$16, %edi
	movq	%r8, %rbx
	callq	malloc
	movq	%rax, %rbp
	movq	%rbx, 8(%rsp)           # 8-byte Spill
	movq	%rbx, 8(%rbp)
	movq	%r15, (%rbp)
	movq	(%r12,%r15,8), %rdi
	callq	free
	movq	%rbp, (%r12,%r15,8)
	movq	24(%rsp), %rdi          # 8-byte Reload
	callq	malloc
	movq	%rax, %r13
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB5_24:                               # %for.body.i.us
                                        #   Parent Loop BB5_19 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%r12,%rbp,8), %rbx
	movl	$16, %edi
	callq	malloc
	movups	(%rbx), %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, (%r13,%rbp,8)
	incq	%rbp
	cmpq	%rbp, %r14
	jne	.LBB5_24
# BB#25:                                # %copy_array_POS.exit.us
                                        #   in Loop: Header=BB5_19 Depth=1
	movl	$1, %edx
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	32(%rsp), %rcx          # 8-byte Reload
	movq	%r14, %r8
	callq	run
	movq	16(%rsp), %r13          # 8-byte Reload
	addq	%rax, %r13
	movb	$1, %dl
	movq	8(%rsp), %r8            # 8-byte Reload
.LBB5_26:                               # %blklab22.us
                                        #   in Loop: Header=BB5_19 Depth=1
	incq	%r8
	cmpq	%r14, %r8
	jne	.LBB5_19
.LBB5_27:                               # %blklab8
	testb	$1, %dl
	jne	.LBB5_14
	jmp	.LBB5_28
.LBB5_10:                               # %for.body.i.preheader.preheader
	xorl	%ebx, %ebx
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB5_11:                               # %for.body.i.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_12 Depth 2
	movq	%r13, 16(%rsp)          # 8-byte Spill
	movl	$16, %edi
	callq	malloc
	movq	%rax, %rbp
	movq	%rbx, 8(%rsp)           # 8-byte Spill
	movq	%rbx, 8(%rbp)
	movq	%r15, (%rbp)
	movq	(%r12,%r15,8), %rdi
	callq	free
	movq	%rbp, (%r12,%r15,8)
	movq	24(%rsp), %rdi          # 8-byte Reload
	callq	malloc
	movq	%rax, %rbp
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB5_12:                               # %for.body.i
                                        #   Parent Loop BB5_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%r12,%rbx,8), %r13
	movl	$16, %edi
	callq	malloc
	movups	(%r13), %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, (%rbp,%rbx,8)
	incq	%rbx
	cmpq	%rbx, %r14
	jne	.LBB5_12
# BB#13:                                # %copy_array_POS.exit
                                        #   in Loop: Header=BB5_11 Depth=1
	movl	$1, %edx
	movq	%rbp, %rdi
	movq	%r14, %rsi
	movq	32(%rsp), %rcx          # 8-byte Reload
	movq	%r14, %r8
	callq	run
	movq	16(%rsp), %r13          # 8-byte Reload
	addq	%rax, %r13
	movq	8(%rsp), %rbx           # 8-byte Reload
	incq	%rbx
	cmpq	%r14, %rbx
	jne	.LBB5_11
.LBB5_14:                               # %for.cond83.preheader
	testq	%r14, %r14
	jle	.LBB5_17
# BB#15:
	movq	%r12, %rbx
	.p2align	4, 0x90
.LBB5_16:                               # %for.body88
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rdi
	callq	free
	movq	$0, (%rbx)
	addq	$8, %rbx
	decq	%r14
	jne	.LBB5_16
.LBB5_17:                               # %for.cond.cleanup87
	movq	%r12, %rdi
	callq	free
.LBB5_28:                               # %cleanup
	movq	%r13, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB5_34:                               # %blklab11
	movq	stderr(%rip), %rcx
	movl	$.L.str.5, %edi
	movl	$4, %esi
	movl	$1, %edx
	callq	fwrite
	movl	$-1, %edi
	callq	exit
.Lfunc_end5:
	.size	run, .Lfunc_end5-run
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI6_0:
	.quad	78                      # 0x4e
	.quad	45                      # 0x2d
.LCPI6_1:
	.quad	81                      # 0x51
	.quad	117                     # 0x75
.LCPI6_2:
	.quad	101                     # 0x65
	.quad	101                     # 0x65
.LCPI6_3:
	.quad	110                     # 0x6e
	.quad	32                      # 0x20
.LCPI6_4:
	.quad	80                      # 0x50
	.quad	114                     # 0x72
.LCPI6_5:
	.quad	111                     # 0x6f
	.quad	98                      # 0x62
.LCPI6_6:
	.quad	108                     # 0x6c
	.quad	101                     # 0x65
.LCPI6_7:
	.quad	109                     # 0x6d
	.quad	32                      # 0x20
.LCPI6_8:
	.quad	111                     # 0x6f
	.quad	110                     # 0x6e
.LCPI6_9:
	.quad	32                      # 0x20
	.quad	97                      # 0x61
.LCPI6_10:
	.quad	32                      # 0x20
	.quad	78                      # 0x4e
.LCPI6_11:
	.quad	32                      # 0x20
	.quad	88                      # 0x58
.LCPI6_12:
	.quad	32                      # 0x20
	.quad	66                      # 0x42
.LCPI6_13:
	.quad	111                     # 0x6f
	.quad	97                      # 0x61
.LCPI6_14:
	.quad	114                     # 0x72
	.quad	100                     # 0x64
.LCPI6_15:
	.quad	78                      # 0x4e
	.quad	32                      # 0x20
.LCPI6_16:
	.quad	61                      # 0x3d
	.quad	32                      # 0x20
.LCPI6_17:
	.quad	70                      # 0x46
	.quad	111                     # 0x6f
.LCPI6_18:
	.quad	117                     # 0x75
	.quad	110                     # 0x6e
.LCPI6_19:
	.quad	100                     # 0x64
	.quad	32                      # 0x20
.LCPI6_20:
	.quad	32                      # 0x20
	.quad	115                     # 0x73
.LCPI6_21:
	.quad	111                     # 0x6f
	.quad	108                     # 0x6c
.LCPI6_22:
	.quad	117                     # 0x75
	.quad	116                     # 0x74
.LCPI6_23:
	.quad	105                     # 0x69
	.quad	111                     # 0x6f
.LCPI6_24:
	.quad	110                     # 0x6e
	.quad	115                     # 0x73
.LCPI6_25:
	.zero	16
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp29:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp30:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp31:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp32:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp33:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp34:
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
.Ltmp35:
	.cfi_def_cfa_offset 80
.Ltmp36:
	.cfi_offset %rbx, -56
.Ltmp37:
	.cfi_offset %r12, -48
.Ltmp38:
	.cfi_offset %r13, -40
.Ltmp39:
	.cfi_offset %r14, -32
.Ltmp40:
	.cfi_offset %r15, -24
.Ltmp41:
	.cfi_offset %rbp, -16
	movl	%edi, %ebx
	callq	convertArgsToIntArray
	movq	%rax, %rbp
	decl	%ebx
	movslq	%ebx, %rbx
	movq	(%rbp), %rdi
	callq	parseStringToInt
	movq	%rax, %r12
	testq	%r12, %r12
	je	.LBB6_8
# BB#1:                                 # %if.end8
	movq	%rbx, 8(%rsp)           # 8-byte Spill
	movq	%rbp, 16(%rsp)          # 8-byte Spill
	movq	(%r12), %rbx
	leaq	(,%rbx,8), %rdi
	callq	malloc
	movq	%rax, %r15
	testq	%rbx, %rbx
	jle	.LBB6_4
# BB#2:                                 # %for.body29.preheader
	movq	%r15, %rbp
	movq	%rbx, %r14
	.p2align	4, 0x90
.LBB6_3:                                # %for.body29
                                        # =>This Inner Loop Header: Depth=1
	movl	$16, %edi
	callq	malloc
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, (%rbp)
	addq	$8, %rbp
	decq	%r14
	jne	.LBB6_3
.LBB6_4:                                # %for.cond141.preheader
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%r15, (%rsp)            # 8-byte Spill
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%rbx, %r8
	callq	run
	movq	%rax, %r13
	xorl	%edi, %edi
	movl	$33, %esi
	callq	create1DArray
	movq	%rax, %rbp
	movaps	.LCPI6_0(%rip), %xmm0   # xmm0 = [78,45]
	movups	%xmm0, (%rbp)
	movaps	.LCPI6_1(%rip), %xmm0   # xmm0 = [81,117]
	movups	%xmm0, 16(%rbp)
	movaps	.LCPI6_2(%rip), %xmm0   # xmm0 = [101,101]
	movups	%xmm0, 32(%rbp)
	movaps	.LCPI6_3(%rip), %xmm0   # xmm0 = [110,32]
	movups	%xmm0, 48(%rbp)
	movaps	.LCPI6_4(%rip), %xmm0   # xmm0 = [80,114]
	movups	%xmm0, 64(%rbp)
	movaps	.LCPI6_5(%rip), %xmm0   # xmm0 = [111,98]
	movups	%xmm0, 80(%rbp)
	movaps	.LCPI6_6(%rip), %xmm0   # xmm0 = [108,101]
	movups	%xmm0, 96(%rbp)
	movaps	.LCPI6_7(%rip), %xmm0   # xmm0 = [109,32]
	movups	%xmm0, 112(%rbp)
	movaps	.LCPI6_8(%rip), %xmm0   # xmm0 = [111,110]
	movups	%xmm0, 128(%rbp)
	movaps	.LCPI6_9(%rip), %xmm0   # xmm0 = [32,97]
	movups	%xmm0, 144(%rbp)
	movaps	.LCPI6_10(%rip), %xmm0  # xmm0 = [32,78]
	movups	%xmm0, 160(%rbp)
	movaps	.LCPI6_11(%rip), %xmm1  # xmm1 = [32,88]
	movups	%xmm1, 176(%rbp)
	movups	%xmm0, 192(%rbp)
	movaps	.LCPI6_12(%rip), %xmm0  # xmm0 = [32,66]
	movups	%xmm0, 208(%rbp)
	movaps	.LCPI6_13(%rip), %xmm0  # xmm0 = [111,97]
	movups	%xmm0, 224(%rbp)
	movaps	.LCPI6_14(%rip), %xmm0  # xmm0 = [114,100]
	movups	%xmm0, 240(%rbp)
	movq	$46, 256(%rbp)
	movl	$33, %esi
	movq	%rbp, %rdi
	callq	println_s
	xorl	%edi, %edi
	movl	$4, %esi
	callq	create1DArray
	movq	%rax, %r14
	movaps	.LCPI6_15(%rip), %xmm0  # xmm0 = [78,32]
	movups	%xmm0, (%r14)
	movaps	.LCPI6_16(%rip), %xmm0  # xmm0 = [61,32]
	movups	%xmm0, 16(%r14)
	movl	$4, %esi
	movq	%r14, %rdi
	callq	printf_s
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	printf
	xorl	%edi, %edi
	movl	$6, %esi
	callq	create1DArray
	movq	%rax, %r15
	movaps	.LCPI6_17(%rip), %xmm0  # xmm0 = [70,111]
	movups	%xmm0, (%r15)
	movaps	.LCPI6_18(%rip), %xmm0  # xmm0 = [117,110]
	movups	%xmm0, 16(%r15)
	movaps	.LCPI6_19(%rip), %xmm0  # xmm0 = [100,32]
	movups	%xmm0, 32(%r15)
	movl	$6, %esi
	movq	%r15, %rdi
	callq	printf_s
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	movq	%r13, %rsi
	callq	printf
	xorl	%edi, %edi
	movl	$11, %esi
	callq	create1DArray
	movq	%rax, %r13
	movaps	.LCPI6_20(%rip), %xmm0  # xmm0 = [32,115]
	movups	%xmm0, (%r13)
	movaps	.LCPI6_21(%rip), %xmm0  # xmm0 = [111,108]
	movups	%xmm0, 16(%r13)
	movaps	.LCPI6_22(%rip), %xmm0  # xmm0 = [117,116]
	movups	%xmm0, 32(%r13)
	movaps	.LCPI6_23(%rip), %xmm0  # xmm0 = [105,111]
	movups	%xmm0, 48(%r13)
	movaps	.LCPI6_24(%rip), %xmm0  # xmm0 = [110,115]
	movups	%xmm0, 64(%r13)
	movq	$46, 80(%r13)
	movl	$11, %esi
	movq	%r13, %rdi
	callq	println_s
	movq	%r12, %rdi
	callq	free
	testq	%rbx, %rbx
	jle	.LBB6_7
# BB#5:                                 # %for.body146.preheader
	movq	(%rsp), %r12            # 8-byte Reload
	.p2align	4, 0x90
.LBB6_6:                                # %for.body146
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rdi
	callq	free
	movq	$0, (%r12)
	addq	$8, %r12
	decq	%rbx
	jne	.LBB6_6
.LBB6_7:                                # %if.then165
	movq	(%rsp), %rdi            # 8-byte Reload
	callq	free
	movq	16(%rsp), %rdi          # 8-byte Reload
	movq	8(%rsp), %rsi           # 8-byte Reload
	callq	free2DArray
	movq	%rbp, %rdi
	callq	free
	movq	%r14, %rdi
	callq	free
	movq	%r15, %rdi
	callq	free
	movq	%r13, %rdi
	callq	free
	xorl	%edi, %edi
	callq	exit
.LBB6_8:                                # %if.end196.critedge
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	callq	free2DArray
	xorl	%edi, %edi
	callq	exit
.Lfunc_end6:
	.size	main, .Lfunc_end6-main
	.cfi_endproc

	.type	.L.str.1,@object        # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	" r:"
	.size	.L.str.1, 4

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"%lld"
	.size	.L.str.2, 5

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	" c:"
	.size	.L.str.3, 4

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"fail"
	.size	.L.str.5, 5

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"%lld\n"
	.size	.L.str.6, 6


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git aec29e5973c27bcbc3c1cf54295e3778050a73cd) (http://llvm.org/git/llvm.git 4c6356e8c64e246972f760a1f05bc0f365b090ad)"
	.section	".note.GNU-stack","",@progbits
