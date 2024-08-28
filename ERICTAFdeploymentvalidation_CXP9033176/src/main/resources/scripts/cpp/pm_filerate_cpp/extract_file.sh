####################################################
# DESCRIPTION : THIS FILE WILL FETCH THE FS PATH OF THE NODE(.show fs)
####################################################
SERVER=$3
FIlENAME1="fetch_path.sh"
SIM_NAME=$1
NODE_NAME=$2

/usr/bin/expect - << "EOF" $SERVER $FILENAME1

set SERVER [lindex $argv 0]
set FILENAME [lindex $argv 1]
spawn scp -o StrictHostKeyChecking=no /netsim/erbs/pm/fetch_path.sh netsim@${SERVER}:/netsim/erbs
expect {
        -re "assword:" { send "netsim\r"; exp_continue }
        -re ".txt" { send_user "third success\n"; exp_continue }
        -re ">" { send "exit 1\r" }
}
EOF

/usr/bin/expect - << "EOF" $SERVER $SIM_NAME $NODE_NAME

set SERVER [lindex $argv 0]
set SIM_NAME [lindex $argv 1]
set NODE_NAME [lindex $argv 2]

spawn ssh -o StrictHostKeyChecking=no netsim@${SERVER} "sh /netsim/erbs/fetch_path.sh $SIM_NAME $NODE_NAME"
expect {
        -re "assword:" { send "netsim\r"; exp_continue }
        -re "Test>" { send_user "third success\n"; exp continue }
        -re "Test>" { send "exit 1\r" }
}
EOF



/usr/bin/expect - << "EOF" $SERVER

set SERVER [lindex $argv 0]
spawn scp -o StrictHostKeyChecking=no netsim@${SERVER}:/netsim/tempoutFile.txt .
expect {
        -re "assword:" { send "netsim\r"; exp_continue }
        -re ".txt" { send_user "second success\n"; exp_continue }
        -re ">" { send "exit 1\r" }
}
EOF








