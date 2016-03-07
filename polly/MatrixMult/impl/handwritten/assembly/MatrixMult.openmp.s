	.text
	.file	"MatrixMult.openmp.ll"
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
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp10:
	.cfi_def_cfa_offset 16
.Ltmp11:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp12:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
.Ltmp13:
	.cfi_offset %rbx, -24
.Ltmp14:
	#DEBUG_VALUE: mat_mult:i <- 0
	leaq	-16(%rbp), %rbx
	movl	$mat_mult_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$16, %r8d
	movl	$1, %r9d
	movq	%rbx, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	mat_mult_polly_subfn
	callq	GOMP_parallel_end
	movl	$mat_mult_polly_subfn_1, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$16, %r8d
	movl	$1, %r9d
	movq	%rbx, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	mat_mult_polly_subfn_1
	callq	GOMP_parallel_end
.Ltmp15:
	.loc	1 29 1 prologue_end     # MatrixMult.c:29:1
	addq	$8, %rsp
	popq	%rbx
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
# BB#4:                                 # %init_array.exit
	pushq	%rbp
.Ltmp41:
	.cfi_def_cfa_offset 16
.Ltmp42:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp43:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
.Ltmp44:
	.cfi_offset %rbx, -24
.Ltmp45:
	#DEBUG_VALUE: mat_mult:i <- 0
	leaq	-16(%rbp), %rbx
	.loc	1 52 5                  # MatrixMult.c:52:5
	movl	$mat_mult_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$16, %r8d
	movl	$1, %r9d
	movq	%rbx, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	mat_mult_polly_subfn
	callq	GOMP_parallel_end
	movl	$mat_mult_polly_subfn_1, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$16, %r8d
	movl	$1, %r9d
	movq	%rbx, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	mat_mult_polly_subfn_1
	callq	GOMP_parallel_end
	.loc	1 55 71                 # MatrixMult.c:55:71
	movq	C+2097144(%rip), %rcx
	.loc	1 55 5 is_stmt 0        # MatrixMult.c:55:5
	movl	$.L.str.2, %edi
	movl	$512, %esi              # imm = 0x200
	movl	$512, %edx              # imm = 0x200
	xorl	%eax, %eax
	callq	printf
	.loc	1 56 5 is_stmt 1        # MatrixMult.c:56:5
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Ltmp46:
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc

	.p2align	4, 0x90
	.type	mat_mult_polly_subfn,@function
mat_mult_polly_subfn:                   # @mat_mult_polly_subfn
.Lfunc_begin4:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup.split
	pushq	%r14
.Ltmp47:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp48:
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
.Ltmp49:
	.cfi_def_cfa_offset 48
.Ltmp50:
	.cfi_offset %rbx, -24
.Ltmp51:
	.cfi_offset %r14, -16
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB4_2
# BB#1:
	leaq	16(%rsp), %r14
	leaq	8(%rsp), %rbx
	.p2align	4, 0x90
.LBB4_4:                                # %polly.par.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_6 Depth 2
                                        #       Child Loop BB4_7 Depth 3
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	addq	$-2, %rax
	movq	%rcx, %rdx
	shlq	$17, %rdx
	leaq	C+126976(%rdx), %rdx
	.p2align	4, 0x90
.LBB4_6:                                # %polly.loop_preheader3
                                        #   Parent Loop BB4_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_7 Depth 3
	movq	%rdx, %rsi
	movl	$16, %edi
	xorps	%xmm0, %xmm0
	.p2align	4, 0x90
