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
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	lr, #0
	ldr	ip, .L4
	ldr	r4, .L4+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+8
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L4+12
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+20
	ldr	r1, .L4+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #7296
	mov	r2, #4352
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	TPCollected
	.word	DMANow
	.word	MenuBackgroundPal
	.word	8864
	.word	MenuBackgroundTiles
	.word	100720640
	.word	MenuBackgroundMap
	.size	initialize, .-initialize
	.align	2
	.global	goToMenu
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToMenu, %function
goToMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L8+8
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L8+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r1, .L8+16
	ldr	r2, .L8+20
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	hideSprites
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	state
	.word	seed
	.size	goToMenu, .-goToMenu
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #256
	ldr	r4, .L12
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L12+4
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L12+8
	ldr	r2, .L12+12
	ldr	r1, .L12+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L12+20
	mov	r3, #1024
	ldr	r2, .L12+24
	mov	lr, pc
	bx	r4
	mov	r5, #512
	mov	r3, #67108864
	ldr	r2, .L12+28
	strh	r5, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r3, .L12+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+36
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L12+40
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L12+44
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	instructionBackgroundPal
	.word	6928
	.word	100679680
	.word	instructionBackgroundTiles
	.word	instructionBackgroundMap
	.word	100706304
	.word	5380
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L16
	mov	lr, pc
	bx	r3
	ldr	r3, .L16+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L16+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L16+12
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L16+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	hideSprites
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	menu
	.syntax unified
	.arm
	.fpu softvfp
	.type	menu, %function
menu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	initialize
	ldr	r2, .L30
	ldr	r3, [r2]
	ldr	r4, .L30+4
	add	r3, r3, #1
	ldr	r1, .L30+8
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L19
	ldr	r2, .L30+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L28
.L19:
	tst	r3, #1
	beq	.L18
	ldr	r3, .L30+12
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L29
.L18:
	pop	{r4, lr}
	bx	lr
.L29:
	pop	{r4, lr}
	b	goToInstructions
.L28:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L19
.L31:
	.align	2
.L30:
	.word	seed
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.size	menu, .-menu
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L44
	ldr	r3, .L44+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L33
	ldr	r2, .L44+8
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L42
.L33:
	tst	r3, #8
	beq	.L32
	ldr	r3, .L44+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L43
.L32:
	pop	{r4, lr}
	bx	lr
.L43:
	pop	{r4, lr}
	b	goToGame
.L42:
	bl	goToMenu
	ldrh	r3, [r4]
	b	.L33
.L45:
	.align	2
.L44:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.size	instructions, .-instructions
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	game, .-game
	.align	2
	.global	gotoPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	gotoPause, %function
gotoPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #256
	ldr	r4, .L49
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L49+4
	mov	lr, pc
	bx	r4
	mov	r3, #1664
	mov	r0, #3
	ldr	r2, .L49+8
	ldr	r1, .L49+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L49+16
	mov	r3, #1024
	ldr	r2, .L49+20
	mov	lr, pc
	bx	r4
	mov	r5, #512
	mov	r3, #67108864
	ldr	r2, .L49+24
	strh	r5, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r3, .L49+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L49+32
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L49+36
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L49+40
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L50:
	.align	2
.L49:
	.word	DMANow
	.word	pauseBackgroundPal
	.word	100679680
	.word	pauseBackgroundTiles
	.word	pauseBackgroundMap
	.word	100702208
	.word	4868
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	gotoPause, .-gotoPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L63
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L63+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L52
	ldr	r2, .L63+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L61
.L52:
	tst	r3, #4
	beq	.L51
	ldr	r3, .L63+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L62
.L51:
	pop	{r4, lr}
	bx	lr
.L61:
	pop	{r4, lr}
	b	goToGame
.L62:
	pop	{r4, lr}
	b	goToMenu
.L64:
	.align	2
.L63:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #256
	ldr	r4, .L67
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L67+4
	mov	lr, pc
	bx	r4
	mov	r3, #1104
	mov	r0, #3
	ldr	r2, .L67+8
	ldr	r1, .L67+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L67+16
	mov	r3, #1024
	ldr	r2, .L67+20
	mov	lr, pc
	bx	r4
	mov	r5, #512
	mov	r3, #67108864
	ldr	r2, .L67+24
	strh	r5, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r3, .L67+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L67+32
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L67+36
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L67+40
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L68:
	.align	2
.L67:
	.word	DMANow
	.word	loseBackgroundPal
	.word	100679680
	.word	loseBackgroundTiles
	.word	loseBackgroundMap
	.word	100698112
	.word	4356
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L76
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L76+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L69
	ldr	r3, .L76+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L75
.L69:
	pop	{r4, lr}
	bx	lr
.L75:
	pop	{r4, lr}
	b	goToMenu
.L77:
	.align	2
.L76:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r6, .L89
	ldr	fp, .L89+4
	ldr	r5, .L89+8
	ldr	r10, .L89+12
	ldr	r9, .L89+16
	ldr	r8, .L89+20
	ldr	r7, .L89+24
	ldr	r4, .L89+28
.L79:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L80:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L80
.L82:
	.word	.L85
	.word	.L84
	.word	.L80
	.word	.L83
	.word	.L81
	.word	.L81
.L81:
	mov	lr, pc
	bx	r7
	b	.L79
.L83:
	mov	lr, pc
	bx	r8
	b	.L79
.L84:
	mov	lr, pc
	bx	r9
	b	.L79
.L85:
	mov	lr, pc
	bx	r10
	b	.L79
.L90:
	.align	2
.L89:
	.word	state
	.word	buttons
	.word	oldButtons
	.word	menu
	.word	instructions
	.word	pause
	.word	lose
	.word	67109120
	.size	main, .-main
	.text
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #256
	ldr	r4, .L93
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L93+4
	mov	lr, pc
	bx	r4
	mov	r3, #720
	mov	r0, #3
	ldr	r2, .L93+8
	ldr	r1, .L93+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L93+16
	mov	r3, #1024
	ldr	r2, .L93+20
	mov	lr, pc
	bx	r4
	mov	r5, #512
	mov	r3, #67108864
	ldr	r2, .L93+24
	strh	r5, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r3, .L93+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L93+32
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L93+36
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L93+40
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L94:
	.align	2
.L93:
	.word	DMANow
	.word	winBackgroundPal
	.word	100679680
	.word	winBackgroundTiles
	.word	winBackgroundMap
	.word	100700160
	.word	4612
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	lose
	.size	win, .-win
	.comm	won,4,4
	.comm	lost,4,4
	.comm	TPCollected,4,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
