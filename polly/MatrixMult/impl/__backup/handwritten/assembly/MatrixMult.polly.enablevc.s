	.text
	.file	"llvm/MatrixMult.polly.enablevc.ll"
	.file	1 "MatrixMult.c"
	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
.Lfunc_begin0:
	.loc	1 12 0                  # MatrixMult.c:12:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp0:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp1:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp2:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp3:
	.cfi_def_cfa_offset 40
.Ltmp4:
	.cfi_offset %rbx, -40
.Ltmp5:
	.cfi_offset %r12, -32
.Ltmp6:
	.cfi_offset %r14, -24
.Ltmp7:
	.cfi_offset %r15, -16
	xorl	%r9d, %r9d
.Ltmp8:
	#DEBUG_VALUE: i <- 0
	movl	$31, %r8d
	movl	$7, %r11d
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB0_1:                                # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
                                        #       Child Loop BB0_3 Depth 3
                                        #         Child Loop BB0_4 Depth 4
	movq	%r10, %r12
	shlq	$5, %r12
	movl	$199, %ecx
	subq	%r12, %rcx
	cmpq	$31, %rcx
	cmovgq	%r8, %rcx
	decq	%rcx
	movq	%r9, %r14
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB0_2:                                # %polly.loop_header42
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_3 Depth 3
                                        #         Child Loop BB0_4 Depth 4
	leaq	(,%r15,8), %rax
	movl	$49, %edx
	subq	%rax, %rdx
	cmpq	$7, %rdx
	cmovgq	%r11, %rdx
	decq	%rdx
	movq	%r14, %rdi
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_3:                                # %polly.loop_header48
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_4 Depth 4
	leal	(%rax,%r12), %esi
.Ltmp9:
	.loc	1 29 31 prologue_end    # MatrixMult.c:29:31
	movd	%esi, %xmm0
	pshufd	$0, %xmm0, %xmm0        # xmm0 = xmm0[0,0,0,0]
	movq	$-1, %rsi
	movq	%rdi, %rbx
	.p2align	4, 0x90
.LBB0_4:                                # %polly.loop_header54
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_2 Depth=2
                                        #       Parent Loop BB0_3 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movdqa	A(%rbx), %xmm1
	paddd	%xmm0, %xmm1
	movdqa	%xmm1, A(%rbx)
	movdqa	B(%rbx), %xmm1
	.loc	1 30 31                 # MatrixMult.c:30:31
	paddd	%xmm0, %xmm1
	movdqa	%xmm1, B(%rbx)
	incq	%rsi
	addq	$16, %rbx
	cmpq	%rdx, %rsi
	jle	.LBB0_4
.Ltmp10:
# BB#5:                                 # %polly.loop_exit56
                                        #   in Loop: Header=BB0_3 Depth=3
	addq	$800, %rdi              # imm = 0x320
	cmpq	%rcx, %rax
	leaq	1(%rax), %rax
	jle	.LBB0_3
# BB#6:                                 # %polly.loop_exit50
                                        #   in Loop: Header=BB0_2 Depth=2
	incq	%r15
	subq	$-128, %r14
	cmpq	$7, %r15
	jne	.LBB0_2
# BB#7:                                 # %polly.loop_exit44
                                        #   in Loop: Header=BB0_1 Depth=1
	incq	%r10
	addq	$25600, %r9             # imm = 0x6400
	cmpq	$7, %r10
	jne	.LBB0_1
# BB#8:                                 # %polly.exiting
	.loc	1 33 1                  # MatrixMult.c:33:1
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Ltmp11:
.Lfunc_end0:
	.size	init, .Lfunc_end0-init
	.cfi_endproc

	.globl	mat_mult
	.p2align	4, 0x90
	.type	mat_mult,@function
mat_mult:                               # @mat_mult
.Lfunc_begin1:
	.loc	1 35 0                  # MatrixMult.c:35:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp12:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp13:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp14:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp15:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp16:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp17:
	.cfi_def_cfa_offset 56
