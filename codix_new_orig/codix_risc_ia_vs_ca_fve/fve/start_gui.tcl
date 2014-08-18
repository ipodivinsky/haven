################################################################################
#       "Copyright (C) 2014, Codasip s.r.o, All Rights Reserved"
#  author: Codasip HW generator v2.2.0.internal
#  date:   Wed Jun 18 14:16:23 2014
#  brief:  Simulation start script, GUI mode.
################################################################################

package require cmdline

# return file extension of all shared libraries
proc get_shared_library_extension {} {
	if { $::tcl_platform(platform) == "windows" } {
		set LIB_EXT ".dll"
	} else {
		set LIB_EXT ".so"
	}
	return $LIB_EXT
}

# define behavior when an error is encountered
proc run_on_error { ERROR_MESSAGE } {
	# make global variables visible
	global REPORT_FILE
	global ERROR_MESSAGE_PREFIX
	# generate error messages and quit
	puts "$ERROR_MESSAGE"
	echo "${ERROR_MESSAGE_PREFIX}${ERROR_MESSAGE}"
	exec echo -e "${ERROR_MESSAGE_PREFIX}${ERROR_MESSAGE}" >> $REPORT_FILE
	if [batch_mode] {
		quit -f
	} else {
		pause
	}
}

# parse arguments and return array of executables for each ASIP instance
proc parse_executables { ARGV } {
	# prepare variables necessary for the cmdline package
	set USAGE "do start_gui.tcl -codix_risc path_to_executable"
	set PARAMETERS {
		{ "codix_risc.arg" "" "Which application to execute on codix_risc ASIP instance" }
	}
	array set EXECUTABLES [::cmdline::getKnownOptions ARGV $PARAMETERS $USAGE]
	set REQUIRED_PARAMS { codix_risc }
	# verify required arguments
	foreach PARAM $REQUIRED_PARAMS {
		if { $EXECUTABLES($PARAM) == "" } {
			run_on_error "Missing required parameter -$PARAM"
		} elseif { ![file exists $EXECUTABLES($PARAM)] } {
			run_on_error "File '$EXECUTABLES($PARAM)' does not exist!"
		}
	}
	return [array get EXECUTABLES]
}

# run single program
proc run_program { VSIM_RUN_CMD COVERAGE_FILE PROGRAM_CODIX_RISC } {
	global ERROR_MESSAGE_PREFIX
	quietly set ERROR_MESSAGE_PREFIX ";codix_risc_platform_ca;$PROGRAM_CODIX_RISC;-1;-1;fail\n"
	# add plusargs specifying program to run on the ASIPs
	append VSIM_RUN_CMD " +CODASIP_XEXE_PATH=codix_risc,$PROGRAM_CODIX_RISC"
	# Start of the simulation
	eval $VSIM_RUN_CMD

	# suppress warnings from arithmetic library during reset
	quietly set NumericStdNoWarnings 1;
	quietly set StdArithNoWarnings 1;
	when -fast -label disable_StdWarn {/top/dut/codix_risc_platform_ca_codix_risc_core_regs_if/RST == 0} {
		quietly set NumericStdNoWarnings 1;
		quietly set StdArithNoWarnings 1;
	}
	when -fast -label enable_StdWarn {/top/dut/codix_risc_platform_ca_codix_risc_core_regs_if/RST == 1} {
		quietly set NumericStdNoWarnings 0;
		quietly set StdArithNoWarnings 0;
	}

	# set variables to run multiple programs
	onbreak resume
	onfinish stop

	# definition of signals in a wave window and complete GUI customization
	if { ![batch_mode] } {
		source "./wave.tcl"
		global DUT_MODULE
		global HDL_DUT
		customize_gui /$DUT_MODULE /$HDL_DUT
	}

	# run the simulation
	run -all
	# save coverage from current run
	coverage save -codeAll -cvg $COVERAGE_FILE
}

# quit any previous simulation
quit -sim

if { ![batch_mode] } {
	.main clear
}

# global variables
# prepare script arguments for the cmdline package
if { [info exists DO_ARGS] } {
	unset DO_ARGS
}
while { $argc != 0 } {
	append DO_ARGS "$1 "
	shift
}
# working library name
quietly set WORKING_LIBRARY "work"
# default directory where programs to run should be placed
quietly set PROGRAM_DIRECTORY "./xexes"
# default directory with HDL source files of the DUT
quietly set HDL_DIRECTORY [file join .. vhdl]
quietly set HDL_EXT ".vhd"
# report output file
quietly set REPORT_FILE "report.txt"
quietly set COVERAGE_FILE "coverage.ucdb"
quietly set ERROR_MESSAGE "An unspecified error has been encountered."
quietly set ERROR_MESSAGE_PREFIX ""
# set path to top level and DUT instance
quietly set TOP_MODULE "top"
quietly set DUT_MODULE "$TOP_MODULE/dut"
quietly set HDL_DUT "$DUT_MODULE/HDL_DUT_U"
# set names of loaded libraries
quietly set LIB_EXT [get_shared_library_extension]
quietly set LIB_GOLD [file join golden_model libcodix_risc_platform_ia]
quietly set LIB_GOLD_FILE "$LIB_GOLD$LIB_EXT"
quietly set LIB_FLI "libcodasip_fli_memory"
quietly set LIB_FLI_FILE "$LIB_FLI$LIB_EXT"
quietly set LIB_VPI "libcodasip_vpi_memory"
quietly set LIB_VPI_FILE "$LIB_VPI$LIB_EXT"

# prepare command to start simulation
quietly set VSIM_RUN_CMD "vsim -coverage -t 1ps -lib ${WORKING_LIBRARY} ${TOP_MODULE}"
# specify report file for the FVE
quietly append VSIM_RUN_CMD " +CODASIP_REPORT_FILE=${REPORT_FILE}"
if [file exists $LIB_GOLD_FILE] {
	quietly append VSIM_RUN_CMD " -sv_lib $LIB_GOLD"
}
if [file exists $LIB_FLI_FILE] {
	quietly append VSIM_RUN_CMD " -sv_lib $LIB_FLI"
}
if [file exists $LIB_VPI_FILE] {
	quietly append VSIM_RUN_CMD " -pli $LIB_VPI_FILE -sv_lib $LIB_VPI"
}

# additional compiler defines for the verification environment
quietly set COMPILER_DEFINES "+define+FORCE_USE_OF_UVM_COMPARISON_POLICY"

# clear previous reports
file delete $REPORT_FILE

# default action when an error is encountered
onElabError { run_on_error $errorInfo; }
onerror { run_on_error $ERROR_MESSAGE; }

# get programs to run
array set EXECUTABLES [parse_executables $DO_ARGS]
# compile HDL and HVL source files
source "./compile.tcl"
compile_sources $WORKING_LIBRARY $HDL_DIRECTORY $HDL_EXT $COMPILER_DEFINES

# set final error messages
quietly set ERROR_MESSAGE "An unspecified runtime error has been encountered."
quietly set ERROR_MESSAGE_PREFIX ";codix_risc_platform_ca;;-1;-1;fail\n"

# create header for the report file
exec echo "#executable;GM cycles;DUT cycles;verification result" > $REPORT_FILE

# simulate the programs
run_program $VSIM_RUN_CMD $COVERAGE_FILE $EXECUTABLES(codix_risc)

