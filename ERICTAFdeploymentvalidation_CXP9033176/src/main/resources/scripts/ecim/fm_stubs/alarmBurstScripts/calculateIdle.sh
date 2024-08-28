#!/usr/bash

usage(){
    echo "------------------------------------------------------------------"
    echo "Usage: $0 filename alarmStartTime alarmEndTime"
    echo "------------------------------------------------------------------"
}

if [[ $# -ne 3 ]];then
    usage
fi

filename=$1
cent=100.0
ans=0
cnt=0
counter=0
startYear=2000
alarmStart=$2
alarmEnd=$3
logFile="/netsim/inst/tmp_p.log"
maxx=0.0
finalOutput="finaloutput.txt"


sarlogTime=$(cat $filename | head -1)
mmm2=$(echo $sarlogTime | awk '{print $4}' | cut -d'/' -f1)
ddd2=$(echo $sarlogTime | awk '{print $4}' | cut -d'/' -f2)
yyy2=$(echo $sarlogTime | awk '{print $4}' | cut -d'/' -f3)
yyy2=$((startYear+yyy2))


while IFS='' read -r line || [[ -n "$line" ]]; do
    if [[ $line == *all* ]];then
        hh2=$(echo $line | awk '{print $1}' | cut -d':' -f1)
        mm2=$(echo $line | awk '{print $1}' | cut -d':' -f2)
        ss2=$(echo $line | awk '{print $1}' | cut -d':' -f3)
        t2sec=$(date -d"$yyy2-$mmm2-$ddd2 $hh2:$mm2:$ss2" +%s%3N)
       # t2secplusone=`expr $t2sec + 1000`
    echo "alarmStart=$alarmStart   alarmEnd=$alarmEnd   t2Sec=$t2sec"
        if [[ "$alarmStart" -gt "$t2sec" ]] || [[ "$alarmEnd" -lt "$t2sec" ]];then 
            continue
        fi
        val=$(echo $line | awk '{print $8}')
        val=$(echo "$cent $val" | awk '{print $1-$2}')
        echo "val=" $val
        ans=$(echo "$ans $val" | awk '{print $1+$2}')
        cnt=$((cnt+1))

    if (( $(echo "$maxx < $val" | bc -l) ));then
        maxx=$val
    fi
    if (($(echo "$cent == $val" | bc -l) ));then
        counter=$((counter+1))
    fi

    fi
    echo $ans $cnt

done < "$filename"

echo "cnt=" $cnt
avg=$(echo "$ans $cnt" | awk '{print $1/$2}')

echo "Average CPU usage-" $avg >> $finalOutput
echo "Max CPU usage-" $maxx >> $finalOutput
echo "Number of sec 100% CPU =" $counter >> $finalOutput

