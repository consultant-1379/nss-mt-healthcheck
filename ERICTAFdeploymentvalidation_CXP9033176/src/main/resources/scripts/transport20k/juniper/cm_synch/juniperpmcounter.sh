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



spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.1.20
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.1.20 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.1.40
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.1.40 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.1.571
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.1.571 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.2.20
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.2.20 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.2.40
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.2.40 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.2.571
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.2.571 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.3.20
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.3.20 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.3.40
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.3.40 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.3.571
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.3.571 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.4.20
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.4.20 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.4.40
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.4.40 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.4.571
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.4.571 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.5.20
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.5.20 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.5.40
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.5.40 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.5.571
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.5.571 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.6.20
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.6.20 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.6.40
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.6.40 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.6.571
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.6.571 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.7.20
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.7.20 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.7.40
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.7.40 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.7.571
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.7.571 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.8.20
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.8.20 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.8.40
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.8.40 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.8.571
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.8.571 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.9.20
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.9.20 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.9.40
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.9.40 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.9.571
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.9.571 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.10.20
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.10.20 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.10.40
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.10.40 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.10.571
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.10.571 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.11.20
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.11.20 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.11.40
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.11.40 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.11.571
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.11.571 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.12.20
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.12.20 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.12.40
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.12.40 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.12.571
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.12.571 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.13.20
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.13.20 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.13.40
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.13.40 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.13.571
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.13.571 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.14.20
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.14.20 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.14.40
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.14.40 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.14.571
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.14.571 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.15.20
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.15.20 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.15.40
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.15.40 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.15.571
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.15.571 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.16.20
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.16.20 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.16.40
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.16.40 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.16.571
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.16.571 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.17.20
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.17.20 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.17.40
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.17.40 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.17.571
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.17.571 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.18.20
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.18.20 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.18.40
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.18.40 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.18.571
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.18.571 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.19.20
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.19.20 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.19.40
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.19.40 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.19.571
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.19.571 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.2 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.2.1.3.0.511
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.2.1.3.0.511 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.2.1.3.0.550
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.2.1.3.0.550 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.2.1.3.0.570
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.2.1.3.0.570 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.2.1.3.0.596
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.2.1.3.0.596 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.2.1.3.5.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.2.1.3.5.0 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.2.1.3.508.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.2.1.3.508.0 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.2.1.3.528.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.2.1.3.528.0 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.2.1.3.548.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.2.1.3.548.0 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.2.1.3.568.541
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.2.1.3.568.541 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.2.1.3.597.601
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.2.1.3.597.601 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.2.1.3.613.614
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.2.1.3.613.614 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.25.6.3
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.25.6.3 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.25.6.3.1.1.51
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.25.6.3.1.1.51 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.25.6.3.1.1.71
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.25.6.3.1.1.71 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.25.6.3.1.1.91
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.25.6.3.1.1.91 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.25.6.3.1.2.47
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.25.6.3.1.2.47 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.25.6.3.1.2.65
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.25.6.3.1.2.65 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.25.6.3.1.2.83
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.25.6.3.1.2.83 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.25.6.3.1.3.29
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.25.6.3.1.3.29 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.25.6.3.1.3.59
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.25.6.3.1.3.59 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.25.6.3.1.3.79
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.25.6.3.1.3.79 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.25.6.3.1.4.25
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.25.6.3.1.4.25 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.25.6.3.1.4.55
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.25.6.3.1.4.55 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.25.6.3.1.4.75
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.25.6.3.1.4.75 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.25.6.3.1.4.95
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.25.6.3.1.4.95 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.25.6.3.1.5.51
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.25.6.3.1.5.51 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.25.6.3.1.5.71
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.25.6.3.1.5.71 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.25.6.3.1.5.91
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.25.6.3.1.5.91 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.25.2.3
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.25.2.3 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.25.2.3.1.1.28
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.25.2.3.1.1.28 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.25.2.3.1.1.48
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.25.2.3.1.1.48 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.25.2.3.1.2.22
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.25.2.3.1.2.22 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.25.2.3.1.2.42
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.25.2.3.1.2.42 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.25.2.3.1.3.16
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.25.2.3.1.3.16 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.25.2.3.1.3.32
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.25.2.3.1.3.32 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.25.2.3.1.3.48
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.25.2.3.1.3.48 \n" ; exit 1}
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
echo "Juniper CM synch failed"
exit 1
else
echo "Juniper CM synch completed successfully"
fi

