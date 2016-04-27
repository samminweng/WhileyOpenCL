	.text
	.file	"llvm/NQueens.polly.enablevc.ll"
	.globl	copy_POS
	.p2align	4, 0x90
	.type	copy_POS,@function
copy_POS:                               # @copy_POS
.Lfunc_begin0:
	.file	1 "NQueens.c"
	.loc	1 2 0                   # NQueens.c:2:0
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
	.loc	1 3 17 prologue_end discriminator 1 # NQueens.c:3:17
	movl	$16, %edi
	callq	malloc
.Ltmp3:
	#DEBUG_VALUE: copy_POS:new_POS <- %RAX
	.loc	1 4 21                  # NQueens.c:4:21
	movups	(%rbx), %xmm0
	.loc	1 4 13 is_stmt 0        # NQueens.c:4:13
	movups	%xmm0, (%rax)
	.loc	1 6 2 is_stmt 1         # NQueens.c:6:2
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
	.loc	1 8 0                   # NQueens.c:8:0
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
	.loc	1 9 34 prologue_end     # NQueens.c:9:34
	leaq	(,%r14,8), %rdi
	.loc	1 9 18 is_stmt 0 discriminator 1 # NQueens.c:9:18
	callq	malloc
	movq	%rax, %r15
.Ltmp18:
	#DEBUG_VALUE: i <- 0
	.loc	1 10 2 is_stmt 1 discriminator 1 # NQueens.c:10:2
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
	.loc	1 11 25                 # NQueens.c:11:25
	movq	(%r12), %r13
.Ltmp21:
	.loc	1 3 17 discriminator 1  # NQueens.c:3:17
	movl	$16, %edi
	callq	malloc
	.loc	1 4 21                  # NQueens.c:4:21
	movups	(%r13), %xmm0
	.loc	1 4 13 is_stmt 0        # NQueens.c:4:13
	movups	%xmm0, (%rax)
.Ltmp22:
	.loc	1 11 14 is_stmt 1       # NQueens.c:11:14
	movq	%rax, (%rbx)
.Ltmp23:
	.loc	1 10 2 discriminator 1  # NQueens.c:10:2
	addq	$8, %rbx
	addq	$8, %r12
	decq	%r14
	jne	.LBB1_2
.Ltmp24:
.LBB1_3:                                # %for.cond.cleanup
	.loc	1 13 2                  # NQueens.c:13:2
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
	.file	2 "./NQueens.h"

	.globl	free_POS
	.p2align	4, 0x90
	.type	free_POS,@function
free_POS:                               # @free_POS
.Lfunc_begin2:
	.loc	1 15 0                  # NQueens.c:15:0
	.cfi_startproc
# BB#0:                                 # %entry
	#DEBUG_VALUE: free_POS:pos <- %RDI
	.loc	1 16 2 prologue_end     # NQueens.c:16:2
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
	.loc	1 18 0                  # NQueens.c:18:0
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
	.loc	1 19 2 prologue_end     # NQueens.c:19:2
	movl	$123, %edi
	callq	putchar
	.loc	1 20 2                  # NQueens.c:20:2
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 21 22                 # NQueens.c:21:22
	movq	(%rbx), %rsi
	.loc	1 21 2 is_stmt 0        # NQueens.c:21:2
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 22 2 is_stmt 1        # NQueens.c:22:2
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 23 22                 # NQueens.c:23:22
	movq	8(%rbx), %rsi
	.loc	1 23 2 is_stmt 0        # NQueens.c:23:2
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 24 2 is_stmt 1        # NQueens.c:24:2
	movl	$125, %edi
	popq	%rbx
.Ltmp30:
	jmp	putchar                 # TAILCALL
.Ltmp31:
.Lfunc_end3:
	.size	printf_POS, .Lfunc_end3-printf_POS
	.cfi_endproc

	.globl	conflict
	.p2align	4, 0x90
	.type	conflict,@function
conflict:                               # @conflict
.Lfunc_begin4:
	.loc	1 26 0                  # NQueens.c:26:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 41 10 prologue_end    # NQueens.c:41:10
	pushq	%rbx
.Ltmp32:
	.cfi_def_cfa_offset 16
.Ltmp33:
	.cfi_offset %rbx, -16
	#DEBUG_VALUE: conflict:p <- %RDI
	#DEBUG_VALUE: conflict:p_has_ownership [bit_piece offset=0 size=1] <- %ESI
.Ltmp34:
	#DEBUG_VALUE: conflict:p_has_ownership [bit_piece offset=0 size=1] <- %SIL
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
.Ltmp35:
	#DEBUG_VALUE: conflict:_8 <- %RAX
	#DEBUG_VALUE: conflict:r <- %RAX
	.loc	1 49 6                  # NQueens.c:49:6
	subq	%rdx, %rax
.Ltmp36:
	je	.LBB4_2
.Ltmp37:
# BB#1:                                 # %entry
	#DEBUG_VALUE: conflict:col <- %RCX
	#DEBUG_VALUE: conflict:row <- %RDX
	#DEBUG_VALUE: conflict:p_has_ownership [bit_piece offset=0 size=1] <- %SIL
	#DEBUG_VALUE: conflict:p <- %RDI
	.loc	1 45 10                 # NQueens.c:45:10
	movq	8(%rdi), %rdx
.Ltmp38:
	#DEBUG_VALUE: conflict:_9 <- %RDX
	#DEBUG_VALUE: conflict:c <- %RDX
	subq	%rcx, %rdx
.Ltmp39:
	je	.LBB4_2
.Ltmp40:
# BB#4:                                 # %blklab0
	#DEBUG_VALUE: conflict:p <- %RDI
	#DEBUG_VALUE: conflict:p_has_ownership [bit_piece offset=0 size=1] <- %SIL
	#DEBUG_VALUE: conflict:col <- %RCX
	#DEBUG_VALUE: conflict:_12 <- %RDX
	.loc	1 62 7                  # NQueens.c:62:7
	movq	%rdx, %rcx
.Ltmp41:
	negq	%rcx
	cmovlq	%rdx, %rcx
.Ltmp42:
	#DEBUG_VALUE: conflict:_14 <- %RAX
	#DEBUG_VALUE: conflict:_11 <- %RCX
	#DEBUG_VALUE: conflict:colDiff <- %RCX
	.loc	1 68 7                  # NQueens.c:68:7
	movq	%rax, %rdx
.Ltmp43:
	negq	%rdx
	cmovlq	%rax, %rdx
.Ltmp44:
	#DEBUG_VALUE: conflict:_13 <- %RDX
	#DEBUG_VALUE: conflict:rowDiff <- %RDX
	.loc	1 74 12                 # NQueens.c:74:12
	cmpq	%rdx, %rcx
	sete	%al
.Ltmp45:
	.loc	1 82 2                  # NQueens.c:82:2
	movzbl	%al, %ebx
	.loc	1 86 2                  # NQueens.c:86:2
	testb	%sil, %sil
	je	.LBB4_6
.Ltmp46:
# BB#5:                                 # %if.then14
	#DEBUG_VALUE: conflict:p_has_ownership [bit_piece offset=0 size=1] <- %SIL
	#DEBUG_VALUE: conflict:p <- %RDI
	#DEBUG_VALUE: conflict:rowDiff <- %RDX
	#DEBUG_VALUE: conflict:_13 <- %RDX
	#DEBUG_VALUE: conflict:colDiff <- %RCX
	#DEBUG_VALUE: conflict:_11 <- %RCX
	#DEBUG_VALUE: free_POS:pos <- %RDI
	.loc	1 16 2                  # NQueens.c:16:2
	callq	free
.Ltmp47:
	#DEBUG_VALUE: conflict:p_has_ownership <- 0
	jmp	.LBB4_6
.Ltmp48:
.LBB4_2:                                # %blklab1
	#DEBUG_VALUE: conflict:col <- %RCX
	#DEBUG_VALUE: conflict:p_has_ownership [bit_piece offset=0 size=1] <- %SIL
	#DEBUG_VALUE: conflict:p <- %RDI
	movl	$1, %ebx
.Ltmp49:
	#DEBUG_VALUE: conflict:_10 <- 1
	.loc	1 57 2                  # NQueens.c:57:2
	testb	%sil, %sil
	je	.LBB4_6
.Ltmp50:
# BB#3:                                 # %if.then6
	#DEBUG_VALUE: conflict:p <- %RDI
	#DEBUG_VALUE: conflict:p_has_ownership [bit_piece offset=0 size=1] <- %SIL
	#DEBUG_VALUE: conflict:col <- %RCX
	#DEBUG_VALUE: free_POS:pos <- %RDI
	.loc	1 16 2                  # NQueens.c:16:2
	callq	free
.Ltmp51:
	movl	$1, %ebx
.Ltmp52:
	#DEBUG_VALUE: conflict:p_has_ownership <- 0
.LBB4_6:                                # %cleanup
	.loc	1 89 1                  # NQueens.c:89:1
	movq	%rbx, %rax
	popq	%rbx
	retq
.Ltmp53:
.Lfunc_end4:
	.size	conflict, .Lfunc_end4-conflict
	.cfi_endproc

	.globl	run
	.p2align	4, 0x90
	.type	run,@function
run:                                    # @run
.Lfunc_begin5:
	.loc	1 91 0                  # NQueens.c:91:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp54:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp55:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp56:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp57:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp58:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp59:
	.cfi_def_cfa_offset 56
	subq	$72, %rsp
.Ltmp60:
	.cfi_def_cfa_offset 128
.Ltmp61:
	.cfi_offset %rbx, -56
.Ltmp62:
	.cfi_offset %r12, -48
.Ltmp63:
	.cfi_offset %r13, -40
.Ltmp64:
	.cfi_offset %r14, -32
.Ltmp65:
	.cfi_offset %r15, -24
.Ltmp66:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: run:queens <- %RDI
	#DEBUG_VALUE: run:queens_size <- %RSI
	#DEBUG_VALUE: run:queens_has_ownership [bit_piece offset=0 size=1] <- %EDX
	#DEBUG_VALUE: run:n <- %RCX
	#DEBUG_VALUE: run:dim <- %R8
.Ltmp67:
	#DEBUG_VALUE: run:_12 <- %RSI
	#DEBUG_VALUE: run:_13 <- %RSI
	movq	%r8, %rbp
