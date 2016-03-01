	.text
	.file	"VectorMult.polly.ll"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI0_0:
	.long	256                     # 0x100
	.long	256                     # 0x100
	.long	256                     # 0x100
	.long	256                     # 0x100
.LCPI0_1:
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	1                       # 0x1
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
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
	xorl	%ecx, %ecx
	movaps	.LCPI0_0(%rip), %xmm0   # xmm0 = [256,256,256,256]
	movl	$8388608, %eax          # imm = 0x800000
	.p2align	4, 0x90
.LBB0_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movaps	%xmm0, sum(%rcx)
	movaps	%xmm0, sum+16(%rcx)
	movaps	%xmm0, sum+32(%rcx)
	movaps	%xmm0, sum+48(%rcx)
	movaps	%xmm0, sum+64(%rcx)
	movaps	%xmm0, sum+80(%rcx)
	movaps	%xmm0, sum+96(%rcx)
	movaps	%xmm0, sum+112(%rcx)
	movaps	%xmm0, sum+128(%rcx)
	movaps	%xmm0, sum+144(%rcx)
	movaps	%xmm0, sum+160(%rcx)
	movaps	%xmm0, sum+176(%rcx)
	movaps	%xmm0, sum+192(%rcx)
	movaps	%xmm0, sum+208(%rcx)
	movaps	%xmm0, sum+224(%rcx)
	movaps	%xmm0, sum+240(%rcx)
	addq	$256, %rcx              # imm = 0x100
	cmpq	$1073741824, %rcx       # imm = 0x40000000
	jne	.LBB0_1
	.p2align	4, 0x90
.LBB0_2:                                # %vector.body41
                                        # =>This Inner Loop Header: Depth=1
	decq	%rax
	jne	.LBB0_2
# BB#3:                                 # %vector.ph57.preheader
	movdqa	.LCPI0_1(%rip), %xmm0   # xmm0 = [1,1,1,1]
	movdqa	%xmm0, u(%rip)
	movdqa	%xmm0, v(%rip)
	movdqa	%xmm0, p(%rip)
	movdqa	%xmm0, u+16(%rip)
	movdqa	%xmm0, v+16(%rip)
	movdqa	%xmm0, p+16(%rip)
	movdqa	%xmm0, u+32(%rip)
	movdqa	%xmm0, v+32(%rip)
	movdqa	%xmm0, p+32(%rip)
	movdqa	%xmm0, u+48(%rip)
	movdqa	%xmm0, v+48(%rip)
	movdqa	%xmm0, p+48(%rip)
	movdqa	%xmm0, u+64(%rip)
	movdqa	%xmm0, v+64(%rip)
	movdqa	%xmm0, p+64(%rip)
	movdqa	%xmm0, u+80(%rip)
	movdqa	%xmm0, v+80(%rip)
	movdqa	%xmm0, p+80(%rip)
	movdqa	%xmm0, u+96(%rip)
	movdqa	%xmm0, v+96(%rip)
	movdqa	%xmm0, p+96(%rip)
	movdqa	%xmm0, u+112(%rip)
	movdqa	%xmm0, v+112(%rip)
	movdqa	%xmm0, p+112(%rip)
	movl	$8388608, %eax          # imm = 0x800000
	.p2align	4, 0x90
.LBB0_4:                                # %vector.body53
                                        # =>This Inner Loop Header: Depth=1
	decq	%rax
	jne	.LBB0_4
# BB#5:                                 # %vector.ph69.preheader
	movdqa	%xmm0, u+128(%rip)
	movdqa	%xmm0, v+128(%rip)
	movdqa	%xmm0, p+128(%rip)
	movdqa	%xmm0, u+144(%rip)
	movdqa	%xmm0, v+144(%rip)
	movdqa	%xmm0, p+144(%rip)
	movdqa	%xmm0, u+160(%rip)
	movdqa	%xmm0, v+160(%rip)
	movdqa	%xmm0, p+160(%rip)
	movdqa	%xmm0, u+176(%rip)
	movdqa	%xmm0, v+176(%rip)
	movdqa	%xmm0, p+176(%rip)
	movdqa	%xmm0, u+192(%rip)
	movdqa	%xmm0, v+192(%rip)
	movdqa	%xmm0, p+192(%rip)
	movdqa	%xmm0, u+208(%rip)
	movdqa	%xmm0, v+208(%rip)
	movdqa	%xmm0, p+208(%rip)
	movdqa	%xmm0, u+224(%rip)
	movdqa	%xmm0, v+224(%rip)
	movdqa	%xmm0, p+224(%rip)
	movdqa	%xmm0, u+240(%rip)
	movdqa	%xmm0, v+240(%rip)
	movdqa	%xmm0, p+240(%rip)
	movl	$8388608, %eax          # imm = 0x800000
	.p2align	4, 0x90
