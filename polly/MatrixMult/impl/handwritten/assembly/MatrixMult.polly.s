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
	subq	$72, %rsp
.Ltmp26:
	.cfi_def_cfa_offset 128
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
	movl	$C, %r15d
.Ltmp33:
	#DEBUG_VALUE: mat_mult:i <- 0
	movl	$A, %eax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_1:                                # %polly.loop_preheader56
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
                                        #       Child Loop BB1_3 Depth 3
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movq	%r15, 16(%rsp)          # 8-byte Spill
	shlq	$5, %rax
	movl	$1999, %r13d            # imm = 0x7CF
	subq	%rax, %r13
	cmpq	$31, %r13
	movl	$31, %eax
	cmovgq	%rax, %r13
	decq	%r13
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB1_2:                                # %polly.loop_header55
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_3 Depth 3
	movq	%r12, %r14
	shlq	$5, %r14
	addq	$-2000, %r14            # imm = 0xFFFFFFFFFFFFF830
	cmpq	$-33, %r14
	movq	$-32, %rax
	cmovleq	%rax, %r14
	shlq	$2, %r14
	negq	%r14
	movq	$-1, %rbp
	movq	%r15, %rbx
	.p2align	4, 0x90
.LBB1_3:                                # %polly.loop_header61
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movq	%r14, %rdx
	callq	memset
	incq	%rbp
	addq	$8000, %rbx             # imm = 0x1F40
	cmpq	%r13, %rbp
	jle	.LBB1_3
# BB#4:                                 # %polly.loop_exit63
                                        #   in Loop: Header=BB1_2 Depth=2
	incq	%r12
	subq	$-128, %r15
	cmpq	$63, %r12
	jne	.LBB1_2
# BB#5:                                 # %polly.loop_exit57
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	8(%rsp), %rax           # 8-byte Reload
	incq	%rax
	movq	16(%rsp), %r15          # 8-byte Reload
	addq	$256000, %r15           # imm = 0x3E800
	cmpq	$63, %rax
	jne	.LBB1_1
# BB#6:
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_7:                                # %polly.loop_preheader81
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_12 Depth 2
                                        #       Child Loop BB1_13 Depth 3
                                        #         Child Loop BB1_14 Depth 4
                                        #           Child Loop BB1_15 Depth 5
                                        #             Child Loop BB1_16 Depth 6
	movq	%rax, 32(%rsp)          # 8-byte Spill
	shlq	$5, %rax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movl	$1999, %ecx             # imm = 0x7CF
	subq	%rax, %rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovgq	%rax, %rcx
	decq	%rcx
	movq	%rcx, 8(%rsp)           # 8-byte Spill
	movl	$B, %edx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_12:                               # %polly.loop_preheader87
                                        #   Parent Loop BB1_7 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_13 Depth 3
                                        #         Child Loop BB1_14 Depth 4
                                        #           Child Loop BB1_15 Depth 5
                                        #             Child Loop BB1_16 Depth 6
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movq	%rdx, 48(%rsp)          # 8-byte Spill
	movq	%rax, %rdi
	shlq	$5, %rdi
	movl	$1999, %ecx             # imm = 0x7CF
	subq	%rdi, %rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovleq	%rcx, %rax
	decq	%rax
	movq	24(%rsp), %r14          # 8-byte Reload
	movq	%rdx, %r12
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_13:                               # %polly.loop_header86
                                        #   Parent Loop BB1_7 Depth=1
                                        #     Parent Loop BB1_12 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_14 Depth 4
                                        #           Child Loop BB1_15 Depth 5
                                        #             Child Loop BB1_16 Depth 6
	movq	%rcx, 56(%rsp)          # 8-byte Spill
	movq	%r14, 64(%rsp)          # 8-byte Spill
	shlq	$5, %rcx
	movl	$1999, %edx             # imm = 0x7CF
	subq	%rcx, %rdx
	cmpq	$31, %rdx
	movl	$31, %ebp
	cmovleq	%rdx, %rbp
	decq	%rbp
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB1_14:                               # %polly.loop_header92
                                        #   Parent Loop BB1_7 Depth=1
                                        #     Parent Loop BB1_12 Depth=2
                                        #       Parent Loop BB1_13 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB1_15 Depth 5
                                        #             Child Loop BB1_16 Depth 6
	movq	16(%rsp), %rcx          # 8-byte Reload
	leaq	(%r13,%rcx), %rdx
	movq	%r12, %r15
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB1_15:                               # %polly.loop_header99
                                        #   Parent Loop BB1_7 Depth=1
                                        #     Parent Loop BB1_12 Depth=2
                                        #       Parent Loop BB1_13 Depth=3
                                        #         Parent Loop BB1_14 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB1_16 Depth 6
	leaq	(%rbx,%rdi), %rsi
	imulq	$8000, %rdx, %rcx       # imm = 0x1F40
	leaq	C(%rcx,%rsi,4), %r9
	movl	C(%rcx,%rsi,4), %r10d
	movq	$-1, %r11
	movq	%r14, %rsi
	movq	%r15, %r8
	.p2align	4, 0x90
