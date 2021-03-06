-- process_ent.vhd: Entity of process part of XGMII OBUF
-- Copyright (C) 2008 CESNET
-- Author(s): Jiri Matousek <xmatou06@stud.fit.vutbr.cz>
--
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions
-- are met:
-- 1. Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimer.
-- 2. Redistributions in binary form must reproduce the above copyright
--    notice, this list of conditions and the following disclaimer in
--    the documentation and/or other materials provided with the
--    distribution.
-- 3. Neither the name of the Company nor the names of its contributors
--    may be used to endorse or promote products derived from this
--    software without specific prior written permission.
--
-- This software is provided ``as is'', and any express or implied
-- warranties, including, but not limited to, the implied warranties of
-- merchantability and fitness for a particular purpose are disclaimed.
-- In no event shall the company or contributors be liable for any
-- direct, indirect, incidental, special, exemplary, or consequential
-- damages (including, but not limited to, procurement of substitute
-- goods or services; loss of use, data, or profits; or business
-- interruption) however caused and on any theory of liability, whether
-- in contract, strict liability, or tort (including negligence or
-- otherwise) arising in any way out of the use of this software, even
-- if advised of the possibility of such damage.
--
-- $Id$
--
-- TODO:
--


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;


-- ----------------------------------------------------------------------------
--                             Entity
-- ----------------------------------------------------------------------------
entity obuf_xgmii_process is

   port(
      -- Clock signal
      CLK               : in std_logic;
      -- Synchronous reset
      RESET             : in std_logic;

      -- Process inputs
      RX_DATA           : in std_logic_vector(63 downto 0);
      RX_SOP            : in std_logic;
      RX_EOP            : in std_logic;
      RX_EOP_POS        : in std_logic_vector(2 downto 0);
      RX_DV             : in std_logic;
      
      -- Reading requests from FIFOs by XGMII_ENC
      TX_DATA_READ      : in std_logic;
      
      -- Process outputs
      TX_DATA           : out std_logic_vector(63 downto 0);
      TX_SOP            : out std_logic;
      TX_EOP            : out std_logic;
      TX_EOP_POS        : out std_logic_vector(2 downto 0);
      TX_DV             : out std_logic;
      TX_CRC            : out std_logic_vector(31 downto 0);
      TX_CRC_DV         : out std_logic;

      -- '1' Replace source MAC address, '0' keep the one present in frame
      SRC_MAC_RPLC      : in std_logic;

      -- new source MAC address register (in case of it's  replace)
      REG_MAC_ADDR      : in std_logic_vector(47 downto 0);

      -- Send next SRC_MAC_RPLC, active in '1'
      NEXT_SRC_MAC_RPLC : out std_logic;
      
      -- Process part of OBUF is ready for processing data, active in '1'
      RX_DST_RDY        : out std_logic
   );

end entity obuf_xgmii_process;
