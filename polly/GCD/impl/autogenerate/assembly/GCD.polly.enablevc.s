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
	subq	$72, %rsp
.Ltmp39:
	.cfi_def_cfa_offset 128
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
	#DEBUG_VALUE: main:_48 <- 0
	#DEBUG_VALUE: main:_47 <- 0
	#DEBUG_VALUE: main:_46 <- 0
	#DEBUG_VALUE: main:_45 <- 0
	#DEBUG_VALUE: main:_44 <- 0
	#DEBUG_VALUE: main:_43 <- 0
	#DEBUG_VALUE: main:_42 <- 0
	#DEBUG_VALUE: main:_39_has_ownership <- 0
	#DEBUG_VALUE: main:_39_size <- 0
	#DEBUG_VALUE: main:_34_has_ownership <- 0
	#DEBUG_VALUE: main:_34_size <- 0
	#DEBUG_VALUE: main:_29_has_ownership <- 0
	#DEBUG_VALUE: main:_29_size <- 0
	#DEBUG_VALUE: main:_26 <- 0
	#DEBUG_VALUE: main:_25 <- 0
	#DEBUG_VALUE: main:_24 <- 0
	#DEBUG_VALUE: main:_23 <- 0
	#DEBUG_VALUE: main:_22 <- 0
	#DEBUG_VALUE: main:_21 <- 0
	#DEBUG_VALUE: main:_20 <- 0
	#DEBUG_VALUE: main:_19 <- 0
	#DEBUG_VALUE: main:_18 <- 0
	#DEBUG_VALUE: main:_17_has_ownership <- 0
	#DEBUG_VALUE: main:_17_size <- 0
	#DEBUG_VALUE: main:_16 <- 0
	#DEBUG_VALUE: main:_15 <- 0
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
	.loc	1 175 2 prologue_end    # GCD.c:175:2
	callq	convertArgsToIntArray
.Ltmp47:
	movq	%rax, %rbp
.Ltmp48:
	#DEBUG_VALUE: main:_7 <- %RBP
	decl	%ebx
.Ltmp49:
	movslq	%ebx, %rbx
.Ltmp50:
	#DEBUG_VALUE: main:_7_has_ownership <- 1
	#DEBUG_VALUE: main:_7_size <- %EBX
	.loc	1 180 5                 # GCD.c:180:5
	movq	(%rbp), %rdi
.Ltmp51:
	#DEBUG_VALUE: main:_9 <- %RDI
	.loc	1 182 2                 # GCD.c:182:2
	callq	parseStringToInt
.Ltmp52:
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_6 <- %RAX
	.loc	1 186 9                 # GCD.c:186:9
	testq	%rax, %rax
.Ltmp53:
	.loc	1 186 5 is_stmt 0       # GCD.c:186:5
	je	.LBB2_29
.Ltmp54:
# BB#1:                                 # %if.end
	#DEBUG_VALUE: main:_6 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_7_size <- %EBX
	#DEBUG_VALUE: main:_7 <- %RBP
	movq	%rbx, 32(%rsp)          # 8-byte Spill
	movq	%rbp, 40(%rsp)          # 8-byte Spill
	.loc	1 188 6 is_stmt 1       # GCD.c:188:6
	movq	(%rax), %r14
.Ltmp55:
	#DEBUG_VALUE: gcd_cached:n <- %R14
	#DEBUG_VALUE: main:_12_size <- 4
	#DEBUG_VALUE: main:n <- %R14
	.loc	1 193 2                 # GCD.c:193:2
	movq	%r14, 56(%rsp)          # 8-byte Spill
	movl	$32, %edi
	callq	malloc
.Ltmp56:
	#DEBUG_VALUE: main:_12 <- %RAX
	.loc	1 194 9                 # GCD.c:194:9
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movaps	.LCPI2_0(%rip), %xmm0   # xmm0 = [78,32]
	movups	%xmm0, (%rax)
	.loc	1 194 35 is_stmt 0      # GCD.c:194:35
	movaps	.LCPI2_1(%rip), %xmm0   # xmm0 = [61,32]
	movups	%xmm0, 16(%rax)
.Ltmp57:
	#DEBUG_VALUE: main:_12_has_ownership <- 1
	.loc	1 197 2 is_stmt 1       # GCD.c:197:2
	movl	$4, %esi
	movq	%rax, %rdi
.Ltmp58:
	#DEBUG_VALUE: main:_12 <- [%RSP+24]
	callq	printf_s
.Ltmp59:
	.loc	1 208 2                 # GCD.c:208:2
	xorl	%ebx, %ebx
.Ltmp60:
	xorl	%ebp, %ebp
.Ltmp61:
	.loc	1 201 2                 # GCD.c:201:2
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%r14, %rsi
	callq	printf
	#DEBUG_VALUE: main:_15 <- 0
	.loc	1 205 7                 # GCD.c:205:7
	movl	%r14d, %esi
	imull	%esi, %esi
	.loc	1 208 2                 # GCD.c:208:2
	xorl	%edi, %edi
	callq	gen1DArray
	movq	%r14, %rsi
.Ltmp62:
	#DEBUG_VALUE: gcd_cached:n <- %RSI
	#DEBUG_VALUE: main:n <- %RSI
	movq	%rax, 8(%rsp)           # 8-byte Spill