.Ltmp68:
	#DEBUG_VALUE: run:dim <- %RBP
	movq	%rdi, (%rsp)            # 8-byte Spill
.Ltmp69:
	#DEBUG_VALUE: run:_33 <- 0
	#DEBUG_VALUE: run:_32 <- 0
	#DEBUG_VALUE: run:_31 <- 0
	#DEBUG_VALUE: run:_30 <- 0
	#DEBUG_VALUE: run:_29 <- 0
	#DEBUG_VALUE: run:_28 <- 0
	#DEBUG_VALUE: run:_27_has_ownership <- 0
	#DEBUG_VALUE: run:_25 <- 0
	#DEBUG_VALUE: run:_24 <- 0
	#DEBUG_VALUE: run:_19_has_ownership <- 0
	#DEBUG_VALUE: run:_18 <- 0
	#DEBUG_VALUE: run:_17 <- 0
	#DEBUG_VALUE: run:_16 <- 0
	#DEBUG_VALUE: run:_15 <- 0
	#DEBUG_VALUE: run:_11 <- 0
	#DEBUG_VALUE: run:_10 <- 0
	#DEBUG_VALUE: run:_9 <- 0
	#DEBUG_VALUE: run:p_has_ownership <- 0
	#DEBUG_VALUE: run:i <- 0
	#DEBUG_VALUE: run:col <- 0
	#DEBUG_VALUE: run:num_solutions <- 0
	#DEBUG_VALUE: run:_3 <- 0
	#DEBUG_VALUE: run:_13 <- 0
	#DEBUG_VALUE: run:_12 <- 0
	#DEBUG_VALUE: run:queens_has_ownership [bit_piece offset=0 size=1] <- %DL
	#DEBUG_VALUE: run:queens <- [%RSP+0]
	.loc	1 127 8 prologue_end    # NQueens.c:127:8
	cmpq	%rcx, %rbp
	jne	.LBB5_1
.Ltmp70:
# BB#30:                                # %if.end
	#DEBUG_VALUE: run:queens <- [%RSP+0]
	#DEBUG_VALUE: run:queens_has_ownership [bit_piece offset=0 size=1] <- %DL
	#DEBUG_VALUE: run:dim <- %RBP
	#DEBUG_VALUE: run:n <- %RCX
	#DEBUG_VALUE: run:queens_size <- %RSI
	movl	$1, %r12d
.Ltmp71:
	#DEBUG_VALUE: run:_9 <- 1
	.loc	1 131 2                 # NQueens.c:131:2
	testb	%dl, %dl
	je	.LBB5_17
.Ltmp72:
# BB#31:                                # %if.then1
	#DEBUG_VALUE: run:queens_size <- %RSI
	#DEBUG_VALUE: run:n <- %RCX
	#DEBUG_VALUE: run:dim <- %RBP
	#DEBUG_VALUE: run:queens_has_ownership [bit_piece offset=0 size=1] <- %DL
	#DEBUG_VALUE: run:queens <- [%RSP+0]
	.loc	1 131 2 is_stmt 0 discriminator 1 # NQueens.c:131:2
	movq	(%rsp), %rdi            # 8-byte Reload
	callq	free
.Ltmp73:
	movl	$1, %r12d
.Ltmp74:
	#DEBUG_VALUE: run:queens_has_ownership <- 0
	jmp	.LBB5_17
.Ltmp75:
.LBB5_1:                                # %while.cond.preheader
	#DEBUG_VALUE: run:queens <- [%RSP+0]
	#DEBUG_VALUE: run:queens_has_ownership [bit_piece offset=0 size=1] <- %DL
	#DEBUG_VALUE: run:dim <- %RBP
	#DEBUG_VALUE: run:n <- %RCX
	#DEBUG_VALUE: run:queens_size <- %RSI
	.loc	1 155 7 is_stmt 1       # NQueens.c:155:7
	cmpq	%rsi, %rcx
	jge	.LBB5_32
.Ltmp76:
# BB#2:                                 # %while.cond.preheader
	#DEBUG_VALUE: run:queens_size <- %RSI
	#DEBUG_VALUE: run:n <- %RCX
	#DEBUG_VALUE: run:dim <- %RBP
	#DEBUG_VALUE: run:queens_has_ownership [bit_piece offset=0 size=1] <- %DL
	#DEBUG_VALUE: run:queens <- [%RSP+0]
	cmpq	%rsi, %rbp
	jne	.LBB5_32
.Ltmp77:
# BB#3:                                 # %blklab10.preheader
	#DEBUG_VALUE: run:queens <- [%RSP+0]
	#DEBUG_VALUE: run:queens_has_ownership [bit_piece offset=0 size=1] <- %DL
	#DEBUG_VALUE: run:dim <- %RBP
	#DEBUG_VALUE: run:n <- %RCX
	#DEBUG_VALUE: run:queens_size <- %RSI
	movl	%edx, 28(%rsp)          # 4-byte Spill
	xorl	%r12d, %r12d
	.loc	1 170 6                 # NQueens.c:170:6
	testq	%rbp, %rbp
	jle	.LBB5_4
.Ltmp78:
# BB#27:                                # %blklab14.preheader.us.preheader
	#DEBUG_VALUE: run:queens_size <- %RSI
	#DEBUG_VALUE: run:n <- %RCX
	#DEBUG_VALUE: run:dim <- %RBP
	#DEBUG_VALUE: run:queens_has_ownership [bit_piece offset=0 size=1] <- %DL
	#DEBUG_VALUE: run:queens <- [%RSP+0]
	.loc	1 275 8                 # NQueens.c:275:8
	leaq	1(%rcx), %rax
.Ltmp79:
	#DEBUG_VALUE: run:_30 <- [%RSP+32]
	movq	%rax, 32(%rsp)          # 8-byte Spill
	xorl	%r13d, %r13d
                                        # implicit-def: %R14
                                        # implicit-def: %R15
	xorl	%ebx, %ebx
	xorl	%r12d, %r12d
                                        # implicit-def: %RAX
	movq	%rax, 8(%rsp)           # 8-byte Spill
	xorl	%eax, %eax
	movq	%rcx, 16(%rsp)          # 8-byte Spill
.Ltmp80:
	.loc	1 108 12                # NQueens.c:108:12
	movq	%rbp, 48(%rsp)          # 8-byte Spill
.Ltmp81:
	.p2align	4, 0x90
.LBB5_28:                               # %blklab14.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_18 Depth 2
	.loc	1 207 7                 # NQueens.c:207:7
	testq	%rcx, %rcx
	jle	.LBB5_7
# BB#29:                                # %if.end38.us.preheader
                                        #   in Loop: Header=BB5_28 Depth=1
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	%rbx, 40(%rsp)          # 8-byte Spill
	movq	%r12, 64(%rsp)          # 8-byte Spill
	xorl	%r12d, %r12d
	movl	$1, %ebx
	.p2align	4, 0x90
.LBB5_18:                               # %if.end38.us
                                        #   Parent Loop BB5_28 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 210 19                # NQueens.c:210:19
	movq	(%rsp), %rax            # 8-byte Reload
	movq	(%rax,%r12,8), %rbp
.Ltmp82:
	.loc	1 3 17 discriminator 1  # NQueens.c:3:17
	movl	$16, %edi
	callq	malloc
	movq	%rax, %r15
	.loc	1 4 21                  # NQueens.c:4:21
	movups	(%rbp), %xmm0
.Ltmp83:
	#DEBUG_VALUE: run:_19_has_ownership <- 1
	.loc	1 4 13 is_stmt 0        # NQueens.c:4:13
	movups	%xmm0, (%r15)
.Ltmp84:
	.loc	1 213 4 is_stmt 1       # NQueens.c:213:4
	testb	$1, %r13b
	je	.LBB5_20
# BB#19:                                # %if.then41.us
                                        #   in Loop: Header=BB5_18 Depth=2
.Ltmp85:
	.loc	1 16 2                  # NQueens.c:16:2
	movq	%r14, %rdi
	callq	free
.Ltmp86:
	#DEBUG_VALUE: run:p_has_ownership <- 0
.LBB5_20:                               # %polly.split_new_and_old.us
                                        #   in Loop: Header=BB5_18 Depth=2
	cmpq	$1, %rbx
	movl	$0, %ebx
	movq	16(%rsp), %rsi          # 8-byte Reload
	jne	.LBB5_26
# BB#21:                                # %blklab20.us
                                        #   in Loop: Header=BB5_18 Depth=2
.Ltmp87:
	#DEBUG_VALUE: run:p_has_ownership <- 1
	#DEBUG_VALUE: run:_19_has_ownership <- 0
	#DEBUG_VALUE: run:_20 <- 1
	#DEBUG_VALUE: conflict:p_has_ownership [bit_piece offset=0 size=1] <- 0
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
	.loc	1 41 10                 # NQueens.c:41:10
	movq	(%r15), %rax
.Ltmp88:
	#DEBUG_VALUE: conflict:_8 <- %RAX
	#DEBUG_VALUE: conflict:r <- %RAX
	.loc	1 49 6                  # NQueens.c:49:6
	subq	%rsi, %rax
.Ltmp89:
	#DEBUG_VALUE: conflict:row <- [%RSP+16]
	je	.LBB5_22
.Ltmp90:
# BB#23:                                # %blklab20.us
                                        #   in Loop: Header=BB5_18 Depth=2
	#DEBUG_VALUE: conflict:row <- [%RSP+16]
	.loc	1 45 10                 # NQueens.c:45:10
	movq	8(%r15), %rcx
.Ltmp91:
	#DEBUG_VALUE: conflict:_9 <- %RCX
	#DEBUG_VALUE: conflict:c <- %RCX
	subq	40(%rsp), %rcx          # 8-byte Folded Reload
.Ltmp92:
	.loc	1 226 10                # NQueens.c:226:10
	movl	$1, %ebx
	je	.LBB5_25
.Ltmp93:
# BB#24:                                # %blklab0.i.us
                                        #   in Loop: Header=BB5_18 Depth=2
	#DEBUG_VALUE: conflict:row <- [%RSP+16]
	#DEBUG_VALUE: conflict:_12 <- %RCX
	.loc	1 62 7                  # NQueens.c:62:7
	movq	%rcx, %rdx
	negq	%rdx
	cmovlq	%rcx, %rdx
