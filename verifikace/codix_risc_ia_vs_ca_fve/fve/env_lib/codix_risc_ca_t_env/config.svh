/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Sat Jul 19 17:47:35 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codix_risc_ca_t_env_config'.
 */

// Default configuration for the environment.
class codix_risc_ca_t_env_config extends uvm_object;

	// registration of object tools
	`uvm_object_utils( codix_risc_ca_t_env_config )

	// whether the various components are used
	bit has_codix_risc_ca_core_regs_t_agent = 1;
	bit has_codix_risc_ca_core_main_instr_hw_instr_hw_t_agent = 1;
	bit has_codix_risc_ca_t_agent = 1;

	// configurations for these components
	codix_risc_ca_core_regs_t_agent_config m_codix_risc_ca_core_regs_t_agent_config_h;
	codix_risc_ca_core_main_instr_hw_instr_hw_t_agent_config m_codix_risc_ca_core_main_instr_hw_instr_hw_t_agent_config_h;
	codix_risc_ca_t_agent_config m_codix_risc_ca_t_agent_config_h;

	// Constructor - creates new instance of this class
	function new( string name = "m_codix_risc_ca_t_env_config_h" );
		super.new( name );
	endfunction: new

endclass: codix_risc_ca_t_env_config

