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

if [[ $# -ne 1 ]]; then
 echo 'USAGE: sh analyzer.sh <JobFile>
        Run script in directory which contains both .job and .sar files are present'
fi

jobfile=$1

# Step -1 : Extract Notifications from  PRMN

# Get latest files from prmn and extract 

PRMN_REQ="/netsim/inst/netsimprmn/"$(ls -Art /netsim/inst/netsimprmn | tail -n 2 | grep .log)
PRMN_RESP="/netsim/inst/prmnresponse/"$(ls -Art /netsim/inst/prmnresponse | tail -n 2| grep .resp)

echo ${PRMN_REQ}
echo ${PRMN_RESP}


REQUEST_FILE="request"
RESPONSE_FILE="response"

cp ${PRMN_REQ} ${PRMN_REQ}_temp
cp ${PRMN_RESP} ${PRMN_RESP}_temp

PRMN_REQUEST=${PRMN_REQ}_temp
PRMN_RESPONSE=${PRMN_RESP}_temp

sed -i -e 's/<.*>//g' ${PRMN_REQUEST}
sed -i -e 's/<.*>//g' ${PRMN_RESPONSE}

sh extract.sh ${PRMN_REQUEST} ${REQUEST_FILE} &
sh extract.sh ${PRMN_RESPONSE} ${RESPONSE_FILE} &

# Wait till extraction completed
wait

cat ${REQUEST_FILE} | sort > ${REQUEST_FILE}_sort
cat ${RESPONSE_FILE} | sort > ${RESPONSE_FILE}_sort

# Step -2 : Extract insights

    JobId=$(echo $jobfile|cut -d"." -f1)
    echo $JobId
    while read -r line;do
        echo $line
        NE=$(echo $line | awk '{print $2}')
	MOS=$(echo $line | awk '{print $5}')
        echo $NE
    # Calculate Time Taken    
	sh aggregate.sh ${NE} ${REQUEST_FILE}_sort ${RESPONSE_FILE}_sort $MOS ${JobId} &

    done<$jobfile
	wait
	startTime=`head -1 ${REQUEST_FILE}_sort | awk '{print $1}'`
	endTime=`tail -1 ${RESPONSE_FILE}_sort | awk '{print $1}'`
    sh calculateCPU.sh "${JobId}.sar" "${startTime}" "${endTime}"

# Step -3 : Cleanup 
rm -rf ${PRMN_REQ}_temp
rm -rf ${PRMN_RESP}_temp
