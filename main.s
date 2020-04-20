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
	ldr	r1, .L20
	ldr	r0, .L20+4
	ldr	r3, .L20+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L20+12
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L20+16
	mov	lr, pc
	bx	r4
	mov	r3, #5312
	mov	r0, #3
	ldr	r2, .L20+20
	ldr	r1, .L20+24
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L20+28
	mov	r3, #1024
	ldr	r2, .L20+32
	mov	lr, pc
	bx	r4
	mov	r5, #512
	mov	r3, #67108864
	ldr	r2, .L20+36
	strh	r5, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r3, .L20+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+44
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L20+48
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L20+52
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L21:
	.align	2
.L20:
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
	ldr	r4, .L24
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L24+4
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L24+8
	ldr	r2, .L24+12
	ldr	r1, .L24+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L24+20
	mov	r3, #1024
	ldr	r2, .L24+24
	mov	lr, pc
	bx	r4
	mov	r5, #512
	mov	r3, #67108864
	ldr	r2, .L24+28
	strh	r5, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r3, .L24+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L24+36
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L24+40
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L24+44
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L25:
	.align	2
.L24:
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
	ldr	r3, .L33
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L33+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L26
	ldr	r3, .L33+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L32
.L26:
	pop	{r4, lr}
	bx	lr
.L32:
	ldr	r3, .L33+12
	mov	lr, pc
	bx	r3
	bl	goToMenu
	mov	r2, #1
	ldr	r1, .L33+16
	ldr	r0, .L33+20
	ldr	r3, .L33+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L34:
	.align	2
.L33:
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
	ldr	r4, .L37
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L37+4
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L37+8
	ldr	r2, .L37+12
	ldr	r1, .L37+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L37+20
	mov	r3, #1024
	ldr	r2, .L37+24
	mov	lr, pc
	bx	r4
	mov	r5, #512
	mov	r3, #67108864
	ldr	r2, .L37+28
	strh	r5, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r3, .L37+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L37+36
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L37+40
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L37+44
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L38:
	.align	2
.L37:
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
	ldr	r3, .L46
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L46+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L39
	ldr	r3, .L46+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L45
.L39:
	pop	{r4, lr}
	bx	lr
.L45:
	pop	{r4, lr}
	b	win.part.0
.L47:
	.align	2
.L46:
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
	ldr	r3, .L50
	ldr	r4, .L50+4
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L50+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L50+12
	ldr	r1, .L50+16
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L50+20
	ldr	r1, .L50+24
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r3, #4352
	mov	r1, #23552
	strh	r3, [r2]	@ movhi
	ldr	r3, .L50+28
	strh	r1, [r2, #8]	@ movhi
	ldrh	r1, [r3]
	ldr	r3, .L50+32
	strh	r1, [r2, #18]	@ movhi
	ldrh	r1, [r3]
	mov	r0, #3
	strh	r1, [r2, #16]	@ movhi
	mov	r3, #256
	ldr	r2, .L50+36
	ldr	r1, .L50+40
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L50+44
	ldr	r1, .L50+48
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L50+52
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L50+56
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L50+60
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L51:
	.align	2
.L50:
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
	.global	menu
	.syntax unified
	.arm
	.fpu softvfp
	.type	menu, %function
menu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L64
	ldr	r3, [r2]
	push	{r4, lr}
	ldr	r4, .L64+4
	add	r3, r3, #1
	ldr	r1, .L64+8
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L53
	ldr	r2, .L64+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L62
.L53:
	tst	r3, #1
	beq	.L52
	ldr	r3, .L64+12
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L63
.L52:
	pop	{r4, lr}
	bx	lr
.L63:
	pop	{r4, lr}
	b	goToInstructions
.L62:
	ldr	r3, .L64+16
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L64+20
	ldr	r0, .L64+24
	ldr	r3, .L64+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L64+32
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L53
.L65:
	.align	2
.L64:
	.word	seed
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	stopSound
	.word	1100494
	.word	gameSong
	.word	playSoundA
	.word	initGame
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
	ldr	r4, .L78
	ldr	r3, .L78+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L67
	ldr	r2, .L78+8
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L76
.L67:
	tst	r3, #8
	beq	.L66
	ldr	r3, .L78+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L77
.L66:
	pop	{r4, lr}
	bx	lr
.L77:
	ldr	r2, .L78+12
	ldr	r3, .L78+16
	ldr	r0, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L78+20
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L78+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L78+28
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L78+32
	ldr	r0, .L78+36
	ldr	r3, .L78+40
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L76:
	bl	goToMenu
	ldrh	r3, [r4]
	b	.L67
.L79:
	.align	2
.L78:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	seed
	.word	srand
	.word	initGame
	.word	stopSoundA
	.word	stopSoundB
	.word	1100494
	.word	gameSong
	.word	playSoundA
	.size	instructions, .-instructions
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
	ldr	r3, .L92
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L92+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L81
	ldr	r2, .L92+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L90
.L81:
	tst	r3, #4
	beq	.L80
	ldr	r3, .L92+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L91
.L80:
	pop	{r4, lr}
	bx	lr
.L90:
	ldr	r3, .L92+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L92+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L91:
	pop	{r4, lr}
	b	pause.part.0
.L93:
	.align	2
.L92:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	stopSoundB
	.word	unpauseSoundA
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
	ldr	r3, .L111
	mov	lr, pc
	bx	r3
	ldr	r3, .L111+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L111+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L111+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L111+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L111+20
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L108
.L95:
	ldr	r3, .L111+24
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L109
.L96:
	ldr	r3, .L111+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L94
	ldr	r3, .L111+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L110
.L94:
	pop	{r4, lr}
	bx	lr
.L109:
	bl	goToLose
	ldr	r3, .L111+36
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L111+40
	ldr	r0, .L111+44
	ldr	r3, .L111+48
	mov	lr, pc
	bx	r3
	b	.L96
.L108:
	bl	goToWin
	ldr	r3, .L111+36
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L111+52
	ldr	r0, .L111+56
	ldr	r3, .L111+48
	mov	lr, pc
	bx	r3
	b	.L95
.L110:
	ldr	r3, .L111+60
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	gotoPause
.L112:
	.align	2
.L111:
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
	ldr	r3, .L126
	mov	lr, pc
	bx	r3
	ldr	r6, .L126+4
	ldr	r7, .L126+8
	ldr	r5, .L126+12
	ldr	fp, .L126+16
	ldr	r10, .L126+20
	ldr	r9, .L126+24
	ldr	r8, .L126+28
	ldr	r4, .L126+32
.L114:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L115:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L115
.L117:
	.word	.L122
	.word	.L121
	.word	.L120
	.word	.L119
	.word	.L118
	.word	.L116
.L116:
	ldr	r3, .L126+36
	mov	lr, pc
	bx	r3
	b	.L114
.L118:
	ldr	r3, .L126+40
	mov	lr, pc
	bx	r3
	b	.L114
.L119:
	mov	lr, pc
	bx	r8
	b	.L114
.L120:
	mov	lr, pc
	bx	r9
	b	.L114
.L121:
	mov	lr, pc
	bx	r10
	b	.L114
.L122:
	mov	lr, pc
	bx	fp
	b	.L114
.L127:
	.align	2
.L126:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	menu
	.word	instructions
	.word	game
	.word	pause
	.word	67109120
	.word	win
	.word	lose
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
