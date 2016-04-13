	.text
	.file	"llvm/GCD.openmp.enablevc.ll"
	.globl	gcd
	.p2align	4, 0x90
	.type	gcd,@function
gcd:                                    # @gcd
.Lfunc_begin0:
	.file	1 "GCD.c"
	.loc	1 2 0                   # GCD.c:2:0
	.cfi_startproc
# BB#0:                                 # %entry
	#DEBUG_VALUE: gcd:a <- %RDI
	#DEBUG_VALUE: gcd:b <- %RSI
	#DEBUG_VALUE: gcd:_2 <- 0
	#DEBUG_VALUE: gcd:_3 <- 0
	#DEBUG_VALUE: gcd:_4 <- 0
	#DEBUG_VALUE: gcd:_5 <- 0
	#DEBUG_VALUE: gcd:_6 <- 0
	#DEBUG_VALUE: gcd:_7 <- 0
	.loc	1 12 6 prologue_end     # GCD.c:12:6
	testq	%rdi, %rdi
	je	.LBB0_1
.Ltmp0:
# BB#2:                                 # %while.cond.preheader
	#DEBUG_VALUE: gcd:b <- %RSI
	#DEBUG_VALUE: gcd:a <- %RDI
	#DEBUG_VALUE: gcd:_4 <- 0
	js	.LBB0_6
.Ltmp1:
# BB#3:                                 # %blklab4.lr.ph.preheader
	#DEBUG_VALUE: gcd:a <- %RDI
	#DEBUG_VALUE: gcd:b <- %RSI
	.loc	1 35 7                  # GCD.c:35:7
	testq	%rsi, %rsi
	je	.LBB0_8
.Ltmp2:
	.p2align	4, 0x90
.LBB0_4:                                # %blklab4
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: gcd:_5 <- 0
	.loc	1 37 6                  # GCD.c:37:6
	movq	%rdi, %rax
	subq	%rsi, %rax
	jle	.LBB0_7
# BB#5:                                 # %if.end9
                                        #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: gcd:_4 <- 0
	movq	%rax, %rdi
	jns	.LBB0_4
	jmp	.LBB0_6
.LBB0_7:                                # %blklab5
                                        #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: gcd:_4 <- 0
	.loc	1 35 6                  # GCD.c:35:6
	subq	%rdi, %rsi
	jne	.LBB0_4
.Ltmp3:
.LBB0_8:                                # %cleanup
	.loc	1 60 1                  # GCD.c:60:1
	movq	%rdi, %rax
	retq
.LBB0_1:
.Ltmp4:
	#DEBUG_VALUE: gcd:b <- %RSI
	#DEBUG_VALUE: gcd:a <- %RDI
	movq	%rsi, %rdi
.Ltmp5:
	movq	%rdi, %rax
	retq
.Ltmp6:
.LBB0_6:                                # %if.end3
	.loc	1 26 12                 # GCD.c:26:12
	pushq	%rax
.Ltmp7:
	.cfi_def_cfa_offset 16
	movq	stderr(%rip), %rcx
	.loc	1 26 4 is_stmt 0        # GCD.c:26:4
	movl	$.L.str, %edi
	movl	$4, %esi
	movl	$1, %edx
	callq	fwrite
	.loc	1 27 4 is_stmt 1        # GCD.c:27:4
	movl	$-1, %edi
	callq	exit
.Ltmp8:
.Lfunc_end0:
	.size	gcd, .Lfunc_end0-gcd
	.cfi_endproc

	.globl	gcd_array
	.p2align	4, 0x90
	.type	gcd_array,@function
gcd_array:                              # @gcd_array
.Lfunc_begin1:
	.loc	1 62 0                  # GCD.c:62:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp9:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp10:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp11:
	.cfi_def_cfa_offset 32
.Ltmp12:
	.cfi_offset %rbx, -32
.Ltmp13:
	.cfi_offset %r14, -24
.Ltmp14:
	.cfi_offset %r15, -16
	#DEBUG_VALUE: gcd_array:data <- %RDI
	#DEBUG_VALUE: gcd_array:data_size <- %RSI
	#DEBUG_VALUE: gcd_array:n <- %RDX
	movq	%rdx, %r14
.Ltmp15:
	#DEBUG_VALUE: gcd_array:n <- %R14
	movq	%rdi, %rbx
.Ltmp16:
	#DEBUG_VALUE: gcd_array:_35 <- 0
	#DEBUG_VALUE: gcd_array:_34 <- 0
	#DEBUG_VALUE: gcd_array:_33 <- 0
	#DEBUG_VALUE: gcd_array:_32 <- 0
	#DEBUG_VALUE: gcd_array:_31 <- 0
	#DEBUG_VALUE: gcd_array:_30 <- 0
	#DEBUG_VALUE: gcd_array:_29 <- 0
	#DEBUG_VALUE: gcd_array:_28 <- 0
	#DEBUG_VALUE: gcd_array:_27 <- 0
	#DEBUG_VALUE: gcd_array:_26 <- 0
	#DEBUG_VALUE: gcd_array:_25 <- 0
	#DEBUG_VALUE: gcd_array:_24 <- 0
	#DEBUG_VALUE: gcd_array:_23 <- 0
	#DEBUG_VALUE: gcd_array:_22 <- 0
	#DEBUG_VALUE: gcd_array:_21 <- 0
	#DEBUG_VALUE: gcd_array:_20 <- 0
	#DEBUG_VALUE: gcd_array:_19 <- 0
	#DEBUG_VALUE: gcd_array:_18 <- 0
	#DEBUG_VALUE: gcd_array:_17 <- 0
	#DEBUG_VALUE: gcd_array:_16 <- 0
	#DEBUG_VALUE: gcd_array:_15 <- 0
	#DEBUG_VALUE: gcd_array:_14 <- 0
	#DEBUG_VALUE: gcd_array:_13 <- 0
	#DEBUG_VALUE: gcd_array:_12 <- 0
	#DEBUG_VALUE: gcd_array:_11 <- 0
	#DEBUG_VALUE: gcd_array:_10_size <- 0
	#DEBUG_VALUE: gcd_array:_9 <- 0
	#DEBUG_VALUE: gcd_array:_8 <- 0
	#DEBUG_VALUE: gcd_array:b <- 0
	#DEBUG_VALUE: gcd_array:a <- 0
	#DEBUG_VALUE: gcd_array:j <- 0
	#DEBUG_VALUE: gcd_array:i <- 0
	#DEBUG_VALUE: gcd_array:gcds_size <- 0
	#DEBUG_VALUE: gcd_array:_2_size <- 0
	#DEBUG_VALUE: gcd_array:data <- %RBX
	.loc	1 100 6 prologue_end    # GCD.c:100:6
	movl	%r14d, %esi
.Ltmp17:
	imull	%esi, %esi
	xorl	%r15d, %r15d
	.loc	1 102 2                 # GCD.c:102:2
	xorl	%edi, %edi
	callq	gen1DArray
.Ltmp18:
	#DEBUG_VALUE: gcd_array:gcds <- %RAX
	#DEBUG_VALUE: gcd_array:_10 <- %RAX
	.loc	1 112 6                 # GCD.c:112:6
	testq	%r14, %r14
	jle	.LBB1_11
