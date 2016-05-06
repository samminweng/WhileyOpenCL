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
	.loc	1 62 0                  # GCD.c:62:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp9:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp10:
	.cfi_def_cfa_offset 24
	pushq	%r13
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
	.cfi_offset %r13, -32
.Ltmp17:
	.cfi_offset %r14, -24
.Ltmp18:
	.cfi_offset %r15, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
	movl	%edi, %ebx
.Ltmp19:
	#DEBUG_VALUE: main:_31_has_ownership <- 0
	#DEBUG_VALUE: main:_31_size <- 0
	#DEBUG_VALUE: main:_26_has_ownership <- 0
	#DEBUG_VALUE: main:_26_size <- 0
	#DEBUG_VALUE: main:_23 <- 0
	#DEBUG_VALUE: main:_22 <- 0
	#DEBUG_VALUE: main:_21 <- 0
	#DEBUG_VALUE: main:_20 <- 0
	#DEBUG_VALUE: main:_19 <- 0
	#DEBUG_VALUE: main:_18 <- 0
	#DEBUG_VALUE: main:_17 <- 0
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
	#DEBUG_VALUE: main:sum <- 0
	#DEBUG_VALUE: main:n <- 0
	#DEBUG_VALUE: main:argc <- %EBX
	.loc	1 95 2 prologue_end     # GCD.c:95:2
	callq	convertArgsToIntArray
.Ltmp20:
	movq	%rax, %r15
.Ltmp21:
	#DEBUG_VALUE: main:_7 <- %R15
	decl	%ebx
.Ltmp22:
	movslq	%ebx, %r14
.Ltmp23:
	#DEBUG_VALUE: main:_7_has_ownership <- 1
	#DEBUG_VALUE: main:_7_size <- %EBX
	.loc	1 100 5                 # GCD.c:100:5
	movq	(%r15), %rdi
.Ltmp24:
	#DEBUG_VALUE: main:_9 <- %RDI
	.loc	1 102 2                 # GCD.c:102:2
	callq	parseStringToInt
.Ltmp25:
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_6 <- %RAX
	.loc	1 106 9                 # GCD.c:106:9
	testq	%rax, %rax
.Ltmp26:
	.loc	1 106 5 is_stmt 0       # GCD.c:106:5
	je	.LBB1_14
.Ltmp27:
# BB#1:                                 # %if.end
	#DEBUG_VALUE: main:_6 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_7_size <- %EBX
	#DEBUG_VALUE: main:_7 <- %R15
	.loc	1 108 6 is_stmt 1       # GCD.c:108:6
	movq	(%rax), %r13
.Ltmp28:
	#DEBUG_VALUE: main:_12_size <- 4
	#DEBUG_VALUE: main:n <- %R13
	.loc	1 113 2                 # GCD.c:113:2
	movl	$32, %edi
	callq	malloc
.Ltmp29:
	movq	%rax, %r12
.Ltmp30:
	#DEBUG_VALUE: main:_12 <- %R12
	.loc	1 114 9                 # GCD.c:114:9
	movaps	.LCPI1_0(%rip), %xmm0   # xmm0 = [78,32]
	movups	%xmm0, (%r12)
	.loc	1 114 35 is_stmt 0      # GCD.c:114:35
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [61,32]
	movups	%xmm0, 16(%r12)
.Ltmp31:
	#DEBUG_VALUE: main:_12_has_ownership <- 1
	.loc	1 117 2 is_stmt 1       # GCD.c:117:2
	movl	$4, %esi
	movq	%r12, %rdi
	callq	printf_s
	.loc	1 121 2                 # GCD.c:121:2
	xorl	%ebx, %ebx
.Ltmp32:
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%r13, %rsi
	callq	printf
	#DEBUG_VALUE: main:_16 <- 0
	#DEBUG_VALUE: main:_15 <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:sum <- 0
.Ltmp33:
	.loc	1 133 6                 # GCD.c:133:6
	testq	%r13, %r13
	jle	.LBB1_11
