	.text
	.file	"MatrixMult.openmp.enablevc.ll"
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
	callq	printf1DArray
	.loc	1 17 2                  # MatrixMult.c:17:2
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 18 25                 # MatrixMult.c:18:25
	movq	16(%rbx), %rsi
	.loc	1 18 2 is_stmt 0        # MatrixMult.c:18:2
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 19 2 is_stmt 1        # MatrixMult.c:19:2
	movl	$.L.str.4, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 20 25                 # MatrixMult.c:20:25
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
	.quad	2000                    # 0x7d0
	.quad	2000                    # 0x7d0
	.text
	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
.Lfunc_begin4:
	.loc	1 42 0                  # MatrixMult.c:42:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 85 2 prologue_end     # MatrixMult.c:85:2
	pushq	%r15
.Ltmp46:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp47:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp48:
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
.Ltmp49:
	.cfi_def_cfa_offset 48
.Ltmp50:
	.cfi_offset %rbx, -32
.Ltmp51:
	.cfi_offset %r14, -24
.Ltmp52:
	.cfi_offset %r15, -16
.Ltmp53:
	#DEBUG_VALUE: init:r_has_ownership <- 0
	#DEBUG_VALUE: init:data_size <- 0
	#DEBUG_VALUE: init:data_has_ownership <- 0
	#DEBUG_VALUE: init:i <- 0
	#DEBUG_VALUE: init:j <- 0
	#DEBUG_VALUE: init:_4 <- 0
	#DEBUG_VALUE: init:_5 <- 2000
	#DEBUG_VALUE: init:_6 <- 2000
	#DEBUG_VALUE: init:_7 <- 4000000
	#DEBUG_VALUE: init:_8_size <- 4000000
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
	xorl	%edi, %edi
	movl	$4000000, %esi          # imm = 0x3D0900
	callq	gen1DArray
	movq	%rax, %r15
.Ltmp54:
	#DEBUG_VALUE: init:data <- %R15
	#DEBUG_VALUE: init:_8 <- %R15
	#DEBUG_VALUE: matrix:data <- %R15
	#DEBUG_VALUE: init:_10 <- 2000
	#DEBUG_VALUE: init:data_has_ownership <- 1
	#DEBUG_VALUE: init:data_size <- 4000000
	movq	%r15, 8(%rsp)
	leaq	8(%rsp), %r14
	movl	$init_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$63, %r8d
	movl	$1, %r9d
	movq	%r14, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%r14, %rdi
	callq	init_polly_subfn
	callq	GOMP_parallel_end
.Ltmp55:
	#DEBUG_VALUE: matrix:_4_has_ownership <- 0
	#DEBUG_VALUE: matrix:r_has_ownership <- 0
	#DEBUG_VALUE: matrix:data_has_ownership [bit_piece offset=0 size=1] <- 0
	#DEBUG_VALUE: matrix:data_size <- 4000000
	#DEBUG_VALUE: matrix:height <- 2000
	#DEBUG_VALUE: matrix:width <- 2000
	#DEBUG_VALUE: init:_27 <- 2000
	#DEBUG_VALUE: init:_26 <- 2000
	.loc	1 30 7                  # MatrixMult.c:30:7
	movl	$32, %edi
	callq	malloc
	movq	%rax, %rbx
.Ltmp56:
	#DEBUG_VALUE: matrix:_4 <- %RBX
	#DEBUG_VALUE: init:_25 <- %RBX
	.loc	1 31 2                  # MatrixMult.c:31:2
	movq	$4000000, 8(%rbx)       # imm = 0x3D0900
	movl	$4000000, %esi          # imm = 0x3D0900
	movq	%r15, %rdi
	callq	copy
	movq	%rax, (%rbx)
	.loc	1 33 12                 # MatrixMult.c:33:12
	movaps	.LCPI4_0(%rip), %xmm0   # xmm0 = [2000,2000]
	movups	%xmm0, 16(%rbx)
.Ltmp57:
	#DEBUG_VALUE: matrix:_4_has_ownership <- 1
	#DEBUG_VALUE: init:_25_has_ownership <- 1
	.loc	1 163 2 discriminator 1 # MatrixMult.c:163:2
	movq	%r15, %rdi
	callq	free
.Ltmp58:
	#DEBUG_VALUE: init:data_has_ownership <- 0
	.loc	1 165 2                 # MatrixMult.c:165:2
	movq	%rbx, %rax
	addq	$16, %rsp
	popq	%rbx
.Ltmp59:
	popq	%r14
	popq	%r15
.Ltmp60:
	retq
.Ltmp61:
.Lfunc_end4:
	.size	init, .Lfunc_end4-init
	.cfi_endproc
	.file	2 "./MatrixMult.h"

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI5_0:
	.quad	2000                    # 0x7d0
	.quad	2000                    # 0x7d0
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
	subq	$56, %rsp
.Ltmp68:
	.cfi_def_cfa_offset 112
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
	movl	%ecx, %r15d
.Ltmp75:
	#DEBUG_VALUE: mat_mult:b_has_ownership [bit_piece offset=0 size=1] <- %R15D
	movq	%rdx, %rbx
.Ltmp76:
	#DEBUG_VALUE: mat_mult:b <- %RBX
	movl	%esi, 12(%rsp)          # 4-byte Spill
.Ltmp77:
	#DEBUG_VALUE: mat_mult:a_has_ownership [bit_piece offset=0 size=1] <-  [complex expression]
	movq	%rdi, %rbp
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
	#DEBUG_VALUE: mat_mult:_13_size <- 4000000
	#DEBUG_VALUE: mat_mult:_12 <- 4000000
	#DEBUG_VALUE: mat_mult:_11 <- 2000
	#DEBUG_VALUE: mat_mult:_10 <- 2000
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
	#DEBUG_VALUE: mat_mult:a <- %RBP
	.loc	1 234 2 prologue_end    # MatrixMult.c:234:2
	xorl	%edi, %edi
	movl	$4000000, %esi          # imm = 0x3D0900
	callq	gen1DArray
.Ltmp79:
	movq	%rax, %r13
.Ltmp80:
	#DEBUG_VALUE: mat_mult:data <- %R13
	#DEBUG_VALUE: mat_mult:_13 <- %R13
	#DEBUG_VALUE: matrix:data <- %R13
	#DEBUG_VALUE: mat_mult:data_has_ownership <- 1
	#DEBUG_VALUE: mat_mult:data_size <- 4000000
	.loc	1 243 2                 # MatrixMult.c:243:2
	movq	(%rbp), %rdi
	movq	8(%rbp), %rsi
	callq	copy
	movq	%rax, %r12
.Ltmp81:
	#DEBUG_VALUE: mat_mult:a_data <- %R12
	#DEBUG_VALUE: mat_mult:_14 <- %R12
	#DEBUG_VALUE: mat_mult:a_data_has_ownership <- 1
	.loc	1 252 2                 # MatrixMult.c:252:2
	movq	(%rbx), %rdi
	movq	8(%rbx), %rsi
	callq	copy
	movq	%rax, %r14
.Ltmp82:
	#DEBUG_VALUE: mat_mult:_15 <- %R14
	#DEBUG_VALUE: mat_mult:b_data <- %R14
	#DEBUG_VALUE: mat_mult:_17 <- 2000
	#DEBUG_VALUE: mat_mult:b_data_has_ownership <- 1
	leaq	32000000(%r14), %rax
	cmpq	%r13, %rax
	setbe	%dil
	leaq	32000000(%r13), %rdx
	cmpq	%r14, %rdx
	setbe	%cl
	leaq	32000000(%r12), %rsi
	cmpq	%r13, %rsi
	setbe	%al
	cmpq	%r12, %rdx
	setbe	%dl
	orb	%al, %dl
	movzbl	%dl, %eax
	cmpl	$1, %eax
	jne	.LBB5_2
.Ltmp83:
# BB#1:                                 # %entry
	#DEBUG_VALUE: mat_mult:b_data <- %R14
	#DEBUG_VALUE: mat_mult:_15 <- %R14
	#DEBUG_VALUE: mat_mult:_14 <- %R12
	#DEBUG_VALUE: mat_mult:a_data <- %R12
	#DEBUG_VALUE: matrix:data <- %R13
	#DEBUG_VALUE: mat_mult:_13 <- %R13
	#DEBUG_VALUE: mat_mult:data <- %R13
	#DEBUG_VALUE: mat_mult:a <- %RBP
	#DEBUG_VALUE: mat_mult:b <- %RBX
	#DEBUG_VALUE: mat_mult:b_has_ownership [bit_piece offset=0 size=1] <- %R15D
	orb	%dil, %cl
	je	.LBB5_2
.Ltmp84:
# BB#13:                                # %polly.parallel.for
	#DEBUG_VALUE: mat_mult:b_has_ownership [bit_piece offset=0 size=1] <- %R15D
	#DEBUG_VALUE: mat_mult:b <- %RBX
	#DEBUG_VALUE: mat_mult:a <- %RBP
	#DEBUG_VALUE: mat_mult:data <- %R13
	#DEBUG_VALUE: mat_mult:_13 <- %R13
	#DEBUG_VALUE: matrix:data <- %R13
	#DEBUG_VALUE: mat_mult:a_data <- %R12
	#DEBUG_VALUE: mat_mult:_14 <- %R12
	#DEBUG_VALUE: mat_mult:_15 <- %R14
	#DEBUG_VALUE: mat_mult:b_data <- %R14
	movq	%rbp, 16(%rsp)          # 8-byte Spill
	movl	%r15d, 8(%rsp)          # 4-byte Spill
	movq	%rbx, 24(%rsp)          # 8-byte Spill
	movq	%r13, 32(%rsp)
	movq	%r12, 40(%rsp)
	movq	%r14, 48(%rsp)
	leaq	32(%rsp), %r15
.Ltmp85:
	movl	$mat_mult_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$63, %r8d
	movl	$1, %r9d
	movq	%r15, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%r15, %rdi
	callq	mat_mult_polly_subfn
	callq	GOMP_parallel_end
	jmp	.LBB5_8
