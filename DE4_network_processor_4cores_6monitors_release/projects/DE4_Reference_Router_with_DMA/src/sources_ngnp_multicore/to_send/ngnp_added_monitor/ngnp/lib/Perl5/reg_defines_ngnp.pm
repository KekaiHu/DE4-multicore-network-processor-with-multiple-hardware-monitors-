#############################################################
#
# Perl register defines file for ngnp
#
#############################################################

package reg_defines_ngnp;

use Exporter;

@ISA = ('Exporter');

@EXPORT = qw(
                MAX_PHY_PORTS
                PCI_ADDR_WIDTH
                PCI_DATA_WIDTH
                PCI_BE_WIDTH
                CPCI_CNET_ADDR_WIDTH
                CPCI_CNET_DATA_WIDTH
                CPCI_NF2_ADDR_WIDTH
                CPCI_NF2_DATA_WIDTH
                DMA_DATA_WIDTH
                DMA_CTRL_WIDTH
                CPCI_DEBUG_DATA_WIDTH
                SRAM_ADDR_WIDTH
                SRAM_DATA_WIDTH
                DRAM_ADDR_WIDTH
                FAST_CLK_PERIOD
                SLOW_CLK_PERIOD
                IO_QUEUE_STAGE_NUM
                DATA_WIDTH
                CTRL_WIDTH
                NUM_OUTPUT_QUEUES
                OQ_DEFAULT_MAX_PKTS
                OQ_SRAM_PKT_CNT_WIDTH
                OQ_SRAM_WORD_CNT_WIDTH
                OQ_SRAM_BYTE_CNT_WIDTH
                OQ_ENABLE_SEND_BIT_NUM
                OQ_INITIALIZE_OQ_BIT_NUM
                ROUTER_OP_LUT_ARP_TABLE_DEPTH
                ROUTER_OP_LUT_ROUTE_TABLE_DEPTH
                ROUTER_OP_LUT_DST_IP_FILTER_TABLE_DEPTH
                ROUTER_OP_LUT_DEFAULT_MAC_0_HI
                ROUTER_OP_LUT_DEFAULT_MAC_0_LO
                ROUTER_OP_LUT_DEFAULT_MAC_1_HI
                ROUTER_OP_LUT_DEFAULT_MAC_1_LO
                ROUTER_OP_LUT_DEFAULT_MAC_2_HI
                ROUTER_OP_LUT_DEFAULT_MAC_2_LO
                ROUTER_OP_LUT_DEFAULT_MAC_3_HI
                ROUTER_OP_LUT_DEFAULT_MAC_3_LO
                DEV_ID_NUM_REGS
                DEV_ID_NON_DEV_STR_REGS
                DEV_ID_DEV_STR_WORD_LEN
                DEV_ID_DEV_STR_BYTE_LEN
                DEV_ID_DEV_STR_BIT_LEN
                DEV_ID_MD5SUM_LENGTH
                DEV_ID_MD5_VALUE_0
                DEV_ID_MD5_VALUE_1
                DEV_ID_MD5_VALUE_2
                DEV_ID_MD5_VALUE_3
                MAC_GRP_TX_QUEUE_DISABLE_BIT_NUM
                MAC_GRP_RX_QUEUE_DISABLE_BIT_NUM
                MAC_GRP_RESET_MAC_BIT_NUM
                MAC_GRP_MAC_DISABLE_TX_BIT_NUM
                MAC_GRP_MAC_DISABLE_RX_BIT_NUM
                MAC_GRP_MAC_DIS_JUMBO_TX_BIT_NUM
                MAC_GRP_MAC_DIS_JUMBO_RX_BIT_NUM
                MAC_GRP_MAC_DIS_CRC_CHECK_BIT_NUM
                MAC_GRP_MAC_DIS_CRC_GEN_BIT_NUM
                CORE_BASE_ADDR
                DEV_ID_BASE_ADDR
                MDIO_BASE_ADDR
                DMA_BASE_ADDR
                MAC_GRP_0_BASE_ADDR
                MAC_GRP_1_BASE_ADDR
                MAC_GRP_2_BASE_ADDR
                MAC_GRP_3_BASE_ADDR
                CPU_QUEUE_0_BASE_ADDR
                CPU_QUEUE_1_BASE_ADDR
                CPU_QUEUE_2_BASE_ADDR
                CPU_QUEUE_3_BASE_ADDR
                SRAM_BASE_ADDR
                UDP_BASE_ADDR
                ROUTER_OP_LUT_BASE_ADDR
                STRIP_HEADERS_BASE_ADDR
                IN_ARB_BASE_ADDR
                OQ_BASE_ADDR
                DRAM_BASE_ADDR
                CPU_QUEUE_OFFSET
                MAC_GRP_OFFSET
                DEV_ID_MD5_0_REG
                DEV_ID_MD5_1_REG
                DEV_ID_MD5_2_REG
                DEV_ID_MD5_3_REG
                DEV_ID_DEVICE_ID_REG
                DEV_ID_REVISION_REG
                DEV_ID_CPCI_ID_REG
                DEV_ID_DEV_STR_0_REG
                DEV_ID_DEV_STR_1_REG
                DEV_ID_DEV_STR_2_REG
                DEV_ID_DEV_STR_3_REG
                DEV_ID_DEV_STR_4_REG
                DEV_ID_DEV_STR_5_REG
                DEV_ID_DEV_STR_6_REG
                DEV_ID_DEV_STR_7_REG
                DEV_ID_DEV_STR_8_REG
                DEV_ID_DEV_STR_9_REG
                DEV_ID_DEV_STR_10_REG
                DEV_ID_DEV_STR_11_REG
                DEV_ID_DEV_STR_12_REG
                DEV_ID_DEV_STR_13_REG
                DEV_ID_DEV_STR_14_REG
                DEV_ID_DEV_STR_15_REG
                DEV_ID_DEV_STR_16_REG
                DEV_ID_DEV_STR_17_REG
                DEV_ID_DEV_STR_18_REG
                DEV_ID_DEV_STR_19_REG
                DEV_ID_DEV_STR_20_REG
                DEV_ID_DEV_STR_21_REG
                DEV_ID_DEV_STR_22_REG
                DEV_ID_DEV_STR_23_REG
                DEV_ID_DEV_STR_24_REG
                MDIO_PHY_0_CONTROL_REG
                MDIO_PHY_0_STATUS_REG
                MDIO_PHY_0_PHY_ID_0_REG
                MDIO_PHY_0_PHY_ID_1_REG
                MDIO_PHY_0_AUTONEGOTIATION_ADVERT_REG
                MDIO_PHY_0_AUTONEG_LINK_PARTNER_BASE_PAGE_ABILITY_REG
                MDIO_PHY_0_AUTONEG_EXPANSION_REG
                MDIO_PHY_0_AUTONEG_NEXT_PAGE_TX_REG
                MDIO_PHY_0_AUTONEG_LINK_PARTNER_RCVD_NEXT_PAGE_REG
                MDIO_PHY_0_MASTER_SLAVE_CTRL_REG
                MDIO_PHY_0_MASTER_SLAVE_STATUS_REG
                MDIO_PHY_0_PSE_CTRL_REG
                MDIO_PHY_0_PSE_STATUS_REG
                MDIO_PHY_0_MMD_ACCESS_CTRL_REG
                MDIO_PHY_0_MMD_ACCESS_STATUS_REG
                MDIO_PHY_0_EXTENDED_STATUS_REG
                MDIO_PHY_1_CONTROL_REG
                MDIO_PHY_1_STATUS_REG
                MDIO_PHY_1_PHY_ID_0_REG
                MDIO_PHY_1_PHY_ID_1_REG
                MDIO_PHY_1_AUTONEGOTIATION_ADVERT_REG
                MDIO_PHY_1_AUTONEG_LINK_PARTNER_BASE_PAGE_ABILITY_REG
                MDIO_PHY_1_AUTONEG_EXPANSION_REG
                MDIO_PHY_1_AUTONEG_NEXT_PAGE_TX_REG
                MDIO_PHY_1_AUTONEG_LINK_PARTNER_RCVD_NEXT_PAGE_REG
                MDIO_PHY_1_MASTER_SLAVE_CTRL_REG
                MDIO_PHY_1_MASTER_SLAVE_STATUS_REG
                MDIO_PHY_1_PSE_CTRL_REG
                MDIO_PHY_1_PSE_STATUS_REG
                MDIO_PHY_1_MMD_ACCESS_CTRL_REG
                MDIO_PHY_1_MMD_ACCESS_STATUS_REG
                MDIO_PHY_1_EXTENDED_STATUS_REG
                MDIO_PHY_2_CONTROL_REG
                MDIO_PHY_2_STATUS_REG
                MDIO_PHY_2_PHY_ID_0_REG
                MDIO_PHY_2_PHY_ID_1_REG
                MDIO_PHY_2_AUTONEGOTIATION_ADVERT_REG
                MDIO_PHY_2_AUTONEG_LINK_PARTNER_BASE_PAGE_ABILITY_REG
                MDIO_PHY_2_AUTONEG_EXPANSION_REG
                MDIO_PHY_2_AUTONEG_NEXT_PAGE_TX_REG
                MDIO_PHY_2_AUTONEG_LINK_PARTNER_RCVD_NEXT_PAGE_REG
                MDIO_PHY_2_MASTER_SLAVE_CTRL_REG
                MDIO_PHY_2_MASTER_SLAVE_STATUS_REG
                MDIO_PHY_2_PSE_CTRL_REG
                MDIO_PHY_2_PSE_STATUS_REG
                MDIO_PHY_2_MMD_ACCESS_CTRL_REG
                MDIO_PHY_2_MMD_ACCESS_STATUS_REG
                MDIO_PHY_2_EXTENDED_STATUS_REG
                MDIO_PHY_3_CONTROL_REG
                MDIO_PHY_3_STATUS_REG
                MDIO_PHY_3_PHY_ID_0_REG
                MDIO_PHY_3_PHY_ID_1_REG
                MDIO_PHY_3_AUTONEGOTIATION_ADVERT_REG
                MDIO_PHY_3_AUTONEG_LINK_PARTNER_BASE_PAGE_ABILITY_REG
                MDIO_PHY_3_AUTONEG_EXPANSION_REG
                MDIO_PHY_3_AUTONEG_NEXT_PAGE_TX_REG
                MDIO_PHY_3_AUTONEG_LINK_PARTNER_RCVD_NEXT_PAGE_REG
                MDIO_PHY_3_MASTER_SLAVE_CTRL_REG
                MDIO_PHY_3_MASTER_SLAVE_STATUS_REG
                MDIO_PHY_3_PSE_CTRL_REG
                MDIO_PHY_3_PSE_STATUS_REG
                MDIO_PHY_3_MMD_ACCESS_CTRL_REG
                MDIO_PHY_3_MMD_ACCESS_STATUS_REG
                MDIO_PHY_3_EXTENDED_STATUS_REG
                MDIO_PHY_GROUP_BASE_ADDR
                MDIO_PHY_GROUP_INST_OFFSET
                MAC_GRP_0_CONTROL_REG
                MAC_GRP_0_RX_QUEUE_NUM_PKTS_IN_QUEUE_REG
                MAC_GRP_0_RX_QUEUE_NUM_PKTS_STORED_REG
                MAC_GRP_0_RX_QUEUE_NUM_PKTS_DROPPED_FULL_REG
                MAC_GRP_0_RX_QUEUE_NUM_PKTS_DROPPED_BAD_REG
                MAC_GRP_0_RX_QUEUE_NUM_PKTS_DEQUEUED_REG
                MAC_GRP_0_RX_QUEUE_NUM_WORDS_PUSHED_REG
                MAC_GRP_0_RX_QUEUE_NUM_BYTES_PUSHED_REG
                MAC_GRP_0_TX_QUEUE_NUM_PKTS_IN_QUEUE_REG
                MAC_GRP_0_TX_QUEUE_NUM_PKTS_ENQUEUED_REG
                MAC_GRP_0_TX_QUEUE_NUM_PKTS_SENT_REG
                MAC_GRP_0_TX_QUEUE_NUM_WORDS_PUSHED_REG
                MAC_GRP_0_TX_QUEUE_NUM_BYTES_PUSHED_REG
                MAC_GRP_1_CONTROL_REG
                MAC_GRP_1_RX_QUEUE_NUM_PKTS_IN_QUEUE_REG
                MAC_GRP_1_RX_QUEUE_NUM_PKTS_STORED_REG
                MAC_GRP_1_RX_QUEUE_NUM_PKTS_DROPPED_FULL_REG
                MAC_GRP_1_RX_QUEUE_NUM_PKTS_DROPPED_BAD_REG
                MAC_GRP_1_RX_QUEUE_NUM_PKTS_DEQUEUED_REG
                MAC_GRP_1_RX_QUEUE_NUM_WORDS_PUSHED_REG
                MAC_GRP_1_RX_QUEUE_NUM_BYTES_PUSHED_REG
                MAC_GRP_1_TX_QUEUE_NUM_PKTS_IN_QUEUE_REG
                MAC_GRP_1_TX_QUEUE_NUM_PKTS_ENQUEUED_REG
                MAC_GRP_1_TX_QUEUE_NUM_PKTS_SENT_REG
                MAC_GRP_1_TX_QUEUE_NUM_WORDS_PUSHED_REG
                MAC_GRP_1_TX_QUEUE_NUM_BYTES_PUSHED_REG
                MAC_GRP_2_CONTROL_REG
                MAC_GRP_2_RX_QUEUE_NUM_PKTS_IN_QUEUE_REG
                MAC_GRP_2_RX_QUEUE_NUM_PKTS_STORED_REG
                MAC_GRP_2_RX_QUEUE_NUM_PKTS_DROPPED_FULL_REG
                MAC_GRP_2_RX_QUEUE_NUM_PKTS_DROPPED_BAD_REG
                MAC_GRP_2_RX_QUEUE_NUM_PKTS_DEQUEUED_REG
                MAC_GRP_2_RX_QUEUE_NUM_WORDS_PUSHED_REG
                MAC_GRP_2_RX_QUEUE_NUM_BYTES_PUSHED_REG
                MAC_GRP_2_TX_QUEUE_NUM_PKTS_IN_QUEUE_REG
                MAC_GRP_2_TX_QUEUE_NUM_PKTS_ENQUEUED_REG
                MAC_GRP_2_TX_QUEUE_NUM_PKTS_SENT_REG
                MAC_GRP_2_TX_QUEUE_NUM_WORDS_PUSHED_REG
                MAC_GRP_2_TX_QUEUE_NUM_BYTES_PUSHED_REG
                MAC_GRP_3_CONTROL_REG
                MAC_GRP_3_RX_QUEUE_NUM_PKTS_IN_QUEUE_REG
                MAC_GRP_3_RX_QUEUE_NUM_PKTS_STORED_REG
                MAC_GRP_3_RX_QUEUE_NUM_PKTS_DROPPED_FULL_REG
                MAC_GRP_3_RX_QUEUE_NUM_PKTS_DROPPED_BAD_REG
                MAC_GRP_3_RX_QUEUE_NUM_PKTS_DEQUEUED_REG
                MAC_GRP_3_RX_QUEUE_NUM_WORDS_PUSHED_REG
                MAC_GRP_3_RX_QUEUE_NUM_BYTES_PUSHED_REG
                MAC_GRP_3_TX_QUEUE_NUM_PKTS_IN_QUEUE_REG
                MAC_GRP_3_TX_QUEUE_NUM_PKTS_ENQUEUED_REG
                MAC_GRP_3_TX_QUEUE_NUM_PKTS_SENT_REG
                MAC_GRP_3_TX_QUEUE_NUM_WORDS_PUSHED_REG
                MAC_GRP_3_TX_QUEUE_NUM_BYTES_PUSHED_REG
                ROUTER_OP_LUT_ARP_NUM_MISSES_REG
                ROUTER_OP_LUT_LPM_NUM_MISSES_REG
                ROUTER_OP_LUT_NUM_CPU_PKTS_SENT_REG
                ROUTER_OP_LUT_NUM_BAD_OPTS_VER_REG
                ROUTER_OP_LUT_NUM_BAD_CHKSUMS_REG
                ROUTER_OP_LUT_NUM_BAD_TTLS_REG
                ROUTER_OP_LUT_NUM_NON_IP_RCVD_REG
                ROUTER_OP_LUT_NUM_PKTS_FORWARDED_REG
                ROUTER_OP_LUT_NUM_WRONG_DEST_REG
                ROUTER_OP_LUT_NUM_FILTERED_PKTS_REG
                ROUTER_OP_LUT_MAC_0_HI_REG
                ROUTER_OP_LUT_MAC_0_LO_REG
                ROUTER_OP_LUT_MAC_1_HI_REG
                ROUTER_OP_LUT_MAC_1_LO_REG
                ROUTER_OP_LUT_MAC_2_HI_REG
                ROUTER_OP_LUT_MAC_2_LO_REG
                ROUTER_OP_LUT_MAC_3_HI_REG
                ROUTER_OP_LUT_MAC_3_LO_REG
                ROUTER_OP_LUT_ROUTE_TABLE_ENTRY_IP_REG
                ROUTER_OP_LUT_ROUTE_TABLE_ENTRY_MASK_REG
                ROUTER_OP_LUT_ROUTE_TABLE_ENTRY_NEXT_HOP_IP_REG
                ROUTER_OP_LUT_ROUTE_TABLE_ENTRY_OUTPUT_PORT_REG
                ROUTER_OP_LUT_ROUTE_TABLE_RD_ADDR_REG
                ROUTER_OP_LUT_ROUTE_TABLE_WR_ADDR_REG
                ROUTER_OP_LUT_ARP_TABLE_ENTRY_MAC_HI_REG
                ROUTER_OP_LUT_ARP_TABLE_ENTRY_MAC_LO_REG
                ROUTER_OP_LUT_ARP_TABLE_ENTRY_NEXT_HOP_IP_REG
                ROUTER_OP_LUT_ARP_TABLE_RD_ADDR_REG
                ROUTER_OP_LUT_ARP_TABLE_WR_ADDR_REG
                ROUTER_OP_LUT_DST_IP_FILTER_TABLE_ENTRY_IP_REG
                ROUTER_OP_LUT_DST_IP_FILTER_TABLE_RD_ADDR_REG
                ROUTER_OP_LUT_DST_IP_FILTER_TABLE_WR_ADDR_REG
                IN_ARB_NUM_PKTS_SENT_REG
                IN_ARB_LAST_PKT_WORD_0_HI_REG
                IN_ARB_LAST_PKT_WORD_0_LO_REG
                IN_ARB_LAST_PKT_CTRL_0_REG
                IN_ARB_LAST_PKT_WORD_1_HI_REG
                IN_ARB_LAST_PKT_WORD_1_LO_REG
                IN_ARB_LAST_PKT_CTRL_1_REG
                IN_ARB_STATE_REG
                OQ_QUEUE_0_CTRL_REG
                OQ_QUEUE_0_NUM_PKT_BYTES_STORED_REG
                OQ_QUEUE_0_NUM_OVERHEAD_BYTES_STORED_REG
                OQ_QUEUE_0_NUM_PKT_BYTES_REMOVED_REG
                OQ_QUEUE_0_NUM_OVERHEAD_BYTES_REMOVED_REG
                OQ_QUEUE_0_NUM_PKTS_STORED_REG
                OQ_QUEUE_0_NUM_PKTS_DROPPED_REG
                OQ_QUEUE_0_NUM_PKTS_REMOVED_REG
                OQ_QUEUE_0_ADDR_LO_REG
                OQ_QUEUE_0_ADDR_HI_REG
                OQ_QUEUE_0_RD_ADDR_REG
                OQ_QUEUE_0_WR_ADDR_REG
                OQ_QUEUE_0_NUM_PKTS_IN_Q_REG
                OQ_QUEUE_0_MAX_PKTS_IN_Q_REG
                OQ_QUEUE_0_NUM_WORDS_IN_Q_REG
                OQ_QUEUE_0_NUM_WORDS_LEFT_REG
                OQ_QUEUE_0_FULL_THRESH_REG
                OQ_QUEUE_1_CTRL_REG
                OQ_QUEUE_1_NUM_PKT_BYTES_STORED_REG
                OQ_QUEUE_1_NUM_OVERHEAD_BYTES_STORED_REG
                OQ_QUEUE_1_NUM_PKT_BYTES_REMOVED_REG
                OQ_QUEUE_1_NUM_OVERHEAD_BYTES_REMOVED_REG
                OQ_QUEUE_1_NUM_PKTS_STORED_REG
                OQ_QUEUE_1_NUM_PKTS_DROPPED_REG
                OQ_QUEUE_1_NUM_PKTS_REMOVED_REG
                OQ_QUEUE_1_ADDR_LO_REG
                OQ_QUEUE_1_ADDR_HI_REG
                OQ_QUEUE_1_RD_ADDR_REG
                OQ_QUEUE_1_WR_ADDR_REG
                OQ_QUEUE_1_NUM_PKTS_IN_Q_REG
                OQ_QUEUE_1_MAX_PKTS_IN_Q_REG
                OQ_QUEUE_1_NUM_WORDS_IN_Q_REG
                OQ_QUEUE_1_NUM_WORDS_LEFT_REG
                OQ_QUEUE_1_FULL_THRESH_REG
                OQ_QUEUE_2_CTRL_REG
                OQ_QUEUE_2_NUM_PKT_BYTES_STORED_REG
                OQ_QUEUE_2_NUM_OVERHEAD_BYTES_STORED_REG
                OQ_QUEUE_2_NUM_PKT_BYTES_REMOVED_REG
                OQ_QUEUE_2_NUM_OVERHEAD_BYTES_REMOVED_REG
                OQ_QUEUE_2_NUM_PKTS_STORED_REG
                OQ_QUEUE_2_NUM_PKTS_DROPPED_REG
                OQ_QUEUE_2_NUM_PKTS_REMOVED_REG
                OQ_QUEUE_2_ADDR_LO_REG
                OQ_QUEUE_2_ADDR_HI_REG
                OQ_QUEUE_2_RD_ADDR_REG
                OQ_QUEUE_2_WR_ADDR_REG
                OQ_QUEUE_2_NUM_PKTS_IN_Q_REG
                OQ_QUEUE_2_MAX_PKTS_IN_Q_REG
                OQ_QUEUE_2_NUM_WORDS_IN_Q_REG
                OQ_QUEUE_2_NUM_WORDS_LEFT_REG
                OQ_QUEUE_2_FULL_THRESH_REG
                OQ_QUEUE_3_CTRL_REG
                OQ_QUEUE_3_NUM_PKT_BYTES_STORED_REG
                OQ_QUEUE_3_NUM_OVERHEAD_BYTES_STORED_REG
                OQ_QUEUE_3_NUM_PKT_BYTES_REMOVED_REG
                OQ_QUEUE_3_NUM_OVERHEAD_BYTES_REMOVED_REG
                OQ_QUEUE_3_NUM_PKTS_STORED_REG
                OQ_QUEUE_3_NUM_PKTS_DROPPED_REG
                OQ_QUEUE_3_NUM_PKTS_REMOVED_REG
                OQ_QUEUE_3_ADDR_LO_REG
                OQ_QUEUE_3_ADDR_HI_REG
                OQ_QUEUE_3_RD_ADDR_REG
                OQ_QUEUE_3_WR_ADDR_REG
                OQ_QUEUE_3_NUM_PKTS_IN_Q_REG
                OQ_QUEUE_3_MAX_PKTS_IN_Q_REG
                OQ_QUEUE_3_NUM_WORDS_IN_Q_REG
                OQ_QUEUE_3_NUM_WORDS_LEFT_REG
                OQ_QUEUE_3_FULL_THRESH_REG
                OQ_QUEUE_4_CTRL_REG
                OQ_QUEUE_4_NUM_PKT_BYTES_STORED_REG
                OQ_QUEUE_4_NUM_OVERHEAD_BYTES_STORED_REG
                OQ_QUEUE_4_NUM_PKT_BYTES_REMOVED_REG
                OQ_QUEUE_4_NUM_OVERHEAD_BYTES_REMOVED_REG
                OQ_QUEUE_4_NUM_PKTS_STORED_REG
                OQ_QUEUE_4_NUM_PKTS_DROPPED_REG
                OQ_QUEUE_4_NUM_PKTS_REMOVED_REG
                OQ_QUEUE_4_ADDR_LO_REG
                OQ_QUEUE_4_ADDR_HI_REG
                OQ_QUEUE_4_RD_ADDR_REG
                OQ_QUEUE_4_WR_ADDR_REG
                OQ_QUEUE_4_NUM_PKTS_IN_Q_REG
                OQ_QUEUE_4_MAX_PKTS_IN_Q_REG
                OQ_QUEUE_4_NUM_WORDS_IN_Q_REG
                OQ_QUEUE_4_NUM_WORDS_LEFT_REG
                OQ_QUEUE_4_FULL_THRESH_REG
                OQ_QUEUE_5_CTRL_REG
                OQ_QUEUE_5_NUM_PKT_BYTES_STORED_REG
                OQ_QUEUE_5_NUM_OVERHEAD_BYTES_STORED_REG
                OQ_QUEUE_5_NUM_PKT_BYTES_REMOVED_REG
                OQ_QUEUE_5_NUM_OVERHEAD_BYTES_REMOVED_REG
                OQ_QUEUE_5_NUM_PKTS_STORED_REG
                OQ_QUEUE_5_NUM_PKTS_DROPPED_REG
                OQ_QUEUE_5_NUM_PKTS_REMOVED_REG
                OQ_QUEUE_5_ADDR_LO_REG
                OQ_QUEUE_5_ADDR_HI_REG
                OQ_QUEUE_5_RD_ADDR_REG
                OQ_QUEUE_5_WR_ADDR_REG
                OQ_QUEUE_5_NUM_PKTS_IN_Q_REG
                OQ_QUEUE_5_MAX_PKTS_IN_Q_REG
                OQ_QUEUE_5_NUM_WORDS_IN_Q_REG
                OQ_QUEUE_5_NUM_WORDS_LEFT_REG
                OQ_QUEUE_5_FULL_THRESH_REG
                OQ_QUEUE_6_CTRL_REG
                OQ_QUEUE_6_NUM_PKT_BYTES_STORED_REG
                OQ_QUEUE_6_NUM_OVERHEAD_BYTES_STORED_REG
                OQ_QUEUE_6_NUM_PKT_BYTES_REMOVED_REG
                OQ_QUEUE_6_NUM_OVERHEAD_BYTES_REMOVED_REG
                OQ_QUEUE_6_NUM_PKTS_STORED_REG
                OQ_QUEUE_6_NUM_PKTS_DROPPED_REG
                OQ_QUEUE_6_NUM_PKTS_REMOVED_REG
                OQ_QUEUE_6_ADDR_LO_REG
                OQ_QUEUE_6_ADDR_HI_REG
                OQ_QUEUE_6_RD_ADDR_REG
                OQ_QUEUE_6_WR_ADDR_REG
                OQ_QUEUE_6_NUM_PKTS_IN_Q_REG
                OQ_QUEUE_6_MAX_PKTS_IN_Q_REG
                OQ_QUEUE_6_NUM_WORDS_IN_Q_REG
                OQ_QUEUE_6_NUM_WORDS_LEFT_REG
                OQ_QUEUE_6_FULL_THRESH_REG
                OQ_QUEUE_7_CTRL_REG
                OQ_QUEUE_7_NUM_PKT_BYTES_STORED_REG
                OQ_QUEUE_7_NUM_OVERHEAD_BYTES_STORED_REG
                OQ_QUEUE_7_NUM_PKT_BYTES_REMOVED_REG
                OQ_QUEUE_7_NUM_OVERHEAD_BYTES_REMOVED_REG
                OQ_QUEUE_7_NUM_PKTS_STORED_REG
                OQ_QUEUE_7_NUM_PKTS_DROPPED_REG
                OQ_QUEUE_7_NUM_PKTS_REMOVED_REG
                OQ_QUEUE_7_ADDR_LO_REG
                OQ_QUEUE_7_ADDR_HI_REG
                OQ_QUEUE_7_RD_ADDR_REG
                OQ_QUEUE_7_WR_ADDR_REG
                OQ_QUEUE_7_NUM_PKTS_IN_Q_REG
                OQ_QUEUE_7_MAX_PKTS_IN_Q_REG
                OQ_QUEUE_7_NUM_WORDS_IN_Q_REG
                OQ_QUEUE_7_NUM_WORDS_LEFT_REG
                OQ_QUEUE_7_FULL_THRESH_REG
                OQ_QUEUE_GROUP_BASE_ADDR
                OQ_QUEUE_GROUP_INST_OFFSET
            );


