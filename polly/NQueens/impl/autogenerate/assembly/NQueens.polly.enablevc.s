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
	movq	(%rdi), %r10
	movq	8(%rdi), %rdi
	subq	%rdx, %rdi
	setl	%r8b
	setg	%r11b
	setne	%r9b
	subq	%rsi, %r10
	setl	%cl
	setg	%dl
	movl	$1, %eax
	testb	%r11b, %dl
	jne	.LBB4_3
# BB#1:                                 # %entry
	andb	%r9b, %cl
	jne	.LBB4_3
# BB#2:                                 # %entry
	andb	%r8b, %dl
	je	.LBB4_4
.LBB4_3:                                # %polly.stmt.blklab0
.Ltmp32:
	.loc	1 61 7 prologue_end     # NQueens.c:61:7
	movq	%rdi, %rax
	negq	%rax
	cmovlq	%rdi, %rax
	.loc	1 67 7                  # NQueens.c:67:7
	movq	%r10, %rcx
	negq	%rcx
	cmovlq	%r10, %rcx
.Ltmp33:
	.loc	1 73 12                 # NQueens.c:73:12
	cmpq	%rcx, %rax
	sete	%al
.Ltmp34:
	.loc	1 81 2                  # NQueens.c:81:2
	movzbl	%al, %eax
.LBB4_4:                                # %polly.exiting
	.loc	1 87 1                  # NQueens.c:87:1
	retq
.Ltmp35:
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
.Ltmp36:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp37:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp38:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp39:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp40:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp41:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Ltmp42:
	.cfi_def_cfa_offset 64
.Ltmp43:
	.cfi_offset %rbx, -56
.Ltmp44:
	.cfi_offset %r12, -48
.Ltmp45:
	.cfi_offset %r13, -40
.Ltmp46:
	.cfi_offset %r14, -32
.Ltmp47:
	.cfi_offset %r15, -24
.Ltmp48:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: run:queens <- %RDI
	#DEBUG_VALUE: run:queens_size <- %RSI
	#DEBUG_VALUE: run:n <- %RDX
	#DEBUG_VALUE: run:dim <- %RCX
.Ltmp49:
	#DEBUG_VALUE: run:_12 <- %RSI
	#DEBUG_VALUE: run:_13 <- %RSI
	movq	%rcx, %r14
.Ltmp50:
	#DEBUG_VALUE: run:dim <- %R14
	movq	%rdx, %r13
.Ltmp51:
	#DEBUG_VALUE: run:n <- %R13
	movq	%rdi, %r15
.Ltmp52:
	#DEBUG_VALUE: run:_33 <- 0
	#DEBUG_VALUE: run:_32 <- 0
	#DEBUG_VALUE: run:_31 <- 0
	#DEBUG_VALUE: run:_30 <- 0
	#DEBUG_VALUE: run:_29 <- 0
	#DEBUG_VALUE: run:_28 <- 0
	#DEBUG_VALUE: run:_25 <- 0
	#DEBUG_VALUE: run:_24 <- 0
	#DEBUG_VALUE: run:_18 <- 0
	#DEBUG_VALUE: run:_17 <- 0
	#DEBUG_VALUE: run:_16 <- 0
	#DEBUG_VALUE: run:_15 <- 0
	#DEBUG_VALUE: run:_11 <- 0
	#DEBUG_VALUE: run:_10 <- 0
	#DEBUG_VALUE: run:_9 <- 0
	#DEBUG_VALUE: run:i <- 0
	#DEBUG_VALUE: run:col <- 0
	#DEBUG_VALUE: run:num_solutions <- 0
	#DEBUG_VALUE: run:_3 <- 0
	#DEBUG_VALUE: run:_13 <- 0
	#DEBUG_VALUE: run:_12 <- 0
	#DEBUG_VALUE: run:queens <- %R15
	movl	$1, %r12d
.Ltmp53:
	.loc	1 122 8 prologue_end    # NQueens.c:122:8
	cmpq	%r13, %r14
	je	.LBB5_17
.Ltmp54:
# BB#1:                                 # %while.cond.preheader
	#DEBUG_VALUE: run:queens <- %R15
	#DEBUG_VALUE: run:n <- %R13
	#DEBUG_VALUE: run:dim <- %R14
	#DEBUG_VALUE: run:queens_size <- %RSI
	.loc	1 146 7                 # NQueens.c:146:7
	cmpq	%rsi, %r13
	jge	.LBB5_18
.Ltmp55:
# BB#2:                                 # %while.cond.preheader
	#DEBUG_VALUE: run:queens_size <- %RSI
	#DEBUG_VALUE: run:dim <- %R14
	#DEBUG_VALUE: run:n <- %R13
	#DEBUG_VALUE: run:queens <- %R15
	cmpq	%rsi, %r14
	jne	.LBB5_18
.Ltmp56:
# BB#3:                                 # %blklab10.preheader
	#DEBUG_VALUE: run:queens <- %R15
	#DEBUG_VALUE: run:n <- %R13
	#DEBUG_VALUE: run:dim <- %R14
	#DEBUG_VALUE: run:queens_size <- %RSI
	xorl	%r12d, %r12d
	.loc	1 161 6                 # NQueens.c:161:6
	testq	%r14, %r14
	jle	.LBB5_17
.Ltmp57:
# BB#4:                                 # %blklab14.preheader.us.preheader
	#DEBUG_VALUE: run:queens_size <- %RSI
	#DEBUG_VALUE: run:dim <- %R14
	#DEBUG_VALUE: run:n <- %R13
	#DEBUG_VALUE: run:queens <- %R15
	.loc	1 259 8                 # NQueens.c:259:8
	leaq	1(%r13), %rax
