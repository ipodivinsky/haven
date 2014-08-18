--------------------------------------------------------------------------------
--       "Copyright (C) 2014, Codasip s.r.o., All Rights Reserved"
--------------------------------------------------------------------------------
--! @file
--! @date   Sat Jul 19 17:47:35 2014
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
						for subblock0 : codasip_memory_mem_t_storage_subblock0_t
							use entity work.codasip_memory_mem_t_storage_subblock0_t(FLI);
						end for;
						for subblock1 : codasip_memory_mem_t_storage_subblock1_t
							use entity work.codasip_memory_mem_t_storage_subblock1_t(FLI);
						end for;
						for subblock2 : codasip_memory_mem_t_storage_subblock2_t
							use entity work.codasip_memory_mem_t_storage_subblock2_t(FLI);
						end for;
						for subblock3 : codasip_memory_mem_t_storage_subblock3_t
							use entity work.codasip_memory_mem_t_storage_subblock3_t(FLI);
						end for;
					end for; -- RTL of codasip_memory_mem_t_storage_t
				end for;
			end for; -- RTL of codasip_memory_mem_t
		end for;
	end for; -- RTL of codix_risc_platform_ca_t
end configuration codix_risc_platform_ca_configuration;
