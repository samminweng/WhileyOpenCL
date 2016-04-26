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
	#DEBUG_VALUE: gcd_cached:a <- %RDI
	#DEBUG_VALUE: gcd_cached:b <- %RSI
	#DEBUG_VALUE: gcd_cached:n <- %RDX
	#DEBUG_VALUE: gcd_cached:gcds <- %RCX
	#DEBUG_VALUE: gcd_cached:gcds_size <- %R8
	#DEBUG_VALUE: gcd_cached:_4 <- 0
	#DEBUG_VALUE: gcd_cached:_5 <- 0
	#DEBUG_VALUE: gcd_cached:_6 <- 0
	#DEBUG_VALUE: gcd_cached:_7 <- 0
	#DEBUG_VALUE: gcd_cached:_8 <- 0
	#DEBUG_VALUE: gcd_cached:_9 <- 0
	#DEBUG_VALUE: gcd_cached:_10 <- 0
	#DEBUG_VALUE: gcd_cached:_11 <- 0
	.loc	1 74 6 prologue_end     # GCD.c:74:6
	testq	%rdi, %rdi
	je	.LBB1_4
.Ltmp9:
# BB#1:                                 # %blklab7
	#DEBUG_VALUE: gcd_cached:gcds_size <- %R8
	#DEBUG_VALUE: gcd_cached:gcds <- %RCX
	#DEBUG_VALUE: gcd_cached:n <- %RDX
	#DEBUG_VALUE: gcd_cached:b <- %RSI
	#DEBUG_VALUE: gcd_cached:a <- %RDI
	#DEBUG_VALUE: gcd_cached:_6 <- 0
	.loc	1 84 6                  # GCD.c:84:6
	testq	%rsi, %rsi
	je	.LBB1_2
.Ltmp10:
# BB#3:                                 # %blklab9
	#DEBUG_VALUE: gcd_cached:a <- %RDI
	#DEBUG_VALUE: gcd_cached:b <- %RSI
	#DEBUG_VALUE: gcd_cached:n <- %RDX
	#DEBUG_VALUE: gcd_cached:gcds <- %RCX
	#DEBUG_VALUE: gcd_cached:gcds_size <- %R8
	movq	%rdi, %rax
	negq	%rax
	xorl	%r8d, %r8d
.Ltmp11:
	.loc	1 92 6                  # GCD.c:92:6
	cmpq	%rsi, %rdi
	cmovgq	%r8, %rax
.Ltmp12:
	.loc	1 92 5 is_stmt 0        # GCD.c:92:5
	cmovgq	%rsi, %r8
	addq	%rsi, %rax
	subq	%r8, %rdi
.Ltmp13:
	.loc	1 108 6 is_stmt 1       # GCD.c:108:6
	imulq	%rdx, %rdi
.Ltmp14:
	#DEBUG_VALUE: gcd_cached:_9 <- %RDI
	.loc	1 110 8                 # GCD.c:110:8
	addq	%rax, %rdi
.Ltmp15:
	#DEBUG_VALUE: gcd_cached:_10 <- %RDI
	.loc	1 112 6                 # GCD.c:112:6
	movq	(%rcx,%rdi,8), %rsi
.Ltmp16:
	#DEBUG_VALUE: gcd_cached:_11 <- %RSI
.LBB1_4:                                # %cleanup
	#DEBUG_VALUE: gcd_cached:gcds <- %RCX
	#DEBUG_VALUE: gcd_cached:n <- %RDX
	.loc	1 120 1 discriminator 2 # GCD.c:120:1
	movq	%rsi, %rax
	retq
.LBB1_2:
.Ltmp17:
	#DEBUG_VALUE: gcd_cached:a <- %RDI
	#DEBUG_VALUE: gcd_cached:b <- %RSI
	#DEBUG_VALUE: gcd_cached:n <- %RDX
	#DEBUG_VALUE: gcd_cached:gcds <- %RCX
	#DEBUG_VALUE: gcd_cached:gcds_size <- %R8
	movq	%rdi, %rsi
.Ltmp18:
	movq	%rsi, %rax
	retq
.Ltmp19:
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
	.loc	1 122 0                 # GCD.c:122:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 159 2 prologue_end    # GCD.c:159:2
	pushq	%rbp
.Ltmp20:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp21:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp22:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp23:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp24:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp25:
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
.Ltmp26:
	.cfi_def_cfa_offset 80
.Ltmp27:
	.cfi_offset %rbx, -56
.Ltmp28:
	.cfi_offset %r12, -48
.Ltmp29:
	.cfi_offset %r13, -40
.Ltmp30:
	.cfi_offset %r14, -32
.Ltmp31:
	.cfi_offset %r15, -24
