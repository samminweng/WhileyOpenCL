	.text
	.file	"MatrixMult.optisl.ll"
	.file	1 "MatrixMult.c"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI0_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
	.text
	.globl	init_array
	.p2align	4, 0x90
	.type	init_array,@function
init_array:                             # @init_array
.Lfunc_begin0:
	.loc	1 8 0                   # MatrixMult.c:8:0
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
	xorl	%eax, %eax
.Ltmp3:
	.loc	1 13 21 prologue_end    # MatrixMult.c:13:21
	movaps	.LCPI0_0(%rip), %xmm0   # xmm0 = [1,1]
	xorl	%ecx, %ecx
.Ltmp4:
	.p2align	4, 0x90
.LBB0_1:                                # %vector.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	.loc	1 12 9 discriminator 1  # MatrixMult.c:12:9
	movq	%rax, %rdx
	movl	$512, %esi              # imm = 0x200
	.p2align	4, 0x90
.LBB0_2:                                # %vector.body
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp5:
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A(%rdx)
	movaps	%xmm0, A+16(%rdx)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B(%rdx)
	movaps	%xmm0, B+16(%rdx)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+32(%rdx)
	movaps	%xmm0, A+48(%rdx)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+32(%rdx)
	movaps	%xmm0, B+48(%rdx)
.Ltmp6:
	.loc	1 12 9 discriminator 1  # MatrixMult.c:12:9
	addq	$64, %rdx
	addq	$-8, %rsi
	jne	.LBB0_2
.Ltmp7:
# BB#3:                                 # %for.inc10
                                        #   in Loop: Header=BB0_1 Depth=1
	.loc	1 11 5 discriminator 1  # MatrixMult.c:11:5
	incq	%rcx
	addq	$4096, %rax             # imm = 0x1000
	cmpq	$512, %rcx              # imm = 0x200
	jne	.LBB0_1
.Ltmp8:
# BB#4:                                 # %for.end12
	.loc	1 17 1                  # MatrixMult.c:17:1
	popq	%rbp
	retq
.Ltmp9:
.Lfunc_end0:
	.size	init_array, .Lfunc_end0-init_array
	.cfi_endproc

	.globl	mat_mult
	.p2align	4, 0x90
	.type	mat_mult,@function
mat_mult:                               # @mat_mult
.Lfunc_begin1:
	.loc	1 19 0                  # MatrixMult.c:19:0
	.cfi_startproc
# BB#0:                                 # %polly.split_new_and_old
	pushq	%rbp
.Ltmp10:
	.cfi_def_cfa_offset 16
.Ltmp11:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp12:
	.cfi_def_cfa_register %rbp
	xorl	%r8d, %r8d
	movl	$A+8, %r9d
.Ltmp13:
	#DEBUG_VALUE: mat_mult:i <- 0
	.p2align	4, 0x90
.LBB1_1:                                # %polly.loop_preheader2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
                                        #       Child Loop BB1_3 Depth 3
	movq	%r8, %rax
	shlq	$12, %rax
	leaq	C(%rax), %r10
	xorl	%r11d, %r11d
	.p2align	4, 0x90
.LBB1_2:                                # %polly.stmt.for.body3
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_3 Depth 3
	movq	$0, (%r10,%r11,8)
	movq	$0, -8(%rbp)
	movq	$-1, %rdi
	movq	$-2088960, %rax         # imm = 0xFFFFFFFFFFE02000
	movq	%r9, %rcx
	.p2align	4, 0x90
.LBB1_3:                                # %polly.stmt.for.body8
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	B+2088960(%rax,%r11,8), %rdx
.Ltmp14:
	.loc	1 25 45 prologue_end    # MatrixMult.c:25:45
	imulq	-8(%rcx), %rdx
	.loc	1 25 35 is_stmt 0       # MatrixMult.c:25:35
	addq	-8(%rbp), %rdx
	movq	B+2093056(%rax,%r11,8), %rsi
	.loc	1 25 45                 # MatrixMult.c:25:45
	imulq	(%rcx), %rsi
	.loc	1 25 35                 # MatrixMult.c:25:35
	addq	%rdx, %rsi
	movq	%rsi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	incq	%rdi
	addq	$8192, %rax             # imm = 0x2000
	addq	$16, %rcx
	cmpq	$255, %rdi
	jl	.LBB1_3
