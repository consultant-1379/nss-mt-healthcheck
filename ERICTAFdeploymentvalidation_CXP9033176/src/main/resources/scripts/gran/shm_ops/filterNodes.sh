#####################################################################################################
#Description: Filter the nodes details of specific type from the allNodes.job into the file nodeips.txt .
# Usage : sh filterNodes.sh allNodes.job selNodes.txt
# Note: allNodes.job is generated from getNodes.sh and selNodes.txt from getsimnodes.sh
#########################################################################################################
usage(){
    echo "Input invalid "
    exit
}
if [[ $# -ne 2 ]]
then
    usage
fi

allNodes=$1
selNodes=$2
nodeips="nodeips.txt"
truncate -s 0 $nodeips
while read -r line
do
	nodename1=$(echo $line | awk '{print $1}')
	#echo nodename $nodename1
	while read -r line2
	do
		nodename2=$(echo $line2 | awk '{print $1}')
		echo $nodename1 $nodename2
		if [[ "$nodename1" == "$nodename2" ]]
		then
			#echo "yeas"
			space=" "
			nodeip=$(echo $line | awk '{print $2}' | awk -F ',' '{print $1}')
			sim=$(echo $line | awk '{print $5}')
			echo "$nodename1$space$nodeip$space$sim" >> $nodeips
		fi
	done < $selNodes
done < $allNodes
