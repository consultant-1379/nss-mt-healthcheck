#!/bin/bash
#===================================================================================
#
# FILE: sarCollector.sh
#
# USAGE: sh sarCollector.sh <TIME_TO_COLLECT_LOGS>
#
# DESCRIPTION: Collects CPU, Memory usage by a machine for a given period 
#	       and save in sarlogFile.sar
#       
#
# AUTHOR: ZPALSRI(srihari.palivela@tcs.com)
# VERSION: 1.0
# CREATED: 18.09.2018 
#
#===================================================================================

if [[ $# -ne 1 ]]; then
 echo 'USAGE: sh sarCollector.sh <TIME_TO_COLLECT_LOGS>'
 exit
fi


sleepTime=$1


sarlogFile="sarlogFile.sar"

#generate and delete prmnresponse file
sh generateRequestPrmn.sh 
sh generateResponsePrmn.sh 


#starting sar
sar 1 > $sarlogFile &
sar_pid=$!
echo " Child Pid =" $sar_pid


sleep ${sleepTime}

`kill -9 ${sar_pid}`
echo "Killed Sar"

#generate prmn file
sh generateRequestPrmn.sh
sh generateResponsePrmn.sh

