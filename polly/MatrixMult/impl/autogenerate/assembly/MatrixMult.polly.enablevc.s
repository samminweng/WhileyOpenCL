	.text
	.file	"MatrixMult.polly.enablevc.ll"
	.globl	copy_Matrix
	.p2align	4, 0x90
	.type	copy_Matrix,@function
copy_Matrix:                            # @copy_Matrix
.Lfunc_begin0:
	.file	1 "MatrixMult.c"
	.loc	1 2 0                   # MatrixMult.c:2:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp0:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp1:
	.cfi_def_cfa_offset 24
	pushq	%rax
.Ltmp2:
	.cfi_def_cfa_offset 32
.Ltmp3:
	.cfi_offset %rbx, -24
.Ltmp4:
	.cfi_offset %r14, -16
	#DEBUG_VALUE: copy_Matrix:_Matrix <- %RDI
	movq	%rdi, %r14
.Ltmp5:
	#DEBUG_VALUE: copy_Matrix:_Matrix <- %R14
	.loc	1 3 23 prologue_end discriminator 1 # MatrixMult.c:3:23
	movl	$32, %edi
	callq	malloc
	movq	%rax, %rbx
.Ltmp6:
	#DEBUG_VALUE: copy_Matrix:new_Matrix <- %RBX
	.loc	1 4 2                   # MatrixMult.c:4:2
	movq	8(%r14), %rsi
	movq	%rsi, 8(%rbx)
	movq	(%r14), %rdi
	callq	copy
	movq	%rax, (%rbx)
	.loc	1 5 31                  # MatrixMult.c:5:31
	movups	16(%r14), %xmm0
	.loc	1 5 20 is_stmt 0        # MatrixMult.c:5:20
	movups	%xmm0, 16(%rbx)
	.loc	1 7 2 is_stmt 1         # MatrixMult.c:7:2
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
.Ltmp7:
	popq	%r14
.Ltmp8:
	retq
.Ltmp9:
.Lfunc_end0:
	.size	copy_Matrix, .Lfunc_end0-copy_Matrix
	.cfi_endproc

	.globl	free_Matrix
	.p2align	4, 0x90
	.type	free_Matrix,@function
free_Matrix:                            # @free_Matrix
.Lfunc_begin1:
	.loc	1 9 0                   # MatrixMult.c:9:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp10:
	.cfi_def_cfa_offset 16
.Ltmp11:
	.cfi_offset %rbx, -16
	#DEBUG_VALUE: free_Matrix:matrix <- %RDI
	movq	%rdi, %rbx
.Ltmp12:
	#DEBUG_VALUE: free_Matrix:matrix <- %RBX
	.loc	1 10 15 prologue_end    # MatrixMult.c:10:15
	movq	(%rbx), %rdi
	.loc	1 10 2 is_stmt 0        # MatrixMult.c:10:2
	callq	free
	.loc	1 11 2 is_stmt 1        # MatrixMult.c:11:2
	movq	%rbx, %rdi
	popq	%rbx
.Ltmp13:
	jmp	free                    # TAILCALL
.Ltmp14:
.Lfunc_end1:
	.size	free_Matrix, .Lfunc_end1-free_Matrix
	.cfi_endproc

	.globl	printf_Matrix
	.p2align	4, 0x90
	.type	printf_Matrix,@function
printf_Matrix:                          # @printf_Matrix
.Lfunc_begin2:
	.loc	1 13 0                  # MatrixMult.c:13:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp15:
	.cfi_def_cfa_offset 16
.Ltmp16:
	.cfi_offset %rbx, -16
	#DEBUG_VALUE: printf_Matrix:matrix <- %RDI
	movq	%rdi, %rbx
.Ltmp17:
	#DEBUG_VALUE: printf_Matrix:matrix <- %RBX
	.loc	1 14 2 prologue_end     # MatrixMult.c:14:2
	movl	$123, %edi
	callq	putchar
	.loc	1 15 2                  # MatrixMult.c:15:2
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 16 2                  # MatrixMult.c:16:2
	movq	(%rbx), %rdi
	movq	8(%rbx), %rsi
	xorl	%eax, %eax
	callq	printf1DArray
	.loc	1 17 2                  # MatrixMult.c:17:2
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 18 23                 # MatrixMult.c:18:23
	movq	16(%rbx), %rsi
	.loc	1 18 2 is_stmt 0        # MatrixMult.c:18:2
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 19 2 is_stmt 1        # MatrixMult.c:19:2
	movl	$.L.str.4, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 20 23                 # MatrixMult.c:20:23
	movq	24(%rbx), %rsi
	.loc	1 20 2 is_stmt 0        # MatrixMult.c:20:2
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 21 2 is_stmt 1        # MatrixMult.c:21:2
	movl	$125, %edi
	popq	%rbx
.Ltmp18:
	jmp	putchar                 # TAILCALL
.Ltmp19:
.Lfunc_end2:
	.size	printf_Matrix, .Lfunc_end2-printf_Matrix
	.cfi_endproc

	.globl	matrix
	.p2align	4, 0x90
	.type	matrix,@function
matrix:                                 # @matrix
.Lfunc_begin3:
	.loc	1 23 0                  # MatrixMult.c:23:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp20:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp21:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp22:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp23:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp24:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp25:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Ltmp26:
	.cfi_def_cfa_offset 64
.Ltmp27:
	.cfi_offset %rbx, -56
.Ltmp28:
	.cfi_offset %r12, -48
.Ltmp29:
	.cfi_offset %r13, -40
.Ltmp30:
	.cfi_offset %r14, -32
.Ltmp31:
	.cfi_offset %r15, -24
.Ltmp32:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: matrix:width <- %RDI
	#DEBUG_VALUE: matrix:height <- %RSI
	#DEBUG_VALUE: matrix:data <- %RDX
	#DEBUG_VALUE: matrix:data_size <- %RCX
	#DEBUG_VALUE: matrix:data_has_ownership [bit_piece offset=0 size=1] <- %R8D
	movl	%r8d, %r15d
.Ltmp33:
	#DEBUG_VALUE: matrix:data_has_ownership [bit_piece offset=0 size=1] <- %R15D
	movq	%rcx, %rbp
.Ltmp34:
	#DEBUG_VALUE: matrix:data_size <- %RBP
	movq	%rdx, %r14
.Ltmp35:
	#DEBUG_VALUE: matrix:data <- %R14
	movq	%rsi, %r12
.Ltmp36:
	#DEBUG_VALUE: matrix:height <- %R12
	movq	%rdi, %r13
.Ltmp37:
	#DEBUG_VALUE: matrix:_4_has_ownership <- 0
	#DEBUG_VALUE: matrix:r_has_ownership <- 0
	#DEBUG_VALUE: matrix:data_has_ownership [bit_piece offset=0 size=1] <- %R15B
	#DEBUG_VALUE: matrix:width <- %R13
	.loc	1 30 7 prologue_end     # MatrixMult.c:30:7
	movl	$32, %edi
	callq	malloc
	movq	%rax, %rbx
	.loc	1 31 2                  # MatrixMult.c:31:2
	movq	%rbp, 8(%rbx)
	movq	%r14, %rdi
	movq	%rbp, %rsi
	callq	copy
	movq	%rax, (%rbx)
	.loc	1 32 13                 # MatrixMult.c:32:13
	movq	%r12, 24(%rbx)
	.loc	1 33 12                 # MatrixMult.c:33:12
	movq	%r13, 16(%rbx)
.Ltmp38:
	#DEBUG_VALUE: matrix:_4_has_ownership <- 1
	.loc	1 36 2                  # MatrixMult.c:36:2
	testb	%r15b, %r15b
	je	.LBB3_2
.Ltmp39:
# BB#1:                                 # %if.then7
	#DEBUG_VALUE: matrix:width <- %R13
	#DEBUG_VALUE: matrix:data_has_ownership [bit_piece offset=0 size=1] <- %R15B
	#DEBUG_VALUE: matrix:height <- %R12
	#DEBUG_VALUE: matrix:data <- %R14
	#DEBUG_VALUE: matrix:data_size <- %RBP
	.loc	1 36 2 is_stmt 0 discriminator 1 # MatrixMult.c:36:2
	movq	%r14, %rdi
	callq	free
.Ltmp40:
	#DEBUG_VALUE: matrix:data_has_ownership <- 0
.LBB3_2:                                # %if.end11
	#DEBUG_VALUE: matrix:width <- %R13
	#DEBUG_VALUE: matrix:height <- %R12
	#DEBUG_VALUE: matrix:data <- %R14
	#DEBUG_VALUE: matrix:data_size <- %RBP
	.loc	1 38 2 is_stmt 1        # MatrixMult.c:38:2
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
.Ltmp41:
	popq	%r13
.Ltmp42:
	popq	%r14
.Ltmp43:
	popq	%r15
	popq	%rbp
.Ltmp44:
	retq
.Ltmp45:
.Lfunc_end3:
	.size	matrix, .Lfunc_end3-matrix
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI4_0:
	.quad	10                      # 0xa
	.quad	10                      # 0xa
	.text
	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
.Lfunc_begin4:
	.loc	1 42 0                  # MatrixMult.c:42:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp46:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp47:
	.cfi_def_cfa_offset 24
	pushq	%rax
.Ltmp48:
	.cfi_def_cfa_offset 32
.Ltmp49:
	.cfi_offset %rbx, -24
.Ltmp50:
	.cfi_offset %r14, -16
.Ltmp51:
	#DEBUG_VALUE: init:r_has_ownership <- 0
	#DEBUG_VALUE: init:data_size <- 0
	#DEBUG_VALUE: init:data_has_ownership <- 0
	#DEBUG_VALUE: init:i <- 0
	#DEBUG_VALUE: init:j <- 0
	#DEBUG_VALUE: init:_4 <- 0
	#DEBUG_VALUE: init:_5 <- 10
	#DEBUG_VALUE: init:_6 <- 10
	#DEBUG_VALUE: init:_7 <- 100
	#DEBUG_VALUE: init:_8_size <- 100
	#DEBUG_VALUE: init:_8_has_ownership <- 0
	#DEBUG_VALUE: init:_9 <- 0
	#DEBUG_VALUE: init:_10 <- 0
	#DEBUG_VALUE: init:_11 <- 0
	#DEBUG_VALUE: init:_12 <- 0
	#DEBUG_VALUE: init:_13 <- 0
	#DEBUG_VALUE: init:_14 <- 0
	#DEBUG_VALUE: init:_15 <- 0
	#DEBUG_VALUE: init:_16 <- 0
	#DEBUG_VALUE: init:_17 <- 0
	#DEBUG_VALUE: init:_18 <- 0
	#DEBUG_VALUE: init:_19 <- 0
	#DEBUG_VALUE: init:_20 <- 0
	#DEBUG_VALUE: init:_21 <- 0
	#DEBUG_VALUE: init:_22 <- 0
	#DEBUG_VALUE: init:_23 <- 0
	#DEBUG_VALUE: init:_24 <- 0
	#DEBUG_VALUE: init:_25_has_ownership <- 0
	#DEBUG_VALUE: init:_26 <- 0
	#DEBUG_VALUE: init:_27 <- 0
	xorl	%ebx, %ebx
.Ltmp52:
	.loc	1 85 2 prologue_end     # MatrixMult.c:85:2
	xorl	%edi, %edi
	movl	$100, %esi
	callq	gen1DArray
	movq	%rax, %r14
.Ltmp53:
	#DEBUG_VALUE: init:data <- %R14
	#DEBUG_VALUE: init:_8 <- %R14
	#DEBUG_VALUE: matrix:data <- %R14
	#DEBUG_VALUE: init:_10 <- 10
	#DEBUG_VALUE: init:data_has_ownership <- 1
	#DEBUG_VALUE: init:data_size <- 100
	addq	$64, %rax
.Ltmp54:
	.p2align	4, 0x90
.LBB4_1:                                # %polly.loop_preheader85
                                        # =>This Inner Loop Header: Depth=1
	movdqu	-64(%rax), %xmm0
.Ltmp55:
	.loc	1 121 11                # MatrixMult.c:121:11
	movd	%rbx, %xmm1
	pshufd	$68, %xmm1, %xmm1       # xmm1 = xmm1[0,1,0,1]
	paddq	%xmm1, %xmm0
	movdqu	%xmm0, -64(%rax)
	movdqu	-48(%rax), %xmm0
	paddq	%xmm1, %xmm0
	movdqu	%xmm0, -48(%rax)
	movdqu	-32(%rax), %xmm0
	paddq	%xmm1, %xmm0
	movdqu	%xmm0, -32(%rax)
	movdqu	-16(%rax), %xmm0
	paddq	%xmm1, %xmm0
	movdqu	%xmm0, -16(%rax)
	movdqu	(%rax), %xmm0
	paddq	%xmm1, %xmm0
	movdqu	%xmm0, (%rax)
	incq	%rbx
	addq	$80, %rax
	cmpq	$10, %rbx
	jne	.LBB4_1
