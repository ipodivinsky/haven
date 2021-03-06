--
-- uh_top_hfe_debug.vhd: Unified Header FIFO, architecture for HFE debugging
-- Copyright (C) 2003 CESNET, Liberouter project
-- Author(s): Filip Hofer fil@liberouter.org
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library unisim;
use unisim.all;

architecture behavioral of UH_TOP is

component UH_FIFO
   port(
      -- HFE interface
      HFE_DOUT   : in  std_logic_vector(15 downto 0); -- SOR data output
      HFE_ADDR   : in  std_logic_vector(5 downto 0);  -- SOR address
      HFE_RDY    : out std_logic;   -- Control signals
      HFE_REQ    : in  std_logic;
      HFE_WEN    : in  std_logic;
      HFE_CLK    : in  std_logic;

      -- LUP interface
      LUP_SR_VALID    : out std_logic;       -- If cell contains unfied header
      LUP_SR_CLEAN    : in  std_logic;       -- Clean addressed cell
      LUP_DATA        : out std_logic_vector(31 downto 0); -- UH data
      LUP_ADDR        : in  std_logic_vector(8 downto 0);  -- Cell addr.
      LUP_CLK         : in  std_logic;

       -- BLOCK RAM READING INTERFACE
      ADDRB       : in  std_logic_vector (9 downto 0);
      DOB         : out std_logic_vector (15 downto 0);
      DIB         : in  std_logic_vector (15 downto 0);
      web         : in  std_logic;
      enb         : in  std_logic;

      RESET      : in std_logic
   );
end component;

-- LBCONN_MEM signals
signal addr : std_logic_vector(11 downto 0); -- Address to BlockRAM
signal rw   : std_logic;                    -- Write/Read#
signal en   : std_logic;                    -- enable
signal data_to_lb   : std_logic_vector(15 downto 0);
signal data_from_lb : std_logic_vector(15 downto 0);



signal addrb   : std_logic_vector(9 downto 0);
signal uh1_dob : std_logic_vector(15 downto 0);
signal uh2_dob : std_logic_vector(15 downto 0);
signal uh3_dob : std_logic_vector(15 downto 0);
signal uh4_dob : std_logic_vector(15 downto 0);


signal uh1_lup_sr_clean_lb : std_logic;
signal uh2_lup_sr_clean_lb : std_logic;
signal uh3_lup_sr_clean_lb : std_logic;
signal uh4_lup_sr_clean_lb : std_logic;
signal uh1_lup_sr_valid_lb : std_logic;
signal uh2_lup_sr_valid_lb : std_logic;
signal uh3_lup_sr_valid_lb : std_logic;
signal uh4_lup_sr_valid_lb : std_logic;

signal sel1: std_logic;
signal sel2: std_logic;
signal sel3: std_logic;
signal sel4: std_logic;

