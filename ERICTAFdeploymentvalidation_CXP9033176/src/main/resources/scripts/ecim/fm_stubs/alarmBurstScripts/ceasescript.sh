
nodeAlarmCommandFile="a.txt"
simName=$1
echo ".open" $simName >> $nodeAlarmCommandFile
echo ".select network" >> $nodeAlarmCommandFile
echo "ceasealarm:all;" >> $nodeAlarmCommandFile

~/inst/netsim_shell < $nodeAlarmCommandFile
rm -rf $nodeAlarmCommandFile
