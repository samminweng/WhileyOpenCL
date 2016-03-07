	.text
	.file	"MatrixMult.vectorization.ll"
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
	movq	$-8192, %rax            # imm = 0xFFFFFFFFFFFFE000
.Ltmp3:
	#DEBUG_VALUE: init_array:i <- 0
	.loc	1 13 21 prologue_end    # MatrixMult.c:13:21
	movaps	.LCPI0_0(%rip), %xmm0   # xmm0 = [1,1]
	.p2align	4, 0x90
.LBB0_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movaps	%xmm0, A+8192(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8192(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8208(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8208(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8224(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8224(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8240(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8240(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8256(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8256(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8272(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8272(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8288(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8288(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8304(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8304(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8320(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8320(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8336(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8336(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8352(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8352(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8368(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8368(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8384(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8384(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8400(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8400(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8416(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8416(%rax)
	.loc	1 13 21                 # MatrixMult.c:13:21
	movaps	%xmm0, A+8432(%rax)
	.loc	1 14 21                 # MatrixMult.c:14:21
	movaps	%xmm0, B+8432(%rax)
.Ltmp4:
	.loc	1 11 5 discriminator 1  # MatrixMult.c:11:5
	addq	$256, %rax              # imm = 0x100
	jne	.LBB0_1
.Ltmp5:
# BB#2:                                 # %for.end12
	.loc	1 17 1                  # MatrixMult.c:17:1
	popq	%rbp
	retq
.Ltmp6:
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
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp7:
	.cfi_def_cfa_offset 16
.Ltmp8:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp9:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
.Ltmp10:
	.cfi_offset %rbx, -32
.Ltmp11:
	.cfi_offset %r14, -24
	xorl	%r9d, %r9d
	movl	$A+24, %r8d
.Ltmp12:
	#DEBUG_VALUE: mat_mult:i <- 0
	.p2align	4, 0x90
.LBB1_1:                                # %polly.loop_preheader2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
                                        #       Child Loop BB1_3 Depth 3
	movl	$B+768, %r11d
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB1_2:                                # %polly.stmt.for.body3
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_3 Depth 3
	movq	%r9, %rax
	shlq	$8, %rax
	leaq	C(%rax,%r14,8), %r10
	movq	$0, C(%rax,%r14,8)
	movl	$16, %ecx
	movq	%r11, %rdx
	movq	%r8, %rdi
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_3:                                # %polly.stmt.for.body8
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-768(%rdx), %rbx
	movq	-512(%rdx), %rsi
.Ltmp13:
	.loc	1 25 45 prologue_end    # MatrixMult.c:25:45
	imulq	-24(%rdi), %rbx
	.loc	1 25 35 is_stmt 0       # MatrixMult.c:25:35
	addq	%rax, %rbx
	.loc	1 25 45                 # MatrixMult.c:25:45
	imulq	-16(%rdi), %rsi
	.loc	1 25 35                 # MatrixMult.c:25:35
	addq	%rbx, %rsi
	movq	-256(%rdx), %rbx
	.loc	1 25 45                 # MatrixMult.c:25:45
	imulq	-8(%rdi), %rbx
	.loc	1 25 35                 # MatrixMult.c:25:35
	addq	%rsi, %rbx
	movq	(%rdx), %rax
	.loc	1 25 45                 # MatrixMult.c:25:45
	imulq	(%rdi), %rax
	.loc	1 25 35                 # MatrixMult.c:25:35
	addq	%rbx, %rax
	addq	$32, %rdi
	addq	$1024, %rdx             # imm = 0x400
	addq	$-2, %rcx
	jne	.LBB1_3
.Ltmp14:
# BB#4:                                 # %polly.stmt.for.inc25
                                        #   in Loop: Header=BB1_2 Depth=2
	movq	%rax, (%r10)
	incq	%r14
	addq	$8, %r11
	cmpq	$32, %r14
	jne	.LBB1_2
# BB#5:                                 # %polly.loop_exit3
                                        #   in Loop: Header=BB1_1 Depth=1
	incq	%r9
	addq	$256, %r8               # imm = 0x100
	cmpq	$32, %r9
	jne	.LBB1_1
# BB#6:                                 # %polly.exiting
	.loc	1 29 1 is_stmt 1        # MatrixMult.c:29:1
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Ltmp15:
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
.Ltmp16:
	.cfi_def_cfa_offset 16
.Ltmp17:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp18:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
.Ltmp19:
	.cfi_offset %rbx, -48
.Ltmp20:
	.cfi_offset %r12, -40
.Ltmp21:
	.cfi_offset %r14, -32
.Ltmp22:
	.cfi_offset %r15, -24
	movl	$C, %r14d
.Ltmp23:
	#DEBUG_VALUE: print_array:i <- 0
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB2_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
.Ltmp24:
	.loc	1 37 21 prologue_end    # MatrixMult.c:37:21
	movq	stdout(%rip), %rcx
	movq	%r14, %rbx
	movl	$32, %r12d
	.p2align	4, 0x90
.LBB2_2:                                # %for.body3
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.loc	1 37 38 is_stmt 0       # MatrixMult.c:37:38
	movq	(%rbx), %rdx
	.loc	1 37 13                 # MatrixMult.c:37:13
	movl	$.L.str, %esi
	xorl	%eax, %eax
	movq	%rcx, %rdi
	callq	fprintf
	.loc	1 37 21                 # MatrixMult.c:37:21
	movq	stdout(%rip), %rcx
.Ltmp25:
	.loc	1 36 9 is_stmt 1 discriminator 1 # MatrixMult.c:36:9
	addq	$8, %rbx
	decq	%r12
	jne	.LBB2_2
.Ltmp26:
# BB#3:                                 # %for.end
                                        #   in Loop: Header=BB2_1 Depth=1
	.loc	1 40 9                  # MatrixMult.c:40:9
	movl	$10, %edi
	movq	%rcx, %rsi
	callq	fputc
.Ltmp27:
	.loc	1 35 5 discriminator 1  # MatrixMult.c:35:5
	incq	%r15
	addq	$256, %r14              # imm = 0x100
	cmpq	$32, %r15
	jne	.LBB2_1
.Ltmp28:
# BB#4:                                 # %for.end11
	.loc	1 42 1                  # MatrixMult.c:42:1
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp29:
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
	pushq	%rbp
.Ltmp30:
	.cfi_def_cfa_offset 16
.Ltmp31:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp32:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
.Ltmp33:
	.cfi_offset %rbx, -40
.Ltmp34:
	.cfi_offset %r14, -32
.Ltmp35:
	.cfi_offset %r15, -24
	xorl	%r8d, %r8d
.Ltmp36:
	#DEBUG_VALUE: main:r <- 0
	movaps	.LCPI3_0(%rip), %xmm0   # xmm0 = [1,1]
	.p2align	4, 0x90
.LBB3_1:                                # %polly.loop_preheader2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_2 Depth 2
                                        #     Child Loop BB3_7 Depth 2
                                        #       Child Loop BB3_8 Depth 3
                                        #         Child Loop BB3_9 Depth 4
	movq	$-8192, %rax            # imm = 0xFFFFFFFFFFFFE000
	.p2align	4, 0x90
.LBB3_2:                                # %polly.stmt.vector.body
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movaps	%xmm0, A+8192(%rax)
	movaps	%xmm0, B+8192(%rax)
	movaps	%xmm0, A+8208(%rax)
	movaps	%xmm0, B+8208(%rax)
	movaps	%xmm0, A+8224(%rax)
	movaps	%xmm0, B+8224(%rax)
	movaps	%xmm0, A+8240(%rax)
	movaps	%xmm0, B+8240(%rax)
	movaps	%xmm0, A+8256(%rax)
	movaps	%xmm0, B+8256(%rax)
	movaps	%xmm0, A+8272(%rax)
	movaps	%xmm0, B+8272(%rax)
	movaps	%xmm0, A+8288(%rax)
	movaps	%xmm0, B+8288(%rax)
	movaps	%xmm0, A+8304(%rax)
	movaps	%xmm0, B+8304(%rax)
	movaps	%xmm0, A+8320(%rax)
	movaps	%xmm0, B+8320(%rax)
	movaps	%xmm0, A+8336(%rax)
	movaps	%xmm0, B+8336(%rax)
	movaps	%xmm0, A+8352(%rax)
	movaps	%xmm0, B+8352(%rax)
	movaps	%xmm0, A+8368(%rax)
	movaps	%xmm0, B+8368(%rax)
	movaps	%xmm0, A+8384(%rax)
	movaps	%xmm0, B+8384(%rax)
	movaps	%xmm0, A+8400(%rax)
	movaps	%xmm0, B+8400(%rax)
	movaps	%xmm0, A+8416(%rax)
	movaps	%xmm0, B+8416(%rax)
	movaps	%xmm0, A+8432(%rax)
	movaps	%xmm0, B+8432(%rax)
	addq	$256, %rax              # imm = 0x100
	movl	$A+24, %r9d
	movl	$0, %r10d
	jne	.LBB3_2
	.p2align	4, 0x90
.LBB3_7:                                # %polly.loop_preheader77
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_8 Depth 3
                                        #         Child Loop BB3_9 Depth 4
	movl	$B+768, %r14d
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB3_8:                                # %polly.stmt.for.body3.i3
                                        #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_7 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB3_9 Depth 4
	movq	%r10, %rax
	shlq	$8, %rax
	leaq	C(%rax,%r15,8), %r11
	movq	$0, C(%rax,%r15,8)
	movl	$16, %ecx
	movq	%r14, %rsi
	movq	%r9, %rax
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB3_9:                                # %polly.stmt.for.body8.i
                                        #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_7 Depth=2
                                        #       Parent Loop BB3_8 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	-768(%rsi), %rdx
	movq	-512(%rsi), %rdi
.Ltmp37:
	.loc	1 25 45 prologue_end    # MatrixMult.c:25:45
	imulq	-24(%rax), %rdx
	.loc	1 25 35 is_stmt 0       # MatrixMult.c:25:35
	addq	%rbx, %rdx
	.loc	1 25 45                 # MatrixMult.c:25:45
	imulq	-16(%rax), %rdi
	.loc	1 25 35                 # MatrixMult.c:25:35
	addq	%rdx, %rdi
	movq	-256(%rsi), %rdx
	.loc	1 25 45                 # MatrixMult.c:25:45
	imulq	-8(%rax), %rdx
	.loc	1 25 35                 # MatrixMult.c:25:35
	addq	%rdi, %rdx
	movq	(%rsi), %rbx
	.loc	1 25 45                 # MatrixMult.c:25:45
	imulq	(%rax), %rbx
	.loc	1 25 35                 # MatrixMult.c:25:35
	addq	%rdx, %rbx
	addq	$32, %rax
	addq	$1024, %rsi             # imm = 0x400
	addq	$-2, %rcx
	jne	.LBB3_9
.Ltmp38:
# BB#5:                                 # %polly.stmt.for.inc25.i
                                        #   in Loop: Header=BB3_8 Depth=3
	movq	%rbx, (%r11)
	incq	%r15
	addq	$8, %r14
	cmpq	$32, %r15
	jne	.LBB3_8
# BB#6:                                 # %polly.loop_exit78
                                        #   in Loop: Header=BB3_7 Depth=2
	incq	%r10
	addq	$256, %r9               # imm = 0x100
	cmpq	$32, %r10
	jne	.LBB3_7
# BB#3:                                 # %polly.loop_exit72
                                        #   in Loop: Header=BB3_1 Depth=1
	incq	%r8
	cmpq	$10000, %r8             # imm = 0x2710
	jne	.LBB3_1
# BB#4:                                 # %polly.exiting
	.loc	1 55 71 is_stmt 1       # MatrixMult.c:55:71
	movq	C+8184(%rip), %rcx
	.loc	1 55 5 is_stmt 0        # MatrixMult.c:55:5
	movl	$.L.str.2, %edi
	movl	$32, %esi
	movl	$32, %edx
	xorl	%eax, %eax
	callq	printf
	.loc	1 56 5 is_stmt 1        # MatrixMult.c:56:5
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp39:
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc

	.type	A,@object               # @A
	.comm	A,8192,16
	.type	B,@object               # @B
	.comm	B,8192,16
	.type	C,@object               # @C
	.comm	C,8192,16
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
	.asciz	"mat_mult"              # string offset=274
.Linfo_string9:
	.asciz	"init_array"            # string offset=283
.Linfo_string10:
	.asciz	"print_array"           # string offset=294
.Linfo_string11:
	.asciz	"main"                  # string offset=306
.Linfo_string12:
	.asciz	"int"                   # string offset=311
.Linfo_string13:
	.asciz	"i"                     # string offset=315
.Linfo_string14:
	.asciz	"r"                     # string offset=317
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
	.byte	11                      # DW_FORM_data1
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
	.byte	10                      # Abbreviation Code
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
	.byte	11                      # Abbreviation Code
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
	.byte	12                      # Abbreviation Code
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
	.long	306                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x12b DW_TAG_compile_unit
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
	.byte	3                       # Abbrev [3] 0x3f:0x12 DW_TAG_array_type
	.long	81                      # DW_AT_type
	.byte	4                       # Abbrev [4] 0x44:0x6 DW_TAG_subrange_type
	.long	88                      # DW_AT_type
	.byte	32                      # DW_AT_count
	.byte	4                       # Abbrev [4] 0x4a:0x6 DW_TAG_subrange_type
	.long	88                      # DW_AT_type
	.byte	32                      # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x51:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	6                       # Abbrev [6] 0x58:0x7 DW_TAG_base_type
	.long	.Linfo_string5          # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	2                       # Abbrev [2] 0x5f:0x15 DW_TAG_variable
	.long	.Linfo_string6          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	B
	.byte	2                       # Abbrev [2] 0x74:0x15 DW_TAG_variable
	.long	.Linfo_string7          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	C
	.byte	7                       # Abbrev [7] 0x89:0x22 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
                                        # DW_AT_external
	.byte	8                       # Abbrev [8] 0x9e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	302                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0xab:0x20 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	237                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0xbe:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	20                      # DW_AT_decl_line
	.long	302                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0xcb:0x22 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
                                        # DW_AT_external
	.byte	8                       # Abbrev [8] 0xe0:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	33                      # DW_AT_decl_line
	.long	302                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	10                      # Abbrev [10] 0xed:0x8 DW_TAG_subprogram
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	11                      # Abbrev [11] 0xf5:0x39 DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
	.long	302                     # DW_AT_type
                                        # DW_AT_external
	.byte	8                       # Abbrev [8] 0x10e:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	49                      # DW_AT_decl_line
	.long	302                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x11a:0x13 DW_TAG_inlined_subroutine
	.long	237                     # DW_AT_abstract_origin
	.quad	.Ltmp37                 # DW_AT_low_pc
	.long	.Ltmp38-.Ltmp37         # DW_AT_high_pc
	.byte	1                       # DW_AT_call_file
	.byte	52                      # DW_AT_call_line
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x12e:0x7 DW_TAG_base_type
	.long	.Linfo_string12         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
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
	.long	310                     # Compilation Unit Length
	.long	42                      # DIE offset
	.asciz	"A"                     # External Name
	.long	95                      # DIE offset
	.asciz	"B"                     # External Name
	.long	116                     # DIE offset
	.asciz	"C"                     # External Name
	.long	237                     # DIE offset
	.asciz	"mat_mult"              # External Name
	.long	137                     # DIE offset
	.asciz	"init_array"            # External Name
	.long	245                     # DIE offset
	.asciz	"main"                  # External Name
	.long	203                     # DIE offset
	.asciz	"print_array"           # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	310                     # Compilation Unit Length
	.long	81                      # DIE offset
	.asciz	"long long int"         # External Name
	.long	302                     # DIE offset
	.asciz	"int"                   # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
