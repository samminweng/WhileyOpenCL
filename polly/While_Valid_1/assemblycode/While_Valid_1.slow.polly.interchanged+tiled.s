	.text
	.file	"While_Valid_1.slow.polly.interchanged+tiled.ll"
	.globl	toString
	.align	16, 0x90
	.type	toString,@function
toString:                               # @toString
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
	subq	$1032, %rsp             # imm = 0x408
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
	movq	%rdx, %r14
	movq	%rsi, %r12
	movq	%rdi, %r15
	testq	%r14, %r14
	je	.LBB0_6
# BB#1:                                 # %for.cond.preheader
	testq	%r12, %r12
	jle	.LBB0_5
# BB#2:                                 # %for.body.preheader
	leaq	-1072(%rbp), %r13
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB0_3:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r15,%rbx,8), %rdx
	movl	$.L.str.1, %esi
	xorl	%eax, %eax
	movq	%r13, %rdi
	callq	sprintf
	movslq	%eax, %rdi
	incq	%rdi
	callq	malloc
	movq	%rax, (%r14,%rbx,8)
	testq	%rax, %rax
	je	.LBB0_7
# BB#4:                                 # %if.end.10
                                        #   in Loop: Header=BB0_3 Depth=1
	movq	%rax, %rdi
	movq	%r13, %rsi
	callq	strcpy
	incq	%rbx
	cmpq	%r12, %rbx
	jl	.LBB0_3
.LBB0_5:                                # %for.end
	addq	$1032, %rsp             # imm = 0x408
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB0_7:                                # %if.then.8
	movq	stderr(%rip), %rdi
	movl	$.L.str.2, %esi
	xorl	%eax, %eax
	movq	%rbx, %rdx
	callq	fprintf
	xorl	%edi, %edi
	callq	exit
.LBB0_6:                                # %if.then
	movq	stderr(%rip), %rcx
	movl	$.L.str, %edi
	movl	$76, %esi
	movl	$1, %edx
	callq	fwrite
	xorl	%edi, %edi
	callq	exit
.Lfunc_end0:
	.size	toString, .Lfunc_end0-toString
	.cfi_endproc

	.globl	clone
	.align	16, 0x90
	.type	clone,@function
clone:                                  # @clone
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp8:
	.cfi_def_cfa_offset 16
.Ltmp9:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp10:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
.Ltmp11:
	.cfi_offset %rbx, -48
.Ltmp12:
	.cfi_offset %r12, -40
.Ltmp13:
	.cfi_offset %r14, -32
.Ltmp14:
	.cfi_offset %r15, -24
	movq	%rsi, %r12
	movq	%rdi, %r14
	leaq	(,%r12,8), %r15
	movq	%r15, %rdi
	callq	malloc
	movq	%rax, %rbx
	testq	%rbx, %rbx
	je	.LBB1_4
# BB#1:                                 # %for.cond.preheader
	testq	%r12, %r12
	jle	.LBB1_3
# BB#2:                                 # %for.body.preheader
	movq	%rbx, %rdi
	movq	%r14, %rsi
	movq	%r15, %rdx
	callq	memcpy
.LBB1_3:                                # %for.end
	movq	%rbx, %rax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB1_4:                                # %if.then
	movq	stderr(%rip), %rcx
	movl	$.L.str.3, %edi
	movl	$14, %esi
	movl	$1, %edx
	callq	fwrite
	xorl	%edi, %edi
	callq	exit
.Lfunc_end1:
	.size	clone, .Lfunc_end1-clone
	.cfi_endproc

	.globl	append
	.align	16, 0x90
	.type	append,@function
append:                                 # @append
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp15:
	.cfi_def_cfa_offset 16
.Ltmp16:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp17:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
.Ltmp18:
	.cfi_offset %rbx, -56
.Ltmp19:
	.cfi_offset %r12, -48
.Ltmp20:
	.cfi_offset %r13, -40
.Ltmp21:
	.cfi_offset %r14, -32
