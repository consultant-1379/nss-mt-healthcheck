#!/bin/bash

usage(){
    echo "-----------------------------------------------------------------------------------------------------"
    echo "Usage: $0 num_of_alarms num_of_nodes loops consider_all_servers(yes/no) filename frequency"
    echo "-----------------------------------------------------------------------------------------------------"
    exit 1
}

finalOutput="finaloutput.txt"
deleteFiles="deletefiles.sh"
serverNames="serverNames.txt"
alarmCntFile="alarmcntfile.txt"
timeFile="timefile.txt"
yes="yes"
no="no"


if [ $# -eq 5 ] && [ "$4" == "$yes" ];then
    #consider all files

    while IFS='' read -r line || [[ -n "$line" ]]; do
        for ((i=0;i<$3;i++));do
            sh execute.sh $line $1 $2 $5 
        done
    done < "$serverNames"
elif [ $# -eq 6 ] && [ "$4" == "$no" ];then 
    #conside only the mentioned file

    #if the mentioned file has less than the mentioned nodes then open that simulation and check
    num_lines=$(wc -l < $5)
    if [ "$num_lines" -lt "$2" ];then
        sh takeFromSimulation.sh $5 $3 $1 $2 $6 
    else
        for ((i=0;i<$3;i++));do
            #pass frequency 
            sh execute.sh $5 $1 $2 $6
        done
    fi
else
    echo $1 $2 $3 $4 $5
    usage
fi

rm -rf $serverNames
sh $deleteFiles
rm -rf $deleteFiles

cat $finalOutput
rm -rf $finalOutput
cp -rf $timeFile /netsim/$timeFile

#remove all files except the one mentioned in GLOBIGNORE
export GLOBIGNORE=$alarmCntFile
rm -rf *.txt
export GLOBIGNORE=