.Ltmp94:
	#DEBUG_VALUE: conflict:_14 <- %RAX
	#DEBUG_VALUE: conflict:_11 <- %RDX
	#DEBUG_VALUE: conflict:colDiff <- %RDX
	.loc	1 68 7                  # NQueens.c:68:7
	movq	%rax, %rcx
.Ltmp95:
	negq	%rcx
	cmovlq	%rax, %rcx
.Ltmp96:
	#DEBUG_VALUE: conflict:_13 <- %RCX
	#DEBUG_VALUE: conflict:rowDiff <- %RCX
	.loc	1 74 12                 # NQueens.c:74:12
	cmpq	%rcx, %rdx
	sete	%al
.Ltmp97:
	.loc	1 82 2                  # NQueens.c:82:2
	movzbl	%al, %ebx
	jmp	.LBB5_25
.Ltmp98:
.LBB5_22:                               #   in Loop: Header=BB5_18 Depth=2
	#DEBUG_VALUE: conflict:row <- [%RSP+16]
	.loc	1 226 10                # NQueens.c:226:10
	movl	$1, %ebx
.Ltmp99:
.LBB5_25:                               # %conflict.exit.us
                                        #   in Loop: Header=BB5_18 Depth=2
	#DEBUG_VALUE: conflict:row <- [%RSP+16]
	.loc	1 230 7                 # NQueens.c:230:7
	xorq	$1, %rbx
.Ltmp100:
	#DEBUG_VALUE: run:_23 <- 1
	#DEBUG_VALUE: run:_22 <- 1
.LBB5_26:                               # %blklab18.us
                                        #   in Loop: Header=BB5_18 Depth=2
	#DEBUG_VALUE: run:_24 <- 1
	.loc	1 252 9                 # NQueens.c:252:9
	incq	%r12
.Ltmp101:
	#DEBUG_VALUE: run:_25 <- %R12
	#DEBUG_VALUE: run:_17 <- 0
	#DEBUG_VALUE: run:i <- %R12
	movb	$1, %r13b
	.loc	1 207 7                 # NQueens.c:207:7
	cmpq	%r12, %rsi
	movq	%r15, %r14
	jne	.LBB5_18
.Ltmp102:
# BB#5:                                 # %blklab12.us
                                        #   in Loop: Header=BB5_28 Depth=1
	#DEBUG_VALUE: run:i <- %R12
	#DEBUG_VALUE: run:_25 <- %R12
	#DEBUG_VALUE: run:_26 <- 1
	movb	$1, %r13b
	.loc	1 263 6                 # NQueens.c:263:6
	testq	%rbx, %rbx
	movq	%r15, %r14
	movq	64(%rsp), %r12          # 8-byte Reload
.Ltmp103:
	movq	48(%rsp), %rbp          # 8-byte Reload
	movq	40(%rsp), %rbx          # 8-byte Reload
	movq	56(%rsp), %rax          # 8-byte Reload
	je	.LBB5_6
.LBB5_7:                                # %if.end52.us
                                        #   in Loop: Header=BB5_28 Depth=1
.Ltmp104:
	.loc	1 265 3                 # NQueens.c:265:3
	testb	$1, %al
	je	.LBB5_9
# BB#8:                                 # %if.then54.us
                                        #   in Loop: Header=BB5_28 Depth=1
.Ltmp105:
	.loc	1 16 2                  # NQueens.c:16:2
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	free
.Ltmp106:
	#DEBUG_VALUE: run:_27_has_ownership <- 0
.LBB5_9:                                # %if.end55.us
                                        #   in Loop: Header=BB5_28 Depth=1
	.loc	1 266 9                 # NQueens.c:266:9
	movl	$16, %edi
	callq	malloc
	.loc	1 267 10                # NQueens.c:267:10
	movq	%rbx, 8(%rax)
.Ltmp107:
	#DEBUG_VALUE: run:_27_has_ownership <- 1
	movq	16(%rsp), %rcx          # 8-byte Reload
	.loc	1 268 10                # NQueens.c:268:10
	movq	%rcx, (%rax)
	movq	(%rsp), %rdi            # 8-byte Reload
	movq	%rax, 8(%rsp)           # 8-byte Spill
	.loc	1 271 13                # NQueens.c:271:13
	movq	%rax, (%rdi,%rcx,8)
.Ltmp108:
	#DEBUG_VALUE: run:_29 <- 1
	.loc	1 277 9                 # NQueens.c:277:9
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movq	32(%rsp), %rcx          # 8-byte Reload
	movq	%rbp, %r8
	callq	run
.Ltmp109:
	#DEBUG_VALUE: run:_28 <- %R12
	.loc	1 279 20                # NQueens.c:279:20
	addq	%rax, %r12
.Ltmp110:
	#DEBUG_VALUE: run:_31 <- %R12
	#DEBUG_VALUE: run:num_solutions <- %R12
	movb	$1, %al
	jmp	.LBB5_10
.Ltmp111:
	.p2align	4, 0x90
.LBB5_6:                                #   in Loop: Header=BB5_28 Depth=1
	movq	%r15, %r14
.LBB5_10:                               # %blklab22.us
                                        #   in Loop: Header=BB5_28 Depth=1
.Ltmp112:
	#DEBUG_VALUE: run:_32 <- 1
	.loc	1 287 10                # NQueens.c:287:10
	incq	%rbx
.Ltmp113:
	#DEBUG_VALUE: conflict:col <- %RBX
	#DEBUG_VALUE: run:_33 <- %RBX
	#DEBUG_VALUE: run:col <- %RBX
	.loc	1 170 9                 # NQueens.c:170:9
	cmpq	%rbp, %rbx
	movq	16(%rsp), %rcx          # 8-byte Reload
	jl	.LBB5_28
	jmp	.LBB5_11
.Ltmp114:
.LBB5_4:
	#DEBUG_VALUE: run:queens_size <- %RSI
	#DEBUG_VALUE: run:n <- %RCX
	#DEBUG_VALUE: run:dim <- %RBP
	#DEBUG_VALUE: run:queens_has_ownership [bit_piece offset=0 size=1] <- %DL
	#DEBUG_VALUE: run:queens <- [%RSP+0]
                                        # implicit-def: %R15
	xorl	%r13d, %r13d
                                        # implicit-def: %RAX
	movq	%rax, 8(%rsp)           # 8-byte Spill
	xorl	%eax, %eax
.Ltmp115:
.LBB5_11:                               # %blklab8
	movq	%rax, %rbx
	.loc	1 296 2                 # NQueens.c:296:2
	movl	28(%rsp), %eax          # 4-byte Reload
	testb	%al, %al
	je	.LBB5_13
# BB#12:                                # %if.then63
.Ltmp116:
	.loc	1 296 2 is_stmt 0 discriminator 1 # NQueens.c:296:2
	movq	(%rsp), %rdi            # 8-byte Reload
	callq	free
.Ltmp117:
	#DEBUG_VALUE: run:queens_has_ownership <- 0
.LBB5_13:                               # %if.end64
	.loc	1 297 2 is_stmt 1       # NQueens.c:297:2
	testb	$1, %r13b
	je	.LBB5_15
# BB#14:                                # %if.then66
.Ltmp118:
	.loc	1 16 2                  # NQueens.c:16:2
	movq	%r15, %rdi
	callq	free
.Ltmp119:
	#DEBUG_VALUE: run:p_has_ownership <- 0
.LBB5_15:                               # %if.end70
	.loc	1 299 2                 # NQueens.c:299:2
	testb	$1, %bl
	je	.LBB5_17
# BB#16:                                # %if.then72
.Ltmp120:
	.loc	1 16 2                  # NQueens.c:16:2
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	free
.Ltmp121:
	#DEBUG_VALUE: run:_27_has_ownership <- 0
.LBB5_17:                               # %cleanup
	.loc	1 304 1 discriminator 2 # NQueens.c:304:1
	movq	%r12, %rax
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB5_32:                               # %blklab11
.Ltmp122:
	#DEBUG_VALUE: run:queens_size <- %RSI
	#DEBUG_VALUE: run:n <- %RCX
	#DEBUG_VALUE: run:dim <- %RBP
	#DEBUG_VALUE: run:queens_has_ownership [bit_piece offset=0 size=1] <- %DL
	#DEBUG_VALUE: run:queens <- [%RSP+0]
	.loc	1 163 12                # NQueens.c:163:12
	movq	stderr(%rip), %rcx
.Ltmp123:
	.loc	1 163 4 is_stmt 0       # NQueens.c:163:4
	movl	$.L.str.5, %edi
	movl	$4, %esi
.Ltmp124:
	movl	$1, %edx
.Ltmp125:
	callq	fwrite
.Ltmp126:
	.loc	1 164 4 is_stmt 1       # NQueens.c:164:4
	movl	$-1, %edi
	callq	exit
.Ltmp127:
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
.Lfunc_begin6:
	.loc	1 306 0                 # NQueens.c:306:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp128:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp129:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp130:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp131:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp132:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp133:
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
.Ltmp134:
	.cfi_def_cfa_offset 80
.Ltmp135:
	.cfi_offset %rbx, -56
.Ltmp136:
	.cfi_offset %r12, -48
.Ltmp137:
	.cfi_offset %r13, -40
.Ltmp138:
	.cfi_offset %r14, -32
.Ltmp139:
	.cfi_offset %r15, -24
.Ltmp140:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
	movl	%edi, %ebx
