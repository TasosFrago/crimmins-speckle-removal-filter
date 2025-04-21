	.text
	.file	"crimmins.c"
	.globl	dark_pass_logic                 # -- Begin function dark_pass_logic
	.p2align	4, 0x90
	.type	dark_pass_logic,@function
dark_pass_logic:                        # @dark_pass_logic
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movb	%dl, %al
	movb	%sil, %cl
	movb	%dil, %dl
	movb	%dl, -1(%rbp)
	movb	%cl, -2(%rbp)
	movb	%al, -3(%rbp)
	movzbl	-1(%rbp), %eax
	movzbl	-2(%rbp), %ecx
	addl	$2, %ecx
	cmpl	%ecx, %eax
	jl	.LBB0_2
# %bb.1:                                # %if.then
	movb	-2(%rbp), %al
	addb	$1, %al
	movb	%al, -2(%rbp)
.LBB0_2:                                # %if.end
	movzbl	-1(%rbp), %eax
	movzbl	-2(%rbp), %ecx
	cmpl	%ecx, %eax
	jle	.LBB0_5
# %bb.3:                                # %land.lhs.true
	movzbl	-2(%rbp), %eax
	movzbl	-3(%rbp), %ecx
	cmpl	%ecx, %eax
	jg	.LBB0_5
# %bb.4:                                # %if.then11
	movb	-2(%rbp), %al
	addb	$1, %al
	movb	%al, -2(%rbp)
.LBB0_5:                                # %if.end13
	movzbl	-3(%rbp), %eax
	movzbl	-2(%rbp), %ecx
	cmpl	%ecx, %eax
	jle	.LBB0_8
# %bb.6:                                # %land.lhs.true18
	movzbl	-2(%rbp), %eax
	movzbl	-1(%rbp), %ecx
	cmpl	%ecx, %eax
	jg	.LBB0_8
# %bb.7:                                # %if.then23
	movb	-2(%rbp), %al
	addb	$1, %al
	movb	%al, -2(%rbp)
.LBB0_8:                                # %if.end25
	movzbl	-3(%rbp), %eax
	movzbl	-2(%rbp), %ecx
	addl	$2, %ecx
	cmpl	%ecx, %eax
	jl	.LBB0_10
# %bb.9:                                # %if.then31
	movb	-2(%rbp), %al
	addb	$1, %al
	movb	%al, -2(%rbp)
.LBB0_10:                               # %if.end33
	movb	-2(%rbp), %al
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	dark_pass_logic, .Lfunc_end0-dark_pass_logic
	.cfi_endproc
                                        # -- End function
	.globl	light_pass_logic                # -- Begin function light_pass_logic
	.p2align	4, 0x90
	.type	light_pass_logic,@function
light_pass_logic:                       # @light_pass_logic
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movb	%dl, %al
	movb	%sil, %cl
	movb	%dil, %dl
	movb	%dl, -1(%rbp)
	movb	%cl, -2(%rbp)
	movb	%al, -3(%rbp)
	movzbl	-1(%rbp), %eax
	movzbl	-2(%rbp), %ecx
	subl	$2, %ecx
	cmpl	%ecx, %eax
	jg	.LBB1_2
# %bb.1:                                # %if.then
	movb	-2(%rbp), %al
	addb	$-1, %al
	movb	%al, -2(%rbp)
.LBB1_2:                                # %if.end
	movzbl	-1(%rbp), %eax
	movzbl	-2(%rbp), %ecx
	cmpl	%ecx, %eax
	jge	.LBB1_5
# %bb.3:                                # %land.lhs.true
	movzbl	-2(%rbp), %eax
	movzbl	-3(%rbp), %ecx
	cmpl	%ecx, %eax
	jl	.LBB1_5
# %bb.4:                                # %if.then11
	movb	-2(%rbp), %al
	addb	$-1, %al
	movb	%al, -2(%rbp)
.LBB1_5:                                # %if.end13
	movzbl	-3(%rbp), %eax
	movzbl	-2(%rbp), %ecx
	cmpl	%ecx, %eax
	jge	.LBB1_8
# %bb.6:                                # %land.lhs.true18
	movzbl	-2(%rbp), %eax
	movzbl	-1(%rbp), %ecx
	cmpl	%ecx, %eax
	jl	.LBB1_8
# %bb.7:                                # %if.then23
	movb	-2(%rbp), %al
	addb	$-1, %al
	movb	%al, -2(%rbp)
.LBB1_8:                                # %if.end25
	movzbl	-3(%rbp), %eax
	movzbl	-2(%rbp), %ecx
	subl	$2, %ecx
	cmpl	%ecx, %eax
	jg	.LBB1_10
# %bb.9:                                # %if.then31
	movb	-2(%rbp), %al
	addb	$-1, %al
	movb	%al, -2(%rbp)
.LBB1_10:                               # %if.end33
	movb	-2(%rbp), %al
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	light_pass_logic, .Lfunc_end1-light_pass_logic
	.cfi_endproc
                                        # -- End function
	.globl	pass_func                       # -- Begin function pass_func
	.p2align	4, 0x90
	.type	pass_func,@function
pass_func:                              # @pass_func
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$160, %rsp
	movq	16(%rbp), %rax
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movl	%ecx, -24(%rbp)
	movl	%r8d, -28(%rbp)
	movl	%r9d, -32(%rbp)
	movl	$1, -36(%rbp)
.LBB2_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_4 Depth 2
	movl	-36(%rbp), %eax
	movl	-24(%rbp), %ecx
	subl	$1, %ecx
	cmpl	%ecx, %eax
	jb	.LBB2_3
# %bb.2:                                # %for.cond.cleanup
	movl	$2, -40(%rbp)
	jmp	.LBB2_28
.LBB2_3:                                # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	movq	-16(%rbp), %rax
	movl	-36(%rbp), %ecx
	subl	-32(%rbp), %ecx
	imull	-20(%rbp), %ecx
	movl	%ecx, %ecx
                                        # kill: def $rcx killed $ecx
	addq	%rcx, %rax
	movq	%rax, -48(%rbp)
	movq	-16(%rbp), %rax
	movl	-36(%rbp), %ecx
	imull	-20(%rbp), %ecx
	movl	%ecx, %ecx
                                        # kill: def $rcx killed $ecx
	addq	%rcx, %rax
	movq	%rax, -56(%rbp)
	movq	-16(%rbp), %rax
	movl	-36(%rbp), %ecx
	addl	-32(%rbp), %ecx
	imull	-20(%rbp), %ecx
	movl	%ecx, %ecx
                                        # kill: def $rcx killed $ecx
	addq	%rcx, %rax
	movq	%rax, -64(%rbp)
	movq	-8(%rbp), %rax
	movl	-36(%rbp), %ecx
	imull	-20(%rbp), %ecx
	movl	%ecx, %ecx
                                        # kill: def $rcx killed $ecx
	addq	%rcx, %rax
	movq	%rax, -72(%rbp)
	movl	$1, -76(%rbp)
.LBB2_4:                                # %for.cond11
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-76(%rbp), %eax
	movl	-20(%rbp), %ecx
	subl	$1, %ecx
	cmpl	%ecx, %eax
	jb	.LBB2_6
# %bb.5:                                # %for.cond.cleanup14
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	$5, -40(%rbp)
	jmp	.LBB2_26
