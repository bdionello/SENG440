	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"filter.c"
	.text
	.section	.text.startup,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	main
	.arch armv7-a
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mvn	r1, #-2147450880
	vpush.64	{d8}
	movw	r4, #32769
	ldr	r0, .L8+4
	movt	r4, 32769
	ldr	r3, .L8+8
.LPIC0:
	add	r0, pc
	sub	sp, sp, #36
	ldr	r3, [r0, r3]
	add	r2, r3, #200
	mov	r5, r3
	str	r4, [r3], #4	@ unaligned
.L2:
	str	r1, [r3], #4	@ unaligned
	cmp	r3, r2
	bne	.L2
	ldr	r3, .L8+12
	mov	r2, #49152
	movt	r2, 65535
	mov	ip, #-1073692672
	movs	r6, #0
	movs	r7, #0
	ldr	r4, [r0, r3]
	mov	r1, r2
	ldr	r0, .L8+16
	movt	r7, 49136
	ldr	r3, .L8+20
	mov	fp, #2
	str	ip, [r4]	@ unaligned
.LPIC1:
	add	r0, pc
	strd	r6, [sp]
.LPIC3:
	add	r3, pc
	str	r3, [sp, #20]
	bl	printf(PLT)
	ldrsh	r2, [r4, #2]
	mov	r9, r4
	vldr.32	s17, .L8
	mov	r6, fp
	ldr	r0, .L8+24
	mov	r1, r2
	vmov	s15, r2	@ int
.LPIC2:
	add	r0, pc
	vmov.f32	s16, s17
	vcvt.f32.s32	s15, s15
	vmul.f32	s15, s15, s17
	vcvt.f64.f32	d7, s15
	vstr.64	d7, [sp]
	bl	printf(PLT)
.L3:
	ldrh	r4, [r5, #2]
	mov	r0, #8388608
	ldrh	r2, [r5, #4]
	movw	r1, #30384
	ldrh	r3, [r5]
	mov	r7, #8192
	ldrsh	r10, [r9, #2]
	movw	lr, #29863
	ldrh	r8, [r9]
	movw	ip, #38103
	smlabb	r3, r3, r1, r0
	adds	r5, r5, #4
	smulbb	r4, r4, r1
	add	r9, r9, #4
	smulbb	r2, r2, r1
	mov	r1, #16384
	smlabb	r8, r8, ip, r1
	str	r3, [sp, #24]
	smlabb	r1, r10, lr, r7
	add	r3, r4, #4194304
	add	fp, r2, r0
	add	r2, r2, #4194304
	asrs	r3, r3, #23
	add	r4, r4, r0
	add	r3, r3, fp, asr #24
	ldrh	fp, [r5, #2]
	str	r1, [sp, #28]
	ldr	r1, [sp, #24]
	add	r3, r3, r1, asr #24
	mov	r1, #16384
	smlabb	ip, r10, ip, r1
	ldr	r1, [sp, #28]
	asr	r10, r2, #23
	movw	r2, #30384
	smlabb	fp, fp, r2, r0
	add	r3, r3, r1, asr #14
	add	r3, r3, r8, asr #15
	mov	r1, r6
	ldr	r0, [sp, #20]
	add	r8, r6, #1
	sxth	r3, r3
	strh	r3, [r9]	@ movhi
	vmov	s15, r3	@ int
	mov	r2, r3
	smlabb	lr, r3, lr, r7
	vcvt.f32.s32	s14, s15
	add	r7, r10, fp, asr #24
	add	r7, r7, r4, asr #24
	add	r7, r7, ip, asr #15
	add	r7, r7, lr, asr #14
	strh	r7, [r9, #2]	@ movhi
	str	r6, [sp]
	adds	r6, r6, #2
	vmul.f32	s14, s14, s16
	vcvt.f64.f32	d7, s14
	vstr.64	d7, [sp, #8]
	bl	printf(PLT)
	ldrsh	r3, [r9, #2]
	mov	r1, r8
	str	r8, [sp]
	ldr	r0, [sp, #20]
	vmov	s15, r3	@ int
	mov	r2, r3
	vcvt.f32.s32	s14, s15
	vmul.f32	s14, s14, s16
	vcvt.f64.f32	d7, s14
	vstr.64	d7, [sp, #8]
	bl	printf(PLT)
	cmp	r6, #100
	bne	.L3
	add	sp, sp, #36
	@ sp needed
	vldm	sp!, {d8}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L9:
	.align	2
.L8:
	.word	947912704
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+4)
	.word	X(GOT)
	.word	Y(GOT)
	.word	.LC0-(.LPIC1+4)
	.word	.LC2-(.LPIC3+4)
	.word	.LC1-(.LPIC2+4)
	.size	main, .-main
	.comm	Y,256,4
	.comm	X,256,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Y[ 0] = %+6hi = 0x%04hX ....... y[ 0] = %8.5f\012\000"
	.space	1
.LC1:
	.ascii	"Y[ 1] = %+6hi = 0x%04hX ....... y[ 1] = %8.5f\012\000"
	.space	1
.LC2:
	.ascii	"Y[%2d] = %+6hi = 0x%04hX ....... y[%2d] = %8.5f\012"
	.ascii	"\000"
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
