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

	.globl	gcd_cached
	.p2align	4, 0x90
	.type	gcd_cached,@function
gcd_cached:                             # @gcd_cached
.Lfunc_begin1:
	.loc	1 62 0                  # GCD.c:62:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp9:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp10:
	.cfi_def_cfa_offset 24
	pushq	%rax
.Ltmp11:
	.cfi_def_cfa_offset 32
.Ltmp12:
	.cfi_offset %rbx, -24
.Ltmp13:
	.cfi_offset %r14, -16
	#DEBUG_VALUE: gcd_cached:a <- %RDI
	#DEBUG_VALUE: gcd_cached:b <- %RSI
	#DEBUG_VALUE: gcd_cached:n <- %RDX
	#DEBUG_VALUE: gcd_cached:gcds <- %RCX
	#DEBUG_VALUE: gcd_cached:gcds_size <- %R8
	#DEBUG_VALUE: gcd_cached:gcds_has_ownership [bit_piece offset=0 size=1] <- %R9D
	movq	%rsi, %r14
.Ltmp14:
	#DEBUG_VALUE: gcd_cached:b <- %R14
	movq	%rdi, %rbx
.Ltmp15:
	#DEBUG_VALUE: gcd_cached:_11 <- 0
	#DEBUG_VALUE: gcd_cached:_10 <- 0
	#DEBUG_VALUE: gcd_cached:_9 <- 0
	#DEBUG_VALUE: gcd_cached:_8 <- 0
	#DEBUG_VALUE: gcd_cached:_7 <- 0
	#DEBUG_VALUE: gcd_cached:_6 <- 0
	#DEBUG_VALUE: gcd_cached:_5 <- 0
	#DEBUG_VALUE: gcd_cached:_4 <- 0
	#DEBUG_VALUE: gcd_cached:gcds_has_ownership [bit_piece offset=0 size=1] <- %R9B
	#DEBUG_VALUE: gcd_cached:a <- %RBX
	.loc	1 74 5 prologue_end     # GCD.c:74:5
	testq	%rbx, %rbx
	je	.LBB1_6
.Ltmp16:
# BB#1:                                 # %blklab7
	#DEBUG_VALUE: gcd_cached:a <- %RBX
	#DEBUG_VALUE: gcd_cached:gcds_has_ownership [bit_piece offset=0 size=1] <- %R9B
	#DEBUG_VALUE: gcd_cached:b <- %R14
	#DEBUG_VALUE: gcd_cached:gcds_size <- %R8
	#DEBUG_VALUE: gcd_cached:gcds <- %RCX
	#DEBUG_VALUE: gcd_cached:n <- %RDX
	#DEBUG_VALUE: gcd_cached:_6 <- 0
	.loc	1 85 5                  # GCD.c:85:5
	testq	%r14, %r14
	je	.LBB1_2
.Ltmp17:
# BB#5:                                 # %blklab9
	#DEBUG_VALUE: gcd_cached:n <- %RDX
	#DEBUG_VALUE: gcd_cached:gcds <- %RCX
	#DEBUG_VALUE: gcd_cached:gcds_size <- %R8
	#DEBUG_VALUE: gcd_cached:b <- %R14
	#DEBUG_VALUE: gcd_cached:gcds_has_ownership [bit_piece offset=0 size=1] <- %R9B
	#DEBUG_VALUE: gcd_cached:a <- %RBX
	movq	%rbx, %rax
	negq	%rax
	xorl	%esi, %esi
.Ltmp18:
	.loc	1 94 6                  # GCD.c:94:6
	cmpq	%r14, %rbx
	cmovgq	%rsi, %rax
.Ltmp19:
	.loc	1 94 5 is_stmt 0        # GCD.c:94:5
	cmovgq	%r14, %rsi
	addq	%r14, %rax
	subq	%rsi, %rbx
.Ltmp20:
	.loc	1 110 6 is_stmt 1       # GCD.c:110:6
	imulq	%rdx, %rbx
.Ltmp21:
	#DEBUG_VALUE: gcd_cached:_9 <- %RBX
	.loc	1 112 8                 # GCD.c:112:8
	addq	%rax, %rbx
.Ltmp22:
	#DEBUG_VALUE: gcd_cached:_10 <- %RBX
	.loc	1 114 6                 # GCD.c:114:6
	movq	(%rcx,%rbx,8), %r14
.Ltmp23:
.LBB1_6:                                # %blklab9
	#DEBUG_VALUE: gcd_cached:gcds_has_ownership [bit_piece offset=0 size=1] <- %R9B
	#DEBUG_VALUE: gcd_cached:gcds_size <- %R8
	#DEBUG_VALUE: gcd_cached:gcds <- %RCX
	#DEBUG_VALUE: gcd_cached:n <- %RDX
	#DEBUG_VALUE: gcd_cached:_11 <- %R14
	.loc	1 116 2                 # GCD.c:116:2
	testb	%r9b, %r9b
	je	.LBB1_8
.Ltmp24:
# BB#7:                                 # %if.then14
	#DEBUG_VALUE: gcd_cached:n <- %RDX
	#DEBUG_VALUE: gcd_cached:gcds <- %RCX
	#DEBUG_VALUE: gcd_cached:gcds_size <- %R8
	#DEBUG_VALUE: gcd_cached:gcds_has_ownership [bit_piece offset=0 size=1] <- %R9B
	#DEBUG_VALUE: gcd_cached:_11 <- %R14
	.loc	1 116 2 is_stmt 0 discriminator 1 # GCD.c:116:2
	movq	%rcx, %rdi
	callq	free
.Ltmp25:
	#DEBUG_VALUE: gcd_cached:gcds_has_ownership <- 0
	jmp	.LBB1_8
.Ltmp26:
.LBB1_2:                                # %if.end5
	#DEBUG_VALUE: gcd_cached:n <- %RDX
	#DEBUG_VALUE: gcd_cached:gcds <- %RCX
	#DEBUG_VALUE: gcd_cached:gcds_size <- %R8
	#DEBUG_VALUE: gcd_cached:b <- %R14
	#DEBUG_VALUE: gcd_cached:gcds_has_ownership [bit_piece offset=0 size=1] <- %R9B
	#DEBUG_VALUE: gcd_cached:a <- %RBX
	.loc	1 87 2 is_stmt 1        # GCD.c:87:2
	testb	%r9b, %r9b
	je	.LBB1_3
