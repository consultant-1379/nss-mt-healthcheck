#!/bin/bash/

echo ".show started" | /netsim/inst/netsim_shell | grep "ESC" | egrep -v "server" | awk '{print $1,$2,$12}' > nodes.txt
#echo ".show started" | /netsim/inst/netsim_shell | grep "ML6352-R2-8x50-04" | egrep -v "server" | awk '{print "ML6352-R2-8x50-04",$1,$2,$3,$4}' > 04.txt
#echo ".show started" | /netsim/inst/netsim_shell | grep "ML6352-R2-8x50-03" | egrep -v "server" | awk '{print "ML6352-R2-8x50-03",$1,$2,$3,$4}' > 03.txt
#echo ".show started" | /netsim/inst/netsim_shell | grep "ML6352-R2-8x50-02" | egrep -v "server" | awk '{print "ML6352-R2-8x50-02",$1,$2,$3,$4}' > 02.txt
#echo ".show started" | /netsim/inst/netsim_shell | grep "ML6352-R2-8x50-01" | egrep -v "server" | awk '{print "ML6352-R2-8x50-01",$1,$2,$3,$4}' > 01.txt
