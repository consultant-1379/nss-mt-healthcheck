usage()
{
    echo "------------------------------------------------------------------------------"
    echo "$0 Simulation_name server_filename input_filename scriptPath"
    echo "------------------------------------------------------------------------------"
    exit 1
}

if [[ $# -ne 4 ]];then
    usage
fi

SimulationName=$1
#NumLoops=$2
#NumAlarms=$3
#NumNodes=$4
ServerFilename=$2
#Frequency=$6
scriptPath=$4
timeFile=$scriptPath"/timefile.txt"
outputFile=$scriptPath"/outputalarmburstfile.txt"
#inputFile format 
#num of nodes, num of alarms, freq, num of loops
inputFile=$3
threshold=0
alarmCntFile=$scriptPath"/alarmBurstScripts/alarmcntfile.txt"

echo "|    NumNodes    |    MaxTime    |    MaxAlarms    |" >> $outputFile

while IFS='' read -r line || [[ -n "$line" ]]; do
    NumNodes=$(echo $line | awk -F\, '{print $1}')
    NumAlarms=$(echo $line | awk -F\, '{print $2}')
    Frequency=$(echo $line | awk -F\, '{print $3}')
    NumLoops=$(echo $line | awk -F\, '{print $4}')
    cd $scriptPath/alarmBurstScripts
    for((i=0;i<$NumLoops;i++));do
        sh seperate.sh
        sleep 10
        sh ceasescript.sh $SimulationName
        sleep 30
        sh executeMultiple.sh $NumAlarms $NumNodes 1 no $ServerFilename $Frequency
        sleep 30
    done

    #find max time from timefile.txt   
    maxTime=$(awk 'BEGIN{x=-2147483648};$0>x{x=$0};END{print x}' $timeFile)
    #find max Alarms/sec from $alarmCntFile
    maxAlarms=$(awk 'BEGIN{x=-2147483648};$0>x{x=$0};END{print x}' $alarmCntFile)
    if [[ "$threshold" -gt "$maxAlarms" ]];then
        break
    else
        threshold=$maxAlarms
    fi

    #echo "------------------------------------------------------------------------------" >> $outputFile
    #echo "Number of nodes =" $NumNodes >> $outputFile
    #echo "Number of Alarms =" $NumAlarms >> $outputFile
    #echo "Frequency =" $Frequency >> $outputFile
    #echo "Number of Loops =" $NumLoops >> $outputFile
    #echo "MAX TIME taken considering all the "$NumLoops" Loops = " $maxTime >> $outputFile
    #echo "------------------------------------------------------------------------------" >> $outputFile
    echo "|"    $NumNodes    "|"    $maxTime    "|"    $maxAlarms    "|" >> $outputFile


   rm -rf $timeFile
    rm -rf $alarmCntFile
done < "$inputFile"

cat $outputFile
rm -rf $outputFile

echo "----------------------------------"
echo "VM Capability - " $threshold
echo "----------------------------------"

rm -rf $timeFile
rm -rf $alarmCntFile
