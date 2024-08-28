#!/bin/bash

ext=".txt"

#change filenames
nodeCommandFile="nodeCommandFile.txt"
tempFile="tempFile.txt"
deleteFiles="deletefiles.sh"
def=0
num_nodes=0
serverNames="serverNames.txt"
touch $serverNames

echo rm -rf $nodeCommandFile >> $deleteFiles
echo rm -rf $tempFile >> $deleteFiles

cat >> $nodeCommandFile << MML
.show started
MML

~/inst/netsim_shell < $nodeCommandFile | tee -a $tempFile
#/proj/netsimdesign/zkidpiy/R30F/netsim_shell < $nodeCommandFile | tee -a $tempFile

while IFS='' read -r line || [[ -n "$line" ]]; do
    if [[ $line == *"server_"* ]];then
        serverName=$(echo $line | awk '{print $1}' | cut -d "'" -f 2)
        echo "rm -rf" $serverName$ext >> $deleteFiles
        grep -q -F '"$serverName$ext"' $serverNames || echo $serverName$ext >> $serverNames

    elif [[ $line == *"/netsimdir/"* ]];then
        var1=$(echo $line | awk '{print $1}')
        var2=$(echo $line | sed 's/.*\///')
        if [[ $line = *[!\ ]* ]]; then
            echo $var1 $var2 >> $serverName$ext
        fi
    fi
done < "$tempFile"
