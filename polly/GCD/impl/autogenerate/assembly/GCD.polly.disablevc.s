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
	#DEBUG_VALUE: gcd_array:_37 <- 0
	#DEBUG_VALUE: gcd_array:_36 <- 0
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
	#DEBUG_VALUE: gcd_array:_11_size <- 0
	#DEBUG_VALUE: gcd_array:_10 <- 0
	#DEBUG_VALUE: gcd_array:_9 <- 0
	#DEBUG_VALUE: gcd_array:b <- 0
	#DEBUG_VALUE: gcd_array:a <- 0
	#DEBUG_VALUE: gcd_array:j <- 0
	#DEBUG_VALUE: gcd_array:i <- 0
	#DEBUG_VALUE: gcd_array:sum <- 0
	#DEBUG_VALUE: gcd_array:gcds_size <- 0
	#DEBUG_VALUE: gcd_array:_2_size <- 0
	#DEBUG_VALUE: gcd_array:data <- %RBX
	.loc	1 102 7 prologue_end    # GCD.c:102:7
	movl	%r14d, %esi
.Ltmp17:
	imull	%esi, %esi
	xorl	%r15d, %r15d
	.loc	1 104 2                 # GCD.c:104:2
	xorl	%edi, %edi
	callq	gen1DArray
.Ltmp18:
	#DEBUG_VALUE: gcd_array:gcds <- %RAX
	#DEBUG_VALUE: gcd_array:_11 <- %RAX
	.loc	1 118 6                 # GCD.c:118:6
	testq	%r14, %r14
	jle	.LBB1_11
.Ltmp19:
	.p2align	4, 0x90
.LBB1_1:                                # %while.cond3.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
                                        #       Child Loop BB1_5 Depth 3
	.loc	1 140 9                 # GCD.c:140:9
	movq	%r15, %r8
	imulq	%r14, %r8
.Ltmp20:
	#DEBUG_VALUE: gcd_array:_32 <- %R8
	#DEBUG_VALUE: gcd_array:_28 <- %R8
	#DEBUG_VALUE: gcd_array:_22 <- %R8
	#DEBUG_VALUE: gcd_array:_18 <- %R8
	xorl	%edx, %edx
.Ltmp21:
	.p2align	4, 0x90
.LBB1_2:                                # %if.end8.us
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_5 Depth 3
	.loc	1 128 8                 # GCD.c:128:8
	movq	(%rbx,%r15,8), %rcx
.Ltmp22:
	#DEBUG_VALUE: gcd_array:_15 <- %RCX
	#DEBUG_VALUE: gcd_array:a <- %RCX
	.loc	1 132 8                 # GCD.c:132:8
	movq	(%rbx,%rdx,8), %rdi
	#DEBUG_VALUE: gcd_array:_17 <- 0
.Ltmp23:
	#DEBUG_VALUE: gcd_array:_16 <- %RDI
	#DEBUG_VALUE: gcd_array:b <- %RDI
	.loc	1 138 8                 # GCD.c:138:8
	testq	%rcx, %rcx
.Ltmp24:
	.loc	1 138 7 is_stmt 0       # GCD.c:138:7
	je	.LBB1_8
.Ltmp25:
# BB#3:                                 # %while.cond20.preheader.us
                                        #   in Loop: Header=BB1_2 Depth=2
	#DEBUG_VALUE: gcd_array:b <- %RDI
	#DEBUG_VALUE: gcd_array:_16 <- %RDI
	#DEBUG_VALUE: gcd_array:a <- %RCX
	#DEBUG_VALUE: gcd_array:_15 <- %RCX
	#DEBUG_VALUE: gcd_array:_24 <- 0
	js	.LBB1_7
.Ltmp26:
# BB#4:                                 # %blklab15.lr.ph.us.preheader
                                        #   in Loop: Header=BB1_2 Depth=2
	#DEBUG_VALUE: gcd_array:_15 <- %RCX
	#DEBUG_VALUE: gcd_array:a <- %RCX
	#DEBUG_VALUE: gcd_array:_16 <- %RDI
	#DEBUG_VALUE: gcd_array:b <- %RDI
	.loc	1 175 9 is_stmt 1       # GCD.c:175:9
	testq	%rdi, %rdi
	je	.LBB1_13
