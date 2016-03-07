	.text
	.file	"MatrixMult.polly.ll"
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
.Ltmp13:
	.cfi_offset %rbx, -56
.Ltmp14:
	.cfi_offset %r12, -48
.Ltmp15:
	.cfi_offset %r13, -40
.Ltmp16:
	.cfi_offset %r14, -32
.Ltmp17:
	.cfi_offset %r15, -24
	xorl	%ecx, %ecx
	movl	$C+126976, %edx
	xorps	%xmm0, %xmm0
	movl	$A+8, %eax
	movq	%rax, -48(%rbp)         # 8-byte Spill
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB1_2:                                # %polly.loop_preheader2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_3 Depth 2
	movq	%rdx, %rdi
	movl	$16, %eax
	.p2align	4, 0x90
.LBB1_3:                                # %polly.loop_preheader14
                                        #   Parent Loop BB1_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movaps	%xmm0, -126736(%rdi)
	movaps	%xmm0, -126752(%rdi)
	movaps	%xmm0, -126768(%rdi)
	movaps	%xmm0, -126784(%rdi)
	movaps	%xmm0, -126800(%rdi)
	movaps	%xmm0, -126816(%rdi)
	movaps	%xmm0, -126832(%rdi)
	movaps	%xmm0, -126848(%rdi)
	movaps	%xmm0, -126864(%rdi)
	movaps	%xmm0, -126880(%rdi)
	movaps	%xmm0, -126896(%rdi)
	movaps	%xmm0, -126912(%rdi)
	movaps	%xmm0, -126928(%rdi)
	movaps	%xmm0, -126944(%rdi)
	movaps	%xmm0, -126960(%rdi)
	movaps	%xmm0, -126976(%rdi)
	movaps	%xmm0, -122640(%rdi)
	movaps	%xmm0, -122656(%rdi)
	movaps	%xmm0, -122672(%rdi)
	movaps	%xmm0, -122688(%rdi)
	movaps	%xmm0, -122704(%rdi)
	movaps	%xmm0, -122720(%rdi)
	movaps	%xmm0, -122736(%rdi)
	movaps	%xmm0, -122752(%rdi)
	movaps	%xmm0, -122768(%rdi)
	movaps	%xmm0, -122784(%rdi)
	movaps	%xmm0, -122800(%rdi)
	movaps	%xmm0, -122816(%rdi)
	movaps	%xmm0, -122832(%rdi)
	movaps	%xmm0, -122848(%rdi)
	movaps	%xmm0, -122864(%rdi)
	movaps	%xmm0, -122880(%rdi)
	movaps	%xmm0, -118544(%rdi)
	movaps	%xmm0, -118560(%rdi)
	movaps	%xmm0, -118576(%rdi)
	movaps	%xmm0, -118592(%rdi)
	movaps	%xmm0, -118608(%rdi)
	movaps	%xmm0, -118624(%rdi)
	movaps	%xmm0, -118640(%rdi)
	movaps	%xmm0, -118656(%rdi)
	movaps	%xmm0, -118672(%rdi)
	movaps	%xmm0, -118688(%rdi)
	movaps	%xmm0, -118704(%rdi)
	movaps	%xmm0, -118720(%rdi)
	movaps	%xmm0, -118736(%rdi)
	movaps	%xmm0, -118752(%rdi)
	movaps	%xmm0, -118768(%rdi)
	movaps	%xmm0, -118784(%rdi)
	movaps	%xmm0, -114448(%rdi)
	movaps	%xmm0, -114464(%rdi)
	movaps	%xmm0, -114480(%rdi)
	movaps	%xmm0, -114496(%rdi)
	movaps	%xmm0, -114512(%rdi)
	movaps	%xmm0, -114528(%rdi)
	movaps	%xmm0, -114544(%rdi)
	movaps	%xmm0, -114560(%rdi)
	movaps	%xmm0, -114576(%rdi)
	movaps	%xmm0, -114592(%rdi)
	movaps	%xmm0, -114608(%rdi)
	movaps	%xmm0, -114624(%rdi)
	movaps	%xmm0, -114640(%rdi)
	movaps	%xmm0, -114656(%rdi)
	movaps	%xmm0, -114672(%rdi)
	movaps	%xmm0, -114688(%rdi)
	movaps	%xmm0, -110352(%rdi)
	movaps	%xmm0, -110368(%rdi)
	movaps	%xmm0, -110384(%rdi)
	movaps	%xmm0, -110400(%rdi)
	movaps	%xmm0, -110416(%rdi)
	movaps	%xmm0, -110432(%rdi)
	movaps	%xmm0, -110448(%rdi)
	movaps	%xmm0, -110464(%rdi)
	movaps	%xmm0, -110480(%rdi)
	movaps	%xmm0, -110496(%rdi)
	movaps	%xmm0, -110512(%rdi)
	movaps	%xmm0, -110528(%rdi)
	movaps	%xmm0, -110544(%rdi)
	movaps	%xmm0, -110560(%rdi)
	movaps	%xmm0, -110576(%rdi)
	movaps	%xmm0, -110592(%rdi)
	movaps	%xmm0, -106256(%rdi)
	movaps	%xmm0, -106272(%rdi)
	movaps	%xmm0, -106288(%rdi)
	movaps	%xmm0, -106304(%rdi)
	movaps	%xmm0, -106320(%rdi)
	movaps	%xmm0, -106336(%rdi)
	movaps	%xmm0, -106352(%rdi)
	movaps	%xmm0, -106368(%rdi)
	movaps	%xmm0, -106384(%rdi)
	movaps	%xmm0, -106400(%rdi)
	movaps	%xmm0, -106416(%rdi)
	movaps	%xmm0, -106432(%rdi)
	movaps	%xmm0, -106448(%rdi)
	movaps	%xmm0, -106464(%rdi)
	movaps	%xmm0, -106480(%rdi)
	movaps	%xmm0, -106496(%rdi)
	movaps	%xmm0, -102160(%rdi)
	movaps	%xmm0, -102176(%rdi)
	movaps	%xmm0, -102192(%rdi)
	movaps	%xmm0, -102208(%rdi)
	movaps	%xmm0, -102224(%rdi)
	movaps	%xmm0, -102240(%rdi)
	movaps	%xmm0, -102256(%rdi)
	movaps	%xmm0, -102272(%rdi)
	movaps	%xmm0, -102288(%rdi)
	movaps	%xmm0, -102304(%rdi)
	movaps	%xmm0, -102320(%rdi)
	movaps	%xmm0, -102336(%rdi)
	movaps	%xmm0, -102352(%rdi)
	movaps	%xmm0, -102368(%rdi)
	movaps	%xmm0, -102384(%rdi)
	movaps	%xmm0, -102400(%rdi)
	movaps	%xmm0, -98064(%rdi)
	movaps	%xmm0, -98080(%rdi)
	movaps	%xmm0, -98096(%rdi)
	movaps	%xmm0, -98112(%rdi)
	movaps	%xmm0, -98128(%rdi)
	movaps	%xmm0, -98144(%rdi)
	movaps	%xmm0, -98160(%rdi)
	movaps	%xmm0, -98176(%rdi)
	movaps	%xmm0, -98192(%rdi)
	movaps	%xmm0, -98208(%rdi)
	movaps	%xmm0, -98224(%rdi)
	movaps	%xmm0, -98240(%rdi)
	movaps	%xmm0, -98256(%rdi)
	movaps	%xmm0, -98272(%rdi)
	movaps	%xmm0, -98288(%rdi)
	movaps	%xmm0, -98304(%rdi)
	movaps	%xmm0, -93968(%rdi)
	movaps	%xmm0, -93984(%rdi)
	movaps	%xmm0, -94000(%rdi)
	movaps	%xmm0, -94016(%rdi)
	movaps	%xmm0, -94032(%rdi)
	movaps	%xmm0, -94048(%rdi)
	movaps	%xmm0, -94064(%rdi)
	movaps	%xmm0, -94080(%rdi)
	movaps	%xmm0, -94096(%rdi)
	movaps	%xmm0, -94112(%rdi)
	movaps	%xmm0, -94128(%rdi)
	movaps	%xmm0, -94144(%rdi)
	movaps	%xmm0, -94160(%rdi)
	movaps	%xmm0, -94176(%rdi)
	movaps	%xmm0, -94192(%rdi)
	movaps	%xmm0, -94208(%rdi)
	movaps	%xmm0, -89872(%rdi)
	movaps	%xmm0, -89888(%rdi)
	movaps	%xmm0, -89904(%rdi)
	movaps	%xmm0, -89920(%rdi)
	movaps	%xmm0, -89936(%rdi)
	movaps	%xmm0, -89952(%rdi)
	movaps	%xmm0, -89968(%rdi)
	movaps	%xmm0, -89984(%rdi)
	movaps	%xmm0, -90000(%rdi)
	movaps	%xmm0, -90016(%rdi)
	movaps	%xmm0, -90032(%rdi)
	movaps	%xmm0, -90048(%rdi)
	movaps	%xmm0, -90064(%rdi)
	movaps	%xmm0, -90080(%rdi)
	movaps	%xmm0, -90096(%rdi)
	movaps	%xmm0, -90112(%rdi)
	movaps	%xmm0, -85776(%rdi)
	movaps	%xmm0, -85792(%rdi)
	movaps	%xmm0, -85808(%rdi)
	movaps	%xmm0, -85824(%rdi)
	movaps	%xmm0, -85840(%rdi)
	movaps	%xmm0, -85856(%rdi)
	movaps	%xmm0, -85872(%rdi)
	movaps	%xmm0, -85888(%rdi)
	movaps	%xmm0, -85904(%rdi)
	movaps	%xmm0, -85920(%rdi)
	movaps	%xmm0, -85936(%rdi)
	movaps	%xmm0, -85952(%rdi)
	movaps	%xmm0, -85968(%rdi)
	movaps	%xmm0, -85984(%rdi)
	movaps	%xmm0, -86000(%rdi)
	movaps	%xmm0, -86016(%rdi)
	movaps	%xmm0, -81680(%rdi)
	movaps	%xmm0, -81696(%rdi)
	movaps	%xmm0, -81712(%rdi)
	movaps	%xmm0, -81728(%rdi)
	movaps	%xmm0, -81744(%rdi)
	movaps	%xmm0, -81760(%rdi)
	movaps	%xmm0, -81776(%rdi)
	movaps	%xmm0, -81792(%rdi)
	movaps	%xmm0, -81808(%rdi)
	movaps	%xmm0, -81824(%rdi)
	movaps	%xmm0, -81840(%rdi)
	movaps	%xmm0, -81856(%rdi)
	movaps	%xmm0, -81872(%rdi)
	movaps	%xmm0, -81888(%rdi)
	movaps	%xmm0, -81904(%rdi)
	movaps	%xmm0, -81920(%rdi)
	movaps	%xmm0, -77584(%rdi)
	movaps	%xmm0, -77600(%rdi)
	movaps	%xmm0, -77616(%rdi)
	movaps	%xmm0, -77632(%rdi)
	movaps	%xmm0, -77648(%rdi)
	movaps	%xmm0, -77664(%rdi)
	movaps	%xmm0, -77680(%rdi)
	movaps	%xmm0, -77696(%rdi)
	movaps	%xmm0, -77712(%rdi)
	movaps	%xmm0, -77728(%rdi)
	movaps	%xmm0, -77744(%rdi)
	movaps	%xmm0, -77760(%rdi)
	movaps	%xmm0, -77776(%rdi)
	movaps	%xmm0, -77792(%rdi)
	movaps	%xmm0, -77808(%rdi)
	movaps	%xmm0, -77824(%rdi)
	movaps	%xmm0, -73488(%rdi)
	movaps	%xmm0, -73504(%rdi)
	movaps	%xmm0, -73520(%rdi)
	movaps	%xmm0, -73536(%rdi)
	movaps	%xmm0, -73552(%rdi)
	movaps	%xmm0, -73568(%rdi)
	movaps	%xmm0, -73584(%rdi)
	movaps	%xmm0, -73600(%rdi)
	movaps	%xmm0, -73616(%rdi)
	movaps	%xmm0, -73632(%rdi)
	movaps	%xmm0, -73648(%rdi)
	movaps	%xmm0, -73664(%rdi)
	movaps	%xmm0, -73680(%rdi)
	movaps	%xmm0, -73696(%rdi)
	movaps	%xmm0, -73712(%rdi)
	movaps	%xmm0, -73728(%rdi)
	movaps	%xmm0, -69392(%rdi)
	movaps	%xmm0, -69408(%rdi)
	movaps	%xmm0, -69424(%rdi)
	movaps	%xmm0, -69440(%rdi)
	movaps	%xmm0, -69456(%rdi)
	movaps	%xmm0, -69472(%rdi)
	movaps	%xmm0, -69488(%rdi)
	movaps	%xmm0, -69504(%rdi)
	movaps	%xmm0, -69520(%rdi)
	movaps	%xmm0, -69536(%rdi)
	movaps	%xmm0, -69552(%rdi)
	movaps	%xmm0, -69568(%rdi)
	movaps	%xmm0, -69584(%rdi)
	movaps	%xmm0, -69600(%rdi)
	movaps	%xmm0, -69616(%rdi)
	movaps	%xmm0, -69632(%rdi)
	movaps	%xmm0, -65296(%rdi)
	movaps	%xmm0, -65312(%rdi)
	movaps	%xmm0, -65328(%rdi)
	movaps	%xmm0, -65344(%rdi)
	movaps	%xmm0, -65360(%rdi)
	movaps	%xmm0, -65376(%rdi)
	movaps	%xmm0, -65392(%rdi)
	movaps	%xmm0, -65408(%rdi)
	movaps	%xmm0, -65424(%rdi)
	movaps	%xmm0, -65440(%rdi)
	movaps	%xmm0, -65456(%rdi)
	movaps	%xmm0, -65472(%rdi)
	movaps	%xmm0, -65488(%rdi)
	movaps	%xmm0, -65504(%rdi)
	movaps	%xmm0, -65520(%rdi)
	movaps	%xmm0, -65536(%rdi)
	movaps	%xmm0, -61200(%rdi)
	movaps	%xmm0, -61216(%rdi)
	movaps	%xmm0, -61232(%rdi)
	movaps	%xmm0, -61248(%rdi)
	movaps	%xmm0, -61264(%rdi)
	movaps	%xmm0, -61280(%rdi)
	movaps	%xmm0, -61296(%rdi)
	movaps	%xmm0, -61312(%rdi)
	movaps	%xmm0, -61328(%rdi)
	movaps	%xmm0, -61344(%rdi)
	movaps	%xmm0, -61360(%rdi)
	movaps	%xmm0, -61376(%rdi)
	movaps	%xmm0, -61392(%rdi)
	movaps	%xmm0, -61408(%rdi)
	movaps	%xmm0, -61424(%rdi)
	movaps	%xmm0, -61440(%rdi)
	movaps	%xmm0, -57104(%rdi)
	movaps	%xmm0, -57120(%rdi)
	movaps	%xmm0, -57136(%rdi)
	movaps	%xmm0, -57152(%rdi)
	movaps	%xmm0, -57168(%rdi)
	movaps	%xmm0, -57184(%rdi)
	movaps	%xmm0, -57200(%rdi)
	movaps	%xmm0, -57216(%rdi)
	movaps	%xmm0, -57232(%rdi)
	movaps	%xmm0, -57248(%rdi)
	movaps	%xmm0, -57264(%rdi)
	movaps	%xmm0, -57280(%rdi)
	movaps	%xmm0, -57296(%rdi)
	movaps	%xmm0, -57312(%rdi)
	movaps	%xmm0, -57328(%rdi)
	movaps	%xmm0, -57344(%rdi)
	movaps	%xmm0, -53008(%rdi)
	movaps	%xmm0, -53024(%rdi)
	movaps	%xmm0, -53040(%rdi)
	movaps	%xmm0, -53056(%rdi)
	movaps	%xmm0, -53072(%rdi)
	movaps	%xmm0, -53088(%rdi)
	movaps	%xmm0, -53104(%rdi)
	movaps	%xmm0, -53120(%rdi)
	movaps	%xmm0, -53136(%rdi)
	movaps	%xmm0, -53152(%rdi)
	movaps	%xmm0, -53168(%rdi)
	movaps	%xmm0, -53184(%rdi)
	movaps	%xmm0, -53200(%rdi)
	movaps	%xmm0, -53216(%rdi)
	movaps	%xmm0, -53232(%rdi)
	movaps	%xmm0, -53248(%rdi)
	movaps	%xmm0, -48912(%rdi)
	movaps	%xmm0, -48928(%rdi)
	movaps	%xmm0, -48944(%rdi)
	movaps	%xmm0, -48960(%rdi)
	movaps	%xmm0, -48976(%rdi)
	movaps	%xmm0, -48992(%rdi)
	movaps	%xmm0, -49008(%rdi)
	movaps	%xmm0, -49024(%rdi)
	movaps	%xmm0, -49040(%rdi)
	movaps	%xmm0, -49056(%rdi)
	movaps	%xmm0, -49072(%rdi)
	movaps	%xmm0, -49088(%rdi)
	movaps	%xmm0, -49104(%rdi)
	movaps	%xmm0, -49120(%rdi)
	movaps	%xmm0, -49136(%rdi)
	movaps	%xmm0, -49152(%rdi)
	movaps	%xmm0, -44816(%rdi)
	movaps	%xmm0, -44832(%rdi)
	movaps	%xmm0, -44848(%rdi)
	movaps	%xmm0, -44864(%rdi)
	movaps	%xmm0, -44880(%rdi)
	movaps	%xmm0, -44896(%rdi)
	movaps	%xmm0, -44912(%rdi)
	movaps	%xmm0, -44928(%rdi)
	movaps	%xmm0, -44944(%rdi)
	movaps	%xmm0, -44960(%rdi)
	movaps	%xmm0, -44976(%rdi)
	movaps	%xmm0, -44992(%rdi)
	movaps	%xmm0, -45008(%rdi)
	movaps	%xmm0, -45024(%rdi)
	movaps	%xmm0, -45040(%rdi)
	movaps	%xmm0, -45056(%rdi)
	movaps	%xmm0, -40720(%rdi)
	movaps	%xmm0, -40736(%rdi)
	movaps	%xmm0, -40752(%rdi)
	movaps	%xmm0, -40768(%rdi)
	movaps	%xmm0, -40784(%rdi)
	movaps	%xmm0, -40800(%rdi)
	movaps	%xmm0, -40816(%rdi)
	movaps	%xmm0, -40832(%rdi)
	movaps	%xmm0, -40848(%rdi)
	movaps	%xmm0, -40864(%rdi)
	movaps	%xmm0, -40880(%rdi)
	movaps	%xmm0, -40896(%rdi)
	movaps	%xmm0, -40912(%rdi)
	movaps	%xmm0, -40928(%rdi)
	movaps	%xmm0, -40944(%rdi)
	movaps	%xmm0, -40960(%rdi)
	movaps	%xmm0, -36624(%rdi)
	movaps	%xmm0, -36640(%rdi)
	movaps	%xmm0, -36656(%rdi)
	movaps	%xmm0, -36672(%rdi)
	movaps	%xmm0, -36688(%rdi)
	movaps	%xmm0, -36704(%rdi)
	movaps	%xmm0, -36720(%rdi)
	movaps	%xmm0, -36736(%rdi)
	movaps	%xmm0, -36752(%rdi)
	movaps	%xmm0, -36768(%rdi)
	movaps	%xmm0, -36784(%rdi)
	movaps	%xmm0, -36800(%rdi)
	movaps	%xmm0, -36816(%rdi)
	movaps	%xmm0, -36832(%rdi)
	movaps	%xmm0, -36848(%rdi)
	movaps	%xmm0, -36864(%rdi)
	movaps	%xmm0, -32528(%rdi)
	movaps	%xmm0, -32544(%rdi)
	movaps	%xmm0, -32560(%rdi)
	movaps	%xmm0, -32576(%rdi)
	movaps	%xmm0, -32592(%rdi)
	movaps	%xmm0, -32608(%rdi)
	movaps	%xmm0, -32624(%rdi)
	movaps	%xmm0, -32640(%rdi)
	movaps	%xmm0, -32656(%rdi)
	movaps	%xmm0, -32672(%rdi)
	movaps	%xmm0, -32688(%rdi)
	movaps	%xmm0, -32704(%rdi)
	movaps	%xmm0, -32720(%rdi)
	movaps	%xmm0, -32736(%rdi)
	movaps	%xmm0, -32752(%rdi)
	movaps	%xmm0, -32768(%rdi)
	movaps	%xmm0, -28432(%rdi)
	movaps	%xmm0, -28448(%rdi)
	movaps	%xmm0, -28464(%rdi)
	movaps	%xmm0, -28480(%rdi)
	movaps	%xmm0, -28496(%rdi)
	movaps	%xmm0, -28512(%rdi)
	movaps	%xmm0, -28528(%rdi)
	movaps	%xmm0, -28544(%rdi)
	movaps	%xmm0, -28560(%rdi)
	movaps	%xmm0, -28576(%rdi)
	movaps	%xmm0, -28592(%rdi)
	movaps	%xmm0, -28608(%rdi)
	movaps	%xmm0, -28624(%rdi)
	movaps	%xmm0, -28640(%rdi)
	movaps	%xmm0, -28656(%rdi)
	movaps	%xmm0, -28672(%rdi)
	movaps	%xmm0, -24336(%rdi)
	movaps	%xmm0, -24352(%rdi)
	movaps	%xmm0, -24368(%rdi)
	movaps	%xmm0, -24384(%rdi)
	movaps	%xmm0, -24400(%rdi)
	movaps	%xmm0, -24416(%rdi)
	movaps	%xmm0, -24432(%rdi)
	movaps	%xmm0, -24448(%rdi)
	movaps	%xmm0, -24464(%rdi)
	movaps	%xmm0, -24480(%rdi)
	movaps	%xmm0, -24496(%rdi)
	movaps	%xmm0, -24512(%rdi)
	movaps	%xmm0, -24528(%rdi)
	movaps	%xmm0, -24544(%rdi)
	movaps	%xmm0, -24560(%rdi)
	movaps	%xmm0, -24576(%rdi)
	movaps	%xmm0, -20240(%rdi)
	movaps	%xmm0, -20256(%rdi)
	movaps	%xmm0, -20272(%rdi)
	movaps	%xmm0, -20288(%rdi)
	movaps	%xmm0, -20304(%rdi)
	movaps	%xmm0, -20320(%rdi)
	movaps	%xmm0, -20336(%rdi)
	movaps	%xmm0, -20352(%rdi)
	movaps	%xmm0, -20368(%rdi)
	movaps	%xmm0, -20384(%rdi)
	movaps	%xmm0, -20400(%rdi)
	movaps	%xmm0, -20416(%rdi)
	movaps	%xmm0, -20432(%rdi)
	movaps	%xmm0, -20448(%rdi)
	movaps	%xmm0, -20464(%rdi)
	movaps	%xmm0, -20480(%rdi)
	movaps	%xmm0, -16144(%rdi)
	movaps	%xmm0, -16160(%rdi)
	movaps	%xmm0, -16176(%rdi)
	movaps	%xmm0, -16192(%rdi)
	movaps	%xmm0, -16208(%rdi)
	movaps	%xmm0, -16224(%rdi)
	movaps	%xmm0, -16240(%rdi)
	movaps	%xmm0, -16256(%rdi)
	movaps	%xmm0, -16272(%rdi)
	movaps	%xmm0, -16288(%rdi)
	movaps	%xmm0, -16304(%rdi)
	movaps	%xmm0, -16320(%rdi)
	movaps	%xmm0, -16336(%rdi)
	movaps	%xmm0, -16352(%rdi)
	movaps	%xmm0, -16368(%rdi)
	movaps	%xmm0, -16384(%rdi)
	movaps	%xmm0, -12048(%rdi)
	movaps	%xmm0, -12064(%rdi)
	movaps	%xmm0, -12080(%rdi)
	movaps	%xmm0, -12096(%rdi)
	movaps	%xmm0, -12112(%rdi)
	movaps	%xmm0, -12128(%rdi)
	movaps	%xmm0, -12144(%rdi)
	movaps	%xmm0, -12160(%rdi)
	movaps	%xmm0, -12176(%rdi)
	movaps	%xmm0, -12192(%rdi)
	movaps	%xmm0, -12208(%rdi)
	movaps	%xmm0, -12224(%rdi)
	movaps	%xmm0, -12240(%rdi)
	movaps	%xmm0, -12256(%rdi)
	movaps	%xmm0, -12272(%rdi)
	movaps	%xmm0, -12288(%rdi)
	movaps	%xmm0, -7952(%rdi)
	movaps	%xmm0, -7968(%rdi)
	movaps	%xmm0, -7984(%rdi)
	movaps	%xmm0, -8000(%rdi)
	movaps	%xmm0, -8016(%rdi)
	movaps	%xmm0, -8032(%rdi)
	movaps	%xmm0, -8048(%rdi)
	movaps	%xmm0, -8064(%rdi)
	movaps	%xmm0, -8080(%rdi)
	movaps	%xmm0, -8096(%rdi)
	movaps	%xmm0, -8112(%rdi)
	movaps	%xmm0, -8128(%rdi)
	movaps	%xmm0, -8144(%rdi)
	movaps	%xmm0, -8160(%rdi)
	movaps	%xmm0, -8176(%rdi)
	movaps	%xmm0, -8192(%rdi)
	movaps	%xmm0, -3856(%rdi)
	movaps	%xmm0, -3872(%rdi)
	movaps	%xmm0, -3888(%rdi)
	movaps	%xmm0, -3904(%rdi)
	movaps	%xmm0, -3920(%rdi)
	movaps	%xmm0, -3936(%rdi)
	movaps	%xmm0, -3952(%rdi)
	movaps	%xmm0, -3968(%rdi)
	movaps	%xmm0, -3984(%rdi)
	movaps	%xmm0, -4000(%rdi)
	movaps	%xmm0, -4016(%rdi)
	movaps	%xmm0, -4032(%rdi)
	movaps	%xmm0, -4048(%rdi)
	movaps	%xmm0, -4064(%rdi)
	movaps	%xmm0, -4080(%rdi)
	movaps	%xmm0, -4096(%rdi)
	movaps	%xmm0, 240(%rdi)
	movaps	%xmm0, 224(%rdi)
	movaps	%xmm0, 208(%rdi)
	movaps	%xmm0, 192(%rdi)
	movaps	%xmm0, 176(%rdi)
	movaps	%xmm0, 160(%rdi)
	movaps	%xmm0, 144(%rdi)
	movaps	%xmm0, 128(%rdi)
	movaps	%xmm0, 112(%rdi)
	movaps	%xmm0, 96(%rdi)
	movaps	%xmm0, 80(%rdi)
	movaps	%xmm0, 64(%rdi)
	movaps	%xmm0, 48(%rdi)
	movaps	%xmm0, 32(%rdi)
	movaps	%xmm0, 16(%rdi)
	movaps	%xmm0, (%rdi)
	addq	$256, %rdi              # imm = 0x100
	decq	%rax
	jne	.LBB1_3
