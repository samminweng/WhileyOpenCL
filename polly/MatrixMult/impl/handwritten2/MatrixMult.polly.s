	.text
	.file	"MatrixMult.polly.ll"
	.globl	init
	.p2align	4, 0x90
	.type	init,@function
init:                                   # @init
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
	pushq	%r14
	pushq	%rbx
.Ltmp3:
	.cfi_offset %rbx, -32
.Ltmp4:
	.cfi_offset %r14, -24
	movl	%edi, %ebx
	movl	$4194304, %edi          # imm = 0x400000
	callq	malloc
	movq	%rax, %r14
	movq	%r14, %r8
	addq	$12, %r8
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB0_1:                                # %polly.loop_preheader2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
                                        #       Child Loop BB0_7 Depth 3
                                        #         Child Loop BB0_8 Depth 4
	movq	%r8, %r10
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB0_6:                                # %polly.loop_preheader8
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_7 Depth 3
                                        #         Child Loop BB0_8 Depth 4
	movq	%r10, %rcx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_7:                                # %polly.loop_preheader14
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_8 Depth 4
	movq	%rcx, %rdi
	movl	$32, %edx
	.p2align	4, 0x90
.LBB0_8:                                # %polly.stmt.for.body3
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        #       Parent Loop BB0_7 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	%ebx, -12(%rdi)
	movl	%ebx, -8(%rdi)
	movl	%ebx, -4(%rdi)
	movl	%ebx, (%rdi)
	addq	$16, %rdi
	addq	$-4, %rdx
	jne	.LBB0_8
# BB#4:                                 # %polly.loop_exit15
                                        #   in Loop: Header=BB0_7 Depth=3
	incq	%rax
	addq	$4096, %rcx             # imm = 0x1000
	cmpq	$32, %rax
	jne	.LBB0_7
# BB#5:                                 # %polly.loop_exit9
                                        #   in Loop: Header=BB0_6 Depth=2
	incq	%rsi
	subq	$-128, %r10
	cmpq	$32, %rsi
	jne	.LBB0_6
# BB#2:                                 # %polly.loop_exit3
                                        #   in Loop: Header=BB0_1 Depth=1
	incq	%r9
	addq	$131072, %r8            # imm = 0x20000
	cmpq	$32, %r9
	jne	.LBB0_1
# BB#3:                                 # %polly.exiting
	movl	$16, %edi
	callq	malloc
	movq	%r14, (%rax)
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end0:
	.size	init, .Lfunc_end0-init
	.cfi_endproc

	.globl	matrix_multiply
	.p2align	4, 0x90
	.type	matrix_multiply,@function
matrix_multiply:                        # @matrix_multiply
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp5:
	.cfi_def_cfa_offset 16
.Ltmp6:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp7:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$72, %rsp
.Ltmp8:
	.cfi_offset %rbx, -56
.Ltmp9:
	.cfi_offset %r12, -48
.Ltmp10:
	.cfi_offset %r13, -40
.Ltmp11:
	.cfi_offset %r14, -32
.Ltmp12:
	.cfi_offset %r15, -24
	movq	%rsi, %r14
	movq	%rdi, %r15
	movl	$4194304, %edi          # imm = 0x400000
	callq	malloc
	movq	%rax, %rbx
	movq	(%r15), %r15
	movq	(%r14), %r14
	leaq	4194304(%r15), %rax
	cmpq	%rbx, %rax
	setbe	%al
	leaq	4194304(%rbx), %rcx
	cmpq	%r15, %rcx
	setbe	%dl
	orb	%al, %dl
	leaq	4194304(%r14), %rax
	cmpq	%rbx, %rax
	setbe	%al
	cmpq	%r14, %rcx
	setbe	%cl
	movzbl	%dl, %edx
	cmpl	$1, %edx
	jne	.LBB1_2
# BB#1:                                 # %entry
	orb	%al, %cl
	je	.LBB1_2
# BB#11:                                # %polly.loop_preheader11.preheader
	movq	%rbx, %rdx
	addq	$126976, %rdx           # imm = 0x1F000
	xorl	%r8d, %r8d
	xorps	%xmm0, %xmm0
	.p2align	4, 0x90
.LBB1_12:                               # %polly.loop_preheader11
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_13 Depth 2
	movq	%rdx, %rdi
	movl	$32, %esi
	.p2align	4, 0x90