.Ltmp27:
	.p2align	4, 0x90
.LBB1_5:                                # %blklab15.us136
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	#DEBUG_VALUE: gcd_array:_25 <- 0
	.loc	1 177 8                 # GCD.c:177:8
	movq	%rcx, %rsi
	subq	%rdi, %rsi
	jle	.LBB1_12
# BB#6:                                 # %if.end34.us140
                                        #   in Loop: Header=BB1_5 Depth=3
	#DEBUG_VALUE: gcd_array:_24 <- 0
	movq	%rsi, %rcx
	jns	.LBB1_5
	jmp	.LBB1_7
.LBB1_12:                               # %blklab16.us-lcssa.us146
                                        #   in Loop: Header=BB1_5 Depth=3
	#DEBUG_VALUE: gcd_array:_24 <- 0
	.loc	1 175 8                 # GCD.c:175:8
	subq	%rcx, %rdi
	jne	.LBB1_5
.Ltmp28:
.LBB1_13:                               # %blklab13.us-lcssa.us.us
                                        #   in Loop: Header=BB1_2 Depth=2
	#DEBUG_VALUE: gcd_array:_25 <- 0
	.loc	1 200 11                # GCD.c:200:11
	leaq	(%rdx,%r8), %rsi
.Ltmp29:
	#DEBUG_VALUE: gcd_array:_33 <- %RSI
	#DEBUG_VALUE: gcd_array:_29 <- %RSI
	.loc	1 210 14                # GCD.c:210:14
	addq	%rcx, (%rax,%rsi,8)
	jmp	.LBB1_9
.Ltmp30:
	.p2align	4, 0x90
.LBB1_8:                                # %if.end13.us
                                        #   in Loop: Header=BB1_2 Depth=2
	#DEBUG_VALUE: gcd_array:b <- %RDI
	#DEBUG_VALUE: gcd_array:_16 <- %RDI
	#DEBUG_VALUE: gcd_array:a <- %RCX
	#DEBUG_VALUE: gcd_array:_15 <- %RCX
	.loc	1 142 11                # GCD.c:142:11
	leaq	(%rdx,%r8), %rcx
.Ltmp31:
	#DEBUG_VALUE: gcd_array:_23 <- %RCX
	#DEBUG_VALUE: gcd_array:_19 <- %RCX
	.loc	1 152 14                # GCD.c:152:14
	addq	%rdi, (%rax,%rcx,8)
.Ltmp32:
.LBB1_9:                                # %blklab12.us
                                        #   in Loop: Header=BB1_2 Depth=2
	#DEBUG_VALUE: gcd_array:_34 <- 1
	.loc	1 216 9                 # GCD.c:216:9
	incq	%rdx
.Ltmp33:
	#DEBUG_VALUE: gcd_array:_35 <- %RDX
	#DEBUG_VALUE: gcd_array:j <- %RDX
	.loc	1 126 8                 # GCD.c:126:8
	cmpq	%r14, %rdx
	jl	.LBB1_2
.Ltmp34:
# BB#10:                                # %blklab9.loopexit.us
                                        #   in Loop: Header=BB1_1 Depth=1
	#DEBUG_VALUE: gcd_array:j <- %RDX
	#DEBUG_VALUE: gcd_array:_35 <- %RDX
	#DEBUG_VALUE: gcd_array:_36 <- 1
	.loc	1 227 8                 # GCD.c:227:8
	incq	%r15
.Ltmp35:
	#DEBUG_VALUE: gcd_array:_37 <- %R15
	#DEBUG_VALUE: gcd_array:i <- %R15
	.loc	1 118 7                 # GCD.c:118:7
	cmpq	%r14, %r15
	jl	.LBB1_1
