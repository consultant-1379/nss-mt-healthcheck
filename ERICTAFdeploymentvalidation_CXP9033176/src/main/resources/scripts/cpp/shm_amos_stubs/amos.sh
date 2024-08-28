#!/bin/bash

function usage_msg () {
    echo "Usage: $0 -s <SIM NAME> -n <NODE NAME> -i <NODE IP>"
    exit 1
}

function check_args ()
{
    if [[ -z "$SIMNAME" ]]
    then
        echo "ERROR: Simulation name is mandatory"
        usage_msg
    fi
   
    if [[ -z "$NODENAME" ]]
    then 
        echo "ERROR: Node name is mandatory"
        usage_msg
    fi

    if [[ -z "$NODEIP" ]]
    then 
        echo "ERROR: Node ip is mandatory"
        usage_msg
    fi
}

while getopts ":s:n:i:" arg
do
    case $arg in
    s) SIMNAME="$OPTARG"
    ;;
    n) NODENAME="$OPTARG"
    ;;
    i) NODEIP="$OPTARG"
    ;;
    \?) usage_msg
    exit 1
    ;;
    esac
done

check_args

PORT=56834

StartTimeMS=`date +%s%3N`

java Amos -ORBInitialPort $PORT -ORBInitialHost $NODEIP -sim $SIMNAME -ne $NODENAME

#java ConfClientLocal -ORBInitialPort $PORT -ORBInitialHost $NODEIP -sim $SIMNAME -ne $NODENAME
Result=$?

EndTimeMS=`date +%s%3N`
StartTime=`expr $StartTimeMS / 1000`
StartTimeFormat=`date -d @$StartTime`
EndTime=`expr $EndTimeMS / 1000`
EndTimeFormat=`date -d @$EndTime`
Diff=`expr $EndTimeMS - $StartTimeMS`
echo "${NODENAME}:::$StartTime:::$StartTimeFormat:::$EndTime:::$EndTimeFormat:::$Diff"  >> amos_stats.log

if [[ $Result -ne 0 ]];
then
    echo "Software upgrade failed"
    exit 1
fi
