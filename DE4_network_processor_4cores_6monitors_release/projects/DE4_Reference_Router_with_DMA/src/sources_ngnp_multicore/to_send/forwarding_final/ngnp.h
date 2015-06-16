#ifndef __NGNP_H__
#define __NGNP_H__

#define PKT_BASE 0x10000000
#define PKT_DONE_BASE 0x20000000
#define PKT_LEN_BASE 0x30000000
#define PKT_DEBUG_BASE 0x66660000

typedef unsigned int _u32;
typedef unsigned short _u16;
typedef unsigned char _u8;

#define pkt_finish(a) *((volatile unsigned int *) (PKT_DONE_BASE)) = a
#define pkt_len(len) *((volatile unsigned int *) (PKT_LEN_BASE)) = len
#define get_pkt(offset, data) data = *((volatile unsigned int *) (PKT_BASE + offset*4))
#define put_pkt(offset, data) *((volatile unsigned int *) (PKT_BASE + offset*4)) = data
#define pkt_dbg(offset, data) *((volatile unsigned int *) (PKT_DEBUG_BASE + offset)) = (unsigned int) data

_u32 temp_u32;

#define pkt_get32(addr, data) data = *((volatile unsigned int *) (addr & 0xFFFFFFFC))

#define pkt_get16(addr, data) \
	do { \
		pkt_get32(addr, temp_u32); \
		switch(addr & 0x00000002){\
			case 2: \
				data = (_u32) (temp_u32 & 0x0000FFFF); \
				break;\
			case 0: \
				data = (_u32) ((temp_u32 & 0xFFFF0000) >> 16); \
				break;\
		}\
	} while(0)

#define pkt_get8(addr, data) \
	do { \
		pkt_get32(addr, temp_u32); \
		switch(addr & 0x00000003){\
			case 3: \
				data = (_u32) (temp_u32 & 0x000000FF); \
				break;\
			case 2: \
				data = (_u32) ((temp_u32 & 0x0000FF00) >> 8); \
				break;\
			case 1: \
				data = (_u32) ((temp_u32 & 0x00FF0000) >> 16); \
				break;\
			case 0: \
				data = (_u32) ((temp_u32 & 0xFF000000) >> 24); \
				break;\
		}\
	} while(0)

#define pkt_put32(addr, data) *((volatile unsigned int *) (addr & 0xFFFFFFFC)) = data

#define pkt_put16(addr, data) \
	do { \
		pkt_get32(addr, temp_u32); \
		switch(addr & 0x00000002){\
			case 2: \
				temp_u32 &= 0xFFFF0000; \
				temp_u32 |= data; \
				pkt_put32(addr, temp_u32); \
				break;\
			case 0: \
				temp_u32 &= 0x0000FFFF; \
				temp_u32 |= (data << 16); \
				pkt_put32(addr, temp_u32); \
				break;\
		}\
	} while(0)

#define pkt_put8(addr, data) \
	do { \
		pkt_get32(addr, temp_u32); \
		switch(addr & 0x00000003){\
			case 3: \
				temp_u32 &= 0xFFFFFF00; \
				temp_u32 |= data; \
				pkt_put32(addr, temp_u32); \
				break;\
			case 2: \
				temp_u32 &= 0xFFFF00FF; \
				temp_u32 |= (data << 8); \
				pkt_put32(addr, temp_u32); \
				break;\
			case 1: \
				temp_u32 &= 0xFF00FFFF; \
				temp_u32 |= (data << 16); \
				pkt_put32(addr, temp_u32); \
				break;\
			case 0: \
				temp_u32 &= 0x00FFFFFF; \
				temp_u32 |= (data << 24); \
				pkt_put32(addr, temp_u32); \
				break;\
		}\
	} while(0)

#define NF2_DEST_PORT		0x10000000
#define NF2_PACKET_LENGTH64	0x10000002
#define NF2_SRC_PORT		0x10000004
#define NF2_PACKET_LENGTH8	0x10000006


#define ETH_DEST_MAC		0x10000008
#define ETH_SRC_MAC		0x1000000E
#define ETH_TYPE		0x10000014

#define IP_VERSION		0x10000016
#define IP_HEADER_LENGTH	0x10000016
#define IP_TOS			0x10000017
#define IP_TOTAL_LENGTH		0x10000018
#define IP_ID			0x1000001A
#define IP_FLAGS		0x1000001C
#define IP_FRAG_OFFSET		0x1000001C
#define IP_TTL			0x1000001E
#define IP_PROTOCOL		0x1000001F
#define IP_CHECKSUM		0x10000020
#define IP_SRC_ADDR		0x10000022
#define IP_DEST_ADDR_HI		0x10000026
#define IP_DEST_ADDR_LOW	0x10000028

#define memset(addr, data, len) \
	do { \
		for(temp_u32 = 0; temp_u32 < len; temp_u32++){ \
			*(addr + temp_u32) = data; \
		} \
	} while(0)

#endif //__NGNP_H__
