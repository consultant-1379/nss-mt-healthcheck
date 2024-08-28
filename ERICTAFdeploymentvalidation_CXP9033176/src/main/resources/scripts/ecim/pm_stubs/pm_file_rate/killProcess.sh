pidFile="pidFile.txt"
childPid=$(cat $pidFile | head -1)

kill -9 $childPid
rm -rf $pidFile

