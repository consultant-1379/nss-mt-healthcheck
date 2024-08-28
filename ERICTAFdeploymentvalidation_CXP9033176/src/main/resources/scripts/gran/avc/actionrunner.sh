#!/bin/bash
#===================================================================================
#
# FILE: actionrunner.sh
#
# USAGE: sh actionrunner.sh <NES> <SIM_NAME> <NOTIFS> <FREQ> <RUN_ID>
#
# DESCRIPTION: Enables avc burst on a dg2  node.
#
# NOTES: ---
# AUTHOR: ZPALSRI(srihari.palivela@tcs.com)
# VERSION: 1.0
# CREATED: 21.03.2018
#
#===================================================================================

if [[ $# -ne 6 ]];then
    echo "Invalid number of parameters :"$#
    echo "USAGE: sh actionrunner.sh <SIM_NAME> <NES> <NOTIFS> <FREQ> <RUN_ID> <totalCheckSec>"
    exit 1
fi

NE_NAME=$2
SIM=$1
NOTIFS=$3
FREQ=$4
LOG_FILE="/netsim/inst/tmp_p.log"
TMP_FILE="tmpFile.txt"
RUN_ID=$5
AVC_ID=$(echo $RANDOM)
#AVC_ID=`date +%s%3N`
let AVC_ID=AVC_ID+1
totalCheckSec=$6

echo $NE_NAME and Sim is $SIM ====== AvC id ---$AVC_ID

REQ=$(echo 'avcburst:id='$AVC_ID',freq='$FREQ',num_events='$NOTIFS',loop=false,avcdata="[{\"ComTop:ManagedElement=%NENAME%\",[{\"siteLocation\",\"'$RUN_ID'_%NENAME%_1\"}]},{\"ComTop:ManagedElement=%NENAME%\",[{\"siteLocation\",\"'$RUN_ID'_%NENAME%_2\"}]}]";')
#echo action $SIM $NE_NAME
echo ".open $SIM" >> $TMP_FILE
echo ".select $NE_NAME" >> $TMP_FILE
echo "stopburst:id=all;" >> $TMP_FILE
echo $REQ >> $TMP_FILE


~/inst/netsim_shell < $TMP_FILE
rm -rf $TMP_FILE
