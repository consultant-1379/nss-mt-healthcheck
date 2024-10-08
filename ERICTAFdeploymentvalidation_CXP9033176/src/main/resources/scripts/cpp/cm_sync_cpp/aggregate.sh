if [[ $# -ne 5 ]]; then
 echo 'USAGE: sh aggreagate.sh <NE> <Requests> <Responses> <MO Count> <JobID>'
 exit 1
fi
	NE=$1
	cat $2 | grep "${NE}\"" > ${NE}_req
        cat $3 | grep "${NE}\"" > ${NE}_resp
        MO=$4
	JobId=$5

	nolreq=`wc -l "${NE}_req"| awk '{print $1}'`
        nolresp=`wc -l "${NE}_resp"| awk '{print $1}'`
      
        if ((nolreq!=nolresp)); then
		echo "No.of request not equal to No.of responses for "${NE}
		# continue
		exit 1
	fi
	
	total=0
	while read -r -u 4 ReqLine && read -r -u 5 RespLine; do
    

    t2sec=$(echo $ReqLine | awk '{print $1}') 
    t1sec=$(echo $RespLine | awk '{print $1}')
    
    diff=$((t1sec-t2sec))

#	echo $t2sec" "$t1sec" "$diff 

    total=$((total+diff))

done 4<"${NE}_req" 5<"${NE}_resp"
    rm -f ${NE}_req
    rm -f ${NE}_resp
    total1=`awk "BEGIN {print (${total}/1000000)}"`
    echo $total1
    MORate=`awk "BEGIN {print (${MO}/${total1})}"`
    echo $MORate
    echo $NE","$MO","$total","$MORate >> ${JobId}.csv
