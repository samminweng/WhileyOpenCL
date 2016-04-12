	.text
	.file	"llvm/GCD.openmp.disablevc.ll"
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
	#DEBUG_VALUE: gcd_array:_12_has_ownership <- 0
	#DEBUG_VALUE: gcd_array:_12_size <- 0
	#DEBUG_VALUE: gcd_array:_11 <- 0
	#DEBUG_VALUE: gcd_array:_10 <- 0
	#DEBUG_VALUE: gcd_array:g <- 0
	#DEBUG_VALUE: gcd_array:b <- 0
	#DEBUG_VALUE: gcd_array:a <- 0
	#DEBUG_VALUE: gcd_array:j <- 0
	#DEBUG_VALUE: gcd_array:i <- 0
	#DEBUG_VALUE: gcd_array:sum <- 0
	#DEBUG_VALUE: gcd_array:gcds_has_ownership <- 0
	#DEBUG_VALUE: gcd_array:gcds_size <- 0
	#DEBUG_VALUE: gcd_array:_2_has_ownership <- 0
	#DEBUG_VALUE: gcd_array:_2_size <- 0
	#DEBUG_VALUE: gcd_array:data <- %RBX
	.loc	1 101 7 prologue_end    # GCD.c:101:7
	movl	%r12d, %esi
.Ltmp22:
	imull	%esi, %esi
	xorl	%ebp, %ebp
	.loc	1 104 2                 # GCD.c:104:2
	xorl	%edi, %edi
	callq	gen1DArray
	movq	%rax, %r15
.Ltmp23:
	#DEBUG_VALUE: gcd_array:gcds <- %R15
	#DEBUG_VALUE: gcd_array:_12 <- %R15
	#DEBUG_VALUE: gcd_array:gcds_has_ownership <- 1
	.loc	1 122 6                 # GCD.c:122:6
	testq	%r12, %r12
	jle	.LBB1_10
.Ltmp24:
	.p2align	4, 0x90
.LBB1_1:                                # %while.cond8.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
                                        #       Child Loop BB1_4 Depth 3
                                        #         Child Loop BB1_5 Depth 4
	.loc	1 198 9                 # GCD.c:198:9
	movq	%rbp, %rax
	imulq	%r12, %rax
.Ltmp25:
	#DEBUG_VALUE: gcd_array:_28 <- %RAX
	#DEBUG_VALUE: gcd_array:_24 <- %RAX
	xorl	%ecx, %ecx
.Ltmp26:
	.p2align	4, 0x90
.LBB1_2:                                # %if.end13.us
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_4 Depth 3
                                        #         Child Loop BB1_5 Depth 4
	.loc	1 132 8                 # GCD.c:132:8
	movq	(%rbx,%rbp,8), %rsi
.Ltmp27:
	#DEBUG_VALUE: gcd_array:_16 <- %RSI
	#DEBUG_VALUE: gcd_array:a <- %RSI
	.loc	1 136 8                 # GCD.c:136:8
	movq	(%rbx,%rcx,8), %rdx
	#DEBUG_VALUE: gcd_array:_19 <- 0
	#DEBUG_VALUE: gcd_array:_18 <- 0
.Ltmp28:
	#DEBUG_VALUE: gcd_array:_17 <- %RDX
	#DEBUG_VALUE: gcd_array:g <- 0
	#DEBUG_VALUE: gcd_array:b <- %RDX
	.loc	1 146 8                 # GCD.c:146:8
	testq	%rsi, %rsi
	je	.LBB1_8
.Ltmp29:
# BB#3:                                 # %while.cond19.preheader.us
                                        #   in Loop: Header=BB1_2 Depth=2
	#DEBUG_VALUE: gcd_array:b <- %RDX
	#DEBUG_VALUE: gcd_array:_17 <- %RDX
	#DEBUG_VALUE: gcd_array:a <- %RSI
	#DEBUG_VALUE: gcd_array:_16 <- %RSI
	#DEBUG_VALUE: gcd_array:_20 <- 0
	js	.LBB1_14
.Ltmp30:
.LBB1_4:                                # %blklab15.lr.ph.us
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_2 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_5 Depth 4
	#DEBUG_VALUE: gcd_array:_21 <- 0
	.loc	1 171 9                 # GCD.c:171:9
	testq	%rdx, %rdx
	je	.LBB1_7
.Ltmp31:
	.p2align	4, 0x90
.LBB1_5:                                # %if.end29.us
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_2 Depth=2
                                        #       Parent Loop BB1_4 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	.loc	1 173 9                 # GCD.c:173:9
	movq	%rdx, %rdi
	subq	%rsi, %rdi
.Ltmp32:
	.loc	1 173 8 is_stmt 0       # GCD.c:173:8
	jl	.LBB1_13
# BB#6:                                 # %blklab16.thread.us
                                        #   in Loop: Header=BB1_5 Depth=4
	#DEBUG_VALUE: gcd_array:_20 <- 0
	#DEBUG_VALUE: gcd_array:_21 <- 0
	movq	%rdi, %rdx
	jne	.LBB1_5
	jmp	.LBB1_7
	.p2align	4, 0x90
.LBB1_13:                               # %if.end33.us
                                        #   in Loop: Header=BB1_4 Depth=3
	#DEBUG_VALUE: gcd_array:_20 <- 0
.Ltmp33:
	.loc	1 160 10 is_stmt 1      # GCD.c:160:10
	subq	%rdx, %rsi
	jns	.LBB1_4
	jmp	.LBB1_14
.Ltmp34:
	.p2align	4, 0x90
.LBB1_7:                                #   in Loop: Header=BB1_2 Depth=2
	movq	%rsi, %rdx
.LBB1_8:                                # %blklab12.us
                                        #   in Loop: Header=BB1_2 Depth=2
	.loc	1 200 11                # GCD.c:200:11
	leaq	(%rcx,%rax), %rsi
.Ltmp35:
	#DEBUG_VALUE: gcd_array:_29 <- %RSI
	#DEBUG_VALUE: gcd_array:_25 <- %RSI
	.loc	1 210 14                # GCD.c:210:14
	addq	%rdx, (%r15,%rsi,8)
.Ltmp36:
	#DEBUG_VALUE: gcd_array:_30 <- 1
	.loc	1 214 9                 # GCD.c:214:9
	incq	%rcx
.Ltmp37:
	#DEBUG_VALUE: gcd_array:_31 <- %RCX
	#DEBUG_VALUE: gcd_array:j <- %RCX
	.loc	1 130 8                 # GCD.c:130:8
	cmpq	%r12, %rcx
	jl	.LBB1_2
.Ltmp38:
# BB#9:                                 # %blklab9.loopexit.us
                                        #   in Loop: Header=BB1_1 Depth=1
	#DEBUG_VALUE: gcd_array:j <- %RCX
	#DEBUG_VALUE: gcd_array:_31 <- %RCX
	#DEBUG_VALUE: gcd_array:_25 <- %RSI
	#DEBUG_VALUE: gcd_array:_29 <- %RSI
	#DEBUG_VALUE: gcd_array:_32 <- 1
	.loc	1 225 8                 # GCD.c:225:8
	incq	%rbp
