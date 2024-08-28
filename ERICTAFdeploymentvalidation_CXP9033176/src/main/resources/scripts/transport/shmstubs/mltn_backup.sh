#!/bin/sh

. conf.txt

StartTime=`date +%s%3N`
NODE_NAME=$1
NODE_IP=$2
PORT=$3
COMMUNITY=$4
BACKUP_ID=$5
FILE_NAME="backup_${NODE_NAME}_${BACKUP_ID}.zip"


/usr/bin/expect - << "EOF" $NODE_NAME $NODE_IP $PORT $COMMUNITY $SW_FTP_SERVER $SW_FTP_ALIAS $SW_FTP_PORT $SW_FTP_USER $SW_FTP_PWD $FILE_NAME
set timeout 20
set NODE_NAME [lindex $argv 0]
set NODEIP [lindex $argv 1]
set PORT [lindex $argv 2]
set COMMUNITY [lindex $argv 3]
set SW_FTP_SERVER [lindex $argv 4]
set SW_FTP_ALIAS [lindex $argv 5]
set SW_FTP_PORT [lindex $argv 6]
set SW_FTP_USER [lindex $argv 7]
set SW_FTP_PWD [lindex $argv 8]
set FILE_NAME [lindex $argv 9]
set ftpconstatus 0
set ftpconcount 1
set backupcount 1
set backupstatus 0
set backupdownloadcount 1
set backupdownloadstatus 0


#BulkGet the FTP table
set getbulkone false
send_user "\n[clock format [clock seconds]]Bulkget the ftptable\n"
spawn snmpbulkget -t 3 -v 2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.8.3.11.1 -Cr50
expect {
    -re "SNMPv2-SMI::enterprises" { set getbulkone true }
    -re "Timeout: No Response from" { send_user "Timedout in getbulkone \n" ; exit 1}
     eof {
		if {$getbulkone != true } {
			puts "Timeout in getbulkone\n" ; exit 1
		}
     }
}

#BulkGet the FTP table
set getbulktwo false
send_user "\n[clock format [clock seconds]]Bulkget the ftptable\n"
spawn snmpbulkget -t 3 -v 2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.8.3.11.1.4 -Cr50
expect {
    -re "SNMPv2-SMI::enterprises" { set getbulktwo true }
    -re "Timeout: No Response from" { send_user "Timedout in getbulktwo \n" ; exit 1}
     eof {
		if {$getbulktwo != true } {
			puts "Timeout in getbulktwo\n" ; exit 1
		}
     }
}

#BulkGet the FTP table
set getbulkthree false
send_user "\n[clock format [clock seconds]]Bulkget the ftptable\n"
spawn snmpbulkget -t 3 -v 2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.8.3.11.1.7 -Cr50
expect {
    -re "SNMPv2-SMI::enterprises" { set getbulkthree true }
    -re "Timeout: No Response from" { send_user "Timedout in getbulkthree \n" ; exit 1}
     eof {
		if {$getbulkthree != true } {
			puts "Timeout in getbulkthree\n" ; exit 1
		}
     }
}

#BulkGet the FTP table
set getbulkfour false
send_user "\n[clock format [clock seconds]]Bulkget the ftptable\n"
spawn snmpbulkget -t 3 -v 2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.8.3.11.1.10 -Cr50
expect {
    -re "SNMPv2-SMI::enterprises" { set getbulkfour true }
    -re "Timeout: No Response from" { send_user "Timedout in getbulkfour \n" ; exit 1}
     eof {
		if {$getbulkfour != true } {
			puts "Timeout in getbulkfour\n" ; exit 1
		}
     }
}


#FTP configuration
#xfDcnFTPConfigProtocol.3 to 2 and xfDcnFTPConfigRowStatus.3 to 1
spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.8.3.11.1.11.3 i 2 1.3.6.1.4.1.193.81.2.8.3.11.1.7.3 s $SW_FTP_PWD 1.3.6.1.4.1.193.81.2.8.3.11.1.6.3 s $SW_FTP_USER 1.3.6.1.4.1.193.81.2.8.3.11.1.5.3 s  $SW_FTP_PORT 1.3.6.1.4.1.193.81.2.8.3.11.1.4.3 s $SW_FTP_ALIAS 1.3.6.1.4.1.193.81.2.8.3.11.1.3.3 s $SW_FTP_SERVER 1.3.6.1.4.1.193.81.2.8.3.11.1.2.3 i 1
expect ">"

#xfDcnFTPConfigCheckConnectivityCommand.3 to 1 and xfDcnFTPConfigRowStatus.3 to 1
send_user "\n[clock format [clock seconds]]Setting xfDcnFTPConfigCheckConnectivityCommand.3 to 1 and xfDcnFTPConfigRowStatus.3 to 1\n"
spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.8.3.11.1.9.3 i 1 1.3.6.1.4.1.193.81.2.8.3.11.1.2.3 i 1
expect ">"


