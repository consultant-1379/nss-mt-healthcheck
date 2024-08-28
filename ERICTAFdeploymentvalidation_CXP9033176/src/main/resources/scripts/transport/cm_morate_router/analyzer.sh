#!/bin/bash
#===================================================================================
#
# FILE: analyzer.sh
#
# USAGE: sh analyzer.sh <EXTRACTED_PRMN_REQUEST> <EXTRACTED_PRMN_RESPONSE>
#        run script in directory where .job files are present
#
# DESCRIPTION: 
#              Output File will be <JOB_ID>.job
#              which has to be fed into trigger.sh to trigger fullsync on given number
#              of nodes
#
# NOTES: ---
# AUTHOR: ZPALSRI(srihari.palivela@tcs.com)
# VERSION: 1.0
# CREATED: 15.03.2018 
#
#===================================================================================

if [[ $# -ne 2 ]]; then
 echo 'USAGE: sh analyzer.sh <NUM_NODES> < REQ_MO_RATE>
        Run script in directory which contains both .job and .sar files are present'
exit
fi


jobfile=allNodes.job
NUM_NODES=$1
reqMORate=$2
exitStatus=0



# Step -1 : Extract Notifications from  PRMN

# Get latest files from prmn and extract 

PRMN_REQUEST="/netsim/inst/netsimprmn/"$(ls -Art /netsim/inst/netsimprmn | tail -n 2 | grep .log)
PRMN_RESPONSE="/netsim/inst/prmnresponse/"$(ls -Art /netsim/inst/prmnresponse | tail -n 2| grep .resp)

echo ${PRMN_REQUEST}
echo ${PRMN_RESPONSE}

REQUEST_FILE="request"
RESPONSE_FILE="response"

rm -f ${REQUEST_FILE}
rm -f ${RESPONSE_FILE}

sh extract.sh ${PRMN_REQUEST} ${REQUEST_FILE} &
sh extract.sh ${PRMN_RESPONSE} ${RESPONSE_FILE} &

# Wait till extraction completed
wait


    startTime=999999999999
    endTime=0
    i=0
    echo "NE,StartTime,EndTime,TotalTime,MO Count,MORate" >> result.csv
   # while read -r line;do
while IFS='' read -r line || [[ -n "$line" ]];do
        echo $line
        NE=$(echo $line | awk '{print $1}')
        echo $NE
        MOCount=$(echo $line | awk '{print $5}')
    # Calculate Time Taken    
    # Yang Full Get Time
    StartLine=$(grep "${NE}\"" ${REQUEST_FILE}| grep "CM_SYNC_0" )
    echo $StartLine
    EndLine=$(grep "${NE}\"" ${RESPONSE_FILE}| grep "rpc-reply" | grep "specialGet" )
    echo $EndLine

    Y1sec=$(echo $StartLine | cut -d" " -f1) 
    Y2sec=$(echo $EndLine | cut -d" " -f1)
   # Netconf Full Get Time
    StartLine=$(grep "${NE}\"" ${REQUEST_FILE}| grep "netconf_lang,\"get" )
    echo $StartLine
    N1sec=$(echo $StartLine | cut -d" " -f1)
    EndLine=$(grep "${NE}\"" ${RESPONSE_FILE}| grep '"NETCONF","ECIMDirectAnswer"' | sort | awk -v threshold="$N1sec" '$1 > threshold' | head -1)
    echo $EndLine


    N1sec=$(echo $StartLine | cut -d" " -f1) 
    N2sec=$(echo $EndLine | cut -d" " -f1)
   

 
    if [[ $N2sec > $endTime ]];then
        endTime=$N2sec
    fi
    if [[ $Y1sec < $startTime ]];then
        startTime=$Y1sec
    fi

    # Considering only netconf for calculating MO Rate
    diff=$((N2sec-N1sec))
    diffInSec=`awk "BEGIN {print (${diff}/1000000)}"`

    # Calculate MORate
    MORate=`awk "BEGIN {print (${MOCount}/${diffInSec})}"`
    MORateInt=${MORate%.*}
    if [[ $MORateInt -lt ${reqMORate} ]];then
	exitStatus=1
    fi
    
    echo $NE","$(echo $StartLine | cut -d" " -f3,4)","$(echo $EndLine | cut -d" " -f3,4)","$diff","$MOCount","$MORate >> result.csv
	
    i=$((i+1))
    if [[ $i -ge $NUM_NODES ]];then
        break
    fi

done<$jobfile
    echo "Start Time, End Time, Total Time , AVG CPU, MAX CPU, 100% CPU count" >> result.csv
    echo "${startTime},${endTime},`expr ${endTime} - ${startTime}`" >> result.csv
    sh calculateCPU.sh sarlogFile.sar "${startTime}" "${endTime}"
exit $exitStatus
