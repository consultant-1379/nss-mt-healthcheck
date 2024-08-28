#!/bin/bash

####################################################################################################
#
# FileName: upgrade.sh
# Author: Malla Goutham
# Description: This script will trigger the software upgrade actions on the outdoor nodes.
# Syntax: ./upgrade.sh <NODE NAME> <NODE IP> <PROTOCOL> <JOB ID>
#         PROTOCOL - SSH/TLS
# Example: ./upgrade.sh ML-PT01 10.71.0.1 SSH 123456 10.54.0.1
# Pre-requisite: The SERVER should contain the upgrade package in the below path
#                /netsim/upgradePackageTest
####################################################################################################

# Load the default values from conf file
#. conf.txt

finalstat () {
	EndTime=`date +%s%3N`
	StartTime1=`expr $StartTime / 1000`
	StartTimeFormat=`date -d @$StartTime1`
	EndTime1=`expr $EndTime / 1000`
	EndTimeFormat=`date -d @$EndTime1`
	Diff=`expr $EndTime - $StartTime`
	echo "${NODE_NAME} $StartTime:::$StartTimeFormat $EndTime:::$EndTimeFormat $Diff"  >> upgradestats.log

	if [[ $Result -ne 0 ]]
	then
	     echo "Upgrade failed"
	     exit 1
	else
	     echo "Upgrade completed successfully"
	fi
}

StartTime=`date +%s%3N`
NODE_NAME=$1
NODE_IP=$2
SSH_PORT=22

echo in pm.sh $NODE_NAME and $NODE_IP
#PACKAGE_URI="sftp://${SW_USERNAME}@${SERVER}${PACKAGE_PATH}"
ssh-keygen -R NODE_IP



/usr/bin/expect - << "EOF" $NODE_NAME $NODE_IP $SSH_PORT

set NODE_NAME [lindex $argv 0]
set NODE_IP [lindex $argv 1]
set SSH_PORT [lindex $argv 2]

spawn ssh -o "UserKnownHostsFile=/dev/null" -o StrictHostKeyChecking=no cli@${NODE_IP} -p ${SSH_PORT}
expect -re "login:" {
    send "admin\r"
}
expect -re "password:" {
    send "authpassword\r"
}
expect -re "#" {
    send "config network-monitor advanced-monitor bandWidth-utilization  BW-1/5-Port 1 5 interval interval 15-min\r"
}
expect -re "#" {
    send "end\r"
}
expect -re "#" {
    send "config network-monitor advanced-monitor bandWidth-utilization  BW-1/5-TC0 1 5 interval interval 15-min\r"
}
expect -re "#" {
    send "end\r"
}
expect -re "#" {
    send "config network-monitor advanced-monitor bandWidth-utilization  BW-1/5-TC1 1 5 interval interval 15-min\r"
}
expect -re "#" {
    send "end\r"
}
expect -re "#" {
    send "config network-monitor advanced-monitor bandWidth-utilization  BW-1/5-TC2 1 5 interval interval 15-min\r"
}
expect -re "#" {
    send "end\r"
}
expect -re "#" {
    send "config network-monitor advanced-monitor bandWidth-utilization  BW-1/5-TC3 1 5 interval interval 15-min\r"
}
expect -re "#" {
    send "end\r"
}
expect -re "#" {
    send "config network-monitor advanced-monitor bandWidth-utilization  BW-1/5-TC4 1 5 interval interval 15-min\r"
}
expect -re "#" {
    send "end\r"
}
expect -re "#" {
    send "config network-monitor advanced-monitor bandWidth-utilization  BW-1/5-TC5 1 5 interval interval 15-min\r"
}
expect -re "#" {
    send "end\r"
}
expect -re "#" {
    send "config network-monitor advanced-monitor bandWidth-utilization  BW-1/5-TC6 1 5 interval interval 15-min\r"
}
expect -re "#" {
    send "end\r"
}
expect -re "#" {
    send "config network-monitor advanced-monitor bandWidth-utilization  BW-1/5-TC7 1 5 interval interval 15-min\r"
}
expect -re "#" {
    send "end\r"
}

