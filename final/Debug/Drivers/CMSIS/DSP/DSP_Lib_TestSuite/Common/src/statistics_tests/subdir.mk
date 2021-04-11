################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/max_tests.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/mean_tests.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/min_tests.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/power_tests.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/rms_tests.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/statistics_test_common_data.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/statistics_test_group.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/std_tests.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/var_tests.c 

OBJS += \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/max_tests.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/mean_tests.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/min_tests.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/power_tests.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/rms_tests.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/statistics_test_common_data.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/statistics_test_group.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/std_tests.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/var_tests.o 

C_DEPS += \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/max_tests.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/mean_tests.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/min_tests.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/power_tests.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/rms_tests.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/statistics_test_common_data.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/statistics_test_group.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/std_tests.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/var_tests.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/%.o: ../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L476xx -I"D:/微處理機project/final/Core/Inc" -I"D:/微處理機project/final/Drivers/STM32L4xx_HAL_Driver/Inc" -I"D:/微處理機project/final/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"D:/微處理機project/final/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"D:/微處理機project/final/Drivers/CMSIS/Include"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


