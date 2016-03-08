	.text
	.file	"MatrixAdd.tiling.ll"
	.file	1 "MatrixAdd.c"
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
	.loc	1 8 0                   # MatrixAdd.c:8:0
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
	#DEBUG_VALUE: init_array:i <- 0
	.loc	1 13 21 prologue_end    # MatrixAdd.c:13:21
	movaps	.LCPI0_0(%rip), %xmm0   # xmm0 = [1,1]
	xorl	%ecx, %ecx
.Ltmp4:
	.p2align	4, 0x90
.LBB0_1:                                # %vector.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	.loc	1 12 9 discriminator 1  # MatrixAdd.c:12:9
	movq	%rax, %rdx
	movl	$1024, %esi             # imm = 0x400
	.p2align	4, 0x90
.LBB0_2:                                # %vector.body
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp5:
	.loc	1 13 21                 # MatrixAdd.c:13:21
	movaps	%xmm0, A(%rdx)
	movaps	%xmm0, A+16(%rdx)
	.loc	1 14 21                 # MatrixAdd.c:14:21
	movaps	%xmm0, B(%rdx)
	movaps	%xmm0, B+16(%rdx)
	.loc	1 13 21                 # MatrixAdd.c:13:21
	movaps	%xmm0, A+32(%rdx)
	movaps	%xmm0, A+48(%rdx)
	.loc	1 14 21                 # MatrixAdd.c:14:21
	movaps	%xmm0, B+32(%rdx)
	movaps	%xmm0, B+48(%rdx)
.Ltmp6:
	.loc	1 12 9 discriminator 1  # MatrixAdd.c:12:9
	addq	$64, %rdx
	addq	$-8, %rsi
	jne	.LBB0_2
.Ltmp7:
# BB#3:                                 # %for.inc10
                                        #   in Loop: Header=BB0_1 Depth=1
	.loc	1 11 5 discriminator 1  # MatrixAdd.c:11:5
	incq	%rcx
	addq	$8192, %rax             # imm = 0x2000
	cmpq	$1024, %rcx             # imm = 0x400
	jne	.LBB0_1
.Ltmp8:
# BB#4:                                 # %for.end12
	.loc	1 17 1                  # MatrixAdd.c:17:1
	popq	%rbp
	retq
.Ltmp9:
.Lfunc_end0:
	.size	init_array, .Lfunc_end0-init_array
	.cfi_endproc

	.globl	mat_add
	.p2align	4, 0x90
	.type	mat_add,@function
mat_add:                                # @mat_add
.Lfunc_begin1:
	.loc	1 19 0                  # MatrixAdd.c:19:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp10:
	.cfi_def_cfa_offset 16
.Ltmp11:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp12:
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
.Ltmp13:
	#DEBUG_VALUE: mat_add:i <- 0
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_1:                                # %vector.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
.Ltmp14:
	.loc	1 22 9 prologue_end discriminator 1 # MatrixAdd.c:22:9
	movq	%rax, %rdx
	movl	$1024, %esi             # imm = 0x400
	.p2align	4, 0x90
.LBB1_2:                                # %vector.body
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp15:
	.loc	1 23 33                 # MatrixAdd.c:23:33
	movdqa	B(%rdx), %xmm0
	movdqa	B+16(%rdx), %xmm1
	.loc	1 23 31 is_stmt 0       # MatrixAdd.c:23:31
	paddq	A(%rdx), %xmm0
	paddq	A+16(%rdx), %xmm1
	.loc	1 23 21                 # MatrixAdd.c:23:21
	movdqa	%xmm0, C(%rdx)
	movdqa	%xmm1, C+16(%rdx)
	.loc	1 23 33                 # MatrixAdd.c:23:33
	movdqa	B+32(%rdx), %xmm0
	movdqa	B+48(%rdx), %xmm1
	.loc	1 23 31                 # MatrixAdd.c:23:31
	paddq	A+32(%rdx), %xmm0
	paddq	A+48(%rdx), %xmm1
	.loc	1 23 21                 # MatrixAdd.c:23:21
	movdqa	%xmm0, C+32(%rdx)
	movdqa	%xmm1, C+48(%rdx)
.Ltmp16:
	.loc	1 22 9 is_stmt 1 discriminator 1 # MatrixAdd.c:22:9
	addq	$64, %rdx
	addq	$-8, %rsi
	jne	.LBB1_2
.Ltmp17:
# BB#3:                                 # %for.inc14
                                        #   in Loop: Header=BB1_1 Depth=1
	.loc	1 21 5 discriminator 1  # MatrixAdd.c:21:5
	incq	%rcx
	addq	$8192, %rax             # imm = 0x2000
	cmpq	$1024, %rcx             # imm = 0x400
	jne	.LBB1_1
