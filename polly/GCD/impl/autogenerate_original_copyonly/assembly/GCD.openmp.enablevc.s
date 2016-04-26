	.text
	.file	"llvm/GCD.openmp.enablevc.ll"
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
	.loc	1 90 2 prologue_end     # GCD.c:90:2
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
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
.Ltmp14:
	#DEBUG_VALUE: main:n <- 0
	#DEBUG_VALUE: main:sum <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:j <- 0
	#DEBUG_VALUE: main:_7_size <- 0
	#DEBUG_VALUE: main:_7_size_size <- 0
	#DEBUG_VALUE: main:_8 <- 0
	#DEBUG_VALUE: main:_9_size <- 0
	#DEBUG_VALUE: main:_12_size <- 0
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
	#DEBUG_VALUE: main:_31_size <- 0
	callq	convertArgsToIntArray
.Ltmp15:
	#DEBUG_VALUE: main:_7 <- %RAX
	.loc	1 94 5                  # GCD.c:94:5
	movq	(%rax), %rdi
.Ltmp16:
	#DEBUG_VALUE: main:_9 <- %RDI
	.loc	1 96 2                  # GCD.c:96:2
	callq	parseStringToInt
.Ltmp17:
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_6 <- %RAX
	.loc	1 100 9                 # GCD.c:100:9
	testq	%rax, %rax
	je	.LBB1_12
.Ltmp18:
# BB#1:                                 # %if.end
	#DEBUG_VALUE: main:_6 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	.loc	1 102 6                 # GCD.c:102:6
	movq	(%rax), %r14
.Ltmp19:
	#DEBUG_VALUE: main:_12_size <- 4
	#DEBUG_VALUE: main:n <- %R14
	.loc	1 106 2                 # GCD.c:106:2
	movl	$32, %edi
	callq	malloc
.Ltmp20:
	#DEBUG_VALUE: main:_12 <- %RAX
	.loc	1 107 9                 # GCD.c:107:9
	movaps	.LCPI1_0(%rip), %xmm0   # xmm0 = [78,32]
	movups	%xmm0, (%rax)
	.loc	1 107 35 is_stmt 0      # GCD.c:107:35
	movaps	.LCPI1_1(%rip), %xmm0   # xmm0 = [61,32]
	movups	%xmm0, 16(%rax)
	.loc	1 109 2 is_stmt 1       # GCD.c:109:2
	movl	$4, %esi
	movq	%rax, %rdi
	callq	printf_s
.Ltmp21:
	.loc	1 113 2                 # GCD.c:113:2
	xorl	%ebx, %ebx
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%r14, %rsi
	callq	printf
	#DEBUG_VALUE: main:_16 <- 0
	#DEBUG_VALUE: main:_15 <- 0
	#DEBUG_VALUE: main:i <- 0
	#DEBUG_VALUE: main:sum <- 0
.Ltmp22:
	.loc	1 125 6                 # GCD.c:125:6
	testq	%r14, %r14
	jle	.LBB1_11
.Ltmp23:
# BB#2:                                 # %while.cond13.preheader.us.preheader
	#DEBUG_VALUE: main:n <- %R14
	.loc	1 12 6                  # GCD.c:12:6
	leaq	-1(%r14), %rax
	leaq	-2(%r14), %rcx
	mulq	%rcx
	shldq	$63, %rax, %rdx
.Ltmp24:
	.loc	1 2 25                  # GCD.c:2:25
	leaq	-1(%r14,%rdx), %r8
	xorl	%ebx, %ebx
	xorl	%ecx, %ecx
.Ltmp25:
	.p2align	4, 0x90
.LBB1_3:                                # %while.cond13.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_5 Depth 2
                                        #       Child Loop BB1_7 Depth 3
	#DEBUG_VALUE: gcd:a <- %RCX
	.loc	1 12 6                  # GCD.c:12:6
	testq	%rcx, %rcx
.Ltmp26:
	.loc	1 12 5 is_stmt 0        # GCD.c:12:5
	je	.LBB1_13
.Ltmp27:
# BB#4:                                 # %if.end18.us113.preheader
                                        #   in Loop: Header=BB1_3 Depth=1
	#DEBUG_VALUE: gcd:a <- %RCX
	xorl	%edx, %edx
