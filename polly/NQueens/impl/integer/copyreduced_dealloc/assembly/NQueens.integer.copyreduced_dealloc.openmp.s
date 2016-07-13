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
	subq	$56, %rsp
.Ltmp22:
	.cfi_def_cfa_offset 112
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
	movq	%r8, %rbp
	movq	%rcx, %r15
	movq	%rsi, %rbx
	movq	%rdi, %r14
	cmpq	%r15, %rbp
	jne	.LBB5_1
# BB#28:                                # %if.end
	movl	$1, %r8d
	testb	%dl, %dl
	je	.LBB5_49
# BB#29:                                # %for.cond.preheader
	testq	%rbx, %rbx
	jle	.LBB5_32
# BB#30:
	movq	%r14, %rbp
	.p2align	4, 0x90
.LBB5_31:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rbp), %rdi
	callq	free
	movq	$0, (%rbp)
	addq	$8, %rbp
	decq	%rbx
	jne	.LBB5_31
.LBB5_32:                               # %for.cond.cleanup
	movq	%r14, %rdi
	callq	free
	movl	$1, %r8d
	jmp	.LBB5_49
.LBB5_1:                                # %while.cond.preheader
	cmpq	%rbx, %r15
	jge	.LBB5_33
# BB#2:                                 # %while.cond.preheader
	cmpq	%rbx, %rbp
	jne	.LBB5_33
# BB#3:                                 # %blklab10.preheader
	leaq	1(%r15), %rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	leaq	(,%rbp,8), %rax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movl	%edx, 36(%rsp)          # 4-byte Spill
	testb	%dl, %dl
	movq	%r14, 16(%rsp)          # 8-byte Spill
	movq	%rbp, 8(%rsp)           # 8-byte Spill
	je	.LBB5_4
# BB#11:                                # %blklab10.us.preheader
	xorl	%r8d, %r8d
	testq	%rbp, %rbp
	jle	.LBB5_44
# BB#12:                                # %blklab14.preheader.us.preheader
	xorl	%r12d, %r12d
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB5_13:                               # %blklab14.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_20 Depth 2
                                        #     Child Loop BB5_16 Depth 2
	testq	%r15, %r15
	jle	.LBB5_14
# BB#19:                                # %polly.split_new_and_old.us.preheader
                                        #   in Loop: Header=BB5_13 Depth=1
	movb	$1, %dl
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB5_20:                               # %polly.split_new_and_old.us
                                        #   Parent Loop BB5_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	testb	$1, %dl
	movl	$0, %ecx
	je	.LBB5_26
# BB#21:                                # %blklab20.us
                                        #   in Loop: Header=BB5_20 Depth=2
	movq	(%r14,%rax,8), %rcx
	movq	(%rcx), %rdx
	subq	%r15, %rdx
	je	.LBB5_22
# BB#23:                                # %blklab20.us
                                        #   in Loop: Header=BB5_20 Depth=2
	movq	8(%rcx), %rsi
	subq	%r12, %rsi
	movl	$1, %ecx
	je	.LBB5_25
# BB#24:                                # %blklab0.i.us
                                        #   in Loop: Header=BB5_20 Depth=2
	movq	%rsi, %rdi
	negq	%rdi
	cmovlq	%rsi, %rdi
	movq	%rdx, %rsi
	negq	%rsi
	cmovlq	%rdx, %rsi
	xorl	%ecx, %ecx
	cmpq	%rsi, %rdi
	sete	%cl
	jmp	.LBB5_25
.LBB5_22:                               #   in Loop: Header=BB5_20 Depth=2
	movl	$1, %ecx
.LBB5_25:                               # %conflict.exit.us
                                        #   in Loop: Header=BB5_20 Depth=2
	xorq	$1, %rcx
.LBB5_26:                               # %blklab18.us
                                        #   in Loop: Header=BB5_20 Depth=2
	incq	%rax
	testq	%rcx, %rcx
	setne	%dl
	cmpq	%rax, %r15
	jne	.LBB5_20
# BB#27:                                # %blklab14.blklab12_crit_edge.us
                                        #   in Loop: Header=BB5_13 Depth=1
	testq	%rcx, %rcx
	je	.LBB5_18
