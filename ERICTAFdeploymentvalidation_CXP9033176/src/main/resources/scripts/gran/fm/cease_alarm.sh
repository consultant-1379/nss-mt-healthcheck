# To Cease all alarms

nodeIp=$1
ssh_port=$2

command='ceasealarm_gsm:ALL;'

expect << EOF
spawn ssh -o StrictHostKeyChecking=no netsim@$nodeIp -p $ssh_port  

expect "assword:"
send "netsim\r"
expect ">"
send "mml\r"
expect "<"
send "$command\r"
expect "<"
send "exit\r"

EOF