# BB#1:                                 # %polly.loop_exit3
                                        #   in Loop: Header=BB1_2 Depth=1
	incq	%rsi
	addq	$131072, %rdx           # imm = 0x20000
	cmpq	$16, %rsi
	jne	.LBB1_2
	.p2align	4, 0x90
.LBB1_5:                                # %polly.loop_preheader26
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_8 Depth 2
                                        #       Child Loop BB1_9 Depth 3
                                        #         Child Loop BB1_12 Depth 4
                                        #           Child Loop BB1_13 Depth 5
                                        #             Child Loop BB1_14 Depth 6
	movq	%rcx, -56(%rbp)         # 8-byte Spill
	shlq	$5, %rcx
	movq	%rcx, -96(%rbp)         # 8-byte Spill
	movl	$B+4096, %ecx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_8:                                # %polly.loop_preheader32
                                        #   Parent Loop BB1_5 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_9 Depth 3
                                        #         Child Loop BB1_12 Depth 4
                                        #           Child Loop BB1_13 Depth 5
                                        #             Child Loop BB1_14 Depth 6
	movq	%rax, -64(%rbp)         # 8-byte Spill
	movq	%rcx, -72(%rbp)         # 8-byte Spill
	movq	%rax, %rdi
	shlq	$5, %rdi
	movq	-48(%rbp), %r10         # 8-byte Reload
	movq	%rcx, %r13
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_9:                                # %polly.loop_preheader38
                                        #   Parent Loop BB1_5 Depth=1
                                        #     Parent Loop BB1_8 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_12 Depth 4
                                        #           Child Loop BB1_13 Depth 5
                                        #             Child Loop BB1_14 Depth 6
	movq	%rcx, -80(%rbp)         # 8-byte Spill
	movq	%r10, -88(%rbp)         # 8-byte Spill
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_12:                               # %polly.loop_preheader44
                                        #   Parent Loop BB1_5 Depth=1
                                        #     Parent Loop BB1_8 Depth=2
                                        #       Parent Loop BB1_9 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB1_13 Depth 5
                                        #             Child Loop BB1_14 Depth 6
	movq	-96(%rbp), %rax         # 8-byte Reload
	leaq	(%rcx,%rax), %r12
	movq	%r13, %r11
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB1_13:                               # %polly.loop_preheader50
                                        #   Parent Loop BB1_5 Depth=1
                                        #     Parent Loop BB1_8 Depth=2
                                        #       Parent Loop BB1_9 Depth=3
                                        #         Parent Loop BB1_12 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB1_14 Depth 6
	leaq	(%rdx,%rdi), %rax
	movq	%r12, %rsi
	shlq	$12, %rsi
	leaq	C(%rsi,%rax,8), %r8
	movq	C(%rsi,%rax,8), %r9
	movq	%r10, %rbx
	movq	%r11, %rax
	movl	$32, %r14d
	.p2align	4, 0x90
