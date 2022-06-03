	.arch armv7e-m
	.fpu fpv4-sp-d16
	.eabi_attribute 27, 1
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"adm_asm_funcs.s"
	.text
	.align	1
	.global	zeros_asm
	.syntax unified
	.thumb
	.thumb_func
	.type	zeros_asm, %function
zeros_asm:
	mov r2, 0
.zeros_asm_L1:
	str r2, [r0], 4
	subs r1, 1
	bne .zeros_asm_L1
	bx	lr
	.size	zeros_asm, .-zeros_asm

@-------------------------------------------------
	.align	2
	.global	productoEscalar32_asm
	.type	productoEscalar32_asm, %function
productoEscalar32_asm:
	push {r4}
.productoEscalar32_asm_L1:
	ldr	r4, [r0], 4 	@r4 = *r0; r0 += 4;
	mul r4, r4, r3
	str	r4, [r1], 4
	subs r2, 1
	bne .productoEscalar32_asm_L1
	pop {r4}
	bx	lr
	.size	productoEscalar32_asm, .-productoEscalar32_asm

@---------------------------------------------------
	.align	2
	.global	productoEscalar16_asm
	.type	productoEscalar16_asm, %function
productoEscalar16_asm:
	push {r4}
.productoEscalar16_asm_L1:
	ldrh	r4, [r0], 2
	mul 	r4, r4, r3
	strh	r4, [r1], 2
	subs r2, 1
	bne .productoEscalar16_asm_L1
	pop {r4}
	bx	lr
	.size	productoEscalar16_asm, .-productoEscalar16_asm

@---------------------------------------------------
	.align	2
	.global	productoEscalar12_asm
	.type	productoEscalar12_asm, %function
productoEscalar12_asm:
	push {r4-r5}
	mov r5, #0x0FFF
.productoEscalar12_asm_L1:
	ldrh	r4, [r0], #2
	mul 	r4, r4, r3
	usat	r4, 12, r4	@unsigned sat a 12 bits.
	strh	r4, [r1], #2
	subs r2, 1
	bne .productoEscalar12_asm_L1
	pop {r4-r5}
	bx	lr
	.size	productoEscalar12_asm, .-productoEscalar12_asm

@---------------------------------------------------
	.align	2
	.global	filtroVentana10_asm
	.type	filtroVentana10_asm, %function
