// =======================================================================================
// Project     : NetFPGA DE4
// 
// Description : Ethernet Configuration
//
// Revision Control Information
//
// Author      : RCG
// Revision    : 
// Date        : 
// ======================================================================================

	/***************************Config 1 ******************************/
	
	unsigned int REV_ADDRESS 	        	=	0x00000000;
    unsigned int MAC_SCRATCH_ADDRESS 		=	0x00000010;
	unsigned int MAC_1_ADDRESS 		    	=	0x00000040;
    unsigned int FRM_LENGTH_ADDRESS 		=	0x00000050;
    unsigned int COMMAND_CONFIG_ADDRESS		=	0x00000020;
    unsigned int MAC_0_ADDRESS 		    	=	0x00000030;
    unsigned int PAUSE_QUANT_ADDRESS 	   	=	0x00000060;
    unsigned int RX_SECTION_EMPTY_ADDRESS  	=	0x00000070;
    unsigned int RX_SECTION_FULL_ADDRESS   	=	0x00000080;
    unsigned int TX_SECTION_EMPTY_ADDRESS  	=	0x00000090;
    unsigned int TX_SECTION_FULL_ADDRESS   	=	0x000000a0;
    unsigned int RX_ALMOST_EMPTY_ADDRESS   	=  	0x000000b0;
    unsigned int RX_ALMOST_FULL_ADDRESS    	=	0x000000c0;
    unsigned int TX_ALMOST_EMPTY_ADDRESS   	=	0x000000d0;
    unsigned int TX_ALMOST_FULL_ADDRESS    	=	0x000000e0;
    unsigned int MDIO_ADDR0_ADDRESS 	   	=	0x000000f0;
    unsigned int MDIO_ADDR1_ADDRESS 	   	=	0x00000100;
    unsigned int REG_STATUS_ADDRESS 	   	=	0x00000160;
    unsigned int TX_IPG_LENGTH_ADDRESS 	   	=	0x00000170;
	unsigned int TX_CMD_STAT_ADDRESS       	=   0x000003a0;
    unsigned int RX_CMD_STAT_ADDRESS       	=   0x000003b0;
	unsigned int MAC_SCRATCH               	=   0xaaaaaaaa;
    unsigned int COMMAND_CONFIG_VALUE      	=   0x0100001b;
    unsigned int MAC_0 		               	=	0x00feca00;   
    unsigned int MAC_1 		               	=	0x00000100;
    unsigned int FRM_LENGTH  	           	=	1500;
    unsigned int PAUSE_QUANT  	           	=	0;
    unsigned int RX_SECTION_EMPTY          	=	0;
    unsigned int RX_SECTION_FULL           	=	0;
    unsigned int TX_SECTION_EMPTY          	=	0;
    unsigned int TX_SECTION_FULL           	=	0;
    unsigned int RX_ALMOST_EMPTY           	=	8;
    unsigned int RX_ALMOST_FULL            	=	14;
    unsigned int TX_ALMOST_EMPTY           	=	8;
    unsigned int TX_ALMOST_FULL 	       	=	3;
    unsigned int MDIO_ADDR0  	           	=	0;
    unsigned int MDIO_ADDR1  	           	=	0;
    unsigned int TX_IPG_LENGTH 	           	=	12;
    unsigned int TX_CMD_STAT_VALUE 	       	=	0;
    unsigned int RX_CMD_STAT_VALUE 	       	=	0;
    unsigned int PCS_SCRATCH 		       	=	0x0000aaaa;
//PCS if_mode
    unsigned int PCS_SGMII_ENA 		=	1;		// Enable SGMII mode
    unsigned int PCS_SGMII_AN 		=	1;		// Enable Auto-Negotiation In SGMII mode
    unsigned int PCS_SGMII_ETH_SPEED =	1000;	// 10Mbps or 100Mbps or 1000Mbps
    unsigned int PCS_SGMII_HALF_DUPLEX =	0;		// Enable SGMII Half-Duplex

// PCS Control Register
    unsigned int PCS_CTRL_ENABLE_AN 	=	1;		// Enable PCS Auto-Negotiation

// Marvell PHY Configuration     
// =================================
// PHY MISC
    unsigned int PHY_ENABLE 	=		1;		// Enable PHY Port 0
    unsigned int PHY_ADDR 		=	0;		// PHY Address