.Ltmp39:
	#DEBUG_VALUE: gcd_array:_33 <- %RBP
	#DEBUG_VALUE: gcd_array:i <- %RBP
	.loc	1 122 7                 # GCD.c:122:7
	cmpq	%r12, %rbp
	jl	.LBB1_1
.Ltmp40:
.LBB1_10:                               # %blklab7
	#DEBUG_VALUE: gcd_array:data_has_ownership [bit_piece offset=0 size=1] <- %R14B
	.loc	1 234 2                 # GCD.c:234:2
	testb	%r14b, %r14b
	je	.LBB1_12
.Ltmp41:
# BB#11:                                # %if.then44
	#DEBUG_VALUE: gcd_array:data_has_ownership [bit_piece offset=0 size=1] <- %R14B
	.loc	1 234 2 is_stmt 0 discriminator 1 # GCD.c:234:2
	movq	%rbx, %rdi
	callq	free
.Ltmp42:
	#DEBUG_VALUE: gcd_array:data_has_ownership <- 0
.LBB1_12:                               # %if.end51
	.loc	1 237 2 is_stmt 1       # GCD.c:237:2
	movq	%r15, %rax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB1_14:                               # %if.end24
.Ltmp43:
	.loc	1 162 14                # GCD.c:162:14
	movq	stderr(%rip), %rcx
	.loc	1 162 6 is_stmt 0       # GCD.c:162:6
	movl	$.L.str, %edi
	movl	$4, %esi
	movl	$1, %edx
	callq	fwrite
	.loc	1 163 6 is_stmt 1       # GCD.c:163:6
	movl	$-1, %edi
	callq	exit
.Ltmp44:
.Lfunc_end1:
	.size	gcd_array, .Lfunc_end1-gcd_array
	.cfi_endproc

	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
.Lfunc_begin2:
	.loc	1 241 0                 # GCD.c:241:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp45:
	.cfi_def_cfa_offset 16
.Ltmp46:
	.cfi_offset %rbx, -16
	#DEBUG_VALUE: init:n <- %RDI
.Ltmp47:
	#DEBUG_VALUE: init:_5_size <- %RDI
	#DEBUG_VALUE: init:data_size <- %RDI
	movq	%rdi, %rbx
.Ltmp48:
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
	.loc	1 259 2 prologue_end    # GCD.c:259:2
	xorl	%edi, %edi
	movl	%ebx, %esi
	callq	gen1DArray
.Ltmp49:
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:data_has_ownership <- 1
	.loc	1 273 6                 # GCD.c:273:6
	testq	%rbx, %rbx
	jle	.LBB2_5
.Ltmp50:
# BB#1:                                 # %if.end7.preheader
	#DEBUG_VALUE: init:_5 <- %RAX
	#DEBUG_VALUE: init:data <- %RAX
	#DEBUG_VALUE: init:n <- %RBX
	.loc	1 275 6                 # GCD.c:275:6
	leaq	-1(%rbx), %rdx
	xorl	%ecx, %ecx
	movq	%rbx, %rsi
	andq	$3, %rsi
	je	.LBB2_3
.Ltmp51:
	.p2align	4, 0x90
.LBB2_2:                                # %if.end7.prol
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 279 11                # GCD.c:279:11
	addq	%rcx, (%rax,%rcx,8)
.Ltmp52:
	#DEBUG_VALUE: init:_9 <- 1
	.loc	1 283 8                 # GCD.c:283:8
	incq	%rcx
.Ltmp53:
	#DEBUG_VALUE: init:_10 <- %RCX
	#DEBUG_VALUE: init:i <- %RCX
	.loc	1 273 6                 # GCD.c:273:6
	cmpq	%rcx, %rsi
	jne	.LBB2_2
.Ltmp54:
.LBB2_3:                                # %if.end7.preheader.split
	.loc	1 275 6                 # GCD.c:275:6
	cmpq	$3, %rdx
	jb	.LBB2_5
	.p2align	4, 0x90
.LBB2_4:                                # %if.end7
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 279 11                # GCD.c:279:11
	addq	%rcx, (%rax,%rcx,8)
	#DEBUG_VALUE: init:_9 <- 1
	.loc	1 275 6                 # GCD.c:275:6
	movq	8(%rax,%rcx,8), %rdx
	.loc	1 279 11                # GCD.c:279:11
	leaq	1(%rcx,%rdx), %rdx
	movq	%rdx, 8(%rax,%rcx,8)
	.loc	1 275 6                 # GCD.c:275:6
	movq	16(%rax,%rcx,8), %rdx
	.loc	1 279 11                # GCD.c:279:11
	leaq	2(%rcx,%rdx), %rdx
	movq	%rdx, 16(%rax,%rcx,8)
	.loc	1 275 6                 # GCD.c:275:6
	movq	24(%rax,%rcx,8), %rdx
	.loc	1 279 11                # GCD.c:279:11
	leaq	3(%rcx,%rdx), %rdx
	movq	%rdx, 24(%rax,%rcx,8)
	.loc	1 283 8                 # GCD.c:283:8
	addq	$4, %rcx
	.loc	1 273 6                 # GCD.c:273:6
	cmpq	%rcx, %rbx
	jne	.LBB2_4
.Ltmp55:
.LBB2_5:                                # %if.end15
	.loc	1 294 2                 # GCD.c:294:2
	popq	%rbx
	retq
.Ltmp56:
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
	.loc	1 298 0                 # GCD.c:298:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 259 2 prologue_end    # GCD.c:259:2
	pushq	%r15
.Ltmp57:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp58:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp59:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp60:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp61:
	.cfi_def_cfa_offset 48
.Ltmp62:
	.cfi_offset %rbx, -40
.Ltmp63:
	.cfi_offset %r12, -32
.Ltmp64:
	.cfi_offset %r14, -24
.Ltmp65:
	.cfi_offset %r15, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
.Ltmp66:
	#DEBUG_VALUE: main:n <- 1000
	#DEBUG_VALUE: main:data_size <- 0
	#DEBUG_VALUE: main:data_has_ownership <- 0
	#DEBUG_VALUE: main:gcds_size <- 0
	#DEBUG_VALUE: main:gcds_has_ownership <- 0
	#DEBUG_VALUE: main:sum <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_7 <- 1000
	#DEBUG_VALUE: main:_8_size <- 0
	#DEBUG_VALUE: main:_8_has_ownership <- 0
	#DEBUG_VALUE: main:_9_size <- 0
	#DEBUG_VALUE: main:_9_has_ownership <- 0
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
	#DEBUG_VALUE: main:_23_has_ownership <- 0
	#DEBUG_VALUE: init:n <- 1000
	#DEBUG_VALUE: init:_1_size <- 0
	#DEBUG_VALUE: init:_1_has_ownership <- 0
	#DEBUG_VALUE: init:data_size <- 0
	#DEBUG_VALUE: init:data_has_ownership <- 0
	#DEBUG_VALUE: init:i <- 0
	#DEBUG_VALUE: init:_4 <- 0
	#DEBUG_VALUE: init:_5_size <- 1000
	#DEBUG_VALUE: init:_5_has_ownership <- 0
	#DEBUG_VALUE: init:_6 <- 0
	#DEBUG_VALUE: init:_7 <- 0
	#DEBUG_VALUE: init:_8 <- 0
	#DEBUG_VALUE: init:_9 <- 0
	#DEBUG_VALUE: init:_10 <- 0
	xorl	%edi, %edi
