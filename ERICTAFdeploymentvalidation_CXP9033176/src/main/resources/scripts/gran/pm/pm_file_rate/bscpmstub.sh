#!/bin/bash
####################################################################################################
#
# FileName: shmcppstub.sh
# Author: Malla Goutham
# Description: This script will trigger the swupgrade/brmbackup actions parallelly as per the no.
#              of nodes selected.
# Syntax: ./shmcppstub.sh -f <Function Name> -n <No. of nodes> -i <job id> -s <SERVER> -p <PROTOCOL>
# Example: 1) ./shmcppstub.sh -f brmbackup -n 140 -i 123456 -s 10.141.11.186 -p TLS
#          2) ./shmcppstub.sh -f swupgrade -n 140 -i 123456 -s 10.141.11.186 -p TLS
#          3) ./shmcppstub.sh -f swclean -n 140 -i 123456 -s 10.141.11.186 -p TLS
# Pre-requisite: nodeips.txt - File which contains the node names and ips
#
####################################################################################################

function brmbackup ()
{
    `cat nodeips.txt | head -n $NUM_NODES > selectednodes.txt`
    while read -r SIM_NAME NODE_NAME NODE_IP AGENT_PORT COMMUNITY;
    do
        backup $NODE_NAME $NODE_IP $AGENT_PORT $COMMUNITY $JOB_ID
    done < selectednodes.txt
    parallel_wait
    parallel_status
}

function backup ()
{
    LOG_FILE=backup_${NODE_NAME}.log
    STATUS_HEADER=backup_${NODE_NAME}
    (
    (
        echo "Running the function backup_${NODE_NAME}"
        ./mltn_backup.sh $NODE_NAME $NODE_IP $AGENT_PORT $COMMUNITY $JOB_ID
    ) > $LOG_FILE 2>&1; parallel_finish
    ) & set_parallel_variables
}

function bscpm ()
{
    `cat nodeips.txt | head -n $NUM_NODES > selectednodes.txt`
    while read -r NODE_NAME NODE_IP;
    do
        bscpmsingle $NODE_NAME $NODE_IP
    done < selectednodes.txt
    parallel_wait
    parallel_status
}

function bscpmsingle ()
{
    LOG_FILE=backup_${NODE_NAME}.log
    STATUS_HEADER=backup_${NODE_NAME}
    (
    (
        echo "Running the function backup_${NODE_NAME}"
        ./bscpm.sh $NODE_NAME $NODE_IP
    ) > $LOG_FILE 2>&1; parallel_finish
    ) & set_parallel_variables
}

function sblupgrade ()
{
    `cat nodeips.txt | head -n $NUM_NODES > selectednodes.txt`
    echo "Sbl Upgrade triggered for $NUM_NODES" >> sblupgradestats.log
    while read -r SIM_NAME NODE_NAME NODE_IP AGENT_PORT COMMUNITY;
    do
        software_upgrade_sbl $NODE_NAME $NODE_IP $AGENT_PORT $COMMUNITY
    done < selectednodes.txt
    parallel_wait
    parallel_status
}

function software_upgrade_sbl ()
{
    LOG_FILE=software_upgrade_sbl_${NODE_NAME}.log
    STATUS_HEADER=software_upgrade_sbl_${NODE_NAME}
    (
    (
        echo "Running the function software_upgrade_sbl_${NODE_NAME}"
        ./mltnshm_sbl.sh ${NODE_NAME} ${NODE_IP} ${AGENT_PORT} ${COMMUNITY}
    ) > $LOG_FILE 2>&1; parallel_finish
    ) & set_parallel_variables
}

function manualupgrade ()
{
    `cat nodeips.txt | head -n $NUM_NODES > selectednodes.txt`
    while read -r SIM_NAME NODE_NAME NODE_IP AGENT_PORT COMMUNITY;
    do
        software_upgrade_rau $NODE_NAME $NODE_IP $AGENT_PORT $COMMUNITY
    done < selectednodes.txt
    parallel_wait
    parallel_status
}

function software_upgrade_rau ()
{
    LOG_FILE=software_upgrade_rau_${NODE_NAME}.log
    STATUS_HEADER=software_upgrade_rau_${NODE_NAME}
    (
    (
        echo "Running the function software_upgrade_rau_${NODE_NAME}"
        ./mltnshm_rau.sh ${NODE_NAME} ${NODE_IP} ${AGENT_PORT} ${COMMUNITY}
    ) > $LOG_FILE 2>&1; parallel_finish
    ) & set_parallel_variables
}

function get_pm_files ()
{
    `cat nodeips.txt | head -n $NUM_NODES > selectednodes.txt`
    while read -r SIM_NAME NODE_NAME NODE_IP AGENT_PORT COMMUNITY;
    do
        get_pm_file $NODE_NAME $NODE_IP $AGENT_PORT $COMMUNITY
    done < selectednodes.txt
    parallel_wait
    parallel_status
}

