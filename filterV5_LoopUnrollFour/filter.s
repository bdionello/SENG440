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
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #116
	add	r7, sp, #16
	ldr	r5, .L4+4
.LPIC0:
	add	r5, pc
	movw	r3, #30384
	strh	r3, [r7, #94]	@ movhi
	movw	r3, #30384
	strh	r3, [r7, #92]	@ movhi
	movw	r3, #30384
	strh	r3, [r7, #90]	@ movhi
	movw	r3, #29863
	strh	r3, [r7, #88]	@ movhi
	movw	r3, #38103
	strh	r3, [r7, #86]	@ movhi
	ldr	r3, .L4+8
	ldr	r3, [r5, r3]
	mov	r2, #49152
	strh	r2, [r3]	@ movhi
	ldr	r3, .L4+8
	ldr	r3, [r5, r3]
	mov	r2, #49152
	strh	r2, [r3, #2]	@ movhi
	ldr	r3, .L4+8
	ldr	r3, [r5, r3]
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, .L4+8
	ldr	r3, [r5, r3]
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r3, .L4+8
	ldr	r3, [r5, r3]
	ldrsh	r3, [r3]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L4
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d7, s15
	vstr.64	d7, [sp]
	ldr	r3, .L4+12
.LPIC1:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	ldr	r3, .L4+8
	ldr	r3, [r5, r3]
	ldrsh	r3, [r3, #2]
	mov	r1, r3
	ldr	r3, .L4+8
	ldr	r3, [r5, r3]
	ldrsh	r3, [r3, #2]
	mov	r2, r3
	ldr	r3, .L4+8
	ldr	r3, [r5, r3]
	ldrsh	r3, [r3, #2]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L4
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d7, s15
	vstr.64	d7, [sp]
	ldr	r3, .L4+16
.LPIC2:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	movs	r4, #2
	b	.L2
.L5:
	.align	2
.L4:
	.word	1182793728
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+4)
	.word	Y(GOT)
	.word	.LC0-(.LPIC1+4)
	.word	.LC1-(.LPIC2+4)
.L3:
	ldrsh	r3, [r7, #94]
	ldr	r2, .L6+4
.LPIC3:
	add	r2, pc
	ldrsh	r2, [r2, r4, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #8388608
	asrs	r3, r3, #24
	str	r3, [r7, #80]
	ldrsh	r3, [r7, #92]
	subs	r2, r4, #1
	ldr	r1, .L6+8
.LPIC4:
	add	r1, pc
	ldrsh	r2, [r1, r2, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #4194304
	asrs	r3, r3, #23
	str	r3, [r7, #76]
	ldrsh	r3, [r7, #90]
	subs	r2, r4, #2
	ldr	r1, .L6+12
.LPIC5:
	add	r1, pc
	ldrsh	r2, [r1, r2, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #8388608
	asrs	r3, r3, #24
	str	r3, [r7, #72]
	ldrsh	r3, [r7, #86]
	subs	r2, r4, #2
	ldr	r1, .L6+16
	ldr	r1, [r5, r1]
	ldrsh	r2, [r1, r2, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #16384
	asrs	r3, r3, #15
	str	r3, [r7, #68]
	ldrsh	r3, [r7, #88]
	subs	r2, r4, #1
	ldr	r1, .L6+16
	ldr	r1, [r5, r1]
	ldrsh	r2, [r1, r2, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #8192
	asrs	r3, r3, #14
	str	r3, [r7, #64]
	ldr	r3, [r7, #80]
	uxth	r2, r3
	ldr	r3, [r7, #76]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #72]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #64]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #68]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r3, r3
	sxth	r2, r3
	ldr	r3, .L6+16
	ldr	r3, [r5, r3]
	strh	r2, [r3, r4, lsl #1]	@ movhi
	ldrsh	r3, [r7, #94]
	adds	r2, r4, #1
	ldr	r1, .L6+20
.LPIC6:
	add	r1, pc
	ldrsh	r2, [r1, r2, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #8388608
	asrs	r3, r3, #24
	str	r3, [r7, #60]
	ldrsh	r3, [r7, #92]
	ldr	r2, .L6+24
.LPIC7:
	add	r2, pc
	ldrsh	r2, [r2, r4, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #4194304
	asrs	r3, r3, #23
	str	r3, [r7, #56]
	ldrsh	r3, [r7, #90]
	subs	r2, r4, #1
	ldr	r1, .L6+28
.LPIC8:
	add	r1, pc
	ldrsh	r2, [r1, r2, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #8388608
	asrs	r3, r3, #24
	str	r3, [r7, #52]
	ldrsh	r3, [r7, #86]
	subs	r2, r4, #1
	ldr	r1, .L6+16
	ldr	r1, [r5, r1]
	ldrsh	r2, [r1, r2, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #16384
	asrs	r3, r3, #15
	str	r3, [r7, #48]
	ldrsh	r3, [r7, #88]
	ldr	r2, .L6+16
	ldr	r2, [r5, r2]
	ldrsh	r2, [r2, r4, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #8192
	asrs	r3, r3, #14
	str	r3, [r7, #44]
	ldr	r3, [r7, #60]
	uxth	r2, r3
	ldr	r3, [r7, #56]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #52]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #44]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #48]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	adds	r3, r4, #1
	sxth	r1, r2
	ldr	r2, .L6+16
	ldr	r2, [r5, r2]
	strh	r1, [r2, r3, lsl #1]	@ movhi
	ldrsh	r3, [r7, #94]
	adds	r2, r4, #2
	ldr	r1, .L6+32
.LPIC9:
	add	r1, pc
	ldrsh	r2, [r1, r2, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #8388608
	asrs	r3, r3, #24
	str	r3, [r7, #40]
	ldrsh	r3, [r7, #92]
	adds	r2, r4, #1
	ldr	r1, .L6+36
.LPIC10:
	add	r1, pc
	ldrsh	r2, [r1, r2, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #4194304
	asrs	r3, r3, #23
	str	r3, [r7, #36]
	ldrsh	r3, [r7, #90]
	ldr	r2, .L6+40
.LPIC11:
	add	r2, pc
	ldrsh	r2, [r2, r4, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #8388608
	asrs	r3, r3, #24
	str	r3, [r7, #32]
	ldrsh	r3, [r7, #86]
	ldr	r2, .L6+16
	ldr	r2, [r5, r2]
	ldrsh	r2, [r2, r4, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #16384
	asrs	r3, r3, #15
	str	r3, [r7, #28]
	ldrsh	r3, [r7, #88]
	adds	r2, r4, #1
	ldr	r1, .L6+16
	ldr	r1, [r5, r1]
	ldrsh	r2, [r1, r2, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #8192
	asrs	r3, r3, #14
	str	r3, [r7, #24]
	ldr	r3, [r7, #40]
	uxth	r2, r3
	ldr	r3, [r7, #36]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #32]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #24]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #28]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	adds	r3, r4, #2
	sxth	r1, r2
	ldr	r2, .L6+16
	ldr	r2, [r5, r2]
	strh	r1, [r2, r3, lsl #1]	@ movhi
	ldrsh	r3, [r7, #94]
	adds	r2, r4, #3
	ldr	r1, .L6+44
.LPIC12:
	add	r1, pc
	ldrsh	r2, [r1, r2, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #8388608
	asrs	r3, r3, #24
	str	r3, [r7, #80]
	ldrsh	r3, [r7, #92]
	adds	r2, r4, #2
	ldr	r1, .L6+48
.LPIC13:
	add	r1, pc
	ldrsh	r2, [r1, r2, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #4194304
	asrs	r3, r3, #23
	str	r3, [r7, #76]
	ldrsh	r3, [r7, #90]
	adds	r2, r4, #1
	ldr	r1, .L6+52
.LPIC14:
	add	r1, pc
	ldrsh	r2, [r1, r2, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #8388608
	asrs	r3, r3, #24
	str	r3, [r7, #72]
	ldrsh	r3, [r7, #86]
	adds	r2, r4, #1
	ldr	r1, .L6+16
	ldr	r1, [r5, r1]
	ldrsh	r2, [r1, r2, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #16384
	asrs	r3, r3, #15
	str	r3, [r7, #68]
	ldrsh	r3, [r7, #88]
	adds	r2, r4, #2
	ldr	r1, .L6+16
	ldr	r1, [r5, r1]
	ldrsh	r2, [r1, r2, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #8192
	asrs	r3, r3, #14
	str	r3, [r7, #64]
	ldr	r3, [r7, #20]
	uxth	r2, r3
	ldr	r3, [r7, #16]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #12]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #8]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	adds	r3, r4, #3
	sxth	r1, r2
	ldr	r2, .L6+16
	ldr	r2, [r5, r2]
	strh	r1, [r2, r3, lsl #1]	@ movhi
	ldr	r3, .L6+16
	ldr	r3, [r5, r3]
	ldrsh	r3, [r3, r4, lsl #1]
	mov	r2, r3
	ldr	r3, .L6+16
	ldr	r3, [r5, r3]
	ldrsh	r3, [r3, r4, lsl #1]
	mov	r1, r3
	ldr	r3, .L6+16
	ldr	r3, [r5, r3]
	ldrsh	r3, [r3, r4, lsl #1]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L6
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d7, s15
	vstr.64	d7, [sp, #8]
	str	r4, [sp]
	mov	r3, r1
	mov	r1, r4
	ldr	r0, .L6+56
.LPIC15:
	add	r0, pc
	bl	printf(PLT)
	adds	r0, r4, #1
	adds	r3, r4, #1
	ldr	r2, .L6+16
	ldr	r2, [r5, r2]
	ldrsh	r3, [r2, r3, lsl #1]
	mov	r6, r3
	adds	r3, r4, #1
	ldr	r2, .L6+16
	ldr	r2, [r5, r2]
	ldrsh	r3, [r2, r3, lsl #1]
	mov	ip, r3
	adds	r3, r4, #1
	adds	r2, r4, #1
	ldr	r1, .L6+16
	ldr	r1, [r5, r1]
	ldrsh	r2, [r1, r2, lsl #1]
	vmov	s15, r2	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L6
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d7, s15
	vstr.64	d7, [sp, #8]
	str	r3, [sp]
	mov	r3, ip
	mov	r2, r6
	mov	r1, r0
	ldr	r0, .L6+60
.LPIC16:
	add	r0, pc
	bl	printf(PLT)
	adds	r0, r4, #2
	adds	r3, r4, #2
	ldr	r2, .L6+16
	ldr	r2, [r5, r2]
	ldrsh	r3, [r2, r3, lsl #1]
	mov	r6, r3
	adds	r3, r4, #2
	ldr	r2, .L6+16
	ldr	r2, [r5, r2]
	ldrsh	r3, [r2, r3, lsl #1]
	mov	ip, r3
	adds	r3, r4, #2
	adds	r2, r4, #2
	ldr	r1, .L6+16
	ldr	r1, [r5, r1]
	ldrsh	r2, [r1, r2, lsl #1]
	vmov	s15, r2	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L6
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d7, s15
	vstr.64	d7, [sp, #8]
	str	r3, [sp]
	mov	r3, ip
	mov	r2, r6
	mov	r1, r0
	ldr	r0, .L6+64
.LPIC17:
	add	r0, pc
	bl	printf(PLT)
	adds	r0, r4, #3
	adds	r3, r4, #3
	ldr	r2, .L6+16
	ldr	r2, [r5, r2]
	ldrsh	r3, [r2, r3, lsl #1]
	mov	r6, r3
	adds	r3, r4, #3
	ldr	r2, .L6+16
	ldr	r2, [r5, r2]
	ldrsh	r3, [r2, r3, lsl #1]
	mov	ip, r3
	adds	r3, r4, #3
	adds	r2, r4, #3
	ldr	r1, .L6+16
	ldr	r1, [r5, r1]
	ldrsh	r2, [r1, r2, lsl #1]
	vmov	s15, r2	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L6
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d7, s15
	vstr.64	d7, [sp, #8]
	str	r3, [sp]
	mov	r3, ip
	mov	r2, r6
	mov	r1, r0
	ldr	r0, .L6+68
.LPIC18:
	add	r0, pc
	bl	printf(PLT)
	adds	r4, r4, #4
.L2:
	cmp	r4, #101
	ble	.L3
	nop
	adds	r7, r7, #100
	mov	sp, r7
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L7:
	.align	2
.L6:
	.word	1182793728
	.word	X-(.LPIC3+4)
	.word	X-(.LPIC4+4)
	.word	X-(.LPIC5+4)
	.word	Y(GOT)
	.word	X-(.LPIC6+4)
	.word	X-(.LPIC7+4)
	.word	X-(.LPIC8+4)
	.word	X-(.LPIC9+4)
	.word	X-(.LPIC10+4)
	.word	X-(.LPIC11+4)
	.word	X-(.LPIC12+4)
	.word	X-(.LPIC13+4)
	.word	X-(.LPIC14+4)
	.word	.LC2-(.LPIC15+4)
	.word	.LC2-(.LPIC16+4)
	.word	.LC2-(.LPIC17+4)
	.word	.LC2-(.LPIC18+4)
	.size	main, .-main
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
