#! /bin/bash

Part1=`date +%Y,%m,%d | sed 's/,0/,/g'`
CurrHour=`date +%H`
PrevHour=$((CurrHour-1))



echo $Part1","$CurrHour



/usr/bin/expect << EOF



EOF