.Ltmp32:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
.Ltmp33:
	#DEBUG_VALUE: main:n <- 0
	#DEBUG_VALUE: main:gcds_size <- 0
	#DEBUG_VALUE: main:sum <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_8_size <- 0
	#DEBUG_VALUE: main:_8_size_size <- 0
	#DEBUG_VALUE: main:_9 <- 0
	#DEBUG_VALUE: main:_10_size <- 0
	#DEBUG_VALUE: main:_13_size <- 0
	#DEBUG_VALUE: main:_16 <- 0
	#DEBUG_VALUE: main:_17 <- 0
	#DEBUG_VALUE: main:_18_size <- 0
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
	#DEBUG_VALUE: main:_40_size <- 0
	callq	convertArgsToIntArray
.Ltmp34:
	#DEBUG_VALUE: main:_8 <- %RAX
	.loc	1 163 6                 # GCD.c:163:6
	movq	(%rax), %rdi
.Ltmp35:
	#DEBUG_VALUE: main:_10 <- %RDI
	.loc	1 165 2                 # GCD.c:165:2
	callq	parseStringToInt
.Ltmp36:
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_7 <- %RAX
	.loc	1 169 9                 # GCD.c:169:9
	testq	%rax, %rax
	je	.LBB2_21
.Ltmp37:
# BB#1:                                 # %if.end
	#DEBUG_VALUE: main:_7 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	.loc	1 171 6                 # GCD.c:171:6
	movq	(%rax), %r14
.Ltmp38:
	#DEBUG_VALUE: gcd_cached:n <- %R14
	#DEBUG_VALUE: main:_13_size <- 4
	#DEBUG_VALUE: main:n <- %R14
	.loc	1 175 2                 # GCD.c:175:2
	movl	$32, %edi
	callq	malloc
.Ltmp39:
	#DEBUG_VALUE: main:_13 <- %RAX
	.loc	1 176 9                 # GCD.c:176:9
	movaps	.LCPI2_0(%rip), %xmm0   # xmm0 = [78,32]
	movups	%xmm0, (%rax)
	.loc	1 176 35 is_stmt 0      # GCD.c:176:35
	movdqa	.LCPI2_1(%rip), %xmm0   # xmm0 = [61,32]
	movdqu	%xmm0, 16(%rax)
	.loc	1 178 2 is_stmt 1       # GCD.c:178:2
	movl	$4, %esi
	movq	%rax, %rdi
	callq	printf_s
.Ltmp40:
	.loc	1 188 2                 # GCD.c:188:2
	xorl	%ebx, %ebx
	.loc	1 182 2                 # GCD.c:182:2
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%r14, %rsi
	callq	printf
	#DEBUG_VALUE: main:_16 <- 0
	.loc	1 186 7                 # GCD.c:186:7
	movl	%r14d, %esi
	imull	%esi, %esi
	.loc	1 188 2                 # GCD.c:188:2
	xorl	%edi, %edi
	callq	gen1DArray
.Ltmp41:
	#DEBUG_VALUE: main:gcds <- %RAX
	#DEBUG_VALUE: main:_18 <- %RAX
	#DEBUG_VALUE: gcd_cached:gcds <- %RAX
	#DEBUG_VALUE: main:_20 <- 0
	#DEBUG_VALUE: main:_19 <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:sum <- 0
	.loc	1 202 6                 # GCD.c:202:6
	testq	%r14, %r14
	jle	.LBB2_20
.Ltmp42:
# BB#2:                                 # %while.cond16.preheader.us.preheader
	#DEBUG_VALUE: gcd_cached:gcds <- %RAX
	#DEBUG_VALUE: main:_18 <- %RAX
	#DEBUG_VALUE: main:gcds <- %RAX
	#DEBUG_VALUE: main:n <- %R14
	#DEBUG_VALUE: gcd_cached:n <- %R14
	.loc	1 74 6                  # GCD.c:74:6
	leaq	-4(%r14), %rcx
	shrq	$2, %rcx
	leaq	1(%rcx), %rdx
.Ltmp43:
	.loc	1 62 32                 # GCD.c:62:32
	movq	%r14, %r11
	andq	$-4, %r11
	movq	%rdx, 16(%rsp)          # 8-byte Spill
	andl	$1, %edx
.Ltmp44:
	.loc	1 74 6                  # GCD.c:74:6
	leaq	(,%r14,8), %r12
	movq	%rdx, (%rsp)            # 8-byte Spill
	decq	%rdx
	subq	%rcx, %rdx
	movq	%rdx, 8(%rsp)           # 8-byte Spill
	xorl	%r13d, %r13d
	movl	$1, %r15d
	movd	%r15, %xmm0
	pslldq	$8, %xmm0               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7]
	movdqa	.LCPI2_2(%rip), %xmm1   # xmm1 = [2,3]
	movq	%rax, %rcx
	xorl	%ebx, %ebx
	xorl	%r10d, %r10d
