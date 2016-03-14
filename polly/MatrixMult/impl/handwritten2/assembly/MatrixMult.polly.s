	.text
	.file	"MatrixMult.polly.ll"
	.file	1 "MatrixMult.c"
	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
.Lfunc_begin0:
	.loc	1 9 0                   # MatrixMult.c:9:0
	.cfi_startproc
# BB#0:                                 # %entry
	xorl	%eax, %eax
.Ltmp0:
	#DEBUG_VALUE: init:i <- 0
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	movq	%rax, %rdx
	movl	$512, %esi              # imm = 0x200
	.p2align	4, 0x90
.LBB0_2:                                # %for.body3
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp1:
	.loc	1 13 12 prologue_end    # MatrixMult.c:13:12
	movl	$1, X(%rdx)
	.loc	1 14 12                 # MatrixMult.c:14:12
	movl	$1, Y(%rdx)
	.loc	1 13 12                 # MatrixMult.c:13:12
	movl	$1, X+4(%rdx)
	.loc	1 14 12                 # MatrixMult.c:14:12
	movl	$1, Y+4(%rdx)
	.loc	1 13 12                 # MatrixMult.c:13:12
	movl	$1, X+8(%rdx)
	.loc	1 14 12                 # MatrixMult.c:14:12
	movl	$1, Y+8(%rdx)
	.loc	1 13 12                 # MatrixMult.c:13:12
	movl	$1, X+12(%rdx)
	.loc	1 14 12                 # MatrixMult.c:14:12
	movl	$1, Y+12(%rdx)
.Ltmp2:
	.loc	1 12 3 discriminator 1  # MatrixMult.c:12:3
	addq	$16, %rdx
	addq	$-4, %rsi
	jne	.LBB0_2
.Ltmp3:
# BB#3:                                 # %for.inc10
                                        #   in Loop: Header=BB0_1 Depth=1
	.loc	1 11 2 discriminator 1  # MatrixMult.c:11:2
	incq	%rcx
	addq	$2048, %rax             # imm = 0x800
	cmpq	$512, %rcx              # imm = 0x200
	jne	.LBB0_1
.Ltmp4:
# BB#4:                                 # %for.end12
	.loc	1 17 1                  # MatrixMult.c:17:1
	retq
.Ltmp5:
.Lfunc_end0:
	.size	init, .Lfunc_end0-init
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin1:
	.loc	1 61 0                  # MatrixMult.c:61:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 63 2 prologue_end     # MatrixMult.c:63:2
	subq	$2056, %rsp             # imm = 0x808
.Ltmp6:
	.cfi_def_cfa_offset 2064
	callq	init
.Ltmp7:
	#DEBUG_VALUE: main:j <- 0
	.loc	1 68 2 discriminator 1  # MatrixMult.c:68:2
	leaq	12(%rsp), %r8
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB1_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
                                        #     Child Loop BB1_3 Depth 2
                                        #       Child Loop BB1_4 Depth 3
	movq	$-1048576, %rcx         # imm = 0xFFFFFFFFFFF00000
	movq	%r8, %rdx
	.p2align	4, 0x90
.LBB1_2:                                # %for.body3
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp8:
	.loc	1 71 13                 # MatrixMult.c:71:13
	movl	Y+1048576(%rcx,%r9,4), %eax
	.loc	1 71 11 is_stmt 0       # MatrixMult.c:71:11
	movl	%eax, -12(%rdx)
	.loc	1 71 13                 # MatrixMult.c:71:13
	movl	Y+1050624(%rcx,%r9,4), %eax
	.loc	1 71 11                 # MatrixMult.c:71:11
	movl	%eax, -8(%rdx)
	.loc	1 71 13                 # MatrixMult.c:71:13
	movl	Y+1052672(%rcx,%r9,4), %eax
	.loc	1 71 11                 # MatrixMult.c:71:11
	movl	%eax, -4(%rdx)
	.loc	1 71 13                 # MatrixMult.c:71:13
	movl	Y+1054720(%rcx,%r9,4), %eax
	.loc	1 71 11                 # MatrixMult.c:71:11
	movl	%eax, (%rdx)
