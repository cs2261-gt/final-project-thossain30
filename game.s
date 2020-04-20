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
	ldr	ip, [r1, #44]
	ldr	r2, [r1, #36]
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r0, #32
	mov	r8, r1
	mov	r5, r2
	mov	r4, #5
	mov	r7, #148
	mov	r6, #116
	ldr	r3, .L18
	b	.L15
.L11:
	str	ip, [r3]
	str	r1, [r3, #4]
.L16:
	add	r2, r2, #1
	add	r1, r1, #128
	add	r3, r3, #44
.L15:
	mov	ip, #1
	mov	lr, #4
	cmp	r2, #7
	str	ip, [r3, #32]
	str	r1, [r3, #8]
	movls	ip, #64
	str	r0, [r3, #20]
	str	r0, [r3, #16]
	str	r5, [r3, #28]
	str	r4, [r3, #24]
	str	lr, [r3, #40]
	strls	r8, [r3, #12]
	bls	.L11
	cmp	r2, #15
	movle	ip, #116
	strle	r6, [r3, #12]
	ble	.L11
	cmp	r2, #23
	movle	ip, #148
	strle	r7, [r3, #12]
	ble	.L11
.L13:
	ldr	ip, [r3, #12]
	cmp	r2, #29
	str	r1, [r3, #4]
	str	ip, [r3]
	bne	.L16
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
	ldr	r1, .L28+4
	ldr	r3, .L28+8
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, [r2]
	ldr	r5, [r1]
	add	lr, r3, #1312
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
	add	r3, r3, #44
	cmp	r3, lr
	add	r2, r2, #8
	beq	.L27
.L24:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	bne	.L21
.L23:
	add	r3, r3, #44
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
	add	r7, r4, #1312
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
	add	r4, r4, #44
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
	push	{r4, r5, r6, lr}
	mov	r1, #64
	mov	lr, r2
	mov	r6, #4
	mov	ip, #1
	mov	r5, #5
	mov	r0, #0
	mov	r4, #3
	ldr	r3, .L48
.L45:
	str	r1, [r3, #8]
	str	r2, [r3, #12]
	str	r1, [r3, #4]
	str	r6, [r3, #32]
	str	ip, [r3, #28]
	str	r5, [r3, #48]
	str	r0, [r3, #52]
	str	lr, [r3, #20]
	str	lr, [r3, #16]
	str	ip, [r3, #40]
	str	r4, [r3, #24]
	str	r0, [r3, #44]
	str	r2, [r3], #56
	add	r2, r2, #16
	cmp	r2, #128
	add	r1, r1, #128
	bne	.L45
	pop	{r4, r5, r6, lr}
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
	add	r0, r3, #336
.L54:
	ldr	r1, [r3, #40]
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
	add	r3, r3, #56
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
	mov	r3, #2
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r2, .L148
	mov	r6, #0
	mov	r7, #0
	ldr	fp, .L148+4
	str	r3, [r2]
	ldr	r10, .L148+8
	sub	sp, sp, #36
	b	.L96
.L91:
	ldr	r3, .L148+12
	ldrh	r4, [r3]
	ands	r4, r4, #1
	bne	.L141
	ldr	r2, [r10, #32]
	ldr	r1, .L148+16
	smull	r3, r1, r2, r1
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #2
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl #1
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
	ldr	ip, .L148+20
	add	r3, r3, #30
	add	r2, r2, #30
	sub	r1, r1, #15
	sub	r0, r0, #15
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L140
	ldr	r3, [fp, #40]
	cmp	r3, #0
	bne	.L136
.L140:
	ldr	r2, [fp, #24]
.L95:
	cmp	r2, #0
	bne	.L141
	mov	r0, #1
	ldr	r1, .L148+24
	ldr	r3, [fp, #8]
	str	r2, [fp, #40]
	ldr	r2, [fp, #12]
	str	r0, [r1, #1088]
	str	r3, [r1, #1064]
	str	r2, [r1, #1068]
.L92:
	ldr	r1, .L148+28
	ldr	r0, [r1]
	ldr	r1, .L148+32
	ldr	r1, [r1]
	sub	r2, r2, r0
	sub	r3, r3, r1
	stm	fp, {r2, r3}
	ldr	r3, .L148+36
	add	fp, fp, #56
	cmp	r3, fp
	beq	.L142
.L96:
	ldr	r3, [fp, #4]
	ldr	r0, [r10, #4]
	ldr	r4, .L148+40
	sub	r0, r0, r3
	mov	lr, pc
	bx	r4
	mov	r8, r0
	mov	r9, r1
	ldr	r3, [fp]
	ldr	r2, .L148+44
	ldr	r0, [r10]
	stm	r2, {r8-r9}
	sub	r0, r0, r3
	mov	lr, pc
	bx	r4
	mov	r4, r0
	mov	r5, r1
	ldr	r1, .L148+48
	mov	r2, r8
	stm	r1, {r4-r5}
	mov	r3, r9
	mov	r0, r8
	mov	r1, r9
	ldr	r8, .L148+52
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
	ldr	ip, .L148+56
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	mov	lr, pc
	bx	ip
	ldr	r3, .L148+60
	mov	lr, pc
	bx	r3
	ldr	r2, .L148+44
	ldr	r3, .L148+64
	ldmia	r2, {r8-r9}
	stm	r3, {r0-r1}
	str	r0, [sp, #16]
	str	r1, [sp, #20]
	mov	r2, r6
	mov	r0, r8
	mov	r1, r9
	mov	r3, r7
	ldr	ip, .L148+68
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L128
	ldr	r1, .L148+48
	ldmia	r1, {r4-r5}
	mov	r2, r6
	mov	r3, r7
	mov	r0, r4
	mov	r1, r5
	ldr	ip, .L148+68
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L129
	mov	r3, r5
	mov	r2, r4
	mov	r1, r9
	ldr	ip, .L148+68
	mov	r0, r8
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	movne	r3, #6
	moveq	r3, #4
	mov	r2, r6
	str	r3, [fp, #32]
	mov	r0, r8
	mov	r3, r7
	mov	r1, r9
	ldr	ip, .L148+72
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L102
.L103:
	ldr	r3, .L148+48
	ldmia	r3, {r4-r5}
.L99:
	mov	r2, r6
	mov	r3, r7
	mov	r0, r4
	mov	r1, r5
	ldr	ip, .L148+72
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L143
.L74:
	mov	r2, r6
	mov	r3, r7
	mov	r0, r8
	mov	r1, r9
	ldr	ip, .L148+72
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L144
.L81:
	ldr	r3, [fp, #44]
	cmp	r3, #0
	beq	.L85
	ldr	r3, .L148+76
	ldr	r3, [r3]
	tst	r3, #1
	bne	.L85
	ldr	r3, .L148
	ldr	r4, .L148+40
	ldr	r0, [r3]
	mov	lr, pc
	bx	r4
	mov	r2, r0
	mov	r3, r1
	ldr	r0, [fp, #8]
	str	r2, [sp, #24]
	str	r3, [sp, #28]
	mov	lr, pc
	bx	r4
	add	r3, sp, #16
	ldmia	r3, {r2-r3}
	mov	r4, r0
	mov	r5, r1
	mov	r0, r8
	mov	r1, r9
	ldr	ip, .L148+80
	mov	lr, pc
	bx	ip
	add	r9, sp, #24
	ldmia	r9, {r8-r9}
	ldr	ip, .L148+52
	mov	r2, r8
	mov	r3, r9
	mov	lr, pc
	bx	ip
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	ldr	r5, .L148+56
	mov	lr, pc
	bx	r5
	ldr	r3, .L148+84
	mov	lr, pc
	bx	r3
	ldr	r1, .L148+48
	add	r3, sp, #16
	ldmia	r3, {r2-r3}
	str	r0, [fp, #8]
	ldr	ip, .L148+80
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	ip
	ldr	ip, .L148+52
	mov	r2, r8
	mov	r3, r9
	mov	lr, pc
	bx	ip
	ldr	r3, .L148+40
	mov	r4, r0
	ldr	r0, [fp, #12]
	mov	r5, r1
	mov	lr, pc
	bx	r3
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	ldr	r5, .L148+56
	mov	lr, pc
	bx	r5
	ldr	r3, .L148+84
	mov	lr, pc
	bx	r3
	str	r0, [fp, #12]
.L85:
	ldr	r3, .L148+88
	ldr	r3, [r3]
	cmp	r3, #1
	bne	.L86
	mov	r1, #0
	ldr	ip, .L148+92
	ldr	r3, [ip]
	ldr	r2, .L148+96
	rsb	r0, r3, r3, lsl #3
	sub	r3, r3, #1
	str	r3, [ip]
	ldr	r3, .L148+88
	add	r2, r2, r0, lsl #2
	str	r1, [r2, #16]
	str	r1, [r3]
.L86:
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
	ldr	ip, .L148+20
	asr	r2, r2, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L88
	ldr	r3, [fp, #40]
	cmp	r3, #0
	bne	.L145
.L88:
	ldr	r3, .L148+100
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L91
.L141:
	ldr	r3, [fp, #8]
	ldr	r2, [fp, #12]
	b	.L92
.L128:
	mov	r2, r6
	mov	r3, r7
	mov	r0, r8
	mov	r1, r9
	ldr	ip, .L148+72
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L146
	mov	r2, r6
	mov	r3, r7
	mov	r0, r8
	mov	r1, r9
	ldr	ip, .L148+68
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L74
	b	.L103
.L129:
	mov	r2, r6
	mov	r3, r7
	mov	r0, r8
	mov	r1, r9
	ldr	ip, .L148+72
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L99
	mov	r2, r6
	mov	r3, r7
	mov	r0, r4
	mov	r1, r5
	ldr	ip, .L148+68
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L99
.L102:
	mov	r1, r9
	ldr	r3, .L148+84
	mov	r0, r8
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	rsblt	r0, r0, #0
	ldr	r3, .L148+40
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, r4
	ldr	ip, .L148+68
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	movne	r3, #7
	moveq	r3, #4
	str	r3, [fp, #32]
.L70:
	mov	r2, r6
	mov	r3, r7
	mov	r0, r8
	mov	r1, r9
	ldr	ip, .L148+68
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L99
.L100:
	mov	r2, r6
	mov	r3, r7
	mov	r0, r4
	mov	r1, r5
	ldr	ip, .L148+72
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L81
.L97:
	mov	r1, r9
	ldr	r3, .L148+84
	mov	r0, r8
	mov	lr, pc
	bx	r3
	mov	r3, r0
	mov	r0, r4
	eor	r4, r3, r3, asr #31
	sub	r4, r4, r3, asr #31
	mov	r1, r5
	ldr	r3, .L148+84
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	rsblt	r0, r0, #0
	cmp	r4, r0
	movgt	r3, #7
	movle	r3, #5
	str	r3, [fp, #32]
	b	.L81
.L143:
	mov	r1, r5
	ldr	r3, .L148+84
	mov	r0, r4
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	rsblt	r0, r0, #0
	ldr	r3, .L148+40
	mov	lr, pc
	bx	r3
	ldr	ip, .L148+72
	mov	r3, r1
	mov	r2, r0
	mov	r1, r9
	mov	r0, r8
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	movne	r3, #5
	moveq	r3, #6
	mov	r2, r6
	str	r3, [fp, #32]
	mov	r0, r8
	mov	r3, r7
	mov	r1, r9
	ldr	ip, .L148+72
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L81
	ldr	r3, .L148+48
	ldmia	r3, {r4-r5}
	b	.L97
.L146:
	ldr	r3, .L148+48
	ldmia	r3, {r4-r5}
	mov	r2, r6
	mov	r3, r7
	mov	r0, r4
	mov	r1, r5
	ldr	ip, .L148+68
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L70
	b	.L102
.L142:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L145:
	mov	r2, #0
	ldr	r1, .L148+104
	ldr	r0, .L148+108
	ldr	r3, .L148+112
	mov	lr, pc
	bx	r3
	ldr	r3, .L148+48
	ldmia	r3, {r2-r3}
	ldr	r8, .L148+84
	mov	r1, r3
	str	r2, [sp, #16]
	str	r3, [sp, #20]
	mov	r0, r2
	mov	lr, pc
	bx	r8
	mov	r9, r0
	ldr	r3, .L148+44
	ldmia	r3, {r4-r5}
	ldr	r3, [r10, #8]
	mov	r1, r5
	mov	r0, r4
	str	r3, [sp, #24]
	add	r9, r9, r3
	mov	lr, pc
	bx	r8
	ldr	r8, [r10, #12]
	add	r0, r0, r8
	cmp	r9, #0
	cmpgt	r0, #0
	add	r9, r0, r9, lsl #10
	ldr	r0, .L148+116
	lsl	r9, r9, #1
	ldrh	r0, [r0, r9]
	movgt	r1, #1
	movle	r1, #0
	cmp	r0, #0
	moveq	r1, #0
	cmp	r1, #0
	bne	.L147
.L90:
	mov	r3, #1
	ldr	r2, .L148+92
	ldr	r2, [r2]
	cmp	r2, #0
	ldr	r2, .L148+88
	str	r3, [r2]
	ldreq	r2, .L148+120
	streq	r3, [r2]
	b	.L88
.L144:
	ldr	r3, .L148+48
	ldmia	r3, {r4-r5}
	b	.L100
.L136:
	mov	r2, r4
	ldr	r3, .L148+112
	ldr	r1, .L148+124
	ldr	r0, .L148+128
	mov	lr, pc
	bx	r3
	mov	r3, #1
	ldr	r2, [fp, #24]
	sub	r2, r2, #1
	str	r2, [fp, #24]
	str	r3, [fp, #44]
	b	.L95
.L147:
	ldr	r9, .L148+40
	ldr	r0, [sp, #24]
	mov	lr, pc
	bx	r9
	add	r3, sp, #16
	ldmia	r3, {r2-r3}
	ldr	ip, .L148+56
	mov	lr, pc
	bx	ip
	ldr	r3, .L148+84
	mov	lr, pc
	bx	r3
	mov	r3, r0
	mov	r0, r8
	str	r3, [r10, #8]
	mov	lr, pc
	bx	r9
	mov	r2, r4
	mov	r3, r5
	ldr	ip, .L148+56
	mov	lr, pc
	bx	ip
	ldr	r3, .L148+84
	mov	lr, pc
	bx	r3
	str	r0, [r10, #12]
	b	.L90
.L149:
	.align	2
.L148:
	.word	speed
	.word	customers
	.word	player
	.word	buttons
	.word	1717986919
	.word	collision
	.word	paper
	.word	vOff
	.word	hOff
	.word	customers+336
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
	.word	oldButtons
	.word	3516
	.word	owSound
	.word	playSoundB
	.word	collisionBitmapBitmap
	.word	lost
	.word	4206
	.word	punchSound
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
	push	{r4, lr}
	mov	r2, #64
	mov	r1, #16
	mov	r4, #12
	mov	lr, #6
	mov	ip, #0
	mov	r0, #1
	ldr	r3, .L154
.L151:
	str	r2, [r3, #8]
	add	r2, r2, #128
	cmp	r2, #832
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r4, [r3, #24]
	str	lr, [r3, #40]
	str	ip, [r3, #28]
	str	r0, [r3, #32]
	add	r3, r3, #44
	bne	.L151
	pop	{r4, lr}
	bx	lr
.L155:
	.align	2
.L154:
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
	ldr	r2, .L164
	ldr	r3, .L164+4
	ldr	r4, [r2]
	ldr	r6, [r3]
	ldr	r3, .L164+8
	ldr	r2, .L164+12
	ldr	r5, .L164+16
	add	r7, r4, #160
	add	r8, r6, #240
	add	ip, r3, #264
.L160:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	beq	.L159
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
	blt	.L159
	ldr	r1, [r3, #8]
	cmp	r1, r6
	blt	.L159
	cmp	r9, r7
	ble	.L163
.L159:
	strh	lr, [r2]	@ movhi
.L158:
	add	r3, r3, #44
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L160
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L163:
	cmp	r9, r8
	bgt	.L159
	b	.L158
.L165:
	.align	2
.L164:
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
	ldr	r4, .L178
	ldr	r5, .L178+4
	ldr	r9, .L178+8
	ldr	r8, .L178+12
	ldr	r7, .L178+16
	ldr	r10, .L178+20
	ldr	fp, .L178+24
	sub	sp, sp, #20
	add	r6, r4, #264
.L168:
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
	beq	.L167
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L167
	ldr	r3, [r10]
	cmp	r3, #1
	ble	.L177
.L167:
	ldr	r2, [r4, #8]
	ldr	r1, [r8]
	ldr	r3, [r4, #12]
	sub	r2, r2, r1
	ldr	r1, [r7]
	sub	r3, r3, r1
	str	r2, [r4, #4]
	str	r3, [r4], #44
	cmp	r4, r6
	bne	.L168
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L177:
	add	r3, r3, #1
	str	r3, [r10]
	rsb	ip, r3, r3, lsl #3
	mov	r3, #1
	ldr	r2, .L178+28
	add	ip, r2, ip, lsl #2
	str	r3, [ip, #16]
	mov	r2, #0
	ldr	r3, .L178+32
	mov	r1, fp
	ldr	r0, .L178+36
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r3, [r4, #32]
	b	.L167
.L179:
	.align	2
.L178:
	.word	sanitizer
	.word	player
	.word	collision
	.word	hOff
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
	ldr	r3, .L184
.L181:
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
	bne	.L181
	pop	{r4, lr}
	bx	lr
.L185:
	.align	2
.L184:
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
	ldr	r3, .L192
	ldr	r2, .L192+4
	ldr	r4, .L192+8
	add	ip, r3, #84
.L189:
	ldr	r1, [r3, #16]
	cmp	r1, #0
	strheq	r5, [r2]	@ movhi
	beq	.L188
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
.L188:
	add	r3, r3, #28
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L189
	pop	{r4, r5, lr}
	bx	lr
.L193:
	.align	2
.L192:
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
	ldr	r4, .L200
	mov	r5, r6
	str	r6, [r4, #20]
	str	r6, [r4, #16]
	ldr	r6, .L200+4
	str	r3, [r4, #44]
	str	r3, [r4, #36]
	str	r3, [r4, #32]
	str	r3, [r6]
	ldr	r3, .L200+8
	str	fp, [r4, #48]
	str	r10, [r3]
	str	r9, [r4, #28]
	str	r9, [r4, #24]
	str	r8, [r4, #8]
	str	r8, [r4]
	str	r7, [r4, #12]
	str	r7, [r4, #4]
	ldr	r3, .L200+12
.L195:
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
	bne	.L195
	bl	initPaper
	mov	r5, #12
	mov	r2, #64
	mov	r1, #16
	mov	lr, #6
	mov	r0, #0
	mov	ip, #1
	ldr	r3, .L200+16
.L196:
	str	r2, [r3, #8]
	add	r2, r2, #128
	cmp	r2, #832
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r5, [r3, #24]
	str	lr, [r3, #40]
	str	r0, [r3, #28]
	str	ip, [r3, #32]
	add	r3, r3, #44
	bne	.L196
	mov	r1, #28
	mov	lr, #30
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	ldr	ip, .L200+20
	add	r2, r2, r2, lsr #31
	asr	r2, r2, #1
	str	r2, [ip]
	add	r3, r3, r3, lsr #31
	ldr	r2, .L200+24
	ldr	ip, .L200+28
	asr	r3, r3, #1
	str	r3, [r2]
	str	r3, [ip]
	ldr	r2, .L200+32
	ldr	r3, .L200+36
	str	r1, [r2]
	str	lr, [r3]
	ldr	ip, .L200+40
	ldr	r3, .L200+44
	ldr	r1, .L200+48
	ldr	r2, .L200+52
	str	r0, [r3]
	str	r0, [ip]
	str	r0, [r1]
	str	r0, [r2]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L201:
	.align	2
.L200:
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
	ldr	r1, .L204
	ldr	r3, [r1, #4]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	ip, [r1, #44]
	ldr	r2, [r1, #36]
	ldr	r0, .L204+4
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
	ldr	r2, .L204+8
	ldrh	r1, [r2]
	ldr	r2, .L204+12
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L205:
	.align	2
.L204:
	.word	player
	.word	shadowOAM
	.word	hOff
	.word	vOff
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
	ldr	r4, .L237
	ldr	r3, .L237+4
	ldr	r5, [r4, #32]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #36]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #40]
	str	r1, [r4, #36]
	bne	.L207
	ldr	r0, [r4, #44]
	ldr	r3, .L237+8
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L207:
	ldr	r3, .L237+12
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #36]
	ldr	r3, .L237+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #36]
	ldr	r3, .L237+12
	ldrh	r2, [r3, #48]
	tst	r2, #16
	bne	.L210
	mov	r2, #2
	ldrh	r3, [r3, #48]
	tst	r3, #32
	str	r2, [r4, #36]
	bne	.L212
.L213:
	mov	r3, #3
	str	r3, [r4, #36]
.L212:
	add	r5, r5, #1
	str	r5, [r4, #32]
.L214:
	mov	r7, #1
	ldr	r4, .L237+16
	ldr	r9, .L237+4
	ldr	r6, .L237+8
	add	r8, r4, #336
.L219:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	ldr	r5, [r4, #52]
	beq	.L216
	smull	r3, r2, r9, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	bne	.L216
	ldr	r0, [r4, #28]
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r6
	cmp	r1, #0
	moveq	r1, r7
	str	r1, [r4, #28]
.L216:
	add	r5, r5, #1
	str	r5, [r4, #52]
	add	r4, r4, #56
	cmp	r4, r8
	bne	.L219
	ldr	r5, .L237+20
	ldr	r8, .L237+4
	add	r7, r5, #1312
	ldr	r6, .L237+8
	add	r7, r7, #8
.L221:
	ldr	r4, [r5, #36]
	smull	r3, r2, r8, r4
	asr	r3, r4, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r4, r3, lsl #2
	bne	.L220
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L220
	ldr	r0, [r5, #28]
	ldr	r1, [r5, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r6
	str	r1, [r5, #28]
.L220:
	add	r4, r4, #1
	str	r4, [r5, #36]
	add	r5, r5, #44
	cmp	r5, r7
	bne	.L221
	ldr	r5, .L237+24
	ldr	r9, .L237+28
	ldr	r8, .L237+32
	ldr	r7, .L237+8
	add	r6, r5, #264
.L223:
	ldr	r4, [r5, #36]
	add	r3, r4, r4, lsl #2
	add	r3, r3, r3, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	add	r3, r4, r3, lsl #1
	add	r3, r3, r9
	cmp	r8, r3, ror #2
	bcc	.L222
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L222
	ldr	r0, [r5, #28]
	ldr	r1, [r5, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r7
	str	r1, [r5, #28]
.L222:
	add	r4, r4, #1
	str	r4, [r5, #36]
	add	r5, r5, #44
	cmp	r5, r6
	bne	.L223
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L210:
	ldrh	r3, [r3, #48]
	tst	r3, #32
	beq	.L213
	ldr	r3, [r4, #36]
	cmp	r3, #4
	bne	.L212
	mov	r3, #0
	str	r6, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #32]
	b	.L214
.L238:
	.align	2
.L237:
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
	ldr	r3, .L292
	ldrh	r3, [r3, #48]
	tst	r3, #32
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L292+4
	bne	.L287
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
	ldr	ip, .L292+8
	lsl	r3, r3, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #0
	bne	.L279
.L287:
	ldr	r5, .L292+12
.L241:
	ldr	r3, .L292
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L244
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
	ldr	r6, .L292+8
	add	r3, r2, r3, lsl #10
	lsl	r3, r3, #1
	ldrh	r3, [r6, r3]
	cmp	r3, #0
	bne	.L290
.L244:
	ldr	r3, .L292
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L289
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
	ldr	r1, .L292+8
	lsl	r2, r2, #1
	ldrh	r2, [r1, r2]
	cmp	r2, #0
	lsl	r3, r3, #10
	bne	.L283
.L289:
	ldr	r6, .L292+16
.L247:
	ldr	r3, .L292
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L250
	ldr	r1, [r4, #8]
	ldr	ip, [r4, #28]
	ldr	r0, [r4, #16]
	add	ip, r1, ip
	ldr	r2, [r4, #24]
	add	r3, ip, r0
	sub	r3, r3, #1
	ldr	r7, [r4, #12]
	add	r2, r2, r3, lsl #10
	ldr	lr, .L292+8
	add	r2, r2, r7
	add	r2, lr, r2, lsl #1
	ldrh	r2, [r2, #-2]
	cmp	r2, #0
	lsl	r3, r3, #10
	beq	.L250
	add	r3, r3, r7
	lsl	r3, r3, #1
	ldrh	r3, [lr, r3]
	cmp	ip, #255
	movgt	ip, #0
	movle	ip, #1
	cmp	r3, #0
	moveq	ip, #0
	cmp	ip, #0
	bne	.L291
.L250:
	bl	animateSprites
	add	r2, r4, #8
	ldr	r0, [r6]
	ldr	r1, [r5]
	ldm	r2, {r2, r3}
	sub	r2, r2, r0
	sub	r3, r3, r1
	stm	r4, {r2, r3}
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L283:
	ldr	r2, [r4, #24]
	add	r3, r3, r2
	add	r3, r3, ip
	add	r3, r1, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	beq	.L289
	ldr	r3, [r4]
	cmp	r3, #0
	ldr	r6, .L292+16
	ble	.L247
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
	b	.L247
.L290:
	add	r0, r0, r7
	sub	r0, r0, #1
	add	r2, r2, r0, lsl #10
	lsl	r2, r2, #1
	ldrh	r3, [r6, r2]
	cmp	r3, #0
	cmpne	r1, #1024
	bge	.L244
	ldr	r2, [r5]
	ldr	r3, .L292+20
	add	ip, ip, lr
	cmp	r2, r3
	str	ip, [r4, #12]
	bgt	.L244
	ldr	r0, .L292+24
	ldr	r1, [r0]
	cmp	r1, r3
	bgt	.L244
	ldr	r3, [r4, #4]
	cmp	r3, #120
	addgt	r1, r1, #1
	addgt	r2, r2, #1
	strgt	r1, [r0]
	strgt	r2, [r5]
	b	.L244
.L279:
	add	r3, r2, r0
	sub	r3, r3, #1
	add	r3, r1, r3, lsl #10
	lsl	r3, r3, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #0
	beq	.L287
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ble	.L287
	ldr	r0, .L292+24
	ldr	r2, [r0]
	mvn	ip, r2
	cmp	r3, #119
	lsr	ip, ip, #31
	movgt	ip, #0
	ldr	r5, .L292+12
	cmp	ip, #0
	ldrne	r3, [r5]
	subne	r2, r2, #1
	subne	r3, r3, #1
	str	r1, [r4, #12]
	strne	r2, [r0]
	strne	r3, [r5]
	b	.L241
.L291:
	ldr	r3, [r6]
	add	r1, r1, r0
	cmp	r3, #95
	str	r1, [r4, #8]
	bgt	.L250
	ldr	r2, [r4]
	cmp	r2, #80
	addgt	r3, r3, #1
	strgt	r3, [r6]
	b	.L250
.L293:
	.align	2
.L292:
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
	ldr	r1, .L311
	ldr	ip, .L311+4
	ldr	r3, [r1]
	ldr	r2, [ip]
	add	r3, r3, #1
	cmp	r2, #256
	push	{r4, lr}
	str	r3, [r1]
	ble	.L295
	ldr	r1, .L311+8
	ldr	r0, [r1]
	cmp	r0, #30
	bgt	.L303
	ldr	r3, .L311+12
	sub	r2, r2, #256
	add	r0, r0, #1
	str	r2, [ip]
	str	r0, [r1]
	add	r1, r3, #336
.L297:
	ldr	r2, [r3, #8]
	sub	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #56
	cmp	r3, r1
	bne	.L297
	ldr	r3, .L311+16
	ldr	r1, [r3]
	cmp	r1, #0
	ble	.L305
	ldr	r3, .L311+20
	add	r2, r1, r1, lsl #2
	add	r1, r1, r2, lsl #1
	add	r1, r3, r1, lsl #2
.L299:
	ldr	r2, [r3, #8]
	sub	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L299
.L305:
	mov	r3, #67108864
	lsl	r0, r0, #24
	orr	r0, r0, #1073741824
	lsr	r0, r0, #16
	strh	r0, [r3, #8]	@ movhi
.L303:
	bl	updatePlayer
	bl	updateCustomer
	bl	updatePaper
	pop	{r4, lr}
	b	updateSanitizer
.L295:
	cmp	r2, #0
	bge	.L303
	ldr	r1, .L311+8
	ldr	r0, [r1]
	cmp	r0, #28
	ble	.L303
	ldr	r3, .L311+12
	add	r2, r2, #256
	sub	r0, r0, #1
	str	r2, [ip]
	str	r0, [r1]
	add	r1, r3, #336
.L301:
	ldr	r2, [r3, #8]
	add	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #56
	cmp	r3, r1
	bne	.L301
	ldr	r3, .L311+16
	ldr	r1, [r3]
	cmp	r1, #0
	ble	.L305
	ldr	r3, .L311+20
	add	r2, r1, r1, lsl #2
	add	r1, r1, r2, lsl #1
	add	r1, r3, r1, lsl #2
.L304:
	ldr	r2, [r3, #8]
	add	r2, r2, #256
	str	r2, [r3, #8]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L304
	b	.L305
.L312:
	.align	2
.L311:
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
	.comm	sanitizer,264,4
	.comm	customers,336,4
	.comm	player,56,4
	.comm	paper,1320,4
	.comm	shadowOAM,1024,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	totalPaper,4,4
	.comm	screenBlock,4,4
	.comm	playerHoff,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