.Ltmp18:
	.cfi_offset %rbx, -56
.Ltmp19:
	.cfi_offset %r12, -48
.Ltmp20:
	.cfi_offset %r13, -40
.Ltmp21:
	.cfi_offset %r14, -32
.Ltmp22:
	.cfi_offset %r15, -24
.Ltmp23:
	.cfi_offset %rbp, -16
	movl	$C, %r9d
	xorl	%esi, %esi
	movl	$C+256, %r10d
	movl	$C+512, %r11d
	movl	$C+768, %r15d
	movl	$C+1024, %r8d
	movl	$C+1280, %r12d
	movl	$C+1536, %edi
.Ltmp24:
	#DEBUG_VALUE: mat_mult:i <- 0
	movl	$31, %r14d
	xorps	%xmm0, %xmm0
	movl	$A+12, %eax
	movq	%rax, -80(%rsp)         # 8-byte Spill
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB1_1:                                # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
                                        #     Child Loop BB1_4 Depth 2
                                        #     Child Loop BB1_6 Depth 2
                                        #     Child Loop BB1_8 Depth 2
                                        #     Child Loop BB1_10 Depth 2
                                        #     Child Loop BB1_12 Depth 2
                                        #     Child Loop BB1_14 Depth 2
	movq	%rbx, %rcx
	shlq	$5, %rcx
	movl	$199, %eax
	subq	%rcx, %rax
	cmpq	$31, %rax
	cmovgq	%r14, %rax
	decq	%rax
	movq	$-1, %rbp
	movq	%r9, %rcx
	movq	$-1, %rdx
	.p2align	4, 0x90
.LBB1_2:                                # %polly.loop_header61
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movaps	%xmm0, 240(%rcx)
	movaps	%xmm0, 224(%rcx)
	movaps	%xmm0, 208(%rcx)
	movaps	%xmm0, 192(%rcx)
	movaps	%xmm0, 176(%rcx)
	movaps	%xmm0, 160(%rcx)
	movaps	%xmm0, 144(%rcx)
	movaps	%xmm0, 128(%rcx)
	movaps	%xmm0, 112(%rcx)
	movaps	%xmm0, 96(%rcx)
	movaps	%xmm0, 80(%rcx)
	movaps	%xmm0, 64(%rcx)
	movaps	%xmm0, 48(%rcx)
	movaps	%xmm0, 32(%rcx)
	movaps	%xmm0, 16(%rcx)
	movaps	%xmm0, (%rcx)
	incq	%rdx
	addq	$1600, %rcx             # imm = 0x640
	cmpq	%rax, %rdx
	jle	.LBB1_2
# BB#3:                                 #   in Loop: Header=BB1_1 Depth=1
	movq	%r10, %rdx
	.p2align	4, 0x90
.LBB1_4:                                # %polly.loop_header61.1
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movaps	%xmm0, 240(%rdx)
	movaps	%xmm0, 224(%rdx)
	movaps	%xmm0, 208(%rdx)
	movaps	%xmm0, 192(%rdx)
	movaps	%xmm0, 176(%rdx)
	movaps	%xmm0, 160(%rdx)
	movaps	%xmm0, 144(%rdx)
	movaps	%xmm0, 128(%rdx)
	movaps	%xmm0, 112(%rdx)
	movaps	%xmm0, 96(%rdx)
	movaps	%xmm0, 80(%rdx)
	movaps	%xmm0, 64(%rdx)
	movaps	%xmm0, 48(%rdx)
	movaps	%xmm0, 32(%rdx)
	movaps	%xmm0, 16(%rdx)
	movaps	%xmm0, (%rdx)
	incq	%rbp
	addq	$1600, %rdx             # imm = 0x640
	movq	$-1, %rcx
	cmpq	%rax, %rbp
	jle	.LBB1_4
# BB#5:                                 #   in Loop: Header=BB1_1 Depth=1
	movq	%r11, %rdx
	movq	$-1, %rbp
	.p2align	4, 0x90