.Ltmp36:
.LBB1_11:                               # %blklab7
	.loc	1 236 2                 # GCD.c:236:2
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.LBB1_7:                                # %if.end25
.Ltmp37:
	.loc	1 166 14                # GCD.c:166:14
	movq	stderr(%rip), %rcx
	.loc	1 166 6 is_stmt 0       # GCD.c:166:6
	movl	$.L.str, %edi
	movl	$4, %esi
	movl	$1, %edx
	callq	fwrite
	.loc	1 167 6 is_stmt 1       # GCD.c:167:6
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
	.loc	1 240 0                 # GCD.c:240:0
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
	.loc	1 254 2 prologue_end    # GCD.c:254:2
	xorl	%edi, %edi
	movl	%ebx, %esi
	callq	gen1DArray
.Ltmp43:
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: init:_5 <- %RAX
	.loc	1 264 6                 # GCD.c:264:6
	testq	%rbx, %rbx
	jle	.LBB2_5
.Ltmp44:
# BB#1:                                 # %if.end.preheader
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: init:n <- %RBX
	.loc	1 266 6                 # GCD.c:266:6
	leaq	-1(%rbx), %rdx
	xorl	%ecx, %ecx
	movq	%rbx, %rsi
	andq	$3, %rsi
	je	.LBB2_3
.Ltmp45:
	.p2align	4, 0x90
.LBB2_2:                                # %if.end.prol
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 270 11                # GCD.c:270:11
	addq	%rcx, (%rax,%rcx,8)
.Ltmp46:
	#DEBUG_VALUE: init:_9 <- 1
	.loc	1 274 8                 # GCD.c:274:8
	incq	%rcx
.Ltmp47:
	#DEBUG_VALUE: init:_10 <- %RCX
	#DEBUG_VALUE: init:i <- %RCX
	.loc	1 264 6                 # GCD.c:264:6
	cmpq	%rcx, %rsi
	jne	.LBB2_2
.Ltmp48:
.LBB2_3:                                # %if.end.preheader.split
	.loc	1 266 6                 # GCD.c:266:6
	cmpq	$3, %rdx
	jb	.LBB2_5
	.p2align	4, 0x90
.LBB2_4:                                # %if.end
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 270 11                # GCD.c:270:11
	addq	%rcx, (%rax,%rcx,8)
	#DEBUG_VALUE: init:_9 <- 1
	.loc	1 266 6                 # GCD.c:266:6
	movq	8(%rax,%rcx,8), %rdx
	.loc	1 270 11                # GCD.c:270:11
	leaq	1(%rcx,%rdx), %rdx
	movq	%rdx, 8(%rax,%rcx,8)
	.loc	1 266 6                 # GCD.c:266:6
	movq	16(%rax,%rcx,8), %rdx
	.loc	1 270 11                # GCD.c:270:11
	leaq	2(%rcx,%rdx), %rdx
	movq	%rdx, 16(%rax,%rcx,8)
	.loc	1 266 6                 # GCD.c:266:6
	movq	24(%rax,%rcx,8), %rdx
	.loc	1 270 11                # GCD.c:270:11
	leaq	3(%rcx,%rdx), %rdx
	movq	%rdx, 24(%rax,%rcx,8)
	.loc	1 274 8                 # GCD.c:274:8
	addq	$4, %rcx
	.loc	1 264 6                 # GCD.c:264:6
	cmpq	%rcx, %rbx
	jne	.LBB2_4
.Ltmp49:
.LBB2_5:                                # %blklab18
	.loc	1 283 2                 # GCD.c:283:2
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
	.loc	1 287 0                 # GCD.c:287:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 254 2 prologue_end    # GCD.c:254:2
	pushq	%rbx
.Ltmp51:
	.cfi_def_cfa_offset 16
.Ltmp52:
	.cfi_offset %rbx, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