.Ltmp18:
# BB#4:                                 # %for.end16
	.loc	1 27 1                  # MatrixAdd.c:27:1
	popq	%rbp
	retq
.Ltmp19:
.Lfunc_end1:
	.size	mat_add, .Lfunc_end1-mat_add
	.cfi_endproc

	.globl	print_array
	.p2align	4, 0x90
	.type	print_array,@function
print_array:                            # @print_array
.Lfunc_begin2:
	.loc	1 30 0                  # MatrixAdd.c:30:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp20:
	.cfi_def_cfa_offset 16
.Ltmp21:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp22:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
.Ltmp23:
	.cfi_offset %rbx, -48
.Ltmp24:
	.cfi_offset %r12, -40
.Ltmp25:
	.cfi_offset %r14, -32
.Ltmp26:
	.cfi_offset %r15, -24
	movl	$C, %r14d
.Ltmp27:
	#DEBUG_VALUE: print_array:i <- 0
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB2_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
.Ltmp28:
	.loc	1 35 21 prologue_end    # MatrixAdd.c:35:21
	movq	stdout(%rip), %rcx
	movq	%r14, %r12
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB2_2:                                # %for.body3
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 35 38 is_stmt 0       # MatrixAdd.c:35:38
	movq	(%r12), %rdx
	.loc	1 35 13                 # MatrixAdd.c:35:13
	movl	$.L.str, %esi
	xorl	%eax, %eax
	movq	%rcx, %rdi
	callq	fprintf
.Ltmp29:
	.loc	1 36 18 is_stmt 1       # MatrixAdd.c:36:18
	movslq	%ebx, %rax
	imulq	$1717986919, %rax, %rcx # imm = 0x66666667
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	shll	$4, %ecx
	leal	(%rcx,%rcx,4), %ecx
	subl	%ecx, %eax
.Ltmp30:
	.loc	1 36 17 is_stmt 0       # MatrixAdd.c:36:17
	cmpl	$79, %eax
	jne	.LBB2_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB2_2 Depth=2
.Ltmp31:
	.loc	1 36 37 discriminator 1 # MatrixAdd.c:36:37
	movq	stdout(%rip), %rsi
	.loc	1 36 29 discriminator 1 # MatrixAdd.c:36:29
	movl	$10, %edi
	callq	fputc
.Ltmp32:
.LBB2_4:                                # %for.inc
                                        #   in Loop: Header=BB2_2 Depth=2
	.loc	1 34 9 is_stmt 1 discriminator 1 # MatrixAdd.c:34:9
	incq	%rbx
.Ltmp33:
	.loc	1 35 21                 # MatrixAdd.c:35:21
	movq	stdout(%rip), %rcx
.Ltmp34:
	.loc	1 34 9 discriminator 1  # MatrixAdd.c:34:9
	addq	$8, %r12
	cmpq	$1024, %rbx             # imm = 0x400
	jne	.LBB2_2
.Ltmp35:
# BB#5:                                 # %for.end
                                        #   in Loop: Header=BB2_1 Depth=1
	.loc	1 38 9                  # MatrixAdd.c:38:9
	movl	$10, %edi
	movq	%rcx, %rsi
	callq	fputc
.Ltmp36:
	.loc	1 33 5 discriminator 1  # MatrixAdd.c:33:5
	incq	%r15
	addq	$8192, %r14             # imm = 0x2000
	cmpq	$1024, %r15             # imm = 0x400
	jne	.LBB2_1
.Ltmp37:
# BB#6:                                 # %for.end11
	.loc	1 40 1                  # MatrixAdd.c:40:1
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp38:
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
	.loc	1 43 0                  # MatrixAdd.c:43:0
	.cfi_startproc
# BB#0:                                 # %entry
	xorl	%eax, %eax
.Ltmp39:
	#DEBUG_VALUE: main:r <- 0
	.loc	1 13 21 prologue_end    # MatrixAdd.c:13:21
	movaps	.LCPI3_0(%rip), %xmm0   # xmm0 = [1,1]
.Ltmp40:
	.p2align	4, 0x90
.LBB3_1:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_2 Depth 2
                                        #       Child Loop BB3_3 Depth 3
                                        #     Child Loop BB3_5 Depth 2
                                        #       Child Loop BB3_6 Depth 3
	#DEBUG_VALUE: init_array:i <- 0
	.loc	1 49 9                  # MatrixAdd.c:49:9
	xorl	%esi, %esi
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB3_2:                                # %vector.ph19
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_3 Depth 3
	movq	%rsi, %rcx
	movl	$1024, %edx             # imm = 0x400
	.p2align	4, 0x90
