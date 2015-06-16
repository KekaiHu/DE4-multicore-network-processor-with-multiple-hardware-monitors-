#include "ngnp.h"

#define N 101
#define _u32 int
void YF32_ISR(void){}

#ifndef IPDECTTL
#define IPDECTTL 1 /* No. of time units to decrement TTL */
#endif
int table[N]= { 0x01010104, //1
                 0x01010104,
                 0x01010104,
                 0x01010104,
                 0x01010104,
                 0x01010104,
                 0x01010104,
                 0x01010104,
		 0x08010110,
		 0xC0A80101, //10
		 0x0A010104,
		 0x0C0C0C10,
		 0x0D0D0D01,
		 0x0E0E0E04,
		 0x0F0F0F10,
		 0x01111101,
		 0x02121204,
                 0x03131310,
		 0x18010110,
		 0x19010101, //20
		 0x1A010104,
      		 0x07171704,
		 0x08181801,
		 0x09191904,
                 0x0A1A1A10,
		 0x0B1B1B01,
		 0x0C1C1C04,
		 0x0D1D1D10,
		 0x28010110,
		 0x29010101, //30
		 0x2A010104,
		 0x02222201,
                 0x03232304,
                 0x04242410,
                 0x05252501,
		 0x06262604,
      		 0x07272710,
		 0x08282801,
		 0x38010110,
		 0x39010101, //40
		 0x3A010104,
		 0x0C2C2C04,
		 0x0D2D2D10,
		 0x0E2E2E01,
		 0x0F2F2F04,
		 0x01313110,
		 0x02323201,
                 0x03333304,
		 0x48010110,
		 0x49010101, //50
		 0x4A010104,
      		 0x07373710,
		 0x08383801,
		 0x09393904,
                 0x0A3A3A10,
		 0x0B3B3B01,
		 0x0C3C3C04,
		 0x0D3D3D10,
		 0x58010110,
		 0x59010101, //60
		 0x5A010104,
		 0x02424201,
                 0x03434304,
                 0x04444410,
                 0x05454501,
		 0x06464604,
      		 0x07474710,
		 0x08484804,
		 0x68010110,
		 0x69010101, //70
		 0x6A010104,
		 0x0C4C4C01,
		 0x0D4D4D04,
		 0x0E4E4E10,
		 0x0F4F4F01,
		 0x01515104,
		 0x02525210,
                 0x03535301,
		 0x78010110,
		 0x79010101, //80
		 0x7A010104,
      		 0x07575704,
		 0x08585810,
		 0x09595901,
                 0x0A5A5A04,
		 0x0B5B5B10,
		 0x0C5C5C01,
		 0x0D5D5D04,
		 0x88010110,
		 0x89010101, //90
		 0x8A010104,
		 0x02626210,
                 0x03636301,
                 0x04646404,
                 0x05656510,
		 0x06666601,
      		 0x07676704,
		 0x08686810,
		 0x09696901,
                 0x0A6A6A04, //100
                 0x0B6B6B10} ;

int main(int argc, char **argv)
{
	unsigned int d;
	unsigned int d1;
        unsigned int flag;
	_u32 ip_dst_hi;
        _u32 ip_dst_low;
        _u32 ip_dst;
	_u32 eth_type;
         int i=0;
	_u32 prefix;
	_u32 port;
               _u32 ip_sum = 0;
  					
	
	while(1){
		
		pkt_finish(0);
//		pkt_dbg(0,0x12121212);
	        /*get_pkt(0,d);
		d = d | 0x00040000;
		pkt_put32(PKT_BASE,d); */

		while(1)
{
		if((*((volatile unsigned int *) (PKT_CHECK)))==1)
			break;
}

		pkt_get16(ETH_TYPE, eth_type);
		if (eth_type == 0x0800) 
                   {
			_u32 ip_ttl = 0;
                        pkt_get8(IP_TTL, ip_ttl);
			if (ip_ttl == 0) 
	                              {
                                   /* drop_packet */
                                   //drop in the future     
	                              }
                        else
	                              {
				/*
	    			 * Lookup the destination address in the table to find next hop
	    			 */
					pkt_get16(IP_DEST_ADDR_HI, d);
                    			pkt_get16(IP_DEST_ADDR_LOW, ip_dst_low);
        				ip_dst_hi=((d << 16) & 0xffff0000);
        				ip_dst= ip_dst_hi + ip_dst_low;
					
                                        flag=0;
				//	pkt_dbg(1,ip_dst);
        				for(i = 0;i<N;i++){
				//	pkt_dbg(5,ip_dst);
							prefix = 0;
							port = 0;
 							port = (table[i] & 0x000000ff); 
							prefix = (table[i] >> 8) & 0x00ffffff; 
        						if ( prefix == ((ip_dst>> 8)& 0x00ffffff)) { 
									flag =1;
									port = (port << 16); 
									get_pkt(0,d1);
									d1 = (d1 | port); 
									put_pkt(0,d1);
							break;
			 						             }
        
         						   }
				//	pkt_dbg(2,port);
					if (flag ==0) {get_pkt(0,d1); d1 = d1 | 0x00040000; put_pkt(0,d1);}		
				//	pkt_dbg(2,d1);	          
	                        /*	  
	     			 * Decrement TTL by IPDECTTL units
	    			 */
					ip_ttl -= IPDECTTL;
           				pkt_put8(IP_TTL, ip_ttl);
                                    //    pkt_dbg(3,ip_ttl);
         			


				/* recompute checksum */
	
                         pkt_get16(IP_CHECKSUM, ip_sum);
  					if (ip_sum >= (unsigned short) ~(IPDECTTL << 8))
    					ip_sum -= ~(IPDECTTL << 8);
  					else
    					ip_sum += (IPDECTTL << 8);
				

				/* update checksum */
					pkt_put16(IP_CHECKSUM, ip_sum);
                                     //   pkt_dbg(4,ip_sum);
          			

					}


	          }
    
//		 else  pkt_finish(1);
//		pkt_dbg(3,port);
	         pkt_finish(1);
		 
	}

while(1)
{}
}