.Ltmp58:
	#DEBUG_VALUE: run:_30 <- [%RSP+0]
	movq	%rax, (%rsp)            # 8-byte Spill
	xorl	%ebp, %ebp
	xorl	%r12d, %r12d
.Ltmp59:
	.p2align	4, 0x90
.LBB5_5:                                # %blklab14.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_7 Depth 2
	.loc	1 198 7                 # NQueens.c:198:7
	testq	%r13, %r13
	jle	.LBB5_15
# BB#6:                                 # %if.end24.us.preheader
                                        #   in Loop: Header=BB5_5 Depth=1
	xorl	%eax, %eax
	movl	$1, %edx
	.p2align	4, 0x90
.LBB5_7:                                # %if.end24.us
                                        #   Parent Loop BB5_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp60:
	#DEBUG_VALUE: run:_20 <- 1
	.loc	1 206 7                 # NQueens.c:206:7
	cmpq	$1, %rdx
	movl	$0, %edx
	jne	.LBB5_13
# BB#8:                                 # %blklab20.us
                                        #   in Loop: Header=BB5_7 Depth=2
	.loc	1 200 19                # NQueens.c:200:19
	movq	(%r15,%rax,8), %rdx
.Ltmp61:
	#DEBUG_VALUE: copy_POS:_POS <- %RDX
	.loc	1 212 10                # NQueens.c:212:10
	movq	(%rdx), %rcx
	movq	8(%rdx), %rsi
	subq	%rbp, %rsi
	setl	%dil
	setg	%r9b
	setne	%r8b
	subq	%r13, %rcx
	setl	%dl
.Ltmp62:
	setg	%bl
	testb	%r9b, %bl
	jne	.LBB5_11
# BB#9:                                 # %blklab20.us
                                        #   in Loop: Header=BB5_7 Depth=2
	andb	%r8b, %dl
	jne	.LBB5_11
# BB#10:                                # %blklab20.us
                                        #   in Loop: Header=BB5_7 Depth=2
	andb	%dil, %bl
	movl	$1, %edx
	je	.LBB5_12
.LBB5_11:                               # %polly.stmt.blklab0.i.us
                                        #   in Loop: Header=BB5_7 Depth=2
.Ltmp63:
	.loc	1 61 7                  # NQueens.c:61:7
	movq	%rsi, %rdx
	negq	%rdx
	cmovlq	%rsi, %rdx
	.loc	1 67 7                  # NQueens.c:67:7
	movq	%rcx, %rsi
	negq	%rsi
	cmovlq	%rcx, %rsi
.Ltmp64:
	.loc	1 73 12                 # NQueens.c:73:12
	cmpq	%rsi, %rdx
	sete	%cl
.Ltmp65:
	.loc	1 81 2                  # NQueens.c:81:2
	movzbl	%cl, %edx
.Ltmp66:
.LBB5_12:                               # %conflict.exit.us
                                        #   in Loop: Header=BB5_7 Depth=2
	.loc	1 216 7                 # NQueens.c:216:7
	xorq	$1, %rdx
.Ltmp67:
	#DEBUG_VALUE: run:_23 <- 1
	#DEBUG_VALUE: run:_22 <- 1
.LBB5_13:                               # %blklab18.us
                                        #   in Loop: Header=BB5_7 Depth=2
	#DEBUG_VALUE: run:_24 <- 1
	.loc	1 238 9                 # NQueens.c:238:9
	incq	%rax
.Ltmp68:
	#DEBUG_VALUE: run:_25 <- %RAX
	#DEBUG_VALUE: run:_17 <- 0
	#DEBUG_VALUE: run:i <- %RAX
	.loc	1 198 7                 # NQueens.c:198:7
	cmpq	%rax, %r13
	jne	.LBB5_7
.Ltmp69:
# BB#14:                                # %blklab12.us
                                        #   in Loop: Header=BB5_5 Depth=1
	#DEBUG_VALUE: run:i <- %RAX
	#DEBUG_VALUE: run:_25 <- %RAX
	#DEBUG_VALUE: run:_26 <- 1
	.loc	1 249 6                 # NQueens.c:249:6
	testq	%rdx, %rdx
	je	.LBB5_16
.Ltmp70:
.LBB5_15:                               # %if.end35.us
                                        #   in Loop: Header=BB5_5 Depth=1
	.loc	1 251 9                 # NQueens.c:251:9
	movl	$16, %edi
	callq	malloc
	.loc	1 252 10                # NQueens.c:252:10
	movq	%rbp, 8(%rax)
	.loc	1 253 10                # NQueens.c:253:10
	movq	%r13, (%rax)
	.loc	1 255 13                # NQueens.c:255:13
	movq	%rax, (%r15,%r13,8)
.Ltmp71:
	#DEBUG_VALUE: run:_29 <- 1
	.loc	1 261 9                 # NQueens.c:261:9
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	(%rsp), %rdx            # 8-byte Reload
	movq	%r14, %rcx
	callq	run
.Ltmp72:
	#DEBUG_VALUE: run:_28 <- %R12
	.loc	1 263 20                # NQueens.c:263:20
	addq	%rax, %r12
.Ltmp73:
	#DEBUG_VALUE: run:_31 <- %R12
	#DEBUG_VALUE: run:num_solutions <- %R12
.LBB5_16:                               # %blklab22.us
                                        #   in Loop: Header=BB5_5 Depth=1
	#DEBUG_VALUE: run:_32 <- 1
	.loc	1 271 10                # NQueens.c:271:10
	incq	%rbp
