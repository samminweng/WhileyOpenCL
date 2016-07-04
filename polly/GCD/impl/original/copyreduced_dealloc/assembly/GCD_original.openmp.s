	.text
	.file	"llvm/GCD_original.openmp.ll"
	.globl	gcd
	.p2align	4, 0x90
	.type	gcd,@function
gcd:                                    # @gcd
.Lfunc_begin0:
	.file	1 "GCD_original.c"
	.loc	1 2 0                   # GCD_original.c:2:0
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
	.loc	1 12 6 prologue_end     # GCD_original.c:12:6
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
	.loc	1 35 7                  # GCD_original.c:35:7
	testq	%rsi, %rsi
	je	.LBB0_8
.Ltmp2:
	.p2align	4, 0x90
.LBB0_4:                                # %blklab4
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: gcd:_5 <- 0
	.loc	1 37 6                  # GCD_original.c:37:6
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
	.loc	1 47 7                  # GCD_original.c:47:7
	subq	%rdi, %rsi
.Ltmp6:
	#DEBUG_VALUE: gcd:_7 <- %RSI
	#DEBUG_VALUE: gcd:_4 <- 0
	#DEBUG_VALUE: gcd:b <- %RSI
	jne	.LBB0_4
.Ltmp7:
.LBB0_8:                                # %cleanup
	#DEBUG_VALUE: gcd:b <- %RSI
	.loc	1 60 1                  # GCD_original.c:60:1
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
	.loc	1 26 12                 # GCD_original.c:26:12
	pushq	%rax
.Ltmp11:
	.cfi_def_cfa_offset 16
	movq	stderr(%rip), %rcx
	.loc	1 26 4 is_stmt 0        # GCD_original.c:26:4
	movl	$.L.str, %edi
.Ltmp12:
	movl	$4, %esi
	movl	$1, %edx
	callq	fwrite
	.loc	1 27 4 is_stmt 1        # GCD_original.c:27:4
	movl	$-1, %edi
	callq	exit
.Ltmp13:
.Lfunc_end0:
	.size	gcd, .Lfunc_end0-gcd
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI1_0:
	.quad	78                      # 0x4e
	.quad	32                      # 0x20
.LCPI1_1:
	.quad	61                      # 0x3d
	.quad	32                      # 0x20
.LCPI1_2:
	.quad	83                      # 0x53
	.quad	117                     # 0x75
.LCPI1_3:
	.quad	109                     # 0x6d
	.quad	58                      # 0x3a
.LCPI1_4:
	.quad	80                      # 0x50
	.quad	97                      # 0x61
.LCPI1_5:
	.quad	115                     # 0x73
	.quad	115                     # 0x73
.LCPI1_6:
	.quad	32                      # 0x20
	.quad	69                      # 0x45
.LCPI1_7:
	.quad	117                     # 0x75
	.quad	99                      # 0x63
.LCPI1_8:
	.quad	108                     # 0x6c
	.quad	105                     # 0x69
.LCPI1_9:
	.quad	100                     # 0x64
	.quad	32                      # 0x20
.LCPI1_10:
	.quad	71                      # 0x47
	.quad	67                      # 0x43
.LCPI1_11:
	.quad	68                      # 0x44
	.quad	32                      # 0x20
.LCPI1_12:
	.quad	116                     # 0x74
	.quad	101                     # 0x65
.LCPI1_13:
	.quad	115                     # 0x73
	.quad	116                     # 0x74
.LCPI1_14:
	.quad	32                      # 0x20
	.quad	99                      # 0x63
.LCPI1_15:
	.quad	97                      # 0x61
	.quad	115                     # 0x73
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin1:
	.loc	1 62 0                  # GCD_original.c:62:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 97 2 prologue_end     # GCD_original.c:97:2
	pushq	%r15
.Ltmp14:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp15:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp16:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp17:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp18:
	.cfi_def_cfa_offset 48
.Ltmp19:
	.cfi_offset %rbx, -40
.Ltmp20:
	.cfi_offset %r12, -32
.Ltmp21:
	.cfi_offset %r14, -24
.Ltmp22:
	.cfi_offset %r15, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