.Ltmp45:
	.p2align	4, 0x90
.LBB2_3:                                # %while.cond16.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_5 Depth 2
                                        #     Child Loop BB2_15 Depth 2
                                        #     Child Loop BB2_10 Depth 2
	#DEBUG_VALUE: gcd_cached:a <- %R10
	testq	%r10, %r10
.Ltmp46:
	.loc	1 74 5 is_stmt 0        # GCD.c:74:5
	je	.LBB2_8
.Ltmp47:
# BB#4:                                 # %if.end21.us142.preheader
                                        #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: gcd_cached:a <- %R10
	.loc	1 212 10 is_stmt 1      # GCD.c:212:10
	movq	%r10, %rdi
	negq	%rdi
	movq	%rcx, %rdx
	xorl	%ebp, %ebp
.Ltmp48:
	.p2align	4, 0x90
.LBB2_5:                                # %if.end21.us142
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: gcd_cached:_4 <- 0
	#DEBUG_VALUE: gcd_cached:_5 <- 0
	#DEBUG_VALUE: gcd_cached:_6 <- 0
	#DEBUG_VALUE: gcd_cached:_7 <- 0
	#DEBUG_VALUE: gcd_cached:_8 <- 0
	#DEBUG_VALUE: gcd_cached:_9 <- 0
	#DEBUG_VALUE: gcd_cached:_10 <- 0
	#DEBUG_VALUE: gcd_cached:_11 <- 0
	#DEBUG_VALUE: gcd_cached:b <- %RBP
	.loc	1 84 6                  # GCD.c:84:6
	testq	%rbp, %rbp
.Ltmp49:
	.loc	1 212 10                # GCD.c:212:10
	movq	%r10, %rsi
	je	.LBB2_7
.Ltmp50:
# BB#6:                                 # %blklab9.i.us147
                                        #   in Loop: Header=BB2_5 Depth=2
	#DEBUG_VALUE: gcd_cached:b <- %RBP
	.loc	1 92 6                  # GCD.c:92:6
	cmpq	%rbp, %r10
.Ltmp51:
	.loc	1 212 10                # GCD.c:212:10
	movq	%rdi, %rsi
	cmovgq	%r13, %rsi
.Ltmp52:
	.loc	1 92 5                  # GCD.c:92:5
	movl	$0, %r9d
	cmovgq	%rbp, %r9
	movq	%r10, %r8
	subq	%r9, %r8
	.loc	1 112 6                 # GCD.c:112:6
	imulq	%r14, %r8
	addq	%rsi, %r8
	addq	%rbp, %r8
	movq	(%rax,%r8,8), %rsi
.Ltmp53:
	#DEBUG_VALUE: gcd_cached:_11 <- %RSI
.LBB2_7:                                # %gcd_cached.exit.us156
                                        #   in Loop: Header=BB2_5 Depth=2
	#DEBUG_VALUE: gcd_cached:b <- %RBP
	#DEBUG_VALUE: main:_22 <- %RSI
	.loc	1 218 14                # GCD.c:218:14
	movq	%rsi, (%rdx)
	.loc	1 226 11                # GCD.c:226:11
	addq	%rsi, %rbx
.Ltmp54:
	#DEBUG_VALUE: main:_29 <- 1
	#DEBUG_VALUE: main:_28 <- %RBX
	#DEBUG_VALUE: main:sum <- %RBX
	.loc	1 232 9                 # GCD.c:232:9
	incq	%rbp
.Ltmp55:
	#DEBUG_VALUE: main:_30 <- %RBP
	#DEBUG_VALUE: main:j <- %RBP
	.loc	1 210 7                 # GCD.c:210:7
	addq	$8, %rdx
	cmpq	%rbp, %r14
	jne	.LBB2_5
	jmp	.LBB2_19
.Ltmp56:
	.p2align	4, 0x90
.LBB2_8:                                # %if.end21.us.us.preheader
                                        #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: gcd_cached:a <- %R10
	.loc	1 62 32                 # GCD.c:62:32
	cmpq	$3, %r14
	jbe	.LBB2_9
.Ltmp57:
# BB#11:                                # %min.iters.checked
                                        #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: gcd_cached:a <- %R10
	testq	%r11, %r11
	je	.LBB2_9
.Ltmp58:
# BB#12:                                # %vector.ph
                                        #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: gcd_cached:a <- %R10
	movq	(%rsp), %rdx            # 8-byte Reload
	cmpq	%rdx, 16(%rsp)          # 8-byte Folded Reload
	movd	%rbx, %xmm4
	pxor	%xmm2, %xmm2
	jne	.LBB2_14