# -------------------------------------
#   Constants
# -------------------------------------

# ===== File: lib/verilog/core/common/xml/global.xml =====

# Maximum number of phy ports
sub MAX_PHY_PORTS ()                            { 4;}

# PCI address bus width
sub PCI_ADDR_WIDTH ()                           { 32;}

# PCI data bus width
sub PCI_DATA_WIDTH ()                           { 32;}

# PCI byte enable bus width
sub PCI_BE_WIDTH ()                             { 4;}

# CPCI--CNET address bus width. This is byte addresses even though bottom bits are zero.
sub CPCI_CNET_ADDR_WIDTH ()                     { 27;}

# CPCI--CNET data bus width
sub CPCI_CNET_DATA_WIDTH ()                     { 32;}

# CPCI--NF2 address bus width. This is byte addresses even though bottom bits are zero.
sub CPCI_NF2_ADDR_WIDTH ()                      { 27;}

# CPCI--NF2 data bus width
sub CPCI_NF2_DATA_WIDTH ()                      { 32;}

# DMA data bus width
sub DMA_DATA_WIDTH ()                           { 32;}

# DMA control bus width
sub DMA_CTRL_WIDTH ()                           { 4;}

# CPCI debug bus width
sub CPCI_DEBUG_DATA_WIDTH ()                    { 29;}

