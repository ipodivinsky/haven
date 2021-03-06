--
-- sh_reg.vhd: Shift Register
-- Copyright (C) 2003 CESNET
-- Author(s): Martinek Tomas <martinek@liberouter.org>
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
--
library IEEE;
use IEEE.std_logic_1164.all;
-- ----------------------------------------------------------------------------
--                        Entity declaration
-- ----------------------------------------------------------------------------
entity sh_reg is
   generic(
      NUM_BITS : integer;
      INIT     : std_logic_vector(31 downto 0)
   );
   port(
      RESET    : in std_logic;
      CLK      : in std_logic;

      DIN      : in std_logic;
      CE       : in std_logic;
      DOUT     : out std_logic
   );
end entity sh_reg;

-- ----------------------------------------------------------------------------
--                      Architecture declaration
-- ----------------------------------------------------------------------------
architecture behavioral of sh_reg is

signal reg : std_logic_vector(NUM_BITS-1 downto 0);

begin

process(RESET, CLK)
begin
   if (RESET = '1') then
      for i in 0 to NUM_BITS-1 loop
         reg(i) <= INIT(i);
      end loop;
   elsif (CLK'event and CLK='1') then
      if (CE = '1') then
         for i in NUM_BITS-1 downto 1 loop
            reg(i) <= reg(i-1);
         end loop;
         reg(0) <= DIN;
      end if;
   end if;
end process;

DOUT <= reg(NUM_BITS-1);

end architecture behavioral;

