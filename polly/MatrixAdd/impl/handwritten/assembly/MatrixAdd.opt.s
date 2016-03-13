	.text
	.file	"MatrixAdd.opt.ll"
	.file	1 "MatrixAdd.c"
	.globl	init_array
	.p2align	4, 0x90
	.type	init_array,@function
init_array:                             # @init_array
.Lfunc_begin0:
	.loc	1 8 0                   # MatrixAdd.c:8:0
	.cfi_startproc
# BB#0:                                 # %entry
	xorl	%eax, %eax
.Ltmp0:
	#DEBUG_VALUE: init_array:i <- 0
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	movq	%rax, %rdx
	movl	$10240, %esi            # imm = 0x2800
	.p2align	4, 0x90
.LBB0_2:                                # %for.body3
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp1:
	.loc	1 13 21 prologue_end    # MatrixAdd.c:13:21
	movq	$1, A(%rdx)
	.loc	1 14 21                 # MatrixAdd.c:14:21
	movq	$1, B(%rdx)
	.loc	1 13 21                 # MatrixAdd.c:13:21
	movq	$1, A+8(%rdx)
	.loc	1 14 21                 # MatrixAdd.c:14:21
	movq	$1, B+8(%rdx)
	.loc	1 13 21                 # MatrixAdd.c:13:21
	movq	$1, A+16(%rdx)
	.loc	1 14 21                 # MatrixAdd.c:14:21
	movq	$1, B+16(%rdx)
	.loc	1 13 21                 # MatrixAdd.c:13:21
	movq	$1, A+24(%rdx)
	.loc	1 14 21                 # MatrixAdd.c:14:21
	movq	$1, B+24(%rdx)
	.loc	1 13 21                 # MatrixAdd.c:13:21
	movq	$1, A+32(%rdx)
	.loc	1 14 21                 # MatrixAdd.c:14:21
	movq	$1, B+32(%rdx)
.Ltmp2:
	.loc	1 12 9 discriminator 1  # MatrixAdd.c:12:9
	addq	$40, %rdx
	addq	$-5, %rsi
	jne	.LBB0_2
.Ltmp3:
# BB#3:                                 # %for.inc10
                                        #   in Loop: Header=BB0_1 Depth=1
	.loc	1 11 5 discriminator 1  # MatrixAdd.c:11:5
	incq	%rcx
	addq	$81920, %rax            # imm = 0x14000
	cmpq	$10240, %rcx            # imm = 0x2800
	jne	.LBB0_1
.Ltmp4:
# BB#4:                                 # %for.end12
	.loc	1 17 1                  # MatrixAdd.c:17:1
	retq
.Ltmp5:
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
	xorl	%r8d, %r8d
.Ltmp6:
	#DEBUG_VALUE: mat_add:i <- 0
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB1_1:                                # %polly.loop_preheader34
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_6 Depth 2
                                        #       Child Loop BB1_7 Depth 3
                                        #         Child Loop BB1_8 Depth 4
	movq	%r8, %r10
	xorl	%r11d, %r11d
	.p2align	4, 0x90
.LBB1_6:                                # %polly.loop_preheader40
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_7 Depth 3
                                        #         Child Loop BB1_8 Depth 4
	movq	%r10, %rcx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_7:                                # %polly.loop_preheader46
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_6 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_8 Depth 4
	movq	%rcx, %rdi
	movl	$32, %edx
	.p2align	4, 0x90
.LBB1_8:                                # %polly.loop_header45
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_6 Depth=2
                                        #       Parent Loop BB1_7 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	B(%rdi), %rsi
.Ltmp7:
	.loc	1 23 31 prologue_end    # MatrixAdd.c:23:31
	addq	A(%rdi), %rsi
	movq	%rsi, C(%rdi)
	movq	B+8(%rdi), %rsi
	addq	A+8(%rdi), %rsi
	movq	%rsi, C+8(%rdi)
	addq	$16, %rdi
	addq	$-2, %rdx
	jne	.LBB1_8
.Ltmp8:
# BB#4:                                 # %polly.loop_exit47
                                        #   in Loop: Header=BB1_7 Depth=3
	incq	%rax
	addq	$81920, %rcx            # imm = 0x14000
	cmpq	$32, %rax
	jne	.LBB1_7
# BB#5:                                 # %polly.loop_exit41
                                        #   in Loop: Header=BB1_6 Depth=2
	incq	%r11
	addq	$256, %r10              # imm = 0x100
	cmpq	$320, %r11              # imm = 0x140
	jne	.LBB1_6