.LBB1_13:                               # %polly.loop_preheader23
                                        #   Parent Loop BB1_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movups	%xmm0, -126864(%rdi)
	movups	%xmm0, -126880(%rdi)
	movups	%xmm0, -126896(%rdi)
	movups	%xmm0, -126912(%rdi)
	movups	%xmm0, -126928(%rdi)
	movups	%xmm0, -126944(%rdi)
	movups	%xmm0, -126960(%rdi)
	movups	%xmm0, -126976(%rdi)
	movups	%xmm0, -122768(%rdi)
	movups	%xmm0, -122784(%rdi)
	movups	%xmm0, -122800(%rdi)
	movups	%xmm0, -122816(%rdi)
	movups	%xmm0, -122832(%rdi)
	movups	%xmm0, -122848(%rdi)
	movups	%xmm0, -122864(%rdi)
	movups	%xmm0, -122880(%rdi)
	movups	%xmm0, -118672(%rdi)
	movups	%xmm0, -118688(%rdi)
	movups	%xmm0, -118704(%rdi)
	movups	%xmm0, -118720(%rdi)
	movups	%xmm0, -118736(%rdi)
	movups	%xmm0, -118752(%rdi)
	movups	%xmm0, -118768(%rdi)
	movups	%xmm0, -118784(%rdi)
	movups	%xmm0, -114576(%rdi)
	movups	%xmm0, -114592(%rdi)
	movups	%xmm0, -114608(%rdi)
	movups	%xmm0, -114624(%rdi)
	movups	%xmm0, -114640(%rdi)
	movups	%xmm0, -114656(%rdi)
	movups	%xmm0, -114672(%rdi)
	movups	%xmm0, -114688(%rdi)
	movups	%xmm0, -110480(%rdi)
	movups	%xmm0, -110496(%rdi)
	movups	%xmm0, -110512(%rdi)
	movups	%xmm0, -110528(%rdi)
	movups	%xmm0, -110544(%rdi)
	movups	%xmm0, -110560(%rdi)
	movups	%xmm0, -110576(%rdi)
	movups	%xmm0, -110592(%rdi)
	movups	%xmm0, -106384(%rdi)
	movups	%xmm0, -106400(%rdi)
	movups	%xmm0, -106416(%rdi)
	movups	%xmm0, -106432(%rdi)
	movups	%xmm0, -106448(%rdi)
	movups	%xmm0, -106464(%rdi)
	movups	%xmm0, -106480(%rdi)
	movups	%xmm0, -106496(%rdi)
	movups	%xmm0, -102288(%rdi)
	movups	%xmm0, -102304(%rdi)
	movups	%xmm0, -102320(%rdi)
	movups	%xmm0, -102336(%rdi)
	movups	%xmm0, -102352(%rdi)
	movups	%xmm0, -102368(%rdi)
	movups	%xmm0, -102384(%rdi)
	movups	%xmm0, -102400(%rdi)
	movups	%xmm0, -98192(%rdi)
	movups	%xmm0, -98208(%rdi)
	movups	%xmm0, -98224(%rdi)
	movups	%xmm0, -98240(%rdi)
	movups	%xmm0, -98256(%rdi)
	movups	%xmm0, -98272(%rdi)
	movups	%xmm0, -98288(%rdi)
	movups	%xmm0, -98304(%rdi)
	movups	%xmm0, -94096(%rdi)
	movups	%xmm0, -94112(%rdi)
	movups	%xmm0, -94128(%rdi)
	movups	%xmm0, -94144(%rdi)
	movups	%xmm0, -94160(%rdi)
	movups	%xmm0, -94176(%rdi)
	movups	%xmm0, -94192(%rdi)
	movups	%xmm0, -94208(%rdi)
	movups	%xmm0, -90000(%rdi)
	movups	%xmm0, -90016(%rdi)
	movups	%xmm0, -90032(%rdi)
	movups	%xmm0, -90048(%rdi)
	movups	%xmm0, -90064(%rdi)
	movups	%xmm0, -90080(%rdi)
	movups	%xmm0, -90096(%rdi)
	movups	%xmm0, -90112(%rdi)
	movups	%xmm0, -85904(%rdi)
	movups	%xmm0, -85920(%rdi)
	movups	%xmm0, -85936(%rdi)
	movups	%xmm0, -85952(%rdi)
	movups	%xmm0, -85968(%rdi)
	movups	%xmm0, -85984(%rdi)
	movups	%xmm0, -86000(%rdi)
	movups	%xmm0, -86016(%rdi)
	movups	%xmm0, -81808(%rdi)
	movups	%xmm0, -81824(%rdi)
	movups	%xmm0, -81840(%rdi)
	movups	%xmm0, -81856(%rdi)
	movups	%xmm0, -81872(%rdi)
	movups	%xmm0, -81888(%rdi)
	movups	%xmm0, -81904(%rdi)
	movups	%xmm0, -81920(%rdi)
	movups	%xmm0, -77712(%rdi)
	movups	%xmm0, -77728(%rdi)
	movups	%xmm0, -77744(%rdi)
	movups	%xmm0, -77760(%rdi)
	movups	%xmm0, -77776(%rdi)
	movups	%xmm0, -77792(%rdi)
	movups	%xmm0, -77808(%rdi)
	movups	%xmm0, -77824(%rdi)
	movups	%xmm0, -73616(%rdi)
	movups	%xmm0, -73632(%rdi)
	movups	%xmm0, -73648(%rdi)
	movups	%xmm0, -73664(%rdi)
	movups	%xmm0, -73680(%rdi)
	movups	%xmm0, -73696(%rdi)
	movups	%xmm0, -73712(%rdi)
	movups	%xmm0, -73728(%rdi)
	movups	%xmm0, -69520(%rdi)
	movups	%xmm0, -69536(%rdi)
	movups	%xmm0, -69552(%rdi)
	movups	%xmm0, -69568(%rdi)
	movups	%xmm0, -69584(%rdi)
	movups	%xmm0, -69600(%rdi)
	movups	%xmm0, -69616(%rdi)
	movups	%xmm0, -69632(%rdi)
	movups	%xmm0, -65424(%rdi)
	movups	%xmm0, -65440(%rdi)
	movups	%xmm0, -65456(%rdi)
	movups	%xmm0, -65472(%rdi)
	movups	%xmm0, -65488(%rdi)
	movups	%xmm0, -65504(%rdi)
	movups	%xmm0, -65520(%rdi)
	movups	%xmm0, -65536(%rdi)
	movups	%xmm0, -61328(%rdi)
	movups	%xmm0, -61344(%rdi)
	movups	%xmm0, -61360(%rdi)
	movups	%xmm0, -61376(%rdi)
	movups	%xmm0, -61392(%rdi)
	movups	%xmm0, -61408(%rdi)
	movups	%xmm0, -61424(%rdi)
	movups	%xmm0, -61440(%rdi)
	movups	%xmm0, -57232(%rdi)
	movups	%xmm0, -57248(%rdi)
	movups	%xmm0, -57264(%rdi)
	movups	%xmm0, -57280(%rdi)
	movups	%xmm0, -57296(%rdi)
	movups	%xmm0, -57312(%rdi)
	movups	%xmm0, -57328(%rdi)
	movups	%xmm0, -57344(%rdi)
	movups	%xmm0, -53136(%rdi)
	movups	%xmm0, -53152(%rdi)
	movups	%xmm0, -53168(%rdi)
	movups	%xmm0, -53184(%rdi)
	movups	%xmm0, -53200(%rdi)
	movups	%xmm0, -53216(%rdi)
	movups	%xmm0, -53232(%rdi)
	movups	%xmm0, -53248(%rdi)
	movups	%xmm0, -49040(%rdi)
	movups	%xmm0, -49056(%rdi)
	movups	%xmm0, -49072(%rdi)
	movups	%xmm0, -49088(%rdi)
	movups	%xmm0, -49104(%rdi)
	movups	%xmm0, -49120(%rdi)
	movups	%xmm0, -49136(%rdi)
	movups	%xmm0, -49152(%rdi)
	movups	%xmm0, -44944(%rdi)
	movups	%xmm0, -44960(%rdi)
	movups	%xmm0, -44976(%rdi)
	movups	%xmm0, -44992(%rdi)
	movups	%xmm0, -45008(%rdi)
	movups	%xmm0, -45024(%rdi)
	movups	%xmm0, -45040(%rdi)
	movups	%xmm0, -45056(%rdi)
	movups	%xmm0, -40848(%rdi)
	movups	%xmm0, -40864(%rdi)
	movups	%xmm0, -40880(%rdi)
	movups	%xmm0, -40896(%rdi)
	movups	%xmm0, -40912(%rdi)
	movups	%xmm0, -40928(%rdi)
	movups	%xmm0, -40944(%rdi)
	movups	%xmm0, -40960(%rdi)
	movups	%xmm0, -36752(%rdi)
	movups	%xmm0, -36768(%rdi)
	movups	%xmm0, -36784(%rdi)
	movups	%xmm0, -36800(%rdi)
	movups	%xmm0, -36816(%rdi)
	movups	%xmm0, -36832(%rdi)
	movups	%xmm0, -36848(%rdi)
	movups	%xmm0, -36864(%rdi)
	movups	%xmm0, -32656(%rdi)
	movups	%xmm0, -32672(%rdi)
	movups	%xmm0, -32688(%rdi)
	movups	%xmm0, -32704(%rdi)
	movups	%xmm0, -32720(%rdi)
	movups	%xmm0, -32736(%rdi)
	movups	%xmm0, -32752(%rdi)
	movups	%xmm0, -32768(%rdi)
	movups	%xmm0, -28560(%rdi)
	movups	%xmm0, -28576(%rdi)
	movups	%xmm0, -28592(%rdi)
	movups	%xmm0, -28608(%rdi)
	movups	%xmm0, -28624(%rdi)
	movups	%xmm0, -28640(%rdi)
	movups	%xmm0, -28656(%rdi)
	movups	%xmm0, -28672(%rdi)
	movups	%xmm0, -24464(%rdi)
	movups	%xmm0, -24480(%rdi)
	movups	%xmm0, -24496(%rdi)
	movups	%xmm0, -24512(%rdi)
	movups	%xmm0, -24528(%rdi)
	movups	%xmm0, -24544(%rdi)
	movups	%xmm0, -24560(%rdi)
	movups	%xmm0, -24576(%rdi)
	movups	%xmm0, -20368(%rdi)
	movups	%xmm0, -20384(%rdi)
	movups	%xmm0, -20400(%rdi)
	movups	%xmm0, -20416(%rdi)
	movups	%xmm0, -20432(%rdi)
	movups	%xmm0, -20448(%rdi)
	movups	%xmm0, -20464(%rdi)
	movups	%xmm0, -20480(%rdi)
	movups	%xmm0, -16272(%rdi)
	movups	%xmm0, -16288(%rdi)
	movups	%xmm0, -16304(%rdi)
	movups	%xmm0, -16320(%rdi)
	movups	%xmm0, -16336(%rdi)
	movups	%xmm0, -16352(%rdi)
	movups	%xmm0, -16368(%rdi)
	movups	%xmm0, -16384(%rdi)
	movups	%xmm0, -12176(%rdi)
	movups	%xmm0, -12192(%rdi)
	movups	%xmm0, -12208(%rdi)
	movups	%xmm0, -12224(%rdi)
	movups	%xmm0, -12240(%rdi)
	movups	%xmm0, -12256(%rdi)
	movups	%xmm0, -12272(%rdi)
	movups	%xmm0, -12288(%rdi)
	movups	%xmm0, -8080(%rdi)
	movups	%xmm0, -8096(%rdi)
	movups	%xmm0, -8112(%rdi)
	movups	%xmm0, -8128(%rdi)
	movups	%xmm0, -8144(%rdi)
	movups	%xmm0, -8160(%rdi)
	movups	%xmm0, -8176(%rdi)
	movups	%xmm0, -8192(%rdi)
	movups	%xmm0, -3984(%rdi)
	movups	%xmm0, -4000(%rdi)
	movups	%xmm0, -4016(%rdi)
	movups	%xmm0, -4032(%rdi)
	movups	%xmm0, -4048(%rdi)
	movups	%xmm0, -4064(%rdi)
	movups	%xmm0, -4080(%rdi)
	movups	%xmm0, -4096(%rdi)
	movups	%xmm0, 112(%rdi)
	movups	%xmm0, 96(%rdi)
	movups	%xmm0, 80(%rdi)
	movups	%xmm0, 64(%rdi)
	movups	%xmm0, 48(%rdi)
	movups	%xmm0, 32(%rdi)
	movups	%xmm0, 16(%rdi)
	movups	%xmm0, (%rdi)
	subq	$-128, %rdi
	decq	%rsi
	jne	.LBB1_13