.Ltmp59:
# BB#13:                                #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: gcd_cached:a <- %R10
	xorl	%ebx, %ebx
	movdqa	%xmm4, %xmm3
	jmp	.LBB2_16
.Ltmp60:
	.p2align	4, 0x90
.LBB2_9:                                #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: gcd_cached:a <- %R10
	xorl	%edx, %edx
	jmp	.LBB2_10
.Ltmp61:
.LBB2_14:                               # %vector.ph.new
                                        #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: gcd_cached:a <- %R10
	pxor	%xmm2, %xmm2
	.loc	1 232 9                 # GCD.c:232:9
	movq	8(%rsp), %rdi           # 8-byte Reload
	xorl	%ebx, %ebx
.Ltmp62:
	.p2align	4, 0x90
.LBB2_15:                               # %vector.body
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movd	%rbx, %xmm3
	pshufd	$68, %xmm3, %xmm5       # xmm5 = xmm3[0,1,0,1]
	movd	%r15, %xmm3
	pslldq	$8, %xmm3               # xmm3 = zero,zero,zero,zero,zero,zero,zero,zero,xmm3[0,1,2,3,4,5,6,7]
	movdqa	%xmm5, %xmm6
	paddq	%xmm3, %xmm6
	paddq	%xmm1, %xmm5
	.loc	1 218 14                # GCD.c:218:14
	movdqu	%xmm6, (%rcx,%rbx,8)
	movdqu	%xmm5, 16(%rcx,%rbx,8)
	.loc	1 226 11                # GCD.c:226:11
	paddq	%xmm4, %xmm6
	paddq	%xmm2, %xmm5
	leaq	4(%rbx), %rdx
	movd	%rdx, %xmm2
	pshufd	$68, %xmm2, %xmm2       # xmm2 = xmm2[0,1,0,1]
	paddq	%xmm2, %xmm3
	paddq	%xmm1, %xmm2
	.loc	1 218 14                # GCD.c:218:14
	movdqu	%xmm3, 32(%rcx,%rbx,8)
	movdqu	%xmm2, 48(%rcx,%rbx,8)
	.loc	1 226 11                # GCD.c:226:11
	paddq	%xmm6, %xmm3
	paddq	%xmm5, %xmm2
.Ltmp63:
	.loc	1 62 32                 # GCD.c:62:32
	addq	$8, %rbx
	addq	$2, %rdi
	movdqa	%xmm3, %xmm4
	jne	.LBB2_15
.Ltmp64:
.LBB2_16:                               # %middle.block.unr-lcssa
                                        #   in Loop: Header=BB2_3 Depth=1
	cmpq	$0, (%rsp)              # 8-byte Folded Reload
	je	.LBB2_18
# BB#17:                                # %middle.block.epilog-lcssa
                                        #   in Loop: Header=BB2_3 Depth=1
	.loc	1 214 9                 # GCD.c:214:9
	movq	%r10, %rdx
	imulq	%r14, %rdx
.Ltmp65:
	#DEBUG_VALUE: main:_25 <- %RDX
	#DEBUG_VALUE: main:_23 <- %RDX
	movd	%rbx, %xmm4
	pshufd	$68, %xmm4, %xmm4       # xmm4 = xmm4[0,1,0,1]
	movdqa	%xmm4, %xmm5
	paddq	%xmm0, %xmm5
	paddq	%xmm1, %xmm4
	.loc	1 218 4                 # GCD.c:218:4
	addq	%rbx, %rdx
.Ltmp66:
	.loc	1 218 14 is_stmt 0      # GCD.c:218:14
	movdqu	%xmm5, (%rax,%rdx,8)
	movdqu	%xmm4, 16(%rax,%rdx,8)
	.loc	1 226 11 is_stmt 1      # GCD.c:226:11
	paddq	%xmm4, %xmm2
	paddq	%xmm5, %xmm3
.LBB2_18:                               # %middle.block
                                        #   in Loop: Header=BB2_3 Depth=1
	cmpq	%r11, %r14
	paddq	%xmm3, %xmm2
	pshufd	$78, %xmm2, %xmm3       # xmm3 = xmm2[2,3,0,1]
	paddq	%xmm2, %xmm3
	movd	%xmm3, %rbx
	movq	%r11, %rdx
	je	.LBB2_19
	.p2align	4, 0x90
