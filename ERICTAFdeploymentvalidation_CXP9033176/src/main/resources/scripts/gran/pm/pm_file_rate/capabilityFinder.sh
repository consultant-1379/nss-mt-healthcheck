num=$1
i=10
while [[ $i -le 110 ]];do
sh trigger.sh $num
i=$((i+10))
sleep 20
done
