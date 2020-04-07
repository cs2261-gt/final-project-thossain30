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
	ldr	r2, .L34
	ldr	r3, [r2]
	add	r3, r3, #1
	push	{r4, r5, lr}
	str	r3, [r2]
	ldr	r2, .L34+4
	ldrh	r3, [r2, #48]
	tst	r3, #32
	ldr	r3, .L34+8
	beq	.L29
	ldr	lr, .L34+12
.L10:
	ldr	r2, .L34+4
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L12
	ldr	r2, [r3, #4]
	cmp	r2, #512
	bge	.L12
	ldr	r1, [lr]
	cmp	r1, #272
	movge	ip, #0
	movlt	ip, #1
	cmp	r2, #120
	movle	ip, #0
	ldr	r0, [r3, #12]
	ldr	r2, [r3, #20]
	cmp	ip, #0
	add	r2, r2, r0
	addne	r1, r1, #1
	str	r2, [r3, #12]
	strne	r1, [lr]
.L12:
	ldr	r0, .L34+4
	ldrh	r2, [r0, #48]
	ldr	r1, .L34+16
	tst	r2, #64
	ldr	ip, [r1]
	ldr	r2, [r3, #8]
	bne	.L14
	ldr	r4, [r3]
	cmp	r4, #0
	ble	.L14
	mvn	r5, ip
	cmp	r4, #79
	lsr	r5, r5, #31
	movgt	r5, #0
	ldr	r4, [r3, #16]
	cmp	r5, #0
	sub	r4, r2, r4
	moveq	r2, r4
	str	r4, [r3, #8]
	bne	.L33
.L14:
	ldr	r0, .L34+4
	ldrh	r0, [r0, #48]
	tst	r0, #128
	bne	.L16
	ldr	r0, [r3]
	cmp	r0, #255
	bgt	.L16
	cmp	r0, #80
	movgt	r0, #1
	movle	r0, #0
	cmp	ip, #95
	movgt	r0, #0
	ldr	r4, [r3, #16]
	cmp	r0, #0
	add	r2, r2, r4
	addne	ip, ip, #1
	str	r2, [r3, #8]
	strne	ip, [r1]
.L16:
	ldr	r0, [lr]
	ldr	r1, [r3, #12]
	sub	r2, r2, ip
	sub	r1, r1, r0
	str	r2, [r3]
	str	r1, [r3, #4]
	pop	{r4, r5, lr}
	bx	lr
.L29:
	ldr	r1, [r3, #4]
	cmp	r1, #0
	ldr	lr, .L34+12
	ble	.L10
	ldr	r0, [lr]
	mvn	r4, r0
	cmp	r1, #119
	lsr	r4, r4, #31
	movgt	r4, #0
	ldr	ip, [r3, #12]
	ldr	r1, [r3, #20]
	cmp	r4, #0
	sub	r1, ip, r1
	str	r1, [r3, #12]
	beq	.L10
	ldrh	r2, [r2, #48]
	sub	r0, r0, #1
	tst	r2, #16
	str	r0, [lr]
	streq	ip, [r3, #12]
	b	.L12
.L33:
	sub	ip, ip, #1
	str	ip, [r1]
	ldrh	r1, [r0, #48]
	tst	r1, #128
	movne	r2, r4
	streq	r2, [r3, #8]
	b	.L16
.L35:
	.align	2
.L34:
	.word	playerTimer
	.word	67109120
	.word	player
	.word	hOff
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
	ldr	r8, .L40
	ldr	r4, .L40+4
	ldr	r7, .L40+8
	ldr	r6, .L40+12
	add	r5, r8, #360
.L37:
	mov	lr, pc
	bx	r4
	smull	r3, r2, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	rsb	r2, r3, r3, lsl #5
	add	r3, r3, r2, lsl #2
	sub	r0, r0, r3, lsl #2
	add	r0, r0, #5
	str	r0, [r8, #8]
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
	str	r9, [r8, #20]
	str	r9, [r8, #16]
	str	r0, [r8, #12]
	str	r1, [r8, #28]
	str	r2, [r8, #24]
	str	r2, [r8, #32]
	add	r8, r8, #36
	cmp	r8, r5
	bne	.L37
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	paper
	.word	rand
	.word	274877907
	.word	-2004318071
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
	ldr	r3, .L50
	push	{r4, lr}
	ldr	r2, .L50+4
	ldr	r4, .L50+8
	add	ip, r3, #360
.L44:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	beq	.L43
	ldr	lr, [r3, #24]
	ldr	r1, [r3, #28]
	ldr	r0, [r3, #4]
	add	r1, r1, lr, lsl #5
	ldr	lr, [r3]
	lsl	r1, r1, #2
	orr	r0, r0, r4
	strh	r1, [r2, #12]	@ movhi
	strh	r0, [r2, #10]	@ movhi
	strh	lr, [r2, #8]	@ movhi
.L43:
	add	r3, r3, #36
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L44
	pop	{r4, lr}
	bx	lr
.L51:
	.align	2
.L50:
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
	ldr	r4, .L63
	ldr	r5, .L63+4
	ldr	r9, .L63+8
	ldr	r8, .L63+12
	ldr	r7, .L63+16
	ldr	r10, .L63+20
	sub	sp, sp, #20
	add	r6, r4, #360
.L54:
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
	beq	.L53
	ldr	r3, [r4, #32]
	cmp	r3, #0
	ldrne	r3, [r10]
	addne	r3, r3, #1
	strne	fp, [r4, #32]
	strne	r3, [r10]
.L53:
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #8]
	sub	r2, r2, ip
	sub	r3, r3, r1
	stm	r4, {r2, r3}
	add	r4, r4, #36
	cmp	r4, r6
	bne	.L54
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L64:
	.align	2
.L63:
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
	ldr	r3, .L67
	str	r5, [r3]
	ldr	r3, .L67+4
	str	lr, [r3]
	ldr	r3, .L67+8
	str	r4, [r3, #44]
	str	r4, [r3, #36]
	str	r0, [r3, #12]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r2, [r3, #28]
	str	r2, [r3, #24]
	str	ip, [r3, #8]
	bl	initPaper
	ldr	r0, .L67+12
	ldr	r1, .L67+16
	ldr	r2, .L67+20
	ldr	r3, .L67+24
	str	r4, [r0]
	str	r4, [r1]
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L68:
	.align	2
.L67:
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
	bl	updatePlayer
	pop	{r4, lr}
	b	updatePaper
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
	ldr	r1, .L73
	ldr	r2, [r1, #4]
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r0, [r1, #36]
	ldr	r3, [r1, #44]
	push	{r4, lr}
	ldr	r1, [r1]
	ldr	r4, .L73+4
	add	r3, r3, r0, lsl #5
	lsl	r3, r3, #2
	strh	r2, [r4, #2]	@ movhi
	strh	r1, [r4]	@ movhi
	strh	r3, [r4, #4]	@ movhi
	bl	drawPaper
	ldr	r3, .L73+8
	mov	lr, pc
	bx	r3
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r4, .L73+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L73+16
	ldrh	r1, [r2]
	ldr	r2, .L73+20
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L74:
	.align	2
.L73:
	.word	player
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
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
