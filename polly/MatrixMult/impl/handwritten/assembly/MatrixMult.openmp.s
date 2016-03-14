	.text
	.file	"MatrixMult.openmp.ll"
	.file	1 "MatrixMult.c"
	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
.Lfunc_begin0:
	.loc	1 9 0                   # MatrixMult.c:9:0
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
	xorl	%r14d, %r14d
.Ltmp9:
	.loc	1 14 22 prologue_end    # MatrixMult.c:14:22
	xorl	%edi, %edi
	callq	time
	.loc	1 14 5 is_stmt 0 discriminator 1 # MatrixMult.c:14:5
	movl	%eax, %edi
	callq	srand
	movl	$R, %r15d
.Ltmp10:
	#DEBUG_VALUE: init:i <- 0
	.p2align	4, 0x90
.LBB0_1:                                # %for.cond2.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	movq	%r15, %rbx
	movl	$512, %r12d             # imm = 0x200
	.p2align	4, 0x90
.LBB0_2:                                # %for.body5
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp11:
	.loc	1 18 23 is_stmt 1       # MatrixMult.c:18:23
	callq	rand
	.loc	1 18 29 is_stmt 0       # MatrixMult.c:18:29
	cltq
	imulq	$1374389535, %rax, %rcx # imm = 0x51EB851F
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	imull	$100, %ecx, %ecx
	subl	%ecx, %eax
	.loc	1 18 21                 # MatrixMult.c:18:21
	movl	%eax, (%rbx)
.Ltmp12:
	.loc	1 16 9 is_stmt 1 discriminator 1 # MatrixMult.c:16:9
	addq	$4, %rbx
	decq	%r12
	jne	.LBB0_2
.Ltmp13:
# BB#3:                                 # %for.inc9
                                        #   in Loop: Header=BB0_1 Depth=1
	.loc	1 15 5 discriminator 1  # MatrixMult.c:15:5
	incq	%r14
	addq	$2048, %r15             # imm = 0x800
	cmpq	$512, %r14              # imm = 0x200
	jne	.LBB0_1
.Ltmp14:
# BB#4:                                 # %polly.parallel.for
	leaq	(%rsp), %rbx
	movl	$init_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$16, %r8d
	movl	$1, %r9d
	movq	%rbx, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	init_polly_subfn
	callq	GOMP_parallel_end
	.loc	1 28 1                  # MatrixMult.c:28:1
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Ltmp15:
.Lfunc_end0:
	.size	init, .Lfunc_end0-init
	.cfi_endproc

	.globl	mat_mult
	.p2align	4, 0x90
	.type	mat_mult,@function
mat_mult:                               # @mat_mult
.Lfunc_begin1:
	.loc	1 30 0                  # MatrixMult.c:30:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp16:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp17:
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
.Ltmp18:
	.cfi_def_cfa_offset 48
.Ltmp19:
	.cfi_offset %rbx, -24
.Ltmp20:
	.cfi_offset %r14, -16
.Ltmp21:
	#DEBUG_VALUE: mat_mult:i <- 0
	leaq	(%rsp), %rsi
	movl	$mat_mult_polly_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$16, %r8d
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB1_7
# BB#1:
	leaq	16(%rsp), %r14
	leaq	8(%rsp), %rbx
	.p2align	4, 0x90
.LBB1_3:                                # %polly.par.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_5 Depth 2
                                        #       Child Loop BB1_6 Depth 3
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	addq	$-2, %rax
	movq	%rcx, %rdx
	shlq	$16, %rdx
	leaq	C+63488(%rdx), %rdx
	.p2align	4, 0x90
.LBB1_5:                                # %polly.loop_preheader3.i
                                        #   Parent Loop BB1_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_6 Depth 3
	movq	%rdx, %rsi
	movl	$16, %edi
	xorps	%xmm0, %xmm0
	.p2align	4, 0x90