.LBB5_14:                               # %if.end70.us
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	%r8, 24(%rsp)           # 8-byte Spill
	movl	$16, %edi
	callq	malloc
	movq	%rax, %rbx
	movq	%r12, 8(%rbx)
	movq	%r15, (%rbx)
	movq	(%r14,%r15,8), %rdi
	callq	free
	movq	%rbx, (%r14,%r15,8)
	movq	40(%rsp), %rdi          # 8-byte Reload
	callq	malloc
	movq	%rax, (%rsp)            # 8-byte Spill
	testq	%rbp, %rbp
	jle	.LBB5_17
# BB#15:                                # %for.body.i.us.preheader
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	16(%rsp), %r13          # 8-byte Reload
	movq	(%rsp), %rbx            # 8-byte Reload
	movq	8(%rsp), %r14           # 8-byte Reload
	.p2align	4, 0x90
.LBB5_16:                               # %for.body.i.us
                                        #   Parent Loop BB5_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%r13), %rbp
	movl	$16, %edi
	callq	malloc
	movups	(%rbp), %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, (%rbx)
	addq	$8, %rbx
	addq	$8, %r13
	decq	%r14
	jne	.LBB5_16
.LBB5_17:                               # %copy_array_POS.exit.us
                                        #   in Loop: Header=BB5_13 Depth=1
	movl	$1, %edx
	movq	(%rsp), %rdi            # 8-byte Reload
	movq	8(%rsp), %rbp           # 8-byte Reload
	movq	%rbp, %rsi
	movq	48(%rsp), %rcx          # 8-byte Reload
	movq	%rbp, %r8
	callq	run
	movq	24(%rsp), %r8           # 8-byte Reload
	addq	%rax, %r8
	movq	16(%rsp), %r14          # 8-byte Reload
.LBB5_18:                               # %blklab22.us
                                        #   in Loop: Header=BB5_13 Depth=1
	incq	%r12
	cmpq	%rbp, %r12
	jl	.LBB5_13
	jmp	.LBB5_44
.LBB5_4:                                # %blklab10.preheader273
	xorl	%r8d, %r8d
	testq	%rbp, %rbp
	jle	.LBB5_44
# BB#5:                                 # %blklab14.preheader.preheader
	xorl	%r13d, %r13d
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB5_6:                                # %blklab14.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_8 Depth 2
                                        #     Child Loop BB5_41 Depth 2
	testq	%r15, %r15
	jle	.LBB5_39
# BB#7:                                 # %polly.split_new_and_old.preheader
                                        #   in Loop: Header=BB5_6 Depth=1
	movb	$1, %dl
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB5_8:                                # %polly.split_new_and_old
                                        #   Parent Loop BB5_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	testb	$1, %dl
	movl	$0, %ecx
	je	.LBB5_37
# BB#9:                                 # %blklab20
                                        #   in Loop: Header=BB5_8 Depth=2
	movq	(%r14,%rax,8), %rcx
	movq	(%rcx), %rdx
	subq	%r15, %rdx
	je	.LBB5_10
# BB#34:                                # %blklab20
                                        #   in Loop: Header=BB5_8 Depth=2
	movq	8(%rcx), %rsi
	subq	%r13, %rsi
	movl	$1, %ecx
	je	.LBB5_36
# BB#35:                                # %blklab0.i
                                        #   in Loop: Header=BB5_8 Depth=2
	movq	%rsi, %rdi
	negq	%rdi
	cmovlq	%rsi, %rdi
	movq	%rdx, %rsi
	negq	%rsi
	cmovlq	%rdx, %rsi
	xorl	%ecx, %ecx
	cmpq	%rsi, %rdi
	sete	%cl
	jmp	.LBB5_36
.LBB5_10:                               #   in Loop: Header=BB5_8 Depth=2
	movl	$1, %ecx
.LBB5_36:                               # %conflict.exit
                                        #   in Loop: Header=BB5_8 Depth=2
	xorq	$1, %rcx
.LBB5_37:                               # %blklab18
                                        #   in Loop: Header=BB5_8 Depth=2
	incq	%rax
	testq	%rcx, %rcx
	setne	%dl
	cmpq	%rax, %r15
	jne	.LBB5_8
# BB#38:                                # %blklab12
                                        #   in Loop: Header=BB5_6 Depth=1
	testq	%rcx, %rcx
	je	.LBB5_43
