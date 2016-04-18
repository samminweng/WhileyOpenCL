	.text
	.file	"llvm/CoinGame.openmp.enablevc.ll"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI0_0:
	.quad	65                      # 0x41
	.quad	108                     # 0x6c
.LCPI0_1:
	.quad	105                     # 0x69
	.quad	99                      # 0x63
.LCPI0_2:
	.quad	101                     # 0x65
	.quad	32                      # 0x20
.LCPI0_3:
	.quad	116                     # 0x74
	.quad	97                      # 0x61
.LCPI0_4:
	.quad	107                     # 0x6b
	.quad	101                     # 0x65
.LCPI0_5:
	.quad	32                      # 0x20
	.quad	99                      # 0x63
.LCPI0_6:
	.quad	111                     # 0x6f
	.quad	105                     # 0x69
.LCPI0_7:
	.quad	110                     # 0x6e
	.quad	32                      # 0x20
.LCPI0_8:
	.quad	40                      # 0x28
	.quad	32                      # 0x20
.LCPI0_9:
	.quad	66                      # 0x42
	.quad	111                     # 0x6f
.LCPI0_10:
	.quad	98                      # 0x62
	.quad	32                      # 0x20
.LCPI0_11:
	.quad	32                      # 0x20
	.quad	44                      # 0x2c
.LCPI0_12:
	.quad	32                      # 0x20
	.quad	41                      # 0x29
.LCPI0_13:
	.quad	44                      # 0x2c
	.quad	32                      # 0x20
.LCPI0_14:
	.quad	84                      # 0x54
	.quad	104                     # 0x68
.LCPI0_15:
	.quad	116                     # 0x74
	.quad	111                     # 0x6f
.LCPI0_16:
	.quad	108                     # 0x6c
	.quad	32                      # 0x20
.LCPI0_17:
	.quad	97                      # 0x61
	.quad	109                     # 0x6d
.LCPI0_18:
	.quad	111                     # 0x6f
	.quad	117                     # 0x75
.LCPI0_19:
	.quad	110                     # 0x6e
	.quad	116                     # 0x74
.LCPI0_20:
	.quad	32                      # 0x20
	.quad	111                     # 0x6f
.LCPI0_21:
	.quad	102                     # 0x66
	.quad	32                      # 0x20
.LCPI0_22:
	.quad	109                     # 0x6d
	.quad	111                     # 0x6f
.LCPI0_23:
	.quad	110                     # 0x6e
	.quad	101                     # 0x65
.LCPI0_24:
	.quad	121                     # 0x79
	.quad	32                      # 0x20
.LCPI0_25:
	.quad	40                      # 0x28
	.quad	109                     # 0x6d
.LCPI0_26:
	.quad	97                      # 0x61
	.quad	120                     # 0x78
.LCPI0_27:
	.quad	105                     # 0x69
	.quad	109                     # 0x6d
.LCPI0_28:
	.quad	117                     # 0x75
	.quad	109                     # 0x6d
.LCPI0_29:
	.quad	41                      # 0x29
	.quad	32                      # 0x20
.LCPI0_30:
	.quad	103                     # 0x67
	.quad	101                     # 0x65
.LCPI0_31:
	.quad	116                     # 0x74
	.quad	115                     # 0x73
.LCPI0_32:
	.quad	32                      # 0x20
	.quad	105                     # 0x69
.LCPI0_33:
	.quad	115                     # 0x73
	.quad	32                      # 0x20
	.text
	.globl	play
	.p2align	4, 0x90
	.type	play,@function
play:                                   # @play
.Lfunc_begin0:
	.file	1 "CoinGame.c"
	.loc	1 2 0                   # CoinGame.c:2:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp0:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp1:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp2:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp3:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp4:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp5:
	.cfi_def_cfa_offset 56
	subq	$136, %rsp
.Ltmp6:
	.cfi_def_cfa_offset 192
.Ltmp7:
	.cfi_offset %rbx, -56
.Ltmp8:
	.cfi_offset %r12, -48
.Ltmp9:
	.cfi_offset %r13, -40
.Ltmp10:
	.cfi_offset %r14, -32
.Ltmp11:
	.cfi_offset %r15, -24
.Ltmp12:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: play:sys <- %RDI
	#DEBUG_VALUE: play:moves <- %RSI
	#DEBUG_VALUE: play:moves_size <- %RDX
	#DEBUG_VALUE: play:moves_has_ownership [bit_piece offset=0 size=1] <- %ECX
	#DEBUG_VALUE: play:n <- %R8
	movq	%r8, %r15
.Ltmp13:
	#DEBUG_VALUE: play:n <- %R15
	movq	%r15, 112(%rsp)         # 8-byte Spill
	movl	%ecx, %ebx
.Ltmp14:
	#DEBUG_VALUE: play:moves_has_ownership [bit_piece offset=0 size=1] <- %EBX
	movq	%rsi, 80(%rsp)          # 8-byte Spill
.Ltmp15:
	#DEBUG_VALUE: play:_64_has_ownership <- 0
	#DEBUG_VALUE: play:_64_size <- 0
	#DEBUG_VALUE: play:_61 <- 0
	#DEBUG_VALUE: play:_60 <- 0
	#DEBUG_VALUE: play:_59_has_ownership <- 0
	#DEBUG_VALUE: play:_59_size <- 0
	#DEBUG_VALUE: play:_56 <- 0
	#DEBUG_VALUE: play:_55_has_ownership <- 0
	#DEBUG_VALUE: play:_55_size <- 0
	#DEBUG_VALUE: play:_52 <- 0
	#DEBUG_VALUE: play:_51 <- 0
	#DEBUG_VALUE: play:_50 <- 0
	#DEBUG_VALUE: play:_49 <- 0
	#DEBUG_VALUE: play:_48_has_ownership <- 0
	#DEBUG_VALUE: play:_48_size <- 0
	#DEBUG_VALUE: play:_43_has_ownership <- 0
	#DEBUG_VALUE: play:_43_size <- 0
	#DEBUG_VALUE: play:_38_has_ownership <- 0
	#DEBUG_VALUE: play:_38_size <- 0
	#DEBUG_VALUE: play:_35_has_ownership <- 0
	#DEBUG_VALUE: play:_35_size <- 0
	#DEBUG_VALUE: play:_32 <- 0
	#DEBUG_VALUE: play:_31 <- 0
	#DEBUG_VALUE: play:_30 <- 0
	#DEBUG_VALUE: play:_29 <- 0
	#DEBUG_VALUE: play:_28 <- 0
	#DEBUG_VALUE: play:_27 <- 0
	#DEBUG_VALUE: play:_26 <- 0
	#DEBUG_VALUE: play:_25 <- 0
	#DEBUG_VALUE: play:_24 <- 0
	#DEBUG_VALUE: play:_23 <- 0
	#DEBUG_VALUE: play:_22 <- 0
	#DEBUG_VALUE: play:_21 <- 0
	#DEBUG_VALUE: play:_20 <- 0
	#DEBUG_VALUE: play:_19 <- 0
	#DEBUG_VALUE: play:_18 <- 0
	#DEBUG_VALUE: play:_17 <- 0
	#DEBUG_VALUE: play:_16 <- 0
	#DEBUG_VALUE: play:_15 <- 0
	#DEBUG_VALUE: play:_14 <- 0
	#DEBUG_VALUE: play:_13 <- 0
	#DEBUG_VALUE: play:_12 <- 0
	#DEBUG_VALUE: play:_11 <- 0
	#DEBUG_VALUE: play:_10 <- 1
	#DEBUG_VALUE: play:_9 <- 0
	#DEBUG_VALUE: play:coin <- 0
	#DEBUG_VALUE: play:sum_bob <- 0
	#DEBUG_VALUE: play:sum_alice <- 0
	#DEBUG_VALUE: play:i <- 0
	#DEBUG_VALUE: play:right <- 0
	#DEBUG_VALUE: play:left <- 0
	#DEBUG_VALUE: play:moves <- [%RSP+80]
	.loc	1 89 6 prologue_end     # CoinGame.c:89:6
	testq	%r15, %r15
	jle	.LBB0_1
.Ltmp16:
# BB#2:                                 # %if.end.lr.ph
	#DEBUG_VALUE: play:moves <- [%RSP+80]
	#DEBUG_VALUE: play:moves_has_ownership [bit_piece offset=0 size=1] <- %EBX
	#DEBUG_VALUE: play:n <- %R15
	#DEBUG_VALUE: play:moves_size <- %RDX
	#DEBUG_VALUE: play:sys <- %RDI
	movl	%ebx, 92(%rsp)          # 4-byte Spill
	.loc	1 71 7                  # CoinGame.c:71:7
	leaq	-1(%r15), %r12
.Ltmp17:
	#DEBUG_VALUE: play:_11 <- %R12
	#DEBUG_VALUE: play:right <- %R12
	movl	$0, %ebp
	movl	$0, %eax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movl	$0, %eax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movl	$0, %eax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movl	$0, %eax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movl	$0, %r13d
	movl	$0, %eax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movl	$0, %eax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movl	$0, %eax
	movq	%rax, 104(%rsp)         # 8-byte Spill
	movl	$0, %r14d
	xorl	%eax, %eax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
.Ltmp18:
	.p2align	4, 0x90
.LBB0_3:                                # %if.end
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: play:coin <- 0
	#DEBUG_VALUE: play:_15 <- 0
	#DEBUG_VALUE: play:_16 <- 1
	.loc	1 97 11                 # CoinGame.c:97:11
	leaq	1(%rbp), %rdi
.Ltmp19:
	#DEBUG_VALUE: play:_17 <- %RDI
	.loc	1 99 10                 # CoinGame.c:99:10
	movq	%rdi, %rcx
	imulq	%r15, %rcx
.Ltmp20:
	#DEBUG_VALUE: play:_18 <- %RCX
	.loc	1 101 10                # CoinGame.c:101:10
	addq	%r12, %rcx
.Ltmp21:
	#DEBUG_VALUE: play:_19 <- %RCX
	movq	80(%rsp), %rsi          # 8-byte Reload
	.loc	1 103 7                 # CoinGame.c:103:7
	movq	(%rsi,%rcx,8), %rcx
.Ltmp22:
	#DEBUG_VALUE: play:_20 <- %RCX
	.loc	1 105 11                # CoinGame.c:105:11
	movq	%rbp, %rdx
	imulq	%r15, %rdx
.Ltmp23:
	#DEBUG_VALUE: play:_23 <- 1
	#DEBUG_VALUE: play:_21 <- %RDX
	.loc	1 107 10                # CoinGame.c:107:10
	addq	%r12, %rdx
.Ltmp24:
	.loc	1 115 9                 # CoinGame.c:115:9
	cmpq	-8(%rsi,%rdx,8), %rcx
.Ltmp25:
	#DEBUG_VALUE: play:_28 <- 1
	setg	%cl
.Ltmp26:
	.loc	1 115 6 is_stmt 0       # CoinGame.c:115:6
	cmovgq	%rbp, %rdi
.Ltmp27:
	#DEBUG_VALUE: play:_32 <- 0
	#DEBUG_VALUE: play:_30 <- 2
	#DEBUG_VALUE: play:_17 <- %RBP
	movq	%rdi, 128(%rsp)         # 8-byte Spill
	cmovgq	%r12, %rbp
.Ltmp28:
	movzbl	%cl, %eax
	.loc	1 145 6 is_stmt 1       # CoinGame.c:145:6
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	%r13, %r15
	andq	$1, %r15
	je	.LBB0_4
# BB#7:                                 # %blklab4
                                        #   in Loop: Header=BB0_3 Depth=1
.Ltmp29:
	.loc	1 162 3                 # CoinGame.c:162:3
	movq	56(%rsp), %rax          # 8-byte Reload
	testb	$1, %al
	je	.LBB0_9
# BB#8:                                 # %if.then35
                                        #   in Loop: Header=BB0_3 Depth=1
.Ltmp30:
	.loc	1 162 3 is_stmt 0 discriminator 1 # CoinGame.c:162:3
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	free
.Ltmp31:
	#DEBUG_VALUE: play:_38_has_ownership <- 0
.LBB0_9:                                # %if.end36
                                        #   in Loop: Header=BB0_3 Depth=1
	#DEBUG_VALUE: play:_38_size <- 16
	.loc	1 163 3 is_stmt 1       # CoinGame.c:163:3
	movl	$128, %edi
	callq	malloc
.Ltmp32:
	#DEBUG_VALUE: play:_38 <- %RAX
	.loc	1 164 10                # CoinGame.c:164:10
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movaps	.LCPI0_9(%rip), %xmm0   # xmm0 = [66,111]
	movups	%xmm0, (%rax)
	.loc	1 164 37 is_stmt 0      # CoinGame.c:164:37
	movaps	.LCPI0_10(%rip), %xmm0  # xmm0 = [98,32]
	movups	%xmm0, 16(%rax)
	.loc	1 164 63                # CoinGame.c:164:63
	movaps	.LCPI0_3(%rip), %xmm0   # xmm0 = [116,97]
	movups	%xmm0, 32(%rax)
	.loc	1 164 90                # CoinGame.c:164:90
	movaps	.LCPI0_4(%rip), %xmm0   # xmm0 = [107,101]
	movups	%xmm0, 48(%rax)
	.loc	1 164 118               # CoinGame.c:164:118
	movaps	.LCPI0_5(%rip), %xmm0   # xmm0 = [32,99]
	movups	%xmm0, 64(%rax)
	.loc	1 164 145               # CoinGame.c:164:145
	movaps	.LCPI0_6(%rip), %xmm0   # xmm0 = [111,105]
	movups	%xmm0, 80(%rax)
	.loc	1 164 175               # CoinGame.c:164:175
	movaps	.LCPI0_7(%rip), %xmm0   # xmm0 = [110,32]
	movups	%xmm0, 96(%rax)
	.loc	1 164 204               # CoinGame.c:164:204
	movaps	.LCPI0_8(%rip), %xmm0   # xmm0 = [40,32]
	movups	%xmm0, 112(%rax)
.Ltmp33:
	#DEBUG_VALUE: play:_38_has_ownership <- 1
	.loc	1 167 3 is_stmt 1       # CoinGame.c:167:3
	movl	$16, %esi
	movq	%rax, %rdi
.Ltmp34:
	#DEBUG_VALUE: play:_38 <- [%RSP+8]
	callq	printf_s
.Ltmp35:
	movb	$1, %al
	movq	%rax, 56(%rsp)          # 8-byte Spill
	jmp	.LBB0_10
	.p2align	4, 0x90
.LBB0_4:                                # %if.end13
                                        #   in Loop: Header=BB0_3 Depth=1
.Ltmp36:
	.loc	1 149 3                 # CoinGame.c:149:3
	movq	48(%rsp), %rax          # 8-byte Reload
	testb	$1, %al
	je	.LBB0_6
# BB#5:                                 # %if.then14
                                        #   in Loop: Header=BB0_3 Depth=1
.Ltmp37:
	.loc	1 149 3 is_stmt 0 discriminator 1 # CoinGame.c:149:3
	movq	(%rsp), %rdi            # 8-byte Reload
	callq	free
.Ltmp38:
	#DEBUG_VALUE: play:_35_has_ownership <- 0
.LBB0_6:                                # %if.end15
                                        #   in Loop: Header=BB0_3 Depth=1
	#DEBUG_VALUE: play:_35_size <- 18
	.loc	1 150 3 is_stmt 1       # CoinGame.c:150:3
	movl	$144, %edi
	callq	malloc
