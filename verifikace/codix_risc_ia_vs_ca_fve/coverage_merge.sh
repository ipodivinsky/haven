#!/bin/sh
################################################################################
#       "Copyright (C) 2014, Codasip s.r.o, All Rights Reserved"
#  author: Codasip HW generator v2.2.0.internal
#  date:   Sat Jul 19 17:47:35 2014
#  brief:  Merge CPU coverage from all runs into one coverage in parallel jobs (-j <num> option).
################################################################################

# Change path if necessary
# export PATH=$PATH:
# License file
# export LM_LICENSE_FILE=

cd fve

# Set number of parallel jobs
if [ "$#" -ge "2" -a "$1" == "-j" ]; then
	JOBS_COUNT=$2
else
	JOBS_COUNT=4
fi

# Remove previously created list
rm -f final.txt
# Merge coverage results in parallel
for i in $(seq 1 $JOBS_COUNT); do
	ls -1 xexes/*.ucdb | sed -n $i~"$JOBS_COUNT"p > output.$i.txt
	echo coverage.$i.ucdb >> final.txt
	vcover merge -input output.$i.txt -out coverage.$i.ucdb &
done
wait

# Final merge
vcover merge -input final.txt -out coverage.ucdb

# Generate HTML coverage report
rm -rf coverage_report
vcover report -html -htmldir coverage_report coverage.ucdb

# Cleanup temporal files
for i in $(seq 1 $JOBS_COUNT); do
	rm output.$i.txt coverage.$i.ucdb
done
rm final.txt
