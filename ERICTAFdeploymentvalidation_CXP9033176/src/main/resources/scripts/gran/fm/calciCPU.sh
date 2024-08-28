######################
#This Script is Internally called to calculate the average , max CPU usage.
######################
sarFile=$1
lc=1
sum=0.00
max=0.00
count_100=0
count=0
while read line
do

if [ $lc -gt 3 ]
then 
echo $line
idle=$(echo $line | awk '{print $8}')
usage=$(echo $idle 100 | awk '{print $2 - $1}')

#var=$(echo $usage $max | awk '{ print $1 > $2 }')
#echo var is $var
if [ $(bc <<< "$usage == 100.00") -eq 1 ]
then 
    let count_100=$count_100+1
fi
if [ $(bc <<< "$max <= $usage") -eq 1 ]
  then
  max=$usage
 echo max now is: $max
  fi
sum=$(echo $sum $usage | awk '{print $1 + $2}')
 let count=$count+1
fi
let lc=$lc+1
done < $sarFile

#echo count is $count
avg=$(echo $sum $count | awk '{print $1 / $2}')
echo CPU Utilization:
echo Average: $avg
echo Maximum: $max
echo Count of 100% utilization: $count_100

