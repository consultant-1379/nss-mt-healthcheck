#!/bin/bash

rm -rf shm.mml

echo ".show simulations" | /netsim/inst/netsim_shell  | egrep -v "(default|show)" > simulations.txt

for i in `cat simulations.txt`; do
    echo ".open $i" >> shm.mml
    echo ".select network" >> shm.mml
    echo "ecim_configure_delay:event="activate",restart="no";" >> shm.mml
    echo "configure_async_action:backupload=true,backupfile_size=10M;" >> shm.mml
done

/netsim/inst/netsim_shell < shm.mml

echo ".show allsimnes" | /netsim/inst/netsim_shell | grep -i dg2 |  awk -F" " '$2 ~ /^[0-9]+/ {print $1,$2}' > nodeips.txt

rm -rf simulations.txt
rm -rf shm.mml
