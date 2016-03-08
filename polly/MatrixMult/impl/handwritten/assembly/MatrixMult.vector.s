	.text
	.file	"MatrixMult.vector.ll"
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
	xorl	%eax, %eax
	movl	$C+126976, %ecx
	pxor	%xmm0, %xmm0
	.p2align	4, 0x90
.LBB1_2:                                # %polly.loop_preheader2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_3 Depth 2
	movq	%rcx, %rdx
	movl	$16, %esi
	.p2align	4, 0x90
.LBB1_3:                                # %polly.loop_preheader14
                                        #   Parent Loop BB1_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movdqa	%xmm0, -126736(%rdx)
	movdqa	%xmm0, -126752(%rdx)
	movdqa	%xmm0, -126768(%rdx)
	movdqa	%xmm0, -126784(%rdx)
	movdqa	%xmm0, -126800(%rdx)
	movdqa	%xmm0, -126816(%rdx)
	movdqa	%xmm0, -126832(%rdx)
	movdqa	%xmm0, -126848(%rdx)
	movdqa	%xmm0, -126864(%rdx)
	movdqa	%xmm0, -126880(%rdx)
	movdqa	%xmm0, -126896(%rdx)
	movdqa	%xmm0, -126912(%rdx)
	movdqa	%xmm0, -126928(%rdx)
	movdqa	%xmm0, -126944(%rdx)
	movdqa	%xmm0, -126960(%rdx)
	movdqa	%xmm0, -126976(%rdx)
	movdqa	%xmm0, -122640(%rdx)
	movdqa	%xmm0, -122656(%rdx)
	movdqa	%xmm0, -122672(%rdx)
	movdqa	%xmm0, -122688(%rdx)
	movdqa	%xmm0, -122704(%rdx)
	movdqa	%xmm0, -122720(%rdx)
	movdqa	%xmm0, -122736(%rdx)
	movdqa	%xmm0, -122752(%rdx)
	movdqa	%xmm0, -122768(%rdx)
	movdqa	%xmm0, -122784(%rdx)
	movdqa	%xmm0, -122800(%rdx)
	movdqa	%xmm0, -122816(%rdx)
	movdqa	%xmm0, -122832(%rdx)
	movdqa	%xmm0, -122848(%rdx)
	movdqa	%xmm0, -122864(%rdx)
	movdqa	%xmm0, -122880(%rdx)
	movdqa	%xmm0, -118544(%rdx)
	movdqa	%xmm0, -118560(%rdx)
	movdqa	%xmm0, -118576(%rdx)
	movdqa	%xmm0, -118592(%rdx)
	movdqa	%xmm0, -118608(%rdx)
	movdqa	%xmm0, -118624(%rdx)
	movdqa	%xmm0, -118640(%rdx)
	movdqa	%xmm0, -118656(%rdx)
	movdqa	%xmm0, -118672(%rdx)
	movdqa	%xmm0, -118688(%rdx)
	movdqa	%xmm0, -118704(%rdx)
	movdqa	%xmm0, -118720(%rdx)
	movdqa	%xmm0, -118736(%rdx)
	movdqa	%xmm0, -118752(%rdx)
	movdqa	%xmm0, -118768(%rdx)
	movdqa	%xmm0, -118784(%rdx)
	movdqa	%xmm0, -114448(%rdx)
	movdqa	%xmm0, -114464(%rdx)
	movdqa	%xmm0, -114480(%rdx)
	movdqa	%xmm0, -114496(%rdx)
	movdqa	%xmm0, -114512(%rdx)
	movdqa	%xmm0, -114528(%rdx)
	movdqa	%xmm0, -114544(%rdx)
	movdqa	%xmm0, -114560(%rdx)
	movdqa	%xmm0, -114576(%rdx)
	movdqa	%xmm0, -114592(%rdx)
	movdqa	%xmm0, -114608(%rdx)
	movdqa	%xmm0, -114624(%rdx)
	movdqa	%xmm0, -114640(%rdx)
	movdqa	%xmm0, -114656(%rdx)
	movdqa	%xmm0, -114672(%rdx)
	movdqa	%xmm0, -114688(%rdx)
	movdqa	%xmm0, -110352(%rdx)
	movdqa	%xmm0, -110368(%rdx)
	movdqa	%xmm0, -110384(%rdx)
	movdqa	%xmm0, -110400(%rdx)
	movdqa	%xmm0, -110416(%rdx)
	movdqa	%xmm0, -110432(%rdx)
	movdqa	%xmm0, -110448(%rdx)
	movdqa	%xmm0, -110464(%rdx)
	movdqa	%xmm0, -110480(%rdx)
	movdqa	%xmm0, -110496(%rdx)
	movdqa	%xmm0, -110512(%rdx)
	movdqa	%xmm0, -110528(%rdx)
	movdqa	%xmm0, -110544(%rdx)
	movdqa	%xmm0, -110560(%rdx)
	movdqa	%xmm0, -110576(%rdx)
	movdqa	%xmm0, -110592(%rdx)
	movdqa	%xmm0, -106256(%rdx)
	movdqa	%xmm0, -106272(%rdx)
	movdqa	%xmm0, -106288(%rdx)
	movdqa	%xmm0, -106304(%rdx)
	movdqa	%xmm0, -106320(%rdx)
	movdqa	%xmm0, -106336(%rdx)
	movdqa	%xmm0, -106352(%rdx)
	movdqa	%xmm0, -106368(%rdx)
	movdqa	%xmm0, -106384(%rdx)
	movdqa	%xmm0, -106400(%rdx)
	movdqa	%xmm0, -106416(%rdx)
	movdqa	%xmm0, -106432(%rdx)
	movdqa	%xmm0, -106448(%rdx)
	movdqa	%xmm0, -106464(%rdx)
	movdqa	%xmm0, -106480(%rdx)
	movdqa	%xmm0, -106496(%rdx)
	movdqa	%xmm0, -102160(%rdx)
	movdqa	%xmm0, -102176(%rdx)
	movdqa	%xmm0, -102192(%rdx)
	movdqa	%xmm0, -102208(%rdx)
	movdqa	%xmm0, -102224(%rdx)
	movdqa	%xmm0, -102240(%rdx)
	movdqa	%xmm0, -102256(%rdx)
	movdqa	%xmm0, -102272(%rdx)
	movdqa	%xmm0, -102288(%rdx)
	movdqa	%xmm0, -102304(%rdx)
	movdqa	%xmm0, -102320(%rdx)
	movdqa	%xmm0, -102336(%rdx)
	movdqa	%xmm0, -102352(%rdx)
	movdqa	%xmm0, -102368(%rdx)
	movdqa	%xmm0, -102384(%rdx)
	movdqa	%xmm0, -102400(%rdx)
	movdqa	%xmm0, -98064(%rdx)
	movdqa	%xmm0, -98080(%rdx)
	movdqa	%xmm0, -98096(%rdx)
	movdqa	%xmm0, -98112(%rdx)
	movdqa	%xmm0, -98128(%rdx)
	movdqa	%xmm0, -98144(%rdx)
	movdqa	%xmm0, -98160(%rdx)
	movdqa	%xmm0, -98176(%rdx)
	movdqa	%xmm0, -98192(%rdx)
	movdqa	%xmm0, -98208(%rdx)
	movdqa	%xmm0, -98224(%rdx)
	movdqa	%xmm0, -98240(%rdx)
	movdqa	%xmm0, -98256(%rdx)
	movdqa	%xmm0, -98272(%rdx)
	movdqa	%xmm0, -98288(%rdx)
	movdqa	%xmm0, -98304(%rdx)
	movdqa	%xmm0, -93968(%rdx)
	movdqa	%xmm0, -93984(%rdx)
	movdqa	%xmm0, -94000(%rdx)
	movdqa	%xmm0, -94016(%rdx)
	movdqa	%xmm0, -94032(%rdx)
	movdqa	%xmm0, -94048(%rdx)
	movdqa	%xmm0, -94064(%rdx)
	movdqa	%xmm0, -94080(%rdx)
	movdqa	%xmm0, -94096(%rdx)
	movdqa	%xmm0, -94112(%rdx)
	movdqa	%xmm0, -94128(%rdx)
	movdqa	%xmm0, -94144(%rdx)
	movdqa	%xmm0, -94160(%rdx)
	movdqa	%xmm0, -94176(%rdx)
	movdqa	%xmm0, -94192(%rdx)
	movdqa	%xmm0, -94208(%rdx)
	movdqa	%xmm0, -89872(%rdx)
	movdqa	%xmm0, -89888(%rdx)
	movdqa	%xmm0, -89904(%rdx)
	movdqa	%xmm0, -89920(%rdx)
	movdqa	%xmm0, -89936(%rdx)
	movdqa	%xmm0, -89952(%rdx)
	movdqa	%xmm0, -89968(%rdx)
	movdqa	%xmm0, -89984(%rdx)
	movdqa	%xmm0, -90000(%rdx)
	movdqa	%xmm0, -90016(%rdx)
	movdqa	%xmm0, -90032(%rdx)
	movdqa	%xmm0, -90048(%rdx)
	movdqa	%xmm0, -90064(%rdx)
	movdqa	%xmm0, -90080(%rdx)
	movdqa	%xmm0, -90096(%rdx)
	movdqa	%xmm0, -90112(%rdx)
	movdqa	%xmm0, -85776(%rdx)
	movdqa	%xmm0, -85792(%rdx)
	movdqa	%xmm0, -85808(%rdx)
	movdqa	%xmm0, -85824(%rdx)
	movdqa	%xmm0, -85840(%rdx)
	movdqa	%xmm0, -85856(%rdx)
	movdqa	%xmm0, -85872(%rdx)
	movdqa	%xmm0, -85888(%rdx)
	movdqa	%xmm0, -85904(%rdx)
	movdqa	%xmm0, -85920(%rdx)
	movdqa	%xmm0, -85936(%rdx)
	movdqa	%xmm0, -85952(%rdx)
	movdqa	%xmm0, -85968(%rdx)
	movdqa	%xmm0, -85984(%rdx)
	movdqa	%xmm0, -86000(%rdx)
	movdqa	%xmm0, -86016(%rdx)
	movdqa	%xmm0, -81680(%rdx)
	movdqa	%xmm0, -81696(%rdx)
	movdqa	%xmm0, -81712(%rdx)
	movdqa	%xmm0, -81728(%rdx)
	movdqa	%xmm0, -81744(%rdx)
	movdqa	%xmm0, -81760(%rdx)
	movdqa	%xmm0, -81776(%rdx)
	movdqa	%xmm0, -81792(%rdx)
	movdqa	%xmm0, -81808(%rdx)
	movdqa	%xmm0, -81824(%rdx)
	movdqa	%xmm0, -81840(%rdx)
	movdqa	%xmm0, -81856(%rdx)
	movdqa	%xmm0, -81872(%rdx)
	movdqa	%xmm0, -81888(%rdx)
	movdqa	%xmm0, -81904(%rdx)
	movdqa	%xmm0, -81920(%rdx)
	movdqa	%xmm0, -77584(%rdx)
	movdqa	%xmm0, -77600(%rdx)
	movdqa	%xmm0, -77616(%rdx)
	movdqa	%xmm0, -77632(%rdx)
	movdqa	%xmm0, -77648(%rdx)
	movdqa	%xmm0, -77664(%rdx)
	movdqa	%xmm0, -77680(%rdx)
	movdqa	%xmm0, -77696(%rdx)
	movdqa	%xmm0, -77712(%rdx)
	movdqa	%xmm0, -77728(%rdx)
	movdqa	%xmm0, -77744(%rdx)
	movdqa	%xmm0, -77760(%rdx)
	movdqa	%xmm0, -77776(%rdx)
	movdqa	%xmm0, -77792(%rdx)
	movdqa	%xmm0, -77808(%rdx)
	movdqa	%xmm0, -77824(%rdx)
	movdqa	%xmm0, -73488(%rdx)
	movdqa	%xmm0, -73504(%rdx)
	movdqa	%xmm0, -73520(%rdx)
	movdqa	%xmm0, -73536(%rdx)
	movdqa	%xmm0, -73552(%rdx)
	movdqa	%xmm0, -73568(%rdx)
	movdqa	%xmm0, -73584(%rdx)
	movdqa	%xmm0, -73600(%rdx)
	movdqa	%xmm0, -73616(%rdx)
	movdqa	%xmm0, -73632(%rdx)
	movdqa	%xmm0, -73648(%rdx)
	movdqa	%xmm0, -73664(%rdx)
	movdqa	%xmm0, -73680(%rdx)
	movdqa	%xmm0, -73696(%rdx)
	movdqa	%xmm0, -73712(%rdx)
	movdqa	%xmm0, -73728(%rdx)
	movdqa	%xmm0, -69392(%rdx)
	movdqa	%xmm0, -69408(%rdx)
	movdqa	%xmm0, -69424(%rdx)
	movdqa	%xmm0, -69440(%rdx)
	movdqa	%xmm0, -69456(%rdx)
	movdqa	%xmm0, -69472(%rdx)
	movdqa	%xmm0, -69488(%rdx)
	movdqa	%xmm0, -69504(%rdx)
	movdqa	%xmm0, -69520(%rdx)
	movdqa	%xmm0, -69536(%rdx)
	movdqa	%xmm0, -69552(%rdx)
	movdqa	%xmm0, -69568(%rdx)
	movdqa	%xmm0, -69584(%rdx)
	movdqa	%xmm0, -69600(%rdx)
	movdqa	%xmm0, -69616(%rdx)
	movdqa	%xmm0, -69632(%rdx)
	movdqa	%xmm0, -65296(%rdx)
	movdqa	%xmm0, -65312(%rdx)
	movdqa	%xmm0, -65328(%rdx)
	movdqa	%xmm0, -65344(%rdx)
	movdqa	%xmm0, -65360(%rdx)
	movdqa	%xmm0, -65376(%rdx)
	movdqa	%xmm0, -65392(%rdx)
	movdqa	%xmm0, -65408(%rdx)
	movdqa	%xmm0, -65424(%rdx)
	movdqa	%xmm0, -65440(%rdx)
	movdqa	%xmm0, -65456(%rdx)
	movdqa	%xmm0, -65472(%rdx)
	movdqa	%xmm0, -65488(%rdx)
	movdqa	%xmm0, -65504(%rdx)
	movdqa	%xmm0, -65520(%rdx)
	movdqa	%xmm0, -65536(%rdx)
	movdqa	%xmm0, -61200(%rdx)
	movdqa	%xmm0, -61216(%rdx)
	movdqa	%xmm0, -61232(%rdx)
	movdqa	%xmm0, -61248(%rdx)
	movdqa	%xmm0, -61264(%rdx)
	movdqa	%xmm0, -61280(%rdx)
	movdqa	%xmm0, -61296(%rdx)
	movdqa	%xmm0, -61312(%rdx)
	movdqa	%xmm0, -61328(%rdx)
	movdqa	%xmm0, -61344(%rdx)
	movdqa	%xmm0, -61360(%rdx)
	movdqa	%xmm0, -61376(%rdx)
	movdqa	%xmm0, -61392(%rdx)
	movdqa	%xmm0, -61408(%rdx)
	movdqa	%xmm0, -61424(%rdx)
	movdqa	%xmm0, -61440(%rdx)
	movdqa	%xmm0, -57104(%rdx)
	movdqa	%xmm0, -57120(%rdx)
	movdqa	%xmm0, -57136(%rdx)
	movdqa	%xmm0, -57152(%rdx)
	movdqa	%xmm0, -57168(%rdx)
	movdqa	%xmm0, -57184(%rdx)
	movdqa	%xmm0, -57200(%rdx)
	movdqa	%xmm0, -57216(%rdx)
	movdqa	%xmm0, -57232(%rdx)
	movdqa	%xmm0, -57248(%rdx)
	movdqa	%xmm0, -57264(%rdx)
	movdqa	%xmm0, -57280(%rdx)
	movdqa	%xmm0, -57296(%rdx)
	movdqa	%xmm0, -57312(%rdx)
	movdqa	%xmm0, -57328(%rdx)
	movdqa	%xmm0, -57344(%rdx)
	movdqa	%xmm0, -53008(%rdx)
	movdqa	%xmm0, -53024(%rdx)
	movdqa	%xmm0, -53040(%rdx)
	movdqa	%xmm0, -53056(%rdx)
	movdqa	%xmm0, -53072(%rdx)
	movdqa	%xmm0, -53088(%rdx)
	movdqa	%xmm0, -53104(%rdx)
	movdqa	%xmm0, -53120(%rdx)
	movdqa	%xmm0, -53136(%rdx)
	movdqa	%xmm0, -53152(%rdx)
	movdqa	%xmm0, -53168(%rdx)
	movdqa	%xmm0, -53184(%rdx)
	movdqa	%xmm0, -53200(%rdx)
	movdqa	%xmm0, -53216(%rdx)
	movdqa	%xmm0, -53232(%rdx)
	movdqa	%xmm0, -53248(%rdx)
	movdqa	%xmm0, -48912(%rdx)
	movdqa	%xmm0, -48928(%rdx)
	movdqa	%xmm0, -48944(%rdx)
	movdqa	%xmm0, -48960(%rdx)
	movdqa	%xmm0, -48976(%rdx)
	movdqa	%xmm0, -48992(%rdx)
	movdqa	%xmm0, -49008(%rdx)
	movdqa	%xmm0, -49024(%rdx)
	movdqa	%xmm0, -49040(%rdx)
	movdqa	%xmm0, -49056(%rdx)
	movdqa	%xmm0, -49072(%rdx)
	movdqa	%xmm0, -49088(%rdx)
	movdqa	%xmm0, -49104(%rdx)
	movdqa	%xmm0, -49120(%rdx)
	movdqa	%xmm0, -49136(%rdx)
	movdqa	%xmm0, -49152(%rdx)
	movdqa	%xmm0, -44816(%rdx)
	movdqa	%xmm0, -44832(%rdx)
	movdqa	%xmm0, -44848(%rdx)
	movdqa	%xmm0, -44864(%rdx)
	movdqa	%xmm0, -44880(%rdx)
	movdqa	%xmm0, -44896(%rdx)
	movdqa	%xmm0, -44912(%rdx)
	movdqa	%xmm0, -44928(%rdx)
	movdqa	%xmm0, -44944(%rdx)
	movdqa	%xmm0, -44960(%rdx)
	movdqa	%xmm0, -44976(%rdx)
	movdqa	%xmm0, -44992(%rdx)
	movdqa	%xmm0, -45008(%rdx)
	movdqa	%xmm0, -45024(%rdx)
	movdqa	%xmm0, -45040(%rdx)
	movdqa	%xmm0, -45056(%rdx)
	movdqa	%xmm0, -40720(%rdx)
	movdqa	%xmm0, -40736(%rdx)
	movdqa	%xmm0, -40752(%rdx)
	movdqa	%xmm0, -40768(%rdx)
	movdqa	%xmm0, -40784(%rdx)
	movdqa	%xmm0, -40800(%rdx)
	movdqa	%xmm0, -40816(%rdx)
	movdqa	%xmm0, -40832(%rdx)
	movdqa	%xmm0, -40848(%rdx)
	movdqa	%xmm0, -40864(%rdx)
	movdqa	%xmm0, -40880(%rdx)
	movdqa	%xmm0, -40896(%rdx)
	movdqa	%xmm0, -40912(%rdx)
	movdqa	%xmm0, -40928(%rdx)
	movdqa	%xmm0, -40944(%rdx)
	movdqa	%xmm0, -40960(%rdx)
	movdqa	%xmm0, -36624(%rdx)
	movdqa	%xmm0, -36640(%rdx)
	movdqa	%xmm0, -36656(%rdx)
	movdqa	%xmm0, -36672(%rdx)
	movdqa	%xmm0, -36688(%rdx)
	movdqa	%xmm0, -36704(%rdx)
	movdqa	%xmm0, -36720(%rdx)
	movdqa	%xmm0, -36736(%rdx)
	movdqa	%xmm0, -36752(%rdx)
	movdqa	%xmm0, -36768(%rdx)
	movdqa	%xmm0, -36784(%rdx)
	movdqa	%xmm0, -36800(%rdx)
	movdqa	%xmm0, -36816(%rdx)
	movdqa	%xmm0, -36832(%rdx)
	movdqa	%xmm0, -36848(%rdx)
	movdqa	%xmm0, -36864(%rdx)
	movdqa	%xmm0, -32528(%rdx)
	movdqa	%xmm0, -32544(%rdx)
	movdqa	%xmm0, -32560(%rdx)
	movdqa	%xmm0, -32576(%rdx)
	movdqa	%xmm0, -32592(%rdx)
	movdqa	%xmm0, -32608(%rdx)
	movdqa	%xmm0, -32624(%rdx)
	movdqa	%xmm0, -32640(%rdx)
	movdqa	%xmm0, -32656(%rdx)
	movdqa	%xmm0, -32672(%rdx)
	movdqa	%xmm0, -32688(%rdx)
	movdqa	%xmm0, -32704(%rdx)
	movdqa	%xmm0, -32720(%rdx)
	movdqa	%xmm0, -32736(%rdx)
	movdqa	%xmm0, -32752(%rdx)
	movdqa	%xmm0, -32768(%rdx)
	movdqa	%xmm0, -28432(%rdx)
	movdqa	%xmm0, -28448(%rdx)
	movdqa	%xmm0, -28464(%rdx)
	movdqa	%xmm0, -28480(%rdx)
	movdqa	%xmm0, -28496(%rdx)
	movdqa	%xmm0, -28512(%rdx)
	movdqa	%xmm0, -28528(%rdx)
	movdqa	%xmm0, -28544(%rdx)
	movdqa	%xmm0, -28560(%rdx)
	movdqa	%xmm0, -28576(%rdx)
	movdqa	%xmm0, -28592(%rdx)
	movdqa	%xmm0, -28608(%rdx)
	movdqa	%xmm0, -28624(%rdx)
	movdqa	%xmm0, -28640(%rdx)
	movdqa	%xmm0, -28656(%rdx)
	movdqa	%xmm0, -28672(%rdx)
	movdqa	%xmm0, -24336(%rdx)
	movdqa	%xmm0, -24352(%rdx)
	movdqa	%xmm0, -24368(%rdx)
	movdqa	%xmm0, -24384(%rdx)
	movdqa	%xmm0, -24400(%rdx)
	movdqa	%xmm0, -24416(%rdx)
	movdqa	%xmm0, -24432(%rdx)
	movdqa	%xmm0, -24448(%rdx)
	movdqa	%xmm0, -24464(%rdx)
	movdqa	%xmm0, -24480(%rdx)
	movdqa	%xmm0, -24496(%rdx)
	movdqa	%xmm0, -24512(%rdx)
	movdqa	%xmm0, -24528(%rdx)
	movdqa	%xmm0, -24544(%rdx)
	movdqa	%xmm0, -24560(%rdx)
	movdqa	%xmm0, -24576(%rdx)
	movdqa	%xmm0, -20240(%rdx)
	movdqa	%xmm0, -20256(%rdx)
	movdqa	%xmm0, -20272(%rdx)
	movdqa	%xmm0, -20288(%rdx)
	movdqa	%xmm0, -20304(%rdx)
	movdqa	%xmm0, -20320(%rdx)
	movdqa	%xmm0, -20336(%rdx)
	movdqa	%xmm0, -20352(%rdx)
	movdqa	%xmm0, -20368(%rdx)
	movdqa	%xmm0, -20384(%rdx)
	movdqa	%xmm0, -20400(%rdx)
	movdqa	%xmm0, -20416(%rdx)
	movdqa	%xmm0, -20432(%rdx)
	movdqa	%xmm0, -20448(%rdx)
	movdqa	%xmm0, -20464(%rdx)
	movdqa	%xmm0, -20480(%rdx)
	movdqa	%xmm0, -16144(%rdx)
	movdqa	%xmm0, -16160(%rdx)
	movdqa	%xmm0, -16176(%rdx)
	movdqa	%xmm0, -16192(%rdx)
	movdqa	%xmm0, -16208(%rdx)
	movdqa	%xmm0, -16224(%rdx)
	movdqa	%xmm0, -16240(%rdx)
	movdqa	%xmm0, -16256(%rdx)
	movdqa	%xmm0, -16272(%rdx)
	movdqa	%xmm0, -16288(%rdx)
	movdqa	%xmm0, -16304(%rdx)
	movdqa	%xmm0, -16320(%rdx)
	movdqa	%xmm0, -16336(%rdx)
	movdqa	%xmm0, -16352(%rdx)
	movdqa	%xmm0, -16368(%rdx)
	movdqa	%xmm0, -16384(%rdx)
	movdqa	%xmm0, -12048(%rdx)
	movdqa	%xmm0, -12064(%rdx)
	movdqa	%xmm0, -12080(%rdx)
	movdqa	%xmm0, -12096(%rdx)
	movdqa	%xmm0, -12112(%rdx)
	movdqa	%xmm0, -12128(%rdx)
	movdqa	%xmm0, -12144(%rdx)
	movdqa	%xmm0, -12160(%rdx)
	movdqa	%xmm0, -12176(%rdx)
	movdqa	%xmm0, -12192(%rdx)
	movdqa	%xmm0, -12208(%rdx)
	movdqa	%xmm0, -12224(%rdx)
	movdqa	%xmm0, -12240(%rdx)
	movdqa	%xmm0, -12256(%rdx)
	movdqa	%xmm0, -12272(%rdx)
	movdqa	%xmm0, -12288(%rdx)
	movdqa	%xmm0, -7952(%rdx)
	movdqa	%xmm0, -7968(%rdx)
	movdqa	%xmm0, -7984(%rdx)
	movdqa	%xmm0, -8000(%rdx)
	movdqa	%xmm0, -8016(%rdx)
	movdqa	%xmm0, -8032(%rdx)
	movdqa	%xmm0, -8048(%rdx)
	movdqa	%xmm0, -8064(%rdx)
	movdqa	%xmm0, -8080(%rdx)
	movdqa	%xmm0, -8096(%rdx)
	movdqa	%xmm0, -8112(%rdx)
	movdqa	%xmm0, -8128(%rdx)
	movdqa	%xmm0, -8144(%rdx)
	movdqa	%xmm0, -8160(%rdx)
	movdqa	%xmm0, -8176(%rdx)
	movdqa	%xmm0, -8192(%rdx)
	movdqa	%xmm0, -3856(%rdx)
	movdqa	%xmm0, -3872(%rdx)
	movdqa	%xmm0, -3888(%rdx)
	movdqa	%xmm0, -3904(%rdx)
	movdqa	%xmm0, -3920(%rdx)
	movdqa	%xmm0, -3936(%rdx)
	movdqa	%xmm0, -3952(%rdx)
	movdqa	%xmm0, -3968(%rdx)
	movdqa	%xmm0, -3984(%rdx)
	movdqa	%xmm0, -4000(%rdx)
	movdqa	%xmm0, -4016(%rdx)
	movdqa	%xmm0, -4032(%rdx)
	movdqa	%xmm0, -4048(%rdx)
	movdqa	%xmm0, -4064(%rdx)
	movdqa	%xmm0, -4080(%rdx)
	movdqa	%xmm0, -4096(%rdx)
	movdqa	%xmm0, 240(%rdx)
	movdqa	%xmm0, 224(%rdx)
	movdqa	%xmm0, 208(%rdx)
	movdqa	%xmm0, 192(%rdx)
	movdqa	%xmm0, 176(%rdx)
	movdqa	%xmm0, 160(%rdx)
	movdqa	%xmm0, 144(%rdx)
	movdqa	%xmm0, 128(%rdx)
	movdqa	%xmm0, 112(%rdx)
	movdqa	%xmm0, 96(%rdx)
	movdqa	%xmm0, 80(%rdx)
	movdqa	%xmm0, 64(%rdx)
	movdqa	%xmm0, 48(%rdx)
	movdqa	%xmm0, 32(%rdx)
	movdqa	%xmm0, 16(%rdx)
	movdqa	%xmm0, (%rdx)
	addq	$256, %rdx              # imm = 0x100
	decq	%rsi
	jne	.LBB1_3