.Ltmp23:
	#DEBUG_VALUE: main:max_dealloc <- 0
	#DEBUG_VALUE: main:n <- 0
	#DEBUG_VALUE: main:sum <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_6_dealloc <- 0
	#DEBUG_VALUE: main:_7_size <- 0
	#DEBUG_VALUE: main:_7_size_size <- 0
	#DEBUG_VALUE: main:_7_dealloc <- 0
	#DEBUG_VALUE: main:_8 <- 0
	#DEBUG_VALUE: main:_9_size <- 0
	#DEBUG_VALUE: main:_9_dealloc <- 0
	#DEBUG_VALUE: main:_12_size <- 0
	#DEBUG_VALUE: main:_12_dealloc <- 0
	#DEBUG_VALUE: main:_15 <- 0
	#DEBUG_VALUE: main:_16 <- 0
	#DEBUG_VALUE: main:_17 <- 0
	#DEBUG_VALUE: main:_18 <- 0
	#DEBUG_VALUE: main:_19 <- 0
	#DEBUG_VALUE: main:_20 <- 0
	#DEBUG_VALUE: main:_21 <- 0
	#DEBUG_VALUE: main:_22 <- 0
	#DEBUG_VALUE: main:_23 <- 0
	#DEBUG_VALUE: main:_26_size <- 0
	#DEBUG_VALUE: main:_26_dealloc <- 0
	#DEBUG_VALUE: main:_31_size <- 0
	#DEBUG_VALUE: main:_31_dealloc <- 0
	callq	convertArgsToIntArray
.Ltmp24:
	#DEBUG_VALUE: main:_7 <- %RAX
	.loc	1 101 5                 # GCD_original.c:101:5
	movq	(%rax), %rdi
.Ltmp25:
	#DEBUG_VALUE: main:_9 <- %RDI
	.loc	1 104 2                 # GCD_original.c:104:2
	callq	parseStringToInt
.Ltmp26:
	movq	%rax, %r14
.Ltmp27:
	#DEBUG_VALUE: main:max <- %R14
	#DEBUG_VALUE: main:_6 <- %R14
	#DEBUG_VALUE: main:max_dealloc <- 1
	.loc	1 112 9                 # GCD_original.c:112:9
	testq	%r14, %r14
	je	.LBB1_12
.Ltmp28:
# BB#1:                                 # %if.end5
	#DEBUG_VALUE: main:_6 <- %R14
	#DEBUG_VALUE: main:max <- %R14
	.loc	1 114 6                 # GCD_original.c:114:6
	movq	(%r14), %r12
.Ltmp29:
	#DEBUG_VALUE: main:_12_size <- 4
	#DEBUG_VALUE: main:n <- %R12
	.loc	1 127 2                 # GCD_original.c:127:2
	xorl	%ebx, %ebx
	.loc	1 119 2                 # GCD_original.c:119:2
	xorl	%edi, %edi
	movl	$4, %esi
	callq	create1DArray
	movq	%rax, %r15
.Ltmp30:
	#DEBUG_VALUE: main:_12 <- %R15
	.loc	1 120 9                 # GCD_original.c:120:9
	movaps	.LCPI1_0(%rip), %xmm0   # xmm0 = [78,32]
	movups	%xmm0, (%r15)
	.loc	1 120 35 is_stmt 0      # GCD_original.c:120:35
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [61,32]
	movups	%xmm0, 16(%r15)
.Ltmp31:
	#DEBUG_VALUE: main:_12_dealloc <- 1
	.loc	1 123 2 is_stmt 1       # GCD_original.c:123:2
	movl	$4, %esi
	movq	%r15, %rdi
	callq	printf_s
	.loc	1 127 2                 # GCD_original.c:127:2
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%r12, %rsi
	callq	printf
	#DEBUG_VALUE: main:_16 <- 0
	#DEBUG_VALUE: main:_15 <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:sum <- 0
.Ltmp32:
	.loc	1 139 6                 # GCD_original.c:139:6
	testq	%r12, %r12
	jle	.LBB1_11
.Ltmp33:
# BB#2:                                 # %while.cond20.preheader.us.preheader
	#DEBUG_VALUE: main:_12 <- %R15
	#DEBUG_VALUE: main:n <- %R12
	#DEBUG_VALUE: main:_6 <- %R14
	#DEBUG_VALUE: main:max <- %R14
	.loc	1 12 6                  # GCD_original.c:12:6
	leaq	-1(%r12), %rax
	leaq	-2(%r12), %rcx
	mulq	%rcx
	shldq	$63, %rax, %rdx
