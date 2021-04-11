################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/CMSIS/RTOS2/Template/cmsis_os1.c 

OBJS += \
./Drivers/CMSIS/RTOS2/Template/cmsis_os1.o 

C_DEPS += \
./Drivers/CMSIS/RTOS2/Template/cmsis_os1.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/RTOS2/Template/%.o: ../Drivers/CMSIS/RTOS2/Template/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L476xx -I"D:/微處理機project/final/Core/Inc" -I"D:/微處理機project/final/Drivers/STM32L4xx_HAL_Driver/Inc" -I"D:/微處理機project/final/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"D:/微處理機project/final/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"D:/微處理機project/final/Drivers/CMSIS/Include"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


