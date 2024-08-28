#!/bin/bash

if [[ $# -ne 5 ]];then
    echo "Invalid number of parameters"
    echo "Usage : $0 <USE_CASE> <TOTAL_TIME> <RESPONSE_TIME> <INITIAL_COUNT_NODES> <FINAL_COUNT_NODES>"
    echo "Note: Both TOTAL TIME and RESPONSE TIME should be in MILLISECONDS"
    exit 1
fi

echo "" >> stats.job
echo "----------------TRY-1----------------" >> stats.job

i=$4
j=$5
flag=0
function=$1
totalTime=$2
responseTime=$3
while [ "$i" -le "$j" ];do
flag=0
sh trigger.sh $i $function $totalTime $responseTime
if [ -s check.job ]
then
 flag=1
fi
if [ "$flag" -eq "1" ]
then
break;
fi
i=$((i+10))
sleep 20
done

echo "" >> stats.job
echo "----------------TRY-2-----------------" >> stats.job

i=$4
while [ "$i" -le "$j" ];do
flag=0
sh trigger.sh $i $function $totalTime $responseTime
if [ -s check.job ]
then
 flag=1
fi
if [ "$flag" -eq "1" ]
then
break;
fi
i=$((i+10))
sleep 20
done
