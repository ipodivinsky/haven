--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
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
    -- unaligned access: no
    -- sub-blocks: yes
    -- number of sub-blocks: 4
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Implements memory data storage.
entity codasip_memory_mem_t_storage_subblock0_t is
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
		read_write_WE0 : in std_logic
	);
end entity codasip_memory_mem_t_storage_subblock0_t;

-- synthesis translate_off

-- Use FLI as data storage.
architecture FLI of codasip_memory_mem_t_storage_subblock0_t is
	attribute foreign of FLI: architecture is
		-- <init_fnc> <shared_library> <read_is_synchronous> <byte_bit_width> <size_in_bytes>
		"codasip_fli_memory_init ./libcodasip_fli_memory.so; 1 8 131072";
begin
end architecture FLI;

-- synthesis translate_on

-- Use RTL as data storage.
architecture RTL of codasip_memory_mem_t_storage_subblock0_t is
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

entity codasip_memory_mem_t_storage_subblock1_t is
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
		read_write_WE0 : in std_logic
	);
end entity codasip_memory_mem_t_storage_subblock1_t;

-- synthesis translate_off

-- Use FLI as data storage.
architecture FLI of codasip_memory_mem_t_storage_subblock1_t is
	attribute foreign of FLI: architecture is
		-- <init_fnc> <shared_library> <read_is_synchronous> <byte_bit_width> <size_in_bytes>
		"codasip_fli_memory_init ./libcodasip_fli_memory.so; 1 8 131072";
begin
end architecture FLI;

-- synthesis translate_on

-- Use RTL as data storage.
architecture RTL of codasip_memory_mem_t_storage_subblock1_t is
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

entity codasip_memory_mem_t_storage_subblock2_t is
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
		read_write_WE0 : in std_logic
	);
end entity codasip_memory_mem_t_storage_subblock2_t;

-- synthesis translate_off

-- Use FLI as data storage.
architecture FLI of codasip_memory_mem_t_storage_subblock2_t is
	attribute foreign of FLI: architecture is
		-- <init_fnc> <shared_library> <read_is_synchronous> <byte_bit_width> <size_in_bytes>
		"codasip_fli_memory_init ./libcodasip_fli_memory.so; 1 8 131072";
begin
end architecture FLI;

-- synthesis translate_on

-- Use RTL as data storage.
architecture RTL of codasip_memory_mem_t_storage_subblock2_t is
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

entity codasip_memory_mem_t_storage_subblock3_t is
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
		read_write_WE0 : in std_logic
	);
end entity codasip_memory_mem_t_storage_subblock3_t;

-- synthesis translate_off

-- Use FLI as data storage.
architecture FLI of codasip_memory_mem_t_storage_subblock3_t is
	attribute foreign of FLI: architecture is
		-- <init_fnc> <shared_library> <read_is_synchronous> <byte_bit_width> <size_in_bytes>
		"codasip_fli_memory_init ./libcodasip_fli_memory.so; 1 8 131072";
begin
end architecture FLI;

-- synthesis translate_on

-- Use RTL as data storage.
architecture RTL of codasip_memory_mem_t_storage_subblock3_t is
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
		read_write_WE0 : in std_logic
	);
end entity codasip_memory_mem_t_storage_t;