.Ltmp15:
# BB#4:                                 # %polly.stmt.for.inc25
                                        #   in Loop: Header=BB1_2 Depth=2
	movq	-16(%rbp), %rax
	movq	%rax, (%r10,%r11,8)
	cmpq	$511, %r11              # imm = 0x1FF
	leaq	1(%r11), %r11
	jl	.LBB1_2
# BB#5:                                 # %polly.loop_exit3
                                        #   in Loop: Header=BB1_1 Depth=1
	addq	$4096, %r9              # imm = 0x1000
	cmpq	$511, %r8               # imm = 0x1FF
	leaq	1(%r8), %r8
	jl	.LBB1_1
# BB#6:                                 # %for.end30
	.loc	1 29 1 is_stmt 1        # MatrixMult.c:29:1
	popq	%rbp
	retq
.Ltmp16:
.Lfunc_end1:
	.size	mat_mult, .Lfunc_end1-mat_mult
	.cfi_endproc

	.globl	print_array
	.p2align	4, 0x90
	.type	print_array,@function
print_array:                            # @print_array
.Lfunc_begin2:
	.loc	1 32 0                  # MatrixMult.c:32:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp17:
	.cfi_def_cfa_offset 16
.Ltmp18:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp19:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
.Ltmp20:
	.cfi_offset %rbx, -48
.Ltmp21:
	.cfi_offset %r12, -40
.Ltmp22:
	.cfi_offset %r14, -32
.Ltmp23:
	.cfi_offset %r15, -24
	movl	$C, %r14d
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB2_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
.Ltmp24:
	.loc	1 37 21 prologue_end    # MatrixMult.c:37:21
	movq	stdout(%rip), %rcx
	movq	%r14, %r12
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB2_2:                                # %for.body3
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 37 38 is_stmt 0       # MatrixMult.c:37:38
	movq	(%r12), %rdx
	.loc	1 37 13                 # MatrixMult.c:37:13
	movl	$.L.str, %esi
	xorl	%eax, %eax
	movq	%rcx, %rdi
	callq	fprintf
.Ltmp25:
	.loc	1 38 18 is_stmt 1       # MatrixMult.c:38:18
	movslq	%ebx, %rax
	imulq	$1717986919, %rax, %rcx # imm = 0x66666667
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	shll	$4, %ecx
	leal	(%rcx,%rcx,4), %ecx
	subl	%ecx, %eax
.Ltmp26:
	.loc	1 38 17 is_stmt 0       # MatrixMult.c:38:17
	cmpl	$79, %eax
	jne	.LBB2_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB2_2 Depth=2
.Ltmp27:
	.loc	1 38 37 discriminator 1 # MatrixMult.c:38:37
	movq	stdout(%rip), %rsi
	.loc	1 38 29 discriminator 1 # MatrixMult.c:38:29
	movl	$10, %edi
	callq	fputc
.Ltmp28:
.LBB2_4:                                # %for.inc
                                        #   in Loop: Header=BB2_2 Depth=2
	.loc	1 36 9 is_stmt 1 discriminator 1 # MatrixMult.c:36:9
	incq	%rbx
.Ltmp29:
	.loc	1 37 21                 # MatrixMult.c:37:21
	movq	stdout(%rip), %rcx
.Ltmp30:
	.loc	1 36 9 discriminator 1  # MatrixMult.c:36:9
	addq	$8, %r12
	cmpq	$512, %rbx              # imm = 0x200
	jne	.LBB2_2
.Ltmp31:
# BB#5:                                 # %for.end
                                        #   in Loop: Header=BB2_1 Depth=1
	.loc	1 40 9                  # MatrixMult.c:40:9
	movl	$10, %edi
	movq	%rcx, %rsi
	callq	fputc
.Ltmp32:
	.loc	1 35 5 discriminator 1  # MatrixMult.c:35:5
	incq	%r15
	addq	$4096, %r14             # imm = 0x1000
	cmpq	$512, %r15              # imm = 0x200
	jne	.LBB2_1
.Ltmp33:
# BB#6:                                 # %for.end11
	.loc	1 42 1                  # MatrixMult.c:42:1
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp34:
.Lfunc_end2:
	.size	print_array, .Lfunc_end2-print_array
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI3_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin3:
	.loc	1 45 0                  # MatrixMult.c:45:0
	.cfi_startproc
# BB#0:                                 # %entry
	xorl	%eax, %eax
.Ltmp35:
	.loc	1 13 21 prologue_end    # MatrixMult.c:13:21
	movaps	.LCPI3_0(%rip), %xmm0   # xmm0 = [1,1]
