#!/bin/bash/

echo ".show started" | /netsim/inst/netsim_shell | grep "6675" | egrep -v "server" | awk '{print $1,$2,$3,$4}' > nodeips.txt