architecture RTL of codasip_memory_mem_t_storage_t is
	-- memory data storage
	component codasip_memory_mem_t_storage_subblock0_t
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
			read_write_WE0 : in std_logic
		);
	end component codasip_memory_mem_t_storage_subblock0_t;

	-- memory data storage
	component codasip_memory_mem_t_storage_subblock1_t
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
			read_write_WE0 : in std_logic
		);
	end component codasip_memory_mem_t_storage_subblock1_t;

	-- memory data storage
	component codasip_memory_mem_t_storage_subblock2_t
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
			read_write_WE0 : in std_logic
		);
	end component codasip_memory_mem_t_storage_subblock2_t;

	-- memory data storage
	component codasip_memory_mem_t_storage_subblock3_t
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
			read_write_WE0 : in std_logic
		);
	end component codasip_memory_mem_t_storage_subblock3_t;

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
	signal read_only_subblock_operation : std_logic_vector(4 downto 0);
	-- signal (inner)
	signal read_only_address_base_local : std_logic_vector(16 downto 0);
	-- signal (inner)
	signal read_write_subblock_operation : std_logic_vector(4 downto 0);
	-- signal (inner)
	signal read_write_address_base_local : std_logic_vector(16 downto 0);

		-- instances connection signals
	signal subblock0_read_only_RE0 : std_logic;
	signal subblock0_read_only_RA0 : std_logic_vector(16 downto 0);
	signal subblock0_read_only_Q0 : std_logic_vector(7 downto 0);
	signal subblock0_read_write_CS0 : std_logic;
	signal subblock0_read_write_WE0 : std_logic;
	signal subblock0_read_write_A0 : std_logic_vector(16 downto 0);
	signal subblock0_read_write_D0 : std_logic_vector(7 downto 0);
	signal subblock0_read_write_Q0 : std_logic_vector(7 downto 0);
	signal subblock1_read_only_RE0 : std_logic;
	signal subblock1_read_only_RA0 : std_logic_vector(16 downto 0);
	signal subblock1_read_only_Q0 : std_logic_vector(7 downto 0);
	signal subblock1_read_write_CS0 : std_logic;
	signal subblock1_read_write_WE0 : std_logic;
	signal subblock1_read_write_A0 : std_logic_vector(16 downto 0);
	signal subblock1_read_write_D0 : std_logic_vector(7 downto 0);
	signal subblock1_read_write_Q0 : std_logic_vector(7 downto 0);
	signal subblock2_read_only_RE0 : std_logic;
	signal subblock2_read_only_RA0 : std_logic_vector(16 downto 0);
	signal subblock2_read_only_Q0 : std_logic_vector(7 downto 0);
	signal subblock2_read_write_CS0 : std_logic;
	signal subblock2_read_write_WE0 : std_logic;
	signal subblock2_read_write_A0 : std_logic_vector(16 downto 0);
	signal subblock2_read_write_D0 : std_logic_vector(7 downto 0);
	signal subblock2_read_write_Q0 : std_logic_vector(7 downto 0);
	signal subblock3_read_only_RE0 : std_logic;
	signal subblock3_read_only_RA0 : std_logic_vector(16 downto 0);
	signal subblock3_read_only_Q0 : std_logic_vector(7 downto 0);
	signal subblock3_read_write_CS0 : std_logic;
	signal subblock3_read_write_WE0 : std_logic;
	signal subblock3_read_write_A0 : std_logic_vector(16 downto 0);
	signal subblock3_read_write_D0 : std_logic_vector(7 downto 0);
	signal subblock3_read_write_Q0 : std_logic_vector(7 downto 0);
	signal read_only_subblock_operation_reg_Q0 : std_logic_vector(4 downto 0);
	signal read_only_subblock_operation_reg_D0 : std_logic_vector(4 downto 0);
	signal read_only_subblock_operation_reg_WE0 : std_logic;
	signal read_write_subblock_operation_reg_Q0 : std_logic_vector(4 downto 0);
	signal read_write_subblock_operation_reg_D0 : std_logic_vector(4 downto 0);
	signal read_write_subblock_operation_reg_WE0 : std_logic;

		-- datapath signals and constants
	signal read_only_Q0_73_select_15135: std_logic_vector(4 downto 0);
	signal subblock0_read_write_D0_160_select_15136: std_logic_vector(4 downto 0);
	signal subblock1_read_write_D0_204_select_15137: std_logic_vector(4 downto 0);
	signal subblock2_read_write_D0_252_select_15138: std_logic_vector(4 downto 0);
	signal subblock3_read_write_D0_294_select_15139: std_logic_vector(4 downto 0);
	signal read_write_Q0_307_select_15140: std_logic_vector(4 downto 0);
	constant CONSTANT_0_115: unsigned(7 downto 0) := to_unsigned(0, 8);
	constant CONSTANT_0_95: unsigned(15 downto 0) := to_unsigned(0, 16);
	constant CONSTANT_0_77: unsigned(23 downto 0) := to_unsigned(0, 24);
	constant CONSTANT_0_75: unsigned(31 downto 0) := to_unsigned(0, 32);
	constant CONSTANT_1_18: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_10_234: unsigned(4 downto 0) := to_unsigned(10, 5);
	constant CONSTANT_12_148: unsigned(4 downto 0) := to_unsigned(12, 5);
	constant CONSTANT_13_192: unsigned(4 downto 0) := to_unsigned(13, 5);
	constant CONSTANT_16_151: unsigned(4 downto 0) := to_unsigned(16, 5);
	constant CONSTANT_4_2: unsigned(2 downto 0) := to_unsigned(4, 3);
	constant CONSTANT_4_143: unsigned(4 downto 0) := to_unsigned(4, 5);
	constant CONSTANT_5_181: unsigned(4 downto 0) := to_unsigned(5, 5);
	constant CONSTANT_6_229: unsigned(4 downto 0) := to_unsigned(6, 5);
	constant CONSTANT_7_277: unsigned(4 downto 0) := to_unsigned(7, 5);
	constant CONSTANT_8_145: unsigned(4 downto 0) := to_unsigned(8, 5);
	constant CONSTANT_9_186: unsigned(4 downto 0) := to_unsigned(9, 5);