.Ltmp34:
	.loc	1 2 25                  # GCD_original.c:2:25
	leaq	-1(%r12,%rdx), %r8
	xorl	%ebx, %ebx
	xorl	%ecx, %ecx
.Ltmp35:
	.p2align	4, 0x90
.LBB1_3:                                # %while.cond20.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_5 Depth 2
                                        #       Child Loop BB1_7 Depth 3
	#DEBUG_VALUE: gcd:a <- %RCX
	.loc	1 12 6                  # GCD_original.c:12:6
	testq	%rcx, %rcx
.Ltmp36:
	.loc	1 12 5 is_stmt 0        # GCD_original.c:12:5
	je	.LBB1_13
.Ltmp37:
# BB#4:                                 # %if.end25.us174.preheader
                                        #   in Loop: Header=BB1_3 Depth=1
	#DEBUG_VALUE: gcd:a <- %RCX
	xorl	%edx, %edx
.Ltmp38:
	.p2align	4, 0x90
.LBB1_5:                                # %if.end25.us174
                                        #   Parent Loop BB1_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_7 Depth 3
	#DEBUG_VALUE: gcd:_2 <- 0
	#DEBUG_VALUE: gcd:_3 <- 0
	#DEBUG_VALUE: gcd:_4 <- 0
	#DEBUG_VALUE: gcd:_5 <- 0
	#DEBUG_VALUE: gcd:_6 <- 0
	#DEBUG_VALUE: gcd:_7 <- 0
	#DEBUG_VALUE: gcd:b <- %RDX
	.loc	1 35 7 is_stmt 1        # GCD_original.c:35:7
	testq	%rdx, %rdx
	movq	%rdx, %rdi
	movq	%rcx, %rax
	je	.LBB1_9
.Ltmp39:
	.p2align	4, 0x90
.LBB1_7:                                # %blklab4.i.us178
                                        #   Parent Loop BB1_3 Depth=1
                                        #     Parent Loop BB1_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	#DEBUG_VALUE: gcd:_5 <- 0
	.loc	1 37 7                  # GCD_original.c:37:7
	movq	%rax, %rsi
	subq	%rdi, %rsi
	jle	.LBB1_8
.Ltmp40:
# BB#6:                                 # %if.end9.i.us185
                                        #   in Loop: Header=BB1_7 Depth=3
	#DEBUG_VALUE: gcd:a <- %RSI
	#DEBUG_VALUE: gcd:_4 <- 0
	#DEBUG_VALUE: gcd:_6 <- %RSI
	.loc	1 149 10                # GCD_original.c:149:10
	movq	%rsi, %rax
.Ltmp41:
	#DEBUG_VALUE: gcd:_6 <- %RAX
	#DEBUG_VALUE: gcd:a <- %RAX
	jns	.LBB1_7
	jmp	.LBB1_14
.Ltmp42:
.LBB1_8:                                # %blklab5.i.us181
                                        #   in Loop: Header=BB1_7 Depth=3
	.loc	1 47 7                  # GCD_original.c:47:7
	subq	%rax, %rdi
.Ltmp43:
	#DEBUG_VALUE: gcd:b <- %RDI
	#DEBUG_VALUE: gcd:_7 <- %RDI
	#DEBUG_VALUE: gcd:_4 <- 0
	jne	.LBB1_7
.Ltmp44:
.LBB1_9:                                # %gcd.exit.loopexit.us198
                                        #   in Loop: Header=BB1_5 Depth=2
	#DEBUG_VALUE: main:_18 <- %RBX
	.loc	1 151 11                # GCD_original.c:151:11
	addq	%rax, %rbx
.Ltmp45:
	#DEBUG_VALUE: main:_20 <- 1
	#DEBUG_VALUE: main:_19 <- %RBX
	#DEBUG_VALUE: main:sum <- %RBX
	.loc	1 157 9                 # GCD_original.c:157:9
	incq	%rdx
.Ltmp46:
	#DEBUG_VALUE: main:_21 <- %RDX
	#DEBUG_VALUE: main:j <- %RDX
	.loc	1 147 7                 # GCD_original.c:147:7
	cmpq	%r12, %rdx
	jne	.LBB1_5
	jmp	.LBB1_10
