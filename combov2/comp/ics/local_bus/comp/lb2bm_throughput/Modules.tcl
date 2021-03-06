# Modules.tcl: Local include Leonardo tcl script
# Copyright (C) 2007 CESNET
# Author: Petr Kobiersky <xkobie00@stud.fit.vutbr.cz>
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the OpenIPCore Hardware General Public
# License as published by the OpenIPCore Organization; either version
# 0.20-15092000 of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# OpenIPCore Hardware General Public License for more details.
#
# You should have received a copy of the OpenIPCore Hardware Public
# License along with this program; if not, download it from
# OpenCores.org (http://www.opencores.org/OIPC/OHGPL.shtml).
#
# $Id$
#

# Source files for all components

global VHDL_BASE

if { $ARCHGRP == "FULL" } {
  set MOD "$MOD $ENTITY_BASE/../../pkg/lb_pkg.vhd"
  set MOD "$MOD $ENTITY_BASE/../../../internal_bus/pkg/ib_pkg.vhd"
  set MOD "$MOD $ENTITY_BASE/mi32tobm_core.vhd"
  set MOD "$MOD $ENTITY_BASE/top/mi32tobm.vhd"
}

