#!/bin/bash
#===================================================================================
#
# FILE: commands.sh
#
# USAGE: NA
#
# DESCRIPTION:  The functions will be called from commandExecutor.sh
#
# NOTES: ---
# AUTHOR: ZKIDPIY (piyush.kidambi@tcs.com)
# VERSION: 1.0
# CREATED: 
#
#===================================================================================

Usage(){
    echo " USAGE:  sh $0 <NE_NAME> <NE_IP> <IS_TLS> <JOB_ID> <LOGGING> <PORT>"
    exit 1
}

if [[ $# -ne 6 ]];then
    Usage
fi


#Initialisation

NE_NAME=$1
NE_IP=$2
IS_TLS=$3
JOB_ID=$4
LOG_ENABLED=$5
SSH_PORT=$6
LOGS_DIR="logs_pmsubscription"
mkdir -p "$LOGS_DIR"
USERNAME="netsim"
PASSWORD="netsim"
ALL_LOGS_FILE="all_logs_file.txt"
startTimeFile="startTimeFile.txt"
endTimeFile="endTimeFile.txt"


LOG_FILENAME=$LOGS_DIR"/"$JOB_ID"_"$NE_NAME".log"

echo $LOG_FILENAME >> $ALL_LOGS_FILE


#Logging start time
echo "`date +%s`" >> $startTimeFile

#Running Commands


expect << EOF
set timeout -1

if { "$LOG_ENABLED" == "true" } { log_file -noappend $LOG_FILENAME }


#Connection based on TLS or NON-TLS node
if { $IS_TLS == 0 } {
    spawn openssl s_client -connect $NE_IP:$SSH_PORT
    expect ">"
} else {
spawn ssh -o StrictHostKeyChecking=no $USERNAME@$NE_IP -p $SSH_PORT
expect "assword:"
send "$PASSWORD\n"
expect ">"
}


                        #Command - lt all
                        send "width 3000\n"
			expect ">"
			send "length\n"
			expect ">"
			send "prompt \n"
			expect ">"
			send "scriptmode on\n"
			expect ">"
			send "show\n"
			expect ">"
			send "show ManagedElement=$NE_NAME,userLabel\n"
			expect ">"
			send "show ManagedElement=$NE_NAME,dnPrefix\n"
			expect ">"
			send "show ManagedElement=$NE_NAME,release\n"
			expect ">"
			send "show ManagedElement=$NE_NAME\n"
			expect ">"
			send "show\n"
			expect ">"
			send "show ManagedElement=$NE_NAME,SystemFunctions=1,SwInventory=1,active\n"
			expect ">"
			send "show\n"
			expect ">"
			send "show ManagedElement=$NE_NAME,SystemFunctions=1,SwInventory=1,active\n"
			expect ">"
			send "show all ManagedElement=$NE_NAME,SystemFunctions=1,SysM=1\n"
			expect ">"
			send "show\n"
			expect ">"
			send "show ManagedElement=$NE_NAME,SystemFunctions=1,SwInventory=1,active\n"
			expect ">"
			send "show\n"
			expect ">"
			send "show ManagedElement=$NE_NAME,dnPrefix\n"
			expect ">"
			send "show ManagedElement=$NE_NAME,release\n"
			expect ">"
			send "show ManagedElement=$NE_NAME\n"
			expect ">"
			send "show-mib -v\n"
			expect ">"

EOF

                        #Logging end time
                        echo "`date +%s`" >> $endTimeFile
