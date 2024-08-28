age(){
    echo "----------------------------------------------------------------------"
    echo "$0 filename output_filename"
    echo "----------------------------------------------------------------------"
    exit 1
}

echo hey inside extract_net.sh

if [[ $# -ne 3 ]];then
    usage
fi

#format - time message-id node-name
file=$1
result=$2

echo heyyyyyyyyy

echo $file and $result
#delete generated files
rm -rf $result
rm -rf result1.txt
#rm -rf res.txt

s=""
zero=0
space=" "
Six=6
NE_NAME=$3

while read -r line 
do
	echo kakdadj
	# if alarm_event is in the same lines as timestamp then take that line otherwise take previous line based on (if alarm_event is 2nd arg of line)
	if [[ $line == *"\"$NE_NAME\",netconf_lang,\"edit-config\""* ]];then
		echo $line
			#lineContains=$(echo $line)
		lineContains=$(echo $line | awk -F\{ '{print $2}')
		if [[ $lineContains == *"$NE_NAME\",netconf_lang,\"edit-config\""* ]];then
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
		echo $yyy1 $mm1 $ddd1 $hh1 $mm1 $ss1
		echo hey
		s=$(date -d"$yyy1-$mmm1-$ddd1 $hh1:$mm1:$ss1" +%s%3N)
	        echo bye
		echo $s$space$Date$space$Time$space$NodeName$space$Msec1 >> nesim_result.txt 
	        echo $s >> result1.txt
		#sort result1.txt >> res.txt
		s=""
        fi
	prevLine=$line
done < $file
echo $s >> result1.txt

#sort result1.txt >> res.txt

netsim_resp_time=$(cat result1.txt | head -1)

echo $netsim_resp_time
echo $netsim_resp_time$space$NE_NAME >> finalfile.txt





while read -r line 
do
        echo kakdadj
        # if alarm_event is in the same lines as timestamp then take that line otherwise take previous line based on (if alarm_event is 2nd arg of line)
        if [[ $line == *"\"$NE_NAME\",netconf_lang,\"close-session\""* ]];then
                echo $line
                        #lineContains=$(echo $line)
                lineContains=$(echo $line | awk -F\{ '{print $2}')
                if [[ $lineContains == *"$NE_NAME\",netconf_lang,\"close-session\""* ]];then
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
                echo $yyy1 $mm1 $ddd1 $hh1 $mm1 $ss1
                echo hey
                s=$(date -d"$yyy1-$mmm1-$ddd1 $hh1:$mm1:$ss1" +%s%3N)
                echo bye
                #echo $s$space$Date$space$Time$space$NodeName$space$Msec1 >> nesim_result.txt
                #echo $s >> result1.txt
                #sort result1.txt >> res.txt
		close_session=$s
                s=""
        fi
        prevLine=$line
done < $file
rm -rf caltime.txt
echo $netsim_resp_time $close_session >> caltime.txt

#echo $s >> result1.txt
#sort result1.txt >> res.txt

