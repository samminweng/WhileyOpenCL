	.text
	.file	"llvm/GCD.polly.disablevc.ll"
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
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: init:_5 <- %RAX
	.loc	1 258 6                 # GCD.c:258:6
	testq	%rbx, %rbx
	jle	.LBB2_5
.Ltmp44:
# BB#1:                                 # %if.end.preheader
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: init:n <- %RBX
	.loc	1 260 6                 # GCD.c:260:6
	leaq	-1(%rbx), %rdx
	xorl	%ecx, %ecx
	movq	%rbx, %rsi
	andq	$3, %rsi
	je	.LBB2_3
.Ltmp45:
	.p2align	4, 0x90
.LBB2_2:                                # %if.end.prol
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 264 11                # GCD.c:264:11
	addq	%rcx, (%rax,%rcx,8)
.Ltmp46:
	#DEBUG_VALUE: init:_9 <- 1
	.loc	1 268 8                 # GCD.c:268:8
	incq	%rcx
.Ltmp47:
	#DEBUG_VALUE: init:_10 <- %RCX
	#DEBUG_VALUE: init:i <- %RCX
	.loc	1 258 6                 # GCD.c:258:6
	cmpq	%rcx, %rsi
	jne	.LBB2_2
.Ltmp48:
.LBB2_3:                                # %if.end.preheader.split
	.loc	1 260 6                 # GCD.c:260:6
	cmpq	$3, %rdx
	jb	.LBB2_5
	.p2align	4, 0x90
.LBB2_4:                                # %if.end
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 264 11                # GCD.c:264:11
	addq	%rcx, (%rax,%rcx,8)
	#DEBUG_VALUE: init:_9 <- 1
	.loc	1 260 6                 # GCD.c:260:6
	movq	8(%rax,%rcx,8), %rdx
	.loc	1 264 11                # GCD.c:264:11
	leaq	1(%rcx,%rdx), %rdx
	movq	%rdx, 8(%rax,%rcx,8)
	.loc	1 260 6                 # GCD.c:260:6
	movq	16(%rax,%rcx,8), %rdx
	.loc	1 264 11                # GCD.c:264:11
	leaq	2(%rcx,%rdx), %rdx
	movq	%rdx, 16(%rax,%rcx,8)
	.loc	1 260 6                 # GCD.c:260:6
	movq	24(%rax,%rcx,8), %rdx
	.loc	1 264 11                # GCD.c:264:11
	leaq	3(%rcx,%rdx), %rdx
	movq	%rdx, 24(%rax,%rcx,8)
	.loc	1 268 8                 # GCD.c:268:8
	addq	$4, %rcx
	.loc	1 258 6                 # GCD.c:258:6
	cmpq	%rcx, %rbx
	jne	.LBB2_4
.Ltmp49:
.LBB2_5:                                # %blklab18
	.loc	1 277 2                 # GCD.c:277:2
	popq	%rbx
	retq
.Ltmp50:
.Lfunc_end2:
	.size	init, .Lfunc_end2-init
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI3_0:
	.quad	83                      # 0x53
	.quad	85                      # 0x55
.LCPI3_1:
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
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
.Ltmp57:
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
.Ltmp58:
	#DEBUG_VALUE: main:_9 <- %RAX
	.loc	1 314 6                 # GCD.c:314:6
	movq	(%rax), %rdi
.Ltmp59:
	#DEBUG_VALUE: main:_11 <- %RDI
	.loc	1 316 2                 # GCD.c:316:2
	callq	parseStringToInt
.Ltmp60:
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_8 <- %RAX
	.loc	1 320 9                 # GCD.c:320:9
	testq	%rax, %rax
	je	.LBB3_13
.Ltmp61:
# BB#1:                                 # %if.end
	#DEBUG_VALUE: main:_8 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	.loc	1 322 6                 # GCD.c:322:6
	movq	(%rax), %r14
.Ltmp62:
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
.Ltmp63:
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: main:_12 <- %RAX
	#DEBUG_VALUE: main:data <- %RAX
	.loc	1 258 6                 # GCD.c:258:6
	testq	%r14, %r14
	jle	.LBB3_14
.Ltmp64:
# BB#2:                                 # %if.end.i.preheader
	#DEBUG_VALUE: main:data <- %RAX
	#DEBUG_VALUE: main:_12 <- %RAX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: main:n <- %R14
	#DEBUG_VALUE: init:n <- %R14
	#DEBUG_VALUE: init:_5_size <- %R14
	.loc	1 260 6                 # GCD.c:260:6
	leaq	-1(%r14), %r15
	xorl	%ecx, %ecx
	movq	%r14, %rdx
	andq	$3, %rdx
	je	.LBB3_4
.Ltmp65:
	.p2align	4, 0x90
