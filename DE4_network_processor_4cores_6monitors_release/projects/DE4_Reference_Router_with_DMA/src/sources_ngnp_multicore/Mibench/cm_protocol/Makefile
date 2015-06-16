TARGET = firmware
SDK_DIR = ./
LD_SCRIPT = $(SDK_DIR)/YF32.ld
CRT0_SRC = $(SDK_DIR)/crt0.asm
# YF32_SRC = $(SDK_DIR)/lib/yf32.c
OBJDUMP = mips-elf-objdump
# CONV = sde-conv 
#MLITE = $(SDK_DIR)/bin/mlite
#MCONV = $(SDK_DIR)/bin/convert
#FL2MEM = $(SDK_DIR)/bin/fl2mem
# INC = $(SDK_DIR)/lib
#
CC = mips-elf-gcc -EB -save-temps -mips1 -O0 -Wall 
AS = mips-elf-as -EB -mips1
LD = mips-elf-ld -EB -n  -belf32-bigmips -T$(LD_SCRIPT)  
#
$(TARGET): clean crt0.o catvars.o desc.o
	@echo "====== $@ ======="
	rm -rf file.cfg
	$(CC) -s -c $@.c -o $@.o > test
	rm -rf bb_information	
	sed 's/#NP_BB/NP_BB/' firmware.s > firmware.s.new		
	$(AS) -o $@.o.tmp $@.s.new
	rm -rf pcs_file.inp
	rm -rf hops_file.inp
	./np_bb_ece636 -m 1 -b ./bb_information -f ./file.cfg -i crt.bb -o pcs_file.inp -r hops_file.inp
	rm -rf hop_ram.out
	./next_pcs_genram -i ./hops_file.inp -o hop_ram.out
	./z hop_ram.out > ./next_hop_ram.v
	sed 's/localram(/nexthop(/' ./next_hop_ram.v > ./outputs/next_hop_ram.v
	#mv ./next_hop_ram.vt ./outputs/next_hop_ram.v
	rm -rf next_hop_ram.v
	rm -rf ./outputs/$@.coe
	./next_hop_coe -i pcs_file.inp -o ./outputs/$@.coe
	$(LD) -Map $@.map -N -o $@.exe crt0.o $@.o
	cp -rf $@.exe test.axf
	$(OBJDUMP) -D $@.exe > $@.lst
	./tools/convert_bin.exe
	./tools/ram_image.exe ./ram_xilinx.vhd ./code.txt ./outputs/ram_image.vhd
	mips-elf-objcopy -O binary $@.exe $@.bin
	cp -rf $@.exe ./outputs/
	./z $@.bin > ./outputs/localram.v
	rm -rf bb_hash.636
	./instruction_hash -i code.txt -o bb_hash.636
	./z bb_hash.636 > ./bb_ram.v
	sed 's/localram(/bbram(/' ./bb_ram.v > ./outputs/bb_ram.v
	rm -rf bb_ram.v
	#rm -f /root/NF2/projects/ngnp/src/localram.v
	#mv ./localram.v /root/NF2/projects/ngnp/src/

crt0.o: $(CRT0_SRC)
	@echo "====== $@ ======="
	$(AS) -o crt0.o $(CRT0_SRC)
	rm -rf bb_information

catvars.o: catvars.c 
	$(CC) -c catvars.c

desc.o: desc.c 
	$(CC) -c desc.c

clean:
	@rm -rf *.o
	@rm -rf *.lst
	@rm -rf *.srec
	@rm -rf *.map
	@rm -rf *.fl
	@rm -rf *.bin
	@rm -rf *.exe
	@rm firmware.elf firmware.bin -f



