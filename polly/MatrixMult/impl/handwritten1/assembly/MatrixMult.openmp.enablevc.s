	.text
	.file	"MatrixMult.openmp.enablevc.ll"
	.file	1 "MatrixMult.c"
	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
.Lfunc_begin0:
	.loc	1 13 0                  # MatrixMult.c:13:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 16 16 prologue_end    # MatrixMult.c:16:16
	pushq	%r14
.Ltmp0:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp1:
	.cfi_def_cfa_offset 24
	pushq	%rax
.Ltmp2:
	.cfi_def_cfa_offset 32
.Ltmp3:
	.cfi_offset %rbx, -24
.Ltmp4:
	.cfi_offset %r14, -16
	movl	$16000, %edi            # imm = 0x3E80
	callq	malloc
	movq	%rax, %rbx
	.loc	1 16 7 is_stmt 0        # MatrixMult.c:16:7
	movq	%rbx, A(%rip)
	.loc	1 17 18 is_stmt 1       # MatrixMult.c:17:18
	movl	$16000000, %edi         # imm = 0xF42400
	callq	malloc
	.loc	1 17 10 is_stmt 0       # MatrixMult.c:17:10
	movq	%rax, (%rbx)
	xorl	%eax, %eax
	movl	$32000, %ecx            # imm = 0x7D00
.Ltmp5:
	#DEBUG_VALUE: init:i <- 0
	.p2align	4, 0x90
.LBB0_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 20 18 is_stmt 1       # MatrixMult.c:20:18
	movq	A(%rip), %rdx
	.loc	1 20 17 is_stmt 0       # MatrixMult.c:20:17
	movq	(%rdx), %rsi
	.loc	1 20 14                 # MatrixMult.c:20:14
	leaq	-32000(%rsi,%rcx), %rsi
	movq	%rsi, (%rdx,%rax)
	.loc	1 20 18                 # MatrixMult.c:20:18
	movq	A(%rip), %rdx
	.loc	1 20 17                 # MatrixMult.c:20:17
	movq	(%rdx), %rsi
	.loc	1 20 14                 # MatrixMult.c:20:14
	leaq	-24000(%rsi,%rcx), %rsi
	movq	%rsi, 8(%rdx,%rax)
	.loc	1 20 18                 # MatrixMult.c:20:18
	movq	A(%rip), %rdx
	.loc	1 20 17                 # MatrixMult.c:20:17
	movq	(%rdx), %rsi
	.loc	1 20 14                 # MatrixMult.c:20:14
	leaq	-16000(%rsi,%rcx), %rsi
	movq	%rsi, 16(%rdx,%rax)
	.loc	1 20 18                 # MatrixMult.c:20:18
	movq	A(%rip), %rdx
	.loc	1 20 17                 # MatrixMult.c:20:17
	movq	(%rdx), %rsi
	.loc	1 20 14                 # MatrixMult.c:20:14
	leaq	-8000(%rsi,%rcx), %rsi
	movq	%rsi, 24(%rdx,%rax)
	.loc	1 20 18                 # MatrixMult.c:20:18
	movq	A(%rip), %rdx
	movq	(%rdx), %rsi
	.loc	1 20 14                 # MatrixMult.c:20:14
	addq	%rcx, %rsi
	movq	%rsi, 32(%rdx,%rax)
.Ltmp6:
	.loc	1 19 5 is_stmt 1 discriminator 1 # MatrixMult.c:19:5
	addq	$40, %rax
	addq	$40000, %rcx            # imm = 0x9C40
	cmpq	$16000, %rax            # imm = 0x3E80
	jne	.LBB0_1
.Ltmp7:
# BB#2:                                 # %for.cond6.preheader.preheader
	.loc	1 32 23                 # MatrixMult.c:32:23
	movq	A(%rip), %r8
	xorl	%ecx, %ecx
	movl	$B+48, %r10d
	movl	$B+16, %r9d
	movl	$B, %r14d
