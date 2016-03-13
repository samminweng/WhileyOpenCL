	.text
	.file	"MatrixAdd.polly.ll"
	.file	1 "MatrixAdd.c"
	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
.Lfunc_begin0:
	.loc	1 8 0                   # MatrixAdd.c:8:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp0:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp1:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp2:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp3:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp4:
	.cfi_def_cfa_offset 48
.Ltmp5:
	.cfi_offset %rbx, -40
.Ltmp6:
	.cfi_offset %r12, -32
.Ltmp7:
	.cfi_offset %r14, -24
.Ltmp8:
	.cfi_offset %r15, -16
	leaq	(%rsp), %rdi
.Ltmp9:
	#DEBUG_VALUE: init:t <- [%RDI+0]
	.loc	1 13 22 prologue_end    # MatrixAdd.c:13:22
	callq	time
	.loc	1 13 5 is_stmt 0 discriminator 1 # MatrixAdd.c:13:5
	movl	%eax, %edi
.Ltmp10:
	callq	srand
	xorl	%r14d, %r14d
.Ltmp11:
	#DEBUG_VALUE: init:i <- 0
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB0_1:                                # %for.cond2.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	movq	%r14, %rbx
	movl	$10240, %r12d           # imm = 0x2800
	.p2align	4, 0x90
.LBB0_2:                                # %for.body5
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp12:
	.loc	1 16 21 is_stmt 1 discriminator 1 # MatrixAdd.c:16:21
	callq	rand
	.loc	1 16 28 is_stmt 0       # MatrixAdd.c:16:28
	cltq
	imulq	$1374389535, %rax, %rcx # imm = 0x51EB851F
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	imull	$100, %ecx, %ecx
	subl	%ecx, %eax
.Ltmp13:
	#DEBUG_VALUE: r <- %EAX
	.loc	1 17 21 is_stmt 1       # MatrixAdd.c:17:21
	addl	%eax, A(%rbx)
	.loc	1 18 31                 # MatrixAdd.c:18:31
	movl	$100, %ecx
	subl	%eax, %ecx
	.loc	1 18 21 is_stmt 0       # MatrixAdd.c:18:21
	addl	%ecx, B(%rbx)
.Ltmp14:
	.loc	1 15 9 is_stmt 1 discriminator 1 # MatrixAdd.c:15:9
	addq	$4, %rbx
	decq	%r12
	jne	.LBB0_2
.Ltmp15:
# BB#3:                                 # %for.inc22
                                        #   in Loop: Header=BB0_1 Depth=1
	#DEBUG_VALUE: r <- %EAX
	.loc	1 14 5 discriminator 1  # MatrixAdd.c:14:5
	incq	%r15
	addq	$40960, %r14            # imm = 0xA000
	cmpq	$10240, %r15            # imm = 0x2800
	jne	.LBB0_1
.Ltmp16:
# BB#4:                                 # %for.end24
	#DEBUG_VALUE: r <- %EAX
	.loc	1 21 1                  # MatrixAdd.c:21:1
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Ltmp17:
.Lfunc_end0:
	.size	init, .Lfunc_end0-init
	.cfi_endproc

	.globl	mat_add
	.p2align	4, 0x90
	.type	mat_add,@function
mat_add:                                # @mat_add
.Lfunc_begin1:
	.loc	1 23 0                  # MatrixAdd.c:23:0
	.cfi_startproc
# BB#0:                                 # %entry
	xorl	%r8d, %r8d
.Ltmp18:
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
	movl	B(%rdi), %esi
.Ltmp19:
	.loc	1 27 31 prologue_end    # MatrixAdd.c:27:31
	addl	A(%rdi), %esi
	movl	%esi, C(%rdi)
	movl	B+4(%rdi), %esi
	addl	A+4(%rdi), %esi
	movl	%esi, C+4(%rdi)
	addq	$8, %rdi
	addq	$-2, %rdx
	jne	.LBB1_8
.Ltmp20:
# BB#4:                                 # %polly.loop_exit47
                                        #   in Loop: Header=BB1_7 Depth=3
	incq	%rax
	addq	$40960, %rcx            # imm = 0xA000
	cmpq	$32, %rax
	jne	.LBB1_7
