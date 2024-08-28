#!/bin/bash
####################################################################################################
#
# FileName: ciscopmstub.sh
# Author: Malla Goutham
# Description: This script will trigger the swupgrade/brmbackup actions parallelly as per the no.
#              of nodes selected.
# Syntax: 
#     ./ciscopmstub.sh -f <function> -n <No. of nodes> -i <id> -s <client> -r <server> -p <protocol>
# Example: 
#     ./ciscopmstub.sh -f get_pm_counters -n 40 -i 123456 -s 10.141.11.186 -r 10.141.11.187 -p TLS
# Pre-requisite: nodeips.txt file to be present in the script path
# nodeips.txt should have each node details like SIMNAME NODENAME NODEIP PORT COMMUNITY in each row
####################################################################################################

function get_pm_counters ()
{
    `cat nodeips.txt | head -n $NUM_NODES > selectednodes.txt`
    while read -r SIM_NAME NODE_NAME NODE_IP AGENT_PORT COMMUNITY;
    do
        get_pm_counter $NODE_NAME $NODE_IP $AGENT_PORT $COMMUNITY
    done < selectednodes.txt
    parallel_wait
    parallel_status
}

function get_pm_counter ()
{
    LOG_FILE=get_pm_counter_${NODE_NAME}.log
    STATUS_HEADER=get_pm_counter_${NODE_NAME}
    (
    (
        echo "Running the function get_pm_counter_${NODE_NAME}"
        ./ciscopmcounter.sh ${NODE_NAME} ${NODE_IP} ${AGENT_PORT} ${COMMUNITY}
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
                  echo "${parallel_strings[$pid]}:FAIL" >> ciscopmstats.log
                  count=`expr $count + 1`
            else
                  echo "${parallel_strings[$pid]}:PASS" >> ciscopmstats.log
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

function check_args ()
{
    if [[ -z "$FUNCTION" ]]
    then
        echo "ERROR: Must give a function"
        usage_msg
    fi

    if [[ -z "$NUM_NODES" ]]
    then
        echo "ERROR: Must define the number of nodes for test"
        usage_msg
    fi

    if [[ -z "$PROTOCOL" ]]
    then
        echo "ERROR: Must define the protocol"
        usage_msg
    fi

    if [[ -z "$JOB_ID" ]]
    then
        echo "ERROR: Must define the job id"
        usage_msg
    fi

    if [[ -z "$SERVER" ]]
    then
        echo "ERROR: Must specify the ftp server name"
        usage_msg
    fi

    if [[ -z "$NETSIM_SERVER" ]]
    then
        echo "ERROR: Must specify the ftp server name"
        usage_msg
    fi
}

function usage_msg ()
{
    echo "$0 -f <FUNCTION> -n <NUM_NODES> -p <PROTOCOL> -i <JOB_ID> -s <SERVER> -r <NETSIM SERVER>
            FUNCTION - get_pm_counters
            NUM_NODES - Should be less than or equal to the nodes mentioned in nodeips.txt file
            PROTOCOL - SSH/TLS
            JOB_ID - Unique id
            SERVER - Server IP where the current script is present
            NETSIM_SERVER - Server IP where the nodes are present"
    exit 1
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

while getopts ":f:n:i:p:s:r:" arg
do
    case $arg in
    f) FUNCTION="$OPTARG"
    ;;
    n) NUM_NODES="$OPTARG"
    ;;
    p) PROTOCOL="$OPTARG"
    ;;
    i) JOB_ID="$OPTARG"
    ;;
    s) SERVER="$OPTARG"
    ;;
    r) NETSIM_SERVER="$OPTARG"
    ;;
    \?) usage_msg
    exit 1
    ;;
    esac
done

check_args

starttime=`date +%s%3N`

echo "*********Num_nodes=$NUM_NODES**********" >> ciscopmstats.log

COMMAND_RUN="$0 $@"
echo "Running command $COMMAND_RUN"

sh sarcollect.sh $NETSIM_SERVER $JOB_ID
SARPID=`cat sarpid.txt`

$FUNCTION
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

echo "Script execution took $runtime milli seconds for ${NUM_NODES}"
echo "Return code $EXIT_CODE, Script execution took $runtime milli seconds for ${NUM_NODES}" >> total_$FUNCTION.log
