#########################################################

# DESCRIPTION : This script is to fetch the different types of files of BSC Nodes.

# USAGE : sh trigger.sh <NETSIM_SERVER> <NUM_OF_NODES>
#	  Note:- NETSIM Server is where the nodes are present.
# Pre-Usecase Requirements- <NODE_NAME> <NODE_IP> <FILE_NAME> should be present in a fetcheddata.txt
# To generate fetcheddata.txt trigger extract_details.sh

#########################################################

function multi_pmfilecollection ()
{
 	rm -rf seconds.log max.log dif.log
	final="fetcheddata.txt"
	`sort -R $final | head -n $NF > selectedno.txt`
   	 while read -r NODE_NAME NODE_IP Filename;
    	 do
         pmfilecollection $NODE_NAME $NODE_IP $Filename
         done < selectedno.txt
 	 parallel_wait
         parallel_status

}

function pmfilecollection ()
{
   	LOG_FILE=pmfilecollection_${NODE_NAME}.log
    	STATUS_HEADER=pmfilecollection_${NODE_NAME}
	echo    i entered third function
	echo $LOG_FILE
	echo $STATUS_HEADER
	echo and the exact dile name is-
    echo $Filename1
    (
    (
        echo "Running the function pmfilecollection_${NODE_NAME} ${SIM_NAME} ${NODE_IP}"
        sh actionrunner.sh ${NODE_NAME} ${NODE_IP} ${Filename}
	) > $LOG_FILE 2>&1; parallel_finish
    ) & set_parallel_variables

}

function set_parallel_variables ()
{
    last_pid="$!"
    parallel_pids="$parallel_pids $last_pid"
    parallel_logs[$last_pid]="$LOG_FILE"
    parallel_strings[$last_pid]="$STATUS_HEADER"
    parallel_exitcodes[$last_pid]=999
}

function parallel_finish ()
{
    local PARALLEL_EXIT_CODE=$?
    local output=$(
    echo "|======================================================================|"
    echo "| Start of output for $STATUS_HEADER"
    echo "|======================================================================|"
    cat $LOG_FILE
    echo "|======================================================================|"
    echo "| End of output for $STATUS_HEADER"
    echo "|======================================================================|")
    echo "$output"
    exit $PARALLEL_EXIT_CODE
}

function parallel_wait()
{
    echo "Started the $0 execution at $FORMAT_DATE"
    if [[ "$parallel_pids" != "" ]]
        then
                set $parallel_pids
        fi
    while :; do
            #echo "Processes remaining: $#"
        local pid=""
        for pid in "$@"
        do
            #echo "Checking on $pid"
            shift
            if kill -0 "$pid" 2>/dev/null;
                        then
                # pid is still running
                set -- "$@" "$pid"
            else
                wait "$pid"
                local EXIT_CODE="$?"
                parallel_exit_codes[$pid]=$EXIT_CODE
            fi
        done
            if [[ "$#" == 0 ]]
            then
            break
            fi
            sleep 1
    done
}

function parallel_status ()
{
    if [[ "$parallel_pids" != "" ]]
        then
                set $parallel_pids
        fi
    local pid=""
        local count=0
    for pid in "$@"
    do
            local EXIT_CODE=${parallel_exit_codes[$pid]}
        if [[ $EXIT_CODE -ne 0 ]]
        then
                  echo "${parallel_strings[$pid]}:FAIL"
                  count=`expr $count + 1`
            else
                  echo "${parallel_strings[$pid]}:PASS"
        fi
    done
        if [ $count -ne 0 ]
        then
            echo "Some of the jobs failed for $FUNCTION"
            exit 1
        fi
}

function cleanup ()
{
    SCRIPT_EXIT_CODE=$?
    EXIT_REASON="$1"
    jobs -p | while read line
        do
                killtree $line 9 > /dev/null 2>&1
        done

    if [[ "$EXIT_REASON" != "EXIT" ]]
    then
        echo "ERROR: The script didn't exit by itself, it exited with signal $EXIT_REASON\n"
    fi

    exit
}

function killtree ()
{
    local _pid=$1
    local _sig=${2-TERM}
    for _child in $(ps -o pid --no-headers --ppid ${_pid}); do
        killtree ${_child} ${_sig}
    done
    kill -${_sig} ${_pid} > /dev/null 2>&1
}

