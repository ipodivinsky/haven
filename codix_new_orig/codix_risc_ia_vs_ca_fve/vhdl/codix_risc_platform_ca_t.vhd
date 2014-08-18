--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains usage of the CPU, buses, external memories etc. 'codix_risc_platform_ca_t'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_platform_ca_t is
	port (
		CLK : in std_logic;
		RST : in std_logic	);
end entity codix_risc_platform_ca_t;

architecture RTL of codix_risc_platform_ca_t is
	component codasip_memory_mem_t
		port (
			CLK : in std_logic;
			RST : in std_logic;
			read_only_A0 : in std_logic_vector(31 downto 0);
			read_only_IFCMD0 : in std_logic_vector(2 downto 0);
			read_only_IFRESP0 : out std_logic_vector(2 downto 0);
			read_only_Q0 : out std_logic_vector(31 downto 0);
			read_only_REQCMD0 : in std_logic_vector(2 downto 0);
			read_only_REQRESP0 : out std_logic_vector(2 downto 0);
			read_only_SC0 : in std_logic_vector(2 downto 0);
			read_only_SI0 : in std_logic_vector(1 downto 0);
			read_write_A0 : in std_logic_vector(31 downto 0);
			read_write_D0 : in std_logic_vector(31 downto 0);
			read_write_IFCMD0 : in std_logic_vector(2 downto 0);
			read_write_IFRESP0 : out std_logic_vector(2 downto 0);
			read_write_OFCMD0 : in std_logic_vector(2 downto 0);
			read_write_OFRESP0 : out std_logic_vector(2 downto 0);
			read_write_Q0 : out std_logic_vector(31 downto 0);
			read_write_REQCMD0 : in std_logic_vector(2 downto 0);
			read_write_REQRESP0 : out std_logic_vector(2 downto 0);
			read_write_SC0 : in std_logic_vector(2 downto 0);
			read_write_SI0 : in std_logic_vector(1 downto 0)		);
	end component codasip_memory_mem_t;

	component codix_risc_ca_t
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
			port_out_en : out std_logic		);
	end component codix_risc_ca_t;


		-- instances connection signals
	signal codix_risc_ibus_A0_0 : std_logic_vector(31 downto 0);
	signal codix_risc_ibus_SI0_1 : std_logic_vector(1 downto 0);
	signal codix_risc_ibus_SC0_2 : std_logic_vector(2 downto 0);
	signal codix_risc_ibus_REQCMD0_3 : std_logic_vector(2 downto 0);
	signal codix_risc_ibus_REQRESP0_4 : std_logic_vector(2 downto 0);
	signal codix_risc_ibus_Q0_5 : std_logic_vector(31 downto 0);
	signal codix_risc_ibus_IFCMD0_6 : std_logic_vector(2 downto 0);
	signal codix_risc_ibus_IFRESP0_7 : std_logic_vector(2 downto 0);
	signal codix_risc_dbus_A0_8 : std_logic_vector(31 downto 0);
	signal codix_risc_dbus_SI0_9 : std_logic_vector(1 downto 0);
	signal codix_risc_dbus_SC0_10 : std_logic_vector(2 downto 0);
	signal codix_risc_dbus_REQCMD0_11 : std_logic_vector(2 downto 0);
	signal codix_risc_dbus_REQRESP0_12 : std_logic_vector(2 downto 0);
	signal codix_risc_dbus_Q0_13 : std_logic_vector(31 downto 0);
	signal codix_risc_dbus_IFCMD0_14 : std_logic_vector(2 downto 0);
	signal codix_risc_dbus_IFRESP0_15 : std_logic_vector(2 downto 0);
	signal codix_risc_dbus_D0_16 : std_logic_vector(31 downto 0);
	signal codix_risc_dbus_OFCMD0_17 : std_logic_vector(2 downto 0);
	signal codix_risc_dbus_OFRESP0_18 : std_logic_vector(2 downto 0);

begin
	-- child instances inside 'codix_risc_platform_ca' system on chip:
	-- instance of 'mem' memory:
	mem : codasip_memory_mem_t
		port map (
			CLK => CLK,
			RST => RST,
			read_only_A0 => codix_risc_ibus_A0_0,
			read_only_SI0 => codix_risc_ibus_SI0_1,
			read_only_SC0 => codix_risc_ibus_SC0_2,
			read_only_REQCMD0 => codix_risc_ibus_REQCMD0_3,
			read_only_REQRESP0 => codix_risc_ibus_REQRESP0_4,
			read_only_Q0 => codix_risc_ibus_Q0_5,
			read_only_IFCMD0 => codix_risc_ibus_IFCMD0_6,
			read_only_IFRESP0 => codix_risc_ibus_IFRESP0_7,
			read_write_A0 => codix_risc_dbus_A0_8,
			read_write_SI0 => codix_risc_dbus_SI0_9,
			read_write_SC0 => codix_risc_dbus_SC0_10,
			read_write_REQCMD0 => codix_risc_dbus_REQCMD0_11,
			read_write_REQRESP0 => codix_risc_dbus_REQRESP0_12,
			read_write_Q0 => codix_risc_dbus_Q0_13,
			read_write_IFCMD0 => codix_risc_dbus_IFCMD0_14,
			read_write_IFRESP0 => codix_risc_dbus_IFRESP0_15,
			read_write_D0 => codix_risc_dbus_D0_16,
			read_write_OFCMD0 => codix_risc_dbus_OFCMD0_17,
			read_write_OFRESP0 => codix_risc_dbus_OFRESP0_18
		);

	-- instance of 'codix_risc' processor:
	codix_risc : codix_risc_ca_t
		port map (
			RST => RST,
			CLK => CLK,
			irq => '0',
			port_halt => open,
			port_out => open,
			port_out_en => open,
			port_error => open,
			ibus_A0 => codix_risc_ibus_A0_0,
			ibus_SI0 => codix_risc_ibus_SI0_1,
			ibus_SC0 => codix_risc_ibus_SC0_2,
			ibus_REQCMD0 => codix_risc_ibus_REQCMD0_3,
			ibus_REQRESP0 => codix_risc_ibus_REQRESP0_4,
			ibus_Q0 => codix_risc_ibus_Q0_5,
			ibus_IFCMD0 => codix_risc_ibus_IFCMD0_6,
			ibus_IFRESP0 => codix_risc_ibus_IFRESP0_7,
			dbus_A0 => codix_risc_dbus_A0_8,
			dbus_SI0 => codix_risc_dbus_SI0_9,
			dbus_SC0 => codix_risc_dbus_SC0_10,
			dbus_REQCMD0 => codix_risc_dbus_REQCMD0_11,
			dbus_REQRESP0 => codix_risc_dbus_REQRESP0_12,
			dbus_Q0 => codix_risc_dbus_Q0_13,
			dbus_IFCMD0 => codix_risc_dbus_IFCMD0_14,
			dbus_IFRESP0 => codix_risc_dbus_IFRESP0_15,
			dbus_D0 => codix_risc_dbus_D0_16,
			dbus_OFCMD0 => codix_risc_dbus_OFCMD0_17,
			dbus_OFRESP0 => codix_risc_dbus_OFRESP0_18
		);

	-- port mappings for 'codix_risc_platform_ca' system on chip:

end architecture RTL;


