/******************************************************************************
 *     "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"              *
 ******************************************************************************/
/**
 *  \file
 *  \date   Sat Jul 19 17:47:35 2014
 *  \author Codasip HW generator v2.2.0.internal
 *  \brief  Definition of the class 'codix_risc_ca_t_coverage'.
 */

// This class measures exercised combinations of CPUs interface ports.
class codix_risc_ca_t_coverage extends uvm_subscriber #(codix_risc_ca_t_transaction);

	// registration of component tools
	`uvm_component_utils( codix_risc_ca_t_coverage )

	// member attributes
	// holds current values of interface pins
	local codix_risc_ca_t_transaction m_transaction_h;

	// Covergroup definition
	covergroup FunctionalCoverage;

		cvp_ibus_A0 : coverpoint m_transaction_h.ibus_A0 {
			option.auto_bin_max = 32;
		}

		cvp_ibus_SI0 : coverpoint m_transaction_h.ibus_SI0 {
			// legal values
			bins sbi[] = {[0:3]};
		}

		cvp_ibus_SC0 : coverpoint m_transaction_h.ibus_SC0 {
			// legal values
			bins sbc[] = {[1:4]};
			ignore_bins zero_access = {0};
			// illegal values
			illegal_bins illegal_sbc[] = default;
		}

		cvp_ibus_REQCMD0 : coverpoint m_transaction_h.ibus_REQCMD0 {
			// legal values
			bins CP_RQ_READ          = {CP_RQ_READ};
			bins CP_RQ_WRITE         = {CP_RQ_WRITE};
			bins CP_RQ_INVALIDATE    = {CP_RQ_INVALIDATE};
			bins CP_RQ_FLUSH         = {CP_RQ_FLUSH};
			// ignore no request
			ignore_bins CP_RQ_NONE   = {CP_RQ_NONE};
			illegal_bins RESERVED[]  = default;
		}

		cvp_ibus_REQRESP0 : coverpoint m_transaction_h.ibus_REQRESP0 {
			// legal values
			bins CP_RC_ACK           = {CP_RC_ACK};
			ignore_bins CP_RC_WAIT   = {CP_RC_WAIT};
			// errors codes
			ignore_bins CP_RC_UNALIGNED  = {CP_RC_UNALIGNED};
			ignore_bins CP_RC_OOR    = {CP_RC_OOR};
			ignore_bins CP_RC_ERROR  = {CP_RC_ERROR};
			illegal_bins RESERVED[]  = default;
			option.weight            = 0;
		}

		cvp_ibus_IFCMD0 : coverpoint m_transaction_h.ibus_IFCMD0 {
			// legal values
			bins CP_IF_READ          = {CP_IF_READ};
			ignore_bins CP_RQ_NONE   = {CP_RQ_NONE};
			illegal_bins RESERVED[]  = default;
		}

		cvp_ibus_IFRESP0 : coverpoint m_transaction_h.ibus_IFRESP0 {
			// legal values
			bins CP_RC_ACK           = {CP_RC_ACK};
			ignore_bins CP_RC_WAIT   = {CP_RC_WAIT};
			// errors codes
			ignore_bins CP_RC_UNALIGNED  = {CP_RC_UNALIGNED};
			ignore_bins CP_RC_OOR    = {CP_RC_OOR};
			ignore_bins CP_RC_ERROR  = {CP_RC_ERROR};
			illegal_bins RESERVED[]  = default;
			option.weight            = 0;
		}

		cvp_dbus_A0 : coverpoint m_transaction_h.dbus_A0 {
			option.auto_bin_max = 32;
		}

		cvp_dbus_SI0 : coverpoint m_transaction_h.dbus_SI0 {
			// legal values
			bins sbi[] = {[0:3]};
		}

		cvp_dbus_SC0 : coverpoint m_transaction_h.dbus_SC0 {
			// legal values
			bins sbc[] = {[1:4]};
			ignore_bins zero_access = {0};
			// illegal values
			illegal_bins illegal_sbc[] = default;
		}

		cvp_dbus_REQCMD0 : coverpoint m_transaction_h.dbus_REQCMD0 {
			// legal values
			bins CP_RQ_READ          = {CP_RQ_READ};
			bins CP_RQ_WRITE         = {CP_RQ_WRITE};
			bins CP_RQ_INVALIDATE    = {CP_RQ_INVALIDATE};
			bins CP_RQ_FLUSH         = {CP_RQ_FLUSH};
			// ignore no request
			ignore_bins CP_RQ_NONE   = {CP_RQ_NONE};
			illegal_bins RESERVED[]  = default;
		}

		cvp_dbus_REQRESP0 : coverpoint m_transaction_h.dbus_REQRESP0 {
			// legal values
			bins CP_RC_ACK           = {CP_RC_ACK};
			ignore_bins CP_RC_WAIT   = {CP_RC_WAIT};
			// errors codes
			ignore_bins CP_RC_UNALIGNED  = {CP_RC_UNALIGNED};
			ignore_bins CP_RC_OOR    = {CP_RC_OOR};
			ignore_bins CP_RC_ERROR  = {CP_RC_ERROR};
			illegal_bins RESERVED[]  = default;
			option.weight            = 0;
		}

		cvp_dbus_IFCMD0 : coverpoint m_transaction_h.dbus_IFCMD0 {
			// legal values
			bins CP_IF_READ          = {CP_IF_READ};
			ignore_bins CP_RQ_NONE   = {CP_RQ_NONE};
			illegal_bins RESERVED[]  = default;
		}

		cvp_dbus_IFRESP0 : coverpoint m_transaction_h.dbus_IFRESP0 {
			// legal values
			bins CP_RC_ACK           = {CP_RC_ACK};
			ignore_bins CP_RC_WAIT   = {CP_RC_WAIT};
			// errors codes
			ignore_bins CP_RC_UNALIGNED  = {CP_RC_UNALIGNED};
			ignore_bins CP_RC_OOR    = {CP_RC_OOR};
			ignore_bins CP_RC_ERROR  = {CP_RC_ERROR};
			illegal_bins RESERVED[]  = default;
			option.weight            = 0;
		}

		cvp_dbus_OFCMD0 : coverpoint m_transaction_h.dbus_OFCMD0 {
			// legal values
			bins CP_OF_WRITE         = {CP_OF_WRITE};
			ignore_bins CP_RQ_NONE   = {CP_RQ_NONE};
			illegal_bins RESERVED[]  = default;
		}

		cvp_dbus_OFRESP0 : coverpoint m_transaction_h.dbus_OFRESP0 {
			// legal values
			bins CP_RC_ACK           = {CP_RC_ACK};
			ignore_bins CP_RC_WAIT   = {CP_RC_WAIT};
			// errors codes
			ignore_bins CP_RC_UNALIGNED  = {CP_RC_UNALIGNED};
			ignore_bins CP_RC_OOR    = {CP_RC_OOR};
			ignore_bins CP_RC_ERROR  = {CP_RC_ERROR};
			illegal_bins RESERVED[]  = default;
			option.weight            = 0;
		}

		cvp_ibus_REQCMD0_acknowledged: cross cvp_ibus_REQCMD0, cvp_ibus_REQRESP0;

		cvp_ibus_A0_requested: cross cvp_ibus_A0, cvp_ibus_REQCMD0;

		cvp_ibus_A0_acknowledged: cross cvp_ibus_A0, cvp_ibus_REQRESP0;

		cvp_ibus_SC0_requested: cross cvp_ibus_SI0, cvp_ibus_SC0, cvp_ibus_REQCMD0 {
			// ignore values when enable sub-blocks are not relevant
			ignore_bins ignored_values = binsof(cvp_ibus_REQCMD0.CP_RQ_INVALIDATE) || binsof(cvp_ibus_REQCMD0.CP_RQ_FLUSH);
			// illegal combinations of sub-block index and count
			illegal_bins illegal_sbi_1_sbc_4 = binsof(cvp_ibus_SI0) intersect {1} && binsof(cvp_ibus_SC0) intersect {[4:$]};
			illegal_bins illegal_sbi_2_sbc_3 = binsof(cvp_ibus_SI0) intersect {2} && binsof(cvp_ibus_SC0) intersect {[3:$]};
			illegal_bins illegal_sbi_3_sbc_2 = binsof(cvp_ibus_SI0) intersect {3} && binsof(cvp_ibus_SC0) intersect {[2:$]};
		}

		cvp_ibus_SC0_requested_acknowledged: cross cvp_ibus_SI0, cvp_ibus_SC0, cvp_ibus_REQCMD0, cvp_ibus_REQRESP0 {
			// ignore values when enable sub-blocks are not relevant
			ignore_bins ignored_values = binsof(cvp_ibus_REQCMD0.CP_RQ_INVALIDATE) || binsof(cvp_ibus_REQCMD0.CP_RQ_FLUSH);
			// illegal combinations of sub-block index and count
			illegal_bins illegal_sbi_1_sbc_4 = binsof(cvp_ibus_SI0) intersect {1} && binsof(cvp_ibus_SC0) intersect {[4:$]};
			illegal_bins illegal_sbi_2_sbc_3 = binsof(cvp_ibus_SI0) intersect {2} && binsof(cvp_ibus_SC0) intersect {[3:$]};
			illegal_bins illegal_sbi_3_sbc_2 = binsof(cvp_ibus_SI0) intersect {3} && binsof(cvp_ibus_SC0) intersect {[2:$]};
		}

		cvp_dbus_REQCMD0_acknowledged: cross cvp_dbus_REQCMD0, cvp_dbus_REQRESP0;

		cvp_dbus_A0_requested: cross cvp_dbus_A0, cvp_dbus_REQCMD0;

		cvp_dbus_A0_acknowledged: cross cvp_dbus_A0, cvp_dbus_REQRESP0;

		cvp_dbus_SC0_requested: cross cvp_dbus_SI0, cvp_dbus_SC0, cvp_dbus_REQCMD0 {
			// ignore values when enable sub-blocks are not relevant
			ignore_bins ignored_values = binsof(cvp_dbus_REQCMD0.CP_RQ_INVALIDATE) || binsof(cvp_dbus_REQCMD0.CP_RQ_FLUSH);
			// illegal combinations of sub-block index and count
			illegal_bins illegal_sbi_1_sbc_4 = binsof(cvp_dbus_SI0) intersect {1} && binsof(cvp_dbus_SC0) intersect {[4:$]};
			illegal_bins illegal_sbi_2_sbc_3 = binsof(cvp_dbus_SI0) intersect {2} && binsof(cvp_dbus_SC0) intersect {[3:$]};
			illegal_bins illegal_sbi_3_sbc_2 = binsof(cvp_dbus_SI0) intersect {3} && binsof(cvp_dbus_SC0) intersect {[2:$]};
		}

		cvp_dbus_SC0_requested_acknowledged: cross cvp_dbus_SI0, cvp_dbus_SC0, cvp_dbus_REQCMD0, cvp_dbus_REQRESP0 {
			// ignore values when enable sub-blocks are not relevant
			ignore_bins ignored_values = binsof(cvp_dbus_REQCMD0.CP_RQ_INVALIDATE) || binsof(cvp_dbus_REQCMD0.CP_RQ_FLUSH);
			// illegal combinations of sub-block index and count
			illegal_bins illegal_sbi_1_sbc_4 = binsof(cvp_dbus_SI0) intersect {1} && binsof(cvp_dbus_SC0) intersect {[4:$]};
			illegal_bins illegal_sbi_2_sbc_3 = binsof(cvp_dbus_SI0) intersect {2} && binsof(cvp_dbus_SC0) intersect {[3:$]};
			illegal_bins illegal_sbi_3_sbc_2 = binsof(cvp_dbus_SI0) intersect {3} && binsof(cvp_dbus_SC0) intersect {[2:$]};
		}

		// per instance statistics
		option.detect_overlap = 1;
		option.per_instance = 1;
	endgroup

	// Constructor - creates new instance of this class
	function new( string name = "m_coverage_h", uvm_component parent = null );
		super.new( name, parent );
		FunctionalCoverage = new();
	endfunction: new

	// Build - instantiates child components
	function void build_phase( uvm_phase phase );
		super.build_phase( phase );
	endfunction: build_phase

	// Write - obligatory function, samples value on the interface.
	function void write( codix_risc_ca_t_transaction t );
		// skip invalid transactions
		if ( t.is_valid() ) begin
			m_transaction_h = t;
			FunctionalCoverage.sample();
		end
	endfunction: write

endclass: codix_risc_ca_t_coverage

