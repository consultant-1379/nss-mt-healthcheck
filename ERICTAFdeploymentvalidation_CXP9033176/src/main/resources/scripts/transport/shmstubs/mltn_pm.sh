#!/bin/sh

. conf.txt

StartTime=`date +%s%3N`
NODE_NAME=$1
NODE_IP=$2
PORT=$3
COMMUNITY=$4

/usr/bin/expect - << "EOF" $NODE_NAME $NODE_IP $PORT $COMMUNITY $SW_FTP_SERVER $SW_FTP_ALIAS $SW_FTP_PORT $SW_FTP_USER $SW_FTP_PWD
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
set ethernetcount 1
set oamcount 1
set filestatus 0
set oamfilestatus 0
set xfstatus 0
set ftpconstatus 0
set ftpconcount 1

#BulkGet the FTP table
set getbulkone false
send_user "\n[clock format [clock seconds]]Bulkget the ftptable\n"
spawn snmpbulkget -t 3 -v 2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.8.3.11.1 -Cr30
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
spawn snmpbulkget -t 3 -v 2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.8.3.11.1.4 -Cr30
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
spawn snmpbulkget -t 3 -v 2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.8.3.11.1.7 -Cr30
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
spawn snmpbulkget -t 3 -v 2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.8.3.11.1.10 -Cr30
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
spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.8.3.11.1.9.3 i 1 1.3.6.1.4.1.193.81.2.8.3.11.1.2.3 i 1
expect ">"


#xfDcnFTPConfigCheckConnectivityStatus.3 to 2
send_user "\n[clock format [clock seconds]] xfDcnFTPConfigCheckConnectivityStatus to 2\n"
while { $ftpconstatus != 3 } {
    if { $ftpconcount > 3 } {
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


#Pm configuration
# xfPMFileName.0 to [] and xfPMFileStartInterval.0 to 1 and xfPMFileIfIndexes.0 to [] and xfPMFileEndInterval.0 to 1 and xfNEPmActiveFTP.0 to 3 and xfPMFileVersion.0 to 1 and xfPMFileGranularityPeriod.0 to 1
spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.4.8.5.0 s [] 1.3.6.1.4.1.193.81.2.4.8.9.0 i 1 1.3.6.1.4.1.193.81.2.4.8.6.0 s [] 1.3.6.1.4.1.193.81.2.4.8.10.0 i 1 1.3.6.1.4.1.193.81.2.8.3.19.0 i 3 1.3.6.1.4.1.193.81.2.4.8.11.0 i 1 1.3.6.1.4.1.193.81.2.4.8.8.0 i 1
expect ">"


# xfPMFileCategories.0 to [128]
spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.4.8.7.0 b 25
expect ">"


# xfPMFileCommand.0 to 1
spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.4.8.3.0 i 1
expect ">"


#While upload starts xfPMFileStatus will be transferActive
send_user "\n[clock format [clock seconds]] xfPMFileStatus should be transferActive as soon as file upload starts\n"
spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.4.8.4.0
expect {
    -re "INTEGER: 1" { send_user "xfPMFileStatus is in transferActive state\n" }
    eof { send_user "\n[clock format [clock seconds]]Timedout in getting the xfPMFileStatus\n"; exit 1 }
}


#xfPMFileStatus.0 should be transferComplete as file transfer is complete
send_user "\n[clock format [clock seconds]] xfPMFileStatus should be transferComplete - 2  after file transfer \n"
while { $filestatus != 3 } {
    if { $ethernetcount > 6 } {
        puts "Timedout in getting the File status in 60 seconds\n" ; exit 1
    }
    sleep 10
    spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.4.8.4.0
    expect {
        -re "INTEGER: 2" { send_user "xfPMFileStatus is in transferComplete state\n"; set filestatus 3 }
        eof { send_user "Polling release file state $ethernetcount time(s)\n" }
    }
    set ethernetcount [expr $ethernetcount+1];
}



# xfSoamPmActiveFTP.0 to 3 and xfServiceOamPmFileEndInterval.0 to 1 and xfServiceOamPmFileSessionIds.0 to [] and xfServiceOamPmFileStartInterval.0 to 1 and xfServiceOamPmFileGranularityPeriod.0 to 1
spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.8.3.27.0 i 3 1.3.6.1.4.1.193.81.4.1.2.1.12.12.8.0 i 1 1.3.6.1.4.1.193.81.4.1.2.1.12.12.5.0 s [] 1.3.6.1.4.1.193.81.4.1.2.1.12.12.7.0 i 1 1.3.6.1.4.1.193.81.4.1.2.1.12.12.6.0 i 1
expect ">"


# xfServiceOamPmFileCommand.0 to 1
spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.4.1.2.1.12.12.1.0 i 1
expect ">"

#xfServiceOamPmFileStatus.0 should be transferActive as file upload starts
spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.4.1.2.1.12.12.2.0
expect {
    -re "INTEGER: 1" { send_user "xfServiceOamPmFileStatus is in transferActive state\n" }
    eof { send_user "\n[clock format [clock seconds]]Timedout in getting the xfServiceOamPmFileStatus\n"; exit 1 }
}


#xfServiceOamPmFileStatus.0 should be transferComplete as file transfer is complete
while { $oamfilestatus != 3 } {
    if { $oamcount > 6 } {
        puts "Timedout in getting the File status in 60 seconds\n"; exit 1
    }
    sleep 10
    spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.4.1.2.1.12.12.2.0
    expect {
        -re "INTEGER: 2" { send_user "xfServiceOamPmFileStatus is in transferComplete state\n"; set oamfilestatus 3 }
        eof { send_user "Polling release oamfile state $oamcount time(s)\n" }
    }
    set oamcount [expr $oamcount+1];
}


EOF

Result=$?
EndTime=`date +%s%3N`
StartTime1=`expr $StartTime / 1000`
StartTimeFormat=`date -d @$StartTime1`
EndTime1=`expr $EndTime / 1000`
EndTimeFormat=`date -d @$EndTime1`
Diff=`expr $EndTime - $StartTime`
echo "${NODE_NAME} $StartTime:::$StartTimeFormat $EndTime:::$EndTimeFormat $Diff"  >> get_pm_files_stats.log

if [[ $Result -ne 0 ]]
then
     echo "Pm generation failed"
     exit 1
else
     echo "Pm generation completed successfully"
fi
