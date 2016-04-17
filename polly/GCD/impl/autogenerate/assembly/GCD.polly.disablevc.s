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

	.globl	gcd_cached
	.p2align	4, 0x90
	.type	gcd_cached,@function
gcd_cached:                             # @gcd_cached
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
	pushq	%r13
.Ltmp12:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp13:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp14:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Ltmp15:
	.cfi_def_cfa_offset 64
.Ltmp16:
	.cfi_offset %rbx, -56
.Ltmp17:
	.cfi_offset %r12, -48
.Ltmp18:
	.cfi_offset %r13, -40
.Ltmp19:
	.cfi_offset %r14, -32
.Ltmp20:
	.cfi_offset %r15, -24
.Ltmp21:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: gcd_cached:n <- %RDI
	movq	%rdi, %r12
.Ltmp22:
	#DEBUG_VALUE: gcd_cached:_28 <- 0
	#DEBUG_VALUE: gcd_cached:_27 <- 0
	#DEBUG_VALUE: gcd_cached:_26 <- 0
	#DEBUG_VALUE: gcd_cached:_25 <- 0
	#DEBUG_VALUE: gcd_cached:_24 <- 0
	#DEBUG_VALUE: gcd_cached:_23 <- 0
	#DEBUG_VALUE: gcd_cached:_22 <- 0
	#DEBUG_VALUE: gcd_cached:_21 <- 0
	#DEBUG_VALUE: gcd_cached:_20 <- 0
	#DEBUG_VALUE: gcd_cached:_19 <- 0
	#DEBUG_VALUE: gcd_cached:_18 <- 0
	#DEBUG_VALUE: gcd_cached:_17 <- 0
	#DEBUG_VALUE: gcd_cached:_16 <- 0
	#DEBUG_VALUE: gcd_cached:_15 <- 0
	#DEBUG_VALUE: gcd_cached:_14 <- 0
	#DEBUG_VALUE: gcd_cached:_13 <- 0
	#DEBUG_VALUE: gcd_cached:_12 <- 0
	#DEBUG_VALUE: gcd_cached:_11 <- 0
	#DEBUG_VALUE: gcd_cached:_10 <- 0
	#DEBUG_VALUE: gcd_cached:_9_has_ownership <- 0
	#DEBUG_VALUE: gcd_cached:_9_size <- 0
	#DEBUG_VALUE: gcd_cached:_8 <- 0
	#DEBUG_VALUE: gcd_cached:_7 <- 0
	#DEBUG_VALUE: gcd_cached:b <- 0
	#DEBUG_VALUE: gcd_cached:a <- 0
	#DEBUG_VALUE: gcd_cached:j <- 0
	#DEBUG_VALUE: gcd_cached:i <- 0
	#DEBUG_VALUE: gcd_cached:gcds_has_ownership <- 0
	#DEBUG_VALUE: gcd_cached:gcds_size <- 0
	#DEBUG_VALUE: gcd_cached:_1_has_ownership <- 0
	#DEBUG_VALUE: gcd_cached:_1_size <- 0
	#DEBUG_VALUE: gcd_cached:n <- %R12
	.loc	1 97 6 prologue_end     # GCD.c:97:6
	movl	%r12d, %esi
	imull	%esi, %esi
	.loc	1 100 2                 # GCD.c:100:2
	xorl	%edi, %edi
	callq	gen1DArray
.Ltmp23:
	#DEBUG_VALUE: gcd_cached:gcds <- %RAX
	#DEBUG_VALUE: gcd_cached:_9 <- %RAX
	#DEBUG_VALUE: gcd_cached:gcds_has_ownership <- 1
	.loc	1 114 6                 # GCD.c:114:6
	testq	%r12, %r12
	jle	.LBB1_13
.Ltmp24:
# BB#1:                                 # %while.cond8.preheader.us.preheader
	#DEBUG_VALUE: gcd_cached:_9 <- %RAX
	#DEBUG_VALUE: gcd_cached:gcds <- %RAX
	#DEBUG_VALUE: gcd_cached:n <- %R12
	.loc	1 130 8                 # GCD.c:130:8
	leaq	-1(%r12), %r8
.Ltmp25:
	.loc	1 69 12                 # GCD.c:69:12
	movl	%r12d, %r11d
	andl	$7, %r11d
.Ltmp26:
	.loc	1 130 8                 # GCD.c:130:8
	leaq	(,%r12,8), %r9
	xorl	%r10d, %r10d
	movq	%rax, %rdi
	xorl	%r13d, %r13d
.Ltmp27:
	.p2align	4, 0x90
.LBB1_2:                                # %while.cond8.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_8 Depth 2
                                        #     Child Loop BB1_4 Depth 2
                                        #     Child Loop BB1_6 Depth 2
	.loc	1 130 7 is_stmt 0       # GCD.c:130:7
	testq	%r13, %r13
	je	.LBB1_3
# BB#7:                                 # %if.end13.us118.preheader
                                        #   in Loop: Header=BB1_2 Depth=1
	.loc	1 132 9 is_stmt 1       # GCD.c:132:9
	movq	%r13, %r14
	imulq	%r12, %r14
.Ltmp28:
	#DEBUG_VALUE: gcd_cached:_23 <- %R14
	#DEBUG_VALUE: gcd_cached:_17 <- %R14
	#DEBUG_VALUE: gcd_cached:_16 <- %R14
	#DEBUG_VALUE: gcd_cached:_13 <- %R14
	movq	%r13, %r15
	negq	%r15
	movq	%rdi, %rcx
	xorl	%edx, %edx
.Ltmp29:
	.p2align	4, 0x90
.LBB1_8:                                # %if.end13.us118
                                        #   Parent Loop BB1_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: gcd_cached:_12 <- 0
	#DEBUG_VALUE: gcd_cached:_15 <- 0
	.loc	1 144 8                 # GCD.c:144:8
	testq	%rdx, %rdx
.Ltmp30:
	.loc	1 144 7 is_stmt 0       # GCD.c:144:7
	je	.LBB1_10
# BB#9:                                 # %blklab13.us122
                                        #   in Loop: Header=BB1_8 Depth=2
.Ltmp31:
	.loc	1 156 8 is_stmt 1       # GCD.c:156:8
	cmpq	%r13, %rdx
.Ltmp32:
	.loc	1 156 7 is_stmt 0       # GCD.c:156:7
	movl	$0, %ebx
	cmovlq	%rdx, %rbx
	movq	%r15, %rsi
	cmovlq	%r10, %rsi
	movq	%r13, %rbp
	subq	%rbx, %rbp
	.loc	1 176 8 is_stmt 1       # GCD.c:176:8
	imulq	%r12, %rbp
	addq	%rsi, %rbp
	addq	%rdx, %rbp
	movq	(%rax,%rbp,8), %rsi
.Ltmp33:
	#DEBUG_VALUE: gcd_cached:_22 <- %RSI
	.loc	1 182 14                # GCD.c:182:14
	movq	%rsi, (%rcx)
	jmp	.LBB1_11
.Ltmp34:
	.p2align	4, 0x90
.LBB1_10:                               # %if.end22.us134
                                        #   in Loop: Header=BB1_8 Depth=2
	.loc	1 150 14                # GCD.c:150:14
	movq	%r13, (%rax,%r14,8)
.LBB1_11:                               # %blklab12.us140
                                        #   in Loop: Header=BB1_8 Depth=2
.Ltmp35:
	#DEBUG_VALUE: gcd_cached:_25 <- 1
	.loc	1 190 9                 # GCD.c:190:9
	incq	%rdx
.Ltmp36:
	#DEBUG_VALUE: gcd_cached:_26 <- %RDX
	#DEBUG_VALUE: gcd_cached:b <- %RDX
	#DEBUG_VALUE: gcd_cached:j <- %RDX
	.loc	1 122 7                 # GCD.c:122:7
	addq	$8, %rcx
	cmpq	%rdx, %r12
	jne	.LBB1_8
	jmp	.LBB1_12
.Ltmp37:
	.p2align	4, 0x90
.LBB1_3:                                # %if.end13.us.us.preheader
                                        #   in Loop: Header=BB1_2 Depth=1
	testq	%r11, %r11
	movl	$0, %edx
	je	.LBB1_5
	.p2align	4, 0x90
.LBB1_4:                                # %if.end13.us.us.prol
                                        #   Parent Loop BB1_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: gcd_cached:_12 <- 0
	.loc	1 136 14                # GCD.c:136:14
	movq	%rdx, (%rdi,%rdx,8)
	#DEBUG_VALUE: gcd_cached:_25 <- 1
	.loc	1 190 9                 # GCD.c:190:9
	incq	%rdx
.Ltmp38:
	#DEBUG_VALUE: gcd_cached:_26 <- %RDX
	#DEBUG_VALUE: gcd_cached:b <- %RDX
	#DEBUG_VALUE: gcd_cached:j <- %RDX
	.loc	1 122 7                 # GCD.c:122:7
	cmpq	%rdx, %r11
	jne	.LBB1_4
.Ltmp39:
.LBB1_5:                                # %if.end13.us.us.preheader.split
                                        #   in Loop: Header=BB1_2 Depth=1
	cmpq	$7, %r8
	jb	.LBB1_12
	.p2align	4, 0x90
.LBB1_6:                                # %if.end13.us.us
                                        #   Parent Loop BB1_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: gcd_cached:_12 <- 0
	.loc	1 136 14                # GCD.c:136:14
	movq	%rdx, (%rdi,%rdx,8)
	#DEBUG_VALUE: gcd_cached:_25 <- 1
	.loc	1 190 9                 # GCD.c:190:9
	leaq	1(%rdx), %rcx
