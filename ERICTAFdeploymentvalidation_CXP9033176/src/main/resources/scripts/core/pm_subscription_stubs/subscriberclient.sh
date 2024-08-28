#!/bin/bash
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
NETCONF_PORT=6513


if [[ $# -ne 6 ]];then
    echo "Invalid number of parameters"
    echo "Usage : sh $0 <NE_NAME> <NE_IP> <IS_TLS> <TIME_OUT> <LOGGING> <NUM_MOS>"
    exit 1
fi

NE_NAME=$1
NE_IP=$2
IS_TLS=$3
TIME_OUT=$4
LOGGING=false
NUM_MOS=$6
LOGS_DIR=$(pwd)

echo " U are in subscriberclient"
echo "num_mosss are $NUM_MOS"
PLUSONE=`expr ${NUM_MOS} + 1`
echo "plusone= $PLUSONE"

#echo "Triggering Full Sync on "$NE_NAME
if [[ $IS_TLS -eq 0 ]]; then
# TLS Enabled node 

expect - << "EOF" $NE_NAME $NE_IP $TIME_OUT $SSH_PORT $NETCONF_PORT $LOGGING $LOGS_DIR
set NE_NAME [lindex $argv 0]
set NE_IP [lindex $argv 1]
set TIME_OUT [lindex $argv 2] 
set SSH_PORT [lindex $argv 3]
set NETCONF_PORT [lindex $argv 4]
set LOGGING [lindex $argv 5]
set LOGS_DIR [lindex $argv 6]
set timeout ${TIME_OUT}

set timeout ${TIME_OUT}
if { $LOGGING == true } { log_file -noappend ${LOGS_DIR}/${NE_NAME}.log }
spawn openssl s_client -connect $NE_IP:$NETCONF_PORT
expect "]]>]]>"
send "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
 <netconf:rpc message-id=\"1\" xmlns:netconf=\"urn:ietf:params:xml:ns:netconf:base:1.0\">
  <create-subscription xmlns=\"urn:ietf:params:xml:ns:netconf:notification:1.0\">
    <filter type=\"subtree\">
      <event>	
        <filterType>objectCreated</filterType>
        <filterValue>ManagedElement.*</filterValue>
      </event>
      <event>
        <filterType>objectDeleted</filterType>
        <filterValue>ManagedElement.*</filterValue>
      </event>
      <event>
        <filterType>attributeChanged</filterType>
        <filterValue>ManagedElement.*</filterValue>
      </event>
    </filter>
 </create-subscription>
</netconf:rpc>]]>]]>
\r"



EOF
else
# Non TLS node
expect - << "EOF" $NE_NAME $NE_IP $TIME_OUT $SSH_PORT $NETCONF_PORT $LOGGING $LOGS_DIR $PASSWORD $PLUSONE
set NE_NAME [lindex $argv 0]
set NE_IP [lindex $argv 1]
set TIME_OUT [lindex $argv 2] 
set SSH_PORT [lindex $argv 3]
set NETCONF_PORT [lindex $argv 4]
set LOGGING [lindex $argv 5]
set LOGS_DIR "/netsim/zkidpiy"
set PASSWORD [lindex $argv 7]
set PLUSONE [lindex $argv 8]
set timeout ${TIME_OUT}
log_file ${LOGS_DIR}/${NE_NAME}.log
spawn ssh -o StrictHostKeyChecking=no netsim@$NE_IP -p $SSH_PORT -s netconf
expect "password:"

send "netsim\r"

expect "]]>]]>"
send "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
 <netconf:rpc message-id=\"1\" xmlns:netconf=\"urn:ietf:params:xml:ns:netconf:base:1.0\">
  <create-subscription xmlns=\"urn:ietf:params:xml:ns:netconf:notification:1.0\">
    <filter type=\"subtree\">
      <event>	
        <filterType>objectCreated</filterType>
        <filterValue>ManagedElement.*</filterValue>
      </event>
      <event>
        <filterType>objectDeleted</filterType>
        <filterValue>ManagedElement.*</filterValue>
      </event>
      <event>
        <filterType>attributeChanged</filterType>
        <filterValue>ManagedElement.*</filterValue>
      </event>
    </filter>
 </create-subscription>
</netconf:rpc>]]>]]>
\r"

set count 1

expect {
-re 	"<objectCreated" 
		            {
				send_user "count -- $count"
				if { $count > 267 } {
	send_user "equateddd"
				} else {
				set count [expr $count+1]	
				exp_continue 
			    }
        
	}

}


EOF
fi

