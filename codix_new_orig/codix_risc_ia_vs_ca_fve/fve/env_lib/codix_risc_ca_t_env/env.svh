/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Wed Jun 18 14:16:23 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codix_risc_ca_t_env'.
 */

// This class represents the main parts of the verification environment.
class codix_risc_ca_t_env extends uvm_env;

	// registration of component tools
	`uvm_component_utils( codix_risc_ca_t_env )

	// environment configuration
	codix_risc_ca_t_env_config m_cfg_h;
	// main sub-components
	// used to collect register file coverage (how extensive was the RF used).
	codix_risc_ca_core_regs_t_agent m_codix_risc_ca_core_regs_t_agent_h;
	// used to collect instruction coverage
	codix_risc_ca_core_main_instr_hw_instr_hw_t_agent m_codix_risc_ca_core_main_instr_hw_instr_hw_t_agent_h;
	codix_risc_ca_t_agent m_codix_risc_ca_t_agent_h;
	codix_risc_ca_t_scoreboard m_scoreboard_h;
	codix_risc_platform_ca_t_gm m_gold_h;

	// Constructor - creates new instance of this class
	function new( string name = "m_env_h", uvm_component parent = null );
		super.new( name, parent );
	endfunction: new

	// Build - instantiates child components
	function void build_phase( uvm_phase phase );
		super.build_phase( phase );
		// environment configuration first
		if ( !uvm_config_db #(codix_risc_ca_t_env_config)::get(this,
			"",
			"codix_risc_ca_t_env_config",
			m_cfg_h) ) begin
			`uvm_fatal( "configuration:", "Cannot find 'codix_risc_ca_t_env_config' inside uvm_config_db, probably not set!" )
		end
		// 'codix_risc_ca_core_regs_t_agent' agent configuration visible to the agent only
		if ( m_cfg_h.has_codix_risc_ca_core_regs_t_agent ) begin
			uvm_config_db #( codix_risc_ca_core_regs_t_agent_config )::set( this,
				"m_codix_risc_ca_core_regs_t_agent_h*",
				"codix_risc_ca_core_regs_t_agent_config",
				m_cfg_h.m_codix_risc_ca_core_regs_t_agent_config_h );
			m_codix_risc_ca_core_regs_t_agent_h = codix_risc_ca_core_regs_t_agent::type_id::create( "m_codix_risc_ca_core_regs_t_agent_h", this );
		end
		// 'codix_risc_ca_core_main_instr_hw_instr_hw_t_agent' agent configuration visible to the agent only
		if ( m_cfg_h.has_codix_risc_ca_core_main_instr_hw_instr_hw_t_agent ) begin
			uvm_config_db #( codix_risc_ca_core_main_instr_hw_instr_hw_t_agent_config )::set( this,
				"m_codix_risc_ca_core_main_instr_hw_instr_hw_t_agent_h*",
				"codix_risc_ca_core_main_instr_hw_instr_hw_t_agent_config",
				m_cfg_h.m_codix_risc_ca_core_main_instr_hw_instr_hw_t_agent_config_h );
			m_codix_risc_ca_core_main_instr_hw_instr_hw_t_agent_h = codix_risc_ca_core_main_instr_hw_instr_hw_t_agent::type_id::create( "m_codix_risc_ca_core_main_instr_hw_instr_hw_t_agent_h", this );
		end
		// 'codix_risc_ca_t_agent' agent configuration visible to the agent only
		if ( m_cfg_h.has_codix_risc_ca_t_agent ) begin
			uvm_config_db #( codix_risc_ca_t_agent_config )::set( this,
				"m_codix_risc_ca_t_agent_h*",
				"codix_risc_ca_t_agent_config",
				m_cfg_h.m_codix_risc_ca_t_agent_config_h );
			m_codix_risc_ca_t_agent_h = codix_risc_ca_t_agent::type_id::create( "m_codix_risc_ca_t_agent_h", this );
		end
		m_scoreboard_h = codix_risc_ca_t_scoreboard::type_id::create( "m_scoreboard_h", this );
		// handle to golden reference model has to be initialized
		// from parent component during the build phase
		// m_gold_h = codix_risc_platform_ca_t_gm::type_id::create( "m_gold_h", this );
	endfunction: build_phase

	// Connect - create interconnection between child components
	function void connect_phase( uvm_phase phase );
		super.connect_phase( phase );
		if ( m_cfg_h.has_codix_risc_ca_t_agent ) begin
			if ( m_cfg_h.m_codix_risc_ca_t_agent_config_h.active == UVM_ACTIVE ) begin
				// agent monitor => golden reference model (same inputs as for DUT)
				m_codix_risc_ca_t_agent_h.stim_analysis_port.connect( m_gold_h.codix_risc_ca_t_analysis_export );
			end
			// agent monitor => scoreboard (DUT outputs)
			m_codix_risc_ca_t_agent_h.analysis_port.connect( m_scoreboard_h.dut_analysis_export );
		end
		// golden reference model => scoreboard (GM outputs)
		m_gold_h.codix_risc_ca_t_analysis_port.connect( m_scoreboard_h.gold_analysis_export );
		m_scoreboard_h.m_gold_h = m_gold_h;
	endfunction: connect_phase

endclass: codix_risc_ca_t_env

