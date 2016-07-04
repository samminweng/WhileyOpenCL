	.text
	.file	"llvm/NQueens_original.openmp.ll"
	.globl	copy_POS
	.p2align	4, 0x90
	.type	copy_POS,@function
copy_POS:                               # @copy_POS
.Lfunc_begin0:
	.file	1 "NQueens_original.c"
	.loc	1 2 0                   # NQueens_original.c:2:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp0:
	.cfi_def_cfa_offset 16
.Ltmp1:
	.cfi_offset %rbx, -16
	#DEBUG_VALUE: copy_POS:_POS <- %RDI
	movq	%rdi, %rbx
.Ltmp2:
	#DEBUG_VALUE: copy_POS:_POS <- %RBX
	.loc	1 3 17 prologue_end discriminator 1 # NQueens_original.c:3:17
	movl	$16, %edi
	callq	malloc
.Ltmp3:
	#DEBUG_VALUE: copy_POS:new_POS <- %RAX
	.loc	1 4 21                  # NQueens_original.c:4:21
	movups	(%rbx), %xmm0
	.loc	1 4 13 is_stmt 0        # NQueens_original.c:4:13
	movups	%xmm0, (%rax)
	.loc	1 6 2 is_stmt 1         # NQueens_original.c:6:2
	popq	%rbx
.Ltmp4:
	retq
.Ltmp5:
.Lfunc_end0:
	.size	copy_POS, .Lfunc_end0-copy_POS
	.cfi_endproc

	.globl	copy_array_POS
	.p2align	4, 0x90
	.type	copy_array_POS,@function
copy_array_POS:                         # @copy_array_POS
.Lfunc_begin1:
	.loc	1 8 0                   # NQueens_original.c:8:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp6:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp7:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp8:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp9:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp10:
	.cfi_def_cfa_offset 48
.Ltmp11:
	.cfi_offset %rbx, -48
.Ltmp12:
	.cfi_offset %r12, -40
.Ltmp13:
	.cfi_offset %r13, -32
.Ltmp14:
	.cfi_offset %r14, -24
.Ltmp15:
	.cfi_offset %r15, -16
	#DEBUG_VALUE: copy_array_POS:_POS <- %RDI
	#DEBUG_VALUE: copy_array_POS:_POS_size <- %RSI
	movq	%rsi, %r14
.Ltmp16:
	#DEBUG_VALUE: copy_array_POS:_POS_size <- %R14
	movq	%rdi, %r12
.Ltmp17:
	#DEBUG_VALUE: copy_array_POS:_POS <- %R12
	.loc	1 9 34 prologue_end     # NQueens_original.c:9:34
	leaq	(,%r14,8), %rdi
	.loc	1 9 18 is_stmt 0 discriminator 1 # NQueens_original.c:9:18
	callq	malloc
	movq	%rax, %r15
.Ltmp18:
	#DEBUG_VALUE: i <- 0
	.loc	1 10 2 is_stmt 1 discriminator 1 # NQueens_original.c:10:2
	testq	%r14, %r14
	jle	.LBB1_3
.Ltmp19:
# BB#1:
	#DEBUG_VALUE: copy_array_POS:_POS <- %R12
	#DEBUG_VALUE: copy_array_POS:_POS_size <- %R14
	movq	%r15, %rbx
.Ltmp20:
	.p2align	4, 0x90
.LBB1_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 11 25                 # NQueens_original.c:11:25
	movq	(%r12), %r13
.Ltmp21:
	.loc	1 3 17 discriminator 1  # NQueens_original.c:3:17
	movl	$16, %edi
	callq	malloc
	.loc	1 4 21                  # NQueens_original.c:4:21
	movups	(%r13), %xmm0
	.loc	1 4 13 is_stmt 0        # NQueens_original.c:4:13
	movups	%xmm0, (%rax)
.Ltmp22:
	.loc	1 11 14 is_stmt 1       # NQueens_original.c:11:14
	movq	%rax, (%rbx)
.Ltmp23:
	.loc	1 10 2 discriminator 1  # NQueens_original.c:10:2
	addq	$8, %rbx
	addq	$8, %r12
	decq	%r14
	jne	.LBB1_2
.Ltmp24:
.LBB1_3:                                # %for.cond.cleanup
	.loc	1 13 2                  # NQueens_original.c:13:2
	movq	%r15, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
.Ltmp25:
.Lfunc_end1:
	.size	copy_array_POS, .Lfunc_end1-copy_array_POS
	.cfi_endproc
	.file	2 "./NQueens_original.h"

	.globl	free_POS
	.p2align	4, 0x90
	.type	free_POS,@function
free_POS:                               # @free_POS
.Lfunc_begin2:
	.loc	1 15 0                  # NQueens_original.c:15:0
	.cfi_startproc
# BB#0:                                 # %entry
	#DEBUG_VALUE: free_POS:pos <- %RDI
	.loc	1 16 2 prologue_end     # NQueens_original.c:16:2
	jmp	free                    # TAILCALL
.Ltmp26:
.Lfunc_end2:
	.size	free_POS, .Lfunc_end2-free_POS
	.cfi_endproc

	.globl	printf_POS
	.p2align	4, 0x90
	.type	printf_POS,@function
printf_POS:                             # @printf_POS
.Lfunc_begin3:
	.loc	1 18 0                  # NQueens_original.c:18:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp27:
	.cfi_def_cfa_offset 16
.Ltmp28:
	.cfi_offset %rbx, -16
	#DEBUG_VALUE: printf_POS:pos <- %RDI
	movq	%rdi, %rbx
.Ltmp29:
	#DEBUG_VALUE: printf_POS:pos <- %RBX
	.loc	1 19 2 prologue_end     # NQueens_original.c:19:2
	movl	$123, %edi
	callq	putchar
	.loc	1 20 2                  # NQueens_original.c:20:2
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 21 22                 # NQueens_original.c:21:22
	movq	(%rbx), %rsi
	.loc	1 21 2 is_stmt 0        # NQueens_original.c:21:2
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 22 2 is_stmt 1        # NQueens_original.c:22:2
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 23 22                 # NQueens_original.c:23:22
	movq	8(%rbx), %rsi
	.loc	1 23 2 is_stmt 0        # NQueens_original.c:23:2
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 24 2 is_stmt 1        # NQueens_original.c:24:2
	movl	$125, %edi
	popq	%rbx
.Ltmp30:
	jmp	putchar                 # TAILCALL
.Ltmp31:
.Lfunc_end3:
	.size	printf_POS, .Lfunc_end3-printf_POS
	.cfi_endproc

	.globl	copy_NQueen
	.p2align	4, 0x90
	.type	copy_NQueen,@function
copy_NQueen:                            # @copy_NQueen
.Lfunc_begin4:
	.loc	1 26 0                  # NQueens_original.c:26:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp32:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp33:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp34:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp35:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp36:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp37:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Ltmp38:
	.cfi_def_cfa_offset 64
.Ltmp39:
	.cfi_offset %rbx, -56
.Ltmp40:
	.cfi_offset %r12, -48
.Ltmp41:
	.cfi_offset %r13, -40
.Ltmp42:
	.cfi_offset %r14, -32
.Ltmp43:
	.cfi_offset %r15, -24
.Ltmp44:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: copy_NQueen:_NQueen <- %RDI
	movq	%rdi, %r15
.Ltmp45:
	#DEBUG_VALUE: copy_NQueen:_NQueen <- %R15
	.loc	1 27 23 prologue_end discriminator 1 # NQueens_original.c:27:23
	movl	$24, %edi
	callq	malloc
	movq	%rax, %r14
.Ltmp46:
	.loc	1 28 2                  # NQueens_original.c:28:2
	movq	8(%r15), %r12
	leaq	(,%r12,8), %rdi
	callq	malloc
	movq	%rax, %r13
	movq	%r13, (%r14)
.Ltmp47:
	#DEBUG_VALUE: i <- 0
	.loc	1 28 2 is_stmt 0 discriminator 1 # NQueens_original.c:28:2
	testq	%r12, %r12
	jle	.LBB4_3
.Ltmp48:
# BB#1:                                 # %for.body.preheader
	#DEBUG_VALUE: copy_NQueen:_NQueen <- %R15
	xorl	%ebx, %ebx
.Ltmp49:
	.p2align	4, 0x90
.LBB4_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 28 2 discriminator 3  # NQueens_original.c:28:2
	movq	(%r15), %rax
	movq	(%rax,%rbx,8), %rbp
.Ltmp50:
	.loc	1 3 17 is_stmt 1 discriminator 1 # NQueens_original.c:3:17
	movl	$16, %edi
	callq	malloc
	.loc	1 4 21                  # NQueens_original.c:4:21
	movups	(%rbp), %xmm0
	.loc	1 4 13 is_stmt 0        # NQueens_original.c:4:13
	movups	%xmm0, (%rax)
.Ltmp51:
	.loc	1 28 2 is_stmt 1 discriminator 3 # NQueens_original.c:28:2
	movq	%rax, (%r13,%rbx,8)
.Ltmp52:
	.loc	1 28 2 is_stmt 0 discriminator 1 # NQueens_original.c:28:2
	incq	%rbx
	cmpq	%r12, %rbx
	jl	.LBB4_2
.Ltmp53:
.LBB4_3:                                # %for.cond.cleanup
	.loc	1 28 2 discriminator 5  # NQueens_original.c:28:2
	movq	%r12, 8(%r14)
.Ltmp54:
	.loc	1 29 39 is_stmt 1       # NQueens_original.c:29:39
	movq	16(%r15), %rax
	.loc	1 29 28 is_stmt 0       # NQueens_original.c:29:28
	movq	%rax, 16(%r14)
	.loc	1 30 2 is_stmt 1        # NQueens_original.c:30:2
	movq	%r14, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp55:
.Lfunc_end4:
	.size	copy_NQueen, .Lfunc_end4-copy_NQueen
	.cfi_endproc

	.globl	copy_array_NQueen
	.p2align	4, 0x90
	.type	copy_array_NQueen,@function
copy_array_NQueen:                      # @copy_array_NQueen
.Lfunc_begin5:
	.loc	1 32 0                  # NQueens_original.c:32:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp56:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp57:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp58:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp59:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp60:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp61:
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
.Ltmp62:
	.cfi_def_cfa_offset 96
.Ltmp63:
	.cfi_offset %rbx, -56
.Ltmp64:
	.cfi_offset %r12, -48
.Ltmp65:
	.cfi_offset %r13, -40
.Ltmp66:
	.cfi_offset %r14, -32
.Ltmp67:
	.cfi_offset %r15, -24
.Ltmp68:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: copy_array_NQueen:_NQueen <- %RDI
	#DEBUG_VALUE: copy_array_NQueen:_NQueen_size <- %RSI
	movq	%rsi, %rbx
.Ltmp69:
	#DEBUG_VALUE: copy_array_NQueen:_NQueen_size <- %RBX
	movq	%rdi, 16(%rsp)          # 8-byte Spill
.Ltmp70:
	#DEBUG_VALUE: copy_array_NQueen:_NQueen <- [%RSP+16]
	.loc	1 33 43 prologue_end    # NQueens_original.c:33:43
	leaq	(,%rbx,8), %rdi
	.loc	1 33 24 is_stmt 0 discriminator 1 # NQueens_original.c:33:24
	callq	malloc
.Ltmp71:
	movq	%rax, 8(%rsp)           # 8-byte Spill
.Ltmp72:
	#DEBUG_VALUE: i <- 0
	movq	%rbx, 24(%rsp)          # 8-byte Spill
.Ltmp73:
	#DEBUG_VALUE: copy_array_NQueen:_NQueen_size <- [%RSP+24]
	.loc	1 34 2 is_stmt 1 discriminator 1 # NQueens_original.c:34:2
	testq	%rbx, %rbx
	jle	.LBB5_6
.Ltmp74:
# BB#1:                                 # %for.body.preheader
	#DEBUG_VALUE: copy_array_NQueen:_NQueen_size <- [%RSP+24]
	xorl	%ebp, %ebp
.Ltmp75:
	.p2align	4, 0x90
.LBB5_2:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_4 Depth 2
	.loc	1 35 31                 # NQueens_original.c:35:31
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	(%rax,%rbp,8), %r14
.Ltmp76:
	#DEBUG_VALUE: copy_NQueen:_NQueen <- %R14
	.loc	1 27 23 discriminator 1 # NQueens_original.c:27:23
	movl	$24, %edi
	callq	malloc
	movq	%rax, %r12
.Ltmp77:
	.loc	1 28 2                  # NQueens_original.c:28:2
	movq	8(%r14), %r15
	leaq	(,%r15,8), %rdi
	callq	malloc
	movq	%rax, %rbx
	movq	%r12, 32(%rsp)          # 8-byte Spill
	movq	%rbx, (%r12)
.Ltmp78:
	#DEBUG_VALUE: i <- 0
	.loc	1 28 2 is_stmt 0 discriminator 1 # NQueens_original.c:28:2
	testq	%r15, %r15
	jle	.LBB5_5
.Ltmp79:
# BB#3:                                 # %for.body.preheader.i
                                        #   in Loop: Header=BB5_2 Depth=1
	#DEBUG_VALUE: copy_NQueen:_NQueen <- %R14
	.loc	1 35 19 is_stmt 1       # NQueens_original.c:35:19
	xorl	%r12d, %r12d
.Ltmp80:
	.p2align	4, 0x90
.LBB5_4:                                # %for.body.i
                                        #   Parent Loop BB5_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 28 2 discriminator 3  # NQueens_original.c:28:2
	movq	(%r14), %rax
	movq	(%rax,%r12,8), %r13
.Ltmp81:
	.loc	1 3 17 discriminator 1  # NQueens_original.c:3:17
	movl	$16, %edi
	callq	malloc
	.loc	1 4 21                  # NQueens_original.c:4:21
	movups	(%r13), %xmm0
	.loc	1 4 13 is_stmt 0        # NQueens_original.c:4:13
	movups	%xmm0, (%rax)
.Ltmp82:
	.loc	1 28 2 is_stmt 1 discriminator 3 # NQueens_original.c:28:2
	movq	%rax, (%rbx,%r12,8)
.Ltmp83:
	.loc	1 28 2 is_stmt 0 discriminator 1 # NQueens_original.c:28:2
	incq	%r12
	cmpq	%r12, %r15
	jne	.LBB5_4
.Ltmp84:
.LBB5_5:                                # %copy_NQueen.exit
                                        #   in Loop: Header=BB5_2 Depth=1
	movq	32(%rsp), %rcx          # 8-byte Reload
	.loc	1 28 2 discriminator 5  # NQueens_original.c:28:2
	movq	%r15, 8(%rcx)
.Ltmp85:
	.loc	1 29 39 is_stmt 1       # NQueens_original.c:29:39
	movq	16(%r14), %rax
	.loc	1 29 28 is_stmt 0       # NQueens_original.c:29:28
	movq	%rax, 16(%rcx)
.Ltmp86:
	.loc	1 35 17 is_stmt 1       # NQueens_original.c:35:17
	movq	8(%rsp), %rax           # 8-byte Reload
	movq	%rcx, (%rax,%rbp,8)
.Ltmp87:
	.loc	1 34 2 discriminator 1  # NQueens_original.c:34:2
	incq	%rbp
	cmpq	24(%rsp), %rbp          # 8-byte Folded Reload
	jne	.LBB5_2
.Ltmp88:
.LBB5_6:                                # %for.cond.cleanup
	.loc	1 37 2                  # NQueens_original.c:37:2
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp89:
.Lfunc_end5:
	.size	copy_array_NQueen, .Lfunc_end5-copy_array_NQueen
	.cfi_endproc

	.globl	free_NQueen
	.p2align	4, 0x90
	.type	free_NQueen,@function
free_NQueen:                            # @free_NQueen
.Lfunc_begin6:
	.loc	1 39 0                  # NQueens_original.c:39:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp90:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp91:
	.cfi_def_cfa_offset 24
	pushq	%rax
.Ltmp92:
	.cfi_def_cfa_offset 32
.Ltmp93:
	.cfi_offset %rbx, -24
.Ltmp94:
	.cfi_offset %r14, -16
	#DEBUG_VALUE: free_NQueen:nqueen <- %RDI
	movq	%rdi, %r14
.Ltmp95:
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: free_NQueen:nqueen <- %R14
	.loc	1 40 2 prologue_end discriminator 1 # NQueens_original.c:40:2
	cmpq	$0, 8(%r14)
	jle	.LBB6_3
.Ltmp96:
# BB#1:                                 # %for.body.preheader
	#DEBUG_VALUE: free_NQueen:nqueen <- %R14
	xorl	%ebx, %ebx
.Ltmp97:
	.p2align	4, 0x90
.LBB6_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 40 2 is_stmt 0 discriminator 3 # NQueens_original.c:40:2
	movq	(%r14), %rax
	movq	(%rax,%rbx,8), %rdi
.Ltmp98:
	.loc	1 16 2 is_stmt 1        # NQueens_original.c:16:2
	callq	free
