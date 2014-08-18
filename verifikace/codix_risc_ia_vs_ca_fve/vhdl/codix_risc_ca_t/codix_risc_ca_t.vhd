--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of CPU 'codix_risc_ca_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_t is
	port (
		CLK : in std_logic;
		RST : in std_logic;
		dbus_A0 : out std_logic_vector(31 downto 0);
		dbus_D0 : out std_logic_vector(31 downto 0);
		dbus_IFCMD0 : out std_logic_vector(2 downto 0);
		dbus_IFRESP0 : in std_logic_vector(2 downto 0);
		dbus_OFCMD0 : out std_logic_vector(2 downto 0);
		dbus_OFRESP0 : in std_logic_vector(2 downto 0);
		dbus_Q0 : in std_logic_vector(31 downto 0);
		dbus_REQCMD0 : out std_logic_vector(2 downto 0);
		dbus_REQRESP0 : in std_logic_vector(2 downto 0);
		dbus_SC0 : out std_logic_vector(2 downto 0);
		dbus_SI0 : out std_logic_vector(1 downto 0);
		ibus_A0 : out std_logic_vector(31 downto 0);
		ibus_IFCMD0 : out std_logic_vector(2 downto 0);
		ibus_IFRESP0 : in std_logic_vector(2 downto 0);
		ibus_Q0 : in std_logic_vector(31 downto 0);
		ibus_REQCMD0 : out std_logic_vector(2 downto 0);
		ibus_REQRESP0 : in std_logic_vector(2 downto 0);
		ibus_SC0 : out std_logic_vector(2 downto 0);
		ibus_SI0 : out std_logic_vector(1 downto 0);
		irq : in std_logic;
		port_error : out std_logic_vector(31 downto 0);
		port_halt : out std_logic;
		port_out : out std_logic_vector(31 downto 0);
		port_out_en : out std_logic
	);
end entity codix_risc_ca_t;