# BB#1:                                 # %polly.loop_exit3
                                        #   in Loop: Header=BB1_2 Depth=1
	incq	%rax
	addq	$131072, %rcx           # imm = 0x20000
	cmpq	$16, %rax
	jne	.LBB1_2
# BB#6:                                 # %polly.split_new_and_old
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
	subq	$80, %rsp
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
	movl	$C, %ecx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_7:                                # %polly.loop_preheader91
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_8 Depth 2
                                        #       Child Loop BB1_9 Depth 3
                                        #         Child Loop BB1_10 Depth 4
                                        #           Child Loop BB1_11 Depth 5
	movq	%rax, -56(%rbp)         # 8-byte Spill
	movq	%rcx, -64(%rbp)         # 8-byte Spill
	shlq	$17, %rax
	leaq	A(%rax), %rdx
	movq	%rdx, -144(%rbp)        # 8-byte Spill
	leaq	A+32(%rax), %rdx
	movq	%rdx, -136(%rbp)        # 8-byte Spill
	leaq	A+64(%rax), %rdx
	movq	%rdx, -128(%rbp)        # 8-byte Spill
	leaq	A+96(%rax), %rdx
	movq	%rdx, -120(%rbp)        # 8-byte Spill
	leaq	A+128(%rax), %rdx
	movq	%rdx, -112(%rbp)        # 8-byte Spill
	leaq	A+160(%rax), %rdx
	movq	%rdx, -104(%rbp)        # 8-byte Spill
	leaq	A+192(%rax), %rdx
	movq	%rdx, -96(%rbp)         # 8-byte Spill
	leaq	A+224(%rax), %rax
	movq	%rax, -88(%rbp)         # 8-byte Spill
	movl	$B+126976, %r10d
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_8:                                # %polly.loop_header90
                                        #   Parent Loop BB1_7 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_9 Depth 3
                                        #         Child Loop BB1_10 Depth 4
                                        #           Child Loop BB1_11 Depth 5
	movq	%rcx, -72(%rbp)         # 8-byte Spill
	movq	%r10, -80(%rbp)         # 8-byte Spill
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB1_9:                                # %polly.loop_preheader103
                                        #   Parent Loop BB1_7 Depth=1
                                        #     Parent Loop BB1_8 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_10 Depth 4
                                        #           Child Loop BB1_11 Depth 5
	movq	%r8, -152(%rbp)         # 8-byte Spill
	shlq	$8, %r8
	movq	-144(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%r8), %rax
	movq	%rax, -184(%rbp)        # 8-byte Spill
	movq	-136(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%r8), %rax
	movq	%rax, -176(%rbp)        # 8-byte Spill
	movq	-128(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%r8), %rax
	movq	%rax, -168(%rbp)        # 8-byte Spill
	movq	-120(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%r8), %rax
	movq	%rax, -160(%rbp)        # 8-byte Spill
	movq	-112(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%r8), %r15
	movq	-104(%rbp), %rax        # 8-byte Reload
	leaq	(%rax,%r8), %r13
	movq	-96(%rbp), %rax         # 8-byte Reload
	leaq	(%rax,%r8), %r11
	addq	-88(%rbp), %r8          # 8-byte Folded Reload
	movq	-48(%rbp), %rdi         # 8-byte Reload
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB1_10:                               # %polly.stmt.polly.loop_preheader47
                                        #   Parent Loop BB1_7 Depth=1
                                        #     Parent Loop BB1_8 Depth=2
                                        #       Parent Loop BB1_9 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB1_11 Depth 5
	movq	%rsi, %rax
	shlq	$12, %rax
	movq	-184(%rbp), %rcx        # 8-byte Reload
	pshufd	$78, 16(%rcx,%rax), %xmm0 # xmm0 = mem[2,3,0,1]
	movq	-176(%rbp), %rcx        # 8-byte Reload
	pshufd	$78, 16(%rcx,%rax), %xmm1 # xmm1 = mem[2,3,0,1]
	movq	-168(%rbp), %rcx        # 8-byte Reload
	pshufd	$78, 16(%rcx,%rax), %xmm2 # xmm2 = mem[2,3,0,1]
	movq	-160(%rbp), %rcx        # 8-byte Reload
	pshufd	$78, 16(%rcx,%rax), %xmm3 # xmm3 = mem[2,3,0,1]
	pshufd	$78, 16(%r15,%rax), %xmm4 # xmm4 = mem[2,3,0,1]
	pshufd	$78, 16(%r13,%rax), %xmm5 # xmm5 = mem[2,3,0,1]
	pshufd	$78, 16(%r11,%rax), %xmm6 # xmm6 = mem[2,3,0,1]
	pshufd	$78, 16(%r8,%rax), %xmm7 # xmm7 = mem[2,3,0,1]
	movq	%xmm0, -192(%rbp)
	movq	%xmm1, -200(%rbp)
	movq	%xmm2, -208(%rbp)
	movq	%xmm3, -216(%rbp)
	movq	%xmm4, -224(%rbp)
	movq	%xmm5, -232(%rbp)
	movq	%xmm6, -240(%rbp)
	movq	%xmm7, -248(%rbp)
	movq	$-31, %r9
	movq	%r10, %rax
	movq	%rdi, %rdx
	.p2align	4, 0x90