# SRAM address width
sub SRAM_ADDR_WIDTH ()                          { 19;}

# SRAM data width
sub SRAM_DATA_WIDTH ()                          { 36;}

# DRAM address width
sub DRAM_ADDR_WIDTH ()                          { 24;}


# ===== File: lib/verilog/core/common/xml/nf_defines.xml =====

# Clock period of 125 MHz clock in ns
sub FAST_CLK_PERIOD ()                          { 8;}

# Clock period of 62.5 MHz clock in ns
sub SLOW_CLK_PERIOD ()                          { 16;}

# Header value used by the IO queues
sub IO_QUEUE_STAGE_NUM ()                        { 0xff;}

# Data path data width
sub DATA_WIDTH ()                               { 64;}

# Data path control width
sub CTRL_WIDTH ()                               { 8;}


# ===== File: lib/verilog/core/output_queues/sram_rr_output_queues/xml/sram_rr_output_queues.xml =====

sub NUM_OUTPUT_QUEUES ()                        { 8;}

sub OQ_DEFAULT_MAX_PKTS ()                       { 0x7ffff;}

sub OQ_SRAM_PKT_CNT_WIDTH ()                    { 19;}

sub OQ_SRAM_WORD_CNT_WIDTH ()                   { 19;}

sub OQ_SRAM_BYTE_CNT_WIDTH ()                   { 19;}