.Ltmp53:
	#DEBUG_VALUE: main:n <- 1000
	#DEBUG_VALUE: main:data_size <- 0
	#DEBUG_VALUE: main:gcds_size <- 0
	#DEBUG_VALUE: main:sum <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_7 <- 1000
	#DEBUG_VALUE: main:_8_size <- 0
	#DEBUG_VALUE: main:_9_size <- 0
	#DEBUG_VALUE: main:_10 <- 0
	#DEBUG_VALUE: main:_11 <- 0
	#DEBUG_VALUE: main:_12 <- 0
	#DEBUG_VALUE: main:_13 <- 0
	#DEBUG_VALUE: main:_14 <- 0
	#DEBUG_VALUE: main:_15 <- 0
	#DEBUG_VALUE: main:_16 <- 0
	#DEBUG_VALUE: main:_17 <- 0
	#DEBUG_VALUE: main:_18 <- 0
	#DEBUG_VALUE: main:_19 <- 0
	#DEBUG_VALUE: main:_20 <- 0
	#DEBUG_VALUE: main:_23_size <- 0
	#DEBUG_VALUE: init:n <- 1000
	#DEBUG_VALUE: init:_1_size <- 0
	#DEBUG_VALUE: init:data_size <- 0
	#DEBUG_VALUE: init:i <- 0
	#DEBUG_VALUE: init:_4 <- 0
	#DEBUG_VALUE: init:_5_size <- 1000
	#DEBUG_VALUE: init:_6 <- 0
	#DEBUG_VALUE: init:_7 <- 0
	#DEBUG_VALUE: init:_8 <- 0
	#DEBUG_VALUE: init:_9 <- 0
	#DEBUG_VALUE: init:_10 <- 0
	xorl	%edi, %edi
.Ltmp54:
	movl	$1000, %esi             # imm = 0x3E8
.Ltmp55:
	callq	gen1DArray
.Ltmp56:
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: main:_8 <- %RAX
	#DEBUG_VALUE: main:data <- %RAX
	#DEBUG_VALUE: init:data_size <- 1000
	movl	$4, %ecx
.Ltmp57:
	.p2align	4, 0x90
.LBB3_1:                                # %if.end.i
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 266 6                 # GCD.c:266:6
	movq	-32(%rax,%rcx,8), %rdx
.Ltmp58:
	#DEBUG_VALUE: init:_7 <- %RDX
	.loc	1 270 11                # GCD.c:270:11
	leaq	-4(%rcx,%rdx), %rdx
.Ltmp59:
	movq	%rdx, -32(%rax,%rcx,8)
.Ltmp60:
	#DEBUG_VALUE: init:_9 <- 1
	.loc	1 266 6                 # GCD.c:266:6
	movq	-24(%rax,%rcx,8), %rdx
	.loc	1 270 11                # GCD.c:270:11
	leaq	-3(%rcx,%rdx), %rdx
	movq	%rdx, -24(%rax,%rcx,8)
	.loc	1 266 6                 # GCD.c:266:6
	movq	-16(%rax,%rcx,8), %rdx
	.loc	1 270 11                # GCD.c:270:11
	leaq	-2(%rcx,%rdx), %rdx
	movq	%rdx, -16(%rax,%rcx,8)
	.loc	1 266 6                 # GCD.c:266:6
	movq	-8(%rax,%rcx,8), %rdx
	.loc	1 270 11                # GCD.c:270:11
	leaq	-1(%rcx,%rdx), %rdx
	movq	%rdx, -8(%rax,%rcx,8)
	addq	%rcx, (%rax,%rcx,8)
	.loc	1 264 6                 # GCD.c:264:6
	addq	$5, %rcx
	cmpq	$1004, %rcx             # imm = 0x3EC
	jne	.LBB3_1
.Ltmp61:
# BB#2:                                 # %init.exit
	#DEBUG_VALUE: main:data_size <- 0
	#DEBUG_VALUE: main:_9_size <- 0
	.loc	1 321 7                 # GCD.c:321:7
	movl	$1000, %edx             # imm = 0x3E8
	movq	%rax, %rdi
	callq	gcd_array
.Ltmp62:
	#DEBUG_VALUE: main:gcds <- %RAX
	#DEBUG_VALUE: main:_9 <- %RAX
	#DEBUG_VALUE: main:_11 <- 0
	#DEBUG_VALUE: main:_10 <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:sum <- 0
	#DEBUG_VALUE: main:gcds_size <- 0
	.loc	1 335 6                 # GCD.c:335:6
	addq	$32, %rax
.Ltmp63:
	xorl	%ebx, %ebx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB3_3:                                # %while.cond2.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_4 Depth 2
	movq	%rax, %rdx
	movl	$1000, %esi             # imm = 0x3E8
	.p2align	4, 0x90
