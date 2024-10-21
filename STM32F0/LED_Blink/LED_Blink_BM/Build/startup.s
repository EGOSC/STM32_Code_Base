	.cpu cortex-m0
	.arch armv6s-m
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"startup.c"
	.text
	.align	1
	.global	Default_Handler
	.syntax unified
	.code	16
	.thumb_func
	.type	Default_Handler, %function
Default_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
.L2:
	b	.L2
	.size	Default_Handler, .-Default_Handler
	.weak	USB_IRQHandler
	.thumb_set USB_IRQHandler,Default_Handler
	.weak	USART3_4_IRQHandler
	.thumb_set USART3_4_IRQHandler,Default_Handler
	.weak	USART2_IRQHandler
	.thumb_set USART2_IRQHandler,Default_Handler
	.weak	USART1_IRQHandler
	.thumb_set USART1_IRQHandler,Default_Handler
	.weak	SPI2_IRQHandler
	.thumb_set SPI2_IRQHandler,Default_Handler
	.weak	SPI1_IRQHandler
	.thumb_set SPI1_IRQHandler,Default_Handler
	.weak	I2C2_IRQHandler
	.thumb_set I2C2_IRQHandler,Default_Handler
	.weak	I2C1_IRQHandler
	.thumb_set I2C1_IRQHandler,Default_Handler
	.weak	TIM17_IRQHandler
	.thumb_set TIM17_IRQHandler,Default_Handler
	.weak	TIM16_IRQHandler
	.thumb_set TIM16_IRQHandler,Default_Handler
	.weak	TIM15_IRQHandler
	.thumb_set TIM15_IRQHandler,Default_Handler
	.weak	TIM14_IRQHandler
	.thumb_set TIM14_IRQHandler,Default_Handler
	.weak	TIM7_IRQHandler
	.thumb_set TIM7_IRQHandler,Default_Handler
	.weak	TIM6_IRQHandler
	.thumb_set TIM6_IRQHandler,Default_Handler
	.weak	TIM3_IRQHandler
	.thumb_set TIM3_IRQHandler,Default_Handler
	.weak	TIM1_CC_IRQHandler
	.thumb_set TIM1_CC_IRQHandler,Default_Handler
	.weak	TIM1_BRK_UP_TRG_COM_IRQHandler
	.thumb_set TIM1_BRK_UP_TRG_COM_IRQHandler,Default_Handler
	.weak	ADC1_IRQHandler
	.thumb_set ADC1_IRQHandler,Default_Handler
	.weak	DMA1_Channel4_5_IRQHandler
	.thumb_set DMA1_Channel4_5_IRQHandler,Default_Handler
	.weak	DMA1_Channel2_3_IRQHandler
	.thumb_set DMA1_Channel2_3_IRQHandler,Default_Handler
	.weak	DMA1_Channel1_IRQHandler
	.thumb_set DMA1_Channel1_IRQHandler,Default_Handler
	.weak	EXTI4_15_IRQHandler
	.thumb_set EXTI4_15_IRQHandler,Default_Handler
	.weak	EXTI2_3_IRQHandler
	.thumb_set EXTI2_3_IRQHandler,Default_Handler
	.weak	EXTI0_1_IRQHandler
	.thumb_set EXTI0_1_IRQHandler,Default_Handler
	.weak	RCC_IRQHandler
	.thumb_set RCC_IRQHandler,Default_Handler
	.weak	FLASH_IRQHandler
	.thumb_set FLASH_IRQHandler,Default_Handler
	.weak	RTC_IRQHandler
	.thumb_set RTC_IRQHandler,Default_Handler
	.weak	WWDG_IRQHandler
	.thumb_set WWDG_IRQHandler,Default_Handler
	.weak	SysTick_Handler
	.thumb_set SysTick_Handler,Default_Handler
	.weak	PendSV_Handler
	.thumb_set PendSV_Handler,Default_Handler
	.weak	SVC_Handler
	.thumb_set SVC_Handler,Default_Handler
	.weak	HardFault_Handler
	.thumb_set HardFault_Handler,Default_Handler
	.weak	NMI_Handler
	.thumb_set NMI_Handler,Default_Handler
	.align	1
	.global	__set_MSP
	.syntax unified
	.code	16
	.thumb_func
	.type	__set_MSP, %function
__set_MSP:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	.syntax divided
@ 24 "startup.c" 1
	msr msp, r3
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
	.size	__set_MSP, .-__set_MSP
	.align	1
	.global	Reset_Handler
	.syntax unified
	.code	16
	.thumb_func
	.type	Reset_Handler, %function
Reset_Handler:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	ldr	r3, .L10
	str	r3, [r7, #4]
	ldr	r3, .L10+4
	str	r3, [r7]
	b	.L5
.L6:
	ldr	r2, [r7, #4]
	adds	r3, r2, #4
	str	r3, [r7, #4]
	ldr	r3, [r7]
	adds	r1, r3, #4
	str	r1, [r7]
	ldr	r2, [r2]
	str	r2, [r3]
.L5:
	ldr	r2, [r7]
	ldr	r3, .L10+8
	cmp	r2, r3
	bcc	.L6
	ldr	r3, .L10+12
	str	r3, [r7]
	b	.L7
.L8:
	ldr	r3, [r7]
	adds	r2, r3, #4
	str	r2, [r7]
	movs	r2, #0
	str	r2, [r3]
.L7:
	ldr	r2, [r7]
	ldr	r3, .L10+16
	cmp	r2, r3
	bcc	.L8
	bl	__libc_init_array
	bl	main
.L9:
	b	.L9
.L11:
	.align	2
.L10:
	.word	_sidata
	.word	_sdata
	.word	_edata
	.word	_sbss
	.word	_ebss
	.size	Reset_Handler, .-Reset_Handler
	.global	g_pfnVectors
	.section	.isr_vector,"a"
	.align	2
	.type	g_pfnVectors, %object
	.size	g_pfnVectors, 192
g_pfnVectors:
	.word	_estack
	.word	Reset_Handler
	.word	Default_Handler
	.word	Default_Handler
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	Default_Handler
	.word	0
	.word	0
	.word	Default_Handler
	.word	Default_Handler
	.word	Default_Handler
	.word	0
	.word	Default_Handler
	.word	Default_Handler
	.word	Default_Handler
	.word	Default_Handler
	.word	Default_Handler
	.word	Default_Handler
	.word	0
	.word	Default_Handler
	.word	Default_Handler
	.word	Default_Handler
	.word	Default_Handler
	.word	Default_Handler
	.word	Default_Handler
	.word	0
	.word	Default_Handler
	.word	Default_Handler
	.word	Default_Handler
	.word	Default_Handler
	.word	Default_Handler
	.word	Default_Handler
	.word	Default_Handler
	.word	Default_Handler
	.word	Default_Handler
	.word	Default_Handler
	.word	Default_Handler
	.word	Default_Handler
	.word	Default_Handler
	.word	Default_Handler
	.word	0
	.word	Default_Handler
	.ident	"GCC: (GNU Arm Embedded Toolchain 10.3-2021.10) 10.3.1 20210824 (release)"
