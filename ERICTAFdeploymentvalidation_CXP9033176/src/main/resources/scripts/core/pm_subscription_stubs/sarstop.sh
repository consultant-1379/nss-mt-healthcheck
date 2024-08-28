#!/bin/bash

echo "In sarstop.sh $@"

SERVER=$1

PID=$2

JOBID=$3

FILENAME=sar_${JOBID}.log

/usr/bin/expect - << "EOF" $SERVER $PID $JOBID $FILENAME

set SERVER [lindex $argv 0]
set PID [lindex $argv 1]
set JOBID [lindex $argv 2]
set FILENAME [lindex $argv 3]

spawn ssh -o StrictHostKeyChecking=no netsim@${SERVER} "sleep 1;kill -9 $PID; echo \"Kill complete\""
expect {
-re "assword:" { send "netsim\r"; exp_continue }
-re "Kill complete" { send_user "Kill completed\n" }
timeout { send_user "Timedout in sar collection\n"; exit 1 }
             }

             spawn scp -o StrictHostKeyChecking=no netsim@${SERVER}:/netsim/$FILENAME .
             expect {
             -re "assword:" { send "netsim\r"; exp_continue }
             timeout { send_user "Timedout in sar collection\n";exit 1}
}
EOF