.Ltmp67:
	movl	$1000, %esi             # imm = 0x3E8
.Ltmp68:
	callq	gen1DArray
	movq	%rax, %r15
.Ltmp69:
	#DEBUG_VALUE: init:data <- %R15
	#DEBUG_VALUE: init:_5 <- %R15
	#DEBUG_VALUE: main:_8 <- %R15
	#DEBUG_VALUE: main:data <- %R15
	#DEBUG_VALUE: gcd_array:data <- %R15
	#DEBUG_VALUE: init:_5_has_ownership <- 1
	#DEBUG_VALUE: init:data_size <- 1000
	movl	$4, %eax
.Ltmp70:
	#DEBUG_VALUE: init:_5_has_ownership <- 0
	#DEBUG_VALUE: init:data_has_ownership <- 1
	.p2align	4, 0x90
.LBB3_1:                                # %if.end7.i
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 275 6                 # GCD.c:275:6
	movq	-32(%r15,%rax,8), %rcx
.Ltmp71:
	#DEBUG_VALUE: init:_7 <- %RCX
	.loc	1 279 11                # GCD.c:279:11
	leaq	-4(%rax,%rcx), %rcx
.Ltmp72:
	movq	%rcx, -32(%r15,%rax,8)
.Ltmp73:
	#DEBUG_VALUE: init:_9 <- 1
	.loc	1 275 6                 # GCD.c:275:6
	movq	-24(%r15,%rax,8), %rcx
	.loc	1 279 11                # GCD.c:279:11
	leaq	-3(%rax,%rcx), %rcx
	movq	%rcx, -24(%r15,%rax,8)
	.loc	1 275 6                 # GCD.c:275:6
	movq	-16(%r15,%rax,8), %rcx
	.loc	1 279 11                # GCD.c:279:11
	leaq	-2(%rax,%rcx), %rcx
	movq	%rcx, -16(%r15,%rax,8)
	.loc	1 275 6                 # GCD.c:275:6
	movq	-8(%r15,%rax,8), %rcx
	.loc	1 279 11                # GCD.c:279:11
	leaq	-1(%rax,%rcx), %rcx
	movq	%rcx, -8(%r15,%rax,8)
	addq	%rax, (%r15,%rax,8)
	.loc	1 273 6                 # GCD.c:273:6
	addq	$5, %rax
	cmpq	$1004, %rax             # imm = 0x3EC
	jne	.LBB3_1
.Ltmp74:
# BB#2:                                 # %init.exit
	#DEBUG_VALUE: main:data_size <- 0
	#DEBUG_VALUE: main:data_has_ownership <- 1
	#DEBUG_VALUE: main:_8_has_ownership <- 0
	#DEBUG_VALUE: main:_9_size <- 0
	#DEBUG_VALUE: gcd_array:data_has_ownership [bit_piece offset=0 size=1] <- 0
	#DEBUG_VALUE: gcd_array:n <- 1000
	#DEBUG_VALUE: gcd_array:_2_size <- 0
	#DEBUG_VALUE: gcd_array:_2_has_ownership <- 0
	#DEBUG_VALUE: gcd_array:gcds_size <- 0
	#DEBUG_VALUE: gcd_array:gcds_has_ownership <- 0
	#DEBUG_VALUE: gcd_array:sum <- 0
	#DEBUG_VALUE: gcd_array:i <- 0
	#DEBUG_VALUE: gcd_array:j <- 0
	#DEBUG_VALUE: gcd_array:a <- 0
	#DEBUG_VALUE: gcd_array:b <- 0
	#DEBUG_VALUE: gcd_array:g <- 0
	#DEBUG_VALUE: gcd_array:_10 <- 0
	#DEBUG_VALUE: gcd_array:_11 <- 1000000
	#DEBUG_VALUE: gcd_array:_12_size <- 1000000
	#DEBUG_VALUE: gcd_array:_12_has_ownership <- 0
	#DEBUG_VALUE: gcd_array:_13 <- 0
	#DEBUG_VALUE: gcd_array:_14 <- 0
	#DEBUG_VALUE: gcd_array:_15 <- 0
	#DEBUG_VALUE: gcd_array:_16 <- 0
	#DEBUG_VALUE: gcd_array:_17 <- 0
	#DEBUG_VALUE: gcd_array:_18 <- 0
	#DEBUG_VALUE: gcd_array:_19 <- 0
	#DEBUG_VALUE: gcd_array:_20 <- 0
	#DEBUG_VALUE: gcd_array:_21 <- 0
	#DEBUG_VALUE: gcd_array:_22 <- 0
	#DEBUG_VALUE: gcd_array:_23 <- 0
	#DEBUG_VALUE: gcd_array:_24 <- 0
	#DEBUG_VALUE: gcd_array:_25 <- 0
	#DEBUG_VALUE: gcd_array:_26 <- 0
	#DEBUG_VALUE: gcd_array:_27 <- 0
	#DEBUG_VALUE: gcd_array:_28 <- 0
	#DEBUG_VALUE: gcd_array:_29 <- 0
	#DEBUG_VALUE: gcd_array:_30 <- 0
	#DEBUG_VALUE: gcd_array:_31 <- 0
	#DEBUG_VALUE: gcd_array:_32 <- 0
	#DEBUG_VALUE: gcd_array:_33 <- 0
	xorl	%ebx, %ebx
.Ltmp75:
	.loc	1 104 2                 # GCD.c:104:2
	xorl	%edi, %edi
	movl	$1000000, %esi          # imm = 0xF4240
	callq	gen1DArray
	movq	%rax, %r14
.Ltmp76:
	#DEBUG_VALUE: gcd_array:gcds <- %R14
	#DEBUG_VALUE: gcd_array:_12 <- %R14
	#DEBUG_VALUE: gcd_array:gcds_has_ownership <- 1
	#DEBUG_VALUE: gcd_array:gcds_size <- 1000000
	.p2align	4, 0x90
.LBB3_3:                                # %while.cond8.preheader.us.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_4 Depth 2
                                        #       Child Loop BB3_6 Depth 3
                                        #         Child Loop BB3_7 Depth 4
	.loc	1 198 9                 # GCD.c:198:9
	imulq	$1000, %rbx, %rax       # imm = 0x3E8
