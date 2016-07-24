	.text
	.file	"llvm/NQueens.original.copyreduced_dealloc.openmp.ll"
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

	.globl	copy_NQueen
	.p2align	4, 0x90
	.type	copy_NQueen,@function
copy_NQueen:                            # @copy_NQueen
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp14:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp15:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp16:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp17:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp18:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp19:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Ltmp20:
	.cfi_def_cfa_offset 64
.Ltmp21:
	.cfi_offset %rbx, -56
.Ltmp22:
	.cfi_offset %r12, -48
.Ltmp23:
	.cfi_offset %r13, -40
.Ltmp24:
	.cfi_offset %r14, -32
.Ltmp25:
	.cfi_offset %r15, -24
.Ltmp26:
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	movl	$24, %edi
	callq	malloc
	movq	%rax, %r14
	movq	8(%r15), %r12
	leaq	(,%r12,8), %rdi
	callq	malloc
	movq	%rax, %r13
	movq	%r13, (%r14)
	testq	%r12, %r12
	jle	.LBB4_3
# BB#1:                                 # %for.body.preheader
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB4_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r15), %rax
	movq	(%rax,%rbx,8), %rbp
	movl	$16, %edi
	callq	malloc
	movups	(%rbp), %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, (%r13,%rbx,8)
	incq	%rbx
	cmpq	%r12, %rbx
	jl	.LBB4_2
.LBB4_3:                                # %for.cond.cleanup
	movq	%r12, 8(%r14)
	movq	16(%r15), %rax
	movq	%rax, 16(%r14)
	movq	%r14, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end4:
	.size	copy_NQueen, .Lfunc_end4-copy_NQueen
	.cfi_endproc

	.globl	copy_array_NQueen
	.p2align	4, 0x90
	.type	copy_array_NQueen,@function
copy_array_NQueen:                      # @copy_array_NQueen
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp27:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp28:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp29:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp30:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp31:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp32:
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
.Ltmp33:
	.cfi_def_cfa_offset 96
.Ltmp34:
	.cfi_offset %rbx, -56
.Ltmp35:
	.cfi_offset %r12, -48
.Ltmp36:
	.cfi_offset %r13, -40
.Ltmp37:
	.cfi_offset %r14, -32
.Ltmp38:
	.cfi_offset %r15, -24
.Ltmp39:
	.cfi_offset %rbp, -16
	movq	%rsi, %rbx
	movq	%rdi, 16(%rsp)          # 8-byte Spill
	leaq	(,%rbx,8), %rdi
	callq	malloc
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movq	%rbx, 24(%rsp)          # 8-byte Spill
	testq	%rbx, %rbx
	jle	.LBB5_6
# BB#1:                                 # %for.body.preheader
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB5_2:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_4 Depth 2
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	(%rax,%rbp,8), %r14
	movl	$24, %edi
	callq	malloc
	movq	%rax, %r12
	movq	8(%r14), %r15
	leaq	(,%r15,8), %rdi
	callq	malloc
	movq	%rax, %rbx
	movq	%r12, 32(%rsp)          # 8-byte Spill
	movq	%rbx, (%r12)
	testq	%r15, %r15
	jle	.LBB5_5
# BB#3:                                 # %for.body.preheader.i
                                        #   in Loop: Header=BB5_2 Depth=1
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB5_4:                                # %for.body.i
                                        #   Parent Loop BB5_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%r14), %rax
	movq	(%rax,%r12,8), %r13
	movl	$16, %edi
	callq	malloc
	movups	(%r13), %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, (%rbx,%r12,8)
	incq	%r12
	cmpq	%r12, %r15
	jne	.LBB5_4
.LBB5_5:                                # %copy_NQueen.exit
                                        #   in Loop: Header=BB5_2 Depth=1
	movq	32(%rsp), %rcx          # 8-byte Reload
	movq	%r15, 8(%rcx)
	movq	16(%r14), %rax
	movq	%rax, 16(%rcx)
	movq	8(%rsp), %rax           # 8-byte Reload
	movq	%rcx, (%rax,%rbp,8)
	incq	%rbp
	cmpq	24(%rsp), %rbp          # 8-byte Folded Reload
	jne	.LBB5_2
