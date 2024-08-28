#!/bin/bash

rm -rf sarpid.txt

SERVER=$1

JOBID=$2

/usr/bin/expect - << "EOF" $SERVER $JOBID

set SERVER [lindex $argv 0]

set JOBID [lindex $argv 1]

set output [open "sarpid.txt" "w"]

spawn ssh -o StrictHostKeyChecking=no netsim@${SERVER} "sar 1 > sar_${JOBID}.log & echo \"<SarPid=$!>\""
expect {
-re "assword:" { send "netsim\r"; exp_continue }
-re "<SarPid=(.*?)>" { regexp "<SarPid=(.*?)>" $expect_out(0,string) match id; send_user "SarPid is $id\n"; puts $output $id }
timeout { send_user "Timedout in sar collection\n"; exit 1 }
}

close $output

EOF

