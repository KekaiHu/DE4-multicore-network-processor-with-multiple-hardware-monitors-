---------------------------------------------------------------------
-- TITLE: Plasma (CPU core with memory)
-- AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
-- DATE CREATED: 6/4/02
-- FILENAME: plasma.vhd
-- PROJECT: Plasma CPU core
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
--    This entity combines the CPU core with memory and a UART.
--
-- Memory Map:
--   0x00000000 - 0x0000ffff   Internal RAM (8KB)
--   0x10000000 - 0x100fffff   External RAM (1MB)
--   Access all Misc registers with 32-bit accesses
--   0x20000000  Uart Write (will pause CPU if busy)
--   0x20000000  Uart Read
--   0x20000010  IRQ Mask
--   0x20000020  IRQ Status
--   0x20000030  GPIO0 Out Set bits
--   0x20000040  GPIO0 Out Clear bits
--   0x20000050  GPIOA In
--   0x20000060  Counter
--   0x20000070  Ethernet transmit count
--   IRQ bits:
--      7   GPIO31
--      6  ^GPIO31
--      5   EthernetSendDone
--      4   EthernetReceive
--      3   Counter(18)
--      2  ^Counter(18)
--      1  ^UartWriteBusy
--      0   UartDataAvailable
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
library mlite_pack; 
use mlite_pack.mlite_pack.all;

entity plasma is
   generic(memory_type : string := "DUAL_PORT_"; --"DUAL_PORT_" "ALTERA_LPM" "XILINX_16X";
           log_file    : string := "UNUSED";
           ethernet    : std_logic := '0');
   port(clk          : in std_logic;
        reset        : in std_logic;

        uart_write   : out std_logic;
        uart_read    : in std_logic;
		
		opcode_test_check       : out std_logic_vector(31 downto 0);
		pc_future_test_check    : out std_logic_vector(31 downto 2);

        address      : out std_logic_vector(31 downto 2);
        byte_we      : out std_logic_vector(3 downto 0); 
        data_write   : out std_logic_vector(31 downto 0);
        data_read    : in std_logic_vector(31 downto 0);
        mem_pause_in : in std_logic;
        
        gpio0_out    : out std_logic_vector(31 downto 0);
        gpioA_in     : in std_logic_vector(31 downto 0));
end; --entity plasma

architecture logic of plasma is
   signal address_next    : std_logic_vector(31 downto 2);
   signal byte_we_next    : std_logic_vector(3 downto 0);
   signal mem_address     : std_logic_vector(31 downto 2);
   signal mem_byte_we     : std_logic_vector(3 downto 0);
   signal data_r          : std_logic_vector(31 downto 0);
   signal data_w          : std_logic_vector(31 downto 0);
   signal data_read_ram   : std_logic_vector(31 downto 0);
   signal data_read_uart  : std_logic_vector(7 downto 0);
   signal write_enable    : std_logic;
   signal mem_pause       : std_logic;
   signal eth_pause       : std_logic;

   signal enable_internal_ram : std_logic;
   signal enable_misc         : std_logic;
   signal enable_uart         : std_logic;
   signal enable_uart_read    : std_logic;
   signal enable_uart_write   : std_logic;
   signal enable_eth          : std_logic;

   signal gpio0_reg           : std_logic_vector(31 downto 0);

   signal uart_write_busy     : std_logic;
   signal uart_data_avail     : std_logic;
   signal irq_mask_reg        : std_logic_vector(7 downto 0);
   signal irq_status          : std_logic_vector(7 downto 0);
   signal irq                 : std_logic;
   signal irq_eth_rec         : std_logic;
   signal irq_eth_send        : std_logic;
   signal counter_reg         : std_logic_vector(31 downto 0);

