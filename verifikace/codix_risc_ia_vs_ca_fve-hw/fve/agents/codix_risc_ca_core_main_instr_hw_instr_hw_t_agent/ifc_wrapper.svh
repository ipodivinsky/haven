/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Sat Jul 19 17:47:35 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the agent interface wrapper abstract base.
 */

// Defines interface of the abstract wrapper class.
virtual class codix_risc_ca_core_main_instr_hw_instr_hw_t_itf_wrapper_base extends uvm_object;

	// Constructor - creates new instance of this class
	function new( string name = "codix_risc_platform_ca_codix_risc_core_main_instr_hw_instr_hw_if" );
		super.new( name );
	endfunction: new

	// monitor - read values on all interface pins using monitor clocking blocks
	pure virtual task automatic monitor( codix_risc_ca_core_main_instr_hw_instr_hw_t_transaction t );

	// monitor - read values on all interface pins asynchronously (no clocking blocks)
	pure virtual task automatic async_monitor( codix_risc_ca_core_main_instr_hw_instr_hw_t_transaction t );

	// wait for n clock cycles
	pure virtual task automatic wait_for_clock( int n = 1 );

	// wait for reset to finish
	pure virtual task automatic wait_for_reset_inactive();

endclass: codix_risc_ca_core_main_instr_hw_instr_hw_t_itf_wrapper_base

