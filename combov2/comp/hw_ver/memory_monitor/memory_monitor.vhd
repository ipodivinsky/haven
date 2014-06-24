--  ---------------------------------------------------------
--  Hardware accelerated Functional Verification of Processor
--  ---------------------------------------------------------

--  \file   memory_monitor.vhd
--  \date   10-04-2013
--  \brief  Memory monitor is activated by halt signal, then reads
--          memory of processor through its interface and sends
--          content of memory to SW part of verification environment

library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
--use ieee.numeric_std.unsigned;
--use ieee.std_logic_arith.unsigned;

--use work.math_pack.all;

-- ==========================================================================
--                              ENTITY DECLARATION
-- ==========================================================================
entity MEMORY_MONITOR is

   generic
   (
      IN_DATA_WIDTH  : integer := 32;
      OUT_DATA_WIDTH : integer := 64
   );

   port
   (
      CLK            : in  std_logic;
      RESET          : in  std_logic;

      -- start trigger
      START      : in std_logic;
      
      --           input interface - codix - memory read
      --           dbg_mode_mem_* ports
      dbg_mode_mem      : out std_logic;
      dbg_mode_mem_Q0   : in std_logic_vector(31 downto 0); -- data
      dbg_mode_mem_RA0  : out std_logic_vector(18 downto 0);  -- address 19b
      dbg_mode_mem_RE0  : out std_logic;                      -- read enable
      dbg_mode_mem_RSC0 : out std_logic_vector(2 downto 0);   -- subblock count
      dbg_mode_mem_RSI0 : out std_logic_vector(1 downto 0);   -- subblock index

      --           T - transmitter
      --           output frame link interface
      TX_DATA   : out std_logic_vector(OUT_DATA_WIDTH-1 downto 0);
      TX_REM    : out std_logic_vector(2 downto 0);
      TX_SRC_RDY_N : out std_logic;
      TX_DST_RDY_N : in  std_logic;
      TX_SOP_N  : out std_logic;
      TX_EOP_N  : out std_logic;
      TX_SOF_N  : out std_logic;
      TX_EOF_N  : out std_logic;

      -- end of activity
      DONE      : out std_logic

   );
   
end entity;

-- ----------------------------------------------------------
--                 architecture
-- ----------------------------------------------------------
architecture arch of MEMORY_MONITOR is

-- ----------------------------------------------------------
--                 FSM states
-- ----------------------------------------------------------
type state_type is (init_state, send_hdr, read_1half, read_2half, read_wait, read_wait2);

-- ----------------------------------------------------------
--                 constants
-- ----------------------------------------------------------
constant DATA_TYPE   :  std_logic_vector(7 downto 0) := X"00";

--constant MAX_FRAME_SIZE :  std_logic_vector(18 downto 0) := "0001100001101010000";
constant MAX_FRAME_COUNT :  integer := 100;
--constant MAX_FRAME_COUNT :  integer := 50000;

--constant MAX_ADDRESS :  std_logic_vector(18 downto 0) := "0000000000001111100";
constant MAX_ADDRESS :  std_logic_vector(18 downto 0) := "1111111111111111100";
--constant MAX_ADDRESS :  std_logic_vector(18 downto 0) := "0000000000010000000";
--constant MAX_ADDRESS :  std_logic_vector(18 downto 0) := "1111111111111111100";

-- memory monitor endpoint is 8'h03
constant ENDPOINT_ID : std_logic_vector(7 downto 0) := X"03";
constant PROTOCOL_ID : std_logic_vector(7 downto 0) := X"00"; -- TODO: 00 ~ no protocol
                                                              --       01 ~ framelink

-- ----------------------------------------------------------
--                 signals
-- ----------------------------------------------------------
signal sig_cnt_frame : integer;
signal sig_cnt_frame_en : std_logic;
signal sig_cnt_frame_rst : std_logic;

-- FSM signals
signal state_reg, state_next : state_type;

-- address counter register
signal sig_cnt_addr          : std_logic_vector(18 downto 0);     -- address counter 19b
signal sig_cnt_addr_en       : std_logic;      
signal sig_cnt_addr_rst      : std_logic;      