.LBB3_3:                                # %if.end.i.prol
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 264 11                # GCD.c:264:11
	addq	%rcx, (%rax,%rcx,8)
.Ltmp66:
	#DEBUG_VALUE: init:_9 <- 1
	.loc	1 268 8                 # GCD.c:268:8
	incq	%rcx
.Ltmp67:
	#DEBUG_VALUE: init:_10 <- %RCX
	#DEBUG_VALUE: init:i <- %RCX
	.loc	1 258 6                 # GCD.c:258:6
	cmpq	%rcx, %rdx
	jne	.LBB3_3
.Ltmp68:
.LBB3_4:                                # %if.end.i.preheader.split
	.loc	1 260 6                 # GCD.c:260:6
	cmpq	$3, %r15
	jb	.LBB3_6
	.p2align	4, 0x90
.LBB3_5:                                # %if.end.i
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 264 11                # GCD.c:264:11
	addq	%rcx, (%rax,%rcx,8)
	#DEBUG_VALUE: init:_9 <- 1
	.loc	1 260 6                 # GCD.c:260:6
	movq	8(%rax,%rcx,8), %rdx
	.loc	1 264 11                # GCD.c:264:11
	leaq	1(%rcx,%rdx), %rdx
	movq	%rdx, 8(%rax,%rcx,8)
	.loc	1 260 6                 # GCD.c:260:6
	movq	16(%rax,%rcx,8), %rdx
	.loc	1 264 11                # GCD.c:264:11
	leaq	2(%rcx,%rdx), %rdx
	movq	%rdx, 16(%rax,%rcx,8)
	.loc	1 260 6                 # GCD.c:260:6
	movq	24(%rax,%rcx,8), %rdx
	.loc	1 264 11                # GCD.c:264:11
	leaq	3(%rcx,%rdx), %rdx
	movq	%rdx, 24(%rax,%rcx,8)
	.loc	1 268 8                 # GCD.c:268:8
	addq	$4, %rcx
	.loc	1 258 6                 # GCD.c:258:6
	cmpq	%rcx, %r14
	jne	.LBB3_5
.Ltmp69:
.LBB3_6:                                # %while.cond9.preheader.us.preheader
	#DEBUG_VALUE: main:data_size <- 0
	#DEBUG_VALUE: main:_13_size <- 0
	.loc	1 329 8                 # GCD.c:329:8
	movq	%rax, %rdi
	movq	%r14, %rdx
	callq	gcd_array
.Ltmp70:
	#DEBUG_VALUE: main:_13 <- %RAX
	#DEBUG_VALUE: main:gcds <- %RAX
	#DEBUG_VALUE: main:_15 <- 0
	#DEBUG_VALUE: main:_14 <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:sum <- 0
	#DEBUG_VALUE: main:gcds_size <- 0
	.loc	1 353 9                 # GCD.c:353:9
	movl	%r14d, %ecx
	andl	$3, %ecx
	leaq	(,%r14,8), %r8
	xorl	%ebx, %ebx
	xorl	%esi, %esi
.Ltmp71:
	.p2align	4, 0x90
.LBB3_7:                                # %while.cond9.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_8 Depth 2
                                        #     Child Loop BB3_10 Depth 2
	testq	%rcx, %rcx
	movq	%rax, %rdx
	movl	$0, %edi
	je	.LBB3_9
	.p2align	4, 0x90
.LBB3_8:                                # %if.end14.us.prol
                                        #   Parent Loop BB3_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 359 11                # GCD.c:359:11
	addq	(%rdx), %rbx
.Ltmp72:
	#DEBUG_VALUE: main:_21 <- 1
	#DEBUG_VALUE: main:_20 <- %RBX
	#DEBUG_VALUE: main:sum <- %RBX
	.loc	1 365 9                 # GCD.c:365:9
	incq	%rdi
.Ltmp73:
	#DEBUG_VALUE: main:_22 <- %RDI
	#DEBUG_VALUE: main:j <- %RDI
	.loc	1 351 7                 # GCD.c:351:7
	addq	$8, %rdx
	cmpq	%rdi, %rcx
	jne	.LBB3_8
.Ltmp74:
.LBB3_9:                                # %while.cond9.preheader.us.split
                                        #   in Loop: Header=BB3_7 Depth=1
	cmpq	$3, %r15
	jb	.LBB3_11
	.p2align	4, 0x90
.LBB3_10:                               # %if.end14.us
                                        #   Parent Loop BB3_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 359 11                # GCD.c:359:11
	addq	(%rax,%rdi,8), %rbx
	#DEBUG_VALUE: main:_21 <- 1
.Ltmp75:
	#DEBUG_VALUE: main:_20 <- %RBX
	#DEBUG_VALUE: main:sum <- %RBX
	addq	8(%rax,%rdi,8), %rbx