.Ltmp63:
	#DEBUG_VALUE: main:gcds <- [%RSP+8]
	#DEBUG_VALUE: main:_17 <- [%RSP+8]
	#DEBUG_VALUE: gcd_cached:gcds <- [%RSP+8]
	#DEBUG_VALUE: main:_18 <- 0
	#DEBUG_VALUE: main:_17_has_ownership <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:gcds_has_ownership <- 1
	movb	$1, %r12b
	xorl	%r14d, %r14d
.Ltmp64:
	.loc	1 222 6                 # GCD.c:222:6
	testq	%rsi, %rsi
	jle	.LBB2_2
.Ltmp65:
# BB#3:
	#DEBUG_VALUE: gcd_cached:gcds <- [%RSP+8]
	#DEBUG_VALUE: main:_17 <- [%RSP+8]
	#DEBUG_VALUE: main:gcds <- [%RSP+8]
	#DEBUG_VALUE: main:n <- %RSI
	#DEBUG_VALUE: gcd_cached:n <- %RSI
	xorl	%r12d, %r12d
	xorl	%r15d, %r15d
.Ltmp66:
	.p2align	4, 0x90
.LBB2_4:                                # %if.end29.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_5 Depth 2
                                        #       Child Loop BB2_9 Depth 3
	#DEBUG_VALUE: gcd_cached:a <- %R12
	.loc	1 235 9                 # GCD.c:235:9
	movq	%r12, %rax
	imulq	%rsi, %rax
.Ltmp67:
	#DEBUG_VALUE: main:_42 <- %RAX
	#DEBUG_VALUE: main:_23 <- %RAX
	#DEBUG_VALUE: main:_21 <- %RAX
	movq	%rax, 16(%rsp)          # 8-byte Spill
.Ltmp68:
	#DEBUG_VALUE: main:_42 <- [%RSP+16]
	#DEBUG_VALUE: main:_23 <- [%RSP+16]
	#DEBUG_VALUE: main:_21 <- [%RSP+16]
	.loc	1 233 10                # GCD.c:233:10
	movq	%r12, %rax
	negq	%rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	xorl	%r13d, %r13d
.Ltmp69:
	.p2align	4, 0x90
.LBB2_5:                                # %if.end29
                                        #   Parent Loop BB2_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_9 Depth 3
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
	testq	%r12, %r12
.Ltmp70:
	.loc	1 74 5                  # GCD.c:74:5
	je	.LBB2_14
# BB#6:                                 # %blklab7.i
                                        #   in Loop: Header=BB2_5 Depth=2
	#DEBUG_VALUE: gcd_cached:_6 <- 0
	.loc	1 85 5                  # GCD.c:85:5
	testq	%r13, %r13
.Ltmp71:
	#DEBUG_VALUE: gcd_cached:b <- %R13
	je	.LBB2_7
.Ltmp72:
# BB#8:                                 # %blklab4.i.preheader.preheader
                                        #   in Loop: Header=BB2_5 Depth=2
	#DEBUG_VALUE: gcd_cached:b <- %R13
	.loc	1 94 6                  # GCD.c:94:6
	cmpq	%r13, %r12
.Ltmp73:
	.loc	1 233 10                # GCD.c:233:10
	movq	48(%rsp), %rax          # 8-byte Reload
	movl	$0, %ecx
	cmovgq	%rcx, %rax
.Ltmp74:
	.loc	1 94 5                  # GCD.c:94:5
	movl	$0, %ecx
	cmovgq	%r13, %rcx
	addq	%r13, %rax
	movq	%r12, %rdx
	subq	%rcx, %rdx
	.loc	1 110 6                 # GCD.c:110:6
	imulq	%rsi, %rdx
.Ltmp75:
	#DEBUG_VALUE: gcd_cached:_9 <- %RDX
	.loc	1 112 8                 # GCD.c:112:8
	addq	%rax, %rdx
.Ltmp76:
	#DEBUG_VALUE: gcd_cached:_10 <- %RDX
	movq	8(%rsp), %rsi           # 8-byte Reload
	.loc	1 114 6                 # GCD.c:114:6
	movq	(%rsi,%rdx,8), %rax
.Ltmp77:
	#DEBUG_VALUE: gcd_cached:_11 <- %RAX
	.loc	1 237 11                # GCD.c:237:11
	movq	16(%rsp), %rcx          # 8-byte Reload
	leaq	(%r13,%rcx), %rcx
	.loc	1 239 4                 # GCD.c:239:4
	leaq	(%rsi,%rcx,8), %rdi
.Ltmp78:
	#DEBUG_VALUE: gcd:_7 <- 0
	#DEBUG_VALUE: gcd:_6 <- 0
	#DEBUG_VALUE: gcd:_5 <- 0
	#DEBUG_VALUE: gcd:_4 <- 0
	#DEBUG_VALUE: gcd:_3 <- 0
	#DEBUG_VALUE: gcd:_2 <- 0
	.loc	1 239 14 is_stmt 0      # GCD.c:239:14
	movq	%rax, (%rsi,%rcx,8)
	movq	%r13, %rcx
	movq	%r12, %rdx
.Ltmp79:
	.p2align	4, 0x90
.LBB2_9:                                # %blklab4.i
                                        #   Parent Loop BB2_4 Depth=1
                                        #     Parent Loop BB2_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	#DEBUG_VALUE: main:_26 <- %RDX
	#DEBUG_VALUE: gcd:_5 <- 0
	.loc	1 37 6 is_stmt 1        # GCD.c:37:6
	movq	%rdx, %rsi
	subq	%rcx, %rsi
	jle	.LBB2_12
