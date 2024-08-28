#!/bin/bash
####################################################################################################
#
# FileName: shmstub.sh
# Author: Malla Goutham
# Description: This script will trigger the swupgrade/brmbackup actions parallelly as per the no.
#              of nodes selected.
# Syntax: ./shmstub.sh -f <Function Name> -n <No. of nodes> -i <job id> -s <SERVER> -p <PROTOCOL>
# Example: 1) ./shmstub.sh -f brmbackup -n 140 -i 123456 -s 10.141.11.186 -p TLS
#          2) ./shmstub.sh -f swupgrade -n 140 -i 123456 -s 10.141.11.186 -p TLS
#          3) ./shmstub.sh -f swclean -n 140 -i 123456 -s 10.141.11.186 -p TLS
# Pre-requisite: nodeips.txt - File which contains the node names and ips
#
####################################################################################################

function brmbackup ()
{
    `cat nodeips.txt | head -n $NUM_NODES > selectednodes.txt`
    while read -r NODE_NAME NODE_IP;
    do
        backup $NODE_NAME $NODE_IP $PROTOCOL $JOB_ID $SERVER
    done < selectednodes.txt
    parallel_wait
    parallel_status
    if [[ $? -ne 0 ]]
    then
        endtime=`date +%s%3N`
        runtime=`expr $endtime - $starttime`
        echo "Exiting as there are failures in the softwareupgrade job, script took $runtime seconds "
    exit 1
    fi
}

function backup ()
{
    LOG_FILE=backup_${NODE_NAME}.log
    STATUS_HEADER=backup_${NODE_NAME}
    (
    (
        echo "Running the function backup_${NODE_NAME}"
        ./brmbackup.sh ${NODE_NAME} ${NODE_IP} ${PROTOCOL} ${JOB_ID} ${SERVER}
    ) > $LOG_FILE 2>&1; parallel_finish
    ) & set_parallel_variables
}

function swupgrade ()
{
    `cat nodeips.txt | head -n $NUM_NODES > selectednodes.txt`
    while read -r NODE_NAME NODE_IP;
    do
        software_upgrade $NODE_NAME $NODE_IP $PROTOCOL $JOB_ID $SERVER
    done < selectednodes.txt
    parallel_wait
    parallel_status
    if [[ $? -ne 0 ]]
    then
        endtime=`date +%s%3N`
        runtime=`expr $endtime - $starttime`
        echo "Exiting as there are failures in the softwareupgrade job, script took $runtime seconds "
    exit 1
    fi
}

function software_upgrade ()
{
    LOG_FILE=software_upgrade_${NODE_NAME}.log
    STATUS_HEADER=software_upgrade_${NODE_NAME}
    (
    (
        echo "Running the function software_upgrade_${NODE_NAME}"
        ./swupgrade.sh ${NODE_NAME} ${NODE_IP} ${PROTOCOL} ${JOB_ID} ${SERVER}
    ) > $LOG_FILE 2>&1; parallel_finish
    ) & set_parallel_variables
}

function swclean ()
{
    rm -rf cleanpackage*.log
    while read -r NODE_NAME NODE_IP;
    do
        cleanpackage $NODE_NAME $NODE_IP $PROTOCOL $JOB_ID
    done < nodeips.txt
    parallel_wait
    parallel_status
    if [[ $? -ne 0 ]]
    then
    endtime=`date +%s%3N`
    runtime=`expr $endtime - $starttime`
    echo "Exiting as there are failures in the clean job, script took $runtime seconds "
    exit 1
    fi
}

function cleanpackage ()
{
    LOG_FILE=cleanpackage_${NODE_NAME}.log
    STATUS_HEADER=cleanpackage_${NODE_NAME}
    (
    (
        echo "Running the function cleanpackage_${NODE_NAME}"
        ./swclean.sh ${NODE_NAME} ${NODE_IP} ${PROTOCOL} ${JOB_ID}
    ) > $LOG_FILE 2>&1; parallel_finish
    ) & set_parallel_variables
}

function cleanbackup ()
{
    echo "Running the function cleanbackup"
    ./backupclean.sh ${SERVER}
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
        echo "ERROR: Must specify the server name"
        usage_msg
    fi
}

function usage_msg ()
{
    echo "$0 -f <FUNCTION> -n <NUM_NODES> -p <PROTOCOL> -i <JOB_ID> -s <SERVER>
             FUNCTION - swclean
                        swupgrade
                        brmbackup
            NUM_NODES - Should be less than or equal to the nodes mentioned in nodeips.txt file
            PROTOCOL - SSH/TLS
            JOB_ID - Unique id
            SERVER - Server IP to download upgrade package or export the backup file"
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

# Removing the old logs
rm -rf software_upgrade*.log
rm -rf upgradestats.log
rm -rf backupstats.log
rm -rf /tmp/*backup*.zip


while getopts ":f:n:i:p:s:" arg
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
    \?) usage_msg
    exit 1
    ;;
    esac
done

check_args

starttime=`date +%s%3N`

COMMAND_RUN="$0 $@"
echo "Running command $COMMAND_RUN"

$FUNCTION
EXIT_CODE=$?
if [[ $EXIT_CODE -ne 0 ]]
then
    echo "Completed function $FUNCTION with some failures at $FORMAT_DATE"
else
    rm -rf /tmp/*backup*.zip
    echo "Completed function $FUNCTION at $FORMAT_DATE"
fi

endtime=`date +%s%3N`

runtime=`expr $endtime - $starttime`

echo "Script execution took $runtime milli seconds for ${NUM_NODES}"
echo "Script execution took $runtime milli seconds for ${NUM_NODES}" >> total_$FUNCTION.log
