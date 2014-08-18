--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains definition of memory 'codasip_memory_mem_t' type.
--------------------------------------------------------------------------------
-- Memory properties:
    -- size in words: 131072
    -- size in bytes: 524288
    -- memory address width: 19 bits
    -- word width: 32 bits
    -- least addressable unit: 8 bits
    -- read latency: 1
    -- write latency: 1
    -- endianness: little
    -- sub-blocks: yes
    -- number of sub-blocks: 4
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Implements storage for each byte (sub-block)
entity codasip_memory_mem_t_storage_t_byte_t is
	port (
		CLK : in std_logic;
		RST : in std_logic;
		read_only_Q0 : out std_logic_vector(7 downto 0);
		read_only_RA0 : in std_logic_vector(16 downto 0);
		read_only_RE0 : in std_logic;
		read_write_A0 : in std_logic_vector(16 downto 0);
		read_write_CS0 : in std_logic;
		read_write_D0 : in std_logic_vector(7 downto 0);
		read_write_Q0 : out std_logic_vector(7 downto 0);
		read_write_WE0 : in std_logic	);
end entity codasip_memory_mem_t_storage_t_byte_t;

-- synthesis translate_off

-- Use FLI as data storage.
architecture FLI of codasip_memory_mem_t_storage_t_byte_t is
	attribute foreign of FLI: architecture is
		-- <init_fnc> <shared_library> <read_is_synchronous> <byte_bit_width> <size_in_bytes>
		"codasip_fli_memory_init ./libcodasip_fli_memory.so; 1 8 131072";
begin
end architecture FLI;

-- synthesis translate_on

