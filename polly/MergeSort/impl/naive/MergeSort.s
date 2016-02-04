	.text
	.file	"MergeSort.c"
	.globl	sortV1
	.p2align	4, 0x90
	.type	sortV1,@function
sortV1:                                 # @sortV1
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
	subq	$464, %rsp              # imm = 0x1D0
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -64(%rbp)
	movq	$0, -72(%rbp)
	movq	$0, -80(%rbp)
	movq	$0, -88(%rbp)
	movq	$0, -96(%rbp)
	movq	$0, -104(%rbp)
	movq	$0, -112(%rbp)
	movq	$0, -120(%rbp)
	movq	$0, -128(%rbp)
	movq	$0, -136(%rbp)
	movq	$0, -144(%rbp)
	movq	$0, -152(%rbp)
	movq	$0, -160(%rbp)
	movq	$0, -168(%rbp)
	movq	$0, -176(%rbp)
	movq	$0, -184(%rbp)
	movq	$0, -192(%rbp)
	movq	$0, -200(%rbp)
	movq	$0, -208(%rbp)
	movq	$0, -216(%rbp)
	movq	$0, -224(%rbp)
	movq	$0, -232(%rbp)
	movq	$0, -240(%rbp)
	movq	$0, -248(%rbp)
	movq	$0, -256(%rbp)
	movq	$0, -264(%rbp)
	movq	$0, -272(%rbp)
	movq	$0, -280(%rbp)
	movq	$0, -288(%rbp)
	movq	$0, -296(%rbp)
	movq	$0, -304(%rbp)
	movq	$0, -312(%rbp)
	movq	$0, -320(%rbp)
	movq	$0, -328(%rbp)
	movq	$0, -336(%rbp)
	movq	$0, -344(%rbp)
	movq	$0, -352(%rbp)
	movq	$0, -360(%rbp)
	movq	$0, -368(%rbp)
	movq	$0, -376(%rbp)
	movq	$0, -384(%rbp)
	movq	$0, -392(%rbp)
	movq	$0, -400(%rbp)
	movq	$0, -408(%rbp)
	movq	$0, -416(%rbp)
	movq	$0, -424(%rbp)
	movq	$0, -432(%rbp)
	movq	$0, -440(%rbp)
	movq	$0, -448(%rbp)
	movq	$0, -456(%rbp)
	movq	$0, -464(%rbp)
	movq	$1, -120(%rbp)
	movq	-24(%rbp), %rcx
	addq	-120(%rbp), %rcx
	movq	%rcx, -128(%rbp)
	movq	-128(%rbp), %rcx
	cmpq	-32(%rbp), %rcx
	jl	.LBB0_2
# BB#1:                                 # %if.then
	jmp	.LBB0_26
