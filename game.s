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
	mov	r4, #2
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
	mov	r6, #148
	mov	r5, #116
	ldr	r3, .L18
	b	.L15
.L11:
	str	ip, [r3]
	str	r1, [r3, #4]
.L16:
	add	r2, r2, #1
	add	r1, r1, #128
	add	r3, r3, #40
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
	movle	ip, #116
	strle	r5, [r3, #12]
	ble	.L11
	cmp	r2, #23
	movle	ip, #148
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
	ldr	r3, .L28+4
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, [r2]
	ldr	r8, [r3]
	ldr	r3, .L28+8
	mov	r4, #512
	ldr	r2, .L28+12
	ldr	r7, .L28+16
	ldr	r6, .L28+20
	add	r9, r5, #160
	add	r10, r8, #240
	add	lr, r3, #1200
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
	add	r3, r3, #40
	cmp	r3, lr
	add	r2, r2, #8
	beq	.L27
.L24:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	bne	.L21
.L23:
	add	r3, r3, #40
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
	ldr	r4, .L42
	ldr	r5, .L42+4
	ldr	fp, .L42+8
	ldr	r6, .L42+12
	ldr	r10, .L42+16
	ldr	r9, .L42+20
	ldr	r8, .L42+24
	sub	sp, sp, #20
	add	r7, r4, #1200
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
	add	r4, r4, #40
	cmp	r4, r7
	beq	.L41
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
	mov	r2, #0
	ldr	r1, .L42+32
	ldr	r0, .L42+36
	str	r2, [r4, #32]
	ldr	r3, .L42+40
	mov	lr, pc
	bx	r3
	ldr	r1, [r6]
	add	r1, r1, #1
	str	r1, [r6]
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
	.word	collectSound
	.word	playSoundB
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
	str	r2, [r3], #48
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
	add	r0, r3, #288
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
	add	r3, r3, #48
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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #2
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r2, .L94
	ldr	r10, .L94+4
	str	r3, [r2]
	ldr	fp, .L94+8
	ldr	r9, .L94+12
	ldr	r8, .L94+16
	sub	sp, sp, #36
.L70:
	ldr	r3, [r10, #4]
	ldr	r0, [fp, #4]
	sub	r0, r0, r3
	mov	lr, pc
	bx	r9
	mov	r6, r0
	mov	r7, r1
	ldr	r3, [r10]
	ldr	r2, .L94+20
	ldr	r0, [fp]
	stm	r2, {r6-r7}
	sub	r0, r0, r3
	mov	lr, pc
	bx	r9
	mov	r4, r0
	mov	r5, r1
	ldr	r0, .L94+24
	mov	r2, r6
	stm	r0, {r4-r5}
	mov	r3, r7
	mov	r0, r6
	mov	r1, r7
	ldr	r6, .L94+28
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
	ldr	r7, .L94+32
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	mov	lr, pc
	bx	r7
	ldr	r3, .L94+36
	mov	lr, pc
	bx	r3
	mov	r4, r0
	mov	r5, r1
	ldr	r3, [r10, #40]
	cmp	r3, #0
	ldr	r3, .L94+40
	stm	r3, {r4-r5}
	beq	.L61
	ldr	r3, .L94+44
	ldr	r3, [r3]
	tst	r3, #1
	bne	.L61
	ldr	r3, .L94
	ldr	r0, [r3]
	mov	lr, pc
	bx	r9
	mov	r6, r0
	mov	r7, r1
	ldr	r1, .L94+20
	mov	r2, r4
	mov	r3, r5
	ldr	ip, .L94+48
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	ip
	ldr	ip, .L94+28
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
	ldr	r7, .L94+32
	mov	lr, pc
	bx	r7
	ldr	r3, .L94+52
	mov	r6, r3
	mov	lr, pc
	bx	r3
	str	r0, [r10, #8]
	ldr	r0, .L94+24
	mov	r2, r4
	mov	r3, r5
	ldr	r4, .L94+48
	ldmia	r0, {r0-r1}
	mov	lr, pc
	bx	r4
	add	r3, sp, #16
	ldmia	r3, {r2-r3}
	ldr	ip, .L94+28
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
	mov	r1, #0
	ldr	r0, .L94+56
	ldr	r3, [r0]
	ldr	ip, .L94+60
	rsb	r2, r3, r3, lsl #3
	add	r2, ip, r2, lsl #2
	sub	r3, r3, #1
	str	r3, [r0]
	str	r1, [r2, #16]
	str	r1, [r8]
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
	ldr	ip, .L94+64
	asr	r2, r2, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L64
	ldr	r3, [r10, #36]
	cmp	r3, #0
	bne	.L93
.L64:
	ldr	r3, .L94+68
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L92
	ldr	r3, .L94+72
	ldrh	r2, [r3]
	ands	r4, r2, #1
	beq	.L87
.L92:
	ldr	r3, [r10, #8]
	ldr	r2, [r10, #12]
.L68:
	ldr	r1, .L94+76
	ldr	r0, [r1]
	ldr	r1, .L94+80
	ldr	r1, [r1]
	sub	r2, r2, r0
	sub	r3, r3, r1
	stm	r10, {r2, r3}
	ldr	r3, .L94+84
	add	r10, r10, #48
	cmp	r10, r3
	bne	.L70
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L93:
	mov	r2, #0
	ldr	r1, .L94+88
	ldr	r0, .L94+92
	ldr	r3, .L94+96
	mov	lr, pc
	bx	r3
	ldr	r3, .L94+24
	ldmia	r3, {r6-r7}
	ldr	r5, .L94+52
	mov	r1, r7
	mov	r0, r6
	mov	lr, pc
	bx	r5
	ldr	r3, .L94+20
	ldmia	r3, {r2-r3}
	mov	r1, r2
	mov	r2, r3
	mov	r4, r0
	ldr	r3, [fp, #8]
	str	r1, [sp, #16]
	str	r2, [sp, #20]
	mov	r0, r1
	str	r3, [sp, #28]
	mov	r1, r2
	add	r4, r4, r3
	mov	lr, pc
	bx	r5
	ldr	r5, [fp, #12]
	add	r0, r0, r5
	ldr	r2, .L94+100
	add	r4, r0, r4, lsl #10
	lsl	r4, r4, #1
	ldrh	r2, [r2, r4]
	cmp	r2, #0
	beq	.L66
	ldr	r3, [sp, #28]
	mov	r0, r3
	mov	lr, pc
	bx	r9
	mov	r2, r6
	mov	r3, r7
	ldr	r6, .L94+32
	mov	lr, pc
	bx	r6
	ldr	r4, .L94+52
	mov	lr, pc
	bx	r4
	mov	r3, r0
	mov	r0, r5
	str	r3, [fp, #8]
	mov	lr, pc
	bx	r9
	add	r3, sp, #16
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r4
	str	r0, [fp, #12]
.L66:
	mov	r3, #1
	ldr	r2, .L94+56
	ldr	r2, [r2]
	cmp	r2, #0
	ldreq	r2, .L94+104
	str	r3, [r8]
	streq	r3, [r2]
	b	.L64
.L87:
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
	ldr	ip, .L94+64
	sub	r1, r1, #15
	sub	r0, r0, #15
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L92
	ldr	r3, [r10, #36]
	cmp	r3, #0
	beq	.L92
	mov	r2, r4
	ldr	r1, .L94+108
	ldr	r0, .L94+112
	ldr	r3, .L94+96
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, [r10, #24]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r10, #24]
	str	r1, [r10, #40]
	bne	.L92
	ldr	r0, .L94+116
	ldr	r3, [r10, #8]
	str	r2, [r10, #36]
	ldr	r2, [r10, #12]
	str	r1, [r0, #992]
	str	r3, [r0, #968]
	str	r2, [r0, #972]
	b	.L68
.L95:
	.align	2
.L94:
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
	.word	hearts
	.word	collision
	.word	oldButtons
	.word	buttons
	.word	vOff
	.word	hOff
	.word	customers+288
	.word	3516
	.word	owSound
	.word	playSoundB
	.word	collisionBitmapBitmap
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
	ldr	r3, .L100
.L97:
	str	r2, [r3, #8]
	add	r2, r2, #128
	cmp	r2, #704
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	lr, [r3, #24]
	str	ip, [r3, #28]
	str	r0, [r3, #32]
	add	r3, r3, #40
	bne	.L97
	ldr	lr, [sp], #4
	bx	lr
.L101:
	.align	2
.L100:
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
	ldr	r2, .L110
	ldr	r3, .L110+4
	ldr	r4, [r2]
	ldr	r6, [r3]
	ldr	r3, .L110+8
	ldr	r2, .L110+12
	ldr	r5, .L110+16
	add	r7, r4, #160
	add	r8, r6, #240
	add	ip, r3, #200
.L106:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	beq	.L105
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
	blt	.L105
	ldr	r1, [r3, #8]
	cmp	r1, r6
	blt	.L105
	cmp	r9, r7
	ble	.L109
.L105:
	strh	lr, [r2]	@ movhi
.L104:
	add	r3, r3, #40
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L106
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L109:
	cmp	r9, r8
	bgt	.L105
	b	.L104
.L111:
	.align	2
.L110:
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
	mov	fp, #1
	ldr	r4, .L123
	ldr	r5, .L123+4
	ldr	r9, .L123+8
	ldr	r8, .L123+12
	ldr	r7, .L123+16
	ldr	r10, .L123+20
	sub	sp, sp, #20
	add	r6, r4, #200
.L114:
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
	beq	.L113
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L113
	ldr	r3, [r10]
	cmp	r3, #1
	bgt	.L113
	mov	r2, #0
	add	r3, r3, #1
	ldr	r0, .L123+24
	str	r3, [r10]
	rsb	r3, r3, r3, lsl #3
	add	r3, r0, r3, lsl #2
	str	fp, [r3, #16]
	str	r2, [r4, #32]
.L113:
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	sub	r2, r2, ip
	sub	r3, r3, r1
	str	r2, [r4, #4]
	str	r3, [r4], #40
	cmp	r4, r6
	bne	.L114
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L124:
	.align	2
.L123:
	.word	sanitizer
	.word	player
	.word	collision
	.word	hOff
	.word	vOff
	.word	playerHealth
	.word	hearts
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
	ldr	r3, .L129
.L126:
	str	r2, [r3, #4]
	add	r2, r2, #18
	cmp	r2, #59
	str	r4, [r3]
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	lr, [r3, #20]
	str	ip, [r3, #24]
	str	r0, [r3, #16]
	add	r3, r3, #28
	bne	.L126
	pop	{r4, lr}
	bx	lr
.L130:
	.align	2
.L129:
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
	ldr	r3, .L137
	ldr	r2, .L137+4
	ldr	r4, .L137+8
	add	ip, r3, #84
.L134:
	ldr	r1, [r3, #16]
	cmp	r1, #0
	strheq	r5, [r2]	@ movhi
	beq	.L133
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
.L133:
	add	r3, r3, #28
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L134
	pop	{r4, r5, lr}
	bx	lr
.L138:
	.align	2
.L137:
	.word	hearts
	.word	shadowOAM+480
	.word	511
	.size	drawHeart, .-drawHeart
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
	mov	r6, #1
	bl	initCustomer
	mov	r3, #0
	mov	r9, #32
	mov	r8, #155
	mov	r7, #200
	mov	fp, #4
	mov	r10, #2
	mov	r2, #5
	mov	lr, #10
	mov	r1, #16
	mov	ip, #12
	mov	r0, #6
	ldr	r4, .L145
	mov	r5, r6
	str	r6, [r4, #20]
	str	r6, [r4, #16]
	ldr	r6, .L145+4
	str	r3, [r4, #44]
	str	r3, [r4, #36]
	str	r3, [r4, #32]
	str	r3, [r6]
	ldr	r3, .L145+8
	str	fp, [r4, #48]
	str	r10, [r3]
	str	r9, [r4, #28]
	str	r9, [r4, #24]
	str	r8, [r4, #8]
	str	r8, [r4]
	str	r7, [r4, #12]
	str	r7, [r4, #4]
	ldr	r3, .L145+12
.L140:
	str	r2, [r3, #4]
	add	r2, r2, #18
	cmp	r2, #59
	str	lr, [r3]
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	ip, [r3, #20]
	str	r0, [r3, #24]
	str	r5, [r3, #16]
	add	r3, r3, #28
	bne	.L140
	bl	initPaper
	mov	r2, #64
	mov	r1, #16
	mov	lr, #12
	mov	r0, #0
	mov	ip, #1
	ldr	r3, .L145+16
.L141:
	str	r2, [r3, #8]
	add	r2, r2, #128
	cmp	r2, #704
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	lr, [r3, #24]
	str	r0, [r3, #28]
	str	ip, [r3, #32]
	add	r3, r3, #40
	bne	.L141
	mov	r1, #28
	mov	lr, #30
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	ldr	ip, .L145+20
	add	r2, r2, r2, lsr #31
	asr	r2, r2, #1
	str	r2, [ip]
	add	r3, r3, r3, lsr #31
	ldr	r2, .L145+24
	ldr	ip, .L145+28
	asr	r3, r3, #1
	str	r3, [r2]
	str	r3, [ip]
	ldr	r2, .L145+32
	ldr	r3, .L145+36
	str	r1, [r2]
	str	lr, [r3]
	ldr	ip, .L145+40
	ldr	r3, .L145+44
	ldr	r1, .L145+48
	ldr	r2, .L145+52
	str	r0, [r3]
	str	r0, [ip]
	str	r0, [r1]
	str	r0, [r2]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L146:
	.align	2
.L145:
	.word	player
	.word	hitflag
	.word	playerHealth
	.word	hearts
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
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L149
	ldr	r3, [r1, #4]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	ip, [r1, #36]
	ldr	r2, [r1, #44]
	ldr	r0, .L149+4
	ldrb	r1, [r1]	@ zero_extendqisi2
	add	r2, r2, ip, lsl #5
	lsl	r2, r2, #2
	push	{r4, lr}
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	bl	drawHeart
	bl	drawPaper
	bl	drawCustomer
	bl	drawSanitizer
	mov	r3, #67108864
	ldr	r2, .L149+8
	ldrh	r1, [r2]
	ldr	r2, .L149+12
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L150:
	.align	2
.L149:
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
	ldr	r4, .L158
	ldr	r3, .L158+4
	ldr	r5, [r4, #32]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r1, [r4, #36]
	bne	.L152
	ldr	r0, [r4, #44]
	ldr	r3, .L158+8
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L152:
	ldr	r3, .L158+12
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #36]
	ldr	r3, .L158+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #36]
	ldr	r3, .L158+12
	ldrh	r3, [r3, #48]
	tst	r3, #16
	moveq	r3, #2
	streq	r3, [r4, #36]
	ldr	r3, .L158+12
	ldrh	r3, [r3, #48]
	tst	r3, #32
	moveq	r3, #3
	add	r5, r5, #1
	streq	r3, [r4, #36]
	str	r5, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L159:
	.align	2
.L158:
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
	ldr	r3, .L213
	ldrh	r3, [r3, #48]
	tst	r3, #32
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L213+4
	bne	.L208
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
	ldr	ip, .L213+8
	lsl	r3, r3, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #0
	bne	.L200
.L208:
	ldr	r5, .L213+12
.L162:
	ldr	r3, .L213
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L165
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
	ldr	r6, .L213+8
	add	r3, r2, r3, lsl #10
	lsl	r3, r3, #1
	ldrh	r3, [r6, r3]
	cmp	r3, #0
	bne	.L211
.L165:
	ldr	r3, .L213
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L210
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
	ldr	r1, .L213+8
	lsl	r2, r2, #1
	ldrh	r2, [r1, r2]
	cmp	r2, #0
	lsl	r3, r3, #10
	bne	.L204
.L210:
	ldr	r6, .L213+16
.L168:
	ldr	r3, .L213
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L171
	ldr	r1, [r4, #8]
	ldr	ip, [r4, #28]
	ldr	r0, [r4, #16]
	add	ip, r1, ip
	ldr	r2, [r4, #24]
	add	r3, ip, r0
	sub	r3, r3, #1
	ldr	r7, [r4, #12]
	add	r2, r2, r3, lsl #10
	ldr	lr, .L213+8
	add	r2, r2, r7
	add	r2, lr, r2, lsl #1
	ldrh	r2, [r2, #-2]
	cmp	r2, #0
	lsl	r3, r3, #10
	beq	.L171
	add	r3, r3, r7
	lsl	r3, r3, #1
	ldrh	r3, [lr, r3]
	cmp	ip, #255
	movgt	ip, #0
	movle	ip, #1
	cmp	r3, #0
	moveq	ip, #0
	cmp	ip, #0
	bne	.L212
.L171:
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
.L204:
	ldr	r2, [r4, #24]
	add	r3, r3, r2
	add	r3, r3, ip
	add	r3, r1, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	beq	.L210
	ldr	r3, [r4]
	cmp	r3, #0
	ldr	r6, .L213+16
	ble	.L168
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
	b	.L168
.L211:
	add	r0, r0, r7
	sub	r0, r0, #1
	add	r2, r2, r0, lsl #10
	lsl	r2, r2, #1
	ldrh	r3, [r6, r2]
	cmp	r3, #0
	cmpne	r1, #1024
	bge	.L165
	ldr	r2, [r5]
	ldr	r3, .L213+20
	add	ip, ip, lr
	cmp	r2, r3
	str	ip, [r4, #12]
	bgt	.L165
	ldr	r0, .L213+24
	ldr	r1, [r0]
	cmp	r1, r3
	bgt	.L165
	ldr	r3, [r4, #4]
	cmp	r3, #120
	addgt	r1, r1, #1
	addgt	r2, r2, #1
	strgt	r1, [r0]
	strgt	r2, [r5]
	b	.L165
.L200:
	add	r3, r2, r0
	sub	r3, r3, #1
	add	r3, r1, r3, lsl #10
	lsl	r3, r3, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #0
	beq	.L208
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ble	.L208
	ldr	r0, .L213+24
	ldr	r2, [r0]
	mvn	ip, r2
	cmp	r3, #119
	lsr	ip, ip, #31
	movgt	ip, #0
	ldr	r5, .L213+12
	cmp	ip, #0
	ldrne	r3, [r5]
	subne	r2, r2, #1
	subne	r3, r3, #1
	str	r1, [r4, #12]
	strne	r2, [r0]
	strne	r3, [r5]
	b	.L162
.L212:
	ldr	r3, [r6]
	add	r1, r1, r0
	cmp	r3, #95
	str	r1, [r4, #8]
	bgt	.L171
	ldr	r2, [r4]
	cmp	r2, #80
	addgt	r3, r3, #1
	strgt	r3, [r6]
	b	.L171
.L214:
	.align	2
.L213:
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
	ldr	r1, .L232
	ldr	ip, .L232+4
	ldr	r3, [r1]
	ldr	r2, [ip]
	add	r3, r3, #1
	cmp	r2, #256
	push	{r4, lr}
	str	r3, [r1]
	ble	.L216
	ldr	r1, .L232+8
	ldr	r0, [r1]
	cmp	r0, #30
	bgt	.L224
	ldr	r3, .L232+12
	sub	r2, r2, #256
	add	r0, r0, #1
	str	r2, [ip]
	str	r0, [r1]
	add	r1, r3, #288
.L218:
	ldr	r2, [r3, #8]
	sub	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #48
	cmp	r3, r1
	bne	.L218
	ldr	r3, .L232+16
	ldr	r1, [r3]
	cmp	r1, #0
	ble	.L226
	ldr	r3, .L232+20
	add	r1, r1, r1, lsl #2
	add	r1, r3, r1, lsl #3
.L220:
	ldr	r2, [r3, #8]
	sub	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #40
	cmp	r3, r1
	bne	.L220
.L226:
	mov	r3, #67108864
	lsl	r0, r0, #24
	orr	r0, r0, #1073741824
	lsr	r0, r0, #16
	strh	r0, [r3, #8]	@ movhi
.L224:
	bl	updatePlayer
	bl	updateCustomer
	bl	updatePaper
	pop	{r4, lr}
	b	updateSanitizer
.L216:
	cmp	r2, #0
	bge	.L224
	ldr	r1, .L232+8
	ldr	r0, [r1]
	cmp	r0, #28
	ble	.L224
	ldr	r3, .L232+12
	add	r2, r2, #256
	sub	r0, r0, #1
	str	r2, [ip]
	str	r0, [r1]
	add	r1, r3, #288
.L222:
	ldr	r2, [r3, #8]
	add	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #48
	cmp	r3, r1
	bne	.L222
	ldr	r3, .L232+16
	ldr	r1, [r3]
	cmp	r1, #0
	ble	.L226
	ldr	r3, .L232+20
	add	r1, r1, r1, lsl #2
	add	r1, r3, r1, lsl #3
.L225:
	ldr	r2, [r3, #8]
	add	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #40
	cmp	r3, r1
	bne	.L225
	b	.L226
.L233:
	.align	2
.L232:
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
	.comm	hearts,84,4
	.comm	sanitizer,200,4
	.comm	customers,288,4
	.comm	player,56,4
	.comm	paper,1200,4
	.comm	shadowOAM,1024,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	totalPaper,4,4
	.comm	screenBlock,4,4
	.comm	playerHoff,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