sub OQ_ENABLE_SEND_BIT_NUM ()                   { 0;}

sub OQ_INITIALIZE_OQ_BIT_NUM ()                 { 1;}


# ===== File: lib/verilog/core/output_port_lookup/cam_router/xml/cam_router.xml =====

# Number of entrties in the ARP table
sub ROUTER_OP_LUT_ARP_TABLE_DEPTH ()            { 32;}

# Number of entrties in the routing table table
sub ROUTER_OP_LUT_ROUTE_TABLE_DEPTH ()          { 32;}

# Number of entrties in the destination IP filter table
sub ROUTER_OP_LUT_DST_IP_FILTER_TABLE_DEPTH ()  { 32;}

# Default MAC address for port 0
sub ROUTER_OP_LUT_DEFAULT_MAC_0_HI ()           { 0xcafe;}
sub ROUTER_OP_LUT_DEFAULT_MAC_0_LO ()           { 0xf00d0001;}

# Default MAC address for port 1
sub ROUTER_OP_LUT_DEFAULT_MAC_1_HI ()           { 0xcafe;}
sub ROUTER_OP_LUT_DEFAULT_MAC_1_LO ()           { 0xf00d0002;}

# Default MAC address for port 2
sub ROUTER_OP_LUT_DEFAULT_MAC_2_HI ()           { 0xcafe;}
sub ROUTER_OP_LUT_DEFAULT_MAC_2_LO ()           { 0xf00d0003;}

# Default MAC address for port 3
sub ROUTER_OP_LUT_DEFAULT_MAC_3_HI ()           { 0xcafe;}
sub ROUTER_OP_LUT_DEFAULT_MAC_3_LO ()           { 0xf00d0004;}


# ===== File: lib/verilog/core/utils/xml/device_id_reg.xml =====

# Total number of registers
sub DEV_ID_NUM_REGS ()                          { 32;}

# Number of non string registers
sub DEV_ID_NON_DEV_STR_REGS ()                  { 7;}

# Device description length (in words, not chars)
sub DEV_ID_DEV_STR_WORD_LEN ()                  { 25;}

# Device description length (in bytes/chars)
sub DEV_ID_DEV_STR_BYTE_LEN ()                  { 100;}

# Device description length (in bits)
sub DEV_ID_DEV_STR_BIT_LEN ()                   { 800;}

# Length of MD5 sum (bits)
sub DEV_ID_MD5SUM_LENGTH ()                     { 128;}

# MD5 sum of the string "device_id.v"
sub DEV_ID_MD5_VALUE_0 ()                       { 0x4071736d;}
sub DEV_ID_MD5_VALUE_1 ()                       { 0x8a603d2b;}
sub DEV_ID_MD5_VALUE_2 ()                       { 0x4d55f629;}
sub DEV_ID_MD5_VALUE_3 ()                       { 0x89a73c95;}


# ===== File: lib/verilog/core/io_queues/ethernet_mac/xml/ethernet_mac.xml =====

# TX queue disable bit
sub MAC_GRP_TX_QUEUE_DISABLE_BIT_NUM ()         { 0;}

# RX queue disable bit
sub MAC_GRP_RX_QUEUE_DISABLE_BIT_NUM ()         { 1;}

# Reset MAC bit
sub MAC_GRP_RESET_MAC_BIT_NUM ()                { 2;}

# MAC TX queue disable bit
sub MAC_GRP_MAC_DISABLE_TX_BIT_NUM ()           { 3;}

# MAC RX queue disable bit
sub MAC_GRP_MAC_DISABLE_RX_BIT_NUM ()           { 4;}

# MAC disable jumbo TX bit
sub MAC_GRP_MAC_DIS_JUMBO_TX_BIT_NUM ()         { 5;}

# MAC disable jumbo RX bit
sub MAC_GRP_MAC_DIS_JUMBO_RX_BIT_NUM ()         { 6;}

# MAC disable crc check disable bit
sub MAC_GRP_MAC_DIS_CRC_CHECK_BIT_NUM ()        { 7;}

# MAC disable crc generate bit
sub MAC_GRP_MAC_DIS_CRC_GEN_BIT_NUM ()          { 8;}



## -------------------------------------
##   Modules
## -------------------------------------

# Module tags
sub CORE_BASE_ADDR ()            { 0x0000000; }
sub DEV_ID_BASE_ADDR ()          { 0x0400000; }
sub MDIO_BASE_ADDR ()            { 0x0440000; }
sub DMA_BASE_ADDR ()             { 0x0500000; }
sub MAC_GRP_0_BASE_ADDR ()       { 0x0600000; }
sub MAC_GRP_1_BASE_ADDR ()       { 0x0640000; }
sub MAC_GRP_2_BASE_ADDR ()       { 0x0680000; }
sub MAC_GRP_3_BASE_ADDR ()       { 0x06c0000; }
sub CPU_QUEUE_0_BASE_ADDR ()     { 0x0700000; }
sub CPU_QUEUE_1_BASE_ADDR ()     { 0x0740000; }
sub CPU_QUEUE_2_BASE_ADDR ()     { 0x0780000; }
sub CPU_QUEUE_3_BASE_ADDR ()     { 0x07c0000; }
sub SRAM_BASE_ADDR ()            { 0x1000000; }
sub UDP_BASE_ADDR ()             { 0x2000000; }
sub ROUTER_OP_LUT_BASE_ADDR ()   { 0x2000000; }
sub STRIP_HEADERS_BASE_ADDR ()   { 0x2000100; }
sub IN_ARB_BASE_ADDR ()          { 0x2000200; }
sub OQ_BASE_ADDR ()              { 0x2001000; }
sub DRAM_BASE_ADDR ()            { 0x4000000; }

sub CPU_QUEUE_OFFSET ()       { 0x0040000; }
sub MAC_GRP_OFFSET ()         { 0x0040000; }


# -------------------------------------
#   Registers
# -------------------------------------

