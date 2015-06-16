// =======================================================================================
// Project     : NetFPGA DE4
// 
// Description : PCIe Interface APIs
//
// Revision Control Information
//
// Author      : RCG
// Revision    : 
// Date        : 
// ======================================================================================


#include <time.h>
#include "declares.h"
#include "stdio.h"
#include "wdc_defs.h"
#include "wdc_lib.h"
#include <stdlib.h>
#include <pcap.h>
#include <math.h>
#include <time.h>
#include "utils.h"
#include "status_strings.h"
#include "samples/shared/diag_lib.h"
#include "samples/shared/wdc_diag_lib.h"
#include "samples/shared/pci_regs.h"
#include "pcie_sw_lib.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#define NUMBER_OF_DESCRPT 2

unsigned int OnRCSlaveRead(WDC_DEVICE_HANDLE hDev, int bar, unsigned int addr)
{
	unsigned int u32Data=0;
	WDC_ReadAddr32(hDev, bar, addr, &u32Data);
	return u32Data;
}

void OnRCSlaveWrite(WDC_DEVICE_HANDLE hDev, int bar, unsigned int addr, unsigned int u32Data)
{
   WDC_WriteAddr32(hDev,bar,addr,u32Data);
}

// PC -> FPGA
void DMA_Read(WDC_DEVICE_HANDLE hDev, int port)
{
	int l;
	double accum_time = 0;
	int test = 0;
	int iteration = 100;
	int i;
	unsigned int address_offset=0;
	int data_pattern = 1;
	int data_check_option = 1;
	int port_input = port<<8;
	int owner = 0x1;

	DWORD dwStatus;
	HANDLE hWD;
	WD_DMA dma_buff;
	// getting low level driver handle
	hWD = WD_Open();
	if (hWD == INVALID_HANDLE_VALUE)
		printf("DMA read : Cannot open WinDriver device");

	// This cardReg is required to use low level driver
	WD_CARD_REGISTER cardReg;
	BZERO(cardReg);
	cardReg.Card.dwItems = 1;
	cardReg.Card.Item[0].item = ITEM_IO;
	cardReg.Card.Item[0].fNotSharable = TRUE;
	cardReg.Card.Item[0].I.IO.dwAddr = 0x378;
	cardReg.Card.Item[0].I.IO.dwBytes = 8;
	WD_CardRegister(hWD, &cardReg);
	if (cardReg.hCard == 0){
		printf("DMA read : Failed locking device");
		return;
	}

	// allocating the user memory area
	BZERO(dma_buff);
	dma_buff.dwBytes = len; // additional 32byte will be used to detect the end of process.
	// Set contiguous Buffer
	dma_buff.dwOptions = DMA_KERNEL_BUFFER_ALLOC | DMA_KBUF_BELOW_16M;
	dma_buff.hCard = cardReg.hCard;

	dwStatus = WD_DMALock(hWD, &dma_buff);
	if(dwStatus){
		printf("DMA read : Failed to allocate memory");
		return;
	}

	// generating random data
	DWORD random_data;
	DWORD *pSBuf; // Soft Buffer
	pSBuf= (DWORD *) dma_buff.pUserAddr;
	/* 
	Hari: This is the data send to FPGA. I am reading from the PCAP file
	Replace this piece of code (packet_data32[i] & len), if you want to send different data.
	*/
	/*Start*/
	for (i =0;i<=(len)/4;i++)
	{
		pSBuf[i] = packet_data32[i];
	}
	/* End */	
	
	
	DWORD dma_address;
	dma_address = (DWORD) dma_buff.Page[0].pPhysicalAddr;

	OnRCSlaveWrite(hDev, 2, 0x1000, 0xFFFFFFFC); //0x1000 is the offset for translation register

	// reading out the resulted mask of path through
	UINT32 a2p_mask = OnRCSlaveRead(hDev, 2, 0x1000);//0x1000 is the offset for translation register
			
	// program address translation table
	OnRCSlaveWrite(hDev, 2, 0x1000, dma_address & a2p_mask); //setting lower address
	OnRCSlaveWrite(hDev, 2, 0x1004, 0x0); // setting upper address   limited at hardIP for now.

	unsigned int DMA_Interrupt_Mask		= 0x00000100;
	unsigned int DMA_Interrupt_Status	= 0x00000110;
	unsigned int DMA_Egress_Address		= 0x00000510;
	unsigned int DMA_Egress_Size		= 0x00000530;
	unsigned int DMA_Egress_Cntrl		= 0x00000550;
	unsigned int DMA_Control;
	DMA_Control = port_input | owner;

	OnRCSlaveWrite(hDev, 0,DMA_Interrupt_Mask,0x0);
	OnRCSlaveWrite(hDev, 0,DMA_Interrupt_Status,0x0);

	// Setting Up the DMA registers
	OnRCSlaveWrite(hDev, 0,DMA_Egress_Address,dma_address);
	OnRCSlaveWrite(hDev, 0,DMA_Egress_Size,len);
	OnRCSlaveWrite(hDev, 0,DMA_Egress_Cntrl,DMA_Control);

	// close the driver and used memory
	WD_DMAUnlock(hWD, &dma_buff);
	WD_CardUnregister(hWD, &cardReg);
	WD_Close(hWD);

}

// FPGA -> PC