.Ltmp28:
	.p2align	4, 0x90
.LBB1_5:                                # %if.end18.us113
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
	.loc	1 35 7 is_stmt 1        # GCD.c:35:7
	testq	%rdx, %rdx
	movq	%rdx, %rdi
	movq	%rcx, %rax
	je	.LBB1_9
.Ltmp29:
	.p2align	4, 0x90
.LBB1_7:                                # %blklab4.i.us117
                                        #   Parent Loop BB1_3 Depth=1
                                        #     Parent Loop BB1_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	#DEBUG_VALUE: gcd:_5 <- 0
	.loc	1 37 7                  # GCD.c:37:7
	movq	%rax, %rsi
	subq	%rdi, %rsi
	jle	.LBB1_8
.Ltmp30:
# BB#6:                                 # %if.end9.i.us124
                                        #   in Loop: Header=BB1_7 Depth=3
	#DEBUG_VALUE: gcd:_4 <- 0
	.loc	1 135 10                # GCD.c:135:10
	movq	%rsi, %rax
	jns	.LBB1_7
	jmp	.LBB1_14
.LBB1_8:                                # %blklab5.i.us120
                                        #   in Loop: Header=BB1_7 Depth=3
	#DEBUG_VALUE: gcd:_4 <- 0
.Ltmp31:
	.loc	1 35 7                  # GCD.c:35:7
	subq	%rax, %rdi
	jne	.LBB1_7
.Ltmp32:
.LBB1_9:                                # %gcd.exit.loopexit.us137
                                        #   in Loop: Header=BB1_5 Depth=2
	#DEBUG_VALUE: main:_18 <- %RBX
	.loc	1 137 11                # GCD.c:137:11
	addq	%rax, %rbx
.Ltmp33:
	#DEBUG_VALUE: main:_20 <- 1
	#DEBUG_VALUE: main:_19 <- %RBX
	#DEBUG_VALUE: main:sum <- %RBX
	.loc	1 143 9                 # GCD.c:143:9
	incq	%rdx
.Ltmp34:
	#DEBUG_VALUE: main:_21 <- %RDX
	#DEBUG_VALUE: main:j <- %RDX
	.loc	1 133 7                 # GCD.c:133:7
	cmpq	%r14, %rdx
	jne	.LBB1_5
	jmp	.LBB1_10
.Ltmp35:
	.p2align	4, 0x90
.LBB1_13:                               # %if.end18.us.us.us.preheader
                                        #   in Loop: Header=BB1_3 Depth=1
	#DEBUG_VALUE: gcd:a <- %RCX
	.loc	1 2 25                  # GCD.c:2:25
	addq	%r8, %rbx
.Ltmp36:
.LBB1_10:                               # %blklab10.loopexit.us
                                        #   in Loop: Header=BB1_3 Depth=1
	#DEBUG_VALUE: main:_22 <- 1
	.loc	1 154 8                 # GCD.c:154:8
	incq	%rcx
.Ltmp37:
	#DEBUG_VALUE: main:_23 <- %RCX
	#DEBUG_VALUE: main:i <- %RCX
	.loc	1 125 6                 # GCD.c:125:6
	cmpq	%r14, %rcx
	jne	.LBB1_3
.Ltmp38:
.LBB1_11:                               # %blklab8
	#DEBUG_VALUE: main:_26_size <- 5
	.loc	1 165 2                 # GCD.c:165:2
	movl	$40, %edi
	callq	malloc
.Ltmp39:
	#DEBUG_VALUE: main:_26 <- %RAX
	.loc	1 166 9                 # GCD.c:166:9
	movaps	.LCPI1_2(%rip), %xmm0   # xmm0 = [83,117]
	movups	%xmm0, (%rax)
	.loc	1 166 36 is_stmt 0      # GCD.c:166:36
	movaps	.LCPI1_3(%rip), %xmm0   # xmm0 = [109,58]
	movups	%xmm0, 16(%rax)
	.loc	1 166 63                # GCD.c:166:63
	movq	$32, 32(%rax)
	.loc	1 168 2 is_stmt 1       # GCD.c:168:2
	movl	$5, %esi
	movq	%rax, %rdi
	callq	printf_s
