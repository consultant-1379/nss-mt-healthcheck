#############################################
# DESCRIPTION - To find how many bursts from 1 to 6 secs
#arg1 : start time 
#arg2 : resp file
#arg3 : num nodes
#############################################
start_time=$1
end_time=$2
resp_file=$3
numNodes=$4
freq=$5
count_file="counts1.txt"
echo " " >> $count_file
echo freq _find
prmntime="prmntime.txt"
newprmn="newprmn.txt"
truncate -s 0 $prmntime
truncate -s 0 $newprmn
Run_time=`expr $end_time - $start_time`
space="  "
printf "$numNodes$space$freq$space$Run_time$space" >> $count_file
start_new="$start_time"
end_new="$end_time"

start_final=${start_new::+10}
end_final=${end_new::+10}
q=1



#echo "==================== $freq ===================" >> $count_file

for(( i=0;i< 6;i++ ))
do 
	let mult=i*1000
	st=`expr $start_time + $mult `
	echo $st $resp_file $
	sh extract_resp.sh $st $resp_file $i
	
 	if [ $i -eq 2 ]
	then	
	let nmult=i*1
	nt=`expr $start_final + $nmult `
	ntt=`expr $nt + $q`
	sh sar_usecase.sh $nt $ntt	
	fi
done

#echo "==================== $freq ===================" >> $count_file


echo 
sh sar_usecase.sh $start_final $end_final 
