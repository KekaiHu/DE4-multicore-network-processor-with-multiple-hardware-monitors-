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
//// Date of Creation: 2005.12.3                                 ////
////                                                             ////
//// Version: 0.0.1                                              ////
////                                                             ////
//// Description: define the init value of the data_mem,         ////
////              which is generated using block_ram             ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Change log:                                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

`ifndef __DATA_INIT__
`define __DATA_INIT__

`define INIT_DATA_MEM \
defparam bank0.INIT_00 = 256'h9400000 ;\
defparam bank1.INIT_00 = 256'hb344000 ;\
defparam bank2.INIT_00 = 256'h1910000 ;\
defparam bank3.INIT_00 = 256'h158c000 ;\
defparam bank4.INIT_00 = 256'h1fbc000 ;\
defparam bank5.INIT_00 = 256'h3800000 ;\
defparam bank6.INIT_00 = 256'h3400000 ;\
defparam bank7.INIT_00 = 256'h0400000 ;\
defparam bank8.INIT_00 = 256'h0000000 ;\
defparam bank9.INIT_00 = 256'h0000000 ;\
defparam banka.INIT_00 = 256'h0000000 ;\
defparam bankb.INIT_00 = 256'h0000000 ;\
defparam bankc.INIT_00 = 256'h0000000 ;\
defparam bankd.INIT_00 = 256'h0000020 ;\
defparam banke.INIT_00 = 256'h0000000 ;\
defparam bankf.INIT_00 = 256'h0000008

`endif