.LBB4_7:                                # %polly.loop_preheader15
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	%xmm0, -126736(%rsi)
	movaps	%xmm0, -126752(%rsi)
	movaps	%xmm0, -126768(%rsi)
	movaps	%xmm0, -126784(%rsi)
	movaps	%xmm0, -126800(%rsi)
	movaps	%xmm0, -126816(%rsi)
	movaps	%xmm0, -126832(%rsi)
	movaps	%xmm0, -126848(%rsi)
	movaps	%xmm0, -126864(%rsi)
	movaps	%xmm0, -126880(%rsi)
	movaps	%xmm0, -126896(%rsi)
	movaps	%xmm0, -126912(%rsi)
	movaps	%xmm0, -126928(%rsi)
	movaps	%xmm0, -126944(%rsi)
	movaps	%xmm0, -126960(%rsi)
	movaps	%xmm0, -126976(%rsi)
	movaps	%xmm0, -122640(%rsi)
	movaps	%xmm0, -122656(%rsi)
	movaps	%xmm0, -122672(%rsi)
	movaps	%xmm0, -122688(%rsi)
	movaps	%xmm0, -122704(%rsi)
	movaps	%xmm0, -122720(%rsi)
	movaps	%xmm0, -122736(%rsi)
	movaps	%xmm0, -122752(%rsi)
	movaps	%xmm0, -122768(%rsi)
	movaps	%xmm0, -122784(%rsi)
	movaps	%xmm0, -122800(%rsi)
	movaps	%xmm0, -122816(%rsi)
	movaps	%xmm0, -122832(%rsi)
	movaps	%xmm0, -122848(%rsi)
	movaps	%xmm0, -122864(%rsi)
	movaps	%xmm0, -122880(%rsi)
	movaps	%xmm0, -118544(%rsi)
	movaps	%xmm0, -118560(%rsi)
	movaps	%xmm0, -118576(%rsi)
	movaps	%xmm0, -118592(%rsi)
	movaps	%xmm0, -118608(%rsi)
	movaps	%xmm0, -118624(%rsi)
	movaps	%xmm0, -118640(%rsi)
	movaps	%xmm0, -118656(%rsi)
	movaps	%xmm0, -118672(%rsi)
	movaps	%xmm0, -118688(%rsi)
	movaps	%xmm0, -118704(%rsi)
	movaps	%xmm0, -118720(%rsi)
	movaps	%xmm0, -118736(%rsi)
	movaps	%xmm0, -118752(%rsi)
	movaps	%xmm0, -118768(%rsi)
	movaps	%xmm0, -118784(%rsi)
	movaps	%xmm0, -114448(%rsi)
	movaps	%xmm0, -114464(%rsi)
	movaps	%xmm0, -114480(%rsi)
	movaps	%xmm0, -114496(%rsi)
	movaps	%xmm0, -114512(%rsi)
	movaps	%xmm0, -114528(%rsi)
	movaps	%xmm0, -114544(%rsi)
	movaps	%xmm0, -114560(%rsi)
	movaps	%xmm0, -114576(%rsi)
	movaps	%xmm0, -114592(%rsi)
	movaps	%xmm0, -114608(%rsi)
	movaps	%xmm0, -114624(%rsi)
	movaps	%xmm0, -114640(%rsi)
	movaps	%xmm0, -114656(%rsi)
	movaps	%xmm0, -114672(%rsi)
	movaps	%xmm0, -114688(%rsi)
	movaps	%xmm0, -110352(%rsi)
	movaps	%xmm0, -110368(%rsi)
	movaps	%xmm0, -110384(%rsi)
	movaps	%xmm0, -110400(%rsi)
	movaps	%xmm0, -110416(%rsi)
	movaps	%xmm0, -110432(%rsi)
	movaps	%xmm0, -110448(%rsi)
	movaps	%xmm0, -110464(%rsi)
	movaps	%xmm0, -110480(%rsi)
	movaps	%xmm0, -110496(%rsi)
	movaps	%xmm0, -110512(%rsi)
	movaps	%xmm0, -110528(%rsi)
	movaps	%xmm0, -110544(%rsi)
	movaps	%xmm0, -110560(%rsi)
	movaps	%xmm0, -110576(%rsi)
	movaps	%xmm0, -110592(%rsi)
	movaps	%xmm0, -106256(%rsi)
	movaps	%xmm0, -106272(%rsi)
	movaps	%xmm0, -106288(%rsi)
	movaps	%xmm0, -106304(%rsi)
	movaps	%xmm0, -106320(%rsi)
	movaps	%xmm0, -106336(%rsi)
	movaps	%xmm0, -106352(%rsi)
	movaps	%xmm0, -106368(%rsi)
	movaps	%xmm0, -106384(%rsi)
	movaps	%xmm0, -106400(%rsi)
	movaps	%xmm0, -106416(%rsi)
	movaps	%xmm0, -106432(%rsi)
	movaps	%xmm0, -106448(%rsi)
	movaps	%xmm0, -106464(%rsi)
	movaps	%xmm0, -106480(%rsi)
	movaps	%xmm0, -106496(%rsi)
	movaps	%xmm0, -102160(%rsi)
	movaps	%xmm0, -102176(%rsi)
	movaps	%xmm0, -102192(%rsi)
	movaps	%xmm0, -102208(%rsi)
	movaps	%xmm0, -102224(%rsi)
	movaps	%xmm0, -102240(%rsi)
	movaps	%xmm0, -102256(%rsi)
	movaps	%xmm0, -102272(%rsi)
	movaps	%xmm0, -102288(%rsi)
	movaps	%xmm0, -102304(%rsi)
	movaps	%xmm0, -102320(%rsi)
	movaps	%xmm0, -102336(%rsi)
	movaps	%xmm0, -102352(%rsi)
	movaps	%xmm0, -102368(%rsi)
	movaps	%xmm0, -102384(%rsi)
	movaps	%xmm0, -102400(%rsi)
	movaps	%xmm0, -98064(%rsi)
	movaps	%xmm0, -98080(%rsi)
	movaps	%xmm0, -98096(%rsi)
	movaps	%xmm0, -98112(%rsi)
	movaps	%xmm0, -98128(%rsi)
	movaps	%xmm0, -98144(%rsi)
	movaps	%xmm0, -98160(%rsi)
	movaps	%xmm0, -98176(%rsi)
	movaps	%xmm0, -98192(%rsi)
	movaps	%xmm0, -98208(%rsi)
	movaps	%xmm0, -98224(%rsi)
	movaps	%xmm0, -98240(%rsi)
	movaps	%xmm0, -98256(%rsi)
	movaps	%xmm0, -98272(%rsi)
	movaps	%xmm0, -98288(%rsi)
	movaps	%xmm0, -98304(%rsi)
	movaps	%xmm0, -93968(%rsi)
	movaps	%xmm0, -93984(%rsi)
	movaps	%xmm0, -94000(%rsi)
	movaps	%xmm0, -94016(%rsi)
	movaps	%xmm0, -94032(%rsi)
	movaps	%xmm0, -94048(%rsi)
	movaps	%xmm0, -94064(%rsi)
	movaps	%xmm0, -94080(%rsi)
	movaps	%xmm0, -94096(%rsi)
	movaps	%xmm0, -94112(%rsi)
	movaps	%xmm0, -94128(%rsi)
	movaps	%xmm0, -94144(%rsi)
	movaps	%xmm0, -94160(%rsi)
	movaps	%xmm0, -94176(%rsi)
	movaps	%xmm0, -94192(%rsi)
	movaps	%xmm0, -94208(%rsi)
	movaps	%xmm0, -89872(%rsi)
	movaps	%xmm0, -89888(%rsi)
	movaps	%xmm0, -89904(%rsi)
	movaps	%xmm0, -89920(%rsi)
	movaps	%xmm0, -89936(%rsi)
	movaps	%xmm0, -89952(%rsi)
	movaps	%xmm0, -89968(%rsi)
	movaps	%xmm0, -89984(%rsi)
	movaps	%xmm0, -90000(%rsi)
	movaps	%xmm0, -90016(%rsi)
	movaps	%xmm0, -90032(%rsi)
	movaps	%xmm0, -90048(%rsi)
	movaps	%xmm0, -90064(%rsi)
	movaps	%xmm0, -90080(%rsi)
	movaps	%xmm0, -90096(%rsi)
	movaps	%xmm0, -90112(%rsi)
	movaps	%xmm0, -85776(%rsi)
	movaps	%xmm0, -85792(%rsi)
	movaps	%xmm0, -85808(%rsi)
	movaps	%xmm0, -85824(%rsi)
	movaps	%xmm0, -85840(%rsi)
	movaps	%xmm0, -85856(%rsi)
	movaps	%xmm0, -85872(%rsi)
	movaps	%xmm0, -85888(%rsi)
	movaps	%xmm0, -85904(%rsi)
	movaps	%xmm0, -85920(%rsi)
	movaps	%xmm0, -85936(%rsi)
	movaps	%xmm0, -85952(%rsi)
	movaps	%xmm0, -85968(%rsi)
	movaps	%xmm0, -85984(%rsi)
	movaps	%xmm0, -86000(%rsi)
	movaps	%xmm0, -86016(%rsi)
	movaps	%xmm0, -81680(%rsi)
	movaps	%xmm0, -81696(%rsi)
	movaps	%xmm0, -81712(%rsi)
	movaps	%xmm0, -81728(%rsi)
	movaps	%xmm0, -81744(%rsi)
	movaps	%xmm0, -81760(%rsi)
	movaps	%xmm0, -81776(%rsi)
	movaps	%xmm0, -81792(%rsi)
	movaps	%xmm0, -81808(%rsi)
	movaps	%xmm0, -81824(%rsi)
	movaps	%xmm0, -81840(%rsi)
	movaps	%xmm0, -81856(%rsi)
	movaps	%xmm0, -81872(%rsi)
	movaps	%xmm0, -81888(%rsi)
	movaps	%xmm0, -81904(%rsi)
	movaps	%xmm0, -81920(%rsi)
	movaps	%xmm0, -77584(%rsi)
	movaps	%xmm0, -77600(%rsi)
	movaps	%xmm0, -77616(%rsi)
	movaps	%xmm0, -77632(%rsi)
	movaps	%xmm0, -77648(%rsi)
	movaps	%xmm0, -77664(%rsi)
	movaps	%xmm0, -77680(%rsi)
	movaps	%xmm0, -77696(%rsi)
	movaps	%xmm0, -77712(%rsi)
	movaps	%xmm0, -77728(%rsi)
	movaps	%xmm0, -77744(%rsi)
	movaps	%xmm0, -77760(%rsi)
	movaps	%xmm0, -77776(%rsi)
	movaps	%xmm0, -77792(%rsi)
	movaps	%xmm0, -77808(%rsi)
	movaps	%xmm0, -77824(%rsi)
	movaps	%xmm0, -73488(%rsi)
	movaps	%xmm0, -73504(%rsi)
	movaps	%xmm0, -73520(%rsi)
	movaps	%xmm0, -73536(%rsi)
	movaps	%xmm0, -73552(%rsi)
	movaps	%xmm0, -73568(%rsi)
	movaps	%xmm0, -73584(%rsi)
	movaps	%xmm0, -73600(%rsi)
	movaps	%xmm0, -73616(%rsi)
	movaps	%xmm0, -73632(%rsi)
	movaps	%xmm0, -73648(%rsi)
	movaps	%xmm0, -73664(%rsi)
	movaps	%xmm0, -73680(%rsi)
	movaps	%xmm0, -73696(%rsi)
	movaps	%xmm0, -73712(%rsi)
	movaps	%xmm0, -73728(%rsi)
	movaps	%xmm0, -69392(%rsi)
	movaps	%xmm0, -69408(%rsi)
	movaps	%xmm0, -69424(%rsi)
	movaps	%xmm0, -69440(%rsi)
	movaps	%xmm0, -69456(%rsi)
	movaps	%xmm0, -69472(%rsi)
	movaps	%xmm0, -69488(%rsi)
	movaps	%xmm0, -69504(%rsi)
	movaps	%xmm0, -69520(%rsi)
	movaps	%xmm0, -69536(%rsi)
	movaps	%xmm0, -69552(%rsi)
	movaps	%xmm0, -69568(%rsi)
	movaps	%xmm0, -69584(%rsi)
	movaps	%xmm0, -69600(%rsi)
	movaps	%xmm0, -69616(%rsi)
	movaps	%xmm0, -69632(%rsi)
	movaps	%xmm0, -65296(%rsi)
	movaps	%xmm0, -65312(%rsi)
	movaps	%xmm0, -65328(%rsi)
	movaps	%xmm0, -65344(%rsi)
	movaps	%xmm0, -65360(%rsi)
	movaps	%xmm0, -65376(%rsi)
	movaps	%xmm0, -65392(%rsi)
	movaps	%xmm0, -65408(%rsi)
	movaps	%xmm0, -65424(%rsi)
	movaps	%xmm0, -65440(%rsi)
	movaps	%xmm0, -65456(%rsi)
	movaps	%xmm0, -65472(%rsi)
	movaps	%xmm0, -65488(%rsi)
	movaps	%xmm0, -65504(%rsi)
	movaps	%xmm0, -65520(%rsi)
	movaps	%xmm0, -65536(%rsi)
	movaps	%xmm0, -61200(%rsi)
	movaps	%xmm0, -61216(%rsi)
	movaps	%xmm0, -61232(%rsi)
	movaps	%xmm0, -61248(%rsi)
	movaps	%xmm0, -61264(%rsi)
	movaps	%xmm0, -61280(%rsi)
	movaps	%xmm0, -61296(%rsi)
	movaps	%xmm0, -61312(%rsi)
	movaps	%xmm0, -61328(%rsi)
	movaps	%xmm0, -61344(%rsi)
	movaps	%xmm0, -61360(%rsi)
	movaps	%xmm0, -61376(%rsi)
	movaps	%xmm0, -61392(%rsi)
	movaps	%xmm0, -61408(%rsi)
	movaps	%xmm0, -61424(%rsi)
	movaps	%xmm0, -61440(%rsi)
	movaps	%xmm0, -57104(%rsi)
	movaps	%xmm0, -57120(%rsi)
	movaps	%xmm0, -57136(%rsi)
	movaps	%xmm0, -57152(%rsi)
	movaps	%xmm0, -57168(%rsi)
	movaps	%xmm0, -57184(%rsi)
	movaps	%xmm0, -57200(%rsi)
	movaps	%xmm0, -57216(%rsi)
	movaps	%xmm0, -57232(%rsi)
	movaps	%xmm0, -57248(%rsi)
	movaps	%xmm0, -57264(%rsi)
	movaps	%xmm0, -57280(%rsi)
	movaps	%xmm0, -57296(%rsi)
	movaps	%xmm0, -57312(%rsi)
	movaps	%xmm0, -57328(%rsi)
	movaps	%xmm0, -57344(%rsi)
	movaps	%xmm0, -53008(%rsi)
	movaps	%xmm0, -53024(%rsi)
	movaps	%xmm0, -53040(%rsi)
	movaps	%xmm0, -53056(%rsi)
	movaps	%xmm0, -53072(%rsi)
	movaps	%xmm0, -53088(%rsi)
	movaps	%xmm0, -53104(%rsi)
	movaps	%xmm0, -53120(%rsi)
	movaps	%xmm0, -53136(%rsi)
	movaps	%xmm0, -53152(%rsi)
	movaps	%xmm0, -53168(%rsi)
	movaps	%xmm0, -53184(%rsi)
	movaps	%xmm0, -53200(%rsi)
	movaps	%xmm0, -53216(%rsi)
	movaps	%xmm0, -53232(%rsi)
	movaps	%xmm0, -53248(%rsi)
	movaps	%xmm0, -48912(%rsi)
	movaps	%xmm0, -48928(%rsi)
	movaps	%xmm0, -48944(%rsi)
	movaps	%xmm0, -48960(%rsi)
	movaps	%xmm0, -48976(%rsi)
	movaps	%xmm0, -48992(%rsi)
	movaps	%xmm0, -49008(%rsi)
	movaps	%xmm0, -49024(%rsi)
	movaps	%xmm0, -49040(%rsi)
	movaps	%xmm0, -49056(%rsi)
	movaps	%xmm0, -49072(%rsi)
	movaps	%xmm0, -49088(%rsi)
	movaps	%xmm0, -49104(%rsi)
	movaps	%xmm0, -49120(%rsi)
	movaps	%xmm0, -49136(%rsi)
	movaps	%xmm0, -49152(%rsi)
	movaps	%xmm0, -44816(%rsi)
	movaps	%xmm0, -44832(%rsi)
	movaps	%xmm0, -44848(%rsi)
	movaps	%xmm0, -44864(%rsi)
	movaps	%xmm0, -44880(%rsi)
	movaps	%xmm0, -44896(%rsi)
	movaps	%xmm0, -44912(%rsi)
	movaps	%xmm0, -44928(%rsi)
	movaps	%xmm0, -44944(%rsi)
	movaps	%xmm0, -44960(%rsi)
	movaps	%xmm0, -44976(%rsi)
	movaps	%xmm0, -44992(%rsi)
	movaps	%xmm0, -45008(%rsi)
	movaps	%xmm0, -45024(%rsi)
	movaps	%xmm0, -45040(%rsi)
	movaps	%xmm0, -45056(%rsi)
	movaps	%xmm0, -40720(%rsi)
	movaps	%xmm0, -40736(%rsi)
	movaps	%xmm0, -40752(%rsi)
	movaps	%xmm0, -40768(%rsi)
	movaps	%xmm0, -40784(%rsi)
	movaps	%xmm0, -40800(%rsi)
	movaps	%xmm0, -40816(%rsi)
	movaps	%xmm0, -40832(%rsi)
	movaps	%xmm0, -40848(%rsi)
	movaps	%xmm0, -40864(%rsi)
	movaps	%xmm0, -40880(%rsi)
	movaps	%xmm0, -40896(%rsi)
	movaps	%xmm0, -40912(%rsi)
	movaps	%xmm0, -40928(%rsi)
	movaps	%xmm0, -40944(%rsi)
	movaps	%xmm0, -40960(%rsi)
	movaps	%xmm0, -36624(%rsi)
	movaps	%xmm0, -36640(%rsi)
	movaps	%xmm0, -36656(%rsi)
	movaps	%xmm0, -36672(%rsi)
	movaps	%xmm0, -36688(%rsi)
	movaps	%xmm0, -36704(%rsi)
	movaps	%xmm0, -36720(%rsi)
	movaps	%xmm0, -36736(%rsi)
	movaps	%xmm0, -36752(%rsi)
	movaps	%xmm0, -36768(%rsi)
	movaps	%xmm0, -36784(%rsi)
	movaps	%xmm0, -36800(%rsi)
	movaps	%xmm0, -36816(%rsi)
	movaps	%xmm0, -36832(%rsi)
	movaps	%xmm0, -36848(%rsi)
	movaps	%xmm0, -36864(%rsi)
	movaps	%xmm0, -32528(%rsi)
	movaps	%xmm0, -32544(%rsi)
	movaps	%xmm0, -32560(%rsi)
	movaps	%xmm0, -32576(%rsi)
	movaps	%xmm0, -32592(%rsi)
	movaps	%xmm0, -32608(%rsi)
	movaps	%xmm0, -32624(%rsi)
	movaps	%xmm0, -32640(%rsi)
	movaps	%xmm0, -32656(%rsi)
	movaps	%xmm0, -32672(%rsi)
	movaps	%xmm0, -32688(%rsi)
	movaps	%xmm0, -32704(%rsi)
	movaps	%xmm0, -32720(%rsi)
	movaps	%xmm0, -32736(%rsi)
	movaps	%xmm0, -32752(%rsi)
	movaps	%xmm0, -32768(%rsi)
	movaps	%xmm0, -28432(%rsi)
	movaps	%xmm0, -28448(%rsi)
	movaps	%xmm0, -28464(%rsi)
	movaps	%xmm0, -28480(%rsi)
	movaps	%xmm0, -28496(%rsi)
	movaps	%xmm0, -28512(%rsi)
	movaps	%xmm0, -28528(%rsi)
	movaps	%xmm0, -28544(%rsi)
	movaps	%xmm0, -28560(%rsi)
	movaps	%xmm0, -28576(%rsi)
	movaps	%xmm0, -28592(%rsi)
	movaps	%xmm0, -28608(%rsi)
	movaps	%xmm0, -28624(%rsi)
	movaps	%xmm0, -28640(%rsi)
	movaps	%xmm0, -28656(%rsi)
	movaps	%xmm0, -28672(%rsi)
	movaps	%xmm0, -24336(%rsi)
	movaps	%xmm0, -24352(%rsi)
	movaps	%xmm0, -24368(%rsi)
	movaps	%xmm0, -24384(%rsi)
	movaps	%xmm0, -24400(%rsi)
	movaps	%xmm0, -24416(%rsi)
	movaps	%xmm0, -24432(%rsi)
	movaps	%xmm0, -24448(%rsi)
	movaps	%xmm0, -24464(%rsi)
	movaps	%xmm0, -24480(%rsi)
	movaps	%xmm0, -24496(%rsi)
	movaps	%xmm0, -24512(%rsi)
	movaps	%xmm0, -24528(%rsi)
	movaps	%xmm0, -24544(%rsi)
	movaps	%xmm0, -24560(%rsi)
	movaps	%xmm0, -24576(%rsi)
	movaps	%xmm0, -20240(%rsi)
	movaps	%xmm0, -20256(%rsi)
	movaps	%xmm0, -20272(%rsi)
	movaps	%xmm0, -20288(%rsi)
	movaps	%xmm0, -20304(%rsi)
	movaps	%xmm0, -20320(%rsi)
	movaps	%xmm0, -20336(%rsi)
	movaps	%xmm0, -20352(%rsi)
	movaps	%xmm0, -20368(%rsi)
	movaps	%xmm0, -20384(%rsi)
	movaps	%xmm0, -20400(%rsi)
	movaps	%xmm0, -20416(%rsi)
	movaps	%xmm0, -20432(%rsi)
	movaps	%xmm0, -20448(%rsi)
	movaps	%xmm0, -20464(%rsi)
	movaps	%xmm0, -20480(%rsi)
	movaps	%xmm0, -16144(%rsi)
	movaps	%xmm0, -16160(%rsi)
	movaps	%xmm0, -16176(%rsi)
	movaps	%xmm0, -16192(%rsi)
	movaps	%xmm0, -16208(%rsi)
	movaps	%xmm0, -16224(%rsi)
	movaps	%xmm0, -16240(%rsi)
	movaps	%xmm0, -16256(%rsi)
	movaps	%xmm0, -16272(%rsi)
	movaps	%xmm0, -16288(%rsi)
	movaps	%xmm0, -16304(%rsi)
	movaps	%xmm0, -16320(%rsi)
	movaps	%xmm0, -16336(%rsi)
	movaps	%xmm0, -16352(%rsi)
	movaps	%xmm0, -16368(%rsi)
	movaps	%xmm0, -16384(%rsi)
	movaps	%xmm0, -12048(%rsi)
	movaps	%xmm0, -12064(%rsi)
	movaps	%xmm0, -12080(%rsi)
	movaps	%xmm0, -12096(%rsi)
	movaps	%xmm0, -12112(%rsi)
	movaps	%xmm0, -12128(%rsi)
	movaps	%xmm0, -12144(%rsi)
	movaps	%xmm0, -12160(%rsi)
	movaps	%xmm0, -12176(%rsi)
	movaps	%xmm0, -12192(%rsi)
	movaps	%xmm0, -12208(%rsi)
	movaps	%xmm0, -12224(%rsi)
	movaps	%xmm0, -12240(%rsi)
	movaps	%xmm0, -12256(%rsi)
	movaps	%xmm0, -12272(%rsi)
	movaps	%xmm0, -12288(%rsi)
	movaps	%xmm0, -7952(%rsi)
	movaps	%xmm0, -7968(%rsi)
	movaps	%xmm0, -7984(%rsi)
	movaps	%xmm0, -8000(%rsi)
	movaps	%xmm0, -8016(%rsi)
	movaps	%xmm0, -8032(%rsi)
	movaps	%xmm0, -8048(%rsi)
	movaps	%xmm0, -8064(%rsi)
	movaps	%xmm0, -8080(%rsi)
	movaps	%xmm0, -8096(%rsi)
	movaps	%xmm0, -8112(%rsi)
	movaps	%xmm0, -8128(%rsi)
	movaps	%xmm0, -8144(%rsi)
	movaps	%xmm0, -8160(%rsi)
	movaps	%xmm0, -8176(%rsi)
	movaps	%xmm0, -8192(%rsi)
	movaps	%xmm0, -3856(%rsi)
	movaps	%xmm0, -3872(%rsi)
	movaps	%xmm0, -3888(%rsi)
	movaps	%xmm0, -3904(%rsi)
	movaps	%xmm0, -3920(%rsi)
	movaps	%xmm0, -3936(%rsi)
	movaps	%xmm0, -3952(%rsi)
	movaps	%xmm0, -3968(%rsi)
	movaps	%xmm0, -3984(%rsi)
	movaps	%xmm0, -4000(%rsi)
	movaps	%xmm0, -4016(%rsi)
	movaps	%xmm0, -4032(%rsi)
	movaps	%xmm0, -4048(%rsi)
	movaps	%xmm0, -4064(%rsi)
	movaps	%xmm0, -4080(%rsi)
	movaps	%xmm0, -4096(%rsi)
	movaps	%xmm0, 240(%rsi)
	movaps	%xmm0, 224(%rsi)
	movaps	%xmm0, 208(%rsi)
	movaps	%xmm0, 192(%rsi)
	movaps	%xmm0, 176(%rsi)
	movaps	%xmm0, 160(%rsi)
	movaps	%xmm0, 144(%rsi)
	movaps	%xmm0, 128(%rsi)
	movaps	%xmm0, 112(%rsi)
	movaps	%xmm0, 96(%rsi)
	movaps	%xmm0, 80(%rsi)
	movaps	%xmm0, 64(%rsi)
	movaps	%xmm0, 48(%rsi)
	movaps	%xmm0, 32(%rsi)
	movaps	%xmm0, 16(%rsi)
	movaps	%xmm0, (%rsi)
	addq	$256, %rsi              # imm = 0x100
	decq	%rdi
	jne	.LBB4_7
