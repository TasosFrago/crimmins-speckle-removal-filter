	.text
	.file	"utils.c"
	.globl	modify_filename                 # -- Begin function modify_filename
	.p2align	4, 0x90
	.type	modify_filename,@function
modify_filename:                        # @modify_filename
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$96, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-16(%rbp), %rdi
	movl	$46, %esi
	callq	strrchr@PLT
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	.LBB0_2
# %bb.1:                                # %lor.lhs.false
	movq	-32(%rbp), %rdi
	leaq	.str(%rip), %rsi
	callq	strcmp@PLT
	cmpl	$0, %eax
	je	.LBB0_5
.LBB0_2:                                # %if.then
	movq	stderr@GOTPCREL(%rip), %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.LBB0_4
# %bb.3:
	movq	stderr@GOTPCREL(%rip), %rdi
	callq	__asan_report_load8@PLT
.LBB0_4:
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	.str.1(%rip), %rsi
	movb	$0, %al
	callq	fprintf@PLT
	movq	$0, -8(%rbp)
	movl	$1, -36(%rbp)
	jmp	.LBB0_12
.LBB0_5:                                # %if.end
	movq	-32(%rbp), %rax
	movq	-16(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, -48(%rbp)
	movq	-24(%rbp), %rdi
	callq	strlen@PLT
	movq	%rax, -56(%rbp)
	movq	-48(%rbp), %rax
	addq	$1, %rax
	addq	-56(%rbp), %rax
	addq	$4, %rax
	addq	$1, %rax
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rdi
	callq	malloc@PLT
	movq	%rax, -72(%rbp)
	cmpq	$0, -72(%rbp)
	jne	.LBB0_7
# %bb.6:                                # %if.then9
	movq	$0, -8(%rbp)
	movl	$1, -36(%rbp)
	jmp	.LBB0_11
.LBB0_7:                                # %if.end10
	movq	-72(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movq	-48(%rbp), %rdx
	callq	strncpy@PLT
	movq	-72(%rbp), %rax
	addq	-48(%rbp), %rax
	movq	%rax, -88(%rbp)                 # 8-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, -73(%rbp)                  # 1-byte Spill
	cmpb	$0, %al
	je	.LBB0_10
# %bb.8:
	movb	-73(%rbp), %cl                  # 1-byte Reload
	movq	-88(%rbp), %rax                 # 8-byte Reload
	andq	$7, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB0_10
# %bb.9:
	movq	-88(%rbp), %rdi                 # 8-byte Reload
	callq	__asan_report_store1@PLT
.LBB0_10:
	movq	-88(%rbp), %rax                 # 8-byte Reload
	movb	$0, (%rax)
	movq	-72(%rbp), %rdi
	addq	-48(%rbp), %rdi
	movq	-24(%rbp), %rdx
	leaq	.str.2(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	movq	-72(%rbp), %rax
	movq	%rax, -8(%rbp)
	movl	$1, -36(%rbp)
.LBB0_11:                               # %cleanup
.LBB0_12:                               # %cleanup16
	movq	-8(%rbp), %rax
	addq	$96, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	modify_filename, .Lfunc_end0-modify_filename
	.cfi_endproc
                                        # -- End function
	.globl	image_validator                 # -- Begin function image_validator
	.p2align	4, 0x90
	.type	image_validator,@function
image_validator:                        # @image_validator
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$192, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movl	%ecx, -24(%rbp)
	movl	$0, -28(%rbp)
	movl	$0, -32(%rbp)
	leaq	.str.3(%rip), %rdi
	leaq	.str.4(%rip), %rsi
	callq	fopen@PLT
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	je	.LBB1_2
# %bb.1:                                # %cond.true
	jmp	.LBB1_3
.LBB1_2:                                # %cond.false
	callq	__asan_handle_no_return@PLT
	leaq	.str.5(%rip), %rdi
	leaq	.str.6(%rip), %rsi
	movl	$35, %edx
	leaq	__PRETTY_FUNCTION__.image_validator(%rip), %rcx
	callq	__assert_fail@PLT
.LBB1_3:                                # %cond.end
	movl	$0, -44(%rbp)
	movl	$0, -48(%rbp)
.LBB1_4:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_7 Depth 2
	movl	-48(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jb	.LBB1_6
# %bb.5:                                # %for.cond.cleanup
	movl	$2, -52(%rbp)
	jmp	.LBB1_33
.LBB1_6:                                # %for.body
                                        #   in Loop: Header=BB1_4 Depth=1
	movl	$0, -56(%rbp)
.LBB1_7:                                # %for.cond2
                                        #   Parent Loop BB1_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-56(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jb	.LBB1_9
# %bb.8:                                # %for.cond.cleanup4
                                        #   in Loop: Header=BB1_4 Depth=1
	movl	$5, -52(%rbp)
	jmp	.LBB1_31
.LBB1_9:                                # %for.body5
                                        #   in Loop: Header=BB1_7 Depth=2
	movl	-48(%rbp), %eax
	imull	-20(%rbp), %eax
	addl	-56(%rbp), %eax
	movl	%eax, -32(%rbp)
	movq	-8(%rbp), %rax
	movslq	-32(%rbp), %rcx
	addq	%rcx, %rax
	movq	%rax, -80(%rbp)                 # 8-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, -65(%rbp)                  # 1-byte Spill
	cmpb	$0, %al
	je	.LBB1_12
# %bb.10:                               #   in Loop: Header=BB1_7 Depth=2
	movb	-65(%rbp), %cl                  # 1-byte Reload
	movq	-80(%rbp), %rax                 # 8-byte Reload
	andq	$7, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB1_12
# %bb.11:
	movq	-80(%rbp), %rdi                 # 8-byte Reload
	callq	__asan_report_load1@PLT
.LBB1_12:                               #   in Loop: Header=BB1_7 Depth=2
	movq	-80(%rbp), %rax                 # 8-byte Reload
	movzbl	(%rax), %eax
	movl	%eax, -100(%rbp)                # 4-byte Spill
	movq	-16(%rbp), %rax
	movslq	-32(%rbp), %rcx
	addq	%rcx, %rax
	movq	%rax, -96(%rbp)                 # 8-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, -81(%rbp)                  # 1-byte Spill
	cmpb	$0, %al
	je	.LBB1_15
# %bb.13:                               #   in Loop: Header=BB1_7 Depth=2
	movb	-81(%rbp), %cl                  # 1-byte Reload
	movq	-96(%rbp), %rax                 # 8-byte Reload
	andq	$7, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB1_15
# %bb.14:
	movq	-96(%rbp), %rdi                 # 8-byte Reload
	callq	__asan_report_load1@PLT
.LBB1_15:                               #   in Loop: Header=BB1_7 Depth=2
	movl	-100(%rbp), %eax                # 4-byte Reload
	movq	-96(%rbp), %rcx                 # 8-byte Reload
	movzbl	(%rcx), %ecx
	cmpl	%ecx, %eax
	je	.LBB1_29
# %bb.16:                               # %if.then
                                        #   in Loop: Header=BB1_7 Depth=2
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	movslq	-32(%rbp), %rcx
	addq	%rcx, %rax
	movq	%rax, -112(%rbp)                # 8-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, -101(%rbp)                 # 1-byte Spill
	cmpb	$0, %al
	je	.LBB1_19
# %bb.17:                               #   in Loop: Header=BB1_7 Depth=2
	movb	-101(%rbp), %cl                 # 1-byte Reload
	movq	-112(%rbp), %rax                # 8-byte Reload
	andq	$7, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB1_19
# %bb.18:
	movq	-112(%rbp), %rdi                # 8-byte Reload
	callq	__asan_report_load1@PLT
.LBB1_19:                               #   in Loop: Header=BB1_7 Depth=2
	movq	-112(%rbp), %rax                # 8-byte Reload
	movzbl	(%rax), %eax
	movl	%eax, -132(%rbp)                # 4-byte Spill
	movq	-16(%rbp), %rax
	movslq	-32(%rbp), %rcx
	addq	%rcx, %rax
	movq	%rax, -128(%rbp)                # 8-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, -113(%rbp)                 # 1-byte Spill
	cmpb	$0, %al
	je	.LBB1_22
# %bb.20:                               #   in Loop: Header=BB1_7 Depth=2
	movb	-113(%rbp), %cl                 # 1-byte Reload
	movq	-128(%rbp), %rax                # 8-byte Reload
	andq	$7, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB1_22
# %bb.21:
	movq	-128(%rbp), %rdi                # 8-byte Reload
	callq	__asan_report_load1@PLT
.LBB1_22:                               #   in Loop: Header=BB1_7 Depth=2
	movl	-132(%rbp), %eax                # 4-byte Reload
	movq	-128(%rbp), %rcx                # 8-byte Reload
	movzbl	(%rcx), %ecx
	subl	%ecx, %eax
	movl	%eax, %ecx
	negl	%ecx
	cmovnsl	%ecx, %eax
	addl	-44(%rbp), %eax
	movl	%eax, -44(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -160(%rbp)                # 8-byte Spill
	movl	-56(%rbp), %eax
	movl	%eax, -152(%rbp)                # 4-byte Spill
	movl	-48(%rbp), %eax
	movl	%eax, -148(%rbp)                # 4-byte Spill
	movq	-8(%rbp), %rax
	movslq	-32(%rbp), %rcx
	addq	%rcx, %rax
	movq	%rax, -144(%rbp)                # 8-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, -133(%rbp)                 # 1-byte Spill
	cmpb	$0, %al
	je	.LBB1_25
# %bb.23:                               #   in Loop: Header=BB1_7 Depth=2
	movb	-133(%rbp), %cl                 # 1-byte Reload
	movq	-144(%rbp), %rax                # 8-byte Reload
	andq	$7, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB1_25
# %bb.24:
	movq	-144(%rbp), %rdi                # 8-byte Reload
	callq	__asan_report_load1@PLT
.LBB1_25:                               #   in Loop: Header=BB1_7 Depth=2
	movq	-144(%rbp), %rax                # 8-byte Reload
	movzbl	(%rax), %eax
	movl	%eax, -180(%rbp)                # 4-byte Spill
	movq	-16(%rbp), %rax
	movslq	-32(%rbp), %rcx
	addq	%rcx, %rax
	movq	%rax, -176(%rbp)                # 8-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, -161(%rbp)                 # 1-byte Spill
	cmpb	$0, %al
	je	.LBB1_28
# %bb.26:                               #   in Loop: Header=BB1_7 Depth=2
	movb	-161(%rbp), %cl                 # 1-byte Reload
	movq	-176(%rbp), %rax                # 8-byte Reload
	andq	$7, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB1_28
# %bb.27:
	movq	-176(%rbp), %rdi                # 8-byte Reload
	callq	__asan_report_load1@PLT
.LBB1_28:                               #   in Loop: Header=BB1_7 Depth=2
	movl	-148(%rbp), %ecx                # 4-byte Reload
	movl	-152(%rbp), %edx                # 4-byte Reload
	movq	-160(%rbp), %rdi                # 8-byte Reload
	movl	-180(%rbp), %r8d                # 4-byte Reload
	movq	-176(%rbp), %rax                # 8-byte Reload
	movzbl	(%rax), %eax
	subl	%eax, %r8d
	leaq	.str.7(%rip), %rsi
	movb	$0, %al
	callq	fprintf@PLT
.LBB1_29:                               # %if.end
                                        #   in Loop: Header=BB1_7 Depth=2
	jmp	.LBB1_30
.LBB1_30:                               # %for.inc
                                        #   in Loop: Header=BB1_7 Depth=2
	movl	-56(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -56(%rbp)
	jmp	.LBB1_7
.LBB1_31:                               # %for.end
                                        #   in Loop: Header=BB1_4 Depth=1
	jmp	.LBB1_32
.LBB1_32:                               # %for.inc27
                                        #   in Loop: Header=BB1_4 Depth=1
	movl	-48(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -48(%rbp)
	jmp	.LBB1_4
.LBB1_33:                               # %for.end29
	movq	-40(%rbp), %rdi
	callq	fclose@PLT
	cmpl	$0, -44(%rbp)
	je	.LBB1_35
# %bb.34:                               # %cond.true33
	cvtsi2ssl	-44(%rbp), %xmm0
	cvtsi2ssl	-28(%rbp), %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -184(%rbp)               # 4-byte Spill
	jmp	.LBB1_36
.LBB1_35:                               # %cond.false36
	xorps	%xmm0, %xmm0
	movss	%xmm0, -184(%rbp)               # 4-byte Spill
	jmp	.LBB1_36
.LBB1_36:                               # %cond.end37
	movss	-184(%rbp), %xmm0               # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movsd	%xmm0, -64(%rbp)
	movl	-28(%rbp), %esi
	movl	-20(%rbp), %edx
	imull	-24(%rbp), %edx
	movsd	-64(%rbp), %xmm0                # xmm0 = mem[0],zero
	leaq	.str.8(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
	addq	$192, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	image_validator, .Lfunc_end1-image_validator
	.cfi_endproc
                                        # -- End function
	.globl	fwriteImage                     # -- Begin function fwriteImage
	.p2align	4, 0x90
	.type	fwriteImage,@function
fwriteImage:                            # @fwriteImage
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movl	%edx, -28(%rbp)
	cmpq	$0, -16(%rbp)
	je	.LBB2_3
# %bb.1:                                # %land.lhs.true
	movb	$1, %al
	testb	$1, %al
	jne	.LBB2_2
	jmp	.LBB2_3
.LBB2_2:                                # %cond.true
	jmp	.LBB2_4
.LBB2_3:                                # %cond.false
	callq	__asan_handle_no_return@PLT
	leaq	.str.10(%rip), %rdi
	leaq	.str.6(%rip), %rsi
	movl	$56, %edx
	leaq	__PRETTY_FUNCTION__.fwriteImage(%rip), %rcx
	callq	__assert_fail@PLT
.LBB2_4:                                # %cond.end
	movq	-16(%rbp), %rdi
	leaq	.str.11(%rip), %rsi
	callq	fopen@PLT
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.LBB2_8
# %bb.5:                                # %if.then
	movq	stderr@GOTPCREL(%rip), %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.LBB2_7
# %bb.6:
	movq	stderr@GOTPCREL(%rip), %rdi
	callq	__asan_report_load8@PLT
.LBB2_7:
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-16(%rbp), %rdx
	leaq	.str.12(%rip), %rsi
	movb	$0, %al
	callq	fprintf@PLT
	movl	$-1, -4(%rbp)
	movl	$1, -44(%rbp)
	jmp	.LBB2_9
.LBB2_8:                                # %if.end
	movq	-24(%rbp), %rdi
	movl	-28(%rbp), %eax
	movl	%eax, %edx
	movq	-40(%rbp), %rcx
	movl	$1, %esi
	callq	fwrite@PLT
	movq	-40(%rbp), %rdi
	callq	fclose@PLT
	movl	$0, -4(%rbp)
	movl	$1, -44(%rbp)
.LBB2_9:                                # %cleanup
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	fwriteImage, .Lfunc_end2-fwriteImage
	.cfi_endproc
                                        # -- End function
	.section	.text.asan.module_ctor,"axGR",@progbits,asan.module_ctor,comdat
	.p2align	4, 0x90                         # -- Begin function asan.module_ctor
	.type	asan.module_ctor,@function
asan.module_ctor:                       # @asan.module_ctor
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	callq	__asan_init@PLT
	callq	__asan_version_mismatch_check_v8@PLT
	leaq	___asan_globals_registered(%rip), %rdi
	movq	__start_asan_globals@GOTPCREL(%rip), %rsi
	movq	__stop_asan_globals@GOTPCREL(%rip), %rdx
	callq	__asan_register_elf_globals@PLT
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	asan.module_ctor, .Lfunc_end3-asan.module_ctor
	.cfi_endproc
                                        # -- End function
	.section	.text.asan.module_dtor,"axGR",@progbits,asan.module_dtor,comdat
	.p2align	4, 0x90                         # -- Begin function asan.module_dtor
	.type	asan.module_dtor,@function
asan.module_dtor:                       # @asan.module_dtor
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	leaq	___asan_globals_registered(%rip), %rdi
	movq	__start_asan_globals@GOTPCREL(%rip), %rsi
	movq	__stop_asan_globals@GOTPCREL(%rip), %rdx
	callq	__asan_unregister_elf_globals@PLT
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end4:
	.size	asan.module_dtor, .Lfunc_end4-asan.module_dtor
	.cfi_endproc
                                        # -- End function
	.type	.str,@object                    # @.str
	.section	.rodata..str,"aG",@progbits,.str.e68ad1cebe94a0c854870e0b86d8978d,comdat
	.p2align	5, 0x0
.str:
	.asciz	".raw"
	.zero	27
	.size	.str, 32

	.type	.str.1,@object                  # @.str.1
	.section	.rodata..str.1,"aG",@progbits,.str.1.e68ad1cebe94a0c854870e0b86d8978d,comdat
	.p2align	5, 0x0
.str.1:
	.asciz	"Invalid or missing .raw extension\n"
	.zero	61
	.size	.str.1, 96

	.type	.str.2,@object                  # @.str.2
	.section	.rodata..str.2,"aG",@progbits,.str.2.e68ad1cebe94a0c854870e0b86d8978d,comdat
	.p2align	5, 0x0
.str.2:
	.asciz	"_%s.raw"
	.zero	24
	.size	.str.2, 32

	.type	.str.3,@object                  # @.str.3
	.section	.rodata..str.3,"aG",@progbits,.str.3.e68ad1cebe94a0c854870e0b86d8978d,comdat
	.p2align	5, 0x0
.str.3:
	.asciz	"out.log"
	.zero	24
	.size	.str.3, 32

	.type	.str.4,@object                  # @.str.4
	.section	.rodata..str.4,"aG",@progbits,.str.4.e68ad1cebe94a0c854870e0b86d8978d,comdat
	.p2align	5, 0x0
.str.4:
	.asciz	"w"
	.zero	30
	.size	.str.4, 32

	.type	.str.5,@object                  # @.str.5
	.section	.rodata..str.5,"aG",@progbits,.str.5.e68ad1cebe94a0c854870e0b86d8978d,comdat
	.p2align	5, 0x0
.str.5:
	.asciz	"resf != NULL"
	.zero	19
	.size	.str.5, 32

	.type	.str.6,@object                  # @.str.6
	.section	.rodata..str.6,"aG",@progbits,.str.6.e68ad1cebe94a0c854870e0b86d8978d,comdat
	.p2align	5, 0x0
.str.6:
	.asciz	"src/utils.c"
	.zero	20
	.size	.str.6, 32

	.type	__PRETTY_FUNCTION__.image_validator,@object # @__PRETTY_FUNCTION__.image_validator
	.section	.rodata.__PRETTY_FUNCTION__.image_validator,"aG",@progbits,__PRETTY_FUNCTION__.image_validator.e68ad1cebe94a0c854870e0b86d8978d,comdat
	.p2align	5, 0x0
__PRETTY_FUNCTION__.image_validator:
	.asciz	"void image_validator(uint8_t *, uint8_t *, uint32_t, uint32_t)"
	.zero	33
	.size	__PRETTY_FUNCTION__.image_validator, 96

	.type	.str.7,@object                  # @.str.7
	.section	.rodata..str.7,"aG",@progbits,.str.7.e68ad1cebe94a0c854870e0b86d8978d,comdat
	.p2align	5, 0x0
.str.7:
	.asciz	"Error on pixel (%d,\t%d),\t with %d\n"
	.zero	61
	.size	.str.7, 96

	.type	.str.8,@object                  # @.str.8
	.section	.rodata..str.8,"aG",@progbits,.str.8.e68ad1cebe94a0c854870e0b86d8978d,comdat
	.p2align	5, 0x0
.str.8:
	.asciz	"Error cnt = %d / %d,\t avg_err  = %.4f\n"
	.zero	57
	.size	.str.8, 96

	.type	.str.9,@object                  # @.str.9
	.section	.rodata..str.9,"aG",@progbits,.str.9.e68ad1cebe94a0c854870e0b86d8978d,comdat
	.p2align	5, 0x0
.str.9:
	.asciz	"Incorect output file"
	.zero	43
	.size	.str.9, 64

	.type	.str.10,@object                 # @.str.10
	.section	.rodata..str.10,"aG",@progbits,.str.10.e68ad1cebe94a0c854870e0b86d8978d,comdat
	.p2align	5, 0x0
.str.10:
	.asciz	"output_path != NULL && \"Incorect output file\""
	.zero	50
	.size	.str.10, 96

	.type	__PRETTY_FUNCTION__.fwriteImage,@object # @__PRETTY_FUNCTION__.fwriteImage
	.section	.rodata.__PRETTY_FUNCTION__.fwriteImage,"aG",@progbits,__PRETTY_FUNCTION__.fwriteImage.e68ad1cebe94a0c854870e0b86d8978d,comdat
	.p2align	5, 0x0
__PRETTY_FUNCTION__.fwriteImage:
	.asciz	"int fwriteImage(const char *, uint8_t *, uint32_t)"
	.zero	45
	.size	__PRETTY_FUNCTION__.fwriteImage, 96

	.type	.str.11,@object                 # @.str.11
	.section	.rodata..str.11,"aG",@progbits,.str.11.e68ad1cebe94a0c854870e0b86d8978d,comdat
	.p2align	5, 0x0
.str.11:
	.asciz	"wb"
	.zero	29
	.size	.str.11, 32

	.type	.str.12,@object                 # @.str.12
	.section	.rodata..str.12,"aG",@progbits,.str.12.e68ad1cebe94a0c854870e0b86d8978d,comdat
	.p2align	5, 0x0
.str.12:
	.asciz	"Error writing output file %s.\n"
	.zero	33
	.size	.str.12, 64

	.type	.L___asan_gen_,@object          # @___asan_gen_
	.section	.rodata,"a",@progbits
.L___asan_gen_:
	.asciz	"src/utils.c"
	.size	.L___asan_gen_, 12

	.type	.L___asan_gen_.13,@object       # @___asan_gen_.13
	.section	.rodata.str1.1,"aMS",@progbits,1
.L___asan_gen_.13:
	.asciz	".str"
	.size	.L___asan_gen_.13, 5

	.type	.L___asan_gen_.14,@object       # @___asan_gen_.14
.L___asan_gen_.14:
	.asciz	".str.1"
	.size	.L___asan_gen_.14, 7

	.type	.L___asan_gen_.15,@object       # @___asan_gen_.15
.L___asan_gen_.15:
	.asciz	".str.2"
	.size	.L___asan_gen_.15, 7

	.type	.L___asan_gen_.16,@object       # @___asan_gen_.16
.L___asan_gen_.16:
	.asciz	".str.3"
	.size	.L___asan_gen_.16, 7

	.type	.L___asan_gen_.17,@object       # @___asan_gen_.17
.L___asan_gen_.17:
	.asciz	".str.4"
	.size	.L___asan_gen_.17, 7

	.type	.L___asan_gen_.18,@object       # @___asan_gen_.18
.L___asan_gen_.18:
	.asciz	".str.5"
	.size	.L___asan_gen_.18, 7

	.type	.L___asan_gen_.19,@object       # @___asan_gen_.19
.L___asan_gen_.19:
	.asciz	".str.6"
	.size	.L___asan_gen_.19, 7

	.type	.L___asan_gen_.20,@object       # @___asan_gen_.20
.L___asan_gen_.20:
	.asciz	"__PRETTY_FUNCTION__.image_validator"
	.size	.L___asan_gen_.20, 36

	.type	.L___asan_gen_.21,@object       # @___asan_gen_.21
.L___asan_gen_.21:
	.asciz	".str.7"
	.size	.L___asan_gen_.21, 7

	.type	.L___asan_gen_.22,@object       # @___asan_gen_.22
.L___asan_gen_.22:
	.asciz	".str.8"
	.size	.L___asan_gen_.22, 7

	.type	.L___asan_gen_.23,@object       # @___asan_gen_.23
.L___asan_gen_.23:
	.asciz	".str.9"
	.size	.L___asan_gen_.23, 7

	.type	.L___asan_gen_.24,@object       # @___asan_gen_.24
.L___asan_gen_.24:
	.asciz	".str.10"
	.size	.L___asan_gen_.24, 8

	.type	.L___asan_gen_.25,@object       # @___asan_gen_.25
.L___asan_gen_.25:
	.asciz	"__PRETTY_FUNCTION__.fwriteImage"
	.size	.L___asan_gen_.25, 32

	.type	.L___asan_gen_.26,@object       # @___asan_gen_.26
.L___asan_gen_.26:
	.asciz	".str.11"
	.size	.L___asan_gen_.26, 8

	.type	.L___asan_gen_.27,@object       # @___asan_gen_.27
.L___asan_gen_.27:
	.asciz	".str.12"
	.size	.L___asan_gen_.27, 8

	.type	.L__asan_global_.str,@object    # @__asan_global_.str
	.section	asan_globals,"awoG",@progbits,.str,.str.e68ad1cebe94a0c854870e0b86d8978d,comdat,unique,1
	.p2align	4, 0x0
.L__asan_global_.str:
	.quad	.L__unnamed_1
	.quad	5                               # 0x5
	.quad	32                              # 0x20
	.quad	.L___asan_gen_.13
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str, 64

	.type	.L__asan_global_.str.1,@object  # @__asan_global_.str.1
	.section	asan_globals,"awoG",@progbits,.str.1,.str.1.e68ad1cebe94a0c854870e0b86d8978d,comdat,unique,2
	.p2align	4, 0x0
.L__asan_global_.str.1:
	.quad	.L__unnamed_2
	.quad	35                              # 0x23
	.quad	96                              # 0x60
	.quad	.L___asan_gen_.14
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.1, 64

	.type	.L__asan_global_.str.2,@object  # @__asan_global_.str.2
	.section	asan_globals,"awoG",@progbits,.str.2,.str.2.e68ad1cebe94a0c854870e0b86d8978d,comdat,unique,3
	.p2align	4, 0x0
.L__asan_global_.str.2:
	.quad	.L__unnamed_3
	.quad	8                               # 0x8
	.quad	32                              # 0x20
	.quad	.L___asan_gen_.15
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.2, 64

	.type	.L__asan_global_.str.3,@object  # @__asan_global_.str.3
	.section	asan_globals,"awoG",@progbits,.str.3,.str.3.e68ad1cebe94a0c854870e0b86d8978d,comdat,unique,4
	.p2align	4, 0x0
.L__asan_global_.str.3:
	.quad	.L__unnamed_4
	.quad	8                               # 0x8
	.quad	32                              # 0x20
	.quad	.L___asan_gen_.16
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.3, 64

	.type	.L__asan_global_.str.4,@object  # @__asan_global_.str.4
	.section	asan_globals,"awoG",@progbits,.str.4,.str.4.e68ad1cebe94a0c854870e0b86d8978d,comdat,unique,5
	.p2align	4, 0x0
.L__asan_global_.str.4:
	.quad	.L__unnamed_5
	.quad	2                               # 0x2
	.quad	32                              # 0x20
	.quad	.L___asan_gen_.17
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.4, 64

	.type	.L__asan_global_.str.5,@object  # @__asan_global_.str.5
	.section	asan_globals,"awoG",@progbits,.str.5,.str.5.e68ad1cebe94a0c854870e0b86d8978d,comdat,unique,6
	.p2align	4, 0x0
.L__asan_global_.str.5:
	.quad	.L__unnamed_6
	.quad	13                              # 0xd
	.quad	32                              # 0x20
	.quad	.L___asan_gen_.18
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.5, 64

	.type	.L__asan_global_.str.6,@object  # @__asan_global_.str.6
	.section	asan_globals,"awoG",@progbits,.str.6,.str.6.e68ad1cebe94a0c854870e0b86d8978d,comdat,unique,7
	.p2align	4, 0x0
.L__asan_global_.str.6:
	.quad	.L__unnamed_7
	.quad	12                              # 0xc
	.quad	32                              # 0x20
	.quad	.L___asan_gen_.19
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.6, 64

	.type	.L__asan_global___PRETTY_FUNCTION__.image_validator,@object # @__asan_global___PRETTY_FUNCTION__.image_validator
	.section	asan_globals,"awoG",@progbits,__PRETTY_FUNCTION__.image_validator,__PRETTY_FUNCTION__.image_validator.e68ad1cebe94a0c854870e0b86d8978d,comdat,unique,8
	.p2align	4, 0x0
.L__asan_global___PRETTY_FUNCTION__.image_validator:
	.quad	.L__unnamed_8
	.quad	63                              # 0x3f
	.quad	96                              # 0x60
	.quad	.L___asan_gen_.20
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global___PRETTY_FUNCTION__.image_validator, 64

	.type	.L__asan_global_.str.7,@object  # @__asan_global_.str.7
	.section	asan_globals,"awoG",@progbits,.str.7,.str.7.e68ad1cebe94a0c854870e0b86d8978d,comdat,unique,9
	.p2align	4, 0x0
.L__asan_global_.str.7:
	.quad	.L__unnamed_9
	.quad	35                              # 0x23
	.quad	96                              # 0x60
	.quad	.L___asan_gen_.21
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.7, 64

	.type	.L__asan_global_.str.8,@object  # @__asan_global_.str.8
	.section	asan_globals,"awoG",@progbits,.str.8,.str.8.e68ad1cebe94a0c854870e0b86d8978d,comdat,unique,10
	.p2align	4, 0x0
.L__asan_global_.str.8:
	.quad	.L__unnamed_10
	.quad	39                              # 0x27
	.quad	96                              # 0x60
	.quad	.L___asan_gen_.22
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.8, 64

	.type	.L__asan_global_.str.9,@object  # @__asan_global_.str.9
	.section	asan_globals,"awoG",@progbits,.str.9,.str.9.e68ad1cebe94a0c854870e0b86d8978d,comdat,unique,11
	.p2align	4, 0x0
.L__asan_global_.str.9:
	.quad	.L__unnamed_11
	.quad	21                              # 0x15
	.quad	64                              # 0x40
	.quad	.L___asan_gen_.23
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.9, 64

	.type	.L__asan_global_.str.10,@object # @__asan_global_.str.10
	.section	asan_globals,"awoG",@progbits,.str.10,.str.10.e68ad1cebe94a0c854870e0b86d8978d,comdat,unique,12
	.p2align	4, 0x0
.L__asan_global_.str.10:
	.quad	.L__unnamed_12
	.quad	46                              # 0x2e
	.quad	96                              # 0x60
	.quad	.L___asan_gen_.24
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.10, 64

	.type	.L__asan_global___PRETTY_FUNCTION__.fwriteImage,@object # @__asan_global___PRETTY_FUNCTION__.fwriteImage
	.section	asan_globals,"awoG",@progbits,__PRETTY_FUNCTION__.fwriteImage,__PRETTY_FUNCTION__.fwriteImage.e68ad1cebe94a0c854870e0b86d8978d,comdat,unique,13
	.p2align	4, 0x0
.L__asan_global___PRETTY_FUNCTION__.fwriteImage:
	.quad	.L__unnamed_13
	.quad	51                              # 0x33
	.quad	96                              # 0x60
	.quad	.L___asan_gen_.25
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global___PRETTY_FUNCTION__.fwriteImage, 64

	.type	.L__asan_global_.str.11,@object # @__asan_global_.str.11
	.section	asan_globals,"awoG",@progbits,.str.11,.str.11.e68ad1cebe94a0c854870e0b86d8978d,comdat,unique,14
	.p2align	4, 0x0
.L__asan_global_.str.11:
	.quad	.L__unnamed_14
	.quad	3                               # 0x3
	.quad	32                              # 0x20
	.quad	.L___asan_gen_.26
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.11, 64

	.type	.L__asan_global_.str.12,@object # @__asan_global_.str.12
	.section	asan_globals,"awoG",@progbits,.str.12,.str.12.e68ad1cebe94a0c854870e0b86d8978d,comdat,unique,15
	.p2align	4, 0x0
.L__asan_global_.str.12:
	.quad	.L__unnamed_15
	.quad	31                              # 0x1f
	.quad	64                              # 0x40
	.quad	.L___asan_gen_.27
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.12, 64

	.hidden	___asan_globals_registered      # @___asan_globals_registered
	.type	___asan_globals_registered,@object
	.comm	___asan_globals_registered,8,8
	.hidden	__start_asan_globals
	.hidden	__stop_asan_globals
	.section	.init_array.1,"awG",@init_array,asan.module_ctor,comdat
	.p2align	3, 0x0
	.quad	asan.module_ctor
	.section	.fini_array.1,"awG",@fini_array,asan.module_dtor,comdat
	.p2align	3, 0x0
	.quad	asan.module_dtor
.set .L__unnamed_1, .str
.set .L__unnamed_2, .str.1
.set .L__unnamed_3, .str.2
.set .L__unnamed_4, .str.3
.set .L__unnamed_5, .str.4
.set .L__unnamed_6, .str.5
.set .L__unnamed_7, .str.6
.set .L__unnamed_8, __PRETTY_FUNCTION__.image_validator
.set .L__unnamed_9, .str.7
.set .L__unnamed_10, .str.8
.set .L__unnamed_11, .str.9
.set .L__unnamed_12, .str.10
.set .L__unnamed_13, __PRETTY_FUNCTION__.fwriteImage
.set .L__unnamed_14, .str.11
.set .L__unnamed_15, .str.12
	.weak	__start_asan_globals
	.weak	__stop_asan_globals
	.ident	"clang version 19.1.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym strrchr
	.addrsig_sym strcmp
	.addrsig_sym fprintf
	.addrsig_sym strlen
	.addrsig_sym malloc
	.addrsig_sym strncpy
	.addrsig_sym sprintf
	.addrsig_sym fopen
	.addrsig_sym __assert_fail
	.addrsig_sym fclose
	.addrsig_sym printf
	.addrsig_sym fwrite
	.addrsig_sym __asan_report_load1
	.addrsig_sym __asan_report_load8
	.addrsig_sym __asan_report_store1
	.addrsig_sym __asan_handle_no_return
	.addrsig_sym __asan_register_elf_globals
	.addrsig_sym __asan_unregister_elf_globals
	.addrsig_sym __asan_init
	.addrsig_sym asan.module_ctor
	.addrsig_sym __asan_version_mismatch_check_v8
	.addrsig_sym asan.module_dtor
	.addrsig_sym .str
	.addrsig_sym stderr
	.addrsig_sym .str.1
	.addrsig_sym .str.2
	.addrsig_sym .str.3
	.addrsig_sym .str.4
	.addrsig_sym .str.5
	.addrsig_sym .str.6
	.addrsig_sym __PRETTY_FUNCTION__.image_validator
	.addrsig_sym .str.7
	.addrsig_sym .str.8
	.addrsig_sym .str.9
	.addrsig_sym .str.10
	.addrsig_sym __PRETTY_FUNCTION__.fwriteImage
	.addrsig_sym .str.11
	.addrsig_sym .str.12
	.addrsig_sym .L___asan_gen_
	.addrsig_sym .L__asan_global_.str
	.addrsig_sym .L__asan_global_.str.1
	.addrsig_sym .L__asan_global_.str.2
	.addrsig_sym .L__asan_global_.str.3
	.addrsig_sym .L__asan_global_.str.4
	.addrsig_sym .L__asan_global_.str.5
	.addrsig_sym .L__asan_global_.str.6
	.addrsig_sym .L__asan_global___PRETTY_FUNCTION__.image_validator
	.addrsig_sym .L__asan_global_.str.7
	.addrsig_sym .L__asan_global_.str.8
	.addrsig_sym .L__asan_global_.str.9
	.addrsig_sym .L__asan_global_.str.10
	.addrsig_sym .L__asan_global___PRETTY_FUNCTION__.fwriteImage
	.addrsig_sym .L__asan_global_.str.11
	.addrsig_sym .L__asan_global_.str.12
	.addrsig_sym ___asan_globals_registered
	.addrsig_sym __start_asan_globals
	.addrsig_sym __stop_asan_globals
	.addrsig_sym .L__unnamed_1
	.addrsig_sym .L__unnamed_2
	.addrsig_sym .L__unnamed_3
	.addrsig_sym .L__unnamed_4
	.addrsig_sym .L__unnamed_5
	.addrsig_sym .L__unnamed_6
	.addrsig_sym .L__unnamed_7
	.addrsig_sym .L__unnamed_8
	.addrsig_sym .L__unnamed_9
	.addrsig_sym .L__unnamed_10
	.addrsig_sym .L__unnamed_11
	.addrsig_sym .L__unnamed_12
	.addrsig_sym .L__unnamed_13
	.addrsig_sym .L__unnamed_14
	.addrsig_sym .L__unnamed_15
