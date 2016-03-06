	.text
	.file	"VectorMult.openmp.ll"
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin0:
	.file	1 "VectorMult.c"
	.loc	1 8 0                   # VectorMult.c:8:0
	.cfi_startproc
# BB#0:                                 # %polly.loop_preheader
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
	subq	$40, %rsp
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
	movq	%rax, %r15
	.loc	1 13 18                 # VectorMult.c:13:18
	movl	$41943040, %edi         # imm = 0x2800000
	callq	malloc
	movq	%rax, %r13
	.loc	1 14 20                 # VectorMult.c:14:20
	movl	$40960, %edi            # imm = 0xA000
	callq	malloc
	movq	%rax, %r14
.Ltmp10:
	#DEBUG_VALUE: main:r <- 0
	movq	%r15, -80(%rbp)
	movq	%r13, -72(%rbp)
	xorl	%r12d, %r12d
	leaq	-80(%rbp), %rbx
	movl	$main_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$320, %r8d              # imm = 0x140
	movl	$1, %r9d
	movq	%rbx, %rsi
.Ltmp11:
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	main_polly_subfn
	callq	GOMP_parallel_end
	addq	$12, %r15
	addq	$12, %r13
	.p2align	4, 0x90
.LBB0_1:                                # %polly.stmt.polly.loop_preheader3
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	movl	$0, -44(%rbp)
	movq	$-1, %rax
	movq	%r15, %rcx
	movq	%r13, %rdx
	movl	$1020, %esi             # imm = 0x3FC
	.p2align	4, 0x90
.LBB0_2:                                # %polly.stmt.polly.stmt.for.inc31
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-12(%rdx), %edi
	movl	-8(%rdx), %ebx
.Ltmp12:
	.loc	1 29 23                 # VectorMult.c:29:23
	imull	-12(%rcx), %edi
	.loc	1 29 13 is_stmt 0       # VectorMult.c:29:13
	addl	-44(%rbp), %edi
	.loc	1 29 23                 # VectorMult.c:29:23
	imull	-8(%rcx), %ebx
	.loc	1 29 13                 # VectorMult.c:29:13
	addl	%edi, %ebx
	movl	-4(%rdx), %edi
	.loc	1 29 23                 # VectorMult.c:29:23
	imull	-4(%rcx), %edi
	.loc	1 29 13                 # VectorMult.c:29:13
	addl	%ebx, %edi
	movl	(%rdx), %ebx
	.loc	1 29 23                 # VectorMult.c:29:23
	imull	(%rcx), %ebx
	.loc	1 29 13                 # VectorMult.c:29:13
	addl	%edi, %ebx
	movl	%ebx, -44(%rbp)
	movl	%ebx, -48(%rbp)
	incq	%rax
	addq	$-4, %rsi
	addq	$16, %rdx
	addq	$16, %rcx
	cmpq	$255, %rax
	jl	.LBB0_2
.Ltmp13:
# BB#3:                                 # %polly.stmt.polly.stmt.for.end33
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-48(%rbp), %eax
	movl	%eax, (%r14,%r12,4)
	addq	$4096, %r13             # imm = 0x1000
	addq	$4096, %r15             # imm = 0x1000
	cmpq	$10239, %r12            # imm = 0x27FF
	leaq	1(%r12), %r12
	jl	.LBB0_1
# BB#4:                                 # %polly.stmt.polly.stmt.for.inc46.preheader
	movq	$0, -56(%rbp)
	movq	$-1, %rax
	movl	$4, %ecx
	.p2align	4, 0x90
.LBB0_5:                                # %polly.stmt.polly.stmt.for.inc46
                                        # =>This Inner Loop Header: Depth=1
.Ltmp14:
	.loc	1 36 19 is_stmt 1       # VectorMult.c:36:19
	movslq	-16(%r14,%rcx,4), %rdx
	.loc	1 36 17 is_stmt 0       # VectorMult.c:36:17
	addq	-56(%rbp), %rdx
	.loc	1 36 19                 # VectorMult.c:36:19
	movslq	-12(%r14,%rcx,4), %rsi
	.loc	1 36 17                 # VectorMult.c:36:17
	addq	%rdx, %rsi
	.loc	1 36 19                 # VectorMult.c:36:19
	movslq	-8(%r14,%rcx,4), %rdx
	.loc	1 36 17                 # VectorMult.c:36:17
	addq	%rsi, %rdx
	.loc	1 36 19                 # VectorMult.c:36:19
	movslq	-4(%r14,%rcx,4), %rsi
	.loc	1 36 17                 # VectorMult.c:36:17
	addq	%rdx, %rsi
	.loc	1 36 19                 # VectorMult.c:36:19
	movslq	(%r14,%rcx,4), %rdx
	.loc	1 36 17                 # VectorMult.c:36:17
	addq	%rsi, %rdx
	movq	%rdx, -56(%rbp)
	movq	%rdx, -64(%rbp)
	incq	%rax
	addq	$5, %rcx
	cmpq	$2047, %rax             # imm = 0x7FF
	jl	.LBB0_5