.Ltmp99:
	.loc	1 40 2 discriminator 3  # NQueens_original.c:40:2
	movq	(%r14), %rax
	movq	$0, (%rax,%rbx,8)
.Ltmp100:
	.loc	1 40 2 is_stmt 0 discriminator 1 # NQueens_original.c:40:2
	incq	%rbx
	cmpq	8(%r14), %rbx
	jl	.LBB6_2
.Ltmp101:
.LBB6_3:                                # %for.cond.cleanup
	.loc	1 40 2 discriminator 5  # NQueens_original.c:40:2
	movq	(%r14), %rdi
	callq	free
.Ltmp102:
	.loc	1 41 2 is_stmt 1        # NQueens_original.c:41:2
	movq	%r14, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	jmp	free                    # TAILCALL
.Ltmp103:
.Lfunc_end6:
	.size	free_NQueen, .Lfunc_end6-free_NQueen
	.cfi_endproc

	.globl	printf_NQueen
	.p2align	4, 0x90
	.type	printf_NQueen,@function
printf_NQueen:                          # @printf_NQueen
.Lfunc_begin7:
	.loc	1 43 0                  # NQueens_original.c:43:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp104:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp105:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp106:
	.cfi_def_cfa_offset 32
.Ltmp107:
	.cfi_offset %rbx, -32
.Ltmp108:
	.cfi_offset %r14, -24
.Ltmp109:
	.cfi_offset %r15, -16
	#DEBUG_VALUE: printf_NQueen:nqueen <- %RDI
	movq	%rdi, %r14
.Ltmp110:
	#DEBUG_VALUE: printf_NQueen:nqueen <- %R14
	.loc	1 44 2 prologue_end     # NQueens_original.c:44:2
	movl	$123, %edi
	callq	putchar
	.loc	1 45 2                  # NQueens_original.c:45:2
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp111:
	#DEBUG_VALUE: i <- 0
	.loc	1 46 2 discriminator 1  # NQueens_original.c:46:2
	cmpq	$0, 8(%r14)
	jle	.LBB7_3
.Ltmp112:
# BB#1:                                 # %for.body.preheader
	#DEBUG_VALUE: printf_NQueen:nqueen <- %R14
	xorl	%ebx, %ebx
.Ltmp113:
	.p2align	4, 0x90
.LBB7_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 46 2 is_stmt 0 discriminator 3 # NQueens_original.c:46:2
	movq	(%r14), %rax
	movq	(%rax,%rbx,8), %r15
.Ltmp114:
	#DEBUG_VALUE: printf_POS:pos <- %R15
	.loc	1 19 2 is_stmt 1        # NQueens_original.c:19:2
	movl	$123, %edi
	callq	putchar
	.loc	1 20 2                  # NQueens_original.c:20:2
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 21 22                 # NQueens_original.c:21:22
	movq	(%r15), %rsi
	.loc	1 21 2 is_stmt 0        # NQueens_original.c:21:2
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 22 2 is_stmt 1        # NQueens_original.c:22:2
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 23 22                 # NQueens_original.c:23:22
	movq	8(%r15), %rsi
	.loc	1 23 2 is_stmt 0        # NQueens_original.c:23:2
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 24 2 is_stmt 1        # NQueens_original.c:24:2
	movl	$125, %edi
	callq	putchar
.Ltmp115:
	.loc	1 46 2 discriminator 1  # NQueens_original.c:46:2
	incq	%rbx
	cmpq	8(%r14), %rbx
	jl	.LBB7_2
.Ltmp116:
.LBB7_3:                                # %for.cond.cleanup
	.loc	1 47 2                  # NQueens_original.c:47:2
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 48 25                 # NQueens_original.c:48:25
	movq	16(%r14), %rsi
	.loc	1 48 2 is_stmt 0        # NQueens_original.c:48:2
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 49 2 is_stmt 1        # NQueens_original.c:49:2
	movl	$125, %edi
	popq	%rbx
	popq	%r14
	popq	%r15
	jmp	putchar                 # TAILCALL
.Ltmp117:
.Lfunc_end7:
	.size	printf_NQueen, .Lfunc_end7-printf_NQueen
	.cfi_endproc

	.globl	nqueen
	.p2align	4, 0x90
	.type	nqueen,@function
nqueen:                                 # @nqueen
.Lfunc_begin8:
	.loc	1 51 0                  # NQueens_original.c:51:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp118:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp119:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp120:
	.cfi_def_cfa_offset 32
.Ltmp121:
	.cfi_offset %rbx, -32
.Ltmp122:
	.cfi_offset %r14, -24
.Ltmp123:
	.cfi_offset %r15, -16
	#DEBUG_VALUE: nqueen:num_solutions <- %RDI
	#DEBUG_VALUE: nqueen:queens <- %RSI
	#DEBUG_VALUE: nqueen:queens_size <- %RDX
	#DEBUG_VALUE: nqueen:queens_dealloc [bit_piece offset=0 size=1] <- %ECX
	movq	%rdx, %r15
.Ltmp124:
	#DEBUG_VALUE: nqueen:queens_size <- %R15
	movq	%rsi, %r14
.Ltmp125:
	#DEBUG_VALUE: nqueen:queens <- %R14
	movq	%rdi, %rbx
.Ltmp126:
	#DEBUG_VALUE: nqueen:_3_dealloc <- 0
	#DEBUG_VALUE: nqueen:nq_dealloc <- 0
	#DEBUG_VALUE: nqueen:num_solutions <- %RBX
	.loc	1 58 7 prologue_end     # NQueens_original.c:58:7
	movl	$24, %edi
	callq	malloc
.Ltmp127:
	#DEBUG_VALUE: nqueen:_3 <- %RAX
	.loc	1 59 20                 # NQueens_original.c:59:20
	movq	%rbx, 16(%rax)
	.loc	1 60 2                  # NQueens_original.c:60:2
	movq	%r15, 8(%rax)
	movq	%r14, (%rax)
.Ltmp128:
	#DEBUG_VALUE: nqueen:queens_dealloc <- 0
	#DEBUG_VALUE: nqueen:_3_dealloc <- 1
	.loc	1 66 2                  # NQueens_original.c:66:2
	popq	%rbx
.Ltmp129:
	popq	%r14
.Ltmp130:
	popq	%r15
.Ltmp131:
	retq
.Ltmp132:
.Lfunc_end8:
	.size	nqueen, .Lfunc_end8-nqueen
	.cfi_endproc

	.globl	conflict
	.p2align	4, 0x90
	.type	conflict,@function
conflict:                               # @conflict
.Lfunc_begin9:
	.loc	1 70 0                  # NQueens_original.c:70:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 85 10 prologue_end    # NQueens_original.c:85:10
	pushq	%rbx
.Ltmp133:
	.cfi_def_cfa_offset 16
.Ltmp134:
	.cfi_offset %rbx, -16
	#DEBUG_VALUE: conflict:p <- %RDI
	#DEBUG_VALUE: conflict:p_dealloc [bit_piece offset=0 size=1] <- %ESI
.Ltmp135:
	#DEBUG_VALUE: conflict:p_dealloc [bit_piece offset=0 size=1] <- %SIL
	#DEBUG_VALUE: conflict:row <- %RDX
	#DEBUG_VALUE: conflict:col <- %RCX
	#DEBUG_VALUE: conflict:r <- 0
	#DEBUG_VALUE: conflict:c <- 0
	#DEBUG_VALUE: conflict:colDiff <- 0
	#DEBUG_VALUE: conflict:rowDiff <- 0
	#DEBUG_VALUE: conflict:_8 <- 0
	#DEBUG_VALUE: conflict:_9 <- 0
	#DEBUG_VALUE: conflict:_11 <- 0
	#DEBUG_VALUE: conflict:_12 <- 0
	#DEBUG_VALUE: conflict:_13 <- 0
	#DEBUG_VALUE: conflict:_14 <- 0
	movq	(%rdi), %rax
.Ltmp136:
	#DEBUG_VALUE: conflict:_8 <- %RAX
	#DEBUG_VALUE: conflict:r <- %RAX
	.loc	1 93 6                  # NQueens_original.c:93:6
	subq	%rdx, %rax
.Ltmp137:
	je	.LBB9_2
.Ltmp138:
# BB#1:                                 # %entry
	#DEBUG_VALUE: conflict:col <- %RCX
	#DEBUG_VALUE: conflict:row <- %RDX
	#DEBUG_VALUE: conflict:p_dealloc [bit_piece offset=0 size=1] <- %SIL
	#DEBUG_VALUE: conflict:p <- %RDI
	.loc	1 89 10                 # NQueens_original.c:89:10
	movq	8(%rdi), %rdx
.Ltmp139:
	#DEBUG_VALUE: conflict:_9 <- %RDX
	#DEBUG_VALUE: conflict:c <- %RDX
	subq	%rcx, %rdx
.Ltmp140:
	je	.LBB9_2
.Ltmp141:
# BB#4:                                 # %blklab0
	#DEBUG_VALUE: conflict:col <- %RCX
	#DEBUG_VALUE: conflict:p_dealloc [bit_piece offset=0 size=1] <- %SIL
	#DEBUG_VALUE: conflict:p <- %RDI
	#DEBUG_VALUE: conflict:_12 <- %RDX
	.loc	1 106 7                 # NQueens_original.c:106:7
	movq	%rdx, %rcx
.Ltmp142:
	negq	%rcx
	cmovlq	%rdx, %rcx
.Ltmp143:
	#DEBUG_VALUE: conflict:_14 <- %RAX
	#DEBUG_VALUE: conflict:_11 <- %RCX
	#DEBUG_VALUE: conflict:colDiff <- %RCX
	.loc	1 112 7                 # NQueens_original.c:112:7
	movq	%rax, %rdx
.Ltmp144:
	negq	%rdx
	cmovlq	%rax, %rdx
.Ltmp145:
	#DEBUG_VALUE: conflict:_13 <- %RDX
	#DEBUG_VALUE: conflict:rowDiff <- %RDX
	.loc	1 118 12                # NQueens_original.c:118:12
	cmpq	%rdx, %rcx
	sete	%al
.Ltmp146:
	.loc	1 126 2                 # NQueens_original.c:126:2
	movzbl	%al, %ebx
.Ltmp147:
	.loc	1 130 2                 # NQueens_original.c:130:2
	testb	%sil, %sil
	je	.LBB9_6
.Ltmp148:
# BB#5:                                 # %if.then14
	#DEBUG_VALUE: conflict:rowDiff <- %RDX
	#DEBUG_VALUE: conflict:_13 <- %RDX
	#DEBUG_VALUE: conflict:colDiff <- %RCX
	#DEBUG_VALUE: conflict:_11 <- %RCX
	#DEBUG_VALUE: conflict:p_dealloc [bit_piece offset=0 size=1] <- %SIL
	#DEBUG_VALUE: conflict:p <- %RDI
	#DEBUG_VALUE: free_POS:pos <- %RDI
	.loc	1 16 2                  # NQueens_original.c:16:2
	callq	free
.Ltmp149:
	#DEBUG_VALUE: conflict:p_dealloc <- 0
	jmp	.LBB9_6
.Ltmp150:
.LBB9_2:                                # %blklab1
	#DEBUG_VALUE: conflict:col <- %RCX
	#DEBUG_VALUE: conflict:p_dealloc [bit_piece offset=0 size=1] <- %SIL
	#DEBUG_VALUE: conflict:p <- %RDI
	movl	$1, %ebx
.Ltmp151:
	#DEBUG_VALUE: conflict:_10 <- 1
	.loc	1 101 2                 # NQueens_original.c:101:2
	testb	%sil, %sil
	je	.LBB9_6
.Ltmp152:
# BB#3:                                 # %if.then6
	#DEBUG_VALUE: conflict:col <- %RCX
	#DEBUG_VALUE: conflict:p_dealloc [bit_piece offset=0 size=1] <- %SIL
	#DEBUG_VALUE: conflict:p <- %RDI
	#DEBUG_VALUE: free_POS:pos <- %RDI
	.loc	1 16 2                  # NQueens_original.c:16:2
	callq	free
.Ltmp153:
	movl	$1, %ebx
.Ltmp154:
	#DEBUG_VALUE: conflict:p_dealloc <- 0
.LBB9_6:                                # %cleanup
	.loc	1 133 1                 # NQueens_original.c:133:1
	movq	%rbx, %rax
	popq	%rbx
	retq
.Ltmp155:
.Lfunc_end9:
	.size	conflict, .Lfunc_end9-conflict
	.cfi_endproc

	.globl	run
	.p2align	4, 0x90
	.type	run,@function
run:                                    # @run
.Lfunc_begin10:
	.loc	1 135 0                 # NQueens_original.c:135:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp156:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp157:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp158:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp159:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp160:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp161:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Ltmp162:
	.cfi_def_cfa_offset 64
.Ltmp163:
	.cfi_offset %rbx, -56
.Ltmp164:
	.cfi_offset %r12, -48
.Ltmp165:
	.cfi_offset %r13, -40
.Ltmp166:
	.cfi_offset %r14, -32
.Ltmp167:
	.cfi_offset %r15, -24
.Ltmp168:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: run:nq <- %RDI
	#DEBUG_VALUE: run:nq_dealloc [bit_piece offset=0 size=1] <- %ESI
	#DEBUG_VALUE: run:n <- %RDX
	#DEBUG_VALUE: run:dim <- %RCX
.Ltmp169:
	#DEBUG_VALUE: run:_22 <- %RCX
	movq	%rcx, %r14
.Ltmp170:
	#DEBUG_VALUE: run:_22 <- %R14
	#DEBUG_VALUE: run:dim <- %R14
	movq	%rdx, %rbx
.Ltmp171:
	#DEBUG_VALUE: run:n <- %RBX
	movl	%esi, %r13d
.Ltmp172:
	#DEBUG_VALUE: run:nq_dealloc [bit_piece offset=0 size=1] <- %R13D
	movq	%rdi, %r15
.Ltmp173:
	#DEBUG_VALUE: run:_37 <- 0
	#DEBUG_VALUE: run:_36 <- 0
	#DEBUG_VALUE: run:_35 <- 0
	#DEBUG_VALUE: run:_34 <- 0
	#DEBUG_VALUE: run:_33_dealloc <- 0
	#DEBUG_VALUE: run:_32_dealloc <- 0
	#DEBUG_VALUE: run:_30 <- 0
	#DEBUG_VALUE: run:_29 <- 0
	#DEBUG_VALUE: run:_24_dealloc <- 0
	#DEBUG_VALUE: run:_23_dealloc <- 0
	#DEBUG_VALUE: run:_23_size <- 0
	#DEBUG_VALUE: run:_21_dealloc <- 0
	#DEBUG_VALUE: run:_21_size <- 0
	#DEBUG_VALUE: run:_20 <- 0
	#DEBUG_VALUE: run:_19 <- 0
	#DEBUG_VALUE: run:_18_dealloc <- 0
	#DEBUG_VALUE: run:_18_size <- 0
	#DEBUG_VALUE: run:_17 <- 0
	#DEBUG_VALUE: run:_15 <- 0
	#DEBUG_VALUE: run:_14_dealloc <- 0
	#DEBUG_VALUE: run:_14_size <- 0
	#DEBUG_VALUE: run:_13 <- 0
	#DEBUG_VALUE: run:_12_dealloc <- 0
	#DEBUG_VALUE: run:_12_size <- 0
	#DEBUG_VALUE: run:_11 <- 0
	#DEBUG_VALUE: run:_10 <- 0
	#DEBUG_VALUE: run:_9 <- 0
	#DEBUG_VALUE: run:_8 <- 0
	#DEBUG_VALUE: run:p_dealloc <- 0
	#DEBUG_VALUE: run:i <- 0
	#DEBUG_VALUE: run:col <- 0
	#DEBUG_VALUE: run:_3_dealloc <- 0
	#DEBUG_VALUE: run:_22 <- 0
	#DEBUG_VALUE: run:nq <- %R15
	.loc	1 187 5 prologue_end    # NQueens_original.c:187:5
	cmpq	%rbx, %r14
	jne	.LBB10_3
.Ltmp174:
# BB#1:                                 # %if.end
	#DEBUG_VALUE: run:nq <- %R15
	#DEBUG_VALUE: run:nq_dealloc [bit_piece offset=0 size=1] <- %R13D
	#DEBUG_VALUE: run:n <- %RBX
	#DEBUG_VALUE: run:dim <- %R14
	#DEBUG_VALUE: run:_9 <- 1
	.loc	1 195 20                # NQueens_original.c:195:20
	incq	16(%r15)
	jmp	.LBB10_2
.Ltmp175:
.LBB10_3:                               # %blklab6
	#DEBUG_VALUE: run:nq <- %R15
	#DEBUG_VALUE: run:nq_dealloc [bit_piece offset=0 size=1] <- %R13D
	#DEBUG_VALUE: run:n <- %RBX
	#DEBUG_VALUE: run:dim <- %R14
	#DEBUG_VALUE: run:col <- 0
	#DEBUG_VALUE: run:_11 <- 0
	.loc	1 221 4                 # NQueens_original.c:221:4
	movq	8(%r15), %rax
