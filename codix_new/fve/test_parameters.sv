/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Wed Jun 18 14:16:23 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the 'sv_param_pkg' package.
 */

package sv_param_pkg;
	import uvm_pkg::*;

	`include "uvm_macros.svh"

	// clocks and resets
	parameter CLK_PERIOD = 10ns;

	// halt and finish checking limit (limit for detection of halt instruction
	// or finish signal for sequential units)
	parameter ITERATION_COUNT_LIMIT = 1000000;

	// test parameters
	// timeout detection
	parameter string AGENT_TIME_OUT = "agent_time_out";
	// how many transaction to generate
	parameter TRANSACTION_COUNT = ITERATION_COUNT_LIMIT;
	// limits the number of miscompares reported in the output file
	parameter MAX_ERROR_COUNT = 100;
	// initial seed for the PRNG
	parameter SEED = 484489045;

	// message IDs
	parameter string CODASIP_REPORT_GOLD_STATUS = "report_phase:gold_status";
	parameter string CODASIP_REPORT_GOLD_CYCLES = "report_phase:gold_cycles";
	parameter string CODASIP_REPORT_DUT_CYCLES = "report_phase:dut_cycles";
	parameter string CODASIP_REPORT_STATUS = "report_phase:verification_status";

	// request command constants
	localparam [2:0] CP_RQ_NONE = 3'b000;
	localparam [2:0] CP_RQ_READ = 3'b001;
	localparam [2:0] CP_RQ_WRITE = 3'b010;
	localparam [2:0] CP_RQ_INVALIDATE = 3'b100;
	localparam [2:0] CP_RQ_FLUSH = 3'b110;
	localparam [2:0] CP_IF_READ = 3'b001;
	localparam [2:0] CP_OF_WRITE = 3'b010;
	// command response constants
	localparam [2:0] CP_RC_WAIT = 3'b000;
	localparam [2:0] CP_RC_ACK = 3'b001;
	localparam [2:0] CP_RC_UNALIGNED = 3'b100;
	localparam [2:0] CP_RC_OOR = 3'b101;
	localparam [2:0] CP_RC_ERROR = 3'b110;

	// Get - return path to executable file needed to initialize ASIP instance
	// \param id ASIP instance identifier
	function automatic string codasip_get_executable_path( input string id );
		string values[$];
		string split_values[$];
      uvm_cmdline_processor cmdlime = uvm_cmdline_processor::get_inst();
      
		void'( cmdlime.get_arg_values("+CODASIP_XEXE_PATH=", values) );
		foreach ( values[ii] ) begin
			uvm_split_string( values[ii], ",", split_values );
			if ( (split_values.size() == 2) && (split_values[0] == id) ) begin
				return split_values[1];
			end
		end
		`uvm_fatal( "executable", $sformatf(
			"Failed to find input program to initialize golden model for '%s'.\n", id) )
		return "";
	endfunction: codasip_get_executable_path

	// Detect CodAL instance name if current client represents a UVM scoreboard.
	// In case of a scoreboard, the instance is extracted from name of parent
	// environment, otherwise object name is returned.
	function automatic string codasip_get_codal_name( uvm_object client_h );
		uvm_scoreboard scoreboard_h;
		$cast( scoreboard_h, client_h );
		if ( (scoreboard_h != null) && (scoreboard_h.get_parent() != null) ) begin
         uvm_component parent = scoreboard_h.get_parent();
         string name = parent.get_name();
			return name.substr( 2,
				name.len() -7 );
		end else if ( client_h != null ) begin
			return client_h.get_name();
		end else begin
			return "";
		end
	endfunction: codasip_get_codal_name

endpackage: sv_param_pkg