.Ltmp15:
# BB#6:                                 # %polly.exiting27
	movq	-64(%rbp), %rax
.Ltmp16:
	.loc	1 40 11 is_stmt 1       # VectorMult.c:40:11
	cmpq	$10485760, %rax         # imm = 0xA00000
.Ltmp17:
	.loc	1 40 5 is_stmt 0        # VectorMult.c:40:5
	jne	.LBB0_8
# BB#7:                                 # %if.end
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
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB0_8:                                # %if.then
.Ltmp18:
	.loc	1 41 3                  # VectorMult.c:41:3
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	.loc	1 42 3                  # VectorMult.c:42:3
	movl	$-2, %edi
	callq	exit
.Ltmp19:
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.p2align	4, 0x90
	.type	main_polly_subfn,@function
main_polly_subfn:                       # @main_polly_subfn
.Lfunc_begin1:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Ltmp20:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp21:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp22:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp23:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp24:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp25:
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
.Ltmp26:
	.cfi_def_cfa_offset 80
.Ltmp27:
	.cfi_offset %rbx, -56
.Ltmp28:
	.cfi_offset %r12, -48
.Ltmp29:
	.cfi_offset %r13, -40
.Ltmp30:
	.cfi_offset %r14, -32
.Ltmp31:
	.cfi_offset %r15, -24
.Ltmp32:
	.cfi_offset %rbp, -16
	movq	(%rdi), %r12
	movq	8(%rdi), %r13
	jmp	.LBB1_1
	.p2align	4, 0x90
.LBB1_2:                                # %polly.par.loadIVBounds
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	8(%rsp), %r8
	movq	16(%rsp), %r9
	addq	$-2, %r8
	movq	%r9, %r11
	shlq	$17, %r11
	leaq	(%r13,%r11), %r10
	addq	%r12, %r11
	.p2align	4, 0x90
.LBB1_5:                                # %polly.loop_preheader3
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_6 Depth 3
                                        #         Child Loop BB1_9 Depth 4
                                        #           Child Loop BB1_7 Depth 5
	movq	%r11, %rdi
	movq	%r10, %rbx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_6:                                # %polly.loop_preheader9
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_9 Depth 4
                                        #           Child Loop BB1_7 Depth 5
	movq	%rdi, %rcx
	movq	%rbx, %r14
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB1_9:                                # %polly.loop_preheader15
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_5 Depth=2
                                        #       Parent Loop BB1_6 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB1_7 Depth 5
	movq	%rcx, %rbp
	movq	%r14, %rsi
	movl	$32, %r15d
	.p2align	4, 0x90
.LBB1_7:                                # %polly.stmt.for.body5
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_5 Depth=2
                                        #       Parent Loop BB1_6 Depth=3
                                        #         Parent Loop BB1_9 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movl	$1, (%rbp)
	movl	$1, (%rsi)
	addq	$4, %rsi
	addq	$4, %rbp
	decq	%r15
	jne	.LBB1_7
# BB#8:                                 # %polly.loop_exit16
                                        #   in Loop: Header=BB1_9 Depth=4
	incq	%rdx
	addq	$4096, %r14             # imm = 0x1000
	addq	$4096, %rcx             # imm = 0x1000
	cmpq	$32, %rdx
	jne	.LBB1_9
# BB#3:                                 # %polly.loop_exit10
                                        #   in Loop: Header=BB1_6 Depth=3
	incq	%rax
	subq	$-128, %rbx
	subq	$-128, %rdi
	cmpq	$32, %rax
	jne	.LBB1_6
# BB#4:                                 # %polly.loop_exit4
                                        #   in Loop: Header=BB1_5 Depth=2
	addq	$131072, %r10           # imm = 0x20000
	addq	$131072, %r11           # imm = 0x20000
	cmpq	%r8, %r9
	leaq	1(%r9), %r9
	jle	.LBB1_5
.LBB1_1:                                # %polly.par.setup
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_5 Depth 2
                                        #       Child Loop BB1_6 Depth 3
                                        #         Child Loop BB1_9 Depth 4
                                        #           Child Loop BB1_7 Depth 5
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB1_2
# BB#10:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end1:
	.size	main_polly_subfn, .Lfunc_end1-main_polly_subfn
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
