#!/bin/sh

#. conf.txt

StartTime=`date +%s%3N`
NODE_NAME=$1
NODE_IP=$2
PORT=$3
COMMUNITY=$4

command=$(cat script1.sh)

/usr/bin/expect - << "EOF" $NODE_NAME $NODE_IP $PORT $COMMUNITY $command
set timeout -1
set NODE_NAME [lindex $argv 0]
set NODEIP [lindex $argv 1]
set PORT [lindex $argv 2]
set COMMUNITY [lindex $argv 3]
set command [lindex $argv 4]
#set SW_FTP_SERVER [lindex $argv 4]
#set SW_FTP_ALIAS [lindex $argv 5]
#set SW_FTP_PORT [lindex $argv 6]
#set SW_FTP_USER [lindex $argv 7]
#set SW_FTP_PWD [lindex $argv 8]
#set passive 0
#set active 0
#set count 1



EOF
Result=$?
EndTime=`date +%s%3N`
StartTime1=`expr $StartTime / 1000`
StartTimeFormat=`date -d @$StartTime1`
EndTime1=`expr $EndTime / 1000`
EndTimeFormat=`date -d @$EndTime1`
Diff=`expr $EndTime - $StartTime`
echo "${NODE_NAME} $StartTime:::$StartTimeFormat $EndTime:::$EndTimeFormat $Diff"  >> mltnpmstats.log

if [[ $Result -ne 0 ]]
then
     echo "Mltn Pm failed"
     exit 1
else
     echo "Mltn Pm collection completed successfully"
fi

