usage(){
    echo "---------------------------------------------------------------------------------"
    echo "$0 response_time_filename"
    echo "---------------------------------------------------------------------------------"
    exit 1
}

if [[ $# -ne 1 ]];then
    usage
fi

# sent time
file1="result1.txt"
outputFile="finalFile.txt"

sh extract.sh $1 $file1


    t1sec=$(sort -k1 -n $file1 | head -1 | awk '{print $1}') 
    t2sec=$(sort -k1 -n $file1 | tail -1 | awk '{print $1}')
    diff=$((t2sec-t1sec))

    notifCnt=$(grep -nri "AVCType" $1 | wc -l)

#Calculating number of notifications per second

    plusonesec=$((t1sec+1001))
    alarmcnt=0
    while IFS='' read -r line || [[ -n "$line" ]]; do
	t11sec=$(echo $line | awk '{print $1}')
        if [[ "$t11sec" -lt "$plusonesec" ]];then
            alarmcnt=$((alarmcnt+1))
        fi
    done < "$file1"


t1Date=$(sort -k1 -n $file1 | head -1)
t2Date=$(sort -k1 -n $file1 | tail -1)

echo "t1sec -> " $t1sec "Date --->" $t1Date
echo "t2sec -> " $t2sec "Date --->" $t2Date
#echo "----------------------------------------------------------" 
#echo "t1sec" $t1sec 
#echo "t2sec" $t2sec 
echo "Number of Notifications =" $notifCnt >> $outputFile
echo "Total Time - "$diff "millisec" >> $outputFile
echo "Total Notifications in 1 sec -" $alarmcnt >> $outputFile
#echo "----------------------------------------------------------" 
