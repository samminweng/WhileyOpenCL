	.text
	.file	"VectorMult.openmp.ll"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI0_0:
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	1                       # 0x1
	.text
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
	pushq	%rbx
	subq	$24, %rsp
.Ltmp4:
	.cfi_offset %rbx, -40
.Ltmp5:
	.cfi_offset %r14, -32
.Ltmp6:
	.cfi_offset %r15, -24
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
	movl	$41943040, %edi         # imm = 0x2800000
.Ltmp7:
	callq	malloc
	movq	%rax, %r14
	.loc	1 13 18                 # VectorMult.c:13:18
	movl	$41943040, %edi         # imm = 0x2800000
	callq	malloc
	movq	%rax, %r15
	.loc	1 14 20                 # VectorMult.c:14:20
	movl	$40960, %edi            # imm = 0xA000
	callq	malloc
.Ltmp8:
	#DEBUG_VALUE: main:r <- 0
	.loc	1 17 2 discriminator 1  # VectorMult.c:17:2
	leaq	112(%r15), %r8
	leaq	112(%r14), %rdx
	xorl	%esi, %esi
.Ltmp9:
	.loc	1 20 13                 # VectorMult.c:20:13
	movaps	.LCPI0_0(%rip), %xmm0   # xmm0 = [1,1,1,1]
.Ltmp10:
	.p2align	4, 0x90
.LBB0_1:                                # %for.cond3.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	.loc	1 19 3 discriminator 1  # VectorMult.c:19:3
	movq	%rdx, %rdi
	movq	%r8, %rcx
	movl	$1024, %ebx             # imm = 0x400
	.p2align	4, 0x90
.LBB0_2:                                # %vector.body
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp11:
	.loc	1 20 13                 # VectorMult.c:20:13
	movups	%xmm0, -112(%rdi)
	movups	%xmm0, -96(%rdi)
	.loc	1 21 13                 # VectorMult.c:21:13
	movups	%xmm0, -112(%rcx)
	movups	%xmm0, -96(%rcx)
	.loc	1 20 13                 # VectorMult.c:20:13
	movups	%xmm0, -80(%rdi)
	movups	%xmm0, -64(%rdi)
	.loc	1 21 13                 # VectorMult.c:21:13
	movups	%xmm0, -80(%rcx)
	movups	%xmm0, -64(%rcx)
	.loc	1 20 13                 # VectorMult.c:20:13
	movups	%xmm0, -48(%rdi)
	movups	%xmm0, -32(%rdi)
	.loc	1 21 13                 # VectorMult.c:21:13
	movups	%xmm0, -48(%rcx)
	movups	%xmm0, -32(%rcx)
	.loc	1 20 13                 # VectorMult.c:20:13
	movups	%xmm0, -16(%rdi)
	movups	%xmm0, (%rdi)
	.loc	1 21 13                 # VectorMult.c:21:13
	movups	%xmm0, -16(%rcx)
	movups	%xmm0, (%rcx)
.Ltmp12:
	.loc	1 19 3 discriminator 1  # VectorMult.c:19:3
	subq	$-128, %rcx
	subq	$-128, %rdi
	addq	$-32, %rbx
	jne	.LBB0_2
.Ltmp13:
# BB#3:                                 # %for.inc10
                                        #   in Loop: Header=BB0_1 Depth=1
	.loc	1 17 15 discriminator 2 # VectorMult.c:17:15
	incq	%rsi
.Ltmp14:
	#DEBUG_VALUE: main:r <- %RSI
	.loc	1 17 2 is_stmt 0 discriminator 1 # VectorMult.c:17:2
	addq	$4096, %r8              # imm = 0x1000
	addq	$4096, %rdx             # imm = 0x1000
	cmpq	$10240, %rsi            # imm = 0x2800
	jne	.LBB0_1
.Ltmp15:
# BB#4:                                 # %polly.loop_preheader
	#DEBUG_VALUE: main:r <- %RSI
	addq	$12, %r14
	addq	$12, %r15
	xorl	%r8d, %r8d
.Ltmp16:
	.p2align	4, 0x90
.LBB0_5:                                # %polly.stmt.polly.loop_preheader2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	movl	$0, -28(%rbp)
	movq	$-1, %rdx
	movq	%r14, %rsi
	movq	%r15, %rdi
	movl	$1020, %r9d             # imm = 0x3FC
	.p2align	4, 0x90
.LBB0_6:                                # %polly.stmt.polly.stmt.for.inc31
                                        #   Parent Loop BB0_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-12(%rdi), %ecx
	movl	-8(%rdi), %ebx