# BB#9:                                 # %polly.loop_exit12
                                        #   in Loop: Header=BB1_12 Depth=1
	incq	%r8
	addq	$131072, %rdx           # imm = 0x20000
	cmpq	$32, %r8
	jne	.LBB1_12
# BB#10:                                # %polly.loop_preheader36.preheader
	addq	$4096, %r14             # imm = 0x1000
	movq	%r14, -104(%rbp)        # 8-byte Spill
	addq	$4, %r15
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_16:                               # %polly.loop_preheader36
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_17 Depth 2
                                        #       Child Loop BB1_20 Depth 3
                                        #         Child Loop BB1_21 Depth 4
                                        #           Child Loop BB1_24 Depth 5
                                        #             Child Loop BB1_22 Depth 6
	movq	%rax, -96(%rbp)         # 8-byte Spill
	movq	%r15, -88(%rbp)         # 8-byte Spill
	shlq	$5, %rax
	movq	%rax, -48(%rbp)         # 8-byte Spill
	movq	%r14, %rax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_17:                               # %polly.loop_preheader42
                                        #   Parent Loop BB1_16 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_20 Depth 3
                                        #         Child Loop BB1_21 Depth 4
                                        #           Child Loop BB1_24 Depth 5
                                        #             Child Loop BB1_22 Depth 6
	movq	%rcx, -80(%rbp)         # 8-byte Spill
	movq	%rax, -72(%rbp)         # 8-byte Spill
	movq	%rcx, %rdx
	shlq	$5, %rdx
	movq	%r15, %r14
	movq	%rax, %rcx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_20:                               # %polly.loop_preheader48
                                        #   Parent Loop BB1_16 Depth=1
                                        #     Parent Loop BB1_17 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_21 Depth 4
                                        #           Child Loop BB1_24 Depth 5
                                        #             Child Loop BB1_22 Depth 6
	movq	%rax, -64(%rbp)         # 8-byte Spill
	movq	%r14, -56(%rbp)         # 8-byte Spill
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_21:                               # %polly.loop_preheader54
                                        #   Parent Loop BB1_16 Depth=1
                                        #     Parent Loop BB1_17 Depth=2
                                        #       Parent Loop BB1_20 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB1_24 Depth 5
                                        #             Child Loop BB1_22 Depth 6
	movq	-48(%rbp), %rsi         # 8-byte Reload
	leaq	(%rax,%rsi), %rsi
	shlq	$12, %rsi
	movq	%rcx, %r15
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB1_24:                               # %polly.loop_preheader60
                                        #   Parent Loop BB1_16 Depth=1
                                        #     Parent Loop BB1_17 Depth=2
                                        #       Parent Loop BB1_20 Depth=3
                                        #         Parent Loop BB1_21 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB1_22 Depth 6
	leaq	(%r9,%rdx), %rdi
	leaq	(%rsi,%rdi,4), %r10
	movl	(%rbx,%r10), %r11d
	movq	%r14, %rdi
	movq	%r15, %r8
	movl	$32, %r12d
	.p2align	4, 0x90