void DMA_Write(WDC_DEVICE_HANDLE hDev, int length, int port){
	int l;
	double accum_time = 0;
	int test = 0;
	int i;
	int port_input = port<<8;
	int owner = 0x1;
	const int size =1000;
	int data_pattern = 1;
	int data_check_option = 1;

	DWORD dwStatus;


	HANDLE hWD;
	WD_DMA dma_buff;

	hWD = WD_Open();
	if (hWD == INVALID_HANDLE_VALUE)
	{
		printf("DMA write : Cannot open WinDriver device");
		return;
	}



	WD_CARD_REGISTER cardReg;
	BZERO(cardReg);
	cardReg.Card.dwItems = 1;
	cardReg.Card.Item[0].item = ITEM_IO;
	cardReg.Card.Item[0].fNotSharable = TRUE;
	cardReg.Card.Item[0].I.IO.dwAddr = 0x378;
	cardReg.Card.Item[0].I.IO.dwBytes = 8;
	WD_CardRegister(hWD, &cardReg);
	if (cardReg.hCard == 0){
		printf("DMA write : Failed locking device");
		return;
	}



	BZERO(dma_buff);
	dma_buff.dwBytes = length;
	// Set contiguous Buffer
	dma_buff.dwOptions = DMA_KERNEL_BUFFER_ALLOC | DMA_KBUF_BELOW_16M;
	dma_buff.hCard = cardReg.hCard;

	dwStatus = WD_DMALock(hWD, &dma_buff);
	if(dwStatus){
		printf("DMA write : Failed allocating memory");
		return;
	}

	DWORD random_data;
	unsigned current_time = (unsigned)time(NULL);
	srand(current_time);
	random_data=rand();

	unsigned long DMA_write_buf[1000];
	DWORD *pSBuf; // Soft Buffer
	DWORD *pSBuf_org; // original data that will be written into the target memory
	// Setting data on the target
	
	pSBuf= (DWORD *) dma_buff.pUserAddr;

	for (i = length/4; i<(length)/4 ; i++) {
			pSBuf[i] = 0;
	}
	for (i = 0; i < 1000 ; i++) {
			DMA_write_buf[i] = 0;
	}
	// trying and check the address translation path through
	OnRCSlaveWrite(hDev, 2, 0x1000, 0xFFFFFFFC); //0x1000 is the offset for translation register

	// reading out the resulted mask of path through
	UINT32 a2p_mask = OnRCSlaveRead(hDev, 2, 0x1000);//0x1000 is the offset for translation register
			
	// program address translation table
	OnRCSlaveWrite(hDev, 2, 0x1000, dma_buff.Page[0].pPhysicalAddr & a2p_mask); //setting lower address
	OnRCSlaveWrite(hDev, 2, 0x1004, 0x0); // setting upper address

	unsigned int dma_address;
	dma_address = dma_buff.Page[0].pPhysicalAddr & ~a2p_mask;
	unsigned int DMA_Interrupt_Mask		= 0x00000100;
	unsigned int DMA_Interrupt_Status	= 0x00000110;
	unsigned int DMA_Ingress_Address	= 0x00000500;
	unsigned int DMA_Ingress_Size		= 0x00000520;
	unsigned int DMA_Ingress_Cntrl		= 0x00000540;
	unsigned int DMA_Control;
	DMA_Control = port_input | owner;
// Setting up the registers
	OnRCSlaveWrite(hDev, 0,DMA_Interrupt_Mask,0x0);
	OnRCSlaveWrite(hDev, 0,DMA_Interrupt_Status,0x0);
	// DMA Ingress Address
	OnRCSlaveWrite(hDev, 0,DMA_Ingress_Address,dma_address);
	// DMA Ingress Size
	OnRCSlaveWrite(hDev, 0,DMA_Ingress_Size,length);
	// DMA Ingress Cntrl
	OnRCSlaveWrite(hDev, 0,DMA_Ingress_Cntrl,DMA_Control);
/////////////////////////////////////////////////////////////////////////////////////////////////
	    Sleep(1000);
		for (i =0;i<=(length)/4;i++)
		{
			DMA_write_buf[i] = pSBuf[i];
			printf("The present value is: %x \n",pSBuf[i]);
		}

		WD_DMAUnlock(hWD, &dma_buff);
		WD_CardUnregister(hWD, &cardReg);
		WD_Close(hWD);
}
 

int load_pcap(char *argument)
{
	FILE *fp;
	int i;
	int test_type;
	int dataLength;
	unsigned int count_pac = 0;
	unsigned int j = 0;

    pcap_t *handle; 
    char errbuf[PCAP_ERRBUF_SIZE]; 
    handle = pcap_open_offline(argument, errbuf);

	if (handle == NULL) { 
      printf("Couldn't open pcap file %s: %s\n", argument, errbuf); 
      return(0); 
    } 
	else
	{
    while (packet = pcap_next(handle,&header))
		{ 
		 u_char *pkt_ptr = (u_char *)packet;
		 printf("Packet length %d\n",header.caplen);
		 dataLength = header.len;
		 len = header.len; 
		 caplen = header.caplen;
	
	   for (i = 0; i < dataLength; i=i+4)
		{        
		packet_data32 [i/4] = 0;
		while((count_pac < 3) && (j <dataLength))
			{
			packet_data32[i/4] = packet_data32[i/4] + pkt_ptr[j];
			j++;
			count_pac ++;
			packet_data32[i/4] = packet_data32[i/4] << 8;
			}
			if(j <dataLength)
				packet_data32[i/4] = packet_data32[i/4] + pkt_ptr[j];
				j ++;
				count_pac_32 ++;
				count_pac = 0;	
		 }

	   while(j%4 != 0)
	      {
		   packet_data32[(i-1)/4] = packet_data32[(i-1)/4] << 8;
		   j++;
	      }

	}
	}
}
