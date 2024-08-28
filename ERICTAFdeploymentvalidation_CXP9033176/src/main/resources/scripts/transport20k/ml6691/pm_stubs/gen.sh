################################################################################
# Description : To generate the list of get-bulk request commands using traces
# Usage : sh gen.sh
################################################################################


trace=$1
count=0
rm check.txt
while read -r line
do
    fl=0
    if [[ $line == *"TRACE"* ]]
    then
	echo "trcae: $line"
        count=0
        fl=1
    fi

    if [[ $line == *"get-bulk request"* ]] && [[ $count -eq 0 ]]
    then
	echo "get bulk" $line
        echo $line >> check.txt
        count=1
        fl=1
    fi
    if [[ $count -eq 1 && $fl -eq 0 ]]
    then
        echo $line is "
        echo $line >> check.txt
    fi

        fl=1

done < $trace

count=0
nullcount=0
file="check.txt"
rm checknew.txt
rm check2.txt
rm check3.txt
tem=0
while IFS= read -r line
do
    if [[ $line == *"SNMPv3"* ]]
    then
        flag=1
        tem=`expr $tem + 1`
    fi

    if [[ $line == *"="* ]] && [[ $flag -eq 0 ]]
    then
        newline=$(echo $line | awk '{print $2}' | awk -F'.' '{print $1}')
        echo $line >> check2.txt
        echo $newline >> check3.txt
        echo $tem >> numbermatch.txt
        if [[ $line == *"."* ]]
        then
            last_num=$(echo $line | awk '{print $2}' | cut -d"." -f2-)
            echo $last_num >> prefinal.txt
        else
            echo "" >> prefinal.txt
        fi

    fi

    flag=0




done < $file

rm li.txt
list=$(cat "check3.txt" | awk '{print $1}')


var="["
com=","
t=0
while read -r line
do
   if [[ $t -ne 0 ]]
   then
    var=$var$com$line
    fi
    if [[ $t -eq 0 ]]
    then
        var=$var$line
        t=1
    fi


done < check3.txt
echo $var >> li.txt
