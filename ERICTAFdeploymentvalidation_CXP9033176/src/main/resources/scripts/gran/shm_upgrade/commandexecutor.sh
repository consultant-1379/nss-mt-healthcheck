nodeIp=$2
nodeName=$1
ssh_port=22

NODE_NAME=$(echo $nodeName | awk '{print $1}' | tail -c -6)


command1="caclp;"
command2="CACLP;"
command3="PCORP:BLOCK=ALL;"
command4="LASIP:BLOCK=ALL;"
command5="LAEIP:SUID=ALL;"
command6="PCECP:SUID=ALL;"


echo i cam in command executor

for k in 1 2 3
do
start_time=`date +%s%3N`

q=1
echo i came inside $q $start_time >> c.txt

ssh-keygen -R $nodeIp
expect << EOF
spawn ssh -o StrictHostKeyChecking=no netsim@$nodeIp -p $ssh_port

expect "assword:"
send "netsim\r"
expect ">"
send "mml\r"
expect "<"
send "$command1\r"
expect "<"
send "$command2\r"
expect "<"
send "$command3\r"
expect "<"
send "$command4\r"
expect "<"
send "$command5\r"
expect "<"
send "$command6\r"
expect "<"
send "exit;\r"
expect ">"
send "exit\r"

EOF

stop_time=`date +%s%3N`
q=2
echo i came inside $q $stop_time >> c.txt

done


expect << EOF
spawn ssh netsim@$nodeIp -o StrictHostKeyChecking=no -p 22 -s netconf
expect "password:"
send "netsim\r"
expect "]]>]]>"
send "<hello xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">\n\t<capabilities>\n\t\t<capability>urn:ietf:params:netconf:base:1.0</capability>\n\t\t<capability>urn:ietf:params:netconf:capability:notification:1.0</capability>\n\t\t<capability>urn:ietf:params:netconf:capability:candidate:1.0</capability>\n\t\t<capability>urn:ietf:params:netconf:capability:validate:1.0</capability>\n\t\t<capability>urn:ietf:params:netconf:capability:action:1.0</capability>\n\t\t<capability>urn:ietf:params:netconf:capability:rollback-on-error:1.0</capability>\n\t\t<capability>urn:com:ericsson:ebase:0.1.0</capability>\n\t\t<capability>urn:com:ericsson:ebase:2.0.0</capability>\n\t\t<capability>urn:ietf:params:xml:ns:netconf:base:1.0</capability>\n\t\t<capability>urn:ietf:params:xml:ns:netconf:capability:rollback-on-error:1.0</capability>\n\t\t<capability>urn:ietf:params:xml:ns:netconf:capability:writable-running:1.0</capability>\n\t\t<capability>urn:ietf:params:netconf:capability:writable-running:1.0</capability>\n\t\t<capability>urn:ietf:params:xml:ns:netconf:capability:candidate:1.0</capability>\n\t\t<capability>urn:ietf:params:xml:ns:netconf:capability:validate:1.0</capability>\n\t\t<capability>urn:ericsson:com:netconf:notification:1.1</capability>\n\t\t<capability>urn:ericsson:com:sgsnmme:heartbeat:1.0</capability>\n\t\t<capability>http://www.ericsson.com/gsn/4.0/contentVersion</capability>\n\t\t<capability>http://www.ericsson.com/gsn/3.0/protocolVersion</capability>\n\t\t<capability>urn:ericsson:com:netconf:action:1.0</capability>\n\t\t<capability>urn:ericsson:com:netconf:heartbeat:1.0</capability>\n\t\t<capability>urn:com:ericsson:ebase:1.1.0</capability>\n\t\t<capability>urn:com:ericsson:ebase:1.2.0</capability>\n\t\t<capability>urn:com:ericsson:ipos:exec-cli:1.0</capability>\n\t\t<capability>urn:com:ericsson:ipos:invoke-cli:1.0</capability>\n\t</capabilities>\n</hello>\n]]>]]>\r"
expect "]]>]]>"
send "<rpc message-id=\"1084\"\n\txmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">\n\t<get>\t\t<filter type=\"subtree\"><ManagedElement xmlns=\"urn:com:ericsson:ecim:ComTop\"><managedElementId>$NODE_NAME</managedElementId><dnPrefix/></ManagedElement>\t\t</filter>\t</get>\n</rpc>\n]]>]]>\r"
expect "</rpc-reply>]]>]]>"
send "<rpc message-id=\"1085\"\n\txmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">\n\t<get>\t\t<filter type=\"subtree\"><netconf xmlns=\"urn:ietf:params:xml:ns:netmod:notification\"><streams/></netconf>\t\t</filter>\t</get>\n</rpc>\n]]>]]>\r"
expect "</rpc-reply>]]>]]>"
send "<rpc message-id=\"1086\"\n\txmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">\n\t<create-subscription xmlns=\"urn:ietf:params:xml:ns:netconf:notification:1.0\">\n\t\t<stream>NETCONF</stream>\n\t</create-subscription>\n</rpc>\n]]>]]>\r"
expect "</rpc-reply>]]>]]>"
send "<hello xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">\n\t<capabilities>\n\t\t<capability>urn:ietf:params:netconf:base:1.0</capability>\n\t\t<capability>urn:ietf:params:netconf:capability:notification:1.0</capability>\n\t\t<capability>urn:ietf:params:netconf:capability:candidate:1.0</capability>\n\t\t<capability>urn:ietf:params:netconf:capability:validate:1.0</capability>\n\t\t<capability>urn:ietf:params:netconf:capability:action:1.0</capability>\n\t\t<capability>urn:ietf:params:netconf:capability:rollback-on-error:1.0</capability>\n\t\t<capability>urn:com:ericsson:ebase:0.1.0</capability>\n\t\t<capability>urn:com:ericsson:ebase:2.0.0</capability>\n\t\t<capability>urn:ietf:params:xml:ns:netconf:base:1.0</capability>\n\t\t<capability>urn:ietf:params:xml:ns:netconf:capability:rollback-on-error:1.0</capability>\n\t\t<capability>urn:ietf:params:xml:ns:netconf:capability:writable-running:1.0</capability>\n\t\t<capability>urn:ietf:params:netconf:capability:writable-running:1.0</capability>\n\t\t<capability>urn:ietf:params:xml:ns:netconf:capability:candidate:1.0</capability>\n\t\t<capability>urn:ietf:params:xml:ns:netconf:capability:validate:1.0</capability>\n\t\t<capability>urn:ericsson:com:netconf:notification:1.1</capability>\n\t\t<capability>urn:ericsson:com:sgsnmme:heartbeat:1.0</capability>\n\t\t<capability>http://www.ericsson.com/gsn/4.0/contentVersion</capability>\n\t\t<capability>http://www.ericsson.com/gsn/3.0/protocolVersion</capability>\n\t\t<capability>urn:ericsson:com:netconf:action:1.0</capability>\n\t\t<capability>urn:ericsson:com:netconf:heartbeat:1.0</capability>\n\t\t<capability>urn:com:ericsson:ebase:1.1.0</capability>\n\t\t<capability>urn:com:ericsson:ebase:1.2.0</capability>\n\t\t<capability>urn:com:ericsson:ipos:exec-cli:1.0</capability>\n\t\t<capability>urn:com:ericsson:ipos:invoke-cli:1.0</capability>\n\t</capabilities>\n</hello>\n]]>]]>\r"
expect "]]>]]>"
send "<rpc message-id=\"1093\"\n\txmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">\n\t<get>\t\t<filter type=\"subtree\"><ManagedElement xmlns=\"urn:com:ericsson:ecim:ComTop\"><managedElementId>$NODE_NAME</managedElementId><SystemFunctions><systemFunctionsId>1</systemFunctionsId><SysM xmlns=\"urn:com:ericsson:ecim:ComSysM\"><sysMId>1</sysMId><Schema></Schema></SysM></SystemFunctions></ManagedElement>\t\t</filter>\t</get>\n</rpc>\n]]>]]>\r"
expect "</rpc-reply>]]>]]>"
send "<rpc message-id=\"1094\"\n\txmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">\n\t<get>\t\t<filter type=\"subtree\"><ManagedElement xmlns=\"urn:com:ericsson:ecim:ComTop\"><managedElementId>$NODE_NAME</managedElementId><SystemFunctions><systemFunctionsId>1</systemFunctionsId><SwInventory xmlns=\"urn:com:ericsson:ecim:CmwSwIM\"><swInventoryId>1</swInventoryId></SwInventory></SystemFunctions></ManagedElement>\t\t</filter>\t</get>\n</rpc>\n]]>]]>\r"
expect "</rpc-reply>]]>]]>"
send "<rpc message-id=\"1099\"\n\txmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">\n<close-session/>\n</rpc>\n]]>]]>\r"
expect "</rpc-reply>]]>]]>"
EOF



echo $start_time and $stop_time

