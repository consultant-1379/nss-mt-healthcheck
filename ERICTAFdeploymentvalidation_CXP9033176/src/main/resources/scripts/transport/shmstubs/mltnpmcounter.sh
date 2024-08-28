#!/bin/sh

. conf.txt

StartTime=`date +%s%3N`
NODE_NAME=$1
NODE_IP=$2
PORT=$3
COMMUNITY=$4

/usr/bin/expect - << "EOF" $NODE_NAME $NODE_IP $PORT $COMMUNITY $SW_FTP_SERVER $SW_FTP_ALIAS $SW_FTP_PORT $SW_FTP_USER $SW_FTP_PWD
set timeout 20
set NODE_NAME [lindex $argv 0]
set NODEIP [lindex $argv 1]
set PORT [lindex $argv 2]
set COMMUNITY [lindex $argv 3]
set SW_FTP_SERVER [lindex $argv 4]
set SW_FTP_ALIAS [lindex $argv 5]
set SW_FTP_PORT [lindex $argv 6]
set SW_FTP_USER [lindex $argv 7]
set SW_FTP_PWD [lindex $argv 8]
set passive 0
set active 0
set count 1
set operstatus 0


#BulkGet the xfSDHLineInterval24hTable
send_user "\n[clock format [clock seconds]]Bulkget the swrelease talbe\n"
spawn snmpbulkget -t 1 -v 2c -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.2.2.1.3.4 -Cr100
expect {
    -re "Timeout: No Response from" { send_user "Timedout in bulkget ftp table \n" ; exit 1}
     eof { }
}

#BulkGet the xfSDHLineInterval24hTable
send_user "\n[clock format [clock seconds]]Bulkget the swrelease talbe\n"
spawn snmpbulkget -t 1 -v 2c -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.2.2.1.3.4 -Cr100
expect {
    -re "Timeout: No Response from" { send_user "Timedout in bulkget ftp table \n" ; exit 1}
     eof { }
}
#BulkGet the xfSDHLineInterval24hTable
send_user "\n[clock format [clock seconds]]Bulkget the swrelease talbe\n"
spawn snmpbulkget -t 1 -v 2c -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.2.2.1.3.4 -Cr100
expect {
    -re "Timeout: No Response from" { send_user "Timedout in bulkget ftp table \n" ; exit 1}
     eof { }
}
#BulkGet the xfSDHLineInterval24hTable
send_user "\n[clock format [clock seconds]]Bulkget the swrelease talbe\n"
spawn snmpbulkget -t 1 -v 2c -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.2.2.1.3.4 -Cr100
expect {
    -re "Timeout: No Response from" { send_user "Timedout in bulkget ftp table \n" ; exit 1}
     eof { }
}
EOF

Result=$?
EndTime=`date +%s%3N`
StartTime1=`expr $StartTime / 1000`
StartTimeFormat=`date -d @$StartTime1`
EndTime1=`expr $EndTime / 1000`
EndTimeFormat=`date -d @$EndTime1`
Diff=`expr $EndTime - $StartTime`
echo "${NODE_NAME} $StartTime:::$StartTimeFormat $EndTime:::$EndTimeFormat $Diff"  >> get_pm_counters_stats.log

if [[ $Result -ne 0 ]]
then
     echo "Mltn Pm failed"
     exit 1
else
     echo "Mltn Pm collection completed successfully"
fi

