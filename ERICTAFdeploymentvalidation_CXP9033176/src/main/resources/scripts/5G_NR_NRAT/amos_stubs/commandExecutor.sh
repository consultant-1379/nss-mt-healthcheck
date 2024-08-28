#!/bin/bash
#===================================================================================
#
# FILE: commands.sh
#
# USAGE: sh commandExecutor.sh -n <TOTAL_NODES> -t <TIMEOUT_SEC>
#
# DESCRIPTION:
#
# NOTES: ---
# AUTHOR: ZKIDPIY (piyush.kidambi@tcs.com)
# VERSION: 1.0
# CREATED:
#
#===================================================================================



usage(){
    echo "$0 args
     -s <NETSIM_SERVER>
     -n <TOTAL_NODES>
     -t <TIMEOUT_SEC>"

    exit 1
}


#declaring the variables
NE_NAME=""
NE_IP=""
IS_TLS=1
JOB_ID=""
LOGGING="true"
SSH_PORT=22
TIMEOUT_SEC=""
allNodes="allNodes.txt"
cnt=1
ALL_LOGS_FILE="all_logs_file.txt"
LPATH="logs_amos"
startTimeFile="startTimeFile.txt"
endTimeFile="endTimeFile.txt"
sarlogFile="/netsim/sarlog.log"

#main
while getopts ":s:n:t:" opt
do
    case $opt in
	s) NETSIM_SERVER="$OPTARG"
	;;
        n) TOTAL_NODES="$OPTARG"
        ;;
        t) TIMEOUT_SEC="$OPTARG"
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

#sh findNodes.sh
Q=0
JOB_ID="amos"

#sh start_sar.sh $Q
sh sarcollect.sh $NETSIM_SERVER $JOB_ID
SARPID=`cat sarpid.txt`
while IFS='' read -r line || [[ -n "$line" ]]; do
    NE_NAME=$(echo $line | awk '{print $1}')
    NE_IP=$(echo $line | awk '{print $2}')
    timeout $TIMEOUT_SEC sh ltallCommands.sh $NE_NAME $NE_IP $IS_TLS $cnt $LOGGING $SSH_PORT &
    #sh ltallCommands.sh $NE_NAME $NE_IP $IS_TLS $cnt $LOGGING $SSH_PORT

    cnt=$((cnt+1))
    if [[ $cnt -gt $TOTAL_NODES ]];then
        break
    fi
done < "$allNodes"
wait

#When all the commands are not executed for a node (when timeout is less than required for a node) endTimeFile.txt will not be created.
#To handle this case
#echo "`date +%s`" >> $endTimeFile

totalCommands=0

while IFS='' read -r line || [[ -n "$line" ]]; do
    fname=$(echo $line | awk '{print $1}')
    #   echo $fname
    tempcommands=$(grep -nri ">" $fname | wc -l)
    totalCommands=$((totalCommands+tempcommands))
    lastCommand=$(grep -nri ">" $fname | tail -1)
    lastLine=$(cat $fname |grep -nri ">" | tail -1)
    if [[ "$lastCommand" == "$lastLine" ]];then
        totalCommands=$((totalCommands-1))
    fi
    #       echo $totalCommands
done < "$ALL_LOGS_FILE"

#Finding max and min time
maxTime=$(awk 'BEGIN{x=-2147483648};$0>x{x=$0};END{print x}' $endTimeFile)
minTime=$(awk 'BEGIN{x=2147483648};$0<x{x=$0};END{print x}' $startTimeFile)

totalTimeTaken=$((maxTime-minTime))

if [[ $totalTimeTaken -gt $TIMEOUT_SEC ]];then
    totalTimeTaken=$TIMEOUT_SEC
fi


echo "----------------------------------------------------------------------"
echo "Number of Nodes - " $TOTAL_NODES
echo "Total Commands- " $totalCommands
echo "Total Time taken - " $totalTimeTaken
#sh calculateIdle.sh $sarlogFile $minTime $maxTime

echo "sh calculateIdle.sh" $TOTAL_NODES $minTime $maxTime
echo "----------------------------------------------------------------------"
#Q=1
#sh start_sar.sh $Q

sh sarstop.sh $NETSIM_SERVER $SARPID $JOB_ID $TOTAL_NODES $totalTimeTaken
#sh calculateIdle.sh $JOB_ID $minTime $maxTime

#sh killProcess.sh
#rm -rf $allNodes
rm -rf $ALL_LOGS_FILE
rm -rf $startTimeFile
rm -rf $endTimeFile
#rm -rf $sarlogFile

