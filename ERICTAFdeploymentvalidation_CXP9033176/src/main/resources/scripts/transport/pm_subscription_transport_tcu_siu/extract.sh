#!/bin/bash
#===================================================================================
#
# FILE: extract_prmn.sh
#
# USAGE: sh extrace_prmn.sh <prmn_file> <outputfile>
#
# DESCRIPTION: parses prmn files and generates outputfile containing logs as 
#              below mentioned format
#              <timestamp> <message-id> <node>
#
# NOTES: ---
# AUTHOR: ZKIDPIY
# VERSION: 1.0
# CREATED: 15.03.2018 
#
#===================================================================================


usage(){
    echo "$0 <rop_file> <output_filename> <start_time> <end_time> "
    exit 1
}

if [[ $# -ne 4 ]];then
    usage
fi

#format - time message-id node-name
result=$2
startrop=$3
endrop=$4
#delete generated files
rm -rf $result

s=""
zero=0
space=" "
opening="{"
closing="}"
y=""
nodeName=""
BUFFER=""
while IFS='' read -r line || [[ -n "$line" ]]; do
    
	echo $line | grep "REPORT #"
		

    if [[ $? -eq 0 ]];then
#        echo $BUFFER
         ## Extract Date
	 TIME=`echo ${BUFFER} | awk -F'==' '{print $4}' | awk '{$1=$1};1'`
         EPOCH_TIME=$(date -d"$TIME" +%s)
	 echo ${EPOCH_TIME}
	 if [ ${EPOCH_TIME} -ge ${startrop} ] && [ ${EPOCH_TIME} -le ${endrop} ];then
        	echo ${EPOCH_TIME}$space${BUFFER} >> $result
	 fi 
        BUFFER=$line
    else
	BUFFER=$BUFFER$space$line
    fi

        
done < "$1"

TIME=`echo ${BUFFER} | awk -F'==' '{print $4}' | awk '{$1=$1};1'`
EPOCH_TIME=$(date -d"$TIME" +%s)
 if [ ${EPOCH_TIME} -ge ${startrop} ] && [ ${EPOCH_TIME} -le ${endrop} ];then
                echo ${EPOCH_TIME}$space${BUFFER} >> $result
         fi

