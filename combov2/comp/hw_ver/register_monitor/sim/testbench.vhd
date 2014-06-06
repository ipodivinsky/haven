--  ---------------------------------------------------------
--  Hardware accelerated Functional Verification of Processor
--  ---------------------------------------------------------

--  \file   testbench.vhd
--  \date   10-04-2013
--  \brief  Testbench for memory monitor

library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use work.fl_sim_oper.all;
use work.fl_bfm_pkg.all;
use work.fl_bfm_rdy_pkg.all;
use work.math_pack.all;


entity testbench is
end entity testbench;

architecture behavioral of testbench is

   -- constants
   constant IN_DATA_WIDTH        : integer := 32;
   constant OUT_DATA_WIDTH       : integer := 64;

   constant clkper               : time := 10 ns; 
   constant reset_time           : time := 100 ns;

   -- signals
   signal clk                    : std_logic;
   signal reset                  : std_logic;

   signal START              : std_logic;
   signal DONE              : std_logic;
   signal dbg_mode_regs     : std_logic;
   signal dbg_mode_regs_Q0  : std_logic_vector(IN_DATA_WIDTH-1 downto 0);
   signal dbg_mode_regs_RA0 : std_logic_vector(4 downto 0);
   signal dbg_mode_regs_RE0 : std_logic;

   signal TX_DATA      : std_logic_vector(OUT_DATA_WIDTH-1 downto 0);
   signal TX_REM       : std_logic_vector(2 downto 0);
   signal TX_SRC_RDY_N : std_logic;
   signal TX_DST_RDY_N : std_logic;
   signal TX_SOP_N     : std_logic;
   signal TX_EOP_N     : std_logic;
   signal TX_SOF_N     : std_logic;
   signal TX_EOF_N     : std_logic;

-- ----------------------------------------------------------------------------
--                      Architecture body
-- ----------------------------------------------------------------------------
begin

   uut: entity work.REGISTER_MONITOR
      generic map (
         IN_DATA_WIDTH     => IN_DATA_WIDTH,
         OUT_DATA_WIDTH    => OUT_DATA_WIDTH
      )
      port map (
         CLK               => clk,
         RESET             => reset,

         -- inputs
         dbg_mode_regs      => dbg_mode_regs,
         dbg_mode_regs_Q0   => dbg_mode_regs_Q0,
         TX_DST_RDY_N      => TX_DST_RDY_N,
         START              => START,
         DONE              => DONE,

         -- outputs
         dbg_mode_regs_RA0  => dbg_mode_regs_RA0,
         dbg_mode_regs_RE0  => dbg_mode_regs_RE0,

         TX_DATA      => TX_DATA,
         TX_REM       => TX_REM,
         TX_SRC_RDY_N => TX_SRC_RDY_N,
         TX_SOP_N     => TX_SOP_N,
         TX_EOP_N     => TX_EOP_N,
         TX_SOF_N     => TX_SOF_N,
         TX_EOF_N     => TX_EOF_N

      );
   -- -------------------------------------------------------------------------
   --                           Output FL_MONITOR
   -- -------------------------------------------------------------------------
   FL_MONITOR_I : entity work.MONITOR
   generic map (
      RX_TX_DATA_WIDTH => OUT_DATA_WIDTH,
      FILE_NAME  => "./output/monitor",
      FRAME_PARTS => 2,
      RDY_DRIVER => RND
   )
   port map (
      -- Common interface
      FL_RESET        => reset,
      FL_CLK          => clk,

      RX_DATA         => TX_DATA,
      RX_REM          => TX_REM,
      RX_SOF_N        => TX_SOF_N,
      RX_EOF_N        => TX_EOF_N,
      RX_SOP_N        => TX_SOP_N,
      RX_EOP_N        => TX_EOP_N,
      RX_SRC_RDY_N    => TX_SRC_RDY_N,
      RX_DST_RDY_N    => TX_DST_RDY_N
   ); 

   -- CLK generator
   clkgen: process
   begin
      clk <= '1';
      wait for clkper/2;
      clk <= '0';
      wait for clkper/2;
   end process;
   
   resetgen: process
   begin
      reset <= '1';
      wait for reset_time;
      reset <= '0';
      wait;
   end process;

   tb: process

   begin

      dbg_mode_regs_Q0 <= X"00000000";
      START         <= '0';
      
      wait for reset_time; 
      wait until rising_edge(clk);

      START         <= '1';
      dbg_mode_regs_Q0 <= X"00000000"; -- reg 0
      wait until rising_edge(clk);
      START         <= '0';
      
      wait until rising_edge(clk);
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"11111111"; -- reg 1

      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"22222222"; -- reg 2

      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"33333333"; -- reg 3

      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"44444444"; -- reg 4
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"55555555"; -- reg 5
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"66666666"; -- reg 6
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"77777777"; -- reg 7
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"88888888"; -- reg 8
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"99999999"; -- reg 9
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"AAAAAAAA"; -- reg 10
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"BBBBBBBB"; -- reg 11
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"CCCCCCCC"; -- reg 12
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"DDDDDDDD"; -- reg 13
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"EEEEEEEE"; -- reg 14
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"FFFFFFFF"; -- reg 15
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"AA1111BB"; -- reg 16
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"CC1111DD"; -- reg 17
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"EE1111FF"; -- reg 18
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"AA2222BB"; -- reg 19
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"CC2222DD"; -- reg 20
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"EE2222FF"; -- reg 21
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"AA3333BB"; -- reg 22
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"CC4444DD"; -- reg 23
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"EE5555FF"; -- reg 24
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"AA6666BB"; -- reg 25
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"CC7777DD"; -- reg 26
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"EE8888FF"; -- reg 27
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"AA9999BB"; -- reg 28
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"CC9999DD"; -- reg 29
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"EE9999FF"; -- reg 30
      
      wait until rising_edge(clk) and TX_DST_RDY_N = '0';
      dbg_mode_regs_Q0 <= X"AAAAAABB"; -- reg 31
      
      wait;

  end process tb; 
   
end architecture behavioral;