.Ltmp19:
	.p2align	4, 0x90
.LBB1_1:                                # %while.cond3.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
                                        #       Child Loop BB1_5 Depth 3
	.loc	1 134 9                 # GCD.c:134:9
	movq	%r15, %r8
	imulq	%r14, %r8
.Ltmp20:
	#DEBUG_VALUE: gcd_array:_30 <- %R8
	#DEBUG_VALUE: gcd_array:_26 <- %R8
	#DEBUG_VALUE: gcd_array:_20 <- %R8
	#DEBUG_VALUE: gcd_array:_16 <- %R8
	xorl	%edx, %edx
.Ltmp21:
	.p2align	4, 0x90
.LBB1_2:                                # %if.end8.us
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_5 Depth 3
	.loc	1 122 8                 # GCD.c:122:8
	movq	(%rbx,%r15,8), %rcx
.Ltmp22:
	#DEBUG_VALUE: gcd_array:_13 <- %RCX
	#DEBUG_VALUE: gcd_array:a <- %RCX
	.loc	1 126 8                 # GCD.c:126:8
	movq	(%rbx,%rdx,8), %rdi
	#DEBUG_VALUE: gcd_array:_15 <- 0
.Ltmp23:
	#DEBUG_VALUE: gcd_array:_14 <- %RDI
	#DEBUG_VALUE: gcd_array:b <- %RDI
	.loc	1 132 8                 # GCD.c:132:8
	testq	%rcx, %rcx
.Ltmp24:
	.loc	1 132 7 is_stmt 0       # GCD.c:132:7
	je	.LBB1_8
.Ltmp25:
# BB#3:                                 # %while.cond20.preheader.us
                                        #   in Loop: Header=BB1_2 Depth=2
	#DEBUG_VALUE: gcd_array:b <- %RDI
	#DEBUG_VALUE: gcd_array:_14 <- %RDI
	#DEBUG_VALUE: gcd_array:a <- %RCX
	#DEBUG_VALUE: gcd_array:_13 <- %RCX
	#DEBUG_VALUE: gcd_array:_22 <- 0
	js	.LBB1_7
.Ltmp26:
# BB#4:                                 # %blklab15.lr.ph.us.preheader
                                        #   in Loop: Header=BB1_2 Depth=2
	#DEBUG_VALUE: gcd_array:_13 <- %RCX
	#DEBUG_VALUE: gcd_array:a <- %RCX
	#DEBUG_VALUE: gcd_array:_14 <- %RDI
	#DEBUG_VALUE: gcd_array:b <- %RDI
	.loc	1 169 9 is_stmt 1       # GCD.c:169:9
	testq	%rdi, %rdi
	je	.LBB1_13
.Ltmp27:
	.p2align	4, 0x90
.LBB1_5:                                # %blklab15.us134
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	#DEBUG_VALUE: gcd_array:_23 <- 0
	.loc	1 171 8                 # GCD.c:171:8
	movq	%rcx, %rsi
	subq	%rdi, %rsi
	jle	.LBB1_12
# BB#6:                                 # %if.end34.us138
                                        #   in Loop: Header=BB1_5 Depth=3
	#DEBUG_VALUE: gcd_array:_22 <- 0
	movq	%rsi, %rcx
	jns	.LBB1_5
	jmp	.LBB1_7
.LBB1_12:                               # %blklab16.us-lcssa.us144
                                        #   in Loop: Header=BB1_5 Depth=3
	#DEBUG_VALUE: gcd_array:_22 <- 0
	.loc	1 169 8                 # GCD.c:169:8
	subq	%rcx, %rdi
	jne	.LBB1_5
.Ltmp28:
.LBB1_13:                               # %blklab13.us-lcssa.us.us
                                        #   in Loop: Header=BB1_2 Depth=2
	#DEBUG_VALUE: gcd_array:_23 <- 0
	.loc	1 194 11                # GCD.c:194:11
	leaq	(%rdx,%r8), %rsi
.Ltmp29:
	#DEBUG_VALUE: gcd_array:_31 <- %RSI
	#DEBUG_VALUE: gcd_array:_27 <- %RSI
	.loc	1 204 14                # GCD.c:204:14
	addq	%rcx, (%rax,%rsi,8)
	jmp	.LBB1_9
.Ltmp30:
	.p2align	4, 0x90
.LBB1_8:                                # %if.end13.us
                                        #   in Loop: Header=BB1_2 Depth=2
	#DEBUG_VALUE: gcd_array:b <- %RDI
	#DEBUG_VALUE: gcd_array:_14 <- %RDI
	#DEBUG_VALUE: gcd_array:a <- %RCX
	#DEBUG_VALUE: gcd_array:_13 <- %RCX
	.loc	1 136 11                # GCD.c:136:11
	leaq	(%rdx,%r8), %rcx
.Ltmp31:
	#DEBUG_VALUE: gcd_array:_21 <- %RCX
	#DEBUG_VALUE: gcd_array:_17 <- %RCX
	.loc	1 146 14                # GCD.c:146:14
	addq	%rdi, (%rax,%rcx,8)
.Ltmp32:
.LBB1_9:                                # %blklab12.us
                                        #   in Loop: Header=BB1_2 Depth=2
	#DEBUG_VALUE: gcd_array:_32 <- 1
	.loc	1 210 9                 # GCD.c:210:9
	incq	%rdx
.Ltmp33:
	#DEBUG_VALUE: gcd_array:_33 <- %RDX
	#DEBUG_VALUE: gcd_array:j <- %RDX
	.loc	1 120 8                 # GCD.c:120:8
	cmpq	%r14, %rdx
	jl	.LBB1_2
.Ltmp34:
# BB#10:                                # %blklab9.loopexit.us
                                        #   in Loop: Header=BB1_1 Depth=1
	#DEBUG_VALUE: gcd_array:j <- %RDX
	#DEBUG_VALUE: gcd_array:_33 <- %RDX
	#DEBUG_VALUE: gcd_array:_34 <- 1
	.loc	1 221 8                 # GCD.c:221:8
	incq	%r15
.Ltmp35:
	#DEBUG_VALUE: gcd_array:_35 <- %R15
	#DEBUG_VALUE: gcd_array:i <- %R15
	.loc	1 112 7                 # GCD.c:112:7
	cmpq	%r14, %r15
	jl	.LBB1_1
.Ltmp36:
.LBB1_11:                               # %blklab7
	.loc	1 230 2                 # GCD.c:230:2
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.LBB1_7:                                # %if.end25
.Ltmp37:
	.loc	1 160 14                # GCD.c:160:14
	movq	stderr(%rip), %rcx
	.loc	1 160 6 is_stmt 0       # GCD.c:160:6
	movl	$.L.str, %edi
	movl	$4, %esi
	movl	$1, %edx
	callq	fwrite
	.loc	1 161 6 is_stmt 1       # GCD.c:161:6
	movl	$-1, %edi
	callq	exit
.Ltmp38:
.Lfunc_end1:
	.size	gcd_array, .Lfunc_end1-gcd_array
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI2_0:
	.quad	2                       # 0x2
	.quad	3                       # 0x3
	.text
	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
