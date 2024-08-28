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



spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.1.1.2.10.70.65.76.49.50.52.50.53.51.54
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.1.1.2.10.70.65.76.49.50.52.50.53.51.54 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.1.1.2.10.70.65.76.49.50.52.51.48.51.57
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.1.1.2.10.70.65.76.49.50.52.51.48.51.57 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.1.1.3.10.70.65.76.49.50.52.50.53.51.54
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.1.1.3.10.70.65.76.49.50.52.50.53.51.54 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.1.1.3.10.70.65.76.49.50.52.51.48.51.57
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.1.1.3.10.70.65.76.49.50.52.51.48.51.57 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.1.1.4.10.70.65.76.49.50.52.50.53.51.54
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.1.1.4.10.70.65.76.49.50.52.50.53.51.54 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.1.1.4.10.70.65.76.49.50.52.51.48.51.57
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.1.1.4.10.70.65.76.49.50.52.51.48.51.57 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.1.1.5.10.70.65.76.49.50.52.50.53.51.54
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.1.1.5.10.70.65.76.49.50.52.50.53.51.54 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.1.1.5.10.70.65.76.49.50.52.51.48.51.57
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.1.1.5.10.70.65.76.49.50.52.51.48.51.57 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.1.1.6.10.70.65.76.49.50.52.50.53.51.54
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.1.1.6.10.70.65.76.49.50.52.50.53.51.54 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.1.1.6.10.70.65.76.49.50.52.51.48.51.57
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.1.1.6.10.70.65.76.49.50.52.51.48.51.57 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.1.1.7.10.70.65.76.49.50.52.50.53.51.54
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.1.1.7.10.70.65.76.49.50.52.50.53.51.54 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.1.1.7.10.70.65.76.49.50.52.51.48.51.57
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.1.1.7.10.70.65.76.49.50.52.51.48.51.57 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.2 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.1.1.3.2.5
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.1.1.3.2.5 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.1.1.4.1.11
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.1.1.4.1.11 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.1.1.5.1.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.1.1.5.1.2 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.1.1.5.2.7
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.1.1.5.2.7 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.1.1.6.1.13
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.1.1.6.1.13 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.1.1.8.1.4
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.1.1.8.1.4 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.1.1.8.2.9
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.1.1.8.2.9 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.1.1.9.1.15
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.1.1.9.1.15 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6.1.1.1954836479.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6.1.1.1954836479.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6.1.3.1954836479.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6.1.3.1954836479.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6.1.4.1954836479.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6.1.4.1954836479.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6.1.5.1954836479.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6.1.5.1954836479.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6.1.6.1954836479.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6.1.6.1954836479.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6.1.7.1954836479.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6.1.7.1954836479.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6.1.8.1954836479.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6.1.8.1954836479.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6.1.9.1954836479.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6.1.9.1954836479.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.2.1694768912
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.2.1694768912 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.2.1921262079
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.2.1921262079 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.2.1954812415
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.2.1954812415 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.2.1963204368
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.2.1963204368 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.2.1963224896
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.2.1963224896 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.3.1686380543
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.3.1686380543 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.3.1694777856
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.3.1694777856 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.3.1921275135
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.3.1921275135 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.3.1954829055
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.3.1954829055 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.3.1963213312
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.3.1963213312 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.3.1963224966
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.3.1963224966 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.4.1694768912
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.4.1694768912 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.4.1921262079
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.4.1921262079 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.4.1954812415
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.4.1954812415 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.4.1963204368
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.4.1963204368 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.4.1963224896
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.4.1963224896 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.5.1686380543
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.5.1686380543 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.5.1694777856
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.5.1694777856 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.5.1921275135
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.5.1921275135 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.5.1954829055
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.5.1954829055 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.5.1963213312
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.5.1963213312 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.5.1963224966
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.5.1963224966 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.6.1694768912
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.6.1694768912 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.6.1921262079
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.6.1921262079 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.6.1954812415
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.6.1954812415 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.6.1963204368
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.6.1963204368 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.6.1963224896
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.6.1963224896 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.7.1686380543
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.7.1686380543 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.7.1694777856
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.7.1694777856 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.7.1921275135
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.7.1921275135 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.7.1954829055
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.7.1954829055 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.7.1963213312
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.7.1963213312 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.7.1963224966
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.7.1963224966 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.8.1694768912
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.8.1694768912 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.8.1921262079
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.8.1921262079 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.8.1954812415
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.8.1954812415 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.8.1963204368
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.8.1963204368 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.8.1963224896
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.8.1963224896 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.9.1686380543
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.9.1686380543 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.9.1694777856
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.9.1694777856 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.9.1921275135
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.9.1921275135 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.9.1954829055
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.9.1954829055 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.9.1963213312
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.9.1963213312 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.9.1963224966
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.9.1963224966 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.10.1694768912
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.10.1694768912 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.10.1921262079
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.10.1921262079 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.10.1954812415
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.10.1954812415 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.10.1963204368
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.10.1963204368 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.10.1963224896
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.10.1963224896 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.11.1686380543
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.11.1686380543 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.11.1694777856
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.11.1694777856 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.11.1921275135
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.11.1921275135 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.11.1954829055
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.11.1954829055 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.11.1963213312
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.11.1963213312 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.11.1963224966
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.11.1963224966 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.12.1694768912
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.12.1694768912 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.12.1921262079
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.12.1921262079 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.12.1954812415
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.12.1954812415 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.12.1963204368
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.12.1963204368 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.12.1963224896
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.12.1963224896 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.13.1686380543
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.13.1686380543 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.13.1694777856
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.13.1694777856 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.13.1921275135
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.13.1921275135 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.13.1954829055
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.13.1954829055 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.13.1963213312
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.13.1963213312 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.13.1963224966
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.13.1963224966 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.14.1694768912
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.14.1694768912 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.14.1921262079
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.14.1921262079 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.14.1954812415
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.14.1954812415 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.14.1963204368
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.14.1963204368 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.14.1963224896
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.14.1963224896 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.15.1686380543
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.15.1686380543 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.15.1694777856
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.15.1694777856 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.15.1921275135
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.15.1921275135 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.15.1954829055
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.15.1954829055 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.15.1963213312
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.15.1963213312 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.15.1963224966
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.15.1963224966 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.16.1694768912
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.16.1694768912 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.16.1921262079
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.16.1921262079 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.16.1954812415
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.16.1954812415 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.16.1963204368
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.16.1963204368 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.16.1963224896
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.16.1963224896 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921274367.10257
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921274367.10257 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921274367.14340
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921274367.14340 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921274367.14464
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921274367.14464 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921274623.10253
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921274623.10253 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921274623.12807
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921274623.12807 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921274623.14356
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921274623.14356 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921274879.10249
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921274879.10249 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921274879.10516
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921274879.10516 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921274879.14352
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921274879.14352 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921275135.10245
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921275135.10245 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921275135.10265
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921275135.10265 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921275135.14348
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921275135.14348 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921275391.10516
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921275391.10516 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921279743.10251
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921279743.10251 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921279743.12803
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921279743.12803 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921279743.14354
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921279743.14354 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921279999.10247
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921279999.10247 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921279999.10371
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921279999.10371 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921279999.14350
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921279999.14350 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921280255.10243
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921280255.10243 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921280255.10263
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921280255.10263 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921280255.14346
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.1.1921280255.14346 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921274367.8710
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921274367.8710 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921274367.10259
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921274367.10259 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921274367.14342
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921274367.14342 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921274367.14466
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921274367.14466 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921274623.10255
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921274623.10255 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921274623.14337
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921274623.14337 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921274623.14358
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921274623.14358 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921274879.10251
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921274879.10251 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921274879.12803
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921274879.12803 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921274879.14354
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921274879.14354 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921275135.10247
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921275135.10247 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921275135.10371
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921275135.10371 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921275135.14350
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921275135.14350 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921275391.14464
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921275391.14464 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921279743.10253
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921279743.10253 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921279743.12807
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921279743.12807 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921279743.14356
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921279743.14356 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921279999.10249
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921279999.10249 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921279999.10516
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921279999.10516 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921279999.14352
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921279999.14352 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921280255.10245
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921280255.10245 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921280255.10265
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921280255.10265 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921280255.14348
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.2.1921280255.14348 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921274367.8723
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921274367.8723 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921274367.10261
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921274367.10261 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921274367.14344
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921274367.14344 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921274367.14468
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921274367.14468 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921274623.10257
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921274623.10257 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921274623.14340
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921274623.14340 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921274623.14464
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921274623.14464 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921274879.10253
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921274879.10253 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921274879.12807
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921274879.12807 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921274879.14356
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921274879.14356 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921275135.10249
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921275135.10249 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921275135.10516
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921275135.10516 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921275135.14352
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921275135.14352 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921275391.14466
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921275391.14466 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921279743.10255
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921279743.10255 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921279743.14337
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921279743.14337 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921279743.14358
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921279743.14358 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921279999.10251
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921279999.10251 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921279999.12803
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921279999.12803 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921279999.14354
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921279999.14354 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921280255.10247
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921280255.10247 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921280255.10371
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921280255.10371 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921280255.14350
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.3.1.3.1921280255.14350 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.1.2129666306
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.1.2129666306 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.1.2146435601
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.1.2146435601 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.2.2013290497
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.2.2013290497 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.2.2129666562
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.2.2129666562 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.2.2146443393
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.2.2146443393 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.3.2013290499
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.3.2013290499 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.3.2134639233
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.3.2134639233 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.3.2146443521
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.3.2146443521 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.4.2074112010
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.4.2074112010 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.4.2134639364
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.4.2134639364 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.4.2146443777
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.4.2146443777 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.5.2074137576
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.5.2074137576 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.5.2134639366
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.5.2134639366 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.5.2146451969
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.5.2146451969 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.6.2074140682
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.6.2074140682 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.6.2134639368
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.6.2134639368 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.6.2146459778
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.6.2146459778 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.7.2129658017
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.7.2129658017 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.7.2134646914
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.7.2134646914 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.7.2147352704
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.7.2147352704 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.8.2129658145
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.8.2129658145 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.8.2134672128
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.8.2134672128 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.8.2147353351
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.8.2147353351 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.9.2129658401
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.9.2129658401 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.9.2146435217
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.9.2146435217 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.9.2147353353
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.9.2147353353 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.10.2129666178
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.10.2129666178 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.10.2146435345
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.10.2146435345 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.10.2147468032
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.10.2147468032 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.11.2129666306
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.11.2129666306 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.11.2146435601
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.11.2146435601 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.12.2013290497
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.12.2013290497 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.12.2129666562
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.12.2129666562 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.12.2146443393
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.12.2146443393 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.13.2013290499
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.13.2013290499 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.13.2134639233
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.13.2134639233 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.13.2146443521
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.13.2146443521 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.14.2074112010
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.14.2074112010 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.14.2134639364
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.14.2134639364 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.14.2146443777
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.14.2146443777 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.15.2074137576
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.15.2074137576 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.15.2134639366
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.15.2134639366 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.15.2146451969
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.15.2146451969 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.16.2074140682
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.16.2074140682 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.16.2134639368
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.16.2134639368 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.16.2146459778
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.16.2146459778 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.17.2129658017
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.17.2129658017 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.17.2134646914
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.17.2134646914 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.17.2147352704
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.17.2147352704 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.18.2129658145
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.18.2129658145 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.18.2134672128
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.18.2134672128 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.18.2147353351
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.18.2147353351 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.19.2129658401
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.19.2129658401 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.19.2146435217
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.19.2146435217 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.19.2147353353
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.19.2147353353 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.20.2129666178
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.20.2129666178 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.20.2146435345
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.20.2146435345 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.20.2147468032
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.20.2147468032 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.21.2129666306
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.21.2129666306 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.21.2146435601
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.21.2146435601 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.22.2013290497
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.22.2013290497 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.22.2129666562
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.22.2129666562 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.2.2.1.22.2146443393
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.2.2.1.22.2146443393 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.1.2129666306
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.1.2129666306 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.1.2146435601
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.1.2146435601 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.2.2013290497
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.2.2013290497 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.2.2129666562
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.2.2129666562 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.2.2146443393
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.2.2146443393 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.3.2013290499
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.3.2013290499 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.3.2134639233
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.3.2134639233 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.3.2146443521
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.3.2146443521 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.4.2074112010
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.4.2074112010 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.4.2134639364
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.4.2134639364 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.4.2146443777
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.4.2146443777 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.5.2074137576
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.5.2074137576 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.5.2134639366
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.5.2134639366 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.5.2146451969
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.5.2146451969 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.6.2074140682
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.6.2074140682 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.6.2134639368
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.6.2134639368 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.6.2146459778
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.6.2146459778 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.7.2129658017
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.7.2129658017 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.7.2134646914
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.7.2134646914 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.7.2147352704
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.7.2147352704 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.8.2129658145
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.8.2129658145 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.8.2134672128
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.8.2134672128 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.8.2147353351
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.8.2147353351 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.9.2129658401
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.9.2129658401 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.9.2146435217
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.9.2146435217 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.9.2147353353
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.9.2147353353 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.10.2129666178
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.10.2129666178 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.10.2146435345
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.10.2146435345 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.10.2147468032
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.10.2147468032 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.11.2129666306
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.11.2129666306 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.11.2146435601
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.11.2146435601 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.12.2013290497
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.12.2013290497 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.12.2129666562
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.12.2129666562 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.12.2146443393
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.12.2146443393 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.13.2013290499
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.13.2013290499 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.13.2134639233
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.13.2134639233 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.13.2146443521
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.13.2146443521 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.14.2074112010
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.14.2074112010 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.14.2134639364
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.14.2134639364 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.14.2146443777
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.14.2146443777 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.15.2074137576
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.15.2074137576 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.15.2134639366
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.15.2134639366 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.15.2146451969
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.15.2146451969 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.16.2074140682
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.16.2074140682 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.16.2134639368
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.16.2134639368 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.16.2146459778
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.16.2146459778 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.17.2129658017
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.17.2129658017 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.17.2134646914
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.17.2134646914 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.17.2147352704
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.17.2147352704 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.18.2129658145
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.18.2129658145 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.18.2134672128
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.18.2134672128 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.18.2147353351
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.18.2147353351 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.19.2129658401
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.19.2129658401 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.19.2146435217
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.19.2146435217 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.1.1.19.2147353353
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.1.1.19.2147353353 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.12.11.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.12.11.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.12.11.1.1.3.2134639367
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.12.11.1.1.3.2134639367 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.12.11.1.1.6.2134639366
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.12.11.1.1.6.2134639366 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.12.11.1.1.9.2134639365
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.12.11.1.1.9.2134639365 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.4.1.3.1.1.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.4.1.3.1.1.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.4.1.3.1.1.1.1.2.2134646914
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.4.1.3.1.1.1.1.2.2134646914 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.4.1.3.1.1.1.1.4.2134639368
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.4.1.3.1.1.1.1.4.2134639368 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.4.1.3.1.1.1.1.6.2134639366
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.4.1.3.1.1.1.1.6.2134639366 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.4.1.3.1.1.1.1.8.2134639364
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.4.1.3.1.1.1.1.8.2134639364 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.4.1.3.1.1.1.1.10.2134639233
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.4.1.3.1.1.1.1.10.2134639233 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.4.1.3.1.1.1.1.11.2134647297
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.4.1.3.1.1.1.1.11.2134647297 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.4.1.3.1.1.1.1.13.2134646913
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.4.1.3.1.1.1.1.13.2134646913 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.4.1.3.1.1.1.1.15.2134639367
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.4.1.3.1.1.1.1.15.2134639367 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.4.1.3.1.1.1.1.17.2134639365
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.4.1.3.1.1.1.1.17.2134639365 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.111.2.802.1.1.13.1.3.7
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.111.2.802.1.1.13.1.3.7 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.111.2.802.1.1.13.1.1.11
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.111.2.802.1.1.13.1.1.11 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.111.2.802.1.1.13.1.4.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.111.2.802.1.1.13.1.4.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.17.1.4
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.17.1.4 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.17.1.4.1.2.5
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.17.1.4.1.2.5 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.17.1.4.1.3.10
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.17.1.4.1.3.10 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.17.1.4.1.4.15
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.17.1.4.1.4.15 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.4.1.2.1.7.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.4.1.2.1.7.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.4.1.2.1.7.1.1.10.14
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.4.1.2.1.7.1.1.10.14 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.1.1.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.1.1.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.3
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.3 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.3.1.2.8
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.3.1.2.8 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.3.1.4.4
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.3.1.4.4 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.3.1.5.12
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.3.1.5.12 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.3.1.7.8
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.3.1.7.8 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.3.1.9.4
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.3.1.9.4 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.3.1.10.12
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.3.1.10.12 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.3.1.12.8
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.3.1.12.8 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.3.1.14.4
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.3.1.14.4 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.3.1.15.12
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.3.1.15.12 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.3.1.17.8
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.3.1.17.8 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.3.1.19.4
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.3.1.19.4 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.3.1.20.12
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.3.1.20.12 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.3.1.22.8
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.3.1.22.8 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.3.1.24.4
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.3.1.24.4 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.1.2.3
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.1.2.3 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.1.3.6
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.1.3.6 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.1.4.12
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.1.4.12 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.1.6.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.1.6.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.1.7.7
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.1.7.7 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.1.8.13
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.1.8.13 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.1.10.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.1.10.2 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.1.11.8
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.1.11.8 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.1.12.14
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.1.12.14 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.2.2.3
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.2.2.3 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.2.3.6
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.2.3.6 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.2.4.12
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.2.4.12 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.2.6.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.2.6.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.2.7.7
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.2.7.7 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.2.8.13
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.2.8.13 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.2.10.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.2.10.2 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.2.11.8
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.2.11.8 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.2.12.14
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.2.12.14 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.3.2.3
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.3.2.3 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.3.3.6
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.3.3.6 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.3.4.12
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.3.4.12 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.3.6.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.3.6.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.3.7.7
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.3.7.7 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.3.8.13
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.3.8.13 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.3.10.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.3.10.2 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.3.11.8
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.3.11.8 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.3.12.14
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.3.12.14 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.4.2.3
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.4.2.3 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.4.3.6
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.4.3.6 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.4.4.12
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.4.4.12 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.4.6.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.4.6.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.4.7.7
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.4.7.7 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.4.8.13
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.4.8.13 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.4.10.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.4.10.2 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.4.11.8
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.4.11.8 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.4.12.14
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.4.12.14 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.5.2.3
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.5.2.3 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.5.3.6
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.5.3.6 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.5.4.12
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.5.4.12 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.5.6.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.5.6.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.5.7.7
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.5.7.7 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.5.8.13
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.5.8.13 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.5.10.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.5.10.2 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.5.11.8
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.5.11.8 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.5.12.14
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.5.12.14 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.6.2.3
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.6.2.3 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.6.3.6
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.6.3.6 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.6.4.12
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.6.4.12 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.6.6.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.6.6.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.6.7.7
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.6.7.7 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.6.8.13
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.6.8.13 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.6.10.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.6.10.2 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.6.11.8
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.6.11.8 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.4.1.6.12.14
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.4.1.6.12.14 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.1.2129666306
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.1.2129666306 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.1.2146435601
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.1.2146435601 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.2.2013290497
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.2.2013290497 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.2.2129666562
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.2.2129666562 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.2.2146443393
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.2.2146443393 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.3.2013290499
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.3.2013290499 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.3.2134639233
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.3.2134639233 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.3.2146443521
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.3.2146443521 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.4.2074112010
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.4.2074112010 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.4.2134639364
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.4.2134639364 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.4.2146443777
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.4.2146443777 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.5.2074137576
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.5.2074137576 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.5.2134639366
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.5.2134639366 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.5.2146451969
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.5.2146451969 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.6.2074140682
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.6.2074140682 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.6.2134639368
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.6.2134639368 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.6.2146459778
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.6.2146459778 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.7.2129658017
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.7.2129658017 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.7.2134646914
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.7.2134646914 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.7.2147352704
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.7.2147352704 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.8.2129658145
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.8.2129658145 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.8.2134672128
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.8.2134672128 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.8.2147353351
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.8.2147353351 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.9.2129658401
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.9.2129658401 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.9.2146435217
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.9.2146435217 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.9.2147353353
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.9.2147353353 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.10.2129666178
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.10.2129666178 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.10.2146435345
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.10.2146435345 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.10.2147468032
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.10.2147468032 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.11.2129666306
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.11.2129666306 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.11.2146435601
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.11.2146435601 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.12.2013290497
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.12.2013290497 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.12.2129666562
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.12.2129666562 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.12.2146443393
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.12.2146443393 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.13.2013290499
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.13.2013290499 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.13.2134639233
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.13.2134639233 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.13.2146443521
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.13.2146443521 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.14.2074112010
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.14.2074112010 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.14.2134639364
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.14.2134639364 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.14.2146443777
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.14.2146443777 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.15.2074137576
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.15.2074137576 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.15.2134639366
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.15.2134639366 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.15.2146451969
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.15.2146451969 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.16.2074140682
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.16.2074140682 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.16.2134639368
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.16.2134639368 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.16.2146459778
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.16.2146459778 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.17.2129658017
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.17.2129658017 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.17.2134646914
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.17.2134646914 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.17.2147352704
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.17.2147352704 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.18.2129658145
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.18.2129658145 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.18.2134672128
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.18.2134672128 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.18.2147353351
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.18.2147353351 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.19.2129658401
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.19.2129658401 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.19.2146435217
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.19.2146435217 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.19.2147353353
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.19.2147353353 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.20.2129666178
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.20.2129666178 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.20.2146435345
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.20.2146435345 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.20.2147468032
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.20.2147468032 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.21.2129666306
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.21.2129666306 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.21.2146435601
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.21.2146435601 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.22.2013290497
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.22.2013290497 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.22.2129666562
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.22.2129666562 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.22.2146443393
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.22.2146443393 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.23.2013290499
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.23.2013290499 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.23.2134639233
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.23.2134639233 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.23.2146443521
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.23.2146443521 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.24.2074112010
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.24.2074112010 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.24.2134639364
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.24.2134639364 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.24.2146443777
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.24.2146443777 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.25.2074137576
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.25.2074137576 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.25.2134639366
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.25.2134639366 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.25.2146451969
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.25.2146451969 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.26.2074140682
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.26.2074140682 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.26.2134639368
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.26.2134639368 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.26.2146459778
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.26.2146459778 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.27.2129658017
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.27.2129658017 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.27.2134646914
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.27.2134646914 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.27.2147352704
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.27.2147352704 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.28.2129658145
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.28.2129658145 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.28.2134672128
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.28.2134672128 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.28.2147353351
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.28.2147353351 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.29.2129658401
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.29.2129658401 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.29.2146435217
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.29.2146435217 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.29.2147353353
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.29.2147353353 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.30.2129666178
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.30.2129666178 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.30.2146435345
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.30.2146435345 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.30.2147468032
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.30.2147468032 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.31.2129666306
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.31.2129666306 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.31.2146435601
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.31.2146435601 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.32.2013290497
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.32.2013290497 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.32.2129666562
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.32.2129666562 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.32.2146443393
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.32.2146443393 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.33.2013290499
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.33.2013290499 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.33.2134639233
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.33.2134639233 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.33.2146443521
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.33.2146443521 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.34.2074112010
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.34.2074112010 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.34.2134639364
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.34.2134639364 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.8.1.34.2146443777
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.8.1.34.2146443777 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.1.1.2.1954812671
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.1.1.2.1954812671 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.1.1.4.1686381311
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.1.1.4.1686381311 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.1.1.5.1954824959
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.1.1.5.1954824959 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.1.1.7.1954812671
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.1.1.7.1954812671 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.1.1.9.1686381311
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.1.1.9.1686381311 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.1.1.10.1954824959
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.1.1.10.1954824959 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.1.1.12.1954812671
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.1.1.12.1954812671 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.2 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.2.1.2.2146435233
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.2.1.2.2146435233 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.2.1.4.2129658145
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.2.1.4.2129658145 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.2.1.5.2146435617
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.2.1.5.2146435617 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.2.1.7.2146435233
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.2.1.7.2146435233 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.2.1.9.2129658145
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.2.1.9.2129658145 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.2.1.10.2146435617
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.2.1.10.2146435617 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.2.1.12.2146435233
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.2.1.12.2146435233 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.2.1.14.2129658145
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.2.1.14.2129658145 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.2.1.15.2146435617
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.2.1.15.2146435617 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.2.1.17.2146435233
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.2.1.17.2146435233 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.1.1.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.1.1.2 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.3.1.3
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.3.1.3 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.1.1.15
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.1.1.15 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.7
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.7 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.2 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.2.1.3.2013290496.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.2.1.3.2013290496.0 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.2.1.3.2129666561.2129658385
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.2.1.3.2129666561.2129658385 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.2.1.3.2146435361.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.2.1.3.2146435361.0 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.31.1.2.1.3.2147353353.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.31.1.2.1.3.2147353353.0 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.2 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.2.1.1.15.2146443522
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.2.1.1.15.2146443522 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.2.1.2.10.2146443777
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.2.1.2.10.2146443777 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.2.1.2.18.2129691137
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.2.1.2.18.2129691137 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.2.1.3.15.2146443522
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.2.1.3.15.2146443522 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.2.1.4.10.2146443777
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.2.1.4.10.2146443777 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.2.1.4.18.2129691137
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.2.1.4.18.2129691137 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.10
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.10 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.11
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.11 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.14
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.14 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.14.1.10.18
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.14.1.10.18 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.6
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.6 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.6.1.4.14
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.6.1.4.14 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.6.1.7.16
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.6.1.7.16 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.6.1.10.18
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.6.1.10.18 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.6.1.14.14
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.6.1.14.14 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.6.1.17.16
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.6.1.17.16 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.3.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.3.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.3.1.1.1.10.1963216640
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.3.1.1.1.10.1963216640 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.1.1.5
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.1.1.5 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.1.1.14
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.1.1.14 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.11.1.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.11.1.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.8
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.8 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.1.1.2.1954824959
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.1.1.2.1954824959 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.1.1.3.1929658367
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.1.1.3.1929658367 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.1.1.4.1686377215
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.1.1.4.1686377215 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.1.1.4.1954828799
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.1.1.4.1954828799 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.1.1.5.1954812415
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.1.1.5.1954812415 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.1.1.6.1686381055
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.1.1.6.1686381055 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.1.1.6.1954832383
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.1.1.6.1954832383 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.1.1.8.1954815999
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.1.1.8.1954815999 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.1.1.9.1686384639
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.1.1.9.1686384639 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.1.1.9.1954834175
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.1.1.9.1954834175 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.1.1.10.1954816767
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.1.1.10.1954816767 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.1.1.11.1686389503
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.1.1.11.1686389503 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.1.1.1.1.11.1954834687
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.1.1.1.1.11.1954834687 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.10.1.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.10.1.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.10.1.1.1.1.20
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.10.1.1.1.1.20 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.10.1.1.1.2.16
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.10.1.1.1.2.16 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.13
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.13 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.13.1.1.1963216864.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.13.1.1.1963216864.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.13.1.2.1963204577.3
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.13.1.2.1963204577.3 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.13.1.3.1963204577.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.13.1.3.1963204577.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.13.1.4.1963204576.3
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.13.1.4.1963204576.3 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.13.1.5.1963204576.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.13.1.5.1963204576.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.13.1.6.1694781408.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.13.1.6.1694781408.2 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.13.1.7.1694769121.4
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.13.1.7.1694769121.4 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.13.1.8.1694769121.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.13.1.8.1694769121.2 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.13.1.9.1694769120.4
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.13.1.9.1694769120.4 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.13.1.10.1694769120.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.13.1.10.1694769120.2 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.13.1.10.1963216864.3
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.13.1.10.1963216864.3 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.5.1.13.1.11.1963216864.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.5.1.13.1.11.1963216864.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.3.4.2.1.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.3.4.2.1.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.11.1.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.11.1.2 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.3.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.3.2 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.3.2.1.2.1963204864.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.3.2.1.2.1963204864.0 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.3.2.1.2.1963224944.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.3.2.1.2.1963224944.0 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.4.1.1.1.5
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.4.1.1.1.5 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.10.1.3
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.10.1.3 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.2.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.2.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.10
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.10 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.2 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6.1.1.1954836479.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6.1.1.1954836479.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6.1.3.1954836479.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6.1.3.1954836479.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6.1.4.1954836479.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6.1.4.1954836479.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6.1.5.1954836479.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6.1.5.1954836479.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6.1.6.1954836479.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6.1.6.1954836479.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6.1.7.1954836479.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6.1.7.1954836479.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6.1.8.1954836479.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6.1.8.1954836479.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.6.1.9.1954836479.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.6.1.9.1954836479.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.4.7.12
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.4.7.12 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.4.7.12.1.8.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.4.7.12.1.8.2 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.4.7.13
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.4.7.13 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.4.7.13.1.3.3.9
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.4.7.13.1.3.3.9 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.11
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.11 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.11.1.3.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.11.1.3.2 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.11.1.5.4
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.11.1.5.4 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.11.1.7.6
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.11.1.7.6 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.11.1.9.8
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.11.1.9.8 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.11.1.12.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.11.1.12.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.2.1694768912
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.2.1694768912 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.2.1921262079
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.2.1921262079 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.2.1954812415
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.2.1954812415 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.2.1963204368
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.2.1963204368 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.2.1963224896
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.2.1963224896 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.3.1686380543
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.3.1686380543 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.3.1694777856
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.3.1694777856 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.3.1921275135
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.3.1921275135 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.3.1954829055
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.3.1954829055 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.3.1963213312
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.3.1963213312 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.3.1963224966
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.3.1963224966 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.4.1694768912
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.4.1694768912 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.4.1921262079
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.4.1921262079 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.4.1954812415
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.4.1954812415 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.4.1963204368
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.4.1963204368 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.4.1963224896
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.4.1963224896 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.5.1686380543
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.5.1686380543 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.5.1694777856
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.5.1694777856 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.5.1921275135
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.5.1921275135 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.5.1954829055
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.5.1954829055 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.5.1963213312
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.5.1963213312 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.5.1963224966
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.5.1963224966 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.6.1694768912
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.6.1694768912 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.6.1921262079
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.6.1921262079 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.6.1954812415
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.6.1954812415 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.6.1963204368
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.6.1963204368 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.6.1963224896
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.6.1963224896 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.7.1686380543
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.7.1686380543 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.7.1694777856
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.7.1694777856 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.7.1921275135
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.7.1921275135 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.7.1954829055
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.7.1954829055 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.7.1963213312
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.7.1963213312 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.7.1963224966
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.7.1963224966 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.8.1694768912
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.8.1694768912 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.8.1921262079
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.8.1921262079 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.8.1954812415
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.8.1954812415 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.8.1963204368
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.8.1963204368 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.8.1963224896
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.8.1963224896 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.9.1686380543
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.9.1686380543 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.9.1694777856
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.9.1694777856 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.9.1921275135
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.9.1921275135 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.9.1954829055
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.9.1954829055 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.9.1963213312
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.9.1963213312 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.9.1963224966
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.9.1963224966 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.10.1694768912
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.10.1694768912 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.10.1921262079
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.10.1921262079 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.10.1954812415
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.10.1954812415 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.10.1963204368
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.10.1963204368 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.10.1963224896
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.10.1963224896 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.11.1686380543
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.11.1686380543 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.11.1694777856
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.11.1694777856 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.11.1921275135
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.11.1921275135 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.11.1954829055
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.11.1954829055 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.11.1963213312
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.11.1963213312 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.11.1963224966
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.11.1963224966 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.12.1694768912
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.12.1694768912 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.12.1921262079
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.12.1921262079 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.12.1954812415
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.12.1954812415 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.12.1963204368
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.12.1963204368 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.12.1963224896
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.12.1963224896 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.13.1686380543
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.13.1686380543 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.13.1694777856
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.13.1694777856 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.13.1921275135
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.13.1921275135 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.13.1954829055
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.13.1954829055 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.13.1963213312
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.13.1963213312 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.13.1963224966
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.13.1963224966 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.14.1694768912
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.14.1694768912 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.14.1921262079
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.14.1921262079 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.14.1954812415
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.14.1954812415 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.14.1963204368
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.14.1963204368 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.14.1963224896
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.14.1963224896 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.15.1686380543
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.15.1686380543 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.15.1694777856
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.15.1694777856 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.15.1921275135
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.15.1921275135 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.15.1954829055
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.15.1954829055 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.15.1963213312
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.15.1963213312 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.15.1963224966
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.15.1963224966 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.16.1694768912
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.16.1694768912 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.16.1921262079
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.16.1921262079 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.16.1954812415
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.16.1954812415 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.16.1963204368
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.16.1963204368 \n" ; exit 1}
eof { }
}
spawn snmpbulkget -v 2c -Cr20 -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.1.1.1.16.1963224896
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.1.1.1.16.1963224896 \n" ; exit 1}
eof { }
}


spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.1.2.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.1.2.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.3.0 .1.3.6.1.4.1.193.81.2.7.1.2.1.2.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.3.0 .1.3.6.1.4.1.193.81.2.7.1.2.1.2.2 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.2.1.3.2
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.2.1.3.2 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.4.1.0 .1.3.6.1.4.1.193.81.2.13.2.7.2.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.4.1.0 .1.3.6.1.4.1.193.81.2.13.2.7.2.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.4.5.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.4.5.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.7.12.0 .1.3.6.1.4.1.193.81.2.13.2.7.9.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.7.12.0 .1.3.6.1.4.1.193.81.2.13.2.7.9.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.7.13.0 .1.3.6.1.4.1.193.81.2.13.2.7.10.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.7.13.0 .1.3.6.1.4.1.193.81.2.13.2.7.10.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.7.11.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.7.11.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.7.8.0 .1.3.6.1.4.1.193.81.2.13.2.7.5.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.7.8.0 .1.3.6.1.4.1.193.81.2.13.2.7.5.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.7.1.0 .1.3.6.1.4.1.193.81.2.13.2.7.7.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.7.1.0 .1.3.6.1.4.1.193.81.2.13.2.7.7.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.7.6.0 .1.3.6.1.4.1.193.81.2.13.2.4.7.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.7.6.0 .1.3.6.1.4.1.193.81.2.13.2.4.7.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.111.2.802.1.1.13.1.3.3.0 .1.3.111.2.802.1.1.13.1.3.4.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.111.2.802.1.1.13.1.3.3.0 .1.3.111.2.802.1.1.13.1.3.4.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.111.2.802.1.1.13.1.1.1.0 .1.3.111.2.802.1.1.13.1.1.2.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.111.2.802.1.1.13.1.1.1.0 .1.3.111.2.802.1.1.13.1.1.2.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.111.2.802.1.1.13.1.1.6.0 .1.3.111.2.802.1.1.13.1.1.7.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.111.2.802.1.1.13.1.1.6.0 .1.3.111.2.802.1.1.13.1.1.7.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.4.1.2.1.17.2.0 .1.3.111.2.802.1.1.13.1.1.4.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.4.1.2.1.17.2.0 .1.3.111.2.802.1.1.13.1.1.4.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.1.2.0 .1.3.6.1.4.1.193.81.2.13.2.3.3.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.1.2.0 .1.3.6.1.4.1.193.81.2.13.2.3.3.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.3.2.0 .1.3.6.1.4.1.193.81.2.13.2.3.1.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.3.2.0 .1.3.6.1.4.1.193.81.2.13.2.3.1.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.7.7.0 .1.3.6.1.4.1.193.81.2.13.2.7.6.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.7.7.0 .1.3.6.1.4.1.193.81.2.13.2.7.6.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.7.1.0 .1.3.6.1.4.1.193.81.2.13.2.7.10.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.7.1.0 .1.3.6.1.4.1.193.81.2.13.2.7.10.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.7.13.0 .1.3.6.1.4.1.193.81.2.13.2.7.11.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.7.13.0 .1.3.6.1.4.1.193.81.2.13.2.7.11.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.7.8.0 .1.3.6.1.4.1.193.81.2.13.2.7.2.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.7.8.0 .1.3.6.1.4.1.193.81.2.13.2.7.2.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.7.12.0 .1.3.6.1.4.1.193.81.2.13.2.7.9.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.7.12.0 .1.3.6.1.4.1.193.81.2.13.2.7.9.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.7.5.0 .1.3.6.1.4.1.193.81.2.13.2.4.7.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.7.5.0 .1.3.6.1.4.1.193.81.2.13.2.4.7.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.13.2.4.5.0 .1.3.6.1.4.1.193.81.2.13.2.4.1.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.13.2.4.5.0 .1.3.6.1.4.1.193.81.2.13.2.4.1.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.3.0 .1.3.6.1.4.1.193.81.2.7.1.11.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.3.0 .1.3.6.1.4.1.193.81.2.7.1.11.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.5.0 .1.3.6.1.4.1.193.81.2.7.1.4.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.5.0 .1.3.6.1.4.1.193.81.2.7.1.4.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.7.1.9.1.0 .1.3.6.1.4.1.193.81.2.4.1.9.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.7.1.9.1.0 .1.3.6.1.4.1.193.81.2.4.1.9.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.4.3.1.0 .1.3.6.1.4.1.193.81.2.4.7.3.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.4.3.1.0 .1.3.6.1.4.1.193.81.2.4.7.3.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.4.7.6.0 .1.3.6.1.4.1.193.81.2.4.7.2.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.4.7.6.0 .1.3.6.1.4.1.193.81.2.4.7.2.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.4.7.15.0 .1.3.6.1.4.1.193.81.2.4.7.1.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.4.7.15.0 .1.3.6.1.4.1.193.81.2.4.7.1.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.4.8.4.0 .1.3.6.1.4.1.193.81.2.8.3.14.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.4.8.4.0 .1.3.6.1.4.1.193.81.2.8.3.14.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.10.0 .1.3.6.1.4.1.193.81.2.8.3.24.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.10.0 .1.3.6.1.4.1.193.81.2.8.3.24.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.4.0 .1.3.6.1.4.1.193.81.2.8.3.1.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.4.0 .1.3.6.1.4.1.193.81.2.8.3.1.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.23.0 .1.3.6.1.4.1.193.81.2.8.3.8.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.23.0 .1.3.6.1.4.1.193.81.2.8.3.8.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.17.0 .1.3.6.1.4.1.193.81.2.8.3.13.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.17.0 .1.3.6.1.4.1.193.81.2.8.3.13.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.2.0 .1.3.6.1.4.1.193.81.2.8.3.5.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.2.0 .1.3.6.1.4.1.193.81.2.8.3.5.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.9.0 .1.3.6.1.4.1.193.81.2.8.3.3.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.9.0 .1.3.6.1.4.1.193.81.2.8.3.3.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.12.0 .1.3.6.1.4.1.193.81.2.8.3.7.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.12.0 .1.3.6.1.4.1.193.81.2.8.3.7.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.4.1.193.81.2.8.3.6.0 .1.3.6.1.4.1.193.81.2.8.3.22.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.4.1.193.81.2.8.3.6.0 .1.3.6.1.4.1.193.81.2.8.3.22.0 \n" ; exit 1}
eof { }
}
spawn snmpget -v 2c -r 0 -t 4 -c $COMMUNITY $NODEIP:$PORT .1.3.6.1.2.1.47.1.4.1.0
expect {
-re "Timeout: No Response from" { send_user "Timedout in bulkget table .1.3.6.1.2.1.47.1.4.1.0 \n" ; exit 1}
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
echo "Mltn CM synch failed"
exit 1
else
echo "Mltn CM synch completed successfully"
fi