.LBB3_4:                                # %if.end6
                                        #   Parent Loop BB3_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp64:
	.loc	1 351 11                # GCD.c:351:11
	addq	-32(%rdx), %rbx
.Ltmp65:
	#DEBUG_VALUE: main:_17 <- 1
	#DEBUG_VALUE: main:_16 <- %RBX
	#DEBUG_VALUE: main:sum <- %RBX
	addq	-24(%rdx), %rbx
.Ltmp66:
	addq	-16(%rdx), %rbx
	addq	-8(%rdx), %rbx
	addq	(%rdx), %rbx
	.loc	1 343 7                 # GCD.c:343:7
	addq	$40, %rdx
	addq	$-5, %rsi
	jne	.LBB3_4
.Ltmp67:
# BB#5:                                 # %blklab22
                                        #   in Loop: Header=BB3_3 Depth=1
	#DEBUG_VALUE: main:_19 <- 1
	.loc	1 368 8                 # GCD.c:368:8
	incq	%rcx
.Ltmp68:
	#DEBUG_VALUE: main:_20 <- %RCX
	#DEBUG_VALUE: main:i <- %RCX
	.loc	1 335 6                 # GCD.c:335:6
	addq	$8000, %rax             # imm = 0x1F40
	cmpq	$1000, %rcx             # imm = 0x3E8
	jne	.LBB3_3
.Ltmp69:
# BB#6:                                 # %blklab20
	#DEBUG_VALUE: main:i <- %RCX
	#DEBUG_VALUE: main:_20 <- %RCX
	#DEBUG_VALUE: main:_23_size <- 4
	.loc	1 379 2                 # GCD.c:379:2
	movl	$32, %edi
	callq	malloc
.Ltmp70:
	#DEBUG_VALUE: main:_23 <- %RAX
	.loc	1 380 9                 # GCD.c:380:9
	movaps	.LCPI3_0(%rip), %xmm0   # xmm0 = [83,85]
	movups	%xmm0, (%rax)
	.loc	1 380 35 is_stmt 0      # GCD.c:380:35
	movaps	.LCPI3_1(%rip), %xmm0   # xmm0 = [77,58]
	movups	%xmm0, 16(%rax)
	.loc	1 382 2 is_stmt 1       # GCD.c:382:2
	movl	$4, %esi
	movq	%rax, %rdi
	callq	printf_s
.Ltmp71:
	.loc	1 386 2                 # GCD.c:386:2
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	printf
	.loc	1 388 2                 # GCD.c:388:2
	xorl	%edi, %edi
	callq	exit
.Ltmp72:
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
	.asciz	"_1_size"               # string offset=253
.Linfo_string7:
	.asciz	"data_size"             # string offset=261
.Linfo_string8:
	.asciz	"i"                     # string offset=271
.Linfo_string9:
	.asciz	"_4"                    # string offset=273
.Linfo_string10:
	.asciz	"_5_size"               # string offset=276
.Linfo_string11:
	.asciz	"_6"                    # string offset=284
.Linfo_string12:
	.asciz	"_7"                    # string offset=287
.Linfo_string13:
	.asciz	"_8"                    # string offset=290
.Linfo_string14:
	.asciz	"_9"                    # string offset=293
.Linfo_string15:
	.asciz	"_10"                   # string offset=296
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
	.asciz	"_37"                   # string offset=344
.Linfo_string28:
	.asciz	"_36"                   # string offset=348
.Linfo_string29:
	.asciz	"_35"                   # string offset=352
.Linfo_string30:
	.asciz	"_34"                   # string offset=356
.Linfo_string31:
	.asciz	"_33"                   # string offset=360
.Linfo_string32:
	.asciz	"_32"                   # string offset=364
.Linfo_string33:
	.asciz	"_31"                   # string offset=368
.Linfo_string34:
	.asciz	"_30"                   # string offset=372
.Linfo_string35:
	.asciz	"_29"                   # string offset=376
.Linfo_string36:
	.asciz	"_28"                   # string offset=380
.Linfo_string37:
	.asciz	"_27"                   # string offset=384
