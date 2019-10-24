// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xreorder_hls.h"

extern XReorder_hls_Config XReorder_hls_ConfigTable[];

XReorder_hls_Config *XReorder_hls_LookupConfig(u16 DeviceId) {
	XReorder_hls_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XREORDER_HLS_NUM_INSTANCES; Index++) {
		if (XReorder_hls_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XReorder_hls_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XReorder_hls_Initialize(XReorder_hls *InstancePtr, u16 DeviceId) {
	XReorder_hls_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XReorder_hls_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XReorder_hls_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

