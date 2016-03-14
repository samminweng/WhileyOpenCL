	.text
	.file	"MatrixMult.polly.ll"
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
	pushq	%r13
.Ltmp2:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp3:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp4:
	.cfi_def_cfa_offset 48
.Ltmp5:
	.cfi_offset %rbx, -48
.Ltmp6:
	.cfi_offset %r12, -40
.Ltmp7:
	.cfi_offset %r13, -32
.Ltmp8:
	.cfi_offset %r14, -24
.Ltmp9:
	.cfi_offset %r15, -16
	xorl	%r14d, %r14d
.Ltmp10:
	.loc	1 14 22 prologue_end    # MatrixMult.c:14:22
	xorl	%edi, %edi
	callq	time
	.loc	1 14 5 is_stmt 0 discriminator 1 # MatrixMult.c:14:5
	movl	%eax, %edi
	callq	srand
	movl	$R, %r15d
.Ltmp11:
	#DEBUG_VALUE: init:i <- 0
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB0_1:                                # %for.cond2.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	movq	%r15, %rbx
	movl	$512, %r13d             # imm = 0x200
	.p2align	4, 0x90
.LBB0_2:                                # %for.body5
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp12:
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
.Ltmp13:
	.loc	1 16 9 is_stmt 1 discriminator 1 # MatrixMult.c:16:9
	addq	$4, %rbx
	decq	%r13
	jne	.LBB0_2
.Ltmp14:
# BB#3:                                 # %for.inc9
                                        #   in Loop: Header=BB0_1 Depth=1
	.loc	1 15 5 discriminator 1  # MatrixMult.c:15:5
	incq	%r12
	addq	$2048, %r15             # imm = 0x800
	cmpq	$512, %r12              # imm = 0x200
	jne	.LBB0_1
.Ltmp15:
# BB#4:
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB0_5:                                # %polly.loop_preheader74
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_10 Depth 2
                                        #       Child Loop BB0_11 Depth 3
                                        #         Child Loop BB0_12 Depth 4
	movq	%r8, %r11
	shlq	$5, %r11
	movq	%r14, %r9
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB0_10:                               # %polly.loop_preheader80
                                        #   Parent Loop BB0_5 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_11 Depth 3
                                        #         Child Loop BB0_12 Depth 4
	movq	%r10, %rdi
	shlq	$5, %rdi
	movq	%r9, %rdx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_11:                               # %polly.loop_preheader86
                                        #   Parent Loop BB0_5 Depth=1
                                        #     Parent Loop BB0_10 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_12 Depth 4
	leaq	(%r11,%rax), %rcx
	shlq	$11, %rcx
	movaps	R+112(%rcx,%rdi,4), %xmm0
	movaps	%xmm0, A+112(%rcx,%rdi,4)
	movaps	R+96(%rcx,%rdi,4), %xmm0
	movaps	%xmm0, A+96(%rcx,%rdi,4)
	movaps	R+80(%rcx,%rdi,4), %xmm0
	movaps	%xmm0, A+80(%rcx,%rdi,4)
	movaps	R+64(%rcx,%rdi,4), %xmm0
	movaps	%xmm0, A+64(%rcx,%rdi,4)
	movaps	R+48(%rcx,%rdi,4), %xmm0
	movaps	%xmm0, A+48(%rcx,%rdi,4)
	movaps	R+32(%rcx,%rdi,4), %xmm0
	movaps	%xmm0, A+32(%rcx,%rdi,4)
	movaps	R+16(%rcx,%rdi,4), %xmm0
	movaps	%xmm0, A+16(%rcx,%rdi,4)
	movaps	R(%rcx,%rdi,4), %xmm0
	movaps	%xmm0, A(%rcx,%rdi,4)
	movq	%rdx, %rbx
	movl	$32, %esi
	.p2align	4, 0x90
.LBB0_12:                               # %polly.loop_header85
                                        #   Parent Loop BB0_5 Depth=1
                                        #     Parent Loop BB0_10 Depth=2
                                        #       Parent Loop BB0_11 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
.Ltmp16:
	.loc	1 25 27                 # MatrixMult.c:25:27
	movl	$100, %ecx
	subl	R(%rbx), %ecx
	movl	%ecx, B(%rbx)
	movl	$100, %ecx
	subl	R+4(%rbx), %ecx
	movl	%ecx, B+4(%rbx)
	addq	$8, %rbx
	addq	$-2, %rsi
	jne	.LBB0_12
.Ltmp17:
# BB#8:                                 # %polly.loop_exit87
                                        #   in Loop: Header=BB0_11 Depth=3
	incq	%rax
	addq	$2048, %rdx             # imm = 0x800
	cmpq	$32, %rax
	jne	.LBB0_11
# BB#9:                                 # %polly.loop_exit81
                                        #   in Loop: Header=BB0_10 Depth=2
	incq	%r10
	subq	$-128, %r9
	cmpq	$16, %r10
	jne	.LBB0_10
# BB#6:                                 # %polly.loop_exit75
                                        #   in Loop: Header=BB0_5 Depth=1
	incq	%r8
	addq	$65536, %r14            # imm = 0x10000
	cmpq	$16, %r8
	jne	.LBB0_5
# BB#7:                                 # %polly.exiting
	.loc	1 28 1                  # MatrixMult.c:28:1
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
.Ltmp18:
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
	pushq	%rbp
.Ltmp19:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp20:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp21:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp22:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp23:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp24:
	.cfi_def_cfa_offset 56
.Ltmp25:
	.cfi_offset %rbx, -56
.Ltmp26:
	.cfi_offset %r12, -48
.Ltmp27:
	.cfi_offset %r13, -40
.Ltmp28:
	.cfi_offset %r14, -32
.Ltmp29:
	.cfi_offset %r15, -24
.Ltmp30:
	.cfi_offset %rbp, -16
	xorl	%ecx, %ecx
	movl	$C+63488, %edx