.Ltmp47:
	.p2align	4, 0x90
.LBB1_13:                               # %if.end25.us.us.us.preheader
                                        #   in Loop: Header=BB1_3 Depth=1
	#DEBUG_VALUE: gcd:a <- %RCX
	.loc	1 2 25                  # GCD_original.c:2:25
	addq	%r8, %rbx
.Ltmp48:
.LBB1_10:                               # %blklab10.loopexit.us
                                        #   in Loop: Header=BB1_3 Depth=1
	#DEBUG_VALUE: main:_22 <- 1
	.loc	1 168 8                 # GCD_original.c:168:8
	incq	%rcx
.Ltmp49:
	#DEBUG_VALUE: main:_23 <- %RCX
	#DEBUG_VALUE: main:i <- %RCX
	.loc	1 139 6                 # GCD_original.c:139:6
	cmpq	%r12, %rcx
	jne	.LBB1_3
.Ltmp50:
.LBB1_11:                               # %if.then83
	#DEBUG_VALUE: main:_26_size <- 5
	.loc	1 180 2                 # GCD_original.c:180:2
	xorl	%edi, %edi
	movl	$5, %esi
	callq	create1DArray
	movq	%rax, %r12
.Ltmp51:
	#DEBUG_VALUE: main:_26 <- %R12
	.loc	1 181 9                 # GCD_original.c:181:9
	movaps	.LCPI1_2(%rip), %xmm0   # xmm0 = [83,117]
	movups	%xmm0, (%r12)
	.loc	1 181 36 is_stmt 0      # GCD_original.c:181:36
	movaps	.LCPI1_3(%rip), %xmm0   # xmm0 = [109,58]
	movups	%xmm0, 16(%r12)
	.loc	1 181 63                # GCD_original.c:181:63
	movq	$32, 32(%r12)
.Ltmp52:
	#DEBUG_VALUE: main:_26_dealloc <- 1
	.loc	1 184 2 is_stmt 1       # GCD_original.c:184:2
	movl	$5, %esi
	movq	%r12, %rdi
	callq	printf_s
	.loc	1 188 2                 # GCD_original.c:188:2
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	printf
.Ltmp53:
	#DEBUG_VALUE: main:_31_size <- 25
	.loc	1 193 2                 # GCD_original.c:193:2
	xorl	%edi, %edi
	movl	$25, %esi
	callq	create1DArray
	movq	%rax, %rbx
