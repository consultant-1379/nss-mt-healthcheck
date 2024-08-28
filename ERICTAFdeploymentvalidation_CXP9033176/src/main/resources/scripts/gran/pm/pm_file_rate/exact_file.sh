Path=$1
SERVER=ieatnetsimv5109-93

/usr/bin/expect - << "EOF" $SERVER $Path $N

set SERVER [lindex $argv 0]
set Path [lindex $argv 1]
set N [lindex $argv 2]

spawn ssh -o StrictHostKeyChecking=no netsim@${SERVER} "ls $Path | tee -a zp.txt"
expect {
        -re "assword:" { send "netsim\r"; exp_continue }
        -re "Test>" { send_user "third success\n"; exp continue }
        -re "Test>" { send "exit 1\r" }
}
EOF

/usr/bin/expect - << "EOF" $SERVER

set SERVER [lindex $argv 0]
spawn scp -o StrictHostKeyChecking=no netsim@${SERVER}:/netsim/zp.txt .
expect {
        -re "assword:" { send "netsim\r"; exp_continue }
        -re ".txt" { send_user "second success\n"; exp_continue }
        -re ">" { send "exit 1\r" }
}
EOF




