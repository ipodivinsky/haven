/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Wed Jun 18 14:16:23 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the agent interface.
 */


// Interface of register file 'regs'.
interface icodix_risc_ca_core_regs_t( input logic CLK, input logic RST,
	input logic [31:0] Q0,
	input logic [4:0] RA0,
	input logic RE0,
	input logic [31:0] Q1,
	input logic [4:0] RA1,
	input logic RE1,
	input logic [31:0] Q2,
	input logic [4:0] RA2,
	input logic RE2,
	input logic [31:0] D0,
	input logic [4:0] WA0,
	input logic WE0 );

	// import transaction class needed by the generated task
	import sv_codix_risc_ca_core_regs_t_agent_pkg::codix_risc_ca_core_regs_t_transaction;

	// clocking blocks

	// monitor point of view
	clocking cbm @( posedge CLK );
		input RST, Q0, RA0, RE0, Q1, RA1, RE1, Q2, RA2, RE2, D0, WA0, WE0;
	endclocking: cbm;

	// monitor - read values on all interface pins, using monitor clocking blocks
	task automatic monitor( codix_risc_ca_core_regs_t_transaction t );
		t.Q0 = cbm.Q0;
		t.RA0 = cbm.RA0;
		t.RE0 = cbm.RE0;
		t.Q1 = cbm.Q1;
		t.RA1 = cbm.RA1;
		t.RE1 = cbm.RE1;
		t.Q2 = cbm.Q2;
		t.RA2 = cbm.RA2;
		t.RE2 = cbm.RE2;
		t.D0 = cbm.D0;
		t.WA0 = cbm.WA0;
		t.WE0 = cbm.WE0;
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
		input CLK, RA0, RE0, RA1, RE1, RA2, RE2, D0, WA0, WE0,
		output Q0, Q1, Q2,
		import task wait_for_clock( int n ),
		import task wait_for_reset_inactive() );

	// monitor point of view, synchronous
	modport SYNC_MONITOR( clocking cbm,
		import task monitor( codix_risc_ca_core_regs_t_transaction t ),
		import task wait_for_clock( int n ),
		import task wait_for_reset_inactive() );

endinterface: icodix_risc_ca_core_regs_t