.Ltmp34:
# BB#2:                                 # %while.cond15.preheader.us.preheader
	#DEBUG_VALUE: main:_7 <- %R15
	#DEBUG_VALUE: main:_12 <- %R12
	#DEBUG_VALUE: main:n <- %R13
	.loc	1 12 6                  # GCD.c:12:6
	leaq	-1(%r13), %rax
	leaq	-2(%r13), %rcx
	mulq	%rcx
	shldq	$63, %rax, %rdx
.Ltmp35:
	.loc	1 2 25                  # GCD.c:2:25
	leaq	-1(%r13,%rdx), %r8
	xorl	%ebx, %ebx
	xorl	%ecx, %ecx
.Ltmp36:
	.p2align	4, 0x90
.LBB1_3:                                # %while.cond15.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_5 Depth 2
                                        #       Child Loop BB1_7 Depth 3
	#DEBUG_VALUE: gcd:a <- %RCX
	.loc	1 12 6                  # GCD.c:12:6
	testq	%rcx, %rcx
	je	.LBB1_12
.Ltmp37:
# BB#4:                                 #   in Loop: Header=BB1_3 Depth=1
	#DEBUG_VALUE: gcd:a <- %RCX
	xorl	%edx, %edx
.Ltmp38:
	.p2align	4, 0x90
.LBB1_5:                                # %if.end20.us148
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
	.loc	1 35 7                  # GCD.c:35:7
	testq	%rdx, %rdx
	movq	%rdx, %rdi
	movq	%rcx, %rax
	je	.LBB1_9
.Ltmp39:
	.p2align	4, 0x90
.LBB1_7:                                # %blklab4.i.us152
                                        #   Parent Loop BB1_3 Depth=1
                                        #     Parent Loop BB1_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	#DEBUG_VALUE: gcd:_5 <- 0
	.loc	1 37 7                  # GCD.c:37:7
	movq	%rax, %rsi
	subq	%rdi, %rsi
	jle	.LBB1_8
.Ltmp40:
# BB#6:                                 # %if.end9.i.us159
                                        #   in Loop: Header=BB1_7 Depth=3
	#DEBUG_VALUE: gcd:_4 <- 0
	.loc	1 143 10                # GCD.c:143:10
	movq	%rsi, %rax
	jns	.LBB1_7
	jmp	.LBB1_13
.LBB1_8:                                # %blklab5.i.us155
                                        #   in Loop: Header=BB1_7 Depth=3
	#DEBUG_VALUE: gcd:_4 <- 0
.Ltmp41:
	.loc	1 35 7                  # GCD.c:35:7
	subq	%rax, %rdi
	jne	.LBB1_7
.Ltmp42:
.LBB1_9:                                # %gcd.exit.loopexit.us172
                                        #   in Loop: Header=BB1_5 Depth=2
	#DEBUG_VALUE: main:_18 <- %RBX
	.loc	1 145 11                # GCD.c:145:11
	addq	%rax, %rbx
.Ltmp43:
	#DEBUG_VALUE: main:_20 <- 1
	#DEBUG_VALUE: main:_19 <- %RBX
	#DEBUG_VALUE: main:sum <- %RBX
	.loc	1 151 9                 # GCD.c:151:9
	incq	%rdx
.Ltmp44:
	#DEBUG_VALUE: main:_21 <- %RDX
	#DEBUG_VALUE: main:j <- %RDX
	.loc	1 141 7                 # GCD.c:141:7
	cmpq	%r13, %rdx
	jne	.LBB1_5
	jmp	.LBB1_10
.Ltmp45:
	.p2align	4, 0x90
.LBB1_12:                               # %if.end20.us.us.us.preheader
                                        #   in Loop: Header=BB1_3 Depth=1
	#DEBUG_VALUE: gcd:a <- %RCX
	.loc	1 2 25                  # GCD.c:2:25
	addq	%r8, %rbx
.Ltmp46:
.LBB1_10:                               # %blklab10.loopexit.us
                                        #   in Loop: Header=BB1_3 Depth=1
	#DEBUG_VALUE: main:_22 <- 1
	.loc	1 162 8                 # GCD.c:162:8
	incq	%rcx
