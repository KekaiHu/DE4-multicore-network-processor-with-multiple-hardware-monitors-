/////////////////////////////////////////////////////////////////////
////  Author: Zhangfeifei                                        ////
////                                                             ////
////  Advance Test Technology Laboratory,                        ////
////  Institute of Computing Technology,                         ////
////  Chinese Academy of Sciences                                ////
////                                                             ////
////  If you encountered any problem, please contact :           ////
////  Email: zhangfeifei@ict.ac.cn or whitewill@opencores.org    ////
////  Tel: +86-10-6256 5533 ext. 5673                            ////
////                                                             ////
////  Downloaded from:                                           ////
////     http://www.opencores.org/pdownloads.cgi/list/ucore      ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2005-2006 Zhangfeifei                         ////
////                         zhangfeifei@ict.ac.cn               ////
////                                                             ////
////                                                             ////
//// This source file may be used and distributed freely without ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and any derivative work contains the  ////
//// original copyright notice and the associated disclaimer.    ////
////                                                             ////
//// Please let the author know if it is used                    ////
//// for commercial purpose.                                     //// 
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
////                                                             ////
//// Date of Creation: 2005.12.3                                 ////
////                                                             ////
//// Version: 0.0.1                                              ////
////                                                             ////
//// Description: define the init value of the inst_mem,         ////
////              which is generated using block_ram             ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Change log:                                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

`ifndef __INST_INIT__
`define __INST_INIT__

`define INIT_INST_MEM \
defparam bank0.INIT_00 = 256'h4004014104252400402240040040141042580120e848e8400000100000c02040 ;\
defparam bank0.INIT_01 = 256'h3800102f0c34040c0ef200810430200040c05ac9e23529680000000001022400 ;\
defparam bank0.INIT_02 = 256'h000430d0f0cebc ;\
defparam bank1.INIT_00 = 256'h8808008c3820286282008108808008c3820aaa96505f0a006c6c800900cc1080 ;\
defparam bank1.INIT_01 = 256'h9420f05004930c100edcc8400c037023c102304c2300380488286c6c2a000810 ;\
defparam bank1.INIT_02 = 256'h007c0000012540 ;\
defparam bank2.INIT_00 = 256'h08708406608a409708240b508708406608aa03e9faf5f5f7fc01ac04000c0004 ;\
defparam bank2.INIT_01 = 256'h68033024c40f0c00c001c0c00c000000c000a0cc232a08840013fc015c2240b5 ;\
defparam bank2.INIT_02 = 256'h008c03a0841ae1 ;\
defparam bank3.INIT_00 = 256'h00000000000000000030000000000000000003c0f0f0f0f001558800000c0004 ;\
defparam bank3.INIT_01 = 256'h14003010c40f0c000000c0c00c000000c00030cc030000000010015500030000 ;\
defparam bank3.INIT_02 = 256'h00cc000720c5c8 ;\
defparam bank4.INIT_00 = 256'h0000000000000000003000000000000000000000000000000000cc00000c0000 ;\
defparam bank4.INIT_01 = 256'h28003022e00f0c0a0000c2c00c280000c0a030cc030000000000000000030000 ;\
defparam bank4.INIT_02 = 256'h00cc280000cac0 ;\
defparam bank5.INIT_00 = 256'h8008008008020800803080080080080080800000000000000000ce00080c00a0 ;\
defparam bank5.INIT_01 = 256'h14003011d00f0c0f0000c3c00c3c0000c05030cc032200000000000002030800 ;\
defparam bank5.INIT_02 = 256'h00cc140200c5c0 ;\
defparam bank6.INIT_00 = 256'hc00c00c20c000c00c030c00c00c00c20c0000000000000000000ec00000c00c0 ;\
defparam bank6.INIT_01 = 256'h28003021d01f0c050010c2c00c280000c0a070cc130104400000000003030c00 ;\
defparam bank6.INIT_02 = 256'h00cc3c5554cae5 ;\
defparam bank7.INIT_00 = 256'hc00c00c00c0a0c00c030c00c00c00c00c0a00000000000000000fc00080c02c0 ;\
defparam bank7.INIT_01 = 256'h14003010c00f0c000000c0c00c000000c00030cc031400000000000003030c00 ;\
defparam bank7.INIT_02 = 256'h00cc00000005c0 ;\
defparam bank8.INIT_00 = 256'h04004004006010400621041040040040060ec7bbeeeeeee06c6f500100040115 ;\
defparam bank8.INIT_01 = 256'haa0f82e22805c0ae838c4208409ac2020b00237823a0060002106c6f20121041 ;\
defparam bank8.INIT_02 = 256'h0030aabae12a38 ;\
defparam bank9.INIT_00 = 256'h09d08c08d080d09d090c09d09d08c08d080014010000000c0157ef0388ac033a ;\
defparam bank9.INIT_01 = 256'h01000000001100100014400140110004005024961160061100300157c420c09d ;\
defparam bank9.INIT_02 = 256'h00001000414010 ;\
defparam banka.INIT_00 = 256'h86c84d84e852c86c851f86c86c84d84e858a542b0a0a0a0fffffd503802c039d ;\
defparam banka.INIT_01 = 256'h0220020000aa800008228800008000200802222020a0000a883bffffe211f86c ;\
defparam banka.INIT_02 = 256'h00008000000000 ;\
defparam bankb.INIT_00 = 256'h08a08808a08380ab0a0809808a08808a08caa82a0a0a0a0aaaaaa80288280200 ;\
defparam bankb.INIT_01 = 256'h9134110804eac4c045628c4ac4401234440369187262152ace2eaaaaac208098 ;\
defparam bankb.INIT_02 = 256'h00048190402490 ;\
defparam bankc.INIT_00 = 256'hceecceceecc2ccfecf2ececceecceceecc8ffc3f0f0f0f0ffffffc0bc03c03cc ;\
defparam bankc.INIT_01 = 256'h0030000000c0000000000c00000000300003404100000400cc3ffffffb32ecec ;\
defparam bankc.INIT_02 = 256'h00000000000000 ;\
defparam bankd.INIT_00 = 256'h0dd0cd0cd0d0d0dd0f1d0dd0dd0cd0cd0d05fd555555555fffff4701c0742137 ;\
defparam bankd.INIT_01 = 256'h1f0d53740405c4d042054041c4c1400d4d0015550140011b0313ffffd431d0dd ;\
defparam bankd.INIT_02 = 256'h0014c100010700 ;\
defparam banke.INIT_00 = 256'h00200200202020220012022002002002020a02aaaaaaaaaaaaaa8b0200a8033b ;\
defparam banke.INIT_01 = 256'h3e0a90b44802842086c880428402900a42001a6a400012260020000008012022 ;\
defparam banke.INIT_02 = 256'h00640200020f40 ;\
defparam bankf.INIT_00 = 256'h0a808808808080880a080880a8088088080aa8280a0a0a0aaaaa000484200000 ;\
defparam bankf.INIT_01 = 256'h0208020000008080000000088080020808000028028000020202aaaaa0208088 ;\
defparam bankf.INIT_02 = 256'h00008000000000

`endif
