	.text
	.file	"MatrixMult.vector.ll"
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
.Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp2:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$392, %rsp              # imm = 0x188
.Ltmp3:
	.cfi_offset %rbx, -56
.Ltmp4:
	.cfi_offset %r12, -48
.Ltmp5:
	.cfi_offset %r13, -40
.Ltmp6:
	.cfi_offset %r14, -32
.Ltmp7:
	.cfi_offset %r15, -24
	#DEBUG_VALUE: init:value <- %EDI
	#DEBUG_VALUE: init:width <- %ESI
	#DEBUG_VALUE: init:height <- %EDX
	movl	%edx, %r14d
.Ltmp8:
	#DEBUG_VALUE: init:height <- %R14D
	movl	%r14d, -76(%rbp)        # 4-byte Spill
	movq	%rsi, -104(%rbp)        # 8-byte Spill
	movl	%edi, %ebx
.Ltmp9:
	#DEBUG_VALUE: init:value <- %EBX
	.loc	1 15 49 prologue_end    # MatrixMult.c:15:49
	movl	%r14d, %eax
	imull	%esi, %eax
.Ltmp10:
	#DEBUG_VALUE: init:width <- [%RBP+-104]
	.loc	1 15 43 is_stmt 0       # MatrixMult.c:15:43
	movslq	%eax, %rdi
	.loc	1 15 55                 # MatrixMult.c:15:55
	shlq	$2, %rdi
	.loc	1 15 36                 # MatrixMult.c:15:36
	callq	malloc
	movq	%rax, -120(%rbp)        # 8-byte Spill
.Ltmp11:
	#DEBUG_VALUE: init:i <- 0
	.loc	1 16 5 is_stmt 1 discriminator 1 # MatrixMult.c:16:5
	testl	%r14d, %r14d
.Ltmp12:
	#DEBUG_VALUE: init:height <- [%RBP+-76]
	jle	.LBB0_37
.Ltmp13:
# BB#1:                                 # %for.cond3.preheader.lr.ph
	#DEBUG_VALUE: init:height <- [%RBP+-76]
	#DEBUG_VALUE: init:width <- [%RBP+-104]
	#DEBUG_VALUE: init:value <- %EBX
	movslq	-76(%rbp), %rax         # 4-byte Folded Reload
	movq	%rax, -248(%rbp)        # 8-byte Spill
	decq	%rax
	sarq	$5, %rax
	movq	%rax, -264(%rbp)        # 8-byte Spill
	js	.LBB0_37
.Ltmp14:
# BB#2:                                 # %polly.loop_preheader
	#DEBUG_VALUE: init:value <- %EBX
	#DEBUG_VALUE: init:width <- [%RBP+-104]
	#DEBUG_VALUE: init:height <- [%RBP+-76]
	movq	-104(%rbp), %rax        # 8-byte Reload
	movslq	%eax, %r11
	movq	%r11, -200(%rbp)        # 8-byte Spill
	leaq	(,%r11,4), %rdx
	movq	%rdx, -144(%rbp)        # 8-byte Spill
	leaq	-1(%r11), %rcx
	sarq	$5, %rcx
	movq	%rcx, -176(%rbp)        # 8-byte Spill
	movq	%r11, %rcx
	shrq	$2, %rcx
	movq	%rcx, -152(%rbp)        # 8-byte Spill
	decq	%rcx
	movq	%rcx, -304(%rbp)        # 8-byte Spill
	movl	%eax, %r10d
	andl	$3, %r10d
	movq	%r10, -360(%rbp)        # 8-byte Spill
	leaq	-1(%r10), %rax
	movq	%rax, -72(%rbp)         # 8-byte Spill
	movq	-120(%rbp), %rcx        # 8-byte Reload
	leaq	4(%rcx), %rax
	movq	%rax, -288(%rbp)        # 8-byte Spill
	leaq	8(%rcx), %rax
	movq	%rax, -280(%rbp)        # 8-byte Spill
	leaq	12(%rcx), %rdi
	movq	%rdi, -272(%rbp)        # 8-byte Spill
	leaq	(,%r10,4), %rax
	subq	%rax, %rdx
	addq	%rcx, %rdx
	movq	%rdx, -296(%rbp)        # 8-byte Spill
	movq	%r11, %rax
	shlq	$7, %rax
	movq	%rax, -256(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -112(%rbp)        # 8-byte Spill
	movabsq	$2305843009213693952, %r9 # imm = 0x2000000000000000
	movq	%rdi, -168(%rbp)        # 8-byte Spill
	movq	%rdx, -128(%rbp)        # 8-byte Spill
.Ltmp15:
	.p2align	4, 0x90
.LBB0_3:                                # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
                                        #       Child Loop BB0_39 Depth 3
                                        #         Child Loop BB0_44 Depth 4
                                        #         Child Loop BB0_66 Depth 4
                                        #         Child Loop BB0_59 Depth 4
                                        #         Child Loop BB0_62 Depth 4
                                        #       Child Loop BB0_8 Depth 3
                                        #         Child Loop BB0_14 Depth 4
                                        #         Child Loop BB0_77 Depth 4
                                        #         Child Loop BB0_19 Depth 4
                                        #         Child Loop BB0_74 Depth 4
                                        #         Child Loop BB0_32 Depth 4
                                        #         Child Loop BB0_70 Depth 4
	cmpq	$0, -176(%rbp)          # 8-byte Folded Reload
	js	.LBB0_36
# BB#4:                                 # %polly.loop_header5.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	movq	%r11, %rcx
	movq	-112(%rbp), %rax        # 8-byte Reload
	imulq	%rax, %rcx
	movq	%rcx, -88(%rbp)         # 8-byte Spill
	movq	%rax, %rcx
	shlq	$5, %rcx
	movq	%rcx, -320(%rbp)        # 8-byte Spill
	movq	-248(%rbp), %rdx        # 8-byte Reload
	subq	%rcx, %rdx
	decq	%rdx
	cmpq	$31, %rdx
	movl	$31, %ecx
	cmovgq	%rcx, %rdx
	movq	%rdx, -312(%rbp)        # 8-byte Spill
	leaq	-1(%rdx), %rcx
	movq	%rcx, -208(%rbp)        # 8-byte Spill
	shlq	$7, %rax
	movq	%rax, -192(%rbp)        # 8-byte Spill
	movq	-168(%rbp), %rax        # 8-byte Reload
	movq	%rax, -184(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_5:                                # %polly.loop_header5
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_39 Depth 3
                                        #         Child Loop BB0_44 Depth 4
                                        #         Child Loop BB0_66 Depth 4
                                        #         Child Loop BB0_59 Depth 4
                                        #         Child Loop BB0_62 Depth 4
                                        #       Child Loop BB0_8 Depth 3
                                        #         Child Loop BB0_14 Depth 4
                                        #         Child Loop BB0_77 Depth 4
                                        #         Child Loop BB0_19 Depth 4
                                        #         Child Loop BB0_74 Depth 4
                                        #         Child Loop BB0_32 Depth 4
                                        #         Child Loop BB0_70 Depth 4
	movq	%rax, -136(%rbp)        # 8-byte Spill
	cmpq	$0, -312(%rbp)          # 8-byte Folded Reload
	js	.LBB0_35
# BB#6:                                 # %polly.loop_header14.preheader
                                        #   in Loop: Header=BB0_5 Depth=2
	movq	-136(%rbp), %rcx        # 8-byte Reload
	leaq	(,%rcx,8), %rax
	movq	%rax, -160(%rbp)        # 8-byte Spill
	movq	-304(%rbp), %rdx        # 8-byte Reload
	subq	%rax, %rdx
	cmpq	$7, %rdx
	movl	$7, %eax
	cmovgq	%rax, %rdx
	movq	%rcx, %rax
	shlq	$5, %rax
	movq	%rax, -376(%rbp)        # 8-byte Spill
	leaq	31(%rax), %rax
	testq	%rdx, %rdx
	js	.LBB0_34
# BB#7:                                 # %polly.loop_preheader32.preheader.us.preheader
                                        #   in Loop: Header=BB0_5 Depth=2
	decq	%rdx
	movq	%rdx, -368(%rbp)        # 8-byte Spill
	cmpq	%r11, %rax
	setl	%al
	testq	%r10, %r10
	sete	%dl
	orb	%al, %dl
	movb	%dl, -41(%rbp)          # 1-byte Spill
	shlq	$7, %rcx
	movq	-120(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	movq	%rax, -344(%rbp)        # 8-byte Spill
	movq	-288(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	movq	%rax, -336(%rbp)        # 8-byte Spill
	movq	-280(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	movq	%rax, -328(%rbp)        # 8-byte Spill
	addq	-272(%rbp), %rcx        # 8-byte Folded Reload
	movq	%rcx, -352(%rbp)        # 8-byte Spill
	movq	-128(%rbp), %rsi        # 8-byte Reload
	movq	-184(%rbp), %rax        # 8-byte Reload
	movq	%rax, -96(%rbp)         # 8-byte Spill
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_8:                                # %polly.split_new_and_old189
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_14 Depth 4
                                        #         Child Loop BB0_77 Depth 4
                                        #         Child Loop BB0_19 Depth 4
                                        #         Child Loop BB0_74 Depth 4
                                        #         Child Loop BB0_32 Depth 4
                                        #         Child Loop BB0_70 Depth 4
	movq	%rax, -224(%rbp)        # 8-byte Spill
	movq	%rsi, -400(%rbp)        # 8-byte Spill
	movq	%r11, %rdi
	imulq	%rax, %rdi
	movq	%rdi, -384(%rbp)        # 8-byte Spill
	movabsq	$72057594037927935, %rax # imm = 0xFFFFFFFFFFFFFF
	movq	%rax, %rdx
	movq	-136(%rbp), %r15        # 8-byte Reload
	cmpq	%rdx, %r15
	setle	%r8b
	leaq	1(,%r15,8), %rcx
	movq	-152(%rbp), %r13        # 8-byte Reload
	cmpq	%rcx, %r13
	setge	%cl
	andb	%r8b, %cl
	leaq	-1(%r9), %rax
	movq	%rax, -216(%rbp)        # 8-byte Spill
	cmpq	%rax, %rdi
	setle	%al
	movb	%al, -60(%rbp)          # 1-byte Spill
	andb	%al, %cl
	movabsq	$-2305843009213693952, %rax # imm = 0xE000000000000000
	movq	%rax, %r11
	cmpq	%r11, %rdi
	setge	%r10b
	movq	-88(%rbp), %rax         # 8-byte Reload
	leaq	(%r15,%rax), %rsi
	cmpq	%rdx, %rsi
	setle	%dl
	andb	%r10b, %dl
	movb	%dl, -61(%rbp)          # 1-byte Spill
	andb	%dl, %cl
	movabsq	$-72057594037927936, %rdx # imm = 0xFF00000000000000
	cmpq	%rdx, %rax
	setge	%dl
	movb	%dl, -59(%rbp)          # 1-byte Spill
	andb	%dl, %cl
	leaq	(%rdi,%r13,4), %rsi
	movq	%rax, %rdx
	shlq	$5, %rdx
	movq	%rdx, -392(%rbp)        # 8-byte Spill
	leaq	(%rsi,%rdx), %r12
	cmpq	%r9, %r12
	setle	%al
	andb	%cl, %al
	movb	%al, -58(%rbp)          # 1-byte Spill
	movq	-376(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%rdi), %rcx
	addq	%rdx, %rcx
	cmpq	%r11, %rcx
	setge	-57(%rbp)               # 1-byte Folded Spill
	cmpq	%r13, -160(%rbp)        # 8-byte Folded Reload
	setge	%r14b
	leaq	-4(%r9), %rdx
	cmpq	%rdx, %rcx
	setle	-56(%rbp)               # 1-byte Folded Spill
	leaq	4(%r9), %rdx
	cmpq	%rdx, %r12
	setge	%r10b
	leaq	-32(%r9), %rdx
	cmpq	%rdx, %rcx
	setle	-55(%rbp)               # 1-byte Folded Spill
	leaq	9(,%r15,8), %rcx
	cmpq	%rcx, %r13
	setge	-53(%rbp)               # 1-byte Folded Spill
	movabsq	$1152921504606846976, %rcx # imm = 0x1000000000000000
	leaq	(%rcx,%r15,8), %rcx
	cmpq	%r13, %rcx
	setge	-52(%rbp)               # 1-byte Folded Spill
	leaq	35(%rax), %rcx
	cmpq	%rcx, %rsi
	setge	-54(%rbp)               # 1-byte Folded Spill
	leaq	3(%r11), %rcx
	cmpq	%rcx, %rdi
	setge	-50(%rbp)               # 1-byte Folded Spill
	movabsq	$4611686018427387905, %rcx # imm = 0x4000000000000001
	movq	%rcx, %r13
	leaq	2(%r13), %rcx
	cmpq	%rcx, %rsi
	setle	-49(%rbp)               # 1-byte Folded Spill
	leaq	3(%r9), %rcx
	cmpq	%rcx, %r12
	sete	-51(%rbp)               # 1-byte Folded Spill
	leaq	34(%rax), %rcx
	cmpq	%rcx, %rsi
	setge	-48(%rbp)               # 1-byte Folded Spill
	leaq	-2(%r9), %rcx
	cmpq	%rcx, %rdi
	setle	-47(%rbp)               # 1-byte Folded Spill
	leaq	2(%r11), %rcx
	cmpq	%rcx, %rdi
	setge	%r15b
	leaq	1(%r13), %rdx
	cmpq	%rdx, %rsi
	setle	-46(%rbp)               # 1-byte Folded Spill
	leaq	2(%r9), %rdx
	cmpq	%rdx, %r12
	leaq	33(%rax), %rdx
	movb	-60(%rbp), %al          # 1-byte Reload
	sete	-45(%rbp)               # 1-byte Folded Spill
	cmpq	%rdx, %rsi
	leaq	-3(%r9), %rdx
	setge	-44(%rbp)               # 1-byte Folded Spill
	cmpq	%rdx, %rdi
	leaq	1(%r11), %rdx
	setle	-43(%rbp)               # 1-byte Folded Spill
	cmpq	%rdx, %rdi
	setge	%r11b
	cmpq	%r13, %rsi
	leaq	1(%r9), %rdx
	movq	%r9, %r13
	movb	-59(%rbp), %r9b         # 1-byte Reload
	movb	-61(%rbp), %dil         # 1-byte Reload
	setle	-42(%rbp)               # 1-byte Folded Spill
	cmpq	%rdx, %r12
	movb	-57(%rbp), %cl          # 1-byte Reload
	sete	%r12b
	testb	-58(%rbp), %cl          # 1-byte Folded Reload
	movq	-368(%rbp), %rsi        # 8-byte Reload
	jne	.LBB0_76
# BB#9:                                 # %polly.split_new_and_old189
                                        #   in Loop: Header=BB0_8 Depth=3
	andb	%r8b, %r14b
	andb	%al, %r14b
	andb	%dil, %r14b
	andb	%r9b, %r14b
	movb	-56(%rbp), %dl          # 1-byte Reload
	andb	%cl, %dl
	andb	%r14b, %dl
	jne	.LBB0_76
# BB#10:                                # %polly.split_new_and_old189
                                        #   in Loop: Header=BB0_8 Depth=3
	movb	%r8b, %dl
	andb	%al, %dl
	andb	%dil, %dl
	andb	%r9b, %dl
	andb	-55(%rbp), %r10b        # 1-byte Folded Reload
	andb	%dl, %r10b
	andb	%cl, %r10b
	jne	.LBB0_76
# BB#11:                                # %polly.split_new_and_old189
                                        #   in Loop: Header=BB0_8 Depth=3
	andb	-53(%rbp), %r8b         # 1-byte Folded Reload
	andb	-52(%rbp), %r8b         # 1-byte Folded Reload
	movb	-50(%rbp), %dl          # 1-byte Reload
	andb	%r8b, %dl
	movb	-54(%rbp), %cl          # 1-byte Reload
	andb	%dl, %cl
	andb	-49(%rbp), %al          # 1-byte Folded Reload
	andb	%cl, %al
	andb	-51(%rbp), %al          # 1-byte Folded Reload
	jne	.LBB0_76
# BB#12:                                # %polly.split_new_and_old189
                                        #   in Loop: Header=BB0_8 Depth=3
	movb	-47(%rbp), %cl          # 1-byte Reload
	andb	%r8b, %cl
	movb	-48(%rbp), %al          # 1-byte Reload
	andb	%cl, %al
	andb	-46(%rbp), %r15b        # 1-byte Folded Reload
	andb	%al, %r15b
	andb	-45(%rbp), %r15b        # 1-byte Folded Reload
	jne	.LBB0_76
# BB#13:                                # %polly.split_new_and_old189
                                        #   in Loop: Header=BB0_8 Depth=3
	andb	-43(%rbp), %r8b         # 1-byte Folded Reload
	movb	-44(%rbp), %al          # 1-byte Reload
	andb	%r8b, %al
	andb	-42(%rbp), %r11b        # 1-byte Folded Reload
	andb	%al, %r11b
	andb	%r12b, %r11b
	movq	$-1, %rax
	movq	-96(%rbp), %rcx         # 8-byte Reload
	jne	.LBB0_76
	.p2align	4, 0x90
.LBB0_14:                               # %polly.loop_preheader32.us
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_5 Depth=2
                                        #       Parent Loop BB0_8 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	%ebx, -12(%rcx)
	movl	%ebx, -8(%rcx)
	movl	%ebx, -4(%rcx)
	movl	%ebx, (%rcx)
	incq	%rax
	addq	$16, %rcx
	cmpq	%rsi, %rax
	jle	.LBB0_14
	jmp	.LBB0_15
	.p2align	4, 0x90
.LBB0_76:                               # %polly.loop_if193
                                        #   in Loop: Header=BB0_8 Depth=3
	movq	-152(%rbp), %rcx        # 8-byte Reload
	subq	-160(%rbp), %rcx        # 8-byte Folded Reload
	decq	%rcx
	cmpq	$6, %rcx
	movl	$7, %eax
	cmovleq	%rcx, %rax
	movq	$-1, %rcx
	testq	%rax, %rax
	movq	-96(%rbp), %rdx         # 8-byte Reload
	js	.LBB0_78
	.p2align	4, 0x90
.LBB0_77:                               # %polly.stmt.polly.loop_preheader32.us
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_5 Depth=2
                                        #       Parent Loop BB0_8 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	incq	%rcx
	movl	%ebx, -12(%rdx)
	movl	%ebx, -8(%rdx)
	movl	%ebx, -4(%rdx)
	movl	%ebx, (%rdx)
	leaq	-1(%rax), %rsi
	addq	$16, %rdx
	cmpq	%rsi, %rcx
	jle	.LBB0_77
.LBB0_78:                               # %polly.cond221
                                        #   in Loop: Header=BB0_8 Depth=3
	movq	-160(%rbp), %rax        # 8-byte Reload
	cmpq	-152(%rbp), %rax        # 8-byte Folded Reload
	jl	.LBB0_15
# BB#79:                                # %polly.stmt.polly.loop_preheader32.us225
                                        #   in Loop: Header=BB0_8 Depth=3
	movq	-192(%rbp), %rax        # 8-byte Reload
	movq	-224(%rbp), %rcx        # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	imulq	-200(%rbp), %rax        # 8-byte Folded Reload
	movq	-344(%rbp), %rcx        # 8-byte Reload
	movl	%ebx, (%rcx,%rax)
	movq	-336(%rbp), %rcx        # 8-byte Reload
	movl	%ebx, (%rcx,%rax)
	movq	-328(%rbp), %rcx        # 8-byte Reload
	movl	%ebx, (%rcx,%rax)
	movq	-352(%rbp), %rcx        # 8-byte Reload
	movl	%ebx, (%rcx,%rax)
.LBB0_15:                               # %polly.cond.loopexit.us
                                        #   in Loop: Header=BB0_8 Depth=3
	cmpb	$0, -41(%rbp)           # 1-byte Folded Reload
	movq	-200(%rbp), %r11        # 8-byte Reload
	movq	-360(%rbp), %r10        # 8-byte Reload
	movq	%r13, %r9
	movq	-400(%rbp), %rsi        # 8-byte Reload
	jne	.LBB0_33
# BB#16:                                # %polly.split_new_and_old168
                                        #   in Loop: Header=BB0_8 Depth=3
	testq	%r10, %r10
	setg	%al
	movq	-384(%rbp), %r13        # 8-byte Reload
	cmpq	-216(%rbp), %r13        # 8-byte Folded Reload
	setle	%cl
	movabsq	$-2305843009213693952, %rdx # imm = 0xE000000000000000
	cmpq	%rdx, %r13
	setge	%dl
	andb	%al, %dl
	andb	%cl, %dl
	movabsq	$72057594037927935, %rax # imm = 0xFFFFFFFFFFFFFF
	movq	-88(%rbp), %rdi         # 8-byte Reload
	cmpq	%rax, %rdi
	setle	%al
	movabsq	$-72057594037927936, %rcx # imm = 0xFF00000000000000
	cmpq	%rcx, %rdi
	setge	%cl
	andb	%al, %cl
	andb	%dl, %cl
	leaq	-1(%r10,%r9), %rax
	movq	-392(%rbp), %rdi        # 8-byte Reload
	leaq	(%rdi,%r11), %rdx
	cmpq	%rdx, %rax
	setge	%al
	andb	%cl, %al
	addq	%r9, %rdx
	cmpq	%r10, %rdx
	setge	%cl
	andb	%al, %cl
	leaq	(%r13,%rdi), %r14
	leaq	(%r14,%r11), %rax
	leaq	(%rax,%r9), %rdx
	cmpq	%r10, %rdx
	setge	%dl
	andb	%cl, %dl
	cmpq	%r9, %rax
	setle	%al
	testb	%al, %dl
	jne	.LBB0_73
# BB#17:                                # %polly.split_new_and_old168
                                        #   in Loop: Header=BB0_8 Depth=3
	testq	%r10, %r10
	je	.LBB0_73
# BB#18:                                # %polly.stmt.for.body648.us.preheader
                                        #   in Loop: Header=BB0_8 Depth=3
	movq	%rdi, %r8
	movq	%rsi, %rcx
	movl	$0, %eax
	movq	-72(%rbp), %rdx         # 8-byte Reload
	je	.LBB0_20
	.p2align	4, 0x90
.LBB0_19:                               # %polly.stmt.for.body648.us.prol
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_5 Depth=2
                                        #       Parent Loop BB0_8 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	%ebx, (%rcx)
	incq	%rax
	addq	$4, %rcx
	cmpq	%rax, %r10
	jne	.LBB0_19
	jmp	.LBB0_20
	.p2align	4, 0x90
.LBB0_73:                               # %polly.loop_if172
                                        #   in Loop: Header=BB0_8 Depth=3
	movq	$0, -240(%rbp)
	testq	%r10, %r10
	movl	$1, %eax
	movq	-72(%rbp), %rdx         # 8-byte Reload
	jle	.LBB0_71
	.p2align	4, 0x90
.LBB0_74:                               # %polly.stmt.polly.stmt.for.body648.us.prol
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_5 Depth=2
                                        #       Parent Loop BB0_8 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	%ebx, -4(%rsi,%rax,4)
	movq	%rax, -424(%rbp)
	leaq	1(%rax), %rcx
	decq	%rax
	cmpq	%rdx, %rax
	movq	%rcx, %rax
	jl	.LBB0_74
.LBB0_71:                               # %polly.cond185
                                        #   in Loop: Header=BB0_8 Depth=3
	movq	%rdi, %r8
	testq	%r10, %r10
	jle	.LBB0_72
# BB#75:                                # %polly.stmt.polly.stmt.for.body648.us.preheader.split.loopexit
                                        #   in Loop: Header=BB0_8 Depth=3
	movq	-424(%rbp), %rax
	movq	%rax, -240(%rbp)
	movq	-240(%rbp), %rax
	jmp	.LBB0_20
.LBB0_72:                               # %polly.exiting171
                                        #   in Loop: Header=BB0_8 Depth=3
	movq	-240(%rbp), %rax
.LBB0_20:                               # %polly.stmt.for.body648.us.preheader.split
                                        #   in Loop: Header=BB0_8 Depth=3
	movq	%rdx, -72(%rbp)         # 8-byte Spill
	cmpq	$3, %rdx
	jb	.LBB0_33
# BB#21:                                # %polly.split_new_and_old134
                                        #   in Loop: Header=BB0_8 Depth=3
	leaq	(%rax,%r9), %rcx
	cmpq	%r10, %rcx
	jl	.LBB0_32
# BB#22:                                # %polly.split_new_and_old134
                                        #   in Loop: Header=BB0_8 Depth=3
	leaq	(%rax,%r11), %rcx
	leaq	(%rcx,%r9), %rdx
	cmpq	%r10, %rdx
	jl	.LBB0_32
# BB#23:                                # %polly.split_new_and_old134
                                        #   in Loop: Header=BB0_8 Depth=3
	cmpq	-216(%rbp), %r13        # 8-byte Folded Reload
	jg	.LBB0_32
# BB#24:                                # %polly.split_new_and_old134
                                        #   in Loop: Header=BB0_8 Depth=3
	movabsq	$-2305843009213693952, %rdx # imm = 0xE000000000000000
	cmpq	%rdx, %r13
	jl	.LBB0_32
# BB#25:                                # %polly.split_new_and_old134
                                        #   in Loop: Header=BB0_8 Depth=3
	movabsq	$72057594037927935, %rdx # imm = 0xFFFFFFFFFFFFFF
	cmpq	%rdx, -88(%rbp)         # 8-byte Folded Reload
	jg	.LBB0_32
# BB#26:                                # %polly.split_new_and_old134
                                        #   in Loop: Header=BB0_8 Depth=3
	leaq	-4(%r9,%r10), %rdx
	cmpq	%r14, %rdx
	jl	.LBB0_32
# BB#27:                                # %polly.split_new_and_old134
                                        #   in Loop: Header=BB0_8 Depth=3
	leaq	(%r11,%r13), %rdx
	addq	%r8, %rdx
	cmpq	%r9, %rdx
	jg	.LBB0_32
# BB#28:                                # %polly.split_new_and_old134
                                        #   in Loop: Header=BB0_8 Depth=3
	movabsq	$-2305843009213693952, %rdx # imm = 0xE000000000000000
	cmpq	%rdx, %r14
	jl	.LBB0_32
# BB#29:                                # %polly.split_new_and_old134
                                        #   in Loop: Header=BB0_8 Depth=3
	addq	%r13, %rcx
	addq	%r8, %rcx
	addq	%r9, %rcx
	cmpq	%r10, %rcx
	jl	.LBB0_32
# BB#30:                                # %polly.split_new_and_old134
                                        #   in Loop: Header=BB0_8 Depth=3
	leaq	1(%r8,%r9), %rcx
	cmpq	%r10, %rcx
	jl	.LBB0_32
# BB#31:                                # %polly.split_new_and_old134
                                        #   in Loop: Header=BB0_8 Depth=3
	leaq	1(%r9,%r14), %rcx
	cmpq	%r10, %rcx
	jl	.LBB0_32
# BB#68:                                # %polly.cond138
                                        #   in Loop: Header=BB0_8 Depth=3
	movl	%eax, %ecx
	subl	%r10d, %ecx
	testb	$3, %cl
	jne	.LBB0_33
# BB#69:                                # %polly.loop_if144
                                        #   in Loop: Header=BB0_8 Depth=3
	movq	%r10, %r8
	subq	%rax, %r8
	sarq	$2, %r8
	movq	$-1, %rdx
	testq	%r8, %r8
	jle	.LBB0_33
	.p2align	4, 0x90
.LBB0_70:                               # %polly.stmt.polly.stmt.for.body648.us
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_5 Depth=2
                                        #       Parent Loop BB0_8 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	%ebx, (%rsi,%rax,4)
	movl	%ebx, 4(%rsi,%rax,4)
	movl	%ebx, 8(%rsi,%rax,4)
	movl	%ebx, 12(%rsi,%rax,4)
	leaq	-1(%r8), %rcx
	incq	%rdx
	addq	$4, %rax
	cmpq	%rcx, %rdx
	jl	.LBB0_70
	jmp	.LBB0_33
	.p2align	4, 0x90
.LBB0_32:                               # %polly.stmt.for.body648.us
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_5 Depth=2
                                        #       Parent Loop BB0_8 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	%ebx, (%rsi,%rax,4)
	movl	%ebx, 4(%rsi,%rax,4)
	movl	%ebx, 8(%rsi,%rax,4)
	movl	%ebx, 12(%rsi,%rax,4)
	addq	$4, %rax
	cmpq	%rax, %r10
	jne	.LBB0_32
	.p2align	4, 0x90
.LBB0_33:                               # %polly.merge.us
                                        #   in Loop: Header=BB0_8 Depth=3
	movq	-144(%rbp), %rax        # 8-byte Reload
	addq	%rax, -96(%rbp)         # 8-byte Folded Spill
	addq	%rax, %rsi
	movq	-224(%rbp), %rax        # 8-byte Reload
	cmpq	-208(%rbp), %rax        # 8-byte Folded Reload
	leaq	1(%rax), %rax
	jle	.LBB0_8
	jmp	.LBB0_35
	.p2align	4, 0x90
.LBB0_34:                               # %polly.loop_header14.preheader.split
                                        #   in Loop: Header=BB0_5 Depth=2
	cmpq	%r11, %rax
	movq	-128(%rbp), %r12        # 8-byte Reload
	movl	$0, %r14d
	jl	.LBB0_35
	.p2align	4, 0x90
.LBB0_39:                               # %polly.then
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_44 Depth 4
                                        #         Child Loop BB0_66 Depth 4
                                        #         Child Loop BB0_59 Depth 4
                                        #         Child Loop BB0_62 Depth 4
	movq	%r11, %rax
	movq	%r9, %r11
	movq	%rax, %r15
	movq	%rax, %rsi
	imulq	%r14, %r15
	testq	%r10, %r10
	je	.LBB0_38
# BB#40:                                # %polly.split_new_and_old113
                                        #   in Loop: Header=BB0_39 Depth=3
	setg	%cl
	leaq	-1(%r11), %rax
	movq	%rax, -96(%rbp)         # 8-byte Spill
	cmpq	%rax, %r15
	setle	%al
	andb	%cl, %al
	movabsq	$-2305843009213693952, %rcx # imm = 0xE000000000000000
	cmpq	%rcx, %r15
	setge	%dil
	movabsq	$72057594037927935, %rcx # imm = 0xFFFFFFFFFFFFFF
	movq	-88(%rbp), %rdx         # 8-byte Reload
	cmpq	%rcx, %rdx
	setle	%cl
	andb	%dil, %cl
	andb	%al, %cl
	movabsq	$-72057594037927936, %rax # imm = 0xFF00000000000000
	cmpq	%rax, %rdx
	setge	%r8b
	leaq	-1(%r10,%r11), %rdi
	movq	%rdx, %r9
	shlq	$5, %r9
	movq	%rsi, %r13
	leaq	(%r9,%r13), %rsi
	cmpq	%rsi, %rdi
	setge	%al
	andb	%r8b, %al
	addq	%r11, %rsi
	cmpq	%r10, %rsi
	setge	%dl
	andb	%al, %dl
	andb	%cl, %dl
	leaq	(%r15,%r9), %r8
	leaq	(%r8,%r13), %rax
	movq	%r13, %rsi
	leaq	(%rax,%r11), %rcx
	cmpq	%r10, %rcx
	setge	%cl
	andb	%dl, %cl
	cmpq	%r11, %rax
	setle	%al
	testb	%al, %cl
	jne	.LBB0_65
# BB#41:                                # %polly.split_new_and_old113
                                        #   in Loop: Header=BB0_39 Depth=3
	testq	%r10, %r10
	je	.LBB0_65
# BB#42:                                # %polly.stmt.for.body648.preheader
                                        #   in Loop: Header=BB0_39 Depth=3
	movq	-320(%rbp), %rax        # 8-byte Reload
	leaq	(%r14,%rax), %r13
	imulq	-144(%rbp), %r13        # 8-byte Folded Reload
	testq	%r10, %r10
	movq	%r12, %rcx
	movl	$0, %edi
	je	.LBB0_43
	.p2align	4, 0x90
.LBB0_44:                               # %polly.stmt.for.body648.prol
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_5 Depth=2
                                        #       Parent Loop BB0_39 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	%ebx, (%rcx)
	incq	%rdi
	addq	$4, %rcx
	cmpq	%rdi, %r10
	jne	.LBB0_44
	jmp	.LBB0_45
	.p2align	4, 0x90
.LBB0_65:                               # %polly.loop_if117
                                        #   in Loop: Header=BB0_39 Depth=3
	movq	-192(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%r14,4), %rax
	imulq	%rsi, %rax
	movq	%rax, -408(%rbp)
	movq	$0, -232(%rbp)
	testq	%r10, %r10
	movl	$1, %ecx
	movq	-72(%rbp), %rdx         # 8-byte Reload
	jle	.LBB0_63
	.p2align	4, 0x90
.LBB0_66:                               # %polly.stmt.polly.stmt.for.body648.prol
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_5 Depth=2
                                        #       Parent Loop BB0_39 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	%ebx, -4(%r12,%rcx,4)
	movq	%rcx, -416(%rbp)
	leaq	1(%rcx), %rax
	decq	%rcx
	cmpq	%rdx, %rcx
	movq	%rax, %rcx
	jl	.LBB0_66
.LBB0_63:                               # %polly.cond130
                                        #   in Loop: Header=BB0_39 Depth=3
	testq	%r10, %r10
	jle	.LBB0_64
# BB#67:                                # %polly.stmt.polly.stmt.for.body648.preheader.split.loopexit
                                        #   in Loop: Header=BB0_39 Depth=3
	movq	-416(%rbp), %rax
	movq	%rax, -232(%rbp)
.LBB0_64:                               # %polly.exiting116
                                        #   in Loop: Header=BB0_39 Depth=3
	movq	-232(%rbp), %rdi
	movq	-408(%rbp), %r13
	jmp	.LBB0_46
.LBB0_43:                               #   in Loop: Header=BB0_39 Depth=3
	xorl	%edi, %edi
.LBB0_45:                               #   in Loop: Header=BB0_39 Depth=3
	movq	-72(%rbp), %rdx         # 8-byte Reload
.LBB0_46:                               # %polly.stmt.for.body648.preheader.split
                                        #   in Loop: Header=BB0_39 Depth=3
	movq	%rdx, -72(%rbp)         # 8-byte Spill
	cmpq	$3, %rdx
	jb	.LBB0_38
# BB#47:                                # %polly.split_new_and_old
                                        #   in Loop: Header=BB0_39 Depth=3
	leaq	(%rdi,%r11), %rax
	cmpq	%r10, %rax
	jl	.LBB0_58
# BB#48:                                # %polly.split_new_and_old
                                        #   in Loop: Header=BB0_39 Depth=3
	leaq	(%rdi,%rsi), %rcx
	leaq	(%rcx,%r11), %rax
	cmpq	%r10, %rax
	jl	.LBB0_58
# BB#49:                                # %polly.split_new_and_old
                                        #   in Loop: Header=BB0_39 Depth=3
	cmpq	-96(%rbp), %r15         # 8-byte Folded Reload
	jg	.LBB0_58
# BB#50:                                # %polly.split_new_and_old
                                        #   in Loop: Header=BB0_39 Depth=3
	movabsq	$-2305843009213693952, %rax # imm = 0xE000000000000000
	cmpq	%rax, %r15
	jl	.LBB0_58
# BB#51:                                # %polly.split_new_and_old
                                        #   in Loop: Header=BB0_39 Depth=3
	movabsq	$72057594037927935, %rax # imm = 0xFFFFFFFFFFFFFF
	cmpq	%rax, -88(%rbp)         # 8-byte Folded Reload
	jg	.LBB0_58
# BB#52:                                # %polly.split_new_and_old
                                        #   in Loop: Header=BB0_39 Depth=3
	leaq	-4(%r11,%r10), %rax
	cmpq	%r8, %rax
	jl	.LBB0_58
# BB#53:                                # %polly.split_new_and_old
                                        #   in Loop: Header=BB0_39 Depth=3
	leaq	(%rsi,%r15), %rax
	addq	%r9, %rax
	cmpq	%r11, %rax
	jg	.LBB0_58
# BB#54:                                # %polly.split_new_and_old
                                        #   in Loop: Header=BB0_39 Depth=3
	movabsq	$-2305843009213693952, %rax # imm = 0xE000000000000000
	cmpq	%rax, %r8
	jl	.LBB0_58
# BB#55:                                # %polly.split_new_and_old
                                        #   in Loop: Header=BB0_39 Depth=3
	addq	%r15, %rcx
	addq	%r9, %rcx
	addq	%r11, %rcx
	cmpq	%r10, %rcx
	jl	.LBB0_58
# BB#56:                                # %polly.split_new_and_old
                                        #   in Loop: Header=BB0_39 Depth=3
	leaq	1(%r9,%r11), %rax
	cmpq	%r10, %rax
	jl	.LBB0_58
# BB#57:                                # %polly.split_new_and_old
                                        #   in Loop: Header=BB0_39 Depth=3
	leaq	1(%r11,%r8), %rax
	cmpq	%r10, %rax
	jl	.LBB0_58
# BB#60:                                # %polly.cond
                                        #   in Loop: Header=BB0_39 Depth=3
	movl	%edi, %eax
	subl	%r10d, %eax
	testb	$3, %al
	jne	.LBB0_38
# BB#61:                                # %polly.loop_if
                                        #   in Loop: Header=BB0_39 Depth=3
	movq	%r10, %rax
	subq	%rdi, %rax
	sarq	$2, %rax
	movq	$-1, %rcx
	testq	%rax, %rax
	jle	.LBB0_38
	.p2align	4, 0x90
.LBB0_62:                               # %polly.stmt.polly.stmt.for.body648
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_5 Depth=2
                                        #       Parent Loop BB0_39 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	%ebx, (%r12,%rdi,4)
	movl	%ebx, 4(%r12,%rdi,4)
	movl	%ebx, 8(%r12,%rdi,4)
	movl	%ebx, 12(%r12,%rdi,4)
	leaq	-1(%rax), %rdx
	incq	%rcx
	addq	$4, %rdi
	cmpq	%rdx, %rcx
	jl	.LBB0_62
	jmp	.LBB0_38
.LBB0_58:                               # %polly.stmt.for.body648.preheader2
                                        #   in Loop: Header=BB0_39 Depth=3
	movq	%r10, %rax
	subq	%rdi, %rax
	leaq	(%r13,%rdi,4), %rcx
	addq	-296(%rbp), %rcx        # 8-byte Folded Reload
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB0_59:                               # %polly.stmt.for.body648
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_5 Depth=2
                                        #       Parent Loop BB0_39 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	%ebx, (%rcx,%rdi,4)
	movl	%ebx, 4(%rcx,%rdi,4)
	movl	%ebx, 8(%rcx,%rdi,4)
	movl	%ebx, 12(%rcx,%rdi,4)
	addq	$4, %rdi
	cmpq	%rdi, %rax
	jne	.LBB0_59
	.p2align	4, 0x90
.LBB0_38:                               # %polly.merge
                                        #   in Loop: Header=BB0_39 Depth=3
	addq	-144(%rbp), %r12        # 8-byte Folded Reload
	cmpq	-208(%rbp), %r14        # 8-byte Folded Reload
	leaq	1(%r14), %r14
	movq	%r11, %r9
	movq	%rsi, %r11
	jle	.LBB0_39
	.p2align	4, 0x90
.LBB0_35:                               # %polly.loop_exit16
                                        #   in Loop: Header=BB0_5 Depth=2
	subq	$-128, -184(%rbp)       # 8-byte Folded Spill
	movq	-136(%rbp), %rax        # 8-byte Reload
	cmpq	-176(%rbp), %rax        # 8-byte Folded Reload
	leaq	1(%rax), %rax
	jne	.LBB0_5
.LBB0_36:                               # %polly.loop_exit7
                                        #   in Loop: Header=BB0_3 Depth=1
	movq	-256(%rbp), %rax        # 8-byte Reload
	addq	%rax, -128(%rbp)        # 8-byte Folded Spill
	addq	%rax, -168(%rbp)        # 8-byte Folded Spill
	movq	-112(%rbp), %rax        # 8-byte Reload
	cmpq	-264(%rbp), %rax        # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, -112(%rbp)        # 8-byte Spill
	jne	.LBB0_3
.LBB0_37:                               # %for.end10
	.loc	1 21 44                 # MatrixMult.c:21:44
	movl	$16, %edi
	callq	malloc
.Ltmp16:
	#DEBUG_VALUE: init:matrix <- %RAX
	.loc	1 22 18                 # MatrixMult.c:22:18
	movq	-120(%rbp), %rcx        # 8-byte Reload
	movq	%rcx, (%rax)
	.loc	1 23 19                 # MatrixMult.c:23:19
	movq	-104(%rbp), %rcx        # 8-byte Reload
	movl	%ecx, 8(%rax)
	.loc	1 24 20                 # MatrixMult.c:24:20
	movl	-76(%rbp), %ecx         # 4-byte Reload
	movl	%ecx, 12(%rax)
	.loc	1 26 5                  # MatrixMult.c:26:5
	addq	$392, %rsp              # imm = 0x188
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp17:
.Lfunc_end0:
	.size	init, .Lfunc_end0-init
	.cfi_endproc

	.globl	matrix_multiply
	.p2align	4, 0x90
	.type	matrix_multiply,@function
matrix_multiply:                        # @matrix_multiply
.Lfunc_begin1:
	.loc	1 29 0                  # MatrixMult.c:29:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp18:
	.cfi_def_cfa_offset 16
.Ltmp19:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp20:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$1272, %rsp             # imm = 0x4F8
.Ltmp21:
	.cfi_offset %rbx, -56
.Ltmp22:
	.cfi_offset %r12, -48
.Ltmp23:
	.cfi_offset %r13, -40
.Ltmp24:
	.cfi_offset %r14, -32
.Ltmp25:
	.cfi_offset %r15, -24
	#DEBUG_VALUE: matrix_multiply:A <- %RDI
	#DEBUG_VALUE: matrix_multiply:B <- %RSI
	movq	%rdi, %r13
.Ltmp26:
	#DEBUG_VALUE: matrix_multiply:A <- %R13
	.loc	1 31 35 prologue_end    # MatrixMult.c:31:35
	movq	(%r13), %r14
.Ltmp27:
	#DEBUG_VALUE: matrix_multiply:A_data <- %R14
	.loc	1 32 35                 # MatrixMult.c:32:35
	movq	(%rsi), %r15
.Ltmp28:
	#DEBUG_VALUE: matrix_multiply:B_data <- %R15
	.loc	1 39 22 discriminator 1 # MatrixMult.c:39:22
	movl	8(%rsi), %ecx
	movl	%ecx, -308(%rbp)        # 4-byte Spill
	movl	%ecx, %eax
	movq	%rax, -288(%rbp)        # 8-byte Spill
	movslq	12(%r13), %rbx
.Ltmp29:
	#DEBUG_VALUE: matrix_multiply:width <- %ECX
	.loc	1 36 50                 # MatrixMult.c:36:50
	movq	%rbx, -448(%rbp)        # 8-byte Spill
	movl	%ebx, %eax
	imull	%ecx, %eax
.Ltmp30:
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-308]
	.loc	1 36 45 is_stmt 0       # MatrixMult.c:36:45
	movslq	%eax, %rdi
	.loc	1 36 57                 # MatrixMult.c:36:57
	shlq	$2, %rdi
	.loc	1 36 38                 # MatrixMult.c:36:38
	callq	malloc
	movq	%rax, %r9
	.loc	1 35 21 is_stmt 1       # MatrixMult.c:35:21
	movq	%r9, -64(%rbp)          # 8-byte Spill
	testq	%rbx, %rbx
.Ltmp31:
	#DEBUG_VALUE: matrix_multiply:i <- 0
	jle	.LBB1_22
.Ltmp32:
# BB#1:                                 # %polly.preload.cond1189
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-308]
	#DEBUG_VALUE: matrix_multiply:B_data <- %R15
	#DEBUG_VALUE: matrix_multiply:A_data <- %R14
	#DEBUG_VALUE: matrix_multiply:A <- %R13
	#DEBUG_VALUE: matrix_multiply:B <- %RSI
	movq	%r9, %rsi
.Ltmp33:
	movslq	-308(%rbp), %rbx        # 4-byte Folded Reload
	xorl	%eax, %eax
	testq	%rbx, %rbx
	jle	.LBB1_2
.Ltmp34:
# BB#292:                               # %polly.preload.exec1191
	#DEBUG_VALUE: matrix_multiply:A <- %R13
	#DEBUG_VALUE: matrix_multiply:A_data <- %R14
	#DEBUG_VALUE: matrix_multiply:B_data <- %R15
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-308]
	movq	8(%r13), %rax
.Ltmp35:
.LBB1_2:                                # %polly.cond1196
	#DEBUG_VALUE: matrix_multiply:A <- %R13
	#DEBUG_VALUE: matrix_multiply:A_data <- %R14
	#DEBUG_VALUE: matrix_multiply:B_data <- %R15
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-308]
	movq	%rax, -1304(%rbp)
	testl	%ebx, %ebx
	setg	-210(%rbp)
	movq	%rbx, -1248(%rbp)
	movq	-448(%rbp), %rdi        # 8-byte Reload
	movl	%edi, -552(%rbp)
	movl	$0, -556(%rbp)
	testq	%rbx, %rbx
	jle	.LBB1_3
.Ltmp36:
# BB#293:                               # %polly.stmt.polly.preload.exec
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-308]
	#DEBUG_VALUE: matrix_multiply:B_data <- %R15
	#DEBUG_VALUE: matrix_multiply:A_data <- %R14
	#DEBUG_VALUE: matrix_multiply:A <- %R13
	movq	%rax, %rcx
	shrq	$32, %rcx
	movl	%ecx, -552(%rbp)
	movl	%eax, -556(%rbp)
