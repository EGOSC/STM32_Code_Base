#include <stdint.h>

// External symbols defined in the linker script
extern unsigned int _sidata; // Start address for the initialization values of the .data section
extern unsigned int _sdata;  // Start address for the .data section
extern unsigned int _edata;  // End address for the .data section
extern unsigned int _sbss;   // Start address for the .bss section
extern unsigned int _ebss;   // End address for the .bss section
extern unsigned int _estack; // End of stack address

// Function prototypes
void __libc_init_array(void);
int main(void);

// Default handler for unimplemented interrupts
void Default_Handler(void) {
    while (1) {
        // Infinite loop
    }
}

// This function sets the Main Stack Pointer (MSP)
void __set_MSP(unsigned int topOfMainStack) {
    __asm volatile("msr msp, %0" : : "r" (topOfMainStack));
}

// Reset handler
void Reset_Handler(void) {
    unsigned int *pSrc, *pDest;

    // Initialize the stack pointer
    //__set_MSP((unsigned int)&_estack);


    // Copy the data segment initializers from flash to SRAM
    pSrc = &_sidata;
    for (pDest = &_sdata; pDest < &_edata;) {
        *pDest++ = *pSrc++;
    }

    // Zero fill the .bss segment
    for (pDest = &_sbss; pDest < &_ebss;) {
        *pDest++ = 0;
    }

    // Call the C library initialization function
    __libc_init_array();

    // Call the main function
    main();

    // Infinite loop
    while (1) {
        // Infinite loop
    }
}

// Vector table
__attribute__((section(".isr_vector")))
const unsigned int g_pfnVectors[] = {
    (unsigned int)&_estack,         // Initial stack pointer
    (unsigned int)Reset_Handler,    // Reset handler
    (unsigned int)Default_Handler,  // NMI handler
    (unsigned int)Default_Handler,  // Hard fault handler
    0, 0, 0, 0, 0, 0, 0,        // Reserved
    (unsigned int)Default_Handler,  // SVC handler
    0, 0,                       // Reserved
    (unsigned int)Default_Handler,  // PendSV handler
    (unsigned int)Default_Handler,  // SysTick handler
    (unsigned int)Default_Handler,  // Window WatchDog
    0,                          // Reserved
    (unsigned int)Default_Handler,  // RTC through the EXTI line
    (unsigned int)Default_Handler,  // FLASH
    (unsigned int)Default_Handler,  // RCC
    (unsigned int)Default_Handler,  // EXTI Line 0 and 1
    (unsigned int)Default_Handler,  // EXTI Line 2 and 3
    (unsigned int)Default_Handler,  // EXTI Line 4 to 15
    0,                          // Reserved
    (unsigned int)Default_Handler,  // DMA1 Channel 1
    (unsigned int)Default_Handler,  // DMA1 Channel 2 and Channel 3
    (unsigned int)Default_Handler,  // DMA1 Channel 4 and Channel 5
    (unsigned int)Default_Handler,  // ADC1
    (unsigned int)Default_Handler,  // TIM1 Break, Update, Trigger and Commutation
    (unsigned int)Default_Handler,  // TIM1 Capture Compare
    0,                          // Reserved
    (unsigned int)Default_Handler,  // TIM3
    (unsigned int)Default_Handler,  // TIM6
    (unsigned int)Default_Handler,  // TIM7
    (unsigned int)Default_Handler,  // TIM14
    (unsigned int)Default_Handler,  // TIM15
    (unsigned int)Default_Handler,  // TIM16
    (unsigned int)Default_Handler,  // TIM17
    (unsigned int)Default_Handler,  // I2C1
    (unsigned int)Default_Handler,  // I2C2
    (unsigned int)Default_Handler,  // SPI1
    (unsigned int)Default_Handler,  // SPI2
    (unsigned int)Default_Handler,  // USART1
    (unsigned int)Default_Handler,  // USART2
    (unsigned int)Default_Handler,  // USART3 and USART4
    0,                          // Reserved
    (unsigned int)Default_Handler,  // USB
};

// Weak aliases for interrupt handlers to the Default_Handler
void NMI_Handler(void) __attribute__ ((weak, alias("Default_Handler")));
void HardFault_Handler(void) __attribute__ ((weak, alias("Default_Handler")));
void SVC_Handler(void) __attribute__ ((weak, alias("Default_Handler")));
void PendSV_Handler(void) __attribute__ ((weak, alias("Default_Handler")));
void SysTick_Handler(void) __attribute__ ((weak, alias("Default_Handler")));
void WWDG_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void RTC_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void FLASH_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void RCC_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void EXTI0_1_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void EXTI2_3_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void EXTI4_15_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void DMA1_Channel1_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void DMA1_Channel2_3_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void DMA1_Channel4_5_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void ADC1_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void TIM1_BRK_UP_TRG_COM_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void TIM1_CC_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void TIM3_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void TIM6_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void TIM7_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void TIM14_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void TIM15_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void TIM16_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void TIM17_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void I2C1_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void I2C2_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void SPI1_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void SPI2_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void USART1_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void USART2_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void USART3_4_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));
void USB_IRQHandler(void) __attribute__ ((weak, alias("Default_Handler")));