begin  --architecture
   write_enable <= '1' when mem_byte_we /= "0000" else '0';
   mem_pause <= ((mem_pause_in or eth_pause) and not enable_misc) or
                (uart_write_busy and enable_uart and write_enable);
   irq_status <= gpioA_in(31) & not gpioA_in(31) &
                 irq_eth_send & irq_eth_rec & 
                 counter_reg(18) & not counter_reg(18) &
                 not uart_write_busy & uart_data_avail;
   irq <= '1' when (irq_status and irq_mask_reg) /= ZERO(7 downto 0) else '0';
   gpio0_out(31 downto 29) <= gpio0_reg(31 downto 29);
   gpio0_out(23 downto 0) <= gpio0_reg(23 downto 0);

   enable_internal_ram <= '1' when address_next(30 downto 28) = "000" else '0';
   enable_misc <= '1' when mem_address(30 downto 28) = "010" else '0';
   enable_uart <= '1' when enable_misc = '1' and mem_address(7 downto 4) = "0000" else '0';
   enable_uart_read <= enable_uart and not write_enable;
   enable_uart_write <= enable_uart and write_enable;
   enable_eth <= '1' when enable_misc = '1' and mem_address(7 downto 4) = "0111" else '0';

   u1_cpu: mlite_cpu 
      generic map (memory_type => memory_type)
      PORT MAP (
         clk          => clk,
         reset_in     => reset,
         intr_in      => irq,
 
         address_next => address_next,
         byte_we_next => byte_we_next,
			opcode_test_out       => opcode_test_check,
			pc_future_test_out    => pc_future_test_check,
		
         address      => mem_address,
         byte_we      => mem_byte_we,
         data_w       => data_w,
         data_r       => data_r,
         mem_pause    => mem_pause);

   misc_proc: process(clk, reset, address_next, mem_address, enable_misc,
      data_read_ram, data_read, data_read_uart, mem_pause,
      irq_mask_reg, irq_status, gpio0_reg, write_enable,
      gpioA_in, counter_reg, data_w)
   begin
      case mem_address(30 downto 28) is
      when "000" =>      --internal RAM
         data_r <= data_read_ram;
      when "001" =>      --external RAM
         data_r <= data_read;
      when "010" =>      --misc
         case mem_address(6 downto 4) is
         when "000" =>      --uart
            data_r <= ZERO(31 downto 8) & data_read_uart;
         when "001" =>      --irq_mask
            data_r <= ZERO(31 downto 8) & irq_mask_reg;
         when "010" =>      --irq_status
            data_r <= ZERO(31 downto 8) & irq_status;
         when "011" =>      --gpio0
            data_r <= gpio0_reg;
         when "101" =>      --gpioA
            data_r <= gpioA_in;
         when "110" =>      --counter
            data_r <= counter_reg;        
         when others =>
            data_r <= gpioA_in;
         end case;
      when "011" =>      --flash
         data_r <= data_read;
      when others =>
         data_r <= ZERO;
      end case;

      if reset = '1' then
         irq_mask_reg <= ZERO(7 downto 0);
         gpio0_reg <= ZERO;
         counter_reg <= ZERO;
      elsif rising_edge(clk) then
         if mem_pause = '0' then
            if enable_misc = '1' and write_enable = '1' then
               if mem_address(6 downto 4) = "001" then
                  irq_mask_reg <= data_w(7 downto 0);
               elsif mem_address(6 downto 4) = "011" then
                  gpio0_reg <= gpio0_reg or data_w;
               elsif mem_address(6 downto 4) = "100" then
                  gpio0_reg <= gpio0_reg and not data_w;
               end if;
            end if;
         end if;
         counter_reg <= bv_inc(counter_reg);
      end if;
   end process;

   u2_ram: ram 
      generic map (memory_type => memory_type)
      port map (
         clk               => clk,
         enable            => enable_internal_ram,
         write_byte_enable => byte_we_next,
         address           => address_next,
         data_write        => data_w,
         data_read         => data_read_ram);

   u3_uart: uart
      generic map (log_file => log_file)
      port map(
         clk          => clk,
         reset        => reset,
         enable_read  => enable_uart_read,
         enable_write => enable_uart_write,
         data_in      => data_w(7 downto 0),
         data_out     => data_read_uart,
         uart_read    => uart_read,
         uart_write   => uart_write,
         busy_write   => uart_write_busy,
         data_avail   => uart_data_avail);

   dma_gen: if ethernet = '0' generate
      address <= mem_address;
      byte_we <= mem_byte_we;
      data_write <= data_w;
      eth_pause <= '0';
      gpio0_out(28 downto 24) <= ZERO(28 downto 24);
      irq_eth_rec <= '0';
      irq_eth_send <= '0';
   end generate;


end; --architecture logic