.Ltmp22:
	.cfi_offset %r15, -24
	movq	%r8, -48(%rbp)          # 8-byte Spill
	movq	%rcx, %r12
	movq	%rdx, %r15
	movq	%rsi, %r13
	movq	(%r12), %rsi
	addq	(%r13), %rsi
	shlq	$3, %rsi
	callq	realloc
	movq	%rax, %r14
	testq	%r14, %r14
	je	.LBB2_2
# BB#1:                                 # %if.end
	movq	(%r13), %r13
	leaq	(%r14,%r13,8), %rdi
	movq	(%r12), %rbx
	leaq	(,%rbx,8), %rdx
	movq	%r15, %rsi
	callq	memcpy
	addq	%r13, %rbx
	movq	-48(%rbp), %rax         # 8-byte Reload
	movq	%rbx, (%rax)
	movq	%r14, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB2_2:                                # %if.then
	movq	stderr(%rip), %rcx
	movl	$.L.str.4, %edi
	movl	$15, %esi
	movl	$1, %edx
	callq	fwrite
	xorl	%edi, %edi
	callq	exit
.Lfunc_end2:
	.size	append, .Lfunc_end2-append
	.cfi_endproc

	.globl	indirect_printf
	.align	16, 0x90
	.type	indirect_printf,@function
indirect_printf:                        # @indirect_printf
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp23:
	.cfi_def_cfa_offset 16
.Ltmp24:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp25:
	.cfi_def_cfa_register %rbp
	movq	%rdi, %rcx
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	movq	%rcx, %rsi
	popq	%rbp
	jmp	printf                  # TAILCALL
.Lfunc_end3:
	.size	indirect_printf, .Lfunc_end3-indirect_printf
	.cfi_endproc

	.globl	indirect_printf_array
	.align	16, 0x90
	.type	indirect_printf_array,@function
indirect_printf_array:                  # @indirect_printf_array
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp26:
	.cfi_def_cfa_offset 16
.Ltmp27:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp28:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
.Ltmp29:
	.cfi_offset %rbx, -56
.Ltmp30:
	.cfi_offset %r12, -48
.Ltmp31:
	.cfi_offset %r13, -40
.Ltmp32:
	.cfi_offset %r14, -32
.Ltmp33:
	.cfi_offset %r15, -24
	movq	%rsi, %r15
	movq	%rdi, %r14
	xorl	%r12d, %r12d
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
	testq	%r15, %r15
	jle	.LBB4_6
# BB#1:                                 # %for.body.preheader
	movq	%r15, %rax
	negq	%rax
	cmpq	$-10, %rax
	movq	$-10, %r12
	cmovaq	%rax, %r12
	negq	%r12
	movq	%r14, %rbx
	movq	%r12, %r13
	xorl	%eax, %eax
	.align	16, 0x90
.LBB4_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rsi
	testb	$1, %al
	je	.LBB4_3
# BB#4:                                 # %if.else
                                        #   in Loop: Header=BB4_2 Depth=1
	movl	$.L.str.7, %edi
	jmp	.LBB4_5
	.align	16, 0x90
.LBB4_3:                                # %if.then
                                        #   in Loop: Header=BB4_2 Depth=1
	movl	$.L.str.1, %edi
.LBB4_5:                                # %for.inc
                                        #   in Loop: Header=BB4_2 Depth=1
	xorl	%eax, %eax
	callq	printf
	addq	$8, %rbx
	decq	%r13
	movb	$1, %al
	jne	.LBB4_2
.LBB4_6:                                # %for.end
	cmpq	%r15, %r12
	jge	.LBB4_8
# BB#7:                                 # %if.then.8
	movq	-8(%r14,%r15,8), %rsi
	movl	$.L.str.8, %edi
	xorl	%eax, %eax
	callq	printf
.LBB4_8:                                # %if.end.11
	movl	$.Lstr, %edi
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	puts                    # TAILCALL
.Lfunc_end4:
	.size	indirect_printf_array, .Lfunc_end4-indirect_printf_array
	.cfi_endproc

	.globl	isPowerof2
	.align	16, 0x90
	.type	isPowerof2,@function
isPowerof2:                             # @isPowerof2
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp34:
	.cfi_def_cfa_offset 16