.LBB1_6:                                # %polly.loop_header61.2
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movaps	%xmm0, 240(%rdx)
	movaps	%xmm0, 224(%rdx)
	movaps	%xmm0, 208(%rdx)
	movaps	%xmm0, 192(%rdx)
	movaps	%xmm0, 176(%rdx)
	movaps	%xmm0, 160(%rdx)
	movaps	%xmm0, 144(%rdx)
	movaps	%xmm0, 128(%rdx)
	movaps	%xmm0, 112(%rdx)
	movaps	%xmm0, 96(%rdx)
	movaps	%xmm0, 80(%rdx)
	movaps	%xmm0, 64(%rdx)
	movaps	%xmm0, 48(%rdx)
	movaps	%xmm0, 32(%rdx)
	movaps	%xmm0, 16(%rdx)
	movaps	%xmm0, (%rdx)
	incq	%rbp
	addq	$1600, %rdx             # imm = 0x640
	cmpq	%rax, %rbp
	jle	.LBB1_6
# BB#7:                                 #   in Loop: Header=BB1_1 Depth=1
	movq	%r15, %rdx
	.p2align	4, 0x90
.LBB1_8:                                # %polly.loop_header61.3
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movaps	%xmm0, 240(%rdx)
	movaps	%xmm0, 224(%rdx)
	movaps	%xmm0, 208(%rdx)
	movaps	%xmm0, 192(%rdx)
	movaps	%xmm0, 176(%rdx)
	movaps	%xmm0, 160(%rdx)
	movaps	%xmm0, 144(%rdx)
	movaps	%xmm0, 128(%rdx)
	movaps	%xmm0, 112(%rdx)
	movaps	%xmm0, 96(%rdx)
	movaps	%xmm0, 80(%rdx)
	movaps	%xmm0, 64(%rdx)
	movaps	%xmm0, 48(%rdx)
	movaps	%xmm0, 32(%rdx)
	movaps	%xmm0, 16(%rdx)
	movaps	%xmm0, (%rdx)
	incq	%rcx
	addq	$1600, %rdx             # imm = 0x640
	movq	$-1, %rbp
	cmpq	%rax, %rcx
	jle	.LBB1_8
# BB#9:                                 #   in Loop: Header=BB1_1 Depth=1
	movq	%r8, %rcx
	movq	$-1, %rdx
	.p2align	4, 0x90
.LBB1_10:                               # %polly.loop_header61.4
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movaps	%xmm0, 240(%rcx)
	movaps	%xmm0, 224(%rcx)
	movaps	%xmm0, 208(%rcx)
	movaps	%xmm0, 192(%rcx)
	movaps	%xmm0, 176(%rcx)
	movaps	%xmm0, 160(%rcx)
	movaps	%xmm0, 144(%rcx)
	movaps	%xmm0, 128(%rcx)
	movaps	%xmm0, 112(%rcx)
	movaps	%xmm0, 96(%rcx)
	movaps	%xmm0, 80(%rcx)
	movaps	%xmm0, 64(%rcx)
	movaps	%xmm0, 48(%rcx)
	movaps	%xmm0, 32(%rcx)
	movaps	%xmm0, 16(%rcx)
	movaps	%xmm0, (%rcx)
	incq	%rdx
	addq	$1600, %rcx             # imm = 0x640
	cmpq	%rax, %rdx
	jle	.LBB1_10
# BB#11:                                #   in Loop: Header=BB1_1 Depth=1
	movq	%r12, %rcx
	.p2align	4, 0x90
