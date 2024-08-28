#!/bin/bash

function findFilename()
{
# To find the filename dynamically
	tempFile="tempfile.txt"
		tempoutFile="tempoutFile.txt"

		rm -rf $tempFile
		rm -rf $tempoutFile

		echo ".open "$SIM_NAME >> $tempFile
		echo ".select "$NODE_NAME >> $tempFile
		echo ".show fs" >> $tempFile
		~/inst/netsim_shell < $tempFile | tee -a $tempoutFile
		fileStore=$(cat $tempoutFile | tail -3 | head -1 | awk '{print $2}')
		fileStore=$fileStore"/c/pm_data"
		echo "fs path - " $fileStore

		Filename=$(ls -lrth $fileStore | tail -2 | head -1 | awk '{print $9}')
		echo $Filename
		rm -rf $tempFile
		rm -rf $tempoutFile

}


function multi_pmfilecollection ()
{
    rm -rf seconds.log max.log dif.log
    `sort -R nodeips.txt | head -n ${NUM_NODES} > selectednodes.txt`     # To randominze node selection
    sarLogFile="/netsim/sarlog.log"
	sh cpuUsage.sh
	fl=0 
   while read -r NODE_NAME NODE_IP SIM_NAME;
    do
	SIM_NAME=$(echo $SIM_NAME | cut -d "/" -f 4)
	echo $SIM_NAME
	if [[ $fl -ne 1 ]];then
    		findFilename
	fi
	fl=1
        pmfilecollection $NODE_NAME $NODE_IP $Filename
    done < selectednodes.txt
    parallel_wait
    parallel_status
    if [[ $? -ne 0 ]]
    then    
	endtime=`date +%s%3N`
	runtime=`expr $endtime - $starttime`
	echo "Exiting as there are failures in the clean job, script took $runtime seconds "
        exit 1
    fi
	wait
 	sh calculateIdle.sh ${sarLogFile}
	sh killProcess.sh
	rm -rf $sarLogFile
	rm -rf max.log dif.log

}

function pmfilecollection ()
{
    LOG_FILE=pmfilecollection_${NODE_NAME}.log
    STATUS_HEADER=pmfilecollection_${NODE_NAME}
#    Ext=`echo ${Filename}| awk -F\. '{print $NF}'`
	Ext="xml.gz"
    Filename1=`echo ${Filename}| cut -d"_" -f1`"_${NODE_NAME}.${Ext}"
    echo $Filename1
    (
    (
        echo "Running the function pmfilecollection_${NODE_NAME} ${SIM_NAME}"
        sh actionrunner.sh ${NODE_NAME} ${NODE_IP} ${Filename1}
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

trap "cleanup INT" INT
trap "cleanup QUIT" QUIT
trap "cleanup EXIT" EXIT
trap "cleanup TERM" TERM
trap "cleanup INT" KILL
trap "cleanup HUP" HUP

parallel_pids=''
results=''
parallel_logs=()
parallel_exitcodes=()
FORMAT_DATE="`date`"

while getopts ":f:n:" arg
do
    case $arg in
	f) FUNCTION="$OPTARG"
	;;
	n) NUM_NODES="$OPTARG"
	;;
        \?) usage_msg
	exit 1
	;;
    esac
done

echo "Run for "${NUM_NODES} >> results.txt

COMMAND_RUN="$0 $@"
echo "Running command $COMMAND_RUN"


# Removing the old logs
rm -rf software_upgrade*.log

if [[ -z "$FUNCTION" ]]
then
	FUNCTION="multi_software_upgrade"
fi

starttime=`date +%s%3N`

$FUNCTION
EXIT_CODE=$?
if [[ $EXIT_CODE -ne 0 ]]
then
    echo "Completed function $FUNCTION with some failures at $FORMAT_DATE"
lse
    echo "Completed function $FUNCTION at $FORMAT_DATE"
fi

endtime=`date +%s%3N`

runtime=`expr $endtime - $starttime`

echo "Script execution took $runtime milli seconds" >> results.txt

script_start=`cat seconds.log | awk '{print $2}' | awk -F":::" '{print $1}'| sort | head -1`
script_end=`cat seconds.log | awk '{print $8}' | awk -F":::" '{print $1}'| sort | tail -1`
Diff=`expr $script_end - $script_start`
echo "Total file transfer time $Diff for $NUM_NODES files" >> results.txt

Request_end=`cat seconds.log | awk '{print $2}' | awk -F":::" '{print $1}'| sort | tail -1`
spawn_time=`expr $Request_end - $script_start`
echo "Request spawnned in $spawn_time  milliseconds" >> results.txt

start_plus_one=`expr $script_start + 1000`
list_end_time=`cat seconds.log | awk '{print $8}' | awk -F":::" '{print $1}'| sort`
count=0
for i in $list_end_time
do
if [[ $i -gt $start_plus_one ]]
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
rm -rf seconds.log
rm -rf pmfilecollection_*