# BB#5:                                 # %polly.loop_exit4
                                        #   in Loop: Header=BB4_6 Depth=2
	addq	$131072, %rdx           # imm = 0x20000
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB4_6
# BB#3:                                 # %polly.par.checkNext.loopexit
                                        #   in Loop: Header=BB4_4 Depth=1
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB4_4
.LBB4_2:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end4:
	.size	mat_mult_polly_subfn, .Lfunc_end4-mat_mult_polly_subfn
	.cfi_endproc

	.p2align	4, 0x90
	.type	mat_mult_polly_subfn_1,@function
mat_mult_polly_subfn_1:                 # @mat_mult_polly_subfn_1
.Lfunc_begin5:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup.split
	pushq	%rbp
.Ltmp52:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp53:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp54:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp55:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp56:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp57:
	.cfi_def_cfa_offset 56
	subq	$72, %rsp
.Ltmp58:
	.cfi_def_cfa_offset 128
.Ltmp59:
	.cfi_offset %rbx, -56
.Ltmp60:
	.cfi_offset %r12, -48
.Ltmp61:
	.cfi_offset %r13, -40
.Ltmp62:
	.cfi_offset %r14, -32
.Ltmp63:
	.cfi_offset %r15, -24
.Ltmp64:
	.cfi_offset %rbp, -16
	jmp	.LBB5_1
	.p2align	4, 0x90
