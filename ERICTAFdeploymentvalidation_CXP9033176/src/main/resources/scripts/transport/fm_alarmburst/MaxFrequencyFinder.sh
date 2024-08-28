#!/bin/bash

sleepTime=30
nodeFrequency=75
stepSize=3

resultFile="result.csv"

for i in {1..2};do
        prevFrequency=0
        nodes=3
        alarms=$((nodes*nodeFrequency))   # Using double of frequency
        while [ true ];do
		echo "run "$nodes
                sleep $sleepTime
                sh alarmBurstExecutor_multiple.sh -n $nodes -a $alarms -f $nodeFrequency -o 1
                runFrequency=$(cat $resultFile | tail -1 | cut -d"," -f 5)
		echo "Run Frequency :"$runFrequency
                if [ $runFrequency -lt $prevFrequency ];then
                                break
                else
                        prevFrequency=$runFrequency
                        nodes=$((nodes+stepSize))
                        alarms=$((nodes*nodeFrequency))
                fi
        done
done
                           
