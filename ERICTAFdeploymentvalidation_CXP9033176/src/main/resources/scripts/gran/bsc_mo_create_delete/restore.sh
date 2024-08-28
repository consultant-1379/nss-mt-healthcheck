
nodefile=$1
n=$2
i=1

rm -rf tmp.txt
while read -r line && [[ $i -le $n ]]
do
   echo i value and n value is $i and $n
	# rm -rf tmp.txt
    NODE_NAME=$(echo $line | awk '{print $1}')
    SIM_NAME=$(echo $line | awk '{print $2}')
   echo  .open $SIM_NAME >> tmp.txt
   echo  .select $NODE_NAME >> tmp.txt
   echo  .stop >> tmp.txt
   echo  .restorenedatabase curr all force >> tmp.txt
   echo .start >> tmp.txt

#    ~/inst/netsim_shell < tmp.txt
i=`expr $i + 1`
done < $nodefile
i=`expr $i + 1`
echo $i

~/inst/netsim_shell < tmp.txt