.Ltmp56:
# BB#2:                                 # %polly.exiting
	#DEBUG_VALUE: init:data_has_ownership <- 1
	#DEBUG_VALUE: init:_26 <- 10
	#DEBUG_VALUE: init:_27 <- 10
	#DEBUG_VALUE: matrix:width <- 10
	#DEBUG_VALUE: matrix:height <- 10
	#DEBUG_VALUE: matrix:data_size <- 100
	#DEBUG_VALUE: matrix:data_has_ownership [bit_piece offset=0 size=1] <- 0
	#DEBUG_VALUE: matrix:r_has_ownership <- 0
	#DEBUG_VALUE: matrix:_4_has_ownership <- 0
	.loc	1 30 7                  # MatrixMult.c:30:7
	movl	$32, %edi
	callq	malloc
	movq	%rax, %rbx
.Ltmp57:
	#DEBUG_VALUE: matrix:_4 <- %RBX
	#DEBUG_VALUE: init:_25 <- %RBX
	.loc	1 31 2                  # MatrixMult.c:31:2
	movq	$100, 8(%rbx)
	movl	$100, %esi
	movq	%r14, %rdi
	callq	copy
	movq	%rax, (%rbx)
	.loc	1 33 12                 # MatrixMult.c:33:12
	movaps	.LCPI4_0(%rip), %xmm0   # xmm0 = [10,10]
	movups	%xmm0, 16(%rbx)
.Ltmp58:
	#DEBUG_VALUE: matrix:_4_has_ownership <- 1
	#DEBUG_VALUE: init:_25_has_ownership <- 1
	.loc	1 163 2 discriminator 1 # MatrixMult.c:163:2
	movq	%r14, %rdi
	callq	free
.Ltmp59:
	#DEBUG_VALUE: init:data_has_ownership <- 0
	.loc	1 165 2                 # MatrixMult.c:165:2
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
.Ltmp60:
	popq	%r14
	retq
.Ltmp61:
.Lfunc_end4:
	.size	init, .Lfunc_end4-init
	.cfi_endproc
	.file	2 "./MatrixMult.h"

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI5_0:
	.quad	10                      # 0xa
	.quad	10                      # 0xa
	.text
	.globl	mat_mult
	.p2align	4, 0x90
	.type	mat_mult,@function
mat_mult:                               # @mat_mult
.Lfunc_begin5:
	.loc	1 169 0                 # MatrixMult.c:169:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp62:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp63:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp64:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp65:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp66:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp67:
	.cfi_def_cfa_offset 56
	subq	$72, %rsp
.Ltmp68:
	.cfi_def_cfa_offset 128
.Ltmp69:
	.cfi_offset %rbx, -56
.Ltmp70:
	.cfi_offset %r12, -48
.Ltmp71:
	.cfi_offset %r13, -40
.Ltmp72:
	.cfi_offset %r14, -32
.Ltmp73:
	.cfi_offset %r15, -24
.Ltmp74:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: mat_mult:a <- %RDI
	#DEBUG_VALUE: mat_mult:a_has_ownership [bit_piece offset=0 size=1] <- %ESI
	#DEBUG_VALUE: mat_mult:b <- %RDX
	#DEBUG_VALUE: mat_mult:b_has_ownership [bit_piece offset=0 size=1] <- %ECX
	movl	%ecx, %r12d
.Ltmp75:
	#DEBUG_VALUE: mat_mult:b_has_ownership [bit_piece offset=0 size=1] <- %R12D
	movq	%rdx, %r14
.Ltmp76:
	#DEBUG_VALUE: mat_mult:b <- %R14
	movl	%esi, 12(%rsp)          # 4-byte Spill
.Ltmp77:
	#DEBUG_VALUE: mat_mult:a_has_ownership [bit_piece offset=0 size=1] <-  [complex expression]
	movq	%rdi, %r13
.Ltmp78:
	#DEBUG_VALUE: mat_mult:_47 <- 0
	#DEBUG_VALUE: mat_mult:_46 <- 0
	#DEBUG_VALUE: mat_mult:_45_has_ownership <- 0
	#DEBUG_VALUE: mat_mult:_44 <- 0
	#DEBUG_VALUE: mat_mult:_43 <- 0
	#DEBUG_VALUE: mat_mult:_42 <- 0
	#DEBUG_VALUE: mat_mult:_41 <- 0
	#DEBUG_VALUE: mat_mult:_40 <- 0
	#DEBUG_VALUE: mat_mult:_39 <- 0
	#DEBUG_VALUE: mat_mult:_38 <- 0
	#DEBUG_VALUE: mat_mult:_37 <- 0
	#DEBUG_VALUE: mat_mult:_36 <- 0
	#DEBUG_VALUE: mat_mult:_35 <- 0
	#DEBUG_VALUE: mat_mult:_34 <- 0
	#DEBUG_VALUE: mat_mult:_33 <- 0
	#DEBUG_VALUE: mat_mult:_32 <- 0
	#DEBUG_VALUE: mat_mult:_31 <- 0
	#DEBUG_VALUE: mat_mult:_30 <- 0
	#DEBUG_VALUE: mat_mult:_29 <- 0
	#DEBUG_VALUE: mat_mult:_28 <- 0
	#DEBUG_VALUE: mat_mult:_27 <- 0
	#DEBUG_VALUE: mat_mult:_26 <- 0
	#DEBUG_VALUE: mat_mult:_25 <- 0
	#DEBUG_VALUE: mat_mult:_24 <- 0
	#DEBUG_VALUE: mat_mult:_23 <- 0
	#DEBUG_VALUE: mat_mult:_22 <- 0
	#DEBUG_VALUE: mat_mult:_21 <- 0
	#DEBUG_VALUE: mat_mult:_20 <- 0
	#DEBUG_VALUE: mat_mult:_19 <- 0
	#DEBUG_VALUE: mat_mult:_18 <- 0
	#DEBUG_VALUE: mat_mult:_17 <- 0
	#DEBUG_VALUE: mat_mult:_16 <- 0
	#DEBUG_VALUE: mat_mult:_15_has_ownership <- 0
	#DEBUG_VALUE: mat_mult:_15_size <- 0
	#DEBUG_VALUE: mat_mult:_14_has_ownership <- 0
	#DEBUG_VALUE: mat_mult:_14_size <- 0
	#DEBUG_VALUE: mat_mult:_13_has_ownership <- 0
	#DEBUG_VALUE: mat_mult:_13_size <- 100
	#DEBUG_VALUE: mat_mult:_12 <- 100
	#DEBUG_VALUE: mat_mult:_11 <- 10
	#DEBUG_VALUE: mat_mult:_10 <- 10
	#DEBUG_VALUE: mat_mult:_9 <- 0
	#DEBUG_VALUE: mat_mult:k <- 0
	#DEBUG_VALUE: mat_mult:j <- 0
	#DEBUG_VALUE: mat_mult:i <- 0
	#DEBUG_VALUE: mat_mult:b_data_has_ownership <- 0
	#DEBUG_VALUE: mat_mult:b_data_size <- 0
	#DEBUG_VALUE: mat_mult:a_data_has_ownership <- 0
	#DEBUG_VALUE: mat_mult:a_data_size <- 0
	#DEBUG_VALUE: mat_mult:data_has_ownership <- 0
	#DEBUG_VALUE: mat_mult:data_size <- 0
	#DEBUG_VALUE: mat_mult:r_has_ownership <- 0
	#DEBUG_VALUE: mat_mult:a <- %R13
	.loc	1 234 2 prologue_end    # MatrixMult.c:234:2
	xorl	%edi, %edi
	movl	$100, %esi
	callq	gen1DArray
.Ltmp79:
	movq	%rax, %r15
.Ltmp80:
	#DEBUG_VALUE: mat_mult:data <- %R15
	#DEBUG_VALUE: mat_mult:_13 <- %R15
	#DEBUG_VALUE: matrix:data <- %R15
	#DEBUG_VALUE: mat_mult:data_has_ownership <- 1
	#DEBUG_VALUE: mat_mult:data_size <- 100
	.loc	1 243 2                 # MatrixMult.c:243:2
	movq	(%r13), %rdi
	movq	8(%r13), %rsi
	callq	copy
	movq	%rax, %rbp
.Ltmp81:
	#DEBUG_VALUE: mat_mult:a_data <- %RBP
	#DEBUG_VALUE: mat_mult:_14 <- %RBP
	#DEBUG_VALUE: mat_mult:a_data_has_ownership <- 1
	.loc	1 252 2                 # MatrixMult.c:252:2
	movq	(%r14), %rdi
	movq	8(%r14), %rsi
	callq	copy
	movq	%rax, %rbx
.Ltmp82:
	#DEBUG_VALUE: mat_mult:b_data <- %RBX
	#DEBUG_VALUE: mat_mult:_15 <- %RBX
	#DEBUG_VALUE: mat_mult:_17 <- 10
	#DEBUG_VALUE: mat_mult:b_data_has_ownership <- 1
	leaq	800(%rbx), %rax
	cmpq	%r15, %rax
	setbe	%dil
	leaq	800(%r15), %rdx
	cmpq	%rbx, %rdx
	setbe	%cl
	leaq	800(%rbp), %rsi
	cmpq	%r15, %rsi
	setbe	%al
	cmpq	%rbp, %rdx
	setbe	%dl
	orb	%al, %dl
	movzbl	%dl, %eax
	cmpl	$1, %eax
	jne	.LBB5_2
.Ltmp83:
# BB#1:                                 # %entry
	#DEBUG_VALUE: mat_mult:_15 <- %RBX
	#DEBUG_VALUE: mat_mult:b_data <- %RBX
	#DEBUG_VALUE: mat_mult:_14 <- %RBP
	#DEBUG_VALUE: mat_mult:a_data <- %RBP
	#DEBUG_VALUE: matrix:data <- %R15
	#DEBUG_VALUE: mat_mult:_13 <- %R15
	#DEBUG_VALUE: mat_mult:data <- %R15
	#DEBUG_VALUE: mat_mult:a <- %R13
	#DEBUG_VALUE: mat_mult:b <- %R14
	#DEBUG_VALUE: mat_mult:b_has_ownership [bit_piece offset=0 size=1] <- %R12D
	orb	%dil, %cl
	je	.LBB5_2
