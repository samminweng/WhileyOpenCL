	.text
	.file	"llvm/GCD.polly.enablevc.ll"
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
	pushq	%rbp
.Ltmp9:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp10:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp11:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp12:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp13:
	.cfi_def_cfa_offset 48
.Ltmp14:
	.cfi_offset %rbx, -48
.Ltmp15:
	.cfi_offset %r12, -40
.Ltmp16:
	.cfi_offset %r14, -32
.Ltmp17:
	.cfi_offset %r15, -24
.Ltmp18:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: gcd_array:data <- %RDI
	#DEBUG_VALUE: gcd_array:data_size <- %RSI
	#DEBUG_VALUE: gcd_array:data_has_ownership [bit_piece offset=0 size=1] <- %EDX
	#DEBUG_VALUE: gcd_array:n <- %RCX
	movq	%rcx, %r12
.Ltmp19:
	#DEBUG_VALUE: gcd_array:n <- %R12
	movl	%edx, %r14d
.Ltmp20:
	#DEBUG_VALUE: gcd_array:data_has_ownership [bit_piece offset=0 size=1] <- %R14D
	movq	%rdi, %rbx
.Ltmp21:
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
	#DEBUG_VALUE: gcd_array:_10_has_ownership <- 0
	#DEBUG_VALUE: gcd_array:_10_size <- 0
	#DEBUG_VALUE: gcd_array:_9 <- 0
	#DEBUG_VALUE: gcd_array:_8 <- 0
	#DEBUG_VALUE: gcd_array:b <- 0
	#DEBUG_VALUE: gcd_array:a <- 0
	#DEBUG_VALUE: gcd_array:j <- 0
	#DEBUG_VALUE: gcd_array:i <- 0
	#DEBUG_VALUE: gcd_array:gcds_has_ownership <- 0
	#DEBUG_VALUE: gcd_array:gcds_size <- 0
	#DEBUG_VALUE: gcd_array:_2_has_ownership <- 0
	#DEBUG_VALUE: gcd_array:_2_size <- 0
	#DEBUG_VALUE: gcd_array:data <- %RBX
	.loc	1 103 6 prologue_end    # GCD.c:103:6
	movl	%r12d, %esi
.Ltmp22:
	imull	%esi, %esi
	xorl	%ebp, %ebp
	.loc	1 106 2                 # GCD.c:106:2
	xorl	%edi, %edi
	callq	gen1DArray
	movq	%rax, %r15
.Ltmp23:
	#DEBUG_VALUE: gcd_array:gcds <- %R15
	#DEBUG_VALUE: gcd_array:_10 <- %R15
	#DEBUG_VALUE: gcd_array:gcds_has_ownership <- 1
	.loc	1 120 6                 # GCD.c:120:6
	testq	%r12, %r12
	jle	.LBB1_11
.Ltmp24:
	.p2align	4, 0x90
.LBB1_1:                                # %while.cond8.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
                                        #       Child Loop BB1_4 Depth 3
                                        #         Child Loop BB1_5 Depth 4
	.loc	1 142 9                 # GCD.c:142:9
	movq	%rbp, %rax
	imulq	%r12, %rax
.Ltmp25:
	#DEBUG_VALUE: gcd_array:_30 <- %RAX
	#DEBUG_VALUE: gcd_array:_26 <- %RAX
	#DEBUG_VALUE: gcd_array:_20 <- %RAX
	#DEBUG_VALUE: gcd_array:_16 <- %RAX
	xorl	%ecx, %ecx
.Ltmp26:
	.p2align	4, 0x90
.LBB1_2:                                # %if.end13.us
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_4 Depth 3
                                        #         Child Loop BB1_5 Depth 4
	.loc	1 130 8                 # GCD.c:130:8
	movq	(%rbx,%rbp,8), %rdx
.Ltmp27:
	#DEBUG_VALUE: gcd_array:_13 <- %RDX
	#DEBUG_VALUE: gcd_array:a <- %RDX
	.loc	1 134 8                 # GCD.c:134:8
	movq	(%rbx,%rcx,8), %rsi
	#DEBUG_VALUE: gcd_array:_15 <- 0
.Ltmp28:
	#DEBUG_VALUE: gcd_array:_14 <- %RSI
	#DEBUG_VALUE: gcd_array:b <- %RSI
	.loc	1 140 8                 # GCD.c:140:8
	testq	%rdx, %rdx
.Ltmp29:
	.loc	1 140 7 is_stmt 0       # GCD.c:140:7
	je	.LBB1_8
.Ltmp30:
# BB#3:                                 # %while.cond25.preheader.us
                                        #   in Loop: Header=BB1_2 Depth=2
	#DEBUG_VALUE: gcd_array:b <- %RSI
	#DEBUG_VALUE: gcd_array:_14 <- %RSI
	#DEBUG_VALUE: gcd_array:a <- %RDX
	#DEBUG_VALUE: gcd_array:_13 <- %RDX
	#DEBUG_VALUE: gcd_array:_22 <- 0
	js	.LBB1_15
.Ltmp31:
.LBB1_4:                                # %blklab15.lr.ph.us
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_2 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_5 Depth 4
	#DEBUG_VALUE: gcd_array:_23 <- 0
	.loc	1 177 9 is_stmt 1       # GCD.c:177:9
	testq	%rsi, %rsi
	je	.LBB1_7
.Ltmp32:
	.p2align	4, 0x90
.LBB1_5:                                # %if.end35.us
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_2 Depth=2
                                        #       Parent Loop BB1_4 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	.loc	1 179 9                 # GCD.c:179:9
	movq	%rsi, %rdi
	subq	%rdx, %rdi
.Ltmp33:
	.loc	1 179 8 is_stmt 0       # GCD.c:179:8
	jl	.LBB1_14
# BB#6:                                 # %blklab16.thread.us
                                        #   in Loop: Header=BB1_5 Depth=4
	#DEBUG_VALUE: gcd_array:_22 <- 0
	#DEBUG_VALUE: gcd_array:_23 <- 0
	movq	%rdi, %rsi
	jne	.LBB1_5
	jmp	.LBB1_7
	.p2align	4, 0x90
.LBB1_14:                               # %if.end39.us
                                        #   in Loop: Header=BB1_4 Depth=3
	#DEBUG_VALUE: gcd_array:_22 <- 0
.Ltmp34:
	.loc	1 166 10 is_stmt 1      # GCD.c:166:10
	subq	%rsi, %rdx
	jns	.LBB1_4
	jmp	.LBB1_15
.Ltmp35:
	.p2align	4, 0x90
.LBB1_7:                                # %blklab13.us
                                        #   in Loop: Header=BB1_2 Depth=2
	.loc	1 202 11                # GCD.c:202:11
	leaq	(%rcx,%rax), %rsi
.Ltmp36:
	#DEBUG_VALUE: gcd_array:_31 <- %RSI
	#DEBUG_VALUE: gcd_array:_27 <- %RSI
	.loc	1 212 14                # GCD.c:212:14
	addq	%rdx, (%r15,%rsi,8)
	jmp	.LBB1_9
.Ltmp37:
	.p2align	4, 0x90
.LBB1_8:                                # %if.end18.us
                                        #   in Loop: Header=BB1_2 Depth=2
	#DEBUG_VALUE: gcd_array:b <- %RSI
	#DEBUG_VALUE: gcd_array:_14 <- %RSI
	#DEBUG_VALUE: gcd_array:a <- %RDX
	#DEBUG_VALUE: gcd_array:_13 <- %RDX
	.loc	1 144 11                # GCD.c:144:11
	leaq	(%rcx,%rax), %rdx
.Ltmp38:
	#DEBUG_VALUE: gcd_array:_21 <- %RDX
	#DEBUG_VALUE: gcd_array:_17 <- %RDX
	.loc	1 154 14                # GCD.c:154:14
	addq	%rsi, (%r15,%rdx,8)