.Ltmp77:
	#DEBUG_VALUE: gcd_array:_28 <- %RAX
	#DEBUG_VALUE: gcd_array:_24 <- %RAX
	.loc	1 344 7                 # GCD.c:344:7
	xorl	%ecx, %ecx
.Ltmp78:
	.p2align	4, 0x90
.LBB3_4:                                # %if.end13.us.i
                                        #   Parent Loop BB3_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_6 Depth 3
                                        #         Child Loop BB3_7 Depth 4
	.loc	1 132 8                 # GCD.c:132:8
	movq	(%r15,%rbx,8), %rsi
.Ltmp79:
	#DEBUG_VALUE: gcd_array:_16 <- %RSI
	#DEBUG_VALUE: gcd_array:a <- %RSI
	.loc	1 136 8                 # GCD.c:136:8
	movq	(%r15,%rcx,8), %rdx
	#DEBUG_VALUE: gcd_array:_19 <- 0
	#DEBUG_VALUE: gcd_array:_18 <- 0
.Ltmp80:
	#DEBUG_VALUE: gcd_array:_17 <- %RDX
	#DEBUG_VALUE: gcd_array:g <- 0
	#DEBUG_VALUE: gcd_array:b <- %RDX
	.loc	1 146 8                 # GCD.c:146:8
	testq	%rsi, %rsi
	je	.LBB3_10
.Ltmp81:
# BB#5:                                 # %while.cond19.preheader.us.i
                                        #   in Loop: Header=BB3_4 Depth=2
	#DEBUG_VALUE: gcd_array:b <- %RDX
	#DEBUG_VALUE: gcd_array:_17 <- %RDX
	#DEBUG_VALUE: gcd_array:a <- %RSI
	#DEBUG_VALUE: gcd_array:_16 <- %RSI
	#DEBUG_VALUE: gcd_array:_20 <- 0
	js	.LBB3_18
.Ltmp82:
.LBB3_6:                                # %blklab15.lr.ph.us.i
                                        #   Parent Loop BB3_3 Depth=1
                                        #     Parent Loop BB3_4 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB3_7 Depth 4
	#DEBUG_VALUE: gcd_array:_21 <- 0
	.loc	1 171 9                 # GCD.c:171:9
	testq	%rdx, %rdx
	je	.LBB3_9
.Ltmp83:
	.p2align	4, 0x90
.LBB3_7:                                # %if.end29.us.i
                                        #   Parent Loop BB3_3 Depth=1
                                        #     Parent Loop BB3_4 Depth=2
                                        #       Parent Loop BB3_6 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	.loc	1 173 9                 # GCD.c:173:9
	movq	%rdx, %rdi
	subq	%rsi, %rdi
.Ltmp84:
	.loc	1 173 8 is_stmt 0       # GCD.c:173:8
	jl	.LBB3_17
.Ltmp85:
# BB#8:                                 # %blklab16.thread.us.i
                                        #   in Loop: Header=BB3_7 Depth=4
	#DEBUG_VALUE: gcd_array:_20 <- 0
	#DEBUG_VALUE: gcd_array:_21 <- 0
	.loc	1 344 7 is_stmt 1       # GCD.c:344:7
	movq	%rdi, %rdx
	jne	.LBB3_7
	jmp	.LBB3_9
	.p2align	4, 0x90
.LBB3_17:                               # %if.end33.us.i
                                        #   in Loop: Header=BB3_6 Depth=3
	#DEBUG_VALUE: gcd_array:_20 <- 0
.Ltmp86:
	.loc	1 160 10                # GCD.c:160:10
	subq	%rdx, %rsi
	jns	.LBB3_6
	jmp	.LBB3_18
.Ltmp87:
	.p2align	4, 0x90
.LBB3_9:                                #   in Loop: Header=BB3_4 Depth=2
	.loc	1 344 7                 # GCD.c:344:7
	movq	%rsi, %rdx
.LBB3_10:                               # %blklab12.us.i
                                        #   in Loop: Header=BB3_4 Depth=2
.Ltmp88:
	.loc	1 200 11                # GCD.c:200:11
	leaq	(%rcx,%rax), %rsi
.Ltmp89:
	#DEBUG_VALUE: gcd_array:_29 <- %RSI
	#DEBUG_VALUE: gcd_array:_25 <- %RSI
	.loc	1 210 14                # GCD.c:210:14
	addq	%rdx, (%r14,%rsi,8)
.Ltmp90:
	#DEBUG_VALUE: gcd_array:_30 <- 1
	.loc	1 214 9                 # GCD.c:214:9
	incq	%rcx
.Ltmp91:
	#DEBUG_VALUE: gcd_array:_31 <- %RCX
	#DEBUG_VALUE: gcd_array:j <- %RCX
	.loc	1 130 8                 # GCD.c:130:8
	cmpq	$1000, %rcx             # imm = 0x3E8
	jl	.LBB3_4
.Ltmp92:
# BB#11:                                # %blklab9.loopexit.us.i
                                        #   in Loop: Header=BB3_3 Depth=1
	#DEBUG_VALUE: gcd_array:j <- %RCX
	#DEBUG_VALUE: gcd_array:_31 <- %RCX
	#DEBUG_VALUE: gcd_array:_25 <- %RSI
	#DEBUG_VALUE: gcd_array:_29 <- %RSI
	#DEBUG_VALUE: gcd_array:_32 <- 1
	.loc	1 225 8                 # GCD.c:225:8
	incq	%rbx
.Ltmp93:
	#DEBUG_VALUE: gcd_array:_33 <- %RBX
	#DEBUG_VALUE: gcd_array:i <- %RBX
	.loc	1 122 7                 # GCD.c:122:7
	cmpq	$1000, %rbx             # imm = 0x3E8
	jl	.LBB3_3
.Ltmp94:
# BB#12:                                # %while.cond13.preheader.preheader
	#DEBUG_VALUE: gcd_array:_29 <- %RSI
	#DEBUG_VALUE: gcd_array:_25 <- %RSI
	#DEBUG_VALUE: gcd_array:_31 <- %RCX
	#DEBUG_VALUE: gcd_array:j <- %RCX
	#DEBUG_VALUE: gcd_array:i <- %RBX
	#DEBUG_VALUE: gcd_array:_33 <- %RBX
	.loc	1 372 9                 # GCD.c:372:9
	movq	%r14, %rax
	addq	$32, %rax
	xorl	%ecx, %ecx
.Ltmp95:
	xorl	%ebx, %ebx
.Ltmp96:
	.p2align	4, 0x90
.LBB3_13:                               # %while.cond13.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_14 Depth 2
	movq	%rax, %rdx
	movl	$1000, %esi             # imm = 0x3E8
	.p2align	4, 0x90
.LBB3_14:                               # %if.end17
                                        #   Parent Loop BB3_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 378 11                # GCD.c:378:11
	addq	-32(%rdx), %rbx
.Ltmp97:
	#DEBUG_VALUE: main:_17 <- 1
	#DEBUG_VALUE: main:_16 <- %RBX
	#DEBUG_VALUE: main:sum <- %RBX
	addq	-24(%rdx), %rbx