.Ltmp74:
	#DEBUG_VALUE: run:_33 <- %RBP
	#DEBUG_VALUE: run:col <- %RBP
	.loc	1 161 9                 # NQueens.c:161:9
	cmpq	%r14, %rbp
	jl	.LBB5_5
.Ltmp75:
.LBB5_17:                               # %cleanup
	.loc	1 284 1 discriminator 2 # NQueens.c:284:1
	movq	%r12, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB5_18:                               # %blklab11
.Ltmp76:
	#DEBUG_VALUE: run:queens_size <- %RSI
	#DEBUG_VALUE: run:dim <- %R14
	#DEBUG_VALUE: run:n <- %R13
	#DEBUG_VALUE: run:queens <- %R15
	.loc	1 154 12                # NQueens.c:154:12
	movq	stderr(%rip), %rcx
	.loc	1 154 4 is_stmt 0       # NQueens.c:154:4
	movl	$.L.str.5, %edi
	movl	$4, %esi
.Ltmp77:
	movl	$1, %edx
	callq	fwrite
	.loc	1 155 4 is_stmt 1       # NQueens.c:155:4
	movl	$-1, %edi
	callq	exit
.Ltmp78:
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
	.loc	1 286 0                 # NQueens.c:286:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 314 2 prologue_end    # NQueens.c:314:2
	pushq	%r15
.Ltmp79:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp80:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp81:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp82:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp83:
	.cfi_def_cfa_offset 48
.Ltmp84:
	.cfi_offset %rbx, -40
.Ltmp85:
	.cfi_offset %r12, -32
.Ltmp86:
	.cfi_offset %r14, -24
.Ltmp87:
	.cfi_offset %r15, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
.Ltmp88:
	#DEBUG_VALUE: main:n <- 0
	#DEBUG_VALUE: main:init_size <- 0
	#DEBUG_VALUE: main:num_solutions <- 0
	#DEBUG_VALUE: main:_6_size <- 0
	#DEBUG_VALUE: main:_6_size_size <- 0
	#DEBUG_VALUE: main:_7 <- 0
	#DEBUG_VALUE: main:_8_size <- 0
	#DEBUG_VALUE: main:_9 <- 0
	#DEBUG_VALUE: main:_10 <- 0
	#DEBUG_VALUE: main:_12_size <- 0
	#DEBUG_VALUE: main:_13 <- 0
	#DEBUG_VALUE: main:_14 <- 0
	#DEBUG_VALUE: main:_17_size <- 0
	#DEBUG_VALUE: main:_20_size <- 0
	#DEBUG_VALUE: main:_25_size <- 0
	#DEBUG_VALUE: main:_30_size <- 0
	callq	convertArgsToIntArray
.Ltmp89:
	#DEBUG_VALUE: main:_6 <- %RAX
	.loc	1 318 5                 # NQueens.c:318:5
	movq	(%rax), %rdi
.Ltmp90:
	#DEBUG_VALUE: main:_8 <- %RDI
	.loc	1 320 2                 # NQueens.c:320:2
	callq	parseStringToInt
.Ltmp91:
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_5 <- %RAX
	.loc	1 324 9                 # NQueens.c:324:9
	testq	%rax, %rax
	je	.LBB6_5
.Ltmp92:
# BB#1:                                 # %if.end
	#DEBUG_VALUE: main:_5 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	.loc	1 326 6                 # NQueens.c:326:6
	movq	(%rax), %r15
.Ltmp93:
	#DEBUG_VALUE: main:_12_size <- %R15
	#DEBUG_VALUE: main:_10 <- 0
	#DEBUG_VALUE: main:_9 <- 0
	#DEBUG_VALUE: main:init_size <- %R15
	#DEBUG_VALUE: main:n <- %R15
	.loc	1 336 16                # NQueens.c:336:16
	leaq	(,%r15,8), %rdi
	.loc	1 336 8 is_stmt 0       # NQueens.c:336:8
	callq	malloc
.Ltmp94:
	movq	%rax, %r14
.Ltmp95:
	#DEBUG_VALUE: _12_i <- 0
	.loc	1 337 2 is_stmt 1 discriminator 1 # NQueens.c:337:2
	testq	%r15, %r15
	jle	.LBB6_4
.Ltmp96:
# BB#2:
	#DEBUG_VALUE: main:n <- %R15
	#DEBUG_VALUE: main:init_size <- %R15
	#DEBUG_VALUE: main:_12_size <- %R15
	movq	%r14, %rbx
	movq	%r15, %r12
.Ltmp97:
	.p2align	4, 0x90
.LBB6_3:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 3 17 discriminator 1  # NQueens.c:3:17
	movl	$16, %edi
	callq	malloc
	.loc	1 5 13                  # NQueens.c:5:13
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%rax)
.Ltmp98:
	.loc	1 337 46 discriminator 3 # NQueens.c:337:46
	movq	%rax, (%rbx)
.Ltmp99:
	.loc	1 337 2 is_stmt 0 discriminator 1 # NQueens.c:337:2
	addq	$8, %rbx
	decq	%r12
	jne	.LBB6_3
.Ltmp100:
.LBB6_4:                                # %for.cond.cleanup
	#DEBUG_VALUE: main:_14 <- 0
	.loc	1 344 8 is_stmt 1       # NQueens.c:344:8
	xorl	%edx, %edx
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%r15, %rcx
	callq	run
	movq	%rax, %r14