.LBB2_10:                               # %if.end21.us.us
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp67:
	#DEBUG_VALUE: main:_22 <- %RDX
	#DEBUG_VALUE: gcd_cached:_4 <- 0
	#DEBUG_VALUE: gcd_cached:_5 <- 0
	#DEBUG_VALUE: gcd_cached:_6 <- 0
	#DEBUG_VALUE: gcd_cached:_7 <- 0
	#DEBUG_VALUE: gcd_cached:_8 <- 0
	#DEBUG_VALUE: gcd_cached:_9 <- 0
	#DEBUG_VALUE: gcd_cached:_10 <- 0
	#DEBUG_VALUE: gcd_cached:_11 <- 0
	.loc	1 218 14                # GCD.c:218:14
	movq	%rdx, (%rcx,%rdx,8)
	.loc	1 226 11                # GCD.c:226:11
	addq	%rdx, %rbx
	#DEBUG_VALUE: main:_29 <- 1
.Ltmp68:
	#DEBUG_VALUE: main:_28 <- %RBX
	#DEBUG_VALUE: main:sum <- %RBX
	.loc	1 232 9                 # GCD.c:232:9
	incq	%rdx
.Ltmp69:
	#DEBUG_VALUE: main:_30 <- %RDX
	#DEBUG_VALUE: main:j <- %RDX
	.loc	1 210 7                 # GCD.c:210:7
	cmpq	%rdx, %r14
	jne	.LBB2_10
.Ltmp70:
.LBB2_19:                               # %blklab16.loopexit.us
                                        #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: main:_31 <- 1
	.loc	1 243 8                 # GCD.c:243:8
	incq	%r10
.Ltmp71:
	#DEBUG_VALUE: main:_32 <- %R10
	#DEBUG_VALUE: main:i <- %R10
	.loc	1 202 6                 # GCD.c:202:6
	addq	%r12, %rcx
	cmpq	%r14, %r10
	jne	.LBB2_3
.Ltmp72:
.LBB2_20:                               # %blklab14
	#DEBUG_VALUE: main:_35_size <- 5
	.loc	1 254 2                 # GCD.c:254:2
	movl	$40, %edi
	callq	malloc
.Ltmp73:
	#DEBUG_VALUE: main:_35 <- %RAX
	.loc	1 255 9                 # GCD.c:255:9
	movaps	.LCPI2_3(%rip), %xmm0   # xmm0 = [83,117]
	movups	%xmm0, (%rax)
	.loc	1 255 36 is_stmt 0      # GCD.c:255:36
	movaps	.LCPI2_4(%rip), %xmm0   # xmm0 = [109,58]
	movups	%xmm0, 16(%rax)
	.loc	1 255 63                # GCD.c:255:63
	movq	$32, 32(%rax)
	.loc	1 257 2 is_stmt 1       # GCD.c:257:2
	movl	$5, %esi
	movq	%rax, %rdi
	callq	printf_s
.Ltmp74:
	.loc	1 261 2                 # GCD.c:261:2
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	printf
.Ltmp75:
	#DEBUG_VALUE: main:_40_size <- 32
	.loc	1 265 2                 # GCD.c:265:2
	movl	$256, %edi              # imm = 0x100
	callq	malloc
.Ltmp76:
	#DEBUG_VALUE: main:_40 <- %RAX
	.loc	1 266 9                 # GCD.c:266:9
	movaps	.LCPI2_5(%rip), %xmm0   # xmm0 = [80,97]
	movups	%xmm0, (%rax)
	.loc	1 266 35 is_stmt 0      # GCD.c:266:35
	movaps	.LCPI2_6(%rip), %xmm0   # xmm0 = [115,115]
	movups	%xmm0, 16(%rax)
	.loc	1 266 63                # GCD.c:266:63
	movaps	.LCPI2_7(%rip), %xmm0   # xmm0 = [32,99]
	movups	%xmm0, 32(%rax)
	.loc	1 266 89                # GCD.c:266:89
	movaps	.LCPI2_8(%rip), %xmm0   # xmm0 = [97,99]
	movups	%xmm0, 48(%rax)
	.loc	1 266 115               # GCD.c:266:115
	movaps	.LCPI2_9(%rip), %xmm0   # xmm0 = [104,101]
	movups	%xmm0, 64(%rax)
	.loc	1 266 144               # GCD.c:266:144
	movaps	.LCPI2_10(%rip), %xmm0  # xmm0 = [100,32]
	movups	%xmm0, 80(%rax)
	.loc	1 266 173               # GCD.c:266:173
	movaps	.LCPI2_11(%rip), %xmm0  # xmm0 = [69,117]
	movups	%xmm0, 96(%rax)
	.loc	1 266 202               # GCD.c:266:202
	movaps	.LCPI2_12(%rip), %xmm0  # xmm0 = [99,108]
	movups	%xmm0, 112(%rax)
	.loc	1 266 231               # GCD.c:266:231
	movaps	.LCPI2_13(%rip), %xmm0  # xmm0 = [105,100]
	movups	%xmm0, 128(%rax)
	.loc	1 266 261               # GCD.c:266:261
	movaps	.LCPI2_14(%rip), %xmm0  # xmm0 = [32,71]
	movups	%xmm0, 144(%rax)
	.loc	1 266 289               # GCD.c:266:289
	movaps	.LCPI2_15(%rip), %xmm0  # xmm0 = [67,68]
	movups	%xmm0, 160(%rax)
	.loc	1 266 317               # GCD.c:266:317
	movaps	.LCPI2_16(%rip), %xmm0  # xmm0 = [32,116]
	movups	%xmm0, 176(%rax)
	.loc	1 266 346               # GCD.c:266:346
	movaps	.LCPI2_17(%rip), %xmm0  # xmm0 = [101,115]
	movups	%xmm0, 192(%rax)
	.loc	1 266 376               # GCD.c:266:376
	movaps	.LCPI2_18(%rip), %xmm0  # xmm0 = [116,32]
	movups	%xmm0, 208(%rax)
	.loc	1 266 405               # GCD.c:266:405
	movaps	.LCPI2_19(%rip), %xmm0  # xmm0 = [99,97]
	movups	%xmm0, 224(%rax)
	.loc	1 266 433               # GCD.c:266:433
	movaps	.LCPI2_20(%rip), %xmm0  # xmm0 = [115,101]
	movups	%xmm0, 240(%rax)
	.loc	1 268 2 is_stmt 1       # GCD.c:268:2
	movl	$32, %esi
	movq	%rax, %rdi
	callq	println_s
