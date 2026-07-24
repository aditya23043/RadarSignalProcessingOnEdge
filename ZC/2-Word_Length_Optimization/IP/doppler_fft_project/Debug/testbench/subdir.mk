################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../doppler_fft_tb.cpp 

OBJS += \
./testbench/doppler_fft_tb.o 

CPP_DEPS += \
./testbench/doppler_fft_tb.d 


# Each subdirectory must supply rules for building sources it contributes
testbench/doppler_fft_tb.o: C:/Users/nadis/AppData/Roaming/Xilinx/Vitis/doppler_fft_project/doppler_fft_tb.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DAESL_TB -D__llvm__ -D__llvm__ -IC:/Xilinx/Vitis_HLS/2022.1/include -IC:/Users/nadis/AppData/Roaming/Xilinx/Vitis -IC:/Xilinx/Vitis_HLS/2022.1/win64/tools/systemc/include -IC:/Xilinx/Vitis_HLS/2022.1/include/ap_sysc -IC:/Xilinx/Vitis_HLS/2022.1/include/etc -IC:/Xilinx/Vitis_HLS/2022.1/win64/tools/auto_cc/include -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


