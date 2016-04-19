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
	.loc	1 10 15 is_stmt 1 discriminator 1 # NQueens.c:10:15
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
.Ltmp22:
	.loc	1 4 21                  # NQueens.c:4:21
	movups	(%r13), %xmm0
	.loc	1 4 13 is_stmt 0        # NQueens.c:4:13
	movups	%xmm0, (%rax)
.Ltmp23:
	.loc	1 11 14 is_stmt 1       # NQueens.c:11:14
	movq	%rax, (%rbx)
.Ltmp24:
	.loc	1 10 2 discriminator 1  # NQueens.c:10:2
	addq	$8, %rbx
	addq	$8, %r12
	decq	%r14
	jne	.LBB1_2
.Ltmp25:
.LBB1_3:                                # %for.cond.cleanup
	.loc	1 13 2                  # NQueens.c:13:2
	movq	%r15, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
.Ltmp26:
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
.Ltmp27:
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
.Ltmp28:
	.cfi_def_cfa_offset 16
.Ltmp29:
	.cfi_offset %rbx, -16
	#DEBUG_VALUE: printf_POS:pos <- %RDI
	movq	%rdi, %rbx
.Ltmp30:
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
.Ltmp31:
	jmp	putchar                 # TAILCALL
.Ltmp32:
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
	movq	(%rdi), %rsi
	movq	8(%rdi), %rdi
	subq	%rcx, %rdi
	setg	%r8b
	setl	%r10b
	setne	%r9b
	subq	%rdx, %rsi
	setg	%cl
	setl	%dl
	movl	$1, %eax
	testb	%r10b, %dl
	jne	.LBB4_3
# BB#1:                                 # %entry
	andb	%r9b, %cl
	jne	.LBB4_3
# BB#2:                                 # %entry
	andb	%r8b, %dl
	je	.LBB4_4
.LBB4_3:                                # %polly.stmt.blklab0
.Ltmp33:
	.loc	1 61 7 prologue_end     # NQueens.c:61:7
	movq	%rdi, %rax
	negq	%rax
	cmovlq	%rdi, %rax
	.loc	1 67 7                  # NQueens.c:67:7
	movq	%rsi, %rcx
	negq	%rcx
	cmovlq	%rsi, %rcx
.Ltmp34:
	.loc	1 73 12                 # NQueens.c:73:12
	cmpq	%rcx, %rax
	sete	%al
.Ltmp35:
	.loc	1 81 2                  # NQueens.c:81:2
	movzbl	%al, %eax
.LBB4_4:                                # %polly.exiting
	.loc	1 87 1                  # NQueens.c:87:1
	retq
.Ltmp36:
.Lfunc_end4:
	.size	conflict, .Lfunc_end4-conflict
	.cfi_endproc

	.globl	run
	.p2align	4, 0x90
	.type	run,@function
run:                                    # @run
.Lfunc_begin5:
	.loc	1 89 0                  # NQueens.c:89:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp37:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp38:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp39:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp40:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp41:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp42:
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
.Ltmp43:
	.cfi_def_cfa_offset 112
.Ltmp44:
	.cfi_offset %rbx, -56
.Ltmp45:
	.cfi_offset %r12, -48
.Ltmp46:
	.cfi_offset %r13, -40
.Ltmp47:
	.cfi_offset %r14, -32
.Ltmp48:
	.cfi_offset %r15, -24
.Ltmp49:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: run:queens <- %RDI
	#DEBUG_VALUE: run:queens_size <- %RSI
	#DEBUG_VALUE: run:queens_has_ownership [bit_piece offset=0 size=1] <- %EDX
	#DEBUG_VALUE: run:n <- %RCX
	#DEBUG_VALUE: run:dim <- %R8
.Ltmp50:
	#DEBUG_VALUE: run:_12 <- %RSI
	#DEBUG_VALUE: run:_13 <- %RSI
	movq	%r8, 32(%rsp)           # 8-byte Spill
	movq	%rcx, %r15
.Ltmp51:
	#DEBUG_VALUE: run:n <- %R15
	movq	%rdi, 40(%rsp)          # 8-byte Spill
.Ltmp52:
	#DEBUG_VALUE: run:_32 <- 0
	#DEBUG_VALUE: run:_31 <- 0
	#DEBUG_VALUE: run:_30 <- 0
	#DEBUG_VALUE: run:_29 <- 0
	#DEBUG_VALUE: run:_28 <- 0
	#DEBUG_VALUE: run:_27 <- 0
	#DEBUG_VALUE: run:_26_has_ownership <- 0
	#DEBUG_VALUE: run:_24 <- 0
	#DEBUG_VALUE: run:_23 <- 0
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
	#DEBUG_VALUE: run:queens <- [%RSP+40]
	movl	$1, %ebp
.Ltmp53:
	.loc	1 124 8 prologue_end    # NQueens.c:124:8
	cmpq	%r15, %r8
	je	.LBB5_9
.Ltmp54:
# BB#1:                                 # %while.cond.preheader
	#DEBUG_VALUE: run:queens <- [%RSP+40]
	#DEBUG_VALUE: run:n <- %R15
	#DEBUG_VALUE: run:dim <- %R8
	#DEBUG_VALUE: run:queens_has_ownership [bit_piece offset=0 size=1] <- %EDX
	#DEBUG_VALUE: run:queens_size <- %RSI
	.loc	1 151 7                 # NQueens.c:151:7
	cmpq	%rsi, %r15
	jge	.LBB5_24
.Ltmp55:
# BB#2:                                 # %while.cond.preheader
	#DEBUG_VALUE: run:queens_size <- %RSI
	#DEBUG_VALUE: run:queens_has_ownership [bit_piece offset=0 size=1] <- %EDX
	#DEBUG_VALUE: run:dim <- %R8
	#DEBUG_VALUE: run:n <- %R15
	#DEBUG_VALUE: run:queens <- [%RSP+40]
	cmpq	%rsi, %r8
	jne	.LBB5_24
.Ltmp56:
# BB#3:                                 # %blklab10.preheader
	#DEBUG_VALUE: run:queens <- [%RSP+40]
	#DEBUG_VALUE: run:n <- %R15
	#DEBUG_VALUE: run:dim <- %R8
	#DEBUG_VALUE: run:queens_has_ownership [bit_piece offset=0 size=1] <- %EDX
	#DEBUG_VALUE: run:queens_size <- %RSI
	xorl	%ebx, %ebx
	xorl	%r13d, %r13d
.Ltmp57:
	.loc	1 166 9                 # NQueens.c:166:9
	testq	%r8, %r8
	jle	.LBB5_4
.Ltmp58:
# BB#10:
	#DEBUG_VALUE: run:queens_size <- %RSI
	#DEBUG_VALUE: run:queens_has_ownership [bit_piece offset=0 size=1] <- %EDX
	#DEBUG_VALUE: run:dim <- %R8
	#DEBUG_VALUE: run:n <- %R15
	#DEBUG_VALUE: run:queens <- [%RSP+40]
	.loc	1 258 8                 # NQueens.c:258:8
	leaq	1(%r15), %rax
.Ltmp59:
	#DEBUG_VALUE: run:_29 <- [%RSP+48]
	movq	%rax, 48(%rsp)          # 8-byte Spill
                                        # implicit-def: %R14
                                        # implicit-def: %RBP
	xorl	%eax, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
                                        # implicit-def: %RAX
	movq	%rax, 8(%rsp)           # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 16(%rsp)          # 8-byte Spill
.Ltmp60:
	.p2align	4, 0x90
