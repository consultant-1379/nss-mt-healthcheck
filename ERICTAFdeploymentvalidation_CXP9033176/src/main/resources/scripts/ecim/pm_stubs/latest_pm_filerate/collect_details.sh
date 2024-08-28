##############################################################################################
# DESCRIPTION - THIS IS USED TO FETCH THE DETAILS OF GENERATED FILES i.e., FILE NAME.
# USAGE - sh collect_details.sh <num_of_nodes> <NETSIM_SERVER>
# Pre - usecase : nodeips.txt file should be present with Node_name and Node-ip.
##############################################################################################


NUM_NODES=$1
SERVER=$2
nodes="nodeips.txt"

`sort -R $nodes | head -n $NUM_NODES > selectednodes1.txt` #TO RANDOMIZE NODE SELECTIONS

final="final.txt"
	rm -rf $final
#	rm zp.txt
	rm fetcheddata.txt
while read -r line
	do
	rm zp.txt

	NODE_NAME=$(echo $line | awk '{print $2}')
	NODE_IP=$(echo $line | awk '{print $3}')
	SIM_NAME=$(echo $line | awk '{print $1}')
	tempFile="tempfile.txt"
        tempoutFile="tempoutFile.txt"
	lmp="lmp.txt"
 #      rm -rf $lmp
        rm -rf $tempFile
        rm -rf $tempoutFile
	sh extract_file.sh $SIM_NAME $NODE_NAME $SERVER
	fileStore=$(cat $tempoutFile | tail -2 | head -1 | awk '{print $2}')
	echo sdhjhdjhdsjhj
	echo $fileStore
	path=$fileStore"/c/pm_data/LTE03"
	echo $path
	sh exact_file.sh $path $SERVER

	#filename=$(cat zp.txt | tail -7 | head -2 | tail -1 | awk '{print $9}')
	`cat zp.txt | tail -15 > take.txt`
	while read -r line
	do
	if [[ $line == *"CellTrace_DUL1_3.bin.gz"* ]]
		then
		filename=$line
	fi
	file=$(echo $filename | awk '{print $9}')
	done < take.txt

	echo $filename

	echo $NODE_NAME $NODE_IP $SIM_NAME $file >> fetcheddata.txt

done < selectednodes1.txt

