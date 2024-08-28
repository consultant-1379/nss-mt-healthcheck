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



spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.1.1.2.10.70.65.76.49.50.52.50.53.51.55
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.1.1.2.10.70.65.76.49.50.52.50.53.51.55 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.1.1.3.10.70.65.76.49.50.52.50.53.49.53
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.1.1.3.10.70.65.76.49.50.52.50.53.49.53 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.1.1.3.10.70.65.76.49.50.52.50.53.51.56
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.1.1.3.10.70.65.76.49.50.52.50.53.51.56 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.1.1.4.10.70.65.76.49.50.52.50.53.49.55
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.1.1.4.10.70.65.76.49.50.52.50.53.49.55 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.1.1.4.10.70.65.76.49.50.52.50.53.52.48
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.1.1.4.10.70.65.76.49.50.52.50.53.52.48 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.1.1.5.10.70.65.76.49.50.52.50.53.49.56
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.1.1.5.10.70.65.76.49.50.52.50.53.49.56 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.1.1.5.10.70.65.76.49.50.52.50.53.52.49
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.1.1.5.10.70.65.76.49.50.52.50.53.52.49 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.1.1.6.10.70.65.76.49.50.52.50.53.49.57
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.1.1.6.10.70.65.76.49.50.52.50.53.49.57 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.1.1.6.10.70.65.76.49.50.52.50.53.52.50
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.1.1.6.10.70.65.76.49.50.52.50.53.52.50 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.1.1.7.10.70.65.76.49.50.52.50.53.50.49
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.1.1.7.10.70.65.76.49.50.52.50.53.50.49 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.1.1.7.10.70.65.76.49.50.52.50.53.52.51
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.1.1.7.10.70.65.76.49.50.52.50.53.52.51 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.2 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.1.1.3.2.7
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.1.1.3.2.7 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.1.1.4.1.13
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.1.1.4.1.13 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.1.1.5.1.6
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.1.1.5.1.6 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.1.1.5.2.13
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.1.1.5.2.13 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.1.1.6.2.6
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.1.1.6.2.6 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.1.1.8.1.12
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.1.1.8.1.12 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.1.1.9.1.5
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.1.1.9.1.5 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.1.1.9.2.12
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.1.1.9.2.12 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6.1.1.1954848767.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6.1.1.1954848767.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6.1.3.1954828799.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6.1.3.1954828799.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6.1.4.1954816511.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6.1.4.1954816511.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6.1.5.1954812415.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6.1.5.1954812415.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6.1.6.1686422271.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6.1.6.1686422271.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6.1.7.1686421503.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6.1.7.1686421503.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6.1.8.1686417919.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6.1.8.1686417919.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6.1.9.1686393599.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6.1.9.1686393599.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.2.1686422015
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.2.1686422015 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.2.1694809872
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.2.1694809872 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.2.1921273855
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.2.1921273855 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.2.1938292735
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.2.1938292735 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.2.1963208448
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.2.1963208448 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.2.1963237254
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.2.1963237254 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.3.1652822527
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.3.1652822527 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.3.1686425599
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.3.1686425599 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.3.1694810065
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.3.1694810065 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.3.1921274623
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.3.1921274623 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.3.1954815999
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.3.1954815999 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.3.1963217152
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.3.1963217152 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.3.1963237256
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.3.1963237256 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.4.1652838911
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.4.1652838911 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.4.1694768896
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.4.1694768896 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.4.1694810081
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.4.1694810081 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.4.1921282047
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.4.1921282047 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.4.1954820095
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.4.1954820095 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.4.1963220736
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.4.1963220736 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.4.1963241984
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.4.1963241984 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.5.1652863487
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.5.1652863487 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.5.1694769408
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.5.1694769408 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.5.1694810624
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.5.1694810624 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.5.1921290239
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.5.1921290239 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.5.1954829055
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.5.1954829055 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.5.1963220944
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.5.1963220944 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.5.1963245328
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.5.1963245328 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.6.1652867583
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.6.1652867583 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.6.1694773216
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.6.1694773216 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.6.1694813968
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.6.1694813968 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.6.1921292031
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.6.1921292031 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.6.1954845183
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.6.1954845183 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.6.1963220960
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.6.1963220960 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.6.1963245521
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.6.1963245521 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.7.1686376959
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.7.1686376959 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.7.1694781952
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.7.1694781952 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.7.1694814161
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.7.1694814161 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.7.1921292543
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.7.1921292543 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.7.1954853375
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.7.1954853375 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.7.1963237120
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.7.1963237120 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.7.1963245537
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.7.1963245537 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.8.1686381055
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.8.1686381055 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.8.1694785296
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.8.1694785296 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.8.1694814177
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.8.1694814177 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.8.1921298431
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.8.1921298431 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.8.1954856959
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.8.1954856959 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.8.1963237168
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.8.1963237168 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.8.1963246080
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.8.1963246080 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.9.1686393343
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.9.1686393343 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.9.1694785489
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.9.1694785489 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.9.1921257471
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.9.1921257471 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.9.1921299199
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.9.1921299199 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.9.1954857727
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.9.1954857727 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.9.1963237248
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.9.1963237248 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.9.1963249424
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.9.1963249424 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.10.1686396927
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.10.1686396927 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.10.1694785505
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.10.1694785505 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.10.1921261567
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.10.1921261567 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.10.1921303039
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.10.1921303039 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.10.1963200768
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.10.1963200768 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.10.1963237250
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.10.1963237250 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.10.1963249617
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.10.1963249617 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.11.1686418175
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.11.1686418175 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.11.1694806528
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.11.1694806528 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.11.1921265663
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.11.1921265663 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 3 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.11.1921306623
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.11.1921306623 \n" ; exit 1}
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

