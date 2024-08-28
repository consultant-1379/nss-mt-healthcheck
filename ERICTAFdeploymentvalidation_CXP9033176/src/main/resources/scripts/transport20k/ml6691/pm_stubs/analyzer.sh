#!/bin/bash

usage(){
    echo "----------------------------------------------------------------------"
    echo "$0 <number of nodes>"
    echo "----------------------------------------------------------------------"
    exit 1
}

if [[ $# -ne 1 ]];then
    usage
fi

if [ ! -f nodeips.txt ]; then
    echo "nodeips.txt file is missing"
    exit 1
fi

sh extractor.sh

cat nodeips.txt | head -n $1 > nodes.txt

echo "Total Number of nodes: $1"  >> finallog.txt
while read -r line; do
        NE=$(echo $line | awk '{print $2}')
	cat request.txt | grep -w $NE > $NE.request
        cat response.txt | grep -w $NE > $NE.response
        cat $NE.request | sort -k6 > sort.req
        cat $NE.response | sort -k6 > sort.res
        paste -d" " sort.req sort.res > final.txt
        cat final.txt | awk -v var1=$NE 'var2=$7-$1 {sum += var2} END {printf("Node:%s TotalTime:%d\n",var1,sum)}' >> finallog.txt
      # rm -rf $NE.request
      # rm -rf $NE.response
done < nodes.txt

printf "\nAnalysis completed\n"
