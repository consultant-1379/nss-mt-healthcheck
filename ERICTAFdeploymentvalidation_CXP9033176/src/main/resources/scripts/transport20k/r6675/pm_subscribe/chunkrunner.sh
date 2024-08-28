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
NETCONF_PORT=6514


if [[ $# -ne 6 ]];then
    echo "Invalid number of parameters"
    echo "Usage : sh $0 <NE_NAME> <NE_IP> <IS_TLS> <JOB_ID> <LOGGING> <NUM_MOS> "
    exit 1
fi

NE_NAME=$1
NE_IP=$2
IS_TLS=$3
#SIM=$4
JOB_ID=$4
LOG_ENABLED=$5
#NUM_NODES=$6
NUM_MOS=$6
#REF=$8
LOGS_DIR="logs_pmsubscription"
mkdir -p "$LOGS_DIR"
echo "Triggering PM Subscription on "$NE_NAME
SHORT_NODE=$(echo $NE_NAME| cut -c 4,5,15,16,17)
echo $SHORT_NODE
ran=$RANDOM
MSG_ID=${JOB_ID}_${SHORT_NODE}_$ran

Starttime=`date +%s%3N`
if [[ $IS_TLS -eq 0 ]]; then
# TLS Enabled node 
expect <<EOF
set timeout -1
if { $LOG_ENABLED == true } { log_file -noappend ${LOGS_DIR}/${JOB_ID}_${NE_NAME}.log }
spawn openssl s_client -connect $NE_IP:$NETCONF_PORT
expect "]]>]]>"


send "<rpc message-id=\"${MSG_ID}\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\"> <edit-config> <target> <running/> </target> <config xmlns:xc=\"urn:ietf:params:xml:ns:netconf:base:1.0\"> <ManagedElement xmlns=\"urn:com:ericsson:ecim:ComTop\"> <managedElementId>1</managedElementId> <SystemFunctions><systemFunctionsId>1</systemFunctionsId> <Pm xmlns=\"urn:com:ericsson:ecim:Ipos_Pm\"> <pmId>1</pmId> <PmJob xc:operation=\"create\"> <pmJobId>${MSG_ID} </pmJobId> <requestedJobState>ACTIVE</requestedJobState>  <reportingPeriod>FIFTEEN_MIN</reportingPeriod> <granularityPeriod>FIFTEEN_MIN</granularityPeriod><jobType>MEASUREMENTJOB</jobType><compressionType>GZIP</compressionType>\r"

set count 0;
while {\$count < $NUM_MOS} {
set count [expr \$count+1];
send "<MeasurementReader xc:operation=\"create\"><measurementReaderId>${MSG_ID}_\${count}</measurementReaderId><measurementSpecification struct=\"MeasurementSpecification\"><measurementTypeRef>ManagedElement=1,SystemFunctions=1,Pm=1,PmGroup=port-history,MeasurementType=inoctets</measurementTypeRef></measurementSpecification></MeasurementReader>\r"

}

send "</PmJob></Pm></SystemFunctions></ManagedElement> </config></edit-config></rpc>]]>]]>\r"

expect "</rpc-reply>]]>]]>"


send "<rpc message-id=\"1.0\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\"> <close-session/> </rpc>]]>]]>\r"

expect "</rpc-reply>]]>]]>"
EOF

else
# Non TLS node
expect <<EOF

set timeout 60
if { $LOG_ENABLED == true } { log_file -noappend ${LOGS_DIR}/${JOB_ID}_${NE_NAME}.log }
spawn ssh -o StrictHostKeyChecking=no netsim@$NE_IP -p $SSH_PORT -s netconf
expect "password:"
send "netsim\r"
expect "]]>]]>"



send "<rpc message-id=\"${MSG_ID}\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\"> <edit-config> <target> <running/> </target> <config> <ManagedElement xmlns=\"urn:com:ericsson:ecim:ComTop\"> <managedElementId>${NE_NAME}</managedElementId> <SystemFunctions xmlns=\"urn:com:ericsson:ecim:ComTop\">           <systemFunctionsId>1</systemFunctionsId> <Pm xmlns=\"urn:com:ericsson:ecim:RcsPm\"> <pmId>1</pmId> <PmJob xmlns=\"urn:com:ericsson:ecim:RcsPm\" operation=\"create\"> <pmJobId>${MSG_ID}_${REF}</pmJobId> <requestedJobState>ACTIVE</requestedJobState>  <reportingPeriod>FIFTEEN_MIN</reportingPeriod> <granularityPeriod>FIFTEEN_MIN</granularityPeriod><jobType>MEASUREMENTJOB</jobType><compressionType>GZIP</compressionType>\r"

set count 0;
while {\$count < $NUM_MOS} {
set count [expr \$count+1];
send "<MeasurementReader xmlns=\"urn:com:ericsson:ecim:RcsPm\" operation=\"create\"><measurementReaderId>${MSG_ID}_\${count}</measurementReaderId><measurementSpecification><measurementTypeRef>ManagedElement=${NE_NAME},SystemFunctions=1,Pm=1,PmGroup=VlanPort,MeasurementType=ifHCInOctets</measurementTypeRef></measurementSpecification></MeasurementReader>\r"

}

send "</PmJob></Pm></SystemFunctions></ManagedElement> </config></edit-config></rpc>]]>]]>"

send "\r"
expect "</rpc-reply>]]>]]>"

send "<rpc message-id=\"1.0\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\"> <close-session/> </rpc>]]>]]>\r"

expect "</rpc-reply>]]>]]>"

EOF
fi

REF=`expr $REF + 1`
