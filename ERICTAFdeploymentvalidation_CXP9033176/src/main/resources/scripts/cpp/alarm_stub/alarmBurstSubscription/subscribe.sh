
filename=$1
timeout=$2
index=0
declare -a PIDS
tempFile="tempfile.txt"
echo "Attach" > $tempFile
while IFS='' read -r line || [[ -n "$line" ]]; do
	nodeName=$(echo $line | awk '{print $1}')
	nodeIp=$(echo $line | awk '{print $2}')
	simName=$(echo $line | awk '{print $5}')
	java AlarmStub -ORBInitialPort 56834 -ORBInitialHost $nodeIp -sim $simName -ne $nodeName -time $timeout &
	PIDS[${index}]=$!
	index=$((index+1))
	echo "java AlarmBurst -ORBInitialPort 56834 -ORBInitialHost $nodeIp -sim $simName -ne $nodeName -time $timeout" 
done < "$filename"

for((i=0;i<=$index;i++));
do
# Wait for all spawned process to complete
wait ${PIDS[${i}]}
done

