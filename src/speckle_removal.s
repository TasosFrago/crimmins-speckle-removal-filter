	.text
	.file	"speckle_removal.c"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$192, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	cmpl	$5, -8(%rbp)
	jge	.LBB0_8
# %bb.1:                                # %if.then
	movq	stderr@GOTPCREL(%rip), %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.LBB0_3
# %bb.2:
	movq	stderr@GOTPCREL(%rip), %rdi
	callq	__asan_report_load8@PLT
.LBB0_3:
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	.str(%rip), %rsi
	movb	$0, %al
	callq	fprintf@PLT
	movq	stderr@GOTPCREL(%rip), %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.LBB0_5
# %bb.4:
	movq	stderr@GOTPCREL(%rip), %rdi
	callq	__asan_report_load8@PLT
.LBB0_5:
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -144(%rbp)                # 8-byte Spill
	movq	-16(%rbp), %rax
	movq	%rax, -136(%rbp)                # 8-byte Spill
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.LBB0_7
# %bb.6:
	movq	-136(%rbp), %rdi                # 8-byte Reload
	callq	__asan_report_load8@PLT
.LBB0_7:
	movq	-144(%rbp), %rdi                # 8-byte Reload
	movq	-136(%rbp), %rax                # 8-byte Reload
	movq	(%rax), %rdx
	leaq	.str.1(%rip), %rsi
	movb	$0, %al
	callq	fprintf@PLT
	movl	$-1, -4(%rbp)
	jmp	.LBB0_49
.LBB0_8:                                # %if.end
	movq	-16(%rbp), %rax
	addq	$8, %rax
	movq	%rax, -152(%rbp)                # 8-byte Spill
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.LBB0_10
# %bb.9:
	movq	-152(%rbp), %rdi                # 8-byte Reload
	callq	__asan_report_load8@PLT
.LBB0_10:
	movq	-152(%rbp), %rax                # 8-byte Reload
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	addq	$16, %rax
	movq	%rax, -160(%rbp)                # 8-byte Spill
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.LBB0_12
# %bb.11:
	movq	-160(%rbp), %rdi                # 8-byte Reload
	callq	__asan_report_load8@PLT
.LBB0_12:
	movq	-160(%rbp), %rax                # 8-byte Reload
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-16(%rbp), %rax
	addq	$24, %rax
	movq	%rax, -168(%rbp)                # 8-byte Spill
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.LBB0_14
# %bb.13:
	movq	-168(%rbp), %rdi                # 8-byte Reload
	callq	__asan_report_load8@PLT
.LBB0_14:
	movq	-168(%rbp), %rax                # 8-byte Reload
	movq	(%rax), %rdi
	callq	atoi@PLT
	movl	%eax, -36(%rbp)
	movq	-16(%rbp), %rax
	addq	$32, %rax
	movq	%rax, -176(%rbp)                # 8-byte Spill
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.LBB0_16
# %bb.15:
	movq	-176(%rbp), %rdi                # 8-byte Reload
	callq	__asan_report_load8@PLT
.LBB0_16:
	movq	-176(%rbp), %rax                # 8-byte Reload
	movq	(%rax), %rdi
	callq	atoi@PLT
	movl	%eax, -40(%rbp)
	cmpl	$6, -8(%rbp)
	jl	.LBB0_20
# %bb.17:                               # %cond.true
	movq	-16(%rbp), %rax
	addq	$40, %rax
	movq	%rax, -184(%rbp)                # 8-byte Spill
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.LBB0_19
# %bb.18:
	movq	-184(%rbp), %rdi                # 8-byte Reload
	callq	__asan_report_load8@PLT
.LBB0_19:
	movq	-184(%rbp), %rax                # 8-byte Reload
	movq	(%rax), %rdi
	callq	atoi@PLT
	movl	%eax, -188(%rbp)                # 4-byte Spill
	jmp	.LBB0_21
.LBB0_20:                               # %cond.false
	movl	$1, %eax
	movl	%eax, -188(%rbp)                # 4-byte Spill
	jmp	.LBB0_21