.LBB1_22:                               # %polly.loop_header59
                                        #   Parent Loop BB1_16 Depth=1
                                        #     Parent Loop BB1_17 Depth=2
                                        #       Parent Loop BB1_20 Depth=3
                                        #         Parent Loop BB1_21 Depth=4
                                        #           Parent Loop BB1_24 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movl	-4096(%r8), %r13d
	imull	-4(%rdi), %r13d
	addl	%r11d, %r13d
	movl	(%r8), %r11d
	imull	(%rdi), %r11d
	addl	%r13d, %r11d
	addq	$8192, %r8              # imm = 0x2000
	addq	$8, %rdi
	addq	$-2, %r12
	jne	.LBB1_22
# BB#23:                                # %polly.loop_exit61
                                        #   in Loop: Header=BB1_24 Depth=5
	movl	%r11d, (%rbx,%r10)
	incq	%r9
	addq	$4, %r15
	cmpq	$32, %r9
	jne	.LBB1_24
# BB#18:                                # %polly.loop_exit55
                                        #   in Loop: Header=BB1_21 Depth=4
	incq	%rax
	addq	$4096, %r14             # imm = 0x1000
	cmpq	$32, %rax
	jne	.LBB1_21
# BB#19:                                # %polly.loop_exit49
                                        #   in Loop: Header=BB1_20 Depth=3
	movq	-64(%rbp), %rax         # 8-byte Reload
	incq	%rax
	addq	$131072, %rcx           # imm = 0x20000
	movq	-56(%rbp), %r14         # 8-byte Reload
	subq	$-128, %r14
	cmpq	$32, %rax
	jne	.LBB1_20
