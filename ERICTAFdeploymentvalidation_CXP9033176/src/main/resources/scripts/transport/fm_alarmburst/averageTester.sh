#!/bin/bash


sleepTime=30
resultFile="result.csv"

nodeStart=$1
nodeStep=$2
freqStep=$3


# Avg Test
# Finding Max Number of nodes support the given frequency

# Incrementing number of nodes by step size if given frequency pass
# if fails fails, increase frequency and start the base number of nodes
 

echo "Average Test" >> $resultFile

# 3 trails
for i in {1..3};do
	step=${nodeStep}
	frequency=0
	while [ true ];do
	nodes=${nodeStart}
	frequency=$((frequency + step))
	alarms=$((nodes*frequency))
	while [ true ];do
		sleep $sleepTime	
		sh alarmBurstExecutor_multiple.sh -n $nodes -a $alarms -f $frequency -o 1
		alarmsSent=$(cat $resultFile | tail -1 | cut -d"," -f 5)
		# Buffer for missed alarms - 3
                buffer=$(( alarms - 3 ))
		if [ $alarms -gt $alarmsSent ];then
			if [ $buffer -le $alarmsSent ]; then
				nodes=$((nodes+nodeStep))
                        	alarms=$((nodes*frequency))
			else
				break
			fi
		else
			
			nodes=$((nodes+nodeStep))
			alarms=$((nodes*frequency))
		fi
	done
	if [[ $nodes -eq 10 ]];then 
		break
	fi
	done
done