.Ltmp8:
	.loc	1 25 21                 # MatrixMult.c:25:21
	pxor	%xmm0, %xmm0
	xorl	%r11d, %r11d
	.p2align	4, 0x90
.LBB0_3:                                # %for.cond6.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
                                        #     Child Loop BB0_7 Depth 2
	.loc	1 25 13 is_stmt 0       # MatrixMult.c:25:13
	imulq	$8000, %r11, %rdx       # imm = 0x1F40
	leaq	B+7996(%rdx), %rsi
	movq	(%r8,%r11,8), %rax
.Ltmp9:
	.loc	1 24 9 is_stmt 1 discriminator 1 # MatrixMult.c:24:9
	cmpq	%rsi, %rax
	ja	.LBB0_4
# BB#5:                                 # %for.cond6.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
.Ltmp10:
	.loc	1 25 13                 # MatrixMult.c:25:13
	leaq	B(%rdx), %rdx
.Ltmp11:
	.loc	1 24 9 discriminator 1  # MatrixMult.c:24:9
	leaq	7996(%rax), %rsi
	cmpq	%rsi, %rdx
	movq	%r10, %rsi
	movl	$12, %edi
	movq	%r9, %rbx
	movl	$4, %edx
	ja	.LBB0_6
	.p2align	4, 0x90
.LBB0_7:                                # %for.body8
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp12:
	.loc	1 25 21                 # MatrixMult.c:25:21
	movl	$0, -16(%rax,%rdx,4)
	.loc	1 26 21                 # MatrixMult.c:26:21
	movl	$0, -16(%rbx)
	.loc	1 25 21                 # MatrixMult.c:25:21
	movl	$0, -12(%rax,%rdx,4)
	.loc	1 26 21                 # MatrixMult.c:26:21
	movl	$0, -12(%rbx)
	.loc	1 25 21                 # MatrixMult.c:25:21
	movl	$0, -8(%rax,%rdx,4)
	.loc	1 26 21                 # MatrixMult.c:26:21
	movl	$0, -8(%rbx)
	.loc	1 25 21                 # MatrixMult.c:25:21
	movl	$0, -4(%rax,%rdx,4)
	.loc	1 26 21                 # MatrixMult.c:26:21
	movl	$0, -4(%rbx)
	.loc	1 25 21                 # MatrixMult.c:25:21
	movl	$0, (%rax,%rdx,4)
	.loc	1 26 21                 # MatrixMult.c:26:21
	movl	$0, (%rbx)
.Ltmp13:
	.loc	1 24 9 discriminator 1  # MatrixMult.c:24:9
	addq	$5, %rdx
	addq	$20, %rbx
	cmpq	$2004, %rdx             # imm = 0x7D4
	jne	.LBB0_7
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_4:                                #   in Loop: Header=BB0_3 Depth=1
	movq	%r10, %rsi
	movl	$12, %edi
	.p2align	4, 0x90
.LBB0_6:                                # %vector.body
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp14:
	.loc	1 25 21                 # MatrixMult.c:25:21
	movdqu	%xmm0, -48(%rax,%rdi,4)
	movdqu	%xmm0, -32(%rax,%rdi,4)
	.loc	1 26 21                 # MatrixMult.c:26:21
	movdqa	%xmm0, -48(%rsi)
	movdqa	%xmm0, -32(%rsi)
	.loc	1 25 21                 # MatrixMult.c:25:21
	movdqu	%xmm0, -16(%rax,%rdi,4)
	movdqu	%xmm0, (%rax,%rdi,4)
	.loc	1 26 21                 # MatrixMult.c:26:21
	movdqa	%xmm0, -16(%rsi)
	movdqa	%xmm0, (%rsi)