-- Use RTL as data storage.
architecture RTL of codasip_memory_mem_t_storage_t_byte_t is
	type memory_type is array (0 to 131071) of std_logic_vector(0 to 7);

	signal RAM: memory_type;
	-- Reverse function to change bit-order inside byte.
	function reverse( src: std_logic_vector ) return std_logic_vector is
		variable result: std_logic_vector( src'range );
		alias r_src: std_logic_vector( src'reverse_range ) is src;
	begin
		for ii in r_src'range loop
			result(ii) := r_src(ii);
		end loop;
		return result;
	end function;
begin
	process( CLK, read_only_RA0, read_write_D0, read_write_CS0, read_write_WE0, read_write_A0 )
	begin
		if ( rising_edge(CLK) ) then
			if ( read_write_CS0 = '1' ) then
				if ( read_write_WE0 = '1' ) then
					RAM(to_integer(unsigned(read_write_A0))) <= reverse( read_write_D0 );
				end if;
			end if;
			read_only_Q0 <= reverse( RAM(to_integer(unsigned(read_only_RA0))) );
			if (read_write_CS0 = '1' ) then
				read_write_Q0 <= reverse( RAM(to_integer(unsigned(read_write_A0))) );
			end if;
		end if;
	end process;

end architecture RTL;



--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Implements sub-block logic/encapsulation.
entity codasip_memory_mem_t_storage_t is
	port (
		CLK : in std_logic;
		RST : in std_logic;
		read_only_Q0 : out std_logic_vector(31 downto 0);
		read_only_RA0 : in std_logic_vector(18 downto 0);
		read_only_RE0 : in std_logic;
		read_only_RSC0 : in std_logic_vector(2 downto 0);
		read_only_RSI0 : in std_logic_vector(1 downto 0);
		read_write_A0 : in std_logic_vector(18 downto 0);
		read_write_CS0 : in std_logic;
		read_write_D0 : in std_logic_vector(31 downto 0);
		read_write_Q0 : out std_logic_vector(31 downto 0);
		read_write_SC0 : in std_logic_vector(2 downto 0);
		read_write_SI0 : in std_logic_vector(1 downto 0);
		read_write_WE0 : in std_logic	);
end entity codasip_memory_mem_t_storage_t;

architecture RTL of codasip_memory_mem_t_storage_t is
	-- memory storage type for each sub-block
	component codasip_memory_mem_t_storage_t_byte_t
		port (
			CLK : in std_logic;
			RST : in std_logic;
			read_only_Q0 : out std_logic_vector(7 downto 0);
			read_only_RA0 : in std_logic_vector(16 downto 0);
			read_only_RE0 : in std_logic;
			read_write_A0 : in std_logic_vector(16 downto 0);
			read_write_CS0 : in std_logic;
			read_write_D0 : in std_logic_vector(7 downto 0);
			read_write_Q0 : out std_logic_vector(7 downto 0);
			read_write_WE0 : in std_logic		);
	end component codasip_memory_mem_t_storage_t_byte_t;

	-- sub-blocks interconnection signal types
	subtype read_only_RE0_sb_type is std_logic;
	subtype read_only_RA0_sb_type is std_logic_vector(16 downto 0);
	type read_only_Q0_sb_type is array (0 to 3) of std_logic_vector(7 downto 0);
	type read_write_WE0_sb_type is array (0 to 3) of std_logic;
	subtype read_write_A0_sb_type is std_logic_vector(16 downto 0);
	type read_write_D0_sb_type is array (0 to 3) of std_logic_vector(7 downto 0);
	type read_write_Q0_sb_type is array (0 to 3) of std_logic_vector(7 downto 0);
	-- local interconnection signals
	signal read_only_RE0_sb: read_only_RE0_sb_type;
	signal read_only_RA0_sb: read_only_RA0_sb_type;
	signal read_only_Q0_sb: read_only_Q0_sb_type;
	signal read_write_WE0_sb: read_write_WE0_sb_type;
	signal read_write_A0_sb: read_write_A0_sb_type;
	signal read_write_D0_sb: read_write_D0_sb_type;
	signal read_write_Q0_sb: read_write_Q0_sb_type;
	-- local auxiliary signals or registers
	signal read_only_RA0_subblock_operation: std_logic_vector(4 downto 0);
	signal read_only_RA0_subblock_operation_reg: std_logic_vector(4 downto 0);
	signal read_only_RA0_address_base: unsigned(16 downto 0);
	signal read_write_A0_subblock_operation: std_logic_vector(4 downto 0);
	signal read_write_A0_subblock_operation_reg: std_logic_vector(4 downto 0);
	signal read_write_A0_address_base: unsigned(16 downto 0);
begin
	-- byte storage
	subblock : for i in 0 to 3 generate
		data : codasip_memory_mem_t_storage_t_byte_t
			port map(
				CLK => CLK,
				RST => RST,
				read_only_Q0 => read_only_Q0_sb(i),
				read_only_RA0 => read_only_RA0_sb,
				read_only_RE0 => read_only_RE0_sb,
				read_write_A0 => read_write_A0_sb,
				read_write_CS0 => read_write_CS0,
				read_write_D0 => read_write_D0_sb(i),
				read_write_Q0 => read_write_Q0_sb(i),
				read_write_WE0 => read_write_WE0_sb(i)
			);
	end generate;

	-- sub-block control signals
	read_only_RA0_address_base <= resize( unsigned(read_only_RA0(18 downto 2)), read_only_RA0_address_base'length );
	read_only_RA0_subblock_operation <= read_only_RSC0 & read_only_RSI0;
	process( CLK )
	begin
		if ( rising_edge(CLK) ) then
			read_only_RA0_subblock_operation_reg <= read_only_RA0_subblock_operation;
		end if;
	end process;

	-- address signals
	read_only_RA0_sb <= std_logic_vector(read_only_RA0_address_base);
	-- enable signals
	read_only_RE0_sb <= read_only_RE0;
	-- data signals
	with read_only_RA0_subblock_operation_reg select
		read_only_Q0 <= 
			-- address offset: 0, sub-block count: 1, sub-block index: 0
			"000000000000000000000000" & read_only_Q0_sb(0) when "00100",
			-- address offset: 0, sub-block count: 1, sub-block index: 1
			"000000000000000000000000" & read_only_Q0_sb(1) when "00101",
			-- address offset: 0, sub-block count: 1, sub-block index: 2
			"000000000000000000000000" & read_only_Q0_sb(2) when "00110",
			-- address offset: 0, sub-block count: 1, sub-block index: 3
			"000000000000000000000000" & read_only_Q0_sb(3) when "00111",
			-- address offset: 0, sub-block count: 2, sub-block index: 0
			"0000000000000000" & read_only_Q0_sb(1) & read_only_Q0_sb(0) when "01000",
			-- address offset: 0, sub-block count: 2, sub-block index: 1
			"0000000000000000" & read_only_Q0_sb(2) & read_only_Q0_sb(1) when "01001",
			-- address offset: 0, sub-block count: 2, sub-block index: 2
			"0000000000000000" & read_only_Q0_sb(3) & read_only_Q0_sb(2) when "01010",
			-- address offset: 0, sub-block count: 3, sub-block index: 0
			"00000000" & read_only_Q0_sb(2) & read_only_Q0_sb(1) & read_only_Q0_sb(0) when "01100",
			-- address offset: 0, sub-block count: 3, sub-block index: 1
			"00000000" & read_only_Q0_sb(3) & read_only_Q0_sb(2) & read_only_Q0_sb(1) when "01101",
			-- address offset: 0, sub-block count: 4, sub-block index: 0
			read_only_Q0_sb(3) & read_only_Q0_sb(2) & read_only_Q0_sb(1) & read_only_Q0_sb(0) when "10000",
			-- sub-block count: 0, read all zeros
			(others => '0') when others;


	-- sub-block control signals
	read_write_A0_address_base <= resize( unsigned(read_write_A0(18 downto 2)), read_write_A0_address_base'length );
	read_write_A0_subblock_operation <= read_write_SC0 & read_write_SI0;
	process( CLK )
	begin
		if ( rising_edge(CLK) ) then
			read_write_A0_subblock_operation_reg <= read_write_A0_subblock_operation;
		end if;
	end process;

	-- address signals
	read_write_A0_sb <= std_logic_vector(read_write_A0_address_base);
	-- data signals
	with read_write_A0_subblock_operation_reg select
		read_write_Q0 <= 
			-- address offset: 0, sub-block count: 1, sub-block index: 0
			"000000000000000000000000" & read_write_Q0_sb(0) when "00100",
			-- address offset: 0, sub-block count: 1, sub-block index: 1
			"000000000000000000000000" & read_write_Q0_sb(1) when "00101",
			-- address offset: 0, sub-block count: 1, sub-block index: 2
			"000000000000000000000000" & read_write_Q0_sb(2) when "00110",
			-- address offset: 0, sub-block count: 1, sub-block index: 3
			"000000000000000000000000" & read_write_Q0_sb(3) when "00111",
			-- address offset: 0, sub-block count: 2, sub-block index: 0
			"0000000000000000" & read_write_Q0_sb(1) & read_write_Q0_sb(0) when "01000",
			-- address offset: 0, sub-block count: 2, sub-block index: 1
			"0000000000000000" & read_write_Q0_sb(2) & read_write_Q0_sb(1) when "01001",
			-- address offset: 0, sub-block count: 2, sub-block index: 2
			"0000000000000000" & read_write_Q0_sb(3) & read_write_Q0_sb(2) when "01010",
			-- address offset: 0, sub-block count: 3, sub-block index: 0
			"00000000" & read_write_Q0_sb(2) & read_write_Q0_sb(1) & read_write_Q0_sb(0) when "01100",
			-- address offset: 0, sub-block count: 3, sub-block index: 1
			"00000000" & read_write_Q0_sb(3) & read_write_Q0_sb(2) & read_write_Q0_sb(1) when "01101",
			-- address offset: 0, sub-block count: 4, sub-block index: 0
			read_write_Q0_sb(3) & read_write_Q0_sb(2) & read_write_Q0_sb(1) & read_write_Q0_sb(0) when "10000",
			-- sub-block count: 0, read all zeros
			(others => '0') when others;
	-- enable signals
	read_write_WE0_sb(0) <= read_write_WE0 when
		-- address offset: 0, sub-block count: 1, sub-block index: 0
		(read_write_A0_subblock_operation = "00100") or
		-- address offset: 0, sub-block count: 2, sub-block index: 0
		(read_write_A0_subblock_operation = "01000") or
		-- address offset: 0, sub-block count: 3, sub-block index: 0
		(read_write_A0_subblock_operation = "01100") or
		-- address offset: 0, sub-block count: 4, sub-block index: 0
		(read_write_A0_subblock_operation = "10000") else
		-- sub-block count: 0, do not write
		'0';
	read_write_WE0_sb(1) <= read_write_WE0 when
		-- address offset: 0, sub-block count: 1, sub-block index: 1
		(read_write_A0_subblock_operation = "00101") or
		-- address offset: 0, sub-block count: 2, sub-block index: 0
		(read_write_A0_subblock_operation = "01000") or
		-- address offset: 0, sub-block count: 2, sub-block index: 1
		(read_write_A0_subblock_operation = "01001") or
		-- address offset: 0, sub-block count: 3, sub-block index: 0
		(read_write_A0_subblock_operation = "01100") or
		-- address offset: 0, sub-block count: 3, sub-block index: 1
		(read_write_A0_subblock_operation = "01101") or
		-- address offset: 0, sub-block count: 4, sub-block index: 0
		(read_write_A0_subblock_operation = "10000") else
		-- sub-block count: 0, do not write
		'0';
	read_write_WE0_sb(2) <= read_write_WE0 when
		-- address offset: 0, sub-block count: 1, sub-block index: 2
		(read_write_A0_subblock_operation = "00110") or
		-- address offset: 0, sub-block count: 2, sub-block index: 1
		(read_write_A0_subblock_operation = "01001") or
		-- address offset: 0, sub-block count: 2, sub-block index: 2
		(read_write_A0_subblock_operation = "01010") or
		-- address offset: 0, sub-block count: 3, sub-block index: 0
		(read_write_A0_subblock_operation = "01100") or
		-- address offset: 0, sub-block count: 3, sub-block index: 1
		(read_write_A0_subblock_operation = "01101") or
		-- address offset: 0, sub-block count: 4, sub-block index: 0
		(read_write_A0_subblock_operation = "10000") else
		-- sub-block count: 0, do not write
		'0';
	read_write_WE0_sb(3) <= read_write_WE0 when
		-- address offset: 0, sub-block count: 1, sub-block index: 3
		(read_write_A0_subblock_operation = "00111") or
		-- address offset: 0, sub-block count: 2, sub-block index: 2
		(read_write_A0_subblock_operation = "01010") or
		-- address offset: 0, sub-block count: 3, sub-block index: 1
		(read_write_A0_subblock_operation = "01101") or
		-- address offset: 0, sub-block count: 4, sub-block index: 0
		(read_write_A0_subblock_operation = "10000") else
		-- sub-block count: 0, do not write
		'0';
	-- data signals
	with read_write_A0_subblock_operation select
		read_write_D0_sb(0) <=
			-- address offset: 0, sub-block count: 1, sub-block index: 0
			read_write_D0(7 downto 0) when "00100",
			-- address offset: 0, sub-block count: 2, sub-block index: 0
			read_write_D0(7 downto 0) when "01000",
			-- address offset: 0, sub-block count: 3, sub-block index: 0
			read_write_D0(7 downto 0) when "01100",
			-- address offset: 0, sub-block count: 4, sub-block index: 0
			read_write_D0(7 downto 0) when "10000",
			-- sub-block count: 0, do not write
			(others => '0') when others;
	with read_write_A0_subblock_operation select
		read_write_D0_sb(1) <=
			-- address offset: 0, sub-block count: 1, sub-block index: 1
			read_write_D0(7 downto 0) when "00101",
			-- address offset: 0, sub-block count: 2, sub-block index: 0
			read_write_D0(15 downto 8) when "01000",
			-- address offset: 0, sub-block count: 2, sub-block index: 1
			read_write_D0(7 downto 0) when "01001",
			-- address offset: 0, sub-block count: 3, sub-block index: 0
			read_write_D0(15 downto 8) when "01100",
			-- address offset: 0, sub-block count: 3, sub-block index: 1
			read_write_D0(7 downto 0) when "01101",
			-- address offset: 0, sub-block count: 4, sub-block index: 0
			read_write_D0(15 downto 8) when "10000",
			-- sub-block count: 0, do not write
			(others => '0') when others;
	with read_write_A0_subblock_operation select
		read_write_D0_sb(2) <=
			-- address offset: 0, sub-block count: 1, sub-block index: 2
			read_write_D0(7 downto 0) when "00110",
			-- address offset: 0, sub-block count: 2, sub-block index: 1
			read_write_D0(15 downto 8) when "01001",
			-- address offset: 0, sub-block count: 2, sub-block index: 2
			read_write_D0(7 downto 0) when "01010",
			-- address offset: 0, sub-block count: 3, sub-block index: 0
			read_write_D0(23 downto 16) when "01100",
			-- address offset: 0, sub-block count: 3, sub-block index: 1
			read_write_D0(15 downto 8) when "01101",
			-- address offset: 0, sub-block count: 4, sub-block index: 0
			read_write_D0(23 downto 16) when "10000",
			-- sub-block count: 0, do not write
			(others => '0') when others;
	with read_write_A0_subblock_operation select
		read_write_D0_sb(3) <=
			-- address offset: 0, sub-block count: 1, sub-block index: 3
			read_write_D0(7 downto 0) when "00111",
			-- address offset: 0, sub-block count: 2, sub-block index: 2
			read_write_D0(15 downto 8) when "01010",
			-- address offset: 0, sub-block count: 3, sub-block index: 1
			read_write_D0(23 downto 16) when "01101",
			-- address offset: 0, sub-block count: 4, sub-block index: 0
			read_write_D0(31 downto 24) when "10000",
			-- sub-block count: 0, do not write
			(others => '0') when others;
end architecture RTL;



--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Implements request and latency logic/encapsulation.
entity codasip_memory_mem_t is
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
		read_write_SI0 : in std_logic_vector(1 downto 0)	);
end entity codasip_memory_mem_t;

architecture RTL of codasip_memory_mem_t is
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

	component codasip_memory_mem_t_storage_t
		port (
			CLK : in std_logic;
			RST : in std_logic;
			read_only_Q0 : out std_logic_vector(31 downto 0);
			read_only_RA0 : in std_logic_vector(18 downto 0);
			read_only_RE0 : in std_logic;
			read_only_RSC0 : in std_logic_vector(2 downto 0);
			read_only_RSI0 : in std_logic_vector(1 downto 0);
			read_write_A0 : in std_logic_vector(18 downto 0);
			read_write_CS0 : in std_logic;
			read_write_D0 : in std_logic_vector(31 downto 0);
			read_write_Q0 : out std_logic_vector(31 downto 0);
			read_write_SC0 : in std_logic_vector(2 downto 0);
			read_write_SI0 : in std_logic_vector(1 downto 0);
			read_write_WE0 : in std_logic		);
	end component codasip_memory_mem_t_storage_t;

	-- signal (inner)
	signal read_only_REQRESP0_local : std_logic_vector(2 downto 0);
	-- register (standard)
	component d_ff_plain_t
		generic (
			bit_width : natural := 8;
			reset_value : std_logic_vector := "00000000"
		);
		port (
			CLK:    in  std_logic;
			RST:    in  std_logic;
			WE0:    in  std_logic;
			D0:     in  std_logic_vector(bit_width-1 downto 0);
			Q0:     out std_logic_vector(bit_width-1 downto 0)
		);
	end component;
	-- signal (inner)
	signal read_write_REQRESP0_local : std_logic_vector(2 downto 0);
	-- signal (inner)
	signal read_write_OFRESP0_local : std_logic_vector(2 downto 0);

		-- instances connection signals
	signal storage_read_only_RE0 : std_logic;
	signal storage_read_only_RA0 : std_logic_vector(18 downto 0);
	signal storage_read_only_RSI0 : std_logic_vector(1 downto 0);
	signal storage_read_only_RSC0 : std_logic_vector(2 downto 0);
	signal storage_read_only_Q0 : std_logic_vector(31 downto 0);
	signal storage_read_write_CS0 : std_logic;
	signal storage_read_write_WE0 : std_logic;
	signal storage_read_write_A0 : std_logic_vector(18 downto 0);
	signal storage_read_write_SI0 : std_logic_vector(1 downto 0);
	signal storage_read_write_SC0 : std_logic_vector(2 downto 0);
	signal storage_read_write_D0 : std_logic_vector(31 downto 0);
	signal storage_read_write_Q0 : std_logic_vector(31 downto 0);
	signal read_only_IFRESP0_local_Q0 : std_logic_vector(2 downto 0);
	signal read_only_IFRESP0_local_D0 : std_logic_vector(2 downto 0);
	signal read_only_IFRESP0_local_WE0 : std_logic;
	signal read_write_IFRESP0_local_Q0 : std_logic_vector(2 downto 0);
	signal read_write_IFRESP0_local_D0 : std_logic_vector(2 downto 0);
	signal read_write_IFRESP0_local_WE0 : std_logic;

		-- datapath signals and constants
	constant CONSTANT_0_100: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_114: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_121: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_107: unsigned(18 downto 0) := to_unsigned(0, 19);
	constant CONSTANT_0_46: unsigned(31 downto 0) := to_unsigned(0, 32);
	constant CONSTANT_1_97: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_4_64: unsigned(4 downto 0) := to_unsigned(4, 5);
	constant CONSTANT_4_47: unsigned(31 downto 0) := to_unsigned(4, 32);
	constant CONSTANT_524288_56: unsigned(31 downto 0) := to_unsigned(524288, 32);

begin
	-- child instances inside 'mem' memory:
	-- instance of 'storage' memory storage:
	storage : codasip_memory_mem_t_storage_t
		port map (
			CLK => CLK,
			RST => RST,
			read_only_RE0 => storage_read_only_RE0,
			read_only_RA0 => storage_read_only_RA0,
			read_only_RSI0 => storage_read_only_RSI0,
			read_only_RSC0 => storage_read_only_RSC0,
			read_only_Q0 => storage_read_only_Q0,
			read_write_CS0 => storage_read_write_CS0,
			read_write_WE0 => storage_read_write_WE0,
			read_write_A0 => storage_read_write_A0,
			read_write_SI0 => storage_read_write_SI0,
			read_write_SC0 => storage_read_write_SC0,
			read_write_D0 => storage_read_write_D0,
			read_write_Q0 => storage_read_write_Q0
		);

	-- instance of 'read_only_IFRESP0_local' register:
	read_only_IFRESP0_local : d_ff_plain_t
		generic map (
			bit_width => 3,
			reset_value => "000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			Q0 => read_only_IFRESP0_local_Q0,
			D0 => read_only_IFRESP0_local_D0,
			WE0 => read_only_IFRESP0_local_WE0
		);

	-- instance of 'read_write_IFRESP0_local' register:
	read_write_IFRESP0_local : d_ff_plain_t
		generic map (
			bit_width => 3,
			reset_value => "000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			Q0 => read_write_IFRESP0_local_Q0,
			D0 => read_write_IFRESP0_local_D0,
			WE0 => read_write_IFRESP0_local_WE0
		);


		-- Datapath code
	read_only_REQRESP0_local <= std_logic_vector(CP_RC_ERROR) when (not(((unsigned(read_only_REQCMD0) = CP_RQ_READ) or (unsigned(read_only_REQCMD0) = CP_RQ_NONE)))) else 
		std_logic_vector(CP_RC_UNALIGNED) when (((unsigned(read_only_REQCMD0) = CP_RQ_READ) and ((unsigned(read_only_A0) mod CONSTANT_4_47) /= CONSTANT_0_46))) else 
		std_logic_vector(CP_RC_OOR) when (((unsigned(read_only_REQCMD0) = CP_RQ_READ) and (unsigned(read_only_A0) >= CONSTANT_524288_56))) else 
		std_logic_vector(CP_RC_ERROR) when (((unsigned(read_only_REQCMD0) = CP_RQ_READ) and ((unsigned(resize(unsigned(read_only_SI0), 5)) + unsigned(resize(unsigned(read_only_SC0), 5))) > CONSTANT_4_64))) else 
		std_logic_vector(CP_RC_ACK) when ((unsigned(read_only_REQCMD0) = CP_RQ_READ)) else
		std_logic_vector(CP_RC_WAIT);
	read_only_REQRESP0 <= read_only_REQRESP0_local;
	read_only_IFRESP0 <= read_only_IFRESP0_local_Q0;
	read_only_IFRESP0_local_D0 <= std_logic_vector(CP_RC_ACK) when (((unsigned(read_only_REQCMD0) = CP_RQ_READ) and (unsigned(read_only_REQRESP0_local) = CP_RC_ACK))) else
		std_logic_vector(CP_RC_WAIT);
	read_only_IFRESP0_local_WE0 <= CONSTANT_1_97(0);
	storage_read_only_RE0 <= CONSTANT_1_97(0) when ((unsigned(read_only_REQRESP0_local) = CP_RC_ACK)) else
		CONSTANT_0_100(0);
	storage_read_only_RA0 <= read_only_A0(18 downto 0) when ((unsigned(read_only_REQRESP0_local) = CP_RC_ACK)) else
		std_logic_vector(CONSTANT_0_107);
	storage_read_only_RSI0 <= read_only_SI0 when ((unsigned(read_only_REQRESP0_local) = CP_RC_ACK)) else
		std_logic_vector(CONSTANT_0_114);
	storage_read_only_RSC0 <= read_only_SC0 when ((unsigned(read_only_REQRESP0_local) = CP_RC_ACK)) else
		std_logic_vector(CONSTANT_0_121);
	read_only_Q0 <= storage_read_only_Q0 when ((unsigned(read_only_IFRESP0_local_Q0) = CP_RC_ACK)) else
		std_logic_vector(CONSTANT_0_46);
	read_write_REQRESP0_local <= std_logic_vector(CP_RC_ERROR) when (not((((unsigned(read_write_REQCMD0) = CP_RQ_READ) or (unsigned(read_write_REQCMD0) = CP_RQ_WRITE)) or (unsigned(read_write_REQCMD0) = CP_RQ_NONE)))) else 
		std_logic_vector(CP_RC_UNALIGNED) when ((((unsigned(read_write_REQCMD0) = CP_RQ_READ) or (unsigned(read_write_REQCMD0) = CP_RQ_WRITE)) and ((unsigned(read_write_A0) mod CONSTANT_4_47) /= CONSTANT_0_46))) else 
		std_logic_vector(CP_RC_OOR) when ((((unsigned(read_write_REQCMD0) = CP_RQ_READ) or (unsigned(read_write_REQCMD0) = CP_RQ_WRITE)) and (unsigned(read_write_A0) >= CONSTANT_524288_56))) else 
		std_logic_vector(CP_RC_ERROR) when ((((unsigned(read_write_REQCMD0) = CP_RQ_READ) or (unsigned(read_write_REQCMD0) = CP_RQ_WRITE)) and ((unsigned(resize(unsigned(read_write_SI0), 5)) + unsigned(resize(unsigned(read_write_SC0), 5))) > CONSTANT_4_64))) else 
		std_logic_vector(CP_RC_ACK) when (((unsigned(read_write_REQCMD0) = CP_RQ_READ) or (unsigned(read_write_REQCMD0) = CP_RQ_WRITE))) else
		std_logic_vector(CP_RC_WAIT);
	read_write_REQRESP0 <= read_write_REQRESP0_local;
	read_write_IFRESP0 <= read_write_IFRESP0_local_Q0;
	read_write_IFRESP0_local_D0 <= std_logic_vector(CP_RC_ACK) when (((unsigned(read_write_REQCMD0) = CP_RQ_READ) and (unsigned(read_write_REQRESP0_local) = CP_RC_ACK))) else
		std_logic_vector(CP_RC_WAIT);
	read_write_IFRESP0_local_WE0 <= CONSTANT_1_97(0);
	read_write_OFRESP0 <= read_write_OFRESP0_local;
	read_write_OFRESP0_local <= std_logic_vector(CP_RC_ACK) when (((unsigned(read_write_REQCMD0) = CP_RQ_WRITE) and (unsigned(read_write_REQRESP0_local) = CP_RC_ACK))) else
		std_logic_vector(CP_RC_WAIT);
	storage_read_write_CS0 <= CONSTANT_1_97(0) when ((unsigned(read_write_REQRESP0_local) = CP_RC_ACK)) else
		CONSTANT_0_100(0);
	storage_read_write_WE0 <= CONSTANT_1_97(0) when (((unsigned(read_write_REQRESP0_local) = CP_RC_ACK) and (unsigned(read_write_REQCMD0) = CP_RQ_WRITE))) else
		CONSTANT_0_100(0);
	storage_read_write_A0 <= read_write_A0(18 downto 0) when ((unsigned(read_write_REQRESP0_local) = CP_RC_ACK)) else
		std_logic_vector(CONSTANT_0_107);
	storage_read_write_SI0 <= read_write_SI0 when ((unsigned(read_write_REQRESP0_local) = CP_RC_ACK)) else
		std_logic_vector(CONSTANT_0_114);
	storage_read_write_SC0 <= read_write_SC0 when ((unsigned(read_write_REQRESP0_local) = CP_RC_ACK)) else
		std_logic_vector(CONSTANT_0_121);
	storage_read_write_D0 <= read_write_D0 when ((unsigned(read_write_OFRESP0_local) = CP_RC_ACK)) else
		std_logic_vector(CONSTANT_0_46);
	read_write_Q0 <= storage_read_write_Q0 when ((unsigned(read_write_IFRESP0_local_Q0) = CP_RC_ACK)) else
		std_logic_vector(CONSTANT_0_46);

end architecture RTL;


