--  ---------------------------------------------------------
--  Hardware Accelerated Functional Verification of Processor
--  ---------------------------------------------------------

--  \file   verification_core.vhd
--  \date   03-05-2014
--  \brief  Architecture of verification core
--  \author Jakub Podivinsky, ipodivinsky@fit.vutbr.cz

library ieee;
use ieee.std_logic_1164.all;

-- HAVEN constants
use work.haven_const.all;

-- ==========================================================================
--                           ARCHITECTURE DESCRIPTION
-- ==========================================================================
architecture arch of verification_core is

-- ==========================================================================
--                                      TYPES
-- ==========================================================================

-- ==========================================================================
--                                    CONSTANTS
-- ==========================================================================

-- ==========================================================================
--                                     SIGNALS
-- ==========================================================================

-- --------------------------------------------------------------------------
-- PROGRAM DRIVER signals 
-- --------------------------------------------------------------------------   
   -- program driver - input = FrameLink input interface
   signal program_driver_in_data             : std_logic_vector(FL_DATA_WIDTH-1 downto 0);
   signal program_driver_in_rem              : std_logic_vector(2 downto 0);
   signal program_driver_in_sof_n            : std_logic;
   signal program_driver_in_sop_n            : std_logic;
   signal program_driver_in_eop_n            : std_logic;
   signal program_driver_in_eof_n            : std_logic;
   signal program_driver_in_src_rdy_n        : std_logic;
   signal program_driver_in_dst_rdy_n        : std_logic;

   -- program driver - control signals   
   signal program_driver_in_mem_done         : std_logic;
   signal program_driver_out_done            : std_logic;
   
   -- program driver - processor reset
   signal program_driver_proc_reset          : std_logic;

   -- program driver - output - processor interface
   signal program_driver_out_dbg             : std_logic;
   signal program_driver_out_d0              : std_logic_vector(CODIX_DATA_WIDTH-1 downto 0);
   signal program_driver_out_wa0             : std_logic_vector(18 downto 0);
   signal program_driver_out_we0             : std_logic;
   signal program_driver_out_wsc0            : std_logic_vector(2 downto 0);
   signal program_driver_out_wsi0            : std_logic_vector(1 downto 0);

-- --------------------------------------------------------------------------
-- DUT (PROCESSOR) signals
-- -------------------------------------------------------------------------- 
   -- DUT - processor input interface - write to memory
   signal dut_in_mem_dbg                     : std_logic;
   signal dut_in_mem_d0                      : std_logic_vector(CODIX_DATA_WIDTH-1 downto 0);
   signal dut_in_mem_wa0                     : std_logic_vector(18 downto 0);
   signal dut_in_mem_we0                     : std_logic;
   signal dut_in_mem_wsc0                    : std_logic_vector(2 downto 0);
   signal dut_in_mem_wsi0                    : std_logic_vector(1 downto 0);

   -- DUT - processor input interface - read from memory
   signal dut_in_mem_ra0                     : std_logic_vector(18 downto 0);
   signal dut_in_mem_re0                     : std_logic;
   signal dut_in_mem_rsc0                    : std_logic_vector(2 downto 0);
   signal dut_in_mem_rsi0                    : std_logic_vector(1 downto 0);

   -- DUT - processor input interface - read from register file
   signal dut_in_regs_dbg                    : std_logic;
   signal dut_in_regs_ra0                    : std_logic_vector(4 downto 0);
   signal dut_in_regs_re0                    : std_logic;

   -- DUT - processor port for interrupt request
   signal dut_in_irq                         : std_logic;

   -- DUT reset
   signal dut_in_rst_n                       : std_logic;

   -- DUT - procesor output interface
   signal dut_out_mem_q0                     : std_logic_vector(CODIX_DATA_WIDTH-1 downto 0);
   signal dut_out_regs_q0                    : std_logic_vector(CODIX_DATA_WIDTH-1 downto 0);
   signal dut_out_port_error                 : std_logic_vector(CODIX_DATA_WIDTH-1 downto 0);
   signal dut_out_port_halt                  : std_logic;
   signal dut_out_port_output                : std_logic_vector(CODIX_DATA_WIDTH-1 downto 0);
   signal dut_out_port_output_en             : std_logic;