.LBB0_21:                               # %cond.end
	movl	-188(%rbp), %eax                # 4-byte Reload
                                        # kill: def $al killed $al killed $eax
	movb	%al, -41(%rbp)
	movl	-36(%rbp), %eax
	imull	-40(%rbp), %eax
	movl	%eax, %eax
                                        # kill: def $rax killed $eax
	movq	%rax, -56(%rbp)
	movq	-24(%rbp), %rdi
	leaq	.str.2(%rip), %rsi
	callq	fopen@PLT
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.LBB0_25
# %bb.22:                               # %if.then13
	movq	stderr@GOTPCREL(%rip), %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.LBB0_24
# %bb.23:
	movq	stderr@GOTPCREL(%rip), %rdi
	callq	__asan_report_load8@PLT
.LBB0_24:
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	.str.3(%rip), %rsi
	movb	$0, %al
	callq	fprintf@PLT
	movl	$-2, -4(%rbp)
	movl	$1, -68(%rbp)
	jmp	.LBB0_48
.LBB0_25:                               # %if.end15
	movq	-56(%rbp), %rdi
	callq	malloc@PLT
	movq	%rax, -80(%rbp)
	movq	-56(%rbp), %rdi
	callq	malloc@PLT
	movq	%rax, -88(%rbp)
	cmpq	$0, -80(%rbp)
	je	.LBB0_27
# %bb.26:                               # %lor.lhs.false
	cmpq	$0, -88(%rbp)
	jne	.LBB0_30
.LBB0_27:                               # %if.then20
	movq	stderr@GOTPCREL(%rip), %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.LBB0_29
# %bb.28:
	movq	stderr@GOTPCREL(%rip), %rdi
	callq	__asan_report_load8@PLT
.LBB0_29:
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	.str.4(%rip), %rsi
	movb	$0, %al
	callq	fprintf@PLT
	movq	-64(%rbp), %rdi
	callq	fclose@PLT
	movl	$-3, -4(%rbp)
	movl	$1, -68(%rbp)
	jmp	.LBB0_47
