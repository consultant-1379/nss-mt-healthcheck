#DESCRIPTION-
#Individual script called from trigger_alarm.sh
#arg1 : node ip 
#arg2 : ssh port (22)
#arg3 : freq
#arg4: burst
 

nodeIp=$1
ssh_port=$2
freq=$3
burst=$4
active=$5

#set command [axealarmburst_gsm:name="test",freq=3,burst=3,i_time=4,active=10,text="unique 5",prca=40,class=3,cat=0,id=1234,loop="false";]
id=$(date +%s%3n)
echo id is $id
command='axealarmburst_gsm:name=\"test\",freq='$freq',burst='$burst',i_time=4,active='$active',text=\"unique 5\",prca=40,class=3,cat=0,id='$id',loop=\"false\";'

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


