Software tool support: Quartus 12.1 with SOPC builder. Migration is needed if you want to run this in Qsys. 

In this version, run time ppu application switching is added. At the beginning, 2 cores work on ipv4_cm and 2 cores work on ipv4, switch 1 on the board is used to control the application switch. When switch 1 changes, 1 core switches from ipv4 to ipv4_cm.

With 6 monitors in this design, one monitor is idle, and two monitors are connected to one processor, when the switch happens, their connection would also change. 

After open the project, The NETFPGA user data path is under: DE4_SOPC:SOPC_INST/ethernet_port_interface_0/nf2_core/user_data_path. 

The 4core 6monitor architecture is under: user_data_path/np_core

Changes:
1. Add a protocol signal from the top. It inputs a control signal from the broad sw 1. 

In the generated new DE4_SOPC_inst.v, or DE4_SOPC.v, we can see there is a new signal "protocol_to_the_ethernet_port_interface_0". 
Connect it in the design top level to SLIDE_SW[1].

2. In the flow classification, modify the orignal protocol state machine.

3. In the mlite_cpu, add the pc_next_ipv4.