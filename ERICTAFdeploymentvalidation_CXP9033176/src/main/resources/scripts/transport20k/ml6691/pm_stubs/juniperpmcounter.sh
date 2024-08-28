#!/bin/sh

#. conf.txt

StartTime=`date +%s%3N`
NODE_NAME=$1
NODE_IP=$2
PORT=$3
COMMUNITY=$4

command=$(cat script1.sh)

/usr/bin/expect - << "EOF" $NODE_NAME $NODE_IP $PORT $COMMUNITY $command
set timeout -1
set NODE_NAME [lindex $argv 0]
set NODEIP [lindex $argv 1]
set PORT [lindex $argv 2]
set COMMUNITY [lindex $argv 3]
set command [lindex $argv 4]
#set SW_FTP_SERVER [lindex $argv 4]
#set SW_FTP_ALIAS [lindex $argv 5]
#set SW_FTP_PORT [lindex $argv 6]
#set SW_FTP_USER [lindex $argv 7]
#set SW_FTP_PWD [lindex $argv 8]
#set passive 0
#set active 0
#set count 1



spawn snmpbulkget -v 2c -Cr50 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.11 .1.3.6.1.4.1.193.81.2.8.3.11.1.3.8
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.11 .1.3.6.1.4.1.193.81.2.8.3.11.1.3.8 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr50 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.11.1.6.5 .1.3.6.1.4.1.193.81.2.8.3.11.1.9.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.11.1.6.5 .1.3.6.1.4.1.193.81.2.8.3.11.1.9.2 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr50 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.11.1.11.10 .1.3.6.1.4.1.193.81.3.4.1.1.9.1.10
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.11.1.11.10 .1.3.6.1.4.1.193.81.3.4.1.1.9.1.10 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr50 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.4.3.3.1.1.4.1.1 .1.3.6.1.4.1.193.81.4.3.3.1.1.16.1.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.4.3.3.1.1.4.1.1 .1.3.6.1.4.1.193.81.4.3.3.1.1.16.1.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr50 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.4.3.3.1.1.8.1.1 .1.3.6.1.4.1.193.81.3.1.1.1.1.1.15
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.4.3.3.1.1.8.1.1 .1.3.6.1.4.1.193.81.3.1.1.1.1.1.15 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr50 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.11 .1.3.6.1.4.1.193.81.2.8.3.11.1.3.6
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.11 .1.3.6.1.4.1.193.81.2.8.3.11.1.3.6 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr50 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.11.1.5.12 .1.3.6.1.4.1.193.81.2.8.3.11.1.8.6
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.11.1.5.12 .1.3.6.1.4.1.193.81.2.8.3.11.1.8.6 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr50 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.11.1.10.12 .1.3.6.1.4.1.193.81.3.4.1.1.9.1.10
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.11.1.10.12 .1.3.6.1.4.1.193.81.3.4.1.1.9.1.10 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr50 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.4.3.3.1.1.4.1.1 .1.3.6.1.4.1.193.81.4.3.3.1.1.16.1.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.4.3.3.1.1.4.1.1 .1.3.6.1.4.1.193.81.4.3.3.1.1.16.1.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr50 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.4.3.3.1.1.8.1.1 .1.3.6.1.4.1.193.81.3.1.1.1.1.1.15
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.4.3.3.1.1.8.1.1 .1.3.6.1.4.1.193.81.3.1.1.1.1.1.15 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr50 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.4.1.5.1.3.1.1.6 .1.3.6.1.4.1.193.81.4.1.5.1.3.1.1.7
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.4.1.5.1.3.1.1.6 .1.3.6.1.4.1.193.81.4.1.5.1.3.1.1.7 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr50 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.4.17.2.3.1.4 .1.3.6.1.4.1.193.81.2.4.17.2.3.1.7
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.4.17.2.3.1.4 .1.3.6.1.4.1.193.81.2.4.17.2.3.1.7 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr50 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.4.17.2.3.1.9 .1.3.6.1.4.1.193.81.2.4.17.2.3.1.8
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.4.17.2.3.1.9 .1.3.6.1.4.1.193.81.2.4.17.2.3.1.8 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr50 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.4.17.2.3.1.2 .1.3.6.1.4.1.193.81.2.4.17.2.3.1.6
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.4.17.2.3.1.2 .1.3.6.1.4.1.193.81.2.4.17.2.3.1.6 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr50 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.4.17.2.3.1.5 .1.3.6.1.4.1.193.81.2.4.17.2.3.1.3
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.4.17.2.3.1.5 .1.3.6.1.4.1.193.81.2.4.17.2.3.1.3 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr50 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.4.17.2.5.1.5 .1.3.6.1.4.1.193.81.2.4.17.2.5.1.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.4.17.2.5.1.5 .1.3.6.1.4.1.193.81.2.4.17.2.5.1.2 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr50 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.4.17.2.5.1.6 .1.3.6.1.4.1.193.81.2.4.17.2.5.1.4
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.4.17.2.5.1.6 .1.3.6.1.4.1.193.81.2.4.17.2.5.1.4 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr50 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.4.17.2.5.1.3 .1.3.6.1.4.1.193.81.4.1.2.1.7.1.1.13
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.4.17.2.5.1.3 .1.3.6.1.4.1.193.81.4.1.2.1.7.1.1.13 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr50 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.15.1.3.2.1.16 .1.3.6.1.4.1.193.81.2.15.1.3.2.1.6
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.15.1.3.2.1.16 .1.3.6.1.4.1.193.81.2.15.1.3.2.1.6 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr50 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.15.1.3.2.1.2 .1.3.6.1.4.1.193.81.2.15.1.3.2.1.14
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.15.1.3.2.1.2 .1.3.6.1.4.1.193.81.2.15.1.3.2.1.14 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr50 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.15.1.3.2.1.7 .1.3.6.1.4.1.193.81.2.15.1.3.2.1.13 .1.3.6.1.4.1.193.81.2.15.1.3.2.1.3
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.15.1.3.2.1.7 .1.3.6.1.4.1.193.81.2.15.1.3.2.1.13 .1.3.6.1.4.1.193.81.2.15.1.3.2.1.3 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr50 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.15.1.3.2.1.4 .1.3.6.1.4.1.193.81.2.15.1.3.2.1.8 .1.3.6.1.4.1.193.81.2.15.1.3.2.1.11 .1.3.6.1.4.1.193.81.2.15.1.3.2.1.15 .1.3.6.1.4.1.193.81.2.15.1.3.2.1.9 .1.3.6.1.4.1.193.81.2.15.1.3.2.1.10 .1.3.6.1.4.1.193.81.2.15.1.3.2.1.1 .1.3.6.1.4.1.193.81.2.15.1.3.2.1.5 .1.3.6.1.4.1.193.81.2.15.1.3.2.1.12
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.15.1.3.2.1.4 .1.3.6.1.4.1.193.81.2.15.1.3.2.1.8 .1.3.6.1.4.1.193.81.2.15.1.3.2.1.11 .1.3.6.1.4.1.193.81.2.15.1.3.2.1.15 .1.3.6.1.4.1.193.81.2.15.1.3.2.1.9 .1.3.6.1.4.1.193.81.2.15.1.3.2.1.10 .1.3.6.1.4.1.193.81.2.15.1.3.2.1.1 .1.3.6.1.4.1.193.81.2.15.1.3.2.1.5 .1.3.6.1.4.1.193.81.2.15.1.3.2.1.12 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr50 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.3.1.1 .1.3.6.1.4.1.193.81.3.4.3.1.3.1.10 .1.3.6.1.2.1.2.2.1.3 .1.3.6.1.2.1.2.2.1.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.3.1.1 .1.3.6.1.4.1.193.81.3.4.3.1.3.1.10 .1.3.6.1.2.1.2.2.1.3 .1.3.6.1.2.1.2.2.1.2 \n" ; exit 1}
eof { }
}


spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.11.1.9.12
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.11.1.9.12 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.11.1.9.12 .1.3.6.1.4.1.193.81.2.8.3.11.1.9.12
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.11.1.9.12 .1.3.6.1.4.1.193.81.2.8.3.11.1.9.12 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.11.1.9.12 .1.3.6.1.4.1.193.81.2.8.3.11.1.10.12
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.11.1.9.12 .1.3.6.1.4.1.193.81.2.8.3.11.1.10.12 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.11.1.9.12 .1.3.6.1.4.1.193.81.2.8.3.11.1.9.12
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.11.1.9.12 .1.3.6.1.4.1.193.81.2.8.3.11.1.9.12 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.11.1.9.12 .1.3.6.1.4.1.193.81.2.8.3.11.1.9.12
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.11.1.9.12 .1.3.6.1.4.1.193.81.2.8.3.11.1.9.12 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.11.1.10.12 .1.3.6.1.2.1.1.2.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.11.1.10.12 .1.3.6.1.2.1.1.2.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.4.7.2.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.4.7.2.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.4.1.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.4.1.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.11.0 .1.3.6.1.4.1.193.81.2.13.2.3.3.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.11.0 .1.3.6.1.4.1.193.81.2.13.2.3.3.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.2.0 .1.3.6.1.2.1.1.2.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.2.0 .1.3.6.1.2.1.1.2.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.4.7.2.0 .1.3.6.1.2.1.47.1.4.1.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.4.7.2.0 .1.3.6.1.2.1.47.1.4.1.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.11.0 .1.3.6.1.4.1.193.81.2.13.2.3.3.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.11.0 .1.3.6.1.4.1.193.81.2.13.2.3.3.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.2.0 .1.3.6.1.2.1.1.2.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.2.0 .1.3.6.1.2.1.1.2.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.4.7.2.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.4.7.2.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.4.1.0 .1.3.6.1.4.1.193.81.2.7.1.11.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.4.1.0 .1.3.6.1.4.1.193.81.2.7.1.11.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.3.3.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.3.3.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.2.0 .1.3.6.1.4.1.193.81.2.4.7.15.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.2.0 .1.3.6.1.4.1.193.81.2.4.7.15.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.1.2.0 .1.3.6.1.4.1.193.81.2.4.7.2.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.1.2.0 .1.3.6.1.4.1.193.81.2.4.7.2.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.4.1.0 .1.3.6.1.4.1.193.81.2.7.1.11.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.4.1.0 .1.3.6.1.4.1.193.81.2.7.1.11.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.3.3.0 .1.3.6.1.4.1.193.81.2.13.2.1.2.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.3.3.0 .1.3.6.1.4.1.193.81.2.13.2.1.2.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.1.2.0 .1.3.6.1.4.1.193.81.2.8.2.2.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.1.2.0 .1.3.6.1.4.1.193.81.2.8.2.2.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.4.8.4.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.4.8.4.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.4.1.2.1.12.12.2.0 .1.3.6.1.2.1.1.2.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.4.1.2.1.12.12.2.0 .1.3.6.1.2.1.1.2.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.6.15.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.6.15.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.6.14.0 .1.3.6.1.2.1.6.12.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.6.14.0 .1.3.6.1.2.1.6.12.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.6.5.0 .1.3.6.1.2.1.6.10.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.6.5.0 .1.3.6.1.2.1.6.10.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.6.7.0 .1.3.6.1.2.1.6.8.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.6.7.0 .1.3.6.1.2.1.6.8.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.6.9.0 .1.3.6.1.2.1.6.11.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.6.9.0 .1.3.6.1.2.1.6.11.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.6.6.0 .1.3.6.1.2.1.4.14.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.6.6.0 .1.3.6.1.2.1.4.14.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.4.23.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.4.23.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.4.3.0 .1.3.6.1.2.1.5.3.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.4.3.0 .1.3.6.1.2.1.5.3.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.5.1.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.5.1.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.4.9.0 .1.3.6.1.2.1.4.15.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.4.9.0 .1.3.6.1.2.1.4.15.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.5.2.0 .1.3.6.1.2.1.4.10.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.5.2.0 .1.3.6.1.2.1.4.10.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.4.6.0 .1.3.6.1.2.1.5.14.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.4.6.0 .1.3.6.1.2.1.5.14.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.4.8.0 .1.3.6.1.2.1.7.4.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.4.8.0 .1.3.6.1.2.1.7.4.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.7.1.0 .1.3.6.1.2.1.7.3.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.7.1.0 .1.3.6.1.2.1.7.3.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.7.2.0 .1.3.6.1.2.1.31.1.1.1.1.2013290496
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.7.2.0 .1.3.6.1.2.1.31.1.1.1.1.2013290496 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.1.2013290497
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.1.2013290497 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.1.2013290498 .1.3.6.1.2.1.31.1.1.1.1.2013290499
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.1.2013290498 .1.3.6.1.2.1.31.1.1.1.1.2013290499 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.1.2074099722
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.1.2074099722 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.1.2074112010 .1.3.6.1.2.1.31.1.1.1.1.2074136626
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.1.2074112010 .1.3.6.1.2.1.31.1.1.1.1.2074136626 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.1.2074137576 .1.3.6.1.2.1.31.1.1.1.1.2074138576
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.1.2074137576 .1.3.6.1.2.1.31.1.1.1.1.2074138576 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.1.2074140682 .1.3.6.1.2.1.31.1.1.1.1.2129658001
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.1.2074140682 .1.3.6.1.2.1.31.1.1.1.1.2129658001 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.1.2129658017 .1.3.6.1.2.1.31.1.1.1.1.2129658129
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.1.2129658017 .1.3.6.1.2.1.31.1.1.1.1.2129658129 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.1.2129658145 .1.3.6.1.2.1.31.1.1.1.1.2129658385
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.1.2129658145 .1.3.6.1.2.1.31.1.1.1.1.2129658385 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.1.2129658401
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.1.2129658401 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.1.2129666177 .1.3.6.1.2.1.31.1.1.1.1.2129666178
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.1.2129666177 .1.3.6.1.2.1.31.1.1.1.1.2129666178 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.1.2129666305
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.1.2129666305 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.1.2129666306 .1.3.6.1.2.1.31.1.1.1.1.2129666561
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.1.2129666306 .1.3.6.1.2.1.31.1.1.1.1.2129666561 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.1.2129666562 .1.3.6.1.2.1.31.1.1.1.1.2129674753
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.1.2129666562 .1.3.6.1.2.1.31.1.1.1.1.2129674753 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.1.2134639233 .1.3.6.1.2.1.31.1.1.1.1.2134639234
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.1.2134639233 .1.3.6.1.2.1.31.1.1.1.1.2134639234 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.1.2134639364 .1.3.6.1.2.1.31.1.1.1.1.2134639365
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.1.2134639364 .1.3.6.1.2.1.31.1.1.1.1.2134639365 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.1.2134639366 .1.3.6.1.2.1.31.1.1.1.1.2134639367 .1.3.6.1.2.1.31.1.1.1.1.2134639368 .1.3.6.1.2.1.31.1.1.1.1.2134646913 .1.3.6.1.2.1.31.1.1.1.1.2134646914 .1.3.6.1.2.1.31.1.1.1.1.2134647297 .1.3.6.1.2.1.31.1.1.1.1.2134672128 .1.3.6.1.2.1.31.1.1.1.1.2134885120 .1.3.6.1.2.1.31.1.1.1.1.2146435217 .1.3.6.1.2.1.31.1.1.1.1.2146435233 .1.3.6.1.2.1.31.1.1.1.1.2146435345
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.1.2134639366 .1.3.6.1.2.1.31.1.1.1.1.2134639367 .1.3.6.1.2.1.31.1.1.1.1.2134639368 .1.3.6.1.2.1.31.1.1.1.1.2134646913 .1.3.6.1.2.1.31.1.1.1.1.2134646914 .1.3.6.1.2.1.31.1.1.1.1.2134647297 .1.3.6.1.2.1.31.1.1.1.1.2134672128 .1.3.6.1.2.1.31.1.1.1.1.2134885120 .1.3.6.1.2.1.31.1.1.1.1.2146435217 .1.3.6.1.2.1.31.1.1.1.1.2146435233 .1.3.6.1.2.1.31.1.1.1.1.2146435345 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.1.2146435361 .1.3.6.1.2.1.31.1.1.1.1.2146435601 .1.3.6.1.2.1.31.1.1.1.1.2146435617 .1.3.6.1.2.1.31.1.1.1.1.2146443393 .1.3.6.1.2.1.31.1.1.1.1.2146443394 .1.3.6.1.2.1.31.1.1.1.1.2146443521 .1.3.6.1.2.1.31.1.1.1.1.2146443522 .1.3.6.1.2.1.31.1.1.1.1.2146443777 .1.3.6.1.2.1.31.1.1.1.1.2146443778 .1.3.6.1.2.1.31.1.1.1.1.2146451969 .1.3.6.1.2.1.31.1.1.1.1.2146459777 .1.3.6.1.2.1.31.1.1.1.1.2146459778 .1.3.6.1.2.1.31.1.1.1.1.2146468353
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.1.2146435361 .1.3.6.1.2.1.31.1.1.1.1.2146435601 .1.3.6.1.2.1.31.1.1.1.1.2146435617 .1.3.6.1.2.1.31.1.1.1.1.2146443393 .1.3.6.1.2.1.31.1.1.1.1.2146443394 .1.3.6.1.2.1.31.1.1.1.1.2146443521 .1.3.6.1.2.1.31.1.1.1.1.2146443522 .1.3.6.1.2.1.31.1.1.1.1.2146443777 .1.3.6.1.2.1.31.1.1.1.1.2146443778 .1.3.6.1.2.1.31.1.1.1.1.2146451969 .1.3.6.1.2.1.31.1.1.1.1.2146459777 .1.3.6.1.2.1.31.1.1.1.1.2146459778 .1.3.6.1.2.1.31.1.1.1.1.2146468353 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.1.2147352704 .1.3.6.1.2.1.31.1.1.1.1.2147353350 .1.3.6.1.2.1.31.1.1.1.1.2147353351 .1.3.6.1.2.1.31.1.1.1.1.2147353352 .1.3.6.1.2.1.31.1.1.1.1.2147353353
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.1.2147352704 .1.3.6.1.2.1.31.1.1.1.1.2147353350 .1.3.6.1.2.1.31.1.1.1.1.2147353351 .1.3.6.1.2.1.31.1.1.1.1.2147353352 .1.3.6.1.2.1.31.1.1.1.1.2147353353 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.1.2147443457 .1.3.6.1.2.1.31.1.1.1.1.2147468032
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.1.2147443457 .1.3.6.1.2.1.31.1.1.1.1.2147468032 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.10.18.8.1.3.2147352704.24 .1.3.6.1.2.1.10.18.8.1.4.2147352704.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.10.18.8.1.3.2147352704.24 .1.3.6.1.2.1.10.18.8.1.4.2147352704.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.10.18.8.1.6.2147352704.24 .1.3.6.1.2.1.10.18.8.1.13.2147352704.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.10.18.8.1.6.2147352704.24 .1.3.6.1.2.1.10.18.8.1.13.2147352704.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.10.18.8.1.3.2147353350.24 .1.3.6.1.2.1.10.18.8.1.4.2147353350.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.10.18.8.1.3.2147353350.24 .1.3.6.1.2.1.10.18.8.1.4.2147353350.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.10.18.8.1.6.2147353350.24 .1.3.6.1.2.1.10.18.8.1.13.2147353350.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.10.18.8.1.6.2147353350.24 .1.3.6.1.2.1.10.18.8.1.13.2147353350.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.10.18.8.1.3.2147353351.24 .1.3.6.1.2.1.10.18.8.1.4.2147353351.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.10.18.8.1.3.2147353351.24 .1.3.6.1.2.1.10.18.8.1.4.2147353351.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.10.18.8.1.6.2147353351.24 .1.3.6.1.2.1.10.18.8.1.13.2147353351.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.10.18.8.1.6.2147353351.24 .1.3.6.1.2.1.10.18.8.1.13.2147353351.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.10.18.8.1.3.2147353352.24 .1.3.6.1.2.1.10.18.8.1.4.2147353352.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.10.18.8.1.3.2147353352.24 .1.3.6.1.2.1.10.18.8.1.4.2147353352.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.10.18.8.1.6.2147353352.24 .1.3.6.1.2.1.10.18.8.1.13.2147353352.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.10.18.8.1.6.2147353352.24 .1.3.6.1.2.1.10.18.8.1.13.2147353352.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.10.18.8.1.3.2147353353.24 .1.3.6.1.2.1.10.18.8.1.4.2147353353.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.10.18.8.1.3.2147353353.24 .1.3.6.1.2.1.10.18.8.1.4.2147353353.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.10.18.8.1.6.2147353353.24 .1.3.6.1.2.1.10.18.8.1.13.2147353353.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.10.18.8.1.6.2147353353.24 .1.3.6.1.2.1.10.18.8.1.13.2147353353.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129658001.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129658001.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129658001.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129658001.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129658001.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129658001.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129658001.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129658001.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129658001.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129658001.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129658001.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129658001.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129658001.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129658001.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129658001.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129658001.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129658001.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129658001.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129658001.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129658001.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129658001.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129658001.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129658001.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129658001.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129658001.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129658001.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129658001.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129658001.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129658001.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129658001.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129658017.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129658001.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129658017.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129658017.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129658017.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129658017.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129658017.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129658017.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129658017.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129658017.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129658017.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129658017.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129658017.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129658017.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129658017.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129658017.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129658017.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129658017.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129658017.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129658017.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129658017.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129658017.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129658017.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129658017.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129658017.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129658017.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129658017.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129658017.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129658017.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129658017.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129658017.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129658017.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129658017.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129658017.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129658129.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129658129.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129658129.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129658129.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129658129.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129658129.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129658129.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129658129.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129658129.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129658129.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129658129.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129658129.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129658129.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129658129.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129658129.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129658129.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129658129.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129658129.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129658129.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129658129.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129658129.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129658129.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129658129.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129658129.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129658129.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129658129.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129658129.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129658129.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129658129.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129658129.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129658145.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129658129.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129658145.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129658145.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129658145.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129658145.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129658145.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129658145.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129658145.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129658145.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129658145.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129658145.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129658145.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129658385.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129658145.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129658385.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129658401.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129658385.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129658401.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129666177.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129658401.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129666177.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129666178.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129666177.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129666178.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129666305.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129666178.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129666305.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129666305.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129666561.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129666306.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129666561.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129666562.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129666561.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129666562.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129674753.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129666562.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2129674753.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2134885120.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2129674753.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2134885120.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146435217.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2134885120.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146435217.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146435233.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146435217.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146435233.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146435345.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146435233.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146435345.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146435361.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146435345.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146435361.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146435601.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146435361.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146435601.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146435617.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146435601.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146435617.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146443393.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146435617.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146443393.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146443394.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146443393.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146443394.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146443521.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146443394.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146443521.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146443522.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146443521.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146443522.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146443777.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146443522.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146443777.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146443778.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146443777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146443778.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146451969.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146443778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146451969.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146459777.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146451969.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146459777.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146459778.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146459777.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146459778.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146468353.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146459778.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2146468353.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2147468032.24
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2146468353.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.10.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.2.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.19.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.5.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.7.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.18.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.32.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.12.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.6.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.24.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.31.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.15.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.11.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.30.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.29.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.20.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.16.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.17.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.22.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.9.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.23.2147468032.24 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2147468032.24 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.3.1 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.4.1 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.3.2 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.4.2 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.3.3 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.4.3 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.3.4 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.4.4 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.3.5 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.4.5 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.3.6 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.4.6 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.3.1 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.4.1 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.3.2 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.4.2 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.3.3 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.4.3 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.3.4 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.4.4 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.3.5 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.4.5
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.2.6.1.3.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.8.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.25.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.14.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.21.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.28.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.27.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.13.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.4.2147468032.24 .1.3.6.1.4.1.193.81.3.4.5.2.6.1.26.2147468032.24 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.3.1 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.4.1 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.3.2 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.4.2 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.3.3 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.4.3 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.3.4 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.4.4 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.3.5 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.4.5 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.3.6 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.4.6 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.3.1 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.4.1 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.3.2 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.4.2 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.3.3 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.4.3 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.3.4 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.4.4 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.3.5 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.4.5 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.4.17.2.2.1.3.6 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.4.6 .1.3.6.1.4.1.193.81.2.15.1.3.1.1.2.1 .1.3.6.1.2.1.1.2.0 .1.3.6.1.4.1.193.81.2.4.7.2.0 .1.3.6.1.2.1.47.1.4.1.0 .1.3.6.1.4.1.193.81.2.7.1.11.0 .1.3.6.1.4.1.193.81.2.13.2.3.3.0 .1.3.6.1.4.1.193.81.2.13.2.1.2.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.4.17.2.2.1.3.6 .1.3.6.1.4.1.193.81.2.4.17.2.2.1.4.6 .1.3.6.1.4.1.193.81.2.15.1.3.1.1.2.1 .1.3.6.1.2.1.1.2.0 .1.3.6.1.4.1.193.81.2.4.7.2.0 .1.3.6.1.2.1.47.1.4.1.0 .1.3.6.1.4.1.193.81.2.7.1.11.0 .1.3.6.1.4.1.193.81.2.13.2.3.3.0 .1.3.6.1.4.1.193.81.2.13.2.1.2.0 \n" ; exit 1}
eof { }
}
EOF

Result=$?
EndTime=`date +%s%3N`
StartTime1=`expr $StartTime / 1000`
StartTimeFormat=`date -d @$StartTime1`
EndTime1=`expr $EndTime / 1000`
EndTimeFormat=`date -d @$EndTime1`
Diff=`expr $EndTime - $StartTime`
echo "${NODE_NAME} $StartTime:::$StartTimeFormat $EndTime:::$EndTimeFormat $Diff" >> mltnpmstats.log

if [[ $Result -ne 0 ]]
then
echo "Mltn Pm failed"
exit 1
else
echo "Mltn Pm collection completed successfully"
fi