.Ltmp39:
.LBB1_9:                                # %blklab12.us
                                        #   in Loop: Header=BB1_2 Depth=2
	#DEBUG_VALUE: gcd_array:_32 <- 1
	.loc	1 218 9                 # GCD.c:218:9
	incq	%rcx
.Ltmp40:
	#DEBUG_VALUE: gcd_array:_33 <- %RCX
	#DEBUG_VALUE: gcd_array:j <- %RCX
	.loc	1 128 8                 # GCD.c:128:8
	cmpq	%r12, %rcx
	jl	.LBB1_2
.Ltmp41:
# BB#10:                                # %blklab9.loopexit.us
                                        #   in Loop: Header=BB1_1 Depth=1
	#DEBUG_VALUE: gcd_array:j <- %RCX
	#DEBUG_VALUE: gcd_array:_33 <- %RCX
	#DEBUG_VALUE: gcd_array:_34 <- 1
	.loc	1 229 8                 # GCD.c:229:8
	incq	%rbp
.Ltmp42:
	#DEBUG_VALUE: gcd_array:_35 <- %RBP
	#DEBUG_VALUE: gcd_array:i <- %RBP
	.loc	1 120 7                 # GCD.c:120:7
	cmpq	%r12, %rbp
	jl	.LBB1_1
.Ltmp43:
.LBB1_11:                               # %blklab7
	#DEBUG_VALUE: gcd_array:data_has_ownership [bit_piece offset=0 size=1] <- %R14B
	.loc	1 238 2                 # GCD.c:238:2
	testb	%r14b, %r14b
	je	.LBB1_13
.Ltmp44:
# BB#12:                                # %if.then51
	#DEBUG_VALUE: gcd_array:data_has_ownership [bit_piece offset=0 size=1] <- %R14B
	.loc	1 238 2 is_stmt 0 discriminator 1 # GCD.c:238:2
	movq	%rbx, %rdi
	callq	free
.Ltmp45:
	#DEBUG_VALUE: gcd_array:data_has_ownership <- 0
.LBB1_13:                               # %if.end58
	.loc	1 241 2 is_stmt 1       # GCD.c:241:2
	movq	%r15, %rax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB1_15:                               # %if.end30
.Ltmp46:
	.loc	1 168 14                # GCD.c:168:14
	movq	stderr(%rip), %rcx
	.loc	1 168 6 is_stmt 0       # GCD.c:168:6
	movl	$.L.str, %edi
	movl	$4, %esi
	movl	$1, %edx
	callq	fwrite
	.loc	1 169 6 is_stmt 1       # GCD.c:169:6
	movl	$-1, %edi
	callq	exit
.Ltmp47:
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
	.loc	1 245 0                 # GCD.c:245:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp48:
	.cfi_def_cfa_offset 16
.Ltmp49:
	.cfi_offset %rbx, -16
	#DEBUG_VALUE: init:n <- %RDI
.Ltmp50:
	#DEBUG_VALUE: init:_5_size <- %RDI
	#DEBUG_VALUE: init:data_size <- %RDI
	movq	%rdi, %rbx
.Ltmp51:
	#DEBUG_VALUE: init:_10 <- 0
	#DEBUG_VALUE: init:_9 <- 0
	#DEBUG_VALUE: init:_8 <- 0
	#DEBUG_VALUE: init:_7 <- 0
	#DEBUG_VALUE: init:_6 <- 0
	#DEBUG_VALUE: init:_5_has_ownership <- 0
	#DEBUG_VALUE: init:_4 <- 0
	#DEBUG_VALUE: init:i <- 0
	#DEBUG_VALUE: init:data_has_ownership <- 0
	#DEBUG_VALUE: init:_1_has_ownership <- 0
	#DEBUG_VALUE: init:_1_size <- 0
	#DEBUG_VALUE: init:data_size <- 0
	#DEBUG_VALUE: init:_5_size <- 0
	#DEBUG_VALUE: init:n <- %RBX
	.loc	1 263 2 prologue_end    # GCD.c:263:2
	xorl	%edi, %edi
	movl	%ebx, %esi
	callq	gen1DArray
.Ltmp52:
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: init:data_has_ownership <- 1
	.loc	1 277 6                 # GCD.c:277:6
	testq	%rbx, %rbx
	jle	.LBB2_10
.Ltmp53:
# BB#1:                                 # %if.end7.preheader
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:n <- %RBX
	xorl	%edx, %edx
	.loc	1 279 6                 # GCD.c:279:6
	cmpq	$4, %rbx
	jb	.LBB2_9
.Ltmp54:
# BB#2:                                 # %min.iters.checked
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	xorl	%edx, %edx
	movq	%rbx, %rcx
	andq	$-4, %rcx
	je	.LBB2_9
.Ltmp55:
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
.Ltmp56:
# BB#4:                                 # %vector.body.prol
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	movdqu	(%rax), %xmm0
	movdqu	16(%rax), %xmm1
	.loc	1 281 8                 # GCD.c:281:8
	movl	$1, %edx
	movd	%rdx, %xmm2
	pslldq	$8, %xmm2               # xmm2 = zero,zero,zero,zero,zero,zero,zero,zero,xmm2[0,1,2,3,4,5,6,7]
	paddq	%xmm0, %xmm2
	paddq	.LCPI2_0(%rip), %xmm1
	.loc	1 283 11                # GCD.c:283:11
	movdqu	%xmm2, (%rax)
	movdqu	%xmm1, 16(%rax)
	movl	$4, %edx
.Ltmp57:
.LBB2_5:                                # %vector.body.preheader.split
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	testq	%rsi, %rsi
	je	.LBB2_8
.Ltmp58:
# BB#6:
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:n <- %RBX
	movl	$1, %esi
	movd	%rsi, %xmm0
	pslldq	$8, %xmm0               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7]
	movdqa	.LCPI2_0(%rip), %xmm1   # xmm1 = [2,3]
.Ltmp59:
	.p2align	4, 0x90
.LBB2_7:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movd	%rdx, %xmm2
	pshufd	$68, %xmm2, %xmm2       # xmm2 = xmm2[0,1,0,1]
	.loc	1 279 6                 # GCD.c:279:6
	movdqu	(%rax,%rdx,8), %xmm3
	paddq	%xmm2, %xmm3
	movdqu	16(%rax,%rdx,8), %xmm4
	paddq	%xmm2, %xmm4
	.loc	1 281 8                 # GCD.c:281:8
	paddq	%xmm0, %xmm3
	paddq	%xmm1, %xmm4
	.loc	1 283 11                # GCD.c:283:11
	movdqu	%xmm3, (%rax,%rdx,8)
	movdqu	%xmm4, 16(%rax,%rdx,8)
	.loc	1 279 6                 # GCD.c:279:6
	leaq	4(%rdx), %rsi
	movd	%rsi, %xmm2
	pshufd	$68, %xmm2, %xmm2       # xmm2 = xmm2[0,1,0,1]
	movdqu	32(%rax,%rdx,8), %xmm3
	paddq	%xmm2, %xmm3
	movdqu	48(%rax,%rdx,8), %xmm4
	paddq	%xmm2, %xmm4
	.loc	1 281 8                 # GCD.c:281:8
	paddq	%xmm0, %xmm3
	paddq	%xmm1, %xmm4
	.loc	1 283 11                # GCD.c:283:11
	movdqu	%xmm3, 32(%rax,%rdx,8)
	movdqu	%xmm4, 48(%rax,%rdx,8)
	.loc	1 279 6                 # GCD.c:279:6
	addq	$8, %rdx
	cmpq	%rcx, %rdx
	jne	.LBB2_7
