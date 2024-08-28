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


if [[ $# -ne 4 ]];then
    echo "Invalid number of parameters"
    echo "Usage : sh $0 <NE_NAME> <NE_IP> <SIM> <IS_TLS>"
    exit 1
fi

NE_NAME=$1
NE_IP=$2
IS_TLS=$4
SIM=$3
LOG_ENABLED=false

echo "Triggering Full Sync on "$NE_NAME

#SHORT_NODE=$(echo $NE_NAME| cut -c 4,5,15,16,17)
MSG_ID="CM_SYNC"

if [[ $IS_TLS -eq 0 ]]; then
# TLS Enabled node 

## TODO: Incase you are updating request, it has impact on analyzer & extractor
##       consider updating those files if changes made here
	echo "Currently TLS not supported"
else
# Non TLS node
expect <<EOF
set timeout -1
if { $LOG_ENABLED == true } { log_file -noappend ${LOGS_DIR}/${JOB_ID}_${NE_NAME}.log }
spawn ssh -o StrictHostKeyChecking=no ${NE_NAME}@${NE_IP} -p ${SSH_PORT} -s netconf
expect "password:"
send "\r"
expect "]]>]]>"
send "<rpc message-id=\"${MSG_ID}_0\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\"><get/></rpc>]]>]]>\r"

expect {
	"  </rpc-error>" { send_user "get request failed \n";}
        "</rpc-reply>" { }
        timeout { send_user "Timedout in full get request"; }
}


send "<rpc message-id=\"${MSG_ID}_1\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\"> <close-session/> </rpc>]]>]]>\r"

expect "</rpc-reply>"
EOF

expect <<EOF
set timeout -1
if { $LOG_ENABLED == true } { log_file -noappend ${LOGS_DIR}/${JOB_ID}_${NE_NAME}.log }
spawn ssh -o StrictHostKeyChecking=no netsim@$NE_IP -p $SSH_PORT -s netconf-ecim
expect "password:"
send "netsim\r"
expect "]]>]]>"
send "<rpc message-id=\"${MSG_ID}_2\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\"><get><filter><ManagedElement xmlns=\"urn:com:ericsson:ecim:ComTop\"><managedElementId>1</managedElementId>                    </ManagedElement></filter></get></rpc>]]>]]>\r"

expect {
	"  </rpc-error>\r
</rpc-reply>]]>]]>" { send_user "get request failed \n";}
        "</rpc-reply>]]>]]>" { }
        timeout { send_user "Timedout in full get request"; }
}


send "<rpc message-id=\"${MSG_ID}_3\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\"> <close-session/> </rpc>]]>]]>\r"

expect "</rpc-reply>]]>]]>"
EOF

fi