.Ltmp37:
.LBB1_3:                                # %polly.preload.merge
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-308]
	#DEBUG_VALUE: matrix_multiply:B_data <- %R15
	#DEBUG_VALUE: matrix_multiply:A_data <- %R14
	#DEBUG_VALUE: matrix_multiply:A <- %R13
	movl	-552(%rbp), %r8d
	movl	-556(%rbp), %r11d
	movb	-210(%rbp), %r9b
	movq	-1248(%rbp), %r12
	movq	%r12, -72(%rbp)         # 8-byte Spill
	movslq	%r11d, %rcx
	movq	%rcx, -176(%rbp)        # 8-byte Spill
	movq	%rcx, %rdx
	imulq	%r12, %rdx
	movq	%r15, -112(%rbp)        # 8-byte Spill
	leaq	(%r15,%rdx,4), %rdx
	movq	%rsi, %rax
	cmpq	%rax, %rdx
	setbe	%r10b
	leaq	-1(%rdi), %rsi
	movq	%rsi, -568(%rbp)        # 8-byte Spill
	imulq	%r12, %rsi
	imulq	%r12, %rdi
	leaq	(%rax,%rdi,4), %rdi
	cmpq	%r15, %rdi
	setbe	%dl
	addq	%rcx, %rsi
	movq	%r14, -128(%rbp)        # 8-byte Spill
	leaq	(%r14,%rsi,4), %rsi
	cmpq	%rax, %rsi
	movq	%rax, %rsi
	setbe	%al
	cmpq	%r14, %rdi
	setbe	%cl
	orb	%al, %cl
	movzbl	%cl, %eax
	cmpl	$1, %eax
	jne	.LBB1_6
.Ltmp38:
# BB#4:                                 # %polly.preload.merge
	#DEBUG_VALUE: matrix_multiply:A <- %R13
	#DEBUG_VALUE: matrix_multiply:A_data <- %R14
	#DEBUG_VALUE: matrix_multiply:B_data <- %R15
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-308]
	cmpl	%r11d, -308(%rbp)       # 4-byte Folded Reload
	jl	.LBB1_6
.Ltmp39:
# BB#5:                                 # %polly.preload.merge
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-308]
	#DEBUG_VALUE: matrix_multiply:B_data <- %R15
	#DEBUG_VALUE: matrix_multiply:A_data <- %R14
	#DEBUG_VALUE: matrix_multiply:A <- %R13
	orb	%r10b, %dl
	je	.LBB1_6
.Ltmp40:
# BB#71:                                # %polly.start
	#DEBUG_VALUE: matrix_multiply:A <- %R13
	#DEBUG_VALUE: matrix_multiply:A_data <- %R14
	#DEBUG_VALUE: matrix_multiply:B_data <- %R15
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-308]
	movl	%r11d, -116(%rbp)       # 4-byte Spill
	sarq	$5, -568(%rbp)          # 8-byte Folded Spill
	movq	%rsi, %r9
	js	.LBB1_22
.Ltmp41:
# BB#72:                                # %polly.loop_preheader
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-308]
	#DEBUG_VALUE: matrix_multiply:B_data <- %R15
	#DEBUG_VALUE: matrix_multiply:A_data <- %R14
	#DEBUG_VALUE: matrix_multiply:A <- %R13
	movq	-176(%rbp), %rax        # 8-byte Reload
	decq	%rax
	movq	%rax, -576(%rbp)        # 8-byte Spill
	leaq	-1(%r12), %r15
.Ltmp42:
	sarq	$5, %r15
	movq	%r15, -336(%rbp)        # 8-byte Spill
	movq	%r12, %r13
