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
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r2, #49152
	vpush.64	{d8, d9, d10, d11, d12, d13}
	movt	r2, 65535
	ldr	r3, .L6+12
	movs	r6, #0
	ldr	r1, .L6+16
	mov	r4, #49152
.LPIC0:
	add	r3, pc
	ldr	r0, .L6+20
	sub	sp, sp, #84
	movs	r7, #0
	ldr	r5, [r3, r1]
	movt	r7, 49136
	mov	r1, r2
.LPIC1:
	add	r0, pc
	add	r3, sp, #32
	str	r3, [sp, #20]
	strh	r4, [r5]	@ movhi
	vmov.i32	q6, #8388608  @ v4si
	strh	r4, [r5, #2]	@ movhi
	strd	r6, [sp]
	movs	r6, #2
	bl	printf(PLT)
	ldrsh	r2, [r5, #2]
	vldr.32	s23, .L6+8
	add	r3, sp, #48
	ldr	r0, .L6+24
	mov	r1, r2
	str	r3, [sp, #24]
	vmov	s15, r2	@ int
.LPIC2:
	add	r0, pc
	add	r3, sp, #64
	str	r3, [sp, #28]
	vcvt.f32.s32	s15, s15
	ldr	r7, .L6+28
	vldr	d8, .L6
	ldr	r8, .L6+32
.LPIC3:
	add	r7, pc
	vmov	d10, d8  @ v4hi
	adds	r7, r7, #4
	vmov	d9, d8  @ v4hi
.LPIC4:
	add	r8, pc
	vmul.f32	s15, s15, s23
	vcvt.f64.f32	d16, s15
	vstr.64	d16, [sp]
	bl	printf(PLT)
	vmov.f32	s22, s23
.L2:
	vmov	q10, q6  @ v4si
	vld1.16	{d18}, [r7]
	subs	r2, r7, #2
	vmov.i32	q8, #4194304  @ v4si
	subs	r3, r7, #4
	vmov	q11, q6  @ v4si
	vmlal.s16	q10, d8, d18
	vld1.16	{d18}, [r2]
	vmlal.s16	q8, d10, d18
	ldr	r2, [sp, #20]
	vld1.16	{d18}, [r3]
	movw	lr, #29863
	vmlal.s16	q11, d9, d18
	ldrsh	r4, [r5, #2]
	ldrh	r10, [r5]
	movw	fp, #38103
	mov	r1, #16384
	mov	ip, #8192
	vshr.s32	q10, q10, #24
	adds	r7, r7, #8
	vshr.s32	q8, q8, #23
	adds	r5, r5, #8
	smlabb	r3, r4, lr, ip
	vst1.32	{d20-d21}, [r2:64]
	vshr.s32	q9, q11, #24
	ldr	r2, [sp, #24]
	smlabb	r9, r4, fp, r1
	vst1.32	{d16-d17}, [r2:64]
	smlabb	r10, r10, fp, r1
	ldrd	r4, r2, [sp, #28]
	ldr	r0, [sp, #48]
	vst1.32	{d18-d19}, [r4:64]
	add	r2, r2, r0
	ldr	r4, [sp, #64]
	ldr	r0, [sp, #52]
	add	r2, r2, r4
	ldr	r4, [sp, #36]
	add	r3, r2, r3, asr #14
	ldr	r2, [sp, #68]
	add	r3, r3, r10, asr #15
	add	r4, r4, r0
	add	r4, r4, r2
	ldr	r0, [sp, #40]
	sxth	r3, r3
	add	r4, r4, r9, asr #15
	ldr	r2, [sp, #56]
	vmov	s15, r3	@ int
	strh	r3, [r5, #-4]	@ movhi
	smlabb	r10, r3, lr, ip
	vcvt.f32.s32	s15, s15
	smlabb	r9, r3, fp, r1
	add	r2, r2, r0
	ldr	r0, [sp, #72]
	add	r4, r4, r10, asr #14
	add	r2, r2, r0
	ldr	r0, [sp, #60]
	vmul.f32	s15, s15, s22
	sxth	r4, r4
	add	r9, r2, r9, asr #15
	strh	r4, [r5, #-2]	@ movhi
	smlabb	r10, r4, lr, ip
	mov	r2, r3
	smlabb	r4, r4, fp, r1
	ldr	r1, [sp, #44]
	add	fp, r6, #3
	add	r9, r9, r10, asr #14
	add	r10, r0, r1
	ldr	r0, [sp, #76]
	mov	r1, r6
	sxth	r9, r9
	strh	r9, [r5]	@ movhi
	add	r10, r10, r0
	mov	r0, r8
	vcvt.f64.f32	d16, s15
	add	r4, r10, r4, asr #15
	smlabb	ip, r9, lr, ip
	add	r9, r6, #1
	add	r10, r6, #2
	add	r4, r4, ip, asr #14
	strh	r4, [r5, #2]	@ movhi
	str	r6, [sp]
	adds	r6, r6, #4
	vstr.64	d16, [sp, #8]
	bl	printf(PLT)
	ldrsh	r3, [r5, #-2]
	mov	r1, r9
	str	r9, [sp]
	mov	r0, r8
	vmov	s15, r3	@ int
	mov	r2, r3
	vcvt.f32.s32	s15, s15
	vmul.f32	s15, s15, s22
	vcvt.f64.f32	d16, s15
	vstr.64	d16, [sp, #8]
	bl	printf(PLT)
	ldrsh	r3, [r5]
	mov	r1, r10
	str	r10, [sp]
	mov	r0, r8
	vmov	s15, r3	@ int
	mov	r2, r3
	vcvt.f32.s32	s15, s15
	vmul.f32	s15, s15, s22
	vcvt.f64.f32	d16, s15
	vstr.64	d16, [sp, #8]
	bl	printf(PLT)
	ldrsh	r3, [r5, #2]
	mov	r1, fp
	str	fp, [sp]
	mov	r0, r8
	vmov	s15, r3	@ int
	mov	r2, r3
	vcvt.f32.s32	s15, s15
	vmul.f32	s15, s15, s22
	vcvt.f64.f32	d16, s15
	vstr.64	d16, [sp, #8]
	bl	printf(PLT)
	cmp	r6, #102
	bne	.L2
	add	sp, sp, #84
	@ sp needed
	vldm	sp!, {d8-d13}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L7:
	.align	3
.L6:
	.short	30384
	.short	30384
	.short	30384
	.short	30384
	.word	947912704
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+4)
	.word	Y(GOT)
	.word	.LC0-(.LPIC1+4)
	.word	.LC1-(.LPIC2+4)
	.word	.LANCHOR0-(.LPIC3+4)
	.word	.LC2-(.LPIC4+4)
	.size	main, .-main
	.comm	Y,256,4
	.global	X
	.data
	.align	3
	.set	.LANCHOR0,. + 0
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