.LBB1_14:                               # %polly.loop_header49
                                        #   Parent Loop BB1_5 Depth=1
                                        #     Parent Loop BB1_8 Depth=2
                                        #       Parent Loop BB1_9 Depth=3
                                        #         Parent Loop BB1_12 Depth=4
                                        #           Parent Loop BB1_13 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	-4096(%rax), %r15
.Ltmp18:
	.loc	1 25 45 prologue_end    # MatrixMult.c:25:45
	imulq	-8(%rbx), %r15
	.loc	1 25 35 is_stmt 0       # MatrixMult.c:25:35
	addq	%r9, %r15
	movq	(%rax), %r9
	.loc	1 25 45                 # MatrixMult.c:25:45
	imulq	(%rbx), %r9
	.loc	1 25 35                 # MatrixMult.c:25:35
	addq	%r15, %r9
	addq	$8192, %rax             # imm = 0x2000
	addq	$16, %rbx
	addq	$-2, %r14
	jne	.LBB1_14
.Ltmp19:
# BB#10:                                # %polly.loop_exit51
                                        #   in Loop: Header=BB1_13 Depth=5
	movq	%r9, (%r8)
	incq	%rdx
	addq	$8, %r11
	cmpq	$32, %rdx
	jne	.LBB1_13
# BB#11:                                # %polly.loop_exit45
                                        #   in Loop: Header=BB1_12 Depth=4
	incq	%rcx
	addq	$4096, %r10             # imm = 0x1000
	cmpq	$32, %rcx
	jne	.LBB1_12