.Lfunc_begin2:
	.loc	1 234 0                 # GCD.c:234:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp39:
	.cfi_def_cfa_offset 16
.Ltmp40:
	.cfi_offset %rbx, -16
	#DEBUG_VALUE: init:n <- %RDI
.Ltmp41:
	#DEBUG_VALUE: init:_5_size <- %RDI
	#DEBUG_VALUE: init:data_size <- %RDI
	movq	%rdi, %rbx
.Ltmp42:
	#DEBUG_VALUE: init:_10 <- 0
	#DEBUG_VALUE: init:_9 <- 0
	#DEBUG_VALUE: init:_8 <- 0
	#DEBUG_VALUE: init:_7 <- 0
	#DEBUG_VALUE: init:_6 <- 0
	#DEBUG_VALUE: init:_4 <- 0
	#DEBUG_VALUE: init:i <- 0
	#DEBUG_VALUE: init:_1_size <- 0
	#DEBUG_VALUE: init:data_size <- 0
	#DEBUG_VALUE: init:_5_size <- 0
	#DEBUG_VALUE: init:n <- %RBX
	.loc	1 248 2 prologue_end    # GCD.c:248:2
	xorl	%edi, %edi
	movl	%ebx, %esi
	callq	gen1DArray
.Ltmp43:
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	.loc	1 258 6                 # GCD.c:258:6
	testq	%rbx, %rbx
	jle	.LBB2_10
.Ltmp44:
# BB#1:                                 # %if.end.preheader
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:n <- %RBX
	xorl	%edx, %edx
	.loc	1 260 6                 # GCD.c:260:6
	cmpq	$4, %rbx
	jb	.LBB2_9
.Ltmp45:
# BB#2:                                 # %min.iters.checked
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	xorl	%edx, %edx
	movq	%rbx, %rcx
	andq	$-4, %rcx
	je	.LBB2_9
.Ltmp46:
# BB#3:                                 # %vector.body.preheader
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:n <- %RBX
	leaq	-4(%rcx), %rdi
	movq	%rdi, %rsi
	shrq	$2, %rsi
	xorl	%edx, %edx
	btq	$2, %rdi
	jb	.LBB2_5
.Ltmp47:
# BB#4:                                 # %vector.body.prol
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	movdqu	(%rax), %xmm0
	movdqu	16(%rax), %xmm1
	.loc	1 262 8                 # GCD.c:262:8
	movl	$1, %edx
	movd	%rdx, %xmm2
	pslldq	$8, %xmm2               # xmm2 = zero,zero,zero,zero,zero,zero,zero,zero,xmm2[0,1,2,3,4,5,6,7]
	paddq	%xmm0, %xmm2
	paddq	.LCPI2_0(%rip), %xmm1
	.loc	1 264 11                # GCD.c:264:11
	movdqu	%xmm2, (%rax)
	movdqu	%xmm1, 16(%rax)
	movl	$4, %edx
.Ltmp48:
.LBB2_5:                                # %vector.body.preheader.split
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	testq	%rsi, %rsi
	je	.LBB2_8
.Ltmp49:
# BB#6:
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:n <- %RBX
	movl	$1, %esi
	movd	%rsi, %xmm0
	pslldq	$8, %xmm0               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7]
	movdqa	.LCPI2_0(%rip), %xmm1   # xmm1 = [2,3]
.Ltmp50:
	.p2align	4, 0x90
.LBB2_7:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movd	%rdx, %xmm2
	pshufd	$68, %xmm2, %xmm2       # xmm2 = xmm2[0,1,0,1]
	.loc	1 260 6                 # GCD.c:260:6
	movdqu	(%rax,%rdx,8), %xmm3
	paddq	%xmm2, %xmm3
	movdqu	16(%rax,%rdx,8), %xmm4
	paddq	%xmm2, %xmm4
	.loc	1 262 8                 # GCD.c:262:8
	paddq	%xmm0, %xmm3
	paddq	%xmm1, %xmm4
	.loc	1 264 11                # GCD.c:264:11
	movdqu	%xmm3, (%rax,%rdx,8)
	movdqu	%xmm4, 16(%rax,%rdx,8)
	.loc	1 260 6                 # GCD.c:260:6
	leaq	4(%rdx), %rsi
	movd	%rsi, %xmm2
	pshufd	$68, %xmm2, %xmm2       # xmm2 = xmm2[0,1,0,1]
	movdqu	32(%rax,%rdx,8), %xmm3
	paddq	%xmm2, %xmm3
	movdqu	48(%rax,%rdx,8), %xmm4
	paddq	%xmm2, %xmm4
	.loc	1 262 8                 # GCD.c:262:8
	paddq	%xmm0, %xmm3
	paddq	%xmm1, %xmm4
	.loc	1 264 11                # GCD.c:264:11
	movdqu	%xmm3, 32(%rax,%rdx,8)
	movdqu	%xmm4, 48(%rax,%rdx,8)
	.loc	1 260 6                 # GCD.c:260:6
	addq	$8, %rdx
	cmpq	%rcx, %rdx
	jne	.LBB2_7
.LBB2_8:                                # %middle.block
	cmpq	%rbx, %rcx
	movq	%rcx, %rdx
	je	.LBB2_10
	.p2align	4, 0x90
.LBB2_9:                                # %if.end
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 264 11                # GCD.c:264:11
	addq	%rdx, (%rax,%rdx,8)
.Ltmp51:
	#DEBUG_VALUE: init:_9 <- 1
	.loc	1 268 8                 # GCD.c:268:8
	incq	%rdx
.Ltmp52:
	#DEBUG_VALUE: init:_10 <- %RDX
	#DEBUG_VALUE: init:i <- %RDX
	.loc	1 258 6                 # GCD.c:258:6
	cmpq	%rdx, %rbx
	jne	.LBB2_9
.Ltmp53:
.LBB2_10:                               # %blklab18
	.loc	1 277 2                 # GCD.c:277:2
	popq	%rbx
	retq
.Ltmp54:
.Lfunc_end2:
	.size	init, .Lfunc_end2-init
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI3_0:
	.quad	2                       # 0x2
	.quad	3                       # 0x3
.LCPI3_1:
	.quad	83                      # 0x53
	.quad	85                      # 0x55
.LCPI3_2:
	.quad	77                      # 0x4d
	.quad	58                      # 0x3a
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin3:
	.loc	1 281 0                 # GCD.c:281:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 310 2 prologue_end    # GCD.c:310:2
	pushq	%rbp
.Ltmp55:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp56:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp57:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp58:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp59:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp60:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Ltmp61:
	.cfi_def_cfa_offset 64
.Ltmp62:
	.cfi_offset %rbx, -56
.Ltmp63:
	.cfi_offset %r12, -48
.Ltmp64:
	.cfi_offset %r13, -40
.Ltmp65:
	.cfi_offset %r14, -32
.Ltmp66:
	.cfi_offset %r15, -24
