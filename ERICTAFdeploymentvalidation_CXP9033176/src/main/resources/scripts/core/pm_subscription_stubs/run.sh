
NUM_NODES=$1
NUM_MOS=$2

if [[ $# -ne 2 ]];then
	echo "USAGE: $0 <NUM_NODES> <NUM_MOS>"
	exit 1
fi
echo "$NUM_NODES $((NUM_MOS*NUM_NODES))" >> finalFile.job

curr=$(pwd)
cp /netsim/sar_1.log $curr
sh generateRequestPrmn.sh
sh generateResponsePrmn.sh
prmnresponseFilename=$(find . -name "Prmn*resp" | awk -F\/ '{print $2}')
prmnrequestFilename=$(find . -name "Netsim*log" | awk -F\/ '{print $2}')

echo "response- > $prmnresponseFilename request -> $prmnrequestFilename"

sh extract.sh $prmnrequestFilename $prmnresponseFilename

#delete all the intermediate files created
sh clean.sh
rm -rf /netsim/sar_1.log
cat finalFile.job | tail -1