.LBB1_11:                               # %polly.stmt.polly.loop_preheader53
                                        #   Parent Loop BB1_7 Depth=1
                                        #     Parent Loop BB1_8 Depth=2
                                        #       Parent Loop BB1_9 Depth=3
                                        #         Parent Loop BB1_10 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	movq	-114688(%rax), %r14
	imulq	-192(%rbp), %r14
	addq	(%rdx), %r14
	movq	-98304(%rax), %r12
	imulq	-200(%rbp), %r12
	addq	%r14, %r12
	movq	-81920(%rax), %rbx
	imulq	-208(%rbp), %rbx
	addq	%r12, %rbx
	movq	-65536(%rax), %rcx
	imulq	-216(%rbp), %rcx
	addq	%rbx, %rcx
	movq	-49152(%rax), %rbx
	imulq	-224(%rbp), %rbx
	addq	%rcx, %rbx
	movq	-32768(%rax), %rcx
	imulq	-232(%rbp), %rcx
	addq	%rbx, %rcx
	movq	-16384(%rax), %rbx
	imulq	-240(%rbp), %rbx
	addq	%rcx, %rbx
	movq	(%rax), %rcx
	imulq	-248(%rbp), %rcx
	addq	%rbx, %rcx
	movq	%rcx, (%rdx)
	leaq	1(%r9), %rcx
	addq	$31, %r9
	addq	$8, %rdx
	addq	$8, %rax
	cmpq	$31, %r9
	movq	%rcx, %r9
	jl	.LBB1_11
