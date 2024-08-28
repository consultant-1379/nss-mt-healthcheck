#!/bin/sh
FILE=$1
NumOfLines=`cat $FILE | wc -l`
FirstValue=`awk '{if(NR==1) print $0}' $FILE`
COUNT=2
Value=()
while [ "$COUNT" -le "$NumOfLines" ]
do
 NextValue=`awk '{if(NR=='$COUNT') print $0}' $FILE`
 if [ "$NextValue" -le "$FirstValue" ]
 then
   Value+=($NextValue)
 fi
COUNT=`expr $COUNT + 1`
done
NumOfValues=${#Value[@]}
echo "Nodes Passed: $NumOfValues"
echo -n " Nodes passed: $NumOfValues " >> stats.job
