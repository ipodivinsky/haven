/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Sat Jul 19 17:47:35 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the agent interface.
 */

`include "uvm_macros.svh"


// Interface of register file 'regs'.
interface icodix_risc_platform_ca_codix_risc_core_regs( input logic CLK, input logic RST,
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

	// import agent package for transaction and wrapper base classes
	import uvm_pkg::*;
	import sv_codix_risc_ca_core_regs_t_agent_pkg::*;
	// clocking blocks

	// monitor point of view
	clocking cbm @( posedge CLK );
		input RST, Q0, RA0, RE0, Q1, RA1, RE1, Q2, RA2, RE2, D0, WA0, WE0;
	endclocking: cbm;

	// Unique/concrete implementation of the interface wrapper for this interface
	class icodix_risc_platform_ca_codix_risc_core_regs_itf_wrapper extends codix_risc_ca_core_regs_t_itf_wrapper_base;

		// registration of object tools
		`uvm_object_utils( icodix_risc_platform_ca_codix_risc_core_regs_itf_wrapper )

		// Constructor - creates new instance of this class
		function new( string name = "codix_risc_platform_ca_codix_risc_core_regs_if" );
			super.new( name );
		endfunction: new

		// monitor - read values on all interface pins using monitor clocking blocks
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

		// monitor - read values on all interface pins asynchronously (no clocking blocks)
		task automatic async_monitor( codix_risc_ca_core_regs_t_transaction t );
			t.Q0 = Q0;
			t.RA0 = RA0;
			t.RE0 = RE0;
			t.Q1 = Q1;
			t.RA1 = RA1;
			t.RE1 = RE1;
			t.Q2 = Q2;
			t.RA2 = RA2;
			t.RE2 = RE2;
			t.D0 = D0;
			t.WA0 = WA0;
			t.WE0 = WE0;
			t.RST = cbm.RST;
		endtask: async_monitor

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

	endclass: icodix_risc_platform_ca_codix_risc_core_regs_itf_wrapper

	// Only instance of the wrapper
	icodix_risc_platform_ca_codix_risc_core_regs_itf_wrapper m_vif_wrapper_h = new;

endinterface: icodix_risc_platform_ca_codix_risc_core_regs