.LBB5_6:                                # %for.cond.cleanup
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end5:
	.size	copy_array_NQueen, .Lfunc_end5-copy_array_NQueen
	.cfi_endproc

	.globl	free_NQueen
	.p2align	4, 0x90
	.type	free_NQueen,@function
free_NQueen:                            # @free_NQueen
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp40:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp41:
	.cfi_def_cfa_offset 24
	pushq	%rax
.Ltmp42:
	.cfi_def_cfa_offset 32
.Ltmp43:
	.cfi_offset %rbx, -24
.Ltmp44:
	.cfi_offset %r14, -16
	movq	%rdi, %r14
	cmpq	$0, 8(%r14)
	jle	.LBB6_3
# BB#1:                                 # %for.body.preheader
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB6_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r14), %rax
	movq	(%rax,%rbx,8), %rdi
	callq	free
	movq	(%r14), %rax
	movq	$0, (%rax,%rbx,8)
	incq	%rbx
	cmpq	8(%r14), %rbx
	jl	.LBB6_2
.LBB6_3:                                # %for.cond.cleanup
	movq	(%r14), %rdi
	callq	free
	movq	%r14, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	jmp	free                    # TAILCALL
.Lfunc_end6:
	.size	free_NQueen, .Lfunc_end6-free_NQueen
	.cfi_endproc

	.globl	printf_NQueen
	.p2align	4, 0x90
	.type	printf_NQueen,@function
printf_NQueen:                          # @printf_NQueen
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp45:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp46:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp47:
	.cfi_def_cfa_offset 32
.Ltmp48:
	.cfi_offset %rbx, -32
.Ltmp49:
	.cfi_offset %r14, -24
.Ltmp50:
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	movl	$123, %edi
	callq	putchar
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	cmpq	$0, 8(%r14)
	jle	.LBB7_3
# BB#1:                                 # %for.body.preheader
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB7_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r14), %rax
	movq	(%rax,%rbx,8), %r15
	movl	$123, %edi
	callq	putchar
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movq	(%r15), %rsi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	callq	printf
	movq	8(%r15), %rsi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$125, %edi
	callq	putchar
	incq	%rbx
	cmpq	8(%r14), %rbx
	jl	.LBB7_2
.LBB7_3:                                # %for.cond.cleanup
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
	movq	16(%r14), %rsi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$125, %edi
	popq	%rbx
	popq	%r14
	popq	%r15
	jmp	putchar                 # TAILCALL
.Lfunc_end7:
	.size	printf_NQueen, .Lfunc_end7-printf_NQueen
	.cfi_endproc

	.globl	nqueen
	.p2align	4, 0x90
	.type	nqueen,@function
nqueen:                                 # @nqueen
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp51:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp52:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp53:
	.cfi_def_cfa_offset 32
.Ltmp54:
	.cfi_offset %rbx, -32
.Ltmp55:
	.cfi_offset %r14, -24
.Ltmp56:
	.cfi_offset %r15, -16
	movq	%rdx, %r15
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movl	$24, %edi
	callq	malloc
	movq	%rbx, 16(%rax)
	movq	%r15, 8(%rax)
	movq	%r14, (%rax)
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Lfunc_end8:
	.size	nqueen, .Lfunc_end8-nqueen
	.cfi_endproc

	.globl	conflict
	.p2align	4, 0x90
	.type	conflict,@function
conflict:                               # @conflict
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp57:
	.cfi_def_cfa_offset 16
.Ltmp58:
	.cfi_offset %rbx, -16
	movq	(%rdi), %rax
	subq	%rdx, %rax
	je	.LBB9_2
# BB#1:                                 # %entry
	movq	8(%rdi), %rdx
	subq	%rcx, %rdx
	je	.LBB9_2
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
	je	.LBB9_6
# BB#5:                                 # %if.then14
	callq	free
	jmp	.LBB9_6