.Ltmp80:
# BB#10:                                # %if.end9.i
                                        #   in Loop: Header=BB2_9 Depth=3
	#DEBUG_VALUE: main:_26 <- %RDX
	#DEBUG_VALUE: gcd:_4 <- 0
	.loc	1 249 11                # GCD.c:249:11
	movq	%rsi, %rdx
.Ltmp81:
	jns	.LBB2_9
	jmp	.LBB2_11
.LBB2_12:                               # %blklab5.i
                                        #   in Loop: Header=BB2_9 Depth=3
.Ltmp82:
	#DEBUG_VALUE: main:_26 <- %RDX
	#DEBUG_VALUE: gcd:_4 <- 0
	.loc	1 35 6                  # GCD.c:35:6
	subq	%rdx, %rcx
	jne	.LBB2_9
.Ltmp83:
# BB#13:                                # %gcd.exit
                                        #   in Loop: Header=BB2_5 Depth=2
	#DEBUG_VALUE: main:_26 <- %RDX
	.loc	1 251 11                # GCD.c:251:11
	cmpq	%rdx, %rax
	je	.LBB2_15
	jmp	.LBB2_11
.Ltmp84:
	.p2align	4, 0x90
.LBB2_14:                               # %gcd_cached.exit
                                        #   in Loop: Header=BB2_5 Depth=2
	.loc	1 237 11                # GCD.c:237:11
	movq	16(%rsp), %rax          # 8-byte Reload
	leaq	(%r13,%rax), %rax
.Ltmp85:
	#DEBUG_VALUE: main:_43 <- %RAX
	#DEBUG_VALUE: main:_24 <- %RAX
	#DEBUG_VALUE: main:_22 <- %RAX
	movq	8(%rsp), %rcx           # 8-byte Reload
	.loc	1 239 4                 # GCD.c:239:4
	leaq	(%rcx,%rax,8), %rdi
	#DEBUG_VALUE: gcd:_7 <- 0
	#DEBUG_VALUE: gcd:_6 <- 0
	#DEBUG_VALUE: gcd:_5 <- 0
	#DEBUG_VALUE: gcd:_4 <- 0
	#DEBUG_VALUE: gcd:_3 <- 0
	#DEBUG_VALUE: gcd:_2 <- 0
	.loc	1 239 14 is_stmt 0      # GCD.c:239:14
	movq	%r13, (%rcx,%rax,8)
	jmp	.LBB2_15
.Ltmp86:
	.p2align	4, 0x90
.LBB2_7:                                # %blklab4.lr.ph.i.preheader.thread
                                        #   in Loop: Header=BB2_5 Depth=2
	#DEBUG_VALUE: gcd_cached:b <- %R13
	.loc	1 237 11 is_stmt 1      # GCD.c:237:11
	movq	16(%rsp), %rax          # 8-byte Reload
	leaq	(%r13,%rax), %rax
	movq	8(%rsp), %rcx           # 8-byte Reload
	.loc	1 239 4                 # GCD.c:239:4
	leaq	(%rcx,%rax,8), %rdi
	#DEBUG_VALUE: gcd:_7 <- 0
	#DEBUG_VALUE: gcd:_6 <- 0
	#DEBUG_VALUE: gcd:_5 <- 0
	#DEBUG_VALUE: gcd:_4 <- 0
	#DEBUG_VALUE: gcd:_3 <- 0
	#DEBUG_VALUE: gcd:_2 <- 0
	.loc	1 239 14 is_stmt 0      # GCD.c:239:14
	movq	%r12, (%rcx,%rax,8)
.Ltmp87:
.LBB2_15:                               # %blklab18
                                        #   in Loop: Header=BB2_5 Depth=2
	movq	%rdi, 64(%rsp)          # 8-byte Spill
.Ltmp88:
	.loc	1 262 4 is_stmt 1       # GCD.c:262:4
	testb	$1, %bpl
	je	.LBB2_17
# BB#16:                                # %if.then43
                                        #   in Loop: Header=BB2_5 Depth=2
.Ltmp89:
	.loc	1 262 4 is_stmt 0 discriminator 1 # GCD.c:262:4
	movq	%r15, %rdi
	callq	free
.Ltmp90:
	#DEBUG_VALUE: main:_29_has_ownership <- 0
.LBB2_17:                               # %if.end44
                                        #   in Loop: Header=BB2_5 Depth=2
	#DEBUG_VALUE: main:_29_size <- 8
	.loc	1 263 4 is_stmt 1       # GCD.c:263:4
	movl	$64, %edi
	callq	malloc
	movq	%rax, %r15
.Ltmp91:
	#DEBUG_VALUE: main:_29 <- %R15
	.loc	1 264 11                # GCD.c:264:11
	movaps	.LCPI2_2(%rip), %xmm0   # xmm0 = [78,117]
	movups	%xmm0, (%r15)
	.loc	1 264 38 is_stmt 0      # GCD.c:264:38
	movaps	.LCPI2_3(%rip), %xmm0   # xmm0 = [109,98]
	movups	%xmm0, 16(%r15)
	.loc	1 264 65                # GCD.c:264:65
	movaps	.LCPI2_4(%rip), %xmm0   # xmm0 = [101,114]
	movups	%xmm0, 32(%r15)
	.loc	1 264 93                # GCD.c:264:93
	movaps	.LCPI2_5(%rip), %xmm0   # xmm0 = [58,32]
	movups	%xmm0, 48(%r15)
.Ltmp92:
	#DEBUG_VALUE: main:_29_has_ownership <- 1
	.loc	1 267 4 is_stmt 1       # GCD.c:267:4
	movl	$8, %esi
	movq	%r15, %rdi
	callq	printf_s
	.loc	1 271 4                 # GCD.c:271:4
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	movq	%r12, %rsi
	callq	printf