# BB#6:                                 # %polly.loop_exit39
                                        #   in Loop: Header=BB1_9 Depth=3
	movq	-80(%rbp), %rcx         # 8-byte Reload
	incq	%rcx
	addq	$131072, %r13           # imm = 0x20000
	movq	-88(%rbp), %r10         # 8-byte Reload
	addq	$256, %r10              # imm = 0x100
	cmpq	$16, %rcx
	jne	.LBB1_9
# BB#7:                                 # %polly.loop_exit33
                                        #   in Loop: Header=BB1_8 Depth=2
	movq	-64(%rbp), %rax         # 8-byte Reload
	incq	%rax
	movq	-72(%rbp), %rcx         # 8-byte Reload
	addq	$256, %rcx              # imm = 0x100
	cmpq	$16, %rax
	jne	.LBB1_8
# BB#4:                                 # %polly.loop_exit27
                                        #   in Loop: Header=BB1_5 Depth=1
	movq	-56(%rbp), %rcx         # 8-byte Reload
	incq	%rcx
	addq	$131072, -48(%rbp)      # 8-byte Folded Spill
                                        # imm = 0x20000
	cmpq	$16, %rcx
	jne	.LBB1_5
# BB#15:                                # %polly.exiting
	.loc	1 29 1 is_stmt 1        # MatrixMult.c:29:1
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp20:
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
.Ltmp21:
	.cfi_def_cfa_offset 16
.Ltmp22:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp23:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
.Ltmp24:
	.cfi_offset %rbx, -48
.Ltmp25:
	.cfi_offset %r12, -40
.Ltmp26:
	.cfi_offset %r14, -32
.Ltmp27:
	.cfi_offset %r15, -24
	movl	$C, %r14d
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB2_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
.Ltmp28:
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
.Ltmp29:
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
.Ltmp30:
	.loc	1 38 17 is_stmt 0       # MatrixMult.c:38:17
	cmpl	$79, %eax
	jne	.LBB2_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB2_2 Depth=2
.Ltmp31:
	.loc	1 38 37 discriminator 1 # MatrixMult.c:38:37
	movq	stdout(%rip), %rsi
	.loc	1 38 29 discriminator 1 # MatrixMult.c:38:29
	movl	$10, %edi
	callq	fputc
.Ltmp32:
.LBB2_4:                                # %for.inc
                                        #   in Loop: Header=BB2_2 Depth=2
	.loc	1 36 9 is_stmt 1 discriminator 1 # MatrixMult.c:36:9
	incq	%rbx
.Ltmp33:
	.loc	1 37 21                 # MatrixMult.c:37:21
	movq	stdout(%rip), %rcx
.Ltmp34:
	.loc	1 36 9 discriminator 1  # MatrixMult.c:36:9
	addq	$8, %r12
	cmpq	$512, %rbx              # imm = 0x200
	jne	.LBB2_2
.Ltmp35:
# BB#5:                                 # %for.end
                                        #   in Loop: Header=BB2_1 Depth=1
	.loc	1 40 9                  # MatrixMult.c:40:9
	movl	$10, %edi
	movq	%rcx, %rsi
	callq	fputc
.Ltmp36:
	.loc	1 35 5 discriminator 1  # MatrixMult.c:35:5
	incq	%r15
	addq	$4096, %r14             # imm = 0x1000
	cmpq	$512, %r15              # imm = 0x200
	jne	.LBB2_1
.Ltmp37:
# BB#6:                                 # %for.end11
	.loc	1 42 1                  # MatrixMult.c:42:1
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp38:
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
	xorl	%r8d, %r8d
.Ltmp39:
	.loc	1 13 21 prologue_end    # MatrixMult.c:13:21
	movaps	.LCPI3_0(%rip), %xmm0   # xmm0 = [1,1]
	movl	$C+126976, %esi
.Ltmp40:
	.loc	1 51 5                  # MatrixMult.c:51:5
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB3_1:                                # %vector.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_2 Depth 2
	movq	%rax, %rdx
	movl	$512, %edi              # imm = 0x200
	.p2align	4, 0x90
