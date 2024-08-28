###################################################
### Called from trigger.sh parallelly to execute OPS commands on nodes.
### Usage: ./opscommandexecutor.sh <NODE NAME> <NODE IP>
###################################################

nodeIp=$2
nodeName=$1
ssh_port=22

#NODE_NAME=$(echo $nodeName | awk '{print $1}' | tail -c -6)

NODE_NAME="MSC02BSC03"


echo ***************node name is $NODE_NAME


command1="caclp;"
command2="CACLP;"
command3="PCORP:BLOCK=ALL;"
command4="LASIP:BLOCK=ALL;"
command5="LAEIP:SUID=ALL;"
command6="PCECP:SUID=ALL;"


echo i cam in command executor

#for k in 1 2 3
#do
start_time=`date +%s%3N`

q=1
echo i came inside $q $start_time >> c.txt

ssh-keygen -R $nodeIp
expect << EOF
spawn ssh -o StrictHostKeyChecking=no netsim@$nodeIp -p $ssh_port

expect {
         "password:" {}
          timeout { send_user "Timed out in ssh connection" ;exit 1}
}

send "netsim\r"
expect {
         ">" {}
          timeout { send_user "Timed out in ssh connection" ;exit 1}
}

set timeout 120
send "mml\r"
expect {
         "<" {}
          timeout { send_user "Timed out in ssh connection" ;exit 1}
}
send "$command1\r"
expect {
         "<" {}
          timeout { send_user "Timed out in ssh connection" ;exit 1}
}
send "$command2\r"
expect {
         "<" {}
          timeout { send_user "Timed out in ssh connection" ;exit 1}
}
send "$command3\r"
expect {
         "<" {}
          timeout { send_user "Timed out in ssh connection" ;exit 1}
}
send "$command4\r"
expect {
         "<" {}
          timeout { send_user "Timed out in ssh connection" ; exit 1}
}
send "$command5\r"
expect {
  	"<" {}
          timeout { send_user "Timed out in ssh connection" ;exit 1}
}
send "$command6\r"
expect {
         "<" {}
          timeout { send_user "Timed out in ssh connection" ;exit 1}
}
send "exit;\r"
expect {
         ">" {}
          timeout { send_user "Timed out in ssh connection" ;exit 1}
}
send "exit\r"

#set results $expect_out(buffer)
#echo $results
EOF
#local PARALLEL_EXIT_CODE=$?

if [[ $? -ne 0 ]]
then
        echo "mml session failed "
        exit 1
fi


stop_time=`date +%s%3N`
q=2
echo i came inside $q $stop_time >> c.txt

#done
for i in 1 2 3
do
expect << EOF
spawn ssh netsim@$nodeIp -o StrictHostKeyChecking=no -p 22 -s netconf
expect {
	 "password:" {}
	  timeout { send_user "Timed out in netconf" ;exit 1}
}

send "netsim\r"

expect {
         "]]>]]>" {}
          timeout { send_user "Timed out in netconf" ;exit 1}
}
set timeout 120

send "<hello xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">\n\t<capabilities>\n\t\t<capability>urn:ietf:params:netconf:base:1.0</capability>\n\t\t<capability>urn:ietf:params:netconf:capability:notification:1.0</capability>\n\t\t<capability>urn:ietf:params:netconf:capability:candidate:1.0</capability>\n\t\t<capability>urn:ietf:params:netconf:capability:validate:1.0</capability>\n\t\t<capability>urn:ietf:params:netconf:capability:action:1.0</capability>\n\t\t<capability>urn:ietf:params:netconf:capability:rollback-on-error:1.0</capability>\n\t\t<capability>urn:com:ericsson:ebase:0.1.0</capability>\n\t\t<capability>urn:com:ericsson:ebase:2.0.0</capability>\n\t\t<capability>urn:ietf:params:xml:ns:netconf:base:1.0</capability>\n\t\t<capability>urn:ietf:params:xml:ns:netconf:capability:rollback-on-error:1.0</capability>\n\t\t<capability>urn:ietf:params:xml:ns:netconf:capability:writable-running:1.0</capability>\n\t\t<capability>urn:ietf:params:netconf:capability:writable-running:1.0</capability>\n\t\t<capability>urn:ietf:params:xml:ns:netconf:capability:candidate:1.0</capability>\n\t\t<capability>urn:ietf:params:xml:ns:netconf:capability:validate:1.0</capability>\n\t\t<capability>urn:ericsson:com:netconf:notification:1.1</capability>\n\t\t<capability>urn:ericsson:com:sgsnmme:heartbeat:1.0</capability>\n\t\t<capability>http://www.ericsson.com/gsn/4.0/contentVersion</capability>\n\t\t<capability>http://www.ericsson.com/gsn/3.0/protocolVersion</capability>\n\t\t<capability>urn:ericsson:com:netconf:action:1.0</capability>\n\t\t<capability>urn:ericsson:com:netconf:heartbeat:1.0</capability>\n\t\t<capability>urn:com:ericsson:ebase:1.1.0</capability>\n\t\t<capability>urn:com:ericsson:ebase:1.2.0</capability>\n\t\t<capability>urn:com:ericsson:ipos:exec-cli:1.0</capability>\n\t\t<capability>urn:com:ericsson:ipos:invoke-cli:1.0</capability>\n\t</capabilities>\n</hello>\n]]>]]>\r"

expect {
         "]]>]]>" {}
          timeout { send_user "Timed out in netconf" ;exit 1}
}

