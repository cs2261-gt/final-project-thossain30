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
	ldr	r3, .L22
	ldrh	r2, [r3, #48]
	ldr	r1, .L22+4
	ldr	r3, .L22+8
	tst	r2, #32
	push	{r4, r5, lr}
	ldr	r2, [r3, #12]
	ldr	ip, [r1]
	bne	.L10
	ldr	r0, [r3, #4]
	cmp	r0, #0
	ble	.L10
	ldr	r4, .L22+12
	ldr	lr, [r4]
	mvn	r5, lr
	cmp	r0, #119
	lsr	r5, r5, #31
	movgt	r5, #0
	ldr	r0, [r3, #20]
	cmp	r5, #0
	sub	r2, r2, r0
	subne	lr, lr, #1
	subne	ip, ip, #1
	str	r2, [r3, #12]
	strne	lr, [r4]
	strne	ip, [r1]
.L10:
	ldr	r0, .L22
	ldrh	r0, [r0, #48]
	tst	r0, #16
	bne	.L11
	ldr	r0, [r3, #24]
	add	r0, r2, r0
	cmp	r0, #1024
	blt	.L21
.L11:
	ldr	r1, .L22
	ldrh	r1, [r1, #48]
	ldr	lr, .L22+16
	tst	r1, #64
	ldr	r0, [lr]
	ldr	r1, [r3, #8]
	bne	.L12
	ldr	r4, [r3]
	cmp	r4, #0
	ble	.L12
	mvn	r5, r0
	cmp	r4, #79
	lsr	r5, r5, #31
	movgt	r5, #0
	ldr	r4, [r3, #16]
	cmp	r5, #0
	sub	r1, r1, r4
	subne	r0, r0, #1
	str	r1, [r3, #8]
	strne	r0, [lr]
.L12:
	ldr	r4, .L22
	ldrh	r4, [r4, #48]
	tst	r4, #128
	bne	.L13
	ldr	r4, [r3, #28]
	add	r4, r1, r4
	cmp	r4, #255
	bgt	.L13
	ldr	r4, [r3, #16]
	cmp	r0, #95
	add	r1, r1, r4
	str	r1, [r3, #8]
	bgt	.L13
	ldr	r4, [r3]
	cmp	r4, #80
	addgt	r0, r0, #1
	strgt	r0, [lr]
.L13:
	sub	r1, r1, r0
	sub	r2, r2, ip
	stm	r3, {r1, r2}
	pop	{r4, r5, lr}
	bx	lr
.L21:
	ldr	lr, [r3, #20]
	ldr	r0, .L22+20
	add	r2, r2, lr
	cmp	ip, r0
	str	r2, [r3, #12]
	bgt	.L11
	ldr	r4, .L22+12
	ldr	lr, [r4]
	cmp	lr, r0
	bgt	.L11
	ldr	r0, [r3, #4]
	cmp	r0, #120
	addgt	lr, lr, #1
	addgt	ip, ip, #1
	strgt	lr, [r4]
	strgt	ip, [r1]
	b	.L11
.L23:
	.align	2
.L22:
	.word	67109120
	.word	playerHoff
	.word	player
	.word	hOff
	.word	vOff
	.word	782
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
	str	lr, [sp, #-4]!
	mov	r2, #64
	mov	r1, #32
	mov	lr, #0
	mov	ip, #5
	mov	r0, #1
	ldr	r3, .L28
.L25:
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	add	r2, r2, #128
	cmp	r2, #1344
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	lr, [r3, #28]
	str	ip, [r3, #24]
	str	r0, [r3, #32]
	add	r3, r3, #36
	bne	.L25
	ldr	lr, [sp], #4
	bx	lr
.L29:
	.align	2
.L28:
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
	mov	ip, #512
	ldr	r2, .L37
	ldr	r3, .L37+4
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	lr, [r2]
	ldr	r6, [r3]
	ldr	r3, .L37+8
	ldr	r2, .L37+12
	ldr	r5, .L37+16
	ldr	r4, .L37+20
	add	r7, lr, #160
	add	r8, r6, #240
	add	r0, r3, #360
.L34:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	beq	.L33
	ldr	r9, [r3, #4]
	ldr	r10, [r3, #24]
	ldr	r1, [r3, #28]
	and	r9, r9, r5
	add	r1, r1, r10, lsl #5
	orr	r9, r9, r4
	ldr	r10, [r3, #12]
	strh	r9, [r2, #10]	@ movhi
	ldrb	r9, [r3]	@ zero_extendqisi2
	lsl	r1, r1, #2
	cmp	r10, lr
	strh	r1, [r2, #12]	@ movhi
	strh	r9, [r2, #8]	@ movhi
	blt	.L33
	ldr	r1, [r3, #8]
	cmp	r1, r6
	blt	.L33
	cmp	r10, r7
	bgt	.L33
	cmp	r10, r8
	ble	.L32
.L33:
	strh	ip, [r2, #8]	@ movhi
.L32:
	add	r3, r3, #36
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L34
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	vOff
	.word	hOff
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
	ldr	r4, .L51
	mov	fp, #1
	ldr	r5, .L51+4
	ldr	r10, .L51+8
	ldr	r6, .L51+12
	ldr	r9, .L51+16
	ldr	r8, .L51+20
	sub	sp, sp, #20
	add	r7, r4, #360
	b	.L43
.L50:
	ldr	r1, [r6]
.L41:
	cmp	r1, #10
	ldreq	r3, .L51+24
	ldr	r2, [r4, #12]
	streq	fp, [r3]
	ldr	ip, [r9]
	ldr	r3, [r4, #8]
	ldr	r0, [r8]
	sub	r2, r2, ip
	sub	r3, r3, r0
	stm	r4, {r2, r3}
	add	r4, r4, #36
	cmp	r4, r7
	beq	.L49
.L43:
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
	bx	r10
	cmp	r0, #0
	beq	.L50
	ldr	r3, [r4, #32]
	cmp	r3, #0
	movne	r3, #0
	ldr	r1, [r6]
	addne	r1, r1, #1
	strne	r1, [r6]
	strne	r3, [r4, #32]
	b	.L41
.L49:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L52:
	.align	2
.L51:
	.word	paper
	.word	player
	.word	collision
	.word	TPCollected
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
	ldr	r3, .L57
.L54:
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
	add	r2, r2, #32
	cmp	r2, #192
	add	r1, r1, #128
	bne	.L54
	pop	{r4, r5, lr}
	bx	lr
.L58:
	.align	2
.L57:
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
	ldr	r2, .L67
	ldr	r3, .L67+4
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	lr, [r2]
	ldr	r6, [r3]
	ldr	r3, .L67+8
	ldr	r2, .L67+12
	ldr	r5, .L67+16
	ldr	r4, .L67+20
	add	r8, lr, #160
	add	r7, r6, #240
	add	r0, r3, #220
.L63:
	ldr	r1, [r3, #36]
	cmp	r1, #0
	beq	.L62
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
	blt	.L62
	ldr	r1, [r3, #8]
	cmp	r1, r6
	blt	.L62
	cmp	r1, r7
	ble	.L66
.L62:
	strh	ip, [r2]	@ movhi
.L61:
	add	r3, r3, #44
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L63
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L66:
	cmp	r10, r8
	bgt	.L62
	b	.L61
.L68:
	.align	2
.L67:
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
	ldr	r2, .L93
	ldr	r10, .L93+4
	str	r3, [r2]
	ldr	fp, .L93+8
	ldr	r9, .L93+12
	ldr	r8, .L93+16
	sub	sp, sp, #28
.L77:
	ldr	r3, [r10, #8]
	ldr	r0, [fp, #12]
	sub	r0, r0, r3
	mov	lr, pc
	bx	r9
	mov	r7, r1
	mov	r6, r0
	ldr	r3, [r10, #12]
	ldr	r2, .L93+20
	ldr	r0, [fp, #8]
	stm	r2, {r6-r7}
	sub	r0, r0, r3
	mov	lr, pc
	bx	r9
	mov	r4, r0
	mov	r5, r1
	ldr	r0, .L93+24
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
	ldr	r7, .L93+28
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	mov	lr, pc
	bx	r7
	ldr	r3, .L93+32
	mov	lr, pc
	bx	r3
	mov	r4, r0
	mov	r5, r1
	ldr	r3, [r10, #40]
	cmp	r3, #0
	ldr	r3, .L93+36
	stm	r3, {r4-r5}
	beq	.L70
	ldr	r3, .L93+40
	ldr	r3, [r3]
	tst	r3, #1
	bne	.L70
	ldr	r3, .L93
	ldr	r0, [r3]
	mov	lr, pc
	bx	r9
	mov	r6, r0
	mov	r7, r1
	ldr	r1, .L93+20
	ldr	ip, .L93+44
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
	ldr	r7, .L93+28
	mov	lr, pc
	bx	r7
	ldr	r3, .L93+48
	mov	r6, r3
	mov	lr, pc
	bx	r3
	str	r0, [r10, #8]
	ldr	r0, .L93+24
	ldr	ip, .L93+44
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
.L70:
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
	ldr	ip, .L93+52
	asr	r2, r2, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L72
	ldr	r3, [r10, #36]
	cmp	r3, #0
	beq	.L72
	mov	r2, #0
	ldr	r1, .L93+56
	ldr	r3, [r1]
	sub	r3, r3, #1
	cmp	r3, r2
	str	r3, [r1]
	ldr	r3, .L93+60
	str	r2, [r3]
	moveq	r3, #1
	ldreq	r2, .L93+64
	streq	r3, [r2]
.L72:
	ldr	r3, .L93+68
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L75
	ldr	r3, .L93+72
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L92
.L75:
	ldr	r3, .L93+76
	ldr	r2, [r10, #12]
	ldr	r1, [r3]
	sub	r2, r2, r1
	ldr	r1, .L93+80
	ldr	r3, [r10, #8]
	ldr	r1, [r1]
	sub	r3, r3, r1
	stm	r10, {r2, r3}
	ldr	r3, .L93+84
	add	r10, r10, #44
	cmp	r10, r3
	bne	.L77
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L92:
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
	add	r3, r3, #50
	stm	sp, {ip, lr}
	add	r2, r2, #50
	ldr	ip, .L93+52
	sub	r1, r1, #25
	sub	r0, r0, #25
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L75
	ldr	r3, [r10, #36]
	cmp	r3, #0
	beq	.L75
	mov	r2, #1
	ldr	r3, [r10, #24]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r10, #24]
	str	r2, [r10, #40]
	streq	r3, [r10, #36]
	b	.L75
.L94:
	.align	2
.L93:
	.word	speed
	.word	customers
	.word	player
	.word	__aeabi_i2d
	.word	__aeabi_dmul
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
	.word	vOff
	.word	hOff
	.word	customers+220
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
	@ link register save eliminated.
	bx	lr
	.size	initSanitizer, .-initSanitizer
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, #0
	mov	r6, #1
	mov	r5, #32
	mov	r8, #155
	mov	r7, #200
	mov	r9, #3
	bl	initCustomer
	mov	r0, r4
	mov	lr, r6
	mov	r1, r5
	mov	r2, #64
	mov	ip, #5
	ldr	r3, .L100
	str	r4, [r3]
	ldr	r3, .L100+4
	str	r8, [r3]
	str	r4, [r3, #44]
	str	r4, [r3, #36]
	str	r6, [r3, #20]
	str	r6, [r3, #16]
	str	r5, [r3, #28]
	str	r5, [r3, #24]
	str	r8, [r3, #8]
	str	r7, [r3, #12]
	str	r7, [r3, #4]
	ldr	r3, .L100+8
	str	r9, [r3]
	ldr	r3, .L100+12
.L97:
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	add	r2, r2, #128
	cmp	r2, #1344
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r0, [r3, #28]
	str	ip, [r3, #24]
	str	lr, [r3, #32]
	add	r3, r3, #36
	bne	.L97
	mov	ip, #77
	mov	r3, #100
	mov	r4, #28
	ldr	r2, .L100+16
	ldr	r1, .L100+20
	str	ip, [r2]
	ldr	r2, .L100+24
	str	r3, [r1]
	str	r3, [r2]
	ldr	lr, .L100+28
	ldr	ip, .L100+32
	ldr	r1, .L100+36
	ldr	r2, .L100+40
	ldr	r3, .L100+44
	str	r4, [lr]
	str	r0, [ip]
	str	r0, [r1]
	str	r0, [r2]
	str	r0, [r3]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L101:
	.align	2
.L100:
	.word	hitflag
	.word	player
	.word	playerHealth
	.word	paper
	.word	vOff
	.word	hOff
	.word	playerHoff
	.word	screenBlock
	.word	TPCollected
	.word	won
	.word	lost
	.word	timer
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
	ldr	r1, .L116
	ldr	r0, .L116+4
	ldr	r3, [r1]
	ldr	r2, [r0]
	add	r3, r3, #1
	cmp	r2, #256
	push	{r4, lr}
	str	r3, [r1]
	ble	.L103
	ldr	ip, .L116+8
	ldr	r3, [ip]
	cmp	r3, #30
	bgt	.L109
	add	r1, r3, #1
	ldr	r3, .L116+12
	sub	r2, r2, #256
	str	r1, [ip]
	str	r2, [r0]
	add	r0, r3, #220
.L105:
	ldr	r2, [r3, #8]
	sub	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #44
	cmp	r0, r3
	bne	.L105
	ldr	r3, .L116+16
	add	r0, r3, #360
.L106:
	ldr	r2, [r3, #8]
	sub	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L106
.L115:
	mov	r2, #67108864
	lsl	r3, r1, #24
	orr	r3, r3, #1073741824
	lsr	r3, r3, #16
	strh	r3, [r2, #8]	@ movhi
.L109:
	bl	updatePaper
	bl	updatePlayer
	pop	{r4, lr}
	b	updateCustomer
.L103:
	cmp	r2, #0
	bge	.L109
	ldr	ip, .L116+8
	ldr	r3, [ip]
	cmp	r3, #28
	ble	.L109
	sub	r1, r3, #1
	ldr	r3, .L116+12
	add	r2, r2, #256
	str	r1, [ip]
	str	r2, [r0]
	add	r0, r3, #220
.L107:
	ldr	r2, [r3, #8]
	add	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #44
	cmp	r3, r0
	bne	.L107
	ldr	r3, .L116+16
	add	r0, r3, #360
.L108:
	ldr	r2, [r3, #8]
	add	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L108
	b	.L115
.L117:
	.align	2
.L116:
	.word	timer
	.word	hOff
	.word	screenBlock
	.word	customers
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
	ldr	r1, .L120
	ldr	r3, [r1, #4]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	ip, [r1, #36]
	ldr	r2, [r1, #44]
	ldr	r0, .L120+4
	ldrb	r1, [r1]	@ zero_extendqisi2
	add	r2, r2, ip, lsl #5
	lsl	r2, r2, #2
	push	{r4, lr}
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	bl	drawPaper
	bl	drawCustomer
	mov	r3, #67108864
	ldr	r2, .L120+8
	ldrh	r1, [r2]
	ldr	r2, .L120+12
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L121:
	.align	2
.L120:
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
	.comm	sanitizer,280,4
	.comm	customers,220,4
	.comm	player,56,4
	.comm	paper,360,4
	.comm	shadowOAM,1024,4
	.comm	screenBlock,4,4
	.comm	playerHoff,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
