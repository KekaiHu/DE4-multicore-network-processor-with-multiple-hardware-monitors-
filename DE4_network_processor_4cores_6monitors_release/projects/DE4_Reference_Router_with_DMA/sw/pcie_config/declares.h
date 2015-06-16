// =======================================================================================
// Project     : NetFPGA DE4
// 
// Description : Defines file for loading PCAP file for DMA read
//
// Revision Control Information
//
// Author      : RCG
// Revision    : 
// Date        : 
// ======================================================================================

#include <stdio.h>
#include <stdlib.h>
#include <pcap.h>
#include <math.h>
#include "wdc_defs.h"
#include "wdc_lib.h"
#include "utils.h"
#include "status_strings.h"
#include "samples/shared/diag_lib.h"
#include "samples/shared/wdc_diag_lib.h"
#include "samples/shared/pci_regs.h"
#include "pcie_sw_lib.h"

int sec;   
float usec;  
int len;   
int caplen;
int length;
unsigned int count_pac_32 = 0;
unsigned int count_32 = 0;
unsigned int packet_data32[200];
struct pcap_pkthdr header; // The header that pcap gives us 
const u_char *packet; // The actual packet 