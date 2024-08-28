#!/bin/bash


sleepTime=30
resultFile="result.csv"


# Find max alarms that can be sent by a single node in 1 sec - max node frequency

#echo "Finding Max Node Frequency" >> $resultFile

maxFrequency=5
# 3 trails
for i in {1..2};do
        nodes=1
        frequency=5
        alarms=10   # Using double of frequency
        while [ true ];do
                sleep $sleepTime
                sh alarmBurstExecutor_multiple.sh -n $nodes -a $alarms -f $frequency -o 1
                runFrequency=$(cat $resultFile | tail -1 | cut -d"," -f 5)
                if [ $runFrequency -lt $frequency ];then
                                break
                else
			maxFrequency=$frequency
			frequency=$((frequency+5))
			alarms=$((frequency*2))
                fi
        done
done   


# Peak
sleepTime=30
nodeFrequency=$maxFrequency
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