.LBB2_8:                                # %middle.block
	cmpq	%rbx, %rcx
	movq	%rcx, %rdx
	je	.LBB2_10
	.p2align	4, 0x90
.LBB2_9:                                # %if.end7
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 283 11                # GCD.c:283:11
	addq	%rdx, (%rax,%rdx,8)
.Ltmp60:
	#DEBUG_VALUE: init:_9 <- 1
	.loc	1 287 8                 # GCD.c:287:8
	incq	%rdx
.Ltmp61:
	#DEBUG_VALUE: init:_10 <- %RDX
	#DEBUG_VALUE: init:i <- %RDX
	.loc	1 277 6                 # GCD.c:277:6
	cmpq	%rdx, %rbx
	jne	.LBB2_9
.Ltmp62:
.LBB2_10:                               # %if.end15
	.loc	1 298 2                 # GCD.c:298:2
	popq	%rbx
	retq
.Ltmp63:
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
	.loc	1 302 0                 # GCD.c:302:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp64:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp65:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp66:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp67:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp68:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp69:
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
.Ltmp70:
	.cfi_def_cfa_offset 80
.Ltmp71:
	.cfi_offset %rbx, -56
.Ltmp72:
	.cfi_offset %r12, -48
.Ltmp73:
	.cfi_offset %r13, -40
.Ltmp74:
	.cfi_offset %r14, -32
.Ltmp75:
	.cfi_offset %r15, -24
.Ltmp76:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
	movl	%edi, %ebx
.Ltmp77:
	#DEBUG_VALUE: main:_27_has_ownership <- 0
	#DEBUG_VALUE: main:_27_size <- 0
	#DEBUG_VALUE: main:_24 <- 0
	#DEBUG_VALUE: main:_23 <- 0
	#DEBUG_VALUE: main:_22 <- 0
	#DEBUG_VALUE: main:_21 <- 0
	#DEBUG_VALUE: main:_20 <- 0
	#DEBUG_VALUE: main:_19 <- 0
	#DEBUG_VALUE: main:_18 <- 0
	#DEBUG_VALUE: main:_17 <- 0
	#DEBUG_VALUE: main:_16 <- 0
	#DEBUG_VALUE: main:_15 <- 0
	#DEBUG_VALUE: main:_14 <- 0
	#DEBUG_VALUE: main:_13_has_ownership <- 0
	#DEBUG_VALUE: main:_13_size <- 0
	#DEBUG_VALUE: main:_12_has_ownership <- 0
	#DEBUG_VALUE: main:_12_size <- 0
	#DEBUG_VALUE: main:_11_has_ownership <- 0
	#DEBUG_VALUE: main:_11_size <- 0
	#DEBUG_VALUE: main:_10 <- 0
	#DEBUG_VALUE: main:_9_has_ownership <- 0
	#DEBUG_VALUE: main:_9_size_size <- 0
	#DEBUG_VALUE: main:_9_size <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:sum <- 0
	#DEBUG_VALUE: main:gcds_has_ownership <- 0
	#DEBUG_VALUE: main:gcds_size <- 0
	#DEBUG_VALUE: main:data_has_ownership <- 0
	#DEBUG_VALUE: main:data_size <- 0
	#DEBUG_VALUE: main:n <- 0
	#DEBUG_VALUE: main:argc <- %EBX
	.loc	1 338 2 prologue_end    # GCD.c:338:2
	callq	convertArgsToIntArray
.Ltmp78:
	movq	%rax, %rbp
.Ltmp79:
	#DEBUG_VALUE: main:_9 <- %RBP
	decl	%ebx
.Ltmp80:
	movslq	%ebx, %r14
.Ltmp81:
	#DEBUG_VALUE: main:_9_has_ownership <- 1
	#DEBUG_VALUE: main:_9_size <- %EBX
	.loc	1 343 6                 # GCD.c:343:6
	movq	(%rbp), %rdi
.Ltmp82:
	#DEBUG_VALUE: main:_11 <- %RDI
	.loc	1 345 2                 # GCD.c:345:2
	callq	parseStringToInt
.Ltmp83:
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_8 <- %RAX
	.loc	1 349 9                 # GCD.c:349:9
	testq	%rax, %rax
.Ltmp84:
	.loc	1 349 5 is_stmt 0       # GCD.c:349:5
	je	.LBB3_26
.Ltmp85:
# BB#1:                                 # %if.end
	#DEBUG_VALUE: main:_8 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_9_size <- %EBX
	#DEBUG_VALUE: main:_9 <- %RBP
	.loc	1 351 6 is_stmt 1       # GCD.c:351:6
	movq	(%rax), %rbx
.Ltmp86:
	#DEBUG_VALUE: init:_10 <- 0
	#DEBUG_VALUE: init:_9 <- 0
	#DEBUG_VALUE: init:_8 <- 0
	#DEBUG_VALUE: init:_7 <- 0
	#DEBUG_VALUE: init:_6 <- 0
	#DEBUG_VALUE: init:_5_has_ownership <- 0
	#DEBUG_VALUE: init:_5_size <- %RBX
	#DEBUG_VALUE: init:_4 <- 0
	#DEBUG_VALUE: init:i <- 0
	#DEBUG_VALUE: init:data_has_ownership <- 0
	#DEBUG_VALUE: init:_1_has_ownership <- 0
	#DEBUG_VALUE: init:_1_size <- 0
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: init:data_size <- 0
	#DEBUG_VALUE: main:n <- %RBX
	.loc	1 263 2                 # GCD.c:263:2
	xorl	%edi, %edi
	movl	%ebx, %esi
	callq	gen1DArray
.Ltmp87:
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: main:_12 <- %RAX
	#DEBUG_VALUE: main:data <- %RAX
	#DEBUG_VALUE: init:data_has_ownership <- 1
	.loc	1 277 6                 # GCD.c:277:6
	testq	%rbx, %rbx
	jle	.LBB3_28
.Ltmp88:
# BB#2:                                 # %if.end7.i.preheader
	#DEBUG_VALUE: main:_9 <- %RBP
	#DEBUG_VALUE: main:data <- %RAX
	#DEBUG_VALUE: main:_12 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: main:n <- %RBX
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: init:_5_size <- %RBX
	movq	%r14, 8(%rsp)           # 8-byte Spill
	movq	%rbp, 16(%rsp)          # 8-byte Spill
	xorl	%ecx, %ecx
	.loc	1 279 6                 # GCD.c:279:6
	cmpq	$4, %rbx
	jb	.LBB3_10
.Ltmp89:
# BB#3:                                 # %min.iters.checked
	#DEBUG_VALUE: init:_5_size <- %RBX
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: main:n <- %RBX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: main:_12 <- %RAX
	#DEBUG_VALUE: main:data <- %RAX
	#DEBUG_VALUE: main:_9 <- %RBP
	xorl	%ecx, %ecx
	movq	%rbx, %rdi
	andq	$-4, %rdi
	je	.LBB3_10
.Ltmp90:
# BB#4:                                 # %vector.body.preheader
	#DEBUG_VALUE: main:_9 <- %RBP
	#DEBUG_VALUE: main:data <- %RAX
	#DEBUG_VALUE: main:_12 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: main:n <- %RBX
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: init:_5_size <- %RBX
	.loc	1 354 8                 # GCD.c:354:8
	leaq	-4(%rdi), %rsi
	movq	%rsi, %rdx
	shrq	$2, %rdx
	xorl	%ecx, %ecx
	btq	$2, %rsi
	jb	.LBB3_6
