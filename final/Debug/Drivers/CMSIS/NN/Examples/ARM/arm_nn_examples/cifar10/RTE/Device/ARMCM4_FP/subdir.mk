################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Drivers/CMSIS/NN/Examples/ARM/arm_nn_examples/cifar10/RTE/Device/ARMCM4_FP/startup_ARMCM4.s 

C_SRCS += \
../Drivers/CMSIS/NN/Examples/ARM/arm_nn_examples/cifar10/RTE/Device/ARMCM4_FP/system_ARMCM4.c 

OBJS += \
./Drivers/CMSIS/NN/Examples/ARM/arm_nn_examples/cifar10/RTE/Device/ARMCM4_FP/startup_ARMCM4.o \
./Drivers/CMSIS/NN/Examples/ARM/arm_nn_examples/cifar10/RTE/Device/ARMCM4_FP/system_ARMCM4.o 

C_DEPS += \
./Drivers/CMSIS/NN/Examples/ARM/arm_nn_examples/cifar10/RTE/Device/ARMCM4_FP/system_ARMCM4.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/NN/Examples/ARM/arm_nn_examples/cifar10/RTE/Device/ARMCM4_FP/%.o: ../Drivers/CMSIS/NN/Examples/ARM/arm_nn_examples/cifar10/RTE/Device/ARMCM4_FP/%.s
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Assembler'
	@echo $(PWD)
	arm-none-eabi-as -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -g -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/CMSIS/NN/Examples/ARM/arm_nn_examples/cifar10/RTE/Device/ARMCM4_FP/%.o: ../Drivers/CMSIS/NN/Examples/ARM/arm_nn_examples/cifar10/RTE/Device/ARMCM4_FP/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L476xx -I"D:/微處理機project/final/Core/Inc" -I"D:/微處理機project/final/Drivers/STM32L4xx_HAL_Driver/Inc" -I"D:/微處理機project/final/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"D:/微處理機project/final/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"D:/微處理機project/final/Drivers/CMSIS/Include"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