.LBB3_2:                                # %vector.body
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp41:
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
.Ltmp42:
	.loc	1 12 9 discriminator 1  # MatrixMult.c:12:9
	addq	$64, %rdx
	addq	$-8, %rdi
	jne	.LBB3_2
.Ltmp43:
# BB#3:                                 # %for.inc10.i
                                        #   in Loop: Header=BB3_1 Depth=1
	.loc	1 11 5 discriminator 1  # MatrixMult.c:11:5
	incq	%rcx
	addq	$4096, %rax             # imm = 0x1000
	cmpq	$512, %rcx              # imm = 0x200
	jne	.LBB3_1
.Ltmp44:
# BB#4:
	pushq	%rbp
.Ltmp45:
	.cfi_def_cfa_offset 16
.Ltmp46:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp47:
	.cfi_def_cfa_register %rbp
	.loc	1 52 5                  # MatrixMult.c:52:5
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
.Ltmp48:
	.cfi_offset %rbx, -56
.Ltmp49:
	.cfi_offset %r12, -48
.Ltmp50:
	.cfi_offset %r13, -40
.Ltmp51:
	.cfi_offset %r14, -32
.Ltmp52:
	.cfi_offset %r15, -24
	xorps	%xmm0, %xmm0
	xorl	%eax, %eax
	movl	$A+8, %ecx
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB3_6:                                # %polly.loop_preheader2.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_7 Depth 2
	movq	%rsi, %rdi
	movl	$16, %edx
	.p2align	4, 0x90
