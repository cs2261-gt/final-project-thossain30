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
	mov	r6, #155
	mov	r5, #200
	mov	r2, #0
	mov	lr, #4
	mov	ip, #1
	mov	r0, #32
	mov	r4, #16
	ldr	r3, .L4
	ldr	r1, [r3]
	ldr	r3, .L4+4
	add	r1, r1, r6
	str	r1, [r3, #8]
	ldr	r1, .L4+8
	ldr	r1, [r1]
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
	str	lr, [r2]
	ldr	r2, .L4+24
	str	r6, [r3]
	str	r5, [r3, #4]
	str	lr, [r3, #48]
	str	r4, [r2]
	str	ip, [r3, #20]
	str	ip, [r3, #16]
	str	r0, [r3, #28]
	str	r0, [r3, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	vOff
	.word	player
	.word	playerHoff
	.word	hitflag
	.word	evb
	.word	playerHealth
	.word	eva
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
	ldr	ip, [r1, #44]
	ldr	r2, [r1, #36]
	ldrb	r0, [r1]	@ zero_extendqisi2
	add	r2, r2, ip, lsl #5
	ldr	r1, .L7+4
	lsl	r2, r2, #2
	orr	r0, r0, #1024
	orr	r2, r2, #1024
	strh	r3, [r1, #2]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	r2, [r1, #4]	@ movhi
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
	strh	r5, [r2, #40]	@ movhi
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
	orr	r1, r1, #2048
	cmp	ip, #240
	orr	r0, r0, r6
	and	ip, lr, #255
	strh	r1, [r2, #44]	@ movhi
	strh	r0, [r2, #42]	@ movhi
	strh	ip, [r2, #40]	@ movhi
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
	.word	12284
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
	orr	r1, r1, #2048
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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	adr	r3, .L171
	ldmia	r3, {r2-r3}
	ldr	r1, .L171+8
	stm	r1, {r2-r3}
	ldr	fp, .L171+12
	ldr	r10, .L171+16
	sub	sp, sp, #36
.L102:
	ldr	r3, [fp, #4]
	ldr	r0, [r10, #4]
	ldr	r4, .L171+136
	sub	r0, r0, r3
	mov	lr, pc
	bx	r4
	mov	r6, r0
	mov	r7, r1
	ldr	r3, [fp]
	ldr	r8, .L171+88
	ldr	r0, [r10]
	stm	r8, {r6-r7}
	sub	r0, r0, r3
	mov	lr, pc
	bx	r4
	mov	r4, r0
	mov	r5, r1
	ldr	r1, .L171+132
	mov	r2, r6
	stm	r1, {r4-r5}
	mov	r3, r7
	mov	r0, r6
	mov	r1, r7
	ldr	r6, .L171+20
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
	ldr	ip, .L171+140
	mov	r3, r1
	mov	r2, r0
	mov	r1, r5
	mov	r0, r4
	mov	lr, pc
	bx	ip
	ldr	r2, .L171+24
	mov	lr, pc
	bx	r2
	ldr	r6, [r8]
	mov	r9, r1
	ldr	r7, [r8, #4]
	mov	r8, r0
	ldr	r0, .L171+28
	mov	r1, r7
	stm	r0, {r8-r9}
	mov	r2, #0
	mov	r0, r6
	mov	r3, #0
	ldr	ip, .L171+112
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L151
	ldr	r3, .L171+132
	ldr	r4, [r3]
	ldr	r5, [r3, #4]
	mov	r0, r4
	mov	r1, r5
	mov	r2, #0
	mov	r3, #0
	ldr	ip, .L171+112
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L152
	mov	r3, r5
	mov	r2, r4
	mov	r1, r7
	ldr	ip, .L171+112
	mov	r0, r6
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	movne	r3, #6
	moveq	r3, #4
	mov	r0, r6
	str	r3, [fp, #32]
	mov	r1, r7
	mov	r2, #0
	mov	r3, #0
	ldr	ip, .L171+108
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L109
.L110:
	ldr	r3, .L171+132
	ldm	r3, {r4, r5}
.L106:
	mov	r0, r4
	mov	r1, r5
	mov	r2, #0
	mov	r3, #0
	ldr	ip, .L171+108
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L165
.L77:
	mov	r0, r6
	mov	r1, r7
	mov	r2, #0
	mov	r3, #0
	ldr	ip, .L171+108
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L166
.L84:
	ldr	r3, [fp, #44]
	cmp	r3, #0
	beq	.L89
	ldr	r3, .L171+40
	ldr	r3, [r3]
	tst	r3, #1
	bne	.L89
	ldr	r0, [fp, #8]
	ldr	r3, .L171+136
	mov	lr, pc
	bx	r3
	ldr	r2, .L171+8
	mov	r4, r0
	mov	r5, r1
	mov	r0, r6
	mov	r1, r7
	ldmia	r2, {r6-r7}
	mov	r3, r9
	mov	r2, r8
	ldr	ip, .L171+32
	mov	lr, pc
	bx	ip
	ldr	ip, .L171+20
	mov	r2, r6
	mov	r3, r7
	mov	lr, pc
	bx	ip
	mov	r3, r1
	mov	r2, r0
	mov	r1, r5
	mov	r0, r4
	ldr	r4, .L171+140
	mov	lr, pc
	bx	r4
	ldr	r2, .L171+144
	mov	lr, pc
	bx	r2
	ldr	r1, .L171+132
	mov	r2, r8
	mov	r3, r9
	str	r0, [fp, #8]
	ldr	ip, .L171+32
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	ip
	ldr	ip, .L171+20
	mov	r2, r6
	mov	r3, r7
	mov	lr, pc
	bx	ip
	ldr	r3, .L171+136
	mov	r4, r0
	ldr	r0, [fp, #12]
	mov	r5, r1
	mov	lr, pc
	bx	r3
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	ldr	r4, .L171+140
	mov	lr, pc
	bx	r4
	ldr	r2, .L171+144
	mov	lr, pc
	bx	r2
	str	r0, [fp, #12]
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
	ldr	ip, .L171+56
	asr	r2, r2, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L90
	ldr	r3, [fp, #40]
	cmp	r3, #0
	bne	.L167
.L90:
	ldr	r3, .L171+104
	ldr	r3, [r3]
	cmp	r3, #1
	ldr	r3, .L171+100
	ldr	r3, [r3]
	beq	.L103
	b	.L172
.L173:
	.align	3
.L171:
	.word	-858993459
	.word	1073007820
	.word	speed
	.word	customers
	.word	player
	.word	__aeabi_dmul
	.word	sqrt
	.word	distance
	.word	__aeabi_ddiv
	.word	lost
	.word	timer
	.word	oldButtons
	.word	buttons
	.word	1717986919
	.word	collision
	.word	vOff
	.word	totalHoff
	.word	customers+224
	.word	3416
	.word	owSound
	.word	eva
	.word	evb
	.word	dx
	.word	collisionBitmapBitmap
	.word	hearts
	.word	playerHealth
	.word	hitflag
	.word	__aeabi_dcmplt
	.word	__aeabi_dcmpgt
	.word	playSoundB
	.word	4106
	.word	punchSound
	.word	paper
	.word	dy
	.word	__aeabi_i2d
	.word	__aeabi_dadd
	.word	__aeabi_d2iz
.L172:
.L92:
	cmp	r3, #0
	moveq	r2, #1
	ldreq	r3, .L171+36
	streq	r2, [r3]
	ldr	r3, .L171+40
	ldr	r1, .L171+52
	ldr	r2, [r3]
	smull	r3, r1, r2, r1
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl #2
	moveq	r2, #16
	ldreq	r1, .L171+84
	streq	r3, [r1]
	ldreq	r3, .L171+80
	streq	r2, [r3]
	ldr	r3, .L171+44
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L164
	ldr	r3, .L171+48
	ldrh	r4, [r3]
	ands	r4, r4, #1
	bne	.L164
	ldr	r2, [r10, #32]
	ldr	r1, .L171+52
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
	ldr	ip, .L171+56
	add	r3, r3, #30
	add	r2, r2, #30
	sub	r1, r1, #15
	sub	r0, r0, #15
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L99
	ldr	r3, [fp, #40]
	cmp	r3, #0
	bne	.L159
.L164:
	ldr	r2, [fp, #8]
	ldr	r1, [fp, #12]
.L96:
	mov	r0, #67108864
	ldr	r3, .L171+84
	ldr	ip, [r3]
	ldr	r3, .L171+80
	ldr	r3, [r3]
	orr	r3, r3, ip, lsl #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r0, #82]	@ movhi
	ldr	r3, .L171+60
	ldr	r0, [r3]
	ldr	r3, .L171+64
	ldr	r3, [r3]
	sub	r1, r1, r0
	sub	r2, r2, r3
	ldr	r3, .L171+68
	stm	fp, {r1, r2}
	add	fp, fp, #56
	cmp	r3, fp
	bne	.L102
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L151:
	mov	r0, r6
	mov	r1, r7
	mov	r2, #0
	mov	r3, #0
	ldr	ip, .L171+108
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L168
	mov	r0, r6
	mov	r1, r7
	mov	r2, #0
	mov	r3, #0
	ldr	ip, .L171+112
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L77
	b	.L110
.L167:
	mov	r2, #0
	ldr	r1, .L171+72
	ldr	r0, .L171+76
	ldr	r3, .L171+116
	mov	lr, pc
	bx	r3
	mov	r2, #3
	mov	r3, #13
	ldr	ip, .L171+80
	ldr	r1, .L171+132
	str	r2, [ip]
	ldmia	r1, {r0-r1}
	ldr	r2, .L171+84
	ldr	r8, .L171+144
	str	r3, [r2]
	str	r0, [sp, #24]
	str	r1, [sp, #28]
	mov	lr, pc
	bx	r8
	ldr	r3, .L171+88
	ldr	r2, [r10, #8]
	ldmia	r3, {r4-r5}
	add	r9, r2, r0
	mov	r1, r5
	str	r2, [sp, #20]
	mov	r7, r0
	mov	r0, r4
	mov	lr, pc
	bx	r8
	mvn	lr, r9
	ldr	r8, [r10, #12]
	add	r6, r9, #1
	add	r1, r8, r0
	ldr	ip, .L171+92
	lsl	r6, r6, #10
	add	r3, r6, r1
	add	r3, ip, r3, lsl #1
	ldrh	r3, [r3, #2]
	lsr	lr, lr, #31
	cmp	r3, #0
	movne	r3, lr
	moveq	r3, #0
	cmp	r1, #0
	movlt	r3, #0
	andge	r3, r3, #1
	cmp	r3, #0
	ldr	r2, [sp, #20]
	bne	.L169
.L91:
	ldr	r3, .L171+100
	ldr	r3, [r3]
.L103:
	mov	r1, #0
	ldr	r0, .L171+96
	rsb	r2, r3, r3, lsl #3
	add	r2, r0, r2, lsl #2
	str	r1, [r2, #16]
	ldr	r0, .L171+100
	ldr	r2, .L171+104
	sub	r3, r3, #1
	str	r3, [r0]
	str	r1, [r2]
	b	.L92
.L152:
	mov	r0, r6
	mov	r1, r7
	mov	r2, #0
	mov	r3, #0
	ldr	ip, .L171+108
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L106
	mov	r0, r4
	mov	r1, r5
	mov	r2, #0
	mov	r3, #0
	ldr	ip, .L171+112
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L106
.L109:
	mov	r3, r5
	mov	r2, r4
	mov	r0, r6
	ldr	ip, .L171+112
	add	r1, r7, #-2147483648
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	movne	r3, #7
	moveq	r3, #4
	str	r3, [fp, #32]
.L73:
	mov	r0, r6
	mov	r1, r7
	mov	r2, #0
	mov	r3, #0
	ldr	ip, .L171+112
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L106
.L107:
	mov	r0, r4
	mov	r1, r5
	mov	r2, #0
	mov	r3, #0
	ldr	ip, .L171+108
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L84
.L104:
	mov	r3, r5
	mov	r2, r4
	mov	r0, r6
	mov	r1, r7
	ldr	ip, .L171+108
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	movne	r3, #7
	moveq	r3, #5
	str	r3, [fp, #32]
	b	.L84
.L165:
	add	r3, r5, #-2147483648
	mov	r2, r4
	mov	r1, r7
	ldr	ip, .L171+108
	mov	r0, r6
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	movne	r3, #5
	moveq	r3, #6
	mov	r0, r6
	str	r3, [fp, #32]
	mov	r1, r7
	mov	r2, #0
	mov	r3, #0
	ldr	ip, .L171+108
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L84
	ldr	r3, .L171+132
	ldm	r3, {r4, r5}
	b	.L104
.L168:
	ldr	r3, .L171+132
	ldr	r4, [r3]
	ldr	r5, [r3, #4]
	mov	r0, r4
	mov	r1, r5
	mov	r2, #0
	mov	r3, #0
	ldr	ip, .L171+112
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L73
	b	.L109
.L159:
	mov	r2, r4
	ldr	r3, .L171+116
	ldr	r1, .L171+120
	ldr	r0, .L171+124
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, [fp, #24]
	sub	r3, r3, #1
	str	r3, [fp, #24]
	str	r2, [fp, #44]
.L99:
	ldr	r3, [fp, #40]
	cmp	r3, #0
	beq	.L164
	ldr	r1, [fp, #24]
	cmp	r1, #0
	bne	.L164
	ldr	r0, .L171+128
	mov	r3, #16
	mov	r2, r0
	str	r1, [fp, #40]
.L101:
	ldr	r1, [r2, #736]
	cmp	r1, #0
	beq	.L170
	add	r3, r3, #1
	cmp	r3, #20
	add	r2, r2, #44
	bne	.L101
	b	.L164
.L166:
	ldr	r3, .L171+132
	ldm	r3, {r4, r5}
	b	.L107
.L169:
	ldr	r3, [r10]
	add	r3, r3, #158
	cmp	r9, r3
	bgt	.L91
	ldr	r3, [r10, #24]
	add	r3, r8, r3
	add	r0, r3, r0
	add	r3, r6, r0
	sub	r3, r3, #1024
	lsl	r3, r3, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #0
	beq	.L91
	ldr	r3, [r10, #28]
	add	r3, r2, r3
	add	r7, r3, r7
	add	r0, r0, r7, lsl #10
	lsl	r3, r0, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #0
	lsl	r3, r7, #10
	beq	.L91
	add	r3, r1, r3
	lsl	r3, r3, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #0
	beq	.L91
	mov	r0, r2
	ldr	r6, .L171+136
	mov	lr, pc
	bx	r6
	ldr	r7, .L171+140
	add	r3, sp, #24
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r7
	ldr	r9, .L171+144
	mov	lr, pc
	bx	r9
	mov	r3, r0
	mov	r0, r8
	str	r3, [r10, #8]
	mov	lr, pc
	bx	r6
	mov	r2, r4
	mov	r3, r5
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r9
	str	r0, [r10, #12]
	b	.L91
.L170:
	mov	ip, #1
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl ip
	ldr	r1, [fp, #12]
	ldr	r2, [fp, #8]
	add	r3, r0, r3, lsl #2
	str	ip, [r3, #32]
	str	r2, [r3, #8]
	str	r1, [r3, #12]
	b	.L96
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
	ldr	r2, .L178
	ldr	r3, .L178+4
	ldr	r0, [r2]
	ldr	ip, [r3]
	ldr	r3, .L178+8
	add	r2, r0, #64
	add	ip, ip, r1
	add	r0, r0, #1088
.L175:
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
	bne	.L175
	pop	{r4, r5, r6, lr}
	bx	lr
.L179:
	.align	2
.L178:
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
	ldr	r2, .L188
	ldr	r3, .L188+4
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r5, [r2]
	ldr	r6, [r3]
	ldr	r3, .L188+8
	mov	lr, #512
	ldr	r2, .L188+12
	ldr	r4, .L188+16
	add	r7, r5, #160
	add	r8, r6, #240
	add	ip, r3, #352
	b	.L184
.L183:
	strh	lr, [r2]	@ movhi
.L182:
	add	r3, r3, #44
	cmp	r3, ip
	add	r2, r2, #8
	beq	.L187
.L184:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	beq	.L183
	ldr	r9, [r3, #24]
	ldr	r1, [r3, #28]
	ldr	r0, [r3, #4]
	add	r1, r1, r9, lsl #5
	lsl	r1, r1, #1
	ldr	r9, [r3]
	orr	r1, r1, #2048
	cmp	r0, #240
	and	r0, r0, r4
	strh	r1, [r2, #4]	@ movhi
	orr	r0, r0, #16384
	and	r1, r9, #255
	strh	r0, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	bhi	.L183
	cmp	r9, #160
	bhi	.L183
	ldr	r1, [r3, #12]
	cmp	r1, r5
	blt	.L183
	ldr	r0, [r3, #8]
	cmp	r0, r6
	blt	.L183
	cmp	r1, r7
	bgt	.L183
	cmp	r1, r8
	bgt	.L183
	b	.L182
.L187:
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L189:
	.align	2
.L188:
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
	ldr	r4, .L202
	ldr	r5, .L202+4
	ldr	r9, .L202+8
	ldr	r8, .L202+12
	ldr	r7, .L202+16
	ldr	r10, .L202+20
	ldr	fp, .L202+24
	sub	sp, sp, #20
	add	r6, r4, #352
.L192:
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
	beq	.L191
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L191
	ldr	r3, [r10]
	cmp	r3, #3
	ble	.L201
.L191:
	ldr	r2, [r4, #8]
	ldr	r1, [r8]
	ldr	r3, [r4, #12]
	sub	r2, r2, r1
	ldr	r1, [r7]
	sub	r3, r3, r1
	str	r2, [r4, #4]
	str	r3, [r4], #44
	cmp	r4, r6
	bne	.L192
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L201:
	add	r3, r3, #1
	str	r3, [r10]
	rsb	ip, r3, r3, lsl #3
	mov	r3, #1
	ldr	r2, .L202+28
	add	ip, r2, ip, lsl #2
	str	r3, [ip, #16]
	mov	r2, #0
	ldr	r3, .L202+32
	mov	r1, fp
	ldr	r0, .L202+36
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r3, [r4, #32]
	b	.L191
.L203:
	.align	2
.L202:
	.word	sanitizer
	.word	player
	.word	collision
	.word	totalHoff
	.word	vOff
	.word	playerHealth
	.word	13867
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
	ldr	r3, .L208
.L205:
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
	bne	.L205
	pop	{r4, lr}
	bx	lr
.L209:
	.align	2
.L208:
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
	ldr	r3, .L216
	ldr	r2, .L216+4
	ldr	r4, .L216+8
	add	ip, r3, #140
.L213:
	ldr	r1, [r3, #16]
	cmp	r1, #0
	strheq	r5, [r2]	@ movhi
	beq	.L212
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
.L212:
	add	r3, r3, #28
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L213
	pop	{r4, r5, lr}
	bx	lr
.L217:
	.align	2
.L216:
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
	ldr	r3, .L220
	stm	r3, {r4, lr}
	str	ip, [r3, #20]
	str	r0, [r3, #16]
	str	r1, [r3, #12]
	str	r2, [r3, #8]
	pop	{r4, lr}
	bx	lr
.L221:
	.align	2
.L220:
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
	ldr	r0, .L223
	ldr	r3, [r0, #20]
	ldr	ip, [r0, #8]
	ldr	r2, [r0, #12]
	ldr	r1, .L223+4
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
.L224:
	.align	2
.L223:
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
	ldr	r3, .L227
	stm	r3, {r4, lr}
	str	ip, [r3, #20]
	str	r0, [r3, #16]
	str	r1, [r3, #12]
	str	r2, [r3, #8]
	pop	{r4, lr}
	bx	lr
.L228:
	.align	2
.L227:
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
	ldr	r0, .L230
	ldr	r3, [r0, #20]
	ldr	ip, [r0, #8]
	ldr	r2, [r0, #12]
	ldr	r1, .L230+4
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
.L231:
	.align	2
.L230:
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
	ldr	r3, .L234
	str	lr, [r3, #20]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	ip, [r3, #16]
	str	r0, [r3, #12]
	str	r1, [r3, #8]
	ldr	lr, [sp], #4
	bx	lr
.L235:
	.align	2
.L234:
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
	ldr	r1, .L238
	push	{r4, lr}
	ldr	r3, [r1, #20]
	ldr	r2, .L238+4
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
.L239:
	.align	2
.L238:
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
	ldr	r3, .L242
	str	lr, [r3, #20]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	ip, [r3, #16]
	str	r0, [r3, #12]
	str	r1, [r3, #8]
	ldr	lr, [sp], #4
	bx	lr
.L243:
	.align	2
.L242:
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
	ldr	r1, .L246
	push	{r4, lr}
	ldr	r3, [r1, #20]
	ldr	r2, .L246+4
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
.L247:
	.align	2
.L246:
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
	ldr	r3, .L255
.L249:
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
	bne	.L249
	bl	initPaper
	bl	initSanitizer
	mov	r3, #192
	mov	lr, #0
	mov	r1, #8
	mov	ip, #150
	mov	r0, #26
	mov	r5, #184
	ldr	r2, .L255+4
	ldr	r4, [r2]
	ldr	r2, .L255+8
	str	r3, [r2, #20]
	ldr	r3, .L255+12
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
	bne	.L250
	mov	r4, #32
	mov	lr, #200
	mov	r2, #3
	ldr	r3, .L255+16
.L254:
	str	r4, [r3]
	str	r1, [r3, #4]
	str	ip, [r3, #16]
	str	r0, [r3, #8]
	str	lr, [r3, #20]
	str	r2, [r3, #12]
.L251:
	mov	r1, #0
	mov	r4, #28
	ldr	r3, .L255+20
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	ldr	r0, .L255+24
	add	r2, r2, r2, lsr #31
	asr	r2, r2, #1
	str	r2, [r0]
	ldr	ip, .L255+28
	ldr	r0, .L255+32
	ldr	r2, .L255+36
	add	r3, r3, r3, lsr #31
	asr	r3, r3, #1
	str	r3, [ip]
	str	r3, [r0]
	str	r3, [r2]
	ldr	lr, .L255+40
	ldr	ip, .L255+44
	ldr	r0, .L255+48
	ldr	r2, .L255+52
	ldr	r3, .L255+56
	str	r4, [lr]
	str	r1, [ip]
	str	r1, [r0]
	str	r1, [r2]
	str	r1, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L250:
	cmp	r4, #1
	bne	.L251
	mov	r4, #32
	mov	lr, #200
	mov	r2, #4
	ldr	r3, .L255+60
	b	.L254
.L256:
	.align	2
.L255:
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
	ldr	r1, .L262
	push	{r4, r5, r6, lr}
	ldr	r2, [r1, #4]
	ldr	r5, .L262+4
	and	r2, r2, r5
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r0, [r1, #44]
	ldr	r3, [r1, #36]
	ldrb	r1, [r1]	@ zero_extendqisi2
	add	r3, r3, r0, lsl #5
	ldr	r4, .L262+8
	lsl	r3, r3, #2
	orr	r1, r1, #1024
	orr	r3, r3, #1024
	strh	r2, [r4, #2]	@ movhi
	strh	r1, [r4]	@ movhi
	strh	r3, [r4, #4]	@ movhi
	bl	drawHeart
	bl	drawPaper
	bl	drawCustomer
	bl	drawSanitizer
	ldr	r2, .L262+12
	ldr	r1, [r2, #20]
	add	ip, r4, #728
	and	r1, r1, r5
	strh	r1, [ip, #2]	@ movhi
	ldrb	r1, [r2, #16]	@ zero_extendqisi2
	ldr	r3, .L262+16
	strh	r1, [ip]	@ movhi
	ldr	ip, [r2, #8]
	ldr	r1, [r2, #12]
	ldr	r2, [r3, #20]
	add	r1, r1, ip, lsl #5
	ldr	r0, .L262+20
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
	bne	.L258
	ldr	r1, .L262+24
	ldr	r2, [r1, #20]
	add	r0, r1, #8
	ldm	r0, {r0, r3}
	and	r5, r5, r2
	ldrb	r1, [r1, #16]	@ zero_extendqisi2
	add	r3, r3, r0, lsl #3
	orr	r5, r5, #16384
	add	r0, r4, #712
	add	r4, r4, #716
.L261:
	orr	r2, r1, #16384
	lsl	r3, r3, #2
	strh	r5, [r0, #2]	@ movhi
	strh	r2, [r0]	@ movhi
	strh	r3, [r4]	@ movhi
.L259:
	mov	r3, #67108864
	ldr	r2, .L262+28
	ldrh	r1, [r2]
	ldr	r2, .L262+32
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L258:
	cmp	r0, #1
	bne	.L259
	ldr	r1, .L262+36
	ldr	r2, [r1, #20]
	add	r0, r1, #8
	ldm	r0, {r0, r3}
	and	r5, r5, r2
	add	r3, r3, r0, lsl #3
	ldrb	r1, [r1, #16]	@ zero_extendqisi2
	add	r0, r4, #704
	orr	r5, r5, #16384
	add	r4, r4, #708
	b	.L261
.L263:
	.align	2
.L262:
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
	ldr	r4, .L295
	ldr	r3, .L295+4
	ldr	r5, [r4, #32]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #36]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #40]
	str	r1, [r4, #36]
	bne	.L265
	ldr	r0, [r4, #44]
	ldr	r3, .L295+8
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L265:
	ldr	r3, .L295+12
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #36]
	ldr	r3, .L295+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #36]
	ldr	r3, .L295+12
	ldrh	r2, [r3, #48]
	tst	r2, #16
	bne	.L268
	mov	r2, #2
	ldrh	r3, [r3, #48]
	tst	r3, #32
	str	r2, [r4, #36]
	bne	.L270
.L271:
	mov	r3, #3
	str	r3, [r4, #36]
.L270:
	add	r5, r5, #1
	str	r5, [r4, #32]
.L272:
	mov	r9, #1
	ldr	r4, .L295+16
	ldr	r7, .L295+4
	ldr	r8, .L295+8
	add	r6, r4, #224
.L277:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	ldr	r5, [r4, #52]
	beq	.L274
	smull	r3, r2, r7, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	bne	.L274
	ldr	r0, [r4, #28]
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r8
	cmp	r1, #0
	moveq	r1, r9
	str	r1, [r4, #28]
.L274:
	add	r5, r5, #1
	str	r5, [r4, #52]
	add	r4, r4, #56
	cmp	r4, r6
	bne	.L277
	ldr	r5, .L295+20
	ldr	r8, .L295+4
	ldr	r6, .L295+8
	add	r7, r5, #880
.L279:
	ldr	r4, [r5, #36]
	smull	r3, r2, r8, r4
	asr	r3, r4, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r4, r3, lsl #2
	bne	.L278
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L278
	ldr	r0, [r5, #28]
	ldr	r1, [r5, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r6
	str	r1, [r5, #28]
.L278:
	add	r4, r4, #1
	str	r4, [r5, #36]
	add	r5, r5, #44
	cmp	r5, r7
	bne	.L279
	ldr	r5, .L295+24
	ldr	r9, .L295+28
	ldr	r8, .L295+32
	ldr	r7, .L295+8
	add	r6, r5, #352
.L281:
	ldr	r4, [r5, #36]
	add	r3, r4, r4, lsl #2
	add	r3, r3, r3, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	add	r3, r4, r3, lsl #1
	add	r3, r3, r9
	cmp	r8, r3, ror #2
	bcc	.L280
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L280
	ldr	r0, [r5, #28]
	ldr	r1, [r5, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r7
	str	r1, [r5, #28]
.L280:
	add	r4, r4, #1
	str	r4, [r5, #36]
	add	r5, r5, #44
	cmp	r5, r6
	bne	.L281
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L268:
	ldrh	r3, [r3, #48]
	tst	r3, #32
	beq	.L271
	ldr	r3, [r4, #36]
	cmp	r3, #4
	bne	.L270
	mov	r3, #0
	str	r6, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #32]
	b	.L272
.L296:
	.align	2
.L295:
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
	ldr	r3, .L345
	push	{r4, r5, r6, r7, r8, lr}
	ldrh	r3, [r3, #48]
	ldr	r4, .L345+4
	tst	r3, #32
	add	r1, r4, #8
	ldm	r1, {r1, r3}
	bne	.L340
	ldr	r0, [r4, #28]
	cmp	r0, #0
	add	r2, r0, #3
	movge	r2, r0
	ldr	ip, [r4, #20]
	add	r2, r1, r2, asr #2
	sub	ip, r3, ip
	ldr	lr, .L345+8
	add	r2, ip, r2, lsl #10
	lsl	r2, r2, #1
	ldrh	r2, [lr, r2]
	cmp	r2, #0
	bne	.L331
.L340:
	ldr	r5, .L345+12
.L298:
	ldr	r2, .L345
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L299
	ldr	r7, [r4, #28]
	cmp	r7, #0
	add	r2, r7, #3
	movge	r2, r7
	ldr	ip, [r4, #24]
	ldr	lr, [r4, #20]
	add	ip, r3, ip
	add	r0, ip, lr
	add	r2, r1, r2, asr #2
	sub	r0, r0, #1
	ldr	r6, .L345+8
	add	r2, r0, r2, lsl #10
	lsl	r2, r2, #1
	ldrh	r2, [r6, r2]
	cmp	r2, #0
	bne	.L343
.L299:
	ldr	r2, .L345
	ldrh	r2, [r2, #48]
	tst	r2, #64
	bne	.L342
	ldr	r2, [r4, #28]
	add	r0, r2, #3
	cmp	r2, #0
	movlt	r2, r0
	ldr	r0, [r4, #16]
	sub	r0, r1, r0
	add	r2, r0, r2, asr #2
	add	ip, r3, r2, lsl #10
	ldr	lr, .L345+8
	lsl	ip, ip, #1
	ldrh	ip, [lr, ip]
	cmp	ip, #0
	lsl	r2, r2, #10
	bne	.L335
.L342:
	ldr	r6, .L345+16
.L300:
	ldr	r2, .L345
	ldrh	r2, [r2, #48]
	tst	r2, #128
	bne	.L301
	ldr	r7, [r4, #28]
	ldr	ip, [r4, #16]
	add	r7, r1, r7
	ldr	r0, [r4, #24]
	add	r2, r7, ip
	sub	r2, r2, #1
	add	r0, r0, r2, lsl #10
	ldr	lr, .L345+8
	add	r0, r0, r3
	add	r0, lr, r0, lsl #1
	ldrh	r0, [r0, #-2]
	cmp	r0, #0
	lsl	r2, r2, #10
	beq	.L301
	add	r2, r2, r3
	lsl	r2, r2, #1
	ldrh	r2, [lr, r2]
	cmp	r7, #255
	movgt	r7, #0
	movle	r7, #1
	cmp	r2, #0
	moveq	r7, #0
	cmp	r7, #0
	bne	.L344
.L301:
	add	r3, r3, r1, lsl #10
	ldr	r2, .L345+20
	lsl	r3, r3, #1
	ldrh	r2, [r2, r3]
	ldr	r3, .L345+24
	cmp	r2, r3
	moveq	r2, #3
	moveq	r3, #13
	ldreq	r7, .L345+28
	ldreq	r8, .L345+32
	ldrne	r7, .L345+28
	ldrne	r8, .L345+32
	streq	r2, [r7]
	streq	r3, [r8]
	bl	animateSprites
	mov	r0, #67108864
	ldr	r2, [r8]
	ldr	r3, [r7]
	ldr	r1, [r6]
	orr	r3, r3, r2, lsl #8
	ldr	r2, [r4, #8]
	ldr	ip, [r5]
	sub	r2, r2, r1
	ldr	r1, [r4, #12]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r1, r1, ip
	strh	r3, [r0, #82]	@ movhi
	str	r1, [r4, #4]
	str	r2, [r4]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L335:
	ldr	ip, [r4, #24]
	add	r2, r2, ip
	add	r2, r2, r3
	add	r2, lr, r2, lsl #1
	ldrh	r2, [r2, #-2]
	cmp	r2, #0
	beq	.L342
	ldr	r2, [r4]
	cmp	r2, #0
	ldr	r6, .L345+16
	ble	.L300
	ldr	r1, [r6]
	cmp	r2, #79
	movgt	r2, #0
	movle	r2, #1
	cmp	r1, #0
	movlt	r2, #0
	cmp	r2, #0
	subne	r1, r1, #1
	strne	r1, [r6]
	str	r0, [r4, #8]
	mov	r1, r0
	b	.L300
.L343:
	add	r2, r7, r1
	sub	r2, r2, #1
	add	r0, r0, r2, lsl #10
	lsl	r0, r0, #1
	ldrh	r2, [r6, r0]
	cmp	r2, #0
	cmpne	ip, #1024
	bge	.L299
	ldr	ip, .L345+36
	ldr	r2, .L345+40
	ldr	r0, [ip]
	add	r3, r3, lr
	cmp	r0, r2
	str	r3, [r4, #12]
	bgt	.L299
	ldr	r6, .L345+44
	ldr	lr, [r6]
	cmp	lr, r2
	bgt	.L299
	ldr	r2, [r4, #4]
	cmp	r2, #120
	ble	.L299
	ldr	r2, [r5]
	add	lr, lr, #1
	add	r0, r0, #1
	add	r2, r2, #1
	str	lr, [r6]
	str	r0, [ip]
	str	r2, [r5]
	b	.L299
.L331:
	add	r2, r0, r1
	sub	r2, r2, #1
	add	r2, ip, r2, lsl #10
	lsl	r2, r2, #1
	ldrh	r2, [lr, r2]
	cmp	r2, #0
	beq	.L340
	ldr	r2, [r4, #4]
	cmp	r2, #0
	ble	.L340
	ldr	r0, .L345+36
	ldr	r3, [r0]
	mvn	lr, r3
	cmp	r2, #119
	lsr	lr, lr, #31
	movgt	lr, #0
	cmp	lr, #0
	moveq	r3, ip
	str	ip, [r4, #12]
	beq	.L340
	ldr	lr, .L345+44
	ldr	r5, .L345+12
	sub	r3, r3, #1
	str	r3, [r0]
	ldr	r2, [r5]
	ldr	r0, [lr]
	sub	r2, r2, #1
	sub	r0, r0, #1
	mov	r3, ip
	str	r0, [lr]
	str	r2, [r5]
	b	.L298
.L344:
	ldr	r2, [r6]
	add	r1, r1, ip
	cmp	r2, #95
	str	r1, [r4, #8]
	bgt	.L301
	ldr	r0, [r4]
	cmp	r0, #80
	addgt	r2, r2, #1
	strgt	r2, [r6]
	b	.L301
.L346:
	.align	2
.L345:
	.word	67109120
	.word	player
	.word	collisionBitmapBitmap
	.word	playerHoff
	.word	vOff
	.word	gameBackgroundMap
	.word	17407
	.word	eva
	.word	evb
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
	ldr	r1, .L352
	ldr	r0, .L352+4
	ldr	r3, [r1]
	ldr	r2, [r0]
	add	r3, r3, #1
	cmp	r2, #256
	push	{r4, lr}
	str	r3, [r1]
	ble	.L348
	ldr	ip, .L352+8
	ldr	r3, [ip]
	cmp	r3, #30
	bgt	.L350
	mov	lr, #67108864
	add	r1, r3, #1
	lsl	r3, r1, #24
	orr	r3, r3, #1073741824
	orr	r3, r3, #131072
	lsr	r3, r3, #16
	sub	r2, r2, #256
	str	r1, [ip]
	str	r2, [r0]
	strh	r3, [lr, #8]	@ movhi
.L350:
	bl	updatePlayer
	bl	updatePaper
	bl	updateSanitizer
	pop	{r4, lr}
	b	updateCustomer
.L348:
	cmp	r2, #0
	bge	.L350
	ldr	ip, .L352+8
	ldr	r3, [ip]
	cmp	r3, #28
	ble	.L350
	mov	lr, #67108864
	sub	r1, r3, #1
	lsl	r3, r1, #24
	orr	r3, r3, #1073741824
	orr	r3, r3, #131072
	lsr	r3, r3, #16
	add	r2, r2, #256
	str	r1, [ip]
	str	r2, [r0]
	strh	r3, [lr, #8]	@ movhi
	b	.L350
.L353:
	.align	2
.L352:
	.word	timer
	.word	hOff
	.word	screenBlock
	.size	updateGame, .-updateGame
	.comm	evb,4,4
	.comm	eva,4,4
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
	.comm	sanitizer,352,4
	.comm	customers,224,4
	.comm	player,56,4
	.comm	paper,880,4
	.global	shadowOAM_AFF
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
	.data
	.align	2
	.type	shadowOAM_AFF, %object
	.size	shadowOAM_AFF, 4
shadowOAM_AFF:
	.word	shadowOAM
	.ident	"GCC: (devkitARM release 53) 9.1.0"