# BB#12:                                # %polly.loop_exit141
                                        #   in Loop: Header=BB1_10 Depth=4
	addq	$4096, %rdi             # imm = 0x1000
	cmpq	$31, %rsi
	leaq	1(%rsi), %rsi
	jl	.LBB1_10
# BB#13:                                # %polly.loop_exit104
                                        #   in Loop: Header=BB1_9 Depth=3
	addq	$131072, %r10           # imm = 0x20000
	movq	-152(%rbp), %r8         # 8-byte Reload
	cmpq	$15, %r8
	leaq	1(%r8), %r8
	jl	.LBB1_9
# BB#14:                                # %polly.loop_exit98
                                        #   in Loop: Header=BB1_8 Depth=2
	addq	$256, -48(%rbp)         # 8-byte Folded Spill
                                        # imm = 0x100
	movq	-80(%rbp), %r10         # 8-byte Reload
	addq	$256, %r10              # imm = 0x100
	movq	-72(%rbp), %rcx         # 8-byte Reload
	cmpq	$15, %rcx
	leaq	1(%rcx), %rcx
	jl	.LBB1_8
# BB#4:                                 # %polly.loop_exit92
                                        #   in Loop: Header=BB1_7 Depth=1
	movq	-64(%rbp), %rcx         # 8-byte Reload
	addq	$131072, %rcx           # imm = 0x20000
	movq	-56(%rbp), %rax         # 8-byte Reload
	cmpq	$15, %rax
	leaq	1(%rax), %rax
	jl	.LBB1_7
