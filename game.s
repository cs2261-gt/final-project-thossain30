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
	mov	r1, #170
	mov	r2, #175
	ldr	r3, .L4
	str	lr, [r3, #44]
	str	lr, [r3, #36]
	str	ip, [r3, #20]
	str	ip, [r3, #16]
	str	r0, [r3, #28]
	str	r0, [r3, #24]
	str	r1, [r3, #8]
	str	r1, [r3]
	str	r2, [r3, #12]
	str	r2, [r3, #4]
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
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
	push	{r4, lr}
	mov	ip, r2
	mov	lr, #1
	mov	r0, #0
	mov	r4, #3
	ldr	r3, .L57
.L54:
	lsl	r1, r2, #1
	str	r2, [r3, #12]
	str	lr, [r3, #32]
	str	r0, [r3, #28]
	str	ip, [r3, #20]
	str	ip, [r3, #16]
	str	lr, [r3, #36]
	str	r4, [r3, #24]
	str	r0, [r3, #40]
	str	r1, [r3, #8]
	str	r1, [r3, #4]
	str	r2, [r3], #44
	add	r2, r2, #64
	cmp	r2, #224
	bne	.L54
	pop	{r4, lr}
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	lr, #512
	ldr	r2, .L67
	ldr	r3, .L67+4
	ldr	r4, [r2]
	ldr	r5, [r3]
	ldr	r3, .L67+8
	ldr	r2, .L67+12
	ldr	r7, .L67+16
	ldr	r6, .L67+20
	add	r9, r4, #160
	add	r8, r5, #240
	add	ip, r3, #132
.L63:
	ldr	r1, [r3, #36]
	cmp	r1, #0
	beq	.L62
	ldr	r0, [r3, #4]
	ldr	r10, [r3, #28]
	ldr	r1, [r3, #32]
	and	r0, r0, r7
	add	r1, r1, r10, lsl #5
	orr	r0, r0, r6
	ldr	r10, [r3, #12]
	strh	r0, [r2, #2]	@ movhi
	ldrb	r0, [r3]	@ zero_extendqisi2
	lsl	r1, r1, #2
	cmp	r10, r4
	strh	r1, [r2, #4]	@ movhi
	strh	r0, [r2]	@ movhi
	blt	.L62
	ldr	r1, [r3, #8]
	cmp	r1, r5
	bge	.L66
.L62:
	strh	lr, [r2]	@ movhi
.L61:
	add	r3, r3, #44
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L63
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L66:
	cmp	r1, r8
	bgt	.L62
	cmp	r10, r9
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
	mov	r3, #3
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r2, .L93
	ldr	r10, .L93+4
	str	r3, [r2]
	ldr	fp, .L93+8
	ldr	r9, .L93+12
	ldr	r8, .L93+16
	sub	sp, sp, #28
.L76:
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
	ldr	r2, [r3]
	ldr	r3, .L93+44
	smull	ip, r3, r2, r3
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	cmp	r2, r3
	bne	.L70
	ldr	r3, .L93
	ldr	r0, [r3]
	mov	lr, pc
	bx	r9
	mov	r6, r0
	mov	r7, r1
	ldr	r1, .L93+20
	ldr	ip, .L93+48
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
	ldr	r3, .L93+52
	mov	r6, r3
	mov	lr, pc
	bx	r3
	str	r0, [r10, #8]
	ldr	r0, .L93+24
	ldr	ip, .L93+48
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
	add	r0, r10, #16
	ldm	r0, {r0, r1}
	ldm	r10, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, fp, #24
	ldm	r2, {r2, r3}
	ldr	r1, [fp]
	ldr	r0, [fp, #4]
	ldr	ip, .L93+56
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L71
	ldr	r3, [r10, #36]
	cmp	r3, #0
	movne	r3, #1
	ldrne	r2, .L93+60
	strne	r3, [r2]
.L71:
	ldr	r3, .L93+64
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	ip, [r10, #12]
	beq	.L72
	ldr	r3, .L93+68
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L92
.L72:
	ldr	r3, .L93+72
	ldr	r2, [r3]
	sub	ip, ip, r2
	ldr	r2, .L93+76
	ldr	r3, [r10, #8]
	ldr	r2, [r2]
	sub	r3, r3, r2
	str	r3, [r10, #4]
	ldr	r3, .L93+80
	str	ip, [r10]
	add	r10, r10, #44
	cmp	r10, r3
	bne	.L76
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L92:
	add	r2, fp, #24
	ldm	r2, {r2, r3}
	ldr	r1, [fp, #8]
	ldr	r0, [fp, #12]
	ldr	r4, [r10, #16]
	str	ip, [sp, #4]
	ldr	lr, [r10, #20]
	ldr	ip, [r10, #8]
	str	r4, [sp, #12]
	str	ip, [sp]
	str	lr, [sp, #8]
	ldr	ip, .L93+56
	add	r3, r3, #50
	add	r2, r2, #50
	sub	r1, r1, #25
	sub	r0, r0, #25
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L91
	ldr	r3, [r10, #36]
	cmp	r3, #0
	beq	.L91
	mov	r2, #1
	ldr	r3, [r10, #24]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r10, #24]
	str	r2, [r10, #40]
	streq	r3, [r10, #36]
.L91:
	ldr	ip, [r10, #12]
	b	.L72
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
	.word	1431655766
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.word	collision
	.word	lost
	.word	oldButtons
	.word	buttons
	.word	vOff
	.word	hOff
	.word	customers+132
	.size	updateCustomer, .-updateCustomer
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
	push	{r4, lr}
	bl	initCustomer
	mov	r4, #0
	mov	ip, #1
	mov	r0, #32
	mov	r1, #170
	mov	r2, #175
	ldr	r3, .L97
	str	r4, [r3, #44]
	str	r4, [r3, #36]
	str	ip, [r3, #20]
	str	ip, [r3, #16]
	str	r0, [r3, #28]
	str	r0, [r3, #24]
	str	r1, [r3, #8]
	str	r1, [r3]
	str	r2, [r3, #12]
	str	r2, [r3, #4]
	bl	initPaper
	mov	lr, #116
	mov	r3, #9
	mov	r1, #28
	ldr	r2, .L97+4
	ldr	r0, .L97+8
	str	r4, [r2]
	ldr	r2, .L97+12
	str	r4, [r0]
	str	r4, [r2]
	ldr	r0, .L97+16
	ldr	r2, .L97+20
	str	r4, [r0]
	str	lr, [r2]
	ldr	ip, .L97+24
	ldr	r0, .L97+28
	ldr	r2, .L97+32
	str	r3, [ip]
	str	r3, [r0]
	str	r1, [r2]
	pop	{r4, lr}
	bx	lr
.L98:
	.align	2
.L97:
	.word	player
	.word	TPCollected
	.word	won
	.word	lost
	.word	timer
	.word	vOff
	.word	hOff
	.word	playerHoff
	.word	screenBlock
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
	push	{r4, r5, r6, lr}
	ldr	r1, .L109
	ldr	lr, .L109+4
	ldr	r3, [r1]
	ldr	r2, [lr]
	add	r3, r3, #1
	cmp	r2, #256
	str	r3, [r1]
	ble	.L100
	ldr	r0, .L109+8
	ldr	r3, [r0]
	cmp	r3, #30
	bgt	.L104
	ldr	r1, .L109+12
	add	ip, r3, #1
	ldr	r5, [r1, #8]
	ldr	r4, [r1, #52]
	str	ip, [r0]
	ldr	r0, [r1, #96]
	ldr	r3, .L109+16
	sub	r2, r2, #256
	sub	r5, r5, #256
	sub	r4, r4, #256
	sub	r0, r0, #256
	str	r2, [lr]
	str	r5, [r1, #8]
	str	r4, [r1, #52]
	str	r0, [r1, #96]
	add	r1, r3, #360
.L102:
	ldr	r2, [r3, #8]
	sub	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L102
.L108:
	mov	r2, #67108864
	lsl	r3, ip, #24
	orr	r3, r3, #1073741824
	lsr	r3, r3, #16
	strh	r3, [r2, #8]	@ movhi
.L104:
	bl	updatePaper
	bl	updatePlayer
	pop	{r4, r5, r6, lr}
	b	updateCustomer
.L100:
	cmp	r2, #0
	bge	.L104
	ldr	r0, .L109+8
	ldr	r3, [r0]
	cmp	r3, #28
	ble	.L104
	ldr	r1, .L109+12
	sub	ip, r3, #1
	ldr	r5, [r1, #8]
	ldr	r4, [r1, #52]
	str	ip, [r0]
	ldr	r0, [r1, #96]
	ldr	r3, .L109+16
	add	r2, r2, #256
	add	r5, r5, #256
	add	r4, r4, #256
	add	r0, r0, #256
	str	r2, [lr]
	str	r5, [r1, #8]
	str	r4, [r1, #52]
	str	r0, [r1, #96]
	add	r1, r3, #360
.L103:
	ldr	r2, [r3, #8]
	add	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L103
	b	.L108
.L110:
	.align	2
.L109:
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
	ldr	r1, .L113
	ldr	r3, [r1, #4]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	ip, [r1, #36]
	ldr	r2, [r1, #44]
	ldr	r0, .L113+4
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
	ldr	r2, .L113+8
	ldrh	r1, [r2]
	ldr	r2, .L113+12
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L114:
	.align	2
.L113:
	.word	player
	.word	shadowOAM
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
	.comm	distance,8,8
	.comm	dy,8,8
	.comm	dx,8,8
	.comm	speed,4,4
	.comm	timer,4,4
	.comm	customers,132,4
	.comm	player,56,4
	.comm	paper,360,4
	.comm	shadowOAM,1024,4
	.comm	screenBlock,4,4
	.comm	playerHoff,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
