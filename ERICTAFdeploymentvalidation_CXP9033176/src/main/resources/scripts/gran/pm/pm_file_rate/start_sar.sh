sarLogFile="/netsim/sarlog.log"
SERVER=ieatnetsimv5109-93
Fl=$1

if [[ Fl -eq 0 ]]
then

/usr/bin/expect - << "EOF" $SERVER $FILENAME1

set SERVER [lindex $argv 0]
set FILENAME [lindex $argv 1]
spawn scp -o StrictHostKeyChecking=no /netsim/PM_Filerate/cpuUsage.sh netsim@${SERVER}:/netsim
expect {
        -re "assword:" { send "netsim\r"; exp_continue }
        -re ".txt" { send_user "third success\n"; exp_continue }
        -re ">" { send "exit 1\r" }
}
EOF

/usr/bin/expect - << "EOF" $SERVER $PRMNFILE

set SERVER [lindex $argv 0]
set PRMNFILE [lindex $argv 1]
spawn ssh -o StrictHostKeyChecking=no netsim@${SERVER} "sh /netsim//cpuUsage.sh"
expect {
        -re "assword:" { send "netsim\r"; exp_continue }
        -re "Test>" { send_user "third success\n"; exp continue }
        -re "Test>" { send "exit 1\r" }
}
EOF

else 

/usr/bin/expect - << "EOF" $SERVER $FILENAME1

set SERVER [lindex $argv 0]
set FILENAME [lindex $argv 1]
spawn scp -o StrictHostKeyChecking=no /netsim/PM_Filerate/killProcess.sh netsim@${SERVER}:/netsim
expect {
        -re "assword:" { send "netsim\r"; exp_continue }
        -re ".txt" { send_user "third success\n"; exp_continue }
        -re ">" { send "exit 1\r" }
}
EOF

/usr/bin/expect - << "EOF" $SERVER $PRMNFILE

set SERVER [lindex $argv 0]
set PRMNFILE [lindex $argv 1]
spawn ssh -o StrictHostKeyChecking=no netsim@${SERVER} "sh /netsim/killProcess.sh"
expect {
        -re "assword:" { send "netsim\r"; exp_continue }
        -re "Test>" { send_user "third success\n"; exp continue }
        -re "Test>" { send "exit 1\r" }
}
EOF


/usr/bin/expect - << "EOF" $SERVER $sarLogFile

set SERVER [lindex $argv 0]
set sarLogFile [lindex $argv 1]
spawn scp -o StrictHostKeyChecking=no netsim@${SERVER}:/$sarLogFile .
expect {
        -re "assword:" { send "netsim\r"; exp_continue }
        -re ".txt" { send_user "second success\n"; exp_continue }
        -re ">" { send "exit 1\r" }
}
EOF

fi

