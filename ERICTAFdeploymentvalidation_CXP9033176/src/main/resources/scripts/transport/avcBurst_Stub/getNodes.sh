#!/bin/bash
#===================================================================================
#
# FILE: getNodes.sh
#
# USAGE: sh getNodes.sh
#
# DESCRIPTION:  Saves the started node details in a file
#
# NOTES: ---
# AUTHOR: ZKIDPIY (piyush.kidambi@tcs.com)
# VERSION: 1.0
# CREATED: 
#
#===================================================================================

allNodes="allNodes.job"

#declaring variables
space=" "
getNodes="getNodes.txt"
tempFile="tempFile.txt"

rm -rf ${getNodes} ${tempFile} ${allNodes}


echo ".show started" >> $getNodes
~/inst/netsim_shell < $getNodes | tee -a $tempFile


while IFS='' read -r line || [[ -n "$line" ]]; do
	if [[ $line == *netsimdir* ]];then
			TMP_FILE="tmp_file.txt"
			echo $line | grep TLS > /dev/null
			isTLS=$?
			nodeName=$(echo $line | awk '{print $1}')
			nodeIp=$(echo $line | awk '{print $2}')
			simName=$(echo $line | awk 'NF>1{print $NF}' | awk -F\/ 'NF>1{print $NF}')
			echo -e ".open "$simName"\n.select "$nodeName"\ndumpmotree:count;\n" | ~/inst/netsim_shell |tee $TMP_FILE
                        MOCOUNT=$(tail -2 $TMP_FILE | head -1)
			echo $nodeName $nodeIp $isTLS $MOCOUNT $simName >> $allNodes	
			rm -rf $TMP_FILE
	fi
done < "$tempFile"


sort -k3 $allNodes > ${allNodes}_1
mv ${allNodes}_1 ${allNodes}



#remove the ipv6 if they are in started state

#while IFS='' read -r line || [[ -n "$line" ]]; do
#	ipAdd=$(echo $line | awk '{print $2}')
#        if ! [[ $ipAdd =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]];then
#                    continue
#        fi	
#	echo $line >> $allNodesNew
#done < "$allNodes"

#rm -rf $allNodes
#mv $allNodesNew $allNodes
