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
#DEST=$4
#DEST_PATH=$5
#DUMMY=$6

#if [ ${DUMMY} -eq 1 ];then
#	DEST="1.1.1.256"
#fi

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
expect "${NE_NAME}>"
send "getMOAttribute SDN=0,MeasurementDefinition=0\r"

send_user "${NE_NAME}-getMOAttribute triggered\n"

expect "${NE_NAME}>"
send "startTransaction pmtrans1\r"

send_user "${NE_NAME}-trans_started\n"
expect "${NE_NAME}>"
send "resumePMMeasurements SDN=0,MeasurementDefinition=0 sftp://netsim:netsim@10.141.11.227/var/tmp/esc/${NE_NAME}/\r"
expect  { 
	  "OperationSucceeded" {}
	  "already" {}
	   timeout {   send_user "${NE_NAME}-resumePMmeasures\n";exit 1  }
	}

expect "${NE_NAME}>"
send "setMOAttribute pmtrans1 SDN=0,MeasurementDefinition=0 reportPeriod 15\r"
expect  { 
	   "OperationSucceeded" {send_user "${NE_NAME}-setMOAttr_success\n"}
           timeout {   send_user "${NE_NAME}-timedout_setMOAttr\n";exit 1  }
        }

expect "${NE_NAME}>"
send "checkConsistency pmtrans1\r"
expect  { 
	  "OperationSucceeded" {send_user "${NE_NAME}-check-consistency\n"}
           timeout {   send_user "${NE_NAME}-check-consistency\n";exit 1  }
        }

expect "${NE_NAME}>"
send "commit pmtrans1\r"
expect  { 
	   "OperationSucceeded" {send_user "${NE_NAME}-commit_success\n"}
           timeout {   send_user "${NE_NAME}-commit_timedout\n";exit 1  }
        }

expect "${NE_NAME}>"
send "endTransaction pmtrans1\r"
expect  { 
	   "OperationSucceeded" {send_user "${NE_NAME}-endtrans_success\n"}
           timeout {   send_user "${NE_NAME}-endtrans_timedout\n";exit 1  }
        }
EOF