.Ltmp91:
# BB#5:                                 # %vector.body.prol
	#DEBUG_VALUE: init:_5_size <- %RBX
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: main:n <- %RBX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: main:_12 <- %RAX
	#DEBUG_VALUE: main:data <- %RAX
	#DEBUG_VALUE: main:_9 <- %RBP
	.loc	1 279 6                 # GCD.c:279:6
	movdqu	(%rax), %xmm0
	movdqu	16(%rax), %xmm1
	.loc	1 281 8                 # GCD.c:281:8
	movl	$1, %ecx
	movd	%rcx, %xmm2
	pslldq	$8, %xmm2               # xmm2 = zero,zero,zero,zero,zero,zero,zero,zero,xmm2[0,1,2,3,4,5,6,7]
	paddq	%xmm0, %xmm2
	paddq	.LCPI3_0(%rip), %xmm1
	.loc	1 283 11                # GCD.c:283:11
	movdqu	%xmm2, (%rax)
	movdqu	%xmm1, 16(%rax)
	movl	$4, %ecx
.Ltmp92:
.LBB3_6:                                # %vector.body.preheader.split
	#DEBUG_VALUE: init:_5_size <- %RBX
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: main:n <- %RBX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: main:_12 <- %RAX
	#DEBUG_VALUE: main:data <- %RAX
	#DEBUG_VALUE: main:_9 <- %RBP
	.loc	1 354 8                 # GCD.c:354:8
	testq	%rdx, %rdx
	je	.LBB3_9
.Ltmp93:
# BB#7:
	#DEBUG_VALUE: main:_9 <- %RBP
	#DEBUG_VALUE: main:data <- %RAX
	#DEBUG_VALUE: main:_12 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: main:n <- %RBX
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: init:_5_size <- %RBX
	movl	$1, %edx
	movd	%rdx, %xmm0
	pslldq	$8, %xmm0               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7]
	movdqa	.LCPI3_0(%rip), %xmm1   # xmm1 = [2,3]
.Ltmp94:
	.p2align	4, 0x90
.LBB3_8:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movd	%rcx, %xmm2
	pshufd	$68, %xmm2, %xmm2       # xmm2 = xmm2[0,1,0,1]
.Ltmp95:
	.loc	1 279 6                 # GCD.c:279:6
	movdqu	(%rax,%rcx,8), %xmm3
	paddq	%xmm2, %xmm3
	movdqu	16(%rax,%rcx,8), %xmm4
	paddq	%xmm2, %xmm4
	.loc	1 281 8                 # GCD.c:281:8
	paddq	%xmm0, %xmm3
	paddq	%xmm1, %xmm4
	.loc	1 283 11                # GCD.c:283:11
	movdqu	%xmm3, (%rax,%rcx,8)
	movdqu	%xmm4, 16(%rax,%rcx,8)
	.loc	1 279 6                 # GCD.c:279:6
	leaq	4(%rcx), %rdx
.Ltmp96:
	.loc	1 354 8                 # GCD.c:354:8
	movd	%rdx, %xmm2
	pshufd	$68, %xmm2, %xmm2       # xmm2 = xmm2[0,1,0,1]
.Ltmp97:
	.loc	1 279 6                 # GCD.c:279:6
	movdqu	32(%rax,%rcx,8), %xmm3
	paddq	%xmm2, %xmm3
	movdqu	48(%rax,%rcx,8), %xmm4
	paddq	%xmm2, %xmm4
	.loc	1 281 8                 # GCD.c:281:8
	paddq	%xmm0, %xmm3
	paddq	%xmm1, %xmm4
	.loc	1 283 11                # GCD.c:283:11
	movdqu	%xmm3, 32(%rax,%rcx,8)
	movdqu	%xmm4, 48(%rax,%rcx,8)
	.loc	1 279 6                 # GCD.c:279:6
	addq	$8, %rcx
	cmpq	%rdi, %rcx
	jne	.LBB3_8
.Ltmp98:
.LBB3_9:                                # %middle.block
	cmpq	%rdi, %rbx
	.loc	1 354 8                 # GCD.c:354:8
	movq	%rdi, %rcx
	je	.LBB3_11
	.p2align	4, 0x90
.LBB3_10:                               # %if.end7.i
                                        # =>This Inner Loop Header: Depth=1
.Ltmp99:
	.loc	1 283 11                # GCD.c:283:11
	addq	%rcx, (%rax,%rcx,8)
.Ltmp100:
	#DEBUG_VALUE: init:_9 <- 1
	.loc	1 287 8                 # GCD.c:287:8
	incq	%rcx
.Ltmp101:
	#DEBUG_VALUE: init:_10 <- %RCX
	#DEBUG_VALUE: init:i <- %RCX
	.loc	1 277 6                 # GCD.c:277:6
	cmpq	%rcx, %rbx
	jne	.LBB3_10
.Ltmp102:
.LBB3_11:                               # %while.cond20.preheader.us.preheader
	#DEBUG_VALUE: main:data_size <- 0
	#DEBUG_VALUE: main:data_has_ownership <- 1
	#DEBUG_VALUE: main:_12_has_ownership <- 0
	#DEBUG_VALUE: main:_13_size <- 0
	xorl	%r14d, %r14d
	.loc	1 365 8                 # GCD.c:365:8
	xorl	%edx, %edx
	movq	%rax, %rdi
	movq	%rdi, (%rsp)            # 8-byte Spill
	movq	%rbx, %rcx
	callq	gcd_array
	movq	%rax, %r13
.Ltmp103:
	#DEBUG_VALUE: main:_13 <- %R13
	#DEBUG_VALUE: main:gcds <- %R13
	#DEBUG_VALUE: main:_15 <- 0
	#DEBUG_VALUE: main:_14 <- 0
	#DEBUG_VALUE: main:_13_has_ownership <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:sum <- 0
	#DEBUG_VALUE: main:gcds_has_ownership <- 1
	#DEBUG_VALUE: main:gcds_size <- 0
	.loc	1 393 9                 # GCD.c:393:9
	leaq	-4(%rbx), %r9
	movl	%r9d, %r10d
	shrl	$2, %r10d
	incl	%r10d
	movq	%rbx, %r15
	andq	$-4, %r15
	andl	$3, %r10d
	leaq	16(%r13), %r8
	leaq	(,%rbx,8), %rdi
	movq	%r10, %r11
	negq	%r11
	movl	$8, %eax
	movq	%r8, %r12
	xorl	%esi, %esi
	xorl	%ebp, %ebp
.Ltmp104:
	.p2align	4, 0x90
.LBB3_12:                               # %while.cond20.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_17 Depth 2
                                        #     Child Loop BB3_20 Depth 2
                                        #     Child Loop BB3_23 Depth 2
	cmpq	$4, %rbx
	jae	.LBB3_14
# BB#13:                                #   in Loop: Header=BB3_12 Depth=1
	xorl	%edx, %edx
	jmp	.LBB3_22
	.p2align	4, 0x90
.LBB3_14:                               # %min.iters.checked115
                                        #   in Loop: Header=BB3_12 Depth=1
	testq	%r15, %r15
	je	.LBB3_15
# BB#16:                                # %vector.ph119
                                        #   in Loop: Header=BB3_12 Depth=1
	testq	%r10, %r10
	movd	%rbp, %xmm1
	pxor	%xmm0, %xmm0
	.loc	1 405 9                 # GCD.c:405:9
	movq	%r11, %rdx
	movq	%r12, %rcx
	movl	$0, %ebp
	je	.LBB3_18
	.p2align	4, 0x90
.LBB3_17:                               # %vector.body111.prol
                                        #   Parent Loop BB3_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 397 8                 # GCD.c:397:8
	movdqu	-16(%rcx), %xmm2
	movdqu	(%rcx), %xmm3
	.loc	1 399 11                # GCD.c:399:11
	paddq	%xmm2, %xmm1
	paddq	%xmm3, %xmm0
	.loc	1 393 9                 # GCD.c:393:9
	addq	$4, %rbp
	addq	$32, %rcx
	incq	%rdx
	jne	.LBB3_17
