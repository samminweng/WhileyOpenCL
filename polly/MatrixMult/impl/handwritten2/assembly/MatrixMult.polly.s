	.text
	.file	"MatrixMult.polly.ll"
	.file	1 "MatrixMult.c"
	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
.Lfunc_begin0:
	.loc	1 12 0                  # MatrixMult.c:12:0
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
	subq	$72, %rsp
.Ltmp6:
	.cfi_def_cfa_offset 128
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
	xorl	%r12d, %r12d
.Ltmp13:
	.loc	1 17 22 prologue_end    # MatrixMult.c:17:22
	xorl	%edi, %edi
	callq	time
	.loc	1 17 5 is_stmt 0 discriminator 1 # MatrixMult.c:17:5
	movl	%eax, %edi
	callq	srand
.Ltmp14:
	#DEBUG_VALUE: init:i <- 0
	movl	$R, %r14d
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB0_1:                                # %for.cond2.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	movq	%r14, %rbx
	movl	$2000, %ebp             # imm = 0x7D0
	.p2align	4, 0x90
.LBB0_2:                                # %for.body5
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp15:
	.loc	1 21 23 is_stmt 1       # MatrixMult.c:21:23
	callq	rand
	.loc	1 21 29 is_stmt 0       # MatrixMult.c:21:29
	cltq
	imulq	$1717986919, %rax, %rcx # imm = 0x66666667
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$34, %rcx
	addl	%edx, %ecx
	addl	%ecx, %ecx
	leal	(%rcx,%rcx,4), %ecx
	subl	%ecx, %eax
	.loc	1 21 21                 # MatrixMult.c:21:21
	movl	%eax, (%rbx)
.Ltmp16:
	.loc	1 19 9 is_stmt 1 discriminator 1 # MatrixMult.c:19:9
	addq	$4, %rbx
	decq	%rbp
	jne	.LBB0_2
.Ltmp17:
# BB#3:                                 # %for.inc9
                                        #   in Loop: Header=BB0_1 Depth=1
	.loc	1 18 5 discriminator 1  # MatrixMult.c:18:5
	incq	%r15
	addq	$8000, %r14             # imm = 0x1F40
	cmpq	$2000, %r15             # imm = 0x7D0
	jne	.LBB0_1
.Ltmp18:
# BB#4:
	movl	$R, %ecx
	movl	$A, %edx
	movl	$B, %esi
	.p2align	4, 0x90
.LBB0_5:                                # %polly.loop_preheader74
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
                                        #       Child Loop BB0_7 Depth 3
	movq	%rsi, 8(%rsp)           # 8-byte Spill
	movq	%rdx, 16(%rsp)          # 8-byte Spill
	movq	%rcx, 24(%rsp)          # 8-byte Spill
	movq	%r12, 32(%rsp)          # 8-byte Spill
	movq	%r12, %rax
	shlq	$5, %rax
	movl	$1999, %r13d            # imm = 0x7CF
	subq	%rax, %r13
	cmpq	$31, %r13
	movl	$31, %eax
	cmovgq	%rax, %r13
	decq	%r13
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_6:                                # %polly.loop_header73
                                        #   Parent Loop BB0_5 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_7 Depth 3
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movq	%rdx, 48(%rsp)          # 8-byte Spill
	movq	%rcx, 56(%rsp)          # 8-byte Spill
	movq	%rsi, 64(%rsp)          # 8-byte Spill
	movq	%rax, %r14
	shlq	$5, %r14
	addq	$-2000, %r14            # imm = 0xFFFFFFFFFFFFF830
	cmpq	$-33, %r14
	movq	$-32, %rax
	cmovleq	%rax, %r14
	shlq	$2, %r14
	negq	%r14
	movq	$-1, %rbp
	movq	%rsi, %r15
	movq	%rcx, %rbx
	movq	%rdx, %r12
	.p2align	4, 0x90
.LBB0_7:                                # %polly.loop_header79
                                        #   Parent Loop BB0_5 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	%r12, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	memcpy
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	memcpy
	incq	%rbp
	addq	$8000, %r12             # imm = 0x1F40
	addq	$8000, %rbx             # imm = 0x1F40
	addq	$8000, %r15             # imm = 0x1F40
	cmpq	%r13, %rbp
	jle	.LBB0_7
