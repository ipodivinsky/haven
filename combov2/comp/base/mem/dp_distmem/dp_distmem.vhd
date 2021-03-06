--
-- dp_distmem.vhd: Generic dual-port distributed memory
-- Copyright (C) 2005 CESNET
-- Author(s): Petr Kobiersky <xkobie00@stud.fit.vutbr.cz>
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


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use work.math_pack.all;
-- auxilarity functions and constant needed to evaluate generic address etc.
use WORK.distmem_func.all;

-- pragma translate_off
library UNISIM;
use UNISIM.vcomponents.all;
-- pragma translate_on

-- ----------------------------------------------------------------------------
--                      Architecture declaration
-- ----------------------------------------------------------------------------
architecture DP_DISTMEM_ARCH of DP_DISTMEM is


-- ------------ Generic Distributed Ram Component Declaration -----------------
component DP_DISTMEM_DISTRAM is
   generic(
      DISTMEM_TYPE : natural  --only 16,32,64
      );

   port(
      -- R/W Port
      DI     : in std_logic;
      WE     : in std_logic;
      WCLK   : in std_logic;
      ADDRA  : in std_logic_vector (DISTMEM_ADDR_WIDTH(DISTMEM_TYPE)-1 downto 0);
      DOA    : out std_logic;
      -- Read Port
      ADDRB  : in std_logic_vector (DISTMEM_ADDR_WIDTH(DISTMEM_TYPE)-1 downto 0);
      DOB    : out std_logic
   );
end component;



-- -------------- Constants declaration ---------------------------------------
   -- Distributed Rams rows count
   constant DISTMEM_ROWS      : integer := DATA_WIDTH;
   -- Distribued Rams cols count
   constant DISTMEM_COLS      : integer := DISTGENMEM_COLUMN_COUNT(DISTMEM_TYPE,
                                        ITEMS);
   -- Extra address bits for addresing cols
   constant EXTR_ADDR      : integer := DISTGENMEM_COL_ADDR_WIDTH(DISTMEM_COLS);
   -- Distributed Ram address bits
   constant DISTMEM_ADDR      : integer := DISTMEM_ADDR_WIDTH(DISTMEM_TYPE);
   -- Full address bits = extra + normal address
   constant FULL_ADDR      : integer := EXTR_ADDR + DISTMEM_ADDR;
   --Address width of generic memory reduced by needed items
   constant REDUCED_FULL_ADDR : integer := LOG2(ITEMS);
   -- Distributed Ram Data Width
   constant DISTMEM_DATA_WIDTH : integer := 1;



-- ------------------ Types declaration ---------------------------------------
   -- Output array from each column - it will be multiplexed
   type t_out_arr is array (0 to (DISTMEM_COLS-1)) of
                          std_logic_vector(DATA_WIDTH-1 downto 0);


-- ------------------ Signals declaration -------------------------------------
   signal gnd : std_logic; -- Ground

   -- R/W Port internal signals
   signal we_i          : std_logic_vector((DISTMEM_COLS-1) downto 0);
   signal aux_addra     : std_logic_vector(FULL_ADDR-1 downto 0);
   signal doa_i         : t_out_arr;
   -- Read port internal signals
   signal aux_addrb     : std_logic_vector(FULL_ADDR-1 downto 0);
   signal dob_i         : t_out_arr;
   signal aux_null_addr : std_logic_vector(FULL_ADDR-REDUCED_FULL_ADDR
                                                                   downto 0);

begin

-- ----------------- Writing informations about structure ---------------------
GEN_DEBUG: if (DEBUG) generate
  -- pragma translate_off
assert false report "DISTMEM_ROWS: " & integer'image(DISTMEM_ROWS)
                                                                 severity note;
assert false report "DISTMEM_COLS: " & integer'image(DISTMEM_COLS)
                                                                 severity note;