.Ltmp31:
	#DEBUG_VALUE: mat_mult:i <- 0
	xorps	%xmm0, %xmm0
	movl	$A+4, %eax
	movq	%rax, -48(%rsp)         # 8-byte Spill
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB1_2:                                # %polly.loop_preheader56
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_3 Depth 2
	movq	%rdx, %rdi
	movl	$16, %eax
	.p2align	4, 0x90
.LBB1_3:                                # %polly.loop_preheader68
                                        #   Parent Loop BB1_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movaps	%xmm0, -63376(%rdi)
	movaps	%xmm0, -63392(%rdi)
	movaps	%xmm0, -63408(%rdi)
	movaps	%xmm0, -63424(%rdi)
	movaps	%xmm0, -63440(%rdi)
	movaps	%xmm0, -63456(%rdi)
	movaps	%xmm0, -63472(%rdi)
	movaps	%xmm0, -63488(%rdi)
	movaps	%xmm0, -61328(%rdi)
	movaps	%xmm0, -61344(%rdi)
	movaps	%xmm0, -61360(%rdi)
	movaps	%xmm0, -61376(%rdi)
	movaps	%xmm0, -61392(%rdi)
	movaps	%xmm0, -61408(%rdi)
	movaps	%xmm0, -61424(%rdi)
	movaps	%xmm0, -61440(%rdi)
	movaps	%xmm0, -59280(%rdi)
	movaps	%xmm0, -59296(%rdi)
	movaps	%xmm0, -59312(%rdi)
	movaps	%xmm0, -59328(%rdi)
	movaps	%xmm0, -59344(%rdi)
	movaps	%xmm0, -59360(%rdi)
	movaps	%xmm0, -59376(%rdi)
	movaps	%xmm0, -59392(%rdi)
	movaps	%xmm0, -57232(%rdi)
	movaps	%xmm0, -57248(%rdi)
	movaps	%xmm0, -57264(%rdi)
	movaps	%xmm0, -57280(%rdi)
	movaps	%xmm0, -57296(%rdi)
	movaps	%xmm0, -57312(%rdi)
	movaps	%xmm0, -57328(%rdi)
	movaps	%xmm0, -57344(%rdi)
	movaps	%xmm0, -55184(%rdi)
	movaps	%xmm0, -55200(%rdi)
	movaps	%xmm0, -55216(%rdi)
	movaps	%xmm0, -55232(%rdi)
	movaps	%xmm0, -55248(%rdi)
	movaps	%xmm0, -55264(%rdi)
	movaps	%xmm0, -55280(%rdi)
	movaps	%xmm0, -55296(%rdi)
	movaps	%xmm0, -53136(%rdi)
	movaps	%xmm0, -53152(%rdi)
	movaps	%xmm0, -53168(%rdi)
	movaps	%xmm0, -53184(%rdi)
	movaps	%xmm0, -53200(%rdi)
	movaps	%xmm0, -53216(%rdi)
	movaps	%xmm0, -53232(%rdi)
	movaps	%xmm0, -53248(%rdi)
	movaps	%xmm0, -51088(%rdi)
	movaps	%xmm0, -51104(%rdi)
	movaps	%xmm0, -51120(%rdi)
	movaps	%xmm0, -51136(%rdi)
	movaps	%xmm0, -51152(%rdi)
	movaps	%xmm0, -51168(%rdi)
	movaps	%xmm0, -51184(%rdi)
	movaps	%xmm0, -51200(%rdi)
	movaps	%xmm0, -49040(%rdi)
	movaps	%xmm0, -49056(%rdi)
	movaps	%xmm0, -49072(%rdi)
	movaps	%xmm0, -49088(%rdi)
	movaps	%xmm0, -49104(%rdi)
	movaps	%xmm0, -49120(%rdi)
	movaps	%xmm0, -49136(%rdi)
	movaps	%xmm0, -49152(%rdi)
	movaps	%xmm0, -46992(%rdi)
	movaps	%xmm0, -47008(%rdi)
	movaps	%xmm0, -47024(%rdi)
	movaps	%xmm0, -47040(%rdi)
	movaps	%xmm0, -47056(%rdi)
	movaps	%xmm0, -47072(%rdi)
	movaps	%xmm0, -47088(%rdi)
	movaps	%xmm0, -47104(%rdi)
	movaps	%xmm0, -44944(%rdi)
	movaps	%xmm0, -44960(%rdi)
	movaps	%xmm0, -44976(%rdi)
	movaps	%xmm0, -44992(%rdi)
	movaps	%xmm0, -45008(%rdi)
	movaps	%xmm0, -45024(%rdi)
	movaps	%xmm0, -45040(%rdi)
	movaps	%xmm0, -45056(%rdi)
	movaps	%xmm0, -42896(%rdi)
	movaps	%xmm0, -42912(%rdi)
	movaps	%xmm0, -42928(%rdi)
	movaps	%xmm0, -42944(%rdi)
	movaps	%xmm0, -42960(%rdi)
	movaps	%xmm0, -42976(%rdi)
	movaps	%xmm0, -42992(%rdi)
	movaps	%xmm0, -43008(%rdi)
	movaps	%xmm0, -40848(%rdi)
	movaps	%xmm0, -40864(%rdi)
	movaps	%xmm0, -40880(%rdi)
	movaps	%xmm0, -40896(%rdi)
	movaps	%xmm0, -40912(%rdi)
	movaps	%xmm0, -40928(%rdi)
	movaps	%xmm0, -40944(%rdi)
	movaps	%xmm0, -40960(%rdi)
	movaps	%xmm0, -38800(%rdi)
	movaps	%xmm0, -38816(%rdi)
	movaps	%xmm0, -38832(%rdi)
	movaps	%xmm0, -38848(%rdi)
	movaps	%xmm0, -38864(%rdi)
	movaps	%xmm0, -38880(%rdi)
	movaps	%xmm0, -38896(%rdi)
	movaps	%xmm0, -38912(%rdi)
	movaps	%xmm0, -36752(%rdi)
	movaps	%xmm0, -36768(%rdi)
	movaps	%xmm0, -36784(%rdi)
	movaps	%xmm0, -36800(%rdi)
	movaps	%xmm0, -36816(%rdi)
	movaps	%xmm0, -36832(%rdi)
	movaps	%xmm0, -36848(%rdi)
	movaps	%xmm0, -36864(%rdi)
	movaps	%xmm0, -34704(%rdi)
	movaps	%xmm0, -34720(%rdi)
	movaps	%xmm0, -34736(%rdi)
	movaps	%xmm0, -34752(%rdi)
	movaps	%xmm0, -34768(%rdi)
	movaps	%xmm0, -34784(%rdi)
	movaps	%xmm0, -34800(%rdi)
	movaps	%xmm0, -34816(%rdi)
	movaps	%xmm0, -32656(%rdi)
	movaps	%xmm0, -32672(%rdi)
	movaps	%xmm0, -32688(%rdi)
	movaps	%xmm0, -32704(%rdi)
	movaps	%xmm0, -32720(%rdi)
	movaps	%xmm0, -32736(%rdi)
	movaps	%xmm0, -32752(%rdi)
	movaps	%xmm0, -32768(%rdi)
	movaps	%xmm0, -30608(%rdi)
	movaps	%xmm0, -30624(%rdi)
	movaps	%xmm0, -30640(%rdi)
	movaps	%xmm0, -30656(%rdi)
	movaps	%xmm0, -30672(%rdi)
	movaps	%xmm0, -30688(%rdi)
	movaps	%xmm0, -30704(%rdi)
	movaps	%xmm0, -30720(%rdi)
	movaps	%xmm0, -28560(%rdi)
	movaps	%xmm0, -28576(%rdi)
	movaps	%xmm0, -28592(%rdi)
	movaps	%xmm0, -28608(%rdi)
	movaps	%xmm0, -28624(%rdi)
	movaps	%xmm0, -28640(%rdi)
	movaps	%xmm0, -28656(%rdi)
	movaps	%xmm0, -28672(%rdi)
	movaps	%xmm0, -26512(%rdi)
	movaps	%xmm0, -26528(%rdi)
	movaps	%xmm0, -26544(%rdi)
	movaps	%xmm0, -26560(%rdi)
	movaps	%xmm0, -26576(%rdi)
	movaps	%xmm0, -26592(%rdi)
	movaps	%xmm0, -26608(%rdi)
	movaps	%xmm0, -26624(%rdi)
	movaps	%xmm0, -24464(%rdi)
	movaps	%xmm0, -24480(%rdi)
	movaps	%xmm0, -24496(%rdi)
	movaps	%xmm0, -24512(%rdi)
	movaps	%xmm0, -24528(%rdi)
	movaps	%xmm0, -24544(%rdi)
	movaps	%xmm0, -24560(%rdi)
	movaps	%xmm0, -24576(%rdi)
	movaps	%xmm0, -22416(%rdi)
	movaps	%xmm0, -22432(%rdi)
	movaps	%xmm0, -22448(%rdi)
	movaps	%xmm0, -22464(%rdi)
	movaps	%xmm0, -22480(%rdi)
	movaps	%xmm0, -22496(%rdi)
	movaps	%xmm0, -22512(%rdi)
	movaps	%xmm0, -22528(%rdi)
	movaps	%xmm0, -20368(%rdi)
	movaps	%xmm0, -20384(%rdi)
	movaps	%xmm0, -20400(%rdi)
	movaps	%xmm0, -20416(%rdi)
	movaps	%xmm0, -20432(%rdi)
	movaps	%xmm0, -20448(%rdi)
	movaps	%xmm0, -20464(%rdi)
	movaps	%xmm0, -20480(%rdi)
	movaps	%xmm0, -18320(%rdi)
	movaps	%xmm0, -18336(%rdi)
	movaps	%xmm0, -18352(%rdi)
	movaps	%xmm0, -18368(%rdi)
	movaps	%xmm0, -18384(%rdi)
	movaps	%xmm0, -18400(%rdi)
	movaps	%xmm0, -18416(%rdi)
	movaps	%xmm0, -18432(%rdi)
	movaps	%xmm0, -16272(%rdi)
	movaps	%xmm0, -16288(%rdi)
	movaps	%xmm0, -16304(%rdi)
	movaps	%xmm0, -16320(%rdi)
	movaps	%xmm0, -16336(%rdi)
	movaps	%xmm0, -16352(%rdi)
	movaps	%xmm0, -16368(%rdi)
	movaps	%xmm0, -16384(%rdi)
	movaps	%xmm0, -14224(%rdi)
	movaps	%xmm0, -14240(%rdi)
	movaps	%xmm0, -14256(%rdi)
	movaps	%xmm0, -14272(%rdi)
	movaps	%xmm0, -14288(%rdi)
	movaps	%xmm0, -14304(%rdi)
	movaps	%xmm0, -14320(%rdi)
	movaps	%xmm0, -14336(%rdi)
	movaps	%xmm0, -12176(%rdi)
	movaps	%xmm0, -12192(%rdi)
	movaps	%xmm0, -12208(%rdi)
	movaps	%xmm0, -12224(%rdi)
	movaps	%xmm0, -12240(%rdi)
	movaps	%xmm0, -12256(%rdi)
	movaps	%xmm0, -12272(%rdi)
	movaps	%xmm0, -12288(%rdi)
	movaps	%xmm0, -10128(%rdi)
	movaps	%xmm0, -10144(%rdi)
	movaps	%xmm0, -10160(%rdi)
	movaps	%xmm0, -10176(%rdi)
	movaps	%xmm0, -10192(%rdi)
	movaps	%xmm0, -10208(%rdi)
	movaps	%xmm0, -10224(%rdi)
	movaps	%xmm0, -10240(%rdi)
	movaps	%xmm0, -8080(%rdi)
	movaps	%xmm0, -8096(%rdi)
	movaps	%xmm0, -8112(%rdi)
	movaps	%xmm0, -8128(%rdi)
	movaps	%xmm0, -8144(%rdi)
	movaps	%xmm0, -8160(%rdi)
	movaps	%xmm0, -8176(%rdi)
	movaps	%xmm0, -8192(%rdi)
	movaps	%xmm0, -6032(%rdi)
	movaps	%xmm0, -6048(%rdi)
	movaps	%xmm0, -6064(%rdi)
	movaps	%xmm0, -6080(%rdi)
	movaps	%xmm0, -6096(%rdi)
	movaps	%xmm0, -6112(%rdi)
	movaps	%xmm0, -6128(%rdi)
	movaps	%xmm0, -6144(%rdi)
	movaps	%xmm0, -3984(%rdi)
	movaps	%xmm0, -4000(%rdi)
	movaps	%xmm0, -4016(%rdi)
	movaps	%xmm0, -4032(%rdi)
	movaps	%xmm0, -4048(%rdi)
	movaps	%xmm0, -4064(%rdi)
	movaps	%xmm0, -4080(%rdi)
	movaps	%xmm0, -4096(%rdi)
	movaps	%xmm0, -1936(%rdi)
	movaps	%xmm0, -1952(%rdi)
	movaps	%xmm0, -1968(%rdi)
	movaps	%xmm0, -1984(%rdi)
	movaps	%xmm0, -2000(%rdi)
	movaps	%xmm0, -2016(%rdi)
	movaps	%xmm0, -2032(%rdi)
	movaps	%xmm0, -2048(%rdi)
	movaps	%xmm0, 112(%rdi)
	movaps	%xmm0, 96(%rdi)
	movaps	%xmm0, 80(%rdi)
	movaps	%xmm0, 64(%rdi)
	movaps	%xmm0, 48(%rdi)
	movaps	%xmm0, 32(%rdi)
	movaps	%xmm0, 16(%rdi)
	movaps	%xmm0, (%rdi)
	subq	$-128, %rdi
	decq	%rax
	jne	.LBB1_3