# BB#8:                                 # %polly.loop_exit81
                                        #   in Loop: Header=BB0_6 Depth=2
	movq	40(%rsp), %rax          # 8-byte Reload
	incq	%rax
	movq	48(%rsp), %rdx          # 8-byte Reload
	subq	$-128, %rdx
	movq	56(%rsp), %rcx          # 8-byte Reload
	subq	$-128, %rcx
	movq	64(%rsp), %rsi          # 8-byte Reload
	subq	$-128, %rsi
	cmpq	$63, %rax
	jne	.LBB0_6
# BB#9:                                 # %polly.loop_exit75
                                        #   in Loop: Header=BB0_5 Depth=1
	movq	32(%rsp), %r12          # 8-byte Reload
	incq	%r12
	movq	16(%rsp), %rdx          # 8-byte Reload
	addq	$256000, %rdx           # imm = 0x3E800
	movq	24(%rsp), %rcx          # 8-byte Reload
	addq	$256000, %rcx           # imm = 0x3E800
	movq	8(%rsp), %rsi           # 8-byte Reload
	addq	$256000, %rsi           # imm = 0x3E800
	cmpq	$63, %r12
	jne	.LBB0_5
# BB#10:                                # %polly.exiting
	.loc	1 33 1                  # MatrixMult.c:33:1
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp19:
.Lfunc_end0:
	.size	init, .Lfunc_end0-init
	.cfi_endproc

	.globl	mat_mult
	.p2align	4, 0x90
	.type	mat_mult,@function
mat_mult:                               # @mat_mult
.Lfunc_begin1:
	.loc	1 35 0                  # MatrixMult.c:35:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 39 2 prologue_end discriminator 1 # MatrixMult.c:39:2
	subq	$7880, %rsp             # imm = 0x1EC8
.Ltmp20:
	.cfi_def_cfa_offset 7888
.Ltmp21:
	#DEBUG_VALUE: mat_mult:j <- 0
	leaq	-112(%rsp), %r8
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB1_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
                                        #     Child Loop BB1_3 Depth 2
                                        #       Child Loop BB1_4 Depth 3
	movq	$-16000000, %rax        # imm = 0xFFFFFFFFFF0BDC00
	movq	%r8, %rcx
	.p2align	4, 0x90
.LBB1_2:                                # %for.body3
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp22:
	.loc	1 42 13                 # MatrixMult.c:42:13
	movl	B+16000000(%rax,%r9,4), %edx
	.loc	1 42 11 is_stmt 0       # MatrixMult.c:42:11
	movl	%edx, -16(%rcx)
	.loc	1 42 13                 # MatrixMult.c:42:13
	movl	B+16008000(%rax,%r9,4), %edx
	.loc	1 42 11                 # MatrixMult.c:42:11
	movl	%edx, -12(%rcx)
	.loc	1 42 13                 # MatrixMult.c:42:13
	movl	B+16016000(%rax,%r9,4), %edx
	.loc	1 42 11                 # MatrixMult.c:42:11
	movl	%edx, -8(%rcx)
	.loc	1 42 13                 # MatrixMult.c:42:13
	movl	B+16024000(%rax,%r9,4), %edx
	.loc	1 42 11                 # MatrixMult.c:42:11
	movl	%edx, -4(%rcx)
	.loc	1 42 13                 # MatrixMult.c:42:13
	movl	B+16032000(%rax,%r9,4), %edx
	.loc	1 42 11                 # MatrixMult.c:42:11
	movl	%edx, (%rcx)
.Ltmp23:
	.loc	1 41 3 is_stmt 1 discriminator 1 # MatrixMult.c:41:3
	addq	$20, %rcx
	addq	$40000, %rax            # imm = 0x9C40
	movl	$A+12, %r10d
	movl	$0, %esi
	jne	.LBB1_2
.Ltmp24:
	.p2align	4, 0x90
.LBB1_3:                                # %for.cond11.preheader
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_4 Depth 3
	xorl	%ecx, %ecx
	movq	%r10, %rdi
	movl	$3, %eax
	.p2align	4, 0x90
.LBB1_4:                                # %for.body13
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
.Ltmp25:
	.loc	1 48 25                 # MatrixMult.c:48:25
	movl	-140(%rsp,%rax,4), %edx
	.loc	1 48 24 is_stmt 0       # MatrixMult.c:48:24
	imull	-12(%rdi), %edx
	.loc	1 48 15                 # MatrixMult.c:48:15
	addl	%ecx, %edx
