#!/usr/bash

usage(){
    echo "------------------------------------------------------------------"
    echo "Usage: $0 filename <start_time> <stop_time> \n start and stop time should be in millis"
    echo "------------------------------------------------------------------"
}

if [[ $# -ne 3 ]];then
    usage
fi

filename=$1
startTime=$2
endTime=$3
run=$(echo $filename | cut -d"." -f1)
#echo $run
cent=100.0
ans=0
cnt=0
counter=0
start=2000
maxx=0

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
        ss=$(echo $line | awk '{print $1}' | cut -d':' -f3)
	ss1=$(echo $ss | cut -d"." -f1)
	ss2=$(echo $ss | cut -d"." -f2)
	ss2=`printf "%06d\n" ${ss2}`
        t2sec=$(date -d"$yyy2-$mmm2-$ddd2 $hh2:$mm2:$ss1.$ss2" +%s%6N)
#        echo $t2sec        
        if [[ $t2sec < $startTime || $t2sec > $endTime ]];then
            continue
        fi
        val=$(echo $line | awk '{print $8}')
        val=$(echo "$cent $val" | awk '{print $1-$2}')
        ans=$(echo "$ans $val" | awk '{print $1+$2}')
        cnt=$((cnt+1))

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

echo "Average CPU usage-" $avg >> "${run}.csv"
echo "Max CPU usage-" $maxx >> "${run}.csv"
echo "Number of sec 100% CPU =" $counter >> "${run}.csv"