# Name: device_id (DEV_ID)
# Description: Device identification
# File: lib/verilog/core/utils/xml/device_id_reg.xml
sub DEV_ID_MD5_0_REG ()        { 0x0400000;}
sub DEV_ID_MD5_1_REG ()        { 0x0400004;}
sub DEV_ID_MD5_2_REG ()        { 0x0400008;}
sub DEV_ID_MD5_3_REG ()        { 0x040000c;}
sub DEV_ID_DEVICE_ID_REG ()    { 0x0400010;}
sub DEV_ID_REVISION_REG ()     { 0x0400014;}
sub DEV_ID_CPCI_ID_REG ()      { 0x0400018;}
sub DEV_ID_DEV_STR_0_REG ()    { 0x040001c;}
sub DEV_ID_DEV_STR_1_REG ()    { 0x0400020;}
sub DEV_ID_DEV_STR_2_REG ()    { 0x0400024;}
sub DEV_ID_DEV_STR_3_REG ()    { 0x0400028;}
sub DEV_ID_DEV_STR_4_REG ()    { 0x040002c;}
sub DEV_ID_DEV_STR_5_REG ()    { 0x0400030;}
sub DEV_ID_DEV_STR_6_REG ()    { 0x0400034;}
sub DEV_ID_DEV_STR_7_REG ()    { 0x0400038;}
sub DEV_ID_DEV_STR_8_REG ()    { 0x040003c;}
sub DEV_ID_DEV_STR_9_REG ()    { 0x0400040;}
sub DEV_ID_DEV_STR_10_REG ()   { 0x0400044;}
sub DEV_ID_DEV_STR_11_REG ()   { 0x0400048;}
sub DEV_ID_DEV_STR_12_REG ()   { 0x040004c;}
sub DEV_ID_DEV_STR_13_REG ()   { 0x0400050;}
sub DEV_ID_DEV_STR_14_REG ()   { 0x0400054;}
sub DEV_ID_DEV_STR_15_REG ()   { 0x0400058;}
sub DEV_ID_DEV_STR_16_REG ()   { 0x040005c;}
sub DEV_ID_DEV_STR_17_REG ()   { 0x0400060;}
sub DEV_ID_DEV_STR_18_REG ()   { 0x0400064;}
sub DEV_ID_DEV_STR_19_REG ()   { 0x0400068;}
sub DEV_ID_DEV_STR_20_REG ()   { 0x040006c;}
sub DEV_ID_DEV_STR_21_REG ()   { 0x0400070;}
sub DEV_ID_DEV_STR_22_REG ()   { 0x0400074;}
sub DEV_ID_DEV_STR_23_REG ()   { 0x0400078;}
sub DEV_ID_DEV_STR_24_REG ()   { 0x040007c;}

# Name: mdio (MDIO)
# Description: MDIO interface
# File: lib/verilog/core/io/mdio/xml/mdio.xml
sub MDIO_PHY_0_CONTROL_REG ()                                  { 0x0440000;}
sub MDIO_PHY_0_STATUS_REG ()                                   { 0x0440004;}
sub MDIO_PHY_0_PHY_ID_0_REG ()                                 { 0x0440008;}
sub MDIO_PHY_0_PHY_ID_1_REG ()                                 { 0x044000c;}
sub MDIO_PHY_0_AUTONEGOTIATION_ADVERT_REG ()                   { 0x0440010;}
sub MDIO_PHY_0_AUTONEG_LINK_PARTNER_BASE_PAGE_ABILITY_REG ()   { 0x0440014;}
sub MDIO_PHY_0_AUTONEG_EXPANSION_REG ()                        { 0x0440018;}
sub MDIO_PHY_0_AUTONEG_NEXT_PAGE_TX_REG ()                     { 0x044001c;}
sub MDIO_PHY_0_AUTONEG_LINK_PARTNER_RCVD_NEXT_PAGE_REG ()      { 0x0440020;}
sub MDIO_PHY_0_MASTER_SLAVE_CTRL_REG ()                        { 0x0440024;}
sub MDIO_PHY_0_MASTER_SLAVE_STATUS_REG ()                      { 0x0440028;}
sub MDIO_PHY_0_PSE_CTRL_REG ()                                 { 0x044002c;}
sub MDIO_PHY_0_PSE_STATUS_REG ()                               { 0x0440030;}
sub MDIO_PHY_0_MMD_ACCESS_CTRL_REG ()                          { 0x0440034;}
sub MDIO_PHY_0_MMD_ACCESS_STATUS_REG ()                        { 0x0440038;}
sub MDIO_PHY_0_EXTENDED_STATUS_REG ()                          { 0x044003c;}
sub MDIO_PHY_1_CONTROL_REG ()                                  { 0x0440080;}
sub MDIO_PHY_1_STATUS_REG ()                                   { 0x0440084;}
sub MDIO_PHY_1_PHY_ID_0_REG ()                                 { 0x0440088;}
sub MDIO_PHY_1_PHY_ID_1_REG ()                                 { 0x044008c;}
sub MDIO_PHY_1_AUTONEGOTIATION_ADVERT_REG ()                   { 0x0440090;}
sub MDIO_PHY_1_AUTONEG_LINK_PARTNER_BASE_PAGE_ABILITY_REG ()   { 0x0440094;}
sub MDIO_PHY_1_AUTONEG_EXPANSION_REG ()                        { 0x0440098;}
sub MDIO_PHY_1_AUTONEG_NEXT_PAGE_TX_REG ()                     { 0x044009c;}
sub MDIO_PHY_1_AUTONEG_LINK_PARTNER_RCVD_NEXT_PAGE_REG ()      { 0x04400a0;}
sub MDIO_PHY_1_MASTER_SLAVE_CTRL_REG ()                        { 0x04400a4;}
sub MDIO_PHY_1_MASTER_SLAVE_STATUS_REG ()                      { 0x04400a8;}
sub MDIO_PHY_1_PSE_CTRL_REG ()                                 { 0x04400ac;}
sub MDIO_PHY_1_PSE_STATUS_REG ()                               { 0x04400b0;}
sub MDIO_PHY_1_MMD_ACCESS_CTRL_REG ()                          { 0x04400b4;}
sub MDIO_PHY_1_MMD_ACCESS_STATUS_REG ()                        { 0x04400b8;}
sub MDIO_PHY_1_EXTENDED_STATUS_REG ()                          { 0x04400bc;}
sub MDIO_PHY_2_CONTROL_REG ()                                  { 0x0440100;}
sub MDIO_PHY_2_STATUS_REG ()                                   { 0x0440104;}
sub MDIO_PHY_2_PHY_ID_0_REG ()                                 { 0x0440108;}
sub MDIO_PHY_2_PHY_ID_1_REG ()                                 { 0x044010c;}
sub MDIO_PHY_2_AUTONEGOTIATION_ADVERT_REG ()                   { 0x0440110;}
sub MDIO_PHY_2_AUTONEG_LINK_PARTNER_BASE_PAGE_ABILITY_REG ()   { 0x0440114;}
sub MDIO_PHY_2_AUTONEG_EXPANSION_REG ()                        { 0x0440118;}
sub MDIO_PHY_2_AUTONEG_NEXT_PAGE_TX_REG ()                     { 0x044011c;}
sub MDIO_PHY_2_AUTONEG_LINK_PARTNER_RCVD_NEXT_PAGE_REG ()      { 0x0440120;}
sub MDIO_PHY_2_MASTER_SLAVE_CTRL_REG ()                        { 0x0440124;}
sub MDIO_PHY_2_MASTER_SLAVE_STATUS_REG ()                      { 0x0440128;}
sub MDIO_PHY_2_PSE_CTRL_REG ()                                 { 0x044012c;}
sub MDIO_PHY_2_PSE_STATUS_REG ()                               { 0x0440130;}
sub MDIO_PHY_2_MMD_ACCESS_CTRL_REG ()                          { 0x0440134;}
sub MDIO_PHY_2_MMD_ACCESS_STATUS_REG ()                        { 0x0440138;}
sub MDIO_PHY_2_EXTENDED_STATUS_REG ()                          { 0x044013c;}
sub MDIO_PHY_3_CONTROL_REG ()                                  { 0x0440180;}
sub MDIO_PHY_3_STATUS_REG ()                                   { 0x0440184;}
sub MDIO_PHY_3_PHY_ID_0_REG ()                                 { 0x0440188;}
sub MDIO_PHY_3_PHY_ID_1_REG ()                                 { 0x044018c;}
sub MDIO_PHY_3_AUTONEGOTIATION_ADVERT_REG ()                   { 0x0440190;}
sub MDIO_PHY_3_AUTONEG_LINK_PARTNER_BASE_PAGE_ABILITY_REG ()   { 0x0440194;}
sub MDIO_PHY_3_AUTONEG_EXPANSION_REG ()                        { 0x0440198;}
sub MDIO_PHY_3_AUTONEG_NEXT_PAGE_TX_REG ()                     { 0x044019c;}
sub MDIO_PHY_3_AUTONEG_LINK_PARTNER_RCVD_NEXT_PAGE_REG ()      { 0x04401a0;}
sub MDIO_PHY_3_MASTER_SLAVE_CTRL_REG ()                        { 0x04401a4;}
sub MDIO_PHY_3_MASTER_SLAVE_STATUS_REG ()                      { 0x04401a8;}
sub MDIO_PHY_3_PSE_CTRL_REG ()                                 { 0x04401ac;}
sub MDIO_PHY_3_PSE_STATUS_REG ()                               { 0x04401b0;}
sub MDIO_PHY_3_MMD_ACCESS_CTRL_REG ()                          { 0x04401b4;}
sub MDIO_PHY_3_MMD_ACCESS_STATUS_REG ()                        { 0x04401b8;}
sub MDIO_PHY_3_EXTENDED_STATUS_REG ()                          { 0x04401bc;}

