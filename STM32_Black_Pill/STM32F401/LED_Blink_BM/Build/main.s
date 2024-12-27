	.cpu cortex-m4
	.arch armv7e-m
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.global	MODER_Size
	.data
	.align	2
	.type	MODER_Size, %object
	.size	MODER_Size, 4
MODER_Size:
	.word	2
	.global	ODR_Size
	.bss
	.align	2
	.type	ODR_Size, %object
	.size	ODR_Size, 4
ODR_Size:
	.space	4
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	ldr	r3, .L7
	movs	r2, #1
	str	r2, [r3]
	ldr	r3, .L7+4
	ldr	r3, [r3]
	ldr	r2, .L7+4
	orr	r3, r3, #4
	str	r3, [r2]
	ldr	r3, .L7+8
	ldr	r1, [r3]
	ldr	r3, .L7+12
	ldr	r2, [r3]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	movs	r2, #1
	lsl	r3, r2, r3
	ldr	r2, .L7+8
	orrs	r3, r3, r1
	str	r3, [r2]
	ldr	r3, .L7+16
	ldr	r1, [r3]
	ldr	r3, .L7
	ldr	r2, [r3]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	movs	r2, #1
	lsl	r3, r2, r3
	ldr	r2, .L7+16
	orrs	r3, r3, r1
	str	r3, [r2]
.L6:
	ldr	r3, .L7+16
	ldr	r1, [r3]
	ldr	r3, .L7
	ldr	r2, [r3]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	movs	r2, #1
	lsl	r3, r2, r3
	ldr	r2, .L7+16
	orrs	r3, r3, r1
	str	r3, [r2]
	movs	r3, #0
	str	r3, [r7, #4]
	b	.L2
.L3:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L2:
	ldr	r3, [r7, #4]
	ldr	r2, .L7+20
	cmp	r3, r2
	ble	.L3
	ldr	r3, .L7+16
	ldr	r1, [r3]
	ldr	r3, .L7
	ldr	r2, [r3]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	movs	r2, #1
	lsl	r3, r2, r3
	mvns	r3, r3
	ldr	r2, .L7+16
	ands	r3, r3, r1
	str	r3, [r2]
	movs	r3, #0
	str	r3, [r7, #4]
	b	.L4
.L5:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L4:
	ldr	r3, [r7, #4]
	ldr	r2, .L7+20
	cmp	r3, r2
	ble	.L5
	b	.L6
.L8:
	.align	2
.L7:
	.word	ODR_Size
	.word	1073887280
	.word	1073874944
	.word	MODER_Size
	.word	1073874964
	.word	999999
	.size	main, .-main
	.align	1
	.global	_exit
	.syntax unified
	.thumb
	.thumb_func
	.type	_exit, %function
_exit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
.L10:
	b	.L10
	.size	_exit, .-_exit
	.ident	"GCC: (GNU Arm Embedded Toolchain 10.3-2021.10) 10.3.1 20210824 (release)"