.Ltmp40:
	#DEBUG_VALUE: gcd_cached:_26 <- %RCX
	#DEBUG_VALUE: gcd_cached:b <- %RCX
	#DEBUG_VALUE: gcd_cached:j <- %RCX
	.loc	1 136 14                # GCD.c:136:14
	movq	%rcx, 8(%rdi,%rdx,8)
	leaq	2(%rdx), %rcx
.Ltmp41:
	movq	%rcx, 16(%rdi,%rdx,8)
	leaq	3(%rdx), %rcx
	movq	%rcx, 24(%rdi,%rdx,8)
	leaq	4(%rdx), %rcx
	movq	%rcx, 32(%rdi,%rdx,8)
	leaq	5(%rdx), %rcx
	movq	%rcx, 40(%rdi,%rdx,8)
	leaq	6(%rdx), %rcx
	movq	%rcx, 48(%rdi,%rdx,8)
	leaq	7(%rdx), %rcx
	movq	%rcx, 56(%rdi,%rdx,8)
	.loc	1 122 7                 # GCD.c:122:7
	addq	$8, %rdx
	cmpq	%r12, %rdx
	jne	.LBB1_6
.Ltmp42:
	.p2align	4, 0x90
.LBB1_12:                               # %blklab9.loopexit.us
                                        #   in Loop: Header=BB1_2 Depth=1
	#DEBUG_VALUE: gcd_cached:_27 <- 1
	.loc	1 201 8                 # GCD.c:201:8
	incq	%r13
.Ltmp43:
	#DEBUG_VALUE: gcd_cached:_28 <- %R13
	#DEBUG_VALUE: gcd_cached:a <- %R13
	#DEBUG_VALUE: gcd_cached:i <- %R13
	.loc	1 114 6                 # GCD.c:114:6
	addq	%r9, %rdi
	cmpq	%r12, %r13
	jne	.LBB1_2
.Ltmp44:
.LBB1_13:                               # %if.end44
	.loc	1 212 2                 # GCD.c:212:2
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp45:
.Lfunc_end1:
	.size	gcd_cached, .Lfunc_end1-gcd_cached
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI2_0:
	.quad	78                      # 0x4e
	.quad	32                      # 0x20
.LCPI2_1:
	.quad	61                      # 0x3d
	.quad	32                      # 0x20
.LCPI2_2:
	.quad	78                      # 0x4e
	.quad	117                     # 0x75
.LCPI2_3:
	.quad	109                     # 0x6d
	.quad	98                      # 0x62
.LCPI2_4:
	.quad	101                     # 0x65
	.quad	114                     # 0x72
.LCPI2_5:
	.quad	58                      # 0x3a
	.quad	32                      # 0x20
.LCPI2_6:
	.quad	32                      # 0x20
	.quad	78                      # 0x4e
.LCPI2_7:
	.quad	117                     # 0x75
	.quad	109                     # 0x6d
.LCPI2_8:
	.quad	98                      # 0x62
	.quad	101                     # 0x65
.LCPI2_9:
	.quad	114                     # 0x72
	.quad	58                      # 0x3a
.LCPI2_10:
	.quad	32                      # 0x20
	.quad	71                      # 0x47
.LCPI2_11:
	.quad	67                      # 0x43
	.quad	68                      # 0x44
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin2:
	.loc	1 216 0                 # GCD.c:216:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp46:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp47:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp48:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp49:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp50:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp51:
	.cfi_def_cfa_offset 56
	subq	$88, %rsp
.Ltmp52:
	.cfi_def_cfa_offset 144
.Ltmp53:
	.cfi_offset %rbx, -56
.Ltmp54:
	.cfi_offset %r12, -48
.Ltmp55:
	.cfi_offset %r13, -40
.Ltmp56:
	.cfi_offset %r14, -32
.Ltmp57:
	.cfi_offset %r15, -24
.Ltmp58:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
	movl	%edi, %ebx
.Ltmp59:
	#DEBUG_VALUE: main:_43 <- 0
	#DEBUG_VALUE: main:_42 <- 0
	#DEBUG_VALUE: main:_41 <- 0
	#DEBUG_VALUE: main:_40 <- 0
	#DEBUG_VALUE: main:_39 <- 0
	#DEBUG_VALUE: main:_38 <- 0
	#DEBUG_VALUE: main:_37 <- 0
	#DEBUG_VALUE: main:_36 <- 0
	#DEBUG_VALUE: main:_35 <- 0
	#DEBUG_VALUE: main:_34 <- 0
	#DEBUG_VALUE: main:_33 <- 0
	#DEBUG_VALUE: main:_30_has_ownership <- 0
	#DEBUG_VALUE: main:_30_size <- 0
	#DEBUG_VALUE: main:_25_has_ownership <- 0
	#DEBUG_VALUE: main:_25_size <- 0
	#DEBUG_VALUE: main:_20_has_ownership <- 0
	#DEBUG_VALUE: main:_20_size <- 0
	#DEBUG_VALUE: main:_17 <- 0
	#DEBUG_VALUE: main:_16 <- 0
	#DEBUG_VALUE: main:_15_has_ownership <- 0
	#DEBUG_VALUE: main:_15_size <- 0
	#DEBUG_VALUE: main:_12_has_ownership <- 0
	#DEBUG_VALUE: main:_12_size <- 0
	#DEBUG_VALUE: main:_9_has_ownership <- 0
	#DEBUG_VALUE: main:_9_size <- 0
	#DEBUG_VALUE: main:_8 <- 0
	#DEBUG_VALUE: main:_7_has_ownership <- 0
	#DEBUG_VALUE: main:_7_size_size <- 0
	#DEBUG_VALUE: main:_7_size <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:gcds_has_ownership <- 0
	#DEBUG_VALUE: main:gcds_size <- 0
	#DEBUG_VALUE: main:n <- 0
	#DEBUG_VALUE: main:argc <- %EBX
	.loc	1 261 2 prologue_end    # GCD.c:261:2
	callq	convertArgsToIntArray
.Ltmp60:
	movq	%rax, %r12
.Ltmp61:
	#DEBUG_VALUE: main:_7 <- %R12
	decl	%ebx
.Ltmp62:
	movslq	%ebx, %rbp
.Ltmp63:
	#DEBUG_VALUE: main:_7_has_ownership <- 1
	#DEBUG_VALUE: main:_7_size <- %EBX
	.loc	1 266 5                 # GCD.c:266:5
	movq	(%r12), %rdi
.Ltmp64:
	#DEBUG_VALUE: main:_9 <- %RDI
	.loc	1 268 2                 # GCD.c:268:2
	callq	parseStringToInt
.Ltmp65:
	movq	%rax, %rbx
.Ltmp66:
	#DEBUG_VALUE: main:max <- %RBX
	#DEBUG_VALUE: main:_6 <- %RBX
	.loc	1 272 9                 # GCD.c:272:9
	testq	%rbx, %rbx
.Ltmp67:
	.loc	1 272 5 is_stmt 0       # GCD.c:272:5
	je	.LBB2_44
.Ltmp68:
# BB#1:                                 # %if.end
	#DEBUG_VALUE: main:_6 <- %RBX
	#DEBUG_VALUE: main:max <- %RBX
	#DEBUG_VALUE: main:_7 <- %R12
	movq	%rbp, 80(%rsp)          # 8-byte Spill
	.loc	1 274 6 is_stmt 1       # GCD.c:274:6
	movq	(%rbx), %rbp
.Ltmp69:
	#DEBUG_VALUE: gcd_cached:n <- %RBP
	#DEBUG_VALUE: main:_12_size <- 4
	#DEBUG_VALUE: main:n <- %RBP
	.loc	1 279 2                 # GCD.c:279:2
	movl	$32, %edi
	callq	malloc
.Ltmp70:
	#DEBUG_VALUE: main:_12 <- %RAX
	.loc	1 280 9                 # GCD.c:280:9
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movaps	.LCPI2_0(%rip), %xmm0   # xmm0 = [78,32]
	movups	%xmm0, (%rax)
	.loc	1 280 35 is_stmt 0      # GCD.c:280:35
	movaps	.LCPI2_1(%rip), %xmm0   # xmm0 = [61,32]
	movups	%xmm0, 16(%rax)
.Ltmp71:
	#DEBUG_VALUE: main:_12_has_ownership <- 1
	.loc	1 283 2 is_stmt 1       # GCD.c:283:2
	movl	$4, %esi
	movq	%rax, %rdi
.Ltmp72:
	#DEBUG_VALUE: main:_12 <- [%RSP+40]
	callq	printf_s
.Ltmp73:
	.loc	1 100 2                 # GCD.c:100:2
	xorl	%r15d, %r15d
.Ltmp74:
	.loc	1 287 2                 # GCD.c:287:2
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	printf
.Ltmp75:
	#DEBUG_VALUE: gcd_cached:_28 <- 0
	#DEBUG_VALUE: gcd_cached:_27 <- 0
	#DEBUG_VALUE: gcd_cached:_26 <- 0
	#DEBUG_VALUE: gcd_cached:_25 <- 0
	#DEBUG_VALUE: gcd_cached:_24 <- 0
	#DEBUG_VALUE: gcd_cached:_23 <- 0
	#DEBUG_VALUE: gcd_cached:_22 <- 0
	#DEBUG_VALUE: gcd_cached:_21 <- 0
	#DEBUG_VALUE: gcd_cached:_20 <- 0
	#DEBUG_VALUE: gcd_cached:_19 <- 0
	#DEBUG_VALUE: gcd_cached:_18 <- 0
	#DEBUG_VALUE: gcd_cached:_17 <- 0
	#DEBUG_VALUE: gcd_cached:_16 <- 0
	#DEBUG_VALUE: gcd_cached:_15 <- 0
	#DEBUG_VALUE: gcd_cached:_14 <- 0
	#DEBUG_VALUE: gcd_cached:_13 <- 0
	#DEBUG_VALUE: gcd_cached:_12 <- 0
	#DEBUG_VALUE: gcd_cached:_11 <- 0
	#DEBUG_VALUE: gcd_cached:_10 <- 0
	#DEBUG_VALUE: gcd_cached:_9_has_ownership <- 0
	#DEBUG_VALUE: gcd_cached:_9_size <- 0
	#DEBUG_VALUE: gcd_cached:_8 <- 0
	#DEBUG_VALUE: gcd_cached:_7 <- 0
	#DEBUG_VALUE: gcd_cached:b <- 0
	#DEBUG_VALUE: gcd_cached:a <- 0
	#DEBUG_VALUE: gcd_cached:j <- 0
	#DEBUG_VALUE: gcd_cached:i <- 0
	#DEBUG_VALUE: gcd_cached:gcds_has_ownership <- 0
	#DEBUG_VALUE: gcd_cached:gcds_size <- 0
	#DEBUG_VALUE: gcd_cached:_1_has_ownership <- 0
	#DEBUG_VALUE: gcd_cached:_1_size <- 0
	.loc	1 97 6                  # GCD.c:97:6
	movl	%ebp, %esi
	imull	%esi, %esi
	.loc	1 100 2                 # GCD.c:100:2
	xorl	%edi, %edi
	callq	gen1DArray
