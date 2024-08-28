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

if [[ $# -ne 5 ]];then
    echo "Invalid number of parameters :"$#
    echo "USAGE: sh actionrunner.sh <SIM_NAME> <NES> <NOTIFS> <FREQ> <RUN_ID>"
    exit 1
fi

NE_NAME=$2
SIM=$1
NOTIFS=$3
FREQ=$4
RUN_ID=$5

echo "AVC burst on "${SIM_NAME}" , "$NE_NAME" with frequency :"$FREQ

AVC_ID=$(echo $NE_NAME| cut -c 4,5,15,16,17)

REQ=$(echo 'avcburst:id='9000000',freq='$FREQ',num_events='$NOTIFS',loop=false,avcdata="[{\"ComTop:ManagedElement=%NENAME%\",[{\"siteLocation\",\"'$RUN_ID'_%NENAME%_1\"}]},{\"ComTop:ManagedElement=%NENAME%\",[{\"siteLocation\",\"'$RUN_ID'_%NENAME%_2\"}]}]";')

echo $REQ

echo -e ".open $SIM\n.select $NE_NAME\n.e os:cmd(\"date +%s%3N\").\n$REQ\n" |~/inst/netsim_shell > ${RUN_ID}.req