.Ltmp39:
	#DEBUG_VALUE: play:_35 <- %RAX
	.loc	1 151 10                # CoinGame.c:151:10
	movq	%rax, (%rsp)            # 8-byte Spill
	movaps	.LCPI0_0(%rip), %xmm0   # xmm0 = [65,108]
	movups	%xmm0, (%rax)
	.loc	1 151 37 is_stmt 0      # CoinGame.c:151:37
	movaps	.LCPI0_1(%rip), %xmm0   # xmm0 = [105,99]
	movups	%xmm0, 16(%rax)
	.loc	1 151 64                # CoinGame.c:151:64
	movaps	.LCPI0_2(%rip), %xmm0   # xmm0 = [101,32]
	movups	%xmm0, 32(%rax)
	.loc	1 164 63 is_stmt 1      # CoinGame.c:164:63
	movaps	.LCPI0_3(%rip), %xmm0   # xmm0 = [116,97]
	.loc	1 151 91                # CoinGame.c:151:91
	movups	%xmm0, 48(%rax)
	.loc	1 164 90                # CoinGame.c:164:90
	movaps	.LCPI0_4(%rip), %xmm0   # xmm0 = [107,101]
	.loc	1 151 118               # CoinGame.c:151:118
	movups	%xmm0, 64(%rax)
	.loc	1 164 118               # CoinGame.c:164:118
	movaps	.LCPI0_5(%rip), %xmm0   # xmm0 = [32,99]
	.loc	1 151 147               # CoinGame.c:151:147
	movups	%xmm0, 80(%rax)
	.loc	1 164 145               # CoinGame.c:164:145
	movaps	.LCPI0_6(%rip), %xmm0   # xmm0 = [111,105]
	.loc	1 151 175               # CoinGame.c:151:175
	movups	%xmm0, 96(%rax)
	.loc	1 164 175               # CoinGame.c:164:175
	movaps	.LCPI0_7(%rip), %xmm0   # xmm0 = [110,32]
	.loc	1 151 205               # CoinGame.c:151:205
	movups	%xmm0, 112(%rax)
	.loc	1 164 204               # CoinGame.c:164:204
	movaps	.LCPI0_8(%rip), %xmm0   # xmm0 = [40,32]
	.loc	1 151 234               # CoinGame.c:151:234
	movups	%xmm0, 128(%rax)
.Ltmp40:
	#DEBUG_VALUE: play:_35_has_ownership <- 1
	.loc	1 154 3                 # CoinGame.c:154:3
	movl	$18, %esi
	movq	%rax, %rdi
.Ltmp41:
	#DEBUG_VALUE: play:_35 <- [%RSP+0]
	callq	printf_s
.Ltmp42:
	movb	$1, %al
	.loc	1 156 3                 # CoinGame.c:156:3
	movq	%rax, 48(%rsp)          # 8-byte Spill
.LBB0_10:                               # %blklab5
                                        #   in Loop: Header=BB0_3 Depth=1
	.loc	1 173 3                 # CoinGame.c:173:3
	movl	$.L.str, %edi
	xorl	%eax, %eax
	movq	%r13, %rsi
	callq	printf
	.loc	1 177 3                 # CoinGame.c:177:3
	testb	$1, %r14b
	je	.LBB0_12
# BB#11:                                # %if.then56
                                        #   in Loop: Header=BB0_3 Depth=1
.Ltmp43:
	.loc	1 177 3 is_stmt 0 discriminator 1 # CoinGame.c:177:3
	movq	24(%rsp), %rdi          # 8-byte Reload
	callq	free
.Ltmp44:
	#DEBUG_VALUE: play:_43_has_ownership <- 0
.LBB0_12:                               # %if.end57
                                        #   in Loop: Header=BB0_3 Depth=1
	#DEBUG_VALUE: play:_43_size <- 3
	.loc	1 178 3 is_stmt 1       # CoinGame.c:178:3
	movl	$24, %edi
	callq	malloc
.Ltmp45:
	#DEBUG_VALUE: play:_43 <- %RAX
	.loc	1 179 10                # CoinGame.c:179:10
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movaps	.LCPI0_11(%rip), %xmm0  # xmm0 = [32,44]
	movups	%xmm0, (%rax)
	.loc	1 179 36 is_stmt 0      # CoinGame.c:179:36
	movq	$32, 16(%rax)
.Ltmp46:
	#DEBUG_VALUE: play:_43_has_ownership <- 1
	.loc	1 182 3 is_stmt 1       # CoinGame.c:182:3
	movl	$3, %esi
	movq	%rax, %rdi
.Ltmp47:
	#DEBUG_VALUE: play:_43 <- [%RSP+24]
	callq	printf_s
.Ltmp48:
	.loc	1 186 3                 # CoinGame.c:186:3
	movl	$.L.str, %edi
	xorl	%eax, %eax
	movq	%rbp, %rsi
	callq	printf
	.loc	1 190 3                 # CoinGame.c:190:3
	testb	$1, %r14b
	je	.LBB0_14
# BB#13:                                # %if.then64
                                        #   in Loop: Header=BB0_3 Depth=1
.Ltmp49:
	.loc	1 190 3 is_stmt 0 discriminator 1 # CoinGame.c:190:3
	movq	32(%rsp), %rdi          # 8-byte Reload
	callq	free
.Ltmp50:
	#DEBUG_VALUE: play:_48_has_ownership <- 0
.LBB0_14:                               # %if.end65
                                        #   in Loop: Header=BB0_3 Depth=1
	#DEBUG_VALUE: play:_48_size <- 2
	.loc	1 191 3 is_stmt 1       # CoinGame.c:191:3
	movl	$16, %edi
	callq	malloc
	movq	%rax, %rbx
.Ltmp51:
	#DEBUG_VALUE: play:_48 <- %RBX
	.loc	1 192 10                # CoinGame.c:192:10
	movaps	.LCPI0_12(%rip), %xmm0  # xmm0 = [32,41]
	movups	%xmm0, (%rbx)
.Ltmp52:
	#DEBUG_VALUE: play:_48_has_ownership <- 1
	.loc	1 195 3                 # CoinGame.c:195:3
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	printf_s
	testq	%r15, %r15
	#DEBUG_VALUE: play:_51 <- 0
.Ltmp53:
	#DEBUG_VALUE: play:_49 <- 2
	je	.LBB0_15
.Ltmp54:
# BB#18:                                # %polly.split_new_and_old393
                                        #   in Loop: Header=BB0_3 Depth=1
	#DEBUG_VALUE: play:_48 <- %RBX
	movq	72(%rsp), %rax          # 8-byte Reload
	testb	$1, %al
	movq	112(%rsp), %r15         # 8-byte Reload
	je	.LBB0_20
.Ltmp55:
# BB#19:                                # %if.then82
                                        #   in Loop: Header=BB0_3 Depth=1
	#DEBUG_VALUE: play:_48 <- %RBX
	.loc	1 228 3 discriminator 1 # CoinGame.c:228:3
	movq	16(%rsp), %rdi          # 8-byte Reload
	callq	free
.Ltmp56:
	#DEBUG_VALUE: play:_59_has_ownership <- 0
.LBB0_20:                               # %if.end83
                                        #   in Loop: Header=BB0_3 Depth=1
	#DEBUG_VALUE: play:_48 <- %RBX
	#DEBUG_VALUE: play:_59_size <- 1
	movq	%rbx, 32(%rsp)          # 8-byte Spill
	addq	%rbp, 104(%rsp)         # 8-byte Folded Spill
	.loc	1 229 3                 # CoinGame.c:229:3
	movl	$8, %edi
	callq	malloc
.Ltmp57:
	#DEBUG_VALUE: play:_59 <- %RAX
	.loc	1 230 10                # CoinGame.c:230:10
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	$32, (%rax)
.Ltmp58:
	#DEBUG_VALUE: play:_59_has_ownership <- 1
	.loc	1 233 3                 # CoinGame.c:233:3
	movl	$1, %esi
	movq	%rax, %rdi
.Ltmp59:
	#DEBUG_VALUE: play:_59 <- [%RSP+16]
	callq	println_s
.Ltmp60:
	movb	$1, %al
	movq	%rax, 72(%rsp)          # 8-byte Spill
	jmp	.LBB0_21
.Ltmp61:
	.p2align	4, 0x90
.LBB0_15:                               # %polly.split_new_and_old
                                        #   in Loop: Header=BB0_3 Depth=1
	#DEBUG_VALUE: play:_48 <- %RBX
	movq	64(%rsp), %rax          # 8-byte Reload
	testb	$1, %al
	movq	112(%rsp), %r15         # 8-byte Reload
	je	.LBB0_17
.Ltmp62:
# BB#16:                                # %if.then75
                                        #   in Loop: Header=BB0_3 Depth=1
	#DEBUG_VALUE: play:_48 <- %RBX
	.loc	1 211 3 discriminator 1 # CoinGame.c:211:3
	movq	40(%rsp), %rdi          # 8-byte Reload
	callq	free
.Ltmp63:
	#DEBUG_VALUE: play:_55_has_ownership <- 0
.LBB0_17:                               # %if.end76
                                        #   in Loop: Header=BB0_3 Depth=1
	#DEBUG_VALUE: play:_48 <- %RBX
	#DEBUG_VALUE: play:_55_size <- 2
	movq	%rbx, 32(%rsp)          # 8-byte Spill
	addq	%rbp, 96(%rsp)          # 8-byte Folded Spill
	.loc	1 212 3                 # CoinGame.c:212:3
	movl	$16, %edi
	callq	malloc
.Ltmp64:
	#DEBUG_VALUE: play:_55 <- %RAX
	.loc	1 213 10                # CoinGame.c:213:10
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movaps	.LCPI0_13(%rip), %xmm0  # xmm0 = [44,32]
	movups	%xmm0, (%rax)
.Ltmp65:
	#DEBUG_VALUE: play:_55_has_ownership <- 1
	.loc	1 216 3                 # CoinGame.c:216:3
	movl	$2, %esi
	movq	%rax, %rdi
.Ltmp66:
	#DEBUG_VALUE: play:_55 <- [%RSP+40]
	callq	printf_s
.Ltmp67:
	movb	$1, %al
	.loc	1 218 3                 # CoinGame.c:218:3
	movq	%rax, 64(%rsp)          # 8-byte Spill
.Ltmp68:
.LBB0_21:                               # %blklab7
                                        #   in Loop: Header=BB0_3 Depth=1
	#DEBUG_VALUE: play:_48 <- %RBX
	.loc	1 115 6                 # CoinGame.c:115:6
	subq	120(%rsp), %r12         # 8-byte Folded Reload
.Ltmp69:
	#DEBUG_VALUE: play:_60 <- 1
	#DEBUG_VALUE: play:coin <- %R12
	.loc	1 239 8                 # CoinGame.c:239:8
	incq	%r13
.Ltmp70:
	#DEBUG_VALUE: play:_61 <- %R13
	#DEBUG_VALUE: play:i <- %R13
	movb	$1, %r14b
	.loc	1 89 6                  # CoinGame.c:89:6
	cmpq	%r13, %r15
	movq	128(%rsp), %rbp         # 8-byte Reload
	jne	.LBB0_3
.Ltmp71:
# BB#22:                                # %blklab0
	#DEBUG_VALUE: play:_48 <- %RBX
	#DEBUG_VALUE: play:i <- %R13
	#DEBUG_VALUE: play:_61 <- %R13
	#DEBUG_VALUE: play:coin <- %R12
	movb	$1, %r14b
	movq	104(%rsp), %r15         # 8-byte Reload
.Ltmp72:
	.loc	1 250 6                 # CoinGame.c:250:6
	cmpq	%r15, 96(%rsp)          # 8-byte Folded Reload
	movl	92(%rsp), %ebx          # 4-byte Reload
.Ltmp73:
	movq	40(%rsp), %r12          # 8-byte Reload
.Ltmp74:
	movq	72(%rsp), %r13          # 8-byte Reload
.Ltmp75:
	jge	.LBB0_23
# BB#36:                                # %if.end89
	.loc	1 252 11                # CoinGame.c:252:11
	movq	stderr(%rip), %rcx
	.loc	1 252 3 is_stmt 0       # CoinGame.c:252:3
	movl	$.L.str.1, %edi
	movl	$4, %esi
	movl	$1, %edx
	callq	fwrite
	.loc	1 253 3 is_stmt 1       # CoinGame.c:253:3
	movl	$-1, %edi
	callq	exit
.Ltmp76:
.LBB0_1:
	#DEBUG_VALUE: play:moves <- [%RSP+80]
	#DEBUG_VALUE: play:moves_has_ownership [bit_piece offset=0 size=1] <- %EBX
	#DEBUG_VALUE: play:n <- %R15
	#DEBUG_VALUE: play:moves_size <- %RDX
	#DEBUG_VALUE: play:sys <- %RDI
	xorl	%eax, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	xorl	%r14d, %r14d
	xorl	%eax, %eax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	xorl	%r12d, %r12d
	xorl	%eax, %eax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	xorl	%r13d, %r13d
	xorl	%r15d, %r15d
.Ltmp77:
.LBB0_23:                               # %if.end93
	#DEBUG_VALUE: play:moves_has_ownership [bit_piece offset=0 size=1] <- %BL
	#DEBUG_VALUE: play:_64_size <- 48
	.loc	1 262 2                 # CoinGame.c:262:2
	movl	$384, %edi              # imm = 0x180
	callq	malloc
	movq	%rax, %rbp
.Ltmp78:
	#DEBUG_VALUE: play:_64 <- %RBP
	.loc	1 263 9                 # CoinGame.c:263:9
	movaps	.LCPI0_14(%rip), %xmm0  # xmm0 = [84,104]
	movups	%xmm0, (%rbp)
	.loc	1 263 36 is_stmt 0      # CoinGame.c:263:36
	movaps	.LCPI0_2(%rip), %xmm0   # xmm0 = [101,32]
	movups	%xmm0, 16(%rbp)
	.loc	1 263 63                # CoinGame.c:263:63
	movaps	.LCPI0_15(%rip), %xmm0  # xmm0 = [116,111]
	movups	%xmm0, 32(%rbp)
	.loc	1 263 91                # CoinGame.c:263:91
	movaps	.LCPI0_3(%rip), %xmm0   # xmm0 = [116,97]
	movups	%xmm0, 48(%rbp)
	.loc	1 263 118               # CoinGame.c:263:118
	movaps	.LCPI0_16(%rip), %xmm0  # xmm0 = [108,32]
	movups	%xmm0, 64(%rbp)
	.loc	1 263 146               # CoinGame.c:263:146
	movaps	.LCPI0_17(%rip), %xmm0  # xmm0 = [97,109]
	movups	%xmm0, 80(%rbp)
	.loc	1 263 175               # CoinGame.c:263:175
	movaps	.LCPI0_18(%rip), %xmm0  # xmm0 = [111,117]
	movups	%xmm0, 96(%rbp)
	.loc	1 263 205               # CoinGame.c:263:205
	movaps	.LCPI0_19(%rip), %xmm0  # xmm0 = [110,116]
	movups	%xmm0, 112(%rbp)
	.loc	1 263 235               # CoinGame.c:263:235
	movaps	.LCPI0_20(%rip), %xmm0  # xmm0 = [32,111]
	movups	%xmm0, 128(%rbp)
	.loc	1 263 264               # CoinGame.c:263:264
	movaps	.LCPI0_21(%rip), %xmm0  # xmm0 = [102,32]
	movups	%xmm0, 144(%rbp)
	.loc	1 263 293               # CoinGame.c:263:293
	movaps	.LCPI0_22(%rip), %xmm0  # xmm0 = [109,111]
	movups	%xmm0, 160(%rbp)
	.loc	1 263 323               # CoinGame.c:263:323
	movaps	.LCPI0_23(%rip), %xmm0  # xmm0 = [110,101]
	movups	%xmm0, 176(%rbp)
	.loc	1 263 353               # CoinGame.c:263:353
	movaps	.LCPI0_24(%rip), %xmm0  # xmm0 = [121,32]
	movups	%xmm0, 192(%rbp)
	.loc	1 263 382               # CoinGame.c:263:382
	movaps	.LCPI0_25(%rip), %xmm0  # xmm0 = [40,109]
	movups	%xmm0, 208(%rbp)
	.loc	1 263 411               # CoinGame.c:263:411
	movaps	.LCPI0_26(%rip), %xmm0  # xmm0 = [97,120]
	movups	%xmm0, 224(%rbp)
	.loc	1 263 440               # CoinGame.c:263:440
	movaps	.LCPI0_27(%rip), %xmm0  # xmm0 = [105,109]
	movups	%xmm0, 240(%rbp)
	.loc	1 263 470               # CoinGame.c:263:470
	movaps	.LCPI0_28(%rip), %xmm0  # xmm0 = [117,109]
	movups	%xmm0, 256(%rbp)
	.loc	1 263 500               # CoinGame.c:263:500
	movaps	.LCPI0_29(%rip), %xmm0  # xmm0 = [41,32]
	movups	%xmm0, 272(%rbp)
	.loc	1 263 528               # CoinGame.c:263:528
	movaps	.LCPI0_9(%rip), %xmm0   # xmm0 = [66,111]
	movups	%xmm0, 288(%rbp)
	.loc	1 263 557               # CoinGame.c:263:557
	movaps	.LCPI0_10(%rip), %xmm0  # xmm0 = [98,32]
	movups	%xmm0, 304(%rbp)
	.loc	1 263 585               # CoinGame.c:263:585
	movaps	.LCPI0_30(%rip), %xmm0  # xmm0 = [103,101]
	movups	%xmm0, 320(%rbp)
	.loc	1 263 615               # CoinGame.c:263:615
	movaps	.LCPI0_31(%rip), %xmm0  # xmm0 = [116,115]
	movups	%xmm0, 336(%rbp)
	.loc	1 263 645               # CoinGame.c:263:645
	movaps	.LCPI0_32(%rip), %xmm0  # xmm0 = [32,105]
	movups	%xmm0, 352(%rbp)
	.loc	1 263 674               # CoinGame.c:263:674
	movaps	.LCPI0_33(%rip), %xmm0  # xmm0 = [115,32]
	movups	%xmm0, 368(%rbp)
