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
	mov	r2, #0
	push	{r4, lr}
	mov	ip, #32
	mov	lr, #1
	mov	r0, #155
	mov	r1, #200
	mov	r4, #3
	ldr	r3, .L4
	str	r2, [r3]
	ldr	r3, .L4+4
	str	r2, [r3, #44]
	str	r2, [r3, #36]
	ldr	r2, .L4+8
	str	lr, [r3, #20]
	str	lr, [r3, #16]
	str	r4, [r2]
	str	ip, [r3, #28]
	str	ip, [r3, #24]
	str	r0, [r3, #8]
	str	r0, [r3]
	str	r1, [r3, #12]
	str	r1, [r3, #4]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	hitflag
	.word	player
	.word	playerHealth
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
	ldr	r3, [r1, #4]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	ip, [r1, #36]
	ldr	r2, [r1, #44]
	ldr	r0, .L7+4
	ldrb	r1, [r1]	@ zero_extendqisi2
	add	r2, r2, ip, lsl #5
	lsl	r2, r2, #2
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
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
	ldr	r3, .L45
	ldrh	r2, [r3, #48]
	ldr	r3, .L45+4
	push	{r4, r5, r6, r7, r8, lr}
	ldr	lr, .L45+8
	tst	r2, #32
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	ldr	ip, [lr]
	bne	.L10
	ldr	r4, [r3, #28]
	cmp	r4, #0
	add	r0, r4, #3
	movge	r0, r4
	ldr	r5, [r3, #20]
	add	r0, r1, r0, asr #2
	sub	r5, r2, r5
	ldr	r6, .L45+12
	add	r0, r5, r0, lsl #10
	lsl	r0, r0, #1
	ldrh	r0, [r6, r0]
	cmp	r0, #0
	bne	.L41
.L10:
	ldr	r0, .L45
	ldrh	r0, [r0, #48]
	tst	r0, #16
	bne	.L11
	ldr	r5, [r3, #28]
	cmp	r5, #0
	add	r0, r5, #3
	movge	r0, r5
	ldr	r6, [r3, #24]
	ldr	r7, [r3, #20]
	add	r6, r2, r6
	add	r4, r6, r7
	add	r0, r1, r0, asr #2
	sub	r4, r4, #1
	ldr	r8, .L45+12
	add	r0, r4, r0, lsl #10
	lsl	r0, r0, #1
	ldrh	r0, [r8, r0]
	cmp	r0, #0
	bne	.L42
.L11:
	ldr	r0, .L45
	ldrh	r0, [r0, #48]
	ldr	r5, .L45+16
	tst	r0, #64
	ldr	r4, [r5]
	bne	.L12
	ldr	r0, [r3, #28]
	add	lr, r0, #3
	cmp	r0, #0
	movlt	r0, lr
	ldr	lr, [r3, #16]
	sub	lr, r1, lr
	add	r0, lr, r0, asr #2
	add	r6, r2, r0, lsl #10
	ldr	r7, .L45+12
	lsl	r6, r6, #1
	ldrh	r6, [r7, r6]
	cmp	r6, #0
	lsl	r0, r0, #10
	bne	.L43
.L12:
	ldr	r0, .L45
	ldrh	r0, [r0, #48]
	tst	r0, #128
	bne	.L13
	ldr	r6, [r3, #28]
	ldr	r7, [r3, #16]
	add	r6, r1, r6
	ldr	lr, [r3, #24]
	add	r0, r6, r7
	sub	r0, r0, #1
	add	lr, lr, r0, lsl #10
	ldr	r8, .L45+12
	add	lr, lr, r2
	add	lr, r8, lr, lsl #1
	ldrh	lr, [lr, #-2]
	cmp	lr, #0
	lsl	r0, r0, #10
	beq	.L13
	add	r0, r0, r2
	lsl	r0, r0, #1
	ldrh	r0, [r8, r0]
	cmp	r6, #255
	movgt	r6, #0
	movle	r6, #1
	cmp	r0, #0
	moveq	r6, #0
	cmp	r6, #0
	bne	.L44
.L13:
	sub	r1, r1, r4
	sub	r2, r2, ip
	stm	r3, {r1, r2}
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L43:
	ldr	r6, [r3, #24]
	add	r0, r0, r6
	add	r0, r0, r2
	add	r0, r7, r0, lsl #1
	ldrh	r0, [r0, #-2]
	cmp	r0, #0
	beq	.L12
	ldr	r0, [r3]
	cmp	r0, #0
	ble	.L12
	cmp	r0, #79
	movgt	r0, #0
	movle	r0, #1
	cmp	r4, #0
	movlt	r0, #0
	cmp	r0, #0
	subne	r4, r4, #1
	mov	r1, lr
	str	lr, [r3, #8]
	strne	r4, [r5]
	b	.L12
.L42:
	add	r5, r5, r1
	sub	r5, r5, #1
	add	r5, r4, r5, lsl #10
	lsl	r5, r5, #1
	ldrh	r0, [r8, r5]
	cmp	r0, #0
	cmpne	r6, #1024
	bge	.L11
	ldr	r0, .L45+20
	add	r2, r2, r7
	cmp	ip, r0
	str	r2, [r3, #12]
	bgt	.L11
	ldr	r5, .L45+24
	ldr	r4, [r5]
	cmp	r4, r0
	bgt	.L11
	ldr	r0, [r3, #4]
	cmp	r0, #120
	addgt	r4, r4, #1
	addgt	ip, ip, #1
	strgt	r4, [r5]
	strgt	ip, [lr]
	b	.L11
.L41:
	add	r0, r4, r1
	sub	r0, r0, #1
	add	r0, r5, r0, lsl #10
	lsl	r0, r0, #1
	ldrh	r0, [r6, r0]
	cmp	r0, #0
	beq	.L10
	ldr	r0, [r3, #4]
	cmp	r0, #0
	ble	.L10
	ldr	r4, .L45+24
	ldr	r2, [r4]
	mvn	r6, r2
	cmp	r0, #119
	lsr	r6, r6, #31
	movgt	r6, #0
	cmp	r6, #0
	subne	r2, r2, #1
	subne	ip, ip, #1
	strne	r2, [r4]
	str	r5, [r3, #12]
	mov	r2, r5
	strne	ip, [lr]
	b	.L10
.L44:
	add	r1, r1, r7
	cmp	r4, #95
	str	r1, [r3, #8]
	bgt	.L13
	ldr	r0, [r3]
	cmp	r0, #80
	addgt	r4, r4, #1
	strgt	r4, [r5]
	b	.L13
.L46:
	.align	2
.L45:
	.word	67109120
	.word	player
	.word	playerHoff
	.word	collisionBitmapBitmap
	.word	vOff
	.word	782
	.word	hOff
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
	push	{r4, lr}
	mov	r2, #64
	mov	r1, #32
	mov	r4, #0
	mov	lr, #5
	mov	ip, #1
	ldr	r3, .L51
	add	r0, r3, #1072
	add	r0, r0, #8
.L48:
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r4, [r3, #28]
	str	lr, [r3, #24]
	str	ip, [r3, #32]
	add	r3, r3, #36
	cmp	r3, r0
	add	r2, r2, #128
	bne	.L48
	pop	{r4, lr}
	bx	lr
.L52:
	.align	2
.L51:
	.word	paper
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
	ldr	r2, .L61
	ldr	r1, .L61+4
	ldr	r3, .L61+8
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, [r2]
	ldr	r5, [r1]
	add	lr, r3, #1072
	mov	r4, #512
	ldr	r2, .L61+12
	ldr	r7, .L61+16
	ldr	r6, .L61+20
	add	r9, r5, #160
	add	r10, r8, #240
	add	lr, lr, #8
	b	.L57
.L54:
	ldr	fp, [r3, #24]
	ldr	r0, [r3, #4]
	ldr	r1, [r3, #28]
	ldr	ip, [r3, #12]
	add	r1, r1, fp, lsl #5
	and	r0, r0, r7
	ldrb	fp, [r3]	@ zero_extendqisi2
	orr	r0, r0, r6
	lsl	r1, r1, #2
	cmp	ip, r5
	strh	r0, [r2, #10]	@ movhi
	strh	r1, [r2, #12]	@ movhi
	strh	fp, [r2, #8]	@ movhi
	blt	.L56
	ldr	r1, [r3, #8]
	cmp	r1, r8
	blt	.L56
	cmp	ip, r9
	bgt	.L56
	cmp	ip, r10
	bgt	.L56
	add	r3, r3, #36
	cmp	r3, lr
	add	r2, r2, #8
	beq	.L60
.L57:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	bne	.L54
.L56:
	add	r3, r3, #36
	cmp	r3, lr
	strh	r4, [r2, #8]	@ movhi
	add	r2, r2, #8
	bne	.L57
.L60:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	hOff
	.word	vOff
	.word	paper
	.word	shadowOAM
	.word	511
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
	ldr	r4, .L75
	add	r7, r4, #1072
	ldr	r5, .L75+4
	ldr	fp, .L75+8
	ldr	r6, .L75+12
	ldr	r10, .L75+16
	ldr	r9, .L75+20
	ldr	r8, .L75+24
	sub	sp, sp, #20
	add	r7, r7, #8
	b	.L67
.L74:
	ldr	r1, [r6]
.L65:
	ldr	r3, [r10]
	cmp	r3, r1
	moveq	r2, #1
	ldreq	r3, .L75+28
	ldr	ip, [r9]
	streq	r2, [r3]
	ldr	r0, [r8]
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #8]
	sub	r2, r2, ip
	sub	r3, r3, r0
	stm	r4, {r2, r3}
	add	r4, r4, #36
	cmp	r4, r7
	beq	.L73
.L67:
	add	r0, r4, #16
	ldm	r0, {r0, r1}
	ldm	r4, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	beq	.L74
	ldr	r3, [r4, #32]
	cmp	r3, #0
	movne	r3, #0
	ldr	r1, [r6]
	addne	r1, r1, #1
	strne	r1, [r6]
	strne	r3, [r4, #32]
	b	.L65
.L73:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L76:
	.align	2
.L75:
	.word	paper
	.word	player
	.word	collision
	.word	TPCollected
	.word	totalPaper
	.word	vOff
	.word	hOff
	.word	won
	.size	updatePaper, .-updatePaper
	.align	2
	.global	initCustomer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCustomer, %function
initCustomer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #32
	push	{r4, r5, lr}
	mov	r1, #64
	mov	ip, r2
	mov	r5, #4
	mov	r0, #0
	mov	r4, #1
	mov	lr, #3
	ldr	r3, .L81
.L78:
	str	r1, [r3, #8]
	str	r2, [r3, #12]
	str	r1, [r3, #4]
	str	r5, [r3, #32]
	str	r0, [r3, #28]
	str	ip, [r3, #20]
	str	ip, [r3, #16]
	str	r4, [r3, #36]
	str	lr, [r3, #24]
	str	r0, [r3, #40]
	str	r2, [r3], #44
	add	r2, r2, #16
	cmp	r2, #192
	add	r1, r1, #128
	bne	.L78
	pop	{r4, r5, lr}
	bx	lr
.L82:
	.align	2
.L81:
	.word	customers
	.size	initCustomer, .-initCustomer
	.align	2
	.global	drawCustomer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCustomer, %function
drawCustomer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #512
	ldr	r2, .L90
	ldr	r3, .L90+4
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	lr, [r2]
	ldr	r6, [r3]
	ldr	r3, .L90+8
	ldr	r2, .L90+12
	ldr	r5, .L90+16
	ldr	r4, .L90+20
	add	r8, lr, #160
	add	r7, r6, #240
	add	r0, r3, #440
.L87:
	ldr	r1, [r3, #36]
	cmp	r1, #0
	beq	.L86
	ldr	r9, [r3, #4]
	ldr	r10, [r3, #28]
	ldr	r1, [r3, #32]
	and	r9, r9, r5
	add	r1, r1, r10, lsl #5
	orr	r9, r9, r4
	ldr	r10, [r3, #12]
	strh	r9, [r2, #2]	@ movhi
	ldrb	r9, [r3]	@ zero_extendqisi2
	lsl	r1, r1, #2
	cmp	r10, lr
	strh	r1, [r2, #4]	@ movhi
	strh	r9, [r2]	@ movhi
	blt	.L86
	ldr	r1, [r3, #8]
	cmp	r1, r6
	blt	.L86
	cmp	r1, r7
	bgt	.L86
	cmp	r10, r8
	ble	.L85
.L86:
	strh	ip, [r2]	@ movhi
.L85:
	add	r3, r3, #44
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L87
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L91:
	.align	2
.L90:
	.word	vOff
	.word	hOff
	.word	customers
	.word	shadowOAM+400
	.word	511
	.word	-32768
	.size	drawCustomer, .-drawCustomer
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_dadd
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	updateCustomer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCustomer, %function
updateCustomer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #2
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r2, .L116
	ldr	r10, .L116+4
	str	r3, [r2]
	ldr	fp, .L116+8
	ldr	r9, .L116+12
	ldr	r8, .L116+16
	sub	sp, sp, #28
	b	.L100
.L98:
	ldr	r3, .L116+20
	ldr	r2, [r10, #12]
	ldr	r1, [r3]
	sub	r2, r2, r1
	ldr	r1, .L116+24
	ldr	r3, [r10, #8]
	ldr	r1, [r1]
	sub	r3, r3, r1
	stm	r10, {r2, r3}
	ldr	r3, .L116+28
	add	r10, r10, #44
	cmp	r10, r3
	beq	.L115
.L100:
	ldr	r3, [r10, #4]
	ldr	r0, [fp, #4]
	sub	r0, r0, r3
	mov	lr, pc
	bx	r9
	mov	r7, r1
	mov	r6, r0
	ldr	r3, [r10]
	ldr	r2, .L116+32
	ldr	r0, [fp]
	stm	r2, {r6-r7}
	sub	r0, r0, r3
	mov	lr, pc
	bx	r9
	mov	r4, r0
	mov	r5, r1
	ldr	r0, .L116+36
	mov	r3, r7
	stm	r0, {r4-r5}
	mov	r2, r6
	mov	r1, r7
	mov	r0, r6
	mov	lr, pc
	bx	r8
	mov	r2, r4
	mov	r3, r5
	mov	r4, r0
	mov	r5, r1
	mov	r0, r2
	mov	r1, r3
	mov	lr, pc
	bx	r8
	ldr	r7, .L116+40
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	mov	lr, pc
	bx	r7
	ldr	r3, .L116+44
	mov	lr, pc
	bx	r3
	mov	r4, r0
	mov	r5, r1
	ldr	r3, [r10, #40]
	cmp	r3, #0
	ldr	r3, .L116+48
	stm	r3, {r4-r5}
	beq	.L93
	ldr	r3, .L116+52
	ldr	r3, [r3]
	tst	r3, #1
	bne	.L93
	ldr	r3, .L116
	ldr	r0, [r3]
	mov	lr, pc
	bx	r9
	mov	r6, r0
	mov	r7, r1
	ldr	r1, .L116+32
	ldr	ip, .L116+56
	mov	r2, r4
	mov	r3, r5
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	ip
	mov	r2, r6
	mov	r3, r7
	str	r6, [sp, #16]
	str	r7, [sp, #20]
	mov	lr, pc
	bx	r8
	mov	r6, r0
	ldr	r0, [r10, #8]
	mov	r7, r1
	mov	lr, pc
	bx	r9
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	ldr	r7, .L116+40
	mov	lr, pc
	bx	r7
	ldr	r3, .L116+60
	mov	r6, r3
	mov	lr, pc
	bx	r3
	str	r0, [r10, #8]
	ldr	r0, .L116+36
	ldr	ip, .L116+56
	mov	r2, r4
	mov	r3, r5
	ldmia	r0, {r0-r1}
	mov	lr, pc
	bx	ip
	add	r3, sp, #16
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r8
	mov	r4, r0
	ldr	r0, [r10, #12]
	mov	r5, r1
	mov	lr, pc
	bx	r9
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	str	r0, [r10, #12]
.L93:
	ldr	r3, [r10, #20]
	ldr	r2, [fp, #24]
	cmp	r3, #0
	add	ip, r3, #3
	movge	lr, r3
	movlt	lr, ip
	cmp	r2, #0
	add	r1, r2, #3
	movge	r1, r2
	ldr	ip, [r10, #4]
	add	r3, r3, r3, lsr #31
	asr	r3, r3, #1
	add	ip, ip, lr, asr #2
	ldr	r0, [fp, #4]
	str	r3, [sp, #8]
	ldr	lr, [r10, #16]
	ldr	r3, [r10]
	add	r2, r2, r2, lsr #31
	str	ip, [sp]
	str	r3, [sp, #4]
	add	r0, r0, r1, asr #2
	str	lr, [sp, #12]
	ldr	r3, [fp, #28]
	ldr	r1, [fp]
	ldr	ip, .L116+64
	asr	r2, r2, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L95
	ldr	r3, [r10, #36]
	cmp	r3, #0
	beq	.L95
	mov	r2, #0
	ldr	r1, .L116+68
	ldr	r3, [r1]
	sub	r3, r3, #1
	cmp	r3, r2
	str	r3, [r1]
	ldr	r3, .L116+72
	str	r2, [r3]
	moveq	r3, #1
	ldreq	r2, .L116+76
	streq	r3, [r2]
.L95:
	ldr	r3, .L116+80
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L98
	ldr	r3, .L116+84
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L98
	ldr	lr, [r10, #16]
	ldr	ip, [r10, #20]
	add	r2, fp, #24
	ldm	r2, {r2, r3}
	ldr	r1, [fp]
	ldr	r0, [fp, #4]
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	lr, [r10]
	ldr	ip, [r10, #4]
	add	r3, r3, #30
	stm	sp, {ip, lr}
	add	r2, r2, #30
	ldr	ip, .L116+64
	sub	r1, r1, #15
	sub	r0, r0, #15
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L98
	ldr	r3, [r10, #36]
	cmp	r3, #0
	beq	.L98
	mov	r2, #1
	ldr	r3, [r10, #24]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r10, #24]
	str	r2, [r10, #40]
	streq	r3, [r10, #36]
	b	.L98
.L115:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L117:
	.align	2
.L116:
	.word	speed
	.word	customers
	.word	player
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	vOff
	.word	hOff
	.word	customers+440
	.word	dx
	.word	dy
	.word	__aeabi_dadd
	.word	sqrt
	.word	distance
	.word	timer
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.word	collision
	.word	playerHealth
	.word	hitflag
	.word	lost
	.word	oldButtons
	.word	buttons
	.size	updateCustomer, .-updateCustomer
	.align	2
	.global	initSanitizer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSanitizer, %function
initSanitizer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, lr}
	mov	r1, #64
	mov	r4, r2
	mov	r0, #16
	mov	lr, #12
	mov	ip, #1
	ldr	r3, .L122
.L119:
	str	r2, [r3, #12]
	add	r2, r2, #16
	cmp	r2, #80
	str	r1, [r3, #8]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	lr, [r3, #24]
	str	r4, [r3, #28]
	str	ip, [r3, #32]
	add	r1, r1, #128
	add	r3, r3, #36
	bne	.L119
	pop	{r4, lr}
	bx	lr
.L123:
	.align	2
.L122:
	.word	sanitizer
	.size	initSanitizer, .-initSanitizer
	.align	2
	.global	drawSanitizer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSanitizer, %function
drawSanitizer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	lr, #512
	ldr	r2, .L132
	ldr	r3, .L132+4
	ldr	r4, [r2]
	ldr	r6, [r3]
	ldr	r3, .L132+8
	ldr	r2, .L132+12
	ldr	r5, .L132+16
	add	r7, r4, #160
	add	r8, r6, #240
	add	ip, r3, #180
.L128:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	beq	.L127
	ldr	r0, [r3, #4]
	ldr	r9, [r3, #24]
	ldr	r1, [r3, #28]
	and	r0, r0, r5
	add	r1, r1, r9, lsl #5
	orr	r0, r0, #16384
	ldr	r9, [r3, #12]
	strh	r0, [r2, #2]	@ movhi
	ldrb	r0, [r3]	@ zero_extendqisi2
	lsl	r1, r1, #1
	cmp	r9, r4
	strh	r1, [r2, #4]	@ movhi
	strh	r0, [r2]	@ movhi
	blt	.L127
	ldr	r1, [r3, #8]
	cmp	r1, r6
	blt	.L127
	cmp	r9, r7
	ble	.L131
.L127:
	strh	lr, [r2]	@ movhi
.L126:
	add	r3, r3, #36
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L128
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L131:
	cmp	r9, r8
	bgt	.L127
	b	.L126
.L133:
	.align	2
.L132:
	.word	vOff
	.word	hOff
	.word	sanitizer
	.word	shadowOAM+800
	.word	511
	.size	drawSanitizer, .-drawSanitizer
	.align	2
	.global	updateSanitizer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSanitizer, %function
updateSanitizer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	fp, #0
	ldr	r4, .L145
	ldr	r5, .L145+4
	ldr	r9, .L145+8
	ldr	r8, .L145+12
	ldr	r7, .L145+16
	ldr	r10, .L145+20
	sub	sp, sp, #20
	add	r6, r4, #180
.L136:
	add	r0, r4, #16
	ldm	r0, {r0, r1}
	ldm	r4, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #24
	ldr	r1, [r5]
	ldm	r2, {r2, r3}
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	ldr	ip, [r8]
	ldr	r1, [r7]
	beq	.L135
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L135
	ldr	r3, [r10]
	cmp	r3, #3
	addle	r3, r3, #1
	strle	r3, [r10]
	strle	fp, [r4, #32]
.L135:
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	sub	r2, r2, ip
	sub	r3, r3, r1
	str	r2, [r4, #4]
	str	r3, [r4], #36
	cmp	r4, r6
	bne	.L136
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L146:
	.align	2
.L145:
	.word	sanitizer
	.word	player
	.word	collision
	.word	hOff
	.word	vOff
	.word	playerHealth
	.size	updateSanitizer, .-updateSanitizer
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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #0
	mov	r8, #1
	mov	r7, #32
	mov	r10, #155
	mov	r9, #200
	mov	fp, #3
	bl	initCustomer
	mov	r4, r6
	mov	lr, r8
	mov	r1, r7
	mov	r2, #64
	mov	ip, #5
	ldr	r5, .L153
	str	r6, [r5]
	ldr	r5, .L153+4
	ldr	r3, .L153+8
	str	r10, [r5]
	str	r6, [r5, #44]
	str	r6, [r5, #36]
	str	r8, [r5, #20]
	str	r8, [r5, #16]
	str	r7, [r5, #28]
	str	r7, [r5, #24]
	str	r10, [r5, #8]
	str	r9, [r5, #12]
	str	r9, [r5, #4]
	ldr	r5, .L153+12
	add	r0, r3, #1072
	str	fp, [r5]
	add	r0, r0, #8
.L148:
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r4, [r3, #28]
	str	ip, [r3, #24]
	str	lr, [r3, #32]
	add	r3, r3, #36
	cmp	r3, r0
	add	r2, r2, #128
	bne	.L148
	mov	r2, #0
	mov	r1, #64
	mov	ip, r2
	mov	r0, #16
	mov	r4, #12
	mov	lr, #1
	ldr	r3, .L153+16
.L149:
	str	r2, [r3, #12]
	add	r2, r2, #16
	cmp	r2, #80
	str	r1, [r3, #8]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r4, [r3, #24]
	str	ip, [r3, #28]
	str	lr, [r3, #32]
	add	r1, r1, #128
	add	r3, r3, #36
	bne	.L149
	mov	r0, #77
	mov	r3, #100
	mov	r1, #28
	mov	lr, #10
	ldr	r2, .L153+20
	str	r0, [r2]
	ldr	r2, .L153+24
	ldr	r0, .L153+28
	str	r3, [r2]
	str	r3, [r0]
	ldr	r2, .L153+32
	ldr	r3, .L153+36
	str	r1, [r2]
	str	lr, [r3]
	ldr	r0, .L153+40
	ldr	r3, .L153+44
	ldr	r1, .L153+48
	ldr	r2, .L153+52
	str	ip, [r3]
	str	ip, [r0]
	str	ip, [r1]
	str	ip, [r2]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L154:
	.align	2
.L153:
	.word	hitflag
	.word	player
	.word	paper
	.word	playerHealth
	.word	sanitizer
	.word	vOff
	.word	hOff
	.word	playerHoff
	.word	screenBlock
	.word	totalPaper
	.word	TPCollected
	.word	timer
	.word	won
	.word	lost
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
	ldr	r1, .L172
	ldr	ip, .L172+4
	ldr	r3, [r1]
	ldr	r2, [ip]
	add	r3, r3, #1
	cmp	r2, #256
	push	{r4, lr}
	str	r3, [r1]
	ble	.L156
	ldr	r1, .L172+8
	ldr	r0, [r1]
	cmp	r0, #30
	bgt	.L164
	ldr	r3, .L172+12
	sub	r2, r2, #256
	add	r0, r0, #1
	str	r2, [ip]
	str	r0, [r1]
	add	r1, r3, #440
.L158:
	ldr	r2, [r3, #8]
	sub	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L158
	ldr	r3, .L172+16
	ldr	r1, [r3]
	cmp	r1, #0
	ble	.L166
	ldr	r3, .L172+20
	add	r1, r1, r1, lsl #3
	add	r1, r3, r1, lsl #2
.L160:
	ldr	r2, [r3, #8]
	sub	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L160
.L166:
	mov	r3, #67108864
	lsl	r0, r0, #24
	orr	r0, r0, #1073741824
	lsr	r0, r0, #16
	strh	r0, [r3, #8]	@ movhi
.L164:
	bl	updatePaper
	bl	updatePlayer
	bl	updateCustomer
	pop	{r4, lr}
	b	updateSanitizer
.L156:
	cmp	r2, #0
	bge	.L164
	ldr	r1, .L172+8
	ldr	r0, [r1]
	cmp	r0, #28
	ble	.L164
	ldr	r3, .L172+12
	add	r2, r2, #256
	sub	r0, r0, #1
	str	r2, [ip]
	str	r0, [r1]
	add	r1, r3, #440
.L162:
	ldr	r2, [r3, #8]
	add	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L162
	ldr	r3, .L172+16
	ldr	r1, [r3]
	cmp	r1, #0
	ble	.L166
	ldr	r3, .L172+20
	add	r1, r1, r1, lsl #3
	add	r1, r3, r1, lsl #2
.L165:
	ldr	r2, [r3, #8]
	add	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L165
	b	.L166
.L173:
	.align	2
.L172:
	.word	timer
	.word	hOff
	.word	screenBlock
	.word	customers
	.word	totalPaper
	.word	paper
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
	ldr	r1, .L176
	ldr	r3, [r1, #4]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	ip, [r1, #36]
	ldr	r2, [r1, #44]
	ldr	r0, .L176+4
	ldrb	r1, [r1]	@ zero_extendqisi2
	add	r2, r2, ip, lsl #5
	lsl	r2, r2, #2
	push	{r4, lr}
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	bl	drawPaper
	bl	drawCustomer
	bl	drawSanitizer
	mov	r3, #67108864
	ldr	r2, .L176+8
	ldrh	r1, [r2]
	ldr	r2, .L176+12
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L177:
	.align	2
.L176:
	.word	player
	.word	shadowOAM
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
	.comm	heartCount,4,4
	.comm	distance,8,8
	.comm	dy,8,8
	.comm	dx,8,8
	.comm	hitflag,4,4
	.comm	playerHealth,4,4
	.comm	speed,4,4
	.comm	timer,4,4
	.comm	sanitizer,180,4
	.comm	customers,440,4
	.comm	player,56,4
	.comm	paper,1080,4
	.comm	shadowOAM,1024,4
	.comm	totalPaper,4,4
	.comm	screenBlock,4,4
	.comm	playerHoff,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
