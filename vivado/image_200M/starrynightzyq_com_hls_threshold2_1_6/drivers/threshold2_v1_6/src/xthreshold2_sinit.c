// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xthreshold2.h"

extern XThreshold2_Config XThreshold2_ConfigTable[];

XThreshold2_Config *XThreshold2_LookupConfig(u16 DeviceId) {
	XThreshold2_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XTHRESHOLD2_NUM_INSTANCES; Index++) {
		if (XThreshold2_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XThreshold2_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XThreshold2_Initialize(XThreshold2 *InstancePtr, u16 DeviceId) {
	XThreshold2_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XThreshold2_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XThreshold2_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