.LBB1_6:                                # %polly.loop_preheader9.i
                                        #   Parent Loop BB1_3 Depth=1
                                        #     Parent Loop BB1_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	%xmm0, -63376(%rsi)
	movaps	%xmm0, -63392(%rsi)
	movaps	%xmm0, -63408(%rsi)
	movaps	%xmm0, -63424(%rsi)
	movaps	%xmm0, -63440(%rsi)
	movaps	%xmm0, -63456(%rsi)
	movaps	%xmm0, -63472(%rsi)
	movaps	%xmm0, -63488(%rsi)
	movaps	%xmm0, -61328(%rsi)
	movaps	%xmm0, -61344(%rsi)
	movaps	%xmm0, -61360(%rsi)
	movaps	%xmm0, -61376(%rsi)
	movaps	%xmm0, -61392(%rsi)
	movaps	%xmm0, -61408(%rsi)
	movaps	%xmm0, -61424(%rsi)
	movaps	%xmm0, -61440(%rsi)
	movaps	%xmm0, -59280(%rsi)
	movaps	%xmm0, -59296(%rsi)
	movaps	%xmm0, -59312(%rsi)
	movaps	%xmm0, -59328(%rsi)
	movaps	%xmm0, -59344(%rsi)
	movaps	%xmm0, -59360(%rsi)
	movaps	%xmm0, -59376(%rsi)
	movaps	%xmm0, -59392(%rsi)
	movaps	%xmm0, -57232(%rsi)
	movaps	%xmm0, -57248(%rsi)
	movaps	%xmm0, -57264(%rsi)
	movaps	%xmm0, -57280(%rsi)
	movaps	%xmm0, -57296(%rsi)
	movaps	%xmm0, -57312(%rsi)
	movaps	%xmm0, -57328(%rsi)
	movaps	%xmm0, -57344(%rsi)
	movaps	%xmm0, -55184(%rsi)
	movaps	%xmm0, -55200(%rsi)
	movaps	%xmm0, -55216(%rsi)
	movaps	%xmm0, -55232(%rsi)
	movaps	%xmm0, -55248(%rsi)
	movaps	%xmm0, -55264(%rsi)
	movaps	%xmm0, -55280(%rsi)
	movaps	%xmm0, -55296(%rsi)
	movaps	%xmm0, -53136(%rsi)
	movaps	%xmm0, -53152(%rsi)
	movaps	%xmm0, -53168(%rsi)
	movaps	%xmm0, -53184(%rsi)
	movaps	%xmm0, -53200(%rsi)
	movaps	%xmm0, -53216(%rsi)
	movaps	%xmm0, -53232(%rsi)
	movaps	%xmm0, -53248(%rsi)
	movaps	%xmm0, -51088(%rsi)
	movaps	%xmm0, -51104(%rsi)
	movaps	%xmm0, -51120(%rsi)
	movaps	%xmm0, -51136(%rsi)
	movaps	%xmm0, -51152(%rsi)
	movaps	%xmm0, -51168(%rsi)
	movaps	%xmm0, -51184(%rsi)
	movaps	%xmm0, -51200(%rsi)
	movaps	%xmm0, -49040(%rsi)
	movaps	%xmm0, -49056(%rsi)
	movaps	%xmm0, -49072(%rsi)
	movaps	%xmm0, -49088(%rsi)
	movaps	%xmm0, -49104(%rsi)
	movaps	%xmm0, -49120(%rsi)
	movaps	%xmm0, -49136(%rsi)
	movaps	%xmm0, -49152(%rsi)
	movaps	%xmm0, -46992(%rsi)
	movaps	%xmm0, -47008(%rsi)
	movaps	%xmm0, -47024(%rsi)
	movaps	%xmm0, -47040(%rsi)
	movaps	%xmm0, -47056(%rsi)
	movaps	%xmm0, -47072(%rsi)
	movaps	%xmm0, -47088(%rsi)
	movaps	%xmm0, -47104(%rsi)
	movaps	%xmm0, -44944(%rsi)
	movaps	%xmm0, -44960(%rsi)
	movaps	%xmm0, -44976(%rsi)
	movaps	%xmm0, -44992(%rsi)
	movaps	%xmm0, -45008(%rsi)
	movaps	%xmm0, -45024(%rsi)
	movaps	%xmm0, -45040(%rsi)
	movaps	%xmm0, -45056(%rsi)
	movaps	%xmm0, -42896(%rsi)
	movaps	%xmm0, -42912(%rsi)
	movaps	%xmm0, -42928(%rsi)
	movaps	%xmm0, -42944(%rsi)
	movaps	%xmm0, -42960(%rsi)
	movaps	%xmm0, -42976(%rsi)
	movaps	%xmm0, -42992(%rsi)
	movaps	%xmm0, -43008(%rsi)
	movaps	%xmm0, -40848(%rsi)
	movaps	%xmm0, -40864(%rsi)
	movaps	%xmm0, -40880(%rsi)
	movaps	%xmm0, -40896(%rsi)
	movaps	%xmm0, -40912(%rsi)
	movaps	%xmm0, -40928(%rsi)
	movaps	%xmm0, -40944(%rsi)
	movaps	%xmm0, -40960(%rsi)
	movaps	%xmm0, -38800(%rsi)
	movaps	%xmm0, -38816(%rsi)
	movaps	%xmm0, -38832(%rsi)
	movaps	%xmm0, -38848(%rsi)
	movaps	%xmm0, -38864(%rsi)
	movaps	%xmm0, -38880(%rsi)
	movaps	%xmm0, -38896(%rsi)
	movaps	%xmm0, -38912(%rsi)
	movaps	%xmm0, -36752(%rsi)
	movaps	%xmm0, -36768(%rsi)
	movaps	%xmm0, -36784(%rsi)
	movaps	%xmm0, -36800(%rsi)
	movaps	%xmm0, -36816(%rsi)
	movaps	%xmm0, -36832(%rsi)
	movaps	%xmm0, -36848(%rsi)
	movaps	%xmm0, -36864(%rsi)
	movaps	%xmm0, -34704(%rsi)
	movaps	%xmm0, -34720(%rsi)
	movaps	%xmm0, -34736(%rsi)
	movaps	%xmm0, -34752(%rsi)
	movaps	%xmm0, -34768(%rsi)
	movaps	%xmm0, -34784(%rsi)
	movaps	%xmm0, -34800(%rsi)
	movaps	%xmm0, -34816(%rsi)
	movaps	%xmm0, -32656(%rsi)
	movaps	%xmm0, -32672(%rsi)
	movaps	%xmm0, -32688(%rsi)
	movaps	%xmm0, -32704(%rsi)
	movaps	%xmm0, -32720(%rsi)
	movaps	%xmm0, -32736(%rsi)
	movaps	%xmm0, -32752(%rsi)
	movaps	%xmm0, -32768(%rsi)
	movaps	%xmm0, -30608(%rsi)
	movaps	%xmm0, -30624(%rsi)
	movaps	%xmm0, -30640(%rsi)
	movaps	%xmm0, -30656(%rsi)
	movaps	%xmm0, -30672(%rsi)
	movaps	%xmm0, -30688(%rsi)
	movaps	%xmm0, -30704(%rsi)
	movaps	%xmm0, -30720(%rsi)
	movaps	%xmm0, -28560(%rsi)
	movaps	%xmm0, -28576(%rsi)
	movaps	%xmm0, -28592(%rsi)
	movaps	%xmm0, -28608(%rsi)
	movaps	%xmm0, -28624(%rsi)
	movaps	%xmm0, -28640(%rsi)
	movaps	%xmm0, -28656(%rsi)
	movaps	%xmm0, -28672(%rsi)
	movaps	%xmm0, -26512(%rsi)
	movaps	%xmm0, -26528(%rsi)
	movaps	%xmm0, -26544(%rsi)
	movaps	%xmm0, -26560(%rsi)
	movaps	%xmm0, -26576(%rsi)
	movaps	%xmm0, -26592(%rsi)
	movaps	%xmm0, -26608(%rsi)
	movaps	%xmm0, -26624(%rsi)
	movaps	%xmm0, -24464(%rsi)
	movaps	%xmm0, -24480(%rsi)
	movaps	%xmm0, -24496(%rsi)
	movaps	%xmm0, -24512(%rsi)
	movaps	%xmm0, -24528(%rsi)
	movaps	%xmm0, -24544(%rsi)
	movaps	%xmm0, -24560(%rsi)
	movaps	%xmm0, -24576(%rsi)
	movaps	%xmm0, -22416(%rsi)
	movaps	%xmm0, -22432(%rsi)
	movaps	%xmm0, -22448(%rsi)
	movaps	%xmm0, -22464(%rsi)
	movaps	%xmm0, -22480(%rsi)
	movaps	%xmm0, -22496(%rsi)
	movaps	%xmm0, -22512(%rsi)
	movaps	%xmm0, -22528(%rsi)
	movaps	%xmm0, -20368(%rsi)
	movaps	%xmm0, -20384(%rsi)
	movaps	%xmm0, -20400(%rsi)
	movaps	%xmm0, -20416(%rsi)
	movaps	%xmm0, -20432(%rsi)
	movaps	%xmm0, -20448(%rsi)
	movaps	%xmm0, -20464(%rsi)
	movaps	%xmm0, -20480(%rsi)
	movaps	%xmm0, -18320(%rsi)
	movaps	%xmm0, -18336(%rsi)
	movaps	%xmm0, -18352(%rsi)
	movaps	%xmm0, -18368(%rsi)
	movaps	%xmm0, -18384(%rsi)
	movaps	%xmm0, -18400(%rsi)
	movaps	%xmm0, -18416(%rsi)
	movaps	%xmm0, -18432(%rsi)
	movaps	%xmm0, -16272(%rsi)
	movaps	%xmm0, -16288(%rsi)
	movaps	%xmm0, -16304(%rsi)
	movaps	%xmm0, -16320(%rsi)
	movaps	%xmm0, -16336(%rsi)
	movaps	%xmm0, -16352(%rsi)
	movaps	%xmm0, -16368(%rsi)
	movaps	%xmm0, -16384(%rsi)
	movaps	%xmm0, -14224(%rsi)
	movaps	%xmm0, -14240(%rsi)
	movaps	%xmm0, -14256(%rsi)
	movaps	%xmm0, -14272(%rsi)
	movaps	%xmm0, -14288(%rsi)
	movaps	%xmm0, -14304(%rsi)
	movaps	%xmm0, -14320(%rsi)
	movaps	%xmm0, -14336(%rsi)
	movaps	%xmm0, -12176(%rsi)
	movaps	%xmm0, -12192(%rsi)
	movaps	%xmm0, -12208(%rsi)
	movaps	%xmm0, -12224(%rsi)
	movaps	%xmm0, -12240(%rsi)
	movaps	%xmm0, -12256(%rsi)
	movaps	%xmm0, -12272(%rsi)
	movaps	%xmm0, -12288(%rsi)
	movaps	%xmm0, -10128(%rsi)
	movaps	%xmm0, -10144(%rsi)
	movaps	%xmm0, -10160(%rsi)
	movaps	%xmm0, -10176(%rsi)
	movaps	%xmm0, -10192(%rsi)
	movaps	%xmm0, -10208(%rsi)
	movaps	%xmm0, -10224(%rsi)
	movaps	%xmm0, -10240(%rsi)
	movaps	%xmm0, -8080(%rsi)
	movaps	%xmm0, -8096(%rsi)
	movaps	%xmm0, -8112(%rsi)
	movaps	%xmm0, -8128(%rsi)
	movaps	%xmm0, -8144(%rsi)
	movaps	%xmm0, -8160(%rsi)
	movaps	%xmm0, -8176(%rsi)
	movaps	%xmm0, -8192(%rsi)
	movaps	%xmm0, -6032(%rsi)
	movaps	%xmm0, -6048(%rsi)
	movaps	%xmm0, -6064(%rsi)
	movaps	%xmm0, -6080(%rsi)
	movaps	%xmm0, -6096(%rsi)
	movaps	%xmm0, -6112(%rsi)
	movaps	%xmm0, -6128(%rsi)
	movaps	%xmm0, -6144(%rsi)
	movaps	%xmm0, -3984(%rsi)
	movaps	%xmm0, -4000(%rsi)
	movaps	%xmm0, -4016(%rsi)
	movaps	%xmm0, -4032(%rsi)
	movaps	%xmm0, -4048(%rsi)
	movaps	%xmm0, -4064(%rsi)
	movaps	%xmm0, -4080(%rsi)
	movaps	%xmm0, -4096(%rsi)
	movaps	%xmm0, -1936(%rsi)
	movaps	%xmm0, -1952(%rsi)
	movaps	%xmm0, -1968(%rsi)
	movaps	%xmm0, -1984(%rsi)
	movaps	%xmm0, -2000(%rsi)
	movaps	%xmm0, -2016(%rsi)
	movaps	%xmm0, -2032(%rsi)
	movaps	%xmm0, -2048(%rsi)
	movaps	%xmm0, 112(%rsi)
	movaps	%xmm0, 96(%rsi)
	movaps	%xmm0, 80(%rsi)
	movaps	%xmm0, 64(%rsi)
	movaps	%xmm0, 48(%rsi)
	movaps	%xmm0, 32(%rsi)
	movaps	%xmm0, 16(%rsi)
	movaps	%xmm0, (%rsi)
	subq	$-128, %rsi
	decq	%rdi
	jne	.LBB1_6
