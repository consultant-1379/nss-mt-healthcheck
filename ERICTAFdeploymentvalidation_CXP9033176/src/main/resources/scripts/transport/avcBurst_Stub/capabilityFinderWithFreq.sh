#find frequency for variable freq



i=1
finalFile="finalFile.job"
maxFreq=100
maxNodes=500
sleepTime=30
freqPerNode=0

while [[ $i -le 3 ]];do
	numNodes=10
	while [[ $numNodes -le $maxNodes ]];do
		numNotif=$((numNodes*i))
		sh trigger.sh $numNotif $numNodes "allNodes.job" true $i 123 5
		sleep $sleepTime
		notifPerSec=$(cat $finalFile | tail -1 | awk '{print $4}')
		if [[ $notifPerSec -lt $numNotif ]];then
			break
		fi
		numNodes=$((numNodes+10))
	done
	i=$((i+1))
done

i=10

while [[ $i -le $maxFreq ]];do
	numNodes=10
	while [[ $numNodes -le $maxNodes ]];do
		numNotif=$((numNodes*i))
		sh trigger.sh $numNotif $numNodes "allNodes.job" true $i 123 5
		sleep $sleepTime
		notifPerSec=$(cat $finalFile | tail -1 | awk '{print $4}')
		if [[ $notifPerSec -lt $numNotif ]];then
			break
		fi
		numNodes=$((numNodes+10))
	done
	i=$((i+10))
done
