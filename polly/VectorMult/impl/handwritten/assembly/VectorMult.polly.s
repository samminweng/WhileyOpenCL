	.text
	.file	"VectorMult.polly.ll"
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin0:
	.file	1 "VectorMult.c"
	.loc	1 8 0                   # VectorMult.c:8:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp0:
	.cfi_def_cfa_offset 16
.Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp2:
	.cfi_def_cfa_register %rbp
.Ltmp3:
	.loc	1 12 18 prologue_end    # VectorMult.c:12:18
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
.Ltmp4:
	.cfi_offset %rbx, -56
.Ltmp5:
	.cfi_offset %r12, -48
.Ltmp6:
	.cfi_offset %r13, -40
.Ltmp7:
	.cfi_offset %r14, -32
.Ltmp8:
	.cfi_offset %r15, -24
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
	movl	$41943040, %edi         # imm = 0x2800000
.Ltmp9:
	callq	malloc
	movq	%rax, %rbx
	.loc	1 13 18                 # VectorMult.c:13:18
	movq	%rbx, -48(%rbp)         # 8-byte Spill
	movl	$41943040, %edi         # imm = 0x2800000
	callq	malloc
	movq	%rax, %r15
	.loc	1 14 20                 # VectorMult.c:14:20
	movl	$40960, %edi            # imm = 0xA000
	callq	malloc
.Ltmp10:
	#DEBUG_VALUE: main:r <- 0
	leaq	12(%r15), %r8
	leaq	12(%rbx), %r10
	xorl	%r9d, %r9d
.Ltmp11:
	.p2align	4, 0x90
.LBB0_1:                                # %polly.loop_preheader2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_10 Depth 2
                                        #       Child Loop BB0_11 Depth 3
                                        #         Child Loop BB0_12 Depth 4
	movq	%r10, %r11
	movq	%r8, %r12
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB0_10:                               # %polly.loop_preheader8
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_11 Depth 3
                                        #         Child Loop BB0_12 Depth 4
	movq	%r11, %rbx
	movq	%r12, %rcx
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB0_11:                               # %polly.loop_preheader14
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_10 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_12 Depth 4
	movq	%rbx, %rsi
	movq	%rcx, %rdx
	movl	$32, %r14d
	.p2align	4, 0x90
.LBB0_12:                               # %polly.stmt.for.body5
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_10 Depth=2
                                        #       Parent Loop BB0_11 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	$1, -12(%rsi)
	movl	$1, -12(%rdx)
	movl	$1, -8(%rsi)
	movl	$1, -8(%rdx)
	movl	$1, -4(%rsi)
	movl	$1, -4(%rdx)
	movl	$1, (%rsi)
	movl	$1, (%rdx)
	addq	$16, %rdx
	addq	$16, %rsi
	addq	$-4, %r14
	jne	.LBB0_12
# BB#8:                                 # %polly.loop_exit15
                                        #   in Loop: Header=BB0_11 Depth=3
	incq	%rdi
	addq	$4096, %rcx             # imm = 0x1000
	addq	$4096, %rbx             # imm = 0x1000
	cmpq	$32, %rdi
	jne	.LBB0_11
# BB#9:                                 # %polly.loop_exit9
                                        #   in Loop: Header=BB0_10 Depth=2
	incq	%r13
	subq	$-128, %r12
	subq	$-128, %r11
	cmpq	$32, %r13
	jne	.LBB0_10
# BB#6:                                 # %polly.loop_exit3
                                        #   in Loop: Header=BB0_1 Depth=1
	incq	%r9
	addq	$131072, %r8            # imm = 0x20000
	addq	$131072, %r10           # imm = 0x20000
	cmpq	$320, %r9               # imm = 0x140
	jne	.LBB0_1
# BB#7:                                 # %polly.loop_preheader29.preheader
	addq	$12, %r15
	movq	-48(%rbp), %r14         # 8-byte Reload
	addq	$12, %r14
	xorl	%r8d, %r8d
	movl	$4, %r10d
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB0_14:                               # %polly.loop_preheader29
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_15 Depth 2
	movq	%r14, %rdi
	movq	%r15, %rbx
	movl	$1024, %r11d            # imm = 0x400
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB0_15:                               # %polly.stmt.for.inc31
                                        #   Parent Loop BB0_14 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-12(%rbx), %ecx
	movl	-8(%rbx), %edx
.Ltmp12:
	.loc	1 29 23                 # VectorMult.c:29:23
	imull	-12(%rdi), %ecx
	.loc	1 29 13 is_stmt 0       # VectorMult.c:29:13
	addl	%esi, %ecx
	.loc	1 29 23                 # VectorMult.c:29:23
	imull	-8(%rdi), %edx
	.loc	1 29 13                 # VectorMult.c:29:13
	addl	%ecx, %edx
	movl	-4(%rbx), %ecx
	.loc	1 29 23                 # VectorMult.c:29:23
	imull	-4(%rdi), %ecx
	.loc	1 29 13                 # VectorMult.c:29:13
	addl	%edx, %ecx
	movl	(%rbx), %esi
	.loc	1 29 23                 # VectorMult.c:29:23
	imull	(%rdi), %esi
	.loc	1 29 13                 # VectorMult.c:29:13
	addl	%ecx, %esi
	addq	$16, %rbx
	addq	$16, %rdi
	addq	$-4, %r11
	jne	.LBB0_15
