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


if [[ $# -ne 4 ]];then
    echo "Invalid number of parameters"
    echo "Usage : sh $0 <DEST> <PATH> <DIRS> <PM_DIRS>"
    exit 1
fi

DEST=$1
DEST_PATH=$2
DIRS=$3
PM_DIRS=$4

echo $DEST " " $DEST_PATH " " $DIRS " " $PM_DIRS

USER="netsim"
PASS="netsim"

expect <<EOF
spawn /usr/bin/ssh -o StrictHostKeyChecking=no netsim@${DEST}
expect "assword:"
send "netsim\r"

expect ">"
send "cd ${DEST_PATH}\r"
expect ">"
send "mkdir ${DIRS}\r"
expect ">"
send "mkdir ${PM_DIRS}\r"
expect ">"
EOF
