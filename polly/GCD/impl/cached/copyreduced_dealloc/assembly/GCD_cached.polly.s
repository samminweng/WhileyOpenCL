	.text
	.file	"llvm/GCD_cached.polly.ll"
	.globl	gcd
	.p2align	4, 0x90
	.type	gcd,@function
gcd:                                    # @gcd
.Lfunc_begin0:
	.file	1 "GCD_cached.c"
	.loc	1 2 0                   # GCD_cached.c:2:0
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
	.loc	1 12 6 prologue_end     # GCD_cached.c:12:6
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
	#DEBUG_VALUE: gcd:b <- %RSI
	#DEBUG_VALUE: gcd:a <- %RDI
	.loc	1 35 7                  # GCD_cached.c:35:7
	testq	%rsi, %rsi
	je	.LBB0_8
.Ltmp2:
	.p2align	4, 0x90
.LBB0_4:                                # %blklab4
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: gcd:_5 <- 0
	.loc	1 37 6                  # GCD_cached.c:37:6
	movq	%rdi, %rax
	subq	%rsi, %rax
	jle	.LBB0_7
# BB#5:                                 # %if.end9
                                        #   in Loop: Header=BB0_4 Depth=1
.Ltmp3:
	#DEBUG_VALUE: gcd:a <- %RAX
	#DEBUG_VALUE: gcd:_4 <- 0
	#DEBUG_VALUE: gcd:_6 <- %RAX
	movq	%rax, %rdi
.Ltmp4:
	#DEBUG_VALUE: gcd:_6 <- %RDI
	#DEBUG_VALUE: gcd:a <- %RDI
	jns	.LBB0_4
	jmp	.LBB0_6
.Ltmp5:
.LBB0_7:                                # %blklab5
                                        #   in Loop: Header=BB0_4 Depth=1
	.loc	1 47 7                  # GCD_cached.c:47:7
	subq	%rdi, %rsi
.Ltmp6:
	#DEBUG_VALUE: gcd:_7 <- %RSI
	#DEBUG_VALUE: gcd:_4 <- 0
	#DEBUG_VALUE: gcd:b <- %RSI
	jne	.LBB0_4
.Ltmp7:
.LBB0_8:                                # %cleanup
	#DEBUG_VALUE: gcd:b <- %RSI
	.loc	1 60 1                  # GCD_cached.c:60:1
	movq	%rdi, %rax
	retq
.Ltmp8:
.LBB0_1:
	#DEBUG_VALUE: gcd:b <- %RSI
	#DEBUG_VALUE: gcd:a <- %RDI
	movq	%rsi, %rdi
.Ltmp9:
	movq	%rdi, %rax
	retq
.Ltmp10:
.LBB0_6:                                # %if.end3
	#DEBUG_VALUE: gcd:a <- %RDI
	.loc	1 26 12                 # GCD_cached.c:26:12
	pushq	%rax
.Ltmp11:
	.cfi_def_cfa_offset 16
	movq	stderr(%rip), %rcx
	.loc	1 26 4 is_stmt 0        # GCD_cached.c:26:4
	movl	$.L.str, %edi
.Ltmp12:
	movl	$4, %esi
	movl	$1, %edx
	callq	fwrite
	.loc	1 27 4 is_stmt 1        # GCD_cached.c:27:4
	movl	$-1, %edi
	callq	exit
.Ltmp13:
.Lfunc_end0:
	.size	gcd, .Lfunc_end0-gcd
	.cfi_endproc

	.globl	gcd_cached
	.p2align	4, 0x90
	.type	gcd_cached,@function
gcd_cached:                             # @gcd_cached
.Lfunc_begin1:
	.loc	1 62 0                  # GCD_cached.c:62:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp14:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp15:
	.cfi_def_cfa_offset 24
	pushq	%rax
.Ltmp16:
	.cfi_def_cfa_offset 32
.Ltmp17:
	.cfi_offset %rbx, -24
.Ltmp18:
	.cfi_offset %r14, -16
	#DEBUG_VALUE: gcd_cached:a <- %RDI
	#DEBUG_VALUE: gcd_cached:b <- %RSI
	#DEBUG_VALUE: gcd_cached:n <- %RDX
	#DEBUG_VALUE: gcd_cached:gcds <- %RCX
	#DEBUG_VALUE: gcd_cached:gcds_size <- %R8
	#DEBUG_VALUE: gcd_cached:gcds_dealloc [bit_piece offset=0 size=1] <- %R9D
	movq	%rsi, %r14
.Ltmp19:
	#DEBUG_VALUE: gcd_cached:b <- %R14
	movq	%rdi, %rbx
.Ltmp20:
	#DEBUG_VALUE: gcd_cached:_11 <- 0
	#DEBUG_VALUE: gcd_cached:_10 <- 0
	#DEBUG_VALUE: gcd_cached:_9 <- 0
	#DEBUG_VALUE: gcd_cached:_8 <- 0
	#DEBUG_VALUE: gcd_cached:_7 <- 0
	#DEBUG_VALUE: gcd_cached:_6 <- 0
	#DEBUG_VALUE: gcd_cached:_5 <- 0
	#DEBUG_VALUE: gcd_cached:_4 <- 0
	#DEBUG_VALUE: gcd_cached:gcds_dealloc [bit_piece offset=0 size=1] <- %R9B
	#DEBUG_VALUE: gcd_cached:a <- %RBX
	.loc	1 74 5 prologue_end     # GCD_cached.c:74:5
	testq	%rbx, %rbx
	je	.LBB1_3
.Ltmp21:
# BB#1:                                 # %blklab7
	#DEBUG_VALUE: gcd_cached:a <- %RBX
	#DEBUG_VALUE: gcd_cached:gcds_dealloc [bit_piece offset=0 size=1] <- %R9B
	#DEBUG_VALUE: gcd_cached:b <- %R14
	#DEBUG_VALUE: gcd_cached:gcds_size <- %R8
	#DEBUG_VALUE: gcd_cached:gcds <- %RCX
	#DEBUG_VALUE: gcd_cached:n <- %RDX
	#DEBUG_VALUE: gcd_cached:_6 <- 0
	.loc	1 85 5                  # GCD_cached.c:85:5
	testq	%r14, %r14
	je	.LBB1_5
.Ltmp22:
# BB#2:                                 # %blklab9
	#DEBUG_VALUE: gcd_cached:a <- %RBX
	#DEBUG_VALUE: gcd_cached:gcds_dealloc [bit_piece offset=0 size=1] <- %R9B
	#DEBUG_VALUE: gcd_cached:b <- %R14
	#DEBUG_VALUE: gcd_cached:gcds_size <- %R8
	#DEBUG_VALUE: gcd_cached:gcds <- %RCX
	#DEBUG_VALUE: gcd_cached:n <- %RDX
	movq	%rbx, %rax
	negq	%rax
	xorl	%esi, %esi
