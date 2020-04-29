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
	.global	goToMenu
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToMenu, %function
goToMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #0
	mov	r6, #67108864
	ldr	r1, .L4
	ldr	r2, .L4+4
	ldr	r3, .L4+8
	str	r4, [r1]
	str	r4, [r2]
	str	r4, [r3]
	ldr	r5, .L4+12
	strh	r4, [r6, #16]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	strh	r4, [r6, #18]	@ movhi
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r5
	mov	r3, #11072
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L4+24
	mov	r3, #1024
	ldr	r2, .L4+28
	mov	lr, pc
	bx	r5
	mov	r2, #4352
	ldr	r3, .L4+32
	strh	r2, [r6]	@ movhi
	strh	r3, [r6, #8]	@ movhi
	ldr	r3, .L4+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+40
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+44
	mov	r3, #512
	mov	lr, pc
	bx	r5
	ldr	r3, .L4+48
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L4+52
	ldr	r1, .L4+56
	ldr	r0, .L4+60
	mov	lr, pc
	bx	r3
	ldr	r2, .L4+64
	ldr	r3, .L4+68
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	hOff
	.word	playerHoff
	.word	vOff
	.word	DMANow
	.word	MenuBackgroundPal
	.word	MenuBackgroundTiles
	.word	MenuBackgroundMap
	.word	100712448
	.word	22656
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	stopSound
	.word	playSoundA
	.word	317834
	.word	menuSong
	.word	state
	.word	seed
	.size	goToMenu, .-goToMenu
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r0, #4
	push	{r4, lr}
	ldr	r2, .L8
	ldr	lr, .L8+4
	ldr	ip, .L8+8
	ldr	r1, .L8+12
	str	r3, [r2]
	ldr	r2, .L8+16
	str	r3, [lr]
	str	r3, [ip]
	str	r0, [r1]
	mov	lr, pc
	bx	r2
	ldr	r3, .L8+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToMenu
.L9:
	.align	2
.L8:
	.word	TPCollected
	.word	lost
	.word	won
	.word	playerHealth
	.word	setupInterrupts
	.word	setupSounds
	.size	initialize, .-initialize
	.align	2
	.global	goToDifficulty
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToDifficulty, %function
goToDifficulty:
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
	mov	r3, #1456
	mov	r0, #3
	ldr	r2, .L12+8
	ldr	r1, .L12+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L12+16
	mov	r3, #1024
	ldr	r2, .L12+20
	mov	lr, pc
	bx	r4
	mov	r5, #512
	mov	r3, #67108864
	ldr	r2, .L12+24
	strh	r5, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r3, .L12+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+32
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L12+36
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L12+40
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	diffBackgroundPal
	.word	100679680
	.word	diffBackgroundTiles
	.word	diffBackgroundMap
	.word	100710400
	.word	5892
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToDifficulty, .-goToDifficulty
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
	ldr	r4, .L16
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L16+4
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L16+8
	ldr	r2, .L16+12
	ldr	r1, .L16+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L16+20
	mov	r3, #1024
	ldr	r2, .L16+24
	mov	lr, pc
	bx	r4
	mov	r5, #512
	mov	r3, #67108864
	ldr	r2, .L16+28
	strh	r5, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r3, .L16+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L16+36
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L16+40
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L16+44
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
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
	.global	menu
	.syntax unified
	.arm
	.fpu softvfp
	.type	menu, %function
menu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L30
	ldr	r3, [r2]
	push	{r4, lr}
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
	bl	goToDifficulty
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
	b	goToDifficulty
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
	mov	r2, #1
	ldr	r1, .L48
	ldr	r0, .L48+4
	ldr	r3, .L48+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L48+12
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L48+16
	mov	lr, pc
	bx	r4
	mov	r3, #5312
	mov	r0, #3
	ldr	r2, .L48+20
	ldr	r1, .L48+24
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L48+28
	mov	r3, #1024
	ldr	r2, .L48+32
	mov	lr, pc
	bx	r4
	mov	r5, #512
	mov	r3, #67108864
	ldr	r2, .L48+36
	strh	r5, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r3, .L48+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L48+44
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L48+48
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L48+52
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L49:
	.align	2
.L48:
	.word	84562
	.word	pauseNoise
	.word	playSoundB
	.word	DMANow
	.word	pauseBackgroundPal
	.word	100679680
	.word	pauseBackgroundTiles
	.word	pauseBackgroundMap
	.word	100702208
	.word	4996
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	gotoPause, .-gotoPause
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
	ldr	r4, .L52
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L52+4
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L52+8
	ldr	r2, .L52+12
	ldr	r1, .L52+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L52+20
	mov	r3, #1024
	ldr	r2, .L52+24
	mov	lr, pc
	bx	r4
	mov	r5, #512
	mov	r3, #67108864
	ldr	r2, .L52+28
	strh	r5, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r3, .L52+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+36
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L52+40
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L52+44
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L53:
	.align	2
.L52:
	.word	DMANow
	.word	loseBackgroundPal
	.word	6512
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
	ldr	r3, .L61
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L54
	ldr	r3, .L61+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L60
.L54:
	pop	{r4, lr}
	bx	lr
.L60:
	ldr	r3, .L61+12
	mov	lr, pc
	bx	r3
	bl	goToMenu
	mov	r2, #1
	ldr	r1, .L61+16
	ldr	r0, .L61+20
	ldr	r3, .L61+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	317824
	.word	menuSong
	.word	playSoundA
	.size	lose, .-lose
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
	ldr	r4, .L65
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L65+4
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L65+8
	ldr	r2, .L65+12
	ldr	r1, .L65+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L65+20
	mov	r3, #1024
	ldr	r2, .L65+24
	mov	lr, pc
	bx	r4
	mov	r5, #512
	mov	r3, #67108864
	ldr	r2, .L65+28
	strh	r5, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r3, .L65+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L65+36
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L65+40
	mov	lr, pc
	bx	r4
	mov	r2, #6
	ldr	r3, .L65+44
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L66:
	.align	2
.L65:
	.word	DMANow
	.word	winBackgroundPal
	.word	5424
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
	ldr	r3, .L74
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L74+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L67
	ldr	r3, .L74+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L73
.L67:
	pop	{r4, lr}
	bx	lr
.L73:
	ldr	r3, .L74+12
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L74+16
	ldr	r0, .L74+20
	ldr	r3, .L74+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToMenu
.L75:
	.align	2
.L74:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	317814
	.word	menuSong
	.word	playSoundA
	.size	win, .-win
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
	mov	r3, #256
	ldr	r4, .L78
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L78+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L78+8
	ldr	r1, .L78+12
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L78+16
	ldr	r1, .L78+20
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r1, #464
	mov	r0, #4352
	ldr	r3, .L78+24
	strh	r3, [r2, #8]	@ movhi
	ldr	r3, .L78+28
	strh	r1, [r2, #80]	@ movhi
	ldrh	r1, [r3]
	ldr	r3, .L78+32
	strh	r1, [r2, #18]	@ movhi
	ldrh	r1, [r3]
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #16]	@ movhi
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L78+36
	ldr	r1, .L78+40
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L78+44
	ldr	r1, .L78+48
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L78+52
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L78+56
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L78+60
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L79:
	.align	2
.L78:
	.word	DMANow
	.word	gameBackgroundPal
	.word	7184
	.word	gameBackgroundTiles
	.word	100720640
	.word	gameBackgroundMap
	.word	23554
	.word	vOff
	.word	hOff
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	difficulty
	.syntax unified
	.arm
	.fpu softvfp
	.type	difficulty, %function
difficulty:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L97
	ldr	r3, .L97+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #1
	beq	.L81
	ldr	r2, .L97+8
	ldrh	r2, [r2]
	ands	r2, r2, #1
	beq	.L94
.L81:
	tst	r3, #2
	beq	.L82
	ldr	r2, .L97+8
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L95
.L82:
	tst	r3, #4
	beq	.L80
	ldr	r3, .L97+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L96
.L80:
	pop	{r4, r5, r6, lr}
	bx	lr
.L96:
	pop	{r4, r5, r6, lr}
	b	goToMenu
.L94:
	mov	ip, #10
	ldr	r3, .L97+12
	ldr	r0, .L97+16
	ldr	r1, .L97+20
	str	ip, [r3]
	ldr	r0, [r0]
	ldr	r3, .L97+24
	str	r2, [r1]
	mov	lr, pc
	bx	r3
	ldr	r3, .L97+28
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L97+32
	ldr	r0, .L97+36
	ldr	r3, .L97+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L97+44
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L81
.L95:
	mov	r1, #20
	mov	r5, #1
	ldr	r3, .L97+12
	ldr	r0, .L97+16
	ldr	r2, .L97+20
	str	r1, [r3]
	ldr	r0, [r0]
	ldr	r3, .L97+24
	str	r5, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L97+28
	mov	lr, pc
	bx	r3
	mov	r2, r5
	ldr	r1, .L97+32
	ldr	r0, .L97+36
	ldr	r3, .L97+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L97+44
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L82
.L98:
	.align	2
.L97:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	totalPaper
	.word	seed
	.word	diff
	.word	srand
	.word	stopSound
	.word	1100374
	.word	gameSong
	.word	playSoundA
	.word	initGame
	.size	difficulty, .-difficulty
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
	ldr	r3, .L111
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L111+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L100
	ldr	r2, .L111+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L109
.L100:
	tst	r3, #4
	beq	.L99
	ldr	r3, .L111+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L110
.L99:
	pop	{r4, lr}
	bx	lr
.L109:
	ldr	r3, .L111+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L111+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L110:
	ldr	r3, .L111+20
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L111+24
	ldr	r0, .L111+28
	ldr	r3, .L111+32
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToMenu
.L112:
	.align	2
.L111:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	stopSoundB
	.word	unpauseSoundA
	.word	stopSound
	.word	317824
	.word	menuSong
	.word	playSoundA
	.size	pause, .-pause
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
	push	{r4, lr}
	ldr	r3, .L130
	mov	lr, pc
	bx	r3
	ldr	r3, .L130+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L130+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L130+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L130+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L130+20
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L127
.L114:
	ldr	r3, .L130+24
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L128
.L115:
	ldr	r3, .L130+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L113
	ldr	r3, .L130+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L129
.L113:
	pop	{r4, lr}
	bx	lr
.L128:
	bl	goToLose
	ldr	r3, .L130+36
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L130+40
	ldr	r0, .L130+44
	ldr	r3, .L130+48
	mov	lr, pc
	bx	r3
	b	.L115
.L127:
	bl	goToWin
	ldr	r3, .L130+36
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L130+52
	ldr	r0, .L130+56
	ldr	r3, .L130+48
	mov	lr, pc
	bx	r3
	b	.L114
.L129:
	ldr	r3, .L130+60
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	gotoPause
.L131:
	.align	2
.L130:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	won
	.word	lost
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	374011
	.word	loseSong
	.word	playSoundA
	.word	317886
	.word	winSong
	.word	pauseSoundA
	.size	game, .-game
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
	ldr	r3, .L146
	mov	lr, pc
	bx	r3
	ldr	r6, .L146+4
	ldr	r7, .L146+8
	ldr	r5, .L146+12
	ldr	fp, .L146+16
	ldr	r10, .L146+20
	ldr	r9, .L146+24
	ldr	r8, .L146+28
	ldr	r4, .L146+32
.L133:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L134:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L134
.L136:
	.word	.L142
	.word	.L141
	.word	.L140
	.word	.L139
	.word	.L138
	.word	.L137
	.word	.L135
.L135:
	ldr	r3, .L146+36
	mov	lr, pc
	bx	r3
	b	.L133
.L137:
	ldr	r3, .L146+40
	mov	lr, pc
	bx	r3
	b	.L133
.L138:
	ldr	r3, .L146+44
	mov	lr, pc
	bx	r3
	b	.L133
.L139:
	mov	lr, pc
	bx	r8
	b	.L133
.L140:
	mov	lr, pc
	bx	r9
	b	.L133
.L141:
	mov	lr, pc
	bx	r10
	b	.L133
.L142:
	mov	lr, pc
	bx	fp
	b	.L133
.L147:
	.align	2
.L146:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	menu
	.word	instructions
	.word	difficulty
	.word	game
	.word	67109120
	.word	win
	.word	lose
	.word	pause
	.size	main, .-main
	.comm	won,4,4
	.comm	lost,4,4
	.comm	playerHealth,4,4
	.comm	TPCollected,4,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	totalPaper,4,4
	.comm	screenBlock,4,4
	.comm	playerHoff,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
