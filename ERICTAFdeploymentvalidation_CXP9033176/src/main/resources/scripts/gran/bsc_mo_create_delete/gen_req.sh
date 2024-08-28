N_MO=$1
transaction_id=`date +%s%3N`
rm comand_file.txt

while read -r line
do

NODE=$(echo $line | awk '{print $1}')
NODE_NAME=MSC02BSC03
transaction_id=$transaction_id$NODE
command="<rpc message-id=\"190\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\"> 
<edit-config> <target> <running/> </target> <config xmlns:xc=\"urn:ietf:params:xml:ns:netconf:base:1.0\">
<ManagedElement xmlns=\"urn:com:ericsson:ecim:ComTop\"><managedElementId>$NODE_NAME</managedElementId>
<BscFunction xmlns=\"urn:com:ericsson:ecim:BscFunction\"><bscFunctionId>1</bscFunctionId><BscM xmlns=\"urn:com:ericsson:ecim:BscM\">
<bscMId>1</bscMId><ConfResultM xc:operation=\"merge\"><confResultMId>1</confResultMId>
<transactionIdentity>$transaction_id</transactionIdentity>
</ConfResultM></BscM></BscFunction></ManagedElement>"

#echo $command

echo $command >> comand_file.txt
i=0
ID=6500
while [[ $i -lt $N_MO ]]
do
command="${command}"$'\n'"<ManagedElement xmlns=\"urn:com:ericsson:ecim:ComTop\"><managedElementId>MSC02BSC03</managedElementId><BscFunction xmlns=\"urn:com:ericsson:ecim:BscFunction\"><bscFunctionId>1</bscFunctionId><BscM xmlns=\"urn:com:ericsson:ecim:BscM\"><bscMId>1</bscMId><UtraNetwork><utraNetworkId>1</utraNetworkId><ExternalUtranCell xc:operation=\"create\"><externalUtranCellId>$ID</externalUtranCellId></ExternalUtranCell></UtraNetwork></BscM></BscFunction></ManagedElement>"

echo "<ManagedElement xmlns=\"urn:com:ericsson:ecim:ComTop\"><managedElementId>$NODE_NAME</managedElementId><BscFunction xmlns=\"urn:com:ericsson:ecim:BscFunction\"><bscFunctionId>1</bscFunctionId><BscM xmlns=\"urn:com:ericsson:ecim:BscM\"><bscMId>1</bscMId><UtraNetwork><utraNetworkId>1</utraNetworkId><ExternalUtranCell xc:operation=\"create\"><externalUtranCellId>$ID</externalUtranCellId></ExternalUtranCell></UtraNetwork></BscM></BscFunction></ManagedElement>" >> comand_file.txt


ID=`expr $ID + 1`
i=`expr $i + 1`
done

command="${command}"$'\n'"/config> </edit-config></rpc>]]>]]>\r"

echo "</config> </edit-config></rpc>]]>]]>\r" >> comand_file.txt

echo the command is
#echo $command

file="$NODE.txt"

final_command=$(cat comand_file.txt | sed 's/"/\\"/g' > $file )


cmd=$(cat report_new.txt)

echo $cmd
 
done < no.txt
