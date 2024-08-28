#!/bin/bash

INSTPATH=/netsim/inst
#INSTPATH=/proj/netsimproj/xchayam/R30F1

Filename=$3
NENAME=$1
Nodeip=$2
Filename2=$4

echo " ***************  akljflajfaklf;  *************** In Action Runner :"$Filename
Initialtime=`date +%s%3N`
Var1=`expr $Initialtime / 1000`
Quot=`date -d @$Var1`
Rem=`expr $Initialtime % 1000`
#FinalQuot1=`echo $Quot | cut -d" " f4`
#echo quot $Quot
#echo rem $Rem


if [[ $Filename2 == *"OSS"* ]]; then

ssh-keygen -R $Nodeip
/usr/bin/expect  << EOF

set timeout -1

spawn sftp  -o "stricthostkeychecking=no" -oPort=22 netsim@$Nodeip
expect "password:"
send "netsim\n"
expect "sftp>"
send "ls\n"
expect "sftp>"
send "cd data_transfer/destinations/$Filename2/Ready\n"
expect "sftp>"
send "ls\n"
expect "sftp>"
send "get $Filename\n"
expect "sftp"
send "bye\n"
EOF
 
wait 
else
ssh-keygen -R $Nodeip
/usr/bin/expect  << EOF

set timeout -1

spawn sftp  -o "stricthostkeychecking=no" -oPort=22 netsim@$Nodeip
expect "password:"
send "netsim\n"
expect "sftp>"
send "ls\n"
expect "sftp>"
send "cd data_transfer/destinations/CDHDEFAULT/Ready/$Filename2\n"
expect "sftp>"
send "ls\n"
expect "sftp>"
send "get $Filename\n"
expect "sftp"
send "bye\n"
EOF

fi

echo +=+=+======== i succesfully executed i think ================


Endtime=`date +%s%3N`
checkfile="checkfile.txt"
echo The end time of corresponding $Endtime >> $checkfile
 
Var2=`expr $Endtime / 1000`
Quot2=`date -d @$Var2`
Rem2=`expr $Endtime % 1000`
#FinalQuot2=`echo $Quot2 | cut -d" " f4`

Diff=`expr $Endtime - $Initialtime`
mytempfile="mytempfile.txt"
truncate -s 0 $mytempfile
echo The initial time is $Initialtime >> $mytempfile
echo The Var1 is $Var1 >> $mytempfile
echo The Qout1 is $Quot >> $mytempfile
echo TheRem1 is $Rem >> $mytempfile
echo The endtime  $Endtime >> $mytempfile
echo The Var2 is $Var2 >> $mytempfile
echo The Quot2 is  $Quot2 >> $mytempfile
echo The Rem2 is $Rem2 >> $mytempfile 
echo The diff is $Diff >> $mytempfile

#sh newvalues.sh $NENAME $Starttime $Quot.$Rem  $Endtime  $Quot2 $Rem2 $Diff
echo -e "$NENAME  $Initialtime:::($Quot.$Rem)     $Endtime:::($Quot2.$Rem2)     $Diff    $Filename"  >> seconds.log
echo -e "$Diff" >> dif.log


sort -nr dif.log >> max.log


#time /usr/bin/expect < run | grep real

#echo "$NeName $Time" >> time.log

#rm -rf pmnodeiplist.txt
#rm -rf nodenameandip.txt