.Ltmp93:
	.loc	1 275 4                 # GCD.c:275:4
	testb	$1, %bpl
	je	.LBB2_19
.Ltmp94:
# BB#18:                                # %if.then56
                                        #   in Loop: Header=BB2_5 Depth=2
	#DEBUG_VALUE: main:_29 <- %R15
	.loc	1 275 4 is_stmt 0 discriminator 1 # GCD.c:275:4
	movq	%r14, %rdi
	callq	free
.Ltmp95:
	#DEBUG_VALUE: main:_34_has_ownership <- 0
.LBB2_19:                               # %if.end57
                                        #   in Loop: Header=BB2_5 Depth=2
	#DEBUG_VALUE: main:_29 <- %R15
	#DEBUG_VALUE: main:_34_size <- 9
	.loc	1 276 4 is_stmt 1       # GCD.c:276:4
	movl	$72, %edi
	callq	malloc
	movq	%rax, %r14
.Ltmp96:
	#DEBUG_VALUE: main:_34 <- %R14
	.loc	1 277 11                # GCD.c:277:11
	movaps	.LCPI2_6(%rip), %xmm0   # xmm0 = [32,78]
	movups	%xmm0, (%r14)
	.loc	1 277 37 is_stmt 0      # GCD.c:277:37
	movaps	.LCPI2_7(%rip), %xmm0   # xmm0 = [117,109]
	movups	%xmm0, 16(%r14)
	.loc	1 277 65                # GCD.c:277:65
	movaps	.LCPI2_8(%rip), %xmm0   # xmm0 = [98,101]
	movups	%xmm0, 32(%r14)
	.loc	1 277 92                # GCD.c:277:92
	movaps	.LCPI2_9(%rip), %xmm0   # xmm0 = [114,58]
	movups	%xmm0, 48(%r14)
	.loc	1 277 119               # GCD.c:277:119
	movq	$32, 64(%r14)
.Ltmp97:
	#DEBUG_VALUE: main:_34_has_ownership <- 1
	.loc	1 280 4 is_stmt 1       # GCD.c:280:4
	movl	$9, %esi
	movq	%r14, %rdi
	callq	printf_s
	.loc	1 284 4                 # GCD.c:284:4
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	movq	%r13, %rsi
	callq	printf
.Ltmp98:
	.loc	1 288 4                 # GCD.c:288:4
	testb	$1, %bpl
	je	.LBB2_21
.Ltmp99:
# BB#20:                                # %if.then70
                                        #   in Loop: Header=BB2_5 Depth=2
	#DEBUG_VALUE: main:_29 <- %R15
	#DEBUG_VALUE: main:_34 <- %R14
	.loc	1 288 4 is_stmt 0 discriminator 1 # GCD.c:288:4
	movq	%rbx, %rdi
	callq	free
.Ltmp100:
	#DEBUG_VALUE: main:_39_has_ownership <- 0
.LBB2_21:                               # %if.end71
                                        #   in Loop: Header=BB2_5 Depth=2
	#DEBUG_VALUE: main:_29 <- %R15
	#DEBUG_VALUE: main:_34 <- %R14
	#DEBUG_VALUE: main:_39_size <- 5
	.loc	1 289 4 is_stmt 1       # GCD.c:289:4
	movl	$40, %edi
	callq	malloc
	movq	%rax, %rbx
.Ltmp101:
	#DEBUG_VALUE: main:_39 <- %RBX
	.loc	1 290 11                # GCD.c:290:11
	movaps	.LCPI2_10(%rip), %xmm0  # xmm0 = [32,71]
	movups	%xmm0, (%rbx)
	.loc	1 290 37 is_stmt 0      # GCD.c:290:37
	movaps	.LCPI2_11(%rip), %xmm0  # xmm0 = [67,68]
	movups	%xmm0, 16(%rbx)
	.loc	1 290 63                # GCD.c:290:63
	movq	$58, 32(%rbx)
.Ltmp102:
	#DEBUG_VALUE: main:_39_has_ownership <- 1
	.loc	1 293 4 is_stmt 1       # GCD.c:293:4
	movl	$5, %esi
	movq	%rbx, %rdi
	callq	printf_s
	.loc	1 301 8                 # GCD.c:301:8
	movq	64(%rsp), %rax          # 8-byte Reload
	movq	(%rax), %rsi
.Ltmp103:
	#DEBUG_VALUE: main:_44 <- %RSI
	.loc	1 303 4                 # GCD.c:303:4
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp104:
	#DEBUG_VALUE: main:_45 <- 1
	.loc	1 307 9                 # GCD.c:307:9
	incq	%r13
.Ltmp105:
	#DEBUG_VALUE: main:_46 <- %R13
	#DEBUG_VALUE: main:j <- %R13
	movb	$1, %bpl
	movq	56(%rsp), %rsi          # 8-byte Reload
.Ltmp106:
	.loc	1 230 8                 # GCD.c:230:8
	cmpq	%rsi, %r13
	jl	.LBB2_5
.Ltmp107:
# BB#22:                                # %blklab16
                                        #   in Loop: Header=BB2_4 Depth=1
	#DEBUG_VALUE: main:_34 <- %R14
	#DEBUG_VALUE: main:_29 <- %R15
	#DEBUG_VALUE: main:j <- %R13
	#DEBUG_VALUE: main:_46 <- %R13
	#DEBUG_VALUE: main:_39 <- %RBX
	#DEBUG_VALUE: main:_47 <- 1
	.loc	1 318 8                 # GCD.c:318:8
	incq	%r12