.Ltmp43:
	shrq	$2, %r13
	movq	%r13, -424(%rbp)        # 8-byte Spill
	leaq	-1(%r13), %rcx
	movq	%rcx, -368(%rbp)        # 8-byte Spill
	movq	-288(%rbp), %rdx        # 8-byte Reload
	andl	$3, %edx
	movq	%rdx, -152(%rbp)        # 8-byte Spill
	leaq	(,%r12,4), %rax
	movq	%rax, -280(%rbp)        # 8-byte Spill
	movq	%r12, %rcx
	shlq	$7, %rcx
	movq	%rcx, -456(%rbp)        # 8-byte Spill
	leaq	(,%rdx,4), %rcx
	movq	%rcx, -240(%rbp)        # 8-byte Spill
	movq	%rax, %rdx
	subq	%rcx, %rdx
	movq	%rdx, -400(%rbp)        # 8-byte Spill
	movq	%r13, %rax
	negq	%rax
	movq	%rax, -360(%rbp)        # 8-byte Spill
	shlq	$5, %r12
	movq	%r12, -760(%rbp)        # 8-byte Spill
	leaq	(%r9,%rdx), %rax
	movq	%rax, -328(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -304(%rbp)        # 8-byte Spill
	movq	%r9, -408(%rbp)         # 8-byte Spill
	movq	%rbx, %r8
	movq	%r8, -168(%rbp)         # 8-byte Spill
	movq	%r8, %rax
	movq	%rax, -248(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -352(%rbp)        # 8-byte Spill
.Ltmp44:
	.p2align	4, 0x90
.LBB1_60:                               # %polly.loop_header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_62 Depth 2
                                        #       Child Loop BB1_79 Depth 3
                                        #       Child Loop BB1_65 Depth 3
	testq	%r15, %r15
	js	.LBB1_75
# BB#61:                                # %polly.loop_header28.preheader
                                        #   in Loop: Header=BB1_60 Depth=1
	movq	-72(%rbp), %rdx         # 8-byte Reload
	movq	-352(%rbp), %rax        # 8-byte Reload
	movq	%rax, %rcx
	imulq	%rcx, %rdx
	movq	%rdx, -272(%rbp)        # 8-byte Spill
	movq	-456(%rbp), %rdx        # 8-byte Reload
	imulq	%rcx, %rdx
	movq	%rdx, -416(%rbp)        # 8-byte Spill
	movq	-400(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%rdx), %rax
	movq	%rax, -440(%rbp)        # 8-byte Spill
	movq	%rcx, %rax
	shlq	$5, %rax
	movq	-448(%rbp), %rcx        # 8-byte Reload
	subq	%rax, %rcx
	decq	%rcx
	cmpq	$31, %rcx
	movl	$31, %eax
	cmovgq	%rax, %rcx
	movq	%rcx, -480(%rbp)        # 8-byte Spill
	leaq	-1(%rcx), %rax
	movq	%rax, -264(%rbp)        # 8-byte Spill
	movabsq	$2305843009213693951, %rax # imm = 0x1FFFFFFFFFFFFFFF
	movq	-248(%rbp), %rcx        # 8-byte Reload
	leaq	1(%rax,%rcx), %rax
	movq	%rax, -224(%rbp)        # 8-byte Spill
	movq	-408(%rbp), %rax        # 8-byte Reload
	movq	%rax, -432(%rbp)        # 8-byte Spill
	movq	-304(%rbp), %rax        # 8-byte Reload
	movq	%rax, -376(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_62:                               # %polly.loop_header28
                                        #   Parent Loop BB1_60 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_79 Depth 3
                                        #       Child Loop BB1_65 Depth 3
	movq	%rax, -208(%rbp)        # 8-byte Spill
	leaq	(,%rax,8), %rax
	movq	%rax, %rdx
	subq	%r13, %rdx
	cmpq	$-9, %rdx
	movq	$-8, %rcx
	cmovleq	%rcx, %rdx
	movq	%rdx, %rsi
	cmpq	$0, -480(%rbp)          # 8-byte Folded Reload
	js	.LBB1_74
# BB#63:                                # %polly.loop_header37.preheader
                                        #   in Loop: Header=BB1_62 Depth=2
	movq	-208(%rbp), %rdx        # 8-byte Reload
	movq	%rdx, %rcx
	shlq	$5, %rcx
	movq	%rcx, -256(%rbp)        # 8-byte Spill
	leaq	31(%rcx), %rdi
	movq	-368(%rbp), %rcx        # 8-byte Reload
	cmpq	%rax, %rcx
	js	.LBB1_73
# BB#64:                                # %polly.loop_preheader55.preheader.us.preheader
                                        #   in Loop: Header=BB1_62 Depth=2
	movq	%rdx, %rax
	shlq	$7, %rax
	addq	-416(%rbp), %rax        # 8-byte Folded Reload
	movq	%rax, -504(%rbp)        # 8-byte Spill
	shlq	$4, %rsi
	negq	%rsi
	movq	%rsi, -296(%rbp)        # 8-byte Spill
	cmpq	-72(%rbp), %rdi         # 8-byte Folded Reload
	movq	%rdi, -184(%rbp)        # 8-byte Spill
	setl	%al
	cmpq	$0, -152(%rbp)          # 8-byte Folded Reload
	sete	%cl
	orb	%al, %cl
	movb	%cl, -496(%rbp)         # 1-byte Spill
	movq	-360(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%rdx,8), %rcx
	cmpq	$-9, %rcx
	movq	$-8, %rax
	cmovleq	%rax, %rcx
	shlq	$4, %rcx
	negq	%rcx
	movq	%rcx, -488(%rbp)        # 8-byte Spill
	movq	-432(%rbp), %r12        # 8-byte Reload
	movq	-328(%rbp), %r15        # 8-byte Reload
	xorl	%r11d, %r11d
	movq	-376(%rbp), %rdi        # 8-byte Reload
	xorl	%r13d, %r13d
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB1_65:                               # %polly.split_new_and_old1169
                                        #   Parent Loop BB1_60 Depth=1
                                        #     Parent Loop BB1_62 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	%rbx, -232(%rbp)        # 8-byte Spill
	movq	%r13, -136(%rbp)        # 8-byte Spill
	movq	%rdi, -144(%rbp)        # 8-byte Spill
	movq	%r11, -160(%rbp)        # 8-byte Spill
	movq	%r15, -200(%rbp)        # 8-byte Spill
	movq	%r12, -48(%rbp)         # 8-byte Spill
	movq	-256(%rbp), %rax        # 8-byte Reload
	leaq	32(%rax), %rax
	cmpq	%rax, %r8
	setge	%r9b
	movabsq	$2305843009213693951, %rax # imm = 0x1FFFFFFFFFFFFFFF
	cmpq	%rax, %r11
	setle	%cl
	movb	%cl, -88(%rbp)          # 1-byte Spill
	movabsq	$-2305843009213693952, %rdx # imm = 0xE000000000000000
	movq	%rdx, %r14
	cmpq	%r14, %r11
	setge	%r10b
	movb	%cl, %dl
	andb	%r10b, %dl
	movq	-272(%rbp), %r12        # 8-byte Reload
	movq	-208(%rbp), %r15        # 8-byte Reload
	leaq	(%r15,%r12), %rsi
	movabsq	$72057594037927935, %rbx # imm = 0xFFFFFFFFFFFFFF
	cmpq	%rbx, %rsi
	setle	%cl
	movb	%cl, -192(%rbp)         # 1-byte Spill
	andb	%cl, %dl
	andb	%r9b, %dl
	movabsq	$-72057594037927936, %rcx # imm = 0xFF00000000000000
	cmpq	%rcx, %r12
	setge	%r9b
	movb	%r9b, -80(%rbp)         # 1-byte Spill
	cmpq	%rax, %rdi
	setle	%cl
	movb	%cl, -56(%rbp)          # 1-byte Spill
	andb	%cl, %r9b
	andb	%dl, %r9b
	cmpq	%r14, %rdi
	movq	%r8, %r14
	setge	%r8b
	cmpq	%rbx, %r15
	setle	%r15b
	movq	-184(%rbp), %r13        # 8-byte Reload
	cmpq	%r14, %r13
	setge	%bl
	movq	-152(%rbp), %rcx        # 8-byte Reload
	testq	%rcx, %rcx
	setg	%sil
	sete	-96(%rbp)               # 1-byte Folded Spill
	leaq	(%rcx,%rax), %rdx
	movq	-248(%rbp), %rdi        # 8-byte Reload
	leaq	(%rdi,%r11), %rdi
	cmpq	%rdi, %rdx
	movb	%r8b, %dil
	setge	%r8b
	movq	%r12, %rdx
	shlq	$5, %rdx
	addq	%r14, %rdx
	leaq	1(%rax,%rdx), %rdx
	cmpq	%rcx, %rdx
	setge	-104(%rbp)              # 1-byte Folded Spill
	movq	-224(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%r11), %rdx
	movb	-88(%rbp), %al          # 1-byte Reload
	cmpq	%rcx, %rdx
	movb	-56(%rbp), %cl          # 1-byte Reload
	setge	%r12b
	cmpq	%r14, %r13
	movq	%r13, %r14
	setge	%dl
	testb	%dil, %r9b
	jne	.LBB1_287
# BB#66:                                # %polly.split_new_and_old1169
                                        #   in Loop: Header=BB1_65 Depth=3
	andb	%r15b, %sil
	andb	%al, %sil
	andb	%sil, %bl
	andb	-192(%rbp), %r10b       # 1-byte Folded Reload
	andb	-80(%rbp), %r10b        # 1-byte Folded Reload
	andb	%r10b, %bl
	andb	%cl, %r8b
	andb	-104(%rbp), %r8b        # 1-byte Folded Reload
	andb	%bl, %r8b
	andb	%dil, %r12b
	andb	%r8b, %r12b
	jne	.LBB1_287
# BB#67:                                # %polly.split_new_and_old1169
                                        #   in Loop: Header=BB1_65 Depth=3
	andb	-96(%rbp), %r15b        # 1-byte Folded Reload
	andb	%al, %r15b
	andb	%r15b, %dl
	andb	%r10b, %dl
	andb	%dil, %cl
	andb	%dl, %cl
	jne	.LBB1_287
# BB#68:                                # %polly.loop_preheader55.preheader.us
                                        #   in Loop: Header=BB1_65 Depth=3
	movq	-280(%rbp), %r12        # 8-byte Reload
	movq	-232(%rbp), %rbx        # 8-byte Reload
	imulq	%rbx, %r12
	movq	-504(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%r12), %rdi
	movq	-64(%rbp), %r14         # 8-byte Reload
	addq	%r14, %rdi
	xorl	%esi, %esi
	movq	-296(%rbp), %rdx        # 8-byte Reload
	callq	memset
	cmpb	$0, -496(%rbp)          # 1-byte Folded Reload
	movq	-200(%rbp), %r15        # 8-byte Reload
	jne	.LBB1_70
# BB#69:                                # %polly.stmt.for.body1171.preheader.us
                                        #   in Loop: Header=BB1_65 Depth=3
	addq	-440(%rbp), %r12        # 8-byte Folded Reload
	addq	%r14, %r12
	xorl	%esi, %esi
	movq	%r12, %rdi
	movq	-240(%rbp), %rdx        # 8-byte Reload
	callq	memset
.LBB1_70:                               #   in Loop: Header=BB1_65 Depth=3
	movq	-168(%rbp), %r8         # 8-byte Reload
	movq	-72(%rbp), %rax         # 8-byte Reload
	movq	-48(%rbp), %r12         # 8-byte Reload
	movq	-160(%rbp), %r11        # 8-byte Reload
	movq	-144(%rbp), %rdi        # 8-byte Reload
	movq	-136(%rbp), %r13        # 8-byte Reload
	jmp	.LBB1_290
	.p2align	4, 0x90
.LBB1_287:                              # %polly.cond1178
                                        #   in Loop: Header=BB1_65 Depth=3
	xorl	%esi, %esi
	movq	-48(%rbp), %r12         # 8-byte Reload
	movq	%r12, %rdi
	movq	-488(%rbp), %rdx        # 8-byte Reload
	callq	memset
	movq	-136(%rbp), %r13        # 8-byte Reload
	movq	%r13, -1240(%rbp)
	movq	-168(%rbp), %r8         # 8-byte Reload
	cmpq	%r8, %r14
	setge	%al
	cmpq	$0, -152(%rbp)          # 8-byte Folded Reload
	sets	%dl
	setg	%cl
	testb	%dl, %al
	movq	-200(%rbp), %r15        # 8-byte Reload
	jne	.LBB1_291
# BB#288:                               # %polly.cond1178
                                        #   in Loop: Header=BB1_65 Depth=3
	andb	%cl, %al
	je	.LBB1_289
.LBB1_291:                              # %polly.stmt.polly.stmt.for.body1171.preheader.us
                                        #   in Loop: Header=BB1_65 Depth=3
	xorl	%esi, %esi
	movq	%r15, %rdi
	movq	-240(%rbp), %rdx        # 8-byte Reload
	movq	%r8, %r14
	callq	memset
	movq	%r14, %r8
.LBB1_289:                              # %polly.exiting1172
                                        #   in Loop: Header=BB1_65 Depth=3
	movq	-1240(%rbp), %rbx
	movq	-72(%rbp), %rax         # 8-byte Reload
	movq	-160(%rbp), %r11        # 8-byte Reload
	movq	-144(%rbp), %rdi        # 8-byte Reload
.LBB1_290:                              # %polly.merge.us
                                        #   in Loop: Header=BB1_65 Depth=3
	movq	%rax, -72(%rbp)         # 8-byte Spill
	incq	%r13
	addq	%rax, %rdi
	addq	%rax, %r11
	movq	-280(%rbp), %rax        # 8-byte Reload
	addq	%rax, %r15
	addq	%rax, %r12
	cmpq	-264(%rbp), %rbx        # 8-byte Folded Reload
	leaq	1(%rbx), %rbx
	jle	.LBB1_65
	jmp	.LBB1_74
	.p2align	4, 0x90
.LBB1_73:                               # %polly.loop_header37.preheader.split
                                        #   in Loop: Header=BB1_62 Depth=2
	cmpq	-72(%rbp), %rdi         # 8-byte Folded Reload
	movq	-328(%rbp), %rdi        # 8-byte Reload
	movl	$0, %r14d
	movq	-248(%rbp), %r12        # 8-byte Reload
	movl	$0, %r15d
	movl	$0, %r13d
	jl	.LBB1_74
	.p2align	4, 0x90
.LBB1_79:                               # %polly.split_new_and_old1157
                                        #   Parent Loop BB1_60 Depth=1
                                        #     Parent Loop BB1_62 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-152(%rbp), %r9         # 8-byte Reload
	testq	%r9, %r9
	setg	%al
	movabsq	$2305843009213693951, %rsi # imm = 0x1FFFFFFFFFFFFFFF
	movq	%rsi, %r10
	cmpq	%r10, %r14
	setle	%cl
	andb	%al, %cl
	movabsq	$-2305843009213693952, %rax # imm = 0xE000000000000000
	cmpq	%rax, %r14
	setge	%al
	movabsq	$72057594037927935, %rdx # imm = 0xFFFFFFFFFFFFFF
	movq	-272(%rbp), %rsi        # 8-byte Reload
	cmpq	%rdx, %rsi
	setle	%dl
	andb	%al, %dl
	andb	%cl, %dl
	movabsq	$-72057594037927936, %rax # imm = 0xFF00000000000000
	cmpq	%rax, %rsi
	setge	%al
	leaq	(%r9,%r10), %rcx
	cmpq	%r12, %rcx
	setge	%bl
	andb	%al, %bl
	andb	%dl, %bl
	movq	%rsi, %rax
	shlq	$5, %rax
	addq	%r8, %rax
	cmpq	%rax, %rcx
	setge	%cl
	andb	%bl, %cl
	leaq	1(%r10,%rax), %rax
	cmpq	%r9, %rax
	setge	%al
	andb	%cl, %al
	leaq	1(%r12,%r10), %rcx
	cmpq	%r9, %rcx
	setge	%cl
	testb	%cl, %al
	jne	.LBB1_283
# BB#80:                                # %polly.split_new_and_old1157
                                        #   in Loop: Header=BB1_79 Depth=3
	testq	%r9, %r9
	je	.LBB1_283
# BB#81:                                # %polly.then
                                        #   in Loop: Header=BB1_79 Depth=3
	movq	%rdi, -88(%rbp)         # 8-byte Spill
	je	.LBB1_77
# BB#76:                                # %polly.stmt.for.body1171.preheader
                                        #   in Loop: Header=BB1_79 Depth=3
	movq	-280(%rbp), %rdi        # 8-byte Reload
	imulq	%r13, %rdi
	addq	-440(%rbp), %rdi        # 8-byte Folded Reload
	addq	-64(%rbp), %rdi         # 8-byte Folded Reload
	xorl	%esi, %esi
	movq	-240(%rbp), %rdx        # 8-byte Reload
	movq	%r8, %rbx
	callq	memset
	movq	%rbx, %r8
.LBB1_77:                               # %polly.merge
                                        #   in Loop: Header=BB1_79 Depth=3
	movq	-88(%rbp), %rdi         # 8-byte Reload
	jmp	.LBB1_78
	.p2align	4, 0x90
.LBB1_283:                              # %polly.cond1163
                                        #   in Loop: Header=BB1_79 Depth=3
	movq	%r15, -1232(%rbp)
	testq	%r9, %r9
	js	.LBB1_286
# BB#284:                               # %polly.cond1163
                                        #   in Loop: Header=BB1_79 Depth=3
	jg	.LBB1_286
# BB#285:                               # %polly.exiting1160
                                        #   in Loop: Header=BB1_79 Depth=3
	movq	-1232(%rbp), %r13
	jmp	.LBB1_78
	.p2align	4, 0x90
.LBB1_286:                              # %polly.stmt.polly.stmt.for.body1171.preheader
                                        #   in Loop: Header=BB1_79 Depth=3
	xorl	%esi, %esi
	movq	-240(%rbp), %rdx        # 8-byte Reload
	movq	%r8, %r13
	movq	%rdi, %rbx
	callq	memset
	movq	%rbx, %rdi
	movq	%r13, %r8
	movq	-1232(%rbp), %r13
.LBB1_78:                               # %polly.merge
                                        #   in Loop: Header=BB1_79 Depth=3
	incq	%r15
	movq	-72(%rbp), %rax         # 8-byte Reload
	addq	%rax, %r12
	addq	%rax, %r14
	addq	-280(%rbp), %rdi        # 8-byte Folded Reload
	cmpq	-264(%rbp), %r13        # 8-byte Folded Reload
	leaq	1(%r13), %r13
	jle	.LBB1_79
	.p2align	4, 0x90
.LBB1_74:                               # %polly.loop_exit39
                                        #   in Loop: Header=BB1_62 Depth=2
	addq	$32, -376(%rbp)         # 8-byte Folded Spill
	subq	$-128, -432(%rbp)       # 8-byte Folded Spill
	movq	-336(%rbp), %r15        # 8-byte Reload
	movq	-208(%rbp), %rax        # 8-byte Reload
	cmpq	%r15, %rax
	leaq	1(%rax), %rax
	movq	-424(%rbp), %r13        # 8-byte Reload
	jne	.LBB1_62
.LBB1_75:                               # %polly.loop_exit30
                                        #   in Loop: Header=BB1_60 Depth=1
	movq	-760(%rbp), %rcx        # 8-byte Reload
	addq	%rcx, -248(%rbp)        # 8-byte Folded Spill
	movq	-456(%rbp), %rax        # 8-byte Reload
	addq	%rax, -328(%rbp)        # 8-byte Folded Spill
	addq	%rcx, -304(%rbp)        # 8-byte Folded Spill
	addq	%rax, -408(%rbp)        # 8-byte Folded Spill
	movq	-352(%rbp), %rax        # 8-byte Reload
	cmpq	-568(%rbp), %rax        # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, -352(%rbp)        # 8-byte Spill
	jne	.LBB1_60
# BB#36:                                # %polly.cond75
	movq	-448(%rbp), %rax        # 8-byte Reload
	testl	%eax, %eax
	setle	%bl
	jle	.LBB1_82
# BB#37:
	xorl	%eax, %eax
	jmp	.LBB1_38
.LBB1_6:                                # %for.cond7.preheader.preheader
.Ltmp45:
	#DEBUG_VALUE: matrix_multiply:A <- %R13
	#DEBUG_VALUE: matrix_multiply:A_data <- %R14
	#DEBUG_VALUE: matrix_multiply:B_data <- %R15
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-308]
	movq	%rbx, -168(%rbp)        # 8-byte Spill
.Ltmp46:
	.loc	1 39 9 discriminator 1  # MatrixMult.c:39:9
	testb	$1, %r9b
	movq	%rsi, %r9
	je	.LBB1_22
.Ltmp47:
# BB#7:                                 # %for.body11.preheader.us.preheader
	#DEBUG_VALUE: matrix_multiply:width <- [%RBP+-308]
	#DEBUG_VALUE: matrix_multiply:B_data <- %R15
	#DEBUG_VALUE: matrix_multiply:A_data <- %R14
	#DEBUG_VALUE: matrix_multiply:A <- %R13
	.loc	1 37 15 discriminator 1 # MatrixMult.c:37:15
	movslq	%r8d, %rax
.Ltmp48:
	.loc	1 40 21                 # MatrixMult.c:40:21
	movq	%rax, -264(%rbp)        # 8-byte Spill
	leaq	(,%r12,4), %rcx
	movq	%rcx, -208(%rbp)        # 8-byte Spill
	movslq	8(%r13), %r13
.Ltmp49:
	.loc	1 40 27 is_stmt 0       # MatrixMult.c:40:27
	movq	%r13, -152(%rbp)        # 8-byte Spill
	testq	%r12, %r12
	movl	$1, %eax
	cmovgq	%r12, %rax
	shlq	$2, %rax
	movq	%rax, -256(%rbp)        # 8-byte Spill
.Ltmp50:
	.loc	1 42 37 is_stmt 1       # MatrixMult.c:42:37
	movl	%r13d, %r15d
.Ltmp51:
	andl	$1, %r15d
	movq	%r15, -200(%rbp)        # 8-byte Spill
	leaq	(%r12,%r12), %rax
.Ltmp52:
	.loc	1 40 21                 # MatrixMult.c:40:21
	movq	%rax, -88(%rbp)         # 8-byte Spill
	movq	-128(%rbp), %rax        # 8-byte Reload
	leaq	12(%rax), %rax
	movq	%rax, -232(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -96(%rbp)         # 8-byte Spill
	xorl	%edx, %edx
.Ltmp53:
	.p2align	4, 0x90
.LBB1_8:                                # %for.body11.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_10 Depth 2
                                        #       Child Loop BB1_35 Depth 3
                                        #       Child Loop BB1_199 Depth 3
	.loc	1 41 13 discriminator 1 # MatrixMult.c:41:13
	testl	%r13d, %r13d
	jle	.LBB1_20
.Ltmp54:
# BB#9:                                 # %for.body11.us.us.preheader
                                        #   in Loop: Header=BB1_8 Depth=1
	.loc	1 40 21                 # MatrixMult.c:40:21
	movq	%r12, %r11
	imulq	%rdx, %r11
	.loc	1 40 27 is_stmt 0       # MatrixMult.c:40:27
	movq	%r11, -56(%rbp)         # 8-byte Spill
	movq	%rcx, %r14
	imulq	%rdx, %r14
	movq	%rdx, -272(%rbp)        # 8-byte Spill
	addq	%r9, %r14
	movq	%r14, -104(%rbp)        # 8-byte Spill
	xorl	%ebx, %ebx
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB1_10:                               # %polly.preload.cond
                                        #   Parent Loop BB1_8 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_35 Depth 3
                                        #       Child Loop BB1_199 Depth 3
	xorl	%r10d, %r10d
	testq	%r15, %r15
	js	.LBB1_203
# BB#11:                                # %polly.preload.cond
                                        #   in Loop: Header=BB1_10 Depth=2
	jle	.LBB1_12
.LBB1_203:                              # %polly.preload.exec617
                                        #   in Loop: Header=BB1_10 Depth=2
	movq	-128(%rbp), %rax        # 8-byte Reload
	movl	(%rax,%r11,4), %r10d
.LBB1_12:                               # %polly.preload.cond620
                                        #   in Loop: Header=BB1_10 Depth=2
	movl	%r10d, -1252(%rbp)
	xorl	%r9d, %r9d
	testq	%r15, %r15
	movq	-64(%rbp), %rdi         # 8-byte Reload
	js	.LBB1_204
# BB#13:                                # %polly.preload.cond620
                                        #   in Loop: Header=BB1_10 Depth=2
	jle	.LBB1_14
.LBB1_204:                              # %polly.preload.exec622
                                        #   in Loop: Header=BB1_10 Depth=2
	movq	-112(%rbp), %rax        # 8-byte Reload
	movl	(%rax,%rbx,4), %r9d
.LBB1_14:                               # %polly.preload.merge621
                                        #   in Loop: Header=BB1_10 Depth=2
	movl	%r9d, -1256(%rbp)
	movq	-112(%rbp), %rsi        # 8-byte Reload
	leaq	4(%rsi,%rbx,4), %rax
	leaq	(%rbx,%r11), %rcx
	leaq	(%rdi,%rcx,4), %rdx
	cmpq	%rdx, %rax
	setbe	%al
	leaq	4(%rdi,%rcx,4), %rcx
	movq	%rbx, -48(%rbp)         # 8-byte Spill
	leaq	(%rsi,%rbx,4), %rbx
	cmpq	%rbx, %rcx
	setbe	%bl
	movq	-128(%rbp), %rsi        # 8-byte Reload
	leaq	4(%rsi,%r11,4), %rdi
	cmpq	%rdx, %rdi
	setbe	%dl
	leaq	(%rsi,%r11,4), %rdi
	cmpq	%rdi, %rcx
	setbe	%cl
	movabsq	$2305843009213693951, %rsi # imm = 0x1FFFFFFFFFFFFFFF
	cmpq	%rsi, %r11
	jg	.LBB1_18
# BB#15:                                # %polly.preload.merge621
                                        #   in Loop: Header=BB1_10 Depth=2
	movabsq	$-2305843009213693952, %rsi # imm = 0xE000000000000000
	cmpq	%rsi, %r11
	jl	.LBB1_18
# BB#16:                                # %polly.preload.merge621
                                        #   in Loop: Header=BB1_10 Depth=2
	orb	%bl, %al
	je	.LBB1_18
# BB#17:                                # %polly.preload.merge621
                                        #   in Loop: Header=BB1_10 Depth=2
	orb	%cl, %dl
	je	.LBB1_18
# BB#200:                               # %polly.cond
                                        #   in Loop: Header=BB1_10 Depth=2
	movq	-48(%rbp), %rcx         # 8-byte Reload
	leaq	(%r14,%rcx,4), %rax
	movl	$0, (%r14,%rcx,4)
	movq	%rcx, -1176(%rbp)
	movq	%rcx, -1184(%rbp)
	movq	%rax, -1192(%rbp)
	movl	$0, -508(%rbp)
	movq	$0, -920(%rbp)
	testq	%r15, %r15
	js	.LBB1_205
# BB#201:                               # %polly.cond
                                        #   in Loop: Header=BB1_10 Depth=2
	jle	.LBB1_202
.LBB1_205:                              # %polly.stmt.for.body17.us.us.prol
                                        #   in Loop: Header=BB1_10 Depth=2
.Ltmp55:
	.loc	1 42 74 is_stmt 1       # MatrixMult.c:42:74
	imull	%r10d, %r9d
	movl	%r9d, (%r14,%rcx,4)
	movl	%r9d, -508(%rbp)
	movq	$1, -920(%rbp)
.Ltmp56:
.LBB1_202:                              # %polly.exiting615
                                        #   in Loop: Header=BB1_10 Depth=2
	movl	-508(%rbp), %ecx
	movq	-920(%rbp), %rdi
	movq	-1176(%rbp), %r8
	movq	-1192(%rbp), %r10
	movq	-1184(%rbp), %r11
	jmp	.LBB1_25
	.p2align	4, 0x90
.LBB1_18:                               # %for.body11.us.us
                                        #   in Loop: Header=BB1_10 Depth=2
	.loc	1 40 27                 # MatrixMult.c:40:27
	leaq	(%r8,%r11), %rax
	xorl	%ecx, %ecx
	testq	%r15, %r15
	movq	-64(%rbp), %rdx         # 8-byte Reload
	.loc	1 40 13 is_stmt 0       # MatrixMult.c:40:13
	leaq	(%rdx,%rax,4), %r10
	.loc	1 40 31                 # MatrixMult.c:40:31
	movl	$0, (%rdx,%rax,4)
.Ltmp57:
	#DEBUG_VALUE: matrix_multiply:k <- 0
	jne	.LBB1_23
# BB#19:                                #   in Loop: Header=BB1_10 Depth=2
	xorl	%edi, %edi
	jmp	.LBB1_24
	.p2align	4, 0x90
.LBB1_23:                               # %for.body17.us.us.prol
                                        #   in Loop: Header=BB1_10 Depth=2
.Ltmp58:
	.loc	1 42 75 is_stmt 1       # MatrixMult.c:42:75
	movq	-112(%rbp), %rax        # 8-byte Reload
	movl	(%rax,%r8,4), %ecx
	.loc	1 42 74 is_stmt 0       # MatrixMult.c:42:74
	movq	-128(%rbp), %rax        # 8-byte Reload
	imull	(%rax,%r11,4), %ecx
	.loc	1 42 35                 # MatrixMult.c:42:35
	movl	%ecx, (%r10)
	movl	$1, %edi
.LBB1_24:                               # %for.body11.us.us.split
                                        #   in Loop: Header=BB1_10 Depth=2
	movq	%r8, %r11
.LBB1_25:                               # %for.body11.us.us.split
                                        #   in Loop: Header=BB1_10 Depth=2
	.loc	1 42 37                 # MatrixMult.c:42:37
	cmpl	$1, %r13d
	je	.LBB1_26
# BB#27:                                # %polly.split_new_and_old
                                        #   in Loop: Header=BB1_10 Depth=2
	leaq	2(%rdi), %rax
	movq	%rax, -136(%rbp)        # 8-byte Spill
	leaq	1(%rdi), %rdx
	movq	%rdx, -80(%rbp)         # 8-byte Spill
	testq	%r8, %r8
	movq	%rdx, %rsi
	cmovnsq	%r13, %rsi
	movq	-168(%rbp), %r9         # 8-byte Reload
	leaq	(%r9,%r8), %rbx
	cmpq	%rax, %r13
	cmovlq	%rdx, %rsi
	movq	-56(%rbp), %r14         # 8-byte Reload
	leaq	1(%r13,%r14), %r15
	leaq	2(%rdi,%r14), %rax
	cmovgeq	%r15, %rax
	movq	%rax, -160(%rbp)        # 8-byte Spill
	testq	%r8, %r8
	cmovnsq	%r8, %rbx
	movq	%rbx, -144(%rbp)        # 8-byte Spill
	leaq	-1(%rdi), %rax
	testq	%r8, %r8
	cmovnsq	%rdi, %rax
	movq	%r12, %r15
	leaq	1(%r8), %r12
	movq	%r12, -192(%rbp)        # 8-byte Spill
	testq	%r8, %r8
	movq	%rsi, %rbx
	cmovsq	%rdi, %rbx
	leaq	1(%r9,%r8), %r9
	cmovnsq	%r12, %r9
	cmpq	%r13, %rdx
	cmovlq	%rsi, %rbx
	leaq	-1(%r13), %rsi
	testq	%r8, %r8
	cmovnsq	%rbx, %rsi
	cmpq	-136(%rbp), %r13        # 8-byte Folded Reload
	cmovlq	%rbx, %rsi
	imulq	%r15, %rsi
	addq	%r9, %rsi
	movq	-112(%rbp), %r13        # 8-byte Reload
	leaq	(%r13,%rsi,4), %rsi
	leaq	(%r14,%r8), %rbx
	movq	-64(%rbp), %r12         # 8-byte Reload
	leaq	(%r12,%rbx,4), %r9
	cmpq	%r9, %rsi
	setbe	-136(%rbp)              # 1-byte Folded Spill
	imulq	%r15, %rax
	addq	-144(%rbp), %rax        # 8-byte Folded Reload
	leaq	4(%r12,%rbx,4), %rbx
	leaq	(%r13,%rax,4), %rax
	cmpq	%rax, %rbx
	setbe	%r12b
	movq	-128(%rbp), %rsi        # 8-byte Reload
	movq	-160(%rbp), %rax        # 8-byte Reload
	leaq	(%rsi,%rax,4), %rax
	cmpq	%r9, %rax
	leaq	(%rdi,%r14), %r15
	setbe	%al
	leaq	(%rsi,%r15,4), %rdx
	cmpq	%rdx, %rbx
	movabsq	$2305843009213693951, %rdx # imm = 0x1FFFFFFFFFFFFFFF
	leaq	-1(%rdx), %rbx
	setbe	%dl
	cmpq	%rbx, %r15
	jg	.LBB1_34
# BB#28:                                # %polly.split_new_and_old
                                        #   in Loop: Header=BB1_10 Depth=2
	movabsq	$2305843009213693951, %rsi # imm = 0x1FFFFFFFFFFFFFFF
	cmpq	%rsi, -56(%rbp)         # 8-byte Folded Reload
	jg	.LBB1_34
# BB#29:                                # %polly.split_new_and_old
                                        #   in Loop: Header=BB1_10 Depth=2
	movabsq	$-2305843009213693952, %rsi # imm = 0xE000000000000000
	cmpq	%rsi, -56(%rbp)         # 8-byte Folded Reload
	jl	.LBB1_34
# BB#30:                                # %polly.split_new_and_old
                                        #   in Loop: Header=BB1_10 Depth=2
	movabsq	$-2305843009213693952, %rsi # imm = 0xE000000000000000
	cmpq	%rsi, %r15
	jl	.LBB1_34
# BB#31:                                # %polly.split_new_and_old
                                        #   in Loop: Header=BB1_10 Depth=2
	movq	-192(%rbp), %rsi        # 8-byte Reload
	cmpq	%rsi, -168(%rbp)        # 8-byte Folded Reload
	jl	.LBB1_34
# BB#32:                                # %polly.split_new_and_old
                                        #   in Loop: Header=BB1_10 Depth=2
	orb	%r12b, -136(%rbp)       # 1-byte Folded Spill
	je	.LBB1_34
# BB#33:                                # %polly.split_new_and_old
                                        #   in Loop: Header=BB1_10 Depth=2
	orb	%dl, %al
	je	.LBB1_34
# BB#197:                               # %polly.loop_if
                                        #   in Loop: Header=BB1_10 Depth=2
	movl	%ecx, -380(%rbp)
	movq	-72(%rbp), %r12         # 8-byte Reload
	movq	%r12, %rax
	imulq	%rdi, %rax
	addq	%r11, %rax
	movq	-112(%rbp), %rdx        # 8-byte Reload
	movl	(%rdx,%rax,4), %eax
	movq	-128(%rbp), %rsi        # 8-byte Reload
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	(%rsi,%r15,4), %eax
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%ecx, %eax
	movq	-104(%rbp), %r14        # 8-byte Reload
	movl	%eax, (%r14,%r11,4)
	leaq	(%rdx,%r11,4), %rdx
	leaq	4(,%rdi,4), %rcx
	imulq	%r12, %rcx
	movl	(%rcx,%rdx), %ecx
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	4(%rsi,%r15,4), %ecx
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%eax, %ecx
	movl	%ecx, (%r14,%r11,4)
	movl	%ecx, -380(%rbp)
	movq	-152(%rbp), %r13        # 8-byte Reload
	leaq	1(%rdi,%r13), %r9
	sarq	%r9
	subq	%rdi, %r9
	cmpq	$1, %r9
	jle	.LBB1_26
# BB#198:                               # %polly.loop_preheader583
                                        #   in Loop: Header=BB1_10 Depth=2
	leaq	(,%rdi,4), %r10
	leaq	12(%r10), %r15
	imulq	%r12, %r15
	addq	%rdx, %r15
	movq	-232(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%rdi,4), %rax
	addq	$4, %rdi
	addq	$8, %r10
	imulq	%r12, %r10
	addq	%rdx, %r10
	xorl	%esi, %esi
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB1_199:                              # %polly.stmt.for.body17.us.us587
                                        #   Parent Loop BB1_8 Depth=1
                                        #     Parent Loop BB1_10 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	(%r10,%rsi,8), %ecx
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	-4(%rax,%rdx,8), %ecx
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	-380(%rbp), %ecx
	movl	%ecx, (%r14,%r11,4)
	movl	(%r15,%rsi,8), %ebx
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	(%rax,%rdx,8), %ebx
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%ecx, %ebx
	movl	%ebx, (%r14,%r11,4)
	movl	%ebx, -380(%rbp)
	leaq	-1(%r9), %rcx
	incq	%rdx
	addq	$2, %rdi
	addq	%r12, %rsi
	cmpq	%rcx, %rdx
	jl	.LBB1_199
	jmp	.LBB1_26
	.p2align	4, 0x90
.LBB1_34:                               # %for.body17.us.us.preheader
                                        #   in Loop: Header=BB1_10 Depth=2
	movq	-72(%rbp), %r12         # 8-byte Reload
	movq	-80(%rbp), %rax         # 8-byte Reload
	.loc	1 42 71                 # MatrixMult.c:42:71
	imulq	%r12, %rax
	movq	-112(%rbp), %rbx        # 8-byte Reload
	leaq	(%rbx,%rax,4), %r9
	movq	-96(%rbp), %rax         # 8-byte Reload
	leaq	(%rax,%rdi), %rdx
	movq	-128(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%rdx,4), %rdx
	movq	%r12, %rsi
	imulq	%rdi, %rsi
	leaq	(%rbx,%rsi,4), %rsi
	.loc	1 42 37                 # MatrixMult.c:42:37
	movq	%r8, %rbx
	movq	-152(%rbp), %r13        # 8-byte Reload
	movq	-104(%rbp), %r14        # 8-byte Reload
	.p2align	4, 0x90
.LBB1_35:                               # %for.body17.us.us
                                        #   Parent Loop BB1_8 Depth=1
                                        #     Parent Loop BB1_10 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	.loc	1 42 75                 # MatrixMult.c:42:75
	movl	(%rsi,%rbx,4), %eax
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	(%rdx), %eax
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%ecx, %eax
	.loc	1 42 35                 # MatrixMult.c:42:35
	movl	%eax, (%r10)
	.loc	1 42 75                 # MatrixMult.c:42:75
	movl	(%r9,%rbx,4), %ecx
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	4(%rdx), %ecx
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%eax, %ecx
	.loc	1 42 35                 # MatrixMult.c:42:35
	movl	%ecx, (%r10)
.Ltmp59:
	.loc	1 41 13 is_stmt 1 discriminator 1 # MatrixMult.c:41:13
	addq	$2, %rdi
	.loc	1 41 22 is_stmt 0 discriminator 1 # MatrixMult.c:41:22
	addq	-88(%rbp), %rbx         # 8-byte Folded Reload
	addq	$8, %rdx
	cmpq	%r13, %rdi
	jl	.LBB1_35
.Ltmp60:
.LBB1_26:                               # %for.inc36.loopexit.us.us
                                        #   in Loop: Header=BB1_10 Depth=2
	.loc	1 39 9 is_stmt 1 discriminator 1 # MatrixMult.c:39:9
	incq	%r8
	movq	-48(%rbp), %rbx         # 8-byte Reload
	incq	%rbx
	.loc	1 39 18 is_stmt 0 discriminator 1 # MatrixMult.c:39:18
	cmpq	%r12, %r8
	movq	-200(%rbp), %r15        # 8-byte Reload
	movq	-56(%rbp), %r11         # 8-byte Reload
	jl	.LBB1_10
	jmp	.LBB1_21
	.p2align	4, 0x90
.LBB1_20:                               # %for.body11.us462.preheader
                                        #   in Loop: Header=BB1_8 Depth=1
.Ltmp61:
	.loc	1 40 21 is_stmt 1       # MatrixMult.c:40:21
	movq	%rcx, %rdi
	imulq	%rdx, %rdi
	movq	%rdx, -272(%rbp)        # 8-byte Spill
	addq	%r9, %rdi
	.loc	1 40 31 is_stmt 0       # MatrixMult.c:40:31
	xorl	%esi, %esi
	movq	-256(%rbp), %rdx        # 8-byte Reload
	callq	memset
.Ltmp62:
.LBB1_21:                               # %for.inc39.loopexit.us
                                        #   in Loop: Header=BB1_8 Depth=1
	movq	-272(%rbp), %rdx        # 8-byte Reload
	.loc	1 37 5 is_stmt 1 discriminator 1 # MatrixMult.c:37:5
	incq	%rdx
	addq	%r12, -96(%rbp)         # 8-byte Folded Spill
	movq	-208(%rbp), %rcx        # 8-byte Reload
	addq	%rcx, -232(%rbp)        # 8-byte Folded Spill
	.loc	1 37 15 is_stmt 0 discriminator 1 # MatrixMult.c:37:15
	cmpq	-264(%rbp), %rdx        # 8-byte Folded Reload
	movq	-64(%rbp), %r9          # 8-byte Reload
	jl	.LBB1_8
	jmp	.LBB1_22
.LBB1_82:                               # %polly.then77
	movb	$1, %al
	testq	%r15, %r15
	js	.LBB1_38
# BB#83:                                # %polly.loop_header81.preheader
	andq	$3, -288(%rbp)          # 8-byte Folded Spill
	je	.LBB1_84
# BB#101:                               # %polly.split_new_and_old1107
	movb	%bl, -48(%rbp)          # 1-byte Spill
	testq	%r15, %r15
	js	.LBB1_268
# BB#102:                               # %polly.split_new_and_old1107
	movq	%r15, %rax
	shlq	$5, %rax
	addq	$32, %rax
	cmpq	%rax, %r8
	jge	.LBB1_268
# BB#103:                               # %polly.loop_header81.preheader6
	movq	-288(%rbp), %rax        # 8-byte Reload
	shlq	$2, %rax
	movq	%rax, -288(%rbp)        # 8-byte Spill
	movq	-280(%rbp), %rcx        # 8-byte Reload
	subq	%rax, %rcx
	movq	-64(%rbp), %rax         # 8-byte Reload
	addq	%rax, %rcx
	movq	%rcx, -56(%rbp)         # 8-byte Spill
	movq	%r15, -336(%rbp)        # 8-byte Spill
	incq	%r15
	movl	$31, %ebx
	movq	%rax, -88(%rbp)         # 8-byte Spill
	movq	-368(%rbp), %r13        # 8-byte Reload
	.p2align	4, 0x90
.LBB1_104:                              # %polly.loop_header81
                                        # =>This Inner Loop Header: Depth=1
	testq	%r13, %r13
	js	.LBB1_106
# BB#105:                               # %polly.loop_preheader100.preheader
                                        #   in Loop: Header=BB1_104 Depth=1
	movq	-360(%rbp), %rsi        # 8-byte Reload
	cmpq	$-9, %rsi
	movq	$-8, %rdx
	cmovgq	%rsi, %rdx
	shlq	$4, %rdx
	negq	%rdx
	xorl	%esi, %esi
	movq	%rax, %r14
	movq	-88(%rbp), %rdi         # 8-byte Reload
	movq	%r8, %r12
	callq	memset
	movq	%r12, %r8
	movq	%r14, %rax
.LBB1_106:                              # %polly.cond110
                                        #   in Loop: Header=BB1_104 Depth=1
	cmpq	-72(%rbp), %rbx         # 8-byte Folded Reload
	jl	.LBB1_108
# BB#107:                               # %polly.stmt.for.body11125.preheader
                                        #   in Loop: Header=BB1_104 Depth=1
	xorl	%esi, %esi
	movq	%rax, %r14
	movq	-56(%rbp), %rdi         # 8-byte Reload
	movq	-288(%rbp), %rdx        # 8-byte Reload
	movq	%r8, %r12
	callq	memset
	movq	%r12, %r8
	movq	%r14, %rax
.LBB1_108:                              # %polly.merge111
                                        #   in Loop: Header=BB1_104 Depth=1
	addq	$32, %rbx
	subq	$-128, -88(%rbp)        # 8-byte Folded Spill
	addq	$-8, %r13
	addq	$8, -360(%rbp)          # 8-byte Folded Spill
	decq	%r15
	jne	.LBB1_104
# BB#109:
	movq	%rax, -64(%rbp)         # 8-byte Spill
	jmp	.LBB1_110
.LBB1_84:                               # %polly.split_new_and_old1149
	movl	%r15d, %eax
	andl	$1, %eax
	movb	%r15b, %dl
	notb	%dl
	movq	%rax, %rcx
	orq	%r13, %rcx
	movq	%r13, %r14
	sete	%cl
	testb	$1, %dl
	je	.LBB1_280
# BB#85:                                # %polly.split_new_and_old1149
	testb	%cl, %cl
	jne	.LBB1_280
# BB#86:                                # %polly.loop_header81.us.preheader
	xorl	%edi, %edi
	testb	$1, %r15b
	movq	-64(%rbp), %r9          # 8-byte Reload
	movl	-116(%rbp), %r13d       # 4-byte Reload
	jne	.LBB1_89
# BB#87:                                # %polly.loop_header81.us.prol
	movl	$1, %edi
	testq	%r14, %r14
	je	.LBB1_89
# BB#88:                                # %polly.loop_preheader100.preheader.us.prol
	movq	%r14, %rax
	negq	%rax
	cmpq	$-9, %rax
	movq	$-8, %rdx
	cmovgq	%rax, %rdx
	shlq	$4, %rdx
	negq	%rdx
	xorl	%esi, %esi
	movb	%bl, -48(%rbp)          # 1-byte Spill
	movq	%r9, %rbx
	movq	%rbx, %rdi
	movq	%r8, %r12
	callq	memset
	movq	%r12, %r8
	movq	%rbx, %r9
	movb	-48(%rbp), %bl          # 1-byte Reload
	movl	$1, %edi
	jmp	.LBB1_89
.LBB1_268:                              # %polly.loop_if1112
	movq	%r15, %rax
	leaq	-1(%r13), %r15
	sarq	$3, %r15
	cmpq	%r15, %rax
	cmovleq	%rax, %r15
	movq	%rax, %r12
	testq	%r15, %r15
	js	.LBB1_269
# BB#270:                               # %polly.loop_preheader1114
	movq	%r8, -168(%rbp)         # 8-byte Spill
	negq	%r13
	movq	$-1, %rbx
	decq	%r15
	movq	-64(%rbp), %r14         # 8-byte Reload
	.p2align	4, 0x90
.LBB1_271:                              # %polly.stmt.polly.loop_preheader100.preheader
                                        # =>This Inner Loop Header: Depth=1
	cmpq	$-9, %r13
	movq	$-8, %rdx
	cmovgq	%r13, %rdx
	shlq	$4, %rdx
	negq	%rdx
	xorl	%esi, %esi
	movq	%r14, %rdi
	callq	memset
	incq	%rbx
	subq	$-128, %r14
	addq	$8, %r13
	cmpq	%r15, %rbx
	jle	.LBB1_271
# BB#272:
	movb	-48(%rbp), %al          # 1-byte Reload
	movq	-168(%rbp), %r8         # 8-byte Reload
	movq	%r12, %r15
	jmp	.LBB1_38
.LBB1_280:                              # %polly.cond1153
	movq	$0, -960(%rbp)
	testq	%rax, %rax
	movq	-64(%rbp), %r9          # 8-byte Reload
	movl	-116(%rbp), %r13d       # 4-byte Reload
	je	.LBB1_282
# BB#281:                               # %polly.exiting1152
	movq	-960(%rbp), %rdi
	jmp	.LBB1_89
.LBB1_269:
	movb	-48(%rbp), %al          # 1-byte Reload
	movq	%r12, %r15
	jmp	.LBB1_38
.LBB1_282:                              # %polly.stmt.polly.cond110.us.prol
	movq	$1, -960(%rbp)
	movq	-960(%rbp), %rdi
.LBB1_89:                               # %polly.loop_header81.us.preheader.split
	testq	%r15, %r15
	je	.LBB1_90
# BB#91:                                # %polly.split_new_and_old1123
	movb	%bl, -48(%rbp)          # 1-byte Spill
	movq	%r15, %rdx
	leaq	(,%rdi,8), %r15
	leaq	8(,%rdi,8), %rcx
	movl	%edi, %eax
	subl	%edx, %eax
	incl	%eax
	andl	$1, %eax
	cmpq	%r14, %rcx
	jl	.LBB1_94
# BB#92:                                # %polly.split_new_and_old1123
	leaq	1(%rdi), %rcx
	cmpq	%rcx, %rdx
	jl	.LBB1_94
# BB#93:                                # %polly.split_new_and_old1123
	testq	%rax, %rax
	jne	.LBB1_94
# BB#273:                               # %polly.cond1128
	movl	%edi, %eax
	subl	%edx, %eax
	incl	%eax
	testb	$1, %al
	movb	-48(%rbp), %bl          # 1-byte Reload
	je	.LBB1_275
# BB#274:
	movl	%r13d, -116(%rbp)       # 4-byte Spill
	movq	%r9, -64(%rbp)          # 8-byte Spill
	movb	%bl, %al
	movq	%rdx, %r15
	jmp	.LBB1_38
.LBB1_90:
	movl	%r13d, -116(%rbp)       # 4-byte Spill
	movq	%r9, -64(%rbp)          # 8-byte Spill
	movb	%bl, %al
	jmp	.LBB1_38
.LBB1_94:                               # %polly.loop_header81.us.preheader5
	movq	%rdi, %rax
	shlq	$7, %rax
	leaq	128(%rax,%r9), %rcx
	leaq	1(%rdx), %r12
	movq	%rdx, -336(%rbp)        # 8-byte Spill
	subq	%rdi, %r12
	leaq	-9(%r14), %rbx
	subq	%r15, %rbx
	addq	$8, %r15
	subq	%r14, %r15
.LBB1_95:                               # %polly.loop_header81.us
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rax
	addq	$8, %rax
	js	.LBB1_96
# BB#100:                               # %polly.loop_preheader100.preheader.us
                                        #   in Loop: Header=BB1_95 Depth=1
	leaq	-8(%r15), %rdx
	cmpq	$-9, %rdx
	movq	$-8, %rax
	cmovleq	%rax, %rdx
	shlq	$4, %rdx
	negq	%rdx
	leaq	-128(%rcx), %rdi
	xorl	%esi, %esi
	movq	%r8, %r13
	movq	%rcx, %r14
	callq	memset
	movq	%r14, %rcx
	movq	%r13, %r8
	movl	-116(%rbp), %r13d       # 4-byte Reload
	movq	-64(%rbp), %r9          # 8-byte Reload
.LBB1_96:                               # %polly.cond110.us
                                        #   in Loop: Header=BB1_95 Depth=1
	testq	%rbx, %rbx
	js	.LBB1_98
# BB#97:                                # %polly.loop_preheader100.preheader.us.1
                                        #   in Loop: Header=BB1_95 Depth=1
	cmpq	$-9, %r15
	movq	$-8, %rdx
	cmovgq	%r15, %rdx
	shlq	$4, %rdx
	negq	%rdx
	xorl	%esi, %esi
	movq	%rcx, %rdi
	movq	%r8, %r13
	movq	%rcx, %r14
	callq	memset
	movq	%r14, %rcx
	movq	%r13, %r8
	movl	-116(%rbp), %r13d       # 4-byte Reload
	movq	-64(%rbp), %r9          # 8-byte Reload
.LBB1_98:                               # %polly.cond110.us.1
                                        #   in Loop: Header=BB1_95 Depth=1
	addq	$256, %rcx              # imm = 0x100
	addq	$-16, %rbx
	addq	$16, %r15
	addq	$-2, %r12
	jne	.LBB1_95
# BB#99:
	movl	%r13d, -116(%rbp)       # 4-byte Spill
	movq	%r9, -64(%rbp)          # 8-byte Spill
.LBB1_110:                              # %polly.merge76
	movb	-48(%rbp), %al          # 1-byte Reload
	movq	-336(%rbp), %r15        # 8-byte Reload
.LBB1_38:                               # %polly.merge76
	movl	%eax, -700(%rbp)        # 4-byte Spill
	movq	%r8, -168(%rbp)         # 8-byte Spill
	cmpq	$0, -568(%rbp)          # 8-byte Folded Reload
	movq	-72(%rbp), %rsi         # 8-byte Reload
	js	.LBB1_39
# BB#111:                               # %polly.loop_preheader133
	movq	-576(%rbp), %rax        # 8-byte Reload
	sarq	$5, %rax
	movq	%rax, -808(%rbp)        # 8-byte Spill
	movq	-176(%rbp), %rdx        # 8-byte Reload
	movq	%rdx, %rax
	shrq	$2, %rax
	movq	%rax, -264(%rbp)        # 8-byte Spill
	decq	%rax
	movq	%rax, -1016(%rbp)       # 8-byte Spill
	movl	-116(%rbp), %eax        # 4-byte Reload
	movl	%eax, %edi
	andl	$3, %edi
	movq	%rdi, -96(%rbp)         # 8-byte Spill
	movq	%rdx, %rbx
	subq	%rdi, %rbx
	movq	%rbx, -392(%rbp)        # 8-byte Spill
	leaq	-1(%rdi), %rcx
	movq	%rcx, -896(%rbp)        # 8-byte Spill
	andl	$1, %eax
	movq	%rax, -600(%rbp)        # 8-byte Spill
	movq	%rbx, %rax
	imulq	%rsi, %rax
	movq	%rax, -616(%rbp)        # 8-byte Spill
	leaq	(,%rdi,4), %r8
	movq	-128(%rbp), %rcx        # 8-byte Reload
	leaq	4(%rcx), %rax
	movq	%rax, -1008(%rbp)       # 8-byte Spill
	leaq	8(%rcx), %rax
	movq	%rax, -1000(%rbp)       # 8-byte Spill
	leaq	1(%rdx), %rax
	subq	%rdi, %rax
	movq	%rax, -888(%rbp)        # 8-byte Spill
	movl	$4, %eax
	subq	%r8, %rax
	movq	%rax, -864(%rbp)        # 8-byte Spill
	leaq	(%rsi,%rsi,2), %rax
	movq	-112(%rbp), %rdx        # 8-byte Reload
	leaq	(%rdx,%rax,4), %rax
	movq	%rax, -984(%rbp)        # 8-byte Spill
	movq	%rsi, %rax
	shlq	$4, %rax
	movq	%rax, -904(%rbp)        # 8-byte Spill
	leaq	12(%rcx), %r8
	movq	%r8, -992(%rbp)         # 8-byte Spill
	leaq	(,%rsi,8), %rax
	movq	%rax, -344(%rbp)        # 8-byte Spill
	leaq	-2(%rdi), %rax
	movq	%rax, -856(%rbp)        # 8-byte Spill
	leaq	(%rcx,%rbx,4), %rax
	movq	%rax, -800(%rbp)        # 8-byte Spill
	leaq	(%rsi,%rsi), %rax
	movq	%rax, -136(%rbp)        # 8-byte Spill
	leaq	(%rdx,%rsi,8), %rax
	movq	%rax, -976(%rbp)        # 8-byte Spill
	leaq	(%rdx,%rsi,4), %rax
	movq	%rax, -968(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -656(%rbp)        # 8-byte Spill
	movq	%r8, -768(%rbp)         # 8-byte Spill
	movq	%rbx, -664(%rbp)        # 8-byte Spill
	.p2align	4, 0x90
.LBB1_112:                              # %polly.loop_header132
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_114 Depth 2
                                        #       Child Loop BB1_116 Depth 3
                                        #         Child Loop BB1_118 Depth 4
                                        #           Child Loop BB1_154 Depth 5
                                        #             Child Loop BB1_168 Depth 6
                                        #             Child Loop BB1_243 Depth 6
                                        #           Child Loop BB1_121 Depth 5
                                        #             Child Loop BB1_128 Depth 6
                                        #             Child Loop BB1_266 Depth 6
                                        #             Child Loop BB1_143 Depth 6
                                        #             Child Loop BB1_256 Depth 6
	testq	%r15, %r15
	js	.LBB1_139
# BB#113:                               # %polly.loop_header142.preheader
                                        #   in Loop: Header=BB1_112 Depth=1
	movq	%rsi, %rcx
	movq	-656(%rbp), %rax        # 8-byte Reload
	imulq	%rax, %rcx
	movq	%rcx, -152(%rbp)        # 8-byte Spill
	movq	%rax, %rcx
	shlq	$5, %rcx
	movq	%rcx, -1056(%rbp)       # 8-byte Spill
	movq	-448(%rbp), %rdx        # 8-byte Reload
	subq	%rcx, %rdx
	decq	%rdx
	cmpq	$31, %rdx
	movl	$31, %ecx
	cmovgq	%rcx, %rdx
	movq	%rdx, -1032(%rbp)       # 8-byte Spill
	leaq	-1(%rdx), %rcx
	movq	%rcx, -1072(%rbp)       # 8-byte Spill
	shlq	$7, %rax
	movq	%rax, -872(%rbp)        # 8-byte Spill
	movq	-968(%rbp), %rax        # 8-byte Reload
	movq	%rax, -792(%rbp)        # 8-byte Spill
	movq	-976(%rbp), %rax        # 8-byte Reload
	movq	%rax, -784(%rbp)        # 8-byte Spill
	movq	-984(%rbp), %rax        # 8-byte Reload
	movq	%rax, -776(%rbp)        # 8-byte Spill
	movq	-112(%rbp), %rax        # 8-byte Reload
	movq	%rax, -584(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -472(%rbp)        # 8-byte Spill
	.p2align	4, 0x90
.LBB1_114:                              # %polly.loop_header142
                                        #   Parent Loop BB1_112 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_116 Depth 3
                                        #         Child Loop BB1_118 Depth 4
                                        #           Child Loop BB1_154 Depth 5
                                        #             Child Loop BB1_168 Depth 6
                                        #             Child Loop BB1_243 Depth 6
                                        #           Child Loop BB1_121 Depth 5
                                        #             Child Loop BB1_128 Depth 6
                                        #             Child Loop BB1_266 Depth 6
                                        #             Child Loop BB1_143 Depth 6
                                        #             Child Loop BB1_256 Depth 6
	cmpq	$0, -808(%rbp)          # 8-byte Folded Reload
	js	.LBB1_138
# BB#115:                               # %polly.loop_header152.preheader
                                        #   in Loop: Header=BB1_114 Depth=2
	movq	-472(%rbp), %rax        # 8-byte Reload
	movq	%rax, %rcx
	movq	%rcx, %rdx
	shlq	$5, %rdx
	movq	%rdx, -80(%rbp)         # 8-byte Spill
	movq	%rsi, %rax
	subq	%rdx, %rax
	decq	%rax
	cmpq	$31, %rax
	movl	$31, %edx
	cmovleq	%rax, %rdx
	movq	%rdx, -1080(%rbp)       # 8-byte Spill
	leaq	-1(%rdx), %rax
	movq	%rax, -624(%rbp)        # 8-byte Spill
	shlq	$7, %rcx
	movq	-64(%rbp), %rax         # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	movq	%rax, -1040(%rbp)       # 8-byte Spill
	addq	-112(%rbp), %rcx        # 8-byte Folded Reload
	movq	%rcx, -1024(%rbp)       # 8-byte Spill
	movq	-584(%rbp), %rax        # 8-byte Reload
	movq	%rax, -848(%rbp)        # 8-byte Spill
	movq	-792(%rbp), %rax        # 8-byte Reload
	movq	%rax, -840(%rbp)        # 8-byte Spill
	movq	-784(%rbp), %rax        # 8-byte Reload
	movq	%rax, -832(%rbp)        # 8-byte Spill
	movq	-768(%rbp), %rax        # 8-byte Reload
	movq	%rax, -816(%rbp)        # 8-byte Spill
	movq	-776(%rbp), %rax        # 8-byte Reload
	movq	%rax, -824(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -608(%rbp)        # 8-byte Spill
	.p2align	4, 0x90
.LBB1_116:                              # %polly.loop_header152
                                        #   Parent Loop BB1_112 Depth=1
                                        #     Parent Loop BB1_114 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_118 Depth 4
                                        #           Child Loop BB1_154 Depth 5
                                        #             Child Loop BB1_168 Depth 6
                                        #             Child Loop BB1_243 Depth 6
                                        #           Child Loop BB1_121 Depth 5
                                        #             Child Loop BB1_128 Depth 6
                                        #             Child Loop BB1_266 Depth 6
                                        #             Child Loop BB1_143 Depth 6
                                        #             Child Loop BB1_256 Depth 6
	cmpq	$0, -1032(%rbp)         # 8-byte Folded Reload
	js	.LBB1_147
# BB#117:                               # %polly.loop_header161.preheader
                                        #   in Loop: Header=BB1_116 Depth=3
	cmpq	$0, -96(%rbp)           # 8-byte Folded Reload
	sete	%al
	movq	-608(%rbp), %rdx        # 8-byte Reload
	leaq	(,%rdx,8), %rcx
	movq	%rcx, -272(%rbp)        # 8-byte Spill
	movq	-1016(%rbp), %rdi       # 8-byte Reload
	subq	%rcx, %rdi
	cmpq	$7, %rdi
	movl	$7, %ecx
	cmovgq	%rcx, %rdi
	movq	%rdi, -1064(%rbp)       # 8-byte Spill
	movq	%rdx, %rcx
	shlq	$5, %rcx
	movq	%rcx, -1168(%rbp)       # 8-byte Spill
	decq	%rdi
	movq	%rdi, -1160(%rbp)       # 8-byte Spill
	leaq	31(%rcx), %rcx
	movq	%rcx, -1048(%rbp)       # 8-byte Spill
	cmpq	-176(%rbp), %rcx        # 8-byte Folded Reload
	setl	%cl
	orb	%al, %cl
	movb	%cl, -209(%rbp)         # 1-byte Spill
	shlq	$7, %rdx
	movq	-128(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%rdx), %rax
	movq	%rax, -1136(%rbp)       # 8-byte Spill
	movq	%rsi, %rax
	imulq	%rdx, %rax
	movq	-1024(%rbp), %rcx       # 8-byte Reload
	addq	%rcx, %rax
	movq	%rax, -1128(%rbp)       # 8-byte Spill
	movq	-1008(%rbp), %rax       # 8-byte Reload
	leaq	(%rax,%rdx), %rax
	movq	%rax, -1120(%rbp)       # 8-byte Spill
	leaq	4(%rdx), %rax
	imulq	%rsi, %rax
	addq	%rcx, %rax
	movq	%rax, -1112(%rbp)       # 8-byte Spill
	movq	-1000(%rbp), %rax       # 8-byte Reload
	leaq	(%rax,%rdx), %rax
	movq	%rax, -1104(%rbp)       # 8-byte Spill
	leaq	8(%rdx), %rax
	imulq	%rsi, %rax
	addq	%rcx, %rax
	movq	%rax, -1096(%rbp)       # 8-byte Spill
	movq	-992(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%rdx), %rax
	movq	%rax, -1088(%rbp)       # 8-byte Spill
	orq	$12, %rdx
	imulq	%rsi, %rdx
	addq	%rcx, %rdx
	movq	%rdx, -1144(%rbp)       # 8-byte Spill
	movq	-816(%rbp), %rax        # 8-byte Reload
	movq	%rax, -680(%rbp)        # 8-byte Spill
	movq	-800(%rbp), %rcx        # 8-byte Reload
	movq	-664(%rbp), %rax        # 8-byte Reload
	movq	%rax, -880(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_118:                              # %polly.loop_header161
                                        #   Parent Loop BB1_112 Depth=1
                                        #     Parent Loop BB1_114 Depth=2
                                        #       Parent Loop BB1_116 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB1_154 Depth 5
                                        #             Child Loop BB1_168 Depth 6
                                        #             Child Loop BB1_243 Depth 6
                                        #           Child Loop BB1_121 Depth 5
                                        #             Child Loop BB1_128 Depth 6
                                        #             Child Loop BB1_266 Depth 6
                                        #             Child Loop BB1_143 Depth 6
                                        #             Child Loop BB1_256 Depth 6
	movq	%rax, -672(%rbp)        # 8-byte Spill
	movq	%rcx, -592(%rbp)        # 8-byte Spill
	cmpq	$0, -1080(%rbp)         # 8-byte Folded Reload
	js	.LBB1_146
# BB#119:                               # %polly.loop_header170.preheader
                                        #   in Loop: Header=BB1_118 Depth=4
	movq	-72(%rbp), %rax         # 8-byte Reload
	movq	%rax, %rcx
	movq	-672(%rbp), %rdx        # 8-byte Reload
	imulq	%rdx, %rcx
	movq	%rcx, -192(%rbp)        # 8-byte Spill
	movq	-1056(%rbp), %rcx       # 8-byte Reload
	leaq	(%rdx,%rcx), %rcx
	movq	%rcx, %rsi
	imulq	-280(%rbp), %rsi        # 8-byte Folded Reload
	movq	%rsi, -912(%rbp)        # 8-byte Spill
	imulq	%rax, %rcx
	cmpq	$0, -1064(%rbp)         # 8-byte Folded Reload
	js	.LBB1_150
# BB#120:                               # %polly.loop_preheader189.preheader.us.preheader
                                        #   in Loop: Header=BB1_118 Depth=4
	addq	-392(%rbp), %rcx        # 8-byte Folded Reload
	movq	%rcx, -464(%rbp)        # 8-byte Spill
	movq	-872(%rbp), %rcx        # 8-byte Reload
	leaq	(%rcx,%rdx,4), %rcx
	imulq	%rax, %rcx
	movq	%rcx, -1152(%rbp)       # 8-byte Spill
	movq	-584(%rbp), %rax        # 8-byte Reload
	movq	%rax, -688(%rbp)        # 8-byte Spill
	movq	-848(%rbp), %r15        # 8-byte Reload
	movq	-840(%rbp), %r13        # 8-byte Reload
	movq	-832(%rbp), %rax        # 8-byte Reload
	movq	-824(%rbp), %rcx        # 8-byte Reload
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB1_121:                              # %polly.split_new_and_old986
                                        #   Parent Loop BB1_112 Depth=1
                                        #     Parent Loop BB1_114 Depth=2
                                        #       Parent Loop BB1_116 Depth=3
                                        #         Parent Loop BB1_118 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB1_128 Depth 6
                                        #             Child Loop BB1_266 Depth 6
                                        #             Child Loop BB1_143 Depth 6
                                        #             Child Loop BB1_256 Depth 6
	movq	%rsi, -88(%rbp)         # 8-byte Spill
	movq	%rcx, -160(%rbp)        # 8-byte Spill
	movq	%rax, -200(%rbp)        # 8-byte Spill
	movq	%r13, -48(%rbp)         # 8-byte Spill
	movq	%r15, -56(%rbp)         # 8-byte Spill
	movabsq	$72057594037927935, %rax # imm = 0xFFFFFFFFFFFFFF
	movq	%rax, %r8
	movq	-608(%rbp), %r9         # 8-byte Reload
	cmpq	%r8, %r9
	setle	%cl
	movb	%cl, -208(%rbp)         # 1-byte Spill
	leaq	1(,%r9,8), %rax
	movq	-264(%rbp), %rbx        # 8-byte Reload
	cmpq	%rax, %rbx
	setge	%dl
	movabsq	$2305843009213693951, %r15 # imm = 0x1FFFFFFFFFFFFFFF
	movq	-192(%rbp), %r14        # 8-byte Reload
	cmpq	%r15, %r14
	setle	%al
	movb	%al, -432(%rbp)         # 1-byte Spill
	andb	%al, %cl
	movb	%cl, -256(%rbp)         # 1-byte Spill
	andb	%cl, %dl
	movabsq	$-2305843009213693952, %r12 # imm = 0xE000000000000000
	cmpq	%r12, %r14
	setge	%cl
	movb	%cl, -504(%rbp)         # 1-byte Spill
	movq	-152(%rbp), %rdi        # 8-byte Reload
	leaq	(%r9,%rdi), %rax
	cmpq	%r8, %rax
	setle	%al
	movb	%al, -296(%rbp)         # 1-byte Spill
	andb	%al, %cl
	movb	%cl, -224(%rbp)         # 1-byte Spill
	andb	%cl, %dl
	movabsq	$-72057594037927936, %rax # imm = 0xFF00000000000000
	cmpq	%rax, %rdi
	setge	%r10b
	movb	%r10b, -184(%rbp)       # 1-byte Spill
	leaq	(%r14,%rbx,4), %r8
	shlq	$5, %rdi
	movq	%rdi, -232(%rbp)        # 8-byte Spill
	leaq	(%r8,%rdi), %rcx
	movq	%rcx, -144(%rbp)        # 8-byte Spill
	leaq	1(%r15), %rax
	movq	%rax, -632(%rbp)        # 8-byte Spill
	cmpq	%rax, %rcx
	setle	%cl
	andb	%r10b, %cl
	andb	%dl, %cl
	movq	-1168(%rbp), %r11       # 8-byte Reload
	leaq	(%r11,%r14), %rdx
	addq	%rdi, %rdx
	cmpq	%r12, %rdx
	setge	%al
	movb	%al, -248(%rbp)         # 1-byte Spill
	andb	%al, %cl
	movq	-80(%rbp), %rax         # 8-byte Reload
	leaq	1(%rsi,%rax), %rax
	movq	%rax, -640(%rbp)        # 8-byte Spill
	movq	-168(%rbp), %r10        # 8-byte Reload
	cmpq	%rax, %r10
	setge	-104(%rbp)              # 1-byte Folded Spill
	cmpq	%rbx, -272(%rbp)        # 8-byte Folded Reload
	setge	%r13b
	leaq	-3(%r15), %rdi
	cmpq	%rdi, %rdx
	setle	%sil
	cmpq	%rax, %r10
	setge	-240(%rbp)              # 1-byte Folded Spill
	leaq	5(%r15), %rdi
	cmpq	%rdi, -144(%rbp)        # 8-byte Folded Reload
	setge	-440(%rbp)              # 1-byte Folded Spill
	leaq	-31(%r15), %rdi
	cmpq	%rdi, %rdx
	setle	-496(%rbp)              # 1-byte Folded Spill
	cmpq	%rax, %r10
	setge	-488(%rbp)              # 1-byte Folded Spill
	leaq	9(,%r9,8), %rdi
	cmpq	%rdi, %rbx
	setge	-480(%rbp)              # 1-byte Folded Spill
	movabsq	$1152921504606846976, %rdi # imm = 0x1000000000000000
	leaq	(%rdi,%r9,8), %rdi
	cmpq	%rbx, %rdi
	setge	-424(%rbp)              # 1-byte Folded Spill
	leaq	35(%r11), %rdi
	cmpq	%rdi, %r8
	setge	-376(%rbp)              # 1-byte Folded Spill
	leaq	3(%r12), %rdi
	cmpq	%rdi, %r14
	setge	-368(%rbp)              # 1-byte Folded Spill
	movabsq	$4611686018427387905, %r9 # imm = 0x4000000000000001
	leaq	2(%r9), %rdi
	cmpq	%rdi, %r8
	leaq	4(%r15), %rdi
	setle	-360(%rbp)              # 1-byte Folded Spill
	movq	-144(%rbp), %rdx        # 8-byte Reload
	cmpq	%rdi, %rdx
	sete	-416(%rbp)              # 1-byte Folded Spill
	cmpq	%rax, %r10
	leaq	34(%r11), %rdi
	setge	-328(%rbp)              # 1-byte Folded Spill
	cmpq	%rdi, %r8
	leaq	-1(%r15), %rdi
	setge	-352(%rbp)              # 1-byte Folded Spill
	cmpq	%rdi, %r14
	leaq	2(%r12), %rdi
	setle	-304(%rbp)              # 1-byte Folded Spill
	cmpq	%rdi, %r14
	leaq	1(%r9), %rbx
	setge	%dil
	cmpq	%rbx, %r8
	leaq	3(%r15), %rbx
	setle	-288(%rbp)              # 1-byte Folded Spill
	cmpq	%rbx, %rdx
	sete	-400(%rbp)              # 1-byte Folded Spill
	cmpq	%rax, %r10
	leaq	33(%r11), %rbx
	setge	-408(%rbp)              # 1-byte Folded Spill
	cmpq	%rbx, %r8
	leaq	-2(%r15), %rbx
	setge	-696(%rbp)              # 1-byte Folded Spill
	cmpq	%rbx, %r14
	leaq	1(%r12), %rbx
	setle	-648(%rbp)              # 1-byte Folded Spill
	cmpq	%rbx, %r14
	setge	%r11b
	cmpq	%r9, %r8
	leaq	2(%r15), %rbx
	setle	%r9b
	cmpq	%rbx, %rdx
	sete	%r8b
	cmpq	%rax, %r10
	movb	-248(%rbp), %r10b       # 1-byte Reload
	movb	-184(%rbp), %dl         # 1-byte Reload
	setge	%r14b
	testb	-104(%rbp), %cl         # 1-byte Folded Reload
	movq	-80(%rbp), %rax         # 8-byte Reload
	movq	-88(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax), %rax
	movq	%rax, -104(%rbp)        # 8-byte Spill
	movq	-912(%rbp), %rcx        # 8-byte Reload
	leaq	(%rcx,%rax,4), %rbx
	movb	-208(%rbp), %al         # 1-byte Reload
	movq	%rbx, -144(%rbp)        # 8-byte Spill
	movq	-64(%rbp), %rcx         # 8-byte Reload
	movl	(%rcx,%rbx), %r12d
	movb	-256(%rbp), %cl         # 1-byte Reload
	jne	.LBB1_265
# BB#122:                               # %polly.split_new_and_old986
                                        #   in Loop: Header=BB1_121 Depth=5
	andb	%cl, %r13b
	andb	-224(%rbp), %r13b       # 1-byte Folded Reload
	andb	%dl, %r13b
	andb	%r10b, %sil
	andb	%r13b, %sil
	andb	-240(%rbp), %sil        # 1-byte Folded Reload
	jne	.LBB1_265
# BB#123:                               # %polly.split_new_and_old986
                                        #   in Loop: Header=BB1_121 Depth=5
	andb	-504(%rbp), %cl         # 1-byte Folded Reload
	movb	-296(%rbp), %bl         # 1-byte Reload
	andb	%dl, %bl
	andb	%cl, %bl
	andb	-440(%rbp), %bl         # 1-byte Folded Reload
	movb	-496(%rbp), %cl         # 1-byte Reload
	andb	%r10b, %cl
	andb	%bl, %cl
	andb	-488(%rbp), %cl         # 1-byte Folded Reload
	jne	.LBB1_265
# BB#124:                               # %polly.split_new_and_old986
                                        #   in Loop: Header=BB1_121 Depth=5
	andb	-480(%rbp), %al         # 1-byte Folded Reload
	andb	-424(%rbp), %al         # 1-byte Folded Reload
	movb	-376(%rbp), %dl         # 1-byte Reload
	andb	-368(%rbp), %dl         # 1-byte Folded Reload
	andb	%al, %dl
	movb	-432(%rbp), %cl         # 1-byte Reload
	andb	-360(%rbp), %cl         # 1-byte Folded Reload
	andb	-416(%rbp), %cl         # 1-byte Folded Reload
	andb	%dl, %cl
	andb	-328(%rbp), %cl         # 1-byte Folded Reload
	jne	.LBB1_265
# BB#125:                               # %polly.split_new_and_old986
                                        #   in Loop: Header=BB1_121 Depth=5
	movb	-352(%rbp), %cl         # 1-byte Reload
	andb	-304(%rbp), %cl         # 1-byte Folded Reload
	andb	%al, %cl
	andb	-288(%rbp), %dil        # 1-byte Folded Reload
	andb	-400(%rbp), %dil        # 1-byte Folded Reload
	andb	%cl, %dil
	andb	-408(%rbp), %dil        # 1-byte Folded Reload
	jne	.LBB1_265
# BB#126:                               # %polly.split_new_and_old986
                                        #   in Loop: Header=BB1_121 Depth=5
	movb	-696(%rbp), %cl         # 1-byte Reload
	andb	-648(%rbp), %cl         # 1-byte Folded Reload
	andb	%cl, %al
	andb	%r9b, %r11b
	andb	%r8b, %r11b
	andb	%r14b, %r11b
	andb	%al, %r11b
	movq	$-1, %r8
	jne	.LBB1_265
# BB#127:                               #   in Loop: Header=BB1_121 Depth=5
	movq	-56(%rbp), %r15         # 8-byte Reload
	movq	%r15, %r9
	movq	-48(%rbp), %r13         # 8-byte Reload
	movq	%r13, %rdx
	movq	-200(%rbp), %rsi        # 8-byte Reload
	movq	-680(%rbp), %rdi        # 8-byte Reload
	movq	-160(%rbp), %rbx        # 8-byte Reload
	movq	-904(%rbp), %r10        # 8-byte Reload
	movq	-136(%rbp), %r11        # 8-byte Reload
	movq	-1160(%rbp), %r14       # 8-byte Reload
	.p2align	4, 0x90
.LBB1_128:                              # %polly.loop_preheader189.us
                                        #   Parent Loop BB1_112 Depth=1
                                        #     Parent Loop BB1_114 Depth=2
                                        #       Parent Loop BB1_116 Depth=3
                                        #         Parent Loop BB1_118 Depth=4
                                        #           Parent Loop BB1_121 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movl	(%r9), %eax
.Ltmp63:
	.loc	1 42 74 is_stmt 1       # MatrixMult.c:42:74
	imull	-12(%rdi), %eax
	.loc	1 42 55 is_stmt 0       # MatrixMult.c:42:55
	addl	%r12d, %eax
	movl	(%rdx), %ecx
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	-8(%rdi), %ecx
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%eax, %ecx
	movl	(%rsi), %eax
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	-4(%rdi), %eax
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%ecx, %eax
	movl	(%rbx), %r12d
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	(%rdi), %r12d
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%eax, %r12d
	incq	%r8
	addq	%r10, %rbx
	addq	$16, %rdi
	addq	%r10, %rsi
	addq	%r10, %rdx
	addq	%r10, %r9
	cmpq	%r14, %r8
	jle	.LBB1_128
	jmp	.LBB1_129
	.p2align	4, 0x90
.LBB1_265:                              # %polly.loop_if990
                                        #   in Loop: Header=BB1_121 Depth=5
	movq	-264(%rbp), %rcx        # 8-byte Reload
	subq	-272(%rbp), %rcx        # 8-byte Folded Reload
	decq	%rcx
	cmpq	$6, %rcx
	movl	$7, %r9d
	cmovleq	%rcx, %r9
	movl	%r12d, -316(%rbp)
	movq	$-1, %rcx
	testq	%r9, %r9
	movq	-680(%rbp), %rdx        # 8-byte Reload
	movl	$0, %esi
	movq	-904(%rbp), %r8         # 8-byte Reload
	movq	-56(%rbp), %r15         # 8-byte Reload
	movq	-48(%rbp), %r13         # 8-byte Reload
	movq	-200(%rbp), %r10        # 8-byte Reload
	movq	-160(%rbp), %rax        # 8-byte Reload
	js	.LBB1_263
	.p2align	4, 0x90
.LBB1_266:                              # %polly.stmt.polly.loop_preheader189.us
                                        #   Parent Loop BB1_112 Depth=1
                                        #     Parent Loop BB1_114 Depth=2
                                        #       Parent Loop BB1_116 Depth=3
                                        #         Parent Loop BB1_118 Depth=4
                                        #           Parent Loop BB1_121 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	incq	%rcx
	movl	(%r15,%rsi), %edi
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	-12(%rdx), %edi
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	-316(%rbp), %edi
	movl	(%r13,%rsi), %ebx
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	-8(%rdx), %ebx
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%edi, %ebx
	movl	(%r10,%rsi), %edi
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	-4(%rdx), %edi
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%ebx, %edi
	movl	(%rax,%rsi), %ebx
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	(%rdx), %ebx
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%edi, %ebx
	movl	%ebx, -316(%rbp)
	movl	%ebx, -548(%rbp)
	leaq	-1(%r9), %rdi
	addq	%r8, %rsi
	addq	$16, %rdx
	cmpq	%rdi, %rcx
	jle	.LBB1_266
.LBB1_263:                              # %polly.cond1043
                                        #   in Loop: Header=BB1_121 Depth=5
	movq	-272(%rbp), %rax        # 8-byte Reload
	cmpq	-264(%rbp), %rax        # 8-byte Folded Reload
	movq	-136(%rbp), %r11        # 8-byte Reload
	jl	.LBB1_264
# BB#267:                               # %polly.stmt.polly.loop_preheader189.us1047
                                        #   in Loop: Header=BB1_121 Depth=5
	movq	-1128(%rbp), %rax       # 8-byte Reload
	movq	-88(%rbp), %rdi         # 8-byte Reload
	movl	(%rax,%rdi,4), %eax
	.loc	1 42 74                 # MatrixMult.c:42:74
	movq	-1136(%rbp), %rcx       # 8-byte Reload
	movq	-1152(%rbp), %rsi       # 8-byte Reload
	imull	(%rcx,%rsi), %eax
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	-316(%rbp), %eax
	movq	-1112(%rbp), %rcx       # 8-byte Reload
	movl	(%rcx,%rdi,4), %ecx
	.loc	1 42 74                 # MatrixMult.c:42:74
	movq	-1120(%rbp), %rdx       # 8-byte Reload
	imull	(%rdx,%rsi), %ecx
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%eax, %ecx
	movq	-1096(%rbp), %rax       # 8-byte Reload
	movl	(%rax,%rdi,4), %eax
	.loc	1 42 74                 # MatrixMult.c:42:74
	movq	-1104(%rbp), %rdx       # 8-byte Reload
	imull	(%rdx,%rsi), %eax
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%ecx, %eax
	movq	-1144(%rbp), %rcx       # 8-byte Reload
	movl	(%rcx,%rdi,4), %ecx
	.loc	1 42 74                 # MatrixMult.c:42:74
	movq	-1088(%rbp), %rdx       # 8-byte Reload
	imull	(%rdx,%rsi), %ecx
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%eax, %ecx
	movl	%ecx, -316(%rbp)
	movl	%ecx, -548(%rbp)
	movl	-548(%rbp), %r12d
	jmp	.LBB1_129
	.p2align	4, 0x90
.LBB1_264:                              # %polly.exiting989
                                        #   in Loop: Header=BB1_121 Depth=5
	movl	-548(%rbp), %r12d
.LBB1_129:                              # %polly.cond202.loopexit.us
                                        #   in Loop: Header=BB1_121 Depth=5
	movq	-64(%rbp), %rax         # 8-byte Reload
	movq	-144(%rbp), %rcx        # 8-byte Reload
	movl	%r12d, (%rax,%rcx)
	cmpb	$0, -209(%rbp)          # 1-byte Folded Reload
	jne	.LBB1_145
# BB#130:                               # %polly.preload.cond974
                                        #   in Loop: Header=BB1_121 Depth=5
	xorl	%eax, %eax
	movq	-600(%rbp), %rdx        # 8-byte Reload
	testq	%rdx, %rdx
	movq	-96(%rbp), %r11         # 8-byte Reload
	js	.LBB1_260
# BB#131:                               # %polly.preload.cond974
                                        #   in Loop: Header=BB1_121 Depth=5
	jle	.LBB1_132
.LBB1_260:                              # %polly.preload.exec976
                                        #   in Loop: Header=BB1_121 Depth=5
	movq	-192(%rbp), %rax        # 8-byte Reload
	movq	-232(%rbp), %rcx        # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	addq	-176(%rbp), %rax        # 8-byte Folded Reload
	subq	%r11, %rax
	movq	-128(%rbp), %rcx        # 8-byte Reload
	movl	(%rcx,%rax,4), %eax
.LBB1_132:                              # %polly.preload.cond978
                                        #   in Loop: Header=BB1_121 Depth=5
	movl	%eax, -296(%rbp)        # 4-byte Spill
	movq	%r13, -48(%rbp)         # 8-byte Spill
	movq	%r15, -56(%rbp)         # 8-byte Spill
	movl	%eax, -1292(%rbp)
	xorl	%r10d, %r10d
	testq	%rdx, %rdx
	js	.LBB1_261
# BB#133:                               # %polly.preload.cond978
                                        #   in Loop: Header=BB1_121 Depth=5
	jle	.LBB1_134
.LBB1_261:                              # %polly.preload.exec980
                                        #   in Loop: Header=BB1_121 Depth=5
	movq	-616(%rbp), %rax        # 8-byte Reload
	movq	-104(%rbp), %rcx        # 8-byte Reload
	leaq	(%rcx,%rax), %rax
	movq	-112(%rbp), %rcx        # 8-byte Reload
	movl	(%rcx,%rax,4), %r10d
.LBB1_134:                              # %polly.preload.merge979
                                        #   in Loop: Header=BB1_121 Depth=5
	testq	%rdx, %rdx
	setne	%r13b
	movabsq	$2305843009213693951, %rax # imm = 0x1FFFFFFFFFFFFFFF
	movq	%rdx, %r14
	movq	%rax, %rsi
	movq	-192(%rbp), %rax        # 8-byte Reload
	movq	%rax, %rdi
	cmpq	%rsi, %rdi
	setle	-208(%rbp)              # 1-byte Folded Spill
	movabsq	$-2305843009213693952, %rax # imm = 0xE000000000000000
	movq	%rax, %r15
	cmpq	%r15, %rdi
	setge	%al
	movabsq	$72057594037927935, %rcx # imm = 0xFFFFFFFFFFFFFF
	movq	%rcx, %rbx
	movq	-152(%rbp), %rdx        # 8-byte Reload
	cmpq	%rbx, %rdx
	setle	-184(%rbp)              # 1-byte Folded Spill
	movabsq	$-72057594037927936, %rcx # imm = 0xFF00000000000000
	cmpq	%rcx, %rdx
	setge	-256(%rbp)              # 1-byte Folded Spill
	leaq	(%r11,%rsi), %r9
	movq	-232(%rbp), %rcx        # 8-byte Reload
	leaq	(%rdi,%rcx), %r8
	movq	-176(%rbp), %rdx        # 8-byte Reload
	addq	%rdx, %r8
	cmpq	%r8, %r9
	setge	-248(%rbp)              # 1-byte Folded Spill
	leaq	(%rcx,%rdx), %rcx
	movq	%rcx, -240(%rbp)        # 8-byte Spill
	cmpq	%rcx, %r9
	setge	%dl
	leaq	1(%rsi,%rcx), %rcx
	cmpq	%r11, %rcx
	setge	-224(%rbp)              # 1-byte Folded Spill
	leaq	1(%rsi,%r8), %rcx
	cmpq	%r11, %rcx
	setge	%cl
	cmpq	%rsi, -88(%rbp)         # 8-byte Folded Reload
	setle	%r11b
	cmpq	%rbx, -472(%rbp)        # 8-byte Folded Reload
	setle	%bl
	movq	-616(%rbp), %rdi        # 8-byte Reload
	movq	-104(%rbp), %r9         # 8-byte Reload
	addq	%rdi, %r9
	movq	%r9, -104(%rbp)         # 8-byte Spill
	cmpq	%rsi, %r9
	movq	%r14, %rsi
	setle	%r14b
	cmpq	%r15, %rdi
	setge	%r15b
	testq	%rsi, %rsi
	movl	%r10d, -1296(%rbp)
	je	.LBB1_257
# BB#135:                               # %polly.preload.merge979
                                        #   in Loop: Header=BB1_121 Depth=5
	andb	-208(%rbp), %r13b       # 1-byte Folded Reload
	andb	-184(%rbp), %al         # 1-byte Folded Reload
	andb	%r13b, %al
	andb	-256(%rbp), %al         # 1-byte Folded Reload
	andb	-248(%rbp), %al         # 1-byte Folded Reload
	andb	-224(%rbp), %dl         # 1-byte Folded Reload
	andb	%al, %dl
	andb	%r11b, %cl
	andb	%dl, %cl
	andb	%r14b, %bl
	andb	%r15b, %bl
	andb	%cl, %bl
	jne	.LBB1_257
# BB#136:                               # %polly.loop_header208.us.preheader
                                        #   in Loop: Header=BB1_121 Depth=5
	testq	%rsi, %rsi
	movq	-56(%rbp), %r15         # 8-byte Reload
	movq	-48(%rbp), %r13         # 8-byte Reload
	jne	.LBB1_148
# BB#137:                               #   in Loop: Header=BB1_121 Depth=5
                                        # implicit-def: %EDX
	xorl	%eax, %eax
	jmp	.LBB1_149
	.p2align	4, 0x90
.LBB1_257:                              # %polly.cond982
                                        #   in Loop: Header=BB1_121 Depth=5
	movl	%r12d, -544(%rbp)
	movq	$0, -952(%rbp)
	testq	%rsi, %rsi
	movq	-56(%rbp), %r15         # 8-byte Reload
	movq	-48(%rbp), %r13         # 8-byte Reload
	js	.LBB1_262
# BB#258:                               # %polly.cond982
                                        #   in Loop: Header=BB1_121 Depth=5
	jle	.LBB1_259
.LBB1_262:                              # %polly.stmt.polly.loop_header208.us.prol
                                        #   in Loop: Header=BB1_121 Depth=5
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	-296(%rbp), %r10d       # 4-byte Folded Reload
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%r12d, %r10d
	movl	%r10d, -748(%rbp)
	movl	%r10d, -544(%rbp)
	movq	$1, -952(%rbp)
.LBB1_259:                              # %polly.exiting972
                                        #   in Loop: Header=BB1_121 Depth=5
	movl	-748(%rbp), %edx
	movl	-544(%rbp), %r12d
	movq	-952(%rbp), %rax
	jmp	.LBB1_149
.LBB1_148:                              # %polly.loop_header208.us.prol
                                        #   in Loop: Header=BB1_121 Depth=5
	movq	-112(%rbp), %rax        # 8-byte Reload
	movq	-104(%rbp), %rcx        # 8-byte Reload
	movl	(%rax,%rcx,4), %edx
	.loc	1 42 74                 # MatrixMult.c:42:74
	movq	-128(%rbp), %rax        # 8-byte Reload
	movq	-464(%rbp), %rcx        # 8-byte Reload
	imull	(%rax,%rcx,4), %edx
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%r12d, %edx
	movl	%edx, %r12d
	movl	$1, %eax
.LBB1_149:                              # %polly.loop_header208.us.preheader.split
                                        #   in Loop: Header=BB1_121 Depth=5
	movq	-96(%rbp), %rsi         # 8-byte Reload
	movq	-136(%rbp), %r11        # 8-byte Reload
	cmpq	$0, -896(%rbp)          # 8-byte Folded Reload
	je	.LBB1_144
# BB#140:                               # %polly.split_new_and_old929
                                        #   in Loop: Header=BB1_121 Depth=5
	movq	%r13, -48(%rbp)         # 8-byte Spill
	movq	%r15, -56(%rbp)         # 8-byte Spill
	movq	-168(%rbp), %r11        # 8-byte Reload
	movq	-640(%rbp), %r10        # 8-byte Reload
	cmpq	%r10, %r11
	setge	-104(%rbp)              # 1-byte Folded Spill
	movq	%rax, %rdx
	subq	%rsi, %rdx
	leal	1(%rdx), %ecx
	testb	$1, %cl
	sete	%r15b
	movabsq	$288230376151711743, %rcx # imm = 0x3FFFFFFFFFFFFFF
	movq	-152(%rbp), %rbx        # 8-byte Reload
	cmpq	%rcx, %rbx
	setle	%cl
	movabsq	$-288230376151711744, %rdi # imm = 0xFC00000000000000
	cmpq	%rdi, %rbx
	setge	-208(%rbp)              # 1-byte Folded Spill
	cmpq	-632(%rbp), %r8         # 8-byte Folded Reload
	setle	%r13b
	movq	-192(%rbp), %rdi        # 8-byte Reload
	leaq	(%rax,%rdi), %rbx
	addq	-232(%rbp), %rbx        # 8-byte Folded Reload
	addq	-176(%rbp), %rbx        # 8-byte Folded Reload
	movabsq	$2305843009213693951, %rdi # imm = 0x1FFFFFFFFFFFFFFF
	leaq	1(%rdi,%rbx), %rbx
	cmpq	%rsi, %rbx
	setge	%r8b
	movabsq	$9223372036854775806, %rdi # imm = 0x7FFFFFFFFFFFFFFE
	leaq	(%rsi,%rdi), %rbx
	movq	-240(%rbp), %r14        # 8-byte Reload
	cmpq	%r14, %rbx
	setge	%r9b
	leaq	2(%rdi,%r14), %rbx
	cmpq	%rsi, %rbx
	setge	%bl
	cmpq	%r10, %r11
	setge	%r11b
	testb	$1, %dl
	sete	%dl
	testb	-104(%rbp), %r15b       # 1-byte Folded Reload
	jne	.LBB1_250
# BB#141:                               # %polly.split_new_and_old929
                                        #   in Loop: Header=BB1_121 Depth=5
	andb	-208(%rbp), %cl         # 1-byte Folded Reload
	andb	%r13b, %cl
	andb	%r9b, %cl
	andb	%cl, %r8b
	andb	%r11b, %bl
	andb	%dl, %bl
	andb	%r8b, %bl
	jne	.LBB1_250
# BB#142:                               # %polly.loop_header208.us.preheader3
                                        #   in Loop: Header=BB1_121 Depth=5
	movq	-888(%rbp), %rcx        # 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	movq	-72(%rbp), %rsi         # 8-byte Reload
	imulq	%rsi, %rcx
	movq	-688(%rbp), %rdi        # 8-byte Reload
	leaq	(%rdi,%rcx,4), %r8
	movq	-392(%rbp), %rcx        # 8-byte Reload
	leaq	(%rcx,%rax), %rdx
	imulq	%rsi, %rdx
	leaq	(%rdi,%rdx,4), %r9
	xorl	%edi, %edi
	movl	%r12d, %edx
	movq	-96(%rbp), %rcx         # 8-byte Reload
	movq	-136(%rbp), %r11        # 8-byte Reload
	movq	-592(%rbp), %rsi        # 8-byte Reload
	movq	-56(%rbp), %r15         # 8-byte Reload
	movq	-48(%rbp), %r13         # 8-byte Reload
	.p2align	4, 0x90
.LBB1_143:                              # %polly.loop_header208.us
                                        #   Parent Loop BB1_112 Depth=1
                                        #     Parent Loop BB1_114 Depth=2
                                        #       Parent Loop BB1_116 Depth=3
                                        #         Parent Loop BB1_118 Depth=4
                                        #           Parent Loop BB1_121 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movl	(%r9,%rdi,4), %ebx
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	(%rsi,%rax,4), %ebx
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%edx, %ebx
	movl	(%r8,%rdi,4), %edx
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	4(%rsi,%rax,4), %edx
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%ebx, %edx
	addq	$2, %rax
	addq	%r11, %rdi
	cmpq	%rax, %rcx
	jne	.LBB1_143
	jmp	.LBB1_144
.LBB1_250:                              # %polly.cond935
                                        #   in Loop: Header=BB1_121 Depth=5
	movl	%r12d, -540(%rbp)
	movl	%eax, %ecx
	movq	-96(%rbp), %rdx         # 8-byte Reload
	subl	%edx, %ecx
	testb	$1, %cl
	movq	-136(%rbp), %r11        # 8-byte Reload
	movq	-592(%rbp), %rdi        # 8-byte Reload
	jne	.LBB1_251
# BB#252:                               # %polly.loop_if941
                                        #   in Loop: Header=BB1_121 Depth=5
	movq	%r11, %r12
	movq	%rdx, %rsi
	movq	%rsi, %r11
	movq	%rsi, %r10
	subq	%rax, %r11
	sarq	%r11
	testq	%r11, %r11
	movq	-344(%rbp), %r15        # 8-byte Reload
	jle	.LBB1_253
# BB#255:                               # %polly.loop_preheader943
                                        #   in Loop: Header=BB1_121 Depth=5
	movq	-392(%rbp), %rcx        # 8-byte Reload
	leaq	(%rcx,%rax), %r8
	movq	-176(%rbp), %rcx        # 8-byte Reload
	leaq	(%rcx,%rax), %rcx
	movq	-856(%rbp), %rsi        # 8-byte Reload
	subq	%rax, %rsi
	movq	-864(%rbp), %rdx        # 8-byte Reload
	leaq	(%rdx,%rcx,4), %r9
	imulq	-72(%rbp), %r9          # 8-byte Folded Reload
	leaq	(%rdi,%rax,4), %r14
	imulq	-280(%rbp), %r8         # 8-byte Folded Reload
	movq	-688(%rbp), %rdx        # 8-byte Reload
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB1_256:                              # %polly.stmt.polly.loop_header208.us
                                        #   Parent Loop BB1_112 Depth=1
                                        #     Parent Loop BB1_114 Depth=2
                                        #       Parent Loop BB1_116 Depth=3
                                        #         Parent Loop BB1_118 Depth=4
                                        #           Parent Loop BB1_121 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movl	(%r8,%rdx), %ecx
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	(%r14,%rdi,8), %ecx
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	-540(%rbp), %ecx
	movl	(%r9,%rdx), %ebx
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	4(%r14,%rdi,8), %ebx
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%ecx, %ebx
	movl	%ebx, -540(%rbp)
	movl	%ebx, -740(%rbp)
	leaq	-1(%r11), %rcx
	addq	$-2, %rsi
	addq	%r15, %rdx
	cmpq	%rcx, %rdi
	leaq	1(%rdi), %rdi
	jl	.LBB1_256
.LBB1_253:                              # %polly.cond965
                                        #   in Loop: Header=BB1_121 Depth=5
	addq	$2, %rax
	cmpq	%rax, %r10
	movq	%r12, %r11
	jl	.LBB1_251
# BB#254:                               # %polly.stmt.polly.merge203.loopexit.us.unr-lcssa
                                        #   in Loop: Header=BB1_121 Depth=5
	movl	-740(%rbp), %eax
	movl	%eax, -744(%rbp)
.LBB1_251:                              # %polly.exiting932
                                        #   in Loop: Header=BB1_121 Depth=5
	movl	-744(%rbp), %edx
	movq	-56(%rbp), %r15         # 8-byte Reload
	movq	-48(%rbp), %r13         # 8-byte Reload
.LBB1_144:                              # %polly.merge203.loopexit.us
                                        #   in Loop: Header=BB1_121 Depth=5
	movq	-64(%rbp), %rax         # 8-byte Reload
	movq	-144(%rbp), %rcx        # 8-byte Reload
	movl	%edx, (%rax,%rcx)
.LBB1_145:                              # %polly.merge203.us
                                        #   in Loop: Header=BB1_121 Depth=5
	movq	%r11, -136(%rbp)        # 8-byte Spill
	movq	%rax, -64(%rbp)         # 8-byte Spill
	movq	-160(%rbp), %rcx        # 8-byte Reload
	addq	$4, %rcx
	movq	-200(%rbp), %rax        # 8-byte Reload
	addq	$4, %rax
	addq	$4, %r13
	addq	$4, %r15
	addq	$4, -688(%rbp)          # 8-byte Folded Spill
	movq	-88(%rbp), %rsi         # 8-byte Reload
	cmpq	-624(%rbp), %rsi        # 8-byte Folded Reload
	leaq	1(%rsi), %rsi
	jle	.LBB1_121
	jmp	.LBB1_146
	.p2align	4, 0x90
.LBB1_150:                              # %polly.loop_header170.preheader.split
                                        #   in Loop: Header=BB1_118 Depth=4
	movq	%rcx, -464(%rbp)        # 8-byte Spill
	movq	-1048(%rbp), %rax       # 8-byte Reload
	cmpq	-176(%rbp), %rax        # 8-byte Folded Reload
	jl	.LBB1_146
# BB#151:                               # %polly.then204.preheader
                                        #   in Loop: Header=BB1_118 Depth=4
	movq	-464(%rbp), %rax        # 8-byte Reload
	addq	-392(%rbp), %rax        # 8-byte Folded Reload
	movq	%rax, -464(%rbp)        # 8-byte Spill
	movq	-872(%rbp), %rax        # 8-byte Reload
	movq	-672(%rbp), %rcx        # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	imulq	-72(%rbp), %rax         # 8-byte Folded Reload
	addq	-1040(%rbp), %rax       # 8-byte Folded Reload
	movq	%rax, -224(%rbp)        # 8-byte Spill
	movq	-584(%rbp), %rdx        # 8-byte Reload
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB1_154:                              # %polly.then204
                                        #   Parent Loop BB1_112 Depth=1
                                        #     Parent Loop BB1_114 Depth=2
                                        #       Parent Loop BB1_116 Depth=3
                                        #         Parent Loop BB1_118 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB1_168 Depth 6
                                        #             Child Loop BB1_243 Depth 6
	cmpq	$0, -96(%rbp)           # 8-byte Folded Reload
	je	.LBB1_153
# BB#155:                               # %polly.preload.cond910
                                        #   in Loop: Header=BB1_154 Depth=5
	movq	-192(%rbp), %rax        # 8-byte Reload
	leaq	(%r15,%rax), %r11
	addq	-80(%rbp), %r11         # 8-byte Folded Reload
	movq	-152(%rbp), %r13        # 8-byte Reload
	shlq	$5, %r13
	addq	%r13, %r11
	movq	-64(%rbp), %rax         # 8-byte Reload
	movl	(%rax,%r11,4), %eax
	movl	%eax, -184(%rbp)        # 4-byte Spill
	movl	%eax, -1280(%rbp)
	xorl	%eax, %eax
	movq	-600(%rbp), %rsi        # 8-byte Reload
	testq	%rsi, %rsi
	js	.LBB1_247
# BB#156:                               # %polly.preload.cond910
                                        #   in Loop: Header=BB1_154 Depth=5
	jle	.LBB1_157
.LBB1_247:                              # %polly.preload.exec912
                                        #   in Loop: Header=BB1_154 Depth=5
	movq	-192(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%r13), %rax
	addq	-176(%rbp), %rax        # 8-byte Folded Reload
	subq	-96(%rbp), %rax         # 8-byte Folded Reload
	movq	-128(%rbp), %rcx        # 8-byte Reload
	movl	(%rcx,%rax,4), %eax
.LBB1_157:                              # %polly.preload.cond914
                                        #   in Loop: Header=BB1_154 Depth=5
	movl	%eax, -248(%rbp)        # 4-byte Spill
	movq	%rdx, -88(%rbp)         # 8-byte Spill
	movl	%eax, -1284(%rbp)
	xorl	%eax, %eax
	testq	%rsi, %rsi
	js	.LBB1_248
# BB#158:                               # %polly.preload.cond914
                                        #   in Loop: Header=BB1_154 Depth=5
	jle	.LBB1_159
.LBB1_248:                              # %polly.preload.exec916
                                        #   in Loop: Header=BB1_154 Depth=5
	movq	-80(%rbp), %rax         # 8-byte Reload
	leaq	(%r15,%rax), %rax
	addq	-616(%rbp), %rax        # 8-byte Folded Reload
	movq	-112(%rbp), %rcx        # 8-byte Reload
	movl	(%rcx,%rax,4), %eax
.LBB1_159:                              # %polly.preload.merge915
                                        #   in Loop: Header=BB1_154 Depth=5
	movl	%eax, -56(%rbp)         # 4-byte Spill
	movabsq	$2305843009213693951, %rdi # imm = 0x1FFFFFFFFFFFFFFF
	cmpq	%rdi, %r15
	setle	%cl
	movb	%cl, -200(%rbp)         # 1-byte Spill
	testq	%rsi, %rsi
	sete	%al
	setne	%r8b
	andb	%cl, %al
	movq	-192(%rbp), %rcx        # 8-byte Reload
	movq	%rcx, %rbx
	cmpq	%rdi, %rbx
	setle	%cl
	movabsq	$-2305843009213693952, %r10 # imm = 0xE000000000000000
	cmpq	%r10, %rbx
	setge	%dl
	andb	%cl, %dl
	movb	%dl, -160(%rbp)         # 1-byte Spill
	andb	%dl, %al
	movabsq	$72057594037927935, %rcx # imm = 0xFFFFFFFFFFFFFF
	movq	-472(%rbp), %rdx        # 8-byte Reload
	movq	%rdx, %rsi
	cmpq	%rcx, %rsi
	setle	%r9b
	movq	-152(%rbp), %rdx        # 8-byte Reload
	leaq	(%rsi,%rdx), %rsi
	cmpq	%rcx, %rsi
	setle	%r14b
	andb	%r9b, %r14b
	andb	%r14b, %al
	movabsq	$-72057594037927936, %rcx # imm = 0xFF00000000000000
	cmpq	%rcx, %rdx
	setge	%cl
	movb	%cl, -144(%rbp)         # 1-byte Spill
	andb	%cl, %al
	cmpq	%rdi, %r11
	setle	%r9b
	andb	%r9b, %al
	movq	%r15, %r11
	movq	-80(%rbp), %r15         # 8-byte Reload
	leaq	(%rbx,%r15), %rcx
	addq	%r13, %rcx
	cmpq	%r10, %rcx
	setge	-48(%rbp)               # 1-byte Folded Spill
	movq	-96(%rbp), %rcx         # 8-byte Reload
	movq	%rcx, %rsi
	leaq	(%rsi,%rdi), %rcx
	leaq	(%rbx,%r13), %rbx
	movq	-176(%rbp), %rdx        # 8-byte Reload
	addq	%rdx, %rbx
	movq	%rbx, -256(%rbp)        # 8-byte Spill
	cmpq	%rbx, %rcx
	setge	%r12b
	leaq	(%r13,%rdx), %rdx
	movq	%r13, -208(%rbp)        # 8-byte Spill
	cmpq	%rdx, %rcx
	setge	-104(%rbp)              # 1-byte Folded Spill
	leaq	1(%rdi,%rdx), %rcx
	cmpq	%rsi, %rcx
	setge	-232(%rbp)              # 1-byte Folded Spill
	leaq	1(%rdi,%rbx), %rcx
	cmpq	%rsi, %rcx
	setge	%r13b
	leaq	(%r11,%r15), %rsi
	movq	%r11, %r15
	movq	-616(%rbp), %rcx        # 8-byte Reload
	leaq	(%rsi,%rcx), %r11
	cmpq	%rdi, %r11
	setle	%dil
	cmpq	%r10, %rcx
	movl	-56(%rbp), %ebx         # 4-byte Reload
	setge	%r10b
	movb	-48(%rbp), %cl          # 1-byte Reload
	testb	%cl, %al
	movb	%cl, %al
	movl	%ebx, -1288(%rbp)
	jne	.LBB1_244
# BB#160:                               # %polly.preload.merge915
                                        #   in Loop: Header=BB1_154 Depth=5
	andb	-200(%rbp), %r8b        # 1-byte Folded Reload
	andb	-160(%rbp), %r8b        # 1-byte Folded Reload
	andb	%r14b, %r8b
	andb	-144(%rbp), %r8b        # 1-byte Folded Reload
	andb	%al, %r9b
	andb	%r8b, %r9b
	andb	-104(%rbp), %r12b       # 1-byte Folded Reload
	andb	-232(%rbp), %r12b       # 1-byte Folded Reload
	andb	%r9b, %r12b
	andb	%dil, %r13b
	andb	%r10b, %r13b
	andb	%r12b, %r13b
	jne	.LBB1_244
# BB#161:                               # %polly.loop_header208.preheader
                                        #   in Loop: Header=BB1_154 Depth=5
	movq	%r11, %rbx
	movq	-912(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%rsi,4), %rax
	movq	-64(%rbp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax), %r11
	movq	-600(%rbp), %rdi        # 8-byte Reload
	testq	%rdi, %rdi
	movl	(%rcx,%rax), %edi
	jne	.LBB1_163
# BB#162:                               #   in Loop: Header=BB1_154 Depth=5
	movq	%rdx, -48(%rbp)         # 8-byte Spill
	movq	%rsi, -56(%rbp)         # 8-byte Spill
                                        # implicit-def: %ESI
	xorl	%r9d, %r9d
	jmp	.LBB1_164
	.p2align	4, 0x90
.LBB1_244:                              # %polly.cond923
                                        #   in Loop: Header=BB1_154 Depth=5
	movq	%rdx, -48(%rbp)         # 8-byte Spill
	movq	-80(%rbp), %rax         # 8-byte Reload
	leaq	(%r15,%rax), %rax
	movq	%rax, -1216(%rbp)
	movq	-224(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%r15,4), %rax
	movq	%rax, -1224(%rbp)
	movl	-184(%rbp), %eax        # 4-byte Reload
	movl	%eax, -536(%rbp)
	movq	$0, -944(%rbp)
	cmpq	$0, -600(%rbp)          # 8-byte Folded Reload
	js	.LBB1_249
# BB#245:                               # %polly.cond923
                                        #   in Loop: Header=BB1_154 Depth=5
	jle	.LBB1_246
.LBB1_249:                              # %polly.stmt.polly.loop_header208.prol
                                        #   in Loop: Header=BB1_154 Depth=5
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	-248(%rbp), %ebx        # 4-byte Folded Reload
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%eax, %ebx
	movl	%ebx, -736(%rbp)
	movl	%ebx, -536(%rbp)
	movq	$1, -944(%rbp)
.LBB1_246:                              # %polly.exiting906
                                        #   in Loop: Header=BB1_154 Depth=5
	movl	-736(%rbp), %esi
	movl	-536(%rbp), %edi
	movq	-944(%rbp), %r9
	movq	-1216(%rbp), %rax
	movq	%rax, -56(%rbp)         # 8-byte Spill
	movq	-1224(%rbp), %r11
	jmp	.LBB1_164
.LBB1_163:                              # %polly.loop_header208.prol
                                        #   in Loop: Header=BB1_154 Depth=5
	movq	%rdx, -48(%rbp)         # 8-byte Spill
	movq	%rsi, -56(%rbp)         # 8-byte Spill
	movq	-112(%rbp), %rax        # 8-byte Reload
	movl	(%rax,%rbx,4), %esi
	.loc	1 42 74                 # MatrixMult.c:42:74
	movq	-128(%rbp), %rax        # 8-byte Reload
	movq	-464(%rbp), %rcx        # 8-byte Reload
	imull	(%rax,%rcx,4), %esi
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%edi, %esi
	movl	%esi, %edi
	movl	$1, %r9d
.LBB1_164:                              # %polly.loop_header208.preheader.split
                                        #   in Loop: Header=BB1_154 Depth=5
	movq	-344(%rbp), %rax        # 8-byte Reload
	cmpq	$0, -896(%rbp)          # 8-byte Folded Reload
	je	.LBB1_152
# BB#165:                               # %polly.split_new_and_old863
                                        #   in Loop: Header=BB1_154 Depth=5
	movl	%edi, -144(%rbp)        # 4-byte Spill
	movq	%r11, -160(%rbp)        # 8-byte Spill
	movq	-80(%rbp), %rax         # 8-byte Reload
	leaq	1(%r15,%rax), %r12
	movq	%r15, -200(%rbp)        # 8-byte Spill
	movq	-168(%rbp), %r11        # 8-byte Reload
	cmpq	%r12, %r11
	setge	-104(%rbp)              # 1-byte Folded Spill
	movq	%r9, %rsi
	movq	-96(%rbp), %rcx         # 8-byte Reload
	movq	%rcx, %rax
	subq	%rax, %rsi
	leal	1(%rsi), %ecx
	testb	$1, %cl
	sete	%r14b
	movabsq	$288230376151711743, %rcx # imm = 0x3FFFFFFFFFFFFFF
	movq	-152(%rbp), %rdx        # 8-byte Reload
	cmpq	%rcx, %rdx
	setle	%bl
	movabsq	$-288230376151711744, %rcx # imm = 0xFC00000000000000
	cmpq	%rcx, %rdx
	setge	%r10b
	movabsq	$2305843009213693951, %rcx # imm = 0x1FFFFFFFFFFFFFFF
	movq	%rcx, %rdi
	leaq	1(%rdi), %rcx
	cmpq	%rcx, -256(%rbp)        # 8-byte Folded Reload
	setle	%r8b
	movq	-192(%rbp), %rcx        # 8-byte Reload
	leaq	(%r9,%rcx), %rcx
	addq	-208(%rbp), %rcx        # 8-byte Folded Reload
	addq	-176(%rbp), %rcx        # 8-byte Folded Reload
	leaq	1(%rdi,%rcx), %rcx
	cmpq	%rax, %rcx
	setge	%cl
	movabsq	$9223372036854775806, %rdx # imm = 0x7FFFFFFFFFFFFFFE
	movq	%rdx, %rdi
	leaq	(%rax,%rdi), %rdx
	movq	-48(%rbp), %r13         # 8-byte Reload
	cmpq	%r13, %rdx
	setge	%r15b
	leaq	2(%rdi,%r13), %rdx
	cmpq	%rax, %rdx
	setge	%dl
	cmpq	%r12, %r11
	setge	%r12b
	testb	$1, %sil
	sete	%sil
	testb	-104(%rbp), %r14b       # 1-byte Folded Reload
	jne	.LBB1_237
# BB#166:                               # %polly.split_new_and_old863
                                        #   in Loop: Header=BB1_154 Depth=5
	andb	%r10b, %bl
	andb	%r8b, %bl
	andb	%r15b, %bl
	andb	%bl, %cl
	andb	%r12b, %dl
	andb	%sil, %dl
	andb	%cl, %dl
	jne	.LBB1_237
# BB#167:                               # %polly.loop_header208.preheader4
                                        #   in Loop: Header=BB1_154 Depth=5
	movq	-96(%rbp), %rcx         # 8-byte Reload
	subq	%r9, %rcx
	movq	-888(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%r9), %rdx
	movq	-72(%rbp), %r10         # 8-byte Reload
	imulq	%r10, %rdx
	movq	-56(%rbp), %r11         # 8-byte Reload
	addq	%r11, %rdx
	movq	-112(%rbp), %rdi        # 8-byte Reload
	leaq	(%rdi,%rdx,4), %r8
	movq	-880(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%r9), %rsi
	movq	-128(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%rsi,4), %rbx
	addq	-392(%rbp), %r9         # 8-byte Folded Reload
	imulq	%r10, %r9
	addq	%r11, %r9
	leaq	(%rdi,%r9,4), %r9
	xorl	%edi, %edi
	movl	-144(%rbp), %esi        # 4-byte Reload
	movq	-344(%rbp), %rax        # 8-byte Reload
	movq	-200(%rbp), %r15        # 8-byte Reload
	movq	-160(%rbp), %r11        # 8-byte Reload
	.p2align	4, 0x90
.LBB1_168:                              # %polly.loop_header208
                                        #   Parent Loop BB1_112 Depth=1
                                        #     Parent Loop BB1_114 Depth=2
                                        #       Parent Loop BB1_116 Depth=3
                                        #         Parent Loop BB1_118 Depth=4
                                        #           Parent Loop BB1_154 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movl	(%r9,%rdi), %edx
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	(%rbx), %edx
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%esi, %edx
	movl	(%r8,%rdi), %esi
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	4(%rbx), %esi
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%edx, %esi
	addq	%rax, %rdi
	addq	$8, %rbx
	addq	$-2, %rcx
	jne	.LBB1_168
	jmp	.LBB1_152
.LBB1_237:                              # %polly.cond869
                                        #   in Loop: Header=BB1_154 Depth=5
	movl	-144(%rbp), %eax        # 4-byte Reload
	movl	%eax, -532(%rbp)
	movl	%r9d, %ecx
	movq	-96(%rbp), %rax         # 8-byte Reload
	subl	%eax, %ecx
	testb	$1, %cl
	movq	-160(%rbp), %r11        # 8-byte Reload
	jne	.LBB1_238
# BB#239:                               # %polly.loop_if875
                                        #   in Loop: Header=BB1_154 Depth=5
	movq	-96(%rbp), %r15         # 8-byte Reload
	subq	%r9, %r15
	sarq	%r15
	testq	%r15, %r15
	movq	-72(%rbp), %r10         # 8-byte Reload
	jle	.LBB1_240
# BB#242:                               # %polly.loop_preheader877
                                        #   in Loop: Header=BB1_154 Depth=5
	movq	-392(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%r9), %rax
	movq	-176(%rbp), %rcx        # 8-byte Reload
	leaq	(%rcx,%r9), %rcx
	movq	-856(%rbp), %rdx        # 8-byte Reload
	subq	%r9, %rdx
	movq	-864(%rbp), %rsi        # 8-byte Reload
	leaq	(%rsi,%rcx,4), %r8
	imulq	%r10, %r8
	movq	-88(%rbp), %rsi         # 8-byte Reload
	addq	%rsi, %r8
	movq	-592(%rbp), %rcx        # 8-byte Reload
	leaq	(%rcx,%r9,4), %rbx
	imulq	%r10, %rax
	leaq	(%rsi,%rax,4), %r14
	xorl	%esi, %esi
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB1_243:                              # %polly.stmt.polly.loop_header208
                                        #   Parent Loop BB1_112 Depth=1
                                        #     Parent Loop BB1_114 Depth=2
                                        #       Parent Loop BB1_116 Depth=3
                                        #         Parent Loop BB1_118 Depth=4
                                        #           Parent Loop BB1_154 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movl	(%r14,%rsi,8), %eax
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	(%rbx,%rdi,8), %eax
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	-532(%rbp), %eax
	movl	(%r8,%rsi,8), %ecx
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	4(%rbx,%rdi,8), %ecx
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%eax, %ecx
	movl	%ecx, -532(%rbp)
	movl	%ecx, -728(%rbp)
	leaq	-1(%r15), %rax
	addq	$-2, %rdx
	addq	%r10, %rsi
	cmpq	%rax, %rdi
	leaq	1(%rdi), %rdi
	jl	.LBB1_243
.LBB1_240:                              # %polly.cond899
                                        #   in Loop: Header=BB1_154 Depth=5
	addq	$2, %r9
	cmpq	%r9, -96(%rbp)          # 8-byte Folded Reload
	jl	.LBB1_238
# BB#241:                               # %polly.stmt.polly.merge203.loopexit.unr-lcssa
                                        #   in Loop: Header=BB1_154 Depth=5
	movl	-728(%rbp), %eax
	movl	%eax, -732(%rbp)
.LBB1_238:                              # %polly.exiting866
                                        #   in Loop: Header=BB1_154 Depth=5
	movl	-732(%rbp), %esi
	movq	-344(%rbp), %rax        # 8-byte Reload
	movq	-200(%rbp), %r15        # 8-byte Reload
.LBB1_152:                              # %polly.merge203.loopexit
                                        #   in Loop: Header=BB1_154 Depth=5
	movq	%rax, -344(%rbp)        # 8-byte Spill
	movl	%esi, (%r11)
	movq	-88(%rbp), %rdx         # 8-byte Reload
.LBB1_153:                              # %polly.merge203
                                        #   in Loop: Header=BB1_154 Depth=5
	addq	$4, %rdx
	cmpq	-624(%rbp), %r15        # 8-byte Folded Reload
	leaq	1(%r15), %r15
	jle	.LBB1_154
	.p2align	4, 0x90
.LBB1_146:                              # %polly.loop_exit172
                                        #   in Loop: Header=BB1_118 Depth=4
	movq	-72(%rbp), %rsi         # 8-byte Reload
	addq	%rsi, -880(%rbp)        # 8-byte Folded Spill
	movq	-280(%rbp), %rax        # 8-byte Reload
	movq	-592(%rbp), %rcx        # 8-byte Reload
	addq	%rax, %rcx
	addq	%rax, -680(%rbp)        # 8-byte Folded Spill
	movq	-672(%rbp), %rax        # 8-byte Reload
	cmpq	-1072(%rbp), %rax       # 8-byte Folded Reload
	leaq	1(%rax), %rax
	jle	.LBB1_118
.LBB1_147:                              # %polly.loop_exit163
                                        #   in Loop: Header=BB1_116 Depth=3
	movq	-456(%rbp), %rax        # 8-byte Reload
	addq	%rax, -824(%rbp)        # 8-byte Folded Spill
	subq	$-128, -816(%rbp)       # 8-byte Folded Spill
	addq	%rax, -832(%rbp)        # 8-byte Folded Spill
	addq	%rax, -840(%rbp)        # 8-byte Folded Spill
	addq	%rax, -848(%rbp)        # 8-byte Folded Spill
	movq	-608(%rbp), %rax        # 8-byte Reload
	cmpq	-808(%rbp), %rax        # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, -608(%rbp)        # 8-byte Spill
	jne	.LBB1_116
.LBB1_138:                              # %polly.loop_exit154
                                        #   in Loop: Header=BB1_114 Depth=2
	subq	$-128, -584(%rbp)       # 8-byte Folded Spill
	subq	$-128, -776(%rbp)       # 8-byte Folded Spill
	subq	$-128, -784(%rbp)       # 8-byte Folded Spill
	subq	$-128, -792(%rbp)       # 8-byte Folded Spill
	movq	-336(%rbp), %r15        # 8-byte Reload
	movq	-472(%rbp), %rax        # 8-byte Reload
	cmpq	%r15, %rax
	leaq	1(%rax), %rax
	movq	%rax, -472(%rbp)        # 8-byte Spill
	jne	.LBB1_114
.LBB1_139:                              # %polly.loop_exit144
                                        #   in Loop: Header=BB1_112 Depth=1
	movq	-664(%rbp), %rax        # 8-byte Reload
	addq	-760(%rbp), %rax        # 8-byte Folded Reload
	movq	%rax, -664(%rbp)        # 8-byte Spill
	movq	-456(%rbp), %rax        # 8-byte Reload
	addq	%rax, -800(%rbp)        # 8-byte Folded Spill
	addq	%rax, -768(%rbp)        # 8-byte Folded Spill
	movq	-656(%rbp), %rax        # 8-byte Reload
	cmpq	-568(%rbp), %rax        # 8-byte Folded Reload
	leaq	1(%rax), %rax
	movq	%rax, -656(%rbp)        # 8-byte Spill
	jne	.LBB1_112
.LBB1_39:                               # %polly.cond231
	movl	-700(%rbp), %eax        # 4-byte Reload
	testb	%al, %al
	movq	-64(%rbp), %r9          # 8-byte Reload
	je	.LBB1_22
# BB#40:                                # %polly.then233
	testq	%r15, %r15
	js	.LBB1_22
# BB#41:                                # %polly.loop_header237.preheader
	sarq	$5, -576(%rbp)          # 8-byte Folded Spill
	movq	-176(%rbp), %rcx        # 8-byte Reload
	movq	%rcx, %rax
	shrq	$2, %rax
	movq	%rax, -144(%rbp)        # 8-byte Spill
	decq	%rax
	movq	%rax, -408(%rbp)        # 8-byte Spill
	movl	-116(%rbp), %r8d        # 4-byte Reload
	movl	%r8d, %edx
	andl	$3, %edx
	movq	%rdx, -80(%rbp)         # 8-byte Spill
	movq	%rcx, %rbx
	subq	%rdx, %rbx
	movq	%rbx, -184(%rbp)        # 8-byte Spill
	leaq	-1(%rdx), %rax
	movq	%rax, -248(%rbp)        # 8-byte Spill
	andl	$1, %r8d
	movq	%r8, -192(%rbp)         # 8-byte Spill
	movq	%rbx, %rax
	imulq	%rsi, %rax
	movq	%rax, -264(%rbp)        # 8-byte Spill
	leaq	(,%rdx,4), %rax
	incq	%rcx
	subq	%rdx, %rcx
	movq	%rcx, -376(%rbp)        # 8-byte Spill
	leaq	(,%rsi,8), %rcx
	movq	%rcx, -296(%rbp)        # 8-byte Spill
	movq	-128(%rbp), %rcx        # 8-byte Reload
	leaq	(%rcx,%rbx,4), %rbx
	movq	%rbx, -224(%rbp)        # 8-byte Spill
	leaq	-2(%rdx), %rdx
	movq	%rdx, -400(%rbp)        # 8-byte Spill
	movl	$4, %edx
	subq	%rax, %rdx
	movq	%rdx, -288(%rbp)        # 8-byte Spill
	leaq	(%rsi,%rsi,2), %rax
	movq	-112(%rbp), %rdx        # 8-byte Reload
	leaq	(%rdx,%rax,4), %rax
	movq	%rax, -648(%rbp)        # 8-byte Spill
	movq	%rsi, %r13
	shlq	$4, %r13
	leaq	12(%rcx), %rax
	movq	%rax, -624(%rbp)        # 8-byte Spill
	leaq	(%rsi,%rsi), %rax
	movq	%rax, -480(%rbp)        # 8-byte Spill
	leaq	(%rdx,%rsi,8), %rax
	movq	%rax, -640(%rbp)        # 8-byte Spill
	leaq	(%rdx,%rsi,4), %rax
	movq	%rax, -632(%rbp)        # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -240(%rbp)        # 8-byte Spill
	movq	%rdx, -304(%rbp)        # 8-byte Spill
	.p2align	4, 0x90
.LBB1_42:                               # %polly.loop_header237
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_44 Depth 2
                                        #       Child Loop BB1_182 Depth 3
                                        #         Child Loop BB1_196 Depth 4
                                        #         Child Loop BB1_212 Depth 4
                                        #       Child Loop BB1_47 Depth 3
                                        #         Child Loop BB1_50 Depth 4
                                        #         Child Loop BB1_235 Depth 4
                                        #         Child Loop BB1_172 Depth 4
                                        #         Child Loop BB1_225 Depth 4
	cmpq	$0, -576(%rbp)          # 8-byte Folded Reload
	js	.LBB1_179
# BB#43:                                # %polly.loop_header247.preheader
                                        #   in Loop: Header=BB1_42 Depth=1
	movq	-240(%rbp), %rax        # 8-byte Reload
	movq	%rax, %rcx
	shlq	$5, %rcx
	movq	%rcx, -104(%rbp)        # 8-byte Spill
	movq	-72(%rbp), %rdx         # 8-byte Reload
	subq	%rcx, %rdx
	decq	%rdx
	cmpq	$31, %rdx
	movl	$31, %ecx
	cmovgq	%rcx, %rdx
	movq	%rdx, -352(%rbp)        # 8-byte Spill
	leaq	-1(%rdx), %rcx
	movq	%rcx, -96(%rbp)         # 8-byte Spill
	shlq	$7, %rax
	leaq	(%r9,%rax), %rcx
	movq	%rcx, -360(%rbp)        # 8-byte Spill
	addq	-112(%rbp), %rax        # 8-byte Folded Reload
	movq	%rax, -696(%rbp)        # 8-byte Spill
	movq	-304(%rbp), %rax        # 8-byte Reload
	movq	%rax, -424(%rbp)        # 8-byte Spill
	movq	-632(%rbp), %rax        # 8-byte Reload
	movq	%rax, -328(%rbp)        # 8-byte Spill
	movq	-640(%rbp), %rax        # 8-byte Reload
	movq	%rax, -368(%rbp)        # 8-byte Spill
	movq	-624(%rbp), %rax        # 8-byte Reload
	movq	%rax, -272(%rbp)        # 8-byte Spill
	movq	-648(%rbp), %rax        # 8-byte Reload
	movq	%rax, -416(%rbp)        # 8-byte Spill
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB1_44:                               # %polly.loop_header247
                                        #   Parent Loop BB1_42 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_182 Depth 3
                                        #         Child Loop BB1_196 Depth 4
                                        #         Child Loop BB1_212 Depth 4
                                        #       Child Loop BB1_47 Depth 3
                                        #         Child Loop BB1_50 Depth 4
                                        #         Child Loop BB1_235 Depth 4
                                        #         Child Loop BB1_172 Depth 4
                                        #         Child Loop BB1_225 Depth 4
	movq	%rsi, -136(%rbp)        # 8-byte Spill
	cmpq	$0, -352(%rbp)          # 8-byte Folded Reload
	js	.LBB1_178
# BB#45:                                # %polly.loop_header256.preheader
                                        #   in Loop: Header=BB1_44 Depth=2
	leaq	(,%rsi,8), %rax
	movq	%rax, -160(%rbp)        # 8-byte Spill
	movq	-408(%rbp), %r11        # 8-byte Reload
	subq	%rax, %r11
	cmpq	$7, %r11
	movl	$7, %eax
	cmovgq	%rax, %r11
	movq	%rsi, %rax
	shlq	$5, %rax
	movq	%rax, -504(%rbp)        # 8-byte Spill
	leaq	31(%rax), %rax
	testq	%r11, %r11
	js	.LBB1_177
# BB#46:                                # %polly.loop_preheader275.preheader.us.preheader
                                        #   in Loop: Header=BB1_44 Depth=2
	decq	%r11
	cmpq	-176(%rbp), %rax        # 8-byte Folded Reload
	setl	%al
	cmpq	$0, -80(%rbp)           # 8-byte Folded Reload
	sete	%cl
	orb	%al, %cl
	movb	%cl, -208(%rbp)         # 1-byte Spill
	movq	%rsi, %rdx
	shlq	$7, %rdx
	movq	-72(%rbp), %rax         # 8-byte Reload
	movq	%rsi, %rdi
	movq	%rax, %rsi
	imulq	%rdx, %rsi
	movq	-696(%rbp), %rcx        # 8-byte Reload
	addq	%rcx, %rsi
	movq	%rsi, -488(%rbp)        # 8-byte Spill
	leaq	4(%rdx), %rsi
	imulq	%rax, %rsi
	addq	%rcx, %rsi
	movq	%rsi, -440(%rbp)        # 8-byte Spill
	leaq	8(%rdx), %rsi
	imulq	%rax, %rsi
	addq	%rcx, %rsi
	movq	%rsi, -432(%rbp)        # 8-byte Spill
	movq	%rdi, %rsi
	orq	$12, %rdx
	imulq	%rax, %rdx
	addq	%rcx, %rdx
	movq	%rdx, -496(%rbp)        # 8-byte Spill
	movq	-304(%rbp), %rax        # 8-byte Reload
	movq	%rax, -232(%rbp)        # 8-byte Spill
	movq	-424(%rbp), %rax        # 8-byte Reload
	movq	-328(%rbp), %rcx        # 8-byte Reload
	movq	-368(%rbp), %r14        # 8-byte Reload
	movq	-416(%rbp), %r10        # 8-byte Reload
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB1_47:                               # %polly.split_new_and_old766
                                        #   Parent Loop BB1_42 Depth=1
                                        #     Parent Loop BB1_44 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_50 Depth 4
                                        #         Child Loop BB1_235 Depth 4
                                        #         Child Loop BB1_172 Depth 4
                                        #         Child Loop BB1_225 Depth 4
	movq	%rdi, -48(%rbp)         # 8-byte Spill
	movq	%rcx, -56(%rbp)         # 8-byte Spill
	movq	%rax, -88(%rbp)         # 8-byte Spill
	movq	-104(%rbp), %rdx        # 8-byte Reload
	leaq	(%rdi,%rdx), %rax
	movq	%rax, -200(%rbp)        # 8-byte Spill
	movl	(%r9,%rax,4), %r15d
	movabsq	$72057594037927935, %rax # imm = 0xFFFFFFFFFFFFFF
	cmpq	%rax, %rsi
	setle	%al
	leaq	1(,%rsi,8), %rcx
	movq	-144(%rbp), %rsi        # 8-byte Reload
	cmpq	%rcx, %rsi
	setge	%bl
	andb	%al, %bl
	leaq	1(%rdi,%rdx), %rdi
	movq	%rdi, -152(%rbp)        # 8-byte Spill
	movq	-168(%rbp), %rdx        # 8-byte Reload
	cmpq	%rdi, %rdx
	setge	%cl
	cmpq	%rsi, -160(%rbp)        # 8-byte Folded Reload
	setge	%sil
	cmpq	%rdi, %rdx
	setge	%dl
	testb	%cl, %bl
	jne	.LBB1_234
# BB#48:                                # %polly.split_new_and_old766
                                        #   in Loop: Header=BB1_47 Depth=3
	andb	%sil, %al
	andb	%dl, %al
	movq	$-1, %r12
	jne	.LBB1_234
# BB#49:                                #   in Loop: Header=BB1_47 Depth=3
	movq	-88(%rbp), %r8          # 8-byte Reload
	movq	-56(%rbp), %rdx         # 8-byte Reload
	movq	%r14, %rcx
	movq	-272(%rbp), %rax        # 8-byte Reload
	movq	%r10, %rdi
	.p2align	4, 0x90
.LBB1_50:                               # %polly.loop_preheader275.us
                                        #   Parent Loop BB1_42 Depth=1
                                        #     Parent Loop BB1_44 Depth=2
                                        #       Parent Loop BB1_47 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	(%r8), %esi
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	-12(%rax), %esi
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%r15d, %esi
	movl	(%rdx), %ebx
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	-8(%rax), %ebx
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%esi, %ebx
	movl	(%rcx), %esi
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	-4(%rax), %esi
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%ebx, %esi
	movl	(%rdi), %r15d
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	(%rax), %r15d
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%esi, %r15d
	incq	%r12
	addq	%r13, %rdi
	addq	$16, %rax
	addq	%r13, %rcx
	addq	%r13, %rdx
	addq	%r13, %r8
	cmpq	%r11, %r12
	jle	.LBB1_50
	jmp	.LBB1_51
	.p2align	4, 0x90
.LBB1_234:                              # %polly.loop_if770
                                        #   in Loop: Header=BB1_47 Depth=3
	movq	-144(%rbp), %rcx        # 8-byte Reload
	subq	-160(%rbp), %rcx        # 8-byte Folded Reload
	decq	%rcx
	cmpq	$6, %rcx
	movl	$7, %r8d
	cmovleq	%rcx, %r8
	movl	%r15d, -312(%rbp)
	movq	$-1, %rcx
	testq	%r8, %r8
	movq	-272(%rbp), %rdx        # 8-byte Reload
	movl	$0, %esi
	movq	-88(%rbp), %rax         # 8-byte Reload
	movq	-56(%rbp), %r15         # 8-byte Reload
	js	.LBB1_232
	.p2align	4, 0x90
.LBB1_235:                              # %polly.stmt.polly.loop_preheader275.us
                                        #   Parent Loop BB1_42 Depth=1
                                        #     Parent Loop BB1_44 Depth=2
                                        #       Parent Loop BB1_47 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	incq	%rcx
	movl	(%rax,%rsi), %edi
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	-12(%rdx), %edi
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	-312(%rbp), %edi
	movl	(%r15,%rsi), %ebx
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	-8(%rdx), %ebx
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%edi, %ebx
	movl	(%r14,%rsi), %edi
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	-4(%rdx), %edi
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%ebx, %edi
	movl	(%r10,%rsi), %ebx
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	(%rdx), %ebx
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%edi, %ebx
	movl	%ebx, -312(%rbp)
	movl	%ebx, -528(%rbp)
	leaq	-1(%r8), %rdi
	addq	%r13, %rsi
	addq	$16, %rdx
	cmpq	%rdi, %rcx
	jle	.LBB1_235
.LBB1_232:                              # %polly.cond811
                                        #   in Loop: Header=BB1_47 Depth=3
	movq	-160(%rbp), %rax        # 8-byte Reload
	cmpq	-144(%rbp), %rax        # 8-byte Folded Reload
	jl	.LBB1_233
# BB#236:                               # %polly.stmt.polly.loop_preheader275.us815
                                        #   in Loop: Header=BB1_47 Depth=3
	movq	-488(%rbp), %rax        # 8-byte Reload
	movq	-48(%rbp), %rdi         # 8-byte Reload
	movl	(%rax,%rdi,4), %eax
	movq	-128(%rbp), %rdx        # 8-byte Reload
	movq	-504(%rbp), %rsi        # 8-byte Reload
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	(%rdx,%rsi,4), %eax
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	-312(%rbp), %eax
	movq	-440(%rbp), %rcx        # 8-byte Reload
	movl	(%rcx,%rdi,4), %ecx
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	4(%rdx,%rsi,4), %ecx
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%eax, %ecx
	movq	-432(%rbp), %rax        # 8-byte Reload
	movl	(%rax,%rdi,4), %eax
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	8(%rdx,%rsi,4), %eax
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%ecx, %eax
	movq	-496(%rbp), %rcx        # 8-byte Reload
	movl	(%rcx,%rdi,4), %ecx
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	12(%rdx,%rsi,4), %ecx
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%eax, %ecx
	movl	%ecx, -312(%rbp)
	movl	%ecx, -528(%rbp)
	movl	-528(%rbp), %r15d
	jmp	.LBB1_51
	.p2align	4, 0x90
.LBB1_233:                              # %polly.exiting769
                                        #   in Loop: Header=BB1_47 Depth=3
	movl	-528(%rbp), %r15d
.LBB1_51:                               # %polly.cond297.loopexit.us
                                        #   in Loop: Header=BB1_47 Depth=3
	movq	-64(%rbp), %r9          # 8-byte Reload
	movq	-200(%rbp), %rbx        # 8-byte Reload
	movl	%r15d, (%r9,%rbx,4)
	cmpb	$0, -208(%rbp)          # 1-byte Folded Reload
	movq	-192(%rbp), %r8         # 8-byte Reload
	movq	-136(%rbp), %rsi        # 8-byte Reload
	jne	.LBB1_174
# BB#52:                                # %polly.preload.cond754
                                        #   in Loop: Header=BB1_47 Depth=3
	xorl	%eax, %eax
	testq	%r8, %r8
	movq	-48(%rbp), %rdi         # 8-byte Reload
	js	.LBB1_229
# BB#53:                                # %polly.preload.cond754
                                        #   in Loop: Header=BB1_47 Depth=3
	jle	.LBB1_54
.LBB1_229:                              # %polly.preload.exec756
                                        #   in Loop: Header=BB1_47 Depth=3
	movq	-128(%rbp), %rax        # 8-byte Reload
	movq	-184(%rbp), %rcx        # 8-byte Reload
	movl	(%rax,%rcx,4), %eax
.LBB1_54:                               # %polly.preload.cond758
                                        #   in Loop: Header=BB1_47 Depth=3
	movl	%eax, -256(%rbp)        # 4-byte Spill
	movl	%eax, -1272(%rbp)
	xorl	%eax, %eax
	testq	%r8, %r8
	js	.LBB1_230
# BB#55:                                # %polly.preload.cond758
                                        #   in Loop: Header=BB1_47 Depth=3
	jle	.LBB1_56
.LBB1_230:                              # %polly.preload.exec760
                                        #   in Loop: Header=BB1_47 Depth=3
	movq	-264(%rbp), %rax        # 8-byte Reload
	leaq	(%rbx,%rax), %rax
	movq	-112(%rbp), %rcx        # 8-byte Reload
	movl	(%rcx,%rax,4), %eax
.LBB1_56:                               # %polly.preload.merge759
                                        #   in Loop: Header=BB1_47 Depth=3
	testq	%r8, %r8
	setne	%dl
	movabsq	$2305843009213693951, %rcx # imm = 0x1FFFFFFFFFFFFFFF
	movq	%rcx, %rsi
	cmpq	%rsi, %rdi
	setle	%r9b
	movabsq	$72057594037927935, %rcx # imm = 0xFFFFFFFFFFFFFF
	cmpq	%rcx, -240(%rbp)        # 8-byte Folded Reload
	setle	%r12b
	movq	%r8, %rdi
	movq	-264(%rbp), %r8         # 8-byte Reload
	leaq	(%rbx,%r8), %rcx
	cmpq	%rsi, %rcx
	setle	%bl
	movabsq	$-2305843009213693952, %rsi # imm = 0xE000000000000000
	cmpq	%rsi, %r8
	setge	%sil
	testq	%rdi, %rdi
	movl	%eax, -1276(%rbp)
	je	.LBB1_226
# BB#57:                                # %polly.preload.merge759
                                        #   in Loop: Header=BB1_47 Depth=3
	andb	%r9b, %dl
	andb	%r12b, %dl
	andb	%sil, %dl
	andb	%dl, %bl
	jne	.LBB1_226
# BB#58:                                # %polly.loop_header303.us.preheader
                                        #   in Loop: Header=BB1_47 Depth=3
	testq	%rdi, %rdi
	jne	.LBB1_175
# BB#59:                                #   in Loop: Header=BB1_47 Depth=3
                                        # implicit-def: %ESI
	xorl	%r12d, %r12d
	jmp	.LBB1_176
	.p2align	4, 0x90
.LBB1_226:                              # %polly.cond762
                                        #   in Loop: Header=BB1_47 Depth=3
	movl	%r15d, -524(%rbp)
	movq	$0, -936(%rbp)
	testq	%rdi, %rdi
	js	.LBB1_231
# BB#227:                               # %polly.cond762
                                        #   in Loop: Header=BB1_47 Depth=3
	jle	.LBB1_228
.LBB1_231:                              # %polly.stmt.polly.loop_header303.us.prol
                                        #   in Loop: Header=BB1_47 Depth=3
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	-256(%rbp), %eax        # 4-byte Folded Reload
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%r15d, %eax
	movl	%eax, -724(%rbp)
	movl	%eax, -524(%rbp)
	movq	$1, -936(%rbp)
.LBB1_228:                              # %polly.exiting752
                                        #   in Loop: Header=BB1_47 Depth=3
	movl	-724(%rbp), %esi
	movl	-524(%rbp), %r15d
	movq	-936(%rbp), %r12
	jmp	.LBB1_176
.LBB1_175:                              # %polly.loop_header303.us.prol
                                        #   in Loop: Header=BB1_47 Depth=3
	movq	-112(%rbp), %rax        # 8-byte Reload
	movl	(%rax,%rcx,4), %esi
	.loc	1 42 74                 # MatrixMult.c:42:74
	movq	-128(%rbp), %rax        # 8-byte Reload
	movq	-184(%rbp), %rcx        # 8-byte Reload
	imull	(%rax,%rcx,4), %esi
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%r15d, %esi
	movl	%esi, %r15d
	movl	$1, %r12d
.LBB1_176:                              # %polly.loop_header303.us.preheader.split
                                        #   in Loop: Header=BB1_47 Depth=3
	movq	-80(%rbp), %rax         # 8-byte Reload
	movq	-224(%rbp), %r8         # 8-byte Reload
	cmpq	$0, -248(%rbp)          # 8-byte Folded Reload
	je	.LBB1_173
# BB#169:                               # %polly.split_new_and_old709
                                        #   in Loop: Header=BB1_47 Depth=3
	movq	-168(%rbp), %rsi        # 8-byte Reload
	movq	-152(%rbp), %rdi        # 8-byte Reload
	cmpq	%rdi, %rsi
	setge	%dl
	movq	%r12, %rcx
	subq	%rax, %rcx
	leal	1(%rcx), %eax
	testb	$1, %al
	sete	%bl
	cmpq	%rdi, %rsi
	setge	%al
	testb	$1, %cl
	sete	%cl
	testb	%bl, %dl
	jne	.LBB1_219
# BB#170:                               # %polly.split_new_and_old709
                                        #   in Loop: Header=BB1_47 Depth=3
	andb	%cl, %al
	jne	.LBB1_219
# BB#171:                               # %polly.loop_header303.us.preheader1
                                        #   in Loop: Header=BB1_47 Depth=3
	movq	-376(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%r12), %rax
	movq	-72(%rbp), %rdx         # 8-byte Reload
	imulq	%rdx, %rax
	movq	-232(%rbp), %rsi        # 8-byte Reload
	leaq	(%rsi,%rax,4), %r9
	movq	-184(%rbp), %rcx        # 8-byte Reload
	leaq	(%rcx,%r12), %rcx
	imulq	%rdx, %rcx
	leaq	(%rsi,%rcx,4), %rcx
	xorl	%edx, %edx
	movl	%r15d, %esi
	movq	-80(%rbp), %rbx         # 8-byte Reload
	movq	-480(%rbp), %rax        # 8-byte Reload
	.p2align	4, 0x90
.LBB1_172:                              # %polly.loop_header303.us
                                        #   Parent Loop BB1_42 Depth=1
                                        #     Parent Loop BB1_44 Depth=2
                                        #       Parent Loop BB1_47 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	(%rcx,%rdx,4), %edi
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	(%r8,%r12,4), %edi
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%esi, %edi
	movl	(%r9,%rdx,4), %esi
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	4(%r8,%r12,4), %esi
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%edi, %esi
	addq	$2, %r12
	addq	%rax, %rdx
	cmpq	%r12, %rbx
	jne	.LBB1_172
	jmp	.LBB1_173
.LBB1_219:                              # %polly.cond715
                                        #   in Loop: Header=BB1_47 Depth=3
	movl	%r15d, -520(%rbp)
	movl	%r12d, %eax
	movq	-80(%rbp), %r9          # 8-byte Reload
	subl	%r9d, %eax
	testb	$1, %al
	jne	.LBB1_220
# BB#221:                               # %polly.loop_if721
                                        #   in Loop: Header=BB1_47 Depth=3
	movq	%r8, %rbx
	subq	%r12, %r9
	sarq	%r9
	testq	%r9, %r9
	movq	-296(%rbp), %rax        # 8-byte Reload
	jle	.LBB1_222
# BB#224:                               # %polly.loop_preheader723
                                        #   in Loop: Header=BB1_47 Depth=3
	movq	-184(%rbp), %rcx        # 8-byte Reload
	leaq	(%rcx,%r12), %rdi
	movq	-176(%rbp), %rcx        # 8-byte Reload
	leaq	(%rcx,%r12), %rcx
	movq	-400(%rbp), %rdx        # 8-byte Reload
	subq	%r12, %rdx
	movq	-288(%rbp), %rsi        # 8-byte Reload
	leaq	(%rsi,%rcx,4), %rcx
	imulq	-72(%rbp), %rcx         # 8-byte Folded Reload
	movq	%rcx, -152(%rbp)        # 8-byte Spill
	leaq	(%rbx,%r12,4), %r8
	imulq	-280(%rbp), %rdi        # 8-byte Folded Reload
	movq	%rdi, -256(%rbp)        # 8-byte Spill
	movq	-232(%rbp), %rbx        # 8-byte Reload
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_225:                              # %polly.stmt.polly.loop_header303.us
                                        #   Parent Loop BB1_42 Depth=1
                                        #     Parent Loop BB1_44 Depth=2
                                        #       Parent Loop BB1_47 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	-256(%rbp), %rsi        # 8-byte Reload
	movl	(%rsi,%rbx), %esi
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	(%r8,%rcx,8), %esi
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	-520(%rbp), %esi
	movq	-152(%rbp), %rdi        # 8-byte Reload
	movl	(%rdi,%rbx), %r15d
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	4(%r8,%rcx,8), %r15d
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%esi, %r15d
	movl	%r15d, -520(%rbp)
	movl	%r15d, -716(%rbp)
	leaq	-1(%r9), %rsi
	addq	$-2, %rdx
	addq	%rax, %rbx
	cmpq	%rsi, %rcx
	leaq	1(%rcx), %rcx
	jl	.LBB1_225
.LBB1_222:                              # %polly.cond745
                                        #   in Loop: Header=BB1_47 Depth=3
	addq	$2, %r12
	cmpq	%r12, -80(%rbp)         # 8-byte Folded Reload
	jl	.LBB1_220
# BB#223:                               # %polly.stmt.polly.merge298.loopexit.us.unr-lcssa
                                        #   in Loop: Header=BB1_47 Depth=3
	movl	-716(%rbp), %eax
	movl	%eax, -720(%rbp)
	movl	-720(%rbp), %esi
	jmp	.LBB1_173
.LBB1_220:                              # %polly.exiting712
                                        #   in Loop: Header=BB1_47 Depth=3
	movl	-720(%rbp), %esi
.LBB1_173:                              # %polly.merge298.loopexit.us
                                        #   in Loop: Header=BB1_47 Depth=3
	movq	-64(%rbp), %r9          # 8-byte Reload
	movq	-200(%rbp), %rax        # 8-byte Reload
	movl	%esi, (%r9,%rax,4)
	movq	-136(%rbp), %rsi        # 8-byte Reload
	movq	-192(%rbp), %r8         # 8-byte Reload
.LBB1_174:                              # %polly.merge298.us
                                        #   in Loop: Header=BB1_47 Depth=3
	addq	$4, %r10
	addq	$4, %r14
	movq	-56(%rbp), %rcx         # 8-byte Reload
	addq	$4, %rcx
	movq	-88(%rbp), %rax         # 8-byte Reload
	addq	$4, %rax
	addq	$4, -232(%rbp)          # 8-byte Folded Spill
	movq	-48(%rbp), %rdi         # 8-byte Reload
	cmpq	-96(%rbp), %rdi         # 8-byte Folded Reload
	leaq	1(%rdi), %rdi
	jle	.LBB1_47
	jmp	.LBB1_178
	.p2align	4, 0x90
.LBB1_177:                              # %polly.loop_header256.preheader.split
                                        #   in Loop: Header=BB1_44 Depth=2
	cmpq	-176(%rbp), %rax        # 8-byte Folded Reload
	movq	-304(%rbp), %rax        # 8-byte Reload
	movl	$0, %r12d
	jl	.LBB1_178
	.p2align	4, 0x90
.LBB1_182:                              # %polly.then299
                                        #   Parent Loop BB1_42 Depth=1
                                        #     Parent Loop BB1_44 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_196 Depth 4
                                        #         Child Loop BB1_212 Depth 4
	cmpq	$0, -80(%rbp)           # 8-byte Folded Reload
	je	.LBB1_181
# BB#183:                               # %polly.preload.cond691
                                        #   in Loop: Header=BB1_182 Depth=3
	movq	%rax, -88(%rbp)         # 8-byte Spill
	movq	-104(%rbp), %rax        # 8-byte Reload
	leaq	(%r12,%rax), %r11
	movl	(%r9,%r11,4), %eax
	movl	%eax, -56(%rbp)         # 4-byte Spill
	movl	%eax, -1260(%rbp)
	xorl	%eax, %eax
	testq	%r8, %r8
	js	.LBB1_216
# BB#184:                               # %polly.preload.cond691
                                        #   in Loop: Header=BB1_182 Depth=3
	jle	.LBB1_185
.LBB1_216:                              # %polly.preload.exec693
                                        #   in Loop: Header=BB1_182 Depth=3
	movq	-128(%rbp), %rax        # 8-byte Reload
	movq	-184(%rbp), %rcx        # 8-byte Reload
	movl	(%rax,%rcx,4), %eax
.LBB1_185:                              # %polly.preload.cond695
                                        #   in Loop: Header=BB1_182 Depth=3
	movl	%eax, -48(%rbp)         # 4-byte Spill
	movl	%eax, -1264(%rbp)
	xorl	%r10d, %r10d
	testq	%r8, %r8
	js	.LBB1_217
# BB#186:                               # %polly.preload.cond695
                                        #   in Loop: Header=BB1_182 Depth=3
	jle	.LBB1_187
.LBB1_217:                              # %polly.preload.exec697
                                        #   in Loop: Header=BB1_182 Depth=3
	movq	-104(%rbp), %rax        # 8-byte Reload
	leaq	(%r12,%rax), %rax
	addq	-264(%rbp), %rax        # 8-byte Folded Reload
	movq	-112(%rbp), %rcx        # 8-byte Reload
	movl	(%rcx,%rax,4), %r10d
.LBB1_187:                              # %polly.preload.merge696
                                        #   in Loop: Header=BB1_182 Depth=3
	movl	%r10d, -1268(%rbp)
	movabsq	$2305843009213693951, %rcx # imm = 0x1FFFFFFFFFFFFFFF
	movq	%rcx, %rsi
	cmpq	%rsi, %r11
	setle	%dl
	testq	%r8, %r8
	movq	%r8, %rdi
	sete	%cl
	setne	%bl
	movq	-264(%rbp), %rax        # 8-byte Reload
	leaq	(%r11,%rax), %r8
	cmpq	%rsi, %r8
	setle	%r15b
	movabsq	$-2305843009213693952, %rsi # imm = 0xE000000000000000
	cmpq	%rsi, %rax
	setge	%r14b
	testb	%dl, %cl
	jne	.LBB1_213
# BB#188:                               # %polly.preload.merge696
                                        #   in Loop: Header=BB1_182 Depth=3
	andb	%dl, %bl
	andb	%r15b, %bl
	andb	%r14b, %bl
	jne	.LBB1_213
# BB#189:                               # %polly.loop_header303.preheader
                                        #   in Loop: Header=BB1_182 Depth=3
	testq	%rdi, %rdi
	leaq	(%r9,%r11,4), %r14
	movl	(%r9,%r11,4), %r15d
	movq	-296(%rbp), %r10        # 8-byte Reload
	jne	.LBB1_191
# BB#190:                               #   in Loop: Header=BB1_182 Depth=3
                                        # implicit-def: %EAX
	xorl	%ebx, %ebx
	jmp	.LBB1_192
	.p2align	4, 0x90
.LBB1_213:                              # %polly.cond703
                                        #   in Loop: Header=BB1_182 Depth=3
	movq	-104(%rbp), %rax        # 8-byte Reload
	leaq	(%r12,%rax), %rcx
	movq	%rcx, -1200(%rbp)
	movq	-360(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%r12,4), %rcx
	movq	%rcx, -1208(%rbp)
	movl	-56(%rbp), %ecx         # 4-byte Reload
	movl	%ecx, -516(%rbp)
	movq	$0, -928(%rbp)
	testq	%rdi, %rdi
	js	.LBB1_218
# BB#214:                               # %polly.cond703
                                        #   in Loop: Header=BB1_182 Depth=3
	jle	.LBB1_215
.LBB1_218:                              # %polly.stmt.polly.loop_header303.prol
                                        #   in Loop: Header=BB1_182 Depth=3
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	-48(%rbp), %r10d        # 4-byte Folded Reload
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%ecx, %r10d
	movl	%r10d, -712(%rbp)
	movl	%r10d, -516(%rbp)
	movq	$1, -928(%rbp)
.LBB1_215:                              # %polly.exiting687
                                        #   in Loop: Header=BB1_182 Depth=3
	movl	-712(%rbp), %eax
	movl	-516(%rbp), %r15d
	movq	-928(%rbp), %rbx
	movq	-1208(%rbp), %r14
	movq	-1200(%rbp), %r11
	movq	-296(%rbp), %r10        # 8-byte Reload
	jmp	.LBB1_192
.LBB1_191:                              # %polly.loop_header303.prol
                                        #   in Loop: Header=BB1_182 Depth=3
	movq	-112(%rbp), %rax        # 8-byte Reload
	movl	(%rax,%r8,4), %eax
	.loc	1 42 74                 # MatrixMult.c:42:74
	movq	-128(%rbp), %rcx        # 8-byte Reload
	movq	-184(%rbp), %rdx        # 8-byte Reload
	imull	(%rcx,%rdx,4), %eax
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%r15d, %eax
	movl	%eax, %r15d
	movl	$1, %ebx
.LBB1_192:                              # %polly.loop_header303.preheader.split
                                        #   in Loop: Header=BB1_182 Depth=3
	movq	-224(%rbp), %r8         # 8-byte Reload
	cmpq	$0, -248(%rbp)          # 8-byte Folded Reload
	movq	-80(%rbp), %rdx         # 8-byte Reload
	je	.LBB1_180
# BB#193:                               # %polly.split_new_and_old646
                                        #   in Loop: Header=BB1_182 Depth=3
	movq	%r14, -56(%rbp)         # 8-byte Spill
	movq	-104(%rbp), %rax        # 8-byte Reload
	leaq	1(%r12,%rax), %rax
	movq	-168(%rbp), %rdi        # 8-byte Reload
	cmpq	%rax, %rdi
	setge	%r14b
	movq	%rbx, %rcx
	subq	%rdx, %rcx
	leal	1(%rcx), %esi
	testb	$1, %sil
	sete	%dl
	cmpq	%rax, %rdi
	setge	%al
	testb	$1, %cl
	sete	%cl
	testb	%dl, %r14b
	jne	.LBB1_206
# BB#194:                               # %polly.split_new_and_old646
                                        #   in Loop: Header=BB1_182 Depth=3
	andb	%cl, %al
	jne	.LBB1_206
# BB#195:                               # %polly.loop_header303.preheader2
                                        #   in Loop: Header=BB1_182 Depth=3
	movq	-376(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%rbx), %rax
	movq	-72(%rbp), %rsi         # 8-byte Reload
	imulq	%rsi, %rax
	addq	%r11, %rax
	movq	-112(%rbp), %rdx        # 8-byte Reload
	leaq	(%rdx,%rax,4), %r9
	movq	-184(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%rbx), %rax
	imulq	%rsi, %rax
	addq	%r11, %rax
	leaq	(%rdx,%rax,4), %rdx
	xorl	%esi, %esi
	movl	%r15d, %eax
	movq	-80(%rbp), %rcx         # 8-byte Reload
	movq	-56(%rbp), %r14         # 8-byte Reload
	.p2align	4, 0x90
.LBB1_196:                              # %polly.loop_header303
                                        #   Parent Loop BB1_42 Depth=1
                                        #     Parent Loop BB1_44 Depth=2
                                        #       Parent Loop BB1_182 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	(%rdx,%rsi), %edi
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	(%r8,%rbx,4), %edi
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%eax, %edi
	movl	(%r9,%rsi), %eax
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	4(%r8,%rbx,4), %eax
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%edi, %eax
	addq	$2, %rbx
	addq	%r10, %rsi
	cmpq	%rbx, %rcx
	jne	.LBB1_196
	jmp	.LBB1_180
.LBB1_206:                              # %polly.cond651
                                        #   in Loop: Header=BB1_182 Depth=3
	movl	%r15d, -512(%rbp)
	movl	%ebx, %eax
	movq	-80(%rbp), %rcx         # 8-byte Reload
	subl	%ecx, %eax
	testb	$1, %al
	movq	-56(%rbp), %r14         # 8-byte Reload
	jne	.LBB1_207
# BB#208:                               # %polly.loop_if656
                                        #   in Loop: Header=BB1_182 Depth=3
	movq	-80(%rbp), %r14         # 8-byte Reload
	subq	%rbx, %r14
	sarq	%r14
	testq	%r14, %r14
	jle	.LBB1_209
# BB#211:                               # %polly.loop_preheader658
                                        #   in Loop: Header=BB1_182 Depth=3
	movq	-184(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%rbx), %r9
	movq	-176(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%rbx), %rax
	movq	-400(%rbp), %rdx        # 8-byte Reload
	subq	%rbx, %rdx
	movq	-288(%rbp), %rcx        # 8-byte Reload
	leaq	(%rcx,%rax,4), %r11
	imulq	-72(%rbp), %r11         # 8-byte Folded Reload
	leaq	(%r8,%rbx,4), %r15
	imulq	-280(%rbp), %r9         # 8-byte Folded Reload
	movq	-88(%rbp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_212:                              # %polly.stmt.polly.loop_header303
                                        #   Parent Loop BB1_42 Depth=1
                                        #     Parent Loop BB1_44 Depth=2
                                        #       Parent Loop BB1_182 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	(%r9,%rsi), %edi
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	(%r15,%rax,8), %edi
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	-512(%rbp), %edi
	movl	(%r11,%rsi), %ecx
	.loc	1 42 74                 # MatrixMult.c:42:74
	imull	4(%r15,%rax,8), %ecx
	.loc	1 42 55                 # MatrixMult.c:42:55
	addl	%edi, %ecx
	movl	%ecx, -512(%rbp)
	movl	%ecx, -704(%rbp)
	leaq	-1(%r14), %rcx
	addq	$-2, %rdx
	addq	%r10, %rsi
	cmpq	%rcx, %rax
	leaq	1(%rax), %rax
	jl	.LBB1_212
.Ltmp64:
.LBB1_209:                              # %polly.cond680
                                        #   in Loop: Header=BB1_182 Depth=3
	addq	$2, %rbx
	cmpq	%rbx, -80(%rbp)         # 8-byte Folded Reload
	movq	-56(%rbp), %r14         # 8-byte Reload
	jl	.LBB1_207
# BB#210:                               # %polly.stmt.polly.merge298.loopexit.unr-lcssa
                                        #   in Loop: Header=BB1_182 Depth=3
	movl	-704(%rbp), %eax
	movl	%eax, -708(%rbp)
	movl	-708(%rbp), %eax
	jmp	.LBB1_180
.LBB1_207:                              # %polly.exiting649
                                        #   in Loop: Header=BB1_182 Depth=3
	movl	-708(%rbp), %eax
.LBB1_180:                              # %polly.merge298.loopexit
                                        #   in Loop: Header=BB1_182 Depth=3
	movq	%r10, -296(%rbp)        # 8-byte Spill
	movl	%eax, (%r14)
	movq	-64(%rbp), %r9          # 8-byte Reload
	movq	-136(%rbp), %rsi        # 8-byte Reload
	movq	-192(%rbp), %r8         # 8-byte Reload
	movq	-88(%rbp), %rax         # 8-byte Reload
.LBB1_181:                              # %polly.merge298
                                        #   in Loop: Header=BB1_182 Depth=3
	addq	$4, %rax
	cmpq	-96(%rbp), %r12         # 8-byte Folded Reload
	leaq	1(%r12), %r12
	jle	.LBB1_182
	.p2align	4, 0x90
.LBB1_178:                              # %polly.loop_exit258
                                        #   in Loop: Header=BB1_44 Depth=2
	movq	-456(%rbp), %rax        # 8-byte Reload
	addq	%rax, -416(%rbp)        # 8-byte Folded Spill
	subq	$-128, -272(%rbp)       # 8-byte Folded Spill
	addq	%rax, -368(%rbp)        # 8-byte Folded Spill
	addq	%rax, -328(%rbp)        # 8-byte Folded Spill
	addq	%rax, -424(%rbp)        # 8-byte Folded Spill
	cmpq	-576(%rbp), %rsi        # 8-byte Folded Reload
	leaq	1(%rsi), %rsi
	jne	.LBB1_44
.LBB1_179:                              # %polly.loop_exit249
                                        #   in Loop: Header=BB1_42 Depth=1
	subq	$-128, -304(%rbp)       # 8-byte Folded Spill
	subq	$-128, -648(%rbp)       # 8-byte Folded Spill
	subq	$-128, -640(%rbp)       # 8-byte Folded Spill
	subq	$-128, -632(%rbp)       # 8-byte Folded Spill
	movq	-336(%rbp), %rax        # 8-byte Reload
	movq	-240(%rbp), %rcx        # 8-byte Reload
	cmpq	%rax, %rcx
	leaq	1(%rcx), %rcx
	movq	%rcx, -240(%rbp)        # 8-byte Spill
	jne	.LBB1_42
.LBB1_22:                               # %for.end41
	movq	%r9, %rbx
	.loc	1 47 39 is_stmt 1       # MatrixMult.c:47:39
	movl	$16, %edi
	callq	malloc
.Ltmp65:
	#DEBUG_VALUE: matrix_multiply:C <- %RAX
	.loc	1 48 13                 # MatrixMult.c:48:13
	movq	%rbx, (%rax)
	.loc	1 49 14                 # MatrixMult.c:49:14
	movl	-308(%rbp), %ecx        # 4-byte Reload
	movl	%ecx, 8(%rax)
	.loc	1 50 15                 # MatrixMult.c:50:15
	movq	-448(%rbp), %rcx        # 8-byte Reload
	movl	%ecx, 12(%rax)
	.loc	1 52 5                  # MatrixMult.c:52:5
	addq	$1272, %rsp             # imm = 0x4F8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp66:
.LBB1_275:                              # %polly.loop_if1136
	movl	%r13d, -116(%rbp)       # 4-byte Spill
	leaq	-1(%r14,%rdi,8), %rax
	sarq	$4, %rax
	subq	%rdi, %rax
	movq	%rdx, %r12
	movq	%rdx, %r13
	subq	%rdi, %r12
	decq	%r12
	sarq	%r12
	cmpq	%r12, %rax
	cmovleq	%rax, %r12
	testq	%r12, %r12
	js	.LBB1_276
# BB#277:                               # %polly.loop_preheader1138
	movq	%r8, -168(%rbp)         # 8-byte Spill
	shlq	$7, %rdi
	addq	%r9, %rdi
	movq	%r9, -64(%rbp)          # 8-byte Spill
	subq	%r14, %r15
	movq	$-1, %rbx
	decq	%r12
.LBB1_278:                              # %polly.stmt.polly.loop_preheader100.preheader.us
                                        # =>This Inner Loop Header: Depth=1
	cmpq	$-9, %r15
	movq	$-8, %rdx
	cmovgq	%r15, %rdx
	shlq	$4, %rdx
	negq	%rdx
	xorl	%esi, %esi
	movq	%rdi, %r14
	callq	memset
	movq	%r14, %rdi
	incq	%rbx
	addq	$256, %rdi              # imm = 0x100
	addq	$16, %r15
	cmpq	%r12, %rbx
	jle	.LBB1_278
# BB#279:
	movb	-48(%rbp), %al          # 1-byte Reload
	movq	-168(%rbp), %r8         # 8-byte Reload
	movq	%r13, %r15
	jmp	.LBB1_38
.LBB1_276:
	movq	%r9, -64(%rbp)          # 8-byte Spill
	movb	%bl, %al
	movq	%r13, %r15
	jmp	.LBB1_38
.Lfunc_end1:
	.size	matrix_multiply, .Lfunc_end1-matrix_multiply
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin2:
	.loc	1 86 0                  # MatrixMult.c:86:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp67:
	.cfi_def_cfa_offset 16
.Ltmp68:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp69:
	.cfi_def_cfa_register %rbp
.Ltmp70:
	.loc	1 99 19 prologue_end    # MatrixMult.c:99:19
	pushq	%r14
	pushq	%rbx
.Ltmp71:
	.cfi_offset %rbx, -32
.Ltmp72:
	.cfi_offset %r14, -24
	#DEBUG_VALUE: main:argc <- %EDI
	#DEBUG_VALUE: main:args <- %RSI
	callq	convertArgsToIntArray
	.loc	1 100 32                # MatrixMult.c:100:32
	movq	(%rax), %rdi
.Ltmp73:
	.loc	1 100 15 is_stmt 0      # MatrixMult.c:100:15
	callq	parseStringToInt
	movq	%rax, %rbx
.Ltmp74:
	#DEBUG_VALUE: main:height <- %EBX
	#DEBUG_VALUE: main:width <- %EBX
	#DEBUG_VALUE: main:max <- %EBX
	.loc	1 105 7 is_stmt 1       # MatrixMult.c:105:7
	movl	$1, %edi
	movl	%ebx, %esi
.Ltmp75:
	movl	%ebx, %edx
	callq	init
	movq	%rax, %r14
.Ltmp76:
	#DEBUG_VALUE: main:A <- %R14
	.loc	1 106 7                 # MatrixMult.c:106:7
	movl	$1, %edi
	movl	%ebx, %esi
	movl	%ebx, %edx
	callq	init
.Ltmp77:
	#DEBUG_VALUE: main:B <- %RAX
	.loc	1 108 7                 # MatrixMult.c:108:7
	movq	%r14, %rdi
	movq	%rax, %rsi
	callq	matrix_multiply
.Ltmp78:
	#DEBUG_VALUE: main:C <- %RAX
	.loc	1 109 75                # MatrixMult.c:109:75
	leal	-1(%rbx), %ecx
	.loc	1 109 86 is_stmt 0      # MatrixMult.c:109:86
	movl	%ebx, %edx
	imull	%edx, %edx
	shlq	$32, %rdx
	movabsq	$-4294967296, %rsi      # imm = 0xFFFFFFFF00000000
	addq	%rdx, %rsi
	.loc	1 109 90                # MatrixMult.c:109:90
	movq	(%rax), %rax
.Ltmp79:
	.loc	1 109 86                # MatrixMult.c:109:86
	sarq	$30, %rsi
	movl	(%rax,%rsi), %r9d
	.loc	1 109 5                 # MatrixMult.c:109:5
	movl	$.L.str, %edi
	xorl	%eax, %eax
	movl	%ebx, %esi
	movl	%ebx, %edx
	movl	%ecx, %r8d
	callq	printf
	.loc	1 111 5 is_stmt 1       # MatrixMult.c:111:5
	xorl	%eax, %eax
	popq	%rbx
.Ltmp80:
	popq	%r14
.Ltmp81:
	popq	%rbp
	retq
.Ltmp82:
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Pass %d X %d matrix test case (C[%d][%d]=%d)\n"
	.size	.L.str, 46

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)" # string offset=0
.Linfo_string1:
	.asciz	"MatrixMult.c"          # string offset=165
.Linfo_string2:
	.asciz	"/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten2" # string offset=178
.Linfo_string3:
	.asciz	"int"                   # string offset=246
.Linfo_string4:
	.asciz	"data"                  # string offset=250
.Linfo_string5:
	.asciz	"width"                 # string offset=255
.Linfo_string6:
	.asciz	"height"                # string offset=261
.Linfo_string7:
	.asciz	"Matrix"                # string offset=268
.Linfo_string8:
	.asciz	"init"                  # string offset=275
.Linfo_string9:
	.asciz	"matrix_multiply"       # string offset=280
.Linfo_string10:
	.asciz	"main"                  # string offset=296
.Linfo_string11:
	.asciz	"value"                 # string offset=301
.Linfo_string12:
	.asciz	"i"                     # string offset=307
.Linfo_string13:
	.asciz	"matrix"                # string offset=309
.Linfo_string14:
	.asciz	"A"                     # string offset=316
.Linfo_string15:
	.asciz	"B"                     # string offset=318
.Linfo_string16:
	.asciz	"A_data"                # string offset=320
.Linfo_string17:
	.asciz	"B_data"                # string offset=327
.Linfo_string18:
	.asciz	"k"                     # string offset=334
.Linfo_string19:
	.asciz	"C"                     # string offset=336
.Linfo_string20:
	.asciz	"argc"                  # string offset=338
.Linfo_string21:
	.asciz	"args"                  # string offset=343
.Linfo_string22:
	.asciz	"char"                  # string offset=348
.Linfo_string23:
	.asciz	"max"                   # string offset=353
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp9-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp9-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp10-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	84                      # super-register DW_OP_reg4
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp10-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	118                     # DW_OP_breg6
	.byte	152                     # -104
	.byte	127                     # 
	.quad	0
	.quad	0
.Ldebug_loc2:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp8-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	81                      # super-register DW_OP_reg1
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp8-.Lfunc_begin0
	.quad	.Ltmp12-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	94                      # super-register DW_OP_reg14
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp12-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	118                     # DW_OP_breg6
	.byte	180                     # -76
	.byte	127                     # 
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp26-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	.Ltmp26-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	93                      # DW_OP_reg13
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Lfunc_begin1-.Lfunc_begin0
	.quad	.Ltmp33-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc5:
	.quad	.Ltmp27-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc6:
	.quad	.Ltmp28-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	95                      # DW_OP_reg15
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Ltmp29-.Lfunc_begin0
	.quad	.Ltmp30-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	82                      # super-register DW_OP_reg2
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	.Ltmp30-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	118                     # DW_OP_breg6
	.byte	204                     # -308
	.byte	125                     # 
	.quad	0
	.quad	0
.Ldebug_loc8:
	.quad	.Ltmp65-.Lfunc_begin0
	.quad	.Ltmp66-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc9:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	85                      # super-register DW_OP_reg5
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc10:
	.quad	.Lfunc_begin2-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	84                      # DW_OP_reg4
	.quad	0
	.quad	0
.Ldebug_loc11:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp80-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc12:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp80-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc13:
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp80-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	83                      # super-register DW_OP_reg3
	.byte	147                     # DW_OP_piece
	.byte	4                       # 4
	.quad	0
	.quad	0
.Ldebug_loc14:
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	94                      # DW_OP_reg14
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp78-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc16:
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
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
	.byte	5                       # Abbreviation Code
	.byte	19                      # DW_TAG_structure_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	6                       # Abbreviation Code
	.byte	13                      # DW_TAG_member
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	56                      # DW_AT_data_member_location
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	7                       # Abbreviation Code
	.byte	55                      # DW_TAG_restrict_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
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
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
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
	.byte	10                      # Abbreviation Code
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
	.byte	11                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
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
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	517                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x1fe DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x5 DW_TAG_pointer_type
	.long	47                      # DW_AT_type
	.byte	3                       # Abbrev [3] 0x2f:0x7 DW_TAG_base_type
	.long	.Linfo_string3          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	2                       # Abbrev [2] 0x36:0x5 DW_TAG_pointer_type
	.long	59                      # DW_AT_type
	.byte	4                       # Abbrev [4] 0x3b:0xb DW_TAG_typedef
	.long	70                      # DW_AT_type
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.byte	5                       # Abbrev [5] 0x46:0x29 DW_TAG_structure_type
	.byte	16                      # DW_AT_byte_size
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.byte	6                       # Abbrev [6] 0x4a:0xc DW_TAG_member
	.long	.Linfo_string4          # DW_AT_name
	.long	111                     # DW_AT_type
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	6                       # Abbrev [6] 0x56:0xc DW_TAG_member
	.long	.Linfo_string5          # DW_AT_name
	.long	47                      # DW_AT_type
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	6                       # Abbrev [6] 0x62:0xc DW_TAG_member
	.long	.Linfo_string6          # DW_AT_name
	.long	47                      # DW_AT_type
	.byte	1                       # DW_AT_decl_file
	.byte	8                       # DW_AT_decl_line
	.byte	12                      # DW_AT_data_member_location
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x6f:0x5 DW_TAG_restrict_type
	.long	42                      # DW_AT_type
	.byte	8                       # Abbrev [8] 0x74:0x60 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	498                     # DW_AT_type
                                        # DW_AT_external
	.byte	9                       # Abbrev [9] 0x8d:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	47                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x9c:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	47                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0xab:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	47                      # DW_AT_type
	.byte	10                      # Abbrev [10] 0xba:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
	.long	47                      # DW_AT_type
	.byte	11                      # Abbrev [11] 0xc6:0xd DW_TAG_variable
	.byte	1                       # DW_AT_location
	.byte	80
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	21                      # DW_AT_decl_line
	.long	498                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	8                       # Abbrev [8] 0xd4:0x8c DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	29                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	498                     # DW_AT_type
                                        # DW_AT_external
	.byte	9                       # Abbrev [9] 0xed:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	29                      # DW_AT_decl_line
	.long	498                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0xfc:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc4            # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	29                      # DW_AT_decl_line
	.long	498                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x10b:0xf DW_TAG_variable
	.long	.Ldebug_loc5            # DW_AT_location
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
	.long	111                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x11a:0xf DW_TAG_variable
	.long	.Ldebug_loc6            # DW_AT_location
	.long	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	32                      # DW_AT_decl_line
	.long	111                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x129:0xf DW_TAG_variable
	.long	.Ldebug_loc7            # DW_AT_location
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	34                      # DW_AT_decl_line
	.long	47                      # DW_AT_type
	.byte	10                      # Abbrev [10] 0x138:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	30                      # DW_AT_decl_line
	.long	47                      # DW_AT_type
	.byte	10                      # Abbrev [10] 0x144:0xc DW_TAG_variable
	.byte	0                       # DW_AT_const_value
	.long	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	30                      # DW_AT_decl_line
	.long	47                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x150:0xf DW_TAG_variable
	.long	.Ldebug_loc8            # DW_AT_location
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	47                      # DW_AT_decl_line
	.long	498                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	8                       # Abbrev [8] 0x160:0x92 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	85                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	47                      # DW_AT_type
                                        # DW_AT_external
	.byte	9                       # Abbrev [9] 0x179:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc9            # DW_AT_location
	.long	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	85                      # DW_AT_decl_line
	.long	47                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x188:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc10           # DW_AT_location
	.long	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	85                      # DW_AT_decl_line
	.long	503                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x197:0xf DW_TAG_variable
	.long	.Ldebug_loc11           # DW_AT_location
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	97                      # DW_AT_decl_line
	.long	47                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1a6:0xf DW_TAG_variable
	.long	.Ldebug_loc12           # DW_AT_location
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	97                      # DW_AT_decl_line
	.long	47                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1b5:0xf DW_TAG_variable
	.long	.Ldebug_loc13           # DW_AT_location
	.long	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	100                     # DW_AT_decl_line
	.long	47                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1c4:0xf DW_TAG_variable
	.long	.Ldebug_loc14           # DW_AT_location
	.long	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	94                      # DW_AT_decl_line
	.long	498                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1d3:0xf DW_TAG_variable
	.long	.Ldebug_loc15           # DW_AT_location
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	95                      # DW_AT_decl_line
	.long	498                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1e2:0xf DW_TAG_variable
	.long	.Ldebug_loc16           # DW_AT_location
	.long	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	96                      # DW_AT_decl_line
	.long	498                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x1f2:0x5 DW_TAG_restrict_type
	.long	54                      # DW_AT_type
	.byte	2                       # Abbrev [2] 0x1f7:0x5 DW_TAG_pointer_type
	.long	508                     # DW_AT_type
	.byte	2                       # Abbrev [2] 0x1fc:0x5 DW_TAG_pointer_type
	.long	513                     # DW_AT_type
	.byte	3                       # Abbrev [3] 0x201:0x7 DW_TAG_base_type
	.long	.Linfo_string22         # DW_AT_name
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
	.long	521                     # Compilation Unit Length
	.long	116                     # DIE offset
	.asciz	"init"                  # External Name
	.long	212                     # DIE offset
	.asciz	"matrix_multiply"       # External Name
	.long	352                     # DIE offset
	.asciz	"main"                  # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	521                     # Compilation Unit Length
	.long	59                      # DIE offset
	.asciz	"Matrix"                # External Name
	.long	47                      # DIE offset
	.asciz	"int"                   # External Name
	.long	513                     # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
