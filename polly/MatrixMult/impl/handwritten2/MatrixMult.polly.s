	.text
	.file	"MatrixMult.polly.ll"
	.globl	init_array
	.p2align	4, 0x90
	.type	init_array,@function
init_array:                             # @init_array
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
	pushq	%rbx
	pushq	%rax
.Ltmp3:
	.cfi_offset %rbx, -24
	movl	%edi, %ebx
	movl	$4194304, %edi          # imm = 0x400000
	callq	malloc
	movq	%rax, %r8
	addq	$12, %r8
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB0_1:                                # %polly.loop_preheader2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
                                        #       Child Loop BB0_7 Depth 3
                                        #         Child Loop BB0_8 Depth 4
	movq	%r8, %r10
	xorl	%r11d, %r11d
	.p2align	4, 0x90
.LBB0_6:                                # %polly.loop_preheader8
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_7 Depth 3
                                        #         Child Loop BB0_8 Depth 4
	movq	%r10, %rsi
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_7:                                # %polly.loop_preheader14
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_8 Depth 4
	movq	%rsi, %rcx
	movl	$32, %edi
	.p2align	4, 0x90
.LBB0_8:                                # %polly.stmt.for.body3
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        #       Parent Loop BB0_7 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	%ebx, -12(%rcx)
	movl	%ebx, -8(%rcx)
	movl	%ebx, -4(%rcx)
	movl	%ebx, (%rcx)
	addq	$16, %rcx
	addq	$-4, %rdi
	jne	.LBB0_8
# BB#4:                                 # %polly.loop_exit15
                                        #   in Loop: Header=BB0_7 Depth=3
	incq	%rdx
	addq	$4096, %rsi             # imm = 0x1000
	cmpq	$32, %rdx
	jne	.LBB0_7
# BB#5:                                 # %polly.loop_exit9
                                        #   in Loop: Header=BB0_6 Depth=2
	incq	%r11
	subq	$-128, %r10
	cmpq	$32, %r11
	jne	.LBB0_6
# BB#2:                                 # %polly.loop_exit3
                                        #   in Loop: Header=BB0_1 Depth=1
	incq	%r9
	addq	$131072, %r8            # imm = 0x20000
	cmpq	$32, %r9
	jne	.LBB0_1
# BB#3:                                 # %polly.exiting
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end0:
	.size	init_array, .Lfunc_end0-init_array
	.cfi_endproc

	.globl	matrix_multiply
	.p2align	4, 0x90
	.type	matrix_multiply,@function
matrix_multiply:                        # @matrix_multiply
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp4:
	.cfi_def_cfa_offset 16
.Ltmp5:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp6:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$72, %rsp
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
	movq	%rsi, -104(%rbp)        # 8-byte Spill
	movq	%rdi, -88(%rbp)         # 8-byte Spill
	movl	$4194304, %edi          # imm = 0x400000
	callq	malloc
	movq	%rax, %rcx
	addq	$126976, %rcx           # imm = 0x1F000
	xorl	%edx, %edx
	xorps	%xmm0, %xmm0
	.p2align	4, 0x90
.LBB1_1:                                # %polly.loop_preheader2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
	movq	%rcx, %rsi
	movl	$32, %edi
	.p2align	4, 0x90