.LBB1_12:                               # %polly.loop_header61.5
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movaps	%xmm0, 240(%rcx)
	movaps	%xmm0, 224(%rcx)
	movaps	%xmm0, 208(%rcx)
	movaps	%xmm0, 192(%rcx)
	movaps	%xmm0, 176(%rcx)
	movaps	%xmm0, 160(%rcx)
	movaps	%xmm0, 144(%rcx)
	movaps	%xmm0, 128(%rcx)
	movaps	%xmm0, 112(%rcx)
	movaps	%xmm0, 96(%rcx)
	movaps	%xmm0, 80(%rcx)
	movaps	%xmm0, 64(%rcx)
	movaps	%xmm0, 48(%rcx)
	movaps	%xmm0, 32(%rcx)
	movaps	%xmm0, 16(%rcx)
	movaps	%xmm0, (%rcx)
	incq	%rbp
	addq	$1600, %rcx             # imm = 0x640
	movq	$-1, %rdx
	cmpq	%rax, %rbp
	jle	.LBB1_12
# BB#13:                                #   in Loop: Header=BB1_1 Depth=1
	movq	%rdi, %rcx
	.p2align	4, 0x90
.LBB1_14:                               # %polly.loop_header61.6
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movaps	%xmm0, 48(%rcx)
	movaps	%xmm0, 32(%rcx)
	movaps	%xmm0, 16(%rcx)
	movaps	%xmm0, (%rcx)
	incq	%rdx
	addq	$1600, %rcx             # imm = 0x640
	cmpq	%rax, %rdx
	jle	.LBB1_14
# BB#15:                                # %polly.loop_exit63.6
                                        #   in Loop: Header=BB1_1 Depth=1
	incq	%rbx
	addq	$51200, %r9             # imm = 0xC800
	addq	$51200, %r10            # imm = 0xC800
	addq	$51200, %r11            # imm = 0xC800
	addq	$51200, %r15            # imm = 0xC800
	addq	$51200, %r8             # imm = 0xC800
	addq	$51200, %r12            # imm = 0xC800
	addq	$51200, %rdi            # imm = 0xC800
	cmpq	$7, %rbx
	jne	.LBB1_1
	.p2align	4, 0x90
.LBB1_16:                               # %polly.loop_header80
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_17 Depth 2
                                        #       Child Loop BB1_18 Depth 3
                                        #         Child Loop BB1_25 Depth 4
                                        #           Child Loop BB1_26 Depth 5
                                        #             Child Loop BB1_27 Depth 6
	movq	%rsi, -64(%rsp)         # 8-byte Spill
	shlq	$5, %rsi
	movq	%rsi, -16(%rsp)         # 8-byte Spill
	movl	$199, %ecx
	subq	%rsi, %rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovgq	%rax, %rcx
	decq	%rcx
	movq	%rcx, -24(%rsp)         # 8-byte Spill
	movl	$B, %edx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_17:                               # %polly.loop_header86
                                        #   Parent Loop BB1_16 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_18 Depth 3
                                        #         Child Loop BB1_25 Depth 4
                                        #           Child Loop BB1_26 Depth 5
                                        #             Child Loop BB1_27 Depth 6
	movq	%rax, -56(%rsp)         # 8-byte Spill
	movq	%rdx, -48(%rsp)         # 8-byte Spill
	shlq	$5, %rax
	movl	$199, %ecx
	subq	%rax, %rcx
	cmpq	$31, %rcx
	movl	$31, %ebx
	cmovleq	%rcx, %rbx
	decq	%rbx
	movq	-80(%rsp), %r15         # 8-byte Reload
	movq	%rdx, -72(%rsp)         # 8-byte Spill
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_18:                               # %polly.loop_header92
                                        #   Parent Loop BB1_16 Depth=1
                                        #     Parent Loop BB1_17 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_25 Depth 4
                                        #           Child Loop BB1_26 Depth 5
                                        #             Child Loop BB1_27 Depth 6
	movq	%rcx, -40(%rsp)         # 8-byte Spill
	movq	%r15, -32(%rsp)         # 8-byte Spill
	leaq	(,%rcx,8), %rsi
	movl	$49, %ecx
	subq	%rsi, %rcx
	cmpq	$7, %rcx
	movl	$7, %edx
	cmovgq	%rdx, %rcx
	decq	%rcx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB1_25:                               # %polly.loop_header98
                                        #   Parent Loop BB1_16 Depth=1
                                        #     Parent Loop BB1_17 Depth=2
                                        #       Parent Loop BB1_18 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB1_26 Depth 5
                                        #             Child Loop BB1_27 Depth 6
	movq	%rsi, -8(%rsp)          # 8-byte Spill
	movq	-16(%rsp), %rdx         # 8-byte Reload
	leaq	(%rsi,%rdx), %r8
	movq	-72(%rsp), %r13         # 8-byte Reload
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB1_26:                               # %polly.loop_header105
                                        #   Parent Loop BB1_16 Depth=1
                                        #     Parent Loop BB1_17 Depth=2
                                        #       Parent Loop BB1_18 Depth=3
                                        #         Parent Loop BB1_25 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB1_27 Depth 6
	leaq	(%r10,%rax), %rsi
	imulq	$1600, %r8, %rbp        # imm = 0x640
	leaq	C(%rbp,%rsi,8), %r11
	movq	C(%rbp,%rsi,8), %rsi
	movq	$-1, %r14
	movq	%r15, %rbp
	movq	%r13, %r12
	.p2align	4, 0x90