.Ltmp23:
	.loc	1 94 6                  # GCD_cached.c:94:6
	cmpq	%r14, %rbx
	cmovgq	%rsi, %rax
.Ltmp24:
	.loc	1 94 5 is_stmt 0        # GCD_cached.c:94:5
	cmovgq	%r14, %rsi
	addq	%r14, %rax
	subq	%rsi, %rbx
.Ltmp25:
	.loc	1 110 6 is_stmt 1       # GCD_cached.c:110:6
	imulq	%rdx, %rbx
.Ltmp26:
	#DEBUG_VALUE: gcd_cached:_9 <- %RBX
	.loc	1 112 8                 # GCD_cached.c:112:8
	addq	%rax, %rbx
.Ltmp27:
	#DEBUG_VALUE: gcd_cached:_10 <- %RBX
	.loc	1 114 6                 # GCD_cached.c:114:6
	movq	(%rcx,%rbx,8), %r14
.Ltmp28:
.LBB1_3:                                # %blklab9
	#DEBUG_VALUE: gcd_cached:gcds_dealloc [bit_piece offset=0 size=1] <- %R9B
	#DEBUG_VALUE: gcd_cached:gcds_size <- %R8
	#DEBUG_VALUE: gcd_cached:gcds <- %RCX
	#DEBUG_VALUE: gcd_cached:n <- %RDX
	#DEBUG_VALUE: gcd_cached:_11 <- %R14
	.loc	1 116 2                 # GCD_cached.c:116:2
	testb	%r9b, %r9b
	je	.LBB1_8
.Ltmp29:
# BB#4:                                 # %if.then14
	#DEBUG_VALUE: gcd_cached:_11 <- %R14
	#DEBUG_VALUE: gcd_cached:gcds_dealloc [bit_piece offset=0 size=1] <- %R9B
	#DEBUG_VALUE: gcd_cached:gcds_size <- %R8
	#DEBUG_VALUE: gcd_cached:gcds <- %RCX
	#DEBUG_VALUE: gcd_cached:n <- %RDX
	.loc	1 116 2 is_stmt 0 discriminator 1 # GCD_cached.c:116:2
	movq	%rcx, %rdi
	callq	free
.Ltmp30:
	#DEBUG_VALUE: gcd_cached:gcds_dealloc <- 0
	jmp	.LBB1_8
.Ltmp31:
.LBB1_5:                                # %if.end5
	#DEBUG_VALUE: gcd_cached:a <- %RBX
	#DEBUG_VALUE: gcd_cached:gcds_dealloc [bit_piece offset=0 size=1] <- %R9B
	#DEBUG_VALUE: gcd_cached:b <- %R14
	#DEBUG_VALUE: gcd_cached:gcds_size <- %R8
	#DEBUG_VALUE: gcd_cached:gcds <- %RCX
	#DEBUG_VALUE: gcd_cached:n <- %RDX
	.loc	1 87 2 is_stmt 1        # GCD_cached.c:87:2
	testb	%r9b, %r9b
	je	.LBB1_7
.Ltmp32:
# BB#6:                                 # %if.then7
	#DEBUG_VALUE: gcd_cached:a <- %RBX
	#DEBUG_VALUE: gcd_cached:gcds_dealloc [bit_piece offset=0 size=1] <- %R9B
	#DEBUG_VALUE: gcd_cached:b <- %R14
	#DEBUG_VALUE: gcd_cached:gcds_size <- %R8
	#DEBUG_VALUE: gcd_cached:gcds <- %RCX
	#DEBUG_VALUE: gcd_cached:n <- %RDX
	.loc	1 87 2 is_stmt 0 discriminator 1 # GCD_cached.c:87:2
	movq	%rcx, %rdi
	callq	free
.Ltmp33:
.LBB1_7:
	#DEBUG_VALUE: gcd_cached:a <- %RBX
	#DEBUG_VALUE: gcd_cached:b <- %R14
	movq	%rbx, %r14
.Ltmp34:
.LBB1_8:                                # %cleanup
	.loc	1 123 1 is_stmt 1 discriminator 2 # GCD_cached.c:123:1
	movq	%r14, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
.Ltmp35:
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
	.quad	2                       # 0x2
.LCPI2_3:
	.quad	4                       # 0x4
	.quad	4                       # 0x4
.LCPI2_4:
	.quad	6                       # 0x6
	.quad	6                       # 0x6
.LCPI2_5:
	.quad	8                       # 0x8
	.quad	8                       # 0x8
.LCPI2_6:
	.quad	83                      # 0x53
	.quad	117                     # 0x75
.LCPI2_7:
	.quad	109                     # 0x6d
	.quad	58                      # 0x3a
.LCPI2_8:
	.quad	80                      # 0x50
	.quad	97                      # 0x61
.LCPI2_9:
	.quad	115                     # 0x73
	.quad	115                     # 0x73
.LCPI2_10:
	.quad	32                      # 0x20
	.quad	99                      # 0x63
.LCPI2_11:
	.quad	97                      # 0x61
	.quad	99                      # 0x63
.LCPI2_12:
	.quad	104                     # 0x68
	.quad	101                     # 0x65
.LCPI2_13:
	.quad	100                     # 0x64
	.quad	32                      # 0x20
.LCPI2_14:
	.quad	69                      # 0x45
	.quad	117                     # 0x75
.LCPI2_15:
	.quad	99                      # 0x63
	.quad	108                     # 0x6c
.LCPI2_16:
	.quad	105                     # 0x69
	.quad	100                     # 0x64
.LCPI2_17:
	.quad	32                      # 0x20
	.quad	71                      # 0x47
.LCPI2_18:
	.quad	67                      # 0x43
	.quad	68                      # 0x44
.LCPI2_19:
	.quad	32                      # 0x20
	.quad	116                     # 0x74
.LCPI2_20:
	.quad	101                     # 0x65
	.quad	115                     # 0x73
.LCPI2_21:
	.quad	116                     # 0x74
	.quad	32                      # 0x20
.LCPI2_22:
	.quad	99                      # 0x63
	.quad	97                      # 0x61
.LCPI2_23:
	.quad	115                     # 0x73
	.quad	101                     # 0x65
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin2:
	.loc	1 125 0                 # GCD_cached.c:125:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 171 2 prologue_end    # GCD_cached.c:171:2
	pushq	%rbp
.Ltmp36:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp37:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp38:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp39:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp40:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp41:
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
.Ltmp42:
	.cfi_def_cfa_offset 96
.Ltmp43:
	.cfi_offset %rbx, -56
.Ltmp44:
	.cfi_offset %r12, -48
.Ltmp45:
	.cfi_offset %r13, -40
.Ltmp46:
	.cfi_offset %r14, -32
.Ltmp47:
	.cfi_offset %r15, -24