.Ltmp47:
	#DEBUG_VALUE: main:_23 <- %RCX
	#DEBUG_VALUE: main:i <- %RCX
	.loc	1 133 6                 # GCD.c:133:6
	cmpq	%r13, %rcx
	jne	.LBB1_3
.Ltmp48:
.LBB1_11:                               # %if.then70
	#DEBUG_VALUE: main:_26_size <- 5
	.loc	1 174 2                 # GCD.c:174:2
	movl	$40, %edi
	callq	malloc
	movq	%rax, %r13
.Ltmp49:
	#DEBUG_VALUE: main:_26 <- %R13
	.loc	1 175 9                 # GCD.c:175:9
	movaps	.LCPI1_2(%rip), %xmm0   # xmm0 = [83,117]
	movups	%xmm0, (%r13)
	.loc	1 175 36 is_stmt 0      # GCD.c:175:36
	movaps	.LCPI1_3(%rip), %xmm0   # xmm0 = [109,58]
	movups	%xmm0, 16(%r13)
	.loc	1 175 63                # GCD.c:175:63
	movq	$32, 32(%r13)
.Ltmp50:
	#DEBUG_VALUE: main:_26_has_ownership <- 1
	.loc	1 178 2 is_stmt 1       # GCD.c:178:2
	movl	$5, %esi
	movq	%r13, %rdi
	callq	printf_s
	.loc	1 182 2                 # GCD.c:182:2
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	printf
.Ltmp51:
	#DEBUG_VALUE: main:_31_size <- 25
	.loc	1 187 2                 # GCD.c:187:2
	movl	$200, %edi
	callq	malloc
	movq	%rax, %rbx