-- input control
signal sig_dbg_mode  : std_logic;
signal sig_re0       : std_logic;
signal sig_rsc0      : std_logic_vector(2 downto 0);
signal sig_rsi0      : std_logic_vector(1 downto 0);

signal input_reg     : std_logic_vector(IN_DATA_WIDTH-1 downto 0);
signal input_reg2     : std_logic_vector(IN_DATA_WIDTH-1 downto 0);

-- output control
signal sig_tx_data   : std_logic_vector(OUT_DATA_WIDTH-1 downto 0);
signal sig_tx_rem    : std_logic_vector(2 downto 0);
signal sig_tx_src_rdy_n : std_logic;
signal sig_tx_dst_rdy_n : std_logic; -- input
signal sig_tx_sop_n  : std_logic;
signal sig_tx_eop_n  : std_logic;
signal sig_tx_sof_n  : std_logic;
signal sig_tx_eof_n  : std_logic;

-- internals
signal hdr_data      : std_logic_vector(OUT_DATA_WIDTH-1 downto 0);
signal hdr_rem       : std_logic_vector(2 downto 0);
signal sig_half         : std_logic;
signal sig_2half         : std_logic;
signal sig_done         : std_logic;
signal sig_last_word    : std_logic;

-- ----------------------------------------------------------
--                 architecture body
-- ----------------------------------------------------------
begin

   sig_rsc0        <= "100";      -- subblock count - 4
   sig_rsi0        <= "10";       -- subblock index
     
