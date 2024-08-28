################################################
### Extracts the details of all nodes with specified type
### Usage:  sh getsimnodes.sh <NE-TYPE>
### The node details will be stored in selNodes.txt
### Note : It will fetch all nodes in the server with specified type.
################################################
usage(){
    echo " Enter the NE type "
    exit
}
if [[ $# -ne 1 ]]
then
    usage
fi
nodeName=$1
netshell="netshell.txt"
sims="sims.txt"
simulations="simulations.txt"
simNodes1="simNodes1.txt"
simNodes="simNodes.txt"
selNodes="selNodes.txt"
truncate -s 0 $selNodes
truncate -s 0 $netshell
truncate -s 0 $sims
truncate -s 0 $simulations
truncate -s 0 $simNodes
truncate -s 0 $simNodes1
echo ".show simulations" >> $netshell

~/inst/netsim_shell < $netshell > $sims

tail -n +2 $sims >> $simulations

truncate -s 0 $netshell

count=1
while read -r line
do
    truncate -s 0 $simNodes1
    truncate -s 0 $simNodes
	echo sim is $line
	echo ".open $line" >> $netshell
	echo ".show simnes" >> $netshell
	~/inst/netsim_shell < $netshell >> $simNodes1
	simName=$line
	tail -n +5 $simNodes1 >> $simNodes
	while read -r line
	do
		nename=$(echo $line | awk '{print $1}')
		netype=$(echo $line | awk '{print $3}')
		echo $netype
		if [[ $netype == *$nodeName* ]]
		then
			echo "Node type match found"
			ip=$(echo $line | awk '{print $6}')
			IP=$(echo $ip | awk -F  "," '{print $1}')
			echo $nename $IP $simName>> $selNodes
		fi
	done < $simNodes
	echo "#####################################"
	let count=count+1
	truncate -s 0 $netshell
done < $simulations