.LBB1_2:                                # %polly.loop_preheader14
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movups	%xmm0, -126864(%rsi)
	movups	%xmm0, -126880(%rsi)
	movups	%xmm0, -126896(%rsi)
	movups	%xmm0, -126912(%rsi)
	movups	%xmm0, -126928(%rsi)
	movups	%xmm0, -126944(%rsi)
	movups	%xmm0, -126960(%rsi)
	movups	%xmm0, -126976(%rsi)
	movups	%xmm0, -122768(%rsi)
	movups	%xmm0, -122784(%rsi)
	movups	%xmm0, -122800(%rsi)
	movups	%xmm0, -122816(%rsi)
	movups	%xmm0, -122832(%rsi)
	movups	%xmm0, -122848(%rsi)
	movups	%xmm0, -122864(%rsi)
	movups	%xmm0, -122880(%rsi)
	movups	%xmm0, -118672(%rsi)
	movups	%xmm0, -118688(%rsi)
	movups	%xmm0, -118704(%rsi)
	movups	%xmm0, -118720(%rsi)
	movups	%xmm0, -118736(%rsi)
	movups	%xmm0, -118752(%rsi)
	movups	%xmm0, -118768(%rsi)
	movups	%xmm0, -118784(%rsi)
	movups	%xmm0, -114576(%rsi)
	movups	%xmm0, -114592(%rsi)
	movups	%xmm0, -114608(%rsi)
	movups	%xmm0, -114624(%rsi)
	movups	%xmm0, -114640(%rsi)
	movups	%xmm0, -114656(%rsi)
	movups	%xmm0, -114672(%rsi)
	movups	%xmm0, -114688(%rsi)
	movups	%xmm0, -110480(%rsi)
	movups	%xmm0, -110496(%rsi)
	movups	%xmm0, -110512(%rsi)
	movups	%xmm0, -110528(%rsi)
	movups	%xmm0, -110544(%rsi)
	movups	%xmm0, -110560(%rsi)
	movups	%xmm0, -110576(%rsi)
	movups	%xmm0, -110592(%rsi)
	movups	%xmm0, -106384(%rsi)
	movups	%xmm0, -106400(%rsi)
	movups	%xmm0, -106416(%rsi)
	movups	%xmm0, -106432(%rsi)
	movups	%xmm0, -106448(%rsi)
	movups	%xmm0, -106464(%rsi)
	movups	%xmm0, -106480(%rsi)
	movups	%xmm0, -106496(%rsi)
	movups	%xmm0, -102288(%rsi)
	movups	%xmm0, -102304(%rsi)
	movups	%xmm0, -102320(%rsi)
	movups	%xmm0, -102336(%rsi)
	movups	%xmm0, -102352(%rsi)
	movups	%xmm0, -102368(%rsi)
	movups	%xmm0, -102384(%rsi)
	movups	%xmm0, -102400(%rsi)
	movups	%xmm0, -98192(%rsi)
	movups	%xmm0, -98208(%rsi)
	movups	%xmm0, -98224(%rsi)
	movups	%xmm0, -98240(%rsi)
	movups	%xmm0, -98256(%rsi)
	movups	%xmm0, -98272(%rsi)
	movups	%xmm0, -98288(%rsi)
	movups	%xmm0, -98304(%rsi)
	movups	%xmm0, -94096(%rsi)
	movups	%xmm0, -94112(%rsi)
	movups	%xmm0, -94128(%rsi)
	movups	%xmm0, -94144(%rsi)
	movups	%xmm0, -94160(%rsi)
	movups	%xmm0, -94176(%rsi)
	movups	%xmm0, -94192(%rsi)
	movups	%xmm0, -94208(%rsi)
	movups	%xmm0, -90000(%rsi)
	movups	%xmm0, -90016(%rsi)
	movups	%xmm0, -90032(%rsi)
	movups	%xmm0, -90048(%rsi)
	movups	%xmm0, -90064(%rsi)
	movups	%xmm0, -90080(%rsi)
	movups	%xmm0, -90096(%rsi)
	movups	%xmm0, -90112(%rsi)
	movups	%xmm0, -85904(%rsi)
	movups	%xmm0, -85920(%rsi)
	movups	%xmm0, -85936(%rsi)
	movups	%xmm0, -85952(%rsi)
	movups	%xmm0, -85968(%rsi)
	movups	%xmm0, -85984(%rsi)
	movups	%xmm0, -86000(%rsi)
	movups	%xmm0, -86016(%rsi)
	movups	%xmm0, -81808(%rsi)
	movups	%xmm0, -81824(%rsi)
	movups	%xmm0, -81840(%rsi)
	movups	%xmm0, -81856(%rsi)
	movups	%xmm0, -81872(%rsi)
	movups	%xmm0, -81888(%rsi)
	movups	%xmm0, -81904(%rsi)
	movups	%xmm0, -81920(%rsi)
	movups	%xmm0, -77712(%rsi)
	movups	%xmm0, -77728(%rsi)
	movups	%xmm0, -77744(%rsi)
	movups	%xmm0, -77760(%rsi)
	movups	%xmm0, -77776(%rsi)
	movups	%xmm0, -77792(%rsi)
	movups	%xmm0, -77808(%rsi)
	movups	%xmm0, -77824(%rsi)
	movups	%xmm0, -73616(%rsi)
	movups	%xmm0, -73632(%rsi)
	movups	%xmm0, -73648(%rsi)
	movups	%xmm0, -73664(%rsi)
	movups	%xmm0, -73680(%rsi)
	movups	%xmm0, -73696(%rsi)
	movups	%xmm0, -73712(%rsi)
	movups	%xmm0, -73728(%rsi)
	movups	%xmm0, -69520(%rsi)
	movups	%xmm0, -69536(%rsi)
	movups	%xmm0, -69552(%rsi)
	movups	%xmm0, -69568(%rsi)
	movups	%xmm0, -69584(%rsi)
	movups	%xmm0, -69600(%rsi)
	movups	%xmm0, -69616(%rsi)
	movups	%xmm0, -69632(%rsi)
	movups	%xmm0, -65424(%rsi)
	movups	%xmm0, -65440(%rsi)
	movups	%xmm0, -65456(%rsi)
	movups	%xmm0, -65472(%rsi)
	movups	%xmm0, -65488(%rsi)
	movups	%xmm0, -65504(%rsi)
	movups	%xmm0, -65520(%rsi)
	movups	%xmm0, -65536(%rsi)
	movups	%xmm0, -61328(%rsi)
	movups	%xmm0, -61344(%rsi)
	movups	%xmm0, -61360(%rsi)
	movups	%xmm0, -61376(%rsi)
	movups	%xmm0, -61392(%rsi)
	movups	%xmm0, -61408(%rsi)
	movups	%xmm0, -61424(%rsi)
	movups	%xmm0, -61440(%rsi)
	movups	%xmm0, -57232(%rsi)
	movups	%xmm0, -57248(%rsi)
	movups	%xmm0, -57264(%rsi)
	movups	%xmm0, -57280(%rsi)
	movups	%xmm0, -57296(%rsi)
	movups	%xmm0, -57312(%rsi)
	movups	%xmm0, -57328(%rsi)
	movups	%xmm0, -57344(%rsi)
	movups	%xmm0, -53136(%rsi)
	movups	%xmm0, -53152(%rsi)
	movups	%xmm0, -53168(%rsi)
	movups	%xmm0, -53184(%rsi)
	movups	%xmm0, -53200(%rsi)
	movups	%xmm0, -53216(%rsi)
	movups	%xmm0, -53232(%rsi)
	movups	%xmm0, -53248(%rsi)
	movups	%xmm0, -49040(%rsi)
	movups	%xmm0, -49056(%rsi)
	movups	%xmm0, -49072(%rsi)
	movups	%xmm0, -49088(%rsi)
	movups	%xmm0, -49104(%rsi)
	movups	%xmm0, -49120(%rsi)
	movups	%xmm0, -49136(%rsi)
	movups	%xmm0, -49152(%rsi)
	movups	%xmm0, -44944(%rsi)
	movups	%xmm0, -44960(%rsi)
	movups	%xmm0, -44976(%rsi)
	movups	%xmm0, -44992(%rsi)
	movups	%xmm0, -45008(%rsi)
	movups	%xmm0, -45024(%rsi)
	movups	%xmm0, -45040(%rsi)
	movups	%xmm0, -45056(%rsi)
	movups	%xmm0, -40848(%rsi)
	movups	%xmm0, -40864(%rsi)
	movups	%xmm0, -40880(%rsi)
	movups	%xmm0, -40896(%rsi)
	movups	%xmm0, -40912(%rsi)
	movups	%xmm0, -40928(%rsi)
	movups	%xmm0, -40944(%rsi)
	movups	%xmm0, -40960(%rsi)
	movups	%xmm0, -36752(%rsi)
	movups	%xmm0, -36768(%rsi)
	movups	%xmm0, -36784(%rsi)
	movups	%xmm0, -36800(%rsi)
	movups	%xmm0, -36816(%rsi)
	movups	%xmm0, -36832(%rsi)
	movups	%xmm0, -36848(%rsi)
	movups	%xmm0, -36864(%rsi)
	movups	%xmm0, -32656(%rsi)
	movups	%xmm0, -32672(%rsi)
	movups	%xmm0, -32688(%rsi)
	movups	%xmm0, -32704(%rsi)
	movups	%xmm0, -32720(%rsi)
	movups	%xmm0, -32736(%rsi)
	movups	%xmm0, -32752(%rsi)
	movups	%xmm0, -32768(%rsi)
	movups	%xmm0, -28560(%rsi)
	movups	%xmm0, -28576(%rsi)
	movups	%xmm0, -28592(%rsi)
	movups	%xmm0, -28608(%rsi)
	movups	%xmm0, -28624(%rsi)
	movups	%xmm0, -28640(%rsi)
	movups	%xmm0, -28656(%rsi)
	movups	%xmm0, -28672(%rsi)
	movups	%xmm0, -24464(%rsi)
	movups	%xmm0, -24480(%rsi)
	movups	%xmm0, -24496(%rsi)
	movups	%xmm0, -24512(%rsi)
	movups	%xmm0, -24528(%rsi)
	movups	%xmm0, -24544(%rsi)
	movups	%xmm0, -24560(%rsi)
	movups	%xmm0, -24576(%rsi)
	movups	%xmm0, -20368(%rsi)
	movups	%xmm0, -20384(%rsi)
	movups	%xmm0, -20400(%rsi)
	movups	%xmm0, -20416(%rsi)
	movups	%xmm0, -20432(%rsi)
	movups	%xmm0, -20448(%rsi)
	movups	%xmm0, -20464(%rsi)
	movups	%xmm0, -20480(%rsi)
	movups	%xmm0, -16272(%rsi)
	movups	%xmm0, -16288(%rsi)
	movups	%xmm0, -16304(%rsi)
	movups	%xmm0, -16320(%rsi)
	movups	%xmm0, -16336(%rsi)
	movups	%xmm0, -16352(%rsi)
	movups	%xmm0, -16368(%rsi)
	movups	%xmm0, -16384(%rsi)
	movups	%xmm0, -12176(%rsi)
	movups	%xmm0, -12192(%rsi)
	movups	%xmm0, -12208(%rsi)
	movups	%xmm0, -12224(%rsi)
	movups	%xmm0, -12240(%rsi)
	movups	%xmm0, -12256(%rsi)
	movups	%xmm0, -12272(%rsi)
	movups	%xmm0, -12288(%rsi)
	movups	%xmm0, -8080(%rsi)
	movups	%xmm0, -8096(%rsi)
	movups	%xmm0, -8112(%rsi)
	movups	%xmm0, -8128(%rsi)
	movups	%xmm0, -8144(%rsi)
	movups	%xmm0, -8160(%rsi)
	movups	%xmm0, -8176(%rsi)
	movups	%xmm0, -8192(%rsi)
	movups	%xmm0, -3984(%rsi)
	movups	%xmm0, -4000(%rsi)
	movups	%xmm0, -4016(%rsi)
	movups	%xmm0, -4032(%rsi)
	movups	%xmm0, -4048(%rsi)
	movups	%xmm0, -4064(%rsi)
	movups	%xmm0, -4080(%rsi)
	movups	%xmm0, -4096(%rsi)
	movups	%xmm0, 112(%rsi)
	movups	%xmm0, 96(%rsi)
	movups	%xmm0, 80(%rsi)
	movups	%xmm0, 64(%rsi)
	movups	%xmm0, 48(%rsi)
	movups	%xmm0, 32(%rsi)
	movups	%xmm0, 16(%rsi)
	movups	%xmm0, (%rsi)
	subq	$-128, %rsi
	decq	%rdi
	jne	.LBB1_2