# BB#4:                                 # %polly.loop_exit4.i
                                        #   in Loop: Header=BB1_5 Depth=2
	addq	$65536, %rdx            # imm = 0x10000
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	jle	.LBB1_5
# BB#2:                                 # %polly.par.checkNext.loopexit.i
                                        #   in Loop: Header=BB1_3 Depth=1
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB1_3
.LBB1_7:                                # %mat_mult_polly_subfn.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	leaq	(%rsp), %rbx
	movl	$mat_mult_polly_subfn_2, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$16, %r8d
	movl	$1, %r9d
	movq	%rbx, %rsi
	callq	GOMP_parallel_loop_runtime_start
	movq	%rbx, %rdi
	callq	mat_mult_polly_subfn_2
	callq	GOMP_parallel_end
.Ltmp22:
	.loc	1 40 1 prologue_end     # MatrixMult.c:40:1
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	retq
.Ltmp23:
.Lfunc_end1:
	.size	mat_mult, .Lfunc_end1-mat_mult
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin2:
	.loc	1 56 0                  # MatrixMult.c:56:0
	.cfi_startproc
# BB#0:                                 # %entry
	.loc	1 57 5 prologue_end     # MatrixMult.c:57:5
	subq	$40, %rsp
.Ltmp24:
	.cfi_def_cfa_offset 48
	callq	init
	.loc	1 58 5                  # MatrixMult.c:58:5
	callq	mat_mult
	.loc	1 60 5                  # MatrixMult.c:60:5
	movl	$.L.str, %edi
	movl	$512, %esi              # imm = 0x200
	movl	$512, %edx              # imm = 0x200
	xorl	%eax, %eax
	callq	printf
	.loc	1 62 19                 # MatrixMult.c:62:19
	movl	A+1048572(%rip), %ecx
	.loc	1 63 19                 # MatrixMult.c:63:19
	movl	B+1048572(%rip), %eax
	.loc	1 64 19                 # MatrixMult.c:64:19
	movl	C+1048572(%rip), %edx
	.loc	1 61 5                  # MatrixMult.c:61:5
	movl	%edx, 24(%rsp)
	movl	%eax, (%rsp)
	movl	$511, 16(%rsp)          # imm = 0x1FF
	movl	$511, 8(%rsp)           # imm = 0x1FF
	movl	$.L.str.1, %edi
	movl	$511, %esi              # imm = 0x1FF
	movl	$511, %edx              # imm = 0x1FF
	movl	$511, %r8d              # imm = 0x1FF
	movl	$511, %r9d              # imm = 0x1FF
	xorl	%eax, %eax
	callq	printf
	.loc	1 65 5                  # MatrixMult.c:65:5
	xorl	%eax, %eax
	addq	$40, %rsp
	retq
