// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef XCONTRAST_HLS_ROM_H
#define XCONTRAST_HLS_ROM_H

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
#include "xcontrast_hls_rom_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Axilites_BaseAddress;
} XContrast_hls_rom_Config;
#endif

typedef struct {
    u32 Axilites_BaseAddress;
    u32 IsReady;
} XContrast_hls_rom;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XContrast_hls_rom_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XContrast_hls_rom_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XContrast_hls_rom_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XContrast_hls_rom_ReadReg(BaseAddress, RegOffset) \
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
int XContrast_hls_rom_Initialize(XContrast_hls_rom *InstancePtr, u16 DeviceId);
XContrast_hls_rom_Config* XContrast_hls_rom_LookupConfig(u16 DeviceId);
int XContrast_hls_rom_CfgInitialize(XContrast_hls_rom *InstancePtr, XContrast_hls_rom_Config *ConfigPtr);
#else
int XContrast_hls_rom_Initialize(XContrast_hls_rom *InstancePtr, const char* InstanceName);
int XContrast_hls_rom_Release(XContrast_hls_rom *InstancePtr);
#endif

void XContrast_hls_rom_Start(XContrast_hls_rom *InstancePtr);
u32 XContrast_hls_rom_IsDone(XContrast_hls_rom *InstancePtr);
u32 XContrast_hls_rom_IsIdle(XContrast_hls_rom *InstancePtr);
u32 XContrast_hls_rom_IsReady(XContrast_hls_rom *InstancePtr);
void XContrast_hls_rom_EnableAutoRestart(XContrast_hls_rom *InstancePtr);
void XContrast_hls_rom_DisableAutoRestart(XContrast_hls_rom *InstancePtr);


void XContrast_hls_rom_InterruptGlobalEnable(XContrast_hls_rom *InstancePtr);
void XContrast_hls_rom_InterruptGlobalDisable(XContrast_hls_rom *InstancePtr);
void XContrast_hls_rom_InterruptEnable(XContrast_hls_rom *InstancePtr, u32 Mask);
void XContrast_hls_rom_InterruptDisable(XContrast_hls_rom *InstancePtr, u32 Mask);
void XContrast_hls_rom_InterruptClear(XContrast_hls_rom *InstancePtr, u32 Mask);
u32 XContrast_hls_rom_InterruptGetEnabled(XContrast_hls_rom *InstancePtr);
u32 XContrast_hls_rom_InterruptGetStatus(XContrast_hls_rom *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