.Ltmp98:
	addq	-16(%rdx), %rbx
	addq	-8(%rdx), %rbx
	addq	(%rdx), %rbx
	.loc	1 370 7                 # GCD.c:370:7
	addq	$40, %rdx
	addq	$-5, %rsi
	jne	.LBB3_14
.Ltmp99:
# BB#15:                                # %blklab22
                                        #   in Loop: Header=BB3_13 Depth=1
	#DEBUG_VALUE: main:_19 <- 1
	.loc	1 395 8                 # GCD.c:395:8
	incq	%rcx
.Ltmp100:
	#DEBUG_VALUE: main:_20 <- %RCX
	#DEBUG_VALUE: main:i <- %RCX
	.loc	1 362 6                 # GCD.c:362:6
	addq	$8000, %rax             # imm = 0x1F40
	cmpq	$1000, %rcx             # imm = 0x3E8
	jne	.LBB3_13
.Ltmp101:
# BB#16:                                # %if.end23
	#DEBUG_VALUE: main:i <- %RCX
	#DEBUG_VALUE: main:_20 <- %RCX
	#DEBUG_VALUE: main:_23_size <- 4
	.loc	1 407 2                 # GCD.c:407:2
	movl	$32, %edi
	callq	malloc
.Ltmp102:
	movq	%rax, %r12
.Ltmp103:
	#DEBUG_VALUE: main:_23 <- %R12
	.loc	1 408 9                 # GCD.c:408:9
	movaps	.LCPI3_0(%rip), %xmm0   # xmm0 = [83,85]
	movups	%xmm0, (%r12)
	.loc	1 408 35 is_stmt 0      # GCD.c:408:35
	movaps	.LCPI3_1(%rip), %xmm0   # xmm0 = [77,58]
	movups	%xmm0, 16(%r12)
.Ltmp104:
	#DEBUG_VALUE: main:_23_has_ownership <- 1
	.loc	1 411 2 is_stmt 1       # GCD.c:411:2
	movl	$4, %esi
	movq	%r12, %rdi
	callq	printf_s
	.loc	1 415 2                 # GCD.c:415:2
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	printf
.Ltmp105:
	.loc	1 417 2 discriminator 1 # GCD.c:417:2
	movq	%r15, %rdi
	callq	free
.Ltmp106:
	#DEBUG_VALUE: main:data_has_ownership <- 0
	.loc	1 418 2 discriminator 1 # GCD.c:418:2
	movq	%r14, %rdi
	callq	free
.Ltmp107:
	#DEBUG_VALUE: main:gcds_has_ownership <- 0
	.loc	1 421 2 discriminator 1 # GCD.c:421:2
	movq	%r12, %rdi
	callq	free
.Ltmp108:
	#DEBUG_VALUE: main:_23_has_ownership <- 0
	.loc	1 422 2                 # GCD.c:422:2
	xorl	%edi, %edi
	callq	exit
.Ltmp109:
.LBB3_18:                               # %if.end24.i
	.loc	1 162 14                # GCD.c:162:14
	movq	stderr(%rip), %rcx
	.loc	1 162 6 is_stmt 0       # GCD.c:162:6
	movl	$.L.str, %edi
	movl	$4, %esi
	movl	$1, %edx
	callq	fwrite
	.loc	1 163 6 is_stmt 1       # GCD.c:163:6
	movl	$-1, %edi
	callq	exit
.Ltmp110:
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
	.asciz	"_1_has_ownership"      # string offset=261
.Linfo_string8:
	.asciz	"_Bool"                 # string offset=278
.Linfo_string9:
	.asciz	"data_size"             # string offset=284
.Linfo_string10:
	.asciz	"data_has_ownership"    # string offset=294
.Linfo_string11:
	.asciz	"i"                     # string offset=313
.Linfo_string12:
	.asciz	"_4"                    # string offset=315
.Linfo_string13:
	.asciz	"_5_size"               # string offset=318
.Linfo_string14:
	.asciz	"_5_has_ownership"      # string offset=326
.Linfo_string15:
	.asciz	"_6"                    # string offset=343
.Linfo_string16:
	.asciz	"_7"                    # string offset=346
.Linfo_string17:
	.asciz	"_8"                    # string offset=349
.Linfo_string18:
	.asciz	"_9"                    # string offset=352
.Linfo_string19:
	.asciz	"_10"                   # string offset=355
.Linfo_string20:
	.asciz	"data"                  # string offset=359
.Linfo_string21:
	.asciz	"_5"                    # string offset=364
.Linfo_string22:
	.asciz	"_1"                    # string offset=367
.Linfo_string23:
	.asciz	"gcd_array"             # string offset=370
.Linfo_string24:
	.asciz	"_2_size"               # string offset=380
.Linfo_string25:
	.asciz	"_2_has_ownership"      # string offset=388
.Linfo_string26:
	.asciz	"gcds_size"             # string offset=405
.Linfo_string27:
	.asciz	"gcds_has_ownership"    # string offset=415
.Linfo_string28:
	.asciz	"sum"                   # string offset=434
.Linfo_string29:
	.asciz	"j"                     # string offset=438
.Linfo_string30:
	.asciz	"a"                     # string offset=440
.Linfo_string31:
	.asciz	"b"                     # string offset=442
.Linfo_string32:
	.asciz	"g"                     # string offset=444
.Linfo_string33:
	.asciz	"_11"                   # string offset=446
.Linfo_string34:
	.asciz	"_12_size"              # string offset=450
.Linfo_string35:
	.asciz	"_12_has_ownership"     # string offset=459
.Linfo_string36:
	.asciz	"_13"                   # string offset=477
.Linfo_string37:
	.asciz	"_14"                   # string offset=481
.Linfo_string38:
	.asciz	"_15"                   # string offset=485
.Linfo_string39:
	.asciz	"_16"                   # string offset=489
.Linfo_string40:
	.asciz	"_17"                   # string offset=493
.Linfo_string41:
	.asciz	"_18"                   # string offset=497
.Linfo_string42:
	.asciz	"_19"                   # string offset=501
.Linfo_string43:
	.asciz	"_20"                   # string offset=505
.Linfo_string44:
	.asciz	"_21"                   # string offset=509
.Linfo_string45:
	.asciz	"_22"                   # string offset=513
.Linfo_string46:
	.asciz	"_23"                   # string offset=517
.Linfo_string47:
	.asciz	"_24"                   # string offset=521
.Linfo_string48:
	.asciz	"_25"                   # string offset=525
.Linfo_string49:
	.asciz	"_26"                   # string offset=529
.Linfo_string50:
	.asciz	"_27"                   # string offset=533
.Linfo_string51:
	.asciz	"_28"                   # string offset=537
.Linfo_string52:
	.asciz	"_29"                   # string offset=541
.Linfo_string53:
	.asciz	"_30"                   # string offset=545
