/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Sat Jul 19 17:47:35 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codix_risc_platform_ca_t_env'.
 */

// DPI interface used to initialize memory content
// \param hdl full hierarchical path to the memory storage
// \param executable path to binary (executable) file, source data for the initialization
// \param address_space name of the address space
// \param base memory base address
// \param low lowest address of the memory range to initialize
// \param high highest address of the memory range to initialize
// \param sbi sub-block index of given memory storage instance, default value is zero
// \param sbc number of sub-blocks of the memory, default value is one
import "DPI-C" context function void codasip_dpi_memory_init( input string hdl,
	input string executable,
	input string addressSpace,
	input int unsigned base,
	input int unsigned low,
	input int unsigned high,
	input int unsigned sbi,
	input int unsigned sbc );

// This class represents the main parts of the verification environment.
class codix_risc_platform_ca_t_env extends uvm_env;

	// registration of component tools
	`uvm_component_utils( codix_risc_platform_ca_t_env )

	// environment configuration
	codix_risc_platform_ca_t_env_config m_cfg_h;
	// main sub-components
	// used to collect memory coverage (how extensive was the memory used).
	codasip_memory_mem_t_agent m_mem_agent_h;
	// verification environment for the 'codix_risc_platform_ca_codix_risc'
	codix_risc_ca_t_env m_codix_risc_env_h;
	codix_risc_platform_ca_t_agent m_codix_risc_platform_ca_t_agent_h;
	codix_risc_platform_ca_t_scoreboard m_scoreboard_h;
	codix_risc_platform_ca_t_gm m_gold_h;

	// Constructor - creates new instance of this class
	function new( string name = "m_env_h", uvm_component parent = null );
		super.new( name, parent );
	endfunction: new

	// Build - instantiates child components
	function void build_phase( uvm_phase phase );
		super.build_phase( phase );
		// environment configuration first
		if ( !uvm_config_db #(codix_risc_platform_ca_t_env_config)::get(this,
			"",
			"codix_risc_platform_ca_t_env_config",
			m_cfg_h) ) begin
			`uvm_fatal( "configuration:", "Cannot find 'codix_risc_platform_ca_t_env_config' inside uvm_config_db, probably not set!" )
		end
		// 'codasip_memory_mem_t_agent' agent configuration visible to the agent only
		if ( m_cfg_h.has_mem_agent ) begin
			uvm_config_db #( codasip_memory_mem_t_agent_config )::set( this,
				"m_mem_agent_h*",
				"codasip_memory_mem_t_agent_config",
				m_cfg_h.m_mem_agent_config_h );
			m_mem_agent_h = codasip_memory_mem_t_agent::type_id::create( "m_mem_agent_h", this );
		end
		// configuration for the 'codix_risc_platform_ca_codix_risc' environment
		if ( m_cfg_h.has_m_codix_risc_env_h ) begin
			uvm_config_db #( codix_risc_ca_t_env_config )::set( this,
				"m_codix_risc_env_h*",
				"codix_risc_ca_t_env_config",
				m_cfg_h.m_codix_risc_env_config_h );
			m_codix_risc_env_h = codix_risc_ca_t_env::type_id::create( "m_codix_risc_env_h", this );
		end
		// initialize memories visible from ASIP address space(s)
		codix_risc_as_all_load();
		// 'codix_risc_platform_ca_t_agent' agent configuration visible to the agent only
		if ( m_cfg_h.has_codix_risc_platform_ca_t_agent ) begin
			uvm_config_db #( codix_risc_platform_ca_t_agent_config )::set( this,
				"m_codix_risc_platform_ca_t_agent_h*",
				"codix_risc_platform_ca_t_agent_config",
				m_cfg_h.m_codix_risc_platform_ca_t_agent_config_h );
			m_codix_risc_platform_ca_t_agent_h = codix_risc_platform_ca_t_agent::type_id::create( "m_codix_risc_platform_ca_t_agent_h", this );
		end
		m_scoreboard_h = codix_risc_platform_ca_t_scoreboard::type_id::create( "m_scoreboard_h", this );
		m_gold_h = codix_risc_platform_ca_t_gm::type_id::create( "m_gold_h", this );
		// provide access to the golden reference model
		if ( m_cfg_h.has_m_codix_risc_env_h ) begin
			m_codix_risc_env_h.m_gold_h = m_gold_h;
		end
	endfunction: build_phase

	// Connect - create interconnection between child components
	function void connect_phase( uvm_phase phase );
		super.connect_phase( phase );
		if ( m_cfg_h.has_codix_risc_platform_ca_t_agent ) begin
			if ( m_cfg_h.m_codix_risc_platform_ca_t_agent_config_h.active == UVM_ACTIVE ) begin
				// agent monitor => golden reference model (same inputs as for DUT)
				m_codix_risc_platform_ca_t_agent_h.stim_analysis_port.connect( m_gold_h.codix_risc_platform_ca_t_analysis_export );
			end
			// agent monitor => scoreboard (DUT outputs)
			m_codix_risc_platform_ca_t_agent_h.analysis_port.connect( m_scoreboard_h.dut_analysis_export );
		end
		// golden reference model => scoreboard (GM outputs)
		m_gold_h.codix_risc_platform_ca_t_analysis_port.connect( m_scoreboard_h.gold_analysis_export );
		// now initialize scoreboard attributes
		if ( m_cfg_h.has_m_codix_risc_env_h ) begin
			if ( m_codix_risc_env_h.m_cfg_h.has_codix_risc_ca_core_regs_t_agent ) begin
				m_scoreboard_h.m_codix_risc_core_regs_agent_h = m_codix_risc_env_h.m_codix_risc_ca_core_regs_t_agent_h;
			end
		end
		if ( m_cfg_h.has_m_codix_risc_env_h ) begin
			if ( m_codix_risc_env_h.m_cfg_h.has_codix_risc_ca_t_agent ) begin
				if ( m_codix_risc_env_h.m_cfg_h.m_codix_risc_ca_t_agent_config_h.active == UVM_ACTIVE ) begin
					// agent monitor => golden reference model (same inputs as for DUT)
					m_codix_risc_env_h.m_codix_risc_ca_t_agent_h.stim_analysis_port.connect( m_gold_h.codix_risc_analysis_export );
				end
				// golden reference model => scoreboard (GM outputs)
				m_gold_h.codix_risc_analysis_port.connect( m_codix_risc_env_h.m_scoreboard_h.gold_analysis_export );
			end
		end
		m_scoreboard_h.m_mem_agent_h = m_mem_agent_h;
		m_scoreboard_h.m_gold_h = m_gold_h;
	endfunction: connect_phase

	// Load - initialize memories and components accessible from the address space
	// 'as_all' inside 'codix_risc' ASIP instance
	virtual function void codix_risc_as_all_load();
		automatic string executable = codasip_get_executable_path("codix_risc");
		automatic string address_space = "as_all";

		codasip_dpi_memory_init( "top.dut.HDL_DUT_U.mem.storage.subblock0.RAM",
			executable,
			address_space,
			32'd0,
			32'd0,
			32'd524287,
			0, 
			4 );
		codasip_dpi_memory_init( "top.dut.HDL_DUT_U.mem.storage.subblock1.RAM",
			executable,
			address_space,
			32'd0,
			32'd0,
			32'd524287,
			1, 
			4 );
		codasip_dpi_memory_init( "top.dut.HDL_DUT_U.mem.storage.subblock2.RAM",
			executable,
			address_space,
			32'd0,
			32'd0,
			32'd524287,
			2, 
			4 );
		codasip_dpi_memory_init( "top.dut.HDL_DUT_U.mem.storage.subblock3.RAM",
			executable,
			address_space,
			32'd0,
			32'd0,
			32'd524287,
			3, 
			4 );
	endfunction: codix_risc_as_all_load

endclass: codix_risc_platform_ca_t_env