.Linfo_string38:
	.asciz	"_26"                   # string offset=388
.Linfo_string39:
	.asciz	"_25"                   # string offset=392
.Linfo_string40:
	.asciz	"_24"                   # string offset=396
.Linfo_string41:
	.asciz	"_23"                   # string offset=400
.Linfo_string42:
	.asciz	"_22"                   # string offset=404
.Linfo_string43:
	.asciz	"_21"                   # string offset=408
.Linfo_string44:
	.asciz	"_20"                   # string offset=412
.Linfo_string45:
	.asciz	"_19"                   # string offset=416
.Linfo_string46:
	.asciz	"_18"                   # string offset=420
.Linfo_string47:
	.asciz	"_17"                   # string offset=424
.Linfo_string48:
	.asciz	"_16"                   # string offset=428
.Linfo_string49:
	.asciz	"_15"                   # string offset=432
.Linfo_string50:
	.asciz	"_14"                   # string offset=436
.Linfo_string51:
	.asciz	"_13"                   # string offset=440
.Linfo_string52:
	.asciz	"_12"                   # string offset=444
.Linfo_string53:
	.asciz	"_11_size"              # string offset=448
.Linfo_string54:
	.asciz	"j"                     # string offset=457
.Linfo_string55:
	.asciz	"sum"                   # string offset=459
.Linfo_string56:
	.asciz	"gcds_size"             # string offset=463
.Linfo_string57:
	.asciz	"_2_size"               # string offset=473
.Linfo_string58:
	.asciz	"gcds"                  # string offset=481
.Linfo_string59:
	.asciz	"_11"                   # string offset=486
.Linfo_string60:
	.asciz	"argc"                  # string offset=490
.Linfo_string61:
	.asciz	"args"                  # string offset=495
.Linfo_string62:
	.asciz	"char"                  # string offset=500
.Linfo_string63:
	.asciz	"_8_size"               # string offset=505
.Linfo_string64:
	.asciz	"_9_size"               # string offset=513
.Linfo_string65:
	.asciz	"_23_size"              # string offset=521
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
	.quad	.Ltmp54-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc34:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc35:
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp65-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc36:
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc37:
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp65-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc38:
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp65-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc39:
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp67-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc40:
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc41:
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	4                       # 4
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc42:
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp56-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	4                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	232                     # 1000
	.byte	7                       # DW_OP_stack_value
	.byte	159                     # 
	.quad	0
	.quad	0
