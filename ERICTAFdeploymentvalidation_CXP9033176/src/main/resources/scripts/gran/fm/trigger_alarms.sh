
#===================================================================================
#
# FILE: triggeralarm.sh
#
# USAGE: sh triggeralarm.sh <Nodes_File> <NUM_NODES> <NUM_FREQUENCY> <NUM_BURSTS> <NUM_ACTIVE>
#
# DESCRIPTION: Main script to 
#               1)Run alarm burst command on all the selected nodes.
#
# NOTES: ---
#
#===================================================================================

usage(){
    echo "------------------------------------------------------------------"
    echo "Usage: $0 filename Number_of_Nodes Frequency Burst Active NETSIM_SERVER"
    echo "------------------------------------------------------------------"
}

## USAGE ##
if [[ $# -ne 6 ]]
then
usage
fi
##########

numNodes=$2
sel_Nodes=$1
freq=$3
burst=$4
active=$5
Count=0
ssh_port=22
SAR_OPTION=1
sarlogFile="Sar.sar"
#start_time=`date +%s%3N`
truncate -s 0 $sarlogFile

# $start_sar
NETSIM_SERVER=$6
JOB_ID=`date +%s%3n`

sh sarcollect.sh $NETSIM_SERVER $JOB_ID


while read -r line && [[ $Count -lt $numNodes ]]
do
	nodeIP=$(echo $line | awk '{print $2}')
	sh cease_alarm.sh $nodeIP $ssh_port
	 Count=`expr $Count + 1`

done < $sel_Nodes

Count=0

declare -a PIDS
#start_time=`date +%s`
start_time=`date +%s%3N`
while read -r line && [[ $Count -lt $numNodes ]]
do
	nodeIP=$(echo $line | awk '{print $2}')
	echo $nodeIP
	
	sh alarm_exec.sh $nodeIP $ssh_port $freq $burst $active &
	PIDS[${Count}]=$!
	Count=`expr $Count + 1`

done < $sel_Nodes

	

	for((i=0;i<COUNT;i++));
	do
	# Wait for all spawned process to complete
		wait ${PIDS[${i}]}
	done
#stop_time=`date +%s`
stop_time=`date +%s%3N`
sleep 40

# Cease Alarm if needed
#Count=0
#while read -r line && [[ $Count -lt $numNodes ]]
#do
#        nodeIP=$(echo $line | awk '{print $2}')
#        sh cease_alarm.sh $nodeIP $ssh_port
#	 Count=`expr $Count + 1`
#
#done < $sel_Nodes

SARPID=`cat sarpid.txt`

sh sarstop.sh $NETSIM_SERVER $SARPID $JOB_ID $NUM_NODES

#stop_time=`date +%s%3N`
#echo $stop_time
sarf="sar_${JOBID}.log"
#To Calculate SAR
sh calciCPU.sh $sarf

##sh extract_resp.sh $start_time $prmnFilename

echo the start time is $start_time and $stop_time