.Ltmp141:
	#DEBUG_VALUE: main:_30_has_ownership <- 0
	#DEBUG_VALUE: main:_30_size <- 0
	#DEBUG_VALUE: main:_25_has_ownership <- 0
	#DEBUG_VALUE: main:_25_size <- 0
	#DEBUG_VALUE: main:_20_has_ownership <- 0
	#DEBUG_VALUE: main:_20_size <- 0
	#DEBUG_VALUE: main:_17_has_ownership <- 0
	#DEBUG_VALUE: main:_17_size <- 0
	#DEBUG_VALUE: main:_14 <- 0
	#DEBUG_VALUE: main:_13 <- 0
	#DEBUG_VALUE: main:_12_has_ownership <- 0
	#DEBUG_VALUE: main:_12_size <- 0
	#DEBUG_VALUE: main:_11_has_ownership <- 0
	#DEBUG_VALUE: main:_10 <- 0
	#DEBUG_VALUE: main:_9 <- 0
	#DEBUG_VALUE: main:_8_has_ownership <- 0
	#DEBUG_VALUE: main:_8_size <- 0
	#DEBUG_VALUE: main:_7 <- 0
	#DEBUG_VALUE: main:_6_has_ownership <- 0
	#DEBUG_VALUE: main:_6_size_size <- 0
	#DEBUG_VALUE: main:_6_size <- 0
	#DEBUG_VALUE: main:num_solutions <- 0
	#DEBUG_VALUE: main:init_has_ownership <- 0
	#DEBUG_VALUE: main:init_size <- 0
	#DEBUG_VALUE: main:n <- 0
	#DEBUG_VALUE: main:argc <- %EBX
	.loc	1 343 2 prologue_end    # NQueens.c:343:2
	callq	convertArgsToIntArray
.Ltmp142:
	#DEBUG_VALUE: main:_6 <- %RAX
	decl	%ebx
.Ltmp143:
	movslq	%ebx, %rcx
.Ltmp144:
	#DEBUG_VALUE: main:_6_has_ownership <- 1
	#DEBUG_VALUE: main:_6_size <- %EBX
	movq	%rcx, 16(%rsp)          # 8-byte Spill
	movq	%rax, 8(%rsp)           # 8-byte Spill
.Ltmp145:
	#DEBUG_VALUE: main:_6 <- [%RSP+8]
	.loc	1 348 5                 # NQueens.c:348:5
	movq	(%rax), %rdi
.Ltmp146:
	#DEBUG_VALUE: main:_8 <- %RDI
	.loc	1 350 2                 # NQueens.c:350:2
	callq	parseStringToInt
.Ltmp147:
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_5 <- %RAX
	.loc	1 354 9                 # NQueens.c:354:9
	testq	%rax, %rax
.Ltmp148:
	.loc	1 354 5 is_stmt 0       # NQueens.c:354:5
	je	.LBB6_5
.Ltmp149:
# BB#1:                                 # %if.end
	#DEBUG_VALUE: main:_5 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_6_size <- %EBX
	.loc	1 356 6 is_stmt 1       # NQueens.c:356:6
	movq	(%rax), %r13
.Ltmp150:
	#DEBUG_VALUE: main:_12_size <- %R13
	#DEBUG_VALUE: main:_11_has_ownership <- 1
	#DEBUG_VALUE: main:_10 <- 0
	#DEBUG_VALUE: main:_9 <- 0
	#DEBUG_VALUE: main:init_size <- %R13
	#DEBUG_VALUE: main:n <- %R13
	.loc	1 369 16                # NQueens.c:369:16
	leaq	(,%r13,8), %rdi
	.loc	1 369 8 is_stmt 0       # NQueens.c:369:8
	callq	malloc
.Ltmp151:
	movq	%rax, %r12
.Ltmp152:
	#DEBUG_VALUE: _12_i <- 0
	.loc	1 370 2 is_stmt 1 discriminator 1 # NQueens.c:370:2
	testq	%r13, %r13
	jle	.LBB6_4
.Ltmp153:
# BB#2:                                 # %for.body.preheader
	#DEBUG_VALUE: main:_6_size <- %EBX
	#DEBUG_VALUE: main:n <- %R13
	#DEBUG_VALUE: main:init_size <- %R13
	#DEBUG_VALUE: main:_12_size <- %R13
	movq	%r12, %rbx
.Ltmp154:
	movq	%r13, %rbp
.Ltmp155:
	.p2align	4, 0x90
.LBB6_3:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 3 17 discriminator 1  # NQueens.c:3:17
	movl	$16, %edi
	callq	malloc
	.loc	1 5 13                  # NQueens.c:5:13
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%rax)
.Ltmp156:
	.loc	1 370 46 discriminator 3 # NQueens.c:370:46
	movq	%rax, (%rbx)
.Ltmp157:
	.loc	1 370 2 is_stmt 0 discriminator 1 # NQueens.c:370:2
	addq	$8, %rbx
	decq	%rbp
	jne	.LBB6_3
.Ltmp158:
.LBB6_4:                                # %if.then92
	#DEBUG_VALUE: main:init_has_ownership <- 1
	#DEBUG_VALUE: main:_12_has_ownership <- 0
	#DEBUG_VALUE: main:_14 <- 0
	.loc	1 381 8 is_stmt 1       # NQueens.c:381:8
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%r13, %r8
	callq	run
	movq	%rax, %r15
.Ltmp159:
	#DEBUG_VALUE: main:_17_size <- 33
	#DEBUG_VALUE: main:_13 <- %R15
	#DEBUG_VALUE: main:num_solutions <- %R15
	.loc	1 388 2                 # NQueens.c:388:2
	movl	$264, %edi              # imm = 0x108
	callq	malloc
	movq	%rax, %rbx
.Ltmp160:
	#DEBUG_VALUE: main:_17 <- %RBX
	.loc	1 389 9                 # NQueens.c:389:9
	movaps	.LCPI6_0(%rip), %xmm0   # xmm0 = [78,45]
	movups	%xmm0, (%rbx)
	.loc	1 389 35 is_stmt 0      # NQueens.c:389:35
	movaps	.LCPI6_1(%rip), %xmm0   # xmm0 = [81,117]
	movups	%xmm0, 16(%rbx)
	.loc	1 389 62                # NQueens.c:389:62
	movaps	.LCPI6_2(%rip), %xmm0   # xmm0 = [101,101]
	movups	%xmm0, 32(%rbx)
	.loc	1 389 90                # NQueens.c:389:90
	movaps	.LCPI6_3(%rip), %xmm0   # xmm0 = [110,32]
	movups	%xmm0, 48(%rbx)
	.loc	1 389 117               # NQueens.c:389:117
	movaps	.LCPI6_4(%rip), %xmm0   # xmm0 = [80,114]
	movups	%xmm0, 64(%rbx)
	.loc	1 389 145               # NQueens.c:389:145
	movaps	.LCPI6_5(%rip), %xmm0   # xmm0 = [111,98]
	movups	%xmm0, 80(%rbx)
	.loc	1 389 174               # NQueens.c:389:174
	movaps	.LCPI6_6(%rip), %xmm0   # xmm0 = [108,101]
	movups	%xmm0, 96(%rbx)
	.loc	1 389 204               # NQueens.c:389:204
	movaps	.LCPI6_7(%rip), %xmm0   # xmm0 = [109,32]
	movups	%xmm0, 112(%rbx)
	.loc	1 389 233               # NQueens.c:389:233
	movaps	.LCPI6_8(%rip), %xmm0   # xmm0 = [111,110]
	movups	%xmm0, 128(%rbx)
	.loc	1 389 263               # NQueens.c:389:263
	movaps	.LCPI6_9(%rip), %xmm0   # xmm0 = [32,97]
	movups	%xmm0, 144(%rbx)
	.loc	1 389 291               # NQueens.c:389:291
	movaps	.LCPI6_10(%rip), %xmm0  # xmm0 = [32,78]
	movups	%xmm0, 160(%rbx)
	.loc	1 389 319               # NQueens.c:389:319
	movaps	.LCPI6_11(%rip), %xmm1  # xmm1 = [32,88]
	movups	%xmm1, 176(%rbx)
	.loc	1 389 347               # NQueens.c:389:347
	movups	%xmm0, 192(%rbx)
	.loc	1 389 375               # NQueens.c:389:375
	movaps	.LCPI6_12(%rip), %xmm0  # xmm0 = [32,66]
	movups	%xmm0, 208(%rbx)
	.loc	1 389 403               # NQueens.c:389:403
	movaps	.LCPI6_13(%rip), %xmm0  # xmm0 = [111,97]
	movups	%xmm0, 224(%rbx)
	.loc	1 389 432               # NQueens.c:389:432
	movaps	.LCPI6_14(%rip), %xmm0  # xmm0 = [114,100]
	movups	%xmm0, 240(%rbx)
	.loc	1 389 462               # NQueens.c:389:462
	movq	$46, 256(%rbx)
.Ltmp161:
	#DEBUG_VALUE: main:_17_has_ownership <- 1
	.loc	1 392 2 is_stmt 1       # NQueens.c:392:2
	movl	$33, %esi
	movq	%rbx, %rdi
	callq	println_s
.Ltmp162:
	#DEBUG_VALUE: main:_20_size <- 4
	.loc	1 397 2                 # NQueens.c:397:2
	movl	$32, %edi
	callq	malloc
	movq	%rax, %r14
.Ltmp163:
	#DEBUG_VALUE: main:_20 <- %R14
	.loc	1 398 9                 # NQueens.c:398:9
	movaps	.LCPI6_15(%rip), %xmm0  # xmm0 = [78,32]
	movups	%xmm0, (%r14)
	.loc	1 398 35 is_stmt 0      # NQueens.c:398:35
	movaps	.LCPI6_16(%rip), %xmm0  # xmm0 = [61,32]
	movups	%xmm0, 16(%r14)
.Ltmp164:
	#DEBUG_VALUE: main:_20_has_ownership <- 1
	.loc	1 401 2 is_stmt 1       # NQueens.c:401:2
	movl	$4, %esi
	movq	%r14, %rdi
	callq	printf_s
	.loc	1 405 2                 # NQueens.c:405:2
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	movq	%r13, %rsi
	callq	printf
.Ltmp165:
	#DEBUG_VALUE: main:_25_size <- 6
	.loc	1 410 2                 # NQueens.c:410:2
	movl	$48, %edi
	callq	malloc
	movq	%rax, %r13
.Ltmp166:
	#DEBUG_VALUE: main:_25 <- %R13
	.loc	1 411 9                 # NQueens.c:411:9
	movaps	.LCPI6_17(%rip), %xmm0  # xmm0 = [70,111]
	movups	%xmm0, (%r13)
	.loc	1 411 36 is_stmt 0      # NQueens.c:411:36
	movaps	.LCPI6_18(%rip), %xmm0  # xmm0 = [117,110]
	movups	%xmm0, 16(%r13)
	.loc	1 411 64                # NQueens.c:411:64
	movaps	.LCPI6_19(%rip), %xmm0  # xmm0 = [100,32]
	movups	%xmm0, 32(%r13)