.Ltmp76:
	#DEBUG_VALUE: gcd_cached:gcds <- %RAX
	#DEBUG_VALUE: gcd_cached:_9 <- %RAX
	#DEBUG_VALUE: gcd_cached:gcds_has_ownership <- 1
	movb	$1, %bl
.Ltmp77:
	.loc	1 114 6                 # GCD.c:114:6
	testq	%rbp, %rbp
	movl	$0, %ecx
	movl	$0, %r13d
	movl	$0, %r14d
	jle	.LBB2_27
.Ltmp78:
# BB#2:                                 # %while.cond8.preheader.us.i.preheader
	#DEBUG_VALUE: main:_7 <- %R12
	#DEBUG_VALUE: gcd_cached:_9 <- %RAX
	#DEBUG_VALUE: gcd_cached:gcds <- %RAX
	#DEBUG_VALUE: main:n <- %RBP
	#DEBUG_VALUE: gcd_cached:n <- %RBP
	.loc	1 130 8                 # GCD.c:130:8
	leaq	-1(%rbp), %r8
.Ltmp79:
	.loc	1 77 12                 # GCD.c:77:12
	movl	%ebp, %r10d
	andl	$7, %r10d
.Ltmp80:
	.loc	1 130 8                 # GCD.c:130:8
	leaq	(,%rbp,8), %rcx
	movq	%rcx, 48(%rsp)          # 8-byte Spill
	xorl	%r9d, %r9d
.Ltmp81:
	.loc	1 290 8                 # GCD.c:290:8
	movq	%rax, %r13
	xorl	%r14d, %r14d
	movq	%rbp, %r15
.Ltmp82:
	.p2align	4, 0x90
.LBB2_3:                                # %while.cond8.preheader.us.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_9 Depth 2
                                        #     Child Loop BB2_5 Depth 2
                                        #     Child Loop BB2_7 Depth 2
	.loc	1 130 7                 # GCD.c:130:7
	testq	%r14, %r14
	je	.LBB2_4
# BB#8:                                 # %if.end13.us118.preheader.i
                                        #   in Loop: Header=BB2_3 Depth=1
	.loc	1 132 9                 # GCD.c:132:9
	movq	%r14, %r11
	imulq	%r15, %r11
.Ltmp83:
	#DEBUG_VALUE: gcd_cached:_23 <- %R11
	#DEBUG_VALUE: gcd_cached:_17 <- %R11
	#DEBUG_VALUE: gcd_cached:_16 <- %R11
	#DEBUG_VALUE: gcd_cached:_13 <- %R11
	.loc	1 290 8                 # GCD.c:290:8
	movq	%r14, %rbp
	negq	%rbp
	movq	%r13, %rsi
	xorl	%edx, %edx
.Ltmp84:
	.p2align	4, 0x90
.LBB2_9:                                # %if.end13.us118.i
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: gcd_cached:_12 <- 0
	#DEBUG_VALUE: gcd_cached:_15 <- 0
	.loc	1 144 8                 # GCD.c:144:8
	testq	%rdx, %rdx
.Ltmp85:
	.loc	1 144 7 is_stmt 0       # GCD.c:144:7
	je	.LBB2_11
# BB#10:                                # %blklab13.us122.i
                                        #   in Loop: Header=BB2_9 Depth=2
.Ltmp86:
	.loc	1 156 8 is_stmt 1       # GCD.c:156:8
	cmpq	%r14, %rdx
.Ltmp87:
	.loc	1 156 7 is_stmt 0       # GCD.c:156:7
	movl	$0, %ecx
	cmovlq	%rdx, %rcx
.Ltmp88:
	.loc	1 290 8 is_stmt 1       # GCD.c:290:8
	movq	%rbp, %rbx
	cmovlq	%r9, %rbx
.Ltmp89:
	.loc	1 156 7                 # GCD.c:156:7
	movq	%r14, %rdi
	subq	%rcx, %rdi
	.loc	1 176 8                 # GCD.c:176:8
	imulq	%r15, %rdi
	addq	%rbx, %rdi
	addq	%rdx, %rdi
	movq	(%rax,%rdi,8), %rcx
.Ltmp90:
	#DEBUG_VALUE: gcd_cached:_22 <- %RCX
	.loc	1 182 14                # GCD.c:182:14
	movq	%rcx, (%rsi)
	jmp	.LBB2_12
.Ltmp91:
	.p2align	4, 0x90
.LBB2_11:                               # %if.end22.us134.i
                                        #   in Loop: Header=BB2_9 Depth=2
	.loc	1 150 14                # GCD.c:150:14
	movq	%r14, (%rax,%r11,8)
.LBB2_12:                               # %blklab12.us140.i
                                        #   in Loop: Header=BB2_9 Depth=2
.Ltmp92:
	#DEBUG_VALUE: gcd_cached:_25 <- 1
	.loc	1 190 9                 # GCD.c:190:9
	incq	%rdx
	.loc	1 122 7                 # GCD.c:122:7
	addq	$8, %rsi
	cmpq	%rdx, %r15
	jne	.LBB2_9
	jmp	.LBB2_13
.Ltmp93:
	.p2align	4, 0x90
.LBB2_4:                                # %if.end13.us.us.i.preheader
                                        #   in Loop: Header=BB2_3 Depth=1
	testq	%r10, %r10
	.loc	1 290 8                 # GCD.c:290:8
	movl	$0, %ebp
	je	.LBB2_6
	.p2align	4, 0x90
.LBB2_5:                                # %if.end13.us.us.i.prol
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: gcd_cached:_12 <- 0
.Ltmp94:
	.loc	1 136 14                # GCD.c:136:14
	movq	%rbp, (%r13,%rbp,8)
	#DEBUG_VALUE: gcd_cached:_25 <- 1
	.loc	1 190 9                 # GCD.c:190:9
	incq	%rbp
	.loc	1 122 7                 # GCD.c:122:7
	cmpq	%rbp, %r10
	jne	.LBB2_5
.LBB2_6:                                # %if.end13.us.us.i.preheader.split
                                        #   in Loop: Header=BB2_3 Depth=1
	cmpq	$7, %r8
	jb	.LBB2_13
	.p2align	4, 0x90
.LBB2_7:                                # %if.end13.us.us.i
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: gcd_cached:_12 <- 0
	.loc	1 136 14                # GCD.c:136:14
	movq	%rbp, (%r13,%rbp,8)
	#DEBUG_VALUE: gcd_cached:_25 <- 1
	.loc	1 190 9                 # GCD.c:190:9
	leaq	1(%rbp), %rcx
	.loc	1 136 14                # GCD.c:136:14
	movq	%rcx, 8(%r13,%rbp,8)
	leaq	2(%rbp), %rcx
	movq	%rcx, 16(%r13,%rbp,8)
	leaq	3(%rbp), %rcx
	movq	%rcx, 24(%r13,%rbp,8)
	leaq	4(%rbp), %rcx
	movq	%rcx, 32(%r13,%rbp,8)
	leaq	5(%rbp), %rcx
	movq	%rcx, 40(%r13,%rbp,8)
	leaq	6(%rbp), %rcx
	movq	%rcx, 48(%r13,%rbp,8)
	leaq	7(%rbp), %rcx
	movq	%rcx, 56(%r13,%rbp,8)
	.loc	1 122 7                 # GCD.c:122:7
	addq	$8, %rbp
	cmpq	%r15, %rbp
	jne	.LBB2_7
.Ltmp95:
	.p2align	4, 0x90
.LBB2_13:                               # %blklab9.loopexit.us.i
                                        #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: gcd_cached:_27 <- 1
	.loc	1 201 8                 # GCD.c:201:8
	incq	%r14
	.loc	1 114 6                 # GCD.c:114:6
	addq	48(%rsp), %r13          # 8-byte Folded Reload
	cmpq	%r15, %r14
	jne	.LBB2_3
.Ltmp96:
# BB#14:                                # %if.end27.preheader.preheader
	movq	%r15, 16(%rsp)          # 8-byte Spill
	movq	%r12, 72(%rsp)          # 8-byte Spill
	movq	%rax, %rcx
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movl	$0, %r15d
	xorl	%eax, %eax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	xorl	%r13d, %r13d
	xorl	%eax, %eax
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB2_15:                               # %if.end27.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_32 Depth 2
                                        #       Child Loop BB2_39 Depth 3
                                        #     Child Loop BB2_17 Depth 2
.Ltmp97:
	#DEBUG_VALUE: gcd:a <- %RAX
	.loc	1 12 5                  # GCD.c:12:5
	testq	%rax, %rax
	je	.LBB2_16