.Ltmp27:
# BB#4:                                 # %if.then7
	#DEBUG_VALUE: gcd_cached:a <- %RBX
	#DEBUG_VALUE: gcd_cached:gcds_has_ownership [bit_piece offset=0 size=1] <- %R9B
	#DEBUG_VALUE: gcd_cached:b <- %R14
	#DEBUG_VALUE: gcd_cached:gcds_size <- %R8
	#DEBUG_VALUE: gcd_cached:gcds <- %RCX
	#DEBUG_VALUE: gcd_cached:n <- %RDX
	.loc	1 87 2 is_stmt 0 discriminator 1 # GCD.c:87:2
	movq	%rcx, %rdi
	callq	free
.Ltmp28:
	#DEBUG_VALUE: gcd_cached:gcds_has_ownership <- 0
	movq	%rbx, %r14
.Ltmp29:
	jmp	.LBB1_8
.Ltmp30:
.LBB1_3:
	#DEBUG_VALUE: gcd_cached:a <- %RBX
	#DEBUG_VALUE: gcd_cached:gcds_has_ownership [bit_piece offset=0 size=1] <- %R9B
	#DEBUG_VALUE: gcd_cached:b <- %R14
	#DEBUG_VALUE: gcd_cached:gcds_size <- %R8
	#DEBUG_VALUE: gcd_cached:gcds <- %RCX
	#DEBUG_VALUE: gcd_cached:n <- %RDX
	movq	%rbx, %r14
.Ltmp31:
.LBB1_8:                                # %cleanup
	.loc	1 123 1 is_stmt 1 discriminator 2 # GCD.c:123:1
	movq	%r14, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
.Ltmp32:
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
	.quad	2                       # 0x2
	.quad	3                       # 0x3
.LCPI2_3:
	.quad	83                      # 0x53
	.quad	117                     # 0x75
.LCPI2_4:
	.quad	109                     # 0x6d
	.quad	58                      # 0x3a
.LCPI2_5:
	.quad	80                      # 0x50
	.quad	97                      # 0x61
.LCPI2_6:
	.quad	115                     # 0x73
	.quad	115                     # 0x73
.LCPI2_7:
	.quad	32                      # 0x20
	.quad	99                      # 0x63
.LCPI2_8:
	.quad	97                      # 0x61
	.quad	99                      # 0x63
.LCPI2_9:
	.quad	104                     # 0x68
	.quad	101                     # 0x65
.LCPI2_10:
	.quad	100                     # 0x64
	.quad	32                      # 0x20
.LCPI2_11:
	.quad	69                      # 0x45
	.quad	117                     # 0x75
.LCPI2_12:
	.quad	99                      # 0x63
	.quad	108                     # 0x6c
.LCPI2_13:
	.quad	105                     # 0x69
	.quad	100                     # 0x64
.LCPI2_14:
	.quad	32                      # 0x20
	.quad	71                      # 0x47
.LCPI2_15:
	.quad	67                      # 0x43
	.quad	68                      # 0x44
.LCPI2_16:
	.quad	32                      # 0x20
	.quad	116                     # 0x74
.LCPI2_17:
	.quad	101                     # 0x65
	.quad	115                     # 0x73
.LCPI2_18:
	.quad	116                     # 0x74
	.quad	32                      # 0x20
.LCPI2_19:
	.quad	99                      # 0x63
	.quad	97                      # 0x61
.LCPI2_20:
	.quad	115                     # 0x73
	.quad	101                     # 0x65
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin2:
	.loc	1 125 0                 # GCD.c:125:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp33:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp34:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp35:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp36:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp37:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp38:
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
.Ltmp39:
	.cfi_def_cfa_offset 96
.Ltmp40:
	.cfi_offset %rbx, -56
.Ltmp41:
	.cfi_offset %r12, -48
.Ltmp42:
	.cfi_offset %r13, -40
.Ltmp43:
	.cfi_offset %r14, -32
.Ltmp44:
	.cfi_offset %r15, -24
.Ltmp45:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
	movl	%edi, %ebx
.Ltmp46:
	#DEBUG_VALUE: main:_40_has_ownership <- 0
	#DEBUG_VALUE: main:_40_size <- 0
	#DEBUG_VALUE: main:_35_has_ownership <- 0
	#DEBUG_VALUE: main:_35_size <- 0
	#DEBUG_VALUE: main:_32 <- 0
	#DEBUG_VALUE: main:_31 <- 0
	#DEBUG_VALUE: main:_30 <- 0
	#DEBUG_VALUE: main:_29 <- 0
	#DEBUG_VALUE: main:_28 <- 0
	#DEBUG_VALUE: main:_27 <- 0
	#DEBUG_VALUE: main:_26 <- 0
	#DEBUG_VALUE: main:_25 <- 0
	#DEBUG_VALUE: main:_24 <- 0
	#DEBUG_VALUE: main:_23 <- 0
	#DEBUG_VALUE: main:_22 <- 0
	#DEBUG_VALUE: main:_21 <- 0
	#DEBUG_VALUE: main:_20 <- 0
	#DEBUG_VALUE: main:_19 <- 0
	#DEBUG_VALUE: main:_18_has_ownership <- 0
	#DEBUG_VALUE: main:_18_size <- 0
	#DEBUG_VALUE: main:_17 <- 0
	#DEBUG_VALUE: main:_16 <- 0
	#DEBUG_VALUE: main:_13_has_ownership <- 0
	#DEBUG_VALUE: main:_13_size <- 0
	#DEBUG_VALUE: main:_10_has_ownership <- 0
	#DEBUG_VALUE: main:_10_size <- 0
	#DEBUG_VALUE: main:_9 <- 0
	#DEBUG_VALUE: main:_8_has_ownership <- 0
	#DEBUG_VALUE: main:_8_size_size <- 0
	#DEBUG_VALUE: main:_8_size <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:sum <- 0
	#DEBUG_VALUE: main:gcds_has_ownership <- 0
	#DEBUG_VALUE: main:gcds_size <- 0
	#DEBUG_VALUE: main:n <- 0
	#DEBUG_VALUE: main:argc <- %EBX
	.loc	1 169 2 prologue_end    # GCD.c:169:2
	callq	convertArgsToIntArray
.Ltmp47:
	#DEBUG_VALUE: main:_8 <- %RAX
	movq	%rax, (%rsp)            # 8-byte Spill
	decl	%ebx
