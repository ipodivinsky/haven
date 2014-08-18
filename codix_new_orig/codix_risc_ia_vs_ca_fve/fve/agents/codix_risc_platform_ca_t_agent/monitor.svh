/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Wed Jun 18 14:16:23 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codix_risc_platform_ca_t_monitor'.
 */

// This class is used to monitor interface pins of the DUT/DUV.
class codix_risc_platform_ca_t_monitor extends uvm_monitor;

	// registration of component tools
	`uvm_component_utils( codix_risc_platform_ca_t_monitor )

	// reference to DUT interface, initialized during the connect phase by parent agent
	virtual icodix_risc_platform_ca_t vif;
	// used to send transactions to all connected components
	uvm_analysis_port #(codix_risc_platform_ca_t_transaction) analysis_port;

	// Constructor - creates new instance of this class
	function new( string name = "m_monitor_h", uvm_component parent = null );
		super.new( name, parent );
	endfunction: new

	// Build - instantiates child components
	function void build_phase( uvm_phase phase );
		super.build_phase( phase );
		analysis_port = new( "analysis_port", this );
	endfunction: build_phase

	// Run - starts the processing in monitor
	task run_phase( uvm_phase phase );
		codix_risc_platform_ca_t_transaction dut;
		// start processing after the reset becomes inactive
		vif.wait_for_reset_inactive();
		@( vif.cbm );
		// monitor interface every clock cycle
		forever begin
			dut = codix_risc_platform_ca_t_transaction::type_id::create( "dut" );
			// synchronize with the DUT
			@( vif.cbm );
			// receive interface pin values
			vif.monitor( dut );
			// display the content of the transaction
			// dut.print();
			// send it to the scoreboard, subscribers, ...
			analysis_port.write( dut );
		end
	endtask: run_phase

endclass: codix_risc_platform_ca_t_monitor