.Ltmp76:
	addq	16(%rax,%rdi,8), %rbx
	addq	24(%rax,%rdi,8), %rbx
	.loc	1 365 9                 # GCD.c:365:9
	addq	$4, %rdi
	.loc	1 351 7                 # GCD.c:351:7
	cmpq	%rdi, %r14
	jne	.LBB3_10
.Ltmp77:
.LBB3_11:                               # %blklab23.loopexit.us
                                        #   in Loop: Header=BB3_7 Depth=1
	#DEBUG_VALUE: main:_23 <- 1
	.loc	1 376 8                 # GCD.c:376:8
	incq	%rsi
.Ltmp78:
	#DEBUG_VALUE: main:_24 <- %RSI
	#DEBUG_VALUE: main:i <- %RSI
	.loc	1 343 6                 # GCD.c:343:6
	addq	%r8, %rax
	cmpq	%r14, %rsi
	jne	.LBB3_7
.Ltmp79:
.LBB3_12:                               # %blklab21
	#DEBUG_VALUE: main:_27_size <- 4
	.loc	1 387 2                 # GCD.c:387:2
	movl	$32, %edi
	callq	malloc
.Ltmp80:
	#DEBUG_VALUE: main:_27 <- %RAX
	.loc	1 388 9                 # GCD.c:388:9
	movaps	.LCPI3_0(%rip), %xmm0   # xmm0 = [83,85]
	movups	%xmm0, (%rax)
	.loc	1 388 35 is_stmt 0      # GCD.c:388:35
	movaps	.LCPI3_1(%rip), %xmm0   # xmm0 = [77,58]
	movups	%xmm0, 16(%rax)
	.loc	1 390 2 is_stmt 1       # GCD.c:390:2
	movl	$4, %esi
	movq	%rax, %rdi
	callq	printf_s
.Ltmp81:
	.loc	1 394 2                 # GCD.c:394:2
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	printf
.LBB3_13:                               # %blklab20
	.loc	1 398 2                 # GCD.c:398:2
	xorl	%edi, %edi
	callq	exit
.LBB3_14:                               # %init.exit.thread
.Ltmp82:
	#DEBUG_VALUE: main:data <- %RAX
	#DEBUG_VALUE: main:_12 <- %RAX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: main:n <- %R14
	#DEBUG_VALUE: init:n <- %R14
	#DEBUG_VALUE: init:_5_size <- %R14
	#DEBUG_VALUE: main:data_size <- 0
	#DEBUG_VALUE: main:_13_size <- 0
	.loc	1 329 8                 # GCD.c:329:8
	movq	%rax, %rdi
	movq	%r14, %rdx
	callq	gcd_array
.Ltmp83:
	xorl	%ebx, %ebx
	#DEBUG_VALUE: main:_15 <- 0
	#DEBUG_VALUE: main:_14 <- 0
.Ltmp84:
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:sum <- 0
	#DEBUG_VALUE: main:gcds_size <- 0
	jmp	.LBB3_12
.Ltmp85:
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
	.asciz	"data"                  # string offset=300
