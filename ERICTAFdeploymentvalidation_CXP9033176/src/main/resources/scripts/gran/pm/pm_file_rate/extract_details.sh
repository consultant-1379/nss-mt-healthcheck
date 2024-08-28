	NUM_NODES=$1
	NF=$2
	nodes="finalNodes.job"
	`sort -R $nodes | head -n $NUM_NODES > selectednodes1.txt` #TO RANDOMIZE NODE SELECTIONS
	final="final.txt"
	rm -rf $final
	while read -r line
	do
	NODE_NAME=$(echo $line | awk '{print $1}')
	NODE_IP=$(echo $line | awk '{print $2}')
	SIM_NAME=$(echo $line | awk '{print $3}')
	tempFile="tempfile.txt"
        tempoutFile="tempoutFile.txt"
        lmp="lmp.txt"
 #      rm -rf $lmp
        rm -rf $tempFile
        rm -rf $tempoutFile
	sh extract_file.sh $SIM_NAME $NODE_NAME

       # SETTING THE EXACT PATH FOR EACH TYPE OF FILES 
        fileStore=$(cat $tempoutFile | tail -4 | head -1 | awk '{print $2}')
	
        fileStore3=$fileStore"/data_transfer/destinations/CDHDEFAULT/Ready"

        fileStore4=$fileStore"/data_transfer/destinations/OSSBAR/Ready"

        fileStore5=$fileStore"/data_transfer/destinations/OSSCER/Ready"

        fileStore6=$fileStore"/data_transfer/destinations/OSSCTR/Ready"

        fileStore7=$fileStore"/data_transfer/destinations/OSSMRR/Ready"

        fileStore8=$fileStore"/data_transfer/destinations/OSSMTR/Ready"

        fileStore9=$fileStore"/data_transfer/destinations/OSSRIR/Ready"
	
	declare -a fstore=($fileStore3 $fileStore4 $fileStore5 $fileStore6 $fileStore7 $fileStore8 $fileStore9)
	
	b="b.txt"
	rm -rf $b
	atmp=$(echo $fileStore | cut -c 8-)


	for i in "${fstore[@]}"
do

	echo $i
### fetching directories from CHDEFAULT	
	sh getfilename.sh $i
#######################################
#	rm -rf "$lmp"
	new="new.txt"
	rm -rf $new
	
	cat lmp.txt | tail -$NF >> $new
	
	if [[ $i == *"CDHDEFAULT"* ]]; then
                echo "It's there!"
     

	while read -r line
	do

#	Filename=$(cat lmp.txt | tail -$NF)
	Filename=$(echo $line)
	
	a="a.txt"
	echo Filename is $Filename >> $a
	fileStore2=$i"/$Filename"
        echo the second file is $fileStore2
        CIT="CIT.txt"
        echo $fileStore >> $CIT
        echo $fileStore2 >> $CIT
        zp="zp.txt"
        rm -rf $zp
        sh exact_file.sh $fileStore2
	Filename2=$(cat $zp | tail -1)
	echo Filename2 is $Filename2 >> $a
	CIT="CIT.txt"
        echo $Filename >> $CIT
#       rm -rf $tempFile
#       rm -rf $tempoutFile
#       rm -rf $zp
        echo end of 2nd
	space=" "
	#line=$line$space$Filename2$space$Filename
	echo $NODE_NAME $NODE_IP $SIM_NAME $Filename2 $Filename >> $final
	echo **********************************************************************************   $Filename2  $Filename >> $b
	done < $new
	
	rm -rf $tempFile
       # rm -rf $tempoutFile
        rm -rf $zp
        echo end of 2nd
        space=" "
	
	else

	j=1
	while read -r line
        do
	ftemp=$(echo $i | awk -F "/" '{print $12}')
	Filename2=$(cat $new | tail -$j | head -1)
	j=`expr $j + 1`
#	ftemp="TEMNONTEMP"
	echo $NODE_NAME $NODE_IP $SIM_NAME $Filename2 $ftemp >> $final
	echo **********************************************************************************   $Filename2  $Filename >> $b
	rm -rf $tempFile
       # rm -rf $tempoutFile
        rm -rf $zp
	done < $new 

	fi
	
done


done < selectednodes1.txt



echo the path is $fileStore	