.Ltmp108:
	#DEBUG_VALUE: main:_48 <- %R12
	#DEBUG_VALUE: main:i <- %R12
	movb	$1, %bpl
.Ltmp109:
	.loc	1 222 7                 # GCD.c:222:7
	cmpq	%rsi, %r12
	jl	.LBB2_4
.Ltmp110:
# BB#23:
	#DEBUG_VALUE: main:_39 <- %RBX
	#DEBUG_VALUE: main:_46 <- %R13
	#DEBUG_VALUE: main:j <- %R13
	#DEBUG_VALUE: main:_29 <- %R15
	#DEBUG_VALUE: main:_34 <- %R14
	#DEBUG_VALUE: main:i <- %R12
	#DEBUG_VALUE: main:_48 <- %R12
	xorl	%r12d, %r12d
.Ltmp111:
.LBB2_24:                               # %if.end98
	.loc	1 329 2 discriminator 1 # GCD.c:329:2
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	free
.Ltmp112:
	#DEBUG_VALUE: main:gcds_has_ownership <- 0
	.loc	1 330 2 discriminator 1 # GCD.c:330:2
	movq	40(%rsp), %rdi          # 8-byte Reload
	movq	32(%rsp), %rsi          # 8-byte Reload
	callq	free2DArray
.Ltmp113:
	#DEBUG_VALUE: main:_7_has_ownership <- 0
	.loc	1 332 2 discriminator 1 # GCD.c:332:2
	movq	24(%rsp), %rdi          # 8-byte Reload
	callq	free
.Ltmp114:
	#DEBUG_VALUE: main:_12_has_ownership <- 0
	.loc	1 334 2                 # GCD.c:334:2
	testb	%r12b, %r12b
	jne	.LBB2_26
# BB#25:                                # %if.then100
.Ltmp115:
	.loc	1 334 2 is_stmt 0 discriminator 1 # GCD.c:334:2
	movq	%r15, %rdi
	callq	free
.Ltmp116:
	#DEBUG_VALUE: main:_29_has_ownership <- 0
.LBB2_26:                               # %if.end101
	.loc	1 335 2 is_stmt 1       # GCD.c:335:2
	testb	%bpl, %bpl
	je	.LBB2_28
# BB#27:                                # %if.then103
.Ltmp117:
	.loc	1 335 2 is_stmt 0 discriminator 1 # GCD.c:335:2
	movq	%r14, %rdi
	callq	free
.Ltmp118:
	#DEBUG_VALUE: main:_34_has_ownership <- 0
	.loc	1 336 2 is_stmt 1 discriminator 1 # GCD.c:336:2
	movq	%rbx, %rdi
	callq	free
.Ltmp119:
	#DEBUG_VALUE: main:_39_has_ownership <- 0
.LBB2_28:                               # %if.end107
	.loc	1 337 2                 # GCD.c:337:2
	xorl	%edi, %edi
	callq	exit
.LBB2_11:                               # %if.end3.i
.Ltmp120:
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
.Ltmp121:
.LBB2_29:                               # %if.end104.thread
	#DEBUG_VALUE: main:_6 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_7_size <- %EBX
	#DEBUG_VALUE: main:_7 <- %RBP
	.loc	1 330 2 discriminator 1 # GCD.c:330:2
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	callq	free2DArray
.Ltmp122:
	#DEBUG_VALUE: main:_7_has_ownership <- 0
	.loc	1 337 2                 # GCD.c:337:2
	xorl	%edi, %edi
	callq	exit
.Ltmp123:
.LBB2_2:
	#DEBUG_VALUE: gcd_cached:gcds <- [%RSP+8]
	#DEBUG_VALUE: main:_17 <- [%RSP+8]
	#DEBUG_VALUE: main:gcds <- [%RSP+8]
	#DEBUG_VALUE: main:n <- %RSI
	#DEBUG_VALUE: gcd_cached:n <- %RSI
	xorl	%r15d, %r15d
	jmp	.LBB2_24
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

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"%lld"
	.size	.L.str.2, 5

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
	.asciz	"a"                     # string offset=257
.Linfo_string6:
	.asciz	"b"                     # string offset=259
.Linfo_string7:
	.asciz	"n"                     # string offset=261
.Linfo_string8:
	.asciz	"gcds"                  # string offset=263
.Linfo_string9:
	.asciz	"gcds_size"             # string offset=268
.Linfo_string10:
	.asciz	"gcds_has_ownership"    # string offset=278
.Linfo_string11:
	.asciz	"_Bool"                 # string offset=297
.Linfo_string12:
	.asciz	"_4"                    # string offset=303
.Linfo_string13:
	.asciz	"_5"                    # string offset=306
.Linfo_string14:
	.asciz	"_6"                    # string offset=309
.Linfo_string15:
	.asciz	"_7"                    # string offset=312
.Linfo_string16:
	.asciz	"_8"                    # string offset=315
.Linfo_string17:
	.asciz	"_9"                    # string offset=318
.Linfo_string18:
	.asciz	"_10"                   # string offset=321
.Linfo_string19:
	.asciz	"_11"                   # string offset=325
.Linfo_string20:
	.asciz	"gcd"                   # string offset=329
.Linfo_string21:
	.asciz	"_3"                    # string offset=333
.Linfo_string22:
	.asciz	"_2"                    # string offset=336