.Ltmp26:
	#DEBUG_VALUE: sum <- %EDX
	.loc	1 48 25                 # MatrixMult.c:48:25
	movl	-136(%rsp,%rax,4), %ecx
	.loc	1 48 24                 # MatrixMult.c:48:24
	imull	-8(%rdi), %ecx
	.loc	1 48 15                 # MatrixMult.c:48:15
	addl	%edx, %ecx
	.loc	1 48 25                 # MatrixMult.c:48:25
	movl	-132(%rsp,%rax,4), %edx
.Ltmp27:
	.loc	1 48 24                 # MatrixMult.c:48:24
	imull	-4(%rdi), %edx
	.loc	1 48 15                 # MatrixMult.c:48:15
	addl	%ecx, %edx
	.loc	1 48 25                 # MatrixMult.c:48:25
	movl	-128(%rsp,%rax,4), %ecx
	.loc	1 48 24                 # MatrixMult.c:48:24
	imull	(%rdi), %ecx
	.loc	1 48 15                 # MatrixMult.c:48:15
	addl	%edx, %ecx
.Ltmp28:
	.loc	1 47 4 is_stmt 1 discriminator 1 # MatrixMult.c:47:4
	addq	$4, %rax
	addq	$16, %rdi
	cmpq	$2003, %rax             # imm = 0x7D3
	jne	.LBB1_4
.Ltmp29:
# BB#5:                                 # %for.end22
                                        #   in Loop: Header=BB1_3 Depth=2
	.loc	1 50 4                  # MatrixMult.c:50:4
	imulq	$8000, %rsi, %rax       # imm = 0x1F40
	.loc	1 50 12 is_stmt 0       # MatrixMult.c:50:12
	movl	%ecx, C(%rax,%r9,4)
.Ltmp30:
	.loc	1 45 3 is_stmt 1 discriminator 1 # MatrixMult.c:45:3
	incq	%rsi
	addq	$8000, %r10             # imm = 0x1F40
	cmpq	$2000, %rsi             # imm = 0x7D0
	jne	.LBB1_3
.Ltmp31:
# BB#6:                                 # %for.inc30
                                        #   in Loop: Header=BB1_1 Depth=1
	.loc	1 39 2 discriminator 1  # MatrixMult.c:39:2
	incq	%r9
	cmpq	$2000, %r9              # imm = 0x7D0
	jne	.LBB1_1
.Ltmp32:
# BB#7:                                 # %for.end32
	.loc	1 53 1                  # MatrixMult.c:53:1
	addq	$7880, %rsp             # imm = 0x1EC8
	retq
.Ltmp33:
.Lfunc_end1:
	.size	mat_mult, .Lfunc_end1-mat_mult
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin2:
	.loc	1 98 0                  # MatrixMult.c:98:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 99 2 prologue_end     # MatrixMult.c:99:2
	subq	$40, %rsp
.Ltmp34:
	.cfi_def_cfa_offset 48
	callq	init
	.loc	1 100 2                 # MatrixMult.c:100:2
	callq	mat_mult
	.loc	1 102 2                 # MatrixMult.c:102:2
	movl	$.L.str, %edi
	movl	$2000, %esi             # imm = 0x7D0
	movl	$2000, %edx             # imm = 0x7D0
	xorl	%eax, %eax
	callq	printf
	.loc	1 104 19                # MatrixMult.c:104:19
	movl	A+15999996(%rip), %ecx
	.loc	1 105 19                # MatrixMult.c:105:19
	movl	B+15999996(%rip), %eax
	.loc	1 106 19                # MatrixMult.c:106:19
	movl	C+15999996(%rip), %edx
	.loc	1 103 5                 # MatrixMult.c:103:5
	movl	%edx, 24(%rsp)
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
	.loc	1 108 5                 # MatrixMult.c:108:5
	xorl	%eax, %eax
	addq	$40, %rsp
	retq
.Ltmp35:
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc

	.type	R,@object               # @R
	.comm	R,16000000,16
	.type	A,@object               # @A
	.comm	A,16000000,16
	.type	B,@object               # @B
	.comm	B,16000000,16
	.type	C,@object               # @C
	.comm	C,16000000,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Pass %d X %d matrix test case \n"
	.size	.L.str, 32

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"A[%d][%d] = %d, B[%d][%d] =%d, C[%d][%d] =%d \n"
	.size	.L.str.1, 47

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)" # string offset=0
.Linfo_string1:
	.asciz	"MatrixMult.c"          # string offset=165
.Linfo_string2:
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten2" # string offset=178
.Linfo_string3:
	.asciz	"A"                     # string offset=246
.Linfo_string4:
	.asciz	"int"                   # string offset=248