-- --------------------------------------------------------------------------
-- PORTOUT MONITOR signals
-- -------------------------------------------------------------------------- 
   -- portout monitor - input - processor interface
   signal portout_monitor_in_port_output    : std_logic_vector(CODIX_DATA_WIDTH-1 downto 0);
   signal portout_monitor_in_port_output_en : std_logic;

   -- portout monitor - output = FrameLink output interface
   signal portout_monitor_out_data           : std_logic_vector(FL_DATA_WIDTH-1 downto 0);
   signal portout_monitor_out_rem            : std_logic_vector(2 downto 0);
   signal portout_monitor_out_src_rdy_n      : std_logic;
   signal portout_monitor_in_dst_rdy_n       : std_logic;
   signal portout_monitor_out_sop_n          : std_logic;
   signal portout_monitor_out_sof_n          : std_logic;
   signal portout_monitor_out_eop_n          : std_logic;
   signal portout_monitor_out_eof_n          : std_logic;
   
-- --------------------------------------------------------------------------
-- REGISTER MONITOR signals
-- -------------------------------------------------------------------------- 
   -- register monitor - input - processor interface
   signal register_monitor_out_dbg_mode_regs   : std_logic;
   signal register_monitor_in_dbg_mode_regs_Q0   : std_logic_vector(CODIX_DATA_WIDTH-1 downto 0);
   signal register_monitor_out_dbg_mode_regs_RA0   : std_logic_vector(REGS_ADDR_WIDTH-1 downto 0);
   signal register_monitor_out_dbg_mode_regs_RE0   : std_logic;
   
   signal register_monitor_in_start               : std_logic;
   signal register_monitor_out_done               : std_logic;

   -- register monitor - output = FrameLink output interface
   signal register_monitor_out_data           : std_logic_vector(FL_DATA_WIDTH-1 downto 0);
   signal register_monitor_out_rem            : std_logic_vector(2 downto 0);
   signal register_monitor_out_src_rdy_n      : std_logic;
   signal register_monitor_in_dst_rdy_n       : std_logic;
   signal register_monitor_out_sop_n          : std_logic;
   signal register_monitor_out_sof_n          : std_logic;
   signal register_monitor_out_eop_n          : std_logic;
   signal register_monitor_out_eof_n          : std_logic;
   
-- --------------------------------------------------------------------------
-- HALT MONITOR signals
-- -------------------------------------------------------------------------- 
   signal halt_monitor_in_port_halt          : std_logic;
   signal halt_monitor_in_driver_done        : std_logic;
   signal halt_monitor_out_rst_n             : std_logic;
   
-- --------------------------------------------------------------------------
-- MEMORY MONITOR signals
-- --------------------------------------------------------------------------   
   -- memory monitor - input - Codix interface
   signal memory_monitor_out_dbg  : std_logic;
   signal memory_monitor_in_q0    : std_logic_vector(CODIX_DATA_WIDTH-1 downto 0);
   signal memory_monitor_out_ra0  : std_logic_vector(18 downto 0);
   signal memory_monitor_out_re0  : std_logic;
   signal memory_monitor_out_rsc0 : std_logic_vector(2 downto 0);
   signal memory_monitor_out_rsi0 : std_logic_vector(1 downto 0);

   -- memory monitor - control signal
   signal memory_monitor_out_done : std_logic;
   signal memory_monitor_in_start        : std_logic;

   -- memory monitor - output - FL interface
   signal memory_monitor_out_data : std_logic_vector(FL_DATA_WIDTH-1 downto 0);
   signal memory_monitor_out_rem  : std_logic_vector(2 downto 0);
   signal memory_monitor_out_src_rdy_n : std_logic;
   signal memory_monitor_in_dst_rdy_n  : std_logic;
   signal memory_monitor_out_sop_n : std_logic;
   signal memory_monitor_out_sof_n : std_logic;
   signal memory_monitor_out_eop_n : std_logic;
   signal memory_monitor_out_eof_n : std_logic;

-- ==========================================================================