.Ltmp9:
	.loc	1 70 3 is_stmt 1 discriminator 1 # MatrixMult.c:70:3
	addq	$16, %rdx
	addq	$8192, %rcx             # imm = 0x2000
	movl	$X+12, %r10d
	movl	$0, %esi
	jne	.LBB1_2
.Ltmp10:
	.p2align	4, 0x90
.LBB1_3:                                # %for.cond11.preheader
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_4 Depth 3
	xorl	%edi, %edi
	movq	%r10, %rdx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_4:                                # %for.body13
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
.Ltmp11:
	.loc	1 77 25                 # MatrixMult.c:77:25
	movl	(%rsp,%rdi,4), %eax
	.loc	1 77 24 is_stmt 0       # MatrixMult.c:77:24
	imull	-12(%rdx), %eax
	.loc	1 77 15                 # MatrixMult.c:77:15
	addl	%ecx, %eax
.Ltmp12:
	#DEBUG_VALUE: sum <- %EAX
	.loc	1 77 25                 # MatrixMult.c:77:25
	movl	4(%rsp,%rdi,4), %ecx
	.loc	1 77 24                 # MatrixMult.c:77:24
	imull	-8(%rdx), %ecx
	.loc	1 77 15                 # MatrixMult.c:77:15
	addl	%eax, %ecx
	.loc	1 77 25                 # MatrixMult.c:77:25
	movl	8(%rsp,%rdi,4), %eax
.Ltmp13:
	.loc	1 77 24                 # MatrixMult.c:77:24
	imull	-4(%rdx), %eax
	.loc	1 77 15                 # MatrixMult.c:77:15
	addl	%ecx, %eax
	.loc	1 77 25                 # MatrixMult.c:77:25
	movl	12(%rsp,%rdi,4), %ecx
	.loc	1 77 24                 # MatrixMult.c:77:24
	imull	(%rdx), %ecx
	.loc	1 77 15                 # MatrixMult.c:77:15
	addl	%eax, %ecx
.Ltmp14:
	.loc	1 76 4 is_stmt 1 discriminator 1 # MatrixMult.c:76:4
	addq	$4, %rdi
	addq	$16, %rdx
	cmpq	$512, %rdi              # imm = 0x200
	jne	.LBB1_4
.Ltmp15:
# BB#5:                                 # %for.end22
                                        #   in Loop: Header=BB1_3 Depth=2
	.loc	1 79 4                  # MatrixMult.c:79:4
	movq	%rsi, %rax
	shlq	$11, %rax
	.loc	1 79 12 is_stmt 0       # MatrixMult.c:79:12
	movl	%ecx, Z(%rax,%r9,4)
.Ltmp16:
	.loc	1 74 3 is_stmt 1 discriminator 1 # MatrixMult.c:74:3
	incq	%rsi
	addq	$2048, %r10             # imm = 0x800
	cmpq	$512, %rsi              # imm = 0x200
	jne	.LBB1_3
.Ltmp17:
# BB#6:                                 # %for.inc30
                                        #   in Loop: Header=BB1_1 Depth=1
	.loc	1 68 2 discriminator 1  # MatrixMult.c:68:2
	incq	%r9
	cmpq	$512, %r9               # imm = 0x200
	jne	.LBB1_1
.Ltmp18:
# BB#7:                                 # %for.end32
	.loc	1 82 75                 # MatrixMult.c:82:75
	movl	Z+1048572(%rip), %r9d
	.loc	1 82 2 is_stmt 0        # MatrixMult.c:82:2
	movl	$.L.str, %edi
	movl	$512, %esi              # imm = 0x200
	movl	$512, %edx              # imm = 0x200
	movl	$511, %ecx              # imm = 0x1FF
	movl	$511, %r8d              # imm = 0x1FF
	xorl	%eax, %eax
	callq	printf
	.loc	1 84 5 is_stmt 1        # MatrixMult.c:84:5
	xorl	%eax, %eax
	addq	$2056, %rsp             # imm = 0x808
	retq