architecture RTL of codix_risc_ca_t is
	-- signal (inner)
	signal ERST : std_logic;
	-- signal (inner)
	signal IRST : std_logic;
	-- asip core
	component codix_risc_ca_core_t
		port (
			CLK : in std_logic;
			ERST_Q0_main_reset_fu_semantics_4910 : in std_logic;
			IRST_D0_main_reset_fu_semantics_4912 : out std_logic;
			RST : in std_logic;
			dbus_A0_main_ex2_ex2_controller_semantics_3556 : out std_logic_vector(31 downto 0);
			dbus_D0_main_ex2_ex2_controller_semantics_3754 : out std_logic_vector(31 downto 0);
			dbus_IFCMD0_main_wb_wb_controller_semantics_5362 : out std_logic_vector(2 downto 0);
			dbus_IFRESP0_main_wb_wb_controller_semantics_5372 : in std_logic_vector(2 downto 0);
			dbus_OFCMD0_main_ex2_ex2_controller_semantics_3756 : out std_logic_vector(2 downto 0);
			dbus_OFRESP0_main_ex2_ex2_controller_semantics_3765 : in std_logic_vector(2 downto 0);
			dbus_Q0_main_wb_wb_controller_semantics_5360 : in std_logic_vector(31 downto 0);
			dbus_REQCMD0_main_ex2_ex2_controller_semantics_3552 : out std_logic_vector(2 downto 0);
			dbus_REQRESP0_main_ex2_ex2_controller_semantics_3568 : in std_logic_vector(2 downto 0);
			dbus_SC0_main_ex2_ex2_controller_semantics_3564 : out std_logic_vector(2 downto 0);
			dbus_SI0_main_ex2_ex2_controller_semantics_3560 : out std_logic_vector(1 downto 0);
			ibus_A0_main_fe_fe_controller_semantics_4111 : out std_logic_vector(31 downto 0);
			ibus_IFCMD0_main_id_id_controller_semantics_4422 : out std_logic_vector(2 downto 0);
			ibus_IFRESP0_main_id_id_controller_semantics_4430 : in std_logic_vector(2 downto 0);
			ibus_Q0_main_id_id_controller_semantics_4420 : in std_logic_vector(31 downto 0);
			ibus_REQCMD0_main_fe_fe_controller_semantics_4107 : out std_logic_vector(2 downto 0);
			ibus_REQRESP0_main_fe_fe_controller_semantics_4123 : in std_logic_vector(2 downto 0);
			ibus_SC0_main_fe_fe_controller_semantics_4119 : out std_logic_vector(2 downto 0);
			ibus_SI0_main_fe_fe_controller_semantics_4115 : out std_logic_vector(1 downto 0);
			irq_Q0_main_id_id_controller_semantics_4411 : in std_logic;
			port_error_D0_main_ex2_ex2_controller_semantics_3619 : out std_logic_vector(31 downto 0);
			port_error_D0_main_fe_fe_controller_semantics_4155 : out std_logic_vector(31 downto 0);
			port_error_D0_main_id_id_controller_semantics_4454 : out std_logic_vector(31 downto 0);
			port_error_D0_main_wb_wb_controller_semantics_5420 : out std_logic_vector(31 downto 0);
			port_halt_D0_main_wb_output_wb_output_fu_semantics_5340 : out std_logic;
			port_out_D0_main_wb_output_wb_output_fu_semantics_5310 : out std_logic_vector(31 downto 0);
			port_out_en_D0_main_wb_output_wb_output_fu_semantics_5318 : out std_logic
		);
	end component codix_risc_ca_core_t;

	-- interface (CodAL)
	component codix_risc_ca_ibus_t
		port (
			A0 : in std_logic_vector(31 downto 0);
			IFCMD0 : in std_logic_vector(2 downto 0);
			IFRESP0 : out std_logic_vector(2 downto 0);
			Q0 : out std_logic_vector(31 downto 0);
			REQCMD0 : in std_logic_vector(2 downto 0);
			REQRESP0 : out std_logic_vector(2 downto 0);
			SC0 : in std_logic_vector(2 downto 0);
			SI0 : in std_logic_vector(1 downto 0);
			ibus_A0 : out std_logic_vector(31 downto 0);
			ibus_IFCMD0 : out std_logic_vector(2 downto 0);
			ibus_IFRESP0 : in std_logic_vector(2 downto 0);
			ibus_Q0 : in std_logic_vector(31 downto 0);
			ibus_REQCMD0 : out std_logic_vector(2 downto 0);
			ibus_REQRESP0 : in std_logic_vector(2 downto 0);
			ibus_SC0 : out std_logic_vector(2 downto 0);
			ibus_SI0 : out std_logic_vector(1 downto 0)
		);
	end component codix_risc_ca_ibus_t;

	-- interface (CodAL)
	component codix_risc_ca_dbus_t
		port (
			A0 : in std_logic_vector(31 downto 0);
			D0 : in std_logic_vector(31 downto 0);
			IFCMD0 : in std_logic_vector(2 downto 0);
			IFRESP0 : out std_logic_vector(2 downto 0);
			OFCMD0 : in std_logic_vector(2 downto 0);
			OFRESP0 : out std_logic_vector(2 downto 0);
			Q0 : out std_logic_vector(31 downto 0);
			REQCMD0 : in std_logic_vector(2 downto 0);
			REQRESP0 : out std_logic_vector(2 downto 0);
			SC0 : in std_logic_vector(2 downto 0);
			SI0 : in std_logic_vector(1 downto 0);
			dbus_A0 : out std_logic_vector(31 downto 0);
			dbus_D0 : out std_logic_vector(31 downto 0);
			dbus_IFCMD0 : out std_logic_vector(2 downto 0);
			dbus_IFRESP0 : in std_logic_vector(2 downto 0);
			dbus_OFCMD0 : out std_logic_vector(2 downto 0);
			dbus_OFRESP0 : in std_logic_vector(2 downto 0);
			dbus_Q0 : in std_logic_vector(31 downto 0);
			dbus_REQCMD0 : out std_logic_vector(2 downto 0);
			dbus_REQRESP0 : in std_logic_vector(2 downto 0);
			dbus_SC0 : out std_logic_vector(2 downto 0);
			dbus_SI0 : out std_logic_vector(1 downto 0)
		);
	end component codix_risc_ca_dbus_t;


		-- instances connection signals
	signal core_ERST_Q0_main_reset_fu_semantics_4910_0 : std_logic;
	signal core_RST_1 : std_logic;
	signal core_IRST_D0_main_reset_fu_semantics_4912_2 : std_logic;
	signal dbus_REQCMD0_3 : std_logic_vector(2 downto 0);
	signal dbus_A0_4 : std_logic_vector(31 downto 0);
	signal dbus_SI0_5 : std_logic_vector(1 downto 0);
	signal dbus_SC0_6 : std_logic_vector(2 downto 0);
	signal dbus_REQRESP0_7 : std_logic_vector(2 downto 0);
	signal port_error_D0_8 : std_logic_vector(31 downto 0);
	signal dbus_D0_9 : std_logic_vector(31 downto 0);
	signal dbus_OFCMD0_10 : std_logic_vector(2 downto 0);
	signal dbus_OFRESP0_11 : std_logic_vector(2 downto 0);
	signal ibus_REQCMD0_12 : std_logic_vector(2 downto 0);
	signal ibus_A0_13 : std_logic_vector(31 downto 0);
	signal ibus_SI0_14 : std_logic_vector(1 downto 0);
	signal ibus_SC0_15 : std_logic_vector(2 downto 0);
	signal ibus_REQRESP0_16 : std_logic_vector(2 downto 0);
	signal port_error_D0_17 : std_logic_vector(31 downto 0);
	signal irq_Q0_18 : std_logic;
	signal ibus_Q0_19 : std_logic_vector(31 downto 0);
	signal ibus_IFCMD0_20 : std_logic_vector(2 downto 0);
	signal ibus_IFRESP0_21 : std_logic_vector(2 downto 0);
	signal port_error_D0_22 : std_logic_vector(31 downto 0);
	signal port_out_D0_23 : std_logic_vector(31 downto 0);
	signal port_out_en_D0_24 : std_logic;
	signal port_halt_D0_25 : std_logic;
	signal dbus_Q0_26 : std_logic_vector(31 downto 0);
	signal dbus_IFCMD0_27 : std_logic_vector(2 downto 0);
	signal dbus_IFRESP0_28 : std_logic_vector(2 downto 0);
	signal port_error_D0_29 : std_logic_vector(31 downto 0);
	signal codix_risc_ibus_A0_30 : std_logic_vector(31 downto 0);
	signal codix_risc_ibus_SI0_31 : std_logic_vector(1 downto 0);
	signal codix_risc_ibus_SC0_32 : std_logic_vector(2 downto 0);
	signal codix_risc_ibus_REQCMD0_33 : std_logic_vector(2 downto 0);
	signal codix_risc_ibus_REQRESP0_34 : std_logic_vector(2 downto 0);
	signal codix_risc_ibus_Q0_35 : std_logic_vector(31 downto 0);
	signal codix_risc_ibus_IFCMD0_36 : std_logic_vector(2 downto 0);
	signal codix_risc_ibus_IFRESP0_37 : std_logic_vector(2 downto 0);
	signal codix_risc_dbus_A0_38 : std_logic_vector(31 downto 0);
	signal codix_risc_dbus_SI0_39 : std_logic_vector(1 downto 0);
	signal codix_risc_dbus_SC0_40 : std_logic_vector(2 downto 0);
	signal codix_risc_dbus_REQCMD0_41 : std_logic_vector(2 downto 0);
	signal codix_risc_dbus_REQRESP0_42 : std_logic_vector(2 downto 0);
	signal codix_risc_dbus_Q0_43 : std_logic_vector(31 downto 0);
	signal codix_risc_dbus_IFCMD0_44 : std_logic_vector(2 downto 0);
	signal codix_risc_dbus_IFRESP0_45 : std_logic_vector(2 downto 0);
	signal codix_risc_dbus_D0_46 : std_logic_vector(31 downto 0);
	signal codix_risc_dbus_OFCMD0_47 : std_logic_vector(2 downto 0);
	signal codix_risc_dbus_OFRESP0_48 : std_logic_vector(2 downto 0);