.Ltmp84:
# BB#14:                                # %polly.loop_preheader189.preheader
	#DEBUG_VALUE: mat_mult:b_has_ownership [bit_piece offset=0 size=1] <- %R12D
	#DEBUG_VALUE: mat_mult:b <- %R14
	#DEBUG_VALUE: mat_mult:a <- %R13
	#DEBUG_VALUE: mat_mult:data <- %R15
	#DEBUG_VALUE: mat_mult:_13 <- %R15
	#DEBUG_VALUE: matrix:data <- %R15
	#DEBUG_VALUE: mat_mult:a_data <- %RBP
	#DEBUG_VALUE: mat_mult:_14 <- %RBP
	#DEBUG_VALUE: mat_mult:b_data <- %RBX
	#DEBUG_VALUE: mat_mult:_15 <- %RBX
	movq	%r13, 16(%rsp)          # 8-byte Spill
	movl	%r12d, 8(%rsp)          # 4-byte Spill
	movq	%r14, 24(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%r15, %r8
	movq	%r15, 32(%rsp)          # 8-byte Spill
.Ltmp85:
	.p2align	4, 0x90
.LBB5_12:                               # %polly.loop_preheader189
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_13 Depth 2
	movq	%r8, 40(%rsp)           # 8-byte Spill
	movq	%rax, 48(%rsp)          # 8-byte Spill
	leaq	(%rax,%rax,4), %rcx
	shlq	$4, %rcx
	movq	(%rbp,%rcx), %rax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	8(%rbp,%rcx), %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	16(%rbp,%rcx), %r15
	movq	24(%rbp,%rcx), %r9
	movq	32(%rbp,%rcx), %r11
	movq	40(%rbp,%rcx), %rdx
	movq	48(%rbp,%rcx), %rsi
	movq	56(%rbp,%rcx), %rdi
	movq	64(%rbp,%rcx), %r14
	movq	72(%rbp,%rcx), %r13
	movq	$-80, %r12
	.p2align	4, 0x90
.LBB5_13:                               # %polly.loop_preheader195
                                        #   Parent Loop BB5_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	80(%rbx,%r12), %rcx
.Ltmp86:
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	64(%rsp), %rcx          # 8-byte Folded Reload
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	(%r8), %rcx
	movq	160(%rbx,%r12), %r10
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	56(%rsp), %r10          # 8-byte Folded Reload
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	%rcx, %r10
	movq	240(%rbx,%r12), %rcx
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	%r15, %rcx
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	%r10, %rcx
	movq	320(%rbx,%r12), %rax
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	%r9, %rax
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	%rcx, %rax
	movq	400(%rbx,%r12), %rcx
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	%r11, %rcx
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	%rax, %rcx
	movq	480(%rbx,%r12), %rax
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	%rdx, %rax
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	%rcx, %rax
	movq	560(%rbx,%r12), %rcx
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	%rsi, %rcx
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	%rax, %rcx
	movq	640(%rbx,%r12), %rax
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	%rdi, %rax
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	%rcx, %rax
	movq	720(%rbx,%r12), %rcx
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	%r14, %rcx
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	%rax, %rcx
	movq	800(%rbx,%r12), %rax
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	%r13, %rax
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	%rcx, %rax
	movq	%rax, (%r8)
	addq	$8, %r8
	addq	$8, %r12
	jne	.LBB5_13
# BB#11:                                # %polly.loop_exit190
                                        #   in Loop: Header=BB5_12 Depth=1
	movq	48(%rsp), %rax          # 8-byte Reload
	incq	%rax
	movq	40(%rsp), %r8           # 8-byte Reload
	addq	$80, %r8
	cmpq	$10, %rax
	jne	.LBB5_12
	jmp	.LBB5_6
.LBB5_2:                                # %while.body30.preheader.preheader
.Ltmp87:
	#DEBUG_VALUE: mat_mult:_15 <- %RBX
	#DEBUG_VALUE: mat_mult:b_data <- %RBX
	#DEBUG_VALUE: mat_mult:_14 <- %RBP
	#DEBUG_VALUE: mat_mult:a_data <- %RBP
	#DEBUG_VALUE: matrix:data <- %R15
	#DEBUG_VALUE: mat_mult:_13 <- %R15
	#DEBUG_VALUE: mat_mult:data <- %R15
	#DEBUG_VALUE: mat_mult:a <- %R13
	#DEBUG_VALUE: mat_mult:b <- %R14
	#DEBUG_VALUE: mat_mult:b_has_ownership [bit_piece offset=0 size=1] <- %R12D
	movq	%r13, 16(%rsp)          # 8-byte Spill
	movl	%r12d, 8(%rsp)          # 4-byte Spill
	movq	%r14, 24(%rsp)          # 8-byte Spill
	xorl	%r9d, %r9d
	movq	%r15, %r8
	movq	%r15, 32(%rsp)          # 8-byte Spill
.Ltmp88:
	.p2align	4, 0x90
.LBB5_3:                                # %while.body30.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_4 Depth 2
	#DEBUG_VALUE: mat_mult:_19 <- 10
	.loc	1 292 10                # MatrixMult.c:292:10
	leaq	(%r9,%r9), %rcx
	leaq	(%rcx,%rcx,4), %rdx
	.loc	1 302 12                # MatrixMult.c:302:12
	movq	%rdx, %r10
	orq	$1, %r10
	movq	$-80, %rdi
	movq	%r8, %rcx
	.p2align	4, 0x90
.LBB5_4:                                # %while.body36.preheader
                                        #   Parent Loop BB5_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp89:
	#DEBUG_VALUE: mat_mult:_21 <- 10
	#DEBUG_VALUE: mat_mult:_22 <- 10
	#DEBUG_VALUE: mat_mult:_26 <- 10
	#DEBUG_VALUE: mat_mult:_30 <- 10
	#DEBUG_VALUE: mat_mult:_31 <- 0
	.loc	1 312 9                 # MatrixMult.c:312:9
	movq	80(%rbx,%rdi), %rax
.Ltmp90:
	#DEBUG_VALUE: mat_mult:_33 <- %RAX
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	(%rbp,%rdx,8), %rax
.Ltmp91:
	#DEBUG_VALUE: mat_mult:_34 <- %RAX
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	(%rcx), %rax
.Ltmp92:
	#DEBUG_VALUE: mat_mult:_40 <- 1
	#DEBUG_VALUE: mat_mult:_39 <- 1
	#DEBUG_VALUE: mat_mult:_36 <- 10
	#DEBUG_VALUE: mat_mult:_35 <- %RAX
	#DEBUG_VALUE: mat_mult:k <- 1
	.loc	1 324 15                # MatrixMult.c:324:15
	movq	%rax, (%rcx)
	.loc	1 312 9                 # MatrixMult.c:312:9
	movq	160(%rbx,%rdi), %rsi
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	(%rbp,%r10,8), %rsi
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	%rax, %rsi
	.loc	1 324 15                # MatrixMult.c:324:15
	movq	%rsi, (%rcx)
	.loc	1 312 9                 # MatrixMult.c:312:9
	movq	240(%rbx,%rdi), %rax
.Ltmp93:
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	16(%rbp,%rdx,8), %rax
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	%rsi, %rax
	.loc	1 324 15                # MatrixMult.c:324:15
	movq	%rax, (%rcx)
	.loc	1 312 9                 # MatrixMult.c:312:9
	movq	320(%rbx,%rdi), %rsi
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	24(%rbp,%rdx,8), %rsi
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	%rax, %rsi
	.loc	1 324 15                # MatrixMult.c:324:15
	movq	%rsi, (%rcx)
	.loc	1 312 9                 # MatrixMult.c:312:9
	movq	400(%rbx,%rdi), %rax
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	32(%rbp,%rdx,8), %rax
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	%rsi, %rax
	.loc	1 324 15                # MatrixMult.c:324:15
	movq	%rax, (%rcx)
	.loc	1 312 9                 # MatrixMult.c:312:9
	movq	480(%rbx,%rdi), %rsi
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	40(%rbp,%rdx,8), %rsi
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	%rax, %rsi
	.loc	1 324 15                # MatrixMult.c:324:15
	movq	%rsi, (%rcx)
	.loc	1 312 9                 # MatrixMult.c:312:9
	movq	560(%rbx,%rdi), %rax
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	48(%rbp,%rdx,8), %rax
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	%rsi, %rax
	.loc	1 324 15                # MatrixMult.c:324:15
	movq	%rax, (%rcx)
	.loc	1 312 9                 # MatrixMult.c:312:9
	movq	640(%rbx,%rdi), %rsi
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	56(%rbp,%rdx,8), %rsi
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	%rax, %rsi
	.loc	1 324 15                # MatrixMult.c:324:15
	movq	%rsi, (%rcx)
	.loc	1 312 9                 # MatrixMult.c:312:9
	movq	720(%rbx,%rdi), %rax
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	64(%rbp,%rdx,8), %rax
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	%rsi, %rax
	.loc	1 324 15                # MatrixMult.c:324:15
	movq	%rax, (%rcx)
	.loc	1 312 9                 # MatrixMult.c:312:9
	movq	800(%rbx,%rdi), %rsi
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	72(%rbp,%rdx,8), %rsi
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	%rax, %rsi
	.loc	1 324 15                # MatrixMult.c:324:15
	movq	%rsi, (%rcx)
.Ltmp94:
	.loc	1 278 7                 # MatrixMult.c:278:7
	addq	$8, %rcx
.Ltmp95:
	#DEBUG_VALUE: mat_mult:_41 <- 1
	#DEBUG_VALUE: mat_mult:_19 <- 10
	addq	$8, %rdi
	jne	.LBB5_4
.Ltmp96:
# BB#5:                                 # %blklab7
                                        #   in Loop: Header=BB5_3 Depth=1
	#DEBUG_VALUE: mat_mult:_43 <- 1
	.loc	1 350 8                 # MatrixMult.c:350:8
	incq	%r9
.Ltmp97:
	#DEBUG_VALUE: mat_mult:_44 <- %R9
	#DEBUG_VALUE: mat_mult:_17 <- 10
	#DEBUG_VALUE: mat_mult:i <- %R9
	.loc	1 268 6                 # MatrixMult.c:268:6
	addq	$80, %r8
	cmpq	$10, %r9
	jne	.LBB5_3
.Ltmp98:
.LBB5_6:                                # %if.end58
	#DEBUG_VALUE: mat_mult:b_has_ownership [bit_piece offset=0 size=1] <-  [complex expression]
	#DEBUG_VALUE: mat_mult:data_has_ownership <- 1
	#DEBUG_VALUE: mat_mult:_46 <- 10
	#DEBUG_VALUE: mat_mult:_47 <- 10
	#DEBUG_VALUE: matrix:width <- 10
	#DEBUG_VALUE: matrix:height <- 10
	#DEBUG_VALUE: matrix:data_size <- 100
	#DEBUG_VALUE: matrix:data_has_ownership [bit_piece offset=0 size=1] <- 0
	#DEBUG_VALUE: matrix:r_has_ownership <- 0
	#DEBUG_VALUE: matrix:_4_has_ownership <- 0
	.loc	1 30 7                  # MatrixMult.c:30:7
	movl	$32, %edi
	callq	malloc
.Ltmp99:
	movq	%rax, %r15
	.loc	1 31 2                  # MatrixMult.c:31:2
	movq	$100, 8(%r15)
	movl	$100, %esi
	movq	32(%rsp), %r12          # 8-byte Reload
	movq	%r12, %rdi
	callq	copy
	movq	%rax, (%r15)
	.loc	1 33 12                 # MatrixMult.c:33:12
	movaps	.LCPI5_0(%rip), %xmm0   # xmm0 = [10,10]
.Ltmp100:
	#DEBUG_VALUE: matrix:_4_has_ownership <- 1
	#DEBUG_VALUE: mat_mult:_45_has_ownership <- 1
	movups	%xmm0, 16(%r15)
.Ltmp101:
	.loc	1 368 2                 # MatrixMult.c:368:2
	movl	12(%rsp), %eax          # 4-byte Reload
	testb	%al, %al
	je	.LBB5_8
# BB#7:                                 # %if.then61
.Ltmp102:
	#DEBUG_VALUE: free_Matrix:matrix <- [%RSP+16]
	movq	16(%rsp), %r14          # 8-byte Reload
.Ltmp103:
	#DEBUG_VALUE: free_Matrix:matrix <- %R14
	.loc	1 10 15                 # MatrixMult.c:10:15
	movq	(%r14), %rdi
	.loc	1 10 2 is_stmt 0        # MatrixMult.c:10:2
	callq	free
	.loc	1 11 2 is_stmt 1        # MatrixMult.c:11:2
	movq	%r14, %rdi
	callq	free
.Ltmp104:
	#DEBUG_VALUE: mat_mult:a_has_ownership <- 0
.LBB5_8:                                # %if.end62
	.loc	1 369 2                 # MatrixMult.c:369:2
	movl	8(%rsp), %eax           # 4-byte Reload
	testb	%al, %al
	je	.LBB5_10
# BB#9:                                 # %if.then64
.Ltmp105:
	#DEBUG_VALUE: free_Matrix:matrix <- [%RSP+24]
	movq	24(%rsp), %r14          # 8-byte Reload
.Ltmp106:
	#DEBUG_VALUE: free_Matrix:matrix <- %R14
	.loc	1 10 15                 # MatrixMult.c:10:15
	movq	(%r14), %rdi
	.loc	1 10 2 is_stmt 0        # MatrixMult.c:10:2
	callq	free
	.loc	1 11 2 is_stmt 1        # MatrixMult.c:11:2
	movq	%r14, %rdi
	callq	free
.Ltmp107:
	#DEBUG_VALUE: mat_mult:b_has_ownership <- 0
.LBB5_10:                               # %if.then70
	.loc	1 371 2 discriminator 1 # MatrixMult.c:371:2
	movq	%r12, %rdi
	callq	free
.Ltmp108:
	#DEBUG_VALUE: mat_mult:data_has_ownership <- 0
	.loc	1 372 2 discriminator 1 # MatrixMult.c:372:2
	movq	%rbp, %rdi
	callq	free
.Ltmp109:
	#DEBUG_VALUE: mat_mult:a_data_has_ownership <- 0
	.loc	1 373 2 discriminator 1 # MatrixMult.c:373:2
	movq	%rbx, %rdi
	callq	free
.Ltmp110:
	#DEBUG_VALUE: mat_mult:b_data_has_ownership <- 0
	.loc	1 377 2                 # MatrixMult.c:377:2
	movq	%r15, %rax
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp111:
.Lfunc_end5:
	.size	mat_mult, .Lfunc_end5-mat_mult
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI6_0:
	.quad	77                      # 0x4d
	.quad	97                      # 0x61
.LCPI6_1:
	.quad	116                     # 0x74
	.quad	114                     # 0x72
.LCPI6_2:
	.quad	105                     # 0x69
	.quad	120                     # 0x78
.LCPI6_3:
	.quad	32                      # 0x20
	.quad	65                      # 0x41
.LCPI6_4:
	.quad	91                      # 0x5b
	.quad	78                      # 0x4e
.LCPI6_5:
	.quad	93                      # 0x5d
	.quad	32                      # 0x20
.LCPI6_6:
	.quad	61                      # 0x3d
	.quad	32                      # 0x20
.LCPI6_7:
	.quad	32                      # 0x20
	.quad	66                      # 0x42
.LCPI6_8:
	.quad	32                      # 0x20
	.quad	67                      # 0x43
.LCPI6_9:
	.quad	80                      # 0x50
	.quad	97                      # 0x61
.LCPI6_10:
	.quad	115                     # 0x73
	.quad	115                     # 0x73
.LCPI6_11:
	.quad	32                      # 0x20
	.quad	77                      # 0x4d
.LCPI6_12:
	.quad	97                      # 0x61
	.quad	116                     # 0x74
.LCPI6_13:
	.quad	114                     # 0x72
	.quad	105                     # 0x69
.LCPI6_14:
	.quad	120                     # 0x78
	.quad	77                      # 0x4d
.LCPI6_15:
	.quad	117                     # 0x75
	.quad	108                     # 0x6c
.LCPI6_16:
	.quad	116                     # 0x74
	.quad	32                      # 0x20
.LCPI6_17:
	.quad	116                     # 0x74
	.quad	101                     # 0x65
.LCPI6_18:
	.quad	115                     # 0x73
	.quad	116                     # 0x74
.LCPI6_19:
	.quad	32                      # 0x20
	.quad	99                      # 0x63
.LCPI6_20:
	.quad	97                      # 0x61
	.quad	115                     # 0x73
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin6:
	.loc	1 381 0                 # MatrixMult.c:381:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 436 7 prologue_end    # MatrixMult.c:436:7
	pushq	%rbp
.Ltmp112:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp113:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp114:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp115:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp116:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp117:
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
.Ltmp118:
	.cfi_def_cfa_offset 96
.Ltmp119:
	.cfi_offset %rbx, -56
.Ltmp120:
	.cfi_offset %r12, -48
.Ltmp121:
	.cfi_offset %r13, -40
.Ltmp122:
	.cfi_offset %r14, -32
.Ltmp123:
	.cfi_offset %r15, -24
.Ltmp124:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
.Ltmp125:
	#DEBUG_VALUE: main:A_has_ownership <- 0
	#DEBUG_VALUE: main:B_has_ownership <- 0
	#DEBUG_VALUE: main:C_has_ownership <- 0
	#DEBUG_VALUE: main:data_size <- 0
	#DEBUG_VALUE: main:data_has_ownership <- 0
	#DEBUG_VALUE: main:_5_has_ownership <- 0
	#DEBUG_VALUE: main:_8_size <- 0
	#DEBUG_VALUE: main:_8_has_ownership <- 0
	#DEBUG_VALUE: main:_11_size <- 0
	#DEBUG_VALUE: main:_11_has_ownership <- 0
	#DEBUG_VALUE: main:_12 <- 0
	#DEBUG_VALUE: main:_13 <- 0
	#DEBUG_VALUE: main:_14_has_ownership <- 0
	#DEBUG_VALUE: main:_17_size <- 0
	#DEBUG_VALUE: main:_17_has_ownership <- 0
	#DEBUG_VALUE: main:_20_size <- 0
	#DEBUG_VALUE: main:_20_has_ownership <- 0
	#DEBUG_VALUE: main:_21 <- 0
	#DEBUG_VALUE: main:_22 <- 0
	#DEBUG_VALUE: main:_23_has_ownership <- 0
	#DEBUG_VALUE: main:_24_size <- 0
	#DEBUG_VALUE: main:_24_has_ownership <- 0
	#DEBUG_VALUE: main:_27_size <- 0
	#DEBUG_VALUE: main:_27_has_ownership <- 0
	#DEBUG_VALUE: main:_30 <- 0
	#DEBUG_VALUE: main:_31 <- 0
	#DEBUG_VALUE: main:_32 <- 0
	#DEBUG_VALUE: main:_33 <- 0
	#DEBUG_VALUE: main:_34 <- 0
	#DEBUG_VALUE: main:_35 <- 0
	#DEBUG_VALUE: main:_36 <- 0
	#DEBUG_VALUE: main:_37 <- 0
	#DEBUG_VALUE: main:_38 <- 0
	#DEBUG_VALUE: main:_39 <- 0
	#DEBUG_VALUE: main:_40 <- 0
	#DEBUG_VALUE: main:_41 <- 0
	#DEBUG_VALUE: main:_42 <- 0
	#DEBUG_VALUE: main:_45_size <- 0
	#DEBUG_VALUE: main:_45_has_ownership <- 0
	callq	init
	movq	%rax, %rbp
.Ltmp126:
	#DEBUG_VALUE: main:A <- %RBP
	#DEBUG_VALUE: main:_5 <- %RBP
	#DEBUG_VALUE: main:_8_size <- 14
	#DEBUG_VALUE: main:A_has_ownership <- 1
	.loc	1 447 2                 # MatrixMult.c:447:2
	movq	%rbp, (%rsp)            # 8-byte Spill
	movl	$112, %edi
.Ltmp127:
	callq	malloc
	movq	%rax, %r12
.Ltmp128:
	#DEBUG_VALUE: main:_8 <- %R12
	.loc	1 448 8                 # MatrixMult.c:448:8
	movaps	.LCPI6_0(%rip), %xmm0   # xmm0 = [77,97]
	movups	%xmm0, (%r12)
	.loc	1 448 32 is_stmt 0      # MatrixMult.c:448:32
	movaps	.LCPI6_1(%rip), %xmm0   # xmm0 = [116,114]
	movups	%xmm0, 16(%r12)
	.loc	1 448 58                # MatrixMult.c:448:58
	movaps	.LCPI6_2(%rip), %xmm0   # xmm0 = [105,120]
	movups	%xmm0, 32(%r12)
	.loc	1 448 84                # MatrixMult.c:448:84
	movaps	.LCPI6_3(%rip), %xmm0   # xmm0 = [32,65]
	movups	%xmm0, 48(%r12)
	.loc	1 448 108               # MatrixMult.c:448:108
	movaps	.LCPI6_4(%rip), %xmm0   # xmm0 = [91,78]
	movups	%xmm0, 64(%r12)
	.loc	1 448 133               # MatrixMult.c:448:133
	movaps	.LCPI6_5(%rip), %xmm0   # xmm0 = [93,32]
	movups	%xmm0, 80(%r12)
	.loc	1 448 159               # MatrixMult.c:448:159
	movaps	.LCPI6_6(%rip), %xmm0   # xmm0 = [61,32]
	movups	%xmm0, 96(%r12)
.Ltmp129:
	#DEBUG_VALUE: main:_8_has_ownership <- 1
	.loc	1 451 2 is_stmt 1       # MatrixMult.c:451:2
	movl	$14, %esi
.Ltmp130:
	movq	%r12, %rdi
	callq	printf_s
	.loc	1 456 2                 # MatrixMult.c:456:2
	movq	(%rbp), %rdi
	movq	8(%rbp), %rsi
	callq	copy
.Ltmp131:
	#DEBUG_VALUE: main:_11 <- %RAX
	#DEBUG_VALUE: main:_12 <- 10
	#DEBUG_VALUE: main:_11_has_ownership <- 1
	.loc	1 461 6                 # MatrixMult.c:461:6
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	80(%rax), %rsi
.Ltmp132:
	#DEBUG_VALUE: main:_11 <- [%RSP+16]
	#DEBUG_VALUE: main:_13 <- %RSI
	.loc	1 463 2                 # MatrixMult.c:463:2
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp133:
	.loc	1 466 8                 # MatrixMult.c:466:8
	callq	init
	movq	%rax, %r14
.Ltmp134:
	#DEBUG_VALUE: main:B <- %R14
	#DEBUG_VALUE: main:_14 <- %R14
	#DEBUG_VALUE: main:_17_size <- 14
	#DEBUG_VALUE: main:B_has_ownership <- 1
	.loc	1 477 2                 # MatrixMult.c:477:2
	movl	$112, %edi
	callq	malloc
	movq	%rax, %rbx
.Ltmp135:
	#DEBUG_VALUE: main:_17 <- %RBX
	.loc	1 448 8                 # MatrixMult.c:448:8
	movaps	.LCPI6_0(%rip), %xmm0   # xmm0 = [77,97]
	.loc	1 478 9                 # MatrixMult.c:478:9
	movups	%xmm0, (%rbx)
	.loc	1 448 32                # MatrixMult.c:448:32
	movaps	.LCPI6_1(%rip), %xmm0   # xmm0 = [116,114]
	.loc	1 478 35                # MatrixMult.c:478:35
	movups	%xmm0, 16(%rbx)
	.loc	1 448 58                # MatrixMult.c:448:58
	movaps	.LCPI6_2(%rip), %xmm0   # xmm0 = [105,120]
	.loc	1 478 63                # MatrixMult.c:478:63
	movups	%xmm0, 32(%rbx)
	.loc	1 478 91 is_stmt 0      # MatrixMult.c:478:91
	movaps	.LCPI6_7(%rip), %xmm0   # xmm0 = [32,66]
	movups	%xmm0, 48(%rbx)
	.loc	1 448 108 is_stmt 1     # MatrixMult.c:448:108
	movaps	.LCPI6_4(%rip), %xmm0   # xmm0 = [91,78]
	.loc	1 478 117               # MatrixMult.c:478:117
	movups	%xmm0, 64(%rbx)
	.loc	1 448 133               # MatrixMult.c:448:133
	movaps	.LCPI6_5(%rip), %xmm0   # xmm0 = [93,32]
	.loc	1 478 144               # MatrixMult.c:478:144
	movups	%xmm0, 80(%rbx)
	.loc	1 448 159               # MatrixMult.c:448:159
	movaps	.LCPI6_6(%rip), %xmm0   # xmm0 = [61,32]
	.loc	1 478 172               # MatrixMult.c:478:172
	movups	%xmm0, 96(%rbx)
.Ltmp136:
	#DEBUG_VALUE: main:_17_has_ownership <- 1
	.loc	1 481 2                 # MatrixMult.c:481:2
	movl	$14, %esi
.Ltmp137:
	movq	%rbx, %rdi
	callq	printf_s
	.loc	1 486 2                 # MatrixMult.c:486:2
	movq	(%r14), %rdi
	movq	8(%r14), %rsi
	callq	copy
.Ltmp138:
	#DEBUG_VALUE: main:_20 <- %RAX
	#DEBUG_VALUE: main:_21 <- 10
	#DEBUG_VALUE: main:_20_has_ownership <- 1
	.loc	1 491 6                 # MatrixMult.c:491:6
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movq	80(%rax), %rsi
.Ltmp139:
	#DEBUG_VALUE: main:_20 <- [%RSP+8]
	#DEBUG_VALUE: main:_22 <- %RSI
	.loc	1 493 2                 # MatrixMult.c:493:2
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp140:
	.loc	1 498 8                 # MatrixMult.c:498:8
	xorl	%esi, %esi
.Ltmp141:
	xorl	%ecx, %ecx
	movq	%rbp, %rdi
.Ltmp142:
	#DEBUG_VALUE: main:A <- [%RSP+0]
	#DEBUG_VALUE: main:_5 <- [%RSP+0]
	movq	%r14, %rdx
	callq	mat_mult
.Ltmp143:
	movq	%rax, %rbp
.Ltmp144:
	#DEBUG_VALUE: main:C <- %RBP
	#DEBUG_VALUE: main:_23 <- %RBP
	#DEBUG_VALUE: main:C_has_ownership <- 1
	.loc	1 507 2                 # MatrixMult.c:507:2
	movq	(%rbp), %rdi
	movq	8(%rbp), %rsi
	callq	copy
	movq	%rax, %r13
.Ltmp145:
	#DEBUG_VALUE: main:data <- %R13
	#DEBUG_VALUE: main:_24 <- %R13
	#DEBUG_VALUE: main:_27_size <- 14
	#DEBUG_VALUE: main:data_has_ownership <- 1
	.loc	1 518 2                 # MatrixMult.c:518:2
	movl	$112, %edi
	callq	malloc
	movq	%rax, %r15
.Ltmp146:
	#DEBUG_VALUE: main:_27 <- %R15
	.loc	1 448 8                 # MatrixMult.c:448:8
	movaps	.LCPI6_0(%rip), %xmm0   # xmm0 = [77,97]
	.loc	1 519 9                 # MatrixMult.c:519:9
	movups	%xmm0, (%r15)
	.loc	1 448 32                # MatrixMult.c:448:32
	movaps	.LCPI6_1(%rip), %xmm0   # xmm0 = [116,114]
	.loc	1 519 35                # MatrixMult.c:519:35
	movups	%xmm0, 16(%r15)
	.loc	1 448 58                # MatrixMult.c:448:58
	movaps	.LCPI6_2(%rip), %xmm0   # xmm0 = [105,120]
	.loc	1 519 63                # MatrixMult.c:519:63
	movups	%xmm0, 32(%r15)
	.loc	1 519 91 is_stmt 0      # MatrixMult.c:519:91
	movaps	.LCPI6_8(%rip), %xmm0   # xmm0 = [32,67]
	movups	%xmm0, 48(%r15)
	.loc	1 448 108 is_stmt 1     # MatrixMult.c:448:108
	movaps	.LCPI6_4(%rip), %xmm0   # xmm0 = [91,78]
	.loc	1 519 117               # MatrixMult.c:519:117
	movups	%xmm0, 64(%r15)
	.loc	1 448 133               # MatrixMult.c:448:133
	movaps	.LCPI6_5(%rip), %xmm0   # xmm0 = [93,32]
	.loc	1 519 144               # MatrixMult.c:519:144
	movups	%xmm0, 80(%r15)
	.loc	1 448 159               # MatrixMult.c:448:159
	movaps	.LCPI6_6(%rip), %xmm0   # xmm0 = [61,32]
	.loc	1 519 172               # MatrixMult.c:519:172
	movups	%xmm0, 96(%r15)
.Ltmp147:
	#DEBUG_VALUE: main:_27_has_ownership <- 1
	.loc	1 522 2                 # MatrixMult.c:522:2
	movl	$14, %esi
	movq	%r15, %rdi
	callq	printf_s
.Ltmp148:
	#DEBUG_VALUE: main:_30 <- 10
	.loc	1 528 6                 # MatrixMult.c:528:6
	movq	80(%r13), %rsi
.Ltmp149:
	#DEBUG_VALUE: main:_31 <- %RSI
	.loc	1 530 2                 # MatrixMult.c:530:2
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp150:
	.loc	1 540 9                 # MatrixMult.c:540:9
	cmpq	$0, (%r13)
	jne	.LBB6_4
.Ltmp151:
# BB#1:                                 # %blklab11
	#DEBUG_VALUE: main:_31 <- %RSI
	#DEBUG_VALUE: main:_27 <- %R15
	#DEBUG_VALUE: main:_24 <- %R13
	#DEBUG_VALUE: main:data <- %R13
	#DEBUG_VALUE: main:_23 <- %RBP
	#DEBUG_VALUE: main:C <- %RBP
	#DEBUG_VALUE: main:_17 <- %RBX
	#DEBUG_VALUE: main:_14 <- %R14
	#DEBUG_VALUE: main:B <- %R14
	#DEBUG_VALUE: main:_8 <- %R12
	#DEBUG_VALUE: main:_35 <- 10
	#DEBUG_VALUE: main:_37 <- 45
	movq	%rbp, 24(%rsp)          # 8-byte Spill
	movq	%r14, 32(%rsp)          # 8-byte Spill
	movq	(%rsp), %r14            # 8-byte Reload
.Ltmp152:
	.loc	1 557 9                 # MatrixMult.c:557:9
	cmpq	$45, 80(%r13)
	jne	.LBB6_4
.Ltmp153:
# BB#2:                                 # %blklab12
	#DEBUG_VALUE: main:_8 <- %R12
	#DEBUG_VALUE: main:_17 <- %RBX
	#DEBUG_VALUE: main:C <- %RBP
	#DEBUG_VALUE: main:_23 <- %RBP
	#DEBUG_VALUE: main:data <- %R13
	#DEBUG_VALUE: main:_24 <- %R13
	#DEBUG_VALUE: main:_27 <- %R15
	#DEBUG_VALUE: main:_31 <- %RSI
	#DEBUG_VALUE: main:_38 <- 2
	#DEBUG_VALUE: main:_39 <- 10
	#DEBUG_VALUE: main:_40 <- 20
	#DEBUG_VALUE: main:_42 <- 90
	.loc	1 578 9                 # MatrixMult.c:578:9
	cmpq	$90, 160(%r13)
	jne	.LBB6_4
.Ltmp154:
# BB#3:                                 # %if.end117
	#DEBUG_VALUE: main:_31 <- %RSI
	#DEBUG_VALUE: main:_27 <- %R15
	#DEBUG_VALUE: main:_24 <- %R13
	#DEBUG_VALUE: main:data <- %R13
	#DEBUG_VALUE: main:_23 <- %RBP
	#DEBUG_VALUE: main:C <- %RBP
	#DEBUG_VALUE: main:_17 <- %RBX
	#DEBUG_VALUE: main:_8 <- %R12
	#DEBUG_VALUE: main:_45_size <- 25
	.loc	1 590 2                 # MatrixMult.c:590:2
	movl	$200, %edi
	callq	malloc
	movq	%rax, %rbp
.Ltmp155:
	#DEBUG_VALUE: main:_45 <- %RBP
	.loc	1 591 9                 # MatrixMult.c:591:9
	movaps	.LCPI6_9(%rip), %xmm0   # xmm0 = [80,97]
	movups	%xmm0, (%rbp)
	.loc	1 591 35 is_stmt 0      # MatrixMult.c:591:35
	movaps	.LCPI6_10(%rip), %xmm0  # xmm0 = [115,115]
	movups	%xmm0, 16(%rbp)
	.loc	1 591 63                # MatrixMult.c:591:63
	movaps	.LCPI6_11(%rip), %xmm0  # xmm0 = [32,77]
	movups	%xmm0, 32(%rbp)
	.loc	1 591 89                # MatrixMult.c:591:89
	movaps	.LCPI6_12(%rip), %xmm0  # xmm0 = [97,116]
	movups	%xmm0, 48(%rbp)
	.loc	1 591 116               # MatrixMult.c:591:116
	movaps	.LCPI6_13(%rip), %xmm0  # xmm0 = [114,105]
	movups	%xmm0, 64(%rbp)
	.loc	1 591 145               # MatrixMult.c:591:145
	movaps	.LCPI6_14(%rip), %xmm0  # xmm0 = [120,77]
	movups	%xmm0, 80(%rbp)
	.loc	1 591 174               # MatrixMult.c:591:174
	movaps	.LCPI6_15(%rip), %xmm0  # xmm0 = [117,108]
	movups	%xmm0, 96(%rbp)
	.loc	1 591 204               # MatrixMult.c:591:204
	movaps	.LCPI6_16(%rip), %xmm0  # xmm0 = [116,32]
	movups	%xmm0, 112(%rbp)
	.loc	1 591 233               # MatrixMult.c:591:233
	movaps	.LCPI6_17(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 128(%rbp)
	.loc	1 591 263               # MatrixMult.c:591:263
	movaps	.LCPI6_18(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 144(%rbp)
	.loc	1 591 293               # MatrixMult.c:591:293
	movaps	.LCPI6_19(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 160(%rbp)
	.loc	1 591 321               # MatrixMult.c:591:321
	movaps	.LCPI6_20(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 176(%rbp)
	.loc	1 591 350               # MatrixMult.c:591:350
	movq	$101, 192(%rbp)
.Ltmp156:
	#DEBUG_VALUE: main:_45_has_ownership <- 1
	.loc	1 594 2 is_stmt 1       # MatrixMult.c:594:2
	movl	$25, %esi
.Ltmp157:
	movq	%rbp, %rdi
	callq	println_s
.Ltmp158:
	.loc	1 596 2 discriminator 1 # MatrixMult.c:596:2
	movq	%r14, %rdi
	callq	free_Matrix
.Ltmp159:
	#DEBUG_VALUE: main:A_has_ownership <- 0
	.loc	1 597 2 discriminator 1 # MatrixMult.c:597:2
	movq	32(%rsp), %rdi          # 8-byte Reload
	callq	free_Matrix
.Ltmp160:
	#DEBUG_VALUE: main:B_has_ownership <- 0
	.loc	1 598 2 discriminator 1 # MatrixMult.c:598:2
	movq	24(%rsp), %rdi          # 8-byte Reload
	callq	free_Matrix
.Ltmp161:
	#DEBUG_VALUE: main:C_has_ownership <- 0
	.loc	1 599 2 discriminator 1 # MatrixMult.c:599:2
	movq	%r13, %rdi
	callq	free
.Ltmp162:
	#DEBUG_VALUE: main:data_has_ownership <- 0
	.loc	1 601 2 discriminator 1 # MatrixMult.c:601:2
	movq	%r12, %rdi
	callq	free
.Ltmp163:
	#DEBUG_VALUE: main:_8_has_ownership <- 0
	.loc	1 602 2 discriminator 1 # MatrixMult.c:602:2
	movq	16(%rsp), %rdi          # 8-byte Reload
	callq	free
.Ltmp164:
	#DEBUG_VALUE: main:_11_has_ownership <- 0
	.loc	1 604 2 discriminator 1 # MatrixMult.c:604:2
	movq	%rbx, %rdi
	callq	free
.Ltmp165:
	#DEBUG_VALUE: main:_17_has_ownership <- 0
	.loc	1 605 2 discriminator 1 # MatrixMult.c:605:2
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	free
.Ltmp166:
	#DEBUG_VALUE: main:_20_has_ownership <- 0
	.loc	1 608 2 discriminator 1 # MatrixMult.c:608:2
	movq	%r15, %rdi
	callq	free
.Ltmp167:
	#DEBUG_VALUE: main:_27_has_ownership <- 0
	.loc	1 609 2 discriminator 1 # MatrixMult.c:609:2
	movq	%rbp, %rdi
	callq	free
.Ltmp168:
	#DEBUG_VALUE: main:_45_has_ownership <- 0
	.loc	1 610 2                 # MatrixMult.c:610:2
	xorl	%edi, %edi
	callq	exit
.Ltmp169:
.LBB6_4:                                # %if.end103
	#DEBUG_VALUE: main:_31 <- %RSI
	#DEBUG_VALUE: main:_27 <- %R15
	#DEBUG_VALUE: main:_24 <- %R13
	#DEBUG_VALUE: main:data <- %R13
	#DEBUG_VALUE: main:_23 <- %RBP
	#DEBUG_VALUE: main:C <- %RBP
	#DEBUG_VALUE: main:_17 <- %RBX
	#DEBUG_VALUE: main:_8 <- %R12
	.loc	1 542 11                # MatrixMult.c:542:11
	movq	stderr(%rip), %rcx
	.loc	1 542 3 is_stmt 0       # MatrixMult.c:542:3
	movl	$.L.str.7, %edi
	movl	$4, %esi
.Ltmp170:
	movl	$1, %edx
	callq	fwrite
	.loc	1 543 3 is_stmt 1       # MatrixMult.c:543:3
	movl	$-1, %edi
	callq	exit
.Ltmp171:
.Lfunc_end6:
	.size	main, .Lfunc_end6-main
	.cfi_endproc

	.type	.L.str.1,@object        # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	" data:"
	.size	.L.str.1, 7

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	" width:"
	.size	.L.str.2, 8

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"%d"
	.size	.L.str.3, 3

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	" height:"
	.size	.L.str.4, 9

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"%d\n"
	.size	.L.str.6, 4

	.type	.L.str.7,@object        # @.str.7
.L.str.7:
	.asciz	"fail"
	.size	.L.str.7, 5

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)" # string offset=0
.Linfo_string1:
	.asciz	"MatrixMult.c"          # string offset=165
.Linfo_string2:
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/autogenerate" # string offset=178
.Linfo_string3:
	.asciz	"matrix"                # string offset=246
.Linfo_string4:
	.asciz	"data"                  # string offset=253
.Linfo_string5:
	.asciz	"long long int"         # string offset=258
.Linfo_string6:
	.asciz	"data_size"             # string offset=272
.Linfo_string7:
	.asciz	"width"                 # string offset=282
.Linfo_string8:
	.asciz	"height"                # string offset=288
.Linfo_string9:
	.asciz	"Matrix"                # string offset=295
.Linfo_string10:
	.asciz	"data_has_ownership"    # string offset=302
.Linfo_string11:
	.asciz	"_Bool"                 # string offset=321
.Linfo_string12:
	.asciz	"r_has_ownership"       # string offset=327
.Linfo_string13:
	.asciz	"_4_has_ownership"      # string offset=343
.Linfo_string14:
	.asciz	"_4"                    # string offset=360
.Linfo_string15:
	.asciz	"r"                     # string offset=363
.Linfo_string16:
	.asciz	"free_Matrix"           # string offset=365
.Linfo_string17:
	.asciz	"copy_Matrix"           # string offset=377
.Linfo_string18:
	.asciz	"printf_Matrix"         # string offset=389
.Linfo_string19:
	.asciz	"init"                  # string offset=403
.Linfo_string20:
	.asciz	"mat_mult"              # string offset=408
.Linfo_string21:
	.asciz	"main"                  # string offset=417
.Linfo_string22:
	.asciz	"int"                   # string offset=422
.Linfo_string23:
	.asciz	"_Matrix"               # string offset=426
.Linfo_string24:
	.asciz	"new_Matrix"            # string offset=434
.Linfo_string25:
	.asciz	"i"                     # string offset=445
.Linfo_string26:
	.asciz	"j"                     # string offset=447
.Linfo_string27:
	.asciz	"_5"                    # string offset=449
.Linfo_string28:
	.asciz	"_6"                    # string offset=452
.Linfo_string29:
	.asciz	"_7"                    # string offset=455
.Linfo_string30:
	.asciz	"_8_size"               # string offset=458
.Linfo_string31:
	.asciz	"_8_has_ownership"      # string offset=466
.Linfo_string32:
	.asciz	"_9"                    # string offset=483
.Linfo_string33:
	.asciz	"_10"                   # string offset=486
.Linfo_string34:
	.asciz	"_11"                   # string offset=490
.Linfo_string35:
	.asciz	"_12"                   # string offset=494
.Linfo_string36:
	.asciz	"_13"                   # string offset=498
.Linfo_string37:
	.asciz	"_14"                   # string offset=502
.Linfo_string38:
	.asciz	"_15"                   # string offset=506
.Linfo_string39:
	.asciz	"_16"                   # string offset=510
.Linfo_string40:
	.asciz	"_17"                   # string offset=514
.Linfo_string41:
	.asciz	"_18"                   # string offset=518
.Linfo_string42:
	.asciz	"_19"                   # string offset=522
.Linfo_string43:
	.asciz	"_20"                   # string offset=526
.Linfo_string44:
	.asciz	"_21"                   # string offset=530
.Linfo_string45:
	.asciz	"_22"                   # string offset=534
.Linfo_string46:
	.asciz	"_23"                   # string offset=538
.Linfo_string47:
	.asciz	"_24"                   # string offset=542
.Linfo_string48:
	.asciz	"_25_has_ownership"     # string offset=546
.Linfo_string49:
	.asciz	"_26"                   # string offset=564
.Linfo_string50:
	.asciz	"_27"                   # string offset=568
.Linfo_string51:
	.asciz	"_8"                    # string offset=572
.Linfo_string52:
	.asciz	"_25"                   # string offset=575
.Linfo_string53:
	.asciz	"a"                     # string offset=579
.Linfo_string54:
	.asciz	"a_has_ownership"       # string offset=581
.Linfo_string55:
	.asciz	"b"                     # string offset=597
.Linfo_string56:
	.asciz	"b_has_ownership"       # string offset=599
.Linfo_string57:
	.asciz	"_47"                   # string offset=615
.Linfo_string58:
	.asciz	"_46"                   # string offset=619
.Linfo_string59:
	.asciz	"_45_has_ownership"     # string offset=623
.Linfo_string60:
	.asciz	"_44"                   # string offset=641
.Linfo_string61:
	.asciz	"_43"                   # string offset=645
.Linfo_string62:
	.asciz	"_42"                   # string offset=649
.Linfo_string63:
	.asciz	"_41"                   # string offset=653
.Linfo_string64:
	.asciz	"_40"                   # string offset=657
.Linfo_string65:
	.asciz	"_39"                   # string offset=661
.Linfo_string66:
	.asciz	"_38"                   # string offset=665
.Linfo_string67:
	.asciz	"_37"                   # string offset=669
.Linfo_string68:
	.asciz	"_36"                   # string offset=673
.Linfo_string69:
	.asciz	"_35"                   # string offset=677
.Linfo_string70:
	.asciz	"_34"                   # string offset=681
.Linfo_string71:
	.asciz	"_33"                   # string offset=685
.Linfo_string72:
	.asciz	"_32"                   # string offset=689
.Linfo_string73:
	.asciz	"_31"                   # string offset=693
.Linfo_string74:
	.asciz	"_30"                   # string offset=697
.Linfo_string75:
	.asciz	"_29"                   # string offset=701
.Linfo_string76:
	.asciz	"_28"                   # string offset=705
.Linfo_string77:
	.asciz	"_15_has_ownership"     # string offset=709
.Linfo_string78:
	.asciz	"_15_size"              # string offset=727
.Linfo_string79:
	.asciz	"_14_has_ownership"     # string offset=736
.Linfo_string80:
	.asciz	"_14_size"              # string offset=754
.Linfo_string81:
	.asciz	"_13_has_ownership"     # string offset=763
.Linfo_string82:
	.asciz	"_13_size"              # string offset=781
.Linfo_string83:
	.asciz	"k"                     # string offset=790
.Linfo_string84:
	.asciz	"b_data_has_ownership"  # string offset=792
.Linfo_string85:
	.asciz	"b_data_size"           # string offset=813
.Linfo_string86:
	.asciz	"a_data_has_ownership"  # string offset=825
.Linfo_string87:
	.asciz	"a_data_size"           # string offset=846
.Linfo_string88:
	.asciz	"a_data"                # string offset=858
.Linfo_string89:
	.asciz	"b_data"                # string offset=865
.Linfo_string90:
	.asciz	"_45"                   # string offset=872
.Linfo_string91:
	.asciz	"argc"                  # string offset=876
.Linfo_string92:
	.asciz	"args"                  # string offset=881
.Linfo_string93:
	.asciz	"char"                  # string offset=886
.Linfo_string94:
	.asciz	"A_has_ownership"       # string offset=891
.Linfo_string95:
	.asciz	"B_has_ownership"       # string offset=907
.Linfo_string96:
	.asciz	"C_has_ownership"       # string offset=923
.Linfo_string97:
	.asciz	"_5_has_ownership"      # string offset=939
.Linfo_string98:
	.asciz	"_11_size"              # string offset=956
.Linfo_string99:
	.asciz	"_11_has_ownership"     # string offset=965
.Linfo_string100:
	.asciz	"_17_size"              # string offset=983
.Linfo_string101:
	.asciz	"_17_has_ownership"     # string offset=992
.Linfo_string102:
	.asciz	"_20_size"              # string offset=1010
.Linfo_string103:
	.asciz	"_20_has_ownership"     # string offset=1019
.Linfo_string104:
	.asciz	"_23_has_ownership"     # string offset=1037
.Linfo_string105:
	.asciz	"_24_size"              # string offset=1055
.Linfo_string106:
	.asciz	"_24_has_ownership"     # string offset=1064
.Linfo_string107:
	.asciz	"_27_size"              # string offset=1082
.Linfo_string108:
	.asciz	"_27_has_ownership"     # string offset=1091
.Linfo_string109:
	.asciz	"_45_size"              # string offset=1109
.Linfo_string110:
	.asciz	"A"                     # string offset=1118
.Linfo_string111:
	.asciz	"B"                     # string offset=1120
.Linfo_string112:
	.asciz	"C"                     # string offset=1122
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp5-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp5-.Lfunc_begin0
	.quad	.Ltmp8-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Ltmp6-.Lfunc_begin0
	.quad	.Ltmp7-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc2:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp12-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp12-.Lfunc_begin0
	.quad	.Ltmp13-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp17-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp17-.Lfunc_begin0
	.quad	.Ltmp18-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp37-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp37-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp36-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp35-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp34-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp33-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	88                      # super-register DW_OP_reg8
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp33-.Lfunc_begin0
	.quad	.Ltmp37-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	95                      # super-register DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp37-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	95                      # super-register DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	1                       # 1
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Ltmp37-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Lfunc_end4-.Lfunc_begin0
	.short	4                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	228                     # 100
	.byte	0                       # DW_OP_stack_value
	.byte	159                     # 
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Lfunc_end4-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Lfunc_end4-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	10                      # 10
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp58-.Lfunc_begin0
	.quad	.Lfunc_end4-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp56-.Lfunc_begin0
	.quad	.Lfunc_end4-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	10                      # 10
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp56-.Lfunc_begin0
	.quad	.Lfunc_end4-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	10                      # 10
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp56-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp58-.Lfunc_begin0
	.quad	.Lfunc_end4-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Lfunc_begin5-.Lfunc_begin0
	.quad	.Ltmp78-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc23:
	.quad	.Lfunc_begin5-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	84                      # super-register DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	5                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	12                      # 12
	.byte	157                     # DW_OP_bit_piece
	.byte	1                       # 1
	.byte	0                       # 0
	.quad	.Ltmp104-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Lfunc_begin5-.Lfunc_begin0
	.quad	.Ltmp76-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Lfunc_begin5-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	82                      # super-register DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	92                      # super-register DW_OP_reg12
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	92                      # super-register DW_OP_reg12
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp98-.Lfunc_begin0
	.quad	.Ltmp99-.Lfunc_begin0
	.short	5                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
	.byte	157                     # DW_OP_bit_piece
	.byte	1                       # 1
	.byte	0                       # 0
	.quad	.Ltmp107-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp98-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp98-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	10                      # 10
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp98-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp98-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	10                      # 10
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp100-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp97-.Lfunc_begin0
	.quad	.Ltmp98-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	89                      # DW_OP_reg9
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp96-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp96-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp95-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp95-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp92-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc33:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp92-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc34:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp92-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	10                      # 10
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc35:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp92-.Lfunc_begin0
	.quad	.Ltmp93-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc36:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc37:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp90-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp90-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc38:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp89-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	10                      # 10
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc39:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp89-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	10                      # 10
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc40:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp89-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	10                      # 10
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc41:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp89-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	10                      # 10
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc42:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	10                      # 10
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc43:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	10                      # 10
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc44:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp92-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc45:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp97-.Lfunc_begin0
	.quad	.Ltmp98-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	89                      # DW_OP_reg9
	.quad	0
	.quad	0
.Ldebug_loc46:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Ltmp110-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp110-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc47:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp81-.Lfunc_begin0
	.quad	.Ltmp109-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc48:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp80-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Ltmp108-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp108-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc49:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp80-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	4                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	228                     # 100
	.byte	0                       # DW_OP_stack_value
	.byte	159                     # 
	.quad	0
	.quad	0
.Ldebug_loc50:
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc51:
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc52:
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc53:
	.quad	.Ltmp81-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc54:
	.quad	.Ltmp81-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc55:
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc56:
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc57:
	.quad	.Ltmp98-.Lfunc_begin0
	.quad	.Ltmp100-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc58:
	.quad	.Ltmp102-.Lfunc_begin0
	.quad	.Ltmp103-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	16                      # 16
	.quad	.Ltmp103-.Lfunc_begin0
	.quad	.Ltmp104-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc59:
	.quad	.Ltmp105-.Lfunc_begin0
	.quad	.Ltmp106-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	24                      # 24
	.quad	.Ltmp106-.Lfunc_begin0
	.quad	.Ltmp107-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc60:
	.quad	.Lfunc_begin6-.Lfunc_begin0
	.quad	.Ltmp127-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc61:
	.quad	.Lfunc_begin6-.Lfunc_begin0
	.quad	.Ltmp130-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc62:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp126-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp126-.Lfunc_begin0
	.quad	.Ltmp159-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp159-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc63:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp134-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp134-.Lfunc_begin0
	.quad	.Ltmp160-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp160-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc64:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp144-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp144-.Lfunc_begin0
	.quad	.Ltmp161-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp161-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc65:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp145-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp145-.Lfunc_begin0
	.quad	.Ltmp162-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp162-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc66:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp126-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp126-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	14                      # 14
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc67:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp129-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp129-.Lfunc_begin0
	.quad	.Ltmp163-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp163-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc68:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp131-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp131-.Lfunc_begin0
	.quad	.Ltmp164-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp164-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc69:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp131-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp131-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	10                      # 10
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc70:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp132-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp132-.Lfunc_begin0
	.quad	.Ltmp137-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc71:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp134-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp134-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	14                      # 14
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc72:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp136-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp136-.Lfunc_begin0
	.quad	.Ltmp165-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp165-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc73:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp138-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp138-.Lfunc_begin0
	.quad	.Ltmp166-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp166-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc74:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp138-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp138-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	10                      # 10
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc75:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp139-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp139-.Lfunc_begin0
	.quad	.Ltmp141-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc76:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp145-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp145-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	14                      # 14
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc77:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp147-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp147-.Lfunc_begin0
	.quad	.Ltmp167-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp167-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc78:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp148-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp148-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	10                      # 10
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc79:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp149-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp149-.Lfunc_begin0
	.quad	.Ltmp157-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp169-.Lfunc_begin0
	.quad	.Ltmp170-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc80:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp151-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp151-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	10                      # 10
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc81:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp151-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp151-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	45                      # 45
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc82:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp153-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp153-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc83:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp153-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp153-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	10                      # 10
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc84:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp153-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp153-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	20                      # 20
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc85:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp153-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp153-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	4                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	218                     # 90
	.byte	0                       # DW_OP_stack_value
	.byte	159                     # 
	.quad	0
	.quad	0
.Ldebug_loc86:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp154-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp154-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	25                      # 25
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc87:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp156-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp156-.Lfunc_begin0
	.quad	.Ltmp168-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp168-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc88:
	.quad	.Ltmp126-.Lfunc_begin0
	.quad	.Ltmp142-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp142-.Lfunc_begin0
	.quad	.Ltmp143-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	0                       # 0
	.quad	0
	.quad	0
.Ldebug_loc89:
	.quad	.Ltmp126-.Lfunc_begin0
	.quad	.Ltmp142-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp142-.Lfunc_begin0
	.quad	.Ltmp143-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	0                       # 0
	.quad	0
	.quad	0
.Ldebug_loc90:
	.quad	.Ltmp128-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc91:
	.quad	.Ltmp131-.Lfunc_begin0
	.quad	.Ltmp132-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp132-.Lfunc_begin0
	.quad	.Ltmp133-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	16                      # 16
	.quad	0
	.quad	0
.Ldebug_loc92:
	.quad	.Ltmp134-.Lfunc_begin0
	.quad	.Ltmp152-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc93:
	.quad	.Ltmp134-.Lfunc_begin0
	.quad	.Ltmp152-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc94:
	.quad	.Ltmp135-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc95:
	.quad	.Ltmp138-.Lfunc_begin0
	.quad	.Ltmp139-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp139-.Lfunc_begin0
	.quad	.Ltmp140-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
	.quad	0
	.quad	0
.Ldebug_loc96:
	.quad	.Ltmp144-.Lfunc_begin0
	.quad	.Ltmp155-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp169-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc97:
	.quad	.Ltmp144-.Lfunc_begin0
	.quad	.Ltmp155-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp169-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc98:
	.quad	.Ltmp145-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc99:
	.quad	.Ltmp145-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc100:
	.quad	.Ltmp146-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc101:
	.quad	.Ltmp155-.Lfunc_begin0
	.quad	.Ltmp169-.Lfunc_begin0
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
	.byte	3                       # Abbreviation Code
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
	.byte	4                       # Abbreviation Code
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
	.byte	5                       # Abbreviation Code
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
	.byte	6                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	7                       # Abbreviation Code
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
	.byte	8                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	15                      # DW_FORM_udata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	10                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
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
	.byte	12                      # Abbreviation Code
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
	.byte	13                      # Abbreviation Code
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
	.byte	14                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	15                      # Abbreviation Code
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
	.byte	16                      # Abbreviation Code
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
	.byte	17                      # Abbreviation Code
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
	.byte	18                      # Abbreviation Code
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
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	20                      # Abbreviation Code
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
	.byte	21                      # Abbreviation Code
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
	.byte	22                      # Abbreviation Code
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
	.byte	23                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	24                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	25                      # Abbreviation Code
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
	.byte	26                      # Abbreviation Code
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
	.byte	27                      # Abbreviation Code
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
	.byte	34                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	3028                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0xbcd DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end6-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x38 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	366                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	3                       # Abbrev [3] 0x43:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x52:0xf DW_TAG_variable
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x62:0x1d DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	1000                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x75:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	1008                    # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x7f:0x25 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	3                       # Abbrev [3] 0x94:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0xa4:0x5a DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	254                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xb7:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc4            # DW_AT_location
	.long	266                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xc0:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc5            # DW_AT_location
	.long	277                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xc9:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc6            # DW_AT_location
	.long	288                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xd2:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc7            # DW_AT_location
	.long	299                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xdb:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc8            # DW_AT_location
	.long	310                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0xe4:0x9 DW_TAG_variable
	.long	.Ldebug_loc9            # DW_AT_location
	.long	332                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0xed:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	321                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0xf3:0x5 DW_TAG_variable
	.long	354                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0xf8:0x5 DW_TAG_variable
	.long	343                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	11                      # Abbrev [11] 0xfe:0x70 DW_TAG_subprogram
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	23                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	366                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	12                      # Abbrev [12] 0x10a:0xb DW_TAG_formal_parameter
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	23                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x115:0xb DW_TAG_formal_parameter
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	23                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x120:0xb DW_TAG_formal_parameter
	.long	.Linfo_string4          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	23                      # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x12b:0xb DW_TAG_formal_parameter
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	23                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x136:0xb DW_TAG_formal_parameter
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	23                      # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x141:0xb DW_TAG_variable
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	25                      # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x14c:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x157:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x162:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	24                      # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	14                      # Abbrev [14] 0x16e:0x5 DW_TAG_pointer_type
	.long	371                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x173:0xb DW_TAG_typedef
	.long	382                     # DW_AT_type
	.long	.Linfo_string9          # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.byte	16                      # Abbrev [16] 0x17e:0x35 DW_TAG_structure_type
	.byte	32                      # DW_AT_byte_size
	.byte	2                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.byte	17                      # Abbrev [17] 0x182:0xc DW_TAG_member
	.long	.Linfo_string4          # DW_AT_name
	.long	435                     # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	17                      # Abbrev [17] 0x18e:0xc DW_TAG_member
	.long	.Linfo_string6          # DW_AT_name
	.long	440                     # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	17                      # Abbrev [17] 0x19a:0xc DW_TAG_member
	.long	.Linfo_string7          # DW_AT_name
	.long	440                     # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.byte	16                      # DW_AT_data_member_location
	.byte	17                      # Abbrev [17] 0x1a6:0xc DW_TAG_member
	.long	.Linfo_string8          # DW_AT_name
	.long	440                     # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.byte	24                      # DW_AT_data_member_location
	.byte	0                       # End Of Children Mark
	.byte	14                      # Abbrev [14] 0x1b3:0x5 DW_TAG_pointer_type
	.long	440                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x1b8:0x7 DW_TAG_base_type
	.long	.Linfo_string5          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	18                      # Abbrev [18] 0x1bf:0x7 DW_TAG_base_type
	.long	.Linfo_string11         # DW_AT_name
	.byte	2                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	19                      # Abbrev [19] 0x1c6:0x222 DW_TAG_subprogram
	.quad	.Lfunc_begin4           # DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin4 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	42                      # DW_AT_decl_line
	.long	366                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	20                      # Abbrev [20] 0x1df:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x1eb:0xf DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	45                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x1fa:0xf DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	46                      # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x209:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	47                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x215:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	48                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x221:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	49                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x22d:0xc DW_TAG_variable
	.byte	10                      # DW_AT_const_value
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	50                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x239:0xc DW_TAG_variable
	.byte	10                      # DW_AT_const_value
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x245:0xd DW_TAG_variable
	.asciz	"\344"                  # DW_AT_const_value
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	52                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x252:0xd DW_TAG_variable
	.asciz	"\344"                  # DW_AT_const_value
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	53                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x25f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	54                      # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x26b:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	55                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x277:0xf DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	56                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x286:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	57                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x292:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	58                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x29e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x2aa:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	60                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x2b6:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	61                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x2c2:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x2ce:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x2da:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x2e6:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	65                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x2f2:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	66                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x2fe:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	67                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x30a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	68                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x316:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	69                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x322:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x32e:0xf DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	72                      # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x33d:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	73                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x34c:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	74                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x35b:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string4          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	45                      # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x36a:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	53                      # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x379:0xf DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	71                      # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x388:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	43                      # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	22                      # Abbrev [22] 0x393:0x54 DW_TAG_inlined_subroutine
	.long	254                     # DW_AT_abstract_origin
	.quad	.Ltmp56                 # DW_AT_low_pc
	.long	.Ltmp58-.Ltmp56         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	159                     # DW_AT_call_line
	.byte	23                      # Abbrev [23] 0x3a6:0x6 DW_TAG_formal_parameter
	.byte	10                      # DW_AT_const_value
	.long	266                     # DW_AT_abstract_origin
	.byte	23                      # Abbrev [23] 0x3ac:0x6 DW_TAG_formal_parameter
	.byte	10                      # DW_AT_const_value
	.long	277                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x3b2:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc18           # DW_AT_location
	.long	288                     # DW_AT_abstract_origin
	.byte	23                      # Abbrev [23] 0x3bb:0x7 DW_TAG_formal_parameter
	.asciz	"\344"                  # DW_AT_const_value
	.long	299                     # DW_AT_abstract_origin
	.byte	24                      # Abbrev [24] 0x3c2:0xc DW_TAG_formal_parameter
	.byte	6                       # DW_AT_location
	.byte	16
	.byte	0
	.byte	159
	.byte	157
	.byte	1
	.byte	0
	.long	310                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x3ce:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	321                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x3d4:0x9 DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	332                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x3dd:0x9 DW_TAG_variable
	.long	.Ldebug_loc20           # DW_AT_location
	.long	343                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	25                      # Abbrev [25] 0x3e8:0x14 DW_TAG_subprogram
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	12                      # Abbrev [12] 0x3f0:0xb DW_TAG_formal_parameter
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	2                       # Abbrev [2] 0x3fc:0x40a DW_TAG_subprogram
	.quad	.Lfunc_begin5           # DW_AT_low_pc
	.long	.Lfunc_end5-.Lfunc_begin5 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	169                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	366                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	3                       # Abbrev [3] 0x415:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	169                     # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	3                       # Abbrev [3] 0x424:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	169                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	3                       # Abbrev [3] 0x433:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	169                     # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	3                       # Abbrev [3] 0x442:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	169                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x451:0xf DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	223                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x460:0xf DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	222                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x46f:0xf DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	221                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x47e:0xf DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	219                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x48d:0xf DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	218                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x49c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	217                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x4a8:0xf DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	216                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x4b7:0xf DW_TAG_variable
	.long	.Ldebug_loc32           # DW_AT_location
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	215                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x4c6:0xf DW_TAG_variable
	.long	.Ldebug_loc33           # DW_AT_location
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	214                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x4d5:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string66         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	213                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x4e1:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	212                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x4ed:0xf DW_TAG_variable
	.long	.Ldebug_loc34           # DW_AT_location
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	211                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x4fc:0xf DW_TAG_variable
	.long	.Ldebug_loc35           # DW_AT_location
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	210                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x50b:0xf DW_TAG_variable
	.long	.Ldebug_loc36           # DW_AT_location
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	209                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x51a:0xf DW_TAG_variable
	.long	.Ldebug_loc37           # DW_AT_location
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	208                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x529:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	207                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x535:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	206                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x541:0xf DW_TAG_variable
	.long	.Ldebug_loc38           # DW_AT_location
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	205                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x550:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string75         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	204                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x55c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string76         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	203                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x568:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	202                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x574:0xf DW_TAG_variable
	.long	.Ldebug_loc39           # DW_AT_location
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	201                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x583:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	200                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x58f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	199                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x59b:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	198                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x5a7:0xf DW_TAG_variable
	.long	.Ldebug_loc40           # DW_AT_location
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	197                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x5b6:0xf DW_TAG_variable
	.long	.Ldebug_loc41           # DW_AT_location
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	196                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x5c5:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	195                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x5d1:0xf DW_TAG_variable
	.long	.Ldebug_loc42           # DW_AT_location
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	194                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x5e0:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	193                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x5ec:0xf DW_TAG_variable
	.long	.Ldebug_loc43           # DW_AT_location
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	192                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x5fb:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	191                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x607:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string77         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	190                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x613:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string78         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	189                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x61f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	188                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x62b:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string80         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	187                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x637:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string81         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	186                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x643:0xd DW_TAG_variable
	.asciz	"\344"                  # DW_AT_const_value
	.long	.Linfo_string82         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	185                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x650:0xd DW_TAG_variable
	.asciz	"\344"                  # DW_AT_const_value
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	184                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x65d:0xc DW_TAG_variable
	.byte	10                      # DW_AT_const_value
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	183                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x669:0xc DW_TAG_variable
	.byte	10                      # DW_AT_const_value
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	182                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x675:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	181                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x681:0xf DW_TAG_variable
	.long	.Ldebug_loc44           # DW_AT_location
	.long	.Linfo_string83         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	180                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x690:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	179                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x69c:0xf DW_TAG_variable
	.long	.Ldebug_loc45           # DW_AT_location
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	178                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x6ab:0xf DW_TAG_variable
	.long	.Ldebug_loc46           # DW_AT_location
	.long	.Linfo_string84         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	177                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x6ba:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string85         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	176                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x6c6:0xf DW_TAG_variable
	.long	.Ldebug_loc47           # DW_AT_location
	.long	.Linfo_string86         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	175                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x6d5:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string87         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	174                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x6e1:0xf DW_TAG_variable
	.long	.Ldebug_loc48           # DW_AT_location
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	173                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x6f0:0xf DW_TAG_variable
	.long	.Ldebug_loc49           # DW_AT_location
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	172                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x6ff:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	171                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x70b:0xf DW_TAG_variable
	.long	.Ldebug_loc50           # DW_AT_location
	.long	.Linfo_string4          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	172                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x71a:0xf DW_TAG_variable
	.long	.Ldebug_loc51           # DW_AT_location
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	185                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x729:0xf DW_TAG_variable
	.long	.Ldebug_loc53           # DW_AT_location
	.long	.Linfo_string88         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	174                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x738:0xf DW_TAG_variable
	.long	.Ldebug_loc54           # DW_AT_location
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	187                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x747:0xf DW_TAG_variable
	.long	.Ldebug_loc55           # DW_AT_location
	.long	.Linfo_string89         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	176                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x756:0xf DW_TAG_variable
	.long	.Ldebug_loc56           # DW_AT_location
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	189                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x765:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	170                     # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x770:0xb DW_TAG_variable
	.long	.Linfo_string90         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	220                     # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	26                      # Abbrev [26] 0x77b:0x4c DW_TAG_inlined_subroutine
	.long	254                     # DW_AT_abstract_origin
	.quad	.Ltmp98                 # DW_AT_low_pc
	.long	.Ltmp101-.Ltmp98        # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.short	365                     # DW_AT_call_line
	.byte	23                      # Abbrev [23] 0x78f:0x6 DW_TAG_formal_parameter
	.byte	10                      # DW_AT_const_value
	.long	266                     # DW_AT_abstract_origin
	.byte	23                      # Abbrev [23] 0x795:0x6 DW_TAG_formal_parameter
	.byte	10                      # DW_AT_const_value
	.long	277                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x79b:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc52           # DW_AT_location
	.long	288                     # DW_AT_abstract_origin
	.byte	23                      # Abbrev [23] 0x7a4:0x7 DW_TAG_formal_parameter
	.asciz	"\344"                  # DW_AT_const_value
	.long	299                     # DW_AT_abstract_origin
	.byte	24                      # Abbrev [24] 0x7ab:0xc DW_TAG_formal_parameter
	.byte	6                       # DW_AT_location
	.byte	16
	.byte	0
	.byte	159
	.byte	157
	.byte	1
	.byte	0
	.long	310                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x7b7:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	321                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x7bd:0x9 DW_TAG_variable
	.long	.Ldebug_loc57           # DW_AT_location
	.long	332                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	27                      # Abbrev [27] 0x7c7:0x1f DW_TAG_inlined_subroutine
	.long	1000                    # DW_AT_abstract_origin
	.quad	.Ltmp103                # DW_AT_low_pc
	.long	.Ltmp104-.Ltmp103       # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.short	368                     # DW_AT_call_line
	.byte	1                       # DW_AT_GNU_discriminator
	.byte	6                       # Abbrev [6] 0x7dc:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc58           # DW_AT_location
	.long	1008                    # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	27                      # Abbrev [27] 0x7e6:0x1f DW_TAG_inlined_subroutine
	.long	1000                    # DW_AT_abstract_origin
	.quad	.Ltmp106                # DW_AT_low_pc
	.long	.Ltmp107-.Ltmp106       # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.short	369                     # DW_AT_call_line
	.byte	1                       # DW_AT_GNU_discriminator
	.byte	6                       # Abbrev [6] 0x7fb:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc59           # DW_AT_location
	.long	1008                    # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	28                      # Abbrev [28] 0x806:0x3b8 DW_TAG_subprogram
	.quad	.Lfunc_begin6           # DW_AT_low_pc
	.long	.Lfunc_end6-.Lfunc_begin6 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	381                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	3006                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	29                      # Abbrev [29] 0x820:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc60           # DW_AT_location
	.long	.Linfo_string91         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	381                     # DW_AT_decl_line
	.long	3006                    # DW_AT_type
	.byte	29                      # Abbrev [29] 0x830:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc61           # DW_AT_location
	.long	.Linfo_string92         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	381                     # DW_AT_decl_line
	.long	3013                    # DW_AT_type
	.byte	30                      # Abbrev [30] 0x840:0x10 DW_TAG_variable
	.long	.Ldebug_loc62           # DW_AT_location
	.long	.Linfo_string94         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	383                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x850:0x10 DW_TAG_variable
	.long	.Ldebug_loc63           # DW_AT_location
	.long	.Linfo_string95         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	385                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x860:0x10 DW_TAG_variable
	.long	.Ldebug_loc64           # DW_AT_location
	.long	.Linfo_string96         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	387                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x870:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	388                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x87d:0x10 DW_TAG_variable
	.long	.Ldebug_loc65           # DW_AT_location
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	389                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x88d:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string97         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	391                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x89a:0x10 DW_TAG_variable
	.long	.Ldebug_loc66           # DW_AT_location
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	393                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x8aa:0x10 DW_TAG_variable
	.long	.Ldebug_loc67           # DW_AT_location
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	394                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x8ba:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string98         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	396                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x8c7:0x10 DW_TAG_variable
	.long	.Ldebug_loc68           # DW_AT_location
	.long	.Linfo_string99         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	397                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x8d7:0x10 DW_TAG_variable
	.long	.Ldebug_loc69           # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	398                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x8e7:0x10 DW_TAG_variable
	.long	.Ldebug_loc70           # DW_AT_location
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	399                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x8f7:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	401                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x904:0x10 DW_TAG_variable
	.long	.Ldebug_loc71           # DW_AT_location
	.long	.Linfo_string100        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	403                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x914:0x10 DW_TAG_variable
	.long	.Ldebug_loc72           # DW_AT_location
	.long	.Linfo_string101        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	404                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x924:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string102        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	406                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x931:0x10 DW_TAG_variable
	.long	.Ldebug_loc73           # DW_AT_location
	.long	.Linfo_string103        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	407                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x941:0x10 DW_TAG_variable
	.long	.Ldebug_loc74           # DW_AT_location
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	408                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x951:0x10 DW_TAG_variable
	.long	.Ldebug_loc75           # DW_AT_location
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	409                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x961:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string104        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	411                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x96e:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string105        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	412                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x97b:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string106        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	413                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x988:0x10 DW_TAG_variable
	.long	.Ldebug_loc76           # DW_AT_location
	.long	.Linfo_string107        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	415                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x998:0x10 DW_TAG_variable
	.long	.Ldebug_loc77           # DW_AT_location
	.long	.Linfo_string108        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	416                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x9a8:0x10 DW_TAG_variable
	.long	.Ldebug_loc78           # DW_AT_location
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	418                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x9b8:0x10 DW_TAG_variable
	.long	.Ldebug_loc79           # DW_AT_location
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	419                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x9c8:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	420                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x9d5:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	421                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x9e2:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	422                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x9ef:0x10 DW_TAG_variable
	.long	.Ldebug_loc80           # DW_AT_location
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	423                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x9ff:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	424                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xa0c:0x10 DW_TAG_variable
	.long	.Ldebug_loc81           # DW_AT_location
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	425                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xa1c:0x10 DW_TAG_variable
	.long	.Ldebug_loc82           # DW_AT_location
	.long	.Linfo_string66         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	426                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xa2c:0x10 DW_TAG_variable
	.long	.Ldebug_loc83           # DW_AT_location
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	427                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xa3c:0x10 DW_TAG_variable
	.long	.Ldebug_loc84           # DW_AT_location
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	428                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0xa4c:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	429                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xa59:0x10 DW_TAG_variable
	.long	.Ldebug_loc85           # DW_AT_location
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	430                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xa69:0x10 DW_TAG_variable
	.long	.Ldebug_loc86           # DW_AT_location
	.long	.Linfo_string109        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	432                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xa79:0x10 DW_TAG_variable
	.long	.Ldebug_loc87           # DW_AT_location
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	433                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xa89:0x10 DW_TAG_variable
	.long	.Ldebug_loc88           # DW_AT_location
	.long	.Linfo_string110        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	382                     # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xa99:0x10 DW_TAG_variable
	.long	.Ldebug_loc89           # DW_AT_location
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	390                     # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xaa9:0x10 DW_TAG_variable
	.long	.Ldebug_loc90           # DW_AT_location
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	393                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xab9:0x10 DW_TAG_variable
	.long	.Ldebug_loc91           # DW_AT_location
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	396                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xac9:0x10 DW_TAG_variable
	.long	.Ldebug_loc92           # DW_AT_location
	.long	.Linfo_string111        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	384                     # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xad9:0x10 DW_TAG_variable
	.long	.Ldebug_loc93           # DW_AT_location
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	400                     # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xae9:0x10 DW_TAG_variable
	.long	.Ldebug_loc94           # DW_AT_location
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	403                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xaf9:0x10 DW_TAG_variable
	.long	.Ldebug_loc95           # DW_AT_location
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	406                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xb09:0x10 DW_TAG_variable
	.long	.Ldebug_loc96           # DW_AT_location
	.long	.Linfo_string112        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	386                     # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xb19:0x10 DW_TAG_variable
	.long	.Ldebug_loc97           # DW_AT_location
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	410                     # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xb29:0x10 DW_TAG_variable
	.long	.Ldebug_loc98           # DW_AT_location
	.long	.Linfo_string4          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	388                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xb39:0x10 DW_TAG_variable
	.long	.Ldebug_loc99           # DW_AT_location
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	412                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xb49:0x10 DW_TAG_variable
	.long	.Ldebug_loc100          # DW_AT_location
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	415                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xb59:0x10 DW_TAG_variable
	.long	.Ldebug_loc101          # DW_AT_location
	.long	.Linfo_string90         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	432                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	33                      # Abbrev [33] 0xb69:0xc DW_TAG_variable
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	392                     # DW_AT_decl_line
	.long	3030                    # DW_AT_type
	.byte	33                      # Abbrev [33] 0xb75:0xc DW_TAG_variable
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	395                     # DW_AT_decl_line
	.long	3030                    # DW_AT_type
	.byte	33                      # Abbrev [33] 0xb81:0xc DW_TAG_variable
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	402                     # DW_AT_decl_line
	.long	3030                    # DW_AT_type
	.byte	33                      # Abbrev [33] 0xb8d:0xc DW_TAG_variable
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	405                     # DW_AT_decl_line
	.long	3030                    # DW_AT_type
	.byte	33                      # Abbrev [33] 0xb99:0xc DW_TAG_variable
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	414                     # DW_AT_decl_line
	.long	3030                    # DW_AT_type
	.byte	33                      # Abbrev [33] 0xba5:0xc DW_TAG_variable
	.long	.Linfo_string76         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	417                     # DW_AT_decl_line
	.long	3030                    # DW_AT_type
	.byte	33                      # Abbrev [33] 0xbb1:0xc DW_TAG_variable
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	431                     # DW_AT_decl_line
	.long	3030                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	18                      # Abbrev [18] 0xbbe:0x7 DW_TAG_base_type
	.long	.Linfo_string22         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	14                      # Abbrev [14] 0xbc5:0x5 DW_TAG_pointer_type
	.long	3018                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0xbca:0x5 DW_TAG_pointer_type
	.long	3023                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0xbcf:0x7 DW_TAG_base_type
	.long	.Linfo_string93         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	34                      # Abbrev [34] 0xbd6:0x1 DW_TAG_pointer_type
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
	.long	3032                    # Compilation Unit Length
	.long	1020                    # DIE offset
	.asciz	"mat_mult"              # External Name
	.long	454                     # DIE offset
	.asciz	"init"                  # External Name
	.long	254                     # DIE offset
	.asciz	"matrix"                # External Name
	.long	1000                    # DIE offset
	.asciz	"free_Matrix"           # External Name
	.long	127                     # DIE offset
	.asciz	"printf_Matrix"         # External Name
	.long	2054                    # DIE offset
	.asciz	"main"                  # External Name
	.long	42                      # DIE offset
	.asciz	"copy_Matrix"           # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	3032                    # Compilation Unit Length
	.long	371                     # DIE offset
	.asciz	"Matrix"                # External Name
	.long	440                     # DIE offset
	.asciz	"long long int"         # External Name
	.long	447                     # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	3006                    # DIE offset
	.asciz	"int"                   # External Name
	.long	3023                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