.Ltmp52:
	#DEBUG_VALUE: main:_31 <- %RBX
	.loc	1 188 9                 # GCD.c:188:9
	movaps	.LCPI1_4(%rip), %xmm0   # xmm0 = [80,97]
	movups	%xmm0, (%rbx)
	.loc	1 188 35 is_stmt 0      # GCD.c:188:35
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [115,115]
	movups	%xmm0, 16(%rbx)
	.loc	1 188 63                # GCD.c:188:63
	movaps	.LCPI1_6(%rip), %xmm0   # xmm0 = [32,69]
	movups	%xmm0, 32(%rbx)
	.loc	1 188 89                # GCD.c:188:89
	movaps	.LCPI1_7(%rip), %xmm0   # xmm0 = [117,99]
	movups	%xmm0, 48(%rbx)
	.loc	1 188 116               # GCD.c:188:116
	movaps	.LCPI1_8(%rip), %xmm0   # xmm0 = [108,105]
	movups	%xmm0, 64(%rbx)
	.loc	1 188 145               # GCD.c:188:145
	movaps	.LCPI1_9(%rip), %xmm0   # xmm0 = [100,32]
	movups	%xmm0, 80(%rbx)
	.loc	1 188 174               # GCD.c:188:174
	movaps	.LCPI1_10(%rip), %xmm0  # xmm0 = [71,67]
	movups	%xmm0, 96(%rbx)
	.loc	1 188 202               # GCD.c:188:202
	movaps	.LCPI1_11(%rip), %xmm0  # xmm0 = [68,32]
	movups	%xmm0, 112(%rbx)
	.loc	1 188 230               # GCD.c:188:230
	movaps	.LCPI1_12(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 128(%rbx)
	.loc	1 188 260               # GCD.c:188:260
	movaps	.LCPI1_13(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 144(%rbx)
	.loc	1 188 290               # GCD.c:188:290
	movaps	.LCPI1_14(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 160(%rbx)
	.loc	1 188 318               # GCD.c:188:318
	movaps	.LCPI1_15(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 176(%rbx)
	.loc	1 188 347               # GCD.c:188:347
	movq	$101, 192(%rbx)
.Ltmp53:
	#DEBUG_VALUE: main:_31_has_ownership <- 1
	.loc	1 191 2 is_stmt 1       # GCD.c:191:2
	movl	$25, %esi
	movq	%rbx, %rdi
	callq	println_s
.Ltmp54:
	.loc	1 195 2 discriminator 1 # GCD.c:195:2
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	free2DArray
.Ltmp55:
	#DEBUG_VALUE: main:_7_has_ownership <- 0
	.loc	1 197 2 discriminator 1 # GCD.c:197:2
	movq	%r12, %rdi
	callq	free
.Ltmp56:
	#DEBUG_VALUE: main:_12_has_ownership <- 0
	.loc	1 198 2 discriminator 1 # GCD.c:198:2
	movq	%r13, %rdi
	callq	free
.Ltmp57:
	#DEBUG_VALUE: main:_26_has_ownership <- 0
	.loc	1 199 2 discriminator 1 # GCD.c:199:2
	movq	%rbx, %rdi
	callq	free
.Ltmp58:
	#DEBUG_VALUE: main:_31_has_ownership <- 0
	.loc	1 200 2                 # GCD.c:200:2
	xorl	%edi, %edi
	callq	exit
.Ltmp59:
.LBB1_13:                               # %if.end3.i
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
.Ltmp60:
.LBB1_14:                               # %if.then64
	#DEBUG_VALUE: main:_6 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_7_size <- %EBX
	#DEBUG_VALUE: main:_7 <- %R15
	.loc	1 195 2 discriminator 1 # GCD.c:195:2
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	free2DArray
.Ltmp61:
	#DEBUG_VALUE: main:_7_has_ownership <- 0
	.loc	1 200 2                 # GCD.c:200:2
	xorl	%edi, %edi
	callq	exit
.Ltmp62:
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
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)" # string offset=0
.Linfo_string1:
	.asciz	"GCD.c"                 # string offset=165
.Linfo_string2:
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/GCD/impl/autogenerate" # string offset=171
.Linfo_string3:
	.asciz	"gcd"                   # string offset=232
.Linfo_string4:
	.asciz	"long long int"         # string offset=236
.Linfo_string5:
	.asciz	"a"                     # string offset=250
.Linfo_string6:
	.asciz	"b"                     # string offset=252
.Linfo_string7:
	.asciz	"_2"                    # string offset=254
.Linfo_string8:
	.asciz	"_3"                    # string offset=257
.Linfo_string9:
	.asciz	"_4"                    # string offset=260
.Linfo_string10:
	.asciz	"_5"                    # string offset=263
.Linfo_string11:
	.asciz	"_6"                    # string offset=266
.Linfo_string12:
	.asciz	"_7"                    # string offset=269
.Linfo_string13:
	.asciz	"main"                  # string offset=272
.Linfo_string14:
	.asciz	"int"                   # string offset=277
.Linfo_string15:
	.asciz	"argc"                  # string offset=281
.Linfo_string16:
	.asciz	"args"                  # string offset=286
.Linfo_string17:
	.asciz	"char"                  # string offset=291
.Linfo_string18:
	.asciz	"_31_has_ownership"     # string offset=296
.Linfo_string19:
	.asciz	"_Bool"                 # string offset=314
.Linfo_string20:
	.asciz	"_31_size"              # string offset=320
.Linfo_string21:
	.asciz	"_26_has_ownership"     # string offset=329
.Linfo_string22:
	.asciz	"_26_size"              # string offset=347
.Linfo_string23:
	.asciz	"_23"                   # string offset=356
.Linfo_string24:
	.asciz	"_22"                   # string offset=360
.Linfo_string25:
	.asciz	"_21"                   # string offset=364
.Linfo_string26:
	.asciz	"_20"                   # string offset=368
.Linfo_string27:
	.asciz	"_19"                   # string offset=372
.Linfo_string28:
	.asciz	"_18"                   # string offset=376
.Linfo_string29:
	.asciz	"_17"                   # string offset=380
.Linfo_string30:
	.asciz	"_16"                   # string offset=384
.Linfo_string31:
	.asciz	"_15"                   # string offset=388
.Linfo_string32:
	.asciz	"_12_has_ownership"     # string offset=392
.Linfo_string33:
	.asciz	"_12_size"              # string offset=410
.Linfo_string34:
	.asciz	"_9_has_ownership"      # string offset=419
.Linfo_string35:
	.asciz	"_9_size"               # string offset=436
.Linfo_string36:
	.asciz	"_8"                    # string offset=444
.Linfo_string37:
	.asciz	"_7_has_ownership"      # string offset=447
.Linfo_string38:
	.asciz	"_7_size_size"          # string offset=464
.Linfo_string39:
	.asciz	"_7_size"               # string offset=477
.Linfo_string40:
	.asciz	"j"                     # string offset=485
.Linfo_string41:
	.asciz	"i"                     # string offset=487
.Linfo_string42:
	.asciz	"sum"                   # string offset=489
.Linfo_string43:
	.asciz	"n"                     # string offset=493
.Linfo_string44:
	.asciz	"_9"                    # string offset=495
.Linfo_string45:
	.asciz	"max"                   # string offset=498
.Linfo_string46:
	.asciz	"_12"                   # string offset=502
.Linfo_string47:
	.asciz	"_26"                   # string offset=506
.Linfo_string48:
	.asciz	"_31"                   # string offset=510
.Linfo_string49:
	.asciz	"_10"                   # string offset=514
.Linfo_string50:
	.asciz	"_13"                   # string offset=518
.Linfo_string51:
	.asciz	"_24"                   # string offset=522
.Linfo_string52:
	.asciz	"_27"                   # string offset=526
.Linfo_string53:
	.asciz	"_29"                   # string offset=530
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
	.quad	.Ltmp19-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp22-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp53-.Lfunc_begin0
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
.Ldebug_loc5:
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	25                      # 25
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp50-.Lfunc_begin0
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
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	5                       # 5
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Ltmp19-.Lfunc_begin0
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
.Ldebug_loc9:
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp31-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp56-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp28-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	4                       # 4
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp23-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp23-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp32-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp60-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp19-.Lfunc_begin0
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
.Ldebug_loc20:
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp28-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp60-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc23:
	.quad	.Ltmp24-.Lfunc_begin0
	.quad	.Ltmp25-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp25-.Lfunc_begin0
	.quad	.Ltmp29-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp60-.Lfunc_begin0
	.quad	.Ltmp61-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Ltmp25-.Lfunc_begin0
	.quad	.Ltmp29-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp60-.Lfunc_begin0
	.quad	.Ltmp61-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp30-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Ltmp36-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
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
	.byte	7                       # Abbreviation Code
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
	.byte	10                      # Abbreviation Code
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
	.byte	11                      # Abbreviation Code
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
	.byte	12                      # Abbreviation Code
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
	.byte	13                      # Abbreviation Code
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
	.byte	16                      # Abbreviation Code
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
	.long	899                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x37c DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x1 DW_TAG_pointer_type
	.byte	3                       # Abbrev [3] 0x2b:0x4a DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	117                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x3e:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	129                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x47:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	140                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x50:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	151                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x56:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	162                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x5c:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	173                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x62:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	184                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x68:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	195                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x6e:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	206                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	6                       # Abbrev [6] 0x75:0x65 DW_TAG_subprogram
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	218                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	7                       # Abbrev [7] 0x81:0xb DW_TAG_formal_parameter
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x8c:0xb DW_TAG_formal_parameter
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x97:0xb DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0xa2:0xb DW_TAG_variable
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0xad:0xb DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0xb8:0xb DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0xc3:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0xce:0xb DW_TAG_variable
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0xda:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	10                      # Abbrev [10] 0xe1:0x27c DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	861                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	11                      # Abbrev [11] 0xfa:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	861                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x109:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	868                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x118:0xf DW_TAG_variable
	.long	.Ldebug_loc4            # DW_AT_location
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	93                      # DW_AT_decl_line
	.long	885                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x127:0xf DW_TAG_variable
	.long	.Ldebug_loc5            # DW_AT_location
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	92                      # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x136:0xf DW_TAG_variable
	.long	.Ldebug_loc6            # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	89                      # DW_AT_decl_line
	.long	885                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x145:0xf DW_TAG_variable
	.long	.Ldebug_loc7            # DW_AT_location
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	88                      # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x154:0xf DW_TAG_variable
	.long	.Ldebug_loc8            # DW_AT_location
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	86                      # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x163:0xf DW_TAG_variable
	.long	.Ldebug_loc9            # DW_AT_location
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	85                      # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x172:0xf DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	84                      # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x181:0xf DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	83                      # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x190:0xf DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	82                      # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x19f:0xf DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	81                      # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x1ae:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	80                      # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x1ba:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	79                      # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x1c6:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	78                      # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1d2:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	76                      # DW_AT_decl_line
	.long	885                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1e1:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	75                      # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x1f0:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	73                      # DW_AT_decl_line
	.long	885                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x1fc:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	72                      # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x208:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	71                      # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x214:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.long	885                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x223:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	69                      # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x22f:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	69                      # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x23e:0xf DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	67                      # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x24d:0xf DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	66                      # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x25c:0xf DW_TAG_variable
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	65                      # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x26b:0xf DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	218                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x27a:0xf DW_TAG_variable
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	69                      # DW_AT_decl_line
	.long	892                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x289:0xf DW_TAG_variable
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	72                      # DW_AT_decl_line
	.long	897                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x298:0xf DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	897                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x2a7:0xf DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	68                      # DW_AT_decl_line
	.long	897                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x2b6:0xf DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	75                      # DW_AT_decl_line
	.long	897                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x2c5:0xf DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	88                      # DW_AT_decl_line
	.long	897                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x2d4:0xf DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	.Linfo_string48         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	92                      # DW_AT_decl_line
	.long	897                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x2e3:0xb DW_TAG_variable
	.long	.Linfo_string49         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	74                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	8                       # Abbrev [8] 0x2ee:0xb DW_TAG_variable
	.long	.Linfo_string50         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	77                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	8                       # Abbrev [8] 0x2f9:0xb DW_TAG_variable
	.long	.Linfo_string51         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	87                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	8                       # Abbrev [8] 0x304:0xb DW_TAG_variable
	.long	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	90                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	8                       # Abbrev [8] 0x30f:0xb DW_TAG_variable
	.long	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	91                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	15                      # Abbrev [15] 0x31a:0x42 DW_TAG_inlined_subroutine
	.long	117                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	143                     # DW_AT_call_line
	.byte	4                       # Abbrev [4] 0x325:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc27           # DW_AT_location
	.long	129                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x32e:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc28           # DW_AT_location
	.long	140                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x337:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	151                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x33d:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	162                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x343:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	173                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x349:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	184                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x34f:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	195                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x355:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	206                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0x35d:0x7 DW_TAG_base_type
	.long	.Linfo_string14         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	16                      # Abbrev [16] 0x364:0x5 DW_TAG_pointer_type
	.long	873                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x369:0x5 DW_TAG_pointer_type
	.long	878                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x36e:0x7 DW_TAG_base_type
	.long	.Linfo_string17         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	9                       # Abbrev [9] 0x375:0x7 DW_TAG_base_type
	.long	.Linfo_string19         # DW_AT_name
	.byte	2                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	16                      # Abbrev [16] 0x37c:0x5 DW_TAG_pointer_type
	.long	897                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x381:0x5 DW_TAG_pointer_type
	.long	218                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
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
	.long	903                     # Compilation Unit Length
	.long	225                     # DIE offset
	.asciz	"main"                  # External Name
	.long	117                     # DIE offset
	.asciz	"gcd"                   # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	903                     # Compilation Unit Length
	.long	885                     # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	218                     # DIE offset
	.asciz	"long long int"         # External Name
	.long	861                     # DIE offset
	.asciz	"int"                   # External Name
	.long	878                     # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0: