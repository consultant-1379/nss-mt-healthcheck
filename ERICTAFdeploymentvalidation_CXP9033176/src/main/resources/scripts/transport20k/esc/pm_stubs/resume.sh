nodes=$1

while read -r i
do 
echo $i
ip=$(echo $i | awk '{print $2}')
NE_NAME=$(echo $i | awk '{print $1}')
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
send "resumePMMeasurements SDN=0,MeasurementDefinition=0 sftp://netsim:netsim@10.141.11.227/var/tmp/esc/${NE_NAME}/\r"
expect  {
          "OperationSucceeded" {}
          "already" {}
           timeout {   send_user "${NE_NAME}-resumePMmeasures\n";exit 1  }
        }

expect "${NE_NAME}>"


EOF

done < $nodes



