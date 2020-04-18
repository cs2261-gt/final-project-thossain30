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
	push	{r4, r5, lr}
	mov	ip, #32
	mov	lr, #1
	mov	r5, #4
	mov	r0, #155
	mov	r1, #200
	mov	r4, #3
	ldr	r3, .L4
	str	r2, [r3]
	ldr	r3, .L4+4
	str	r2, [r3, #44]
	str	r2, [r3, #36]
	str	r2, [r3, #32]
	ldr	r2, .L4+8
	str	r5, [r3, #48]
	str	lr, [r3, #20]
	str	lr, [r3, #16]
	str	r4, [r2]
	str	ip, [r3, #28]
	str	ip, [r3, #24]
	str	r0, [r3, #8]
	str	r0, [r3]
	str	r1, [r3, #12]
	str	r1, [r3, #4]
	pop	{r4, r5, lr}
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
	ldr	r3, .L18
	b	.L15
.L11:
	str	ip, [r3]
	str	r1, [r3, #4]
.L16:
	add	r2, r2, #1
	add	r1, r1, #128
	add	r3, r3, #36
.L15:
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
	bls	.L11
	cmp	r2, #15
	movle	ip, #128
	strle	r5, [r3, #12]
	ble	.L11
	cmp	r2, #23
	movle	ip, #192
	strle	r6, [r3, #12]
	ble	.L11
.L13:
	ldr	ip, [r3, #12]
	cmp	r2, #29
	str	r1, [r3, #4]
	str	ip, [r3]
	bne	.L16
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L19:
	.align	2
.L18:
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
	ldr	r2, .L28
	ldr	r1, .L28+4
	ldr	r3, .L28+8
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, [r2]
	ldr	r5, [r1]
	add	lr, r3, #1072
	mov	r4, #512
	ldr	r2, .L28+12
	ldr	r7, .L28+16
	ldr	r6, .L28+20
	add	r9, r5, #160
	add	r10, r8, #240
	add	lr, lr, #8
	b	.L24
.L21:
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
	blt	.L23
	ldr	r1, [r3, #8]
	cmp	r1, r8
	blt	.L23
	cmp	ip, r9
	bgt	.L23
	cmp	ip, r10
	bgt	.L23
	add	r3, r3, #36
	cmp	r3, lr
	add	r2, r2, #8
	beq	.L27
.L24:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	bne	.L21
.L23:
	add	r3, r3, #36
	cmp	r3, lr
	strh	r4, [r2, #8]	@ movhi
	add	r2, r2, #8
	bne	.L24
.L27:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L29:
	.align	2
.L28:
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
	ldr	r4, .L42
	add	r7, r4, #1072
	ldr	r5, .L42+4
	ldr	fp, .L42+8
	ldr	r6, .L42+12
	ldr	r10, .L42+16
	ldr	r9, .L42+20
	ldr	r8, .L42+24
	sub	sp, sp, #20
	add	r7, r7, #8
	b	.L35
.L33:
	ldr	r1, [r6]
.L32:
	ldr	r3, [r10]
	cmp	r3, r1
	moveq	r3, #1
	ldreq	r2, .L42+28
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
	beq	.L41
.L35:
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
	beq	.L33
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L33
	ldr	r1, .L42+32
	ldr	r3, .L42+36
	mov	r2, #0
	ldr	r0, .L42+40
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r1, [r6]
	add	r1, r1, #1
	str	r1, [r6]
	str	r3, [r4, #32]
	b	.L32
.L41:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L43:
	.align	2
.L42:
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
	ldr	r3, .L48
.L45:
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
	bne	.L45
	pop	{r4, r5, lr}
	bx	lr
.L49:
	.align	2
.L48:
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
	ldr	r2, .L58
	ldr	r3, .L58+4
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	lr, [r2]
	ldr	r6, [r3]
	ldr	r3, .L58+8
	ldr	r2, .L58+12
	ldr	r5, .L58+16
	ldr	r4, .L58+20
	add	r8, lr, #160
	add	r7, r6, #240
	add	r0, r3, #264
.L54:
	ldr	r1, [r3, #36]
	cmp	r1, #0
	beq	.L53
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
	blt	.L53
	ldr	r1, [r3, #8]
	cmp	r1, r6
	blt	.L53
	cmp	r1, r7
	ble	.L57
.L53:
	strh	ip, [r2]	@ movhi
.L52:
	add	r3, r3, #44
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L54
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L57:
	cmp	r10, r8
	bgt	.L53
	b	.L52
.L59:
	.align	2
.L58:
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
	ldr	r2, .L90
	ldr	r10, .L90+4
	str	r3, [r2]
	ldr	fp, .L90+8
	ldr	r9, .L90+12
	ldr	r8, .L90+16
	sub	sp, sp, #28
.L69:
	ldr	r3, [r10, #4]
	ldr	r0, [fp, #4]
	sub	r0, r0, r3
	mov	lr, pc
	bx	r9
	mov	r6, r0
	mov	r7, r1
	ldr	r3, [r10]
	ldr	r2, .L90+20
	ldr	r0, [fp]
	stm	r2, {r6-r7}
	sub	r0, r0, r3
	mov	lr, pc
	bx	r9
	mov	r4, r0
	mov	r5, r1
	ldr	r0, .L90+24
	mov	r2, r6
	stm	r0, {r4-r5}
	mov	r3, r7
	mov	r0, r6
	mov	r1, r7
	ldr	r6, .L90+28
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
	ldr	r7, .L90+32
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	mov	lr, pc
	bx	r7
	ldr	r3, .L90+36
	mov	lr, pc
	bx	r3
	mov	r4, r0
	mov	r5, r1
	ldr	r3, [r10, #40]
	cmp	r3, #0
	ldr	r3, .L90+40
	stm	r3, {r4-r5}
	beq	.L61
	ldr	r3, .L90+44
	ldr	r3, [r3]
	tst	r3, #1
	bne	.L61
	ldr	r3, .L90
	ldr	r0, [r3]
	mov	lr, pc
	bx	r9
	mov	r6, r0
	mov	r7, r1
	ldr	r1, .L90+20
	mov	r2, r4
	mov	r3, r5
	ldr	ip, .L90+48
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	ip
	ldr	ip, .L90+28
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
	ldr	r7, .L90+32
	mov	lr, pc
	bx	r7
	ldr	r3, .L90+52
	mov	r6, r3
	mov	lr, pc
	bx	r3
	str	r0, [r10, #8]
	ldr	r0, .L90+24
	mov	r2, r4
	mov	r3, r5
	ldr	r4, .L90+48
	ldmia	r0, {r0-r1}
	mov	lr, pc
	bx	r4
	add	r3, sp, #16
	ldmia	r3, {r2-r3}
	ldr	ip, .L90+28
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
.L61:
	ldr	r3, [r8]
	cmp	r3, #1
	bne	.L62
	mov	r2, #0
	ldr	r1, .L90+56
	ldr	r3, [r1]
	sub	r3, r3, #1
	str	r3, [r1]
	str	r2, [r8]
.L62:
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
	ldr	ip, .L90+60
	asr	r2, r2, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L64
	ldr	r3, [r10, #36]
	cmp	r3, #0
	bne	.L89
.L64:
	ldr	r3, .L90+64
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L88
	ldr	r3, .L90+68
	ldrh	r2, [r3]
	ands	r4, r2, #1
	beq	.L83
.L88:
	ldr	r3, [r10, #8]
	ldr	r2, [r10, #12]
.L67:
	ldr	r1, .L90+72
	ldr	r0, [r1]
	ldr	r1, .L90+76
	ldr	r1, [r1]
	sub	r2, r2, r0
	sub	r3, r3, r1
	stm	r10, {r2, r3}
	ldr	r3, .L90+80
	add	r10, r10, #44
	cmp	r10, r3
	bne	.L69
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L89:
	mov	r2, #0
	ldr	r3, .L90+84
	ldr	r1, .L90+88
	ldr	r0, .L90+92
	mov	lr, pc
	bx	r3
	ldr	r0, [fp, #8]
	mov	lr, pc
	bx	r9
	ldr	r3, .L90+24
	ldr	r4, .L90+32
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r4
	ldr	r5, .L90+52
	mov	lr, pc
	bx	r5
	mov	r3, r0
	ldr	r0, [fp, #12]
	str	r3, [fp, #8]
	mov	lr, pc
	bx	r9
	ldr	r3, .L90+20
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	mov	r3, #1
	ldr	r2, .L90+56
	ldr	r2, [r2]
	cmp	r2, #0
	ldreq	r2, .L90+96
	str	r0, [fp, #12]
	str	r3, [r8]
	streq	r3, [r2]
	b	.L64
.L83:
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
	ldr	ip, .L90+60
	sub	r1, r1, #15
	sub	r0, r0, #15
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L88
	ldr	r3, [r10, #36]
	cmp	r3, #0
	beq	.L88
	mov	r2, r4
	ldr	r1, .L90+100
	ldr	r0, .L90+104
	ldr	r3, .L90+84
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, [r10, #24]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r10, #24]
	str	r1, [r10, #40]
	bne	.L88
	ldr	r0, .L90+108
	ldr	r3, [r10, #8]
	str	r2, [r10, #36]
	ldr	r2, [r10, #12]
	str	r1, [r0, #896]
	str	r3, [r0, #872]
	str	r2, [r0, #876]
	b	.L67
.L91:
	.align	2
.L90:
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
	ldr	r3, .L96
.L93:
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
	bne	.L93
	ldr	lr, [sp], #4
	bx	lr
.L97:
	.align	2
.L96:
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
	ldr	r2, .L106
	ldr	r3, .L106+4
	ldr	r4, [r2]
	ldr	r6, [r3]
	ldr	r3, .L106+8
	ldr	r2, .L106+12
	ldr	r5, .L106+16
	add	r7, r4, #160
	add	r8, r6, #240
	add	ip, r3, #180
.L102:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	beq	.L101
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
	blt	.L101
	ldr	r1, [r3, #8]
	cmp	r1, r6
	blt	.L101
	cmp	r9, r7
	ble	.L105
.L101:
	strh	lr, [r2]	@ movhi
.L100:
	add	r3, r3, #36
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L102
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L105:
	cmp	r9, r8
	bgt	.L101
	b	.L100
.L107:
	.align	2
.L106:
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
	ldr	r4, .L119
	ldr	r5, .L119+4
	ldr	r9, .L119+8
	ldr	r8, .L119+12
	ldr	r7, .L119+16
	ldr	r10, .L119+20
	sub	sp, sp, #20
	add	r6, r4, #180
.L110:
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
	beq	.L109
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L109
	ldr	r3, [r10]
	cmp	r3, #2
	addle	r3, r3, #1
	strle	r3, [r10]
	strle	fp, [r4, #32]
.L109:
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	sub	r2, r2, ip
	sub	r3, r3, r1
	str	r2, [r4, #4]
	str	r3, [r4], #36
	cmp	r4, r6
	bne	.L110
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L120:
	.align	2
.L119:
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
	bl	initCustomer
	mov	r0, #4
	mov	r5, #0
	mov	r1, #32
	mov	r2, #155
	mov	r3, #200
	mov	r4, #1
	mov	ip, #3
	ldr	r6, .L125
	ldr	lr, .L125+4
	str	r0, [r6, #48]
	ldr	r0, .L125+8
	str	r5, [lr]
	str	ip, [r0]
	str	r1, [r6, #28]
	str	r1, [r6, #24]
	str	r2, [r6, #8]
	str	r2, [r6]
	str	r3, [r6, #12]
	str	r3, [r6, #4]
	str	r5, [r6, #44]
	str	r5, [r6, #36]
	str	r5, [r6, #32]
	str	r4, [r6, #20]
	str	r4, [r6, #16]
	bl	initPaper
	mov	r0, r5
	mov	ip, r4
	mov	r2, #64
	mov	r1, #16
	mov	lr, #12
	ldr	r3, .L125+12
.L122:
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
	bne	.L122
	mov	r1, #28
	mov	lr, #30
	add	r2, r6, #8
	ldm	r2, {r2, r3}
	ldr	ip, .L125+16
	add	r2, r2, r2, lsr #31
	asr	r2, r2, #1
	str	r2, [ip]
	add	r3, r3, r3, lsr #31
	ldr	r2, .L125+20
	ldr	ip, .L125+24
	asr	r3, r3, #1
	str	r3, [r2]
	str	r3, [ip]
	ldr	r2, .L125+28
	ldr	r3, .L125+32
	str	r1, [r2]
	str	lr, [r3]
	ldr	ip, .L125+36
	ldr	r1, .L125+40
	ldr	r2, .L125+44
	ldr	r3, .L125+48
	str	r0, [ip]
	str	r0, [r1]
	str	r0, [r2]
	str	r0, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L126:
	.align	2
.L125:
	.word	player
	.word	hitflag
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
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L129
	ldr	r3, [r1, #4]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	ip, [r1, #36]
	ldr	r2, [r1, #44]
	ldr	r0, .L129+4
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
	ldr	r2, .L129+8
	ldrh	r1, [r2]
	ldr	r2, .L129+12
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L130:
	.align	2
.L129:
	.word	player
	.word	shadowOAM
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
	.global	__aeabi_idivmod
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, r5, r6, lr}
	ldr	r4, .L138
	ldr	r3, .L138+4
	ldr	r5, [r4, #32]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r1, [r4, #36]
	bne	.L132
	ldr	r0, [r4, #44]
	ldr	r3, .L138+8
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L132:
	ldr	r3, .L138+12
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #36]
	ldr	r3, .L138+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #36]
	ldr	r3, .L138+12
	ldrh	r3, [r3, #48]
	tst	r3, #16
	moveq	r3, #2
	streq	r3, [r4, #36]
	ldr	r3, .L138+12
	ldrh	r3, [r3, #48]
	tst	r3, #32
	moveq	r3, #3
	add	r5, r5, #1
	streq	r3, [r4, #36]
	str	r5, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L139:
	.align	2
.L138:
	.word	player
	.word	1717986919
	.word	__aeabi_idivmod
	.word	67109120
	.size	animatePlayer, .-animatePlayer
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
	ldr	r3, .L193
	ldrh	r3, [r3, #48]
	tst	r3, #32
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L193+4
	bne	.L188
	ldr	r0, [r4, #28]
	cmp	r0, #0
	add	r3, r0, #3
	movge	r3, r0
	add	r2, r4, #8
	ldm	r2, {r2, ip}
	ldr	r1, [r4, #20]
	add	r3, r2, r3, asr #2
	sub	r1, ip, r1
	add	r3, r1, r3, lsl #10
	ldr	ip, .L193+8
	lsl	r3, r3, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #0
	bne	.L180
.L188:
	ldr	r5, .L193+12
.L142:
	ldr	r3, .L193
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L145
	ldr	r7, [r4, #28]
	cmp	r7, #0
	add	r3, r7, #3
	movge	r3, r7
	ldr	ip, [r4, #12]
	ldr	r1, [r4, #24]
	ldr	lr, [r4, #20]
	ldr	r0, [r4, #8]
	add	r1, ip, r1
	add	r2, r1, lr
	add	r3, r0, r3, asr #2
	sub	r2, r2, #1
	ldr	r6, .L193+8
	add	r3, r2, r3, lsl #10
	lsl	r3, r3, #1
	ldrh	r3, [r6, r3]
	cmp	r3, #0
	bne	.L191
.L145:
	ldr	r3, .L193
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L190
	ldr	r3, [r4, #28]
	add	r2, r3, #3
	cmp	r3, #0
	movlt	r3, r2
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #16]
	ldr	ip, [r4, #12]
	sub	r0, r1, r2
	add	r3, r0, r3, asr #2
	add	r2, ip, r3, lsl #10
	ldr	r1, .L193+8
	lsl	r2, r2, #1
	ldrh	r2, [r1, r2]
	cmp	r2, #0
	lsl	r3, r3, #10
	bne	.L184
.L190:
	ldr	r6, .L193+16
.L148:
	ldr	r3, .L193
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L151
	ldr	r1, [r4, #8]
	ldr	ip, [r4, #28]
	ldr	r0, [r4, #16]
	add	ip, r1, ip
	ldr	r2, [r4, #24]
	add	r3, ip, r0
	sub	r3, r3, #1
	ldr	r7, [r4, #12]
	add	r2, r2, r3, lsl #10
	ldr	lr, .L193+8
	add	r2, r2, r7
	add	r2, lr, r2, lsl #1
	ldrh	r2, [r2, #-2]
	cmp	r2, #0
	lsl	r3, r3, #10
	beq	.L151
	add	r3, r3, r7
	lsl	r3, r3, #1
	ldrh	r3, [lr, r3]
	cmp	ip, #255
	movgt	ip, #0
	movle	ip, #1
	cmp	r3, #0
	moveq	ip, #0
	cmp	ip, #0
	bne	.L192
.L151:
	bl	animatePlayer
	add	r2, r4, #8
	ldr	r0, [r6]
	ldr	r1, [r5]
	ldm	r2, {r2, r3}
	sub	r2, r2, r0
	sub	r3, r3, r1
	stm	r4, {r2, r3}
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L184:
	ldr	r2, [r4, #24]
	add	r3, r3, r2
	add	r3, r3, ip
	add	r3, r1, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	beq	.L190
	ldr	r3, [r4]
	cmp	r3, #0
	ldr	r6, .L193+16
	ble	.L148
	ldr	r2, [r6]
	cmp	r3, #79
	movgt	r3, #0
	movle	r3, #1
	cmp	r2, #0
	movlt	r3, #0
	cmp	r3, #0
	subne	r2, r2, #1
	str	r0, [r4, #8]
	strne	r2, [r6]
	b	.L148
.L191:
	add	r0, r0, r7
	sub	r0, r0, #1
	add	r2, r2, r0, lsl #10
	lsl	r2, r2, #1
	ldrh	r3, [r6, r2]
	cmp	r3, #0
	cmpne	r1, #1024
	bge	.L145
	ldr	r2, [r5]
	ldr	r3, .L193+20
	add	ip, ip, lr
	cmp	r2, r3
	str	ip, [r4, #12]
	bgt	.L145
	ldr	r0, .L193+24
	ldr	r1, [r0]
	cmp	r1, r3
	bgt	.L145
	ldr	r3, [r4, #4]
	cmp	r3, #120
	addgt	r1, r1, #1
	addgt	r2, r2, #1
	strgt	r1, [r0]
	strgt	r2, [r5]
	b	.L145
.L180:
	add	r3, r2, r0
	sub	r3, r3, #1
	add	r3, r1, r3, lsl #10
	lsl	r3, r3, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #0
	beq	.L188
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ble	.L188
	ldr	r0, .L193+24
	ldr	r2, [r0]
	mvn	ip, r2
	cmp	r3, #119
	lsr	ip, ip, #31
	movgt	ip, #0
	ldr	r5, .L193+12
	cmp	ip, #0
	ldrne	r3, [r5]
	subne	r2, r2, #1
	subne	r3, r3, #1
	str	r1, [r4, #12]
	strne	r2, [r0]
	strne	r3, [r5]
	b	.L142
.L192:
	ldr	r3, [r6]
	add	r1, r1, r0
	cmp	r3, #95
	str	r1, [r4, #8]
	bgt	.L151
	ldr	r2, [r4]
	cmp	r2, #80
	addgt	r3, r3, #1
	strgt	r3, [r6]
	b	.L151
.L194:
	.align	2
.L193:
	.word	67109120
	.word	player
	.word	collisionBitmapBitmap
	.word	playerHoff
	.word	vOff
	.word	782
	.word	hOff
	.size	updatePlayer, .-updatePlayer
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
	ldr	r1, .L212
	ldr	ip, .L212+4
	ldr	r3, [r1]
	ldr	r2, [ip]
	add	r3, r3, #1
	cmp	r2, #256
	push	{r4, lr}
	str	r3, [r1]
	ble	.L196
	ldr	r1, .L212+8
	ldr	r0, [r1]
	cmp	r0, #30
	bgt	.L204
	ldr	r3, .L212+12
	sub	r2, r2, #256
	add	r0, r0, #1
	str	r2, [ip]
	str	r0, [r1]
	add	r1, r3, #264
.L198:
	ldr	r2, [r3, #8]
	sub	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L198
	ldr	r3, .L212+16
	ldr	r1, [r3]
	cmp	r1, #0
	ble	.L206
	ldr	r3, .L212+20
	add	r1, r1, r1, lsl #3
	add	r1, r3, r1, lsl #2
.L200:
	ldr	r2, [r3, #8]
	sub	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L200
.L206:
	mov	r3, #67108864
	lsl	r0, r0, #24
	orr	r0, r0, #1073741824
	lsr	r0, r0, #16
	strh	r0, [r3, #8]	@ movhi
.L204:
	bl	updatePlayer
	bl	updateCustomer
	bl	updatePaper
	pop	{r4, lr}
	b	updateSanitizer
.L196:
	cmp	r2, #0
	bge	.L204
	ldr	r1, .L212+8
	ldr	r0, [r1]
	cmp	r0, #28
	ble	.L204
	ldr	r3, .L212+12
	add	r2, r2, #256
	sub	r0, r0, #1
	str	r2, [ip]
	str	r0, [r1]
	add	r1, r3, #264
.L202:
	ldr	r2, [r3, #8]
	add	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L202
	ldr	r3, .L212+16
	ldr	r1, [r3]
	cmp	r1, #0
	ble	.L206
	ldr	r3, .L212+20
	add	r1, r1, r1, lsl #3
	add	r1, r3, r1, lsl #2
.L205:
	ldr	r2, [r3, #8]
	add	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L205
	b	.L206
.L213:
	.align	2
.L212:
	.word	timer
	.word	hOff
	.word	screenBlock
	.word	customers
	.word	totalPaper
	.word	paper
	.size	updateGame, .-updateGame
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