.Ltmp98:
# BB#46:                                #   in Loop: Header=BB2_15 Depth=1
	#DEBUG_VALUE: gcd:a <- %RAX
	movq	%rcx, 56(%rsp)          # 8-byte Spill
	.loc	1 351 9                 # GCD.c:351:9
	movq	%rax, %rcx
	movq	%rax, 24(%rsp)          # 8-byte Spill
	imulq	16(%rsp), %rcx          # 8-byte Folded Reload
.Ltmp99:
	#DEBUG_VALUE: main:_36 <- %RCX
	#DEBUG_VALUE: main:_33 <- %RCX
	movq	%rcx, 32(%rsp)          # 8-byte Spill
.Ltmp100:
	#DEBUG_VALUE: main:_36 <- [%RSP+32]
	#DEBUG_VALUE: main:_33 <- [%RSP+32]
	xorl	%r12d, %r12d
.Ltmp101:
	.p2align	4, 0x90
.LBB2_32:                               # %if.end27
                                        #   Parent Loop BB2_15 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_39 Depth 3
	.loc	1 316 4                 # GCD.c:316:4
	testb	$1, %r15b
	je	.LBB2_34
# BB#33:                                # %if.then29
                                        #   in Loop: Header=BB2_32 Depth=2
.Ltmp102:
	.loc	1 316 4 is_stmt 0 discriminator 1 # GCD.c:316:4
	movq	%r14, %rdi
	callq	free
.Ltmp103:
	#DEBUG_VALUE: main:_20_has_ownership <- 0
.LBB2_34:                               # %if.end30
                                        #   in Loop: Header=BB2_32 Depth=2
	#DEBUG_VALUE: main:_20_size <- 8
	.loc	1 317 4 is_stmt 1       # GCD.c:317:4
	movl	$64, %edi
	callq	malloc
	movq	%rax, %r14
.Ltmp104:
	#DEBUG_VALUE: main:_20 <- %R14
	.loc	1 318 11                # GCD.c:318:11
	movaps	.LCPI2_2(%rip), %xmm0   # xmm0 = [78,117]
	movups	%xmm0, (%r14)
	.loc	1 318 38 is_stmt 0      # GCD.c:318:38
	movaps	.LCPI2_3(%rip), %xmm0   # xmm0 = [109,98]
	movups	%xmm0, 16(%r14)
	.loc	1 318 65                # GCD.c:318:65
	movaps	.LCPI2_4(%rip), %xmm0   # xmm0 = [101,114]
	movups	%xmm0, 32(%r14)
	.loc	1 318 93                # GCD.c:318:93
	movaps	.LCPI2_5(%rip), %xmm0   # xmm0 = [58,32]
	movups	%xmm0, 48(%r14)
.Ltmp105:
	#DEBUG_VALUE: main:_20_has_ownership <- 1
	.loc	1 321 4 is_stmt 1       # GCD.c:321:4
	movl	$8, %esi
	movq	%r14, %rdi
	callq	printf_s
	.loc	1 325 4                 # GCD.c:325:4
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	movq	24(%rsp), %rsi          # 8-byte Reload
	callq	printf
.Ltmp106:
	.loc	1 329 4                 # GCD.c:329:4
	testb	$1, %r15b
	je	.LBB2_36
.Ltmp107:
# BB#35:                                # %if.then42
                                        #   in Loop: Header=BB2_32 Depth=2
	#DEBUG_VALUE: main:_20 <- %R14
	.loc	1 329 4 is_stmt 0 discriminator 1 # GCD.c:329:4
	movq	%r13, %rdi
	callq	free
.Ltmp108:
	#DEBUG_VALUE: main:_25_has_ownership <- 0
.LBB2_36:                               # %if.end43
                                        #   in Loop: Header=BB2_32 Depth=2
	#DEBUG_VALUE: main:_20 <- %R14
	#DEBUG_VALUE: main:_25_size <- 9
	.loc	1 330 4 is_stmt 1       # GCD.c:330:4
	movl	$72, %edi
	callq	malloc
	movq	%rax, %r13
.Ltmp109:
	#DEBUG_VALUE: main:_25 <- %R13
	.loc	1 331 11                # GCD.c:331:11
	movaps	.LCPI2_6(%rip), %xmm0   # xmm0 = [32,78]
	movups	%xmm0, (%r13)
	.loc	1 331 37 is_stmt 0      # GCD.c:331:37
	movaps	.LCPI2_7(%rip), %xmm0   # xmm0 = [117,109]
	movups	%xmm0, 16(%r13)
	.loc	1 331 65                # GCD.c:331:65
	movaps	.LCPI2_8(%rip), %xmm0   # xmm0 = [98,101]
	movups	%xmm0, 32(%r13)
	.loc	1 331 92                # GCD.c:331:92
	movaps	.LCPI2_9(%rip), %xmm0   # xmm0 = [114,58]
	movups	%xmm0, 48(%r13)
	.loc	1 331 119               # GCD.c:331:119
	movq	$32, 64(%r13)
.Ltmp110:
	#DEBUG_VALUE: main:_25_has_ownership <- 1
	.loc	1 334 4 is_stmt 1       # GCD.c:334:4
	movl	$9, %esi
	movq	%r13, %rdi
	callq	printf_s
.Ltmp111:
	#DEBUG_VALUE: gcd:b <- %R12
	.loc	1 338 4                 # GCD.c:338:4
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	movq	%r12, %rsi
	callq	printf
.Ltmp112:
	.loc	1 342 4                 # GCD.c:342:4
	testb	$1, %r15b
	je	.LBB2_38
.Ltmp113:
# BB#37:                                # %if.then56
                                        #   in Loop: Header=BB2_32 Depth=2
	#DEBUG_VALUE: main:_20 <- %R14
	#DEBUG_VALUE: gcd:b <- %R12
	#DEBUG_VALUE: main:_25 <- %R13
	.loc	1 342 4 is_stmt 0 discriminator 1 # GCD.c:342:4
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	free
.Ltmp114:
	#DEBUG_VALUE: main:_30_has_ownership <- 0
.LBB2_38:                               # %blklab4.lr.ph.i.preheader
                                        #   in Loop: Header=BB2_32 Depth=2
	#DEBUG_VALUE: main:_20 <- %R14
	#DEBUG_VALUE: gcd:b <- %R12
	#DEBUG_VALUE: main:_25 <- %R13
	#DEBUG_VALUE: main:_30_size <- 5
	.loc	1 343 4 is_stmt 1       # GCD.c:343:4
	movl	$40, %edi
	callq	malloc
	movq	%rax, %r15
.Ltmp115:
	#DEBUG_VALUE: main:_30 <- %R15
	.loc	1 344 11                # GCD.c:344:11
	movaps	.LCPI2_10(%rip), %xmm0  # xmm0 = [32,71]
	movups	%xmm0, (%r15)
	.loc	1 344 37 is_stmt 0      # GCD.c:344:37
	movaps	.LCPI2_11(%rip), %xmm0  # xmm0 = [67,68]
	movups	%xmm0, 16(%r15)
	.loc	1 344 63                # GCD.c:344:63
	movq	$58, 32(%r15)
.Ltmp116:
	#DEBUG_VALUE: main:_30_has_ownership <- 1
	.loc	1 347 4 is_stmt 1       # GCD.c:347:4
	movl	$5, %esi
	movq	%r15, %rdi
	callq	printf_s
	.loc	1 353 11                # GCD.c:353:11
	movq	32(%rsp), %rax          # 8-byte Reload
	leaq	(%r12,%rax), %rbp
.Ltmp117:
	#DEBUG_VALUE: main:_37 <- %RBP
	#DEBUG_VALUE: main:_34 <- %RBP
	movq	64(%rsp), %rbx          # 8-byte Reload
	.loc	1 355 8                 # GCD.c:355:8
	movq	(%rbx,%rbp,8), %rsi
.Ltmp118:
	#DEBUG_VALUE: main:_35 <- %RSI
	.loc	1 357 4                 # GCD.c:357:4
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp119:
	.loc	1 365 9                 # GCD.c:365:9
	movq	(%rbx,%rbp,8), %rax
.Ltmp120:
	#DEBUG_VALUE: gcd:_7 <- 0
	#DEBUG_VALUE: gcd:_6 <- 0
	#DEBUG_VALUE: gcd:_5 <- 0
	#DEBUG_VALUE: gcd:_4 <- 0
	#DEBUG_VALUE: gcd:_3 <- 0
	#DEBUG_VALUE: gcd:_2 <- 0
	#DEBUG_VALUE: main:_38 <- %RAX
	.loc	1 35 7                  # GCD.c:35:7
	testq	%r12, %r12
	movq	%r12, %rcx
	movq	24(%rsp), %rdx          # 8-byte Reload
	je	.LBB2_43
.Ltmp121:
	.p2align	4, 0x90
.LBB2_39:                               # %blklab4.i
                                        #   Parent Loop BB2_15 Depth=1
                                        #     Parent Loop BB2_32 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	#DEBUG_VALUE: gcd:_5 <- 0
	.loc	1 37 6                  # GCD.c:37:6
	movq	%rdx, %rsi
	subq	%rcx, %rsi
	jle	.LBB2_42
.Ltmp122:
# BB#40:                                # %if.end9.i
                                        #   in Loop: Header=BB2_39 Depth=3
	#DEBUG_VALUE: gcd:_4 <- 0
	.loc	1 367 11                # GCD.c:367:11
	movq	%rsi, %rdx
	jns	.LBB2_39
	jmp	.LBB2_41
.LBB2_42:                               # %blklab5.i
                                        #   in Loop: Header=BB2_39 Depth=3
	#DEBUG_VALUE: gcd:_4 <- 0
.Ltmp123:
	.loc	1 35 6                  # GCD.c:35:6
	subq	%rdx, %rcx
	jne	.LBB2_39
