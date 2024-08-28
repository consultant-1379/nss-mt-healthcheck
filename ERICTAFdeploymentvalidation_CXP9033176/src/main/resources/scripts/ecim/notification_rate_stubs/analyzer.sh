#!/bin/bash
#===================================================================================
#
# FILE: analyzer.sh
#
# USAGE: sh analyzer.sh 
#        run script in directory where .job files are present
# DESCRIPTION: 
#              Input : Takes latest generated prmn request and response files , all ".req"
#              files present in PWD which will be generated when trigger.sh called
#             
#	       Output : Result will be appended to res.csv file.
#
# AUTHOR: ZPALSRI(srihari.palivela@tcs.com)
# VERSION: 1.0
# CREATED: 15.03.2018 
#
#===================================================================================

if [[ $# -ne 0 ]]; then
 echo 'USAGE: sh analyzer.sh  
        Run script in directory where .req files are present'
fi


#PRMN_REQUEST=$(find ~/inst/netsimprmn -mmin -12 | grep Netsimprmn)
#PRMN_RESPONSE=$(find ~/inst/prmnresponse -mmin -12 | grep Prmnresponse)

# Get latest files from prmn and extract 

PRMN_REQUEST="/netsim/inst/netsimprmn/"$(ls -Art /netsim/inst/netsimprmn | tail -n 2 | grep .log)
PRMN_RESPONSE="/netsim/inst/prmnresponse/"$(ls -Art /netsim/inst/prmnresponse | tail -n 1)

REQUEST_FILE="request"
RESPONSE_FILE="response"

sh extractRequest.sh ${PRMN_REQUEST} request &
sh extractResponse.sh ${PRMN_RESPONSE} response &

# Wait till extraction completed
wait

# Init/append to result file
echo "Notifications, Nodes,Notifs/sec, Time" >> res.csv


# Iterate over each run using .req created by trigger.sh

for file in *.req
do
    RUN_ID=$(echo $file | cut -d"." -f1)
    NOTIFS=$(echo ${RUN_ID}|cut -d"_" -f2)
    NES=$(echo ${RUN_ID}|cut -d"_" -f3)


    # Time of first request sent to any node    

    StartTime=$(cat ${REQUEST_FILE} | grep $RUN_ID | sort | head -1 | cut -d" " -f1,2 )

    yyy=$(echo $StartTime | awk '{print $1}' | cut -d'-' -f1)
    mmm=$(echo $StartTime | awk '{print $1}' | cut -d'-' -f2)
    ddd=$(echo $StartTime | awk '{print $1}' | cut -d'-' -f3)
    hh=$(echo $StartTime | awk '{print $2}' | cut -d':' -f1)
    mm=$(echo $StartTime | awk '{print $2}' | cut -d':' -f2)
    ss=$(echo $StartTime | awk '{print $2}' | cut -d':' -f3)

    START_TIME=$(date -d"$yyy-$mmm-$ddd $hh:$mm:$ss" +%s%3N)
    
    START_PLUS_ONE=`expr ${START_TIME} + 1000`
    cat ${RESPONSE_FILE} |grep AVC | grep $RUN_ID"_" > tmp 
    
    COUNT=0
    LAST_NOTIF_TIME=0

    # Iterate through each notification logged in extracted prmn response file

    while read -r  line 
    do
	EndTime=$(echo $line | cut -d" " -f1,2 )
    	yyy=$(echo $EndTime | awk '{print $1}' | cut -d'-' -f1)
    	mmm=$(echo $EndTime | awk '{print $1}' | cut -d'-' -f2)
    	ddd=$(echo $EndTime | awk '{print $1}' | cut -d'-' -f3)
    	hh=$(echo $EndTime | awk '{print $2}' | cut -d':' -f1)
    	mm=$(echo $EndTime | awk '{print $2}' | cut -d':' -f2)
    	ss=$(echo $EndTime | awk '{print $2}' | cut -d':' -f3)

    	END_TIME=$(date -d"$yyy-$mmm-$ddd $hh:$mm:$ss" +%s%3N)
    	
	# Count number of notifications generated in fisrt second
	if [ $END_TIME -le ${START_PLUS_ONE} -a ${END_TIME} -ge ${START_TIME} ]
    	then
    	    COUNT=`expr $COUNT + 1`
    	fi 
    
        # Get Time of last notification
	if [ ${END_TIME} -gt ${LAST_NOTIF_TIME} ] ; then LAST_NOTIF_TIME=${END_TIME};fi
    
     done< tmp
    
    TOTAL_TIME=`expr ${LAST_NOTIF_TIME} - ${START_TIME}`
    COUNT=`expr $COUNT / 2`

    ## Append result of each .req file to result file
    echo $NOTIFS","$NES","$COUNT","${TOTAL_TIME} >> res.csv
    sh calculateCPU.sh "${RUN_ID}.sar" "${START_TIME}" "${LAST_NOTIF_TIME}" > "${RUN_ID}_sar.report"
done
echo "Report of each run appened to res.csv and cpu usage analysis to <RUN_ID>_sar.report"
#Cleanup
rm  tmp

#Print the result file
cat res.csv