.Ltmp15:
	.loc	1 24 9 discriminator 1  # MatrixMult.c:24:9
	addq	$16, %rdi
	addq	$64, %rsi
	cmpq	$2012, %rdi             # imm = 0x7DC
	jne	.LBB0_6
.Ltmp16:
.LBB0_8:                                # %for.inc20
                                        #   in Loop: Header=BB0_3 Depth=1
	.loc	1 23 5 discriminator 1  # MatrixMult.c:23:5
	incq	%r11
	addq	$8000, %r10             # imm = 0x1F40
	addq	$8000, %r9              # imm = 0x1F40
	cmpq	$2000, %r11             # imm = 0x7D0
	jne	.LBB0_3
.Ltmp17:
	.p2align	4, 0x90
.LBB0_9:                                # %for.cond26.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_12 Depth 2
                                        #     Child Loop BB0_13 Depth 2
	.loc	1 32 23                 # MatrixMult.c:32:23
	imulq	$8000, %rcx, %rdx       # imm = 0x1F40
	leaq	B+7996(%rdx), %rsi
	movq	(%r8,%rcx,8), %rax
.Ltmp18:
	.loc	1 31 9 discriminator 1  # MatrixMult.c:31:9
	cmpq	%rsi, %rax
	ja	.LBB0_11
# BB#10:                                # %for.cond26.preheader
                                        #   in Loop: Header=BB0_9 Depth=1
.Ltmp19:
	.loc	1 32 23                 # MatrixMult.c:32:23
	leaq	B(%rdx), %rdx
.Ltmp20:
	.loc	1 31 9 discriminator 1  # MatrixMult.c:31:9
	leaq	7996(%rax), %rsi
	cmpq	%rsi, %rdx
	movl	$1, %edx
	ja	.LBB0_11
	.p2align	4, 0x90
.LBB0_13:                               # %for.body28
                                        #   Parent Loop BB0_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp21:
	.loc	1 32 21                 # MatrixMult.c:32:21
	addl	%ecx, -4(%rax,%rdx,4)
	.loc	1 33 21                 # MatrixMult.c:33:21
	addl	%ecx, -4(%r14,%rdx,4)
	.loc	1 32 21                 # MatrixMult.c:32:21
	addl	%ecx, (%rax,%rdx,4)
	.loc	1 33 21                 # MatrixMult.c:33:21
	addl	%ecx, (%r14,%rdx,4)
.Ltmp22:
	.loc	1 31 9 discriminator 1  # MatrixMult.c:31:9
	addq	$2, %rdx
	cmpq	$2001, %rdx             # imm = 0x7D1
	jne	.LBB0_13
	jmp	.LBB0_14
	.p2align	4, 0x90
.LBB0_11:                               # %vector.ph119
                                        #   in Loop: Header=BB0_9 Depth=1
	movd	%ecx, %xmm0
	pshufd	$0, %xmm0, %xmm0        # xmm0 = xmm0[0,0,0,0]
	movq	%r14, %rsi
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB0_12:                               # %vector.body103
                                        #   Parent Loop BB0_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp23:
	.loc	1 32 23                 # MatrixMult.c:32:23
	movdqu	(%rax,%rdi,4), %xmm1
	movdqu	16(%rax,%rdi,4), %xmm2
	.loc	1 32 31 is_stmt 0       # MatrixMult.c:32:31
	paddd	%xmm0, %xmm1
	paddd	%xmm0, %xmm2
	.loc	1 32 21                 # MatrixMult.c:32:21
	movdqu	%xmm1, (%rax,%rdi,4)
	movdqu	%xmm2, 16(%rax,%rdi,4)
	movdqa	(%rsi), %xmm1
	.loc	1 33 31 is_stmt 1       # MatrixMult.c:33:31
	paddd	%xmm0, %xmm1
	movdqa	16(%rsi), %xmm2
	paddd	%xmm0, %xmm2
	.loc	1 33 21 is_stmt 0       # MatrixMult.c:33:21
	movdqa	%xmm1, (%rsi)
	movdqa	%xmm2, 16(%rsi)