.Ltmp86:
.LBB5_2:                                # %while.body30.preheader.preheader
	#DEBUG_VALUE: mat_mult:b_data <- %R14
	#DEBUG_VALUE: mat_mult:_15 <- %R14
	#DEBUG_VALUE: mat_mult:_14 <- %R12
	#DEBUG_VALUE: mat_mult:a_data <- %R12
	#DEBUG_VALUE: matrix:data <- %R13
	#DEBUG_VALUE: mat_mult:_13 <- %R13
	#DEBUG_VALUE: mat_mult:data <- %R13
	#DEBUG_VALUE: mat_mult:a <- %RBP
	#DEBUG_VALUE: mat_mult:b <- %RBX
	#DEBUG_VALUE: mat_mult:b_has_ownership [bit_piece offset=0 size=1] <- %R15D
	movq	%rbp, 16(%rsp)          # 8-byte Spill
	movl	%r15d, 8(%rsp)          # 4-byte Spill
	movq	%rbx, 24(%rsp)          # 8-byte Spill
	.loc	1 194 12                # MatrixMult.c:194:12
	movq	%r12, %r9
	addq	$8, %r9
	xorl	%r8d, %r8d
.Ltmp87:
	.p2align	4, 0x90
.LBB5_3:                                # %while.body30.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_4 Depth 2
                                        #       Child Loop BB5_5 Depth 3
	#DEBUG_VALUE: mat_mult:_19 <- 2000
	.loc	1 292 10                # MatrixMult.c:292:10
	imulq	$2000, %r8, %r10        # imm = 0x7D0
.Ltmp88:
	#DEBUG_VALUE: mat_mult:_37 <- %R10
	#DEBUG_VALUE: mat_mult:_27 <- %R10
	#DEBUG_VALUE: mat_mult:_23 <- %R10
	xorl	%esi, %esi
.Ltmp89:
	.p2align	4, 0x90
.LBB5_4:                                # %while.body36.preheader
                                        #   Parent Loop BB5_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_5 Depth 3
	#DEBUG_VALUE: mat_mult:_21 <- 2000
	.loc	1 294 12                # MatrixMult.c:294:12
	leaq	(%rsi,%r10), %rdi
.Ltmp90:
	#DEBUG_VALUE: mat_mult:_38 <- %RDI
	#DEBUG_VALUE: mat_mult:_24 <- %RDI
	.loc	1 296 9                 # MatrixMult.c:296:9
	movq	(%r13,%rdi,8), %rcx
	movq	%r9, %rax
	movl	$16000, %edx            # imm = 0x3E80
.Ltmp91:
	.p2align	4, 0x90
.LBB5_5:                                # %if.end40
                                        #   Parent Loop BB5_3 Depth=1
                                        #     Parent Loop BB5_4 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	#DEBUG_VALUE: mat_mult:_22 <- 2000
	#DEBUG_VALUE: mat_mult:_26 <- 2000
	#DEBUG_VALUE: mat_mult:_30 <- 2000
	.loc	1 312 9                 # MatrixMult.c:312:9
	leaq	(%r14,%rdx), %rbp
	movq	-16000(%rbp,%rsi,8), %rbx
.Ltmp92:
	#DEBUG_VALUE: mat_mult:_33 <- %RBX
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	-8(%rax), %rbx
.Ltmp93:
	#DEBUG_VALUE: mat_mult:_34 <- %RBX
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	%rcx, %rbx
.Ltmp94:
	#DEBUG_VALUE: mat_mult:_35 <- %RBX
	.loc	1 324 15                # MatrixMult.c:324:15
	movq	%rbx, (%r13,%rdi,8)
	.loc	1 312 9                 # MatrixMult.c:312:9
	movq	(%rbp,%rsi,8), %rcx
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	(%rax), %rcx
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	%rbx, %rcx
	.loc	1 324 15                # MatrixMult.c:324:15
	movq	%rcx, (%r13,%rdi,8)
	.loc	1 288 8                 # MatrixMult.c:288:8
	addq	$32000, %rdx            # imm = 0x7D00
	addq	$16, %rax
	cmpq	$32016000, %rdx         # imm = 0x1E88680
.Ltmp95:
	#DEBUG_VALUE: mat_mult:_39 <- 1
	#DEBUG_VALUE: mat_mult:_36 <- 2000
	#DEBUG_VALUE: mat_mult:_25 <- %RCX
	#DEBUG_VALUE: mat_mult:_21 <- 2000
	jne	.LBB5_5
.Ltmp96:
# BB#6:                                 # %blklab9
                                        #   in Loop: Header=BB5_4 Depth=2
	#DEBUG_VALUE: mat_mult:_25 <- %RCX
	#DEBUG_VALUE: mat_mult:_35 <- %RBX
	#DEBUG_VALUE: mat_mult:_41 <- 1
	.loc	1 339 9                 # MatrixMult.c:339:9
	incq	%rsi
.Ltmp97:
	#DEBUG_VALUE: mat_mult:_42 <- %RSI
	#DEBUG_VALUE: mat_mult:_19 <- 2000
	#DEBUG_VALUE: mat_mult:j <- %RSI
	.loc	1 278 7                 # MatrixMult.c:278:7
	cmpq	$2000, %rsi             # imm = 0x7D0
	jne	.LBB5_4
.Ltmp98:
# BB#7:                                 # %blklab7
                                        #   in Loop: Header=BB5_3 Depth=1
	#DEBUG_VALUE: mat_mult:_35 <- %RBX
	#DEBUG_VALUE: mat_mult:_25 <- %RCX
	#DEBUG_VALUE: mat_mult:j <- %RSI
	#DEBUG_VALUE: mat_mult:_42 <- %RSI
	#DEBUG_VALUE: mat_mult:_43 <- 1
	.loc	1 350 8                 # MatrixMult.c:350:8
	incq	%r8
.Ltmp99:
	#DEBUG_VALUE: mat_mult:_44 <- %R8
	#DEBUG_VALUE: mat_mult:_17 <- 2000
	#DEBUG_VALUE: mat_mult:i <- %R8
	.loc	1 268 6                 # MatrixMult.c:268:6
	addq	$16000, %r9             # imm = 0x3E80
	cmpq	$2000, %r8              # imm = 0x7D0
	jne	.LBB5_3
.Ltmp100:
.LBB5_8:                                # %if.end58
	#DEBUG_VALUE: mat_mult:b_has_ownership [bit_piece offset=0 size=1] <-  [complex expression]
	#DEBUG_VALUE: mat_mult:data_has_ownership <- 1
	#DEBUG_VALUE: mat_mult:_46 <- 2000
	#DEBUG_VALUE: mat_mult:_47 <- 2000
	#DEBUG_VALUE: matrix:width <- 2000
	#DEBUG_VALUE: matrix:height <- 2000
	#DEBUG_VALUE: matrix:data_size <- 4000000
	#DEBUG_VALUE: matrix:data_has_ownership [bit_piece offset=0 size=1] <- 0
	#DEBUG_VALUE: matrix:r_has_ownership <- 0
	#DEBUG_VALUE: matrix:_4_has_ownership <- 0
	.loc	1 30 7                  # MatrixMult.c:30:7
	movl	$32, %edi
	callq	malloc
.Ltmp101:
	movq	%rax, %r15
	.loc	1 31 2                  # MatrixMult.c:31:2
	movq	$4000000, 8(%r15)       # imm = 0x3D0900
	movl	$4000000, %esi          # imm = 0x3D0900
	movq	%r13, %rdi
	callq	copy
	movq	%rax, (%r15)
	.loc	1 33 12                 # MatrixMult.c:33:12
	movaps	.LCPI5_0(%rip), %xmm0   # xmm0 = [2000,2000]
.Ltmp102:
	#DEBUG_VALUE: matrix:_4_has_ownership <- 1
	#DEBUG_VALUE: mat_mult:_45_has_ownership <- 1
	movups	%xmm0, 16(%r15)
.Ltmp103:
	.loc	1 368 2                 # MatrixMult.c:368:2
	movl	12(%rsp), %eax          # 4-byte Reload
	testb	%al, %al
	je	.LBB5_10
# BB#9:                                 # %if.then61
.Ltmp104:
	#DEBUG_VALUE: free_Matrix:matrix <- [%RSP+16]
	movq	16(%rsp), %rbx          # 8-byte Reload
.Ltmp105:
	#DEBUG_VALUE: free_Matrix:matrix <- %RBX
	.loc	1 10 15                 # MatrixMult.c:10:15
	movq	(%rbx), %rdi
	.loc	1 10 2 is_stmt 0        # MatrixMult.c:10:2
	callq	free
	.loc	1 11 2 is_stmt 1        # MatrixMult.c:11:2
	movq	%rbx, %rdi
	callq	free
.Ltmp106:
	#DEBUG_VALUE: mat_mult:a_has_ownership <- 0
.LBB5_10:                               # %if.end62
	.loc	1 369 2                 # MatrixMult.c:369:2
	movl	8(%rsp), %eax           # 4-byte Reload
	testb	%al, %al
	je	.LBB5_12
# BB#11:                                # %if.then64
.Ltmp107:
	#DEBUG_VALUE: free_Matrix:matrix <- [%RSP+24]
	movq	24(%rsp), %rbx          # 8-byte Reload
.Ltmp108:
	#DEBUG_VALUE: free_Matrix:matrix <- %RBX
	.loc	1 10 15                 # MatrixMult.c:10:15
	movq	(%rbx), %rdi
	.loc	1 10 2 is_stmt 0        # MatrixMult.c:10:2
	callq	free
	.loc	1 11 2 is_stmt 1        # MatrixMult.c:11:2
	movq	%rbx, %rdi
	callq	free
.Ltmp109:
	#DEBUG_VALUE: mat_mult:b_has_ownership <- 0
.LBB5_12:                               # %if.then70
	.loc	1 371 2 discriminator 1 # MatrixMult.c:371:2
	movq	%r13, %rdi
	callq	free
