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
	@ link register save eliminated.
	push	{r4, r7}
	add	r7, sp, #0
	ldr	r3, .L4
.LPIC0:
	add	r3, pc
	ldr	r2, .L4+4
	ldr	r2, [r3, r2]
	mov	r1, #49152
	strh	r1, [r2]	@ movhi
	ldr	r2, .L4+4
	ldr	r2, [r3, r2]
	mov	r1, #49152
	strh	r1, [r2, #2]	@ movhi
	movs	r4, #2
	b	.L2
.L3:
	ldr	r2, .L4+8
.LPIC1:
	add	r2, pc
	ldrsh	r2, [r2, r4, lsl #1]
	mov	r1, r2
	movw	r2, #30384
	mul	r2, r2, r1
	add	r2, r2, #8388608
	asrs	r2, r2, #24
	uxth	r1, r2
	subs	r2, r4, #1
	ldr	r0, .L4+12
.LPIC2:
	add	r0, pc
	ldrsh	r2, [r0, r2, lsl #1]
	mov	r0, r2
	movw	r2, #30384
	mul	r2, r2, r0
	add	r2, r2, #4194304
	asrs	r2, r2, #23
	uxth	r2, r2
	add	r2, r2, r1
	uxth	r1, r2
	subs	r2, r4, #2
	ldr	r0, .L4+16
.LPIC3:
	add	r0, pc
	ldrsh	r2, [r0, r2, lsl #1]
	mov	r0, r2
	movw	r2, #30384
	mul	r2, r2, r0
	add	r2, r2, #8388608
	asrs	r2, r2, #24
	uxth	r2, r2
	add	r2, r2, r1
	uxth	r1, r2
	subs	r2, r4, #1
	ldr	r0, .L4+4
	ldr	r0, [r3, r0]
	ldrsh	r2, [r0, r2, lsl #1]
	mov	r0, r2
	movw	r2, #29863
	mul	r2, r2, r0
	add	r2, r2, #8192
	asrs	r2, r2, #14
	uxth	r2, r2
	add	r2, r2, r1
	uxth	r1, r2
	subs	r2, r4, #2
	ldr	r0, .L4+4
	ldr	r0, [r3, r0]
	ldrsh	r2, [r0, r2, lsl #1]
	mov	r0, r2
	movw	r2, #38103
	movt	r2, 65535
	mul	r2, r2, r0
	add	r2, r2, #16384
	asrs	r2, r2, #15
	uxth	r2, r2
	add	r2, r2, r1
	uxth	r2, r2
	sxth	r1, r2
	ldr	r2, .L4+4
	ldr	r2, [r3, r2]
	strh	r1, [r2, r4, lsl #1]	@ movhi
	adds	r4, r4, #1
.L2:
	cmp	r4, #99
	ble	.L3
	nop
	mov	sp, r7
	@ sp needed
	pop	{r4, r7}
	bx	lr
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+4)
	.word	Y(GOT)
	.word	X-(.LPIC1+4)
	.word	X-(.LPIC2+4)
	.word	X-(.LPIC3+4)
	.size	main, .-main
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