.Ltmp48:
	movslq	%ebx, %rcx
.Ltmp49:
	#DEBUG_VALUE: main:_8_has_ownership <- 1
	#DEBUG_VALUE: main:_8_size <- %EBX
	.loc	1 174 6                 # GCD.c:174:6
	movq	%rcx, 16(%rsp)          # 8-byte Spill
	movq	(%rax), %rdi
.Ltmp50:
	#DEBUG_VALUE: main:_10 <- %RDI
	#DEBUG_VALUE: main:_8 <- [%RSP+0]
	.loc	1 176 2                 # GCD.c:176:2
	callq	parseStringToInt
.Ltmp51:
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_7 <- %RAX
	.loc	1 180 9                 # GCD.c:180:9
	testq	%rax, %rax
.Ltmp52:
	.loc	1 180 5 is_stmt 0       # GCD.c:180:5
	je	.LBB2_20
.Ltmp53:
# BB#1:                                 # %if.end
	#DEBUG_VALUE: main:_7 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_8_size <- %EBX
	.loc	1 182 6 is_stmt 1       # GCD.c:182:6
	movq	(%rax), %rbx
.Ltmp54:
	#DEBUG_VALUE: gcd_cached:n <- %RBX
	#DEBUG_VALUE: main:_13_size <- 4
	#DEBUG_VALUE: main:n <- %RBX
	.loc	1 187 2                 # GCD.c:187:2
	movl	$32, %edi
	callq	malloc
.Ltmp55:
	#DEBUG_VALUE: main:_13 <- %RAX
	.loc	1 188 9                 # GCD.c:188:9
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movaps	.LCPI2_0(%rip), %xmm0   # xmm0 = [78,32]
	movups	%xmm0, (%rax)
	.loc	1 188 35 is_stmt 0      # GCD.c:188:35
	movdqa	.LCPI2_1(%rip), %xmm0   # xmm0 = [61,32]
	movdqu	%xmm0, 16(%rax)
.Ltmp56:
	#DEBUG_VALUE: main:_13_has_ownership <- 1
	.loc	1 191 2 is_stmt 1       # GCD.c:191:2
	movl	$4, %esi
	movq	%rax, %rdi
.Ltmp57:
	#DEBUG_VALUE: main:_13 <- [%RSP+8]
	callq	printf_s
.Ltmp58:
	.loc	1 202 2                 # GCD.c:202:2
	xorl	%ebp, %ebp
	.loc	1 195 2                 # GCD.c:195:2
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	printf
	#DEBUG_VALUE: main:_16 <- 0
	.loc	1 199 7                 # GCD.c:199:7
	movl	%ebx, %esi
	imull	%esi, %esi
	.loc	1 202 2                 # GCD.c:202:2
	xorl	%edi, %edi
	callq	gen1DArray
	movq	%rax, %r13
.Ltmp59:
	#DEBUG_VALUE: main:gcds <- %R13
	#DEBUG_VALUE: main:_18 <- %R13
	#DEBUG_VALUE: gcd_cached:gcds <- %R13
	#DEBUG_VALUE: main:_20 <- 0
	#DEBUG_VALUE: main:_19 <- 0
	#DEBUG_VALUE: main:_18_has_ownership <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:sum <- 0
	#DEBUG_VALUE: main:gcds_has_ownership <- 1
	.loc	1 220 6                 # GCD.c:220:6
	testq	%rbx, %rbx
	jle	.LBB2_19
.Ltmp60:
# BB#2:                                 # %while.cond24.preheader.us.preheader
	#DEBUG_VALUE: gcd_cached:gcds <- %R13
	#DEBUG_VALUE: main:_18 <- %R13
	#DEBUG_VALUE: main:gcds <- %R13
	#DEBUG_VALUE: main:n <- %RBX
	#DEBUG_VALUE: gcd_cached:n <- %RBX
	.loc	1 74 6                  # GCD.c:74:6
	leaq	-4(%rbx), %rax
	shrq	$2, %rax
.Ltmp61:
	.loc	1 129 2                 # GCD.c:129:2
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	%rbx, %rcx
	andq	$-4, %rcx
	andl	$1, %eax
	movq	%rax, 24(%rsp)          # 8-byte Spill
.Ltmp62:
	.loc	1 74 6                  # GCD.c:74:6
	leaq	(,%rbx,8), %r10
	xorl	%edi, %edi
.Ltmp63:
	.loc	1 237 14                # GCD.c:237:14
	movl	$1, %r11d
	movd	%r11, %xmm0
	pslldq	$8, %xmm0               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7]
	movdqa	.LCPI2_2(%rip), %xmm1   # xmm1 = [2,3]
	movq	%r13, %r14
	xorl	%ebp, %ebp
	xorl	%r9d, %r9d
.Ltmp64:
	.p2align	4, 0x90
.LBB2_3:                                # %while.cond24.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_5 Depth 2
                                        #     Child Loop BB2_16 Depth 2
                                        #     Child Loop BB2_10 Depth 2
	#DEBUG_VALUE: gcd_cached:a <- %R9
	.loc	1 74 5                  # GCD.c:74:5
	testq	%r9, %r9
	je	.LBB2_8
.Ltmp65:
# BB#4:                                 #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: gcd_cached:a <- %R9
	.loc	1 231 10                # GCD.c:231:10
	movq	%r9, %rax
	negq	%rax
	movq	%r14, %rdx
	xorl	%r15d, %r15d
.Ltmp66:
	.p2align	4, 0x90
.LBB2_5:                                # %if.end29.us196
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: main:gcds_has_ownership <- 1
	#DEBUG_VALUE: gcd_cached:gcds_has_ownership [bit_piece offset=0 size=1] <- 0
	#DEBUG_VALUE: gcd_cached:_4 <- 0
	#DEBUG_VALUE: gcd_cached:_5 <- 0
	#DEBUG_VALUE: gcd_cached:_6 <- 0
	#DEBUG_VALUE: gcd_cached:_7 <- 0
	#DEBUG_VALUE: gcd_cached:_8 <- 0
	#DEBUG_VALUE: gcd_cached:_9 <- 0
	#DEBUG_VALUE: gcd_cached:_10 <- 0
	#DEBUG_VALUE: gcd_cached:_11 <- 0
	#DEBUG_VALUE: gcd_cached:b <- %R15
	.loc	1 85 6                  # GCD.c:85:6
	testq	%r15, %r15