.LBB3_3:                                # %vector.body15
                                        #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
.Ltmp41:
	.loc	1 13 21                 # MatrixAdd.c:13:21
	movaps	%xmm0, A(%rcx)
	movaps	%xmm0, A+16(%rcx)
	.loc	1 14 21                 # MatrixAdd.c:14:21
	movaps	%xmm0, B(%rcx)
	movaps	%xmm0, B+16(%rcx)
	.loc	1 13 21                 # MatrixAdd.c:13:21
	movaps	%xmm0, A+32(%rcx)
	movaps	%xmm0, A+48(%rcx)
	.loc	1 14 21                 # MatrixAdd.c:14:21
	movaps	%xmm0, B+32(%rcx)
	movaps	%xmm0, B+48(%rcx)
.Ltmp42:
	.loc	1 12 9 discriminator 1  # MatrixAdd.c:12:9
	addq	$64, %rcx
	addq	$-8, %rdx
	jne	.LBB3_3
.Ltmp43:
# BB#4:                                 # %for.inc10.i
                                        #   in Loop: Header=BB3_2 Depth=2
	.loc	1 11 5 discriminator 1  # MatrixAdd.c:11:5
	incq	%rdi
	addq	$8192, %rsi             # imm = 0x2000
	cmpq	$1024, %rdi             # imm = 0x400
.Ltmp44:
	.loc	1 50 9                  # MatrixAdd.c:50:9
	movl	$0, %ecx
	movl	$0, %edx
	jne	.LBB3_2
	.p2align	4, 0x90
.LBB3_5:                                # %vector.ph
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_6 Depth 3
	movq	%rcx, %rsi
	movl	$1024, %edi             # imm = 0x400
	.p2align	4, 0x90
.LBB3_6:                                # %vector.body
                                        #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
.Ltmp45:
	.loc	1 23 33                 # MatrixAdd.c:23:33
	movdqa	B(%rsi), %xmm1
	movdqa	B+16(%rsi), %xmm2
	.loc	1 23 31 is_stmt 0       # MatrixAdd.c:23:31
	paddq	A(%rsi), %xmm1
	paddq	A+16(%rsi), %xmm2
	.loc	1 23 21                 # MatrixAdd.c:23:21
	movdqa	%xmm1, C(%rsi)
	movdqa	%xmm2, C+16(%rsi)
	.loc	1 23 33                 # MatrixAdd.c:23:33
	movdqa	B+32(%rsi), %xmm1
	movdqa	B+48(%rsi), %xmm2
	.loc	1 23 31                 # MatrixAdd.c:23:31
	paddq	A+32(%rsi), %xmm1
	paddq	A+48(%rsi), %xmm2
	.loc	1 23 21                 # MatrixAdd.c:23:21
	movdqa	%xmm1, C+32(%rsi)
	movdqa	%xmm2, C+48(%rsi)
.Ltmp46:
	.loc	1 22 9 is_stmt 1 discriminator 1 # MatrixAdd.c:22:9
	addq	$64, %rsi
	addq	$-8, %rdi
	jne	.LBB3_6
.Ltmp47:
# BB#7:                                 # %for.inc14.i
                                        #   in Loop: Header=BB3_5 Depth=2
	.loc	1 21 5 discriminator 1  # MatrixAdd.c:21:5
	incq	%rdx
	addq	$8192, %rcx             # imm = 0x2000
	cmpq	$1024, %rdx             # imm = 0x400
	jne	.LBB3_5
.Ltmp48:
# BB#8:                                 # %mat_add.exit
                                        #   in Loop: Header=BB3_1 Depth=1
	.loc	1 48 20 discriminator 2 # MatrixAdd.c:48:20
	incl	%eax
.Ltmp49:
	#DEBUG_VALUE: main:r <- %EAX
	.loc	1 48 5 is_stmt 0 discriminator 1 # MatrixAdd.c:48:5
	cmpl	$100, %eax
	jne	.LBB3_1
.Ltmp50:
# BB#9:                                 # %for.end
	#DEBUG_VALUE: main:r <- %EAX
	pushq	%rbp
.Ltmp51:
	.cfi_def_cfa_offset 16
.Ltmp52:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp53:
	.cfi_def_cfa_register %rbp
	.loc	1 53 83 is_stmt 1       # MatrixAdd.c:53:83
	movq	C+8388600(%rip), %r9
	.loc	1 53 5 is_stmt 0        # MatrixAdd.c:53:5
	movl	$.L.str.2, %edi
	movl	$1024, %esi             # imm = 0x400
	movl	$1024, %edx             # imm = 0x400
	movl	$1023, %ecx             # imm = 0x3FF
	movl	$1023, %r8d             # imm = 0x3FF
	xorl	%eax, %eax