.Ltmp79:
	#DEBUG_VALUE: play:_64_has_ownership <- 1
	.loc	1 266 2 is_stmt 1       # CoinGame.c:266:2
	movl	$48, %esi
	movq	%rbp, %rdi
	callq	printf_s
	.loc	1 270 2                 # CoinGame.c:270:2
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	movq	%r15, %rsi
	callq	printf
	.loc	1 272 2                 # CoinGame.c:272:2
	testb	%bl, %bl
	je	.LBB0_25
.Ltmp80:
# BB#24:                                # %if.then145
	#DEBUG_VALUE: play:_64 <- %RBP
	#DEBUG_VALUE: play:moves_has_ownership [bit_piece offset=0 size=1] <- %BL
	.loc	1 272 2 is_stmt 0 discriminator 1 # CoinGame.c:272:2
	movq	80(%rsp), %rdi          # 8-byte Reload
	callq	free
.Ltmp81:
	#DEBUG_VALUE: play:moves_has_ownership <- 0
.LBB0_25:                               # %if.end146
	#DEBUG_VALUE: play:_64 <- %RBP
	.loc	1 273 2 is_stmt 1       # CoinGame.c:273:2
	movq	48(%rsp), %rax          # 8-byte Reload
	testb	$1, %al
	je	.LBB0_27
.Ltmp82:
# BB#26:                                # %if.then148
	#DEBUG_VALUE: play:_64 <- %RBP
	.loc	1 273 2 is_stmt 0 discriminator 1 # CoinGame.c:273:2
	movq	(%rsp), %rdi            # 8-byte Reload
	callq	free
.Ltmp83:
	#DEBUG_VALUE: play:_35_has_ownership <- 0
.LBB0_27:                               # %if.end149
	#DEBUG_VALUE: play:_64 <- %RBP
	.loc	1 274 2 is_stmt 1       # CoinGame.c:274:2
	movq	56(%rsp), %rax          # 8-byte Reload
	testb	$1, %al
	je	.LBB0_29
.Ltmp84:
# BB#28:                                # %if.then151
	#DEBUG_VALUE: play:_64 <- %RBP
	.loc	1 274 2 is_stmt 0 discriminator 1 # CoinGame.c:274:2
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	free
.Ltmp85:
	#DEBUG_VALUE: play:_38_has_ownership <- 0
.LBB0_29:                               # %if.end152
	#DEBUG_VALUE: play:_64 <- %RBP
	.loc	1 275 2 is_stmt 1       # CoinGame.c:275:2
	testb	%r14b, %r14b
	je	.LBB0_31
.Ltmp86:
# BB#30:                                # %if.then154
	#DEBUG_VALUE: play:_64 <- %RBP
	.loc	1 275 2 is_stmt 0 discriminator 1 # CoinGame.c:275:2
	movq	24(%rsp), %rdi          # 8-byte Reload
	callq	free
.Ltmp87:
	#DEBUG_VALUE: play:_43_has_ownership <- 0
	.loc	1 276 2 is_stmt 1 discriminator 1 # CoinGame.c:276:2
	movq	32(%rsp), %rdi          # 8-byte Reload
	callq	free
.Ltmp88:
	#DEBUG_VALUE: play:_48_has_ownership <- 0
.LBB0_31:                               # %if.end158
	#DEBUG_VALUE: play:_64 <- %RBP
	.loc	1 277 2                 # CoinGame.c:277:2
	movq	64(%rsp), %rax          # 8-byte Reload
	testb	$1, %al
	je	.LBB0_33
.Ltmp89:
# BB#32:                                # %if.then160
	#DEBUG_VALUE: play:_64 <- %RBP
	.loc	1 277 2 is_stmt 0 discriminator 1 # CoinGame.c:277:2
	movq	%r12, %rdi
	callq	free
.Ltmp90:
	#DEBUG_VALUE: play:_55_has_ownership <- 0
.LBB0_33:                               # %if.end161
	#DEBUG_VALUE: play:_64 <- %RBP
	.loc	1 278 2 is_stmt 1       # CoinGame.c:278:2
	testb	$1, %r13b
	je	.LBB0_35
.Ltmp91:
# BB#34:                                # %if.then163
	#DEBUG_VALUE: play:_64 <- %RBP
	.loc	1 278 2 is_stmt 0 discriminator 1 # CoinGame.c:278:2
	movq	16(%rsp), %rdi          # 8-byte Reload
	callq	free
.Ltmp92:
	#DEBUG_VALUE: play:_59_has_ownership <- 0
.LBB0_35:                               # %if.then166
	#DEBUG_VALUE: play:_64 <- %RBP
	.loc	1 279 2 is_stmt 1 discriminator 1 # CoinGame.c:279:2
	movq	%rbp, %rdi
	addq	$136, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
.Ltmp93:
	jmp	free                    # TAILCALL
.Ltmp94:
.Lfunc_end0:
	.size	play, .Lfunc_end0-play
	.cfi_endproc

	.globl	findMoves
	.p2align	4, 0x90
	.type	findMoves,@function
findMoves:                              # @findMoves
.Lfunc_begin1:
	.loc	1 283 0                 # CoinGame.c:283:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp95:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp96:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp97:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp98:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp99:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp100:
	.cfi_def_cfa_offset 56
.Ltmp101:
	.cfi_offset %rbx, -56
.Ltmp102:
	.cfi_offset %r12, -48
.Ltmp103:
	.cfi_offset %r13, -40
.Ltmp104:
	.cfi_offset %r14, -32
.Ltmp105:
	.cfi_offset %r15, -24
.Ltmp106:
	.cfi_offset %rbp, -16
	movabsq	$9223372036854775807, %r10 # imm = 0x7FFFFFFFFFFFFFFF
	xorl	%r9d, %r9d
	cmpq	%r10, %rcx
	jne	.LBB1_16
# BB#1:
	movq	%r10, %r8
	.p2align	4, 0x90
.LBB1_2:                                # %while.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_3 Depth 2
	movq	%r9, %rsi
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB1_3:                                # %if.end5
                                        #   Parent Loop BB1_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp107:
	#DEBUG_VALUE: findMoves:_11 <- 0
	#DEBUG_VALUE: findMoves:y <- 0
	#DEBUG_VALUE: findMoves:_12 <- 1
	.loc	1 296 12 prologue_end   # CoinGame.c:296:12
	leaq	(%r9,%rbx), %rbp
.Ltmp108:
	.loc	1 365 10                # CoinGame.c:365:10
	leaq	(%rbx,%r10), %rax
.Ltmp109:
	.loc	1 373 10                # CoinGame.c:373:10
	testq	%rbp, %rbp
.Ltmp110:
	#DEBUG_VALUE: findMoves:_16 <- 0
	#DEBUG_VALUE: findMoves:_14 <- 1
	jle	.LBB1_4
.Ltmp111:
# BB#5:                                 # %if.end5
                                        #   in Loop: Header=BB1_3 Depth=2
	cmpq	$-3, %rax
	movl	$0, %ecx
	je	.LBB1_7
# BB#6:                                 # %if.end11
                                        #   in Loop: Header=BB1_3 Depth=2
.Ltmp112:
	#DEBUG_VALUE: findMoves:_17 <- 1
	#DEBUG_VALUE: findMoves:_21 <- 1
	.loc	1 387 8                 # CoinGame.c:387:8
	leaq	(%rsi,%r10), %rcx
	movq	-8(%rdi,%rcx,8), %rcx
.Ltmp113:
	#DEBUG_VALUE: findMoves:_23 <- %RCX
	#DEBUG_VALUE: findMoves:y <- %RCX
	jmp	.LBB1_7
.Ltmp114:
	.p2align	4, 0x90
.LBB1_4:                                #   in Loop: Header=BB1_3 Depth=2
	xorl	%ecx, %ecx
.LBB1_7:                                # %blklab13
                                        #   in Loop: Header=BB1_3 Depth=2
.Ltmp115:
	#DEBUG_VALUE: findMoves:_24 <- 0
	#DEBUG_VALUE: findMoves:x <- 0
	#DEBUG_VALUE: findMoves:_25 <- 2
	.loc	1 401 10                # CoinGame.c:401:10
	cmpq	$-4, %rax
	movl	$0, %eax
	je	.LBB1_9
.Ltmp116:
# BB#8:                                 # %if.end18
                                        #   in Loop: Header=BB1_3 Depth=2
	#DEBUG_VALUE: findMoves:_27 <- 2
	.loc	1 411 8                 # CoinGame.c:411:8
	movq	-16(%rdi,%rsi,8), %rax
.Ltmp117:
	#DEBUG_VALUE: findMoves:_31 <- %RAX
	#DEBUG_VALUE: findMoves:x <- %RAX
.LBB1_9:                                # %blklab14
                                        #   in Loop: Header=BB1_3 Depth=2
	.loc	1 363 9                 # CoinGame.c:363:9
	leaq	1(%rbx), %r11
.Ltmp118:
	#DEBUG_VALUE: findMoves:_35 <- 0
	#DEBUG_VALUE: findMoves:_33 <- 1
	#DEBUG_VALUE: findMoves:z <- 0
	#DEBUG_VALUE: findMoves:_32 <- 0
	#DEBUG_VALUE: findMoves:_13 <- %R11
	#DEBUG_VALUE: findMoves:_18 <- %R11
	#DEBUG_VALUE: findMoves:_52 <- %R11
	#DEBUG_VALUE: findMoves:i <- %R11
	.loc	1 427 10                # CoinGame.c:427:10
	cmpq	$2, %rbp
	movl	$0, %edx
	jl	.LBB1_11
.Ltmp119:
# BB#10:                                # %if.end26
                                        #   in Loop: Header=BB1_3 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R11
	#DEBUG_VALUE: findMoves:_52 <- %R11
	#DEBUG_VALUE: findMoves:_18 <- %R11
	#DEBUG_VALUE: findMoves:_13 <- %R11
	#DEBUG_VALUE: findMoves:_38 <- 2
	.loc	1 437 8                 # CoinGame.c:437:8
	movq	-16(%rdi,%rsi,8), %rdx
.Ltmp120:
	#DEBUG_VALUE: findMoves:_40 <- %RDX
	#DEBUG_VALUE: findMoves:z <- %RDX
.LBB1_11:                               # %blklab15
                                        #   in Loop: Header=BB1_3 Depth=2
	#DEBUG_VALUE: findMoves:i <- %R11
	#DEBUG_VALUE: findMoves:_52 <- %R11
	#DEBUG_VALUE: findMoves:_18 <- %R11
	#DEBUG_VALUE: findMoves:_13 <- %R11
	#DEBUG_VALUE: findMoves:x <- %RCX
	.loc	1 459 10                # CoinGame.c:459:10
	notq	%rcx
.Ltmp121:
	notq	%rax
	cmpq	%rax, %rcx
	cmovgeq	%rcx, %rax
	negq	%rax
	leaq	-1(%rbx,%rax), %rax
	notq	%rdx
	cmpq	%rdx, %rcx
	cmovgeq	%rcx, %rdx
	subq	%rdx, %rbp
	decq	%rbp
	cmpq	%rbp, %rax
.Ltmp122:
	.loc	1 469 4                 # CoinGame.c:469:4
	cmovgeq	%rax, %rbp
.Ltmp123:
	#DEBUG_VALUE: findMoves:_51 <- 1
	#DEBUG_VALUE: findMoves:_49 <- 1
	.loc	1 467 15                # CoinGame.c:467:15
	movq	%rbp, (%rdi,%rsi,8)
	.loc	1 355 7                 # CoinGame.c:355:7
	leaq	1(%rsi,%r10), %rsi
	cmpq	%r11, %r8
	movq	%r11, %rbx
	jne	.LBB1_3
.Ltmp124:
# BB#12:                                # %blklab11
                                        #   in Loop: Header=BB1_2 Depth=1
	#DEBUG_VALUE: findMoves:_13 <- %R11
	#DEBUG_VALUE: findMoves:_18 <- %R11
	#DEBUG_VALUE: findMoves:_52 <- %R11
	#DEBUG_VALUE: findMoves:i <- %R11
	#DEBUG_VALUE: findMoves:_53 <- 1
	.loc	1 502 8                 # CoinGame.c:502:8
	incq	%r9
.Ltmp125:
	#DEBUG_VALUE: findMoves:s <- %R9
	#DEBUG_VALUE: findMoves:_54 <- %R9
	.loc	1 345 6                 # CoinGame.c:345:6
	decq	%r8
	cmpq	%r10, %r9
	jne	.LBB1_2
	jmp	.LBB1_13
.Ltmp126:
.LBB1_16:                               # %polly.loop_if
	.loc	1 345 7 is_stmt 0       # CoinGame.c:345:7
	testq	%rcx, %rcx
	jle	.LBB1_13
.Ltmp127:
# BB#17:                                # %polly.loop_preheader
	leaq	-8(%rdi,%rcx,8), %rax
	movq	%rax, -8(%rsp)          # 8-byte Spill
	leaq	8(,%rcx,8), %r10
	movq	%rcx, %rax
	shlq	$4, %rax
	addq	%rdi, %rax
	movq	%rax, -16(%rsp)         # 8-byte Spill
	leaq	-16(%rdi), %rax
	movq	%rax, -24(%rsp)         # 8-byte Spill
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB1_14:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_18 Depth 2
                                        #     Child Loop BB1_25 Depth 2
	movq	%rcx, %r9
	subq	%r14, %r9
	jle	.LBB1_15
# BB#24:                                # %polly.loop_preheader158
                                        #   in Loop: Header=BB1_14 Depth=1
	movq	-8(%rsp), %rax          # 8-byte Reload
	leaq	(%rax,%r14,8), %rax
	movq	%rax, -40(%rsp)         # 8-byte Spill
	movq	-16(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%r14,8), %rax
	movq	%rax, -56(%rsp)         # 8-byte Spill
	movq	-24(%rsp), %rax         # 8-byte Reload
	leaq	(%rax,%r14,8), %rax
	movq	%rax, -64(%rsp)         # 8-byte Spill
	leaq	(%rdi,%r14,8), %rax
	movq	%rax, -48(%rsp)         # 8-byte Spill
	leaq	(%r14,%rcx), %rax
	movq	%rax, -32(%rsp)         # 8-byte Spill
	decq	%r9
	cmpq	$3, %rcx
	movl	$0, %ebx
	movl	$0, %ebp
	jl	.LBB1_18
	.p2align	4, 0x90