.LBB5_23:                               # %blklab14.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_15 Depth 2
	movq	%rbx, 24(%rsp)          # 8-byte Spill
	testq	%r15, %r15
	movl	$0, %r12d
	jle	.LBB5_12
	.p2align	4, 0x90
.LBB5_15:                               # %if.end35.us
                                        #   Parent Loop BB5_23 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp61:
	.loc	1 206 19                # NQueens.c:206:19
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	(%rax,%r12,8), %rbx
.Ltmp62:
	#DEBUG_VALUE: copy_POS:_POS <- %RBX
	.loc	1 3 17 discriminator 1  # NQueens.c:3:17
	movl	$16, %edi
	callq	malloc
	movq	%rax, %rbp
.Ltmp63:
	.loc	1 4 21                  # NQueens.c:4:21
	movq	(%rbx), %rax
	.loc	1 4 13 is_stmt 0        # NQueens.c:4:13
	movq	%rax, (%rbp)
	.loc	1 5 21 is_stmt 1        # NQueens.c:5:21
	movq	8(%rbx), %rcx
.Ltmp64:
	#DEBUG_VALUE: run:_19_has_ownership <- 1
	.loc	1 5 13 is_stmt 0        # NQueens.c:5:13
	movq	%rcx, 8(%rbp)
.Ltmp65:
	.loc	1 209 4 is_stmt 1       # NQueens.c:209:4
	testb	$1, %r13b
	je	.LBB5_17
.Ltmp66:
# BB#16:                                # %if.then38.us
                                        #   in Loop: Header=BB5_15 Depth=2
	#DEBUG_VALUE: copy_POS:_POS <- %RBX
	.loc	1 16 2                  # NQueens.c:16:2
	movq	%r14, %rdi
	callq	free
.Ltmp67:
	#DEBUG_VALUE: run:p_has_ownership <- 0
	.loc	1 215 10                # NQueens.c:215:10
	movq	(%rbp), %rax
	movq	8(%rbp), %rcx
.Ltmp68:
.LBB5_17:                               # %if.end39.us
                                        #   in Loop: Header=BB5_15 Depth=2
	#DEBUG_VALUE: copy_POS:_POS <- %RBX
	#DEBUG_VALUE: run:p_has_ownership <- 1
	#DEBUG_VALUE: run:_19_has_ownership <- 0
	subq	24(%rsp), %rcx          # 8-byte Folded Reload
	setg	%sil
	setl	%dl
	setne	%dil
	subq	%r15, %rax
	setg	%r8b
	setl	%bl
.Ltmp69:
	movb	$1, %r13b
	testb	%dl, %bl
	jne	.LBB5_20
# BB#18:                                # %if.end39.us
                                        #   in Loop: Header=BB5_15 Depth=2
	andb	%dil, %r8b
	jne	.LBB5_20
# BB#19:                                # %if.end39.us
                                        #   in Loop: Header=BB5_15 Depth=2
	andb	%sil, %bl
	je	.LBB5_21
.LBB5_20:                               # %conflict.exit.us
                                        #   in Loop: Header=BB5_15 Depth=2
.Ltmp70:
	.loc	1 61 7                  # NQueens.c:61:7
	movq	%rcx, %rdx
	negq	%rdx
	cmovlq	%rcx, %rdx
	.loc	1 67 7                  # NQueens.c:67:7
	movq	%rax, %rcx
	negq	%rcx
.Ltmp71:
	#DEBUG_VALUE: run:_21 <- 1
	#DEBUG_VALUE: run:_23 <- 1
	cmovlq	%rax, %rcx
.Ltmp72:
	#DEBUG_VALUE: run:_17 <- 0
	.loc	1 219 7                 # NQueens.c:219:7
	cmpq	%rcx, %rdx
	je	.LBB5_21
# BB#11:                                # %blklab14.us
                                        #   in Loop: Header=BB5_15 Depth=2
	.loc	1 235 9                 # NQueens.c:235:9
	incq	%r12
.Ltmp73:
	#DEBUG_VALUE: run:_24 <- %R12
	#DEBUG_VALUE: run:i <- %R12
	movb	$1, %r13b
.Ltmp74:
	.loc	1 203 8                 # NQueens.c:203:8
	cmpq	%r15, %r12
	movq	%rbp, %r14
	jl	.LBB5_15
.Ltmp75:
.LBB5_12:                               # %if.end46.us
                                        #   in Loop: Header=BB5_23 Depth=1
	#DEBUG_VALUE: run:_25 <- 1
	.loc	1 248 3                 # NQueens.c:248:3
	movq	16(%rsp), %rax          # 8-byte Reload
	testb	$1, %al
	je	.LBB5_14
# BB#13:                                # %if.then48.us
                                        #   in Loop: Header=BB5_23 Depth=1
.Ltmp76:
	.loc	1 16 2                  # NQueens.c:16:2
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	free
.Ltmp77:
	#DEBUG_VALUE: run:_26_has_ownership <- 0
.LBB5_14:                               # %if.end49.us
                                        #   in Loop: Header=BB5_23 Depth=1
	.loc	1 249 9                 # NQueens.c:249:9
	movl	$16, %edi
	callq	malloc
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movq	24(%rsp), %rbx          # 8-byte Reload
	.loc	1 250 10                # NQueens.c:250:10
	movq	%rbx, 8(%rax)
.Ltmp78:
	#DEBUG_VALUE: run:_26_has_ownership <- 1
	.loc	1 251 10                # NQueens.c:251:10
	movq	%r15, (%rax)
	movq	40(%rsp), %rdi          # 8-byte Reload
	.loc	1 254 13                # NQueens.c:254:13
	movq	%rax, (%rdi,%r15,8)
.Ltmp79:
	#DEBUG_VALUE: run:queens_has_ownership <- 1
	#DEBUG_VALUE: run:_28 <- 1
	.loc	1 261 9                 # NQueens.c:261:9
	xorl	%edx, %edx
	movq	32(%rsp), %r12          # 8-byte Reload
	movq	%r12, %rsi
	movq	48(%rsp), %rcx          # 8-byte Reload
	movq	%r12, %r8
	callq	run
.Ltmp80:
	#DEBUG_VALUE: run:_27 <- [%RSP+0]
	.loc	1 263 20                # NQueens.c:263:20
	addq	%rax, (%rsp)            # 8-byte Folded Spill
.Ltmp81:
	#DEBUG_VALUE: run:_30 <- [%RSP+0]
	#DEBUG_VALUE: run:num_solutions <- [%RSP+0]
	movb	$1, %al
	.loc	1 265 3                 # NQueens.c:265:3
	movq	%rax, 16(%rsp)          # 8-byte Spill
	jmp	.LBB5_22
.Ltmp82:
	.p2align	4, 0x90
.LBB5_21:                               #   in Loop: Header=BB5_23 Depth=1
	movq	%rbp, %r14
	movq	32(%rsp), %r12          # 8-byte Reload
	movq	24(%rsp), %rbx          # 8-byte Reload
.LBB5_22:                               # %blklab19.us
                                        #   in Loop: Header=BB5_23 Depth=1
.Ltmp83:
	#DEBUG_VALUE: run:_31 <- 1
	.loc	1 271 10                # NQueens.c:271:10
	incq	%rbx
.Ltmp84:
	#DEBUG_VALUE: run:_32 <- %RBX
	#DEBUG_VALUE: run:col <- %RBX
	.loc	1 166 6                 # NQueens.c:166:6
	cmpq	%r12, %rbx
	jl	.LBB5_23
	jmp	.LBB5_5
