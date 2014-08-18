#!/bin/sh
################################################################################
#       "Copyright (C) 2014, Codasip s.r.o, All Rights Reserved"
#  author: Codasip HW generator v2.2.0.internal
#  date:   Wed Jun 18 14:16:23 2014
#  brief:  Start verification of the platform in GUI mode.
################################################################################

# Change path if necessary
# export PATH=$PATH:
# License file
# export LM_LICENSE_FILE=

# variable(s) holding executable to run on specific ASIP instance
codix_risc="./xexes/codix_risc-O3-2014-06-09.zip"

SCRIPT_NAME=`basename $0`

# print help informations
usage()
{
	echo "Run verification of the whole platform in GUI mode using ModelSim."
	echo "Usage: ./$SCRIPT_NAME --asip=codix_risc,<file> -- [<additional_parameters>]"
	echo "The usage for single processor platform can be simplified to:"
	echo "./$SCRIPT_NAME <file>"
	echo ""
	echo "  where <file> specifies the path to the executable to run on ASIP."
	echo "  All parameters after the -- delimiter will be passed to the ModelSim."
	echo ""
	echo "Options:"
	echo "  -a --asip=<ASIP>,<file> Specify executable to run on given ASIP instance."
	echo "                          ASIP instance and executable are delimited with single"
	echo "                          comma character."
	echo "  -h --help               Display this message."
}

# split asip specification provided by the user into ASIP instance and executable
# requires one parameter, original string with the specification
split_instance_and_executable()
{
	local INSTANCE=`echo $1 | cut -f1 -d,`
	local EXECUTABLE=`echo $1 | cut -f2 -d,`

	if [ "$EXECUTABLE" != "" ]; then
		case "$INSTANCE" in
			codix_risc)
				codix_risc=$EXECUTABLE;;
			*)
				echo "warning: Unknown ASIP instance '$INSTANCE' will be ignored.";;
		esac
	fi
}

# checks whether given ASIP has its specification or not
# requires two parameters
# first one is the name of the ASIP instance needed for error messages
# second one is the executable path
check_executable()
{
	if [ "$2" = "" ]; then
		echo "error: Missing executable to run on ASIP '$1'."
		usage
		exit 1
	elif [ ! -f "$2" ]; then
		echo "error: Executable file '$2' to run on ASIP '$1' does not exist."
		exit 2
	fi
}

# extract parameters passed to the HDL simulator
extract_vsim_params()
{
	while [ $# -gt 0 ]; do
		case "$1" in
			--) shift;break;;
			*)  ;;
		esac
		shift
	done
	echo "$@"
}

# return sub-string of given length
# first parameter is the source string
# second parameter is the sub-string length
substring()
{
	echo "$1" | awk -v var=$2 '{ string=substr($0, 1, var - 1); print string; }'
}

# save options for external program
EXTERN_PARAMS=`extract_vsim_params $@`

# parse options
set -- `getopt -n$0 -u -a --longoptions="asip: help" "a:" "h" "$@"` || usage
[ $# -eq 0 ] && usage

while [ $# -gt 0 ]; do
	case "$1" in
		-a|--asip)
			split_instance_and_executable $2
			shift;;
		-h|--help)
			usage
			exit 0;;
		--)
			if [ ! "$(substring ${EXTERN_PARAMS} ${#3})" = "$3" ]; then
				split_instance_and_executable "codix_risc,$3"
				shift 3;
			fi
			break;;
		*)
			break;;
	esac
	shift
done

check_executable "codix_risc" $codix_risc

vsim $EXTERN_PARAMS -do "do start_gui.tcl -codix_risc $codix_risc"