begin
	-- child instances inside 'storage' memory sub-block storage:
	-- instance of 'subblock0' memory storage:
	subblock0 : codasip_memory_mem_t_storage_subblock0_t
		port map (
			CLK => CLK,
			RST => RST,
			read_only_RE0 => subblock0_read_only_RE0,
			read_only_RA0 => subblock0_read_only_RA0,
			read_only_Q0 => subblock0_read_only_Q0,
			read_write_CS0 => subblock0_read_write_CS0,
			read_write_WE0 => subblock0_read_write_WE0,
			read_write_A0 => subblock0_read_write_A0,
			read_write_D0 => subblock0_read_write_D0,
			read_write_Q0 => subblock0_read_write_Q0
		);

	-- instance of 'subblock1' memory storage:
	subblock1 : codasip_memory_mem_t_storage_subblock1_t
		port map (
			CLK => CLK,
			RST => RST,
			read_only_RE0 => subblock1_read_only_RE0,
			read_only_RA0 => subblock1_read_only_RA0,
			read_only_Q0 => subblock1_read_only_Q0,
			read_write_CS0 => subblock1_read_write_CS0,
			read_write_WE0 => subblock1_read_write_WE0,
			read_write_A0 => subblock1_read_write_A0,
			read_write_D0 => subblock1_read_write_D0,
			read_write_Q0 => subblock1_read_write_Q0
		);

	-- instance of 'subblock2' memory storage:
	subblock2 : codasip_memory_mem_t_storage_subblock2_t
		port map (
			CLK => CLK,
			RST => RST,
			read_only_RE0 => subblock2_read_only_RE0,
			read_only_RA0 => subblock2_read_only_RA0,
			read_only_Q0 => subblock2_read_only_Q0,
			read_write_CS0 => subblock2_read_write_CS0,
			read_write_WE0 => subblock2_read_write_WE0,
			read_write_A0 => subblock2_read_write_A0,
			read_write_D0 => subblock2_read_write_D0,
			read_write_Q0 => subblock2_read_write_Q0
		);

	-- instance of 'subblock3' memory storage:
	subblock3 : codasip_memory_mem_t_storage_subblock3_t
		port map (
			CLK => CLK,
			RST => RST,
			read_only_RE0 => subblock3_read_only_RE0,
			read_only_RA0 => subblock3_read_only_RA0,
			read_only_Q0 => subblock3_read_only_Q0,
			read_write_CS0 => subblock3_read_write_CS0,
			read_write_WE0 => subblock3_read_write_WE0,
			read_write_A0 => subblock3_read_write_A0,
			read_write_D0 => subblock3_read_write_D0,
			read_write_Q0 => subblock3_read_write_Q0
		);

	-- instance of 'read_only_subblock_operation_reg' register:
	read_only_subblock_operation_reg : d_ff_plain_t
		generic map (
			bit_width => 5,
			reset_value => "00000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			Q0 => read_only_subblock_operation_reg_Q0,
			D0 => read_only_subblock_operation_reg_D0,
			WE0 => read_only_subblock_operation_reg_WE0
		);

	-- instance of 'read_write_subblock_operation_reg' register:
	read_write_subblock_operation_reg : d_ff_plain_t
		generic map (
			bit_width => 5,
			reset_value => "00000"
		)
		port map (
			CLK => CLK,
			RST => RST,
			Q0 => read_write_subblock_operation_reg_Q0,
			D0 => read_write_subblock_operation_reg_D0,
			WE0 => read_write_subblock_operation_reg_WE0
		);


		-- conversions for datapath
	read_only_Q0_73_select_15135 <= read_only_subblock_operation_reg_Q0;
	subblock0_read_write_D0_160_select_15136 <= read_write_subblock_operation;
	subblock1_read_write_D0_204_select_15137 <= read_write_subblock_operation;
	subblock2_read_write_D0_252_select_15138 <= read_write_subblock_operation;
	subblock3_read_write_D0_294_select_15139 <= read_write_subblock_operation;
	read_write_Q0_307_select_15140 <= read_write_subblock_operation_reg_Q0;

		-- Datapath code
	read_only_address_base_local <= std_logic_vector(resize((unsigned(read_only_RA0) / CONSTANT_4_2), 17));
	read_only_subblock_operation <= std_logic_vector(unsigned(read_only_RSC0) & unsigned(read_only_RSI0));
	read_only_subblock_operation_reg_D0 <= read_only_subblock_operation;
	read_only_subblock_operation_reg_WE0 <= CONSTANT_1_18(0);
	read_write_address_base_local <= std_logic_vector(resize((unsigned(read_write_A0) / CONSTANT_4_2), 17));
	read_write_subblock_operation <= std_logic_vector(unsigned(read_write_SC0) & unsigned(read_write_SI0));
	read_write_subblock_operation_reg_D0 <= read_write_subblock_operation;
	read_write_subblock_operation_reg_WE0 <= CONSTANT_1_18(0);
	subblock0_read_only_RE0 <= read_only_RE0;
	subblock0_read_only_RA0 <= read_only_address_base_local;
	subblock1_read_only_RE0 <= read_only_RE0;
	subblock1_read_only_RA0 <= read_only_address_base_local;
	subblock2_read_only_RE0 <= read_only_RE0;
	subblock2_read_only_RA0 <= read_only_address_base_local;
	subblock3_read_only_RE0 <= read_only_RE0;
	subblock3_read_only_RA0 <= read_only_address_base_local;
	with read_only_Q0_73_select_15135 select
		read_only_Q0 <= 
			std_logic_vector(CONSTANT_0_77 & unsigned(subblock0_read_only_Q0)) when "00100", 
			std_logic_vector(CONSTANT_0_77 & unsigned(subblock1_read_only_Q0)) when "00101", 
			std_logic_vector(CONSTANT_0_77 & unsigned(subblock2_read_only_Q0)) when "00110", 
			std_logic_vector(CONSTANT_0_77 & unsigned(subblock3_read_only_Q0)) when "00111", 
			std_logic_vector(CONSTANT_0_95 & unsigned(subblock1_read_only_Q0) & unsigned(subblock0_read_only_Q0)) when "01000", 
			std_logic_vector(CONSTANT_0_95 & unsigned(subblock2_read_only_Q0) & unsigned(subblock1_read_only_Q0)) when "01001", 
			std_logic_vector(CONSTANT_0_95 & unsigned(subblock3_read_only_Q0) & unsigned(subblock2_read_only_Q0)) when "01010", 
			std_logic_vector(CONSTANT_0_115 & unsigned(subblock2_read_only_Q0) & unsigned(subblock1_read_only_Q0) & unsigned(subblock0_read_only_Q0)) when "01100", 
			std_logic_vector(CONSTANT_0_115 & unsigned(subblock3_read_only_Q0) & unsigned(subblock2_read_only_Q0) & unsigned(subblock1_read_only_Q0)) when "01101", 
			std_logic_vector(unsigned(subblock3_read_only_Q0) & unsigned(subblock2_read_only_Q0) & unsigned(subblock1_read_only_Q0) & unsigned(subblock0_read_only_Q0)) when "10000", 
			std_logic_vector(CONSTANT_0_75) when others;
	subblock0_read_write_CS0 <= read_write_CS0;
	subblock0_read_write_WE0 <= '1' when (((read_write_WE0 /= '0') and ((((unsigned(read_write_subblock_operation) = CONSTANT_4_143) or (unsigned(read_write_subblock_operation) = CONSTANT_8_145)) or (unsigned(read_write_subblock_operation) = CONSTANT_12_148)) or (unsigned(read_write_subblock_operation) = CONSTANT_16_151)))) else '0';
	subblock0_read_write_A0 <= read_write_address_base_local;
	with subblock0_read_write_D0_160_select_15136 select
		subblock0_read_write_D0 <= 
			read_write_D0(7 downto 0) when "00100", 
			read_write_D0(7 downto 0) when "01000", 
			read_write_D0(7 downto 0) when "01100", 
			read_write_D0(7 downto 0) when "10000", 
			std_logic_vector(CONSTANT_0_115) when others;
	subblock1_read_write_CS0 <= read_write_CS0;
	subblock1_read_write_WE0 <= '1' when (((read_write_WE0 /= '0') and ((((((unsigned(read_write_subblock_operation) = CONSTANT_5_181) or (unsigned(read_write_subblock_operation) = CONSTANT_8_145)) or (unsigned(read_write_subblock_operation) = CONSTANT_9_186)) or (unsigned(read_write_subblock_operation) = CONSTANT_12_148)) or (unsigned(read_write_subblock_operation) = CONSTANT_13_192)) or (unsigned(read_write_subblock_operation) = CONSTANT_16_151)))) else '0';
	subblock1_read_write_A0 <= read_write_address_base_local;
	with subblock1_read_write_D0_204_select_15137 select
		subblock1_read_write_D0 <= 
			read_write_D0(7 downto 0) when "00101", 
			read_write_D0(15 downto 8) when "01000", 
			read_write_D0(7 downto 0) when "01001", 
			read_write_D0(15 downto 8) when "01100", 
			read_write_D0(7 downto 0) when "01101", 
			read_write_D0(15 downto 8) when "10000", 
			std_logic_vector(CONSTANT_0_115) when others;
	subblock2_read_write_CS0 <= read_write_CS0;
	subblock2_read_write_WE0 <= '1' when (((read_write_WE0 /= '0') and ((((((unsigned(read_write_subblock_operation) = CONSTANT_6_229) or (unsigned(read_write_subblock_operation) = CONSTANT_9_186)) or (unsigned(read_write_subblock_operation) = CONSTANT_10_234)) or (unsigned(read_write_subblock_operation) = CONSTANT_12_148)) or (unsigned(read_write_subblock_operation) = CONSTANT_13_192)) or (unsigned(read_write_subblock_operation) = CONSTANT_16_151)))) else '0';
	subblock2_read_write_A0 <= read_write_address_base_local;
	with subblock2_read_write_D0_252_select_15138 select
		subblock2_read_write_D0 <= 
			read_write_D0(7 downto 0) when "00110", 
			read_write_D0(15 downto 8) when "01001", 
			read_write_D0(7 downto 0) when "01010", 
			read_write_D0(23 downto 16) when "01100", 
			read_write_D0(15 downto 8) when "01101", 
			read_write_D0(23 downto 16) when "10000", 
			std_logic_vector(CONSTANT_0_115) when others;
	subblock3_read_write_CS0 <= read_write_CS0;
	subblock3_read_write_WE0 <= '1' when (((read_write_WE0 /= '0') and ((((unsigned(read_write_subblock_operation) = CONSTANT_7_277) or (unsigned(read_write_subblock_operation) = CONSTANT_10_234)) or (unsigned(read_write_subblock_operation) = CONSTANT_13_192)) or (unsigned(read_write_subblock_operation) = CONSTANT_16_151)))) else '0';
	subblock3_read_write_A0 <= read_write_address_base_local;
	with subblock3_read_write_D0_294_select_15139 select
		subblock3_read_write_D0 <= 
			read_write_D0(7 downto 0) when "00111", 
			read_write_D0(15 downto 8) when "01010", 
			read_write_D0(23 downto 16) when "01101", 
			read_write_D0(31 downto 24) when "10000", 
			std_logic_vector(CONSTANT_0_115) when others;
	with read_write_Q0_307_select_15140 select
		read_write_Q0 <= 
			std_logic_vector(CONSTANT_0_77 & unsigned(subblock0_read_write_Q0)) when "00100", 
			std_logic_vector(CONSTANT_0_77 & unsigned(subblock1_read_write_Q0)) when "00101", 
			std_logic_vector(CONSTANT_0_77 & unsigned(subblock2_read_write_Q0)) when "00110", 
			std_logic_vector(CONSTANT_0_77 & unsigned(subblock3_read_write_Q0)) when "00111", 
			std_logic_vector(CONSTANT_0_95 & unsigned(subblock1_read_write_Q0) & unsigned(subblock0_read_write_Q0)) when "01000", 
			std_logic_vector(CONSTANT_0_95 & unsigned(subblock2_read_write_Q0) & unsigned(subblock1_read_write_Q0)) when "01001", 
			std_logic_vector(CONSTANT_0_95 & unsigned(subblock3_read_write_Q0) & unsigned(subblock2_read_write_Q0)) when "01010", 
			std_logic_vector(CONSTANT_0_115 & unsigned(subblock2_read_write_Q0) & unsigned(subblock1_read_write_Q0) & unsigned(subblock0_read_write_Q0)) when "01100", 
			std_logic_vector(CONSTANT_0_115 & unsigned(subblock3_read_write_Q0) & unsigned(subblock2_read_write_Q0) & unsigned(subblock1_read_write_Q0)) when "01101", 
			std_logic_vector(unsigned(subblock3_read_write_Q0) & unsigned(subblock2_read_write_Q0) & unsigned(subblock1_read_write_Q0) & unsigned(subblock0_read_write_Q0)) when "10000", 
			std_logic_vector(CONSTANT_0_75) when others;

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
		read_write_SI0 : in std_logic_vector(1 downto 0)
	);
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

	-- memory sub-block logic
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
			read_write_WE0 : in std_logic
		);
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
	constant CONSTANT_0_479: unsigned(0 downto 0) := to_unsigned(0, 1);
	constant CONSTANT_0_493: unsigned(1 downto 0) := to_unsigned(0, 2);
	constant CONSTANT_0_500: unsigned(2 downto 0) := to_unsigned(0, 3);
	constant CONSTANT_0_486: unsigned(18 downto 0) := to_unsigned(0, 19);
	constant CONSTANT_0_414: unsigned(31 downto 0) := to_unsigned(0, 32);
	constant CONSTANT_1_476: unsigned(0 downto 0) := to_unsigned(1, 1);
	constant CONSTANT_4_432: unsigned(4 downto 0) := to_unsigned(4, 5);
	constant CONSTANT_4_415: unsigned(31 downto 0) := to_unsigned(4, 32);
	constant CONSTANT_524288_424: unsigned(31 downto 0) := to_unsigned(524288, 32);

