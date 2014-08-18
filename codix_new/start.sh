#!/bin/sh
################################################################################
#       "Copyright (C) 2014, Codasip s.r.o, All Rights Reserved"
#  author: Codasip HW generator v2.2.0.internal
#  date:   Wed Jun 18 14:16:23 2014
#  brief:  Start verification of one ASIP with multiple programs.
################################################################################

# Change path if necessary
# export PATH=$PATH:
# License file
# export LM_LICENSE_FILE=

cd fve

vsim -c -do start.tcl $*
