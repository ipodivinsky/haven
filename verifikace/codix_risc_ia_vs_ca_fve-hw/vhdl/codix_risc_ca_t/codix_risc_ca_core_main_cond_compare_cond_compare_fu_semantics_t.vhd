--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
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
		ex_regB_Q0 : in std_logic_vector(31 downto 0)
	);
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
	signal lv_bb_7_a_tmp_STATEMENT_AST_6417 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_6_b_tmp_STATEMENT_AST_6426 : unsigned(31 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_2_STATEMENT_AST_6440 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_5_a_STATEMENT_AST_6459 : unsigned(32 downto 0);
	-- signal (inner)
	signal lv_bb_4_b_STATEMENT_AST_6473 : unsigned(32 downto 0);
	-- signal (inner)
	signal lv_bb_5_a_STATEMENT_AST_6487 : unsigned(32 downto 0);
	-- signal (inner)
	signal lv_bb_4_b_STATEMENT_AST_6499 : unsigned(32 downto 0);
	-- signal (inner)
	signal lv_bb_3_equal_STATEMENT_AST_6511 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_2_less_STATEMENT_AST_6525 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_6541 : unsigned(3 downto 0);
	-- signal (inner)
	signal lv_bb_1_mux_int_STATEMENT_AST_6552 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_1_mux_int_STATEMENT_AST_6572 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_1_mux_int_STATEMENT_AST_6584 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_1_mux_int_STATEMENT_AST_6600 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_1_mux_int_STATEMENT_AST_6617 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_1_mux_int_STATEMENT_AST_6638 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_1_mux_int_STATEMENT_AST_6659 : unsigned(0 downto 0);
	-- signal (inner)
	signal ex_cmp_STATEMENT_AST_6707 : unsigned(0 downto 0);
	-- signal (inner)
	signal ex2_cmp_STATEMENT_AST_6721 : unsigned(0 downto 0);

		-- datapath signals and constants
	signal lv_bb_1_mux_int_D0_6566_select_15144: std_logic_vector(3 downto 0);
	constant CONSTANT_0_6432: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_6466: unsigned(32 downto 0) := "000000000000000000000000000000000";
	constant CONSTANT_1_6518: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_14_6451: unsigned(3 downto 0) := to_unsigned(14, 4);
	constant CONSTANT_16_6430: unsigned(4 downto 0) := to_unsigned(16, 5);
	constant CONSTANT_2_6449: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_4_6444: unsigned(2 downto 0) := to_unsigned(4, 3);

begin
	-- child instances inside 'main_cond_compare_cond_compare_fu_semantics' functional unit:

		-- conversions for datapath
	lv_bb_1_mux_int_D0_6566_select_15144 <= std_logic_vector(codasip_tmp_var_1);

		-- Datapath code
	-- codix_risc_ca.acdl:1854: lv_bb_7_a_tmp=ex_regA.read()
	lv_bb_7_a_tmp_STATEMENT_AST_6417 <= unsigned(ex_regA_Q0);
	-- codix_risc_ca.acdl:1855: lv_bb_6_b_tmp=(ex_cond.read()&16) ? (unsigned i ...
	lv_bb_6_b_tmp_STATEMENT_AST_6426 <= 
		unsigned(ex_regB_Q0) when (((unsigned(ex_cond_Q0) and CONSTANT_16_6430) /= 0)) else
		resize(CONSTANT_0_6432, 32);
	-- codix_risc_ca.acdl:1864: codasip_tmp_var_2=(((ex_cond.read()&14)==2)||(( ...
	codasip_tmp_var_2_STATEMENT_AST_6440 <= "1" when ((((unsigned(ex_cond_Q0(3 downto 0)) and CONSTANT_14_6451) = CONSTANT_2_6449) or ((unsigned(ex_cond_Q0(3 downto 0)) and CONSTANT_14_6451) = CONSTANT_4_6444))) else "0";
	-- codix_risc_ca.acdl:1858: lv_bb_5_a=((codasip::codasip_int<33, false>  )( ...
	lv_bb_5_a_STATEMENT_AST_6459 <= unsigned(resize(signed(lv_bb_7_a_tmp), 33));
	-- codix_risc_ca.acdl:1859: lv_bb_4_b=((codasip::codasip_int<33, false>  )( ...
	lv_bb_4_b_STATEMENT_AST_6473 <= unsigned(resize(signed(lv_bb_6_b_tmp), 33));
	-- codix_risc_ca.acdl:1862: lv_bb_5_a=((unsigned int  )lv_bb_7_a_tmp)
	lv_bb_5_a_STATEMENT_AST_6487 <= resize(lv_bb_7_a_tmp, 33);
	-- codix_risc_ca.acdl:1863: lv_bb_4_b=((unsigned int  )lv_bb_6_b_tmp)
	lv_bb_4_b_STATEMENT_AST_6499 <= resize(lv_bb_6_b_tmp, 33);
	-- codix_risc_ca.acdl:1866: lv_bb_3_equal=(lv_bb_7_a_tmp==lv_bb_6_b_tmp) ?  ...
	lv_bb_3_equal_STATEMENT_AST_6511 <= 
		CONSTANT_1_6518 when ((lv_bb_7_a_tmp = lv_bb_6_b_tmp)) else
		CONSTANT_0_6432;
	-- codix_risc_ca.acdl:1867: lv_bb_2_less=(((codasip::codasip_int<33, true>  ...
	lv_bb_2_less_STATEMENT_AST_6525 <= 
		CONSTANT_1_6518 when ((signed(lv_bb_5_a) < signed(lv_bb_4_b))) else
		CONSTANT_0_6432;
	-- codix_risc_ca.acdl:1889: codasip_tmp_var_1=ex_cond.read()&14
	codasip_tmp_var_1_STATEMENT_AST_6541 <= (unsigned(ex_cond_Q0(3 downto 0)) and CONSTANT_14_6451);
	-- codix_risc_ca.acdl:1879: lv_bb_1_mux_int=lv_bb_2_less||lv_bb_3_equal
	lv_bb_1_mux_int_STATEMENT_AST_6552 <= "1" when (((lv_bb_2_less /= 0) or (lv_bb_3_equal /= 0))) else "0";
	-- codix_risc_ca.acdl:1871: lv_bb_1_mux_int=lv_bb_3_equal
	lv_bb_1_mux_int_STATEMENT_AST_6572 <= lv_bb_3_equal;
	-- codix_risc_ca.acdl:1877: lv_bb_1_mux_int=lv_bb_2_less
	lv_bb_1_mux_int_STATEMENT_AST_6584 <= lv_bb_2_less;
	-- codix_risc_ca.acdl:1881: lv_bb_1_mux_int=(lv_bb_7_a_tmp&lv_bb_6_b_tmp) ? ...
	lv_bb_1_mux_int_STATEMENT_AST_6600 <= 
		CONSTANT_1_6518 when (((lv_bb_7_a_tmp and lv_bb_6_b_tmp) /= 0)) else
		CONSTANT_0_6432;
	-- codix_risc_ca.acdl:1883: lv_bb_1_mux_int=(((lv_bb_7_a_tmp)!=0)&&((lv_bb_ ...
	lv_bb_1_mux_int_STATEMENT_AST_6617 <= 
		CONSTANT_1_6518 when (((lv_bb_7_a_tmp /= CONSTANT_0_6432) and (lv_bb_6_b_tmp /= CONSTANT_0_6432))) else
		CONSTANT_0_6432;
	-- codix_risc_ca.acdl:1885: lv_bb_1_mux_int=(((lv_bb_7_a_tmp)!=0)||((lv_bb_ ...
	lv_bb_1_mux_int_STATEMENT_AST_6638 <= 
		CONSTANT_1_6518 when (((lv_bb_7_a_tmp /= CONSTANT_0_6432) or (lv_bb_6_b_tmp /= CONSTANT_0_6432))) else
		CONSTANT_0_6432;
	-- codix_risc_ca.acdl:1887: lv_bb_1_mux_int=0
	lv_bb_1_mux_int_STATEMENT_AST_6659 <= CONSTANT_0_6432;
	-- codix_risc_ca.acdl:1892: ex_cmp.write(((codasip::codasip_int<1, false>   ...
	ex_cmp_STATEMENT_AST_6707 <= ((unsigned(ex_cond_Q0(0 downto 0)) and CONSTANT_1_6518) xor lv_bb_1_mux_int);
	-- codix_risc_ca.acdl:1893: ex2_cmp.write(ex_cmp.read())
	ex2_cmp_STATEMENT_AST_6721(0) <= ex_cmp_Q0;
	lv_bb_7_a_tmp <= lv_bb_7_a_tmp_STATEMENT_AST_6417;
	lv_bb_6_b_tmp <= lv_bb_6_b_tmp_STATEMENT_AST_6426;
	codasip_tmp_var_2 <= codasip_tmp_var_2_STATEMENT_AST_6440;
	lv_bb_5_a <= lv_bb_5_a_STATEMENT_AST_6459 when (((ACT = CONSTANT_1_6518(0)) and (codasip_tmp_var_2 /= 0))) else 
		lv_bb_5_a_STATEMENT_AST_6487 when (((ACT = CONSTANT_1_6518(0)) and not((codasip_tmp_var_2 /= 0)))) else
		CONSTANT_0_6466;
	lv_bb_4_b <= lv_bb_4_b_STATEMENT_AST_6473 when (((ACT = CONSTANT_1_6518(0)) and (codasip_tmp_var_2 /= 0))) else 
		lv_bb_4_b_STATEMENT_AST_6499 when (((ACT = CONSTANT_1_6518(0)) and not((codasip_tmp_var_2 /= 0)))) else
		CONSTANT_0_6466;
	lv_bb_3_equal <= lv_bb_3_equal_STATEMENT_AST_6511;
	lv_bb_2_less <= lv_bb_2_less_STATEMENT_AST_6525;
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_6541;
	with lv_bb_1_mux_int_D0_6566_select_15144 select
		lv_bb_1_mux_int <= 
			lv_bb_1_mux_int_STATEMENT_AST_6572 when "0000", 
			lv_bb_1_mux_int_STATEMENT_AST_6584 when "0010", 
			lv_bb_1_mux_int_STATEMENT_AST_6552 when "0100", 
			lv_bb_1_mux_int_STATEMENT_AST_6584 when "0110", 
			lv_bb_1_mux_int_STATEMENT_AST_6552 when "1000", 
			lv_bb_1_mux_int_STATEMENT_AST_6600 when "1010", 
			lv_bb_1_mux_int_STATEMENT_AST_6617 when "1100", 
			lv_bb_1_mux_int_STATEMENT_AST_6638 when "1110", 
			lv_bb_1_mux_int_STATEMENT_AST_6659 when others;
	ex_cmp_D0 <= ex_cmp_STATEMENT_AST_6707(0);
	ex2_cmp_WE0 <= CONSTANT_1_6518(0) when ((ACT = CONSTANT_1_6518(0))) else
		CONSTANT_0_6432(0);
	ex2_cmp_D0 <= ex2_cmp_STATEMENT_AST_6721(0);

end architecture RTL;


