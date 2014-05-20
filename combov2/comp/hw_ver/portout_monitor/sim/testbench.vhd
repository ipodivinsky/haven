--  ---------------------------------------------------------
--  Hardware accelerated Functional Verification of Processor
--  ---------------------------------------------------------

--  \file   testbench.vhd
--  \date   03-05-2014
--  \brief  Testbench for testing portout monitor
--  \author Jakub Podivinsky, ipodivinsky@fit.vutbr.cz
--
--  \output Output FrameLink protocol signals are processed by 
--          FL_MONITOR component, data are store in file ./output/monitor 
--
--          Format of output file: 
--             00000001    -- header [7..0]
--             00000000    -- header [15..8]
--             .DATA 0.    -- data [7..0]
--             #           -- end of packet
--             00000001    
--             00000000    
--             .DATA 1.   
--             #    
--                .
--                .
--                .
--             00000001    
--             00000000    
--             .DATA n.   
--             #   

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

   signal port_output  : std_logic_vector(IN_DATA_WIDTH-1 downto 0);
   signal port_output_en : std_logic;

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
   -- -------------------------------------------------------------------------
   --                           Output FL_MONITOR
   -- -------------------------------------------------------------------------
   FL_MONITOR_I : entity work.MONITOR
   generic map (
      RX_TX_DATA_WIDTH => OUT_DATA_WIDTH,
      FILE_NAME  => "./output/monitor",
      FRAME_PARTS => 2,
      RDY_DRIVER => EVER
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

   -- -------------------------------------------------------------------------
   --                   program driver
   -- -------------------------------------------------------------------------
   uut: entity work.PORTOUT_MONITOR
      generic map (
         IN_DATA_WIDTH     => IN_DATA_WIDTH,
         OUT_DATA_WIDTH    => OUT_DATA_WIDTH
      )
      port map (
         CLK          => clk,
         RESET        => reset,

         -- inputs
         PORT_OUTPUT    => port_output,
         PORT_OUTPUT_EN => port_output_en,

         -- outputs
         TX_DATA      => TX_DATA,
         TX_REM       => TX_REM,
         TX_SRC_RDY_N => TX_SRC_RDY_N,
         TX_DST_RDY_N => TX_DST_RDY_N,
         TX_SOP_N     => TX_SOP_N,
         TX_EOP_N     => TX_EOP_N,
         TX_SOF_N     => TX_SOF_N,
         TX_EOF_N     => TX_EOF_N
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

      wait for reset_time;

      port_output_en <= '0';

      wait until rising_edge(clk);
      
      -- generate data
      port_output_en <= '1';
      port_output    <= X"22220000";

      wait until rising_edge(clk);
      wait until rising_edge(clk);
      port_output_en <= '0';
      port_output    <= X"AAAA0000";

      wait until rising_edge(clk); 
      wait until rising_edge(clk);
      
      -- generate data
      port_output_en <= '1';
      port_output    <= X"33330000";

      wait until rising_edge(clk);
      port_output_en <= '0';
	  
	  
      wait until rising_edge(clk);
      wait until rising_edge(clk);
	  
      -- generate data
      port_output_en <= '1';
      port_output    <= X"44440000";

      wait until rising_edge(clk);
      port_output_en <= '0';
	  
	  
      wait until rising_edge(clk);
      wait until rising_edge(clk);
      
      -- generate data
      port_output_en <= '1';
      port_output    <= X"55550000";

      wait until rising_edge(clk);
      port_output_en <= '0';

      wait;

      --report "signal xy is " & std_logic'image(port_output_en) & " at time " & time'image(now);

  end process tb; 
   
end architecture behavioral;