.LBB1_27:                               # %polly.loop_header112
                                        #   Parent Loop BB1_16 Depth=1
                                        #     Parent Loop BB1_17 Depth=2
                                        #       Parent Loop BB1_18 Depth=3
                                        #         Parent Loop BB1_25 Depth=4
                                        #           Parent Loop BB1_26 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
.Ltmp25:
	.loc	1 41 37 prologue_end    # MatrixMult.c:41:37
	movslq	(%r12), %rdi
	movslq	-12(%rbp), %rdx
	.loc	1 41 45 is_stmt 0       # MatrixMult.c:41:45
	imulq	%rdi, %rdx
	.loc	1 41 35                 # MatrixMult.c:41:35
	addq	%rsi, %rdx
	.loc	1 41 37                 # MatrixMult.c:41:37
	movslq	800(%r12), %rsi
	movslq	-8(%rbp), %rdi
	.loc	1 41 45                 # MatrixMult.c:41:45
	imulq	%rsi, %rdi
	.loc	1 41 35                 # MatrixMult.c:41:35
	addq	%rdx, %rdi
	.loc	1 41 37                 # MatrixMult.c:41:37
	movslq	1600(%r12), %rdx
	movslq	-4(%rbp), %r9
	.loc	1 41 45                 # MatrixMult.c:41:45
	imulq	%rdx, %r9
	.loc	1 41 35                 # MatrixMult.c:41:35
	addq	%rdi, %r9
	.loc	1 41 37                 # MatrixMult.c:41:37
	movslq	2400(%r12), %rdx
	movslq	(%rbp), %rsi
	.loc	1 41 45                 # MatrixMult.c:41:45
	imulq	%rdx, %rsi
	.loc	1 41 35                 # MatrixMult.c:41:35
	addq	%r9, %rsi
	incq	%r14
	addq	$3200, %r12             # imm = 0xC80
	addq	$16, %rbp
	cmpq	%rcx, %r14
	jle	.LBB1_27
.Ltmp26:
# BB#23:                                # %polly.loop_exit114
                                        #   in Loop: Header=BB1_26 Depth=5
	movq	%rsi, (%r11)
	addq	$4, %r13
	cmpq	%rbx, %r10
	leaq	1(%r10), %r10
	jle	.LBB1_26
# BB#24:                                # %polly.loop_exit107
                                        #   in Loop: Header=BB1_25 Depth=4
	addq	$800, %r15              # imm = 0x320
	movq	-8(%rsp), %rsi          # 8-byte Reload
	cmpq	-24(%rsp), %rsi         # 8-byte Folded Reload
	leaq	1(%rsi), %rsi
	jle	.LBB1_25
