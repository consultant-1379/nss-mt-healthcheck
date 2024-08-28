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


echo ".show started" >> $getNodes
~/inst/netsim_shell < $getNodes | tee -a $tempFile


while IFS='' read -r line || [[ -n "$line" ]]; do
	if [[ $line == *netsimdir* ]];then
#		if [[ $line == *RBS* ]];then
			nodeName=$(echo $line | awk '{print $1}')
			nodeIp=$(echo $line | awk '{print $2}')
			simName=$(echo $line | awk '{print $3}' | awk -F\/ '{print $4}')
			echo $nodeName$space$nodeIp$space$simName >> $allNodes	
#		fi
	fi
done < "$tempFile"






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

