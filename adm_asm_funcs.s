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