.Ltmp167:
	#DEBUG_VALUE: main:_25_has_ownership <- 1
	.loc	1 414 2 is_stmt 1       # NQueens.c:414:2
	movl	$6, %esi
	movq	%r13, %rdi
	callq	printf_s
	.loc	1 418 2                 # NQueens.c:418:2
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	movq	%r15, %rsi
	callq	printf
.Ltmp168:
	#DEBUG_VALUE: main:_30_size <- 11
	.loc	1 423 2                 # NQueens.c:423:2
	movl	$88, %edi
	callq	malloc
	movq	%rax, %rbp
.Ltmp169:
	#DEBUG_VALUE: main:_30 <- %RBP
	.loc	1 424 9                 # NQueens.c:424:9
	movaps	.LCPI6_20(%rip), %xmm0  # xmm0 = [32,115]
	movups	%xmm0, (%rbp)
	.loc	1 424 36 is_stmt 0      # NQueens.c:424:36
	movaps	.LCPI6_21(%rip), %xmm0  # xmm0 = [111,108]
	movups	%xmm0, 16(%rbp)
	.loc	1 424 64                # NQueens.c:424:64
	movaps	.LCPI6_22(%rip), %xmm0  # xmm0 = [117,116]
	movups	%xmm0, 32(%rbp)
	.loc	1 424 92                # NQueens.c:424:92
	movaps	.LCPI6_23(%rip), %xmm0  # xmm0 = [105,111]
	movups	%xmm0, 48(%rbp)
	.loc	1 424 120               # NQueens.c:424:120
	movaps	.LCPI6_24(%rip), %xmm0  # xmm0 = [110,115]
	movups	%xmm0, 64(%rbp)
	.loc	1 424 149               # NQueens.c:424:149
	movq	$46, 80(%rbp)
.Ltmp170:
	#DEBUG_VALUE: main:_30_has_ownership <- 1
	.loc	1 427 2 is_stmt 1       # NQueens.c:427:2
	movl	$11, %esi
	movq	%rbp, %rdi
	callq	println_s
.Ltmp171:
	.loc	1 431 2 discriminator 1 # NQueens.c:431:2
	movq	%r12, %rdi
	callq	free
.Ltmp172:
	#DEBUG_VALUE: main:init_has_ownership <- 0
	.loc	1 432 2 discriminator 1 # NQueens.c:432:2
	movq	8(%rsp), %rdi           # 8-byte Reload
	movq	16(%rsp), %rsi          # 8-byte Reload
	callq	free2DArray
.Ltmp173:
	#DEBUG_VALUE: main:_11_has_ownership <- 0
	#DEBUG_VALUE: main:_6_has_ownership <- 0
	.loc	1 436 2 discriminator 1 # NQueens.c:436:2
	movq	%rbx, %rdi
	callq	free
.Ltmp174:
	#DEBUG_VALUE: main:_17_has_ownership <- 0
	.loc	1 437 2 discriminator 1 # NQueens.c:437:2
	movq	%r14, %rdi
	callq	free
.Ltmp175:
	#DEBUG_VALUE: main:_20_has_ownership <- 0
	.loc	1 438 2 discriminator 1 # NQueens.c:438:2
	movq	%r13, %rdi
	callq	free
.Ltmp176:
	#DEBUG_VALUE: main:_25_has_ownership <- 0
	.loc	1 439 2 discriminator 1 # NQueens.c:439:2
	movq	%rbp, %rdi
	callq	free
.Ltmp177:
	#DEBUG_VALUE: main:_30_has_ownership <- 0
	.loc	1 440 2                 # NQueens.c:440:2
	xorl	%edi, %edi
	callq	exit
.Ltmp178:
.LBB6_5:                                # %if.end117.critedge
	#DEBUG_VALUE: main:_5 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_6_size <- %EBX
	.loc	1 432 2 discriminator 1 # NQueens.c:432:2
	movq	8(%rsp), %rdi           # 8-byte Reload
	movq	16(%rsp), %rsi          # 8-byte Reload
	callq	free2DArray
.Ltmp179:
	#DEBUG_VALUE: main:_6_has_ownership <- 0
	.loc	1 440 2                 # NQueens.c:440:2
	xorl	%edi, %edi
	callq	exit
