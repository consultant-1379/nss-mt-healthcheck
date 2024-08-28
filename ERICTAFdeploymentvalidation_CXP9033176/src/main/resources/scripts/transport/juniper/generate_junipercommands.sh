command="commando.txt"
oid="oids_arr.txt"

declare -a arr
i=1
dot="."
while read -r line
do
    if [[ $line == *"."* ]]
    then
       ch=$(echo $line | cut -d"." -f2-)
       # arr[$i]=$(echo $line | cut -d"." -f2-)
       arr[$i]=$dot$ch
    else
    arr[$i]=""
    fi

    echo ${arr[$i]}
    i=`expr $i + 1`

done < $command
rm finaloids.txt
declare -a array
k=1
while read -r line
do
    lin=$line${arr[$k]}
    echo $lin >> finaloids.txt
    array[$k]=$lin
    k=`expr $k + 1`
done < $oid

fullcommand="check.txt"
rm fresult.txt

flag=0
j=0
va=""
space=" "
star=1
while read -r line
do
    flag=0
    if [[ $star -eq 1 ]]
    then
    fi

    if [[ $line == *"SNMPv2"* && $star -eq 0 ]]
    then
        flag=1
        echo $va >> fresult.txt
        va=""
    fi

    if [[ $flag -eq 0 ]]
    then
        va=$va${array[$j]}$space
        j=`expr $j + 1`
    fi

star=0

done < $fullcommand

echo $va >> fresult.txt



echo k is $k and j is $j


rm script1.sh
while read -r line
do
        sh script.sh $line
done < fresult.txt

