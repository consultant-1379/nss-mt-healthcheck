#find frequency per node

i=310
finalFile="finalFile.job"
maxFreq=1000
maxNodes=100
sleepTime=30
freqPerNode=0

while [[ $i -le 1000 ]];do
	sh trigger.sh $i 1 "allNodes.job" true $i 123 5
	sleep $sleepTime
	notifPerSec=$(cat $finalFile | tail -1 | awk '{print $4}')
	if [[ $notifPerSec -lt $((i-3)) ]];then
		break
	fi
	freqPerNode=$i
	i=$((i+10))
done

i=5

#To find the exact frequency 
sh trigger.sh $((freqPerNode+5)) 1 "allNodes.job" true $((freqPerNode+5)) 123 5
notifPerSec=$(cat $finalFile | tail -1 | awk '{print $4}')
if [[ $notifPerSec -eq $((freqPerNode+5)) ]];then
	freqPerNode=$((freqPerNode+5))
fi

sleep $sleepTime

i=10
#RUN-1
while [[ $i -le 100 ]];do
	totalNotif=$((i*freqPerNode))
	sh trigger.sh $totalNotif $i "allNodes.job" true $freqPerNode 123 5
	sleep $sleepTime
	i=$((i+10))
done

i=10
#RUN-2
while [[ $i -le 100 ]];do
	totalNotif=$((i*freqPerNode))
	sh trigger.sh $totalNotif $i "allNodes.job" true $freqPerNode 123 5
	sleep $sleepTime
	i=$((i+10))
done