.LBB5_39:                               # %if.end70
                                        #   in Loop: Header=BB5_6 Depth=1
	movq	%r8, 24(%rsp)           # 8-byte Spill
	movl	$16, %edi
	callq	malloc
	movq	%r13, 8(%rax)
	movq	%r15, (%rax)
	movq	%rax, (%r14,%r15,8)
	movq	40(%rsp), %rdi          # 8-byte Reload
	callq	malloc
	movq	%rax, (%rsp)            # 8-byte Spill
	testq	%rbp, %rbp
	jle	.LBB5_42
# BB#40:                                # %for.body.i.preheader
                                        #   in Loop: Header=BB5_6 Depth=1
	movq	16(%rsp), %rbx          # 8-byte Reload
	movq	(%rsp), %r12            # 8-byte Reload
	movq	8(%rsp), %rbp           # 8-byte Reload
	.p2align	4, 0x90
.LBB5_41:                               # %for.body.i
                                        #   Parent Loop BB5_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rbx), %r14
	movl	$16, %edi
	callq	malloc
	movups	(%r14), %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, (%r12)
	addq	$8, %r12
	addq	$8, %rbx
	decq	%rbp
	jne	.LBB5_41
.LBB5_42:                               # %copy_array_POS.exit
                                        #   in Loop: Header=BB5_6 Depth=1
	movl	$1, %edx
	movq	(%rsp), %rdi            # 8-byte Reload
	movq	8(%rsp), %rbp           # 8-byte Reload
	movq	%rbp, %rsi
	movq	48(%rsp), %rcx          # 8-byte Reload
	movq	%rbp, %r8
	callq	run
	movq	24(%rsp), %r8           # 8-byte Reload
	addq	%rax, %r8
	movq	16(%rsp), %r14          # 8-byte Reload
.LBB5_43:                               # %blklab22
                                        #   in Loop: Header=BB5_6 Depth=1
	incq	%r13
	cmpq	%rbp, %r13
	jl	.LBB5_6
.LBB5_44:                               # %blklab8
	movl	36(%rsp), %eax          # 4-byte Reload
	testb	%al, %al
	je	.LBB5_49
# BB#45:                                # %for.cond86.preheader
	movq	%r8, %r15
	testq	%rbp, %rbp
	jle	.LBB5_48
# BB#46:
	movq	%r14, %rbx
	.p2align	4, 0x90
.LBB5_47:                               # %for.body91
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rdi
	callq	free
	movq	$0, (%rbx)
	addq	$8, %rbx
	decq	%rbp
	jne	.LBB5_47
.LBB5_48:                               # %for.cond.cleanup90
	movq	%r14, %rdi
	callq	free
	movq	%r15, %r8
.LBB5_49:                               # %cleanup
	movq	%r8, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB5_33:                               # %blklab11
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
	decl	%ebx
	movslq	%ebx, %rcx
	movq	%rcx, 8(%rsp)           # 8-byte Spill
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	(%rax), %rdi
	callq	parseStringToInt
	movq	%rax, %r13
	xorl	%ebx, %ebx
	testq	%r13, %r13
	je	.LBB6_1
# BB#2:                                 # %if.end8
	movq	(%r13), %r15
	movl	$16, %edi
	callq	malloc
	leaq	(,%r15,8), %rdi
	xorps	%xmm0, %xmm0
	movq	%rax, (%rsp)            # 8-byte Spill
	movups	%xmm0, (%rax)
	callq	malloc
	movq	%rax, %r14
	testq	%r15, %r15
	jle	.LBB6_5
# BB#3:                                 # %for.body29.preheader
	movq	%r14, %rbx
	movq	%r15, %rbp
	.p2align	4, 0x90
.LBB6_4:                                # %for.body29
                                        # =>This Inner Loop Header: Depth=1
	movl	$16, %edi
	callq	malloc
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, (%rbx)
	addq	$8, %rbx
	decq	%rbp
	jne	.LBB6_4
