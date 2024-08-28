#!/bin/bash
#===================================================================================
#
# FILE: trigger.sh
#
# USAGE: sh trigger.sh <NUM_NOTIFS> <NUM_NODES> <JOB_FILE> <SAR>
#
# DESCRIPTION: Triggers will start  alarms burst nodes parallely
#
#This will spawn the script  actionrunner.sh per each node for ||le execution.
#
# NOTES: Make sure to run the script from enviroment where NE IP are pingable
#        like MSCM server
#
# AUTHOR: ZPALSRI(srihari.palivela@tcs.com)
# VERSION: 1.0
# CREATED: 15.03.2018
#
#===================================================================================
if [[ $# -ne 6 ]] ; then
    echo "Invalid number of parameters"
    echo "USAGE : sh trigger.sh <NUM_NOTIFS> <NUM_NODES> <JOB_FILE> <SAR_LOG> <FREQ> <totalSecondsToCheck>"
    echo "SAR_LOG can be true/false"
    exit
fi

#generate PRMNresponse and clean
sh generatePrmn.sh
sh clean.sh


NUM_NOTIFS=$1
NUM_NODES=$2
JOB_FILE=$3
SAR=$4
FREQ=$5
totalCheckSec=$6


TMP_FILE="tmp.txt"
RUN_ID=$(echo $JOB_FILE | cut -d"." -f1)_${NUM_NOTIFS}_${NUM_NODES}
RUN_FILE="${RUN_ID}.run"


cat ${JOB_FILE} > $TMP_FILE

cat ${TMP_FILE} | head -${NUM_NODES} > ${RUN_FILE}

#NOTIFS=`expr $NUM_NOTIFS / $NUM_NODES`


if [[ $SAR ]]; then
    sar 1  > ${RUN_ID}.sar &
    child_pid=$!
    echo " child pid = $child_pid"
fi
NES=""
SPACE=" "
SIM=$(cat $JOB_FILE |head -1 | awk '{print $5}')
COUNT=0
INDEX=0
zero=0
fl=0

declare -a SIMS
declare -a NES_ARRAY
declare -a PIDS
#echo "nodes getting into array"
    while read -r line && [[ $COUNT -lt $NUM_NODES ]]
    do
        CURR_SIM=$( echo $line | awk '{print $5}')
	#echo $CURR_SIM "==" $SIM
        if [[ "$CURR_SIM" == "$SIM" ]]; then
		#echo "if $SIM "
        	NES=$NES$(echo $line | awk '{print $1}')$SPACE
	else
		#echo "else sim == $SIM"
		SIMS[${INDEX}]="${SIM}"
 		NES_ARRAY[${INDEX}]="${NES}"
		NES=$(echo $line | awk '{print $1}')$SPACE
		SIM=$CURR_SIM
		INDEX=`expr $INDEX + 1`
	fi

        COUNT=`expr $COUNT + 1`
    done< $RUN_FILE

	#echo "starting parallel actionrunner"
    ind=0
	#echo index is $INDEX $COUNT $SIM $NES
    for ((i=0;i<$INDEX;i++))
    do
		echo  avc paralell loop and  node$i
	    	echo ${SIMS[${i}]} --${NES_ARRAY[${i}]}
		sh actionrunner.sh  "${SIMS[${i}]}" "${NES_ARRAY[${i}]}" $NUM_NOTIFS $FREQ $RUN_ID $totalCheckSec &
		PIDS[${i}]=$!
    done
	echo node last
        sh actionrunner.sh "${SIM}" "${NES}" $NUM_NOTIFS $FREQ $RUN_ID $totalCheckSec &
        PIDS[${INDEX}]=$!


for((i=0;i<=$INDEX;i++))
do
# Wait for all spawned process to complete
wait ${PIDS[${i}]}
done
sleep $totalCheckSec

#stopburst on all started nodes after sleep
stopburstFile="stopburstFile.txt"
for ((i=0;i<$INDEX;i++))
do
	echo for stop burst
	echo ".open ${SIMS[${i}]}" >> $stopburstFile
	echo ".select ${NES_ARRAY[${i}]}" >> $stopburstFile
	echo "stopburst:id=all;" >> $stopburstFile
done

echo ".open ${SIM}" >> $stopburstFile
echo ".select ${NES}" >> $stopburstFile
echo "stopburst:id=all;" >> $stopburstFile

~/inst/netsim_shell < $stopburstFile



if [[ $SAR ]];then
    `kill -9 ${child_pid}`
fi
rm -f $TMP_FILE


outputFile="outFile.job"
finalFile="finalFile.job"
finalAll="finalAll.job"
echo "-----------------------------------------------------------" >> $outputFile
echo "Expected Number Of notifications -> " $NUM_NOTIFS >> $outputFile
echo "Frequency -> " $FREQ >> $outputFile
echo "Number of Nodes -> " $NUM_NODES >> $outputFile
echo " " >> $finalAll
printf " $finalAll"
printf "$NUM_NOTIFS $FREQ $NUM_NODES" >> $finalAll

#generate PRMNresponse and clean
sh generatePrmn.sh
prmnFilename=$(find . -name "*.resp" | awk -F\/ '{print $2}')

sh responseTime.sh $prmnFilename $totalCheckSec
