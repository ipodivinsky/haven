-- dma_mod_4x16b_rxtx_const.vhd: User constants for 4x16b RX+TX DMA Module
-- Copyright (C) 2008 CESNET
-- Author(s):  Pavol Korcek <korcek@liberouter.org>
--             Martin Kosek <kosek@liberouter.org>
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

library IEEE;
use IEEE.std_logic_1164.all;

use work.ib_ifc_pkg.all;

package dma_mod_4x16b_rxtx_const is

   -- ------------------ Constants declaration --------------------------------
   
      -- --------------- Internal Bus Endpoint --------------------------------
      -- BASE and LIMIT used only if CONNECTED_TO = SWITCH_SLAVE
      constant IB_EP_CONNECTED_TO       : t_ib_comp := SWITCH_SLAVE;
      constant IB_EP_ENDPOINT_BASE      : std_logic_vector(31 downto 0) := X"02000000";
      constant IB_EP_ENDPOINT_LIMIT     : std_logic_vector(31 downto 0) := X"00300000";
      constant IB_EP_STRICT_ORDER       : boolean := false;
      constant IB_EP_DATA_REORDER       : boolean := false;
      constant IB_EP_READ_IN_PROCESS    : integer := 1;
      constant IB_EP_INPUT_BUFFER_SIZE  : integer := 1;
      constant IB_EP_OUTPUT_BUFFER_SIZE : integer := 1;

      -- RXTX BUFFERs ------------------------------------------------------------
      -- Here you can indirectly change size of RX/TX buffer.
      constant RXTX_BLOCK_SIZE         : integer := 512;  -- 64b words, 512 for 4K, 1024 for 8K
      -- length of one size (head or data) in used protocol (16 bits for FrameLink)
      constant RXTX_TX_SIZE_LENGTH     : integer := 16;
      -- remove header from TXBUF output frames
      constant RXTX_TX_REMOVE_HEADER   : boolean := false;
      -- DMA Controller generics
      constant RXTX_MEM_PAGE_SIZE      : integer := 4096;
      constant RXTX_OPT_DESC_BLOCK_SIZE : integer := 16;
      constant RXTX_INT_TIMEOUT        : integer := 10;
      constant RXTX_BUFFER_ADDR        : std_logic_vector(31 downto 0) := X"02000000";
      constant RXTX_BUFFER_SIZE        : integer := RXTX_BLOCK_SIZE*8;    -- bytes, don't change here
      -- Total size (bytes) for one iterface in RX/TX buffer. 
      constant RXTX_IFC_TOTAL_SIZE     : integer := RXTX_BUFFER_SIZE*4;   -- don't change here, 16384 for 4K, 32768 for 8K
      constant RXTX_DESC_BASE_ADDR     : std_logic_vector(31 downto 0) := X"02200000";
      -- ------------------------------------------------------------------------- 
end dma_mod_4x16b_rxtx_const;

package body dma_mod_4x16b_rxtx_const is
end dma_mod_4x16b_rxtx_const;