-- all bits in headers are valid
   hdr_rem <= "111";

   -- data header
   hdr_data(63 downto 40) <= X"000000";
   hdr_data(39 downto 32) <= DATA_TYPE;
   hdr_data(31 downto 16) <= X"0000";
   hdr_data(15 downto  8) <= PROTOCOL_ID;
   hdr_data( 7 downto  0) <= ENDPOINT_ID;

   -- state logic
   fsm_state_logic : process (CLK)
   begin
      if (rising_edge(CLK)) then
         if (RESET = '1') then
            state_reg <= init_state;
         else
            state_reg <= state_next;
        end if;   
      end if;   
   end process;

   -- next state logic
   fsm_next_state_logic : process (state_reg, dbg_mode_mem_Q0, START, TX_DST_RDY_N,hdr_data, sig_cnt_addr, input_reg, sig_cnt_frame, sig_last_word)
   begin
      state_next            <= state_reg;
      sig_cnt_frame_rst     <= '0';
      sig_cnt_frame_en      <= '0';
      sig_cnt_addr_rst      <= '1';
      sig_cnt_addr_en       <= '0';
      sig_half              <= '0';
      sig_2half              <= '0';
      sig_re0               <= '0';  
      sig_dbg_mode          <= '0';
      sig_done              <= '0';
      sig_tx_data           <= (others => '0');
      sig_tx_rem            <= (others => '0');
      sig_tx_sof_n          <= '1';
      sig_tx_sop_n          <= '1';
      sig_tx_eof_n          <= '1';
      sig_tx_eop_n          <= '1';
      sig_tx_src_rdy_n      <= '1';
      
      --sig_last_word         <= '0';
     

      case state_reg is
         -- init state
         when init_state =>
            -- address counter signals
            sig_cnt_frame_rst     <= '1';
            sig_cnt_addr_rst     <= '1';
            sig_cnt_addr_en      <= '0';
            sig_half             <= '0';

            if (START = '1') then
               state_next        <= send_hdr;
            else
               state_next        <= init_state;
            end if;

         when send_hdr =>
            -- address counter signals
            sig_cnt_addr_rst     <= '0';
            --sig_cnt_addr_en      <= '0';
            sig_half             <= '0';          

            if (TX_DST_RDY_N = '0') then
               sig_tx_data       <= hdr_data;
               sig_tx_rem        <= hdr_rem;
               sig_tx_sof_n      <= '0';
               sig_tx_sop_n      <= '0';
               sig_tx_eof_n      <= '1';
               sig_tx_eop_n      <= '1';
               sig_tx_src_rdy_n  <= '0';

               -- read enable
               sig_re0           <= '1';
               sig_dbg_mode      <= '1';
               
               sig_cnt_frame_en      <= '1';
               
               sig_cnt_addr_en      <= '1';
               
               state_next        <= read_1half;
            else
               sig_cnt_addr_en      <= '0';
               state_next        <= send_hdr;
            end if;

         -- data transfer - read first half (32b) from register file
         when read_1half =>

            -- read enable
            sig_re0              <= '1';
            sig_dbg_mode         <= '1';
            
            
               

               -- end of memory address space
               if (sig_last_word = '1') then --sig_cnt_addr >= MAX_ADDRESS) then
                  if (TX_DST_RDY_N = '0') then
                     sig_tx_data       <= X"00000000" & dbg_mode_mem_Q0;
                     sig_tx_rem        <= "011";
                     sig_tx_sof_n      <= '1';
                     sig_tx_sop_n      <= '1';
                     sig_tx_eof_n      <= '0';
                     sig_tx_eop_n      <= '0';
                     sig_tx_src_rdy_n  <= '0';
                     
                     sig_half          <= '0';
                     sig_done          <= '1';
                     
                     -- address counter signals - increment address
                     sig_cnt_addr_rst     <= '0';
                     sig_cnt_addr_en      <= '1';
                     
                     state_next        <= init_state;
                     
                  else
                     sig_tx_rem        <= "111";
                     sig_tx_sof_n      <= '1';
                     sig_tx_sop_n      <= '1';
                     sig_tx_eof_n      <= '1';
                     sig_tx_eop_n      <= '1';
                     sig_tx_src_rdy_n  <= '1';
                     
                     sig_cnt_addr_rst     <= '0';
                     sig_cnt_addr_en      <= '0';
                     
                     sig_half          <= '0';
                     sig_done          <= '0';
                                 
                     state_next        <= read_1half;
                  end if;

                  
               -- continue with reading
               else
                  sig_tx_rem        <= "111";
                  sig_tx_sof_n      <= '1';
                  sig_tx_sop_n      <= '1';
                  sig_tx_eof_n      <= '1';
                  sig_tx_eop_n      <= '1';
                  sig_tx_src_rdy_n  <= '1';
                  
                  --if (sig_cnt_addr >= MAX_ADDRESS) then
                  --   sig_last_word <= '1';
                  --else
                  --   sig_last_word <= '0';
                  --end if;
                  
                  if (TX_DST_RDY_N = '0') then
                     -- address counter signals - increment address
                     sig_cnt_addr_rst     <= '0';
                     sig_cnt_addr_en      <= '1';
                  
                     sig_half          <= '1';
                  
                     state_next        <= read_2half;
                  else
                     sig_cnt_addr_rst     <= '0';
                     sig_cnt_addr_en      <= '0';
                  
                     sig_half          <= '1';
                  
                     state_next        <= read_wait;
                  end if;
               end if;
               
         when read_wait =>
                  sig_tx_rem        <= "111";
                  sig_tx_sof_n      <= '1';
                  sig_tx_sop_n      <= '1';
                  sig_tx_eof_n      <= '1';
                  sig_tx_eop_n      <= '1';
                  sig_tx_src_rdy_n  <= '1';
                  
                                 sig_re0           <= '1';
               sig_dbg_mode      <= '1';
                  
                  if (TX_DST_RDY_N = '0') then
                  -- address counter signals - increment address
                  sig_cnt_addr_rst     <= '0';
                  sig_cnt_addr_en      <= '1';
                  
                  sig_half          <= '0';
                  
                  state_next        <= read_2half;
                  else
                  sig_cnt_addr_rst     <= '0';
                  sig_cnt_addr_en      <= '0';
                  
                  sig_half          <= '0';
                  
                  state_next        <= read_wait;
                  end if;
         when read_2half =>
            --read enable
            sig_re0              <= '1';
            sig_dbg_mode         <= '1';
            
         --if (TX_DST_RDY_N = '0') then
            -- address counter signals - increment address
            sig_cnt_addr_rst     <= '0';
            sig_half             <= '0';

            -- write data 1half + 2half
            sig_tx_data          <= dbg_mode_mem_Q0 & input_reg;

               -- end of memory address space
            if (sig_last_word = '1') then --sig_cnt_addr >= MAX_ADDRESS) then
               if (TX_DST_RDY_N = '0') then
                  sig_tx_rem        <= "111";
                  sig_tx_sof_n      <= '1';
                  sig_tx_sop_n      <= '1';
                  sig_tx_eof_n      <= '0';
                  sig_tx_eop_n      <= '0';
                  sig_tx_src_rdy_n  <= '0';

                  sig_done          <= '1';
                  
                  sig_cnt_addr_en      <= '1';
                  
                  state_next        <= init_state;
               else   
                  sig_tx_rem        <= "111";
                  sig_tx_sof_n      <= '1';
                  sig_tx_sop_n      <= '1';
                  sig_tx_eof_n      <= '1';
                  sig_tx_eop_n      <= '1';
                  sig_tx_src_rdy_n  <= '0';
                  
                  sig_cnt_addr_rst     <= '0';
                  sig_cnt_addr_en      <= '0';
                  
                  sig_half             <= '0';
                  sig_done             <= '0';
                  
                     
                  state_next        <= read_2half;
               end if;
                  
            elsif ( sig_cnt_frame >= MAX_FRAME_COUNT) then
               if (TX_DST_RDY_N = '0') then
                  sig_tx_rem        <= "111";
                  sig_tx_sof_n      <= '1';
                  sig_tx_sop_n      <= '1';
                  sig_tx_eof_n      <= '0';
                  sig_tx_eop_n      <= '0';
                  sig_tx_src_rdy_n  <= '0';

                  sig_done          <= '0';
                  
                  sig_cnt_frame_rst     <= '1';
                  
                  sig_cnt_addr_en      <= '0';
                  
                  state_next        <= send_hdr;
               else   
                  sig_tx_rem        <= "111";
                  sig_tx_sof_n      <= '1';
                  sig_tx_sop_n      <= '1';
                  sig_tx_eof_n      <= '1';
                  sig_tx_eop_n      <= '1';
                  sig_tx_src_rdy_n  <= '0';
                  
                  sig_cnt_addr_rst     <= '0';
                  sig_cnt_addr_en      <= '0';
                  
                  sig_half             <= '0';
                  sig_done             <= '0';
                  sig_2half              <= '1';
                  
                     
                  state_next        <= read_wait2;
               end if;
               
               -- continue with reading
            else
                  --if (sig_cnt_addr >= MAX_ADDRESS) then
                  --   sig_last_word <= '1';
                  --else
                  --   sig_last_word <= '0';
                  --end if;
            
               if (TX_DST_RDY_N = '0') then
                  sig_tx_rem        <= "111";
                  sig_tx_sof_n      <= '1';
                  sig_tx_sop_n      <= '1';
                  sig_tx_eof_n      <= '1';
                  sig_tx_eop_n      <= '1';
                  sig_tx_src_rdy_n  <= '0';

                  sig_cnt_frame_en      <= '1';
                  
                  sig_cnt_addr_en      <= '1';
                  
                  state_next        <= read_1half;
               else   
                  sig_tx_rem        <= "111";
                  sig_tx_sof_n      <= '1';
                  sig_tx_sop_n      <= '1';
                  sig_tx_eof_n      <= '1';
                  sig_tx_eop_n      <= '1';
                  sig_tx_src_rdy_n  <= '0';
                  
                  sig_cnt_addr_rst     <= '0';
                  sig_cnt_addr_en      <= '0';
                  
                  sig_half             <= '0';
                  sig_done             <= '0';
                  sig_2half              <= '1';
                  
                     
                  state_next        <= read_wait2;
               end if;
            end if;
            
         when read_wait2 =>
                  sig_tx_rem        <= "111";
                  sig_tx_sof_n      <= '1';
                  sig_tx_sop_n      <= '1';
                  sig_tx_eof_n      <= '1';
                  sig_tx_eop_n      <= '1';
                  sig_tx_src_rdy_n  <= '1';
                  
                                 sig_re0           <= '1';
               sig_dbg_mode      <= '1';
               
               sig_2half              <= '0';
               sig_cnt_addr_rst     <= '0';
                  
                  if (TX_DST_RDY_N = '0') then
                  -- address counter signals - increment address
                  --sig_cnt_addr_rst     <= '0';
                  sig_cnt_addr_en      <= '1';
                  
                  --sig_half          <= '0';
                  
                  state_next        <= read_2half;
                  else
                  --sig_cnt_addr_rst     <= '0';
                  sig_cnt_addr_en      <= '0';
                  
                  --sig_half          <= '0';
                  
                  state_next        <= read_wait2;
                  end if;
     end case;
  end process;

  addr_counter : process (CLK)
  begin
     if (rising_edge(CLK)) then
        if (RESET = '1' or sig_cnt_addr_rst = '1') then 
           sig_cnt_addr    <= (others => '0');
           --sig_cnt_addr    <= "1111111111101111000";
        elsif (sig_cnt_addr_en = '1') then
           sig_cnt_addr    <= sig_cnt_addr + 4;
        elsif (sig_2half = '1') then
           sig_cnt_addr    <= sig_cnt_addr - 4;
        end if; 
     end if;
  end process;
  
  last_word_comparator : process (CLK, sig_cnt_addr)
  begin
      if (rising_edge(CLK)) then
        if (RESET = '1') then 
           sig_last_word    <= '0';
        elsif (sig_cnt_addr >= MAX_ADDRESS) then
           sig_last_word <= '1';
        else
           sig_last_word <= '0';
        end if; 
     end if;

  end process;
  
  frame_counter : process (CLK, sig_cnt_frame_en)
  begin
     if (rising_edge(CLK)) then
        if (RESET = '1' or sig_cnt_frame_rst = '1') then
            sig_cnt_frame <= 0;
           --sig_cnt_addr    <= (others => '0');
           --sig_cnt_addr    <= "1111111111101111000";
        elsif (sig_cnt_frame_en = '1') then
           sig_cnt_frame    <= sig_cnt_frame + 1;
        end if;
     end if;
  end process;

  input_register : process (CLK)
  begin
     if (rising_edge(CLK)) then
        if (RESET = '1') then 
           input_reg       <= (others => '0');
        elsif (sig_half = '1') then
           -- input data
           input_reg       <= dbg_mode_mem_Q0;
        end if;
     end if;
  end process;
  
  input_register2 : process (CLK)
  begin
     if (rising_edge(CLK)) then
        if (RESET = '1') then 
           input_reg2       <= (others => '0');
        elsif (sig_2half = '1') then
           -- input data
           input_reg2       <= dbg_mode_mem_Q0;
        end if;
     end if;
  end process;
 
  done_register : process (CLK)
  begin
     if (rising_edge(CLK)) then
        if (RESET = '1') then
            DONE           <= '0';
        elsif (sig_done = '1') then
            DONE           <= '1';
        elsif (sig_done = '0') then
            DONE           <= '0';
        end if;
     end if;
  end process;


  -- input processing
  sig_tx_dst_rdy_n <= TX_DST_RDY_N;

  -- output processing

  dbg_mode_mem      <= sig_dbg_mode;
  dbg_mode_mem_RA0  <= sig_cnt_addr;
  dbg_mode_mem_RE0  <= sig_re0;
  dbg_mode_mem_RSI0 <= sig_rsi0;
  dbg_mode_mem_RSC0 <= sig_rsc0;

  TX_DATA      <= sig_tx_data;
  TX_REM       <= sig_tx_rem;
  TX_SRC_RDY_N <= sig_tx_src_rdy_n;
  TX_SOP_N     <= sig_tx_sop_n;
  TX_EOP_N     <= sig_tx_eop_n;
  TX_SOF_N     <= sig_tx_sof_n;
  TX_EOF_N     <= sig_tx_eof_n;

end architecture;