.Ltmp85:
.LBB5_4:
	#DEBUG_VALUE: run:queens_size <- %RSI
	#DEBUG_VALUE: run:queens_has_ownership [bit_piece offset=0 size=1] <- %EDX
	#DEBUG_VALUE: run:dim <- %R8
	#DEBUG_VALUE: run:n <- %R15
	#DEBUG_VALUE: run:queens <- [%RSP+40]
                                        # implicit-def: %RBP
	xorl	%eax, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
                                        # implicit-def: %RAX
	movq	%rax, 8(%rsp)           # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 16(%rsp)          # 8-byte Spill
.Ltmp86:
.LBB5_5:                                # %blklab8
	.loc	1 280 2                 # NQueens.c:280:2
	testb	$1, %r13b
	je	.LBB5_7
# BB#6:                                 # %if.then57
.Ltmp87:
	.loc	1 16 2                  # NQueens.c:16:2
	movq	%rbp, %rdi
	callq	free
.Ltmp88:
	#DEBUG_VALUE: run:p_has_ownership <- 0
.LBB5_7:                                # %if.end61
	.loc	1 282 2                 # NQueens.c:282:2
	movq	16(%rsp), %rax          # 8-byte Reload
	testb	$1, %al
	movq	(%rsp), %rbp            # 8-byte Reload
	je	.LBB5_9
# BB#8:                                 # %if.then63
.Ltmp89:
	.loc	1 16 2                  # NQueens.c:16:2
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	free
.Ltmp90:
	#DEBUG_VALUE: run:_26_has_ownership <- 0
.LBB5_9:                                # %cleanup
	.loc	1 287 1 discriminator 2 # NQueens.c:287:1
	movq	%rbp, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB5_24:                               # %blklab11
.Ltmp91:
	#DEBUG_VALUE: run:queens_size <- %RSI
	#DEBUG_VALUE: run:queens_has_ownership [bit_piece offset=0 size=1] <- %EDX
	#DEBUG_VALUE: run:dim <- %R8
	#DEBUG_VALUE: run:n <- %R15
	#DEBUG_VALUE: run:queens <- [%RSP+40]
	.loc	1 159 12                # NQueens.c:159:12
	movq	stderr(%rip), %rcx
	.loc	1 159 4 is_stmt 0       # NQueens.c:159:4
	movl	$.L.str.5, %edi
	movl	$4, %esi
.Ltmp92:
	movl	$1, %edx
.Ltmp93:
	callq	fwrite
.Ltmp94:
	.loc	1 160 4 is_stmt 1       # NQueens.c:160:4
	movl	$-1, %edi
	callq	exit
.Ltmp95:
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
	.loc	1 289 0                 # NQueens.c:289:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp96:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp97:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp98:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp99:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp100:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp101:
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
.Ltmp102:
	.cfi_def_cfa_offset 80
.Ltmp103:
	.cfi_offset %rbx, -56
.Ltmp104:
	.cfi_offset %r12, -48
.Ltmp105:
	.cfi_offset %r13, -40
.Ltmp106:
	.cfi_offset %r14, -32
.Ltmp107:
	.cfi_offset %r15, -24
.Ltmp108:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
	movl	%edi, %ebx
.Ltmp109:
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
	.loc	1 326 2 prologue_end    # NQueens.c:326:2
	callq	convertArgsToIntArray
.Ltmp110:
	movq	%rax, %rbp
.Ltmp111:
	#DEBUG_VALUE: main:_6 <- %RBP
	decl	%ebx
.Ltmp112:
	movslq	%ebx, %rbx
.Ltmp113:
	#DEBUG_VALUE: main:_6_has_ownership <- 1
	#DEBUG_VALUE: main:_6_size <- %EBX
	.loc	1 331 5                 # NQueens.c:331:5
	movq	(%rbp), %rdi
.Ltmp114:
	#DEBUG_VALUE: main:_8 <- %RDI
	.loc	1 333 2                 # NQueens.c:333:2
	callq	parseStringToInt
.Ltmp115:
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_5 <- %RAX
	.loc	1 337 9                 # NQueens.c:337:9
	testq	%rax, %rax
.Ltmp116:
	.loc	1 337 5 is_stmt 0       # NQueens.c:337:5
	je	.LBB6_5
.Ltmp117:
# BB#1:                                 # %if.end
	#DEBUG_VALUE: main:_5 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_6_size <- %EBX
	#DEBUG_VALUE: main:_6 <- %RBP
	movq	%rbx, 8(%rsp)           # 8-byte Spill
	movq	%rbp, 16(%rsp)          # 8-byte Spill
	.loc	1 339 6 is_stmt 1       # NQueens.c:339:6
	movq	(%rax), %r13
.Ltmp118:
	#DEBUG_VALUE: main:_12_size <- %R13
	#DEBUG_VALUE: main:_11_has_ownership <- 1
	#DEBUG_VALUE: main:_10 <- 0
	#DEBUG_VALUE: main:_9 <- 0
	#DEBUG_VALUE: main:init_size <- %R13
	#DEBUG_VALUE: main:n <- %R13
	.loc	1 352 16                # NQueens.c:352:16
	leaq	(,%r13,8), %rdi
	.loc	1 352 8 is_stmt 0       # NQueens.c:352:8
	callq	malloc
.Ltmp119:
	movq	%rax, %r12
.Ltmp120:
	#DEBUG_VALUE: _12_i <- 0
	.loc	1 353 2 is_stmt 1 discriminator 1 # NQueens.c:353:2
	testq	%r13, %r13
	jle	.LBB6_4
.Ltmp121:
# BB#2:
	#DEBUG_VALUE: main:_6 <- %RBP
	#DEBUG_VALUE: main:_6_size <- %EBX
	#DEBUG_VALUE: main:n <- %R13
	#DEBUG_VALUE: main:init_size <- %R13
	#DEBUG_VALUE: main:_12_size <- %R13
	movq	%r12, %rbx
.Ltmp122:
	movq	%r13, %rbp
.Ltmp123:
	.p2align	4, 0x90
.LBB6_3:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 3 17 discriminator 1  # NQueens.c:3:17
	movl	$16, %edi
	callq	malloc
.Ltmp124:
	.loc	1 5 13                  # NQueens.c:5:13
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%rax)
.Ltmp125:
	.loc	1 353 46 discriminator 3 # NQueens.c:353:46
	movq	%rax, (%rbx)
.Ltmp126:
	.loc	1 353 2 is_stmt 0 discriminator 1 # NQueens.c:353:2
	addq	$8, %rbx
	decq	%rbp
	jne	.LBB6_3
.Ltmp127:
.LBB6_4:                                # %if.then92
	#DEBUG_VALUE: main:init_has_ownership <- 1
	#DEBUG_VALUE: main:_12_has_ownership <- 0
	#DEBUG_VALUE: main:_14 <- 0
	.loc	1 365 8 is_stmt 1       # NQueens.c:365:8
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%r13, %r8
	callq	run
	movq	%rax, %r15
.Ltmp128:
	#DEBUG_VALUE: main:_17_size <- 33
	#DEBUG_VALUE: main:_13 <- %R15
	#DEBUG_VALUE: main:num_solutions <- %R15
	.loc	1 372 2                 # NQueens.c:372:2
	movl	$264, %edi              # imm = 0x108
	callq	malloc
	movq	%rax, %rbx
