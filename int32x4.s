	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 11
	.globl	_add
	.align	4, 0x90
_add:                                   ## @add
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp0:
	.cfi_def_cfa_offset 16
Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp2:
	.cfi_def_cfa_register %rbp
	movdqu	(%rsi), %xmm0
	movdqu	(%rdi), %xmm1
  paddd	%xmm1, %xmm0
	movdqu	%xmm0, (%rdx)
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_mult
	.align	4, 0x90
_mult:                                  ## @mult
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp3:
	.cfi_def_cfa_offset 16
Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp5:
	.cfi_def_cfa_register %rbp
	movdqu	(%rdi), %xmm0
	movdqu	(%rsi), %xmm1
	pshufd	$245, %xmm1, %xmm2      ## xmm2 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$232, %xmm1, %xmm1      ## xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      ## xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm2, %xmm0
	pshufd	$232, %xmm0, %xmm0      ## xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    ## xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	movdqu	%xmm1, (%rdx)
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_subt
	.align	4, 0x90
_subt:                                  ## @subt
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp6:
	.cfi_def_cfa_offset 16
Ltmp7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp8:
	.cfi_def_cfa_register %rbp
	movdqu	(%rdi), %xmm0
	movdqu	(%rsi), %xmm1
  psubd	%xmm1, %xmm0
	movdqu	%xmm0, (%rdx)
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_divi
	.align	4, 0x90
_divi:                                  ## @divi
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp9:
	.cfi_def_cfa_offset 16
Ltmp10:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp11:
	.cfi_def_cfa_register %rbp
	movq	%rdx, %rcx
	movdqu	(%rdi), %xmm0
	movdqu	(%rsi), %xmm1
	pshufd	$231, %xmm0, %xmm2      ## xmm2 = xmm0[3,1,2,3]
	movd	%xmm2, %eax
	pshufd	$231, %xmm1, %xmm2      ## xmm2 = xmm1[3,1,2,3]
	movd	%xmm2, %esi
	cltd
	idivl	%esi
	movd	%eax, %xmm2
	pshufd	$229, %xmm0, %xmm3      ## xmm3 = xmm0[1,1,2,3]
	movd	%xmm3, %eax
	pshufd	$229, %xmm1, %xmm3      ## xmm3 = xmm1[1,1,2,3]
	movd	%xmm3, %esi
	cltd
	idivl	%esi
	movd	%eax, %xmm3
	punpckldq	%xmm2, %xmm3    ## xmm3 = xmm3[0],xmm2[0],xmm3[1],xmm2[1]
	movd	%xmm0, %eax
	movd	%xmm1, %esi
	cltd
	idivl	%esi
	movd	%eax, %xmm2
	pshufd	$78, %xmm0, %xmm0       ## xmm0 = xmm0[2,3,0,1]
	movd	%xmm0, %eax
	pshufd	$78, %xmm1, %xmm0       ## xmm0 = xmm1[2,3,0,1]
	movd	%xmm0, %esi
	cltd
	idivl	%esi
	movd	%eax, %xmm0
	punpckldq	%xmm0, %xmm2    ## xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	punpckldq	%xmm3, %xmm2    ## xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
	movdqu	%xmm2, (%rcx)
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_modu
	.align	4, 0x90
_modu:                                  ## @modu
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp12:
	.cfi_def_cfa_offset 16
Ltmp13:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp14:
	.cfi_def_cfa_register %rbp
	movq	%rdx, %rcx
	movdqu	(%rdi), %xmm0
	movdqu	(%rsi), %xmm1
	pshufd	$231, %xmm0, %xmm2      ## xmm2 = xmm0[3,1,2,3]
	movd	%xmm2, %eax
	pshufd	$231, %xmm1, %xmm2      ## xmm2 = xmm1[3,1,2,3]
	movd	%xmm2, %esi
	cltd
	idivl	%esi
	movd	%edx, %xmm2
	pshufd	$229, %xmm0, %xmm3      ## xmm3 = xmm0[1,1,2,3]
	movd	%xmm3, %eax
	pshufd	$229, %xmm1, %xmm3      ## xmm3 = xmm1[1,1,2,3]
	movd	%xmm3, %esi
	cltd
	idivl	%esi
	movd	%edx, %xmm3
	punpckldq	%xmm2, %xmm3    ## xmm3 = xmm3[0],xmm2[0],xmm3[1],xmm2[1]
	movd	%xmm0, %eax
	movd	%xmm1, %esi
	cltd
	idivl	%esi
	movd	%edx, %xmm2
	pshufd	$78, %xmm0, %xmm0       ## xmm0 = xmm0[2,3,0,1]
	movd	%xmm0, %eax
	pshufd	$78, %xmm1, %xmm0       ## xmm0 = xmm1[2,3,0,1]
	movd	%xmm0, %esi
	cltd
	idivl	%esi
	movd	%edx, %xmm0
	punpckldq	%xmm0, %xmm2    ## xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	punpckldq	%xmm3, %xmm2    ## xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
	movdqu	%xmm2, (%rcx)
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_xor
	.align	4, 0x90
_xor:                                   ## @xor
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp15:
	.cfi_def_cfa_offset 16
Ltmp16:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp17:
	.cfi_def_cfa_register %rbp
	movups	(%rdi), %xmm0
  movups	(%rsi), %xmm1
  xorps	%xmm1, %xmm0
	movups	%xmm0, (%rdx)
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_bitOr
	.align	4, 0x90
_bitOr:                                 ## @bitOr
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp18:
	.cfi_def_cfa_offset 16
Ltmp19:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp20:
	.cfi_def_cfa_register %rbp
	movups	(%rsi), %xmm0
  movups	(%rdi), %xmm1
  orps	%xmm1, %xmm0
	movups	%xmm0, (%rdx)
	popq	%rbp
	retq
	.cfi_endproc


.subsections_via_symbols