.LBB1_25:                               # %polly.loop_header157.us
                                        #   Parent Loop BB1_14 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	2(%rbp), %rax
	leaq	(%rbp,%r14), %rbx
	cmpq	%rcx, %rax
	jg	.LBB1_27
# BB#26:                                # %polly.loop_header157.us
                                        #   in Loop: Header=BB1_25 Depth=2
	testq	%rbx, %rbx
	jle	.LBB1_27
# BB#30:                                # %polly.cond168.thread.us
                                        #   in Loop: Header=BB1_25 Depth=2
	movq	%rbp, %rax
	imulq	%r10, %rax
	movq	-40(%rsp), %rdx         # 8-byte Reload
	movq	(%rdx,%rax), %r12
	testq	%rbp, %rbp
	sete	%r15b
	leaq	1(%rbp), %r8
	jmp	.LBB1_31
	.p2align	4, 0x90
.LBB1_27:                               # %polly.cond168.us
                                        #   in Loop: Header=BB1_25 Depth=2
	testq	%rbp, %rbp
	sete	%r15b
	leaq	1(%rbp), %r8
	cmpq	%rcx, %r8
	je	.LBB1_28
# BB#29:                                # %polly.cond168.us
                                        #   in Loop: Header=BB1_25 Depth=2
	testq	%rbp, %rbp
	movl	$0, %r12d
	jne	.LBB1_39
	jmp	.LBB1_31
.LBB1_28:                               #   in Loop: Header=BB1_25 Depth=2
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB1_31:                               # %polly.cond172.us
                                        #   in Loop: Header=BB1_25 Depth=2
	testq	%rbx, %rbx
	setg	%al
	leaq	3(%rbp), %rdx
	cmpq	%rcx, %rdx
	setle	%dl
	testb	%al, %dl
	jne	.LBB1_33
# BB#32:                                # %polly.cond172.us
                                        #   in Loop: Header=BB1_25 Depth=2
	movq	%rbp, %rax
	orq	%r14, %rax
	movl	$0, %eax
	jne	.LBB1_34
.LBB1_33:                               # %polly.stmt.if.end18.us
                                        #   in Loop: Header=BB1_25 Depth=2
	movq	%rbp, %rax
	imulq	%r10, %rax
	movq	-56(%rsp), %rdx         # 8-byte Reload
	movq	(%rdx,%rax), %rax
.LBB1_34:                               # %polly.cond182.us
                                        #   in Loop: Header=BB1_25 Depth=2
	cmpq	$2, %rbx
	movl	$0, %esi
	jl	.LBB1_36
# BB#35:                                # %polly.stmt.if.end26.us
                                        #   in Loop: Header=BB1_25 Depth=2
	movq	%rbp, %rdx
	imulq	%r10, %rdx
	movq	-64(%rsp), %rsi         # 8-byte Reload
	movq	(%rsi,%rdx), %rsi
.LBB1_36:                               # %polly.cond192.us
                                        #   in Loop: Header=BB1_25 Depth=2
	testq	%rbx, %rbx
	setg	%r11b
	cmpq	$2, -32(%rsp)           # 8-byte Folded Reload
	setg	%dl
	cmpq	$2, %rcx
	je	.LBB1_38
# BB#37:                                # %polly.cond192.us
                                        #   in Loop: Header=BB1_25 Depth=2
	andb	%r11b, %dl
	orb	%r15b, %dl
	je	.LBB1_39
.LBB1_38:                               # %polly.stmt.blklab15.us
                                        #   in Loop: Header=BB1_25 Depth=2
.Ltmp128:
	.loc	1 443 8 is_stmt 1       # CoinGame.c:443:8
	cmpq	%r12, %rax
.Ltmp129:
	.loc	1 443 7 is_stmt 0       # CoinGame.c:443:7
	cmovgq	%r12, %rax
.Ltmp130:
	.loc	1 449 8 is_stmt 1       # CoinGame.c:449:8
	cmpq	%r12, %rsi
.Ltmp131:
	.loc	1 449 7 is_stmt 0       # CoinGame.c:449:7
	cmovgq	%r12, %rsi
	.loc	1 455 9 is_stmt 1       # CoinGame.c:455:9
	addq	%rbp, %rax
	.loc	1 457 9                 # CoinGame.c:457:9
	addq	%rsi, %rbx
.Ltmp132:
	.loc	1 459 10                # CoinGame.c:459:10
	cmpq	%rbx, %rax
.Ltmp133:
	.loc	1 469 4                 # CoinGame.c:469:4
	cmovgeq	%rax, %rbx
	movq	%rbp, %rax
	imulq	%r10, %rax
	movq	-48(%rsp), %rdx         # 8-byte Reload
	movq	%rbx, (%rdx,%rax)
.LBB1_39:                               # %polly.merge169.us
                                        #   in Loop: Header=BB1_25 Depth=2
	cmpq	%r9, %rbp
	movq	%r8, %rbp
	jl	.LBB1_25
	jmp	.LBB1_15
	.p2align	4, 0x90
.LBB1_18:                               # %polly.loop_header157
                                        #   Parent Loop BB1_14 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	2(%rbx), %rax
	leaq	(%rbx,%r14), %rbp
	cmpq	%rcx, %rax
	jg	.LBB1_20
# BB#19:                                # %polly.loop_header157
                                        #   in Loop: Header=BB1_18 Depth=2
	testq	%rbp, %rbp
	jle	.LBB1_20
# BB#40:                                # %polly.cond168.thread
                                        #   in Loop: Header=BB1_18 Depth=2
	movq	%rbx, %rax
	imulq	%r10, %rax
	movq	-40(%rsp), %rdx         # 8-byte Reload
	movq	(%rdx,%rax), %r13
	testq	%rbx, %rbx
	sete	%r8b
	leaq	1(%rbx), %r11
	jmp	.LBB1_41
	.p2align	4, 0x90
.LBB1_20:                               # %polly.cond168
                                        #   in Loop: Header=BB1_18 Depth=2
	testq	%rbx, %rbx
	sete	%r8b
	leaq	1(%rbx), %r11
	cmpq	%rcx, %r11
	je	.LBB1_21
# BB#22:                                # %polly.cond168
                                        #   in Loop: Header=BB1_18 Depth=2
	testq	%rbx, %rbx
	movl	$0, %r13d
	jne	.LBB1_23
	jmp	.LBB1_41
.LBB1_21:                               #   in Loop: Header=BB1_18 Depth=2
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB1_41:                               # %polly.cond172
                                        #   in Loop: Header=BB1_18 Depth=2
	leaq	3(%rbx), %rax
	cmpq	%rcx, %rax
	jg	.LBB1_42
# BB#43:                                # %polly.cond172
                                        #   in Loop: Header=BB1_18 Depth=2
	testq	%rbp, %rbp
	movl	$0, %edx
	jle	.LBB1_44
# BB#48:                                # %polly.stmt.if.end18
                                        #   in Loop: Header=BB1_18 Depth=2
	movq	%rbx, %rax
	imulq	%r10, %rax
	movq	-56(%rsp), %rdx         # 8-byte Reload
	movq	(%rdx,%rax), %rdx
	jmp	.LBB1_44
.LBB1_42:                               #   in Loop: Header=BB1_18 Depth=2
	xorl	%edx, %edx
.LBB1_44:                               # %polly.cond182
                                        #   in Loop: Header=BB1_18 Depth=2
	cmpq	$1, %rbp
	movl	$0, %r15d
	jle	.LBB1_45
# BB#49:                                # %polly.stmt.if.end26
                                        #   in Loop: Header=BB1_18 Depth=2
	movq	%rbx, %rax
	imulq	%r10, %rax
	movq	-64(%rsp), %rsi         # 8-byte Reload
	movq	(%rsi,%rax), %r15
.LBB1_45:                               # %polly.cond192
                                        #   in Loop: Header=BB1_18 Depth=2
	cmpq	$2, -32(%rsp)           # 8-byte Folded Reload
	setg	%r12b
	testq	%rbp, %rbp
	setg	%al
	cmpq	$2, %rcx
	je	.LBB1_47
# BB#46:                                # %polly.cond192
                                        #   in Loop: Header=BB1_18 Depth=2
	andb	%al, %r12b
	orb	%r8b, %r12b
	je	.LBB1_23
.LBB1_47:                               # %polly.stmt.blklab15
                                        #   in Loop: Header=BB1_18 Depth=2
.Ltmp134:
	.loc	1 443 8                 # CoinGame.c:443:8
	cmpq	%r13, %rdx
.Ltmp135:
	.loc	1 443 7 is_stmt 0       # CoinGame.c:443:7
	cmovgq	%r13, %rdx
.Ltmp136:
	.loc	1 449 8 is_stmt 1       # CoinGame.c:449:8
	cmpq	%r13, %r15
.Ltmp137:
	.loc	1 449 7 is_stmt 0       # CoinGame.c:449:7
	cmovgq	%r13, %r15
	.loc	1 455 9 is_stmt 1       # CoinGame.c:455:9
	addq	%rbx, %rdx
	.loc	1 457 9                 # CoinGame.c:457:9
	addq	%r15, %rbp
.Ltmp138:
	.loc	1 459 10                # CoinGame.c:459:10
	cmpq	%rbp, %rdx
.Ltmp139:
	.loc	1 469 4                 # CoinGame.c:469:4
	cmovgeq	%rdx, %rbp
	movq	%rbx, %rax
	imulq	%r10, %rax
	movq	-48(%rsp), %rdx         # 8-byte Reload
	movq	%rbp, (%rdx,%rax)
.Ltmp140:
.LBB1_23:                               # %polly.merge169
                                        #   in Loop: Header=BB1_18 Depth=2
	cmpq	%r9, %rbx
	movq	%r11, %rbx
	jl	.LBB1_18
.LBB1_15:                               # %polly.loop_exit159
                                        #   in Loop: Header=BB1_14 Depth=1
	incq	%r14
	cmpq	%rcx, %r14
	jne	.LBB1_14
.LBB1_13:                               # %if.end54
	.loc	1 512 2                 # CoinGame.c:512:2
	movq	%rdi, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp141:
.Lfunc_end1:
	.size	findMoves, .Lfunc_end1-findMoves
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI2_0:
	.quad	84                      # 0x54
	.quad	104                     # 0x68
.LCPI2_1:
	.quad	101                     # 0x65
	.quad	32                      # 0x20
.LCPI2_2:
	.quad	116                     # 0x74
	.quad	111                     # 0x6f
.LCPI2_3:
	.quad	116                     # 0x74
	.quad	97                      # 0x61
.LCPI2_4:
	.quad	108                     # 0x6c
	.quad	32                      # 0x20
.LCPI2_5:
	.quad	97                      # 0x61
	.quad	109                     # 0x6d
.LCPI2_6:
	.quad	111                     # 0x6f
	.quad	117                     # 0x75
.LCPI2_7:
	.quad	110                     # 0x6e
	.quad	116                     # 0x74
.LCPI2_8:
	.quad	32                      # 0x20
	.quad	111                     # 0x6f
.LCPI2_9:
	.quad	102                     # 0x66
	.quad	32                      # 0x20
.LCPI2_10:
	.quad	109                     # 0x6d
	.quad	111                     # 0x6f
.LCPI2_11:
	.quad	110                     # 0x6e
	.quad	101                     # 0x65
.LCPI2_12:
	.quad	121                     # 0x79
	.quad	32                      # 0x20
.LCPI2_13:
	.quad	40                      # 0x28
	.quad	109                     # 0x6d
.LCPI2_14:
	.quad	97                      # 0x61
	.quad	120                     # 0x78
.LCPI2_15:
	.quad	105                     # 0x69
	.quad	109                     # 0x6d
.LCPI2_16:
	.quad	117                     # 0x75
	.quad	109                     # 0x6d
.LCPI2_17:
	.quad	41                      # 0x29
	.quad	32                      # 0x20
.LCPI2_18:
	.quad	65                      # 0x41
	.quad	108                     # 0x6c
.LCPI2_19:
	.quad	105                     # 0x69
	.quad	99                      # 0x63
.LCPI2_20:
	.quad	103                     # 0x67
	.quad	101                     # 0x65
.LCPI2_21:
	.quad	116                     # 0x74
	.quad	115                     # 0x73
.LCPI2_22:
	.quad	32                      # 0x20
	.quad	105                     # 0x69
.LCPI2_23:
	.quad	115                     # 0x73
	.quad	32                      # 0x20
.LCPI2_24:
	.quad	80                      # 0x50
	.quad	97                      # 0x61
.LCPI2_25:
	.quad	115                     # 0x73
	.quad	115                     # 0x73
.LCPI2_26:
	.quad	32                      # 0x20
	.quad	67                      # 0x43
.LCPI2_27:
	.quad	111                     # 0x6f
	.quad	105                     # 0x69
.LCPI2_28:
	.quad	110                     # 0x6e
	.quad	71                      # 0x47
.LCPI2_29:
	.quad	116                     # 0x74
	.quad	101                     # 0x65
.LCPI2_30:
	.quad	115                     # 0x73
	.quad	116                     # 0x74
.LCPI2_31:
	.quad	32                      # 0x20
	.quad	99                      # 0x63
.LCPI2_32:
	.quad	97                      # 0x61
	.quad	115                     # 0x73
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin2:
	.loc	1 516 0                 # CoinGame.c:516:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp142:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp143:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp144:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp145:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp146:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp147:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Ltmp148:
	.cfi_def_cfa_offset 64
.Ltmp149:
	.cfi_offset %rbx, -56
.Ltmp150:
	.cfi_offset %r12, -48
.Ltmp151:
	.cfi_offset %r13, -40
.Ltmp152:
	.cfi_offset %r14, -32
.Ltmp153:
	.cfi_offset %r15, -24
.Ltmp154:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
	movl	%edi, %ebx
.Ltmp155:
	#DEBUG_VALUE: main:_23_has_ownership <- 0
	#DEBUG_VALUE: main:_23_size <- 0
	#DEBUG_VALUE: main:_18_has_ownership <- 0
	#DEBUG_VALUE: main:_18_size <- 0
	#DEBUG_VALUE: main:_15 <- 0
	#DEBUG_VALUE: main:_14 <- 0
	#DEBUG_VALUE: main:_13 <- 0
	#DEBUG_VALUE: main:_12_has_ownership <- 0
	#DEBUG_VALUE: main:_12_size <- 0
	#DEBUG_VALUE: main:_11_has_ownership <- 0
	#DEBUG_VALUE: main:_11_size <- 0
	#DEBUG_VALUE: main:_10 <- 0
	#DEBUG_VALUE: main:_9 <- 0
	#DEBUG_VALUE: main:_8_has_ownership <- 0
	#DEBUG_VALUE: main:_8_size <- 0
	#DEBUG_VALUE: main:_7 <- 0
	#DEBUG_VALUE: main:_6_has_ownership <- 0
	#DEBUG_VALUE: main:_6_size_size <- 0
	#DEBUG_VALUE: main:_6_size <- 0
	#DEBUG_VALUE: main:sum_alice <- 0
	#DEBUG_VALUE: main:moves_has_ownership <- 0
	#DEBUG_VALUE: main:moves_size <- 0
	#DEBUG_VALUE: main:n <- 0
	#DEBUG_VALUE: main:argc <- %EBX
	.loc	1 545 2 prologue_end    # CoinGame.c:545:2
	callq	convertArgsToIntArray
.Ltmp156:
	movq	%rax, %r15
.Ltmp157:
	#DEBUG_VALUE: main:_6 <- %R15
	decl	%ebx
.Ltmp158:
	movslq	%ebx, %r14
.Ltmp159:
	#DEBUG_VALUE: main:_6_has_ownership <- 1
	#DEBUG_VALUE: main:_6_size <- %EBX
	.loc	1 550 5                 # CoinGame.c:550:5
	movq	(%r15), %rdi
.Ltmp160:
	#DEBUG_VALUE: main:_8 <- %RDI
	.loc	1 552 2                 # CoinGame.c:552:2
	callq	parseStringToInt