.Ltmp180:
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

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git 83402ed45b681e9f38ce6626e5899c19159ceb29) (http://llvm.org/git/llvm.git 4fc8e6fd79f212952e8f538b6d5d9d78098b4505)" # string offset=0
.Linfo_string1:
	.asciz	"NQueens.c"             # string offset=165
.Linfo_string2:
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/NQueens/impl/autogenerate_leakfree" # string offset=175
.Linfo_string3:
	.asciz	"copy_POS"              # string offset=249
.Linfo_string4:
	.asciz	"r"                     # string offset=258
.Linfo_string5:
	.asciz	"long long int"         # string offset=260
.Linfo_string6:
	.asciz	"c"                     # string offset=274
.Linfo_string7:
	.asciz	"POS"                   # string offset=276
.Linfo_string8:
	.asciz	"_POS"                  # string offset=280
.Linfo_string9:
	.asciz	"new_POS"               # string offset=285
.Linfo_string10:
	.asciz	"free_POS"              # string offset=293
.Linfo_string11:
	.asciz	"pos"                   # string offset=302
.Linfo_string12:
	.asciz	"conflict"              # string offset=306
.Linfo_string13:
	.asciz	"p"                     # string offset=315
.Linfo_string14:
	.asciz	"p_has_ownership"       # string offset=317
.Linfo_string15:
	.asciz	"_Bool"                 # string offset=333
.Linfo_string16:
	.asciz	"row"                   # string offset=339
.Linfo_string17:
	.asciz	"col"                   # string offset=343
.Linfo_string18:
	.asciz	"colDiff"               # string offset=347
.Linfo_string19:
	.asciz	"rowDiff"               # string offset=355
.Linfo_string20:
	.asciz	"_8"                    # string offset=363
.Linfo_string21:
	.asciz	"_9"                    # string offset=366
.Linfo_string22:
	.asciz	"_11"                   # string offset=369
.Linfo_string23:
	.asciz	"_12"                   # string offset=373
.Linfo_string24:
	.asciz	"_13"                   # string offset=377
.Linfo_string25:
	.asciz	"_14"                   # string offset=381
.Linfo_string26:
	.asciz	"_3"                    # string offset=385
.Linfo_string27:
	.asciz	"_10"                   # string offset=388
.Linfo_string28:
	.asciz	"_15"                   # string offset=392
.Linfo_string29:
	.asciz	"copy_array_POS"        # string offset=396
.Linfo_string30:
	.asciz	"printf_POS"            # string offset=411
.Linfo_string31:
	.asciz	"run"                   # string offset=422
.Linfo_string32:
	.asciz	"main"                  # string offset=426
.Linfo_string33:
	.asciz	"int"                   # string offset=431
.Linfo_string34:
	.asciz	"_POS_size"             # string offset=435
.Linfo_string35:
	.asciz	"i"                     # string offset=445
.Linfo_string36:
	.asciz	"queens"                # string offset=447
.Linfo_string37:
	.asciz	"queens_size"           # string offset=454
.Linfo_string38:
	.asciz	"queens_has_ownership"  # string offset=466
.Linfo_string39:
	.asciz	"n"                     # string offset=487
.Linfo_string40:
	.asciz	"dim"                   # string offset=489
.Linfo_string41:
	.asciz	"_33"                   # string offset=493
.Linfo_string42:
	.asciz	"_32"                   # string offset=497
.Linfo_string43:
	.asciz	"_31"                   # string offset=501
.Linfo_string44:
	.asciz	"_30"                   # string offset=505
.Linfo_string45:
	.asciz	"_29"                   # string offset=509
.Linfo_string46:
	.asciz	"_28"                   # string offset=513
.Linfo_string47:
	.asciz	"_27_has_ownership"     # string offset=517
.Linfo_string48:
	.asciz	"_25"                   # string offset=535
.Linfo_string49:
	.asciz	"_24"                   # string offset=539
.Linfo_string50:
	.asciz	"_19_has_ownership"     # string offset=543
.Linfo_string51:
	.asciz	"_18"                   # string offset=561
.Linfo_string52:
	.asciz	"_17"                   # string offset=565
.Linfo_string53:
	.asciz	"_16"                   # string offset=569
.Linfo_string54:
	.asciz	"num_solutions"         # string offset=573
.Linfo_string55:
	.asciz	"_20"                   # string offset=587
.Linfo_string56:
	.asciz	"_23"                   # string offset=591
.Linfo_string57:
	.asciz	"_22"                   # string offset=595
.Linfo_string58:
	.asciz	"_26"                   # string offset=599
.Linfo_string59:
	.asciz	"isSolution"            # string offset=603
.Linfo_string60:
	.asciz	"_19"                   # string offset=614
.Linfo_string61:
	.asciz	"_21"                   # string offset=618
.Linfo_string62:
	.asciz	"_27"                   # string offset=622
.Linfo_string63:
	.asciz	"argc"                  # string offset=626
.Linfo_string64:
	.asciz	"args"                  # string offset=631
.Linfo_string65:
	.asciz	"char"                  # string offset=636
.Linfo_string66:
	.asciz	"_30_has_ownership"     # string offset=641
.Linfo_string67:
	.asciz	"_30_size"              # string offset=659
.Linfo_string68:
	.asciz	"_25_has_ownership"     # string offset=668
.Linfo_string69:
	.asciz	"_25_size"              # string offset=686
.Linfo_string70:
	.asciz	"_20_has_ownership"     # string offset=695
.Linfo_string71:
	.asciz	"_20_size"              # string offset=713
.Linfo_string72:
	.asciz	"_17_has_ownership"     # string offset=722
.Linfo_string73:
	.asciz	"_17_size"              # string offset=740
.Linfo_string74:
	.asciz	"_12_has_ownership"     # string offset=749
.Linfo_string75:
	.asciz	"_12_size"              # string offset=767
.Linfo_string76:
	.asciz	"_11_has_ownership"     # string offset=776
.Linfo_string77:
	.asciz	"_8_has_ownership"      # string offset=794
.Linfo_string78:
	.asciz	"_8_size"               # string offset=811
.Linfo_string79:
	.asciz	"_7"                    # string offset=819
.Linfo_string80:
	.asciz	"_6_has_ownership"      # string offset=822
.Linfo_string81:
	.asciz	"_6_size_size"          # string offset=839
.Linfo_string82:
	.asciz	"_6_size"               # string offset=852
.Linfo_string83:
	.asciz	"init_has_ownership"    # string offset=860
.Linfo_string84:
	.asciz	"init_size"             # string offset=879
.Linfo_string85:
	.asciz	"_6"                    # string offset=889
.Linfo_string86:
	.asciz	"max"                   # string offset=892
.Linfo_string87:
	.asciz	"_5"                    # string offset=896
.Linfo_string88:
	.asciz	"_12_i"                 # string offset=899
.Linfo_string89:
	.asciz	"init"                  # string offset=905
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
	.quad	.Ltmp47-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Lfunc_begin4-.Lfunc_begin0
	.quad	.Ltmp34-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	84                      # super-register DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	84                      # super-register DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	1                       # 1
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	84                      # super-register DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	1                       # 1
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Lfunc_end4-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Lfunc_begin4-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Lfunc_begin4-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp35-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp35-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Lfunc_begin5-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	0                       # 0
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	0                       # 0
	.quad	.Ltmp114-.Lfunc_begin0
	.quad	.Ltmp115-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	0                       # 0
	.quad	.Ltmp122-.Lfunc_begin0
	.quad	.Ltmp126-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	0                       # 0
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Lfunc_begin5-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp114-.Lfunc_begin0
	.quad	.Ltmp115-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp122-.Lfunc_begin0
	.quad	.Ltmp124-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc23:
	.quad	.Lfunc_begin5-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	81                      # super-register DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	81                      # super-register DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	1                       # 1
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	81                      # super-register DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	1                       # 1
	.quad	.Ltmp114-.Lfunc_begin0
	.quad	.Ltmp115-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	81                      # super-register DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	1                       # 1
	.quad	.Ltmp117-.Lfunc_begin0
	.quad	.Ltmp122-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp122-.Lfunc_begin0
	.quad	.Ltmp125-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	81                      # super-register DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	1                       # 1
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Lfunc_begin5-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp114-.Lfunc_begin0
	.quad	.Ltmp115-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp122-.Lfunc_begin0
	.quad	.Ltmp123-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Lfunc_begin5-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp114-.Lfunc_begin0
	.quad	.Ltmp115-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp122-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp67-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Ltmp67-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp113-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp114-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp112-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp112-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp110-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp110-.Lfunc_begin0
	.quad	.Ltmp111-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	32                      # 32
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp108-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp108-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc33:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp109-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp110-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc34:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp107-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp107-.Lfunc_begin0
	.quad	.Ltmp121-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp121-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc35:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp101-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp101-.Lfunc_begin0
	.quad	.Ltmp103-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc36:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp100-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc37:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp83-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc38:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp71-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc39:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp119-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp119-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc40:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp101-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp101-.Lfunc_begin0
	.quad	.Ltmp103-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc41:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp113-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp114-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc42:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp110-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp110-.Lfunc_begin0
	.quad	.Ltmp111-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc43:
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc44:
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc45:
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp94-.Lfunc_begin0
	.quad	.Ltmp98-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc46:
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp96-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp96-.Lfunc_begin0
	.quad	.Ltmp98-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc47:
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc48:
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc49:
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp94-.Lfunc_begin0
	.quad	.Ltmp98-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc50:
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp93-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp93-.Lfunc_begin0
	.quad	.Ltmp95-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc51:
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp96-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp96-.Lfunc_begin0
	.quad	.Ltmp98-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc52:
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp94-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc53:
	.quad	.Ltmp89-.Lfunc_begin0
	.quad	.Ltmp100-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	16                      # 16
	.quad	0
	.quad	0
.Ldebug_loc54:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp114-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc55:
	.quad	.Lfunc_begin6-.Lfunc_begin0
	.quad	.Ltmp141-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp143-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc56:
	.quad	.Lfunc_begin6-.Lfunc_begin0
	.quad	.Ltmp142-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc57:
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp170-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp170-.Lfunc_begin0
	.quad	.Ltmp177-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp177-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc58:
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp168-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp168-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	11                      # 11
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc59:
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp167-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp167-.Lfunc_begin0
	.quad	.Ltmp176-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp176-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc60:
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp165-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp165-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	6                       # 6
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc61:
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp164-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp164-.Lfunc_begin0
	.quad	.Ltmp175-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp175-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc62:
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp162-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp162-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	4                       # 4
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc63:
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp161-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp161-.Lfunc_begin0
	.quad	.Ltmp174-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp174-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc64:
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp159-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp159-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	33                      # 33
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc65:
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp159-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp159-.Lfunc_begin0
	.quad	.Ltmp178-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc66:
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp150-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp150-.Lfunc_begin0
	.quad	.Ltmp155-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc67:
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp150-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp150-.Lfunc_begin0
	.quad	.Ltmp173-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp173-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc68:
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp144-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp144-.Lfunc_begin0
	.quad	.Ltmp173-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp173-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc69:
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp144-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp144-.Lfunc_begin0
	.quad	.Ltmp154-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp178-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc70:
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp159-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp159-.Lfunc_begin0
	.quad	.Ltmp178-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc71:
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp158-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp158-.Lfunc_begin0
	.quad	.Ltmp172-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp172-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc72:
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp150-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp150-.Lfunc_begin0
	.quad	.Ltmp155-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc73:
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp150-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp150-.Lfunc_begin0
	.quad	.Ltmp155-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc74:
	.quad	.Ltmp142-.Lfunc_begin0
	.quad	.Ltmp145-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp145-.Lfunc_begin0
	.quad	.Ltmp147-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
	.quad	0
	.quad	0
.Ldebug_loc75:
	.quad	.Ltmp146-.Lfunc_begin0
	.quad	.Ltmp147-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc76:
	.quad	.Ltmp147-.Lfunc_begin0
	.quad	.Ltmp151-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp178-.Lfunc_begin0
	.quad	.Ltmp179-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc77:
	.quad	.Ltmp147-.Lfunc_begin0
	.quad	.Ltmp151-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp178-.Lfunc_begin0
	.quad	.Ltmp179-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc78:
	.quad	.Ltmp160-.Lfunc_begin0
	.quad	.Ltmp178-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc79:
	.quad	.Ltmp163-.Lfunc_begin0
	.quad	.Ltmp178-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc80:
	.quad	.Ltmp166-.Lfunc_begin0
	.quad	.Ltmp178-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc81:
	.quad	.Ltmp169-.Lfunc_begin0
	.quad	.Ltmp178-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
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
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.byte	25                      # DW_FORM_flag_present
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
	.ascii	"\347\177"              # DW_AT_APPLE_omit_frame_ptr
	.byte	25                      # DW_FORM_flag_present
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
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
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
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
	.ascii	"\347\177"              # DW_AT_APPLE_omit_frame_ptr
	.byte	25                      # DW_FORM_flag_present
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
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
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
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.ascii	"\347\177"              # DW_AT_APPLE_omit_frame_ptr
	.byte	25                      # DW_FORM_flag_present
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	20                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	21                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.ascii	"\347\177"              # DW_AT_APPLE_omit_frame_ptr
	.byte	25                      # DW_FORM_flag_present
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
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	22                      # Abbreviation Code
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
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.byte	25                      # DW_FORM_flag_present
	.byte	32                      # DW_AT_inline
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	23                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	24                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	25                      # Abbreviation Code
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
	.byte	26                      # Abbreviation Code
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
	.byte	27                      # Abbreviation Code
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
	.byte	28                      # Abbreviation Code
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
	.byte	29                      # Abbreviation Code
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
	.byte	30                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.ascii	"\347\177"              # DW_AT_APPLE_omit_frame_ptr
	.byte	25                      # DW_FORM_flag_present
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
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	31                      # Abbreviation Code
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
	.byte	32                      # Abbreviation Code
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
	.byte	33                      # Abbreviation Code
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
	.byte	34                      # Abbreviation Code
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
	.byte	35                      # Abbreviation Code
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
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	2340                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x91d DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end6-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x1 DW_TAG_pointer_type
	.byte	3                       # Abbrev [3] 0x2b:0x2a DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	85                      # DW_AT_abstract_origin
	.long	85                      # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x42:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	97                      # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x4b:0x9 DW_TAG_variable
	.long	.Ldebug_loc1            # DW_AT_location
	.long	108                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	6                       # Abbrev [6] 0x55:0x23 DW_TAG_subprogram
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	120                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	7                       # Abbrev [7] 0x61:0xb DW_TAG_formal_parameter
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	120                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x6c:0xb DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	120                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0x78:0x5 DW_TAG_pointer_type
	.long	125                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x7d:0xb DW_TAG_typedef
	.long	136                     # DW_AT_type
	.long	.Linfo_string7          # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.byte	11                      # Abbrev [11] 0x88:0x1d DW_TAG_structure_type
	.byte	16                      # DW_AT_byte_size
	.byte	2                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.byte	12                      # Abbrev [12] 0x8c:0xc DW_TAG_member
	.long	.Linfo_string4          # DW_AT_name
	.long	165                     # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	12                      # Abbrev [12] 0x98:0xc DW_TAG_member
	.long	.Linfo_string6          # DW_AT_name
	.long	165                     # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	0                       # End Of Children Mark
	.byte	13                      # Abbrev [13] 0xa5:0x7 DW_TAG_base_type
	.long	.Linfo_string5          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	14                      # Abbrev [14] 0xac:0x70 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	2304                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	15                      # Abbrev [15] 0xc5:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	2304                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0xd4:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0xe3:0xb DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	2304                    # DW_AT_type
	.byte	16                      # Abbrev [16] 0xee:0x2d DW_TAG_lexical_block
	.quad	.Ltmp18                 # DW_AT_low_pc
	.long	.Ltmp24-.Ltmp18         # DW_AT_high_pc
	.byte	17                      # Abbrev [17] 0xfb:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.long	2309                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x107:0x13 DW_TAG_inlined_subroutine
	.long	85                      # DW_AT_abstract_origin
	.quad	.Ltmp21                 # DW_AT_low_pc
	.long	.Ltmp22-.Ltmp21         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	11                      # DW_AT_call_line
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	19                      # Abbrev [19] 0x11c:0x1b DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	348                     # DW_AT_abstract_origin
	.byte	20                      # Abbrev [20] 0x12f:0x7 DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	85
	.long	356                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	21                      # Abbrev [21] 0x137:0x25 DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	15                      # Abbrev [15] 0x14c:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc4            # DW_AT_location
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
	.long	120                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	22                      # Abbrev [22] 0x15c:0x14 DW_TAG_subprogram
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	7                       # Abbrev [7] 0x164:0xb DW_TAG_formal_parameter
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	120                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	19                      # Abbrev [19] 0x170:0xde DW_TAG_subprogram
	.quad	.Lfunc_begin4           # DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin4 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	590                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x183:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc5            # DW_AT_location
	.long	602                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x18c:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc6            # DW_AT_location
	.long	613                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x195:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc7            # DW_AT_location
	.long	624                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x19e:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc8            # DW_AT_location
	.long	635                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x1a7:0x9 DW_TAG_variable
	.long	.Ldebug_loc9            # DW_AT_location
	.long	646                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x1b0:0x9 DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	657                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x1b9:0x9 DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	668                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x1c2:0x9 DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	679                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x1cb:0x9 DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	690                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x1d4:0x9 DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	701                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x1dd:0x9 DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	712                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x1e6:0x9 DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	723                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x1ef:0x9 DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	734                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x1f8:0x9 DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	745                     # DW_AT_abstract_origin
	.byte	23                      # Abbrev [23] 0x201:0x6 DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	767                     # DW_AT_abstract_origin
	.byte	24                      # Abbrev [24] 0x207:0x5 DW_TAG_variable
	.long	756                     # DW_AT_abstract_origin
	.byte	24                      # Abbrev [24] 0x20c:0x5 DW_TAG_variable
	.long	778                     # DW_AT_abstract_origin
	.byte	25                      # Abbrev [25] 0x211:0x1e DW_TAG_inlined_subroutine
	.long	348                     # DW_AT_abstract_origin
	.quad	.Ltmp46                 # DW_AT_low_pc
	.long	.Ltmp48-.Ltmp46         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	86                      # DW_AT_call_line
	.byte	1                       # DW_AT_GNU_discriminator
	.byte	4                       # Abbrev [4] 0x225:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc19           # DW_AT_location
	.long	356                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	25                      # Abbrev [25] 0x22f:0x1e DW_TAG_inlined_subroutine
	.long	348                     # DW_AT_abstract_origin
	.quad	.Ltmp50                 # DW_AT_low_pc
	.long	.Ltmp52-.Ltmp50         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	57                      # DW_AT_call_line
	.byte	1                       # DW_AT_GNU_discriminator
	.byte	4                       # Abbrev [4] 0x243:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc20           # DW_AT_location
	.long	356                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	6                       # Abbrev [6] 0x24e:0xc8 DW_TAG_subprogram
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	165                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	7                       # Abbrev [7] 0x25a:0xb DW_TAG_formal_parameter
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	120                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x265:0xb DW_TAG_formal_parameter
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	790                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x270:0xb DW_TAG_formal_parameter
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x27b:0xb DW_TAG_formal_parameter
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x286:0xb DW_TAG_variable
	.long	.Linfo_string4          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	28                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x291:0xb DW_TAG_variable
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	29                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x29c:0xb DW_TAG_variable
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	30                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x2a7:0xb DW_TAG_variable
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x2b2:0xb DW_TAG_variable
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x2bd:0xb DW_TAG_variable
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	33                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x2c8:0xb DW_TAG_variable
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x2d3:0xb DW_TAG_variable
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x2de:0xb DW_TAG_variable
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	37                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x2e9:0xb DW_TAG_variable
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	38                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x2f4:0xb DW_TAG_variable
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x2ff:0xb DW_TAG_variable
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x30a:0xb DW_TAG_variable
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	39                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	13                      # Abbrev [13] 0x316:0x7 DW_TAG_base_type
	.long	.Linfo_string15         # DW_AT_name
	.byte	2                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	14                      # Abbrev [14] 0x31d:0x314 DW_TAG_subprogram
	.quad	.Lfunc_begin5           # DW_AT_low_pc
	.long	.Lfunc_end5-.Lfunc_begin5 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	91                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	165                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	15                      # Abbrev [15] 0x336:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	91                      # DW_AT_decl_line
	.long	2304                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x345:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	91                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x354:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	91                      # DW_AT_decl_line
	.long	790                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x363:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	91                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x372:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	91                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	26                      # Abbrev [26] 0x381:0xf DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	102                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	26                      # Abbrev [26] 0x390:0xf DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	103                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	26                      # Abbrev [26] 0x39f:0xf DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	125                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	26                      # Abbrev [26] 0x3ae:0xf DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	124                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	26                      # Abbrev [26] 0x3bd:0xf DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	123                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	26                      # Abbrev [26] 0x3cc:0xf DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	122                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	26                      # Abbrev [26] 0x3db:0xf DW_TAG_variable
	.long	.Ldebug_loc32           # DW_AT_location
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	121                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	26                      # Abbrev [26] 0x3ea:0xf DW_TAG_variable
	.long	.Ldebug_loc33           # DW_AT_location
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	120                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	26                      # Abbrev [26] 0x3f9:0xf DW_TAG_variable
	.long	.Ldebug_loc34           # DW_AT_location
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	119                     # DW_AT_decl_line
	.long	790                     # DW_AT_type
	.byte	26                      # Abbrev [26] 0x408:0xf DW_TAG_variable
	.long	.Ldebug_loc35           # DW_AT_location
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	116                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	26                      # Abbrev [26] 0x417:0xf DW_TAG_variable
	.long	.Ldebug_loc36           # DW_AT_location
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	115                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	26                      # Abbrev [26] 0x426:0xf DW_TAG_variable
	.long	.Ldebug_loc37           # DW_AT_location
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	110                     # DW_AT_decl_line
	.long	790                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x435:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	108                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x441:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	107                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x44d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	106                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x459:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	105                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x465:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	101                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x471:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	100                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	26                      # Abbrev [26] 0x47d:0xf DW_TAG_variable
	.long	.Ldebug_loc38           # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	99                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	26                      # Abbrev [26] 0x48c:0xf DW_TAG_variable
	.long	.Ldebug_loc39           # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	98                      # DW_AT_decl_line
	.long	790                     # DW_AT_type
	.byte	26                      # Abbrev [26] 0x49b:0xf DW_TAG_variable
	.long	.Ldebug_loc40           # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	96                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	26                      # Abbrev [26] 0x4aa:0xf DW_TAG_variable
	.long	.Ldebug_loc41           # DW_AT_location
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	94                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	26                      # Abbrev [26] 0x4b9:0xf DW_TAG_variable
	.long	.Ldebug_loc42           # DW_AT_location
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	93                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x4c8:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	92                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x4d4:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	111                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x4e0:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	114                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x4ec:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	113                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x4f8:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	117                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x504:0xb DW_TAG_variable
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	95                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x50f:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	97                      # DW_AT_decl_line
	.long	120                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x51a:0xb DW_TAG_variable
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	104                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x525:0xb DW_TAG_variable
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	109                     # DW_AT_decl_line
	.long	120                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x530:0xb DW_TAG_variable
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	112                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x53b:0xb DW_TAG_variable
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	118                     # DW_AT_decl_line
	.long	120                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x546:0x13 DW_TAG_inlined_subroutine
	.long	85                      # DW_AT_abstract_origin
	.quad	.Ltmp82                 # DW_AT_low_pc
	.long	.Ltmp84-.Ltmp82         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	210                     # DW_AT_call_line
	.byte	27                      # Abbrev [27] 0x559:0x14 DW_TAG_inlined_subroutine
	.long	348                     # DW_AT_abstract_origin
	.quad	.Ltmp85                 # DW_AT_low_pc
	.long	.Ltmp86-.Ltmp85         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	213                     # DW_AT_call_line
	.byte	1                       # DW_AT_GNU_discriminator
	.byte	28                      # Abbrev [28] 0x56d:0x84 DW_TAG_inlined_subroutine
	.long	590                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	226                     # DW_AT_call_line
	.byte	20                      # Abbrev [20] 0x578:0xc DW_TAG_formal_parameter
	.byte	6                       # DW_AT_location
	.byte	16
	.byte	0
	.byte	159
	.byte	157
	.byte	1
	.byte	0
	.long	613                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x584:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc53           # DW_AT_location
	.long	624                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x58d:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc54           # DW_AT_location
	.long	635                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x596:0x9 DW_TAG_variable
	.long	.Ldebug_loc43           # DW_AT_location
	.long	646                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x59f:0x9 DW_TAG_variable
	.long	.Ldebug_loc44           # DW_AT_location
	.long	657                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x5a8:0x9 DW_TAG_variable
	.long	.Ldebug_loc45           # DW_AT_location
	.long	668                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x5b1:0x9 DW_TAG_variable
	.long	.Ldebug_loc46           # DW_AT_location
	.long	679                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x5ba:0x9 DW_TAG_variable
	.long	.Ldebug_loc47           # DW_AT_location
	.long	690                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x5c3:0x9 DW_TAG_variable
	.long	.Ldebug_loc48           # DW_AT_location
	.long	701                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x5cc:0x9 DW_TAG_variable
	.long	.Ldebug_loc49           # DW_AT_location
	.long	712                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x5d5:0x9 DW_TAG_variable
	.long	.Ldebug_loc50           # DW_AT_location
	.long	723                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x5de:0x9 DW_TAG_variable
	.long	.Ldebug_loc51           # DW_AT_location
	.long	734                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x5e7:0x9 DW_TAG_variable
	.long	.Ldebug_loc52           # DW_AT_location
	.long	745                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	29                      # Abbrev [29] 0x5f1:0x15 DW_TAG_inlined_subroutine
	.long	348                     # DW_AT_abstract_origin
	.quad	.Ltmp105                # DW_AT_low_pc
	.long	.Ltmp106-.Ltmp105       # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.short	265                     # DW_AT_call_line
	.byte	1                       # DW_AT_GNU_discriminator
	.byte	29                      # Abbrev [29] 0x606:0x15 DW_TAG_inlined_subroutine
	.long	348                     # DW_AT_abstract_origin
	.quad	.Ltmp118                # DW_AT_low_pc
	.long	.Ltmp119-.Ltmp118       # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.short	297                     # DW_AT_call_line
	.byte	1                       # DW_AT_GNU_discriminator
	.byte	29                      # Abbrev [29] 0x61b:0x15 DW_TAG_inlined_subroutine
	.long	348                     # DW_AT_abstract_origin
	.quad	.Ltmp120                # DW_AT_low_pc
	.long	.Ltmp121-.Ltmp120       # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.short	299                     # DW_AT_call_line
	.byte	1                       # DW_AT_GNU_discriminator
	.byte	0                       # End Of Children Mark
	.byte	30                      # Abbrev [30] 0x631:0x2cf DW_TAG_subprogram
	.quad	.Lfunc_begin6           # DW_AT_low_pc
	.long	.Lfunc_end6-.Lfunc_begin6 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	306                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	2309                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	31                      # Abbrev [31] 0x64b:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc55           # DW_AT_location
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	306                     # DW_AT_decl_line
	.long	2309                    # DW_AT_type
	.byte	31                      # Abbrev [31] 0x65b:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc56           # DW_AT_location
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	306                     # DW_AT_decl_line
	.long	2316                    # DW_AT_type
	.byte	32                      # Abbrev [32] 0x66b:0x10 DW_TAG_variable
	.long	.Ldebug_loc57           # DW_AT_location
	.long	.Linfo_string66         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	341                     # DW_AT_decl_line
	.long	790                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x67b:0x10 DW_TAG_variable
	.long	.Ldebug_loc58           # DW_AT_location
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	340                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x68b:0x10 DW_TAG_variable
	.long	.Ldebug_loc59           # DW_AT_location
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	337                     # DW_AT_decl_line
	.long	790                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x69b:0x10 DW_TAG_variable
	.long	.Ldebug_loc60           # DW_AT_location
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	336                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x6ab:0x10 DW_TAG_variable
	.long	.Ldebug_loc61           # DW_AT_location
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	333                     # DW_AT_decl_line
	.long	790                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x6bb:0x10 DW_TAG_variable
	.long	.Ldebug_loc62           # DW_AT_location
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	332                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x6cb:0x10 DW_TAG_variable
	.long	.Ldebug_loc63           # DW_AT_location
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	330                     # DW_AT_decl_line
	.long	790                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x6db:0x10 DW_TAG_variable
	.long	.Ldebug_loc64           # DW_AT_location
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	329                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	33                      # Abbrev [33] 0x6eb:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	327                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x6f8:0x10 DW_TAG_variable
	.long	.Ldebug_loc65           # DW_AT_location
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	326                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	34                      # Abbrev [34] 0x708:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	325                     # DW_AT_decl_line
	.long	790                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x715:0x10 DW_TAG_variable
	.long	.Ldebug_loc66           # DW_AT_location
	.long	.Linfo_string75         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	324                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x725:0x10 DW_TAG_variable
	.long	.Ldebug_loc67           # DW_AT_location
	.long	.Linfo_string76         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	322                     # DW_AT_decl_line
	.long	790                     # DW_AT_type
	.byte	33                      # Abbrev [33] 0x735:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	320                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	33                      # Abbrev [33] 0x742:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	319                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	34                      # Abbrev [34] 0x74f:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string77         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	318                     # DW_AT_decl_line
	.long	790                     # DW_AT_type
	.byte	33                      # Abbrev [33] 0x75c:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string78         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	317                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	33                      # Abbrev [33] 0x769:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	316                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x776:0x10 DW_TAG_variable
	.long	.Ldebug_loc68           # DW_AT_location
	.long	.Linfo_string80         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	315                     # DW_AT_decl_line
	.long	790                     # DW_AT_type
	.byte	33                      # Abbrev [33] 0x786:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string81         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	314                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x793:0x10 DW_TAG_variable
	.long	.Ldebug_loc69           # DW_AT_location
	.long	.Linfo_string82         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	314                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x7a3:0x10 DW_TAG_variable
	.long	.Ldebug_loc70           # DW_AT_location
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	312                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x7b3:0x10 DW_TAG_variable
	.long	.Ldebug_loc71           # DW_AT_location
	.long	.Linfo_string83         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	311                     # DW_AT_decl_line
	.long	790                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x7c3:0x10 DW_TAG_variable
	.long	.Ldebug_loc72           # DW_AT_location
	.long	.Linfo_string84         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	310                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x7d3:0x10 DW_TAG_variable
	.long	.Ldebug_loc73           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	308                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x7e3:0x10 DW_TAG_variable
	.long	.Ldebug_loc74           # DW_AT_location
	.long	.Linfo_string85         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	314                     # DW_AT_decl_line
	.long	2333                    # DW_AT_type
	.byte	32                      # Abbrev [32] 0x7f3:0x10 DW_TAG_variable
	.long	.Ldebug_loc75           # DW_AT_location
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	317                     # DW_AT_decl_line
	.long	2338                    # DW_AT_type
	.byte	32                      # Abbrev [32] 0x803:0x10 DW_TAG_variable
	.long	.Ldebug_loc76           # DW_AT_location
	.long	.Linfo_string86         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	307                     # DW_AT_decl_line
	.long	2338                    # DW_AT_type
	.byte	32                      # Abbrev [32] 0x813:0x10 DW_TAG_variable
	.long	.Ldebug_loc77           # DW_AT_location
	.long	.Linfo_string87         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	313                     # DW_AT_decl_line
	.long	2338                    # DW_AT_type
	.byte	32                      # Abbrev [32] 0x823:0x10 DW_TAG_variable
	.long	.Ldebug_loc78           # DW_AT_location
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	329                     # DW_AT_decl_line
	.long	2338                    # DW_AT_type
	.byte	32                      # Abbrev [32] 0x833:0x10 DW_TAG_variable
	.long	.Ldebug_loc79           # DW_AT_location
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	332                     # DW_AT_decl_line
	.long	2338                    # DW_AT_type
	.byte	32                      # Abbrev [32] 0x843:0x10 DW_TAG_variable
	.long	.Ldebug_loc80           # DW_AT_location
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	336                     # DW_AT_decl_line
	.long	2338                    # DW_AT_type
	.byte	32                      # Abbrev [32] 0x853:0x10 DW_TAG_variable
	.long	.Ldebug_loc81           # DW_AT_location
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	340                     # DW_AT_decl_line
	.long	2338                    # DW_AT_type
	.byte	35                      # Abbrev [35] 0x863:0xc DW_TAG_variable
	.long	.Linfo_string89         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	309                     # DW_AT_decl_line
	.long	2304                    # DW_AT_type
	.byte	35                      # Abbrev [35] 0x86f:0xc DW_TAG_variable
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	321                     # DW_AT_decl_line
	.long	120                     # DW_AT_type
	.byte	35                      # Abbrev [35] 0x87b:0xc DW_TAG_variable
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	323                     # DW_AT_decl_line
	.long	2304                    # DW_AT_type
	.byte	35                      # Abbrev [35] 0x887:0xc DW_TAG_variable
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	328                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	35                      # Abbrev [35] 0x893:0xc DW_TAG_variable
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	331                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	35                      # Abbrev [35] 0x89f:0xc DW_TAG_variable
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	334                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	35                      # Abbrev [35] 0x8ab:0xc DW_TAG_variable
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	335                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	35                      # Abbrev [35] 0x8b7:0xc DW_TAG_variable
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	338                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	35                      # Abbrev [35] 0x8c3:0xc DW_TAG_variable
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	339                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	16                      # Abbrev [16] 0x8cf:0x30 DW_TAG_lexical_block
	.quad	.Ltmp152                # DW_AT_low_pc
	.long	.Ltmp158-.Ltmp152       # DW_AT_high_pc
	.byte	33                      # Abbrev [33] 0x8dc:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string88         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	370                     # DW_AT_decl_line
	.long	2309                    # DW_AT_type
	.byte	29                      # Abbrev [29] 0x8e9:0x15 DW_TAG_inlined_subroutine
	.long	85                      # DW_AT_abstract_origin
	.quad	.Ltmp155                # DW_AT_low_pc
	.long	.Ltmp156-.Ltmp155       # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.short	370                     # DW_AT_call_line
	.byte	3                       # DW_AT_GNU_discriminator
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0x900:0x5 DW_TAG_pointer_type
	.long	120                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x905:0x7 DW_TAG_base_type
	.long	.Linfo_string33         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	9                       # Abbrev [9] 0x90c:0x5 DW_TAG_pointer_type
	.long	2321                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0x911:0x5 DW_TAG_pointer_type
	.long	2326                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x916:0x7 DW_TAG_base_type
	.long	.Linfo_string65         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	9                       # Abbrev [9] 0x91d:0x5 DW_TAG_pointer_type
	.long	2338                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0x922:0x5 DW_TAG_pointer_type
	.long	165                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.quad	.Ltmp93-.Lfunc_begin0
	.quad	.Ltmp98-.Lfunc_begin0
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
	.long	2344                    # Compilation Unit Length
	.long	590                     # DIE offset
	.asciz	"conflict"              # External Name
	.long	348                     # DIE offset
	.asciz	"free_POS"              # External Name
	.long	311                     # DIE offset
	.asciz	"printf_POS"            # External Name
	.long	797                     # DIE offset
	.asciz	"run"                   # External Name
	.long	1585                    # DIE offset
	.asciz	"main"                  # External Name
	.long	172                     # DIE offset
	.asciz	"copy_array_POS"        # External Name
	.long	85                      # DIE offset
	.asciz	"copy_POS"              # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	2344                    # Compilation Unit Length
	.long	125                     # DIE offset
	.asciz	"POS"                   # External Name
	.long	165                     # DIE offset
	.asciz	"long long int"         # External Name
	.long	790                     # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	2309                    # DIE offset
	.asciz	"int"                   # External Name
	.long	2326                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git 83402ed45b681e9f38ce6626e5899c19159ceb29) (http://llvm.org/git/llvm.git 4fc8e6fd79f212952e8f538b6d5d9d78098b4505)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
