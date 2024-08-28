#!/bin/bash

if [[ $# -ne 5 ]];then
    echo "Invalid number of parameters"
    echo "Usage : $0 <NODE_IP> <PATH_FOR_DOWNLOAD> <NODE_NAME> <RESPONSE_TIME> <LOG_ENABLED(true)>"
    echo "NOTE: RESPONSE TIME should be in MILLISECONDS"
    exit 1
fi

nodeTimeout=10
NODE_IP=$1
path=$2
NODE_NAME=$3
hostIP=$(hostname -i)
port=22
PORT=161
user=netsim
password=netsim
FILENAME=$NODE_NAME.job
thresholdTime=$4
LOG_ENABLED=$5
COMMUNITY="public"
snmpTimeout=1

LOGS_DIR="logs_nodes"
mkdir -p "$LOGS_DIR"

start_time=$(($(date +%s%N)/1000000))
ssh-keygen -R $NODE_IP
set timeout -1
expect - << "EOF" $nodeTimeout $NODE_IP $path $hostIP $port $user $password $FILENAME $thresholdTime $LOG_ENABLED $NODE_NAME $LOGS_DIR
set nodeTimeout [lindex $argv 0]
set NODE_IP [lindex $argv 1]
set path [lindex $argv 2]
set hostIP [lindex $argv 3]
set port [lindex $argv 4]
set user [lindex $argv 5]
set password [lindex $argv 6]
set FILENAME [lindex $argv 7]
set thresholdTime [lindex $argv 8]
set LOG_ENABLED [lindex  $argv 9]
set NODE_NAME [lindex $argv 10]
set LOGS_DIR [lindex $argv 11]

set output [open "$FILENAME" "a"]
set out1 [open "check.job" "w"]
set out2 [open "sshtime.job" "a"]
set out3 [open "com1time.job" "a"]
set out4 [open "com2time.job" "a"]
set out5 [open "com3time.job" "a"]

set x [clock milliseconds]
if { $LOG_ENABLED == true } { log_file -noappend ${LOGS_DIR}/${NODE_NAME}.log }
spawn ssh -o StrictHostKeyChecking=no admin@$NODE_IP -p 22
expect "password:"
send "authpassword\r"
expect "#"
set y [clock milliseconds]
set diff [expr $y-$x]
puts $output "SSH Connection->"
puts $output $diff
puts $out2 "$diff"
if { $diff > $thresholdTime } {
        puts $out1 "SSH Abort $NODE_NAME"
}


set x [clock milliseconds]
send "config common cdb backup filename $path/Original_backup.cdb mode sftp ip $hostIP port $port user $user password $password\r"
expect -re "#"
set y [clock milliseconds]
set diff [expr $y-$x]
puts $output "Command 1->"
puts $output $diff
puts $out3 "$diff"
if { $diff > $thresholdTime } {
	puts $out1 "COMMAND 1 Abort $NODE_NAME"
}

set upload 0
set flag 0
for {set nodeStartTimeout 1} {$nodeStartTimeout < $nodeTimeout} {incr nodeStartTimeout 1} {
	#sleep $nodeStartTimeout
	set x [clock milliseconds]
	send_user "Count -- $nodeStartTimeout\r\n "
	send "show config common cdb\r"
	expect {
	-re "UPL0ADING" { send_user "\r Still uploading \r" }
	-re "COMPLETE" {send_user "\r######### File Upload Complete ##########"; set upload 1; set flag 1; break }
        }
}

if { $flag ==1 } {
set y [clock milliseconds]
set diff [expr $y-$x]
puts $output "Command 2->"
puts $output $diff
puts $out4 "$diff"
if { $diff > $thresholdTime } {
        puts $out1 "COMMAND 2 Abort $NODE_NAME"
}
}

if { $upload == 0 } {
send_user "Upload Timed out"
exit 1
}

set x [clock milliseconds]
expect {
    -re # {send "quit\r";
exp_continue}
}
set y [clock milliseconds]
set diff [expr $y-$x]
puts $output "Command 3->"
puts $output $diff
puts $out5 "$diff"
if { $diff > $thresholdTime } {
        puts $out1 "COMMAND 3 Abort $NODE_NAME"
}

EOF

/usr/bin/expect - << "EOF" $NODE_NAME $NODE_IP $PORT $COMMUNITY

set timeout -1
set NODE_NAME [lindex $argv 0]
set NODEIP [lindex $argv 1]
set PORT [lindex $argv 2]
set COMMUNITY [lindex $argv 3]
set msg [open "stats.job" "a"]

spawn snmpget -t 1   -v 2c -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.1.2.0
expect {
    -re "Timeout: No Response from" { send_user "Timedout in snmpget -t 1  \n" ; puts $msg "SNMP Timed Out" ; exit 1}
     eof { }
}

EOF

end_time=$(($(date +%s%N)/1000000))
echo "$end_time" >> time_verify.txt
diff=`expr $end_time - $start_time`
echo "$NODE_NAME : START: $start_time , END: $end_time " >>time.txt
echo "Difference : $diff milliseconds" >> time.txt
