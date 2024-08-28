#!/bin/bash

. conf.txt

SERVER=$1

/usr/bin/expect - << "EOF" "$BACKUP_PATH" $BACKUP_USERNAME $BACKUP_PASSWORD $SERVER
set BACKUP_PATH [lindex $argv 0]
set BACKUP_USERNAME [lindex $argv 1]
set BACKUP_PASSWORD [lindex $argv 2]
set SERVER [lindex $argv 3]

spawn ssh -o StrictHostKeyChecking=no ${BACKUP_USERNAME}@${SERVER} "rm -rf ${BACKUP_PATH}/*backup*zip; echo \"Remove status $?\""
expect {
	-re "assword:" { send "${BACKUP_PASSWORD}\r"; exp_continue }
        -re "Remove status 0" { send_user "Clean up completed\n" }
         timeout { send_user "Timedout in clean up\n"; exit 1 }
}
EOF