# BB#5:                                 # %polly.exiting
.Ltmp18:
	.loc	1 29 1 prologue_end     # MatrixMult.c:29:1
	addq	$80, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp19:
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
.Ltmp20:
	.cfi_def_cfa_offset 16
.Ltmp21:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp22:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
.Ltmp23:
	.cfi_offset %rbx, -48
.Ltmp24:
	.cfi_offset %r12, -40
.Ltmp25:
	.cfi_offset %r14, -32
.Ltmp26:
	.cfi_offset %r15, -24
	movl	$C, %r14d
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB2_1:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
.Ltmp27:
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
.Ltmp28:
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
.Ltmp29:
	.loc	1 38 17 is_stmt 0       # MatrixMult.c:38:17
	cmpl	$79, %eax
	jne	.LBB2_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB2_2 Depth=2
.Ltmp30:
	.loc	1 38 37 discriminator 1 # MatrixMult.c:38:37
	movq	stdout(%rip), %rsi
	.loc	1 38 29 discriminator 1 # MatrixMult.c:38:29
	movl	$10, %edi
	callq	fputc
.Ltmp31:
.LBB2_4:                                # %for.inc
                                        #   in Loop: Header=BB2_2 Depth=2
	.loc	1 36 9 is_stmt 1 discriminator 1 # MatrixMult.c:36:9
	incq	%rbx