begin
   -- TODO: 
   --program_driver_in_mem_done    <= '0';
   dut_in_irq                    <= '0';

   -- ------------------------------------------------------------------------
   --              Mapping of inputs - FrameLink input interface
   -- ------------------------------------------------------------------------
   program_driver_in_data      <= RX_DATA;
   program_driver_in_rem       <= RX_REM;
   program_driver_in_sof_n     <= RX_SOF_N;
   program_driver_in_sop_n     <= RX_SOP_N;
   program_driver_in_eop_n     <= RX_EOP_N;
   program_driver_in_eof_n     <= RX_EOF_N;
   program_driver_in_src_rdy_n <= RX_SRC_RDY_N;
   RX_DST_RDY_N  <= program_driver_in_dst_rdy_n;
   

   -- ------------------------------------------------------------------------
   --              HW_SW_CODASIP - program driver
   -- ------------------------------------------------------------------------
   program_driver_i: entity work.PROGRAM_DRIVER
   generic map(
      -- FrameLink data & Codix data width
      IN_DATA_WIDTH   => FL_DATA_WIDTH,
      OUT_DATA_WIDTH  => CODIX_DATA_WIDTH
   )
   port map(
      -- input clock domain
      CLK               => CLK,
      RESET             => RESET,

      -- FrameLink input interface
      RX_DATA           => program_driver_in_data,
      RX_REM            => program_driver_in_rem,
      RX_SOF_N          => program_driver_in_sof_n,
      RX_SOP_N          => program_driver_in_sop_n,
      RX_EOP_N          => program_driver_in_eop_n,
      RX_EOF_N          => program_driver_in_eof_n,
      RX_SRC_RDY_N      => program_driver_in_src_rdy_n,
      RX_DST_RDY_N      => program_driver_in_dst_rdy_n,

      -- controll input
      MEM_DONE          => program_driver_in_mem_done,
      
      --processor reset
      proc_reset        => program_driver_proc_reset,

      -- processor output interface
      dbg_mode_mem      => program_driver_out_dbg,
      dbg_mode_mem_D0   => program_driver_out_d0,
      dbg_mode_mem_WA0  => program_driver_out_wa0,
      dbg_mode_mem_WE0  => program_driver_out_we0,
      dbg_mode_mem_WSC0 => program_driver_out_wsc0,
      dbg_mode_mem_WSI0 => program_driver_out_wsi0,

      -- controll output
      DONE              => program_driver_out_done
   );

   -- ------------------------------------------------------------------------
   --              DUT - PROCESSOR
   -- ------------------------------------------------------------------------
   gen_dut_codix: if (CORE_TYPE = codasip_codix) generate
      dut_codix_i: entity work.codix_ca_t
      port map (
         -- processor clock and reset
         CLK               => CLK, -- global clock
         RST               => dut_in_rst_n, -- processor reset

         -- processor input/output debug interfece
         dbg_mode_mem      => dut_in_mem_dbg,
         dbg_mode_mem_D0   => dut_in_mem_d0,
         dbg_mode_mem_WA0  => dut_in_mem_wa0,
         dbg_mode_mem_WE0  => dut_in_mem_we0,
         dbg_mode_mem_WSC0 => dut_in_mem_wsc0,
         dbg_mode_mem_WSI0 => dut_in_mem_wsi0,
         dbg_mode_mem_Q0   => dut_out_mem_q0,
         dbg_mode_mem_RA0  => dut_in_mem_ra0,
         dbg_mode_mem_RE0  => dut_in_mem_re0,
         dbg_mode_mem_RSI0 => dut_in_mem_rsi0,
         dbg_mode_mem_RSC0 => dut_in_mem_rsc0,
         dbg_mode_regs     => dut_in_regs_dbg,
         dbg_mode_regs_Q0  => dut_out_regs_q0,
         dbg_mode_regs_RA0 => dut_in_regs_ra0,
         dbg_mode_regs_RE0 => dut_in_regs_re0,
         irq               => dut_in_irq,

         -- processor output
         port_halt         => dut_out_port_halt,
         port_output       => dut_out_port_output,
         port_output_en    => dut_out_port_output_en
      );

   end generate;

   -- ------------------------------------------------------------------------
   --              HW_SW_CODASIP - portout monitor
   -- ------------------------------------------------------------------------
   portout_monitor_i: entity work.PORTOUT_MONITOR
   generic map (
      IN_DATA_WIDTH  => CODIX_DATA_WIDTH,
      OUT_DATA_WIDTH => FL_DATA_WIDTH
   )
   port map (
      -- input clock domain
      CLK            => CLK,
      RESET          => RESET,

      -- inputs(processor output)
      PORT_OUTPUT    => portout_monitor_in_port_output,
      PORT_OUTPUT_EN => portout_monitor_in_port_output_en,

      -- FrameLink outputs
      TX_DATA        => portout_monitor_out_data,
      TX_REM         => portout_monitor_out_rem,
      TX_SRC_RDY_N   => portout_monitor_out_src_rdy_n,
      TX_DST_RDY_N   => portout_monitor_in_dst_rdy_n,
      TX_SOP_N       => portout_monitor_out_sop_n,
      TX_EOP_N       => portout_monitor_out_eop_n,
      TX_SOF_N       => portout_monitor_out_sof_n,
      TX_EOF_N       => portout_monitor_out_eof_n
   );
   
   -- ------------------------------------------------------------------------
   --              HW_SW_CODASIP - register monitor
   -- ------------------------------------------------------------------------
   register_monitor_i: entity work.REGISTER_MONITOR
   generic map (
      IN_DATA_WIDTH     => CODIX_DATA_WIDTH,
      OUT_DATA_WIDTH    => FL_DATA_WIDTH
   )
   port map (
      CLK               => clk,
      RESET             => reset,

      -- inputs
      
      
      START             => register_monitor_in_start,
      DONE              => register_monitor_out_done,

      -- processor interface
      dbg_mode_regs     => register_monitor_out_dbg_mode_regs,
      dbg_mode_regs_Q0  => register_monitor_in_dbg_mode_regs_Q0,
      dbg_mode_regs_RA0 => register_monitor_out_dbg_mode_regs_RA0,
      dbg_mode_regs_RE0 => register_monitor_out_dbg_mode_regs_RE0,

      TX_DATA           => register_monitor_out_data,
      TX_REM            => register_monitor_out_rem,
      TX_SRC_RDY_N      => register_monitor_out_src_rdy_n,
      TX_SOP_N          => register_monitor_out_sop_n,
      TX_EOP_N          => register_monitor_out_eop_n,
      TX_SOF_N          => register_monitor_out_sof_n,
      TX_EOF_N          => register_monitor_out_eof_n,
      TX_DST_RDY_N      => register_monitor_in_dst_rdy_n

      );

   -- ------------------------------------------------------------------------
   --              HW_SW_CODASIP - halt monitor
   -- ------------------------------------------------------------------------
   halt_monitor_i: entity work.HALT_MONITOR
   port map (
      CLK            => CLK,
      RESET          => RESET,
      
      port_halt      => halt_monitor_in_port_halt,
      RST_n          => halt_monitor_out_rst_n, 
      DRIVER_DONE    => halt_monitor_in_driver_done
      );

   -- ------------------------------------------------------------------------
   --              HW_SW_CODASIP - memory monitor (simulation)
   -- ------------------------------------------------------------------------      
