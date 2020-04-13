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
	ldr	ip, [r1]
	ldr	r2, [r3, #12]
	bne	.L10
	ldr	r0, [r3, #4]
	cmp	r0, #0
	ble	.L10
	ldr	r4, .L22+16
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
	ldr	r0, .L22+4
	ldrh	r0, [r0, #48]
	tst	r0, #16
	bne	.L11
	ldr	r0, [r3, #24]
	add	r0, r2, r0
	cmp	r0, #1024
	blt	.L21
.L11:
	ldr	r1, .L22+4
	ldrh	r1, [r1, #48]
	ldr	lr, .L22+20
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
	ldr	r4, .L22+4
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
	ldr	lr, .L22+16
	ldr	r5, .L22+24
	ldr	r0, [lr]
	ldr	r4, [r3, #20]
	cmp	r0, r5
	add	r2, r2, r4
	str	r2, [r3, #12]
	bgt	.L11
	ldr	r4, [r3, #4]
	cmp	r4, #120
	addgt	r0, r0, #1
	addgt	ip, ip, #1
	strgt	r0, [lr]
	strgt	ip, [r1]
	b	.L11
.L23:
	.align	2
.L22:
	.word	playerTimer
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	lr, #512
	ldr	r2, .L37
	ldr	r3, .L37+4
	ldr	r4, [r2]
	ldr	r6, [r3]
	ldr	r3, .L37+8
	ldr	r2, .L37+12
	ldr	r5, .L37+16
	add	r7, r4, #160
	add	r8, r6, #240
	add	ip, r3, #360
.L34:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	beq	.L33
	ldr	r10, [r3, #24]
	ldr	r1, [r3, #28]
	ldr	r0, [r3, #4]
	ldr	r9, [r3, #12]
	add	r1, r1, r10, lsl #5
	ldr	r10, [r3]
	lsl	r1, r1, #2
	orr	r0, r0, r5
	cmp	r9, r4
	strh	r1, [r2, #12]	@ movhi
	strh	r0, [r2, #10]	@ movhi
	strh	r10, [r2, #8]	@ movhi
	blt	.L33
	ldr	r1, [r3, #8]
	cmp	r1, r6
	blt	.L33
	cmp	r9, r7
	bgt	.L33
	cmp	r9, r8
	ble	.L32
.L33:
	strh	lr, [r2, #8]	@ movhi
.L32:
	add	r3, r3, #36
	cmp	r3, ip
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #1
	ldr	r4, .L57
	ldr	r5, .L57+4
	ldr	r8, .L57+8
	ldr	r7, .L57+12
	add	r6, r4, #108
.L54:
	mov	lr, pc
	bx	r5
	smull	r3, r2, r8, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #7
	rsb	r2, r3, r3, lsl #4
	rsb	r3, r3, r2, lsl #5
	sub	r0, r0, r3
	add	r0, r0, #10
	str	r0, [r4, #8]
	mov	lr, pc
	bx	r5
	mov	r2, #32
	mov	r1, #0
	smull	r3, ip, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, ip, asr #3
	rsb	ip, r3, r3, lsl #3
	rsb	r3, r3, ip, lsl #3
	sub	r0, r0, r3, lsl #2
	add	r0, r0, #10
	str	r9, [r4, #28]
	str	r9, [r4, #32]
	str	r0, [r4, #12]
	str	r1, [r4, #24]
	str	r2, [r4, #20]
	str	r2, [r4, #16]
	add	r4, r4, #36
	cmp	r4, r6
	bne	.L54
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L58:
	.align	2
.L57:
	.word	customers
	.word	rand
	.word	1147715687
	.word	156180629
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
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	lr, #512
	ldr	r2, .L67
	ldr	r3, .L67+4
	ldr	r4, [r2]
	ldr	r5, [r3]
	ldr	r3, .L67+8
	ldr	r2, .L67+12
	ldr	r6, .L67+16
	add	r8, r4, #160
	add	r7, r5, #240
	add	ip, r3, #108
.L63:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	beq	.L62
	ldr	r9, [r3, #24]
	ldr	r1, [r3, #28]
	add	r1, r1, r9, lsl #5
	lsl	r1, r1, #2
	ldr	r0, [r3, #4]
	ldr	r9, [r3, #12]
	strh	r1, [r2, #4]	@ movhi
	ldr	r1, [r3]
	orr	r0, r0, r6
	cmp	r9, r4
	strh	r0, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	blt	.L62
	ldr	r1, [r3, #8]
	cmp	r1, r5
	bge	.L66
.L62:
	strh	lr, [r2]	@ movhi
.L61:
	add	r3, r3, #36
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L63
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L66:
	cmp	r1, r7
	bgt	.L62
	cmp	r9, r8
	bgt	.L62
	b	.L61
.L68:
	.align	2
.L67:
	.word	vOff
	.word	hOff
	.word	customers
	.word	shadowOAM+400
	.word	-32768
	.size	drawCustomer, .-drawCustomer
	.align	2
	.global	updateCustomer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCustomer, %function
updateCustomer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L88
	ldr	r5, .L88+4
	ldr	r7, .L88+8
	ldr	fp, .L88+12
	ldr	r10, .L88+16
	ldr	r9, .L88+20
	sub	sp, sp, #20
	add	r8, r4, #108
.L74:
	add	r0, r4, #16
	ldm	r0, {r0, r1}
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #8]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r5, #8]
	ldr	r0, [r5, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L70
	ldr	r3, [r4, #32]
	cmp	r3, #0
	movne	r2, #1
	ldrne	r3, .L88+24
	strne	r2, [r3]
.L70:
	ldrh	r3, [fp]
	tst	r3, #1
	ldr	ip, [r4, #12]
	beq	.L71
	ldr	r3, .L88+28
	ldrh	r6, [r3]
	ands	r6, r6, #1
	beq	.L87
.L71:
	ldr	r2, [r10]
	ldr	r3, [r4, #8]
	sub	ip, ip, r2
	ldr	r2, [r9]
	sub	r3, r3, r2
	str	ip, [r4]
	str	r3, [r4, #4]
	add	r4, r4, #36
	cmp	r4, r8
	bne	.L74
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L87:
	ldr	lr, [r4, #16]
	add	r2, r5, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r5, #8]
	ldr	r0, [r5, #12]
	str	ip, [sp, #4]
	str	lr, [sp, #12]
	ldr	ip, [r4, #20]
	ldr	lr, [r4, #8]
	str	ip, [sp, #8]
	str	lr, [sp]
	add	r3, r3, #50
	add	r2, r2, #50
	sub	r1, r1, #25
	sub	r0, r0, #25
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L86
	ldr	r3, [r4, #32]
	cmp	r3, #0
	strne	r6, [r4, #32]
.L86:
	ldr	ip, [r4, #12]
	b	.L71
.L89:
	.align	2
.L88:
	.word	customers
	.word	player
	.word	collision
	.word	oldButtons
	.word	vOff
	.word	hOff
	.word	lost
	.word	buttons
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
	push	{r4, r5, r6, lr}
	mov	r6, #116
	mov	r5, #9
	mov	r4, #0
	mov	r0, #113
	mov	r1, #1
	mov	r2, #32
	mov	lr, #180
	mov	ip, #28
	ldr	r3, .L92
	str	r6, [r3]
	ldr	r3, .L92+4
	str	r5, [r3]
	ldr	r3, .L92+8
	str	r4, [r3]
	ldr	r3, .L92+12
	str	r0, [r3, #12]
	ldr	r0, .L92+16
	str	r4, [r3, #44]
	str	r4, [r3, #36]
	str	lr, [r3, #8]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r2, [r3, #28]
	str	r2, [r3, #24]
	str	ip, [r0]
	bl	initPaper
	bl	initCustomer
	ldr	r0, .L92+20
	ldr	r1, .L92+24
	ldr	r2, .L92+28
	ldr	r3, .L92+32
	str	r4, [r0]
	str	r4, [r1]
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L93:
	.align	2
.L92:
	.word	vOff
	.word	hOff
	.word	playerHoff
	.word	player
	.word	screenBlock
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
	ldr	r2, .L102
	ldr	r3, [r2]
	cmp	r3, #256
	push	{r4, lr}
	ble	.L95
	ldr	ip, .L102+4
	ldr	r1, [ip]
	cmp	r1, #30
	ble	.L101
.L99:
	ldr	r2, .L102+8
	ldr	r3, [r2]
	cmp	r3, #512
	subgt	r3, r3, #512
	strgt	r3, [r2]
	bgt	.L98
	cmp	r3, #0
	bge	.L98
	ldr	r1, .L102+4
	ldr	r1, [r1]
	cmp	r1, #29
	addle	r3, r3, #512
	strle	r3, [r2]
.L98:
	bl	updatePaper
	bl	updatePlayer
	pop	{r4, lr}
	b	updateCustomer
.L101:
	mov	lr, #67108864
	add	r1, r1, #1
	lsl	r0, r1, #24
	orr	r0, r0, #1073741824
	lsr	r0, r0, #16
	sub	r3, r3, #256
	str	r1, [ip]
	str	r3, [r2]
	strh	r0, [lr, #8]	@ movhi
	b	.L99
.L95:
	cmp	r3, #0
	bge	.L99
	ldr	ip, .L102+4
	ldr	r1, [ip]
	cmp	r1, #28
	ble	.L99
	mov	lr, #67108864
	sub	r1, r1, #1
	lsl	r0, r1, #24
	orr	r0, r0, #1073741824
	lsr	r0, r0, #16
	add	r3, r3, #256
	str	r1, [ip]
	str	r3, [r2]
	strh	r0, [lr, #8]	@ movhi
	b	.L99
.L103:
	.align	2
.L102:
	.word	hOff
	.word	screenBlock
	.word	playerHoff
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
	ldr	r1, .L106
	ldr	r2, [r1, #4]
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	ip, [r1, #36]
	ldr	r3, [r1, #44]
	ldr	r0, .L106+4
	ldr	r1, [r1]
	add	r3, r3, ip, lsl #5
	lsl	r3, r3, #2
	push	{r4, lr}
	strh	r2, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	bl	drawPaper
	bl	drawCustomer
	mov	r3, #67108864
	ldr	r2, .L106+8
	ldrh	r1, [r2]
	ldr	r2, .L106+12
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L107:
	.align	2
.L106:
	.word	player
	.word	shadowOAM
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
	.comm	playerTimer,4,4
	.comm	customers,108,4
	.comm	player,56,4
	.comm	paper,360,4
	.comm	shadowOAM,1024,4
	.comm	screenBlock,4,4
	.comm	playerHoff,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