.LBB0_6:                                # %vector.body65
                                        # =>This Inner Loop Header: Depth=1
	decq	%rax
	jne	.LBB0_6
# BB#7:                                 # %vector.ph81.preheader
	movdqa	%xmm0, u+256(%rip)
	movdqa	%xmm0, v+256(%rip)
	movdqa	%xmm0, p+256(%rip)
	movdqa	%xmm0, u+272(%rip)
	movdqa	%xmm0, v+272(%rip)
	movdqa	%xmm0, p+272(%rip)
	movdqa	%xmm0, u+288(%rip)
	movdqa	%xmm0, v+288(%rip)
	movdqa	%xmm0, p+288(%rip)
	movdqa	%xmm0, u+304(%rip)
	movdqa	%xmm0, v+304(%rip)
	movdqa	%xmm0, p+304(%rip)
	movdqa	%xmm0, u+320(%rip)
	movdqa	%xmm0, v+320(%rip)
	movdqa	%xmm0, p+320(%rip)
	movdqa	%xmm0, u+336(%rip)
	movdqa	%xmm0, v+336(%rip)
	movdqa	%xmm0, p+336(%rip)
	movdqa	%xmm0, u+352(%rip)
	movdqa	%xmm0, v+352(%rip)
	movdqa	%xmm0, p+352(%rip)
	movdqa	%xmm0, u+368(%rip)
	movdqa	%xmm0, v+368(%rip)
	movdqa	%xmm0, p+368(%rip)
	movl	$8388608, %eax          # imm = 0x800000
	.p2align	4, 0x90
.LBB0_8:                                # %vector.body77
                                        # =>This Inner Loop Header: Depth=1
	decq	%rax
	jne	.LBB0_8
# BB#9:                                 # %vector.ph93.preheader
	movdqa	%xmm0, u+384(%rip)
	movdqa	%xmm0, v+384(%rip)
	movdqa	%xmm0, p+384(%rip)
	movdqa	%xmm0, u+400(%rip)
	movdqa	%xmm0, v+400(%rip)
	movdqa	%xmm0, p+400(%rip)
	movdqa	%xmm0, u+416(%rip)
	movdqa	%xmm0, v+416(%rip)
	movdqa	%xmm0, p+416(%rip)
	movdqa	%xmm0, u+432(%rip)
	movdqa	%xmm0, v+432(%rip)
	movdqa	%xmm0, p+432(%rip)
	movdqa	%xmm0, u+448(%rip)
	movdqa	%xmm0, v+448(%rip)
	movdqa	%xmm0, p+448(%rip)
	movdqa	%xmm0, u+464(%rip)
	movdqa	%xmm0, v+464(%rip)
	movdqa	%xmm0, p+464(%rip)
	movdqa	%xmm0, u+480(%rip)
	movdqa	%xmm0, v+480(%rip)
	movdqa	%xmm0, p+480(%rip)
	movdqa	%xmm0, u+496(%rip)
	movdqa	%xmm0, v+496(%rip)
	movdqa	%xmm0, p+496(%rip)
	movl	$8388608, %eax          # imm = 0x800000
	.p2align	4, 0x90
.LBB0_10:                               # %vector.body89
                                        # =>This Inner Loop Header: Depth=1
	decq	%rax
	jne	.LBB0_10