.Ltmp124:
.LBB2_43:                               # %gcd.exit
                                        #   in Loop: Header=BB2_32 Depth=2
	#DEBUG_VALUE: main:_39 <- %RDX
	#DEBUG_VALUE: main:_40 <- 1
	.loc	1 369 11                # GCD.c:369:11
	cmpq	%rdx, %rax
	jne	.LBB2_41
.Ltmp125:
# BB#31:                                # %while.cond22
                                        #   in Loop: Header=BB2_32 Depth=2
	#DEBUG_VALUE: main:_39 <- %RDX
	.loc	1 380 9                 # GCD.c:380:9
	movq	%r15, 8(%rsp)           # 8-byte Spill
	incq	%r12
.Ltmp126:
	#DEBUG_VALUE: main:_41 <- %R12
	#DEBUG_VALUE: main:j <- %R12
	movb	$1, %r15b
	.loc	1 312 7                 # GCD.c:312:7
	cmpq	16(%rsp), %r12          # 8-byte Folded Reload
	jl	.LBB2_32
	jmp	.LBB2_25
.Ltmp127:
	.p2align	4, 0x90
.LBB2_16:                               #   in Loop: Header=BB2_15 Depth=1
	#DEBUG_VALUE: gcd:a <- %RAX
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	%rcx, 56(%rsp)          # 8-byte Spill
	movq	%rcx, %r12
	xorl	%ebx, %ebx
.Ltmp128:
	.p2align	4, 0x90
.LBB2_17:                               # %if.end27.us
                                        #   Parent Loop BB2_15 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 316 4                 # GCD.c:316:4
	testb	$1, %r15b
	je	.LBB2_19
# BB#18:                                # %if.then29.us
                                        #   in Loop: Header=BB2_17 Depth=2
.Ltmp129:
	.loc	1 316 4 is_stmt 0 discriminator 1 # GCD.c:316:4
	movq	%r14, %rdi
	callq	free
.Ltmp130:
	#DEBUG_VALUE: main:_20_has_ownership <- 0
.LBB2_19:                               # %if.end30.us
                                        #   in Loop: Header=BB2_17 Depth=2
	#DEBUG_VALUE: main:_20_size <- 8
	.loc	1 317 4 is_stmt 1       # GCD.c:317:4
	movl	$64, %edi
	callq	malloc
	movq	%rax, %r14
.Ltmp131:
	#DEBUG_VALUE: main:_20 <- %R14
	.loc	1 318 11                # GCD.c:318:11
	movaps	.LCPI2_2(%rip), %xmm0   # xmm0 = [78,117]
	movups	%xmm0, (%r14)
	.loc	1 318 38 is_stmt 0      # GCD.c:318:38
	movaps	.LCPI2_3(%rip), %xmm0   # xmm0 = [109,98]
	movups	%xmm0, 16(%r14)
	.loc	1 318 65                # GCD.c:318:65
	movaps	.LCPI2_4(%rip), %xmm0   # xmm0 = [101,114]
	movups	%xmm0, 32(%r14)
	.loc	1 318 93                # GCD.c:318:93
	movaps	.LCPI2_5(%rip), %xmm0   # xmm0 = [58,32]
	movups	%xmm0, 48(%r14)
.Ltmp132:
	#DEBUG_VALUE: main:_20_has_ownership <- 1
	.loc	1 321 4 is_stmt 1       # GCD.c:321:4
	movl	$8, %esi
	movq	%r14, %rdi
	callq	printf_s
	.loc	1 325 4                 # GCD.c:325:4
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	printf
.Ltmp133:
	.loc	1 329 4                 # GCD.c:329:4
	testb	$1, %r15b
	je	.LBB2_21
.Ltmp134:
# BB#20:                                # %if.then42.us
                                        #   in Loop: Header=BB2_17 Depth=2
	#DEBUG_VALUE: main:_20 <- %R14
	.loc	1 329 4 is_stmt 0 discriminator 1 # GCD.c:329:4
	movq	%r13, %rdi
	callq	free
.Ltmp135:
	#DEBUG_VALUE: main:_25_has_ownership <- 0
.LBB2_21:                               # %if.end43.us
                                        #   in Loop: Header=BB2_17 Depth=2
	#DEBUG_VALUE: main:_20 <- %R14
	#DEBUG_VALUE: main:_25_size <- 9
	.loc	1 330 4 is_stmt 1       # GCD.c:330:4
	movl	$72, %edi
	callq	malloc
	movq	%rax, %r13
.Ltmp136:
	#DEBUG_VALUE: main:_25 <- %R13
	.loc	1 331 11                # GCD.c:331:11
	movaps	.LCPI2_6(%rip), %xmm0   # xmm0 = [32,78]
	movups	%xmm0, (%r13)
	.loc	1 331 37 is_stmt 0      # GCD.c:331:37
	movaps	.LCPI2_7(%rip), %xmm0   # xmm0 = [117,109]
	movups	%xmm0, 16(%r13)
	.loc	1 331 65                # GCD.c:331:65
	movaps	.LCPI2_8(%rip), %xmm0   # xmm0 = [98,101]
	movups	%xmm0, 32(%r13)
	.loc	1 331 92                # GCD.c:331:92
	movaps	.LCPI2_9(%rip), %xmm0   # xmm0 = [114,58]
	movups	%xmm0, 48(%r13)
	.loc	1 331 119               # GCD.c:331:119
	movq	$32, 64(%r13)
.Ltmp137:
	#DEBUG_VALUE: main:_25_has_ownership <- 1
	.loc	1 334 4 is_stmt 1       # GCD.c:334:4
	movl	$9, %esi
	movq	%r13, %rdi
	callq	printf_s
.Ltmp138:
	#DEBUG_VALUE: gcd:b <- %RBX
	.loc	1 338 4                 # GCD.c:338:4
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	printf
.Ltmp139:
	.loc	1 342 4                 # GCD.c:342:4
	testb	$1, %r15b
	je	.LBB2_23
.Ltmp140:
# BB#22:                                # %if.then56.us
                                        #   in Loop: Header=BB2_17 Depth=2
	#DEBUG_VALUE: main:_20 <- %R14
	#DEBUG_VALUE: gcd:b <- %RBX
	#DEBUG_VALUE: main:_25 <- %R13
	.loc	1 342 4 is_stmt 0 discriminator 1 # GCD.c:342:4
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	free
.Ltmp141:
	#DEBUG_VALUE: main:_30_has_ownership <- 0
.LBB2_23:                               # %if.end57.us
                                        #   in Loop: Header=BB2_17 Depth=2
	#DEBUG_VALUE: main:_20 <- %R14
	#DEBUG_VALUE: gcd:b <- %RBX
	#DEBUG_VALUE: main:_25 <- %R13
	#DEBUG_VALUE: main:_30_size <- 5
	.loc	1 343 4 is_stmt 1       # GCD.c:343:4
	movl	$40, %edi
	callq	malloc
	movq	%rax, %rbp
.Ltmp142:
	#DEBUG_VALUE: main:_30 <- %RBP
	.loc	1 344 11                # GCD.c:344:11
	movaps	.LCPI2_10(%rip), %xmm0  # xmm0 = [32,71]
	movups	%xmm0, (%rbp)
	.loc	1 344 37 is_stmt 0      # GCD.c:344:37
	movaps	.LCPI2_11(%rip), %xmm0  # xmm0 = [67,68]
	movups	%xmm0, 16(%rbp)
	.loc	1 344 63                # GCD.c:344:63
	movq	$58, 32(%rbp)
.Ltmp143:
	#DEBUG_VALUE: main:_30_has_ownership <- 1
	.loc	1 347 4 is_stmt 1       # GCD.c:347:4
	movl	$5, %esi
	movq	%rbp, %rdi
	callq	printf_s
	.loc	1 355 8                 # GCD.c:355:8
	movq	(%r12), %rsi
.Ltmp144:
	#DEBUG_VALUE: main:_35 <- %RSI
	.loc	1 357 4                 # GCD.c:357:4
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp145:
	#DEBUG_VALUE: gcd:_7 <- 0
	#DEBUG_VALUE: gcd:_6 <- 0
	#DEBUG_VALUE: gcd:_5 <- 0
	#DEBUG_VALUE: gcd:_4 <- 0
	#DEBUG_VALUE: gcd:_3 <- 0
	#DEBUG_VALUE: gcd:_2 <- 0
	#DEBUG_VALUE: main:_40 <- 1
	.loc	1 369 8                 # GCD.c:369:8
	cmpq	(%r12), %rbx
	jne	.LBB2_41
.Ltmp146:
# BB#24:                                # %while.cond22.us
                                        #   in Loop: Header=BB2_17 Depth=2
	#DEBUG_VALUE: main:_25 <- %R13
	#DEBUG_VALUE: gcd:b <- %RBX
	#DEBUG_VALUE: main:_20 <- %R14
	#DEBUG_VALUE: main:_30 <- %RBP
	.loc	1 380 9                 # GCD.c:380:9
	movq	%rbp, 8(%rsp)           # 8-byte Spill
	incq	%rbx
.Ltmp147:
	#DEBUG_VALUE: main:_41 <- %RBX
	#DEBUG_VALUE: main:j <- %RBX
	.loc	1 312 8                 # GCD.c:312:8
	addq	$8, %r12
	movb	$1, %r15b
	cmpq	16(%rsp), %rbx          # 8-byte Folded Reload
	jl	.LBB2_17
.Ltmp148:
.LBB2_25:                               # %blklab20
                                        #   in Loop: Header=BB2_15 Depth=1
	#DEBUG_VALUE: main:_42 <- 1
	movq	24(%rsp), %rax          # 8-byte Reload
	.loc	1 391 8                 # GCD.c:391:8
	incq	%rax