.LBB9_2:                                # %blklab1
	movl	$1, %ebx
	testb	%sil, %sil
	je	.LBB9_6
# BB#3:                                 # %if.then6
	callq	free
	movl	$1, %ebx
.LBB9_6:                                # %cleanup
	movq	%rbx, %rax
	popq	%rbx
	retq
.Lfunc_end9:
	.size	conflict, .Lfunc_end9-conflict
	.cfi_endproc

	.globl	run
	.p2align	4, 0x90
	.type	run,@function
run:                                    # @run
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp59:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp60:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp61:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp62:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp63:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp64:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Ltmp65:
	.cfi_def_cfa_offset 64
.Ltmp66:
	.cfi_offset %rbx, -56
.Ltmp67:
	.cfi_offset %r12, -48
.Ltmp68:
	.cfi_offset %r13, -40
.Ltmp69:
	.cfi_offset %r14, -32
.Ltmp70:
	.cfi_offset %r15, -24
.Ltmp71:
	.cfi_offset %rbp, -16
	movq	%rcx, %r14
	movq	%rdx, %rbx
	movq	%rdi, %r15
	cmpq	%rbx, %r14
	jne	.LBB10_1
# BB#19:                                # %if.end
	incq	16(%r15)
	jmp	.LBB10_20
.LBB10_1:                               # %while.cond.preheader
	movq	8(%r15), %rax
	cmpq	%rbx, %rax
	jle	.LBB10_18
# BB#2:                                 # %if.end129.preheader
	leaq	1(%rbx), %r12
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB10_3:                               # %if.end129
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB10_8 Depth 2
	cmpq	%r14, %rax
	jne	.LBB10_18
# BB#4:                                 # %blklab10
                                        #   in Loop: Header=BB10_3 Depth=1
	cmpq	%r14, %rbp
	jge	.LBB10_20
# BB#5:                                 # %while.cond140.preheader
                                        #   in Loop: Header=BB10_3 Depth=1
	cmpq	%rbx, %r14
	jle	.LBB10_18
# BB#6:                                 # %if.end185.preheader
                                        #   in Loop: Header=BB10_3 Depth=1
	testq	%rbx, %rbx
	jle	.LBB10_16
# BB#7:                                 # %polly.split_new_and_old.preheader
                                        #   in Loop: Header=BB10_3 Depth=1
	movb	$1, %dl
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB10_8:                               # %polly.split_new_and_old
                                        #   Parent Loop BB10_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	testb	$1, %dl
	movl	$0, %ecx
	je	.LBB10_14
# BB#9:                                 # %blklab20
                                        #   in Loop: Header=BB10_8 Depth=2
	movq	(%r15), %rcx
	movq	(%rcx,%rax,8), %rcx
	movq	(%rcx), %rdx
	subq	%rbx, %rdx
	je	.LBB10_10
# BB#11:                                # %blklab20
                                        #   in Loop: Header=BB10_8 Depth=2
	movq	8(%rcx), %rsi
	subq	%rbp, %rsi
	movl	$1, %ecx
	je	.LBB10_13
# BB#12:                                # %blklab0.i
                                        #   in Loop: Header=BB10_8 Depth=2
	movq	%rsi, %rdi
	negq	%rdi
	cmovlq	%rsi, %rdi
	movq	%rdx, %rsi
	negq	%rsi
	cmovlq	%rdx, %rsi
	xorl	%ecx, %ecx
	cmpq	%rsi, %rdi
	sete	%cl
	jmp	.LBB10_13
.LBB10_10:                              #   in Loop: Header=BB10_8 Depth=2
	movl	$1, %ecx
.LBB10_13:                              # %conflict.exit
                                        #   in Loop: Header=BB10_8 Depth=2
	xorq	$1, %rcx
.LBB10_14:                              # %blklab18
                                        #   in Loop: Header=BB10_8 Depth=2
	incq	%rax
	testq	%rcx, %rcx
	setne	%dl
	cmpq	%rbx, %rax
	jl	.LBB10_8
# BB#15:                                # %blklab12
                                        #   in Loop: Header=BB10_3 Depth=1
	testq	%rcx, %rcx
	je	.LBB10_17
