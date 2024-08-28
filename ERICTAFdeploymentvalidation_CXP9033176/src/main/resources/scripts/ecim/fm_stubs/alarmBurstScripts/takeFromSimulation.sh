#filename #loops #time #number_of_nodes #freq
#write usage

allSimNodes="allsimnodes.txt"
simFile="simfile.txt"
simName=$(cat $1 | head -1 | awk '{print $2}')

echo ".open" $simName >> $allSimNodes
echo ".show simnes" >> $allSimNodes

~/inst/netsim_shell < $allSimNodes | tee -a $simFile

rm -rf $allSimNodes

while IFS='' read -r line || [[ -n "$line" ]]; do
    if [[ $line == *"NE Name"* ]];then
        continue
    elif [[ $line == *">>"* ]];then
        continue
    elif [[ $line == *"OK"* ]];then
        continue
    elif [[ $line == *"Error"* ]];then
        continue
    else
        var1=$(echo $line | awk '{print $1}')
        if [[ $line = *[!\ ]* ]]; then
            echo $var1 $simName >> $allSimNodes
        fi
    fi
done < "$simFile"

for ((i=0;i<$2;i++));do
    sh execute.sh $allSimNodes $3 $4 $5
done