.Ltmp101:
	#DEBUG_VALUE: main:_17_size <- 33
	#DEBUG_VALUE: main:_13 <- %R14
	#DEBUG_VALUE: main:num_solutions <- %R14
	.loc	1 350 2                 # NQueens.c:350:2
	movl	$264, %edi              # imm = 0x108
	callq	malloc
.Ltmp102:
	#DEBUG_VALUE: main:_17 <- %RAX
	.loc	1 351 9                 # NQueens.c:351:9
	movaps	.LCPI6_0(%rip), %xmm0   # xmm0 = [78,45]
	movups	%xmm0, (%rax)
	.loc	1 351 35 is_stmt 0      # NQueens.c:351:35
	movaps	.LCPI6_1(%rip), %xmm0   # xmm0 = [81,117]
	movups	%xmm0, 16(%rax)
	.loc	1 351 62                # NQueens.c:351:62
	movaps	.LCPI6_2(%rip), %xmm0   # xmm0 = [101,101]
	movups	%xmm0, 32(%rax)
	.loc	1 351 90                # NQueens.c:351:90
	movaps	.LCPI6_3(%rip), %xmm0   # xmm0 = [110,32]
	movups	%xmm0, 48(%rax)
	.loc	1 351 117               # NQueens.c:351:117
	movaps	.LCPI6_4(%rip), %xmm0   # xmm0 = [80,114]
	movups	%xmm0, 64(%rax)
	.loc	1 351 145               # NQueens.c:351:145
	movaps	.LCPI6_5(%rip), %xmm0   # xmm0 = [111,98]
	movups	%xmm0, 80(%rax)
	.loc	1 351 174               # NQueens.c:351:174
	movaps	.LCPI6_6(%rip), %xmm0   # xmm0 = [108,101]
	movups	%xmm0, 96(%rax)
	.loc	1 351 204               # NQueens.c:351:204
	movaps	.LCPI6_7(%rip), %xmm0   # xmm0 = [109,32]
	movups	%xmm0, 112(%rax)
	.loc	1 351 233               # NQueens.c:351:233
	movaps	.LCPI6_8(%rip), %xmm0   # xmm0 = [111,110]
	movups	%xmm0, 128(%rax)
	.loc	1 351 263               # NQueens.c:351:263
	movaps	.LCPI6_9(%rip), %xmm0   # xmm0 = [32,97]
	movups	%xmm0, 144(%rax)
	.loc	1 351 291               # NQueens.c:351:291
	movaps	.LCPI6_10(%rip), %xmm0  # xmm0 = [32,78]
	movups	%xmm0, 160(%rax)
	.loc	1 351 319               # NQueens.c:351:319
	movaps	.LCPI6_11(%rip), %xmm1  # xmm1 = [32,88]
	movups	%xmm1, 176(%rax)
	.loc	1 351 347               # NQueens.c:351:347
	movups	%xmm0, 192(%rax)
	.loc	1 351 375               # NQueens.c:351:375
	movaps	.LCPI6_12(%rip), %xmm0  # xmm0 = [32,66]
	movups	%xmm0, 208(%rax)
	.loc	1 351 403               # NQueens.c:351:403
	movaps	.LCPI6_13(%rip), %xmm0  # xmm0 = [111,97]
	movups	%xmm0, 224(%rax)
	.loc	1 351 432               # NQueens.c:351:432
	movaps	.LCPI6_14(%rip), %xmm0  # xmm0 = [114,100]
	movups	%xmm0, 240(%rax)
	.loc	1 351 462               # NQueens.c:351:462
	movq	$46, 256(%rax)
	.loc	1 353 2 is_stmt 1       # NQueens.c:353:2
	movl	$33, %esi
	movq	%rax, %rdi
	callq	println_s
.Ltmp103:
	#DEBUG_VALUE: main:_20_size <- 4
	.loc	1 357 2                 # NQueens.c:357:2
	movl	$32, %edi
	callq	malloc
.Ltmp104:
	#DEBUG_VALUE: main:_20 <- %RAX
	.loc	1 358 9                 # NQueens.c:358:9
	movaps	.LCPI6_15(%rip), %xmm0  # xmm0 = [78,32]
	movups	%xmm0, (%rax)
	.loc	1 358 35 is_stmt 0      # NQueens.c:358:35
	movaps	.LCPI6_16(%rip), %xmm0  # xmm0 = [61,32]
	movups	%xmm0, 16(%rax)
	.loc	1 360 2 is_stmt 1       # NQueens.c:360:2
	movl	$4, %esi
	movq	%rax, %rdi
	callq	printf_s
.Ltmp105:
	.loc	1 364 2                 # NQueens.c:364:2
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	movq	%r15, %rsi
	callq	printf
.Ltmp106:
	#DEBUG_VALUE: main:_25_size <- 6
	.loc	1 368 2                 # NQueens.c:368:2
	movl	$48, %edi
	callq	malloc
.Ltmp107:
	#DEBUG_VALUE: main:_25 <- %RAX
	.loc	1 369 9                 # NQueens.c:369:9
	movaps	.LCPI6_17(%rip), %xmm0  # xmm0 = [70,111]
	movups	%xmm0, (%rax)
	.loc	1 369 36 is_stmt 0      # NQueens.c:369:36
	movaps	.LCPI6_18(%rip), %xmm0  # xmm0 = [117,110]
	movups	%xmm0, 16(%rax)
	.loc	1 369 64                # NQueens.c:369:64
	movaps	.LCPI6_19(%rip), %xmm0  # xmm0 = [100,32]
	movups	%xmm0, 32(%rax)
	.loc	1 371 2 is_stmt 1       # NQueens.c:371:2
	movl	$6, %esi
	movq	%rax, %rdi
	callq	printf_s