.LBB3_7:                                # %polly.loop_preheader8.i
                                        #   Parent Loop BB3_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movaps	%xmm0, -126736(%rdi)
	movaps	%xmm0, -126752(%rdi)
	movaps	%xmm0, -126768(%rdi)
	movaps	%xmm0, -126784(%rdi)
	movaps	%xmm0, -126800(%rdi)
	movaps	%xmm0, -126816(%rdi)
	movaps	%xmm0, -126832(%rdi)
	movaps	%xmm0, -126848(%rdi)
	movaps	%xmm0, -126864(%rdi)
	movaps	%xmm0, -126880(%rdi)
	movaps	%xmm0, -126896(%rdi)
	movaps	%xmm0, -126912(%rdi)
	movaps	%xmm0, -126928(%rdi)
	movaps	%xmm0, -126944(%rdi)
	movaps	%xmm0, -126960(%rdi)
	movaps	%xmm0, -126976(%rdi)
	movaps	%xmm0, -122640(%rdi)
	movaps	%xmm0, -122656(%rdi)
	movaps	%xmm0, -122672(%rdi)
	movaps	%xmm0, -122688(%rdi)
	movaps	%xmm0, -122704(%rdi)
	movaps	%xmm0, -122720(%rdi)
	movaps	%xmm0, -122736(%rdi)
	movaps	%xmm0, -122752(%rdi)
	movaps	%xmm0, -122768(%rdi)
	movaps	%xmm0, -122784(%rdi)
	movaps	%xmm0, -122800(%rdi)
	movaps	%xmm0, -122816(%rdi)
	movaps	%xmm0, -122832(%rdi)
	movaps	%xmm0, -122848(%rdi)
	movaps	%xmm0, -122864(%rdi)
	movaps	%xmm0, -122880(%rdi)
	movaps	%xmm0, -118544(%rdi)
	movaps	%xmm0, -118560(%rdi)
	movaps	%xmm0, -118576(%rdi)
	movaps	%xmm0, -118592(%rdi)
	movaps	%xmm0, -118608(%rdi)
	movaps	%xmm0, -118624(%rdi)
	movaps	%xmm0, -118640(%rdi)
	movaps	%xmm0, -118656(%rdi)
	movaps	%xmm0, -118672(%rdi)
	movaps	%xmm0, -118688(%rdi)
	movaps	%xmm0, -118704(%rdi)
	movaps	%xmm0, -118720(%rdi)
	movaps	%xmm0, -118736(%rdi)
	movaps	%xmm0, -118752(%rdi)
	movaps	%xmm0, -118768(%rdi)
	movaps	%xmm0, -118784(%rdi)
	movaps	%xmm0, -114448(%rdi)
	movaps	%xmm0, -114464(%rdi)
	movaps	%xmm0, -114480(%rdi)
	movaps	%xmm0, -114496(%rdi)
	movaps	%xmm0, -114512(%rdi)
	movaps	%xmm0, -114528(%rdi)
	movaps	%xmm0, -114544(%rdi)
	movaps	%xmm0, -114560(%rdi)
	movaps	%xmm0, -114576(%rdi)
	movaps	%xmm0, -114592(%rdi)
	movaps	%xmm0, -114608(%rdi)
	movaps	%xmm0, -114624(%rdi)
	movaps	%xmm0, -114640(%rdi)
	movaps	%xmm0, -114656(%rdi)
	movaps	%xmm0, -114672(%rdi)
	movaps	%xmm0, -114688(%rdi)
	movaps	%xmm0, -110352(%rdi)
	movaps	%xmm0, -110368(%rdi)
	movaps	%xmm0, -110384(%rdi)
	movaps	%xmm0, -110400(%rdi)
	movaps	%xmm0, -110416(%rdi)
	movaps	%xmm0, -110432(%rdi)
	movaps	%xmm0, -110448(%rdi)
	movaps	%xmm0, -110464(%rdi)
	movaps	%xmm0, -110480(%rdi)
	movaps	%xmm0, -110496(%rdi)
	movaps	%xmm0, -110512(%rdi)
	movaps	%xmm0, -110528(%rdi)
	movaps	%xmm0, -110544(%rdi)
	movaps	%xmm0, -110560(%rdi)
	movaps	%xmm0, -110576(%rdi)
	movaps	%xmm0, -110592(%rdi)
	movaps	%xmm0, -106256(%rdi)
	movaps	%xmm0, -106272(%rdi)
	movaps	%xmm0, -106288(%rdi)
	movaps	%xmm0, -106304(%rdi)
	movaps	%xmm0, -106320(%rdi)
	movaps	%xmm0, -106336(%rdi)
	movaps	%xmm0, -106352(%rdi)
	movaps	%xmm0, -106368(%rdi)
	movaps	%xmm0, -106384(%rdi)
	movaps	%xmm0, -106400(%rdi)
	movaps	%xmm0, -106416(%rdi)
	movaps	%xmm0, -106432(%rdi)
	movaps	%xmm0, -106448(%rdi)
	movaps	%xmm0, -106464(%rdi)
	movaps	%xmm0, -106480(%rdi)
	movaps	%xmm0, -106496(%rdi)
	movaps	%xmm0, -102160(%rdi)
	movaps	%xmm0, -102176(%rdi)
	movaps	%xmm0, -102192(%rdi)
	movaps	%xmm0, -102208(%rdi)
	movaps	%xmm0, -102224(%rdi)
	movaps	%xmm0, -102240(%rdi)
	movaps	%xmm0, -102256(%rdi)
	movaps	%xmm0, -102272(%rdi)
	movaps	%xmm0, -102288(%rdi)
	movaps	%xmm0, -102304(%rdi)
	movaps	%xmm0, -102320(%rdi)
	movaps	%xmm0, -102336(%rdi)
	movaps	%xmm0, -102352(%rdi)
	movaps	%xmm0, -102368(%rdi)
	movaps	%xmm0, -102384(%rdi)
	movaps	%xmm0, -102400(%rdi)
	movaps	%xmm0, -98064(%rdi)
	movaps	%xmm0, -98080(%rdi)
	movaps	%xmm0, -98096(%rdi)
	movaps	%xmm0, -98112(%rdi)
	movaps	%xmm0, -98128(%rdi)
	movaps	%xmm0, -98144(%rdi)
	movaps	%xmm0, -98160(%rdi)
	movaps	%xmm0, -98176(%rdi)
	movaps	%xmm0, -98192(%rdi)
	movaps	%xmm0, -98208(%rdi)
	movaps	%xmm0, -98224(%rdi)
	movaps	%xmm0, -98240(%rdi)
	movaps	%xmm0, -98256(%rdi)
	movaps	%xmm0, -98272(%rdi)
	movaps	%xmm0, -98288(%rdi)
	movaps	%xmm0, -98304(%rdi)
	movaps	%xmm0, -93968(%rdi)
	movaps	%xmm0, -93984(%rdi)
	movaps	%xmm0, -94000(%rdi)
	movaps	%xmm0, -94016(%rdi)
	movaps	%xmm0, -94032(%rdi)
	movaps	%xmm0, -94048(%rdi)
	movaps	%xmm0, -94064(%rdi)
	movaps	%xmm0, -94080(%rdi)
	movaps	%xmm0, -94096(%rdi)
	movaps	%xmm0, -94112(%rdi)
	movaps	%xmm0, -94128(%rdi)
	movaps	%xmm0, -94144(%rdi)
	movaps	%xmm0, -94160(%rdi)
	movaps	%xmm0, -94176(%rdi)
	movaps	%xmm0, -94192(%rdi)
	movaps	%xmm0, -94208(%rdi)
	movaps	%xmm0, -89872(%rdi)
	movaps	%xmm0, -89888(%rdi)
	movaps	%xmm0, -89904(%rdi)
	movaps	%xmm0, -89920(%rdi)
	movaps	%xmm0, -89936(%rdi)
	movaps	%xmm0, -89952(%rdi)
	movaps	%xmm0, -89968(%rdi)
	movaps	%xmm0, -89984(%rdi)
	movaps	%xmm0, -90000(%rdi)
	movaps	%xmm0, -90016(%rdi)
	movaps	%xmm0, -90032(%rdi)
	movaps	%xmm0, -90048(%rdi)
	movaps	%xmm0, -90064(%rdi)
	movaps	%xmm0, -90080(%rdi)
	movaps	%xmm0, -90096(%rdi)
	movaps	%xmm0, -90112(%rdi)
	movaps	%xmm0, -85776(%rdi)
	movaps	%xmm0, -85792(%rdi)
	movaps	%xmm0, -85808(%rdi)
	movaps	%xmm0, -85824(%rdi)
	movaps	%xmm0, -85840(%rdi)
	movaps	%xmm0, -85856(%rdi)
	movaps	%xmm0, -85872(%rdi)
	movaps	%xmm0, -85888(%rdi)
	movaps	%xmm0, -85904(%rdi)
	movaps	%xmm0, -85920(%rdi)
	movaps	%xmm0, -85936(%rdi)
	movaps	%xmm0, -85952(%rdi)
	movaps	%xmm0, -85968(%rdi)
	movaps	%xmm0, -85984(%rdi)
	movaps	%xmm0, -86000(%rdi)
	movaps	%xmm0, -86016(%rdi)
	movaps	%xmm0, -81680(%rdi)
	movaps	%xmm0, -81696(%rdi)
	movaps	%xmm0, -81712(%rdi)
	movaps	%xmm0, -81728(%rdi)
	movaps	%xmm0, -81744(%rdi)
	movaps	%xmm0, -81760(%rdi)
	movaps	%xmm0, -81776(%rdi)
	movaps	%xmm0, -81792(%rdi)
	movaps	%xmm0, -81808(%rdi)
	movaps	%xmm0, -81824(%rdi)
	movaps	%xmm0, -81840(%rdi)
	movaps	%xmm0, -81856(%rdi)
	movaps	%xmm0, -81872(%rdi)
	movaps	%xmm0, -81888(%rdi)
	movaps	%xmm0, -81904(%rdi)
	movaps	%xmm0, -81920(%rdi)
	movaps	%xmm0, -77584(%rdi)
	movaps	%xmm0, -77600(%rdi)
	movaps	%xmm0, -77616(%rdi)
	movaps	%xmm0, -77632(%rdi)
	movaps	%xmm0, -77648(%rdi)
	movaps	%xmm0, -77664(%rdi)
	movaps	%xmm0, -77680(%rdi)
	movaps	%xmm0, -77696(%rdi)
	movaps	%xmm0, -77712(%rdi)
	movaps	%xmm0, -77728(%rdi)
	movaps	%xmm0, -77744(%rdi)
	movaps	%xmm0, -77760(%rdi)
	movaps	%xmm0, -77776(%rdi)
	movaps	%xmm0, -77792(%rdi)
	movaps	%xmm0, -77808(%rdi)
	movaps	%xmm0, -77824(%rdi)
	movaps	%xmm0, -73488(%rdi)
	movaps	%xmm0, -73504(%rdi)
	movaps	%xmm0, -73520(%rdi)
	movaps	%xmm0, -73536(%rdi)
	movaps	%xmm0, -73552(%rdi)
	movaps	%xmm0, -73568(%rdi)
	movaps	%xmm0, -73584(%rdi)
	movaps	%xmm0, -73600(%rdi)
	movaps	%xmm0, -73616(%rdi)
	movaps	%xmm0, -73632(%rdi)
	movaps	%xmm0, -73648(%rdi)
	movaps	%xmm0, -73664(%rdi)
	movaps	%xmm0, -73680(%rdi)
	movaps	%xmm0, -73696(%rdi)
	movaps	%xmm0, -73712(%rdi)
	movaps	%xmm0, -73728(%rdi)
	movaps	%xmm0, -69392(%rdi)
	movaps	%xmm0, -69408(%rdi)
	movaps	%xmm0, -69424(%rdi)
	movaps	%xmm0, -69440(%rdi)
	movaps	%xmm0, -69456(%rdi)
	movaps	%xmm0, -69472(%rdi)
	movaps	%xmm0, -69488(%rdi)
	movaps	%xmm0, -69504(%rdi)
	movaps	%xmm0, -69520(%rdi)
	movaps	%xmm0, -69536(%rdi)
	movaps	%xmm0, -69552(%rdi)
	movaps	%xmm0, -69568(%rdi)
	movaps	%xmm0, -69584(%rdi)
	movaps	%xmm0, -69600(%rdi)
	movaps	%xmm0, -69616(%rdi)
	movaps	%xmm0, -69632(%rdi)
	movaps	%xmm0, -65296(%rdi)
	movaps	%xmm0, -65312(%rdi)
	movaps	%xmm0, -65328(%rdi)
	movaps	%xmm0, -65344(%rdi)
	movaps	%xmm0, -65360(%rdi)
	movaps	%xmm0, -65376(%rdi)
	movaps	%xmm0, -65392(%rdi)
	movaps	%xmm0, -65408(%rdi)
	movaps	%xmm0, -65424(%rdi)
	movaps	%xmm0, -65440(%rdi)
	movaps	%xmm0, -65456(%rdi)
	movaps	%xmm0, -65472(%rdi)
	movaps	%xmm0, -65488(%rdi)
	movaps	%xmm0, -65504(%rdi)
	movaps	%xmm0, -65520(%rdi)
	movaps	%xmm0, -65536(%rdi)
	movaps	%xmm0, -61200(%rdi)
	movaps	%xmm0, -61216(%rdi)
	movaps	%xmm0, -61232(%rdi)
	movaps	%xmm0, -61248(%rdi)
	movaps	%xmm0, -61264(%rdi)
	movaps	%xmm0, -61280(%rdi)
	movaps	%xmm0, -61296(%rdi)
	movaps	%xmm0, -61312(%rdi)
	movaps	%xmm0, -61328(%rdi)
	movaps	%xmm0, -61344(%rdi)
	movaps	%xmm0, -61360(%rdi)
	movaps	%xmm0, -61376(%rdi)
	movaps	%xmm0, -61392(%rdi)
	movaps	%xmm0, -61408(%rdi)
	movaps	%xmm0, -61424(%rdi)
	movaps	%xmm0, -61440(%rdi)
	movaps	%xmm0, -57104(%rdi)
	movaps	%xmm0, -57120(%rdi)
	movaps	%xmm0, -57136(%rdi)
	movaps	%xmm0, -57152(%rdi)
	movaps	%xmm0, -57168(%rdi)
	movaps	%xmm0, -57184(%rdi)
	movaps	%xmm0, -57200(%rdi)
	movaps	%xmm0, -57216(%rdi)
	movaps	%xmm0, -57232(%rdi)
	movaps	%xmm0, -57248(%rdi)
	movaps	%xmm0, -57264(%rdi)
	movaps	%xmm0, -57280(%rdi)
	movaps	%xmm0, -57296(%rdi)
	movaps	%xmm0, -57312(%rdi)
	movaps	%xmm0, -57328(%rdi)
	movaps	%xmm0, -57344(%rdi)
	movaps	%xmm0, -53008(%rdi)
	movaps	%xmm0, -53024(%rdi)
	movaps	%xmm0, -53040(%rdi)
	movaps	%xmm0, -53056(%rdi)
	movaps	%xmm0, -53072(%rdi)
	movaps	%xmm0, -53088(%rdi)
	movaps	%xmm0, -53104(%rdi)
	movaps	%xmm0, -53120(%rdi)
	movaps	%xmm0, -53136(%rdi)
	movaps	%xmm0, -53152(%rdi)
	movaps	%xmm0, -53168(%rdi)
	movaps	%xmm0, -53184(%rdi)
	movaps	%xmm0, -53200(%rdi)
	movaps	%xmm0, -53216(%rdi)
	movaps	%xmm0, -53232(%rdi)
	movaps	%xmm0, -53248(%rdi)
	movaps	%xmm0, -48912(%rdi)
	movaps	%xmm0, -48928(%rdi)
	movaps	%xmm0, -48944(%rdi)
	movaps	%xmm0, -48960(%rdi)
	movaps	%xmm0, -48976(%rdi)
	movaps	%xmm0, -48992(%rdi)
	movaps	%xmm0, -49008(%rdi)
	movaps	%xmm0, -49024(%rdi)
	movaps	%xmm0, -49040(%rdi)
	movaps	%xmm0, -49056(%rdi)
	movaps	%xmm0, -49072(%rdi)
	movaps	%xmm0, -49088(%rdi)
	movaps	%xmm0, -49104(%rdi)
	movaps	%xmm0, -49120(%rdi)
	movaps	%xmm0, -49136(%rdi)
	movaps	%xmm0, -49152(%rdi)
	movaps	%xmm0, -44816(%rdi)
	movaps	%xmm0, -44832(%rdi)
	movaps	%xmm0, -44848(%rdi)
	movaps	%xmm0, -44864(%rdi)
	movaps	%xmm0, -44880(%rdi)
	movaps	%xmm0, -44896(%rdi)
	movaps	%xmm0, -44912(%rdi)
	movaps	%xmm0, -44928(%rdi)
	movaps	%xmm0, -44944(%rdi)
	movaps	%xmm0, -44960(%rdi)
	movaps	%xmm0, -44976(%rdi)
	movaps	%xmm0, -44992(%rdi)
	movaps	%xmm0, -45008(%rdi)
	movaps	%xmm0, -45024(%rdi)
	movaps	%xmm0, -45040(%rdi)
	movaps	%xmm0, -45056(%rdi)
	movaps	%xmm0, -40720(%rdi)
	movaps	%xmm0, -40736(%rdi)
	movaps	%xmm0, -40752(%rdi)
	movaps	%xmm0, -40768(%rdi)
	movaps	%xmm0, -40784(%rdi)
	movaps	%xmm0, -40800(%rdi)
	movaps	%xmm0, -40816(%rdi)
	movaps	%xmm0, -40832(%rdi)
	movaps	%xmm0, -40848(%rdi)
	movaps	%xmm0, -40864(%rdi)
	movaps	%xmm0, -40880(%rdi)
	movaps	%xmm0, -40896(%rdi)
	movaps	%xmm0, -40912(%rdi)
	movaps	%xmm0, -40928(%rdi)
	movaps	%xmm0, -40944(%rdi)
	movaps	%xmm0, -40960(%rdi)
	movaps	%xmm0, -36624(%rdi)
	movaps	%xmm0, -36640(%rdi)
	movaps	%xmm0, -36656(%rdi)
	movaps	%xmm0, -36672(%rdi)
	movaps	%xmm0, -36688(%rdi)
	movaps	%xmm0, -36704(%rdi)
	movaps	%xmm0, -36720(%rdi)
	movaps	%xmm0, -36736(%rdi)
	movaps	%xmm0, -36752(%rdi)
	movaps	%xmm0, -36768(%rdi)
	movaps	%xmm0, -36784(%rdi)
	movaps	%xmm0, -36800(%rdi)
	movaps	%xmm0, -36816(%rdi)
	movaps	%xmm0, -36832(%rdi)
	movaps	%xmm0, -36848(%rdi)
	movaps	%xmm0, -36864(%rdi)
	movaps	%xmm0, -32528(%rdi)
	movaps	%xmm0, -32544(%rdi)
	movaps	%xmm0, -32560(%rdi)
	movaps	%xmm0, -32576(%rdi)
	movaps	%xmm0, -32592(%rdi)
	movaps	%xmm0, -32608(%rdi)
	movaps	%xmm0, -32624(%rdi)
	movaps	%xmm0, -32640(%rdi)
	movaps	%xmm0, -32656(%rdi)
	movaps	%xmm0, -32672(%rdi)
	movaps	%xmm0, -32688(%rdi)
	movaps	%xmm0, -32704(%rdi)
	movaps	%xmm0, -32720(%rdi)
	movaps	%xmm0, -32736(%rdi)
	movaps	%xmm0, -32752(%rdi)
	movaps	%xmm0, -32768(%rdi)
	movaps	%xmm0, -28432(%rdi)
	movaps	%xmm0, -28448(%rdi)
	movaps	%xmm0, -28464(%rdi)
	movaps	%xmm0, -28480(%rdi)
	movaps	%xmm0, -28496(%rdi)
	movaps	%xmm0, -28512(%rdi)
	movaps	%xmm0, -28528(%rdi)
	movaps	%xmm0, -28544(%rdi)
	movaps	%xmm0, -28560(%rdi)
	movaps	%xmm0, -28576(%rdi)
	movaps	%xmm0, -28592(%rdi)
	movaps	%xmm0, -28608(%rdi)
	movaps	%xmm0, -28624(%rdi)
	movaps	%xmm0, -28640(%rdi)
	movaps	%xmm0, -28656(%rdi)
	movaps	%xmm0, -28672(%rdi)
	movaps	%xmm0, -24336(%rdi)
	movaps	%xmm0, -24352(%rdi)
	movaps	%xmm0, -24368(%rdi)
	movaps	%xmm0, -24384(%rdi)
	movaps	%xmm0, -24400(%rdi)
	movaps	%xmm0, -24416(%rdi)
	movaps	%xmm0, -24432(%rdi)
	movaps	%xmm0, -24448(%rdi)
	movaps	%xmm0, -24464(%rdi)
	movaps	%xmm0, -24480(%rdi)
	movaps	%xmm0, -24496(%rdi)
	movaps	%xmm0, -24512(%rdi)
	movaps	%xmm0, -24528(%rdi)
	movaps	%xmm0, -24544(%rdi)
	movaps	%xmm0, -24560(%rdi)
	movaps	%xmm0, -24576(%rdi)
	movaps	%xmm0, -20240(%rdi)
	movaps	%xmm0, -20256(%rdi)
	movaps	%xmm0, -20272(%rdi)
	movaps	%xmm0, -20288(%rdi)
	movaps	%xmm0, -20304(%rdi)
	movaps	%xmm0, -20320(%rdi)
	movaps	%xmm0, -20336(%rdi)
	movaps	%xmm0, -20352(%rdi)
	movaps	%xmm0, -20368(%rdi)
	movaps	%xmm0, -20384(%rdi)
	movaps	%xmm0, -20400(%rdi)
	movaps	%xmm0, -20416(%rdi)
	movaps	%xmm0, -20432(%rdi)
	movaps	%xmm0, -20448(%rdi)
	movaps	%xmm0, -20464(%rdi)
	movaps	%xmm0, -20480(%rdi)
	movaps	%xmm0, -16144(%rdi)
	movaps	%xmm0, -16160(%rdi)
	movaps	%xmm0, -16176(%rdi)
	movaps	%xmm0, -16192(%rdi)
	movaps	%xmm0, -16208(%rdi)
	movaps	%xmm0, -16224(%rdi)
	movaps	%xmm0, -16240(%rdi)
	movaps	%xmm0, -16256(%rdi)
	movaps	%xmm0, -16272(%rdi)
	movaps	%xmm0, -16288(%rdi)
	movaps	%xmm0, -16304(%rdi)
	movaps	%xmm0, -16320(%rdi)
	movaps	%xmm0, -16336(%rdi)
	movaps	%xmm0, -16352(%rdi)
	movaps	%xmm0, -16368(%rdi)
	movaps	%xmm0, -16384(%rdi)
	movaps	%xmm0, -12048(%rdi)
	movaps	%xmm0, -12064(%rdi)
	movaps	%xmm0, -12080(%rdi)
	movaps	%xmm0, -12096(%rdi)
	movaps	%xmm0, -12112(%rdi)
	movaps	%xmm0, -12128(%rdi)
	movaps	%xmm0, -12144(%rdi)
	movaps	%xmm0, -12160(%rdi)
	movaps	%xmm0, -12176(%rdi)
	movaps	%xmm0, -12192(%rdi)
	movaps	%xmm0, -12208(%rdi)
	movaps	%xmm0, -12224(%rdi)
	movaps	%xmm0, -12240(%rdi)
	movaps	%xmm0, -12256(%rdi)
	movaps	%xmm0, -12272(%rdi)
	movaps	%xmm0, -12288(%rdi)
	movaps	%xmm0, -7952(%rdi)
	movaps	%xmm0, -7968(%rdi)
	movaps	%xmm0, -7984(%rdi)
	movaps	%xmm0, -8000(%rdi)
	movaps	%xmm0, -8016(%rdi)
	movaps	%xmm0, -8032(%rdi)
	movaps	%xmm0, -8048(%rdi)
	movaps	%xmm0, -8064(%rdi)
	movaps	%xmm0, -8080(%rdi)
	movaps	%xmm0, -8096(%rdi)
	movaps	%xmm0, -8112(%rdi)
	movaps	%xmm0, -8128(%rdi)
	movaps	%xmm0, -8144(%rdi)
	movaps	%xmm0, -8160(%rdi)
	movaps	%xmm0, -8176(%rdi)
	movaps	%xmm0, -8192(%rdi)
	movaps	%xmm0, -3856(%rdi)
	movaps	%xmm0, -3872(%rdi)
	movaps	%xmm0, -3888(%rdi)
	movaps	%xmm0, -3904(%rdi)
	movaps	%xmm0, -3920(%rdi)
	movaps	%xmm0, -3936(%rdi)
	movaps	%xmm0, -3952(%rdi)
	movaps	%xmm0, -3968(%rdi)
	movaps	%xmm0, -3984(%rdi)
	movaps	%xmm0, -4000(%rdi)
	movaps	%xmm0, -4016(%rdi)
	movaps	%xmm0, -4032(%rdi)
	movaps	%xmm0, -4048(%rdi)
	movaps	%xmm0, -4064(%rdi)
	movaps	%xmm0, -4080(%rdi)
	movaps	%xmm0, -4096(%rdi)
	movaps	%xmm0, 240(%rdi)
	movaps	%xmm0, 224(%rdi)
	movaps	%xmm0, 208(%rdi)
	movaps	%xmm0, 192(%rdi)
	movaps	%xmm0, 176(%rdi)
	movaps	%xmm0, 160(%rdi)
	movaps	%xmm0, 144(%rdi)
	movaps	%xmm0, 128(%rdi)
	movaps	%xmm0, 112(%rdi)
	movaps	%xmm0, 96(%rdi)
	movaps	%xmm0, 80(%rdi)
	movaps	%xmm0, 64(%rdi)
	movaps	%xmm0, 48(%rdi)
	movaps	%xmm0, 32(%rdi)
	movaps	%xmm0, 16(%rdi)
	movaps	%xmm0, (%rdi)
	addq	$256, %rdi              # imm = 0x100
	decq	%rdx
	jne	.LBB3_7
