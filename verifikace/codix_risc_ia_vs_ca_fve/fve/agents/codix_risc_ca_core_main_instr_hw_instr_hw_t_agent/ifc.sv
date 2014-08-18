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


// Input interface for decoder 'codix_risc_ca_core_main_instr_hw_instr_hw_t'.
interface icodix_risc_platform_ca_codix_risc_core_main_instr_hw_instr_hw( input logic CLK, input logic RST,
	input logic ACT,
	input logic [11:0] id_instr_Q0 );

	// import agent package for transaction and wrapper base classes
	import uvm_pkg::*;
	import sv_codix_risc_ca_core_main_instr_hw_instr_hw_t_agent_pkg::*;
	// decoded instruction code
	codix_risc_ca_core_main_instr_hw_instr_hw_t_decoder::operation_codes_e m_instruction;
	// disassembled instruction
	string m_instruction_name;
	// instruction decoder and disassembler
	codix_risc_ca_core_main_instr_hw_instr_hw_t_decoder m_decoder_h = codix_risc_ca_core_main_instr_hw_instr_hw_t_decoder::type_id::create( "m_decoder_h" );

	// clocking blocks

	// monitor point of view
	clocking cbm @( posedge CLK );
		input RST, ACT, id_instr_Q0, m_instruction;
	endclocking: cbm;

	// decode and disassemble instruction
	always @( cbm ) begin
		m_instruction = m_decoder_h.decode( id_instr_Q0 );
		m_instruction_name = m_decoder_h.m_instruction_name;
	end

	// Unique/concrete implementation of the interface wrapper for this interface
	class icodix_risc_platform_ca_codix_risc_core_main_instr_hw_instr_hw_itf_wrapper extends codix_risc_ca_core_main_instr_hw_instr_hw_t_itf_wrapper_base;

		// registration of object tools
		`uvm_object_utils( icodix_risc_platform_ca_codix_risc_core_main_instr_hw_instr_hw_itf_wrapper )

		// Constructor - creates new instance of this class
		function new( string name = "codix_risc_platform_ca_codix_risc_core_main_instr_hw_instr_hw_if" );
			super.new( name );
		endfunction: new

		// monitor - read values on all interface pins using monitor clocking blocks
		task automatic monitor( codix_risc_ca_core_main_instr_hw_instr_hw_t_transaction t );
			t.ACT = cbm.ACT;
			t.id_instr_Q0 = cbm.id_instr_Q0;
			t.RST = cbm.RST;
			t.m_instruction = cbm.m_instruction;
		endtask: monitor

		// monitor - read values on all interface pins asynchronously (no clocking blocks)
		task automatic async_monitor( codix_risc_ca_core_main_instr_hw_instr_hw_t_transaction t );
			t.ACT = ACT;
			t.id_instr_Q0 = id_instr_Q0;
			t.RST = cbm.RST;
			t.m_instruction = m_instruction;
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

	endclass: icodix_risc_platform_ca_codix_risc_core_main_instr_hw_instr_hw_itf_wrapper

	// Only instance of the wrapper
	icodix_risc_platform_ca_codix_risc_core_main_instr_hw_instr_hw_itf_wrapper m_vif_wrapper_h = new;

endinterface: icodix_risc_platform_ca_codix_risc_core_main_instr_hw_instr_hw
