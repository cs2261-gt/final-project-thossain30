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
	.global	initShadow
	.syntax unified
	.arm
	.fpu softvfp
	.type	initShadow, %function
initShadow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #4
	push	{r4, lr}
	mov	r1, #32
	mov	r4, #5
	mov	r0, #0
	ldr	r2, .L11
	ldr	r3, .L11+4
	ldr	lr, [r2, #12]
	str	ip, [r3, #12]
	str	lr, [r3, #16]
	ldr	lr, [r2, #8]
	ldm	r2, {r2, ip}
	str	r4, [r3, #8]
	str	lr, [r3, #20]
	str	ip, [r3, #24]
	str	r2, [r3, #28]
	str	r0, [r3, #32]
	str	r1, [r3]
	str	r1, [r3, #4]
	pop	{r4, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	player
	.word	shadow
	.size	initShadow, .-initShadow
	.align	2
	.global	drawShadow
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawShadow, %function
drawShadow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #256
	ldr	r1, .L15
	ldr	ip, [r1, #8]
	ldr	r3, [r1, #12]
	ldr	r2, [r1, #24]
	add	r3, r3, ip, lsl #5
	ldr	ip, .L15+4
	ldrb	r0, [r1, #28]	@ zero_extendqisi2
	lsl	r2, r2, #23
	ldr	r1, .L15+8
	ldr	ip, [ip]
	lsr	r2, r2, #23
	lsl	r3, r3, #2
	orr	r0, r0, lr
	orr	r2, r2, #33792
	orr	r3, r3, #2048
	strh	lr, [ip, #38]	@ movhi
	strh	lr, [ip, #62]	@ movhi
	strh	r2, [r1, #10]	@ movhi
	strh	r0, [r1, #8]	@ movhi
	strh	r3, [r1, #12]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L16:
	.align	2
.L15:
	.word	shadow
	.word	.LANCHOR0
	.word	shadowOAM
	.size	drawShadow, .-drawShadow
	.align	2
	.global	obj_aff_rotate
	.syntax unified
	.arm
	.fpu softvfp
	.type	obj_aff_rotate, %function
obj_aff_rotate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L19
	mov	r4, r0
	mov	r0, r1
	mov	r6, r1
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+4
	mov	r5, r0
	mov	r0, r6
	mov	lr, pc
	bx	r3
	asr	r3, r0, #4
	asr	r5, r5, #4
	lsl	r3, r3, #16
	asr	r3, r3, #16
	rsb	r2, r5, #0
	strh	r3, [r4, #6]	@ movhi
	strh	r3, [r4, #30]	@ movhi
	strh	r5, [r4, #22]	@ movhi
	strh	r2, [r4, #14]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	lu_sin
	.word	lu_cos
	.size	obj_aff_rotate, .-obj_aff_rotate
	.align	2
	.global	updateShadow
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateShadow, %function
updateShadow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L27
	ldm	r4, {r1, r3}
	ldr	r2, .L27+4
	add	r3, r3, r1, lsl #10
	lsl	r3, r3, #1
	ldrh	r3, [r2, r3]
	ldr	r2, .L27+8
	sub	r2, r3, r2
	rsbs	r3, r2, #0
	adc	r3, r3, r2
	ldr	r2, [r4, #40]
	ldr	r0, .L27+12
	cmp	r2, #2
	str	r3, [r0, #32]
	beq	.L25
	cmp	r2, #3
	beq	.L26
.L21:
	pop	{r4, lr}
	bx	lr
.L25:
	ldr	r3, .L27+16
	ldr	r0, [r3]
	rsb	r1, r1, #300
	add	r0, r0, #32
	bl	obj_aff_rotate
	ldr	r2, [r4, #40]
	cmp	r2, #3
	bne	.L21
.L26:
	ldr	r3, .L27+16
	ldr	r1, [r4]
	ldr	r0, [r3]
	pop	{r4, lr}
	rsb	r1, r1, #120
	add	r0, r0, #32
	b	obj_aff_rotate
.L28:
	.align	2
.L27:
	.word	player
	.word	gameBackgroundMap
	.word	17407
	.word	shadow
	.word	.LANCHOR0
	.size	updateShadow, .-updateShadow
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
	ldr	r3, .L38
	b	.L34
.L37:
	str	r7, [r3, #12]
	str	r6, [r3, #32]
.L31:
	ldr	ip, [r3, #12]
	str	r2, [r3, #4]
	str	ip, [r3]
.L35:
	add	r1, r1, #1
	add	r3, r3, #44
.L34:
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
	bls	.L31
	cmp	r1, #15
	ble	.L37
	ldr	ip, [r3, #12]
	cmp	r1, #19
	str	r2, [r3, #4]
	str	ip, [r3]
	bne	.L35
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L39:
	.align	2
.L38:
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
	ldr	r2, .L48
	ldr	r3, .L48+4
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, [r2]
	ldr	r9, [r3]
	ldr	r3, .L48+8
	mov	r5, #512
	ldr	r2, .L48+12
	ldr	r7, .L48+16
	ldr	r6, .L48+20
	add	r10, r8, #160
	add	fp, r9, #240
	add	r4, r3, #880
	b	.L44
.L43:
	strh	r5, [r2, #40]	@ movhi
.L42:
	add	r3, r3, #44
	cmp	r3, r4
	add	r2, r2, #8
	beq	.L47
.L44:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	beq	.L43
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
	bhi	.L43
	cmp	lr, #160
	bhi	.L43
	ldr	r1, [r3, #12]
	cmp	r1, r8
	blt	.L43
	ldr	r0, [r3, #8]
	cmp	r0, r9
	blt	.L43
	cmp	r1, r10
	bgt	.L43
	cmp	r1, fp
	bgt	.L43
	b	.L42
.L47:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L49:
	.align	2
.L48:
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
	ldr	r4, .L65
	ldr	r5, .L65+4
	ldr	fp, .L65+8
	ldr	r6, .L65+12
	ldr	r10, .L65+16
	ldr	r9, .L65+20
	ldr	r8, .L65+24
	sub	sp, sp, #20
	add	r7, r4, #880
	b	.L55
.L53:
	ldr	r1, [r6]
.L52:
	ldr	r3, [r10]
	cmp	r3, r1
	moveq	r3, #1
	ldreq	r2, .L65+28
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
	beq	.L64
.L55:
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
	beq	.L53
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L53
	ldr	r0, .L65+32
	ldr	r3, .L65+36
	mov	r2, #0
	ldr	r1, .L65+40
	mov	lr, pc
	bx	r3
	ldr	r1, [r6]
	add	r1, r1, #1
	cmp	r1, #9
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, .L65+44
	ldr	r2, [lr, #12]
	ldr	ip, .L65+48
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
	beq	.L52
	ldr	ip, .L65+52
	ldr	r3, [ip, #12]
	ldr	r0, .L65+48
	add	r3, r3, #1
	smull	r2, r0, r3, r0
	asr	r2, r3, #31
	rsb	r2, r2, r0, asr #2
	add	r2, r2, r2, lsl #2
	sub	r3, r3, r2, lsl #1
	str	r3, [ip, #12]
	b	.L52
.L64:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L66:
	.align	2
.L65:
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
	ldr	r3, .L71
.L68:
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
	bne	.L68
	pop	{r4, r5, r6, lr}
	bx	lr
.L72:
	.align	2
.L71:
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
	ldr	r2, .L81
	ldr	r3, .L81+4
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, [r2]
	ldr	r5, [r3]
	ldr	r3, .L81+8
	ldr	r2, .L81+12
	ldr	r7, .L81+16
	ldr	r6, .L81+20
	add	r9, r4, #160
	add	r8, r5, #240
	add	r0, r3, #224
.L77:
	ldr	r1, [r3, #40]
	cmp	r1, #0
	beq	.L76
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
	blt	.L76
	ldr	r1, [r3, #8]
	cmp	r1, r5
	blt	.L76
	cmp	r1, r8
	ble	.L80
.L76:
	strh	ip, [r2]	@ movhi
.L75:
	add	r3, r3, #56
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L77
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L80:
	cmp	lr, r9
	bgt	.L76
	b	.L75
.L82:
	.align	2
.L81:
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
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, #0
	mov	r9, #0
	ldr	r3, .L193
	ldr	r1, .L193+4
	stm	r1, {r2-r3}
	ldr	r10, .L193+8
	ldr	fp, .L193+12
	sub	sp, sp, #44
.L126:
	ldr	r3, [r10, #4]
	ldr	r0, [fp, #4]
	ldr	r4, .L193+16
	sub	r0, r0, r3
	mov	lr, pc
	bx	r4
	mov	r7, r1
	mov	r6, r0
	ldr	ip, .L193+20
	ldr	r3, [r10]
	ldr	r0, [fp]
	stm	ip, {r6-r7}
	sub	r0, r0, r3
	mov	lr, pc
	bx	r4
	mov	r2, r6
	mov	r4, r0
	mov	r5, r1
	ldr	r6, .L193+24
	mov	r3, r7
	stm	r6, {r4-r5}
	mov	r0, r2
	mov	r1, r7
	ldr	r7, .L193+28
	mov	lr, pc
	bx	r7
	mov	r2, r4
	mov	r3, r5
	mov	r4, r0
	mov	r5, r1
	mov	r0, r2
	mov	r1, r3
	mov	lr, pc
	bx	r7
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	ldr	r4, .L193+32
	mov	lr, pc
	bx	r4
	ldr	r3, .L193+36
	mov	lr, pc
	bx	r3
	ldr	ip, .L193+20
	ldr	r4, [ip]
	ldr	r5, [ip, #4]
	ldr	ip, .L193+40
	str	r0, [sp, #16]
	str	r1, [sp, #20]
	stm	ip, {r0-r1}
	mov	r2, r8
	mov	r0, r4
	mov	r1, r5
	mov	r3, r9
	ldr	ip, .L193+44
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L174
	mov	r3, r6
	ldr	r6, [r6]
	ldr	r7, [r3, #4]
	mov	r0, r6
	mov	r1, r7
	mov	r2, r8
	mov	r3, r9
	ldr	ip, .L193+44
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L175
	mov	r3, r7
	mov	r2, r6
	mov	r1, r5
	ldr	ip, .L193+44
	mov	r0, r4
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	movne	r3, #6
	moveq	r3, #4
	mov	r0, r4
	str	r3, [r10, #32]
	mov	r1, r5
	mov	r2, r8
	mov	r3, r9
	ldr	ip, .L193+48
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L132
.L133:
	ldr	r3, .L193+24
	ldm	r3, {r6, r7}
.L129:
	mov	r0, r6
	mov	r1, r7
	mov	r2, r8
	mov	r3, r9
	ldr	ip, .L193+48
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L188
.L97:
	mov	r0, r4
	mov	r1, r5
	mov	r2, r8
	mov	r3, r9
	ldr	ip, .L193+48
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L189
.L104:
	ldr	r3, [r10, #44]
	cmp	r3, #0
	beq	.L110
	ldr	r3, .L193+52
	ldr	r3, [r3]
	tst	r3, #1
	bne	.L110
	ldr	r3, .L193+4
	ldmia	r3, {r6-r7}
	mov	r0, r4
	add	r3, sp, #16
	ldmia	r3, {r2-r3}
	mov	r1, r5
	ldr	ip, .L193+56
	mov	lr, pc
	bx	ip
	mov	r2, r6
	ldr	ip, .L193+28
	mov	r3, r7
	mov	lr, pc
	bx	ip
	mov	r4, r0
	mov	r5, r1
	ldr	r0, [r10, #8]
	ldr	r3, .L193+16
	mov	lr, pc
	bx	r3
	mov	r2, r4
	mov	r3, r5
	ldr	ip, .L193+32
	mov	lr, pc
	bx	ip
	ldr	r2, .L193+60
	mov	lr, pc
	bx	r2
	ldr	r2, [r10, #12]
	ldr	r1, .L193+64
	str	r2, [sp, #28]
	add	r2, r0, r2, lsl #10
	lsl	r2, r2, #1
	ldrh	r2, [r1, r2]
	cmp	r2, #0
	str	r0, [r10, #8]
	beq	.L112
	ldr	r3, .L193+16
	mov	lr, pc
	bx	r3
	mov	r2, r4
	mov	r3, r5
	ldr	ip, .L193+32
	mov	lr, pc
	bx	ip
	ldr	r2, .L193+60
	mov	lr, pc
	bx	r2
	str	r0, [r10, #8]
.L112:
	ldr	r1, .L193+24
	add	r3, sp, #16
	ldmia	r3, {r2-r3}
	ldr	ip, .L193+56
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	ip
	mov	r2, r6
	mov	r3, r7
	ldr	ip, .L193+28
	mov	lr, pc
	bx	ip
	mov	r4, r0
	mov	r5, r1
	ldr	r0, [sp, #28]
	ldr	r6, .L193+16
	mov	lr, pc
	bx	r6
	ldr	r7, .L193+32
	mov	r2, r4
	mov	r3, r5
	mov	lr, pc
	bx	r7
	ldr	r3, .L193+60
	mov	lr, pc
	bx	r3
	ldr	r3, [r10, #8]
	ldr	r1, .L193+64
	add	r3, r3, r0, lsl #10
	lsl	r3, r3, #1
	ldrh	r3, [r1, r3]
	cmp	r3, #0
	str	r0, [r10, #12]
	beq	.L110
	mov	lr, pc
	bx	r6
	mov	r2, r4
	mov	r3, r5
	mov	lr, pc
	bx	r7
	ldr	r3, .L193+60
	mov	lr, pc
	bx	r3
	str	r0, [r10, #12]
.L110:
	ldr	r3, .L193+68
	ldr	r3, [r3]
	cmp	r3, #1
	bne	.L113
	mov	r1, #0
	ldr	r0, .L193+72
	ldr	r3, [r0]
	ldr	ip, .L193+76
	rsb	r2, r3, r3, lsl #3
	sub	r3, r3, #1
	str	r3, [r0]
	ldr	r3, .L193+68
	add	r2, ip, r2, lsl #2
	str	r1, [r2, #16]
	str	r1, [r3]
.L113:
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
	ldr	ip, .L193+80
	asr	r2, r2, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L115
	ldr	r3, [r10, #40]
	cmp	r3, #0
	bne	.L190
.L115:
	ldr	r3, .L193+72
	ldr	r3, [r3]
	cmp	r3, #0
	moveq	r2, #1
	ldreq	r3, .L193+84
	streq	r2, [r3]
	ldr	r3, .L193+52
	ldr	r1, .L193+88
	ldr	r2, [r3]
	smull	r3, r1, r2, r1
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl #2
	moveq	r2, #16
	ldreq	r1, .L193+92
	streq	r3, [r1]
	ldreq	r3, .L193+96
	streq	r2, [r3]
	ldr	r3, .L193+100
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L187
	ldr	r3, .L193+104
	ldrh	r4, [r3]
	ands	r4, r4, #1
	bne	.L187
	ldr	r2, [fp, #32]
	ldr	r1, .L193+88
	smull	r3, r1, r2, r1
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl #2
	moveq	ip, r3
	movne	ip, #4
	ldr	lr, [r10, #16]
	add	r2, fp, #24
	ldm	r2, {r2, r3}
	str	lr, [sp, #12]
	ldr	lr, [r10, #20]
	str	lr, [sp, #8]
	ldr	lr, [r10]
	ldr	r1, [fp]
	ldr	r0, [fp, #4]
	str	lr, [sp, #4]
	ldr	lr, [r10, #4]
	str	ip, [fp, #44]
	str	lr, [sp]
	ldr	ip, .L193+80
	add	r3, r3, #30
	add	r2, r2, #30
	sub	r1, r1, #15
	sub	r0, r0, #15
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L123
	ldr	r3, [r10, #40]
	cmp	r3, #0
	bne	.L182
.L187:
	ldr	r1, [r10, #12]
	ldr	r2, [r10, #8]
.L120:
	mov	r0, #67108864
	ldr	r3, .L193+92
	ldr	ip, [r3]
	ldr	r3, .L193+96
	ldr	r3, [r3]
	orr	r3, r3, ip, lsl #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r0, #82]	@ movhi
	ldr	r3, .L193+108
	ldr	r0, [r3]
	ldr	r3, .L193+112
	ldr	r3, [r3]
	sub	r1, r1, r0
	sub	r2, r2, r3
	ldr	r3, .L193+116
	stm	r10, {r1, r2}
	add	r10, r10, #56
	cmp	r3, r10
	bne	.L126
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L174:
	mov	r0, r4
	mov	r1, r5
	mov	r2, r8
	mov	r3, r9
	ldr	ip, .L193+48
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L191
	mov	r0, r4
	mov	r1, r5
	mov	r2, r8
	mov	r3, r9
	ldr	ip, .L193+44
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L97
	b	.L133
.L175:
	mov	r0, r4
	mov	r1, r5
	mov	r2, r8
	mov	r3, r9
	ldr	ip, .L193+48
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L129
	mov	r0, r6
	mov	r1, r7
	mov	r2, r8
	mov	r3, r9
	ldr	ip, .L193+44
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L129
.L132:
	mov	r3, r7
	mov	r2, r6
	mov	r0, r4
	ldr	ip, .L193+44
	add	r1, r5, #-2147483648
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	movne	r3, #7
	moveq	r3, #4
	str	r3, [r10, #32]
.L93:
	mov	r0, r4
	mov	r1, r5
	mov	r2, r8
	mov	r3, r9
	ldr	ip, .L193+44
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L129
.L130:
	mov	r0, r6
	mov	r1, r7
	mov	r2, r8
	mov	r3, r9
	ldr	ip, .L193+48
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L104
.L127:
	mov	r3, r7
	mov	r2, r6
	mov	r0, r4
	mov	r1, r5
	ldr	ip, .L193+48
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	movne	r3, #7
	moveq	r3, #5
	str	r3, [r10, #32]
	b	.L104
.L188:
	add	r3, r7, #-2147483648
	mov	r2, r6
	mov	r1, r5
	ldr	ip, .L193+48
	mov	r0, r4
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	movne	r3, #5
	moveq	r3, #6
	mov	r0, r4
	str	r3, [r10, #32]
	mov	r1, r5
	mov	r2, r8
	mov	r3, r9
	ldr	ip, .L193+48
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L104
	ldr	r3, .L193+24
	ldm	r3, {r6, r7}
	b	.L127
.L191:
	ldr	r3, .L193+24
	ldr	r6, [r3]
	ldr	r7, [r3, #4]
	mov	r0, r6
	mov	r1, r7
	mov	r2, r8
	mov	r3, r9
	ldr	ip, .L193+44
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L93
	b	.L132
.L182:
	mov	r2, r4
	ldr	r3, .L193+120
	ldr	r1, .L193+124
	ldr	r0, .L193+128
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, [r10, #24]
	sub	r3, r3, #1
	str	r3, [r10, #24]
	str	r2, [r10, #44]
.L123:
	ldr	r3, [r10, #40]
	cmp	r3, #0
	beq	.L187
	ldr	r1, [r10, #24]
	cmp	r1, #0
	bne	.L187
	ldr	r0, .L193+132
	mov	r3, #16
	mov	r2, r0
	str	r1, [r10, #40]
.L125:
	ldr	r1, [r2, #736]
	cmp	r1, #0
	beq	.L192
	add	r3, r3, #1
	cmp	r3, #20
	add	r2, r2, #44
	bne	.L125
	b	.L187
.L190:
	mov	r2, #0
	ldr	r1, .L193+136
	ldr	r0, .L193+140
	ldr	r3, .L193+120
	mov	lr, pc
	bx	r3
	mov	r2, #3
	mov	r3, #13
	ldr	ip, .L193+96
	ldr	r1, .L193+24
	str	r2, [ip]
	ldmia	r1, {r0-r1}
	ldr	r2, .L193+92
	str	r0, [sp, #32]
	str	r1, [sp, #36]
	str	r3, [r2]
	ldr	r3, .L193+60
	mov	lr, pc
	bx	r3
	ldr	r1, .L193+20
	ldr	r2, [fp, #8]
	ldmia	r1, {r4-r5}
	add	r3, r2, r0
	mov	r1, r5
	str	r2, [sp, #28]
	str	r3, [sp, #16]
	add	r6, r3, #1
	mov	r7, r0
	ldr	r3, .L193+60
	mov	r0, r4
	mov	lr, pc
	bx	r3
	ldr	r3, [sp, #16]
	mvn	lr, r3
	ldr	r2, [fp, #12]
	lsl	r6, r6, #10
	add	ip, r2, r0
	str	r2, [sp, #16]
	ldr	r2, .L193+64
	add	r1, r6, ip
	add	r1, r2, r1, lsl #1
	ldrh	r1, [r1, #2]
	lsr	lr, lr, #31
	cmp	r1, #0
	movne	r1, lr
	moveq	r1, #0
	cmp	ip, #0
	movlt	r1, #0
	andge	r1, r1, #1
	cmp	r1, #0
	ldr	r2, [sp, #28]
	beq	.L115
	ldr	r1, [fp]
	add	r1, r1, #158
	cmp	r3, r1
	bgt	.L115
	ldr	r1, [sp, #16]
	ldr	r3, [fp, #24]
	add	r3, r1, r3
	add	r0, r3, r0
	add	r3, r6, r0
	ldr	r1, .L193+64
	sub	r3, r3, #1024
	lsl	r3, r3, #1
	ldrh	r3, [r1, r3]
	cmp	r3, #0
	beq	.L115
	ldr	r3, [fp, #28]
	add	r3, r2, r3
	add	r7, r3, r7
	add	r0, r0, r7, lsl #10
	lsl	r3, r0, #1
	ldrh	r3, [r1, r3]
	cmp	r3, #0
	lsl	r3, r7, #10
	beq	.L115
	add	r3, ip, r3
	lsl	r3, r3, #1
	ldrh	r3, [r1, r3]
	cmp	r3, #0
	beq	.L115
	mov	r0, r2
	ldr	r6, .L193+16
	mov	lr, pc
	bx	r6
	ldr	r7, .L193+32
	add	r3, sp, #32
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r7
	ldr	r3, .L193+60
	mov	lr, pc
	bx	r3
	mov	r3, r0
	ldr	r0, [sp, #16]
	str	r3, [fp, #8]
	mov	lr, pc
	bx	r6
	mov	r2, r4
	mov	r3, r5
	mov	lr, pc
	bx	r7
	ldr	r3, .L193+60
	mov	lr, pc
	bx	r3
	mov	r3, #1
	ldr	r2, .L193+68
	str	r0, [fp, #12]
	str	r3, [r2]
	b	.L115
.L189:
	ldr	r3, .L193+24
	ldm	r3, {r6, r7}
	b	.L130
.L192:
	mov	ip, #1
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl ip
	ldr	r1, [r10, #12]
	ldr	r2, [r10, #8]
	add	r3, r0, r3, lsl #2
	str	ip, [r3, #32]
	str	r2, [r3, #8]
	str	r1, [r3, #12]
	b	.L120
.L194:
	.align	2
.L193:
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
	.word	collisionBitmapBitmap
	.word	hitflag
	.word	playerHealth
	.word	hearts
	.word	collision
	.word	lost
	.word	1717986919
	.word	evb
	.word	eva
	.word	oldButtons
	.word	buttons
	.word	vOff
	.word	totalHoff
	.word	customers+224
	.word	playSoundB
	.word	4106
	.word	punchSound
	.word	paper
	.word	3416
	.word	owSound
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
	ldr	r2, .L199
	ldr	r3, .L199+4
	ldr	r0, [r2]
	ldr	ip, [r3]
	ldr	r3, .L199+8
	add	r2, r0, #64
	add	ip, ip, r1
	add	r0, r0, #1088
.L196:
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
	bne	.L196
	pop	{r4, r5, r6, lr}
	bx	lr
.L200:
	.align	2
.L199:
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
	ldr	r2, .L209
	ldr	r3, .L209+4
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r5, [r2]
	ldr	r6, [r3]
	ldr	r3, .L209+8
	mov	lr, #512
	ldr	r2, .L209+12
	ldr	r4, .L209+16
	add	r7, r5, #160
	add	r8, r6, #240
	add	ip, r3, #352
	b	.L205
.L204:
	strh	lr, [r2]	@ movhi
.L203:
	add	r3, r3, #44
	cmp	r3, ip
	add	r2, r2, #8
	beq	.L208
.L205:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	beq	.L204
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
	bhi	.L204
	cmp	r9, #160
	bhi	.L204
	ldr	r1, [r3, #12]
	cmp	r1, r5
	blt	.L204
	ldr	r0, [r3, #8]
	cmp	r0, r6
	blt	.L204
	cmp	r1, r7
	bgt	.L204
	cmp	r1, r8
	bgt	.L204
	b	.L203
.L208:
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L210:
	.align	2
.L209:
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
	ldr	r4, .L223
	ldr	r5, .L223+4
	ldr	r9, .L223+8
	ldr	r8, .L223+12
	ldr	r7, .L223+16
	ldr	r10, .L223+20
	ldr	fp, .L223+24
	sub	sp, sp, #20
	add	r6, r4, #352
.L213:
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
	beq	.L212
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L212
	ldr	r3, [r10]
	cmp	r3, #3
	ble	.L222
.L212:
	ldr	r2, [r4, #8]
	ldr	r1, [r8]
	ldr	r3, [r4, #12]
	sub	r2, r2, r1
	ldr	r1, [r7]
	sub	r3, r3, r1
	str	r2, [r4, #4]
	str	r3, [r4], #44
	cmp	r4, r6
	bne	.L213
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L222:
	add	r3, r3, #1
	str	r3, [r10]
	rsb	ip, r3, r3, lsl #3
	mov	r3, #1
	ldr	r2, .L223+28
	add	ip, r2, ip, lsl #2
	str	r3, [ip, #16]
	mov	r2, #0
	ldr	r3, .L223+32
	mov	r1, fp
	ldr	r0, .L223+36
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r3, [r4, #32]
	b	.L212
.L224:
	.align	2
.L223:
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
	ldr	r3, .L229
.L226:
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
	bne	.L226
	pop	{r4, lr}
	bx	lr
.L230:
	.align	2
.L229:
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
	ldr	r3, .L237
	ldr	r2, .L237+4
	ldr	r4, .L237+8
	add	ip, r3, #140
.L234:
	ldr	r1, [r3, #16]
	cmp	r1, #0
	strheq	r5, [r2]	@ movhi
	beq	.L233
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
.L233:
	add	r3, r3, #28
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L234
	pop	{r4, r5, lr}
	bx	lr
.L238:
	.align	2
.L237:
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
	ldr	r3, .L241
	stm	r3, {r4, lr}
	str	ip, [r3, #20]
	str	r0, [r3, #16]
	str	r1, [r3, #12]
	str	r2, [r3, #8]
	pop	{r4, lr}
	bx	lr
.L242:
	.align	2
.L241:
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
	ldr	r0, .L244
	ldr	r3, [r0, #20]
	ldr	ip, [r0, #8]
	ldr	r2, [r0, #12]
	ldr	r1, .L244+4
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
.L245:
	.align	2
.L244:
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
	ldr	r3, .L248
	stm	r3, {r4, lr}
	str	ip, [r3, #20]
	str	r0, [r3, #16]
	str	r1, [r3, #12]
	str	r2, [r3, #8]
	pop	{r4, lr}
	bx	lr
.L249:
	.align	2
.L248:
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
	ldr	r0, .L251
	ldr	r3, [r0, #20]
	ldr	ip, [r0, #8]
	ldr	r2, [r0, #12]
	ldr	r1, .L251+4
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
.L252:
	.align	2
.L251:
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
	ldr	r3, .L255
	str	lr, [r3, #20]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	ip, [r3, #16]
	str	r0, [r3, #12]
	str	r1, [r3, #8]
	ldr	lr, [sp], #4
	bx	lr
.L256:
	.align	2
.L255:
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
	ldr	r1, .L259
	push	{r4, lr}
	ldr	r3, [r1, #20]
	ldr	r2, .L259+4
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
.L260:
	.align	2
.L259:
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
	ldr	r3, .L263
	str	lr, [r3, #20]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	ip, [r3, #16]
	str	r0, [r3, #12]
	str	r1, [r3, #8]
	ldr	lr, [sp], #4
	bx	lr
.L264:
	.align	2
.L263:
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
	ldr	r1, .L267
	push	{r4, lr}
	ldr	r3, [r1, #20]
	ldr	r2, .L267+4
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
.L268:
	.align	2
.L267:
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
	ldr	r3, .L276
.L270:
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
	bne	.L270
	bl	initPaper
	bl	initSanitizer
	mov	r3, #192
	mov	lr, #0
	mov	r1, #8
	mov	ip, #150
	mov	r0, #26
	mov	r5, #184
	ldr	r2, .L276+4
	ldr	r4, [r2]
	ldr	r2, .L276+8
	str	r3, [r2, #20]
	ldr	r3, .L276+12
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
	bne	.L271
	mov	r4, #32
	mov	lr, #200
	mov	r2, #3
	ldr	r3, .L276+16
.L275:
	str	r4, [r3]
	str	r1, [r3, #4]
	str	ip, [r3, #16]
	str	r0, [r3, #8]
	str	lr, [r3, #20]
	str	r2, [r3, #12]
.L272:
	mov	r1, #0
	mov	r4, #28
	ldr	r3, .L276+20
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	ldr	r0, .L276+24
	add	r2, r2, r2, lsr #31
	asr	r2, r2, #1
	str	r2, [r0]
	ldr	ip, .L276+28
	ldr	r0, .L276+32
	ldr	r2, .L276+36
	add	r3, r3, r3, lsr #31
	asr	r3, r3, #1
	str	r3, [ip]
	str	r3, [r0]
	str	r3, [r2]
	ldr	lr, .L276+40
	ldr	ip, .L276+44
	ldr	r0, .L276+48
	ldr	r2, .L276+52
	ldr	r3, .L276+56
	str	r4, [lr]
	str	r1, [ip]
	str	r1, [r0]
	str	r1, [r2]
	str	r1, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L271:
	cmp	r4, #1
	bne	.L272
	mov	r4, #32
	mov	lr, #200
	mov	r2, #4
	ldr	r3, .L276+60
	b	.L275
.L277:
	.align	2
.L276:
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
	ldr	r1, .L283
	push	{r4, r5, r6, lr}
	ldr	r2, [r1, #4]
	ldr	r5, .L283+4
	and	r2, r2, r5
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r0, [r1, #44]
	ldr	r3, [r1, #36]
	ldrb	r1, [r1]	@ zero_extendqisi2
	add	r3, r3, r0, lsl #5
	ldr	r4, .L283+8
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
	ldr	r2, .L283+12
	ldr	r1, [r2, #20]
	add	ip, r4, #728
	and	r1, r1, r5
	strh	r1, [ip, #2]	@ movhi
	ldrb	r1, [r2, #16]	@ zero_extendqisi2
	ldr	r3, .L283+16
	strh	r1, [ip]	@ movhi
	ldr	ip, [r2, #8]
	ldr	r1, [r2, #12]
	ldr	r2, [r3, #20]
	add	r1, r1, ip, lsl #5
	ldr	r0, .L283+20
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
	bne	.L279
	ldr	r1, .L283+24
	ldr	r2, [r1, #20]
	add	r0, r1, #8
	ldm	r0, {r0, r3}
	and	r5, r5, r2
	ldrb	r1, [r1, #16]	@ zero_extendqisi2
	add	r3, r3, r0, lsl #3
	orr	r5, r5, #16384
	add	r0, r4, #712
	add	r4, r4, #716
.L282:
	orr	r2, r1, #16384
	lsl	r3, r3, #2
	strh	r5, [r0, #2]	@ movhi
	strh	r2, [r0]	@ movhi
	strh	r3, [r4]	@ movhi
.L280:
	mov	r3, #67108864
	ldr	r2, .L283+28
	ldrh	r1, [r2]
	ldr	r2, .L283+32
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L279:
	cmp	r0, #1
	bne	.L280
	ldr	r1, .L283+36
	ldr	r2, [r1, #20]
	add	r0, r1, #8
	ldm	r0, {r0, r3}
	and	r5, r5, r2
	add	r3, r3, r0, lsl #3
	ldrb	r1, [r1, #16]	@ zero_extendqisi2
	add	r0, r4, #704
	orr	r5, r5, #16384
	add	r4, r4, #708
	b	.L282
.L284:
	.align	2
.L283:
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
	ldr	r4, .L316
	ldr	r3, .L316+4
	ldr	r5, [r4, #32]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #36]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #40]
	str	r1, [r4, #36]
	bne	.L286
	ldr	r0, [r4, #44]
	ldr	r3, .L316+8
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L286:
	ldr	r3, .L316+12
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #36]
	ldr	r3, .L316+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #36]
	ldr	r3, .L316+12
	ldrh	r2, [r3, #48]
	tst	r2, #16
	bne	.L289
	mov	r2, #2
	ldrh	r3, [r3, #48]
	tst	r3, #32
	str	r2, [r4, #36]
	bne	.L291
.L292:
	mov	r3, #3
	str	r3, [r4, #36]
.L291:
	add	r5, r5, #1
	str	r5, [r4, #32]
.L293:
	mov	r9, #1
	ldr	r4, .L316+16
	ldr	r7, .L316+4
	ldr	r8, .L316+8
	add	r6, r4, #224
.L298:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	ldr	r5, [r4, #52]
	beq	.L295
	smull	r3, r2, r7, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	bne	.L295
	ldr	r0, [r4, #28]
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r8
	cmp	r1, #0
	moveq	r1, r9
	str	r1, [r4, #28]
.L295:
	add	r5, r5, #1
	str	r5, [r4, #52]
	add	r4, r4, #56
	cmp	r4, r6
	bne	.L298
	ldr	r5, .L316+20
	ldr	r8, .L316+4
	ldr	r6, .L316+8
	add	r7, r5, #880
.L300:
	ldr	r4, [r5, #36]
	smull	r3, r2, r8, r4
	asr	r3, r4, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r4, r3, lsl #2
	bne	.L299
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L299
	ldr	r0, [r5, #28]
	ldr	r1, [r5, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r6
	str	r1, [r5, #28]
.L299:
	add	r4, r4, #1
	str	r4, [r5, #36]
	add	r5, r5, #44
	cmp	r5, r7
	bne	.L300
	ldr	r5, .L316+24
	ldr	r9, .L316+28
	ldr	r8, .L316+32
	ldr	r7, .L316+8
	add	r6, r5, #352
.L302:
	ldr	r4, [r5, #36]
	add	r3, r4, r4, lsl #2
	add	r3, r3, r3, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	add	r3, r4, r3, lsl #1
	add	r3, r3, r9
	cmp	r8, r3, ror #2
	bcc	.L301
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L301
	ldr	r0, [r5, #28]
	ldr	r1, [r5, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r7
	str	r1, [r5, #28]
.L301:
	add	r4, r4, #1
	str	r4, [r5, #36]
	add	r5, r5, #44
	cmp	r5, r6
	bne	.L302
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L289:
	ldrh	r3, [r3, #48]
	tst	r3, #32
	beq	.L292
	ldr	r3, [r4, #36]
	cmp	r3, #4
	bne	.L291
	mov	r3, #0
	str	r6, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #32]
	b	.L293
.L317:
	.align	2
.L316:
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
	ldr	r3, .L366
	push	{r4, r5, r6, r7, r8, lr}
	ldrh	r3, [r3, #48]
	ldr	r4, .L366+4
	tst	r3, #32
	add	r1, r4, #8
	ldm	r1, {r1, r3}
	bne	.L361
	ldr	r0, [r4, #28]
	cmp	r0, #0
	add	r2, r0, #3
	movge	r2, r0
	ldr	ip, [r4, #20]
	add	r2, r1, r2, asr #2
	sub	ip, r3, ip
	ldr	lr, .L366+8
	add	r2, ip, r2, lsl #10
	lsl	r2, r2, #1
	ldrh	r2, [lr, r2]
	cmp	r2, #0
	bne	.L352
.L361:
	ldr	r5, .L366+12
.L319:
	ldr	r2, .L366
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L320
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
	ldr	r6, .L366+8
	add	r2, r0, r2, lsl #10
	lsl	r2, r2, #1
	ldrh	r2, [r6, r2]
	cmp	r2, #0
	bne	.L364
.L320:
	ldr	r2, .L366
	ldrh	r2, [r2, #48]
	tst	r2, #64
	bne	.L363
	ldr	r2, [r4, #28]
	add	r0, r2, #3
	cmp	r2, #0
	movlt	r2, r0
	ldr	r0, [r4, #16]
	sub	r0, r1, r0
	add	r2, r0, r2, asr #2
	add	ip, r3, r2, lsl #10
	ldr	lr, .L366+8
	lsl	ip, ip, #1
	ldrh	ip, [lr, ip]
	cmp	ip, #0
	lsl	r2, r2, #10
	bne	.L356
.L363:
	ldr	r6, .L366+16
.L321:
	ldr	r2, .L366
	ldrh	r2, [r2, #48]
	tst	r2, #128
	bne	.L322
	ldr	r7, [r4, #28]
	ldr	ip, [r4, #16]
	add	r7, r1, r7
	ldr	r0, [r4, #24]
	add	r2, r7, ip
	sub	r2, r2, #1
	add	r0, r0, r2, lsl #10
	ldr	lr, .L366+8
	add	r0, r0, r3
	add	r0, lr, r0, lsl #1
	ldrh	r0, [r0, #-2]
	cmp	r0, #0
	lsl	r2, r2, #10
	beq	.L322
	add	r2, r2, r3
	lsl	r2, r2, #1
	ldrh	r2, [lr, r2]
	cmp	r7, #255
	movgt	r7, #0
	movle	r7, #1
	cmp	r2, #0
	moveq	r7, #0
	cmp	r7, #0
	bne	.L365
.L322:
	add	r3, r3, r1, lsl #10
	ldr	r2, .L366+20
	lsl	r3, r3, #1
	ldrh	r2, [r2, r3]
	ldr	r3, .L366+24
	cmp	r2, r3
	moveq	r2, #3
	moveq	r3, #13
	ldreq	r7, .L366+28
	ldreq	r8, .L366+32
	ldrne	r7, .L366+28
	ldrne	r8, .L366+32
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
.L356:
	ldr	ip, [r4, #24]
	add	r2, r2, ip
	add	r2, r2, r3
	add	r2, lr, r2, lsl #1
	ldrh	r2, [r2, #-2]
	cmp	r2, #0
	beq	.L363
	ldr	r2, [r4]
	cmp	r2, #0
	ldr	r6, .L366+16
	ble	.L321
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
	b	.L321
.L364:
	add	r2, r7, r1
	sub	r2, r2, #1
	add	r0, r0, r2, lsl #10
	lsl	r0, r0, #1
	ldrh	r2, [r6, r0]
	cmp	r2, #0
	cmpne	ip, #1024
	bge	.L320
	ldr	ip, .L366+36
	ldr	r2, .L366+40
	ldr	r0, [ip]
	add	r3, r3, lr
	cmp	r0, r2
	str	r3, [r4, #12]
	bgt	.L320
	ldr	r6, .L366+44
	ldr	lr, [r6]
	cmp	lr, r2
	bgt	.L320
	ldr	r2, [r4, #4]
	cmp	r2, #120
	ble	.L320
	ldr	r2, [r5]
	add	lr, lr, #1
	add	r0, r0, #1
	add	r2, r2, #1
	str	lr, [r6]
	str	r0, [ip]
	str	r2, [r5]
	b	.L320
.L352:
	add	r2, r0, r1
	sub	r2, r2, #1
	add	r2, ip, r2, lsl #10
	lsl	r2, r2, #1
	ldrh	r2, [lr, r2]
	cmp	r2, #0
	beq	.L361
	ldr	r2, [r4, #4]
	cmp	r2, #0
	ble	.L361
	ldr	r0, .L366+36
	ldr	r3, [r0]
	mvn	lr, r3
	cmp	r2, #119
	lsr	lr, lr, #31
	movgt	lr, #0
	cmp	lr, #0
	moveq	r3, ip
	str	ip, [r4, #12]
	beq	.L361
	ldr	lr, .L366+44
	ldr	r5, .L366+12
	sub	r3, r3, #1
	str	r3, [r0]
	ldr	r2, [r5]
	ldr	r0, [lr]
	sub	r2, r2, #1
	sub	r0, r0, #1
	mov	r3, ip
	str	r0, [lr]
	str	r2, [r5]
	b	.L319
.L365:
	ldr	r2, [r6]
	add	r1, r1, ip
	cmp	r2, #95
	str	r1, [r4, #8]
	bgt	.L322
	ldr	r0, [r4]
	cmp	r0, #80
	addgt	r2, r2, #1
	strgt	r2, [r6]
	b	.L322
.L367:
	.align	2
.L366:
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
	ldr	r1, .L373
	ldr	r0, .L373+4
	ldr	r3, [r1]
	ldr	r2, [r0]
	add	r3, r3, #1
	cmp	r2, #256
	push	{r4, lr}
	str	r3, [r1]
	ble	.L369
	ldr	ip, .L373+8
	ldr	r3, [ip]
	cmp	r3, #30
	bgt	.L371
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
.L371:
	bl	updatePlayer
	bl	updatePaper
	bl	updateSanitizer
	pop	{r4, lr}
	b	updateCustomer
.L369:
	cmp	r2, #0
	bge	.L371
	ldr	ip, .L373+8
	ldr	r3, [ip]
	cmp	r3, #28
	ble	.L371
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
	b	.L371
.L374:
	.align	2
.L373:
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
	.comm	shadow,36,4
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
	.set	.LANCHOR0,. + 0
	.type	shadowOAM_AFF, %object
	.size	shadowOAM_AFF, 4
shadowOAM_AFF:
	.word	shadowOAM
	.ident	"GCC: (devkitARM release 53) 9.1.0"
