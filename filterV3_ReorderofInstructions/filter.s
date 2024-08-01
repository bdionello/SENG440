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
	@ args = 0, pretend = 0, frame = 0
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
	sub	sp, sp, #20
	ldr	r3, [r0, r3]
	add	r2, r3, #200
	mov	r6, r3
	str	r4, [r3], #4	@ unaligned
.L2:
	str	r1, [r3], #4	@ unaligned
	cmp	r2, r3
	bne	.L2
	ldr	r3, .L8+12
	mov	r2, #49152
	movt	r2, 65535
	mov	r5, #-1073692672
	mov	r10, #0
	mov	fp, #0
	ldr	r4, [r0, r3]
	mov	r1, r2
	ldr	r0, .L8+16
	movt	fp, 49136
	vldr.32	s17, .L8
	movw	r7, #30384
	str	r5, [r4]	@ unaligned
.LPIC1:
	add	r0, pc
	strd	r10, [sp]
	mov	r5, r4
	bl	printf(PLT)
	ldrsh	r2, [r4, #2]
	ldr	r0, .L8+20
	vmov.f32	s16, s17
	ldr	r8, .L8+24
	movs	r4, #2
	vmov	s15, r2	@ int
.LPIC2:
	add	r0, pc
	mov	r1, r2
.LPIC3:
	add	r8, pc
	vcvt.f32.s32	s15, s15
	vmul.f32	s15, s15, s17
	vcvt.f64.f32	d7, s15
	vstr.64	d7, [sp]
	bl	printf(PLT)
.L3:
	ldrh	r2, [r6, #2]
	mov	r3, #4194304
	ldrh	ip, [r6, #4]
	mov	r1, #8388608
	ldrh	lr, [r6]
	mov	r10, r5
	smlabb	r2, r2, r7, r3
	ldrh	r9, [r5, #2]!
	ldrh	r10, [r10]
	movw	r0, #29863
	smlabb	ip, ip, r7, r1
	adds	r6, r6, #2
	smlabb	r1, lr, r7, r1
	mov	lr, #8192
	smlabb	r0, r9, r0, lr
	mov	lr, #16384
	movw	r9, #38103
	asrs	r3, r2, #23
	smlabb	r2, r10, r9, lr
	add	r3, r3, ip, asr #24
	add	r3, r3, r1, asr #24
	mov	r1, r4
	add	r3, r3, r0, asr #14
	mov	r0, r8
	asrs	r2, r2, #15
	uxtah	r3, r2, r3
	sxth	r3, r3
	strh	r3, [r5, #2]	@ movhi
	str	r4, [sp]
	adds	r4, r4, #1
	vmov	s15, r3	@ int
	mov	r2, r3
	vcvt.f32.s32	s14, s15
	vmul.f32	s14, s14, s16
	vcvt.f64.f32	d7, s14
	vstr.64	d7, [sp, #8]
	bl	printf(PLT)
	cmp	r4, #100
	bne	.L3
	add	sp, sp, #20
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
	.word	.LC1-(.LPIC2+4)
	.word	.LC2-(.LPIC3+4)
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