.Ltmp110:
	#DEBUG_VALUE: mat_mult:data_has_ownership <- 0
	.loc	1 372 2 discriminator 1 # MatrixMult.c:372:2
	movq	%r12, %rdi
	callq	free
.Ltmp111:
	#DEBUG_VALUE: mat_mult:a_data_has_ownership <- 0
	.loc	1 373 2 discriminator 1 # MatrixMult.c:373:2
	movq	%r14, %rdi
	callq	free
.Ltmp112:
	#DEBUG_VALUE: mat_mult:b_data_has_ownership <- 0
	.loc	1 377 2                 # MatrixMult.c:377:2
	movq	%r15, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp113:
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
	.loc	1 425 7 prologue_end    # MatrixMult.c:425:7
	pushq	%rbp
.Ltmp114:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp115:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp116:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp117:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp118:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp119:
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
.Ltmp120:
	.cfi_def_cfa_offset 96
.Ltmp121:
	.cfi_offset %rbx, -56
.Ltmp122:
	.cfi_offset %r12, -48
.Ltmp123:
	.cfi_offset %r13, -40
.Ltmp124:
	.cfi_offset %r14, -32
.Ltmp125:
	.cfi_offset %r15, -24
.Ltmp126:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
.Ltmp127:
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
	#DEBUG_VALUE: main:_34_size <- 0
	#DEBUG_VALUE: main:_34_has_ownership <- 0
	callq	init
	movq	%rax, %rbx
.Ltmp128:
	#DEBUG_VALUE: main:A <- %RBX
	#DEBUG_VALUE: main:_5 <- %RBX
	#DEBUG_VALUE: main:_8_size <- 14
	#DEBUG_VALUE: main:A_has_ownership <- 1
	.loc	1 436 2                 # MatrixMult.c:436:2
	movq	%rbx, 8(%rsp)           # 8-byte Spill
	movl	$112, %edi
.Ltmp129:
	callq	malloc
	movq	%rax, %r12
.Ltmp130:
	#DEBUG_VALUE: main:_8 <- %R12
	.loc	1 437 8                 # MatrixMult.c:437:8
	movaps	.LCPI6_0(%rip), %xmm0   # xmm0 = [77,97]
	movups	%xmm0, (%r12)
	.loc	1 437 32 is_stmt 0      # MatrixMult.c:437:32
	movaps	.LCPI6_1(%rip), %xmm0   # xmm0 = [116,114]
	movups	%xmm0, 16(%r12)
	.loc	1 437 58                # MatrixMult.c:437:58
	movaps	.LCPI6_2(%rip), %xmm0   # xmm0 = [105,120]
	movups	%xmm0, 32(%r12)
	.loc	1 437 84                # MatrixMult.c:437:84
	movaps	.LCPI6_3(%rip), %xmm0   # xmm0 = [32,65]
	movups	%xmm0, 48(%r12)
	.loc	1 437 108               # MatrixMult.c:437:108
	movaps	.LCPI6_4(%rip), %xmm0   # xmm0 = [91,78]
	movups	%xmm0, 64(%r12)
	.loc	1 437 133               # MatrixMult.c:437:133
	movaps	.LCPI6_5(%rip), %xmm0   # xmm0 = [93,32]
	movups	%xmm0, 80(%r12)
	.loc	1 437 159               # MatrixMult.c:437:159
	movaps	.LCPI6_6(%rip), %xmm0   # xmm0 = [61,32]
	movups	%xmm0, 96(%r12)
.Ltmp131:
	#DEBUG_VALUE: main:_8_has_ownership <- 1
	.loc	1 440 2 is_stmt 1       # MatrixMult.c:440:2
	movl	$14, %esi
.Ltmp132:
	movq	%r12, %rdi
	callq	printf_s
	.loc	1 445 2                 # MatrixMult.c:445:2
	movq	(%rbx), %rdi
	movq	8(%rbx), %rsi
	movq	%rbx, %r14
.Ltmp133:
	#DEBUG_VALUE: main:A <- %R14
	#DEBUG_VALUE: main:_5 <- %R14
	callq	copy
.Ltmp134:
	#DEBUG_VALUE: main:_11 <- %RAX
	#DEBUG_VALUE: main:_12 <- 2000
	#DEBUG_VALUE: main:_11_has_ownership <- 1
	.loc	1 450 6                 # MatrixMult.c:450:6
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	16000(%rax), %rsi
.Ltmp135:
	#DEBUG_VALUE: main:_11 <- [%RSP+32]
	#DEBUG_VALUE: main:_13 <- %RSI
	.loc	1 452 2                 # MatrixMult.c:452:2
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp136:
	.loc	1 455 8                 # MatrixMult.c:455:8
	callq	init
	movq	%rax, %rbp
.Ltmp137:
	#DEBUG_VALUE: main:B <- %RBP
	#DEBUG_VALUE: main:_14 <- %RBP
	#DEBUG_VALUE: main:_17_size <- 14
	#DEBUG_VALUE: main:B_has_ownership <- 1
	.loc	1 466 2                 # MatrixMult.c:466:2
	movq	%rbp, 16(%rsp)          # 8-byte Spill
	movl	$112, %edi
	callq	malloc
	movq	%rax, %rbx
.Ltmp138:
	#DEBUG_VALUE: main:_17 <- %RBX
	.loc	1 437 8                 # MatrixMult.c:437:8
	movaps	.LCPI6_0(%rip), %xmm0   # xmm0 = [77,97]
	.loc	1 467 9                 # MatrixMult.c:467:9
	movups	%xmm0, (%rbx)
	.loc	1 437 32                # MatrixMult.c:437:32
	movaps	.LCPI6_1(%rip), %xmm0   # xmm0 = [116,114]
	.loc	1 467 35                # MatrixMult.c:467:35
	movups	%xmm0, 16(%rbx)
	.loc	1 437 58                # MatrixMult.c:437:58
	movaps	.LCPI6_2(%rip), %xmm0   # xmm0 = [105,120]
	.loc	1 467 63                # MatrixMult.c:467:63
	movups	%xmm0, 32(%rbx)
	.loc	1 467 91 is_stmt 0      # MatrixMult.c:467:91
	movaps	.LCPI6_7(%rip), %xmm0   # xmm0 = [32,66]
	movups	%xmm0, 48(%rbx)
	.loc	1 437 108 is_stmt 1     # MatrixMult.c:437:108
	movaps	.LCPI6_4(%rip), %xmm0   # xmm0 = [91,78]
	.loc	1 467 117               # MatrixMult.c:467:117
	movups	%xmm0, 64(%rbx)
	.loc	1 437 133               # MatrixMult.c:437:133
	movaps	.LCPI6_5(%rip), %xmm0   # xmm0 = [93,32]
	.loc	1 467 144               # MatrixMult.c:467:144
	movups	%xmm0, 80(%rbx)
	.loc	1 437 159               # MatrixMult.c:437:159
	movaps	.LCPI6_6(%rip), %xmm0   # xmm0 = [61,32]
	.loc	1 467 172               # MatrixMult.c:467:172
	movups	%xmm0, 96(%rbx)
.Ltmp139:
	#DEBUG_VALUE: main:_17_has_ownership <- 1
	.loc	1 470 2                 # MatrixMult.c:470:2
	movl	$14, %esi
.Ltmp140:
	movq	%rbx, %rdi
	callq	printf_s
	.loc	1 475 2                 # MatrixMult.c:475:2
	movq	(%rbp), %rdi
	movq	8(%rbp), %rsi
	callq	copy
.Ltmp141:
	#DEBUG_VALUE: main:_20 <- %RAX
	#DEBUG_VALUE: main:_21 <- 2000
	#DEBUG_VALUE: main:_20_has_ownership <- 1
	.loc	1 480 6                 # MatrixMult.c:480:6
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	16000(%rax), %rsi
.Ltmp142:
	#DEBUG_VALUE: main:_20 <- [%RSP+24]
	#DEBUG_VALUE: main:_22 <- %RSI
	.loc	1 482 2                 # MatrixMult.c:482:2
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp143:
	.loc	1 487 8                 # MatrixMult.c:487:8
	xorl	%esi, %esi
.Ltmp144:
	xorl	%ecx, %ecx
	movq	%r14, %rdi
.Ltmp145:
	#DEBUG_VALUE: main:A <- [%RSP+8]
	#DEBUG_VALUE: main:_5 <- [%RSP+8]
	movq	%rbp, %rdx
.Ltmp146:
	#DEBUG_VALUE: main:B <- [%RSP+16]
	#DEBUG_VALUE: main:_14 <- [%RSP+16]
	callq	mat_mult
.Ltmp147:
	movq	%rax, %r13
.Ltmp148:
	#DEBUG_VALUE: main:C <- %R13
	#DEBUG_VALUE: main:_23 <- %R13
	#DEBUG_VALUE: main:C_has_ownership <- 1
	.loc	1 496 2                 # MatrixMult.c:496:2
	movq	(%r13), %rdi
	movq	8(%r13), %rsi
	callq	copy
	movq	%rax, %rbp
.Ltmp149:
	#DEBUG_VALUE: main:data <- %RBP
	#DEBUG_VALUE: main:_24 <- %RBP
	#DEBUG_VALUE: main:_27_size <- 14
	#DEBUG_VALUE: main:data_has_ownership <- 1
	.loc	1 507 2                 # MatrixMult.c:507:2
	movl	$112, %edi
	callq	malloc
	movq	%rax, %r15