.Ltmp67:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
.Ltmp68:
	#DEBUG_VALUE: main:n <- 0
	#DEBUG_VALUE: main:data_size <- 0
	#DEBUG_VALUE: main:gcds_size <- 0
	#DEBUG_VALUE: main:sum <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_9_size <- 0
	#DEBUG_VALUE: main:_9_size_size <- 0
	#DEBUG_VALUE: main:_10 <- 0
	#DEBUG_VALUE: main:_11_size <- 0
	#DEBUG_VALUE: main:_12_size <- 0
	#DEBUG_VALUE: main:_13_size <- 0
	#DEBUG_VALUE: main:_14 <- 0
	#DEBUG_VALUE: main:_15 <- 0
	#DEBUG_VALUE: main:_16 <- 0
	#DEBUG_VALUE: main:_17 <- 0
	#DEBUG_VALUE: main:_18 <- 0
	#DEBUG_VALUE: main:_19 <- 0
	#DEBUG_VALUE: main:_20 <- 0
	#DEBUG_VALUE: main:_21 <- 0
	#DEBUG_VALUE: main:_22 <- 0
	#DEBUG_VALUE: main:_23 <- 0
	#DEBUG_VALUE: main:_24 <- 0
	#DEBUG_VALUE: main:_27_size <- 0
	callq	convertArgsToIntArray
.Ltmp69:
	#DEBUG_VALUE: main:_9 <- %RAX
	.loc	1 314 6                 # GCD.c:314:6
	movq	(%rax), %rdi
.Ltmp70:
	#DEBUG_VALUE: main:_11 <- %RDI
	.loc	1 316 2                 # GCD.c:316:2
	callq	parseStringToInt
.Ltmp71:
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_8 <- %RAX
	.loc	1 320 9                 # GCD.c:320:9
	testq	%rax, %rax
	je	.LBB3_26
.Ltmp72:
# BB#1:                                 # %if.end
	#DEBUG_VALUE: main:_8 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	.loc	1 322 6                 # GCD.c:322:6
	movq	(%rax), %r14
.Ltmp73:
	#DEBUG_VALUE: init:_10 <- 0
	#DEBUG_VALUE: init:_9 <- 0
	#DEBUG_VALUE: init:_8 <- 0
	#DEBUG_VALUE: init:_7 <- 0
	#DEBUG_VALUE: init:_6 <- 0
	#DEBUG_VALUE: init:_5_size <- %R14
	#DEBUG_VALUE: init:_4 <- 0
	#DEBUG_VALUE: init:i <- 0
	#DEBUG_VALUE: init:_1_size <- 0
	#DEBUG_VALUE: init:n <- %R14
	#DEBUG_VALUE: init:data_size <- 0
	#DEBUG_VALUE: main:n <- %R14
	.loc	1 248 2                 # GCD.c:248:2
	xorl	%edi, %edi
	movl	%r14d, %esi
	callq	gen1DArray
.Ltmp74:
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: main:_12 <- %RAX
	#DEBUG_VALUE: main:data <- %RAX
	.loc	1 258 6                 # GCD.c:258:6
	testq	%r14, %r14
	jle	.LBB3_27
.Ltmp75:
# BB#2:                                 # %if.end.i.preheader
	#DEBUG_VALUE: main:data <- %RAX
	#DEBUG_VALUE: main:_12 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: main:n <- %R14
	#DEBUG_VALUE: init:n <- %R14
	#DEBUG_VALUE: init:_5_size <- %R14
	xorl	%edx, %edx
	.loc	1 260 6                 # GCD.c:260:6
	cmpq	$4, %r14
	jb	.LBB3_10
.Ltmp76:
# BB#3:                                 # %min.iters.checked
	#DEBUG_VALUE: init:_5_size <- %R14
	#DEBUG_VALUE: init:n <- %R14
	#DEBUG_VALUE: main:n <- %R14
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: main:_12 <- %RAX
	#DEBUG_VALUE: main:data <- %RAX
	xorl	%edx, %edx
	movq	%r14, %rcx
	andq	$-4, %rcx
	je	.LBB3_10
.Ltmp77:
# BB#4:                                 # %vector.body.preheader
	#DEBUG_VALUE: main:data <- %RAX
	#DEBUG_VALUE: main:_12 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: main:n <- %R14
	#DEBUG_VALUE: init:n <- %R14
	#DEBUG_VALUE: init:_5_size <- %R14
	.loc	1 324 8                 # GCD.c:324:8
	leaq	-4(%rcx), %rdi
	movq	%rdi, %rsi
	shrq	$2, %rsi
	xorl	%edx, %edx
	btq	$2, %rdi
	jb	.LBB3_6
.Ltmp78:
# BB#5:                                 # %vector.body.prol
	#DEBUG_VALUE: init:_5_size <- %R14
	#DEBUG_VALUE: init:n <- %R14
	#DEBUG_VALUE: main:n <- %R14
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: main:_12 <- %RAX
	#DEBUG_VALUE: main:data <- %RAX
	.loc	1 260 6                 # GCD.c:260:6
	movdqu	(%rax), %xmm0
	movdqu	16(%rax), %xmm1
	.loc	1 262 8                 # GCD.c:262:8
	movl	$1, %edx
	movd	%rdx, %xmm2
	pslldq	$8, %xmm2               # xmm2 = zero,zero,zero,zero,zero,zero,zero,zero,xmm2[0,1,2,3,4,5,6,7]
	paddq	%xmm0, %xmm2
	paddq	.LCPI3_0(%rip), %xmm1
	.loc	1 264 11                # GCD.c:264:11
	movdqu	%xmm2, (%rax)
	movdqu	%xmm1, 16(%rax)
	movl	$4, %edx
.Ltmp79:
.LBB3_6:                                # %vector.body.preheader.split
	#DEBUG_VALUE: init:_5_size <- %R14
	#DEBUG_VALUE: init:n <- %R14
	#DEBUG_VALUE: main:n <- %R14
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: main:_12 <- %RAX
	#DEBUG_VALUE: main:data <- %RAX
	.loc	1 324 8                 # GCD.c:324:8
	testq	%rsi, %rsi
	je	.LBB3_9
.Ltmp80:
# BB#7:
	#DEBUG_VALUE: main:data <- %RAX
	#DEBUG_VALUE: main:_12 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: main:n <- %R14
	#DEBUG_VALUE: init:n <- %R14
	#DEBUG_VALUE: init:_5_size <- %R14
	movl	$1, %esi
	movd	%rsi, %xmm0
	pslldq	$8, %xmm0               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7]
	movdqa	.LCPI3_0(%rip), %xmm1   # xmm1 = [2,3]
.Ltmp81:
	.p2align	4, 0x90
.LBB3_8:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movd	%rdx, %xmm2
	pshufd	$68, %xmm2, %xmm2       # xmm2 = xmm2[0,1,0,1]
.Ltmp82:
	.loc	1 260 6                 # GCD.c:260:6
	movdqu	(%rax,%rdx,8), %xmm3
	paddq	%xmm2, %xmm3
	movdqu	16(%rax,%rdx,8), %xmm4
	paddq	%xmm2, %xmm4
	.loc	1 262 8                 # GCD.c:262:8
	paddq	%xmm0, %xmm3
	paddq	%xmm1, %xmm4
	.loc	1 264 11                # GCD.c:264:11
	movdqu	%xmm3, (%rax,%rdx,8)
	movdqu	%xmm4, 16(%rax,%rdx,8)
	.loc	1 260 6                 # GCD.c:260:6
	leaq	4(%rdx), %rsi
