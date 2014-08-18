--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_cond_compare_cond_compare_fu_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_cond_compare_cond_compare_fu_semantics_t is
	port (
		ACT : in std_logic;
		ex2_cmp_D0 : out std_logic;
		ex2_cmp_WE0 : out std_logic;
		ex_cmp_D0 : out std_logic;
		ex_cmp_Q0 : in std_logic;
		ex_cond_Q0 : in std_logic_vector(4 downto 0);
		ex_regA_Q0 : in std_logic_vector(31 downto 0);
		ex_regB_Q0 : in std_logic_vector(31 downto 0)	);
end entity codix_risc_ca_core_main_cond_compare_cond_compare_fu_semantics_t;

architecture RTL of codix_risc_ca_core_main_cond_compare_cond_compare_fu_semantics_t is
	-- signal (inner)
	signal codasip_tmp_var_1 : unsigned(3 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_2 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_1_mux_int : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_2_less : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_3_equal : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_4_b : unsigned(32 downto 0);
	-- signal (inner)
	signal lv_bb_5_a : unsigned(32 downto 0);
	-- signal (inner)
	signal lv_bb_6_b_tmp : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_7_a_tmp : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_7_a_tmp_STATEMENT_AST_1881 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_6_b_tmp_STATEMENT_AST_1890 : unsigned(31 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_2_STATEMENT_AST_1904 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_5_a_STATEMENT_AST_1923 : unsigned(32 downto 0);
	-- signal (inner)
	signal lv_bb_4_b_STATEMENT_AST_1937 : unsigned(32 downto 0);
	-- signal (inner)
	signal lv_bb_5_a_STATEMENT_AST_1951 : unsigned(32 downto 0);
	-- signal (inner)
	signal lv_bb_4_b_STATEMENT_AST_1963 : unsigned(32 downto 0);
	-- signal (inner)
	signal lv_bb_3_equal_STATEMENT_AST_1975 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_2_less_STATEMENT_AST_1989 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_2005 : unsigned(3 downto 0);
	-- signal (inner)
	signal lv_bb_1_mux_int_STATEMENT_AST_2016 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_1_mux_int_STATEMENT_AST_2039 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_1_mux_int_STATEMENT_AST_2055 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_1_mux_int_STATEMENT_AST_2073 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_1_mux_int_STATEMENT_AST_2090 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_1_mux_int_STATEMENT_AST_2111 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_1_mux_int_STATEMENT_AST_2159 : unsigned(0 downto 0);
	-- signal (inner)
	signal ex_cmp_STATEMENT_AST_2171 : unsigned(0 downto 0);
	-- signal (inner)
	signal ex2_cmp_STATEMENT_AST_2185 : unsigned(0 downto 0);

		-- datapath signals and constants
	signal lv_bb_1_mux_int_D0_2033_select_14576: std_logic_vector(3 downto 0);
	constant CONSTANT_0_1896: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_1930: unsigned(32 downto 0) := "000000000000000000000000000000000";
	constant CONSTANT_1_1982: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_14_1915: unsigned(3 downto 0) := to_unsigned(14, 4);
	constant CONSTANT_16_1894: unsigned(4 downto 0) := to_unsigned(16, 5);
	constant CONSTANT_2_1913: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_4_1908: unsigned(2 downto 0) := to_unsigned(4, 3);

begin
	-- child instances inside 'main_cond_compare_cond_compare_fu_semantics' functional unit:

		-- conversions for datapath
	lv_bb_1_mux_int_D0_2033_select_14576 <= std_logic_vector(codasip_tmp_var_1);

		-- Datapath code
	-- codix_risc_ca.acdl:1854: lv_bb_7_a_tmp=ex_regA.read()
	lv_bb_7_a_tmp_STATEMENT_AST_1881 <= unsigned(ex_regA_Q0);
	-- codix_risc_ca.acdl:1855: lv_bb_6_b_tmp=(ex_cond.read()&16) ? (unsigned i ...
	lv_bb_6_b_tmp_STATEMENT_AST_1890 <= 
		unsigned(ex_regB_Q0) when (((unsigned(ex_cond_Q0) and CONSTANT_16_1894) /= 0)) else
		resize(CONSTANT_0_1896, 32);
	-- codix_risc_ca.acdl:1864: codasip_tmp_var_2=(((ex_cond.read()&14)==2)||(( ...
	codasip_tmp_var_2_STATEMENT_AST_1904 <= "1" when ((((unsigned(ex_cond_Q0(3 downto 0)) and CONSTANT_14_1915) = CONSTANT_2_1913) or ((unsigned(ex_cond_Q0(3 downto 0)) and CONSTANT_14_1915) = CONSTANT_4_1908))) else "0";
	-- codix_risc_ca.acdl:1858: lv_bb_5_a=((codasip::codasip_int<33, false>  )( ...
	lv_bb_5_a_STATEMENT_AST_1923 <= unsigned(resize(signed(lv_bb_7_a_tmp), 33));
	-- codix_risc_ca.acdl:1859: lv_bb_4_b=((codasip::codasip_int<33, false>  )( ...
	lv_bb_4_b_STATEMENT_AST_1937 <= unsigned(resize(signed(lv_bb_6_b_tmp), 33));
	-- codix_risc_ca.acdl:1862: lv_bb_5_a=((unsigned int  )lv_bb_7_a_tmp)
	lv_bb_5_a_STATEMENT_AST_1951 <= resize(lv_bb_7_a_tmp, 33);
	-- codix_risc_ca.acdl:1863: lv_bb_4_b=((unsigned int  )lv_bb_6_b_tmp)
	lv_bb_4_b_STATEMENT_AST_1963 <= resize(lv_bb_6_b_tmp, 33);
	-- codix_risc_ca.acdl:1866: lv_bb_3_equal=(lv_bb_7_a_tmp==lv_bb_6_b_tmp) ?  ...
	lv_bb_3_equal_STATEMENT_AST_1975 <= 
		CONSTANT_1_1982 when ((lv_bb_7_a_tmp = lv_bb_6_b_tmp)) else
		CONSTANT_0_1896;
	-- codix_risc_ca.acdl:1867: lv_bb_2_less=(((codasip::codasip_int<33, true>  ...
	lv_bb_2_less_STATEMENT_AST_1989 <= 
		CONSTANT_1_1982 when ((signed(lv_bb_5_a) < signed(lv_bb_4_b))) else
		CONSTANT_0_1896;
	-- codix_risc_ca.acdl:1889: codasip_tmp_var_1=ex_cond.read()&14
	codasip_tmp_var_1_STATEMENT_AST_2005 <= (unsigned(ex_cond_Q0(3 downto 0)) and CONSTANT_14_1915);
	-- codix_risc_ca.acdl:1883: lv_bb_1_mux_int=(((lv_bb_7_a_tmp)!=0)&&((lv_bb_ ...
	lv_bb_1_mux_int_STATEMENT_AST_2016 <= 
		CONSTANT_1_1982 when (((lv_bb_7_a_tmp /= CONSTANT_0_1896) and (lv_bb_6_b_tmp /= CONSTANT_0_1896))) else
		CONSTANT_0_1896;
	-- codix_risc_ca.acdl:1873: lv_bb_1_mux_int=lv_bb_2_less
	lv_bb_1_mux_int_STATEMENT_AST_2039 <= lv_bb_2_less;
	-- codix_risc_ca.acdl:1875: lv_bb_1_mux_int=lv_bb_2_less||lv_bb_3_equal
	lv_bb_1_mux_int_STATEMENT_AST_2055 <= "1" when (((lv_bb_2_less /= 0) or (lv_bb_3_equal /= 0))) else "0";
	-- codix_risc_ca.acdl:1881: lv_bb_1_mux_int=(lv_bb_7_a_tmp&lv_bb_6_b_tmp) ? ...
	lv_bb_1_mux_int_STATEMENT_AST_2073 <= 
		CONSTANT_1_1982 when (((lv_bb_7_a_tmp and lv_bb_6_b_tmp) /= 0)) else
		CONSTANT_0_1896;
	-- codix_risc_ca.acdl:1885: lv_bb_1_mux_int=(((lv_bb_7_a_tmp)!=0)||((lv_bb_ ...
	lv_bb_1_mux_int_STATEMENT_AST_2090 <= 
		CONSTANT_1_1982 when (((lv_bb_7_a_tmp /= CONSTANT_0_1896) or (lv_bb_6_b_tmp /= CONSTANT_0_1896))) else
		CONSTANT_0_1896;
	-- codix_risc_ca.acdl:1887: lv_bb_1_mux_int=0
	lv_bb_1_mux_int_STATEMENT_AST_2111 <= CONSTANT_0_1896;
	-- codix_risc_ca.acdl:1871: lv_bb_1_mux_int=lv_bb_3_equal
	lv_bb_1_mux_int_STATEMENT_AST_2159 <= lv_bb_3_equal;
	-- codix_risc_ca.acdl:1892: ex_cmp.write(((codasip::codasip_int<1, false>   ...
	ex_cmp_STATEMENT_AST_2171 <= ((unsigned(ex_cond_Q0(0 downto 0)) and CONSTANT_1_1982) xor lv_bb_1_mux_int);
	-- codix_risc_ca.acdl:1893: ex2_cmp.write(ex_cmp.read())
	ex2_cmp_STATEMENT_AST_2185(0) <= ex_cmp_Q0;
	lv_bb_7_a_tmp <= lv_bb_7_a_tmp_STATEMENT_AST_1881;
	lv_bb_6_b_tmp <= lv_bb_6_b_tmp_STATEMENT_AST_1890;
	codasip_tmp_var_2 <= codasip_tmp_var_2_STATEMENT_AST_1904;
	lv_bb_5_a <= lv_bb_5_a_STATEMENT_AST_1923 when (((ACT = CONSTANT_1_1982(0)) and (codasip_tmp_var_2 /= 0))) else 
		lv_bb_5_a_STATEMENT_AST_1951 when (((ACT = CONSTANT_1_1982(0)) and not((codasip_tmp_var_2 /= 0)))) else
		CONSTANT_0_1930;
	lv_bb_4_b <= lv_bb_4_b_STATEMENT_AST_1937 when (((ACT = CONSTANT_1_1982(0)) and (codasip_tmp_var_2 /= 0))) else 
		lv_bb_4_b_STATEMENT_AST_1963 when (((ACT = CONSTANT_1_1982(0)) and not((codasip_tmp_var_2 /= 0)))) else
		CONSTANT_0_1930;
	lv_bb_3_equal <= lv_bb_3_equal_STATEMENT_AST_1975;
	lv_bb_2_less <= lv_bb_2_less_STATEMENT_AST_1989;
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_2005;
	with lv_bb_1_mux_int_D0_2033_select_14576 select
		lv_bb_1_mux_int <= 
			lv_bb_1_mux_int_STATEMENT_AST_2159 when "0000", 
			lv_bb_1_mux_int_STATEMENT_AST_2039 when "0010", 
			lv_bb_1_mux_int_STATEMENT_AST_2055 when "0100", 
			lv_bb_1_mux_int_STATEMENT_AST_2039 when "0110", 
			lv_bb_1_mux_int_STATEMENT_AST_2055 when "1000", 
			lv_bb_1_mux_int_STATEMENT_AST_2073 when "1010", 
			lv_bb_1_mux_int_STATEMENT_AST_2016 when "1100", 
			lv_bb_1_mux_int_STATEMENT_AST_2090 when "1110", 
			lv_bb_1_mux_int_STATEMENT_AST_2111 when others;
	ex_cmp_D0 <= ex_cmp_STATEMENT_AST_2171(0);
	ex2_cmp_WE0 <= CONSTANT_1_1982(0) when ((ACT = CONSTANT_1_1982(0))) else
		CONSTANT_0_1896(0);
	ex2_cmp_D0 <= ex2_cmp_STATEMENT_AST_2185(0);

end architecture RTL;