// PHY Configuration
// PHY PHY Control Register (REG 0)
    unsigned int PHY_ETH_SPEED 	=	1000;	// 10Mbps or 100Mbps or 1000Mbps
    unsigned int PHY_ENABLE_AN 	=	1;		// Enable PHY Auto-Negotiation
    unsigned int PHY_COPPER_DUPLEX =  1;		// FD = 1 and HD = 0

// PHY AN Advertisement Register (REG 4)
    unsigned int PHY_ADV_100BTX_FD =	1;		// Advertise 100BASE-TX Full Duplex
    unsigned int PHY_ADV_100BTX_HD =	1;		// Advertise 100BASE-TX Half Duplex
    unsigned int PHY_ADV_10BTX_FD =	1;		// Advertise 10BASE-TX Full Duplex
    unsigned int PHY_ADV_10BTX_HD =	1;		// Advertise 10BASE-TX Half Duplex

// PHY 1000BASE-T Control Register (REG 9)
    unsigned int PHY_ADV_1000BT_FD =	1;		// Advertise 1000BASE-T Full Duplex
    unsigned int PHY_ADV_1000BT_HD =	1;		// Advertise 1000BASE-T Half Duplex

// PHY Extended PHY Specific Status REgister (REG 27)
    unsigned int PHY_HWCFG_MODE 	=	1;		// 1 (default) = SGMII to Copper Without Clock
								// 2 = TBI to Copper
								// 3 = RGMII to Copper
								// 4 = GMII/MII to Copper			
	
	
	//PCS1 config
	
	unsigned int PCS_IF_MODE = 0x0000000B;
	unsigned int PCS_CONTROL_REG = 0x00001140;
	unsigned int PCS_COUNT_TEMP = 0;
    unsigned int PCS_TIMEOUT = 1000;
    unsigned int tse_pcs_register_value_temp = 0;
	
	//PHY1 config	
	
	unsigned int PHY_CONTROL_REG = 0x00001140;
	unsigned int PHY_AN_AD = 0x000001e1;
	unsigned int SOFT_REST = 0x00001140;
	unsigned int PHY_READ_1000BASE = 0x00000f00;
	unsigned int PHY_SPEC_CONTROL_REG = 0x0000c018;
	unsigned int PHY_EXTENDED_STATUS = 0x00008484;	
	unsigned int PHY_COUNT_TEMP = 0;
    unsigned int PHY_TIMEOUT = 1000;
    unsigned int quad_phy_register_value_temp = 0;
	
	
	/***************************Config 2 ******************************/
	
	unsigned int MAC_0_2 = 0x00feca00;
	unsigned int MAC_1_2 = 0x00000200;
	unsigned int PHY_ADDR_2 = 1;
	
	//MAC2 config
	unsigned int REV_ADDRESS_2		 			=	0x00001000;
    unsigned int MAC_SCRATCH_ADDRESS_2 			=	0x00001010;
    unsigned int COMMAND_CONFIG_ADDRESS_2		=	0x00001020;
    unsigned int MAC_0_ADDRESS_2 				=	0x00001030;
    unsigned int MAC_1_ADDRESS_2 				=	0x00001040;
    unsigned int FRM_LENGTH_ADDRESS_2 			=	0x00001050;
    unsigned int PAUSE_QUANT_ADDRESS_2 			=	0x00001060;
    unsigned int RX_SECTION_EMPTY_ADDRESS_2  	=	0x00001070;
    unsigned int RX_SECTION_FULL_ADDRESS_2  	=	0x00001080;
    unsigned int TX_SECTION_EMPTY_ADDRESS_2  	=	0x00001090;
    unsigned int TX_SECTION_FULL_ADDRESS_2  	=	0x000010a0;
    unsigned int RX_ALMOST_EMPTY_ADDRESS_2  	=  	0x000010b0;
    unsigned int RX_ALMOST_FULL_ADDRESS_2 		=	0x000010c0;
    unsigned int TX_ALMOST_EMPTY_ADDRESS_2  	=	0x000010d0;
    unsigned int TX_ALMOST_FULL_ADDRESS_2 		=	0x000010e0;
    unsigned int MDIO_ADDR0_ADDRESS_2 	   		=	0x000010f0;
    unsigned int MDIO_ADDR1_ADDRESS_2 	   		=	0x00001100;
    unsigned int REG_STATUS_ADDRESS_2 	   		=	0x00001160;
    unsigned int TX_IPG_LENGTH_ADDRESS_2 		=	0x00001170;
	unsigned int TX_CMD_STAT_ADDRESS_2 			=   0x000013a0;
    unsigned int RX_CMD_STAT_ADDRESS_2 			=   0x000013b0;
	

	
	/***************************Config 3 ******************************/
	
	//Ethernet 3 config
	unsigned int MAC_0_3 	= 0x32464e00;
	unsigned int MAC_1_3 	= 0x00000243;
	unsigned int PHY_ADDR_3 = 2;
	
	//MAC3 config
	unsigned int REV_ADDRESS_3 					=	0x00002000;
    unsigned int MAC_SCRATCH_ADDRESS_3 			=	0x00002010;
    unsigned int COMMAND_CONFIG_ADDRESS_3		=	0x00002020;
    unsigned int MAC_0_ADDRESS_3 				=	0x00002030;
    unsigned int MAC_1_ADDRESS_3 				=	0x00002040;
    unsigned int FRM_LENGTH_ADDRESS_3 			=	0x00002050;
    unsigned int PAUSE_QUANT_ADDRESS_3 			=	0x00002060;
    unsigned int RX_SECTION_EMPTY_ADDRESS_3  	=	0x00002070;
    unsigned int RX_SECTION_FULL_ADDRESS_3  	=	0x00002080;
    unsigned int TX_SECTION_EMPTY_ADDRESS_3  	=	0x00002090;
    unsigned int TX_SECTION_FULL_ADDRESS_3  	=	0x000020a0;
    unsigned int RX_ALMOST_EMPTY_ADDRESS_3  	=  	0x000020b0;
    unsigned int RX_ALMOST_FULL_ADDRESS_3 		=	0x000020c0;
    unsigned int TX_ALMOST_EMPTY_ADDRESS_3  	=	0x000020d0;
    unsigned int TX_ALMOST_FULL_ADDRESS_3 		=	0x000020e0;
    unsigned int MDIO_ADDR0_ADDRESS_3 	   		=	0x000020f0;
    unsigned int MDIO_ADDR1_ADDRESS_3 	   		=	0x00002100;
    unsigned int REG_STATUS_ADDRESS_3 	   		=	0x00002160;
    unsigned int TX_IPG_LENGTH_ADDRESS_3 		=	0x00002170;
	unsigned int TX_CMD_STAT_ADDRESS_3 			= 	0x000023a0;
    unsigned int RX_CMD_STAT_ADDRESS_3 			=  	0x000023b0;
	
	/***************************Config 4 ******************************/
	
	//Ethernet 4 config
	unsigned int MAC_0_4 = 0x32464e00;
	unsigned int MAC_1_4 = 0x00000343;
	unsigned int PHY_ADDR_4 = 3;
	
	//MAC4 config
	unsigned int REV_ADDRESS_4 					=	0x00003000;
    unsigned int MAC_SCRATCH_ADDRESS_4 			=	0x00003010;
    unsigned int COMMAND_CONFIG_ADDRESS_4		=	0x00003020;
    unsigned int MAC_0_ADDRESS_4 				=	0x00003030;
    unsigned int MAC_1_ADDRESS_4 				=	0x00003040;
    unsigned int FRM_LENGTH_ADDRESS_4 			=	0x00003050;
    unsigned int PAUSE_QUANT_ADDRESS_4 			=	0x00003060;
    unsigned int RX_SECTION_EMPTY_ADDRESS_4  	=	0x00003070;
    unsigned int RX_SECTION_FULL_ADDRESS_4  	=	0x00003080;
    unsigned int TX_SECTION_EMPTY_ADDRESS_4  	=	0x00003090;
    unsigned int TX_SECTION_FULL_ADDRESS_4  	=	0x000030a0;
    unsigned int RX_ALMOST_EMPTY_ADDRESS_4  	=  	0x000030b0;
    unsigned int RX_ALMOST_FULL_ADDRESS_4 		=	0x000030c0;
    unsigned int TX_ALMOST_EMPTY_ADDRESS_4  	=	0x000030d0;
    unsigned int TX_ALMOST_FULL_ADDRESS_4 		=	0x000030e0;
    unsigned int MDIO_ADDR0_ADDRESS_4 	   		=	0x000030f0;
    unsigned int MDIO_ADDR1_ADDRESS_4 	   		=	0x00003100;
    unsigned int REG_STATUS_ADDRESS_4 	   		=	0x00003160;
    unsigned int TX_IPG_LENGTH_ADDRESS_4 		=	0x00003170;
	unsigned int TX_CMD_STAT_ADDRESS_4 			=   0x000033a0;
    unsigned int RX_CMD_STAT_ADDRESS_4 			=   0x000033b0;