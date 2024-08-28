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

if [[ $# -ne 7 ]];then
    echo "Invalid number of parameters :"$#
    echo "USAGE: sh actionrunner.sh <SIM_NAME> <NES> <NOTIFS> <FREQ> <RUN_ID> <AVC_ID> <totalCheckSec>"
    exit 1
fi

NE_NAME=$2
SIM=$1
NOTIFS=$3
FREQ=$4
LOG_FILE="/netsim/inst/tmp_p.log"
TMP_FILE="tmpFile.txt"
RUN_ID=$5
AVC_ID=$6
totalCheckSec=$7

REQ=$(echo 'avcburst:id='$AVC_ID',freq='$FREQ',num_events='$NOTIFS',loop=true,avcdata="[{\"ComTop:ManagedElement=%NENAME%\",[{\"siteLocation\",\"'$RUN_ID'_%NENAME%_1\"}]},{\"ComTop:ManagedElement=%NENAME%\",[{\"siteLocation\",\"'$RUN_ID'_%NENAME%_2\"}]}]";')

echo ".open $SIM" >> $TMP_FILE_$SIM
echo ".select $NE_NAME" >> $TMP_FILE_$SIM
echo "stopburst:id=all;" >> $TMP_FILE_$SIM
echo $REQ >> $TMP_FILE_$SIM


~/inst/netsim_shell < $TMP_FILE_$SIM
rm -rf $TMP_FILE_$SIM