.Ltmp36:
	.loc	1 51 5                  # MatrixMult.c:51:5
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB3_1:                                # %vector.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_2 Depth 2
	movq	%rax, %rdx
	movl	$512, %esi              # imm = 0x200
	.p2align	4, 0x90
.LBB3_2:                                # %vector.body
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp37:
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A(%rdx)
	movaps	%xmm0, A+16(%rdx)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B(%rdx)
	movaps	%xmm0, B+16(%rdx)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+32(%rdx)
	movaps	%xmm0, A+48(%rdx)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+32(%rdx)
	movaps	%xmm0, B+48(%rdx)
.Ltmp38:
	.loc	1 12 9 discriminator 1  # MatrixMult.c:12:9
	addq	$64, %rdx
	addq	$-8, %rsi
	jne	.LBB3_2
.Ltmp39:
# BB#3:                                 # %for.inc10.i
                                        #   in Loop: Header=BB3_1 Depth=1
	.loc	1 11 5 discriminator 1  # MatrixMult.c:11:5
	incq	%rcx
	addq	$4096, %rax             # imm = 0x1000
	cmpq	$512, %rcx              # imm = 0x200
	jne	.LBB3_1
.Ltmp40:
# BB#4:                                 # %polly.split_new_and_old
	pushq	%rbp
.Ltmp41:
	.cfi_def_cfa_offset 16
.Ltmp42:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp43:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	xorl	%r8d, %r8d
	movl	$A+8, %r9d
	.p2align	4, 0x90
.LBB3_5:                                # %polly.loop_preheader2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_6 Depth 2
                                        #       Child Loop BB3_7 Depth 3
	movq	%r8, %rax
	shlq	$12, %rax
	leaq	C(%rax), %r10
	xorl	%r11d, %r11d
	.p2align	4, 0x90
.LBB3_6:                                # %polly.stmt.for.body3.i3
                                        #   Parent Loop BB3_5 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_7 Depth 3
	movq	$0, (%r10,%r11,8)
	movq	$0, -8(%rbp)
	movq	$-1, %rdi
	movq	$-2088960, %rax         # imm = 0xFFFFFFFFFFE02000
	movq	%r9, %rcx
	.p2align	4, 0x90
.LBB3_7:                                # %polly.stmt.for.body8.i
                                        #   Parent Loop BB3_5 Depth=1
                                        #     Parent Loop BB3_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	B+2088960(%rax,%r11,8), %rdx
.Ltmp44:
	.loc	1 25 45                 # MatrixMult.c:25:45
	imulq	-8(%rcx), %rdx
	.loc	1 25 35 is_stmt 0       # MatrixMult.c:25:35
	addq	-8(%rbp), %rdx
	movq	B+2093056(%rax,%r11,8), %rsi
	.loc	1 25 45                 # MatrixMult.c:25:45
	imulq	(%rcx), %rsi
	.loc	1 25 35                 # MatrixMult.c:25:35
	addq	%rdx, %rsi
	movq	%rsi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	incq	%rdi
	addq	$8192, %rax             # imm = 0x2000
	addq	$16, %rcx
	cmpq	$255, %rdi
	jl	.LBB3_7
.Ltmp45:
# BB#8:                                 # %polly.stmt.for.inc25.i
                                        #   in Loop: Header=BB3_6 Depth=2
	movq	-16(%rbp), %rax
	movq	%rax, (%r10,%r11,8)
	cmpq	$511, %r11              # imm = 0x1FF
	leaq	1(%r11), %r11
	jl	.LBB3_6
# BB#9:                                 # %polly.loop_exit3
                                        #   in Loop: Header=BB3_5 Depth=1
	addq	$4096, %r9              # imm = 0x1000
	cmpq	$511, %r8               # imm = 0x1FF
	leaq	1(%r8), %r8
	jl	.LBB3_5
# BB#10:                                # %mat_mult.exit
	.loc	1 55 71 is_stmt 1       # MatrixMult.c:55:71
	movq	C+2097144(%rip), %rcx
	.loc	1 55 5 is_stmt 0        # MatrixMult.c:55:5
	movl	$.L.str.2, %edi
	movl	$512, %esi              # imm = 0x200
	movl	$512, %edx              # imm = 0x200
	xorl	%eax, %eax
	callq	printf
	.loc	1 56 5 is_stmt 1        # MatrixMult.c:56:5
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
.Ltmp46:
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc

	.type	A,@object               # @A
	.comm	A,2097152,16
	.type	B,@object               # @B
	.comm	B,2097152,16
	.type	C,@object               # @C
	.comm	C,2097152,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%lld "
	.size	.L.str, 6

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"Pass %d X %d matrix test case (C[N][N] =%lld) \n "
	.size	.L.str.2, 49

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)" # string offset=0
.Linfo_string1:
	.asciz	"MatrixMult.c"          # string offset=165
