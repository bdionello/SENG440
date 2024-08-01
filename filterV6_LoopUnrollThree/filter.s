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
	mov	fp, r3
	str	r4, [r3], #4	@ unaligned
.L2:
	str	r1, [r3], #4	@ unaligned
	cmp	r3, r2
	bne	.L2
	ldr	r3, .L8+12
	mov	r2, #49152
	movt	r2, 65535
	movs	r6, #0
	movs	r7, #0
	mov	r5, #-1073692672
	ldr	r4, [r0, r3]
	mov	r1, r2
	ldr	r0, .L8+16
	movt	r7, 49136
	ldr	r3, .L8+20
	mov	r8, #2
	str	r5, [r4]	@ unaligned
.LPIC1:
	add	r0, pc
	strd	r6, [sp]
.LPIC3:
	add	r3, pc
	str	r3, [sp, #28]
	bl	printf(PLT)
	ldrsh	r2, [r4, #2]
	mov	r9, r4
	vldr.32	s17, .L8
	mov	r4, r8
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
	ldrh	r2, [fp, #4]
	movw	r1, #30384
	ldrh	r8, [fp]
	mov	r5, #8388608
	ldrh	r3, [r9]
	mov	lr, #16384
	smulbb	r2, r2, r1
	ldrsh	r7, [r9, #2]
	smlabb	r8, r8, r1, r5
	movw	r5, #38103
	smlabb	r3, r3, r5, lr
	add	r6, r2, #8388608
	movw	ip, #29863
	mov	r10, #8192
	asrs	r6, r6, #24
	ldrh	r0, [fp, #2]
	add	r2, r2, #4194304
	add	fp, fp, #6
	add	r9, r9, #6
	str	r3, [sp, #24]
	uxth	r3, r6
	smlabb	r6, r7, ip, r10
	str	r3, [sp, #16]
	smulbb	r0, r0, r1
	ldrh	r3, [fp]
	smlabb	r7, r7, r5, lr
	asrs	r2, r2, #23
	str	r6, [sp, #20]
	movw	r6, #30384
	smulbb	r6, r3, r6
	add	r1, r0, #4194304
	ldr	r3, [sp, #16]
	add	r0, r0, #8388608
	add	r1, r3, r1, asr #23
	ldr	r3, [sp, #20]
	add	r1, r1, r8, asr #24
	add	r8, r6, #8388608
	add	r6, r6, #4194304
	add	r1, r1, r3, asr #14
	ldr	r3, [sp, #24]
	add	r2, r2, r8, asr #24
	ldrh	r8, [fp, #2]
	add	r2, r2, r0, asr #24
	add	r3, r1, r3, asr #15
	add	r7, r2, r7, asr #15
	movw	r1, #30384
	sxth	r3, r3
	mov	r0, r1	@ movhi
	mov	r1, #8388608
	strh	r3, [r9, #-2]	@ movhi
	vmov	s15, r3	@ int
	smlabb	r2, r3, ip, r10
	vcvt.f32.s32	s14, s15
	smlabb	r8, r8, r0, r1
	ldr	r0, [sp, #16]
	smlabb	r5, r3, r5, lr
	mov	r1, r4
	add	r7, r7, r2, asr #14
	mov	r2, r3
	vmul.f32	s14, s14, s16
	sxth	r7, r7
	add	r8, r0, r8, asr #24
	strh	r7, [r9]	@ movhi
	smlabb	ip, r7, ip, r10
	add	r6, r8, r6, asr #23
	ldr	r8, [sp, #28]
	add	r5, r6, r5, asr #15
	adds	r7, r4, #1
	adds	r6, r4, #2
	mov	r0, r8
	add	r5, r5, ip, asr #14
	strh	r5, [r9, #2]	@ movhi
	str	r4, [sp]
	adds	r4, r4, #3
	vcvt.f64.f32	d7, s14
	vstr.64	d7, [sp, #8]
	bl	printf(PLT)
	ldrsh	r3, [r9]
	mov	r1, r7
	str	r7, [sp]
	mov	r0, r8
	vmov	s15, r3	@ int
	mov	r2, r3
	vcvt.f32.s32	s14, s15
	vmul.f32	s14, s14, s16
	vcvt.f64.f32	d7, s14
	vstr.64	d7, [sp, #8]
	bl	printf(PLT)
	ldrsh	r3, [r9, #2]
	mov	r1, r6
	str	r6, [sp]
	mov	r0, r8
	vmov	s15, r3	@ int
	mov	r2, r3
	vcvt.f32.s32	s14, s15
	vmul.f32	s14, s14, s16
	vcvt.f64.f32	d7, s14
	vstr.64	d7, [sp, #8]
	bl	printf(PLT)
	cmp	r4, #101
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