.Ltmp35:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp36:
	.cfi_def_cfa_register %rbp
	movl	$1, %eax
	testq	%rdi, %rdi
	je	.LBB5_2
# BB#1:                                 # %land.rhs
	leaq	-1(%rdi), %rax
	testq	%rdi, %rax
	sete	%al
	movzbl	%al, %eax
.LBB5_2:                                # %return
	popq	%rbp
	retq
.Lfunc_end5:
	.size	isPowerof2, .Lfunc_end5-isPowerof2
	.cfi_endproc

	.globl	optimized_append
	.align	16, 0x90
	.type	optimized_append,@function
optimized_append:                       # @optimized_append
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp37:
	.cfi_def_cfa_offset 16
.Ltmp38:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp39:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
.Ltmp40:
	.cfi_offset %rbx, -48
.Ltmp41:
	.cfi_offset %r12, -40
.Ltmp42:
	.cfi_offset %r14, -32
.Ltmp43:
	.cfi_offset %r15, -24
	movq	%r8, %r14
	movq	%rcx, %r15
	movq	%rdx, %r12
	movq	%rsi, %rbx
	movq	(%rbx), %rax
	testq	%rax, %rax
	je	.LBB6_2
# BB#1:                                 # %isPowerof2.exit
	leaq	-1(%rax), %rcx
	testq	%rax, %rcx
	jne	.LBB6_5
.LBB6_2:                                # %while.cond.preheader
	addq	(%r15), %rax
	movl	$2, %ecx
	.align	16, 0x90
.LBB6_3:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	%rcx, %rsi
	leaq	(%rsi,%rsi), %rcx
	cmpq	%rax, %rsi
	jl	.LBB6_3
# BB#4:                                 # %while.end
	shlq	$3, %rsi
	callq	realloc
	movq	%rax, %rdi
	testq	%rdi, %rdi
	je	.LBB6_8
.LBB6_5:                                # %if.end.6
	movq	(%r15), %rcx
	xorl	%eax, %eax
	testq	%rcx, %rcx
	jle	.LBB6_7
	.align	16, 0x90
.LBB6_6:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r12,%rax,8), %rcx
	movq	(%rbx), %rdx
	addq	%rax, %rdx
	movq	%rcx, (%rdi,%rdx,8)
	incq	%rax
	movq	(%r15), %rcx
	cmpq	%rcx, %rax
	jl	.LBB6_6
.LBB6_7:                                # %for.end
	addq	(%rbx), %rcx
	movq	%rcx, (%r14)
	movq	%rdi, %rax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB6_8:                                # %if.then.4
	movq	stderr(%rip), %rcx
	movl	$.L.str.4, %edi
	movl	$15, %esi
	movl	$1, %edx
	callq	fwrite
	xorl	%edi, %edi
	callq	exit
.Lfunc_end6:
	.size	optimized_append, .Lfunc_end6-optimized_append
	.cfi_endproc

	.globl	readStringAsInteger
	.align	16, 0x90
	.type	readStringAsInteger,@function
readStringAsInteger:                    # @readStringAsInteger
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp44:
	.cfi_def_cfa_offset 16
.Ltmp45:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp46:
	.cfi_def_cfa_register %rbp
	movq	%rsi, %rcx
	movl	$.L.str.1, %esi
	xorl	%eax, %eax
	movq	%rcx, %rdx
	popq	%rbp
	jmp	__isoc99_sscanf         # TAILCALL
.Lfunc_end7:
	.size	readStringAsInteger, .Lfunc_end7-readStringAsInteger
	.cfi_endproc

	.globl	getStartingTime
	.align	16, 0x90
	.type	getStartingTime,@function
getStartingTime:                        # @getStartingTime
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp47:
	.cfi_def_cfa_offset 16
.Ltmp48:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp49:
	.cfi_def_cfa_register %rbp
	callq	clock
	movq	%rax, start(%rip)
	popq	%rbp
	retq
.Lfunc_end8:
	.size	getStartingTime, .Lfunc_end8-getStartingTime
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI9_0:
	.quad	4696837146684686336     # double 1.0E+6
	.text
	.globl	getEndingTime
	.align	16, 0x90
	.type	getEndingTime,@function