.Ltmp108:
	.loc	1 375 2                 # NQueens.c:375:2
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	movq	%r14, %rsi
	callq	printf
.Ltmp109:
	#DEBUG_VALUE: main:_30_size <- 11
	.loc	1 379 2                 # NQueens.c:379:2
	movl	$88, %edi
	callq	malloc
.Ltmp110:
	#DEBUG_VALUE: main:_30 <- %RAX
	.loc	1 380 9                 # NQueens.c:380:9
	movaps	.LCPI6_20(%rip), %xmm0  # xmm0 = [32,115]
	movups	%xmm0, (%rax)
	.loc	1 380 36 is_stmt 0      # NQueens.c:380:36
	movaps	.LCPI6_21(%rip), %xmm0  # xmm0 = [111,108]
	movups	%xmm0, 16(%rax)
	.loc	1 380 64                # NQueens.c:380:64
	movaps	.LCPI6_22(%rip), %xmm0  # xmm0 = [117,116]
	movups	%xmm0, 32(%rax)
	.loc	1 380 92                # NQueens.c:380:92
	movaps	.LCPI6_23(%rip), %xmm0  # xmm0 = [105,111]
	movups	%xmm0, 48(%rax)
	.loc	1 380 120               # NQueens.c:380:120
	movaps	.LCPI6_24(%rip), %xmm0  # xmm0 = [110,115]
	movups	%xmm0, 64(%rax)
	.loc	1 380 149               # NQueens.c:380:149
	movq	$46, 80(%rax)
	.loc	1 382 2 is_stmt 1       # NQueens.c:382:2
	movl	$11, %esi
	movq	%rax, %rdi
	callq	println_s
.Ltmp111:
.LBB6_5:                                # %blklab23
	.loc	1 386 2                 # NQueens.c:386:2
	xorl	%edi, %edi
	callq	exit
.Ltmp112:
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
	.asciz	"conflict"              # string offset=284
.Linfo_string11:
	.asciz	"p"                     # string offset=293
.Linfo_string12:
	.asciz	"row"                   # string offset=295
.Linfo_string13:
	.asciz	"col"                   # string offset=299
.Linfo_string14:
	.asciz	"_3"                    # string offset=303
.Linfo_string15:
	.asciz	"colDiff"               # string offset=306
.Linfo_string16:
	.asciz	"rowDiff"               # string offset=314
.Linfo_string17:
	.asciz	"_8"                    # string offset=322
.Linfo_string18:
	.asciz	"_9"                    # string offset=325
.Linfo_string19:
	.asciz	"_10"                   # string offset=328
.Linfo_string20:
	.asciz	"_11"                   # string offset=332
.Linfo_string21:
	.asciz	"_12"                   # string offset=336
.Linfo_string22:
	.asciz	"_13"                   # string offset=340
.Linfo_string23:
	.asciz	"_14"                   # string offset=344
.Linfo_string24:
	.asciz	"_15"                   # string offset=348
.Linfo_string25:
	.asciz	"copy_array_POS"        # string offset=352
.Linfo_string26:
	.asciz	"free_POS"              # string offset=367
.Linfo_string27:
	.asciz	"printf_POS"            # string offset=376
.Linfo_string28:
	.asciz	"run"                   # string offset=387
.Linfo_string29:
	.asciz	"main"                  # string offset=391
.Linfo_string30:
	.asciz	"int"                   # string offset=396
.Linfo_string31:
	.asciz	"_POS_size"             # string offset=400
.Linfo_string32:
	.asciz	"i"                     # string offset=410
.Linfo_string33:
	.asciz	"pos"                   # string offset=412
.Linfo_string34:
	.asciz	"queens"                # string offset=416
.Linfo_string35:
	.asciz	"queens_size"           # string offset=423
.Linfo_string36:
	.asciz	"n"                     # string offset=435
.Linfo_string37:
	.asciz	"dim"                   # string offset=437
.Linfo_string38:
	.asciz	"_33"                   # string offset=441
.Linfo_string39:
	.asciz	"_32"                   # string offset=445
.Linfo_string40:
	.asciz	"_31"                   # string offset=449
.Linfo_string41:
	.asciz	"_30"                   # string offset=453
.Linfo_string42:
	.asciz	"_29"                   # string offset=457
.Linfo_string43:
	.asciz	"_28"                   # string offset=461
.Linfo_string44:
	.asciz	"_25"                   # string offset=465
.Linfo_string45:
	.asciz	"_24"                   # string offset=469
.Linfo_string46:
	.asciz	"_18"                   # string offset=473
.Linfo_string47:
	.asciz	"_17"                   # string offset=477
.Linfo_string48:
	.asciz	"_16"                   # string offset=481
.Linfo_string49:
	.asciz	"num_solutions"         # string offset=485
.Linfo_string50:
	.asciz	"_20"                   # string offset=499
.Linfo_string51:
	.asciz	"_23"                   # string offset=503
.Linfo_string52:
	.asciz	"_22"                   # string offset=507
.Linfo_string53:
	.asciz	"_26"                   # string offset=511
.Linfo_string54:
	.asciz	"isSolution"            # string offset=515
.Linfo_string55:
	.asciz	"_19"                   # string offset=526
.Linfo_string56:
	.asciz	"_21"                   # string offset=530
.Linfo_string57:
	.asciz	"_27"                   # string offset=534
.Linfo_string58:
	.asciz	"argc"                  # string offset=538