.Ltmp25:
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc

	.p2align	4, 0x90
	.type	init_polly_subfn,@function
init_polly_subfn:                       # @init_polly_subfn
.Lfunc_begin3:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Ltmp26:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp27:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp28:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp29:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp30:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp31:
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
.Ltmp32:
	.cfi_def_cfa_offset 80
.Ltmp33:
	.cfi_offset %rbx, -56
.Ltmp34:
	.cfi_offset %r12, -48
.Ltmp35:
	.cfi_offset %r13, -40
.Ltmp36:
	.cfi_offset %r14, -32
.Ltmp37:
	.cfi_offset %r15, -24
.Ltmp38:
	.cfi_offset %rbp, -16
	jmp	.LBB3_1
	.p2align	4, 0x90
.LBB3_2:                                # %polly.par.loadIVBounds
                                        #   in Loop: Header=BB3_1 Depth=1
	movq	8(%rsp), %r8
	movq	16(%rsp), %r9
	addq	$-2, %r8
	movq	%r9, %r10
	shlq	$16, %r10
	xorl	%r11d, %r11d
	movq	%r9, %r12
	.p2align	4, 0x90
.LBB3_5:                                # %polly.loop_preheader3
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_6 Depth 3
                                        #         Child Loop BB3_9 Depth 4
                                        #           Child Loop BB3_7 Depth 5
	leaq	(%r9,%r11), %rbx
	shlq	$5, %rbx
	movq	%r10, %r13
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB3_6:                                # %polly.loop_preheader9
                                        #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB3_9 Depth 4
                                        #           Child Loop BB3_7 Depth 5
	movq	%r15, %rcx
	shlq	$5, %rcx
	movq	%r13, %rax
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB3_9:                                # %polly.loop_preheader15
                                        #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        #       Parent Loop BB3_6 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB3_7 Depth 5
	leaq	(%rbx,%rdi), %rdx
	shlq	$11, %rdx
	movaps	R+112(%rdx,%rcx,4), %xmm0
	movaps	%xmm0, A+112(%rdx,%rcx,4)
	movaps	R+96(%rdx,%rcx,4), %xmm0
	movaps	%xmm0, A+96(%rdx,%rcx,4)
	movaps	R+80(%rdx,%rcx,4), %xmm0
	movaps	%xmm0, A+80(%rdx,%rcx,4)
	movaps	R+64(%rdx,%rcx,4), %xmm0
	movaps	%xmm0, A+64(%rdx,%rcx,4)
	movaps	R+48(%rdx,%rcx,4), %xmm0
	movaps	%xmm0, A+48(%rdx,%rcx,4)
	movaps	R+32(%rdx,%rcx,4), %xmm0
	movaps	%xmm0, A+32(%rdx,%rcx,4)
	movaps	R+16(%rdx,%rcx,4), %xmm0
	movaps	%xmm0, A+16(%rdx,%rcx,4)
	movaps	R(%rdx,%rcx,4), %xmm0
	movaps	%xmm0, A(%rdx,%rcx,4)
	movq	%rax, %rsi
	movl	$32, %ebp
	.p2align	4, 0x90