.Ltmp40:
	.loc	1 172 2                 # GCD.c:172:2
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	printf
.Ltmp41:
	#DEBUG_VALUE: main:_31_size <- 25
	.loc	1 176 2                 # GCD.c:176:2
	movl	$200, %edi
	callq	malloc
.Ltmp42:
	#DEBUG_VALUE: main:_31 <- %RAX
	.loc	1 177 9                 # GCD.c:177:9
	movaps	.LCPI1_4(%rip), %xmm0   # xmm0 = [80,97]
	movups	%xmm0, (%rax)
	.loc	1 177 35 is_stmt 0      # GCD.c:177:35
	movaps	.LCPI1_5(%rip), %xmm0   # xmm0 = [115,115]
	movups	%xmm0, 16(%rax)
	.loc	1 177 63                # GCD.c:177:63
	movaps	.LCPI1_6(%rip), %xmm0   # xmm0 = [32,69]
	movups	%xmm0, 32(%rax)
	.loc	1 177 89                # GCD.c:177:89
	movaps	.LCPI1_7(%rip), %xmm0   # xmm0 = [117,99]
	movups	%xmm0, 48(%rax)
	.loc	1 177 116               # GCD.c:177:116
	movaps	.LCPI1_8(%rip), %xmm0   # xmm0 = [108,105]
	movups	%xmm0, 64(%rax)
	.loc	1 177 145               # GCD.c:177:145
	movaps	.LCPI1_9(%rip), %xmm0   # xmm0 = [100,32]
	movups	%xmm0, 80(%rax)
	.loc	1 177 174               # GCD.c:177:174
	movaps	.LCPI1_10(%rip), %xmm0  # xmm0 = [71,67]
	movups	%xmm0, 96(%rax)
	.loc	1 177 202               # GCD.c:177:202
	movaps	.LCPI1_11(%rip), %xmm0  # xmm0 = [68,32]
	movups	%xmm0, 112(%rax)
	.loc	1 177 230               # GCD.c:177:230
	movaps	.LCPI1_12(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 128(%rax)
	.loc	1 177 260               # GCD.c:177:260
	movaps	.LCPI1_13(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 144(%rax)
	.loc	1 177 290               # GCD.c:177:290
	movaps	.LCPI1_14(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 160(%rax)
	.loc	1 177 318               # GCD.c:177:318
	movaps	.LCPI1_15(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 176(%rax)
	.loc	1 177 347               # GCD.c:177:347
	movq	$101, 192(%rax)
	.loc	1 179 2 is_stmt 1       # GCD.c:179:2
	movl	$25, %esi
	movq	%rax, %rdi
	callq	println_s
.Ltmp43:
.LBB1_12:                               # %blklab7
	.loc	1 183 2                 # GCD.c:183:2
	xorl	%edi, %edi
	callq	exit
.LBB1_14:                               # %if.end3.i
.Ltmp44:
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
.Ltmp45:
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
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git 2af14cc4a90f43170f8ea9c1dfa0f71f46a0621c) (http://llvm.org/git/llvm.git 1e7e2b2b556977af8ccc12b7afba61302f3a2da9)" # string offset=0
.Linfo_string1:
	.asciz	"GCD.c"                 # string offset=165
.Linfo_string2:
	.asciz	"/home/mw169/workspace/WhileyOpenCL/polly/GCD/impl/autogenerate_original_copyonly" # string offset=171
.Linfo_string3:
	.asciz	"gcd"                   # string offset=252
.Linfo_string4:
	.asciz	"long long int"         # string offset=256
.Linfo_string5:
	.asciz	"a"                     # string offset=270
.Linfo_string6:
	.asciz	"b"                     # string offset=272
.Linfo_string7:
	.asciz	"_2"                    # string offset=274
.Linfo_string8:
	.asciz	"_3"                    # string offset=277
.Linfo_string9:
	.asciz	"_4"                    # string offset=280
.Linfo_string10:
	.asciz	"_5"                    # string offset=283
.Linfo_string11:
	.asciz	"_6"                    # string offset=286
.Linfo_string12:
	.asciz	"_7"                    # string offset=289
.Linfo_string13:
	.asciz	"main"                  # string offset=292
.Linfo_string14:
	.asciz	"int"                   # string offset=297
.Linfo_string15:
	.asciz	"argc"                  # string offset=301
.Linfo_string16:
	.asciz	"args"                  # string offset=306
.Linfo_string17:
	.asciz	"char"                  # string offset=311
.Linfo_string18:
	.asciz	"n"                     # string offset=316
.Linfo_string19:
	.asciz	"sum"                   # string offset=318
.Linfo_string20:
	.asciz	"i"                     # string offset=322
.Linfo_string21:
	.asciz	"j"                     # string offset=324
.Linfo_string22:
	.asciz	"_7_size"               # string offset=326
.Linfo_string23:
	.asciz	"_7_size_size"          # string offset=334
.Linfo_string24:
	.asciz	"_8"                    # string offset=347
.Linfo_string25:
	.asciz	"_9_size"               # string offset=350
.Linfo_string26:
	.asciz	"_12_size"              # string offset=358
.Linfo_string27:
	.asciz	"_15"                   # string offset=367
.Linfo_string28:
	.asciz	"_16"                   # string offset=371
.Linfo_string29:
	.asciz	"_17"                   # string offset=375
.Linfo_string30:
	.asciz	"_18"                   # string offset=379
.Linfo_string31:
	.asciz	"_19"                   # string offset=383
.Linfo_string32:
	.asciz	"_20"                   # string offset=387
.Linfo_string33:
	.asciz	"_21"                   # string offset=391
.Linfo_string34:
	.asciz	"_22"                   # string offset=395
.Linfo_string35:
	.asciz	"_23"                   # string offset=399
.Linfo_string36:
	.asciz	"_26_size"              # string offset=403
.Linfo_string37:
	.asciz	"_31_size"              # string offset=412
.Linfo_string38:
	.asciz	"_9"                    # string offset=421
.Linfo_string39:
	.asciz	"max"                   # string offset=424
.Linfo_string40:
	.asciz	"_12"                   # string offset=428
.Linfo_string41:
	.asciz	"_26"                   # string offset=432
.Linfo_string42:
	.asciz	"_31"                   # string offset=436
.Linfo_string43:
	.asciz	"_10"                   # string offset=440
.Linfo_string44:
	.asciz	"_13"                   # string offset=444
.Linfo_string45:
	.asciz	"_24"                   # string offset=448
.Linfo_string46:
	.asciz	"_27"                   # string offset=452
.Linfo_string47:
	.asciz	"_29"                   # string offset=456
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
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp19-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp25-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp33-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp33-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp37-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp37-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp34-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp19-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	4                       # 4
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp32-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp32-.Lfunc_begin0
	.quad	.Ltmp33-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp33-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp33-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp33-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp33-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp34-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp14-.Lfunc_begin0
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
.Ldebug_loc14:
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp37-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp37-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	5                       # 5
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	25                      # 25
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp17-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Ltmp16-.Lfunc_begin0
	.quad	.Ltmp17-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp17-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Ltmp17-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp21-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Ltmp25-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp35-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc23:
	.quad	.Ltmp28-.Lfunc_begin0
	.quad	.Ltmp29-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
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
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
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
	.byte	15                      # Abbreviation Code
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
	.long	821                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x32e DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x1 DW_TAG_pointer_type
	.byte	3                       # Abbrev [3] 0x2b:0x4e DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	121                     # DW_AT_abstract_origin
	.long	121                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x42:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	133                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x4b:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	144                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x54:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	155                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x5a:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	166                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x60:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	177                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x66:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	188                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x6c:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	199                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x72:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	210                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	6                       # Abbrev [6] 0x79:0x65 DW_TAG_subprogram
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	222                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	7                       # Abbrev [7] 0x85:0xb DW_TAG_formal_parameter
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0x90:0xb DW_TAG_formal_parameter
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x9b:0xb DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0xa6:0xb DW_TAG_variable
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0xb1:0xb DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0xbc:0xb DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0xc7:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0xd2:0xb DW_TAG_variable
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0xde:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	10                      # Abbrev [10] 0xe5:0x231 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	790                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	11                      # Abbrev [11] 0xfe:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	790                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x10d:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	797                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x11c:0xf DW_TAG_variable
	.long	.Ldebug_loc4            # DW_AT_location
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x12b:0xf DW_TAG_variable
	.long	.Ldebug_loc5            # DW_AT_location
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	65                      # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x13a:0xf DW_TAG_variable
	.long	.Ldebug_loc6            # DW_AT_location
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	66                      # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x149:0xf DW_TAG_variable
	.long	.Ldebug_loc7            # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	67                      # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x158:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	69                      # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x164:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	69                      # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x170:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x17c:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	71                      # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x188:0xf DW_TAG_variable
	.long	.Ldebug_loc8            # DW_AT_location
	.long	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	73                      # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x197:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	75                      # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x1a3:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	76                      # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0x1af:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	77                      # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1bb:0xf DW_TAG_variable
	.long	.Ldebug_loc9            # DW_AT_location
	.long	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	78                      # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1ca:0xf DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	79                      # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1d9:0xf DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	80                      # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1e8:0xf DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	81                      # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1f7:0xf DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	82                      # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x206:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	83                      # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x215:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	85                      # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x224:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	88                      # DW_AT_decl_line
	.long	222                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x233:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	69                      # DW_AT_decl_line
	.long	814                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x242:0xf DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	71                      # DW_AT_decl_line
	.long	819                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x251:0xf DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	819                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x260:0xf DW_TAG_variable
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	68                      # DW_AT_decl_line
	.long	819                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x26f:0xf DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	73                      # DW_AT_decl_line
	.long	819                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x27e:0xf DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	85                      # DW_AT_decl_line
	.long	819                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x28d:0xf DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	88                      # DW_AT_decl_line
	.long	819                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x29c:0xb DW_TAG_variable
	.long	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	72                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	8                       # Abbrev [8] 0x2a7:0xb DW_TAG_variable
	.long	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	74                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	8                       # Abbrev [8] 0x2b2:0xb DW_TAG_variable
	.long	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	84                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	8                       # Abbrev [8] 0x2bd:0xb DW_TAG_variable
	.long	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	86                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	8                       # Abbrev [8] 0x2c8:0xb DW_TAG_variable
	.long	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	87                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	14                      # Abbrev [14] 0x2d3:0x42 DW_TAG_inlined_subroutine
	.long	121                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	135                     # DW_AT_call_line
	.byte	4                       # Abbrev [4] 0x2de:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc22           # DW_AT_location
	.long	133                     # DW_AT_abstract_origin
	.byte	4                       # Abbrev [4] 0x2e7:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc23           # DW_AT_location
	.long	144                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x2f0:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	155                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x2f6:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	166                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x2fc:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	177                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x302:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	188                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x308:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	199                     # DW_AT_abstract_origin
	.byte	5                       # Abbrev [5] 0x30e:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	210                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0x316:0x7 DW_TAG_base_type
	.long	.Linfo_string14         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	15                      # Abbrev [15] 0x31d:0x5 DW_TAG_pointer_type
	.long	802                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x322:0x5 DW_TAG_pointer_type
	.long	807                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x327:0x7 DW_TAG_base_type
	.long	.Linfo_string17         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	15                      # Abbrev [15] 0x32e:0x5 DW_TAG_pointer_type
	.long	819                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x333:0x5 DW_TAG_pointer_type
	.long	222                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp30-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.quad	.Ltmp32-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
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
	.long	825                     # Compilation Unit Length
	.long	229                     # DIE offset
	.asciz	"main"                  # External Name
	.long	121                     # DIE offset
	.asciz	"gcd"                   # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	825                     # Compilation Unit Length
	.long	222                     # DIE offset
	.asciz	"long long int"         # External Name
	.long	790                     # DIE offset
	.asciz	"int"                   # External Name
	.long	807                     # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git 2af14cc4a90f43170f8ea9c1dfa0f71f46a0621c) (http://llvm.org/git/llvm.git 1e7e2b2b556977af8ccc12b7afba61302f3a2da9)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