.Linfo_string59:
	.asciz	"args"                  # string offset=543
.Linfo_string60:
	.asciz	"char"                  # string offset=548
.Linfo_string61:
	.asciz	"init_size"             # string offset=553
.Linfo_string62:
	.asciz	"_6_size"               # string offset=563
.Linfo_string63:
	.asciz	"_6_size_size"          # string offset=571
.Linfo_string64:
	.asciz	"_7"                    # string offset=584
.Linfo_string65:
	.asciz	"_8_size"               # string offset=587
.Linfo_string66:
	.asciz	"_12_size"              # string offset=595
.Linfo_string67:
	.asciz	"_17_size"              # string offset=604
.Linfo_string68:
	.asciz	"_20_size"              # string offset=613
.Linfo_string69:
	.asciz	"_25_size"              # string offset=622
.Linfo_string70:
	.asciz	"_30_size"              # string offset=631
.Linfo_string71:
	.asciz	"_6"                    # string offset=640
.Linfo_string72:
	.asciz	"max"                   # string offset=643
.Linfo_string73:
	.asciz	"_5"                    # string offset=647
.Linfo_string74:
	.asciz	"_12_i"                 # string offset=650
.Linfo_string75:
	.asciz	"init"                  # string offset=656
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
	.quad	.Lfunc_begin5-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Lfunc_begin5-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Lfunc_begin5-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Lfunc_begin5-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Ltmp49-.Lfunc_begin0
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
.Ldebug_loc10:
	.quad	.Ltmp49-.Lfunc_begin0
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
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp58-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	0                       # 0
	.quad	0
	.quad	0