# BB#1:                                 # %polly.loop_exit57
                                        #   in Loop: Header=BB1_2 Depth=1
	incq	%rsi
	addq	$65536, %rdx            # imm = 0x10000
	cmpq	$16, %rsi
	jne	.LBB1_2
	.p2align	4, 0x90
.LBB1_5:                                # %polly.loop_preheader80
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_8 Depth 2
                                        #       Child Loop BB1_9 Depth 3
                                        #         Child Loop BB1_12 Depth 4
                                        #           Child Loop BB1_13 Depth 5
                                        #             Child Loop BB1_14 Depth 6
	movq	%rcx, -40(%rsp)         # 8-byte Spill
	movq	%rcx, %r12
	shlq	$5, %r12
	movl	$B+2048, %ecx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_8:                                # %polly.loop_preheader86
                                        #   Parent Loop BB1_5 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_9 Depth 3
                                        #         Child Loop BB1_12 Depth 4
                                        #           Child Loop BB1_13 Depth 5
                                        #             Child Loop BB1_14 Depth 6
	movq	%rax, -32(%rsp)         # 8-byte Spill
	movq	%rcx, -24(%rsp)         # 8-byte Spill
	movq	%rax, %rdi
	shlq	$5, %rdi
	movq	-48(%rsp), %r9          # 8-byte Reload
	movq	%rcx, %r13
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_9:                                # %polly.loop_preheader92
                                        #   Parent Loop BB1_5 Depth=1
                                        #     Parent Loop BB1_8 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_12 Depth 4
                                        #           Child Loop BB1_13 Depth 5
                                        #             Child Loop BB1_14 Depth 6
	movq	%rcx, -16(%rsp)         # 8-byte Spill
	movq	%r9, -8(%rsp)           # 8-byte Spill
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_12:                               # %polly.loop_preheader98
                                        #   Parent Loop BB1_5 Depth=1
                                        #     Parent Loop BB1_8 Depth=2
                                        #       Parent Loop BB1_9 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB1_13 Depth 5
                                        #             Child Loop BB1_14 Depth 6
	leaq	(%rcx,%r12), %r15
	movq	%r13, %r10
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB1_13:                               # %polly.loop_preheader104
                                        #   Parent Loop BB1_5 Depth=1
                                        #     Parent Loop BB1_8 Depth=2
                                        #       Parent Loop BB1_9 Depth=3
                                        #         Parent Loop BB1_12 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB1_14 Depth 6
	leaq	(%rdx,%rdi), %rax
	movq	%r15, %rsi
	shlq	$11, %rsi
	leaq	C(%rsi,%rax,4), %rbp
	movl	C(%rsi,%rax,4), %r8d
	movq	%r9, %rbx
	movq	%r10, %rax
	movl	$32, %r11d
	.p2align	4, 0x90