sub MDIO_PHY_GROUP_BASE_ADDR ()  { 0x0440000; }
sub MDIO_PHY_GROUP_INST_OFFSET() { 0x0000080; }

# Name: dma (DMA)
# Description: DMA transfer module
# File: lib/verilog/core/dma/xml/dma.xml

# Name: nf2_mac_grp (MAC_GRP_0)
# Description: Ethernet MAC group
# File: lib/verilog/core/io_queues/ethernet_mac/xml/ethernet_mac.xml
sub MAC_GRP_0_CONTROL_REG ()                          { 0x0600000;}
sub MAC_GRP_0_RX_QUEUE_NUM_PKTS_IN_QUEUE_REG ()       { 0x0600004;}
sub MAC_GRP_0_RX_QUEUE_NUM_PKTS_STORED_REG ()         { 0x0600008;}
sub MAC_GRP_0_RX_QUEUE_NUM_PKTS_DROPPED_FULL_REG ()   { 0x060000c;}
sub MAC_GRP_0_RX_QUEUE_NUM_PKTS_DROPPED_BAD_REG ()    { 0x0600010;}
sub MAC_GRP_0_RX_QUEUE_NUM_PKTS_DEQUEUED_REG ()       { 0x0600014;}
sub MAC_GRP_0_RX_QUEUE_NUM_WORDS_PUSHED_REG ()        { 0x0600018;}
sub MAC_GRP_0_RX_QUEUE_NUM_BYTES_PUSHED_REG ()        { 0x060001c;}
sub MAC_GRP_0_TX_QUEUE_NUM_PKTS_IN_QUEUE_REG ()       { 0x0600020;}
sub MAC_GRP_0_TX_QUEUE_NUM_PKTS_ENQUEUED_REG ()       { 0x0600024;}
sub MAC_GRP_0_TX_QUEUE_NUM_PKTS_SENT_REG ()           { 0x0600028;}
sub MAC_GRP_0_TX_QUEUE_NUM_WORDS_PUSHED_REG ()        { 0x060002c;}
sub MAC_GRP_0_TX_QUEUE_NUM_BYTES_PUSHED_REG ()        { 0x0600030;}

# Name: nf2_mac_grp (MAC_GRP_1)
# Description: Ethernet MAC group
# File: lib/verilog/core/io_queues/ethernet_mac/xml/ethernet_mac.xml
sub MAC_GRP_1_CONTROL_REG ()                          { 0x0640000;}
sub MAC_GRP_1_RX_QUEUE_NUM_PKTS_IN_QUEUE_REG ()       { 0x0640004;}
sub MAC_GRP_1_RX_QUEUE_NUM_PKTS_STORED_REG ()         { 0x0640008;}
sub MAC_GRP_1_RX_QUEUE_NUM_PKTS_DROPPED_FULL_REG ()   { 0x064000c;}
sub MAC_GRP_1_RX_QUEUE_NUM_PKTS_DROPPED_BAD_REG ()    { 0x0640010;}
sub MAC_GRP_1_RX_QUEUE_NUM_PKTS_DEQUEUED_REG ()       { 0x0640014;}
sub MAC_GRP_1_RX_QUEUE_NUM_WORDS_PUSHED_REG ()        { 0x0640018;}
sub MAC_GRP_1_RX_QUEUE_NUM_BYTES_PUSHED_REG ()        { 0x064001c;}
sub MAC_GRP_1_TX_QUEUE_NUM_PKTS_IN_QUEUE_REG ()       { 0x0640020;}
sub MAC_GRP_1_TX_QUEUE_NUM_PKTS_ENQUEUED_REG ()       { 0x0640024;}
sub MAC_GRP_1_TX_QUEUE_NUM_PKTS_SENT_REG ()           { 0x0640028;}
sub MAC_GRP_1_TX_QUEUE_NUM_WORDS_PUSHED_REG ()        { 0x064002c;}
sub MAC_GRP_1_TX_QUEUE_NUM_BYTES_PUSHED_REG ()        { 0x0640030;}

# Name: nf2_mac_grp (MAC_GRP_2)
# Description: Ethernet MAC group
# File: lib/verilog/core/io_queues/ethernet_mac/xml/ethernet_mac.xml
sub MAC_GRP_2_CONTROL_REG ()                          { 0x0680000;}
sub MAC_GRP_2_RX_QUEUE_NUM_PKTS_IN_QUEUE_REG ()       { 0x0680004;}
sub MAC_GRP_2_RX_QUEUE_NUM_PKTS_STORED_REG ()         { 0x0680008;}
sub MAC_GRP_2_RX_QUEUE_NUM_PKTS_DROPPED_FULL_REG ()   { 0x068000c;}
sub MAC_GRP_2_RX_QUEUE_NUM_PKTS_DROPPED_BAD_REG ()    { 0x0680010;}
sub MAC_GRP_2_RX_QUEUE_NUM_PKTS_DEQUEUED_REG ()       { 0x0680014;}
sub MAC_GRP_2_RX_QUEUE_NUM_WORDS_PUSHED_REG ()        { 0x0680018;}
sub MAC_GRP_2_RX_QUEUE_NUM_BYTES_PUSHED_REG ()        { 0x068001c;}
sub MAC_GRP_2_TX_QUEUE_NUM_PKTS_IN_QUEUE_REG ()       { 0x0680020;}
sub MAC_GRP_2_TX_QUEUE_NUM_PKTS_ENQUEUED_REG ()       { 0x0680024;}
sub MAC_GRP_2_TX_QUEUE_NUM_PKTS_SENT_REG ()           { 0x0680028;}
sub MAC_GRP_2_TX_QUEUE_NUM_WORDS_PUSHED_REG ()        { 0x068002c;}
sub MAC_GRP_2_TX_QUEUE_NUM_BYTES_PUSHED_REG ()        { 0x0680030;}

# Name: nf2_mac_grp (MAC_GRP_3)
# Description: Ethernet MAC group
# File: lib/verilog/core/io_queues/ethernet_mac/xml/ethernet_mac.xml
sub MAC_GRP_3_CONTROL_REG ()                          { 0x06c0000;}
sub MAC_GRP_3_RX_QUEUE_NUM_PKTS_IN_QUEUE_REG ()       { 0x06c0004;}
sub MAC_GRP_3_RX_QUEUE_NUM_PKTS_STORED_REG ()         { 0x06c0008;}
sub MAC_GRP_3_RX_QUEUE_NUM_PKTS_DROPPED_FULL_REG ()   { 0x06c000c;}
sub MAC_GRP_3_RX_QUEUE_NUM_PKTS_DROPPED_BAD_REG ()    { 0x06c0010;}
sub MAC_GRP_3_RX_QUEUE_NUM_PKTS_DEQUEUED_REG ()       { 0x06c0014;}
sub MAC_GRP_3_RX_QUEUE_NUM_WORDS_PUSHED_REG ()        { 0x06c0018;}
sub MAC_GRP_3_RX_QUEUE_NUM_BYTES_PUSHED_REG ()        { 0x06c001c;}
sub MAC_GRP_3_TX_QUEUE_NUM_PKTS_IN_QUEUE_REG ()       { 0x06c0020;}
sub MAC_GRP_3_TX_QUEUE_NUM_PKTS_ENQUEUED_REG ()       { 0x06c0024;}
sub MAC_GRP_3_TX_QUEUE_NUM_PKTS_SENT_REG ()           { 0x06c0028;}
sub MAC_GRP_3_TX_QUEUE_NUM_WORDS_PUSHED_REG ()        { 0x06c002c;}
sub MAC_GRP_3_TX_QUEUE_NUM_BYTES_PUSHED_REG ()        { 0x06c0030;}

# Name: cpu_dma_queue (CPU_QUEUE_0)
# Description: CPU DMA queue
# File: lib/verilog/core/io_queues/cpu_dma_queue/xml/cpu_dma_queue.xml

# Name: cpu_dma_queue (CPU_QUEUE_1)
# Description: CPU DMA queue
# File: lib/verilog/core/io_queues/cpu_dma_queue/xml/cpu_dma_queue.xml

# Name: cpu_dma_queue (CPU_QUEUE_2)
# Description: CPU DMA queue
# File: lib/verilog/core/io_queues/cpu_dma_queue/xml/cpu_dma_queue.xml

# Name: cpu_dma_queue (CPU_QUEUE_3)
# Description: CPU DMA queue
# File: lib/verilog/core/io_queues/cpu_dma_queue/xml/cpu_dma_queue.xml

# Name: SRAM (SRAM)
# Description: SRAM

