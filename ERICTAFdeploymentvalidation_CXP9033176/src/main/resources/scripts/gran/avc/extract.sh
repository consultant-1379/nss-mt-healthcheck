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

#echo extract $result

#hi=$(cat $result)
#echo result is $hi
while IFS='' read -r line || [[ -n "$line" ]]; do
	# if AVC is in the same lines as timestamp then take that line otherwise take previous line based on (if AVC is 2nd arg of line)
	if [[ $line == *AVC* ]];then
		lineContains=$(echo $line | awk -F\{ '{print $2}')
		if [[ $lineContains == *AVC* ]];then
			#prev line case
        		Date=$(echo $prevLine | awk -F\{ '{print $4}' | awk -F\} '{print $1}')
		        Time=$(echo $prevLine | awk -F\{ '{print $5}' | awk -F\} '{print $1}')
			#echo "Prev Line case ->" $line
		else
			#same line case
	 		Date=$(echo $line | awk -F\{ '{print $4}' | awk -F\} '{print $1}')
		        Time=$(echo $line | awk -F\{ '{print $5}' | awk -F\} '{print $1}')
			#echo "Same line case->" $line
		fi
        	Time=${Time%???}

		#Adding 0 at the starting of millisec parameter if its length is less than 6
		Msec=$(echo $Time | cut -d',' -f4)
		Msec1=""
		Mlen=${#Msec}
		MDiff=$((6-Mlen))
		for((i=0;i<$MDiff;i++));do
			Msec1=$Msec1"0"
		done
		Msec1=$Msec1$Msec
		NodeName=$(echo $line | awk -F\{ '{print $6}' | awk -F\, '{print $1}')
		yyy1=$(echo $Date |cut -d',' -f1)
		mmm1=$(echo $Date |cut -d',' -f2)
		ddd1=$(echo $Date |cut -d',' -f3)
	        hh1=$(echo $Time | cut -d',' -f1)
	        mm1=$(echo $Time |  cut -d',' -f2)
	        ss1=$(echo $Time |  cut -d',' -f3)"."$Msec1

		s=$(date -d"$yyy1-$mmm1-$ddd1 $hh1:$mm1:$ss1" +%s%3N)
	        echo $s$space$Date$space$Time$space$NodeName$space$Msec1 >> $result
	        s=""
        fi
	prevLine=$line
done < "$1"

