#!/bin/bash
#===================================================================================
#
# FILE: commandExecutor.sh
#
# USAGE: called from alarmBurstExecutor.sh
#
# DESCRIPTION:  1) Selects the number of nodes specified and executes alarmburst.
#
# NOTES: ---
# AUTHOR: ZKIDPIY (piyush.kidambi@tcs.com)
# VERSION: 1.0
# CREATED: 
#
#===================================================================================


#declaring variables
SIM_NAME=$1
numFreq=$2
numAlarms=$3
numNodes=$4
simNodes=$5
SAR_OPTION=$6

FILENAME="subCommands"$SIM_NAME".txt"
sarlogFile="sarlog.sar"
outFile="outFile.job"

#main

#Forming select command for all nodes
selectCommand=".select "

selectCommand=$selectCommand$simNodes

numOfAlarms=$((numAlarms/numNodes))

#Collecting traces

alarmBurstId=$(date +%s)

echo ".open" $SIM_NAME >> $FILENAME
echo "$selectCommand" >> $FILENAME
echo "alarmburst:mode=temp,freq="$numFreq",num_alarms="$numOfAlarms",loop=false,cause=1,severity=3,idle_time=0,clear_after_burst=false,id=$alarmBurstId;" >> $FILENAME

#run above commands in netsim_shell
~/inst/netsim_shell < $FILENAME

rm -rf $FILENAME