.Ltmp13:
# BB#13:                                # %polly.stmt.for.end33
                                        #   in Loop: Header=BB0_14 Depth=1
	movl	%esi, (%rax,%r9,4)
	incq	%r9
	addq	$4096, %r15             # imm = 0x1000
	addq	$4096, %r14             # imm = 0x1000
	cmpq	$10240, %r9             # imm = 0x2800
	jne	.LBB0_14
	.p2align	4, 0x90
.LBB0_3:                                # %polly.stmt.for.inc46
                                        # =>This Inner Loop Header: Depth=1
.Ltmp14:
	.loc	1 36 19 is_stmt 1       # VectorMult.c:36:19
	movslq	-16(%rax,%r10,4), %rcx
	.loc	1 36 17 is_stmt 0       # VectorMult.c:36:17
	addq	%r8, %rcx
	.loc	1 36 19                 # VectorMult.c:36:19
	movslq	-12(%rax,%r10,4), %rdx
	.loc	1 36 17                 # VectorMult.c:36:17
	addq	%rcx, %rdx
	.loc	1 36 19                 # VectorMult.c:36:19
	movslq	-8(%rax,%r10,4), %rcx
	.loc	1 36 17                 # VectorMult.c:36:17
	addq	%rdx, %rcx
	.loc	1 36 19                 # VectorMult.c:36:19
	movslq	-4(%rax,%r10,4), %rdx
	.loc	1 36 17                 # VectorMult.c:36:17
	addq	%rcx, %rdx
	.loc	1 36 19                 # VectorMult.c:36:19
	movslq	(%rax,%r10,4), %r8
	.loc	1 36 17                 # VectorMult.c:36:17
	addq	%rdx, %r8
	addq	$5, %r10
	cmpq	$10244, %r10            # imm = 0x2804
	jne	.LBB0_3
.Ltmp15:
# BB#4:                                 # %polly.exiting
	.loc	1 40 11 is_stmt 1       # VectorMult.c:40:11
	cmpq	$10485760, %r8          # imm = 0xA00000
	jne	.LBB0_5
.Ltmp16:
# BB#2:                                 # %if.end
	.loc	1 46 2                  # VectorMult.c:46:2
	movl	$6, %edi
	movl	$.L.str.1, %esi
	callq	setlocale
	.loc	1 47 2                  # VectorMult.c:47:2
	movl	$.L.str.2, %edi
	movl	$10485760, %esi         # imm = 0xA00000
	movl	$1024, %edx             # imm = 0x400
	movl	$10485760, %ecx         # imm = 0xA00000
	xorl	%eax, %eax
	callq	printf
	.loc	1 49 2                  # VectorMult.c:49:2
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB0_5:                                # %if.then
.Ltmp17:
	.loc	1 41 3                  # VectorMult.c:41:3
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 42 3                  # VectorMult.c:42:3
	movl	$-2, %edi
	callq	exit
.Ltmp18:
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"fail to multiply two unit vectors"
	.size	.L.str, 34

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.zero	1
	.size	.L.str.1, 1

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"Pass the %'lld vector multiplication test case with local vector size = %d\nThe Dot Product = %'lld\n"
	.size	.L.str.2, 100

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)" # string offset=0
.Linfo_string1:
	.asciz	"VectorMult.c"          # string offset=165
.Linfo_string2:
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/VectorMult/impl/handwritten" # string offset=178
.Linfo_string3:
	.asciz	"int"                   # string offset=245
.Linfo_string4:
	.asciz	"long long int"         # string offset=249
.Linfo_string5:
	.asciz	"main"                  # string offset=263
.Linfo_string6:
	.asciz	"argc"                  # string offset=268
.Linfo_string7:
	.asciz	"args"                  # string offset=273
.Linfo_string8:
	.asciz	"char"                  # string offset=278
.Linfo_string9:
	.asciz	"r"                     # string offset=283
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp9-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp11-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
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
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	3                       # Abbreviation Code
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
	.byte	4                       # Abbreviation Code
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
	.byte	5                       # Abbreviation Code
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
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	143                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x88 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x5 DW_TAG_pointer_type
	.long	47                      # DW_AT_type
	.byte	3                       # Abbrev [3] 0x2f:0x7 DW_TAG_base_type
	.long	.Linfo_string3          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	3                       # Abbrev [3] 0x36:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	4                       # Abbrev [4] 0x3d:0x44 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	47                      # DW_AT_type
                                        # DW_AT_external
	.byte	5                       # Abbrev [5] 0x56:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	47                      # DW_AT_type
	.byte	5                       # Abbrev [5] 0x65:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.long	129                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x74:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	54                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	2                       # Abbrev [2] 0x81:0x5 DW_TAG_pointer_type
	.long	134                     # DW_AT_type
	.byte	2                       # Abbrev [2] 0x86:0x5 DW_TAG_pointer_type
	.long	139                     # DW_AT_type
	.byte	3                       # Abbrev [3] 0x8b:0x7 DW_TAG_base_type
	.long	.Linfo_string8          # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
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
	.long	147                     # Compilation Unit Length
	.long	61                      # DIE offset
	.asciz	"main"                  # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	147                     # Compilation Unit Length
	.long	47                      # DIE offset
	.asciz	"int"                   # External Name
	.long	54                      # DIE offset
	.asciz	"long long int"         # External Name
	.long	139                     # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
