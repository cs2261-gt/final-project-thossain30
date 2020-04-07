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
	.file	"game.c"
	.text
	.align	2
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #1
	mov	r0, #0
	mov	lr, #200
	mov	r1, #32
	mov	ip, #140
	ldr	r3, .L4
	str	lr, [r3, #8]
	str	r0, [r3, #44]
	str	r0, [r3, #36]
	str	ip, [r3, #12]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	r2, [r3, #52]
	str	r1, [r3, #28]
	str	r1, [r3, #24]
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initPaper
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPaper, %function
initPaper:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #32
	ldr	r8, .L10
	ldr	r4, .L10+4
	ldr	r7, .L10+8
	ldr	r6, .L10+12
	add	r5, r8, #280
.L7:
	mov	lr, pc
	bx	r4
	smull	r3, r2, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	rsb	r2, r3, r3, lsl #5
	add	r3, r3, r2, lsl #2
	sub	r0, r0, r3, lsl #2
	add	r0, r0, #5
	str	r0, [r8, #4]
	mov	lr, pc
	bx	r4
	mov	r2, #1
	mov	r1, #0
	smull	r3, ip, r6, r0
	asr	r3, r0, #31
	add	ip, ip, r0
	rsb	r3, r3, ip, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #4
	add	r0, r0, #5
	str	r9, [r8, #12]
	str	r9, [r8, #8]
	str	r0, [r8]
	str	r1, [r8, #20]
	str	r2, [r8, #16]
	str	r2, [r8, #24]
	add	r8, r8, #28
	cmp	r8, r5
	bne	.L7
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	paper
	.word	rand
	.word	274877907
	.word	-2004318071
	.size	initPaper, .-initPaper
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #1
	mov	r4, #0
	mov	ip, #200
	mov	r1, #32
	mov	r0, #140
	ldr	r3, .L14
	ldr	r5, .L14+4
	str	ip, [r3, #8]
	str	r4, [r3, #44]
	str	r4, [r3, #36]
	str	r0, [r3, #12]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	r2, [r3, #52]
	str	r1, [r3, #28]
	str	r1, [r3, #24]
	bl	initPaper
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L14+8
	ldr	r1, .L14+12
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L14+16
	ldr	r1, .L14+20
	mov	lr, pc
	bx	r5
	ldr	r0, .L14+24
	ldr	r1, .L14+28
	ldr	r2, .L14+32
	ldr	r3, .L14+36
	str	r4, [r0]
	str	r4, [r1]
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	player
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	TPCollected
	.word	won
	.word	lost
	.word	playerTimer
	.size	initGame, .-initGame
	.comm	playerTimer,4,4
	.comm	paper,280,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