.Ltmp17:
	.loc	1 29 23 is_stmt 1       # VectorMult.c:29:23
	imull	-12(%rsi), %ecx
	.loc	1 29 13 is_stmt 0       # VectorMult.c:29:13
	addl	-28(%rbp), %ecx
	.loc	1 29 23                 # VectorMult.c:29:23
	imull	-8(%rsi), %ebx
	.loc	1 29 13                 # VectorMult.c:29:13
	addl	%ecx, %ebx
	movl	-4(%rdi), %ecx
	.loc	1 29 23                 # VectorMult.c:29:23
	imull	-4(%rsi), %ecx
	.loc	1 29 13                 # VectorMult.c:29:13
	addl	%ebx, %ecx
	movl	(%rdi), %ebx
	.loc	1 29 23                 # VectorMult.c:29:23
	imull	(%rsi), %ebx
	.loc	1 29 13                 # VectorMult.c:29:13
	addl	%ecx, %ebx
	movl	%ebx, -28(%rbp)
	movl	%ebx, -32(%rbp)
	incq	%rdx
	addq	$-4, %r9
	addq	$16, %rdi
	addq	$16, %rsi
	cmpq	$255, %rdx
	jl	.LBB0_6
.Ltmp18:
# BB#7:                                 # %polly.stmt.polly.stmt.for.end33
                                        #   in Loop: Header=BB0_5 Depth=1
	movl	-32(%rbp), %edx
	movl	%edx, (%rax,%r8,4)
	addq	$4096, %r15             # imm = 0x1000
	addq	$4096, %r14             # imm = 0x1000
	cmpq	$10239, %r8             # imm = 0x27FF
	leaq	1(%r8), %r8
	jl	.LBB0_5
# BB#8:                                 # %polly.stmt.polly.stmt.for.inc46.preheader
	movq	$0, -40(%rbp)
	movq	$-1, %rcx
	movl	$4, %edx
	.p2align	4, 0x90
.LBB0_9:                                # %polly.stmt.polly.stmt.for.inc46
                                        # =>This Inner Loop Header: Depth=1
.Ltmp19:
	.loc	1 36 19 is_stmt 1       # VectorMult.c:36:19
	movslq	-16(%rax,%rdx,4), %rsi
	.loc	1 36 17 is_stmt 0       # VectorMult.c:36:17
	addq	-40(%rbp), %rsi
	.loc	1 36 19                 # VectorMult.c:36:19
	movslq	-12(%rax,%rdx,4), %rdi
	.loc	1 36 17                 # VectorMult.c:36:17
	addq	%rsi, %rdi
	.loc	1 36 19                 # VectorMult.c:36:19
	movslq	-8(%rax,%rdx,4), %rsi
	.loc	1 36 17                 # VectorMult.c:36:17
	addq	%rdi, %rsi
	.loc	1 36 19                 # VectorMult.c:36:19
	movslq	-4(%rax,%rdx,4), %rdi
	.loc	1 36 17                 # VectorMult.c:36:17
	addq	%rsi, %rdi
	.loc	1 36 19                 # VectorMult.c:36:19
	movslq	(%rax,%rdx,4), %rsi
	.loc	1 36 17                 # VectorMult.c:36:17
	addq	%rdi, %rsi
	movq	%rsi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	incq	%rcx
	addq	$5, %rdx
	cmpq	$2047, %rcx             # imm = 0x7FF
	jl	.LBB0_9
.Ltmp20:
# BB#10:                                # %polly.exiting29
	movq	-48(%rbp), %rax
.Ltmp21:
	.loc	1 40 11 is_stmt 1       # VectorMult.c:40:11
	cmpq	$10485760, %rax         # imm = 0xA00000
.Ltmp22:
	.loc	1 40 5 is_stmt 0        # VectorMult.c:40:5
	jne	.LBB0_12
# BB#11:                                # %if.end
	.loc	1 46 2 is_stmt 1        # VectorMult.c:46:2
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
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB0_12:                               # %if.then
.Ltmp23:
	.loc	1 41 3                  # VectorMult.c:41:3
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 42 3                  # VectorMult.c:42:3
	movl	$-2, %edi
	callq	exit
.Ltmp24:
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
	.quad	.Ltmp7-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp9-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc2:
	.quad	.Ltmp8-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp16-.Lfunc_begin0
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
	.long	146                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x8b DW_TAG_compile_unit
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
	.byte	4                       # Abbrev [4] 0x3d:0x47 DW_TAG_subprogram
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
	.long	132                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x74:0xf DW_TAG_variable
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	54                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	2                       # Abbrev [2] 0x84:0x5 DW_TAG_pointer_type
	.long	137                     # DW_AT_type
	.byte	2                       # Abbrev [2] 0x89:0x5 DW_TAG_pointer_type
	.long	142                     # DW_AT_type
	.byte	3                       # Abbrev [3] 0x8e:0x7 DW_TAG_base_type
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
	.long	150                     # Compilation Unit Length
	.long	61                      # DIE offset
	.asciz	"main"                  # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	150                     # Compilation Unit Length
	.long	47                      # DIE offset
	.asciz	"int"                   # External Name
	.long	54                      # DIE offset
	.asciz	"long long int"         # External Name
	.long	142                     # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
