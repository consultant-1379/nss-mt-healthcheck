 #!/bin/bash

 ##################################################################################################
 # Description : Generates prmnrequest and prmnresponse and calculates the MO rate for all nodes.
 # NOTE: The statistics will be stored in jobs.csv
 ###################################################################################################


     if [[ $# -ne 1 ]]
     then
        echo "Invalid inputs "
        echo "run as    sh  $0 <NUM_NODES> "
        exit
    fi

    sh generateRequestPrmn.sh
     sh generateResponsePrmn.sh
    PRMN_REQUEST="/netsim/inst/netsimprmn/"$(ls -Art /netsim/inst/netsimprmn | tail -n 2 | grep .log)
    PRMN_RESPONSE="/netsim/inst/prmnresponse/"$(ls -Art /netsim/inst/prmnresponse | tail -n 2 | grep .resp)

    REQUEST_FILE="request.txt"
    RESPONSE_FILE="response1.txt"
    sh extractrequest.sh ${PRMN_REQUEST} ${REQUEST_FILE}
    sh extractresponse.sh ${PRMN_RESPONSE} ${RESPONSE_FILE}

	#echo $REQUEST_FILE
	#cat request.txt
    cat response1.txt | sort -k1 > responsenew.txt

    JobId=$1
    jobFile=$JobId.job
   for i in `cat $jobFile|awk '{print $1}'`; do  cat responsenew.txt| grep $i |awk -v p=$i -v n="3" '$0~p{i++}i==n' ;done > response.txt
    startTime=99999999999999
    endTime=0
	echo "########################## $JobId nodes ##############################" >> jobs.csv
    echo "NE,StartTime,EndTime,TotalTime,MO Count,MORate" >> jobs.csv
	fc=0
    while read -r line;do
        echo $line
        NE=$(echo $line | awk '{print $1}')
        echo $NE
        MOCount=$(echo $line | awk '{print $4}')
    # Calculate Time Taken

    StartLine=$(grep ${NE} request.txt)
    echo "startline"
	echo start line $StartLine
    EndLine=$(grep ${NE} response.txt)
    echo end line: $EndLine
    yyy1=$(echo $StartLine | awk '{print $2}' | cut -d',' -f1)
    mmm1=$(echo $StartLine | awk '{print $2}' | cut -d',' -f2)
    ddd1=$(echo $StartLine | awk '{print $2}' | cut -d',' -f3)
    hh1=$(echo $StartLine | awk '{print $3}' | cut -d',' -f1)
    mm1=$(echo $StartLine | awk '{print $3}' | cut -d',' -f2)
    ss1=$(echo $StartLine | awk '{print $3}' | cut -d',' -f3)
    milli1=$(echo $StartLine | awk '{print $3}' | cut -d',' -f4)


    yyy2=$(echo $EndLine | awk '{print $2}' | cut -d',' -f1)
    mmm2=$(echo $EndLine | awk '{print $2}' | cut -d',' -f2)
    ddd2=$(echo $EndLine | awk '{print $2}' | cut -d',' -f3)
    hh2=$(echo $EndLine | awk '{print $3}' | cut -d',' -f1)
    mm2=$(echo $EndLine | awk '{print $3}' | cut -d',' -f2)
    ss2=$(echo $EndLine | awk '{print $3}' | cut -d',' -f3)
    milli2=$(echo $EndLine | awk '{print $3}'| cut -d',' -f4)
	echo millies : $milli2 $milli1

    t2sec=$(date -d"$yyy2-$mmm2-$ddd2 $hh2:$mm2:$ss2" +%s%3N)
    t1sec=$(date -d"$yyy1-$mmm1-$ddd1 $hh1:$mm1:$ss1" +%s%3N)
    if [[ $t2sec > $endTime ]];then
        endTime=$t2sec
    fi
    if [[ $t1sec < $startTime ]];then
        startTime=$t1sec
    fi
echo t2sec: $t2sec and t1sec: $t1sec
    diff=$((t2sec-t1sec))
   echo $diff is diff
    # Calculate MORate
    MORate=$((MOCount*1000/diff))
	echo "morate is" $MORate
	if [[ $MORate -lt 42 ]]
	then
		echo $NE "--> FAIL " >> res.txt
		fc=$((fc+1))
	else
		echo $NE "--> PASS " >> res.txt
	fi

    echo $NE","$(echo $StartLine | cut -d" " -f2,3)","$(echo $EndLine | cut -d" " -f2,3)","$diff","$MOCount","$MORate >> jobs.csv
    echo "startTime ---- $startTime endTime ---$endTime"
done<$jobFile
cat res.txt
rm -rf res.txt
echo $fc nodes failed among $JobId nodes
#	`cp /netsim/sarlog.log /netsim/pidFile.txt .`
#	sarLogFile="sarlog.log"
#	echo "calculateCPU.sh $sarLogFile $startTime $endTime"
    #sh calculateCPU.sh $sarLogFile "${startTime}" "${endTime}"
