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
	push	{r4, r5, r6, lr}
	mov	r5, #200
	mov	r2, #0
	mov	r6, #155
	mov	r4, #4
	mov	lr, #1
	mov	ip, #32
	ldr	r1, .L4
	ldr	r3, .L4+4
	ldr	r1, [r1]
	ldr	r0, [r3]
	ldr	r3, .L4+8
	add	r1, r1, r5
	str	r1, [r3, #12]
	ldr	r1, .L4+12
	str	r2, [r1]
	ldr	r1, .L4+16
	str	r2, [r3, #44]
	str	r2, [r3, #36]
	str	r2, [r3, #32]
	str	r2, [r1]
	ldr	r2, .L4+20
	add	r0, r0, r6
	str	r6, [r3]
	str	r5, [r3, #4]
	str	r4, [r3, #48]
	str	lr, [r3, #20]
	str	r4, [r2]
	str	lr, [r3, #16]
	str	r0, [r3, #8]
	str	ip, [r3, #28]
	str	ip, [r3, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	playerHoff
	.word	vOff
	.word	player
	.word	hitflag
	.word	evy
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
	ldr	r0, [r1, #44]
	ldr	r2, [r1, #36]
	add	r2, r2, r0, lsl #5
	ldrb	r1, [r1]	@ zero_extendqisi2
	ldr	r0, .L7+4
	lsl	r2, r2, #2
	orr	r2, r2, #1024
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
	mov	r1, #0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r0, #32
	mov	r5, r1
	mov	r4, #5
	mov	lr, #4
	mov	r7, #116
	mov	r6, #1
	mov	r8, #64
	ldr	r3, .L18
	b	.L14
.L17:
	str	r7, [r3, #12]
	str	r6, [r3, #32]
.L11:
	ldr	ip, [r3, #12]
	str	r2, [r3, #4]
	str	ip, [r3]
.L15:
	add	r1, r1, #1
	add	r3, r3, #44
.L14:
	and	r2, r1, #7
	lsl	r2, r2, #7
	cmp	r1, #7
	add	r2, r2, #64
	str	r0, [r3, #20]
	str	r0, [r3, #16]
	str	r5, [r3, #28]
	str	r4, [r3, #24]
	str	lr, [r3, #40]
	str	r2, [r3, #8]
	strls	r8, [r3, #12]
	strls	r6, [r3, #32]
	bls	.L11
	cmp	r1, #15
	ble	.L17
	ldr	ip, [r3, #12]
	cmp	r1, #19
	str	r2, [r3, #4]
	str	ip, [r3]
	bne	.L15
	pop	{r4, r5, r6, r7, r8, lr}
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
	ldr	r3, .L28+4
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, [r2]
	ldr	r9, [r3]
	ldr	r3, .L28+8
	mov	r5, #512
	ldr	r2, .L28+12
	ldr	r7, .L28+16
	ldr	r6, .L28+20
	add	r10, r8, #160
	add	fp, r9, #240
	add	r4, r3, #880
	b	.L24
.L23:
	strh	r5, [r2, #8]	@ movhi
.L22:
	add	r3, r3, #44
	cmp	r3, r4
	add	r2, r2, #8
	beq	.L27
.L24:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	beq	.L23
	add	r0, r3, #24
	ldm	r0, {r0, r1}
	ldr	ip, [r3, #4]
	add	r1, r1, r0, lsl #5
	ldr	lr, [r3]
	and	r0, ip, r7
	lsl	r1, r1, #2
	orr	r1, r1, #1024
	cmp	ip, #240
	orr	r0, r0, r6
	and	ip, lr, #255
	strh	r1, [r2, #12]	@ movhi
	strh	r0, [r2, #10]	@ movhi
	strh	ip, [r2, #8]	@ movhi
	bhi	.L23
	cmp	lr, #160
	bhi	.L23
	ldr	r1, [r3, #12]
	cmp	r1, r8
	blt	.L23
	ldr	r0, [r3, #8]
	cmp	r0, r9
	blt	.L23
	cmp	r1, r10
	bgt	.L23
	cmp	r1, fp
	bgt	.L23
	b	.L22
.L27:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L29:
	.align	2
.L28:
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
	ldr	r4, .L45
	ldr	r5, .L45+4
	ldr	fp, .L45+8
	ldr	r6, .L45+12
	ldr	r10, .L45+16
	ldr	r9, .L45+20
	ldr	r8, .L45+24
	sub	sp, sp, #20
	add	r7, r4, #880
	b	.L35
.L33:
	ldr	r1, [r6]
.L32:
	ldr	r3, [r10]
	cmp	r3, r1
	moveq	r3, #1
	ldreq	r2, .L45+28
	ldr	ip, [r9]
	streq	r3, [r2]
	ldr	r0, [r8]
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #8]
	sub	r2, r2, ip
	sub	r3, r3, r0
	stm	r4, {r2, r3}
	add	r4, r4, #44
	cmp	r4, r7
	beq	.L44
.L35:
	ldr	r2, [r5, #24]
	cmp	r2, #0
	add	r3, r2, #3
	movge	r3, r2
	ldr	r0, [r5, #4]
	ldr	r1, [r4, #20]
	ldr	ip, [r4, #16]
	ldr	lr, [r4]
	add	r0, r0, r3, asr #2
	ldr	r3, [r4, #4]
	add	r2, r2, r2, lsr #31
	stm	sp, {r3, lr}
	str	r1, [sp, #8]
	str	ip, [sp, #12]
	ldr	r3, [r5, #28]
	ldr	r1, [r5]
	asr	r2, r2, #1
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	beq	.L33
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L33
	ldr	r0, .L45+32
	ldr	r3, .L45+36
	mov	r2, #0
	ldr	r1, .L45+40
	mov	lr, pc
	bx	r3
	ldr	r1, [r6]
	add	r1, r1, #1
	cmp	r1, #9
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, .L45+44
	ldr	r2, [lr, #12]
	ldr	ip, .L45+48
	add	r2, r2, #1
	smull	r3, ip, r2, ip
	asr	r3, r2, #31
	rsb	r3, r3, ip, asr #2
	add	r3, r3, r3, lsl #2
	sub	r3, r2, r3, lsl #1
	cmp	r3, #0
	moveq	r2, r0
	movne	r2, #0
	mov	r0, #0
	cmp	r2, r0
	str	r3, [lr, #12]
	str	r1, [r6]
	str	r0, [r4, #32]
	beq	.L32
	ldr	ip, .L45+52
	ldr	r3, [ip, #12]
	ldr	r0, .L45+48
	add	r3, r3, #1
	smull	r2, r0, r3, r0
	asr	r2, r3, #31
	rsb	r2, r2, r0, asr #2
	add	r2, r2, r2, lsl #2
	sub	r3, r3, r2, lsl #1
	str	r3, [ip, #12]
	b	.L32
.L44:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L46:
	.align	2
.L45:
	.word	paper
	.word	player
	.word	collision
	.word	TPCollected
	.word	totalPaper
	.word	vOff
	.word	totalHoff
	.word	won
	.word	collectSound
	.word	playSoundB
	.word	12384
	.word	oDigit
	.word	1717986919
	.word	tDigit
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
	push	{r4, r5, r6, lr}
	mov	ip, #1
	mov	r6, #4
	mov	lr, r2
	mov	r5, #5
	mov	r0, #0
	mov	r4, #3
	ldr	r3, .L51
.L48:
	lsl	r1, r2, #4
	sub	r1, r1, #448
	str	r2, [r3, #12]
	str	r6, [r3, #32]
	str	ip, [r3, #28]
	str	r5, [r3, #48]
	str	r0, [r3, #52]
	str	lr, [r3, #20]
	str	lr, [r3, #16]
	str	ip, [r3, #40]
	str	r4, [r3, #24]
	str	r0, [r3, #44]
	str	r1, [r3, #8]
	str	r1, [r3, #4]
	str	r2, [r3], #56
	add	r2, r2, #16
	cmp	r2, #96
	bne	.L48
	pop	{r4, r5, r6, lr}
	bx	lr
.L52:
	.align	2
.L51:
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
	ldr	r2, .L61
	ldr	r3, .L61+4
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, [r2]
	ldr	r5, [r3]
	ldr	r3, .L61+8
	ldr	r2, .L61+12
	ldr	r7, .L61+16
	ldr	r6, .L61+20
	add	r9, r4, #160
	add	r8, r5, #240
	add	r0, r3, #224
.L57:
	ldr	r1, [r3, #40]
	cmp	r1, #0
	beq	.L56
	ldr	lr, [r3, #28]
	ldr	r1, [r3, #32]
	add	r1, r1, lr, lsl #5
	ldr	r10, [r3, #4]
	lsl	r1, r1, #2
	orr	r1, r1, #1024
	ldr	lr, [r3, #12]
	strh	r1, [r2, #4]	@ movhi
	and	r10, r10, r7
	ldrb	r1, [r3]	@ zero_extendqisi2
	orr	r10, r10, r6
	cmp	lr, r4
	strh	r10, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	blt	.L56
	ldr	r1, [r3, #8]
	cmp	r1, r5
	blt	.L56
	cmp	r1, r8
	ble	.L60
.L56:
	strh	ip, [r2]	@ movhi
.L55:
	add	r3, r3, #56
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L57
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L60:
	cmp	lr, r9
	bgt	.L56
	b	.L55
.L62:
	.align	2
.L61:
	.word	vOff
	.word	totalHoff
	.word	customers
	.word	shadowOAM+400
	.word	511
	.word	-32768
	.size	drawCustomer, .-drawCustomer
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_dadd
	.global	__aeabi_dcmpgt
	.global	__aeabi_dcmplt
	.global	__aeabi_d2iz
	.global	__aeabi_ddiv
	.align	2
	.global	updateCustomer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCustomer, %function
updateCustomer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, #0
	mov	r9, #0
	ldr	r3, .L154
	ldr	r1, .L154+4
	stm	r1, {r2-r3}
	ldr	fp, .L154+8
	ldr	r10, .L154+12
	sub	sp, sp, #36
.L100:
	ldr	r3, [fp, #4]
	ldr	r0, [r10, #4]
	ldr	r4, .L154+16
	sub	r0, r0, r3
	mov	lr, pc
	bx	r4
	mov	r6, r0
	mov	r7, r1
	ldr	r3, [fp]
	ldr	r2, .L154+20
	ldr	r0, [r10]
	stm	r2, {r6-r7}
	sub	r0, r0, r3
	mov	lr, pc
	bx	r4
	mov	r4, r0
	mov	r5, r1
	ldr	r1, .L154+24
	mov	r2, r6
	stm	r1, {r4-r5}
	mov	r3, r7
	mov	r0, r6
	mov	r1, r7
	ldr	r6, .L154+28
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
	ldr	ip, .L154+32
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	mov	lr, pc
	bx	ip
	ldr	r3, .L154+36
	mov	lr, pc
	bx	r3
	ldr	r2, .L154+20
	ldr	r3, .L154+40
	ldmia	r2, {r6-r7}
	stm	r3, {r0-r1}
	str	r0, [sp, #16]
	str	r1, [sp, #20]
	mov	r2, r8
	mov	r0, r6
	mov	r1, r7
	mov	r3, r9
	ldr	ip, .L154+44
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L136
	ldr	r1, .L154+24
	ldmia	r1, {r4-r5}
	mov	r2, r8
	mov	r3, r9
	mov	r0, r4
	mov	r1, r5
	ldr	ip, .L154+44
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L137
	mov	r3, r5
	mov	r2, r4
	mov	r1, r7
	ldr	ip, .L154+44
	mov	r0, r6
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	movne	r3, #6
	moveq	r3, #4
	mov	r2, r8
	str	r3, [fp, #32]
	mov	r0, r6
	mov	r3, r9
	mov	r1, r7
	ldr	ip, .L154+48
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L106
.L107:
	ldr	r3, .L154+24
	ldmia	r3, {r4-r5}
.L103:
	mov	r2, r8
	mov	r3, r9
	mov	r0, r4
	mov	r1, r5
	ldr	ip, .L154+48
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L149
.L77:
	mov	r2, r8
	mov	r3, r9
	mov	r0, r6
	mov	r1, r7
	ldr	ip, .L154+48
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L150
.L84:
	ldr	r3, [fp, #44]
	cmp	r3, #0
	beq	.L88
	ldr	r3, .L154+52
	ldr	r3, [r3]
	tst	r3, #1
	bne	.L88
	ldr	r0, [fp, #8]
	ldr	r3, .L154+16
	mov	lr, pc
	bx	r3
	ldr	r2, .L154+4
	ldmia	r2, {r2-r3}
	mov	r4, r0
	mov	r5, r1
	mov	r0, r6
	mov	r1, r7
	str	r2, [sp, #24]
	str	r3, [sp, #28]
	ldr	ip, .L154+56
	add	r3, sp, #16
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	ip
	add	r7, sp, #24
	ldmia	r7, {r6-r7}
	ldr	ip, .L154+28
	mov	r2, r6
	mov	r3, r7
	mov	lr, pc
	bx	ip
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	ldr	r4, .L154+32
	mov	lr, pc
	bx	r4
	ldr	r5, .L154+60
	mov	lr, pc
	bx	r5
	ldr	r1, .L154+24
	add	r3, sp, #16
	ldmia	r3, {r2-r3}
	str	r0, [fp, #8]
	ldr	ip, .L154+56
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	ip
	ldr	ip, .L154+28
	mov	r2, r6
	mov	r3, r7
	mov	lr, pc
	bx	ip
	ldr	r3, .L154+16
	mov	r4, r0
	ldr	r0, [fp, #12]
	mov	r5, r1
	mov	lr, pc
	bx	r3
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	ldr	r4, .L154+32
	mov	lr, pc
	bx	r4
	ldr	r5, .L154+60
	mov	lr, pc
	bx	r5
	str	r0, [fp, #12]
.L88:
	ldr	r3, .L154+64
	ldr	r3, [r3]
	cmp	r3, #1
	bne	.L89
	mov	r1, #0
	ldr	ip, .L154+68
	ldr	r3, [ip]
	ldr	r2, .L154+72
	rsb	r0, r3, r3, lsl #3
	sub	r3, r3, #1
	str	r3, [ip]
	ldr	r3, .L154+64
	add	r2, r2, r0, lsl #2
	str	r1, [r2, #16]
	str	r1, [r3]
.L89:
	ldr	r3, [fp, #20]
	ldr	r2, [r10, #24]
	cmp	r3, #0
	add	ip, r3, #3
	movge	lr, r3
	movlt	lr, ip
	cmp	r2, #0
	add	r1, r2, #3
	movge	r1, r2
	ldr	ip, [fp, #4]
	add	r3, r3, r3, lsr #31
	asr	r3, r3, #1
	add	ip, ip, lr, asr #2
	ldr	r0, [r10, #4]
	str	r3, [sp, #8]
	ldr	lr, [fp, #16]
	ldr	r3, [fp]
	add	r2, r2, r2, lsr #31
	str	ip, [sp]
	str	r3, [sp, #4]
	add	r0, r0, r1, asr #2
	str	lr, [sp, #12]
	ldr	r3, [r10, #28]
	ldr	r1, [r10]
	ldr	ip, .L154+76
	asr	r2, r2, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L91
	ldr	r3, [fp, #40]
	cmp	r3, #0
	bne	.L151
.L91:
	ldr	r3, .L154+80
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L148
	ldr	r3, .L154+84
	ldrh	r4, [r3]
	ands	r4, r4, #1
	bne	.L148
	ldr	r2, [r10, #32]
	ldr	r1, .L154+88
	smull	r3, r1, r2, r1
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl #2
	moveq	ip, r3
	movne	ip, #4
	ldr	lr, [fp, #16]
	add	r2, r10, #24
	ldm	r2, {r2, r3}
	str	lr, [sp, #12]
	ldr	lr, [fp, #20]
	str	lr, [sp, #8]
	ldr	lr, [fp]
	ldr	r1, [r10]
	ldr	r0, [r10, #4]
	str	lr, [sp, #4]
	ldr	lr, [fp, #4]
	str	ip, [r10, #44]
	str	lr, [sp]
	ldr	ip, .L154+76
	add	r3, r3, #30
	add	r2, r2, #30
	sub	r1, r1, #15
	sub	r0, r0, #15
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L97
	ldr	r3, [fp, #40]
	cmp	r3, #0
	bne	.L143
.L148:
	ldr	r3, [fp, #8]
	ldr	r2, [fp, #12]
.L94:
	ldr	r1, .L154+92
	ldr	r0, [r1]
	ldr	r1, .L154+96
	ldr	r1, [r1]
	sub	r2, r2, r0
	sub	r3, r3, r1
	stm	fp, {r2, r3}
	ldr	r3, .L154+100
	add	fp, fp, #56
	cmp	fp, r3
	bne	.L100
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L136:
	mov	r2, r8
	mov	r3, r9
	mov	r0, r6
	mov	r1, r7
	ldr	ip, .L154+48
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L152
	mov	r2, r8
	mov	r3, r9
	mov	r0, r6
	mov	r1, r7
	ldr	ip, .L154+44
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L77
	b	.L107
.L137:
	mov	r2, r8
	mov	r3, r9
	mov	r0, r6
	mov	r1, r7
	ldr	ip, .L154+48
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L103
	mov	r2, r8
	mov	r3, r9
	mov	r0, r4
	mov	r1, r5
	ldr	ip, .L154+44
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L103
.L106:
	mov	r1, r7
	ldr	r3, .L154+60
	mov	r0, r6
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	rsblt	r0, r0, #0
	ldr	r3, .L154+16
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, r4
	ldr	ip, .L154+44
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	movne	r3, #7
	moveq	r3, #4
	str	r3, [fp, #32]
.L73:
	mov	r2, r8
	mov	r3, r9
	mov	r0, r6
	mov	r1, r7
	ldr	ip, .L154+44
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L103
.L104:
	mov	r2, r8
	mov	r3, r9
	mov	r0, r4
	mov	r1, r5
	ldr	ip, .L154+48
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L84
.L101:
	mov	r1, r7
	ldr	r3, .L154+60
	mov	r0, r6
	mov	lr, pc
	bx	r3
	mov	r3, r0
	mov	r0, r4
	eor	r4, r3, r3, asr #31
	sub	r4, r4, r3, asr #31
	mov	r1, r5
	ldr	r3, .L154+60
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	rsblt	r0, r0, #0
	cmp	r4, r0
	movgt	r3, #7
	movle	r3, #5
	str	r3, [fp, #32]
	b	.L84
.L149:
	mov	r1, r5
	ldr	r3, .L154+60
	mov	r0, r4
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	rsblt	r0, r0, #0
	ldr	r3, .L154+16
	mov	lr, pc
	bx	r3
	ldr	ip, .L154+48
	mov	r3, r1
	mov	r2, r0
	mov	r1, r7
	mov	r0, r6
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	movne	r3, #5
	moveq	r3, #6
	mov	r2, r8
	str	r3, [fp, #32]
	mov	r0, r6
	mov	r3, r9
	mov	r1, r7
	ldr	ip, .L154+48
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L84
	ldr	r3, .L154+24
	ldmia	r3, {r4-r5}
	b	.L101
.L152:
	ldr	r3, .L154+24
	ldmia	r3, {r4-r5}
	mov	r2, r8
	mov	r3, r9
	mov	r0, r4
	mov	r1, r5
	ldr	ip, .L154+44
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L73
	b	.L106
.L143:
	mov	r2, r4
	ldr	r3, .L154+104
	ldr	r1, .L154+108
	ldr	r0, .L154+112
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, [fp, #24]
	sub	r3, r3, #1
	str	r3, [fp, #24]
	str	r2, [fp, #44]
.L97:
	ldr	r3, [fp, #40]
	cmp	r3, #0
	beq	.L148
	ldr	r1, [fp, #24]
	cmp	r1, #0
	bne	.L148
	ldr	r0, .L154+116
	mov	r3, #16
	mov	r2, r0
	str	r1, [fp, #40]
.L99:
	ldr	r1, [r2, #736]
	cmp	r1, #0
	beq	.L153
	add	r3, r3, #1
	cmp	r3, #20
	add	r2, r2, #44
	bne	.L99
	b	.L148
.L151:
	mov	r2, #0
	ldr	r1, .L154+120
	ldr	r0, .L154+124
	ldr	r3, .L154+104
	mov	lr, pc
	bx	r3
	ldr	r3, .L154+24
	ldmia	r3, {r2-r3}
	mov	r1, r3
	str	r2, [sp, #16]
	str	r3, [sp, #20]
	mov	r0, r2
	ldr	r3, .L154+60
	mov	lr, pc
	bx	r3
	ldr	r2, .L154+20
	ldmia	r2, {r4-r5}
	mov	r6, r0
	mov	r1, r5
	ldr	r3, .L154+60
	mov	r0, r4
	mov	lr, pc
	bx	r3
	ldr	r7, [r10, #8]
	ldr	r3, [r10, #12]
	add	r6, r6, r7
	add	r0, r0, r3
	cmp	r6, #0
	cmpgt	r0, #0
	add	r1, r0, r6, lsl #10
	add	r1, r1, #1024
	ldr	r0, .L154+128
	add	r1, r1, #1
	lsl	r1, r1, #1
	ldrh	r1, [r0, r1]
	movgt	ip, #1
	movle	ip, #0
	cmp	r1, #0
	moveq	ip, #0
	cmp	ip, #0
	str	r3, [sp, #24]
	beq	.L91
	mov	r0, r7
	ldr	r6, .L154+16
	mov	lr, pc
	bx	r6
	ldr	r7, .L154+32
	add	r3, sp, #16
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r7
	ldr	r3, .L154+60
	mov	lr, pc
	bx	r3
	mov	r3, r0
	ldr	r0, [sp, #24]
	str	r3, [r10, #8]
	mov	lr, pc
	bx	r6
	mov	r2, r4
	mov	r3, r5
	mov	lr, pc
	bx	r7
	ldr	r3, .L154+60
	mov	lr, pc
	bx	r3
	mov	r3, #1
	ldr	r2, .L154+68
	ldr	r2, [r2]
	cmp	r2, #0
	ldr	r2, .L154+64
	str	r3, [r2]
	ldreq	r2, .L154+132
	str	r0, [r10, #12]
	streq	r3, [r2]
	b	.L91
.L150:
	ldr	r3, .L154+24
	ldmia	r3, {r4-r5}
	b	.L104
.L153:
	mov	r1, #1
	add	r2, r3, r3, lsl #2
	add	r2, r3, r2, lsl r1
	add	r0, r0, r2, lsl #2
	ldr	r3, [fp, #8]
	ldr	r2, [fp, #12]
	str	r1, [r0, #32]
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	b	.L94
.L155:
	.align	2
.L154:
	.word	1073217536
	.word	speed
	.word	customers
	.word	player
	.word	__aeabi_i2d
	.word	dx
	.word	dy
	.word	__aeabi_dmul
	.word	__aeabi_dadd
	.word	sqrt
	.word	distance
	.word	__aeabi_dcmpgt
	.word	__aeabi_dcmplt
	.word	timer
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.word	hitflag
	.word	playerHealth
	.word	hearts
	.word	collision
	.word	oldButtons
	.word	buttons
	.word	1717986919
	.word	vOff
	.word	totalHoff
	.word	customers+224
	.word	playSoundB
	.word	4206
	.word	punchSound
	.word	paper
	.word	3516
	.word	owSound
	.word	collisionBitmapBitmap
	.word	lost
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
	mov	r1, #16
	push	{r4, r5, r6, lr}
	mov	r6, #12
	mov	r5, #6
	mov	r4, #0
	mov	lr, #1
	ldr	r2, .L160
	ldr	r3, .L160+4
	ldr	r0, [r2]
	ldr	ip, [r3]
	ldr	r3, .L160+8
	add	r2, r0, #64
	add	ip, ip, r1
	add	r0, r0, #832
.L157:
	str	r2, [r3, #8]
	add	r2, r2, #128
	cmp	r2, r0
	str	ip, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r6, [r3, #24]
	str	r5, [r3, #40]
	str	r4, [r3, #28]
	str	lr, [r3, #32]
	add	r3, r3, #44
	bne	.L157
	pop	{r4, r5, r6, lr}
	bx	lr
.L161:
	.align	2
.L160:
	.word	totalHoff
	.word	vOff
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
	ldr	r2, .L170
	ldr	r3, .L170+4
	ldr	r5, [r2]
	ldr	r6, [r3]
	ldr	r3, .L170+8
	ldr	r2, .L170+12
	ldr	r4, .L170+16
	add	r7, r5, #160
	add	r8, r6, #240
	add	ip, r3, #264
.L166:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	beq	.L165
	ldr	r9, [r3, #24]
	ldr	r1, [r3, #28]
	ldr	r0, [r3, #4]
	add	r1, r1, r9, lsl #5
	lsl	r1, r1, #1
	ldr	r9, [r3]
	orr	r1, r1, #1024
	cmp	r0, #240
	and	r0, r0, r4
	strh	r1, [r2, #4]	@ movhi
	orr	r0, r0, #16384
	and	r1, r9, #255
	strh	r0, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	bls	.L169
.L165:
	strh	lr, [r2]	@ movhi
.L164:
	add	r3, r3, #44
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L166
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L169:
	cmp	r9, #160
	bhi	.L165
	ldr	r1, [r3, #12]
	cmp	r1, r5
	blt	.L165
	ldr	r0, [r3, #8]
	cmp	r0, r6
	blt	.L165
	cmp	r1, r7
	bgt	.L165
	cmp	r1, r8
	bgt	.L165
	b	.L164
.L171:
	.align	2
.L170:
	.word	vOff
	.word	totalHoff
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
	ldr	r4, .L184
	ldr	r5, .L184+4
	ldr	r9, .L184+8
	ldr	r8, .L184+12
	ldr	r7, .L184+16
	ldr	r10, .L184+20
	ldr	fp, .L184+24
	sub	sp, sp, #20
	add	r6, r4, #264
.L174:
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
	bx	r9
	cmp	r0, #0
	beq	.L173
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L173
	ldr	r3, [r10]
	cmp	r3, #3
	ble	.L183
.L173:
	ldr	r2, [r4, #8]
	ldr	r1, [r8]
	ldr	r3, [r4, #12]
	sub	r2, r2, r1
	ldr	r1, [r7]
	sub	r3, r3, r1
	str	r2, [r4, #4]
	str	r3, [r4], #44
	cmp	r4, r6
	bne	.L174
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L183:
	add	r3, r3, #1
	str	r3, [r10]
	rsb	ip, r3, r3, lsl #3
	mov	r3, #1
	ldr	r2, .L184+28
	add	ip, r2, ip, lsl #2
	str	r3, [ip, #16]
	mov	r2, #0
	ldr	r3, .L184+32
	mov	r1, fp
	ldr	r0, .L184+36
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r3, [r4, #32]
	b	.L173
.L185:
	.align	2
.L184:
	.word	sanitizer
	.word	player
	.word	collision
	.word	totalHoff
	.word	vOff
	.word	playerHealth
	.word	13967
	.word	hearts
	.word	playSoundB
	.word	sanSound
	.size	updateSanitizer, .-updateSanitizer
	.align	2
	.global	initHeart
	.syntax unified
	.arm
	.fpu softvfp
	.type	initHeart, %function
initHeart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #5
	mov	r4, #10
	mov	r1, #16
	mov	lr, #12
	mov	ip, #6
	mov	r0, #1
	ldr	r3, .L190
.L187:
	str	r2, [r3, #4]
	add	r2, r2, #18
	cmp	r2, #95
	str	r4, [r3]
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	lr, [r3, #20]
	str	ip, [r3, #24]
	str	r0, [r3, #16]
	add	r3, r3, #28
	bne	.L187
	pop	{r4, lr}
	bx	lr
.L191:
	.align	2
.L190:
	.word	hearts
	.size	initHeart, .-initHeart
	.align	2
	.global	drawHeart
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHeart, %function
drawHeart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r5, #512
	ldr	r3, .L198
	ldr	r2, .L198+4
	ldr	r4, .L198+8
	add	ip, r3, #140
.L195:
	ldr	r1, [r3, #16]
	cmp	r1, #0
	strheq	r5, [r2]	@ movhi
	beq	.L194
	ldr	lr, [r3, #20]
	ldr	r0, [r3, #4]
	ldr	r1, [r3, #24]
	and	r0, r0, r4
	add	r1, r1, lr, lsl #5
	ldrb	lr, [r3]	@ zero_extendqisi2
	orr	r0, r0, #16384
	lsl	r1, r1, #1
	strh	r0, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	strh	lr, [r2]	@ movhi
.L194:
	add	r3, r3, #28
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L195
	pop	{r4, r5, lr}
	bx	lr
.L199:
	.align	2
.L198:
	.word	hearts
	.word	shadowOAM+480
	.word	511
	.size	drawHeart, .-drawHeart
	.align	2
	.global	initEScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEScore, %function
initEScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	ip, #200
	mov	r4, #32
	mov	lr, #8
	mov	r0, #150
	mov	r1, #3
	mov	r2, #26
	ldr	r3, .L202
	stm	r3, {r4, lr}
	str	ip, [r3, #20]
	str	r0, [r3, #16]
	str	r1, [r3, #12]
	str	r2, [r3, #8]
	pop	{r4, lr}
	bx	lr
.L203:
	.align	2
.L202:
	.word	escore
	.size	initEScore, .-initEScore
	.align	2
	.global	drawEScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEScore, %function
drawEScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L205
	ldr	r3, [r0, #20]
	ldr	ip, [r0, #8]
	ldr	r2, [r0, #12]
	ldr	r1, .L205+4
	ldrb	r0, [r0, #16]	@ zero_extendqisi2
	lsl	r3, r3, #23
	add	r2, r2, ip, lsl #3
	lsr	r3, r3, #23
	add	ip, r1, #712
	orr	r3, r3, #16384
	add	r1, r1, #716
	orr	r0, r0, #16384
	lsl	r2, r2, #2
	strh	r3, [ip, #2]	@ movhi
	strh	r0, [ip]	@ movhi
	strh	r2, [r1]	@ movhi
	bx	lr
.L206:
	.align	2
.L205:
	.word	escore
	.word	shadowOAM
	.size	drawEScore, .-drawEScore
	.align	2
	.global	initHScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	initHScore, %function
initHScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	ip, #200
	mov	r4, #32
	mov	lr, #8
	mov	r0, #150
	mov	r1, #4
	mov	r2, #26
	ldr	r3, .L209
	stm	r3, {r4, lr}
	str	ip, [r3, #20]
	str	r0, [r3, #16]
	str	r1, [r3, #12]
	str	r2, [r3, #8]
	pop	{r4, lr}
	bx	lr
.L210:
	.align	2
.L209:
	.word	hscore
	.size	initHScore, .-initHScore
	.align	2
	.global	drawHScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHScore, %function
drawHScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L212
	ldr	r3, [r0, #20]
	ldr	ip, [r0, #8]
	ldr	r2, [r0, #12]
	ldr	r1, .L212+4
	ldrb	r0, [r0, #16]	@ zero_extendqisi2
	lsl	r3, r3, #23
	add	r2, r2, ip, lsl #3
	lsr	r3, r3, #23
	add	ip, r1, #704
	orr	r3, r3, #16384
	add	r1, r1, #708
	orr	r0, r0, #16384
	lsl	r2, r2, #2
	strh	r3, [ip, #2]	@ movhi
	strh	r0, [ip]	@ movhi
	strh	r2, [r1]	@ movhi
	bx	lr
.L213:
	.align	2
.L212:
	.word	hscore
	.word	shadowOAM
	.size	drawHScore, .-drawHScore
	.align	2
	.global	initODigit
	.syntax unified
	.arm
	.fpu softvfp
	.type	initODigit, %function
initODigit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #8
	mov	lr, #192
	mov	ip, #150
	mov	r0, #0
	mov	r1, #26
	ldr	r3, .L216
	str	lr, [r3, #20]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	ip, [r3, #16]
	str	r0, [r3, #12]
	str	r1, [r3, #8]
	ldr	lr, [sp], #4
	bx	lr
.L217:
	.align	2
.L216:
	.word	oDigit
	.size	initODigit, .-initODigit
	.align	2
	.global	drawODigit
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawODigit, %function
drawODigit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L220
	push	{r4, lr}
	ldr	r3, [r1, #20]
	ldr	r2, .L220+4
	ldr	r4, [r1, #8]
	ldr	r0, [r1, #12]
	ldrb	lr, [r1, #16]	@ zero_extendqisi2
	lsl	r3, r3, #23
	add	ip, r2, #720
	add	r1, r0, r4, lsl #5
	lsr	r3, r3, #23
	add	r2, r2, #724
	strh	lr, [ip]	@ movhi
	strh	r3, [ip, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L221:
	.align	2
.L220:
	.word	oDigit
	.word	shadowOAM
	.size	drawODigit, .-drawODigit
	.align	2
	.global	initTDigit
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTDigit, %function
initTDigit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #8
	mov	lr, #184
	mov	ip, #150
	mov	r0, #0
	mov	r1, #26
	ldr	r3, .L224
	str	lr, [r3, #20]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	ip, [r3, #16]
	str	r0, [r3, #12]
	str	r1, [r3, #8]
	ldr	lr, [sp], #4
	bx	lr
.L225:
	.align	2
.L224:
	.word	tDigit
	.size	initTDigit, .-initTDigit
	.align	2
	.global	drawTDigit
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTDigit, %function
drawTDigit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L228
	push	{r4, lr}
	ldr	r3, [r1, #20]
	ldr	r2, .L228+4
	ldr	r4, [r1, #8]
	ldr	r0, [r1, #12]
	ldrb	lr, [r1, #16]	@ zero_extendqisi2
	lsl	r3, r3, #23
	add	ip, r2, #728
	add	r1, r0, r4, lsl #5
	lsr	r3, r3, #23
	add	r2, r2, #732
	strh	lr, [ip]	@ movhi
	strh	r3, [ip, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L229:
	.align	2
.L228:
	.word	tDigit
	.word	shadowOAM
	.size	drawTDigit, .-drawTDigit
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
	mov	r4, #10
	bl	initPlayer
	mov	r2, #5
	mov	r1, #16
	mov	lr, #12
	mov	ip, #6
	mov	r0, #1
	ldr	r3, .L237
.L231:
	str	r2, [r3, #4]
	add	r2, r2, #18
	cmp	r2, #95
	str	r4, [r3]
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	lr, [r3, #20]
	str	ip, [r3, #24]
	str	r0, [r3, #16]
	add	r3, r3, #28
	bne	.L231
	bl	initPaper
	bl	initSanitizer
	mov	r3, #192
	mov	lr, #0
	mov	r1, #8
	mov	ip, #150
	mov	r0, #26
	mov	r5, #184
	ldr	r2, .L237+4
	ldr	r4, [r2]
	ldr	r2, .L237+8
	str	r3, [r2, #20]
	ldr	r3, .L237+12
	cmp	r4, lr
	str	r1, [r2]
	str	r1, [r2, #4]
	str	ip, [r2, #16]
	str	lr, [r2, #12]
	str	r0, [r2, #8]
	str	lr, [r3, #12]
	str	r1, [r3]
	str	r1, [r3, #4]
	str	ip, [r3, #16]
	str	r0, [r3, #8]
	str	r5, [r3, #20]
	bne	.L232
	mov	r4, #32
	mov	lr, #200
	mov	r2, #3
	ldr	r3, .L237+16
.L236:
	str	r4, [r3]
	str	r1, [r3, #4]
	str	ip, [r3, #16]
	str	r0, [r3, #8]
	str	lr, [r3, #20]
	str	r2, [r3, #12]
.L233:
	mov	r1, #0
	mov	r4, #28
	ldr	r3, .L237+20
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	ldr	r0, .L237+24
	add	r2, r2, r2, lsr #31
	asr	r2, r2, #1
	str	r2, [r0]
	ldr	ip, .L237+28
	ldr	r0, .L237+32
	ldr	r2, .L237+36
	add	r3, r3, r3, lsr #31
	asr	r3, r3, #1
	str	r3, [ip]
	str	r3, [r0]
	str	r3, [r2]
	ldr	lr, .L237+40
	ldr	ip, .L237+44
	ldr	r0, .L237+48
	ldr	r2, .L237+52
	ldr	r3, .L237+56
	str	r4, [lr]
	str	r1, [ip]
	str	r1, [r0]
	str	r1, [r2]
	str	r1, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L232:
	cmp	r4, #1
	bne	.L233
	mov	r4, #32
	mov	lr, #200
	mov	r2, #4
	ldr	r3, .L237+60
	b	.L236
.L238:
	.align	2
.L237:
	.word	hearts
	.word	diff
	.word	oDigit
	.word	tDigit
	.word	escore
	.word	player
	.word	vOff
	.word	hOff
	.word	playerHoff
	.word	totalHoff
	.word	screenBlock
	.word	TPCollected
	.word	won
	.word	lost
	.word	timer
	.word	hscore
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
	ldr	r1, .L244
	push	{r4, r5, r6, lr}
	ldr	r2, [r1, #4]
	ldr	r5, .L244+4
	and	r2, r2, r5
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r0, [r1, #44]
	ldr	r3, [r1, #36]
	add	r3, r3, r0, lsl #5
	ldr	r4, .L244+8
	ldrb	r1, [r1]	@ zero_extendqisi2
	lsl	r3, r3, #2
	orr	r3, r3, #1024
	strh	r2, [r4, #2]	@ movhi
	strh	r1, [r4]	@ movhi
	strh	r3, [r4, #4]	@ movhi
	bl	drawHeart
	bl	drawPaper
	bl	drawCustomer
	bl	drawSanitizer
	ldr	r2, .L244+12
	ldr	r1, [r2, #20]
	add	ip, r4, #728
	and	r1, r1, r5
	strh	r1, [ip, #2]	@ movhi
	ldrb	r1, [r2, #16]	@ zero_extendqisi2
	ldr	r3, .L244+16
	strh	r1, [ip]	@ movhi
	ldr	ip, [r2, #8]
	ldr	r1, [r2, #12]
	ldr	r2, [r3, #20]
	add	r1, r1, ip, lsl #5
	ldr	r0, .L244+20
	add	ip, r4, #732
	strh	r1, [ip]	@ movhi
	and	r2, r2, r5
	add	r1, r4, #720
	ldr	ip, [r3, #8]
	ldr	r0, [r0]
	strh	r2, [r1, #2]	@ movhi
	ldrb	r2, [r3, #16]	@ zero_extendqisi2
	ldr	r3, [r3, #12]
	strh	r2, [r1]	@ movhi
	add	r3, r3, ip, lsl #5
	add	r2, r4, #724
	cmp	r0, #0
	strh	r3, [r2]	@ movhi
	bne	.L240
	ldr	r1, .L244+24
	ldr	r2, [r1, #20]
	add	r0, r1, #8
	ldm	r0, {r0, r3}
	and	r5, r5, r2
	ldrb	r1, [r1, #16]	@ zero_extendqisi2
	add	r3, r3, r0, lsl #3
	orr	r5, r5, #16384
	add	r0, r4, #712
	add	r4, r4, #716
.L243:
	orr	r2, r1, #16384
	lsl	r3, r3, #2
	strh	r5, [r0, #2]	@ movhi
	strh	r2, [r0]	@ movhi
	strh	r3, [r4]	@ movhi
.L241:
	mov	r3, #67108864
	ldr	r2, .L244+28
	ldrh	r1, [r2]
	ldr	r2, .L244+32
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L240:
	cmp	r0, #1
	bne	.L241
	ldr	r1, .L244+36
	ldr	r2, [r1, #20]
	add	r0, r1, #8
	ldm	r0, {r0, r3}
	and	r5, r5, r2
	add	r3, r3, r0, lsl #3
	ldrb	r1, [r1, #16]	@ zero_extendqisi2
	add	r0, r4, #704
	orr	r5, r5, #16384
	add	r4, r4, #708
	b	.L243
.L245:
	.align	2
.L244:
	.word	player
	.word	511
	.word	shadowOAM
	.word	tDigit
	.word	oDigit
	.word	diff
	.word	escore
	.word	hOff
	.word	vOff
	.word	hscore
	.size	drawGame, .-drawGame
	.global	__aeabi_idivmod
	.align	2
	.global	animateSprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateSprites, %function
animateSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #4
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L277
	ldr	r3, .L277+4
	ldr	r5, [r4, #32]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #36]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #40]
	str	r1, [r4, #36]
	bne	.L247
	ldr	r0, [r4, #44]
	ldr	r3, .L277+8
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L247:
	ldr	r3, .L277+12
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #36]
	ldr	r3, .L277+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #36]
	ldr	r3, .L277+12
	ldrh	r2, [r3, #48]
	tst	r2, #16
	bne	.L250
	mov	r2, #2
	ldrh	r3, [r3, #48]
	tst	r3, #32
	str	r2, [r4, #36]
	bne	.L252
.L253:
	mov	r3, #3
	str	r3, [r4, #36]
.L252:
	add	r5, r5, #1
	str	r5, [r4, #32]
.L254:
	mov	r9, #1
	ldr	r4, .L277+16
	ldr	r7, .L277+4
	ldr	r8, .L277+8
	add	r6, r4, #224
.L259:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	ldr	r5, [r4, #52]
	beq	.L256
	smull	r3, r2, r7, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	bne	.L256
	ldr	r0, [r4, #28]
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r8
	cmp	r1, #0
	moveq	r1, r9
	str	r1, [r4, #28]
.L256:
	add	r5, r5, #1
	str	r5, [r4, #52]
	add	r4, r4, #56
	cmp	r4, r6
	bne	.L259
	ldr	r5, .L277+20
	ldr	r8, .L277+4
	ldr	r6, .L277+8
	add	r7, r5, #880
.L261:
	ldr	r4, [r5, #36]
	smull	r3, r2, r8, r4
	asr	r3, r4, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r4, r3, lsl #2
	bne	.L260
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L260
	ldr	r0, [r5, #28]
	ldr	r1, [r5, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r6
	str	r1, [r5, #28]
.L260:
	add	r4, r4, #1
	str	r4, [r5, #36]
	add	r5, r5, #44
	cmp	r5, r7
	bne	.L261
	ldr	r5, .L277+24
	ldr	r9, .L277+28
	ldr	r8, .L277+32
	ldr	r7, .L277+8
	add	r6, r5, #264
.L263:
	ldr	r4, [r5, #36]
	add	r3, r4, r4, lsl #2
	add	r3, r3, r3, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	add	r3, r4, r3, lsl #1
	add	r3, r3, r9
	cmp	r8, r3, ror #2
	bcc	.L262
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L262
	ldr	r0, [r5, #28]
	ldr	r1, [r5, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r7
	str	r1, [r5, #28]
.L262:
	add	r4, r4, #1
	str	r4, [r5, #36]
	add	r5, r5, #44
	cmp	r5, r6
	bne	.L263
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L250:
	ldrh	r3, [r3, #48]
	tst	r3, #32
	beq	.L253
	ldr	r3, [r4, #36]
	cmp	r3, #4
	bne	.L252
	mov	r3, #0
	str	r6, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #32]
	b	.L254
.L278:
	.align	2
.L277:
	.word	player
	.word	1717986919
	.word	__aeabi_idivmod
	.word	67109120
	.word	customers
	.word	paper
	.word	sanitizer
	.word	715827880
	.word	357913940
	.size	animateSprites, .-animateSprites
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
	ldr	r3, .L331
	ldrh	r3, [r3, #48]
	ldr	r1, .L331+4
	tst	r3, #32
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r2, [r1]
	ldr	r4, .L331+8
	bne	.L326
	ldr	lr, [r4, #28]
	cmp	lr, #0
	add	r3, lr, #3
	movge	r3, lr
	add	r0, r4, #8
	ldm	r0, {r0, r5}
	ldr	ip, [r4, #20]
	add	r3, r0, r3, asr #2
	sub	ip, r5, ip
	add	r3, ip, r3, lsl #10
	ldr	r5, .L331+12
	lsl	r3, r3, #1
	ldrh	r3, [r5, r3]
	cmp	r3, #0
	bne	.L317
.L326:
	ldr	r5, .L331+16
.L280:
	ldr	r3, .L331
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L281
	ldr	lr, [r4, #28]
	cmp	lr, #0
	add	r3, lr, #3
	movge	r3, lr
	add	r7, r4, #20
	ldm	r7, {r7, ip}
	ldr	r6, [r4, #12]
	ldr	r8, [r4, #8]
	add	ip, r6, ip
	add	r0, ip, r7
	add	r3, r8, r3, asr #2
	sub	r0, r0, #1
	ldr	r9, .L331+12
	add	r3, r0, r3, lsl #10
	lsl	r3, r3, #1
	ldrh	r3, [r9, r3]
	cmp	r3, #0
	bne	.L329
.L281:
	ldr	r3, .L331
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L328
	ldr	r3, [r4, #28]
	add	r1, r3, #3
	cmp	r3, #0
	movlt	r3, r1
	ldr	r0, [r4, #8]
	ldr	r1, [r4, #16]
	ldr	lr, [r4, #12]
	sub	r1, r0, r1
	add	r3, r1, r3, asr #2
	add	r0, lr, r3, lsl #10
	ldr	ip, .L331+12
	lsl	r0, r0, #1
	ldrh	r0, [ip, r0]
	cmp	r0, #0
	lsl	r3, r3, #10
	bne	.L321
.L328:
	ldr	r6, .L331+20
.L283:
	ldr	r3, .L331
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L286
	ldr	lr, [r4, #8]
	ldr	r0, [r4, #28]
	ldr	r7, [r4, #16]
	add	r0, lr, r0
	ldr	r1, [r4, #24]
	add	r3, r0, r7
	sub	r3, r3, #1
	ldr	ip, [r4, #12]
	add	r1, r1, r3, lsl #10
	ldr	r8, .L331+12
	add	r1, r1, ip
	add	r1, r8, r1, lsl #1
	ldrh	r1, [r1, #-2]
	cmp	r1, #0
	lsl	r3, r3, #10
	beq	.L286
	add	r3, r3, ip
	lsl	r3, r3, #1
	ldrh	r3, [r8, r3]
	cmp	r0, #255
	movgt	r0, #0
	movle	r0, #1
	cmp	r3, #0
	moveq	r0, #0
	cmp	r0, #0
	bne	.L330
.L286:
	mov	r1, #67108864
	lsl	r3, r2, #16
	lsr	r3, r3, #16
	strh	r3, [r1, #84]	@ movhi
	bl	animateSprites
	add	r2, r4, #8
	ldr	r0, [r6]
	ldr	r1, [r5]
	ldm	r2, {r2, r3}
	sub	r2, r2, r0
	sub	r3, r3, r1
	stm	r4, {r2, r3}
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L321:
	ldr	r0, [r4, #24]
	add	r3, r3, r0
	add	r3, r3, lr
	add	r3, ip, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	beq	.L328
	ldr	r3, [r4]
	cmp	r3, #0
	ldr	r6, .L331+20
	ble	.L283
	ldr	r0, [r6]
	mvn	ip, r0
	cmp	r3, #79
	lsr	ip, ip, #31
	movgt	ip, #0
	cmp	ip, #0
	subne	r0, r0, #1
	str	r1, [r4, #8]
	strne	r0, [r6]
	b	.L283
.L329:
	add	lr, r8, lr
	sub	lr, lr, #1
	add	r0, r0, lr, lsl #10
	lsl	r0, r0, #1
	ldrh	r3, [r9, r0]
	cmp	r3, #0
	cmpne	ip, #1024
	bge	.L281
	ldr	ip, .L331+24
	ldr	r3, .L331+28
	ldr	r0, [ip]
	add	r6, r6, r7
	cmp	r0, r3
	str	r6, [r4, #12]
	bgt	.L281
	ldr	r6, .L331+32
	ldr	lr, [r6]
	cmp	lr, r3
	bgt	.L281
	ldr	r3, [r4, #4]
	cmp	r3, #120
	ble	.L281
	ldr	r3, [r5]
	cmp	r2, #15
	add	lr, lr, #1
	add	r0, r0, #1
	add	r3, r3, #1
	addle	r2, r2, #1
	str	lr, [r6]
	str	r0, [ip]
	str	r3, [r5]
	strle	r2, [r1]
	b	.L281
.L317:
	add	r3, r0, lr
	sub	r3, r3, #1
	add	r3, ip, r3, lsl #10
	lsl	r3, r3, #1
	ldrh	r3, [r5, r3]
	cmp	r3, #0
	beq	.L326
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ble	.L326
	ldr	lr, .L331+24
	ldr	r0, [lr]
	mvn	r5, r0
	cmp	r3, #119
	lsr	r5, r5, #31
	movgt	r5, #0
	cmp	r5, #0
	str	ip, [r4, #12]
	beq	.L326
	ldr	ip, .L331+32
	ldr	r5, .L331+16
	sub	r0, r0, #1
	ldr	r3, [r5]
	str	r0, [lr]
	ldr	r0, [ip]
	cmp	r2, #0
	sub	r0, r0, #1
	sub	r3, r3, #1
	subgt	r2, r2, #1
	str	r0, [ip]
	str	r3, [r5]
	strgt	r2, [r1]
	b	.L280
.L330:
	ldr	r3, [r6]
	add	lr, lr, r7
	cmp	r3, #95
	str	lr, [r4, #8]
	bgt	.L286
	ldr	r1, [r4]
	cmp	r1, #80
	addgt	r3, r3, #1
	strgt	r3, [r6]
	b	.L286
.L332:
	.align	2
.L331:
	.word	67109120
	.word	evy
	.word	player
	.word	collisionBitmapBitmap
	.word	playerHoff
	.word	vOff
	.word	totalHoff
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
	ldr	r1, .L338
	ldr	r0, .L338+4
	ldr	r3, [r1]
	ldr	r2, [r0]
	add	r3, r3, #1
	cmp	r2, #256
	push	{r4, lr}
	str	r3, [r1]
	ble	.L334
	ldr	ip, .L338+8
	ldr	r3, [ip]
	cmp	r3, #30
	bgt	.L336
	mov	lr, #67108864
	add	r1, r3, #1
	lsl	r3, r1, #24
	orr	r3, r3, #1073741824
	orr	r3, r3, #65536
	lsr	r3, r3, #16
	sub	r2, r2, #256
	str	r1, [ip]
	str	r2, [r0]
	strh	r3, [lr, #8]	@ movhi
.L336:
	bl	updatePlayer
	bl	updatePaper
	bl	updateSanitizer
	pop	{r4, lr}
	b	updateCustomer
.L334:
	cmp	r2, #0
	bge	.L336
	ldr	ip, .L338+8
	ldr	r3, [ip]
	cmp	r3, #28
	ble	.L336
	mov	lr, #67108864
	sub	r1, r3, #1
	lsl	r3, r1, #24
	orr	r3, r3, #1073741824
	orr	r3, r3, #65536
	lsr	r3, r3, #16
	add	r2, r2, #256
	str	r1, [ip]
	str	r2, [r0]
	strh	r3, [lr, #8]	@ movhi
	b	.L336
.L339:
	.align	2
.L338:
	.word	timer
	.word	hOff
	.word	screenBlock
	.size	updateGame, .-updateGame
	.comm	evy,4,4
	.comm	heartCount,4,4
	.comm	distance,8,8
	.comm	dy,8,8
	.comm	dx,8,8
	.comm	hitflag,4,4
	.comm	playerHealth,4,4
	.comm	speed,8,8
	.comm	timer,4,4
	.comm	oDigit,24,4
	.comm	tDigit,24,4
	.comm	hscore,24,4
	.comm	escore,24,4
	.comm	hearts,140,4
	.comm	sanitizer,264,4
	.comm	customers,224,4
	.comm	player,56,4
	.comm	paper,880,4
	.comm	shadowOAM,1024,4
	.comm	diff,4,4
	.comm	totalHoff,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	totalPaper,4,4
	.comm	screenBlock,4,4
	.comm	playerHoff,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