getEndingTime:                          # @getEndingTime
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp50:
	.cfi_def_cfa_offset 16
.Ltmp51:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp52:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
.Ltmp53:
	.cfi_offset %rbx, -24
	callq	clock
	movq	%rax, end(%rip)
	movl	$.L.str.10, %edi
	movl	$.L.str.11, %esi
	callq	fopen
	movq	%rax, %rbx
	movq	end(%rip), %rax
	subq	start(%rip), %rax
	cvtsi2sdq	%rax, %xmm0
	divsd	.LCPI9_0(%rip), %xmm0
	movl	$.L.str.12, %esi
	movb	$1, %al
	movq	%rbx, %rdi
	callq	fprintf
	movq	%rbx, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	jmp	fclose                  # TAILCALL
.Lfunc_end9:
	.size	getEndingTime, .Lfunc_end9-getEndingTime
	.cfi_endproc

	.globl	reverse
	.align	16, 0x90
	.type	reverse,@function
reverse:                                # @reverse
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp54:
	.cfi_def_cfa_offset 16
.Ltmp55:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp56:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
.Ltmp57:
	.cfi_offset %rbx, -56
.Ltmp58:
	.cfi_offset %r12, -48
.Ltmp59:
	.cfi_offset %r13, -40
.Ltmp60:
	.cfi_offset %r14, -32
.Ltmp61:
	.cfi_offset %r15, -24
	movq	%rsi, %r15
	movq	%rdi, %r14
	xorl	%eax, %eax
	testq	%r15, %r15
	jle	.LBB10_8
# BB#1:                                 # %while.body.preheader
	xorl	%eax, %eax
	movl	$8, %r12d
	movq	%r15, %rbx
	.align	16, 0x90
.LBB10_2:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	cmpq	%r15, %rbx
	jg	.LBB10_3
# BB#5:                                 # %blklab1
                                        #   in Loop: Header=BB10_2 Depth=1
	movq	-8(%r14,%rbx,8), %r13
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	realloc
	testq	%rax, %rax
	je	.LBB10_6
# BB#7:                                 # %append.exit
                                        #   in Loop: Header=BB10_2 Depth=1
	decq	%rbx
	movq	%r13, -8(%rax,%r12)
	addq	$8, %r12
	leaq	1(%rbx), %rcx
	cmpq	$1, %rcx
	jg	.LBB10_2
.LBB10_8:                               # %blklab0
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB10_3:                               # %if.end
	movq	stderr(%rip), %rcx
	movl	$.L.str.13, %edi
	movl	$4, %esi
	jmp	.LBB10_4
.LBB10_6:                               # %if.then.i
	movq	stderr(%rip), %rcx
	movl	$.L.str.4, %edi
	movl	$15, %esi
.LBB10_4:                               # %if.end
	movl	$1, %edx
	callq	fwrite
	xorl	%edi, %edi
	callq	exit
.Lfunc_end10:
	.size	reverse, .Lfunc_end10-reverse
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp62:
	.cfi_def_cfa_offset 16
.Ltmp63:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp64:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
.Ltmp65:
	.cfi_offset %rbx, -56
.Ltmp66:
	.cfi_offset %r12, -48
.Ltmp67:
	.cfi_offset %r13, -40
.Ltmp68:
	.cfi_offset %r14, -32
.Ltmp69:
	.cfi_offset %r15, -24
	movq	$0, -48(%rbp)
	movq	8(%rsi), %rdi
	xorl	%r12d, %r12d
	leaq	-48(%rbp), %rdx
	movl	$.L.str.1, %esi
	xorl	%eax, %eax
	callq	__isoc99_sscanf
	cmpq	$0, -48(%rbp)
	jle	.LBB11_1
# BB#2:
	xorl	%eax, %eax
	.align	16, 0x90
.LBB11_3:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	leaq	8(,%r12,8), %rsi
	movq	%rax, %rdi
	callq	realloc
	testq	%rax, %rax
	je	.LBB11_14
# BB#4:                                 # %append.exit
                                        #   in Loop: Header=BB11_3 Depth=1
	movq	%r12, (%rax,%r12,8)
	leaq	1(%r12), %r12
	cmpq	-48(%rbp), %r12
	jl	.LBB11_3
	jmp	.LBB11_5