.LBB10_16:                              # %if.end238
                                        #   in Loop: Header=BB10_3 Depth=1
	movl	$16, %edi
	callq	malloc
	movq	%rax, %r13
	movq	%rbp, 8(%r13)
	movq	%rbx, (%r13)
	movq	(%r15), %rax
	movq	(%rax,%rbx,8), %rdi
	callq	free
	movq	(%r15), %rax
	movq	$0, (%rax,%rbx,8)
	movq	(%r15), %rax
	movq	%r13, (%rax,%rbx,8)
	xorl	%esi, %esi
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%r14, %rcx
	callq	run
	movq	%rax, %r15
.LBB10_17:                              # %blklab22
                                        #   in Loop: Header=BB10_3 Depth=1
	incq	%rbp
	movq	8(%r15), %rax
	cmpq	%rbx, %rax
	jg	.LBB10_3
.LBB10_18:                              # %blklab11
	movq	stderr(%rip), %rcx
	movl	$.L.str.7, %edi
	movl	$4, %esi
	movl	$1, %edx
	callq	fwrite
	movl	$-1, %edi
	callq	exit
.LBB10_20:                              # %cleanup
	movq	%r15, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end10:
	.size	run, .Lfunc_end10-run
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI11_0:
	.quad	78                      # 0x4e
	.quad	45                      # 0x2d
.LCPI11_1:
	.quad	81                      # 0x51
	.quad	117                     # 0x75
.LCPI11_2:
	.quad	101                     # 0x65
	.quad	101                     # 0x65
.LCPI11_3:
	.quad	110                     # 0x6e
	.quad	32                      # 0x20
.LCPI11_4:
	.quad	80                      # 0x50
	.quad	114                     # 0x72
.LCPI11_5:
	.quad	111                     # 0x6f
	.quad	98                      # 0x62
.LCPI11_6:
	.quad	108                     # 0x6c
	.quad	101                     # 0x65
.LCPI11_7:
	.quad	109                     # 0x6d
	.quad	32                      # 0x20
.LCPI11_8:
	.quad	111                     # 0x6f
	.quad	110                     # 0x6e
.LCPI11_9:
	.quad	32                      # 0x20
	.quad	97                      # 0x61
.LCPI11_10:
	.quad	32                      # 0x20
	.quad	78                      # 0x4e
.LCPI11_11:
	.quad	32                      # 0x20
	.quad	88                      # 0x58
.LCPI11_12:
	.quad	32                      # 0x20
	.quad	66                      # 0x42
.LCPI11_13:
	.quad	111                     # 0x6f
	.quad	97                      # 0x61
.LCPI11_14:
	.quad	114                     # 0x72
	.quad	100                     # 0x64
.LCPI11_15:
	.quad	78                      # 0x4e
	.quad	32                      # 0x20
.LCPI11_16:
	.quad	61                      # 0x3d
	.quad	32                      # 0x20
.LCPI11_17:
	.quad	70                      # 0x46
	.quad	111                     # 0x6f
.LCPI11_18:
	.quad	117                     # 0x75
	.quad	110                     # 0x6e
.LCPI11_19:
	.quad	100                     # 0x64
	.quad	32                      # 0x20
.LCPI11_20:
	.quad	32                      # 0x20
	.quad	115                     # 0x73
.LCPI11_21:
	.quad	111                     # 0x6f
	.quad	108                     # 0x6c
.LCPI11_22:
	.quad	117                     # 0x75
	.quad	116                     # 0x74
.LCPI11_23:
	.quad	105                     # 0x69
	.quad	111                     # 0x6f
.LCPI11_24:
	.quad	110                     # 0x6e
	.quad	115                     # 0x73
.LCPI11_25:
	.zero	16
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp72:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp73:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp74:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp75:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp76:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp77:
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
.Ltmp78:
	.cfi_def_cfa_offset 80
.Ltmp79:
	.cfi_offset %rbx, -56
.Ltmp80:
	.cfi_offset %r12, -48
.Ltmp81:
	.cfi_offset %r13, -40