# BB#5:                                 # %polly.loop_exit41
                                        #   in Loop: Header=BB1_6 Depth=2
	incq	%r11
	subq	$-128, %r10
	cmpq	$320, %r11              # imm = 0x140
	jne	.LBB1_6
# BB#2:                                 # %polly.loop_exit35
                                        #   in Loop: Header=BB1_1 Depth=1
	incq	%r9
	addq	$1310720, %r8           # imm = 0x140000
	cmpq	$320, %r9               # imm = 0x140
	jne	.LBB1_1
# BB#3:                                 # %polly.exiting
	.loc	1 30 1                  # MatrixAdd.c:30:1
	retq
.Ltmp21:
.Lfunc_end1:
	.size	mat_add, .Lfunc_end1-mat_add
	.cfi_endproc

	.globl	print_array
	.p2align	4, 0x90
	.type	print_array,@function
print_array:                            # @print_array
.Lfunc_begin2:
	.loc	1 33 0                  # MatrixAdd.c:33:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp22:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp23:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp24:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp25:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp26:
	.cfi_def_cfa_offset 48
.Ltmp27:
	.cfi_offset %rbx, -40
.Ltmp28:
	.cfi_offset %r12, -32
.Ltmp29:
	.cfi_offset %r14, -24
.Ltmp30:
	.cfi_offset %r15, -16
	movl	$C, %r14d
.Ltmp31:
	#DEBUG_VALUE: print_array:i <- 0
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB2_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
	movq	%r14, %r12
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB2_2:                                # %for.body3
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp32:
	.loc	1 38 27 prologue_end    # MatrixAdd.c:38:27
	movl	(%r12), %esi
	.loc	1 38 13 is_stmt 0       # MatrixAdd.c:38:13
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
.Ltmp33:
	.loc	1 39 18 is_stmt 1       # MatrixAdd.c:39:18
	movslq	%ebx, %rax
	imulq	$1717986919, %rax, %rcx # imm = 0x66666667
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	shll	$4, %ecx
	leal	(%rcx,%rcx,4), %ecx
	subl	%ecx, %eax
.Ltmp34:
	.loc	1 39 17 is_stmt 0       # MatrixAdd.c:39:17
	cmpl	$79, %eax
	jne	.LBB2_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB2_2 Depth=2
.Ltmp35:
	.loc	1 39 29 discriminator 1 # MatrixAdd.c:39:29
	movl	$10, %edi
	callq	putchar
.Ltmp36:
.LBB2_4:                                # %for.inc
                                        #   in Loop: Header=BB2_2 Depth=2
	.loc	1 37 9 is_stmt 1 discriminator 1 # MatrixAdd.c:37:9
	incq	%rbx
	addq	$4, %r12
	cmpq	$10240, %rbx            # imm = 0x2800
	jne	.LBB2_2
.Ltmp37:
# BB#5:                                 # %for.end
                                        #   in Loop: Header=BB2_1 Depth=1
	.loc	1 41 9                  # MatrixAdd.c:41:9
	movl	$10, %edi
	callq	putchar
.Ltmp38:
	.loc	1 36 5 discriminator 1  # MatrixAdd.c:36:5
	incq	%r15
	addq	$40960, %r14            # imm = 0xA000
	cmpq	$10240, %r15            # imm = 0x2800
	jne	.LBB2_1
.Ltmp39:
# BB#6:                                 # %for.end11
	.loc	1 43 1                  # MatrixAdd.c:43:1
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Ltmp40:
.Lfunc_end2:
	.size	print_array, .Lfunc_end2-print_array
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin3:
	.loc	1 46 0                  # MatrixAdd.c:46:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp41:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp42:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp43:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp44:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp45:
	.cfi_def_cfa_offset 48
.Ltmp46:
	.cfi_offset %rbx, -40
.Ltmp47:
	.cfi_offset %r12, -32
.Ltmp48:
	.cfi_offset %r14, -24
.Ltmp49:
	.cfi_offset %r15, -16
	leaq	(%rsp), %rdi
.Ltmp50:
	#DEBUG_VALUE: init:t <- [%RDI+0]
	.loc	1 13 22 prologue_end    # MatrixAdd.c:13:22
	callq	time
.Ltmp51:
	.loc	1 13 5 is_stmt 0 discriminator 1 # MatrixAdd.c:13:5
	movl	%eax, %edi
.Ltmp52:
	callq	srand
	xorl	%r14d, %r14d
