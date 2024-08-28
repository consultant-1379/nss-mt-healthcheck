
		tempFile="tempfile.txt"
		tempoutFile="tempoutFile.txt"

                rm -rf $tempFile
                rm -rf $tempoutFile
		SIM_NAME=$1
		NODE_NAME=$2

                echo ".open "$SIM_NAME >> $tempFile
                echo ".select "$NODE_NAME >> $tempFile
                echo ".show fs" >> $tempFile
                ~/inst/netsim_shell < $tempFile | tee -a $tempoutFile



