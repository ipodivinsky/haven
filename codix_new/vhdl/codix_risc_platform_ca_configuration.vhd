--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Wed Jun 18 14:16:23 2014
--! @author Codasip HW generator v2.2.0.internal
--! @brief  Contains configuration for all memories inside the SoC.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.all;

configuration codix_risc_platform_ca_configuration of codix_risc_platform_ca_t is
	for RTL
		for mem : codasip_memory_mem_t
			for RTL
				for storage : codasip_memory_mem_t_storage_t
					for RTL
						for subblock
							for all : codasip_memory_mem_t_storage_t_byte_t
								use entity work.codasip_memory_mem_t_storage_t_byte_t(FLI);
							end for;
						end for; -- data
					end for; -- RTL of codasip_memory_mem_t_storage_t_byte_t
				end for;
			end for; -- RTL of RTL
		end for;
	end for; -- RTL of codix_risc_platform_ca_t
end configuration codix_risc_platform_ca_configuration;
