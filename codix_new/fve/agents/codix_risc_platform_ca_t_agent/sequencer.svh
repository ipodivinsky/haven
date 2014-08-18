/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Wed Jun 18 14:16:23 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codix_risc_platform_ca_t_sequencer'.
 */

// This class manages random inputs for DUT and sends them to driver.
class codix_risc_platform_ca_t_sequencer extends uvm_sequencer #(codix_risc_platform_ca_t_transaction);

	// registration of component tools
	`uvm_component_utils( codix_risc_platform_ca_t_sequencer )

	// Constructor - creates new instance of this class
	function new( string name = "m_sequencer_h", uvm_component parent = null );
		super.new( name, parent );
	endfunction: new

endclass: codix_risc_platform_ca_t_sequencer