.Linfo_string54:
	.asciz	"_31"                   # string offset=549
.Linfo_string55:
	.asciz	"_32"                   # string offset=553
.Linfo_string56:
	.asciz	"_33"                   # string offset=557
.Linfo_string57:
	.asciz	"gcds"                  # string offset=561
.Linfo_string58:
	.asciz	"_12"                   # string offset=566
.Linfo_string59:
	.asciz	"_2"                    # string offset=570
.Linfo_string60:
	.asciz	"gcd"                   # string offset=573
.Linfo_string61:
	.asciz	"main"                  # string offset=577
.Linfo_string62:
	.asciz	"int"                   # string offset=582
.Linfo_string63:
	.asciz	"_3"                    # string offset=586
.Linfo_string64:
	.asciz	"argc"                  # string offset=589
.Linfo_string65:
	.asciz	"args"                  # string offset=594
.Linfo_string66:
	.asciz	"char"                  # string offset=599
.Linfo_string67:
	.asciz	"_8_size"               # string offset=604
.Linfo_string68:
	.asciz	"_8_has_ownership"      # string offset=612
.Linfo_string69:
	.asciz	"_9_size"               # string offset=629
.Linfo_string70:
	.asciz	"_9_has_ownership"      # string offset=637
.Linfo_string71:
	.asciz	"_23_size"              # string offset=654
.Linfo_string72:
	.asciz	"_23_has_ownership"     # string offset=663
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
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	94                      # super-register DW_OP_reg14
	.byte	147                     # DW_OP_piece
	.byte	1                       # 1
	.quad	.Ltmp42-.Lfunc_begin0
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
	.quad	.Ltmp39-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp37-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp37-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp36-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp35-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
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
	.quad	.Ltmp35-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp35-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
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
	.quad	.Ltmp28-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp28-.Lfunc_begin0
	.quad	.Ltmp30-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp27-.Lfunc_begin0
	.quad	.Ltmp30-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp28-.Lfunc_begin0
	.quad	.Ltmp30-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp27-.Lfunc_begin0
	.quad	.Ltmp30-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp37-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp37-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc20:
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
.Ldebug_loc21:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp24-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp24-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc23:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc33:
	.quad	.Lfunc_begin3-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc34:
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp106-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp106-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc35:
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp97-.Lfunc_begin0
	.quad	.Ltmp98-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc36:
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp100-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Ltmp102-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc37:
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp97-.Lfunc_begin0
	.quad	.Ltmp98-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc38:
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp97-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc39:
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp99-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp99-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc40:
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp100-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Ltmp102-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc41:
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp101-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp101-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	4                       # 4
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc42:
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp104-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp104-.Lfunc_begin0
	.quad	.Ltmp108-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp108-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc43:
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	4                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	232                     # 1000
	.byte	7                       # DW_OP_stack_value
	.byte	159                     # 
	.quad	0
	.quad	0
.Ldebug_loc44:
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc45:
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc46:
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp71-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc47:
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc48:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc49:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc50:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc51:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc52:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc53:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp76-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	5                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	192                     # 1000000
	.byte	132                     # DW_OP_stack_value
	.byte	61                      # 
	.byte	159                     # 
	.quad	0
	.quad	0