parallel_pids=''
results=''
parallel_logs=()
parallel_exitcodes=()
FORMAT_DATE="`date`"

COMMAND_RUN="$0 $@"
echo "Running command $COMMAND_RUN"


# Removing the old logs
rm -rf software_upgrade*.log

if [[ -z "$FUNCTION" ]]
then
        FUNCTION="multi_software_upgrade"
fi



#NUM_NODES=$1

echo "Run for "${NUM_NODES} >> results.txt

starttime=`date +%s%3N`
checkfile="checkfile.txt"
echo the start time of usecase is $starttime >> $checkfile

echo "going into function"

NETSIM_SERVER=$1
NF=$2
Job_id=`date +%s%3n`
sh sarcollect.sh $NETSIM_SERVER $Job_id
SARPID=`cat sarpid.txt`
multi_pmfilecollection


EXIT_CODE=$?

echo the exit code is $EXIT_CODE

echo "CAME SuCESSFULL *********************************************************************"

if [ $EXIT_CODE -ne 0 ]
then
    echo "Completed function $FUNCTION with some failures at $FORMAT_DATE"
else
    echo "Completed function $FUNCTION at $FORMAT_DATE"
fi


endtime=`date +%s%3N`




echo the usecase end time is $endtime >> $checkfile

runtime=`expr $endtime - $starttime`

sh sarstop.sh $NETSIM_SERVER $SARPID $Job_id $NUM_NODES $runtime
echo "Script execution took $runtime milli seconds" >> results.txt

script_start=`cat seconds.log | awk '{print $2}' | awk -F":::" '{print $1}'| sort | head -1`
script_end=`cat seconds.log | awk '{print $8}' | awk -F":::" '{print $1}'| sort | tail -1`
Diff=`expr $script_end - $script_start`
echo =====================================================================
echo the use case start time is $starttime
echo the script-start time is $script_start
echo the script end time is $script_end
echo the diff is $Diff

echo =====================================================================


echo "Total file transfer time $Diff for $NUM_NODES files" >> results.txt

Request_end=`cat seconds.log | awk '{print $2}' | awk -F":::" '{print $1}'| sort | tail -1`
spawn_time=`expr $Request_end - $script_start`
echo "Request spawnned in $spawn_time  milliseconds" >> results.txt

echo ================================================
echo the request end time is $Request_end
echo the spawn time is $spawn_time



start_plus_one=`expr $script_start + 1000`

echo the first script start time is $start_plus_one
list_end_time=`cat seconds.log | awk '{print $8}' | awk -F":::" '{print $1}'| sort`
list_start_time=`cat seconds.log | awk '{print $2}' | awk -F":::" '{print $1}'| sort`
echo the ========================= list end time is $list_end_time


p="p.txt"
rm -rf $p

nodelist=`cat seconds.log | awk '{print $1}'`
echo $nodelist >> $p
fname=`cat seconds.log | awk '{print $15}'`
#echo $list_start_time >> $r
#echo $list_end_time >> $r

count=0
cou=0
r="r.txt"
rm -rf $r

echo $list_start_time >> $r
echo $list_end_time >> $r


echo The first time fetching time is $script_start and time check in one sec $start_plus_one >> $r
for i in $list_end_time
do
difference=`expr $i - $script_start`
echo the individual start to check is $script_start and end is $i and diff is $difference >> $r
if [[ $difference -le 60000 ]]
then
cou=`expr $cou + 1`
fi
done
echo $fname >> $r


for i in $list_end_time
do
echo the individual script end time is $i and the script start time is $start_plus_one
if [[ $i -lt $start_plus_one ]]
then
break
else
count=`expr $count + 1`
fi
done
echo "---------------------------------------------" >> results.txt
echo "Total files transfered in one second = $count" >> results.txt
echo "---------------------------------------------" >> results.txt
echo "$(cat finalFile.txt) $NUM_NODES $Diff $count" > finalFile.txt
cat results.txt | tail -12
# For debugging comment below lines
#rm -rf seconds.log
#rm -rf pmfilecollection_*


echo total passed in 1 min is $cou



