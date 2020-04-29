	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"lookUpCode.c"
	.text
	.align	2
	.global	lu_sin
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	lu_sin, %function
lu_sin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	lsl	r0, r0, #23
	ldr	r3, .L3
	lsr	r0, r0, #23
	lsl	r0, r0, #1
	ldrsh	r0, [r3, r0]
	bx	lr
.L4:
	.align	2
.L3:
	.word	sin_lut
	.size	lu_sin, .-lu_sin
	.align	2
	.global	lu_cos
	.syntax unified
	.arm
	.fpu softvfp
	.type	lu_cos, %function
lu_cos:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r0, r0, #128
	lsl	r0, r0, #23
	ldr	r3, .L6
	lsr	r0, r0, #23
	lsl	r0, r0, #1
	ldrsh	r0, [r3, r0]
	bx	lr
.L7:
	.align	2
.L6:
	.word	sin_lut
	.size	lu_cos, .-lu_cos
	.ident	"GCC: (devkitARM release 53) 9.1.0"