.Ltmp67:
	.loc	1 231 10                # GCD.c:231:10
	movq	%r9, %rsi
	je	.LBB2_7
.Ltmp68:
# BB#6:                                 # %blklab9.i.us201
                                        #   in Loop: Header=BB2_5 Depth=2
	#DEBUG_VALUE: gcd_cached:b <- %R15
	.loc	1 94 6                  # GCD.c:94:6
	cmpq	%r15, %r9
.Ltmp69:
	.loc	1 231 10                # GCD.c:231:10
	movq	%rax, %rsi
	cmovgq	%rdi, %rsi
.Ltmp70:
	.loc	1 94 5                  # GCD.c:94:5
	movl	$0, %r8d
	cmovgq	%r15, %r8
	movq	%r9, %r12
	subq	%r8, %r12
	.loc	1 114 6                 # GCD.c:114:6
	imulq	%rbx, %r12
	addq	%rsi, %r12
	addq	%r15, %r12
	movq	(%r13,%r12,8), %rsi
.Ltmp71:
	#DEBUG_VALUE: gcd_cached:_11 <- %RSI
.LBB2_7:                                # %gcd_cached.exit.us210
                                        #   in Loop: Header=BB2_5 Depth=2
	#DEBUG_VALUE: gcd_cached:b <- %R15
	#DEBUG_VALUE: main:_22 <- %RSI
	.loc	1 237 14                # GCD.c:237:14
	movq	%rsi, (%rdx)
	.loc	1 245 11                # GCD.c:245:11
	addq	%rsi, %rbp
.Ltmp72:
	#DEBUG_VALUE: main:_29 <- 1
	#DEBUG_VALUE: main:_28 <- %RBP
	#DEBUG_VALUE: main:sum <- %RBP
	.loc	1 251 9                 # GCD.c:251:9
	incq	%r15
.Ltmp73:
	#DEBUG_VALUE: main:_30 <- %R15
	#DEBUG_VALUE: main:j <- %R15
	.loc	1 228 7                 # GCD.c:228:7
	addq	$8, %rdx
	cmpq	%r15, %rbx
	jne	.LBB2_5
	jmp	.LBB2_18
.Ltmp74:
	.p2align	4, 0x90
.LBB2_8:                                # %if.end29.us.us.preheader
                                        #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: gcd_cached:a <- %R9
	cmpq	$4, %rbx
	jb	.LBB2_9
.Ltmp75:
# BB#11:                                # %min.iters.checked
                                        #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: gcd_cached:a <- %R9
	testq	%rcx, %rcx
	je	.LBB2_9
.Ltmp76:
# BB#12:                                # %vector.ph
                                        #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: gcd_cached:a <- %R9
	.loc	1 129 2                 # GCD.c:129:2
	movd	%rbp, %xmm4
	pxor	%xmm2, %xmm2
	cmpq	$0, 24(%rsp)            # 8-byte Folded Reload
	jne	.LBB2_13
.Ltmp77:
# BB#14:                                # %vector.body.prol
                                        #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: gcd_cached:a <- %R9
	.loc	1 233 9                 # GCD.c:233:9
	movq	%r9, %rax
	imulq	%rbx, %rax
.Ltmp78:
	#DEBUG_VALUE: main:_25 <- %RAX
	#DEBUG_VALUE: main:_23 <- %RAX
	.loc	1 237 14                # GCD.c:237:14
	movdqu	%xmm0, (%r13,%rax,8)
	movdqu	%xmm1, 16(%r13,%rax,8)
	.loc	1 245 11                # GCD.c:245:11
	paddq	%xmm0, %xmm4
	movdqa	%xmm4, %xmm3
	movl	$4, %ebp
	movdqa	%xmm1, %xmm2
	jmp	.LBB2_15
.Ltmp79:
	.p2align	4, 0x90
.LBB2_9:                                #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: gcd_cached:a <- %R9
	xorl	%eax, %eax
	jmp	.LBB2_10
.Ltmp80:
.LBB2_13:                               #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: gcd_cached:a <- %R9
                                        # implicit-def: %XMM3
	xorl	%ebp, %ebp
.Ltmp81:
.LBB2_15:                               # %vector.ph.split
                                        #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: gcd_cached:a <- %R9
	cmpq	$0, 32(%rsp)            # 8-byte Folded Reload
	movdqa	%xmm1, %xmm5
	je	.LBB2_17
.Ltmp82:
	.p2align	4, 0x90
.LBB2_16:                               # %vector.body
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movd	%rbp, %xmm3
	pshufd	$68, %xmm3, %xmm5       # xmm5 = xmm3[0,1,0,1]
	movd	%r11, %xmm3
	pslldq	$8, %xmm3               # xmm3 = zero,zero,zero,zero,zero,zero,zero,zero,xmm3[0,1,2,3,4,5,6,7]
	movdqa	%xmm5, %xmm6
	paddq	%xmm3, %xmm6
	paddq	%xmm1, %xmm5
	.loc	1 237 14                # GCD.c:237:14
	movdqu	%xmm6, (%r14,%rbp,8)
	movdqu	%xmm5, 16(%r14,%rbp,8)
	.loc	1 245 11                # GCD.c:245:11
	paddq	%xmm4, %xmm6
	paddq	%xmm2, %xmm5
.Ltmp83:
	.loc	1 129 2                 # GCD.c:129:2
	leaq	4(%rbp), %rax
	movd	%rax, %xmm2
	pshufd	$68, %xmm2, %xmm2       # xmm2 = xmm2[0,1,0,1]
	paddq	%xmm2, %xmm3
	paddq	%xmm1, %xmm2
.Ltmp84:
	.loc	1 237 14                # GCD.c:237:14
	movdqu	%xmm3, 32(%r14,%rbp,8)
	movdqu	%xmm2, 48(%r14,%rbp,8)
	.loc	1 245 11                # GCD.c:245:11
	paddq	%xmm6, %xmm3
	paddq	%xmm5, %xmm2
.Ltmp85:
	.loc	1 129 2                 # GCD.c:129:2
	addq	$8, %rbp
	cmpq	%rcx, %rbp
	movdqa	%xmm3, %xmm4
	movdqa	%xmm2, %xmm5
	jne	.LBB2_16
.LBB2_17:                               # %middle.block
                                        #   in Loop: Header=BB2_3 Depth=1
	cmpq	%rcx, %rbx
