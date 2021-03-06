-- fl_watch_ent.vhd: Frame Link watch comp to gather statistics about trafic
-- Copyright (C) 2006 CESNET
-- Author(s): Viktor Pus <pus@liberouter.org>
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Library with MI32 interface definition
use work.lb_pkg.all;

-- library containing log2 function
use work.math_pack.all;

-- ----------------------------------------------------------------------------
--                            Entity declaration
-- ----------------------------------------------------------------------------
entity FL_WATCH_EXTENDED is
   generic(
      INTERFACES     : integer := 1;  -- At least 1
      CNTR_WIDTH     : integer := 32;
      PIPELINE_LEN   : integer := 1;   -- At least 1
      GUARD          : boolean := true;
      PARTS          : integer := 1
   );
   port(
      CLK            : in  std_logic;
      RESET          : in  std_logic;

      SOF_N          : in std_logic_vector(INTERFACES-1 downto 0);
      EOF_N          : in std_logic_vector(INTERFACES-1 downto 0);
      SOP_N          : in std_logic_vector(INTERFACES-1 downto 0);
      EOP_N          : in std_logic_vector(INTERFACES-1 downto 0);
      DST_RDY_N      : in std_logic_vector(INTERFACES-1 downto 0);
      SRC_RDY_N      : in std_logic_vector(INTERFACES-1 downto 0);

      MI             : inout t_mi32
   );
end entity FL_WATCH_EXTENDED;