.Ltmp149:
	#DEBUG_VALUE: main:_43 <- %RAX
	#DEBUG_VALUE: main:i <- %RAX
	movq	56(%rsp), %rcx          # 8-byte Reload
	.loc	1 304 6                 # GCD.c:304:6
	addq	48(%rsp), %rcx          # 8-byte Folded Reload
	movb	$1, %r15b
.Ltmp150:
	.loc	1 304 7 is_stmt 0       # GCD.c:304:7
	cmpq	16(%rsp), %rax          # 8-byte Folded Reload
	jl	.LBB2_15
.Ltmp151:
# BB#26:
	#DEBUG_VALUE: main:i <- %RAX
	#DEBUG_VALUE: main:_43 <- %RAX
	xorl	%ebx, %ebx
	movq	72(%rsp), %r12          # 8-byte Reload
	movq	64(%rsp), %rax          # 8-byte Reload
.Ltmp152:
	movq	8(%rsp), %rcx           # 8-byte Reload
.LBB2_27:                               # %if.end91
	movq	%rcx, %rbp
.Ltmp153:
	.loc	1 402 2 is_stmt 1 discriminator 1 # GCD.c:402:2
	movq	%rax, %rdi
	callq	free
.Ltmp154:
	#DEBUG_VALUE: main:gcds_has_ownership <- 0
	.loc	1 403 2 discriminator 1 # GCD.c:403:2
	movq	%r12, %rdi
	movq	80(%rsp), %rsi          # 8-byte Reload
	callq	free2DArray
.Ltmp155:
	#DEBUG_VALUE: main:_7_has_ownership <- 0
	.loc	1 405 2 discriminator 1 # GCD.c:405:2
	movq	40(%rsp), %rdi          # 8-byte Reload
	callq	free
.Ltmp156:
	#DEBUG_VALUE: main:_12_has_ownership <- 0
	.loc	1 407 2                 # GCD.c:407:2
	testb	%bl, %bl
	jne	.LBB2_29
# BB#28:                                # %if.then93
.Ltmp157:
	.loc	1 407 2 is_stmt 0 discriminator 1 # GCD.c:407:2
	movq	%r14, %rdi
	callq	free
.Ltmp158:
	#DEBUG_VALUE: main:_20_has_ownership <- 0
.LBB2_29:                               # %if.end94
	.loc	1 408 2 is_stmt 1       # GCD.c:408:2
	testb	%r15b, %r15b
	je	.LBB2_45
# BB#30:                                # %if.then96
.Ltmp159:
	.loc	1 408 2 is_stmt 0 discriminator 1 # GCD.c:408:2
	movq	%r13, %rdi
	callq	free
.Ltmp160:
	#DEBUG_VALUE: main:_25_has_ownership <- 0
	.loc	1 409 2 is_stmt 1 discriminator 1 # GCD.c:409:2
	movq	%rbp, %rdi
	callq	free
.Ltmp161:
	#DEBUG_VALUE: main:_30_has_ownership <- 0
	.loc	1 410 2                 # GCD.c:410:2
	xorl	%edi, %edi
	callq	exit
.LBB2_41:                               # %if.end3.i
.Ltmp162:
	.loc	1 26 12                 # GCD.c:26:12
	movq	stderr(%rip), %rcx
	.loc	1 26 4 is_stmt 0        # GCD.c:26:4
	movl	$.L.str, %edi
	movl	$4, %esi
	movl	$1, %edx
	callq	fwrite
	.loc	1 27 4 is_stmt 1        # GCD.c:27:4
	movl	$-1, %edi
	callq	exit
.Ltmp163:
.LBB2_44:                               # %if.end97.thread
	#DEBUG_VALUE: main:_6 <- %RBX
	#DEBUG_VALUE: main:max <- %RBX
	#DEBUG_VALUE: main:_7 <- %R12
	.loc	1 403 2 discriminator 1 # GCD.c:403:2
	movq	%r12, %rdi
	movq	%rbp, %rsi
	callq	free2DArray
.Ltmp164:
	#DEBUG_VALUE: main:_7_has_ownership <- 0
.LBB2_45:                               # %if.end100
	.loc	1 410 2                 # GCD.c:410:2
	xorl	%edi, %edi
	callq	exit
.Ltmp165:
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"fail"
	.size	.L.str, 5

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"%d\n"
	.size	.L.str.1, 4

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"%lld"
	.size	.L.str.2, 5

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"%lld\n"
	.size	.L.str.3, 6

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)" # string offset=0
.Linfo_string1:
	.asciz	"GCD.c"                 # string offset=165
.Linfo_string2:
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/GCD/impl/autogenerate" # string offset=171
.Linfo_string3:
	.asciz	"gcd_cached"            # string offset=232
.Linfo_string4:
	.asciz	"long long int"         # string offset=243
.Linfo_string5:
	.asciz	"n"                     # string offset=257
.Linfo_string6:
	.asciz	"_28"                   # string offset=259
.Linfo_string7:
	.asciz	"_27"                   # string offset=263
.Linfo_string8:
	.asciz	"_26"                   # string offset=267
.Linfo_string9:
	.asciz	"_25"                   # string offset=271
.Linfo_string10:
	.asciz	"_24"                   # string offset=275
.Linfo_string11:
	.asciz	"_23"                   # string offset=279
.Linfo_string12:
	.asciz	"_22"                   # string offset=283
.Linfo_string13:
	.asciz	"_21"                   # string offset=287
.Linfo_string14:
	.asciz	"_20"                   # string offset=291
.Linfo_string15:
	.asciz	"_19"                   # string offset=295
.Linfo_string16:
	.asciz	"_18"                   # string offset=299
.Linfo_string17:
	.asciz	"_17"                   # string offset=303
.Linfo_string18:
	.asciz	"_16"                   # string offset=307
.Linfo_string19:
	.asciz	"_15"                   # string offset=311
.Linfo_string20:
	.asciz	"_14"                   # string offset=315
.Linfo_string21:
	.asciz	"_13"                   # string offset=319
.Linfo_string22:
	.asciz	"_12"                   # string offset=323
.Linfo_string23:
	.asciz	"_11"                   # string offset=327
.Linfo_string24:
	.asciz	"_10"                   # string offset=331
.Linfo_string25:
	.asciz	"_9_has_ownership"      # string offset=335
.Linfo_string26:
	.asciz	"_Bool"                 # string offset=352
.Linfo_string27:
	.asciz	"_9_size"               # string offset=358
.Linfo_string28:
	.asciz	"_8"                    # string offset=366
.Linfo_string29:
	.asciz	"_7"                    # string offset=369
.Linfo_string30:
	.asciz	"b"                     # string offset=372
.Linfo_string31:
	.asciz	"a"                     # string offset=374
.Linfo_string32:
	.asciz	"j"                     # string offset=376
.Linfo_string33:
	.asciz	"i"                     # string offset=378
.Linfo_string34:
	.asciz	"gcds_has_ownership"    # string offset=380
.Linfo_string35:
	.asciz	"gcds_size"             # string offset=399
.Linfo_string36:
	.asciz	"_1_has_ownership"      # string offset=409
.Linfo_string37:
	.asciz	"_1_size"               # string offset=426
.Linfo_string38:
	.asciz	"gcds"                  # string offset=434
.Linfo_string39:
	.asciz	"_9"                    # string offset=439
.Linfo_string40:
	.asciz	"_1"                    # string offset=442
.Linfo_string41:
	.asciz	"gcd"                   # string offset=445
.Linfo_string42:
	.asciz	"_6"                    # string offset=449
.Linfo_string43:
	.asciz	"_5"                    # string offset=452
.Linfo_string44:
	.asciz	"_4"                    # string offset=455
.Linfo_string45:
	.asciz	"_3"                    # string offset=458
.Linfo_string46:
	.asciz	"_2"                    # string offset=461
.Linfo_string47:
	.asciz	"main"                  # string offset=464
.Linfo_string48:
	.asciz	"int"                   # string offset=469
.Linfo_string49:
	.asciz	"argc"                  # string offset=473
.Linfo_string50:
	.asciz	"args"                  # string offset=478
.Linfo_string51:
	.asciz	"char"                  # string offset=483
.Linfo_string52:
	.asciz	"_43"                   # string offset=488
.Linfo_string53:
	.asciz	"_42"                   # string offset=492
.Linfo_string54:
	.asciz	"_41"                   # string offset=496
.Linfo_string55:
	.asciz	"_40"                   # string offset=500
.Linfo_string56:
	.asciz	"_39"                   # string offset=504
.Linfo_string57:
	.asciz	"_38"                   # string offset=508
.Linfo_string58:
	.asciz	"_37"                   # string offset=512
.Linfo_string59:
	.asciz	"_36"                   # string offset=516
.Linfo_string60:
	.asciz	"_35"                   # string offset=520
.Linfo_string61:
	.asciz	"_34"                   # string offset=524
.Linfo_string62:
	.asciz	"_33"                   # string offset=528
.Linfo_string63:
	.asciz	"_30_has_ownership"     # string offset=532
.Linfo_string64:
	.asciz	"_30_size"              # string offset=550
.Linfo_string65:
	.asciz	"_25_has_ownership"     # string offset=559
.Linfo_string66:
	.asciz	"_25_size"              # string offset=577
.Linfo_string67:
	.asciz	"_20_has_ownership"     # string offset=586
.Linfo_string68:
	.asciz	"_20_size"              # string offset=604
.Linfo_string69:
	.asciz	"_15_has_ownership"     # string offset=613
.Linfo_string70:
	.asciz	"_15_size"              # string offset=631
.Linfo_string71:
	.asciz	"_12_has_ownership"     # string offset=640
.Linfo_string72:
	.asciz	"_12_size"              # string offset=658
.Linfo_string73:
	.asciz	"_7_has_ownership"      # string offset=667
.Linfo_string74:
	.asciz	"_7_size_size"          # string offset=684
.Linfo_string75:
	.asciz	"_7_size"               # string offset=697