.Ltmp77:
.LBB2_21:                               # %blklab13
	.loc	1 272 2                 # GCD.c:272:2
	xorl	%edi, %edi
	callq	exit
.Ltmp78:
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
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git 2af14cc4a90f43170f8ea9c1dfa0f71f46a0621c) (http://llvm.org/git/llvm.git 1e7e2b2b556977af8ccc12b7afba61302f3a2da9)" # string offset=0
.Linfo_string1:
	.asciz	"GCD.c"                 # string offset=165
.Linfo_string2:
	.asciz	"/home/mw169/workspace/WhileyOpenCL/polly/GCD/impl/autogenerate_cached_copyonly" # string offset=171
.Linfo_string3:
	.asciz	"gcd_cached"            # string offset=250
.Linfo_string4:
	.asciz	"long long int"         # string offset=261
.Linfo_string5:
	.asciz	"a"                     # string offset=275
.Linfo_string6:
	.asciz	"b"                     # string offset=277
.Linfo_string7:
	.asciz	"n"                     # string offset=279
.Linfo_string8:
	.asciz	"gcds"                  # string offset=281
.Linfo_string9:
	.asciz	"gcds_size"             # string offset=286
.Linfo_string10:
	.asciz	"_4"                    # string offset=296
.Linfo_string11:
	.asciz	"_5"                    # string offset=299
.Linfo_string12:
	.asciz	"_6"                    # string offset=302
.Linfo_string13:
	.asciz	"_7"                    # string offset=305
.Linfo_string14:
	.asciz	"_8"                    # string offset=308
.Linfo_string15:
	.asciz	"_9"                    # string offset=311
.Linfo_string16:
	.asciz	"_10"                   # string offset=314
.Linfo_string17:
	.asciz	"_11"                   # string offset=318
.Linfo_string18:
	.asciz	"gcd"                   # string offset=322
.Linfo_string19:
	.asciz	"main"                  # string offset=326
.Linfo_string20:
	.asciz	"int"                   # string offset=331
.Linfo_string21:
	.asciz	"_2"                    # string offset=335
.Linfo_string22:
	.asciz	"_3"                    # string offset=338
.Linfo_string23:
	.asciz	"argc"                  # string offset=341
.Linfo_string24:
	.asciz	"args"                  # string offset=346
.Linfo_string25:
	.asciz	"char"                  # string offset=351
.Linfo_string26:
	.asciz	"sum"                   # string offset=356
.Linfo_string27:
	.asciz	"i"                     # string offset=360
.Linfo_string28:
	.asciz	"j"                     # string offset=362
.Linfo_string29:
	.asciz	"_8_size"               # string offset=364
.Linfo_string30:
	.asciz	"_8_size_size"          # string offset=372
.Linfo_string31:
	.asciz	"_10_size"              # string offset=385
.Linfo_string32:
	.asciz	"_13_size"              # string offset=394
.Linfo_string33:
	.asciz	"_16"                   # string offset=403
.Linfo_string34:
	.asciz	"_17"                   # string offset=407
.Linfo_string35:
	.asciz	"_18_size"              # string offset=411
.Linfo_string36:
	.asciz	"_19"                   # string offset=420
.Linfo_string37:
	.asciz	"_20"                   # string offset=424
.Linfo_string38:
	.asciz	"_21"                   # string offset=428
.Linfo_string39:
	.asciz	"_22"                   # string offset=432
.Linfo_string40:
	.asciz	"_23"                   # string offset=436
.Linfo_string41:
	.asciz	"_24"                   # string offset=440
.Linfo_string42:
	.asciz	"_25"                   # string offset=444
.Linfo_string43:
	.asciz	"_26"                   # string offset=448
.Linfo_string44:
	.asciz	"_27"                   # string offset=452
.Linfo_string45:
	.asciz	"_28"                   # string offset=456
.Linfo_string46:
	.asciz	"_29"                   # string offset=460
.Linfo_string47:
	.asciz	"_30"                   # string offset=464
.Linfo_string48:
	.asciz	"_31"                   # string offset=468
.Linfo_string49:
	.asciz	"_32"                   # string offset=472
.Linfo_string50:
	.asciz	"_35_size"              # string offset=476
.Linfo_string51:
	.asciz	"_40_size"              # string offset=485
.Linfo_string52:
	.asciz	"max"                   # string offset=494
.Linfo_string53:
	.asciz	"_13"                   # string offset=498
.Linfo_string54:
	.asciz	"_18"                   # string offset=502
.Linfo_string55:
	.asciz	"_35"                   # string offset=506
.Linfo_string56:
	.asciz	"_40"                   # string offset=510
.Linfo_string57:
	.asciz	"_14"                   # string offset=514
.Linfo_string58:
	.asciz	"_33"                   # string offset=518
.Linfo_string59:
	.asciz	"_36"                   # string offset=522
.Linfo_string60:
	.asciz	"_38"                   # string offset=526
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
	.quad	.Ltmp13-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp17-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp16-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp17-.Lfunc_begin0
	.quad	.Ltmp18-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp11-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	.Ltmp17-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp16-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp16-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp16-.Lfunc_begin0
	.quad	.Ltmp16-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp34-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp34-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Ltmp33-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp33-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp33-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp71-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	90                      # DW_OP_reg10
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp33-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp33-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	4                       # 4
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp33-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp67-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp33-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp65-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp33-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp65-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Ltmp33-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp33-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Ltmp33-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Ltmp33-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Ltmp33-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp71-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	90                      # DW_OP_reg10
	.quad	0
	.quad	0
.Ldebug_loc23:
	.quad	.Ltmp33-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp72-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	5                       # 5
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp33-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	32                      # 32
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp35-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Ltmp36-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Ltmp36-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc33:
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc34:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	90                      # DW_OP_reg10
	.quad	.Ltmp56-.Lfunc_begin0
	.quad	.Ltmp62-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	90                      # DW_OP_reg10
	.quad	0
	.quad	0
.Ldebug_loc35:
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp67-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc36:
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc37:
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc38:
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
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
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
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
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
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
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	1225                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x4c2 DW_TAG_compile_unit
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
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	449                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	4                       # Abbrev [4] 0x44:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x53:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x62:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x6e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x7a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x86:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x92:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x9e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	6                       # Abbrev [6] 0xab:0x7a DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	293                     # DW_AT_abstract_origin
	.long	293                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0xc2:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	305                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0xcb:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc3            # DW_AT_location
	.long	316                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0xd4:0x7 DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	81
	.long	327                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0xdb:0x7 DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	82
	.long	338                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0xe2:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc4            # DW_AT_location
	.long	349                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0xeb:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	360                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0xf1:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	371                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0xf7:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	382                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0xfd:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	393                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x103:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	404                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x109:0x9 DW_TAG_variable
	.long	.Ldebug_loc5            # DW_AT_location
	.long	415                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x112:0x9 DW_TAG_variable
	.long	.Ldebug_loc6            # DW_AT_location
	.long	426                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x11b:0x9 DW_TAG_variable
	.long	.Ldebug_loc7            # DW_AT_location
	.long	437                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	11                      # Abbrev [11] 0x125:0x9c DW_TAG_subprogram
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	449                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	12                      # Abbrev [12] 0x131:0xb DW_TAG_formal_parameter
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x13c:0xb DW_TAG_formal_parameter
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x147:0xb DW_TAG_formal_parameter
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x152:0xb DW_TAG_formal_parameter
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	456                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x15d:0xb DW_TAG_formal_parameter
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x168:0xb DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x173:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x17e:0xb DW_TAG_variable
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	65                      # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x189:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	66                      # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x194:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	67                      # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x19f:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	68                      # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x1aa:0xb DW_TAG_variable
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	69                      # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x1b5:0xb DW_TAG_variable
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	14                      # Abbrev [14] 0x1c1:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	15                      # Abbrev [15] 0x1c8:0x5 DW_TAG_pointer_type
	.long	449                     # DW_AT_type
	.byte	3                       # Abbrev [3] 0x1cd:0x2e2 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	122                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	1199                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	4                       # Abbrev [4] 0x1e6:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc8            # DW_AT_location
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	122                     # DW_AT_decl_line
	.long	1199                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x1f5:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc9            # DW_AT_location
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	122                     # DW_AT_decl_line
	.long	1206                    # DW_AT_type
	.byte	16                      # Abbrev [16] 0x204:0xf DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	124                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x213:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	125                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x21f:0xf DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	126                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x22e:0xf DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	127                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x23d:0xf DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	128                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x24c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	130                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x258:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	130                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x264:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	131                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x270:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	132                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x27c:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	134                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x28b:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	136                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x297:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	137                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2a3:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	138                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2af:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	139                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2bb:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	140                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2c7:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	141                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x2d3:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	142                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x2e2:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	143                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2f1:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	144                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x2fd:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	145                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x30c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	146                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x318:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	147                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x324:0xf DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	148                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x333:0xf DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	149                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x342:0xf DW_TAG_variable
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	150                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x351:0xf DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	151                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x360:0xf DW_TAG_variable
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	152                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x36f:0xf DW_TAG_variable
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	154                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x37e:0xf DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	157                     # DW_AT_decl_line
	.long	449                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x38d:0xf DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	130                     # DW_AT_decl_line
	.long	1223                    # DW_AT_type
	.byte	16                      # Abbrev [16] 0x39c:0xf DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	132                     # DW_AT_decl_line
	.long	456                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x3ab:0xf DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	123                     # DW_AT_decl_line
	.long	456                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x3ba:0xf DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	129                     # DW_AT_decl_line
	.long	456                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x3c9:0xf DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	134                     # DW_AT_decl_line
	.long	456                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x3d8:0xf DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	125                     # DW_AT_decl_line
	.long	456                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x3e7:0xf DW_TAG_variable
	.long	.Ldebug_loc32           # DW_AT_location
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	138                     # DW_AT_decl_line
	.long	456                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x3f6:0xf DW_TAG_variable
	.long	.Ldebug_loc37           # DW_AT_location
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	154                     # DW_AT_decl_line
	.long	456                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x405:0xf DW_TAG_variable
	.long	.Ldebug_loc38           # DW_AT_location
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	157                     # DW_AT_decl_line
	.long	456                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x414:0xb DW_TAG_variable
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	133                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	13                      # Abbrev [13] 0x41f:0xb DW_TAG_variable
	.long	.Linfo_string57         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	135                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	13                      # Abbrev [13] 0x42a:0xb DW_TAG_variable
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	153                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	13                      # Abbrev [13] 0x435:0xb DW_TAG_variable
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	155                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	13                      # Abbrev [13] 0x440:0xb DW_TAG_variable
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	156                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	17                      # Abbrev [17] 0x44b:0x63 DW_TAG_inlined_subroutine
	.long	293                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	212                     # DW_AT_call_line
	.byte	7                       # Abbrev [7] 0x456:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc34           # DW_AT_location
	.long	305                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x45f:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc36           # DW_AT_location
	.long	316                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x468:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc29           # DW_AT_location
	.long	327                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x471:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc33           # DW_AT_location
	.long	338                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x47a:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	360                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x480:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	371                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x486:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	382                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x48c:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	393                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x492:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	404                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x498:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	415                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x49e:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	426                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0x4a4:0x9 DW_TAG_variable
	.long	.Ldebug_loc35           # DW_AT_location
	.long	437                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	14                      # Abbrev [14] 0x4af:0x7 DW_TAG_base_type
	.long	.Linfo_string20         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	15                      # Abbrev [15] 0x4b6:0x5 DW_TAG_pointer_type
	.long	1211                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0x4bb:0x5 DW_TAG_pointer_type
	.long	1216                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x4c0:0x7 DW_TAG_base_type
	.long	.Linfo_string25         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	15                      # Abbrev [15] 0x4c7:0x5 DW_TAG_pointer_type
	.long	456                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Ltmp64-.Lfunc_begin0
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
	.long	1229                    # Compilation Unit Length
	.long	293                     # DIE offset
	.asciz	"gcd_cached"            # External Name
	.long	461                     # DIE offset
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
	.long	1229                    # Compilation Unit Length
	.long	449                     # DIE offset
	.asciz	"long long int"         # External Name
	.long	1199                    # DIE offset
	.asciz	"int"                   # External Name
	.long	1216                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git 2af14cc4a90f43170f8ea9c1dfa0f71f46a0621c) (http://llvm.org/git/llvm.git 1e7e2b2b556977af8ccc12b7afba61302f3a2da9)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
