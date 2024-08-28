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

java  BrmBackup -ORBInitialPort $PORT -ORBInitialHost $NODEIP -sim $SIMNAME -ne $NODENAME

#java ConfClientLocal -ORBInitialPort $PORT -ORBInitialHost $NODEIP -sim $SIMNAME -ne $NODENAME
Result=$?

EndTimeMS=`date +%s%3N`
StartTime=`expr $StartTimeMS / 1000`
StartTimeFormat=`date -d @$StartTime`
EndTime=`expr $EndTimeMS / 1000`
EndTimeFormat=`date -d @$EndTime`
Diff=`expr $EndTimeMS - $StartTimeMS`
echo "${NODE_NAME} $StartTime:::$StartTimeFormat $EndTime:::$EndTimeFormat $Diff"  >> backupstats.log

rm -rf /var/tmp/backup/BACKUP*$NODENAME*

if [[ $Result -ne 0 ]];
then
    echo "Brmbackup failed"
    exit 1
fi
