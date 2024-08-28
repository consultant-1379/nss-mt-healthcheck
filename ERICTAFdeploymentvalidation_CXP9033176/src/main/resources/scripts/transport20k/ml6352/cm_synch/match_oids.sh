commandfile="check2.txt"
odi_file="oids_arr.txt"
oid="out.log"
rm oids_arr.txt
rm commando.txt
rm eq.txt
declare -a oid
while read -r line
do
    i=1
    var=$(echo $line | awk -F',' '{print $'$i'}' | awk -F'"' '{print $2}')
    i=`expr $i + 1`
    echo the variable is $var
    echo $var >> oids_arr.txt
    while [[ $i -lt 8 ]] && [[ $var == *"."* ]]
    do
        var=$(echo $line | awk -F',' '{print $'$i'}' | awk -F'"' '{print $2}')
        echo var insdie is $var
        i=`expr $i + 1`
        if [[ $var == *"."* ]]
        then
            echo $var >> oids_arr.txt
                fi
    done

done < $oid

declare -a comm
declare -a odi
i=0
k=0
while read -r line
do
    new=$(echo $line | awk '{print $2}')
    echo $new >> commando.txt
done < check2.txt



while read -r line
do
  comm[$i]=$line
  i=`expr $i + 1`
done < commando.txt
while read -r line
do
    odi[$k]=$line
    k=`expr $k + 1`
done < $odi_file

j=0
while [[ $j -lt $i ]]
do
    echo hey
    echo ${comm[$j]}"="${odi[$j]} >> eq.txt
    j=`expr $j + 1`
done