.Ltmp83:
	.loc	1 324 8                 # GCD.c:324:8
	movd	%rsi, %xmm2
	pshufd	$68, %xmm2, %xmm2       # xmm2 = xmm2[0,1,0,1]
.Ltmp84:
	.loc	1 260 6                 # GCD.c:260:6
	movdqu	32(%rax,%rdx,8), %xmm3
	paddq	%xmm2, %xmm3
	movdqu	48(%rax,%rdx,8), %xmm4
	paddq	%xmm2, %xmm4
	.loc	1 262 8                 # GCD.c:262:8
	paddq	%xmm0, %xmm3
	paddq	%xmm1, %xmm4
	.loc	1 264 11                # GCD.c:264:11
	movdqu	%xmm3, 32(%rax,%rdx,8)
	movdqu	%xmm4, 48(%rax,%rdx,8)
	.loc	1 260 6                 # GCD.c:260:6
	addq	$8, %rdx
	cmpq	%rcx, %rdx
	jne	.LBB3_8
.Ltmp85:
.LBB3_9:                                # %middle.block
	cmpq	%rcx, %r14
	.loc	1 324 8                 # GCD.c:324:8
	movq	%rcx, %rdx
	je	.LBB3_11
	.p2align	4, 0x90
.LBB3_10:                               # %if.end.i
                                        # =>This Inner Loop Header: Depth=1
.Ltmp86:
	.loc	1 264 11                # GCD.c:264:11
	addq	%rdx, (%rax,%rdx,8)
.Ltmp87:
	#DEBUG_VALUE: init:_9 <- 1
	.loc	1 268 8                 # GCD.c:268:8
	incq	%rdx
.Ltmp88:
	#DEBUG_VALUE: init:_10 <- %RDX
	#DEBUG_VALUE: init:i <- %RDX
	.loc	1 258 6                 # GCD.c:258:6
	cmpq	%rdx, %r14
	jne	.LBB3_10
.Ltmp89:
.LBB3_11:                               # %while.cond9.preheader.us.preheader
	#DEBUG_VALUE: main:data_size <- 0
	#DEBUG_VALUE: main:_13_size <- 0
	.loc	1 329 8                 # GCD.c:329:8
	movq	%rax, %rdi
	movq	%r14, %rdx
	callq	gcd_array
.Ltmp90:
	#DEBUG_VALUE: main:_13 <- %RAX
	#DEBUG_VALUE: main:gcds <- %RAX
	#DEBUG_VALUE: main:_15 <- 0
	#DEBUG_VALUE: main:_14 <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:sum <- 0
	#DEBUG_VALUE: main:gcds_size <- 0
	.loc	1 353 9                 # GCD.c:353:9
	leaq	-4(%r14), %r9
	movl	%r9d, %r10d
	shrl	$2, %r10d
	incl	%r10d
	movq	%r14, %r12
	andq	$-4, %r12
	andl	$3, %r10d
	leaq	16(%rax), %r8
	leaq	(,%r14,8), %r15
	movq	%r10, %r11
	negq	%r11
	movl	$8, %r13d
	xorl	%ecx, %ecx
	movq	%r8, %rdi
	xorl	%ebx, %ebx
	xorl	%esi, %esi
.Ltmp91:
	.p2align	4, 0x90
.LBB3_12:                               # %while.cond9.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_17 Depth 2
                                        #     Child Loop BB3_20 Depth 2
                                        #     Child Loop BB3_23 Depth 2
	cmpq	$4, %r14
	jae	.LBB3_14
# BB#13:                                #   in Loop: Header=BB3_12 Depth=1
	xorl	%ebp, %ebp
	jmp	.LBB3_22
	.p2align	4, 0x90
.LBB3_14:                               # %min.iters.checked59
                                        #   in Loop: Header=BB3_12 Depth=1
	testq	%r12, %r12
	je	.LBB3_15
# BB#16:                                # %vector.ph63
                                        #   in Loop: Header=BB3_12 Depth=1
	testq	%r10, %r10
	movd	%rbx, %xmm1
	pxor	%xmm0, %xmm0
	.loc	1 365 9                 # GCD.c:365:9
	movq	%r11, %rdx
	movq	%rdi, %rbp
	movl	$0, %ebx
	je	.LBB3_18
	.p2align	4, 0x90
.LBB3_17:                               # %vector.body55.prol
                                        #   Parent Loop BB3_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 357 8                 # GCD.c:357:8
	movdqu	-16(%rbp), %xmm2
	movdqu	(%rbp), %xmm3
	.loc	1 359 11                # GCD.c:359:11
	paddq	%xmm2, %xmm1
	paddq	%xmm3, %xmm0
	.loc	1 353 9                 # GCD.c:353:9
	addq	$4, %rbx
	addq	$32, %rbp
	incq	%rdx
	jne	.LBB3_17
.LBB3_18:                               # %vector.ph63.split
                                        #   in Loop: Header=BB3_12 Depth=1
	cmpq	$12, %r9
	jb	.LBB3_21
# BB#19:                                # %vector.ph63.split.split
                                        #   in Loop: Header=BB3_12 Depth=1
	movq	%r12, %rdx
	subq	%rbx, %rdx
	addq	%r13, %rbx
	leaq	(%r8,%rbx,8), %rbx
	.p2align	4, 0x90
.LBB3_20:                               # %vector.body55
                                        #   Parent Loop BB3_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 357 8                 # GCD.c:357:8
	movdqu	-80(%rbx), %xmm2
	movdqu	-64(%rbx), %xmm3
	movdqu	-48(%rbx), %xmm4
	movdqu	-32(%rbx), %xmm5
	.loc	1 359 11                # GCD.c:359:11
	paddq	%xmm1, %xmm2
	paddq	%xmm0, %xmm3
	paddq	%xmm4, %xmm2
	paddq	%xmm5, %xmm3
	.loc	1 357 8                 # GCD.c:357:8
	movdqu	-16(%rbx), %xmm4
	movdqu	(%rbx), %xmm5
	.loc	1 359 11                # GCD.c:359:11
	paddq	%xmm2, %xmm4
	paddq	%xmm3, %xmm5
	.loc	1 357 8                 # GCD.c:357:8
	movdqu	16(%rbx), %xmm1
	movdqu	32(%rbx), %xmm0
	.loc	1 359 11                # GCD.c:359:11
	paddq	%xmm4, %xmm1
	paddq	%xmm5, %xmm0
	.loc	1 353 9                 # GCD.c:353:9
	subq	$-128, %rbx
	addq	$-16, %rdx
	jne	.LBB3_20
.LBB3_21:                               # %middle.block56
                                        #   in Loop: Header=BB3_12 Depth=1
	cmpq	%r12, %r14
	.loc	1 359 11                # GCD.c:359:11
	paddq	%xmm1, %xmm0
	pshufd	$78, %xmm0, %xmm1       # xmm1 = xmm0[2,3,0,1]
	paddq	%xmm0, %xmm1
	movd	%xmm1, %rbx
	movq	%r12, %rbp
	je	.LBB3_24
	jmp	.LBB3_22