# BB#11:                                # %vector.ph105.preheader
	movdqa	%xmm0, u+512(%rip)
	movdqa	%xmm0, v+512(%rip)
	movdqa	%xmm0, p+512(%rip)
	movdqa	%xmm0, u+528(%rip)
	movdqa	%xmm0, v+528(%rip)
	movdqa	%xmm0, p+528(%rip)
	movdqa	%xmm0, u+544(%rip)
	movdqa	%xmm0, v+544(%rip)
	movdqa	%xmm0, p+544(%rip)
	movdqa	%xmm0, u+560(%rip)
	movdqa	%xmm0, v+560(%rip)
	movdqa	%xmm0, p+560(%rip)
	movdqa	%xmm0, u+576(%rip)
	movdqa	%xmm0, v+576(%rip)
	movdqa	%xmm0, p+576(%rip)
	movdqa	%xmm0, u+592(%rip)
	movdqa	%xmm0, v+592(%rip)
	movdqa	%xmm0, p+592(%rip)
	movdqa	%xmm0, u+608(%rip)
	movdqa	%xmm0, v+608(%rip)
	movdqa	%xmm0, p+608(%rip)
	movdqa	%xmm0, u+624(%rip)
	movdqa	%xmm0, v+624(%rip)
	movdqa	%xmm0, p+624(%rip)
	movl	$8388608, %eax          # imm = 0x800000
	.p2align	4, 0x90
.LBB0_12:                               # %vector.body101
                                        # =>This Inner Loop Header: Depth=1
	decq	%rax
	jne	.LBB0_12
# BB#13:                                # %vector.ph117.preheader
	movdqa	%xmm0, u+640(%rip)
	movdqa	%xmm0, v+640(%rip)
	movdqa	%xmm0, p+640(%rip)
	movdqa	%xmm0, u+656(%rip)
	movdqa	%xmm0, v+656(%rip)
	movdqa	%xmm0, p+656(%rip)
	movdqa	%xmm0, u+672(%rip)
	movdqa	%xmm0, v+672(%rip)
	movdqa	%xmm0, p+672(%rip)
	movdqa	%xmm0, u+688(%rip)
	movdqa	%xmm0, v+688(%rip)
	movdqa	%xmm0, p+688(%rip)
	movdqa	%xmm0, u+704(%rip)
	movdqa	%xmm0, v+704(%rip)
	movdqa	%xmm0, p+704(%rip)
	movdqa	%xmm0, u+720(%rip)
	movdqa	%xmm0, v+720(%rip)
	movdqa	%xmm0, p+720(%rip)
	movdqa	%xmm0, u+736(%rip)
	movdqa	%xmm0, v+736(%rip)
	movdqa	%xmm0, p+736(%rip)
	movdqa	%xmm0, u+752(%rip)
	movdqa	%xmm0, v+752(%rip)
	movdqa	%xmm0, p+752(%rip)
	movl	$8388608, %eax          # imm = 0x800000
	.p2align	4, 0x90
.LBB0_14:                               # %vector.body113
                                        # =>This Inner Loop Header: Depth=1
	decq	%rax
	jne	.LBB0_14
# BB#15:                                # %vector.ph129.preheader
	movdqa	%xmm0, u+768(%rip)
	movdqa	%xmm0, v+768(%rip)
	movdqa	%xmm0, p+768(%rip)
	movdqa	%xmm0, u+784(%rip)
	movdqa	%xmm0, v+784(%rip)
	movdqa	%xmm0, p+784(%rip)
	movdqa	%xmm0, u+800(%rip)
	movdqa	%xmm0, v+800(%rip)
	movdqa	%xmm0, p+800(%rip)
	movdqa	%xmm0, u+816(%rip)
	movdqa	%xmm0, v+816(%rip)
	movdqa	%xmm0, p+816(%rip)
	movdqa	%xmm0, u+832(%rip)
	movdqa	%xmm0, v+832(%rip)
	movdqa	%xmm0, p+832(%rip)
	movdqa	%xmm0, u+848(%rip)
	movdqa	%xmm0, v+848(%rip)
	movdqa	%xmm0, p+848(%rip)
	movdqa	%xmm0, u+864(%rip)
	movdqa	%xmm0, v+864(%rip)
	movdqa	%xmm0, p+864(%rip)
	movdqa	%xmm0, u+880(%rip)
	movdqa	%xmm0, v+880(%rip)
	movdqa	%xmm0, p+880(%rip)
	movl	$8388608, %eax          # imm = 0x800000
	.p2align	4, 0x90
.LBB0_16:                               # %vector.body125
                                        # =>This Inner Loop Header: Depth=1
	decq	%rax
	jne	.LBB0_16
