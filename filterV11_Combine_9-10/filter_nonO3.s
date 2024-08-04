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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #16
	ldr	r4, .L4+4
.LPIC0:
	add	r4, pc
	ldr	r3, .L4+8
	ldr	r3, [r4, r3]
	mov	r2, #49152
	strh	r2, [r3]	@ movhi
	ldr	r3, .L4+8
	ldr	r3, [r4, r3]
	mov	r2, #49152
	strh	r2, [r3, #2]	@ movhi
	ldr	r3, .L4+8
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, .L4+8
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r3, .L4+8
	ldr	r3, [r4, r3]
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
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3, #2]
	mov	r1, r3
	ldr	r3, .L4+8
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3, #2]
	mov	r2, r3
	ldr	r3, .L4+8
	ldr	r3, [r4, r3]
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
	movs	r5, #2
	b	.L2
.L3:
	ldr	r3, .L4+20
.LPIC3:
	add	r3, pc
	ldrsh	r3, [r3, r5, lsl #1]
	mov	r2, r3
	movw	r3, #30384
	mul	r3, r3, r2
	add	r3, r3, #8388608
	asrs	r3, r3, #24
	uxth	r2, r3
	subs	r3, r5, #1
	ldr	r1, .L4+24
.LPIC4:
	add	r1, pc
	ldrsh	r3, [r1, r3, lsl #1]
	mov	r1, r3
	movw	r3, #30384
	mul	r3, r3, r1
	add	r3, r3, #4194304
	asrs	r3, r3, #23
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	subs	r3, r5, #2
	ldr	r1, .L4+28
.LPIC5:
	add	r1, pc
	ldrsh	r3, [r1, r3, lsl #1]
	mov	r1, r3
	movw	r3, #30384
	mul	r3, r3, r1
	add	r3, r3, #8388608
	asrs	r3, r3, #24
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	subs	r3, r5, #1
	ldr	r1, .L4+8
	ldr	r1, [r4, r1]
	ldrsh	r3, [r1, r3, lsl #1]
	mov	r1, r3
	movw	r3, #29863
	mul	r3, r3, r1
	add	r3, r3, #8192
	asrs	r3, r3, #14
	uxth	r3, r3
	add	r3, r3, r2
	uxth	r2, r3
	subs	r3, r5, #2
	ldr	r1, .L4+8
	ldr	r1, [r4, r1]
	ldrsh	r3, [r1, r3, lsl #1]
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
	ldr	r3, .L4+8
	ldr	r3, [r4, r3]
	strh	r2, [r3, r5, lsl #1]	@ movhi
	ldr	r3, .L4+8
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3, r5, lsl #1]
	mov	r2, r3
	ldr	r3, .L4+8
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3, r5, lsl #1]
	mov	r1, r3
	ldr	r3, .L4+8
	ldr	r3, [r4, r3]
	ldrsh	r3, [r3, r5, lsl #1]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L4
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d7, s15
	vstr.64	d7, [sp, #8]
	str	r5, [sp]
	mov	r3, r1
	mov	r1, r5
	ldr	r0, .L4+32
.LPIC6:
	add	r0, pc
	bl	printf(PLT)
	adds	r5, r5, #1
.L2:
	cmp	r5, #99
	ble	.L3
	nop
	mov	sp, r7
	@ sp needed
	pop	{r4, r5, r7, pc}
.L5:
	.align	2
.L4:
	.word	1182793728
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+4)
	.word	Y(GOT)
	.word	.LC0-(.LPIC1+4)
	.word	.LC1-(.LPIC2+4)
	.word	X-(.LPIC3+4)
	.word	X-(.LPIC4+4)
	.word	X-(.LPIC5+4)
	.word	.LC2-(.LPIC6+4)
	.size	main, .-main
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