.LBB3_7:                                # %polly.loop_header14
                                        #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_5 Depth=2
                                        #       Parent Loop BB3_6 Depth=3
                                        #         Parent Loop BB3_9 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	.loc	1 25 27                 # MatrixMult.c:25:27
	movl	$100, %r14d
	subl	R(%rsi), %r14d
	movl	%r14d, B(%rsi)
	movl	$100, %edx
	subl	R+4(%rsi), %edx
	movl	%edx, B+4(%rsi)
	addq	$8, %rsi
	addq	$-2, %rbp
	jne	.LBB3_7
# BB#8:                                 # %polly.loop_exit16
                                        #   in Loop: Header=BB3_9 Depth=4
	incq	%rdi
	addq	$2048, %rax             # imm = 0x800
	cmpq	$32, %rdi
	jne	.LBB3_9
# BB#3:                                 # %polly.loop_exit10
                                        #   in Loop: Header=BB3_6 Depth=3
	incq	%r15
	subq	$-128, %r13
	cmpq	$16, %r15
	jne	.LBB3_6
# BB#4:                                 # %polly.loop_exit4
                                        #   in Loop: Header=BB3_5 Depth=2
	incq	%r11
	addq	$65536, %r10            # imm = 0x10000
	cmpq	%r8, %r12
	leaq	1(%r12), %r12
	jle	.LBB3_5
.LBB3_1:                                # %polly.par.setup
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_5 Depth 2
                                        #       Child Loop BB3_6 Depth 3
                                        #         Child Loop BB3_9 Depth 4
                                        #           Child Loop BB3_7 Depth 5
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB3_2
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
.Lfunc_end3:
	.size	init_polly_subfn, .Lfunc_end3-init_polly_subfn
	.cfi_endproc

	.p2align	4, 0x90
	.type	mat_mult_polly_subfn,@function
mat_mult_polly_subfn:                   # @mat_mult_polly_subfn
.Lfunc_begin4:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%r14
.Ltmp39:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp40:
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
.Ltmp41:
	.cfi_def_cfa_offset 48
.Ltmp42:
	.cfi_offset %rbx, -24