# BB#17:                                # %vector.body137.preheader
	movdqa	%xmm0, u+896(%rip)
	movdqa	%xmm0, v+896(%rip)
	movdqa	%xmm0, p+896(%rip)
	movdqa	%xmm0, u+912(%rip)
	movdqa	%xmm0, v+912(%rip)
	movdqa	%xmm0, p+912(%rip)
	movdqa	%xmm0, u+928(%rip)
	movdqa	%xmm0, v+928(%rip)
	movdqa	%xmm0, p+928(%rip)
	movdqa	%xmm0, u+944(%rip)
	movdqa	%xmm0, v+944(%rip)
	movdqa	%xmm0, p+944(%rip)
	movdqa	%xmm0, u+960(%rip)
	movdqa	%xmm0, v+960(%rip)
	movdqa	%xmm0, p+960(%rip)
	movdqa	%xmm0, u+976(%rip)
	movdqa	%xmm0, v+976(%rip)
	movdqa	%xmm0, p+976(%rip)
	movdqa	%xmm0, u+992(%rip)
	movdqa	%xmm0, v+992(%rip)
	movdqa	%xmm0, p+992(%rip)
	movdqa	%xmm0, u+1008(%rip)
	movdqa	%xmm0, v+1008(%rip)
	movdqa	%xmm0, p+1008(%rip)
	pxor	%xmm0, %xmm0
	xorl	%eax, %eax
	movabsq	$68719476736, %rbx      # imm = 0x1000000000
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB0_18:                               # %vector.body137
                                        # =>This Inner Loop Header: Depth=1
	movq	sum(%rax), %xmm2        # xmm2 = mem[0],zero
	movq	sum+8(%rax), %xmm3      # xmm3 = mem[0],zero
	movdqa	%xmm2, %xmm4
	psrad	$31, %xmm4
	punpckldq	%xmm4, %xmm2    # xmm2 = xmm2[0],xmm4[0],xmm2[1],xmm4[1]
	movdqa	%xmm3, %xmm4
	psrad	$31, %xmm4
	punpckldq	%xmm4, %xmm3    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
	paddq	%xmm0, %xmm2
	paddq	%xmm1, %xmm3
	movq	sum+16(%rax), %xmm0     # xmm0 = mem[0],zero
	movq	sum+24(%rax), %xmm1     # xmm1 = mem[0],zero
	movdqa	%xmm0, %xmm4
	psrad	$31, %xmm4
	punpckldq	%xmm4, %xmm0    # xmm0 = xmm0[0],xmm4[0],xmm0[1],xmm4[1]
	movdqa	%xmm1, %xmm4
	psrad	$31, %xmm4
	punpckldq	%xmm4, %xmm1    # xmm1 = xmm1[0],xmm4[0],xmm1[1],xmm4[1]
	paddq	%xmm2, %xmm0
	paddq	%xmm3, %xmm1
	addq	$32, %rax
	cmpq	$1073741824, %rax       # imm = 0x40000000
	jne	.LBB0_18
# BB#19:                                # %middle.block138
	paddq	%xmm0, %xmm1
	pshufd	$78, %xmm1, %xmm0       # xmm0 = xmm1[2,3,0,1]
	paddq	%xmm1, %xmm0
	movd	%xmm0, %rax
	cmpq	%rbx, %rax
	jne	.LBB0_21
# BB#20:                                # %if.end
	movl	$6, %edi
	movl	$.L.str.1, %esi
	callq	setlocale
	movl	$.L.str.2, %edi
	movl	$256, %edx              # imm = 0x100
	xorl	%eax, %eax
	movq	%rbx, %rsi
	movq	%rbx, %rcx
	callq	printf
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.LBB0_21:                               # %if.then
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$-2, %edi
	callq	exit
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.type	u,@object               # @u
	.comm	u,1024,16
	.type	v,@object               # @v
	.comm	v,1024,16
	.type	p,@object               # @p
	.comm	p,1024,16
	.type	sum,@object             # @sum
	.comm	sum,1073741824,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"fail to multiply two unit vectors"
	.size	.L.str, 34

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.zero	1
	.size	.L.str.1, 1

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"Pass the %'lld vector multiplication test case with local vector size = %d\nThe Dot Product = %'lld\n"
	.size	.L.str.2, 100


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"
	.section	".note.GNU-stack","",@progbits
