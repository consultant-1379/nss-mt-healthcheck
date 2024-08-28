#!/bin/sh


StartTime=`date +%s%3N`
NODE_NAME=$1
NODE_IP=$2

/usr/bin/expect - << "EOF" $NODE_NAME $NODE_IP 
set timeout 120
set NODE_NAME [lindex $argv 0]
set NODEIP [lindex $argv 1]


spawn sftp -oStrictHostKeyChecking=no netsim@$NODEIP -p 2022
expect {
	-re "password:" { send "netsim\r" }
	timeout { exit 1 }
}

expect "sftp>" { send "cd data_transfer/destinations/CDHDEFAULT/Ready\r" }
expect "sftp>" { send "get test.txt\r" }
expect "sftp>" { send_user "file tranfer done\n" }

EOF

Result=$?
EndTime=`date +%s%3N`
StartTime1=`expr $StartTime / 1000`
StartTimeFormat=`date -d @$StartTime1`
EndTime1=`expr $EndTime / 1000`
EndTimeFormat=`date -d @$EndTime1`
Diff=`expr $EndTime - $StartTime`
echo "${NODE_NAME} $StartTime:::$StartTimeFormat $EndTime:::$EndTimeFormat $Diff"  >> get_pm_files_stats.log

if [[ $Result -ne 0 ]]
then
     echo "Pm generation failed"
     exit 1
else
     echo "Pm generation completed successfully"
fi
