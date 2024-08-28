#!/bin/bash

NODE_NAME=ML-PT99
NODE_IP=10.155.117.98
SSH_PORT=22

/usr/bin/expect - << "EOF" $NODE_NAME $NODE_IP $SSH_PORT

set NODE_NAME [lindex $argv 0]
set NODE_IP [lindex $argv 1]
set SSH_PORT [lindex $argv 2]

set out2 [open "reschedulestat_$NODE_NAME" "w"]

spawn ssh -o "UserKnownHostsFile=/dev/null" -o StrictHostKeyChecking=no cli@${NODE_IP} -p ${SSH_PORT}
expect -re "login:" {
    send "admin\r"
}
expect -re "password:" {
    send "authpassword\r"
}
expect -re "#" {
    send "show config common software\r"
}
EOF

if [[ $Result -ne 0 ]]
then
     echo "Upgrade failed" >> test.txt
     exit 1
else
     echo "Upgrade completed successfully"
fi