.Ldebug_loc43:
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp58-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc44:
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp60-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc45:
	.quad	.Ltmp56-.Lfunc_begin0
	.quad	.Ltmp57-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc46:
	.quad	.Ltmp56-.Lfunc_begin0
	.quad	.Ltmp57-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc47:
	.quad	.Ltmp56-.Lfunc_begin0
	.quad	.Ltmp57-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc48:
	.quad	.Ltmp56-.Lfunc_begin0
	.quad	.Ltmp57-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc49:
	.quad	.Ltmp62-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc50:
	.quad	.Ltmp62-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc51:
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
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
	.byte	5                       # Abbreviation Code
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
	.byte	6                       # Abbreviation Code
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
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
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
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	10                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	12                      # Abbreviation Code
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
	.byte	13                      # Abbreviation Code
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
	.byte	14                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	15                      # Abbreviation Code
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
	.byte	16                      # Abbreviation Code
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
	.byte	17                      # Abbreviation Code
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
	.byte	18                      # Abbreviation Code
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
	.byte	22                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	23                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	1671                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x680 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x80 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1067                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	3                       # Abbrev [3] 0x43:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	3                       # Abbrev [3] 0x52:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x61:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x6d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x79:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x85:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x91:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x9d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	2                       # Abbrev [2] 0xaa:0x256 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1062                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	3                       # Abbrev [3] 0xc3:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	1062                    # DW_AT_type
	.byte	3                       # Abbrev [3] 0xd2:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	3                       # Abbrev [3] 0xe1:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc4            # DW_AT_location
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xf0:0xf DW_TAG_variable
	.long	.Ldebug_loc5            # DW_AT_location
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	98                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xff:0xf DW_TAG_variable
	.long	.Ldebug_loc6            # DW_AT_location
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	97                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x10e:0xf DW_TAG_variable
	.long	.Ldebug_loc7            # DW_AT_location
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	96                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x11d:0xf DW_TAG_variable
	.long	.Ldebug_loc8            # DW_AT_location
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	95                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x12c:0xf DW_TAG_variable
	.long	.Ldebug_loc9            # DW_AT_location
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	94                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x13b:0xf DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	93                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x14a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	92                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x156:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	91                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x162:0xf DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	90                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x171:0xf DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	89                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x180:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	88                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x18c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	87                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x198:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	86                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x1a4:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	85                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1b0:0xf DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	84                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1bf:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	83                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x1ce:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	82                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x1da:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	81                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1e6:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	80                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1f5:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	79                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x204:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	78                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x210:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	77                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x21f:0xf DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	76                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x22e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	75                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x23a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	74                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x246:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	73                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x252:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	72                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x25e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	71                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x26a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x276:0xf DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	69                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x285:0xf DW_TAG_variable
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	68                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x294:0xf DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	67                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2a3:0xf DW_TAG_variable
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	66                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x2b2:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	65                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x2be:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x2ca:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2d6:0xf DW_TAG_variable
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	1062                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2e5:0xf DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	72                      # DW_AT_decl_line
	.long	1062                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x2f4:0xb DW_TAG_variable
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	1062                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x300:0x7f DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	895                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x313:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc25           # DW_AT_location
	.long	907                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x31c:0x9 DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	962                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x325:0x9 DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	929                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x32e:0x9 DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	1017                    # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x337:0x9 DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	1006                    # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x340:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	995                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x346:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	984                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x34c:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	973                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x352:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	951                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x358:0x9 DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	940                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x361:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	918                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x367:0x9 DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	1028                    # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x370:0x9 DW_TAG_variable
	.long	.Ldebug_loc32           # DW_AT_location
	.long	1039                    # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x379:0x5 DW_TAG_variable
	.long	1050                    # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x37f:0xa7 DW_TAG_subprogram
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	240                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1062                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	13                      # Abbrev [13] 0x38b:0xb DW_TAG_formal_parameter
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	240                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x396:0xb DW_TAG_variable
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	241                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3a1:0xb DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	242                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3ac:0xb DW_TAG_variable
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	243                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3b7:0xb DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	244                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3c2:0xb DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	245                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3cd:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	246                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3d8:0xb DW_TAG_variable
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	247                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3e3:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	248                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3ee:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	249                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3f9:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	250                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x404:0xb DW_TAG_variable
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	242                     # DW_AT_decl_line
	.long	1062                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x40f:0xb DW_TAG_variable
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	245                     # DW_AT_decl_line
	.long	1062                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x41a:0xb DW_TAG_variable
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	241                     # DW_AT_decl_line
	.long	1062                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	14                      # Abbrev [14] 0x426:0x5 DW_TAG_pointer_type
	.long	1067                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x42b:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	16                      # Abbrev [16] 0x432:0x23f DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	287                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1649                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	17                      # Abbrev [17] 0x44c:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc33           # DW_AT_location
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	287                     # DW_AT_decl_line
	.long	1649                    # DW_AT_type
	.byte	17                      # Abbrev [17] 0x45c:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc34           # DW_AT_location
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	287                     # DW_AT_decl_line
	.long	1656                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x46c:0xe DW_TAG_variable
	.ascii	"\350\007"              # DW_AT_const_value
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	288                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x47a:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	289                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x487:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	290                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x494:0x10 DW_TAG_variable
	.long	.Ldebug_loc35           # DW_AT_location
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	291                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x4a4:0x10 DW_TAG_variable
	.long	.Ldebug_loc36           # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	292                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x4b4:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	293                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x4c1:0xe DW_TAG_variable
	.ascii	"\350\007"              # DW_AT_const_value
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	294                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x4cf:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	295                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x4dc:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	296                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x4e9:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	297                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x4f6:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	298                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x503:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	299                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x510:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	300                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x51d:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	301                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x52a:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	302                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x537:0x10 DW_TAG_variable
	.long	.Ldebug_loc37           # DW_AT_location
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	303                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x547:0x10 DW_TAG_variable
	.long	.Ldebug_loc38           # DW_AT_location
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	304                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x557:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	305                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x564:0x10 DW_TAG_variable
	.long	.Ldebug_loc39           # DW_AT_location
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	306                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x574:0x10 DW_TAG_variable
	.long	.Ldebug_loc40           # DW_AT_location
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	307                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x584:0x10 DW_TAG_variable
	.long	.Ldebug_loc41           # DW_AT_location
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	309                     # DW_AT_decl_line
	.long	1067                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x594:0x10 DW_TAG_variable
	.long	.Ldebug_loc47           # DW_AT_location
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	295                     # DW_AT_decl_line
	.long	1062                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x5a4:0x10 DW_TAG_variable
	.long	.Ldebug_loc48           # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	289                     # DW_AT_decl_line
	.long	1062                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x5b4:0x10 DW_TAG_variable
	.long	.Ldebug_loc49           # DW_AT_location
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	290                     # DW_AT_decl_line
	.long	1062                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x5c4:0x10 DW_TAG_variable
	.long	.Ldebug_loc50           # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	296                     # DW_AT_decl_line
	.long	1062                    # DW_AT_type
	.byte	19                      # Abbrev [19] 0x5d4:0x10 DW_TAG_variable
	.long	.Ldebug_loc51           # DW_AT_location
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	309                     # DW_AT_decl_line
	.long	1062                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x5e4:0xc DW_TAG_variable
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	308                     # DW_AT_decl_line
	.long	1673                    # DW_AT_type
	.byte	20                      # Abbrev [20] 0x5f0:0xc DW_TAG_variable
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	310                     # DW_AT_decl_line
	.long	1673                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x5fc:0x74 DW_TAG_inlined_subroutine
	.long	895                     # DW_AT_abstract_origin
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Ltmp61-.Lfunc_begin3   # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.short	316                     # DW_AT_call_line
	.byte	22                      # Abbrev [22] 0x610:0x7 DW_TAG_formal_parameter
	.ascii	"\350\007"              # DW_AT_const_value
	.long	907                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x617:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	918                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x61d:0x9 DW_TAG_variable
	.long	.Ldebug_loc42           # DW_AT_location
	.long	929                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x626:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	940                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x62c:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	951                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x632:0x7 DW_TAG_variable
	.ascii	"\350\007"              # DW_AT_const_value
	.long	962                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x639:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	973                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x63f:0x9 DW_TAG_variable
	.long	.Ldebug_loc43           # DW_AT_location
	.long	984                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x648:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	995                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x64e:0x9 DW_TAG_variable
	.long	.Ldebug_loc44           # DW_AT_location
	.long	1006                    # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x657:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1017                    # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x65d:0x9 DW_TAG_variable
	.long	.Ldebug_loc45           # DW_AT_location
	.long	1028                    # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x666:0x9 DW_TAG_variable
	.long	.Ldebug_loc46           # DW_AT_location
	.long	1039                    # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	15                      # Abbrev [15] 0x671:0x7 DW_TAG_base_type
	.long	.Linfo_string22         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	14                      # Abbrev [14] 0x678:0x5 DW_TAG_pointer_type
	.long	1661                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x67d:0x5 DW_TAG_pointer_type
	.long	1666                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x682:0x7 DW_TAG_base_type
	.long	.Linfo_string62         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	23                      # Abbrev [23] 0x689:0x1 DW_TAG_pointer_type
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
	.long	1675                    # Compilation Unit Length
	.long	895                     # DIE offset
	.asciz	"init"                  # External Name
	.long	1074                    # DIE offset
	.asciz	"main"                  # External Name
	.long	170                     # DIE offset
	.asciz	"gcd_array"             # External Name
	.long	42                      # DIE offset
	.asciz	"gcd"                   # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	1675                    # Compilation Unit Length
	.long	1067                    # DIE offset
	.asciz	"long long int"         # External Name
	.long	1649                    # DIE offset
	.asciz	"int"                   # External Name
	.long	1666                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
