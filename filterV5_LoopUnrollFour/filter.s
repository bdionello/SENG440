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
	mov	r7, r3
	str	r4, [r3], #4	@ unaligned
.L2:
	str	r1, [r3], #4	@ unaligned
	cmp	r3, r2
	bne	.L2
	ldr	r3, .L8+12
	mov	r2, #49152
	movt	r2, 65535
	mov	r10, #0
	mov	fp, #0
	mov	r5, #-1073692672
	ldr	r4, [r0, r3]
	mov	r1, r2
	ldr	r0, .L8+16
	movt	fp, 49136
	ldr	r3, .L8+20
	str	r5, [r4]	@ unaligned
.LPIC1:
	add	r0, pc
	strd	r10, [sp]
.LPIC3:
	add	r3, pc
	str	r3, [sp, #24]
	bl	printf(PLT)
	ldrsh	r2, [r4, #2]
	mov	fp, #2
	vldr.32	s17, .L8
	mov	r9, r4
	ldr	r0, .L8+24
	mov	r4, fp
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
	str	r7, [sp, #20]
.L3:
	ldr	r3, [sp, #20]
	movw	r5, #30384
	ldrsh	r6, [r9, #2]
	mov	r0, #8388608
	ldrh	r10, [r9]
	movw	ip, #29863
	ldrh	r2, [r3, #4]
	mov	lr, #16384
	ldrh	r1, [r3, #2]
	add	r9, r9, #8
	ldrh	r3, [r3]
	smulbb	r2, r2, r5
	smulbb	r1, r1, r5
	add	fp, r2, #8388608
	add	r2, r2, #4194304
	smlabb	r8, r3, r5, r0
	asr	fp, fp, #24
	movw	r0, #38103
	asrs	r2, r2, #23
	uxth	r3, fp
	mov	fp, #8192
	smlabb	fp, r6, ip, fp
	mov	r7, r3
	smlabb	r10, r10, r0, lr
	add	r3, r1, #4194304
	str	r7, [sp, #28]
	add	r1, r1, #8388608
	add	r3, r7, r3, asr #23
	ldr	r7, [sp, #20]
	add	r3, r3, r8, asr #24
	add	r3, r3, fp, asr #14
	mov	fp, #8192
	add	r3, r3, r10, asr #15
	ldrh	r8, [r7, #6]
	mov	r10, #0	@ movhi
	strh	r10, [r9, #2]	@ movhi
	sxth	r3, r3
	strh	r3, [r9, #-4]	@ movhi
	smulbb	r8, r8, r5
	vmov	s15, r3	@ int
	smlabb	r6, r6, r0, lr
	vcvt.f32.s32	s14, s15
	add	r10, r8, #8388608
	add	r8, r8, #4194304
	smlabb	r7, r3, ip, fp
	add	r2, r2, r10, asr #24
	add	r1, r2, r1, asr #24
	ldr	r2, [sp, #20]
	add	r6, r1, r6, asr #15
	mov	r1, #8388608
	smlabb	lr, r3, r0, lr
	vmul.f32	s14, s14, s16
	ldrh	fp, [r2, #8]!
	add	r6, r6, r7, asr #14
	mov	r0, #8192
	ldr	r7, [sp, #28]
	sxth	r6, r6
	strh	r6, [r9, #-2]	@ movhi
	smlabb	fp, fp, r5, r1
	str	r2, [sp, #20]
	smlabb	ip, r6, ip, r0
	mov	r2, r3
	mov	r1, r4
	ldr	r0, [sp, #24]
	add	r10, r4, #1
	adds	r5, r4, #2
	add	fp, r7, fp, asr #24
	adds	r6, r4, #3
	add	fp, fp, r8, asr #23
	vcvt.f64.f32	d7, s14
	add	lr, fp, lr, asr #15
	add	ip, lr, ip, asr #14
	strh	ip, [r9]	@ movhi
	str	r4, [sp]
	adds	r4, r4, #4
	vstr.64	d7, [sp, #8]
	bl	printf(PLT)
	ldrsh	r3, [r9, #-2]
	ldr	r7, [sp, #24]
	mov	r1, r10
	str	r10, [sp]
	vmov	s15, r3	@ int
	mov	r2, r3
	mov	r0, r7
	vcvt.f32.s32	s14, s15
	vmul.f32	s14, s14, s16
	vcvt.f64.f32	d7, s14
	vstr.64	d7, [sp, #8]
	bl	printf(PLT)
	ldrsh	r3, [r9]
	mov	r1, r5
	str	r5, [sp]
	mov	r0, r7
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
	mov	r0, r7
	vmov	s15, r3	@ int
	mov	r2, r3
	vcvt.f32.s32	s14, s15
	vmul.f32	s14, s14, s16
	vcvt.f64.f32	d7, s14
	vstr.64	d7, [sp, #8]
	bl	printf(PLT)
	cmp	r4, #102
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