--      memory_monitor_i: entity work.MEMORY_MONITOR
--      port map (
--         CLK               => CLK,
--         RESET             => RESET,
--
--         REGS_DONE         => memory_monitor_in_start,
--         DONE              => memory_monitor_out_done
--      );
   -- ------------------------------------------------------------------------
   --              HW_SW_CODASIP - memory monitor
   -- ------------------------------------------------------------------------
   memory_monitor_i: entity work.MEMORY_MONITOR
   generic map (
      IN_DATA_WIDTH     => CODIX_DATA_WIDTH,
      OUT_DATA_WIDTH    => FL_DATA_WIDTH
   )
   port map (
      -- input clock domain
      CLK               => CLK,
      RESET             => RESET,

      -- control signals
      DONE              => memory_monitor_out_done,
      START             => memory_monitor_in_start,    

      -- outputs
      dbg_mode_mem_Q0   => memory_monitor_in_q0,
      dbg_mode_mem      => memory_monitor_out_dbg,
      dbg_mode_mem_RA0  => memory_monitor_out_ra0,
      dbg_mode_mem_RE0  => memory_monitor_out_re0,
      dbg_mode_mem_RSC0 => memory_monitor_out_rsc0,
      dbg_mode_mem_RSI0 => memory_monitor_out_rsi0,

      TX_DATA           => memory_monitor_out_data,
      TX_REM            => memory_monitor_out_rem,
      TX_SRC_RDY_N      => memory_monitor_out_src_rdy_n,
      TX_SOP_N          => memory_monitor_out_sop_n,
      TX_EOP_N          => memory_monitor_out_eop_n,
      TX_SOF_N          => memory_monitor_out_sof_n,
      TX_EOF_N          => memory_monitor_out_eof_n,
      TX_DST_RDY_N      => memory_monitor_in_dst_rdy_n
   );
      
   -- ------------------------------------------------------------------------
   --                          Connection of components
   -- ------------------------------------------------------------------------

   -- =====  dut input signal mapping =====
   -- program driver -> dut
   dut_in_rst_n      <= program_driver_proc_reset and halt_monitor_out_rst_n;
   dut_in_mem_dbg    <= program_driver_out_dbg or memory_monitor_out_dbg;
   dut_in_mem_d0     <= program_driver_out_d0;
   dut_in_mem_wa0    <= program_driver_out_wa0;
   dut_in_mem_we0    <= program_driver_out_we0;
   dut_in_mem_wsc0   <= program_driver_out_wsc0;
   dut_in_mem_wsi0   <= program_driver_out_wsi0;

   -- =====  dut output signal mapping =====
   -- dut -> portout monitor
   portout_monitor_in_port_output      <= dut_out_port_output;
   portout_monitor_in_port_output_en   <= dut_out_port_output_en;
   halt_monitor_in_port_halt           <= dut_out_port_halt;
   
   -- dut -> register monitor
   dut_in_regs_dbg <= register_monitor_out_dbg_mode_regs;
   register_monitor_in_dbg_mode_regs_Q0 <= dut_out_regs_q0;
   dut_in_regs_ra0 <= register_monitor_out_dbg_mode_regs_RA0; 
   dut_in_regs_re0 <= register_monitor_out_dbg_mode_regs_RE0;
         
   -- DUT - processor input interface - read from memory
   --dut_in_mem_ra0    <= "0000000000000000000";
   --dut_in_mem_re0    <= '0';
   --dut_in_mem_rsc0   <= "100";
   --dut_in_mem_rsi0   <= "00";
   
   dut_in_mem_ra0    <= memory_monitor_out_ra0;
   dut_in_mem_re0    <= memory_monitor_out_re0;
   dut_in_mem_rsc0   <= memory_monitor_out_rsc0;
   dut_in_mem_rsi0   <= memory_monitor_out_rsi0;
   
   memory_monitor_in_q0 <= dut_out_mem_q0;


   -- DUT - processor input interface - read from register file
   --dut_in_regs_dbg   <= '0';
   --dut_in_regs_ra0   <= "00000";
   --dut_in_regs_re0   <= '0';
   
   -- =====  halt monitor mapping signals =====
   halt_monitor_in_driver_done   <= program_driver_out_done;
   
   -- =====  memory monitor mapping signals=====
   
   memory_monitor_in_start <= register_monitor_out_done;
   program_driver_in_mem_done <= memory_monitor_out_done;
   
   -- =====  register monitor mapping signals=====   
   register_monitor_in_start <= dut_out_port_halt;

   -- ------------------------------------------------------------------------
   --              Mapping of outputs - FrameLink output interface
   -- ------------------------------------------------------------------------
