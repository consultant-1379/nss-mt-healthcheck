#################################################################
#DESCRIPTION : For generating files which will be used internally by xml and bin file generator.
# Usage : generate_nodes.sh <simulation Name>
#################################################################
simulation=$1
rm nodes.txt
rm node2.txt

while read -r line
do
    if [[ $line == *"$simulation"* ]]
    then
        nodename=$(echo $line | awk '{print $1}')
        nodeip=$(echo $line | awl '{print $2}')
        echo $nodename >> nodes.txt
        echo $nodename $nodeip >> node2.txt
    fi

done < allNodes.job
