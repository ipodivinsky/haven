/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Sat Jul 19 17:47:35 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codix_risc_ca_t_driver'.
 */

// Definition of the driver class 'codix_risc_ca_t_driver' used for communication with agents input interface.
class codix_risc_ca_t_driver extends uvm_driver #(codix_risc_ca_t_transaction);

	// registration of component tools
	`uvm_component_utils( codix_risc_ca_t_driver )

	// reference to the interface wrapper, initialized during the connect phase by parent agent
	codix_risc_ca_t_itf_wrapper_base vif;
	// used to send transactions to the golden reference model
	uvm_analysis_port #(codix_risc_ca_t_transaction) analysis_port;

	// Constructor - creates new instance of this class
	function new( string name = "m_driver_h", uvm_component parent = null );
		super.new( name, parent );
	endfunction: new

	// Build - instantiates child components
	function void build_phase( uvm_phase phase );
		super.build_phase( phase );
		analysis_port = new( "analysis_port", this );
	endfunction: build_phase

	// Run - starts the processing in driver (bidirectional)
	task run_phase( uvm_phase phase );
		// deep copy of the request
		codix_risc_ca_t_transaction cloned_req;
		// zero all input and inout pins at start
		vif.drive_zero();
		// synchronize with DUT and wait for reset to end
		vif.wait_for_reset_inactive();
		// synchronize with DUT
		vif.wait_for_clock();
		forever begin
			// get next available sequence item
			seq_item_port.get_next_item( req );
			// create deep copy of the request
			if ( !$cast(cloned_req, req.clone()) ) begin
				`uvm_fatal( "run:", "Failed to clone request for the golden reference model" )
			end
			// drive ports
			vif.drive( req );
			// synchronize with DUT
			vif.wait_for_clock();
			// set DUT response for the sequence
			vif.monitor( req );
			// received sequence has been consumed
			seq_item_port.item_done();
			// send stimuli to the golden reference model
			analysis_port.write( cloned_req );
		end
	endtask: run_phase

endclass: codix_risc_ca_t_driver

