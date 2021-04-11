################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMCM0.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMCM23.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMCM3.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMCM33.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMCM4.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMCM7.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMSC000.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMSC300.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMv8MBL.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMv8MML.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_generic.c 

S_UPPER_SRCS += \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/startup_generic.S 

OBJS += \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/startup_generic.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMCM0.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMCM23.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMCM3.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMCM33.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMCM4.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMCM7.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMSC000.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMSC300.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMv8MBL.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMv8MML.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_generic.o 

S_UPPER_DEPS += \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/startup_generic.d 

C_DEPS += \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMCM0.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMCM23.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMCM3.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMCM33.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMCM4.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMCM7.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMSC000.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMSC300.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMv8MBL.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_ARMv8MML.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/system_generic.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/%.o: ../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L476xx -I"D:/微處理機project/final/Core/Inc" -I"D:/微處理機project/final/Drivers/STM32L4xx_HAL_Driver/Inc" -I"D:/微處理機project/final/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"D:/微處理機project/final/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"D:/微處理機project/final/Drivers/CMSIS/Include"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/%.o: ../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/platform/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L476xx -I"D:/微處理機project/final/Core/Inc" -I"D:/微處理機project/final/Drivers/STM32L4xx_HAL_Driver/Inc" -I"D:/微處理機project/final/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"D:/微處理機project/final/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"D:/微處理機project/final/Drivers/CMSIS/Include"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


