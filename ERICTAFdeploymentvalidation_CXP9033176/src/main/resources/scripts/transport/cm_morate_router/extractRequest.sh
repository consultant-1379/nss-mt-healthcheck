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
while IFS='' read -r line || [[ -n "$line" ]]; do
    for (( i=0; i<${#line}; i++ )); do
        if [[ "${line:$i:1}" == "$opening" ]];then
            cnt=$((cnt+1))
        elif [[ "${line:$i:1}" == "$closing" ]];then
            cnt=$((cnt-1))
        fi
    done

    if [[ "$cnt" -ne "$zero" ]];then
        if [[ $line == *netsimprmn* ]] || [[ $line == *prmnresponse* ]];then
            #extract time from this line
            yyy=$(echo $line | awk -F\, '{print $2}' | cut -c 3-)
            mmm=$(echo $line | awk -F\, '{print $3}')
            ddd=$(echo $line | awk -F\, '{print $4}')
            ddd=$(echo ${ddd%?})

            hh=$(echo $line | awk -F\, '{print $5}' | cut -c 2-)
            mm=$(echo $line |  awk -F\, '{print $6}')
            ss=$(echo $line | awk -F\, '{print $7}')
            milli=$(echo $line | awk -F\, '{print $8}')
            #ss=$(echo ${ss%??})
            milli=$(echo ${milli%??})
            s=$yyy"-"$mmm"-"$ddd$space$hh":"$mm":"$ss"."$milli
        else
            nodeName=$(echo $line | awk -F\" '{print $2}')
        fi
        
    else
        if [[ $line == *"message-id"* ]];then
        y=$(echo $line | awk -F\" '{print $3}')
        #remove extra character at the end
    empty=""
    if [[ "$s" == "$empty" ]] || [[ "$y" == "$empty" ]] || [[ "$nodeName" == "$empty" ]];then
        continue
    fi
        y=$(echo ${y%?})
        s=$s$space$y$space$nodeName
        echo $s >> $result
        s=""
        y=""
        nodeName=""
        cnt=0
    fi
    fi
done < "$1"
cat $result


