	.text
	.file	"VectorMult.none.ll"
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin0:
	.file	1 "VectorMult.c"
	.loc	1 8 0                   # VectorMult.c:8:0
	.cfi_startproc
# BB#0:                                 # %entry.split
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
	pushq	%r12
	pushq	%rbx
.Ltmp4:
	.cfi_offset %rbx, -48
.Ltmp5:
	.cfi_offset %r12, -40
.Ltmp6:
	.cfi_offset %r14, -32
.Ltmp7:
	.cfi_offset %r15, -24
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
	movl	$41943040, %edi         # imm = 0x2800000
.Ltmp8:
	callq	malloc
	movq	%rax, %r14
	.loc	1 13 18                 # VectorMult.c:13:18
	movl	$41943040, %edi         # imm = 0x2800000
	callq	malloc
	movq	%rax, %r12
	.loc	1 14 20                 # VectorMult.c:14:20
	movl	$40960, %edi            # imm = 0xA000
	callq	malloc
	xorl	%r8d, %r8d
.Ltmp9:
	#DEBUG_VALUE: main:r <- 0
	movq	%r14, %rdx
	movq	%r12, %rbx
.Ltmp10:
	.p2align	4, 0x90
.LBB0_1:                                # %for.cond3.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	movq	%rdx, %rdi
	movq	%rbx, %rsi
	movl	$1024, %ecx             # imm = 0x400
	.p2align	4, 0x90
.LBB0_2:                                # %for.body5
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp11:
	.loc	1 20 13                 # VectorMult.c:20:13
	movl	$1, (%rdi)
	.loc	1 21 13                 # VectorMult.c:21:13
	movl	$1, (%rsi)
.Ltmp12:
	.loc	1 19 3 discriminator 1  # VectorMult.c:19:3
	addq	$4, %rsi
	addq	$4, %rdi
	decq	%rcx
	jne	.LBB0_2
.Ltmp13:
# BB#3:                                 # %for.inc10
                                        #   in Loop: Header=BB0_1 Depth=1
	.loc	1 17 15 discriminator 2 # VectorMult.c:17:15
	incq	%r8
.Ltmp14:
	#DEBUG_VALUE: main:r <- %R8
	.loc	1 17 2 is_stmt 0 discriminator 1 # VectorMult.c:17:2
	addq	$4096, %rbx             # imm = 0x1000
	addq	$4096, %rdx             # imm = 0x1000
	cmpq	$10240, %r8             # imm = 0x2800
	jne	.LBB0_1
.Ltmp15:
# BB#4:                                 # %for.cond13.preheader
	#DEBUG_VALUE: main:r <- %R8
	xorl	%r15d, %r15d
	xorl	%r8d, %r8d
.Ltmp16:
	.p2align	4, 0x90
.LBB0_5:                                # %for.cond17.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	movq	%r14, %rdx
	movq	%r12, %rsi
	movl	$1024, %ebx             # imm = 0x400
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB0_6:                                # %for.inc31
                                        #   Parent Loop BB0_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp17:
	.loc	1 29 24 is_stmt 1       # VectorMult.c:29:24
	movl	(%rsi), %ecx
	.loc	1 29 23 is_stmt 0       # VectorMult.c:29:23
	imull	(%rdx), %ecx
	.loc	1 29 13                 # VectorMult.c:29:13
	addl	%ecx, %edi
.Ltmp18:
	#DEBUG_VALUE: tmp <- %EDI
	.loc	1 27 3 is_stmt 1 discriminator 1 # VectorMult.c:27:3
	addq	$4, %rsi
	addq	$4, %rdx
	decq	%rbx
	jne	.LBB0_6
.Ltmp19:
# BB#7:                                 # %for.end33
                                        #   in Loop: Header=BB0_5 Depth=1
	#DEBUG_VALUE: tmp <- %EDI
	.loc	1 31 10                 # VectorMult.c:31:10
	movl	%edi, (%rax,%r8,4)
.Ltmp20:
	.loc	1 25 15 discriminator 2 # VectorMult.c:25:15
	incq	%r8
.Ltmp21:
	#DEBUG_VALUE: main:r <- %R8
	.loc	1 25 2 is_stmt 0 discriminator 1 # VectorMult.c:25:2
	addq	$4096, %r12             # imm = 0x1000
	addq	$4096, %r14             # imm = 0x1000
	cmpq	$10240, %r8             # imm = 0x2800
	jne	.LBB0_5
.Ltmp22:
# BB#8:
	#DEBUG_VALUE: tmp <- %EDI
	#DEBUG_VALUE: main:r <- %R8
	xorl	%ecx, %ecx
