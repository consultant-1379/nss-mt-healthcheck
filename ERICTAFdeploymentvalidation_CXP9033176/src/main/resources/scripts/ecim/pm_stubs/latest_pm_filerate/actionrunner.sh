#!/bin/bash

INSTPATH=/netsim/inst
#INSTPATH=/proj/netsimproj/xchayam/R30F1

Filename=$3
NENAME=$1
Nodeip=$2

echo " ***************  Running actionrunner  *************** In Action Runner :"$Filename
Initialtime=`date +%s%3N`
Var1=`expr $Initialtime / 1000`
Quot=`date -d @$Var1`
Rem=`expr $Initialtime % 1000`
#FinalQuot1=`echo $Quot | cut -d" " f4`
#echo quot $Quot
#echo rem $Rem
/usr/bin/expect  << EOF

set timeout 100

spawn sftp  -o "stricthostkeychecking=no" -oPort=22 netsim@$Nodeip
expect "password:"
send "netsim\n"
expect "sft"
send "ls\n"
expect "sft"
send "cd c/pm_data/LTE03\n"
expect "sft"
send "ls\n"
expect "sft"
send "lmkdir $NENAME\n"
expect "sft"
send "get $Filename $NENAME\n"
expect "sftp"
send "bye\n"
EOF

wait


Endtime=`date +%s%3N`

Var2=`expr $Endtime / 1000`
Quot2=`date -d @$Var2`
Rem2=`expr $Endtime % 1000`
#FinalQuot2=`echo $Quot2 | cut -d" " f4`

Diff=`expr $Endtime - $Initialtime`

#sh newvalues.sh $NENAME $Starttime $Quot.$Rem  $Endtime  $Quot2 $Rem2 $Diff
echo -e "$NENAME  $Initialtime:::($Quot.$Rem)     $Endtime:::($Quot2.$Rem2)     $Diff"  >> seconds.log
echo -e "$Diff" >> dif.log


sort -nr dif.log >> max.log


#time /usr/bin/expect < run | grep real

#echo "$NeName $Time" >> time.log

#rm -rf pmnodeiplist.txt
#rm -rf nodenameandip.txt