.Ltmp86:
	.loc	1 245 11                # GCD.c:245:11
	paddq	%xmm3, %xmm5
	pshufd	$78, %xmm5, %xmm2       # xmm2 = xmm5[2,3,0,1]
	paddq	%xmm5, %xmm2
	movd	%xmm2, %rbp
	movq	%rcx, %rax
	je	.LBB2_18
	.p2align	4, 0x90
.LBB2_10:                               # %if.end29.us.us
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: main:gcds_has_ownership <- 1
.Ltmp87:
	#DEBUG_VALUE: main:_22 <- %RAX
	#DEBUG_VALUE: gcd_cached:gcds_has_ownership [bit_piece offset=0 size=1] <- 0
	#DEBUG_VALUE: gcd_cached:_4 <- 0
	#DEBUG_VALUE: gcd_cached:_5 <- 0
	#DEBUG_VALUE: gcd_cached:_6 <- 0
	#DEBUG_VALUE: gcd_cached:_7 <- 0
	#DEBUG_VALUE: gcd_cached:_8 <- 0
	#DEBUG_VALUE: gcd_cached:_9 <- 0
	#DEBUG_VALUE: gcd_cached:_10 <- 0
	#DEBUG_VALUE: gcd_cached:_11 <- 0
	.loc	1 237 14                # GCD.c:237:14
	movq	%rax, (%r14,%rax,8)
	.loc	1 245 11                # GCD.c:245:11
	addq	%rax, %rbp
	#DEBUG_VALUE: main:_29 <- 1
.Ltmp88:
	#DEBUG_VALUE: main:_28 <- %RBP
	#DEBUG_VALUE: main:sum <- %RBP
	.loc	1 251 9                 # GCD.c:251:9
	incq	%rax
.Ltmp89:
	#DEBUG_VALUE: main:_30 <- %RAX
	#DEBUG_VALUE: main:j <- %RAX
	.loc	1 228 7                 # GCD.c:228:7
	cmpq	%rax, %rbx
	jne	.LBB2_10
.Ltmp90:
.LBB2_18:                               # %blklab16.loopexit.us
                                        #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: main:_31 <- 1
	.loc	1 262 8                 # GCD.c:262:8
	incq	%r9
.Ltmp91:
	#DEBUG_VALUE: main:_32 <- %R9
	#DEBUG_VALUE: main:i <- %R9
	.loc	1 220 6                 # GCD.c:220:6
	addq	%r10, %r14
	cmpq	%rbx, %r9
	jne	.LBB2_3
.Ltmp92:
.LBB2_19:                               # %if.then86
	#DEBUG_VALUE: main:_35_size <- 5
	.loc	1 274 2                 # GCD.c:274:2
	movl	$40, %edi
	callq	malloc
	movq	%rax, %rbx
.Ltmp93:
	#DEBUG_VALUE: main:_35 <- %RBX
	.loc	1 275 9                 # GCD.c:275:9
	movaps	.LCPI2_3(%rip), %xmm0   # xmm0 = [83,117]
	movups	%xmm0, (%rbx)
	.loc	1 275 36 is_stmt 0      # GCD.c:275:36
	movaps	.LCPI2_4(%rip), %xmm0   # xmm0 = [109,58]
	movups	%xmm0, 16(%rbx)
	.loc	1 275 63                # GCD.c:275:63
	movq	$32, 32(%rbx)
.Ltmp94:
	#DEBUG_VALUE: main:_35_has_ownership <- 1
	.loc	1 278 2 is_stmt 1       # GCD.c:278:2
	movl	$5, %esi
	movq	%rbx, %rdi
	callq	printf_s
	.loc	1 282 2                 # GCD.c:282:2
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%rbp, %rsi
	callq	printf
.Ltmp95:
	#DEBUG_VALUE: main:_40_size <- 32
	.loc	1 287 2                 # GCD.c:287:2
	movl	$256, %edi              # imm = 0x100
	callq	malloc
	movq	%rax, %rbp
.Ltmp96:
	#DEBUG_VALUE: main:_40 <- %RBP
	.loc	1 288 9                 # GCD.c:288:9
	movaps	.LCPI2_5(%rip), %xmm0   # xmm0 = [80,97]
	movups	%xmm0, (%rbp)
	.loc	1 288 35 is_stmt 0      # GCD.c:288:35
	movaps	.LCPI2_6(%rip), %xmm0   # xmm0 = [115,115]
	movups	%xmm0, 16(%rbp)
	.loc	1 288 63                # GCD.c:288:63
	movaps	.LCPI2_7(%rip), %xmm0   # xmm0 = [32,99]
	movups	%xmm0, 32(%rbp)
	.loc	1 288 89                # GCD.c:288:89
	movaps	.LCPI2_8(%rip), %xmm0   # xmm0 = [97,99]
	movups	%xmm0, 48(%rbp)
	.loc	1 288 115               # GCD.c:288:115
	movaps	.LCPI2_9(%rip), %xmm0   # xmm0 = [104,101]
	movups	%xmm0, 64(%rbp)
	.loc	1 288 144               # GCD.c:288:144
	movaps	.LCPI2_10(%rip), %xmm0  # xmm0 = [100,32]
	movups	%xmm0, 80(%rbp)
	.loc	1 288 173               # GCD.c:288:173
	movaps	.LCPI2_11(%rip), %xmm0  # xmm0 = [69,117]
	movups	%xmm0, 96(%rbp)
	.loc	1 288 202               # GCD.c:288:202
	movaps	.LCPI2_12(%rip), %xmm0  # xmm0 = [99,108]
	movups	%xmm0, 112(%rbp)
	.loc	1 288 231               # GCD.c:288:231
	movaps	.LCPI2_13(%rip), %xmm0  # xmm0 = [105,100]
	movups	%xmm0, 128(%rbp)
	.loc	1 288 261               # GCD.c:288:261
	movaps	.LCPI2_14(%rip), %xmm0  # xmm0 = [32,71]
	movups	%xmm0, 144(%rbp)
	.loc	1 288 289               # GCD.c:288:289
	movaps	.LCPI2_15(%rip), %xmm0  # xmm0 = [67,68]
	movups	%xmm0, 160(%rbp)
	.loc	1 288 317               # GCD.c:288:317
	movaps	.LCPI2_16(%rip), %xmm0  # xmm0 = [32,116]
	movups	%xmm0, 176(%rbp)
	.loc	1 288 346               # GCD.c:288:346
	movaps	.LCPI2_17(%rip), %xmm0  # xmm0 = [101,115]
	movups	%xmm0, 192(%rbp)
	.loc	1 288 376               # GCD.c:288:376
	movaps	.LCPI2_18(%rip), %xmm0  # xmm0 = [116,32]
	movups	%xmm0, 208(%rbp)
	.loc	1 288 405               # GCD.c:288:405
	movaps	.LCPI2_19(%rip), %xmm0  # xmm0 = [99,97]
	movups	%xmm0, 224(%rbp)
	.loc	1 288 433               # GCD.c:288:433
	movaps	.LCPI2_20(%rip), %xmm0  # xmm0 = [115,101]
	movups	%xmm0, 240(%rbp)