.LBB3_18:                               # %vector.ph119.split
                                        #   in Loop: Header=BB3_12 Depth=1
	cmpq	$12, %r9
	jb	.LBB3_21
# BB#19:                                # %vector.ph119.split.split
                                        #   in Loop: Header=BB3_12 Depth=1
	movq	%r15, %rdx
	subq	%rbp, %rdx
	addq	%rax, %rbp
	leaq	(%r8,%rbp,8), %rbp
	.p2align	4, 0x90
.LBB3_20:                               # %vector.body111
                                        #   Parent Loop BB3_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 397 8                 # GCD.c:397:8
	movdqu	-80(%rbp), %xmm2
	movdqu	-64(%rbp), %xmm3
	movdqu	-48(%rbp), %xmm4
	movdqu	-32(%rbp), %xmm5
	.loc	1 399 11                # GCD.c:399:11
	paddq	%xmm1, %xmm2
	paddq	%xmm0, %xmm3
	paddq	%xmm4, %xmm2
	paddq	%xmm5, %xmm3
	.loc	1 397 8                 # GCD.c:397:8
	movdqu	-16(%rbp), %xmm4
	movdqu	(%rbp), %xmm5
	.loc	1 399 11                # GCD.c:399:11
	paddq	%xmm2, %xmm4
	paddq	%xmm3, %xmm5
	.loc	1 397 8                 # GCD.c:397:8
	movdqu	16(%rbp), %xmm1
	movdqu	32(%rbp), %xmm0
	.loc	1 399 11                # GCD.c:399:11
	paddq	%xmm4, %xmm1
	paddq	%xmm5, %xmm0
	.loc	1 393 9                 # GCD.c:393:9
	subq	$-128, %rbp
	addq	$-16, %rdx
	jne	.LBB3_20
.LBB3_21:                               # %middle.block112
                                        #   in Loop: Header=BB3_12 Depth=1
	cmpq	%r15, %rbx
	.loc	1 399 11                # GCD.c:399:11
	paddq	%xmm1, %xmm0
	pshufd	$78, %xmm0, %xmm1       # xmm1 = xmm0[2,3,0,1]
	paddq	%xmm0, %xmm1
	movd	%xmm1, %rbp
	movq	%r15, %rdx
	je	.LBB3_24
	jmp	.LBB3_22
.Ltmp105:
.LBB3_15:                               #   in Loop: Header=BB3_12 Depth=1
	xorl	%edx, %edx
.LBB3_22:                               # %if.end25.us.preheader
                                        #   in Loop: Header=BB3_12 Depth=1
	.loc	1 325 12                # GCD.c:325:12
	movq	%rbx, %rcx
	subq	%rdx, %rcx
	addq	%r14, %rdx
	leaq	(%r13,%rdx,8), %rdx
	.p2align	4, 0x90
.LBB3_23:                               # %if.end25.us
                                        #   Parent Loop BB3_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp106:
	.loc	1 399 11                # GCD.c:399:11
	addq	(%rdx), %rbp
.Ltmp107:
	#DEBUG_VALUE: main:_21 <- 1
	#DEBUG_VALUE: main:_20 <- %RBP
	#DEBUG_VALUE: main:sum <- %RBP
	.loc	1 391 7                 # GCD.c:391:7
	addq	$8, %rdx
	decq	%rcx
	jne	.LBB3_23
.Ltmp108:
.LBB3_24:                               # %blklab23.loopexit.us
                                        #   in Loop: Header=BB3_12 Depth=1
	#DEBUG_VALUE: main:_23 <- 1
	.loc	1 416 8                 # GCD.c:416:8
	incq	%rsi
.Ltmp109:
	#DEBUG_VALUE: main:_24 <- %RSI
	#DEBUG_VALUE: main:i <- %RSI
	.loc	1 383 6                 # GCD.c:383:6
	addq	%rdi, %r12
	addq	%rbx, %rax
	addq	%rbx, %r14
	cmpq	%rbx, %rsi
	jne	.LBB3_12
.Ltmp110:
.LBB3_25:                               # %if.then40
	#DEBUG_VALUE: main:_27_size <- 4
	.loc	1 428 2                 # GCD.c:428:2
	movl	$32, %edi
	callq	malloc
	movq	%rax, %rbx
.Ltmp111:
	#DEBUG_VALUE: main:_27 <- %RBX
	.loc	1 429 9                 # GCD.c:429:9
	movaps	.LCPI3_1(%rip), %xmm0   # xmm0 = [83,85]
	movups	%xmm0, (%rbx)
	.loc	1 429 35 is_stmt 0      # GCD.c:429:35
	movaps	.LCPI3_2(%rip), %xmm0   # xmm0 = [77,58]
	movups	%xmm0, 16(%rbx)
.Ltmp112:
	#DEBUG_VALUE: main:_27_has_ownership <- 1
	.loc	1 432 2 is_stmt 1       # GCD.c:432:2
	movl	$4, %esi
	movq	%rbx, %rdi
	callq	printf_s
	.loc	1 436 2                 # GCD.c:436:2
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%rbp, %rsi
	callq	printf
.Ltmp113:
	.loc	1 440 2 discriminator 1 # GCD.c:440:2
	movq	(%rsp), %rdi            # 8-byte Reload
	callq	free
.Ltmp114:
	#DEBUG_VALUE: main:data_has_ownership <- 0
	.loc	1 441 2 discriminator 1 # GCD.c:441:2
	movq	%r13, %rdi
	callq	free
.Ltmp115:
	#DEBUG_VALUE: main:gcds_has_ownership <- 0
	.loc	1 442 2 discriminator 1 # GCD.c:442:2
	movq	16(%rsp), %rdi          # 8-byte Reload
	movq	8(%rsp), %rsi           # 8-byte Reload
	callq	free2DArray
.Ltmp116:
	#DEBUG_VALUE: main:_9_has_ownership <- 0
	.loc	1 446 2 discriminator 1 # GCD.c:446:2
	movq	%rbx, %rdi
	callq	free
.Ltmp117:
	#DEBUG_VALUE: main:_27_has_ownership <- 0
	.loc	1 447 2                 # GCD.c:447:2
	xorl	%edi, %edi
	callq	exit
.Ltmp118:
.LBB3_26:                               # %if.end59.critedge
	#DEBUG_VALUE: main:_8 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_9_size <- %EBX
	#DEBUG_VALUE: main:_9 <- %RBP
	.loc	1 442 2 discriminator 1 # GCD.c:442:2
	movq	%rbp, %rdi
	movq	%r14, %rsi
	callq	free2DArray
.Ltmp119:
	#DEBUG_VALUE: main:_9_has_ownership <- 0
	.loc	1 447 2                 # GCD.c:447:2
	xorl	%edi, %edi
	callq	exit
.Ltmp120:
.LBB3_28:                               # %init.exit.thread
	#DEBUG_VALUE: main:_9 <- %RBP
	#DEBUG_VALUE: main:data <- %RAX
	#DEBUG_VALUE: main:_12 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: main:n <- %RBX
	#DEBUG_VALUE: init:n <- %RBX
	#DEBUG_VALUE: init:_5_size <- %RBX
	#DEBUG_VALUE: main:data_size <- 0
	#DEBUG_VALUE: main:data_has_ownership <- 1
	#DEBUG_VALUE: main:_12_has_ownership <- 0
	#DEBUG_VALUE: main:_13_size <- 0
	movq	%r14, 8(%rsp)           # 8-byte Spill
	movq	%rbp, 16(%rsp)          # 8-byte Spill
	xorl	%ebp, %ebp
.Ltmp121:
	.loc	1 365 8                 # GCD.c:365:8
	xorl	%edx, %edx
	movq	%rax, %rdi
	movq	%rdi, (%rsp)            # 8-byte Spill
	movq	%rbx, %rcx
	callq	gcd_array