.Ltmp92:
.LBB3_15:                               #   in Loop: Header=BB3_12 Depth=1
	xorl	%ebp, %ebp
.LBB3_22:                               # %if.end14.us.preheader
                                        #   in Loop: Header=BB3_12 Depth=1
	.loc	1 298 12                # GCD.c:298:12
	movq	%r14, %rdx
	subq	%rbp, %rdx
	addq	%rcx, %rbp
	leaq	(%rax,%rbp,8), %rbp
	.p2align	4, 0x90
.LBB3_23:                               # %if.end14.us
                                        #   Parent Loop BB3_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp93:
	.loc	1 359 11                # GCD.c:359:11
	addq	(%rbp), %rbx
.Ltmp94:
	#DEBUG_VALUE: main:_21 <- 1
	#DEBUG_VALUE: main:_20 <- %RBX
	#DEBUG_VALUE: main:sum <- %RBX
	.loc	1 351 7                 # GCD.c:351:7
	addq	$8, %rbp
	decq	%rdx
	jne	.LBB3_23
.Ltmp95:
.LBB3_24:                               # %blklab23.loopexit.us
                                        #   in Loop: Header=BB3_12 Depth=1
	#DEBUG_VALUE: main:_23 <- 1
	.loc	1 376 8                 # GCD.c:376:8
	incq	%rsi
.Ltmp96:
	#DEBUG_VALUE: main:_24 <- %RSI
	#DEBUG_VALUE: main:i <- %RSI
	.loc	1 343 6                 # GCD.c:343:6
	addq	%r15, %rdi
	addq	%r14, %r13
	addq	%r14, %rcx
	cmpq	%r14, %rsi
	jne	.LBB3_12
.Ltmp97:
.LBB3_25:                               # %blklab21
	#DEBUG_VALUE: main:_27_size <- 4
	.loc	1 387 2                 # GCD.c:387:2
	movl	$32, %edi
	callq	malloc
.Ltmp98:
	#DEBUG_VALUE: main:_27 <- %RAX
	.loc	1 388 9                 # GCD.c:388:9
	movaps	.LCPI3_1(%rip), %xmm0   # xmm0 = [83,85]
	movups	%xmm0, (%rax)
	.loc	1 388 35 is_stmt 0      # GCD.c:388:35
	movaps	.LCPI3_2(%rip), %xmm0   # xmm0 = [77,58]
	movups	%xmm0, 16(%rax)
	.loc	1 390 2 is_stmt 1       # GCD.c:390:2
	movl	$4, %esi
	movq	%rax, %rdi
	callq	printf_s
.Ltmp99:
	.loc	1 394 2                 # GCD.c:394:2
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	printf
.LBB3_26:                               # %blklab20
	.loc	1 398 2                 # GCD.c:398:2
	xorl	%edi, %edi
	callq	exit
.LBB3_27:                               # %init.exit.thread
.Ltmp100:
	#DEBUG_VALUE: main:data <- %RAX
	#DEBUG_VALUE: main:_12 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: main:n <- %R14
	#DEBUG_VALUE: init:n <- %R14
	#DEBUG_VALUE: init:_5_size <- %R14
	#DEBUG_VALUE: main:data_size <- 0
	#DEBUG_VALUE: main:_13_size <- 0
	.loc	1 329 8                 # GCD.c:329:8
	movq	%rax, %rdi
	movq	%r14, %rdx
	callq	gcd_array
.Ltmp101:
	xorl	%ebx, %ebx
	#DEBUG_VALUE: main:_15 <- 0
	#DEBUG_VALUE: main:_14 <- 0
.Ltmp102:
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:sum <- 0
	#DEBUG_VALUE: main:gcds_size <- 0
	jmp	.LBB3_25
.Ltmp103:
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"fail"
	.size	.L.str, 5

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"%lld\n"
	.size	.L.str.1, 6

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)" # string offset=0
.Linfo_string1:
	.asciz	"GCD.c"                 # string offset=165
.Linfo_string2:
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/GCD/impl/autogenerate" # string offset=171
.Linfo_string3:
	.asciz	"init"                  # string offset=232
.Linfo_string4:
	.asciz	"long long int"         # string offset=237
.Linfo_string5:
	.asciz	"n"                     # string offset=251
.Linfo_string6:
	.asciz	"_10"                   # string offset=253
.Linfo_string7:
	.asciz	"_9"                    # string offset=257
.Linfo_string8:
	.asciz	"_8"                    # string offset=260
.Linfo_string9:
	.asciz	"_7"                    # string offset=263
.Linfo_string10:
	.asciz	"_6"                    # string offset=266
.Linfo_string11:
	.asciz	"_5_size"               # string offset=269
.Linfo_string12:
	.asciz	"_4"                    # string offset=277
.Linfo_string13:
	.asciz	"i"                     # string offset=280
.Linfo_string14:
	.asciz	"_1_size"               # string offset=282
.Linfo_string15:
	.asciz	"data_size"             # string offset=290
.Linfo_string16:
	.asciz	"_5"                    # string offset=300
.Linfo_string17:
	.asciz	"data"                  # string offset=303
.Linfo_string18:
	.asciz	"_1"                    # string offset=308
.Linfo_string19:
	.asciz	"gcd"                   # string offset=311
.Linfo_string20:
	.asciz	"gcd_array"             # string offset=315
.Linfo_string21:
	.asciz	"main"                  # string offset=325
.Linfo_string22:
	.asciz	"int"                   # string offset=330
.Linfo_string23:
	.asciz	"a"                     # string offset=334
.Linfo_string24:
	.asciz	"b"                     # string offset=336
.Linfo_string25:
	.asciz	"_2"                    # string offset=338
.Linfo_string26:
	.asciz	"_3"                    # string offset=341
.Linfo_string27:
	.asciz	"_35"                   # string offset=344
.Linfo_string28:
	.asciz	"_34"                   # string offset=348
.Linfo_string29:
	.asciz	"_33"                   # string offset=352
.Linfo_string30:
	.asciz	"_32"                   # string offset=356
.Linfo_string31:
	.asciz	"_31"                   # string offset=360
.Linfo_string32:
	.asciz	"_30"                   # string offset=364
.Linfo_string33:
	.asciz	"_29"                   # string offset=368
.Linfo_string34:
	.asciz	"_28"                   # string offset=372
.Linfo_string35:
	.asciz	"_27"                   # string offset=376
.Linfo_string36:
	.asciz	"_26"                   # string offset=380
.Linfo_string37:
	.asciz	"_25"                   # string offset=384
.Linfo_string38:
	.asciz	"_24"                   # string offset=388
.Linfo_string39:
	.asciz	"_23"                   # string offset=392
.Linfo_string40:
	.asciz	"_22"                   # string offset=396
.Linfo_string41:
	.asciz	"_21"                   # string offset=400
.Linfo_string42:
	.asciz	"_20"                   # string offset=404
.Linfo_string43:
	.asciz	"_19"                   # string offset=408
.Linfo_string44:
	.asciz	"_18"                   # string offset=412
