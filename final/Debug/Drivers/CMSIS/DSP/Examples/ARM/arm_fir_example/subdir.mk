################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/CMSIS/DSP/Examples/ARM/arm_fir_example/arm_fir_data.c \
../Drivers/CMSIS/DSP/Examples/ARM/arm_fir_example/arm_fir_example_f32.c \
../Drivers/CMSIS/DSP/Examples/ARM/arm_fir_example/math_helper.c 

OBJS += \
./Drivers/CMSIS/DSP/Examples/ARM/arm_fir_example/arm_fir_data.o \
./Drivers/CMSIS/DSP/Examples/ARM/arm_fir_example/arm_fir_example_f32.o \
./Drivers/CMSIS/DSP/Examples/ARM/arm_fir_example/math_helper.o 

C_DEPS += \
./Drivers/CMSIS/DSP/Examples/ARM/arm_fir_example/arm_fir_data.d \
./Drivers/CMSIS/DSP/Examples/ARM/arm_fir_example/arm_fir_example_f32.d \
./Drivers/CMSIS/DSP/Examples/ARM/arm_fir_example/math_helper.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/DSP/Examples/ARM/arm_fir_example/%.o: ../Drivers/CMSIS/DSP/Examples/ARM/arm_fir_example/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L476xx -I"D:/微處理機project/final/Core/Inc" -I"D:/微處理機project/final/Drivers/STM32L4xx_HAL_Driver/Inc" -I"D:/微處理機project/final/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"D:/微處理機project/final/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"D:/微處理機project/final/Drivers/CMSIS/Include"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