.Ltmp161:
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_5 <- %RAX
	.loc	1 556 9                 # CoinGame.c:556:9
	testq	%rax, %rax
	jne	.LBB2_1
.Ltmp162:
# BB#2:                                 # %if.end122.critedge
	#DEBUG_VALUE: main:_5 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_6_size <- %EBX
	#DEBUG_VALUE: main:_6 <- %R15
	.loc	1 617 2 discriminator 1 # CoinGame.c:617:2
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	free2DArray
.Ltmp163:
	#DEBUG_VALUE: main:_6_has_ownership <- 0
	.loc	1 623 2                 # CoinGame.c:623:2
	xorl	%edi, %edi
	callq	exit
.Ltmp164:
.LBB2_1:                                # %if.then103
	#DEBUG_VALUE: main:_5 <- %RAX
	#DEBUG_VALUE: main:max <- %RAX
	#DEBUG_VALUE: main:_6_size <- %EBX
	#DEBUG_VALUE: main:_6 <- %R15
	.loc	1 558 6                 # CoinGame.c:558:6
	movq	(%rax), %rbx
.Ltmp165:
	#DEBUG_VALUE: main:_9 <- 0
	#DEBUG_VALUE: main:n <- %RBX
	.loc	1 562 7                 # CoinGame.c:562:7
	movl	%ebx, %esi
	imull	%esi, %esi
	.loc	1 565 2                 # CoinGame.c:565:2
	xorl	%edi, %edi
	callq	gen1DArray
.Ltmp166:
	#DEBUG_VALUE: main:moves <- %RAX
	#DEBUG_VALUE: main:_11 <- %RAX
	#DEBUG_VALUE: main:_11_has_ownership <- 0
	#DEBUG_VALUE: main:moves_has_ownership <- 0
	.loc	1 576 8                 # CoinGame.c:576:8
	xorl	%edx, %edx
	movq	%rax, %rdi
	movq	%rbx, %rcx
	callq	findMoves
.Ltmp167:
	movq	%rax, %r12
.Ltmp168:
	#DEBUG_VALUE: main:_12 <- %R12
	#DEBUG_VALUE: main:moves <- %R12
	#DEBUG_VALUE: main:_13 <- 1
	#DEBUG_VALUE: main:_12_has_ownership <- 0
	#DEBUG_VALUE: main:moves_has_ownership <- 1
	.loc	1 588 6                 # CoinGame.c:588:6
	movq	-8(%r12,%rbx,8), %r13
.Ltmp169:
	#DEBUG_VALUE: main:_18_size <- 50
	#DEBUG_VALUE: main:_15 <- %R13
	#DEBUG_VALUE: main:sum_alice <- %R13
	.loc	1 595 2                 # CoinGame.c:595:2
	movl	$400, %edi              # imm = 0x190
	callq	malloc
	movq	%rax, %rbp
.Ltmp170:
	#DEBUG_VALUE: main:_18 <- %RBP
	.loc	1 596 9                 # CoinGame.c:596:9
	movaps	.LCPI2_0(%rip), %xmm0   # xmm0 = [84,104]
	movups	%xmm0, (%rbp)
	.loc	1 596 36 is_stmt 0      # CoinGame.c:596:36
	movaps	.LCPI2_1(%rip), %xmm0   # xmm0 = [101,32]
	movups	%xmm0, 16(%rbp)
	movaps	%xmm0, %xmm1
	.loc	1 596 63                # CoinGame.c:596:63
	movaps	.LCPI2_2(%rip), %xmm0   # xmm0 = [116,111]
	movups	%xmm0, 32(%rbp)
	.loc	1 596 91                # CoinGame.c:596:91
	movaps	.LCPI2_3(%rip), %xmm0   # xmm0 = [116,97]
	movups	%xmm0, 48(%rbp)
	.loc	1 596 118               # CoinGame.c:596:118
	movaps	.LCPI2_4(%rip), %xmm0   # xmm0 = [108,32]
	movups	%xmm0, 64(%rbp)
	.loc	1 596 146               # CoinGame.c:596:146
	movaps	.LCPI2_5(%rip), %xmm0   # xmm0 = [97,109]
	movups	%xmm0, 80(%rbp)
	.loc	1 596 175               # CoinGame.c:596:175
	movaps	.LCPI2_6(%rip), %xmm0   # xmm0 = [111,117]
	movups	%xmm0, 96(%rbp)
	.loc	1 596 205               # CoinGame.c:596:205
	movaps	.LCPI2_7(%rip), %xmm0   # xmm0 = [110,116]
	movups	%xmm0, 112(%rbp)
	.loc	1 596 235               # CoinGame.c:596:235
	movaps	.LCPI2_8(%rip), %xmm0   # xmm0 = [32,111]
	movups	%xmm0, 128(%rbp)
	.loc	1 596 264               # CoinGame.c:596:264
	movaps	.LCPI2_9(%rip), %xmm0   # xmm0 = [102,32]
	movups	%xmm0, 144(%rbp)
	.loc	1 596 293               # CoinGame.c:596:293
	movaps	.LCPI2_10(%rip), %xmm0  # xmm0 = [109,111]
	movups	%xmm0, 160(%rbp)
	.loc	1 596 323               # CoinGame.c:596:323
	movaps	.LCPI2_11(%rip), %xmm0  # xmm0 = [110,101]
	movups	%xmm0, 176(%rbp)
	.loc	1 596 353               # CoinGame.c:596:353
	movaps	.LCPI2_12(%rip), %xmm0  # xmm0 = [121,32]
	movups	%xmm0, 192(%rbp)
	.loc	1 596 382               # CoinGame.c:596:382
	movaps	.LCPI2_13(%rip), %xmm0  # xmm0 = [40,109]
	movups	%xmm0, 208(%rbp)
	.loc	1 596 411               # CoinGame.c:596:411
	movaps	.LCPI2_14(%rip), %xmm0  # xmm0 = [97,120]
	movups	%xmm0, 224(%rbp)
	.loc	1 596 440               # CoinGame.c:596:440
	movaps	.LCPI2_15(%rip), %xmm0  # xmm0 = [105,109]
	movups	%xmm0, 240(%rbp)
	.loc	1 596 470               # CoinGame.c:596:470
	movaps	.LCPI2_16(%rip), %xmm0  # xmm0 = [117,109]
	movups	%xmm0, 256(%rbp)
	.loc	1 596 500               # CoinGame.c:596:500
	movaps	.LCPI2_17(%rip), %xmm0  # xmm0 = [41,32]
	movups	%xmm0, 272(%rbp)
	.loc	1 596 528               # CoinGame.c:596:528
	movaps	.LCPI2_18(%rip), %xmm0  # xmm0 = [65,108]
	movups	%xmm0, 288(%rbp)
	.loc	1 596 557               # CoinGame.c:596:557
	movaps	.LCPI2_19(%rip), %xmm0  # xmm0 = [105,99]
	movups	%xmm0, 304(%rbp)
	.loc	1 596 586               # CoinGame.c:596:586
	movups	%xmm1, 320(%rbp)
	.loc	1 596 615               # CoinGame.c:596:615
	movaps	.LCPI2_20(%rip), %xmm0  # xmm0 = [103,101]
	movups	%xmm0, 336(%rbp)
	.loc	1 596 645               # CoinGame.c:596:645
	movaps	.LCPI2_21(%rip), %xmm0  # xmm0 = [116,115]
	movups	%xmm0, 352(%rbp)
	.loc	1 596 675               # CoinGame.c:596:675
	movaps	.LCPI2_22(%rip), %xmm0  # xmm0 = [32,105]
	movups	%xmm0, 368(%rbp)
	.loc	1 596 704               # CoinGame.c:596:704
	movaps	.LCPI2_23(%rip), %xmm0  # xmm0 = [115,32]
	movups	%xmm0, 384(%rbp)
.Ltmp171:
	#DEBUG_VALUE: main:_18_has_ownership <- 1
	.loc	1 599 2 is_stmt 1       # CoinGame.c:599:2
	movl	$50, %esi
	movq	%rbp, %rdi
	callq	printf_s
	.loc	1 603 2                 # CoinGame.c:603:2
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	movq	%r13, %rsi
	callq	printf
.Ltmp172:
	#DEBUG_VALUE: main:_23_size <- 23
	.loc	1 608 2                 # CoinGame.c:608:2
	movl	$184, %edi
	callq	malloc
	movq	%rax, %rbx
.Ltmp173:
	#DEBUG_VALUE: main:_23 <- %RBX
	.loc	1 609 9                 # CoinGame.c:609:9
	movaps	.LCPI2_24(%rip), %xmm0  # xmm0 = [80,97]
	movups	%xmm0, (%rbx)
	.loc	1 609 35 is_stmt 0      # CoinGame.c:609:35
	movaps	.LCPI2_25(%rip), %xmm0  # xmm0 = [115,115]
	movups	%xmm0, 16(%rbx)
	.loc	1 609 63                # CoinGame.c:609:63
	movaps	.LCPI2_26(%rip), %xmm0  # xmm0 = [32,67]
	movups	%xmm0, 32(%rbx)
	.loc	1 609 89                # CoinGame.c:609:89
	movaps	.LCPI2_27(%rip), %xmm0  # xmm0 = [111,105]
	movups	%xmm0, 48(%rbx)
	.loc	1 609 117               # CoinGame.c:609:117
	movaps	.LCPI2_28(%rip), %xmm0  # xmm0 = [110,71]
	movups	%xmm0, 64(%rbx)
	.loc	1 596 146 is_stmt 1     # CoinGame.c:596:146
	movaps	.LCPI2_5(%rip), %xmm0   # xmm0 = [97,109]
	.loc	1 609 145               # CoinGame.c:609:145
	movups	%xmm0, 80(%rbx)
	.loc	1 596 36                # CoinGame.c:596:36
	movaps	.LCPI2_1(%rip), %xmm0   # xmm0 = [101,32]
	.loc	1 609 174               # CoinGame.c:609:174
	movups	%xmm0, 96(%rbx)
	.loc	1 609 203 is_stmt 0     # CoinGame.c:609:203
	movaps	.LCPI2_29(%rip), %xmm0  # xmm0 = [116,101]
	movups	%xmm0, 112(%rbx)
	.loc	1 609 233               # CoinGame.c:609:233
	movaps	.LCPI2_30(%rip), %xmm0  # xmm0 = [115,116]
	movups	%xmm0, 128(%rbx)
	.loc	1 609 263               # CoinGame.c:609:263
	movaps	.LCPI2_31(%rip), %xmm0  # xmm0 = [32,99]
	movups	%xmm0, 144(%rbx)
	.loc	1 609 291               # CoinGame.c:609:291
	movaps	.LCPI2_32(%rip), %xmm0  # xmm0 = [97,115]
	movups	%xmm0, 160(%rbx)
	.loc	1 609 320               # CoinGame.c:609:320
	movq	$101, 176(%rbx)
.Ltmp174:
	#DEBUG_VALUE: main:_23_has_ownership <- 1
	.loc	1 612 2 is_stmt 1       # CoinGame.c:612:2
	movl	$23, %esi
	movq	%rbx, %rdi
	callq	println_s
.Ltmp175:
	.loc	1 616 2 discriminator 1 # CoinGame.c:616:2
	movq	%r12, %rdi
	callq	free
.Ltmp176:
	#DEBUG_VALUE: main:moves_has_ownership <- 0
	.loc	1 617 2 discriminator 1 # CoinGame.c:617:2
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	free2DArray
.Ltmp177:
	#DEBUG_VALUE: main:_6_has_ownership <- 0
	.loc	1 621 2 discriminator 1 # CoinGame.c:621:2
	movq	%rbp, %rdi
	callq	free
.Ltmp178:
	#DEBUG_VALUE: main:_18_has_ownership <- 0
	.loc	1 622 2 discriminator 1 # CoinGame.c:622:2
	movq	%rbx, %rdi
	callq	free
.Ltmp179:
	#DEBUG_VALUE: main:_23_has_ownership <- 0
	.loc	1 623 2                 # CoinGame.c:623:2
	xorl	%edi, %edi
	callq	exit
.Ltmp180:
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%lld"
	.size	.L.str, 5

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"fail"
	.size	.L.str.1, 5

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"%lld\n"
	.size	.L.str.2, 6

	.file	2 "/usr/include/libio.h"
	.file	3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file	4 "/home/sam/polly/llvm_build/bin/../lib/clang/3.9.0/include/stddef.h"
	.file	5 "/usr/include/stdio.h"
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)" # string offset=0
.Linfo_string1:
	.asciz	"CoinGame.c"            # string offset=165
.Linfo_string2:
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/autogenerate" # string offset=176
.Linfo_string3:
	.asciz	"play"                  # string offset=242
.Linfo_string4:
	.asciz	"findMoves"             # string offset=247
.Linfo_string5:
	.asciz	"long long int"         # string offset=257
.Linfo_string6:
	.asciz	"main"                  # string offset=271
.Linfo_string7:
	.asciz	"int"                   # string offset=276
.Linfo_string8:
	.asciz	"sys"                   # string offset=280
.Linfo_string9:
	.asciz	"_flags"                # string offset=284
.Linfo_string10:
	.asciz	"_IO_read_ptr"          # string offset=291
.Linfo_string11:
	.asciz	"char"                  # string offset=304
.Linfo_string12:
	.asciz	"_IO_read_end"          # string offset=309
.Linfo_string13:
	.asciz	"_IO_read_base"         # string offset=322
.Linfo_string14:
	.asciz	"_IO_write_base"        # string offset=336
.Linfo_string15:
	.asciz	"_IO_write_ptr"         # string offset=351
.Linfo_string16:
	.asciz	"_IO_write_end"         # string offset=365
.Linfo_string17:
	.asciz	"_IO_buf_base"          # string offset=379
.Linfo_string18:
	.asciz	"_IO_buf_end"           # string offset=392
.Linfo_string19:
	.asciz	"_IO_save_base"         # string offset=404
.Linfo_string20:
	.asciz	"_IO_backup_base"       # string offset=418
.Linfo_string21:
	.asciz	"_IO_save_end"          # string offset=434
.Linfo_string22:
	.asciz	"_markers"              # string offset=447
.Linfo_string23:
	.asciz	"_next"                 # string offset=456
.Linfo_string24:
	.asciz	"_sbuf"                 # string offset=462
.Linfo_string25:
	.asciz	"_pos"                  # string offset=468
.Linfo_string26:
	.asciz	"_IO_marker"            # string offset=473
.Linfo_string27:
	.asciz	"_chain"                # string offset=484
.Linfo_string28:
	.asciz	"_fileno"               # string offset=491
.Linfo_string29:
	.asciz	"_flags2"               # string offset=499
.Linfo_string30:
	.asciz	"_old_offset"           # string offset=507
.Linfo_string31:
	.asciz	"long int"              # string offset=519
.Linfo_string32:
	.asciz	"__off_t"               # string offset=528
.Linfo_string33:
	.asciz	"_cur_column"           # string offset=536
.Linfo_string34:
	.asciz	"unsigned short"        # string offset=548
.Linfo_string35:
	.asciz	"_vtable_offset"        # string offset=563
.Linfo_string36:
	.asciz	"signed char"           # string offset=578
.Linfo_string37:
	.asciz	"_shortbuf"             # string offset=590
.Linfo_string38:
	.asciz	"sizetype"              # string offset=600
.Linfo_string39:
	.asciz	"_lock"                 # string offset=609
.Linfo_string40:
	.asciz	"_IO_lock_t"            # string offset=615
.Linfo_string41:
	.asciz	"_offset"               # string offset=626
.Linfo_string42:
	.asciz	"__off64_t"             # string offset=634
.Linfo_string43:
	.asciz	"__pad1"                # string offset=644
.Linfo_string44:
	.asciz	"__pad2"                # string offset=651
.Linfo_string45:
	.asciz	"__pad3"                # string offset=658
.Linfo_string46:
	.asciz	"__pad4"                # string offset=665
.Linfo_string47:
	.asciz	"__pad5"                # string offset=672