.Ltmp54:
	#DEBUG_VALUE: main:_31 <- %RBX
	.loc	1 194 9                 # GCD_original.c:194:9
	movaps	.LCPI1_4(%rip), %xmm0   # xmm0 = [80,97]
	movups	%xmm0, (%rbx)
	.loc	1 194 35 is_stmt 0      # GCD_original.c:194:35
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [115,115]
	movups	%xmm0, 16(%rbx)
	.loc	1 194 63                # GCD_original.c:194:63
	movaps	.LCPI1_6(%rip), %xmm0   # xmm0 = [32,69]
	movups	%xmm0, 32(%rbx)
	.loc	1 194 89                # GCD_original.c:194:89
	movaps	.LCPI1_7(%rip), %xmm0   # xmm0 = [117,99]
	movups	%xmm0, 48(%rbx)
	.loc	1 194 116               # GCD_original.c:194:116
	movaps	.LCPI1_8(%rip), %xmm0   # xmm0 = [108,105]
	movups	%xmm0, 64(%rbx)
	.loc	1 194 145               # GCD_original.c:194:145
	movaps	.LCPI1_9(%rip), %xmm0   # xmm0 = [100,32]
	movups	%xmm0, 80(%rbx)
	.loc	1 194 174               # GCD_original.c:194:174
	movaps	.LCPI1_10(%rip), %xmm0  # xmm0 = [71,67]
	movups	%xmm0, 96(%rbx)
	.loc	1 194 202               # GCD_original.c:194:202
	movaps	.LCPI1_11(%rip), %xmm0  # xmm0 = [68,32]
	movups	%xmm0, 112(%rbx)
	.loc	1 194 230               # GCD_original.c:194:230
	movaps	.LCPI1_12(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 128(%rbx)
	.loc	1 194 260               # GCD_original.c:194:260
	movaps	.LCPI1_13(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 144(%rbx)
	.loc	1 194 290               # GCD_original.c:194:290
	movaps	.LCPI1_14(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 160(%rbx)
	.loc	1 194 318               # GCD_original.c:194:318
	movaps	.LCPI1_15(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 176(%rbx)
	.loc	1 194 347               # GCD_original.c:194:347
	movq	$101, 192(%rbx)
.Ltmp55:
	#DEBUG_VALUE: main:_31_dealloc <- 1
	.loc	1 197 2 is_stmt 1       # GCD_original.c:197:2
	movl	$25, %esi
	movq	%rbx, %rdi
	callq	println_s
.Ltmp56:
	.loc	1 201 2 discriminator 1 # GCD_original.c:201:2
	movq	%r14, %rdi
	callq	free
.Ltmp57:
	#DEBUG_VALUE: main:max_dealloc <- 0
	.loc	1 205 2 discriminator 1 # GCD_original.c:205:2
	movq	%r15, %rdi
	callq	free
.Ltmp58:
	#DEBUG_VALUE: main:_12_dealloc <- 0
	.loc	1 206 2 discriminator 1 # GCD_original.c:206:2
	movq	%r12, %rdi
	callq	free
.Ltmp59:
	#DEBUG_VALUE: main:_26_dealloc <- 0
	.loc	1 207 2 discriminator 1 # GCD_original.c:207:2
	movq	%rbx, %rdi
	callq	free
.Ltmp60:
	#DEBUG_VALUE: main:_31_dealloc <- 0
.LBB1_12:                               # %if.end90
	.loc	1 208 2                 # GCD_original.c:208:2
	xorl	%edi, %edi
	callq	exit
.LBB1_14:                               # %if.end3.i
.Ltmp61:
	#DEBUG_VALUE: gcd:a <- %RAX
	#DEBUG_VALUE: gcd:_6 <- %RAX
	.loc	1 26 12                 # GCD_original.c:26:12
	movq	stderr(%rip), %rcx
	.loc	1 26 4 is_stmt 0        # GCD_original.c:26:4
	movl	$.L.str, %edi
	movl	$4, %esi
	movl	$1, %edx
	callq	fwrite
.Ltmp62:
	.loc	1 27 4 is_stmt 1        # GCD_original.c:27:4
	movl	$-1, %edi
	callq	exit
.Ltmp63:
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
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
	.asciz	"GCD_original.c"        # string offset=165
.Linfo_string2:
	.asciz	"/home/mw169/workspace/WhileyOpenCL/polly/GCD/impl/original/copyreduced_dealloc" # string offset=180
.Linfo_string3:
	.asciz	"gcd"                   # string offset=259
.Linfo_string4:
	.asciz	"long long int"         # string offset=263
.Linfo_string5:
	.asciz	"a"                     # string offset=277
.Linfo_string6:
	.asciz	"b"                     # string offset=279
.Linfo_string7:
	.asciz	"_2"                    # string offset=281
.Linfo_string8:
	.asciz	"_3"                    # string offset=284
.Linfo_string9:
	.asciz	"_4"                    # string offset=287
.Linfo_string10:
	.asciz	"_5"                    # string offset=290
.Linfo_string11:
	.asciz	"_6"                    # string offset=293
.Linfo_string12:
	.asciz	"_7"                    # string offset=296
.Linfo_string13:
	.asciz	"main"                  # string offset=299
.Linfo_string14:
	.asciz	"int"                   # string offset=304
.Linfo_string15:
	.asciz	"argc"                  # string offset=308
.Linfo_string16:
	.asciz	"args"                  # string offset=313
.Linfo_string17:
	.asciz	"char"                  # string offset=318
.Linfo_string18:
	.asciz	"max_dealloc"           # string offset=323
.Linfo_string19:
	.asciz	"_Bool"                 # string offset=335
.Linfo_string20:
	.asciz	"n"                     # string offset=341
.Linfo_string21:
	.asciz	"sum"                   # string offset=343
.Linfo_string22:
	.asciz	"i"                     # string offset=347
.Linfo_string23:
	.asciz	"j"                     # string offset=349
.Linfo_string24:
	.asciz	"_6_dealloc"            # string offset=351
.Linfo_string25:
	.asciz	"_7_size"               # string offset=362
.Linfo_string26:
	.asciz	"_7_size_size"          # string offset=370
.Linfo_string27:
	.asciz	"_7_dealloc"            # string offset=383
.Linfo_string28:
	.asciz	"_8"                    # string offset=394
.Linfo_string29:
	.asciz	"_9_size"               # string offset=397
.Linfo_string30:
	.asciz	"_9_dealloc"            # string offset=405
.Linfo_string31:
	.asciz	"_12_size"              # string offset=416
.Linfo_string32:
	.asciz	"_12_dealloc"           # string offset=425
.Linfo_string33:
	.asciz	"_15"                   # string offset=437
.Linfo_string34:
	.asciz	"_16"                   # string offset=441
.Linfo_string35:
	.asciz	"_17"                   # string offset=445
.Linfo_string36:
	.asciz	"_18"                   # string offset=449
.Linfo_string37:
	.asciz	"_19"                   # string offset=453
.Linfo_string38:
	.asciz	"_20"                   # string offset=457
.Linfo_string39:
	.asciz	"_21"                   # string offset=461
.Linfo_string40:
	.asciz	"_22"                   # string offset=465
.Linfo_string41:
	.asciz	"_23"                   # string offset=469
.Linfo_string42:
	.asciz	"_26_size"              # string offset=473
.Linfo_string43:
	.asciz	"_26_dealloc"           # string offset=482
.Linfo_string44:
	.asciz	"_31_size"              # string offset=494
.Linfo_string45:
	.asciz	"_31_dealloc"           # string offset=503
.Linfo_string46:
	.asciz	"_9"                    # string offset=515
.Linfo_string47:
	.asciz	"max"                   # string offset=518
.Linfo_string48:
	.asciz	"_12"                   # string offset=522
.Linfo_string49:
	.asciz	"_26"                   # string offset=526
.Linfo_string50:
	.asciz	"_31"                   # string offset=530
.Linfo_string51:
	.asciz	"_10"                   # string offset=534
.Linfo_string52:
	.asciz	"_13"                   # string offset=538
.Linfo_string53:
	.asciz	"_24"                   # string offset=542
.Linfo_string54:
	.asciz	"_27"                   # string offset=546
.Linfo_string55:
	.asciz	"_29"                   # string offset=550
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
	.quad	.Ltmp24-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp24-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp27-.Lfunc_begin0
	.quad	.Ltmp57-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp29-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp29-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp29-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp29-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	4                       # 4
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp31-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp58-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	5                       # 5
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	25                      # 25
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp60-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc23:
	.quad	.Ltmp24-.Lfunc_begin0
	.quad	.Ltmp26-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp25-.Lfunc_begin0
	.quad	.Ltmp26-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Ltmp27-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp27-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Ltmp30-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Ltmp35-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp61-.Lfunc_begin0
	.quad	.Ltmp62-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp61-.Lfunc_begin0
	.quad	.Ltmp62-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc33:
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
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
	.byte	12                      # Abbreviation Code
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
	.byte	13                      # Abbreviation Code
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
	.byte	14                      # Abbreviation Code
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
	.byte	17                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	932                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x39d DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x1 DW_TAG_pointer_type
	.byte	3                       # Abbrev [3] 0x2b:0x50 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	123                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x3e:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	135                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x47:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	146                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x50:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	157                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x56:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	168                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x5c:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	179                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x62:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	190                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x68:0x9 DW_TAG_variable
	.long	.Ldebug_loc2            # DW_AT_location
	.long	201                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x71:0x9 DW_TAG_variable
	.long	.Ldebug_loc3            # DW_AT_location
	.long	212                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x7b:0x65 DW_TAG_subprogram
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	224                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	8                       # Abbrev [8] 0x87:0xb DW_TAG_formal_parameter
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x92:0xb DW_TAG_formal_parameter
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x9d:0xb DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0xa8:0xb DW_TAG_variable
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0xb3:0xb DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0xbe:0xb DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0xc9:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0xd4:0xb DW_TAG_variable
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	10                      # Abbrev [10] 0xe0:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	11                      # Abbrev [11] 0xe7:0x297 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	894                     # DW_AT_type
                                        # DW_AT_external
	.byte	12                      # Abbrev [12] 0x100:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc4            # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	894                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x10f:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc5            # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	901                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x11e:0xf DW_TAG_variable
	.long	.Ldebug_loc6            # DW_AT_location
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	918                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x12d:0xf DW_TAG_variable
	.long	.Ldebug_loc7            # DW_AT_location
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	65                      # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x13c:0xf DW_TAG_variable
	.long	.Ldebug_loc8            # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	66                      # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x14b:0xf DW_TAG_variable
	.long	.Ldebug_loc9            # DW_AT_location
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	67                      # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x15a:0xf DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	68                      # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x169:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.long	918                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x175:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	71                      # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x181:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	71                      # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x18d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	72                      # DW_AT_decl_line
	.long	918                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x199:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	73                      # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1a5:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	74                      # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x1b1:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	75                      # DW_AT_decl_line
	.long	918                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x1bd:0xf DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	77                      # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x1cc:0xf DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	78                      # DW_AT_decl_line
	.long	918                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1db:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	80                      # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1e7:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	81                      # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1f3:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	82                      # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x1ff:0xf DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	83                      # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x20e:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	84                      # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x21d:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	85                      # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x22c:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	86                      # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x23b:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	87                      # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x24a:0xf DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	88                      # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x259:0xf DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	90                      # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x268:0xf DW_TAG_variable
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	91                      # DW_AT_decl_line
	.long	918                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x277:0xf DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	94                      # DW_AT_decl_line
	.long	224                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x286:0xf DW_TAG_variable
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	95                      # DW_AT_decl_line
	.long	918                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x295:0xf DW_TAG_variable
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	71                      # DW_AT_decl_line
	.long	925                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x2a4:0xf DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	74                      # DW_AT_decl_line
	.long	930                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x2b3:0xf DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	930                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x2c2:0xf DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	69                      # DW_AT_decl_line
	.long	930                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x2d1:0xf DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	77                      # DW_AT_decl_line
	.long	930                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x2e0:0xf DW_TAG_variable
	.long	.Ldebug_loc32           # DW_AT_location
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	90                      # DW_AT_decl_line
	.long	930                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x2ef:0xf DW_TAG_variable
	.long	.Ldebug_loc33           # DW_AT_location
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	94                      # DW_AT_decl_line
	.long	930                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x2fe:0xb DW_TAG_variable
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	76                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x309:0xb DW_TAG_variable
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	79                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x314:0xb DW_TAG_variable
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	89                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x31f:0xb DW_TAG_variable
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	92                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x32a:0xb DW_TAG_variable
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	93                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	16                      # Abbrev [16] 0x335:0x48 DW_TAG_inlined_subroutine
	.long	123                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	149                     # DW_AT_call_line
	.byte	4                       # Abbrev [4] 0x340:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc28           # DW_AT_location
	.long	135                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x349:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc31           # DW_AT_location
	.long	146                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x352:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	157                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x358:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	168                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x35e:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	179                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x364:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	190                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x36a:0x9 DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	201                     # DW_AT_abstract_origin
	.byte	6                       # Abbrev [6] 0x373:0x9 DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	212                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	10                      # Abbrev [10] 0x37e:0x7 DW_TAG_base_type
	.long	.Linfo_string14         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	17                      # Abbrev [17] 0x385:0x5 DW_TAG_pointer_type
	.long	906                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x38a:0x5 DW_TAG_pointer_type
	.long	911                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x38f:0x7 DW_TAG_base_type
	.long	.Linfo_string17         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	10                      # Abbrev [10] 0x396:0x7 DW_TAG_base_type
	.long	.Linfo_string19         # DW_AT_name
	.byte	2                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	17                      # Abbrev [17] 0x39d:0x5 DW_TAG_pointer_type
	.long	930                     # DW_AT_type
	.byte	17                      # Abbrev [17] 0x3a2:0x5 DW_TAG_pointer_type
	.long	224                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp33-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp61-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
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
	.long	936                     # Compilation Unit Length
	.long	231                     # DIE offset
	.asciz	"main"                  # External Name
	.long	123                     # DIE offset
	.asciz	"gcd"                   # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	936                     # Compilation Unit Length
	.long	918                     # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	224                     # DIE offset
	.asciz	"long long int"         # External Name
	.long	894                     # DIE offset
	.asciz	"int"                   # External Name
	.long	911                     # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git f82fb5beb88e841f7a00cfb2a2ceabe46bcb2a9b) (http://llvm.org/git/llvm.git bafbf2b643f118fd2ea402ed6cd204281c7e9e94)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
