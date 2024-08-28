nodeIp=$2
nodeName=$1
ssh_port=2022

#NODE_NAME=$(echo $nodeName | awk '{print $1}' | tail -c -6)
NODE_NAME=MSC02BSC03

file="$nodeName.txt"
command=$(cat $file)

expect << EOF
set timeout 3600
spawn ssh netsim@$nodeIp -o StrictHostKeyChecking=no -p 2022 -s netconf
expect "password:"
send "netsim\r"
expect "]]>]]>"
send "$command"
expect "</rpc-reply>]]>]]>"
send "<rpc message-id=\"1099\"\n\txmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">\n<close-session/>\n</rpc>\n]]>]]>\r"
expect "</rpc-reply>]]>]]>"
EOF