# BB#2:                                 # %polly.loop_exit35
                                        #   in Loop: Header=BB1_1 Depth=1
	incq	%r9
	addq	$2621440, %r8           # imm = 0x280000
	cmpq	$320, %r9               # imm = 0x140
	jne	.LBB1_1
# BB#3:                                 # %polly.exiting
	.loc	1 27 1                  # MatrixAdd.c:27:1
	retq
.Ltmp9:
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
	pushq	%r15
.Ltmp10:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp11:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp12:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp13:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp14:
	.cfi_def_cfa_offset 48
.Ltmp15:
	.cfi_offset %rbx, -40
.Ltmp16:
	.cfi_offset %r12, -32
.Ltmp17:
	.cfi_offset %r14, -24
.Ltmp18:
	.cfi_offset %r15, -16
	movl	$C, %r14d
.Ltmp19:
	#DEBUG_VALUE: print_array:i <- 0
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB2_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
.Ltmp20:
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
.Ltmp21:
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
.Ltmp22:
	.loc	1 36 17 is_stmt 0       # MatrixAdd.c:36:17
	cmpl	$79, %eax
	jne	.LBB2_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB2_2 Depth=2
.Ltmp23:
	.loc	1 36 37 discriminator 1 # MatrixAdd.c:36:37
	movq	stdout(%rip), %rsi
	.loc	1 36 29 discriminator 1 # MatrixAdd.c:36:29
	movl	$10, %edi
	callq	fputc
.Ltmp24:
.LBB2_4:                                # %for.inc
                                        #   in Loop: Header=BB2_2 Depth=2
	.loc	1 34 9 is_stmt 1 discriminator 1 # MatrixAdd.c:34:9
	incq	%rbx
.Ltmp25:
	.loc	1 35 21                 # MatrixAdd.c:35:21
	movq	stdout(%rip), %rcx
.Ltmp26:
	.loc	1 34 9 discriminator 1  # MatrixAdd.c:34:9
	addq	$8, %r12
	cmpq	$10240, %rbx            # imm = 0x2800
	jne	.LBB2_2
.Ltmp27:
# BB#5:                                 # %for.end
                                        #   in Loop: Header=BB2_1 Depth=1
	.loc	1 38 9                  # MatrixAdd.c:38:9
	movl	$10, %edi
	movq	%rcx, %rsi
	callq	fputc
.Ltmp28:
	.loc	1 33 5 discriminator 1  # MatrixAdd.c:33:5
	incq	%r15
	addq	$81920, %r14            # imm = 0x14000
	cmpq	$10240, %r15            # imm = 0x2800
	jne	.LBB2_1
.Ltmp29:
# BB#6:                                 # %for.end11
	.loc	1 40 1                  # MatrixAdd.c:40:1
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Ltmp30:
.Lfunc_end2:
	.size	print_array, .Lfunc_end2-print_array
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin3:
	.loc	1 43 0                  # MatrixAdd.c:43:0
	.cfi_startproc
# BB#0:                                 # %entry
	xorl	%r8d, %r8d
.Ltmp31:
	#DEBUG_VALUE: init_array:i <- 0
	.loc	1 49 5 prologue_end     # MatrixAdd.c:49:5
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB3_1:                                # %for.cond1.preheader.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_2 Depth 2
	movq	%rcx, %rdx
	movl	$10240, %esi            # imm = 0x2800
	.p2align	4, 0x90
.LBB3_2:                                # %for.body3.i
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp32:
	.loc	1 13 21                 # MatrixAdd.c:13:21
	movq	$1, A(%rdx)
	.loc	1 14 21                 # MatrixAdd.c:14:21
	movq	$1, B(%rdx)
	.loc	1 13 21                 # MatrixAdd.c:13:21
	movq	$1, A+8(%rdx)
	.loc	1 14 21                 # MatrixAdd.c:14:21
	movq	$1, B+8(%rdx)
	.loc	1 13 21                 # MatrixAdd.c:13:21
	movq	$1, A+16(%rdx)
	.loc	1 14 21                 # MatrixAdd.c:14:21
	movq	$1, B+16(%rdx)
	.loc	1 13 21                 # MatrixAdd.c:13:21
	movq	$1, A+24(%rdx)
	.loc	1 14 21                 # MatrixAdd.c:14:21
	movq	$1, B+24(%rdx)
	.loc	1 13 21                 # MatrixAdd.c:13:21
	movq	$1, A+32(%rdx)
	.loc	1 14 21                 # MatrixAdd.c:14:21
	movq	$1, B+32(%rdx)