# BB#21:                                # %polly.loop_exit100
                                        #   in Loop: Header=BB1_18 Depth=3
	movq	-40(%rsp), %rcx         # 8-byte Reload
	incq	%rcx
	addq	$25600, -72(%rsp)       # 8-byte Folded Spill
                                        # imm = 0x6400
	movq	-32(%rsp), %r15         # 8-byte Reload
	subq	$-128, %r15
	cmpq	$7, %rcx
	jne	.LBB1_18
# BB#22:                                # %polly.loop_exit94
                                        #   in Loop: Header=BB1_17 Depth=2
	movq	-56(%rsp), %rax         # 8-byte Reload
	incq	%rax
	movq	-48(%rsp), %rdx         # 8-byte Reload
	subq	$-128, %rdx
	cmpq	$7, %rax
	jne	.LBB1_17
# BB#19:                                # %polly.loop_exit88
                                        #   in Loop: Header=BB1_16 Depth=1
	movq	-64(%rsp), %rsi         # 8-byte Reload
	incq	%rsi
	addq	$25600, -80(%rsp)       # 8-byte Folded Spill
                                        # imm = 0x6400
	cmpq	$7, %rsi
	jne	.LBB1_16
# BB#20:                                # %polly.exiting
	.loc	1 44 1 is_stmt 1        # MatrixMult.c:44:1
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp27:
.Lfunc_end1:
	.size	mat_mult, .Lfunc_end1-mat_mult
	.cfi_endproc

	.globl	print_array
	.p2align	4, 0x90
	.type	print_array,@function
print_array:                            # @print_array
.Lfunc_begin2:
	.loc	1 47 0                  # MatrixMult.c:47:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp28:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp29:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp30:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp31:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp32:
	.cfi_def_cfa_offset 48
.Ltmp33:
	.cfi_offset %rbx, -40
.Ltmp34:
	.cfi_offset %r12, -32
.Ltmp35:
	.cfi_offset %r14, -24
.Ltmp36:
	.cfi_offset %r15, -16
	movl	$C, %r14d
.Ltmp37:
	#DEBUG_VALUE: print_array:i <- 0
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB2_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
.Ltmp38:
	.loc	1 52 21 prologue_end    # MatrixMult.c:52:21
	movq	stdout(%rip), %rcx
	movq	%r14, %r12
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB2_2:                                # %for.body3
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 52 38 is_stmt 0       # MatrixMult.c:52:38
	movq	(%r12), %rdx
	.loc	1 52 13                 # MatrixMult.c:52:13
	movl	$.L.str, %esi
	xorl	%eax, %eax
	movq	%rcx, %rdi
	callq	fprintf
.Ltmp39:
	.loc	1 53 18 is_stmt 1       # MatrixMult.c:53:18
	movslq	%ebx, %rax
	imulq	$1717986919, %rax, %rcx # imm = 0x66666667
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	shll	$4, %ecx
	leal	(%rcx,%rcx,4), %ecx
	subl	%ecx, %eax
.Ltmp40:
	.loc	1 53 17 is_stmt 0       # MatrixMult.c:53:17
	cmpl	$79, %eax
	jne	.LBB2_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB2_2 Depth=2
.Ltmp41:
	.loc	1 53 37 discriminator 1 # MatrixMult.c:53:37
	movq	stdout(%rip), %rsi
	.loc	1 53 29 discriminator 1 # MatrixMult.c:53:29
	movl	$10, %edi
	callq	fputc
.Ltmp42:
.LBB2_4:                                # %for.inc
                                        #   in Loop: Header=BB2_2 Depth=2
	.loc	1 51 9 is_stmt 1 discriminator 1 # MatrixMult.c:51:9
	incq	%rbx
.Ltmp43:
	.loc	1 52 21                 # MatrixMult.c:52:21
	movq	stdout(%rip), %rcx
.Ltmp44:
	.loc	1 51 9 discriminator 1  # MatrixMult.c:51:9
	addq	$8, %r12
	cmpq	$200, %rbx
	jne	.LBB2_2
