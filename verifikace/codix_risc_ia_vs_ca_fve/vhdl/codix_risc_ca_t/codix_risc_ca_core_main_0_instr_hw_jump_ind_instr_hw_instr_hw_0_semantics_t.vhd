--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of functional unit 'codix_risc_ca_core_main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_core_main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_t is
	port (
		ACT : in std_logic;
		codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0_Q0 : in std_logic_vector(8 downto 0);
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
end entity codix_risc_ca_core_main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_t;

architecture RTL of codix_risc_ca_core_main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics_t is
	-- signal (inner)
	signal rd_alu_op_STATEMENT_AST_2677 : unsigned(5 downto 0);
	-- signal (inner)
	signal rd_mem_rw_STATEMENT_AST_2697 : unsigned(3 downto 0);
	-- signal (inner)
	signal rd_dest_en_mux_STATEMENT_AST_2712 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_cond_STATEMENT_AST_2727 : unsigned(4 downto 0);
	-- signal (inner)
	signal rd_ie_flag_STATEMENT_AST_2742 : unsigned(1 downto 0);
	-- signal (inner)
	signal rd_amB_STATEMENT_AST_2762 : unsigned(2 downto 0);
	-- signal (inner)
	signal rd_amC_STATEMENT_AST_2777 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluA_mux_STATEMENT_AST_2792 : unsigned(0 downto 0);
	-- signal (inner)
	signal rd_aluB_mux_STATEMENT_AST_2807 : unsigned(2 downto 0);

		-- datapath signals and constants
	constant CONSTANT_0_2699: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_2722: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_2772: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_2707: unsigned(3 downto 0) := to_unsigned(0, 4);
	constant CONSTANT_0_2737: unsigned(4 downto 0) := to_unsigned(0, 5);
	constant CONSTANT_0_2692: unsigned(5 downto 0) := to_unsigned(0, 6);
	constant CONSTANT_1_2714: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_23_2683: unsigned(4 downto 0) := to_unsigned(23, 5);
	constant CONSTANT_24_2684: unsigned(4 downto 0) := to_unsigned(24, 5);
	constant CONSTANT_305_2746: unsigned(8 downto 0) := to_unsigned(305, 9);
	constant CONSTANT_306_2681: unsigned(8 downto 0) := to_unsigned(306, 9);

begin
	-- child instances inside 'main_0_instr_hw_jump_ind_instr_hw_instr_hw_0_semantics' functional unit:

		-- Datapath code
	-- codix_risc_ca.acdl:1065: rd_alu_op.write((codasip_instance_main_0_instr_ ...
	rd_alu_op_STATEMENT_AST_2677 <= 
		resize(CONSTANT_24_2684, 6) when ((unsigned(codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0_Q0) = CONSTANT_306_2681)) else
		resize(CONSTANT_23_2683, 6);
	-- codix_risc_ca.acdl:1066: rd_mem_rw.write(0)
	rd_mem_rw_STATEMENT_AST_2697 <= resize(CONSTANT_0_2699, 4);
	-- codix_risc_ca.acdl:1067: rd_dest_en_mux.write(1)
	rd_dest_en_mux_STATEMENT_AST_2712 <= resize(CONSTANT_1_2714, 2);
	-- codix_risc_ca.acdl:1068: rd_cond.write(0)
	rd_cond_STATEMENT_AST_2727 <= resize(CONSTANT_0_2699, 5);
	-- codix_risc_ca.acdl:1069: rd_ie_flag.write((codasip_instance_main_0_instr ...
	rd_ie_flag_STATEMENT_AST_2742 <= 
		resize(CONSTANT_1_2714, 2) when ((unsigned(codasip_instance_main_0_instr_hw_operation_opr_jump_reg_0_Q0) = CONSTANT_305_2746)) else
		resize(CONSTANT_0_2699, 2);
	-- codix_risc_ca.acdl:1072: rd_amB.write(0)
	rd_amB_STATEMENT_AST_2762 <= resize(CONSTANT_0_2699, 3);
	-- codix_risc_ca.acdl:1073: rd_amC.write(0)
	rd_amC_STATEMENT_AST_2777 <= CONSTANT_0_2699;
	-- codix_risc_ca.acdl:1075: rd_aluA_mux.write(1)
	rd_aluA_mux_STATEMENT_AST_2792 <= CONSTANT_1_2714;
	-- codix_risc_ca.acdl:1076: rd_aluB_mux.write(0)
	rd_aluB_mux_STATEMENT_AST_2807 <= resize(CONSTANT_0_2699, 3);
	rd_alu_op_WE0 <= CONSTANT_1_2714(0) when ((ACT = CONSTANT_1_2714(0))) else
		CONSTANT_0_2699(0);
	rd_alu_op_D0 <= std_logic_vector(rd_alu_op_STATEMENT_AST_2677) when ((ACT = CONSTANT_1_2714(0))) else
		std_logic_vector(CONSTANT_0_2692);
	rd_mem_rw_WE0 <= CONSTANT_1_2714(0) when ((ACT = CONSTANT_1_2714(0))) else
		CONSTANT_0_2699(0);
	rd_mem_rw_D0 <= std_logic_vector(rd_mem_rw_STATEMENT_AST_2697) when ((ACT = CONSTANT_1_2714(0))) else
		std_logic_vector(CONSTANT_0_2707);
	rd_dest_en_mux_WE0 <= CONSTANT_1_2714(0) when ((ACT = CONSTANT_1_2714(0))) else
		CONSTANT_0_2699(0);
	rd_dest_en_mux_D0 <= std_logic_vector(rd_dest_en_mux_STATEMENT_AST_2712) when ((ACT = CONSTANT_1_2714(0))) else
		std_logic_vector(CONSTANT_0_2722);
	rd_cond_WE0 <= CONSTANT_1_2714(0) when ((ACT = CONSTANT_1_2714(0))) else
		CONSTANT_0_2699(0);
	rd_cond_D0 <= std_logic_vector(rd_cond_STATEMENT_AST_2727) when ((ACT = CONSTANT_1_2714(0))) else
		std_logic_vector(CONSTANT_0_2737);
	rd_ie_flag_WE0 <= CONSTANT_1_2714(0) when ((ACT = CONSTANT_1_2714(0))) else
		CONSTANT_0_2699(0);
	rd_ie_flag_D0 <= std_logic_vector(rd_ie_flag_STATEMENT_AST_2742) when ((ACT = CONSTANT_1_2714(0))) else
		std_logic_vector(CONSTANT_0_2722);
	rd_amB_WE0 <= CONSTANT_1_2714(0) when ((ACT = CONSTANT_1_2714(0))) else
		CONSTANT_0_2699(0);
	rd_amB_D0 <= std_logic_vector(rd_amB_STATEMENT_AST_2762) when ((ACT = CONSTANT_1_2714(0))) else
		std_logic_vector(CONSTANT_0_2772);
	rd_amC_WE0 <= CONSTANT_1_2714(0) when ((ACT = CONSTANT_1_2714(0))) else
		CONSTANT_0_2699(0);
	rd_amC_D0 <= rd_amC_STATEMENT_AST_2777(0) when ((ACT = CONSTANT_1_2714(0))) else
		CONSTANT_0_2699(0);
	rd_aluA_mux_WE0 <= CONSTANT_1_2714(0) when ((ACT = CONSTANT_1_2714(0))) else
		CONSTANT_0_2699(0);
	rd_aluA_mux_D0 <= rd_aluA_mux_STATEMENT_AST_2792(0) when ((ACT = CONSTANT_1_2714(0))) else
		CONSTANT_0_2699(0);
	rd_aluB_mux_WE0 <= CONSTANT_1_2714(0) when ((ACT = CONSTANT_1_2714(0))) else
		CONSTANT_0_2699(0);
	rd_aluB_mux_D0 <= std_logic_vector(rd_aluB_mux_STATEMENT_AST_2807) when ((ACT = CONSTANT_1_2714(0))) else
		std_logic_vector(CONSTANT_0_2772);

end architecture RTL;