.Ltmp48:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
.Ltmp49:
	#DEBUG_VALUE: main:max_dealloc <- 0
	#DEBUG_VALUE: main:n <- 0
	#DEBUG_VALUE: main:gcds_size <- 0
	#DEBUG_VALUE: main:gcds_dealloc <- 0
	#DEBUG_VALUE: main:sum <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_7_dealloc <- 0
	#DEBUG_VALUE: main:_8_size <- 0
	#DEBUG_VALUE: main:_8_size_size <- 0
	#DEBUG_VALUE: main:_8_dealloc <- 0
	#DEBUG_VALUE: main:_9 <- 0
	#DEBUG_VALUE: main:_10_size <- 0
	#DEBUG_VALUE: main:_10_dealloc <- 0
	#DEBUG_VALUE: main:_13_size <- 0
	#DEBUG_VALUE: main:_13_dealloc <- 0
	#DEBUG_VALUE: main:_16 <- 0
	#DEBUG_VALUE: main:_17 <- 0
	#DEBUG_VALUE: main:_18_size <- 0
	#DEBUG_VALUE: main:_18_dealloc <- 0
	#DEBUG_VALUE: main:_19 <- 0
	#DEBUG_VALUE: main:_20 <- 0
	#DEBUG_VALUE: main:_21 <- 0
	#DEBUG_VALUE: main:_22 <- 0
	#DEBUG_VALUE: main:_23 <- 0
	#DEBUG_VALUE: main:_24 <- 0
	#DEBUG_VALUE: main:_25 <- 0
	#DEBUG_VALUE: main:_26 <- 0
	#DEBUG_VALUE: main:_27 <- 0
	#DEBUG_VALUE: main:_28 <- 0
	#DEBUG_VALUE: main:_29 <- 0
	#DEBUG_VALUE: main:_30 <- 0
	#DEBUG_VALUE: main:_31 <- 0
	#DEBUG_VALUE: main:_32 <- 0
	#DEBUG_VALUE: main:_35_size <- 0
	#DEBUG_VALUE: main:_35_dealloc <- 0
	#DEBUG_VALUE: main:_40_size <- 0
	#DEBUG_VALUE: main:_40_dealloc <- 0
	callq	convertArgsToIntArray
.Ltmp50:
	#DEBUG_VALUE: main:_8 <- %RAX
	.loc	1 175 6                 # GCD_cached.c:175:6
	movq	(%rax), %rdi
.Ltmp51:
	#DEBUG_VALUE: main:_10 <- %RDI
	.loc	1 178 2                 # GCD_cached.c:178:2
	callq	parseStringToInt
.Ltmp52:
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_7 <- %RAX
	#DEBUG_VALUE: main:max_dealloc <- 1
	.loc	1 186 9                 # GCD_cached.c:186:9
	testq	%rax, %rax
	je	.LBB2_21
.Ltmp53:
# BB#1:                                 # %if.end5
	#DEBUG_VALUE: main:_7 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	movq	%rax, 16(%rsp)          # 8-byte Spill
	.loc	1 188 6                 # GCD_cached.c:188:6
	movq	(%rax), %r13
.Ltmp54:
	#DEBUG_VALUE: gcd_cached:n <- %R13
	#DEBUG_VALUE: main:_13_size <- 4
	#DEBUG_VALUE: main:n <- %R13
	.loc	1 201 2                 # GCD_cached.c:201:2
	xorl	%ebx, %ebx
	.loc	1 193 2                 # GCD_cached.c:193:2
	xorl	%edi, %edi
	movl	$4, %esi
	callq	create1DArray
.Ltmp55:
	#DEBUG_VALUE: main:_13 <- %RAX
	.loc	1 194 9                 # GCD_cached.c:194:9
	movaps	.LCPI2_0(%rip), %xmm0   # xmm0 = [78,32]
	movups	%xmm0, (%rax)
	.loc	1 194 35 is_stmt 0      # GCD_cached.c:194:35
	movdqa	.LCPI2_1(%rip), %xmm0   # xmm0 = [61,32]
	movdqu	%xmm0, 16(%rax)
.Ltmp56:
	#DEBUG_VALUE: main:_13_dealloc <- 1
	.loc	1 197 2 is_stmt 1       # GCD_cached.c:197:2
	movl	$4, %esi
	movq	%rax, 8(%rsp)           # 8-byte Spill
.Ltmp57:
	#DEBUG_VALUE: main:_13 <- [%RSP+8]
	movq	%rax, %rdi
	callq	printf_s
.Ltmp58:
	.loc	1 201 2                 # GCD_cached.c:201:2
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%r13, %rsi
	callq	printf
	#DEBUG_VALUE: main:_16 <- 0
	.loc	1 205 7                 # GCD_cached.c:205:7
	movl	%r13d, %esi
	imull	%esi, %esi
	.loc	1 208 2                 # GCD_cached.c:208:2
	xorl	%edi, %edi
	callq	create1DArray
	movq	%rax, %r12
.Ltmp59:
	#DEBUG_VALUE: main:gcds <- %R12
	#DEBUG_VALUE: main:_18 <- %R12
	#DEBUG_VALUE: gcd_cached:gcds <- %R12
	#DEBUG_VALUE: main:_20 <- 0
	#DEBUG_VALUE: main:_19 <- 0
	#DEBUG_VALUE: main:_18_dealloc <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:sum <- 0
	#DEBUG_VALUE: main:gcds_dealloc <- 1
	.loc	1 225 6                 # GCD_cached.c:225:6
	testq	%r13, %r13
	jle	.LBB2_20
.Ltmp60:
# BB#2:                                 # %while.cond31.preheader.us.preheader
	#DEBUG_VALUE: gcd_cached:gcds <- %R12
	#DEBUG_VALUE: main:_18 <- %R12
	#DEBUG_VALUE: main:gcds <- %R12
	#DEBUG_VALUE: main:n <- %R13
	#DEBUG_VALUE: gcd_cached:n <- %R13
	.loc	1 74 6                  # GCD_cached.c:74:6
	leaq	-4(%r13), %rax
	shrq	$2, %rax
	leal	1(%rax), %ecx
.Ltmp61:
	.loc	1 62 32                 # GCD_cached.c:62:32
	movq	%r13, %rdx
	andq	$-4, %rdx
	andl	$1, %ecx
.Ltmp62:
	.loc	1 74 6                  # GCD_cached.c:74:6
	leaq	(,%r13,8), %rsi
	movq	%rcx, 32(%rsp)          # 8-byte Spill
	decq	%rcx
	movq	%rax, %r11
	subq	%rax, %rcx
	movq	%rcx, 24(%rsp)          # 8-byte Spill
	xorl	%edi, %edi
	movl	$1, %eax
	movd	%rax, %xmm8
	pslldq	$8, %xmm8               # xmm8 = zero,zero,zero,zero,zero,zero,zero,zero,xmm8[0,1,2,3,4,5,6,7]
	movdqa	.LCPI2_2(%rip), %xmm1   # xmm1 = [2,2]
	movdqa	.LCPI2_3(%rip), %xmm9   # xmm9 = [4,4]
	movdqa	.LCPI2_4(%rip), %xmm3   # xmm3 = [6,6]
	movdqa	.LCPI2_5(%rip), %xmm4   # xmm4 = [8,8]
	movq	%r12, %r14
	xorl	%ebx, %ebx
	xorl	%r10d, %r10d
	jmp	.LBB2_3
