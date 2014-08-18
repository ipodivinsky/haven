/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Sat Jul 19 17:47:35 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codasip_memory_mem_t_agent_config'.
 */

// Default configuration for codasip_memory_mem_t_agent
class codasip_memory_mem_t_agent_config extends uvm_object;

	// registration of object tools
	`uvm_object_utils( codasip_memory_mem_t_agent_config )

	// interface wrapper
	codasip_memory_mem_t_itf_wrapper_base vif;

	// is the agent active or passive
	uvm_active_passive_enum active = UVM_PASSIVE;
	// include coverage
	bit has_coverage = 1;

	// Constructor - creates new instance of this class
	function new( string name = "m_cfg_h" );
		super.new( name );
	endfunction: new

endclass: codasip_memory_mem_t_agent_config

