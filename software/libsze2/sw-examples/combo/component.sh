#!/bin/bash
#
# This script demonstrates same functionality as component.c example file
#
# This script performs RW opeartions within combo card space by csbus tool
#
# Author: Andrej Hank <xhanka00@liberouter.org>
# Date: 2009


# enable ibuf component (just to demonstate write operation)
csbus 1020 -w 1

# read and print counter registers (just to demonstrate read operation)
csbus 1000
csbus 1004
csbus 1008
csbus 100C
