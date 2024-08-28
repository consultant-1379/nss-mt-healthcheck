#remove all the previous netsimprmn files

rm -rf /netsim/inst/netsimprmn/*

netsimprmnFile="netsimprmn.txt"


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
#To directly connect to netsimprmn
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

beam="platf_indep_otp/.*/erts-*.[^/]*/bin/beam"
cookie=`$ps auxww | grep -v grep | grep $beam | grep -v logtool | grep -v relay | grep -v scep_server | grep -v ^root | head -1 | sed 's,.*\(-setcookie [^ ]*\).*$,\1,'`
kernel=`$ps auxww | grep -v grep | grep $beam | grep -v logtool | grep -v relay | grep -v scep_server | grep -v ^root | head -1 | sed 's,.*\(-kernel net_ticktime [^ ]* -kernel net_setuptime [^ ]*\).*$,\1,'`

process="netsimprmn"
cd "$SIMROOT"



#--------------------------------------------------------------------------------------------------



/usr/bin/expect << EOF
set timeout -1
spawn platf_indep_otp/$platform/bin/erl -sname ${process}_kliens $cookie $kernel -remsh ${process}@`$hostname`
expect "netsimprmn@"
send "request_counter:get_last_hour_counts({$startTime},{$endTime}).\r"
expect "2>"
EOF

#copy the generated netsimprmn file to the alarmburst script path
cp /netsim/inst/netsimprmn/*.log ./requestPrmn

