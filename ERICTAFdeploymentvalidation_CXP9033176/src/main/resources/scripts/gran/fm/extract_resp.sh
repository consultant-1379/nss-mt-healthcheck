################################################################
# DESCRIPTION - TO FIND THE OUTPUT FROM THE GENERATED RESPONSE
# NOTE - SHOULD BE RUN WHERE THE NODES ARE PRESENT
# USAGE - sh extract_resp.sh <prmn_respnse.log> <start_time>
# NOTE- start_time of usecase can be get from the client server where the usecase is run in the output
###############################################################

respFile=$2
start_time=$1
check_time=`expr $start_time + 1000 `
echo $start_time and $check_time
count=0


while read -r line
do
  if [[ $line == *AXE* ]]
  then 
	lineNotif=$(echo $line | awk '{print $1}')
	if [[ $lineNotif == *AXE* ]]
 	then
		 #prevLine case
		echo prevLine is $prevLine
		yyyy=$(echo $prevLine | awk -F ',' '{print $2}' | awk -F '{' '{print $3}')
		mmmm=$(echo $prevLine | awk -F ',' '{print $3}')
		dddd=$(echo $prevLine | awk -F ',' '{print $4}' | awk -F '}' '{print $1}')
		echo $yyyy $mmmm $dddd

		hhhh=$(echo $prevLine | awk -F ',' '{print $5}' | awk -F '{' '{print $2}')
		min=$(echo $prevLine | awk -F ',' '{print $6}')
		ssss=$(echo $prevLine | awk -F ',' '{print $7}')
		
		timeMS=$(date -d"$yyyy-$mmmm-$dddd $hhhh:$min:$ssss" +%s%3N)
		echo time in ms is $timeMS
			if [ $timeMS -lt $check_time ]
				then
					count=`expr $count + 1 `
			fi  

	else
		#same line case	
		echo same line is $line
                Date=$(echo $line | awk -F ',' '{print $2}')
		echo $Date
	fi
   fi
   prevLine=$line

done < $respFile


echo the number of burst s is $count
