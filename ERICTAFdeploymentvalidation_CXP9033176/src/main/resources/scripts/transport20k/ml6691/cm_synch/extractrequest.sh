#!/bin/bash

usage(){
    echo "----------------------------------------------------------------------"
    echo "$0 filename output_filename"
    echo "----------------------------------------------------------------------"
    exit 1
}

if [[ $# -ne 2 ]];then
    usage
fi

#format - time message-id node-name
result=$2

#delete generated files
rm -rf $result

s=""
zero=0
space=" "
Six=6


fullStr=""
count=0
while IFS='' read -r line || [[ -n "$line" ]]; do
	if [[ "$line" == *netsimprmn* ]];then
#	fullStr=$fullStr$line
		#process whats already there and then append
		if [[ "$fullStr" == *get-bulk-request* ]];then
			#echo $fullStr
			Date=$(echo $fullStr | awk -F\{ '{print $4}')
			Date=${Date%??}
			Time=$(echo $fullStr | awk -F\{ '{print $5}')
			Time=${Time%??????}
                        RequestId=$(echo $fullStr | awk -F"," '{print $13}'| awk -F"}" '{print $1}')
		#Adding 0 at the starting of millisec parameter if its length is less than 6
		Msec=$(echo $Time | cut -d',' -f4)
		Msec1=""
		Mlen=${#Msec}
		MDiff=$((6-Mlen))
		for((i=0;i<$MDiff;i++));do
			Msec1=$Msec1"0"
		done
		Msec1=$Msec1$Msec
			yyy1=$(echo $Date | cut -d',' -f1)
			mmm1=$(echo $Date | cut -d',' -f2)
			ddd1=$(echo $Date | cut -d',' -f3)
			hh1=$(echo $Time | cut -d',' -f1)
			mm1=$(echo $Time | cut -d',' -f2)
#			ss1=$(echo $Time | cut -d',' -f3).$(echo $Time | cut -d',' -f4)
			ss1=$(echo $Time | cut -d',' -f3).$Msec1
			CurrDate=$(date -d"$yyy1-$mmm1-$ddd1 $hh1:$mm1:$ss1" +%s%3N)
		        nodeName=$(echo $fullStr | awk -F\" '{print $2}')
	#		echo $nodeName
	        	echo $CurrDate$space$Date$space$Time$space$nodeName$space$Msec1$space$RequestId >> $result
		fi
		fullStr=""
	fi
	fullStr=$fullStr$line
done < "$1"

if [[ "$fullStr" == *netsimprmn* ]];then
		#process whats already there and then append
		if [[ "$fullStr" == *get-bulk-request* ]];then
			#echo $fullStr
			Date=$(echo $fullStr | awk -F\{ '{print $4}')
			Date=${Date%??}
			Time=$(echo $fullStr | awk -F\{ '{print $5}')
			Time=${Time%??????}
                        RequestId=$(echo $fullStr | awk -F"," '{print $13}'| awk -F"}" '{print $1}')
		#Adding 0 at the starting of millisec parameter if its length is less than 6
		Msec=$(echo $Time | cut -d',' -f4)
		Msec1=""
		Mlen=${#Msec}
		MDiff=$((6-Mlen))
		for((i=0;i<$MDiff;i++));do
			Msec1=$Msec1"0"
		done
		Msec1=$Msec1$Msec
			yyy1=$(echo $Date | cut -d',' -f1)
			mmm1=$(echo $Date | cut -d',' -f2)
			ddd1=$(echo $Date | cut -d',' -f3)
			hh1=$(echo $Time | cut -d',' -f1)
			mm1=$(echo $Time | cut -d',' -f2)
			#ss1=$(echo $Time | cut -d',' -f3).$(echo $Time | cut -d',' -f4)
			ss1=$(echo $Time | cut -d',' -f3).$Msec1
			CurrDate=$(date -d"$yyy1-$mmm1-$ddd1 $hh1:$mm1:$ss1" +%s%3N)
		        nodeName=$(echo $fullStr | awk -F\" '{print $2}')
	        	echo $CurrDate$space$Date$space$Time$space$nodeName$space$Msec1$space$RequestId >> $result

		fi
		fullStr=""
fi
