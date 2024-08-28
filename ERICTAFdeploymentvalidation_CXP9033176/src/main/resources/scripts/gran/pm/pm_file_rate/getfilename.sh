SERVER=ieatnetsimv5109-93
Filestore=$1

/usr/bin/expect - << "EOF" $SERVER $FILENAME1

set SERVER [lindex $argv 0]
set FILENAME [lindex $argv 1]
spawn scp -o StrictHostKeyChecking=no /netsim/PM_Filerate/f.sh netsim@${SERVER}:/netsim/PM_FileRate
expect {
        -re "assword:" { send "netsim\r"; exp_continue }
        -re ".txt" { send_user "third success\n"; exp_continue }
        -re ">" { send "exit 1\r" }
}
EOF

N=9
/usr/bin/expect - << "EOF" $SERVER $Filestore $N

set SERVER [lindex $argv 0]
set Filestore [lindex $argv 1]
set N [lindex $argv 2]

spawn ssh -o StrictHostKeyChecking=no netsim@${SERVER} "ls -lrth $Filestore | awk '{print $$N}' | tee -a lmp.txt"
expect {
        -re "assword:" { send "netsim\r"; exp_continue }
        -re "Test>" { send_user "third success\n"; exp continue }
        -re "Test>" { send "exit 1\r" }
}
EOF

/usr/bin/expect - << "EOF" $SERVER

set SERVER [lindex $argv 0]
spawn scp -o StrictHostKeyChecking=no netsim@${SERVER}:/netsim/lmp.txt .
expect {
        -re "assword:" { send "netsim\r"; exp_continue }
        -re ".txt" { send_user "second success\n"; exp_continue }
        -re ">" { send "exit 1\r" }
}
EOF