# BB#3:                                 # %polly.loop_exit3
                                        #   in Loop: Header=BB1_1 Depth=1
	incq	%rdx
	addq	$131072, %rcx           # imm = 0x20000
	cmpq	$32, %rdx
	jne	.LBB1_1
# BB#4:                                 # %polly.loop_preheader27.preheader
	addq	$4096, -104(%rbp)       # 8-byte Folded Spill
                                        # imm = 0x1000
	addq	$4, -88(%rbp)           # 8-byte Folded Spill
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_5:                                # %polly.loop_preheader27
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_10 Depth 2
                                        #       Child Loop BB1_11 Depth 3
                                        #         Child Loop BB1_14 Depth 4
                                        #           Child Loop BB1_15 Depth 5
                                        #             Child Loop BB1_16 Depth 6
	movq	%rcx, -96(%rbp)         # 8-byte Spill
	shlq	$5, %rcx
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	movq	-104(%rbp), %rcx        # 8-byte Reload
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB1_10:                               # %polly.loop_preheader33
                                        #   Parent Loop BB1_5 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_11 Depth 3
                                        #         Child Loop BB1_14 Depth 4
                                        #           Child Loop BB1_15 Depth 5
                                        #             Child Loop BB1_16 Depth 6
	movq	%rdx, -80(%rbp)         # 8-byte Spill
	movq	%rcx, -72(%rbp)         # 8-byte Spill
	movq	%rdx, %rdi
	shlq	$5, %rdi
	movq	-88(%rbp), %r10         # 8-byte Reload
	movq	%rcx, %rsi
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_11:                               # %polly.loop_preheader39
                                        #   Parent Loop BB1_5 Depth=1
                                        #     Parent Loop BB1_10 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_14 Depth 4
                                        #           Child Loop BB1_15 Depth 5
                                        #             Child Loop BB1_16 Depth 6
	movq	%rcx, -64(%rbp)         # 8-byte Spill
	movq	%r10, -56(%rbp)         # 8-byte Spill
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_14:                               # %polly.loop_preheader45
                                        #   Parent Loop BB1_5 Depth=1
                                        #     Parent Loop BB1_10 Depth=2
                                        #       Parent Loop BB1_11 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB1_15 Depth 5
                                        #             Child Loop BB1_16 Depth 6
	movq	-48(%rbp), %rdx         # 8-byte Reload
	leaq	(%rcx,%rdx), %rdx
	shlq	$12, %rdx
	movq	%rsi, %r11
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB1_15:                               # %polly.loop_preheader51
                                        #   Parent Loop BB1_5 Depth=1
                                        #     Parent Loop BB1_10 Depth=2
                                        #       Parent Loop BB1_11 Depth=3
                                        #         Parent Loop BB1_14 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB1_16 Depth 6
	leaq	(%r8,%rdi), %rbx
	leaq	(%rdx,%rbx,4), %r15
	movl	(%rax,%r15), %r9d
	movq	%r10, %rbx
	movq	%r11, %r14
	movl	$32, %r12d
	.p2align	4, 0x90
