#!/bin/bash

if [[ $# -ne 4 ]];then
    echo "Invalid number of parameters"
    echo "Usage : $0 <NUMBER OF NODES> <USE_CASE> <TOTAL_TIME> <RESPONSE_TIME>"
    echo "NOTE: Both TOTAL TIME and RESPONSE TIME should be in MILLISECONDS"
    exit 1
fi

numNodes=$1
filename="/netsim/zsujmad/allNodes.job"
IP_NUM=0
path="/netsim/zsujmad/Files/Node_"
function=$2
sarlogFile="sarlogFile.sar"
declare -a PIDS
timeLimit=$3
thresholdTime=$4
echo "" >> stats.job
echo -n "Given Number of nodes: $numNodes " >> stats.job

rm -rf status.txt
rm -rf time.txt
rm -rf time_verify.txt
rm -rf ../Files/*/*
rm -rf sshtime.job
rm -rf com1time.job
rm -rf com2time.job
rm -rf com3time.job
#rm -rf stats.job
rm -rf check.job
rm -rf rf.job

declare -a node_ips
i=1

sar 1 > $sarlogFile &
sar_pid=$!
echo " Child Pid =" $sar_pid

start=$(($(date +%s%3N)))
start1=`expr $start + $timeLimit`
echo "Trigger start time: $start" >> time.txt
echo "$start1" >> time_verify.txt
while [ "$i" -le "$numNodes" ]
do
NODE_NAME=`cat allNodes.job | grep -i "." | head -$i | tail -n-1 | awk -F" " {print'$1'}`
echo "$NODE_NAME" >> abc.job
IP_NUM=`cat allNodes.job | grep -i "." | head -$i | tail -n-1 | awk -F" " {print'$2'}` 
#echo "$IP_NUM"
sh $function.sh $IP_NUM ${path}$i $NODE_NAME $thresholdTime true &
PIDS[${i}]=$!
i=`expr $i + 1`
done


for((i=1;i<=$numNodes;i++));
do
# Wait for all spawned process to complete
wait ${PIDS[${i}]}
done

end=$(($(date +%s%3N)))
`kill -9 ${sar_pid}`


diff=`expr $end - $start`
echo "Total Time taken: $diff milliseconds" >> time.txt
for ((k=1; k <= $numNodes; ++k))
do
size=`du /netsim/zsujmad/Files/Node_$k`
echo "$size" >> status.txt
done
echo -n "Total Time: $diff " >> stats.job
echo "Total Time taken: $diff milliseconds"
echo "########################## DONE ##########################"
sh calculateCPU.sh $start $end
echo "Number of Nodes: $numNodes"
sh Compare.sh time_verify.txt
sh collector.sh

i=1
count=0
while [ "$i" -le "$numNodes" ]
do
target="../Files/Node_$i"
if find "$target" -mindepth 1 -print -quit 2>/dev/null | grep -q .; then
   #echo "Not empty, do something"
   count=`expr $count + 1`
fi
i=`expr $i + 1`
done
echo -n " Files present:$count " >> stats.job

lineCount=$(grep -c "." rf.job)
finalCount=`expr $numNodes - $lineCount`
echo -n " Final Count:$finalCount" >> stats.job
