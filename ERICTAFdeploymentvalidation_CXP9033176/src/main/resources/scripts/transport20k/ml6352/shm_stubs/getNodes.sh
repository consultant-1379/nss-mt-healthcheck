#!/bin/bash/

echo ".show started" | /netsim/inst/netsim_shell | grep "ML6352" | egrep -v "server" | awk '{print "$1,$2}' > nodeips.txt
