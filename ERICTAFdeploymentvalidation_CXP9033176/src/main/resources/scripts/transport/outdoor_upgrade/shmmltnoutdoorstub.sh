#!/bin/bash
####################################################################################################
#
# FileName: shmcppstub.sh
# Author: Malla Goutham
# Description: This script will trigger the swupgrade/brmbackup actions parallelly as per the no.
#              of nodes selected.
# Syntax: ./shmmltnoutdoorstub.sh -f <Function Name> -n <No. of nodes> -i <job id> -p <PROTOCOL> -s <SERVER> -r <NETSIM_SERVER>
# Example: 1) ./shmcppstub.sh -f swupgrade -n 140 -i 123456 -p TLS -s 10.141.11.186 -r 10.141.11.185
# Pre-requisite: nodeips.txt - File which contains the node names and ips
#
####################################################################################################

function swupgrade ()
{
    `cat nodeips.txt | head -n $NUM_NODES > selectednodes.txt`
    while read -r NODE_NAME NODE_IP;
    do
        sw_upgrade_single $NODE_NAME $NODE_IP
    done < selectednodes.txt
    parallel_wait
    parallel_status
}

function sw_upgrade_single ()
{
    LOG_FILE=sw_upgrade_single_${NODE_NAME}.log
    STATUS_HEADER=sw_upgrade_single_${NODE_NAME}
    (
    (
        echo "Running the function sw_upgrade_single_${NODE_NAME}"
        ./upgrade.sh ${NODE_NAME} ${NODE_IP}
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
                  echo "${parallel_strings[$pid]}:FAIL" >> fail.txt
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
             FUNCTION - amos
                        amos_ssh
                        amos_combined
                        swupgrade
                        brmbackup
            NUM_NODES - Should be less than or equal to the nodes mentioned in nodeips.txt file
            PROTOCOL - SSH/TLS
            JOB_ID - Unique id
            SERVER - Server IP to download upgrade package or export the backup file
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

# Removing the old logs
rm -rf software_upgrade*.log
rm -rf upgradestats.log
rm -rf backupstats.log
rm -rf /tmp/*backup*.zip
rm -rf fail.txt

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

COMMAND_RUN="$0 $@"
echo "Running command $COMMAND_RUN"

sh sarcollect.sh $NETSIM_SERVER $JOB_ID
SARPID=`cat sarpid.txt`

$FUNCTION
EXIT_CODE=$?

endtime=`date +%s%3N`

runtime=`expr $endtime - $starttime`

sh sarstop.sh $NETSIM_SERVER $SARPID $JOB_ID $NUM_NODES $runtime

rm -rf /netsim/tn_pm_data/*
rm -rf /netsim/tn_backup_configuration/*

if [[ $EXIT_CODE -ne 0 ]]
then
    echo "Completed function $FUNCTION with some failures at $FORMAT_DATE"
else
    echo "Completed function $FUNCTION at $FORMAT_DATE"
fi

echo "Script execution took $runtime milli seconds for ${NUM_NODES}"
echo "Return code $EXIT_CODE, Script execution took $runtime milli seconds for ${NUM_NODES}" >> total_$FUNCTION.log
