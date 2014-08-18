/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Sat Jul 19 17:47:35 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the halt and DUT interface.
 */

`include "uvm_macros.svh"


// Interface with port(s) used to activate halt functional unit(s) from main controller(s)
interface ihalt( input logic CLK, input logic RST,
	input logic codix_risc_platform_ca_codix_risc_core_main_controller_main_halt_halt_fu_semantics_ACT );

	// import agent package for transaction and wrapper base classes
	import uvm_pkg::*;
	import sv_codix_risc_platform_ca_t_agent_pkg::*;
	// clocking blocks

	// monitor point of view
	clocking cbm @( posedge CLK );
		input RST, codix_risc_platform_ca_codix_risc_core_main_controller_main_halt_halt_fu_semantics_ACT;
	endclocking: cbm;

	// Unique/concrete implementation of the halt interface wrapper
	class ihalt_itf_wrapper extends ihalt_itf_wrapper_base;

		// registration of object tools
		`uvm_object_utils( ihalt_itf_wrapper )

		// Constructor - creates new instance of this class
		function new( string name = "ihalt_if" );
			super.new( name );
		endfunction: new

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
		task automatic codix_risc_wait_for_halt();
			@( posedge codix_risc_platform_ca_codix_risc_core_main_controller_main_halt_halt_fu_semantics_ACT );
		endtask: codix_risc_wait_for_halt

		// wait for halt functional unit activation in every CPU
		task automatic wait_for_halt();
			fork
				codix_risc_wait_for_halt();
			join
		endtask: wait_for_halt

	endclass: ihalt_itf_wrapper

	// Only instance of the wrapper
	ihalt_itf_wrapper m_vif_wrapper_h = new;

endinterface: ihalt

// CPU port interface
interface icodix_risc_platform_ca( input logic CLK, input logic RST );

	// import agent package for transaction and wrapper base classes
	import uvm_pkg::*;
	import sv_codix_risc_platform_ca_t_agent_pkg::*;
	// member signals
	logic irq;
	logic [31:0] port_out;
	logic port_out_en;
	logic port_halt;
	logic [31:0] port_error;

	// clocking blocks

	// testbench point of view
	clocking cb @( posedge CLK );
		output irq;
		input port_out, port_out_en, port_halt, port_error;
	endclocking: cb;

	// monitor point of view
	clocking cbm @( posedge CLK );
		input RST, irq, port_out, port_out_en, port_halt, port_error;
	endclocking: cbm;

	// Unique/concrete implementation of the interface wrapper for this interface
	class icodix_risc_platform_ca_itf_wrapper extends codix_risc_platform_ca_t_itf_wrapper_base;

		// registration of object tools
		`uvm_object_utils( icodix_risc_platform_ca_itf_wrapper )

		// Constructor - creates new instance of this class
		function new( string name = "codix_risc_platform_ca_if" );
			super.new( name );
		endfunction: new

		// drive - drive input and inout pins
		task automatic drive( codix_risc_platform_ca_t_transaction t );
			cb.irq <= t.irq;
		endtask: drive

		// drive - drive input and inout pins
		task automatic drive_zero();
			cb.irq <= 1'b0;
		endtask: drive_zero

		// monitor - read values on all interface pins using monitor clocking blocks
		task automatic monitor( codix_risc_platform_ca_t_transaction t );
			t.irq = cbm.irq;
			t.port_out = cbm.port_out;
			t.port_out_en = cbm.port_out_en;
			t.port_halt = cbm.port_halt;
			t.port_error = cbm.port_error;
			t.RST = cbm.RST;
		endtask: monitor

		// monitor - read values on all interface pins asynchronously (no clocking blocks)
		task automatic async_monitor( codix_risc_platform_ca_t_transaction t );
			t.irq = irq;
			t.port_out = port_out;
			t.port_out_en = port_out_en;
			t.port_halt = port_halt;
			t.port_error = port_error;
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

	endclass: icodix_risc_platform_ca_itf_wrapper

	// Only instance of the wrapper
	icodix_risc_platform_ca_itf_wrapper m_vif_wrapper_h = new;

endinterface: icodix_risc_platform_ca