.Ltmp150:
	#DEBUG_VALUE: main:_27 <- %R15
	.loc	1 437 8                 # MatrixMult.c:437:8
	movaps	.LCPI6_0(%rip), %xmm0   # xmm0 = [77,97]
	.loc	1 508 9                 # MatrixMult.c:508:9
	movups	%xmm0, (%r15)
	.loc	1 437 32                # MatrixMult.c:437:32
	movaps	.LCPI6_1(%rip), %xmm0   # xmm0 = [116,114]
	.loc	1 508 35                # MatrixMult.c:508:35
	movups	%xmm0, 16(%r15)
	.loc	1 437 58                # MatrixMult.c:437:58
	movaps	.LCPI6_2(%rip), %xmm0   # xmm0 = [105,120]
	.loc	1 508 63                # MatrixMult.c:508:63
	movups	%xmm0, 32(%r15)
	.loc	1 508 91 is_stmt 0      # MatrixMult.c:508:91
	movaps	.LCPI6_8(%rip), %xmm0   # xmm0 = [32,67]
	movups	%xmm0, 48(%r15)
	.loc	1 437 108 is_stmt 1     # MatrixMult.c:437:108
	movaps	.LCPI6_4(%rip), %xmm0   # xmm0 = [91,78]
	.loc	1 508 117               # MatrixMult.c:508:117
	movups	%xmm0, 64(%r15)
	.loc	1 437 133               # MatrixMult.c:437:133
	movaps	.LCPI6_5(%rip), %xmm0   # xmm0 = [93,32]
	.loc	1 508 144               # MatrixMult.c:508:144
	movups	%xmm0, 80(%r15)
	.loc	1 437 159               # MatrixMult.c:437:159
	movaps	.LCPI6_6(%rip), %xmm0   # xmm0 = [61,32]
	.loc	1 508 172               # MatrixMult.c:508:172
	movups	%xmm0, 96(%r15)
.Ltmp151:
	#DEBUG_VALUE: main:_27_has_ownership <- 1
	.loc	1 511 2                 # MatrixMult.c:511:2
	movl	$14, %esi
	movq	%r15, %rdi
	callq	printf_s
.Ltmp152:
	#DEBUG_VALUE: main:_30 <- 2000
	.loc	1 517 6                 # MatrixMult.c:517:6
	movq	16000(%rbp), %rsi
.Ltmp153:
	#DEBUG_VALUE: main:_31 <- %RSI
	.loc	1 519 2                 # MatrixMult.c:519:2
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp154:
	#DEBUG_VALUE: main:_34_size <- 25
	.loc	1 524 2                 # MatrixMult.c:524:2
	movl	$200, %edi
	callq	malloc
	movq	%rax, %r14
