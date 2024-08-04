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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r2, #49152
	vpush.64	{d8}
	movt	r2, 65535
	ldr	r3, .L6+4
	mov	r8, #0
	ldr	r1, .L6+8
	mov	r9, #0
.LPIC0:
	add	r3, pc
	ldr	r0, .L6+12
	sub	sp, sp, #28
	movt	r9, 49136
	ldr	r6, [r3, r1]
	mov	r1, r2
	mov	r3, #-1073692672
.LPIC1:
	add	r0, pc
	vldr.32	s17, .L6
	movs	r5, #2
	str	r3, [r6]	@ unaligned
	mov	r4, r6
	strd	r8, [sp]
	movw	r7, #30384
	bl	printf(PLT)
	ldrsh	r2, [r6, #2]
	ldr	r0, .L6+16
	vmov.f32	s16, s17
	ldr	r9, .L6+20
	vmov	s15, r2	@ int
	ldr	r3, .L6+24
.LPIC2:
	add	r0, pc
	mov	r1, r2
	vcvt.f32.s32	s14, s15
.LPIC4:
	add	r3, pc
.LPIC3:
	add	r9, pc
	str	r3, [sp, #20]
	vmul.f32	s14, s14, s17
	vcvt.f64.f32	d7, s14
	vstr.64	d7, [sp]
	bl	printf(PLT)
.L2:
	ldr	r2, [r9]
	movw	r6, #29863
	ldrsh	r8, [r4, #2]
	mov	r3, #8192
	ldr	r1, [r9, #4]!
	mov	ip, #16384
	ldrh	fp, [r4]
	asr	r10, r2, #16
	smlabb	r3, r8, r6, r3
	movw	lr, #38103
	mul	r10, r7, r10
	asrs	r0, r1, #16
	smlabb	fp, fp, lr, ip
	sxth	r2, r2
	mul	r0, r7, r0
	add	r10, r10, #8388608
	mul	r2, r7, r2
	asrs	r3, r3, #14
	add	r3, r3, r10, asr #24
	sxth	r1, r1
	add	r3, r3, fp, asr #15
	add	fp, r0, #8388608
	add	r10, r2, #4194304
	add	r2, r2, #8388608
	add	r3, r3, fp, asr #24
	adds	r4, r4, #4
	add	r3, r3, r10, asr #23
	asrs	r2, r2, #24
	smlabb	lr, r8, lr, ip
	sxth	r3, r3
	add	ip, r0, #4194304
	ldr	r10, [sp, #20]
	vmov	s15, r3	@ int
	strh	r3, [r4]	@ movhi
	add	ip, r2, ip, asr #23
	mov	r2, #8192
	vcvt.f32.s32	s14, s15
	mov	r0, r10
	mul	r1, r7, r1
	add	ip, ip, lr, asr #15
	smlabb	r6, r3, r6, r2
	mov	r2, r3
	add	r1, r1, #8388608
	add	r8, r5, #1
	vmul.f32	s14, s14, s16
	add	ip, ip, r1, asr #24
	mov	r1, r5
	add	r6, ip, r6, asr #14
	strh	r6, [r4, #2]	@ movhi
	str	r5, [sp]
	adds	r5, r5, #2
	vcvt.f64.f32	d7, s14
	vstr.64	d7, [sp, #8]
	bl	printf(PLT)
	ldrsh	r3, [r4, #2]
	mov	r1, r8
	str	r8, [sp]
	mov	r0, r10
	vmov	s15, r3	@ int
	mov	r2, r3
	vcvt.f32.s32	s14, s15
	vmul.f32	s14, s14, s16
	vcvt.f64.f32	d7, s14
	vstr.64	d7, [sp, #8]
	bl	printf(PLT)
	cmp	r5, #100
	bne	.L2
	add	sp, sp, #28
	@ sp needed
	vldm	sp!, {d8}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L7:
	.align	2
.L6:
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
	.align	2
	.set	.LANCHOR0,. + 0
	.type	X, %object
	.size	X, 256
X:
	.word	-2147385343
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
	.word	2147450879
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
