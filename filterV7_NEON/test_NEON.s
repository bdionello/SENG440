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
	.file	"test_NEON.c"
	.text
	.comm	aa,16,8
	.comm	bb,16,8
	.comm	ss,16,8
	.section	.rodata
	.align	2
.LC0:
	.ascii	"a[%i] = \000"
	.align	2
.LC1:
	.ascii	"%i\000"
	.align	2
.LC2:
	.ascii	"b[%i] = \000"
	.text
	.align	1
	.global	read_inputs
	.arch armv7-a
	.syntax unified
	.thumb
	.thumb_func
	.fpu neon
	.type	read_inputs, %function
read_inputs:
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
	sub	sp, sp, #72
	add	r7, sp, #0
	ldr	r5, .L8
.LPIC4:
	add	r5, pc
	movs	r4, #0
	b	.L2
.L3:
	mov	r1, r4
	ldr	r3, .L8+4
.LPIC0:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	add	r2, r7, #32
	lsls	r3, r4, #2
	add	r3, r3, r2
	mov	r1, r3
	ldr	r3, .L8+8
.LPIC1:
	add	r3, pc
	mov	r0, r3
	bl	__isoc99_scanf(PLT)
	adds	r4, r4, #1
.L2:
	cmp	r4, #3
	ble	.L3
	movs	r0, #10
	bl	putchar(PLT)
	movs	r4, #0
	b	.L4
.L5:
	mov	r1, r4
	ldr	r3, .L8+12
.LPIC2:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	mov	r2, r7
	lsls	r3, r4, #2
	add	r3, r3, r2
	mov	r1, r3
	ldr	r3, .L8+16
.LPIC3:
	add	r3, pc
	mov	r0, r3
	bl	__isoc99_scanf(PLT)
	adds	r4, r4, #1
.L4:
	cmp	r4, #3
	ble	.L5
	movs	r0, #10
	bl	putchar(PLT)
	add	r3, r7, #32
	str	r3, [r7, #64]
	ldr	r3, [r7, #64]
	vld1.32	{d16-d17}, [r3]
	ldr	r3, .L8+20
	ldr	r3, [r5, r3]
	vst1.64	{d16-d17}, [r3:64]
	mov	r3, r7
	str	r3, [r7, #68]
	ldr	r3, [r7, #68]
	vld1.32	{d16-d17}, [r3]
	ldr	r3, .L8+24
	ldr	r3, [r5, r3]
	vst1.64	{d16-d17}, [r3:64]
	nop
	adds	r7, r7, #72
	mov	sp, r7
	@ sp needed
	pop	{r4, r5, r7, pc}
.L9:
	.align	2
.L8:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC4+4)
	.word	.LC0-(.LPIC0+4)
	.word	.LC1-(.LPIC1+4)
	.word	.LC2-(.LPIC2+4)
	.word	.LC1-(.LPIC3+4)
	.word	aa(GOT)
	.word	bb(GOT)
	.size	read_inputs, .-read_inputs
	.section	.rodata
	.align	2
.LC3:
	.ascii	"s[%i] = %i\012\000"
	.text
	.align	1
	.global	write_outputs
	.syntax unified
	.thumb
	.thumb_func
	.fpu neon
	.type	write_outputs, %function
write_outputs:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	sub	sp, sp, #60
	add	r7, sp, #0
	ldr	r2, .L13
.LPIC5:
	add	r2, pc
	ldr	r3, .L13+4
	ldr	r3, [r2, r3]
	vld1.64	{d16-d17}, [r3:64]
	mov	r3, r7
	str	r3, [r7, #52]
	vstr	d16, [r7, #32]
	vstr	d17, [r7, #40]
	vldr	d16, [r7, #32]
	vldr	d17, [r7, #40]
	ldr	r3, [r7, #52]
	vst1.32	{d16-d17}, [r3]
	movs	r4, #0
	b	.L11
.L12:
	lsls	r3, r4, #2
	add	r2, r7, #56
	add	r3, r3, r2
	ldr	r3, [r3, #-56]
	mov	r2, r3
	mov	r1, r4
	ldr	r3, .L13+8
.LPIC6:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	adds	r4, r4, #1
.L11:
	cmp	r4, #3
	ble	.L12
	nop
	adds	r7, r7, #60
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
.L14:
	.align	2
.L13:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC5+4)
	.word	ss(GOT)
	.word	.LC3-(.LPIC6+4)
	.size	write_outputs, .-write_outputs
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.fpu neon
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	sub	sp, sp, #36
	add	r7, sp, #0
	ldr	r4, .L18
.LPIC7:
	add	r4, pc
	bl	read_inputs(PLT)
	ldr	r3, .L18+4
	ldr	r3, [r4, r3]
	vld1.64	{d18-d19}, [r3:64]
	ldr	r3, .L18+8
	ldr	r3, [r4, r3]
	vld1.64	{d16-d17}, [r3:64]
	vstr	d18, [r7, #16]
	vstr	d19, [r7, #24]
	vst1.64	{d16-d17}, [r7:64]
	vldr	d18, [r7, #16]
	vldr	d19, [r7, #24]
	vld1.64	{d16-d17}, [r7:64]
	vadd.i32	q8, q9, q8
	ldr	r3, .L18+12
	ldr	r3, [r4, r3]
	vst1.64	{d16-d17}, [r3:64]
	bl	write_outputs(PLT)
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #36
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
.L19:
	.align	2
.L18:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC7+4)
	.word	aa(GOT)
	.word	bb(GOT)
	.word	ss(GOT)
	.size	main, .-main
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