.LBB0_30:                               # %if.end23
	movq	-80(%rbp), %rdi
	movq	-56(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movl	$1, %esi
	callq	fread@PLT
	cmpq	-56(%rbp), %rax
	je	.LBB0_34
# %bb.31:                               # %if.then27
	movq	stderr@GOTPCREL(%rip), %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.LBB0_33
# %bb.32:
	movq	stderr@GOTPCREL(%rip), %rdi
	callq	__asan_report_load8@PLT
.LBB0_33:
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	.str.5(%rip), %rsi
	movb	$0, %al
	callq	fprintf@PLT
	movq	-64(%rbp), %rdi
	callq	fclose@PLT
	movq	-80(%rbp), %rdi
	callq	free@PLT
	movq	-88(%rbp), %rdi
	callq	free@PLT
	movl	$-4, -4(%rbp)
	movl	$1, -68(%rbp)
	jmp	.LBB0_47
.LBB0_34:                               # %if.end30
	movq	-64(%rbp), %rdi
	callq	fclose@PLT
	movq	-88(%rbp), %rdi
	movq	-80(%rbp), %rsi
	movq	-56(%rbp), %rdx
	callq	__asan_memcpy@PLT
	leaq	.str.6(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
# %bb.35:                               # %do.body
	callq	omp_get_wtime@PLT
	movsd	%xmm0, -96(%rbp)
	movq	-80(%rbp), %rdi
	movl	-36(%rbp), %esi
	movl	-40(%rbp), %edx
	movzbl	-41(%rbp), %ecx
	callq	crimmings_speckle_removal_filter@PLT
	callq	omp_get_wtime@PLT
	subsd	-96(%rbp), %xmm0
	movsd	%xmm0, -96(%rbp)
	movsd	-96(%rbp), %xmm0                # xmm0 = mem[0],zero
	leaq	.str.7(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
# %bb.36:                               # %do.cond
	jmp	.LBB0_37
.LBB0_37:                               # %do.end
	movq	-32(%rbp), %rdi
	leaq	.str.8(%rip), %rsi
	callq	modify_filename@PLT
	movq	%rax, -104(%rbp)
	movq	-104(%rbp), %rdi
	movq	-80(%rbp), %rsi
	movq	-56(%rbp), %rax
	movl	%eax, %edx
	callq	fwriteImage@PLT
	movl	%eax, -108(%rbp)
	movq	-104(%rbp), %rdi
	callq	free@PLT
	cmpl	$0, -108(%rbp)
	je	.LBB0_39
# %bb.38:                               # %if.then40
	movq	-80(%rbp), %rdi
	callq	free@PLT
	movq	-88(%rbp), %rdi
	callq	free@PLT
	movl	$-1, -4(%rbp)
	movl	$1, -68(%rbp)
	jmp	.LBB0_46
.LBB0_39:                               # %if.end41
	leaq	.str.9(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
# %bb.40:                               # %do.body43
	callq	omp_get_wtime@PLT
	movsd	%xmm0, -120(%rbp)
	movq	-88(%rbp), %rdi
	movl	-36(%rbp), %esi
	movl	-40(%rbp), %edx
	movzbl	-41(%rbp), %ecx
	callq	crimmings_speckle_removal_filter_par@PLT
	callq	omp_get_wtime@PLT
	subsd	-120(%rbp), %xmm0
	movsd	%xmm0, -120(%rbp)
	movsd	-120(%rbp), %xmm0               # xmm0 = mem[0],zero
	leaq	.str.7(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
# %bb.41:                               # %do.cond48
	jmp	.LBB0_42
.LBB0_42:                               # %do.end49
	movq	-32(%rbp), %rdi
	leaq	.str.10(%rip), %rsi
	callq	modify_filename@PLT
	movq	%rax, -128(%rbp)
	movq	-128(%rbp), %rdi
	movq	-88(%rbp), %rsi
	movq	-56(%rbp), %rax
	movl	%eax, %edx
	callq	fwriteImage@PLT
	movl	%eax, -108(%rbp)
	movq	-128(%rbp), %rdi
	callq	free@PLT
	cmpl	$0, -108(%rbp)
	je	.LBB0_44
# %bb.43:                               # %if.then54
	movq	-80(%rbp), %rdi
	callq	free@PLT
	movq	-88(%rbp), %rdi
	callq	free@PLT
	movl	$-5, -4(%rbp)
	movl	$1, -68(%rbp)
	jmp	.LBB0_45
.LBB0_44:                               # %if.end55
	movsd	-96(%rbp), %xmm0                # xmm0 = mem[0],zero
	divsd	-120(%rbp), %xmm0
	leaq	.str.11(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
	leaq	.str.12(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movq	-80(%rbp), %rdi
	movq	-88(%rbp), %rsi
	movl	-36(%rbp), %edx
	movl	-40(%rbp), %ecx
	callq	image_validator@PLT
	movq	-80(%rbp), %rdi
	callq	free@PLT
	movq	-88(%rbp), %rdi
	callq	free@PLT
	leaq	.str.13(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	$0, -4(%rbp)
	movl	$1, -68(%rbp)
.LBB0_45:                               # %cleanup
.LBB0_46:                               # %cleanup60
.LBB0_47:                               # %cleanup63
.LBB0_48:                               # %cleanup65
.LBB0_49:                               # %return
	movl	-4(%rbp), %eax
	addq	$192, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
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
.Lfunc_end1:
	.size	asan.module_ctor, .Lfunc_end1-asan.module_ctor
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
.Lfunc_end2:
	.size	asan.module_dtor, .Lfunc_end2-asan.module_dtor
	.cfi_endproc
                                        # -- End function
	.type	.str,@object                    # @.str
	.section	.rodata..str,"aG",@progbits,.str.21576b91ab9b15712202e1b4a494877f,comdat
	.p2align	5, 0x0
.str:
	.asciz	"Not enough input arguments given.\n"
	.zero	61
	.size	.str, 96

	.type	.str.1,@object                  # @.str.1
	.section	.rodata..str.1,"aG",@progbits,.str.1.21576b91ab9b15712202e1b4a494877f,comdat
	.p2align	5, 0x0
.str.1:
	.asciz	"USAGE: %s path/to/input/image path/to/output/image [width] [height] [optional num of passes]\n"
	.zero	34
	.size	.str.1, 128

	.type	.str.2,@object                  # @.str.2
	.section	.rodata..str.2,"aG",@progbits,.str.2.21576b91ab9b15712202e1b4a494877f,comdat
	.p2align	5, 0x0
.str.2:
	.asciz	"rb"
	.zero	29
	.size	.str.2, 32

	.type	.str.3,@object                  # @.str.3
	.section	.rodata..str.3,"aG",@progbits,.str.3.21576b91ab9b15712202e1b4a494877f,comdat
	.p2align	5, 0x0
.str.3:
	.asciz	"Error opening the input image\n"
	.zero	33
	.size	.str.3, 64

	.type	.str.4,@object                  # @.str.4
	.section	.rodata..str.4,"aG",@progbits,.str.4.21576b91ab9b15712202e1b4a494877f,comdat
	.p2align	5, 0x0
.str.4:
	.asciz	"Error allocating image buffer"
	.zero	34
	.size	.str.4, 64

	.type	.str.5,@object                  # @.str.5
	.section	.rodata..str.5,"aG",@progbits,.str.5.21576b91ab9b15712202e1b4a494877f,comdat
	.p2align	5, 0x0
.str.5:
	.asciz	"Error reading input image\n"
	.zero	37
	.size	.str.5, 64

	.type	.str.6,@object                  # @.str.6
	.section	.rodata..str.6,"aG",@progbits,.str.6.21576b91ab9b15712202e1b4a494877f,comdat
	.p2align	5, 0x0
.str.6:
	.asciz	"Serial algorithm\n"
	.zero	46
	.size	.str.6, 64

	.type	.str.7,@object                  # @.str.7
	.section	.rodata..str.7,"aG",@progbits,.str.7.21576b91ab9b15712202e1b4a494877f,comdat
	.p2align	5, 0x0
.str.7:
	.asciz	"Time taken: %lfs\n"
	.zero	46
	.size	.str.7, 64

	.type	.str.8,@object                  # @.str.8
	.section	.rodata..str.8,"aG",@progbits,.str.8.21576b91ab9b15712202e1b4a494877f,comdat
	.p2align	5, 0x0
.str.8:
	.asciz	"ser"
	.zero	28
	.size	.str.8, 32

	.type	.str.9,@object                  # @.str.9
	.section	.rodata..str.9,"aG",@progbits,.str.9.21576b91ab9b15712202e1b4a494877f,comdat
	.p2align	5, 0x0
.str.9:
	.asciz	"Parallel algorithm\n"
	.zero	44
	.size	.str.9, 64

	.type	.str.10,@object                 # @.str.10
	.section	.rodata..str.10,"aG",@progbits,.str.10.21576b91ab9b15712202e1b4a494877f,comdat
	.p2align	5, 0x0
.str.10:
	.asciz	"par"
	.zero	28
	.size	.str.10, 32

	.type	.str.11,@object                 # @.str.11
	.section	.rodata..str.11,"aG",@progbits,.str.11.21576b91ab9b15712202e1b4a494877f,comdat
	.p2align	5, 0x0
.str.11:
	.asciz	"Speedup: %.4f\n"
	.zero	17
	.size	.str.11, 32

	.type	.str.12,@object                 # @.str.12
	.section	.rodata..str.12,"aG",@progbits,.str.12.21576b91ab9b15712202e1b4a494877f,comdat
	.p2align	5, 0x0
.str.12:
	.asciz	"\nValidating ser with par\n"
	.zero	38
	.size	.str.12, 64

	.type	.str.13,@object                 # @.str.13
	.section	.rodata..str.13,"aG",@progbits,.str.13.21576b91ab9b15712202e1b4a494877f,comdat
	.p2align	5, 0x0
.str.13:
	.asciz	"Filtering complete!!!\n"
	.zero	41
	.size	.str.13, 64

	.type	.L___asan_gen_,@object          # @___asan_gen_
	.section	.rodata,"a",@progbits
.L___asan_gen_:
	.asciz	"src/speckle_removal.c"
	.size	.L___asan_gen_, 22

	.type	.L___asan_gen_.14,@object       # @___asan_gen_.14
	.section	.rodata.str1.1,"aMS",@progbits,1
.L___asan_gen_.14:
	.asciz	".str"
	.size	.L___asan_gen_.14, 5

	.type	.L___asan_gen_.15,@object       # @___asan_gen_.15
.L___asan_gen_.15:
	.asciz	".str.1"
	.size	.L___asan_gen_.15, 7

	.type	.L___asan_gen_.16,@object       # @___asan_gen_.16
.L___asan_gen_.16:
	.asciz	".str.2"
	.size	.L___asan_gen_.16, 7

	.type	.L___asan_gen_.17,@object       # @___asan_gen_.17
.L___asan_gen_.17:
	.asciz	".str.3"
	.size	.L___asan_gen_.17, 7

	.type	.L___asan_gen_.18,@object       # @___asan_gen_.18
.L___asan_gen_.18:
	.asciz	".str.4"
	.size	.L___asan_gen_.18, 7

	.type	.L___asan_gen_.19,@object       # @___asan_gen_.19
.L___asan_gen_.19:
	.asciz	".str.5"
	.size	.L___asan_gen_.19, 7

	.type	.L___asan_gen_.20,@object       # @___asan_gen_.20
.L___asan_gen_.20:
	.asciz	".str.6"
	.size	.L___asan_gen_.20, 7

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
	.asciz	".str.11"
	.size	.L___asan_gen_.25, 8

	.type	.L___asan_gen_.26,@object       # @___asan_gen_.26
.L___asan_gen_.26:
	.asciz	".str.12"
	.size	.L___asan_gen_.26, 8

	.type	.L___asan_gen_.27,@object       # @___asan_gen_.27
.L___asan_gen_.27:
	.asciz	".str.13"
	.size	.L___asan_gen_.27, 8

	.type	.L__asan_global_.str,@object    # @__asan_global_.str
	.section	asan_globals,"awoG",@progbits,.str,.str.21576b91ab9b15712202e1b4a494877f,comdat,unique,1
	.p2align	4, 0x0
.L__asan_global_.str:
	.quad	.L__unnamed_1
	.quad	35                              # 0x23
	.quad	96                              # 0x60
	.quad	.L___asan_gen_.14
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str, 64

	.type	.L__asan_global_.str.1,@object  # @__asan_global_.str.1
	.section	asan_globals,"awoG",@progbits,.str.1,.str.1.21576b91ab9b15712202e1b4a494877f,comdat,unique,2
	.p2align	4, 0x0
.L__asan_global_.str.1:
	.quad	.L__unnamed_2
	.quad	94                              # 0x5e
	.quad	128                             # 0x80
	.quad	.L___asan_gen_.15
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.1, 64

	.type	.L__asan_global_.str.2,@object  # @__asan_global_.str.2
	.section	asan_globals,"awoG",@progbits,.str.2,.str.2.21576b91ab9b15712202e1b4a494877f,comdat,unique,3
	.p2align	4, 0x0
.L__asan_global_.str.2:
	.quad	.L__unnamed_3
	.quad	3                               # 0x3
	.quad	32                              # 0x20
	.quad	.L___asan_gen_.16
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.2, 64

	.type	.L__asan_global_.str.3,@object  # @__asan_global_.str.3
	.section	asan_globals,"awoG",@progbits,.str.3,.str.3.21576b91ab9b15712202e1b4a494877f,comdat,unique,4
	.p2align	4, 0x0
.L__asan_global_.str.3:
	.quad	.L__unnamed_4
	.quad	31                              # 0x1f
	.quad	64                              # 0x40
	.quad	.L___asan_gen_.17
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.3, 64

	.type	.L__asan_global_.str.4,@object  # @__asan_global_.str.4
	.section	asan_globals,"awoG",@progbits,.str.4,.str.4.21576b91ab9b15712202e1b4a494877f,comdat,unique,5
	.p2align	4, 0x0
.L__asan_global_.str.4:
	.quad	.L__unnamed_5
	.quad	30                              # 0x1e
	.quad	64                              # 0x40
	.quad	.L___asan_gen_.18
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.4, 64

	.type	.L__asan_global_.str.5,@object  # @__asan_global_.str.5
	.section	asan_globals,"awoG",@progbits,.str.5,.str.5.21576b91ab9b15712202e1b4a494877f,comdat,unique,6
	.p2align	4, 0x0
.L__asan_global_.str.5:
	.quad	.L__unnamed_6
	.quad	27                              # 0x1b
	.quad	64                              # 0x40
	.quad	.L___asan_gen_.19
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.5, 64

	.type	.L__asan_global_.str.6,@object  # @__asan_global_.str.6
	.section	asan_globals,"awoG",@progbits,.str.6,.str.6.21576b91ab9b15712202e1b4a494877f,comdat,unique,7
	.p2align	4, 0x0
.L__asan_global_.str.6:
	.quad	.L__unnamed_7
	.quad	18                              # 0x12
	.quad	64                              # 0x40
	.quad	.L___asan_gen_.20
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.6, 64

	.type	.L__asan_global_.str.7,@object  # @__asan_global_.str.7
	.section	asan_globals,"awoG",@progbits,.str.7,.str.7.21576b91ab9b15712202e1b4a494877f,comdat,unique,8
	.p2align	4, 0x0
.L__asan_global_.str.7:
	.quad	.L__unnamed_8
	.quad	18                              # 0x12
	.quad	64                              # 0x40
	.quad	.L___asan_gen_.21
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.7, 64

	.type	.L__asan_global_.str.8,@object  # @__asan_global_.str.8
	.section	asan_globals,"awoG",@progbits,.str.8,.str.8.21576b91ab9b15712202e1b4a494877f,comdat,unique,9
	.p2align	4, 0x0
.L__asan_global_.str.8:
	.quad	.L__unnamed_9
	.quad	4                               # 0x4
	.quad	32                              # 0x20
	.quad	.L___asan_gen_.22
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.8, 64

	.type	.L__asan_global_.str.9,@object  # @__asan_global_.str.9
	.section	asan_globals,"awoG",@progbits,.str.9,.str.9.21576b91ab9b15712202e1b4a494877f,comdat,unique,10
	.p2align	4, 0x0
.L__asan_global_.str.9:
	.quad	.L__unnamed_10
	.quad	20                              # 0x14
	.quad	64                              # 0x40
	.quad	.L___asan_gen_.23
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.9, 64

	.type	.L__asan_global_.str.10,@object # @__asan_global_.str.10
	.section	asan_globals,"awoG",@progbits,.str.10,.str.10.21576b91ab9b15712202e1b4a494877f,comdat,unique,11
	.p2align	4, 0x0
.L__asan_global_.str.10:
	.quad	.L__unnamed_11
	.quad	4                               # 0x4
	.quad	32                              # 0x20
	.quad	.L___asan_gen_.24
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.10, 64

	.type	.L__asan_global_.str.11,@object # @__asan_global_.str.11
	.section	asan_globals,"awoG",@progbits,.str.11,.str.11.21576b91ab9b15712202e1b4a494877f,comdat,unique,12
	.p2align	4, 0x0
.L__asan_global_.str.11:
	.quad	.L__unnamed_12
	.quad	15                              # 0xf
	.quad	32                              # 0x20
	.quad	.L___asan_gen_.25
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.11, 64

	.type	.L__asan_global_.str.12,@object # @__asan_global_.str.12
	.section	asan_globals,"awoG",@progbits,.str.12,.str.12.21576b91ab9b15712202e1b4a494877f,comdat,unique,13
	.p2align	4, 0x0
.L__asan_global_.str.12:
	.quad	.L__unnamed_13
	.quad	26                              # 0x1a
	.quad	64                              # 0x40
	.quad	.L___asan_gen_.26
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.12, 64

	.type	.L__asan_global_.str.13,@object # @__asan_global_.str.13
	.section	asan_globals,"awoG",@progbits,.str.13,.str.13.21576b91ab9b15712202e1b4a494877f,comdat,unique,14
	.p2align	4, 0x0
.L__asan_global_.str.13:
	.quad	.L__unnamed_14
	.quad	23                              # 0x17
	.quad	64                              # 0x40
	.quad	.L___asan_gen_.27
	.quad	.L___asan_gen_
	.quad	0                               # 0x0
	.quad	0                               # 0x0
	.quad	-1                              # 0xffffffffffffffff
	.size	.L__asan_global_.str.13, 64

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
.set .L__unnamed_8, .str.7
.set .L__unnamed_9, .str.8
.set .L__unnamed_10, .str.9
.set .L__unnamed_11, .str.10
.set .L__unnamed_12, .str.11
.set .L__unnamed_13, .str.12
.set .L__unnamed_14, .str.13
	.weak	__start_asan_globals
	.weak	__stop_asan_globals
	.ident	"clang version 19.1.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym fprintf
	.addrsig_sym atoi
	.addrsig_sym fopen
	.addrsig_sym malloc
	.addrsig_sym fclose
	.addrsig_sym fread
	.addrsig_sym free
	.addrsig_sym printf
	.addrsig_sym omp_get_wtime
	.addrsig_sym crimmings_speckle_removal_filter
	.addrsig_sym modify_filename
	.addrsig_sym fwriteImage
	.addrsig_sym crimmings_speckle_removal_filter_par
	.addrsig_sym image_validator
	.addrsig_sym __asan_report_load8
	.addrsig_sym __asan_memcpy
	.addrsig_sym __asan_register_elf_globals
	.addrsig_sym __asan_unregister_elf_globals
	.addrsig_sym __asan_init
	.addrsig_sym asan.module_ctor
	.addrsig_sym __asan_version_mismatch_check_v8
	.addrsig_sym asan.module_dtor
	.addrsig_sym stderr
	.addrsig_sym .str
	.addrsig_sym .str.1
	.addrsig_sym .str.2
	.addrsig_sym .str.3
	.addrsig_sym .str.4
	.addrsig_sym .str.5
	.addrsig_sym .str.6
	.addrsig_sym .str.7
	.addrsig_sym .str.8
	.addrsig_sym .str.9
	.addrsig_sym .str.10
	.addrsig_sym .str.11
	.addrsig_sym .str.12
	.addrsig_sym .str.13
	.addrsig_sym .L___asan_gen_
	.addrsig_sym .L__asan_global_.str
	.addrsig_sym .L__asan_global_.str.1
	.addrsig_sym .L__asan_global_.str.2
	.addrsig_sym .L__asan_global_.str.3
	.addrsig_sym .L__asan_global_.str.4
	.addrsig_sym .L__asan_global_.str.5
	.addrsig_sym .L__asan_global_.str.6
	.addrsig_sym .L__asan_global_.str.7
	.addrsig_sym .L__asan_global_.str.8
	.addrsig_sym .L__asan_global_.str.9
	.addrsig_sym .L__asan_global_.str.10
	.addrsig_sym .L__asan_global_.str.11
	.addrsig_sym .L__asan_global_.str.12
	.addrsig_sym .L__asan_global_.str.13
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