.Linfo_string76:
	.asciz	"max"                   # string offset=705
.Linfo_string77:
	.asciz	"_30"                   # string offset=709
.Linfo_string78:
	.asciz	"_31"                   # string offset=713
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
	.quad	.Ltmp22-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp22-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Ltmp22-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Ltmp22-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Ltmp22-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp36-.Lfunc_begin0
	.quad	.Ltmp37-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Ltmp22-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp35-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Ltmp22-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp28-.Lfunc_begin0
	.quad	.Ltmp29-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Ltmp22-.Lfunc_begin0
	.quad	.Ltmp33-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp33-.Lfunc_begin0
	.quad	.Ltmp34-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Ltmp22-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp28-.Lfunc_begin0
	.quad	.Ltmp29-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Ltmp22-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp28-.Lfunc_begin0
	.quad	.Ltmp29-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp22-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp28-.Lfunc_begin0
	.quad	.Ltmp29-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp22-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp36-.Lfunc_begin0
	.quad	.Ltmp37-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp22-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp22-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp36-.Lfunc_begin0
	.quad	.Ltmp37-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp22-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp22-.Lfunc_begin0
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
.Ldebug_loc17:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp62-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp149-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp149-.Lfunc_begin0
	.quad	.Ltmp152-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp148-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp148-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc23:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp126-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp126-.Lfunc_begin0
	.quad	.Ltmp127-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	.Ltmp147-.Lfunc_begin0
	.quad	.Ltmp148-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp124-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp124-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp124-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp124-.Lfunc_begin0
	.quad	.Ltmp127-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp120-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp120-.Lfunc_begin0
	.quad	.Ltmp121-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp117-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp117-.Lfunc_begin0
	.quad	.Ltmp121-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp99-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp99-.Lfunc_begin0
	.quad	.Ltmp100-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Ltmp101-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	32                      # 32
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp118-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp118-.Lfunc_begin0
	.quad	.Ltmp119-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp144-.Lfunc_begin0
	.quad	.Ltmp145-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp117-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp117-.Lfunc_begin0
	.quad	.Ltmp121-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp99-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp99-.Lfunc_begin0
	.quad	.Ltmp100-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Ltmp101-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	32                      # 32
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp116-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp116-.Lfunc_begin0
	.quad	.Ltmp141-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp141-.Lfunc_begin0
	.quad	.Ltmp143-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp143-.Lfunc_begin0
	.quad	.Ltmp161-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp161-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc33:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp114-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp114-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	5                       # 5
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc34:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp110-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp110-.Lfunc_begin0
	.quad	.Ltmp135-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp135-.Lfunc_begin0
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
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc35:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp108-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp108-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	9                       # 9
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc36:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp105-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp105-.Lfunc_begin0
	.quad	.Ltmp130-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp130-.Lfunc_begin0
	.quad	.Ltmp132-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp132-.Lfunc_begin0
	.quad	.Ltmp158-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp158-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc37:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp103-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp103-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	8                       # 8
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc38:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp71-.Lfunc_begin0
	.quad	.Ltmp156-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp156-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc39:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	4                       # 4
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc40:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Ltmp155-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp155-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc41:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc42:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp126-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp126-.Lfunc_begin0
	.quad	.Ltmp127-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	.Ltmp147-.Lfunc_begin0
	.quad	.Ltmp148-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc43:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp149-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp149-.Lfunc_begin0
	.quad	.Ltmp152-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc44:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc45:
	.quad	.Ltmp61-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	.Ltmp163-.Lfunc_begin0
	.quad	.Ltmp164-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc46:
	.quad	.Ltmp64-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc47:
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp163-.Lfunc_begin0
	.quad	.Ltmp164-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc48:
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp163-.Lfunc_begin0
	.quad	.Ltmp164-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc49:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc50:
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp72-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	40                      # 40
	.quad	0
	.quad	0
.Ldebug_loc51:
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp95-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp95-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc52:
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp92-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc53:
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp83-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	91                      # DW_OP_reg11
	.quad	0
	.quad	0
.Ldebug_loc54:
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp90-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp90-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc55:
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp83-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	91                      # DW_OP_reg11
	.quad	0
	.quad	0
.Ldebug_loc56:
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp83-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	91                      # DW_OP_reg11
	.quad	0
	.quad	0
.Ldebug_loc57:
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp83-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	91                      # DW_OP_reg11
	.quad	0
	.quad	0