.Ltmp33:
	.loc	1 12 9 discriminator 1  # MatrixAdd.c:12:9
	addq	$40, %rdx
	addq	$-5, %rsi
	jne	.LBB3_2
.Ltmp34:
# BB#3:                                 # %for.inc10.i
                                        #   in Loop: Header=BB3_1 Depth=1
	.loc	1 11 5 discriminator 1  # MatrixAdd.c:11:5
	incq	%rax
	addq	$81920, %rcx            # imm = 0x14000
	cmpq	$10240, %rax            # imm = 0x2800
	jne	.LBB3_1
.Ltmp35:
# BB#4:
	.loc	1 50 5                  # MatrixAdd.c:50:5
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB3_7:                                # %polly.loop_preheader34.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_8 Depth 2
                                        #       Child Loop BB3_11 Depth 3
                                        #         Child Loop BB3_9 Depth 4
	movq	%r8, %r10
	xorl	%r11d, %r11d
	.p2align	4, 0x90
.LBB3_8:                                # %polly.loop_preheader40.i
                                        #   Parent Loop BB3_7 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_11 Depth 3
                                        #         Child Loop BB3_9 Depth 4
	movq	%r10, %rcx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB3_11:                               # %polly.loop_preheader46.i
                                        #   Parent Loop BB3_7 Depth=1
                                        #     Parent Loop BB3_8 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB3_9 Depth 4
	movq	%rcx, %rdi
	movl	$32, %edx
	.p2align	4, 0x90
.LBB3_9:                                # %polly.loop_header45.i
                                        #   Parent Loop BB3_7 Depth=1
                                        #     Parent Loop BB3_8 Depth=2
                                        #       Parent Loop BB3_11 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	B(%rdi), %rsi
.Ltmp36:
	.loc	1 23 31                 # MatrixAdd.c:23:31
	addq	A(%rdi), %rsi
.Ltmp37:
	.loc	1 50 5                  # MatrixAdd.c:50:5
	movq	%rsi, C(%rdi)
	movq	B+8(%rdi), %rsi
.Ltmp38:
	.loc	1 23 31                 # MatrixAdd.c:23:31
	addq	A+8(%rdi), %rsi
.Ltmp39:
	.loc	1 50 5                  # MatrixAdd.c:50:5
	movq	%rsi, C+8(%rdi)
	addq	$16, %rdi
	addq	$-2, %rdx
	jne	.LBB3_9
# BB#10:                                # %polly.loop_exit47.i
                                        #   in Loop: Header=BB3_11 Depth=3
	incq	%rax
	addq	$81920, %rcx            # imm = 0x14000
	cmpq	$32, %rax
	jne	.LBB3_11
# BB#5:                                 # %polly.loop_exit41.i
                                        #   in Loop: Header=BB3_8 Depth=2
	incq	%r11
	addq	$256, %r10              # imm = 0x100
	cmpq	$320, %r11              # imm = 0x140
	jne	.LBB3_8
# BB#6:                                 # %polly.loop_exit35.i
                                        #   in Loop: Header=BB3_7 Depth=1
	incq	%r9
	addq	$2621440, %r8           # imm = 0x280000
	cmpq	$320, %r9               # imm = 0x140
	jne	.LBB3_7
# BB#12:                                # %mat_add.exit
	.loc	1 53 83                 # MatrixAdd.c:53:83
	pushq	%rax
.Ltmp40:
	.cfi_def_cfa_offset 16
	movl	$838860792, %eax        # imm = 0x31FFFFF8
	movq	C(%rax), %r9
	.loc	1 53 5 is_stmt 0        # MatrixAdd.c:53:5
	movl	$.L.str.2, %edi
	movl	$10240, %esi            # imm = 0x2800
	movl	$10240, %edx            # imm = 0x2800
	movl	$10239, %ecx            # imm = 0x27FF
	movl	$10239, %r8d            # imm = 0x27FF
	xorl	%eax, %eax
	callq	printf
	.loc	1 54 5 is_stmt 1        # MatrixAdd.c:54:5
	xorl	%eax, %eax
	popq	%rcx
	retq
.Ltmp41:
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc

	.type	A,@object               # @A
	.comm	A,838860800,16
	.type	B,@object               # @B
	.comm	B,838860800,16
	.type	C,@object               # @C
	.comm	C,838860800,16
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
	.asciz	"j"                     # string offset=289
.Linfo_string12:
	.asciz	"mat_add"               # string offset=291
.Linfo_string13:
	.asciz	"k"                     # string offset=299
