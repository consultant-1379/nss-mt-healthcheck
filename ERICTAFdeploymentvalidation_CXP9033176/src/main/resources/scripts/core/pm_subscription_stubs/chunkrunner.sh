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


if [[ $# -ne 8 ]];then
    echo "Invalid number of parameters"
    echo "Usage : sh $0 <NE_NAME> <NE_IP> <IS_TLS> <NAME_SPACE> <JOB_ID> <LOGGING> <NUM_NODES> <NUM_MOS>"
    exit 1
fi

NE_NAME=$1
NE_IP=$2
IS_TLS=$3
NAME_SPACE=$4
JOB_ID=$5
LOG_ENABLED=$6
NUM_NODES=$7
NUM_MOS=$8
currDate=$(date +%s%N)
LOGS_DIR="logs_pmsubscription"
mkdir -p "$LOGS_DIR"
echo "Triggering PM Subscription on "$NE_NAME

MSG_ID=${JOB_ID}

Starttime=`date +%s%3N`
if [[ $IS_TLS -eq 0 ]]; then
# TLS Enabled node 
expect <<EOF
set timeout -1
if { $LOG_ENABLED == true } { log_file -noappend ${LOGS_DIR}/${JOB_ID}_${NE_NAME}.log }
spawn openssl s_client -connect $NE_IP:$NETCONF_PORT
expect "]]>]]>"


send "<rpc message-id=\"${MSG_ID}_${currDate}\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\"> <edit-config> <target> <running/> </target> <config> <ManagedElement xmlns=\"urn:com:ericsson:ecim:ComTop\"> <managedElementId>${NE_NAME}</managedElementId> <SystemFunctions xmlns=\"urn:com:ericsson:ecim:ComTop\">           <systemFunctionsId>1</systemFunctionsId> <Pm xmlns=\"urn:com:ericsson:ecim:${NAME_SPACE}\"> <pmId>1</pmId> <PmJob xmlns=\"urn:com:ericsson:ecim:${NAME_SPACE}\" operation=\"create\"> <pmJobId>${MSG_ID}_${REF} </pmJobId> <requestedJobState>ACTIVE</requestedJobState>  <reportingPeriod>FIFTEEN_MIN</reportingPeriod> <granularityPeriod>FIFTEEN_MIN</granularityPeriod><jobType>MEASUREMENTJOB</jobType><compressionType>GZIP</compressionType>\r"

set count 0;
while {\$count < $NUM_MOS} {
set count [expr \$count+1];
send "<MeasurementReader xmlns=\"urn:com:ericsson:ecim:${NAME_SPACE}\" operation=\"create\"><measurementReaderId>${MSG_ID}_\${count}</measurementReaderId><measurementSpecification><measurementTypeRef>ManagedElement=${NE_NAME},SystemFunctions=1,Pm=1,PmGroup=VlanPort,MeasurementType=ifHCInOctets</measurementTypeRef></measurementSpecification></MeasurementReader>\r"

}

send "</PmJob></Pm></SystemFunctions></ManagedElement> </config></edit-config></rpc>]]>]]>\r"

expect "</rpc-reply>]]>]]>"

send "<rpc message-id=\"1.0\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\"> <close-session/> </rpc>]]>]]>\r"

expect "</rpc-reply>]]>]]>"
EOF

else
# Non TLS node
expect <<EOF

set timeout 600
if { $LOG_ENABLED == true } { log_file -noappend ${LOGS_DIR}/${JOB_ID}_${NE_NAME}.log }
spawn ssh -o StrictHostKeyChecking=no netsim@$NE_IP -p $SSH_PORT -s netconf
expect "password:"
send "netsim\r"
expect "]]>]]>"

send "<rpc message-id=\"${MSG_ID}\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\"> <edit-config> <target> <running/> </target> <config xmlns:xc=\"urn:ietf:params:xml:ns:netconf:base:1.0\"> <ManagedElement xmlns=\"urn:com:ericsson:ecim:ComTop\"><managedElementId>${NE_NAME}</managedElementId><SystemFunctions><systemFunctionsId>1</systemFunctionsId><Pm xmlns=\"urn:com:ericsson:ecim:CmwPm\"><pmId>1</pmId><PmJob xc:operation=\"create\"><pmJobId>USERDEF-Statistical_SingleRopRecovery_MTAS.Cont.Y.STATS_${currDate}</pmJobId><requestedJobState>ACTIVE</requestedJobState><reportingPeriod>ONE_MIN</reportingPeriod><granularityPeriod>ONE_MIN</granularityPeriod><jobType>MEASUREMENTJOB</jobType><compressionType>GZIP</compressionType>\r"
set count 0;
set cDate `date +%s%N`
while { \$count < $NUM_MOS} {
set count [expr \$count+1];
send "<MeasurementReader xc:operation=\"create\"><measurementReaderId>MtasMediaResourceSite_Id_\${count}_\${cDate}</measurementReaderId><measurementSpecification struct=\"MeasurementSpecification\"><groupRef>ManagedElement=${NE_NAME},SystemFunctions=1,Pm=1,PmGroup=MtasMediaResourceSite</groupRef></measurementSpecification></MeasurementReader>\r"
}


send "</PmJob></Pm></SystemFunctions></ManagedElement></config></edit-config></rpc>]]>]]>\r"
#expect "</rpc-reply>]]>]]>"

expect {
    "<ok/>\r
</rpc-reply>]]>]]>"
{ puts "------------------Received $NE_NAME- ------------------"}
timeout { puts "---------------------------timedout $NE_NAME ------------------------------" }
}
send "<rpc message-id=\"1.0\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\"> <close-session/> </rpc>]]>]]>\r"

expect "</rpc-reply>]]>]]>"

EOF
fi

