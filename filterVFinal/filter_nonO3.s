	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"filter.c"
	.text
	.section	.rodata
	.align	2
.LC1:
	.ascii	"Y[ 0] = %+6hi = 0x%04hX ....... y[ 0] = %8.5f\012\000"
	.align	2
.LC2:
	.ascii	"Y[ 1] = %+6hi = 0x%04hX ....... y[ 1] = %8.5f\012\000"
	.align	2
.LC3:
	.ascii	"Y[%2d] = %+6hi = 0x%04hX ....... y[%2d] = %8.5f\012"
	.ascii	"\000"
	.align	2
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
	.text
	.align	1
	.global	main
	.arch armv7-a
	.syntax unified
	.thumb
	.thumb_func
	.fpu neon
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 808
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #828
	add	r7, sp, #16
	add	r3, r7, #308
	ldr	r2, .L20
.LPIC0:
	add	r2, pc
	mov	r0, r3
	mov	r1, r2
	mov	r3, #256
	mov	r2, r3
	bl	memcpy(PLT)
	add	r3, r7, #52
	mov	r2, #49152
	strh	r2, [r3]	@ movhi
	add	r3, r7, #52
	mov	r2, #49152
	strh	r2, [r3, #2]	@ movhi
	add	r3, r7, #52
	ldrsh	r3, [r3]
	mov	r1, r3
	add	r3, r7, #52
	ldrsh	r3, [r3]
	mov	r2, r3
	add	r3, r7, #52
	ldrsh	r3, [r3]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L20+12
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d16, s15
	vstr.64	d16, [sp]
	ldr	r3, .L20+4
.LPIC1:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	add	r3, r7, #52
	ldrsh	r3, [r3, #2]
	mov	r1, r3
	add	r3, r7, #52
	ldrsh	r3, [r3, #2]
	mov	r2, r3
	add	r3, r7, #52
	ldrsh	r3, [r3, #2]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L20+12
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d16, s15
	vstr.64	d16, [sp]
	ldr	r3, .L20+8
.LPIC2:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	movs	r4, #2
	b	.L2
.L21:
	.align	2
.L20:
	.word	.LC0-(.LPIC0+4)
	.word	.LC1-(.LPIC1+4)
	.word	.LC2-(.LPIC2+4)
	.word	1182793728
.L18:
	mov	r3, #8388608
	str	r3, [r7, #564]
	ldr	r3, [r7, #564]
	vdup.32	q8, r3
	movw	r3, #30384
	strh	r3, [r7, #570]	@ movhi
	ldrh	r3, [r7, #570]	@ movhi
	vdup.16	d19, r3
	add	r2, r7, #308
	lsls	r3, r4, #1
	add	r3, r3, r2
	str	r3, [r7, #572]
	ldr	r3, [r7, #572]
	vld1.16	{d18}, [r3]
	vstr	d16, [r7, #592]
	vstr	d17, [r7, #600]
	vstr	d19, [r7, #584]
	vstr	d18, [r7, #576]
	vldr	d16, [r7, #592]
	vldr	d17, [r7, #600]
	vldr	d18, [r7, #584]
	vldr	d19, [r7, #576]
	vmlal.s16	q8, d18, d19
	vstr	d16, [r7, #608]
	vstr	d17, [r7, #616]
	vldr	d16, [r7, #608]
	vldr	d17, [r7, #616]
	vshr.s32	q8, q8, #24
	add	r3, r7, #36
	str	r3, [r7, #640]
	vstr	d16, [r7, #624]
	vstr	d17, [r7, #632]
	ldr	r3, [r7, #640]
	vldr	d16, [r7, #624]
	vldr	d17, [r7, #632]
	vst1.32	{d16-d17}, [r3]
	mov	r3, #4194304
	str	r3, [r7, #644]
	ldr	r3, [r7, #644]
	vdup.32	q8, r3
	movw	r3, #30384
	strh	r3, [r7, #650]	@ movhi
	ldrh	r3, [r7, #650]	@ movhi
	vdup.16	d19, r3
	subs	r3, r4, #1
	add	r2, r7, #308
	lsls	r3, r3, #1
	add	r3, r3, r2
	str	r3, [r7, #652]
	ldr	r3, [r7, #652]
	vld1.16	{d18}, [r3]
	vstr	d16, [r7, #672]
	vstr	d17, [r7, #680]
	vstr	d19, [r7, #664]
	vstr	d18, [r7, #656]
	vldr	d16, [r7, #672]
	vldr	d17, [r7, #680]
	vldr	d18, [r7, #664]
	vldr	d19, [r7, #656]
	vmlal.s16	q8, d18, d19
	vstr	d16, [r7, #688]
	vstr	d17, [r7, #696]
	vldr	d16, [r7, #688]
	vldr	d17, [r7, #696]
	vshr.s32	q8, q8, #23
	add	r3, r7, #20
	str	r3, [r7, #720]
	vstr	d16, [r7, #704]
	vstr	d17, [r7, #712]
	ldr	r3, [r7, #720]
	vldr	d16, [r7, #704]
	vldr	d17, [r7, #712]
	vst1.32	{d16-d17}, [r3]
	mov	r3, #8388608
	str	r3, [r7, #724]
	ldr	r3, [r7, #724]
	vdup.32	q8, r3
	movw	r3, #30384
	strh	r3, [r7, #730]	@ movhi
	ldrh	r3, [r7, #730]	@ movhi
	vdup.16	d19, r3
	subs	r3, r4, #2
	add	r2, r7, #308
	lsls	r3, r3, #1
	add	r3, r3, r2
	str	r3, [r7, #732]
	ldr	r3, [r7, #732]
	vld1.16	{d18}, [r3]
	vstr	d16, [r7, #752]
	vstr	d17, [r7, #760]
	vstr	d19, [r7, #744]
	vstr	d18, [r7, #736]
	vldr	d16, [r7, #752]
	vldr	d17, [r7, #760]
	vldr	d18, [r7, #744]
	vldr	d19, [r7, #736]
	vmlal.s16	q8, d18, d19
	vstr	d16, [r7, #768]
	vstr	d17, [r7, #776]
	vldr	d16, [r7, #768]
	vldr	d17, [r7, #776]
	vshr.s32	q8, q8, #24
	adds	r3, r7, #4
	str	r3, [r7, #804]
	vstr	d16, [r7, #784]
	vstr	d17, [r7, #792]
	ldr	r3, [r7, #804]
	vldr	d16, [r7, #784]
	vldr	d17, [r7, #792]
	vst1.32	{d16-d17}, [r3]
	add	r3, r7, #36
	ldr	r3, [r3]
	uxth	r2, r3
	add	r3, r7, #20
	ldr	r3, [r3]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	adds	r3, r7, #4
	ldr	r3, [r3]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	subs	r1, r4, #1
	add	r3, r7, #52
	ldrsh	r3, [r3, r1, lsl #1]
	mov	r1, r3
	movw	r3, #29863
	mul	r3, r3, r1
	add	r3, r3, #8192
	asrs	r3, r3, #14
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	subs	r1, r4, #2
	add	r3, r7, #52
	ldrsh	r3, [r3, r1, lsl #1]
	mov	r1, r3
	movw	r3, #38103
	movt	r3, 65535
	mul	r3, r3, r1
	add	r3, r3, #16384
	asrs	r3, r3, #15
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r3, r3
	sxth	r2, r3
	add	r3, r7, #52
	strh	r2, [r3, r4, lsl #1]	@ movhi
	add	r3, r7, #36
	ldr	r3, [r3, #4]
	uxth	r2, r3
	add	r3, r7, #20
	ldr	r3, [r3, #4]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	adds	r3, r7, #4
	ldr	r3, [r3, #4]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	add	r3, r7, #52
	ldrsh	r3, [r3, r4, lsl #1]
	mov	r1, r3
	movw	r3, #29863
	mul	r3, r3, r1
	add	r3, r3, #8192
	asrs	r3, r3, #14
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	subs	r1, r4, #1
	add	r3, r7, #52
	ldrsh	r3, [r3, r1, lsl #1]
	mov	r1, r3
	movw	r3, #38103
	movt	r3, 65535
	mul	r3, r3, r1
	add	r3, r3, #16384
	asrs	r3, r3, #15
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r3, r3
	adds	r2, r4, #1
	sxth	r1, r3
	add	r3, r7, #52
	strh	r1, [r3, r2, lsl #1]	@ movhi
	add	r3, r7, #36
	ldr	r3, [r3, #8]
	uxth	r2, r3
	add	r3, r7, #20
	ldr	r3, [r3, #8]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	adds	r3, r7, #4
	ldr	r3, [r3, #8]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	adds	r1, r4, #1
	add	r3, r7, #52
	ldrsh	r3, [r3, r1, lsl #1]
	mov	r1, r3
	movw	r3, #29863
	mul	r3, r3, r1
	add	r3, r3, #8192
	asrs	r3, r3, #14
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	add	r3, r7, #52
	ldrsh	r3, [r3, r4, lsl #1]
	mov	r1, r3
	movw	r3, #38103
	movt	r3, 65535
	mul	r3, r3, r1
	add	r3, r3, #16384
	asrs	r3, r3, #15
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r3, r3
	adds	r2, r4, #2
	sxth	r1, r3
	add	r3, r7, #52
	strh	r1, [r3, r2, lsl #1]	@ movhi
	add	r3, r7, #36
	ldr	r3, [r3, #12]
	uxth	r2, r3
	add	r3, r7, #20
	ldr	r3, [r3, #12]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	adds	r3, r7, #4
	ldr	r3, [r3, #12]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	adds	r1, r4, #2
	add	r3, r7, #52
	ldrsh	r3, [r3, r1, lsl #1]
	mov	r1, r3
	movw	r3, #29863
	mul	r3, r3, r1
	add	r3, r3, #8192
	asrs	r3, r3, #14
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	adds	r1, r4, #1
	add	r3, r7, #52
	ldrsh	r3, [r3, r1, lsl #1]
	mov	r1, r3
	movw	r3, #38103
	movt	r3, 65535
	mul	r3, r3, r1
	add	r3, r3, #16384
	asrs	r3, r3, #15
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r3, r3
	adds	r2, r4, #3
	sxth	r1, r3
	add	r3, r7, #52
	strh	r1, [r3, r2, lsl #1]	@ movhi
	add	r3, r7, #52
	ldrsh	r3, [r3, r4, lsl #1]
	mov	r2, r3
	add	r3, r7, #52
	ldrsh	r3, [r3, r4, lsl #1]
	mov	r1, r3
	add	r3, r7, #52
	ldrsh	r3, [r3, r4, lsl #1]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L20+12
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d16, s15
	vstr.64	d16, [sp, #8]
	str	r4, [sp]
	mov	r3, r1
	mov	r1, r4
	ldr	r0, .L22+4
.LPIC3:
	add	r0, pc
	bl	printf(PLT)
	adds	r0, r4, #1
	adds	r2, r4, #1
	add	r3, r7, #52
	ldrsh	r3, [r3, r2, lsl #1]
	mov	r5, r3
	adds	r2, r4, #1
	add	r3, r7, #52
	ldrsh	r3, [r3, r2, lsl #1]
	mov	r6, r3
	adds	r3, r4, #1
	adds	r1, r4, #1
	add	r2, r7, #52
	ldrsh	r2, [r2, r1, lsl #1]
	vmov	s15, r2	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L22
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d16, s15
	vstr.64	d16, [sp, #8]
	str	r3, [sp]
	mov	r3, r6
	mov	r2, r5
	mov	r1, r0
	ldr	r0, .L22+8
.LPIC4:
	add	r0, pc
	bl	printf(PLT)
	adds	r0, r4, #2
	adds	r2, r4, #2
	add	r3, r7, #52
	ldrsh	r3, [r3, r2, lsl #1]
	mov	r5, r3
	adds	r2, r4, #2
	add	r3, r7, #52
	ldrsh	r3, [r3, r2, lsl #1]
	mov	r6, r3
	adds	r3, r4, #2
	adds	r1, r4, #2
	add	r2, r7, #52
	ldrsh	r2, [r2, r1, lsl #1]
	vmov	s15, r2	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L22
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d16, s15
	vstr.64	d16, [sp, #8]
	str	r3, [sp]
	mov	r3, r6
	mov	r2, r5
	mov	r1, r0
	ldr	r0, .L22+12
.LPIC5:
	add	r0, pc
	bl	printf(PLT)
	adds	r0, r4, #3
	adds	r2, r4, #3
	add	r3, r7, #52
	ldrsh	r3, [r3, r2, lsl #1]
	mov	r5, r3
	adds	r2, r4, #3
	add	r3, r7, #52
	ldrsh	r3, [r3, r2, lsl #1]
	mov	r6, r3
	adds	r3, r4, #3
	adds	r1, r4, #3
	add	r2, r7, #52
	ldrsh	r2, [r2, r1, lsl #1]
	vmov	s15, r2	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L22
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d16, s15
	vstr.64	d16, [sp, #8]
	str	r3, [sp]
	mov	r3, r6
	mov	r2, r5
	mov	r1, r0
	ldr	r0, .L22+16
.LPIC6:
	add	r0, pc
	bl	printf(PLT)
	adds	r4, r4, #4
.L2:
	cmp	r4, #101
	ble	.L18
	nop
	add	r7, r7, #812
	mov	sp, r7
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L23:
	.align	2
.L22:
	.word	1182793728
	.word	.LC3-(.LPIC3+4)
	.word	.LC3-(.LPIC4+4)
	.word	.LC3-(.LPIC5+4)
	.word	.LC3-(.LPIC6+4)
	.size	main, .-main
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
