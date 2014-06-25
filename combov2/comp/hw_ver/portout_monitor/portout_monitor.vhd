--  ---------------------------------------------------------
--  Hardware accelerated Functional Verification of Processor
--  ---------------------------------------------------------

--  \file   portout_monitor.vhd
--  \date   03-05-2014
--  \brief  Portout monitor monitors output interface of processor
--          if portout_en signal is enabled 32b portout signal is
--          send to SW part of verification environment (header + data)
--  \author Jakub Podivinsky, ipodivinsky@fit.vutbr.cz
--
--  \inputs: PORT_OUTPUT - output data of processor
--				 PORT_OUTPUT_EN - is set when output data are valid
--
--
--	\output:	FrameLink protocol, 1 packet of 12 bytes (send as 8B + 4B): 
--				   8B = header
--					4B = data				
--					Header format: 
--    				header[5:7] 	unsused
--						header[4] 		TRANSACTION TYPE (only DATA_TYPE, X"00") 
--						header[2:3]		unsused
--						header[1]			PROTOCOL ID (actualy unused)
--						header[0]			ENDPOINT ID	(portout monitor is X"01")			


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- ==========================================================================
--                              ENTITY DECLARATION
-- ==========================================================================
entity PORTOUT_MONITOR is
   generic
   (
      IN_DATA_WIDTH  : integer := 32; --processor output data width
      OUT_DATA_WIDTH : integer := 64  --FrameLink data width
   );

   port
   (
      CLK            : in  std_logic;
      RESET          : in  std_logic;

      -- nput interface - processor
      PORT_OUTPUT    : in std_logic_vector(IN_DATA_WIDTH-1 downto 0);
      PORT_OUTPUT_EN : in std_logic;

      -- FrameLink output interface
      TX_DATA        : out std_logic_vector(OUT_DATA_WIDTH-1 downto 0);
      TX_REM         : out std_logic_vector(2 downto 0);
      TX_SRC_RDY_N   : out std_logic;
      TX_DST_RDY_N   : in  std_logic;
      TX_SOP_N       : out std_logic;
      TX_EOP_N       : out std_logic;
      TX_SOF_N       : out std_logic;
      TX_EOF_N       : out std_logic

   );
end entity;

-- ----------------------------------------------------------
--                 architecture
-- ----------------------------------------------------------
architecture arch of PORTOUT_MONITOR is

-- ----------------------------------------------------------
--                 FSM states
-- ----------------------------------------------------------
type state_type is (init_state, data_hdr_state, data_state);

-- ----------------------------------------------------------
--                 constants
-- ----------------------------------------------------------
constant DATA_TYPE   : std_logic_vector(7 downto 0) := X"00";
constant START_TYPE  : std_logic_vector(7 downto 0) := X"01";
constant STOP_TYPE   : std_logic_vector(7 downto 0) := X"04";

-- portout monitor endpoint id is 8'h01
constant ENDPOINT_ID : std_logic_vector(7 downto 0) := X"01";
constant PROTOCOL_ID : std_logic_vector(7 downto 0) := X"00"; -- TODO: 00 ~ no protocol
                                                              --       01 ~ framelink

-- ----------------------------------------------------------
--                 signals
-- ----------------------------------------------------------

-- FSM signals
signal state_reg, state_next : state_type;

-- FrameLink output control signals
signal sig_tx_data    : std_logic_vector(OUT_DATA_WIDTH-1 downto 0);
signal sig_tx_rem     : std_logic_vector(2 downto 0);
signal sig_tx_src_rdy_n : std_logic;
signal sig_tx_dst_rdy_n : std_logic; -- input
signal sig_tx_sop_n   : std_logic;
signal sig_tx_eop_n   : std_logic;
signal sig_tx_sof_n   : std_logic;
signal sig_tx_eof_n   : std_logic;

-- internal signals
signal hdr_data       : std_logic_vector(OUT_DATA_WIDTH-1 downto 0);
signal hdr_rem        : std_logic_vector(2 downto 0);

