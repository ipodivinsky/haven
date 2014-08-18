--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_t is
	port (
		ACT : in std_logic;
		codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_Q0 : in std_logic_vector(8 downto 0);
		codasip_instance_main_0_instr_hw_srcB_am_imm3_0_Q0 : in std_logic_vector(2 downto 0);
		rd_aluA_mux_D0 : out std_logic;
		rd_aluA_mux_WE0 : out std_logic;
		rd_aluB_mux_D0 : out std_logic_vector(2 downto 0);
		rd_aluB_mux_WE0 : out std_logic;
		rd_alu_op_D0 : out std_logic_vector(5 downto 0);
		rd_alu_op_WE0 : out std_logic;
		rd_amB_D0 : out std_logic_vector(2 downto 0);
		rd_amB_WE0 : out std_logic;
		rd_amC_D0 : out std_logic;
		rd_amC_WE0 : out std_logic;
		rd_cond_D0 : out std_logic_vector(4 downto 0);
		rd_cond_WE0 : out std_logic;
		rd_dest_en_mux_D0 : out std_logic_vector(1 downto 0);
		rd_dest_en_mux_WE0 : out std_logic;
		rd_ie_flag_D0 : out std_logic_vector(1 downto 0);
		rd_ie_flag_WE0 : out std_logic;
		rd_mem_rw_D0 : out std_logic_vector(3 downto 0);
		rd_mem_rw_WE0 : out std_logic
	);
end entity codix_risc_ca_core_main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_t;

