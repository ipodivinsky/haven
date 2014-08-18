--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
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
		int_enabled_Q0 : in std_logic
	);
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
	signal lv_bb_2_ctlz_int_STATEMENT_AST_5402 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_1_cttz_int_STATEMENT_AST_5571 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_3_ex_aluB_uint5_STATEMENT_AST_5740 : unsigned(4 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_3_STATEMENT_AST_5751 : unsigned(5 downto 0);
	-- signal (inner)
	signal ex_alu_logic_STATEMENT_AST_5760 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_logic_STATEMENT_AST_5776 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_logic_STATEMENT_AST_5790 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_logic_STATEMENT_AST_5805 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_logic_STATEMENT_AST_5819 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_logic_STATEMENT_AST_5835 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_logic_STATEMENT_AST_5851 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_logic_STATEMENT_AST_5866 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_logic_STATEMENT_AST_5878 : unsigned(31 downto 0);
	-- signal (inner)
	signal lv_bb_6_addA_STATEMENT_AST_5926 : unsigned(32 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_2_STATEMENT_AST_5935 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_5_addB_STATEMENT_AST_5954 : unsigned(32 downto 0);
	-- signal (inner)
	signal lv_bb_4_cy_STATEMENT_AST_5967 : unsigned(0 downto 0);
	-- signal (inner)
	signal lv_bb_5_addB_STATEMENT_AST_5979 : unsigned(32 downto 0);
	-- signal (inner)
	signal lv_bb_4_cy_STATEMENT_AST_5990 : unsigned(0 downto 0);
	-- signal (inner)
	signal ex_alu_add_STATEMENT_AST_6001 : unsigned(31 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_6015 : unsigned(5 downto 0);
	-- signal (inner)
	signal ex_alu_arith_STATEMENT_AST_6024 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_arith_STATEMENT_AST_6276 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_arith_STATEMENT_AST_6320 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_arith_STATEMENT_AST_6335 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_arith_STATEMENT_AST_6351 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_arith_STATEMENT_AST_6366 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_arith_STATEMENT_AST_6378 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_arith_STATEMENT_AST_6390 : unsigned(31 downto 0);
	-- signal (inner)
	signal ex_alu_arith_STATEMENT_AST_6405 : unsigned(31 downto 0);

		-- datapath signals and constants
	signal tmp_conv_logic_to_unsigned_15141: unsigned(31 downto 0);
	signal ex_alu_logic_D0_5770_select_15142: std_logic_vector(5 downto 0);
	signal ex_alu_arith_D0_6270_select_15143: std_logic_vector(5 downto 0);
	constant CONSTANT_0_5564: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_5960: unsigned(32 downto 0) := "000000000000000000000000000000000";
	constant CONSTANT_1_5563: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_10_5554: unsigned(3 downto 0) := to_unsigned(10, 4);
	constant CONSTANT_1024_5490: unsigned(10 downto 0) := to_unsigned(1024, 11);
	constant CONSTANT_1048576_5450: unsigned(20 downto 0) := to_unsigned(1048576, 21);
	constant CONSTANT_1073741824_5410: unsigned(30 downto 0) := to_unsigned(1073741824, 31);
	constant CONSTANT_11_5553: unsigned(3 downto 0) := to_unsigned(11, 4);
	constant CONSTANT_12_5552: unsigned(3 downto 0) := to_unsigned(12, 4);
	constant CONSTANT_128_5502: unsigned(7 downto 0) := to_unsigned(128, 8);
	constant CONSTANT_13_5551: unsigned(3 downto 0) := to_unsigned(13, 4);
	constant CONSTANT_131072_5462: unsigned(17 downto 0) := to_unsigned(131072, 18);
	constant CONSTANT_134217728_5422: unsigned(27 downto 0) := to_unsigned(134217728, 28);
	constant CONSTANT_14_5550: unsigned(3 downto 0) := to_unsigned(14, 4);
	constant CONSTANT_15_5549: unsigned(3 downto 0) := to_unsigned(15, 4);
	constant CONSTANT_16_5548: unsigned(4 downto 0) := to_unsigned(16, 5);
	constant CONSTANT_16384_5474: unsigned(14 downto 0) := to_unsigned(16384, 15);
	constant CONSTANT_16777216_5434: unsigned(24 downto 0) := to_unsigned(16777216, 25);
	constant CONSTANT_17_5547: unsigned(4 downto 0) := to_unsigned(17, 5);
	constant CONSTANT_18_5546: unsigned(4 downto 0) := to_unsigned(18, 5);
	constant CONSTANT_19_5545: unsigned(4 downto 0) := to_unsigned(19, 5);
	constant CONSTANT_2_5562: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_20_5544: unsigned(4 downto 0) := to_unsigned(20, 5);
	constant CONSTANT_2048_5486: unsigned(11 downto 0) := to_unsigned(2048, 12);
	constant CONSTANT_2097152_5446: unsigned(21 downto 0) := to_unsigned(2097152, 22);
	constant CONSTANT_21_5543: unsigned(4 downto 0) := to_unsigned(21, 5);
	constant CONSTANT_2147483648_5406: unsigned(31 downto 0) := "10000000000000000000000000000000";
	constant CONSTANT_22_5542: unsigned(4 downto 0) := to_unsigned(22, 5);
	constant CONSTANT_23_5541: unsigned(4 downto 0) := to_unsigned(23, 5);
	constant CONSTANT_24_5540: unsigned(4 downto 0) := to_unsigned(24, 5);
	constant CONSTANT_25_5539: unsigned(4 downto 0) := to_unsigned(25, 5);
	constant CONSTANT_255_5827: unsigned(7 downto 0) := to_unsigned(255, 8);
	constant CONSTANT_256_5498: unsigned(8 downto 0) := to_unsigned(256, 9);
	constant CONSTANT_26_5538: unsigned(4 downto 0) := to_unsigned(26, 5);
	constant CONSTANT_262144_5458: unsigned(18 downto 0) := to_unsigned(262144, 19);
	constant CONSTANT_268435456_5418: unsigned(28 downto 0) := to_unsigned(268435456, 29);
	constant CONSTANT_27_5537: unsigned(4 downto 0) := to_unsigned(27, 5);
	constant CONSTANT_28_5536: unsigned(4 downto 0) := to_unsigned(28, 5);
	constant CONSTANT_29_5535: unsigned(4 downto 0) := to_unsigned(29, 5);
	constant CONSTANT_3_5561: unsigned(1 downto 0) := to_unsigned(3, 2);
	constant CONSTANT_30_5534: unsigned(4 downto 0) := to_unsigned(30, 5);
	constant CONSTANT_31_5533: unsigned(4 downto 0) := to_unsigned(31, 5);
	constant CONSTANT_32_5510: unsigned(5 downto 0) := to_unsigned(32, 6);
	constant CONSTANT_32768_5470: unsigned(15 downto 0) := to_unsigned(32768, 16);
	constant CONSTANT_33554432_5430: unsigned(25 downto 0) := to_unsigned(33554432, 26);
	constant CONSTANT_4_5560: unsigned(2 downto 0) := to_unsigned(4, 3);
	constant CONSTANT_4096_5482: unsigned(12 downto 0) := to_unsigned(4096, 13);
	constant CONSTANT_4194304_5442: unsigned(22 downto 0) := to_unsigned(4194304, 23);
	constant CONSTANT_5_5559: unsigned(2 downto 0) := to_unsigned(5, 3);
	constant CONSTANT_50_5943: unsigned(5 downto 0) := to_unsigned(50, 6);
	constant CONSTANT_51_5939: unsigned(5 downto 0) := to_unsigned(51, 6);
	constant CONSTANT_512_5494: unsigned(9 downto 0) := to_unsigned(512, 10);
	constant CONSTANT_524288_5454: unsigned(19 downto 0) := to_unsigned(524288, 20);
	constant CONSTANT_536870912_5414: unsigned(29 downto 0) := to_unsigned(536870912, 30);
	constant CONSTANT_6_5558: unsigned(2 downto 0) := to_unsigned(6, 3);
	constant CONSTANT_64_5506: unsigned(6 downto 0) := to_unsigned(64, 7);
	constant CONSTANT_65535_5843: unsigned(15 downto 0) := to_unsigned(65535, 16);
	constant CONSTANT_65536_5466: unsigned(16 downto 0) := to_unsigned(65536, 17);
	constant CONSTANT_67108864_5426: unsigned(26 downto 0) := to_unsigned(67108864, 27);
	constant CONSTANT_7_5557: unsigned(2 downto 0) := to_unsigned(7, 3);
	constant CONSTANT_8_5556: unsigned(3 downto 0) := to_unsigned(8, 4);
	constant CONSTANT_8192_5478: unsigned(13 downto 0) := to_unsigned(8192, 14);
	constant CONSTANT_8388608_5438: unsigned(23 downto 0) := to_unsigned(8388608, 24);
	constant CONSTANT_9_5555: unsigned(3 downto 0) := to_unsigned(9, 4);

begin
	-- child instances inside 'main_alu_alu_fu_semantics' functional unit:

		-- conversions for datapath
	tmp_conv_logic_to_unsigned_15141 <= "0000000000000000000000000000000" & int_enabled_Q0;
	ex_alu_logic_D0_5770_select_15142 <= std_logic_vector(codasip_tmp_var_3);
	ex_alu_arith_D0_6270_select_15143 <= std_logic_vector(codasip_tmp_var_1);

		-- Datapath code
	-- codix_risc_ca.acdl:1940: lv_bb_2_ctlz_int=(ex_aluB.read()&2147483648) ?  ...
	lv_bb_2_ctlz_int_STATEMENT_AST_5402 <= 
		resize(CONSTANT_0_5564, 32) when (((unsigned(ex_aluB_Q0) and CONSTANT_2147483648_5406) /= 0)) else
		resize(CONSTANT_1_5563, 32) when (((unsigned(ex_aluB_Q0(30 downto 0)) and CONSTANT_1073741824_5410) /= 0)) else
		resize(CONSTANT_2_5562, 32) when (((unsigned(ex_aluB_Q0(29 downto 0)) and CONSTANT_536870912_5414) /= 0)) else
		resize(CONSTANT_3_5561, 32) when (((unsigned(ex_aluB_Q0(28 downto 0)) and CONSTANT_268435456_5418) /= 0)) else
		resize(CONSTANT_4_5560, 32) when (((unsigned(ex_aluB_Q0(27 downto 0)) and CONSTANT_134217728_5422) /= 0)) else
		resize(CONSTANT_5_5559, 32) when (((unsigned(ex_aluB_Q0(26 downto 0)) and CONSTANT_67108864_5426) /= 0)) else
		resize(CONSTANT_6_5558, 32) when (((unsigned(ex_aluB_Q0(25 downto 0)) and CONSTANT_33554432_5430) /= 0)) else
		resize(CONSTANT_7_5557, 32) when (((unsigned(ex_aluB_Q0(24 downto 0)) and CONSTANT_16777216_5434) /= 0)) else
		resize(CONSTANT_8_5556, 32) when (((unsigned(ex_aluB_Q0(23 downto 0)) and CONSTANT_8388608_5438) /= 0)) else
		resize(CONSTANT_9_5555, 32) when (((unsigned(ex_aluB_Q0(22 downto 0)) and CONSTANT_4194304_5442) /= 0)) else
		resize(CONSTANT_10_5554, 32) when (((unsigned(ex_aluB_Q0(21 downto 0)) and CONSTANT_2097152_5446) /= 0)) else
		resize(CONSTANT_11_5553, 32) when (((unsigned(ex_aluB_Q0(20 downto 0)) and CONSTANT_1048576_5450) /= 0)) else
		resize(CONSTANT_12_5552, 32) when (((unsigned(ex_aluB_Q0(19 downto 0)) and CONSTANT_524288_5454) /= 0)) else
		resize(CONSTANT_13_5551, 32) when (((unsigned(ex_aluB_Q0(18 downto 0)) and CONSTANT_262144_5458) /= 0)) else
		resize(CONSTANT_14_5550, 32) when (((unsigned(ex_aluB_Q0(17 downto 0)) and CONSTANT_131072_5462) /= 0)) else
		resize(CONSTANT_15_5549, 32) when (((unsigned(ex_aluB_Q0(16 downto 0)) and CONSTANT_65536_5466) /= 0)) else
		resize(CONSTANT_16_5548, 32) when (((unsigned(ex_aluB_Q0(15 downto 0)) and CONSTANT_32768_5470) /= 0)) else
		resize(CONSTANT_17_5547, 32) when (((unsigned(ex_aluB_Q0(14 downto 0)) and CONSTANT_16384_5474) /= 0)) else
		resize(CONSTANT_18_5546, 32) when (((unsigned(ex_aluB_Q0(13 downto 0)) and CONSTANT_8192_5478) /= 0)) else
		resize(CONSTANT_19_5545, 32) when (((unsigned(ex_aluB_Q0(12 downto 0)) and CONSTANT_4096_5482) /= 0)) else
		resize(CONSTANT_20_5544, 32) when (((unsigned(ex_aluB_Q0(11 downto 0)) and CONSTANT_2048_5486) /= 0)) else
		resize(CONSTANT_21_5543, 32) when (((unsigned(ex_aluB_Q0(10 downto 0)) and CONSTANT_1024_5490) /= 0)) else
		resize(CONSTANT_22_5542, 32) when (((unsigned(ex_aluB_Q0(9 downto 0)) and CONSTANT_512_5494) /= 0)) else
		resize(CONSTANT_23_5541, 32) when (((unsigned(ex_aluB_Q0(8 downto 0)) and CONSTANT_256_5498) /= 0)) else
		resize(CONSTANT_24_5540, 32) when (((unsigned(ex_aluB_Q0(7 downto 0)) and CONSTANT_128_5502) /= 0)) else
		resize(CONSTANT_25_5539, 32) when (((unsigned(ex_aluB_Q0(6 downto 0)) and CONSTANT_64_5506) /= 0)) else
		resize(CONSTANT_26_5538, 32) when (((unsigned(ex_aluB_Q0(5 downto 0)) and CONSTANT_32_5510) /= 0)) else
		resize(CONSTANT_27_5537, 32) when (((unsigned(ex_aluB_Q0(4 downto 0)) and CONSTANT_16_5548) /= 0)) else
		resize(CONSTANT_28_5536, 32) when (((unsigned(ex_aluB_Q0(3 downto 0)) and CONSTANT_8_5556) /= 0)) else
		resize(CONSTANT_29_5535, 32) when (((unsigned(ex_aluB_Q0(2 downto 0)) and CONSTANT_4_5560) /= 0)) else
		resize(CONSTANT_30_5534, 32) when (((unsigned(ex_aluB_Q0(1 downto 0)) and CONSTANT_2_5562) /= 0)) else
		resize(CONSTANT_31_5533, 32) when (((unsigned(ex_aluB_Q0(0 downto 0)) and CONSTANT_1_5563) /= 0)) else
		resize(CONSTANT_32_5510, 32);
	-- codix_risc_ca.acdl:1973: lv_bb_1_cttz_int=(ex_aluB.read()&1) ? (codasip: ...
	lv_bb_1_cttz_int_STATEMENT_AST_5571 <= 
		resize(CONSTANT_0_5564, 32) when (((unsigned(ex_aluB_Q0(0 downto 0)) and CONSTANT_1_5563) /= 0)) else
		resize(CONSTANT_1_5563, 32) when (((unsigned(ex_aluB_Q0(1 downto 0)) and CONSTANT_2_5562) /= 0)) else
		resize(CONSTANT_2_5562, 32) when (((unsigned(ex_aluB_Q0(2 downto 0)) and CONSTANT_4_5560) /= 0)) else
		resize(CONSTANT_3_5561, 32) when (((unsigned(ex_aluB_Q0(3 downto 0)) and CONSTANT_8_5556) /= 0)) else
		resize(CONSTANT_4_5560, 32) when (((unsigned(ex_aluB_Q0(4 downto 0)) and CONSTANT_16_5548) /= 0)) else
		resize(CONSTANT_5_5559, 32) when (((unsigned(ex_aluB_Q0(5 downto 0)) and CONSTANT_32_5510) /= 0)) else
		resize(CONSTANT_6_5558, 32) when (((unsigned(ex_aluB_Q0(6 downto 0)) and CONSTANT_64_5506) /= 0)) else
		resize(CONSTANT_7_5557, 32) when (((unsigned(ex_aluB_Q0(7 downto 0)) and CONSTANT_128_5502) /= 0)) else
		resize(CONSTANT_8_5556, 32) when (((unsigned(ex_aluB_Q0(8 downto 0)) and CONSTANT_256_5498) /= 0)) else
		resize(CONSTANT_9_5555, 32) when (((unsigned(ex_aluB_Q0(9 downto 0)) and CONSTANT_512_5494) /= 0)) else
		resize(CONSTANT_10_5554, 32) when (((unsigned(ex_aluB_Q0(10 downto 0)) and CONSTANT_1024_5490) /= 0)) else
		resize(CONSTANT_11_5553, 32) when (((unsigned(ex_aluB_Q0(11 downto 0)) and CONSTANT_2048_5486) /= 0)) else
		resize(CONSTANT_12_5552, 32) when (((unsigned(ex_aluB_Q0(12 downto 0)) and CONSTANT_4096_5482) /= 0)) else
		resize(CONSTANT_13_5551, 32) when (((unsigned(ex_aluB_Q0(13 downto 0)) and CONSTANT_8192_5478) /= 0)) else
		resize(CONSTANT_14_5550, 32) when (((unsigned(ex_aluB_Q0(14 downto 0)) and CONSTANT_16384_5474) /= 0)) else
		resize(CONSTANT_15_5549, 32) when (((unsigned(ex_aluB_Q0(15 downto 0)) and CONSTANT_32768_5470) /= 0)) else
		resize(CONSTANT_16_5548, 32) when (((unsigned(ex_aluB_Q0(16 downto 0)) and CONSTANT_65536_5466) /= 0)) else
		resize(CONSTANT_17_5547, 32) when (((unsigned(ex_aluB_Q0(17 downto 0)) and CONSTANT_131072_5462) /= 0)) else
		resize(CONSTANT_18_5546, 32) when (((unsigned(ex_aluB_Q0(18 downto 0)) and CONSTANT_262144_5458) /= 0)) else
		resize(CONSTANT_19_5545, 32) when (((unsigned(ex_aluB_Q0(19 downto 0)) and CONSTANT_524288_5454) /= 0)) else
		resize(CONSTANT_20_5544, 32) when (((unsigned(ex_aluB_Q0(20 downto 0)) and CONSTANT_1048576_5450) /= 0)) else
		resize(CONSTANT_21_5543, 32) when (((unsigned(ex_aluB_Q0(21 downto 0)) and CONSTANT_2097152_5446) /= 0)) else
		resize(CONSTANT_22_5542, 32) when (((unsigned(ex_aluB_Q0(22 downto 0)) and CONSTANT_4194304_5442) /= 0)) else
		resize(CONSTANT_23_5541, 32) when (((unsigned(ex_aluB_Q0(23 downto 0)) and CONSTANT_8388608_5438) /= 0)) else
		resize(CONSTANT_24_5540, 32) when (((unsigned(ex_aluB_Q0(24 downto 0)) and CONSTANT_16777216_5434) /= 0)) else
		resize(CONSTANT_25_5539, 32) when (((unsigned(ex_aluB_Q0(25 downto 0)) and CONSTANT_33554432_5430) /= 0)) else
		resize(CONSTANT_26_5538, 32) when (((unsigned(ex_aluB_Q0(26 downto 0)) and CONSTANT_67108864_5426) /= 0)) else
		resize(CONSTANT_27_5537, 32) when (((unsigned(ex_aluB_Q0(27 downto 0)) and CONSTANT_134217728_5422) /= 0)) else
		resize(CONSTANT_28_5536, 32) when (((unsigned(ex_aluB_Q0(28 downto 0)) and CONSTANT_268435456_5418) /= 0)) else
		resize(CONSTANT_29_5535, 32) when (((unsigned(ex_aluB_Q0(29 downto 0)) and CONSTANT_536870912_5414) /= 0)) else
		resize(CONSTANT_30_5534, 32) when (((unsigned(ex_aluB_Q0(30 downto 0)) and CONSTANT_1073741824_5410) /= 0)) else
		resize(CONSTANT_31_5533, 32) when (((unsigned(ex_aluB_Q0) and CONSTANT_2147483648_5406) /= 0)) else
		resize(CONSTANT_32_5510, 32);
	-- codix_risc_ca.acdl:1977: lv_bb_3_ex_aluB_uint5=ex_aluB.read()&31
	lv_bb_3_ex_aluB_uint5_STATEMENT_AST_5740 <= (unsigned(ex_aluB_Q0(4 downto 0)) and CONSTANT_31_5533);
	-- codix_risc_ca.acdl:2003: codasip_tmp_var_3=ex_alu_op.read()
	codasip_tmp_var_3_STATEMENT_AST_5751 <= unsigned(ex_alu_op_Q0);
	-- codix_risc_ca.acdl:1982: ex_alu_logic.write(ex_aluA.read()&ex_aluB.read())
	ex_alu_logic_STATEMENT_AST_5760 <= (unsigned(ex_aluA_Q0) and unsigned(ex_aluB_Q0));
	-- codix_risc_ca.acdl:1984: ex_alu_logic.write(ex_aluA.read()|ex_aluB.read())
	ex_alu_logic_STATEMENT_AST_5776 <= (unsigned(ex_aluA_Q0) or unsigned(ex_aluB_Q0));
	-- codix_risc_ca.acdl:1986: ex_alu_logic.write(~(ex_aluA.read()|ex_aluB.rea ...
	ex_alu_logic_STATEMENT_AST_5790 <= not((unsigned(ex_aluA_Q0) or unsigned(ex_aluB_Q0)));
	-- codix_risc_ca.acdl:1988: ex_alu_logic.write(ex_aluA.read()^ex_aluB.read())
	ex_alu_logic_STATEMENT_AST_5805 <= (unsigned(ex_aluA_Q0) xor unsigned(ex_aluB_Q0));
	-- codix_risc_ca.acdl:1991: ex_alu_logic.write(((unsigned int  )((char  )(e ...
	ex_alu_logic_STATEMENT_AST_5819 <= unsigned(resize(signed((unsigned(ex_aluB_Q0(7 downto 0)) and CONSTANT_255_5827)), 32));
	-- codix_risc_ca.acdl:1993: ex_alu_logic.write(((unsigned int  )((short  )( ...
	ex_alu_logic_STATEMENT_AST_5835 <= unsigned(resize(signed((unsigned(ex_aluB_Q0(15 downto 0)) and CONSTANT_65535_5843)), 32));
	-- codix_risc_ca.acdl:1996: ex_alu_logic.write(((unsigned int  )(ex_aluB.re ...
	ex_alu_logic_STATEMENT_AST_5851 <= resize(shift_left(unsigned(resize(unsigned(ex_aluB_Q0), 48)), to_integer(CONSTANT_16_5548)), 32);
	-- codix_risc_ca.acdl:1999: ex_alu_logic.write(int_enabled.read())
	ex_alu_logic_STATEMENT_AST_5866 <= tmp_conv_logic_to_unsigned_15141;
	-- codix_risc_ca.acdl:2002: ex_alu_logic.write(0)
	ex_alu_logic_STATEMENT_AST_5878 <= resize(CONSTANT_0_5564, 32);
	-- codix_risc_ca.acdl:2006: lv_bb_6_addA=ex_aluA.read()
	lv_bb_6_addA_STATEMENT_AST_5926 <= unsigned(resize(unsigned(ex_aluA_Q0), 33));
	-- codix_risc_ca.acdl:2016: codasip_tmp_var_2=((ex_alu_op.read()==6)||(ex_a ...
	codasip_tmp_var_2_STATEMENT_AST_5935 <= "1" when ((((unsigned(ex_alu_op_Q0) = CONSTANT_6_5558) or (unsigned(ex_alu_op_Q0) = CONSTANT_50_5943)) or (unsigned(ex_alu_op_Q0) = CONSTANT_51_5939))) else "0";
	-- codix_risc_ca.acdl:2010: lv_bb_5_addB=~ex_aluB.read()
	lv_bb_5_addB_STATEMENT_AST_5954 <= resize(not(unsigned(resize(unsigned(ex_aluB_Q0), 33))), 33);
	-- codix_risc_ca.acdl:2011: lv_bb_4_cy=1
	lv_bb_4_cy_STATEMENT_AST_5967 <= CONSTANT_1_5563;
	-- codix_risc_ca.acdl:2014: lv_bb_5_addB=ex_aluB.read()
	lv_bb_5_addB_STATEMENT_AST_5979 <= unsigned(resize(unsigned(ex_aluB_Q0), 33));
	-- codix_risc_ca.acdl:2015: lv_bb_4_cy=0
	lv_bb_4_cy_STATEMENT_AST_5990 <= CONSTANT_0_5564;
	-- codix_risc_ca.acdl:2019: ex_alu_add.write(((unsigned int  )(lv_bb_6_addA ...
	ex_alu_add_STATEMENT_AST_6001 <= resize((resize((resize(lv_bb_6_addA, 34) + resize(lv_bb_5_addB, 34)), 35) + resize(lv_bb_4_cy, 35)), 32);
	-- codix_risc_ca.acdl:2081: codasip_tmp_var_1=ex_alu_op.read()
	codasip_tmp_var_1_STATEMENT_AST_6015 <= unsigned(ex_alu_op_Q0);
	-- codix_risc_ca.acdl:2034: ex_alu_arith.write(0)
	ex_alu_arith_STATEMENT_AST_6024 <= resize(CONSTANT_0_5564, 32);
	-- codix_risc_ca.acdl:2046: ex_alu_arith.write(ex_alu_add.read())
	ex_alu_arith_STATEMENT_AST_6276 <= unsigned(ex_alu_add_Q0);
	-- codix_risc_ca.acdl:2049: ex_alu_arith.write(((unsigned int  )(ex_aluA.re ...
	ex_alu_arith_STATEMENT_AST_6320 <= shift_left(unsigned(ex_aluA_Q0), to_integer(lv_bb_3_ex_aluB_uint5));
	-- codix_risc_ca.acdl:2051: ex_alu_arith.write(((unsigned int  )(((int  )ex ...
	ex_alu_arith_STATEMENT_AST_6335 <= unsigned(shift_right(signed(ex_aluA_Q0), to_integer(lv_bb_3_ex_aluB_uint5)));
	-- codix_risc_ca.acdl:2053: ex_alu_arith.write(((unsigned int  )(ex_aluA.re ...
	ex_alu_arith_STATEMENT_AST_6351 <= shift_right(unsigned(ex_aluA_Q0), to_integer(lv_bb_3_ex_aluB_uint5));
	-- codix_risc_ca.acdl:2057: ex_alu_arith.write(lv_bb_2_ctlz_int)
	ex_alu_arith_STATEMENT_AST_6366 <= lv_bb_2_ctlz_int;
	-- codix_risc_ca.acdl:2059: ex_alu_arith.write(lv_bb_1_cttz_int)
	ex_alu_arith_STATEMENT_AST_6378 <= lv_bb_1_cttz_int;
	-- codix_risc_ca.acdl:2065: ex_alu_arith.write(((unsigned int  )(ex_aluA.re ...
	ex_alu_arith_STATEMENT_AST_6390 <= resize((unsigned(resize(unsigned(ex_aluA_Q0), 33)) + resize(CONSTANT_4_5560, 33)), 32);
	-- codix_risc_ca.acdl:2067: ex_alu_arith.write(ex_aluA.read())
	ex_alu_arith_STATEMENT_AST_6405 <= unsigned(ex_aluA_Q0);
	lv_bb_2_ctlz_int <= lv_bb_2_ctlz_int_STATEMENT_AST_5402;
	lv_bb_1_cttz_int <= lv_bb_1_cttz_int_STATEMENT_AST_5571;
	lv_bb_3_ex_aluB_uint5 <= lv_bb_3_ex_aluB_uint5_STATEMENT_AST_5740;
	codasip_tmp_var_3 <= codasip_tmp_var_3_STATEMENT_AST_5751;
	with ex_alu_logic_D0_5770_select_15142 select
		ex_alu_logic_D0 <= 
			std_logic_vector(ex_alu_logic_STATEMENT_AST_5760) when "000000", 
			std_logic_vector(ex_alu_logic_STATEMENT_AST_5776) when "000001", 
			std_logic_vector(ex_alu_logic_STATEMENT_AST_5790) when "000010", 
			std_logic_vector(ex_alu_logic_STATEMENT_AST_5805) when "000011", 
			std_logic_vector(ex_alu_logic_STATEMENT_AST_5819) when "001101", 
			std_logic_vector(ex_alu_logic_STATEMENT_AST_5835) when "001110", 
			std_logic_vector(ex_alu_logic_STATEMENT_AST_5851) when "001111", 
			std_logic_vector(ex_alu_logic_STATEMENT_AST_5866) when "011110", 
			std_logic_vector(ex_alu_logic_STATEMENT_AST_5878) when others;
	lv_bb_6_addA <= lv_bb_6_addA_STATEMENT_AST_5926;
	codasip_tmp_var_2 <= codasip_tmp_var_2_STATEMENT_AST_5935;
	lv_bb_5_addB <= lv_bb_5_addB_STATEMENT_AST_5954 when (((ACT = CONSTANT_1_5563(0)) and (codasip_tmp_var_2 /= 0))) else 
		lv_bb_5_addB_STATEMENT_AST_5979 when (((ACT = CONSTANT_1_5563(0)) and not((codasip_tmp_var_2 /= 0)))) else
		CONSTANT_0_5960;
	lv_bb_4_cy <= lv_bb_4_cy_STATEMENT_AST_5967 when (((ACT = CONSTANT_1_5563(0)) and (codasip_tmp_var_2 /= 0))) else 
		lv_bb_4_cy_STATEMENT_AST_5990 when (((ACT = CONSTANT_1_5563(0)) and not((codasip_tmp_var_2 /= 0)))) else
		CONSTANT_0_5564;
	ex_alu_add_D0 <= std_logic_vector(ex_alu_add_STATEMENT_AST_6001);
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_6015;
	with ex_alu_arith_D0_6270_select_15143 select
		ex_alu_arith_D0 <= 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_6276) when "000101", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_6276) when "000110", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_6320) when "001000", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_6335) when "001001", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_6351) when "001010", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_6366) when "001011", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_6378) when "001100", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_6276) when "010100", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_6276) when "010101", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_6276) when "010110", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_6390) when "011000", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_6405) when "011001", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_6276) when "110000", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_6276) when "110001", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_6276) when "110010", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_6276) when "110011", 
			std_logic_vector(ex_alu_arith_STATEMENT_AST_6024) when others;

end architecture RTL;