-- register fore storing valid value from processor
signal portout_reg    : std_logic_vector(IN_DATA_WIDTH-1 downto 0);
signal portout_reg_en : std_logic;

-- ----------------------------------------------------------
--                 architecture body
-- ----------------------------------------------------------
begin

	-- header preparation 
   
   hdr_rem <= "111"; -- data width of header is 8b
   hdr_data(63 downto 40) <= X"000000"; -- unused
   hdr_data(39 downto 32) <= DATA_TYPE; -- data are sending
   hdr_data(31 downto 16) <= X"0000";   -- unused
   hdr_data(15 downto  8) <= PROTOCOL_ID; -- actualy unused
   hdr_data( 7 downto  0) <= ENDPOINT_ID; -- endpoint ID of portout monitor is X"01"

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
   fsm_next_state_logic : process (state_reg, PORT_OUTPUT_EN, sig_tx_dst_rdy_n, PORT_OUTPUT, hdr_data, portout_reg)
   begin
      state_next <= state_reg;

      -- inicialization of signals
      sig_tx_src_rdy_n <= '1';
      sig_tx_data  <= X"0000000000000000";
      sig_tx_rem   <= "000";
      sig_tx_eof_n <= '1';
      sig_tx_eop_n <= '1';
      sig_tx_sof_n <= '1';
      sig_tx_sop_n <= '1';

      -- portout register disable
      portout_reg_en <= '0';

      case state_reg is
        
         -- init state
         when init_state => 
            -- data are on processor output and destination is ready to receive data
            if PORT_OUTPUT_EN = '1' then --and sig_tx_dst_rdy_n = '0' then      
               portout_reg_en <= '1'; -- store processor output data
               state_next <= data_hdr_state;
            -- wait for processor data
            else
               state_next <= init_state;
            end if;

         -- data header transfer
         when data_hdr_state =>
            -- wait until destination is not ready
            if sig_tx_dst_rdy_n = '1' then
               sig_tx_src_rdy_n  <= '0';
               state_next <= data_hdr_state;
            -- destination is ready
            else 
               -- FrameLink protocol - data header & SOF & SOP & source ready
               sig_tx_data <= hdr_data;
               sig_tx_rem  <= hdr_rem;
               sig_tx_sof_n<= '0';
               sig_tx_sop_n<= '0';
               sig_tx_eof_n<= '1';
               sig_tx_eop_n<= '1';
               sig_tx_src_rdy_n  <= '0';

               state_next <= data_state;
            end if;

         -- data transaction transfer
         when data_state =>
            -- wait until destination is not ready
            if sig_tx_dst_rdy_n = '1' then
               state_next <= data_state;

            -- destination ready
            else 
               -- FrameLink protocol - data & EOF & EOP & source ready
               sig_tx_data <= X"00000000" & portout_reg; 
               sig_tx_rem  <= "011";
               sig_tx_sof_n<= '1';
               sig_tx_sop_n<= '1';
               sig_tx_eof_n<= '0';
               sig_tx_eop_n<= '0';
               sig_tx_src_rdy_n<= '0';

               state_next <= init_state;
            end if;
     end case;
  end process;
  
   -- output register
   reg_out : process (CLK)
   begin
      if (rising_edge(CLK)) then
         if (RESET = '1') then
            portout_reg <= (others => '0');
         elsif (portout_reg_en = '1') then
            portout_reg <= PORT_OUTPUT;
         end if;
      end if;
   end process;
   
  -- FrameLink input/output processing
  sig_tx_dst_rdy_n <= TX_DST_RDY_N;
  TX_DATA <= sig_tx_data;
  TX_REM  <= sig_tx_rem;
  TX_SRC_RDY_N <= sig_tx_src_rdy_n;
  TX_SOP_N <= sig_tx_sop_n;
  TX_EOP_N <= sig_tx_eop_n;
  TX_SOF_N <= sig_tx_sof_n;
  TX_EOF_N <= sig_tx_eof_n;

end architecture;