.Ltmp97:
	#DEBUG_VALUE: main:_40_has_ownership <- 1
	.loc	1 291 2 is_stmt 1       # GCD.c:291:2
	movl	$32, %esi
	movq	%rbp, %rdi
	callq	println_s
.Ltmp98:
	.loc	1 295 2 discriminator 1 # GCD.c:295:2
	movq	%r13, %rdi
	callq	free
.Ltmp99:
	#DEBUG_VALUE: main:gcds_has_ownership <- 0
	.loc	1 296 2 discriminator 1 # GCD.c:296:2
	movq	(%rsp), %rdi            # 8-byte Reload
	movq	16(%rsp), %rsi          # 8-byte Reload
	callq	free2DArray
.Ltmp100:
	#DEBUG_VALUE: main:_8_has_ownership <- 0
	.loc	1 298 2 discriminator 1 # GCD.c:298:2
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	free
.Ltmp101:
	#DEBUG_VALUE: main:_13_has_ownership <- 0
	.loc	1 300 2 discriminator 1 # GCD.c:300:2
	movq	%rbx, %rdi
	callq	free
.Ltmp102:
	#DEBUG_VALUE: main:_35_has_ownership <- 0
	.loc	1 301 2 discriminator 1 # GCD.c:301:2
	movq	%rbp, %rdi
	callq	free
.Ltmp103:
	#DEBUG_VALUE: main:_40_has_ownership <- 0
	.loc	1 302 2                 # GCD.c:302:2
	xorl	%edi, %edi
	callq	exit
.Ltmp104:
.LBB2_20:                               # %if.end105.critedge
	#DEBUG_VALUE: main:_7 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_8_size <- %EBX
	.loc	1 296 2 discriminator 1 # GCD.c:296:2
	movq	(%rsp), %rdi            # 8-byte Reload
	movq	16(%rsp), %rsi          # 8-byte Reload
	callq	free2DArray
.Ltmp105:
	#DEBUG_VALUE: main:_8_has_ownership <- 0
	.loc	1 302 2                 # GCD.c:302:2
	xorl	%edi, %edi
	callq	exit
.Ltmp106:
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
	.asciz	"%lld\n"
	.size	.L.str.1, 6

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)" # string offset=0
.Linfo_string1:
	.asciz	"GCD.c"                 # string offset=165
.Linfo_string2:
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/GCD/impl/autogenerate1" # string offset=171
.Linfo_string3:
	.asciz	"gcd_cached"            # string offset=233
.Linfo_string4:
	.asciz	"long long int"         # string offset=244
.Linfo_string5:
	.asciz	"a"                     # string offset=258
.Linfo_string6:
	.asciz	"b"                     # string offset=260
.Linfo_string7:
	.asciz	"n"                     # string offset=262
.Linfo_string8:
	.asciz	"gcds"                  # string offset=264
.Linfo_string9:
	.asciz	"gcds_size"             # string offset=269
.Linfo_string10:
	.asciz	"gcds_has_ownership"    # string offset=279
.Linfo_string11:
	.asciz	"_Bool"                 # string offset=298
.Linfo_string12:
	.asciz	"_4"                    # string offset=304
.Linfo_string13:
	.asciz	"_5"                    # string offset=307
.Linfo_string14:
	.asciz	"_6"                    # string offset=310
.Linfo_string15:
	.asciz	"_7"                    # string offset=313
.Linfo_string16:
	.asciz	"_8"                    # string offset=316
.Linfo_string17:
	.asciz	"_9"                    # string offset=319
.Linfo_string18:
	.asciz	"_10"                   # string offset=322
.Linfo_string19:
	.asciz	"_11"                   # string offset=326
.Linfo_string20:
	.asciz	"gcd"                   # string offset=330
.Linfo_string21:
	.asciz	"main"                  # string offset=334
.Linfo_string22:
	.asciz	"int"                   # string offset=339
.Linfo_string23:
	.asciz	"_2"                    # string offset=343
.Linfo_string24:
	.asciz	"_3"                    # string offset=346
.Linfo_string25:
	.asciz	"argc"                  # string offset=349
.Linfo_string26:
	.asciz	"args"                  # string offset=354
.Linfo_string27:
	.asciz	"char"                  # string offset=359
.Linfo_string28:
	.asciz	"_40_has_ownership"     # string offset=364
.Linfo_string29:
	.asciz	"_40_size"              # string offset=382
.Linfo_string30:
	.asciz	"_35_has_ownership"     # string offset=391
.Linfo_string31:
	.asciz	"_35_size"              # string offset=409
.Linfo_string32:
	.asciz	"_32"                   # string offset=418
.Linfo_string33:
	.asciz	"_31"                   # string offset=422
.Linfo_string34:
	.asciz	"_30"                   # string offset=426
.Linfo_string35:
	.asciz	"_29"                   # string offset=430
.Linfo_string36:
	.asciz	"_28"                   # string offset=434
.Linfo_string37:
	.asciz	"_27"                   # string offset=438
.Linfo_string38:
	.asciz	"_26"                   # string offset=442
.Linfo_string39:
	.asciz	"_25"                   # string offset=446
.Linfo_string40:
	.asciz	"_24"                   # string offset=450
.Linfo_string41:
	.asciz	"_23"                   # string offset=454
.Linfo_string42:
	.asciz	"_22"                   # string offset=458
.Linfo_string43:
	.asciz	"_21"                   # string offset=462
.Linfo_string44:
	.asciz	"_20"                   # string offset=466
.Linfo_string45:
	.asciz	"_19"                   # string offset=470
.Linfo_string46:
	.asciz	"_18_has_ownership"     # string offset=474
.Linfo_string47:
	.asciz	"_18_size"              # string offset=492
