--
-- barrel_shifter.vhd Barrel shifter with generic data width
-- Copyright (C) 2009 CESNET
-- Author(s): Vaclav Bartos <washek@liberouter.org>
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

use work.math_pack.all;

-- ----------------------------------------------------------------------------
--                  ENTITY DECLARATION -- Barrel shifter                     -- 
-- ----------------------------------------------------------------------------

entity BARREL_SHIFTER is 
   generic (
      DATA_WIDTH  : integer := 64;
      -- set true to shift left, false to shift right
      SHIFT_LEFT  : boolean := true
   );
   port (
      -- Input interface ------------------------------------------------------
      DATA_IN     : in  std_logic_vector(DATA_WIDTH-1 downto 0);
      DATA_OUT    : out std_logic_vector(DATA_WIDTH-1 downto 0);
      SEL         : in  std_logic_vector(log2(DATA_WIDTH/8)-1 downto 0)
   );
end BARREL_SHIFTER;

-- ----------------------------------------------------------------------------
--                       ARCHITECTURE DECLARATION                            --
-- ----------------------------------------------------------------------------

architecture barrel_shifter_arch of BARREL_SHIFTER is
      
begin
   
   multiplexors: for i in 0 to DATA_WIDTH/8-1 generate
      process (DATA_IN, SEL)
         variable sel_aux: integer;
      begin
         if (SHIFT_LEFT) then
            sel_aux := conv_integer('0'&SEL);
         else
            sel_aux := conv_integer('0'&(0-SEL));
         end if;
         
         DATA_OUT(i*8+7 downto i*8) <= 
                     DATA_IN(
                      ((DATA_WIDTH/8-sel_aux+i) mod (DATA_WIDTH/8))*8 + 7
                     downto
                      ((DATA_WIDTH/8-sel_aux+i) mod (DATA_WIDTH/8))*8
                     );
      end process;
   end generate;
   
end barrel_shifter_arch;