.Linfo_string45:
	.asciz	"_17"                   # string offset=416
.Linfo_string46:
	.asciz	"_16"                   # string offset=420
.Linfo_string47:
	.asciz	"_15"                   # string offset=424
.Linfo_string48:
	.asciz	"_14"                   # string offset=428
.Linfo_string49:
	.asciz	"_13"                   # string offset=432
.Linfo_string50:
	.asciz	"_12"                   # string offset=436
.Linfo_string51:
	.asciz	"_11"                   # string offset=440
.Linfo_string52:
	.asciz	"_10_size"              # string offset=444
.Linfo_string53:
	.asciz	"j"                     # string offset=453
.Linfo_string54:
	.asciz	"gcds_size"             # string offset=455
.Linfo_string55:
	.asciz	"_2_size"               # string offset=465
.Linfo_string56:
	.asciz	"gcds"                  # string offset=473
.Linfo_string57:
	.asciz	"argc"                  # string offset=478
.Linfo_string58:
	.asciz	"args"                  # string offset=483
.Linfo_string59:
	.asciz	"char"                  # string offset=488
.Linfo_string60:
	.asciz	"sum"                   # string offset=493
.Linfo_string61:
	.asciz	"_9_size"               # string offset=497
.Linfo_string62:
	.asciz	"_9_size_size"          # string offset=505
.Linfo_string63:
	.asciz	"_11_size"              # string offset=518
.Linfo_string64:
	.asciz	"_12_size"              # string offset=527
.Linfo_string65:
	.asciz	"_13_size"              # string offset=536
.Linfo_string66:
	.asciz	"_27_size"              # string offset=545