.Linfo_string48:
	.asciz	"_17"                   # string offset=501
.Linfo_string49:
	.asciz	"_16"                   # string offset=505
.Linfo_string50:
	.asciz	"_13_has_ownership"     # string offset=509
.Linfo_string51:
	.asciz	"_13_size"              # string offset=527
.Linfo_string52:
	.asciz	"_10_has_ownership"     # string offset=536
.Linfo_string53:
	.asciz	"_10_size"              # string offset=554
.Linfo_string54:
	.asciz	"_8_has_ownership"      # string offset=563
.Linfo_string55:
	.asciz	"_8_size_size"          # string offset=580
.Linfo_string56:
	.asciz	"_8_size"               # string offset=593
.Linfo_string57:
	.asciz	"j"                     # string offset=601
.Linfo_string58:
	.asciz	"i"                     # string offset=603
.Linfo_string59:
	.asciz	"sum"                   # string offset=605
.Linfo_string60:
	.asciz	"max"                   # string offset=609
.Linfo_string61:
	.asciz	"_13"                   # string offset=613
.Linfo_string62:
	.asciz	"_18"                   # string offset=617
.Linfo_string63:
	.asciz	"_35"                   # string offset=621
.Linfo_string64:
	.asciz	"_40"                   # string offset=625
.Linfo_string65:
	.asciz	"_14"                   # string offset=629
.Linfo_string66:
	.asciz	"_33"                   # string offset=633
.Linfo_string67:
	.asciz	"_36"                   # string offset=637
.Linfo_string68:
	.asciz	"_38"                   # string offset=641
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
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp26-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp23-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	.Ltmp26-.Lfunc_begin0
	.quad	.Ltmp29-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	.Ltmp30-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp25-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp26-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp30-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp25-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp26-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp30-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp25-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	.Ltmp26-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	.Ltmp30-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	89                      # super-register DW_OP_reg9
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp25-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	89                      # super-register DW_OP_reg9
	.byte	147                     # DW_OP_piece
	.byte	1                       # 1
	.quad	.Ltmp25-.Lfunc_begin0
	.quad	.Ltmp26-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp26-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	89                      # super-register DW_OP_reg9
	.byte	147                     # DW_OP_piece
	.byte	1                       # 1
	.quad	.Ltmp28-.Lfunc_begin0
	.quad	.Ltmp30-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp30-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	89                      # super-register DW_OP_reg9
	.byte	147                     # DW_OP_piece
	.byte	1                       # 1
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp23-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp26-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp22-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp22-.Lfunc_begin0
	.quad	.Ltmp23-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp21-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp22-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp97-.Lfunc_begin0
	.quad	.Ltmp103-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp103-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp95-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp95-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	32                      # 32
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp94-.Lfunc_begin0
	.quad	.Ltmp102-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp102-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp92-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	5                       # 5
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	89                      # DW_OP_reg9
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp90-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp90-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp89-.Lfunc_begin0
	.quad	.Ltmp90-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp72-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp72-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp90-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp78-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc23:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp78-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp71-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp56-.Lfunc_begin0
	.quad	.Ltmp101-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp101-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	4                       # 4
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp100-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp104-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp89-.Lfunc_begin0
	.quad	.Ltmp90-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	89                      # DW_OP_reg9
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp72-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp90-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp99-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp99-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc33:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Ltmp64-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc34:
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	0                       # 0
	.quad	0
	.quad	0
.Ldebug_loc35:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc36:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp104-.Lfunc_begin0
	.quad	.Ltmp105-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc37:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp104-.Lfunc_begin0
	.quad	.Ltmp105-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc38:
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Ltmp64-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc39:
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Ltmp57-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
	.quad	0
	.quad	0
.Ldebug_loc40:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp64-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc41:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp64-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc42:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp64-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc43:
	.quad	.Ltmp64-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	89                      # DW_OP_reg9
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	89                      # DW_OP_reg9
	.quad	0
	.quad	0
