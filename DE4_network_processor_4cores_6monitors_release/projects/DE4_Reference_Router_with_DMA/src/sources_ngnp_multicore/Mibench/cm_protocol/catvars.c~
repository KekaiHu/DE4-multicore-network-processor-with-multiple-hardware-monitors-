
#include "ngnp.h"

int catvars(int buf1[], unsigned short len1, unsigned short len2){
               
        int mybuf[60];
        UINT4 *in;
        unsigned char *out;       
        unsigned short sum;
        
        pkt_dbg(0x107,  len1);
        Pack (in,out);

        pkt_dbg(0x115,  len2);
       
        sum= len1+ len2;
        pkt_dbg(0x103, sum);
       
        if(sum > 50) {  pkt_dbg(0x191, sum ); return -1;} 
        else {
        pkt_dbg(0x145, mybuf);     
        memset(mybuf, buf1, len1);      
        pkt_dbg(0x156, mybuf);
        memset((mybuf+len1), buf1, len2);
        pkt_dbg(0x172, mybuf);
        return 0;
        }
       
    } 