.LBB1_14:                               # %polly.loop_header103
                                        #   Parent Loop BB1_5 Depth=1
                                        #     Parent Loop BB1_8 Depth=2
                                        #       Parent Loop BB1_9 Depth=3
                                        #         Parent Loop BB1_12 Depth=4
                                        #           Parent Loop BB1_13 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movl	-2048(%rax), %r14d
.Ltmp32:
	.loc	1 36 45 prologue_end    # MatrixMult.c:36:45
	imull	-4(%rbx), %r14d
	.loc	1 36 35 is_stmt 0       # MatrixMult.c:36:35
	addl	%r8d, %r14d
	movl	(%rax), %r8d
	.loc	1 36 45                 # MatrixMult.c:36:45
	imull	(%rbx), %r8d
	.loc	1 36 35                 # MatrixMult.c:36:35
	addl	%r14d, %r8d
	addq	$4096, %rax             # imm = 0x1000
	addq	$8, %rbx
	addq	$-2, %r11
	jne	.LBB1_14
.Ltmp33:
# BB#10:                                # %polly.loop_exit105
                                        #   in Loop: Header=BB1_13 Depth=5
	movl	%r8d, (%rbp)
	incq	%rdx
	addq	$4, %r10
	cmpq	$32, %rdx
	jne	.LBB1_13
# BB#11:                                # %polly.loop_exit99
                                        #   in Loop: Header=BB1_12 Depth=4
	incq	%rcx
	addq	$2048, %r9              # imm = 0x800
	cmpq	$32, %rcx
	jne	.LBB1_12