architecture RTL of codix_risc_ca_core_main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics_t is
	-- signal (inner)
	signal codasip_tmp_var_1 : unsigned(8 downto 0);
	-- signal (inner)
	signal codasip_tmp_var_1_STATEMENT_AST_1836 : unsigned(8 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_1845 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_1967 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_1985 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_2003 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_2021 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_2039 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_2057 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_2075 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_2093 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_2111 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_2129 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_2147 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_2165 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_2183 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_2201 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_2219 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_2237 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_2255 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_2273 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_2291 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_2309 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_2324 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_2339 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_ie_flag_STATEMENT_AST_2354 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_amB_STATEMENT_AST_2369 : unsigned(2 downto 0);
	-- signal (inner)
	signal rd_amC_STATEMENT_AST_2384 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluA_mux_STATEMENT_AST_2399 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluB_mux_STATEMENT_AST_2414 : unsigned(2 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_1950: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_2334: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_2379: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_2319: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_0_2349: unsigned(4 downto 0) := to_unsigned(0, 5);
	constant CONSTANT_0_1960: unsigned(5 downto 0) := to_unsigned(0, 6);
	constant CONSTANT_1_1972: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_10_2116: unsigned(3 downto 0) := to_unsigned(10, 4);
	constant CONSTANT_11_2134: unsigned(3 downto 0) := to_unsigned(11, 4);
	constant CONSTANT_12_2152: unsigned(3 downto 0) := to_unsigned(12, 4);
	constant CONSTANT_13_2170: unsigned(3 downto 0) := to_unsigned(13, 4);
	constant CONSTANT_14_2188: unsigned(3 downto 0) := to_unsigned(14, 4);
	constant CONSTANT_2_1990: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_256_1948: unsigned(8 downto 0) := to_unsigned(256, 9);
	constant CONSTANT_257_1941: unsigned(8 downto 0) := to_unsigned(257, 9);
	constant CONSTANT_258_1936: unsigned(8 downto 0) := to_unsigned(258, 9);
	constant CONSTANT_259_1931: unsigned(8 downto 0) := to_unsigned(259, 9);
	constant CONSTANT_260_1926: unsigned(8 downto 0) := to_unsigned(260, 9);
	constant CONSTANT_261_1921: unsigned(8 downto 0) := to_unsigned(261, 9);
	constant CONSTANT_262_1916: unsigned(8 downto 0) := to_unsigned(262, 9);
	constant CONSTANT_264_1911: unsigned(8 downto 0) := to_unsigned(264, 9);
	constant CONSTANT_265_1906: unsigned(8 downto 0) := to_unsigned(265, 9);
	constant CONSTANT_266_1901: unsigned(8 downto 0) := to_unsigned(266, 9);
	constant CONSTANT_272_1896: unsigned(8 downto 0) := to_unsigned(272, 9);
	constant CONSTANT_274_1891: unsigned(8 downto 0) := to_unsigned(274, 9);
	constant CONSTANT_275_1886: unsigned(8 downto 0) := to_unsigned(275, 9);
	constant CONSTANT_276_1881: unsigned(8 downto 0) := to_unsigned(276, 9);
	constant CONSTANT_288_1876: unsigned(8 downto 0) := to_unsigned(288, 9);
	constant CONSTANT_289_1871: unsigned(8 downto 0) := to_unsigned(289, 9);
	constant CONSTANT_290_1866: unsigned(8 downto 0) := to_unsigned(290, 9);
	constant CONSTANT_291_1861: unsigned(8 downto 0) := to_unsigned(291, 9);
	constant CONSTANT_292_1856: unsigned(8 downto 0) := to_unsigned(292, 9);
	constant CONSTANT_293_1851: unsigned(8 downto 0) := to_unsigned(293, 9);
	constant CONSTANT_3_2008: unsigned(1 downto 0) := to_unsigned(3, 2);
	constant CONSTANT_48_2206: unsigned(5 downto 0) := to_unsigned(48, 6);
	constant CONSTANT_49_2224: unsigned(5 downto 0) := to_unsigned(49, 6);
	constant CONSTANT_5_2026: unsigned(2 downto 0) := to_unsigned(5, 3);
	constant CONSTANT_50_2242: unsigned(5 downto 0) := to_unsigned(50, 6);
	constant CONSTANT_51_2260: unsigned(5 downto 0) := to_unsigned(51, 6);
	constant CONSTANT_52_2278: unsigned(5 downto 0) := to_unsigned(52, 6);
	constant CONSTANT_53_2296: unsigned(5 downto 0) := to_unsigned(53, 6);
	constant CONSTANT_6_2044: unsigned(2 downto 0) := to_unsigned(6, 3);
	constant CONSTANT_7_2062: unsigned(2 downto 0) := to_unsigned(7, 3);
	constant CONSTANT_8_2080: unsigned(3 downto 0) := to_unsigned(8, 4);
	constant CONSTANT_9_2098: unsigned(3 downto 0) := to_unsigned(9, 4);

begin
	-- child instances inside 'main_0_instr_hw_alu_instr_hw_instr_hw_0_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:944: codasip_tmp_var_1=codasip_instance_main_0_instr_ ...
	codasip_tmp_var_1_STATEMENT_AST_1836 <= unsigned(codasip_instance_main_0_instr_hw_operation_opr_alu_reg_all_0_Q0);
	-- codix_risc_ca.acdl:892: rd_alu_op.write(0)
	rd_alu_op_STATEMENT_AST_1845 <= resize(CONSTANT_0_1950, 6);
	-- codix_risc_ca.acdl:894: rd_alu_op.write(1)
	rd_alu_op_STATEMENT_AST_1967 <= resize(CONSTANT_1_1972, 6);
	-- codix_risc_ca.acdl:896: rd_alu_op.write(2)
	rd_alu_op_STATEMENT_AST_1985 <= resize(CONSTANT_2_1990, 6);
	-- codix_risc_ca.acdl:898: rd_alu_op.write(3)
	rd_alu_op_STATEMENT_AST_2003 <= resize(CONSTANT_3_2008, 6);
	-- codix_risc_ca.acdl:901: rd_alu_op.write(5)
	rd_alu_op_STATEMENT_AST_2021 <= resize(CONSTANT_5_2026, 6);
	-- codix_risc_ca.acdl:903: rd_alu_op.write(6)
	rd_alu_op_STATEMENT_AST_2039 <= resize(CONSTANT_6_2044, 6);
	-- codix_risc_ca.acdl:905: rd_alu_op.write(7)
	rd_alu_op_STATEMENT_AST_2057 <= resize(CONSTANT_7_2062, 6);
	-- codix_risc_ca.acdl:908: rd_alu_op.write(8)
	rd_alu_op_STATEMENT_AST_2075 <= resize(CONSTANT_8_2080, 6);
	-- codix_risc_ca.acdl:910: rd_alu_op.write(9)
	rd_alu_op_STATEMENT_AST_2093 <= resize(CONSTANT_9_2098, 6);
	-- codix_risc_ca.acdl:912: rd_alu_op.write(10)
	rd_alu_op_STATEMENT_AST_2111 <= resize(CONSTANT_10_2116, 6);
	-- codix_risc_ca.acdl:916: rd_alu_op.write(11)
	rd_alu_op_STATEMENT_AST_2129 <= resize(CONSTANT_11_2134, 6);
	-- codix_risc_ca.acdl:918: rd_alu_op.write(12)
	rd_alu_op_STATEMENT_AST_2147 <= resize(CONSTANT_12_2152, 6);
	-- codix_risc_ca.acdl:922: rd_alu_op.write(13)
	rd_alu_op_STATEMENT_AST_2165 <= resize(CONSTANT_13_2170, 6);
	-- codix_risc_ca.acdl:924: rd_alu_op.write(14)
	rd_alu_op_STATEMENT_AST_2183 <= resize(CONSTANT_14_2188, 6);
	-- codix_risc_ca.acdl:927: rd_alu_op.write(48)
	rd_alu_op_STATEMENT_AST_2201 <= CONSTANT_48_2206;
	-- codix_risc_ca.acdl:929: rd_alu_op.write(49)
	rd_alu_op_STATEMENT_AST_2219 <= CONSTANT_49_2224;
	-- codix_risc_ca.acdl:932: rd_alu_op.write(50)
	rd_alu_op_STATEMENT_AST_2237 <= CONSTANT_50_2242;
	-- codix_risc_ca.acdl:934: rd_alu_op.write(51)
	rd_alu_op_STATEMENT_AST_2255 <= CONSTANT_51_2260;
	-- codix_risc_ca.acdl:937: rd_alu_op.write(52)
	rd_alu_op_STATEMENT_AST_2273 <= CONSTANT_52_2278;
	-- codix_risc_ca.acdl:939: rd_alu_op.write(53)
	rd_alu_op_STATEMENT_AST_2291 <= CONSTANT_53_2296;
	-- codix_risc_ca.acdl:946: rd_mem_rw.write(0)
	rd_mem_rw_STATEMENT_AST_2309 <= resize(CONSTANT_0_1950, 4);
	-- codix_risc_ca.acdl:947: rd_dest_en_mux.write(1)
	rd_dest_en_mux_STATEMENT_AST_2324 <= resize(CONSTANT_1_1972, 2);
	-- codix_risc_ca.acdl:948: rd_cond.write(0)
	rd_cond_STATEMENT_AST_2339 <= resize(CONSTANT_0_1950, 5);
	-- codix_risc_ca.acdl:949: rd_ie_flag.write(0)
	rd_ie_flag_STATEMENT_AST_2354 <= resize(CONSTANT_0_1950, 2);
	-- codix_risc_ca.acdl:952: rd_amB.write(codasip_instance_main_0_instr_hw_sr ...
	rd_amB_STATEMENT_AST_2369 <= unsigned(codasip_instance_main_0_instr_hw_srcB_am_imm3_0_Q0);
	-- codix_risc_ca.acdl:953: rd_amC.write(0)
	rd_amC_STATEMENT_AST_2384 <= CONSTANT_0_1950;
	-- codix_risc_ca.acdl:955: rd_aluA_mux.write(0)
	rd_aluA_mux_STATEMENT_AST_2399 <= CONSTANT_0_1950;
	-- codix_risc_ca.acdl:956: rd_aluB_mux.write(0)
	rd_aluB_mux_STATEMENT_AST_2414 <= resize(CONSTANT_0_1950, 3);
	codasip_tmp_var_1 <= codasip_tmp_var_1_STATEMENT_AST_1836;
	rd_alu_op_WE0 <= CONSTANT_1_1972(0) when (((ACT = CONSTANT_1_1972(0)) and ((CONSTANT_256_1948 = codasip_tmp_var_1) or (((((((((((((((((((not((CONSTANT_256_1948 = codasip_tmp_var_1)) and not((CONSTANT_257_1941 = codasip_tmp_var_1))) and not((CONSTANT_258_1936 = codasip_tmp_var_1))) and not((CONSTANT_259_1931 = codasip_tmp_var_1))) and not((CONSTANT_260_1926 = codasip_tmp_var_1))) and not((CONSTANT_261_1921 = codasip_tmp_var_1))) and not((CONSTANT_262_1916 = codasip_tmp_var_1))) and not((CONSTANT_264_1911 = codasip_tmp_var_1))) and not((CONSTANT_265_1906 = codasip_tmp_var_1))) and not((CONSTANT_266_1901 = codasip_tmp_var_1))) and not((CONSTANT_272_1896 = codasip_tmp_var_1))) and not((CONSTANT_274_1891 = codasip_tmp_var_1))) and not((CONSTANT_275_1886 = codasip_tmp_var_1))) and not((CONSTANT_276_1881 = codasip_tmp_var_1))) and not((CONSTANT_288_1876 = codasip_tmp_var_1))) and not((CONSTANT_289_1871 = codasip_tmp_var_1))) and not((CONSTANT_290_1866 = codasip_tmp_var_1))) and not((CONSTANT_291_1861 = codasip_tmp_var_1))) and not((CONSTANT_292_1856 = codasip_tmp_var_1))) and not((CONSTANT_293_1851 = codasip_tmp_var_1)))))) else 
		CONSTANT_1_1972(0) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_257_1941 = codasip_tmp_var_1))) else 
		CONSTANT_1_1972(0) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_258_1936 = codasip_tmp_var_1))) else 
		CONSTANT_1_1972(0) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_259_1931 = codasip_tmp_var_1))) else 
		CONSTANT_1_1972(0) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_260_1926 = codasip_tmp_var_1))) else 
		CONSTANT_1_1972(0) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_261_1921 = codasip_tmp_var_1))) else 
		CONSTANT_1_1972(0) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_262_1916 = codasip_tmp_var_1))) else 
		CONSTANT_1_1972(0) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_264_1911 = codasip_tmp_var_1))) else 
		CONSTANT_1_1972(0) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_265_1906 = codasip_tmp_var_1))) else 
		CONSTANT_1_1972(0) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_266_1901 = codasip_tmp_var_1))) else 
		CONSTANT_1_1972(0) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_272_1896 = codasip_tmp_var_1))) else 
		CONSTANT_1_1972(0) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_274_1891 = codasip_tmp_var_1))) else 
		CONSTANT_1_1972(0) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_275_1886 = codasip_tmp_var_1))) else 
		CONSTANT_1_1972(0) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_276_1881 = codasip_tmp_var_1))) else 
		CONSTANT_1_1972(0) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_288_1876 = codasip_tmp_var_1))) else 
		CONSTANT_1_1972(0) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_289_1871 = codasip_tmp_var_1))) else 
		CONSTANT_1_1972(0) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_290_1866 = codasip_tmp_var_1))) else 
		CONSTANT_1_1972(0) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_291_1861 = codasip_tmp_var_1))) else 
		CONSTANT_1_1972(0) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_292_1856 = codasip_tmp_var_1))) else 
		CONSTANT_1_1972(0) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_293_1851 = codasip_tmp_var_1))) else
		CONSTANT_0_1950(0);
	rd_alu_op_D0 <= std_logic_vector(rd_alu_op_STATEMENT_AST_1845) when (((ACT = CONSTANT_1_1972(0)) and ((CONSTANT_256_1948 = codasip_tmp_var_1) or (((((((((((((((((((not((CONSTANT_256_1948 = codasip_tmp_var_1)) and not((CONSTANT_257_1941 = codasip_tmp_var_1))) and not((CONSTANT_258_1936 = codasip_tmp_var_1))) and not((CONSTANT_259_1931 = codasip_tmp_var_1))) and not((CONSTANT_260_1926 = codasip_tmp_var_1))) and not((CONSTANT_261_1921 = codasip_tmp_var_1))) and not((CONSTANT_262_1916 = codasip_tmp_var_1))) and not((CONSTANT_264_1911 = codasip_tmp_var_1))) and not((CONSTANT_265_1906 = codasip_tmp_var_1))) and not((CONSTANT_266_1901 = codasip_tmp_var_1))) and not((CONSTANT_272_1896 = codasip_tmp_var_1))) and not((CONSTANT_274_1891 = codasip_tmp_var_1))) and not((CONSTANT_275_1886 = codasip_tmp_var_1))) and not((CONSTANT_276_1881 = codasip_tmp_var_1))) and not((CONSTANT_288_1876 = codasip_tmp_var_1))) and not((CONSTANT_289_1871 = codasip_tmp_var_1))) and not((CONSTANT_290_1866 = codasip_tmp_var_1))) and not((CONSTANT_291_1861 = codasip_tmp_var_1))) and not((CONSTANT_292_1856 = codasip_tmp_var_1))) and not((CONSTANT_293_1851 = codasip_tmp_var_1)))))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_1967) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_257_1941 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_1985) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_258_1936 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_2003) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_259_1931 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_2021) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_260_1926 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_2039) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_261_1921 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_2057) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_262_1916 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_2075) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_264_1911 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_2093) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_265_1906 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_2111) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_266_1901 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_2129) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_272_1896 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_2147) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_274_1891 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_2165) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_275_1886 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_2183) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_276_1881 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_2201) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_288_1876 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_2219) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_289_1871 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_2237) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_290_1866 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_2255) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_291_1861 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_2273) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_292_1856 = codasip_tmp_var_1))) else 
		std_logic_vector(rd_alu_op_STATEMENT_AST_2291) when (((ACT = CONSTANT_1_1972(0)) and (CONSTANT_293_1851 = codasip_tmp_var_1))) else
		std_logic_vector(CONSTANT_0_1960);
	rd_mem_rw_WE0 <= CONSTANT_1_1972(0) when ((ACT = CONSTANT_1_1972(0))) else
		CONSTANT_0_1950(0);
	rd_mem_rw_D0 <= std_logic_vector(rd_mem_rw_STATEMENT_AST_2309) when ((ACT = CONSTANT_1_1972(0))) else
		std_logic_vector(CONSTANT_0_2319);
	rd_dest_en_mux_WE0 <= CONSTANT_1_1972(0) when ((ACT = CONSTANT_1_1972(0))) else
		CONSTANT_0_1950(0);
	rd_dest_en_mux_D0 <= std_logic_vector(rd_dest_en_mux_STATEMENT_AST_2324) when ((ACT = CONSTANT_1_1972(0))) else
		std_logic_vector(CONSTANT_0_2334);
	rd_cond_WE0 <= CONSTANT_1_1972(0) when ((ACT = CONSTANT_1_1972(0))) else
		CONSTANT_0_1950(0);
	rd_cond_D0 <= std_logic_vector(rd_cond_STATEMENT_AST_2339) when ((ACT = CONSTANT_1_1972(0))) else
		std_logic_vector(CONSTANT_0_2349);
	rd_ie_flag_WE0 <= CONSTANT_1_1972(0) when ((ACT = CONSTANT_1_1972(0))) else
		CONSTANT_0_1950(0);
	rd_ie_flag_D0 <= std_logic_vector(rd_ie_flag_STATEMENT_AST_2354) when ((ACT = CONSTANT_1_1972(0))) else
		std_logic_vector(CONSTANT_0_2334);
	rd_amB_WE0 <= CONSTANT_1_1972(0) when ((ACT = CONSTANT_1_1972(0))) else
		CONSTANT_0_1950(0);
	rd_amB_D0 <= std_logic_vector(rd_amB_STATEMENT_AST_2369) when ((ACT = CONSTANT_1_1972(0))) else
		std_logic_vector(CONSTANT_0_2379);
	rd_amC_WE0 <= CONSTANT_1_1972(0) when ((ACT = CONSTANT_1_1972(0))) else
		CONSTANT_0_1950(0);
	rd_amC_D0 <= rd_amC_STATEMENT_AST_2384(0) when ((ACT = CONSTANT_1_1972(0))) else
		CONSTANT_0_1950(0);
	rd_aluA_mux_WE0 <= CONSTANT_1_1972(0) when ((ACT = CONSTANT_1_1972(0))) else
		CONSTANT_0_1950(0);
	rd_aluA_mux_D0 <= rd_aluA_mux_STATEMENT_AST_2399(0) when ((ACT = CONSTANT_1_1972(0))) else
		CONSTANT_0_1950(0);
	rd_aluB_mux_WE0 <= CONSTANT_1_1972(0) when ((ACT = CONSTANT_1_1972(0))) else
		CONSTANT_0_1950(0);
	rd_aluB_mux_D0 <= std_logic_vector(rd_aluB_mux_STATEMENT_AST_2414) when ((ACT = CONSTANT_1_1972(0))) else
		std_logic_vector(CONSTANT_0_2379);

end architecture RTL;