.Ltmp24:
	.loc	1 31 9 is_stmt 1 discriminator 1 # MatrixMult.c:31:9
	addq	$8, %rdi
	addq	$32, %rsi
	cmpq	$2000, %rdi             # imm = 0x7D0
	jne	.LBB0_12
.Ltmp25:
.LBB0_14:                               # %for.inc49
                                        #   in Loop: Header=BB0_9 Depth=1
	.loc	1 30 5 discriminator 1  # MatrixMult.c:30:5
	incq	%rcx
	addq	$8000, %r14             # imm = 0x1F40
	cmpq	$2000, %rcx             # imm = 0x7D0
	jne	.LBB0_9
.Ltmp26:
# BB#15:                                # %for.end51
	.loc	1 36 1                  # MatrixMult.c:36:1
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
.Ltmp27:
.Lfunc_end0:
	.size	init, .Lfunc_end0-init
	.cfi_endproc

	.globl	mat_mult
	.p2align	4, 0x90
	.type	mat_mult,@function
mat_mult:                               # @mat_mult
.Lfunc_begin1:
	.loc	1 38 0                  # MatrixMult.c:38:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 44 37 prologue_end    # MatrixMult.c:44:37
	pushq	%rbx
.Ltmp28:
	.cfi_def_cfa_offset 16
.Ltmp29:
	.cfi_offset %rbx, -16
.Ltmp30:
	#DEBUG_VALUE: mat_mult:i <- 0
	movq	A(%rip), %r8
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB1_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
                                        #       Child Loop BB1_3 Depth 3
	movq	(%r8,%r9,8), %r10
.Ltmp31:
	.loc	1 41 9 discriminator 1  # MatrixMult.c:41:9
	addq	$4, %r10
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB1_2:                                # %for.body3
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_3 Depth 3
.Ltmp32:
	.loc	1 42 13                 # MatrixMult.c:42:13
	imulq	$16000, %r9, %rax       # imm = 0x3E80
	leaq	C(%rax,%rsi,8), %r11
	.loc	1 42 21 is_stmt 0       # MatrixMult.c:42:21
	movq	$0, C(%rax,%rsi,8)
	movq	$-16000000, %rax        # imm = 0xFFFFFFFFFF0BDC00
.Ltmp33:
	#DEBUG_VALUE: mat_mult:k <- 0
	.loc	1 44 27 is_stmt 1       # MatrixMult.c:44:27
	movq	%r10, %rdx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_3:                                # %for.body8
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	.loc	1 44 37 is_stmt 0       # MatrixMult.c:44:37
	movslq	B+16000000(%rax,%rsi,4), %rdi
	movslq	-4(%rdx), %rbx
	.loc	1 44 45                 # MatrixMult.c:44:45
	imulq	%rdi, %rbx
	.loc	1 44 35                 # MatrixMult.c:44:35
	addq	%rcx, %rbx
	.loc	1 44 37                 # MatrixMult.c:44:37
	movslq	B+16008000(%rax,%rsi,4), %rdi
	movslq	(%rdx), %rcx
	.loc	1 44 45                 # MatrixMult.c:44:45
	imulq	%rdi, %rcx
	.loc	1 44 35                 # MatrixMult.c:44:35
	addq	%rbx, %rcx
	.loc	1 43 13 is_stmt 1 discriminator 1 # MatrixMult.c:43:13
	addq	$8, %rdx
	addq	$16000, %rax            # imm = 0x3E80
	jne	.LBB1_3
# BB#4:                                 # %for.inc25
                                        #   in Loop: Header=BB1_2 Depth=2
	.loc	1 44 27                 # MatrixMult.c:44:27
	movq	%rcx, (%r11)