.Ltmp176:
	#DEBUG_VALUE: run:_15 <- %RAX
	#DEBUG_VALUE: run:_14_size <- %RAX
	#DEBUG_VALUE: run:_13 <- %RAX
	#DEBUG_VALUE: run:_12_size <- %RAX
	.loc	1 225 7                 # NQueens_original.c:225:7
	cmpq	%rbx, %rax
	jle	.LBB10_23
.Ltmp177:
# BB#4:                                 # %blklab6
	#DEBUG_VALUE: run:_12_size <- %RAX
	#DEBUG_VALUE: run:_13 <- %RAX
	#DEBUG_VALUE: run:_14_size <- %RAX
	#DEBUG_VALUE: run:_15 <- %RAX
	#DEBUG_VALUE: run:nq <- %R15
	#DEBUG_VALUE: run:nq_dealloc [bit_piece offset=0 size=1] <- %R13D
	#DEBUG_VALUE: run:n <- %RBX
	#DEBUG_VALUE: run:dim <- %R14
	cmpq	%r14, %rax
	jne	.LBB10_23
.Ltmp178:
# BB#5:                                 # %blklab10.lr.ph
	#DEBUG_VALUE: run:_12_size <- %RAX
	#DEBUG_VALUE: run:_13 <- %RAX
	#DEBUG_VALUE: run:_14_size <- %RAX
	#DEBUG_VALUE: run:_15 <- %RAX
	#DEBUG_VALUE: run:nq <- %R15
	#DEBUG_VALUE: run:nq_dealloc [bit_piece offset=0 size=1] <- %R13D
	#DEBUG_VALUE: run:n <- %RBX
	#DEBUG_VALUE: run:dim <- %R14
	#DEBUG_VALUE: run:nq_dealloc [bit_piece offset=0 size=1] <- %R13B
	.loc	1 353 8                 # NQueens_original.c:353:8
	leaq	1(%rbx), %rax
.Ltmp179:
	#DEBUG_VALUE: run:_35 <- [%RSP+0]
	movq	%rax, (%rsp)            # 8-byte Spill
	xorl	%r12d, %r12d
.Ltmp180:
	.p2align	4, 0x90
.LBB10_6:                               # %blklab10
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB10_10 Depth 2
	#DEBUG_VALUE: conflict:col <- %R12
	.loc	1 242 6                 # NQueens_original.c:242:6
	cmpq	%r14, %r12
	jge	.LBB10_2
.Ltmp181:
# BB#7:                                 # %while.cond106.preheader
                                        #   in Loop: Header=BB10_6 Depth=1
	#DEBUG_VALUE: conflict:col <- %R12
	#DEBUG_VALUE: run:_20 <- 0
	.loc	1 260 8                 # NQueens_original.c:260:8
	cmpq	%rbx, %r14
	jle	.LBB10_23
.Ltmp182:
# BB#8:                                 # %blklab14.preheader
                                        #   in Loop: Header=BB10_6 Depth=1
	#DEBUG_VALUE: conflict:col <- %R12
	.loc	1 283 7                 # NQueens_original.c:283:7
	testq	%rbx, %rbx
	jle	.LBB10_18
.Ltmp183:
# BB#9:                                 # %polly.split_new_and_old.preheader
                                        #   in Loop: Header=BB10_6 Depth=1
	#DEBUG_VALUE: conflict:col <- %R12
	movb	$1, %dl
	xorl	%eax, %eax
.Ltmp184:
	.p2align	4, 0x90
.LBB10_10:                              # %polly.split_new_and_old
                                        #   Parent Loop BB10_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	testb	$1, %dl
	movl	$0, %ecx
	je	.LBB10_16
# BB#11:                                # %blklab20
                                        #   in Loop: Header=BB10_10 Depth=2
	#DEBUG_VALUE: run:p_dealloc <- 0
	#DEBUG_VALUE: run:_24_dealloc <- 0
.Ltmp185:
	#DEBUG_VALUE: run:_25 <- 1
	.loc	1 256 5                 # NQueens_original.c:256:5
	movq	(%r15), %rcx
.Ltmp186:
	#DEBUG_VALUE: run:_23 <- %RCX
	.loc	1 287 8                 # NQueens_original.c:287:8
	movq	(%rcx,%rax,8), %rcx
.Ltmp187:
	#DEBUG_VALUE: conflict:_14 <- 0
	#DEBUG_VALUE: conflict:_13 <- 0
	#DEBUG_VALUE: conflict:_12 <- 0
	#DEBUG_VALUE: conflict:_11 <- 0
	#DEBUG_VALUE: conflict:_9 <- 0
	#DEBUG_VALUE: conflict:_8 <- 0
	#DEBUG_VALUE: conflict:rowDiff <- 0
	#DEBUG_VALUE: conflict:colDiff <- 0
	#DEBUG_VALUE: conflict:c <- 0
	#DEBUG_VALUE: conflict:r <- 0
	#DEBUG_VALUE: conflict:p_dealloc [bit_piece offset=0 size=1] <- 0
	#DEBUG_VALUE: conflict:p <- %RCX
	#DEBUG_VALUE: run:_24 <- %RCX
	#DEBUG_VALUE: run:p <- %RCX
	.loc	1 85 10                 # NQueens_original.c:85:10
	movq	(%rcx), %rdx
.Ltmp188:
	#DEBUG_VALUE: conflict:_8 <- %RDX
	#DEBUG_VALUE: conflict:r <- %RDX
	.loc	1 93 6                  # NQueens_original.c:93:6
	subq	%rbx, %rdx
.Ltmp189:
	#DEBUG_VALUE: conflict:row <- %RBX
	je	.LBB10_12
.Ltmp190:
# BB#13:                                # %blklab20
                                        #   in Loop: Header=BB10_10 Depth=2
	#DEBUG_VALUE: conflict:row <- %RBX
	#DEBUG_VALUE: run:p <- %RCX
	#DEBUG_VALUE: run:_24 <- %RCX
	#DEBUG_VALUE: conflict:p <- %RCX
	.loc	1 89 10                 # NQueens_original.c:89:10
	movq	8(%rcx), %rsi
.Ltmp191:
	#DEBUG_VALUE: conflict:_9 <- %RSI
	#DEBUG_VALUE: conflict:c <- %RSI
	subq	%r12, %rsi
.Ltmp192:
	.loc	1 302 10                # NQueens_original.c:302:10
	movl	$1, %ecx
.Ltmp193:
	je	.LBB10_15
.Ltmp194:
# BB#14:                                # %blklab0.i
                                        #   in Loop: Header=BB10_10 Depth=2
	#DEBUG_VALUE: conflict:row <- %RBX
	#DEBUG_VALUE: conflict:_12 <- %RSI
	.loc	1 106 7                 # NQueens_original.c:106:7
	movq	%rsi, %rcx
	negq	%rcx
	cmovlq	%rsi, %rcx
.Ltmp195:
	#DEBUG_VALUE: conflict:_14 <- %RDX
	#DEBUG_VALUE: conflict:_11 <- %RCX
	#DEBUG_VALUE: conflict:colDiff <- %RCX
	.loc	1 112 7                 # NQueens_original.c:112:7
	movq	%rdx, %rsi
.Ltmp196:
	negq	%rsi
	cmovlq	%rdx, %rsi
.Ltmp197:
	#DEBUG_VALUE: conflict:_13 <- %RSI
	#DEBUG_VALUE: conflict:rowDiff <- %RSI
	.loc	1 118 12                # NQueens_original.c:118:12
	cmpq	%rsi, %rcx
	sete	%cl
.Ltmp198:
	.loc	1 126 2                 # NQueens_original.c:126:2
	movzbl	%cl, %ecx
	jmp	.LBB10_15
.Ltmp199:
.LBB10_12:                              #   in Loop: Header=BB10_10 Depth=2
	#DEBUG_VALUE: conflict:row <- %RBX
	#DEBUG_VALUE: run:p <- %RCX
	#DEBUG_VALUE: run:_24 <- %RCX
	#DEBUG_VALUE: conflict:p <- %RCX
	.loc	1 302 10                # NQueens_original.c:302:10
	movl	$1, %ecx
.Ltmp200:
.LBB10_15:                              # %conflict.exit
                                        #   in Loop: Header=BB10_10 Depth=2
	#DEBUG_VALUE: conflict:row <- %RBX
	.loc	1 306 7                 # NQueens_original.c:306:7
	xorq	$1, %rcx
.Ltmp201:
	#DEBUG_VALUE: run:_26 <- %RCX
	#DEBUG_VALUE: run:_28 <- 1
	#DEBUG_VALUE: run:_27 <- 1
.LBB10_16:                              # %blklab18
                                        #   in Loop: Header=BB10_10 Depth=2
	#DEBUG_VALUE: run:_29 <- 1
	.loc	1 328 9                 # NQueens_original.c:328:9
	incq	%rax
.Ltmp202:
	#DEBUG_VALUE: run:_30 <- %RAX
	#DEBUG_VALUE: run:_20 <- 0
	#DEBUG_VALUE: run:i <- %RAX
	testq	%rcx, %rcx
	setne	%dl
.Ltmp203:
	.loc	1 283 8                 # NQueens_original.c:283:8
	cmpq	%rbx, %rax
.Ltmp204:
	#DEBUG_VALUE: run:isSolution <- %RCX
	jl	.LBB10_10
.Ltmp205:
# BB#17:                                # %blklab12
                                        #   in Loop: Header=BB10_6 Depth=1
	#DEBUG_VALUE: run:isSolution <- %RCX
	#DEBUG_VALUE: run:i <- %RAX
	#DEBUG_VALUE: run:_30 <- %RAX
	#DEBUG_VALUE: run:_31 <- 1
	.loc	1 339 6                 # NQueens_original.c:339:6
	testq	%rcx, %rcx
	je	.LBB10_21
.Ltmp206:
.LBB10_18:                              # %if.end153
                                        #   in Loop: Header=BB10_6 Depth=1
	.loc	1 342 9                 # NQueens_original.c:342:9
	movl	$16, %edi
	callq	malloc
	movq	%rax, %rbp
	.loc	1 343 10                # NQueens_original.c:343:10
	movq	%r12, 8(%rbp)
.Ltmp207:
	#DEBUG_VALUE: run:_32_dealloc <- 1
	.loc	1 344 10                # NQueens_original.c:344:10
	movq	%rbx, (%rbp)
.Ltmp208:
	.loc	1 347 3                 # NQueens_original.c:347:3
	andb	$1, %r13b
	je	.LBB10_20
# BB#19:                                # %if.then156
                                        #   in Loop: Header=BB10_6 Depth=1
.Ltmp209:
	.loc	1 347 3 is_stmt 0 discriminator 1 # NQueens_original.c:347:3
	movq	(%r15), %rax
	movq	(%rax,%rbx,8), %rdi
.Ltmp210:
	.loc	1 16 2 is_stmt 1        # NQueens_original.c:16:2
	callq	free
.Ltmp211:
	.loc	1 347 3 discriminator 1 # NQueens_original.c:347:3
	movq	(%r15), %rax
	movq	$0, (%rax,%rbx,8)
.Ltmp212:
.LBB10_20:                              # %if.end161
                                        #   in Loop: Header=BB10_6 Depth=1
	testb	%r13b, %r13b
	setne	%al
	.loc	1 348 7                 # NQueens_original.c:348:7
	movq	(%r15), %rcx
	.loc	1 348 17 is_stmt 0      # NQueens_original.c:348:17
	movq	%rbp, (%rcx,%rbx,8)
.Ltmp213:
	#DEBUG_VALUE: run:_34 <- 1
	#DEBUG_VALUE: run:_32_dealloc <- 0
	.loc	1 356 9 is_stmt 1       # NQueens_original.c:356:9
	movzbl	%al, %esi
	movq	%r15, %rdi
	movq	(%rsp), %rdx            # 8-byte Reload
	movq	%r14, %rcx
	callq	run
	movq	%rax, %r15
.Ltmp214:
	#DEBUG_VALUE: run:nq_dealloc <- 1
	#DEBUG_VALUE: run:_33 <- %R15
	#DEBUG_VALUE: run:_33_dealloc <- 0
	#DEBUG_VALUE: run:nq <- %R15
	movb	$1, %r13b
.Ltmp215:
.LBB10_21:                              # %blklab22
                                        #   in Loop: Header=BB10_6 Depth=1
	#DEBUG_VALUE: run:_36 <- 1
	.loc	1 221 4                 # NQueens_original.c:221:4
	movq	8(%r15), %rax
.Ltmp216:
	#DEBUG_VALUE: run:_15 <- %RAX
	#DEBUG_VALUE: run:_14_size <- %RAX
	#DEBUG_VALUE: run:_13 <- %RAX
	#DEBUG_VALUE: run:_12_size <- %RAX
	.loc	1 225 7                 # NQueens_original.c:225:7
	cmpq	%rbx, %rax
	jle	.LBB10_23
.Ltmp217:
# BB#22:                                # %blklab22
                                        #   in Loop: Header=BB10_6 Depth=1
	#DEBUG_VALUE: run:_12_size <- %RAX
	#DEBUG_VALUE: run:_13 <- %RAX
	#DEBUG_VALUE: run:_14_size <- %RAX
	#DEBUG_VALUE: run:_15 <- %RAX
	.loc	1 368 10                # NQueens_original.c:368:10
	incq	%r12
.Ltmp218:
	#DEBUG_VALUE: run:_37 <- %R12
	#DEBUG_VALUE: run:col <- %R12
	cmpq	%r14, %rax
	je	.LBB10_6
.Ltmp219:
.LBB10_23:                              # %blklab11
	.loc	1 235 12                # NQueens_original.c:235:12
	movq	stderr(%rip), %rcx
	.loc	1 235 4 is_stmt 0       # NQueens_original.c:235:4
	movl	$.L.str.7, %edi
	movl	$4, %esi
	movl	$1, %edx
	callq	fwrite
	.loc	1 236 4 is_stmt 1       # NQueens_original.c:236:4
	movl	$-1, %edi
	callq	exit
.Ltmp220:
.LBB10_2:                               # %cleanup
	.loc	1 391 1 discriminator 2 # NQueens_original.c:391:1
	movq	%r15, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp221:
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
.Lfunc_begin11:
	.loc	1 393 0                 # NQueens_original.c:393:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 439 2 prologue_end    # NQueens_original.c:439:2
	pushq	%rbp
.Ltmp222:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp223:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp224:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp225:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp226:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp227:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Ltmp228:
	.cfi_def_cfa_offset 64
.Ltmp229:
	.cfi_offset %rbx, -56
.Ltmp230:
	.cfi_offset %r12, -48
.Ltmp231:
	.cfi_offset %r13, -40
.Ltmp232:
	.cfi_offset %r14, -32
.Ltmp233:
	.cfi_offset %r15, -24
.Ltmp234:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
.Ltmp235:
	#DEBUG_VALUE: main:max_dealloc <- 0
	#DEBUG_VALUE: main:n <- 0
	#DEBUG_VALUE: main:queens_size <- 0
	#DEBUG_VALUE: main:queens_dealloc <- 0
	#DEBUG_VALUE: main:num_solutions <- 0
	#DEBUG_VALUE: main:nq_dealloc <- 0
	#DEBUG_VALUE: main:_6_dealloc <- 0
	#DEBUG_VALUE: main:_7_size <- 0
	#DEBUG_VALUE: main:_7_size_size <- 0
	#DEBUG_VALUE: main:_7_dealloc <- 0
	#DEBUG_VALUE: main:_8 <- 0
	#DEBUG_VALUE: main:_9_size <- 0
	#DEBUG_VALUE: main:_9_dealloc <- 0
	#DEBUG_VALUE: main:_10 <- 0
	#DEBUG_VALUE: main:_11 <- 0
	#DEBUG_VALUE: main:_12_dealloc <- 0
	#DEBUG_VALUE: main:_13_size <- 0
	#DEBUG_VALUE: main:_13_dealloc <- 0
	#DEBUG_VALUE: main:_14 <- 0
	#DEBUG_VALUE: main:_15_dealloc <- 0
	#DEBUG_VALUE: main:_16_dealloc <- 0
	#DEBUG_VALUE: main:_17 <- 0
	#DEBUG_VALUE: main:_20_size <- 0
	#DEBUG_VALUE: main:_20_dealloc <- 0
	#DEBUG_VALUE: main:_23_size <- 0
	#DEBUG_VALUE: main:_23_dealloc <- 0
	#DEBUG_VALUE: main:_28_size <- 0
	#DEBUG_VALUE: main:_28_dealloc <- 0
	#DEBUG_VALUE: main:_31 <- 0
	#DEBUG_VALUE: main:_34_size <- 0
	#DEBUG_VALUE: main:_34_dealloc <- 0
	callq	convertArgsToIntArray
.Ltmp236:
	#DEBUG_VALUE: main:_7 <- %RAX
	.loc	1 443 5                 # NQueens_original.c:443:5
	movq	(%rax), %rdi
.Ltmp237:
	#DEBUG_VALUE: main:_9 <- %RDI
	.loc	1 446 2                 # NQueens_original.c:446:2
	callq	parseStringToInt
