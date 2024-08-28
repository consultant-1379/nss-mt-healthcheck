#!/bin/sh

#. conf.txt

echo "in ind"
StartTime=`date +%s%3N`
NODE_NAME=$1
NODE_IP=$2
PORT=$3
COMMUNITY=$4

echo $NODE_IP is
command=$(cat script1.sh)
for i in {1..100}
do
/usr/bin/expect - << "EOF" $NODE_NAME $NODE_IP $PORT $COMMUNITY $command
set timeout 5
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

spawn snmpget -v 2c -c $COMMUNITY -r 0 -t 3 $NODEIP:$PORT 1.3.6.1.2.1.1.2.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in get table 1.3.6.1.2.1.1.2.0 \n" ; exit 1}
eof { }
}
EOF
sleep 3
Result=$?
done
#Result=$?
EndTime=`date +%s%3N`
StartTime1=`expr $StartTime / 1000`
StartTimeFormat=`date -d @$StartTime1`
EndTime1=`expr $EndTime / 1000`
EndTimeFormat=`date -d @$EndTime1`
Diff=`expr $EndTime - $StartTime`
echo "${NODE_NAME} $StartTime:::$StartTimeFormat $EndTime:::$EndTimeFormat $Diff" >> mltnpmstats.log

if [[ $Result -ne 0 ]]
then
echo " failed"
exit 1
else
echo "executed successfully"
fi