.Ltmp34:
	.loc	1 41 9 discriminator 1  # MatrixMult.c:41:9
	incq	%rsi
	cmpq	$2000, %rsi             # imm = 0x7D0
	jne	.LBB1_2
.Ltmp35:
# BB#5:                                 # %for.inc28
                                        #   in Loop: Header=BB1_1 Depth=1
	.loc	1 40 5 discriminator 1  # MatrixMult.c:40:5
	incq	%r9
	cmpq	$2000, %r9              # imm = 0x7D0
	jne	.LBB1_1
.Ltmp36:
# BB#6:                                 # %for.end30
	.loc	1 47 1                  # MatrixMult.c:47:1
	popq	%rbx
	retq
.Ltmp37:
.Lfunc_end1:
	.size	mat_mult, .Lfunc_end1-mat_mult
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin2:
	.loc	1 63 0                  # MatrixMult.c:63:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 64 5 prologue_end     # MatrixMult.c:64:5
	subq	$40, %rsp
.Ltmp38:
	.cfi_def_cfa_offset 48
	callq	init
	.loc	1 65 5                  # MatrixMult.c:65:5
	callq	mat_mult
	.loc	1 68 5                  # MatrixMult.c:68:5
	movl	$.L.str, %edi
	movl	$2000, %esi             # imm = 0x7D0
	movl	$2000, %edx             # imm = 0x7D0
	xorl	%eax, %eax
	callq	printf
	.loc	1 70 19                 # MatrixMult.c:70:19
	movq	A(%rip), %rax
	movq	15992(%rax), %rax
	movl	7996(%rax), %ecx
	.loc	1 71 19                 # MatrixMult.c:71:19
	movl	B+15999996(%rip), %eax
	movl	$31999992, %edx         # imm = 0x1E847F8
	.loc	1 72 19                 # MatrixMult.c:72:19
	movq	C(%rdx), %rdx
	.loc	1 69 5                  # MatrixMult.c:69:5
	movq	%rdx, 24(%rsp)
	movl	%eax, (%rsp)
	movl	$1999, 16(%rsp)         # imm = 0x7CF
	movl	$1999, 8(%rsp)          # imm = 0x7CF
	movl	$.L.str.1, %edi
	movl	$1999, %esi             # imm = 0x7CF
	movl	$1999, %edx             # imm = 0x7CF
	movl	$1999, %r8d             # imm = 0x7CF
	movl	$1999, %r9d             # imm = 0x7CF
	xorl	%eax, %eax
	callq	printf
	.loc	1 73 5                  # MatrixMult.c:73:5
	xorl	%eax, %eax
	addq	$40, %rsp
	retq
.Ltmp39:
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc

	.type	A,@object               # @A
	.comm	A,8,8
	.type	B,@object               # @B
	.comm	B,16000000,16
	.type	C,@object               # @C
	.comm	C,32000000,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Pass %d X %d matrix test case \n"
	.size	.L.str, 32

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"A[%d][%d] = %d, B[%d][%d] =%d, C[%d][%d] =%lld \n"
	.size	.L.str.1, 49

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)" # string offset=0
.Linfo_string1:
	.asciz	"MatrixMult.c"          # string offset=165
.Linfo_string2:
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten1" # string offset=178
.Linfo_string3:
	.asciz	"A"                     # string offset=246
.Linfo_string4:
	.asciz	"int"                   # string offset=248
.Linfo_string5:
	.asciz	"B"                     # string offset=252
.Linfo_string6:
	.asciz	"sizetype"              # string offset=254
.Linfo_string7:
	.asciz	"C"                     # string offset=263
.Linfo_string8:
	.asciz	"long long int"         # string offset=265
.Linfo_string9:
	.asciz	"init"                  # string offset=279
.Linfo_string10:
	.asciz	"mat_mult"              # string offset=284
.Linfo_string11:
	.asciz	"main"                  # string offset=293
.Linfo_string12:
	.asciz	"i"                     # string offset=298
