/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Wed Jun 18 14:16:23 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the agent interface.
 */


// Interface of memory 'mem'.
interface icodasip_memory_mem_t( input logic CLK, input logic RST,
	input logic [31:0] read_only_A0,
	input logic [1:0] read_only_SI0,
	input logic [2:0] read_only_SC0,
	input logic [2:0] read_only_REQCMD0,
	input logic [2:0] read_only_REQRESP0,
	input logic [31:0] read_only_Q0,
	input logic [2:0] read_only_IFCMD0,
	input logic [2:0] read_only_IFRESP0,
	input logic [31:0] read_write_A0,
	input logic [1:0] read_write_SI0,
	input logic [2:0] read_write_SC0,
	input logic [2:0] read_write_REQCMD0,
	input logic [2:0] read_write_REQRESP0,
	input logic [31:0] read_write_Q0,
	input logic [2:0] read_write_IFCMD0,
	input logic [2:0] read_write_IFRESP0,
	input logic [31:0] read_write_D0,
	input logic [2:0] read_write_OFCMD0,
	input logic [2:0] read_write_OFRESP0 );

	// import transaction class needed by the generated task
	import sv_codasip_memory_mem_t_agent_pkg::codasip_memory_mem_t_transaction;

	// clocking blocks

	// monitor point of view
	clocking cbm @( posedge CLK );
		input RST, read_only_A0, read_only_SI0, read_only_SC0, read_only_REQCMD0, read_only_REQRESP0, read_only_Q0, read_only_IFCMD0, read_only_IFRESP0, read_write_A0, read_write_SI0, read_write_SC0, read_write_REQCMD0, read_write_REQRESP0, read_write_Q0, read_write_IFCMD0, read_write_IFRESP0, read_write_D0, read_write_OFCMD0, read_write_OFRESP0;
	endclocking: cbm;

	// monitor - read values on all interface pins, using monitor clocking blocks
	task automatic monitor( codasip_memory_mem_t_transaction t );
		t.read_only_A0 = cbm.read_only_A0;
		t.read_only_SI0 = cbm.read_only_SI0;
		t.read_only_SC0 = cbm.read_only_SC0;
		t.read_only_REQCMD0 = cbm.read_only_REQCMD0;
		t.read_only_REQRESP0 = cbm.read_only_REQRESP0;
		t.read_only_Q0 = cbm.read_only_Q0;
		t.read_only_IFCMD0 = cbm.read_only_IFCMD0;
		t.read_only_IFRESP0 = cbm.read_only_IFRESP0;
		t.read_write_A0 = cbm.read_write_A0;
		t.read_write_SI0 = cbm.read_write_SI0;
		t.read_write_SC0 = cbm.read_write_SC0;
		t.read_write_REQCMD0 = cbm.read_write_REQCMD0;
		t.read_write_REQRESP0 = cbm.read_write_REQRESP0;
		t.read_write_Q0 = cbm.read_write_Q0;
		t.read_write_IFCMD0 = cbm.read_write_IFCMD0;
		t.read_write_IFRESP0 = cbm.read_write_IFRESP0;
		t.read_write_D0 = cbm.read_write_D0;
		t.read_write_OFCMD0 = cbm.read_write_OFCMD0;
		t.read_write_OFRESP0 = cbm.read_write_OFRESP0;
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
		input CLK, RST, read_only_A0, read_only_SI0, read_only_SC0, read_only_REQCMD0, read_only_IFCMD0, read_write_A0, read_write_SI0, read_write_SC0, read_write_REQCMD0, read_write_IFCMD0, read_write_D0, read_write_OFCMD0,
		output read_only_REQRESP0, read_only_Q0, read_only_IFRESP0, read_write_REQRESP0, read_write_Q0, read_write_IFRESP0, read_write_OFRESP0,
		import task wait_for_clock( int n ),
		import task wait_for_reset_inactive() );

	// monitor point of view, synchronous
	modport SYNC_MONITOR( clocking cbm,
		import task monitor( codasip_memory_mem_t_transaction t ),
		import task wait_for_clock( int n ),
		import task wait_for_reset_inactive() );

endinterface: icodasip_memory_mem_t