# BB#6:                                 # %polly.loop_exit93
                                        #   in Loop: Header=BB1_9 Depth=3
	movq	-16(%rsp), %rcx         # 8-byte Reload
	incq	%rcx
	addq	$65536, %r13            # imm = 0x10000
	movq	-8(%rsp), %r9           # 8-byte Reload
	subq	$-128, %r9
	cmpq	$16, %rcx
	jne	.LBB1_9
# BB#7:                                 # %polly.loop_exit87
                                        #   in Loop: Header=BB1_8 Depth=2
	movq	-32(%rsp), %rax         # 8-byte Reload
	incq	%rax
	movq	-24(%rsp), %rcx         # 8-byte Reload
	subq	$-128, %rcx
	cmpq	$16, %rax
	jne	.LBB1_8
# BB#4:                                 # %polly.loop_exit81
                                        #   in Loop: Header=BB1_5 Depth=1
	movq	-40(%rsp), %rcx         # 8-byte Reload
	incq	%rcx
	addq	$65536, -48(%rsp)       # 8-byte Folded Spill
                                        # imm = 0x10000
	cmpq	$16, %rcx
	jne	.LBB1_5
# BB#15:                                # %polly.exiting
	.loc	1 40 1 is_stmt 1        # MatrixMult.c:40:1
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp34:
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
	pushq	%rbp
.Ltmp35:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp36:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp37:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp38:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp39:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp40:
	.cfi_def_cfa_offset 56
	subq	$88, %rsp
.Ltmp41:
	.cfi_def_cfa_offset 144
.Ltmp42:
	.cfi_offset %rbx, -56
.Ltmp43:
	.cfi_offset %r12, -48
.Ltmp44:
	.cfi_offset %r13, -40
.Ltmp45:
	.cfi_offset %r14, -32
.Ltmp46:
	.cfi_offset %r15, -24
.Ltmp47:
	.cfi_offset %rbp, -16
	callq	init
	xorl	%ecx, %ecx
	movl	$C+63488, %edx
.Ltmp48:
	#DEBUG_VALUE: mat_mult:i <- 0
	.loc	1 58 5                  # MatrixMult.c:58:5
	xorps	%xmm0, %xmm0
	movl	$A+4, %eax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB2_2:                                # %polly.loop_preheader56.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_3 Depth 2
	movq	%rdx, %rdi
	movl	$16, %eax
	.p2align	4, 0x90
