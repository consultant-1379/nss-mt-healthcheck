################################################################################

#Description : Script for SHM Upgrade of BSC Nodes
#Usage : sh.trigger.sh <Num of Nodes>
# sh .trigger.sh 1

################################################################################

function usage()
{
	echo Please Enter the number of nodes 
}


function gsmupgrade ()
{
    `cat nodeips.txt | head -n $NUM_NODES > selectednodes.txt`
    echo "Gsm Upgrade triggered for $NUM_NODES" >> gsmupgradestats.log
    while read -r NODE_NAME NODE_IP;
    do
        gsm_upgrade $NODE_NAME $NODE_IP
    done < selectednodes.txt
    parallel_wait
    parallel_status
}

function gsm_upgrade ()
{
    LOG_FILE=gsm_upgrade_${NODE_NAME}.log
    STATUS_HEADER=gsm_upgrade_${NODE_NAME}
    (
    (
        echo "Running the function gsm_upgrade_${NODE_NAME}"
        sh actionrunner_delete.sh ${NODE_NAME} ${NODE_IP}
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
        return 1
    else
        return 0
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

#Initailizing the variables
parallel_pids=''
results=''
parallel_logs=()
parallel_exitcodes=()
FORMAT_DATE="`date`"

# Removing the old logs
rm -rf software_upgrade*.log
rm -rf upgradestats.log
rm -rf backupstats.log


NUM_NODES=$1
NETSIM_SERVER=10.141.11.223
JOB_ID=`date +%s%3N`

if [ $# -ne 1 ] ; then
    usage
fi
starttime=`date +%s%3N`

echo "*********Num_nodes=$NUM_NODES**********" >> mltnpmstats.log
echo "*********Num_nodes=$NUM_NODES**********" >> usecasestat.log


COMMAND_RUN="$0 $@"
echo "Running command $COMMAND_RUN"

rm -rf /netsim/tn_pm_data/*



sh sarcollect.sh $NETSIM_SERVER $JOB_ID
SARPID=`cat sarpid.txt`

gsmupgrade

#sh generateRequestPrmn.sh
#sh generateResponsePrmn.sh

EXIT_CODE=$?

endtime=`date +%s%3N`

runtime=`expr $endtime - $starttime`

sh sarstop.sh $NETSIM_SERVER $SARPID $JOB_ID $NUM_NODES $runtime

if [[ $EXIT_CODE -ne 0 ]]
then
    echo "Completed function $FUNCTION with some failures at $FORMAT_DATE"
else
    echo "Completed function $FUNCTION at $FORMAT_DATE"
fi
#sh generateRequestPrmn.sh
#sh generateResponsePrmn.sh


echo "Script execution took $runtime milli seconds for ${NUM_NODES}"
echo "Return code $EXIT_CODE, Script execution took $runtime milli seconds for ${NUM_NODES}" >> total_$FUNCTION.log



