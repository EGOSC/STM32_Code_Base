################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################


RM := rm -rf

# All of the sources participating in the build are defined here

-include Drivers/STM32F0xx_HAL_Driver/Src/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk

SUBDIRS := \
Core/Src \
Core/Startup \
Drivers/STM32F0xx_HAL_Driver/Src \


BUILD_ARTIFACT_NAME := LED_Blink_Test
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
LED_Blink_Test.elf \

MAP_FILES += \
LED_Blink_Test.map \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
LED_Blink_Test.list \


# All Target
all: main-build

# Main-build Target
main-build: LED_Blink_Test.elf secondary-outputs

# Tool invocations
LED_Blink_Test.elf LED_Blink_Test.map: $(OBJS) $(USER_OBJS) ..\STM32F070RBTX_FLASH.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-gcc -o "LED_Blink_Test.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m0 -T"..\STM32F070RBTX_FLASH.ld" --specs=nosys.specs -Wl,-Map="LED_Blink_Test.map" -Wl,--gc-sections -static --specs=nano.specs -mfloat-abi=soft -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

LED_Blink_Test.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "LED_Blink_Test.list"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) LED_Blink_Test.elf LED_Blink_Test.list LED_Blink_Test.map default.size.stdout
	-@echo ' '
secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST)
