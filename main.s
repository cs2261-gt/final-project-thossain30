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
	.word	317934
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
	mov	r0, #3
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
	.syntax unified
	.arm
	.fpu softvfp
	.type	win.part.0, %function
win.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L12
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L12+4
	ldr	r0, .L12+8
	ldr	r3, .L12+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToMenu
.L13:
	.align	2
.L12:
	.word	stopSound
	.word	317934
	.word	menuSong
	.word	playSoundA
	.size	win.part.0, .-win.part.0
	.set	pause.part.0,win.part.0
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
	ldr	r4, .L16
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L16+4
	mov	lr, pc
	bx	r4
	mov	r3, #1120
	mov	r0, #3
	ldr	r2, .L16+8
	ldr	r1, .L16+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L16+16
	mov	r3, #1024
	ldr	r2, .L16+20
	mov	lr, pc
	bx	r4
	mov	r5, #512
	mov	r3, #67108864
	ldr	r2, .L16+24
	strh	r5, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r3, .L16+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L16+32
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L16+36
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L16+40
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
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
	ldr	r4, .L20
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L20+4
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L20+8
	ldr	r2, .L20+12
	ldr	r1, .L20+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L20+20
	mov	r3, #1024
	ldr	r2, .L20+24
	mov	lr, pc
	bx	r4
	mov	r5, #512
	mov	r3, #67108864
	ldr	r2, .L20+28
	strh	r5, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r3, .L20+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+36
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L20+40
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L20+44
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L21:
	.align	2
.L20:
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
	ldr	r2, .L34
	ldr	r3, [r2]
	push	{r4, lr}
	ldr	r4, .L34+4
	add	r3, r3, #1
	ldr	r1, .L34+8
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L23
	ldr	r2, .L34+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L32
.L23:
	tst	r3, #1
	beq	.L22
	ldr	r3, .L34+12
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L33
.L22:
	pop	{r4, lr}
	bx	lr
.L33:
	pop	{r4, lr}
	b	goToInstructions
.L32:
	bl	goToDifficulty
	ldrh	r3, [r4]
	b	.L23
.L35:
	.align	2
.L34:
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
	ldr	r4, .L48
	ldr	r3, .L48+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L37
	ldr	r2, .L48+8
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L46
.L37:
	tst	r3, #8
	beq	.L36
	ldr	r3, .L48+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L47
.L36:
	pop	{r4, lr}
	bx	lr
.L47:
	pop	{r4, lr}
	b	goToDifficulty
.L46:
	bl	goToMenu
	ldrh	r3, [r4]
	b	.L37
.L49:
	.align	2
.L48:
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
	ldr	r1, .L52
	ldr	r0, .L52+4
	ldr	r3, .L52+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L52+12
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L52+16
	mov	lr, pc
	bx	r4
	mov	r3, #5312
	mov	r0, #3
	ldr	r2, .L52+20
	ldr	r1, .L52+24
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L52+28
	mov	r3, #1024
	ldr	r2, .L52+32
	mov	lr, pc
	bx	r4
	mov	r5, #512
	mov	r3, #67108864
	ldr	r2, .L52+36
	strh	r5, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r3, .L52+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+44
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L52+48
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L52+52
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L53:
	.align	2
.L52:
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
	ldr	r4, .L56
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L56+4
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L56+8
	ldr	r2, .L56+12
	ldr	r1, .L56+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L56+20
	mov	r3, #1024
	ldr	r2, .L56+24
	mov	lr, pc
	bx	r4
	mov	r5, #512
	mov	r3, #67108864
	ldr	r2, .L56+28
	strh	r5, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r3, .L56+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L56+36
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L56+40
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L56+44
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L57:
	.align	2
.L56:
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
	ldr	r3, .L65
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L65+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L58
	ldr	r3, .L65+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L64
.L58:
	pop	{r4, lr}
	bx	lr
.L64:
	ldr	r3, .L65+12
	mov	lr, pc
	bx	r3
	bl	goToMenu
	mov	r2, #1
	ldr	r1, .L65+16
	ldr	r0, .L65+20
	ldr	r3, .L65+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	317934
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
	ldr	r4, .L69
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L69+4
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L69+8
	ldr	r2, .L69+12
	ldr	r1, .L69+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L69+20
	mov	r3, #1024
	ldr	r2, .L69+24
	mov	lr, pc
	bx	r4
	mov	r5, #512
	mov	r3, #67108864
	ldr	r2, .L69+28
	strh	r5, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r3, .L69+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+36
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L69+40
	mov	lr, pc
	bx	r4
	mov	r2, #6
	ldr	r3, .L69+44
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L70:
	.align	2
.L69:
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
	ldr	r3, .L78
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L78+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L71
	ldr	r3, .L78+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L77
.L71:
	pop	{r4, lr}
	bx	lr
