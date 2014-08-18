/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Sat Jul 19 17:47:35 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codix_risc_platform_ca_t_test_base'.
 */

// This is the base UVM test class for codix_risc_platform_ca
class codix_risc_platform_ca_t_test_base extends uvm_test;

	// registration of component tools
	`uvm_component_utils( codix_risc_platform_ca_t_test_base )

	// environment configuration
	codix_risc_platform_ca_t_env_config m_codix_risc_platform_ca_t_env_config_h;
	// same handler as the one above, just different name
	codix_risc_platform_ca_t_env_config m_env_config_h;
	// member attribute with the verification environment
	codix_risc_platform_ca_t_env m_codix_risc_platform_ca_t_env_h;
	// same handler as the one above, just different name
	codix_risc_platform_ca_t_env m_env_h;
	// final report generator
	codasip_report_generator m_codasip_report_generator_h;
	// time-out detection
	local bit m_timeout;

	// standard UVM interface

	// Constructor - creates new instance of this class
	function new( string name = "codix_risc_platform_ca_t_test_base", uvm_component parent = null );
		super.new( name, parent );
		m_timeout = 0;
	endfunction: new

	// Build - instantiates child components
	function void build_phase( uvm_phase phase );
		super.build_phase( phase );
		// create report generator to catch errors during elaboration phases
		m_codasip_report_generator_h = codasip_report_generator::type_id::create( "m_codasip_report_generator_h" );
		m_codasip_report_generator_h.open();
		uvm_report_cb::add( null, m_codasip_report_generator_h );
		// set environment configuration first
		m_codix_risc_platform_ca_t_env_config_h = setup_codix_risc_platform_ca_t_env_config();
		m_env_config_h = m_codix_risc_platform_ca_t_env_config_h;
		// then put environment configuration in the global UVM database
		uvm_config_db #( codix_risc_platform_ca_t_env_config )::set( this,
			"*",
			"codix_risc_platform_ca_t_env_config",
			m_env_config_h );
		// finally build the environment
		m_codix_risc_platform_ca_t_env_h = codix_risc_platform_ca_t_env::type_id::create( "m_codix_risc_platform_ca_t_env_h", this );
		m_env_h = m_codix_risc_platform_ca_t_env_h;
	endfunction: build_phase

	// Report - generate final report (success/failure)
	function void report_phase( uvm_phase phase );
		m_codasip_report_generator_h.report_summarize( reached_timeout() );
		m_codasip_report_generator_h.close();
	endfunction: report_phase

	// interface to customize configuration objects

	// Set indication flag whether time-out was reached or not
	function automatic void set_timeout( bit value );
		m_timeout = value;
	endfunction: set_timeout

	// Indicate whether time-out was reached or not
	function automatic bit reached_timeout();
		return m_timeout;
	endfunction: reached_timeout

	// Convenience function to create, customize and store configuration for 'regs' agent.
	local function codix_risc_ca_core_regs_t_agent_config setup_codix_risc_core_regs_agent_config();
		codix_risc_ca_core_regs_t_agent_config cfg_h;
		cfg_h = codix_risc_ca_core_regs_t_agent_config::type_id::create( "m_codix_risc_core_regs_agent_config_h" );
		if ( !uvm_config_db #(codix_risc_ca_core_regs_t_itf_wrapper_base)::get(this,
			"",
			"codix_risc_platform_ca_codix_risc_core_regs_if",
			cfg_h.vif) ) begin
			`uvm_fatal( "configuration:", "Cannot find 'codix_risc_platform_ca_codix_risc_core_regs_if' inside uvm_config_db, probably not set!" )
		end
		return cfg_h;
	endfunction: setup_codix_risc_core_regs_agent_config

	// Convenience function to create, customize and store configuration for 'codix_risc_platform_ca_codix_risc_core_main_instr_hw_instr_hw' agent.
	local function codix_risc_ca_core_main_instr_hw_instr_hw_t_agent_config setup_codix_risc_core_main_instr_hw_instr_hw_agent_config();
		codix_risc_ca_core_main_instr_hw_instr_hw_t_agent_config cfg_h;
		cfg_h = codix_risc_ca_core_main_instr_hw_instr_hw_t_agent_config::type_id::create( "m_codix_risc_core_main_instr_hw_instr_hw_agent_config_h" );
		if ( !uvm_config_db #(codix_risc_ca_core_main_instr_hw_instr_hw_t_itf_wrapper_base)::get(this,
			"",
			"codix_risc_platform_ca_codix_risc_core_main_instr_hw_instr_hw_if",
			cfg_h.vif) ) begin
			`uvm_fatal( "configuration:", "Cannot find 'codix_risc_platform_ca_codix_risc_core_main_instr_hw_instr_hw_if' inside uvm_config_db, probably not set!" )
		end
		return cfg_h;
	endfunction: setup_codix_risc_core_main_instr_hw_instr_hw_agent_config

	// Convenience function to create, customize and store configuration for 'codix_risc_platform_ca_codix_risc' agent.
	local function codix_risc_ca_t_agent_config setup_codix_risc_agent_config();
		codix_risc_ca_t_agent_config cfg_h;
		cfg_h = codix_risc_ca_t_agent_config::type_id::create( "m_codix_risc_agent_config_h" );
		if ( !uvm_config_db #(codix_risc_ca_t_itf_wrapper_base)::get(this,
			"",
			"codix_risc_platform_ca_codix_risc_if",
			cfg_h.vif) ) begin
			`uvm_fatal( "configuration:", "Cannot find 'codix_risc_platform_ca_codix_risc_if' inside uvm_config_db, probably not set!" )
		end
		return cfg_h;
	endfunction: setup_codix_risc_agent_config

	// Convenience function to create, customize and store configuration for 'codix_risc_platform_ca_codix_risc' environment.
	local function codix_risc_ca_t_env_config setup_codix_risc_env_config();
		codix_risc_ca_t_env_config cfg_h;
		cfg_h = codix_risc_ca_t_env_config::type_id::create( "m_codix_risc_env_config_h" );
		// create and customize sub-component configurations
		cfg_h.m_codix_risc_ca_core_regs_t_agent_config_h = setup_codix_risc_core_regs_agent_config();
		cfg_h.m_codix_risc_ca_core_main_instr_hw_instr_hw_t_agent_config_h = setup_codix_risc_core_main_instr_hw_instr_hw_agent_config();
		cfg_h.m_codix_risc_ca_t_agent_config_h = setup_codix_risc_agent_config();
		return cfg_h;
	endfunction: setup_codix_risc_env_config

	// Convenience function to create, customize and store configuration for 'mem' agent.
	local function codasip_memory_mem_t_agent_config setup_mem_agent_config();
		codasip_memory_mem_t_agent_config cfg_h;
		cfg_h = codasip_memory_mem_t_agent_config::type_id::create( "m_mem_agent_config_h" );
		if ( !uvm_config_db #(codasip_memory_mem_t_itf_wrapper_base)::get(this,
			"",
			"codix_risc_platform_ca_mem_if",
			cfg_h.vif) ) begin
			`uvm_fatal( "configuration:", "Cannot find 'codix_risc_platform_ca_mem_if' inside uvm_config_db, probably not set!" )
		end
		return cfg_h;
	endfunction: setup_mem_agent_config

	// Convenience function to create, customize and store configuration for 'codix_risc_platform_ca' agent.
	local function codix_risc_platform_ca_t_agent_config setup_codix_risc_platform_ca_t_agent_config();
		codix_risc_platform_ca_t_agent_config cfg_h;
		cfg_h = codix_risc_platform_ca_t_agent_config::type_id::create( "m_codix_risc_platform_ca_t_agent_config_h" );
		if ( !uvm_config_db #(codix_risc_platform_ca_t_itf_wrapper_base)::get(this,
			"",
			"codix_risc_platform_ca_if",
			cfg_h.vif) ) begin
			`uvm_fatal( "configuration:", "Cannot find 'codix_risc_platform_ca_if' inside uvm_config_db, probably not set!" )
		end
		return cfg_h;
	endfunction: setup_codix_risc_platform_ca_t_agent_config

	// Convenience function to create, customize and store configuration for 'codix_risc_platform_ca' environment.
	local function codix_risc_platform_ca_t_env_config setup_codix_risc_platform_ca_t_env_config();
		codix_risc_platform_ca_t_env_config cfg_h;
		cfg_h = codix_risc_platform_ca_t_env_config::type_id::create( "m_codix_risc_platform_ca_t_env_config_h" );
		// create and customize sub-component configurations
		cfg_h.m_codix_risc_env_config_h = setup_codix_risc_env_config;
		cfg_h.m_mem_agent_config_h = setup_mem_agent_config();
		cfg_h.m_codix_risc_platform_ca_t_agent_config_h = setup_codix_risc_platform_ca_t_agent_config();
		if ( !uvm_config_db #(ihalt_itf_wrapper_base)::get(this,
			"",
			"ihalt_if",
			cfg_h.ihalt_if) ) begin
			`uvm_fatal( "configuration:", "Cannot find 'ihalt_if' inside uvm_config_db, probably not set!" )
		end
		return cfg_h;
	endfunction: setup_codix_risc_platform_ca_t_env_config

endclass: codix_risc_platform_ca_t_test_base