.Linfo_string23:
	.asciz	"main"                  # string offset=339
.Linfo_string24:
	.asciz	"int"                   # string offset=344
.Linfo_string25:
	.asciz	"argc"                  # string offset=348
.Linfo_string26:
	.asciz	"args"                  # string offset=353
.Linfo_string27:
	.asciz	"char"                  # string offset=358
.Linfo_string28:
	.asciz	"_48"                   # string offset=363
.Linfo_string29:
	.asciz	"_47"                   # string offset=367
.Linfo_string30:
	.asciz	"_46"                   # string offset=371
.Linfo_string31:
	.asciz	"_45"                   # string offset=375
.Linfo_string32:
	.asciz	"_44"                   # string offset=379
.Linfo_string33:
	.asciz	"_43"                   # string offset=383
.Linfo_string34:
	.asciz	"_42"                   # string offset=387
.Linfo_string35:
	.asciz	"_39_has_ownership"     # string offset=391
.Linfo_string36:
	.asciz	"_39_size"              # string offset=409
.Linfo_string37:
	.asciz	"_34_has_ownership"     # string offset=418
.Linfo_string38:
	.asciz	"_34_size"              # string offset=436
.Linfo_string39:
	.asciz	"_29_has_ownership"     # string offset=445
.Linfo_string40:
	.asciz	"_29_size"              # string offset=463
.Linfo_string41:
	.asciz	"_26"                   # string offset=472
.Linfo_string42:
	.asciz	"_25"                   # string offset=476
.Linfo_string43:
	.asciz	"_24"                   # string offset=480
.Linfo_string44:
	.asciz	"_23"                   # string offset=484
.Linfo_string45:
	.asciz	"_22"                   # string offset=488
.Linfo_string46:
	.asciz	"_21"                   # string offset=492
.Linfo_string47:
	.asciz	"_20"                   # string offset=496
.Linfo_string48:
	.asciz	"_19"                   # string offset=500
.Linfo_string49:
	.asciz	"_18"                   # string offset=504
.Linfo_string50:
	.asciz	"_17_has_ownership"     # string offset=508
.Linfo_string51:
	.asciz	"_17_size"              # string offset=526
.Linfo_string52:
	.asciz	"_16"                   # string offset=535
.Linfo_string53:
	.asciz	"_15"                   # string offset=539
.Linfo_string54:
	.asciz	"_12_has_ownership"     # string offset=543
.Linfo_string55:
	.asciz	"_12_size"              # string offset=561
.Linfo_string56:
	.asciz	"_9_has_ownership"      # string offset=570
.Linfo_string57:
	.asciz	"_9_size"               # string offset=587
.Linfo_string58:
	.asciz	"_7_has_ownership"      # string offset=595
.Linfo_string59:
	.asciz	"_7_size_size"          # string offset=612
.Linfo_string60:
	.asciz	"_7_size"               # string offset=625
.Linfo_string61:
	.asciz	"j"                     # string offset=633
.Linfo_string62:
	.asciz	"i"                     # string offset=635
.Linfo_string63:
	.asciz	"max"                   # string offset=637
.Linfo_string64:
	.asciz	"_12"                   # string offset=641
.Linfo_string65:
	.asciz	"_17"                   # string offset=645
.Linfo_string66:
	.asciz	"_29"                   # string offset=649
.Linfo_string67:
	.asciz	"_34"                   # string offset=653
.Linfo_string68:
	.asciz	"_39"                   # string offset=657
.Linfo_string69:
	.asciz	"_13"                   # string offset=661
.Linfo_string70:
	.asciz	"_27"                   # string offset=665
.Linfo_string71:
	.asciz	"_30"                   # string offset=669
.Linfo_string72:
	.asciz	"_32"                   # string offset=673
.Linfo_string73:
	.asciz	"_35"                   # string offset=677
.Linfo_string74:
	.asciz	"_37"                   # string offset=681
.Linfo_string75:
	.asciz	"_40"                   # string offset=685
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
	.quad	.Ltmp49-.Lfunc_begin0
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
	.quad	.Ltmp108-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp108-.Lfunc_begin0
	.quad	.Ltmp111-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp107-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp107-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp105-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp105-.Lfunc_begin0
	.quad	.Ltmp111-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp104-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp104-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp103-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp103-.Lfunc_begin0
	.quad	.Ltmp104-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp86-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp67-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	16                      # 16
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp102-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp102-.Lfunc_begin0
	.quad	.Ltmp119-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp119-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp100-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	5                       # 5
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp97-.Lfunc_begin0
	.quad	.Ltmp118-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp118-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc23:
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
	.byte	9                       # 9
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp92-.Lfunc_begin0
	.quad	.Ltmp116-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp116-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc25:
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
	.byte	8                       # 8
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp86-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp67-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	16                      # 16
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp86-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp67-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	16                      # 16
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp57-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp114-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp114-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	4                       # 4
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc33:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp113-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc34:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp121-.Lfunc_begin0
	.quad	.Ltmp123-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc35:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp105-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp105-.Lfunc_begin0
	.quad	.Ltmp111-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc36:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp108-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp108-.Lfunc_begin0
	.quad	.Ltmp111-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc37:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Ltmp112-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp112-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc38:
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Ltmp62-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	.Ltmp62-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp123-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc39:
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp61-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp121-.Lfunc_begin0
	.quad	.Ltmp123-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc40:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc41:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp121-.Lfunc_begin0
	.quad	.Ltmp122-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc42:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp121-.Lfunc_begin0
	.quad	.Ltmp122-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc43:
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Ltmp62-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	.Ltmp62-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp123-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc44:
	.quad	.Ltmp56-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp58-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	24                      # 24
	.quad	0
	.quad	0