.LBB1_16:                               # %polly.loop_header106
                                        #   Parent Loop BB1_7 Depth=1
                                        #     Parent Loop BB1_12 Depth=2
                                        #       Parent Loop BB1_13 Depth=3
                                        #         Parent Loop BB1_14 Depth=4
                                        #           Parent Loop BB1_15 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movl	(%r8), %ecx
.Ltmp34:
	.loc	1 41 45 prologue_end    # MatrixMult.c:41:45
	imull	(%rsi), %ecx
	.loc	1 41 35 is_stmt 0       # MatrixMult.c:41:35
	addl	%ecx, %r10d
	incq	%r11
	addq	$8000, %r8              # imm = 0x1F40
	addq	$4, %rsi
	cmpq	%rbp, %r11
	jle	.LBB1_16
.Ltmp35:
# BB#17:                                # %polly.loop_exit108
                                        #   in Loop: Header=BB1_15 Depth=5
	movl	%r10d, (%r9)
	addq	$4, %r15
	cmpq	%rax, %rbx
	leaq	1(%rbx), %rbx
	jle	.LBB1_15
# BB#18:                                # %polly.loop_exit101
                                        #   in Loop: Header=BB1_14 Depth=4
	addq	$8000, %r14             # imm = 0x1F40
	cmpq	8(%rsp), %r13           # 8-byte Folded Reload
	leaq	1(%r13), %r13
	jle	.LBB1_14
# BB#10:                                # %polly.loop_exit94
                                        #   in Loop: Header=BB1_13 Depth=3
	movq	56(%rsp), %rcx          # 8-byte Reload
	incq	%rcx
	addq	$256000, %r12           # imm = 0x3E800
	movq	64(%rsp), %r14          # 8-byte Reload
	subq	$-128, %r14
	cmpq	$63, %rcx
	jne	.LBB1_13
# BB#11:                                # %polly.loop_exit88
                                        #   in Loop: Header=BB1_12 Depth=2
	movq	40(%rsp), %rax          # 8-byte Reload
	incq	%rax
	movq	48(%rsp), %rdx          # 8-byte Reload
	subq	$-128, %rdx
	cmpq	$63, %rax
	jne	.LBB1_12
# BB#8:                                 # %polly.loop_exit82
                                        #   in Loop: Header=BB1_7 Depth=1
	movq	32(%rsp), %rax          # 8-byte Reload
	incq	%rax
	addq	$256000, 24(%rsp)       # 8-byte Folded Spill
                                        # imm = 0x3E800
	cmpq	$63, %rax
	jne	.LBB1_7
# BB#9:                                 # %polly.exiting
	.loc	1 44 1 is_stmt 1        # MatrixMult.c:44:1
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp36:
.Lfunc_end1:
	.size	mat_mult, .Lfunc_end1-mat_mult
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin2:
	.loc	1 60 0                  # MatrixMult.c:60:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 61 5 prologue_end     # MatrixMult.c:61:5
	subq	$40, %rsp
.Ltmp37:
	.cfi_def_cfa_offset 48
	callq	init
	.loc	1 62 5                  # MatrixMult.c:62:5
	callq	mat_mult
	.loc	1 64 5                  # MatrixMult.c:64:5
	movl	$.L.str, %edi
	movl	$2000, %esi             # imm = 0x7D0
	movl	$2000, %edx             # imm = 0x7D0
	xorl	%eax, %eax
	callq	printf
	.loc	1 66 19                 # MatrixMult.c:66:19
	movl	A+15999996(%rip), %ecx
	.loc	1 67 19                 # MatrixMult.c:67:19
	movl	B+15999996(%rip), %eax
	.loc	1 68 19                 # MatrixMult.c:68:19
	movl	C+15999996(%rip), %edx
	.loc	1 65 5                  # MatrixMult.c:65:5
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
	.loc	1 69 5                  # MatrixMult.c:69:5
	xorl	%eax, %eax
	addq	$40, %rsp
	retq
.Ltmp38:
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
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten" # string offset=178
.Linfo_string3:
	.asciz	"A"                     # string offset=245
.Linfo_string4:
	.asciz	"int"                   # string offset=247
.Linfo_string5:
	.asciz	"sizetype"              # string offset=251
.Linfo_string6:
	.asciz	"B"                     # string offset=260
.Linfo_string7:
	.asciz	"C"                     # string offset=262
.Linfo_string8:
	.asciz	"R"                     # string offset=264
.Linfo_string9:
	.asciz	"unsigned int"          # string offset=266
.Linfo_string10:
	.asciz	"init"                  # string offset=279
.Linfo_string11:
	.asciz	"mat_mult"              # string offset=284
.Linfo_string12:
	.asciz	"main"                  # string offset=293
.Linfo_string13:
	.asciz	"i"                     # string offset=298
.Linfo_string14:
	.asciz	"j"                     # string offset=300
.Linfo_string15:
	.asciz	"k"                     # string offset=302
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
	.long	290                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x11b DW_TAG_compile_unit
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
	.byte	7                       # Abbrev [7] 0xd4:0x38 DW_TAG_subprogram
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
	.byte	8                       # Abbrev [8] 0xe9:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0xf5:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x100:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	36                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	10                      # Abbrev [10] 0x10c:0x19 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	59                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
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
	.long	294                     # Compilation Unit Length
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
	.long	268                     # DIE offset
	.asciz	"main"                  # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	294                     # Compilation Unit Length
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
