/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Sat Jul 19 17:47:35 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codasip_memory_mem_t_agent'.
 */

// Represents agent class handling memory usage (what addresses, data, ... were used).
class codasip_memory_mem_t_agent extends uvm_agent;

	// registration of component tools
	`uvm_component_utils( codasip_memory_mem_t_agent )

	// analysis port for outside components to access transactions from the monitor
	uvm_analysis_port #(codasip_memory_mem_t_transaction) analysis_port;
	// analysis port for golden reference model to access the same stimuli as the driver
	uvm_analysis_port #(codasip_memory_mem_t_transaction) stim_analysis_port;

	// agent configuration
	codasip_memory_mem_t_agent_config m_cfg_h;
	// component members for passive mode
	codasip_memory_mem_t_monitor m_monitor_h;
	codasip_memory_mem_t_coverage m_coverage_h;

	// Constructor - creates new instance of this class
	function new( string name = "m_agent_h", uvm_component parent = null );
		super.new( name, parent );
	endfunction: new

	// Build - instantiates child components
	function void build_phase( uvm_phase phase );
		super.build_phase( phase );
		// get the configuration first
		if ( !uvm_config_db #(codasip_memory_mem_t_agent_config)::get(this,
			"",
			"codasip_memory_mem_t_agent_config",
			m_cfg_h) ) begin
			`uvm_fatal( "configuration:", "Cannot find 'codasip_memory_mem_t_agent_config' inside uvm_config_db, probably not set!" )
		end
		this.is_active = m_cfg_h.active;
		// now build all sub-components, monitor is always present
		m_monitor_h = codasip_memory_mem_t_monitor::type_id::create( "m_monitor_h", this );
		// build coverage subscriber if enabled
		if ( m_cfg_h.has_coverage ) begin
			m_coverage_h = codasip_memory_mem_t_coverage::type_id::create( "m_coverage_h", this );
		end
	endfunction: build_phase

	// Connect - create interconnection between child components
	function void connect_phase( uvm_phase phase );
		super.connect_phase( phase );
		// check if the virtual interface is set
		if ( m_cfg_h.vif == null ) begin
			`uvm_fatal( "connect:", "Invalid reference to interface 'vif'!" )
		end
		// connect monitor and assign interface
		analysis_port = m_monitor_h.analysis_port;
		// passive agents have to use transactions from the monitor
		stim_analysis_port = m_monitor_h.analysis_port;
		m_monitor_h.vif = m_cfg_h.vif;
		// connect monitor with coverage subscriber
		if ( m_cfg_h.has_coverage ) begin
			m_monitor_h.analysis_port.connect( m_coverage_h.analysis_export );
		end
	endfunction: connect_phase

endclass: codasip_memory_mem_t_agent