.Ltmp129:
	#DEBUG_VALUE: main:_17 <- %RBX
	.loc	1 373 9                 # NQueens.c:373:9
	movaps	.LCPI6_0(%rip), %xmm0   # xmm0 = [78,45]
	movups	%xmm0, (%rbx)
	.loc	1 373 35 is_stmt 0      # NQueens.c:373:35
	movaps	.LCPI6_1(%rip), %xmm0   # xmm0 = [81,117]
	movups	%xmm0, 16(%rbx)
	.loc	1 373 62                # NQueens.c:373:62
	movaps	.LCPI6_2(%rip), %xmm0   # xmm0 = [101,101]
	movups	%xmm0, 32(%rbx)
	.loc	1 373 90                # NQueens.c:373:90
	movaps	.LCPI6_3(%rip), %xmm0   # xmm0 = [110,32]
	movups	%xmm0, 48(%rbx)
	.loc	1 373 117               # NQueens.c:373:117
	movaps	.LCPI6_4(%rip), %xmm0   # xmm0 = [80,114]
	movups	%xmm0, 64(%rbx)
	.loc	1 373 145               # NQueens.c:373:145
	movaps	.LCPI6_5(%rip), %xmm0   # xmm0 = [111,98]
	movups	%xmm0, 80(%rbx)
	.loc	1 373 174               # NQueens.c:373:174
	movaps	.LCPI6_6(%rip), %xmm0   # xmm0 = [108,101]
	movups	%xmm0, 96(%rbx)
	.loc	1 373 204               # NQueens.c:373:204
	movaps	.LCPI6_7(%rip), %xmm0   # xmm0 = [109,32]
	movups	%xmm0, 112(%rbx)
	.loc	1 373 233               # NQueens.c:373:233
	movaps	.LCPI6_8(%rip), %xmm0   # xmm0 = [111,110]
	movups	%xmm0, 128(%rbx)
	.loc	1 373 263               # NQueens.c:373:263
	movaps	.LCPI6_9(%rip), %xmm0   # xmm0 = [32,97]
	movups	%xmm0, 144(%rbx)
	.loc	1 373 291               # NQueens.c:373:291
	movaps	.LCPI6_10(%rip), %xmm0  # xmm0 = [32,78]
	movups	%xmm0, 160(%rbx)
	.loc	1 373 319               # NQueens.c:373:319
	movaps	.LCPI6_11(%rip), %xmm1  # xmm1 = [32,88]
	movups	%xmm1, 176(%rbx)
	.loc	1 373 347               # NQueens.c:373:347
	movups	%xmm0, 192(%rbx)
	.loc	1 373 375               # NQueens.c:373:375
	movaps	.LCPI6_12(%rip), %xmm0  # xmm0 = [32,66]
	movups	%xmm0, 208(%rbx)
	.loc	1 373 403               # NQueens.c:373:403
	movaps	.LCPI6_13(%rip), %xmm0  # xmm0 = [111,97]
	movups	%xmm0, 224(%rbx)
	.loc	1 373 432               # NQueens.c:373:432
	movaps	.LCPI6_14(%rip), %xmm0  # xmm0 = [114,100]
	movups	%xmm0, 240(%rbx)
	.loc	1 373 462               # NQueens.c:373:462
	movq	$46, 256(%rbx)
.Ltmp130:
	#DEBUG_VALUE: main:_17_has_ownership <- 1
	.loc	1 376 2 is_stmt 1       # NQueens.c:376:2
	movl	$33, %esi
	movq	%rbx, %rdi
	callq	println_s
.Ltmp131:
	#DEBUG_VALUE: main:_20_size <- 4
	.loc	1 381 2                 # NQueens.c:381:2
	movl	$32, %edi
	callq	malloc
	movq	%rax, %r14
.Ltmp132:
	#DEBUG_VALUE: main:_20 <- %R14
	.loc	1 382 9                 # NQueens.c:382:9
	movaps	.LCPI6_15(%rip), %xmm0  # xmm0 = [78,32]
	movups	%xmm0, (%r14)
	.loc	1 382 35 is_stmt 0      # NQueens.c:382:35
	movaps	.LCPI6_16(%rip), %xmm0  # xmm0 = [61,32]
	movups	%xmm0, 16(%r14)
.Ltmp133:
	#DEBUG_VALUE: main:_20_has_ownership <- 1
	.loc	1 385 2 is_stmt 1       # NQueens.c:385:2
	movl	$4, %esi
	movq	%r14, %rdi
	callq	printf_s
	.loc	1 389 2                 # NQueens.c:389:2
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	movq	%r13, %rsi
	callq	printf
.Ltmp134:
	#DEBUG_VALUE: main:_25_size <- 6
	.loc	1 394 2                 # NQueens.c:394:2
	movl	$48, %edi
	callq	malloc
	movq	%rax, %r13
.Ltmp135:
	#DEBUG_VALUE: main:_25 <- %R13
	.loc	1 395 9                 # NQueens.c:395:9
	movaps	.LCPI6_17(%rip), %xmm0  # xmm0 = [70,111]
	movups	%xmm0, (%r13)
	.loc	1 395 36 is_stmt 0      # NQueens.c:395:36
	movaps	.LCPI6_18(%rip), %xmm0  # xmm0 = [117,110]
	movups	%xmm0, 16(%r13)
	.loc	1 395 64                # NQueens.c:395:64
	movaps	.LCPI6_19(%rip), %xmm0  # xmm0 = [100,32]
	movups	%xmm0, 32(%r13)
.Ltmp136:
	#DEBUG_VALUE: main:_25_has_ownership <- 1
	.loc	1 398 2 is_stmt 1       # NQueens.c:398:2
	movl	$6, %esi
	movq	%r13, %rdi
	callq	printf_s
	.loc	1 402 2                 # NQueens.c:402:2
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	movq	%r15, %rsi
	callq	printf
.Ltmp137:
	#DEBUG_VALUE: main:_30_size <- 11
	.loc	1 407 2                 # NQueens.c:407:2
	movl	$88, %edi
	callq	malloc
	movq	%rax, %rbp
.Ltmp138:
	#DEBUG_VALUE: main:_30 <- %RBP
	.loc	1 408 9                 # NQueens.c:408:9
	movaps	.LCPI6_20(%rip), %xmm0  # xmm0 = [32,115]
	movups	%xmm0, (%rbp)
	.loc	1 408 36 is_stmt 0      # NQueens.c:408:36
	movaps	.LCPI6_21(%rip), %xmm0  # xmm0 = [111,108]
	movups	%xmm0, 16(%rbp)
	.loc	1 408 64                # NQueens.c:408:64
	movaps	.LCPI6_22(%rip), %xmm0  # xmm0 = [117,116]
	movups	%xmm0, 32(%rbp)
	.loc	1 408 92                # NQueens.c:408:92
	movaps	.LCPI6_23(%rip), %xmm0  # xmm0 = [105,111]
	movups	%xmm0, 48(%rbp)
	.loc	1 408 120               # NQueens.c:408:120
	movaps	.LCPI6_24(%rip), %xmm0  # xmm0 = [110,115]
	movups	%xmm0, 64(%rbp)
	.loc	1 408 149               # NQueens.c:408:149
	movq	$46, 80(%rbp)
.Ltmp139:
	#DEBUG_VALUE: main:_30_has_ownership <- 1
	.loc	1 411 2 is_stmt 1       # NQueens.c:411:2
	movl	$11, %esi
	movq	%rbp, %rdi
	callq	println_s
.Ltmp140:
	.loc	1 415 2 discriminator 1 # NQueens.c:415:2
	movq	%r12, %rdi
	callq	free
.Ltmp141:
	#DEBUG_VALUE: main:init_has_ownership <- 0
	.loc	1 416 2 discriminator 1 # NQueens.c:416:2
	movq	16(%rsp), %rdi          # 8-byte Reload
	movq	8(%rsp), %rsi           # 8-byte Reload
	callq	free2DArray
