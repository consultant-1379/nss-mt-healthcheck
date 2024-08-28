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
 echo 'USAGE: sh analyzer.sh <NUM_NODES> <REQ_RATE>
        Run script in directory which contains both .job and .sar files are present'
exit
fi

jobfile="allNodes.job"
NUM_NODES=$1
REQ_RATE=$2
# Step -1 : Extract Notifications from  PRMN

# Get latest files from prmn and extract 

PRMN_REQ="/netsim/inst/netsimprmn/"$(ls -Art /netsim/inst/netsimprmn | tail -n 2 | grep .log)
PRMN_RESP="/netsim/inst/prmnresponse/"$(ls -Art /netsim/inst/prmnresponse | tail -n 2| grep .resp)

echo ${PRMN_REQ}
echo ${PRMN_RESP}


REQUEST_FILE="request"
RESPONSE_FILE="response"
RES_FILE="result.csv"
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
    i=0
    while read -r line;do
        echo $line
        NE=$(echo $line | awk '{print $1}')
        echo $NE
        # Calculate Time Taken    
	startNE=`grep "$NE\"" ${REQUEST_FILE}_sort| grep "create_performance_monitoring" | cut -d" " -f1`
	endNE=`grep "$NE\"" ${RESPONSE_FILE}_sort| grep "resume_performance_monitoring" | cut -d" " -f1` 
	timetakenNE=`expr $endNE - $startNE`
	total=`awk "BEGIN {print (${timetakenNE}/1000000)}"`
	echo "$NE $startNE $endNE $total" >> "${RES_FILE}"
	i=$((i+1))
	if [[ $i -ge $NUM_NODES ]];then
		break
	fi

    done<$jobfile
	wait
	startTime=`head -1 ${REQUEST_FILE}_sort | awk '{print $1}'`
	echo $startTime
	startPlusOne=`expr $startTime + 1000000 `
	echo $startPlusOne
        subsPerSec=`cat ${RESPONSE_FILE}_sort| grep "resume_performance_monitoring" |awk -v threshold="$startPlusOne" '$1 <= threshold' | wc -l`
	endTime=`tail -1 ${RESPONSE_FILE}_sort | awk '{print $1}'`
        totalTime=`expr $endTime - $startTime`
	totalNodes=`cat $jobfile | wc -l`
	timePerNode=`awk "BEGIN {print (${totalTime}/${totalNodes})}"`
	timePerNodeSec=`awk "BEGIN {print (${timePerNode}/1000000)}"`
        echo "Total Time : ${totalTime}" >> "${RES_FILE}"
	echo "Node Count : ${NUM_NODES}" >> "${RES_FILE}"
	echo "Total Subscriptions per sec : ${subsPerSec}" >> "${RES_FILE}"
	echo "Time taken per node : ${timePerNodeSec}"  >> "${RES_FILE}"
    sh calculateCPU.sh "sarLog.sar" "${startTime}" "${endTime}"

# Step -3 : Cleanup 
rm -rf ${PRMN_REQ}_temp
rm -rf ${PRMN_RESP}_temp

if [[ $subsPerSec -lt ${REQ_RATE} ]];then
        exit 0
else
	exit $subsPerSec
fi