.Ltmp63:
.LBB2_13:                               #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: main:_23 <- %RBP
	#DEBUG_VALUE: main:_25 <- %RBP
	#DEBUG_VALUE: gcd_cached:a <- %R10
	movdqa	%xmm8, %xmm2
.Ltmp64:
.LBB2_16:                               # %middle.block.unr-lcssa
                                        #   in Loop: Header=BB2_3 Depth=1
	cmpq	$0, 32(%rsp)            # 8-byte Folded Reload
	je	.LBB2_18
# BB#17:                                # %middle.block.epilog-lcssa
                                        #   in Loop: Header=BB2_3 Depth=1
	.loc	1 62 32                 # GCD_cached.c:62:32
	movdqa	%xmm2, %xmm0
	paddq	%xmm1, %xmm0
.Ltmp65:
	.loc	1 241 4                 # GCD_cached.c:241:4
	movd	%xmm2, %rax
	addq	%rbp, %rax
	.loc	1 241 14 is_stmt 0      # GCD_cached.c:241:14
	movdqu	%xmm2, (%r12,%rax,8)
	movdqu	%xmm0, 16(%r12,%rax,8)
	.loc	1 249 11 is_stmt 1      # GCD_cached.c:249:11
	paddq	%xmm0, %xmm6
	paddq	%xmm2, %xmm5
.LBB2_18:                               # %middle.block
                                        #   in Loop: Header=BB2_3 Depth=1
	cmpq	%rdx, %r13
	paddq	%xmm5, %xmm6
	pshufd	$78, %xmm6, %xmm0       # xmm0 = xmm6[2,3,0,1]
	paddq	%xmm6, %xmm0
	movd	%xmm0, %rbx
	movq	%rdx, %rax
	jne	.LBB2_10
	jmp	.LBB2_19
	.p2align	4, 0x90
.LBB2_3:                                # %while.cond31.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_5 Depth 2
                                        #     Child Loop BB2_15 Depth 2
                                        #     Child Loop BB2_10 Depth 2
.Ltmp66:
	#DEBUG_VALUE: gcd_cached:a <- %R10
	.loc	1 74 6                  # GCD_cached.c:74:6
	testq	%r10, %r10
.Ltmp67:
	.loc	1 74 5 is_stmt 0        # GCD_cached.c:74:5
	je	.LBB2_8
.Ltmp68:
# BB#4:                                 # %if.end36.us228.preheader
                                        #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: gcd_cached:a <- %R10
	.loc	1 235 10 is_stmt 1      # GCD_cached.c:235:10
	movq	%r10, %rbp
	negq	%rbp
	movq	%r14, %rax
	xorl	%r15d, %r15d
.Ltmp69:
	.p2align	4, 0x90
.LBB2_5:                                # %if.end36.us228
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: gcd_cached:gcds_dealloc [bit_piece offset=0 size=1] <- 0
	#DEBUG_VALUE: gcd_cached:_4 <- 0
	#DEBUG_VALUE: gcd_cached:_5 <- 0
	#DEBUG_VALUE: gcd_cached:_6 <- 0
	#DEBUG_VALUE: gcd_cached:_7 <- 0
	#DEBUG_VALUE: gcd_cached:_8 <- 0
	#DEBUG_VALUE: gcd_cached:_9 <- 0
	#DEBUG_VALUE: gcd_cached:_10 <- 0
	#DEBUG_VALUE: gcd_cached:_11 <- 0
	#DEBUG_VALUE: gcd_cached:b <- %R15
	.loc	1 85 6                  # GCD_cached.c:85:6
	testq	%r15, %r15
.Ltmp70:
	.loc	1 235 10                # GCD_cached.c:235:10
	movq	%r10, %rcx
	je	.LBB2_7
.Ltmp71:
# BB#6:                                 # %blklab9.i.us233
                                        #   in Loop: Header=BB2_5 Depth=2
	#DEBUG_VALUE: gcd_cached:b <- %R15
	.loc	1 94 6                  # GCD_cached.c:94:6
	cmpq	%r15, %r10
.Ltmp72:
	.loc	1 235 10                # GCD_cached.c:235:10
	movq	%rbp, %rcx
	cmovgq	%rdi, %rcx
.Ltmp73:
	.loc	1 94 5                  # GCD_cached.c:94:5
	movl	$0, %r8d
	cmovgq	%r15, %r8
	movq	%r10, %r9
	subq	%r8, %r9
	.loc	1 114 6                 # GCD_cached.c:114:6
	imulq	%r13, %r9
	addq	%rcx, %r9
	addq	%r15, %r9
	movq	(%r12,%r9,8), %rcx
.Ltmp74:
	#DEBUG_VALUE: gcd_cached:_11 <- %RCX
.LBB2_7:                                # %gcd_cached.exit.us242
                                        #   in Loop: Header=BB2_5 Depth=2
	#DEBUG_VALUE: gcd_cached:b <- %R15
	#DEBUG_VALUE: main:_22 <- %RCX
	.loc	1 241 14                # GCD_cached.c:241:14
	movq	%rcx, (%rax)
	.loc	1 249 11                # GCD_cached.c:249:11
	addq	%rcx, %rbx
.Ltmp75:
	#DEBUG_VALUE: main:_29 <- 1
	#DEBUG_VALUE: main:_28 <- %RBX
	#DEBUG_VALUE: main:sum <- %RBX
	.loc	1 255 9                 # GCD_cached.c:255:9
	incq	%r15
.Ltmp76:
	#DEBUG_VALUE: main:_30 <- %R15
	#DEBUG_VALUE: main:j <- %R15
	.loc	1 233 7                 # GCD_cached.c:233:7
	addq	$8, %rax
	cmpq	%r15, %r13
	jne	.LBB2_5
	jmp	.LBB2_19
.Ltmp77:
	.p2align	4, 0x90
.LBB2_8:                                # %if.end36.us.us.preheader
                                        #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: gcd_cached:a <- %R10
	.loc	1 62 32                 # GCD_cached.c:62:32
	cmpq	$3, %r13
	jbe	.LBB2_9
.Ltmp78:
# BB#11:                                # %min.iters.checked
                                        #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: gcd_cached:a <- %R10
	testq	%rdx, %rdx
	je	.LBB2_9
.Ltmp79:
# BB#12:                                # %vector.ph
                                        #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: gcd_cached:a <- %R10
	.loc	1 237 9                 # GCD_cached.c:237:9
	movq	%r10, %rbp
	imulq	%r13, %rbp
.Ltmp80:
	#DEBUG_VALUE: main:_25 <- %RBP
	#DEBUG_VALUE: main:_23 <- %RBP
	testq	%r11, %r11