.Linfo_string2:
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten" # string offset=178
.Linfo_string3:
	.asciz	"A"                     # string offset=245
.Linfo_string4:
	.asciz	"long long int"         # string offset=247
.Linfo_string5:
	.asciz	"sizetype"              # string offset=261
.Linfo_string6:
	.asciz	"B"                     # string offset=270
.Linfo_string7:
	.asciz	"C"                     # string offset=272
.Linfo_string8:
	.asciz	"init_array"            # string offset=274
.Linfo_string9:
	.asciz	"mat_mult"              # string offset=285
.Linfo_string10:
	.asciz	"print_array"           # string offset=294
.Linfo_string11:
	.asciz	"main"                  # string offset=306
.Linfo_string12:
	.asciz	"int"                   # string offset=311
.Linfo_string13:
	.asciz	"i"                     # string offset=315
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
	.byte	0                       # DW_CHILDREN_no
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	49                      # DW_AT_abstract_origin
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
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
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
	.byte	46                      # DW_TAG_subprogram
	.byte	0                       # DW_CHILDREN_no
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
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	32                      # DW_AT_inline
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	12                      # Abbreviation Code
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
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	13                      # Abbreviation Code
	.byte	29                      # DW_TAG_inlined_subroutine
	.byte	0                       # DW_CHILDREN_no
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
	.byte	14                      # Abbreviation Code
	.byte	29                      # DW_TAG_inlined_subroutine
	.byte	0                       # DW_CHILDREN_no
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	88                      # DW_AT_call_file
	.byte	11                      # DW_FORM_data1
	.byte	89                      # DW_AT_call_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	287                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x118 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x15 DW_TAG_variable
	.long	.Linfo_string3          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	A
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
	.byte	8                       # DW_AT_byte_size
	.byte	6                       # Abbrev [6] 0x5a:0x7 DW_TAG_base_type
	.long	.Linfo_string5          # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	2                       # Abbrev [2] 0x61:0x15 DW_TAG_variable
	.long	.Linfo_string6          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	B
	.byte	2                       # Abbrev [2] 0x76:0x15 DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	C
	.byte	7                       # Abbrev [7] 0x8b:0x13 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	211                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x9e:0x20 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	219                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0xb1:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	20                      # DW_AT_decl_line
	.long	283                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	10                      # Abbrev [10] 0xbe:0x15 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
                                        # DW_AT_external
	.byte	11                      # Abbrev [11] 0xd3:0x8 DW_TAG_subprogram
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	11                      # Abbrev [11] 0xdb:0x8 DW_TAG_subprogram
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	12                      # Abbrev [12] 0xe3:0x38 DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
	.long	283                     # DW_AT_type
                                        # DW_AT_external
	.byte	13                      # Abbrev [13] 0xfc:0xb DW_TAG_inlined_subroutine
	.long	211                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	51                      # DW_AT_call_line
	.byte	14                      # Abbrev [14] 0x107:0x13 DW_TAG_inlined_subroutine
	.long	219                     # DW_AT_abstract_origin
	.quad	.Ltmp44                 # DW_AT_low_pc
	.long	.Ltmp45-.Ltmp44         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	52                      # DW_AT_call_line
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x11b:0x7 DW_TAG_base_type
	.long	.Linfo_string12         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp35-.Lfunc_begin0
	.quad	.Ltmp36-.Lfunc_begin0
	.quad	.Ltmp37-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
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
	.long	291                     # Compilation Unit Length
	.long	42                      # DIE offset
	.asciz	"A"                     # External Name
	.long	97                      # DIE offset
	.asciz	"B"                     # External Name
	.long	118                     # DIE offset
	.asciz	"C"                     # External Name
	.long	219                     # DIE offset
	.asciz	"mat_mult"              # External Name
	.long	211                     # DIE offset
	.asciz	"init_array"            # External Name
	.long	227                     # DIE offset
	.asciz	"main"                  # External Name
	.long	190                     # DIE offset
	.asciz	"print_array"           # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	291                     # Compilation Unit Length
	.long	83                      # DIE offset
	.asciz	"long long int"         # External Name
	.long	283                     # DIE offset
	.asciz	"int"                   # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
