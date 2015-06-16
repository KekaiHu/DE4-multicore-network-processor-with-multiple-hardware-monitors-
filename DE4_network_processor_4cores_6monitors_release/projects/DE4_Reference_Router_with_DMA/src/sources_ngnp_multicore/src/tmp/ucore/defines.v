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
//// Description: define some global values for the ucsys system ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Change log:                                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

`ifndef __DEFINES__
`define __DEFINES__

`include "data_mem_init.v"
`include "inst_mem_init.v"

`define TIMESCALE
`timescale 1ns/1ns

`define HW_IT_NUM 4

`define EXC_ENTRANCE 'h24

//`define COUNTER_MAX 'h400000
//`define COUNTER_WIDTH 22
//`define COUNT_PER_SEC 24//23.8
`define COUNTER_MAX 1024
`define COUNTER_WIDTH 8
`define COUNT_PER_SEC 10

`define TP__ 1

//uart internal register definition
`define UART_ADDR_READY  2'b00
`define UART_ADDR_BUSY   2'b01
`define UART_ADDR_RXDATA 2'b10
`define UART_ADDR_TXDATA 2'b11
//here are all byte addr
//imem base and size definition
//imem is 4k word
`define IMEM_BASE 'h0000_0000
`define IMEM_SIZE 'h1000*4
//ucore dmem addr space division,here are all byte addr
//dmem between 0x0 ~ 0xfff in word addr or 0x0~0x3ffc in byte addr
`define DMEM_BASE 'h0800_0000
`define DMEM_SIZE 'h1000*4
//uart betwen 0x4000 ~ 0x4003 in word or 0x10000~0x1000c
`define UART_BASE 'h0000_0000
`define UART_SIZE 'h4*4

//`define UART_T
`define DEBUG
`endif
