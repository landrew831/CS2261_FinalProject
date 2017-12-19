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
	.file	"game.c"
	.text
	.align	2
	.global	initPlayer
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	ldr	r3, .L2
	mov	r4, #2
	mov	r1, #280
	add	r1, r1, r4
	mov	r2, #0
	mov	ip, #32
	mov	r0, #3
	str	r1, [r3, #0]
	mov	r1, #242
	str	r4, [r3, #16]
	str	r4, [r3, #20]
	str	ip, [r3, #24]
	str	ip, [r3, #28]
	str	r1, [r3, #4]
	str	r2, [r3, #32]
	str	r0, [r3, #36]
	str	r2, [r3, #44]
	str	r0, [r3, #48]
	str	r2, [r3, #60]
	ldmfd	sp!, {r4}
	bx	lr
.L3:
	.align	2
.L2:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	animatePlayer
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L24
	str	r4, [sp, #-4]!
	ldr	r2, [r3, #36]
	cmp	r2, #4
	strne	r2, [r3, #40]
	movne	r2, #5
	strne	r2, [r3, #36]
	mov	r2, #67108864
	add	r2, r2, #256
	ldrh	r2, [r2, #48]
	tst	r2, #64
	moveq	r2, #2
	streq	r2, [r3, #36]
	moveq	r2, #3
	streq	r2, [r3, #48]
	mov	r2, #67108864
	add	r2, r2, #256
	ldrh	r2, [r2, #48]
	tst	r2, #128
	moveq	r2, #3
	streq	r2, [r3, #36]
	streq	r2, [r3, #48]
	mov	r2, #67108864
	add	r2, r2, #256
	ldrh	r2, [r2, #48]
	tst	r2, #32
	moveq	r2, #1
	streq	r2, [r3, #36]
	moveq	r2, #3
	streq	r2, [r3, #48]
	mov	r2, #67108864
	add	r2, r2, #256
	ldrh	r2, [r2, #48]
	ands	r2, r2, #16
	streq	r2, [r3, #36]
	moveq	r2, #3
	streq	r2, [r3, #48]
	ldr	r2, .L24+4
	ldrh	r2, [r2, #0]
	tst	r2, #1
	beq	.L21
	ldr	r2, .L24+8
	ldrh	r2, [r2, #0]
	ands	r2, r2, #1
	bne	.L21
	mov	r1, #4
	str	r1, [r3, #36]
	str	r1, [r3, #48]
	str	r2, [r3, #44]
.L13:
	ldr	r2, [r3, #32]
	ldr	r1, .L24+12
	smull	r0, r1, r2, r1
	sub	r1, r1, r2, asr #31
	add	r1, r1, r1, asl #1
	subs	r2, r2, r1, asl #1
	ldr	r0, .L24
	bne	.L19
	ldr	r1, [r0, #44]
	cmp	r1, #2
	addle	r1, r1, #1
	strle	r1, [r0, #44]
	ble	.L19
	ldr	r1, [r0, #40]
	str	r2, [r0, #44]
	mov	r2, #3
	str	r1, [r0, #36]
	str	r2, [r0, #48]
.L17:
	cmp	r1, #5
	beq	.L23
.L19:
	ldr	r2, [r3, #32]
	add	r2, r2, #1
	str	r2, [r3, #32]
.L4:
	ldmfd	sp!, {r4}
	bx	lr
.L21:
	ldr	r1, [r3, #36]
	cmp	r1, #4
	beq	.L13
	ldr	r2, [r3, #44]
	cmp	r2, #2
	ldrgt	r2, .L24
	movgt	r0, #0
	strgt	r0, [r2, #44]
	ldr	r2, [r3, #32]
	ldr	r0, .L24+12
	smull	r4, r0, r2, r0
	mov	ip, r2, asr #31
	rsb	r0, ip, r0, asr #1
	add	r0, r0, r0, asl #1
	cmp	r2, r0, asl #2
	ldr	r2, .L24
	bne	.L17
	ldr	r0, [r2, #44]
	ldr	ip, .L24+16
	add	r0, r0, #1
	smull	r4, ip, r0, ip
	sub	ip, ip, r0, asr #31
	add	ip, ip, ip, asl #1
	rsb	r0, ip, r0
	cmp	r1, #5
	mov	ip, #3
	str	ip, [r2, #48]
	str	r0, [r2, #44]
	bne	.L19
.L23:
	ldr	r2, [r3, #40]
	mov	r1, #0
	str	r1, [r3, #44]
	str	r2, [r3, #36]
	b	.L4
.L25:
	.align	2
.L24:
	.word	player
	.word	oldButtons
	.word	buttons
	.word	715827883
	.word	1431655766
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	drawPlayer
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L30
	stmfd	sp!, {r4, r5}
	ldr	r2, [r3, #64]
	cmp	r2, #0
	bne	.L29
	ldr	ip, [r3, #12]
	ldr	r2, [r3, #60]
	ldr	r5, [r3, #44]
	ldr	r0, [r3, #36]
	ldr	r1, .L30+4
	mov	ip, ip, asl #23
	mov	r2, r2, asl #3
	ldrb	r4, [r3, #8]	@ zero_extendqisi2
	mvn	ip, ip, lsr #6
	add	r0, r0, r5, asl #5
	add	r3, r1, r2
	mvn	ip, ip, lsr #17
	mov	r0, r0, asl #2
	strh	r4, [r1, r2]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	strh	r0, [r3, #4]	@ movhi
.L26:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L29:
	ldr	r3, [r3, #60]
	ldr	r2, .L30+4
	mov	r3, r3, asl #3
	ldrh	r1, [r2, r3]
	orr	r1, r1, #512
	strh	r1, [r2, r3]	@ movhi
	b	.L26
.L31:
	.align	2
.L30:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.global	__aeabi_idivmod
	.align	2
	.global	initJellyfish
	.type	initJellyfish, %function
initJellyfish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r7, #0
	ldr	r6, .L43
	ldr	r4, .L43+4
	ldr	fp, .L43+8
	sub	sp, sp, #12
	mov	sl, #1
	mov	r9, #16
	mov	r8, r7
.L37:
	str	sl, [r6, #-16]
	str	sl, [r6, #-12]
	str	r9, [r6, #-8]
	str	r9, [r6, #-4]
	mov	lr, pc
	bx	r4
	ldr	r1, [r6, #-4]
	rsb	r1, r1, #512
	mov	lr, pc
	bx	fp
	mov	r5, r1
	mov	lr, pc
	bx	r4
	ldr	r1, [r6, #-8]
	rsb	r1, r1, #512
	mov	lr, pc
	bx	fp
	sub	r3, r5, #225
	cmp	r3, #54
	bhi	.L33
.L39:
	str	r1, [sp, #4]
	mov	lr, pc
	bx	r4
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #23
	add	r5, r0, r3
	mov	r5, r5, asl #23
	rsb	r5, r3, r5, lsr #23
	sub	r3, r5, #225
	cmp	r3, #54
	ldr	r1, [sp, #4]
	bls	.L39
.L33:
	sub	r3, r1, #217
	cmp	r3, #77
	str	r5, [r6, #-32]
	bhi	.L35
.L38:
	mov	lr, pc
	bx	r4
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #23
	add	r1, r0, r3
	mov	r1, r1, asl #23
	rsb	r1, r3, r1, lsr #23
	sub	r3, r1, #217
	cmp	r3, #77
	bls	.L38
.L35:
	mov	r3, #3
	add	r7, r7, #1
	str	r3, [r6, #16]
	str	r1, [r6, #-28]
	str	r8, [r6, #0]
	str	r8, [r6, #12]
	str	sl, [r6, #20]
	str	r8, [r6, #24]
	str	r7, [r6, #28]
	str	r8, [r6, #32]
	mov	lr, pc
	bx	r4
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #30
	add	r0, r0, r3
	and	r0, r0, #3
	rsb	r3, r3, r0
	cmp	r7, #10
	str	r3, [r6, #36]
	add	r6, r6, #72
	bne	.L37
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L44:
	.align	2
.L43:
	.word	jellyfishes+32
	.word	rand
	.word	__aeabi_idivmod
	.size	initJellyfish, .-initJellyfish
	.align	2
	.global	animateJellyfish
	.type	animateJellyfish, %function
animateJellyfish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r4, [r0, #32]
	ldr	r3, .L47
	smull	r2, r3, r4, r3
	mov	r2, r4, asr #31
	rsb	r3, r2, r3, asr #3
	add	r3, r3, r3, asl #2
	cmp	r4, r3, asl #2
	mov	r5, r0
	bne	.L46
	ldr	r0, [r0, #44]
	ldr	r1, [r5, #48]
	add	r0, r0, #1
	ldr	r3, .L47+4
	mov	lr, pc
	bx	r3
	str	r1, [r5, #44]
.L46:
	add	r4, r4, #1
	str	r4, [r5, #32]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	1717986919
	.word	__aeabi_idivmod
	.size	animateJellyfish, .-animateJellyfish
	.align	2
	.global	drawJellyfish
	.type	drawJellyfish, %function
drawJellyfish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	ldr	r3, [r0, #64]
	cmp	r3, #0
	bne	.L50
	ldr	r3, [r0, #56]
	cmp	r3, #0
	bne	.L50
	ldr	ip, [r0, #12]
	ldr	r3, [r0, #44]
	ldr	r2, [r0, #60]
	ldr	r1, .L53
	mov	r3, r3, asl #6
	mov	ip, ip, asl #23
	ldrb	r4, [r0, #8]	@ zero_extendqisi2
	mov	r2, r2, asl #3
	add	r0, r3, #20
	mov	ip, ip, lsr #23
	add	r3, r1, r2
	orr	ip, ip, #16384
	orr	r0, r0, #4096
	strh	r4, [r1, r2]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	b	.L49
.L50:
	ldr	r3, [r0, #60]
	ldr	r2, .L53
	mov	r3, r3, asl #3
	ldrh	r1, [r2, r3]
	orr	r1, r1, #512
	strh	r1, [r2, r3]	@ movhi
.L49:
	ldmfd	sp!, {r4}
	bx	lr
.L54:
	.align	2
.L53:
	.word	shadowOAM
	.size	drawJellyfish, .-drawJellyfish
	.align	2
	.global	initNoName
	.type	initNoName, %function
initNoName:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r6, .L64
	mov	r3, #16
	mov	r2, #2
	ldr	r4, .L64+4
	str	r3, [r6, #24]
	str	r3, [r6, #28]
	str	r2, [r6, #16]
	str	r2, [r6, #20]
	mov	lr, pc
	bx	r4
	ldr	r1, [r6, #28]
	ldr	r7, .L64+8
	rsb	r1, r1, #512
	mov	lr, pc
	bx	r7
	mov	r5, r1
	mov	lr, pc
	bx	r4
	ldr	r1, [r6, #24]
	rsb	r1, r1, #512
	mov	lr, pc
	bx	r7
	sub	r3, r5, #225
	cmp	r3, #54
	mov	r7, r1
	bhi	.L56
.L61:
	mov	lr, pc
	bx	r4
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #23
	add	r5, r0, r3
	mov	r5, r5, asl #23
	rsb	r5, r3, r5, lsr #23
	sub	r3, r5, #225
	cmp	r3, #54
	bls	.L61
.L56:
	sub	r3, r7, #217
	cmp	r3, #77
	str	r5, [r6, #0]
	bhi	.L58
.L60:
	mov	lr, pc
	bx	r4
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #23
	add	r7, r0, r3
	mov	r7, r7, asl #23
	rsb	r7, r3, r7, lsr #23
	sub	r3, r7, #217
	cmp	r3, #77
	bls	.L60
.L58:
	mov	r2, #3
	str	r2, [r6, #48]
	mov	r2, #1
	mov	r3, #0
	str	r2, [r6, #52]
	mov	r2, #12
	str	r3, [r6, #32]
	str	r3, [r6, #44]
	str	r3, [r6, #56]
	str	r3, [r6, #64]
	str	r7, [r6, #4]
	str	r2, [r6, #60]
	mov	lr, pc
	bx	r4
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #30
	add	r0, r0, r3
	and	r0, r0, #3
	rsb	r3, r3, r0
	str	r3, [r6, #68]
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	noName
	.word	rand
	.word	__aeabi_idivmod
	.size	initNoName, .-initNoName
	.align	2
	.global	animateNoName
	.type	animateNoName, %function
animateNoName:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r5, .L68
	ldr	r3, .L68+4
	ldr	r4, [r5, #32]
	smull	r2, r3, r4, r3
	mov	r2, r4, asr #31
	rsb	r3, r2, r3, asr #3
	add	r3, r3, r3, asl #2
	cmp	r4, r3, asl #2
	bne	.L67
	add	r0, r5, #44
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r0, r0, #1
	ldr	r3, .L68+8
	mov	lr, pc
	bx	r3
	str	r1, [r5, #44]
.L67:
	add	r4, r4, #1
	str	r4, [r5, #32]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L69:
	.align	2
.L68:
	.word	noName
	.word	1717986919
	.word	__aeabi_idivmod
	.size	animateNoName, .-animateNoName
	.align	2
	.global	drawNoName
	.type	drawNoName, %function
drawNoName:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L74
	str	r4, [sp, #-4]!
	ldr	r2, [r3, #64]
	cmp	r2, #0
	bne	.L71
	ldr	r2, [r3, #56]
	cmp	r2, #0
	bne	.L71
	ldr	ip, [r3, #12]
	ldr	r0, [r3, #44]
	ldr	r2, [r3, #60]
	ldr	r1, .L74+4
	mov	ip, ip, asl #23
	mov	r0, r0, asl #6
	mov	r2, r2, asl #3
	ldrb	r4, [r3, #8]	@ zero_extendqisi2
	mov	ip, ip, lsr #23
	add	r0, r0, #22
	add	r3, r1, r2
	orr	ip, ip, #16384
	orr	r0, r0, #4096
	strh	r4, [r1, r2]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	b	.L70
.L71:
	ldr	r3, [r3, #60]
	ldr	r2, .L74+4
	mov	r3, r3, asl #3
	ldrh	r1, [r2, r3]
	orr	r1, r1, #512
	strh	r1, [r2, r3]	@ movhi
.L70:
	ldmfd	sp!, {r4}
	bx	lr
.L75:
	.align	2
.L74:
	.word	noName
	.word	shadowOAM
	.size	drawNoName, .-drawNoName
	.align	2
	.global	initKingJellyfish
	.type	initKingJellyfish, %function
initKingJellyfish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r6, .L85
	mov	r3, #32
	mov	r2, #1
	ldr	r4, .L85+4
	str	r3, [r6, #24]
	str	r3, [r6, #28]
	str	r2, [r6, #16]
	str	r2, [r6, #20]
	mov	lr, pc
	bx	r4
	ldr	r1, [r6, #28]
	ldr	r7, .L85+8
	rsb	r1, r1, #512
	mov	lr, pc
	bx	r7
	mov	r5, r1
	mov	lr, pc
	bx	r4
	ldr	r1, [r6, #24]
	rsb	r1, r1, #512
	mov	lr, pc
	bx	r7
	sub	r3, r5, #225
	cmp	r3, #54
	mov	r7, r1
	bhi	.L77
.L82:
	mov	lr, pc
	bx	r4
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #23
	add	r5, r0, r3
	mov	r5, r5, asl #23
	rsb	r5, r3, r5, lsr #23
	sub	r3, r5, #225
	cmp	r3, #54
	bls	.L82
.L77:
	sub	r3, r7, #217
	cmp	r3, #77
	str	r5, [r6, #0]
	bhi	.L79
.L81:
	mov	lr, pc
	bx	r4
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #23
	add	r7, r0, r3
	mov	r7, r7, asl #23
	rsb	r7, r3, r7, lsr #23
	sub	r3, r7, #217
	cmp	r3, #77
	bls	.L81
.L79:
	mov	r2, #3
	str	r2, [r6, #48]
	mov	r2, #1
	mov	r3, #0
	str	r2, [r6, #52]
	mov	r2, #11
	str	r3, [r6, #32]
	str	r3, [r6, #44]
	str	r3, [r6, #56]
	str	r3, [r6, #64]
	str	r7, [r6, #4]
	str	r2, [r6, #60]
	mov	lr, pc
	bx	r4
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #30
	add	r0, r0, r3
	and	r0, r0, #3
	rsb	r3, r3, r0
	str	r3, [r6, #68]
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L86:
	.align	2
.L85:
	.word	kingJellyfish
	.word	rand
	.word	__aeabi_idivmod
	.size	initKingJellyfish, .-initKingJellyfish
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	bl	initPlayer
	bl	initJellyfish
	bl	initKingJellyfish
	bl	initNoName
	ldr	r2, .L88
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, .L88+4
	str	r3, [r2, #0]
	ldr	r3, .L88+8
	mov	r2, #3600
	str	r2, [r3, #0]
	ldr	r3, .L88+12
	mov	r2, #5
	str	r2, [r3, #0]
	ldr	r3, .L88+16
	mov	r2, #16
	mov	r6, #100663296
	str	r2, [r3, #0]
	ldr	r0, .L88+20
	ldr	r3, .L88+24
	ldr	r4, .L88+28
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L88+32
	mov	r2, r6
	mov	r3, #256
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L88+36
	add	r2, r6, #55296
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r5, #67108864
	mov	ip, #6912	@ movhi
	strh	ip, [r5, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L88+40
	add	r2, r6, #16384
	mov	r3, #960
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L88+44
	add	r2, r6, #57344
	mov	r3, #4096
	mov	lr, pc
	bx	r4
	mvn	ip, #9152
	sub	ip, ip, #59
	mov	r2, #83886080
	strh	ip, [r5, #10]	@ movhi
	mov	r0, #3
	ldr	r1, .L88+48
	add	r2, r2, #512
	mov	r3, #256
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L88+52
	add	r2, r6, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L88+56
	mov	lr, pc
	bx	r3
	ldr	r1, .L88+60
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r1, .L88+64
	mov	r2, #216
	strh	r2, [r5, #22]	@ movhi
	strh	r2, [r1, #0]	@ movhi
	ldr	r2, .L88+68
	mov	r3, #134
	strh	r3, [r2, #0]	@ movhi
	strh	r3, [r5, #20]	@ movhi
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L89:
	.align	2
.L88:
	.word	score
	.word	numCaptured
	.word	time
	.word	changeBlending
	.word	.LANCHOR0
	.word	bgPal
	.word	loadPalette
	.word	DMANow
	.word	UITiles
	.word	UIMap
	.word	bgTiles
	.word	bgMap
	.word	spritesheetPal
	.word	spritesheetTiles
	.word	hideSprites
	.word	shadowOAM
	.word	vOff
	.word	hOff
	.size	initGame, .-initGame
	.align	2
	.global	animateKingJellyfish
	.type	animateKingJellyfish, %function
animateKingJellyfish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r5, .L92
	ldr	r3, .L92+4
	ldr	r4, [r5, #32]
	smull	r2, r3, r4, r3
	mov	r2, r4, asr #31
	rsb	r3, r2, r3, asr #3
	add	r3, r3, r3, asl #2
	cmp	r4, r3, asl #2
	bne	.L91
	add	r0, r5, #44
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r0, r0, #1
	ldr	r3, .L92+8
	mov	lr, pc
	bx	r3
	str	r1, [r5, #44]
.L91:
	add	r4, r4, #1
	str	r4, [r5, #32]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L93:
	.align	2
.L92:
	.word	kingJellyfish
	.word	1717986919
	.word	__aeabi_idivmod
	.size	animateKingJellyfish, .-animateKingJellyfish
	.align	2
	.global	drawKingJellyfish
	.type	drawKingJellyfish, %function
drawKingJellyfish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L101
	str	r4, [sp, #-4]!
	ldr	r2, [r3, #64]
	cmp	r2, #0
	bne	.L99
	ldr	r2, .L101+4
	ldr	r2, [r2, #0]
	cmp	r2, #0
	bne	.L100
	ldr	ip, [r3, #12]
	ldr	r0, [r3, #44]
	ldr	r2, [r3, #60]
	ldr	r1, .L101+8
	mov	ip, ip, asl #23
	add	r0, r0, #3
	mov	r2, r2, asl #3
	ldrb	r4, [r3, #8]	@ zero_extendqisi2
	mvn	ip, ip, lsr #6
	mov	r0, r0, asl #7
	add	r3, r1, r2
.L98:
	mvn	ip, ip, lsr #17
	orr	r0, r0, #4096
	strh	r4, [r1, r2]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	strh	r0, [r3, #4]	@ movhi
.L94:
	ldmfd	sp!, {r4}
	bx	lr
.L100:
	ldr	ip, [r3, #12]
	ldr	r0, [r3, #44]
	ldr	r2, [r3, #60]
	ldrb	r4, [r3, #8]	@ zero_extendqisi2
	ldr	r1, .L101+8
	mov	ip, ip, asl #23
	mov	r0, r0, asl #7
	mov	r2, r2, asl #3
	mvn	ip, ip, lsr #6
	add	r0, r0, #388
	add	r3, r1, r2
	orr	r4, r4, #1024
	b	.L98
.L99:
	ldr	r3, [r3, #60]
	ldr	r2, .L101+8
	mov	r3, r3, asl #3
	ldrh	r1, [r2, r3]
	orr	r1, r1, #512
	strh	r1, [r2, r3]	@ movhi
	b	.L94
.L102:
	.align	2
.L101:
	.word	kingJellyfish
	.word	cheat
	.word	shadowOAM
	.size	drawKingJellyfish, .-drawKingJellyfish
	.align	2
	.global	nearby
	.type	nearby, %function
nearby:
	@ Function supports interworking.
	@ args = 20, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #20
	ldr	ip, [sp, #40]
	mov	lr, ip, asl #1
	rsb	r1, ip, r1
	rsb	r0, ip, r0
	ldr	ip, [sp, #24]
	str	ip, [sp, #0]
	ldr	ip, [sp, #28]
	str	ip, [sp, #4]
	ldr	ip, [sp, #32]
	str	ip, [sp, #8]
	ldr	ip, [sp, #36]
	add	r2, lr, r2
	str	ip, [sp, #12]
	add	r3, lr, r3
	ldr	ip, .L104
	mov	lr, pc
	bx	ip
	add	sp, sp, #20
	ldr	lr, [sp], #4
	bx	lr
.L105:
	.align	2
.L104:
	.word	collision
	.size	nearby, .-nearby
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r3, #67108864
	add	r3, r3, #256
	sub	sp, sp, #44
	ldrh	r3, [r3, #48]
	tst	r3, #64
	beq	.L178
	ldr	r1, .L197
	ldr	r4, .L197+4
	str	r1, [sp, #32]
.L107:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L109
	ldr	lr, [r4, #0]
	ldr	ip, [r4, #28]
	ldr	r1, [r4, #16]
	ldr	r5, [r4, #4]
	add	r0, ip, lr
	sub	r2, r1, #1
	add	r2, r2, r0
	ldr	r3, .L197+8
	add	r2, r5, r2, asl #9
	mov	r5, r2, asl #1
	ldrh	r5, [r3, r5]
	cmp	r5, #0
	ldr	r5, .L197+4
	bne	.L185
.L109:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #32
	beq	.L181
	ldr	r3, .L197+12
	str	r3, [sp, #28]
.L111:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L113
	ldr	r5, [r4, #4]
	add	r0, r4, #20
	ldmia	r0, {r0, lr}	@ phole ldm
	ldr	r1, [r4, #0]
	add	ip, lr, r5
	sub	r2, r0, #1
	add	r2, r2, ip
	ldr	r3, .L197+8
	add	r6, r2, r1, asl #9
	mov	r6, r6, asl #1
	ldrh	r6, [r3, r6]
	cmp	r6, #0
	ldr	r6, .L197+4
	bne	.L186
.L113:
	ldr	r6, .L197+16
	ldrh	r3, [r6, #0]
	tst	r3, #1
	beq	.L115
	ldr	r2, .L197+20
	ldrh	r8, [r2, #0]
	ands	r8, r8, #1
	beq	.L187
.L115:
	tst	r3, #2
	beq	.L121
	ldr	r3, .L197+20
	ldrh	r5, [r3, #0]
	ands	r5, r5, #2
	beq	.L188
.L121:
	ldr	r5, .L197+24
	ldr	ip, [r5, #24]
	ldr	r7, [r5, #0]
	ldr	r6, [r5, #4]
	ldr	lr, [r5, #28]
	ldr	r0, [r4, #0]
	str	ip, [sp, #12]
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #28]
	ldr	r3, [r4, #24]
	str	r7, [sp, #0]
	stmib	sp, {r6, lr}	@ phole stm
	ldr	ip, .L197+28
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L133
	ldr	r1, .L197+32
	ldr	r3, [r1, #0]
	cmp	r3, #0
	str	r1, [sp, #36]
	ble	.L133
	ldr	r3, .L197+36
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L133
	ldr	r9, .L197+40
	ldr	r8, .L197+44
	ldr	r7, .L197+48
	ldr	sl, .L197+52
	mov	fp, r9
	b	.L144
.L134:
	ldr	r3, [r9, #56]
	cmp	r3, #0
	bne	.L189
.L139:
	ldr	r1, .L197+56
	add	r8, r8, #72
	cmp	r8, r1
	beq	.L190
.L144:
	ldr	r3, [r8, #4]
	cmp	r3, #0
	beq	.L134
	mov	lr, pc
	bx	r7
	ldr	r1, [r8, #-24]
	rsb	r1, r1, #512
	mov	lr, pc
	bx	sl
	mov	r6, r1
	mov	lr, pc
	bx	r7
	ldr	r1, [r8, #-28]
	rsb	r1, r1, #512
	mov	lr, pc
	bx	sl
	sub	r3, r6, #217
	cmp	r3, #174
	bhi	.L135
	mov	r6, r1
.L160:
	mov	lr, pc
	bx	r7
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #23
	add	r0, r0, r3
	mov	r0, r0, asl #23
	rsb	r3, r3, r0, lsr #23
	sub	r2, r3, #217
	cmp	r2, #174
	bls	.L160
	mov	r1, r6
	mov	r6, r3
.L135:
	sub	r3, r1, #145
	cmp	r3, #230
	str	r6, [r8, #-52]
	bhi	.L137
.L159:
	mov	lr, pc
	bx	r7
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #23
	add	r0, r0, r3
	mov	r0, r0, asl #23
	rsb	r3, r3, r0, lsr #23
	sub	r2, r3, #145
	cmp	r2, #230
	bls	.L159
	mov	r1, r3
.L137:
	mov	r3, #1
	str	r3, [r8, #0]
	ldr	r3, [r9, #56]
	mov	r2, #0
	cmp	r3, #0
	str	r1, [r8, #-48]
	str	r2, [r8, #4]
	beq	.L139
.L189:
	mov	lr, pc
	bx	r7
	ldr	r1, [fp, #28]
	rsb	r1, r1, #512
	mov	lr, pc
	bx	sl
	mov	r6, r1
	mov	lr, pc
	bx	r7
	ldr	r1, [fp, #24]
	rsb	r1, r1, #512
	mov	lr, pc
	bx	sl
	sub	r3, r6, #217
	cmp	r3, #174
	bhi	.L140
	mov	r6, r1
.L158:
	mov	lr, pc
	bx	r7
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #23
	add	r0, r0, r3
	mov	r0, r0, asl #23
	rsb	r3, r3, r0, lsr #23
	sub	r2, r3, #217
	cmp	r2, #174
	bls	.L158
	mov	r1, r6
	mov	r6, r3
.L140:
	sub	r3, r1, #145
	cmp	r3, #230
	str	r6, [r9, #0]
	bhi	.L142
.L157:
	mov	lr, pc
	bx	r7
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #23
	add	r0, r0, r3
	mov	r0, r0, asl #23
	rsb	r3, r3, r0, lsr #23
	sub	r2, r3, #145
	cmp	r2, #230
	bls	.L157
	mov	r1, r3
.L142:
	str	r1, [r9, #4]
	ldr	r1, .L197+56
	add	r8, r8, #72
	mov	ip, #1
	mov	lr, #0
	cmp	r8, r1
	str	ip, [r9, #52]
	str	lr, [r9, #56]
	bne	.L144
.L190:
	mov	r3, #280
	add	r3, r3, #2
	ldr	ip, [sp, #36]
	str	r3, [r4, #0]
	mov	r3, #242
	mov	r2, #0
	str	r3, [r4, #4]
	ldr	r3, [sp, #28]
	str	r2, [ip, #0]
	ldr	r1, [sp, #32]
	mov	r2, #134	@ movhi
	mov	lr, #216	@ movhi
	strh	r2, [r3, #0]	@ movhi
	mov	r3, #3
	strh	lr, [r1, #0]	@ movhi
	str	r3, [r4, #36]
	mov	lr, pc
	bx	r7
	ldr	r1, [r5, #28]
	rsb	r1, r1, #512
	mov	lr, pc
	bx	sl
	mov	r8, r1
	mov	lr, pc
	bx	r7
	ldr	r1, [r5, #24]
	rsb	r1, r1, #512
	mov	lr, pc
	bx	sl
	sub	r3, r8, #225
	cmp	r3, #54
	mov	r6, r1
	bhi	.L145
.L156:
	mov	lr, pc
	bx	r7
	ldr	r1, [r5, #28]
	rsb	r1, r1, #512
	mov	lr, pc
	bx	sl
	sub	r3, r1, #225
	cmp	r3, #54
	bls	.L156
	mov	r8, r1
.L145:
	sub	r3, r6, #217
	cmp	r3, #77
	str	r8, [r5, #0]
	bhi	.L147
.L155:
	mov	lr, pc
	bx	r7
	ldr	r1, [r5, #24]
	rsb	r1, r1, #512
	mov	lr, pc
	bx	sl
	sub	r3, r1, #217
	cmp	r3, #77
	bls	.L155
	mov	r6, r1
.L147:
	mov	r1, #31744
	mov	r2, #11008
	ldr	r0, .L197+60
	add	r1, r1, #185
	add	r2, r2, #17
	mov	r3, #0
	str	r6, [r5, #4]
	ldr	ip, .L197+64
	mov	lr, pc
	bx	ip
.L133:
	add	r1, sp, #28
	ldmia	r1, {r1, ip}	@ phole ldm
	ldrh	r3, [r1, #0]
	ldrh	r2, [ip, #0]
	ldmia	r4, {r0, r1}	@ phole ldm
	rsb	r2, r2, r0
	rsb	r3, r3, r1
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #44
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	animatePlayer
.L181:
	ldr	ip, [r4, #4]
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #0]
	sub	r2, ip, #1
	rsb	r2, r0, r2
	ldr	r3, .L197+8
	add	lr, r2, r1, asl #9
	mov	lr, lr, asl #1
	ldrh	lr, [r3, lr]
	cmp	lr, #0
	ldr	lr, .L197+4
	beq	.L191
	ldr	r5, [lr, #28]
	add	r1, r1, r5
	sub	r1, r1, #1
	add	r2, r2, r1, asl #9
	mov	r2, r2, asl #1
	ldrh	r3, [r3, r2]
	cmp	r3, #0
	beq	.L192
	ldr	r1, .L197+12
	ldrh	r3, [r1, #0]
	cmp	r3, #0
	str	r1, [sp, #28]
	beq	.L112
	ldr	r2, [lr, #24]
	ldr	r1, [lr, #12]
	add	r2, r2, r2, lsr #31
	add	r2, r1, r2, asr #1
	cmp	r2, #119
	ldrle	r2, [sp, #28]
	rsble	r3, r0, r3
	strleh	r3, [r2, #0]	@ movhi
.L112:
	cmp	ip, r0
	rsbge	r0, r0, ip
	strge	r0, [r4, #4]
	b	.L111
.L178:
	ldr	r4, .L197+4
	ldr	r0, [r4, #0]
	ldr	r1, [r4, #16]
	ldr	ip, [r4, #4]
	sub	r2, r0, #1
	rsb	r2, r1, r2
	ldr	r3, .L197+8
	add	r2, ip, r2, asl #9
	mov	ip, r2, asl #1
	ldrh	ip, [r3, ip]
	cmp	ip, #0
	beq	.L193
	ldr	ip, [r4, #24]
	add	r2, r2, ip
	add	r3, r3, r2, asl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	beq	.L194
	ldr	ip, .L197
	ldrh	r3, [ip, #0]
	cmp	r3, #0
	str	ip, [sp, #32]
	beq	.L108
	ldr	r2, [r4, #28]
	ldr	ip, [r4, #8]
	add	r2, r2, r2, lsr #31
	add	r2, ip, r2, asr #1
	cmp	r2, #79
	ldrle	lr, [sp, #32]
	rsble	r3, r1, r3
	strleh	r3, [lr, #0]	@ movhi
.L108:
	cmp	r0, r1
	rsbge	r1, r1, r0
	strge	r1, [r4, #0]
	b	.L107
.L186:
	ldr	r7, [r6, #28]
	add	r1, r1, r7
	sub	r1, r1, #1
	add	r2, r2, r1, asl #9
	mov	r2, r2, asl #1
	ldrh	r3, [r3, r2]
	cmp	r3, #0
	beq	.L113
	ldr	r1, [sp, #28]
	ldrh	r3, [r1, #0]
	cmp	r3, #272
	bcs	.L114
	ldr	r2, [r6, #12]
	add	lr, lr, lr, lsr #31
	add	r2, r2, lr, asr #1
	cmp	r2, #120
	ldrgt	r2, .L197+12
	addgt	r3, r3, r0
	strgth	r3, [r2, #0]	@ movhi
.L114:
	rsb	r3, r0, #512
	cmp	ip, r3
	addle	r0, r0, r5
	strle	r0, [r4, #4]
	b	.L113
.L185:
	ldr	r6, [r5, #24]
	add	r2, r2, r6
	add	r3, r3, r2, asl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	beq	.L109
	ldr	r2, [sp, #32]
	ldrh	r3, [r2, #0]
	cmp	r3, #352
	bcs	.L110
	ldr	r2, [r5, #8]
	add	ip, ip, ip, lsr #31
	add	r2, r2, ip, asr #1
	cmp	r2, #80
	ldrgt	r2, .L197
	addgt	r3, r3, r1
	strgth	r3, [r2, #0]	@ movhi
.L110:
	rsb	r3, r1, #512
	cmp	r0, r3
	addle	r1, r1, lr
	strle	r1, [r4, #0]
	b	.L109
.L193:
	ldr	r2, .L197
	str	r2, [sp, #32]
	b	.L107
.L191:
	ldr	ip, .L197+12
	str	ip, [sp, #28]
	b	.L111
.L188:
	mov	ip, #256
	str	ip, [sp, #0]
	mov	ip, #248
	str	ip, [sp, #4]
	mov	ip, #24
	str	ip, [sp, #8]
	mov	ip, #16
	str	ip, [sp, #12]
	ldr	r0, [r4, #0]
	mov	ip, #5
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #28]
	ldr	r3, [r4, #24]
	str	ip, [sp, #16]
	bl	nearby
	cmp	r0, #0
	beq	.L121
	ldr	lr, .L197+32
	ldr	r3, [lr, #0]
	cmp	r3, #0
	str	lr, [sp, #36]
	ble	.L121
	ldr	r6, .L197+68
	ldr	r7, .L197+48
	ldr	fp, .L197+52
	ldr	sl, .L197+72
	add	r8, r6, #720
	mov	r9, lr
	b	.L127
.L122:
	add	r6, r6, #72
	cmp	r6, r8
	beq	.L195
.L127:
	ldr	r3, [r6, #-12]
	cmp	r3, #0
	bne	.L122
	ldr	r3, [r6, #-8]
	cmp	r3, #0
	beq	.L122
	mov	lr, pc
	bx	r7
	ldr	r1, [r6, #-36]
	rsb	r1, r1, #512
	mov	lr, pc
	bx	fp
	mov	r5, r1
	mov	lr, pc
	bx	r7
	ldr	r1, [r6, #-40]
	rsb	r1, r1, #512
	mov	lr, pc
	bx	fp
	ldr	r2, [sl, #0]
	ldr	r3, [r9, #0]
	sub	r0, r5, #217
	add	r2, r2, #1
	sub	r3, r3, #1
	cmp	r0, #174
	str	r2, [sl, #0]
	str	r3, [r9, #0]
	bhi	.L123
	mov	r5, r1
.L164:
	mov	lr, pc
	bx	r7
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #23
	add	r0, r0, r3
	mov	r0, r0, asl #23
	rsb	r3, r3, r0, lsr #23
	sub	r2, r3, #217
	cmp	r2, #174
	bls	.L164
	mov	r1, r5
	mov	r5, r3
.L123:
	sub	r3, r1, #145
	cmp	r3, #230
	str	r5, [r6, #-64]
	bhi	.L125
.L163:
	mov	lr, pc
	bx	r7
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #23
	add	r0, r0, r3
	mov	r0, r0, asl #23
	rsb	r3, r3, r0, lsr #23
	sub	r2, r3, #145
	cmp	r2, #230
	bls	.L163
	mov	r1, r3
.L125:
	str	r1, [r6, #-60]
	mov	r2, #0
	mov	r1, #1
	str	r1, [r6, #-12]
	str	r2, [r6, #-8]
	str	r1, [r6, #0]
	b	.L122
.L187:
	mov	r1, #5568
	mov	r2, #11008
	ldr	r5, .L197+76
	ldr	r0, .L197+80
	add	r1, r1, #10
	add	r2, r2, #17
	mov	r3, r8
	ldr	ip, .L197+64
	mov	lr, pc
	bx	ip
	ldr	fp, .L197+32
	add	r7, r5, #720
	mov	sl, #4
	b	.L117
.L116:
	add	r5, r5, #72
	cmp	r5, r7
	beq	.L196
.L117:
	ldr	r3, [r5, #-4]
	cmp	r3, #0
	beq	.L116
	sub	ip, r5, #56
	ldmia	ip, {ip, lr}	@ phole ldm
	ldr	r8, [r5, #-28]
	ldr	r9, [r5, #-32]
	ldmia	r4, {r0, r1}	@ phole ldm
	ldr	r2, [r4, #28]
	ldr	r3, [r4, #24]
	stmia	sp, {ip, lr}	@ phole stm
	str	r8, [sp, #8]
	str	r9, [sp, #12]
	str	sl, [sp, #16]
	bl	nearby
	cmp	r0, #0
	beq	.L116
	ldr	ip, [fp, #0]
	cmp	ip, #2
	bgt	.L116
	mov	lr, #1
	add	ip, ip, #1
	mov	r3, #0
	mov	r1, #4608
	mov	r2, #11008
	str	ip, [fp, #0]
	ldr	r0, .L197+84
	add	r1, r1, #13
	add	r2, r2, #17
	stmda	r5, {r3, lr}	@ phole stm
	str	lr, [r5, #8]
	ldr	ip, .L197+64
	mov	lr, pc
	bx	ip
	b	.L116
.L194:
	ldr	r3, .L197
	str	r3, [sp, #32]
	b	.L107
.L192:
	ldr	lr, .L197+12
	str	lr, [sp, #28]
	b	.L111
.L196:
	ldr	r5, .L197+40
	ldmia	r5, {ip, lr}	@ phole ldm
	ldr	r7, [r5, #28]
	ldr	r8, [r5, #24]
	ldr	r0, [r4, #0]
	str	ip, [sp, #0]
	ldr	r1, [r4, #4]
	mov	ip, #4
	ldr	r2, [r4, #28]
	ldr	r3, [r4, #24]
	str	lr, [sp, #4]
	str	r7, [sp, #8]
	str	r8, [sp, #12]
	str	ip, [sp, #16]
	bl	nearby
	cmp	r0, #0
	beq	.L184
	ldr	lr, .L197+32
	ldr	ip, [lr, #0]
	cmp	ip, #2
	bgt	.L184
	ldr	r3, [r5, #52]
	cmp	r3, #0
	beq	.L184
	mov	r8, #1
	mov	r7, #0
	add	ip, ip, r8
	mov	r1, #4608
	mov	r2, #11008
	str	ip, [lr, #0]
	ldr	r0, .L197+84
	add	r1, r1, #13
	add	r2, r2, #17
	mov	r3, r7
	str	r7, [r5, #52]
	str	r8, [r5, #56]
	str	r8, [r5, #64]
	ldr	ip, .L197+64
	mov	lr, pc
	bx	ip
.L184:
	ldrh	r3, [r6, #0]
	b	.L115
.L195:
	ldr	r9, .L197+40
	ldr	r3, [r9, #56]
	cmp	r3, #0
	beq	.L128
	ldr	r3, [r9, #52]
	cmp	r3, #0
	bne	.L128
	ldr	r3, .L197+72
	ldr	ip, [sp, #36]
	ldr	r1, [r3, #0]
	ldr	r2, [ip, #0]
	add	r1, r1, #3
	sub	r2, r2, #1
	str	r1, [r3, #0]
	str	r2, [ip, #0]
	ldr	r7, .L197+48
	mov	lr, pc
	bx	r7
	ldr	r1, [r9, #28]
	ldr	sl, .L197+52
	rsb	r1, r1, #512
	mov	lr, pc
	bx	sl
	mov	r5, r1
	mov	lr, pc
	bx	r7
	ldr	r1, [r9, #24]
	rsb	r1, r1, #512
	mov	lr, pc
	bx	sl
	sub	r3, r5, #217
	cmp	r3, #174
	mov	r6, r1
	bhi	.L129
.L162:
	mov	lr, pc
	bx	r7
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #23
	add	r0, r0, r3
	mov	r5, r0, asl #23
	rsb	r5, r3, r5, lsr #23
	sub	r3, r5, #217
	cmp	r3, #174
	bls	.L162
.L129:
	sub	r3, r6, #145
	cmp	r3, #230
	str	r5, [r9, #0]
	bhi	.L131
.L161:
	mov	lr, pc
	bx	r7
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #23
	add	r0, r0, r3
	mov	r6, r0, asl #23
	rsb	r6, r3, r6, lsr #23
	sub	r3, r6, #145
	cmp	r3, #230
	bls	.L161
.L131:
	mov	r3, #1
	mov	r2, #0
	str	r6, [r9, #4]
	str	r3, [r9, #52]
	str	r2, [r9, #56]
	str	r3, [r9, #64]
.L128:
	mov	r1, #19712
	mov	r2, #11008
	ldr	r0, .L197+88
	add	r1, r1, #133
	add	r2, r2, #17
	mov	r3, #0
	ldr	ip, .L197+64
	mov	lr, pc
	bx	ip
	b	.L121
.L198:
	.align	2
.L197:
	.word	vOff
	.word	player
	.word	collisionmapBitmap
	.word	hOff
	.word	oldButtons
	.word	buttons
	.word	kingJellyfish
	.word	collision
	.word	numCaptured
	.word	cheat
	.word	noName
	.word	jellyfishes+52
	.word	rand
	.word	__aeabi_idivmod
	.word	jellyfishes+772
	.word	Screaming
	.word	playSoundB
	.word	jellyfishes+64
	.word	score
	.word	jellyfishes+56
	.word	Whoosh
	.word	Coin
	.word	Money
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawNumber
	.type	drawNumber, %function
drawNumber:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, sl}
	ldr	r4, .L200
	smull	ip, r4, r2, r4
	mov	ip, r2, asr #31
	rsb	ip, ip, r4, asr #2
	add	r5, ip, ip, asl #2
	ldr	r4, .L200+4
	add	r6, r3, #1
	sub	r2, r2, r5, asl #1
	mov	r3, r3, asl #3
	mov	r6, r6, asl #3
	mov	r0, r0, asl #16
	add	sl, r1, #12
	add	ip, ip, #480
	add	r2, r2, #480
	mov	r7, r0, lsr #16
	add	r8, r4, r3
	add	r0, r4, r6
	orr	r1, r1, #16384
	mov	ip, ip, asl #1
	orr	sl, sl, #16384
	mov	r2, r2, asl #1
	strh	r7, [r4, r3]	@ movhi
	strh	r1, [r8, #2]	@ movhi
	strh	ip, [r8, #4]	@ movhi
	strh	r7, [r4, r6]	@ movhi
	strh	sl, [r0, #2]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl}
	bx	lr
.L201:
	.align	2
.L200:
	.word	1717986919
	.word	shadowOAM
	.size	drawNumber, .-drawNumber
	.align	2
	.global	decreaseTime
	.type	decreaseTime, %function
decreaseTime:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L203
	ldr	r2, [r3, #0]
	sub	r2, r2, #1
	str	r2, [r3, #0]
	bx	lr
.L204:
	.align	2
.L203:
	.word	time
	.size	decreaseTime, .-decreaseTime
	.align	2
	.global	drawUINet
	.type	drawUINet, %function
drawUINet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L213
	stmfd	sp!, {r4, r5, r6, r7, r8, sl}
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L210
	cmp	r3, #1
	beq	.L211
	cmp	r3, #2
	beq	.L212
	add	r6, r0, #1
	ldr	r3, .L213+4
	mov	r4, #16384
	add	r5, r6, #1
	mov	r0, r0, asl #3
	mov	r6, r6, asl #3
	mov	r5, r5, asl #3
	mov	ip, r4
	mov	r1, r4
	add	sl, r3, r0
	add	r8, r3, r6
	add	r7, r3, r5
	add	r1, r1, #224
	mov	r2, #896
	add	r4, r4, #192
	add	ip, ip, #208
	add	r2, r2, #2
	strh	r4, [sl, #2]	@ movhi
	strh	ip, [r8, #2]	@ movhi
	strh	r1, [r7, #2]	@ movhi
	mov	r1, #144	@ movhi
	strh	r2, [sl, #4]	@ movhi
	strh	r1, [r3, r0]	@ movhi
	strh	r2, [r8, #4]	@ movhi
	strh	r1, [r3, r6]	@ movhi
	strh	r2, [r7, #4]	@ movhi
	strh	r1, [r3, r5]	@ movhi
.L205:
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl}
	bx	lr
.L210:
	ldr	r3, .L213+4
	add	r2, r0, #1
	mov	r6, #512	@ movhi
	mov	r1, r2, asl #3
	mov	r0, r0, asl #3
	add	r2, r3, r2, asl #3
	strh	r6, [r3, r0]	@ movhi
	strh	r6, [r3, r1]	@ movhi
	strh	r6, [r2, #8]	@ movhi
	b	.L205
.L211:
	ldr	r3, .L213+4
	mov	r4, r0, asl #3
	mov	r1, #16384
	add	r0, r0, #1
	add	ip, r3, r4
	add	r1, r1, #192
	mov	r2, #896
	mov	r5, r0, asl #3
	add	r2, r2, #2
	add	r0, r3, r0, asl #3
	mov	sl, #144	@ movhi
	strh	r1, [ip, #2]	@ movhi
	mov	r1, #512	@ movhi
	strh	sl, [r3, r4]	@ movhi
	strh	r2, [ip, #4]	@ movhi
	strh	r1, [r3, r5]	@ movhi
	strh	r1, [r0, #8]	@ movhi
	b	.L205
.L212:
	ldr	r2, .L213+4
	add	r8, r0, #1
	mov	r4, #16384
	mov	r6, r8, asl #3
	mov	r0, r0, asl #3
	mov	ip, r4
	add	r7, r2, r0
	add	r5, r2, r6
	add	ip, ip, #208
	mov	r1, #896
	add	r4, r4, #192
	add	r1, r1, #2
	mov	sl, #144	@ movhi
	add	r8, r2, r8, asl #3
	strh	r4, [r7, r3]	@ movhi
	strh	ip, [r5, r3]	@ movhi
	mov	ip, #512	@ movhi
	strh	sl, [r2, r0]	@ movhi
	strh	r1, [r7, #4]	@ movhi
	strh	sl, [r2, r6]	@ movhi
	strh	r1, [r5, #4]	@ movhi
	strh	ip, [r8, #8]	@ movhi
	b	.L205
.L214:
	.align	2
.L213:
	.word	numCaptured
	.word	shadowOAM
	.size	drawUINet, .-drawUINet
	.align	2
	.global	drawGame
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	bl	drawPlayer
	bl	drawKingJellyfish
	bl	drawNoName
	ldr	r5, .L221
	mov	r4, #0
.L216:
	add	r0, r4, r4, asl #3
	add	r0, r5, r0, asl #3
	add	r4, r4, #1
	bl	drawJellyfish
	cmp	r4, #10
	bne	.L216
	ldr	r3, .L221+4
	mov	r0, #144
	ldr	r2, [r3, #0]
	mov	r1, #64
	mov	r3, #124
	bl	drawNumber
	ldr	r3, .L221+8
	ldr	r2, .L221+12
	ldr	r1, [r3, #0]
	smull	r3, r2, r1, r2
	mov	r3, r1, asr #31
	add	r2, r2, r1
	rsb	r2, r3, r2, asr #5
	mov	r1, #108
	mov	r3, #126
	mov	r0, #144
	bl	drawNumber
	mov	r0, #121
	bl	drawUINet
	ldr	r3, .L221+16
	ldr	r0, [r3, #32]
	ldr	r3, .L221+20
	ldr	r1, [r3, #0]
	ldr	r3, .L221+24
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	bne	.L217
	ldr	r2, .L221+28
	ldr	r3, [r2, #0]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2, #0]
	rsbge	r2, r3, #16
	movge	r2, r2, asl #24
	orrge	r3, r2, r3, asl #16
	movlt	r3, #16
	movge	r3, r3, lsr #16
	strlt	r3, [r2, #0]
	mov	r2, #67108864
	strh	r3, [r2, #82]	@ movhi
.L217:
	mov	r0, #3
	ldr	r1, .L221+32
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L221+36
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L222:
	.align	2
.L221:
	.word	jellyfishes
	.word	score
	.word	time
	.word	-2004318071
	.word	kingJellyfish
	.word	changeBlending
	.word	__aeabi_idivmod
	.word	.LANCHOR0
	.word	shadowOAM
	.word	DMANow
	.size	drawGame, .-drawGame
	.align	2
	.global	chase
	.type	chase, %function
chase:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L234
	ldr	r0, .L234+4
	stmfd	sp!, {r4, r5, r6, r7}
	ldr	r1, [r3, #0]
	ldr	r2, [r0, #0]
	cmp	r1, r2
	bge	.L224
	ldr	r6, [r3, #28]
	ldr	r5, [r3, #16]
	add	r4, r1, r6
	sub	r4, r4, #1
	add	r4, r4, r5
	ldr	r2, [r3, #4]
	mov	r4, r4, asl #9
	ldr	ip, .L234+8
	add	r7, r4, r2
	mov	r7, r7, asl #1
	ldrh	r7, [ip, r7]
	cmp	r7, #0
	beq	.L225
	ldr	r7, [r3, #24]
	add	r7, r2, r7
	add	r4, r4, r7
	add	r4, ip, r4, asl #1
	ldrh	r4, [r4, #-2]
	cmp	r4, #0
	beq	.L225
	ldr	r0, [r0, #4]
	add	r1, r5, r1
	cmp	r2, r0
	str	r1, [r3, #0]
	bge	.L226
	ldr	r0, [r3, #20]
	sub	r4, r0, #1
	add	r7, r4, r7
	add	r4, r7, r1, asl #9
	mov	r4, r4, asl #1
	ldrh	r4, [ip, r4]
	cmp	r4, #0
	beq	.L223
	add	r1, r6, r1
	sub	r1, r1, #1
	add	r7, r7, r1, asl #9
	mov	r7, r7, asl #1
	ldrh	r1, [ip, r7]
	cmp	r1, #0
	addne	r2, r0, r2
	strne	r2, [r3, #4]
	b	.L223
.L224:
	ldrle	r2, [r3, #4]
	ble	.L225
	ldr	r4, [r3, #16]
	rsb	r4, r4, r1
	sub	r5, r4, #1
	ldr	r2, [r3, #4]
	mov	r5, r5, asl #9
	ldr	ip, .L234+8
	add	r6, r5, r2
	mov	r6, r6, asl #1
	ldrh	r6, [ip, r6]
	cmp	r6, #0
	beq	.L225
	ldr	r6, [r3, #24]
	add	r6, r2, r6
	add	r5, r5, r6
	add	r5, ip, r5, asl #1
	ldrh	r5, [r5, #-2]
	cmp	r5, #0
	bne	.L232
.L225:
	ldr	r0, [r0, #4]
	cmp	r0, r2
	bgt	.L233
	bge	.L223
	ldr	r3, [r3, #20]
	rsb	r2, r3, r2
	sub	r0, r2, #1
	ldr	r3, .L234+8
	add	ip, r0, r1, asl #9
	mov	ip, ip, asl #1
	ldrh	ip, [r3, ip]
	cmp	ip, #0
	ldr	ip, .L234
	beq	.L223
	ldr	r4, [ip, #28]
	add	r1, r1, r4
	sub	r1, r1, #1
	add	r0, r0, r1, asl #9
	mov	r0, r0, asl #1
	ldrh	r3, [r3, r0]
	cmp	r3, #0
	strne	r2, [ip, #4]
.L223:
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
.L233:
	ldr	ip, [r3, #20]
	ldr	r0, [r3, #24]
	add	r0, ip, r0
	sub	r0, r0, #1
	add	r0, r0, r2
	ldr	r3, .L234+8
	add	r4, r0, r1, asl #9
	mov	r4, r4, asl #1
	ldrh	r4, [r3, r4]
	cmp	r4, #0
	ldr	r4, .L234
	beq	.L223
	ldr	r5, [r4, #28]
	add	r1, r1, r5
	sub	r1, r1, #1
	add	r0, r0, r1, asl #9
	mov	r0, r0, asl #1
	ldrh	r3, [r3, r0]
	cmp	r3, #0
	addne	r2, r2, ip
	strne	r2, [r4, #4]
	b	.L223
.L232:
	ldr	r1, [r0, #4]
	cmp	r2, r1
	str	r4, [r3, #0]
	bge	.L229
	ldr	r1, [r3, #20]
	sub	r0, r1, #1
	add	r6, r0, r6
	add	r0, r6, r4, asl #9
	mov	r0, r0, asl #1
	ldrh	r0, [ip, r0]
	cmp	r0, #0
	beq	.L223
	ldr	r0, [r3, #28]
	add	r4, r4, r0
	sub	r4, r4, #1
	add	r6, r6, r4, asl #9
	mov	r6, r6, asl #1
	ldrh	r0, [ip, r6]
	cmp	r0, #0
	addne	r2, r1, r2
	strne	r2, [r3, #4]
	b	.L223
.L226:
	ble	.L223
	ldr	r0, [r3, #20]
	rsb	r2, r0, r2
	sub	r0, r2, #1
	add	r4, r0, r1, asl #9
	mov	r4, r4, asl #1
	ldrh	r4, [ip, r4]
	cmp	r4, #0
	beq	.L223
	add	r1, r6, r1
	sub	r1, r1, #1
	add	r0, r0, r1, asl #9
	mov	r0, r0, asl #1
	ldrh	r1, [ip, r0]
	cmp	r1, #0
	strne	r2, [r3, #4]
	b	.L223
.L229:
	ble	.L223
	ldr	r1, [r3, #20]
	rsb	r2, r1, r2
	sub	r1, r2, #1
	add	r0, r1, r4, asl #9
	mov	r0, r0, asl #1
	ldrh	r0, [ip, r0]
	cmp	r0, #0
	beq	.L223
	ldr	r0, [r3, #28]
	add	r4, r4, r0
	sub	r4, r4, #1
	add	r1, r1, r4, asl #9
	mov	r1, r1, asl #1
	ldrh	r1, [ip, r1]
	cmp	r1, #0
	strne	r2, [r3, #4]
	b	.L223
.L235:
	.align	2
.L234:
	.word	kingJellyfish
	.word	player
	.word	collisionmapBitmap
	.size	chase, .-chase
	.align	2
	.global	idleMovement
	.type	idleMovement, %function
idleMovement:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, #0
	stmfd	sp!, {r4, r5}
	bne	.L237
	ldr	r2, [r0, #0]
	ldr	r3, [r0, #16]
	cmp	r2, r3
	blt	.L236
	rsb	r3, r3, r2
	ldr	r2, [r0, #4]
	sub	ip, r3, #1
	ldr	r1, .L245
	add	ip, r2, ip, asl #9
	mov	r2, ip, asl #1
	ldrh	r2, [r1, r2]
	cmp	r2, #0
	beq	.L236
	ldr	r2, [r0, #24]
	add	ip, ip, r2
	add	r1, r1, ip, asl #1
	ldrh	r2, [r1, #-2]
	cmp	r2, #0
	strne	r3, [r0, #0]
.L236:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L237:
	cmp	r1, #1
	beq	.L243
	cmp	r1, #2
	beq	.L244
	ldr	r1, [r0, #4]
	ldr	r2, [r0, #24]
	ldr	r3, [r0, #20]
	add	r2, r1, r2
	rsb	ip, r3, #512
	cmp	r2, ip
	bgt	.L236
	sub	ip, r3, #1
	ldr	r4, [r0, #0]
	add	r2, ip, r2
	add	r5, r2, r4, asl #9
	ldr	ip, .L245
	mov	r5, r5, asl #1
	ldrh	r5, [ip, r5]
	cmp	r5, #0
	beq	.L236
	ldr	r5, [r0, #28]
	add	r4, r4, r5
	sub	r4, r4, #1
	add	r2, r2, r4, asl #9
	mov	r2, r2, asl #1
	ldrh	r2, [ip, r2]
	cmp	r2, #0
	addne	r3, r3, r1
	strne	r3, [r0, #4]
	b	.L236
.L243:
	ldr	r1, [r0, #0]
	ldr	r2, [r0, #28]
	ldr	r3, [r0, #16]
	add	r2, r1, r2
	rsb	ip, r3, #512
	cmp	r2, ip
	bgt	.L236
	sub	ip, r3, #1
	ldr	r4, [r0, #4]
	add	r2, ip, r2
	add	r2, r4, r2, asl #9
	ldr	ip, .L245
	mov	r4, r2, asl #1
	ldrh	r4, [ip, r4]
	cmp	r4, #0
	beq	.L236
	ldr	r4, [r0, #24]
	add	r2, r2, r4
	add	ip, ip, r2, asl #1
	ldrh	r2, [ip, #-2]
	cmp	r2, #0
	addne	r3, r3, r1
	strne	r3, [r0, #0]
	b	.L236
.L244:
	ldr	r2, [r0, #4]
	ldr	r3, [r0, #20]
	cmp	r2, r3
	blt	.L236
	rsb	r3, r3, r2
	ldr	r4, [r0, #0]
	sub	ip, r3, #1
	ldr	r1, .L245
	add	r2, ip, r4, asl #9
	mov	r2, r2, asl #1
	ldrh	r2, [r1, r2]
	cmp	r2, #0
	beq	.L236
	ldr	r2, [r0, #28]
	add	r4, r4, r2
	sub	r4, r4, #1
	add	ip, ip, r4, asl #9
	mov	ip, ip, asl #1
	ldrh	r2, [r1, ip]
	cmp	r2, #0
	strne	r3, [r0, #4]
	b	.L236
.L246:
	.align	2
.L245:
	.word	collisionmapBitmap
	.size	idleMovement, .-idleMovement
	.align	2
	.global	updateKingJellyfish
	.type	updateKingJellyfish, %function
updateKingJellyfish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L257
	ldr	r2, [r4, #28]
	ldr	r3, [r4, #8]
	rsb	r2, r2, #0
	cmp	r3, r2
	blt	.L248
	cmp	r3, #160
	ble	.L254
.L248:
	mov	r3, #1
	str	r3, [r4, #64]
.L250:
	ldr	r3, .L257+4
	ldr	r3, [r3, #0]
	cmp	r3, #0
	ble	.L251
	ldr	r3, .L257+8
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L255
.L251:
	mov	r3, #-1241513984
	ldr	r2, [r4, #32]
	add	r3, r3, #745472
	add	r3, r3, #183
	smull	r1, r3, r2, r3
	mov	r1, r2, asr #31
	add	r3, r3, r2
	rsb	r3, r1, r3, asr #5
	add	r3, r3, r3, asl #1
	rsb	r3, r3, r3, asl #4
	cmp	r2, r3
	beq	.L256
.L253:
	mov	r3, #1
	ldr	r0, .L257
	ldr	r1, [r4, #68]
	str	r3, [r4, #16]
	str	r3, [r4, #20]
	bl	idleMovement
.L252:
	ldr	r3, .L257+12
	ldrh	r2, [r3, #0]
	ldr	r3, .L257+16
	ldr	r0, [r4, #0]
	ldrh	r3, [r3, #0]
	ldr	r1, [r4, #4]
	rsb	r2, r2, r0
	rsb	r3, r3, r1
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	ldmfd	sp!, {r4, lr}
	b	animateKingJellyfish
.L254:
	ldr	r2, [r4, #24]
	ldr	r3, [r4, #12]
	rsb	r2, r2, #0
	cmp	r3, r2
	blt	.L248
	cmp	r3, #240
	movle	r3, #0
	strle	r3, [r4, #64]
	ble	.L250
	b	.L248
.L256:
	ldr	r3, .L257+20
	mov	lr, pc
	bx	r3
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #30
	add	r0, r0, r3
	and	r0, r0, #3
	ldr	r2, .L257
	rsb	r3, r3, r0
	str	r3, [r2, #68]
	b	.L253
.L255:
	bl	chase
	b	.L252
.L258:
	.align	2
.L257:
	.word	kingJellyfish
	.word	numCaptured
	.word	cheat
	.word	vOff
	.word	hOff
	.word	rand
	.size	updateKingJellyfish, .-updateKingJellyfish
	.align	2
	.global	updateNoName
	.type	updateNoName, %function
updateNoName:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L268
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L259
	ldr	r2, [r4, #28]
	ldr	r3, [r4, #8]
	rsb	r2, r2, #0
	cmp	r3, r2
	bge	.L266
.L261:
	mov	r3, #1
	str	r3, [r4, #64]
.L263:
	ldr	r3, [r4, #32]
	ldr	r2, .L268+4
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	add	r2, r2, r3
	rsb	r2, r1, r2, asr #5
	rsb	r2, r2, r2, asl #4
	ldr	r5, .L268
	cmp	r3, r2, asl #2
	ldrne	r1, [r5, #68]
	beq	.L267
.L265:
	ldr	r0, .L268
	bl	idleMovement
	ldr	r3, .L268+8
	ldrh	r2, [r3, #0]
	ldr	r3, .L268+12
	ldr	r0, [r4, #0]
	ldrh	r3, [r3, #0]
	ldr	r1, [r4, #4]
	rsb	r2, r2, r0
	rsb	r3, r3, r1
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	ldmfd	sp!, {r4, r5, r6, lr}
	b	animateNoName
.L266:
	cmp	r3, #160
	bgt	.L261
	ldr	r2, [r4, #24]
	ldr	r3, [r4, #12]
	rsb	r2, r2, #0
	cmp	r3, r2
	blt	.L261
	cmp	r3, #240
	movle	r3, #0
	strle	r3, [r4, #64]
	ble	.L263
	b	.L261
.L259:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L267:
	ldr	r3, .L268+16
	mov	lr, pc
	bx	r3
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #30
	add	r1, r0, r3
	and	r1, r1, #3
	rsb	r1, r3, r1
	str	r1, [r5, #68]
	b	.L265
.L269:
	.align	2
.L268:
	.word	noName
	.word	-2004318071
	.word	vOff
	.word	hOff
	.word	rand
	.size	updateNoName, .-updateNoName
	.align	2
	.global	updateJellyfish
	.type	updateJellyfish, %function
updateJellyfish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, [r0, #52]
	cmp	r3, #0
	mov	r4, r0
	beq	.L270
	ldr	r2, [r0, #28]
	ldr	r3, [r0, #8]
	rsb	r2, r2, #0
	cmp	r3, r2
	bge	.L278
.L272:
	mov	r3, #1
	str	r3, [r4, #64]
.L274:
	ldr	r3, [r4, #32]
	ldr	r2, .L281
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	add	r2, r2, r3
	rsb	r2, r1, r2, asr #5
	rsb	r2, r2, r2, asl #4
	cmp	r3, r2, asl #2
	ldrne	r1, [r4, #68]
	beq	.L279
.L276:
	mov	r0, r4
	bl	idleMovement
	ldr	r6, .L281+4
	ldr	r5, [r4, #32]
	smull	r3, r6, r5, r6
	ldr	r2, .L281+8
	ldrh	r1, [r2, #0]
	ldr	r2, .L281+12
	mov	r3, r5, asr #31
	ldr	ip, [r4, #0]
	ldrh	r2, [r2, #0]
	ldr	r0, [r4, #4]
	rsb	r3, r3, r6, asr #3
	add	r3, r3, r3, asl #2
	rsb	r1, r1, ip
	rsb	r2, r2, r0
	cmp	r5, r3, asl #2
	str	r1, [r4, #8]
	str	r2, [r4, #12]
	beq	.L280
.L277:
	add	r5, r5, #1
	str	r5, [r4, #32]
.L270:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L280:
	add	r0, r4, #44
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r0, r0, #1
	ldr	r3, .L281+16
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
	b	.L277
.L278:
	cmp	r3, #160
	bgt	.L272
	ldr	r2, [r0, #24]
	ldr	r3, [r0, #12]
	rsb	r2, r2, #0
	cmp	r3, r2
	blt	.L272
	cmp	r3, #240
	movle	r3, #0
	strle	r3, [r0, #64]
	ble	.L274
	b	.L272
.L279:
	ldr	r3, .L281+20
	mov	lr, pc
	bx	r3
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #30
	add	r1, r0, r3
	and	r1, r1, #3
	rsb	r1, r3, r1
	str	r1, [r4, #68]
	b	.L276
.L282:
	.align	2
.L281:
	.word	-2004318071
	.word	1717986919
	.word	vOff
	.word	hOff
	.word	__aeabi_idivmod
	.word	rand
	.size	updateJellyfish, .-updateJellyfish
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	bl	updatePlayer
	ldr	r5, .L286
	mov	r4, #0
.L284:
	add	r0, r4, r4, asl #3
	add	r0, r5, r0, asl #3
	add	r4, r4, #1
	bl	updateJellyfish
	cmp	r4, #10
	bne	.L284
	bl	updateKingJellyfish
	bl	updateNoName
	ldr	r3, .L286+4
	ldr	r2, .L286+8
	ldrh	ip, [r3, #0]
	ldr	r3, .L286+12
	ldr	r0, [r2, #0]
	ldrh	r1, [r3, #0]
	sub	r0, r0, #1
	mov	r3, #67108864
	strh	ip, [r3, #22]	@ movhi
	str	r0, [r2, #0]
	strh	r1, [r3, #20]	@ movhi
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L287:
	.align	2
.L286:
	.word	jellyfishes
	.word	vOff
	.word	time
	.word	hOff
	.size	updateGame, .-updateGame
	.global	ghost_blend
	.comm	shadowOAM,1024,4
	.comm	player,72,4
	.comm	kingJellyfish,72,4
	.comm	jellyfishes,720,4
	.comm	noName,72,4
	.comm	score,4,4
	.comm	numCaptured,4,4
	.comm	time,4,4
	.comm	changeBlending,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	ghost_blend, %object
	.size	ghost_blend, 4
ghost_blend:
	.word	16
	.ident	"GCC: (devkitARM release 31) 4.5.0"