.Linfo_string14:
	.asciz	"print_array"           # string offset=301
.Linfo_string15:
	.asciz	"main"                  # string offset=313
.Linfo_string16:
	.asciz	"t_start"               # string offset=318
.Linfo_string17:
	.asciz	"double"                # string offset=326
.Linfo_string18:
	.asciz	"t_end"                 # string offset=333
.Linfo_string19:
	.asciz	"r"                     # string offset=339
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
	.byte	49                      # DW_AT_abstract_origin
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
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.ascii	"\341\177"              # DW_AT_APPLE_optimized
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
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
	.byte	1                       # DW_CHILDREN_yes
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
	.byte	15                      # Abbreviation Code
	.byte	29                      # DW_TAG_inlined_subroutine
	.byte	1                       # DW_CHILDREN_yes
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
	.byte	16                      # Abbreviation Code
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
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	464                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x1c9 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_APPLE_optimized
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
	.short	10240                   # DW_AT_count
	.byte	4                       # Abbrev [4] 0x4b:0x7 DW_TAG_subrange_type
	.long	90                      # DW_AT_type
	.short	10240                   # DW_AT_count
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
	.byte	7                       # Abbrev [7] 0x8b:0x1f DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	251                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x9e:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	259                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0xa4:0x5 DW_TAG_variable
	.long	270                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0xaa:0x24 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	289                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0xbd:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	297                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0xc3:0x5 DW_TAG_variable
	.long	308                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0xc8:0x5 DW_TAG_variable
	.long	319                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	10                      # Abbrev [10] 0xce:0x2d DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	29                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	11                      # Abbrev [11] 0xe3:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
	.long	282                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0xef:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
	.long	282                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	13                      # Abbrev [13] 0xfb:0x1f DW_TAG_subprogram
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	12                      # Abbrev [12] 0x103:0xb DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	282                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x10e:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	282                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x11a:0x7 DW_TAG_base_type
	.long	.Linfo_string10         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	13                      # Abbrev [13] 0x121:0x2a DW_TAG_subprogram
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	12                      # Abbrev [12] 0x129:0xb DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	20                      # DW_AT_decl_line
	.long	282                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x134:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	20                      # DW_AT_decl_line
	.long	282                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x13f:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	20                      # DW_AT_decl_line
	.long	282                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	14                      # Abbrev [14] 0x14b:0x81 DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	42                      # DW_AT_decl_line
	.long	282                     # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	12                      # Abbrev [12] 0x164:0xb DW_TAG_variable
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
	.long	282                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x16f:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
	.long	282                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x17a:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
	.long	282                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x185:0xb DW_TAG_variable
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	45                      # DW_AT_decl_line
	.long	460                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x190:0xb DW_TAG_variable
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	45                      # DW_AT_decl_line
	.long	460                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x19b:0xb DW_TAG_variable
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	47                      # DW_AT_decl_line
	.long	282                     # DW_AT_type
	.byte	15                      # Abbrev [15] 0x1a6:0x1a DW_TAG_inlined_subroutine
	.long	251                     # DW_AT_abstract_origin
	.quad	.Ltmp32                 # DW_AT_low_pc
	.long	.Ltmp35-.Ltmp32         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	49                      # DW_AT_call_line
	.byte	8                       # Abbrev [8] 0x1b9:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	259                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	16                      # Abbrev [16] 0x1c0:0xb DW_TAG_inlined_subroutine
	.long	289                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	50                      # DW_AT_call_line
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x1cc:0x7 DW_TAG_base_type
	.long	.Linfo_string17         # DW_AT_name
	.byte	4                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp36-.Lfunc_begin0
	.quad	.Ltmp37-.Lfunc_begin0
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
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
	.long	468                     # Compilation Unit Length
	.long	42                      # DIE offset
	.asciz	"A"                     # External Name
	.long	97                      # DIE offset
	.asciz	"B"                     # External Name
	.long	118                     # DIE offset
	.asciz	"C"                     # External Name
	.long	251                     # DIE offset
	.asciz	"init_array"            # External Name
	.long	331                     # DIE offset
	.asciz	"main"                  # External Name
	.long	289                     # DIE offset
	.asciz	"mat_add"               # External Name
	.long	206                     # DIE offset
	.asciz	"print_array"           # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	468                     # Compilation Unit Length
	.long	83                      # DIE offset
	.asciz	"long long int"         # External Name
	.long	282                     # DIE offset
	.asciz	"int"                   # External Name
	.long	460                     # DIE offset
	.asciz	"double"                # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
