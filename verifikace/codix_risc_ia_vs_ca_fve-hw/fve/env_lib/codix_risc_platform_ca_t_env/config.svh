/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Sat Jul 19 17:47:35 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codix_risc_platform_ca_t_env_config'.
 */

// Default configuration for the environment.
class codix_risc_platform_ca_t_env_config extends uvm_object;

	// registration of object tools
	`uvm_object_utils( codix_risc_platform_ca_t_env_config )

	// interface wrapper for halt instruction detection
	ihalt_itf_wrapper_base ihalt_if;

	// whether the various components are used
	bit has_mem_agent = 0;
	bit has_m_codix_risc_env_h = 0;
	bit has_codix_risc_platform_ca_t_agent = 0;

	// configurations for these components
	codasip_memory_mem_t_agent_config m_mem_agent_config_h;
	codix_risc_ca_t_env_config m_codix_risc_env_config_h;
	codix_risc_platform_ca_t_agent_config m_codix_risc_platform_ca_t_agent_config_h;

	// Constructor - creates new instance of this class
	function new( string name = "m_codix_risc_platform_ca_t_env_config_h" );
		super.new( name );
	endfunction: new

	// wait for halt functional unit activation
	task wait_for_halt();
		// ihalt_if.wait_for_halt();
	endtask: wait_for_halt

	// This method waits for n clock cycles.
	task wait_for_clock( int n = 1 );
		repeat ( n )
			@( posedge $root.top.CLK );
	endtask: wait_for_clock

endclass: codix_risc_platform_ca_t_env_config

