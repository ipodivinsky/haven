--  ---------------------------------------------------------
--  Hardware Accelerated Functional Verification of Processor
--  ---------------------------------------------------------

--  \file   verification_core_ent.vhd
--  \date   03-05-2014
--  \brief  Entity of verification core
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
--           MI32 Interface  -  actually unused
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

-- HAVEN constants
use work.haven_const.all;

-- ==========================================================================
--                              ENTITY DECLARATION
-- ==========================================================================
entity verification_core is
   generic
   (
      FL_DATA_WIDTH      : integer := 64; -- FrameLink data width
      CODIX_DATA_WIDTH   : integer := 32; -- processor data width

      -- the CORE_TYPE generic specifies the verified unit in the core
      -- actually there is only codasip_codix
      CORE_TYPE          : core_type := codasip_codix
   );
   port
   (
      CLK                :  in std_logic;
      RESET              :  in std_logic;

      -- FrameLink input interface
      RX_DATA            :  in std_logic_vector(FL_DATA_WIDTH-1 downto 0);
      RX_REM             :  in std_logic_vector(2 downto 0);
      RX_SOF_N           :  in std_logic;
      RX_EOF_N           :  in std_logic;
      RX_SOP_N           :  in std_logic;
      RX_EOP_N           :  in std_logic;
      RX_SRC_RDY_N       :  in std_logic;
      RX_DST_RDY_N       : out std_logic;

      -- FrameLink output interface - framelink
      TX_DATA            : out std_logic_vector(FL_DATA_WIDTH-1 downto 0);
      TX_REM             : out std_logic_vector(2 downto 0);
      TX_SOF_N           : out std_logic;
      TX_EOF_N           : out std_logic;
      TX_SOP_N           : out std_logic;
      TX_EOP_N           : out std_logic;
      TX_SRC_RDY_N       : out std_logic;
      TX_DST_RDY_N       :  in std_logic;
      
      -- MI32 interface
      MI32_DWR           :  in std_logic_vector(31 downto 0);
      MI32_ADDR          :  in std_logic_vector(31 downto 0);
      MI32_RD            :  in std_logic;
      MI32_WR            :  in std_logic;
      MI32_BE            :  in std_logic_vector(3 downto 0);
      MI32_DRD           : out std_logic_vector(31 downto 0);
      MI32_ARDY          : out std_logic;
      MI32_DRDY          : out std_logic

   );
end entity;