.Linfo_string48:
	.asciz	"long unsigned int"     # string offset=679
.Linfo_string49:
	.asciz	"size_t"                # string offset=697
.Linfo_string50:
	.asciz	"_mode"                 # string offset=704
.Linfo_string51:
	.asciz	"_unused2"              # string offset=710
.Linfo_string52:
	.asciz	"_IO_FILE"              # string offset=719
.Linfo_string53:
	.asciz	"FILE"                  # string offset=728
.Linfo_string54:
	.asciz	"moves"                 # string offset=733
.Linfo_string55:
	.asciz	"moves_size"            # string offset=739
.Linfo_string56:
	.asciz	"moves_has_ownership"   # string offset=750
.Linfo_string57:
	.asciz	"_Bool"                 # string offset=770
.Linfo_string58:
	.asciz	"n"                     # string offset=776
.Linfo_string59:
	.asciz	"_64_has_ownership"     # string offset=778
.Linfo_string60:
	.asciz	"_64_size"              # string offset=796
.Linfo_string61:
	.asciz	"_61"                   # string offset=805
.Linfo_string62:
	.asciz	"_60"                   # string offset=809
.Linfo_string63:
	.asciz	"_59_has_ownership"     # string offset=813
.Linfo_string64:
	.asciz	"_59_size"              # string offset=831
.Linfo_string65:
	.asciz	"_56"                   # string offset=840
.Linfo_string66:
	.asciz	"_55_has_ownership"     # string offset=844
.Linfo_string67:
	.asciz	"_55_size"              # string offset=862
.Linfo_string68:
	.asciz	"_52"                   # string offset=871
.Linfo_string69:
	.asciz	"_51"                   # string offset=875
.Linfo_string70:
	.asciz	"_50"                   # string offset=879
.Linfo_string71:
	.asciz	"_49"                   # string offset=883
.Linfo_string72:
	.asciz	"_48_has_ownership"     # string offset=887
.Linfo_string73:
	.asciz	"_48_size"              # string offset=905
.Linfo_string74:
	.asciz	"_43_has_ownership"     # string offset=914
.Linfo_string75:
	.asciz	"_43_size"              # string offset=932
.Linfo_string76:
	.asciz	"_38_has_ownership"     # string offset=941
.Linfo_string77:
	.asciz	"_38_size"              # string offset=959
.Linfo_string78:
	.asciz	"_35_has_ownership"     # string offset=968
.Linfo_string79:
	.asciz	"_35_size"              # string offset=986
.Linfo_string80:
	.asciz	"_32"                   # string offset=995
.Linfo_string81:
	.asciz	"_31"                   # string offset=999
.Linfo_string82:
	.asciz	"_30"                   # string offset=1003
.Linfo_string83:
	.asciz	"_29"                   # string offset=1007
.Linfo_string84:
	.asciz	"_28"                   # string offset=1011
.Linfo_string85:
	.asciz	"_27"                   # string offset=1015
.Linfo_string86:
	.asciz	"_26"                   # string offset=1019
.Linfo_string87:
	.asciz	"_25"                   # string offset=1023
.Linfo_string88:
	.asciz	"_24"                   # string offset=1027
.Linfo_string89:
	.asciz	"_23"                   # string offset=1031
.Linfo_string90:
	.asciz	"_22"                   # string offset=1035
.Linfo_string91:
	.asciz	"_21"                   # string offset=1039
.Linfo_string92:
	.asciz	"_20"                   # string offset=1043
.Linfo_string93:
	.asciz	"_19"                   # string offset=1047
.Linfo_string94:
	.asciz	"_18"                   # string offset=1051
.Linfo_string95:
	.asciz	"_17"                   # string offset=1055
.Linfo_string96:
	.asciz	"_16"                   # string offset=1059
.Linfo_string97:
	.asciz	"_15"                   # string offset=1063
.Linfo_string98:
	.asciz	"_14"                   # string offset=1067
.Linfo_string99:
	.asciz	"_13"                   # string offset=1071
.Linfo_string100:
	.asciz	"_12"                   # string offset=1075
.Linfo_string101:
	.asciz	"_11"                   # string offset=1079
.Linfo_string102:
	.asciz	"_10"                   # string offset=1083
.Linfo_string103:
	.asciz	"_9"                    # string offset=1087
.Linfo_string104:
	.asciz	"coin"                  # string offset=1090
.Linfo_string105:
	.asciz	"sum_bob"               # string offset=1095
.Linfo_string106:
	.asciz	"sum_alice"             # string offset=1103
.Linfo_string107:
	.asciz	"i"                     # string offset=1113
.Linfo_string108:
	.asciz	"right"                 # string offset=1115
.Linfo_string109:
	.asciz	"left"                  # string offset=1121
.Linfo_string110:
	.asciz	"_38"                   # string offset=1126
.Linfo_string111:
	.asciz	"_35"                   # string offset=1130
.Linfo_string112:
	.asciz	"_43"                   # string offset=1134
.Linfo_string113:
	.asciz	"_48"                   # string offset=1138
.Linfo_string114:
	.asciz	"_59"                   # string offset=1142
.Linfo_string115:
	.asciz	"_55"                   # string offset=1146
.Linfo_string116:
	.asciz	"_64"                   # string offset=1150
.Linfo_string117:
	.asciz	"_33"                   # string offset=1154
.Linfo_string118:
	.asciz	"_36"                   # string offset=1158
.Linfo_string119:
	.asciz	"_39"                   # string offset=1162
.Linfo_string120:
	.asciz	"_41"                   # string offset=1166
.Linfo_string121:
	.asciz	"_44"                   # string offset=1170
.Linfo_string122:
	.asciz	"_46"                   # string offset=1174
.Linfo_string123:
	.asciz	"_53"                   # string offset=1178
.Linfo_string124:
	.asciz	"_57"                   # string offset=1182
.Linfo_string125:
	.asciz	"_62"                   # string offset=1186
.Linfo_string126:
	.asciz	"_65"                   # string offset=1190
.Linfo_string127:
	.asciz	"y"                     # string offset=1194
.Linfo_string128:
	.asciz	"x"                     # string offset=1196
.Linfo_string129:
	.asciz	"z"                     # string offset=1198
.Linfo_string130:
	.asciz	"_40"                   # string offset=1200
.Linfo_string131:
	.asciz	"s"                     # string offset=1204
.Linfo_string132:
	.asciz	"_54"                   # string offset=1206
.Linfo_string133:
	.asciz	"_2"                    # string offset=1210
.Linfo_string134:
	.asciz	"_2_size"               # string offset=1213
.Linfo_string135:
	.asciz	"_2_has_ownership"      # string offset=1221
.Linfo_string136:
	.asciz	"j"                     # string offset=1238
.Linfo_string137:
	.asciz	"_34"                   # string offset=1240
.Linfo_string138:
	.asciz	"_37"                   # string offset=1244
.Linfo_string139:
	.asciz	"_42"                   # string offset=1248
.Linfo_string140:
	.asciz	"_45"                   # string offset=1252
.Linfo_string141:
	.asciz	"_47"                   # string offset=1256
.Linfo_string142:
	.asciz	"argc"                  # string offset=1260
.Linfo_string143:
	.asciz	"args"                  # string offset=1265
.Linfo_string144:
	.asciz	"_23_has_ownership"     # string offset=1270
.Linfo_string145:
	.asciz	"_23_size"              # string offset=1288
.Linfo_string146:
	.asciz	"_18_has_ownership"     # string offset=1297
.Linfo_string147:
	.asciz	"_18_size"              # string offset=1315
.Linfo_string148:
	.asciz	"_12_has_ownership"     # string offset=1324
.Linfo_string149:
	.asciz	"_12_size"              # string offset=1342
.Linfo_string150:
	.asciz	"_11_has_ownership"     # string offset=1351
.Linfo_string151:
	.asciz	"_11_size"              # string offset=1369
.Linfo_string152:
	.asciz	"_8_has_ownership"      # string offset=1378
.Linfo_string153:
	.asciz	"_8_size"               # string offset=1395
.Linfo_string154:
	.asciz	"_7"                    # string offset=1403
.Linfo_string155:
	.asciz	"_6_has_ownership"      # string offset=1406
.Linfo_string156:
	.asciz	"_6_size_size"          # string offset=1423
.Linfo_string157:
	.asciz	"_6_size"               # string offset=1436
.Linfo_string158:
	.asciz	"_6"                    # string offset=1444
.Linfo_string159:
	.asciz	"_8"                    # string offset=1447
.Linfo_string160:
	.asciz	"max"                   # string offset=1450
.Linfo_string161:
	.asciz	"_5"                    # string offset=1454
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp18-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp18-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	208                     # 80
	.byte	0                       # 
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	208                     # 80
	.byte	0                       # 
	.quad	0
	.quad	0
.Ldebug_loc2:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp18-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	82                      # super-register DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp18-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	1                       # 1
	.quad	.Ltmp81-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp13-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Ltmp18-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	48                      # 48
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp58-.Lfunc_begin0
	.quad	.Ltmp92-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp92-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp56-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp65-.Lfunc_begin0
	.quad	.Ltmp90-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp90-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	3                       # 3
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc18:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp33-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp33-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc19:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp31-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	16                      # 16
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc20:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp83-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc21:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	18                      # 18
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc22:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp27-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc23:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp25-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp25-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc24:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp23-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc25:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp23-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp24-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc26:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp22-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp22-.Lfunc_begin0
	.quad	.Ltmp26-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc27:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp21-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp22-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc28:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp21-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc29:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp19-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp27-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc30:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp18-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc31:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp17-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp17-.Lfunc_begin0
	.quad	.Ltmp18-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc32:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc33:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc34:
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp17-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp17-.Lfunc_begin0
	.quad	.Ltmp18-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc35:
	.quad	.Ltmp32-.Lfunc_begin0
	.quad	.Ltmp34-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp34-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	8                       # 8
	.quad	0
	.quad	0
.Ldebug_loc36:
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	0                       # 0
	.quad	0
	.quad	0
.Ldebug_loc37:
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	24                      # 24
	.quad	0
	.quad	0
.Ldebug_loc38:
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc39:
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	16                      # 16
	.quad	0
	.quad	0
.Ldebug_loc40:
	.quad	.Ltmp64-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	119                     # DW_OP_breg7
	.byte	40                      # 40
	.quad	0
	.quad	0
.Ldebug_loc41:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp93-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc42:
	.quad	.Ltmp107-.Lfunc_begin0
	.quad	.Ltmp113-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp114-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc43:
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp114-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc44:
	.quad	.Ltmp115-.Lfunc_begin0
	.quad	.Ltmp117-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp117-.Lfunc_begin0
	.quad	.Ltmp117-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp120-.Lfunc_begin0
	.quad	.Ltmp121-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc45:
	.quad	.Ltmp117-.Lfunc_begin0
	.quad	.Ltmp117-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc46:
	.quad	.Ltmp118-.Lfunc_begin0
	.quad	.Ltmp120-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp120-.Lfunc_begin0
	.quad	.Ltmp120-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc47:
	.quad	.Ltmp118-.Lfunc_begin0
	.quad	.Ltmp126-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	91                      # DW_OP_reg11
	.quad	0
	.quad	0
.Ldebug_loc48:
	.quad	.Ltmp118-.Lfunc_begin0
	.quad	.Ltmp126-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	91                      # DW_OP_reg11
	.quad	0
	.quad	0
.Ldebug_loc49:
	.quad	.Ltmp118-.Lfunc_begin0
	.quad	.Ltmp126-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	91                      # DW_OP_reg11
	.quad	0
	.quad	0
.Ldebug_loc50:
	.quad	.Ltmp118-.Lfunc_begin0
	.quad	.Ltmp126-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	91                      # DW_OP_reg11
	.quad	0
	.quad	0
.Ldebug_loc51:
	.quad	.Ltmp120-.Lfunc_begin0
	.quad	.Ltmp120-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc52:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp126-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	89                      # DW_OP_reg9
	.quad	0
	.quad	0
.Ldebug_loc53:
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp126-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	89                      # DW_OP_reg9
	.quad	0
	.quad	0
.Ldebug_loc54:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp155-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp155-.Lfunc_begin0
	.quad	.Ltmp158-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc55:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp156-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc56:
	.quad	.Ltmp155-.Lfunc_begin0
	.quad	.Ltmp174-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp174-.Lfunc_begin0
	.quad	.Ltmp179-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp179-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc57:
	.quad	.Ltmp155-.Lfunc_begin0
	.quad	.Ltmp172-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp172-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	23                      # 23
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc58:
	.quad	.Ltmp155-.Lfunc_begin0
	.quad	.Ltmp171-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp171-.Lfunc_begin0
	.quad	.Ltmp178-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp178-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc59:
	.quad	.Ltmp155-.Lfunc_begin0
	.quad	.Ltmp169-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp169-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	50                      # 50
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc60:
	.quad	.Ltmp155-.Lfunc_begin0
	.quad	.Ltmp169-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp169-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc61:
	.quad	.Ltmp155-.Lfunc_begin0
	.quad	.Ltmp168-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp168-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc62:
	.quad	.Ltmp155-.Lfunc_begin0
	.quad	.Ltmp159-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp159-.Lfunc_begin0
	.quad	.Ltmp163-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp163-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc63:
	.quad	.Ltmp155-.Lfunc_begin0
	.quad	.Ltmp159-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp159-.Lfunc_begin0
	.quad	.Ltmp165-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc64:
	.quad	.Ltmp155-.Lfunc_begin0
	.quad	.Ltmp169-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp169-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc65:
	.quad	.Ltmp155-.Lfunc_begin0
	.quad	.Ltmp168-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp168-.Lfunc_begin0
	.quad	.Ltmp176-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp176-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	16                      # DW_OP_constu
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc66:
	.quad	.Ltmp155-.Lfunc_begin0
	.quad	.Ltmp165-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp165-.Lfunc_begin0
	.quad	.Ltmp173-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	83                      # DW_OP_reg3
	.quad	0
	.quad	0
.Ldebug_loc67:
	.quad	.Ltmp157-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc68:
	.quad	.Ltmp160-.Lfunc_begin0
	.quad	.Ltmp161-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc69:
	.quad	.Ltmp161-.Lfunc_begin0
	.quad	.Ltmp163-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp164-.Lfunc_begin0
	.quad	.Ltmp166-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc70:
	.quad	.Ltmp161-.Lfunc_begin0
	.quad	.Ltmp163-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp164-.Lfunc_begin0
	.quad	.Ltmp166-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc71:
	.quad	.Ltmp166-.Lfunc_begin0
	.quad	.Ltmp167-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	.Ltmp168-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc72:
	.quad	.Ltmp166-.Lfunc_begin0
	.quad	.Ltmp167-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc73:
	.quad	.Ltmp168-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	92                      # DW_OP_reg12
	.quad	0
	.quad	0
.Ldebug_loc74:
	.quad	.Ltmp170-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	86                      # DW_OP_reg6
	.quad	0
	.quad	0