.Ldebug_loc45:
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
	.quad	.Ltmp123-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
	.quad	0
	.quad	0
.Ldebug_loc46:
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
	.quad	.Ltmp123-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
	.quad	0
	.quad	0
.Ldebug_loc47:
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
	.quad	.Ltmp123-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
	.quad	0
	.quad	0
.Ldebug_loc48:
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc49:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp76-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc50:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp76-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc51:
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc52:
	.quad	.Ltmp71-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc53:
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp111-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc54:
	.quad	.Ltmp96-.Lfunc_begin0
	.quad	.Ltmp111-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc55:
	.quad	.Ltmp101-.Lfunc_begin0
	.quad	.Ltmp111-.Lfunc_begin0
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
	.byte	8                       # Abbreviation Code
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
	.byte	9                       # Abbreviation Code
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
	.byte	10                      # Abbreviation Code
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
	.byte	11                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	12                      # Abbreviation Code
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
	.byte	13                      # Abbreviation Code
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
	.byte	14                      # Abbreviation Code
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
	.byte	15                      # Abbreviation Code
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
	.long	1566                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x617 DW_TAG_compile_unit
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
	.long	434                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x3e:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	446                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x47:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	457                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x50:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	523                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x56:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	512                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x5c:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	501                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x62:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	490                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x68:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	479                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x6e:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	468                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	3                       # Abbrev [3] 0x75:0x83 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	248                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x88:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	260                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x91:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc3            # DW_AT_location
	.long	271                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x9a:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc4            # DW_AT_location
	.long	282                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0xa3:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc5            # DW_AT_location
	.long	293                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0xac:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc6            # DW_AT_location
	.long	304                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0xb5:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc7            # DW_AT_location
	.long	315                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xbe:0x9 DW_TAG_variable
	.long	.Ldebug_loc8            # DW_AT_location
	.long	403                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xc7:0x9 DW_TAG_variable
	.long	.Ldebug_loc9            # DW_AT_location
	.long	392                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0xd0:0x9 DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	381                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0xd9:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	370                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0xdf:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	359                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0xe5:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	348                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0xeb:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	337                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0xf1:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	326                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0xf8:0xa7 DW_TAG_subprogram
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	415                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	8                       # Abbrev [8] 0x104:0xb DW_TAG_formal_parameter
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x10f:0xb DW_TAG_formal_parameter
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x11a:0xb DW_TAG_formal_parameter
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x125:0xb DW_TAG_formal_parameter
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	422                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x130:0xb DW_TAG_formal_parameter
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x13b:0xb DW_TAG_formal_parameter
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	427                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x146:0xb DW_TAG_variable
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x151:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x15c:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	65                      # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x167:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	66                      # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x172:0xb DW_TAG_variable
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	67                      # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x17d:0xb DW_TAG_variable
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	68                      # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x188:0xb DW_TAG_variable
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	69                      # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x193:0xb DW_TAG_variable
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	10                      # Abbrev [10] 0x19f:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	11                      # Abbrev [11] 0x1a6:0x5 DW_TAG_pointer_type
	.long	415                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1ab:0x7 DW_TAG_base_type
	.long	.Linfo_string11         # DW_AT_name
	.byte	2                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	7                       # Abbrev [7] 0x1b2:0x65 DW_TAG_subprogram
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	415                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	8                       # Abbrev [8] 0x1be:0xb DW_TAG_formal_parameter
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x1c9:0xb DW_TAG_formal_parameter
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x1d4:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x1df:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x1ea:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x1f5:0xb DW_TAG_variable
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x200:0xb DW_TAG_variable
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x20b:0xb DW_TAG_variable
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0x217:0x3ed DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	125                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1540                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	13                      # Abbrev [13] 0x230:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	125                     # DW_AT_decl_line
	.long	1540                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x23f:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	125                     # DW_AT_decl_line
	.long	1547                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x24e:0xf DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	173                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x25d:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	172                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x26c:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	171                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x27b:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	170                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x28a:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	169                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x299:0xf DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	168                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x2a8:0xf DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	167                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x2b7:0xf DW_TAG_variable
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	165                     # DW_AT_decl_line
	.long	427                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x2c6:0xf DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	164                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x2d5:0xf DW_TAG_variable
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	161                     # DW_AT_decl_line
	.long	427                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x2e4:0xf DW_TAG_variable
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	160                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x2f3:0xf DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	157                     # DW_AT_decl_line
	.long	427                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x302:0xf DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	156                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x311:0xf DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	154                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x320:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	153                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x32c:0xf DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	152                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x33b:0xf DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	151                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x34a:0xf DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	150                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x359:0xf DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	149                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x368:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	148                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x374:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	147                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x380:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	146                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x38c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	145                     # DW_AT_decl_line
	.long	427                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x398:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	144                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x3a4:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	143                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x3b0:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	142                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x3bc:0xf DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	140                     # DW_AT_decl_line
	.long	427                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x3cb:0xf DW_TAG_variable
	.long	.Ldebug_loc32           # DW_AT_location
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	139                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x3da:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	137                     # DW_AT_decl_line
	.long	427                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x3e6:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	136                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x3f2:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	135                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x3fe:0xf DW_TAG_variable
	.long	.Ldebug_loc33           # DW_AT_location
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	134                     # DW_AT_decl_line
	.long	427                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x40d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	133                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x419:0xf DW_TAG_variable
	.long	.Ldebug_loc34           # DW_AT_location
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	133                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x428:0xf DW_TAG_variable
	.long	.Ldebug_loc35           # DW_AT_location
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	131                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x437:0xf DW_TAG_variable
	.long	.Ldebug_loc36           # DW_AT_location
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	130                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x446:0xf DW_TAG_variable
	.long	.Ldebug_loc37           # DW_AT_location
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	129                     # DW_AT_decl_line
	.long	427                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x455:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	128                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x461:0xf DW_TAG_variable
	.long	.Ldebug_loc38           # DW_AT_location
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	127                     # DW_AT_decl_line
	.long	415                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x470:0xf DW_TAG_variable
	.long	.Ldebug_loc39           # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	133                     # DW_AT_decl_line
	.long	1564                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x47f:0xf DW_TAG_variable
	.long	.Ldebug_loc40           # DW_AT_location
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	136                     # DW_AT_decl_line
	.long	422                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x48e:0xf DW_TAG_variable
	.long	.Ldebug_loc41           # DW_AT_location
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	126                     # DW_AT_decl_line
	.long	422                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x49d:0xf DW_TAG_variable
	.long	.Ldebug_loc42           # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	132                     # DW_AT_decl_line
	.long	422                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x4ac:0xf DW_TAG_variable
	.long	.Ldebug_loc44           # DW_AT_location
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	139                     # DW_AT_decl_line
	.long	422                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x4bb:0xf DW_TAG_variable
	.long	.Ldebug_loc45           # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	128                     # DW_AT_decl_line
	.long	422                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x4ca:0xf DW_TAG_variable
	.long	.Ldebug_loc46           # DW_AT_location
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	144                     # DW_AT_decl_line
	.long	422                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x4d9:0xf DW_TAG_variable
	.long	.Ldebug_loc53           # DW_AT_location
	.long	.Linfo_string66         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	156                     # DW_AT_decl_line
	.long	422                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x4e8:0xf DW_TAG_variable
	.long	.Ldebug_loc54           # DW_AT_location
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	160                     # DW_AT_decl_line
	.long	422                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x4f7:0xf DW_TAG_variable
	.long	.Ldebug_loc55           # DW_AT_location
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	164                     # DW_AT_decl_line
	.long	422                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x506:0xb DW_TAG_variable
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	138                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x511:0xb DW_TAG_variable
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	141                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x51c:0xb DW_TAG_variable
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	155                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x527:0xb DW_TAG_variable
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	158                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x532:0xb DW_TAG_variable
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	159                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x53d:0xb DW_TAG_variable
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	162                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x548:0xb DW_TAG_variable
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	163                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x553:0xb DW_TAG_variable
	.long	.Linfo_string75         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	166                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	17                      # Abbrev [17] 0x55e:0x75 DW_TAG_inlined_subroutine
	.long	248                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	233                     # DW_AT_call_line
	.byte	4                       # Abbrev [4] 0x569:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc48           # DW_AT_location
	.long	260                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x572:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc52           # DW_AT_location
	.long	271                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x57b:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc43           # DW_AT_location
	.long	282                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x584:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc47           # DW_AT_location
	.long	293                     # DW_AT_abstract_origin
	.byte	18                      # Abbrev [18] 0x58d:0xc DW_TAG_formal_parameter
	.byte	6                       # DW_AT_location
	.byte	16
	.byte	0
	.byte	159
	.byte	157
	.byte	1
	.byte	0
	.long	315                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x599:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	326                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x59f:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	337                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x5a5:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	348                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x5ab:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	359                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x5b1:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	370                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x5b7:0x9 DW_TAG_variable
	.long	.Ldebug_loc49           # DW_AT_location
	.long	381                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x5c0:0x9 DW_TAG_variable
	.long	.Ldebug_loc50           # DW_AT_location
	.long	392                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x5c9:0x9 DW_TAG_variable
	.long	.Ldebug_loc51           # DW_AT_location
	.long	403                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x5d3:0x30 DW_TAG_inlined_subroutine
	.long	434                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges1         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	249                     # DW_AT_call_line
	.byte	5                       # Abbrev [5] 0x5de:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	468                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x5e4:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	479                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x5ea:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	490                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x5f0:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	501                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x5f6:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	512                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x5fc:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	523                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	10                      # Abbrev [10] 0x604:0x7 DW_TAG_base_type
	.long	.Linfo_string24         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	11                      # Abbrev [11] 0x60b:0x5 DW_TAG_pointer_type
	.long	1552                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x610:0x5 DW_TAG_pointer_type
	.long	1557                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x615:0x7 DW_TAG_base_type
	.long	.Linfo_string27         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	11                      # Abbrev [11] 0x61c:0x5 DW_TAG_pointer_type
	.long	422                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	0
	.quad	0
.Ldebug_ranges1:
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.quad	.Ltmp120-.Lfunc_begin0
	.quad	.Ltmp121-.Lfunc_begin0
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
	.long	1570                    # Compilation Unit Length
	.long	248                     # DIE offset
	.asciz	"gcd_cached"            # External Name
	.long	535                     # DIE offset
	.asciz	"main"                  # External Name
	.long	434                     # DIE offset
	.asciz	"gcd"                   # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	1570                    # Compilation Unit Length
	.long	415                     # DIE offset
	.asciz	"long long int"         # External Name
	.long	427                     # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	1540                    # DIE offset
	.asciz	"int"                   # External Name
	.long	1557                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