.Ltmp54:
	callq	printf
	.loc	1 54 5 is_stmt 1        # MatrixAdd.c:54:5
	xorl	%eax, %eax
	popq	%rbp
	retq
.Ltmp55:
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc

	.type	A,@object               # @A
	.comm	A,8388608,16
	.type	B,@object               # @B
	.comm	B,8388608,16
	.type	C,@object               # @C
	.comm	C,8388608,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%lld "
	.size	.L.str, 6

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"Pass %d X %d matrix test case (C[%d][%d] =%lld) \n "
	.size	.L.str.2, 51

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)" # string offset=0
.Linfo_string1:
	.asciz	"MatrixAdd.c"           # string offset=165
.Linfo_string2:
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten" # string offset=177
.Linfo_string3:
	.asciz	"A"                     # string offset=243
.Linfo_string4:
	.asciz	"long long int"         # string offset=245
.Linfo_string5:
	.asciz	"sizetype"              # string offset=259
.Linfo_string6:
	.asciz	"B"                     # string offset=268
.Linfo_string7:
	.asciz	"C"                     # string offset=270
.Linfo_string8:
	.asciz	"init_array"            # string offset=272
.Linfo_string9:
	.asciz	"i"                     # string offset=283
.Linfo_string10:
	.asciz	"int"                   # string offset=285
.Linfo_string11:
	.asciz	"mat_add"               # string offset=289
.Linfo_string12:
	.asciz	"print_array"           # string offset=297
.Linfo_string13:
	.asciz	"main"                  # string offset=309
.Linfo_string14:
	.asciz	"r"                     # string offset=314
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
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
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
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
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
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
	.byte	13                      # Abbreviation Code
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
	.byte	14                      # Abbreviation Code
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
	.byte	15                      # Abbreviation Code
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
	.byte	16                      # Abbreviation Code
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
	.byte	17                      # Abbreviation Code
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
	.long	341                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x14e DW_TAG_compile_unit
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
	.short	1024                    # DW_AT_count
	.byte	4                       # Abbrev [4] 0x4b:0x7 DW_TAG_subrange_type
	.long	90                      # DW_AT_type
	.short	1024                    # DW_AT_count
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
	.byte	7                       # Abbrev [7] 0x8b:0x1a DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	231                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x9e:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	239                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0xa5:0x20 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	258                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0xb8:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	20                      # DW_AT_decl_line
	.long	251                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	10                      # Abbrev [10] 0xc5:0x22 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	29                      # DW_AT_decl_line
                                        # DW_AT_external
	.byte	9                       # Abbrev [9] 0xda:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
	.long	251                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	11                      # Abbrev [11] 0xe7:0x14 DW_TAG_subprogram
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	12                      # Abbrev [12] 0xef:0xb DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	251                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0xfb:0x7 DW_TAG_base_type
	.long	.Linfo_string10         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	13                      # Abbrev [13] 0x102:0x8 DW_TAG_subprogram
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	14                      # Abbrev [14] 0x10a:0x4e DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	42                      # DW_AT_decl_line
	.long	251                     # DW_AT_type
                                        # DW_AT_external
	.byte	15                      # Abbrev [15] 0x123:0xf DW_TAG_variable
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	47                      # DW_AT_decl_line
	.long	251                     # DW_AT_type
	.byte	16                      # Abbrev [16] 0x132:0x12 DW_TAG_inlined_subroutine
	.long	231                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	49                      # DW_AT_call_line
	.byte	8                       # Abbrev [8] 0x13d:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	239                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x144:0x13 DW_TAG_inlined_subroutine
	.long	258                     # DW_AT_abstract_origin
	.quad	.Ltmp45                 # DW_AT_low_pc
	.long	.Ltmp48-.Ltmp45         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	50                      # DW_AT_call_line
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
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
	.long	345                     # Compilation Unit Length
	.long	42                      # DIE offset
	.asciz	"A"                     # External Name
	.long	97                      # DIE offset
	.asciz	"B"                     # External Name
	.long	118                     # DIE offset
	.asciz	"C"                     # External Name
	.long	231                     # DIE offset
	.asciz	"init_array"            # External Name
	.long	266                     # DIE offset
	.asciz	"main"                  # External Name
	.long	258                     # DIE offset
	.asciz	"mat_add"               # External Name
	.long	197                     # DIE offset
	.asciz	"print_array"           # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	345                     # Compilation Unit Length
	.long	83                      # DIE offset
	.asciz	"long long int"         # External Name
	.long	251                     # DIE offset
	.asciz	"int"                   # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
