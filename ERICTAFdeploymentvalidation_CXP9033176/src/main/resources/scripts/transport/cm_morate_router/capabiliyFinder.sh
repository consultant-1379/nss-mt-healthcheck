#!/bin/bash


if [[ $# -ne 3 ]];then
    echo "Invalid number of parameters"
    echo " USAGE: sh trigger.sh <START> <STEP> <REQ_MORATE>"
    exit
fi


sleepTime=30
resultFile="result.csv"
LOG="capabilityfinder.log"

REQ_MORATE=$3

START=$1
STEP=$2
MAX=`cat allNodes.job | wc -l`

for i in {1..2};do
	NODES=$START
	while [ true ];do
		echo "Triggering on $NODES nodes"	
		sh trigger.sh $NODES >/dev/null 
		sleep 10
		sh analyzer.sh $NODES ${REQ_MORATE} > /dev/null
		if [[ $? -eq 1 ]];then
			break
		fi
		NODES=$(( NODES + STEP))

		sleep $sleepTime
		if [[ $NODES -gt $MAX ]];then
			break
		fi
	done
done