.Ltmp43:
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
	shlq	$16, %rdx
	leaq	C+63488(%rdx), %rdx
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
	movaps	%xmm0, -63376(%rsi)
	movaps	%xmm0, -63392(%rsi)
	movaps	%xmm0, -63408(%rsi)
	movaps	%xmm0, -63424(%rsi)
	movaps	%xmm0, -63440(%rsi)
	movaps	%xmm0, -63456(%rsi)
	movaps	%xmm0, -63472(%rsi)
	movaps	%xmm0, -63488(%rsi)
	movaps	%xmm0, -61328(%rsi)
	movaps	%xmm0, -61344(%rsi)
	movaps	%xmm0, -61360(%rsi)
	movaps	%xmm0, -61376(%rsi)
	movaps	%xmm0, -61392(%rsi)
	movaps	%xmm0, -61408(%rsi)
	movaps	%xmm0, -61424(%rsi)
	movaps	%xmm0, -61440(%rsi)
	movaps	%xmm0, -59280(%rsi)
	movaps	%xmm0, -59296(%rsi)
	movaps	%xmm0, -59312(%rsi)
	movaps	%xmm0, -59328(%rsi)
	movaps	%xmm0, -59344(%rsi)
	movaps	%xmm0, -59360(%rsi)
	movaps	%xmm0, -59376(%rsi)
	movaps	%xmm0, -59392(%rsi)
	movaps	%xmm0, -57232(%rsi)
	movaps	%xmm0, -57248(%rsi)
	movaps	%xmm0, -57264(%rsi)
	movaps	%xmm0, -57280(%rsi)
	movaps	%xmm0, -57296(%rsi)
	movaps	%xmm0, -57312(%rsi)
	movaps	%xmm0, -57328(%rsi)
	movaps	%xmm0, -57344(%rsi)
	movaps	%xmm0, -55184(%rsi)
	movaps	%xmm0, -55200(%rsi)
	movaps	%xmm0, -55216(%rsi)
	movaps	%xmm0, -55232(%rsi)
	movaps	%xmm0, -55248(%rsi)
	movaps	%xmm0, -55264(%rsi)
	movaps	%xmm0, -55280(%rsi)
	movaps	%xmm0, -55296(%rsi)
	movaps	%xmm0, -53136(%rsi)
	movaps	%xmm0, -53152(%rsi)
	movaps	%xmm0, -53168(%rsi)
	movaps	%xmm0, -53184(%rsi)
	movaps	%xmm0, -53200(%rsi)
	movaps	%xmm0, -53216(%rsi)
	movaps	%xmm0, -53232(%rsi)
	movaps	%xmm0, -53248(%rsi)
	movaps	%xmm0, -51088(%rsi)
	movaps	%xmm0, -51104(%rsi)
	movaps	%xmm0, -51120(%rsi)
	movaps	%xmm0, -51136(%rsi)
	movaps	%xmm0, -51152(%rsi)
	movaps	%xmm0, -51168(%rsi)
	movaps	%xmm0, -51184(%rsi)
	movaps	%xmm0, -51200(%rsi)
	movaps	%xmm0, -49040(%rsi)
	movaps	%xmm0, -49056(%rsi)
	movaps	%xmm0, -49072(%rsi)
	movaps	%xmm0, -49088(%rsi)
	movaps	%xmm0, -49104(%rsi)
	movaps	%xmm0, -49120(%rsi)
	movaps	%xmm0, -49136(%rsi)
	movaps	%xmm0, -49152(%rsi)
	movaps	%xmm0, -46992(%rsi)
	movaps	%xmm0, -47008(%rsi)
	movaps	%xmm0, -47024(%rsi)
	movaps	%xmm0, -47040(%rsi)
	movaps	%xmm0, -47056(%rsi)
	movaps	%xmm0, -47072(%rsi)
	movaps	%xmm0, -47088(%rsi)
	movaps	%xmm0, -47104(%rsi)
	movaps	%xmm0, -44944(%rsi)
	movaps	%xmm0, -44960(%rsi)
	movaps	%xmm0, -44976(%rsi)
	movaps	%xmm0, -44992(%rsi)
	movaps	%xmm0, -45008(%rsi)
	movaps	%xmm0, -45024(%rsi)
	movaps	%xmm0, -45040(%rsi)
	movaps	%xmm0, -45056(%rsi)
	movaps	%xmm0, -42896(%rsi)
	movaps	%xmm0, -42912(%rsi)
	movaps	%xmm0, -42928(%rsi)
	movaps	%xmm0, -42944(%rsi)
	movaps	%xmm0, -42960(%rsi)
	movaps	%xmm0, -42976(%rsi)
	movaps	%xmm0, -42992(%rsi)
	movaps	%xmm0, -43008(%rsi)
	movaps	%xmm0, -40848(%rsi)
	movaps	%xmm0, -40864(%rsi)
	movaps	%xmm0, -40880(%rsi)
	movaps	%xmm0, -40896(%rsi)
	movaps	%xmm0, -40912(%rsi)
	movaps	%xmm0, -40928(%rsi)
	movaps	%xmm0, -40944(%rsi)
	movaps	%xmm0, -40960(%rsi)
	movaps	%xmm0, -38800(%rsi)
	movaps	%xmm0, -38816(%rsi)
	movaps	%xmm0, -38832(%rsi)
	movaps	%xmm0, -38848(%rsi)
	movaps	%xmm0, -38864(%rsi)
	movaps	%xmm0, -38880(%rsi)
	movaps	%xmm0, -38896(%rsi)
	movaps	%xmm0, -38912(%rsi)
	movaps	%xmm0, -36752(%rsi)
	movaps	%xmm0, -36768(%rsi)
	movaps	%xmm0, -36784(%rsi)
	movaps	%xmm0, -36800(%rsi)
	movaps	%xmm0, -36816(%rsi)
	movaps	%xmm0, -36832(%rsi)
	movaps	%xmm0, -36848(%rsi)
	movaps	%xmm0, -36864(%rsi)
	movaps	%xmm0, -34704(%rsi)
	movaps	%xmm0, -34720(%rsi)
	movaps	%xmm0, -34736(%rsi)
	movaps	%xmm0, -34752(%rsi)
	movaps	%xmm0, -34768(%rsi)
	movaps	%xmm0, -34784(%rsi)
	movaps	%xmm0, -34800(%rsi)
	movaps	%xmm0, -34816(%rsi)
	movaps	%xmm0, -32656(%rsi)
	movaps	%xmm0, -32672(%rsi)
	movaps	%xmm0, -32688(%rsi)
	movaps	%xmm0, -32704(%rsi)
	movaps	%xmm0, -32720(%rsi)
	movaps	%xmm0, -32736(%rsi)
	movaps	%xmm0, -32752(%rsi)
	movaps	%xmm0, -32768(%rsi)
	movaps	%xmm0, -30608(%rsi)
	movaps	%xmm0, -30624(%rsi)
	movaps	%xmm0, -30640(%rsi)
	movaps	%xmm0, -30656(%rsi)
	movaps	%xmm0, -30672(%rsi)
	movaps	%xmm0, -30688(%rsi)
	movaps	%xmm0, -30704(%rsi)
	movaps	%xmm0, -30720(%rsi)
	movaps	%xmm0, -28560(%rsi)
	movaps	%xmm0, -28576(%rsi)
	movaps	%xmm0, -28592(%rsi)
	movaps	%xmm0, -28608(%rsi)
	movaps	%xmm0, -28624(%rsi)
	movaps	%xmm0, -28640(%rsi)
	movaps	%xmm0, -28656(%rsi)
	movaps	%xmm0, -28672(%rsi)
	movaps	%xmm0, -26512(%rsi)
	movaps	%xmm0, -26528(%rsi)
	movaps	%xmm0, -26544(%rsi)
	movaps	%xmm0, -26560(%rsi)
	movaps	%xmm0, -26576(%rsi)
	movaps	%xmm0, -26592(%rsi)
	movaps	%xmm0, -26608(%rsi)
	movaps	%xmm0, -26624(%rsi)
	movaps	%xmm0, -24464(%rsi)
	movaps	%xmm0, -24480(%rsi)
	movaps	%xmm0, -24496(%rsi)
	movaps	%xmm0, -24512(%rsi)
	movaps	%xmm0, -24528(%rsi)
	movaps	%xmm0, -24544(%rsi)
	movaps	%xmm0, -24560(%rsi)
	movaps	%xmm0, -24576(%rsi)
	movaps	%xmm0, -22416(%rsi)
	movaps	%xmm0, -22432(%rsi)
	movaps	%xmm0, -22448(%rsi)
	movaps	%xmm0, -22464(%rsi)
	movaps	%xmm0, -22480(%rsi)
	movaps	%xmm0, -22496(%rsi)
	movaps	%xmm0, -22512(%rsi)
	movaps	%xmm0, -22528(%rsi)
	movaps	%xmm0, -20368(%rsi)
	movaps	%xmm0, -20384(%rsi)
	movaps	%xmm0, -20400(%rsi)
	movaps	%xmm0, -20416(%rsi)
	movaps	%xmm0, -20432(%rsi)
	movaps	%xmm0, -20448(%rsi)
	movaps	%xmm0, -20464(%rsi)
	movaps	%xmm0, -20480(%rsi)
	movaps	%xmm0, -18320(%rsi)
	movaps	%xmm0, -18336(%rsi)
	movaps	%xmm0, -18352(%rsi)
	movaps	%xmm0, -18368(%rsi)
	movaps	%xmm0, -18384(%rsi)
	movaps	%xmm0, -18400(%rsi)
	movaps	%xmm0, -18416(%rsi)
	movaps	%xmm0, -18432(%rsi)
	movaps	%xmm0, -16272(%rsi)
	movaps	%xmm0, -16288(%rsi)
	movaps	%xmm0, -16304(%rsi)
	movaps	%xmm0, -16320(%rsi)
	movaps	%xmm0, -16336(%rsi)
	movaps	%xmm0, -16352(%rsi)
	movaps	%xmm0, -16368(%rsi)
	movaps	%xmm0, -16384(%rsi)
	movaps	%xmm0, -14224(%rsi)
	movaps	%xmm0, -14240(%rsi)
	movaps	%xmm0, -14256(%rsi)
	movaps	%xmm0, -14272(%rsi)
	movaps	%xmm0, -14288(%rsi)
	movaps	%xmm0, -14304(%rsi)
	movaps	%xmm0, -14320(%rsi)
	movaps	%xmm0, -14336(%rsi)
	movaps	%xmm0, -12176(%rsi)
	movaps	%xmm0, -12192(%rsi)
	movaps	%xmm0, -12208(%rsi)
	movaps	%xmm0, -12224(%rsi)
	movaps	%xmm0, -12240(%rsi)
	movaps	%xmm0, -12256(%rsi)
	movaps	%xmm0, -12272(%rsi)
	movaps	%xmm0, -12288(%rsi)
	movaps	%xmm0, -10128(%rsi)
	movaps	%xmm0, -10144(%rsi)
	movaps	%xmm0, -10160(%rsi)
	movaps	%xmm0, -10176(%rsi)
	movaps	%xmm0, -10192(%rsi)
	movaps	%xmm0, -10208(%rsi)
	movaps	%xmm0, -10224(%rsi)
	movaps	%xmm0, -10240(%rsi)
	movaps	%xmm0, -8080(%rsi)
	movaps	%xmm0, -8096(%rsi)
	movaps	%xmm0, -8112(%rsi)
	movaps	%xmm0, -8128(%rsi)
	movaps	%xmm0, -8144(%rsi)
	movaps	%xmm0, -8160(%rsi)
	movaps	%xmm0, -8176(%rsi)
	movaps	%xmm0, -8192(%rsi)
	movaps	%xmm0, -6032(%rsi)
	movaps	%xmm0, -6048(%rsi)
	movaps	%xmm0, -6064(%rsi)
	movaps	%xmm0, -6080(%rsi)
	movaps	%xmm0, -6096(%rsi)
	movaps	%xmm0, -6112(%rsi)
	movaps	%xmm0, -6128(%rsi)
	movaps	%xmm0, -6144(%rsi)
	movaps	%xmm0, -3984(%rsi)
	movaps	%xmm0, -4000(%rsi)
	movaps	%xmm0, -4016(%rsi)
	movaps	%xmm0, -4032(%rsi)
	movaps	%xmm0, -4048(%rsi)
	movaps	%xmm0, -4064(%rsi)
	movaps	%xmm0, -4080(%rsi)
	movaps	%xmm0, -4096(%rsi)
	movaps	%xmm0, -1936(%rsi)
	movaps	%xmm0, -1952(%rsi)
	movaps	%xmm0, -1968(%rsi)
	movaps	%xmm0, -1984(%rsi)
	movaps	%xmm0, -2000(%rsi)
	movaps	%xmm0, -2016(%rsi)
	movaps	%xmm0, -2032(%rsi)
	movaps	%xmm0, -2048(%rsi)
	movaps	%xmm0, 112(%rsi)
	movaps	%xmm0, 96(%rsi)
	movaps	%xmm0, 80(%rsi)
	movaps	%xmm0, 64(%rsi)
	movaps	%xmm0, 48(%rsi)
	movaps	%xmm0, 32(%rsi)
	movaps	%xmm0, 16(%rsi)
	movaps	%xmm0, (%rsi)
	subq	$-128, %rsi
	decq	%rdi
	jne	.LBB4_7