# BB#5:                                 # %polly.loop_exit3.i
                                        #   in Loop: Header=BB3_6 Depth=1
	incq	%r8
	addq	$131072, %rsi           # imm = 0x20000
	cmpq	$16, %r8
	jne	.LBB3_6
	.p2align	4, 0x90
.LBB3_10:                               # %polly.loop_preheader26.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_11 Depth 2
                                        #       Child Loop BB3_14 Depth 3
                                        #         Child Loop BB3_15 Depth 4
                                        #           Child Loop BB3_18 Depth 5
                                        #             Child Loop BB3_16 Depth 6
	movq	%rax, -56(%rbp)         # 8-byte Spill
	shlq	$5, %rax
	movq	%rax, -96(%rbp)         # 8-byte Spill
	movl	$B+4096, %ecx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB3_11:                               # %polly.loop_preheader32.i
                                        #   Parent Loop BB3_10 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_14 Depth 3
                                        #         Child Loop BB3_15 Depth 4
                                        #           Child Loop BB3_18 Depth 5
                                        #             Child Loop BB3_16 Depth 6
	movq	%rax, -64(%rbp)         # 8-byte Spill
	movq	%rcx, -72(%rbp)         # 8-byte Spill
	movq	%rax, %rdi
	shlq	$5, %rdi
	movq	-48(%rbp), %r8          # 8-byte Reload
	movq	%rcx, %r13
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB3_14:                               # %polly.loop_preheader38.i
                                        #   Parent Loop BB3_10 Depth=1
                                        #     Parent Loop BB3_11 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB3_15 Depth 4
                                        #           Child Loop BB3_18 Depth 5
                                        #             Child Loop BB3_16 Depth 6
	movq	%rcx, -80(%rbp)         # 8-byte Spill
	movq	%r8, -88(%rbp)          # 8-byte Spill
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB3_15:                               # %polly.loop_preheader44.i
                                        #   Parent Loop BB3_10 Depth=1
                                        #     Parent Loop BB3_11 Depth=2
                                        #       Parent Loop BB3_14 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB3_18 Depth 5
                                        #             Child Loop BB3_16 Depth 6
	movq	-96(%rbp), %rax         # 8-byte Reload
	leaq	(%rcx,%rax), %r12
	movq	%r13, %r11
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB3_18:                               # %polly.loop_preheader50.i
                                        #   Parent Loop BB3_10 Depth=1
                                        #     Parent Loop BB3_11 Depth=2
                                        #       Parent Loop BB3_14 Depth=3
                                        #         Parent Loop BB3_15 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB3_16 Depth 6
	leaq	(%rsi,%rdi), %rdx
	movq	%r12, %rax
	shlq	$12, %rax
	leaq	C(%rax,%rdx,8), %r9
	movq	C(%rax,%rdx,8), %r10
	movq	%r8, %rbx
	movq	%r11, %rdx
	movl	$32, %r14d
	.p2align	4, 0x90
