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
	.file	"test_NEON.c"
	.text
	.align	1
	.p2align 2,,3
	.global	read_inputs
	.arch armv7-a
	.syntax unified
	.thumb
	.thumb_func
	.fpu neon
	.type	read_inputs, %function
read_inputs:
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	sub	sp, sp, #64
	ldr	r9, .L8
	movs	r4, #0
	ldr	r6, .L8+4
	mov	r8, sp
	ldr	r7, .L8+8
.LPIC0:
	add	r9, pc
.LPIC1:
	add	r6, pc
	mov	r5, r8
.LPIC4:
	add	r7, pc
.L2:
	mov	r1, r4
	mov	r0, r9
	bl	printf(PLT)
	adds	r4, r4, #1
	mov	r1, r5
	mov	r0, r6
	bl	__isoc99_scanf(PLT)
	cmp	r4, #4
	add	r5, r5, #4
	bne	.L2
	movs	r0, #10
	ldr	r9, .L8+12
	bl	putchar(PLT)
	add	r10, sp, #32
.LPIC2:
	add	r9, pc
	movs	r4, #0
	mov	r5, r10
.L3:
	mov	r1, r4
	mov	r0, r9
	bl	printf(PLT)
	adds	r4, r4, #1
	mov	r1, r5
	mov	r0, r6
	bl	__isoc99_scanf(PLT)
	cmp	r4, #4
	add	r5, r5, #4
	bne	.L3
	movs	r0, #10
	bl	putchar(PLT)
	ldr	r2, .L8+16
	vld1.32	{d18-d19}, [r8:64]
	ldr	r3, .L8+20
	ldr	r2, [r7, r2]
	vld1.32	{d16-d17}, [r10:64]
	vst1.64	{d18-d19}, [r2:64]
	ldr	r3, [r7, r3]
	vst1.64	{d16-d17}, [r3:64]
	add	sp, sp, #64
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L9:
	.align	2
.L8:
	.word	.LC0-(.LPIC0+4)
	.word	.LC1-(.LPIC1+4)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC4+4)
	.word	.LC2-(.LPIC2+4)
	.word	aa(GOT)
	.word	bb(GOT)
	.size	read_inputs, .-read_inputs
	.align	1
	.p2align 2,,3
	.global	write_outputs
	.syntax unified
	.thumb
	.thumb_func
	.fpu neon
	.type	write_outputs, %function
write_outputs:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L14
	ldr	r1, .L14+4
.LPIC5:
	add	r2, pc
	push	{r4, r5, r6, lr}
	sub	sp, sp, #32
	ldr	r2, [r2, r1]
	movs	r4, #0
	ldr	r6, .L14+8
	mov	r3, sp
	mov	r5, r3
	vld1.64	{d16-d17}, [r2:64]
.LPIC6:
	add	r6, pc
	vst1.32	{d16-d17}, [r3:64]
.L11:
	mov	r1, r4
	ldr	r2, [r5], #4
	mov	r0, r6
	adds	r4, r4, #1
	bl	printf(PLT)
	cmp	r4, #4
	bne	.L11
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, pc}
.L15:
	.align	2
.L14:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC5+4)
	.word	ss(GOT)
	.word	.LC3-(.LPIC6+4)
	.size	write_outputs, .-write_outputs
	.section	.text.startup,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.fpu neon
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	bl	read_inputs(PLT)
	ldr	r3, .L18
	ldr	r0, .L18+4
	ldr	r1, .L18+8
.LPIC7:
	add	r3, pc
	ldr	r2, .L18+12
	ldr	r0, [r3, r0]
	ldr	r1, [r3, r1]
	ldr	r3, [r3, r2]
	vld1.64	{d16-d17}, [r0:64]
	vld1.64	{d18-d19}, [r1:64]
	vadd.i32	q8, q8, q9
	vst1.64	{d16-d17}, [r3:64]
	bl	write_outputs(PLT)
	movs	r0, #0
	pop	{r3, pc}
.L19:
	.align	2
.L18:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC7+4)
	.word	aa(GOT)
	.word	bb(GOT)
	.word	ss(GOT)
	.size	main, .-main
	.comm	ss,16,8
	.comm	bb,16,8
	.comm	aa,16,8
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"a[%i] = \000"
	.space	3
.LC1:
	.ascii	"%i\000"
	.space	1
.LC2:
	.ascii	"b[%i] = \000"
	.space	3
.LC3:
	.ascii	"s[%i] = %i\012\000"
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