expect -re "#" {
    send "config network-monitor advanced-monitor delay-measurement  DM-1/5-Port 1 5 interval interval 15-min\r"
}
expect -re "#" {
    send "end\r"
}
expect -re "#" {
    send "config network-monitor advanced-monitor delay-measurement  DM-1/5-TC0 1 5 interval interval 15-min\r"
}
expect -re "#" {
    send "end\r"
}
expect -re "#" {
    send "config network-monitor advanced-monitor delay-measurement  DM-1/5-TC1 1 5 interval interval 15-min\r"
}
expect -re "#" {
    send "end\r"
}
expect -re "#" {
    send "config network-monitor advanced-monitor delay-measurement  DM-1/5-TC2 1 5 interval interval 15-min\r"
}
expect -re "#" {
    send "end\r"
}
expect -re "#" {
    send "config network-monitor advanced-monitor delay-measurement  DM-1/5-TC3 1 5 interval interval 15-min\r"
}
expect -re "#" {
    send "end\r"
}
expect -re "#" {
    send "config network-monitor advanced-monitor delay-measurement  DM-1/5-TC4 1 5 interval interval 15-min\r"
}
expect -re "#" {
    send "end\r"
}
expect -re "#" {
    send "config network-monitor advanced-monitor delay-measurement  DM-1/5-TC5 1 5 interval interval 15-min\r"
}
expect -re "#" {
    send "end\r"
}
expect -re "#" {
    send "config network-monitor advanced-monitor delay-measurement  DM-1/5-TC6 1 5 interval interval 15-min\r"
}
expect -re "#" {
    send "end\r"
}
expect -re "#" {
    send "config network-monitor advanced-monitor delay-measurement  DM-1/5-TC7 1 5 interval interval 15-min\r"
}
expect -re "#" {
    send "end\r"
}
expect -re "#" {
    send "config network-monitor rmon statistics-config 1 1 interval 24-hour\r"
}
expect -re "#" {
    send "end\r"
}
expect -re "#" {
    send "config network-monitor rmon statistics-config 1 2 interval 24-hour\r"
}
expect -re "#" {
    send "end\r"
}
expect -re "#" {
    send "config network-monitor rmon statistics-config 1 3 interval 24-hour\r"
}
expect -re "#" {
    send "end\r"
}
expect -re "#" {
    send "config network-monitor rmon statistics-config 1 4 interval 24-hour\r"
}
expect -re "#" {
    send "end\r"
}
expect -re "#" {
    send "config network-monitor rmon statistics-config 1 5 interval 24-hour\r"
}
expect -re "#" {
    send "end\r"
}
expect -re "#" {
    send "end\r"
} "#"

EOF

counter=1
rm -rf downloadstat_$NODE_NAME
#while [ $counter -le 20 ]
#do

/usr/bin/expect - << "EOF" $NODE_NAME $NODE_IP $SSH_PORT

set NODE_NAME [lindex $argv 0]
set NODE_IP [lindex $argv 1]
set SSH_PORT [lindex $argv 2]

set output [open "downloadstat_$NODE_NAME" "w"]

spawn ssh -o "UserKnownHostsFile=/dev/null" -o StrictHostKeyChecking=no cli@${NODE_IP} -p ${SSH_PORT}
expect -re "login:" {
    send "admin\r"
}
expect -re "password:" {
    send "authpassword\r"
}
expect -re "#" {
    send "config slot 1 pm collect-pm-file\r"
}
expect -re "#" {
    send "end\r"
}
expect -re "#" {
    send "config slot 1 pm upload-pm-file mode sftp ip 10.141.11.227 port 22 user netsim password netsim filename /var/tmp/mini-link-6352/${NODE_NAME}/900_1571667300000.tar.gz\r"
}
expect { 
    -re "" { send_user "\nINITIATING DOWNLOAD: Progress 100 %\n"; puts $output "complete"; send "end\r" }
    -re "#"  { send "end\r" }
}
expect -re "#"

EOF

#if grep -q complete "downloadstat_$NODE_NAME"; then
#break
#fi

#sleep 20

#((counter++))

#done

if grep -q complete "downloadstat_$NODE_NAME"; then
    echo " DOWNLOAD COMPLETED"
else
    Result=1
    finalstat
    exit 1
fi