.LBB2_6:                                # %for.body15
                                        #   in Loop: Header=BB2_4 Depth=2
	movq	-48(%rbp), %rax
	movl	-76(%rbp), %ecx
	subl	-28(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	%rcx, %rax
	movq	%rax, -88(%rbp)                 # 8-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, -80(%rbp)                  # 1-byte Spill
	cmpb	$0, %al
	je	.LBB2_9
# %bb.7:                                #   in Loop: Header=BB2_4 Depth=2
	movb	-80(%rbp), %cl                  # 1-byte Reload
	movq	-88(%rbp), %rax                 # 8-byte Reload
	andq	$7, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB2_9
# %bb.8:
	movq	-88(%rbp), %rdi                 # 8-byte Reload
	callq	__asan_report_load1@PLT
.LBB2_9:                                #   in Loop: Header=BB2_4 Depth=2
	movq	-88(%rbp), %rax                 # 8-byte Reload
	movb	(%rax), %al
	movb	%al, -77(%rbp)
	movq	-56(%rbp), %rax
	movslq	-76(%rbp), %rcx
	addq	%rcx, %rax
	movq	%rax, -104(%rbp)                # 8-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, -89(%rbp)                  # 1-byte Spill
	cmpb	$0, %al
	je	.LBB2_12
# %bb.10:                               #   in Loop: Header=BB2_4 Depth=2
	movb	-89(%rbp), %cl                  # 1-byte Reload
	movq	-104(%rbp), %rax                # 8-byte Reload
	andq	$7, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB2_12
# %bb.11:
	movq	-104(%rbp), %rdi                # 8-byte Reload
	callq	__asan_report_load1@PLT
.LBB2_12:                               #   in Loop: Header=BB2_4 Depth=2
	movq	-104(%rbp), %rax                # 8-byte Reload
	movb	(%rax), %al
	movb	%al, -78(%rbp)
	movq	-64(%rbp), %rax
	movl	-76(%rbp), %ecx
	addl	-28(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	%rcx, %rax
	movq	%rax, -120(%rbp)                # 8-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, -105(%rbp)                 # 1-byte Spill
	cmpb	$0, %al
	je	.LBB2_15
# %bb.13:                               #   in Loop: Header=BB2_4 Depth=2
	movb	-105(%rbp), %cl                 # 1-byte Reload
	movq	-120(%rbp), %rax                # 8-byte Reload
	andq	$7, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB2_15
# %bb.14:
	movq	-120(%rbp), %rdi                # 8-byte Reload
	callq	__asan_report_load1@PLT
.LBB2_15:                               #   in Loop: Header=BB2_4 Depth=2
	movq	-120(%rbp), %rax                # 8-byte Reload
	movb	(%rax), %al
	movb	%al, -79(%rbp)
	movq	16(%rbp), %rax
	movb	-77(%rbp), %dl
	movb	-78(%rbp), %cl
	movzbl	%dl, %edi
	movzbl	%cl, %esi
	movzbl	-79(%rbp), %edx
	callq	*%rax
	movb	%al, -78(%rbp)
	movzbl	-78(%rbp), %eax
	cmpl	$0, %eax
	jge	.LBB2_17
# %bb.16:                               # %cond.true
                                        #   in Loop: Header=BB2_4 Depth=2
	xorl	%eax, %eax
	movl	%eax, -124(%rbp)                # 4-byte Spill
	jmp	.LBB2_21
.LBB2_17:                               # %cond.false
                                        #   in Loop: Header=BB2_4 Depth=2
	movzbl	-78(%rbp), %eax
	cmpl	$255, %eax
	jle	.LBB2_19
# %bb.18:                               # %cond.true27
                                        #   in Loop: Header=BB2_4 Depth=2
	movl	$255, %eax
	movl	%eax, -128(%rbp)                # 4-byte Spill
	jmp	.LBB2_20
.LBB2_19:                               # %cond.false28
                                        #   in Loop: Header=BB2_4 Depth=2
	movzbl	-78(%rbp), %eax
	movl	%eax, -128(%rbp)                # 4-byte Spill
.LBB2_20:                               # %cond.end
                                        #   in Loop: Header=BB2_4 Depth=2
	movl	-128(%rbp), %eax                # 4-byte Reload
	movl	%eax, -124(%rbp)                # 4-byte Spill
.LBB2_21:                               # %cond.end30
                                        #   in Loop: Header=BB2_4 Depth=2
	movl	-124(%rbp), %eax                # 4-byte Reload
                                        # kill: def $al killed $al killed $eax
	movb	%al, -145(%rbp)                 # 1-byte Spill
	movq	-72(%rbp), %rax
	movslq	-76(%rbp), %rcx
	addq	%rcx, %rax
	movq	%rax, -144(%rbp)                # 8-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, -129(%rbp)                 # 1-byte Spill
	cmpb	$0, %al
	je	.LBB2_24
# %bb.22:                               #   in Loop: Header=BB2_4 Depth=2
	movb	-129(%rbp), %cl                 # 1-byte Reload
	movq	-144(%rbp), %rax                # 8-byte Reload
	andq	$7, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB2_24
# %bb.23:
	movq	-144(%rbp), %rdi                # 8-byte Reload
	callq	__asan_report_store1@PLT
.LBB2_24:                               #   in Loop: Header=BB2_4 Depth=2
	movq	-144(%rbp), %rax                # 8-byte Reload
	movb	-145(%rbp), %cl                 # 1-byte Reload
	movb	%cl, (%rax)
# %bb.25:                               # %for.inc
                                        #   in Loop: Header=BB2_4 Depth=2
	movl	-76(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -76(%rbp)
	jmp	.LBB2_4
.LBB2_26:                               # %for.end
                                        #   in Loop: Header=BB2_1 Depth=1
# %bb.27:                               # %for.inc35
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	.LBB2_1
.LBB2_28:                               # %for.end37
	addq	$160, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	pass_func, .Lfunc_end2-pass_func
	.cfi_endproc
                                        # -- End function
	.globl	crimmings_speckle_removal_filter # -- Begin function crimmings_speckle_removal_filter
	.p2align	4, 0x90
	.type	crimmings_speckle_removal_filter,@function
crimmings_speckle_removal_filter:       # @crimmings_speckle_removal_filter
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$144, %rsp
	movb	%cl, %al
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movb	%al, -17(%rbp)
	movl	-12(%rbp), %eax
	imull	-16(%rbp), %eax
	movl	%eax, %eax
	movl	%eax, %edi
	callq	malloc@PLT
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	.LBB3_3
# %bb.1:                                # %land.lhs.true
	movb	$1, %al
	testb	$1, %al
	jne	.LBB3_2
	jmp	.LBB3_3
.LBB3_2:                                # %cond.true
	jmp	.LBB3_4
.LBB3_3:                                # %cond.false
	callq	__asan_handle_no_return@PLT
	leaq	.str.1(%rip), %rdi
	leaq	.str.2(%rip), %rsi
	movl	$57, %edx
	leaq	__PRETTY_FUNCTION__.crimmings_speckle_removal_filter(%rip), %rcx
	callq	__assert_fail@PLT
.LBB3_4:                                # %cond.end
	movq	-32(%rbp), %rdi
	movq	-8(%rbp), %rsi
	movl	-12(%rbp), %eax
	imull	-16(%rbp), %eax
	movl	%eax, %eax
	movl	%eax, %edx
	callq	__asan_memcpy@PLT
	movl	$0, -36(%rbp)
.LBB3_5:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_8 Depth 2
	movl	-36(%rbp), %eax
	movzbl	-17(%rbp), %ecx
	cmpl	%ecx, %eax
	jl	.LBB3_7
# %bb.6:                                # %for.cond.cleanup
	movl	$2, -40(%rbp)
	jmp	.LBB3_25
.LBB3_7:                                # %for.body
                                        #   in Loop: Header=BB3_5 Depth=1
	movl	$0, -44(%rbp)
.LBB3_8:                                # %for.cond7
                                        #   Parent Loop BB3_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$8, -44(%rbp)
	jl	.LBB3_10
# %bb.9:                                # %for.cond.cleanup10
                                        #   in Loop: Header=BB3_5 Depth=1
	movl	$5, -40(%rbp)
	jmp	.LBB3_23
.LBB3_10:                               # %for.body11
                                        #   in Loop: Header=BB3_8 Depth=2
	movq	-8(%rbp), %rax
	movq	%rax, -96(%rbp)                 # 8-byte Spill
	movq	-32(%rbp), %rax
	movq	%rax, -88(%rbp)                 # 8-byte Spill
	movl	-12(%rbp), %eax
	movl	%eax, -80(%rbp)                 # 4-byte Spill
	movl	-16(%rbp), %eax
	movl	%eax, -76(%rbp)                 # 4-byte Spill
	movslq	-44(%rbp), %rcx
	leaq	passes(%rip), %rax
	shlq	$4, %rcx
	addq	%rcx, %rax
	movq	%rax, -72(%rbp)                 # 8-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, -57(%rbp)                  # 1-byte Spill
	cmpb	$0, %al
	je	.LBB3_13
# %bb.11:                               #   in Loop: Header=BB3_8 Depth=2
	movb	-57(%rbp), %cl                  # 1-byte Reload
	movq	-72(%rbp), %rax                 # 8-byte Reload
	andq	$7, %rax
	addq	$3, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB3_13
# %bb.12:
	movq	-72(%rbp), %rdi                 # 8-byte Reload
	callq	__asan_report_load4@PLT
.LBB3_13:                               #   in Loop: Header=BB3_8 Depth=2
	movq	-72(%rbp), %rax                 # 8-byte Reload
	movl	(%rax), %eax
	movl	%eax, -116(%rbp)                # 4-byte Spill
	movslq	-44(%rbp), %rcx
	leaq	passes(%rip), %rax
	shlq	$4, %rcx
	addq	%rcx, %rax
	movq	%rax, -112(%rbp)                # 8-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, -97(%rbp)                  # 1-byte Spill
	cmpb	$0, %al
	je	.LBB3_16
# %bb.14:                               #   in Loop: Header=BB3_8 Depth=2
	movb	-97(%rbp), %cl                  # 1-byte Reload
	movq	-112(%rbp), %rax                # 8-byte Reload
	andq	$7, %rax
	addq	$3, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB3_16
# %bb.15:
	movq	-112(%rbp), %rdi                # 8-byte Reload
	callq	__asan_report_load4@PLT
.LBB3_16:                               #   in Loop: Header=BB3_8 Depth=2
	movq	-112(%rbp), %rax                # 8-byte Reload
	movl	(%rax), %eax
	movl	%eax, -132(%rbp)                # 4-byte Spill
	movslq	-44(%rbp), %rcx
	leaq	passes(%rip), %rax
	shlq	$4, %rcx
	addq	%rcx, %rax
	addq	$8, %rax
	movq	%rax, -128(%rbp)                # 8-byte Spill
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.LBB3_18
# %bb.17:
	movq	-128(%rbp), %rdi                # 8-byte Reload
	callq	__asan_report_load8@PLT
.LBB3_18:                               #   in Loop: Header=BB3_8 Depth=2
	movl	-132(%rbp), %r9d                # 4-byte Reload
	movl	-116(%rbp), %r8d                # 4-byte Reload
	movl	-76(%rbp), %ecx                 # 4-byte Reload
	movl	-80(%rbp), %edx                 # 4-byte Reload
	movq	-88(%rbp), %rsi                 # 8-byte Reload
	movq	-96(%rbp), %rdi                 # 8-byte Reload
	movq	-128(%rbp), %rax                # 8-byte Reload
	movq	(%rax), %rax
	movq	%rax, (%rsp)
	callq	pass_func
# %bb.19:                               # %do.body
                                        #   in Loop: Header=BB3_8 Depth=2
	movq	-8(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -32(%rbp)
# %bb.20:                               # %do.cond
                                        #   in Loop: Header=BB3_8 Depth=2
	jmp	.LBB3_21
.LBB3_21:                               # %do.end
                                        #   in Loop: Header=BB3_8 Depth=2
	jmp	.LBB3_22
.LBB3_22:                               # %for.inc
                                        #   in Loop: Header=BB3_8 Depth=2
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
	jmp	.LBB3_8
.LBB3_23:                               # %for.end
                                        #   in Loop: Header=BB3_5 Depth=1
	jmp	.LBB3_24
.LBB3_24:                               # %for.inc17
                                        #   in Loop: Header=BB3_5 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	.LBB3_5
.LBB3_25:                               # %for.end19
	movq	-32(%rbp), %rdi
	callq	free@PLT
	addq	$144, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	crimmings_speckle_removal_filter, .Lfunc_end3-crimmings_speckle_removal_filter
	.cfi_endproc
                                        # -- End function
	.globl	pass_func_par                   # -- Begin function pass_func_par
	.p2align	4, 0x90
	.type	pass_func_par,@function
pass_func_par:                          # @pass_func_par
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$160, %rsp
	movq	%rsp, %rbx
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r9d, 56(%rbx)                  # 4-byte Spill
	movl	%r8d, 60(%rbx)                  # 4-byte Spill
	movl	%ecx, 64(%rbx)                  # 4-byte Spill
	movl	%edx, 68(%rbx)                  # 4-byte Spill
	movq	%rsi, 72(%rbx)                  # 8-byte Spill
	movq	%rdi, 80(%rbx)                  # 8-byte Spill
	movl	24(%rbp), %eax
	movq	16(%rbp), %rax
	movq	%rax, 88(%rbx)                  # 8-byte Spill
	movq	%fs:40, %rax
	movq	%rax, 128(%rbx)
	xorl	%eax, %eax
                                        # kill: def $rax killed $eax
	movq	__asan_option_detect_stack_use_after_return@GOTPCREL(%rip), %rcx
	cmpl	$0, (%rcx)
	movq	%rax, 96(%rbx)                  # 8-byte Spill
	je	.LBB4_2
# %bb.1:
	movl	$192, %edi
	callq	__asan_stack_malloc_2@PLT
	movq	%rax, 96(%rbx)                  # 8-byte Spill
.LBB4_2:
	movq	96(%rbx), %rax                  # 8-byte Reload
	movq	%rax, 40(%rbx)                  # 8-byte Spill
	cmpq	$0, %rax
	movq	%rax, 48(%rbx)                  # 8-byte Spill
	jne	.LBB4_4
# %bb.3:
	movq	%rsp, %rax
	addq	$-192, %rax
	andq	$-32, %rax
	movq	%rax, %rsp
	movq	%rax, 48(%rbx)                  # 8-byte Spill
.LBB4_4:
	movl	56(%rbx), %esi                  # 4-byte Reload
	movl	60(%rbx), %edi                  # 4-byte Reload
	movl	64(%rbx), %r12d                 # 4-byte Reload
	movl	68(%rbx), %r13d                 # 4-byte Reload
	movq	48(%rbx), %rax                  # 8-byte Reload
	movq	%rax, 32(%rbx)                  # 8-byte Spill
	movq	%rax, 104(%rbx)
	movq	%rax, %r14
	addq	$32, %r14
	movq	%rax, %r8
	addq	$64, %r8
	movq	%rax, %r15
	addq	$96, %r15
	movq	%rax, %rcx
	addq	$112, %rcx
	movq	%rax, %r11
	addq	$128, %r11
	movq	%rax, %r9
	addq	$144, %r9
	movq	%rax, %r10
	addq	$160, %r10
	movq	$1102416563, (%rax)             # imm = 0x41B58AB3
	leaq	.L___asan_gen_(%rip), %rdx
	movq	%rdx, 8(%rax)
	leaq	pass_func_par(%rip), %rdx
	movq	%rdx, 16(%rax)
	shrq	$3, %rax
	movq	%rax, %rdx
	addq	$2147450880, %rdx               # imm = 0x7FFF8000
	movq	%rdx, 24(%rbx)                  # 8-byte Spill
	movabsq	$-940423286293925391, %rdx      # imm = 0xF2F2F200F1F1F1F1
	movq	%rdx, 2147450880(%rax)
	movabsq	$356352758027318002, %rdx       # imm = 0x4F204F204F2F2F2
	movq	%rdx, 2147450889(%rax)
	movq	80(%rbx), %rdx                  # 8-byte Reload
	movl	$15860978, 2147450897(%rax)     # imm = 0xF204F2
	movw	$-3085, 2147450901(%rax)        # imm = 0xF3F3
	movb	$-13, 2147450903(%rax)
	movq	32(%rbx), %rax                  # 8-byte Reload
	movq	%rdx, 32(%rax)
	movq	72(%rbx), %rdx                  # 8-byte Reload
	movq	%rdx, 64(%rax)
	movq	88(%rbx), %rdx                  # 8-byte Reload
	movl	%r13d, 96(%rax)
	movl	%r12d, 112(%rax)
	movl	%edi, 128(%rax)
	movl	%esi, 144(%rax)
	movq	%rdx, 160(%rax)
	movl	24(%rbp), %eax
	movl	%eax, 124(%rbx)
	movl	124(%rbx), %eax
	movl	%eax, 112(%rbx)
	movq	112(%rbx), %rax
	leaq	___asan_gen__anon_global.19(%rip), %rdi
	movl	$8, %esi
	leaq	pass_func_par.omp_outlined(%rip), %rdx
	subq	$48, %rsp
	movq	%r15, (%rsp)
	movq	%r14, 8(%rsp)
	movq	%r11, 16(%rsp)
	movq	%r10, 24(%rsp)
	movq	%rax, 32(%rsp)
	movb	$0, %al
	callq	__kmpc_fork_call@PLT
	movq	32(%rbx), %rcx                  # 8-byte Reload
	movq	40(%rbx), %rax                  # 8-byte Reload
	addq	$48, %rsp
	movq	$1172321806, (%rcx)             # imm = 0x45E0360E
	cmpq	$0, %rax
	je	.LBB4_6
# %bb.5:
	movq	40(%rbx), %rax                  # 8-byte Reload
	movq	24(%rbx), %rcx                  # 8-byte Reload
	movabsq	$-723401728380766731, %rdx      # imm = 0xF5F5F5F5F5F5F5F5
	movq	%rdx, (%rcx)
	movabsq	$-723401728380766731, %rdx      # imm = 0xF5F5F5F5F5F5F5F5
	movq	%rdx, 8(%rcx)
	movabsq	$-723401728380766731, %rdx      # imm = 0xF5F5F5F5F5F5F5F5
	movq	%rdx, 16(%rcx)
	movabsq	$-723401728380766731, %rdx      # imm = 0xF5F5F5F5F5F5F5F5
	movq	%rdx, 24(%rcx)
	movq	248(%rax), %rax
	movb	$0, (%rax)
	jmp	.LBB4_7
.LBB4_6:
	movq	24(%rbx), %rax                  # 8-byte Reload
	movq	$0, (%rax)
	movq	$0, 9(%rax)
	movl	$0, 17(%rax)
	movw	$0, 21(%rax)
	movb	$0, 23(%rax)
.LBB4_7:
	movq	%fs:40, %rax
	movq	128(%rbx), %rcx
	cmpq	%rcx, %rax
	jne	.LBB4_9
# %bb.8:                                # %SP_return
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB4_9:                                # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	callq	__stack_chk_fail@PLT
.Lfunc_end4:
	.size	pass_func_par, .Lfunc_end4-pass_func_par
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function pass_func_par.omp_outlined
	.type	pass_func_par.omp_outlined,@function
pass_func_par.omp_outlined:             # @pass_func_par.omp_outlined
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	andq	$-32, %rsp
	subq	$544, %rsp                      # imm = 0x220
	movq	%rsp, %rbx
	.cfi_offset %rbx, -24
	movq	40(%rbp), %rax
	movq	32(%rbp), %rax
	movq	24(%rbp), %rax
	movq	16(%rbp), %rax
	movq	%fs:40, %rax
	movq	%rax, 512(%rbx)
	movq	%rdi, 504(%rbx)
	movq	%rsi, 496(%rbx)
	movq	%rdx, 488(%rbx)
	movq	%rcx, 480(%rbx)
	movq	%r8, 472(%rbx)
	movq	%r9, 464(%rbx)
	xorl	%eax, %eax
                                        # kill: def $rax killed $eax
	movq	__asan_option_detect_stack_use_after_return@GOTPCREL(%rip), %rcx
	cmpl	$0, (%rcx)
	movq	%rax, 360(%rbx)                 # 8-byte Spill
	je	.LBB5_2
# %bb.1:
	movl	$96, %edi
	callq	__asan_stack_malloc_1@PLT
	movq	%rax, 360(%rbx)                 # 8-byte Spill
.LBB5_2:
	movq	360(%rbx), %rax                 # 8-byte Reload
	movq	%rax, 344(%rbx)                 # 8-byte Spill
	cmpq	$0, %rax
	movq	%rax, 352(%rbx)                 # 8-byte Spill
	jne	.LBB5_4
# %bb.3:
	movq	%rsp, %rax
	addq	$-96, %rax
	andq	$-32, %rax
	movq	%rax, %rsp
	movq	%rax, 352(%rbx)                 # 8-byte Spill
.LBB5_4:
	movq	352(%rbx), %rax                 # 8-byte Reload
	movq	%rax, 232(%rbx)                 # 8-byte Spill
	movq	%rax, 368(%rbx)
	movq	%rax, %rcx
	addq	$32, %rcx
	movq	%rcx, 240(%rbx)                 # 8-byte Spill
	movq	%rax, %rcx
	addq	$48, %rcx
	movq	%rcx, 248(%rbx)                 # 8-byte Spill
	movq	%rax, %rcx
	addq	$64, %rcx
	movq	%rcx, 256(%rbx)                 # 8-byte Spill
	movq	%rax, %rcx
	addq	$80, %rcx
	movq	%rcx, 264(%rbx)                 # 8-byte Spill
	movq	$1102416563, (%rax)             # imm = 0x41B58AB3
	leaq	.L___asan_gen_.4(%rip), %rcx
	movq	%rcx, 8(%rax)
	leaq	pass_func_par.omp_outlined(%rip), %rcx
	movq	%rcx, 16(%rax)
	shrq	$3, %rax
	movq	%rax, %rcx
	addq	$2147450880, %rcx               # imm = 0x7FFF8000
	movq	%rcx, 272(%rbx)                 # 8-byte Spill
	movabsq	$-938733371281772047, %rcx      # imm = 0xF2F8F2F8F1F1F1F1
	movq	%rcx, 2147450880(%rax)
	movl	$-201788680, 2147450888(%rax)   # imm = 0xF3F8F2F8
	movq	488(%rbx), %rax
	movq	%rax, 280(%rbx)                 # 8-byte Spill
	movq	480(%rbx), %rcx
	movq	%rcx, 288(%rbx)                 # 8-byte Spill
	movq	472(%rbx), %rcx
	movq	%rcx, 296(%rbx)                 # 8-byte Spill
	movq	464(%rbx), %rcx
	movq	%rcx, 304(%rbx)                 # 8-byte Spill
	movq	16(%rbp), %rcx
	movq	%rcx, 312(%rbx)                 # 8-byte Spill
	movq	24(%rbp), %rcx
	movq	%rcx, 320(%rbx)                 # 8-byte Spill
	movq	32(%rbp), %rcx
	movq	%rcx, 328(%rbx)                 # 8-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, 343(%rbx)                  # 1-byte Spill
	cmpb	$0, %al
	je	.LBB5_7
# %bb.5:
	movb	343(%rbx), %cl                  # 1-byte Reload
	movq	280(%rbx), %rax                 # 8-byte Reload
	andq	$7, %rax
	addq	$3, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB5_7
# %bb.6:
	movq	280(%rbx), %rdi                 # 8-byte Reload
	callq	__asan_report_load4@PLT
.LBB5_7:
	movq	280(%rbx), %rax                 # 8-byte Reload
	movl	(%rax), %eax
	subl	$1, %eax
	movl	%eax, 452(%rbx)
	movl	452(%rbx), %eax
	subl	$1, %eax
	shrl	$0, %eax
	subl	$1, %eax
	movl	%eax, 448(%rbx)
	movl	$1, 444(%rbx)
	movl	$1, %eax
	cmpl	452(%rbx), %eax
	jae	.LBB5_92
# %bb.8:                                # %omp.precond.then
	movq	264(%rbx), %rax                 # 8-byte Reload
	movq	272(%rbx), %rcx                 # 8-byte Reload
	movq	256(%rbx), %rdx                 # 8-byte Reload
	movq	248(%rbx), %rsi                 # 8-byte Reload
	movq	240(%rbx), %rdi                 # 8-byte Reload
	movb	$4, 4(%rcx)
	movl	$0, (%rdi)
	movb	$4, 6(%rcx)
	movl	448(%rbx), %edi
	movl	%edi, (%rsi)
	movb	$4, 8(%rcx)
	movl	$1, (%rdx)
	movb	$4, 10(%rcx)
	movl	$0, (%rax)
	movl	40(%rbp), %eax
	movl	%eax, 212(%rbx)                 # 4-byte Spill
	movq	504(%rbx), %rax
	movq	%rax, 216(%rbx)                 # 8-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, 231(%rbx)                  # 1-byte Spill
	cmpb	$0, %al
	je	.LBB5_11
# %bb.9:
	movb	231(%rbx), %cl                  # 1-byte Reload
	movq	216(%rbx), %rax                 # 8-byte Reload
	andq	$7, %rax
	addq	$3, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB5_11
# %bb.10:
	movq	216(%rbx), %rdi                 # 8-byte Reload
	callq	__asan_report_load4@PLT
.LBB5_11:
	movl	212(%rbx), %eax                 # 4-byte Reload
	movq	256(%rbx), %r10                 # 8-byte Reload
	movq	248(%rbx), %r9                  # 8-byte Reload
	movq	240(%rbx), %r8                  # 8-byte Reload
	movq	264(%rbx), %rcx                 # 8-byte Reload
	movq	216(%rbx), %rdx                 # 8-byte Reload
	movl	(%rdx), %esi
	leaq	___asan_gen__anon_global.17(%rip), %rdi
	movl	$33, %edx
	subq	$32, %rsp
	movq	%r10, (%rsp)
	movl	$1, 8(%rsp)
	movl	%eax, 16(%rsp)
	callq	__kmpc_for_static_init_4u@PLT
	addq	$32, %rsp
.LBB5_12:                               # %omp.dispatch.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_18 Depth 2
                                        #       Child Loop BB5_51 Depth 3
	movq	248(%rbx), %rax                 # 8-byte Reload
	movl	(%rax), %eax
	cmpl	448(%rbx), %eax
	jbe	.LBB5_14
# %bb.13:                               # %cond.true
                                        #   in Loop: Header=BB5_12 Depth=1
	movl	448(%rbx), %eax
	movl	%eax, 208(%rbx)                 # 4-byte Spill
	jmp	.LBB5_15
.LBB5_14:                               # %cond.false
                                        #   in Loop: Header=BB5_12 Depth=1
	movq	248(%rbx), %rax                 # 8-byte Reload
	movl	(%rax), %eax
	movl	%eax, 208(%rbx)                 # 4-byte Spill
.LBB5_15:                               # %cond.end
                                        #   in Loop: Header=BB5_12 Depth=1
	movq	248(%rbx), %rcx                 # 8-byte Reload
	movq	240(%rbx), %rax                 # 8-byte Reload
	movl	208(%rbx), %edx                 # 4-byte Reload
	movl	%edx, (%rcx)
	movl	(%rax), %eax
	movl	%eax, 460(%rbx)
	movl	460(%rbx), %eax
	movl	(%rcx), %ecx
	addl	$1, %ecx
	cmpl	%ecx, %eax
	jb	.LBB5_17
# %bb.16:                               # %omp.dispatch.cleanup
	jmp	.LBB5_88
.LBB5_17:                               # %omp.dispatch.body
                                        #   in Loop: Header=BB5_12 Depth=1
	jmp	.LBB5_18
.LBB5_18:                               # %omp.inner.for.cond
                                        #   Parent Loop BB5_12 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_51 Depth 3
	movq	248(%rbx), %rcx                 # 8-byte Reload
	movl	460(%rbx), %eax
	movl	(%rcx), %ecx
	addl	$1, %ecx
	cmpl	%ecx, %eax
	jb	.LBB5_20
# %bb.19:                               # %omp.inner.for.cond.cleanup
                                        #   in Loop: Header=BB5_12 Depth=1
	jmp	.LBB5_86
.LBB5_20:                               # %omp.inner.for.body
                                        #   in Loop: Header=BB5_18 Depth=2
	movq	288(%rbx), %rax                 # 8-byte Reload
	movl	460(%rbx), %ecx
	shll	$0, %ecx
	addl	$1, %ecx
	movl	%ecx, 440(%rbx)
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.LBB5_22
# %bb.21:
	movq	288(%rbx), %rdi                 # 8-byte Reload
	callq	__asan_report_load8@PLT
.LBB5_22:                               #   in Loop: Header=BB5_18 Depth=2
	movq	296(%rbx), %rax                 # 8-byte Reload
	movq	288(%rbx), %rcx                 # 8-byte Reload
	movq	(%rcx), %rcx
	movq	%rcx, 192(%rbx)                 # 8-byte Spill
	movl	440(%rbx), %ecx
	movl	%ecx, 200(%rbx)                 # 4-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, 207(%rbx)                  # 1-byte Spill
	cmpb	$0, %al
	je	.LBB5_25
# %bb.23:                               #   in Loop: Header=BB5_18 Depth=2
	movb	207(%rbx), %cl                  # 1-byte Reload
	movq	296(%rbx), %rax                 # 8-byte Reload
	andq	$7, %rax
	addq	$3, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB5_25
# %bb.24:
	movq	296(%rbx), %rdi                 # 8-byte Reload
	callq	__asan_report_load4@PLT
.LBB5_25:                               #   in Loop: Header=BB5_18 Depth=2
	movq	304(%rbx), %rax                 # 8-byte Reload
	movq	296(%rbx), %rdx                 # 8-byte Reload
	movl	200(%rbx), %ecx                 # 4-byte Reload
	subl	(%rdx), %ecx
	movl	%ecx, 184(%rbx)                 # 4-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, 191(%rbx)                  # 1-byte Spill
	cmpb	$0, %al
	je	.LBB5_28
# %bb.26:                               #   in Loop: Header=BB5_18 Depth=2
	movb	191(%rbx), %cl                  # 1-byte Reload
	movq	304(%rbx), %rax                 # 8-byte Reload
	andq	$7, %rax
	addq	$3, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB5_28
# %bb.27:
	movq	304(%rbx), %rdi                 # 8-byte Reload
	callq	__asan_report_load4@PLT
.LBB5_28:                               #   in Loop: Header=BB5_18 Depth=2
	movq	288(%rbx), %rax                 # 8-byte Reload
	movq	192(%rbx), %rcx                 # 8-byte Reload
	movq	304(%rbx), %rsi                 # 8-byte Reload
	movl	184(%rbx), %edx                 # 4-byte Reload
	imull	(%rsi), %edx
	movl	%edx, %edx
                                        # kill: def $rdx killed $edx
	addq	%rdx, %rcx
	movq	%rcx, 432(%rbx)
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.LBB5_30
# %bb.29:
	movq	288(%rbx), %rdi                 # 8-byte Reload
	callq	__asan_report_load8@PLT
.LBB5_30:                               #   in Loop: Header=BB5_18 Depth=2
	movq	304(%rbx), %rax                 # 8-byte Reload
	movq	288(%rbx), %rcx                 # 8-byte Reload
	movq	(%rcx), %rcx
	movq	%rcx, 168(%rbx)                 # 8-byte Spill
	movl	440(%rbx), %ecx
	movl	%ecx, 176(%rbx)                 # 4-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, 183(%rbx)                  # 1-byte Spill
	cmpb	$0, %al
	je	.LBB5_33
# %bb.31:                               #   in Loop: Header=BB5_18 Depth=2
	movb	183(%rbx), %cl                  # 1-byte Reload
	movq	304(%rbx), %rax                 # 8-byte Reload
	andq	$7, %rax
	addq	$3, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB5_33
# %bb.32:
	movq	304(%rbx), %rdi                 # 8-byte Reload
	callq	__asan_report_load4@PLT
.LBB5_33:                               #   in Loop: Header=BB5_18 Depth=2
	movq	288(%rbx), %rax                 # 8-byte Reload
	movq	168(%rbx), %rcx                 # 8-byte Reload
	movq	304(%rbx), %rsi                 # 8-byte Reload
	movl	176(%rbx), %edx                 # 4-byte Reload
	imull	(%rsi), %edx
	movl	%edx, %edx
                                        # kill: def $rdx killed $edx
	addq	%rdx, %rcx
	movq	%rcx, 424(%rbx)
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.LBB5_35
# %bb.34:
	movq	288(%rbx), %rdi                 # 8-byte Reload
	callq	__asan_report_load8@PLT
.LBB5_35:                               #   in Loop: Header=BB5_18 Depth=2
	movq	296(%rbx), %rax                 # 8-byte Reload
	movq	288(%rbx), %rcx                 # 8-byte Reload
	movq	(%rcx), %rcx
	movq	%rcx, 152(%rbx)                 # 8-byte Spill
	movl	440(%rbx), %ecx
	movl	%ecx, 160(%rbx)                 # 4-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, 167(%rbx)                  # 1-byte Spill
	cmpb	$0, %al
	je	.LBB5_38
# %bb.36:                               #   in Loop: Header=BB5_18 Depth=2
	movb	167(%rbx), %cl                  # 1-byte Reload
	movq	296(%rbx), %rax                 # 8-byte Reload
	andq	$7, %rax
	addq	$3, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB5_38
# %bb.37:
	movq	296(%rbx), %rdi                 # 8-byte Reload
	callq	__asan_report_load4@PLT
.LBB5_38:                               #   in Loop: Header=BB5_18 Depth=2
	movq	304(%rbx), %rax                 # 8-byte Reload
	movq	296(%rbx), %rdx                 # 8-byte Reload
	movl	160(%rbx), %ecx                 # 4-byte Reload
	addl	(%rdx), %ecx
	movl	%ecx, 144(%rbx)                 # 4-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, 151(%rbx)                  # 1-byte Spill
	cmpb	$0, %al
	je	.LBB5_41
# %bb.39:                               #   in Loop: Header=BB5_18 Depth=2
	movb	151(%rbx), %cl                  # 1-byte Reload
	movq	304(%rbx), %rax                 # 8-byte Reload
	andq	$7, %rax
	addq	$3, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB5_41
# %bb.40:
	movq	304(%rbx), %rdi                 # 8-byte Reload
	callq	__asan_report_load4@PLT
.LBB5_41:                               #   in Loop: Header=BB5_18 Depth=2
	movq	312(%rbx), %rax                 # 8-byte Reload
	movq	152(%rbx), %rcx                 # 8-byte Reload
	movq	304(%rbx), %rsi                 # 8-byte Reload
	movl	144(%rbx), %edx                 # 4-byte Reload
	imull	(%rsi), %edx
	movl	%edx, %edx
                                        # kill: def $rdx killed $edx
	addq	%rdx, %rcx
	movq	%rcx, 416(%rbx)
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.LBB5_43
# %bb.42:
	movq	312(%rbx), %rdi                 # 8-byte Reload
	callq	__asan_report_load8@PLT
.LBB5_43:                               #   in Loop: Header=BB5_18 Depth=2
	movq	304(%rbx), %rax                 # 8-byte Reload
	movq	312(%rbx), %rcx                 # 8-byte Reload
	movq	(%rcx), %rcx
	movq	%rcx, 128(%rbx)                 # 8-byte Spill
	movl	440(%rbx), %ecx
	movl	%ecx, 136(%rbx)                 # 4-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, 143(%rbx)                  # 1-byte Spill
	cmpb	$0, %al
	je	.LBB5_46
# %bb.44:                               #   in Loop: Header=BB5_18 Depth=2
	movb	143(%rbx), %cl                  # 1-byte Reload
	movq	304(%rbx), %rax                 # 8-byte Reload
	andq	$7, %rax
	addq	$3, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB5_46
# %bb.45:
	movq	304(%rbx), %rdi                 # 8-byte Reload
	callq	__asan_report_load4@PLT
.LBB5_46:                               #   in Loop: Header=BB5_18 Depth=2
	movq	304(%rbx), %rax                 # 8-byte Reload
	movq	128(%rbx), %rcx                 # 8-byte Reload
	movl	136(%rbx), %edx                 # 4-byte Reload
	imull	(%rax), %edx
	movl	%edx, %edx
                                        # kill: def $rdx killed $edx
	addq	%rdx, %rcx
	movq	%rcx, 408(%rbx)
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, 127(%rbx)                  # 1-byte Spill
	cmpb	$0, %al
	je	.LBB5_49
# %bb.47:                               #   in Loop: Header=BB5_18 Depth=2
	movb	127(%rbx), %cl                  # 1-byte Reload
	movq	304(%rbx), %rax                 # 8-byte Reload
	andq	$7, %rax
	addq	$3, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB5_49
# %bb.48:
	movq	304(%rbx), %rdi                 # 8-byte Reload
	callq	__asan_report_load4@PLT
.LBB5_49:                               #   in Loop: Header=BB5_18 Depth=2
	movq	304(%rbx), %rax                 # 8-byte Reload
	movl	(%rax), %eax
	subl	$1, %eax
	movl	%eax, 400(%rbx)
	movl	400(%rbx), %eax
	subl	$1, %eax
	shrl	$0, %eax
	subl	$1, %eax
	movl	%eax, 396(%rbx)
	movl	$1, 392(%rbx)
	movl	$1, %eax
	cmpl	400(%rbx), %eax
	jae	.LBB5_83
# %bb.50:                               # %simd.if.then
                                        #   in Loop: Header=BB5_18 Depth=2
	movl	$0, 388(%rbx)
.LBB5_51:                               # %omp.inner.for.cond33
                                        #   Parent Loop BB5_12 Depth=1
                                        #     Parent Loop BB5_18 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	388(%rbx), %eax
	movl	396(%rbx), %ecx
	addl	$1, %ecx
	cmpl	%ecx, %eax
	jb	.LBB5_53
# %bb.52:                               # %omp.inner.for.cond.cleanup36
                                        #   in Loop: Header=BB5_18 Depth=2
	jmp	.LBB5_82
.LBB5_53:                               # %omp.inner.for.body37
                                        #   in Loop: Header=BB5_51 Depth=3
	movq	320(%rbx), %rax                 # 8-byte Reload
	movl	388(%rbx), %ecx
	shll	$0, %ecx
	addl	$1, %ecx
	movl	%ecx, 384(%rbx)
	movq	432(%rbx), %rcx
	movq	%rcx, 112(%rbx)                 # 8-byte Spill
	movl	384(%rbx), %ecx
	movl	%ecx, 120(%rbx)                 # 4-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, 126(%rbx)                  # 1-byte Spill
	cmpb	$0, %al
	je	.LBB5_56
# %bb.54:                               #   in Loop: Header=BB5_51 Depth=3
	movb	126(%rbx), %cl                  # 1-byte Reload
	movq	320(%rbx), %rax                 # 8-byte Reload
	andq	$7, %rax
	addq	$3, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB5_56
# %bb.55:
	movq	320(%rbx), %rdi                 # 8-byte Reload
	callq	__asan_report_load4@PLT
.LBB5_56:                               #   in Loop: Header=BB5_51 Depth=3
	movq	112(%rbx), %rax                 # 8-byte Reload
	movq	320(%rbx), %rdx                 # 8-byte Reload
	movl	120(%rbx), %ecx                 # 4-byte Reload
	subl	(%rdx), %ecx
	movslq	%ecx, %rcx
	addq	%rcx, %rax
	movq	%rax, 96(%rbx)                  # 8-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, 111(%rbx)                  # 1-byte Spill
	cmpb	$0, %al
	je	.LBB5_59
# %bb.57:                               #   in Loop: Header=BB5_51 Depth=3
	movb	111(%rbx), %cl                  # 1-byte Reload
	movq	96(%rbx), %rax                  # 8-byte Reload
	andq	$7, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB5_59
# %bb.58:
	movq	96(%rbx), %rdi                  # 8-byte Reload
	callq	__asan_report_load1@PLT
.LBB5_59:                               #   in Loop: Header=BB5_51 Depth=3
	movq	96(%rbx), %rax                  # 8-byte Reload
	movb	(%rax), %al
	movb	%al, 383(%rbx)
	movq	424(%rbx), %rax
	movslq	384(%rbx), %rcx
	addq	%rcx, %rax
	movq	%rax, 80(%rbx)                  # 8-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, 95(%rbx)                   # 1-byte Spill
	cmpb	$0, %al
	je	.LBB5_62
# %bb.60:                               #   in Loop: Header=BB5_51 Depth=3
	movb	95(%rbx), %cl                   # 1-byte Reload
	movq	80(%rbx), %rax                  # 8-byte Reload
	andq	$7, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB5_62
# %bb.61:
	movq	80(%rbx), %rdi                  # 8-byte Reload
	callq	__asan_report_load1@PLT
.LBB5_62:                               #   in Loop: Header=BB5_51 Depth=3
	movq	320(%rbx), %rax                 # 8-byte Reload
	movq	80(%rbx), %rcx                  # 8-byte Reload
	movb	(%rcx), %cl
	movb	%cl, 382(%rbx)
	movq	416(%rbx), %rcx
	movq	%rcx, 64(%rbx)                  # 8-byte Spill
	movl	384(%rbx), %ecx
	movl	%ecx, 72(%rbx)                  # 4-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, 79(%rbx)                   # 1-byte Spill
	cmpb	$0, %al
	je	.LBB5_65
# %bb.63:                               #   in Loop: Header=BB5_51 Depth=3
	movb	79(%rbx), %cl                   # 1-byte Reload
	movq	320(%rbx), %rax                 # 8-byte Reload
	andq	$7, %rax
	addq	$3, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB5_65
# %bb.64:
	movq	320(%rbx), %rdi                 # 8-byte Reload
	callq	__asan_report_load4@PLT
.LBB5_65:                               #   in Loop: Header=BB5_51 Depth=3
	movq	64(%rbx), %rax                  # 8-byte Reload
	movq	320(%rbx), %rdx                 # 8-byte Reload
	movl	72(%rbx), %ecx                  # 4-byte Reload
	addl	(%rdx), %ecx
	movslq	%ecx, %rcx
	addq	%rcx, %rax
	movq	%rax, 48(%rbx)                  # 8-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, 63(%rbx)                   # 1-byte Spill
	cmpb	$0, %al
	je	.LBB5_68
# %bb.66:                               #   in Loop: Header=BB5_51 Depth=3
	movb	63(%rbx), %cl                   # 1-byte Reload
	movq	48(%rbx), %rax                  # 8-byte Reload
	andq	$7, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB5_68
# %bb.67:
	movq	48(%rbx), %rdi                  # 8-byte Reload
	callq	__asan_report_load1@PLT
.LBB5_68:                               #   in Loop: Header=BB5_51 Depth=3
	movq	328(%rbx), %rax                 # 8-byte Reload
	movq	48(%rbx), %rcx                  # 8-byte Reload
	movb	(%rcx), %cl
	movb	%cl, 381(%rbx)
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.LBB5_70
# %bb.69:
	movq	328(%rbx), %rdi                 # 8-byte Reload
	callq	__asan_report_load8@PLT
.LBB5_70:                               #   in Loop: Header=BB5_51 Depth=3
	movq	328(%rbx), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	movb	383(%rbx), %dl
	movb	382(%rbx), %cl
	movzbl	%dl, %edi
	movzbl	%cl, %esi
	movzbl	381(%rbx), %edx
	callq	*%rax
	movb	%al, 382(%rbx)
	movzbl	382(%rbx), %eax
	cmpl	$0, %eax
	jge	.LBB5_72
# %bb.71:                               # %cond.true48
                                        #   in Loop: Header=BB5_51 Depth=3
	xorl	%eax, %eax
	movl	%eax, 44(%rbx)                  # 4-byte Spill
	jmp	.LBB5_76
.LBB5_72:                               # %cond.false49
                                        #   in Loop: Header=BB5_51 Depth=3
	movzbl	382(%rbx), %eax
	cmpl	$255, %eax
	jle	.LBB5_74
# %bb.73:                               # %cond.true53
                                        #   in Loop: Header=BB5_51 Depth=3
	movl	$255, %eax
	movl	%eax, 40(%rbx)                  # 4-byte Spill
	jmp	.LBB5_75
.LBB5_74:                               # %cond.false54
                                        #   in Loop: Header=BB5_51 Depth=3
	movzbl	382(%rbx), %eax
	movl	%eax, 40(%rbx)                  # 4-byte Spill
.LBB5_75:                               # %cond.end56
                                        #   in Loop: Header=BB5_51 Depth=3
	movl	40(%rbx), %eax                  # 4-byte Reload
	movl	%eax, 44(%rbx)                  # 4-byte Spill
.LBB5_76:                               # %cond.end58
                                        #   in Loop: Header=BB5_51 Depth=3
	movl	44(%rbx), %eax                  # 4-byte Reload
                                        # kill: def $al killed $al killed $eax
	movb	%al, 23(%rbx)                   # 1-byte Spill
	movq	408(%rbx), %rax
	movslq	384(%rbx), %rcx
	addq	%rcx, %rax
	movq	%rax, 24(%rbx)                  # 8-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, 39(%rbx)                   # 1-byte Spill
	cmpb	$0, %al
	je	.LBB5_79
# %bb.77:                               #   in Loop: Header=BB5_51 Depth=3
	movb	39(%rbx), %cl                   # 1-byte Reload
	movq	24(%rbx), %rax                  # 8-byte Reload
	andq	$7, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB5_79
# %bb.78:
	movq	24(%rbx), %rdi                  # 8-byte Reload
	callq	__asan_report_store1@PLT
.LBB5_79:                               #   in Loop: Header=BB5_51 Depth=3
	movq	24(%rbx), %rax                  # 8-byte Reload
	movb	23(%rbx), %cl                   # 1-byte Reload
	movb	%cl, (%rax)
# %bb.80:                               # %omp.body.continue
                                        #   in Loop: Header=BB5_51 Depth=3
	jmp	.LBB5_81
.LBB5_81:                               # %omp.inner.for.inc
                                        #   in Loop: Header=BB5_51 Depth=3
	movl	388(%rbx), %eax
	addl	$1, %eax
	movl	%eax, 388(%rbx)
	jmp	.LBB5_51
.LBB5_82:                               # %omp.inner.for.end
                                        #   in Loop: Header=BB5_18 Depth=2
	movl	400(%rbx), %eax
	subl	$1, %eax
	shrl	$0, %eax
	shll	$0, %eax
	addl	$1, %eax
	movl	%eax, 384(%rbx)
.LBB5_83:                               # %simd.if.end
                                        #   in Loop: Header=BB5_18 Depth=2
# %bb.84:                               # %omp.body.continue68
                                        #   in Loop: Header=BB5_18 Depth=2
	jmp	.LBB5_85
.LBB5_85:                               # %omp.inner.for.inc69
                                        #   in Loop: Header=BB5_18 Depth=2
	movl	460(%rbx), %eax
	addl	$1, %eax
	movl	%eax, 460(%rbx)
	jmp	.LBB5_18
.LBB5_86:                               # %omp.inner.for.end71
                                        #   in Loop: Header=BB5_12 Depth=1
	jmp	.LBB5_87
.LBB5_87:                               # %omp.dispatch.inc
                                        #   in Loop: Header=BB5_12 Depth=1
	movq	248(%rbx), %rax                 # 8-byte Reload
	movq	256(%rbx), %rdx                 # 8-byte Reload
	movq	240(%rbx), %rcx                 # 8-byte Reload
	movl	(%rcx), %esi
	addl	(%rdx), %esi
	movl	%esi, (%rcx)
	movl	(%rax), %ecx
	addl	(%rdx), %ecx
	movl	%ecx, (%rax)
	jmp	.LBB5_12
.LBB5_88:                               # %omp.dispatch.end
	movq	504(%rbx), %rax
	movq	%rax, 8(%rbx)                   # 8-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, 22(%rbx)                   # 1-byte Spill
	cmpb	$0, %al
	je	.LBB5_91
# %bb.89:
	movb	22(%rbx), %cl                   # 1-byte Reload
	movq	8(%rbx), %rax                   # 8-byte Reload
	andq	$7, %rax
	addq	$3, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB5_91
# %bb.90:
	movq	8(%rbx), %rdi                   # 8-byte Reload
	callq	__asan_report_load4@PLT
.LBB5_91:
	movq	8(%rbx), %rax                   # 8-byte Reload
	movl	(%rax), %esi
	leaq	___asan_gen__anon_global.17(%rip), %rdi
	callq	__kmpc_for_static_fini@PLT
	movq	272(%rbx), %rax                 # 8-byte Reload
	movb	$-8, 10(%rax)
	movb	$-8, 8(%rax)
	movb	$-8, 6(%rax)
	movb	$-8, 4(%rax)
.LBB5_92:                               # %omp.precond.end
	movq	344(%rbx), %rax                 # 8-byte Reload
	movq	232(%rbx), %rcx                 # 8-byte Reload
	movq	$1172321806, (%rcx)             # imm = 0x45E0360E
	cmpq	$0, %rax
	je	.LBB5_94
# %bb.93:
	movq	344(%rbx), %rax                 # 8-byte Reload
	movq	272(%rbx), %rcx                 # 8-byte Reload
	movabsq	$-723401728380766731, %rdx      # imm = 0xF5F5F5F5F5F5F5F5
	movq	%rdx, (%rcx)
	movabsq	$-723401728380766731, %rdx      # imm = 0xF5F5F5F5F5F5F5F5
	movq	%rdx, 8(%rcx)
	movq	120(%rax), %rax
	movb	$0, (%rax)
	jmp	.LBB5_95
.LBB5_94:
	movq	272(%rbx), %rax                 # 8-byte Reload
	movq	$0, (%rax)
	movl	$0, 8(%rax)
.LBB5_95:
	movq	%fs:40, %rax
	movq	512(%rbx), %rcx
	cmpq	%rcx, %rax
	jne	.LBB5_97
# %bb.96:                               # %SP_return
	leaq	-8(%rbp), %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB5_97:                               # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	callq	__stack_chk_fail@PLT
.Lfunc_end5:
	.size	pass_func_par.omp_outlined, .Lfunc_end5-pass_func_par.omp_outlined
	.cfi_endproc
                                        # -- End function
	.globl	crimmings_speckle_removal_filter_par # -- Begin function crimmings_speckle_removal_filter_par
	.p2align	4, 0x90
	.type	crimmings_speckle_removal_filter_par,@function
crimmings_speckle_removal_filter_par:   # @crimmings_speckle_removal_filter_par
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$160, %rsp
	movb	%cl, %al
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movb	%al, -17(%rbp)
	movl	-12(%rbp), %eax
	imull	-16(%rbp), %eax
	movl	%eax, %eax
	movl	%eax, %edi
	callq	malloc@PLT
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	.LBB6_3
# %bb.1:                                # %land.lhs.true
	movb	$1, %al
	testb	$1, %al
	jne	.LBB6_2
	jmp	.LBB6_3
.LBB6_2:                                # %cond.true
	jmp	.LBB6_4
.LBB6_3:                                # %cond.false
	callq	__asan_handle_no_return@PLT
	leaq	.str.1(%rip), %rdi
	leaq	.str.2(%rip), %rsi
	movl	$103, %edx
	leaq	__PRETTY_FUNCTION__.crimmings_speckle_removal_filter_par(%rip), %rcx
	callq	__assert_fail@PLT
.LBB6_4:                                # %cond.end
	movl	-16(%rbp), %eax
	movl	%eax, -60(%rbp)                 # 4-byte Spill
	callq	omp_get_max_threads@PLT
	movl	%eax, %ecx
	movl	-60(%rbp), %eax                 # 4-byte Reload
	xorl	%edx, %edx
	divl	%ecx
	movl	%eax, -36(%rbp)
	movl	-36(%rbp), %esi
	leaq	.str.3(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movq	-32(%rbp), %rdi
	movq	-8(%rbp), %rsi
	movl	-12(%rbp), %eax
	imull	-16(%rbp), %eax
	movl	%eax, %eax
	movl	%eax, %edx
	callq	__asan_memcpy@PLT
	movl	$0, -40(%rbp)
.LBB6_5:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_8 Depth 2
	movl	-40(%rbp), %eax
	movzbl	-17(%rbp), %ecx
	cmpl	%ecx, %eax
	jl	.LBB6_7
# %bb.6:                                # %for.cond.cleanup
	movl	$2, -44(%rbp)
	jmp	.LBB6_25
.LBB6_7:                                # %for.body
                                        #   in Loop: Header=BB6_5 Depth=1
	movl	$0, -48(%rbp)
.LBB6_8:                                # %for.cond9
                                        #   Parent Loop BB6_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$8, -48(%rbp)
	jl	.LBB6_10
# %bb.9:                                # %for.cond.cleanup12
                                        #   in Loop: Header=BB6_5 Depth=1
	movl	$5, -44(%rbp)
	jmp	.LBB6_23
.LBB6_10:                               # %for.body13
                                        #   in Loop: Header=BB6_8 Depth=2
	movq	-8(%rbp), %rax
	movq	%rax, -96(%rbp)                 # 8-byte Spill
	movq	-32(%rbp), %rax
	movq	%rax, -88(%rbp)                 # 8-byte Spill
	movl	-12(%rbp), %eax
	movl	%eax, -80(%rbp)                 # 4-byte Spill
	movl	-16(%rbp), %eax
	movl	%eax, -76(%rbp)                 # 4-byte Spill
	movslq	-48(%rbp), %rcx
	leaq	passes(%rip), %rax
	shlq	$4, %rcx
	addq	%rcx, %rax
	movq	%rax, -72(%rbp)                 # 8-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, -61(%rbp)                  # 1-byte Spill
	cmpb	$0, %al
	je	.LBB6_13
# %bb.11:                               #   in Loop: Header=BB6_8 Depth=2
	movb	-61(%rbp), %cl                  # 1-byte Reload
	movq	-72(%rbp), %rax                 # 8-byte Reload
	andq	$7, %rax
	addq	$3, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB6_13
# %bb.12:
	movq	-72(%rbp), %rdi                 # 8-byte Reload
	callq	__asan_report_load4@PLT
.LBB6_13:                               #   in Loop: Header=BB6_8 Depth=2
	movq	-72(%rbp), %rax                 # 8-byte Reload
	movl	(%rax), %eax
	movl	%eax, -116(%rbp)                # 4-byte Spill
	movslq	-48(%rbp), %rcx
	leaq	passes(%rip), %rax
	shlq	$4, %rcx
	addq	%rcx, %rax
	movq	%rax, -112(%rbp)                # 8-byte Spill
	shrq	$3, %rax
	movb	2147450880(%rax), %al
	movb	%al, -97(%rbp)                  # 1-byte Spill
	cmpb	$0, %al
	je	.LBB6_16
# %bb.14:                               #   in Loop: Header=BB6_8 Depth=2
	movb	-97(%rbp), %cl                  # 1-byte Reload
	movq	-112(%rbp), %rax                # 8-byte Reload
	andq	$7, %rax
	addq	$3, %rax
                                        # kill: def $al killed $al killed $rax
	cmpb	%cl, %al
	jl	.LBB6_16
# %bb.15:
	movq	-112(%rbp), %rdi                # 8-byte Reload
	callq	__asan_report_load4@PLT
.LBB6_16:                               #   in Loop: Header=BB6_8 Depth=2
	movq	-112(%rbp), %rax                # 8-byte Reload
	movl	(%rax), %eax
	movl	%eax, -132(%rbp)                # 4-byte Spill
	movslq	-48(%rbp), %rcx
	leaq	passes(%rip), %rax
	shlq	$4, %rcx
	addq	%rcx, %rax
	addq	$8, %rax
	movq	%rax, -128(%rbp)                # 8-byte Spill
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.LBB6_18
# %bb.17:
	movq	-128(%rbp), %rdi                # 8-byte Reload
	callq	__asan_report_load8@PLT
.LBB6_18:                               #   in Loop: Header=BB6_8 Depth=2
	movl	-132(%rbp), %r9d                # 4-byte Reload
	movl	-116(%rbp), %r8d                # 4-byte Reload
	movl	-76(%rbp), %ecx                 # 4-byte Reload
	movl	-80(%rbp), %edx                 # 4-byte Reload
	movq	-88(%rbp), %rsi                 # 8-byte Reload
	movq	-96(%rbp), %rdi                 # 8-byte Reload
	movq	-128(%rbp), %rax                # 8-byte Reload
	movq	(%rax), %r10
	movl	-36(%rbp), %eax
	movq	%r10, (%rsp)
	movl	%eax, 8(%rsp)
	callq	pass_func_par
# %bb.19:                               # %do.body
                                        #   in Loop: Header=BB6_8 Depth=2
	movq	-8(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -32(%rbp)
# %bb.20:                               # %do.cond
                                        #   in Loop: Header=BB6_8 Depth=2
	jmp	.LBB6_21
.LBB6_21:                               # %do.end
                                        #   in Loop: Header=BB6_8 Depth=2
	jmp	.LBB6_22
.LBB6_22:                               # %for.inc
                                        #   in Loop: Header=BB6_8 Depth=2
	movl	-48(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -48(%rbp)
	jmp	.LBB6_8
.LBB6_23:                               # %for.end
                                        #   in Loop: Header=BB6_5 Depth=1
	jmp	.LBB6_24
.LBB6_24:                               # %for.inc19
                                        #   in Loop: Header=BB6_5 Depth=1
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	jmp	.LBB6_5
.LBB6_25:                               # %for.end21
	movq	-32(%rbp), %rdi
	callq	free@PLT
	addq	$160, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end6:
	.size	crimmings_speckle_removal_filter_par, .Lfunc_end6-crimmings_speckle_removal_filter_par
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
.Lfunc_end7:
	.size	asan.module_ctor, .Lfunc_end7-asan.module_ctor
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
.Lfunc_end8:
	.size	asan.module_dtor, .Lfunc_end8-asan.module_dtor
	.cfi_endproc
                                        # -- End function
	.type	.str,@object                    # @.str
	.section	.rodata..str,"aG",@progbits,.str.872336dccd3cfefab51ea071a8f3f685,comdat
	.p2align	5, 0x0
.str:
	.asciz	"Failed allocating temp image buffer"
	.zero	60
	.size	.str, 96

	.type	.str.1,@object                  # @.str.1
	.section	.rodata..str.1,"aG",@progbits,.str.1.872336dccd3cfefab51ea071a8f3f685,comdat
	.p2align	5, 0x0
.str.1:
	.asciz	"tmp_image != NULL && \"Failed allocating temp image buffer\""
	.zero	37
	.size	.str.1, 96

	.type	.str.2,@object                  # @.str.2
	.section	.rodata..str.2,"aG",@progbits,.str.2.872336dccd3cfefab51ea071a8f3f685,comdat
	.p2align	5, 0x0
.str.2:
	.asciz	"src/crimmins.c"
	.zero	17
	.size	.str.2, 32

	.type	__PRETTY_FUNCTION__.crimmings_speckle_removal_filter,@object # @__PRETTY_FUNCTION__.crimmings_speckle_removal_filter
	.section	.rodata.__PRETTY_FUNCTION__.crimmings_speckle_removal_filter,"aG",@progbits,__PRETTY_FUNCTION__.crimmings_speckle_removal_filter.872336dccd3cfefab51ea071a8f3f685,comdat
	.p2align	5, 0x0
__PRETTY_FUNCTION__.crimmings_speckle_removal_filter:
	.asciz	"void crimmings_speckle_removal_filter(uint8_t *, uint32_t, uint32_t, uint8_t)"
	.zero	50
	.size	__PRETTY_FUNCTION__.crimmings_speckle_removal_filter, 128

	.type	passes,@object                  # @passes
	.section	.data.rel.ro.passes,"awG",@progbits,passes.872336dccd3cfefab51ea071a8f3f685,comdat
	.p2align	5, 0x0
passes:
	.long	1                               # 0x1
	.long	0                               # 0x0
	.quad	dark_pass_logic
	.long	0                               # 0x0
	.long	1                               # 0x1
	.quad	dark_pass_logic
	.long	1                               # 0x1
	.long	1                               # 0x1
	.quad	dark_pass_logic
	.long	1                               # 0x1
	.long	4294967295                      # 0xffffffff
	.quad	dark_pass_logic
	.long	1                               # 0x1
	.long	0                               # 0x0
	.quad	light_pass_logic
	.long	0                               # 0x0
	.long	1                               # 0x1
	.quad	light_pass_logic
	.long	1                               # 0x1
	.long	1                               # 0x1
	.quad	light_pass_logic
	.long	1                               # 0x1
	.long	4294967295                      # 0xffffffff
	.quad	light_pass_logic
	.zero	32
	.size	passes, 160

	.type	___asan_gen__anon_global,@object # @___asan_gen__anon_global
	.section	.rodata.___asan_gen__anon_global,"aG",@progbits,___asan_gen__anon_global.872336dccd3cfefab51ea071a8f3f685,comdat
	.p2align	5, 0x0
___asan_gen__anon_global:
	.asciz	";unknown;unknown;0;0;;"
	.zero	41
	.size	___asan_gen__anon_global, 64

	.type	___asan_gen__anon_global.17,@object # @___asan_gen__anon_global.17
	.section	.data.rel.ro.___asan_gen__anon_global.17,"awG",@progbits,___asan_gen__anon_global.17.872336dccd3cfefab51ea071a8f3f685,comdat
	.p2align	5, 0x0
___asan_gen__anon_global.17:
	.long	0                               # 0x0
	.long	514                             # 0x202
	.long	0                               # 0x0
	.long	22                              # 0x16
	.quad	___asan_gen__anon_global
	.zero	40
	.size	___asan_gen__anon_global.17, 64

	.type	___asan_gen__anon_global.19,@object # @___asan_gen__anon_global.19
	.section	.data.rel.ro.___asan_gen__anon_global.19,"awG",@progbits,___asan_gen__anon_global.19.872336dccd3cfefab51ea071a8f3f685,comdat
	.p2align	5, 0x0
___asan_gen__anon_global.19:
	.long	0                               # 0x0
	.long	2                               # 0x2
	.long	0                               # 0x0
	.long	22                              # 0x16
	.quad	___asan_gen__anon_global
	.zero	40
	.size	___asan_gen__anon_global.19, 64

	.type	__PRETTY_FUNCTION__.crimmings_speckle_removal_filter_par,@object # @__PRETTY_FUNCTION__.crimmings_speckle_removal_filter_par
	.section	.rodata.__PRETTY_FUNCTION__.crimmings_speckle_removal_filter_par,"aG",@progbits,__PRETTY_FUNCTION__.crimmings_speckle_removal_filter_par.872336dccd3cfefab51ea071a8f3f685,comdat
	.p2align	5, 0x0
__PRETTY_FUNCTION__.crimmings_speckle_removal_filter_par:
	.asciz	"void crimmings_speckle_removal_filter_par(uint8_t *, uint32_t, uint32_t, uint8_t)"
	.zero	46
	.size	__PRETTY_FUNCTION__.crimmings_speckle_removal_filter_par, 128

	.type	.str.3,@object                  # @.str.3
	.section	.rodata..str.3,"aG",@progbits,.str.3.872336dccd3cfefab51ea071a8f3f685,comdat
	.p2align	5, 0x0
.str.3:
	.asciz	"Chunk = %d\n"
	.zero	20
	.size	.str.3, 32

	.type	.L___asan_gen_,@object          # @___asan_gen_
	.section	.rodata.str1.1,"aMS",@progbits,1
.L___asan_gen_:
	.asciz	"7 32 8 10 image.addr 64 8 14 tmp_image.addr 96 4 10 width.addr 112 4 11 height.addr 128 4 7 dx.addr 144 4 7 dy.addr 160 8 20 pass_logic_func.addr"
	.size	.L___asan_gen_, 146

	.type	.L___asan_gen_.4,@object        # @___asan_gen_.4
.L___asan_gen_.4:
	.asciz	"4 32 4 7 .omp.lb 48 4 7 .omp.ub 64 4 11 .omp.stride 80 4 12 .omp.is_last"
	.size	.L___asan_gen_.4, 73

	.type	.L___asan_gen_.5,@object        # @___asan_gen_.5
	.section	.rodata,"a",@progbits
.L___asan_gen_.5:
	.asciz	"src/crimmins.c"
	.size	.L___asan_gen_.5, 15

	.type	.L___asan_gen_.6,@object        # @___asan_gen_.6
	.section	.rodata.str1.1,"aMS",@progbits,1
.L___asan_gen_.6:
	.asciz	".str"
	.size	.L___asan_gen_.6, 5

	.type	.L___asan_gen_.7,@object        # @___asan_gen_.7
.L___asan_gen_.7:
	.asciz	".str.1"
	.size	.L___asan_gen_.7, 7

	.type	.L___asan_gen_.8,@object        # @___asan_gen_.8
.L___asan_gen_.8:
	.asciz	".str.2"
	.size	.L___asan_gen_.8, 7

	.type	.L___asan_gen_.9,@object        # @___asan_gen_.9
.L___asan_gen_.9:
	.asciz	"__PRETTY_FUNCTION__.crimmings_speckle_removal_filter"
	.size	.L___asan_gen_.9, 53

	.type	.L___asan_gen_.10,@object       # @___asan_gen_.10
.L___asan_gen_.10:
	.asciz	"passes"
	.size	.L___asan_gen_.10, 7

	.type	.L___asan_gen_.11,@object       # @___asan_gen_.11
.L___asan_gen_.11:
	.zero	1
	.size	.L___asan_gen_.11, 1

	.type	.L___asan_gen_.12,@object       # @___asan_gen_.12
.L___asan_gen_.12:
	.zero	1
	.size	.L___asan_gen_.12, 1

	.type	.L___asan_gen_.13,@object       # @___asan_gen_.13
.L___asan_gen_.13:
	.zero	1
	.size	.L___asan_gen_.13, 1

	.type	.L___asan_gen_.14,@object       # @___asan_gen_.14
.L___asan_gen_.14:
	.asciz	"__PRETTY_FUNCTION__.crimmings_speckle_removal_filter_par"
	.size	.L___asan_gen_.14, 57

	.type	.L___asan_gen_.15,@object       # @___asan_gen_.15
.L___asan_gen_.15:
	.asciz	".str.3"
	.size	.L___asan_gen_.15, 7

	.type	.L__asan_global_.str,@object    # @__asan_global_.str
	.section	asan_globals,"awoG",@progbits,.str,.str.872336dccd3cfefab51ea071a8f3f685,comdat,unique,1
	.p2align	4, 0x0
.L__asan_global_.str:
	.quad	.L__unnamed_1
	.quad	36                              # 0x24
	.quad	96                              # 0x60
	.quad	.L___asan_gen_.6
	.quad	.L___asan_gen_.5
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str, 64

	.type	.L__asan_global_.str.1,@object  # @__asan_global_.str.1
	.section	asan_globals,"awoG",@progbits,.str.1,.str.1.872336dccd3cfefab51ea071a8f3f685,comdat,unique,2
	.p2align	4, 0x0
.L__asan_global_.str.1:
	.quad	.L__unnamed_2
	.quad	59                              # 0x3b
	.quad	96                              # 0x60
	.quad	.L___asan_gen_.7
	.quad	.L___asan_gen_.5
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.1, 64

	.type	.L__asan_global_.str.2,@object  # @__asan_global_.str.2
	.section	asan_globals,"awoG",@progbits,.str.2,.str.2.872336dccd3cfefab51ea071a8f3f685,comdat,unique,3
	.p2align	4, 0x0
.L__asan_global_.str.2:
	.quad	.L__unnamed_3
	.quad	15                              # 0xf
	.quad	32                              # 0x20
	.quad	.L___asan_gen_.8
	.quad	.L___asan_gen_.5
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.2, 64

	.type	.L__asan_global___PRETTY_FUNCTION__.crimmings_speckle_removal_filter,@object # @__asan_global___PRETTY_FUNCTION__.crimmings_speckle_removal_filter
	.section	asan_globals,"awoG",@progbits,__PRETTY_FUNCTION__.crimmings_speckle_removal_filter,__PRETTY_FUNCTION__.crimmings_speckle_removal_filter.872336dccd3cfefab51ea071a8f3f685,comdat,unique,4
	.p2align	4, 0x0
.L__asan_global___PRETTY_FUNCTION__.crimmings_speckle_removal_filter:
	.quad	.L__unnamed_4
	.quad	78                              # 0x4e
	.quad	128                             # 0x80
	.quad	.L___asan_gen_.9
	.quad	.L___asan_gen_.5
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global___PRETTY_FUNCTION__.crimmings_speckle_removal_filter, 64

	.type	.L__asan_global_passes,@object  # @__asan_global_passes
	.section	asan_globals,"awoG",@progbits,passes,passes.872336dccd3cfefab51ea071a8f3f685,comdat,unique,5
	.p2align	4, 0x0
.L__asan_global_passes:
	.quad	.L__unnamed_5
	.quad	128                             # 0x80
	.quad	160                             # 0xa0
	.quad	.L___asan_gen_.10
	.quad	.L___asan_gen_.5
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_passes, 64

	.type	.L__asan_global_,@object        # @__asan_global_
	.section	asan_globals,"awoG",@progbits,___asan_gen__anon_global,___asan_gen__anon_global.872336dccd3cfefab51ea071a8f3f685,comdat,unique,6
	.p2align	4, 0x0
.L__asan_global_:
	.quad	.L__unnamed_6
	.quad	23                              # 0x17
	.quad	64                              # 0x40
	.quad	.L___asan_gen_.11
	.quad	.L___asan_gen_.5
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_, 64

	.type	.L__asan_global_.16,@object     # @__asan_global_.16
	.section	asan_globals,"awoG",@progbits,___asan_gen__anon_global.17,___asan_gen__anon_global.17.872336dccd3cfefab51ea071a8f3f685,comdat,unique,7
	.p2align	4, 0x0
.L__asan_global_.16:
	.quad	.L__unnamed_7
	.quad	24                              # 0x18
	.quad	64                              # 0x40
	.quad	.L___asan_gen_.12
	.quad	.L___asan_gen_.5
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.16, 64

	.type	.L__asan_global_.18,@object     # @__asan_global_.18
	.section	asan_globals,"awoG",@progbits,___asan_gen__anon_global.19,___asan_gen__anon_global.19.872336dccd3cfefab51ea071a8f3f685,comdat,unique,8
	.p2align	4, 0x0
.L__asan_global_.18:
	.quad	.L__unnamed_8
	.quad	24                              # 0x18
	.quad	64                              # 0x40
	.quad	.L___asan_gen_.13
	.quad	.L___asan_gen_.5
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.18, 64

	.type	.L__asan_global___PRETTY_FUNCTION__.crimmings_speckle_removal_filter_par,@object # @__asan_global___PRETTY_FUNCTION__.crimmings_speckle_removal_filter_par
	.section	asan_globals,"awoG",@progbits,__PRETTY_FUNCTION__.crimmings_speckle_removal_filter_par,__PRETTY_FUNCTION__.crimmings_speckle_removal_filter_par.872336dccd3cfefab51ea071a8f3f685,comdat,unique,9
	.p2align	4, 0x0
.L__asan_global___PRETTY_FUNCTION__.crimmings_speckle_removal_filter_par:
	.quad	.L__unnamed_9
	.quad	82                              # 0x52
	.quad	128                             # 0x80
	.quad	.L___asan_gen_.14
	.quad	.L___asan_gen_.5
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global___PRETTY_FUNCTION__.crimmings_speckle_removal_filter_par, 64

	.type	.L__asan_global_.str.3,@object  # @__asan_global_.str.3
	.section	asan_globals,"awoG",@progbits,.str.3,.str.3.872336dccd3cfefab51ea071a8f3f685,comdat,unique,10
	.p2align	4, 0x0
.L__asan_global_.str.3:
	.quad	.L__unnamed_10
	.quad	12                              # 0xc
	.quad	32                              # 0x20
	.quad	.L___asan_gen_.15
	.quad	.L___asan_gen_.5
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.3, 64

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
.set .L__unnamed_4, __PRETTY_FUNCTION__.crimmings_speckle_removal_filter
.set .L__unnamed_5, passes
.set .L__unnamed_6, ___asan_gen__anon_global
.set .L__unnamed_7, ___asan_gen__anon_global.17
.set .L__unnamed_8, ___asan_gen__anon_global.19
.set .L__unnamed_9, __PRETTY_FUNCTION__.crimmings_speckle_removal_filter_par
.set .L__unnamed_10, .str.3
	.weak	__start_asan_globals
	.weak	__stop_asan_globals
	.ident	"clang version 19.1.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym dark_pass_logic
	.addrsig_sym light_pass_logic
	.addrsig_sym pass_func
	.addrsig_sym malloc
	.addrsig_sym __assert_fail
	.addrsig_sym free
	.addrsig_sym pass_func_par
	.addrsig_sym pass_func_par.omp_outlined
	.addrsig_sym __kmpc_for_static_init_4u
	.addrsig_sym __kmpc_for_static_fini
	.addrsig_sym __kmpc_fork_call
	.addrsig_sym omp_get_max_threads
	.addrsig_sym printf
	.addrsig_sym __asan_report_load1
	.addrsig_sym __asan_report_load4
	.addrsig_sym __asan_report_load8
	.addrsig_sym __asan_report_store1
	.addrsig_sym __asan_memcpy
	.addrsig_sym __asan_handle_no_return
	.addrsig_sym __asan_stack_malloc_1
	.addrsig_sym __asan_stack_malloc_2
	.addrsig_sym __asan_register_elf_globals
	.addrsig_sym __asan_unregister_elf_globals
	.addrsig_sym __asan_init
	.addrsig_sym asan.module_ctor
	.addrsig_sym __asan_version_mismatch_check_v8
	.addrsig_sym asan.module_dtor
	.addrsig_sym __stack_chk_fail
	.addrsig_sym .str
	.addrsig_sym .str.1
	.addrsig_sym .str.2
	.addrsig_sym __PRETTY_FUNCTION__.crimmings_speckle_removal_filter
	.addrsig_sym passes
	.addrsig_sym ___asan_gen__anon_global
	.addrsig_sym ___asan_gen__anon_global.17
	.addrsig_sym ___asan_gen__anon_global.19
	.addrsig_sym __PRETTY_FUNCTION__.crimmings_speckle_removal_filter_par
	.addrsig_sym .str.3
	.addrsig_sym __asan_option_detect_stack_use_after_return
	.addrsig_sym .L___asan_gen_.5
	.addrsig_sym .L__asan_global_.str
	.addrsig_sym .L__asan_global_.str.1
	.addrsig_sym .L__asan_global_.str.2
	.addrsig_sym .L__asan_global___PRETTY_FUNCTION__.crimmings_speckle_removal_filter
	.addrsig_sym .L__asan_global_passes
	.addrsig_sym .L__asan_global_
	.addrsig_sym .L__asan_global_.16
	.addrsig_sym .L__asan_global_.18
	.addrsig_sym .L__asan_global___PRETTY_FUNCTION__.crimmings_speckle_removal_filter_par
	.addrsig_sym .L__asan_global_.str.3
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