# BB#14:                                # %polly.loop_exit43
                                        #   in Loop: Header=BB1_17 Depth=2
	movq	-80(%rbp), %rcx         # 8-byte Reload
	incq	%rcx
	movq	-72(%rbp), %rax         # 8-byte Reload
	subq	$-128, %rax
	cmpq	$32, %rcx
	movq	-88(%rbp), %r15         # 8-byte Reload
	jne	.LBB1_17
# BB#15:                                # %polly.loop_exit37
                                        #   in Loop: Header=BB1_16 Depth=1
	movq	-96(%rbp), %rax         # 8-byte Reload
	incq	%rax
	addq	$131072, %r15           # imm = 0x20000
	cmpq	$32, %rax
	movq	-104(%rbp), %r14        # 8-byte Reload
	jne	.LBB1_16
	jmp	.LBB1_8
.LBB1_2:                                # %for.cond2.preheader.preheader
	addq	$4096, %r14             # imm = 0x1000
	addq	$4, %r15
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB1_3:                                # %for.cond2.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_4 Depth 2
                                        #       Child Loop BB1_5 Depth 3
	movq	%r8, %r9
	shlq	$10, %r9
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB1_4:                                # %for.body4
                                        #   Parent Loop BB1_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_5 Depth 3
	leaq	(%r10,%r9), %r11
	movl	$0, (%rbx,%r11,4)
	xorl	%edi, %edi
	movq	%r15, %rax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_5:                                # %for.body7
                                        #   Parent Loop BB1_3 Depth=1
                                        #     Parent Loop BB1_4 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	leaq	(%r14,%rdi), %rdx
	movl	-4096(%rdx,%r10,4), %esi
	imull	-4(%rax), %esi
	addl	%ecx, %esi
	movl	%esi, (%rbx,%r11,4)
	movl	(%rdx,%r10,4), %ecx
	imull	(%rax), %ecx
	addl	%esi, %ecx
	movl	%ecx, (%rbx,%r11,4)
	addq	$8192, %rdi             # imm = 0x2000
	addq	$8, %rax
	cmpq	$4194304, %rdi          # imm = 0x400000
	jne	.LBB1_5
