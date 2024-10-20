CC= arm-none-eabi-gcc
MACH= cortex-m0
CFLAGS= -save-temps=obj -c -mcpu=$(MACH) -mthumb -std=gnu11 -O0 
OBJS= ./Build/startup_stm32f070rbtx.o ./Build/main.o 
LINKER_SCRIPTS= ./STM32F070RBTX_FLASH.ld



./Build/startup_stm32f070rbtx.o: ./startup_stm32f070rbtx.s
	$(CC) $(CFLAGS) -o $@ -c $^


./Build/main.o: ./main.c
	$(CC) $(CFLAGS) -o $@ $^
	
make_Build:
	$(shell mkdir -p Build)
	
clean:   	                        	
	rm -rf *.elf *.map ./Build 
	
all: make_Build Build.elf
	
debug: make_Temps Debug_Build.elf

Build.elf: $(OBJS) $(LINKER_SCRIPTS)
	$(CC) -o Build.elf $(OBJS) -mthumb -Wl,-Map="Build.map" -mcpu=cortex-m0plus -T"./STM32F070RBTX_FLASH.ld"
load:
	openocd -f board/atmel_samd21_xplained_pro.cfg
	
	