.Linfo_string17:
	.asciz	"_5"                    # string offset=305
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
	.quad	.Ltmp45-.Lfunc_begin0
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
	.quad	.Ltmp47-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc33:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc34:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc35:
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp62-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp62-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc36:
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp72-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp76-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc37:
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp78-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc38:
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc39:
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp72-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp76-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc40:
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp72-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc41:
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc42:
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc43:
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp78-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc44:
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	4                       # 4
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc45:
	.quad	.Ltmp58-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc46:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc47:
	.quad	.Ltmp60-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc48:
	.quad	.Ltmp60-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc49:
	.quad	.Ltmp62-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp67-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc50:
	.quad	.Ltmp62-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc51:
	.quad	.Ltmp62-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc52:
	.quad	.Ltmp62-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp67-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc53:
	.quad	.Ltmp62-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc54:
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc55:
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc56:
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc57:
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc58:
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc59:
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc60:
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
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
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	1766                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x6df DW_TAG_compile_unit
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
	.long	.Linfo_string17         # DW_AT_name
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
	.long	.Linfo_string16         # DW_AT_name
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
	.byte	236                     # DW_AT_decl_line
	.long	1039                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x3f8:0xb DW_TAG_variable
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	239                     # DW_AT_decl_line
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
	.byte	17                      # Abbrev [17] 0x41b:0x2b1 DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	281                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1740                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	18                      # Abbrev [18] 0x435:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc33           # DW_AT_location
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	281                     # DW_AT_decl_line
	.long	1740                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x445:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc34           # DW_AT_location
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	281                     # DW_AT_decl_line
	.long	1747                    # DW_AT_type
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
	.byte	19                      # Abbrev [19] 0x49f:0x10 DW_TAG_variable
	.long	.Ldebug_loc38           # DW_AT_location
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	288                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x4af:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	290                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x4bc:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	290                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x4c9:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	291                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x4d6:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	292                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x4e3:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	293                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x4f0:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	294                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x4fd:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	295                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x50a:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	296                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x517:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	297                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x524:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	298                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x531:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	299                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x53e:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	300                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x54b:0x10 DW_TAG_variable
	.long	.Ldebug_loc39           # DW_AT_location
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	301                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x55b:0x10 DW_TAG_variable
	.long	.Ldebug_loc40           # DW_AT_location
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	302                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x56b:0x10 DW_TAG_variable
	.long	.Ldebug_loc41           # DW_AT_location
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	303                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x57b:0x10 DW_TAG_variable
	.long	.Ldebug_loc42           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	304                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x58b:0x10 DW_TAG_variable
	.long	.Ldebug_loc43           # DW_AT_location
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	305                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x59b:0x10 DW_TAG_variable
	.long	.Ldebug_loc44           # DW_AT_location
	.long	.Linfo_string66         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	307                     # DW_AT_decl_line
	.long	1044                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x5ab:0x10 DW_TAG_variable
	.long	.Ldebug_loc45           # DW_AT_location
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	290                     # DW_AT_decl_line
	.long	1764                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x5bb:0x10 DW_TAG_variable
	.long	.Ldebug_loc46           # DW_AT_location
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	292                     # DW_AT_decl_line
	.long	1039                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x5cb:0x10 DW_TAG_variable
	.long	.Ldebug_loc47           # DW_AT_location
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	282                     # DW_AT_decl_line
	.long	1039                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x5db:0x10 DW_TAG_variable
	.long	.Ldebug_loc48           # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	289                     # DW_AT_decl_line
	.long	1039                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x5eb:0x10 DW_TAG_variable
	.long	.Ldebug_loc56           # DW_AT_location
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	293                     # DW_AT_decl_line
	.long	1039                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x5fb:0x10 DW_TAG_variable
	.long	.Ldebug_loc57           # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	284                     # DW_AT_decl_line
	.long	1039                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x60b:0x10 DW_TAG_variable
	.long	.Ldebug_loc58           # DW_AT_location
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	294                     # DW_AT_decl_line
	.long	1039                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x61b:0x10 DW_TAG_variable
	.long	.Ldebug_loc59           # DW_AT_location
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	285                     # DW_AT_decl_line
	.long	1039                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x62b:0x10 DW_TAG_variable
	.long	.Ldebug_loc60           # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	307                     # DW_AT_decl_line
	.long	1039                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x63b:0xc DW_TAG_variable
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	306                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	21                      # Abbrev [21] 0x647:0xc DW_TAG_variable
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	308                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	22                      # Abbrev [22] 0x653:0x78 DW_TAG_inlined_subroutine
	.long	872                     # DW_AT_abstract_origin
	.quad	.Ltmp62                 # DW_AT_low_pc
	.long	.Ltmp69-.Ltmp62         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.short	324                     # DW_AT_call_line
	.byte	9                       # Abbrev [9] 0x667:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc53           # DW_AT_location
	.long	884                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x670:0x9 DW_TAG_variable
	.long	.Ldebug_loc49           # DW_AT_location
	.long	895                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x679:0x9 DW_TAG_variable
	.long	.Ldebug_loc50           # DW_AT_location
	.long	906                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x682:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	917                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x688:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	928                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x68e:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	939                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x694:0x9 DW_TAG_variable
	.long	.Ldebug_loc51           # DW_AT_location
	.long	950                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x69d:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	961                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x6a3:0x9 DW_TAG_variable
	.long	.Ldebug_loc52           # DW_AT_location
	.long	972                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x6ac:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	983                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x6b2:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	994                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x6b8:0x9 DW_TAG_variable
	.long	.Ldebug_loc54           # DW_AT_location
	.long	1005                    # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x6c1:0x9 DW_TAG_variable
	.long	.Ldebug_loc55           # DW_AT_location
	.long	1016                    # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	16                      # Abbrev [16] 0x6cc:0x7 DW_TAG_base_type
	.long	.Linfo_string22         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	15                      # Abbrev [15] 0x6d3:0x5 DW_TAG_pointer_type
	.long	1752                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x6d8:0x5 DW_TAG_pointer_type
	.long	1757                    # DW_AT_type
	.byte	16                      # Abbrev [16] 0x6dd:0x7 DW_TAG_base_type
	.long	.Linfo_string59         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	15                      # Abbrev [15] 0x6e4:0x5 DW_TAG_pointer_type
	.long	1039                    # DW_AT_type
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
	.long	1770                    # Compilation Unit Length
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
	.long	1770                    # Compilation Unit Length
	.long	1044                    # DIE offset
	.asciz	"long long int"         # External Name
	.long	1740                    # DIE offset
	.asciz	"int"                   # External Name
	.long	1757                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
