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
	mov	ip, #1
	mov	lr, #0
	mov	r0, #32
	ldr	r2, .L4
	ldr	r3, .L4+4
	ldr	r1, [r2]
	ldr	r2, [r3]
	ldr	r3, .L4+8
	add	r1, r1, #64
	add	r2, r2, #104
	str	lr, [r3, #44]
	str	lr, [r3, #36]
	str	r1, [r3, #8]
	str	r2, [r3, #12]
	str	ip, [r3, #20]
	str	ip, [r3, #16]
	str	r0, [r3, #28]
	str	r0, [r3, #24]
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	vOff
	.word	hOff
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L7
	ldr	r2, [r1, #4]
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	ip, [r1, #36]
	ldr	r3, [r1, #44]
	ldr	r0, .L7+4
	ldr	r1, [r1]
	add	r3, r3, ip, lsl #5
	lsl	r3, r3, #2
	strh	r2, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	bx	lr
.L8:
	.align	2
.L7:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L22
	ldr	r3, [r2]
	add	r3, r3, #1
	push	{r4, r5, lr}
	str	r3, [r2]
	ldr	r3, .L22+4
	ldrh	r2, [r3, #48]
	ldr	r1, .L22+8
	ldr	r3, .L22+12
	tst	r2, #32
	ldr	r0, [r1]
	ldr	r2, [r3, #12]
	bne	.L10
	ldr	ip, [r3, #4]
	cmp	ip, #0
	ble	.L10
	mvn	lr, r0
	cmp	ip, #119
	lsr	lr, lr, #31
	movgt	lr, #0
	ldr	ip, [r3, #20]
	cmp	lr, #0
	sub	r2, r2, ip
	subne	r0, r0, #1
	str	r2, [r3, #12]
	strne	r0, [r1]
.L10:
	ldr	ip, .L22+4
	ldrh	ip, [ip, #48]
	tst	ip, #16
	bne	.L11
	ldr	ip, [r3, #24]
	add	ip, r2, ip
	cmp	ip, #512
	blt	.L21
.L11:
	ldr	r1, .L22+4
	ldrh	r1, [r1, #48]
	ldr	lr, .L22+16
	tst	r1, #64
	ldr	ip, [lr]
	ldr	r1, [r3, #8]
	bne	.L12
	ldr	r4, [r3]
	cmp	r4, #0
	ble	.L12
	mvn	r5, ip
	cmp	r4, #79
	lsr	r5, r5, #31
	movgt	r5, #0
	ldr	r4, [r3, #16]
	cmp	r5, #0
	sub	r1, r1, r4
	subne	ip, ip, #1
	str	r1, [r3, #8]
	strne	ip, [lr]
.L12:
	ldr	r4, .L22+4
	ldrh	r4, [r4, #48]
	tst	r4, #128
	bne	.L13
	ldr	r4, [r3, #28]
	add	r4, r1, r4
	cmp	r4, #255
	bgt	.L13
	ldr	r4, [r3, #16]
	cmp	ip, #95
	add	r1, r1, r4
	str	r1, [r3, #8]
	bgt	.L13
	ldr	r4, [r3]
	cmp	r4, #80
	addgt	ip, ip, #1
	strgt	ip, [lr]
.L13:
	sub	r1, r1, ip
	sub	r2, r2, r0
	stm	r3, {r1, r2}
	pop	{r4, r5, lr}
	bx	lr
.L21:
	ldr	ip, [r3, #20]
	cmp	r0, #272
	add	r2, r2, ip
	str	r2, [r3, #12]
	bge	.L11
	ldr	ip, [r3, #4]
	cmp	ip, #120
	addgt	r0, r0, #1
	strgt	r0, [r1]
	b	.L11
.L23:
	.align	2
.L22:
	.word	playerTimer
	.word	67109120
	.word	hOff
	.word	player
	.word	vOff
	.size	updatePlayer, .-updatePlayer
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
	ldr	r4, .L28
	ldr	r5, .L28+4
	ldr	r8, .L28+8
	ldr	r7, .L28+12
	add	r6, r4, #360
.L25:
	mov	lr, pc
	bx	r5
	smull	r3, r2, r8, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #7
	rsb	r2, r3, r3, lsl #4
	rsb	r3, r3, r2, lsl #5
	sub	r0, r0, r3
	add	r0, r0, #5
	str	r0, [r4, #8]
	mov	lr, pc
	bx	r5
	mov	r2, #1
	mov	r1, #0
	smull	r3, ip, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, ip, asr #3
	rsb	ip, r3, r3, lsl #3
	rsb	r3, r3, ip, lsl #3
	sub	r0, r0, r3, lsl #2
	add	r0, r0, #5
	str	r9, [r4, #20]
	str	r9, [r4, #16]
	str	r0, [r4, #12]
	str	r1, [r4, #28]
	str	r2, [r4, #24]
	str	r2, [r4, #32]
	add	r4, r4, #36
	cmp	r4, r6
	bne	.L25
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	paper
	.word	rand
	.word	1147715687
	.word	156180629
	.size	initPaper, .-initPaper
	.align	2
	.global	drawPaper
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPaper, %function
drawPaper:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #512
	ldr	r2, .L37
	ldr	r1, .L37+4
	ldr	r3, .L37+8
	ldr	r7, [r2]
	ldr	r6, [r1]
	ldr	r2, .L37+12
	ldr	r5, .L37+16
	add	ip, r3, #360
.L34:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	beq	.L33
	ldr	lr, [r3, #24]
	ldr	r1, [r3, #28]
	ldr	r0, [r3, #4]
	ldr	r8, [r3, #12]
	add	r1, r1, lr, lsl #5
	ldr	lr, [r3]
	lsl	r1, r1, #2
	orr	r0, r0, r5
	cmp	r8, r6
	strh	r1, [r2, #12]	@ movhi
	strh	r0, [r2, #10]	@ movhi
	strh	lr, [r2, #8]	@ movhi
	blt	.L33
	ldr	r1, [r3, #8]
	cmp	r1, r7
	bge	.L32
.L33:
	strh	r4, [r2, #8]	@ movhi
.L32:
	add	r3, r3, #36
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L34
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	hOff
	.word	vOff
	.word	paper
	.word	shadowOAM
	.word	-32768
	.size	drawPaper, .-drawPaper
	.align	2
	.global	updatePaper
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePaper, %function
updatePaper:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	fp, #0
	ldr	r4, .L50
	ldr	r5, .L50+4
	ldr	r9, .L50+8
	ldr	r8, .L50+12
	ldr	r7, .L50+16
	ldr	r10, .L50+20
	sub	sp, sp, #20
	add	r6, r4, #360
.L41:
	add	r0, r4, #16
	ldm	r0, {r0, r1}
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #8]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #24
	ldr	r1, [r5, #8]
	ldm	r2, {r2, r3}
	ldr	r0, [r5, #12]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	ldr	ip, [r8]
	ldr	r1, [r7]
	beq	.L40
	ldr	r3, [r4, #32]
	cmp	r3, #0
	ldrne	r3, [r10]
	addne	r3, r3, #1
	strne	fp, [r4, #32]
	strne	r3, [r10]
.L40:
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #8]
	sub	r2, r2, ip
	sub	r3, r3, r1
	stm	r4, {r2, r3}
	add	r4, r4, #36
	cmp	r4, r6
	bne	.L41
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L51:
	.align	2
.L50:
	.word	paper
	.word	player
	.word	collision
	.word	vOff
	.word	hOff
	.word	TPCollected
	.size	updatePaper, .-updatePaper
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
	mov	r5, #96
	mov	lr, #9
	mov	r4, #0
	mov	r1, #1
	mov	r2, #32
	mov	r0, #113
	mov	ip, #160
	ldr	r3, .L54
	str	r5, [r3]
	ldr	r3, .L54+4
	str	lr, [r3]
	ldr	r3, .L54+8
	str	r4, [r3, #44]
	str	r4, [r3, #36]
	str	r0, [r3, #12]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r2, [r3, #28]
	str	r2, [r3, #24]
	str	ip, [r3, #8]
	bl	initPaper
	ldr	r0, .L54+12
	ldr	r1, .L54+16
	ldr	r2, .L54+20
	ldr	r3, .L54+24
	str	r4, [r0]
	str	r4, [r1]
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	vOff
	.word	hOff
	.word	player
	.word	TPCollected
	.word	won
	.word	lost
	.word	playerTimer
	.size	initGame, .-initGame
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updatePaper
	pop	{r4, lr}
	b	updatePlayer
	.size	updateGame, .-updateGame
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L60
	ldr	r2, [r1, #4]
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	ip, [r1, #36]
	ldr	r3, [r1, #44]
	ldr	r0, .L60+4
	ldr	r1, [r1]
	add	r3, r3, ip, lsl #5
	lsl	r3, r3, #2
	push	{r4, lr}
	strh	r2, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	bl	drawPaper
	mov	r3, #67108864
	ldr	r2, .L60+8
	ldrh	r1, [r2]
	ldr	r2, .L60+12
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L61:
	.align	2
.L60:
	.word	player
	.word	shadowOAM
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
	.comm	playerTimer,4,4
	.comm	player,56,4
	.comm	paper,360,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
