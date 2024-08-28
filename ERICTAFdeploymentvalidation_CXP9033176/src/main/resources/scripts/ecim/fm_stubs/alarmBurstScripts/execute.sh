#!/bin/bash


usage(){
    echo "Usage: $0 filename num_of_alarms num_of_nodes freq"
    exit 1
}

if [ $# -eq 2 ];then
    flag=1
else
    flag=0
    if [ $# -ne 4 ];then 
        usage
    fi
fi

#------------------------------------------initialisations -----------------------------------------------------------------------------------
freq=$4
filename=$1
alarmStartTime=0
alarmEndTime=0
nodeAlarmCommandFile="nodeAlarmCommandFile.txt"
resultFile="outputFile.txt"
deleteFiles="deletefiles.sh"
selectCommand=".select"
space=" "
def=1
cnt=1
finalOutput="finaloutput.txt"
timeFile="timefile.txt"
alarmCntFile="alarmcntfile.txt"
sarlogFile="/netsim/sarlog.log"

#--------------------------------------------declaring sar------------------------------------------------------------------------------------

sar 1 > $sarlogFile &
child_pid=$!
echo " Child Pid =" $child_pid


#--------------------------------------------- creating select command with all nodes ------------------------------------------------------
while IFS='' read -r line || [[ -n "$line" ]]; do
    nodeName=$(echo $line | awk '{print $1}')
    simName=$(echo $line | awk '{print $2}')
    selectCommand=$selectCommand$space$nodeName
    #if not passed any value then include all the nodes
    cnt=$((cnt+1))
    if [[ "$flag" -ne "$def" ]];then
        if [[ "$cnt" -gt "$3" ]];then
            break
        fi
    fi
done < "$filename"

#--------------------------------------------calculate how many alarms to take-----------------------------------------------------------------
numOfAlarms=0
denoval=$((cnt-1))
lowdiv=$(($2/$denoval))
highdiv=$((lowdiv+1))
lowdivmul=$((lowdiv*$denoval))
highdivmul=$((highdiv*$denoval))

lowdiff=$(($2-lowdivmul))
highdiff=$((highdivmul-$2))

if [[ "$lowdiff" -lt "$highdiff" ]];then
    numOfAlarms=$lowdiv
else
    numOfAlarms=$highdiv
fi

#--------------------------------------------------------------------------------------------------------------------------------------------------


echo ".open" $simName >> $nodeAlarmCommandFile
echo $selectCommand >> $nodeAlarmCommandFile
echo "ceasealarm:all;" >> $nodeAlarmCommandFile
echo ".sleep 5" >> $nodeAlarmCommandFile
echo ".log /netsim/inst/tmp_p.log" >> $nodeAlarmCommandFile
echo ".trace on protocol" >> $nodeAlarmCommandFile
echo "alarmburst:freq="$freq",num_alarms= "$numOfAlarms",cease_after="$((numOfAlarms+1))";" >> $nodeAlarmCommandFile
echo ".sleep 5" >> $nodeAlarmCommandFile

echo ".trace off protocol" >> $nodeAlarmCommandFile
echo ".log close" >> $nodeAlarmCommandFile

~/inst/netsim_shell < $nodeAlarmCommandFile | tee -a $resultFile

#-----------------------------------------calculate time in milliseconds----------------------------------------------------------------------------------------
firstOccurence=$(grep -nri "trappdu" $resultFile | head -1)
yyy1=$(echo $firstOccurence | awk '{print $2}' | cut -d'-' -f1)
mmm1=$(echo $firstOccurence | awk '{print $2}' | cut -d'-' -f2)
ddd1=$(echo $firstOccurence | awk '{print $2}' | cut -d'-' -f3)
hh1=$(echo $firstOccurence | awk '{print $3}' | cut -d':' -f1)
mm1=$(echo $firstOccurence | awk '{print $3}' | cut -d':' -f2)
ss1=$(echo $firstOccurence | awk '{print $3}' | cut -d':' -f3)
ss11=$(echo $ss1 | awk '{print $1}' | cut -d'.' -f1)


lastOccurence=$(grep -nri "trappdu" $resultFile | tail -1)
yyy2=$(echo $lastOccurence | awk '{print $2}' | cut -d'-' -f1)
mmm2=$(echo $lastOccurence | awk '{print $2}' | cut -d'-' -f2)
ddd2=$(echo $lastOccurence | awk '{print $2}' | cut -d'-' -f3)
hh2=$(echo $lastOccurence | awk '{print $3}' | cut -d':' -f1)
mm2=$(echo $lastOccurence | awk '{print $3}' | cut -d':' -f2)
ss2=$(echo $lastOccurence | awk '{print $3}' | cut -d':' -f3)
ss22=$(echo $ss2 | awk '{print $1}' | cut -d'.' -f1)

t2sec=$(date -d"$yyy2-$mmm2-$ddd2 $hh2:$mm2:$ss2" +%s%3N) 
t1sec=$(date -d"$yyy1-$mmm1-$ddd1 $hh1:$mm1:$ss1" +%s%3N)


alarmStartTime=$(date -d"$yyy1-$mmm1-$ddd1 $hh1:$mm1:$ss11" +%s%3N)
alarmEndTime=$(date -d"$yyy2-$mmm2-$ddd2 $hh2:$mm2:$ss22" +%s%3N)
alarmEndTime=$((alarmEndTime+1000))

diff=$((t2sec-t1sec))

echo $diff >> $timeFile

#------------------------------------------add all snmpv2-trap lines in a file to calculate (alarms per sec ) --------------------------------------------------
allTimes="alltimes.txt"
grep -nri "trappdu" $resultFile >> $allTimes
plusonesec=$((t1sec+1001))
alarmcnt=0

#read the file and note down only times
while IFS='' read -r line || [[ -n "$line" ]]; do
    yyy1=$(echo $line | awk '{print $2}' | cut -d'-' -f1)
    mmm1=$(echo $line | awk '{print $2}' | cut -d'-' -f2)
    ddd1=$(echo $line | awk '{print $2}' | cut -d'-' -f3)
    hh1=$(echo $line | awk '{print $3}' | cut -d':' -f1)
    mm1=$(echo $line | awk '{print $3}' | cut -d':' -f2)
    ss1=$(echo $line | awk '{print $3}' | cut -d':' -f3)

    t1sec=$(date -d"$yyy1-$mmm1-$ddd1 $hh1:$mm1:$ss1" +%s%3N)
    if [[ "$t1sec" -lt "$plusonesec" ]];then
        alarmcnt=$((alarmcnt+1))
    fi
done < "$allTimes"

echo $alarmcnt >> $alarmCntFile

alarmCount=$(grep -c 'trappdu' $resultFile)
rm -rf $nodeAlarmCommandFile

#echo ".open" $simName >> $nodeAlarmCommandFile
#echo $selectCommand >> $nodeAlarmCommandFile
#echo "ceasealarm:all;" >> $nodeAlarmCommandFile
#~/inst/netsim_shell < $nodeAlarmCommandFile | tee -a $resultFile
#rm -rf $nodeAlarmCommandFile


echo "----------------------------------------------------------------" >> $finalOutput
echo "All times are in milliseconds" >> $finalOutput
echo "Expected Alarms/sec(frequency) -" $freq >> $finalOutput
echo "Alarm Count -" $alarmCount >> $finalOutput
echo "Time taken by netsim =" $diff "millisec" >> $finalOutput
echo $firstOccurence >> $finalOutput
echo $lastOccurence >> $finalOutput
echo "number of nodes =" $3 >> $finalOutput 
echo "alarm Count Per Sec" $alarmcnt  >> $finalOutput

sh calculateIdle.sh $sarlogFile $alarmStartTime $alarmEndTime
kill -9 $child_pid
echo "----------------------------------------------------------------" >> $finalOutput

rm -rf $resultFile
rm -rf ~/inst/tmp_p.log
rm -rf $sarlogFile