.Ldebug_loc15:
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
.Ldebug_loc16:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp72-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp67-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Lfunc_begin6-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc23:
	.quad	.Lfunc_begin6-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp93-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp93-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp93-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp93-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp101-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp101-.Lfunc_begin0
	.quad	.Ltmp111-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp93-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp93-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp101-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp101-.Lfunc_begin0
	.quad	.Ltmp111-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp101-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp101-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	33                      # 33
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp103-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp103-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	4                       # 4
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp106-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp106-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	6                       # 6
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp109-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	11                      # 11
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc33:
	.quad	.Ltmp89-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc34:
	.quad	.Ltmp90-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc35:
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc36:
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc37:
	.quad	.Ltmp102-.Lfunc_begin0
	.quad	.Ltmp103-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc38:
	.quad	.Ltmp104-.Lfunc_begin0
	.quad	.Ltmp105-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc39:
	.quad	.Ltmp107-.Lfunc_begin0
	.quad	.Ltmp108-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc40:
	.quad	.Ltmp110-.Lfunc_begin0
	.quad	.Ltmp111-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
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
	.byte	20                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
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
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	22                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	23                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
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
	.byte	26                      # Abbreviation Code
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
	.byte	27                      # Abbreviation Code
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
	.byte	28                      # Abbreviation Code
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
	.byte	29                      # Abbreviation Code
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
	.byte	30                      # Abbreviation Code
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
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	1769                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x6e2 DW_TAG_compile_unit
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
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1733                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	15                      # Abbrev [15] 0xc5:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	1733                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0xd4:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0xe3:0xb DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	1733                    # DW_AT_type
	.byte	16                      # Abbrev [16] 0xee:0x2d DW_TAG_lexical_block
	.quad	.Ltmp18                 # DW_AT_low_pc
	.long	.Ltmp24-.Ltmp18         # DW_AT_high_pc
	.byte	17                      # Abbrev [17] 0xfb:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.long	1738                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x107:0x13 DW_TAG_inlined_subroutine
	.long	85                      # DW_AT_abstract_origin
	.quad	.Ltmp21                 # DW_AT_low_pc
	.long	.Ltmp22-.Ltmp21         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	11                      # DW_AT_call_line
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	19                      # Abbrev [19] 0x11c:0x23 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	20                      # Abbrev [20] 0x131:0xd DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	85
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	120                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	19                      # Abbrev [19] 0x13f:0x25 DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	15                      # Abbrev [15] 0x154:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc4            # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
	.long	120                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	21                      # Abbrev [21] 0x164:0x64 DW_TAG_subprogram
	.quad	.Lfunc_begin4           # DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin4 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	456                     # DW_AT_abstract_origin
	.byte	22                      # Abbrev [22] 0x177:0x5 DW_TAG_formal_parameter
	.long	468                     # DW_AT_abstract_origin
	.byte	22                      # Abbrev [22] 0x17c:0x5 DW_TAG_formal_parameter
	.long	479                     # DW_AT_abstract_origin
	.byte	22                      # Abbrev [22] 0x181:0x5 DW_TAG_formal_parameter
	.long	490                     # DW_AT_abstract_origin
	.byte	23                      # Abbrev [23] 0x186:0x5 DW_TAG_variable
	.long	501                     # DW_AT_abstract_origin
	.byte	23                      # Abbrev [23] 0x18b:0x5 DW_TAG_variable
	.long	512                     # DW_AT_abstract_origin
	.byte	23                      # Abbrev [23] 0x190:0x5 DW_TAG_variable
	.long	523                     # DW_AT_abstract_origin
	.byte	23                      # Abbrev [23] 0x195:0x5 DW_TAG_variable
	.long	534                     # DW_AT_abstract_origin
	.byte	23                      # Abbrev [23] 0x19a:0x5 DW_TAG_variable
	.long	545                     # DW_AT_abstract_origin
	.byte	23                      # Abbrev [23] 0x19f:0x5 DW_TAG_variable
	.long	556                     # DW_AT_abstract_origin
	.byte	23                      # Abbrev [23] 0x1a4:0x5 DW_TAG_variable
	.long	567                     # DW_AT_abstract_origin
	.byte	23                      # Abbrev [23] 0x1a9:0x5 DW_TAG_variable
	.long	578                     # DW_AT_abstract_origin
	.byte	23                      # Abbrev [23] 0x1ae:0x5 DW_TAG_variable
	.long	589                     # DW_AT_abstract_origin
	.byte	23                      # Abbrev [23] 0x1b3:0x5 DW_TAG_variable
	.long	600                     # DW_AT_abstract_origin
	.byte	23                      # Abbrev [23] 0x1b8:0x5 DW_TAG_variable
	.long	611                     # DW_AT_abstract_origin
	.byte	23                      # Abbrev [23] 0x1bd:0x5 DW_TAG_variable
	.long	622                     # DW_AT_abstract_origin
	.byte	23                      # Abbrev [23] 0x1c2:0x5 DW_TAG_variable
	.long	633                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	6                       # Abbrev [6] 0x1c8:0xbd DW_TAG_subprogram
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	165                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	7                       # Abbrev [7] 0x1d4:0xb DW_TAG_formal_parameter
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	120                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x1df:0xb DW_TAG_formal_parameter
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x1ea:0xb DW_TAG_formal_parameter
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x1f5:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x200:0xb DW_TAG_variable
	.long	.Linfo_string4          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	28                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x20b:0xb DW_TAG_variable
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	29                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x216:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	30                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x221:0xb DW_TAG_variable
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x22c:0xb DW_TAG_variable
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x237:0xb DW_TAG_variable
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	33                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x242:0xb DW_TAG_variable
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x24d:0xb DW_TAG_variable
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x258:0xb DW_TAG_variable
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x263:0xb DW_TAG_variable
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	37                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x26e:0xb DW_TAG_variable
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	38                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x279:0xb DW_TAG_variable
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	39                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	14                      # Abbrev [14] 0x285:0x1fe DW_TAG_subprogram
	.quad	.Lfunc_begin5           # DW_AT_low_pc
	.long	.Lfunc_end5-.Lfunc_begin5 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	89                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	165                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	15                      # Abbrev [15] 0x29e:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc5            # DW_AT_location
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	89                      # DW_AT_decl_line
	.long	1733                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x2ad:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc6            # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	89                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x2bc:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc7            # DW_AT_location
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	89                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x2cb:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc8            # DW_AT_location
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	89                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x2da:0xf DW_TAG_variable
	.long	.Ldebug_loc9            # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	99                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x2e9:0xf DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	100                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x2f8:0xf DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	120                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x307:0xf DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	119                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x316:0xf DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	118                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x325:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	117                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x334:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	116                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x343:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	115                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x352:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	112                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x361:0xf DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	111                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x370:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	105                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x37c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	104                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x388:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	103                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x394:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	102                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x3a0:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	98                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x3ac:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	97                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x3b8:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	96                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x3c4:0xf DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	94                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x3d3:0xf DW_TAG_variable
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	92                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	24                      # Abbrev [24] 0x3e2:0xf DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	91                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x3f1:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	90                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x3fd:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	107                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x409:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	110                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x415:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	109                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x421:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	113                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x42d:0xb DW_TAG_variable
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	93                      # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x438:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	95                      # DW_AT_decl_line
	.long	120                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x443:0xb DW_TAG_variable
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	101                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x44e:0xb DW_TAG_variable
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	106                     # DW_AT_decl_line
	.long	120                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x459:0xb DW_TAG_variable
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	108                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x464:0xb DW_TAG_variable
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	114                     # DW_AT_decl_line
	.long	120                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x46f:0x13 DW_TAG_inlined_subroutine
	.long	456                     # DW_AT_abstract_origin
	.quad	.Ltmp63                 # DW_AT_low_pc
	.long	.Ltmp66-.Ltmp63         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	212                     # DW_AT_call_line
	.byte	0                       # End Of Children Mark
	.byte	25                      # Abbrev [25] 0x483:0x242 DW_TAG_subprogram
	.quad	.Lfunc_begin6           # DW_AT_low_pc
	.long	.Lfunc_end6-.Lfunc_begin6 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	286                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1738                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	26                      # Abbrev [26] 0x49d:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	286                     # DW_AT_decl_line
	.long	1738                    # DW_AT_type
	.byte	26                      # Abbrev [26] 0x4ad:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	286                     # DW_AT_decl_line
	.long	1745                    # DW_AT_type
	.byte	27                      # Abbrev [27] 0x4bd:0x10 DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	288                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	27                      # Abbrev [27] 0x4cd:0x10 DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	290                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	27                      # Abbrev [27] 0x4dd:0x10 DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	291                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	28                      # Abbrev [28] 0x4ed:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	293                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	28                      # Abbrev [28] 0x4fa:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	293                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	28                      # Abbrev [28] 0x507:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	294                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	28                      # Abbrev [28] 0x514:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	295                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	28                      # Abbrev [28] 0x521:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	296                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	28                      # Abbrev [28] 0x52e:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	297                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	27                      # Abbrev [27] 0x53b:0x10 DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	.Linfo_string66         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	300                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	27                      # Abbrev [27] 0x54b:0x10 DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	301                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	28                      # Abbrev [28] 0x55b:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	302                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	27                      # Abbrev [27] 0x568:0x10 DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	304                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	27                      # Abbrev [27] 0x578:0x10 DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	306                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	27                      # Abbrev [27] 0x588:0x10 DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	309                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	27                      # Abbrev [27] 0x598:0x10 DW_TAG_variable
	.long	.Ldebug_loc32           # DW_AT_location
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	312                     # DW_AT_decl_line
	.long	165                     # DW_AT_type
	.byte	27                      # Abbrev [27] 0x5a8:0x10 DW_TAG_variable
	.long	.Ldebug_loc33           # DW_AT_location
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	293                     # DW_AT_decl_line
	.long	1762                    # DW_AT_type
	.byte	27                      # Abbrev [27] 0x5b8:0x10 DW_TAG_variable
	.long	.Ldebug_loc34           # DW_AT_location
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	295                     # DW_AT_decl_line
	.long	1767                    # DW_AT_type
	.byte	27                      # Abbrev [27] 0x5c8:0x10 DW_TAG_variable
	.long	.Ldebug_loc35           # DW_AT_location
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	287                     # DW_AT_decl_line
	.long	1767                    # DW_AT_type
	.byte	27                      # Abbrev [27] 0x5d8:0x10 DW_TAG_variable
	.long	.Ldebug_loc36           # DW_AT_location
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	292                     # DW_AT_decl_line
	.long	1767                    # DW_AT_type
	.byte	27                      # Abbrev [27] 0x5e8:0x10 DW_TAG_variable
	.long	.Ldebug_loc37           # DW_AT_location
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	304                     # DW_AT_decl_line
	.long	1767                    # DW_AT_type
	.byte	27                      # Abbrev [27] 0x5f8:0x10 DW_TAG_variable
	.long	.Ldebug_loc38           # DW_AT_location
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	306                     # DW_AT_decl_line
	.long	1767                    # DW_AT_type
	.byte	27                      # Abbrev [27] 0x608:0x10 DW_TAG_variable
	.long	.Ldebug_loc39           # DW_AT_location
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	309                     # DW_AT_decl_line
	.long	1767                    # DW_AT_type
	.byte	27                      # Abbrev [27] 0x618:0x10 DW_TAG_variable
	.long	.Ldebug_loc40           # DW_AT_location
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	312                     # DW_AT_decl_line
	.long	1767                    # DW_AT_type
	.byte	29                      # Abbrev [29] 0x628:0xc DW_TAG_variable
	.long	.Linfo_string75         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	289                     # DW_AT_decl_line
	.long	1733                    # DW_AT_type
	.byte	29                      # Abbrev [29] 0x634:0xc DW_TAG_variable
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	298                     # DW_AT_decl_line
	.long	120                     # DW_AT_type
	.byte	29                      # Abbrev [29] 0x640:0xc DW_TAG_variable
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	299                     # DW_AT_decl_line
	.long	1733                    # DW_AT_type
	.byte	29                      # Abbrev [29] 0x64c:0xc DW_TAG_variable
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	303                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	29                      # Abbrev [29] 0x658:0xc DW_TAG_variable
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	305                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	29                      # Abbrev [29] 0x664:0xc DW_TAG_variable
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	307                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	29                      # Abbrev [29] 0x670:0xc DW_TAG_variable
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	308                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	29                      # Abbrev [29] 0x67c:0xc DW_TAG_variable
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	310                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	29                      # Abbrev [29] 0x688:0xc DW_TAG_variable
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	311                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	16                      # Abbrev [16] 0x694:0x30 DW_TAG_lexical_block
	.quad	.Ltmp95                 # DW_AT_low_pc
	.long	.Ltmp100-.Ltmp95        # DW_AT_high_pc
	.byte	28                      # Abbrev [28] 0x6a1:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	337                     # DW_AT_decl_line
	.long	1738                    # DW_AT_type
	.byte	30                      # Abbrev [30] 0x6ae:0x15 DW_TAG_inlined_subroutine
	.long	85                      # DW_AT_abstract_origin
	.quad	.Ltmp97                 # DW_AT_low_pc
	.long	.Ltmp98-.Ltmp97         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.short	337                     # DW_AT_call_line
	.byte	3                       # DW_AT_GNU_discriminator
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0x6c5:0x5 DW_TAG_pointer_type
	.long	120                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x6ca:0x7 DW_TAG_base_type
	.long	.Linfo_string30         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	9                       # Abbrev [9] 0x6d1:0x5 DW_TAG_pointer_type
	.long	1750                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0x6d6:0x5 DW_TAG_pointer_type
	.long	1755                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x6db:0x7 DW_TAG_base_type
	.long	.Linfo_string60         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	9                       # Abbrev [9] 0x6e2:0x5 DW_TAG_pointer_type
	.long	1767                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0x6e7:0x5 DW_TAG_pointer_type
	.long	165                     # DW_AT_type
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
	.long	1773                    # Compilation Unit Length
	.long	456                     # DIE offset
	.asciz	"conflict"              # External Name
	.long	284                     # DIE offset
	.asciz	"free_POS"              # External Name
	.long	319                     # DIE offset
	.asciz	"printf_POS"            # External Name
	.long	645                     # DIE offset
	.asciz	"run"                   # External Name
	.long	1155                    # DIE offset
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
	.long	1773                    # Compilation Unit Length
	.long	125                     # DIE offset
	.asciz	"POS"                   # External Name
	.long	165                     # DIE offset
	.asciz	"long long int"         # External Name
	.long	1738                    # DIE offset
	.asciz	"int"                   # External Name
	.long	1755                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git 83402ed45b681e9f38ce6626e5899c19159ceb29) (http://llvm.org/git/llvm.git 4fc8e6fd79f212952e8f538b6d5d9d78098b4505)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
