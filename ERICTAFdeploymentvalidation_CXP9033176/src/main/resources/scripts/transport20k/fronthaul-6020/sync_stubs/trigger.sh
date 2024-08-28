#!/bin/bash
#===================================================================================
#
# FILE: trigger.sh
#
# USAGE: sh trigger.sh <JOB_ID> <JOB_FILE> <LOGGING>
#
# DESCRIPTION: Triggers full sync on nodes parallely using ssh/openssl
#              <JOB_ID> : any string
#              <JOB_FILE> : .job file generated by running collector.sh
#              <LOGGING> : true/false - generates log file per node
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
    echo " USAGE: sh trigger.sh <NETSIM_SERVER> <JOB_ID> <JOB_FILE> <LOGGING> "
    exit
fi

JOB_ID=$2
JOB_FILE=$3
LOGGING=$4
NETSIM_SERVER=$1

#----------------------------------------------------------------------
# Spawns action runner per NE by iterating over .job file
#----------------------------------------------------------------------
declare -a PIDS
COUNT=0
starttime=`date +%s%3N`
#Q=0
#sh start_sar.sh $Q $NETSIM_SERVER
sh sarcollect.sh $NETSIM_SERVER $JOB_ID
PID=`cat sarpid.txt`
while read -r line
do
    PARAMS=$(echo $line | cut -d" " -f 1,2,3,5 )
    sh actionrunner.sh $PARAMS $JOB_ID $LOGGING &
    PIDS[${COUNT}]=$!
    COUNT=`expr $COUNT + 1`
done< $JOB_FILE


for((i=0;i<COUNT;i++));
do
# Wait for all spawned process to complete
wait ${PIDS[${i}]}
done
#Q=1
#sh start_sar.sh $Q $NETSIM_SERVER

endtime=`date +%s%3N`
runtime=`expr $endtime - $starttime`
sh sarstop.sh $NETSIM_SERVER $PID $JOB_ID $JOB_ID $runtime