.LBB11_1:
	xorl	%eax, %eax
.LBB11_5:                               # %blklab2
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	reverse
	movq	%rax, %r14
	xorl	%r15d, %r15d
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
	testq	%r12, %r12
	jle	.LBB11_11
# BB#6:                                 # %for.body.preheader.i
	movq	%r12, %rax
	negq	%rax
	cmpq	$-10, %rax
	movq	$-10, %r15
	cmovaq	%rax, %r15
	negq	%r15
	movq	%r14, %rbx
	movq	%r15, %r13
	xorl	%eax, %eax
	.align	16, 0x90
.LBB11_7:                               # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rsi
	testb	$1, %al
	je	.LBB11_8
# BB#9:                                 # %if.else.i
                                        #   in Loop: Header=BB11_7 Depth=1
	movl	$.L.str.7, %edi
	jmp	.LBB11_10
	.align	16, 0x90
.LBB11_8:                               # %if.then.i.3
                                        #   in Loop: Header=BB11_7 Depth=1
	movl	$.L.str.1, %edi
.LBB11_10:                              # %for.inc.i
                                        #   in Loop: Header=BB11_7 Depth=1
	xorl	%eax, %eax
	callq	printf
	addq	$8, %rbx
	decq	%r13
	movb	$1, %al
	jne	.LBB11_7
.LBB11_11:                              # %for.end.i
	cmpq	%r12, %r15
	jge	.LBB11_13
# BB#12:                                # %if.then.8.i
	movq	-8(%r14,%r12,8), %rsi
	movl	$.L.str.8, %edi
	xorl	%eax, %eax
	callq	printf
.LBB11_13:                              # %indirect_printf_array.exit
	movl	$.Lstr, %edi
	callq	puts
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB11_14:                              # %if.then.i
	movq	stderr(%rip), %rcx
	movl	$.L.str.4, %edi
	movl	$15, %esi
	movl	$1, %edx
	callq	fwrite
	xorl	%edi, %edi
	callq	exit
.Lfunc_end11:
	.size	main, .Lfunc_end11-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"fail to malloc res in toString(long long arr[], long long size, char** res)\n"
	.size	.L.str, 77

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"%lld"
	.size	.L.str.1, 5

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"fail to malloc %lld"
	.size	.L.str.2, 20

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"fail to malloc"
	.size	.L.str.3, 15

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"fail to realloc"
	.size	.L.str.4, 16

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"%lld\n"
	.size	.L.str.5, 6

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"\n["
	.size	.L.str.6, 3

	.type	.L.str.7,@object        # @.str.7
.L.str.7:
	.asciz	",%lld"
	.size	.L.str.7, 6

	.type	.L.str.8,@object        # @.str.8
.L.str.8:
	.asciz	" ... %lld"
	.size	.L.str.8, 10

	.type	start,@object           # @start
	.comm	start,8,8
	.type	end,@object             # @end
	.comm	end,8,8
	.type	.L.str.10,@object       # @.str.10
.L.str.10:
	.asciz	"result.txt"
	.size	.L.str.10, 11

	.type	.L.str.11,@object       # @.str.11
.L.str.11:
	.asciz	"a"
	.size	.L.str.11, 2

	.type	.L.str.12,@object       # @.str.12
.L.str.12:
	.asciz	"Execution time of reverse function(seconds):%.10lf\n"
	.size	.L.str.12, 52

	.type	.L.str.13,@object       # @.str.13
.L.str.13:
	.asciz	"fail"
	.size	.L.str.13, 5

	.type	diff,@object            # @diff
	.comm	diff,8,8
	.type	.Lstr,@object           # @str
.Lstr:
	.asciz	"]"
	.size	.Lstr, 2


	.ident	"clang version 3.7.0 (http://llvm.org/git/clang.git 9a5a6f0e149ba035168641ca6dc4e3b3e5aa29b5) (http://llvm.org/git/llvm.git f44ed0919cbd91fe77aacdfe47701a6d664f1049)"
	.section	".note.GNU-stack","",@progbits
