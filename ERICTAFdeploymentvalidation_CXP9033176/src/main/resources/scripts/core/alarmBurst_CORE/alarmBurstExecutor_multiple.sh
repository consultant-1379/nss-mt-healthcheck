#!/bin/bash
#===================================================================================
#
# FILE: alarmBurstExecutor.sh
#
# USAGE: sh alarmBurstExecutor.sh -s <SIM_NAME>  -n <NUM_NODES> -a <NUM_ALARMS> -f <NUM_FREQUENCY> -o <SAR_OPTION>(Set/Unset)
#
# DESCRIPTION: Main script to 
#               1) Get names and ip of all the started CPP nodes
#               2) Subscripe all the nodes with RANOS
#               3) Select number of nodes specified based on server and execute alarmburst.
#               4) Collect and analyse logs 
#
# NOTES: ---
# AUTHOR: ZKIDPIY (piyush.kidambi@tcs.com)
# VERSION: 1.0
# CREATED: 
#
#===================================================================================



usage(){
    echo "$0 args
    -n <NUM_NODES>
    -a <NUM_ALARMS>
    -f <NUM_FREQUENCY>
    -o <SAR_OPTION> (0 - OFF(by default)/ 1 - ON)"

    exit 1
}

#main


#declaring variables
NUM_STEPS=""
SAR_OPTION=0
SIM_NAME=""
NUL_FREQ=0
ALARM_STEPS=""
dot="."
cnt=1
saveNodeFilename="saveNodeFilename.txt"
allNodes="allNodes.job"
sarlogFile="sarlogFile.sar"
ceaseFile="ceaseFile.run"

while getopts ":n:f:a:o:" opt
do
     case $opt in
    n) NUM_NODES="$OPTARG"
    ;;
    f) NUM_FREQ="$OPTARG"
    ;;
    a) NUM_ALARMS="$OPTARG"
    ;;
    o) SAR_OPTION="$OPTARG"
    ;;
    \?)
    usage
    ;;
    :)
    usage
    ;;
    esac
done

if [ $OPTIND -eq 1 ]; then 
    echo "No args were passed"
    usage
fi

#generate and delete prmnresponse file
sh generatePrmn.sh 


#starting sar
if [[ $SAR_OPTION == 1 ]];then
    sar 1 > $sarlogFile &
    child_pid=$!
    echo " Child Pid =" $child_pid
fi


	#selecting the specified number of nodes(from multiple simulations)
	SIM=$(cat $allNodes | head -1 | awk '{print $3}')
	INDEX=0
	COUNT=0
	SPACE=" "
	NES=""
	declare -a SIMS
	declare -a NES_ARRAY
	declare -a PIDS
    	while read -r line && [[ $COUNT -lt $NUM_NODES ]] 
    	do
        	CURR_SIM=$( echo $line | awk '{print $3}')
		nodeNameC=$(echo $line | awk '{print $1}')
		echo ".open $CURR_SIM" >> $ceaseFile
		echo ".select $nodeNameC" >> $ceaseFile
		echo "ceasealarm:all;" >> $ceaseFile
	
		if [[ "$CURR_SIM" == "$SIM" ]]; then
        		NES=$NES$(echo $line | awk '{print $1}')$SPACE
		else
			SIMS[${INDEX}]="${SIM}"
 			NES_ARRAY[${INDEX}]="${NES}"
			NES=$(echo $line | awk '{print $1}')$SPACE
			SIM=$CURR_SIM
			INDEX=`expr $INDEX + 1`
		fi
        	COUNT=`expr $COUNT + 1`
    	done< $allNodes
	
	outFile="outFile.job"
	finalFile="finalFile.job"
echo "-------------------------------------------------------" >> $outFile
echo "Expected Number of Alarms -> " $NUM_ALARMS >> $outFile
echo "Number of Nodes -> " $NUM_NODES >> $outFile
echo "Frequrency -> " $NUM_FREQ >> $outFile
echo $NUM_NODES $NUM_ALARMS $NUM_FREQ >> $finalFile
	
     
    	for ((i=0;i<$INDEX;i++)); 
    	do 
    		sh commandExecutor.sh "${SIMS[${i}]}" "$NUM_FREQ" "$NUM_ALARMS" "$NUM_NODES" "${NES_ARRAY[${i}]}" "$SAR_OPTION" &
		PIDS[${i}]=$!
	done 
	sh commandExecutor.sh "${SIM}" "$NUM_FREQ" "$NUM_ALARMS" "$NUM_NODES" "${NES}" "$SAR_OPTION" &
	PIDS[${INDEX}]=$! 
	
	for((i=0;i<=INDEX;i++));
	do
	# Wait for all spawned process to complete
		wait ${PIDS[${i}]}
	done

sleep 10


if [[ $SAR_OPTION ]];then
    `kill -9 ${child_pid}`
fi

sh generatePrmn.sh
#sleep 3
prmnFilename=$(find . -name "*.resp" | awk -F\/ '{print $2}')

sh responseTime.sh $prmnFilename
