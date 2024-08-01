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
	.comm	X,256,4
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
	@ args = 0, pretend = 0, frame = 648
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #668
	add	r7, sp, #16
	ldr	r4, .L32+4
.LPIC0:
	add	r4, pc
	movw	r3, #30384
	vdup.16	d16, r3
	vstr	d16, [r7, #632]
	movw	r3, #30384
	vdup.16	d16, r3
	vstr	d16, [r7, #624]
	movw	r3, #30384
	vdup.16	d16, r3
	vstr	d16, [r7, #616]
	movw	r3, #29863
	vdup.16	d16, r3
	vstr	d16, [r7, #608]
	movw	r3, #38103
	vdup.16	d16, r3
	vstr	d16, [r7, #600]
	ldr	r3, .L32+8
	ldr	r3, [r4, r3]
	mov	r1, r3
	ldr	r3, .L32+12
	ldr	r3, [r4, r3]
	mov	r0, r3
	bl	filter_init(PLT)
	ldr	r3, .L32+8
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, .L32+8
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r3, .L32+8
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L32
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d16, s15
	vstr.64	d16, [sp]
	ldr	r3, .L32+16
.LPIC1:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	ldr	r3, .L32+8
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3, #2]
	mov	r1, r3
	ldr	r3, .L32+8
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3, #2]
	mov	r2, r3
	ldr	r3, .L32+8
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3, #2]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L32
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d16, s15
	vstr.64	d16, [sp]
	ldr	r3, .L32+20
.LPIC2:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	movs	r3, #2
	str	r3, [r7, #644]
	b	.L2
.L33:
	.align	2
.L32:
	.word	1182793728
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+4)
	.word	Y(GOT)
	.word	X(GOT)
	.word	.LC0-(.LPIC1+4)
	.word	.LC1-(.LPIC2+4)
.L31:
	ldr	r3, [r7, #644]
	lsls	r3, r3, #1
	ldr	r2, .L34+4
	ldr	r2, [r4, r2]
	add	r2, r2, r3
	mov	r3, r7
	str	r2, [r3]
	mov	r3, r7
	ldr	r3, [r3]
	vld1.16	{d16}, [r3]
	vstr	d16, [r7, #592]
	ldr	r3, [r7, #644]
	subs	r3, r3, #1
	lsls	r3, r3, #1
	ldr	r2, .L34+4
	ldr	r2, [r4, r2]
	add	r2, r2, r3
	adds	r3, r7, #4
	str	r2, [r3]
	adds	r3, r7, #4
	ldr	r3, [r3]
	vld1.16	{d16}, [r3]
	vstr	d16, [r7, #584]
	ldr	r3, [r7, #644]
	subs	r3, r3, #2
	lsls	r3, r3, #1
	ldr	r2, .L34+4
	ldr	r2, [r4, r2]
	add	r2, r2, r3
	add	r3, r7, #8
	str	r2, [r3]
	add	r3, r7, #8
	ldr	r3, [r3]
	vld1.16	{d16}, [r3]
	vstr	d16, [r7, #576]
	ldr	r3, [r7, #644]
	subs	r3, r3, #1
	lsls	r3, r3, #1
	ldr	r2, .L34+8
	ldr	r2, [r4, r2]
	add	r2, r2, r3
	add	r3, r7, #12
	str	r2, [r3]
	add	r3, r7, #12
	ldr	r3, [r3]
	vld1.16	{d16}, [r3]
	vstr	d16, [r7, #568]
	ldr	r3, [r7, #644]
	subs	r3, r3, #2
	lsls	r3, r3, #1
	ldr	r2, .L34+8
	ldr	r2, [r4, r2]
	add	r2, r2, r3
	add	r3, r7, #16
	str	r2, [r3]
	add	r3, r7, #16
	ldr	r3, [r3]
	vld1.16	{d16}, [r3]
	vstr	d16, [r7, #560]
	add	r3, r7, #20
	mov	r2, #8388608
	str	r2, [r3]
	add	r3, r7, #20
	ldr	r3, [r3]
	vdup.32	q8, r3
	vstr	d16, [r7, #40]
	vstr	d17, [r7, #48]
	vldr	d16, [r7, #632]
	vstr	d16, [r7, #32]
	vldr	d16, [r7, #592]
	vstr	d16, [r7, #24]
	vldr	d16, [r7, #40]
	vldr	d17, [r7, #48]
	vldr	d18, [r7, #32]
	vldr	d19, [r7, #24]
	vmlal.s16	q8, d18, d19
	vstr	d16, [r7, #56]
	vstr	d17, [r7, #64]
	vldr	d16, [r7, #56]
	vldr	d17, [r7, #64]
	vshr.s32	q8, q8, #24
	vstr	d16, [r7, #544]
	vstr	d17, [r7, #552]
	add	r3, r7, #76
	mov	r2, #4194304
	str	r2, [r3]
	add	r3, r7, #76
	ldr	r3, [r3]
	vdup.32	q8, r3
	vstr	d16, [r7, #96]
	vstr	d17, [r7, #104]
	vldr	d16, [r7, #624]
	vstr	d16, [r7, #88]
	vldr	d16, [r7, #584]
	vstr	d16, [r7, #80]
	vldr	d16, [r7, #96]
	vldr	d17, [r7, #104]
	vldr	d18, [r7, #88]
	vldr	d19, [r7, #80]
	vmlal.s16	q8, d18, d19
	vstr	d16, [r7, #112]
	vstr	d17, [r7, #120]
	vldr	d16, [r7, #112]
	vldr	d17, [r7, #120]
	vshr.s32	q8, q8, #23
	vstr	d16, [r7, #528]
	vstr	d17, [r7, #536]
	add	r3, r7, #132
	mov	r2, #8388608
	str	r2, [r3]
	add	r3, r7, #132
	ldr	r3, [r3]
	vdup.32	q8, r3
	vstr	d16, [r7, #152]
	vstr	d17, [r7, #160]
	vldr	d16, [r7, #616]
	vstr	d16, [r7, #144]
	vldr	d16, [r7, #576]
	vstr	d16, [r7, #136]
	vldr	d16, [r7, #152]
	vldr	d17, [r7, #160]
	vldr	d18, [r7, #144]
	vldr	d19, [r7, #136]
	vmlal.s16	q8, d18, d19
	vstr	d16, [r7, #168]
	vstr	d17, [r7, #176]
	vldr	d16, [r7, #168]
	vldr	d17, [r7, #176]
	vshr.s32	q8, q8, #24
	vstr	d16, [r7, #512]
	vstr	d17, [r7, #520]
	add	r3, r7, #188
	mov	r2, #8192
	str	r2, [r3]
	add	r3, r7, #188
	ldr	r3, [r3]
	vdup.32	q8, r3
	vstr	d16, [r7, #208]
	vstr	d17, [r7, #216]
	vldr	d16, [r7, #608]
	vstr	d16, [r7, #200]
	vldr	d16, [r7, #568]
	vstr	d16, [r7, #192]
	vldr	d16, [r7, #208]
	vldr	d17, [r7, #216]
	vldr	d18, [r7, #200]
	vldr	d19, [r7, #192]
	vmlal.s16	q8, d18, d19
	vstr	d16, [r7, #224]
	vstr	d17, [r7, #232]
	vldr	d16, [r7, #224]
	vldr	d17, [r7, #232]
	vshr.s32	q8, q8, #14
	vstr	d16, [r7, #496]
	vstr	d17, [r7, #504]
	add	r3, r7, #244
	mov	r2, #16384
	str	r2, [r3]
	add	r3, r7, #244
	ldr	r3, [r3]
	vdup.32	q8, r3
	vstr	d16, [r7, #264]
	vstr	d17, [r7, #272]
	vldr	d16, [r7, #600]
	vstr	d16, [r7, #256]
	vldr	d16, [r7, #560]
	vstr	d16, [r7, #248]
	vldr	d16, [r7, #264]
	vldr	d17, [r7, #272]
	vldr	d18, [r7, #256]
	vldr	d19, [r7, #248]
	vmlal.s16	q8, d18, d19
	vstr	d16, [r7, #280]
	vstr	d17, [r7, #288]
	vldr	d16, [r7, #280]
	vldr	d17, [r7, #288]
	vshr.s32	q8, q8, #15
	vstr	d16, [r7, #480]
	vstr	d17, [r7, #488]
	vldr	d16, [r7, #544]
	vldr	d17, [r7, #552]
	vstr	d16, [r7, #312]
	vstr	d17, [r7, #320]
	vldr	d16, [r7, #528]
	vldr	d17, [r7, #536]
	vstr	d16, [r7, #296]
	vstr	d17, [r7, #304]
	vldr	d18, [r7, #312]
	vldr	d19, [r7, #320]
	vldr	d16, [r7, #296]
	vldr	d17, [r7, #304]
	vadd.i32	q9, q9, q8
	vldr	d16, [r7, #496]
	vldr	d17, [r7, #504]
	vstr	d16, [r7, #344]
	vstr	d17, [r7, #352]
	vldr	d16, [r7, #480]
	vldr	d17, [r7, #488]
	vstr	d16, [r7, #328]
	vstr	d17, [r7, #336]
	vldr	d20, [r7, #344]
	vldr	d21, [r7, #352]
	vldr	d16, [r7, #328]
	vldr	d17, [r7, #336]
	vadd.i32	q8, q10, q8
	vldr	d20, [r7, #512]
	vldr	d21, [r7, #520]
	vstr	d20, [r7, #376]
	vstr	d21, [r7, #384]
	vstr	d16, [r7, #360]
	vstr	d17, [r7, #368]
	vldr	d20, [r7, #376]
	vldr	d21, [r7, #384]
	vldr	d16, [r7, #360]
	vldr	d17, [r7, #368]
	vadd.i32	q8, q10, q8
	vstr	d18, [r7, #408]
	vstr	d19, [r7, #416]
	vstr	d16, [r7, #392]
	vstr	d17, [r7, #400]
	vldr	d18, [r7, #408]
	vldr	d19, [r7, #416]
	vldr	d16, [r7, #392]
	vldr	d17, [r7, #400]
	vadd.i32	q8, q9, q8
	vstr	d16, [r7, #464]
	vstr	d17, [r7, #472]
	vldr	d16, [r7, #464]
	vldr	d17, [r7, #472]
	vstr	d16, [r7, #424]
	vstr	d17, [r7, #432]
	vldr	d16, [r7, #424]
	vldr	d17, [r7, #432]
	vmovn.i32	d16, q8
	vstr	d16, [r7, #456]
	ldr	r3, [r7, #644]
	lsls	r3, r3, #1
	ldr	r2, .L34+8
	ldr	r2, [r4, r2]
	add	r3, r3, r2
	str	r3, [r7, #452]
	vldr	d16, [r7, #456]
	vstr	d16, [r7, #440]
	ldr	r3, [r7, #452]
	vldr	d16, [r7, #440]
	vst1.16	{d16}, [r3]
	movs	r3, #0
	str	r3, [r7, #640]
	b	.L28
.L30:
	ldr	r2, [r7, #644]
	ldr	r3, [r7, #640]
	adds	r0, r2, r3
	ldr	r2, [r7, #644]
	ldr	r3, [r7, #640]
	add	r3, r3, r2
	ldr	r2, .L34+8
	ldr	r2, [r4, r2]
	ldrsh	r3, [r2, r3, lsl #1]
	mov	r5, r3
	ldr	r2, [r7, #644]
	ldr	r3, [r7, #640]
	add	r3, r3, r2
	ldr	r2, .L34+8
	ldr	r2, [r4, r2]
	ldrsh	r3, [r2, r3, lsl #1]
	mov	r6, r3
	ldr	r2, [r7, #644]
	ldr	r3, [r7, #640]
	add	r3, r3, r2
	ldr	r1, [r7, #644]
	ldr	r2, [r7, #640]
	add	r2, r2, r1
	ldr	r1, .L34+8
	ldr	r1, [r4, r1]
	ldrsh	r2, [r1, r2, lsl #1]
	vmov	s15, r2	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L34
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d16, s15
	vstr.64	d16, [sp, #8]
	str	r3, [sp]
	mov	r3, r6
	mov	r2, r5
	mov	r1, r0
	ldr	r0, .L34+12
.LPIC3:
	add	r0, pc
	bl	printf(PLT)
	ldr	r3, [r7, #640]
	adds	r3, r3, #1
	str	r3, [r7, #640]
.L28:
	ldr	r3, [r7, #640]
	cmp	r3, #3
	bgt	.L29
	ldr	r2, [r7, #644]
	ldr	r3, [r7, #640]
	add	r3, r3, r2
	cmp	r3, #99
	ble	.L30
.L29:
	ldr	r3, [r7, #644]
	adds	r3, r3, #4
	str	r3, [r7, #644]
.L2:
	ldr	r3, [r7, #644]
	cmp	r3, #99
	ble	.L31
	nop
	add	r7, r7, #652
	mov	sp, r7
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L35:
	.align	2
.L34:
	.word	1182793728
	.word	X(GOT)
	.word	Y(GOT)
	.word	.LC2-(.LPIC3+4)
	.size	main, .-main
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