.LBB5_2:                                # %polly.par.loadIVBounds
                                        #   in Loop: Header=BB5_1 Depth=1
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	addq	$-2, %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	%rcx, %rax
	shlq	$17, %rax
	leaq	A(%rax), %rax
	movq	%rax, (%rsp)            # 8-byte Spill
	.p2align	4, 0x90
.LBB5_5:                                # %polly.loop_preheader3
                                        #   Parent Loop BB5_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_6 Depth 3
                                        #         Child Loop BB5_9 Depth 4
                                        #           Child Loop BB5_10 Depth 5
                                        #             Child Loop BB5_13 Depth 6
                                        #               Child Loop BB5_11 Depth 7
	movq	%rcx, 32(%rsp)          # 8-byte Spill
	movq	%rcx, %rsi
	shlq	$5, %rsi
	movl	$B, %eax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB5_6:                                # %polly.loop_preheader9
                                        #   Parent Loop BB5_1 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_9 Depth 4
                                        #           Child Loop BB5_10 Depth 5
                                        #             Child Loop BB5_13 Depth 6
                                        #               Child Loop BB5_11 Depth 7
	movq	%rcx, 40(%rsp)          # 8-byte Spill
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	%rcx, %rbx
	shlq	$5, %rbx
	movq	(%rsp), %r10            # 8-byte Reload
	movq	%rax, %rdx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB5_9:                                # %polly.loop_preheader15
                                        #   Parent Loop BB5_1 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_6 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB5_10 Depth 5
                                        #             Child Loop BB5_13 Depth 6
                                        #               Child Loop BB5_11 Depth 7
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	%r10, 64(%rsp)          # 8-byte Spill
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB5_10:                               # %polly.loop_preheader21
                                        #   Parent Loop BB5_1 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_6 Depth=3
                                        #         Parent Loop BB5_9 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB5_13 Depth 6
                                        #               Child Loop BB5_11 Depth 7
	leaq	(%rcx,%rsi), %rdi
	movq	%rdx, %r11
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB5_13:                               # %polly.loop_preheader27
                                        #   Parent Loop BB5_1 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_6 Depth=3
                                        #         Parent Loop BB5_9 Depth=4
                                        #           Parent Loop BB5_10 Depth=5
                                        # =>          This Loop Header: Depth=6
                                        #               Child Loop BB5_11 Depth 7
	leaq	(%r15,%rbx), %rax
	movq	%rdi, %rbp
	shlq	$12, %rbp
	leaq	C(%rbp,%rax,8), %r8
	movq	C(%rbp,%rax,8), %r9
	movq	%r10, %rax
	movq	%r11, %r14
	movl	$32, %r12d
	.p2align	4, 0x90