.LBB2_3:                                # %polly.loop_preheader62.i
                                        #   Parent Loop BB2_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movaps	%xmm0, -63376(%rdi)
	movaps	%xmm0, -63392(%rdi)
	movaps	%xmm0, -63408(%rdi)
	movaps	%xmm0, -63424(%rdi)
	movaps	%xmm0, -63440(%rdi)
	movaps	%xmm0, -63456(%rdi)
	movaps	%xmm0, -63472(%rdi)
	movaps	%xmm0, -63488(%rdi)
	movaps	%xmm0, -61328(%rdi)
	movaps	%xmm0, -61344(%rdi)
	movaps	%xmm0, -61360(%rdi)
	movaps	%xmm0, -61376(%rdi)
	movaps	%xmm0, -61392(%rdi)
	movaps	%xmm0, -61408(%rdi)
	movaps	%xmm0, -61424(%rdi)
	movaps	%xmm0, -61440(%rdi)
	movaps	%xmm0, -59280(%rdi)
	movaps	%xmm0, -59296(%rdi)
	movaps	%xmm0, -59312(%rdi)
	movaps	%xmm0, -59328(%rdi)
	movaps	%xmm0, -59344(%rdi)
	movaps	%xmm0, -59360(%rdi)
	movaps	%xmm0, -59376(%rdi)
	movaps	%xmm0, -59392(%rdi)
	movaps	%xmm0, -57232(%rdi)
	movaps	%xmm0, -57248(%rdi)
	movaps	%xmm0, -57264(%rdi)
	movaps	%xmm0, -57280(%rdi)
	movaps	%xmm0, -57296(%rdi)
	movaps	%xmm0, -57312(%rdi)
	movaps	%xmm0, -57328(%rdi)
	movaps	%xmm0, -57344(%rdi)
	movaps	%xmm0, -55184(%rdi)
	movaps	%xmm0, -55200(%rdi)
	movaps	%xmm0, -55216(%rdi)
	movaps	%xmm0, -55232(%rdi)
	movaps	%xmm0, -55248(%rdi)
	movaps	%xmm0, -55264(%rdi)
	movaps	%xmm0, -55280(%rdi)
	movaps	%xmm0, -55296(%rdi)
	movaps	%xmm0, -53136(%rdi)
	movaps	%xmm0, -53152(%rdi)
	movaps	%xmm0, -53168(%rdi)
	movaps	%xmm0, -53184(%rdi)
	movaps	%xmm0, -53200(%rdi)
	movaps	%xmm0, -53216(%rdi)
	movaps	%xmm0, -53232(%rdi)
	movaps	%xmm0, -53248(%rdi)
	movaps	%xmm0, -51088(%rdi)
	movaps	%xmm0, -51104(%rdi)
	movaps	%xmm0, -51120(%rdi)
	movaps	%xmm0, -51136(%rdi)
	movaps	%xmm0, -51152(%rdi)
	movaps	%xmm0, -51168(%rdi)
	movaps	%xmm0, -51184(%rdi)
	movaps	%xmm0, -51200(%rdi)
	movaps	%xmm0, -49040(%rdi)
	movaps	%xmm0, -49056(%rdi)
	movaps	%xmm0, -49072(%rdi)
	movaps	%xmm0, -49088(%rdi)
	movaps	%xmm0, -49104(%rdi)
	movaps	%xmm0, -49120(%rdi)
	movaps	%xmm0, -49136(%rdi)
	movaps	%xmm0, -49152(%rdi)
	movaps	%xmm0, -46992(%rdi)
	movaps	%xmm0, -47008(%rdi)
	movaps	%xmm0, -47024(%rdi)
	movaps	%xmm0, -47040(%rdi)
	movaps	%xmm0, -47056(%rdi)
	movaps	%xmm0, -47072(%rdi)
	movaps	%xmm0, -47088(%rdi)
	movaps	%xmm0, -47104(%rdi)
	movaps	%xmm0, -44944(%rdi)
	movaps	%xmm0, -44960(%rdi)
	movaps	%xmm0, -44976(%rdi)
	movaps	%xmm0, -44992(%rdi)
	movaps	%xmm0, -45008(%rdi)
	movaps	%xmm0, -45024(%rdi)
	movaps	%xmm0, -45040(%rdi)
	movaps	%xmm0, -45056(%rdi)
	movaps	%xmm0, -42896(%rdi)
	movaps	%xmm0, -42912(%rdi)
	movaps	%xmm0, -42928(%rdi)
	movaps	%xmm0, -42944(%rdi)
	movaps	%xmm0, -42960(%rdi)
	movaps	%xmm0, -42976(%rdi)
	movaps	%xmm0, -42992(%rdi)
	movaps	%xmm0, -43008(%rdi)
	movaps	%xmm0, -40848(%rdi)
	movaps	%xmm0, -40864(%rdi)
	movaps	%xmm0, -40880(%rdi)
	movaps	%xmm0, -40896(%rdi)
	movaps	%xmm0, -40912(%rdi)
	movaps	%xmm0, -40928(%rdi)
	movaps	%xmm0, -40944(%rdi)
	movaps	%xmm0, -40960(%rdi)
	movaps	%xmm0, -38800(%rdi)
	movaps	%xmm0, -38816(%rdi)
	movaps	%xmm0, -38832(%rdi)
	movaps	%xmm0, -38848(%rdi)
	movaps	%xmm0, -38864(%rdi)
	movaps	%xmm0, -38880(%rdi)
	movaps	%xmm0, -38896(%rdi)
	movaps	%xmm0, -38912(%rdi)
	movaps	%xmm0, -36752(%rdi)
	movaps	%xmm0, -36768(%rdi)
	movaps	%xmm0, -36784(%rdi)
	movaps	%xmm0, -36800(%rdi)
	movaps	%xmm0, -36816(%rdi)
	movaps	%xmm0, -36832(%rdi)
	movaps	%xmm0, -36848(%rdi)
	movaps	%xmm0, -36864(%rdi)
	movaps	%xmm0, -34704(%rdi)
	movaps	%xmm0, -34720(%rdi)
	movaps	%xmm0, -34736(%rdi)
	movaps	%xmm0, -34752(%rdi)
	movaps	%xmm0, -34768(%rdi)
	movaps	%xmm0, -34784(%rdi)
	movaps	%xmm0, -34800(%rdi)
	movaps	%xmm0, -34816(%rdi)
	movaps	%xmm0, -32656(%rdi)
	movaps	%xmm0, -32672(%rdi)
	movaps	%xmm0, -32688(%rdi)
	movaps	%xmm0, -32704(%rdi)
	movaps	%xmm0, -32720(%rdi)
	movaps	%xmm0, -32736(%rdi)
	movaps	%xmm0, -32752(%rdi)
	movaps	%xmm0, -32768(%rdi)
	movaps	%xmm0, -30608(%rdi)
	movaps	%xmm0, -30624(%rdi)
	movaps	%xmm0, -30640(%rdi)
	movaps	%xmm0, -30656(%rdi)
	movaps	%xmm0, -30672(%rdi)
	movaps	%xmm0, -30688(%rdi)
	movaps	%xmm0, -30704(%rdi)
	movaps	%xmm0, -30720(%rdi)
	movaps	%xmm0, -28560(%rdi)
	movaps	%xmm0, -28576(%rdi)
	movaps	%xmm0, -28592(%rdi)
	movaps	%xmm0, -28608(%rdi)
	movaps	%xmm0, -28624(%rdi)
	movaps	%xmm0, -28640(%rdi)
	movaps	%xmm0, -28656(%rdi)
	movaps	%xmm0, -28672(%rdi)
	movaps	%xmm0, -26512(%rdi)
	movaps	%xmm0, -26528(%rdi)
	movaps	%xmm0, -26544(%rdi)
	movaps	%xmm0, -26560(%rdi)
	movaps	%xmm0, -26576(%rdi)
	movaps	%xmm0, -26592(%rdi)
	movaps	%xmm0, -26608(%rdi)
	movaps	%xmm0, -26624(%rdi)
	movaps	%xmm0, -24464(%rdi)
	movaps	%xmm0, -24480(%rdi)
	movaps	%xmm0, -24496(%rdi)
	movaps	%xmm0, -24512(%rdi)
	movaps	%xmm0, -24528(%rdi)
	movaps	%xmm0, -24544(%rdi)
	movaps	%xmm0, -24560(%rdi)
	movaps	%xmm0, -24576(%rdi)
	movaps	%xmm0, -22416(%rdi)
	movaps	%xmm0, -22432(%rdi)
	movaps	%xmm0, -22448(%rdi)
	movaps	%xmm0, -22464(%rdi)
	movaps	%xmm0, -22480(%rdi)
	movaps	%xmm0, -22496(%rdi)
	movaps	%xmm0, -22512(%rdi)
	movaps	%xmm0, -22528(%rdi)
	movaps	%xmm0, -20368(%rdi)
	movaps	%xmm0, -20384(%rdi)
	movaps	%xmm0, -20400(%rdi)
	movaps	%xmm0, -20416(%rdi)
	movaps	%xmm0, -20432(%rdi)
	movaps	%xmm0, -20448(%rdi)
	movaps	%xmm0, -20464(%rdi)
	movaps	%xmm0, -20480(%rdi)
	movaps	%xmm0, -18320(%rdi)
	movaps	%xmm0, -18336(%rdi)
	movaps	%xmm0, -18352(%rdi)
	movaps	%xmm0, -18368(%rdi)
	movaps	%xmm0, -18384(%rdi)
	movaps	%xmm0, -18400(%rdi)
	movaps	%xmm0, -18416(%rdi)
	movaps	%xmm0, -18432(%rdi)
	movaps	%xmm0, -16272(%rdi)
	movaps	%xmm0, -16288(%rdi)
	movaps	%xmm0, -16304(%rdi)
	movaps	%xmm0, -16320(%rdi)
	movaps	%xmm0, -16336(%rdi)
	movaps	%xmm0, -16352(%rdi)
	movaps	%xmm0, -16368(%rdi)
	movaps	%xmm0, -16384(%rdi)
	movaps	%xmm0, -14224(%rdi)
	movaps	%xmm0, -14240(%rdi)
	movaps	%xmm0, -14256(%rdi)
	movaps	%xmm0, -14272(%rdi)
	movaps	%xmm0, -14288(%rdi)
	movaps	%xmm0, -14304(%rdi)
	movaps	%xmm0, -14320(%rdi)
	movaps	%xmm0, -14336(%rdi)
	movaps	%xmm0, -12176(%rdi)
	movaps	%xmm0, -12192(%rdi)
	movaps	%xmm0, -12208(%rdi)
	movaps	%xmm0, -12224(%rdi)
	movaps	%xmm0, -12240(%rdi)
	movaps	%xmm0, -12256(%rdi)
	movaps	%xmm0, -12272(%rdi)
	movaps	%xmm0, -12288(%rdi)
	movaps	%xmm0, -10128(%rdi)
	movaps	%xmm0, -10144(%rdi)
	movaps	%xmm0, -10160(%rdi)
	movaps	%xmm0, -10176(%rdi)
	movaps	%xmm0, -10192(%rdi)
	movaps	%xmm0, -10208(%rdi)
	movaps	%xmm0, -10224(%rdi)
	movaps	%xmm0, -10240(%rdi)
	movaps	%xmm0, -8080(%rdi)
	movaps	%xmm0, -8096(%rdi)
	movaps	%xmm0, -8112(%rdi)
	movaps	%xmm0, -8128(%rdi)
	movaps	%xmm0, -8144(%rdi)
	movaps	%xmm0, -8160(%rdi)
	movaps	%xmm0, -8176(%rdi)
	movaps	%xmm0, -8192(%rdi)
	movaps	%xmm0, -6032(%rdi)
	movaps	%xmm0, -6048(%rdi)
	movaps	%xmm0, -6064(%rdi)
	movaps	%xmm0, -6080(%rdi)
	movaps	%xmm0, -6096(%rdi)
	movaps	%xmm0, -6112(%rdi)
	movaps	%xmm0, -6128(%rdi)
	movaps	%xmm0, -6144(%rdi)
	movaps	%xmm0, -3984(%rdi)
	movaps	%xmm0, -4000(%rdi)
	movaps	%xmm0, -4016(%rdi)
	movaps	%xmm0, -4032(%rdi)
	movaps	%xmm0, -4048(%rdi)
	movaps	%xmm0, -4064(%rdi)
	movaps	%xmm0, -4080(%rdi)
	movaps	%xmm0, -4096(%rdi)
	movaps	%xmm0, -1936(%rdi)
	movaps	%xmm0, -1952(%rdi)
	movaps	%xmm0, -1968(%rdi)
	movaps	%xmm0, -1984(%rdi)
	movaps	%xmm0, -2000(%rdi)
	movaps	%xmm0, -2016(%rdi)
	movaps	%xmm0, -2032(%rdi)
	movaps	%xmm0, -2048(%rdi)
	movaps	%xmm0, 112(%rdi)
	movaps	%xmm0, 96(%rdi)
	movaps	%xmm0, 80(%rdi)
	movaps	%xmm0, 64(%rdi)
	movaps	%xmm0, 48(%rdi)
	movaps	%xmm0, 32(%rdi)
	movaps	%xmm0, 16(%rdi)
	movaps	%xmm0, (%rdi)
	subq	$-128, %rdi
	decq	%rax
	jne	.LBB2_3
