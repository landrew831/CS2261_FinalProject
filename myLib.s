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
	.file	"myLib.c"
	.text
	.align	2
	.global	waitForVBlank
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L2:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L2
	mov	r2, #67108864
.L4:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L4
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	flipPage
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r3, [r3, #0]
	tst	r3, #16
	movne	r2, #100663296
	ldreq	r2, .L11
	ldrne	r1, .L11
	addne	r2, r2, #40960
	moveq	r1, #100663296
	strne	r2, [r1, #0]
	streq	r1, [r2, #0]
	eor	r3, r3, #16
	mov	r2, #67108864
	strh	r3, [r2, #0]	@ movhi
	bx	lr
.L12:
	.align	2
.L11:
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.align	2
	.global	DMANow
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L14
	stmfd	sp!, {r4, r5}
	ldr	ip, [ip, #4]
	add	r0, r0, r0, asl #1
	add	r4, ip, r0, asl #2
	orr	r3, r3, #-2147483648
	mov	r5, #0
	str	r5, [r4, #8]
	str	r1, [ip, r0, asl #2]
	str	r2, [r4, #4]
	str	r3, [r4, #8]
	ldmfd	sp!, {r4, r5}
	bx	lr
.L15:
	.align	2
.L14:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	loadPalette
	.type	loadPalette, %function
loadPalette:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, r0
	mov	r2, #83886080
	mov	r0, #3
	mov	r3, #256
	b	DMANow
	.size	loadPalette, .-loadPalette
	.align	2
	.global	collision
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5}
	ldr	ip, [sp, #8]
	ldr	r5, [sp, #16]
	sub	r4, ip, #1
	add	r4, r4, r5
	cmp	r4, r0
	ldr	r4, [sp, #12]
	ble	.L21
	sub	r0, r0, #1
	add	r2, r0, r2
	cmp	ip, r2
	blt	.L22
.L21:
	mov	r0, #0
.L18:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L22:
	ldr	r2, [sp, #20]
	sub	r0, r4, #1
	add	r2, r0, r2
	cmp	r2, r1
	ble	.L21
	sub	r0, r1, #1
	add	r0, r0, r3
	cmp	r4, r0
	movge	r0, #0
	movlt	r0, #1
	b	.L18
	.size	collision, .-collision
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L26
	mov	r3, #0
.L24:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L24
	bx	lr
.L27:
	.align	2
.L26:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r2, #1264
	mov	r3, #67108864
	sub	r2, r2, #1
	mov	r1, #128	@ movhi
	strh	r1, [r3, #132]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	mov	r2, #0	@ movhi
	strh	r2, [r3, #128]	@ movhi
	bx	lr
	.size	setupSounds, .-setupSounds
	.global	__aeabi_idiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L30+8
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	ip, [ip, #4]
	mov	r7, r0
	add	ip, ip, #12
	mov	r5, #0
	mov	r4, #67108864
	mov	r6, r2
	mov	r8, r1
	add	r2, r4, #160
	str	r5, [ip, #8]
	add	fp, r4, #256
	mov	r1, r7
	mov	r9, r3
	mov	r0, #1
	mov	r3, #910163968
	bl	DMANow
	mov	r1, r6
	ldr	r3, .L30+12
	mov	r0, #16777216
	strh	r5, [fp, #2]	@ movhi
	mov	lr, pc
	bx	r3
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	r4, .L30+16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #0]	@ movhi
	mov	r3, #128	@ movhi
	str	r7, [r4, #0]
	ldr	sl, .L30+20
	strh	r3, [fp, #2]	@ movhi
	mov	r0, r8
	str	r8, [r4, #4]
	str	r6, [r4, #8]
	mov	lr, pc
	bx	sl
	adr	r3, .L30
	ldmia	r3, {r2-r3}
	ldr	ip, .L30+24
	mov	lr, pc
	bx	ip
	mov	r7, r0
	mov	r0, r6
	mov	r8, r1
	mov	lr, pc
	bx	sl
	ldr	ip, .L30+28
	mov	r2, r0
	mov	r3, r1
	mov	r0, r7
	mov	r1, r8
	mov	lr, pc
	bx	ip
	ldr	r3, .L30+32
	mov	lr, pc
	bx	r3
	mov	r3, #1
	str	r0, [r4, #20]
	str	r5, [r4, #28]
	str	r3, [r4, #12]
	str	r9, [r4, #16]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L31:
	.align	3
.L30:
	.word	1443109011
	.word	1078844686
	.word	.LANCHOR0
	.word	__aeabi_idiv
	.word	soundA
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L33+8
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	ip, [ip, #4]
	mov	r7, r0
	add	ip, ip, #24
	mov	r5, #0
	mov	r4, #67108864
	mov	r6, r2
	mov	r8, r1
	add	r2, r4, #164
	str	r5, [ip, #8]
	add	fp, r4, #256
	mov	r1, r7
	mov	r9, r3
	mov	r0, #2
	mov	r3, #910163968
	bl	DMANow
	mov	r1, r6
	ldr	r3, .L33+12
	mov	r0, #16777216
	strh	r5, [fp, #6]	@ movhi
	mov	lr, pc
	bx	r3
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	r4, .L33+16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #4]	@ movhi
	mov	r3, #128	@ movhi
	str	r7, [r4, #0]
	ldr	sl, .L33+20
	strh	r3, [fp, #6]	@ movhi
	mov	r0, r8
	str	r8, [r4, #4]
	str	r6, [r4, #8]
	mov	lr, pc
	bx	sl
	adr	r3, .L33
	ldmia	r3, {r2-r3}
	ldr	ip, .L33+24
	mov	lr, pc
	bx	ip
	mov	r7, r0
	mov	r0, r6
	mov	r8, r1
	mov	lr, pc
	bx	sl
	ldr	ip, .L33+28
	mov	r2, r0
	mov	r3, r1
	mov	r0, r7
	mov	r1, r8
	mov	lr, pc
	bx	ip
	ldr	r3, .L33+32
	mov	lr, pc
	bx	r3
	mov	r3, #1
	str	r0, [r4, #20]
	str	r5, [r4, #28]
	str	r3, [r4, #12]
	str	r9, [r4, #16]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L34:
	.align	3
.L33:
	.word	1443109011
	.word	1078844686
	.word	.LANCHOR0
	.word	__aeabi_idiv
	.word	soundB
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r3, #67108864
	add	r3, r3, #512
	ldrh	r2, [r3, #2]
	tst	r2, #1
	mov	r2, #0	@ movhi
	strh	r2, [r3, #8]	@ movhi
	beq	.L36
	ldr	r2, .L45
	ldr	r3, [r2, #12]
	cmp	r3, #0
	beq	.L37
	ldr	r3, [r2, #28]
	ldr	r1, [r2, #20]
	add	r3, r3, #1
	cmp	r3, r1
	str	r3, [r2, #28]
	beq	.L41
.L37:
	ldr	r2, .L45+4
	ldr	r3, [r2, #12]
	cmp	r3, #0
	bne	.L42
.L39:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #2]	@ movhi
.L36:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r3, lr}
	bx	lr
.L42:
	ldr	r3, [r2, #28]
	ldr	r1, [r2, #20]
	add	r3, r3, #1
	cmp	r3, r1
	str	r3, [r2, #28]
	bne	.L39
	ldr	r3, [r2, #16]
	cmp	r3, #0
	bne	.L43
	ldr	r1, .L45+8
	ldr	r0, [r1, #4]
	mov	r1, #67108864
	add	r0, r0, #24
	add	r1, r1, #256
	str	r3, [r2, #12]
	str	r3, [r0, #8]
	strh	r3, [r1, #6]	@ movhi
	b	.L39
.L41:
	ldr	r3, [r2, #16]
	cmp	r3, #0
	bne	.L44
	ldr	r1, .L45+8
	ldr	r0, [r1, #4]
	mov	r1, #67108864
	add	r0, r0, #12
	add	r1, r1, #256
	str	r3, [r2, #12]
	str	r3, [r0, #8]
	strh	r3, [r1, #2]	@ movhi
	b	.L37
.L44:
	ldmia	r2, {r0, r1, r2}	@ phole ldm
	bl	playSoundA
	b	.L37
.L43:
	ldmia	r2, {r0, r1, r2}	@ phole ldm
	bl	playSoundB
	b	.L39
.L46:
	.align	2
.L45:
	.word	soundA
	.word	soundB
	.word	.LANCHOR0
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	add	r3, r2, #512
	str	r4, [sp, #-4]!
	ldrh	r0, [r2, #4]
	ldrh	ip, [r3, #0]
	mov	r1, #50331648
	ldr	r4, .L48
	add	r1, r1, #28672
	orr	ip, ip, #1
	orr	r0, r0, #8
	str	r4, [r1, #4092]
	strh	ip, [r3, #0]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r4}
	bx	lr
.L49:
	.align	2
.L48:
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	pauseSound
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L53
	ldr	r2, [r3, #12]
	cmp	r2, #0
	movne	r1, #0
	strne	r1, [r3, #12]
	movne	r2, #67108864
	ldr	r3, .L53+4
	addne	r2, r2, #256
	strneh	r1, [r2, #2]	@ movhi
	ldr	r2, [r3, #12]
	cmp	r2, #0
	movne	r2, #67108864
	movne	r1, #0
	addne	r2, r2, #256
	strne	r1, [r3, #12]
	strneh	r1, [r2, #6]	@ movhi
	bx	lr
.L54:
	.align	2
.L53:
	.word	soundA
	.word	soundB
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L58
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L56
	mov	r2, #67108864
	mov	r1, #1
	str	r1, [r3, #12]
	add	r2, r2, #256
	mov	r3, #128	@ movhi
	strh	r3, [r2, #2]	@ movhi
.L56:
	ldr	r3, .L58+4
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bxne	lr
	mov	r2, #67108864
	mov	r1, #1
	str	r1, [r3, #12]
	add	r2, r2, #256
	mov	r3, #128	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L59:
	.align	2
.L58:
	.word	soundA
	.word	soundB
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L63
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L61
	ldr	r2, .L63+4
	ldr	r0, [r2, #4]
	mov	r2, #67108864
	mov	r1, #0
	add	r0, r0, #12
	add	r2, r2, #256
	str	r1, [r3, #12]
	str	r1, [r0, #8]
	strh	r1, [r2, #2]	@ movhi
.L61:
	ldr	r3, .L63+8
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bxeq	lr
	ldr	r2, .L63+4
	ldr	r0, [r2, #4]
	mov	r2, #67108864
	mov	r1, #0
	add	r0, r0, #24
	add	r2, r2, #256
	str	r1, [r3, #12]
	str	r1, [r0, #8]
	strh	r1, [r2, #6]	@ movhi
	bx	lr
.L64:
	.align	2
.L63:
	.word	soundA
	.word	.LANCHOR0
	.word	soundB
	.size	stopSound, .-stopSound
	.global	videoBuffer
	.global	dma
	.comm	soundA,32,4
	.comm	soundB,32,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.ident	"GCC: (devkitARM release 31) 4.5.0"