.Ltmp82:
	.cfi_offset %r14, -32
.Ltmp83:
	.cfi_offset %r15, -24
.Ltmp84:
	.cfi_offset %rbp, -16
	movl	%edi, %ebx
	callq	convertArgsToIntArray
	movq	%rax, %rbp
	decl	%ebx
	movslq	%ebx, %rbx
	movq	(%rbp), %rdi
	callq	parseStringToInt
	testq	%rax, %rax
	je	.LBB11_8
# BB#1:                                 # %if.end8
	movq	%rbx, 8(%rsp)           # 8-byte Spill
	movq	%rbp, 16(%rsp)          # 8-byte Spill
	movq	%rax, (%rsp)            # 8-byte Spill
	movq	(%rax), %r15
	leaq	(,%r15,8), %rdi
	callq	malloc
	movq	%rax, %r14
	testq	%r15, %r15
	jle	.LBB11_4
# BB#2:                                 # %for.body29.preheader
	movq	%r14, %rbx
	movq	%r15, %rbp
	.p2align	4, 0x90
.LBB11_3:                               # %for.body29
                                        # =>This Inner Loop Header: Depth=1
	movl	$16, %edi
	callq	malloc
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, (%rbx)
	addq	$8, %rbx
	decq	%rbp
	jne	.LBB11_3
.LBB11_4:                               # %if.then173
	movl	$24, %edi
	callq	malloc
	movq	$0, 16(%rax)
	movq	%r15, 8(%rax)
	movq	%r14, (%rax)
	xorl	%esi, %esi
	xorl	%edx, %edx
	movq	%rax, %rdi
	movq	%r15, %rcx
	callq	run
	movq	%rax, %rbx
	xorl	%edi, %edi
	movl	$33, %esi
	callq	create1DArray
	movq	%rax, %r13
	movaps	.LCPI11_0(%rip), %xmm0  # xmm0 = [78,45]
	movups	%xmm0, (%r13)
	movaps	.LCPI11_1(%rip), %xmm0  # xmm0 = [81,117]
	movups	%xmm0, 16(%r13)
	movaps	.LCPI11_2(%rip), %xmm0  # xmm0 = [101,101]
	movups	%xmm0, 32(%r13)
	movaps	.LCPI11_3(%rip), %xmm0  # xmm0 = [110,32]
	movups	%xmm0, 48(%r13)
	movaps	.LCPI11_4(%rip), %xmm0  # xmm0 = [80,114]
	movups	%xmm0, 64(%r13)
	movaps	.LCPI11_5(%rip), %xmm0  # xmm0 = [111,98]
	movups	%xmm0, 80(%r13)
	movaps	.LCPI11_6(%rip), %xmm0  # xmm0 = [108,101]
	movups	%xmm0, 96(%r13)
	movaps	.LCPI11_7(%rip), %xmm0  # xmm0 = [109,32]
	movups	%xmm0, 112(%r13)
	movaps	.LCPI11_8(%rip), %xmm0  # xmm0 = [111,110]
	movups	%xmm0, 128(%r13)
	movaps	.LCPI11_9(%rip), %xmm0  # xmm0 = [32,97]
	movups	%xmm0, 144(%r13)
	movaps	.LCPI11_10(%rip), %xmm0 # xmm0 = [32,78]
	movups	%xmm0, 160(%r13)
	movaps	.LCPI11_11(%rip), %xmm1 # xmm1 = [32,88]
	movups	%xmm1, 176(%r13)
	movups	%xmm0, 192(%r13)
	movaps	.LCPI11_12(%rip), %xmm0 # xmm0 = [32,66]
	movups	%xmm0, 208(%r13)
	movaps	.LCPI11_13(%rip), %xmm0 # xmm0 = [111,97]
	movups	%xmm0, 224(%r13)
	movaps	.LCPI11_14(%rip), %xmm0 # xmm0 = [114,100]
	movups	%xmm0, 240(%r13)
	movq	$46, 256(%r13)
	movl	$33, %esi
	movq	%r13, %rdi
	callq	println_s
	xorl	%edi, %edi
	movl	$4, %esi
	callq	create1DArray
	movq	%rax, %r14
	movaps	.LCPI11_15(%rip), %xmm0 # xmm0 = [78,32]
	movups	%xmm0, (%r14)
	movaps	.LCPI11_16(%rip), %xmm0 # xmm0 = [61,32]
	movups	%xmm0, 16(%r14)
	movl	$4, %esi
	movq	%r14, %rdi
	callq	printf_s
	movl	$.L.str.8, %edi
	xorl	%eax, %eax
	movq	%r15, %rsi
	callq	printf
	xorl	%edi, %edi
	movl	$6, %esi
	callq	create1DArray
	movq	%rax, %r12
	movaps	.LCPI11_17(%rip), %xmm0 # xmm0 = [70,111]
	movups	%xmm0, (%r12)
	movaps	.LCPI11_18(%rip), %xmm0 # xmm0 = [117,110]
	movups	%xmm0, 16(%r12)
	movaps	.LCPI11_19(%rip), %xmm0 # xmm0 = [100,32]
	movups	%xmm0, 32(%r12)
	movl	$6, %esi
	movq	%r12, %rdi
	callq	printf_s
	movq	16(%rbx), %rsi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%edi, %edi
	movl	$11, %esi
	callq	create1DArray
	movq	%rax, %r15
	movaps	.LCPI11_20(%rip), %xmm0 # xmm0 = [32,115]
	movups	%xmm0, (%r15)
	movaps	.LCPI11_21(%rip), %xmm0 # xmm0 = [111,108]
	movups	%xmm0, 16(%r15)
	movaps	.LCPI11_22(%rip), %xmm0 # xmm0 = [117,116]
	movups	%xmm0, 32(%r15)
	movaps	.LCPI11_23(%rip), %xmm0 # xmm0 = [105,111]
	movups	%xmm0, 48(%r15)
	movaps	.LCPI11_24(%rip), %xmm0 # xmm0 = [110,115]
	movups	%xmm0, 64(%r15)
	movq	$46, 80(%r15)
	movl	$11, %esi
	movq	%r15, %rdi
	callq	println_s
	movq	(%rsp), %rdi            # 8-byte Reload
	callq	free
	cmpq	$0, 8(%rbx)
	jle	.LBB11_7
