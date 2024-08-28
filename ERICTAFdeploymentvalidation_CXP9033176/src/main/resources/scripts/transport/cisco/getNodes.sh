#!/bin/bash/

echo ".show started" | /netsim/inst/netsim_shell | grep "CISCO" | egrep -v "server" | awk '{print "default",$1,$2,$3,$4}' > nodeips.txt
