#!/bin/bash/

echo ".show started" | /netsim/inst/netsim_shell | grep "ML6352" | egrep -v "server" | awk '{print "ML6691-1-5x20-01",$1,$2,$3,$4}' > nodeips.txt
