#!/bin/bash

rm -rf ~/inst/prmnresponse/*

prmnresponseFile="prmnresponse.txt"

currDir=$(pwd)

#Start Time
#TRy not to take everything seperately or dont run this script after time 23:55.

startEpoch=$(date +%s)
endEpoch=$((startEpoch+3600))
endDT=$(date -d @$endEpoch)
echo "------------------> $endDT"
currHour=$(echo `date +%H` | sed 's/^0*//')
currYear=$(echo `date +%Y` | sed 's/^0*//')
currMonth=$(echo `date +%m` | sed 's/^0*//')
currDate=$(echo `date +%d` | sed 's/^0*//')

endHour=$(date -d "$(echo $endDT)" +"%H" |  sed 's/^0*//')
endYear=$(date -d "$(echo $endDT)" +"%Y" |  sed 's/^0*//')
endMonth=$(date -d "$(echo $endDT)" +"%m" |  sed 's/^0*//')
endDate=$(date -d "$(echo $endDT)" +"%d" |  sed 's/^0*//')

echo "----------------------------> $endHour $endYear $endMonth $endDate"

startTime=$currYear","$currMonth","$currDate","$currHour

#Endtime
#handle when the time is 23 hrs(so 23 +1 =24 i.e 00 or 24?)
endTime=$endYear","$endMonth","$endDate","$endHour

#----------------------------------------------------------------------------------------------
#To directly connect to prmnresponse
#----------------------------------------------------------------------------------------------
SIMROOT=/netsim/inst

cd $SIMROOT
. $SIMROOT/architectures.sh

platform=$ERLARCH
case $ERLARCH in
    solaris2)
        ps=/usr/ucb/ps
        ;;
    *) # Linux
        ps=/bin/ps
        ;;
esac
platform=linux
#beam="platf_indep_otp/linux/erts-*.[^/]*/bin/beam"
#cookie="-setcookie NETSim/netsim/R31B"
#kernel="-kernel net_ticktime 300 -kernel net_setuptime 100 -kernel inet_dist_listen_min 25000 -kernel inet_dist_listen_max 26000"
beam="platf_indep_otp/suse11/erts-*.[^/]*/bin/beam"
cookie=`$ps auxww | grep -v grep | grep $beam | grep -v logtool | grep -v relay | grep -v scep_server | grep -v ^root | head -1 | sed 's,.*\(-setcookie [^ ]*\).*$,\1,'`
kernel=`$ps auxww | grep -v grep | grep $beam | grep -v logtool | grep -v relay | grep -v scep_server | grep -v ^root | head -1 | sed 's,.*\(-kernel net_ticktime [^ ]* -kernel net_setuptime [^ ]*\).*$,\1,'`


process="prmnresponse"
cd "$SIMROOT"

#--------------------------------------------------------------------------------------------------

/usr/bin/expect << EOF
set timeout -1
spawn platf_indep_otp/$platform/bin/erl -sname ${process}_kliens $cookie $kernel -remsh ${process}@`$hostname`
expect "prmnresponse@"
send "response_handler:log_responses({$startTime},{$endTime}).\r"
expect "2>"
EOF

#copy the generated prmnresponse file to the alarmburst script path
cp ~/inst/prmnresponse/*.resp $currDir