begin

   addrb <=addr(9 downto 0);

   sel1 <= '1' when addr(11 downto 10) = "00" and en = '1' else '0';
   sel2 <= '1' when addr(11 downto 10) = "01" and en = '1' else '0';
   sel3 <= '1' when addr(11 downto 10) = "10" and en = '1' else '0';
   sel4 <= '1' when addr(11 downto 10) = "11" and en = '1' else '0';

   data_to_lb <= uh1_dob when sel1='1' else
                 uh2_dob when sel2='1' else
                 uh3_dob when sel3='1' else
                 uh4_dob;




   uh1_lup_sr_clean_lb <=  '0';
   uh2_lup_sr_clean_lb <=  '0';
   uh3_lup_sr_clean_lb <=  '0';
   uh4_lup_sr_clean_lb <=  '0';


   lb_connect: entity work.lbconn_mem
   generic map(
      ADDR_WIDTH => 12,      -- address bus width
      BASE       => 16#200#  -- base address 0x200
   )
   port map(
      DATA_OUT => data_from_lb,
      DATA_IN  => data_to_lb,
      ADDR     => addr,
      EN       => open,
      RW       => rw,
      DRDY     => '1',
      ARDY     => '1',
      SEL      => en,
      RESET    => reset,
      LBCLK    => LBCLK,
      LBFRAME  => lbframe,
      LBAS     => lbas,
      LBRW     => lbrw,
      LBLAST   => lblast,
      LBAD     => lbad,
      LBHOLDA  => lbholda,
      LBRDY    => lbrdy
   );

   uh1: UH_FIFO port map(
      HFE_DOUT   =>  UH1_HFE_DOUT,
      HFE_ADDR   =>  UH1_HFE_ADDR,
      HFE_RDY    =>  UH1_HFE_RDY,
      HFE_REQ    =>  UH1_HFE_REQ,
      HFE_WEN    =>  UH1_HFE_WEN,
      HFE_CLK    =>  HFE_CLK,

      -- LUP interface
      LUP_SR_VALID  => uh1_lup_sr_valid_lb,
      LUP_SR_CLEAN  => uh1_lup_sr_clean_lb,
      LUP_DATA      => UH1_LUP_DATA,
      LUP_ADDR      => UH1_LUP_ADDR,
      LUP_CLK       => LBCLK,

      ADDRB         => addrb,
      DOB           => uh1_dob,
      DIB           => data_from_lb,
      web           => rw,
      enb           => sel1,

      RESET	    => RESET
   );

   uh2: UH_FIFO port map(
      HFE_DOUT   =>  UH2_HFE_DOUT,
      HFE_ADDR   =>  UH2_HFE_ADDR,
      HFE_RDY    =>  UH2_HFE_RDY,
      HFE_REQ    =>  UH2_HFE_REQ,
      HFE_WEN    =>  UH2_HFE_WEN,
      HFE_CLK    =>  HFE_CLK,

      -- LUP interface
      LUP_SR_VALID  => uh2_lup_sr_valid_lb,
      LUP_SR_CLEAN  => uh2_lup_sr_clean_lb,
      LUP_DATA      => UH2_LUP_DATA,
      LUP_ADDR      => UH2_LUP_ADDR,
      LUP_CLK       => LBCLK,

      ADDRB         => addrb,
      DOB           => uh2_dob,
      DIB           => data_from_lb,
      web           => rw,
      enb           => sel2,

      RESET	    => RESET
   );

   uh3: UH_FIFO port map(
      HFE_DOUT   =>  UH3_HFE_DOUT,
      HFE_ADDR   =>  UH3_HFE_ADDR,
      HFE_RDY    =>  UH3_HFE_RDY,
      HFE_REQ    =>  UH3_HFE_REQ,
      HFE_WEN    =>  UH3_HFE_WEN,
      HFE_CLK    =>  HFE_CLK,


      -- LUP interface
      LUP_SR_VALID  => uh3_lup_sr_valid_lb,
      LUP_SR_CLEAN  => uh3_lup_sr_clean_lb,
      LUP_DATA      => UH3_LUP_DATA,
      LUP_ADDR      => UH3_LUP_ADDR,
      LUP_CLK       => LBCLK,

      ADDRB         => addrb,
      DOB           => uh3_dob,
      DIB           => data_from_lb,
      web           => rw,
      enb           => sel3,

      RESET	    => RESET
   );

   uh4: UH_FIFO port map(
      HFE_DOUT   =>  UH4_HFE_DOUT,
      HFE_ADDR   =>  UH4_HFE_ADDR,
      HFE_RDY    =>  UH4_HFE_RDY,
      HFE_REQ    =>  UH4_HFE_REQ,
      HFE_WEN    =>  UH4_HFE_WEN,
      HFE_CLK    =>  HFE_CLK,


      -- LUP interface
      LUP_SR_VALID  => uh4_lup_sr_valid_lb,
      LUP_SR_CLEAN  => uh4_lup_sr_clean_lb,
      LUP_DATA      => UH4_LUP_DATA,
      LUP_ADDR      => UH4_LUP_ADDR,
      LUP_CLK       => LBCLK,

      ADDRB         => addrb,
      DOB           => uh4_dob,
      DIB           => data_from_lb,
      web           => rw,
      enb           => sel4,

      RESET	    => RESET
   );






end behavioral;