.Linfo_string5:
	.asciz	"sizetype"              # string offset=252
.Linfo_string6:
	.asciz	"B"                     # string offset=261
.Linfo_string7:
	.asciz	"C"                     # string offset=263
.Linfo_string8:
	.asciz	"R"                     # string offset=265
.Linfo_string9:
	.asciz	"unsigned int"          # string offset=267
.Linfo_string10:
	.asciz	"init"                  # string offset=280
.Linfo_string11:
	.asciz	"mat_mult"              # string offset=285
.Linfo_string12:
	.asciz	"main"                  # string offset=294
.Linfo_string13:
	.asciz	"i"                     # string offset=299
.Linfo_string14:
	.asciz	"j"                     # string offset=301
.Linfo_string15:
	.asciz	"b_t"                   # string offset=303
.Linfo_string16:
	.asciz	"sum"                   # string offset=307
.Linfo_string17:
	.asciz	"k"                     # string offset=311
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Ltmp26-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	81                      # super-register DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
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
	.byte	1                       # DW_TAG_array_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	4                       # Abbreviation Code
	.byte	33                      # DW_TAG_subrange_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	55                      # DW_AT_count
	.byte	5                       # DW_FORM_data2
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	5                       # Abbreviation Code
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
	.byte	6                       # Abbreviation Code
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
	.byte	7                       # Abbreviation Code
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
	.byte	8                       # Abbreviation Code
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
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
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
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
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
	.long	347                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x154 DW_TAG_compile_unit
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
	.byte	7                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	A
	.byte	3                       # Abbrev [3] 0x3f:0x14 DW_TAG_array_type
	.long	83                      # DW_AT_type
	.byte	4                       # Abbrev [4] 0x44:0x7 DW_TAG_subrange_type
	.long	90                      # DW_AT_type
	.short	2000                    # DW_AT_count
	.byte	4                       # Abbrev [4] 0x4b:0x7 DW_TAG_subrange_type
	.long	90                      # DW_AT_type
	.short	2000                    # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x53:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	6                       # Abbrev [6] 0x5a:0x7 DW_TAG_base_type
	.long	.Linfo_string5          # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	2                       # Abbrev [2] 0x61:0x15 DW_TAG_variable
	.long	.Linfo_string6          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	B
	.byte	2                       # Abbrev [2] 0x76:0x15 DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	C
	.byte	2                       # Abbrev [2] 0x8b:0x15 DW_TAG_variable
	.long	.Linfo_string8          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	R
	.byte	5                       # Abbrev [5] 0xa0:0x7 DW_TAG_base_type
	.long	.Linfo_string9          # DW_AT_name
	.byte	7                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	7                       # Abbrev [7] 0xa7:0x2d DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0xbc:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0xc8:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0xd4:0x64 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	10                      # Abbrev [10] 0xe9:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\200\177"
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	37                      # DW_AT_decl_line
	.long	337                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0xf8:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x104:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x10f:0xb DW_TAG_variable
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	11                      # Abbrev [11] 0x11a:0x1d DW_TAG_lexical_block
	.quad	.Ltmp25                 # DW_AT_low_pc
	.long	.Ltmp30-.Ltmp25         # DW_AT_high_pc
	.byte	12                      # Abbrev [12] 0x127:0xf DW_TAG_variable
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	46                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	13                      # Abbrev [13] 0x138:0x19 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	98                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	3                       # Abbrev [3] 0x151:0xd DW_TAG_array_type
	.long	83                      # DW_AT_type
	.byte	4                       # Abbrev [4] 0x156:0x7 DW_TAG_subrange_type
	.long	90                      # DW_AT_type
	.short	2000                    # DW_AT_count
	.byte	0                       # End Of Children Mark
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
	.long	351                     # Compilation Unit Length
	.long	42                      # DIE offset
	.asciz	"A"                     # External Name
	.long	97                      # DIE offset
	.asciz	"B"                     # External Name
	.long	118                     # DIE offset
	.asciz	"C"                     # External Name
	.long	167                     # DIE offset
	.asciz	"init"                  # External Name
	.long	139                     # DIE offset
	.asciz	"R"                     # External Name
	.long	212                     # DIE offset
	.asciz	"mat_mult"              # External Name
	.long	312                     # DIE offset
	.asciz	"main"                  # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	351                     # Compilation Unit Length
	.long	160                     # DIE offset
	.asciz	"unsigned int"          # External Name
	.long	83                      # DIE offset
	.asciz	"int"                   # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
