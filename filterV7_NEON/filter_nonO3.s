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
	.global	X
	.data
	.align	2
	.type	X, %object
	.size	X, 256
X:
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
	.comm	Y,256,4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Y[ 0] = %+6hi = 0x%04hX ....... y[ 0] = %8.5f\012\000"
	.align	2
.LC1:
	.ascii	"Y[ 1] = %+6hi = 0x%04hX ....... y[ 1] = %8.5f\012\000"
	.align	2
.LC2:
	.ascii	"Y[%2d] = %+6hi = 0x%04hX ....... y[%2d] = %8.5f\012"
	.ascii	"\000"
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
	@ args = 0, pretend = 0, frame = 440
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #460
	add	r7, sp, #16
	ldr	r5, .L19+4
.LPIC0:
	add	r5, pc
	ldr	r3, .L19+8
	ldr	r3, [r5, r3]
	mov	r2, #49152
	strh	r2, [r3]	@ movhi
	ldr	r3, .L19+8
	ldr	r3, [r5, r3]
	mov	r2, #49152
	strh	r2, [r3, #2]	@ movhi
	ldr	r3, .L19+8
	ldr	r3, [r5, r3]
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, .L19+8
	ldr	r3, [r5, r3]
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r3, .L19+8
	ldr	r3, [r5, r3]
	ldrsh	r3, [r3]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L19
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d16, s15
	vstr.64	d16, [sp]
	ldr	r3, .L19+12
.LPIC1:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	ldr	r3, .L19+8
	ldr	r3, [r5, r3]
	ldrsh	r3, [r3, #2]
	mov	r1, r3
	ldr	r3, .L19+8
	ldr	r3, [r5, r3]
	ldrsh	r3, [r3, #2]
	mov	r2, r3
	ldr	r3, .L19+8
	ldr	r3, [r5, r3]
	ldrsh	r3, [r3, #2]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L19
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d16, s15
	vstr.64	d16, [sp]
	ldr	r3, .L19+16
.LPIC2:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	movw	r3, #30384
	strh	r3, [r7, #298]	@ movhi
	ldrh	r3, [r7, #298]	@ movhi
	vdup.16	d16, r3
	vstr	d16, [r7, #432]
	movw	r3, #30384
	strh	r3, [r7, #300]	@ movhi
	ldrh	r3, [r7, #300]	@ movhi
	vdup.16	d16, r3
	vstr	d16, [r7, #424]
	movw	r3, #30384
	strh	r3, [r7, #302]	@ movhi
	ldrh	r3, [r7, #302]	@ movhi
	vdup.16	d16, r3
	vstr	d16, [r7, #416]
	movw	r3, #29863
	strh	r3, [r7, #414]	@ movhi
	movw	r3, #38103
	strh	r3, [r7, #412]	@ movhi
	movs	r4, #2
	b	.L5
.L20:
	.align	2
.L19:
	.word	1182793728
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+4)
	.word	Y(GOT)
	.word	.LC0-(.LPIC1+4)
	.word	.LC1-(.LPIC2+4)
.L18:
	lsls	r3, r4, #1
	ldr	r2, .L21+4
.LPIC3:
	add	r2, pc
	add	r2, r2, r3
	add	r3, r7, #48
	str	r2, [r3]
	add	r3, r7, #48
	ldr	r3, [r3]
	vld1.16	{d16}, [r3]
	vstr	d16, [r7, #400]
	subs	r3, r4, #1
	lsls	r3, r3, #1
	ldr	r2, .L21+8
.LPIC4:
	add	r2, pc
	add	r2, r2, r3
	add	r3, r7, #52
	str	r2, [r3]
	add	r3, r7, #52
	ldr	r3, [r3]
	vld1.16	{d16}, [r3]
	vstr	d16, [r7, #392]
	subs	r3, r4, #2
	lsls	r3, r3, #1
	ldr	r2, .L21+12
.LPIC5:
	add	r2, pc
	add	r2, r2, r3
	add	r3, r7, #56
	str	r2, [r3]
	add	r3, r7, #56
	ldr	r3, [r3]
	vld1.16	{d16}, [r3]
	vstr	d16, [r7, #384]
	add	r3, r7, #60
	mov	r2, #8388608
	str	r2, [r3]
	add	r3, r7, #60
	ldr	r3, [r3]
	vdup.32	q8, r3
	vstr	d16, [r7, #80]
	vstr	d17, [r7, #88]
	vldr	d16, [r7, #432]
	vstr	d16, [r7, #72]
	vldr	d16, [r7, #400]
	vstr	d16, [r7, #64]
	vldr	d16, [r7, #80]
	vldr	d17, [r7, #88]
	vldr	d18, [r7, #72]
	vldr	d19, [r7, #64]
	vmlal.s16	q8, d18, d19
	vstr	d16, [r7, #96]
	vstr	d17, [r7, #104]
	vldr	d16, [r7, #96]
	vldr	d17, [r7, #104]
	vshr.s32	q8, q8, #24
	vstr	d16, [r7, #368]
	vstr	d17, [r7, #376]
	add	r3, r7, #116
	mov	r2, #4194304
	str	r2, [r3]
	add	r3, r7, #116
	ldr	r3, [r3]
	vdup.32	q8, r3
	vstr	d16, [r7, #136]
	vstr	d17, [r7, #144]
	vldr	d16, [r7, #424]
	vstr	d16, [r7, #128]
	vldr	d16, [r7, #392]
	vstr	d16, [r7, #120]
	vldr	d16, [r7, #136]
	vldr	d17, [r7, #144]
	vldr	d18, [r7, #128]
	vldr	d19, [r7, #120]
	vmlal.s16	q8, d18, d19
	vstr	d16, [r7, #152]
	vstr	d17, [r7, #160]
	vldr	d16, [r7, #152]
	vldr	d17, [r7, #160]
	vshr.s32	q8, q8, #23
	vstr	d16, [r7, #352]
	vstr	d17, [r7, #360]
	add	r3, r7, #172
	mov	r2, #8388608
	str	r2, [r3]
	add	r3, r7, #172
	ldr	r3, [r3]
	vdup.32	q8, r3
	vstr	d16, [r7, #192]
	vstr	d17, [r7, #200]
	vldr	d16, [r7, #416]
	vstr	d16, [r7, #184]
	vldr	d16, [r7, #384]
	vstr	d16, [r7, #176]
	vldr	d16, [r7, #192]
	vldr	d17, [r7, #200]
	vldr	d18, [r7, #184]
	vldr	d19, [r7, #176]
	vmlal.s16	q8, d18, d19
	vstr	d16, [r7, #208]
	vstr	d17, [r7, #216]
	vldr	d16, [r7, #208]
	vldr	d17, [r7, #216]
	vshr.s32	q8, q8, #24
	vstr	d16, [r7, #336]
	vstr	d17, [r7, #344]
	add	r3, r7, #32
	str	r3, [r7, #244]
	vldr	d16, [r7, #368]
	vldr	d17, [r7, #376]
	vstr	d16, [r7, #224]
	vstr	d17, [r7, #232]
	ldr	r3, [r7, #244]
	vldr	d16, [r7, #224]
	vldr	d17, [r7, #232]
	vst1.32	{d16-d17}, [r3]
	add	r3, r7, #16
	str	r3, [r7, #268]
	vldr	d16, [r7, #352]
	vldr	d17, [r7, #360]
	vstr	d16, [r7, #248]
	vstr	d17, [r7, #256]
	ldr	r3, [r7, #268]
	vldr	d16, [r7, #248]
	vldr	d17, [r7, #256]
	vst1.32	{d16-d17}, [r3]
	mov	r3, r7
	str	r3, [r7, #292]
	vldr	d16, [r7, #336]
	vldr	d17, [r7, #344]
	vstr	d16, [r7, #272]
	vstr	d17, [r7, #280]
	ldr	r3, [r7, #292]
	vldr	d16, [r7, #272]
	vldr	d17, [r7, #280]
	vst1.32	{d16-d17}, [r3]
	ldrsh	r3, [r7, #412]
	subs	r2, r4, #2
	ldr	r1, .L21+16
	ldr	r1, [r5, r1]
	ldrsh	r2, [r1, r2, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #16384
	asrs	r3, r3, #15
	str	r3, [r7, #332]
	ldrsh	r3, [r7, #414]
	subs	r2, r4, #1
	ldr	r1, .L21+16
	ldr	r1, [r5, r1]
	ldrsh	r2, [r1, r2, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #8192
	asrs	r3, r3, #14
	str	r3, [r7, #328]
	add	r3, r7, #32
	ldr	r3, [r3]
	uxth	r2, r3
	add	r3, r7, #16
	ldr	r3, [r3]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	mov	r3, r7
	ldr	r3, [r3]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #328]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #332]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r3, r3
	sxth	r2, r3
	ldr	r3, .L21+16
	ldr	r3, [r5, r3]
	strh	r2, [r3, r4, lsl #1]	@ movhi
	ldrsh	r3, [r7, #412]
	subs	r2, r4, #1
	ldr	r1, .L21+16
	ldr	r1, [r5, r1]
	ldrsh	r2, [r1, r2, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #16384
	asrs	r3, r3, #15
	str	r3, [r7, #324]
	ldrsh	r3, [r7, #414]
	ldr	r2, .L21+16
	ldr	r2, [r5, r2]
	ldrsh	r2, [r2, r4, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #8192
	asrs	r3, r3, #14
	str	r3, [r7, #320]
	add	r3, r7, #32
	ldr	r3, [r3, #4]
	uxth	r2, r3
	add	r3, r7, #16
	ldr	r3, [r3, #4]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	mov	r3, r7
	ldr	r3, [r3, #4]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #320]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #324]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	adds	r3, r4, #1
	sxth	r1, r2
	ldr	r2, .L21+16
	ldr	r2, [r5, r2]
	strh	r1, [r2, r3, lsl #1]	@ movhi
	ldrsh	r3, [r7, #412]
	ldr	r2, .L21+16
	ldr	r2, [r5, r2]
	ldrsh	r2, [r2, r4, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #16384
	asrs	r3, r3, #15
	str	r3, [r7, #316]
	ldrsh	r3, [r7, #414]
	adds	r2, r4, #1
	ldr	r1, .L21+16
	ldr	r1, [r5, r1]
	ldrsh	r2, [r1, r2, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #8192
	asrs	r3, r3, #14
	str	r3, [r7, #312]
	add	r3, r7, #32
	ldr	r3, [r3, #8]
	uxth	r2, r3
	add	r3, r7, #16
	ldr	r3, [r3, #8]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	mov	r3, r7
	ldr	r3, [r3, #8]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #312]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #316]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	adds	r3, r4, #2
	sxth	r1, r2
	ldr	r2, .L21+16
	ldr	r2, [r5, r2]
	strh	r1, [r2, r3, lsl #1]	@ movhi
	ldrsh	r3, [r7, #412]
	adds	r2, r4, #1
	ldr	r1, .L21+16
	ldr	r1, [r5, r1]
	ldrsh	r2, [r1, r2, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #16384
	asrs	r3, r3, #15
	str	r3, [r7, #308]
	ldrsh	r3, [r7, #414]
	adds	r2, r4, #2
	ldr	r1, .L21+16
	ldr	r1, [r5, r1]
	ldrsh	r2, [r1, r2, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #8192
	asrs	r3, r3, #14
	str	r3, [r7, #304]
	add	r3, r7, #32
	ldr	r3, [r3, #12]
	uxth	r2, r3
	add	r3, r7, #16
	ldr	r3, [r3, #12]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	mov	r3, r7
	ldr	r3, [r3, #12]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #304]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #308]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	adds	r3, r4, #3
	sxth	r1, r2
	ldr	r2, .L21+16
	ldr	r2, [r5, r2]
	strh	r1, [r2, r3, lsl #1]	@ movhi
	ldr	r3, .L21+16
	ldr	r3, [r5, r3]
	ldrsh	r3, [r3, r4, lsl #1]
	mov	r2, r3
	ldr	r3, .L21+16
	ldr	r3, [r5, r3]
	ldrsh	r3, [r3, r4, lsl #1]
	mov	r1, r3
	ldr	r3, .L21+16
	ldr	r3, [r5, r3]
	ldrsh	r3, [r3, r4, lsl #1]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L21
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d16, s15
	vstr.64	d16, [sp, #8]
	str	r4, [sp]
	mov	r3, r1
	mov	r1, r4
	ldr	r0, .L21+20
.LPIC6:
	add	r0, pc
	bl	printf(PLT)
	adds	r0, r4, #1
	adds	r3, r4, #1
	ldr	r2, .L21+16
	ldr	r2, [r5, r2]
	ldrsh	r3, [r2, r3, lsl #1]
	mov	r6, r3
	adds	r3, r4, #1
	ldr	r2, .L21+16
	ldr	r2, [r5, r2]
	ldrsh	r3, [r2, r3, lsl #1]
	mov	ip, r3
	adds	r3, r4, #1
	adds	r2, r4, #1
	ldr	r1, .L21+16
	ldr	r1, [r5, r1]
	ldrsh	r2, [r1, r2, lsl #1]
	vmov	s15, r2	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L21
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d16, s15
	vstr.64	d16, [sp, #8]
	str	r3, [sp]
	mov	r3, ip
	mov	r2, r6
	mov	r1, r0
	ldr	r0, .L21+24
.LPIC7:
	add	r0, pc
	bl	printf(PLT)
	adds	r0, r4, #2
	adds	r3, r4, #2
	ldr	r2, .L21+16
	ldr	r2, [r5, r2]
	ldrsh	r3, [r2, r3, lsl #1]
	mov	r6, r3
	adds	r3, r4, #2
	ldr	r2, .L21+16
	ldr	r2, [r5, r2]
	ldrsh	r3, [r2, r3, lsl #1]
	mov	ip, r3
	adds	r3, r4, #2
	adds	r2, r4, #2
	ldr	r1, .L21+16
	ldr	r1, [r5, r1]
	ldrsh	r2, [r1, r2, lsl #1]
	vmov	s15, r2	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L21
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d16, s15
	vstr.64	d16, [sp, #8]
	str	r3, [sp]
	mov	r3, ip
	mov	r2, r6
	mov	r1, r0
	ldr	r0, .L21+28
.LPIC8:
	add	r0, pc
	bl	printf(PLT)
	adds	r0, r4, #3
	adds	r3, r4, #3
	ldr	r2, .L21+16
	ldr	r2, [r5, r2]
	ldrsh	r3, [r2, r3, lsl #1]
	mov	r6, r3
	adds	r3, r4, #3
	ldr	r2, .L21+16
	ldr	r2, [r5, r2]
	ldrsh	r3, [r2, r3, lsl #1]
	mov	ip, r3
	adds	r3, r4, #3
	adds	r2, r4, #3
	ldr	r1, .L21+16
	ldr	r1, [r5, r1]
	ldrsh	r2, [r1, r2, lsl #1]
	vmov	s15, r2	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L21
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d16, s15
	vstr.64	d16, [sp, #8]
	str	r3, [sp]
	mov	r3, ip
	mov	r2, r6
	mov	r1, r0
	ldr	r0, .L21+32
.LPIC9:
	add	r0, pc
	bl	printf(PLT)
	adds	r4, r4, #4
.L5:
	cmp	r4, #101
	ble	.L18
	nop
	add	r7, r7, #444
	mov	sp, r7
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L22:
	.align	2
.L21:
	.word	1182793728
	.word	X-(.LPIC3+4)
	.word	X-(.LPIC4+4)
	.word	X-(.LPIC5+4)
	.word	Y(GOT)
	.word	.LC2-(.LPIC6+4)
	.word	.LC2-(.LPIC7+4)
	.word	.LC2-(.LPIC8+4)
	.word	.LC2-(.LPIC9+4)
	.size	main, .-main
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