.LBB5_11:                               # %polly.loop_header26
                                        #   Parent Loop BB5_1 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        #       Parent Loop BB5_6 Depth=3
                                        #         Parent Loop BB5_9 Depth=4
                                        #           Parent Loop BB5_10 Depth=5
                                        #             Parent Loop BB5_13 Depth=6
                                        # =>            This Inner Loop Header: Depth=7
	movq	(%r14), %r13
	.loc	1 25 45                 # MatrixMult.c:25:45
	imulq	(%rax), %r13
	.loc	1 25 35 is_stmt 0       # MatrixMult.c:25:35
	addq	%r13, %r9
	addq	$4096, %r14             # imm = 0x1000
	addq	$8, %rax
	decq	%r12
	jne	.LBB5_11
# BB#12:                                # %polly.loop_exit28
                                        #   in Loop: Header=BB5_13 Depth=6
	movq	%r9, (%r8)
	incq	%r15
	addq	$8, %r11
	cmpq	$32, %r15
	jne	.LBB5_13
# BB#7:                                 # %polly.loop_exit22
                                        #   in Loop: Header=BB5_10 Depth=5
	incq	%rcx
	addq	$4096, %r10             # imm = 0x1000
	cmpq	$32, %rcx
	jne	.LBB5_10
# BB#8:                                 # %polly.loop_exit16
                                        #   in Loop: Header=BB5_9 Depth=4
	movq	56(%rsp), %rax          # 8-byte Reload
	incq	%rax
	addq	$131072, %rdx           # imm = 0x20000
	movq	64(%rsp), %r10          # 8-byte Reload
	addq	$256, %r10              # imm = 0x100
	cmpq	$16, %rax
	jne	.LBB5_9