.LBB1_16:                               # %polly.loop_header50
                                        #   Parent Loop BB1_5 Depth=1
                                        #     Parent Loop BB1_10 Depth=2
                                        #       Parent Loop BB1_11 Depth=3
                                        #         Parent Loop BB1_14 Depth=4
                                        #           Parent Loop BB1_15 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movl	-4096(%r14), %r13d
	imull	-4(%rbx), %r13d
	addl	%r9d, %r13d
	movl	(%r14), %r9d
	imull	(%rbx), %r9d
	addl	%r13d, %r9d
	addq	$8192, %r14             # imm = 0x2000
	addq	$8, %rbx
	addq	$-2, %r12
	jne	.LBB1_16
# BB#12:                                # %polly.loop_exit52
                                        #   in Loop: Header=BB1_15 Depth=5
	movl	%r9d, (%rax,%r15)
	incq	%r8
	addq	$4, %r11
	cmpq	$32, %r8
	jne	.LBB1_15
# BB#13:                                # %polly.loop_exit46
                                        #   in Loop: Header=BB1_14 Depth=4
	incq	%rcx
	addq	$4096, %r10             # imm = 0x1000
	cmpq	$32, %rcx
	jne	.LBB1_14
# BB#8:                                 # %polly.loop_exit40
                                        #   in Loop: Header=BB1_11 Depth=3
	movq	-64(%rbp), %rcx         # 8-byte Reload
	incq	%rcx
	addq	$131072, %rsi           # imm = 0x20000
	movq	-56(%rbp), %r10         # 8-byte Reload
	subq	$-128, %r10
	cmpq	$32, %rcx
	jne	.LBB1_11
