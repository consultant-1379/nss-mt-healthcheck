#!/bin/bash

usage(){
    echo "----------------------------------------------------------------------"
    echo "$0 netsimprmn_filename prmnresponse_filename"
    echo "----------------------------------------------------------------------"
    exit 1
}

if [[ $# -ne 2 ]];then
    usage
fi

#format - time message-id node-name
requestFilename=$1
responseFilename=$2
nodeInfo="nodeInfo.txt"

rm -rf $nodeInfo

CurrDate=""
nodeName=""
fullStr=""

while IFS='' read -r line || [[ -n "$line" ]]; do
	if [[ "$line" == *netsimprmn* ]];then
		#process whats already there and then append
		if [[ "$fullStr" == *close-session* ]];then
			#echo $fullStr
			Date=$(echo $fullStr | awk -F\{ '{print $4}')
			Date=${Date%??}
			Time=$(echo $fullStr | awk -F\{ '{print $5}')
			Time=${Time%??????}
			yyy1=$(echo $Date | cut -d',' -f1)
			mmm1=$(echo $Date | cut -d',' -f2)
			ddd1=$(echo $Date | cut -d',' -f3)
			hh1=$(echo $Time | cut -d',' -f1)
			mm1=$(echo $Time | cut -d',' -f2)
			ss1=$(echo $Time | cut -d',' -f3).$(echo $Time | cut -d',' -f4)
			CurrDate=$(date -d"$yyy1-$mmm1-$ddd1 $hh1:$mm1:$ss1" +%s%3N)
		        nodeName=$(echo $fullStr | awk -F\" '{print $2}')
			nodeNumber=$(echo $nodeName | awk -F\- '{print $NF}' |  sed 's/^0*//')
			echo $nodeName $CurrDate >> $nodeInfo
			if [[ $startRequestTime -gt $CurrDate ]];then
				startRequestTime=$CurrDate
			fi

		fi
		fullStr=""
	fi
	fullStr=$fullStr$line
done < "$requestFilename"

if [[ "$fullStr" == *netsimprmn* ]];then
		#process whats already there and then append
		if [[ "$fullStr" == *close-session* ]];then
			#echo $fullStr
			Date=$(echo $fullStr | awk -F\{ '{print $4}')
			Date=${Date%??}
			Time=$(echo $fullStr | awk -F\{ '{print $5}')
			Time=${Time%??????}
			yyy1=$(echo $Date | cut -d',' -f1)
			mmm1=$(echo $Date | cut -d',' -f2)
			ddd1=$(echo $Date | cut -d',' -f3)
			hh1=$(echo $Time | cut -d',' -f1)
			mm1=$(echo $Time | cut -d',' -f2)
			ss1=$(echo $Time | cut -d',' -f3).$(echo $Time | cut -d',' -f4)
			CurrDate=$(date -d"$yyy1-$mmm1-$ddd1 $hh1:$mm1:$ss1" +%s%3N)
		        nodeName=$(echo $fullStr | awk -F\" '{print $2}')
			nodeNumber=$(echo $nodeName | awk -F\- '{print $NF}' |  sed 's/^0*//')
			echo $nodeName $CurrDate >> $nodeInfo
			if [[ $startRequestTime -gt $CurrDate ]];then
				startRequestTime=$CurrDate
			fi
		fi
fi


fullStr=""
nodeData="nodeData.job"

while IFS='' read -r line || [[ -n "$line" ]]; do
	if [[ "$line" == *prmnresponse* ]];then
		#process whats already there and then append
		if [[ "$fullStr" == *mergedNotif* ]];then
			#echo $fullStr
			Date=$(echo $fullStr | awk -F\{ '{print $4}')
			Date=${Date%??}
			Time=$(echo $fullStr | awk -F\{ '{print $5}')
			Time=${Time%??????}
			yyy1=$(echo $Date | cut -d',' -f1)
			mmm1=$(echo $Date | cut -d',' -f2)
			ddd1=$(echo $Date | cut -d',' -f3)
			hh1=$(echo $Time | cut -d',' -f1)
			mm1=$(echo $Time | cut -d',' -f2)
			ss1=$(echo $Time | cut -d',' -f3).$(echo $Time | cut -d',' -f4)
			CurrDate=$(date -d"$yyy1-$mmm1-$ddd1 $hh1:$mm1:$ss1" +%s%3N)
		        nodeName=$(echo $fullStr | awk -F\" '{print $2}')
			nodeNumber=$(echo $nodeName | awk -F\- '{print $NF}' |  sed 's/^0*//')
			moCount[${nodeNumber}]=$((moCount[${nodeNumber}]+1))
			if [[ "$fullStr" == *mergedNotif* ]];then
				echo "$nodeNumber $CurrDate mergedNotif" >> $nodeData
			else
				echo "$nodeNumber $CurrDate ECIMDirectAnswer" >> $nodeData
			fi

		fi
		fullStr=""
	fi
	fullStr=$fullStr$line
done < "$responseFilename"

if [[ "$fullStr" == *prmnresponse* ]];then
		#process whats already there and then append
		if [[ "$fullStr" == *mergedNotif* ]];then
			#echo $fullStr
			Date=$(echo $fullStr | awk -F\{ '{print $4}')
			Date=${Date%??}
			Time=$(echo $fullStr | awk -F\{ '{print $5}')
			Time=${Time%??????}
			yyy1=$(echo $Date | cut -d',' -f1)
			mmm1=$(echo $Date | cut -d',' -f2)
			ddd1=$(echo $Date | cut -d',' -f3)
			hh1=$(echo $Time | cut -d',' -f1)
			mm1=$(echo $Time | cut -d',' -f2)
			ss1=$(echo $Time | cut -d',' -f3).$(echo $Time | cut -d',' -f4)
			CurrDate=$(date -d"$yyy1-$mmm1-$ddd1 $hh1:$mm1:$ss1" +%s%3N)
		        nodeName=$(echo $fullStr | awk -F\" '{print $2}')
			nodeNumber=$(echo $nodeName | awk -F\- '{print $NF}' | sed 's/^0*//' )
			moCount[${nodeNumber}]=$((moCount[${nodeNumber}]+1))
			if [[ "$fullStr" == *mergedNotif* ]];then
				echo "$nodeNumber $CurrDate mergedNotif" >> $nodeData
			else
				echo "$nodeNumber $CurrDate ECIMDirectAnswer" >> $nodeData
			fi	

		fi
		fullStr=""
fi

nodeData1="nodeData1.job"
minValue=1000000000000000
maxValue=0
sort -k2 $nodeData > $nodeData1 
rm -rf $nodeData

while IFS='' read -r line || [[ -n "$line" ]]; do
	nodeName=$(echo $line | awk '{print $1}')
	nodeTime1=$(echo $line | awk '{print $2}')
 	nodeTime2=$(grep -w "$nodeName" $nodeData1 | grep -w "mergedNotif" | awk '{print $2}')
#	echo "------------------------ $nodeTime1 $nodeTime2 --------------------"
	diff=$((nodeTime2-nodeTime1))
#	echo "------$diff----"
	if [[ $nodeTime1 -lt $minValue ]];then
		minValue=$nodeTime1
	fi
	if [[ $nodeTime2 -gt $maxValue ]];then
		maxValue=$nodeTime2
	fi
	echo "$nodeName $nodeTime1 $nodeTime2 diff-$diff" >> $nodeData
done < "$nodeInfo"

plusOneMin=$((minValue+60*1000))
cntNode=0
totalNodeCnt=0

while IFS='' read -r line || [[ -n "$line" ]]; do
 	nodeTime1=$(echo $line | awk '{print $3}')
	if [[ $nodeTime1 -ge $minValue ]] && [[ $nodeTime1 -le $plusOneMin ]];then
		cntNode=$((cntNode+1))
	fi
	totalNodeCnt=$((totalNodeCnt+1))
done < "$nodeData"

totalTimeReq=$((maxValue-minValue))
echo "$(cat finalFile.job) $totalTimeReq $cntNode $totalNodeCnt" > finalFile.job
echo "max-> $maxValue min-> $minValue"
echo "totalTimeReq = $totalTimeReq"
echo "NodeCnt = $cntNode"
sh calculateCPU.sh $minValue $maxValue