.Ltmp142:
	#DEBUG_VALUE: main:_11_has_ownership <- 0
	#DEBUG_VALUE: main:_6_has_ownership <- 0
	.loc	1 420 2 discriminator 1 # NQueens.c:420:2
	movq	%rbx, %rdi
	callq	free
.Ltmp143:
	#DEBUG_VALUE: main:_17_has_ownership <- 0
	.loc	1 421 2 discriminator 1 # NQueens.c:421:2
	movq	%r14, %rdi
	callq	free
.Ltmp144:
	#DEBUG_VALUE: main:_20_has_ownership <- 0
	.loc	1 422 2 discriminator 1 # NQueens.c:422:2
	movq	%r13, %rdi
	callq	free
.Ltmp145:
	#DEBUG_VALUE: main:_25_has_ownership <- 0
	.loc	1 423 2 discriminator 1 # NQueens.c:423:2
	movq	%rbp, %rdi
	callq	free
.Ltmp146:
	#DEBUG_VALUE: main:_30_has_ownership <- 0
	.loc	1 424 2                 # NQueens.c:424:2
	xorl	%edi, %edi
	callq	exit
.Ltmp147:
.LBB6_5:                                # %if.end117.critedge
	#DEBUG_VALUE: main:_5 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_6_size <- %EBX
	#DEBUG_VALUE: main:_6 <- %RBP
	.loc	1 416 2 discriminator 1 # NQueens.c:416:2
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	callq	free2DArray
.Ltmp148:
	#DEBUG_VALUE: main:_6_has_ownership <- 0
	.loc	1 424 2                 # NQueens.c:424:2
	xorl	%edi, %edi
	callq	exit
.Ltmp149:
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
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)" # string offset=0
.Linfo_string1:
	.asciz	"NQueens.c"             # string offset=165
.Linfo_string2:
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/NQueens/impl/autogenerate" # string offset=175
.Linfo_string3:
	.asciz	"copy_POS"              # string offset=240
.Linfo_string4:
	.asciz	"r"                     # string offset=249
.Linfo_string5:
	.asciz	"long long int"         # string offset=251
.Linfo_string6:
	.asciz	"c"                     # string offset=265
.Linfo_string7:
	.asciz	"POS"                   # string offset=267
.Linfo_string8:
	.asciz	"_POS"                  # string offset=271
.Linfo_string9:
	.asciz	"new_POS"               # string offset=276
.Linfo_string10:
	.asciz	"free_POS"              # string offset=284
.Linfo_string11:
	.asciz	"pos"                   # string offset=293
.Linfo_string12:
	.asciz	"conflict"              # string offset=297
.Linfo_string13:
	.asciz	"p"                     # string offset=306
.Linfo_string14:
	.asciz	"p_has_ownership"       # string offset=308
.Linfo_string15:
	.asciz	"_Bool"                 # string offset=324
.Linfo_string16:
	.asciz	"row"                   # string offset=330
.Linfo_string17:
	.asciz	"col"                   # string offset=334
.Linfo_string18:
	.asciz	"_3"                    # string offset=338
.Linfo_string19:
	.asciz	"colDiff"               # string offset=341
.Linfo_string20:
	.asciz	"rowDiff"               # string offset=349
.Linfo_string21:
	.asciz	"_8"                    # string offset=357
.Linfo_string22:
	.asciz	"_9"                    # string offset=360
.Linfo_string23:
	.asciz	"_10"                   # string offset=363
.Linfo_string24:
	.asciz	"_11"                   # string offset=367
.Linfo_string25:
	.asciz	"_12"                   # string offset=371
.Linfo_string26:
	.asciz	"_13"                   # string offset=375
.Linfo_string27:
	.asciz	"_14"                   # string offset=379
.Linfo_string28:
	.asciz	"_15"                   # string offset=383
.Linfo_string29:
	.asciz	"copy_array_POS"        # string offset=387
.Linfo_string30:
	.asciz	"printf_POS"            # string offset=402
.Linfo_string31:
	.asciz	"run"                   # string offset=413
.Linfo_string32:
	.asciz	"main"                  # string offset=417
.Linfo_string33:
	.asciz	"int"                   # string offset=422
.Linfo_string34:
	.asciz	"_POS_size"             # string offset=426
.Linfo_string35:
	.asciz	"i"                     # string offset=436
.Linfo_string36:
	.asciz	"queens"                # string offset=438
.Linfo_string37:
	.asciz	"queens_size"           # string offset=445
.Linfo_string38:
	.asciz	"queens_has_ownership"  # string offset=457
.Linfo_string39:
	.asciz	"n"                     # string offset=478
.Linfo_string40:
	.asciz	"dim"                   # string offset=480
.Linfo_string41:
	.asciz	"_32"                   # string offset=484
.Linfo_string42:
	.asciz	"_31"                   # string offset=488
.Linfo_string43:
	.asciz	"_30"                   # string offset=492
.Linfo_string44:
	.asciz	"_29"                   # string offset=496
.Linfo_string45:
	.asciz	"_28"                   # string offset=500
.Linfo_string46:
	.asciz	"_27"                   # string offset=504
.Linfo_string47:
	.asciz	"_26_has_ownership"     # string offset=508
.Linfo_string48:
	.asciz	"_24"                   # string offset=526
.Linfo_string49:
	.asciz	"_23"                   # string offset=530
.Linfo_string50:
	.asciz	"_19_has_ownership"     # string offset=534
.Linfo_string51:
	.asciz	"_18"                   # string offset=552
.Linfo_string52:
	.asciz	"_17"                   # string offset=556
.Linfo_string53:
	.asciz	"_16"                   # string offset=560
.Linfo_string54:
	.asciz	"num_solutions"         # string offset=564
.Linfo_string55:
	.asciz	"_21"                   # string offset=578
.Linfo_string56:
	.asciz	"_25"                   # string offset=582
.Linfo_string57:
	.asciz	"solution"              # string offset=586
.Linfo_string58:
	.asciz	"_19"                   # string offset=595
.Linfo_string59:
	.asciz	"_20"                   # string offset=599
.Linfo_string60:
	.asciz	"_22"                   # string offset=603
.Linfo_string61:
	.asciz	"_26"                   # string offset=607
.Linfo_string62:
	.asciz	"argc"                  # string offset=611
.Linfo_string63:
	.asciz	"args"                  # string offset=616
.Linfo_string64:
	.asciz	"char"                  # string offset=621
.Linfo_string65:
	.asciz	"_30_has_ownership"     # string offset=626
.Linfo_string66:
	.asciz	"_30_size"              # string offset=644
.Linfo_string67:
	.asciz	"_25_has_ownership"     # string offset=653
.Linfo_string68:
	.asciz	"_25_size"              # string offset=671
.Linfo_string69:
	.asciz	"_20_has_ownership"     # string offset=680
.Linfo_string70:
	.asciz	"_20_size"              # string offset=698
.Linfo_string71:
	.asciz	"_17_has_ownership"     # string offset=707
.Linfo_string72:
	.asciz	"_17_size"              # string offset=725
.Linfo_string73:
	.asciz	"_12_has_ownership"     # string offset=734
.Linfo_string74:
	.asciz	"_12_size"              # string offset=752
.Linfo_string75:
	.asciz	"_11_has_ownership"     # string offset=761
.Linfo_string76:
	.asciz	"_8_has_ownership"      # string offset=779
.Linfo_string77:
	.asciz	"_8_size"               # string offset=796
.Linfo_string78:
	.asciz	"_7"                    # string offset=804
.Linfo_string79:
	.asciz	"_6_has_ownership"      # string offset=807
