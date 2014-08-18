/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Sat Jul 19 17:47:35 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codix_risc_ca_t_sequence'.
 */

// This class represents UVM sequence of random input transactions for DUT/DUV.
class codix_risc_ca_t_sequence extends uvm_sequence #(codix_risc_ca_t_transaction);

	// registration of object tools
	`uvm_object_utils( codix_risc_ca_t_sequence )

	// member attributes, equivalent with interface ports
	rand logic default_irq;
	rand logic [2:0] default_ibus_REQRESP0;
	rand logic [31:0] default_ibus_Q0;
	rand logic [2:0] default_ibus_IFRESP0;
	rand logic [2:0] default_dbus_REQRESP0;
	rand logic [31:0] default_dbus_Q0;
	rand logic [2:0] default_dbus_IFRESP0;
	rand logic [2:0] default_dbus_OFRESP0;

	// default constrains for each input interface port
	constraint default_constraint_for_irq
	{
		default_irq == 0;
	}
	constraint default_constraint_for_ibus_REQRESP0
	{
		default_ibus_REQRESP0 == 0;
	}
	constraint default_constraint_for_ibus_Q0
	{
		default_ibus_Q0 == 0;
	}
	constraint default_constraint_for_ibus_IFRESP0
	{
		default_ibus_IFRESP0 == 0;
	}
	constraint default_constraint_for_dbus_REQRESP0
	{
		default_dbus_REQRESP0 == 0;
	}
	constraint default_constraint_for_dbus_Q0
	{
		default_dbus_Q0 == 0;
	}
	constraint default_constraint_for_dbus_IFRESP0
	{
		default_dbus_IFRESP0 == 0;
	}
	constraint default_constraint_for_dbus_OFRESP0
	{
		default_dbus_OFRESP0 == 0;
	}

	// Constructor - creates new instance of this class
	function new( string name = "codix_risc_ca_t_sequence" );
		super.new( name );
	endfunction: new

	// body - implements behavior of the sequence (unidirectional)
	task body();
		codix_risc_ca_t_transaction item;
		// initialize PRNG
		this.srandom( SEED );
		repeat ( TRANSACTION_COUNT ) begin
			if ( !this.randomize() ) begin
				`uvm_error( "body:", "Failed to randomize!" )
			end
			// create item using the factory
			item = codix_risc_ca_t_transaction::type_id::create( "item" );
			// blocks until the sequencer grants the sequence access to the driver
			start_item( item );
			// prepare item to be used (assign randomized data)
			item.irq = default_irq;
			item.ibus_REQRESP0 = default_ibus_REQRESP0;
			item.ibus_Q0 = default_ibus_Q0;
			item.ibus_IFRESP0 = default_ibus_IFRESP0;
			item.dbus_REQRESP0 = default_dbus_REQRESP0;
			item.dbus_Q0 = default_dbus_Q0;
			item.dbus_IFRESP0 = default_dbus_IFRESP0;
			item.dbus_OFRESP0 = default_dbus_OFRESP0;
			// block until the driver has completed its side of the transfer protocol
			finish_item( item );
		end
	endtask: body

endclass: codix_risc_ca_t_sequence

