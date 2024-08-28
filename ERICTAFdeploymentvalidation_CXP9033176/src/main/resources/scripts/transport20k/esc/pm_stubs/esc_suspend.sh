nodes=$1
while read -r i
do 
echo $i
ip=$(echo $i | awk '{print $2}')
echo $ip
expect <<EOF
spawn /usr/bin/ssh -o StrictHostKeyChecking=no netsim@${ip}
expect {
  timeout { send_user "\ntimedout-Failed to get password prompt\n"; exit 1 }
  eof { send_user "\ntimedout-SSH failure for ${ip}\n"; exit 1 }
  "password:"
}
send "netsim\r"
expect "${NE_NAME}>"
send "suspendPMMeasurements SDN=0,MeasurementDefinition=0\r"
expect  {
          "OperationSucceeded" {}
          "already" {}
           timeout {   send_user "${NE_NAME}-suspendPMmeasures\n";exit 1  }
        }

expect "${NE_NAME}>"


EOF

done < $nodes



