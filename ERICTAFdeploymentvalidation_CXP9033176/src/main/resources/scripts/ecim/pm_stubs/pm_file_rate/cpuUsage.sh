sarlogFile="/netsim/sarlog.log"
pidFile="pidFile.txt"
#declaring sar

sar 1 > $sarlogFile &
child_pid=$!
echo "Child Pid= " $child_pid
echo $child_pid >> $pidFile

