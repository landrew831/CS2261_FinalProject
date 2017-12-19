	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1163264
	mov	r2, #11008
	stmfd	sp!, {r4, r5, r6, lr}
	add	r1, r1, #13312
	add	r2, r2, #17
	ldr	ip, .L2
	mov	r3, #1
	ldr	r0, .L2+4
	mov	lr, pc
	bx	ip
	mov	r6, #67108864
	mov	r3, #4864	@ movhi
	ldr	r0, .L2+8
	strh	r3, [r6, #0]	@ movhi
	ldr	r3, .L2+12
	mov	lr, pc
	bx	r3
	mov	ip, #7680	@ movhi
	ldr	r4, .L2+16
	strh	ip, [r6, #8]	@ movhi
	mov	r5, #100663296
	mov	r0, #3
	ldr	r1, .L2+20
	mov	r2, #100663296
	mov	r3, #1312
	mov	lr, pc
	bx	r4
	add	r2, r5, #61440
	mov	r0, #3
	ldr	r1, .L2+24
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	ip, #7936
	add	ip, ip, #4
	strh	ip, [r6, #10]	@ movhi
	add	r2, r5, #16384
	mov	r0, #3
	ldr	r1, .L2+28
	mov	r3, #8960
	mov	lr, pc
	bx	r4
	add	r2, r5, #63488
	mov	r0, #3
	ldr	r1, .L2+32
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L2+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L2+40
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L2+44
	mov	lr, pc
	bx	r4
	ldr	r2, .L2+48
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, .L2+52
	str	r3, [r2, #0]
	ldr	r2, .L2+56
	str	r3, [r2, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	playSoundA
	.word	FUNsong
	.word	StartScreenPal
	.word	loadPalette
	.word	DMANow
	.word	BubblesTiles
	.word	BubblesMap
	.word	StartScreenTiles
	.word	StartScreenMap
	.word	waitForVBlank
	.word	hideSprites
	.word	shadowOAM
	.word	cheat
	.word	seed
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r0, #4864	@ movhi
	add	r3, r2, #256
	stmfd	sp!, {r4, lr}
	ldrh	r1, [r3, #48]
	strh	r0, [r2, #0]	@ movhi
	ldr	r2, .L5
	mov	r3, #0
	strh	r3, [r2, #0]	@ movhi
	ldr	r2, .L5+4
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, .L5+8
	strh	r1, [r3, #0]	@ movhi
	ldr	r3, .L5+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L5+16
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L6:
	.align	2
.L5:
	.word	hOff
	.word	vOff
	.word	buttons
	.word	setupSounds
	.word	setupInterrupts
	.size	initialize, .-initialize
	.align	2
	.global	goToInstruction
	.type	goToInstruction, %function
goToInstruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #385024
	mov	r2, #11008
	stmfd	sp!, {r3, r4, r5, lr}
	add	r1, r1, #2048
	add	r2, r2, #17
	ldr	ip, .L8
	mov	r3, #1
	ldr	r0, .L8+4
	mov	lr, pc
	bx	ip
	ldr	r0, .L8+8
	ldr	r3, .L8+12
	mov	lr, pc
	bx	r3
	mov	ip, #7680
	add	ip, ip, #4
	mov	lr, #67108864
	mov	r5, #100663296
	mov	r3, #9024
	strh	ip, [lr, #8]	@ movhi
	ldr	r4, .L8+16
	mov	r0, #3
	ldr	r1, .L8+20
	add	r2, r5, #16384
	add	r3, r3, #16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L8+24
	add	r2, r5, #61440
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+32
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L8+36
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+40
	mov	r2, #1
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	playSoundA
	.word	Technique
	.word	InstructionScreenPal
	.word	loadPalette
	.word	DMANow
	.word	InstructionScreenTiles
	.word	InstructionScreenMap
	.word	waitForVBlank
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToInstruction, .-goToInstruction
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L15
	ldrh	r3, [r4, #0]
	add	r3, r3, #1
	mov	r3, r3, asl #16
	ldr	r1, .L15+4
	mov	r3, r3, lsr #16
	umull	r2, r1, r3, r1
	ldr	r2, .L15+8
	ldr	r0, [r2, #0]
	mov	r1, r1, lsr #1
	add	r0, r0, #1
	mov	r5, #67108864
	strh	r3, [r4, #0]	@ movhi
	str	r0, [r2, #0]
	ldr	r3, .L15+12
	strh	r1, [r5, #18]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L15+16
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L11
	ldr	r2, .L15+20
	ldrh	r2, [r2, #0]
	ands	r2, r2, #8
	beq	.L14
.L11:
	tst	r3, #4
	beq	.L10
	ldr	r3, .L15+20
	ldrh	r3, [r3, #0]
	tst	r3, #4
	ldreq	r3, .L15+24
	moveq	r2, #1
	streq	r2, [r3, #0]
.L10:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L14:
	strh	r2, [r4, #0]	@ movhi
	strh	r2, [r5, #18]	@ movhi
	ldmfd	sp!, {r4, r5, r6, lr}
	b	goToInstruction
.L16:
	.align	2
.L15:
	.word	vOff
	.word	-1431655765
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	cheat
	.size	start, .-start
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r0, .L18
	mov	r6, #100663296
	ldr	r3, .L18+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L18+8
	mov	r0, #3
	ldr	r1, .L18+12
	mov	r2, r6
	mov	r3, #256
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L18+16
	add	r2, r6, #55296
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r5, #67108864
	mov	ip, #6912	@ movhi
	mov	r0, #3
	ldr	r1, .L18+20
	add	r2, r6, #16384
	mov	r3, #960
	strh	ip, [r5, #8]	@ movhi
	mov	lr, pc
	bx	r4
	add	r2, r6, #57344
	mov	r3, #4096
	mov	r0, #3
	ldr	r1, .L18+24
	mov	lr, pc
	bx	r4
	mvn	r3, #9152
	sub	r3, r3, #59
	strh	r3, [r5, #10]	@ movhi
	ldr	r3, .L18+28
	mov	r2, #2
	str	r2, [r3, #0]
	mov	r3, #13120	@ movhi
	strh	r3, [r5, #80]	@ movhi
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	bgPal
	.word	loadPalette
	.word	DMANow
	.word	UITiles
	.word	UIMap
	.word	bgTiles
	.word	bgMap
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	instruction
	.type	instruction, %function
instruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L27
	stmfd	sp!, {r4, r5, r6, lr}
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #64
	beq	.L21
	ldr	r4, .L27+4
	ldrh	r2, [r4, #0]
.L22:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L23
	cmp	r2, #95
	addls	r2, r2, #1
	movls	r2, r2, asl #16
	movls	r2, r2, lsr #16
	strlsh	r2, [r4, #0]	@ movhi
.L23:
	ldr	r3, .L27+8
	ldrh	r3, [r3, #0]
	mov	r5, #67108864
	tst	r3, #8
	strh	r2, [r5, #18]	@ movhi
	beq	.L20
	ldr	r3, .L27+12
	ldrh	r6, [r3, #0]
	ands	r6, r6, #8
	beq	.L26
.L20:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L21:
	ldr	r4, .L27+4
	ldrh	r2, [r4, #0]
	cmp	r2, #0
	subne	r2, r2, #1
	movne	r2, r2, asl #16
	movne	r2, r2, lsr #16
	strneh	r2, [r4, #0]	@ movhi
	b	.L22
.L26:
	ldr	r3, .L27+16
	ldr	r0, [r3, #0]
	ldr	r3, .L27+20
	mov	lr, pc
	bx	r3
	ldr	ip, .L27+24
	mov	r1, #1392640
	mov	r2, #11008
	strh	r6, [ip, #0]	@ movhi
	strh	r6, [r4, #0]	@ movhi
	ldr	r0, .L27+28
	add	r1, r1, #6464
	add	r2, r2, #17
	mov	r3, #1
	strh	r6, [r5, #18]	@ movhi
	ldr	ip, .L27+32
	strh	r6, [r5, #16]	@ movhi
	mov	lr, pc
	bx	ip
	bl	goToGame
	ldr	r3, .L27+36
	mov	lr, pc
	bx	r3
	b	.L20
.L28:
	.align	2
.L27:
	.word	waitForVBlank
	.word	vOff
	.word	oldButtons
	.word	buttons
	.word	seed
	.word	srand
	.word	hOff
	.word	Tomfoolery
	.word	playSoundA
	.word	initGame
	.size	instruction, .-instruction
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r0, .L30
	ldr	r3, .L30+4
	mov	lr, pc
	bx	r3
	mov	r3, #8576
	ldr	r5, .L30+8
	mov	r0, #3
	ldr	r1, .L30+12
	mov	r2, #100663296
	add	r3, r3, #48
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L30+16
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	mov	r4, #67108864
	mov	r3, #7936	@ movhi
	strh	r3, [r4, #8]	@ movhi
	ldr	r3, .L30+20
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L30+24
	mov	r3, #512
	mov	lr, pc
	bx	r5
	mov	r3, #0
	strh	r3, [r4, #80]	@ movhi
	strh	r3, [r4, #82]	@ movhi
	ldr	r3, .L30+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+32
	mov	r2, #3
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	PauseScreenPal
	.word	loadPalette
	.word	DMANow
	.word	PauseScreenTiles
	.word	PauseScreenMap
	.word	hideSprites
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L37
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L37+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L33
	ldr	r2, .L37+8
	ldrh	r2, [r2, #0]
	tst	r2, #8
	beq	.L35
.L33:
	tst	r3, #4
	beq	.L32
	ldr	r3, .L37+8
	ldrh	r3, [r3, #0]
	ands	r3, r3, #4
	beq	.L36
.L32:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L36:
	ldr	r1, .L37+12
	mov	r2, #67108864
	strh	r3, [r2, #20]	@ movhi
	strh	r3, [r1, #0]	@ movhi
	ldr	r1, .L37+16
	strh	r3, [r2, #22]	@ movhi
	strh	r3, [r1, #0]	@ movhi
	strh	r3, [r2, #16]	@ movhi
	strh	r3, [r2, #18]	@ movhi
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L35:
	ldr	r3, .L37+20
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	goToGame
.L38:
	.align	2
.L37:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	vOff
	.word	hOff
	.word	unpauseSound
	.size	pause, .-pause
	.align	2
	.global	goToEnd
	.type	goToEnd, %function
goToEnd:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, .L40
	mov	lr, pc
	bx	r3
	mov	r1, #259072
	mov	r2, #11008
	ldr	ip, .L40+4
	add	r1, r1, #704
	add	r2, r2, #17
	mov	r3, #1
	ldr	r0, .L40+8
	mov	lr, pc
	bx	ip
	mov	r6, #100663296
	ldr	r0, .L40+12
	ldr	r3, .L40+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L40+20
	mov	r0, #3
	ldr	r1, .L40+24
	mov	r2, r6
	mov	r3, #432
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L40+28
	add	r2, r6, #59392
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r5, #67108864
	mov	ip, #7424	@ movhi
	strh	ip, [r5, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L40+32
	add	r2, r6, #16384
	mov	r3, #15232
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L40+36
	add	r2, r6, #61440
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	mov	r3, #24064
	add	r3, r3, #4
	strh	r3, [r5, #10]	@ movhi
	ldr	r3, .L40+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+44
	ldr	ip, .L40+48
	ldr	r2, [r3, #0]
	mov	r0, #66
	mov	r1, #136
	mov	r3, #120
	mov	lr, pc
	bx	ip
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L40+52
	mov	r3, #512
	mov	lr, pc
	bx	r4
	mov	r3, #0
	strh	r3, [r5, #80]	@ movhi
	strh	r3, [r5, #82]	@ movhi
	ldr	r3, .L40+56
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+60
	mov	r2, #4
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	stopSound
	.word	playSoundA
	.word	FishtankBubbles
	.word	EndScreenPal
	.word	loadPalette
	.word	DMANow
	.word	EndUITiles
	.word	EndUIMap
	.word	EndScreenTiles
	.word	EndScreenMap
	.word	hideSprites
	.word	score
	.word	drawNumber
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.size	goToEnd, .-goToEnd
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L47
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+12
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L43
	ldr	r3, .L47+16
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L45
.L43:
	ldr	r3, .L47+20
	ldr	r3, [r3, #0]
	cmp	r3, #0
	ble	.L46
	ldmfd	sp!, {r4, lr}
	bx	lr
.L45:
	ldr	r3, .L47+24
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	goToPause
.L46:
	ldr	r2, .L47+28
	mov	r1, #0	@ movhi
	mov	r3, #67108864
	strh	r1, [r3, #20]	@ movhi
	strh	r1, [r2, #0]	@ movhi
	ldr	r2, .L47+32
	strh	r1, [r3, #22]	@ movhi
	strh	r1, [r2, #0]	@ movhi
	strh	r1, [r3, #16]	@ movhi
	strh	r1, [r3, #18]	@ movhi
	ldmfd	sp!, {r4, lr}
	b	goToEnd
.L48:
	.align	2
.L47:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	time
	.word	pauseSound
	.word	vOff
	.word	hOff
	.size	game, .-game
	.align	2
	.global	end
	.type	end, %function
end:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L52
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+4
	ldrh	r2, [r3, #0]
	add	r2, r2, #1
	mov	r2, r2, asl #16
	ldr	r0, .L52+8
	mov	r2, r2, lsr #16
	umull	r1, r0, r2, r0
	ldr	r1, .L52+12
	ldrh	ip, [r1, #0]
	mov	r0, r0, lsr #1
	mov	r1, #67108864
	tst	ip, #8
	strh	r2, [r3, #0]	@ movhi
	strh	r0, [r1, #20]	@ movhi
	beq	.L49
	ldr	r2, .L52+16
	ldrh	r2, [r2, #0]
	ands	r2, r2, #8
	beq	.L51
.L49:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L51:
	ldr	r0, .L52+20
	strh	r2, [r1, #20]	@ movhi
	strh	r2, [r0, #0]	@ movhi
	strh	r2, [r1, #22]	@ movhi
	strh	r2, [r3, #0]	@ movhi
	strh	r2, [r1, #16]	@ movhi
	strh	r2, [r1, #18]	@ movhi
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L53:
	.align	2
.L52:
	.word	waitForVBlank
	.word	hOff
	.word	-1431655765
	.word	oldButtons
	.word	buttons
	.word	vOff
	.size	end, .-end
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bl	initialize
	mov	r5, #67108864
	ldr	r4, .L66
	ldr	r7, .L66+4
	ldr	r6, .L66+8
	add	r5, r5, #256
.L65:
	ldrh	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L56:
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L56
.L62:
	.word	.L57
	.word	.L58
	.word	.L59
	.word	.L60
	.word	.L61
.L61:
	bl	end
	b	.L65
.L60:
	bl	pause
	b	.L65
.L59:
	bl	game
	b	.L65
.L58:
	bl	instruction
	b	.L65
.L57:
	bl	start
	b	.L65
.L67:
	.align	2
.L66:
	.word	buttons
	.word	state
	.word	oldButtons
	.size	main, .-main
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	cheat,4,4
	.comm	vOff,2,2
	.comm	hOff,2,2
	.comm	state,4,4
	.comm	seed,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