function get_pm_file ()
{
    LOG_FILE=get_pm_file_${NODE_NAME}.log
    STATUS_HEADER=get_pm_file_${NODE_NAME}
    (
    (
        echo "Running the function get_pm_file_${NODE_NAME}"
        ./mltn_pm.sh ${NODE_NAME} ${NODE_IP} ${AGENT_PORT} ${COMMUNITY}
    ) > $LOG_FILE 2>&1; parallel_finish
    ) & set_parallel_variables
}

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
        ./mltnpmcounter.sh ${NODE_NAME} ${NODE_IP} ${AGENT_PORT} ${COMMUNITY}
    ) > $LOG_FILE 2>&1; parallel_finish
    ) & set_parallel_variables
}

function amos ()
{
    `cat nodeips.txt | head -n $NUM_NODES > selectednodes.txt`
    rm -rf amos_stats.log
    while read -r SIM_NAME NODE_NAME NODE_IP;
    do
        amos_single $SIM_NAME $NODE_NAME $NODE_IP $JOB_ID $SERVER
    done < selectednodes.txt
    parallel_wait
    parallel_status
    if [[ $? -ne 0 ]]
    then
        endtime=`date +%s%3N`
        runtime=`expr $endtime - $starttime`
        echo "Exiting as there are failures in the amos commands, script took $runtime seconds "
    exit 1
    fi
}

function amos_single ()
{
    LOG_FILE=amos_${NODE_NAME}.log
    STATUS_HEADER=amos_${NODE_NAME}
    (
    (
        echo "Running the function amos_single_${NODE_NAME}"
        ./amos.sh -s ${SIM_NAME} -n ${NODE_NAME} -i ${NODE_IP}
    ) > $LOG_FILE 2>&1; parallel_finish
    ) & set_parallel_variables
}

function amos_ssh ()
{
    `cat nodeips.txt | head -n $NUM_NODES > selectednodes.txt`
    rm -rf amos_ssh_stats.log
    while read -r SIM_NAME NODE_NAME NODE_IP;
    do
        amos_ssh_single $SIM_NAME $NODE_NAME $NODE_IP $JOB_ID $SERVER
    done < selectednodes.txt
    parallel_wait
    parallel_status
    if [[ $? -ne 0 ]]
    then
        endtime=`date +%s%3N`
        runtime=`expr $endtime - $starttime`
        echo "Exiting as there are failures in the amos commands, script took $runtime seconds "
    exit 1
    fi
}

function amos_ssh_single ()
{
    LOG_FILE=amos_ssh_${NODE_NAME}.log
    STATUS_HEADER=amos_ssh_${NODE_NAME}
    (
    (
        echo "Running the function amos_ssh_single_${NODE_NAME}"
        ./amos_ssh.sh -n ${NODE_NAME} -i ${NODE_IP}
    ) > $LOG_FILE 2>&1; parallel_finish
    ) & set_parallel_variables
}

function amos_ssh_corba ()
{
    `cat nodeips.txt | head -n $NUM_NODES > selectednodes.txt`
    rm -rf amos_ssh_corba_stats.log
    while read -r SIM_NAME NODE_NAME NODE_IP;
    do
        amos_ssh_corba_single $SIM_NAME $NODE_NAME $NODE_IP $JOB_ID $SERVER
    done < selectednodes.txt
    parallel_wait
    parallel_status
    if [[ $? -ne 0 ]]
    then
        endtime=`date +%s%3N`
        runtime=`expr $endtime - $starttime`
        echo "Exiting as there are failures in the amos commands, script took $runtime seconds "
    exit 1
    fi
}

function amos_ssh_corba_single ()
{
    LOG_FILE=amos_ssh_corba_${NODE_NAME}.log
    STATUS_HEADER=amos_ssh_corba_${NODE_NAME}
    (
    (
        echo "Running the function amos_ssh_corba_single_${NODE_NAME}"
        ./amos_combined.sh -s ${SIM_NAME} -n ${NODE_NAME} -i ${NODE_IP}
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
                  echo "${parallel_strings[$pid]}:FAIL" >> usecasestat.log
                  count=`expr $count + 1`
            else
                  echo "${parallel_strings[$pid]}:PASS" >> usecasestat.log
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

echo "*********Num_nodes=$NUM_NODES**********" >> mltnpmstats.log
echo "*********Num_nodes=$NUM_NODES**********" >> usecasestat.log


COMMAND_RUN="$0 $@"
echo "Running command $COMMAND_RUN"

rm -rf /netsim/tn_pm_data/*

sh sarcollect.sh $NETSIM_SERVER $JOB_ID
SARPID=`cat sarpid.txt`

$FUNCTION
EXIT_CODE=$?

endtime=`date +%s%3N`

runtime=`expr $endtime - $starttime`

sh sarstop.sh $NETSIM_SERVER $SARPID $JOB_ID $NUM_NODES $runtime

#rm -rf /netsim/tn_pm_data/*
rm -rf /netsim/tn_backup_configuration/*

if [[ $EXIT_CODE -ne 0 ]]
then
    echo "Completed function $FUNCTION with some failures at $FORMAT_DATE"
else
    echo "Completed function $FUNCTION at $FORMAT_DATE"
fi

echo "Script execution took $runtime milli seconds for ${NUM_NODES}"
echo "Return code $EXIT_CODE, Script execution took $runtime milli seconds for ${NUM_NODES}" >> total_$FUNCTION.log