# BB#3:                                 # %polly.loop_exit10
                                        #   in Loop: Header=BB5_6 Depth=3
	movq	40(%rsp), %rcx          # 8-byte Reload
	incq	%rcx
	movq	48(%rsp), %rax          # 8-byte Reload
	addq	$256, %rax              # imm = 0x100
	cmpq	$16, %rcx
	jne	.LBB5_6
# BB#4:                                 # %polly.loop_exit4
                                        #   in Loop: Header=BB5_5 Depth=2
	addq	$131072, (%rsp)         # 8-byte Folded Spill
                                        # imm = 0x20000
	movq	32(%rsp), %rcx          # 8-byte Reload
	cmpq	24(%rsp), %rcx          # 8-byte Folded Reload
	leaq	1(%rcx), %rcx
	jle	.LBB5_5
.LBB5_1:                                # %polly.par.setup.split
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_5 Depth 2
                                        #       Child Loop BB5_6 Depth 3
                                        #         Child Loop BB5_9 Depth 4
                                        #           Child Loop BB5_10 Depth 5
                                        #             Child Loop BB5_13 Depth 6
                                        #               Child Loop BB5_11 Depth 7
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB5_2
# BB#14:                                # %polly.par.exit
	callq	GOMP_loop_end_nowait
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end5:
	.size	mat_mult_polly_subfn_1, .Lfunc_end5-mat_mult_polly_subfn_1
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
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	262                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0xff DW_TAG_compile_unit
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
	.long	213                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x9e:0x22 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
                                        # DW_AT_external
	.byte	9                       # Abbrev [9] 0xb3:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	20                      # DW_AT_decl_line
	.long	258                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	10                      # Abbrev [10] 0xc0:0x15 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
                                        # DW_AT_external
	.byte	11                      # Abbrev [11] 0xd5:0x8 DW_TAG_subprogram
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	12                      # Abbrev [12] 0xdd:0x25 DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
	.long	258                     # DW_AT_type
                                        # DW_AT_external
	.byte	13                      # Abbrev [13] 0xf6:0xb DW_TAG_inlined_subroutine
	.long	213                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	51                      # DW_AT_call_line
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x102:0x7 DW_TAG_base_type
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
	.long	266                     # Compilation Unit Length
	.long	42                      # DIE offset
	.asciz	"A"                     # External Name
	.long	97                      # DIE offset
	.asciz	"B"                     # External Name
	.long	118                     # DIE offset
	.asciz	"C"                     # External Name
	.long	158                     # DIE offset
	.asciz	"mat_mult"              # External Name
	.long	213                     # DIE offset
	.asciz	"init_array"            # External Name
	.long	221                     # DIE offset
	.asciz	"main"                  # External Name
	.long	192                     # DIE offset
	.asciz	"print_array"           # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	266                     # Compilation Unit Length
	.long	83                      # DIE offset
	.asciz	"long long int"         # External Name
	.long	258                     # DIE offset
	.asciz	"int"                   # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
