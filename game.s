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
	mov	r1, #64
	mov	r2, #0
	push	{r4, r5, r6, r7, lr}
	mov	r0, #32
	mov	r7, r1
	mov	r4, r2
	mov	lr, #5
	mov	r6, #192
	mov	r5, #128
	ldr	r3, .L56
	b	.L53
.L49:
	str	ip, [r3]
	str	r1, [r3, #4]
.L54:
	add	r2, r2, #1
	add	r1, r1, #128
	add	r3, r3, #36
.L53:
	mov	ip, #1
	cmp	r2, #7
	str	ip, [r3, #32]
	str	r1, [r3, #8]
	movls	ip, #64
	str	r0, [r3, #20]
	str	r0, [r3, #16]
	str	r4, [r3, #28]
	str	lr, [r3, #24]
	strls	r7, [r3, #12]
	bls	.L49
	cmp	r2, #15
	movle	ip, #128
	strle	r5, [r3, #12]
	ble	.L49
	cmp	r2, #23
	movle	ip, #192
	strle	r6, [r3, #12]
	ble	.L49
.L51:
	ldr	ip, [r3, #12]
	cmp	r2, #29
	str	r1, [r3, #4]
	str	ip, [r3]
	bne	.L54
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L57:
	.align	2
.L56:
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
	ldr	r2, .L66
	ldr	r1, .L66+4
	ldr	r3, .L66+8
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, [r2]
	ldr	r5, [r1]
	add	lr, r3, #1072
	mov	r4, #512
	ldr	r2, .L66+12
	ldr	r7, .L66+16
	ldr	r6, .L66+20
	add	r9, r5, #160
	add	r10, r8, #240
	add	lr, lr, #8
	b	.L62
.L59:
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
	blt	.L61
	ldr	r1, [r3, #8]
	cmp	r1, r8
	blt	.L61
	cmp	ip, r9
	bgt	.L61
	cmp	ip, r10
	bgt	.L61
	add	r3, r3, #36
	cmp	r3, lr
	add	r2, r2, #8
	beq	.L65
.L62:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	bne	.L59
.L61:
	add	r3, r3, #36
	cmp	r3, lr
	strh	r4, [r2, #8]	@ movhi
	add	r2, r2, #8
	bne	.L62
.L65:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L67:
	.align	2
.L66:
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
	ldr	r4, .L80
	add	r7, r4, #1072
	ldr	r5, .L80+4
	ldr	fp, .L80+8
	ldr	r6, .L80+12
	ldr	r10, .L80+16
	ldr	r9, .L80+20
	ldr	r8, .L80+24
	sub	sp, sp, #20
	add	r7, r7, #8
	b	.L73
.L71:
	ldr	r1, [r6]
.L70:
	ldr	r3, [r10]
	cmp	r3, r1
	moveq	r3, #1
	ldreq	r2, .L80+28
	ldr	ip, [r9]
	streq	r3, [r2]
	ldr	r0, [r8]
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #8]
	sub	r2, r2, ip
	sub	r3, r3, r0
	stm	r4, {r2, r3}
	add	r4, r4, #36
	cmp	r4, r7
	beq	.L79
.L73:
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
	beq	.L71
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L71
	ldr	r1, .L80+32
	ldr	r3, .L80+36
	mov	r2, #0
	ldr	r0, .L80+40
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r1, [r6]
	add	r1, r1, #1
	str	r1, [r6]
	str	r3, [r4, #32]
	b	.L70
.L79:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L81:
	.align	2
.L80:
	.word	paper
	.word	player
	.word	collision
	.word	TPCollected
	.word	totalPaper
	.word	vOff
	.word	hOff
	.word	won
	.word	12384
	.word	playSoundB
	.word	collectSound
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
	ldr	r3, .L86
.L83:
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
	cmp	r2, #128
	add	r1, r1, #128
	bne	.L83
	pop	{r4, r5, lr}
	bx	lr
.L87:
	.align	2
.L86:
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
	ldr	r2, .L96
	ldr	r3, .L96+4
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	lr, [r2]
	ldr	r6, [r3]
	ldr	r3, .L96+8
	ldr	r2, .L96+12
	ldr	r5, .L96+16
	ldr	r4, .L96+20
	add	r8, lr, #160
	add	r7, r6, #240
	add	r0, r3, #264
.L92:
	ldr	r1, [r3, #36]
	cmp	r1, #0
	beq	.L91
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
	blt	.L91
	ldr	r1, [r3, #8]
	cmp	r1, r6
	blt	.L91
	cmp	r1, r7
	ble	.L95
.L91:
	strh	ip, [r2]	@ movhi
.L90:
	add	r3, r3, #44
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L92
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L95:
	cmp	r10, r8
	bgt	.L91
	b	.L90
.L97:
	.align	2
.L96:
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
	ldr	r2, .L128
	ldr	r10, .L128+4
	str	r3, [r2]
	ldr	fp, .L128+8
	ldr	r9, .L128+12
	ldr	r8, .L128+16
	sub	sp, sp, #28
.L107:
	ldr	r3, [r10, #4]
	ldr	r0, [fp, #4]
	sub	r0, r0, r3
	mov	lr, pc
	bx	r9
	mov	r6, r0
	mov	r7, r1
	ldr	r3, [r10]
	ldr	r2, .L128+20
	ldr	r0, [fp]
	stm	r2, {r6-r7}
	sub	r0, r0, r3
	mov	lr, pc
	bx	r9
	mov	r4, r0
	mov	r5, r1
	ldr	r0, .L128+24
	mov	r2, r6
	stm	r0, {r4-r5}
	mov	r3, r7
	mov	r0, r6
	mov	r1, r7
	ldr	r6, .L128+28
	mov	lr, pc
	bx	r6
	mov	r2, r4
	mov	r3, r5
	mov	r4, r0
	mov	r5, r1
	mov	r0, r2
	mov	r1, r3
	mov	lr, pc
	bx	r6
	ldr	r7, .L128+32
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	mov	lr, pc
	bx	r7
	ldr	r3, .L128+36
	mov	lr, pc
	bx	r3
	mov	r4, r0
	mov	r5, r1
	ldr	r3, [r10, #40]
	cmp	r3, #0
	ldr	r3, .L128+40
	stm	r3, {r4-r5}
	beq	.L99
	ldr	r3, .L128+44
	ldr	r3, [r3]
	tst	r3, #1
	bne	.L99
	ldr	r3, .L128
	ldr	r0, [r3]
	mov	lr, pc
	bx	r9
	mov	r6, r0
	mov	r7, r1
	ldr	r1, .L128+20
	mov	r2, r4
	mov	r3, r5
	ldr	ip, .L128+48
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	ip
	ldr	ip, .L128+28
	mov	r2, r6
	mov	r3, r7
	str	r6, [sp, #16]
	str	r7, [sp, #20]
	mov	lr, pc
	bx	ip
	mov	r6, r0
	ldr	r0, [r10, #8]
	mov	r7, r1
	mov	lr, pc
	bx	r9
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	ldr	r7, .L128+32
	mov	lr, pc
	bx	r7
	ldr	r3, .L128+52
	mov	r6, r3
	mov	lr, pc
	bx	r3
	str	r0, [r10, #8]
	ldr	r0, .L128+24
	mov	r2, r4
	mov	r3, r5
	ldr	r4, .L128+48
	ldmia	r0, {r0-r1}
	mov	lr, pc
	bx	r4
	add	r3, sp, #16
	ldmia	r3, {r2-r3}
	ldr	ip, .L128+28
	mov	lr, pc
	bx	ip
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
.L99:
	ldr	r3, [r8]
	cmp	r3, #1
	bne	.L100
	mov	r2, #0
	ldr	r1, .L128+56
	ldr	r3, [r1]
	sub	r3, r3, #1
	str	r3, [r1]
	str	r2, [r8]
.L100:
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
	ldr	ip, .L128+60
	asr	r2, r2, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L102
	ldr	r3, [r10, #36]
	cmp	r3, #0
	bne	.L127
.L102:
	ldr	r3, .L128+64
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L126
	ldr	r3, .L128+68
	ldrh	r2, [r3]
	ands	r4, r2, #1
	beq	.L121
.L126:
	ldr	r3, [r10, #8]
	ldr	r2, [r10, #12]
.L105:
	ldr	r1, .L128+72
	ldr	r0, [r1]
	ldr	r1, .L128+76
	ldr	r1, [r1]
	sub	r2, r2, r0
	sub	r3, r3, r1
	stm	r10, {r2, r3}
	ldr	r3, .L128+80
	add	r10, r10, #44
	cmp	r10, r3
	bne	.L107
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L127:
	mov	r2, #0
	ldr	r3, .L128+84
	ldr	r1, .L128+88
	ldr	r0, .L128+92
	mov	lr, pc
	bx	r3
	ldr	r0, [fp, #8]
	mov	lr, pc
	bx	r9
	ldr	r3, .L128+24
	ldr	r4, .L128+32
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r4
	ldr	r5, .L128+52
	mov	lr, pc
	bx	r5
	mov	r3, r0
	ldr	r0, [fp, #12]
	str	r3, [fp, #8]
	mov	lr, pc
	bx	r9
	ldr	r3, .L128+20
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	mov	r3, #1
	ldr	r2, .L128+56
	ldr	r2, [r2]
	cmp	r2, #0
	ldreq	r2, .L128+96
	str	r0, [fp, #12]
	str	r3, [r8]
	streq	r3, [r2]
	b	.L102
.L121:
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
	ldr	ip, .L128+60
	sub	r1, r1, #15
	sub	r0, r0, #15
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L126
	ldr	r3, [r10, #36]
	cmp	r3, #0
	beq	.L126
	mov	r2, r4
	ldr	r1, .L128+100
	ldr	r0, .L128+104
	ldr	r3, .L128+84
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, [r10, #24]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r10, #24]
	str	r1, [r10, #40]
	bne	.L126
	ldr	r0, .L128+108
	ldr	r3, [r10, #8]
	str	r2, [r10, #36]
	ldr	r2, [r10, #12]
	str	r1, [r0, #896]
	str	r3, [r0, #872]
	str	r2, [r0, #876]
	b	.L105
.L129:
	.align	2
.L128:
	.word	speed
	.word	customers
	.word	player
	.word	__aeabi_i2d
	.word	hitflag
	.word	dx
	.word	dy
	.word	__aeabi_dmul
	.word	__aeabi_dadd
	.word	sqrt
	.word	distance
	.word	timer
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.word	playerHealth
	.word	collision
	.word	oldButtons
	.word	buttons
	.word	vOff
	.word	hOff
	.word	customers+264
	.word	playSoundB
	.word	3516
	.word	owSound
	.word	lost
	.word	4206
	.word	punchSound
	.word	paper
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
	str	lr, [sp, #-4]!
	mov	r2, #64
	mov	r1, #16
	mov	lr, #12
	mov	ip, #0
	mov	r0, #1
	ldr	r3, .L134
.L131:
	str	r2, [r3, #8]
	add	r2, r2, #128
	cmp	r2, #704
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	lr, [r3, #24]
	str	ip, [r3, #28]
	str	r0, [r3, #32]
	add	r3, r3, #36
	bne	.L131
	ldr	lr, [sp], #4
	bx	lr
.L135:
	.align	2
.L134:
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
	ldr	r2, .L144
	ldr	r3, .L144+4
	ldr	r4, [r2]
	ldr	r6, [r3]
	ldr	r3, .L144+8
	ldr	r2, .L144+12
	ldr	r5, .L144+16
	add	r7, r4, #160
	add	r8, r6, #240
	add	ip, r3, #180
.L140:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	beq	.L139
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
	blt	.L139
	ldr	r1, [r3, #8]
	cmp	r1, r6
	blt	.L139
	cmp	r9, r7
	ble	.L143
.L139:
	strh	lr, [r2]	@ movhi
.L138:
	add	r3, r3, #36
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L140
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L143:
	cmp	r9, r8
	bgt	.L139
	b	.L138
.L145:
	.align	2
.L144:
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
	ldr	r4, .L157
	ldr	r5, .L157+4
	ldr	r9, .L157+8
	ldr	r8, .L157+12
	ldr	r7, .L157+16
	ldr	r10, .L157+20
	sub	sp, sp, #20
	add	r6, r4, #180
.L148:
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
	beq	.L147
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L147
	ldr	r3, [r10]
	cmp	r3, #2
	addle	r3, r3, #1
	strle	r3, [r10]
	strle	fp, [r4, #32]
.L147:
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	sub	r2, r2, ip
	sub	r3, r3, r1
	str	r2, [r4, #4]
	str	r3, [r4], #36
	cmp	r4, r6
	bne	.L148
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L158:
	.align	2
.L157:
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
	push	{r4, r5, r6, lr}
	mov	r5, #0
	bl	initCustomer
	mov	r4, #1
	mov	r1, #32
	mov	r2, #155
	mov	r3, #200
	mov	ip, #3
	ldr	r0, .L163
	ldr	r6, .L163+4
	str	r5, [r0]
	ldr	r0, .L163+8
	str	r1, [r6, #28]
	str	ip, [r0]
	str	r1, [r6, #24]
	str	r2, [r6, #8]
	str	r2, [r6]
	str	r3, [r6, #12]
	str	r3, [r6, #4]
	str	r5, [r6, #44]
	str	r5, [r6, #36]
	str	r4, [r6, #20]
	str	r4, [r6, #16]
	bl	initPaper
	mov	r0, r5
	mov	ip, r4
	mov	r2, #64
	mov	r1, #16
	mov	lr, #12
	ldr	r3, .L163+12
.L160:
	str	r2, [r3, #8]
	add	r2, r2, #128
	cmp	r2, #704
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	lr, [r3, #24]
	str	r0, [r3, #28]
	str	ip, [r3, #32]
	add	r3, r3, #36
	bne	.L160
	mov	r1, #28
	mov	lr, #30
	add	r2, r6, #8
	ldm	r2, {r2, r3}
	ldr	ip, .L163+16
	add	r2, r2, r2, lsr #31
	asr	r2, r2, #1
	str	r2, [ip]
	add	r3, r3, r3, lsr #31
	ldr	r2, .L163+20
	ldr	ip, .L163+24
	asr	r3, r3, #1
	str	r3, [r2]
	str	r3, [ip]
	ldr	r2, .L163+28
	ldr	r3, .L163+32
	str	r1, [r2]
	str	lr, [r3]
	ldr	ip, .L163+36
	ldr	r1, .L163+40
	ldr	r2, .L163+44
	ldr	r3, .L163+48
	str	r0, [ip]
	str	r0, [r1]
	str	r0, [r2]
	str	r0, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L164:
	.align	2
.L163:
	.word	hitflag
	.word	player
	.word	playerHealth
	.word	sanitizer
	.word	vOff
	.word	hOff
	.word	playerHoff
	.word	screenBlock
	.word	totalPaper
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
	ldr	r1, .L182
	ldr	ip, .L182+4
	ldr	r3, [r1]
	ldr	r2, [ip]
	add	r3, r3, #1
	cmp	r2, #256
	push	{r4, lr}
	str	r3, [r1]
	ble	.L166
	ldr	r1, .L182+8
	ldr	r0, [r1]
	cmp	r0, #30
	bgt	.L174
	ldr	r3, .L182+12
	sub	r2, r2, #256
	add	r0, r0, #1
	str	r2, [ip]
	str	r0, [r1]
	add	r1, r3, #264
.L168:
	ldr	r2, [r3, #8]
	sub	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L168
	ldr	r3, .L182+16
	ldr	r1, [r3]
	cmp	r1, #0
	ble	.L176
	ldr	r3, .L182+20
	add	r1, r1, r1, lsl #3
	add	r1, r3, r1, lsl #2
.L170:
	ldr	r2, [r3, #8]
	sub	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L170
.L176:
	mov	r3, #67108864
	lsl	r0, r0, #24
	orr	r0, r0, #1073741824
	lsr	r0, r0, #16
	strh	r0, [r3, #8]	@ movhi
.L174:
	bl	updatePlayer
	bl	updateCustomer
	bl	updatePaper
	pop	{r4, lr}
	b	updateSanitizer
.L166:
	cmp	r2, #0
	bge	.L174
	ldr	r1, .L182+8
	ldr	r0, [r1]
	cmp	r0, #28
	ble	.L174
	ldr	r3, .L182+12
	add	r2, r2, #256
	sub	r0, r0, #1
	str	r2, [ip]
	str	r0, [r1]
	add	r1, r3, #264
.L172:
	ldr	r2, [r3, #8]
	add	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L172
	ldr	r3, .L182+16
	ldr	r1, [r3]
	cmp	r1, #0
	ble	.L176
	ldr	r3, .L182+20
	add	r1, r1, r1, lsl #3
	add	r1, r3, r1, lsl #2
.L175:
	ldr	r2, [r3, #8]
	add	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L175
	b	.L176
.L183:
	.align	2
.L182:
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
	ldr	r1, .L186
	ldr	r3, [r1, #4]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	ip, [r1, #36]
	ldr	r2, [r1, #44]
	ldr	r0, .L186+4
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
	ldr	r2, .L186+8
	ldrh	r1, [r2]
	ldr	r2, .L186+12
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L187:
	.align	2
.L186:
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
	.comm	customers,264,4
	.comm	player,56,4
	.comm	paper,1080,4
	.comm	shadowOAM,1024,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	totalPaper,4,4
	.comm	screenBlock,4,4
	.comm	playerHoff,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
