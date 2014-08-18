/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Sat Jul 19 17:47:35 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codix_risc_ca_t_sequencer'.
 */

// This class manages random inputs for DUT and sends them to driver.
class codix_risc_ca_t_sequencer extends uvm_sequencer #(codix_risc_ca_t_transaction);

	// registration of component tools
	`uvm_component_utils( codix_risc_ca_t_sequencer )

	// Constructor - creates new instance of this class
	function new( string name = "m_sequencer_h", uvm_component parent = null );
		super.new( name, parent );
	endfunction: new

endclass: codix_risc_ca_t_sequencer