# BB#1:                                 # %polly.loop_exit57.i
                                        #   in Loop: Header=BB2_2 Depth=1
	incq	%rsi
	addq	$65536, %rdx            # imm = 0x10000
	cmpq	$16, %rsi
	jne	.LBB2_2
	.p2align	4, 0x90
.LBB2_6:                                # %polly.loop_preheader80.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_7 Depth 2
                                        #       Child Loop BB2_10 Depth 3
                                        #         Child Loop BB2_11 Depth 4
                                        #           Child Loop BB2_14 Depth 5
                                        #             Child Loop BB2_12 Depth 6
	movq	%rcx, 48(%rsp)          # 8-byte Spill
	movq	%rcx, %r12
	shlq	$5, %r12
	movl	$B+2048, %ecx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB2_7:                                # %polly.loop_preheader86.i
                                        #   Parent Loop BB2_6 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_10 Depth 3
                                        #         Child Loop BB2_11 Depth 4
                                        #           Child Loop BB2_14 Depth 5
                                        #             Child Loop BB2_12 Depth 6
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	%rcx, 64(%rsp)          # 8-byte Spill
	movq	%rax, %rdi
	shlq	$5, %rdi
	movq	40(%rsp), %r9           # 8-byte Reload
	movq	%rcx, %r13
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB2_10:                               # %polly.loop_preheader92.i
                                        #   Parent Loop BB2_6 Depth=1
                                        #     Parent Loop BB2_7 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB2_11 Depth 4
                                        #           Child Loop BB2_14 Depth 5
                                        #             Child Loop BB2_12 Depth 6
	movq	%rcx, 72(%rsp)          # 8-byte Spill
	movq	%r9, 80(%rsp)           # 8-byte Spill
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB2_11:                               # %polly.loop_preheader98.i
                                        #   Parent Loop BB2_6 Depth=1
                                        #     Parent Loop BB2_7 Depth=2
                                        #       Parent Loop BB2_10 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB2_14 Depth 5
                                        #             Child Loop BB2_12 Depth 6
	leaq	(%rcx,%r12), %r15
	movq	%r13, %r10
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB2_14:                               # %polly.loop_preheader104.i
                                        #   Parent Loop BB2_6 Depth=1
                                        #     Parent Loop BB2_7 Depth=2
                                        #       Parent Loop BB2_10 Depth=3
                                        #         Parent Loop BB2_11 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB2_12 Depth 6
	leaq	(%rdx,%rdi), %rax
	movq	%r15, %rsi
	shlq	$11, %rsi
	leaq	C(%rsi,%rax,4), %rbp
	movl	C(%rsi,%rax,4), %r8d
	movq	%r9, %rbx
	movq	%r10, %rax
	movl	$32, %r11d
	.p2align	4, 0x90