.LBB6_5:                                # %if.end53
	movl	$1, %edx
	xorl	%ecx, %ecx
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%r15, %r8
	callq	run
	movq	%rax, %r12
	xorl	%edi, %edi
	movl	$33, %esi
	callq	create1DArray
	movq	%rax, %rbx
	movaps	.LCPI6_0(%rip), %xmm0   # xmm0 = [78,45]
	movups	%xmm0, (%rbx)
	movaps	.LCPI6_1(%rip), %xmm0   # xmm0 = [81,117]
	movups	%xmm0, 16(%rbx)
	movaps	.LCPI6_2(%rip), %xmm0   # xmm0 = [101,101]
	movups	%xmm0, 32(%rbx)
	movaps	.LCPI6_3(%rip), %xmm0   # xmm0 = [110,32]
	movups	%xmm0, 48(%rbx)
	movaps	.LCPI6_4(%rip), %xmm0   # xmm0 = [80,114]
	movups	%xmm0, 64(%rbx)
	movaps	.LCPI6_5(%rip), %xmm0   # xmm0 = [111,98]
	movups	%xmm0, 80(%rbx)
	movaps	.LCPI6_6(%rip), %xmm0   # xmm0 = [108,101]
	movups	%xmm0, 96(%rbx)
	movaps	.LCPI6_7(%rip), %xmm0   # xmm0 = [109,32]
	movups	%xmm0, 112(%rbx)
	movaps	.LCPI6_8(%rip), %xmm0   # xmm0 = [111,110]
	movups	%xmm0, 128(%rbx)
	movaps	.LCPI6_9(%rip), %xmm0   # xmm0 = [32,97]
	movups	%xmm0, 144(%rbx)
	movaps	.LCPI6_10(%rip), %xmm0  # xmm0 = [32,78]
	movups	%xmm0, 160(%rbx)
	movaps	.LCPI6_11(%rip), %xmm1  # xmm1 = [32,88]
	movups	%xmm1, 176(%rbx)
	movups	%xmm0, 192(%rbx)
	movaps	.LCPI6_12(%rip), %xmm0  # xmm0 = [32,66]
	movups	%xmm0, 208(%rbx)
	movaps	.LCPI6_13(%rip), %xmm0  # xmm0 = [111,97]
	movups	%xmm0, 224(%rbx)
	movaps	.LCPI6_14(%rip), %xmm0  # xmm0 = [114,100]
	movups	%xmm0, 240(%rbx)
	movq	$46, 256(%rbx)
	movl	$33, %esi
	movq	%rbx, %rdi
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
	movq	%r15, %rsi
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
	movq	%r12, %rsi
	callq	printf
	xorl	%edi, %edi
	movl	$11, %esi
	callq	create1DArray
	movq	%rax, %rbp
	movaps	.LCPI6_20(%rip), %xmm0  # xmm0 = [32,115]
	movups	%xmm0, (%rbp)
	movaps	.LCPI6_21(%rip), %xmm0  # xmm0 = [111,108]
	movups	%xmm0, 16(%rbp)
	movaps	.LCPI6_22(%rip), %xmm0  # xmm0 = [117,116]
	movups	%xmm0, 32(%rbp)
	movaps	.LCPI6_23(%rip), %xmm0  # xmm0 = [105,111]
	movups	%xmm0, 48(%rbp)
	movaps	.LCPI6_24(%rip), %xmm0  # xmm0 = [110,115]
	movups	%xmm0, 64(%rbp)
	movq	$46, 80(%rbp)
	movl	$11, %esi
	movq	%rbp, %rdi
	callq	println_s
	movb	$1, %r12b
.LBB6_6:                                # %if.then135
	movq	%r13, %rdi
	callq	free
	movq	16(%rsp), %rdi          # 8-byte Reload
	movq	8(%rsp), %rsi           # 8-byte Reload
	callq	free2DArray
	testb	%r12b, %r12b
	je	.LBB6_8
# BB#7:                                 # %if.then165
	movq	(%rsp), %rdi            # 8-byte Reload
	callq	free
	movq	%rbx, %rdi
	callq	free
	movq	%r14, %rdi
	callq	free
	movq	%r15, %rdi
	callq	free
	movq	%rbp, %rdi
	callq	free
.LBB6_8:                                # %if.end196
	xorl	%edi, %edi
	callq	exit
.LBB6_1:
                                        # implicit-def: %RAX
	movq	%rax, (%rsp)            # 8-byte Spill
	xorl	%r12d, %r12d
	xorl	%r14d, %r14d
	xorl	%r15d, %r15d
	xorl	%ebp, %ebp
	jmp	.LBB6_6
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
