// =======================================================================================
// Project     : NetFPGA DE4
// 
// Description : Router table configuration
//
// Revision Control Information
//
// Author      : RCG
// Revision    : 
// Date        : 
// ======================================================================================	
	
// MAC Table Configuration
// =======================

#define MAC_ADDR_0     		"00:4e:46:32:43:00"
#define MAC_ADDR_1			"00:4e:46:32:43:01"
#define MAC_ADDR_2      	"00:4e:46:32:43:02"
#define MAC_ADDR_3      	"00:4e:46:32:43:03"

// Destination IP Table Configuration
// ===================================

#define DEST_IP_0      		"20.1.1.1";
#define DEST_IP_1      		"20.2.1.1";
#define DEST_IP_2      		"10.2.3.1";
#define DEST_IP_3      		"10.1.4.1";

// LPM Table Configuration
// =======================
// Port numbers are set as per the table below
// PORT:	MAC0 	CPU0 	MAC1 	CPU1 	MAC2 	CPU2 	MAC3 	CPU3
// NO: 		 1		 2   	 4		 8  	 10		 20 	 40		 80

#define LPM_IP_1      		"10.1.4.0";
#define LPM_MASK_1			"255.255.255.0";
#define LPM_NEXT_HOP_IP_1	"10.1.4.1";
#define LPM_OUTPUT_PORT_1	"40"; //MAC3  // for sending to CPU queues use CPU ports here

#define LPM_IP_2      		"10.2.3.0";
#define LPM_MASK_2			"255.255.255.0";
#define LPM_NEXT_HOP_IP_2	"10.2.3.1";
#define LPM_OUTPUT_PORT_2	"10"; //MAC2

// ARP Table Configuration
// =======================

#define NEXT_HOP_IP_1      	"10.1.4.1";
#define NEXT_HOP_MAC_1		"00:4e:46:32:43:03";

#define NEXT_HOP_IP_2      	"10.2.3.1";
#define NEXT_HOP_MAC_2		"00:4e:46:32:43:02";

#define NEXT_HOP_IP_3      	"20.1.4.1";
#define NEXT_HOP_MAC_3		"00:f0:f1:32:44:00";

#define NEXT_HOP_IP_4      	"30.2.3.1";
#define NEXT_HOP_MAC_4		"00:e0:e1:32:60:00";



	/************************ mac table *****************************/

    unsigned int ROUTER_OP_LUT_MAC_0_HI_REG = 0x80000a0;  
	unsigned int ROUTER_OP_LUT_MAC_0_LO_REG = 0x80000b0;  
	unsigned int ROUTER_OP_LUT_MAC_1_HI_REG = 0x80000c0;  
	unsigned int ROUTER_OP_LUT_MAC_1_LO_REG = 0x80000d0;  
	unsigned int ROUTER_OP_LUT_MAC_2_HI_REG = 0x80000e0;
	unsigned int ROUTER_OP_LUT_MAC_2_LO_REG = 0x80000f0;
	unsigned int ROUTER_OP_LUT_MAC_3_HI_REG = 0x8000100;
	unsigned int ROUTER_OP_LUT_MAC_3_LO_REG = 0x8000110;
	/************************ dest ip *****************************/
	
	unsigned int WR_ADDR_REG_01 = 0x00000001;
	unsigned int RD_ADDR_REG_01 = 0x00000001;
	
	unsigned int WR_ADDR_REG_02 = 0x00000002;
	unsigned int RD_ADDR_REG_02 = 0x00000002;

	unsigned int WR_ADDR_REG_03 = 0x00000003;
	unsigned int RD_ADDR_REG_03 = 0x00000003;

	unsigned int WR_ADDR_REG_04 = 0x00000004;
	unsigned int RD_ADDR_REG_04 = 0x00000004;

	unsigned int ROUTER_OP_LUT_DST_IP_FILTER_TABLE_ENTRY_IP_REG = 0x80001d0;
	unsigned int ROUTER_OP_LUT_DST_IP_FILTER_TABLE_WR_ADDR_REG 	= 0x80001f0;
	unsigned int ROUTER_OP_LUT_DST_IP_FILTER_TABLE_RD_ADDR_REG 	= 0x80001e0;

	/************************ arp table *****************************/
	
	unsigned int ARP_WR_ADDR_REG_01 	=	0x00000000;
	unsigned int ARP_RD_ADDR_REG_01 	=	0x00000000;

	unsigned int ARP_WR_ADDR_REG_02 	=	0x00000001;
	unsigned int ARP_RD_ADDR_REG_02		=	0x00000001;

	unsigned int ARP_WR_ADDR_REG_03 	=	0x00000002;
	unsigned int ARP_RD_ADDR_REG_03 	=	0x00000002;
	
	unsigned int ARP_WR_ADDR_REG_04 	=	0x00000003;
	unsigned int ARP_RD_ADDR_REG_04 	=	0x00000003;
	
	unsigned int ROUTER_OP_LUT_ARP_TABLE_ENTRY_NEXT_HOP_IP_REG =	0x80001a0;
	unsigned int ROUTER_OP_LUT_ARP_TABLE_ENTRY_MAC_HI_REG 	   =	0x8000180;
	unsigned int ROUTER_OP_LUT_ARP_TABLE_ENTRY_MAC_LO_REG 	   =	0x8000190;
	unsigned int ROUTER_OP_LUT_ARP_TABLE_WR_ADDR_REG 		   =	0x80001c0;
	unsigned int ROUTER_OP_LUT_ARP_TABLE_RD_ADDR_REG 		   =	0x80001b0;

	/************************ lpm table *****************************/
	
	unsigned int LPM_WR_ADDR_REG_01 	=	0x00000000;
	unsigned int LPM_RD_ADDR_REG_01 	=	0x00000000;

	unsigned int LPM_WR_ADDR_REG_02 		=		0x0000000f;
	unsigned int LPM_RD_ADDR_REG_02 		=		0x0000000f;

	unsigned int LPM_WR_ADDR_REG_03 		=		0x00000005;
	unsigned int LPM_RD_ADDR_REG_03 		=		0x00000005;

	unsigned int LPM_WR_ADDR_REG_04 		=		0x00000007;
	unsigned int LPM_RD_ADDR_REG_04 		=		0x00000007;	

	unsigned int ROUTER_OP_LUT_ROUTE_TABLE_ENTRY_IP_REG 		 =				0x8000120;
	unsigned int ROUTER_OP_LUT_ROUTE_TABLE_ENTRY_MASK_REG 		 =				0x8000130;
	unsigned int ROUTER_OP_LUT_ROUTE_TABLE_ENTRY_NEXT_HOP_IP_REG =				0x8000140;
	unsigned int ROUTER_OP_LUT_ROUTE_TABLE_ENTRY_OUTPUT_PORT_REG =				0x8000150;
	unsigned int ROUTER_OP_LUT_ROUTE_TABLE_WR_ADDR_REG 			 =				0x8000170;
	unsigned int ROUTER_OP_LUT_ROUTE_TABLE_RD_ADDR_REG			 =				0x8000160;