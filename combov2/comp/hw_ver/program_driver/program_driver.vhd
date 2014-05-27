--  ---------------------------------------------------------
--  Hardware Accelerated Functional Verification of Processor
--  ---------------------------------------------------------

--  \file   program_driver.vhd
--  \date   29-04-2014
--  \brief  Program driver transform data received from SW part
--          and resends it to processor interface
--  \author Jakub Podivinsky, ipodivinsky@fit.vutbr.cz
--
--  \inputs: FrameLink protocol, 3 packets of 8 bytes:
--             1st = start packet:  00000001 00000000 - start header
--
--             2nd =  data packets: 00000000 00000000 - header               
--                                   inst 1   inst 0  - instructions
--                                   inst 3   inst 2  - instructions
--                                     .        .     - instructions
--                                     .        .     - instructions
--                                     .        .     - instructions
--             bits significance:  [31]..[0] [31]..[0]   
--       
--             3rd = stop packet:   00000004 00000000 - stop header
--            bytes significance:  [7].............[0]
--
--           MEM_DONE -  informs that the final reading memory finished
--                      now can start next cycle verification
--
--  \output: CODIX memory interface - each of received instruction is 
--                      stored in processor memory
--           DONE - informs that the program has been loaded into the 
--                      processor and the processor started its work


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- ==========================================================================
--                              ENTITY DECLARATION
-- ==========================================================================
entity PROGRAM_DRIVER is

   generic
   (
      IN_DATA_WIDTH     : integer := 64; -- FrameLink data width
      OUT_DATA_WIDTH    : integer := 32  -- memory data width
   );

   port
   (
      CLK               : in  std_logic;
      RESET             : in  std_logic;

      -- input FrameLink interface
      RX_DATA           : in  std_logic_vector(IN_DATA_WIDTH-1 downto 0);
      RX_REM            : in  std_logic_vector(2 downto 0);
      RX_SRC_RDY_N      : in  std_logic;
      RX_DST_RDY_N      : out std_logic;
      RX_SOP_N          : in  std_logic;
      RX_EOP_N          : in  std_logic;
      RX_SOF_N          : in  std_logic;
      RX_EOF_N          : in  std_logic;

      -- indication of memory monitor work done
      MEM_DONE          : in  std_logic;

      -- indication of program driver work done
      DONE              : out std_logic;
      
      -- processor reset
      proc_reset        : out std_logic;
      
      -- output processor memmory interface
      dbg_mode_mem      : out std_logic;
      dbg_mode_mem_D0   : out std_logic_vector(OUT_DATA_WIDTH-1 downto 0);
      dbg_mode_mem_WA0  : out std_logic_vector(18 downto 0);
      dbg_mode_mem_WE0  : out std_logic;
      dbg_mode_mem_WSC0 : out std_logic_vector(2 downto 0);
      dbg_mode_mem_WSI0 : out std_logic_vector(1 downto 0)
   );
   
end entity;

-- ==========================================================================
--                           ARCHITECTURE 
-- ==========================================================================
architecture arch of PROGRAM_DRIVER is

-- ----------------------------------------------------------
--                 FSM states
-- ----------------------------------------------------------
type state_type is (init_state, start_state, data1_state, data2_state, stop_state, wait_state);

-- ----------------------------------------------------------
--                 constants
-- ----------------------------------------------------------
-- parts of header packets, indicate type of packets
constant DATA_TYPE  : std_logic_vector(7 downto 0) := X"00";
constant START_TYPE : std_logic_vector(7 downto 0) := X"01";
constant STOP_TYPE  : std_logic_vector(7 downto 0) := X"04";

-- ----------------------------------------------------------
--                 signals
-- ----------------------------------------------------------
-- FSM signals
signal state_reg, state_next   : state_type;

-- data register and its enable signal
signal sig_data_reg        : std_logic_vector(OUT_DATA_WIDTH-1 downto 0);
signal sig_data_reg_en     : std_logic;