# BB#5:                                 # %polly.loop_exit4
                                        #   in Loop: Header=BB4_6 Depth=2
	addq	$65536, %rdx            # imm = 0x10000
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
	.type	mat_mult_polly_subfn_2,@function
mat_mult_polly_subfn_2:                 # @mat_mult_polly_subfn_2
.Lfunc_begin5:
	.cfi_startproc
# BB#0:                                 # %polly.par.setup
	pushq	%rbp
.Ltmp44:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp45:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp46:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp47:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp48:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp49:
	.cfi_def_cfa_offset 56
	subq	$72, %rsp
.Ltmp50:
	.cfi_def_cfa_offset 128
.Ltmp51:
	.cfi_offset %rbx, -56
.Ltmp52:
	.cfi_offset %r12, -48
.Ltmp53:
	.cfi_offset %r13, -40
.Ltmp54:
	.cfi_offset %r14, -32
.Ltmp55:
	.cfi_offset %r15, -24
.Ltmp56:
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
	shlq	$16, %rax
	leaq	A+4(%rax), %rax
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
	movl	$B+2048, %eax
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
	shlq	$11, %rbp
	leaq	C(%rbp,%rax,4), %r8
	movl	C(%rbp,%rax,4), %r9d
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
	movl	-2048(%r14), %r13d
	.loc	1 36 45                 # MatrixMult.c:36:45
	imull	-4(%rax), %r13d
	.loc	1 36 35 is_stmt 0       # MatrixMult.c:36:35
	addl	%r9d, %r13d
	movl	(%r14), %r9d
	.loc	1 36 45                 # MatrixMult.c:36:45
	imull	(%rax), %r9d
	.loc	1 36 35                 # MatrixMult.c:36:35
	addl	%r13d, %r9d
	addq	$4096, %r14             # imm = 0x1000
	addq	$8, %rax
	addq	$-2, %r12
	jne	.LBB5_11