.Ldebug_loc58:
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp76-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc59:
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc60:
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc61:
	.quad	.Ltmp97-.Lfunc_begin0
	.quad	.Ltmp101-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp128-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc62:
	.quad	.Ltmp104-.Lfunc_begin0
	.quad	.Ltmp121-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	.Ltmp131-.Lfunc_begin0
	.quad	.Ltmp148-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc63:
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp121-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	.Ltmp136-.Lfunc_begin0
	.quad	.Ltmp148-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc64:
	.quad	.Ltmp111-.Lfunc_begin0
	.quad	.Ltmp121-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	.Ltmp138-.Lfunc_begin0
	.quad	.Ltmp147-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc65:
	.quad	.Ltmp115-.Lfunc_begin0
	.quad	.Ltmp121-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp142-.Lfunc_begin0
	.quad	.Ltmp148-.Lfunc_begin0
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
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	6                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
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
	.byte	28                      # DW_AT_const_value
	.byte	15                      # DW_FORM_udata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
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
	.byte	10                      # Abbreviation Code
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
	.byte	11                      # Abbreviation Code
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
	.byte	12                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
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
	.byte	17                      # Abbreviation Code
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
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	19                      # Abbreviation Code
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
	.byte	20                      # Abbreviation Code
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
	.long	2028                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x7e5 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x1 DW_TAG_pointer_type
	.byte	3                       # Abbrev [3] 0x2b:0x4a DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	814                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x3e:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	826                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x47:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	837                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x50:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	903                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x56:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	892                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x5c:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	881                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x62:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	870                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x68:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	859                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x6e:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	848                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	3                       # Abbrev [3] 0x75:0x118 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	397                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x88:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	409                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x91:0x9 DW_TAG_variable
	.long	.Ldebug_loc3            # DW_AT_location
	.long	420                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x9a:0x9 DW_TAG_variable
	.long	.Ldebug_loc4            # DW_AT_location
	.long	431                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xa3:0x9 DW_TAG_variable
	.long	.Ldebug_loc5            # DW_AT_location
	.long	442                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xac:0x9 DW_TAG_variable
	.long	.Ldebug_loc6            # DW_AT_location
	.long	453                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0xb5:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	464                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xbb:0x9 DW_TAG_variable
	.long	.Ldebug_loc7            # DW_AT_location
	.long	475                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xc4:0x9 DW_TAG_variable
	.long	.Ldebug_loc8            # DW_AT_location
	.long	486                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0xcd:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	497                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0xd3:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	508                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0xd9:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	519                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0xdf:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	530                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xe5:0x9 DW_TAG_variable
	.long	.Ldebug_loc9            # DW_AT_location
	.long	541                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xee:0x9 DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	552                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0xf7:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	563                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0xfd:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	574                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x103:0x9 DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	585                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x10c:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	596                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x112:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	607                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x118:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	618                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x11e:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	629                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x124:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	640                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x12a:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	651                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x130:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	662                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x136:0x9 DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	673                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x13f:0x9 DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	684                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x148:0x9 DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	695                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x151:0x9 DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	706                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x15a:0x9 DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	717                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x163:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	728                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x169:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	739                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x16f:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	750                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x175:0x9 DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	761                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x17e:0x9 DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	772                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x187:0x5 DW_TAG_variable
	.long	783                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0x18d:0x18e DW_TAG_subprogram
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	795                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	10                      # Abbrev [10] 0x199:0xb DW_TAG_formal_parameter
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1a4:0xb DW_TAG_variable
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	93                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1af:0xb DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	92                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1ba:0xb DW_TAG_variable
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	91                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1c5:0xb DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	90                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1d0:0xb DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	89                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1db:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	88                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1e6:0xb DW_TAG_variable
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	87                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1f1:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	86                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1fc:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	85                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x207:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	84                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x212:0xb DW_TAG_variable
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	83                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x21d:0xb DW_TAG_variable
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	82                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x228:0xb DW_TAG_variable
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	81                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x233:0xb DW_TAG_variable
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	80                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x23e:0xb DW_TAG_variable
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	79                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x249:0xb DW_TAG_variable
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	78                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x254:0xb DW_TAG_variable
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	77                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x25f:0xb DW_TAG_variable
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	76                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x26a:0xb DW_TAG_variable
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	75                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x275:0xb DW_TAG_variable
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	74                      # DW_AT_decl_line
	.long	807                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x280:0xb DW_TAG_variable
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	73                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x28b:0xb DW_TAG_variable
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	72                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x296:0xb DW_TAG_variable
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	71                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x2a1:0xb DW_TAG_variable
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x2ac:0xb DW_TAG_variable
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	69                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x2b7:0xb DW_TAG_variable
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	68                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x2c2:0xb DW_TAG_variable
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	67                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x2cd:0xb DW_TAG_variable
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	66                      # DW_AT_decl_line
	.long	807                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x2d8:0xb DW_TAG_variable
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	65                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x2e3:0xb DW_TAG_variable
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	807                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x2ee:0xb DW_TAG_variable
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x2f9:0xb DW_TAG_variable
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	65                      # DW_AT_decl_line
	.long	795                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x304:0xb DW_TAG_variable
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	73                      # DW_AT_decl_line
	.long	795                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x30f:0xb DW_TAG_variable
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	795                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x31b:0x5 DW_TAG_pointer_type
	.long	800                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x320:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	13                      # Abbrev [13] 0x327:0x7 DW_TAG_base_type
	.long	.Linfo_string26         # DW_AT_name
	.byte	2                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	9                       # Abbrev [9] 0x32e:0x65 DW_TAG_subprogram
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	800                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	10                      # Abbrev [10] 0x33a:0xb DW_TAG_formal_parameter
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x345:0xb DW_TAG_formal_parameter
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x350:0xb DW_TAG_variable
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x35b:0xb DW_TAG_variable
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x366:0xb DW_TAG_variable
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x371:0xb DW_TAG_variable
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x37c:0xb DW_TAG_variable
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x387:0xb DW_TAG_variable
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	14                      # Abbrev [14] 0x393:0x43f DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	216                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	2002                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	15                      # Abbrev [15] 0x3ac:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	216                     # DW_AT_decl_line
	.long	2002                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x3bb:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	216                     # DW_AT_decl_line
	.long	2009                    # DW_AT_type
	.byte	16                      # Abbrev [16] 0x3ca:0x10 DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	259                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x3da:0x10 DW_TAG_variable
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	258                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x3ea:0x10 DW_TAG_variable
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	257                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x3fa:0x10 DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	256                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x40a:0xf DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	255                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x419:0xf DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	254                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x428:0xf DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	253                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x437:0xf DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	252                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x446:0xf DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	251                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x455:0xf DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	250                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x464:0xf DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	249                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x473:0xf DW_TAG_variable
	.long	.Ldebug_loc32           # DW_AT_location
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	247                     # DW_AT_decl_line
	.long	807                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x482:0xf DW_TAG_variable
	.long	.Ldebug_loc33           # DW_AT_location
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	246                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x491:0xf DW_TAG_variable
	.long	.Ldebug_loc34           # DW_AT_location
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	243                     # DW_AT_decl_line
	.long	807                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x4a0:0xf DW_TAG_variable
	.long	.Ldebug_loc35           # DW_AT_location
	.long	.Linfo_string66         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	242                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x4af:0xf DW_TAG_variable
	.long	.Ldebug_loc36           # DW_AT_location
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	239                     # DW_AT_decl_line
	.long	807                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x4be:0xf DW_TAG_variable
	.long	.Ldebug_loc37           # DW_AT_location
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	238                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x4cd:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	236                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x4d9:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	235                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	19                      # Abbrev [19] 0x4e5:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	234                     # DW_AT_decl_line
	.long	807                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x4f1:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	233                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x4fd:0xf DW_TAG_variable
	.long	.Ldebug_loc38           # DW_AT_location
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	231                     # DW_AT_decl_line
	.long	807                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x50c:0xf DW_TAG_variable
	.long	.Ldebug_loc39           # DW_AT_location
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	230                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	19                      # Abbrev [19] 0x51b:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	228                     # DW_AT_decl_line
	.long	807                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x527:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	227                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x533:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	226                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x53f:0xf DW_TAG_variable
	.long	.Ldebug_loc40           # DW_AT_location
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	225                     # DW_AT_decl_line
	.long	807                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x54e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	224                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x55a:0xf DW_TAG_variable
	.long	.Ldebug_loc41           # DW_AT_location
	.long	.Linfo_string75         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	224                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x569:0xf DW_TAG_variable
	.long	.Ldebug_loc42           # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	222                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x578:0xf DW_TAG_variable
	.long	.Ldebug_loc43           # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	221                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	19                      # Abbrev [19] 0x587:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	220                     # DW_AT_decl_line
	.long	807                     # DW_AT_type
	.byte	18                      # Abbrev [18] 0x593:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	219                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x59f:0xf DW_TAG_variable
	.long	.Ldebug_loc44           # DW_AT_location
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	218                     # DW_AT_decl_line
	.long	800                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x5ae:0xf DW_TAG_variable
	.long	.Ldebug_loc45           # DW_AT_location
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	224                     # DW_AT_decl_line
	.long	2026                    # DW_AT_type
	.byte	17                      # Abbrev [17] 0x5bd:0xf DW_TAG_variable
	.long	.Ldebug_loc46           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	227                     # DW_AT_decl_line
	.long	795                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x5cc:0xf DW_TAG_variable
	.long	.Ldebug_loc47           # DW_AT_location
	.long	.Linfo_string76         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	217                     # DW_AT_decl_line
	.long	795                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x5db:0xf DW_TAG_variable
	.long	.Ldebug_loc48           # DW_AT_location
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	223                     # DW_AT_decl_line
	.long	795                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x5ea:0xf DW_TAG_variable
	.long	.Ldebug_loc50           # DW_AT_location
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	230                     # DW_AT_decl_line
	.long	795                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x5f9:0xf DW_TAG_variable
	.long	.Ldebug_loc62           # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	238                     # DW_AT_decl_line
	.long	795                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x608:0xf DW_TAG_variable
	.long	.Ldebug_loc63           # DW_AT_location
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	242                     # DW_AT_decl_line
	.long	795                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x617:0xf DW_TAG_variable
	.long	.Ldebug_loc65           # DW_AT_location
	.long	.Linfo_string77         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	246                     # DW_AT_decl_line
	.long	795                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x626:0xb DW_TAG_variable
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	219                     # DW_AT_decl_line
	.long	795                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x631:0xb DW_TAG_variable
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	229                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	11                      # Abbrev [11] 0x63c:0xb DW_TAG_variable
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	232                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	11                      # Abbrev [11] 0x647:0xb DW_TAG_variable
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	233                     # DW_AT_decl_line
	.long	795                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x652:0xb DW_TAG_variable
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	237                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	11                      # Abbrev [11] 0x65d:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	240                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	11                      # Abbrev [11] 0x668:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	241                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	11                      # Abbrev [11] 0x673:0xb DW_TAG_variable
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	244                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	11                      # Abbrev [11] 0x67e:0xb DW_TAG_variable
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	245                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	11                      # Abbrev [11] 0x689:0xb DW_TAG_variable
	.long	.Linfo_string78         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	248                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	20                      # Abbrev [20] 0x694:0xfa DW_TAG_inlined_subroutine
	.long	397                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.short	290                     # DW_AT_call_line
	.byte	4                       # Abbrev [4] 0x6a0:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc49           # DW_AT_location
	.long	409                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x6a9:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	420                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x6af:0x9 DW_TAG_variable
	.long	.Ldebug_loc51           # DW_AT_location
	.long	431                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x6b8:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	442                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x6be:0x9 DW_TAG_variable
	.long	.Ldebug_loc52           # DW_AT_location
	.long	453                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x6c7:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	464                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x6cd:0x9 DW_TAG_variable
	.long	.Ldebug_loc53           # DW_AT_location
	.long	475                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x6d6:0x9 DW_TAG_variable
	.long	.Ldebug_loc54           # DW_AT_location
	.long	486                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x6df:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	497                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x6e5:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	508                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x6eb:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	519                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x6f1:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	530                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x6f7:0x9 DW_TAG_variable
	.long	.Ldebug_loc55           # DW_AT_location
	.long	541                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x700:0x9 DW_TAG_variable
	.long	.Ldebug_loc56           # DW_AT_location
	.long	552                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x709:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	563                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x70f:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	574                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x715:0x9 DW_TAG_variable
	.long	.Ldebug_loc57           # DW_AT_location
	.long	585                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x71e:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	596                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x724:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	607                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x72a:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	618                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x730:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	629                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x736:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	640                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x73c:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	651                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x742:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	662                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x748:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	673                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x74e:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	684                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x754:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	695                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x75a:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	706                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x760:0x9 DW_TAG_variable
	.long	.Ldebug_loc58           # DW_AT_location
	.long	717                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x769:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	728                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x76f:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	739                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x775:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	750                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x77b:0x9 DW_TAG_variable
	.long	.Ldebug_loc59           # DW_AT_location
	.long	761                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x784:0x9 DW_TAG_variable
	.long	.Ldebug_loc60           # DW_AT_location
	.long	772                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	20                      # Abbrev [20] 0x78e:0x43 DW_TAG_inlined_subroutine
	.long	814                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges1         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.short	367                     # DW_AT_call_line
	.byte	4                       # Abbrev [4] 0x79a:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc61           # DW_AT_location
	.long	826                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x7a3:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc64           # DW_AT_location
	.long	837                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x7ac:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	848                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x7b2:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	859                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x7b8:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	870                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x7be:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	881                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x7c4:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	892                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x7ca:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	903                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	13                      # Abbrev [13] 0x7d2:0x7 DW_TAG_base_type
	.long	.Linfo_string48         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	12                      # Abbrev [12] 0x7d9:0x5 DW_TAG_pointer_type
	.long	2014                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x7de:0x5 DW_TAG_pointer_type
	.long	2019                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x7e3:0x7 DW_TAG_base_type
	.long	.Linfo_string51         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	12                      # Abbrev [12] 0x7ea:0x5 DW_TAG_pointer_type
	.long	795                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.quad	.Ltmp93-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.quad	.Ltmp96-.Lfunc_begin0
	.quad	0
	.quad	0
.Ldebug_ranges1:
	.quad	.Ltmp97-.Lfunc_begin0
	.quad	.Ltmp98-.Lfunc_begin0
	.quad	.Ltmp120-.Lfunc_begin0
	.quad	.Ltmp122-.Lfunc_begin0
	.quad	.Ltmp123-.Lfunc_begin0
	.quad	.Ltmp124-.Lfunc_begin0
	.quad	.Ltmp162-.Lfunc_begin0
	.quad	.Ltmp163-.Lfunc_begin0
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
	.long	2032                    # Compilation Unit Length
	.long	397                     # DIE offset
	.asciz	"gcd_cached"            # External Name
	.long	915                     # DIE offset
	.asciz	"main"                  # External Name
	.long	814                     # DIE offset
	.asciz	"gcd"                   # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	2032                    # Compilation Unit Length
	.long	800                     # DIE offset
	.asciz	"long long int"         # External Name
	.long	807                     # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	2002                    # DIE offset
	.asciz	"int"                   # External Name
	.long	2019                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