.Ltmp19:
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc

	.type	X,@object               # @X
	.comm	X,1048576,16
	.type	Y,@object               # @Y
	.comm	Y,1048576,16
	.type	Z,@object               # @Z
	.comm	Z,1048576,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Pass %d X %d matrix test case (C[%d][%d]=%d)\n"
	.size	.L.str, 46

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)" # string offset=0
.Linfo_string1:
	.asciz	"MatrixMult.c"          # string offset=165
.Linfo_string2:
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten3" # string offset=178
.Linfo_string3:
	.asciz	"X"                     # string offset=246
.Linfo_string4:
	.asciz	"int"                   # string offset=248
.Linfo_string5:
	.asciz	"sizetype"              # string offset=252
.Linfo_string6:
	.asciz	"Y"                     # string offset=261
.Linfo_string7:
	.asciz	"Z"                     # string offset=263
.Linfo_string8:
	.asciz	"init"                  # string offset=265
.Linfo_string9:
	.asciz	"main"                  # string offset=270
.Linfo_string10:
	.asciz	"i"                     # string offset=275
.Linfo_string11:
	.asciz	"j"                     # string offset=277
.Linfo_string12:
	.asciz	"y_t"                   # string offset=279
.Linfo_string13:
	.asciz	"sum"                   # string offset=283
.Linfo_string14:
	.asciz	"k"                     # string offset=287
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Ltmp12-.Lfunc_begin0
	.quad	.Ltmp13-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	80                      # super-register DW_OP_reg0
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
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
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
	.byte	12                      # Abbreviation Code
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
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
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	297                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x122 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x15 DW_TAG_variable
	.long	.Linfo_string3          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	X
	.byte	3                       # Abbrev [3] 0x3f:0x14 DW_TAG_array_type
	.long	83                      # DW_AT_type
	.byte	4                       # Abbrev [4] 0x44:0x7 DW_TAG_subrange_type
	.long	90                      # DW_AT_type
	.short	512                     # DW_AT_count
	.byte	4                       # Abbrev [4] 0x4b:0x7 DW_TAG_subrange_type
	.long	90                      # DW_AT_type
	.short	512                     # DW_AT_count
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
	.byte	5                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	Y
	.byte	2                       # Abbrev [2] 0x76:0x15 DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	Z
	.byte	7                       # Abbrev [7] 0x8b:0x2d DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0xa0:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0xac:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	10                      # Abbrev [10] 0xb8:0x67 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	61                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	11                      # Abbrev [11] 0xd1:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	0
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.long	287                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0xdf:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0xeb:0xb DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0xf6:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x101:0x1d DW_TAG_lexical_block
	.quad	.Ltmp11                 # DW_AT_low_pc
	.long	.Ltmp16-.Ltmp11         # DW_AT_high_pc
	.byte	13                      # Abbrev [13] 0x10e:0xf DW_TAG_variable
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	75                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	3                       # Abbrev [3] 0x11f:0xd DW_TAG_array_type
	.long	83                      # DW_AT_type
	.byte	4                       # Abbrev [4] 0x124:0x7 DW_TAG_subrange_type
	.long	90                      # DW_AT_type
	.short	512                     # DW_AT_count
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
	.long	301                     # Compilation Unit Length
	.long	139                     # DIE offset
	.asciz	"init"                  # External Name
	.long	184                     # DIE offset
	.asciz	"main"                  # External Name
	.long	42                      # DIE offset
	.asciz	"X"                     # External Name
	.long	97                      # DIE offset
	.asciz	"Y"                     # External Name
	.long	118                     # DIE offset
	.asciz	"Z"                     # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	301                     # Compilation Unit Length
	.long	83                      # DIE offset
	.asciz	"int"                   # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
