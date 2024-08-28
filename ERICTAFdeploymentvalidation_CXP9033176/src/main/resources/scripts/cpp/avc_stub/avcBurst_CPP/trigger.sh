#!/bin/bash
#===================================================================================
#
# FILE: trigger.sh
#
# USAGE: sh trigger.sh <NUM_NOTIFS> <NUM_NODES> <JOB_FILE> <SAR>
#
# DESCRIPTION: Triggers will start  avc burst nodes parallely
#       
#This will spawn the script  actionrunner.sh per simulation(all nodes) ||le execution.
#
# NOTES: Make sure to run the script from enviroment where NE IP are pingable
#        like MSCM server 
#
# AUTHOR: ZPALSRI(srihari.palivela@tcs.com)
# VERSION: 1.0
# CREATED: 15.03.2018 
#
#===================================================================================

if [[ $# -ne 6 ]];then
    echo "Invalid number of parameters"
    echo "USAGE : sh trigger.sh <NUM_NOTIFS> <NUM_NODES> <JOB_FILE> <SAR_LOG> <FREQ> <AVC_ID>"
    echo "SAR_LOG can be true/false"
    exit
fi

NUM_NOTIFS=$1
NUM_NODES=$2
JOB_FILE=$3
SAR=$4
FREQ=$5
AVC_ID=$6
TMP_FILE="tmp.txt"
RUN_ID=$(echo $JOB_FILE | cut -d"." -f1)_${NUM_NOTIFS}_${NUM_NODES}
RUN_FILE="${RUN_ID}.run"


cat ${JOB_FILE} > $TMP_FILE

cat ${TMP_FILE} | head -${NUM_NODES} > ${RUN_FILE}

NOTIFS=`expr $NUM_NOTIFS / $NUM_NODES`


if [[ $SAR ]]; then
    sar 1  > ${RUN_ID}.sar &
    child_pid=$!
    echo " child pid = $child_pid"
fi
NES=""
SPACE=" "
SIM=$(cat $JOB_FILE |head -1 | cut -d" " -f 5)
COUNT=0
INDEX=0
zero=0
fl=0

declare -a SIMS
declare -a NES_ARRAY
declare -a PIDS
    while read -r line && [[ $COUNT -lt $NUM_NODES ]] 
    do
        CURR_SIM=$( echo $line | cut -d" " -f 5)
	#echo $CURR_SIM "==" $SIM
        if [[ "$CURR_SIM" == "$SIM" ]]; then
        	NES=$NES$(echo $line | cut -d" " -f 1)$SPACE
	else
		SIMS[${INDEX}]="${SIM}"
 		NES_ARRAY[${INDEX}]="${NES}"
		NES=$(echo $line | cut -d" " -f 1)$SPACE
		SIM=$CURR_SIM
		INDEX=`expr $INDEX + 1`
	fi
		
        COUNT=`expr $COUNT + 1`
    done< $RUN_FILE
     
    for ((i=0;i<$INDEX;i++)); 
    do 
    	sh actionrunner.sh "${SIMS[${i}]}" "${NES_ARRAY[${i}]}" $NOTIFS $FREQ $RUN_ID $AVC_ID &
	PIDS[${i}]=$!
    done 
    sh actionrunner.sh "${SIM}" "${NES}" $NOTIFS $FREQ $RUN_ID $AVC_ID & 
    PIDS[${INDEX}]=$! 


for((i=0;i<=$INDEX;i++));
do
# Wait for all spawned process to complete
wait ${PIDS[${i}]}
done
sleep 10
if [[ $SAR ]];then
    `kill -9 ${child_pid}`
fi
rm -f $TMP_FILE


outputFile="finalFile.txt"

echo "-----------------------------------------------------------" >> $outputFile
echo "Expected Number Of notifications -> " $NUM_NOTIFS >> $outputFile
echo "Frequency -> " $FREQ >> $outputFile
echo "Number of Nodes -> " $NUM_NODES >> $outputFile