.Ltmp53:
	#DEBUG_VALUE: init:i <- 0
	.loc	1 49 5 is_stmt 1        # MatrixAdd.c:49:5
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB3_1:                                # %for.cond2.preheader.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_2 Depth 2
	movq	%r14, %rbx
	movl	$10240, %r12d           # imm = 0x2800
	.p2align	4, 0x90
.LBB3_2:                                # %for.body5.i
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp54:
	.loc	1 16 21 discriminator 1 # MatrixAdd.c:16:21
	callq	rand
.Ltmp55:
	.loc	1 16 28 is_stmt 0       # MatrixAdd.c:16:28
	cltq
	imulq	$1374389535, %rax, %rcx # imm = 0x51EB851F
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	imull	$100, %ecx, %ecx
	subl	%ecx, %eax
.Ltmp56:
	#DEBUG_VALUE: r <- %EAX
	.loc	1 17 21 is_stmt 1       # MatrixAdd.c:17:21
	addl	%eax, A(%rbx)
	.loc	1 18 31                 # MatrixAdd.c:18:31
	movl	$100, %ecx
	subl	%eax, %ecx
	.loc	1 18 21 is_stmt 0       # MatrixAdd.c:18:21
	addl	%ecx, B(%rbx)
.Ltmp57:
	.loc	1 15 9 is_stmt 1 discriminator 1 # MatrixAdd.c:15:9
	addq	$4, %rbx
	decq	%r12
	jne	.LBB3_2
.Ltmp58:
# BB#3:                                 # %for.inc22.i
                                        #   in Loop: Header=BB3_1 Depth=1
	#DEBUG_VALUE: r <- %EAX
	.loc	1 14 5 discriminator 1  # MatrixAdd.c:14:5
	incq	%r15
	addq	$40960, %r14            # imm = 0xA000
	cmpq	$10240, %r15            # imm = 0x2800
	jne	.LBB3_1
.Ltmp59:
# BB#4:                                 # %init.exit
	#DEBUG_VALUE: r <- %EAX
	xorl	%r8d, %r8d
.Ltmp60:
	#DEBUG_VALUE: mat_add:i <- 0
	.loc	1 50 5                  # MatrixAdd.c:50:5
	xorl	%r9d, %r9d
.Ltmp61:
	.p2align	4, 0x90
.LBB3_7:                                # %polly.loop_preheader34.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_8 Depth 2
                                        #       Child Loop BB3_11 Depth 3
                                        #         Child Loop BB3_9 Depth 4
	movq	%r8, %r10
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB3_8:                                # %polly.loop_preheader40.i
                                        #   Parent Loop BB3_7 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_11 Depth 3
                                        #         Child Loop BB3_9 Depth 4
	movq	%r10, %rax
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB3_11:                               # %polly.loop_preheader46.i
                                        #   Parent Loop BB3_7 Depth=1
                                        #     Parent Loop BB3_8 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB3_9 Depth 4
	movq	%rax, %rdi
	movl	$32, %ecx
	.p2align	4, 0x90
.LBB3_9:                                # %polly.loop_header45.i
                                        #   Parent Loop BB3_7 Depth=1
                                        #     Parent Loop BB3_8 Depth=2
                                        #       Parent Loop BB3_11 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	B(%rdi), %edx
.Ltmp62:
	.loc	1 27 31                 # MatrixAdd.c:27:31
	addl	A(%rdi), %edx
.Ltmp63:
	.loc	1 50 5                  # MatrixAdd.c:50:5
	movl	%edx, C(%rdi)
	movl	B+4(%rdi), %edx
.Ltmp64:
	.loc	1 27 31                 # MatrixAdd.c:27:31
	addl	A+4(%rdi), %edx
.Ltmp65:
	.loc	1 50 5                  # MatrixAdd.c:50:5
	movl	%edx, C+4(%rdi)
	addq	$8, %rdi
	addq	$-2, %rcx
	jne	.LBB3_9
# BB#10:                                # %polly.loop_exit47.i
                                        #   in Loop: Header=BB3_11 Depth=3
	incq	%rbx
	addq	$40960, %rax            # imm = 0xA000
	cmpq	$32, %rbx
	jne	.LBB3_11