.Ldebug_loc44:
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp71-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc45:
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc46:
	.quad	.Ltmp93-.Lfunc_begin0
	.quad	.Ltmp104-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc47:
	.quad	.Ltmp96-.Lfunc_begin0
	.quad	.Ltmp104-.Lfunc_begin0
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
	.byte	7                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
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
	.byte	13                      # DW_FORM_sdata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	10                      # Abbreviation Code
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
	.byte	11                      # Abbreviation Code
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
	.byte	12                      # Abbreviation Code
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
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	15                      # Abbreviation Code
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
	.byte	16                      # Abbreviation Code
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
	.byte	17                      # Abbreviation Code
	.byte	29                      # DW_TAG_inlined_subroutine
	.byte	1                       # DW_CHILDREN_yes
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	85                      # DW_AT_ranges
	.byte	23                      # DW_FORM_sec_offset
	.byte	88                      # DW_AT_call_file
	.byte	11                      # DW_FORM_data1
	.byte	89                      # DW_AT_call_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	18                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	1366                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x54f DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x1 DW_TAG_pointer_type
	.byte	3                       # Abbrev [3] 0x2b:0x80 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	469                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	4                       # Abbrev [4] 0x44:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x53:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x62:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x6e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x7a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x86:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x92:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x9e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	6                       # Abbrev [6] 0xab:0x83 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	302                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0xbe:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	314                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0xc7:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc3            # DW_AT_location
	.long	325                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0xd0:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc4            # DW_AT_location
	.long	336                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0xd9:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc5            # DW_AT_location
	.long	347                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0xe2:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc6            # DW_AT_location
	.long	358                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0xeb:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc7            # DW_AT_location
	.long	369                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0xf4:0x9 DW_TAG_variable
	.long	.Ldebug_loc8            # DW_AT_location
	.long	457                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0xfd:0x9 DW_TAG_variable
	.long	.Ldebug_loc9            # DW_AT_location
	.long	446                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x106:0x9 DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	435                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x10f:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	424                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x115:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	413                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x11b:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	402                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x121:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	391                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x127:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	380                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	10                      # Abbrev [10] 0x12e:0xa7 DW_TAG_subprogram
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	469                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	11                      # Abbrev [11] 0x13a:0xb DW_TAG_formal_parameter
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x145:0xb DW_TAG_formal_parameter
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x150:0xb DW_TAG_formal_parameter
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x15b:0xb DW_TAG_formal_parameter
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	476                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x166:0xb DW_TAG_formal_parameter
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x171:0xb DW_TAG_formal_parameter
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	481                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x17c:0xb DW_TAG_variable
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x187:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x192:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	65                      # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x19d:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	66                      # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1a8:0xb DW_TAG_variable
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	67                      # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1b3:0xb DW_TAG_variable
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	68                      # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1be:0xb DW_TAG_variable
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	69                      # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1c9:0xb DW_TAG_variable
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	13                      # Abbrev [13] 0x1d5:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	14                      # Abbrev [14] 0x1dc:0x5 DW_TAG_pointer_type
	.long	469                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x1e1:0x7 DW_TAG_base_type
	.long	.Linfo_string11         # DW_AT_name
	.byte	2                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	3                       # Abbrev [3] 0x1e8:0x354 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	125                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1340                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	4                       # Abbrev [4] 0x201:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	125                     # DW_AT_decl_line
	.long	1340                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x210:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	125                     # DW_AT_decl_line
	.long	1347                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x21f:0xf DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	167                     # DW_AT_decl_line
	.long	481                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x22e:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	166                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x23d:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	163                     # DW_AT_decl_line
	.long	481                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x24c:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	162                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x25b:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	160                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x26a:0xf DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	159                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x279:0xf DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	158                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x288:0xf DW_TAG_variable
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	157                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x297:0xf DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	156                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2a6:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	155                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2b2:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	154                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x2be:0xf DW_TAG_variable
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	153                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2cd:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	152                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x2d9:0xf DW_TAG_variable
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	151                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x2e8:0xf DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	150                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2f7:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	149                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x303:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	148                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x30f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	147                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x31b:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	146                     # DW_AT_decl_line
	.long	481                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x327:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	145                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x333:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	144                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x33f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	143                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x34b:0xf DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	141                     # DW_AT_decl_line
	.long	481                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x35a:0xf DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	140                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x369:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	138                     # DW_AT_decl_line
	.long	481                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x375:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	137                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x381:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	136                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x38d:0xf DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	135                     # DW_AT_decl_line
	.long	481                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x39c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	134                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x3a8:0xf DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	134                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x3b7:0xf DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	132                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x3c6:0xf DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	131                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x3d5:0xf DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	130                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x3e4:0xf DW_TAG_variable
	.long	.Ldebug_loc32           # DW_AT_location
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	129                     # DW_AT_decl_line
	.long	481                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x3f3:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	128                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x3ff:0xf DW_TAG_variable
	.long	.Ldebug_loc33           # DW_AT_location
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	127                     # DW_AT_decl_line
	.long	469                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x40e:0xf DW_TAG_variable
	.long	.Ldebug_loc34           # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	134                     # DW_AT_decl_line
	.long	1364                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x41d:0xf DW_TAG_variable
	.long	.Ldebug_loc35           # DW_AT_location
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	137                     # DW_AT_decl_line
	.long	476                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x42c:0xf DW_TAG_variable
	.long	.Ldebug_loc36           # DW_AT_location
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	126                     # DW_AT_decl_line
	.long	476                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x43b:0xf DW_TAG_variable
	.long	.Ldebug_loc37           # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	133                     # DW_AT_decl_line
	.long	476                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x44a:0xf DW_TAG_variable
	.long	.Ldebug_loc39           # DW_AT_location
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	140                     # DW_AT_decl_line
	.long	476                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x459:0xf DW_TAG_variable
	.long	.Ldebug_loc40           # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	128                     # DW_AT_decl_line
	.long	476                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x468:0xf DW_TAG_variable
	.long	.Ldebug_loc41           # DW_AT_location
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	145                     # DW_AT_decl_line
	.long	476                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x477:0xf DW_TAG_variable
	.long	.Ldebug_loc46           # DW_AT_location
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	162                     # DW_AT_decl_line
	.long	476                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x486:0xf DW_TAG_variable
	.long	.Ldebug_loc47           # DW_AT_location
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	166                     # DW_AT_decl_line
	.long	476                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x495:0xb DW_TAG_variable
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	139                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x4a0:0xb DW_TAG_variable
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	142                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x4ab:0xb DW_TAG_variable
	.long	.Linfo_string66         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	161                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x4b6:0xb DW_TAG_variable
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	164                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x4c1:0xb DW_TAG_variable
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	165                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	17                      # Abbrev [17] 0x4cc:0x6f DW_TAG_inlined_subroutine
	.long	302                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	231                     # DW_AT_call_line
	.byte	7                       # Abbrev [7] 0x4d7:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc43           # DW_AT_location
	.long	314                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x4e0:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc45           # DW_AT_location
	.long	325                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x4e9:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc38           # DW_AT_location
	.long	336                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x4f2:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc42           # DW_AT_location
	.long	347                     # DW_AT_abstract_origin
	.byte	18                      # Abbrev [18] 0x4fb:0xc DW_TAG_formal_parameter
	.byte	6                       # DW_AT_location
	.byte	16
	.byte	0
	.byte	159
	.byte	157
	.byte	1
	.byte	0
	.long	369                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x507:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	380                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x50d:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	391                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x513:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	402                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x519:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	413                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x51f:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	424                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x525:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	435                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x52b:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	446                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x531:0x9 DW_TAG_variable
	.long	.Ldebug_loc44           # DW_AT_location
	.long	457                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	13                      # Abbrev [13] 0x53c:0x7 DW_TAG_base_type
	.long	.Linfo_string22         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	14                      # Abbrev [14] 0x543:0x5 DW_TAG_pointer_type
	.long	1352                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x548:0x5 DW_TAG_pointer_type
	.long	1357                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x54d:0x7 DW_TAG_base_type
	.long	.Linfo_string27         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	14                      # Abbrev [14] 0x554:0x5 DW_TAG_pointer_type
	.long	476                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp60-.Lfunc_begin0
	.quad	.Ltmp61-.Lfunc_begin0
	.quad	.Ltmp62-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Ltmp64-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
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
	.long	1370                    # Compilation Unit Length
	.long	302                     # DIE offset
	.asciz	"gcd_cached"            # External Name
	.long	488                     # DIE offset
	.asciz	"main"                  # External Name
	.long	43                      # DIE offset
	.asciz	"gcd"                   # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	1370                    # Compilation Unit Length
	.long	469                     # DIE offset
	.asciz	"long long int"         # External Name
	.long	481                     # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	1340                    # DIE offset
	.asciz	"int"                   # External Name
	.long	1357                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
