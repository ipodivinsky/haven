--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_alu_alu_fu_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_alu_alu_fu_semantics_t is
	port (
		ACT : in std_logic;
		ex_aluA_Q0 : in std_logic_vector(31 downto 0);
		ex_aluB_Q0 : in std_logic_vector(31 downto 0);
		ex_alu_add_D0 : out std_logic_vector(31 downto 0);
		ex_alu_add_Q0 : in std_logic_vector(31 downto 0);
		ex_alu_arith_D0 : out std_logic_vector(31 downto 0);
		ex_alu_logic_D0 : out std_logic_vector(31 downto 0);
		ex_alu_op_Q0 : in std_logic_vector(5 downto 0);
		int_enabled_Q0 : in std_logic	);
end entity codix_risc_ca_core_main_alu_alu_fu_semantics_t;

architecture RTL of codix_risc_ca_core_main_alu_alu_fu_semantics_t is
	-- signal (inner)
	signal codasip_tmp_var_1 : unsigned(5 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_2 : unsigned(0 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_3 : unsigned(5 downto 0);
	-- signal (inner)
	signal lv_bb_1_cttz_int : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_2_ctlz_int : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_3_ex_aluB_uint5 : unsigned(4 downto 0);
	-- signal (inner)
	signal lv_bb_4_cy : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_5_addB : unsigned(32 downto 0);
	-- signal (inner)
	signal lv_bb_6_addA : unsigned(32 downto 0);
	-- signal (inner)
	signal lv_bb_2_ctlz_int_STATEMENT_AST_866 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_1_cttz_int_STATEMENT_AST_1035 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_3_ex_aluB_uint5_STATEMENT_AST_1204 : unsigned(4 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_3_STATEMENT_AST_1215 : unsigned(5 downto 0);
	-- signal (inner)
	signal ex_alu_logic_STATEMENT_AST_1224 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_logic_STATEMENT_AST_1242 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_logic_STATEMENT_AST_1258 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_logic_STATEMENT_AST_1273 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_logic_STATEMENT_AST_1287 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_logic_STATEMENT_AST_1301 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_logic_STATEMENT_AST_1316 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_logic_STATEMENT_AST_1364 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_logic_STATEMENT_AST_1376 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_6_addA_STATEMENT_AST_1390 : unsigned(32 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_2_STATEMENT_AST_1399 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_5_addB_STATEMENT_AST_1418 : unsigned(32 downto 0);
	-- signal (inner)
	signal lv_bb_4_cy_STATEMENT_AST_1431 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_5_addB_STATEMENT_AST_1444 : unsigned(32 downto 0);
	-- signal (inner)
	signal lv_bb_4_cy_STATEMENT_AST_1455 : unsigned(0 downto 0);
	-- signal (inner)
	signal ex_alu_add_STATEMENT_AST_1465 : unsigned(31 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_1479 : unsigned(5 downto 0);
	-- signal (inner)
	signal ex_alu_arith_STATEMENT_AST_1488 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_arith_STATEMENT_AST_1740 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_arith_STATEMENT_AST_1755 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_arith_STATEMENT_AST_1799 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_arith_STATEMENT_AST_1814 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_arith_STATEMENT_AST_1826 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_arith_STATEMENT_AST_1838 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_arith_STATEMENT_AST_1850 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_arith_STATEMENT_AST_1866 : unsigned(31 downto 0);

		-- datapath signals and constants
	signal tmp_conv_logic_to_unsigned_14573: unsigned(31 downto 0);
	signal ex_alu_logic_D0_1236_select_14574: std_logic_vector(5 downto 0);
	signal ex_alu_arith_D0_1734_select_14575: std_logic_vector(5 downto 0);
	constant CONSTANT_0_1028: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_1424: unsigned(32 downto 0) := "000000000000000000000000000000000";
	constant CONSTANT_1_1027: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_10_1018: unsigned(3 downto 0) := to_unsigned(10, 4);
	constant CONSTANT_1024_954: unsigned(10 downto 0) := to_unsigned(1024, 11);
	constant CONSTANT_1048576_914: unsigned(20 downto 0) := to_unsigned(1048576, 21);
	constant CONSTANT_1073741824_874: unsigned(30 downto 0) := to_unsigned(1073741824, 31);
	constant CONSTANT_11_1017: unsigned(3 downto 0) := to_unsigned(11, 4);
	constant CONSTANT_12_1016: unsigned(3 downto 0) := to_unsigned(12, 4);
	constant CONSTANT_128_966: unsigned(7 downto 0) := to_unsigned(128, 8);
	constant CONSTANT_13_1015: unsigned(3 downto 0) := to_unsigned(13, 4);
	constant CONSTANT_131072_926: unsigned(17 downto 0) := to_unsigned(131072, 18);
	constant CONSTANT_134217728_886: unsigned(27 downto 0) := to_unsigned(134217728, 28);
	constant CONSTANT_14_1014: unsigned(3 downto 0) := to_unsigned(14, 4);
	constant CONSTANT_15_1013: unsigned(3 downto 0) := to_unsigned(15, 4);
	constant CONSTANT_16_1012: unsigned(4 downto 0) := to_unsigned(16, 5);
	constant CONSTANT_16384_938: unsigned(14 downto 0) := to_unsigned(16384, 15);
	constant CONSTANT_16777216_898: unsigned(24 downto 0) := to_unsigned(16777216, 25);
	constant CONSTANT_17_1011: unsigned(4 downto 0) := to_unsigned(17, 5);
	constant CONSTANT_18_1010: unsigned(4 downto 0) := to_unsigned(18, 5);
	constant CONSTANT_19_1009: unsigned(4 downto 0) := to_unsigned(19, 5);
	constant CONSTANT_2_1026: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_20_1008: unsigned(4 downto 0) := to_unsigned(20, 5);
	constant CONSTANT_2048_950: unsigned(11 downto 0) := to_unsigned(2048, 12);
	constant CONSTANT_2097152_910: unsigned(21 downto 0) := to_unsigned(2097152, 22);
	constant CONSTANT_21_1007: unsigned(4 downto 0) := to_unsigned(21, 5);
	constant CONSTANT_2147483648_870: unsigned(31 downto 0) := "10000000000000000000000000000000";
	constant CONSTANT_22_1006: unsigned(4 downto 0) := to_unsigned(22, 5);
	constant CONSTANT_23_1005: unsigned(4 downto 0) := to_unsigned(23, 5);
	constant CONSTANT_24_1004: unsigned(4 downto 0) := to_unsigned(24, 5);
	constant CONSTANT_25_1003: unsigned(4 downto 0) := to_unsigned(25, 5);
	constant CONSTANT_255_1250: unsigned(7 downto 0) := to_unsigned(255, 8);
	constant CONSTANT_256_962: unsigned(8 downto 0) := to_unsigned(256, 9);
	constant CONSTANT_26_1002: unsigned(4 downto 0) := to_unsigned(26, 5);
	constant CONSTANT_262144_922: unsigned(18 downto 0) := to_unsigned(262144, 19);
	constant CONSTANT_268435456_882: unsigned(28 downto 0) := to_unsigned(268435456, 29);
	constant CONSTANT_27_1001: unsigned(4 downto 0) := to_unsigned(27, 5);
	constant CONSTANT_28_1000: unsigned(4 downto 0) := to_unsigned(28, 5);
	constant CONSTANT_29_999: unsigned(4 downto 0) := to_unsigned(29, 5);
	constant CONSTANT_3_1025: unsigned(1 downto 0) := to_unsigned(3, 2);
	constant CONSTANT_30_998: unsigned(4 downto 0) := to_unsigned(30, 5);
	constant CONSTANT_31_997: unsigned(4 downto 0) := to_unsigned(31, 5);
	constant CONSTANT_32_974: unsigned(5 downto 0) := to_unsigned(32, 6);
	constant CONSTANT_32768_934: unsigned(15 downto 0) := to_unsigned(32768, 16);
	constant CONSTANT_33554432_894: unsigned(25 downto 0) := to_unsigned(33554432, 26);
	constant CONSTANT_4_1024: unsigned(2 downto 0) := to_unsigned(4, 3);
	constant CONSTANT_4096_946: unsigned(12 downto 0) := to_unsigned(4096, 13);
	constant CONSTANT_4194304_906: unsigned(22 downto 0) := to_unsigned(4194304, 23);
	constant CONSTANT_5_1023: unsigned(2 downto 0) := to_unsigned(5, 3);
	constant CONSTANT_50_1407: unsigned(5 downto 0) := to_unsigned(50, 6);
	constant CONSTANT_51_1403: unsigned(5 downto 0) := to_unsigned(51, 6);
	constant CONSTANT_512_958: unsigned(9 downto 0) := to_unsigned(512, 10);
	constant CONSTANT_524288_918: unsigned(19 downto 0) := to_unsigned(524288, 20);
	constant CONSTANT_536870912_878: unsigned(29 downto 0) := to_unsigned(536870912, 30);
	constant CONSTANT_6_1022: unsigned(2 downto 0) := to_unsigned(6, 3);
	constant CONSTANT_64_970: unsigned(6 downto 0) := to_unsigned(64, 7);
	constant CONSTANT_65535_1232: unsigned(15 downto 0) := to_unsigned(65535, 16);
	constant CONSTANT_65536_930: unsigned(16 downto 0) := to_unsigned(65536, 17);
	constant CONSTANT_67108864_890: unsigned(26 downto 0) := to_unsigned(67108864, 27);
	constant CONSTANT_7_1021: unsigned(2 downto 0) := to_unsigned(7, 3);
	constant CONSTANT_8_1020: unsigned(3 downto 0) := to_unsigned(8, 4);
	constant CONSTANT_8192_942: unsigned(13 downto 0) := to_unsigned(8192, 14);
	constant CONSTANT_8388608_902: unsigned(23 downto 0) := to_unsigned(8388608, 24);
	constant CONSTANT_9_1019: unsigned(3 downto 0) := to_unsigned(9, 4);

begin
	-- child instances inside 'main_alu_alu_fu_semantics' functional unit:

		-- conversions for datapath
	tmp_conv_logic_to_unsigned_14573 <= "0000000000000000000000000000000" & int_enabled_Q0;
	ex_alu_logic_D0_1236_select_14574 <= std_logic_vector(codasip_tmp_var_3);
	ex_alu_arith_D0_1734_select_14575 <= std_logic_vector(codasip_tmp_var_1);

		-- Datapath code
	-- codix_risc_ca.acdl:1940: lv_bb_2_ctlz_int=(ex_aluB.read()&2147483648) ?  ...
	lv_bb_2_ctlz_int_STATEMENT_AST_866 <= 
		resize(CONSTANT_0_1028, 32) when (((unsigned(ex_aluB_Q0) and CONSTANT_2147483648_870) /= 0)) else
		resize(CONSTANT_1_1027, 32) when (((unsigned(ex_aluB_Q0(30 downto 0)) and CONSTANT_1073741824_874) /= 0)) else
		resize(CONSTANT_2_1026, 32) when (((unsigned(ex_aluB_Q0(29 downto 0)) and CONSTANT_536870912_878) /= 0)) else
		resize(CONSTANT_3_1025, 32) when (((unsigned(ex_aluB_Q0(28 downto 0)) and CONSTANT_268435456_882) /= 0)) else
		resize(CONSTANT_4_1024, 32) when (((unsigned(ex_aluB_Q0(27 downto 0)) and CONSTANT_134217728_886) /= 0)) else
		resize(CONSTANT_5_1023, 32) when (((unsigned(ex_aluB_Q0(26 downto 0)) and CONSTANT_67108864_890) /= 0)) else
		resize(CONSTANT_6_1022, 32) when (((unsigned(ex_aluB_Q0(25 downto 0)) and CONSTANT_33554432_894) /= 0)) else
		resize(CONSTANT_7_1021, 32) when (((unsigned(ex_aluB_Q0(24 downto 0)) and CONSTANT_16777216_898) /= 0)) else
		resize(CONSTANT_8_1020, 32) when (((unsigned(ex_aluB_Q0(23 downto 0)) and CONSTANT_8388608_902) /= 0)) else
		resize(CONSTANT_9_1019, 32) when (((unsigned(ex_aluB_Q0(22 downto 0)) and CONSTANT_4194304_906) /= 0)) else
		resize(CONSTANT_10_1018, 32) when (((unsigned(ex_aluB_Q0(21 downto 0)) and CONSTANT_2097152_910) /= 0)) else
		resize(CONSTANT_11_1017, 32) when (((unsigned(ex_aluB_Q0(20 downto 0)) and CONSTANT_1048576_914) /= 0)) else
		resize(CONSTANT_12_1016, 32) when (((unsigned(ex_aluB_Q0(19 downto 0)) and CONSTANT_524288_918) /= 0)) else
		resize(CONSTANT_13_1015, 32) when (((unsigned(ex_aluB_Q0(18 downto 0)) and CONSTANT_262144_922) /= 0)) else
		resize(CONSTANT_14_1014, 32) when (((unsigned(ex_aluB_Q0(17 downto 0)) and CONSTANT_131072_926) /= 0)) else
		resize(CONSTANT_15_1013, 32) when (((unsigned(ex_aluB_Q0(16 downto 0)) and CONSTANT_65536_930) /= 0)) else
		resize(CONSTANT_16_1012, 32) when (((unsigned(ex_aluB_Q0(15 downto 0)) and CONSTANT_32768_934) /= 0)) else
		resize(CONSTANT_17_1011, 32) when (((unsigned(ex_aluB_Q0(14 downto 0)) and CONSTANT_16384_938) /= 0)) else
		resize(CONSTANT_18_1010, 32) when (((unsigned(ex_aluB_Q0(13 downto 0)) and CONSTANT_8192_942) /= 0)) else
		resize(CONSTANT_19_1009, 32) when (((unsigned(ex_aluB_Q0(12 downto 0)) and CONSTANT_4096_946) /= 0)) else
		resize(CONSTANT_20_1008, 32) when (((unsigned(ex_aluB_Q0(11 downto 0)) and CONSTANT_2048_950) /= 0)) else
		resize(CONSTANT_21_1007, 32) when (((unsigned(ex_aluB_Q0(10 downto 0)) and CONSTANT_1024_954) /= 0)) else
		resize(CONSTANT_22_1006, 32) when (((unsigned(ex_aluB_Q0(9 downto 0)) and CONSTANT_512_958) /= 0)) else
		resize(CONSTANT_23_1005, 32) when (((unsigned(ex_aluB_Q0(8 downto 0)) and CONSTANT_256_962) /= 0)) else
		resize(CONSTANT_24_1004, 32) when (((unsigned(ex_aluB_Q0(7 downto 0)) and CONSTANT_128_966) /= 0)) else
		resize(CONSTANT_25_1003, 32) when (((unsigned(ex_aluB_Q0(6 downto 0)) and CONSTANT_64_970) /= 0)) else
		resize(CONSTANT_26_1002, 32) when (((unsigned(ex_aluB_Q0(5 downto 0)) and CONSTANT_32_974) /= 0)) else
		resize(CONSTANT_27_1001, 32) when (((unsigned(ex_aluB_Q0(4 downto 0)) and CONSTANT_16_1012) /= 0)) else
		resize(CONSTANT_28_1000, 32) when (((unsigned(ex_aluB_Q0(3 downto 0)) and CONSTANT_8_1020) /= 0)) else
		resize(CONSTANT_29_999, 32) when (((unsigned(ex_aluB_Q0(2 downto 0)) and CONSTANT_4_1024) /= 0)) else
		resize(CONSTANT_30_998, 32) when (((unsigned(ex_aluB_Q0(1 downto 0)) and CONSTANT_2_1026) /= 0)) else
		resize(CONSTANT_31_997, 32) when (((unsigned(ex_aluB_Q0(0 downto 0)) and CONSTANT_1_1027) /= 0)) else
		resize(CONSTANT_32_974, 32);
	-- codix_risc_ca.acdl:1973: lv_bb_1_cttz_int=(ex_aluB.read()&1) ? (codasip: ...
	lv_bb_1_cttz_int_STATEMENT_AST_1035 <= 
		resize(CONSTANT_0_1028, 32) when (((unsigned(ex_aluB_Q0(0 downto 0)) and CONSTANT_1_1027) /= 0)) else
		resize(CONSTANT_1_1027, 32) when (((unsigned(ex_aluB_Q0(1 downto 0)) and CONSTANT_2_1026) /= 0)) else
		resize(CONSTANT_2_1026, 32) when (((unsigned(ex_aluB_Q0(2 downto 0)) and CONSTANT_4_1024) /= 0)) else
		resize(CONSTANT_3_1025, 32) when (((unsigned(ex_aluB_Q0(3 downto 0)) and CONSTANT_8_1020) /= 0)) else
		resize(CONSTANT_4_1024, 32) when (((unsigned(ex_aluB_Q0(4 downto 0)) and CONSTANT_16_1012) /= 0)) else
		resize(CONSTANT_5_1023, 32) when (((unsigned(ex_aluB_Q0(5 downto 0)) and CONSTANT_32_974) /= 0)) else
		resize(CONSTANT_6_1022, 32) when (((unsigned(ex_aluB_Q0(6 downto 0)) and CONSTANT_64_970) /= 0)) else
		resize(CONSTANT_7_1021, 32) when (((unsigned(ex_aluB_Q0(7 downto 0)) and CONSTANT_128_966) /= 0)) else
		resize(CONSTANT_8_1020, 32) when (((unsigned(ex_aluB_Q0(8 downto 0)) and CONSTANT_256_962) /= 0)) else
		resize(CONSTANT_9_1019, 32) when (((unsigned(ex_aluB_Q0(9 downto 0)) and CONSTANT_512_958) /= 0)) else
		resize(CONSTANT_10_1018, 32) when (((unsigned(ex_aluB_Q0(10 downto 0)) and CONSTANT_1024_954) /= 0)) else
		resize(CONSTANT_11_1017, 32) when (((unsigned(ex_aluB_Q0(11 downto 0)) and CONSTANT_2048_950) /= 0)) else
		resize(CONSTANT_12_1016, 32) when (((unsigned(ex_aluB_Q0(12 downto 0)) and CONSTANT_4096_946) /= 0)) else
		resize(CONSTANT_13_1015, 32) when (((unsigned(ex_aluB_Q0(13 downto 0)) and CONSTANT_8192_942) /= 0)) else
		resize(CONSTANT_14_1014, 32) when (((unsigned(ex_aluB_Q0(14 downto 0)) and CONSTANT_16384_938) /= 0)) else
		resize(CONSTANT_15_1013, 32) when (((unsigned(ex_aluB_Q0(15 downto 0)) and CONSTANT_32768_934) /= 0)) else
		resize(CONSTANT_16_1012, 32) when (((unsigned(ex_aluB_Q0(16 downto 0)) and CONSTANT_65536_930) /= 0)) else
		resize(CONSTANT_17_1011, 32) when (((unsigned(ex_aluB_Q0(17 downto 0)) and CONSTANT_131072_926) /= 0)) else
		resize(CONSTANT_18_1010, 32) when (((unsigned(ex_aluB_Q0(18 downto 0)) and CONSTANT_262144_922) /= 0)) else
		resize(CONSTANT_19_1009, 32) when (((unsigned(ex_aluB_Q0(19 downto 0)) and CONSTANT_524288_918) /= 0)) else
		resize(CONSTANT_20_1008, 32) when (((unsigned(ex_aluB_Q0(20 downto 0)) and CONSTANT_1048576_914) /= 0)) else
		resize(CONSTANT_21_1007, 32) when (((unsigned(ex_aluB_Q0(21 downto 0)) and CONSTANT_2097152_910) /= 0)) else
		resize(CONSTANT_22_1006, 32) when (((unsigned(ex_aluB_Q0(22 downto 0)) and CONSTANT_4194304_906) /= 0)) else
		resize(CONSTANT_23_1005, 32) when (((unsigned(ex_aluB_Q0(23 downto 0)) and CONSTANT_8388608_902) /= 0)) else
		resize(CONSTANT_24_1004, 32) when (((unsigned(ex_aluB_Q0(24 downto 0)) and CONSTANT_16777216_898) /= 0)) else
		resize(CONSTANT_25_1003, 32) when (((unsigned(ex_aluB_Q0(25 downto 0)) and CONSTANT_33554432_894) /= 0)) else
		resize(CONSTANT_26_1002, 32) when (((unsigned(ex_aluB_Q0(26 downto 0)) and CONSTANT_67108864_890) /= 0)) else
		resize(CONSTANT_27_1001, 32) when (((unsigned(ex_aluB_Q0(27 downto 0)) and CONSTANT_134217728_886) /= 0)) else
		resize(CONSTANT_28_1000, 32) when (((unsigned(ex_aluB_Q0(28 downto 0)) and CONSTANT_268435456_882) /= 0)) else
		resize(CONSTANT_29_999, 32) when (((unsigned(ex_aluB_Q0(29 downto 0)) and CONSTANT_536870912_878) /= 0)) else
		resize(CONSTANT_30_998, 32) when (((unsigned(ex_aluB_Q0(30 downto 0)) and CONSTANT_1073741824_874) /= 0)) else
		resize(CONSTANT_31_997, 32) when (((unsigned(ex_aluB_Q0) and CONSTANT_2147483648_870) /= 0)) else
		resize(CONSTANT_32_974, 32);
	-- codix_risc_ca.acdl:1977: lv_bb_3_ex_aluB_uint5=ex_aluB.read()&31
	lv_bb_3_ex_aluB_uint5_STATEMENT_AST_1204 <= (unsigned(ex_aluB_Q0(4 downto 0)) and CONSTANT_31_997);
	-- codix_risc_ca.acdl:2003: codasip_tmp_var_3=ex_alu_op.read()
	codasip_tmp_var_3_STATEMENT_AST_1215 <= unsigned(ex_alu_op_Q0);
	-- codix_risc_ca.acdl:1993: ex_alu_logic.write(((unsigned int  )((short  )( ...
	ex_alu_logic_STATEMENT_AST_1224 <= unsigned(resize(signed((unsigned(ex_aluB_Q0(15 downto 0)) and CONSTANT_65535_1232)), 32));
	-- codix_risc_ca.acdl:1991: ex_alu_logic.write(((unsigned int  )((char  )(e ...
	ex_alu_logic_STATEMENT_AST_1242 <= unsigned(resize(signed((unsigned(ex_aluB_Q0(7 downto 0)) and CONSTANT_255_1250)), 32));
	-- codix_risc_ca.acdl:1996: ex_alu_logic.write(((unsigned int  )(ex_aluB.re ...
	ex_alu_logic_STATEMENT_AST_1258 <= resize(shift_left(unsigned(resize(unsigned(ex_aluB_Q0), 48)), to_integer(CONSTANT_16_1012)), 32);
	-- codix_risc_ca.acdl:1982: ex_alu_logic.write(ex_aluA.read()&ex_aluB.read())
	ex_alu_logic_STATEMENT_AST_1273 <= (unsigned(ex_aluA_Q0) and unsigned(ex_aluB_Q0));
	-- codix_risc_ca.acdl:1984: ex_alu_logic.write(ex_aluA.read()|ex_aluB.read())
	ex_alu_logic_STATEMENT_AST_1287 <= (unsigned(ex_aluA_Q0) or unsigned(ex_aluB_Q0));
	-- codix_risc_ca.acdl:1986: ex_alu_logic.write(~(ex_aluA.read()|ex_aluB.rea ...
	ex_alu_logic_STATEMENT_AST_1301 <= not((unsigned(ex_aluA_Q0) or unsigned(ex_aluB_Q0)));
	-- codix_risc_ca.acdl:2002: ex_alu_logic.write(0)
	ex_alu_logic_STATEMENT_AST_1316 <= resize(CONSTANT_0_1028, 32);
	-- codix_risc_ca.acdl:1999: ex_alu_logic.write(int_enabled.read())
	ex_alu_logic_STATEMENT_AST_1364 <= tmp_conv_logic_to_unsigned_14573;
	-- codix_risc_ca.acdl:1988: ex_alu_logic.write(ex_aluA.read()^ex_aluB.read())
	ex_alu_logic_STATEMENT_AST_1376 <= (unsigned(ex_aluA_Q0) xor unsigned(ex_aluB_Q0));
	-- codix_risc_ca.acdl:2006: lv_bb_6_addA=ex_aluA.read()
	lv_bb_6_addA_STATEMENT_AST_1390 <= unsigned(resize(unsigned(ex_aluA_Q0), 33));
	-- codix_risc_ca.acdl:2016: codasip_tmp_var_2=((ex_alu_op.read()==6)||(ex_a ...
	codasip_tmp_var_2_STATEMENT_AST_1399 <= "1" when ((((unsigned(ex_alu_op_Q0) = CONSTANT_6_1022) or (unsigned(ex_alu_op_Q0) = CONSTANT_50_1407)) or (unsigned(ex_alu_op_Q0) = CONSTANT_51_1403))) else "0";
	-- codix_risc_ca.acdl:2014: lv_bb_5_addB=ex_aluB.read()
	lv_bb_5_addB_STATEMENT_AST_1418 <= unsigned(resize(unsigned(ex_aluB_Q0), 33));
	-- codix_risc_ca.acdl:2015: lv_bb_4_cy=0
	lv_bb_4_cy_STATEMENT_AST_1431 <= CONSTANT_0_1028;
	-- codix_risc_ca.acdl:2010: lv_bb_5_addB=~ex_aluB.read()
	lv_bb_5_addB_STATEMENT_AST_1444 <= resize(not(unsigned(resize(unsigned(ex_aluB_Q0), 33))), 33);
	-- codix_risc_ca.acdl:2011: lv_bb_4_cy=1
	lv_bb_4_cy_STATEMENT_AST_1455 <= CONSTANT_1_1027;
	-- codix_risc_ca.acdl:2019: ex_alu_add.write(((unsigned int  )(lv_bb_6_addA ...
	ex_alu_add_STATEMENT_AST_1465 <= resize((resize((resize(lv_bb_6_addA, 34) + resize(lv_bb_5_addB, 34)), 35) + resize(lv_bb_4_cy, 35)), 32);
	-- codix_risc_ca.acdl:2081: codasip_tmp_var_1=ex_alu_op.read()
	codasip_tmp_var_1_STATEMENT_AST_1479 <= unsigned(ex_alu_op_Q0);
	-- codix_risc_ca.acdl:2034: ex_alu_arith.write(0)
	ex_alu_arith_STATEMENT_AST_1488 <= resize(CONSTANT_0_1028, 32);
	-- codix_risc_ca.acdl:2053: ex_alu_arith.write(((unsigned int  )(ex_aluA.re ...
	ex_alu_arith_STATEMENT_AST_1740 <= shift_right(unsigned(ex_aluA_Q0), to_integer(lv_bb_3_ex_aluB_uint5));
	-- codix_risc_ca.acdl:2046: ex_alu_arith.write(ex_alu_add.read())
	ex_alu_arith_STATEMENT_AST_1755 <= unsigned(ex_alu_add_Q0);
	-- codix_risc_ca.acdl:2065: ex_alu_arith.write(((unsigned int  )(ex_aluA.re ...
	ex_alu_arith_STATEMENT_AST_1799 <= resize((unsigned(resize(unsigned(ex_aluA_Q0), 33)) + resize(CONSTANT_4_1024, 33)), 32);
	-- codix_risc_ca.acdl:2057: ex_alu_arith.write(lv_bb_2_ctlz_int)
	ex_alu_arith_STATEMENT_AST_1814 <= lv_bb_2_ctlz_int;
	-- codix_risc_ca.acdl:2059: ex_alu_arith.write(lv_bb_1_cttz_int)
	ex_alu_arith_STATEMENT_AST_1826 <= lv_bb_1_cttz_int;
	-- codix_risc_ca.acdl:2067: ex_alu_arith.write(ex_aluA.read())
	ex_alu_arith_STATEMENT_AST_1838 <= unsigned(ex_aluA_Q0);
	-- codix_risc_ca.acdl:2051: ex_alu_arith.write(((unsigned int  )(((int  )ex ...
	ex_alu_arith_STATEMENT_AST_1850 <= unsigned(shift_right(signed(ex_aluA_Q0), to_integer(lv_bb_3_ex_aluB_uint5)));
	-- codix_risc_ca.acdl:2049: ex_alu_arith.write(((unsigned int  )(ex_aluA.re ...
	ex_alu_arith_STATEMENT_AST_1866 <= shift_left(unsigned(ex_aluA_Q0), to_integer(lv_bb_3_ex_aluB_uint5));
	lv_bb_2_ctlz_int <= lv_bb_2_ctlz_int_STATEMENT_AST_866;
	lv_bb_1_cttz_int <= lv_bb_1_cttz_int_STATEMENT_AST_1035;
	lv_bb_3_ex_aluB_uint5 <= lv_bb_3_ex_aluB_uint5_STATEMENT_AST_1204;
	codasip_tmp_var_3 <= codasip_tmp_var_3_STATEMENT_AST_1215;
	with ex_alu_logic_D0_1236_select_14574 select
		ex_alu_logic_D0 <= 
			std_logic_vector(ex_alu_logic_STATEMENT_AST_1273) when "000000", 
			std_logic_vector(ex_alu_logic_STATEMENT_AST_1287) when "000001", 
			std_logic_vector(ex_alu_logic_STATEMENT_AST_1301) when "000010", 
			std_logic_vector(ex_alu_logic_STATEMENT_AST_1376) when "000011", 
			std_logic_vector(ex_alu_logic_STATEMENT_AST_1242) when "001101", 
			std_logic_vector(ex_alu_logic_STATEMENT_AST_1224) when "001110", 
			std_logic_vector(ex_alu_logic_STATEMENT_AST_1258) when "001111", 
			std_logic_vector(ex_alu_logic_STATEMENT_AST_1364) when "011110", 
			std_logic_vector(ex_alu_logic_STATEMENT_AST_1316) when others;
	lv_bb_6_addA <= lv_bb_6_addA_STATEMENT_AST_1390;
	codasip_tmp_var_2 <= codasip_tmp_var_2_STATEMENT_AST_1399;
	lv_bb_5_addB <= lv_bb_5_addB_STATEMENT_AST_1418 when (((ACT = CONSTANT_1_1027(0)) and not((codasip_tmp_var_2 /= 0)))) else 
		lv_bb_5_addB_STATEMENT_AST_1444 when (((ACT = CONSTANT_1_1027(0)) and (codasip_tmp_var_2 /= 0))) else
		CONSTANT_0_1424;
	lv_bb_4_cy <= lv_bb_4_cy_STATEMENT_AST_1431 when (((ACT = CONSTANT_1_1027(0)) and not((codasip_tmp_var_2 /= 0)))) else 
		lv_bb_4_cy_STATEMENT_AST_1455 when (((ACT = CONSTANT_1_1027(0)) and (codasip_tmp_var_2 /= 0))) else
		CONSTANT_0_1028;
	ex_alu_add_D0 <= std_logic_vector(ex_alu_add_STATEMENT_AST_1465);
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_1479;
	with ex_alu_arith_D0_1734_select_14575 select
		ex_alu_arith_D0 <= 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_1755) when "000101", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_1755) when "000110", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_1866) when "001000", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_1850) when "001001", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_1740) when "001010", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_1814) when "001011", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_1826) when "001100", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_1755) when "010100", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_1755) when "010101", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_1755) when "010110", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_1799) when "011000", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_1838) when "011001", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_1755) when "110000", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_1755) when "110001", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_1755) when "110010", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_1755) when "110011", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_1488) when others;

end architecture RTL;


