CC= arm-none-eabi-gcc
MACH= cortex-m4
CFLAGS= -save-temps=obj -c -mcpu=$(MACH) -mthumb -std=gnu11 -O0 -lc -lgcc
OBJS= ./Build/startup.o ./Build/main.o 
LINKER_SCRIPTS= ./STM32F303VCTX_FLASH.ld

EXECUTABLES += \
LED_Blink.elf \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
LED_Blink.list \

./Build/startup.o: ./startup.c
	$(CC) $(CFLAGS) -o $@ $^
	@echo ' '


./Build/main.o: ./main.c
	$(CC) $(CFLAGS) -o $@ $^
	@echo ' '
	
make_Build:
	$(shell mkdir -p Build)
	
clean:   	                        	
	rm -rf *.elf *.map ./Build 	
	
default.size.stdout: $(EXECUTABLES) makefile $(OBJS) $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo ' '

LED_Blink.list: $(EXECUTABLES) makefile $(OBJS) $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "LED_Blink.list"
	@echo 'Finished dumping the objects in : $@'
	@echo ' '
	
all: make_Build $(EXECUTABLES) default.size.stdout LED_Blink.list
	@echo 'Finished building all the files'
	
LED_Blink.elf: $(OBJS) $(LINKER_SCRIPTS)
	$(CC) -o $(EXECUTABLES) $(OBJS) -mthumb -Wl,-Map="LED_Blink.map" -mcpu=cortex-m4 -T"./STM32F303VCTX_FLASH.ld"
	@echo ' '
	
load:
	openocd -f board/atmel_samd21_xplained_pro.cfg
	
	