-- indicating first half
signal sig_first_half      : std_logic;

-- trasaction type (data, start, stop)
signal sig_trans_type      : std_logic_vector(7 downto 0);

-- address counter signals (adress, enable signal, adress reset signal)
signal cnt_addr            : std_logic_vector(18 downto 0);                 -- address counter 19b
signal cnt_addr_en         : std_logic;      
signal cnt_addr_rst        : std_logic;      

-- processor reset
signal sig_proc_reset      : std_logic;

-- output interface signals
signal sig_out_done        : std_logic;                                     -- program driver work done
signal sig_out_dbg_mode    : std_logic;                                     -- debug mode memory
signal sig_out_we          : std_logic;                                     -- write enable
signal sig_out_sb_cnt      : std_logic_vector(2 downto 0);                  -- subblock count
signal sig_out_sb_idx      : std_logic_vector(1 downto 0);                  -- subblock index
signal sig_out_d0          : std_logic_vector(OUT_DATA_WIDTH-1 downto 0);   -- data out 32b


-- FrameLink destination ready signals - indicates, that program driver is able to comunicate
signal sig_out_dst_rdy_n : std_logic;


-- ----------------------------------------------------------
--                 architecture body
-- ----------------------------------------------------------
begin

   sig_trans_type    <= RX_DATA(39 downto 32); -- trans type are bits 32 - 39 of header
   sig_out_sb_cnt    <= "100";      -- subblock count - '4'
   sig_out_sb_idx    <= "00";       -- subblock index
   
   -- state logic
   fsm_state_logic : process (CLK)
   begin
      if (rising_edge(CLK)) then
         if (RESET='1') then
            state_reg <= init_state;
         else
            state_reg <= state_next;
         end if;   
      end if;   
   end process;

   -- next state logic
   fsm_next_state_logic : process (state_reg, RX_SOF_N, sig_trans_type, RX_EOP_N, RX_SRC_RDY_N, RX_REM, MEM_DONE)
   begin
      -- inicialization of signals
      state_next         <= state_reg; 
      sig_out_dst_rdy_n  	<= '0';  
      cnt_addr_en          <= '0';   
      sig_data_reg_en      <= '0';
      sig_first_half       <= '0';
      sig_out_done         <= '0';
      sig_out_dbg_mode     <= '0';
      sig_out_we           <= '0';
      sig_proc_reset       <= '1';
     
      case state_reg is
         -- init state
         when init_state =>
            -- request for comunication
            if (RX_SRC_RDY_N = '0') then
               -- first is start header
               if (sig_trans_type = START_TYPE and RX_SOF_N = '0') then
                  sig_out_dst_rdy_n  	<= '0';
                  cnt_addr_en          <= '0';
                  sig_data_reg_en      <= '0';
                  sig_first_half       <= '0';
                  sig_out_done         <= '0';
                  sig_out_dbg_mode     <= '0';
                  sig_out_we           <= '0';
                  sig_proc_reset       <= '0';
                  state_next <= start_state;
               -- wait for start header
               else
                  sig_out_dst_rdy_n  	<= '0';
                  cnt_addr_en          <= '0';
                  sig_data_reg_en      <= '0';
                  sig_first_half       <= '0';
                  sig_out_done         <= '0';
                  sig_out_dbg_mode     <= '0';
                  sig_out_we           <= '0';
                  sig_proc_reset       <= '0';
                  state_next <= init_state;
               end if;
            -- wait for request
            else
               sig_out_dst_rdy_n  	<= '0';
               cnt_addr_en          <= '0';
               sig_data_reg_en      <= '0';
               sig_first_half       <= '0';
               sig_out_done         <= '0';
               sig_out_dbg_mode     <= '0';
               sig_out_we           <= '0';
               sig_proc_reset       <= '0';
               state_next <= init_state;
            end if;

         -- start header was received and data header is transmitted
         when start_state =>
            -- fisrt is data header
            if (RX_SRC_RDY_N = '0' and sig_trans_type = DATA_TYPE and RX_SOF_N = '0') then
               sig_out_dst_rdy_n  	<= '0';
               cnt_addr_en          <= '0';
               sig_data_reg_en      <= '0';
               sig_first_half       <= '0';
               sig_out_done         <= '0';
               sig_out_dbg_mode     <= '1';
               sig_out_we           <= '0';
               state_next <= data1_state;
            --wait for data header
            else
               sig_out_dst_rdy_n  	<= '0';
               cnt_addr_en          <= '0';
               sig_data_reg_en      <= '0';
               sig_first_half       <= '0';
               sig_out_done         <= '0';
               sig_out_dbg_mode     <= '1';
               sig_out_we           <= '0';
               state_next <= start_state;
            end if;
        
         -- data header was received and data are transmitted
         when data1_state =>
            -- read 8B data and write firt half to memmory
            if (RX_SRC_RDY_N = '0' and RX_REM = "111") then
               sig_out_dst_rdy_n  	<= '0';
               cnt_addr_en          <= '1';
               sig_data_reg_en      <= '1';
               sig_first_half       <= '1';
               sig_out_done         <= '0';
               sig_out_dbg_mode     <= '1';
               sig_out_we           <= '1';
               state_next <= data2_state;
            -- read 4b data and write to memmory
            -- it was received only fisrt half
            -- thic half packet can be only last packet
            elsif (RX_SRC_RDY_N = '0' and RX_REM = "011") then
               sig_out_dst_rdy_n  	<= '0';
               cnt_addr_en          <= '0';
               sig_data_reg_en      <= '0';
               sig_first_half       <= '1';
               sig_out_done         <= '0';
               sig_out_dbg_mode     <= '1';
               sig_out_we           <= '1';
               state_next <= stop_state;
            else
            -- wait for data
               sig_out_dst_rdy_n  	<= '0';
               cnt_addr_en          <= '0';
               sig_data_reg_en      <= '0';
               sig_first_half       <= '0';
               sig_out_done         <= '0';
               sig_out_dbg_mode     <= '1';
               sig_out_we           <= '0';
               state_next <= data1_state;
            end if;
         -- data was received, fisrt half war written in memory 
         -- now second half of data is written to memory
         when data2_state =>
            -- it was last data from packet 
            --if (RX_EOP_N = '0' and (RX_SOP_N = '0' or RX_SRC_RDY_N = '1')) then --RX_SOP_N = '0') then  and RX_SRC_RDY_N = '1'
            if ((RX_EOP_N = '0' and RX_SOP_N = '0') or
                (RX_EOP_N = '0' and RX_SOP_N = '1' and RX_SRC_RDY_N = '1') or
                (RX_EOP_N = '1' and RX_SOP_N = '0')) then
               sig_out_dst_rdy_n  	<= '1';
               cnt_addr_en          <= '0';
               sig_data_reg_en      <= '0';
               sig_first_half       <= '0';
               sig_out_done         <= '0';
               sig_out_dbg_mode     <= '1';
               sig_out_we           <= '1';
               state_next <= stop_state;
            -- more packets will follow
            else
               sig_out_dst_rdy_n  	<= '1';
               cnt_addr_en          <= '1';
               sig_data_reg_en      <= '0';
               sig_first_half       <= '0';
               sig_out_done         <= '0';
               sig_out_dbg_mode     <= '1';
               sig_out_we           <= '1';
               state_next <= data1_state;
            end if;
         -- last data from packet was received, waiting for STOP packet or new data packet
         when stop_state =>
            -- stop packet is transmitted
            if (RX_SRC_RDY_N = '0' and sig_trans_type = STOP_TYPE and RX_SOF_N = '0') then
               sig_out_dst_rdy_n  	<= '0';
               cnt_addr_en          <= '0';
               sig_data_reg_en      <= '0';
               sig_first_half       <= '0';
               sig_out_done         <= '0';
               sig_out_dbg_mode     <= '0';
               sig_out_we           <= '0';
               sig_proc_reset       <= '0';
               state_next <= wait_state;
            -- new data will be transmitted
            elsif (RX_SRC_RDY_N = '0' and sig_trans_type = DATA_TYPE and RX_SOF_N = '0') then
               sig_out_dst_rdy_n  	<= '0';
               cnt_addr_en          <= '1';
               sig_data_reg_en      <= '0';
               sig_first_half       <= '0';
               sig_out_done         <= '0';
               sig_out_dbg_mode     <= '1';
               sig_out_we           <= '0';
               state_next <= data1_state;
            -- waiting for stop packet or next data packet
            else 
               sig_out_dst_rdy_n  	<= '0';
               cnt_addr_en          <= '0';
               sig_data_reg_en      <= '0';
               sig_first_half       <= '0';
               sig_out_done         <= '0';
               sig_out_dbg_mode     <= '1';
               sig_out_we           <= '0';
               state_next <= stop_state;
            end if;
         
         -- stop packet was received, waiting for MEM_DONE        
         when wait_state => 
            -- memory reading is done, go to init state
            if (MEM_DONE = '1') then
               sig_out_dst_rdy_n  	<= '0';
               cnt_addr_en          <= '0';
               sig_data_reg_en      <= '0';
               sig_first_half       <= '0';
               sig_out_done         <= '0';
               sig_out_dbg_mode     <= '0';
               sig_out_we           <= '0';
               state_next <= init_state;
            -- waiting for memory done
            else
               sig_out_dst_rdy_n  	<= '1';
               cnt_addr_en          <= '0';
               sig_data_reg_en      <= '0';
               sig_first_half       <= '0';
               sig_out_done         <= '1';
               sig_out_dbg_mode     <= '0';
               sig_out_we           <= '0';
               state_next <= wait_state;
            end if;
     end case;      
   end process;
   
   -- select data to output
   -- two instructions are in input data
   output_mux : process (sig_first_half, sig_data_reg, RX_DATA)
   begin
      case sig_first_half is
         when '1' => -- first instruction is writing to memmory from input
            sig_out_d0 <= RX_DATA(31 downto 0);
         when '0' => -- second half is writing to memory from register
            sig_out_d0 <= sig_data_reg;
         when others =>
            sig_out_d0 <= sig_data_reg;
      end case;
   end process;

   -- register store second instruction from input
   data_reg : process (CLK)
   begin
      if (rising_edge(CLK)) then
         if (RESET = '1') then 
            sig_data_reg    <= (others => '0');
         elsif (sig_data_reg_en = '1') then
            -- enable to store second instruction from input to register
            sig_data_reg <= RX_DATA(63 downto 32);
         end if;
      end if;
   end process;
  
   -- reset address counter after STOP packet is received
	cnt_addr_rst			<= sig_out_done;
   
   -- address counter
   addr_counter : process (CLK, cnt_addr_rst)
   begin
      if (rising_edge(CLK)) then
         if (RESET = '1' or cnt_addr_rst = '1') then 
            cnt_addr <= "0000000000000000000";
         elsif (cnt_addr_en = '1') then
            -- count step is subblock count
            cnt_addr <= cnt_addr + sig_out_sb_cnt;
         end if;
      end if;
   end process;

   -- output processing
   -- FrameLink interface
   RX_DST_RDY_N <= sig_out_dst_rdy_n;
	
   -- DONE output
   DONE              <= sig_out_done;
   
   -- processor reset
   proc_reset        <= sig_proc_reset;
   
   -- CODIX memory interface
   dbg_mode_mem      <= sig_out_dbg_mode;
   dbg_mode_mem_WE0  <= sig_out_we;
   dbg_mode_mem_WA0  <= cnt_addr;
   dbg_mode_mem_WSC0 <= sig_out_sb_cnt;
   dbg_mode_mem_WSI0 <= sig_out_sb_idx;
   dbg_mode_mem_D0   <= sig_out_d0;

end architecture;


