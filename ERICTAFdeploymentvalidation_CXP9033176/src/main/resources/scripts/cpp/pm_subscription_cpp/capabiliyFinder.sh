#!/bin/bash


if [[ $# -ne 3 ]];then
    echo "Invalid number of parameters"
    echo " USAGE: sh capabilityFinder.sh <TYPE> <START> <STEP> "
    exit
fi


sleepTime=30
resultFile="result.csv"
LOG="capabilityfinder.log"

REQ_RATE=0

TYPE=$1
START=$2
STEP=$3
MAX=`cat allNodes.job | wc -l`

for i in {1..2};do
	NODES=$START
	while [ true ];do
		echo "Triggering on $NODES nodes"	
		sh trigger.sh $TYPE $NODES >/dev/null 
		sleep 10
		sh analyzer.sh $NODES ${REQ_RATE} > /dev/null
		REQ_RATE=$?
		echo "Result : $REQ_RATE" >> $LOG
		if [[ ${REQ_RATE} -eq 0 ]];then
			break
		fi
		NODES=$(( NODES + STEP))
		sleep $sleepTime
		if [[ $NODES -gt $MAX ]];then
			break
		fi
	done
done


