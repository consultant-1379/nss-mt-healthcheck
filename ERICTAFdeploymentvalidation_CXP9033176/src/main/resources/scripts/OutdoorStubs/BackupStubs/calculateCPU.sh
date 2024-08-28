#!/usr/bash

usage(){
    echo "------------------------------------------------------------------"
    echo "Usage: $0 <start_time> <stop_time> \n start and stop time should be in millis"
    echo "------------------------------------------------------------------"
}

if [[ $# -ne 2 ]];then
    usage
fi

filename="sarlogFile.sar"
startTime=$1
startTime=$((startTime-1000))
endTime=$2
endTime=$((endTime+1000))
cent=100.0
ans=0
cnt=0
counter=0
start=2000
maxx=0
outputFile="outFile.job"
saroutFile="saroutFile.txt"

sarlogTime=$(cat $filename | head -1)
mmm2=$(echo $sarlogTime | awk '{print $4}' | cut -d'/' -f1)
ddd2=$(echo $sarlogTime | awk '{print $4}' | cut -d'/' -f2)
yyy2=$(echo $sarlogTime | awk '{print $4}' | cut -d'/' -f3)
yyy2=$((start+yyy2))

while IFS='' read -r line || [[ -n "$line" ]]; do

    if [[ $line == *all* ]];then
#	echo $line
        hh2=$(echo $line | awk '{print $1}' | cut -d':' -f1)
        mm2=$(echo $line | awk '{print $1}' | cut -d':' -f2)
        ss2=$(echo $line | awk '{print $1}' | cut -d':' -f3)
        t2sec=$(date -d"$yyy2-$mmm2-$ddd2 $hh2:$mm2:$ss2" +%s%3N)
        #echo $t2sec        
        if [[ $t2sec < $startTime || $t2sec > $endTime ]];then
            continue
        fi
        val=$(echo $line | awk '{print $8}')
        val=$(echo "$cent $val" | awk '{print $1-$2}')
        ans=$(echo "$ans $val" | awk '{print $1+$2}')
        cnt=$((cnt+1))
	#echo "-----" $val $ans
	#handle case when CPU IDLE is 0.0
	if (( $(echo "$maxx < $val" | bc -l) ));then
		maxx=$val
	fi
	if (($(echo "$cent == $val" | bc -l) ));then
		counter=$((counter+1))
	fi

    fi
#    echo $ans $cnt

done < $filename

avg=$(echo "$ans $cnt" | awk '{print $1/$2}')
echo "--------------------------------------------------------" 
echo "Average CPU usage-" $avg 
echo "Max CPU usage-" $maxx 
echo "Number of sec 100% CPU =" $counter
echo "------------------------------------------------------------------------------" 

echo "$(cat finalFile.job) $avg $maxx $counter" > finalFile.job

echo -n "Avg CPU: $avg Max CPU: $maxx No of 100 CPU: $counter " >> stats.job
