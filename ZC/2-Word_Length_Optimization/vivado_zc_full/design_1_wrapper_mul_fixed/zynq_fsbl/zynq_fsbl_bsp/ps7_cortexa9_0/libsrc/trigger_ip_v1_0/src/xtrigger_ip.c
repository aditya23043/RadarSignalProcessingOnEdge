// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xtrigger_ip.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XTrigger_ip_CfgInitialize(XTrigger_ip *InstancePtr, XTrigger_ip_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XTrigger_ip_Start(XTrigger_ip *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTrigger_ip_ReadReg(InstancePtr->Control_BaseAddress, XTRIGGER_IP_CONTROL_ADDR_AP_CTRL) & 0x80;
    XTrigger_ip_WriteReg(InstancePtr->Control_BaseAddress, XTRIGGER_IP_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XTrigger_ip_IsDone(XTrigger_ip *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTrigger_ip_ReadReg(InstancePtr->Control_BaseAddress, XTRIGGER_IP_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XTrigger_ip_IsIdle(XTrigger_ip *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTrigger_ip_ReadReg(InstancePtr->Control_BaseAddress, XTRIGGER_IP_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XTrigger_ip_IsReady(XTrigger_ip *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTrigger_ip_ReadReg(InstancePtr->Control_BaseAddress, XTRIGGER_IP_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XTrigger_ip_EnableAutoRestart(XTrigger_ip *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTrigger_ip_WriteReg(InstancePtr->Control_BaseAddress, XTRIGGER_IP_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XTrigger_ip_DisableAutoRestart(XTrigger_ip *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTrigger_ip_WriteReg(InstancePtr->Control_BaseAddress, XTRIGGER_IP_CONTROL_ADDR_AP_CTRL, 0);
}

void XTrigger_ip_Set_sync_reset(XTrigger_ip *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTrigger_ip_WriteReg(InstancePtr->Control_BaseAddress, XTRIGGER_IP_CONTROL_ADDR_SYNC_RESET_DATA, Data);
}

u32 XTrigger_ip_Get_sync_reset(XTrigger_ip *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTrigger_ip_ReadReg(InstancePtr->Control_BaseAddress, XTRIGGER_IP_CONTROL_ADDR_SYNC_RESET_DATA);
    return Data;
}

void XTrigger_ip_InterruptGlobalEnable(XTrigger_ip *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTrigger_ip_WriteReg(InstancePtr->Control_BaseAddress, XTRIGGER_IP_CONTROL_ADDR_GIE, 1);
}

void XTrigger_ip_InterruptGlobalDisable(XTrigger_ip *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTrigger_ip_WriteReg(InstancePtr->Control_BaseAddress, XTRIGGER_IP_CONTROL_ADDR_GIE, 0);
}

void XTrigger_ip_InterruptEnable(XTrigger_ip *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XTrigger_ip_ReadReg(InstancePtr->Control_BaseAddress, XTRIGGER_IP_CONTROL_ADDR_IER);
    XTrigger_ip_WriteReg(InstancePtr->Control_BaseAddress, XTRIGGER_IP_CONTROL_ADDR_IER, Register | Mask);
}

void XTrigger_ip_InterruptDisable(XTrigger_ip *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XTrigger_ip_ReadReg(InstancePtr->Control_BaseAddress, XTRIGGER_IP_CONTROL_ADDR_IER);
    XTrigger_ip_WriteReg(InstancePtr->Control_BaseAddress, XTRIGGER_IP_CONTROL_ADDR_IER, Register & (~Mask));
}

void XTrigger_ip_InterruptClear(XTrigger_ip *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    //XTrigger_ip_WriteReg(InstancePtr->Control_BaseAddress, XTRIGGER_IP_CONTROL_ADDR_ISR, Mask);
}

u32 XTrigger_ip_InterruptGetEnabled(XTrigger_ip *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XTrigger_ip_ReadReg(InstancePtr->Control_BaseAddress, XTRIGGER_IP_CONTROL_ADDR_IER);
}

u32 XTrigger_ip_InterruptGetStatus(XTrigger_ip *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    // Current Interrupt Clear Behavior is Clear on Read(COR).
    return XTrigger_ip_ReadReg(InstancePtr->Control_BaseAddress, XTRIGGER_IP_CONTROL_ADDR_ISR);
}