.Ltmp32:
	.loc	1 37 21                 # MatrixMult.c:37:21
	movq	stdout(%rip), %rcx
.Ltmp33:
	.loc	1 36 9 discriminator 1  # MatrixMult.c:36:9
	addq	$8, %r12
	cmpq	$512, %rbx              # imm = 0x200
	jne	.LBB2_2
.Ltmp34:
# BB#5:                                 # %for.end
                                        #   in Loop: Header=BB2_1 Depth=1
	.loc	1 40 9                  # MatrixMult.c:40:9
	movl	$10, %edi
	movq	%rcx, %rsi
	callq	fputc
.Ltmp35:
	.loc	1 35 5 discriminator 1  # MatrixMult.c:35:5
	incq	%r15
	addq	$4096, %r14             # imm = 0x1000
	cmpq	$512, %r15              # imm = 0x200
	jne	.LBB2_1
.Ltmp36:
# BB#6:                                 # %for.end11
	.loc	1 42 1                  # MatrixMult.c:42:1
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp37:
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
.Ltmp38:
	.loc	1 13 21 prologue_end    # MatrixMult.c:13:21
	movaps	.LCPI3_0(%rip), %xmm0   # xmm0 = [1,1]
.Ltmp39:
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
.Ltmp40:
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
.Ltmp41:
	.loc	1 12 9 discriminator 1  # MatrixMult.c:12:9
	addq	$64, %rdx
	addq	$-8, %rsi
	jne	.LBB3_2