.Ldebug_loc54:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp76-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc55:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp93-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp93-.Lfunc_begin0
	.quad	.Ltmp96-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc56:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp95-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc57:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc58:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp80-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc59:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc60:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp80-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc61:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp78-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc62:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp89-.Lfunc_begin0
	.quad	.Ltmp96-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc63:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp78-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc64:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp89-.Lfunc_begin0
	.quad	.Ltmp96-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc65:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp90-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp90-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc66:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp95-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc67:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp92-.Lfunc_begin0
	.quad	.Lfunc_end3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc68:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp93-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp93-.Lfunc_begin0
	.quad	.Ltmp96-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc69:
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Ltmp76-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc70:
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Ltmp76-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc71:
	.quad	.Ltmp103-.Lfunc_begin0
	.quad	.Ltmp109-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
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
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
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
	.byte	25                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	26                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	2351                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x928 DW_TAG_compile_unit
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
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	857                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	3                       # Abbrev [3] 0x43:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	3                       # Abbrev [3] 0x52:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x61:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x6d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x79:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x85:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x91:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x9d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0xaa:0x14e DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	871                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xbd:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	883                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xc6:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc3            # DW_AT_location
	.long	894                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xcf:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc4            # DW_AT_location
	.long	905                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xd8:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc5            # DW_AT_location
	.long	916                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0xe1:0x9 DW_TAG_variable
	.long	.Ldebug_loc6            # DW_AT_location
	.long	1301                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0xea:0x9 DW_TAG_variable
	.long	.Ldebug_loc7            # DW_AT_location
	.long	1290                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0xf3:0x9 DW_TAG_variable
	.long	.Ldebug_loc8            # DW_AT_location
	.long	1279                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0xfc:0x9 DW_TAG_variable
	.long	.Ldebug_loc9            # DW_AT_location
	.long	1268                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x105:0x9 DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	1257                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x10e:0x9 DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	1246                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x117:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1235                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x11d:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1224                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x123:0x9 DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	1213                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x12c:0x9 DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	1202                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x135:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1191                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x13b:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1180                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x141:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1169                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x147:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1158                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x14d:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1147                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x153:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1136                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x159:0x9 DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	1125                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x162:0x9 DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	1114                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x16b:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1103                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x171:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1092                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x177:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1081                    # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x17d:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1070                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x183:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1059                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x189:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1048                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x18f:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1037                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x195:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1026                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x19b:0x9 DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	1015                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x1a4:0x9 DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	1004                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x1ad:0x9 DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	993                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x1b6:0x9 DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	982                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x1bf:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	971                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x1c5:0x9 DW_TAG_variable
	.long	.Ldebug_loc20           # DW_AT_location
	.long	960                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x1ce:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	949                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x1d4:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	938                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x1da:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	927                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x1e0:0x9 DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	1312                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x1e9:0x9 DW_TAG_variable
	.long	.Ldebug_loc22           # DW_AT_location
	.long	1323                    # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x1f2:0x5 DW_TAG_variable
	.long	1334                    # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x1f8:0x94 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	652                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x20b:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc23           # DW_AT_location
	.long	664                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x214:0x9 DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	741                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x21d:0x9 DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	697                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x226:0x9 DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	807                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x22f:0x9 DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	796                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x238:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	785                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x23e:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	774                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x244:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	763                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x24a:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	752                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x250:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	730                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x256:0x9 DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	719                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x25f:0x9 DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	708                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x268:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	686                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x26e:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	675                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x274:0x9 DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	818                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x27d:0x9 DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	829                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x286:0x5 DW_TAG_variable
	.long	840                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	11                      # Abbrev [11] 0x28c:0xc8 DW_TAG_subprogram
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	241                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	852                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	12                      # Abbrev [12] 0x298:0xb DW_TAG_formal_parameter
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	241                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x2a3:0xb DW_TAG_variable
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	242                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x2ae:0xb DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	243                     # DW_AT_decl_line
	.long	864                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x2b9:0xb DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	244                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x2c4:0xb DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	245                     # DW_AT_decl_line
	.long	864                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x2cf:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	246                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x2da:0xb DW_TAG_variable
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	247                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x2e5:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	248                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x2f0:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	249                     # DW_AT_decl_line
	.long	864                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x2fb:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	250                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x306:0xb DW_TAG_variable
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	251                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x311:0xb DW_TAG_variable
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	252                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x31c:0xb DW_TAG_variable
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	253                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x327:0xb DW_TAG_variable
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	254                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x332:0xb DW_TAG_variable
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	244                     # DW_AT_decl_line
	.long	852                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x33d:0xb DW_TAG_variable
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	248                     # DW_AT_decl_line
	.long	852                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x348:0xb DW_TAG_variable
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	242                     # DW_AT_decl_line
	.long	852                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	14                      # Abbrev [14] 0x354:0x5 DW_TAG_pointer_type
	.long	857                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x359:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	15                      # Abbrev [15] 0x360:0x7 DW_TAG_base_type
	.long	.Linfo_string8          # DW_AT_name
	.byte	2                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	11                      # Abbrev [11] 0x367:0x1db DW_TAG_subprogram
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	852                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	12                      # Abbrev [12] 0x373:0xb DW_TAG_formal_parameter
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	852                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x37e:0xb DW_TAG_formal_parameter
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x389:0xb DW_TAG_formal_parameter
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	864                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x394:0xb DW_TAG_formal_parameter
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x39f:0xb DW_TAG_variable
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x3aa:0xb DW_TAG_variable
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	864                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x3b5:0xb DW_TAG_variable
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	65                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x3c0:0xb DW_TAG_variable
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	66                      # DW_AT_decl_line
	.long	864                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x3cb:0xb DW_TAG_variable
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	67                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x3d6:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	68                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x3e1:0xb DW_TAG_variable
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	69                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x3ec:0xb DW_TAG_variable
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x3f7:0xb DW_TAG_variable
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	71                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x402:0xb DW_TAG_variable
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	72                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x40d:0xb DW_TAG_variable
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	73                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x418:0xb DW_TAG_variable
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	74                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x423:0xb DW_TAG_variable
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	75                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x42e:0xb DW_TAG_variable
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	76                      # DW_AT_decl_line
	.long	864                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x439:0xb DW_TAG_variable
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	77                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x444:0xb DW_TAG_variable
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	78                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x44f:0xb DW_TAG_variable
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	79                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x45a:0xb DW_TAG_variable
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	80                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x465:0xb DW_TAG_variable
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	81                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x470:0xb DW_TAG_variable
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	82                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x47b:0xb DW_TAG_variable
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	83                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x486:0xb DW_TAG_variable
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	84                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x491:0xb DW_TAG_variable
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	85                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x49c:0xb DW_TAG_variable
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	86                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x4a7:0xb DW_TAG_variable
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	87                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x4b2:0xb DW_TAG_variable
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	88                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x4bd:0xb DW_TAG_variable
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	89                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x4c8:0xb DW_TAG_variable
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	90                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x4d3:0xb DW_TAG_variable
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	91                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x4de:0xb DW_TAG_variable
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	92                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x4e9:0xb DW_TAG_variable
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	93                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x4f4:0xb DW_TAG_variable
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	94                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x4ff:0xb DW_TAG_variable
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	95                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x50a:0xb DW_TAG_variable
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	96                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x515:0xb DW_TAG_variable
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	97                      # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x520:0xb DW_TAG_variable
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	65                      # DW_AT_decl_line
	.long	852                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x52b:0xb DW_TAG_variable
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	75                      # DW_AT_decl_line
	.long	852                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x536:0xb DW_TAG_variable
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	852                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	16                      # Abbrev [16] 0x542:0x3d7 DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	298                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	2329                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	17                      # Abbrev [17] 0x55c:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc32           # DW_AT_location
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	298                     # DW_AT_decl_line
	.long	2329                    # DW_AT_type
	.byte	17                      # Abbrev [17] 0x56c:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc33           # DW_AT_location
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	298                     # DW_AT_decl_line
	.long	2336                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0x57c:0xe DW_TAG_variable
	.ascii	"\350\007"              # DW_AT_const_value
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	299                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x58a:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	300                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	19                      # Abbrev [19] 0x597:0x10 DW_TAG_variable
	.long	.Ldebug_loc34           # DW_AT_location
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	301                     # DW_AT_decl_line
	.long	864                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x5a7:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	302                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x5b4:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	303                     # DW_AT_decl_line
	.long	864                     # DW_AT_type
	.byte	19                      # Abbrev [19] 0x5c1:0x10 DW_TAG_variable
	.long	.Ldebug_loc35           # DW_AT_location
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	304                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	19                      # Abbrev [19] 0x5d1:0x10 DW_TAG_variable
	.long	.Ldebug_loc36           # DW_AT_location
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	305                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x5e1:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	306                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x5ee:0xe DW_TAG_variable
	.ascii	"\350\007"              # DW_AT_const_value
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	307                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x5fc:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	308                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x609:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	309                     # DW_AT_decl_line
	.long	864                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x616:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	310                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	20                      # Abbrev [20] 0x623:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	311                     # DW_AT_decl_line
	.long	864                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x630:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	312                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x63d:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	313                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x64a:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	314                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x657:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	315                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x664:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	316                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x671:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	317                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	19                      # Abbrev [19] 0x67e:0x10 DW_TAG_variable
	.long	.Ldebug_loc37           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	318                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	19                      # Abbrev [19] 0x68e:0x10 DW_TAG_variable
	.long	.Ldebug_loc38           # DW_AT_location
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	319                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x69e:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	320                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	19                      # Abbrev [19] 0x6ab:0x10 DW_TAG_variable
	.long	.Ldebug_loc39           # DW_AT_location
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	321                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	19                      # Abbrev [19] 0x6bb:0x10 DW_TAG_variable
	.long	.Ldebug_loc40           # DW_AT_location
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	322                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	19                      # Abbrev [19] 0x6cb:0x10 DW_TAG_variable
	.long	.Ldebug_loc41           # DW_AT_location
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	324                     # DW_AT_decl_line
	.long	857                     # DW_AT_type
	.byte	19                      # Abbrev [19] 0x6db:0x10 DW_TAG_variable
	.long	.Ldebug_loc42           # DW_AT_location
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	325                     # DW_AT_decl_line
	.long	864                     # DW_AT_type
	.byte	19                      # Abbrev [19] 0x6eb:0x10 DW_TAG_variable
	.long	.Ldebug_loc50           # DW_AT_location
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	308                     # DW_AT_decl_line
	.long	852                     # DW_AT_type
	.byte	19                      # Abbrev [19] 0x6fb:0x10 DW_TAG_variable
	.long	.Ldebug_loc51           # DW_AT_location
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	300                     # DW_AT_decl_line
	.long	852                     # DW_AT_type
	.byte	19                      # Abbrev [19] 0x70b:0x10 DW_TAG_variable
	.long	.Ldebug_loc71           # DW_AT_location
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	324                     # DW_AT_decl_line
	.long	852                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x71b:0xc DW_TAG_variable
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	302                     # DW_AT_decl_line
	.long	852                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x727:0xc DW_TAG_variable
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	310                     # DW_AT_decl_line
	.long	852                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x733:0xc DW_TAG_variable
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	323                     # DW_AT_decl_line
	.long	2353                    # DW_AT_type
	.byte	21                      # Abbrev [21] 0x73f:0xc DW_TAG_variable
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	326                     # DW_AT_decl_line
	.long	2353                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0x74b:0x8c DW_TAG_inlined_subroutine
	.long	652                     # DW_AT_abstract_origin
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Ltmp74-.Lfunc_begin3   # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.short	333                     # DW_AT_call_line
	.byte	23                      # Abbrev [23] 0x75f:0x7 DW_TAG_formal_parameter
	.ascii	"\350\007"              # DW_AT_const_value
	.long	664                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x766:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	675                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x76c:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	686                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x772:0x9 DW_TAG_variable
	.long	.Ldebug_loc43           # DW_AT_location
	.long	697                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x77b:0x9 DW_TAG_variable
	.long	.Ldebug_loc44           # DW_AT_location
	.long	708                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x784:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	719                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x78a:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	730                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x790:0x7 DW_TAG_variable
	.ascii	"\350\007"              # DW_AT_const_value
	.long	741                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x797:0x9 DW_TAG_variable
	.long	.Ldebug_loc45           # DW_AT_location
	.long	752                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x7a0:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	763                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x7a6:0x9 DW_TAG_variable
	.long	.Ldebug_loc46           # DW_AT_location
	.long	774                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x7af:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	785                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x7b5:0x9 DW_TAG_variable
	.long	.Ldebug_loc47           # DW_AT_location
	.long	796                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x7be:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	807                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x7c4:0x9 DW_TAG_variable
	.long	.Ldebug_loc48           # DW_AT_location
	.long	818                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x7cd:0x9 DW_TAG_variable
	.long	.Ldebug_loc49           # DW_AT_location
	.long	829                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	24                      # Abbrev [24] 0x7d7:0x141 DW_TAG_inlined_subroutine
	.long	871                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.short	344                     # DW_AT_call_line
	.byte	6                       # Abbrev [6] 0x7e3:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc52           # DW_AT_location
	.long	883                     # DW_AT_abstract_origin
	.byte	25                      # Abbrev [25] 0x7ec:0xc DW_TAG_formal_parameter
	.byte	6                       # DW_AT_location
	.byte	16
	.byte	0
	.byte	159
	.byte	157
	.byte	1
	.byte	0
	.long	905                     # DW_AT_abstract_origin
	.byte	23                      # Abbrev [23] 0x7f8:0x7 DW_TAG_formal_parameter
	.ascii	"\350\007"              # DW_AT_const_value
	.long	916                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x7ff:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	927                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x805:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	938                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x80b:0x9 DW_TAG_variable
	.long	.Ldebug_loc53           # DW_AT_location
	.long	949                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x814:0x9 DW_TAG_variable
	.long	.Ldebug_loc54           # DW_AT_location
	.long	960                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x81d:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	971                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x823:0x9 DW_TAG_variable
	.long	.Ldebug_loc55           # DW_AT_location
	.long	982                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x82c:0x9 DW_TAG_variable
	.long	.Ldebug_loc56           # DW_AT_location
	.long	993                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x835:0x9 DW_TAG_variable
	.long	.Ldebug_loc57           # DW_AT_location
	.long	1004                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x83e:0x9 DW_TAG_variable
	.long	.Ldebug_loc58           # DW_AT_location
	.long	1015                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x847:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1026                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x84d:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1037                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x853:0x8 DW_TAG_variable
	.ascii	"\300\204="             # DW_AT_const_value
	.long	1048                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x85b:0x8 DW_TAG_variable
	.ascii	"\300\204="             # DW_AT_const_value
	.long	1059                    # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x863:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1070                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x869:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1081                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x86f:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1092                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x875:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1103                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x87b:0x9 DW_TAG_variable
	.long	.Ldebug_loc59           # DW_AT_location
	.long	1114                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x884:0x9 DW_TAG_variable
	.long	.Ldebug_loc60           # DW_AT_location
	.long	1125                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x88d:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1136                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x893:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1147                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x899:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1158                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x89f:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1169                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x8a5:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1180                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x8ab:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1191                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x8b1:0x9 DW_TAG_variable
	.long	.Ldebug_loc61           # DW_AT_location
	.long	1202                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x8ba:0x9 DW_TAG_variable
	.long	.Ldebug_loc62           # DW_AT_location
	.long	1213                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x8c3:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1224                    # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x8c9:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	1235                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x8cf:0x9 DW_TAG_variable
	.long	.Ldebug_loc63           # DW_AT_location
	.long	1246                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x8d8:0x9 DW_TAG_variable
	.long	.Ldebug_loc64           # DW_AT_location
	.long	1257                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x8e1:0x9 DW_TAG_variable
	.long	.Ldebug_loc65           # DW_AT_location
	.long	1268                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x8ea:0x9 DW_TAG_variable
	.long	.Ldebug_loc66           # DW_AT_location
	.long	1279                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x8f3:0x9 DW_TAG_variable
	.long	.Ldebug_loc67           # DW_AT_location
	.long	1290                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x8fc:0x9 DW_TAG_variable
	.long	.Ldebug_loc68           # DW_AT_location
	.long	1301                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x905:0x9 DW_TAG_variable
	.long	.Ldebug_loc69           # DW_AT_location
	.long	1312                    # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x90e:0x9 DW_TAG_variable
	.long	.Ldebug_loc70           # DW_AT_location
	.long	1323                    # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	15                      # Abbrev [15] 0x919:0x7 DW_TAG_base_type
	.long	.Linfo_string62         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	14                      # Abbrev [14] 0x920:0x5 DW_TAG_pointer_type
	.long	2341                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x925:0x5 DW_TAG_pointer_type
	.long	2346                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x92a:0x7 DW_TAG_base_type
	.long	.Linfo_string66         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	26                      # Abbrev [26] 0x931:0x1 DW_TAG_pointer_type
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp110-.Lfunc_begin0
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
	.long	2355                    # Compilation Unit Length
	.long	652                     # DIE offset
	.asciz	"init"                  # External Name
	.long	1346                    # DIE offset
	.asciz	"main"                  # External Name
	.long	871                     # DIE offset
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
	.long	2355                    # Compilation Unit Length
	.long	857                     # DIE offset
	.asciz	"long long int"         # External Name
	.long	864                     # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	2329                    # DIE offset
	.asciz	"int"                   # External Name
	.long	2346                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