.LBB0_2:                                # %if.end
	movq	-24(%rbp), %rax
	addq	-32(%rbp), %rax
	movq	%rax, -136(%rbp)
	movq	$2, -144(%rbp)
	movq	-136(%rbp), %rax
	cqto
	idivq	-144(%rbp)
	movq	%rax, -152(%rbp)
	movq	-152(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movq	-24(%rbp), %rax
	movq	-56(%rbp), %rcx
	movq	%rax, %rdx
	callq	slice
	movq	%rax, -160(%rbp)
	movq	-56(%rbp), %rax
	subq	-24(%rbp), %rax
	movq	%rax, -168(%rbp)
	movq	-168(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-160(%rbp), %rdi
	movq	-168(%rbp), %rsi
	callq	copy
	movq	%rax, -64(%rbp)
	movq	$0, -192(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, -184(%rbp)
	movq	-64(%rbp), %rdi
	movq	-72(%rbp), %rsi
	callq	copy
	movq	-72(%rbp), %rsi
	movq	-192(%rbp), %rdx
	movq	-56(%rbp), %rcx
	movq	%rax, %rdi
	callq	sortV1
	movq	%rax, -176(%rbp)
	movq	-184(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-176(%rbp), %rdi
	movq	-184(%rbp), %rsi
	callq	copy
	movq	%rax, -64(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movq	-56(%rbp), %rdx
	movq	-32(%rbp), %rcx
	callq	slice
	movq	%rax, -200(%rbp)
	movq	-32(%rbp), %rax
	subq	-56(%rbp), %rax
	movq	%rax, -208(%rbp)
	movq	-208(%rbp), %rax
	movq	%rax, -88(%rbp)
	movq	-200(%rbp), %rdi
	movq	-208(%rbp), %rsi
	callq	copy
	movq	%rax, -80(%rbp)
	movq	$0, -232(%rbp)
	movq	-32(%rbp), %rax
	subq	-56(%rbp), %rax
	movq	%rax, -240(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -224(%rbp)
	movq	-80(%rbp), %rdi
	movq	-88(%rbp), %rsi
	callq	copy
	movq	-88(%rbp), %rsi
	movq	-232(%rbp), %rdx
	movq	-240(%rbp), %rcx
	movq	%rax, %rdi
	callq	sortV1
	movq	%rax, -216(%rbp)
	movq	-224(%rbp), %rax
	movq	%rax, -88(%rbp)
	movq	-216(%rbp), %rdi
	movq	-224(%rbp), %rsi
	callq	copy
	movq	%rax, -80(%rbp)
	movq	$0, -248(%rbp)
	movq	-248(%rbp), %rax
	movq	%rax, -96(%rbp)
	movq	$0, -256(%rbp)
	movq	-256(%rbp), %rax
	movq	%rax, -104(%rbp)
	movq	$0, -264(%rbp)
	movq	-264(%rbp), %rax
	movq	%rax, -112(%rbp)
.LBB0_3:                                # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movq	-32(%rbp), %rax
	subq	-24(%rbp), %rax
	movq	%rax, -272(%rbp)
	movq	-112(%rbp), %rax
	cmpq	-272(%rbp), %rax
	jl	.LBB0_5
# BB#4:                                 # %if.then15
	jmp	.LBB0_15
.LBB0_5:                                # %if.end16
                                        #   in Loop: Header=BB0_3 Depth=1
	movq	-56(%rbp), %rax
	subq	-24(%rbp), %rax
	movq	%rax, -280(%rbp)
	movq	-96(%rbp), %rax
	cmpq	-280(%rbp), %rax
	jl	.LBB0_7
# BB#6:                                 # %if.then19
	jmp	.LBB0_15
.LBB0_7:                                # %if.end20
                                        #   in Loop: Header=BB0_3 Depth=1
	movq	-32(%rbp), %rax
	subq	-56(%rbp), %rax
	movq	%rax, -288(%rbp)
	movq	-104(%rbp), %rax
	cmpq	-288(%rbp), %rax
	jl	.LBB0_9
# BB#8:                                 # %if.then23
	jmp	.LBB0_15
.LBB0_9:                                # %if.end24
                                        #   in Loop: Header=BB0_3 Depth=1
	movq	-96(%rbp), %rax
	movq	-64(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movq	%rax, -296(%rbp)
	movq	-104(%rbp), %rax
	movq	-80(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movq	%rax, -304(%rbp)
	movq	-296(%rbp), %rax
	cmpq	-304(%rbp), %rax
	jle	.LBB0_11
# BB#10:                                # %if.then27
                                        #   in Loop: Header=BB0_3 Depth=1
	jmp	.LBB0_12
.LBB0_11:                               # %if.end28
                                        #   in Loop: Header=BB0_3 Depth=1
	movq	-96(%rbp), %rax
	movq	-64(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movq	%rax, -312(%rbp)
	movq	-312(%rbp), %rax
	movq	-112(%rbp), %rcx
	movq	-8(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
	movq	$1, -320(%rbp)
	movq	-96(%rbp), %rax
	addq	-320(%rbp), %rax
	movq	%rax, -328(%rbp)
	movq	-328(%rbp), %rax
	movq	%rax, -96(%rbp)
	jmp	.LBB0_13
.LBB0_12:                               # %blklab3
                                        #   in Loop: Header=BB0_3 Depth=1
	movq	-104(%rbp), %rax
	movq	-80(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movq	%rax, -336(%rbp)
	movq	-336(%rbp), %rax
	movq	-112(%rbp), %rcx
	movq	-8(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
	movq	$1, -344(%rbp)
	movq	-104(%rbp), %rax
	addq	-344(%rbp), %rax
	movq	%rax, -352(%rbp)
	movq	-352(%rbp), %rax
	movq	%rax, -104(%rbp)
.LBB0_13:                               # %blklab4
                                        #   in Loop: Header=BB0_3 Depth=1
	movq	$1, -360(%rbp)
	movq	-112(%rbp), %rax
	addq	-360(%rbp), %rax
	movq	%rax, -368(%rbp)
	movq	-368(%rbp), %rax
	movq	%rax, -112(%rbp)
# BB#14:                                # %blklab2
                                        #   in Loop: Header=BB0_3 Depth=1
	jmp	.LBB0_3
.LBB0_15:                               # %blklab1
	jmp	.LBB0_16
.LBB0_16:                               # %while.body36
                                        # =>This Inner Loop Header: Depth=1
	movq	-56(%rbp), %rax
	subq	-24(%rbp), %rax
	movq	%rax, -376(%rbp)
	movq	-96(%rbp), %rax
	cmpq	-376(%rbp), %rax
	jl	.LBB0_18
# BB#17:                                # %if.then39
	jmp	.LBB0_20
.LBB0_18:                               # %if.end40
                                        #   in Loop: Header=BB0_16 Depth=1
	movq	-96(%rbp), %rax
	movq	-64(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movq	%rax, -384(%rbp)
	movq	-384(%rbp), %rax
	movq	-112(%rbp), %rcx
	movq	-8(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
	movq	$1, -392(%rbp)
	movq	-112(%rbp), %rax
	addq	-392(%rbp), %rax
	movq	%rax, -400(%rbp)
	movq	-400(%rbp), %rax
	movq	%rax, -112(%rbp)
	movq	$1, -408(%rbp)
	movq	-96(%rbp), %rax
	addq	-408(%rbp), %rax
	movq	%rax, -416(%rbp)
	movq	-416(%rbp), %rax
	movq	%rax, -96(%rbp)
# BB#19:                                # %blklab6
                                        #   in Loop: Header=BB0_16 Depth=1
	jmp	.LBB0_16
.LBB0_20:                               # %blklab5
	jmp	.LBB0_21
.LBB0_21:                               # %while.body45
                                        # =>This Inner Loop Header: Depth=1
	movq	-32(%rbp), %rax
	subq	-56(%rbp), %rax
	movq	%rax, -424(%rbp)
	movq	-104(%rbp), %rax
	cmpq	-424(%rbp), %rax
	jl	.LBB0_23
# BB#22:                                # %if.then48
	jmp	.LBB0_25
.LBB0_23:                               # %if.end49
                                        #   in Loop: Header=BB0_21 Depth=1
	movq	-104(%rbp), %rax
	movq	-80(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movq	%rax, -432(%rbp)
	movq	-432(%rbp), %rax
	movq	-112(%rbp), %rcx
	movq	-8(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
	movq	$1, -440(%rbp)
	movq	-112(%rbp), %rax
	addq	-440(%rbp), %rax
	movq	%rax, -448(%rbp)
	movq	-448(%rbp), %rax
	movq	%rax, -112(%rbp)
	movq	$1, -456(%rbp)
	movq	-104(%rbp), %rax
	addq	-456(%rbp), %rax
	movq	%rax, -464(%rbp)
	movq	-464(%rbp), %rax
	movq	%rax, -104(%rbp)
# BB#24:                                # %blklab8
                                        #   in Loop: Header=BB0_21 Depth=1
	jmp	.LBB0_21
.LBB0_25:                               # %blklab7
	jmp	.LBB0_26
.LBB0_26:                               # %blklab0
	movq	-8(%rbp), %rax
	addq	$464, %rsp              # imm = 0x1D0
	popq	%rbp
	retq
.Lfunc_end0:
	.size	sortV1, .Lfunc_end0-sortV1
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp3:
	.cfi_def_cfa_offset 16
.Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp5:
	.cfi_def_cfa_register %rbp
	subq	$304, %rsp              # imm = 0x130
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -64(%rbp)
	movq	$0, -72(%rbp)
	movq	$0, -80(%rbp)
	movq	$0, -88(%rbp)
	movq	$0, -96(%rbp)
	movq	$0, -104(%rbp)
	movq	$0, -112(%rbp)
	movq	$0, -120(%rbp)
	movq	$0, -128(%rbp)
	movq	$0, -136(%rbp)
	movq	$0, -144(%rbp)
	movq	$0, -152(%rbp)
	movq	$0, -160(%rbp)
	movq	$0, -168(%rbp)
	movq	$0, -176(%rbp)
	movq	$0, -184(%rbp)
	movq	$0, -192(%rbp)
	movq	$0, -200(%rbp)
	movq	$0, -208(%rbp)
	movq	$0, -216(%rbp)
	movq	$0, -224(%rbp)
	movq	$0, -232(%rbp)
	movq	$0, -240(%rbp)
	movq	$0, -248(%rbp)
	movq	$0, -264(%rbp)
	movq	$0, -272(%rbp)
	movl	-8(%rbp), %edi
	movq	-16(%rbp), %rsi
	callq	convertArgsToIntArray
	movq	%rax, -64(%rbp)
	movl	-8(%rbp), %edi
	subl	$1, %edi
	movslq	%edi, %rax
	movq	%rax, -72(%rbp)
	movq	$0, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	-64(%rbp), %rsi
	movq	(%rsi,%rax,8), %rax
	movq	%rax, -96(%rbp)
	movq	-96(%rbp), %rdi
	callq	parseStringToInt
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	cmpq	$0, %rax
	jne	.LBB1_2
# BB#1:                                 # %if.then
	jmp	.LBB1_14
.LBB1_2:                                # %if.end
	movq	$0, -112(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	$0, -120(%rbp)
	movq	$1, -128(%rbp)
	movq	-24(%rbp), %rax
	addq	-128(%rbp), %rax
	movq	%rax, -136(%rbp)
	movq	-136(%rbp), %rax
	movq	%rax, -152(%rbp)
	movq	-120(%rbp), %rax
	movl	%eax, %ecx
	movq	-152(%rbp), %rax
	movl	%eax, %edx
	movl	%ecx, %edi
	movl	%edx, %esi
	callq	gen1DArray
	movq	%rax, -144(%rbp)
	movq	-152(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-144(%rbp), %rdi
	movq	-152(%rbp), %rsi
	callq	copy
	movq	%rax, -40(%rbp)
.LBB1_3:                                # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movq	-32(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jle	.LBB1_5
# BB#4:                                 # %if.then9
	jmp	.LBB1_7
.LBB1_5:                                # %if.end10
                                        #   in Loop: Header=BB1_3 Depth=1
	movq	-24(%rbp), %rax
	subq	-32(%rbp), %rax
	movq	%rax, -160(%rbp)
	movq	-160(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	-40(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
	movq	$1, -168(%rbp)
	movq	-32(%rbp), %rax
	addq	-168(%rbp), %rax
	movq	%rax, -176(%rbp)
	movq	-176(%rbp), %rax
	movq	%rax, -32(%rbp)
# BB#6:                                 # %blklab11
                                        #   in Loop: Header=BB1_3 Depth=1
	jmp	.LBB1_3
.LBB1_7:                                # %blklab10
	movq	$0, -200(%rbp)
	movq	$1, -208(%rbp)
	movq	-24(%rbp), %rax
	addq	-208(%rbp), %rax
	movq	%rax, -216(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -192(%rbp)
	movq	-40(%rbp), %rdi
	movq	-48(%rbp), %rsi
	callq	copy
	movq	-48(%rbp), %rsi
	movq	-200(%rbp), %rdx
	movq	-216(%rbp), %rcx
	movq	%rax, %rdi
	callq	sortV1
	movq	%rax, -184(%rbp)
	movq	-192(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-184(%rbp), %rdi
	movq	-192(%rbp), %rsi
	callq	copy
	movq	%rax, -40(%rbp)
	movq	$0, -224(%rbp)
	movq	-224(%rbp), %rax
	movq	-40(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movq	%rax, -232(%rbp)
	movq	$0, -240(%rbp)
	movq	-232(%rbp), %rax
	cmpq	-240(%rbp), %rax
	jne	.LBB1_9
# BB#8:                                 # %if.then21
	jmp	.LBB1_10
.LBB1_9:                                # %if.end22
	movabsq	$.L.str, %rsi
	movq	stderr, %rdi
	movb	$0, %al
	callq	fprintf
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	movl	%eax, -284(%rbp)        # 4-byte Spill
	callq	exit
.LBB1_10:                               # %blklab12
	movq	-24(%rbp), %rax
	movq	-40(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movq	%rax, -248(%rbp)
	movq	-248(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jne	.LBB1_12
# BB#11:                                # %if.then27
	jmp	.LBB1_13
.LBB1_12:                               # %if.end28
	movabsq	$.L.str, %rsi
	movq	stderr, %rdi
	movb	$0, %al
	callq	fprintf
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	movl	%eax, -288(%rbp)        # 4-byte Spill
	callq	exit
.LBB1_13:                               # %blklab13
	movl	$304, %eax              # imm = 0x130
	movl	%eax, %edi
	movq	$38, -272(%rbp)
	callq	malloc
	movq	%rax, -264(%rbp)
	movq	-264(%rbp), %rax
	movq	$80, (%rax)
	movq	-264(%rbp), %rax
	movq	$97, 8(%rax)
	movq	-264(%rbp), %rax
	movq	$115, 16(%rax)
	movq	-264(%rbp), %rax
	movq	$115, 24(%rax)
	movq	-264(%rbp), %rax
	movq	$32, 32(%rax)
	movq	-264(%rbp), %rax
	movq	$77, 40(%rax)
	movq	-264(%rbp), %rax
	movq	$101, 48(%rax)
	movq	-264(%rbp), %rax
	movq	$114, 56(%rax)
	movq	-264(%rbp), %rax
	movq	$103, 64(%rax)
	movq	-264(%rbp), %rax
	movq	$101, 72(%rax)
	movq	-264(%rbp), %rax
	movq	$83, 80(%rax)
	movq	-264(%rbp), %rax
	movq	$111, 88(%rax)
	movq	-264(%rbp), %rax
	movq	$114, 96(%rax)
	movq	-264(%rbp), %rax
	movq	$116, 104(%rax)
	movq	-264(%rbp), %rax
	movq	$32, 112(%rax)
	movq	-264(%rbp), %rax
	movq	$116, 120(%rax)
	movq	-264(%rbp), %rax
	movq	$101, 128(%rax)
	movq	-264(%rbp), %rax
	movq	$115, 136(%rax)
	movq	-264(%rbp), %rax
	movq	$116, 144(%rax)
	movq	-264(%rbp), %rax
	movq	$32, 152(%rax)
	movq	-264(%rbp), %rax
	movq	$99, 160(%rax)
	movq	-264(%rbp), %rax
	movq	$97, 168(%rax)
	movq	-264(%rbp), %rax
	movq	$115, 176(%rax)
	movq	-264(%rbp), %rax
	movq	$101, 184(%rax)
	movq	-264(%rbp), %rax
	movq	$32, 192(%rax)
	movq	-264(%rbp), %rax
	movq	$119, 200(%rax)
	movq	-264(%rbp), %rax
	movq	$105, 208(%rax)
	movq	-264(%rbp), %rax
	movq	$116, 216(%rax)
	movq	-264(%rbp), %rax
	movq	$104, 224(%rax)
	movq	-264(%rbp), %rax
	movq	$32, 232(%rax)
	movq	-264(%rbp), %rax
	movq	$105, 240(%rax)
	movq	-264(%rbp), %rax
	movq	$110, 248(%rax)
	movq	-264(%rbp), %rax
	movq	$112, 256(%rax)
	movq	-264(%rbp), %rax
	movq	$117, 264(%rax)
	movq	-264(%rbp), %rax
	movq	$116, 272(%rax)
	movq	-264(%rbp), %rax
	movq	$32, 280(%rax)
	movq	-264(%rbp), %rax
	movq	$61, 288(%rax)
	movq	-264(%rbp), %rax
	movq	$32, 296(%rax)
	movq	-264(%rbp), %rdi
	movq	-272(%rbp), %rsi
	callq	printf_s
	movabsq	$.L.str.1, %rdi
	movq	-24(%rbp), %rsi
	movb	$0, %al
	callq	printf
	movl	%eax, -292(%rbp)        # 4-byte Spill
.LBB1_14:                               # %blklab9
	xorl	%edi, %edi
	callq	exit
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"fail"
	.size	.L.str, 5

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"%d\n"
	.size	.L.str.1, 4


	.ident	"clang version 3.9.0 (http://llvm.org/git/clang.git 1f64ddbc4c5d1036b68ec896765a7535537ded85) (http://llvm.org/git/llvm.git 99a07120d47e1881a14a7b36bf7cf6bbd54954af)"
	.section	".note.GNU-stack","",@progbits
