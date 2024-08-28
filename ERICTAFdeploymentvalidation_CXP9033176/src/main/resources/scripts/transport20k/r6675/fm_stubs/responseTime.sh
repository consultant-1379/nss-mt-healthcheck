usage(){
    echo "---------------------------------------------------------------------------------"
    echo "$0 <response_time_filename> <totalCheckSec>"
    echo "---------------------------------------------------------------------------------"
    exit 1
}

if [[ $# -ne 2 ]];then
    usage
fi

# sent time
file1="result1.txt"
outputFile="outFile.job"
finalFile="finalFile.job"
saroutFile="saroutFile.txt"
totalCheckSec=$2
finalAll="finalAll.job"
#echo --- $file1
#cattde=$(cat $outputfile)
#catted=$(cat $file1)
sh extract.sh $1 $file1

t1sec=$(sort -k1 -n $file1 | head -1 | awk '{print $1}')
    t2sec=$(sort -k1 -n $file1 | tail -1 | awk '{print $1}')
    diff=$((t2sec-t1sec))


#echo checking
#############################################################################################################
####Checking for every second till stopburst
#############################################################################################################
declare -a avccnt
declare -a startTime
declare -a endTime

for((i=1;i<=$totalCheckSec;i++));do
	avccnt[${i}]=0
done
while IFS='' read -r line || [[ -n "$line" ]];do
	t11sec=$(echo $line | awk '{print $1}')
	tempSec=$t1sec
	for((i=1;i<=$totalCheckSec;i++));do
		startTime[${i}]=$tempSec
		endTime[${i}]=$((tempSec+1000))
		if [[ ( "$t11sec" -lt "${endTime[${i}]}" ) && ( "$t11sec" -ge "${startTime[${i}]}" ) ]];then
        	    avccnt[${i}]=$((avccnt[${i}]+1))
	        fi
		tempSec=${endTime[${i}]}
	done

done < "$file1"

#maxSec=0
for((i=1;i<=$totalCheckSec;i++));do
	tempSec1=${avccnt[${i}]}
	echo "----------- $i th sec : -> $tempSec1"

#	if [[ $maxSec -lt $tempSec1 ]];then
#		maxSec=$tempSec1
#		sarFilename=$(find . -name "*.sar" | awk -F\/ '{print $2}')
#		sh calculateCPU.sh $sarFilename "${startTime[${i}]}" "${endTime[${i}]}"
#	fi
done

#Not taking max , checking only for the $totalCheckSec th sec
maxSec=${avccnt[3]}
sarFilename=$(find . -name "*.sar" | awk -F\/ '{print $2}')
echo ==== sar ${startTime[2]} ${endTime[2]}
sh calculateCPU.sh $sarFilename "${startTime[3]}" "${endTime[3]}"


#extract CPU logs during the sec at which max notifications observed
avgCpu=$(cat $saroutFile | head -1 | awk '{print $1}')
maxCpu=$(cat $saroutFile | head -1 | awk '{print $2}')
numsecCpu=$(cat $saroutFile | head -1 | awk '{print $3}')

#echo "--------------------------------------------------------" >> $outputFile

for((i=1;i<=$totalCheckSec;i++));do
        tempSec1=${avccnt[${i}]}
	echo "Notif $i-1 to $i -"  $tempSec1 >> $outputFile
done
#echo "Number of notifications / sec -" $maxSec >> $outputFile
echo "Average CPU usage-" $avgCpu >> $outputFile
echo "Max CPU usage-" $maxCpu >> $outputFile
echo "Number of sec 100% CPU =" $numsecCpu  >> $outputFile
echo "------------------------------------------------------------------------------"  >> $outputFile


#echo "Total Notifications in 1 sec -" $maxSec >> $outputFile
for((i=1;i<=$totalCheckSec;i++));do
        tempSec1=${avccnt[${i}]}
        printf " $tempSec1  ">> $finalAll
done
printf " $avgCpu $maxCpu $numsecCpu" >> $finalAll


#to clean all the intermediate files generated
#sh clean.sh

cat outFile.job | tail -12
