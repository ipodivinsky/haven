/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Sat Jul 19 17:47:35 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codasip_report_generator'.
 */

// Produces the final report to saved into a file.
class codasip_report_generator extends uvm_report_catcher;

	// registration of object tools
	`uvm_object_utils( codasip_report_generator )

	// member attributes
	// number of golden (reference) model clock cycles
	local longint unsigned m_gm_cycles = 0;
	// result of the golden model state
	local bit m_gm_status;
	// result of the DUT states
	local string m_dut_status[string];
	// error messages
	local string m_errors;
	// file descriptor where to generate final report
	local UVM_FILE m_file;

	// Constructor - creates new instance of this class
	function new( string name = "m_codasip_report_generator_h" );
		super.new( name );
	endfunction: new

	// Catch important (predefined) messages and store them for final report
	function action_e catch();
		automatic string message = get_message();
		automatic uvm_report_object client_h = get_client();

		if ( get_severity() == UVM_FATAL ) begin
			m_errors = $sformatf( "%s%s(%0d) @ %t: %s [%s] %s\n",
				m_errors, get_fname(), get_line(), $time, client_h.get_full_name(), get_id(), message );
			report_summarize();
			close();
		end else if ( get_severity() == UVM_ERROR ) begin
			m_errors = $sformatf( "%s%s(%0d) @ %t: %s [%s] %s\n",
				m_errors, get_fname(), get_line(), $time, client_h.get_full_name(), get_id(), message );
		end else if ( (get_severity() == UVM_INFO) && (get_id() == CODASIP_REPORT_GOLD_CYCLES) ) begin
			m_gm_cycles = message.atoi();
			return CAUGHT;
		end else if ( (get_severity() == UVM_INFO) && (get_id() == CODASIP_REPORT_GOLD_STATUS) ) begin
			m_gm_status = message.atoi();
			return CAUGHT;
		end else if ( get_id() == CODASIP_REPORT_STATUS ) begin
			automatic string client = codasip_get_codal_name( client_h );
			if ( message.len() == 0 ) begin
				m_dut_status[client] = "ok";
			end else begin
				m_dut_status[client] = "fail";
				m_errors = { m_errors, message };
			end
			return CAUGHT;
		end
		return THROW;
	endfunction: catch

	// Outputs internal informations into final report file.
	// \param dut_timeout indicates whether DUT time-out has been reached or not
	function automatic void report_summarize( bit dut_timeout = 0 );
		string status;

		if ( (get_severity() != UVM_FATAL) && (get_severity != UVM_ERROR) ) begin
			status = "ok";
			foreach ( m_dut_status[name] ) begin
				if ( m_dut_status[name] != "ok" ) begin
					status = "fail";
				end
			end
			if ( dut_timeout && !m_gm_status ) begin
				status = "timeout (DUT and GM)";
				m_errors = "";
			end else if ( dut_timeout ) begin
				status = "timeout (DUT)";
				m_errors = "";
			end else if ( !m_gm_status ) begin
				status = "timeout (GM)";
				m_errors = "";
			end
		end else begin
			status = "fail";
		end
		$fwrite( m_file, ";codix_risc_platform_ca;%s;%0d;%0d;%s\n",
			codasip_get_executable_path("codix_risc"),
			m_gm_cycles,
			get_dut_cycles(),
			status );
		$fwrite( m_file, m_errors );
	endfunction: report_summarize

	// Open output file where to generate final report.
	// The output file name is parsed from the command-line plusarg.
	function automatic void open();
		string fname;
		uvm_cmdline_processor cmd_line = uvm_cmdline_processor::get_inst();

		if ( !cmd_line.get_arg_value("+CODASIP_REPORT_FILE=", fname) ) begin
			// provide default path to report file if not specified
			fname = "report.txt";
		end
		m_file = $fopen( fname, "a" );
	endfunction: open

	// Close the report output file
	function automatic void close();
		$fclose( m_file );
		m_file = 0;
	endfunction: close

	// Detect DUT cycle count
	local function automatic longint unsigned get_dut_cycles();
		longint unsigned cycles = ($time / CLK_PERIOD);
		if ( cycles != 0 ) begin
			// skip first half period, which wasn't complete
			cycles -= 1;
		end
		return cycles;
	endfunction: get_dut_cycles

endclass: codasip_report_generator

