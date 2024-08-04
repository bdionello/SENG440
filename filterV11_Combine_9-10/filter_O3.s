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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
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
	sub	sp, sp, #16
	movt	r9, 49136
	ldr	r6, [r3, r1]
	mov	r1, r2
	mov	r3, #-1073692672
.LPIC1:
	add	r0, pc
	vldr.32	s17, .L6
	movs	r4, #2
	str	r3, [r6]	@ unaligned
	mov	r5, r6
	strd	r8, [sp]
	movw	r7, #30384
	bl	printf(PLT)
	ldrsh	r2, [r6, #2]
	ldr	r0, .L6+16
	vmov.f32	s16, s17
	ldr	r6, .L6+20
	vmov	s15, r2	@ int
	ldr	r8, .L6+24
.LPIC2:
	add	r0, pc
	mov	r1, r2
	vcvt.f32.s32	s15, s15
.LPIC3:
	add	r6, pc
.LPIC4:
	add	r8, pc
	vmul.f32	s15, s15, s17
	vcvt.f64.f32	d7, s15
	vstr.64	d7, [sp]
	bl	printf(PLT)
.L2:
	ldrh	lr, [r6, #2]
	mov	r2, #4194304
	ldrh	r3, [r6, #4]
	mov	r0, #8388608
	ldrh	r9, [r6]
	movw	r1, #29863
	ldrh	r10, [r5, #2]
	adds	r5, r5, #2
	smlabb	r2, lr, r7, r2
	ldrh	ip, [r5, #-2]
	smlabb	lr, r3, r7, r0
	movw	r3, #38103
	smlabb	r0, r9, r7, r0
	mov	r9, #8192
	smlabb	r1, r10, r1, r9
	mov	r9, #16384
	smlabb	ip, ip, r3, r9
	asrs	r2, r2, #23
	add	r3, r2, lr, asr #24
	adds	r6, r6, #2
	add	r3, r3, r0, asr #24
	mov	r0, r8
	add	r3, r3, r1, asr #14
	mov	r1, r4
	add	r3, r3, ip, asr #15
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
	bne	.L2
	add	sp, sp, #16
	@ sp needed
	vldm	sp!, {d8}
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
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