.Ltmp45:
# BB#5:                                 # %for.end
                                        #   in Loop: Header=BB2_1 Depth=1
	.loc	1 55 9                  # MatrixMult.c:55:9
	movl	$10, %edi
	movq	%rcx, %rsi
	callq	fputc
.Ltmp46:
	.loc	1 50 5 discriminator 1  # MatrixMult.c:50:5
	incq	%r15
	addq	$1600, %r14             # imm = 0x640
	cmpq	$200, %r15
	jne	.LBB2_1
.Ltmp47:
# BB#6:                                 # %for.end11
	.loc	1 57 1                  # MatrixMult.c:57:1
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Ltmp48:
.Lfunc_end2:
	.size	print_array, .Lfunc_end2-print_array
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin3:
	.loc	1 60 0                  # MatrixMult.c:60:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 61 5 prologue_end     # MatrixMult.c:61:5
	subq	$40, %rsp
.Ltmp49:
	.cfi_def_cfa_offset 48
	callq	init
	.loc	1 62 5                  # MatrixMult.c:62:5
	callq	mat_mult
	.loc	1 64 5                  # MatrixMult.c:64:5
	movl	$.L.str.2, %edi
	movl	$200, %esi
	movl	$200, %edx
	xorl	%eax, %eax
	callq	printf
	.loc	1 66 19                 # MatrixMult.c:66:19
	movl	A+159996(%rip), %ecx
	.loc	1 67 19                 # MatrixMult.c:67:19
	movl	B+159996(%rip), %eax
	.loc	1 68 19                 # MatrixMult.c:68:19
	movq	C+319992(%rip), %rdx
	.loc	1 65 5                  # MatrixMult.c:65:5
	movq	%rdx, 24(%rsp)
	movl	%eax, (%rsp)
	movl	$199, 16(%rsp)
	movl	$199, 8(%rsp)
	movl	$.L.str.3, %edi
	movl	$199, %esi
	movl	$199, %edx
	movl	$199, %r8d
	movl	$199, %r9d
	xorl	%eax, %eax
	callq	printf
	.loc	1 69 5                  # MatrixMult.c:69:5
	xorl	%eax, %eax
	addq	$40, %rsp
	retq
.Ltmp50:
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc

	.type	A,@object               # @A
	.comm	A,160000,16
	.type	B,@object               # @B
	.comm	B,160000,16
	.type	C,@object               # @C
	.comm	C,320000,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%lld "
	.size	.L.str, 6

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"Pass %d X %d matrix test case \n"
	.size	.L.str.2, 32

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"A[%d][%d] = %d, B[%d][%d] =%d, C[%d][%d] =%lld \n"
	.size	.L.str.3, 49

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)" # string offset=0
.Linfo_string1:
	.asciz	"MatrixMult.c"          # string offset=165
.Linfo_string2:
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten" # string offset=178
.Linfo_string3:
	.asciz	"A"                     # string offset=245
.Linfo_string4:
	.asciz	"int"                   # string offset=247
.Linfo_string5:
	.asciz	"sizetype"              # string offset=251
.Linfo_string6:
	.asciz	"B"                     # string offset=260
.Linfo_string7:
	.asciz	"C"                     # string offset=262
.Linfo_string8:
	.asciz	"long long int"         # string offset=264
.Linfo_string9:
	.asciz	"init"                  # string offset=278
.Linfo_string10:
	.asciz	"mat_mult"              # string offset=283
.Linfo_string11:
	.asciz	"print_array"           # string offset=292
.Linfo_string12:
	.asciz	"main"                  # string offset=304
.Linfo_string13:
	.asciz	"i"                     # string offset=309
.Linfo_string14:
	.asciz	"j"                     # string offset=311
