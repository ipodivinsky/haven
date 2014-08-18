################################################################################
#       "Copyright (C) 2014, Codasip s.r.o, All Rights Reserved"
#  author: Codasip HW generator v2.2.0.internal
#  date:   Sat Jul 19 17:47:35 2014
#  brief:  Source files compilation script
################################################################################

# compile single VHDL source file
proc compile_vhdl { LIBRARY SRC_FILE } {
	vcom -explicit -93 -source -cover sbcef -work $LIBRARY $SRC_FILE
}

# compile single Verilog source file
proc compile_verilog { LIBRARY SRC_FILE } {
	vlog -incr -source -cover sbcef -work $LIBRARY $SRC_FILE
}

# compile single SystemVerilog source file
proc compile_sv { LIBRARY COMPILER_DEFINES SRC_FILE } {
	regsub "/\[^/\]+\$" $SRC_FILE "/" INC_DIR
	set COMPILE_CMD "vlog -sv -incr -source -work $LIBRARY $COMPILER_DEFINES +incdir+$INC_DIR $SRC_FILE"
	eval $COMPILE_CMD
}

# choose appropriate compile procedure based on the file extension
proc compile_source { LIBRARY COMPILER_DEFINES SRC_FILE } {
	if { [regexp {^.*\.vhd$} $SRC_FILE] } {
		compile_vhdl $LIBRARY $SRC_FILE
	} elseif { [regexp {^.*\.v$} $SRC_FILE] } {
		compile_verilog $LIBRARY $SRC_FILE
	} elseif { [regexp {^.*\.sv$} $SRC_FILE] } {
		compile_sv $LIBRARY $COMPILER_DEFINES $SRC_FILE
	} elseif { [regexp {^.*\.svh$} $SRC_FILE] } {
		puts "warning: Unsupported file extension, file '$SRC_FILE' will be ignored and not compiled."
	}
}

# compile all HDL and HVL source files in given directory and its sub-directories
proc compile_directory { LIBRARY HDL_DIRECTORY HDL_EXT COMPILER_DEFINES } {
	# recursively compile sub-directories
	foreach SRC_DIR [glob -nocomplain -directory $HDL_DIRECTORY -types d *] {
		compile_directory $LIBRARY $SRC_DIR $HDL_EXT $COMPILER_DEFINES
	}
	foreach SRC_FILE [glob -nocomplain -directory $HDL_DIRECTORY -types f *] {
		if {! [string equal $SRC_FILE [file join $HDL_DIRECTORY codix_risc_platform_ca_configuration$HDL_EXT]] } {
			compile_source $LIBRARY $COMPILER_DEFINES $SRC_FILE
		}
	}
}

# create working library and compile source files
proc compile_sources { LIBRARY HDL_DIRECTORY HDL_EXT COMPILER_DEFINES } {
	# backup previous error message and set new one
	global ERROR_MESSAGE
	global LIB_GOLD_FILE
	quietly set prev_error_msg ERROR_MESSAGE
	quietly set ERROR_MESSAGE "Compilation error has been encountered."

	# create working library
	vlib $LIBRARY

	# DUT compilation
	compile_directory $LIBRARY $HDL_DIRECTORY $HDL_EXT $COMPILER_DEFINES
	# configuration file must be compiled as last one
	compile_source $LIBRARY $COMPILER_DEFINES [file join $HDL_DIRECTORY codix_risc_platform_ca_configuration$HDL_EXT]

	# verification environment compilation
	compile_sv $LIBRARY $COMPILER_DEFINES test_parameters.sv
	# if golden model uses shared library, compile DPI package to control it
	if [file exists $LIB_GOLD_FILE] {
		compile_sv $LIBRARY $COMPILER_DEFINES [file join golden_model codix_risc_platform_ia_dpi_pkg.sv]
	}
	compile_sv $LIBRARY $COMPILER_DEFINES [file join agents codix_risc_ca_core_regs_t_agent sv_codix_risc_ca_core_regs_t_agent_pkg.sv]
	compile_sv $LIBRARY $COMPILER_DEFINES [file join agents codix_risc_ca_core_main_instr_hw_instr_hw_t_agent sv_codix_risc_ca_core_main_instr_hw_instr_hw_t_agent_pkg.sv]
	compile_sv $LIBRARY $COMPILER_DEFINES [file join agents codix_risc_ca_t_agent sv_codix_risc_ca_t_agent_pkg.sv]
	compile_sv $LIBRARY $COMPILER_DEFINES [file join agents codasip_memory_mem_t_agent sv_codasip_memory_mem_t_agent_pkg.sv]
	compile_sv $LIBRARY $COMPILER_DEFINES [file join agents codix_risc_platform_ca_t_agent sv_codix_risc_platform_ca_t_agent_pkg.sv]
	compile_sv $LIBRARY $COMPILER_DEFINES [file join golden_model sv_golden_model_pkg.sv]
	compile_sv $LIBRARY $COMPILER_DEFINES [file join env_lib codix_risc_ca_t_env sv_env_pkg.sv]
	compile_sv $LIBRARY $COMPILER_DEFINES [file join env_lib codix_risc_platform_ca_t_env sv_env_pkg.sv]
	compile_sv $LIBRARY $COMPILER_DEFINES [file join test_lib sv_test_pkg.sv]
	compile_sv $LIBRARY $COMPILER_DEFINES [file join agents codix_risc_ca_core_regs_t_agent ifc.sv]
	compile_sv $LIBRARY $COMPILER_DEFINES [file join agents codix_risc_ca_core_main_instr_hw_instr_hw_t_agent ifc.sv]
	compile_sv $LIBRARY $COMPILER_DEFINES [file join agents codix_risc_ca_t_agent ifc.sv]
	compile_sv $LIBRARY $COMPILER_DEFINES [file join agents codasip_memory_mem_t_agent ifc.sv]
	compile_sv $LIBRARY $COMPILER_DEFINES [file join agents codix_risc_platform_ca_t_agent ifc.sv]
	compile_sv $LIBRARY $COMPILER_DEFINES dut.sv
	compile_sv $LIBRARY $COMPILER_DEFINES top_level.sv

	# restore previous error message
	quietly set ERROR_MESSAGE prev_error_msg
}