# Name: router_op_lut (ROUTER_OP_LUT)
# Description: Output port lookup for IPv4 router (CAM based)
# File: lib/verilog/core/output_port_lookup/cam_router/xml/cam_router.xml
sub ROUTER_OP_LUT_ARP_NUM_MISSES_REG ()                  { 0x2000000;}
sub ROUTER_OP_LUT_LPM_NUM_MISSES_REG ()                  { 0x2000004;}
sub ROUTER_OP_LUT_NUM_CPU_PKTS_SENT_REG ()               { 0x2000008;}
sub ROUTER_OP_LUT_NUM_BAD_OPTS_VER_REG ()                { 0x200000c;}
sub ROUTER_OP_LUT_NUM_BAD_CHKSUMS_REG ()                 { 0x2000010;}
sub ROUTER_OP_LUT_NUM_BAD_TTLS_REG ()                    { 0x2000014;}
sub ROUTER_OP_LUT_NUM_NON_IP_RCVD_REG ()                 { 0x2000018;}
sub ROUTER_OP_LUT_NUM_PKTS_FORWARDED_REG ()              { 0x200001c;}
sub ROUTER_OP_LUT_NUM_WRONG_DEST_REG ()                  { 0x2000020;}
sub ROUTER_OP_LUT_NUM_FILTERED_PKTS_REG ()               { 0x2000024;}
sub ROUTER_OP_LUT_MAC_0_HI_REG ()                        { 0x2000028;}
sub ROUTER_OP_LUT_MAC_0_LO_REG ()                        { 0x200002c;}
sub ROUTER_OP_LUT_MAC_1_HI_REG ()                        { 0x2000030;}
sub ROUTER_OP_LUT_MAC_1_LO_REG ()                        { 0x2000034;}
sub ROUTER_OP_LUT_MAC_2_HI_REG ()                        { 0x2000038;}
sub ROUTER_OP_LUT_MAC_2_LO_REG ()                        { 0x200003c;}
sub ROUTER_OP_LUT_MAC_3_HI_REG ()                        { 0x2000040;}
sub ROUTER_OP_LUT_MAC_3_LO_REG ()                        { 0x2000044;}
sub ROUTER_OP_LUT_ROUTE_TABLE_ENTRY_IP_REG ()            { 0x2000048;}
sub ROUTER_OP_LUT_ROUTE_TABLE_ENTRY_MASK_REG ()          { 0x200004c;}
sub ROUTER_OP_LUT_ROUTE_TABLE_ENTRY_NEXT_HOP_IP_REG ()   { 0x2000050;}
sub ROUTER_OP_LUT_ROUTE_TABLE_ENTRY_OUTPUT_PORT_REG ()   { 0x2000054;}
sub ROUTER_OP_LUT_ROUTE_TABLE_RD_ADDR_REG ()             { 0x2000058;}
sub ROUTER_OP_LUT_ROUTE_TABLE_WR_ADDR_REG ()             { 0x200005c;}
sub ROUTER_OP_LUT_ARP_TABLE_ENTRY_MAC_HI_REG ()          { 0x2000060;}
sub ROUTER_OP_LUT_ARP_TABLE_ENTRY_MAC_LO_REG ()          { 0x2000064;}
sub ROUTER_OP_LUT_ARP_TABLE_ENTRY_NEXT_HOP_IP_REG ()     { 0x2000068;}
sub ROUTER_OP_LUT_ARP_TABLE_RD_ADDR_REG ()               { 0x200006c;}
sub ROUTER_OP_LUT_ARP_TABLE_WR_ADDR_REG ()               { 0x2000070;}
sub ROUTER_OP_LUT_DST_IP_FILTER_TABLE_ENTRY_IP_REG ()    { 0x2000074;}
sub ROUTER_OP_LUT_DST_IP_FILTER_TABLE_RD_ADDR_REG ()     { 0x2000078;}
sub ROUTER_OP_LUT_DST_IP_FILTER_TABLE_WR_ADDR_REG ()     { 0x200007c;}

# Name: strip_headers (STRIP_HEADERS)
# Description: Strip headers from data
# File: lib/verilog/core/strip_headers/keep_length/xml/strip_headers.xml

# Name: in_arb (IN_ARB)
# Description: Round-robin input arbiter
# File: lib/verilog/core/input_arbiter/rr_input_arbiter/xml/rr_input_arbiter.xml
sub IN_ARB_NUM_PKTS_SENT_REG ()        { 0x2000200;}
sub IN_ARB_LAST_PKT_WORD_0_HI_REG ()   { 0x2000204;}
sub IN_ARB_LAST_PKT_WORD_0_LO_REG ()   { 0x2000208;}
sub IN_ARB_LAST_PKT_CTRL_0_REG ()      { 0x200020c;}
sub IN_ARB_LAST_PKT_WORD_1_HI_REG ()   { 0x2000210;}
sub IN_ARB_LAST_PKT_WORD_1_LO_REG ()   { 0x2000214;}
sub IN_ARB_LAST_PKT_CTRL_1_REG ()      { 0x2000218;}
sub IN_ARB_STATE_REG ()                { 0x200021c;}