.LBB2_12:                               # %polly.loop_header103.i
                                        #   Parent Loop BB2_6 Depth=1
                                        #     Parent Loop BB2_7 Depth=2
                                        #       Parent Loop BB2_10 Depth=3
                                        #         Parent Loop BB2_11 Depth=4
                                        #           Parent Loop BB2_14 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movl	-2048(%rax), %r14d
.Ltmp49:
	.loc	1 36 45                 # MatrixMult.c:36:45
	imull	-4(%rbx), %r14d
	.loc	1 36 35 is_stmt 0       # MatrixMult.c:36:35
	addl	%r8d, %r14d
.Ltmp50:
	.loc	1 58 5 is_stmt 1        # MatrixMult.c:58:5
	movl	(%rax), %r8d
.Ltmp51:
	.loc	1 36 45                 # MatrixMult.c:36:45
	imull	(%rbx), %r8d
	.loc	1 36 35 is_stmt 0       # MatrixMult.c:36:35
	addl	%r14d, %r8d
.Ltmp52:
	.loc	1 58 5 is_stmt 1        # MatrixMult.c:58:5
	addq	$4096, %rax             # imm = 0x1000
	addq	$8, %rbx
	addq	$-2, %r11
	jne	.LBB2_12
# BB#13:                                # %polly.loop_exit105.i
                                        #   in Loop: Header=BB2_14 Depth=5
	movl	%r8d, (%rbp)
	incq	%rdx
	addq	$4, %r10
	cmpq	$32, %rdx
	jne	.LBB2_14
# BB#8:                                 # %polly.loop_exit99.i
                                        #   in Loop: Header=BB2_11 Depth=4
	incq	%rcx
	addq	$2048, %r9              # imm = 0x800
	cmpq	$32, %rcx
	jne	.LBB2_11
# BB#9:                                 # %polly.loop_exit93.i
                                        #   in Loop: Header=BB2_10 Depth=3
	movq	72(%rsp), %rcx          # 8-byte Reload
	incq	%rcx
	addq	$65536, %r13            # imm = 0x10000
	movq	80(%rsp), %r9           # 8-byte Reload
	subq	$-128, %r9
	cmpq	$16, %rcx
	jne	.LBB2_10
# BB#4:                                 # %polly.loop_exit87.i
                                        #   in Loop: Header=BB2_7 Depth=2
	movq	56(%rsp), %rax          # 8-byte Reload
	incq	%rax
	movq	64(%rsp), %rcx          # 8-byte Reload
	subq	$-128, %rcx
	cmpq	$16, %rax
	jne	.LBB2_7
# BB#5:                                 # %polly.loop_exit81.i
                                        #   in Loop: Header=BB2_6 Depth=1
	movq	48(%rsp), %rcx          # 8-byte Reload
	incq	%rcx
	addq	$65536, 40(%rsp)        # 8-byte Folded Spill
                                        # imm = 0x10000
	cmpq	$16, %rcx
	jne	.LBB2_6
# BB#15:                                # %mat_mult.exit
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
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp53:
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
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
	.asciz	"mat_mult"              # string offset=279
.Linfo_string11:
	.asciz	"i"                     # string offset=288
.Linfo_string12:
	.asciz	"j"                     # string offset=290
.Linfo_string13:
	.asciz	"k"                     # string offset=292
.Linfo_string14:
	.asciz	"init"                  # string offset=294
.Linfo_string15:
	.asciz	"main"                  # string offset=299
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
	.byte	11                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	13                      # DW_FORM_sdata
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	12                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	49                      # DW_AT_abstract_origin
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
	.long	331                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x144 DW_TAG_compile_unit
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
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	8                       # Abbrev [8] 0xbc:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0xc8:0xb DW_TAG_variable
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	10                      # Abbrev [10] 0xd4:0x24 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	248                     # DW_AT_abstract_origin
	.byte	11                      # Abbrev [11] 0xe7:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	256                     # DW_AT_abstract_origin
	.byte	12                      # Abbrev [12] 0xed:0x5 DW_TAG_variable
	.long	267                     # DW_AT_abstract_origin
	.byte	12                      # Abbrev [12] 0xf2:0x5 DW_TAG_variable
	.long	278                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	13                      # Abbrev [13] 0xf8:0x2a DW_TAG_subprogram
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	30                      # DW_AT_decl_line
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	1                       # DW_AT_inline
	.byte	9                       # Abbrev [9] 0x100:0xb DW_TAG_variable
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x10b:0xb DW_TAG_variable
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x116:0xb DW_TAG_variable
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	14                      # Abbrev [14] 0x122:0x2c DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
                                        # DW_AT_APPLE_omit_frame_ptr
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	55                      # DW_AT_decl_line
	.long	83                      # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_APPLE_optimized
	.byte	15                      # Abbrev [15] 0x13b:0x12 DW_TAG_inlined_subroutine
	.long	248                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	58                      # DW_AT_call_line
	.byte	11                      # Abbrev [11] 0x146:0x6 DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	256                     # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
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
	.long	335                     # Compilation Unit Length
	.long	42                      # DIE offset
	.asciz	"A"                     # External Name
	.long	97                      # DIE offset
	.asciz	"B"                     # External Name
	.long	118                     # DIE offset
	.asciz	"C"                     # External Name
	.long	248                     # DIE offset
	.asciz	"mat_mult"              # External Name
	.long	139                     # DIE offset
	.asciz	"R"                     # External Name
	.long	290                     # DIE offset
	.asciz	"main"                  # External Name
	.long	167                     # DIE offset
	.asciz	"init"                  # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	335                     # Compilation Unit Length
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