# BB#5:                                 # %polly.loop_exit41.i
                                        #   in Loop: Header=BB3_8 Depth=2
	incq	%rsi
	subq	$-128, %r10
	cmpq	$320, %rsi              # imm = 0x140
	jne	.LBB3_8
# BB#6:                                 # %polly.loop_exit35.i
                                        #   in Loop: Header=BB3_7 Depth=1
	incq	%r9
	addq	$1310720, %r8           # imm = 0x140000
	cmpq	$320, %r9               # imm = 0x140
	jne	.LBB3_7
# BB#12:                                # %mat_add.exit
	.loc	1 52 81                 # MatrixAdd.c:52:81
	movl	$419430396, %eax        # imm = 0x18FFFFFC
	movl	C(%rax), %r9d
	.loc	1 52 5 is_stmt 0        # MatrixAdd.c:52:5
	movl	$.L.str.2, %edi
	movl	$10240, %esi            # imm = 0x2800
	movl	$10240, %edx            # imm = 0x2800
	movl	$10239, %ecx            # imm = 0x27FF
	movl	$10239, %r8d            # imm = 0x27FF
	xorl	%eax, %eax
	callq	printf
	.loc	1 53 5 is_stmt 1        # MatrixAdd.c:53:5
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Ltmp66:
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc
	.file	2 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file	3 "/usr/include/time.h"

	.type	A,@object               # @A
	.comm	A,419430400,16
	.type	B,@object               # @B
	.comm	B,419430400,16
	.type	C,@object               # @C
	.comm	C,419430400,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d "
	.size	.L.str, 4

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"Pass %d X %d matrix test case (C[%d][%d] =%d) \n "
	.size	.L.str.2, 49

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
	.asciz	"int"                   # string offset=245
.Linfo_string5:
	.asciz	"sizetype"              # string offset=249
.Linfo_string6:
	.asciz	"B"                     # string offset=258
.Linfo_string7:
	.asciz	"C"                     # string offset=260
.Linfo_string8:
	.asciz	"unsigned int"          # string offset=262
.Linfo_string9:
	.asciz	"init"                  # string offset=275
.Linfo_string10:
	.asciz	"t"                     # string offset=280
.Linfo_string11:
	.asciz	"long int"              # string offset=282
.Linfo_string12:
	.asciz	"__time_t"              # string offset=291
.Linfo_string13:
	.asciz	"time_t"                # string offset=300
.Linfo_string14:
	.asciz	"i"                     # string offset=307
.Linfo_string15:
	.asciz	"j"                     # string offset=309
.Linfo_string16:
	.asciz	"r"                     # string offset=311
.Linfo_string17:
	.asciz	"mat_add"               # string offset=313
.Linfo_string18:
	.asciz	"k"                     # string offset=321
.Linfo_string19:
	.asciz	"print_array"           # string offset=323