.Linfo_string13:
	.asciz	"j"                     # string offset=300
.Linfo_string14:
	.asciz	"k"                     # string offset=302
	.section	.debug_loc,"",@progbits
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
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	3                       # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	4                       # Abbreviation Code
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
	.byte	5                       # Abbreviation Code
	.byte	1                       # DW_TAG_array_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	6                       # Abbreviation Code
	.byte	33                      # DW_TAG_subrange_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	55                      # DW_AT_count
	.byte	5                       # DW_FORM_data2
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	7                       # Abbreviation Code
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
	.byte	11                      # DW_FORM_data1
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
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
	.byte	10                      # Abbreviation Code
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
	.byte	11                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	0                       # DW_CHILDREN_no
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
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	300                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x125 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x15 DW_TAG_variable
	.long	.Linfo_string3          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	A
	.byte	3                       # Abbrev [3] 0x3f:0x5 DW_TAG_pointer_type
	.long	68                      # DW_AT_type
	.byte	3                       # Abbrev [3] 0x44:0x5 DW_TAG_pointer_type
	.long	73                      # DW_AT_type
	.byte	4                       # Abbrev [4] 0x49:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	2                       # Abbrev [2] 0x50:0x15 DW_TAG_variable
	.long	.Linfo_string5          # DW_AT_name
	.long	101                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	B
	.byte	5                       # Abbrev [5] 0x65:0x14 DW_TAG_array_type
	.long	73                      # DW_AT_type
	.byte	6                       # Abbrev [6] 0x6a:0x7 DW_TAG_subrange_type
	.long	121                     # DW_AT_type
	.short	2000                    # DW_AT_count
	.byte	6                       # Abbrev [6] 0x71:0x7 DW_TAG_subrange_type
	.long	121                     # DW_AT_type
	.short	2000                    # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x79:0x7 DW_TAG_base_type
	.long	.Linfo_string6          # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	2                       # Abbrev [2] 0x80:0x15 DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.long	149                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	C
	.byte	5                       # Abbrev [5] 0x95:0x14 DW_TAG_array_type
	.long	169                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x9a:0x7 DW_TAG_subrange_type
	.long	121                     # DW_AT_type
	.short	2000                    # DW_AT_count
	.byte	6                       # Abbrev [6] 0xa1:0x7 DW_TAG_subrange_type
	.long	121                     # DW_AT_type
	.short	2000                    # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	4                       # Abbrev [4] 0xa9:0x7 DW_TAG_base_type
	.long	.Linfo_string8          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	8                       # Abbrev [8] 0xb0:0x2d DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	9                       # Abbrev [9] 0xc5:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	73                      # DW_AT_type
	.byte	10                      # Abbrev [10] 0xd1:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	73                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	8                       # Abbrev [8] 0xdd:0x39 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	38                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	9                       # Abbrev [9] 0xf2:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	39                      # DW_AT_decl_line
	.long	73                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0xfe:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	39                      # DW_AT_decl_line
	.long	73                      # DW_AT_type
	.byte	10                      # Abbrev [10] 0x10a:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	39                      # DW_AT_decl_line
	.long	73                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	11                      # Abbrev [11] 0x116:0x19 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	73                      # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
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
	.long	304                     # Compilation Unit Length
	.long	42                      # DIE offset
	.asciz	"A"                     # External Name
	.long	80                      # DIE offset
	.asciz	"B"                     # External Name
	.long	128                     # DIE offset
	.asciz	"C"                     # External Name
	.long	176                     # DIE offset
	.asciz	"init"                  # External Name
	.long	278                     # DIE offset
	.asciz	"main"                  # External Name
	.long	221                     # DIE offset
	.asciz	"mat_mult"              # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	304                     # Compilation Unit Length
	.long	73                      # DIE offset
	.asciz	"int"                   # External Name
	.long	169                     # DIE offset
	.asciz	"long long int"         # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