begin
	-- child instances inside 'mem' memory:
	-- instance of 'storage' memory sub-block storage:
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
		std_logic_vector(CP_RC_UNALIGNED) when (((unsigned(read_only_REQCMD0) = CP_RQ_READ) and ((unsigned(read_only_A0) mod CONSTANT_4_415) /= CONSTANT_0_414))) else 
		std_logic_vector(CP_RC_OOR) when (((unsigned(read_only_REQCMD0) = CP_RQ_READ) and (unsigned(read_only_A0) >= CONSTANT_524288_424))) else 
		std_logic_vector(CP_RC_ERROR) when (((unsigned(read_only_REQCMD0) = CP_RQ_READ) and ((unsigned(resize(unsigned(read_only_SI0), 5)) + unsigned(resize(unsigned(read_only_SC0), 5))) > CONSTANT_4_432))) else 
		std_logic_vector(CP_RC_ACK) when ((unsigned(read_only_REQCMD0) = CP_RQ_READ)) else
		std_logic_vector(CP_RC_WAIT);
	read_only_REQRESP0 <= read_only_REQRESP0_local;
	read_only_IFRESP0 <= std_logic_vector(CP_RC_ERROR) when ((((unsigned(read_only_IFCMD0) /= CP_RQ_NONE) and (unsigned(read_only_IFCMD0) /= CP_IF_READ)) and (unsigned(read_only_IFRESP0_local_Q0) = CP_RC_ACK))) else
		read_only_IFRESP0_local_Q0;
	read_only_IFRESP0_local_D0 <= std_logic_vector(CP_RC_ACK) when (((unsigned(read_only_REQCMD0) = CP_RQ_READ) and (unsigned(read_only_REQRESP0_local) = CP_RC_ACK))) else
		std_logic_vector(CP_RC_WAIT);
	read_only_IFRESP0_local_WE0 <= CONSTANT_1_476(0);
	storage_read_only_RE0 <= CONSTANT_1_476(0) when ((unsigned(read_only_REQRESP0_local) = CP_RC_ACK)) else
		CONSTANT_0_479(0);
	storage_read_only_RA0 <= read_only_A0(18 downto 0) when ((unsigned(read_only_REQRESP0_local) = CP_RC_ACK)) else
		std_logic_vector(CONSTANT_0_486);
	storage_read_only_RSI0 <= read_only_SI0 when ((unsigned(read_only_REQRESP0_local) = CP_RC_ACK)) else
		std_logic_vector(CONSTANT_0_493);
	storage_read_only_RSC0 <= read_only_SC0 when ((unsigned(read_only_REQRESP0_local) = CP_RC_ACK)) else
		std_logic_vector(CONSTANT_0_500);
	read_only_Q0 <= storage_read_only_Q0 when (((unsigned(read_only_IFRESP0_local_Q0) = CP_RC_ACK) and (unsigned(read_only_IFCMD0) = CP_IF_READ))) else
		std_logic_vector(CONSTANT_0_414);
	read_write_REQRESP0_local <= std_logic_vector(CP_RC_ERROR) when (not((((unsigned(read_write_REQCMD0) = CP_RQ_READ) or (unsigned(read_write_REQCMD0) = CP_RQ_WRITE)) or (unsigned(read_write_REQCMD0) = CP_RQ_NONE)))) else 
		std_logic_vector(CP_RC_UNALIGNED) when ((((unsigned(read_write_REQCMD0) = CP_RQ_READ) or (unsigned(read_write_REQCMD0) = CP_RQ_WRITE)) and ((unsigned(read_write_A0) mod CONSTANT_4_415) /= CONSTANT_0_414))) else 
		std_logic_vector(CP_RC_OOR) when ((((unsigned(read_write_REQCMD0) = CP_RQ_READ) or (unsigned(read_write_REQCMD0) = CP_RQ_WRITE)) and (unsigned(read_write_A0) >= CONSTANT_524288_424))) else 
		std_logic_vector(CP_RC_ERROR) when ((((unsigned(read_write_REQCMD0) = CP_RQ_READ) or (unsigned(read_write_REQCMD0) = CP_RQ_WRITE)) and ((unsigned(resize(unsigned(read_write_SI0), 5)) + unsigned(resize(unsigned(read_write_SC0), 5))) > CONSTANT_4_432))) else 
		std_logic_vector(CP_RC_ACK) when (((unsigned(read_write_REQCMD0) = CP_RQ_READ) or (unsigned(read_write_REQCMD0) = CP_RQ_WRITE))) else
		std_logic_vector(CP_RC_WAIT);
	read_write_REQRESP0 <= read_write_REQRESP0_local;
	read_write_IFRESP0 <= std_logic_vector(CP_RC_ERROR) when ((((unsigned(read_write_IFCMD0) /= CP_RQ_NONE) and (unsigned(read_write_IFCMD0) /= CP_IF_READ)) and (unsigned(read_write_IFRESP0_local_Q0) = CP_RC_ACK))) else
		read_write_IFRESP0_local_Q0;
	read_write_IFRESP0_local_D0 <= std_logic_vector(CP_RC_ACK) when (((unsigned(read_write_REQCMD0) = CP_RQ_READ) and (unsigned(read_write_REQRESP0_local) = CP_RC_ACK))) else
		std_logic_vector(CP_RC_WAIT);
	read_write_IFRESP0_local_WE0 <= CONSTANT_1_476(0);
	read_write_OFRESP0 <= read_write_OFRESP0_local;
	read_write_OFRESP0_local <= std_logic_vector(CP_RC_ERROR) when (((unsigned(read_write_OFCMD0) = CP_OF_WRITE) and ((unsigned(read_write_REQCMD0) /= CP_RQ_WRITE) and (unsigned(read_write_REQRESP0_local) = CP_RC_ACK)))) else 
		std_logic_vector(CP_RC_ACK) when (((unsigned(read_write_REQCMD0) = CP_RQ_WRITE) and (unsigned(read_write_REQRESP0_local) = CP_RC_ACK))) else
		std_logic_vector(CP_RC_WAIT);
	storage_read_write_CS0 <= CONSTANT_1_476(0) when ((unsigned(read_write_REQRESP0_local) = CP_RC_ACK)) else
		CONSTANT_0_479(0);
	storage_read_write_WE0 <= CONSTANT_1_476(0) when (((unsigned(read_write_REQRESP0_local) = CP_RC_ACK) and ((unsigned(read_write_REQCMD0) = CP_RQ_WRITE) and (unsigned(read_write_OFCMD0) = CP_OF_WRITE)))) else
		CONSTANT_0_479(0);
	storage_read_write_A0 <= read_write_A0(18 downto 0) when ((unsigned(read_write_REQRESP0_local) = CP_RC_ACK)) else
		std_logic_vector(CONSTANT_0_486);
	storage_read_write_SI0 <= read_write_SI0 when ((unsigned(read_write_REQRESP0_local) = CP_RC_ACK)) else
		std_logic_vector(CONSTANT_0_493);
	storage_read_write_SC0 <= read_write_SC0 when ((unsigned(read_write_REQRESP0_local) = CP_RC_ACK)) else
		std_logic_vector(CONSTANT_0_500);
	storage_read_write_D0 <= read_write_D0 when ((unsigned(read_write_OFRESP0_local) = CP_RC_ACK)) else
		std_logic_vector(CONSTANT_0_414);
	read_write_Q0 <= storage_read_write_Q0 when (((unsigned(read_write_IFRESP0_local_Q0) = CP_RC_ACK) and (unsigned(read_write_IFCMD0) = CP_IF_READ))) else
		std_logic_vector(CONSTANT_0_414);

end architecture RTL;