.Ltmp122:
	movq	%rax, %r13
	#DEBUG_VALUE: main:_15 <- 0
	#DEBUG_VALUE: main:_14 <- 0
	#DEBUG_VALUE: main:_13_has_ownership <- 0
.Ltmp123:
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:sum <- 0
	#DEBUG_VALUE: main:gcds_has_ownership <- 1
	#DEBUG_VALUE: main:gcds_size <- 0
	jmp	.LBB3_25
.Ltmp124:
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
	.asciz	"_5_has_ownership"      # string offset=269
.Linfo_string12:
	.asciz	"_Bool"                 # string offset=286
.Linfo_string13:
	.asciz	"_5_size"               # string offset=292
.Linfo_string14:
	.asciz	"_4"                    # string offset=300
.Linfo_string15:
	.asciz	"i"                     # string offset=303
.Linfo_string16:
	.asciz	"data_has_ownership"    # string offset=305
.Linfo_string17:
	.asciz	"_1_has_ownership"      # string offset=324
.Linfo_string18:
	.asciz	"_1_size"               # string offset=341
.Linfo_string19:
	.asciz	"data_size"             # string offset=349
.Linfo_string20:
	.asciz	"_5"                    # string offset=359
.Linfo_string21:
	.asciz	"data"                  # string offset=362
.Linfo_string22:
	.asciz	"_1"                    # string offset=367
.Linfo_string23:
	.asciz	"gcd"                   # string offset=370
.Linfo_string24:
	.asciz	"gcd_array"             # string offset=374
.Linfo_string25:
	.asciz	"main"                  # string offset=384
.Linfo_string26:
	.asciz	"int"                   # string offset=389
.Linfo_string27:
	.asciz	"a"                     # string offset=393
.Linfo_string28:
	.asciz	"b"                     # string offset=395
.Linfo_string29:
	.asciz	"_2"                    # string offset=397
.Linfo_string30:
	.asciz	"_3"                    # string offset=400
.Linfo_string31:
	.asciz	"_35"                   # string offset=403
.Linfo_string32:
	.asciz	"_34"                   # string offset=407
.Linfo_string33:
	.asciz	"_33"                   # string offset=411
.Linfo_string34:
	.asciz	"_32"                   # string offset=415
.Linfo_string35:
	.asciz	"_31"                   # string offset=419
.Linfo_string36:
	.asciz	"_30"                   # string offset=423
.Linfo_string37:
	.asciz	"_29"                   # string offset=427
.Linfo_string38:
	.asciz	"_28"                   # string offset=431
.Linfo_string39:
	.asciz	"_27"                   # string offset=435
.Linfo_string40:
	.asciz	"_26"                   # string offset=439
.Linfo_string41:
	.asciz	"_25"                   # string offset=443
.Linfo_string42:
	.asciz	"_24"                   # string offset=447
.Linfo_string43:
	.asciz	"_23"                   # string offset=451
.Linfo_string44:
	.asciz	"_22"                   # string offset=455
.Linfo_string45:
	.asciz	"_21"                   # string offset=459
.Linfo_string46:
	.asciz	"_20"                   # string offset=463
.Linfo_string47:
	.asciz	"_19"                   # string offset=467
.Linfo_string48:
	.asciz	"_18"                   # string offset=471
.Linfo_string49:
	.asciz	"_17"                   # string offset=475
.Linfo_string50:
	.asciz	"_16"                   # string offset=479
.Linfo_string51:
	.asciz	"_15"                   # string offset=483
.Linfo_string52:
	.asciz	"_14"                   # string offset=487
.Linfo_string53:
	.asciz	"_13"                   # string offset=491
.Linfo_string54:
	.asciz	"_12"                   # string offset=495
.Linfo_string55:
	.asciz	"_11"                   # string offset=499
.Linfo_string56:
	.asciz	"_10_has_ownership"     # string offset=503
.Linfo_string57:
	.asciz	"_10_size"              # string offset=521
.Linfo_string58:
	.asciz	"j"                     # string offset=530
.Linfo_string59:
	.asciz	"gcds_has_ownership"    # string offset=532
.Linfo_string60:
	.asciz	"gcds_size"             # string offset=551
.Linfo_string61:
	.asciz	"_2_has_ownership"      # string offset=561
.Linfo_string62:
	.asciz	"_2_size"               # string offset=578
.Linfo_string63:
	.asciz	"gcds"                  # string offset=586
.Linfo_string64:
	.asciz	"argc"                  # string offset=591
.Linfo_string65:
	.asciz	"args"                  # string offset=596
.Linfo_string66:
	.asciz	"char"                  # string offset=601
.Linfo_string67:
	.asciz	"_27_has_ownership"     # string offset=606
.Linfo_string68:
	.asciz	"_27_size"              # string offset=624
.Linfo_string69:
	.asciz	"_13_has_ownership"     # string offset=633
.Linfo_string70:
	.asciz	"_13_size"              # string offset=651
.Linfo_string71:
	.asciz	"_12_has_ownership"     # string offset=660
.Linfo_string72:
	.asciz	"_12_size"              # string offset=678
.Linfo_string73:
	.asciz	"_11_has_ownership"     # string offset=687
.Linfo_string74:
	.asciz	"_11_size"              # string offset=705
.Linfo_string75:
	.asciz	"_9_has_ownership"      # string offset=714
.Linfo_string76:
	.asciz	"_9_size_size"          # string offset=731
.Linfo_string77:
	.asciz	"_9_size"               # string offset=744
.Linfo_string78:
	.asciz	"sum"                   # string offset=752