# BB#5:                                 # %for.body.i.preheader
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB11_6:                               # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rax
	movq	(%rax,%rbp,8), %rdi
	callq	free
	movq	(%rbx), %rax
	movq	$0, (%rax,%rbp,8)
	incq	%rbp
	cmpq	8(%rbx), %rbp
	jl	.LBB11_6
.LBB11_7:                               # %free_NQueen.exit
	movq	(%rbx), %rdi
	callq	free
	movq	%rbx, %rdi
	callq	free
	movq	16(%rsp), %rdi          # 8-byte Reload
	movq	8(%rsp), %rsi           # 8-byte Reload
	callq	free2DArray
	movq	%r13, %rdi
	callq	free
	movq	%r14, %rdi
	callq	free
	movq	%r12, %rdi
	callq	free
	movq	%r15, %rdi
	callq	free
	xorl	%edi, %edi
	callq	exit
.LBB11_8:                               # %if.end222.critedge
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	callq	free2DArray
	xorl	%edi, %edi
	callq	exit
.Lfunc_end11:
	.size	main, .Lfunc_end11-main
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
	.asciz	" queens:"
	.size	.L.str.5, 9

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	" num_solutions:"
	.size	.L.str.6, 16

	.type	.L.str.7,@object        # @.str.7
.L.str.7:
	.asciz	"fail"
	.size	.L.str.7, 5

	.type	.L.str.8,@object        # @.str.8
.L.str.8:
	.asciz	"%lld\n"
	.size	.L.str.8, 6


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git aec29e5973c27bcbc3c1cf54295e3778050a73cd) (http://llvm.org/git/llvm.git 4c6356e8c64e246972f760a1f05bc0f365b090ad)"
	.section	".note.GNU-stack","",@progbits