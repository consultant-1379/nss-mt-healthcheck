
#!/bin/bash
#===================================================================================
#
# FILE: actionrunner.sh
#
# USAGE: sh actionrunner.sh <NE_NAME> <NE_IP> <IS_TLS> <SIM_NAME> <JOB_ID> <LOGGING>
#
# DESCRIPTION: Triggers PM subscription on a dg2  node.If TLS enabled, then uses openssl
#              If not, the uses ssh
#              Currently supports IPV4 nodes
#
#              <IS_TLS> : 0/1  - 0 means true and 1 means false
#              <LOGGING> : true/false
#
# NOTES: ---
# AUTHOR: ZPALSRI(srihari.palivela@tcs.com)
# VERSION: 1.0
# CREATED: 15.03.2018
#
#===================================================================================




SSH_PORT=22
NETCONF_PORT=6513

NE_NAME=$1
NE_IP=$2
LOG_ENABLED="NO"
SESSION_NAME=$3
SW_HOST_IP=$4
SW_FILEPATH="/var/tmp/R1H20_CXP102200_1.zip"
nodeTimeout=30
expectTimeout=600
managerIP="192.168.0.12"
timetick=1
LOGS_DIR="test"

echo "SW Host IP -> " $SW_HOST_IP
currDate=$(date +%s%N)
Starttime=`date +%s%3N`
expect - << "EOF" $nodeTimeout $SESSION_NAME $LOGS_DIR $NE_NAME $SSH_PORT $NE_IP $SW_HOST_IP $timetick $LOG_ENABLED $expectTimeout $managerIP $SW_FILEPATH
set nodeTimeout [lindex $argv 0]
set SESSION_NAME [lindex $argv 1]
set LOGS_DIR [lindex $argv 2]
set NE_NAME [lindex $argv 3]
set SSH_PORT [lindex $argv 4]
set NE_IP [lindex $argv 5]
set SW_HOST_IP [lindex $argv 6]
set timetick [lindex $argv 7]
set LOG_ENABLED [lindex $argv 8]
set expectTimeout [lindex $argv 9]
set managerIP [lindex $argv 10]
set SW_FILEPATH [lindex $argv 11]


set timeout $expectTimeout
set nodeStartTimeout 10
set id 0

spawn ssh -o StrictHostKeyChecking=no netsim@$NE_IP -p $SSH_PORT
expect "password:"
send "netsim\r"
expect "OSmon>"

send "subscribe $managerIP $timetick\r"
expect {
-re "(.*?)OperationSucceeded" { regexp "subscribe $managerIP $timetick\r\n(.*?) OperationSucceeded" $expect_out(0,string) match id; send_user "### ID is $id ###"}
}

send "startSWSession ${SESSION_NAME} $managerIP\r"
expect "OSmon>"

send "downloadSW ${SESSION_NAME} sftp://netsim:netsim@${SW_HOST_IP}/$SW_FILEPATH\r"
expect "OSmon>"

for {set nodeStartTimeout 1} {$nodeStartTimeout < $nodeTimeout} {incr nodeStartTimeout 1} {
	sleep $nodeStartTimeout
	send "getswsessionstatus ${SESSION_NAME}\r"
	expect {
	-re "DownloadCompleted OperationSucceeded" {send_user "########## File Download Completed ##########"; break}
	-re "Download" {send_user "still downloading $nodeStartTimeout"}
	}

}

send "unsubscribe $id\r"
expect "OSmon>"


send "activateSW ${SESSION_NAME}\r"
expect ">"

#EOF

#Reconnect to node using ssh
#expect <<EOF

set timeout $expectTimeout
spawn ssh -o StrictHostKeyChecking=no netsim@$NE_IP -p $SSH_PORT
expect "password:"
send "netsim\r"
expect "OSmon>"

send "getswsessionstatus ${SESSION_NAME}\r"
expect "OSmon>"


send "approvesw ${SESSION_NAME}\r"
expect "OSmon>"

send "endswsession ${SESSION_NAME}\r"
expect "OSmon>"

#Exit from session
send "exit\r"
expect ">"

EOF