.Ldebug_loc75:
	.quad	.Ltmp173-.Lfunc_begin0
	.quad	.Lfunc_end2-.Lfunc_begin0
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
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
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
	.byte	7                       # Abbreviation Code
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
	.byte	8                       # Abbreviation Code
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
	.byte	9                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
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
	.byte	10                      # Abbreviation Code
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
	.byte	11                      # Abbreviation Code
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
	.byte	12                      # Abbreviation Code
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
	.byte	5                       # DW_FORM_data2
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
	.byte	5                       # DW_FORM_data2
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
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
	.byte	17                      # Abbreviation Code
	.byte	22                      # DW_TAG_typedef
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	18                      # Abbreviation Code
	.byte	19                      # DW_TAG_structure_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	19                      # Abbreviation Code
	.byte	13                      # DW_TAG_member
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	56                      # DW_AT_data_member_location
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	20                      # Abbreviation Code
	.byte	13                      # DW_TAG_member
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	56                      # DW_AT_data_member_location
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	21                      # Abbreviation Code
	.byte	1                       # DW_TAG_array_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	22                      # Abbreviation Code
	.byte	33                      # DW_TAG_subrange_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	55                      # DW_AT_count
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	23                      # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	24                      # Abbreviation Code
	.byte	22                      # DW_TAG_typedef
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	3027                    # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0xbcc DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x1 DW_TAG_pointer_type
	.byte	3                       # Abbrev [3] 0x2b:0x3f6 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	4                       # Abbrev [4] 0x40:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	2446                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x4f:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	2427                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x5e:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x6d:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	3013                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x7c:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc4            # DW_AT_location
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x8b:0xf DW_TAG_variable
	.long	.Ldebug_loc5            # DW_AT_location
	.long	.Linfo_string59         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	3013                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x9a:0xf DW_TAG_variable
	.long	.Ldebug_loc6            # DW_AT_location
	.long	.Linfo_string60         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	61                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xa9:0xf DW_TAG_variable
	.long	.Ldebug_loc7            # DW_AT_location
	.long	.Linfo_string61         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xb8:0xf DW_TAG_variable
	.long	.Ldebug_loc8            # DW_AT_location
	.long	.Linfo_string62         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	58                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xc7:0xf DW_TAG_variable
	.long	.Ldebug_loc9            # DW_AT_location
	.long	.Linfo_string63         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	57                      # DW_AT_decl_line
	.long	3013                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xd6:0xf DW_TAG_variable
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string64         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	56                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0xe5:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string65         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	54                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0xf1:0xf DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string66         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	53                      # DW_AT_decl_line
	.long	3013                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x100:0xf DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string67         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	52                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x10f:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	50                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x11b:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	49                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x127:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	48                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x133:0xf DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	47                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x142:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string72         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	46                      # DW_AT_decl_line
	.long	3013                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x151:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string73         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	45                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x160:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string74         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	42                      # DW_AT_decl_line
	.long	3013                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x16f:0xf DW_TAG_variable
	.long	.Ldebug_loc17           # DW_AT_location
	.long	.Linfo_string75         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	41                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x17e:0xf DW_TAG_variable
	.long	.Ldebug_loc18           # DW_AT_location
	.long	.Linfo_string76         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	38                      # DW_AT_decl_line
	.long	3013                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x18d:0xf DW_TAG_variable
	.long	.Ldebug_loc19           # DW_AT_location
	.long	.Linfo_string77         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	37                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x19c:0xf DW_TAG_variable
	.long	.Ldebug_loc20           # DW_AT_location
	.long	.Linfo_string78         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
	.long	3013                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1ab:0xf DW_TAG_variable
	.long	.Ldebug_loc21           # DW_AT_location
	.long	.Linfo_string79         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x1ba:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string80         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x1c6:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string81         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1d2:0xf DW_TAG_variable
	.long	.Ldebug_loc22           # DW_AT_location
	.long	.Linfo_string82         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	30                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x1e1:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string83         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	29                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x1ed:0xf DW_TAG_variable
	.long	.Ldebug_loc23           # DW_AT_location
	.long	.Linfo_string84         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	28                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x1fc:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string85         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x208:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string86         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x214:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string87         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	25                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x220:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string88         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	24                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x22c:0xf DW_TAG_variable
	.long	.Ldebug_loc24           # DW_AT_location
	.long	.Linfo_string89         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	23                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x23b:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string90         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	22                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x247:0xf DW_TAG_variable
	.long	.Ldebug_loc25           # DW_AT_location
	.long	.Linfo_string91         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	21                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x256:0xf DW_TAG_variable
	.long	.Ldebug_loc26           # DW_AT_location
	.long	.Linfo_string92         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	20                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x265:0xf DW_TAG_variable
	.long	.Ldebug_loc27           # DW_AT_location
	.long	.Linfo_string93         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x274:0xf DW_TAG_variable
	.long	.Ldebug_loc28           # DW_AT_location
	.long	.Linfo_string94         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x283:0xf DW_TAG_variable
	.long	.Ldebug_loc29           # DW_AT_location
	.long	.Linfo_string95         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	17                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x292:0xf DW_TAG_variable
	.long	.Ldebug_loc30           # DW_AT_location
	.long	.Linfo_string96         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	16                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x2a1:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string97         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x2ad:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string98         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x2b9:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string99         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x2c5:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string100        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2d1:0xf DW_TAG_variable
	.long	.Ldebug_loc31           # DW_AT_location
	.long	.Linfo_string101        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x2e0:0xc DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string102        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x2ec:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string103        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x2f8:0xf DW_TAG_variable
	.long	.Ldebug_loc32           # DW_AT_location
	.long	.Linfo_string104        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x307:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string105        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x313:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string106        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x31f:0xf DW_TAG_variable
	.long	.Ldebug_loc33           # DW_AT_location
	.long	.Linfo_string107        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x32e:0xf DW_TAG_variable
	.long	.Ldebug_loc34           # DW_AT_location
	.long	.Linfo_string108        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x33d:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string109        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x349:0xf DW_TAG_variable
	.long	.Ldebug_loc35           # DW_AT_location
	.long	.Linfo_string110        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	37                      # DW_AT_decl_line
	.long	2427                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x358:0xf DW_TAG_variable
	.long	.Ldebug_loc36           # DW_AT_location
	.long	.Linfo_string111        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	2427                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x367:0xf DW_TAG_variable
	.long	.Ldebug_loc37           # DW_AT_location
	.long	.Linfo_string112        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	41                      # DW_AT_decl_line
	.long	2427                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x376:0xf DW_TAG_variable
	.long	.Ldebug_loc38           # DW_AT_location
	.long	.Linfo_string113        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	45                      # DW_AT_decl_line
	.long	2427                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x385:0xf DW_TAG_variable
	.long	.Ldebug_loc39           # DW_AT_location
	.long	.Linfo_string114        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	56                      # DW_AT_decl_line
	.long	2427                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x394:0xf DW_TAG_variable
	.long	.Ldebug_loc40           # DW_AT_location
	.long	.Linfo_string115        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	52                      # DW_AT_decl_line
	.long	2427                    # DW_AT_type
	.byte	5                       # Abbrev [5] 0x3a3:0xf DW_TAG_variable
	.long	.Ldebug_loc41           # DW_AT_location
	.long	.Linfo_string116        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	61                      # DW_AT_decl_line
	.long	2427                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x3b2:0xb DW_TAG_variable
	.long	.Linfo_string117        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	33                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	7                       # Abbrev [7] 0x3bd:0xb DW_TAG_variable
	.long	.Linfo_string118        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	7                       # Abbrev [7] 0x3c8:0xb DW_TAG_variable
	.long	.Linfo_string119        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	39                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	7                       # Abbrev [7] 0x3d3:0xb DW_TAG_variable
	.long	.Linfo_string120        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	40                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	7                       # Abbrev [7] 0x3de:0xb DW_TAG_variable
	.long	.Linfo_string121        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	43                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	7                       # Abbrev [7] 0x3e9:0xb DW_TAG_variable
	.long	.Linfo_string122        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	7                       # Abbrev [7] 0x3f4:0xb DW_TAG_variable
	.long	.Linfo_string123        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	7                       # Abbrev [7] 0x3ff:0xb DW_TAG_variable
	.long	.Linfo_string124        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	55                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	7                       # Abbrev [7] 0x40a:0xb DW_TAG_variable
	.long	.Linfo_string125        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	60                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	7                       # Abbrev [7] 0x415:0xb DW_TAG_variable
	.long	.Linfo_string126        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	63                      # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	8                       # Abbrev [8] 0x421:0x31f DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string4          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	283                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	2427                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	9                       # Abbrev [9] 0x43b:0xc DW_TAG_formal_parameter
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	283                     # DW_AT_decl_line
	.long	2427                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0x447:0xc DW_TAG_formal_parameter
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	283                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0x453:0xc DW_TAG_formal_parameter
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	283                     # DW_AT_decl_line
	.long	3013                    # DW_AT_type
	.byte	9                       # Abbrev [9] 0x45f:0xc DW_TAG_formal_parameter
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	283                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x46b:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string101        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	294                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x478:0x10 DW_TAG_variable
	.long	.Ldebug_loc42           # DW_AT_location
	.long	.Linfo_string127        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	289                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x488:0xd DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string100        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	295                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x495:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string96         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	299                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x4a2:0xd DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string98         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	297                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x4af:0xd DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string95         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	300                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x4bc:0xd DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string91         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	304                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x4c9:0x10 DW_TAG_variable
	.long	.Ldebug_loc43           # DW_AT_location
	.long	.Linfo_string89         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	306                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x4d9:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string88         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	307                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x4e6:0x10 DW_TAG_variable
	.long	.Ldebug_loc44           # DW_AT_location
	.long	.Linfo_string128        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	290                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x4f6:0xd DW_TAG_variable
	.byte	2                       # DW_AT_const_value
	.long	.Linfo_string87         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	308                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x503:0xd DW_TAG_variable
	.byte	2                       # DW_AT_const_value
	.long	.Linfo_string85         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	310                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x510:0x10 DW_TAG_variable
	.long	.Ldebug_loc45           # DW_AT_location
	.long	.Linfo_string81         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	314                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x520:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string111        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	318                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x52d:0xd DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string117        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	316                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x53a:0x10 DW_TAG_variable
	.long	.Ldebug_loc46           # DW_AT_location
	.long	.Linfo_string129        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	291                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x54a:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string80         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	315                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x557:0x10 DW_TAG_variable
	.long	.Ldebug_loc47           # DW_AT_location
	.long	.Linfo_string99         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	296                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x567:0x10 DW_TAG_variable
	.long	.Ldebug_loc48           # DW_AT_location
	.long	.Linfo_string94         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	301                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x577:0x10 DW_TAG_variable
	.long	.Ldebug_loc49           # DW_AT_location
	.long	.Linfo_string68         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	335                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x587:0x10 DW_TAG_variable
	.long	.Ldebug_loc50           # DW_AT_location
	.long	.Linfo_string107        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	288                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x597:0xd DW_TAG_variable
	.byte	2                       # DW_AT_const_value
	.long	.Linfo_string110        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	321                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x5a4:0x10 DW_TAG_variable
	.long	.Ldebug_loc51           # DW_AT_location
	.long	.Linfo_string130        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	323                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x5b4:0xd DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string69         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	334                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x5c1:0xd DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string71         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	332                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x5ce:0xd DW_TAG_variable
	.byte	1                       # DW_AT_const_value
	.long	.Linfo_string123        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	336                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x5db:0x10 DW_TAG_variable
	.long	.Ldebug_loc52           # DW_AT_location
	.long	.Linfo_string131        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	286                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x5eb:0x10 DW_TAG_variable
	.long	.Ldebug_loc53           # DW_AT_location
	.long	.Linfo_string132        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	337                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x5fb:0xc DW_TAG_variable
	.long	.Linfo_string133        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	284                     # DW_AT_decl_line
	.long	2427                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x607:0xc DW_TAG_variable
	.long	.Linfo_string134        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	284                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x613:0xc DW_TAG_variable
	.long	.Linfo_string135        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	285                     # DW_AT_decl_line
	.long	3013                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x61f:0xc DW_TAG_variable
	.long	.Linfo_string136        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	287                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x62b:0xc DW_TAG_variable
	.long	.Linfo_string103        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	292                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x637:0xc DW_TAG_variable
	.long	.Linfo_string102        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	293                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x643:0xc DW_TAG_variable
	.long	.Linfo_string97         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	298                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x64f:0xc DW_TAG_variable
	.long	.Linfo_string93         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	302                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x65b:0xc DW_TAG_variable
	.long	.Linfo_string92         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	303                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x667:0xc DW_TAG_variable
	.long	.Linfo_string90         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	305                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x673:0xc DW_TAG_variable
	.long	.Linfo_string86         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	309                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x67f:0xc DW_TAG_variable
	.long	.Linfo_string84         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	311                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x68b:0xc DW_TAG_variable
	.long	.Linfo_string83         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	312                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x697:0xc DW_TAG_variable
	.long	.Linfo_string82         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	313                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x6a3:0xc DW_TAG_variable
	.long	.Linfo_string137        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	317                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x6af:0xc DW_TAG_variable
	.long	.Linfo_string118        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	319                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x6bb:0xc DW_TAG_variable
	.long	.Linfo_string138        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	320                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x6c7:0xc DW_TAG_variable
	.long	.Linfo_string119        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	322                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x6d3:0xc DW_TAG_variable
	.long	.Linfo_string120        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	324                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x6df:0xc DW_TAG_variable
	.long	.Linfo_string139        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	325                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x6eb:0xc DW_TAG_variable
	.long	.Linfo_string112        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	326                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x6f7:0xc DW_TAG_variable
	.long	.Linfo_string121        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	327                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x703:0xc DW_TAG_variable
	.long	.Linfo_string140        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	328                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x70f:0xc DW_TAG_variable
	.long	.Linfo_string122        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	329                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x71b:0xc DW_TAG_variable
	.long	.Linfo_string141        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	330                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x727:0xc DW_TAG_variable
	.long	.Linfo_string113        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	331                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x733:0xc DW_TAG_variable
	.long	.Linfo_string70         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	333                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	8                       # Abbrev [8] 0x740:0x23b DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	516                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	2439                    # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	13                      # Abbrev [13] 0x75a:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc54           # DW_AT_location
	.long	.Linfo_string142        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	516                     # DW_AT_decl_line
	.long	2439                    # DW_AT_type
	.byte	13                      # Abbrev [13] 0x76a:0x10 DW_TAG_formal_parameter
	.long	.Ldebug_loc55           # DW_AT_location
	.long	.Linfo_string143        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	516                     # DW_AT_decl_line
	.long	3020                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x77a:0x10 DW_TAG_variable
	.long	.Ldebug_loc56           # DW_AT_location
	.long	.Linfo_string144        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	543                     # DW_AT_decl_line
	.long	3013                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x78a:0x10 DW_TAG_variable
	.long	.Ldebug_loc57           # DW_AT_location
	.long	.Linfo_string145        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	542                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x79a:0x10 DW_TAG_variable
	.long	.Ldebug_loc58           # DW_AT_location
	.long	.Linfo_string146        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	539                     # DW_AT_decl_line
	.long	3013                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x7aa:0x10 DW_TAG_variable
	.long	.Ldebug_loc59           # DW_AT_location
	.long	.Linfo_string147        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	538                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x7ba:0x10 DW_TAG_variable
	.long	.Ldebug_loc60           # DW_AT_location
	.long	.Linfo_string97         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	536                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x7ca:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string98         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	535                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x7d7:0x10 DW_TAG_variable
	.long	.Ldebug_loc61           # DW_AT_location
	.long	.Linfo_string99         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	534                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x7e7:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string148        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	533                     # DW_AT_decl_line
	.long	3013                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x7f4:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string149        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	532                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x801:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string150        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	531                     # DW_AT_decl_line
	.long	3013                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x80e:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string151        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	530                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x81b:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string102        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	529                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x828:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string103        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	528                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x835:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string152        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	527                     # DW_AT_decl_line
	.long	3013                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x842:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string153        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	526                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x84f:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string154        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	525                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x85c:0x10 DW_TAG_variable
	.long	.Ldebug_loc62           # DW_AT_location
	.long	.Linfo_string155        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	524                     # DW_AT_decl_line
	.long	3013                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x86c:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string156        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	523                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x879:0x10 DW_TAG_variable
	.long	.Ldebug_loc63           # DW_AT_location
	.long	.Linfo_string157        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	523                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x889:0x10 DW_TAG_variable
	.long	.Ldebug_loc64           # DW_AT_location
	.long	.Linfo_string106        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	521                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x899:0x10 DW_TAG_variable
	.long	.Ldebug_loc65           # DW_AT_location
	.long	.Linfo_string56         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	520                     # DW_AT_decl_line
	.long	3013                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x8a9:0xd DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string55         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	519                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x8b6:0x10 DW_TAG_variable
	.long	.Ldebug_loc66           # DW_AT_location
	.long	.Linfo_string58         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	518                     # DW_AT_decl_line
	.long	2432                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x8c6:0x10 DW_TAG_variable
	.long	.Ldebug_loc67           # DW_AT_location
	.long	.Linfo_string158        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	523                     # DW_AT_decl_line
	.long	3025                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x8d6:0x10 DW_TAG_variable
	.long	.Ldebug_loc68           # DW_AT_location
	.long	.Linfo_string159        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	526                     # DW_AT_decl_line
	.long	2427                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x8e6:0x10 DW_TAG_variable
	.long	.Ldebug_loc69           # DW_AT_location
	.long	.Linfo_string160        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	517                     # DW_AT_decl_line
	.long	2427                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x8f6:0x10 DW_TAG_variable
	.long	.Ldebug_loc70           # DW_AT_location
	.long	.Linfo_string161        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	522                     # DW_AT_decl_line
	.long	2427                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x906:0x10 DW_TAG_variable
	.long	.Ldebug_loc71           # DW_AT_location
	.long	.Linfo_string54         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	519                     # DW_AT_decl_line
	.long	2427                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x916:0x10 DW_TAG_variable
	.long	.Ldebug_loc72           # DW_AT_location
	.long	.Linfo_string101        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	530                     # DW_AT_decl_line
	.long	2427                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x926:0x10 DW_TAG_variable
	.long	.Ldebug_loc73           # DW_AT_location
	.long	.Linfo_string100        # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	532                     # DW_AT_decl_line
	.long	2427                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x936:0x10 DW_TAG_variable
	.long	.Ldebug_loc74           # DW_AT_location
	.long	.Linfo_string94         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	538                     # DW_AT_decl_line
	.long	2427                    # DW_AT_type
	.byte	11                      # Abbrev [11] 0x946:0x10 DW_TAG_variable
	.long	.Ldebug_loc75           # DW_AT_location
	.long	.Linfo_string89         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	542                     # DW_AT_decl_line
	.long	2427                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x956:0xc DW_TAG_variable
	.long	.Linfo_string96         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	537                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x962:0xc DW_TAG_variable
	.long	.Linfo_string93         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	540                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x96e:0xc DW_TAG_variable
	.long	.Linfo_string91         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.short	541                     # DW_AT_decl_line
	.long	42                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	15                      # Abbrev [15] 0x97b:0x5 DW_TAG_pointer_type
	.long	2432                    # DW_AT_type
	.byte	16                      # Abbrev [16] 0x980:0x7 DW_TAG_base_type
	.long	.Linfo_string5          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	16                      # Abbrev [16] 0x987:0x7 DW_TAG_base_type
	.long	.Linfo_string7          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	15                      # Abbrev [15] 0x98e:0x5 DW_TAG_pointer_type
	.long	2451                    # DW_AT_type
	.byte	17                      # Abbrev [17] 0x993:0xb DW_TAG_typedef
	.long	2462                    # DW_AT_type
	.long	.Linfo_string53         # DW_AT_name
	.byte	5                       # DW_AT_decl_file
	.byte	48                      # DW_AT_decl_line
	.byte	18                      # Abbrev [18] 0x99e:0x17c DW_TAG_structure_type
	.long	.Linfo_string52         # DW_AT_name
	.byte	216                     # DW_AT_byte_size
	.byte	2                       # DW_AT_decl_file
	.byte	245                     # DW_AT_decl_line
	.byte	19                      # Abbrev [19] 0x9a6:0xc DW_TAG_member
	.long	.Linfo_string9          # DW_AT_name
	.long	2439                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.byte	246                     # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	19                      # Abbrev [19] 0x9b2:0xc DW_TAG_member
	.long	.Linfo_string10         # DW_AT_name
	.long	2842                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.byte	251                     # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	19                      # Abbrev [19] 0x9be:0xc DW_TAG_member
	.long	.Linfo_string12         # DW_AT_name
	.long	2842                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.byte	252                     # DW_AT_decl_line
	.byte	16                      # DW_AT_data_member_location
	.byte	19                      # Abbrev [19] 0x9ca:0xc DW_TAG_member
	.long	.Linfo_string13         # DW_AT_name
	.long	2842                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.byte	253                     # DW_AT_decl_line
	.byte	24                      # DW_AT_data_member_location
	.byte	19                      # Abbrev [19] 0x9d6:0xc DW_TAG_member
	.long	.Linfo_string14         # DW_AT_name
	.long	2842                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.byte	254                     # DW_AT_decl_line
	.byte	32                      # DW_AT_data_member_location
	.byte	19                      # Abbrev [19] 0x9e2:0xc DW_TAG_member
	.long	.Linfo_string15         # DW_AT_name
	.long	2842                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.byte	255                     # DW_AT_decl_line
	.byte	40                      # DW_AT_data_member_location
	.byte	20                      # Abbrev [20] 0x9ee:0xd DW_TAG_member
	.long	.Linfo_string16         # DW_AT_name
	.long	2842                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	256                     # DW_AT_decl_line
	.byte	48                      # DW_AT_data_member_location
	.byte	20                      # Abbrev [20] 0x9fb:0xd DW_TAG_member
	.long	.Linfo_string17         # DW_AT_name
	.long	2842                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	257                     # DW_AT_decl_line
	.byte	56                      # DW_AT_data_member_location
	.byte	20                      # Abbrev [20] 0xa08:0xd DW_TAG_member
	.long	.Linfo_string18         # DW_AT_name
	.long	2842                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	258                     # DW_AT_decl_line
	.byte	64                      # DW_AT_data_member_location
	.byte	20                      # Abbrev [20] 0xa15:0xd DW_TAG_member
	.long	.Linfo_string19         # DW_AT_name
	.long	2842                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	260                     # DW_AT_decl_line
	.byte	72                      # DW_AT_data_member_location
	.byte	20                      # Abbrev [20] 0xa22:0xd DW_TAG_member
	.long	.Linfo_string20         # DW_AT_name
	.long	2842                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	261                     # DW_AT_decl_line
	.byte	80                      # DW_AT_data_member_location
	.byte	20                      # Abbrev [20] 0xa2f:0xd DW_TAG_member
	.long	.Linfo_string21         # DW_AT_name
	.long	2842                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	262                     # DW_AT_decl_line
	.byte	88                      # DW_AT_data_member_location
	.byte	20                      # Abbrev [20] 0xa3c:0xd DW_TAG_member
	.long	.Linfo_string22         # DW_AT_name
	.long	2854                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	264                     # DW_AT_decl_line
	.byte	96                      # DW_AT_data_member_location
	.byte	20                      # Abbrev [20] 0xa49:0xd DW_TAG_member
	.long	.Linfo_string27         # DW_AT_name
	.long	2904                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	266                     # DW_AT_decl_line
	.byte	104                     # DW_AT_data_member_location
	.byte	20                      # Abbrev [20] 0xa56:0xd DW_TAG_member
	.long	.Linfo_string28         # DW_AT_name
	.long	2439                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	268                     # DW_AT_decl_line
	.byte	112                     # DW_AT_data_member_location
	.byte	20                      # Abbrev [20] 0xa63:0xd DW_TAG_member
	.long	.Linfo_string29         # DW_AT_name
	.long	2439                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	272                     # DW_AT_decl_line
	.byte	116                     # DW_AT_data_member_location
	.byte	20                      # Abbrev [20] 0xa70:0xd DW_TAG_member
	.long	.Linfo_string30         # DW_AT_name
	.long	2909                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	274                     # DW_AT_decl_line
	.byte	120                     # DW_AT_data_member_location
	.byte	20                      # Abbrev [20] 0xa7d:0xd DW_TAG_member
	.long	.Linfo_string33         # DW_AT_name
	.long	2927                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	278                     # DW_AT_decl_line
	.byte	128                     # DW_AT_data_member_location
	.byte	20                      # Abbrev [20] 0xa8a:0xd DW_TAG_member
	.long	.Linfo_string35         # DW_AT_name
	.long	2934                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	279                     # DW_AT_decl_line
	.byte	130                     # DW_AT_data_member_location
	.byte	20                      # Abbrev [20] 0xa97:0xd DW_TAG_member
	.long	.Linfo_string37         # DW_AT_name
	.long	2941                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	280                     # DW_AT_decl_line
	.byte	131                     # DW_AT_data_member_location
	.byte	20                      # Abbrev [20] 0xaa4:0xd DW_TAG_member
	.long	.Linfo_string39         # DW_AT_name
	.long	2960                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	284                     # DW_AT_decl_line
	.byte	136                     # DW_AT_data_member_location
	.byte	20                      # Abbrev [20] 0xab1:0xd DW_TAG_member
	.long	.Linfo_string41         # DW_AT_name
	.long	2972                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	293                     # DW_AT_decl_line
	.byte	144                     # DW_AT_data_member_location
	.byte	20                      # Abbrev [20] 0xabe:0xd DW_TAG_member
	.long	.Linfo_string43         # DW_AT_name
	.long	42                      # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	302                     # DW_AT_decl_line
	.byte	152                     # DW_AT_data_member_location
	.byte	20                      # Abbrev [20] 0xacb:0xd DW_TAG_member
	.long	.Linfo_string44         # DW_AT_name
	.long	42                      # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	303                     # DW_AT_decl_line
	.byte	160                     # DW_AT_data_member_location
	.byte	20                      # Abbrev [20] 0xad8:0xd DW_TAG_member
	.long	.Linfo_string45         # DW_AT_name
	.long	42                      # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	304                     # DW_AT_decl_line
	.byte	168                     # DW_AT_data_member_location
	.byte	20                      # Abbrev [20] 0xae5:0xd DW_TAG_member
	.long	.Linfo_string46         # DW_AT_name
	.long	42                      # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	305                     # DW_AT_decl_line
	.byte	176                     # DW_AT_data_member_location
	.byte	20                      # Abbrev [20] 0xaf2:0xd DW_TAG_member
	.long	.Linfo_string47         # DW_AT_name
	.long	2983                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	306                     # DW_AT_decl_line
	.byte	184                     # DW_AT_data_member_location
	.byte	20                      # Abbrev [20] 0xaff:0xd DW_TAG_member
	.long	.Linfo_string50         # DW_AT_name
	.long	2439                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	308                     # DW_AT_decl_line
	.byte	192                     # DW_AT_data_member_location
	.byte	20                      # Abbrev [20] 0xb0c:0xd DW_TAG_member
	.long	.Linfo_string51         # DW_AT_name
	.long	3001                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	310                     # DW_AT_decl_line
	.byte	196                     # DW_AT_data_member_location
	.byte	0                       # End Of Children Mark
	.byte	15                      # Abbrev [15] 0xb1a:0x5 DW_TAG_pointer_type
	.long	2847                    # DW_AT_type
	.byte	16                      # Abbrev [16] 0xb1f:0x7 DW_TAG_base_type
	.long	.Linfo_string11         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	15                      # Abbrev [15] 0xb26:0x5 DW_TAG_pointer_type
	.long	2859                    # DW_AT_type
	.byte	18                      # Abbrev [18] 0xb2b:0x2d DW_TAG_structure_type
	.long	.Linfo_string26         # DW_AT_name
	.byte	24                      # DW_AT_byte_size
	.byte	2                       # DW_AT_decl_file
	.byte	160                     # DW_AT_decl_line
	.byte	19                      # Abbrev [19] 0xb33:0xc DW_TAG_member
	.long	.Linfo_string23         # DW_AT_name
	.long	2854                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.byte	161                     # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	19                      # Abbrev [19] 0xb3f:0xc DW_TAG_member
	.long	.Linfo_string24         # DW_AT_name
	.long	2904                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.byte	162                     # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	19                      # Abbrev [19] 0xb4b:0xc DW_TAG_member
	.long	.Linfo_string25         # DW_AT_name
	.long	2439                    # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.byte	166                     # DW_AT_decl_line
	.byte	16                      # DW_AT_data_member_location
	.byte	0                       # End Of Children Mark
	.byte	15                      # Abbrev [15] 0xb58:0x5 DW_TAG_pointer_type
	.long	2462                    # DW_AT_type
	.byte	17                      # Abbrev [17] 0xb5d:0xb DW_TAG_typedef
	.long	2920                    # DW_AT_type
	.long	.Linfo_string32         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	131                     # DW_AT_decl_line
	.byte	16                      # Abbrev [16] 0xb68:0x7 DW_TAG_base_type
	.long	.Linfo_string31         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	16                      # Abbrev [16] 0xb6f:0x7 DW_TAG_base_type
	.long	.Linfo_string34         # DW_AT_name
	.byte	7                       # DW_AT_encoding
	.byte	2                       # DW_AT_byte_size
	.byte	16                      # Abbrev [16] 0xb76:0x7 DW_TAG_base_type
	.long	.Linfo_string36         # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	21                      # Abbrev [21] 0xb7d:0xc DW_TAG_array_type
	.long	2847                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0xb82:0x6 DW_TAG_subrange_type
	.long	2953                    # DW_AT_type
	.byte	1                       # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	23                      # Abbrev [23] 0xb89:0x7 DW_TAG_base_type
	.long	.Linfo_string38         # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	15                      # Abbrev [15] 0xb90:0x5 DW_TAG_pointer_type
	.long	2965                    # DW_AT_type
	.byte	24                      # Abbrev [24] 0xb95:0x7 DW_TAG_typedef
	.long	.Linfo_string40         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	154                     # DW_AT_decl_line
	.byte	17                      # Abbrev [17] 0xb9c:0xb DW_TAG_typedef
	.long	2920                    # DW_AT_type
	.long	.Linfo_string42         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	132                     # DW_AT_decl_line
	.byte	17                      # Abbrev [17] 0xba7:0xb DW_TAG_typedef
	.long	2994                    # DW_AT_type
	.long	.Linfo_string49         # DW_AT_name
	.byte	4                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.byte	16                      # Abbrev [16] 0xbb2:0x7 DW_TAG_base_type
	.long	.Linfo_string48         # DW_AT_name
	.byte	7                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	21                      # Abbrev [21] 0xbb9:0xc DW_TAG_array_type
	.long	2847                    # DW_AT_type
	.byte	22                      # Abbrev [22] 0xbbe:0x6 DW_TAG_subrange_type
	.long	2953                    # DW_AT_type
	.byte	20                      # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	16                      # Abbrev [16] 0xbc5:0x7 DW_TAG_base_type
	.long	.Linfo_string57         # DW_AT_name
	.byte	2                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	15                      # Abbrev [15] 0xbcc:0x5 DW_TAG_pointer_type
	.long	2842                    # DW_AT_type
	.byte	15                      # Abbrev [15] 0xbd1:0x5 DW_TAG_pointer_type
	.long	2427                    # DW_AT_type
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
	.long	3031                    # Compilation Unit Length
	.long	1856                    # DIE offset
	.asciz	"main"                  # External Name
	.long	43                      # DIE offset
	.asciz	"play"                  # External Name
	.long	1057                    # DIE offset
	.asciz	"findMoves"             # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	3031                    # Compilation Unit Length
	.long	2451                    # DIE offset
	.asciz	"FILE"                  # External Name
	.long	2994                    # DIE offset
	.asciz	"long unsigned int"     # External Name
	.long	2432                    # DIE offset
	.asciz	"long long int"         # External Name
	.long	2439                    # DIE offset
	.asciz	"int"                   # External Name
	.long	2927                    # DIE offset
	.asciz	"unsigned short"        # External Name
	.long	2983                    # DIE offset
	.asciz	"size_t"                # External Name
	.long	2909                    # DIE offset
	.asciz	"__off_t"               # External Name
	.long	3013                    # DIE offset
	.asciz	"_Bool"                 # External Name
	.long	2965                    # DIE offset
	.asciz	"_IO_lock_t"            # External Name
	.long	2462                    # DIE offset
	.asciz	"_IO_FILE"              # External Name
	.long	2972                    # DIE offset
	.asciz	"__off64_t"             # External Name
	.long	2859                    # DIE offset
	.asciz	"_IO_marker"            # External Name
	.long	2934                    # DIE offset
	.asciz	"signed char"           # External Name
	.long	2920                    # DIE offset
	.asciz	"long int"              # External Name
	.long	2847                    # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
