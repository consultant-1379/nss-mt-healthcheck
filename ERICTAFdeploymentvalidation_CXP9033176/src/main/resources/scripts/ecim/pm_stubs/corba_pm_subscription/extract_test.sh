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
    echo "$0 <prmn_file> <output_filename>"
    exit 1
}

if [[ $# -ne 3 ]];then
    usage
fi

#format - time message-id node-name
result=$2
NE=$3
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
    if [[ "$line" == "[]." ]]; then continue;fi
    for (( i=0; i<${#line}; i++ )); do
        if [[ "${line:$i:1}" == "$opening" ]];then
            cnt=$((cnt+1))
        elif [[ "${line:$i:1}" == "$closing" ]];then
            cnt=$((cnt-1))
        fi
    done

        BUFFER=$BUFFER$line
    if [[ "$cnt" -eq "$zero" ]];then
        echo $BUFFER | grep ${NE}
         ## Extract Date
        if [[ $? -eq 0 ]];then
        NE=$(echo $BUFFER | awk -F"{" '{print $6}'| cut -d"," -f1)
        echo $NE" "  ${BUFFER}>> $result
        fi
        BUFFER=""
    fi
        
done < "$1"