.Ltmp42:
# BB#3:                                 # %for.inc10.i
                                        #   in Loop: Header=BB3_1 Depth=1
	.loc	1 11 5 discriminator 1  # MatrixMult.c:11:5
	incq	%rcx
	addq	$4096, %rax             # imm = 0x1000
	cmpq	$512, %rcx              # imm = 0x200
	jne	.LBB3_1
.Ltmp43:
# BB#4:                                 # %init_array.exit
	pushq	%rbp
.Ltmp44:
	.cfi_def_cfa_offset 16
.Ltmp45:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp46:
	.cfi_def_cfa_register %rbp
	.loc	1 52 5                  # MatrixMult.c:52:5
	callq	mat_mult
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
	popq	%rbp
	retq
.Ltmp47:
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
	.long	249                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0xf2 DW_TAG_compile_unit
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
	.long	200                     # DW_AT_abstract_origin
	.byte	8                       # Abbrev [8] 0x9e:0x15 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
                                        # DW_AT_external
	.byte	8                       # Abbrev [8] 0xb3:0x15 DW_TAG_subprogram
	.quad	.Lfunc_begin2           # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
                                        # DW_AT_external
	.byte	9                       # Abbrev [9] 0xc8:0x8 DW_TAG_subprogram
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	7                       # DW_AT_decl_line
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	10                      # Abbrev [10] 0xd0:0x25 DW_TAG_subprogram
	.quad	.Lfunc_begin3           # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	44                      # DW_AT_decl_line
	.long	245                     # DW_AT_type
                                        # DW_AT_external
	.byte	11                      # Abbrev [11] 0xe9:0xb DW_TAG_inlined_subroutine
	.long	200                     # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	51                      # DW_AT_call_line
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0xf5:0x7 DW_TAG_base_type
	.long	.Linfo_string12         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
.Ldebug_ranges0:
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
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
	.long	253                     # Compilation Unit Length
	.long	42                      # DIE offset
	.asciz	"A"                     # External Name
	.long	97                      # DIE offset
	.asciz	"B"                     # External Name
	.long	118                     # DIE offset
	.asciz	"C"                     # External Name
	.long	158                     # DIE offset
	.asciz	"mat_mult"              # External Name
	.long	200                     # DIE offset
	.asciz	"init_array"            # External Name
	.long	208                     # DIE offset
	.asciz	"main"                  # External Name
	.long	179                     # DIE offset
	.asciz	"print_array"           # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	253                     # Compilation Unit Length
	.long	83                      # DIE offset
	.asciz	"long long int"         # External Name
	.long	245                     # DIE offset
	.asciz	"int"                   # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