.Linfo_string67:
	.asciz	"max"                   # string offset=554
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp2-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp4-.Lfunc_begin0
	.quad	.Ltmp5-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp2-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp4-.Lfunc_begin0
	.quad	.Ltmp6-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc2:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp16-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp16-.Lfunc_begin0
	.quad	.Ltmp19-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp17-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp19-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Ltmp16-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp35-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Ltmp16-.Lfunc_begin0
	.quad	.Ltmp34-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Ltmp16-.Lfunc_begin0
	.quad	.Ltmp33-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp33-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Ltmp16-.Lfunc_begin0
	.quad	.Ltmp32-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp32-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Ltmp16-.Lfunc_begin0
	.quad	.Ltmp29-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp29-.Lfunc_begin0
	.quad	.Ltmp30-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Ltmp16-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp21-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp16-.Lfunc_begin0
	.quad	.Ltmp29-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp29-.Lfunc_begin0
	.quad	.Ltmp30-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp16-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp21-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp16-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp31-.Lfunc_begin0
	.quad	.Ltmp32-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp16-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp21-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp16-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp31-.Lfunc_begin0
	.quad	.Ltmp32-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp16-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp21-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp16-.Lfunc_begin0
	.quad	.Ltmp23-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp30-.Lfunc_begin0
	.quad	.Ltmp32-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Ltmp16-.Lfunc_begin0
	.quad	.Ltmp22-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp22-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp30-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp16-.Lfunc_begin0
	.quad	.Ltmp23-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp30-.Lfunc_begin0
	.quad	.Ltmp32-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Ltmp16-.Lfunc_begin0
	.quad	.Ltmp22-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp22-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp30-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Ltmp16-.Lfunc_begin0
	.quad	.Ltmp33-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp33-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Ltmp16-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp35-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc23:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp19-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp19-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc33:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc34:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc35:
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc36:
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp94-.Lfunc_begin0
	.quad	.Ltmp95-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp102-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc37:
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp96-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp96-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp102-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc38:
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp94-.Lfunc_begin0
	.quad	.Ltmp95-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc39:
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp94-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc40:
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp95-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp95-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc41:
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp96-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp96-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc42:
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp97-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	4                       # 4
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc43:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc44:
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc45:
	.quad	.Ltmp71-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc46:
	.quad	.Ltmp71-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc47:
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc48:
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc49:
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc50:
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc51:
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc52:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Ltmp101-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc53:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Ltmp101-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc54:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Ltmp101-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc55:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Ltmp101-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc56:
	.quad	.Ltmp90-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc57:
	.quad	.Ltmp90-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc58:
	.quad	.Ltmp98-.Lfunc_begin0
	.quad	.Ltmp99-.Lfunc_begin0
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
	.byte	4                       # Abbreviation Code
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
	.byte	5                       # Abbreviation Code
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
	.byte	6                       # Abbreviation Code
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
	.byte	7                       # Abbreviation Code
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
	.byte	8                       # Abbreviation Code
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
	.byte	9                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	10                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	12                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	13                      # Abbreviation Code
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
	.byte	14                      # Abbreviation Code
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
	.byte	15                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	16                      # Abbreviation Code
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
	.byte	17                      # Abbreviation Code
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
	.byte	18                      # Abbreviation Code
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
	.byte	19                      # Abbreviation Code
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
	.byte	20                      # Abbreviation Code
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
	.byte	21                      # Abbreviation Code
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
	.byte	22                      # Abbreviation Code
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
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	1752                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x6d1 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x1 DW_TAG_pointer_type
	.byte	3                       # Abbrev [3] 0x2b:0x80 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1044                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	4                       # Abbrev [4] 0x44:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x53:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x62:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x6e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x7a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x86:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x92:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x9e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	3                       # Abbrev [3] 0xab:0x23e DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1039                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	4                       # Abbrev [4] 0xc4:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	1039                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0xd3:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0xe2:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc4            # DW_AT_location
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0xf1:0xf DW_TAG_variable
	.long	.Ldebug_loc5            # DW_AT_location
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	96                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x100:0xf DW_TAG_variable
	.long	.Ldebug_loc6            # DW_AT_location
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	95                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x10f:0xf DW_TAG_variable
	.long	.Ldebug_loc7            # DW_AT_location
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	94                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x11e:0xf DW_TAG_variable
	.long	.Ldebug_loc8            # DW_AT_location
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	93                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x12d:0xf DW_TAG_variable
	.long	.Ldebug_loc9            # DW_AT_location
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	92                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x13c:0xf DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	91                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x14b:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	90                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x157:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	89                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x163:0xf DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	88                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x172:0xf DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	87                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x181:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	86                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x18d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	85                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x199:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	84                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1a5:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	83                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x1b1:0xf DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	82                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x1c0:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	81                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1cf:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	80                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1db:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	79                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x1e7:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	78                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x1f6:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	77                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x205:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	76                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x211:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	75                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x220:0xf DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	74                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x22f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	73                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x23b:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	72                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x247:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	71                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x253:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x25f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	69                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x26b:0xf DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	68                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x27a:0xf DW_TAG_variable
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	67                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x289:0xf DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	66                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x298:0xf DW_TAG_variable
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	65                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2a7:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2b3:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x2bf:0xf DW_TAG_variable
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	1039                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x2ce:0xf DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	71                      # DW_AT_decl_line
	.long	1039                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x2dd:0xb DW_TAG_variable
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	1039                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	8                       # Abbrev [8] 0x2e9:0x7f DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	872                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x2fc:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc25           # DW_AT_location
	.long	884                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x305:0x9 DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	950                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x30e:0x9 DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	994                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x317:0x9 DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	895                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x320:0x9 DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	906                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x329:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	917                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x32f:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	928                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x335:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	939                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x33b:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	961                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x341:0x9 DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	972                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x34a:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	983                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x350:0x9 DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	1005                    # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x359:0x9 DW_TAG_variable
	.long	.Ldebug_loc32           # DW_AT_location
	.long	1016                    # DW_AT_abstract_origin
	.byte	12                      # Abbrev [12] 0x362:0x5 DW_TAG_variable
	.long	1027                    # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	13                      # Abbrev [13] 0x368:0xa7 DW_TAG_subprogram
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	234                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1039                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	14                      # Abbrev [14] 0x374:0xb DW_TAG_formal_parameter
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	234                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x37f:0xb DW_TAG_variable
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	244                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x38a:0xb DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	243                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x395:0xb DW_TAG_variable
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	242                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x3a0:0xb DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	241                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x3ab:0xb DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	240                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x3b6:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	239                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x3c1:0xb DW_TAG_variable
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	238                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x3cc:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	237                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x3d7:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	235                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x3e2:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	236                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x3ed:0xb DW_TAG_variable
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	239                     # DW_AT_decl_line
	.long	1039                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x3f8:0xb DW_TAG_variable
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	236                     # DW_AT_decl_line
	.long	1039                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x403:0xb DW_TAG_variable
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	235                     # DW_AT_decl_line
	.long	1039                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	15                      # Abbrev [15] 0x40f:0x5 DW_TAG_pointer_type
	.long	1044                    # DW_AT_type
	.byte	16                      # Abbrev [16] 0x414:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	17                      # Abbrev [17] 0x41b:0x2a3 DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	281                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1726                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	18                      # Abbrev [18] 0x435:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc33           # DW_AT_location
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	281                     # DW_AT_decl_line
	.long	1726                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x445:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc34           # DW_AT_location
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	281                     # DW_AT_decl_line
	.long	1733                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x455:0x10 DW_TAG_variable
	.long	.Ldebug_loc35           # DW_AT_location
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	283                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x465:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	284                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x472:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	285                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x47f:0x10 DW_TAG_variable
	.long	.Ldebug_loc36           # DW_AT_location
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	286                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x48f:0x10 DW_TAG_variable
	.long	.Ldebug_loc37           # DW_AT_location
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	287                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x49f:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	288                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x4ac:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	290                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x4b9:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	290                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x4c6:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	291                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x4d3:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	292                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x4e0:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	293                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x4ed:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	294                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x4fa:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	295                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x507:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	296                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x514:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	297                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x521:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	298                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x52e:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	299                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x53b:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	300                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x548:0x10 DW_TAG_variable
	.long	.Ldebug_loc38           # DW_AT_location
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	301                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x558:0x10 DW_TAG_variable
	.long	.Ldebug_loc39           # DW_AT_location
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	302                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x568:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	303                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x575:0x10 DW_TAG_variable
	.long	.Ldebug_loc40           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	304                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x585:0x10 DW_TAG_variable
	.long	.Ldebug_loc41           # DW_AT_location
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	305                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x595:0x10 DW_TAG_variable
	.long	.Ldebug_loc42           # DW_AT_location
	.long	.Linfo_string66         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	307                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x5a5:0x10 DW_TAG_variable
	.long	.Ldebug_loc43           # DW_AT_location
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	290                     # DW_AT_decl_line
	.long	1750                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x5b5:0x10 DW_TAG_variable
	.long	.Ldebug_loc44           # DW_AT_location
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	292                     # DW_AT_decl_line
	.long	1039                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x5c5:0x10 DW_TAG_variable
	.long	.Ldebug_loc45           # DW_AT_location
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	282                     # DW_AT_decl_line
	.long	1039                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x5d5:0x10 DW_TAG_variable
	.long	.Ldebug_loc46           # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	289                     # DW_AT_decl_line
	.long	1039                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x5e5:0x10 DW_TAG_variable
	.long	.Ldebug_loc54           # DW_AT_location
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	293                     # DW_AT_decl_line
	.long	1039                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x5f5:0x10 DW_TAG_variable
	.long	.Ldebug_loc55           # DW_AT_location
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	284                     # DW_AT_decl_line
	.long	1039                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x605:0x10 DW_TAG_variable
	.long	.Ldebug_loc56           # DW_AT_location
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	294                     # DW_AT_decl_line
	.long	1039                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x615:0x10 DW_TAG_variable
	.long	.Ldebug_loc57           # DW_AT_location
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	285                     # DW_AT_decl_line
	.long	1039                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x625:0x10 DW_TAG_variable
	.long	.Ldebug_loc58           # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	307                     # DW_AT_decl_line
	.long	1039                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x635:0xc DW_TAG_variable
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	306                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	21                      # Abbrev [21] 0x641:0xc DW_TAG_variable
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	308                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	22                      # Abbrev [22] 0x64d:0x70 DW_TAG_inlined_subroutine
	.long	872                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.short	324                     # DW_AT_call_line
	.byte	9                       # Abbrev [9] 0x659:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc51           # DW_AT_location
	.long	884                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x662:0x9 DW_TAG_variable
	.long	.Ldebug_loc47           # DW_AT_location
	.long	895                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x66b:0x9 DW_TAG_variable
	.long	.Ldebug_loc48           # DW_AT_location
	.long	906                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x674:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	917                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x67a:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	928                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x680:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	939                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x686:0x9 DW_TAG_variable
	.long	.Ldebug_loc49           # DW_AT_location
	.long	950                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x68f:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	961                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x695:0x9 DW_TAG_variable
	.long	.Ldebug_loc50           # DW_AT_location
	.long	972                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x69e:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	983                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x6a4:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	994                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x6aa:0x9 DW_TAG_variable
	.long	.Ldebug_loc52           # DW_AT_location
	.long	1005                    # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x6b3:0x9 DW_TAG_variable
	.long	.Ldebug_loc53           # DW_AT_location
	.long	1016                    # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	16                      # Abbrev [16] 0x6be:0x7 DW_TAG_base_type
	.long	.Linfo_string22         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	15                      # Abbrev [15] 0x6c5:0x5 DW_TAG_pointer_type
	.long	1738                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x6ca:0x5 DW_TAG_pointer_type
	.long	1743                    # DW_AT_type
	.byte	16                      # Abbrev [16] 0x6cf:0x7 DW_TAG_base_type
	.long	.Linfo_string59         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	15                      # Abbrev [15] 0x6d6:0x5 DW_TAG_pointer_type
	.long	1039                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
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
	.long	1756                    # Compilation Unit Length
	.long	872                     # DIE offset
	.asciz	"init"                  # External Name
	.long	1051                    # DIE offset
	.asciz	"main"                  # External Name
	.long	171                     # DIE offset
	.asciz	"gcd_array"             # External Name
	.long	43                      # DIE offset
	.asciz	"gcd"                   # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	1756                    # Compilation Unit Length
	.long	1044                    # DIE offset
	.asciz	"long long int"         # External Name
	.long	1726                    # DIE offset
	.asciz	"int"                   # External Name
	.long	1743                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