.Ltmp81:
	.loc	1 62 32                 # GCD_cached.c:62:32
	movd	%rbx, %xmm5
	pxor	%xmm6, %xmm6
	je	.LBB2_13
.Ltmp82:
# BB#14:                                # %vector.ph.new
                                        #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: main:_23 <- %RBP
	#DEBUG_VALUE: main:_25 <- %RBP
	#DEBUG_VALUE: gcd_cached:a <- %R10
	movl	$1, %eax
	movd	%rax, %xmm2
	pslldq	$8, %xmm2               # xmm2 = zero,zero,zero,zero,zero,zero,zero,zero,xmm2[0,1,2,3,4,5,6,7]
	pxor	%xmm6, %xmm6
	movq	24(%rsp), %rbx          # 8-byte Reload
.Ltmp83:
	.p2align	4, 0x90
.LBB2_15:                               # %vector.body
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movdqa	%xmm2, %xmm7
	paddq	%xmm1, %xmm7
	movdqa	%xmm2, %xmm0
	paddq	%xmm9, %xmm0
.Ltmp84:
	.loc	1 241 4                 # GCD_cached.c:241:4
	movd	%xmm2, %rax
	addq	%rbp, %rax
	.loc	1 241 14 is_stmt 0      # GCD_cached.c:241:14
	movdqu	%xmm2, (%r12,%rax,8)
	movdqu	%xmm7, 16(%r12,%rax,8)
	.loc	1 249 11 is_stmt 1      # GCD_cached.c:249:11
	paddq	%xmm2, %xmm5
	paddq	%xmm6, %xmm7
.Ltmp85:
	.loc	1 62 32                 # GCD_cached.c:62:32
	movdqa	%xmm2, %xmm6
	paddq	%xmm3, %xmm6
	paddq	%xmm4, %xmm2
.Ltmp86:
	.loc	1 241 4                 # GCD_cached.c:241:4
	movd	%xmm0, %rax
	addq	%rbp, %rax
	.loc	1 241 14 is_stmt 0      # GCD_cached.c:241:14
	movdqu	%xmm0, (%r12,%rax,8)
	movdqu	%xmm6, 16(%r12,%rax,8)
	.loc	1 249 11 is_stmt 1      # GCD_cached.c:249:11
	paddq	%xmm0, %xmm5
	paddq	%xmm7, %xmm6
.Ltmp87:
	.loc	1 62 32                 # GCD_cached.c:62:32
	addq	$2, %rbx
	jne	.LBB2_15
	jmp	.LBB2_16
.Ltmp88:
	.p2align	4, 0x90
.LBB2_9:                                #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: gcd_cached:a <- %R10
	xorl	%eax, %eax
.Ltmp89:
	.p2align	4, 0x90
.LBB2_10:                               # %if.end36.us.us
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: main:_22 <- %RAX
	#DEBUG_VALUE: gcd_cached:gcds_dealloc [bit_piece offset=0 size=1] <- 0
	#DEBUG_VALUE: gcd_cached:_4 <- 0
	#DEBUG_VALUE: gcd_cached:_5 <- 0
	#DEBUG_VALUE: gcd_cached:_6 <- 0
	#DEBUG_VALUE: gcd_cached:_7 <- 0
	#DEBUG_VALUE: gcd_cached:_8 <- 0
	#DEBUG_VALUE: gcd_cached:_9 <- 0
	#DEBUG_VALUE: gcd_cached:_10 <- 0
	#DEBUG_VALUE: gcd_cached:_11 <- 0
	.loc	1 241 14                # GCD_cached.c:241:14
	movq	%rax, (%r14,%rax,8)
	.loc	1 249 11                # GCD_cached.c:249:11
	addq	%rax, %rbx
	#DEBUG_VALUE: main:_29 <- 1
.Ltmp90:
	#DEBUG_VALUE: main:_28 <- %RBX
	#DEBUG_VALUE: main:sum <- %RBX
	.loc	1 255 9                 # GCD_cached.c:255:9
	incq	%rax
.Ltmp91:
	#DEBUG_VALUE: main:_30 <- %RAX
	#DEBUG_VALUE: main:j <- %RAX
	.loc	1 233 7                 # GCD_cached.c:233:7
	cmpq	%rax, %r13
	jne	.LBB2_10
.Ltmp92:
.LBB2_19:                               # %blklab16.loopexit.us
                                        #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: main:_31 <- 1
	.loc	1 266 8                 # GCD_cached.c:266:8
	incq	%r10
.Ltmp93:
	#DEBUG_VALUE: main:_32 <- %R10
	#DEBUG_VALUE: main:i <- %R10
	.loc	1 225 6                 # GCD_cached.c:225:6
	addq	%rsi, %r14
	cmpq	%r13, %r10
	jne	.LBB2_3
.Ltmp94:
.LBB2_20:                               # %if.then98
	#DEBUG_VALUE: main:_35_size <- 5
	.loc	1 278 2                 # GCD_cached.c:278:2
	xorl	%edi, %edi
	movl	$5, %esi
	callq	create1DArray
	movq	%rax, %r13
.Ltmp95:
	#DEBUG_VALUE: main:_35 <- %R13
	.loc	1 279 9                 # GCD_cached.c:279:9
	movaps	.LCPI2_6(%rip), %xmm0   # xmm0 = [83,117]
	movups	%xmm0, (%r13)
	.loc	1 279 36 is_stmt 0      # GCD_cached.c:279:36
	movaps	.LCPI2_7(%rip), %xmm0   # xmm0 = [109,58]
	movups	%xmm0, 16(%r13)
	.loc	1 279 63                # GCD_cached.c:279:63
	movq	$32, 32(%r13)
.Ltmp96:
	#DEBUG_VALUE: main:_35_dealloc <- 1
	.loc	1 282 2 is_stmt 1       # GCD_cached.c:282:2
	movl	$5, %esi
	movq	%r13, %rdi
	callq	printf_s
	.loc	1 286 2                 # GCD_cached.c:286:2
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	printf
.Ltmp97:
	#DEBUG_VALUE: main:_40_size <- 32
	.loc	1 291 2                 # GCD_cached.c:291:2
	xorl	%edi, %edi
	movl	$32, %esi
	callq	create1DArray
	movq	%rax, %rbx
