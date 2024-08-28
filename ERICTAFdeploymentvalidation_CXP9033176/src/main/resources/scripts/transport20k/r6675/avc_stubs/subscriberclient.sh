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
NETCONF_PORT=6514


if [[ $# -ne 5 ]];then
    echo "Invalid number of parameters"
    echo "Usage : sh $0 <NE_NAME> <NE_IP> <IS_TLS> <TIME_OUT> <LOGGING>"
    exit 1
fi

NE_NAME=$1
NE_IP=$2
IS_TLS=$3
TIME_OUT=$4
LOGGING=$5

echo ========$NE_NAME $NE_IP $IS_TLS $TIME_OUT $LOGGING
echo "Triggering Full Sync on "$NE_NAME
if [[ $IS_TLS -eq 0 ]]; then
# TLS Enabled node
expect <<EOF
set timeout ${TIME_OUT}
if { $LOGGING == true } {}
# { log_file -noappend ${LOGS_DIR}/${JOB_ID}_${NE_NAME}.log }
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


expect "expectingsomethingthatisnotexpectedtilltimeout"

EOF
else
# Non TLS node
expect <<EOF
set timeout ${TIME_OUT}
if { $LOGGING == true } {}
# { log_file -noappend ${LOGS_DIR}/${JOB_ID}_${NE_NAME}.log }
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


expect "expectingsomethingthatisnotexpectedtilltimeout"


EOF
fi

