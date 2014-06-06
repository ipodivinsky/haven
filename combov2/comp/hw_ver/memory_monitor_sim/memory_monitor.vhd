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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

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
      REGS_DONE      : in std_logic;

      -- end of activity
      DONE           : out std_logic

   );
   
end entity;

-- ----------------------------------------------------------
--                 architecture
-- ----------------------------------------------------------
architecture arch of MEMORY_MONITOR is

-- ----------------------------------------------------------
--                 FSM states
-- ----------------------------------------------------------
type state_type is (init_state, count_state);

-- ----------------------------------------------------------
--                 constants
-- ----------------------------------------------------------
constant MAX_ADDRESS :  std_logic_vector(17 downto 0) := "001001110001000000";


-- ----------------------------------------------------------
--                 signals
-- ----------------------------------------------------------

-- FSM signals
signal state_reg, state_next : state_type;

-- address counter register
signal cnt_addr          : std_logic_vector(17 downto 0);     -- address counter 19b
signal cnt_addr_en       : std_logic;      
signal cnt_addr_rst      : std_logic;  

signal sig_regs_done       : std_logic;
signal sig_done            : std_logic;    

-- ----------------------------------------------------------
--                 architecture body
-- ----------------------------------------------------------
begin
   sig_regs_done <= REGS_DONE;
  
   -- state logic
   fsm_state_logic : process (CLK)
   begin
     if CLK='1' and CLK'event then
        if RESET='1' then
          state_reg <= init_state;
        else
          state_reg <= state_next;
        end if;   
     end if;   
   end process;

   -- next state logic
   fsm_next_state_logic : process (sig_regs_done, cnt_addr)
   begin

     state_next         <= state_reg;
     sig_done           <= '0';
     cnt_addr_en        <= '0';
     cnt_addr_rst       <= '0';
     

     case state_reg is
        when init_state =>
          if (sig_regs_done = '1') then
            state_next <= count_state;
            sig_done           <= '0';
            cnt_addr_en        <= '1';
            cnt_addr_rst       <= '0';
          else
            state_next <= init_state;
            sig_done           <= '0';
            cnt_addr_en        <= '0';
            cnt_addr_rst       <= '0';
          end if;

        when count_state =>
          if (cnt_addr = MAX_ADDRESS) then
            state_next <= init_state;
            sig_done           <= '1';
            cnt_addr_en        <= '0';
            cnt_addr_rst       <= '1';
          else
            state_next <= count_state;
            sig_done           <= '0';
            cnt_addr_en        <= '1';
            cnt_addr_rst       <= '0';
          end if;

     end case;
  end process;

 
  addr_counter : process (CLK)
  begin
     if (rising_edge(CLK)) then
        if (RESET = '1' or cnt_addr_rst = '1') then 
           cnt_addr <= "000000000000000000";
        elsif (cnt_addr_en = '1') then
           cnt_addr <= cnt_addr + 1;
        end if;
     end if;
  end process;

   DONE <= sig_done;

end architecture;