.Ltmp23:
	.p2align	4, 0x90
.LBB0_9:                                # %for.inc46
                                        # =>This Inner Loop Header: Depth=1
	.loc	1 36 19 is_stmt 1       # VectorMult.c:36:19
	movslq	(%rax,%rcx,4), %rdx
	.loc	1 36 17 is_stmt 0       # VectorMult.c:36:17
	addq	%rdx, %r15
.Ltmp24:
	#DEBUG_VALUE: main:total <- %R15
	.loc	1 35 15 is_stmt 1 discriminator 2 # VectorMult.c:35:15
	incq	%rcx
.Ltmp25:
	#DEBUG_VALUE: main:r <- %RCX
	.loc	1 35 2 is_stmt 0 discriminator 1 # VectorMult.c:35:2
	cmpq	$10240, %rcx            # imm = 0x2800
	jne	.LBB0_9
.Ltmp26:
# BB#10:                                # %for.end48
	#DEBUG_VALUE: main:r <- %RCX
	#DEBUG_VALUE: main:total <- %R15
	.loc	1 40 11 is_stmt 1       # VectorMult.c:40:11
	cmpq	$10485760, %r15         # imm = 0xA00000
.Ltmp27:
	.loc	1 40 5 is_stmt 0        # VectorMult.c:40:5
	jne	.LBB0_12
.Ltmp28:
# BB#11:                                # %if.end
	#DEBUG_VALUE: main:total <- %R15
	#DEBUG_VALUE: main:r <- %RCX
	.loc	1 46 2 is_stmt 1        # VectorMult.c:46:2
	movl	$6, %edi
	movl	$.L.str.1, %esi
	callq	setlocale
	.loc	1 47 2                  # VectorMult.c:47:2
	movl	$.L.str.2, %edi
	movl	$10485760, %esi         # imm = 0xA00000
	movl	$1024, %edx             # imm = 0x400
	xorl	%eax, %eax
	movq	%r15, %rcx
.Ltmp29:
	callq	printf
	.loc	1 49 2                  # VectorMult.c:49:2
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
.Ltmp30:
	popq	%rbp
	retq
.LBB0_12:                               # %if.then
.Ltmp31:
	#DEBUG_VALUE: main:total <- %R15
	#DEBUG_VALUE: main:r <- %RCX
	.loc	1 41 3                  # VectorMult.c:41:3
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 42 3                  # VectorMult.c:42:3
	movl	$-2, %edi
	callq	exit
.Ltmp32:
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
.Linfo_string10:
	.asciz	"tmp"                   # string offset=285
.Linfo_string11:
	.asciz	"total"                 # string offset=289
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp8-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp10-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc2:
	.quad	.Ltmp9-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp16-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp23-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	88                      # DW_OP_reg8
	.quad	.Ltmp25-.Lfunc_begin0
	.quad	.Ltmp29-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	.Ltmp31-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	82                      # DW_OP_reg2
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp23-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Ltmp24-.Lfunc_begin0
	.quad	.Ltmp30-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp31-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
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
	.byte	7                       # Abbreviation Code
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	190                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0xb7 DW_TAG_compile_unit
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
	.byte	4                       # Abbrev [4] 0x3d:0x73 DW_TAG_subprogram
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
	.long	176                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x74:0xf DW_TAG_variable
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	54                      # DW_AT_type
	.byte	6                       # Abbrev [6] 0x83:0xf DW_TAG_variable
	.long	.Ldebug_loc4            # DW_AT_location
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	54                      # DW_AT_type
	.byte	7                       # Abbrev [7] 0x92:0x1d DW_TAG_lexical_block
	.quad	.Ltmp17                 # DW_AT_low_pc
	.long	.Ltmp20-.Ltmp17         # DW_AT_high_pc
	.byte	6                       # Abbrev [6] 0x9f:0xf DW_TAG_variable
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.long	47                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	2                       # Abbrev [2] 0xb0:0x5 DW_TAG_pointer_type
	.long	181                     # DW_AT_type
	.byte	2                       # Abbrev [2] 0xb5:0x5 DW_TAG_pointer_type
	.long	186                     # DW_AT_type
	.byte	3                       # Abbrev [3] 0xba:0x7 DW_TAG_base_type
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
	.long	194                     # Compilation Unit Length
	.long	61                      # DIE offset
	.asciz	"main"                  # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	194                     # Compilation Unit Length
	.long	47                      # DIE offset
	.asciz	"int"                   # External Name
	.long	54                      # DIE offset
	.asciz	"long long int"         # External Name
	.long	186                     # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
