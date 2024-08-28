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

if [[ $# -ne 4 ]];then
    echo "Invalid number of parameters"
    echo "USAGE : sh trigger.sh <NUM_NOTIFS> <NUM_NODES> <JOB_FILE> <SAR_LOG>"
    echo "SAR_LOG can be true/false"
    exit
fi

NUM_NOTIFS=$1
NUM_NODES=$2
JOB_FILE=$3
SAR=$4
TMP_FILE="tmp.txt"
RUN_ID=$(echo $JOB_FILE | cut -d"." -f1)_${NUM_NOTIFS}_${NUM_NODES}
RUN_FILE="${RUN_ID}.run"


#shuffiling nodes for randomness
#cat ${JOB_FILE} | head -60 | sort -R  > $TMP_FILE
cat ${JOB_FILE} > $TMP_FILE

cat ${TMP_FILE} | head -${NUM_NODES} > ${RUN_FILE}

NOTIFS=`expr $NUM_NOTIFS / $NUM_NODES`

## Frequency was caluculated by finding max threshold of notifications 
## that can be sent by a single node in a second multiplied by 100

FREQ=400000

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

declare -a SIMS
declare -a NES_ARRAY
declare -a PIDS
    while read -r line && [[ $COUNT -lt $NUM_NODES ]] 
    do
        CURR_SIM=$( echo $line | cut -d" " -f 5)
	echo $CURR_SIM "==" $SIM
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
    for ((i=0;i<INDEX;i++)); 
    do 
    	echo $i
    	echo ${SIMS[${i}]} ${NES_ARRAY[${i}]}	
    	sh actionrunner.sh "${SIMS[${i}]}" "${NES_ARRAY[${i}]}" $NOTIFS $FREQ $RUN_ID& 
	PIDS[${i}]=$!
    done 
    echo $SIM $NES
    sh actionrunner.sh "${SIM}" "${NES}" $NOTIFS $FREQ $RUN_ID&
    PIDS[${INDEX}]=$! 

for((i=0;i<=INDEX;i++));
do
# Wait for all spawned process to complete
wait ${PIDS[${i}]}
done
if [[ $SAR ]];then
    `kill -9 ${child_pid}`  
fi
rm -f $TMP_FILE
