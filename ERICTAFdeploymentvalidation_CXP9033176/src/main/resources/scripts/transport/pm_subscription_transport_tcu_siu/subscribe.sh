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


if [[ $# -ne 6 ]];then
    echo "Invalid number of parameters"
    echo "Usage : sh $0 <NE_NAME> <NE_IP> <LOGGING> <DEST> <PATH> <DUMMY>"
    exit 1
fi

NE_NAME=$1
NE_IP=$2
LOGGING=$3
DEST=$4
DEST_PATH=$5
DUMMY=$6

if [ ${DUMMY} -eq 1 ];then
	DEST="1.1.1.256"
fi

LOG="trigger.log"
USER="netsim"
PASS="netsim"

echo "Triggering Full Sync on "$NE_NAME

# Non TLS node
expect <<EOF
set timeout 30
log_file ${LOG}
spawn /usr/bin/ssh -o StrictHostKeyChecking=no netsim@${NE_IP}
expect {
  timeout { send_user "\ntimedout-Failed to get password prompt\n"; exit 1 }
  eof { send_user "\ntimedout-SSH failure for ${NE_NAME}\n"; exit 1 }
  "password:"
}
send "netsim\r"

expect "OSmon>"
send "startTransaction trans1\r"

send_user "${NE_NAME}-trans_started\n"
expect "OSmon>"
send "createMO trans1 STN=0,PmSubscription=0\r"
expect  { 
	  "OperationSucceeded" {}
	  "already" {}
	   timeout {   send_user "${NE_NAME}-timedout_mo_creation\n";exit 1  }
	}

expect "OSmon>"
send "setMOAttribute trans1 STN=0,PmSubscription=0 userName ${USER}\r"
expect  { 
	   "OperationSucceeded" {send_user "${NE_NAME}-user_success\n"}
           timeout {   send_user "${NE_NAME}-timedout_user\n";exit 1  }
        }

expect "OSmon>"
send "setMOAttribute trans1 STN=0,PmSubscription=0 password ${PASS}\r"
expect  { 
	  "OperationSucceeded" {send_user "${NE_NAME}-pass_success\n"}
           timeout {   send_user "${NE_NAME}-pass_timedout\n";exit 1  }
        }

expect "OSmon>"
send "setMOAttribute trans1 STN=0,PmSubscription=0 destinationHost ${DEST}\r"
expect  { 
	   "OperationSucceeded" {send_user "${NE_NAME}-dest_success\n"}
           timeout {   send_user "${NE_NAME}-dest_timedout\n";exit 1  }
        }

expect "OSmon>"
send "setMOAttribute trans1 STN=0,PmSubscription=0 directoryPath ${DEST_PATH}\r"
expect  { 
	   "OperationSucceeded" {send_user "${NE_NAME}-path_success\n"}
           timeout {   send_user "${NE_NAME}-path_timedout\n";exit 1  }
        }

expect "OSmon>"
send "setMOAttribute trans1 STN=0,PmSubscription=0 adminState 0\r"
expect  { 
	  "OperationSucceeded" {send_user "${NE_NAME}-adminstated_success\n"}
           timeout {   send_user "${NE_NAME}-adminstate_timedout\n";exit 1  }
        }

expect "OSmon>"
send "commit trans1\r"
expect  { 
	   "OperationSucceeded" {send_user "${NE_NAME}-commit_success\n"}
           timeout {   send_user "${NE_NAME}-commit_timedout\n";exit 1  }
        }

expect "OSmon>"
send "endTransaction trans1\r"
expect  { 
	   "OperationSucceeded" {send_user "${NE_NAME}-endtrans_success\n"}
           timeout {   send_user "${NE_NAME}-endtrans_timedout\n";exit 1  }
        }
EOF
