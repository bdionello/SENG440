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
	.fpu neon
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 584
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r2, #256
	vpush.64	{d8, d9}
	movs	r4, #0
	ldr	r1, .L6+12
	movs	r5, #0
	movt	r5, 49136
	mov	fp, #2
.LPIC0:
	add	r1, pc
	vldr.32	s16, .L6+8
	sub	sp, sp, #604
	add	r0, sp, #88
	add	r7, sp, #344
	bl	memcpy(PLT)
	mov	r2, #49152
	ldr	r0, .L6+16
	movt	r2, 65535
	mov	r3, #-1073692672
	str	r3, [sp, #344]
	add	r3, sp, #92
	str	r3, [sp, #24]
	ldr	r3, .L6+20
	mov	r1, r2
.LPIC1:
	add	r0, pc
	strd	r4, [sp]
.LPIC3:
	add	r3, pc
	str	r3, [sp, #28]
	bl	printf(PLT)
	mov	r2, #49152
	ldr	r0, .L6+24
	movt	r2, 65535
	strd	r4, [sp]
	add	r8, sp, #40
.LPIC2:
	add	r0, pc
	mov	r1, r2
	vldr	d9, .L6
	add	r9, sp, #56
	add	r10, sp, #72
	bl	printf(PLT)
	str	fp, [sp, #20]
	mov	fp, r7
.L2:
	ldr	r1, [sp, #24]
	vmov.i32	q8, #8388608  @ v4si
	vmov.i32	q9, #4194304  @ v4si
	ldrsh	r6, [fp, #2]
	subs	r2, r1, #2
	subs	r3, r1, #4
	vmov	q11, q8  @ v4si
	ldr	r0, [sp, #20]
	vld1.16	{d20}, [r2]
	movw	r5, #29863
	vmlal.s16	q9, d9, d20
	ldrh	r2, [fp]
	vld1.16	{d20}, [r1]
	mov	lr, #8192
	vmlal.s16	q11, d9, d20
	movw	ip, #38103
	smlabb	r7, r6, r5, lr
	add	fp, fp, #8
	vshr.s32	q9, q9, #23
	vmov	q10, q11  @ v4si
	vld1.16	{d22}, [r3]
	vmlal.s16	q8, d9, d22
	mov	r3, #16384
	smlabb	r3, r2, ip, r3
	vshr.s32	q10, q10, #24
	mov	r2, #16384
	str	r0, [sp]
	smlabb	r4, r6, ip, r2
	vst1.32	{d18-d19}, [r9:64]
	add	r2, r1, #8
	vshr.s32	q8, q8, #24
	vst1.32	{d20-d21}, [r8:64]
	ldr	r6, [r9]
	mov	r1, r0
	str	r2, [sp, #24]
	ldr	r2, [r8]
	vst1.32	{d16-d17}, [r10:64]
	add	r2, r2, r6
	ldr	r6, [r10]
	ldr	r0, [r8, #8]
	add	r2, r2, r6
	ldr	r6, [r8, #4]
	add	r2, r2, r7, asr #14
	ldr	r7, [r9, #4]
	add	r3, r2, r3, asr #15
	ldr	r2, [r10, #4]
	add	r6, r6, r7
	sxth	r3, r3
	add	r6, r6, r2
	add	r6, r6, r4, asr #15
	mov	r2, #16384
	smlabb	r7, r3, r5, lr
	vmov	s15, r3	@ int
	smlabb	r4, r3, ip, r2
	vcvt.f32.s32	s15, s15
	ldr	r2, [r9, #8]
	strh	r3, [fp, #-4]	@ movhi
	add	r6, r6, r7, asr #14
	add	r0, r0, r2
	ldr	r7, [r10, #8]
	sxth	r6, r6
	mov	r2, r0
	add	r2, r2, r7
	ldr	r0, [r8, #12]
	vmul.f32	s15, s15, s16
	add	r4, r2, r4, asr #15
	smlabb	r7, r6, r5, lr
	mov	r2, #16384
	smlabb	ip, r6, ip, r2
	mov	r2, r3
	strh	r6, [fp, #-2]	@ movhi
	add	r4, r4, r7, asr #14
	ldr	r7, [r9, #12]
	sxth	r4, r4
	adds	r7, r0, r7
	ldr	r0, [r10, #12]
	smlabb	lr, r4, r5, lr
	vcvt.f64.f32	d16, s15
	add	r7, r7, r0
	adds	r5, r1, #1
	add	ip, r7, ip, asr #15
	str	r5, [sp, #36]
	adds	r5, r1, #2
	str	r5, [sp, #32]
	mov	r5, r1
	adds	r5, r5, #4
	str	r5, [sp, #20]
	add	r5, ip, lr, asr #14
	ldr	r0, [sp, #28]
	mov	r7, r1
	sxth	r5, r5
	strh	r4, [fp]	@ movhi
	vstr.64	d16, [sp, #8]
	adds	r7, r7, #3
	strh	r5, [fp, #2]	@ movhi
	bl	printf(PLT)
	mov	r3, r6
	mov	r2, r6
	vmov	s15, r6	@ int
	ldr	r1, [sp, #36]
	ldr	r6, [sp, #28]
	vcvt.f32.s32	s15, s15
	str	r1, [sp]
	mov	r0, r6
	vmul.f32	s15, s15, s16
	vcvt.f64.f32	d16, s15
	vstr.64	d16, [sp, #8]
	bl	printf(PLT)
	ldr	r1, [sp, #32]
	mov	r3, r4
	mov	r2, r4
	vmov	s15, r4	@ int
	mov	r0, r6
	str	r1, [sp]
	vcvt.f32.s32	s15, s15
	vmul.f32	s15, s15, s16
	vcvt.f64.f32	d16, s15
	vstr.64	d16, [sp, #8]
	bl	printf(PLT)
	mov	r3, r5
	mov	r2, r5
	str	r7, [sp]
	vmov	s15, r5	@ int
	mov	r1, r7
	mov	r0, r6
	vcvt.f32.s32	s15, s15
	vmul.f32	s15, s15, s16
	vcvt.f64.f32	d16, s15
	vstr.64	d16, [sp, #8]
	bl	printf(PLT)
	ldr	r5, [sp, #20]
	cmp	r5, #102
	bne	.L2
	add	sp, sp, #604
	@ sp needed
	vldm	sp!, {d8-d9}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L7:
	.align	3
.L6:
	.short	30384
	.short	30384
	.short	30384
	.short	30384
	.word	947912704
	.word	.LANCHOR0-(.LPIC0+4)
	.word	.LC1-(.LPIC1+4)
	.word	.LC3-(.LPIC3+4)
	.word	.LC2-(.LPIC2+4)
	.size	main, .-main
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.short	-32767
	.short	-32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.short	32767
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"Y[ 0] = %+6hi = 0x%04hX ....... y[ 0] = %8.5f\012\000"
	.space	1
.LC2:
	.ascii	"Y[ 1] = %+6hi = 0x%04hX ....... y[ 1] = %8.5f\012\000"
	.space	1
.LC3:
	.ascii	"Y[%2d] = %+6hi = 0x%04hX ....... y[%2d] = %8.5f\012"
	.ascii	"\000"
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