# BB#6:                                 # %for.inc26
                                        #   in Loop: Header=BB1_4 Depth=2
	incq	%r10
	cmpq	$1024, %r10             # imm = 0x400
	jne	.LBB1_4
# BB#7:                                 # %for.inc29
                                        #   in Loop: Header=BB1_3 Depth=1
	incq	%r8
	addq	$4096, %r15             # imm = 0x1000
	cmpq	$1024, %r8              # imm = 0x400
	jne	.LBB1_3
.LBB1_8:                                # %for.end31
	movl	$16, %edi
	callq	malloc
	movq	%rbx, (%rax)
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end1:
	.size	matrix_multiply, .Lfunc_end1-matrix_multiply
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp13:
	.cfi_def_cfa_offset 16
.Ltmp14:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp15:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
.Ltmp16:
	.cfi_offset %rbx, -40
.Ltmp17:
	.cfi_offset %r14, -32
.Ltmp18:
	.cfi_offset %r15, -24
	movl	$4194304, %edi          # imm = 0x400000
	callq	malloc
	movq	%rax, %r15
	movq	%r15, %r8
	addq	$12, %r8
	xorl	%r9d, %r9d
	movabsq	$4294967297, %rbx       # imm = 0x100000001
	.p2align	4, 0x90
.LBB2_3:                                # %polly.loop_preheader2.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_4 Depth 2
                                        #       Child Loop BB2_7 Depth 3
                                        #         Child Loop BB2_5 Depth 4
	movq	%r8, %r10
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB2_4:                                # %polly.loop_preheader8.i
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_7 Depth 3
                                        #         Child Loop BB2_5 Depth 4
	movq	%r10, %rcx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB2_7:                                # %polly.loop_preheader14.i
                                        #   Parent Loop BB2_3 Depth=1
                                        #     Parent Loop BB2_4 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB2_5 Depth 4
	movq	%rcx, %rdi
	movl	$32, %edx
	.p2align	4, 0x90
