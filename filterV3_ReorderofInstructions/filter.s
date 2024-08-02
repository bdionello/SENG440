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
	.align	1
	.arch armv7-a
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	filter_init, %function
filter_init:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r7}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	movw	r2, #32769
	strh	r2, [r3]	@ movhi
	ldr	r3, [r7, #4]
	adds	r3, r3, #2
	movw	r2, #32769
	strh	r2, [r3]	@ movhi
	movs	r4, #2
	b	.L2
.L3:
	mov	r3, r4
	lsls	r3, r3, #1
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	movw	r2, #32767
	strh	r2, [r3]	@ movhi
	adds	r4, r4, #1
.L2:
	cmp	r4, #99
	ble	.L3
	ldr	r3, [r7]
	mov	r2, #49152
	strh	r2, [r3]	@ movhi
	ldr	r3, [r7]
	adds	r3, r3, #2
	mov	r2, #49152
	strh	r2, [r3]	@ movhi
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r4, r7}
	bx	lr
	.size	filter_init, .-filter_init
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
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
	sub	sp, sp, #48
	add	r7, sp, #16
	ldr	r4, .L7+4
.LPIC0:
	add	r4, pc
	movw	r3, #30384
	strh	r3, [r7, #30]	@ movhi
	movw	r3, #30384
	strh	r3, [r7, #28]	@ movhi
	movw	r3, #30384
	strh	r3, [r7, #26]	@ movhi
	movw	r3, #29863
	strh	r3, [r7, #24]	@ movhi
	movw	r3, #38103
	strh	r3, [r7, #22]	@ movhi
	ldr	r3, .L7+8
	ldr	r3, [r4, r3]
	mov	r1, r3
	ldr	r3, .L7+12
	ldr	r3, [r4, r3]
	mov	r0, r3
	bl	filter_init(PLT)
	ldr	r3, .L7+8
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, .L7+8
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r3, .L7+8
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L7
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d7, s15
	vstr.64	d7, [sp]
	ldr	r3, .L7+16
.LPIC1:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	ldr	r3, .L7+8
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3, #2]
	mov	r1, r3
	ldr	r3, .L7+8
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3, #2]
	mov	r2, r3
	ldr	r3, .L7+8
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3, #2]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L7
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d7, s15
	vstr.64	d7, [sp]
	ldr	r3, .L7+20
.LPIC2:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	movs	r5, #2
	b	.L5
.L6:
	ldrsh	r3, [r7, #30]
	ldr	r2, .L7+12
	ldr	r2, [r4, r2]
	ldrsh	r2, [r2, r5, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #8388608
	asrs	r3, r3, #24
	str	r3, [r7, #16]
	ldr	r3, [r7, #16]
	sxth	r2, r3
	ldr	r3, .L7+8
	ldr	r3, [r4, r3]
	strh	r2, [r3, r5, lsl #1]	@ movhi
	ldrsh	r3, [r7, #28]
	subs	r2, r5, #1
	ldr	r1, .L7+12
	ldr	r1, [r4, r1]
	ldrsh	r2, [r1, r2, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #4194304
	asrs	r3, r3, #23
	str	r3, [r7, #12]
	ldr	r3, .L7+8
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3, r5, lsl #1]
	uxth	r2, r3
	ldr	r3, [r7, #12]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r3, r3
	sxth	r2, r3
	ldr	r3, .L7+8
	ldr	r3, [r4, r3]
	strh	r2, [r3, r5, lsl #1]	@ movhi
	ldrsh	r3, [r7, #26]
	subs	r2, r5, #2
	ldr	r1, .L7+12
	ldr	r1, [r4, r1]
	ldrsh	r2, [r1, r2, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #8388608
	asrs	r3, r3, #24
	str	r3, [r7, #8]
	ldr	r3, .L7+8
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3, r5, lsl #1]
	uxth	r2, r3
	ldr	r3, [r7, #8]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r3, r3
	sxth	r2, r3
	ldr	r3, .L7+8
	ldr	r3, [r4, r3]
	strh	r2, [r3, r5, lsl #1]	@ movhi
	ldrsh	r3, [r7, #24]
	subs	r2, r5, #1
	ldr	r1, .L7+8
	ldr	r1, [r4, r1]
	ldrsh	r2, [r1, r2, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #8192
	asrs	r3, r3, #14
	str	r3, [r7, #4]
	ldr	r3, .L7+8
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3, r5, lsl #1]
	uxth	r2, r3
	ldr	r3, [r7, #4]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r3, r3
	sxth	r2, r3
	ldr	r3, .L7+8
	ldr	r3, [r4, r3]
	strh	r2, [r3, r5, lsl #1]	@ movhi
	ldrsh	r3, [r7, #22]
	subs	r2, r5, #2
	ldr	r1, .L7+8
	ldr	r1, [r4, r1]
	ldrsh	r2, [r1, r2, lsl #1]
	mul	r3, r2, r3
	add	r3, r3, #16384
	asrs	r3, r3, #15
	str	r3, [r7]
	ldr	r3, .L7+8
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3, r5, lsl #1]
	uxth	r2, r3
	ldr	r3, [r7]
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r3, r3
	sxth	r2, r3
	ldr	r3, .L7+8
	ldr	r3, [r4, r3]
	strh	r2, [r3, r5, lsl #1]	@ movhi
	ldr	r3, .L7+8
	ldr	r3, [r4, r3]
	ldrsh	r2, [r3, r5, lsl #1]
	ldr	r3, .L7+8
	ldr	r3, [r4, r3]
	strh	r2, [r3, r5, lsl #1]	@ movhi
	ldr	r3, .L7+8
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3, r5, lsl #1]
	mov	r2, r3
	ldr	r3, .L7+8
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3, r5, lsl #1]
	mov	r1, r3
	ldr	r3, .L7+8
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3, r5, lsl #1]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L7
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d7, s15
	vstr.64	d7, [sp, #8]
	str	r5, [sp]
	mov	r3, r1
	mov	r1, r5
	ldr	r0, .L7+24
.LPIC3:
	add	r0, pc
	bl	printf(PLT)
	adds	r5, r5, #1
.L5:
	cmp	r5, #99
	ble	.L6
	nop
	adds	r7, r7, #32
	mov	sp, r7
	@ sp needed
	pop	{r4, r5, r7, pc}
.L8:
	.align	2
.L7:
	.word	1182793728
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+4)
	.word	Y(GOT)
	.word	X(GOT)
	.word	.LC0-(.LPIC1+4)
	.word	.LC1-(.LPIC2+4)
	.word	.LC2-(.LPIC3+4)
	.size	main, .-main
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
