--  ---------------------------------------------------------
--  Hardware accelerated Functional Verification of Processor
--  ---------------------------------------------------------

--  \file   halt_monitor.vhd
--  \date   27-05-2013
--  \brief  Halt monitor monitors port_halt for detection of halt instruction
--          after detection of halt instruction holds processor in reset
--          and propagate information about halt instruction to other monitors

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- ==========================================================================
--                              ENTITY DECLARATION
-- ==========================================================================
entity HALT_MONITOR is port
   (
      CLK            : in  std_logic;
      RESET          : in  std_logic;

      -- detection of halt instruction
      port_halt      : in std_logic;

      -- program driver done
      DRIVER_DONE    : in std_logic;

      -- processor reset
      RST_n          : out std_logic

   );
   
end entity;

-- ==========================================================================
--                           ARCHITECTURE 
-- ==========================================================================
architecture arch of HALT_MONITOR is

-- ----------------------------------------------------------
--                 FSM states
-- ----------------------------------------------------------
type state_type is (init_state, wait_for_halt_state, wait_for_monitors_state);

-- ----------------------------------------------------------
--                 signals
-- ----------------------------------------------------------
-- FSM signals
signal state_reg, state_next : state_type;

signal sig_out_rst_n    : std_logic;
signal sig_driver_done  : std_logic;
signal sig_port_halt    : std_logic;

-- ----------------------------------------------------------
--                 architecture body
-- ----------------------------------------------------------
begin
   sig_driver_done   <= DRIVER_DONE;
   sig_port_halt     <= port_halt;

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
   fsm_next_state_logic : process (sig_driver_done, sig_port_halt)
   begin

      -- initialization
      state_next      <= state_reg;
      sig_out_rst_n   <= '0';

      case state_reg is
         when init_state =>
            if (sig_driver_done = '1') then
               state_next        <= wait_for_halt_state;
               sig_out_rst_n     <= '1';
            else
               state_next <= init_state;
               sig_out_rst_n     <= '1';
            end if;

         when wait_for_halt_state =>
            if (sig_port_halt = '1') then
               state_next        <= wait_for_monitors_state;
               sig_out_rst_n     <= '1';
            else
               state_next        <= wait_for_halt_state;
               sig_out_rst_n     <= '1';
            end if;

         when wait_for_monitors_state =>
            if (sig_driver_done = '1') then
               state_next        <= wait_for_monitors_state;
               sig_out_rst_n     <= '0';
            else
               state_next        <= init_state;
               sig_out_rst_n     <= '1';
            end if;

      end case;
   end process;
   
   -- output processing
   RST_n <= sig_out_rst_n;

end architecture;