--   TX_DATA                <= portout_monitor_out_data;
--   TX_REM                 <= portout_monitor_out_rem;
--   TX_SOF_N               <= portout_monitor_out_sof_n;
--   TX_SOP_N               <= portout_monitor_out_sop_n;
--   TX_EOP_N               <= portout_monitor_out_eop_n;
--   TX_EOF_N               <= portout_monitor_out_eof_n;
--   TX_SRC_RDY_N           <= portout_monitor_out_src_rdy_n;
--   portout_monitor_in_dst_rdy_n <= TX_DST_RDY_N;
portout_monitor_in_dst_rdy_n <= '0';
   
   TX_DATA                <= register_monitor_out_data;
   TX_REM                 <= register_monitor_out_rem;
   TX_SOF_N               <= register_monitor_out_sof_n;
   TX_SOP_N               <= register_monitor_out_sop_n;
   TX_EOP_N               <= register_monitor_out_eop_n;
   TX_EOF_N               <= register_monitor_out_eof_n;
   TX_SRC_RDY_N           <= register_monitor_out_src_rdy_n;
   register_monitor_in_dst_rdy_n <= TX_DST_RDY_N;
-- register_monitor_in_dst_rdy_n <= '0';
   
--   TX_DATA                <= memory_monitor_out_data;
--   TX_REM                 <= memory_monitor_out_rem;
--   TX_SOF_N               <= memory_monitor_out_sof_n;
--   TX_SOP_N               <= memory_monitor_out_sop_n;
--   TX_EOP_N               <= memory_monitor_out_eop_n;
--   TX_EOF_N               <= memory_monitor_out_eof_n;
--   TX_SRC_RDY_N           <= memory_monitor_out_src_rdy_n;
--   memory_monitor_in_dst_rdy_n <= TX_DST_RDY_N;
memory_monitor_in_dst_rdy_n <= '0';
end architecture;