.Linfo_string80:
	.asciz	"_6_size_size"          # string offset=824
.Linfo_string81:
	.asciz	"_6_size"               # string offset=837
.Linfo_string82:
	.asciz	"init_has_ownership"    # string offset=845
.Linfo_string83:
	.asciz	"init_size"             # string offset=864
.Linfo_string84:
	.asciz	"_6"                    # string offset=874
.Linfo_string85:
	.asciz	"max"                   # string offset=877
.Linfo_string86:
	.asciz	"_5"                    # string offset=881
.Linfo_string87:
	.asciz	"_12_i"                 # string offset=884
.Linfo_string88:
	.asciz	"init"                  # string offset=890
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
	.quad	.Ltmp30-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp30-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Lfunc_begin5-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	40                      # 40
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp86-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	40                      # 40
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	40                      # 40
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Lfunc_begin5-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp86-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Lfunc_begin5-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	81                      # super-register DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp86-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	81                      # super-register DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp93-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	81                      # super-register DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Lfunc_begin5-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp86-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Lfunc_begin5-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp86-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp83-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp81-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	0                       # 0
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	48                      # 48
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp80-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	0                       # 0
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp78-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp90-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp90-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Ltmp52-.Lfunc_begin0
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
.Ldebug_loc21:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp64-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp64-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc23:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp81-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	0                       # 0
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp62-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Lfunc_begin6-.Lfunc_begin0
	.quad	.Ltmp109-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp112-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Lfunc_begin6-.Lfunc_begin0
	.quad	.Ltmp110-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp139-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp139-.Lfunc_begin0
	.quad	.Ltmp146-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp146-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp137-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp137-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	11                      # 11
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp136-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp136-.Lfunc_begin0
	.quad	.Ltmp145-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp145-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp134-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp134-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	6                       # 6
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc33:
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp133-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp133-.Lfunc_begin0
	.quad	.Ltmp144-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp144-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc34:
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp131-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp131-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	4                       # 4
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc35:
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp130-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp130-.Lfunc_begin0
	.quad	.Ltmp143-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp143-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc36:
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp128-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp128-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	33                      # 33
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc37:
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp128-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp128-.Lfunc_begin0
	.quad	.Ltmp147-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc38:
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp118-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp118-.Lfunc_begin0
	.quad	.Ltmp123-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc39:
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp118-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp118-.Lfunc_begin0
	.quad	.Ltmp142-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp142-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc40:
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp113-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp142-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp142-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc41:
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp113-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp122-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp147-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc42:
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp128-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp128-.Lfunc_begin0
	.quad	.Ltmp147-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc43:
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp127-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp141-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc44:
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp118-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp118-.Lfunc_begin0
	.quad	.Ltmp123-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc45:
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp118-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp118-.Lfunc_begin0
	.quad	.Ltmp123-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc46:
	.quad	.Ltmp111-.Lfunc_begin0
	.quad	.Ltmp123-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp147-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc47:
	.quad	.Ltmp114-.Lfunc_begin0
	.quad	.Ltmp115-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc48:
	.quad	.Ltmp115-.Lfunc_begin0
	.quad	.Ltmp119-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp147-.Lfunc_begin0
	.quad	.Ltmp148-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc49:
	.quad	.Ltmp115-.Lfunc_begin0
	.quad	.Ltmp119-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp147-.Lfunc_begin0
	.quad	.Ltmp148-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc50:
	.quad	.Ltmp129-.Lfunc_begin0
	.quad	.Ltmp147-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc51:
	.quad	.Ltmp132-.Lfunc_begin0
	.quad	.Ltmp147-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc52:
	.quad	.Ltmp135-.Lfunc_begin0
	.quad	.Ltmp147-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc53:
	.quad	.Ltmp138-.Lfunc_begin0
	.quad	.Ltmp147-.Lfunc_begin0
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
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	20                      # Abbreviation Code
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
	.byte	21                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	22                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	23                      # Abbreviation Code
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
	.byte	24                      # Abbreviation Code
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
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	26                      # Abbreviation Code
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
	.byte	5                       # DW_FORM_data2
	.ascii	"\266B"                 # DW_AT_GNU_discriminator
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	28                      # Abbreviation Code
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
	.byte	29                      # Abbreviation Code
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
	.byte	5                       # DW_FORM_data2
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	31                      # Abbreviation Code
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
	.byte	32                      # Abbreviation Code
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
	.byte	33                      # Abbreviation Code
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
	.long	2099                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x82c DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end6-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x1 DW_TAG_pointer_type
	.byte	3                       # Abbrev [3] 0x2b:0x26 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
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
                                        # DW_AT_APPLE_optimized
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
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	2063                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	15                      # Abbrev [15] 0xc1:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	2063                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0xd0:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0xdf:0xb DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	2063                    # DW_AT_type
	.byte	16                      # Abbrev [16] 0xea:0x2d DW_TAG_lexical_block
	.quad	.Ltmp18                 # DW_AT_low_pc
	.long	.Ltmp25-.Ltmp18         # DW_AT_high_pc
	.byte	17                      # Abbrev [17] 0xf7:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.long	2068                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x103:0x13 DW_TAG_inlined_subroutine
	.long	81                      # DW_AT_abstract_origin
	.quad	.Ltmp21                 # DW_AT_low_pc
	.long	.Ltmp23-.Ltmp21         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	11                      # DW_AT_call_line
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	3                       # Abbrev [3] 0x118:0x1b DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	449                     # DW_AT_abstract_origin
	.byte	19                      # Abbrev [19] 0x12b:0x7 DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	85
	.long	457                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	20                      # Abbrev [20] 0x133:0x25 DW_TAG_subprogram
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
	.byte	15                      # Abbrev [15] 0x148:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc4            # DW_AT_location
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
	.long	116                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	3                       # Abbrev [3] 0x158:0x69 DW_TAG_subprogram
	.quad	.Lfunc_begin4           # DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin4 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	469                     # DW_AT_abstract_origin
	.byte	21                      # Abbrev [21] 0x16b:0x5 DW_TAG_formal_parameter
	.long	481                     # DW_AT_abstract_origin
	.byte	21                      # Abbrev [21] 0x170:0x5 DW_TAG_formal_parameter
	.long	492                     # DW_AT_abstract_origin
	.byte	21                      # Abbrev [21] 0x175:0x5 DW_TAG_formal_parameter
	.long	503                     # DW_AT_abstract_origin
	.byte	21                      # Abbrev [21] 0x17a:0x5 DW_TAG_formal_parameter
	.long	514                     # DW_AT_abstract_origin
	.byte	22                      # Abbrev [22] 0x17f:0x5 DW_TAG_variable
	.long	525                     # DW_AT_abstract_origin
	.byte	22                      # Abbrev [22] 0x184:0x5 DW_TAG_variable
	.long	536                     # DW_AT_abstract_origin
	.byte	22                      # Abbrev [22] 0x189:0x5 DW_TAG_variable
	.long	547                     # DW_AT_abstract_origin
	.byte	22                      # Abbrev [22] 0x18e:0x5 DW_TAG_variable
	.long	558                     # DW_AT_abstract_origin
	.byte	22                      # Abbrev [22] 0x193:0x5 DW_TAG_variable
	.long	569                     # DW_AT_abstract_origin
	.byte	22                      # Abbrev [22] 0x198:0x5 DW_TAG_variable
	.long	580                     # DW_AT_abstract_origin
	.byte	22                      # Abbrev [22] 0x19d:0x5 DW_TAG_variable
	.long	591                     # DW_AT_abstract_origin
	.byte	22                      # Abbrev [22] 0x1a2:0x5 DW_TAG_variable
	.long	602                     # DW_AT_abstract_origin
	.byte	22                      # Abbrev [22] 0x1a7:0x5 DW_TAG_variable
	.long	613                     # DW_AT_abstract_origin
	.byte	22                      # Abbrev [22] 0x1ac:0x5 DW_TAG_variable
	.long	624                     # DW_AT_abstract_origin
	.byte	22                      # Abbrev [22] 0x1b1:0x5 DW_TAG_variable
	.long	635                     # DW_AT_abstract_origin
	.byte	22                      # Abbrev [22] 0x1b6:0x5 DW_TAG_variable
	.long	646                     # DW_AT_abstract_origin
	.byte	22                      # Abbrev [22] 0x1bb:0x5 DW_TAG_variable
	.long	657                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	23                      # Abbrev [23] 0x1c1:0x14 DW_TAG_subprogram
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	7                       # Abbrev [7] 0x1c9:0xb DW_TAG_formal_parameter
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	116                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	6                       # Abbrev [6] 0x1d5:0xc8 DW_TAG_subprogram
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	161                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	7                       # Abbrev [7] 0x1e1:0xb DW_TAG_formal_parameter
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	116                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x1ec:0xb DW_TAG_formal_parameter
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	669                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x1f7:0xb DW_TAG_formal_parameter
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x202:0xb DW_TAG_formal_parameter
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x20d:0xb DW_TAG_variable
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x218:0xb DW_TAG_variable
	.long	.Linfo_string4          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	28                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x223:0xb DW_TAG_variable
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	29                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x22e:0xb DW_TAG_variable
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	30                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x239:0xb DW_TAG_variable
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x244:0xb DW_TAG_variable
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x24f:0xb DW_TAG_variable
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	33                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x25a:0xb DW_TAG_variable
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x265:0xb DW_TAG_variable
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x270:0xb DW_TAG_variable
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x27b:0xb DW_TAG_variable
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	37                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x286:0xb DW_TAG_variable
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	38                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x291:0xb DW_TAG_variable
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	39                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	13                      # Abbrev [13] 0x29d:0x7 DW_TAG_base_type
	.long	.Linfo_string15         # DW_AT_name
	.byte	2                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	14                      # Abbrev [14] 0x2a4:0x29c DW_TAG_subprogram
	.quad	.Lfunc_begin5           # DW_AT_low_pc
	.long	.Lfunc_end5-.Lfunc_begin5 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	89                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	161                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	15                      # Abbrev [15] 0x2bd:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc5            # DW_AT_location
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	89                      # DW_AT_decl_line
	.long	2063                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x2cc:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc6            # DW_AT_location
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	89                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x2db:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc7            # DW_AT_location
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	89                      # DW_AT_decl_line
	.long	669                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x2ea:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc8            # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	89                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x2f9:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc9            # DW_AT_location
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	89                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x308:0xf DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	100                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x317:0xf DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	101                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x326:0xf DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	122                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x335:0xf DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	121                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x344:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	120                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x353:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	119                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x362:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	118                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x371:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	117                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x380:0xf DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	116                     # DW_AT_decl_line
	.long	669                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x38f:0xf DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	113                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x39e:0xf DW_TAG_variable
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	112                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x3ad:0xf DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	108                     # DW_AT_decl_line
	.long	669                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x3bc:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	106                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x3c8:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	105                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x3d4:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	104                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x3e0:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	103                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x3ec:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	99                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x3f8:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	98                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x404:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	97                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x410:0xf DW_TAG_variable
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	96                      # DW_AT_decl_line
	.long	669                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x41f:0xf DW_TAG_variable
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	94                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x42e:0xf DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	92                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x43d:0xf DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	91                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x44c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	90                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x458:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	110                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x464:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	114                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x470:0xb DW_TAG_variable
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	93                      # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x47b:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	95                      # DW_AT_decl_line
	.long	116                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x486:0xb DW_TAG_variable
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	102                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x491:0xb DW_TAG_variable
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	107                     # DW_AT_decl_line
	.long	116                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x49c:0xb DW_TAG_variable
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	109                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x4a7:0xb DW_TAG_variable
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	111                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x4b2:0xb DW_TAG_variable
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	115                     # DW_AT_decl_line
	.long	116                     # DW_AT_type
	.byte	25                      # Abbrev [25] 0x4bd:0x1d DW_TAG_inlined_subroutine
	.long	81                      # DW_AT_abstract_origin
	.quad	.Ltmp62                 # DW_AT_low_pc
	.long	.Ltmp65-.Ltmp62         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	206                     # DW_AT_call_line
	.byte	4                       # Abbrev [4] 0x4d0:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc26           # DW_AT_location
	.long	93                      # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	26                      # Abbrev [26] 0x4da:0x14 DW_TAG_inlined_subroutine
	.long	449                     # DW_AT_abstract_origin
	.quad	.Ltmp66                 # DW_AT_low_pc
	.long	.Ltmp67-.Ltmp66         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	209                     # DW_AT_call_line
	.byte	1                       # DW_AT_GNU_discriminator
	.byte	18                      # Abbrev [18] 0x4ee:0x13 DW_TAG_inlined_subroutine
	.long	469                     # DW_AT_abstract_origin
	.quad	.Ltmp70                 # DW_AT_low_pc
	.long	.Ltmp72-.Ltmp70         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	215                     # DW_AT_call_line
	.byte	26                      # Abbrev [26] 0x501:0x14 DW_TAG_inlined_subroutine
	.long	449                     # DW_AT_abstract_origin
	.quad	.Ltmp76                 # DW_AT_low_pc
	.long	.Ltmp77-.Ltmp76         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	248                     # DW_AT_call_line
	.byte	1                       # DW_AT_GNU_discriminator
	.byte	27                      # Abbrev [27] 0x515:0x15 DW_TAG_inlined_subroutine
	.long	449                     # DW_AT_abstract_origin
	.quad	.Ltmp87                 # DW_AT_low_pc
	.long	.Ltmp88-.Ltmp87         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.short	280                     # DW_AT_call_line
	.byte	1                       # DW_AT_GNU_discriminator
	.byte	27                      # Abbrev [27] 0x52a:0x15 DW_TAG_inlined_subroutine
	.long	449                     # DW_AT_abstract_origin
	.quad	.Ltmp89                 # DW_AT_low_pc
	.long	.Ltmp90-.Ltmp89         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.short	282                     # DW_AT_call_line
	.byte	1                       # DW_AT_GNU_discriminator
	.byte	0                       # End Of Children Mark
	.byte	28                      # Abbrev [28] 0x540:0x2cf DW_TAG_subprogram
	.quad	.Lfunc_begin6           # DW_AT_low_pc
	.long	.Lfunc_end6-.Lfunc_begin6 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	289                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	2068                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	29                      # Abbrev [29] 0x55a:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc27           # DW_AT_location
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	289                     # DW_AT_decl_line
	.long	2068                    # DW_AT_type
	.byte	29                      # Abbrev [29] 0x56a:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc28           # DW_AT_location
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	289                     # DW_AT_decl_line
	.long	2075                    # DW_AT_type
	.byte	30                      # Abbrev [30] 0x57a:0x10 DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	324                     # DW_AT_decl_line
	.long	669                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x58a:0x10 DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	.Linfo_string66         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	323                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x59a:0x10 DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	320                     # DW_AT_decl_line
	.long	669                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x5aa:0x10 DW_TAG_variable
	.long	.Ldebug_loc32           # DW_AT_location
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	319                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x5ba:0x10 DW_TAG_variable
	.long	.Ldebug_loc33           # DW_AT_location
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	316                     # DW_AT_decl_line
	.long	669                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x5ca:0x10 DW_TAG_variable
	.long	.Ldebug_loc34           # DW_AT_location
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	315                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x5da:0x10 DW_TAG_variable
	.long	.Ldebug_loc35           # DW_AT_location
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	313                     # DW_AT_decl_line
	.long	669                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x5ea:0x10 DW_TAG_variable
	.long	.Ldebug_loc36           # DW_AT_location
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	312                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x5fa:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	310                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x607:0x10 DW_TAG_variable
	.long	.Ldebug_loc37           # DW_AT_location
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	309                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x617:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	308                     # DW_AT_decl_line
	.long	669                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x624:0x10 DW_TAG_variable
	.long	.Ldebug_loc38           # DW_AT_location
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	307                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x634:0x10 DW_TAG_variable
	.long	.Ldebug_loc39           # DW_AT_location
	.long	.Linfo_string75         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	305                     # DW_AT_decl_line
	.long	669                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x644:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	303                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x651:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	302                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x65e:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string76         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	301                     # DW_AT_decl_line
	.long	669                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x66b:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string77         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	300                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x678:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string78         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	299                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x685:0x10 DW_TAG_variable
	.long	.Ldebug_loc40           # DW_AT_location
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	298                     # DW_AT_decl_line
	.long	669                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x695:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string80         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	297                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x6a2:0x10 DW_TAG_variable
	.long	.Ldebug_loc41           # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	297                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x6b2:0x10 DW_TAG_variable
	.long	.Ldebug_loc42           # DW_AT_location
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	295                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x6c2:0x10 DW_TAG_variable
	.long	.Ldebug_loc43           # DW_AT_location
	.long	.Linfo_string82         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	294                     # DW_AT_decl_line
	.long	669                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x6d2:0x10 DW_TAG_variable
	.long	.Ldebug_loc44           # DW_AT_location
	.long	.Linfo_string83         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	293                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x6e2:0x10 DW_TAG_variable
	.long	.Ldebug_loc45           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	291                     # DW_AT_decl_line
	.long	161                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x6f2:0x10 DW_TAG_variable
	.long	.Ldebug_loc46           # DW_AT_location
	.long	.Linfo_string84         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	297                     # DW_AT_decl_line
	.long	2092                    # DW_AT_type
	.byte	30                      # Abbrev [30] 0x702:0x10 DW_TAG_variable
	.long	.Ldebug_loc47           # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	300                     # DW_AT_decl_line
	.long	2097                    # DW_AT_type
	.byte	30                      # Abbrev [30] 0x712:0x10 DW_TAG_variable
	.long	.Ldebug_loc48           # DW_AT_location
	.long	.Linfo_string85         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	290                     # DW_AT_decl_line
	.long	2097                    # DW_AT_type
	.byte	30                      # Abbrev [30] 0x722:0x10 DW_TAG_variable
	.long	.Ldebug_loc49           # DW_AT_location
	.long	.Linfo_string86         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	296                     # DW_AT_decl_line
	.long	2097                    # DW_AT_type
	.byte	30                      # Abbrev [30] 0x732:0x10 DW_TAG_variable
	.long	.Ldebug_loc50           # DW_AT_location
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	312                     # DW_AT_decl_line
	.long	2097                    # DW_AT_type
	.byte	30                      # Abbrev [30] 0x742:0x10 DW_TAG_variable
	.long	.Ldebug_loc51           # DW_AT_location
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	315                     # DW_AT_decl_line
	.long	2097                    # DW_AT_type
	.byte	30                      # Abbrev [30] 0x752:0x10 DW_TAG_variable
	.long	.Ldebug_loc52           # DW_AT_location
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	319                     # DW_AT_decl_line
	.long	2097                    # DW_AT_type
	.byte	30                      # Abbrev [30] 0x762:0x10 DW_TAG_variable
	.long	.Ldebug_loc53           # DW_AT_location
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	323                     # DW_AT_decl_line
	.long	2097                    # DW_AT_type
	.byte	33                      # Abbrev [33] 0x772:0xc DW_TAG_variable
	.long	.Linfo_string88         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	292                     # DW_AT_decl_line
	.long	2063                    # DW_AT_type
	.byte	33                      # Abbrev [33] 0x77e:0xc DW_TAG_variable
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	304                     # DW_AT_decl_line
	.long	116                     # DW_AT_type
	.byte	33                      # Abbrev [33] 0x78a:0xc DW_TAG_variable
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	306                     # DW_AT_decl_line
	.long	2063                    # DW_AT_type
	.byte	33                      # Abbrev [33] 0x796:0xc DW_TAG_variable
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	311                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	33                      # Abbrev [33] 0x7a2:0xc DW_TAG_variable
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	314                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	33                      # Abbrev [33] 0x7ae:0xc DW_TAG_variable
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	317                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	33                      # Abbrev [33] 0x7ba:0xc DW_TAG_variable
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	318                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	33                      # Abbrev [33] 0x7c6:0xc DW_TAG_variable
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	321                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	33                      # Abbrev [33] 0x7d2:0xc DW_TAG_variable
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	322                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	16                      # Abbrev [16] 0x7de:0x30 DW_TAG_lexical_block
	.quad	.Ltmp120                # DW_AT_low_pc
	.long	.Ltmp127-.Ltmp120       # DW_AT_high_pc
	.byte	31                      # Abbrev [31] 0x7eb:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string87         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	353                     # DW_AT_decl_line
	.long	2068                    # DW_AT_type
	.byte	27                      # Abbrev [27] 0x7f8:0x15 DW_TAG_inlined_subroutine
	.long	81                      # DW_AT_abstract_origin
	.quad	.Ltmp123                # DW_AT_low_pc
	.long	.Ltmp125-.Ltmp123       # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.short	353                     # DW_AT_call_line
	.byte	3                       # DW_AT_GNU_discriminator
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0x80f:0x5 DW_TAG_pointer_type
	.long	116                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x814:0x7 DW_TAG_base_type
	.long	.Linfo_string33         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	9                       # Abbrev [9] 0x81b:0x5 DW_TAG_pointer_type
	.long	2080                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0x820:0x5 DW_TAG_pointer_type
	.long	2085                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x825:0x7 DW_TAG_base_type
	.long	.Linfo_string64         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	9                       # Abbrev [9] 0x82c:0x5 DW_TAG_pointer_type
	.long	2097                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0x831:0x5 DW_TAG_pointer_type
	.long	161                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
	.section	.debug_macinfo,"",@progbits
.Ldebug_macinfo:
.Lcu_macro_begin0:
	.byte	0                       # End Of Macro List Mark
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end0-.LpubNames_begin0 # Length of Public Names Info
.LpubNames_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	2103                    # Compilation Unit Length
	.long	469                     # DIE offset
	.asciz	"conflict"              # External Name
	.long	449                     # DIE offset
	.asciz	"free_POS"              # External Name
	.long	307                     # DIE offset
	.asciz	"printf_POS"            # External Name
	.long	676                     # DIE offset
	.asciz	"run"                   # External Name
	.long	1344                    # DIE offset
	.asciz	"main"                  # External Name
	.long	168                     # DIE offset
	.asciz	"copy_array_POS"        # External Name
	.long	81                      # DIE offset
	.asciz	"copy_POS"              # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	2103                    # Compilation Unit Length
	.long	121                     # DIE offset
	.asciz	"POS"                   # External Name
	.long	161                     # DIE offset
	.asciz	"long long int"         # External Name
	.long	669                     # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	2068                    # DIE offset
	.asciz	"int"                   # External Name
	.long	2085                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
