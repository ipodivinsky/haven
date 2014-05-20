#!/usr/bin/env python

import os
import sys

from itertools import izip

def grouped(iterable, n):
    "s -> (s0,s1,s2,...sn-1), (sn,sn+1,sn+2,...s2n-1), (s2n,s2n+1,s2n+2,...s3n-1), ..."
    return izip(*[iter(iterable)]*n)

f=open('input', 'r')

output=[]

for line in f:
    line = line.replace("\n", "")
    output.append(line)

for a,b in grouped(output, 2):
    sys.stdout.write(a)
    sys.stdout.write(b)
    sys.stdout.write("\n")

if len(output)%2 == 1:
   sys.stdout.write(output[-1])
   sys.stdout.write("\n")
