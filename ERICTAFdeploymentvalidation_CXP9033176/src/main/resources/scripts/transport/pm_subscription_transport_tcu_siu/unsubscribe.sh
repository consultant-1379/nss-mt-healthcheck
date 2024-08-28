#!/usr/bin/bash
#===================================================================================
#
# FILE: actionrunner.sh
#
# USAGE: sh actionrunner.sh <NE_NAME> <NE_IP> <IS_TLS> <SIM_NAME> <JOB_ID> <LOGGING>
#
# DESCRIPTION: Triggers CM full sync on a dg2  node.If TLS enabled, then uses openssl 
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


if [[ $# -ne 3 ]];then
    echo "Invalid number of parameters"
    echo "Usage : sh $0 <NE_NAME> <NE_IP> <LOGGING> "
    exit 1
fi

NE_NAME=$1
NE_IP=$2
LOGGING=$3

echo "Triggering Full Sync on "$NE_NAME

# Non TLS node
expect <<EOF
set timeout 10
if { $LOGGING == true } { log_file -noappend ${LOGS_DIR}/${JOB_ID}_${NE_NAME}.log }
spawn /usr/bin/ssh -o StrictHostKeyChecking=no netsim@${NE_IP}
expect "password:"
send "netsim\r"

expect "OSmon>"
send "startTransaction trans2\r"
expect "OperationSucceeded"
expect "OSmon>"
send "setMOAttribute trans2 STN=0,PmSubscription=0 adminState 1\r"
expect "OperationSucceeded"
expect "OSmon>"
send "commit trans2\r"
expect "OperationSucceeded"
expect "OSmon>"
send "endTransaction trans2\r"
expect "OperationSucceeded"
expect "OSmon>"

EOF
