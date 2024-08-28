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

if [[ $# -ne 2 ]];then
    usage
fi

#format - time message-id node-name
result=$2

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
    for (( i=0; i<${#line}; i++ )); do
        if [[ "${line:$i:1}" == "$opening" ]];then
            cnt=$((cnt+1))
        elif [[ "${line:$i:1}" == "$closing" ]];then
            cnt=$((cnt-1))
        fi
    done

        BUFFER=$BUFFER$line
    if [[ "$cnt" -eq "$zero" ]];then
#        echo $BUFFER
         ## Extract Date
            yyy=$(echo $BUFFER | awk -F\, '{print $2}' | cut -c 3-)
            mmm=$(echo $BUFFER | awk -F\, '{print $3}')
            ddd=$(echo $BUFFER | awk -F\, '{print $4}')
            ddd=$(echo ${ddd%?})

            hh=$(echo $BUFFER | awk -F\, '{print $5}' | cut -c 2-)
            mm=$(echo $BUFFER |  awk -F\, '{print $6}')
            ss=$(echo $BUFFER | awk -F\, '{print $7}')
            milli=$(echo $BUFFER | awk -F\, '{print $8}')
            #ss=$(echo ${ss%??})
            milli=$(echo ${milli%??})
            TIME=$yyy"-"$mmm"-"$ddd$space$hh":"$mm":"$ss"."$milli
        NE=$(echo $BUFFER | awk -F"{" '{print $6}'| cut -d"," -f1)
        COMMAND=$(echo $BUFFER | awk -F"{" '{print $6}'| cut -d"," -f2)
        echo $TIME" "$NE" "$COMMAND >> $result
        BUFFER=""
    fi
        
done < "$1"

