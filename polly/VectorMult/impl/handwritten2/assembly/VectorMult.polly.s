	.text
	.file	"VectorMult.polly.ll"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI0_0:
	.long	1024                    # 0x400
	.long	1024                    # 0x400
	.long	1024                    # 0x400
	.long	1024                    # 0x400
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
	pushq	%r14
	pushq	%rbx
.Ltmp3:
	.cfi_offset %rbx, -32
.Ltmp4:
	.cfi_offset %r14, -24
	xorl	%r11d, %r11d
	movaps	.LCPI0_0(%rip), %xmm0   # xmm0 = [1024,1024,1024,1024]
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movaps	%xmm0, sum(%rax)
	movaps	%xmm0, sum+16(%rax)
	movaps	%xmm0, sum+32(%rax)
	movaps	%xmm0, sum+48(%rax)
	movaps	%xmm0, sum+64(%rax)
	movaps	%xmm0, sum+80(%rax)
	movaps	%xmm0, sum+96(%rax)
	movaps	%xmm0, sum+112(%rax)
	movaps	%xmm0, sum+128(%rax)
	movaps	%xmm0, sum+144(%rax)
	movaps	%xmm0, sum+160(%rax)
	movaps	%xmm0, sum+176(%rax)
	movaps	%xmm0, sum+192(%rax)
	movaps	%xmm0, sum+208(%rax)
	movaps	%xmm0, sum+224(%rax)
	movaps	%xmm0, sum+240(%rax)
	addq	$256, %rax              # imm = 0x100
	cmpq	$268435456, %rax        # imm = 0x10000000
	jne	.LBB0_1
# BB#2:
	movdqa	.LCPI0_1(%rip), %xmm0   # xmm0 = [1,1,1,1]
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_3:                                # %polly.loop_preheader8
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
	movq	%r11, %rcx
	shlq	$5, %rcx
	leaq	4(%rcx), %rdi
	leaq	8(%rcx), %rsi
	leaq	12(%rcx), %rdx
	leaq	16(%rcx), %r14
	leaq	20(%rcx), %r10
	leaq	24(%rcx), %r9
	leaq	28(%rcx), %r8
	movl	$2097152, %ebx          # imm = 0x200000
	.p2align	4, 0x90
.LBB0_4:                                # %vector.body41
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	decq	%rbx
	jne	.LBB0_4
# BB#5:                                 # %polly.loop_exit9
                                        #   in Loop: Header=BB0_3 Depth=1
	movdqa	%xmm0, u(,%rcx,4)
	movdqa	%xmm0, v(,%rcx,4)
	movdqa	%xmm0, p(,%rcx,4)
	movdqa	%xmm0, u(,%rdi,4)
	movdqa	%xmm0, v(,%rdi,4)
	movdqa	%xmm0, p(,%rdi,4)
	movdqa	%xmm0, u(,%rsi,4)
	movdqa	%xmm0, v(,%rsi,4)
	movdqa	%xmm0, p(,%rsi,4)
	movdqa	%xmm0, u(,%rdx,4)
	movdqa	%xmm0, v(,%rdx,4)
	movdqa	%xmm0, p(,%rdx,4)
	movdqa	%xmm0, u(,%r14,4)
	movdqa	%xmm0, v(,%r14,4)
	movdqa	%xmm0, p(,%r14,4)
	movdqa	%xmm0, u(,%r10,4)
	movdqa	%xmm0, v(,%r10,4)
	movdqa	%xmm0, p(,%r10,4)
	movdqa	%xmm0, u(,%r9,4)
	movdqa	%xmm0, v(,%r9,4)
	movdqa	%xmm0, p(,%r9,4)
	movdqa	%xmm0, u(,%r8,4)
	movdqa	%xmm0, v(,%r8,4)
	movdqa	%xmm0, p(,%r8,4)
	incq	%r11
	cmpq	$32, %r11
	jne	.LBB0_3
# BB#6:
	pxor	%xmm0, %xmm0
	movabsq	$68719476736, %rbx      # imm = 0x1000000000
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB0_7:                                # %vector.body55
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
	cmpq	$268435456, %rax        # imm = 0x10000000
	jne	.LBB0_7
# BB#8:                                 # %middle.block56
	paddq	%xmm0, %xmm1
	pshufd	$78, %xmm1, %xmm0       # xmm0 = xmm1[2,3,0,1]
	paddq	%xmm1, %xmm0
	movd	%xmm0, %rax
	cmpq	%rbx, %rax
	jne	.LBB0_10
# BB#9:                                 # %if.end
	movl	$6, %edi
	movl	$.L.str.1, %esi
	callq	setlocale
	movl	$.L.str.2, %edi
	movl	$1024, %edx             # imm = 0x400
	xorl	%eax, %eax
	movq	%rbx, %rsi
	movq	%rbx, %rcx
	callq	printf
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.LBB0_10:                               # %if.then
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$-2, %edi
	callq	exit
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.type	u,@object               # @u
	.comm	u,4096,16
	.type	v,@object               # @v
	.comm	v,4096,16
	.type	p,@object               # @p
	.comm	p,4096,16
	.type	sum,@object             # @sum
	.comm	sum,268435456,16
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
