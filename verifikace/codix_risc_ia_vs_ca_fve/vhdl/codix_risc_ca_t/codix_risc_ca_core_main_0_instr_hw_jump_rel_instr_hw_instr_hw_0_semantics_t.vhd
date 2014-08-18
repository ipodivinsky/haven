--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_t is
	port (
		ACT : in std_logic;
		codasip_instance_main_0_instr_hw_cond_cond_cmp_0_Q0 : in std_logic_vector(3 downto 0);
		codasip_instance_main_0_instr_hw_srcB_op_imm1_0_Q0 : in std_logic;
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
end entity codix_risc_ca_core_main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_t;

architecture RTL of codix_risc_ca_core_main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics_t is
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_2822 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_2837 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_2852 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_2867 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_ie_flag_STATEMENT_AST_2884 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_amB_STATEMENT_AST_2899 : unsigned(2 downto 0);
	-- signal (inner)
	signal rd_amC_STATEMENT_AST_2917 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluA_mux_STATEMENT_AST_2932 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluB_mux_STATEMENT_AST_2947 : unsigned(2 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_2839: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_2862: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_2912: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_2847: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_0_2879: unsigned(4 downto 0) := to_unsigned(0, 5);
	constant CONSTANT_0_2832: unsigned(5 downto 0) := to_unsigned(0, 6);
	constant CONSTANT_1_2934: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_16_2871: unsigned(4 downto 0) := to_unsigned(16, 5);
	constant CONSTANT_2_2854: unsigned(1 downto 0) := to_unsigned(2, 2);
	constant CONSTANT_22_2824: unsigned(4 downto 0) := to_unsigned(22, 5);
	constant CONSTANT_4_2949: unsigned(2 downto 0) := to_unsigned(4, 3);
	constant CONSTANT_7_2904: unsigned(2 downto 0) := to_unsigned(7, 3);

begin
	-- child instances inside 'main_0_instr_hw_jump_rel_instr_hw_instr_hw_0_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:1091: rd_alu_op.write(22)
	rd_alu_op_STATEMENT_AST_2822 <= resize(CONSTANT_22_2824, 6);
	-- codix_risc_ca.acdl:1092: rd_mem_rw.write(0)
	rd_mem_rw_STATEMENT_AST_2837 <= resize(CONSTANT_0_2839, 4);
	-- codix_risc_ca.acdl:1093: rd_dest_en_mux.write(2)
	rd_dest_en_mux_STATEMENT_AST_2852 <= CONSTANT_2_2854;
	-- codix_risc_ca.acdl:1094: rd_cond.write(16|codasip_instance_main_0_instr_ ...
	rd_cond_STATEMENT_AST_2867 <= (CONSTANT_16_2871 or unsigned(resize(unsigned(codasip_instance_main_0_instr_hw_cond_cond_cmp_0_Q0), 5)));
	-- codix_risc_ca.acdl:1095: rd_ie_flag.write(0)
	rd_ie_flag_STATEMENT_AST_2884 <= resize(CONSTANT_0_2839, 2);
	-- codix_risc_ca.acdl:1098: rd_amB.write(codasip_instance_main_0_instr_hw_s ...
	rd_amB_STATEMENT_AST_2899 <= 
		CONSTANT_7_2904 when ((codasip_instance_main_0_instr_hw_srcB_op_imm1_0_Q0 /= '0')) else
		resize(CONSTANT_0_2839, 3);
	-- codix_risc_ca.acdl:1099: rd_amC.write(0)
	rd_amC_STATEMENT_AST_2917 <= CONSTANT_0_2839;
	-- codix_risc_ca.acdl:1101: rd_aluA_mux.write(1)
	rd_aluA_mux_STATEMENT_AST_2932 <= CONSTANT_1_2934;
	-- codix_risc_ca.acdl:1102: rd_aluB_mux.write(4)
	rd_aluB_mux_STATEMENT_AST_2947 <= CONSTANT_4_2949;
	rd_alu_op_WE0 <= CONSTANT_1_2934(0) when ((ACT = CONSTANT_1_2934(0))) else
		CONSTANT_0_2839(0);
	rd_alu_op_D0 <= std_logic_vector(rd_alu_op_STATEMENT_AST_2822) when ((ACT = CONSTANT_1_2934(0))) else
		std_logic_vector(CONSTANT_0_2832);
	rd_mem_rw_WE0 <= CONSTANT_1_2934(0) when ((ACT = CONSTANT_1_2934(0))) else
		CONSTANT_0_2839(0);
	rd_mem_rw_D0 <= std_logic_vector(rd_mem_rw_STATEMENT_AST_2837) when ((ACT = CONSTANT_1_2934(0))) else
		std_logic_vector(CONSTANT_0_2847);
	rd_dest_en_mux_WE0 <= CONSTANT_1_2934(0) when ((ACT = CONSTANT_1_2934(0))) else
		CONSTANT_0_2839(0);
	rd_dest_en_mux_D0 <= std_logic_vector(rd_dest_en_mux_STATEMENT_AST_2852) when ((ACT = CONSTANT_1_2934(0))) else
		std_logic_vector(CONSTANT_0_2862);
	rd_cond_WE0 <= CONSTANT_1_2934(0) when ((ACT = CONSTANT_1_2934(0))) else
		CONSTANT_0_2839(0);
	rd_cond_D0 <= std_logic_vector(rd_cond_STATEMENT_AST_2867) when ((ACT = CONSTANT_1_2934(0))) else
		std_logic_vector(CONSTANT_0_2879);
	rd_ie_flag_WE0 <= CONSTANT_1_2934(0) when ((ACT = CONSTANT_1_2934(0))) else
		CONSTANT_0_2839(0);
	rd_ie_flag_D0 <= std_logic_vector(rd_ie_flag_STATEMENT_AST_2884) when ((ACT = CONSTANT_1_2934(0))) else
		std_logic_vector(CONSTANT_0_2862);
	rd_amB_WE0 <= CONSTANT_1_2934(0) when ((ACT = CONSTANT_1_2934(0))) else
		CONSTANT_0_2839(0);
	rd_amB_D0 <= std_logic_vector(rd_amB_STATEMENT_AST_2899) when ((ACT = CONSTANT_1_2934(0))) else
		std_logic_vector(CONSTANT_0_2912);
	rd_amC_WE0 <= CONSTANT_1_2934(0) when ((ACT = CONSTANT_1_2934(0))) else
		CONSTANT_0_2839(0);
	rd_amC_D0 <= rd_amC_STATEMENT_AST_2917(0) when ((ACT = CONSTANT_1_2934(0))) else
		CONSTANT_0_2839(0);
	rd_aluA_mux_WE0 <= CONSTANT_1_2934(0) when ((ACT = CONSTANT_1_2934(0))) else
		CONSTANT_0_2839(0);
	rd_aluA_mux_D0 <= rd_aluA_mux_STATEMENT_AST_2932(0) when ((ACT = CONSTANT_1_2934(0))) else
		CONSTANT_0_2839(0);
	rd_aluB_mux_WE0 <= CONSTANT_1_2934(0) when ((ACT = CONSTANT_1_2934(0))) else
		CONSTANT_0_2839(0);
	rd_aluB_mux_D0 <= std_logic_vector(rd_aluB_mux_STATEMENT_AST_2947) when ((ACT = CONSTANT_1_2934(0))) else
		std_logic_vector(CONSTANT_0_2912);

end architecture RTL;