# BB#9:                                 # %polly.loop_exit34
                                        #   in Loop: Header=BB1_10 Depth=2
	movq	-80(%rbp), %rdx         # 8-byte Reload
	incq	%rdx
	movq	-72(%rbp), %rcx         # 8-byte Reload
	subq	$-128, %rcx
	cmpq	$32, %rdx
	jne	.LBB1_10
# BB#6:                                 # %polly.loop_exit28
                                        #   in Loop: Header=BB1_5 Depth=1
	movq	-96(%rbp), %rcx         # 8-byte Reload
	incq	%rcx
	addq	$131072, -88(%rbp)      # 8-byte Folded Spill
                                        # imm = 0x20000
	cmpq	$32, %rcx
	jne	.LBB1_5
# BB#7:                                 # %polly.exiting
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
.Ltmp12:
	.cfi_def_cfa_offset 16
.Ltmp13:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp14:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
.Ltmp15:
	.cfi_offset %rbx, -32
.Ltmp16:
	.cfi_offset %r14, -24
	movl	$4194304, %edi          # imm = 0x400000
	callq	malloc
	movq	%rax, %r14
	movq	%r14, %r8
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
# BB#11:                                # %init_array.exit
	movl	$4194304, %edi          # imm = 0x400000
	callq	malloc
	movq	%rax, %r8
	addq	$12, %r8
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB2_12:                               # %polly.loop_preheader2.i9
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_13 Depth 2
                                        #       Child Loop BB2_16 Depth 3
                                        #         Child Loop BB2_14 Depth 4
	movq	%r8, %r10
	xorl	%r11d, %r11d
	.p2align	4, 0x90
