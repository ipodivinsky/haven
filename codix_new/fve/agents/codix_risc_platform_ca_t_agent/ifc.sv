/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Wed Jun 18 14:16:23 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the halt and DUT interface.
 */


// Interface with port(s) used to activate halt functional unit(s) from main controller(s)
interface ihalt( input logic CLK, input logic RST,
	input logic codix_risc_platform_ca_codix_risc_core_main_controller_main_halt_halt_fu_semantics_ACT );

	// clocking blocks

	// monitor point of view
	clocking cbm @( posedge CLK );
		input RST, codix_risc_platform_ca_codix_risc_core_main_controller_main_halt_halt_fu_semantics_ACT;
	endclocking: cbm;

	// wait for n clock cycles
	task automatic wait_for_clock( int n = 1 );
		repeat ( n ) begin
			@( cbm );
		end
	endtask: wait_for_clock

	// wait for reset to finish
	task automatic wait_for_reset_inactive();
		@( posedge RST );
	endtask: wait_for_reset_inactive

	// halt activation for every CPU

	// wait for halt functional unit activation in 'codix_risc_platform_ca_codix_risc' processor
	task automatic codix_risc_ca_t_wait_for_halt();
		@( posedge codix_risc_platform_ca_codix_risc_core_main_controller_main_halt_halt_fu_semantics_ACT );
	endtask: codix_risc_ca_t_wait_for_halt

	// wait for halt functional unit activation in every CPU
	task automatic wait_for_halt();
		fork
			codix_risc_ca_t_wait_for_halt();
		join
	endtask: wait_for_halt

endinterface: ihalt

// CPU port interface
interface icodix_risc_platform_ca_t( input logic CLK, input logic RST );

	// import transaction class needed by the generated task
	import sv_codix_risc_platform_ca_t_agent_pkg::codix_risc_platform_ca_t_transaction;

	// member signals

	// clocking blocks

	// testbench point of view
	clocking cb @( posedge CLK );
	endclocking: cb;

	// monitor point of view
	clocking cbm @( posedge CLK );
		input RST;
	endclocking: cbm;

	// drive - drive input and inout pins
	task automatic drive( codix_risc_platform_ca_t_transaction t );
	endtask: drive

	// drive - drive input and inout pins
	task automatic drive_zero();
	endtask: drive_zero

	// monitor - read values on all interface pins, using monitor clocking blocks
	task automatic monitor( codix_risc_platform_ca_t_transaction t );
		t.RST = cbm.RST;
	endtask: monitor

	// wait for n clock cycles
	task automatic wait_for_clock( int n = 1 );
		repeat ( n ) begin
			@( cbm );
		end
	endtask: wait_for_clock

	// wait for reset to finish
	task automatic wait_for_reset_inactive();
		@( posedge RST );
	endtask: wait_for_reset_inactive

	// direction modports

	// RTL point of view
	modport DUT(
		input CLK, RST,
		import task wait_for_clock( int n ),
		import task wait_for_reset_inactive() );

	// testbench point of view, synchronous
	modport SYNC_TEST( clocking cb,
		import task drive( codix_risc_platform_ca_t_transaction t ),
		import task drive_zero(),
		import task monitor( codix_risc_platform_ca_t_transaction t ),
		import task wait_for_clock( int n ),
		import task wait_for_reset_inactive() );

	// monitor point of view, synchronous
	modport SYNC_MONITOR( clocking cbm,
		import task monitor( codix_risc_platform_ca_t_transaction t ),
		import task wait_for_clock( int n ),
		import task wait_for_reset_inactive() );

endinterface: icodix_risc_platform_ca_t