.LBB3_16:                               # %polly.loop_header49.i
                                        #   Parent Loop BB3_10 Depth=1
                                        #     Parent Loop BB3_11 Depth=2
                                        #       Parent Loop BB3_14 Depth=3
                                        #         Parent Loop BB3_15 Depth=4
                                        #           Parent Loop BB3_18 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movq	-4096(%rdx), %r15
.Ltmp53:
	.loc	1 25 45                 # MatrixMult.c:25:45
	imulq	-8(%rbx), %r15
	.loc	1 25 35 is_stmt 0       # MatrixMult.c:25:35
	addq	%r10, %r15
.Ltmp54:
	.loc	1 52 5 is_stmt 1        # MatrixMult.c:52:5
	movq	(%rdx), %r10
.Ltmp55:
	.loc	1 25 45                 # MatrixMult.c:25:45
	imulq	(%rbx), %r10
	.loc	1 25 35 is_stmt 0       # MatrixMult.c:25:35
	addq	%r15, %r10
.Ltmp56:
	.loc	1 52 5 is_stmt 1        # MatrixMult.c:52:5
	addq	$8192, %rdx             # imm = 0x2000
	addq	$16, %rbx
	addq	$-2, %r14
	jne	.LBB3_16
# BB#17:                                # %polly.loop_exit51.i
                                        #   in Loop: Header=BB3_18 Depth=5
	movq	%r10, (%r9)
	incq	%rsi
	addq	$8, %r11
	cmpq	$32, %rsi
	jne	.LBB3_18
# BB#12:                                # %polly.loop_exit45.i
                                        #   in Loop: Header=BB3_15 Depth=4
	incq	%rcx
	addq	$4096, %r8              # imm = 0x1000
	cmpq	$32, %rcx
	jne	.LBB3_15
# BB#13:                                # %polly.loop_exit39.i
                                        #   in Loop: Header=BB3_14 Depth=3
	movq	-80(%rbp), %rcx         # 8-byte Reload
	incq	%rcx
	addq	$131072, %r13           # imm = 0x20000
	movq	-88(%rbp), %r8          # 8-byte Reload
	addq	$256, %r8               # imm = 0x100
	cmpq	$16, %rcx
	jne	.LBB3_14
# BB#8:                                 # %polly.loop_exit33.i
                                        #   in Loop: Header=BB3_11 Depth=2
	movq	-64(%rbp), %rax         # 8-byte Reload
	incq	%rax
	movq	-72(%rbp), %rcx         # 8-byte Reload
	addq	$256, %rcx              # imm = 0x100
	cmpq	$16, %rax
	jne	.LBB3_11
# BB#9:                                 # %polly.loop_exit27.i
                                        #   in Loop: Header=BB3_10 Depth=1
	movq	-56(%rbp), %rax         # 8-byte Reload
	incq	%rax
	addq	$131072, -48(%rbp)      # 8-byte Folded Spill
                                        # imm = 0x20000
	cmpq	$16, %rax
	jne	.LBB3_10
# BB#19:                                # %mat_mult.exit
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
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp57:
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
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
	.byte	9                       # Abbreviation Code
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
	.byte	10                      # Abbreviation Code
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
	.byte	11                      # Abbreviation Code
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
	.long	266                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x103 DW_TAG_compile_unit
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
	.long	198                     # DW_AT_abstract_origin
	.byte	7                       # Abbrev [7] 0x9e:0x13 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	206                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0xb1:0x15 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
                                        # DW_AT_external
	.byte	9                       # Abbrev [9] 0xc6:0x8 DW_TAG_subprogram
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	9                       # Abbrev [9] 0xce:0x8 DW_TAG_subprogram
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	10                      # Abbrev [10] 0xd6:0x30 DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
	.long	262                     # DW_AT_type
                                        # DW_AT_external
	.byte	11                      # Abbrev [11] 0xef:0xb DW_TAG_inlined_subroutine
	.long	198                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	51                      # DW_AT_call_line
	.byte	11                      # Abbrev [11] 0xfa:0xb DW_TAG_inlined_subroutine
	.long	206                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges1         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	52                      # DW_AT_call_line
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x106:0x7 DW_TAG_base_type
	.long	.Linfo_string12         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	0
	.quad	0
.Ldebug_ranges1:
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
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
	.long	270                     # Compilation Unit Length
	.long	42                      # DIE offset
	.asciz	"A"                     # External Name
	.long	97                      # DIE offset
	.asciz	"B"                     # External Name
	.long	118                     # DIE offset
	.asciz	"C"                     # External Name
	.long	206                     # DIE offset
	.asciz	"mat_mult"              # External Name
	.long	198                     # DIE offset
	.asciz	"init_array"            # External Name
	.long	214                     # DIE offset
	.asciz	"main"                  # External Name
	.long	177                     # DIE offset
	.asciz	"print_array"           # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	270                     # Compilation Unit Length
	.long	83                      # DIE offset
	.asciz	"long long int"         # External Name
	.long	262                     # DIE offset
	.asciz	"int"                   # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