filtroVentana10_asm:
	push 	{r4-r6}
	push	{r7}		@Syscall number
	sub		sp, sp, #28
	add		r7,	sp,	#0
	str		r0, [r7, #0]	@vectorIn
	str		r1, [r7, #4]	@vectorOut
	str		r2, [r7, #8]	@long
	mov		r3, #10
	str		r3, [r7, #12]	@windowSize
	mov		r3, #0
	str		r3, [r7, #16]	@windowIdx
	mov		r3, #0
	str		r3, [r7, #20]	@i
.filtroVentana10_asm_L1:
	mov		r3, #0
	str		r3, [r7, #24]	@j
.filtroVentana10_asm_L2:
	ldrb	r2, [r7, #16]
	ldr		r3, [r7, #20]
	ldr		r4, [r7, #24]
	add		r2, r3, r4
	strb	r2, [r7, #16]
.filtroVentana10_asm_L3:
	ldrb	r2, [r7, #16]
	ldr		r3, [r7, #8]
	cmp 	r2, r3
	blt		.filtroVentana10_asm_L4
	sub		r2, r2, r3
	strb	r2, [r7, #16]
	b		.filtroVentana10_asm_L3
.filtroVentana10_asm_L4:
	ldr		r2, [r7, #4]
	ldr		r3, [r7, #20]
	ldrh	r4, [r2, r3, lsl #1]
	ldr 	r5, [r7, #0]
	ldr 	r6, [r7, #16]
	ldrh	r5, [r5, r6, lsl #1]
	add		r4, r4, r5
	strh	r4, [r2, r3, lsl #1]
	ldr		r2, [r7, #24]
	add		r2, r2, #1
	str		r2, [r7, #24]
	ldr		r3, [r7, #12]
	cmp		r2, r3
	blt		.filtroVentana10_asm_L2
	ldr		r2, [r7, #4]
	ldr		r3, [r7, #20]
	ldrh	r4, [r2, r3, lsl #1]
	ldr 	r5, [r7, #12]
	udiv	r4, r4, r5
	strh	r4, [r2, r3, lsl #1]
	ldr		r2, [r7, #20]
	add		r2, r2, #1
	str		r2, [r7, #20]
	ldr		r3, [r7, #8]
	cmp		r2, r3
	blt		.filtroVentana10_asm_L1
	add		r7, r7, #28
	mov		sp, r7
	pop 	{r7}
	pop		{r4-r6}
	bx		lr
	.size	filtroVentana10_asm, .-filtroVentana10_asm

@---------------------------------------------------
	.align	2
	.global	pack32to16_asm
	.type	pack32to16_asm, %function
pack32to16_asm:
	push	{r7}		@Syscall number
	sub		sp, sp, #16
	add		r7,	sp,	#0
	str		r0, [r7, #0]	@vectorIn
	str		r1, [r7, #4]	@vectorOut
	str		r2, [r7, #8]	@long
	mov		r3, #0
	str		r3, [r7, #12]	@i
.pack32to16_asm_L1:
	ldr		r2, [r7, #12]
	ldrh	r3, [r0, r2, lsl #2]
	strh	r3, [r1, r2, lsl #1]
	ldr		r2, [r7, #12]
	add		r2, r2, #1
	str		r2, [r7, #12]
	ldr		r3, [r7, #8]
	cmp		r2, r3
	blt		.pack32to16_asm_L1
	add		r7, r7, #16
	mov		sp, r7
	pop 	{r7}
	bx		lr
	.size	pack32to16_asm, .-pack32to16_asm

@---------------------------------------------------
	.align	2
	.global	max_asm
	.type	max_asm, %function
max_asm:
	push	{r4-r6}
	push	{r7}		@Syscall number
	sub		sp, sp, #16
	add		r7,	sp,	#0
	str		r0, [r7, #0]	@vectorIn
	str		r1, [r7, #4]	@long
	mov		r3, #0
	str		r3, [r7, #8]	@ret
	str		r3, [r7, #12]	@i
.max_asm_L1:
	ldr		r2, [r7, #12]
	cmp		r2, #0
	bne		.max_asm_L2
	ldr		r3, [r7, #0]
	ldr		r3, [r3]
	str		r3, [r7, #8]
	b		.max_asm_L3
.max_asm_L2:
	ldr		r3, [r7, #0]
	ldr		r4, [r7, #12]
	ldr		r5, [r3, r4, lsl #2]
	ldr		r6, [r7, #8]
	cmp		r5, r6
	blt		.max_asm_L3
	str		r5, [r7, #8]
.max_asm_L3:
	ldr		r2, [r7, #12]
	add		r2, r2, #1
	str		r2, [r7, #12]
	ldr		r3, [r7, #8]
	cmp		r2, r3
	blt		.max_asm_L1
	ldr		r0, [r7, #8]
	add		r7, r7, #16
	mov		sp, r7
	pop 	{r7}
	pop		{r4-r6}
	bx		lr
	.size	max_asm, .-max_asm

@---------------------------------------------------
	.align	2
	.global	downsampleM_asm
	.type	downsampleM_asm, %function
downsampleM_asm:
	push 	{r4-r5}
	push	{r7}		@Syscall number
	sub		sp, sp, #24
	add		r7,	sp,	#0
	str		r0, [r7, #0]	@vectorIn
	str		r1, [r7, #4]	@vectorOut
	str		r2, [r7, #8]	@long
	str		r3, [r7, #12]	@N
	mov		r3, #0
	str		r3, [r7, #16]	@count
	str		r3, [r7, #20]	@i
.downsampleM_asm_L1:
	ldr		r2, [r7, #20]
	ldr		r3, [r7, #8]
	cmp		r2, r3
	bge		.downsampleM_asm_L2
	ldr		r2, [r7, #20]
	add		r2, r2, #1
	ldr		r3, [r7, #12]
	ands	r2, r2, r3
	bne		.downsampleM_asm_L3
	ldr		r2, [r7, #16]
	add		r2, r2, #1
	str		r2, [r7, #16]
	b		.downsampleM_asm_L4
.downsampleM_asm_L3:
	ldr		r2, [r7, #20]
	ldr		r3, [r7, #0]
	ldr		r4, [r7, #16]
	ldr		r5, [r7, #4]
	ldr		r3, [r3, r2, lsl #2]
	sub		r2, r2, r4
	str		r3, [r5, r2, lsl #2]
.downsampleM_asm_L4:
	ldr		r2, [r7, #20]
	add		r2, r2, #1
	str		r2, [r7, #20]
	b		.downsampleM_asm_L1
.downsampleM_asm_L2:
	add		r7, r7, #24
	mov		sp, r7
	pop 	{r7}
	pop 	{r4-r5}
	bx		lr
	.size	downsampleM_asm, .-downsampleM_asm

@---------------------------------------------------
	.align	2
	.global	invertir_asm
	.type	invertir_asm, %function
invertir_asm:
	push 	{r4-r6}
	push	{r7}		@Syscall number
	sub		sp, sp, #16
	add		r7,	sp,	#0
	str		r0, [r7, #0]	@vectorIn
	str		r1, [r7, #4]	@long
	mov		r3, #0
	str		r3, [r7, #8]	@aux
	str		r3, [r7, #12]	@i
.invertir_asm_L1:
	ldr		r2, [r7, #12]
	ldr		r3, [r7, #4]
	mov		r6, #2
	udiv	r3, r3, r6
	cmp		r2, r3
	bge		.invertir_asm_L2
	ldr		r2, [r7, #0]
	ldr		r3, [r7, #12]
	ldrh	r4, [r2, r3, lsl #1]
	strh	r4, [r7, #8]
	ldr		r5, [r7, #4]
	sub		r5, r5, #1
	sub		r5, r5, r3
	ldrh	r6, [r2, r5, lsl #1]
	strh	r6, [r2, r3, lsl #1]
	ldrh	r6, [r7, #8]
	strh	r6, [r2, r5, lsl #1]
	ldr		r2, [r7, #12]
	add		r2, r2, #1
	str		r2, [r7, #12]
	b		.invertir_asm_L1
.invertir_asm_L2:
	add		r7, r7, #16
	mov		sp, r7
	pop 	{r7}
	pop 	{r4-r6}
	bx		lr
	.size	invertir_asm, .-invertir_asm