.Ltmp155:
	#DEBUG_VALUE: main:_34 <- %R14
	.loc	1 525 9                 # MatrixMult.c:525:9
	movaps	.LCPI6_9(%rip), %xmm0   # xmm0 = [80,97]
	movups	%xmm0, (%r14)
	.loc	1 525 35 is_stmt 0      # MatrixMult.c:525:35
	movaps	.LCPI6_10(%rip), %xmm0  # xmm0 = [115,115]
	movups	%xmm0, 16(%r14)
	.loc	1 525 63                # MatrixMult.c:525:63
	movaps	.LCPI6_11(%rip), %xmm0  # xmm0 = [32,77]
	movups	%xmm0, 32(%r14)
	.loc	1 525 89                # MatrixMult.c:525:89
	movaps	.LCPI6_12(%rip), %xmm0  # xmm0 = [97,116]
	movups	%xmm0, 48(%r14)
	.loc	1 525 116               # MatrixMult.c:525:116
	movaps	.LCPI6_13(%rip), %xmm0  # xmm0 = [114,105]
	movups	%xmm0, 64(%r14)
	.loc	1 525 145               # MatrixMult.c:525:145
	movaps	.LCPI6_14(%rip), %xmm0  # xmm0 = [120,77]
	movups	%xmm0, 80(%r14)
	.loc	1 525 174               # MatrixMult.c:525:174
	movaps	.LCPI6_15(%rip), %xmm0  # xmm0 = [117,108]
	movups	%xmm0, 96(%r14)
	.loc	1 525 204               # MatrixMult.c:525:204
	movaps	.LCPI6_16(%rip), %xmm0  # xmm0 = [116,32]
	movups	%xmm0, 112(%r14)
	.loc	1 525 233               # MatrixMult.c:525:233
	movaps	.LCPI6_17(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 128(%r14)
	.loc	1 525 263               # MatrixMult.c:525:263
	movaps	.LCPI6_18(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 144(%r14)
	.loc	1 525 293               # MatrixMult.c:525:293
	movaps	.LCPI6_19(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 160(%r14)
	.loc	1 525 321               # MatrixMult.c:525:321
	movaps	.LCPI6_20(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 176(%r14)
	.loc	1 525 350               # MatrixMult.c:525:350
	movq	$101, 192(%r14)
.Ltmp156:
	#DEBUG_VALUE: main:_34_has_ownership <- 1
	.loc	1 528 2 is_stmt 1       # MatrixMult.c:528:2
	movl	$25, %esi
.Ltmp157:
	movq	%r14, %rdi
	callq	println_s
.Ltmp158:
	.loc	1 530 2 discriminator 1 # MatrixMult.c:530:2
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	free_Matrix
.Ltmp159:
	#DEBUG_VALUE: main:A_has_ownership <- 0
	.loc	1 531 2 discriminator 1 # MatrixMult.c:531:2
	movq	16(%rsp), %rdi          # 8-byte Reload
	callq	free_Matrix
.Ltmp160:
	#DEBUG_VALUE: main:B_has_ownership <- 0
	.loc	1 532 2 discriminator 1 # MatrixMult.c:532:2
	movq	%r13, %rdi
	callq	free_Matrix
.Ltmp161:
	#DEBUG_VALUE: main:C_has_ownership <- 0
	.loc	1 533 2 discriminator 1 # MatrixMult.c:533:2
	movq	%rbp, %rdi
	callq	free
.Ltmp162:
	#DEBUG_VALUE: main:data_has_ownership <- 0
	.loc	1 535 2 discriminator 1 # MatrixMult.c:535:2
	movq	%r12, %rdi
	callq	free
.Ltmp163:
	#DEBUG_VALUE: main:_8_has_ownership <- 0
	.loc	1 536 2 discriminator 1 # MatrixMult.c:536:2
	movq	32(%rsp), %rdi          # 8-byte Reload
	callq	free
.Ltmp164:
	#DEBUG_VALUE: main:_11_has_ownership <- 0
	.loc	1 538 2 discriminator 1 # MatrixMult.c:538:2
	movq	%rbx, %rdi
	callq	free
.Ltmp165:
	#DEBUG_VALUE: main:_17_has_ownership <- 0
	.loc	1 539 2 discriminator 1 # MatrixMult.c:539:2
	movq	24(%rsp), %rdi          # 8-byte Reload
	callq	free
.Ltmp166:
	#DEBUG_VALUE: main:_20_has_ownership <- 0
	.loc	1 542 2 discriminator 1 # MatrixMult.c:542:2
	movq	%r15, %rdi
	callq	free
.Ltmp167:
	#DEBUG_VALUE: main:_27_has_ownership <- 0
	.loc	1 543 2 discriminator 1 # MatrixMult.c:543:2
	movq	%r14, %rdi
	callq	free
.Ltmp168:
	#DEBUG_VALUE: main:_34_has_ownership <- 0
	.loc	1 544 2                 # MatrixMult.c:544:2
	xorl	%edi, %edi
	callq	exit
.Ltmp169:
.Lfunc_end6:
	.size	main, .Lfunc_end6-main
	.cfi_endproc

	.p2align	4, 0x90
	.type	init_polly_subfn,@function
init_polly_subfn:                       # @init_polly_subfn
.Lfunc_begin7:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Ltmp170:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp171:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp172:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp173:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp174:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp175:
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
.Ltmp176:
	.cfi_def_cfa_offset 80
.Ltmp177:
	.cfi_offset %rbx, -56
.Ltmp178:
	.cfi_offset %r12, -48
.Ltmp179:
	.cfi_offset %r13, -40
.Ltmp180:
	.cfi_offset %r14, -32
.Ltmp181:
	.cfi_offset %r15, -24
.Ltmp182:
	.cfi_offset %rbp, -16
	movq	(%rdi), %r12
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB7_2
# BB#1:                                 # %polly.par.loadIVBounds.preheader
	addq	$16, %r12
	movl	$31, %r13d
	movl	$7, %r14d
	.p2align	4, 0x90
.LBB7_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_6 Depth 2
                                        #       Child Loop BB7_12 Depth 3
                                        #         Child Loop BB7_8 Depth 4
                                        #           Child Loop BB7_9 Depth 5
	movq	8(%rsp), %r8
	movq	16(%rsp), %r10
	addq	$-2, %r8
	imulq	$512000, %r10, %r9      # imm = 0x7D000
	addq	%r12, %r9
	.p2align	4, 0x90
.LBB7_6:                                # %polly.loop_preheader3
                                        #   Parent Loop BB7_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_12 Depth 3
                                        #         Child Loop BB7_8 Depth 4
                                        #           Child Loop BB7_9 Depth 5
	movq	%r10, %rsi
	shlq	$5, %rsi
	movl	$1999, %edi             # imm = 0x7CF
	subq	%rsi, %rdi
	cmpq	$31, %rdi
	cmovgq	%r13, %rdi
	testq	%rdi, %rdi
	js	.LBB7_5
# BB#7:                                 #   in Loop: Header=BB7_6 Depth=2
	decq	%rdi
	movq	%r9, %r11
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB7_12:                               # %polly.loop_header8.preheader.us
                                        #   Parent Loop BB7_4 Depth=1
                                        #     Parent Loop BB7_6 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB7_8 Depth 4
                                        #           Child Loop BB7_9 Depth 5
	leaq	(,%rdx,8), %rax
	movl	$499, %ecx              # imm = 0x1F3
	subq	%rax, %rcx
	cmpq	$7, %rcx
	cmovgq	%r14, %rcx
	decq	%rcx
	movq	%r11, %r15
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB7_8:                                # %polly.loop_header8.us
                                        #   Parent Loop BB7_4 Depth=1
                                        #     Parent Loop BB7_6 Depth=2
                                        #       Parent Loop BB7_12 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB7_9 Depth 5
	leaq	(%rbp,%rsi), %rax
	.loc	1 121 11                # MatrixMult.c:121:11
	movd	%rax, %xmm0
	pshufd	$68, %xmm0, %xmm0       # xmm0 = xmm0[0,1,0,1]
	movq	$-1, %rax
	movq	%r15, %rbx
	.p2align	4, 0x90
.LBB7_9:                                # %polly.loop_preheader23.us
                                        #   Parent Loop BB7_4 Depth=1
                                        #     Parent Loop BB7_6 Depth=2
                                        #       Parent Loop BB7_12 Depth=3
                                        #         Parent Loop BB7_8 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movdqu	-16(%rbx), %xmm1
	paddq	%xmm0, %xmm1
	movdqu	%xmm1, -16(%rbx)
	movdqu	(%rbx), %xmm1
	paddq	%xmm0, %xmm1
	movdqu	%xmm1, (%rbx)
	incq	%rax
	addq	$32, %rbx
	cmpq	%rcx, %rax
	jle	.LBB7_9
# BB#10:                                # %polly.loop_exit17.us
                                        #   in Loop: Header=BB7_8 Depth=4
	addq	$16000, %r15            # imm = 0x3E80
	cmpq	%rdi, %rbp
	leaq	1(%rbp), %rbp
	jle	.LBB7_8
# BB#11:                                # %polly.loop_exit10.loopexit.us
                                        #   in Loop: Header=BB7_12 Depth=3
	incq	%rdx
	addq	$256, %r11              # imm = 0x100
	cmpq	$63, %rdx
	jne	.LBB7_12
.LBB7_5:                                # %polly.loop_exit4
                                        #   in Loop: Header=BB7_6 Depth=2
	addq	$512000, %r9            # imm = 0x7D000
	cmpq	%r8, %r10
	leaq	1(%r10), %r10
	jle	.LBB7_6
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB7_4 Depth=1
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB7_4
.LBB7_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end7:
	.size	init_polly_subfn, .Lfunc_end7-init_polly_subfn
	.cfi_endproc

	.p2align	4, 0x90
	.type	mat_mult_polly_subfn,@function
mat_mult_polly_subfn:                   # @mat_mult_polly_subfn
.Lfunc_begin8:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Ltmp183:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp184:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp185:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp186:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp187:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp188:
	.cfi_def_cfa_offset 56
	subq	$136, %rsp
.Ltmp189:
	.cfi_def_cfa_offset 192
.Ltmp190:
	.cfi_offset %rbx, -56
.Ltmp191:
	.cfi_offset %r12, -48
.Ltmp192:
	.cfi_offset %r13, -40
.Ltmp193:
	.cfi_offset %r14, -32
.Ltmp194:
	.cfi_offset %r15, -24
.Ltmp195:
	.cfi_offset %rbp, -16
	movq	(%rdi), %rbx
	movq	8(%rdi), %rax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movq	16(%rdi), %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	leaq	48(%rsp), %rdi
	leaq	40(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB8_2
# BB#1:                                 # %polly.par.loadIVBounds.preheader
	addq	$24, 8(%rsp)            # 8-byte Folded Spill
	.p2align	4, 0x90
.LBB8_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_7 Depth 2
                                        #       Child Loop BB8_8 Depth 3
                                        #         Child Loop BB8_16 Depth 4
                                        #           Child Loop BB8_10 Depth 5
                                        #             Child Loop BB8_11 Depth 6
                                        #               Child Loop BB8_12 Depth 7
	movq	40(%rsp), %rax
	movq	48(%rsp), %rcx
	addq	$-2, %rax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	imulq	$512000, %rcx, %rax     # imm = 0x7D000
	addq	8(%rsp), %rax           # 8-byte Folded Reload
	movq	%rax, 16(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB8_7:                                # %polly.loop_preheader3
                                        #   Parent Loop BB8_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB8_8 Depth 3
                                        #         Child Loop BB8_16 Depth 4
                                        #           Child Loop BB8_10 Depth 5
                                        #             Child Loop BB8_11 Depth 6
                                        #               Child Loop BB8_12 Depth 7
	movq	%rcx, 72(%rsp)          # 8-byte Spill
	shlq	$5, %rcx
	movq	%rcx, 120(%rsp)         # 8-byte Spill
	movl	$1999, %edx             # imm = 0x7CF
	subq	%rcx, %rdx
	cmpq	$31, %rdx
	movl	$31, %eax
	cmovgq	%rax, %rdx
	movq	%rdx, 80(%rsp)          # 8-byte Spill
	leaq	-1(%rdx), %rax
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movq	56(%rsp), %rax          # 8-byte Reload
	movq	%rax, 24(%rsp)          # 8-byte Spill
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB8_8:                                # %polly.loop_preheader9
                                        #   Parent Loop BB8_4 Depth=1
                                        #     Parent Loop BB8_7 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB8_16 Depth 4
                                        #           Child Loop BB8_10 Depth 5
                                        #             Child Loop BB8_11 Depth 6
                                        #               Child Loop BB8_12 Depth 7
	movq	%r10, 88(%rsp)          # 8-byte Spill
	shlq	$5, %r10
	movl	$1999, %eax             # imm = 0x7CF
	subq	%r10, %rax
	cmpq	$31, %rax
	movl	$31, %edi
	cmovleq	%rax, %rdi
	cmpq	$0, 80(%rsp)            # 8-byte Folded Reload
	js	.LBB8_5
# BB#9:                                 #   in Loop: Header=BB8_8 Depth=3
	decq	%rdi
	movq	16(%rsp), %r13          # 8-byte Reload
	movq	24(%rsp), %rax          # 8-byte Reload
	movq	%rax, 32(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB8_16:                               # %polly.loop_header14.preheader.us
                                        #   Parent Loop BB8_4 Depth=1
                                        #     Parent Loop BB8_7 Depth=2
                                        #       Parent Loop BB8_8 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB8_10 Depth 5
                                        #             Child Loop BB8_11 Depth 6
                                        #               Child Loop BB8_12 Depth 7
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movq	%r13, 104(%rsp)         # 8-byte Spill
	leaq	(,%rax,8), %rax
	movl	$499, %r8d              # imm = 0x1F3
	subq	%rax, %r8
	cmpq	$7, %r8
	movl	$7, %eax
	cmovgq	%rax, %r8
	decq	%r8
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB8_10:                               # %polly.loop_header14.us
                                        #   Parent Loop BB8_4 Depth=1
                                        #     Parent Loop BB8_7 Depth=2
                                        #       Parent Loop BB8_8 Depth=3
                                        #         Parent Loop BB8_16 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB8_11 Depth 6
                                        #               Child Loop BB8_12 Depth 7
	movq	%rcx, 128(%rsp)         # 8-byte Spill
	movq	120(%rsp), %rax         # 8-byte Reload
	leaq	(%rcx,%rax), %rax
	imulq	$2000, %rax, %r11       # imm = 0x7D0
	movq	32(%rsp), %rsi          # 8-byte Reload
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB8_11:                               # %polly.loop_header21.us
                                        #   Parent Loop BB8_4 Depth=1
                                        #     Parent Loop BB8_7 Depth=2
                                        #       Parent Loop BB8_8 Depth=3
                                        #         Parent Loop BB8_16 Depth=4
                                        #           Parent Loop BB8_10 Depth=5
                                        # =>          This Loop Header: Depth=6
                                        #               Child Loop BB8_12 Depth 7
	leaq	(%r14,%r10), %rdx
	addq	%r11, %rdx
	movq	(%rbx,%rdx,8), %rbp
	movq	$-1, %r12
	movq	%r13, %r9
	movq	%rsi, %rax
	.p2align	4, 0x90
.LBB8_12:                               # %polly.loop_preheader36.us
                                        #   Parent Loop BB8_4 Depth=1
                                        #     Parent Loop BB8_7 Depth=2
                                        #       Parent Loop BB8_8 Depth=3
                                        #         Parent Loop BB8_16 Depth=4
                                        #           Parent Loop BB8_10 Depth=5
                                        #             Parent Loop BB8_11 Depth=6
                                        # =>            This Inner Loop Header: Depth=7
	movq	(%rax), %r15
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	-24(%r9), %r15
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	%rbp, %r15
	movq	16000(%rax), %rbp
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	-16(%r9), %rbp
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	%r15, %rbp
	movq	32000(%rax), %rcx
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	-8(%r9), %rcx
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	%rbp, %rcx
	movq	48000(%rax), %rbp
	.loc	1 314 12                # MatrixMult.c:314:12
	imulq	(%r9), %rbp
	.loc	1 316 12                # MatrixMult.c:316:12
	addq	%rcx, %rbp
	incq	%r12
	addq	$64000, %rax            # imm = 0xFA00
	addq	$32, %r9
	cmpq	%r8, %r12
	jle	.LBB8_12
# BB#13:                                # %polly.loop_exit30.us
                                        #   in Loop: Header=BB8_11 Depth=6
	movq	%rbp, (%rbx,%rdx,8)
	addq	$8, %rsi
	cmpq	%rdi, %r14
	leaq	1(%r14), %r14
	jle	.LBB8_11
# BB#14:                                # %polly.loop_exit23.us
                                        #   in Loop: Header=BB8_10 Depth=5
	addq	$16000, %r13            # imm = 0x3E80
	movq	128(%rsp), %rcx         # 8-byte Reload
	cmpq	112(%rsp), %rcx         # 8-byte Folded Reload
	leaq	1(%rcx), %rcx
	jle	.LBB8_10
# BB#15:                                # %polly.loop_exit16.loopexit.us
                                        #   in Loop: Header=BB8_16 Depth=4
	movq	96(%rsp), %rax          # 8-byte Reload
	incq	%rax
	addq	$512000, 32(%rsp)       # 8-byte Folded Spill
                                        # imm = 0x7D000
	movq	104(%rsp), %r13         # 8-byte Reload
	addq	$256, %r13              # imm = 0x100
	cmpq	$63, %rax
	jne	.LBB8_16
.LBB8_5:                                # %polly.loop_exit10
                                        #   in Loop: Header=BB8_8 Depth=3
	movq	88(%rsp), %r10          # 8-byte Reload
	incq	%r10
	addq	$256, 24(%rsp)          # 8-byte Folded Spill
                                        # imm = 0x100
	cmpq	$63, %r10
	jne	.LBB8_8
# BB#6:                                 # %polly.loop_exit4
                                        #   in Loop: Header=BB8_7 Depth=2
	addq	$512000, 16(%rsp)       # 8-byte Folded Spill
                                        # imm = 0x7D000
	movq	72(%rsp), %rcx          # 8-byte Reload
	cmpq	64(%rsp), %rcx          # 8-byte Folded Reload
	leaq	1(%rcx), %rcx
	jle	.LBB8_7
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB8_4 Depth=1
	leaq	48(%rsp), %rdi
	leaq	40(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB8_4
.LBB8_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$136, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end8:
	.size	mat_mult_polly_subfn, .Lfunc_end8-mat_mult_polly_subfn
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
	.asciz	"%lld"
	.size	.L.str.3, 5

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	" height:"
	.size	.L.str.4, 9

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"%lld\n"
	.size	.L.str.6, 6

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
	.asciz	"_4_has_ownership"      # string offset=327
.Linfo_string13:
	.asciz	"r_has_ownership"       # string offset=344
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
	.asciz	"_34_size"              # string offset=1109
.Linfo_string110:
	.asciz	"_34_has_ownership"     # string offset=1118
.Linfo_string111:
	.asciz	"A"                     # string offset=1136
.Linfo_string112:
	.asciz	"B"                     # string offset=1138
.Linfo_string113:
	.asciz	"C"                     # string offset=1140
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
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Lfunc_end4-.Lfunc_begin0
	.short	6                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	128                     # 4000000
	.byte	146                     # DW_OP_stack_value
	.byte	244                     # 
	.byte	1                       # 
	.byte	159                     # 
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp58-.Lfunc_begin0
	.quad	.Lfunc_end4-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Lfunc_end4-.Lfunc_begin0
	.short	4                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	208                     # 2000
	.byte	15                      # DW_OP_stack_value
	.byte	159                     # 
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp57-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Lfunc_end4-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Lfunc_end4-.Lfunc_begin0
	.short	4                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	208                     # 2000
	.byte	15                      # DW_OP_stack_value
	.byte	159                     # 
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Lfunc_end4-.Lfunc_begin0
	.short	4                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	208                     # 2000
	.byte	15                      # DW_OP_stack_value
	.byte	159                     # 
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Ltmp57-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Lfunc_end4-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Ltmp56-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Ltmp56-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
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
	.quad	.Ltmp87-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
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
	.quad	.Ltmp106-.Lfunc_begin0
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
	.quad	.Ltmp87-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
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
	.byte	95                      # super-register DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	95                      # super-register DW_OP_reg15
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Ltmp101-.Lfunc_begin0
	.short	5                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
	.byte	157                     # DW_OP_bit_piece
	.byte	1                       # 1
	.byte	0                       # 0
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp100-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	4                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	208                     # 2000
	.byte	15                      # DW_OP_stack_value
	.byte	159                     # 
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp100-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	4                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	208                     # 2000
	.byte	15                      # DW_OP_stack_value
	.byte	159                     # 
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp102-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp102-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp99-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp99-.Lfunc_begin0
	.quad	.Ltmp100-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	0
	.quad	0
.Ldebug_loc30:
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
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp97-.Lfunc_begin0
	.quad	.Ltmp100-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc32:
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
.Ldebug_loc33:
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
.Ldebug_loc34:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp90-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp90-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc35:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	90                      # DW_OP_reg10
	.quad	0
	.quad	0
.Ldebug_loc36:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp95-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp95-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	4                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	208                     # 2000
	.byte	15                      # DW_OP_stack_value
	.byte	159                     # 
	.quad	0
	.quad	0
.Ldebug_loc37:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp94-.Lfunc_begin0
	.quad	.Ltmp100-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc38:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp93-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp93-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc39:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp92-.Lfunc_begin0
	.quad	.Ltmp93-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc40:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	4                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	208                     # 2000
	.byte	15                      # DW_OP_stack_value
	.byte	159                     # 
	.quad	0
	.quad	0
.Ldebug_loc41:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	90                      # DW_OP_reg10
	.quad	0
	.quad	0
.Ldebug_loc42:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	4                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	208                     # 2000
	.byte	15                      # DW_OP_stack_value
	.byte	159                     # 
	.quad	0
	.quad	0
.Ldebug_loc43:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp95-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp95-.Lfunc_begin0
	.quad	.Ltmp100-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc44:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp90-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp90-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc45:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	90                      # DW_OP_reg10
	.quad	0
	.quad	0
.Ldebug_loc46:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	4                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	208                     # 2000
	.byte	15                      # DW_OP_stack_value
	.byte	159                     # 
	.quad	0
	.quad	0
.Ldebug_loc47:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp89-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	4                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	208                     # 2000
	.byte	15                      # DW_OP_stack_value
	.byte	159                     # 
	.quad	0
	.quad	0
.Ldebug_loc48:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	4                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	208                     # 2000
	.byte	15                      # DW_OP_stack_value
	.byte	159                     # 
	.quad	0
	.quad	0
.Ldebug_loc49:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	4                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	208                     # 2000
	.byte	15                      # DW_OP_stack_value
	.byte	159                     # 
	.quad	0
	.quad	0
.Ldebug_loc50:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp97-.Lfunc_begin0
	.quad	.Ltmp100-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc51:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp99-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp99-.Lfunc_begin0
	.quad	.Ltmp100-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	0
	.quad	0
.Ldebug_loc52:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Ltmp112-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp112-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc53:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp81-.Lfunc_begin0
	.quad	.Ltmp111-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp111-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc54:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp80-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp80-.Lfunc_begin0
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
.Ldebug_loc55:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp80-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	6                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	128                     # 4000000
	.byte	146                     # DW_OP_stack_value
	.byte	244                     # 
	.byte	1                       # 
	.byte	159                     # 
	.quad	0
	.quad	0
.Ldebug_loc56:
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc57:
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc58:
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc59:
	.quad	.Ltmp81-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc60:
	.quad	.Ltmp81-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc61:
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc62:
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc63:
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Ltmp102-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp102-.Lfunc_begin0
	.quad	.Lfunc_end5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc64:
	.quad	.Ltmp104-.Lfunc_begin0
	.quad	.Ltmp105-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	16                      # 16
	.quad	.Ltmp105-.Lfunc_begin0
	.quad	.Ltmp106-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc65:
	.quad	.Ltmp107-.Lfunc_begin0
	.quad	.Ltmp108-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	24                      # 24
	.quad	.Ltmp108-.Lfunc_begin0
	.quad	.Ltmp109-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc66:
	.quad	.Lfunc_begin6-.Lfunc_begin0
	.quad	.Ltmp129-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc67:
	.quad	.Lfunc_begin6-.Lfunc_begin0
	.quad	.Ltmp132-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc68:
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp128-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp128-.Lfunc_begin0
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
.Ldebug_loc69:
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp137-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp137-.Lfunc_begin0
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
.Ldebug_loc70:
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp148-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp148-.Lfunc_begin0
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
.Ldebug_loc71:
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp149-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp149-.Lfunc_begin0
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
.Ldebug_loc72:
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp128-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp128-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	14                      # 14
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc73:
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp131-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp131-.Lfunc_begin0
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
.Ldebug_loc74:
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp134-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp134-.Lfunc_begin0
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
.Ldebug_loc75:
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp134-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp134-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	4                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	208                     # 2000
	.byte	15                      # DW_OP_stack_value
	.byte	159                     # 
	.quad	0
	.quad	0
.Ldebug_loc76:
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp135-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp135-.Lfunc_begin0
	.quad	.Ltmp140-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc77:
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp137-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp137-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	14                      # 14
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc78:
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp139-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp139-.Lfunc_begin0
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
.Ldebug_loc79:
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp141-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp141-.Lfunc_begin0
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
.Ldebug_loc80:
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp141-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	4                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	208                     # 2000
	.byte	15                      # DW_OP_stack_value
	.byte	159                     # 
	.quad	0
	.quad	0
.Ldebug_loc81:
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp142-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp142-.Lfunc_begin0
	.quad	.Ltmp144-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc82:
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp149-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp149-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	14                      # 14
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc83:
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp151-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp151-.Lfunc_begin0
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
.Ldebug_loc84:
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp152-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp152-.Lfunc_begin0
	.quad	.Lfunc_end6-.Lfunc_begin0
	.short	4                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	208                     # 2000
	.byte	15                      # DW_OP_stack_value
	.byte	159                     # 
	.quad	0
	.quad	0
.Ldebug_loc85:
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp153-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp153-.Lfunc_begin0
	.quad	.Ltmp157-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc86:
	.quad	.Ltmp127-.Lfunc_begin0
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
	.quad	.Ltmp127-.Lfunc_begin0
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
	.quad	.Ltmp128-.Lfunc_begin0
	.quad	.Ltmp133-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp133-.Lfunc_begin0
	.quad	.Ltmp145-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	.Ltmp145-.Lfunc_begin0
	.quad	.Ltmp147-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
	.quad	0
	.quad	0
.Ldebug_loc89:
	.quad	.Ltmp128-.Lfunc_begin0
	.quad	.Ltmp133-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp133-.Lfunc_begin0
	.quad	.Ltmp145-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	.Ltmp145-.Lfunc_begin0
	.quad	.Ltmp147-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
	.quad	0
	.quad	0
.Ldebug_loc90:
	.quad	.Ltmp134-.Lfunc_begin0
	.quad	.Ltmp135-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp135-.Lfunc_begin0
	.quad	.Ltmp136-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	32                      # 32
	.quad	0
	.quad	0
.Ldebug_loc91:
	.quad	.Ltmp137-.Lfunc_begin0
	.quad	.Ltmp146-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp146-.Lfunc_begin0
	.quad	.Ltmp147-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	16                      # 16
	.quad	0
	.quad	0
.Ldebug_loc92:
	.quad	.Ltmp137-.Lfunc_begin0
	.quad	.Ltmp146-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp146-.Lfunc_begin0
	.quad	.Ltmp147-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	16                      # 16
	.quad	0
	.quad	0
.Ldebug_loc93:
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp142-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp142-.Lfunc_begin0
	.quad	.Ltmp143-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	24                      # 24
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
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
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
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	2889                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0xb42 DW_TAG_compile_unit
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
	.long	1010                    # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x75:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	1018                    # DW_AT_abstract_origin
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
	.long	321                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0xed:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	332                     # DW_AT_abstract_origin
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
	.byte	27                      # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x14c:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	25                      # DW_AT_decl_line
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
	.byte	19                      # Abbrev [19] 0x1c6:0x22c DW_TAG_subprogram
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
	.long	.Linfo_string13         # DW_AT_name
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
	.byte	21                      # Abbrev [21] 0x22d:0xd DW_TAG_variable
	.ascii	"\320\017"              # DW_AT_const_value
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	50                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x23a:0xd DW_TAG_variable
	.ascii	"\320\017"              # DW_AT_const_value
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x247:0xf DW_TAG_variable
	.ascii	"\200\222\364\001"      # DW_AT_const_value
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	52                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x256:0xf DW_TAG_variable
	.ascii	"\200\222\364\001"      # DW_AT_const_value
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	53                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x265:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	54                      # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x271:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	55                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x27d:0xf DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	56                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x28c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	57                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x298:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	58                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x2a4:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x2b0:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	60                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x2bc:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	61                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x2c8:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x2d4:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x2e0:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x2ec:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	65                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x2f8:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	66                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x304:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	67                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x310:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	68                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x31c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	69                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x328:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x334:0xf DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	72                      # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x343:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	73                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x352:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	74                      # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x361:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string4          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	45                      # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x370:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	53                      # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x37f:0xf DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	71                      # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x38e:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	43                      # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	22                      # Abbrev [22] 0x399:0x58 DW_TAG_inlined_subroutine
	.long	254                     # DW_AT_abstract_origin
	.quad	.Ltmp55                 # DW_AT_low_pc
	.long	.Ltmp57-.Ltmp55         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	159                     # DW_AT_call_line
	.byte	23                      # Abbrev [23] 0x3ac:0x7 DW_TAG_formal_parameter
	.ascii	"\320\017"              # DW_AT_const_value
	.long	266                     # DW_AT_abstract_origin
	.byte	23                      # Abbrev [23] 0x3b3:0x7 DW_TAG_formal_parameter
	.ascii	"\320\017"              # DW_AT_const_value
	.long	277                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x3ba:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc18           # DW_AT_location
	.long	288                     # DW_AT_abstract_origin
	.byte	23                      # Abbrev [23] 0x3c3:0x9 DW_TAG_formal_parameter
	.ascii	"\200\222\364\001"      # DW_AT_const_value
	.long	299                     # DW_AT_abstract_origin
	.byte	24                      # Abbrev [24] 0x3cc:0xc DW_TAG_formal_parameter
	.byte	6                       # DW_AT_location
	.byte	16
	.byte	0
	.byte	159
	.byte	157
	.byte	1
	.byte	0
	.long	310                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x3d8:0x9 DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	321                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x3e1:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	332                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x3e7:0x9 DW_TAG_variable
	.long	.Ldebug_loc20           # DW_AT_location
	.long	343                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	25                      # Abbrev [25] 0x3f2:0x14 DW_TAG_subprogram
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	12                      # Abbrev [12] 0x3fa:0xb DW_TAG_formal_parameter
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	2                       # Abbrev [2] 0x406:0x426 DW_TAG_subprogram
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
	.byte	3                       # Abbrev [3] 0x41f:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	169                     # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	3                       # Abbrev [3] 0x42e:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	169                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	3                       # Abbrev [3] 0x43d:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	169                     # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	3                       # Abbrev [3] 0x44c:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	169                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x45b:0xf DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	223                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x46a:0xf DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	222                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x479:0xf DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	221                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x488:0xf DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	219                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x497:0xf DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	218                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x4a6:0xf DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	217                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x4b5:0xf DW_TAG_variable
	.long	.Ldebug_loc32           # DW_AT_location
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	216                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x4c4:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	215                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x4d0:0xf DW_TAG_variable
	.long	.Ldebug_loc33           # DW_AT_location
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	214                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x4df:0xf DW_TAG_variable
	.long	.Ldebug_loc34           # DW_AT_location
	.long	.Linfo_string66         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	213                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x4ee:0xf DW_TAG_variable
	.long	.Ldebug_loc35           # DW_AT_location
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	212                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x4fd:0xf DW_TAG_variable
	.long	.Ldebug_loc36           # DW_AT_location
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	211                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x50c:0xf DW_TAG_variable
	.long	.Ldebug_loc37           # DW_AT_location
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	210                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x51b:0xf DW_TAG_variable
	.long	.Ldebug_loc38           # DW_AT_location
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	209                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x52a:0xf DW_TAG_variable
	.long	.Ldebug_loc39           # DW_AT_location
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	208                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x539:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	207                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x545:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	206                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x551:0xf DW_TAG_variable
	.long	.Ldebug_loc40           # DW_AT_location
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	205                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x560:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string75         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	204                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x56c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string76         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	203                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x578:0xf DW_TAG_variable
	.long	.Ldebug_loc41           # DW_AT_location
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	202                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x587:0xf DW_TAG_variable
	.long	.Ldebug_loc42           # DW_AT_location
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	201                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x596:0xf DW_TAG_variable
	.long	.Ldebug_loc43           # DW_AT_location
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	200                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x5a5:0xf DW_TAG_variable
	.long	.Ldebug_loc44           # DW_AT_location
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	199                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x5b4:0xf DW_TAG_variable
	.long	.Ldebug_loc45           # DW_AT_location
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	198                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x5c3:0xf DW_TAG_variable
	.long	.Ldebug_loc46           # DW_AT_location
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	197                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x5d2:0xf DW_TAG_variable
	.long	.Ldebug_loc47           # DW_AT_location
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	196                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x5e1:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	195                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x5ed:0xf DW_TAG_variable
	.long	.Ldebug_loc48           # DW_AT_location
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	194                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x5fc:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	193                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x608:0xf DW_TAG_variable
	.long	.Ldebug_loc49           # DW_AT_location
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	192                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x617:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	191                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x623:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string77         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	190                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x62f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string78         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	189                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x63b:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	188                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x647:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string80         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	187                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x653:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string81         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	186                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x65f:0xf DW_TAG_variable
	.ascii	"\200\222\364\001"      # DW_AT_const_value
	.long	.Linfo_string82         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	185                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x66e:0xf DW_TAG_variable
	.ascii	"\200\222\364\001"      # DW_AT_const_value
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	184                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x67d:0xd DW_TAG_variable
	.ascii	"\320\017"              # DW_AT_const_value
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	183                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x68a:0xd DW_TAG_variable
	.ascii	"\320\017"              # DW_AT_const_value
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	182                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x697:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	181                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x6a3:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string83         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	180                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x6af:0xf DW_TAG_variable
	.long	.Ldebug_loc50           # DW_AT_location
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	179                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x6be:0xf DW_TAG_variable
	.long	.Ldebug_loc51           # DW_AT_location
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	178                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x6cd:0xf DW_TAG_variable
	.long	.Ldebug_loc52           # DW_AT_location
	.long	.Linfo_string84         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	177                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x6dc:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string85         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	176                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x6e8:0xf DW_TAG_variable
	.long	.Ldebug_loc53           # DW_AT_location
	.long	.Linfo_string86         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	175                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x6f7:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string87         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	174                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x703:0xf DW_TAG_variable
	.long	.Ldebug_loc54           # DW_AT_location
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	173                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x712:0xf DW_TAG_variable
	.long	.Ldebug_loc55           # DW_AT_location
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	172                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x721:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	171                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x72d:0xf DW_TAG_variable
	.long	.Ldebug_loc56           # DW_AT_location
	.long	.Linfo_string4          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	172                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x73c:0xf DW_TAG_variable
	.long	.Ldebug_loc57           # DW_AT_location
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	185                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x74b:0xf DW_TAG_variable
	.long	.Ldebug_loc59           # DW_AT_location
	.long	.Linfo_string88         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	174                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x75a:0xf DW_TAG_variable
	.long	.Ldebug_loc60           # DW_AT_location
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	187                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x769:0xf DW_TAG_variable
	.long	.Ldebug_loc61           # DW_AT_location
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	189                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x778:0xf DW_TAG_variable
	.long	.Ldebug_loc62           # DW_AT_location
	.long	.Linfo_string89         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	176                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x787:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	170                     # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x792:0xb DW_TAG_variable
	.long	.Linfo_string90         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	220                     # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	26                      # Abbrev [26] 0x79d:0x50 DW_TAG_inlined_subroutine
	.long	254                     # DW_AT_abstract_origin
	.quad	.Ltmp100                # DW_AT_low_pc
	.long	.Ltmp103-.Ltmp100       # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.short	365                     # DW_AT_call_line
	.byte	23                      # Abbrev [23] 0x7b1:0x7 DW_TAG_formal_parameter
	.ascii	"\320\017"              # DW_AT_const_value
	.long	266                     # DW_AT_abstract_origin
	.byte	23                      # Abbrev [23] 0x7b8:0x7 DW_TAG_formal_parameter
	.ascii	"\320\017"              # DW_AT_const_value
	.long	277                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x7bf:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc58           # DW_AT_location
	.long	288                     # DW_AT_abstract_origin
	.byte	23                      # Abbrev [23] 0x7c8:0x9 DW_TAG_formal_parameter
	.ascii	"\200\222\364\001"      # DW_AT_const_value
	.long	299                     # DW_AT_abstract_origin
	.byte	24                      # Abbrev [24] 0x7d1:0xc DW_TAG_formal_parameter
	.byte	6                       # DW_AT_location
	.byte	16
	.byte	0
	.byte	159
	.byte	157
	.byte	1
	.byte	0
	.long	310                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x7dd:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	332                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x7e3:0x9 DW_TAG_variable
	.long	.Ldebug_loc63           # DW_AT_location
	.long	321                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	27                      # Abbrev [27] 0x7ed:0x1f DW_TAG_inlined_subroutine
	.long	1010                    # DW_AT_abstract_origin
	.quad	.Ltmp105                # DW_AT_low_pc
	.long	.Ltmp106-.Ltmp105       # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.short	368                     # DW_AT_call_line
	.byte	1                       # DW_AT_GNU_discriminator
	.byte	6                       # Abbrev [6] 0x802:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc64           # DW_AT_location
	.long	1018                    # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	27                      # Abbrev [27] 0x80c:0x1f DW_TAG_inlined_subroutine
	.long	1010                    # DW_AT_abstract_origin
	.quad	.Ltmp108                # DW_AT_low_pc
	.long	.Ltmp109-.Ltmp108       # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.short	369                     # DW_AT_call_line
	.byte	1                       # DW_AT_GNU_discriminator
	.byte	6                       # Abbrev [6] 0x821:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc65           # DW_AT_location
	.long	1018                    # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	28                      # Abbrev [28] 0x82c:0x307 DW_TAG_subprogram
	.quad	.Lfunc_begin6           # DW_AT_low_pc
	.long	.Lfunc_end6-.Lfunc_begin6 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	381                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	2867                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	29                      # Abbrev [29] 0x846:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc66           # DW_AT_location
	.long	.Linfo_string91         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	381                     # DW_AT_decl_line
	.long	2867                    # DW_AT_type
	.byte	29                      # Abbrev [29] 0x856:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc67           # DW_AT_location
	.long	.Linfo_string92         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	381                     # DW_AT_decl_line
	.long	2874                    # DW_AT_type
	.byte	30                      # Abbrev [30] 0x866:0x10 DW_TAG_variable
	.long	.Ldebug_loc68           # DW_AT_location
	.long	.Linfo_string94         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	383                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x876:0x10 DW_TAG_variable
	.long	.Ldebug_loc69           # DW_AT_location
	.long	.Linfo_string95         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	385                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x886:0x10 DW_TAG_variable
	.long	.Ldebug_loc70           # DW_AT_location
	.long	.Linfo_string96         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	387                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x896:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	388                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x8a3:0x10 DW_TAG_variable
	.long	.Ldebug_loc71           # DW_AT_location
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	389                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x8b3:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string97         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	391                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x8c0:0x10 DW_TAG_variable
	.long	.Ldebug_loc72           # DW_AT_location
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	393                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x8d0:0x10 DW_TAG_variable
	.long	.Ldebug_loc73           # DW_AT_location
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	394                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x8e0:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string98         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	396                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x8ed:0x10 DW_TAG_variable
	.long	.Ldebug_loc74           # DW_AT_location
	.long	.Linfo_string99         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	397                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x8fd:0x10 DW_TAG_variable
	.long	.Ldebug_loc75           # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	398                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x90d:0x10 DW_TAG_variable
	.long	.Ldebug_loc76           # DW_AT_location
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	399                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x91d:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	401                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x92a:0x10 DW_TAG_variable
	.long	.Ldebug_loc77           # DW_AT_location
	.long	.Linfo_string100        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	403                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x93a:0x10 DW_TAG_variable
	.long	.Ldebug_loc78           # DW_AT_location
	.long	.Linfo_string101        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	404                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x94a:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string102        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	406                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x957:0x10 DW_TAG_variable
	.long	.Ldebug_loc79           # DW_AT_location
	.long	.Linfo_string103        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	407                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x967:0x10 DW_TAG_variable
	.long	.Ldebug_loc80           # DW_AT_location
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	408                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x977:0x10 DW_TAG_variable
	.long	.Ldebug_loc81           # DW_AT_location
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	409                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x987:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string104        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	411                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	31                      # Abbrev [31] 0x994:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string105        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	412                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	32                      # Abbrev [32] 0x9a1:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string106        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	413                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x9ae:0x10 DW_TAG_variable
	.long	.Ldebug_loc82           # DW_AT_location
	.long	.Linfo_string107        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	415                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x9be:0x10 DW_TAG_variable
	.long	.Ldebug_loc83           # DW_AT_location
	.long	.Linfo_string108        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	416                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x9ce:0x10 DW_TAG_variable
	.long	.Ldebug_loc84           # DW_AT_location
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	418                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x9de:0x10 DW_TAG_variable
	.long	.Ldebug_loc85           # DW_AT_location
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	419                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x9ee:0x10 DW_TAG_variable
	.long	.Ldebug_loc86           # DW_AT_location
	.long	.Linfo_string109        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	421                     # DW_AT_decl_line
	.long	440                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0x9fe:0x10 DW_TAG_variable
	.long	.Ldebug_loc87           # DW_AT_location
	.long	.Linfo_string110        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	422                     # DW_AT_decl_line
	.long	447                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xa0e:0x10 DW_TAG_variable
	.long	.Ldebug_loc88           # DW_AT_location
	.long	.Linfo_string111        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	382                     # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xa1e:0x10 DW_TAG_variable
	.long	.Ldebug_loc89           # DW_AT_location
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	390                     # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	33                      # Abbrev [33] 0xa2e:0xe DW_TAG_variable
	.byte	1                       # DW_AT_location
	.byte	92
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	393                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xa3c:0x10 DW_TAG_variable
	.long	.Ldebug_loc90           # DW_AT_location
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	396                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xa4c:0x10 DW_TAG_variable
	.long	.Ldebug_loc91           # DW_AT_location
	.long	.Linfo_string112        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	384                     # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xa5c:0x10 DW_TAG_variable
	.long	.Ldebug_loc92           # DW_AT_location
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	400                     # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	33                      # Abbrev [33] 0xa6c:0xe DW_TAG_variable
	.byte	1                       # DW_AT_location
	.byte	83
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	403                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	30                      # Abbrev [30] 0xa7a:0x10 DW_TAG_variable
	.long	.Ldebug_loc93           # DW_AT_location
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	406                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	33                      # Abbrev [33] 0xa8a:0xe DW_TAG_variable
	.byte	1                       # DW_AT_location
	.byte	93
	.long	.Linfo_string113        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	386                     # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	33                      # Abbrev [33] 0xa98:0xe DW_TAG_variable
	.byte	1                       # DW_AT_location
	.byte	93
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	410                     # DW_AT_decl_line
	.long	366                     # DW_AT_type
	.byte	33                      # Abbrev [33] 0xaa6:0xe DW_TAG_variable
	.byte	1                       # DW_AT_location
	.byte	86
	.long	.Linfo_string4          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	388                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	33                      # Abbrev [33] 0xab4:0xe DW_TAG_variable
	.byte	1                       # DW_AT_location
	.byte	86
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	412                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	33                      # Abbrev [33] 0xac2:0xe DW_TAG_variable
	.byte	1                       # DW_AT_location
	.byte	95
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	415                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	33                      # Abbrev [33] 0xad0:0xe DW_TAG_variable
	.byte	1                       # DW_AT_location
	.byte	94
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	421                     # DW_AT_decl_line
	.long	435                     # DW_AT_type
	.byte	34                      # Abbrev [34] 0xade:0xc DW_TAG_variable
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	392                     # DW_AT_decl_line
	.long	2891                    # DW_AT_type
	.byte	34                      # Abbrev [34] 0xaea:0xc DW_TAG_variable
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	395                     # DW_AT_decl_line
	.long	2891                    # DW_AT_type
	.byte	34                      # Abbrev [34] 0xaf6:0xc DW_TAG_variable
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	402                     # DW_AT_decl_line
	.long	2891                    # DW_AT_type
	.byte	34                      # Abbrev [34] 0xb02:0xc DW_TAG_variable
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	405                     # DW_AT_decl_line
	.long	2891                    # DW_AT_type
	.byte	34                      # Abbrev [34] 0xb0e:0xc DW_TAG_variable
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	414                     # DW_AT_decl_line
	.long	2891                    # DW_AT_type
	.byte	34                      # Abbrev [34] 0xb1a:0xc DW_TAG_variable
	.long	.Linfo_string76         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	417                     # DW_AT_decl_line
	.long	2891                    # DW_AT_type
	.byte	34                      # Abbrev [34] 0xb26:0xc DW_TAG_variable
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	420                     # DW_AT_decl_line
	.long	2891                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	18                      # Abbrev [18] 0xb33:0x7 DW_TAG_base_type
	.long	.Linfo_string22         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	14                      # Abbrev [14] 0xb3a:0x5 DW_TAG_pointer_type
	.long	2879                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0xb3f:0x5 DW_TAG_pointer_type
	.long	2884                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0xb44:0x7 DW_TAG_base_type
	.long	.Linfo_string93         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	35                      # Abbrev [35] 0xb4b:0x1 DW_TAG_pointer_type
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
	.long	2893                    # Compilation Unit Length
	.long	1030                    # DIE offset
	.asciz	"mat_mult"              # External Name
	.long	454                     # DIE offset
	.asciz	"init"                  # External Name
	.long	254                     # DIE offset
	.asciz	"matrix"                # External Name
	.long	1010                    # DIE offset
	.asciz	"free_Matrix"           # External Name
	.long	127                     # DIE offset
	.asciz	"printf_Matrix"         # External Name
	.long	2092                    # DIE offset
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
	.long	2893                    # Compilation Unit Length
	.long	371                     # DIE offset
	.asciz	"Matrix"                # External Name
	.long	440                     # DIE offset
	.asciz	"long long int"         # External Name
	.long	447                     # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	2867                    # DIE offset
	.asciz	"int"                   # External Name
	.long	2884                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