.L77:
	pop	{r4, lr}
	b	win.part.0
.L79:
	.align	2
.L78:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
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
	ldr	r3, .L82
	ldr	r4, .L82+4
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L82+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L82+12
	ldr	r1, .L82+16
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L82+20
	ldr	r1, .L82+24
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r3, #4352
	mov	r1, #23552
	strh	r3, [r2]	@ movhi
	ldr	r3, .L82+28
	strh	r1, [r2, #8]	@ movhi
	ldrh	r1, [r3]
	ldr	r3, .L82+32
	strh	r1, [r2, #18]	@ movhi
	ldrh	r1, [r3]
	mov	r0, #3
	strh	r1, [r2, #16]	@ movhi
	mov	r3, #256
	ldr	r2, .L82+36
	ldr	r1, .L82+40
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L82+44
	ldr	r1, .L82+48
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L82+52
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L82+56
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L82+60
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L83:
	.align	2
.L82:
	.word	unpauseSoundA
	.word	DMANow
	.word	gameBackgroundPal
	.word	7184
	.word	gameBackgroundTiles
	.word	100720640
	.word	gameBackgroundMap
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
	push	{r4, lr}
	ldr	r4, .L96
	ldr	r3, .L96+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #1
	beq	.L85
	ldr	r2, .L96+8
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L94
.L85:
	tst	r3, #2
	beq	.L84
	ldr	r3, .L96+8
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L95
.L84:
	pop	{r4, lr}
	bx	lr
.L95:
	mov	r1, #22
	ldr	r3, .L96+12
	ldr	r2, .L96+16
	ldr	r0, [r3]
	ldr	r3, .L96+20
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L96+24
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L96+28
	ldr	r0, .L96+32
	ldr	r3, .L96+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L96+40
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L94:
	mov	r1, #10
	ldr	r3, .L96+12
	ldr	r2, .L96+16
	ldr	r0, [r3]
	ldr	r3, .L96+20
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L96+24
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L96+28
	ldr	r0, .L96+32
	ldr	r3, .L96+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L96+40
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L85
.L97:
	.align	2
.L96:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	seed
	.word	totalPaper
	.word	srand
	.word	stopSound
	.word	1100494
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
	ldr	r3, .L110
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L110+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L99
	ldr	r2, .L110+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L108
.L99:
	tst	r3, #4
	beq	.L98
	ldr	r3, .L110+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L109
.L98:
	pop	{r4, lr}
	bx	lr
.L108:
	ldr	r3, .L110+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L109:
	pop	{r4, lr}
	b	pause.part.0
.L111:
	.align	2
.L110:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	stopSoundB
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
	ldr	r3, .L129
	mov	lr, pc
	bx	r3
	ldr	r3, .L129+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L129+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L129+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L129+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L129+20
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L126
.L113:
	ldr	r3, .L129+24
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L127
.L114:
	ldr	r3, .L129+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L112
	ldr	r3, .L129+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L128
.L112:
	pop	{r4, lr}
	bx	lr
.L127:
	bl	goToLose
	ldr	r3, .L129+36
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L129+40
	ldr	r0, .L129+44
	ldr	r3, .L129+48
	mov	lr, pc
	bx	r3
	b	.L114
.L126:
	bl	goToWin
	ldr	r3, .L129+36
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L129+52
	ldr	r0, .L129+56
	ldr	r3, .L129+48
	mov	lr, pc
	bx	r3
	b	.L113
.L128:
	ldr	r3, .L129+60
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	gotoPause
.L130:
	.align	2
.L129:
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
	.word	374131
	.word	loseSong
	.word	playSoundA
	.word	318006
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
	ldr	r3, .L145
	mov	lr, pc
	bx	r3
	ldr	r6, .L145+4
	ldr	r7, .L145+8
	ldr	r5, .L145+12
	ldr	fp, .L145+16
	ldr	r10, .L145+20
	ldr	r9, .L145+24
	ldr	r8, .L145+28
	ldr	r4, .L145+32
.L132:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L133:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L133
.L135:
	.word	.L141
	.word	.L140
	.word	.L139
	.word	.L138
	.word	.L137
	.word	.L136
	.word	.L134
.L134:
	ldr	r3, .L145+36
	mov	lr, pc
	bx	r3
	b	.L132
.L136:
	ldr	r3, .L145+40
	mov	lr, pc
	bx	r3
	b	.L132
.L137:
	ldr	r3, .L145+44
	mov	lr, pc
	bx	r3
	b	.L132
.L138:
	mov	lr, pc
	bx	r8
	b	.L132
.L139:
	mov	lr, pc
	bx	r9
	b	.L132
.L140:
	mov	lr, pc
	bx	r10
	b	.L132
.L141:
	mov	lr, pc
	bx	fp
	b	.L132
.L146:
	.align	2
.L145:
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
