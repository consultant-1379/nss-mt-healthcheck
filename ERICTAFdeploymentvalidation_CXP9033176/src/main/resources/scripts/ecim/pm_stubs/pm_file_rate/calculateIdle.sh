#!/usr/bash

usage(){
    echo "------------------------------------------------------------------"
    echo "Usage: $0 filename alarmStartTime alarmEndTime"
    echo "------------------------------------------------------------------"
}

if [[ $# -ne 1 ]];then
    usage
fi

filename=$1
cent=100.0
ans=0
cnt=0
counter=0
maxx=0.0
finalOutput="finaloutput.txt"




while IFS='' read -r line || [[ -n "$line" ]]; do
    if [[ $line == *all* ]];then
        val=$(echo $line | awk '{print $8}')
        val=$(echo "$cent $val" | awk '{print $1-$2}')
#       echo "val=" $val
        ans=$(echo "$ans $val" | awk '{print $1+$2}')
        cnt=$((cnt+1))

	if (( $(echo "$maxx < $val" | bc -l) ));then
		maxx=$val
	fi
	if (($(echo "$cent == $val" | bc -l) ));then
		counter=$((counter+1))
	fi

    fi
#    echo $ans $cnt

done < "$filename"

#echo "cnt=" $cnt
if [[ $cnt -gt 0 ]];then
	avg=$(echo "$ans $cnt" | awk '{print $1/$2}')
fi

echo "-----------------------------------------------------------------------------" >> results.txt
echo "Average CPU usage-" $avg  >> results.txt
echo "Max CPU usage-" $maxx>> results.txt
echo "Number of sec 100% CPU =" $counter>> results.txt

echo "-----------------------------------------------------------------------------" >> results.txt