# Name: output_queues (OQ)
# Description: SRAM-based output queue using round-robin removal
# File: lib/verilog/core/output_queues/sram_rr_output_queues/xml/sram_rr_output_queues.xml
sub OQ_QUEUE_0_CTRL_REG ()                         { 0x2001000;}
sub OQ_QUEUE_0_NUM_PKT_BYTES_STORED_REG ()         { 0x2001004;}
sub OQ_QUEUE_0_NUM_OVERHEAD_BYTES_STORED_REG ()    { 0x2001008;}
sub OQ_QUEUE_0_NUM_PKT_BYTES_REMOVED_REG ()        { 0x200100c;}
sub OQ_QUEUE_0_NUM_OVERHEAD_BYTES_REMOVED_REG ()   { 0x2001010;}
sub OQ_QUEUE_0_NUM_PKTS_STORED_REG ()              { 0x2001014;}
sub OQ_QUEUE_0_NUM_PKTS_DROPPED_REG ()             { 0x2001018;}
sub OQ_QUEUE_0_NUM_PKTS_REMOVED_REG ()             { 0x200101c;}
sub OQ_QUEUE_0_ADDR_LO_REG ()                      { 0x2001020;}
sub OQ_QUEUE_0_ADDR_HI_REG ()                      { 0x2001024;}
sub OQ_QUEUE_0_RD_ADDR_REG ()                      { 0x2001028;}
sub OQ_QUEUE_0_WR_ADDR_REG ()                      { 0x200102c;}
sub OQ_QUEUE_0_NUM_PKTS_IN_Q_REG ()                { 0x2001030;}
sub OQ_QUEUE_0_MAX_PKTS_IN_Q_REG ()                { 0x2001034;}
sub OQ_QUEUE_0_NUM_WORDS_IN_Q_REG ()               { 0x2001038;}
sub OQ_QUEUE_0_NUM_WORDS_LEFT_REG ()               { 0x200103c;}
sub OQ_QUEUE_0_FULL_THRESH_REG ()                  { 0x2001040;}
sub OQ_QUEUE_1_CTRL_REG ()                         { 0x2001200;}
sub OQ_QUEUE_1_NUM_PKT_BYTES_STORED_REG ()         { 0x2001204;}
sub OQ_QUEUE_1_NUM_OVERHEAD_BYTES_STORED_REG ()    { 0x2001208;}
sub OQ_QUEUE_1_NUM_PKT_BYTES_REMOVED_REG ()        { 0x200120c;}
sub OQ_QUEUE_1_NUM_OVERHEAD_BYTES_REMOVED_REG ()   { 0x2001210;}
sub OQ_QUEUE_1_NUM_PKTS_STORED_REG ()              { 0x2001214;}
sub OQ_QUEUE_1_NUM_PKTS_DROPPED_REG ()             { 0x2001218;}
sub OQ_QUEUE_1_NUM_PKTS_REMOVED_REG ()             { 0x200121c;}
sub OQ_QUEUE_1_ADDR_LO_REG ()                      { 0x2001220;}
sub OQ_QUEUE_1_ADDR_HI_REG ()                      { 0x2001224;}
sub OQ_QUEUE_1_RD_ADDR_REG ()                      { 0x2001228;}
sub OQ_QUEUE_1_WR_ADDR_REG ()                      { 0x200122c;}
sub OQ_QUEUE_1_NUM_PKTS_IN_Q_REG ()                { 0x2001230;}
sub OQ_QUEUE_1_MAX_PKTS_IN_Q_REG ()                { 0x2001234;}
sub OQ_QUEUE_1_NUM_WORDS_IN_Q_REG ()               { 0x2001238;}
sub OQ_QUEUE_1_NUM_WORDS_LEFT_REG ()               { 0x200123c;}
sub OQ_QUEUE_1_FULL_THRESH_REG ()                  { 0x2001240;}
sub OQ_QUEUE_2_CTRL_REG ()                         { 0x2001400;}
sub OQ_QUEUE_2_NUM_PKT_BYTES_STORED_REG ()         { 0x2001404;}
sub OQ_QUEUE_2_NUM_OVERHEAD_BYTES_STORED_REG ()    { 0x2001408;}
sub OQ_QUEUE_2_NUM_PKT_BYTES_REMOVED_REG ()        { 0x200140c;}
sub OQ_QUEUE_2_NUM_OVERHEAD_BYTES_REMOVED_REG ()   { 0x2001410;}
sub OQ_QUEUE_2_NUM_PKTS_STORED_REG ()              { 0x2001414;}
sub OQ_QUEUE_2_NUM_PKTS_DROPPED_REG ()             { 0x2001418;}
sub OQ_QUEUE_2_NUM_PKTS_REMOVED_REG ()             { 0x200141c;}
sub OQ_QUEUE_2_ADDR_LO_REG ()                      { 0x2001420;}
sub OQ_QUEUE_2_ADDR_HI_REG ()                      { 0x2001424;}
sub OQ_QUEUE_2_RD_ADDR_REG ()                      { 0x2001428;}
sub OQ_QUEUE_2_WR_ADDR_REG ()                      { 0x200142c;}
sub OQ_QUEUE_2_NUM_PKTS_IN_Q_REG ()                { 0x2001430;}
sub OQ_QUEUE_2_MAX_PKTS_IN_Q_REG ()                { 0x2001434;}
sub OQ_QUEUE_2_NUM_WORDS_IN_Q_REG ()               { 0x2001438;}
sub OQ_QUEUE_2_NUM_WORDS_LEFT_REG ()               { 0x200143c;}
sub OQ_QUEUE_2_FULL_THRESH_REG ()                  { 0x2001440;}
sub OQ_QUEUE_3_CTRL_REG ()                         { 0x2001600;}
sub OQ_QUEUE_3_NUM_PKT_BYTES_STORED_REG ()         { 0x2001604;}
sub OQ_QUEUE_3_NUM_OVERHEAD_BYTES_STORED_REG ()    { 0x2001608;}
sub OQ_QUEUE_3_NUM_PKT_BYTES_REMOVED_REG ()        { 0x200160c;}
sub OQ_QUEUE_3_NUM_OVERHEAD_BYTES_REMOVED_REG ()   { 0x2001610;}
sub OQ_QUEUE_3_NUM_PKTS_STORED_REG ()              { 0x2001614;}
sub OQ_QUEUE_3_NUM_PKTS_DROPPED_REG ()             { 0x2001618;}
sub OQ_QUEUE_3_NUM_PKTS_REMOVED_REG ()             { 0x200161c;}
sub OQ_QUEUE_3_ADDR_LO_REG ()                      { 0x2001620;}
sub OQ_QUEUE_3_ADDR_HI_REG ()                      { 0x2001624;}
sub OQ_QUEUE_3_RD_ADDR_REG ()                      { 0x2001628;}
sub OQ_QUEUE_3_WR_ADDR_REG ()                      { 0x200162c;}
sub OQ_QUEUE_3_NUM_PKTS_IN_Q_REG ()                { 0x2001630;}
sub OQ_QUEUE_3_MAX_PKTS_IN_Q_REG ()                { 0x2001634;}
sub OQ_QUEUE_3_NUM_WORDS_IN_Q_REG ()               { 0x2001638;}
sub OQ_QUEUE_3_NUM_WORDS_LEFT_REG ()               { 0x200163c;}
sub OQ_QUEUE_3_FULL_THRESH_REG ()                  { 0x2001640;}
sub OQ_QUEUE_4_CTRL_REG ()                         { 0x2001800;}
sub OQ_QUEUE_4_NUM_PKT_BYTES_STORED_REG ()         { 0x2001804;}
sub OQ_QUEUE_4_NUM_OVERHEAD_BYTES_STORED_REG ()    { 0x2001808;}
sub OQ_QUEUE_4_NUM_PKT_BYTES_REMOVED_REG ()        { 0x200180c;}
sub OQ_QUEUE_4_NUM_OVERHEAD_BYTES_REMOVED_REG ()   { 0x2001810;}
sub OQ_QUEUE_4_NUM_PKTS_STORED_REG ()              { 0x2001814;}
sub OQ_QUEUE_4_NUM_PKTS_DROPPED_REG ()             { 0x2001818;}
sub OQ_QUEUE_4_NUM_PKTS_REMOVED_REG ()             { 0x200181c;}
sub OQ_QUEUE_4_ADDR_LO_REG ()                      { 0x2001820;}
sub OQ_QUEUE_4_ADDR_HI_REG ()                      { 0x2001824;}
sub OQ_QUEUE_4_RD_ADDR_REG ()                      { 0x2001828;}
sub OQ_QUEUE_4_WR_ADDR_REG ()                      { 0x200182c;}
sub OQ_QUEUE_4_NUM_PKTS_IN_Q_REG ()                { 0x2001830;}
sub OQ_QUEUE_4_MAX_PKTS_IN_Q_REG ()                { 0x2001834;}
sub OQ_QUEUE_4_NUM_WORDS_IN_Q_REG ()               { 0x2001838;}
sub OQ_QUEUE_4_NUM_WORDS_LEFT_REG ()               { 0x200183c;}
sub OQ_QUEUE_4_FULL_THRESH_REG ()                  { 0x2001840;}
sub OQ_QUEUE_5_CTRL_REG ()                         { 0x2001a00;}
sub OQ_QUEUE_5_NUM_PKT_BYTES_STORED_REG ()         { 0x2001a04;}
sub OQ_QUEUE_5_NUM_OVERHEAD_BYTES_STORED_REG ()    { 0x2001a08;}
sub OQ_QUEUE_5_NUM_PKT_BYTES_REMOVED_REG ()        { 0x2001a0c;}
sub OQ_QUEUE_5_NUM_OVERHEAD_BYTES_REMOVED_REG ()   { 0x2001a10;}
sub OQ_QUEUE_5_NUM_PKTS_STORED_REG ()              { 0x2001a14;}
sub OQ_QUEUE_5_NUM_PKTS_DROPPED_REG ()             { 0x2001a18;}
sub OQ_QUEUE_5_NUM_PKTS_REMOVED_REG ()             { 0x2001a1c;}
sub OQ_QUEUE_5_ADDR_LO_REG ()                      { 0x2001a20;}
sub OQ_QUEUE_5_ADDR_HI_REG ()                      { 0x2001a24;}
sub OQ_QUEUE_5_RD_ADDR_REG ()                      { 0x2001a28;}
sub OQ_QUEUE_5_WR_ADDR_REG ()                      { 0x2001a2c;}
sub OQ_QUEUE_5_NUM_PKTS_IN_Q_REG ()                { 0x2001a30;}
sub OQ_QUEUE_5_MAX_PKTS_IN_Q_REG ()                { 0x2001a34;}
sub OQ_QUEUE_5_NUM_WORDS_IN_Q_REG ()               { 0x2001a38;}
sub OQ_QUEUE_5_NUM_WORDS_LEFT_REG ()               { 0x2001a3c;}
sub OQ_QUEUE_5_FULL_THRESH_REG ()                  { 0x2001a40;}
sub OQ_QUEUE_6_CTRL_REG ()                         { 0x2001c00;}
sub OQ_QUEUE_6_NUM_PKT_BYTES_STORED_REG ()         { 0x2001c04;}
sub OQ_QUEUE_6_NUM_OVERHEAD_BYTES_STORED_REG ()    { 0x2001c08;}
sub OQ_QUEUE_6_NUM_PKT_BYTES_REMOVED_REG ()        { 0x2001c0c;}
sub OQ_QUEUE_6_NUM_OVERHEAD_BYTES_REMOVED_REG ()   { 0x2001c10;}
sub OQ_QUEUE_6_NUM_PKTS_STORED_REG ()              { 0x2001c14;}
sub OQ_QUEUE_6_NUM_PKTS_DROPPED_REG ()             { 0x2001c18;}
sub OQ_QUEUE_6_NUM_PKTS_REMOVED_REG ()             { 0x2001c1c;}
sub OQ_QUEUE_6_ADDR_LO_REG ()                      { 0x2001c20;}
sub OQ_QUEUE_6_ADDR_HI_REG ()                      { 0x2001c24;}
sub OQ_QUEUE_6_RD_ADDR_REG ()                      { 0x2001c28;}
sub OQ_QUEUE_6_WR_ADDR_REG ()                      { 0x2001c2c;}
sub OQ_QUEUE_6_NUM_PKTS_IN_Q_REG ()                { 0x2001c30;}
sub OQ_QUEUE_6_MAX_PKTS_IN_Q_REG ()                { 0x2001c34;}
sub OQ_QUEUE_6_NUM_WORDS_IN_Q_REG ()               { 0x2001c38;}
sub OQ_QUEUE_6_NUM_WORDS_LEFT_REG ()               { 0x2001c3c;}
sub OQ_QUEUE_6_FULL_THRESH_REG ()                  { 0x2001c40;}
sub OQ_QUEUE_7_CTRL_REG ()                         { 0x2001e00;}
sub OQ_QUEUE_7_NUM_PKT_BYTES_STORED_REG ()         { 0x2001e04;}
sub OQ_QUEUE_7_NUM_OVERHEAD_BYTES_STORED_REG ()    { 0x2001e08;}
sub OQ_QUEUE_7_NUM_PKT_BYTES_REMOVED_REG ()        { 0x2001e0c;}
sub OQ_QUEUE_7_NUM_OVERHEAD_BYTES_REMOVED_REG ()   { 0x2001e10;}
sub OQ_QUEUE_7_NUM_PKTS_STORED_REG ()              { 0x2001e14;}
sub OQ_QUEUE_7_NUM_PKTS_DROPPED_REG ()             { 0x2001e18;}
sub OQ_QUEUE_7_NUM_PKTS_REMOVED_REG ()             { 0x2001e1c;}
sub OQ_QUEUE_7_ADDR_LO_REG ()                      { 0x2001e20;}
sub OQ_QUEUE_7_ADDR_HI_REG ()                      { 0x2001e24;}
sub OQ_QUEUE_7_RD_ADDR_REG ()                      { 0x2001e28;}
sub OQ_QUEUE_7_WR_ADDR_REG ()                      { 0x2001e2c;}
sub OQ_QUEUE_7_NUM_PKTS_IN_Q_REG ()                { 0x2001e30;}
sub OQ_QUEUE_7_MAX_PKTS_IN_Q_REG ()                { 0x2001e34;}
sub OQ_QUEUE_7_NUM_WORDS_IN_Q_REG ()               { 0x2001e38;}
sub OQ_QUEUE_7_NUM_WORDS_LEFT_REG ()               { 0x2001e3c;}
sub OQ_QUEUE_7_FULL_THRESH_REG ()                  { 0x2001e40;}

sub OQ_QUEUE_GROUP_BASE_ADDR ()  { 0x2001000; }
sub OQ_QUEUE_GROUP_INST_OFFSET() { 0x0000200; }

# Name: DRAM (DRAM)
# Description: DRAM





1;

__END__