.LBB2_5:                                # %polly.stmt.for.body3.i
                                        #   Parent Loop BB2_3 Depth=1
                                        #     Parent Loop BB2_4 Depth=2
                                        #       Parent Loop BB2_7 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	%rbx, -12(%rdi)
	movq	%rbx, -4(%rdi)
	addq	$16, %rdi
	addq	$-4, %rdx
	jne	.LBB2_5
# BB#6:                                 # %polly.loop_exit15.i
                                        #   in Loop: Header=BB2_7 Depth=3
	incq	%rax
	addq	$4096, %rcx             # imm = 0x1000
	cmpq	$32, %rax
	jne	.LBB2_7
# BB#1:                                 # %polly.loop_exit9.i
                                        #   in Loop: Header=BB2_4 Depth=2
	incq	%rsi
	subq	$-128, %r10
	cmpq	$32, %rsi
	jne	.LBB2_4
# BB#2:                                 # %polly.loop_exit3.i
                                        #   in Loop: Header=BB2_3 Depth=1
	incq	%r9
	addq	$131072, %r8            # imm = 0x20000
	cmpq	$32, %r9
	jne	.LBB2_3
# BB#11:                                # %init.exit
	movl	$16, %edi
	callq	malloc
	movq	%rax, %r14
	movq	%r15, (%r14)
	movl	$4194304, %edi          # imm = 0x400000
	callq	malloc
	movq	%rax, %r15
	movq	%r15, %r8
	addq	$12, %r8
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB2_12:                               # %polly.loop_preheader2.i10
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_13 Depth 2
                                        #       Child Loop BB2_16 Depth 3
                                        #         Child Loop BB2_14 Depth 4
	movq	%r8, %r10
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB2_13:                               # %polly.loop_preheader8.i15
                                        #   Parent Loop BB2_12 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_16 Depth 3
                                        #         Child Loop BB2_14 Depth 4
	movq	%r10, %rcx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB2_16:                               # %polly.loop_preheader14.i23
                                        #   Parent Loop BB2_12 Depth=1
                                        #     Parent Loop BB2_13 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB2_14 Depth 4
	movq	%rcx, %rdi
	movl	$32, %edx
	.p2align	4, 0x90
.LBB2_14:                               # %polly.stmt.for.body3.i21
                                        #   Parent Loop BB2_12 Depth=1
                                        #     Parent Loop BB2_13 Depth=2
                                        #       Parent Loop BB2_16 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	%rbx, -12(%rdi)
	movq	%rbx, -4(%rdi)
	addq	$16, %rdi
	addq	$-4, %rdx
	jne	.LBB2_14
# BB#15:                                # %polly.loop_exit15.i13
                                        #   in Loop: Header=BB2_16 Depth=3
	incq	%rax
	addq	$4096, %rcx             # imm = 0x1000
	cmpq	$32, %rax
	jne	.LBB2_16
# BB#8:                                 # %polly.loop_exit9.i8
                                        #   in Loop: Header=BB2_13 Depth=2
	incq	%rsi
	subq	$-128, %r10
	cmpq	$32, %rsi
	jne	.LBB2_13
# BB#9:                                 # %polly.loop_exit3.i5
                                        #   in Loop: Header=BB2_12 Depth=1
	incq	%r9
	addq	$131072, %r8            # imm = 0x20000
	cmpq	$32, %r9
	jne	.LBB2_12
# BB#10:                                # %init.exit24
	movl	$16, %edi
	callq	malloc
	movq	%r15, (%rax)
	movq	%r14, %rdi
	movq	%rax, %rsi
	callq	matrix_multiply
	movq	(%rax), %rax
	movl	4194300(%rax), %r9d
	movl	$.L.str, %edi
	movl	$1024, %esi             # imm = 0x400
	movl	$1024, %edx             # imm = 0x400
	movl	$1023, %ecx             # imm = 0x3FF
	movl	$1023, %r8d             # imm = 0x3FF
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Pass %d X %d matrix test case (C[%d][%d]=%d)\n"
	.size	.L.str, 46


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git c43284c4913e075fc10ac6dea2961788a660f09d) (http://llvm.org/git/llvm.git 7f53bedefce9ad990a1906fed303e104ff621783)"
	.section	".note.GNU-stack","",@progbits
