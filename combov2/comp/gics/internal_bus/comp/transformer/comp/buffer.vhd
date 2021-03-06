--
-- buffer.vhd : IB Transformer Buffer
-- Copyright (C) 2008 CESNET
-- Author(s): Tomas Malek <tomalek@liberouter.org>
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library unisim;
use unisim.vcomponents.all;

use work.ib_ifc_pkg.all; 
use work.ib_fmt_pkg.all; 
use work.ib_transformer_pkg.all;

-- ----------------------------------------------------------------------------
--                  ENTITY DECLARATION -- IB Transformer Buffer              -- 
-- ----------------------------------------------------------------------------

entity IB_TRANSFORMER_BUFFER is 
   generic(
      -- Data Width (1-128)
      DATA_WIDTH    : integer := 64;
      -- The number of items to be stored
      ITEMS         : integer :=  16    
   ); 
   port (
      -- Common interface -----------------------------------------------------
      CLK            : in std_logic;
      RESET          : in std_logic;
      
      -- Input interface ------------------------------------------------------
      IN_DATA        : in  std_logic_vector(DATA_WIDTH-1 downto 0);
      IN_SOF_N       : in  std_logic;
      IN_EOF_N       : in  std_logic;
      IN_SRC_RDY_N   : in  std_logic;
      IN_DST_RDY_N   : out std_logic;
 
      -- Output interface -----------------------------------------------------
      OUT_DATA       : out std_logic_vector(DATA_WIDTH-1 downto 0);
      OUT_SOF_N      : out std_logic;
      OUT_EOF_N      : out std_logic;
      OUT_SRC_RDY_N  : out std_logic;
      OUT_DST_RDY_N  : in  std_logic 
   );
end IB_TRANSFORMER_BUFFER;

-- ----------------------------------------------------------------------------
--              ARCHITECTURE DECLARATION -- IB Transformer Buffer            --
-- ----------------------------------------------------------------------------

architecture ib_transformer_buffer_arch of IB_TRANSFORMER_BUFFER is

begin

   -- -------------------------------------------------------------------------
   --                             WITHOUT BUFFER                             --
   -- -------------------------------------------------------------------------

   BUFFER_GEN0: if (ITEMS = 0) generate

      OUT_DATA      <= IN_DATA;
      OUT_SOF_N     <= IN_SOF_N;
      OUT_EOF_N     <= IN_EOF_N;    
      OUT_SRC_RDY_N <= IN_SRC_RDY_N;
      
      IN_DST_RDY_N  <= OUT_DST_RDY_N or RESET;
   
   end generate;

   -- -------------------------------------------------------------------------
   --                           WITH IB PIPE ONLY                            --
   -- -------------------------------------------------------------------------
   
   BUFFER_GEN1: if (ITEMS = 1 or ITEMS = 2) generate

      U_pipe : entity work.IB_PIPE
      generic map (
         DATA_WIDTH     => DATA_WIDTH,
         USE_OUTREG     => (ITEMS = 2)
      )
      port map (
         CLK            => CLK,
         RESET          => RESET,
         
         IN_DATA        => IN_DATA,
         IN_SOF_N       => IN_SOF_N,
         IN_EOF_N       => IN_EOF_N,    
         IN_SRC_RDY_N   => IN_SRC_RDY_N,
         IN_DST_RDY_N   => IN_DST_RDY_N,
                                          
         OUT_DATA       => OUT_DATA,     
         OUT_SOF_N      => OUT_SOF_N,    
         OUT_EOF_N      => OUT_EOF_N,    
         OUT_SRC_RDY_N  => OUT_SRC_RDY_N,
         OUT_DST_RDY_N  => OUT_DST_RDY_N
      );                
      
   end generate;
   
   -- -------------------------------------------------------------------------
   --                               WITH BUFFER                              --
   -- -------------------------------------------------------------------------

   BUFFER_GEN:  if (ITEMS > 2) generate

      U_buffer : entity work.IB_BUFFER_SH
      generic map (
         DATA_WIDTH     => DATA_WIDTH,
         ITEMS          => ITEMS
      )
      port map (
         CLK            => CLK,
         RESET          => RESET,
         
         IN_DATA        => IN_DATA,
         IN_SOF_N       => IN_SOF_N,
         IN_EOF_N       => IN_EOF_N,    
         IN_SRC_RDY_N   => IN_SRC_RDY_N,
         IN_DST_RDY_N   => IN_DST_RDY_N,
                        
         OUT_DATA       => OUT_DATA,     
         OUT_SOF_N      => OUT_SOF_N,    
         OUT_EOF_N      => OUT_EOF_N,    
         OUT_SRC_RDY_N  => OUT_SRC_RDY_N,
         OUT_DST_RDY_N  => OUT_DST_RDY_N
      );                
      
   end generate;   

end ib_transformer_buffer_arch;