.Ltmp238:
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_6 <- %RAX
	#DEBUG_VALUE: main:max_dealloc <- 1
	.loc	1 454 9                 # NQueens_original.c:454:9
	testq	%rax, %rax
	je	.LBB11_10
.Ltmp239:
# BB#1:                                 # %if.end5
	#DEBUG_VALUE: main:_6 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	movq	%rax, (%rsp)            # 8-byte Spill
	.loc	1 456 6                 # NQueens_original.c:456:6
	movq	(%rax), %r15
.Ltmp240:
	#DEBUG_VALUE: nqueen:queens_size <- %R15
	#DEBUG_VALUE: main:_13_size <- %R15
	#DEBUG_VALUE: main:_12_dealloc <- 1
	#DEBUG_VALUE: main:_11 <- 0
	#DEBUG_VALUE: main:_10 <- 0
	#DEBUG_VALUE: main:queens_size <- %R15
	#DEBUG_VALUE: main:n <- %R15
	.loc	1 469 2                 # NQueens_original.c:469:2
	leaq	(,%r15,8), %r12
	movq	%r12, %rdi
	callq	malloc
.Ltmp241:
	movq	%rax, %r13
.Ltmp242:
	#DEBUG_VALUE: i <- 0
	.loc	1 469 2 is_stmt 0 discriminator 1 # NQueens_original.c:469:2
	testq	%r15, %r15
	jle	.LBB11_11
.Ltmp243:
# BB#2:
	#DEBUG_VALUE: main:n <- %R15
	#DEBUG_VALUE: main:queens_size <- %R15
	#DEBUG_VALUE: main:_13_size <- %R15
	#DEBUG_VALUE: nqueen:queens_size <- %R15
	movq	%r13, %rbx
	movq	%r15, %rbp
.Ltmp244:
	.p2align	4, 0x90
.LBB11_3:                               # %for.body26
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 3 17 is_stmt 1 discriminator 1 # NQueens_original.c:3:17
	movl	$16, %edi
	callq	malloc
	.loc	1 5 13                  # NQueens_original.c:5:13
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%rax)
.Ltmp245:
	.loc	1 469 2 discriminator 3 # NQueens_original.c:469:2
	movq	%rax, (%rbx)
.Ltmp246:
	.loc	1 469 2 is_stmt 0 discriminator 1 # NQueens_original.c:469:2
	addq	$8, %rbx
	decq	%rbp
	jne	.LBB11_3
.Ltmp247:
# BB#4:                                 # %for.body60.preheader
	#DEBUG_VALUE: main:_13_dealloc <- 1
	.loc	1 473 2 is_stmt 1       # NQueens_original.c:473:2
	movq	%r12, %rdi
	callq	malloc
	movq	%rax, %r12
.Ltmp248:
	#DEBUG_VALUE: i <- 0
	movq	%r12, %rbp
	movq	%r15, %rbx
	.p2align	4, 0x90
.LBB11_5:                               # %for.body60
                                        # =>This Inner Loop Header: Depth=1
.Ltmp249:
	.loc	1 473 2 is_stmt 0 discriminator 3 # NQueens_original.c:473:2
	movq	(%r13), %r14
.Ltmp250:
	.loc	1 3 17 is_stmt 1 discriminator 1 # NQueens_original.c:3:17
	movl	$16, %edi
	callq	malloc
	.loc	1 4 21                  # NQueens_original.c:4:21
	movups	(%r14), %xmm0
	.loc	1 4 13 is_stmt 0        # NQueens_original.c:4:13
	movups	%xmm0, (%rax)
.Ltmp251:
	.loc	1 473 2 is_stmt 1 discriminator 3 # NQueens_original.c:473:2
	movq	%rax, (%rbp)
.Ltmp252:
	.loc	1 473 2 is_stmt 0 discriminator 1 # NQueens_original.c:473:2
	addq	$8, %rbp
	addq	$8, %r13
	decq	%rbx
	jne	.LBB11_5
	jmp	.LBB11_6
.Ltmp253:
.LBB11_11:                              # %if.end50.thread
	#DEBUG_VALUE: main:n <- %R15
	#DEBUG_VALUE: main:queens_size <- %R15
	#DEBUG_VALUE: main:_13_size <- %R15
	#DEBUG_VALUE: nqueen:queens_size <- %R15
	#DEBUG_VALUE: main:_13_dealloc <- 1
	.loc	1 473 2                 # NQueens_original.c:473:2
	movq	%r12, %rdi
	callq	malloc
	movq	%rax, %r12
.Ltmp254:
	#DEBUG_VALUE: i <- 0
.LBB11_6:                               # %if.then191
	#DEBUG_VALUE: main:queens_dealloc <- 1
	#DEBUG_VALUE: main:num_solutions <- 0
	#DEBUG_VALUE: main:_13_dealloc <- 0
	#DEBUG_VALUE: main:_14 <- 0
	#DEBUG_VALUE: nqueen:num_solutions <- 0
	#DEBUG_VALUE: nqueen:nq_dealloc <- 0
	#DEBUG_VALUE: nqueen:_3_dealloc <- 0
	.loc	1 58 7 is_stmt 1        # NQueens_original.c:58:7
	movl	$24, %edi
	callq	malloc
.Ltmp255:
	#DEBUG_VALUE: nqueen:_3 <- %RAX
	#DEBUG_VALUE: main:_15 <- %RAX
	#DEBUG_VALUE: main:nq <- %RAX
	.loc	1 59 20                 # NQueens_original.c:59:20
	movq	$0, 16(%rax)
	.loc	1 60 2                  # NQueens_original.c:60:2
	movq	%r15, 8(%rax)
	movq	%r12, (%rax)
.Ltmp256:
	#DEBUG_VALUE: nqueen:queens_dealloc <- 0
	#DEBUG_VALUE: nqueen:_3_dealloc <- 1
	#DEBUG_VALUE: main:_17 <- 0
	#DEBUG_VALUE: main:_15_dealloc <- 0
	#DEBUG_VALUE: main:nq_dealloc <- 1
	#DEBUG_VALUE: main:queens_dealloc <- 0
	.loc	1 492 8                 # NQueens_original.c:492:8
	movl	$1, %esi
	xorl	%edx, %edx
	movq	%rax, %rdi
	movq	%r15, %rcx
	callq	run
.Ltmp257:
	movq	%rax, %rbx
.Ltmp258:
	#DEBUG_VALUE: main:_16 <- %RBX
	#DEBUG_VALUE: main:nq <- %RBX
	#DEBUG_VALUE: main:_20_size <- 33
	#DEBUG_VALUE: main:_16_dealloc <- 0
	.loc	1 503 2                 # NQueens_original.c:503:2
	xorl	%edi, %edi
	movl	$33, %esi
	callq	create1DArray
	movq	%rax, %r12
.Ltmp259:
	#DEBUG_VALUE: main:_20 <- %R12
	.loc	1 504 9                 # NQueens_original.c:504:9
	movaps	.LCPI11_0(%rip), %xmm0  # xmm0 = [78,45]
	movups	%xmm0, (%r12)
	.loc	1 504 35 is_stmt 0      # NQueens_original.c:504:35
	movaps	.LCPI11_1(%rip), %xmm0  # xmm0 = [81,117]
	movups	%xmm0, 16(%r12)
	.loc	1 504 62                # NQueens_original.c:504:62
	movaps	.LCPI11_2(%rip), %xmm0  # xmm0 = [101,101]
	movups	%xmm0, 32(%r12)
	.loc	1 504 90                # NQueens_original.c:504:90
	movaps	.LCPI11_3(%rip), %xmm0  # xmm0 = [110,32]
	movups	%xmm0, 48(%r12)
	.loc	1 504 117               # NQueens_original.c:504:117
	movaps	.LCPI11_4(%rip), %xmm0  # xmm0 = [80,114]
	movups	%xmm0, 64(%r12)
	.loc	1 504 145               # NQueens_original.c:504:145
	movaps	.LCPI11_5(%rip), %xmm0  # xmm0 = [111,98]
	movups	%xmm0, 80(%r12)
	.loc	1 504 174               # NQueens_original.c:504:174
	movaps	.LCPI11_6(%rip), %xmm0  # xmm0 = [108,101]
	movups	%xmm0, 96(%r12)
	.loc	1 504 204               # NQueens_original.c:504:204
	movaps	.LCPI11_7(%rip), %xmm0  # xmm0 = [109,32]
	movups	%xmm0, 112(%r12)
	.loc	1 504 233               # NQueens_original.c:504:233
	movaps	.LCPI11_8(%rip), %xmm0  # xmm0 = [111,110]
	movups	%xmm0, 128(%r12)
	.loc	1 504 263               # NQueens_original.c:504:263
	movaps	.LCPI11_9(%rip), %xmm0  # xmm0 = [32,97]
	movups	%xmm0, 144(%r12)
	.loc	1 504 291               # NQueens_original.c:504:291
	movaps	.LCPI11_10(%rip), %xmm0 # xmm0 = [32,78]
	movups	%xmm0, 160(%r12)
	.loc	1 504 319               # NQueens_original.c:504:319
	movaps	.LCPI11_11(%rip), %xmm1 # xmm1 = [32,88]
	movups	%xmm1, 176(%r12)
	.loc	1 504 347               # NQueens_original.c:504:347
	movups	%xmm0, 192(%r12)
	.loc	1 504 375               # NQueens_original.c:504:375
	movaps	.LCPI11_12(%rip), %xmm0 # xmm0 = [32,66]
	movups	%xmm0, 208(%r12)
	.loc	1 504 403               # NQueens_original.c:504:403
	movaps	.LCPI11_13(%rip), %xmm0 # xmm0 = [111,97]
	movups	%xmm0, 224(%r12)
	.loc	1 504 432               # NQueens_original.c:504:432
	movaps	.LCPI11_14(%rip), %xmm0 # xmm0 = [114,100]
	movups	%xmm0, 240(%r12)
	.loc	1 504 462               # NQueens_original.c:504:462
	movq	$46, 256(%r12)
.Ltmp260:
	#DEBUG_VALUE: main:_20_dealloc <- 1
	.loc	1 507 2 is_stmt 1       # NQueens_original.c:507:2
	movl	$33, %esi
	movq	%r12, %rdi
	callq	println_s
.Ltmp261:
	#DEBUG_VALUE: main:_23_size <- 4
	.loc	1 512 2                 # NQueens_original.c:512:2
	xorl	%edi, %edi
	movl	$4, %esi
	callq	create1DArray
	movq	%rax, %r13
.Ltmp262:
	#DEBUG_VALUE: main:_23 <- %R13
	.loc	1 513 9                 # NQueens_original.c:513:9
	movaps	.LCPI11_15(%rip), %xmm0 # xmm0 = [78,32]
	movups	%xmm0, (%r13)
	.loc	1 513 35 is_stmt 0      # NQueens_original.c:513:35
	movaps	.LCPI11_16(%rip), %xmm0 # xmm0 = [61,32]
	movups	%xmm0, 16(%r13)
.Ltmp263:
	#DEBUG_VALUE: main:_23_dealloc <- 1
	.loc	1 516 2 is_stmt 1       # NQueens_original.c:516:2
	movl	$4, %esi
	movq	%r13, %rdi
	callq	printf_s
	.loc	1 520 2                 # NQueens_original.c:520:2
	movl	$.L.str.8, %edi
	xorl	%eax, %eax
	movq	%r15, %rsi
	callq	printf
.Ltmp264:
	#DEBUG_VALUE: main:_28_size <- 6
	.loc	1 525 2                 # NQueens_original.c:525:2
	xorl	%edi, %edi
	movl	$6, %esi
	callq	create1DArray
	movq	%rax, %r15
.Ltmp265:
	#DEBUG_VALUE: main:_28 <- %R15
	.loc	1 526 9                 # NQueens_original.c:526:9
	movaps	.LCPI11_17(%rip), %xmm0 # xmm0 = [70,111]
	movups	%xmm0, (%r15)
	.loc	1 526 36 is_stmt 0      # NQueens_original.c:526:36
	movaps	.LCPI11_18(%rip), %xmm0 # xmm0 = [117,110]
	movups	%xmm0, 16(%r15)
	.loc	1 526 64                # NQueens_original.c:526:64
	movaps	.LCPI11_19(%rip), %xmm0 # xmm0 = [100,32]
	movups	%xmm0, 32(%r15)
.Ltmp266:
	#DEBUG_VALUE: main:_28_dealloc <- 1
	.loc	1 529 2 is_stmt 1       # NQueens_original.c:529:2
	movl	$6, %esi
	movq	%r15, %rdi
	callq	printf_s
	.loc	1 533 12                # NQueens_original.c:533:12
	movq	16(%rbx), %rsi
.Ltmp267:
	#DEBUG_VALUE: main:_31 <- %RSI
	.loc	1 535 2                 # NQueens_original.c:535:2
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp268:
	#DEBUG_VALUE: main:_34_size <- 11
	.loc	1 540 2                 # NQueens_original.c:540:2
	xorl	%edi, %edi
	movl	$11, %esi
	callq	create1DArray
	movq	%rax, %r14
.Ltmp269:
	#DEBUG_VALUE: main:_34 <- %R14
	.loc	1 541 9                 # NQueens_original.c:541:9
	movaps	.LCPI11_20(%rip), %xmm0 # xmm0 = [32,115]
	movups	%xmm0, (%r14)
	.loc	1 541 36 is_stmt 0      # NQueens_original.c:541:36
	movaps	.LCPI11_21(%rip), %xmm0 # xmm0 = [111,108]
	movups	%xmm0, 16(%r14)
	.loc	1 541 64                # NQueens_original.c:541:64
	movaps	.LCPI11_22(%rip), %xmm0 # xmm0 = [117,116]
	movups	%xmm0, 32(%r14)
	.loc	1 541 92                # NQueens_original.c:541:92
	movaps	.LCPI11_23(%rip), %xmm0 # xmm0 = [105,111]
	movups	%xmm0, 48(%r14)
	.loc	1 541 120               # NQueens_original.c:541:120
	movaps	.LCPI11_24(%rip), %xmm0 # xmm0 = [110,115]
	movups	%xmm0, 64(%r14)
	.loc	1 541 149               # NQueens_original.c:541:149
	movq	$46, 80(%r14)
.Ltmp270:
	#DEBUG_VALUE: main:_34_dealloc <- 1
	.loc	1 544 2 is_stmt 1       # NQueens_original.c:544:2
	movl	$11, %esi
	movq	%r14, %rdi
	callq	println_s
.Ltmp271:
	.loc	1 548 2 discriminator 1 # NQueens_original.c:548:2
	movq	(%rsp), %rdi            # 8-byte Reload
	callq	free
.Ltmp272:
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: main:max_dealloc <- 0
	.loc	1 40 2 discriminator 1  # NQueens_original.c:40:2
	cmpq	$0, 8(%rbx)
	jle	.LBB11_9
.Ltmp273:
# BB#7:                                 # %for.body.i.preheader
	#DEBUG_VALUE: main:_34 <- %R14
	#DEBUG_VALUE: main:_28 <- %R15
	#DEBUG_VALUE: main:_23 <- %R13
	#DEBUG_VALUE: main:_20 <- %R12
	#DEBUG_VALUE: main:nq <- %RBX
	#DEBUG_VALUE: main:_16 <- %RBX
	xorl	%ebp, %ebp
.Ltmp274:
	.p2align	4, 0x90
.LBB11_8:                               # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 40 2 is_stmt 0 discriminator 3 # NQueens_original.c:40:2
	movq	(%rbx), %rax
	movq	(%rax,%rbp,8), %rdi
.Ltmp275:
	.loc	1 16 2 is_stmt 1        # NQueens_original.c:16:2
	callq	free
.Ltmp276:
	.loc	1 40 2 discriminator 3  # NQueens_original.c:40:2
	movq	(%rbx), %rax
	movq	$0, (%rax,%rbp,8)
.Ltmp277:
	.loc	1 40 2 is_stmt 0 discriminator 1 # NQueens_original.c:40:2
	incq	%rbp
	cmpq	8(%rbx), %rbp
	jl	.LBB11_8
.Ltmp278:
.LBB11_9:                               # %free_NQueen.exit
	.loc	1 40 2 discriminator 5  # NQueens_original.c:40:2
	movq	(%rbx), %rdi
	callq	free
.Ltmp279:
	.loc	1 41 2 is_stmt 1        # NQueens_original.c:41:2
	movq	%rbx, %rdi
	callq	free
.Ltmp280:
	#DEBUG_VALUE: main:_12_dealloc <- 0
	#DEBUG_VALUE: main:nq_dealloc <- 0
	.loc	1 558 2 discriminator 1 # NQueens_original.c:558:2
	movq	%r12, %rdi
	callq	free
.Ltmp281:
	#DEBUG_VALUE: main:_20_dealloc <- 0
	.loc	1 559 2 discriminator 1 # NQueens_original.c:559:2
	movq	%r13, %rdi
	callq	free
.Ltmp282:
	#DEBUG_VALUE: main:_23_dealloc <- 0
	.loc	1 560 2 discriminator 1 # NQueens_original.c:560:2
	movq	%r15, %rdi
	callq	free
