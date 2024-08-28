#!/bin/bash

function usage_msg () {
    echo "Usage: $0 -s <SIM NAME>-n <NODE NAME> -i <NODE IP>"
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

StartTimeMS=`date +%s%3N`


#Variables
LOG_ENABLED=true
username="netsim"
password="netsim"
portNumber=22

#Connection and Running Commands

for((i=0; i<14; i++))
{

/usr/bin/expect << EOF

set timeout -1

spawn ssh -oStrictHostKeyChecking=no $username@$NODEIP -p $portNumber
expect {
	-re "password:" { send "$password\r" }
	timeout { exit 1 }
       }
expect -re {[$]}
send "cd /d\r"
expect -re {[$]}
send "echo \"EndOfPrint\"\r"
expect -re {[$]}
send "rm -f /c/dcg/DCG.zip\r"
expect -re {[$]}
send "ls -l /c/dcg\r"
expect -re {[$]}
send "getAttrObj me\r"
expect -re {[$]}
send "cat /d/systemfiles/virtual_map/vmap.txt\r"
expect -re {[$]}
send "pdr\r"
expect -re {[$]}
send "arm print\r"
expect -re {[$]}
send "csti info\r"
expect -re {[$]}
send "ps\r"
expect -re {[$]}
send "lhsh 002700 ps\r"
expect -re {[$]}
send "cell list\r"
expect -re {[$]}
send "pdr\r"
expect -re {[$]}
send "listObj subrack\r"
expect -re {[$]}
EOF

}
Result=$?

PORT=56834

java Amos -ORBInitialPort $PORT -ORBInitialHost $NODEIP -sim $SIMNAME -ne $NODENAME

Result2=$?

EndTimeMS=`date +%s%3N`
StartTime=`expr $StartTimeMS / 1000`
StartTimeFormat=`date -d @$StartTime`
EndTime=`expr $EndTimeMS / 1000`
EndTimeFormat=`date -d @$EndTime`
Diff=`expr $EndTimeMS - $StartTimeMS`
echo "${NODENAME}:::$StartTime:::$StartTimeFormat:::$EndTime:::$EndTimeFormat:::$Diff"  >> amos_ssh_corba_stats.log

if [[ $Result -ne 0 || $Result2 -ne 0 ]];
then
    echo "Amos execution failed"
    exit 1
fi
