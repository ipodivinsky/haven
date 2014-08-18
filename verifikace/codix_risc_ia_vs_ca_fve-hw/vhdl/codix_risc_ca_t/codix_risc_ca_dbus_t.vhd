--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of the 'dbus' interface defined in 'codix_risc_platform_ca_codix_risc'.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity codix_risc_ca_dbus_t is
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
end entity codix_risc_ca_dbus_t;

architecture RTL of codix_risc_ca_dbus_t is
	-- request command constants
	constant CP_RQ_NONE : unsigned(2 downto 0) := "000";
	constant CP_RQ_READ : unsigned(2 downto 0) := "001";
	constant CP_RQ_WRITE : unsigned(2 downto 0) := "010";
	constant CP_RQ_INVALIDATE : unsigned(2 downto 0) := "100";
	constant CP_RQ_FLUSH : unsigned(2 downto 0) := "110";
	constant CP_IF_READ : unsigned(2 downto 0) := "001";
	constant CP_OF_WRITE : unsigned(2 downto 0) := "010";
	-- command response constants
	constant CP_RC_WAIT : unsigned(2 downto 0) := "000";
	constant CP_RC_ACK : unsigned(2 downto 0) := "001";
	constant CP_RC_UNALIGNED : unsigned(2 downto 0) := "100";
	constant CP_RC_OOR : unsigned(2 downto 0) := "101";
	constant CP_RC_ERROR : unsigned(2 downto 0) := "110";


begin
		-- Datapath code
	dbus_A0 <= A0;
	dbus_SI0 <= SI0;
	dbus_SC0 <= SC0;
	Q0 <= dbus_Q0;
	dbus_D0 <= D0;
	dbus_REQCMD0 <= REQCMD0;
	REQRESP0 <= dbus_REQRESP0;
	dbus_IFCMD0 <= IFCMD0;
	IFRESP0 <= dbus_IFRESP0;
	dbus_OFCMD0 <= OFCMD0;
	OFRESP0 <= dbus_OFRESP0;

end architecture RTL;