#xfDcnFTPConfigCheckConnectivityStatus.3 to 2
send_user "\n[clock format [clock seconds]] xfDcnFTPConfigCheckConnectivityStatus to 2\n"
while { $ftpconstatus != 3 } {
    if { $ftpconcount > 6 } {
        puts "Timedout in getting the Connectivity status in 60 seconds\n" ; exit 1
    }
    sleep 10
    spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.8.3.11.1.10.3
    expect {
        -re "INTEGER: 2" { send_user "xfDcnFTPConfigCheckConnectivityStatus.3 is 2\n"; set ftpconstatus 3 }
        eof { send_user "Polling release Connectivity state $ftpconcount time(s)\n" }
    }
    set ftpconcount [expr $ftpconcount+1];
}

#xfConfigLoadActiveFTP.0 to 3
send_user "\n[clock format [clock seconds]]Setting xfConfigLoadActiveFTP.0 to 3 \n"
spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.8.3.14.0 i 3
expect ">"

#xfConfigFileName.0 to $FILE_NAME and xfConfigLoadCommand.0 to 1
send_user "\n[clock format [clock seconds]]Setting xfConfigFileName.0 to $FILE_NAME and triggering xfConfigLoadCommand.0 to 1\n"
spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.4.7.3.0 s $FILE_NAME 1.3.6.1.4.1.193.81.2.4.7.1.0 i 1
expect ">"


#xfConfigFileName.0 should be $FILE_NAME
send_user "\n[clock format [clock seconds]]Getting xfConfigFileName.0 \n"
spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.4.7.3.0
expect {
    -re "$FILE_NAME" { send_user "xfConfigFileName is $FILE_NAME\n" }
    eof { send_user "\n[clock format [clock seconds]]Timedout in getting the xfConfigFileName\n"; exit 1 }
}

#xfConfigStatus.0  should be configUpLoading(1) initially when upload to fspath starts
send_user "\n[clock format [clock seconds]]Getting xfConfigStatus.0 \n"
spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.4.7.2.0
expect {
    -re "INTEGER: 1" { send_user "$FILE_NAME is uploading\n" }
    eof { send_user "\n[clock format [clock seconds]]Timedout in getting the xfConfigStatus\n"; exit 1 }
}


#xfConfigStatus.0 should be configUpLoadOK(2) as file upload is complete
send_user "\n[clock format [clock seconds]] xfConfigStatus should be configUpLoadOK\n"
while { $backupstatus != 3 } {
    if { $backupcount > 12 } {
        puts "Timedout in getting the Upload status in 120 seconds\n" ; exit 1
    }
    sleep 10
    spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.4.7.2.0
    expect {
        -re "INTEGER: 2" { send_user "xfConfigStatus is in configUpLoadOK(2) state\n"; set backupstatus 3 }
        eof { send_user "Polling release upload to fs state $backupcount time(s)\n" }
    }
    set backupcount [expr $backupcount+1];
}



#Restore Backup

#xfConfigFileName.0 to $FILE_NAME and xfConfigLoadCommand.0 to 2
send_user "\n[clock format [clock seconds]]Triggered Restore\n"
spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.4.7.3.0 s $FILE_NAME 1.3.6.1.4.1.193.81.2.4.7.1.0 i 2
expect ">"


#xfConfigFileName.0 should be $FILE_NAME
send_user "\n[clock format [clock seconds]]Getting xfConfigFileName.0 \n"
spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.4.7.3.0
expect {
    -re "$FILE_NAME" { send_user "xfConfigFileName is $FILE_NAME\n" }
    eof { send_user "\n[clock format [clock seconds]]Timedout in getting the xfConfigFileName\n"; exit 1 }
}

#xfConfigStatus.0  should be configDownLoading(4) initially when download starts
send_user "\n[clock format [clock seconds]]Getting xfConfigStatus.0 \n"
spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.4.7.2.0
expect {
    -re "INTEGER: 4" { send_user "$FILE_NAME is downloading\n" }
    eof { send_user "\n[clock format [clock seconds]]Timedout in getting the xfConfigStatus\n"; exit 1 }
}


#xfConfigStatus.0 should be configDownLoadOK(5) as file download is complete
send_user "\n[clock format [clock seconds]] xfConfigStatus should be configUpLoadOK\n"
while { $backupdownloadstatus != 3 } {
    if { $backupdownloadcount > 12 } {
        puts "Timedout in getting the Download status in 120 seconds\n" ; exit 1
    }
    sleep 10
    spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.4.7.2.0
    expect {
        -re "INTEGER: 5" { send_user "xfConfigStatus is in configDownLoadOK(5) state\n"; set backupdownloadstatus 3 }
        eof { send_user "Polling release download from fs state $backupdownloadcount time(s)\n" }
    }
    set backupdownloadcount [expr $backupdownloadcount+1];
}


EOF


Result=$?
EndTime=`date +%s%3N`
StartTime1=`expr $StartTime / 1000`
StartTimeFormat=`date -d @$StartTime1`
EndTime1=`expr $EndTime / 1000`
EndTimeFormat=`date -d @$EndTime1`
Diff=`expr $EndTime - $StartTime`
echo "${NODE_NAME} $StartTime:::$StartTimeFormat $EndTime:::$EndTimeFormat $Diff"  >> brmbackup_stats.log

if [[ $Result -ne 0 ]]
then
     echo "Backup failed"
     exit 1
else
     echo "Backup action completed successfully"
fi