.Ltmp98:
	#DEBUG_VALUE: main:_40 <- %RBX
	.loc	1 292 9                 # GCD_cached.c:292:9
	movaps	.LCPI2_8(%rip), %xmm0   # xmm0 = [80,97]
	movups	%xmm0, (%rbx)
	.loc	1 292 35 is_stmt 0      # GCD_cached.c:292:35
	movaps	.LCPI2_9(%rip), %xmm0   # xmm0 = [115,115]
	movups	%xmm0, 16(%rbx)
	.loc	1 292 63                # GCD_cached.c:292:63
	movaps	.LCPI2_10(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 32(%rbx)
	.loc	1 292 89                # GCD_cached.c:292:89
	movaps	.LCPI2_11(%rip), %xmm0  # xmm0 = [97,99]
	movups	%xmm0, 48(%rbx)
	.loc	1 292 115               # GCD_cached.c:292:115
	movaps	.LCPI2_12(%rip), %xmm0  # xmm0 = [104,101]
	movups	%xmm0, 64(%rbx)
	.loc	1 292 144               # GCD_cached.c:292:144
	movaps	.LCPI2_13(%rip), %xmm0  # xmm0 = [100,32]
	movups	%xmm0, 80(%rbx)
	.loc	1 292 173               # GCD_cached.c:292:173
	movaps	.LCPI2_14(%rip), %xmm0  # xmm0 = [69,117]
	movups	%xmm0, 96(%rbx)
	.loc	1 292 202               # GCD_cached.c:292:202
	movaps	.LCPI2_15(%rip), %xmm0  # xmm0 = [99,108]
	movups	%xmm0, 112(%rbx)
	.loc	1 292 231               # GCD_cached.c:292:231
	movaps	.LCPI2_16(%rip), %xmm0  # xmm0 = [105,100]
	movups	%xmm0, 128(%rbx)
	.loc	1 292 261               # GCD_cached.c:292:261
	movaps	.LCPI2_17(%rip), %xmm0  # xmm0 = [32,71]
	movups	%xmm0, 144(%rbx)
	.loc	1 292 289               # GCD_cached.c:292:289
	movaps	.LCPI2_18(%rip), %xmm0  # xmm0 = [67,68]
	movups	%xmm0, 160(%rbx)
	.loc	1 292 317               # GCD_cached.c:292:317
	movaps	.LCPI2_19(%rip), %xmm0  # xmm0 = [32,116]
	movups	%xmm0, 176(%rbx)
	.loc	1 292 346               # GCD_cached.c:292:346
	movaps	.LCPI2_20(%rip), %xmm0  # xmm0 = [101,115]
	movups	%xmm0, 192(%rbx)
	.loc	1 292 376               # GCD_cached.c:292:376
	movaps	.LCPI2_21(%rip), %xmm0  # xmm0 = [116,32]
	movups	%xmm0, 208(%rbx)
	.loc	1 292 405               # GCD_cached.c:292:405
	movaps	.LCPI2_22(%rip), %xmm0  # xmm0 = [99,97]
	movups	%xmm0, 224(%rbx)
	.loc	1 292 433               # GCD_cached.c:292:433
	movaps	.LCPI2_23(%rip), %xmm0  # xmm0 = [115,101]
	movups	%xmm0, 240(%rbx)
.Ltmp99:
	#DEBUG_VALUE: main:_40_dealloc <- 1
	.loc	1 295 2 is_stmt 1       # GCD_cached.c:295:2
	movl	$32, %esi
	movq	%rbx, %rdi
	callq	println_s
.Ltmp100:
	.loc	1 299 2 discriminator 1 # GCD_cached.c:299:2
	movq	16(%rsp), %rdi          # 8-byte Reload
	callq	free
.Ltmp101:
	#DEBUG_VALUE: main:max_dealloc <- 0
	.loc	1 300 2 discriminator 1 # GCD_cached.c:300:2
	movq	%r12, %rdi
	callq	free
.Ltmp102:
	#DEBUG_VALUE: main:gcds_dealloc <- 0
	.loc	1 304 2 discriminator 1 # GCD_cached.c:304:2
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	free
.Ltmp103:
	#DEBUG_VALUE: main:_13_dealloc <- 0
	.loc	1 306 2 discriminator 1 # GCD_cached.c:306:2
	movq	%r13, %rdi
	callq	free
.Ltmp104:
	#DEBUG_VALUE: main:_35_dealloc <- 0
	.loc	1 307 2 discriminator 1 # GCD_cached.c:307:2
	movq	%rbx, %rdi
	callq	free
.Ltmp105:
	#DEBUG_VALUE: main:_40_dealloc <- 0
.LBB2_21:                               # %if.end120
	.loc	1 308 2                 # GCD_cached.c:308:2
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
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git f82fb5beb88e841f7a00cfb2a2ceabe46bcb2a9b) (http://llvm.org/git/llvm.git bafbf2b643f118fd2ea402ed6cd204281c7e9e94)" # string offset=0
.Linfo_string1:
	.asciz	"GCD_cached.c"          # string offset=165
.Linfo_string2:
	.asciz	"/home/mw169/workspace/WhileyOpenCL/polly/GCD/impl/cached/copyreduced_dealloc" # string offset=178
.Linfo_string3:
	.asciz	"gcd_cached"            # string offset=255
.Linfo_string4:
	.asciz	"long long int"         # string offset=266
.Linfo_string5:
	.asciz	"a"                     # string offset=280
.Linfo_string6:
	.asciz	"b"                     # string offset=282
.Linfo_string7:
	.asciz	"n"                     # string offset=284
.Linfo_string8:
	.asciz	"gcds"                  # string offset=286
.Linfo_string9:
	.asciz	"gcds_size"             # string offset=291
.Linfo_string10:
	.asciz	"gcds_dealloc"          # string offset=301
.Linfo_string11:
	.asciz	"_Bool"                 # string offset=314
.Linfo_string12:
	.asciz	"_4"                    # string offset=320
.Linfo_string13:
	.asciz	"_5"                    # string offset=323
.Linfo_string14:
	.asciz	"_6"                    # string offset=326
.Linfo_string15:
	.asciz	"_7"                    # string offset=329
.Linfo_string16:
	.asciz	"_8"                    # string offset=332
.Linfo_string17:
	.asciz	"_9"                    # string offset=335
.Linfo_string18:
	.asciz	"_10"                   # string offset=338
.Linfo_string19:
	.asciz	"_11"                   # string offset=342
.Linfo_string20:
	.asciz	"gcd"                   # string offset=346
.Linfo_string21:
	.asciz	"main"                  # string offset=350
.Linfo_string22:
	.asciz	"int"                   # string offset=355
.Linfo_string23:
	.asciz	"_2"                    # string offset=359
.Linfo_string24:
	.asciz	"_3"                    # string offset=362
.Linfo_string25:
	.asciz	"argc"                  # string offset=365
.Linfo_string26:
	.asciz	"args"                  # string offset=370
.Linfo_string27:
	.asciz	"char"                  # string offset=375
.Linfo_string28:
	.asciz	"max_dealloc"           # string offset=380
.Linfo_string29:
	.asciz	"sum"                   # string offset=392
.Linfo_string30:
	.asciz	"i"                     # string offset=396
.Linfo_string31:
	.asciz	"j"                     # string offset=398
.Linfo_string32:
	.asciz	"_7_dealloc"            # string offset=400
.Linfo_string33:
	.asciz	"_8_size"               # string offset=411
.Linfo_string34:
	.asciz	"_8_size_size"          # string offset=419
.Linfo_string35:
	.asciz	"_8_dealloc"            # string offset=432
.Linfo_string36:
	.asciz	"_10_size"              # string offset=443
.Linfo_string37:
	.asciz	"_10_dealloc"           # string offset=452
.Linfo_string38:
	.asciz	"_13_size"              # string offset=464
.Linfo_string39:
	.asciz	"_13_dealloc"           # string offset=473
.Linfo_string40:
	.asciz	"_16"                   # string offset=485
.Linfo_string41:
	.asciz	"_17"                   # string offset=489
.Linfo_string42:
	.asciz	"_18_size"              # string offset=493
.Linfo_string43:
	.asciz	"_18_dealloc"           # string offset=502
.Linfo_string44:
	.asciz	"_19"                   # string offset=514
.Linfo_string45:
	.asciz	"_20"                   # string offset=518
.Linfo_string46:
	.asciz	"_21"                   # string offset=522
.Linfo_string47:
	.asciz	"_22"                   # string offset=526
.Linfo_string48:
	.asciz	"_23"                   # string offset=530
.Linfo_string49:
	.asciz	"_24"                   # string offset=534
.Linfo_string50:
	.asciz	"_25"                   # string offset=538
.Linfo_string51:
	.asciz	"_26"                   # string offset=542
.Linfo_string52:
	.asciz	"_27"                   # string offset=546
.Linfo_string53:
	.asciz	"_28"                   # string offset=550
.Linfo_string54:
	.asciz	"_29"                   # string offset=554
.Linfo_string55:
	.asciz	"_30"                   # string offset=558
.Linfo_string56:
	.asciz	"_31"                   # string offset=562
.Linfo_string57:
	.asciz	"_32"                   # string offset=566
.Linfo_string58:
	.asciz	"_35_size"              # string offset=570
.Linfo_string59:
	.asciz	"_35_dealloc"           # string offset=579
.Linfo_string60:
	.asciz	"_40_size"              # string offset=591
.Linfo_string61:
	.asciz	"_40_dealloc"           # string offset=600
.Linfo_string62:
	.asciz	"max"                   # string offset=612
.Linfo_string63:
	.asciz	"_13"                   # string offset=616
.Linfo_string64:
	.asciz	"_18"                   # string offset=620
.Linfo_string65:
	.asciz	"_35"                   # string offset=624
.Linfo_string66:
	.asciz	"_40"                   # string offset=628
.Linfo_string67:
	.asciz	"_14"                   # string offset=632
.Linfo_string68:
	.asciz	"_33"                   # string offset=636
.Linfo_string69:
	.asciz	"_36"                   # string offset=640
.Linfo_string70:
	.asciz	"_38"                   # string offset=644
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp2-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp3-.Lfunc_begin0
	.quad	.Ltmp4-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp4-.Lfunc_begin0
	.quad	.Ltmp5-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp8-.Lfunc_begin0
	.quad	.Ltmp9-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp10-.Lfunc_begin0
	.quad	.Ltmp12-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp2-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp6-.Lfunc_begin0
	.quad	.Ltmp10-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc2:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp3-.Lfunc_begin0
	.quad	.Ltmp4-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp4-.Lfunc_begin0
	.quad	.Ltmp5-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp6-.Lfunc_begin0
	.quad	.Ltmp7-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp25-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp31-.Lfunc_begin0
	.quad	.Ltmp34-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp19-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	.Ltmp31-.Lfunc_begin0
	.quad	.Ltmp34-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp30-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp31-.Lfunc_begin0
	.quad	.Ltmp33-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp30-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp31-.Lfunc_begin0
	.quad	.Ltmp33-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp30-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	.Ltmp31-.Lfunc_begin0
	.quad	.Ltmp33-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	89                      # super-register DW_OP_reg9
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp30-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	89                      # super-register DW_OP_reg9
	.byte	147                     # DW_OP_piece
	.byte	1                       # 1
	.quad	.Ltmp30-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp31-.Lfunc_begin0
	.quad	.Ltmp33-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	89                      # super-register DW_OP_reg9
	.byte	147                     # DW_OP_piece
	.byte	1                       # 1
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp28-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp27-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp26-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp26-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp52-.Lfunc_begin0
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
.Ldebug_loc16:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp59-.Lfunc_begin0
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
.Ldebug_loc18:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp90-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp93-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp93-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	90                      # DW_OP_reg10
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp76-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Ltmp49-.Lfunc_begin0
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
.Ldebug_loc22:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp56-.Lfunc_begin0
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
.Ldebug_loc23:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp89-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Ltmp64-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Ltmp64-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp90-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp76-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Ltmp49-.Lfunc_begin0
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
.Ldebug_loc30:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp93-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp93-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	90                      # DW_OP_reg10
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp94-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	5                       # 5
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp96-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp96-.Lfunc_begin0
	.quad	.Ltmp104-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp104-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc33:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp97-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	32                      # 32
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc34:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp99-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp99-.Lfunc_begin0
	.quad	.Ltmp105-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp105-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc35:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc36:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc37:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc38:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc39:
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc40:
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
.Ldebug_loc41:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc42:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc43:
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc44:
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Ltmp64-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	90                      # DW_OP_reg10
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	90                      # DW_OP_reg10
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	90                      # DW_OP_reg10
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	90                      # DW_OP_reg10
	.quad	0
	.quad	0
.Ldebug_loc45:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp89-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc46:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp76-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc47:
	.quad	.Ltmp95-.Lfunc_begin0
	.quad	.Ltmp105-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc48:
	.quad	.Ltmp98-.Lfunc_begin0
	.quad	.Ltmp105-.Lfunc_begin0
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
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
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
	.byte	15                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
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
	.long	1393                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x56a DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x1 DW_TAG_pointer_type
	.byte	3                       # Abbrev [3] 0x2b:0x86 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	475                     # DW_AT_type
                                        # DW_AT_external
	.byte	4                       # Abbrev [4] 0x44:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x53:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x62:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x6e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x7a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x86:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x92:0xf DW_TAG_variable
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0xa1:0xf DW_TAG_variable
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0xb1:0x83 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	308                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0xc4:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc4            # DW_AT_location
	.long	320                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0xcd:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc5            # DW_AT_location
	.long	331                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0xd6:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc6            # DW_AT_location
	.long	342                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0xdf:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc7            # DW_AT_location
	.long	353                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0xe8:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc8            # DW_AT_location
	.long	364                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0xf1:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc9            # DW_AT_location
	.long	375                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0xfa:0x9 DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	463                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x103:0x9 DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	452                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x10c:0x9 DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	441                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x115:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	430                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x11b:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	419                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x121:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	408                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x127:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	397                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x12d:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	386                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	11                      # Abbrev [11] 0x134:0xa7 DW_TAG_subprogram
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	475                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	12                      # Abbrev [12] 0x140:0xb DW_TAG_formal_parameter
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x14b:0xb DW_TAG_formal_parameter
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x156:0xb DW_TAG_formal_parameter
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x161:0xb DW_TAG_formal_parameter
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	482                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x16c:0xb DW_TAG_formal_parameter
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x177:0xb DW_TAG_formal_parameter
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	487                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x182:0xb DW_TAG_variable
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x18d:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x198:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	65                      # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x1a3:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	66                      # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x1ae:0xb DW_TAG_variable
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	67                      # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x1b9:0xb DW_TAG_variable
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	68                      # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x1c4:0xb DW_TAG_variable
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	69                      # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x1cf:0xb DW_TAG_variable
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	14                      # Abbrev [14] 0x1db:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	15                      # Abbrev [15] 0x1e2:0x5 DW_TAG_pointer_type
	.long	475                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x1e7:0x7 DW_TAG_base_type
	.long	.Linfo_string11         # DW_AT_name
	.byte	2                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	3                       # Abbrev [3] 0x1ee:0x369 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	125                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1367                    # DW_AT_type
                                        # DW_AT_external
	.byte	4                       # Abbrev [4] 0x207:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	125                     # DW_AT_decl_line
	.long	1367                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x216:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	125                     # DW_AT_decl_line
	.long	1374                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x225:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	127                     # DW_AT_decl_line
	.long	487                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x234:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	128                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x243:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	129                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x24f:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	130                     # DW_AT_decl_line
	.long	487                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x25e:0xf DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	131                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x26d:0xf DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	132                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x27c:0xf DW_TAG_variable
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	133                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x28b:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	135                     # DW_AT_decl_line
	.long	487                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x297:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	136                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2a3:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	136                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x2af:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	137                     # DW_AT_decl_line
	.long	487                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2bb:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	138                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2c7:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	139                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x2d3:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	140                     # DW_AT_decl_line
	.long	487                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x2df:0xf DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	142                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x2ee:0xf DW_TAG_variable
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	143                     # DW_AT_decl_line
	.long	487                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2fd:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	145                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x309:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	146                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x315:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	147                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x321:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	148                     # DW_AT_decl_line
	.long	487                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x32d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	149                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x339:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	150                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x345:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	151                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x351:0xf DW_TAG_variable
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	152                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x360:0xf DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	153                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x36f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	154                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x37b:0xf DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	155                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x38a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	156                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x396:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	157                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3a2:0xf DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	158                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3b1:0xf DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	159                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3c0:0xf DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	160                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3cf:0xf DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	161                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3de:0xf DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	162                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3ed:0xf DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	164                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3fc:0xf DW_TAG_variable
	.long	.Ldebug_loc32           # DW_AT_location
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	165                     # DW_AT_decl_line
	.long	487                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x40b:0xf DW_TAG_variable
	.long	.Ldebug_loc33           # DW_AT_location
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	168                     # DW_AT_decl_line
	.long	475                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x41a:0xf DW_TAG_variable
	.long	.Ldebug_loc34           # DW_AT_location
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	169                     # DW_AT_decl_line
	.long	487                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x429:0xf DW_TAG_variable
	.long	.Ldebug_loc35           # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	136                     # DW_AT_decl_line
	.long	1391                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x438:0xf DW_TAG_variable
	.long	.Ldebug_loc36           # DW_AT_location
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	139                     # DW_AT_decl_line
	.long	482                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x447:0xf DW_TAG_variable
	.long	.Ldebug_loc37           # DW_AT_location
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	126                     # DW_AT_decl_line
	.long	482                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x456:0xf DW_TAG_variable
	.long	.Ldebug_loc38           # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	134                     # DW_AT_decl_line
	.long	482                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x465:0xf DW_TAG_variable
	.long	.Ldebug_loc40           # DW_AT_location
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	142                     # DW_AT_decl_line
	.long	482                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x474:0xf DW_TAG_variable
	.long	.Ldebug_loc41           # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	129                     # DW_AT_decl_line
	.long	482                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x483:0xf DW_TAG_variable
	.long	.Ldebug_loc42           # DW_AT_location
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	147                     # DW_AT_decl_line
	.long	482                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x492:0xf DW_TAG_variable
	.long	.Ldebug_loc47           # DW_AT_location
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	164                     # DW_AT_decl_line
	.long	482                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x4a1:0xf DW_TAG_variable
	.long	.Ldebug_loc48           # DW_AT_location
	.long	.Linfo_string66         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	168                     # DW_AT_decl_line
	.long	482                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x4b0:0xb DW_TAG_variable
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	141                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	13                      # Abbrev [13] 0x4bb:0xb DW_TAG_variable
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	144                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	13                      # Abbrev [13] 0x4c6:0xb DW_TAG_variable
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	163                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	13                      # Abbrev [13] 0x4d1:0xb DW_TAG_variable
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	166                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	13                      # Abbrev [13] 0x4dc:0xb DW_TAG_variable
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	167                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	17                      # Abbrev [17] 0x4e7:0x6f DW_TAG_inlined_subroutine
	.long	308                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	235                     # DW_AT_call_line
	.byte	8                       # Abbrev [8] 0x4f2:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc44           # DW_AT_location
	.long	320                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x4fb:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc46           # DW_AT_location
	.long	331                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x504:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc39           # DW_AT_location
	.long	342                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x50d:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc43           # DW_AT_location
	.long	353                     # DW_AT_abstract_origin
	.byte	18                      # Abbrev [18] 0x516:0xc DW_TAG_formal_parameter
	.byte	6                       # DW_AT_location
	.byte	16
	.byte	0
	.byte	159
	.byte	157
	.byte	1
	.byte	0
	.long	375                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x522:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	386                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x528:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	397                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x52e:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	408                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x534:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	419                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x53a:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	430                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x540:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	441                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x546:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	452                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x54c:0x9 DW_TAG_variable
	.long	.Ldebug_loc45           # DW_AT_location
	.long	463                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	14                      # Abbrev [14] 0x557:0x7 DW_TAG_base_type
	.long	.Linfo_string22         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	15                      # Abbrev [15] 0x55e:0x5 DW_TAG_pointer_type
	.long	1379                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x563:0x5 DW_TAG_pointer_type
	.long	1384                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x568:0x7 DW_TAG_base_type
	.long	.Linfo_string27         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	15                      # Abbrev [15] 0x56f:0x5 DW_TAG_pointer_type
	.long	482                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp60-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
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
	.long	1397                    # Compilation Unit Length
	.long	308                     # DIE offset
	.asciz	"gcd_cached"            # External Name
	.long	494                     # DIE offset
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
	.long	1397                    # Compilation Unit Length
	.long	475                     # DIE offset
	.asciz	"long long int"         # External Name
	.long	487                     # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	1367                    # DIE offset
	.asciz	"int"                   # External Name
	.long	1384                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git f82fb5beb88e841f7a00cfb2a2ceabe46bcb2a9b) (http://llvm.org/git/llvm.git bafbf2b643f118fd2ea402ed6cd204281c7e9e94)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