.Ltmp283:
	#DEBUG_VALUE: main:_28_dealloc <- 0
	.loc	1 561 2 discriminator 1 # NQueens_original.c:561:2
	movq	%r14, %rdi
	callq	free
.Ltmp284:
	#DEBUG_VALUE: main:_34_dealloc <- 0
.LBB11_10:                              # %if.end240
	.loc	1 562 2                 # NQueens_original.c:562:2
	xorl	%edi, %edi
	callq	exit
.Ltmp285:
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

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git f82fb5beb88e841f7a00cfb2a2ceabe46bcb2a9b) (http://llvm.org/git/llvm.git bafbf2b643f118fd2ea402ed6cd204281c7e9e94)" # string offset=0
.Linfo_string1:
	.asciz	"NQueens_original.c"    # string offset=165
.Linfo_string2:
	.asciz	"/home/mw169/workspace/WhileyOpenCL/polly/NQueens/impl/original/copyreduced_dealloc" # string offset=184
.Linfo_string3:
	.asciz	"copy_POS"              # string offset=267
.Linfo_string4:
	.asciz	"r"                     # string offset=276
.Linfo_string5:
	.asciz	"long long int"         # string offset=278
.Linfo_string6:
	.asciz	"c"                     # string offset=292
.Linfo_string7:
	.asciz	"POS"                   # string offset=294
.Linfo_string8:
	.asciz	"_POS"                  # string offset=298
.Linfo_string9:
	.asciz	"new_POS"               # string offset=303
.Linfo_string10:
	.asciz	"copy_NQueen"           # string offset=311
.Linfo_string11:
	.asciz	"queens"                # string offset=323
.Linfo_string12:
	.asciz	"queens_size"           # string offset=330
.Linfo_string13:
	.asciz	"num_solutions"         # string offset=342
.Linfo_string14:
	.asciz	"NQueen"                # string offset=356
.Linfo_string15:
	.asciz	"_NQueen"               # string offset=363
.Linfo_string16:
	.asciz	"new_NQueen"            # string offset=371
.Linfo_string17:
	.asciz	"i"                     # string offset=382
.Linfo_string18:
	.asciz	"int"                   # string offset=384
.Linfo_string19:
	.asciz	"free_POS"              # string offset=388
.Linfo_string20:
	.asciz	"pos"                   # string offset=397
.Linfo_string21:
	.asciz	"printf_POS"            # string offset=401
.Linfo_string22:
	.asciz	"conflict"              # string offset=412
.Linfo_string23:
	.asciz	"p"                     # string offset=421
.Linfo_string24:
	.asciz	"p_dealloc"             # string offset=423
.Linfo_string25:
	.asciz	"_Bool"                 # string offset=433
.Linfo_string26:
	.asciz	"row"                   # string offset=439
.Linfo_string27:
	.asciz	"col"                   # string offset=443
.Linfo_string28:
	.asciz	"_14"                   # string offset=447
.Linfo_string29:
	.asciz	"_13"                   # string offset=451
.Linfo_string30:
	.asciz	"_12"                   # string offset=455
.Linfo_string31:
	.asciz	"_11"                   # string offset=459
.Linfo_string32:
	.asciz	"_9"                    # string offset=463
.Linfo_string33:
	.asciz	"_8"                    # string offset=466
.Linfo_string34:
	.asciz	"rowDiff"               # string offset=469
.Linfo_string35:
	.asciz	"colDiff"               # string offset=477
.Linfo_string36:
	.asciz	"_3"                    # string offset=485
.Linfo_string37:
	.asciz	"_10"                   # string offset=488
.Linfo_string38:
	.asciz	"_15"                   # string offset=492
.Linfo_string39:
	.asciz	"nqueen"                # string offset=496
.Linfo_string40:
	.asciz	"queens_dealloc"        # string offset=503
.Linfo_string41:
	.asciz	"nq_dealloc"            # string offset=518
.Linfo_string42:
	.asciz	"_3_dealloc"            # string offset=529
.Linfo_string43:
	.asciz	"nq"                    # string offset=540
.Linfo_string44:
	.asciz	"free_NQueen"           # string offset=543
.Linfo_string45:
	.asciz	"copy_array_POS"        # string offset=555
.Linfo_string46:
	.asciz	"copy_array_NQueen"     # string offset=570
.Linfo_string47:
	.asciz	"printf_NQueen"         # string offset=588
.Linfo_string48:
	.asciz	"run"                   # string offset=602
.Linfo_string49:
	.asciz	"main"                  # string offset=606
.Linfo_string50:
	.asciz	"_POS_size"             # string offset=611
.Linfo_string51:
	.asciz	"_NQueen_size"          # string offset=621
.Linfo_string52:
	.asciz	"n"                     # string offset=634
.Linfo_string53:
	.asciz	"dim"                   # string offset=636
.Linfo_string54:
	.asciz	"_22"                   # string offset=640
.Linfo_string55:
	.asciz	"_37"                   # string offset=644
.Linfo_string56:
	.asciz	"_36"                   # string offset=648
.Linfo_string57:
	.asciz	"_35"                   # string offset=652
.Linfo_string58:
	.asciz	"_34"                   # string offset=656
.Linfo_string59:
	.asciz	"_33_dealloc"           # string offset=660
.Linfo_string60:
	.asciz	"_32_dealloc"           # string offset=672
.Linfo_string61:
	.asciz	"_30"                   # string offset=684
.Linfo_string62:
	.asciz	"_29"                   # string offset=688
.Linfo_string63:
	.asciz	"_24_dealloc"           # string offset=692
.Linfo_string64:
	.asciz	"_23_dealloc"           # string offset=704
.Linfo_string65:
	.asciz	"_23_size"              # string offset=716
.Linfo_string66:
	.asciz	"_21_dealloc"           # string offset=725
.Linfo_string67:
	.asciz	"_21_size"              # string offset=737
.Linfo_string68:
	.asciz	"_20"                   # string offset=746
.Linfo_string69:
	.asciz	"_19"                   # string offset=750
.Linfo_string70:
	.asciz	"_18_dealloc"           # string offset=754
.Linfo_string71:
	.asciz	"_18_size"              # string offset=766
.Linfo_string72:
	.asciz	"_17"                   # string offset=775
.Linfo_string73:
	.asciz	"_14_dealloc"           # string offset=779
.Linfo_string74:
	.asciz	"_14_size"              # string offset=791
.Linfo_string75:
	.asciz	"_12_dealloc"           # string offset=800
.Linfo_string76:
	.asciz	"_12_size"              # string offset=812
.Linfo_string77:
	.asciz	"_25"                   # string offset=821
.Linfo_string78:
	.asciz	"_23"                   # string offset=825
.Linfo_string79:
	.asciz	"_24"                   # string offset=829
.Linfo_string80:
	.asciz	"_26"                   # string offset=833
.Linfo_string81:
	.asciz	"_28"                   # string offset=837
.Linfo_string82:
	.asciz	"_27"                   # string offset=841
.Linfo_string83:
	.asciz	"isSolution"            # string offset=845
.Linfo_string84:
	.asciz	"_31"                   # string offset=856
.Linfo_string85:
	.asciz	"_33"                   # string offset=860
.Linfo_string86:
	.asciz	"_16"                   # string offset=864
.Linfo_string87:
	.asciz	"_18"                   # string offset=868
.Linfo_string88:
	.asciz	"_21"                   # string offset=872
.Linfo_string89:
	.asciz	"_32"                   # string offset=876
.Linfo_string90:
	.asciz	"argc"                  # string offset=880
.Linfo_string91:
	.asciz	"args"                  # string offset=885
.Linfo_string92:
	.asciz	"char"                  # string offset=890
.Linfo_string93:
	.asciz	"max_dealloc"           # string offset=895
.Linfo_string94:
	.asciz	"_6_dealloc"            # string offset=907
.Linfo_string95:
	.asciz	"_7_size"               # string offset=918
.Linfo_string96:
	.asciz	"_7_size_size"          # string offset=926
.Linfo_string97:
	.asciz	"_7_dealloc"            # string offset=939
.Linfo_string98:
	.asciz	"_9_size"               # string offset=950
.Linfo_string99:
	.asciz	"_9_dealloc"            # string offset=958
.Linfo_string100:
	.asciz	"_13_size"              # string offset=969
.Linfo_string101:
	.asciz	"_13_dealloc"           # string offset=978
.Linfo_string102:
	.asciz	"_15_dealloc"           # string offset=990
.Linfo_string103:
	.asciz	"_16_dealloc"           # string offset=1002
.Linfo_string104:
	.asciz	"_20_size"              # string offset=1014
.Linfo_string105:
	.asciz	"_20_dealloc"           # string offset=1023
.Linfo_string106:
	.asciz	"_28_size"              # string offset=1035
.Linfo_string107:
	.asciz	"_28_dealloc"           # string offset=1044
.Linfo_string108:
	.asciz	"_34_size"              # string offset=1056
.Linfo_string109:
	.asciz	"_34_dealloc"           # string offset=1065
.Linfo_string110:
	.asciz	"_7"                    # string offset=1077
.Linfo_string111:
	.asciz	"max"                   # string offset=1080
.Linfo_string112:
	.asciz	"_6"                    # string offset=1084
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp2-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp2-.Lfunc_begin0
	.quad	.Ltmp4-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Ltmp3-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc2:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp17-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp17-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp16-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp16-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp29-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp29-.Lfunc_begin0
	.quad	.Ltmp30-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Lfunc_begin4-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Lfunc_begin5-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	16                      # 16
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Lfunc_begin5-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	24                      # 24
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Ltmp80-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Lfunc_begin6-.Lfunc_begin0
	.quad	.Ltmp95-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp95-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Lfunc_begin7-.Lfunc_begin0
	.quad	.Ltmp110-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp110-.Lfunc_begin0
	.quad	.Ltmp113-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp114-.Lfunc_begin0
	.quad	.Ltmp116-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Lfunc_begin8-.Lfunc_begin0
	.quad	.Ltmp126-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp126-.Lfunc_begin0
	.quad	.Ltmp129-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Lfunc_begin8-.Lfunc_begin0
	.quad	.Ltmp125-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp130-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Lfunc_begin8-.Lfunc_begin0
	.quad	.Ltmp124-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp124-.Lfunc_begin0
	.quad	.Ltmp131-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Lfunc_begin8-.Lfunc_begin0
	.quad	.Ltmp127-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	82                      # super-register DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp128-.Lfunc_begin0
	.quad	.Lfunc_end8-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp126-.Lfunc_begin0
	.quad	.Ltmp128-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp128-.Lfunc_begin0
	.quad	.Lfunc_end8-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Lfunc_end8-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Lfunc_begin9-.Lfunc_begin0
	.quad	.Ltmp149-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp150-.Lfunc_begin0
	.quad	.Ltmp153-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Lfunc_begin9-.Lfunc_begin0
	.quad	.Ltmp135-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	84                      # super-register DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp135-.Lfunc_begin0
	.quad	.Ltmp149-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	84                      # super-register DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	1                       # 1
	.quad	.Ltmp149-.Lfunc_begin0
	.quad	.Ltmp150-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp150-.Lfunc_begin0
	.quad	.Ltmp153-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	84                      # super-register DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	1                       # 1
	.quad	.Ltmp154-.Lfunc_begin0
	.quad	.Lfunc_end9-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Lfunc_begin9-.Lfunc_begin0
	.quad	.Ltmp139-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Lfunc_begin9-.Lfunc_begin0
	.quad	.Ltmp142-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp150-.Lfunc_begin0
	.quad	.Ltmp153-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Ltmp135-.Lfunc_begin0
	.quad	.Ltmp136-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp136-.Lfunc_begin0
	.quad	.Ltmp137-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc23:
	.quad	.Ltmp135-.Lfunc_begin0
	.quad	.Ltmp139-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp139-.Lfunc_begin0
	.quad	.Ltmp140-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp135-.Lfunc_begin0
	.quad	.Ltmp143-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp143-.Lfunc_begin0
	.quad	.Ltmp149-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Ltmp135-.Lfunc_begin0
	.quad	.Ltmp145-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp145-.Lfunc_begin0
	.quad	.Ltmp149-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp135-.Lfunc_begin0
	.quad	.Ltmp136-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp136-.Lfunc_begin0
	.quad	.Ltmp137-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Ltmp135-.Lfunc_begin0
	.quad	.Ltmp139-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp139-.Lfunc_begin0
	.quad	.Ltmp140-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Ltmp135-.Lfunc_begin0
	.quad	.Ltmp143-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp143-.Lfunc_begin0
	.quad	.Ltmp149-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Ltmp135-.Lfunc_begin0
	.quad	.Ltmp141-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp144-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Ltmp135-.Lfunc_begin0
	.quad	.Ltmp145-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp145-.Lfunc_begin0
	.quad	.Ltmp149-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp135-.Lfunc_begin0
	.quad	.Ltmp143-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp143-.Lfunc_begin0
	.quad	.Ltmp146-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Ltmp148-.Lfunc_begin0
	.quad	.Ltmp149-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc33:
	.quad	.Ltmp152-.Lfunc_begin0
	.quad	.Ltmp153-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc34:
	.quad	.Lfunc_begin10-.Lfunc_begin0
	.quad	.Ltmp173-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp173-.Lfunc_begin0
	.quad	.Ltmp180-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp214-.Lfunc_begin0
	.quad	.Ltmp215-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc35:
	.quad	.Lfunc_begin10-.Lfunc_begin0
	.quad	.Ltmp172-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	84                      # super-register DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp172-.Lfunc_begin0
	.quad	.Ltmp178-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	93                      # super-register DW_OP_reg13
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp178-.Lfunc_begin0
	.quad	.Ltmp180-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	93                      # super-register DW_OP_reg13
	.byte	147                     # DW_OP_piece
	.byte	1                       # 1
	.quad	.Ltmp214-.Lfunc_begin0
	.quad	.Lfunc_end10-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc36:
	.quad	.Lfunc_begin10-.Lfunc_begin0
	.quad	.Ltmp171-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp171-.Lfunc_begin0
	.quad	.Ltmp180-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc37:
	.quad	.Lfunc_begin10-.Lfunc_begin0
	.quad	.Ltmp170-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp170-.Lfunc_begin0
	.quad	.Ltmp180-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc38:
	.quad	.Ltmp169-.Lfunc_begin0
	.quad	.Ltmp170-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp170-.Lfunc_begin0
	.quad	.Ltmp173-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	.Ltmp173-.Lfunc_begin0
	.quad	.Lfunc_end10-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc39:
	.quad	.Ltmp173-.Lfunc_begin0
	.quad	.Ltmp218-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp218-.Lfunc_begin0
	.quad	.Ltmp219-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc40:
	.quad	.Ltmp173-.Lfunc_begin0
	.quad	.Ltmp215-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp215-.Lfunc_begin0
	.quad	.Lfunc_end10-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc41:
	.quad	.Ltmp173-.Lfunc_begin0
	.quad	.Ltmp179-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp179-.Lfunc_begin0
	.quad	.Ltmp180-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	0                       # 0
	.quad	0
	.quad	0
.Ldebug_loc42:
	.quad	.Ltmp173-.Lfunc_begin0
	.quad	.Ltmp213-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp213-.Lfunc_begin0
	.quad	.Lfunc_end10-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc43:
	.quad	.Ltmp173-.Lfunc_begin0
	.quad	.Ltmp207-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp207-.Lfunc_begin0
	.quad	.Ltmp213-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp213-.Lfunc_begin0
	.quad	.Lfunc_end10-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc44:
	.quad	.Ltmp173-.Lfunc_begin0
	.quad	.Ltmp202-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp202-.Lfunc_begin0
	.quad	.Ltmp206-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc45:
	.quad	.Ltmp173-.Lfunc_begin0
	.quad	.Ltmp201-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp201-.Lfunc_begin0
	.quad	.Lfunc_end10-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc46:
	.quad	.Ltmp173-.Lfunc_begin0
	.quad	.Ltmp176-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp176-.Lfunc_begin0
	.quad	.Ltmp179-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp216-.Lfunc_begin0
	.quad	.Ltmp219-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc47:
	.quad	.Ltmp173-.Lfunc_begin0
	.quad	.Ltmp176-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp176-.Lfunc_begin0
	.quad	.Ltmp179-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp216-.Lfunc_begin0
	.quad	.Ltmp219-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc48:
	.quad	.Ltmp173-.Lfunc_begin0
	.quad	.Ltmp176-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp176-.Lfunc_begin0
	.quad	.Ltmp179-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp216-.Lfunc_begin0
	.quad	.Ltmp219-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc49:
	.quad	.Ltmp173-.Lfunc_begin0
	.quad	.Ltmp176-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp176-.Lfunc_begin0
	.quad	.Ltmp179-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp216-.Lfunc_begin0
	.quad	.Ltmp219-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc50:
	.quad	.Ltmp173-.Lfunc_begin0
	.quad	.Ltmp174-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp174-.Lfunc_begin0
	.quad	.Lfunc_end10-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc51:
	.quad	.Ltmp173-.Lfunc_begin0
	.quad	.Ltmp202-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp202-.Lfunc_begin0
	.quad	.Ltmp206-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc52:
	.quad	.Ltmp173-.Lfunc_begin0
	.quad	.Ltmp218-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp218-.Lfunc_begin0
	.quad	.Ltmp219-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc53:
	.quad	.Ltmp180-.Lfunc_begin0
	.quad	.Ltmp184-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc54:
	.quad	.Ltmp186-.Lfunc_begin0
	.quad	.Ltmp187-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc55:
	.quad	.Ltmp187-.Lfunc_begin0
	.quad	.Ltmp195-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp195-.Lfunc_begin0
	.quad	.Ltmp199-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc56:
	.quad	.Ltmp187-.Lfunc_begin0
	.quad	.Ltmp197-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp197-.Lfunc_begin0
	.quad	.Ltmp199-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc57:
	.quad	.Ltmp187-.Lfunc_begin0
	.quad	.Ltmp194-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp194-.Lfunc_begin0
	.quad	.Ltmp196-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc58:
	.quad	.Ltmp187-.Lfunc_begin0
	.quad	.Ltmp195-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp195-.Lfunc_begin0
	.quad	.Ltmp198-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc59:
	.quad	.Ltmp187-.Lfunc_begin0
	.quad	.Ltmp191-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp191-.Lfunc_begin0
	.quad	.Ltmp192-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc60:
	.quad	.Ltmp187-.Lfunc_begin0
	.quad	.Ltmp188-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp188-.Lfunc_begin0
	.quad	.Ltmp189-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc61:
	.quad	.Ltmp187-.Lfunc_begin0
	.quad	.Ltmp197-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp197-.Lfunc_begin0
	.quad	.Ltmp199-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc62:
	.quad	.Ltmp187-.Lfunc_begin0
	.quad	.Ltmp195-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp195-.Lfunc_begin0
	.quad	.Ltmp198-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc63:
	.quad	.Ltmp187-.Lfunc_begin0
	.quad	.Ltmp191-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp191-.Lfunc_begin0
	.quad	.Ltmp192-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc64:
	.quad	.Ltmp187-.Lfunc_begin0
	.quad	.Ltmp188-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp188-.Lfunc_begin0
	.quad	.Ltmp189-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc65:
	.quad	.Ltmp187-.Lfunc_begin0
	.quad	.Ltmp193-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp199-.Lfunc_begin0
	.quad	.Ltmp200-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc66:
	.quad	.Ltmp187-.Lfunc_begin0
	.quad	.Ltmp193-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp199-.Lfunc_begin0
	.quad	.Ltmp200-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc67:
	.quad	.Ltmp187-.Lfunc_begin0
	.quad	.Ltmp193-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp199-.Lfunc_begin0
	.quad	.Ltmp200-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc68:
	.quad	.Ltmp189-.Lfunc_begin0
	.quad	.Ltmp201-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc69:
	.quad	.Ltmp201-.Lfunc_begin0
	.quad	.Ltmp201-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc70:
	.quad	.Ltmp204-.Lfunc_begin0
	.quad	.Ltmp206-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc71:
	.quad	.Ltmp214-.Lfunc_begin0
	.quad	.Ltmp215-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc72:
	.quad	.Lfunc_begin11-.Lfunc_begin0
	.quad	.Ltmp236-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc73:
	.quad	.Lfunc_begin11-.Lfunc_begin0
	.quad	.Ltmp236-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc74:
	.quad	.Ltmp235-.Lfunc_begin0
	.quad	.Ltmp238-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp238-.Lfunc_begin0
	.quad	.Ltmp272-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp272-.Lfunc_begin0
	.quad	.Lfunc_end11-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc75:
	.quad	.Ltmp235-.Lfunc_begin0
	.quad	.Ltmp240-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp240-.Lfunc_begin0
	.quad	.Ltmp244-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp253-.Lfunc_begin0
	.quad	.Ltmp254-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc76:
	.quad	.Ltmp235-.Lfunc_begin0
	.quad	.Ltmp240-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp240-.Lfunc_begin0
	.quad	.Ltmp244-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp253-.Lfunc_begin0
	.quad	.Ltmp254-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc77:
	.quad	.Ltmp235-.Lfunc_begin0
	.quad	.Ltmp254-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp254-.Lfunc_begin0
	.quad	.Ltmp256-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp256-.Lfunc_begin0
	.quad	.Lfunc_end11-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc78:
	.quad	.Ltmp235-.Lfunc_begin0
	.quad	.Ltmp256-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp256-.Lfunc_begin0
	.quad	.Ltmp280-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp280-.Lfunc_begin0
	.quad	.Lfunc_end11-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc79:
	.quad	.Ltmp235-.Lfunc_begin0
	.quad	.Ltmp240-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp240-.Lfunc_begin0
	.quad	.Ltmp280-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp280-.Lfunc_begin0
	.quad	.Lfunc_end11-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc80:
	.quad	.Ltmp235-.Lfunc_begin0
	.quad	.Ltmp240-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp240-.Lfunc_begin0
	.quad	.Ltmp244-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp253-.Lfunc_begin0
	.quad	.Ltmp254-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc81:
	.quad	.Ltmp235-.Lfunc_begin0
	.quad	.Ltmp247-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp247-.Lfunc_begin0
	.quad	.Ltmp254-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp254-.Lfunc_begin0
	.quad	.Lfunc_end11-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc82:
	.quad	.Ltmp235-.Lfunc_begin0
	.quad	.Ltmp258-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp258-.Lfunc_begin0
	.quad	.Lfunc_end11-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	33                      # 33
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc83:
	.quad	.Ltmp235-.Lfunc_begin0
	.quad	.Ltmp260-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp260-.Lfunc_begin0
	.quad	.Ltmp281-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp281-.Lfunc_begin0
	.quad	.Lfunc_end11-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc84:
	.quad	.Ltmp235-.Lfunc_begin0
	.quad	.Ltmp261-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp261-.Lfunc_begin0
	.quad	.Lfunc_end11-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	4                       # 4
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc85:
	.quad	.Ltmp235-.Lfunc_begin0
	.quad	.Ltmp263-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp263-.Lfunc_begin0
	.quad	.Ltmp282-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp282-.Lfunc_begin0
	.quad	.Lfunc_end11-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc86:
	.quad	.Ltmp235-.Lfunc_begin0
	.quad	.Ltmp264-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp264-.Lfunc_begin0
	.quad	.Lfunc_end11-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	6                       # 6
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc87:
	.quad	.Ltmp235-.Lfunc_begin0
	.quad	.Ltmp266-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp266-.Lfunc_begin0
	.quad	.Ltmp283-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp283-.Lfunc_begin0
	.quad	.Lfunc_end11-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc88:
	.quad	.Ltmp235-.Lfunc_begin0
	.quad	.Ltmp267-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp267-.Lfunc_begin0
	.quad	.Ltmp268-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc89:
	.quad	.Ltmp235-.Lfunc_begin0
	.quad	.Ltmp268-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp268-.Lfunc_begin0
	.quad	.Lfunc_end11-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	11                      # 11
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc90:
	.quad	.Ltmp235-.Lfunc_begin0
	.quad	.Ltmp270-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp270-.Lfunc_begin0
	.quad	.Ltmp284-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp284-.Lfunc_begin0
	.quad	.Lfunc_end11-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc91:
	.quad	.Ltmp236-.Lfunc_begin0
	.quad	.Ltmp238-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc92:
	.quad	.Ltmp237-.Lfunc_begin0
	.quad	.Ltmp238-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc93:
	.quad	.Ltmp238-.Lfunc_begin0
	.quad	.Ltmp241-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc94:
	.quad	.Ltmp238-.Lfunc_begin0
	.quad	.Ltmp241-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc95:
	.quad	.Ltmp240-.Lfunc_begin0
	.quad	.Ltmp244-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp253-.Lfunc_begin0
	.quad	.Ltmp254-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc96:
	.quad	.Ltmp254-.Lfunc_begin0
	.quad	.Ltmp256-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp256-.Lfunc_begin0
	.quad	.Lfunc_end11-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc97:
	.quad	.Ltmp255-.Lfunc_begin0
	.quad	.Ltmp257-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc98:
	.quad	.Ltmp255-.Lfunc_begin0
	.quad	.Ltmp257-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc99:
	.quad	.Ltmp255-.Lfunc_begin0
	.quad	.Ltmp257-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp258-.Lfunc_begin0
	.quad	.Ltmp274-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc100:
	.quad	.Ltmp258-.Lfunc_begin0
	.quad	.Ltmp274-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc101:
	.quad	.Ltmp259-.Lfunc_begin0
	.quad	.Ltmp274-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc102:
	.quad	.Ltmp262-.Lfunc_begin0
	.quad	.Ltmp274-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc103:
	.quad	.Ltmp265-.Lfunc_begin0
	.quad	.Ltmp274-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc104:
	.quad	.Ltmp269-.Lfunc_begin0
	.quad	.Ltmp274-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
	.section	.debug_abbrev,"",@progbits
.Lsection_abbrev:
	.byte	1                       # Abbreviation Code
	.byte	17                      # DW_TAG_compile_unit
	.byte	1                       # DW_CHILDREN_yes
	.byte	37                      # DW_AT_producer
	.byte	14                      # DW_FORM_strp
	.byte	19                      # DW_AT_language
	.byte	5                       # DW_FORM_data2
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	16                      # DW_AT_stmt_list
	.byte	23                      # DW_FORM_sec_offset
	.byte	27                      # DW_AT_comp_dir
	.byte	14                      # DW_FORM_strp
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	2                       # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	3                       # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	4                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	5                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	6                       # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	32                      # DW_AT_inline
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	7                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	10                      # Abbreviation Code
	.byte	22                      # DW_TAG_typedef
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
	.byte	19                      # DW_TAG_structure_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	12                      # Abbreviation Code
	.byte	13                      # DW_TAG_member
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	56                      # DW_AT_data_member_location
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	13                      # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	14                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	15                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	16                      # Abbreviation Code
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	17                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	18                      # Abbreviation Code
	.byte	29                      # DW_TAG_inlined_subroutine
	.byte	0                       # DW_CHILDREN_no
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	88                      # DW_AT_call_file
	.byte	11                      # DW_FORM_data1
	.byte	89                      # DW_AT_call_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	19                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	20                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	21                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	22                      # Abbreviation Code
	.byte	29                      # DW_TAG_inlined_subroutine
	.byte	0                       # DW_CHILDREN_no
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	88                      # DW_AT_call_file
	.byte	11                      # DW_FORM_data1
	.byte	89                      # DW_AT_call_line
	.byte	11                      # DW_FORM_data1
	.ascii	"\266B"                 # DW_AT_GNU_discriminator
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	23                      # Abbreviation Code
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	24                      # Abbreviation Code
	.byte	29                      # DW_TAG_inlined_subroutine
	.byte	1                       # DW_CHILDREN_yes
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	85                      # DW_AT_ranges
	.byte	23                      # DW_FORM_sec_offset
	.byte	88                      # DW_AT_call_file
	.byte	11                      # DW_FORM_data1
	.byte	89                      # DW_AT_call_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	25                      # Abbreviation Code
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	85                      # DW_AT_ranges
	.byte	23                      # DW_FORM_sec_offset
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	26                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	32                      # DW_AT_inline
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	27                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	28                      # Abbreviation Code
	.byte	29                      # DW_TAG_inlined_subroutine
	.byte	1                       # DW_CHILDREN_yes
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	88                      # DW_AT_call_file
	.byte	11                      # DW_FORM_data1
	.byte	89                      # DW_AT_call_line
	.byte	11                      # DW_FORM_data1
	.ascii	"\266B"                 # DW_AT_GNU_discriminator
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	29                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	15                      # DW_FORM_udata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	30                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	31                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	15                      # DW_FORM_udata
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	32                      # Abbreviation Code
	.byte	29                      # DW_TAG_inlined_subroutine
	.byte	1                       # DW_CHILDREN_yes
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	85                      # DW_AT_ranges
	.byte	23                      # DW_FORM_sec_offset
	.byte	88                      # DW_AT_call_file
	.byte	11                      # DW_FORM_data1
	.byte	89                      # DW_AT_call_line
	.byte	5                       # DW_FORM_data2
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	33                      # Abbreviation Code
	.byte	29                      # DW_TAG_inlined_subroutine
	.byte	0                       # DW_CHILDREN_no
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	88                      # DW_AT_call_file
	.byte	11                      # DW_FORM_data1
	.byte	89                      # DW_AT_call_line
	.byte	5                       # DW_FORM_data2
	.ascii	"\266B"                 # DW_AT_GNU_discriminator
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	34                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	35                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	36                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	37                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	38                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	15                      # DW_FORM_udata
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	39                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	40                      # Abbreviation Code
	.byte	29                      # DW_TAG_inlined_subroutine
	.byte	1                       # DW_CHILDREN_yes
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	88                      # DW_AT_call_file
	.byte	11                      # DW_FORM_data1
	.byte	89                      # DW_AT_call_line
	.byte	5                       # DW_FORM_data2
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	41                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	42                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	15                      # DW_FORM_udata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	43                      # Abbreviation Code
	.byte	29                      # DW_TAG_inlined_subroutine
	.byte	1                       # DW_CHILDREN_yes
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	88                      # DW_AT_call_file
	.byte	11                      # DW_FORM_data1
	.byte	89                      # DW_AT_call_line
	.byte	5                       # DW_FORM_data2
	.ascii	"\266B"                 # DW_AT_GNU_discriminator
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	3491                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0xd9c DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end11-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x1 DW_TAG_pointer_type
	.byte	3                       # Abbrev [3] 0x2b:0x26 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	81                      # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x3e:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	93                      # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x47:0x9 DW_TAG_variable
	.long	.Ldebug_loc1            # DW_AT_location
	.long	104                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	6                       # Abbrev [6] 0x51:0x23 DW_TAG_subprogram
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	116                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	7                       # Abbrev [7] 0x5d:0xb DW_TAG_formal_parameter
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	116                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x68:0xb DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	116                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0x74:0x5 DW_TAG_pointer_type
	.long	121                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x79:0xb DW_TAG_typedef
	.long	132                     # DW_AT_type
	.long	.Linfo_string7          # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.byte	11                      # Abbrev [11] 0x84:0x1d DW_TAG_structure_type
	.byte	16                      # DW_AT_byte_size
	.byte	2                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.byte	12                      # Abbrev [12] 0x88:0xc DW_TAG_member
	.long	.Linfo_string4          # DW_AT_name
	.long	161                     # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	12                      # Abbrev [12] 0x94:0xc DW_TAG_member
	.long	.Linfo_string6          # DW_AT_name
	.long	161                     # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	0                       # End Of Children Mark
	.byte	13                      # Abbrev [13] 0xa1:0x7 DW_TAG_base_type
	.long	.Linfo_string5          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	14                      # Abbrev [14] 0xa8:0x70 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	515                     # DW_AT_type
                                        # DW_AT_external
	.byte	15                      # Abbrev [15] 0xc1:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	515                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0xd0:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0xdf:0xb DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	515                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0xea:0x2d DW_TAG_lexical_block
	.quad	.Ltmp18                 # DW_AT_low_pc
	.long	.Ltmp24-.Ltmp18         # DW_AT_high_pc
	.byte	17                      # Abbrev [17] 0xf7:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.long	520                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x103:0x13 DW_TAG_inlined_subroutine
	.long	81                      # DW_AT_abstract_origin
	.quad	.Ltmp21                 # DW_AT_low_pc
	.long	.Ltmp22-.Ltmp21         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	11                      # DW_AT_call_line
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	3                       # Abbrev [3] 0x118:0x1b DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	673                     # DW_AT_abstract_origin
	.byte	19                      # Abbrev [19] 0x12b:0x7 DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	85
	.long	681                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	3                       # Abbrev [3] 0x133:0x1d DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	762                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x146:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc4            # DW_AT_location
	.long	770                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	3                       # Abbrev [3] 0x150:0x4a DW_TAG_subprogram
	.quad	.Lfunc_begin4           # DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin4 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	410                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x163:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc5            # DW_AT_location
	.long	422                     # DW_AT_abstract_origin
	.byte	20                      # Abbrev [20] 0x16c:0x5 DW_TAG_variable
	.long	433                     # DW_AT_abstract_origin
	.byte	16                      # Abbrev [16] 0x171:0x28 DW_TAG_lexical_block
	.quad	.Ltmp47                 # DW_AT_low_pc
	.long	.Ltmp53-.Ltmp47         # DW_AT_high_pc
	.byte	21                      # Abbrev [21] 0x17e:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	445                     # DW_AT_abstract_origin
	.byte	22                      # Abbrev [22] 0x184:0x14 DW_TAG_inlined_subroutine
	.long	81                      # DW_AT_abstract_origin
	.quad	.Ltmp50                 # DW_AT_low_pc
	.long	.Ltmp51-.Ltmp50         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	28                      # DW_AT_call_line
	.byte	3                       # DW_AT_GNU_discriminator
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	6                       # Abbrev [6] 0x19a:0x30 DW_TAG_subprogram
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	458                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	7                       # Abbrev [7] 0x1a6:0xb DW_TAG_formal_parameter
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	458                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x1b1:0xb DW_TAG_variable
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
	.long	458                     # DW_AT_type
	.byte	23                      # Abbrev [23] 0x1bc:0xd DW_TAG_lexical_block
	.byte	8                       # Abbrev [8] 0x1bd:0xb DW_TAG_variable
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	28                      # DW_AT_decl_line
	.long	520                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0x1ca:0x5 DW_TAG_pointer_type
	.long	463                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1cf:0xb DW_TAG_typedef
	.long	474                     # DW_AT_type
	.long	.Linfo_string14         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
	.byte	11                      # Abbrev [11] 0x1da:0x29 DW_TAG_structure_type
	.byte	24                      # DW_AT_byte_size
	.byte	2                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.byte	12                      # Abbrev [12] 0x1de:0xc DW_TAG_member
	.long	.Linfo_string11         # DW_AT_name
	.long	515                     # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	12                      # Abbrev [12] 0x1ea:0xc DW_TAG_member
	.long	.Linfo_string12         # DW_AT_name
	.long	161                     # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	12                      # Abbrev [12] 0x1f6:0xc DW_TAG_member
	.long	.Linfo_string13         # DW_AT_name
	.long	161                     # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.byte	16                      # DW_AT_data_member_location
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0x203:0x5 DW_TAG_pointer_type
	.long	116                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x208:0x7 DW_TAG_base_type
	.long	.Linfo_string18         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	14                      # Abbrev [14] 0x20f:0x92 DW_TAG_subprogram
	.quad	.Lfunc_begin5           # DW_AT_low_pc
	.long	.Lfunc_end5-.Lfunc_begin5 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	3462                    # DW_AT_type
                                        # DW_AT_external
	.byte	15                      # Abbrev [15] 0x228:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc6            # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
	.long	3462                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x237:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc7            # DW_AT_location
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x246:0xb DW_TAG_variable
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	33                      # DW_AT_decl_line
	.long	3462                    # DW_AT_type
	.byte	16                      # Abbrev [16] 0x251:0x4f DW_TAG_lexical_block
	.quad	.Ltmp73                 # DW_AT_low_pc
	.long	.Ltmp88-.Ltmp73         # DW_AT_high_pc
	.byte	17                      # Abbrev [17] 0x25e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	520                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x26a:0x35 DW_TAG_inlined_subroutine
	.long	410                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	35                      # DW_AT_call_line
	.byte	4                       # Abbrev [4] 0x275:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc8            # DW_AT_location
	.long	422                     # DW_AT_abstract_origin
	.byte	25                      # Abbrev [25] 0x27e:0x20 DW_TAG_lexical_block
	.long	.Ldebug_ranges1         # DW_AT_ranges
	.byte	21                      # Abbrev [21] 0x283:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	445                     # DW_AT_abstract_origin
	.byte	22                      # Abbrev [22] 0x289:0x14 DW_TAG_inlined_subroutine
	.long	81                      # DW_AT_abstract_origin
	.quad	.Ltmp81                 # DW_AT_low_pc
	.long	.Ltmp82-.Ltmp81         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	28                      # DW_AT_call_line
	.byte	3                       # DW_AT_GNU_discriminator
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	26                      # Abbrev [26] 0x2a1:0x14 DW_TAG_subprogram
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	7                       # Abbrev [7] 0x2a9:0xb DW_TAG_formal_parameter
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	116                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	3                       # Abbrev [3] 0x2b5:0x45 DW_TAG_subprogram
	.quad	.Lfunc_begin6           # DW_AT_low_pc
	.long	.Lfunc_end6-.Lfunc_begin6 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	2408                    # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x2c8:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc9            # DW_AT_location
	.long	2416                    # DW_AT_abstract_origin
	.byte	16                      # Abbrev [16] 0x2d1:0x28 DW_TAG_lexical_block
	.quad	.Ltmp95                 # DW_AT_low_pc
	.long	.Ltmp101-.Ltmp95        # DW_AT_high_pc
	.byte	21                      # Abbrev [21] 0x2de:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	2428                    # DW_AT_abstract_origin
	.byte	22                      # Abbrev [22] 0x2e4:0x14 DW_TAG_inlined_subroutine
	.long	673                     # DW_AT_abstract_origin
	.quad	.Ltmp98                 # DW_AT_low_pc
	.long	.Ltmp99-.Ltmp98         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	40                      # DW_AT_call_line
	.byte	3                       # DW_AT_GNU_discriminator
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	26                      # Abbrev [26] 0x2fa:0x14 DW_TAG_subprogram
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	7                       # Abbrev [7] 0x302:0xb DW_TAG_formal_parameter
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
	.long	116                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	27                      # Abbrev [27] 0x30e:0x5d DW_TAG_subprogram
	.quad	.Lfunc_begin7           # DW_AT_low_pc
	.long	.Lfunc_end7-.Lfunc_begin7 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	43                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	15                      # Abbrev [15] 0x323:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	43                      # DW_AT_decl_line
	.long	458                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x332:0x38 DW_TAG_lexical_block
	.quad	.Ltmp111                # DW_AT_low_pc
	.long	.Ltmp116-.Ltmp111       # DW_AT_high_pc
	.byte	17                      # Abbrev [17] 0x33f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	46                      # DW_AT_decl_line
	.long	520                     # DW_AT_type
	.byte	28                      # Abbrev [28] 0x34b:0x1e DW_TAG_inlined_subroutine
	.long	762                     # DW_AT_abstract_origin
	.quad	.Ltmp114                # DW_AT_low_pc
	.long	.Ltmp115-.Ltmp114       # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	46                      # DW_AT_call_line
	.byte	3                       # DW_AT_GNU_discriminator
	.byte	4                       # Abbrev [4] 0x35f:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc11           # DW_AT_location
	.long	770                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	3                       # Abbrev [3] 0x36b:0x55 DW_TAG_subprogram
	.quad	.Lfunc_begin8           # DW_AT_low_pc
	.long	.Lfunc_end8-.Lfunc_begin8 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	2294                    # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x37e:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc12           # DW_AT_location
	.long	2306                    # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x387:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc13           # DW_AT_location
	.long	2317                    # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x390:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc14           # DW_AT_location
	.long	2328                    # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x399:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc15           # DW_AT_location
	.long	2339                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x3a2:0x9 DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	2361                    # DW_AT_abstract_origin
	.byte	29                      # Abbrev [29] 0x3ab:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	2350                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x3b1:0x9 DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	2372                    # DW_AT_abstract_origin
	.byte	20                      # Abbrev [20] 0x3ba:0x5 DW_TAG_variable
	.long	2383                    # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	3                       # Abbrev [3] 0x3c0:0xde DW_TAG_subprogram
	.quad	.Lfunc_begin9           # DW_AT_low_pc
	.long	.Lfunc_end9-.Lfunc_begin9 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	1182                    # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x3d3:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc18           # DW_AT_location
	.long	1194                    # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x3dc:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc19           # DW_AT_location
	.long	1205                    # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x3e5:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc20           # DW_AT_location
	.long	1216                    # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x3ee:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc21           # DW_AT_location
	.long	1227                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x3f7:0x9 DW_TAG_variable
	.long	.Ldebug_loc22           # DW_AT_location
	.long	1337                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x400:0x9 DW_TAG_variable
	.long	.Ldebug_loc23           # DW_AT_location
	.long	1326                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x409:0x9 DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	1315                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x412:0x9 DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	1304                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x41b:0x9 DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	1293                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x424:0x9 DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	1282                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x42d:0x9 DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	1271                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x436:0x9 DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	1260                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x43f:0x9 DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	1249                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x448:0x9 DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	1238                    # DW_AT_abstract_origin
	.byte	21                      # Abbrev [21] 0x451:0x6 DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	1359                    # DW_AT_abstract_origin
	.byte	20                      # Abbrev [20] 0x457:0x5 DW_TAG_variable
	.long	1348                    # DW_AT_abstract_origin
	.byte	20                      # Abbrev [20] 0x45c:0x5 DW_TAG_variable
	.long	1370                    # DW_AT_abstract_origin
	.byte	28                      # Abbrev [28] 0x461:0x1e DW_TAG_inlined_subroutine
	.long	673                     # DW_AT_abstract_origin
	.quad	.Ltmp148                # DW_AT_low_pc
	.long	.Ltmp150-.Ltmp148       # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	130                     # DW_AT_call_line
	.byte	1                       # DW_AT_GNU_discriminator
	.byte	4                       # Abbrev [4] 0x475:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc32           # DW_AT_location
	.long	681                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	28                      # Abbrev [28] 0x47f:0x1e DW_TAG_inlined_subroutine
	.long	673                     # DW_AT_abstract_origin
	.quad	.Ltmp152                # DW_AT_low_pc
	.long	.Ltmp154-.Ltmp152       # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	101                     # DW_AT_call_line
	.byte	1                       # DW_AT_GNU_discriminator
	.byte	4                       # Abbrev [4] 0x493:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc33           # DW_AT_location
	.long	681                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	6                       # Abbrev [6] 0x49e:0xc8 DW_TAG_subprogram
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	161                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	7                       # Abbrev [7] 0x4aa:0xb DW_TAG_formal_parameter
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.long	116                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x4b5:0xb DW_TAG_formal_parameter
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x4c0:0xb DW_TAG_formal_parameter
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x4cb:0xb DW_TAG_formal_parameter
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x4d6:0xb DW_TAG_variable
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	82                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x4e1:0xb DW_TAG_variable
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	81                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x4ec:0xb DW_TAG_variable
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	80                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x4f7:0xb DW_TAG_variable
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	79                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x502:0xb DW_TAG_variable
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	77                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x50d:0xb DW_TAG_variable
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	76                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x518:0xb DW_TAG_variable
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	75                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x523:0xb DW_TAG_variable
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	74                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x52e:0xb DW_TAG_variable
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	73                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x539:0xb DW_TAG_variable
	.long	.Linfo_string4          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	72                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x544:0xb DW_TAG_variable
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	71                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x54f:0xb DW_TAG_variable
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	78                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x55a:0xb DW_TAG_variable
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	83                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	13                      # Abbrev [13] 0x566:0x7 DW_TAG_base_type
	.long	.Linfo_string25         # DW_AT_name
	.byte	2                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	14                      # Abbrev [14] 0x56d:0x389 DW_TAG_subprogram
	.quad	.Lfunc_begin10          # DW_AT_low_pc
	.long	.Lfunc_end10-.Lfunc_begin10 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	135                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	458                     # DW_AT_type
                                        # DW_AT_external
	.byte	15                      # Abbrev [15] 0x586:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc34           # DW_AT_location
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	135                     # DW_AT_decl_line
	.long	458                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x595:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc35           # DW_AT_location
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	135                     # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x5a4:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc36           # DW_AT_location
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	135                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x5b3:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc37           # DW_AT_location
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	135                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x5c2:0xf DW_TAG_variable
	.long	.Ldebug_loc38           # DW_AT_location
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	165                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x5d1:0xf DW_TAG_variable
	.long	.Ldebug_loc39           # DW_AT_location
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	185                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x5e0:0xf DW_TAG_variable
	.long	.Ldebug_loc40           # DW_AT_location
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	184                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x5ef:0xf DW_TAG_variable
	.long	.Ldebug_loc41           # DW_AT_location
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	183                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x5fe:0xf DW_TAG_variable
	.long	.Ldebug_loc42           # DW_AT_location
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	182                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x60d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	181                     # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	30                      # Abbrev [30] 0x619:0xf DW_TAG_variable
	.long	.Ldebug_loc43           # DW_AT_location
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	179                     # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	30                      # Abbrev [30] 0x628:0xf DW_TAG_variable
	.long	.Ldebug_loc44           # DW_AT_location
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	176                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x637:0xf DW_TAG_variable
	.long	.Ldebug_loc45           # DW_AT_location
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	175                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x646:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	170                     # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	31                      # Abbrev [31] 0x652:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	168                     # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	17                      # Abbrev [17] 0x65e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	167                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x66a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string66         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	164                     # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	17                      # Abbrev [17] 0x676:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	163                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x682:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	161                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x68e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	160                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x69a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	159                     # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	17                      # Abbrev [17] 0x6a6:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	158                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x6b2:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	156                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x6be:0xf DW_TAG_variable
	.long	.Ldebug_loc46           # DW_AT_location
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	154                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x6cd:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	153                     # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	30                      # Abbrev [30] 0x6d9:0xf DW_TAG_variable
	.long	.Ldebug_loc47           # DW_AT_location
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	152                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x6e8:0xf DW_TAG_variable
	.long	.Ldebug_loc48           # DW_AT_location
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	150                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x6f7:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string75         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	149                     # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	30                      # Abbrev [30] 0x703:0xf DW_TAG_variable
	.long	.Ldebug_loc49           # DW_AT_location
	.long	.Linfo_string76         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	148                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x712:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	146                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x71e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	145                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x72a:0xf DW_TAG_variable
	.long	.Ldebug_loc50           # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	144                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x739:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	143                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x745:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	142                     # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	30                      # Abbrev [30] 0x751:0xf DW_TAG_variable
	.long	.Ldebug_loc51           # DW_AT_location
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	140                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x760:0xf DW_TAG_variable
	.long	.Ldebug_loc52           # DW_AT_location
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	138                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x76f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	137                     # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	17                      # Abbrev [17] 0x77b:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string77         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	171                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x787:0xf DW_TAG_variable
	.long	.Ldebug_loc54           # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	166                     # DW_AT_decl_line
	.long	515                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x796:0xf DW_TAG_variable
	.long	.Ldebug_loc66           # DW_AT_location
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	169                     # DW_AT_decl_line
	.long	116                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x7a5:0xf DW_TAG_variable
	.long	.Ldebug_loc67           # DW_AT_location
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	141                     # DW_AT_decl_line
	.long	116                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x7b4:0xf DW_TAG_variable
	.long	.Ldebug_loc69           # DW_AT_location
	.long	.Linfo_string80         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	172                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x7c3:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string81         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	174                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x7cf:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string82         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	173                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x7db:0xf DW_TAG_variable
	.long	.Ldebug_loc70           # DW_AT_location
	.long	.Linfo_string83         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	139                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x7ea:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string84         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	177                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x7f6:0xf DW_TAG_variable
	.long	.Ldebug_loc71           # DW_AT_location
	.long	.Linfo_string85         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	180                     # DW_AT_decl_line
	.long	458                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x805:0xb DW_TAG_variable
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	136                     # DW_AT_decl_line
	.long	458                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x810:0xb DW_TAG_variable
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	147                     # DW_AT_decl_line
	.long	515                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x81b:0xb DW_TAG_variable
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	151                     # DW_AT_decl_line
	.long	515                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x826:0xb DW_TAG_variable
	.long	.Linfo_string86         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	155                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x831:0xb DW_TAG_variable
	.long	.Linfo_string87         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	157                     # DW_AT_decl_line
	.long	515                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x83c:0xb DW_TAG_variable
	.long	.Linfo_string88         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	162                     # DW_AT_decl_line
	.long	515                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x847:0xb DW_TAG_variable
	.long	.Linfo_string89         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	178                     # DW_AT_decl_line
	.long	116                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x852:0x8e DW_TAG_inlined_subroutine
	.long	1182                    # DW_AT_abstract_origin
	.long	.Ldebug_ranges2         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.short	302                     # DW_AT_call_line
	.byte	4                       # Abbrev [4] 0x85e:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc65           # DW_AT_location
	.long	1194                    # DW_AT_abstract_origin
	.byte	19                      # Abbrev [19] 0x867:0xc DW_TAG_formal_parameter
	.byte	6                       # DW_AT_location
	.byte	16
	.byte	0
	.byte	159
	.byte	157
	.byte	1
	.byte	0
	.long	1205                    # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x873:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc68           # DW_AT_location
	.long	1216                    # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x87c:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc53           # DW_AT_location
	.long	1227                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x885:0x9 DW_TAG_variable
	.long	.Ldebug_loc55           # DW_AT_location
	.long	1238                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x88e:0x9 DW_TAG_variable
	.long	.Ldebug_loc56           # DW_AT_location
	.long	1249                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x897:0x9 DW_TAG_variable
	.long	.Ldebug_loc57           # DW_AT_location
	.long	1260                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x8a0:0x9 DW_TAG_variable
	.long	.Ldebug_loc58           # DW_AT_location
	.long	1271                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x8a9:0x9 DW_TAG_variable
	.long	.Ldebug_loc59           # DW_AT_location
	.long	1282                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x8b2:0x9 DW_TAG_variable
	.long	.Ldebug_loc60           # DW_AT_location
	.long	1293                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x8bb:0x9 DW_TAG_variable
	.long	.Ldebug_loc61           # DW_AT_location
	.long	1304                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x8c4:0x9 DW_TAG_variable
	.long	.Ldebug_loc62           # DW_AT_location
	.long	1315                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x8cd:0x9 DW_TAG_variable
	.long	.Ldebug_loc63           # DW_AT_location
	.long	1326                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x8d6:0x9 DW_TAG_variable
	.long	.Ldebug_loc64           # DW_AT_location
	.long	1337                    # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	33                      # Abbrev [33] 0x8e0:0x15 DW_TAG_inlined_subroutine
	.long	673                     # DW_AT_abstract_origin
	.quad	.Ltmp210                # DW_AT_low_pc
	.long	.Ltmp211-.Ltmp210       # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.short	347                     # DW_AT_call_line
	.byte	1                       # DW_AT_GNU_discriminator
	.byte	0                       # End Of Children Mark
	.byte	6                       # Abbrev [6] 0x8f6:0x72 DW_TAG_subprogram
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	458                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	7                       # Abbrev [7] 0x902:0xb DW_TAG_formal_parameter
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x90d:0xb DW_TAG_formal_parameter
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	515                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x918:0xb DW_TAG_formal_parameter
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x923:0xb DW_TAG_formal_parameter
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	8                       # Abbrev [8] 0x92e:0xb DW_TAG_variable
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	53                      # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	8                       # Abbrev [8] 0x939:0xb DW_TAG_variable
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	55                      # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	8                       # Abbrev [8] 0x944:0xb DW_TAG_variable
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	54                      # DW_AT_decl_line
	.long	458                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x94f:0xb DW_TAG_variable
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	52                      # DW_AT_decl_line
	.long	458                     # DW_AT_type
	.byte	23                      # Abbrev [23] 0x95a:0xd DW_TAG_lexical_block
	.byte	8                       # Abbrev [8] 0x95b:0xb DW_TAG_variable
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	520                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	26                      # Abbrev [26] 0x968:0x21 DW_TAG_subprogram
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	39                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	7                       # Abbrev [7] 0x970:0xb DW_TAG_formal_parameter
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	39                      # DW_AT_decl_line
	.long	458                     # DW_AT_type
	.byte	23                      # Abbrev [23] 0x97b:0xd DW_TAG_lexical_block
	.byte	8                       # Abbrev [8] 0x97c:0xb DW_TAG_variable
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	40                      # DW_AT_decl_line
	.long	520                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	34                      # Abbrev [34] 0x989:0x3fd DW_TAG_subprogram
	.quad	.Lfunc_begin11          # DW_AT_low_pc
	.long	.Lfunc_end11-.Lfunc_begin11 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	393                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	520                     # DW_AT_type
                                        # DW_AT_external
	.byte	35                      # Abbrev [35] 0x9a3:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc72           # DW_AT_location
	.long	.Linfo_string90         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	393                     # DW_AT_decl_line
	.long	520                     # DW_AT_type
	.byte	35                      # Abbrev [35] 0x9b3:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc73           # DW_AT_location
	.long	.Linfo_string91         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	393                     # DW_AT_decl_line
	.long	3467                    # DW_AT_type
	.byte	36                      # Abbrev [36] 0x9c3:0x10 DW_TAG_variable
	.long	.Ldebug_loc74           # DW_AT_location
	.long	.Linfo_string93         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	395                     # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	36                      # Abbrev [36] 0x9d3:0x10 DW_TAG_variable
	.long	.Ldebug_loc75           # DW_AT_location
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	396                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	36                      # Abbrev [36] 0x9e3:0x10 DW_TAG_variable
	.long	.Ldebug_loc76           # DW_AT_location
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	398                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	36                      # Abbrev [36] 0x9f3:0x10 DW_TAG_variable
	.long	.Ldebug_loc77           # DW_AT_location
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	399                     # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	37                      # Abbrev [37] 0xa03:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	400                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	36                      # Abbrev [36] 0xa10:0x10 DW_TAG_variable
	.long	.Ldebug_loc78           # DW_AT_location
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	402                     # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	38                      # Abbrev [38] 0xa20:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string94         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	404                     # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	37                      # Abbrev [37] 0xa2d:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string95         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	405                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	37                      # Abbrev [37] 0xa3a:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string96         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	405                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	38                      # Abbrev [38] 0xa47:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string97         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	406                     # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	37                      # Abbrev [37] 0xa54:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	407                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	37                      # Abbrev [37] 0xa61:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string98         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	408                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	38                      # Abbrev [38] 0xa6e:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string99         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	409                     # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	37                      # Abbrev [37] 0xa7b:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	410                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	37                      # Abbrev [37] 0xa88:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	411                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	36                      # Abbrev [36] 0xa95:0x10 DW_TAG_variable
	.long	.Ldebug_loc79           # DW_AT_location
	.long	.Linfo_string75         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	413                     # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	36                      # Abbrev [36] 0xaa5:0x10 DW_TAG_variable
	.long	.Ldebug_loc80           # DW_AT_location
	.long	.Linfo_string100        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	415                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	36                      # Abbrev [36] 0xab5:0x10 DW_TAG_variable
	.long	.Ldebug_loc81           # DW_AT_location
	.long	.Linfo_string101        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	416                     # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	37                      # Abbrev [37] 0xac5:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	417                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	38                      # Abbrev [38] 0xad2:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string102        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	419                     # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	38                      # Abbrev [38] 0xadf:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string103        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	421                     # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	37                      # Abbrev [37] 0xaec:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	422                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	36                      # Abbrev [36] 0xaf9:0x10 DW_TAG_variable
	.long	.Ldebug_loc82           # DW_AT_location
	.long	.Linfo_string104        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	424                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	36                      # Abbrev [36] 0xb09:0x10 DW_TAG_variable
	.long	.Ldebug_loc83           # DW_AT_location
	.long	.Linfo_string105        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	425                     # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	36                      # Abbrev [36] 0xb19:0x10 DW_TAG_variable
	.long	.Ldebug_loc84           # DW_AT_location
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	427                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	36                      # Abbrev [36] 0xb29:0x10 DW_TAG_variable
	.long	.Ldebug_loc85           # DW_AT_location
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	428                     # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	36                      # Abbrev [36] 0xb39:0x10 DW_TAG_variable
	.long	.Ldebug_loc86           # DW_AT_location
	.long	.Linfo_string106        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	431                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	36                      # Abbrev [36] 0xb49:0x10 DW_TAG_variable
	.long	.Ldebug_loc87           # DW_AT_location
	.long	.Linfo_string107        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	432                     # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	36                      # Abbrev [36] 0xb59:0x10 DW_TAG_variable
	.long	.Ldebug_loc88           # DW_AT_location
	.long	.Linfo_string84         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	434                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	36                      # Abbrev [36] 0xb69:0x10 DW_TAG_variable
	.long	.Ldebug_loc89           # DW_AT_location
	.long	.Linfo_string108        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	436                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	36                      # Abbrev [36] 0xb79:0x10 DW_TAG_variable
	.long	.Ldebug_loc90           # DW_AT_location
	.long	.Linfo_string109        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	437                     # DW_AT_decl_line
	.long	1382                    # DW_AT_type
	.byte	36                      # Abbrev [36] 0xb89:0x10 DW_TAG_variable
	.long	.Ldebug_loc91           # DW_AT_location
	.long	.Linfo_string110        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	405                     # DW_AT_decl_line
	.long	3484                    # DW_AT_type
	.byte	36                      # Abbrev [36] 0xb99:0x10 DW_TAG_variable
	.long	.Ldebug_loc92           # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	408                     # DW_AT_decl_line
	.long	3489                    # DW_AT_type
	.byte	36                      # Abbrev [36] 0xba9:0x10 DW_TAG_variable
	.long	.Ldebug_loc93           # DW_AT_location
	.long	.Linfo_string111        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	394                     # DW_AT_decl_line
	.long	3489                    # DW_AT_type
	.byte	36                      # Abbrev [36] 0xbb9:0x10 DW_TAG_variable
	.long	.Ldebug_loc94           # DW_AT_location
	.long	.Linfo_string112        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	403                     # DW_AT_decl_line
	.long	3489                    # DW_AT_type
	.byte	36                      # Abbrev [36] 0xbc9:0x10 DW_TAG_variable
	.long	.Ldebug_loc98           # DW_AT_location
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	418                     # DW_AT_decl_line
	.long	458                     # DW_AT_type
	.byte	36                      # Abbrev [36] 0xbd9:0x10 DW_TAG_variable
	.long	.Ldebug_loc99           # DW_AT_location
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	401                     # DW_AT_decl_line
	.long	458                     # DW_AT_type
	.byte	36                      # Abbrev [36] 0xbe9:0x10 DW_TAG_variable
	.long	.Ldebug_loc100          # DW_AT_location
	.long	.Linfo_string86         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	420                     # DW_AT_decl_line
	.long	458                     # DW_AT_type
	.byte	36                      # Abbrev [36] 0xbf9:0x10 DW_TAG_variable
	.long	.Ldebug_loc101          # DW_AT_location
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	424                     # DW_AT_decl_line
	.long	3489                    # DW_AT_type
	.byte	36                      # Abbrev [36] 0xc09:0x10 DW_TAG_variable
	.long	.Ldebug_loc102          # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	427                     # DW_AT_decl_line
	.long	3489                    # DW_AT_type
	.byte	36                      # Abbrev [36] 0xc19:0x10 DW_TAG_variable
	.long	.Ldebug_loc103          # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	431                     # DW_AT_decl_line
	.long	3489                    # DW_AT_type
	.byte	36                      # Abbrev [36] 0xc29:0x10 DW_TAG_variable
	.long	.Ldebug_loc104          # DW_AT_location
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	436                     # DW_AT_decl_line
	.long	3489                    # DW_AT_type
	.byte	39                      # Abbrev [39] 0xc39:0xc DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	397                     # DW_AT_decl_line
	.long	515                     # DW_AT_type
	.byte	39                      # Abbrev [39] 0xc45:0xc DW_TAG_variable
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	412                     # DW_AT_decl_line
	.long	116                     # DW_AT_type
	.byte	39                      # Abbrev [39] 0xc51:0xc DW_TAG_variable
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	414                     # DW_AT_decl_line
	.long	515                     # DW_AT_type
	.byte	39                      # Abbrev [39] 0xc5d:0xc DW_TAG_variable
	.long	.Linfo_string87         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	423                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	39                      # Abbrev [39] 0xc69:0xc DW_TAG_variable
	.long	.Linfo_string88         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	426                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	39                      # Abbrev [39] 0xc75:0xc DW_TAG_variable
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	429                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	39                      # Abbrev [39] 0xc81:0xc DW_TAG_variable
	.long	.Linfo_string80         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	430                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	39                      # Abbrev [39] 0xc8d:0xc DW_TAG_variable
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	433                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	39                      # Abbrev [39] 0xc99:0xc DW_TAG_variable
	.long	.Linfo_string89         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	435                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	16                      # Abbrev [16] 0xca5:0x30 DW_TAG_lexical_block
	.quad	.Ltmp242                # DW_AT_low_pc
	.long	.Ltmp247-.Ltmp242       # DW_AT_high_pc
	.byte	37                      # Abbrev [37] 0xcb2:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	469                     # DW_AT_decl_line
	.long	520                     # DW_AT_type
	.byte	33                      # Abbrev [33] 0xcbf:0x15 DW_TAG_inlined_subroutine
	.long	81                      # DW_AT_abstract_origin
	.quad	.Ltmp244                # DW_AT_low_pc
	.long	.Ltmp245-.Ltmp244       # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.short	469                     # DW_AT_call_line
	.byte	3                       # DW_AT_GNU_discriminator
	.byte	0                       # End Of Children Mark
	.byte	16                      # Abbrev [16] 0xcd5:0x30 DW_TAG_lexical_block
	.quad	.Ltmp249                # DW_AT_low_pc
	.long	.Ltmp253-.Ltmp249       # DW_AT_high_pc
	.byte	37                      # Abbrev [37] 0xce2:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	473                     # DW_AT_decl_line
	.long	520                     # DW_AT_type
	.byte	33                      # Abbrev [33] 0xcef:0x15 DW_TAG_inlined_subroutine
	.long	81                      # DW_AT_abstract_origin
	.quad	.Ltmp250                # DW_AT_low_pc
	.long	.Ltmp251-.Ltmp250       # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.short	473                     # DW_AT_call_line
	.byte	3                       # DW_AT_GNU_discriminator
	.byte	0                       # End Of Children Mark
	.byte	40                      # Abbrev [40] 0xd05:0x42 DW_TAG_inlined_subroutine
	.long	2294                    # DW_AT_abstract_origin
	.quad	.Ltmp254                # DW_AT_low_pc
	.long	.Ltmp256-.Ltmp254       # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.short	481                     # DW_AT_call_line
	.byte	41                      # Abbrev [41] 0xd19:0x6 DW_TAG_formal_parameter
	.byte	0                       # DW_AT_const_value
	.long	2306                    # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0xd1f:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc95           # DW_AT_location
	.long	2328                    # DW_AT_abstract_origin
	.byte	42                      # Abbrev [42] 0xd28:0x6 DW_TAG_formal_parameter
	.byte	0                       # DW_AT_const_value
	.long	2339                    # DW_AT_abstract_origin
	.byte	29                      # Abbrev [29] 0xd2e:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	2350                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0xd34:0x9 DW_TAG_variable
	.long	.Ldebug_loc96           # DW_AT_location
	.long	2361                    # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0xd3d:0x9 DW_TAG_variable
	.long	.Ldebug_loc97           # DW_AT_location
	.long	2372                    # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	43                      # Abbrev [43] 0xd47:0x3e DW_TAG_inlined_subroutine
	.long	2408                    # DW_AT_abstract_origin
	.quad	.Ltmp272                # DW_AT_low_pc
	.long	.Ltmp280-.Ltmp272       # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.short	550                     # DW_AT_call_line
	.byte	1                       # DW_AT_GNU_discriminator
	.byte	16                      # Abbrev [16] 0xd5c:0x28 DW_TAG_lexical_block
	.quad	.Ltmp272                # DW_AT_low_pc
	.long	.Ltmp278-.Ltmp272       # DW_AT_high_pc
	.byte	21                      # Abbrev [21] 0xd69:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	2428                    # DW_AT_abstract_origin
	.byte	22                      # Abbrev [22] 0xd6f:0x14 DW_TAG_inlined_subroutine
	.long	673                     # DW_AT_abstract_origin
	.quad	.Ltmp275                # DW_AT_low_pc
	.long	.Ltmp276-.Ltmp275       # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	40                      # DW_AT_call_line
	.byte	3                       # DW_AT_GNU_discriminator
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0xd86:0x5 DW_TAG_pointer_type
	.long	458                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0xd8b:0x5 DW_TAG_pointer_type
	.long	3472                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0xd90:0x5 DW_TAG_pointer_type
	.long	3477                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0xd95:0x7 DW_TAG_base_type
	.long	.Linfo_string92         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	9                       # Abbrev [9] 0xd9c:0x5 DW_TAG_pointer_type
	.long	3489                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0xda1:0x5 DW_TAG_pointer_type
	.long	161                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	0
	.quad	0
.Ldebug_ranges1:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	0
	.quad	0
.Ldebug_ranges2:
	.quad	.Ltmp187-.Lfunc_begin0
	.quad	.Ltmp192-.Lfunc_begin0
	.quad	.Ltmp194-.Lfunc_begin0
	.quad	.Ltmp199-.Lfunc_begin0
	.quad	0
	.quad	0
	.section	.debug_macinfo,"",@progbits
.Ldebug_macinfo:
.Lcu_macro_begin0:
	.byte	0                       # End Of Macro List Mark
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end0-.LpubNames_begin0 # Length of Public Names Info
.LpubNames_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	3495                    # Compilation Unit Length
	.long	1182                    # DIE offset
	.asciz	"conflict"              # External Name
	.long	673                     # DIE offset
	.asciz	"free_POS"              # External Name
	.long	762                     # DIE offset
	.asciz	"printf_POS"            # External Name
	.long	527                     # DIE offset
	.asciz	"copy_array_NQueen"     # External Name
	.long	410                     # DIE offset
	.asciz	"copy_NQueen"           # External Name
	.long	1389                    # DIE offset
	.asciz	"run"                   # External Name
	.long	168                     # DIE offset
	.asciz	"copy_array_POS"        # External Name
	.long	2441                    # DIE offset
	.asciz	"main"                  # External Name
	.long	81                      # DIE offset
	.asciz	"copy_POS"              # External Name
	.long	2294                    # DIE offset
	.asciz	"nqueen"                # External Name
	.long	2408                    # DIE offset
	.asciz	"free_NQueen"           # External Name
	.long	782                     # DIE offset
	.asciz	"printf_NQueen"         # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	3495                    # Compilation Unit Length
	.long	1382                    # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	121                     # DIE offset
	.asciz	"POS"                   # External Name
	.long	161                     # DIE offset
	.asciz	"long long int"         # External Name
	.long	463                     # DIE offset
	.asciz	"NQueen"                # External Name
	.long	520                     # DIE offset
	.asciz	"int"                   # External Name
	.long	3477                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git f82fb5beb88e841f7a00cfb2a2ceabe46bcb2a9b) (http://llvm.org/git/llvm.git bafbf2b643f118fd2ea402ed6cd204281c7e9e94)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