# BB#12:                                # %polly.loop_exit28
                                        #   in Loop: Header=BB5_13 Depth=6
	movl	%r9d, (%r8)
	incq	%r15
	addq	$4, %r11
	cmpq	$32, %r15
	jne	.LBB5_13
# BB#7:                                 # %polly.loop_exit22
                                        #   in Loop: Header=BB5_10 Depth=5
	incq	%rcx
	addq	$2048, %r10             # imm = 0x800
	cmpq	$32, %rcx
	jne	.LBB5_10
# BB#8:                                 # %polly.loop_exit16
                                        #   in Loop: Header=BB5_9 Depth=4
	movq	56(%rsp), %rax          # 8-byte Reload
	incq	%rax
	addq	$65536, %rdx            # imm = 0x10000
	movq	64(%rsp), %r10          # 8-byte Reload
	subq	$-128, %r10
	cmpq	$16, %rax
	jne	.LBB5_9
# BB#3:                                 # %polly.loop_exit10
                                        #   in Loop: Header=BB5_6 Depth=3
	movq	40(%rsp), %rcx          # 8-byte Reload
	incq	%rcx
	movq	48(%rsp), %rax          # 8-byte Reload
	subq	$-128, %rax
	cmpq	$16, %rcx
	jne	.LBB5_6
# BB#4:                                 # %polly.loop_exit4
                                        #   in Loop: Header=BB5_5 Depth=2
	addq	$65536, (%rsp)          # 8-byte Folded Spill
                                        # imm = 0x10000
	movq	32(%rsp), %rcx          # 8-byte Reload
	cmpq	24(%rsp), %rcx          # 8-byte Folded Reload
	leaq	1(%rcx), %rcx
	jle	.LBB5_5
.LBB5_1:                                # %polly.par.setup
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
	.size	mat_mult_polly_subfn_2, .Lfunc_end5-mat_mult_polly_subfn_2
	.cfi_endproc

	.type	R,@object               # @R
	.comm	R,1048576,16
	.type	A,@object               # @A
	.comm	A,1048576,16
	.type	B,@object               # @B
	.comm	B,1048576,16
	.type	C,@object               # @C
	.comm	C,1048576,16
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
	.byte	2                       # Abbrev [2] 0x8b:0x15 DW_TAG_variable
	.long	.Linfo_string8          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
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
	.byte	9                       # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0xbc:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0xc8:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
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
	.byte	30                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0xe9:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0xf5:0xb DW_TAG_variable
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x100:0xb DW_TAG_variable
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
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
	.byte	55                      # DW_AT_decl_line
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