send "<rpc message-id=\"4463\"\n\txmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">\n\t<get>\t\t<filter type=\"subtree\"><ManagedElement xmlns=\"urn:com:ericsson:ecim:ComTop\"><managedElementId>$NODE_NAME</managedElementId><dnPrefix/></ManagedElement>\t\t</filter>\t</get>\n</rpc>\n]]>]]>\r"

expect {
         "</rpc-reply>]]>]]>" {}
          timeout { send_user "Timed out in netconf" ;exit 1}
}


send "<rpc message-id=\"4464\"\n\txmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">\n\t<get>\t\t<filter type=\"subtree\"><netconf xmlns=\"urn:ietf:params:xml:ns:netmod:notification\"><streams/></netconf>\t\t</filter>\t</get>\n</rpc>\n]]>]]>\r"

expect {
         "</rpc-reply>]]>]]>" {}
          timeout { send_user "Timed out in netconf" ;exit 1}
}



send "<rpc message-id=\"4465\"\n\txmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">\n\t<create-subscription xmlns=\"urn:ietf:params:xml:ns:netconf:notification:1.0\">\n\t\t<stream>NETCONF</stream>\n\t</create-subscription>\n</rpc>\n]]>]]>\r"


expect {
  	  "</rpc-reply>]]>]]>" {}
          timeout { send_user "Timed out in netconf" ;exit 1}
}


send "<hello xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">\n\t<capabilities>\n\t\t<capability>urn:ietf:params:netconf:base:1.0</capability>\n\t\t<capability>urn:ietf:params:netconf:capability:notification:1.0</capability>\n\t\t<capability>urn:ietf:params:netconf:capability:candidate:1.0</capability>\n\t\t<capability>urn:ietf:params:netconf:capability:validate:1.0</capability>\n\t\t<capability>urn:ietf:params:netconf:capability:action:1.0</capability>\n\t\t<capability>urn:ietf:params:netconf:capability:rollback-on-error:1.0</capability>\n\t\t<capability>urn:com:ericsson:ebase:0.1.0</capability>\n\t\t<capability>urn:com:ericsson:ebase:2.0.0</capability>\n\t\t<capability>urn:ietf:params:xml:ns:netconf:base:1.0</capability>\n\t\t<capability>urn:ietf:params:xml:ns:netconf:capability:rollback-on-error:1.0</capability>\n\t\t<capability>urn:ietf:params:xml:ns:netconf:capability:writable-running:1.0</capability>\n\t\t<capability>urn:ietf:params:netconf:capability:writable-running:1.0</capability>\n\t\t<capability>urn:ietf:params:xml:ns:netconf:capability:candidate:1.0</capability>\n\t\t<capability>urn:ietf:params:xml:ns:netconf:capability:validate:1.0</capability>\n\t\t<capability>urn:ericsson:com:netconf:notification:1.1</capability>\n\t\t<capability>urn:ericsson:com:sgsnmme:heartbeat:1.0</capability>\n\t\t<capability>http://www.ericsson.com/gsn/4.0/contentVersion</capability>\n\t\t<capability>http://www.ericsson.com/gsn/3.0/protocolVersion</capability>\n\t\t<capability>urn:ericsson:com:netconf:action:1.0</capability>\n\t\t<capability>urn:ericsson:com:netconf:heartbeat:1.0</capability>\n\t\t<capability>urn:com:ericsson:ebase:1.1.0</capability>\n\t\t<capability>urn:com:ericsson:ebase:1.2.0</capability>\n\t\t<capability>urn:com:ericsson:ipos:exec-cli:1.0</capability>\n\t\t<capability>urn:com:ericsson:ipos:invoke-cli:1.0</capability>\n\t</capabilities>\n</hello>\n]]>]]>\r"

expect {
         "]]>]]>" {}
          timeout { send_user "Timed out in netconf" ;exit 1}
}



send "<rpc message-id=\"4466\"\n\txmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">\n\t<get>\t\t<filter type=\"subtree\"><ManagedElement xmlns=\"urn:com:ericsson:ecim:ComTop\"><managedElementId>$NODE_NAME</managedElementId><SystemFunctions><systemFunctionsId>1</systemFunctionsId><SysM xmlns=\"urn:com:ericsson:ecim:ComSysM\"><sysMId>1</sysMId><Schema></Schema></SysM></SystemFunctions></ManagedElement>\t\t</filter>\t</get>\n</rpc>\n]]>]]>\r"

expect {
         "</rpc-reply>]]>]]>" {}
          timeout { send_user "Timed out in netconf" ;exit 1}
}


send "<rpc message-id=\"4467\"\n\txmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">\n\t<get>\t\t<filter type=\"subtree\"><ManagedElement xmlns=\"urn:com:ericsson:ecim:ComTop\"><managedElementId>$NODE_NAME</managedElementId><SystemFunctions><systemFunctionsId>1</systemFunctionsId><SwInventory xmlns=\"urn:com:ericsson:ecim:CmwSwIM\"><swInventoryId>1</swInventoryId></SwInventory></SystemFunctions></ManagedElement>\t\t</filter>\t</get>\n</rpc>\n]]>]]>\r"
expect {
         "</rpc-reply>]]>]]>" {}
          timeout { send_user "Timed out in netconf" ;exit 1}
}



send "<rpc message-id=\"4468\"\n\txmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">\n<close-session/>\n</rpc>\n]]>]]>\r"
expect {
         "</rpc-reply>]]>]]>" {}
          timeout { send_user "Timed out in netconf" ;exit 1}
}

EOF

if [[ $? -ne 0 ]]
then
	echo "Netconf session failed "
	exit 1
fi
done

echo $start_time and $stop_time

