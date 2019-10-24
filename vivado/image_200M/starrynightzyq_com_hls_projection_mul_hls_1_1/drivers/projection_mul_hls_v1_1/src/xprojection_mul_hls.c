// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

/***************************** Include Files *********************************/
#include "xprojection_mul_hls.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XProjection_mul_hls_CfgInitialize(XProjection_mul_hls *InstancePtr, XProjection_mul_hls_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Axilites_BaseAddress = ConfigPtr->Axilites_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XProjection_mul_hls_Start(XProjection_mul_hls *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XProjection_mul_hls_ReadReg(InstancePtr->Axilites_BaseAddress, XPROJECTION_MUL_HLS_AXILITES_ADDR_AP_CTRL) & 0x80;
    XProjection_mul_hls_WriteReg(InstancePtr->Axilites_BaseAddress, XPROJECTION_MUL_HLS_AXILITES_ADDR_AP_CTRL, Data | 0x01);
}

u32 XProjection_mul_hls_IsDone(XProjection_mul_hls *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XProjection_mul_hls_ReadReg(InstancePtr->Axilites_BaseAddress, XPROJECTION_MUL_HLS_AXILITES_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XProjection_mul_hls_IsIdle(XProjection_mul_hls *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XProjection_mul_hls_ReadReg(InstancePtr->Axilites_BaseAddress, XPROJECTION_MUL_HLS_AXILITES_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XProjection_mul_hls_IsReady(XProjection_mul_hls *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XProjection_mul_hls_ReadReg(InstancePtr->Axilites_BaseAddress, XPROJECTION_MUL_HLS_AXILITES_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XProjection_mul_hls_EnableAutoRestart(XProjection_mul_hls *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XProjection_mul_hls_WriteReg(InstancePtr->Axilites_BaseAddress, XPROJECTION_MUL_HLS_AXILITES_ADDR_AP_CTRL, 0x80);
}

void XProjection_mul_hls_DisableAutoRestart(XProjection_mul_hls *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XProjection_mul_hls_WriteReg(InstancePtr->Axilites_BaseAddress, XPROJECTION_MUL_HLS_AXILITES_ADDR_AP_CTRL, 0);
}

void XProjection_mul_hls_Set_rows(XProjection_mul_hls *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XProjection_mul_hls_WriteReg(InstancePtr->Axilites_BaseAddress, XPROJECTION_MUL_HLS_AXILITES_ADDR_ROWS_DATA, Data);
}

u32 XProjection_mul_hls_Get_rows(XProjection_mul_hls *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XProjection_mul_hls_ReadReg(InstancePtr->Axilites_BaseAddress, XPROJECTION_MUL_HLS_AXILITES_ADDR_ROWS_DATA);
    return Data;
}

void XProjection_mul_hls_Set_cols(XProjection_mul_hls *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XProjection_mul_hls_WriteReg(InstancePtr->Axilites_BaseAddress, XPROJECTION_MUL_HLS_AXILITES_ADDR_COLS_DATA, Data);
}

u32 XProjection_mul_hls_Get_cols(XProjection_mul_hls *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XProjection_mul_hls_ReadReg(InstancePtr->Axilites_BaseAddress, XPROJECTION_MUL_HLS_AXILITES_ADDR_COLS_DATA);
    return Data;
}

void XProjection_mul_hls_Set_threshold_v(XProjection_mul_hls *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XProjection_mul_hls_WriteReg(InstancePtr->Axilites_BaseAddress, XPROJECTION_MUL_HLS_AXILITES_ADDR_THRESHOLD_V_DATA, Data);
}

u32 XProjection_mul_hls_Get_threshold_v(XProjection_mul_hls *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XProjection_mul_hls_ReadReg(InstancePtr->Axilites_BaseAddress, XPROJECTION_MUL_HLS_AXILITES_ADDR_THRESHOLD_V_DATA);
    return Data;
}

void XProjection_mul_hls_InterruptGlobalEnable(XProjection_mul_hls *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XProjection_mul_hls_WriteReg(InstancePtr->Axilites_BaseAddress, XPROJECTION_MUL_HLS_AXILITES_ADDR_GIE, 1);
}

void XProjection_mul_hls_InterruptGlobalDisable(XProjection_mul_hls *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XProjection_mul_hls_WriteReg(InstancePtr->Axilites_BaseAddress, XPROJECTION_MUL_HLS_AXILITES_ADDR_GIE, 0);
}

void XProjection_mul_hls_InterruptEnable(XProjection_mul_hls *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XProjection_mul_hls_ReadReg(InstancePtr->Axilites_BaseAddress, XPROJECTION_MUL_HLS_AXILITES_ADDR_IER);
    XProjection_mul_hls_WriteReg(InstancePtr->Axilites_BaseAddress, XPROJECTION_MUL_HLS_AXILITES_ADDR_IER, Register | Mask);
}

void XProjection_mul_hls_InterruptDisable(XProjection_mul_hls *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XProjection_mul_hls_ReadReg(InstancePtr->Axilites_BaseAddress, XPROJECTION_MUL_HLS_AXILITES_ADDR_IER);
    XProjection_mul_hls_WriteReg(InstancePtr->Axilites_BaseAddress, XPROJECTION_MUL_HLS_AXILITES_ADDR_IER, Register & (~Mask));
}

void XProjection_mul_hls_InterruptClear(XProjection_mul_hls *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XProjection_mul_hls_WriteReg(InstancePtr->Axilites_BaseAddress, XPROJECTION_MUL_HLS_AXILITES_ADDR_ISR, Mask);
}

u32 XProjection_mul_hls_InterruptGetEnabled(XProjection_mul_hls *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XProjection_mul_hls_ReadReg(InstancePtr->Axilites_BaseAddress, XPROJECTION_MUL_HLS_AXILITES_ADDR_IER);
}

u32 XProjection_mul_hls_InterruptGetStatus(XProjection_mul_hls *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XProjection_mul_hls_ReadReg(InstancePtr->Axilites_BaseAddress, XPROJECTION_MUL_HLS_AXILITES_ADDR_ISR);
}