begin
	-- child instances inside 'codix_risc' processor:
	-- instance of 'ERST' signal:
	core_ERST_Q0_main_reset_fu_semantics_4910_0 <= ERST;

	ERST <= RST;

	-- instance of 'IRST' signal:
	core_RST_1 <= IRST;

	IRST <= core_IRST_D0_main_reset_fu_semantics_4912_2;

	-- instance of 'core' CPU core:
	core : codix_risc_ca_core_t
		port map (
			RST => core_RST_1,
			CLK => CLK,
			dbus_REQCMD0_main_ex2_ex2_controller_semantics_3552 => dbus_REQCMD0_3,
			dbus_A0_main_ex2_ex2_controller_semantics_3556 => dbus_A0_4,
			dbus_SI0_main_ex2_ex2_controller_semantics_3560 => dbus_SI0_5,
			dbus_SC0_main_ex2_ex2_controller_semantics_3564 => dbus_SC0_6,
			dbus_REQRESP0_main_ex2_ex2_controller_semantics_3568 => dbus_REQRESP0_7,
			port_error_D0_main_ex2_ex2_controller_semantics_3619 => port_error_D0_8,
			dbus_D0_main_ex2_ex2_controller_semantics_3754 => dbus_D0_9,
			dbus_OFCMD0_main_ex2_ex2_controller_semantics_3756 => dbus_OFCMD0_10,
			dbus_OFRESP0_main_ex2_ex2_controller_semantics_3765 => dbus_OFRESP0_11,
			ibus_REQCMD0_main_fe_fe_controller_semantics_4107 => ibus_REQCMD0_12,
			ibus_A0_main_fe_fe_controller_semantics_4111 => ibus_A0_13,
			ibus_SI0_main_fe_fe_controller_semantics_4115 => ibus_SI0_14,
			ibus_SC0_main_fe_fe_controller_semantics_4119 => ibus_SC0_15,
			ibus_REQRESP0_main_fe_fe_controller_semantics_4123 => ibus_REQRESP0_16,
			port_error_D0_main_fe_fe_controller_semantics_4155 => port_error_D0_17,
			irq_Q0_main_id_id_controller_semantics_4411 => irq_Q0_18,
			ibus_Q0_main_id_id_controller_semantics_4420 => ibus_Q0_19,
			ibus_IFCMD0_main_id_id_controller_semantics_4422 => ibus_IFCMD0_20,
			ibus_IFRESP0_main_id_id_controller_semantics_4430 => ibus_IFRESP0_21,
			port_error_D0_main_id_id_controller_semantics_4454 => port_error_D0_22,
			ERST_Q0_main_reset_fu_semantics_4910 => core_ERST_Q0_main_reset_fu_semantics_4910_0,
			IRST_D0_main_reset_fu_semantics_4912 => core_IRST_D0_main_reset_fu_semantics_4912_2,
			port_out_D0_main_wb_output_wb_output_fu_semantics_5310 => port_out_D0_23,
			port_out_en_D0_main_wb_output_wb_output_fu_semantics_5318 => port_out_en_D0_24,
			port_halt_D0_main_wb_output_wb_output_fu_semantics_5340 => port_halt_D0_25,
			dbus_Q0_main_wb_wb_controller_semantics_5360 => dbus_Q0_26,
			dbus_IFCMD0_main_wb_wb_controller_semantics_5362 => dbus_IFCMD0_27,
			dbus_IFRESP0_main_wb_wb_controller_semantics_5372 => dbus_IFRESP0_28,
			port_error_D0_main_wb_wb_controller_semantics_5420 => port_error_D0_29
		);

	-- port mappings for CodAL port instance irq:
	irq_Q0_18 <= irq;
	-- port mappings for CodAL port instance port_halt:
	port_halt <= port_halt_D0_25;
	-- port mappings for CodAL port instance port_out:
	port_out <= port_out_D0_23;
	-- port mappings for CodAL port instance port_out_en:
	port_out_en <= port_out_en_D0_24;
	-- port mappings for CodAL port instance port_error:
	port_error <= port_error_D0_17 or
		port_error_D0_22 or
		port_error_D0_29 or
		port_error_D0_8;
	-- instance of 'ibus' interface:
	ibus : codix_risc_ca_ibus_t
		port map (
			A0 => ibus_A0_13,
			ibus_A0 => codix_risc_ibus_A0_30,
			SI0 => ibus_SI0_14,
			ibus_SI0 => codix_risc_ibus_SI0_31,
			SC0 => ibus_SC0_15,
			ibus_SC0 => codix_risc_ibus_SC0_32,
			ibus_REQCMD0 => codix_risc_ibus_REQCMD0_33,
			ibus_REQRESP0 => codix_risc_ibus_REQRESP0_34,
			Q0 => ibus_Q0_19,
			ibus_Q0 => codix_risc_ibus_Q0_35,
			ibus_IFCMD0 => codix_risc_ibus_IFCMD0_36,
			ibus_IFRESP0 => codix_risc_ibus_IFRESP0_37,
			REQCMD0 => ibus_REQCMD0_12,
			REQRESP0 => ibus_REQRESP0_16,
			IFCMD0 => ibus_IFCMD0_20,
			IFRESP0 => ibus_IFRESP0_21
		);

	-- instance of 'dbus' interface:
	dbus : codix_risc_ca_dbus_t
		port map (
			A0 => dbus_A0_4,
			dbus_A0 => codix_risc_dbus_A0_38,
			SI0 => dbus_SI0_5,
			dbus_SI0 => codix_risc_dbus_SI0_39,
			SC0 => dbus_SC0_6,
			dbus_SC0 => codix_risc_dbus_SC0_40,
			dbus_REQCMD0 => codix_risc_dbus_REQCMD0_41,
			dbus_REQRESP0 => codix_risc_dbus_REQRESP0_42,
			Q0 => dbus_Q0_26,
			dbus_Q0 => codix_risc_dbus_Q0_43,
			dbus_IFCMD0 => codix_risc_dbus_IFCMD0_44,
			dbus_IFRESP0 => codix_risc_dbus_IFRESP0_45,
			D0 => dbus_D0_9,
			dbus_D0 => codix_risc_dbus_D0_46,
			dbus_OFCMD0 => codix_risc_dbus_OFCMD0_47,
			dbus_OFRESP0 => codix_risc_dbus_OFRESP0_48,
			REQCMD0 => dbus_REQCMD0_3,
			REQRESP0 => dbus_REQRESP0_7,
			OFCMD0 => dbus_OFCMD0_10,
			OFRESP0 => dbus_OFRESP0_11,
			IFCMD0 => dbus_IFCMD0_27,
			IFRESP0 => dbus_IFRESP0_28
		);

	-- port mappings for 'codix_risc' processor:
	ibus_A0 <= codix_risc_ibus_A0_30;
	ibus_SI0 <= codix_risc_ibus_SI0_31;
	ibus_SC0 <= codix_risc_ibus_SC0_32;
	ibus_REQCMD0 <= codix_risc_ibus_REQCMD0_33;
	codix_risc_ibus_REQRESP0_34 <= ibus_REQRESP0;
	codix_risc_ibus_Q0_35 <= ibus_Q0;
	ibus_IFCMD0 <= codix_risc_ibus_IFCMD0_36;
	codix_risc_ibus_IFRESP0_37 <= ibus_IFRESP0;
	dbus_A0 <= codix_risc_dbus_A0_38;
	dbus_SI0 <= codix_risc_dbus_SI0_39;
	dbus_SC0 <= codix_risc_dbus_SC0_40;
	dbus_REQCMD0 <= codix_risc_dbus_REQCMD0_41;
	codix_risc_dbus_REQRESP0_42 <= dbus_REQRESP0;
	codix_risc_dbus_Q0_43 <= dbus_Q0;
	dbus_IFCMD0 <= codix_risc_dbus_IFCMD0_44;
	codix_risc_dbus_IFRESP0_45 <= dbus_IFRESP0;
	dbus_D0 <= codix_risc_dbus_D0_46;
	dbus_OFCMD0 <= codix_risc_dbus_OFCMD0_47;
	codix_risc_dbus_OFRESP0_48 <= dbus_OFRESP0;

end architecture RTL;


