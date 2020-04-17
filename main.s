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
	mov	r2, #0
	push	{r4, r5, r6, lr}
	mov	r5, #3
	mov	r4, #67108864
	ldr	r1, .L4
	ldr	r3, .L4+4
	str	r2, [r1]
	str	r2, [r3]
	ldr	lr, .L4+8
	ldr	ip, .L4+12
	ldr	r0, .L4+16
	ldr	r1, .L4+20
	ldr	r3, .L4+24
	str	r2, [lr]
	str	r2, [ip]
	str	r2, [r0]
	str	r2, [r1]
	str	r5, [r3]
	ldr	r6, .L4+28
	strh	r2, [r4, #16]	@ movhi
	mov	r0, r5
	strh	r2, [r4, #18]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L4+32
	mov	lr, pc
	bx	r6
	mov	r0, r5
	mov	r3, #11072
	mov	r2, #100663296
	ldr	r1, .L4+36
	mov	lr, pc
	bx	r6
	mov	r0, r5
	mov	r3, #1024
	ldr	r2, .L4+40
	ldr	r1, .L4+44
	mov	lr, pc
	bx	r6
	mov	r2, #4352
	ldr	r3, .L4+48
	strh	r2, [r4]	@ movhi
	strh	r3, [r4, #8]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	TPCollected
	.word	vOff
	.word	hOff
	.word	playerHoff
	.word	lost
	.word	won
	.word	playerHealth
	.word	DMANow
	.word	MenuBackgroundPal
	.word	MenuBackgroundTiles
	.word	100712448
	.word	MenuBackgroundMap
	.word	22656
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
	ldr	r4, .L16
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L16+4
	mov	lr, pc
	bx	r4
	mov	r3, #1664
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
	mov	r2, #3
	ldr	r3, .L16+40
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
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
	ldr	r4, .L20
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L20+4
	mov	lr, pc
	bx	r4
	mov	r3, #1104
	mov	r0, #3
	ldr	r2, .L20+8
	ldr	r1, .L20+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L20+16
	mov	r3, #1024
	ldr	r2, .L20+20
	mov	lr, pc
	bx	r4
	mov	r5, #512
	mov	r3, #67108864
	ldr	r2, .L20+24
	strh	r5, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r3, .L20+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+32
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L20+36
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L20+40
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L21:
	.align	2
.L20:
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
	ldr	r3, .L29
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L29+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L22
	ldr	r3, .L29+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L28
.L22:
	pop	{r4, lr}
	bx	lr
.L28:
	pop	{r4, lr}
	b	goToMenu
.L30:
	.align	2
.L29:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
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
	ldr	r4, .L33
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L33+4
	mov	lr, pc
	bx	r4
	mov	r3, #720
	mov	r0, #3
	ldr	r2, .L33+8
	ldr	r1, .L33+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L33+16
	mov	r3, #1024
	ldr	r2, .L33+20
	mov	lr, pc
	bx	r4
	mov	r5, #512
	mov	r3, #67108864
	ldr	r2, .L33+24
	strh	r5, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r3, .L33+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L33+32
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L33+36
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L33+40
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L34:
	.align	2
.L33:
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
	ldr	r4, .L38
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L38+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L38+8
	ldr	r1, .L38+12
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L38+16
	ldr	r1, .L38+20
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r3, #4352
	mov	r1, #23552
	strh	r3, [r2]	@ movhi
	ldr	r3, .L38+24
	strh	r1, [r2, #8]	@ movhi
	ldrh	r1, [r3]
	ldr	r3, .L38+28
	strh	r1, [r2, #18]	@ movhi
	ldrh	r1, [r3]
	mov	r0, #3
	strh	r1, [r2, #16]	@ movhi
	mov	r3, #256
	ldr	r2, .L38+32
	ldr	r1, .L38+36
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L38+40
	ldr	r1, .L38+44
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L38+48
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L38+52
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L38+56
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L39:
	.align	2
.L38:
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
	push	{r4, lr}
	bl	initialize
	ldr	r2, .L52
	ldr	r3, [r2]
	ldr	r4, .L52+4
	add	r3, r3, #1
	ldr	r1, .L52+8
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L41
	ldr	r2, .L52+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L50
.L41:
	tst	r3, #1
	beq	.L40
	ldr	r3, .L52+12
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L51
.L40:
	pop	{r4, lr}
	bx	lr
.L51:
	pop	{r4, lr}
	b	goToInstructions
.L50:
	ldr	r3, .L52+16
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L41
.L53:
	.align	2
.L52:
	.word	seed
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
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
	ldr	r4, .L66
	ldr	r3, .L66+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L55
	ldr	r2, .L66+8
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L64
.L55:
	tst	r3, #8
	beq	.L54
	ldr	r3, .L66+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L65
.L54:
	pop	{r4, lr}
	bx	lr
.L65:
	ldr	r2, .L66+12
	ldr	r3, .L66+16
	ldr	r0, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L66+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L64:
	bl	goToMenu
	ldrh	r3, [r4]
	b	.L55
.L67:
	.align	2
.L66:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	seed
	.word	srand
	.word	initGame
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
	ldr	r3, .L80
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L80+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L69
	ldr	r2, .L80+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L78
.L69:
	tst	r3, #4
	beq	.L68
	ldr	r3, .L80+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L79
.L68:
	pop	{r4, lr}
	bx	lr
.L78:
	pop	{r4, lr}
	b	goToGame
.L79:
	pop	{r4, lr}
	b	goToMenu
.L81:
	.align	2
.L80:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
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
	ldr	r3, .L99
	mov	lr, pc
	bx	r3
	ldr	r3, .L99+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L99+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L99+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L99+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L99+20
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L96
.L83:
	ldr	r3, .L99+24
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L97
.L84:
	ldr	r3, .L99+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L82
	ldr	r3, .L99+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L98
.L82:
	pop	{r4, lr}
	bx	lr
.L97:
	bl	goToLose
	b	.L84
.L96:
	bl	goToWin
	b	.L83
.L98:
	pop	{r4, lr}
	b	gotoPause
.L100:
	.align	2
.L99:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	won
	.word	lost
	.word	oldButtons
	.word	buttons
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
	ldr	r6, .L113
	ldr	r8, .L113+4
	ldr	r5, .L113+8
	ldr	fp, .L113+12
	ldr	r10, .L113+16
	ldr	r9, .L113+20
	ldr	r7, .L113+24
	ldr	r4, .L113+28
.L102:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L103:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L103
.L105:
	.word	.L109
	.word	.L108
	.word	.L107
	.word	.L106
	.word	.L104
	.word	.L104
.L104:
	mov	lr, pc
	bx	r7
	b	.L102
.L106:
	ldr	r3, .L113+32
	mov	lr, pc
	bx	r3
	b	.L102
.L107:
	mov	lr, pc
	bx	r9
	b	.L102
.L108:
	mov	lr, pc
	bx	r10
	b	.L102
.L109:
	mov	lr, pc
	bx	fp
	b	.L102
.L114:
	.align	2
.L113:
	.word	state
	.word	buttons
	.word	oldButtons
	.word	menu
	.word	instructions
	.word	game
	.word	lose
	.word	67109120
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
	.comm	totalPaper,4,4
	.comm	screenBlock,4,4
	.comm	playerHoff,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
