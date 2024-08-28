#!/bin/bash

echo "In sarstop.sh $@"

SERVER=$1

PID=$2

JOBID=$3

NUM_NODES=$4

RUN_TIME=$5

FILENAME=sar_${JOBID}.log

/usr/bin/expect - << "EOF" $SERVER $PID $JOBID $FILENAME

set SERVER [lindex $argv 0]
set PID [lindex $argv 1]
set JOBID [lindex $argv 2]
set FILENAME [lindex $argv 3]

spawn ssh -o StrictHostKeyChecking=no netsim@${SERVER} "sleep 1;kill -9 $PID;cat /proc/meminfo;echo \"Kill complete\""
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

#cat $FILENAME

cat $FILENAME | sed 1,3d |awk -v var1=$NUM_NODES -v var2=$RUN_TIME 'var=100-$8 {sum += var; if(var>max){max=var}; if(var==100){fullcount +=1}} END {printf "NumNodes:%d::Runtime:%d::Average:%f::Max:%f::100%CPU:%d\n", var1, var2, sum/NR, max, fullcount}' >> totalstat.log