assert false report "EXTR_ADDR: " & integer'image(EXTR_ADDR) severity note;
assert false report "DISTMEM_ADDR: " & integer'image(DISTMEM_ADDR)
                                                                 severity note;
assert false report "FULL_ADDR: " & integer'image(FULL_ADDR) severity note;
assert false report "REDUCED_FULL_ADDR: " & integer'image(REDUCED_FULL_ADDR)
                                                                 severity note;
  -- pragma translate_on
end generate;



-- --------Maping address------------------------------------------------------
DISTMEM_ADDR1: if (REDUCED_FULL_ADDR = FULL_ADDR) generate
   aux_addra <= ADDRA;
   aux_addrb <= ADDRB;
end generate;

DISTMEM_ADDR2: if (REDUCED_FULL_ADDR /= FULL_ADDR) generate
   aux_null_addr <= (others =>'0');
   aux_addra <= aux_null_addr(FULL_ADDR-REDUCED_FULL_ADDR-1 downto 0)
                                                               & ADDRA;
   aux_addrb <= aux_null_addr(FULL_ADDR-REDUCED_FULL_ADDR-1 downto 0)
                                                               & ADDRB;
end generate;


gnd <= '0'; -- Ground


-- --------- Generating and maping blockrams ----------------------------------
   GENMEM_ROW: for i in 0 to (DISTMEM_ROWS-1) generate
      GENMEM_COL: for j in 0 to (DISTMEM_COLS-1) generate
         GEN_INST: DP_DISTMEM_DISTRAM
            generic map (
               DISTMEM_TYPE =>  DISTMEM_TYPE
            )
            port map (
               -- R/W Port
               DI => DI(i),
               WE => we_i(j),
               WCLK => WCLK,
               ADDRA => aux_addra(DISTMEM_ADDR-1 downto 0),
               DOA => doa_i(j)(i),
               -- Read Port
               ADDRB => aux_addrb(DISTMEM_ADDR-1 downto 0),
               DOB => dob_i(j)(i)
            );
      end generate;
   end generate;


-- ------------------- WE Decoder ---------------------------------------------
   MORE_DISTMEM1 : if (DISTMEM_COLS > 1) generate
   process(ADDRA, WE)
   begin
      we_i <= (others => '0');
      for i in 0 to (DISTMEM_COLS-1) loop
         if (conv_std_logic_vector(i, EXTR_ADDR) = ADDRA(FULL_ADDR-1
                                       downto FULL_ADDR-EXTR_ADDR)) then
            we_i(i) <= WE;
         end if;
      end loop;
   end process;
   end generate;

   ONE_DISTMEM1 : if (DISTMEM_COLS = 1) generate
      we_i(0) <= WE;
   end generate;



-- ------------------------ Output multipexors --------------------------------
   MORE_DISTMEM2 : if (EXTR_ADDR > 0) generate
   -- DOA output multiplexor
   process(ADDRA, doa_i)
   begin
      DOA <= (others => '0');
      for i in 0 to (DISTMEM_COLS-1) loop
         if (conv_std_logic_vector(i, EXTR_ADDR) = ADDRA(FULL_ADDR-1 downto
                                          FULL_ADDR-EXTR_ADDR)) then
            DOA <= doa_i(i);
         end if;
      end loop;
   end process;

   -- DOB output multiplexor
   process(ADDRB, dob_i)
   begin
      DOB <= (others => '0');
      for i in 0 to (DISTMEM_COLS-1) loop
         if (conv_std_logic_vector(i, EXTR_ADDR) = ADDRB(FULL_ADDR-1 downto
                                          FULL_ADDR-EXTR_ADDR)) then
            DOB <= dob_i(i);
         end if;
      end loop;
   end process;
   end generate;

   ONE_DISTMEM2 : if (EXTR_ADDR = 0) generate
      -- when one column no output multiplexor
      DOA <= doa_i(0);
      DOB <= dob_i(0);
   end generate;

end architecture DP_DISTMEM_ARCH;
