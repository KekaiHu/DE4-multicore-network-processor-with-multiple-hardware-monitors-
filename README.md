# DE4-multicore-network-processor-with-multiple-hardware-monitors-
This is a prototype system that includes 4 plasma cores working as a multicore network processor and 6 hardware monitors that protect the processor cores from buffer overflow attacks.

Installation and Usage
******************************

Requirements
************
	Altera Quartus 12.1
	Altera SOPC builder
	Altera DE4 board


Installation
************
1. Download project package from Github
2. Unzip the package
3. Open the project in Quartus II. The project file is under the directory: \projects\DE4_Reference_Router_with_DMA\synth\windows
4. Now you can compile the project and check out the multicore multi-monitor network processor architecture under: DE4_SOPC:SOPC_INST/ethernet_port_interface_0/nf2_core/user_data_path/np_core

Project organization
********************

+ lib
   + library files from NetFPGA

+ projects\DE4_Reference_Router_with_DMA\src
   + All the project related source codes
   + multicore multi-monitor related source codes are in sources_ngnp_multicore/src
        
+ projects\DE4_Reference_Router_with_DMA\synth\windows
   + The project directory

Contact: hukekai111@gmail.com