.LBB2_13:                               # %polly.loop_preheader8.i14
                                        #   Parent Loop BB2_12 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_16 Depth 3
                                        #         Child Loop BB2_14 Depth 4
	movq	%r10, %rsi
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB2_16:                               # %polly.loop_preheader14.i22
                                        #   Parent Loop BB2_12 Depth=1
                                        #     Parent Loop BB2_13 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB2_14 Depth 4
	movq	%rsi, %rcx
	movl	$32, %edi
	.p2align	4, 0x90
.LBB2_14:                               # %polly.stmt.for.body3.i20
                                        #   Parent Loop BB2_12 Depth=1
                                        #     Parent Loop BB2_13 Depth=2
                                        #       Parent Loop BB2_16 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	%rbx, -12(%rcx)
	movq	%rbx, -4(%rcx)
	addq	$16, %rcx
	addq	$-4, %rdi
	jne	.LBB2_14
# BB#15:                                # %polly.loop_exit15.i12
                                        #   in Loop: Header=BB2_16 Depth=3
	incq	%rdx
	addq	$4096, %rsi             # imm = 0x1000
	cmpq	$32, %rdx
	jne	.LBB2_16
# BB#8:                                 # %polly.loop_exit9.i7
                                        #   in Loop: Header=BB2_13 Depth=2
	incq	%r11
	subq	$-128, %r10
	cmpq	$32, %r11
	jne	.LBB2_13
# BB#9:                                 # %polly.loop_exit3.i4
                                        #   in Loop: Header=BB2_12 Depth=1
	incq	%r9
	addq	$131072, %r8            # imm = 0x20000
	cmpq	$32, %r9
	jne	.LBB2_12
# BB#10:                                # %init_array.exit23
	movq	%r14, %rdi
	movq	%rax, %rsi
	callq	matrix_multiply
	movl	4194300(%rax), %r9d
	movl	$.L.str, %edi
	movl	$1024, %esi             # imm = 0x400
	movl	$1024, %edx             # imm = 0x400
	movl	$1023, %ecx             # imm = 0x3FF
	movl	$1023, %r8d             # imm = 0x3FF
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
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
