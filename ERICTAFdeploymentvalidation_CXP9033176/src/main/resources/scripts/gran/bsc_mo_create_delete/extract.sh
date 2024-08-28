#!/bin/bash


usage(){
    echo "----------------------------------------------------------------------"
    echo "$0 filename output_filename"
    echo "----------------------------------------------------------------------"
    exit 1
}

echo hey inside extract,sh
if [[ $# -ne 3 ]];then
    usage
fi


#format - time message-id node-name
file=$1
result=$2
NE_NAME=$3

echo heyyyyyyyyy

echo $file and $result
#delete generated files
rm -rf $result
rm -rf result1.txt
rm -rf res.txt

s=""
zero=0
space=" "
Six=6

while read -r line 
do
	echo kakdadj
	# if alarm_event is in the same lines as timestamp then take that line otherwise take previous line based on (if alarm_event is 2nd arg of line)
	if [[ $line == *"\"$NE_NAME\",\"NETCONF\",\"ECIMDirectAnswer\""* ]];then
		echo $line
			#lineContains=$(echo $line)
			lineContains=$(echo $line | awk -F\{ '{print $2}')
		if [[ $lineContains == *"\"$NE_NAME\",\"NETCONF\",\"ECIMDirectAnswer\""* ]];then
			#prev line case
        		Date=$(echo $prevLine | awk -F\{ '{print $4}' | awk -F\} '{print $1}')
		        Time=$(echo $prevLine | awk -F\{ '{print $5}' | awk -F\} '{print $1}')
			#echo "Prev Line case ->" $line
		else
			#same line case
	 		Date=$(echo $line | awk -F\{ '{print $4}' | awk -F\} '{print $1}')
		        Time=$(echo $line | awk -F\{ '{print $5}' | awk -F\} '{print $1}')
			#echo "Same line case->" $line
		fi
        	Time=${Time%???}
		
		echo $line
		#Adding 0 at the starting of millisec parameter if its length is less than 6
		Msec=$(echo $Time | cut -d',' -f4)
		Msec1=""
		Mlen=${#Msec}
		MDiff=$((6-Mlen))
		for((i=0;i<$MDiff;i++));do
			Msec1=$Msec1"0"
		done
		Msec1=$Msec1$Msec
#		NodeName=$(echo $line | awk -F\{ '{print $6}' | awk -F\, '{print $1}')
		NodeName=$(echo $line | awk -F\{ '{print $2}' | awk -F\, '{print $1}')	
		yyy1=$(echo $Date |cut -d',' -f1)
		mmm1=$(echo $Date |cut -d',' -f2)
		ddd1=$(echo $Date |cut -d',' -f3)
	        hh1=$(echo $Time | cut -d',' -f1)
	        mm1=$(echo $Time |  cut -d',' -f2)
	        ss1=$(echo $Time |  cut -d',' -f3)"."$Msec1

		s=$(date -d"$yyy1-$mmm1-$ddd1 $hh1:$mm1:$ss1" +%s%3N)
	        echo $s$space$Date$space$Time$space$NodeName$space$Msec1 >> prmn_result.txt 
	        echo $s >> result1.txt
		#sort result1.txt >> res.txt
		s=""
        fi
	prevLine=$line
done < $file
echo $s >> result1.txt
sort result1.txt >> res.txt

prmn_resp_time=$(cat res.txt | head -3 | tail -1) 
check_file="calfinal.txt"
while read -r line
do
edit_config=$(echo $line | awk '{print $1}')
close_session=$(echo $line | awk '{print $2}')
done < caltime.txt
while read -r line
do
if [[ $line == *1* ]]
then
	
	tim=$(echo $line | awk '{print $1}')
	echo $edit_config $tim $close_session >> k.txt
	if [[ $tim -ge $edit_config && $tim -le $close_session ]]
	then
		prmn_resp=$tim
		echo the time exact is $prmn_resp >> k.txt
	fi
fi

#echo the final prmn resp time is $prmn_resp

done < res.txt


echo the final prmn resp time is $prmn_resp
echo $prmn_resp_time
#echo $prmn_resp$space$NE_NAME$space >> finalfile.txt 

rm -rf object_time.txt
rm -rf object_time_final.txt

while read -r line 
do
        #echo kakdadj
        # if alarm_event is in the same lines as timestamp then take that line otherwise take previous line based on (if alarm_event is 2nd arg of line)
        if [[ $line == *"\"$NE_NAME\",\"NETCONF\",\"objectCreated\""* ]];then
                echo $line
                        #lineContains=$(echo $line)
                        lineContains=$(echo $line | awk -F\{ '{print $2}')
                if [[ $lineContains == *"\"$NE_NAME\",\"NETCONF\",\"objectCreated\""* ]];then
                        #prev line case
                        Date=$(echo $prevLine | awk -F\{ '{print $4}' | awk -F\} '{print $1}')
                        Time=$(echo $prevLine | awk -F\{ '{print $5}' | awk -F\} '{print $1}')
                        #echo "Prev Line case ->" $line
                else
                        #same line case
                        Date=$(echo $line | awk -F\{ '{print $4}' | awk -F\} '{print $1}')
                        Time=$(echo $line | awk -F\{ '{print $5}' | awk -F\} '{print $1}')
                        #echo "Same line case->" $line
                fi
                Time=${Time%???}

                echo $line
                #Adding 0 at the starting of millisec parameter if its length is less than 6
                Msec=$(echo $Time | cut -d',' -f4)
                Msec1=""
                Mlen=${#Msec}
                MDiff=$((6-Mlen))
                for((i=0;i<$MDiff;i++));do
                        Msec1=$Msec1"0"
                done
		Msec1=$Msec1$Msec
#               NodeName=$(echo $line | awk -F\{ '{print $6}' | awk -F\, '{print $1}')
                NodeName=$(echo $line | awk -F\{ '{print $2}' | awk -F\, '{print $1}')
                yyy1=$(echo $Date |cut -d',' -f1)
                mmm1=$(echo $Date |cut -d',' -f2)
                ddd1=$(echo $Date |cut -d',' -f3)
                hh1=$(echo $Time | cut -d',' -f1)
                mm1=$(echo $Time |  cut -d',' -f2)
                ss1=$(echo $Time |  cut -d',' -f3)"."$Msec1

                s=$(date -d"$yyy1-$mmm1-$ddd1 $hh1:$mm1:$ss1" +%s%3N)
                echo $s$space$Date$space$Time$space$NodeName$space$Msec1 >> prmn_obj.txt
                echo $s >> object_time.txt
                #sort result1.txt >> res.txt
                s=""
        fi
        prevLine=$line
done < $file

sort object_time.txt >> object_time_final.txt
final_object_created_time=$(cat object_time_final.txt | tail -1)
echo $final_object_created_time
log_create_diff=`expr $final_object_created_time - $close_session`
echo $prmn_resp$space$NE_NAME$space$log_create_diff >> finalfile.txt

