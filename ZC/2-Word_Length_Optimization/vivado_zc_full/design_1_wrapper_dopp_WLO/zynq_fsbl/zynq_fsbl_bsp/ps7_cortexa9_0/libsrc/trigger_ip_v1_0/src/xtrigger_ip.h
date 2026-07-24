// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XTRIGGER_IP_H
#define XTRIGGER_IP_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xtrigger_ip_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_BaseAddress;
} XTrigger_ip_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XTrigger_ip;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XTrigger_ip_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XTrigger_ip_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XTrigger_ip_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XTrigger_ip_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XTrigger_ip_Initialize(XTrigger_ip *InstancePtr, u16 DeviceId);
XTrigger_ip_Config* XTrigger_ip_LookupConfig(u16 DeviceId);
int XTrigger_ip_CfgInitialize(XTrigger_ip *InstancePtr, XTrigger_ip_Config *ConfigPtr);
#else
int XTrigger_ip_Initialize(XTrigger_ip *InstancePtr, const char* InstanceName);
int XTrigger_ip_Release(XTrigger_ip *InstancePtr);
#endif

void XTrigger_ip_Start(XTrigger_ip *InstancePtr);
u32 XTrigger_ip_IsDone(XTrigger_ip *InstancePtr);
u32 XTrigger_ip_IsIdle(XTrigger_ip *InstancePtr);
u32 XTrigger_ip_IsReady(XTrigger_ip *InstancePtr);
void XTrigger_ip_EnableAutoRestart(XTrigger_ip *InstancePtr);
void XTrigger_ip_DisableAutoRestart(XTrigger_ip *InstancePtr);

void XTrigger_ip_Set_sync_reset(XTrigger_ip *InstancePtr, u32 Data);
u32 XTrigger_ip_Get_sync_reset(XTrigger_ip *InstancePtr);

void XTrigger_ip_InterruptGlobalEnable(XTrigger_ip *InstancePtr);
void XTrigger_ip_InterruptGlobalDisable(XTrigger_ip *InstancePtr);
void XTrigger_ip_InterruptEnable(XTrigger_ip *InstancePtr, u32 Mask);
void XTrigger_ip_InterruptDisable(XTrigger_ip *InstancePtr, u32 Mask);
void XTrigger_ip_InterruptClear(XTrigger_ip *InstancePtr, u32 Mask);
u32 XTrigger_ip_InterruptGetEnabled(XTrigger_ip *InstancePtr);
u32 XTrigger_ip_InterruptGetStatus(XTrigger_ip *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