.Linfo_string79:
	.asciz	"max"                   # string offset=756
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
	.quad	.Ltmp21-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp24-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp22-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	81                      # super-register DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp24-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	94                      # super-register DW_OP_reg14
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	94                      # super-register DW_OP_reg14
	.byte	147                     # DW_OP_piece
	.byte	1                       # 1
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp19-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp24-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp36-.Lfunc_begin0
	.quad	.Ltmp37-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp25-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp25-.Lfunc_begin0
	.quad	.Ltmp26-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp36-.Lfunc_begin0
	.quad	.Ltmp37-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp25-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp25-.Lfunc_begin0
	.quad	.Ltmp26-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp21-.Lfunc_begin0
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
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp25-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp25-.Lfunc_begin0
	.quad	.Ltmp26-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp21-.Lfunc_begin0
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
.Ldebug_loc17:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp25-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp25-.Lfunc_begin0
	.quad	.Ltmp26-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp28-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp37-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp27-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp37-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp28-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp37-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp27-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp37-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc23:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp23-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp24-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp24-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp61-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp61-.Lfunc_begin0
	.quad	.Ltmp62-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp60-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp61-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp61-.Lfunc_begin0
	.quad	.Ltmp62-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc33:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc34:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc35:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc36:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp80-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc37:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp78-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc38:
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp112-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp112-.Lfunc_begin0
	.quad	.Ltmp117-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp117-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc39:
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp110-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp110-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	4                       # 4
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc40:
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp109-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp110-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc41:
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp108-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp108-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc42:
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp107-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp107-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc43:
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp107-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp107-.Lfunc_begin0
	.quad	.Ltmp108-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc44:
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp81-.Lfunc_begin0
	.quad	.Ltmp116-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp116-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc45:
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp81-.Lfunc_begin0
	.quad	.Ltmp86-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp118-.Lfunc_begin0
	.quad	.Ltmp120-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc46:
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp109-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp110-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp123-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc47:
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp107-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp107-.Lfunc_begin0
	.quad	.Ltmp108-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp123-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc48:
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp103-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp103-.Lfunc_begin0
	.quad	.Ltmp115-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp115-.Lfunc_begin0
	.quad	.Ltmp123-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp123-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc49:
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp102-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp102-.Lfunc_begin0
	.quad	.Ltmp114-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp114-.Lfunc_begin0
	.quad	.Ltmp120-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp120-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc50:
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp86-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp120-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc51:
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp118-.Lfunc_begin0
	.quad	.Ltmp121-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc52:
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc53:
	.quad	.Ltmp83-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp118-.Lfunc_begin0
	.quad	.Ltmp119-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc54:
	.quad	.Ltmp83-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp118-.Lfunc_begin0
	.quad	.Ltmp119-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc55:
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp101-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp101-.Lfunc_begin0
	.quad	.Ltmp102-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc56:
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp100-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc57:
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp120-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc58:
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp101-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp101-.Lfunc_begin0
	.quad	.Ltmp102-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc59:
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc60:
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp120-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc61:
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp120-.Lfunc_begin0
	.quad	.Ltmp122-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc62:
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp120-.Lfunc_begin0
	.quad	.Ltmp122-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc63:
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp120-.Lfunc_begin0
	.quad	.Ltmp122-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc64:
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp120-.Lfunc_begin0
	.quad	.Ltmp122-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc65:
	.quad	.Ltmp103-.Lfunc_begin0
	.quad	.Ltmp104-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc66:
	.quad	.Ltmp103-.Lfunc_begin0
	.quad	.Ltmp104-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc67:
	.quad	.Ltmp111-.Lfunc_begin0
	.quad	.Ltmp118-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
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
	.byte	10                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
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
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	12                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	13                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	15                      # DW_FORM_udata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	14                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	15                      # Abbreviation Code
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
	.byte	16                      # Abbreviation Code
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
	.byte	17                      # Abbreviation Code
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
	.byte	18                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	19                      # Abbreviation Code
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
	.byte	21                      # Abbreviation Code
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
	.byte	22                      # Abbreviation Code
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
	.byte	23                      # Abbreviation Code
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
	.byte	24                      # Abbreviation Code
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
	.byte	25                      # Abbreviation Code
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
	.long	1997                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x7c6 DW_TAG_compile_unit
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
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1155                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	4                       # Abbrev [4] 0x44:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x53:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x62:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x6e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x7a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x86:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x92:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x9e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	3                       # Abbrev [3] 0xab:0x274 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1150                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	4                       # Abbrev [4] 0xc4:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	1150                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0xd3:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0xe2:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc4            # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	1162                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0xf1:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc5            # DW_AT_location
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x100:0xf DW_TAG_variable
	.long	.Ldebug_loc6            # DW_AT_location
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	99                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x10f:0xf DW_TAG_variable
	.long	.Ldebug_loc7            # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	98                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x11e:0xf DW_TAG_variable
	.long	.Ldebug_loc8            # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	97                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x12d:0xf DW_TAG_variable
	.long	.Ldebug_loc9            # DW_AT_location
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	96                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x13c:0xf DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	95                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x14b:0xf DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	94                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x15a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	93                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x166:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	92                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x172:0xf DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	91                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x181:0xf DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	90                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x190:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	89                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x19c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	88                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1a8:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	87                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1b4:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	86                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x1c0:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	85                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x1cf:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	84                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1de:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	83                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1ea:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	82                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x1f6:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	81                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x205:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	80                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x214:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	79                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x220:0xf DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	78                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x22f:0xf DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	77                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x23e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	76                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x24a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	75                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x256:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	74                      # DW_AT_decl_line
	.long	1162                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x262:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	73                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x26e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	72                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x27a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	71                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x286:0xf DW_TAG_variable
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x295:0xf DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	69                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x2a4:0xf DW_TAG_variable
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	68                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x2b3:0xf DW_TAG_variable
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	67                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x2c2:0xf DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	66                      # DW_AT_decl_line
	.long	1162                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2d1:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	65                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x2dd:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	1162                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2e9:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x2f5:0xf DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	65                      # DW_AT_decl_line
	.long	1150                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x304:0xf DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	73                      # DW_AT_decl_line
	.long	1150                    # DW_AT_type
	.byte	8                       # Abbrev [8] 0x313:0xb DW_TAG_variable
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	1150                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0x31f:0x94 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	947                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x332:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc27           # DW_AT_location
	.long	959                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x33b:0x9 DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	1039                    # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x344:0x9 DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	1105                    # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x34d:0x9 DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	970                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x356:0x9 DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	982                     # DW_AT_abstract_origin
	.byte	12                      # Abbrev [12] 0x35f:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	994                     # DW_AT_abstract_origin
	.byte	12                      # Abbrev [12] 0x365:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1006                    # DW_AT_abstract_origin
	.byte	12                      # Abbrev [12] 0x36b:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1017                    # DW_AT_abstract_origin
	.byte	13                      # Abbrev [13] 0x371:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1028                    # DW_AT_abstract_origin
	.byte	12                      # Abbrev [12] 0x377:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1050                    # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x37d:0x9 DW_TAG_variable
	.long	.Ldebug_loc32           # DW_AT_location
	.long	1061                    # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x386:0x9 DW_TAG_variable
	.long	.Ldebug_loc33           # DW_AT_location
	.long	1072                    # DW_AT_abstract_origin
	.byte	13                      # Abbrev [13] 0x38f:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1083                    # DW_AT_abstract_origin
	.byte	12                      # Abbrev [12] 0x395:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1094                    # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x39b:0x9 DW_TAG_variable
	.long	.Ldebug_loc34           # DW_AT_location
	.long	1116                    # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x3a4:0x9 DW_TAG_variable
	.long	.Ldebug_loc35           # DW_AT_location
	.long	1127                    # DW_AT_abstract_origin
	.byte	14                      # Abbrev [14] 0x3ad:0x5 DW_TAG_variable
	.long	1138                    # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	15                      # Abbrev [15] 0x3b3:0xcb DW_TAG_subprogram
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	245                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1150                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	16                      # Abbrev [16] 0x3bf:0xb DW_TAG_formal_parameter
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	245                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	17                      # Abbrev [17] 0x3ca:0xc DW_TAG_variable
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	258                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	17                      # Abbrev [17] 0x3d6:0xc DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	257                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	17                      # Abbrev [17] 0x3e2:0xc DW_TAG_variable
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	256                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	8                       # Abbrev [8] 0x3ee:0xb DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	255                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	8                       # Abbrev [8] 0x3f9:0xb DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	254                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	8                       # Abbrev [8] 0x404:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	253                     # DW_AT_decl_line
	.long	1162                    # DW_AT_type
	.byte	8                       # Abbrev [8] 0x40f:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	252                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	8                       # Abbrev [8] 0x41a:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	251                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	8                       # Abbrev [8] 0x425:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	250                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	8                       # Abbrev [8] 0x430:0xb DW_TAG_variable
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	249                     # DW_AT_decl_line
	.long	1162                    # DW_AT_type
	.byte	8                       # Abbrev [8] 0x43b:0xb DW_TAG_variable
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	247                     # DW_AT_decl_line
	.long	1162                    # DW_AT_type
	.byte	8                       # Abbrev [8] 0x446:0xb DW_TAG_variable
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	246                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	8                       # Abbrev [8] 0x451:0xb DW_TAG_variable
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	248                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	8                       # Abbrev [8] 0x45c:0xb DW_TAG_variable
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	252                     # DW_AT_decl_line
	.long	1150                    # DW_AT_type
	.byte	8                       # Abbrev [8] 0x467:0xb DW_TAG_variable
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	248                     # DW_AT_decl_line
	.long	1150                    # DW_AT_type
	.byte	8                       # Abbrev [8] 0x472:0xb DW_TAG_variable
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	246                     # DW_AT_decl_line
	.long	1150                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	18                      # Abbrev [18] 0x47e:0x5 DW_TAG_pointer_type
	.long	1155                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x483:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	19                      # Abbrev [19] 0x48a:0x7 DW_TAG_base_type
	.long	.Linfo_string12         # DW_AT_name
	.byte	2                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	20                      # Abbrev [20] 0x491:0x322 DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	302                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1971                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	21                      # Abbrev [21] 0x4ab:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc36           # DW_AT_location
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	302                     # DW_AT_decl_line
	.long	1971                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x4bb:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc37           # DW_AT_location
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	302                     # DW_AT_decl_line
	.long	1978                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x4cb:0x10 DW_TAG_variable
	.long	.Ldebug_loc38           # DW_AT_location
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	335                     # DW_AT_decl_line
	.long	1162                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x4db:0x10 DW_TAG_variable
	.long	.Ldebug_loc39           # DW_AT_location
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	334                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x4eb:0x10 DW_TAG_variable
	.long	.Ldebug_loc40           # DW_AT_location
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	332                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x4fb:0x10 DW_TAG_variable
	.long	.Ldebug_loc41           # DW_AT_location
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	331                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x50b:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	330                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x518:0x10 DW_TAG_variable
	.long	.Ldebug_loc42           # DW_AT_location
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	329                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x528:0x10 DW_TAG_variable
	.long	.Ldebug_loc43           # DW_AT_location
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	328                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x538:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	327                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x545:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	326                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x552:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	325                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x55f:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	324                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x56c:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	323                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x579:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	322                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	24                      # Abbrev [24] 0x586:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	321                     # DW_AT_decl_line
	.long	1162                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x593:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	320                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	24                      # Abbrev [24] 0x5a0:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	319                     # DW_AT_decl_line
	.long	1162                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x5ad:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	318                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	24                      # Abbrev [24] 0x5ba:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	317                     # DW_AT_decl_line
	.long	1162                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x5c7:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	316                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x5d4:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	315                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x5e1:0x10 DW_TAG_variable
	.long	.Ldebug_loc44           # DW_AT_location
	.long	.Linfo_string75         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	314                     # DW_AT_decl_line
	.long	1162                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x5f1:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string76         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	313                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x5fe:0x10 DW_TAG_variable
	.long	.Ldebug_loc45           # DW_AT_location
	.long	.Linfo_string77         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	313                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x60e:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	311                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x61b:0x10 DW_TAG_variable
	.long	.Ldebug_loc46           # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	310                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x62b:0x10 DW_TAG_variable
	.long	.Ldebug_loc47           # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	309                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x63b:0x10 DW_TAG_variable
	.long	.Ldebug_loc48           # DW_AT_location
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	308                     # DW_AT_decl_line
	.long	1162                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x64b:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	307                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x658:0x10 DW_TAG_variable
	.long	.Ldebug_loc49           # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	306                     # DW_AT_decl_line
	.long	1162                    # DW_AT_type
	.byte	23                      # Abbrev [23] 0x668:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	305                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x675:0x10 DW_TAG_variable
	.long	.Ldebug_loc50           # DW_AT_location
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	304                     # DW_AT_decl_line
	.long	1155                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x685:0x10 DW_TAG_variable
	.long	.Ldebug_loc51           # DW_AT_location
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	313                     # DW_AT_decl_line
	.long	1995                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x695:0x10 DW_TAG_variable
	.long	.Ldebug_loc52           # DW_AT_location
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	316                     # DW_AT_decl_line
	.long	1150                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x6a5:0x10 DW_TAG_variable
	.long	.Ldebug_loc53           # DW_AT_location
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	303                     # DW_AT_decl_line
	.long	1150                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x6b5:0x10 DW_TAG_variable
	.long	.Ldebug_loc54           # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	312                     # DW_AT_decl_line
	.long	1150                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x6c5:0x10 DW_TAG_variable
	.long	.Ldebug_loc63           # DW_AT_location
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	318                     # DW_AT_decl_line
	.long	1150                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x6d5:0x10 DW_TAG_variable
	.long	.Ldebug_loc64           # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	305                     # DW_AT_decl_line
	.long	1150                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x6e5:0x10 DW_TAG_variable
	.long	.Ldebug_loc65           # DW_AT_location
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	320                     # DW_AT_decl_line
	.long	1150                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x6f5:0x10 DW_TAG_variable
	.long	.Ldebug_loc66           # DW_AT_location
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	307                     # DW_AT_decl_line
	.long	1150                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x705:0x10 DW_TAG_variable
	.long	.Ldebug_loc67           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	334                     # DW_AT_decl_line
	.long	1150                    # DW_AT_type
	.byte	17                      # Abbrev [17] 0x715:0xc DW_TAG_variable
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	333                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	17                      # Abbrev [17] 0x721:0xc DW_TAG_variable
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	336                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	25                      # Abbrev [25] 0x72d:0x85 DW_TAG_inlined_subroutine
	.long	947                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.short	354                     # DW_AT_call_line
	.byte	10                      # Abbrev [10] 0x739:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc60           # DW_AT_location
	.long	959                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x742:0x9 DW_TAG_variable
	.long	.Ldebug_loc55           # DW_AT_location
	.long	970                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x74b:0x9 DW_TAG_variable
	.long	.Ldebug_loc56           # DW_AT_location
	.long	982                     # DW_AT_abstract_origin
	.byte	12                      # Abbrev [12] 0x754:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	994                     # DW_AT_abstract_origin
	.byte	12                      # Abbrev [12] 0x75a:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1006                    # DW_AT_abstract_origin
	.byte	12                      # Abbrev [12] 0x760:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1017                    # DW_AT_abstract_origin
	.byte	13                      # Abbrev [13] 0x766:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1028                    # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x76c:0x9 DW_TAG_variable
	.long	.Ldebug_loc57           # DW_AT_location
	.long	1039                    # DW_AT_abstract_origin
	.byte	12                      # Abbrev [12] 0x775:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1050                    # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x77b:0x9 DW_TAG_variable
	.long	.Ldebug_loc58           # DW_AT_location
	.long	1061                    # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x784:0x9 DW_TAG_variable
	.long	.Ldebug_loc59           # DW_AT_location
	.long	1072                    # DW_AT_abstract_origin
	.byte	13                      # Abbrev [13] 0x78d:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1083                    # DW_AT_abstract_origin
	.byte	12                      # Abbrev [12] 0x793:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1094                    # DW_AT_abstract_origin
	.byte	12                      # Abbrev [12] 0x799:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1105                    # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x79f:0x9 DW_TAG_variable
	.long	.Ldebug_loc61           # DW_AT_location
	.long	1116                    # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x7a8:0x9 DW_TAG_variable
	.long	.Ldebug_loc62           # DW_AT_location
	.long	1127                    # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	19                      # Abbrev [19] 0x7b3:0x7 DW_TAG_base_type
	.long	.Linfo_string26         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	18                      # Abbrev [18] 0x7ba:0x5 DW_TAG_pointer_type
	.long	1983                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x7bf:0x5 DW_TAG_pointer_type
	.long	1988                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x7c4:0x7 DW_TAG_base_type
	.long	.Linfo_string66         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	18                      # Abbrev [18] 0x7cb:0x5 DW_TAG_pointer_type
	.long	1150                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp90-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.quad	.Ltmp95-.Lfunc_begin0
	.quad	.Ltmp96-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.quad	.Ltmp98-.Lfunc_begin0
	.quad	.Ltmp99-.Lfunc_begin0
	.quad	.Ltmp102-.Lfunc_begin0
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
	.long	2001                    # Compilation Unit Length
	.long	947                     # DIE offset
	.asciz	"init"                  # External Name
	.long	1169                    # DIE offset
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
	.long	2001                    # Compilation Unit Length
	.long	1155                    # DIE offset
	.asciz	"long long int"         # External Name
	.long	1162                    # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	1971                    # DIE offset
	.asciz	"int"                   # External Name
	.long	1988                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