.Linfo_string20:
	.asciz	"main"                  # string offset=335
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Ltmp9-.Lfunc_begin0
	.quad	.Ltmp10-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	117                     # DW_OP_breg5
	.byte	0                       # 0
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	80                      # super-register DW_OP_reg0
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc2:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	117                     # DW_OP_breg5
	.byte	0                       # 0
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Ltmp56-.Lfunc_begin0
	.quad	.Ltmp61-.Lfunc_begin0
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
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	10                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	12                      # Abbreviation Code
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
	.byte	13                      # Abbreviation Code
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
	.byte	14                      # Abbreviation Code
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
	.byte	15                      # Abbreviation Code
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
	.byte	16                      # Abbreviation Code
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	17                      # Abbreviation Code
	.byte	22                      # DW_TAG_typedef
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	18                      # Abbreviation Code
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
	.byte	19                      # Abbreviation Code
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
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	540                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x215 DW_TAG_compile_unit
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
	.byte	5                       # Abbrev [5] 0x8b:0x7 DW_TAG_base_type
	.long	.Linfo_string8          # DW_AT_name
	.byte	7                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	7                       # Abbrev [7] 0x92:0x3f DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	290                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0xa5:0x9 DW_TAG_variable
	.long	.Ldebug_loc0            # DW_AT_location
	.long	298                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0xae:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	309                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0xb4:0x5 DW_TAG_variable
	.long	320                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0xb9:0x17 DW_TAG_lexical_block
	.quad	.Ltmp12                 # DW_AT_low_pc
	.long	.Ltmp14-.Ltmp12         # DW_AT_high_pc
	.byte	8                       # Abbrev [8] 0xc6:0x9 DW_TAG_variable
	.long	.Ldebug_loc1            # DW_AT_location
	.long	332                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0xd1:0x24 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	374                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0xe4:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	382                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0xea:0x5 DW_TAG_variable
	.long	393                     # DW_AT_abstract_origin
	.byte	10                      # Abbrev [10] 0xef:0x5 DW_TAG_variable
	.long	404                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0xf5:0x2d DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	13                      # Abbrev [13] 0x10a:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	14                      # Abbrev [14] 0x116:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	15                      # Abbrev [15] 0x122:0x37 DW_TAG_subprogram
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	14                      # Abbrev [14] 0x12a:0xb DW_TAG_variable
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	345                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x135:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	14                      # Abbrev [14] 0x140:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	16                      # Abbrev [16] 0x14b:0xd DW_TAG_lexical_block
	.byte	14                      # Abbrev [14] 0x14c:0xb DW_TAG_variable
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	16                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x159:0xb DW_TAG_typedef
	.long	356                     # DW_AT_type
	.long	.Linfo_string13         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	75                      # DW_AT_decl_line
	.byte	17                      # Abbrev [17] 0x164:0xb DW_TAG_typedef
	.long	367                     # DW_AT_type
	.long	.Linfo_string12         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	139                     # DW_AT_decl_line
	.byte	5                       # Abbrev [5] 0x16f:0x7 DW_TAG_base_type
	.long	.Linfo_string11         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	15                      # Abbrev [15] 0x176:0x2a DW_TAG_subprogram
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	23                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	14                      # Abbrev [14] 0x17e:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	24                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	14                      # Abbrev [14] 0x189:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	24                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	14                      # Abbrev [14] 0x194:0xb DW_TAG_variable
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	24                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	18                      # Abbrev [18] 0x1a0:0x7f DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	45                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	14                      # Abbrev [14] 0x1b9:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	47                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	14                      # Abbrev [14] 0x1c4:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	47                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	14                      # Abbrev [14] 0x1cf:0xb DW_TAG_variable
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	47                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	19                      # Abbrev [19] 0x1da:0x32 DW_TAG_inlined_subroutine
	.long	290                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	49                      # DW_AT_call_line
	.byte	8                       # Abbrev [8] 0x1e5:0x9 DW_TAG_variable
	.long	.Ldebug_loc2            # DW_AT_location
	.long	298                     # DW_AT_abstract_origin
	.byte	9                       # Abbrev [9] 0x1ee:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	309                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0x1f4:0x17 DW_TAG_lexical_block
	.quad	.Ltmp54                 # DW_AT_low_pc
	.long	.Ltmp57-.Ltmp54         # DW_AT_high_pc
	.byte	8                       # Abbrev [8] 0x201:0x9 DW_TAG_variable
	.long	.Ldebug_loc3            # DW_AT_location
	.long	332                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	19                      # Abbrev [19] 0x20c:0x12 DW_TAG_inlined_subroutine
	.long	374                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges1         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	50                      # DW_AT_call_line
	.byte	9                       # Abbrev [9] 0x217:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	382                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	0
	.quad	0
.Ldebug_ranges1:
	.quad	.Ltmp62-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Ltmp64-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
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
	.long	544                     # Compilation Unit Length
	.long	42                      # DIE offset
	.asciz	"A"                     # External Name
	.long	97                      # DIE offset
	.asciz	"B"                     # External Name
	.long	118                     # DIE offset
	.asciz	"C"                     # External Name
	.long	290                     # DIE offset
	.asciz	"init"                  # External Name
	.long	416                     # DIE offset
	.asciz	"main"                  # External Name
	.long	374                     # DIE offset
	.asciz	"mat_add"               # External Name
	.long	245                     # DIE offset
	.asciz	"print_array"           # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	544                     # Compilation Unit Length
	.long	356                     # DIE offset
	.asciz	"__time_t"              # External Name
	.long	345                     # DIE offset
	.asciz	"time_t"                # External Name
	.long	139                     # DIE offset
	.asciz	"unsigned int"          # External Name
	.long	83                      # DIE offset
	.asciz	"int"                   # External Name
	.long	367                     # DIE offset
	.asciz	"long int"              # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