.Linfo_string15:
	.asciz	"k"                     # string offset=313
	.section	.debug_loc,"",@progbits
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
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	3                       # Abbreviation Code
	.byte	1                       # DW_TAG_array_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	4                       # Abbreviation Code
	.byte	33                      # DW_TAG_subrange_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	55                      # DW_AT_count
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	5                       # Abbreviation Code
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
	.byte	6                       # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
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
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
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
	.byte	10                      # Abbreviation Code
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
	.byte	11                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	0                       # DW_CHILDREN_no
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
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	358                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x15f DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x15 DW_TAG_variable
	.long	.Linfo_string3          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	A
	.byte	3                       # Abbrev [3] 0x3f:0x12 DW_TAG_array_type
	.long	81                      # DW_AT_type
	.byte	4                       # Abbrev [4] 0x44:0x6 DW_TAG_subrange_type
	.long	88                      # DW_AT_type
	.byte	200                     # DW_AT_count
	.byte	4                       # Abbrev [4] 0x4a:0x6 DW_TAG_subrange_type
	.long	88                      # DW_AT_type
	.byte	200                     # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x51:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	6                       # Abbrev [6] 0x58:0x7 DW_TAG_base_type
	.long	.Linfo_string5          # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	2                       # Abbrev [2] 0x5f:0x15 DW_TAG_variable
	.long	.Linfo_string6          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	B
	.byte	2                       # Abbrev [2] 0x74:0x15 DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.long	137                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	C
	.byte	3                       # Abbrev [3] 0x89:0x12 DW_TAG_array_type
	.long	155                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x8e:0x6 DW_TAG_subrange_type
	.long	88                      # DW_AT_type
	.byte	200                     # DW_AT_count
	.byte	4                       # Abbrev [4] 0x94:0x6 DW_TAG_subrange_type
	.long	88                      # DW_AT_type
	.byte	200                     # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x9b:0x7 DW_TAG_base_type
	.long	.Linfo_string8          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # Abbrev [7] 0xa2:0x49 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0xb7:0x33 DW_TAG_lexical_block
	.quad	.Ltmp9                  # DW_AT_low_pc
	.long	.Ltmp10-.Ltmp9          # DW_AT_high_pc
	.byte	9                       # Abbrev [9] 0xc4:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	25                      # DW_AT_decl_line
	.long	81                      # DW_AT_type
	.byte	8                       # Abbrev [8] 0xd0:0x19 DW_TAG_lexical_block
	.quad	.Ltmp9                  # DW_AT_low_pc
	.long	.Ltmp10-.Ltmp9          # DW_AT_high_pc
	.byte	10                      # Abbrev [10] 0xdd:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	81                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0xeb:0x38 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	9                       # Abbrev [9] 0x100:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	81                      # DW_AT_type
	.byte	10                      # Abbrev [10] 0x10c:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	81                      # DW_AT_type
	.byte	10                      # Abbrev [10] 0x117:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	81                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x123:0x2d DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	46                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	9                       # Abbrev [9] 0x138:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	48                      # DW_AT_decl_line
	.long	81                      # DW_AT_type
	.byte	10                      # Abbrev [10] 0x144:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	48                      # DW_AT_decl_line
	.long	81                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	11                      # Abbrev [11] 0x150:0x19 DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	81                      # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
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
	.long	362                     # Compilation Unit Length
	.long	42                      # DIE offset
	.asciz	"A"                     # External Name
	.long	95                      # DIE offset
	.asciz	"B"                     # External Name
	.long	116                     # DIE offset
	.asciz	"C"                     # External Name
	.long	162                     # DIE offset
	.asciz	"init"                  # External Name
	.long	336                     # DIE offset
	.asciz	"main"                  # External Name
	.long	235                     # DIE offset
	.asciz	"mat_mult"              # External Name
	.long	291                     # DIE offset
	.asciz	"print_array"           # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	362                     # Compilation Unit Length
	.long	81                      # DIE offset
	.asciz	"int"                   # External Name
	.long	155                     # DIE offset
	.asciz	"long long int"         # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
