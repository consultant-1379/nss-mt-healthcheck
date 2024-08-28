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
set passive 0
set active 0
set count 1
set operstatus 0

spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.3.0
expect  {
    -re "INTEGER: 1" { send_user "\n[clock format [clock seconds]]Row 1 is active\n"; set active 1; set passive 2 }
    -re "INTEGER: 2" { send_user "\n[clock format [clock seconds]]Row 2 is active\n"; set active 2; set passive 1 }
    timeout { send_user "timedout\n" }
    eof { send_user "Invalid response\n"; exit 1 }
}

set bulkgetone false
#BulkGet the FTP table
send_user "\n[clock format [clock seconds]]Bulkget the ftptable\n"
spawn snmpbulkget -t 3 -v 2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.8.3.11.1 -Cr100
expect {
    -re "SNMPv2-SMI::enterprises" { set bulkgetone true }
    -re "Timeout: No Response from" { send_user "Timedout in bulkgetone \n" ; exit 1}
     eof {
		if { $bulkgetone != true } {
			puts "Timeout in bulkgetone\n" ; exit 1
		}
     }
}

send_user "\n[clock format [clock seconds]]Set the xfSwBootTime and xfSwCommitType\n"
spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.5.0 i 2
expect ">"
spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.4.0 x "00 00 00 00 00 00 00 00"
expect ">"

#Set the xfSwReleaseRevision.(passive) and xfSwReleaseProductNumber.(passive)
spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.2.1.3.$passive s "MINI-LINK_TN_4.0_R1A"
expect ">"
spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.2.1.2.$passive s "CXP9010021_1"
expect ">"

#Destroy the Row 3 of FTP to create new one
spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.8.3.11.1.2.3 i 6
expect ">"
spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.8.3.11.1.2.3 i 4
expect ">"

#Set the FTP parameters
spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.8.3.11.1.3.3 s $SW_FTP_SERVER 1.3.6.1.4.1.193.81.2.8.3.11.1.4.3 s $SW_FTP_ALIAS 1.3.6.1.4.1.193.81.2.8.3.11.1.5.3 s $SW_FTP_PORT 1.3.6.1.4.1.193.81.2.8.3.11.1.6.3 s $SW_FTP_USER 1.3.6.1.4.1.193.81.2.8.3.11.1.7.3 s $SW_FTP_PWD
expect ">"

#Set xfSwUpgradeActiveFTP to 3rd row
spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.8.3.13.0 i 3
expect ">"

#Set xfSwReleaseAdminStatus.passive to 1 to start the upgrade
send_user "\Set admin status to upgrade started 1\n"
spawn snmpset -t 60 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.2.1.4.$passive i 1
expect ">"

#Get the xfGlobal state
send_user "\n[clock format [clock seconds]]xfSwGlobalState should be 1 - (40 00) - \[64,0\] --Upgrade started\n"
spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.11.0
expect {
    -re "Hex-STRING: 40 00" { send_user "State moved to Upgrade started\n"}
    eof { send_user "Timedout in getting the upgrade started response"; exit 1 }
}

set bulkgettwo false
#BulkGet the swrelease table
send_user "\n[clock format [clock seconds]]Bulkget the swrelease talbe\n"
spawn snmpbulkget -t 3 -v 2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.2 -Cr100
expect {
    -re "SNMPv2-SMI::enterprises" { set bulkgettwo true}
    -re "Timeout: No Response from" { send_user "Timedout in bulkget \n" ; exit 1}
     eof {
		if {$bulkgettwo != true } {
			puts "Timeout in bulkgettwo\n" ; exit 1
		}
     }
}

#Get xfSwReleaseOperStatus.passive  --- 3 finished
send_user "\n[clock format [clock seconds]]xfSwReleaseOperStatus should be 3 -- finished\n"
while { $operstatus != 3 } {
    if { $count > 5 } {
        puts "Timedout in getting the finished status in 200 seconds\n"; exit 1
    }
    sleep 60
    spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.2.1.5.$passive
    expect {
        -re "INTEGER: 3" { send_user "Release operstate is in finished state\n"; set operstatus 3 }
        eof { send_user "Polling release oper state $count time(s)\n" }
    }
    set count [expr $count+1];
}

#Get xfSwGlobalState
send_user "\n[clock format [clock seconds]]xfSwGlobalState should be 2 - (20 00) -\[32,0\] --sbl wait for active\n"
spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.11.0
expect {
    -re "Hex-STRING: 20 00" { send_user "State moved to Sbl wait for active\n"}
    eof { send_user "Timedout in sbl wait for active"; exit 1 }
}

#Set xfSwReleaseAdminStatus.passive to 6 upgradeTest
send_user "\n[clock format [clock seconds]]Set admin status to upgradeTest 6\n"
spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.2.1.4.$passive i 6
expect ">"

set bulkgetthree false
#BulkGet the swrelease table
send_user "\n[clock format [clock seconds]]Bulkget the swrelease talbe\n"
spawn snmpbulkget -t 3 -v 2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.2 -Cr100
expect {
    -re "SNMPv2-SMI::enterprises" { set bulkgetthree true}
    -re "Timeout: No Response from" { send_user "Timedout in bulkgetthree \n" ; exit 1}
     eof {
		if {$bulkgetthree != true } {
			puts "Timeout in bulkgetthree\n";
			exit 1
		}
     }
}

sleep 10

#Get xfSwReleaseOperStatus.passive  4
send_user "\n[clock format [clock seconds]]xfSwReleaseOperStatus.passive should be 4 testing\n"
spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.2.1.5.$passive
expect {
    -re "INTEGER: 4" { send_user "Release operstate is in testing state\n" }
    eof { send_user "\n[clock format [clock seconds]]Timedout in getting the release oper state\n"; exit 1 }
}

#Get xfSwGlobal state
send_user "\n[clock format [clock seconds]]xfSwGlobal state should be 3 - (10 00) -\[16,0\] --sbl wait for commit\n"
spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.11.0
expect {
    -re "Hex-STRING: 10 00" { send_user "State moved to Sbl wait for commit\n"}
    eof { send_user "\n[clock format [clock seconds]]Timedout in getting the sbl wait for commit\n"; exit 1 }
}

#Set xfSwReleaseAdminStatus.passive to 5
send_user "\n[clock format [clock seconds]]Set admin status to activate and running 5\n"
spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.2.1.4.$passive i 5
expect ">"

set bulkgetfour false
#BulkGet the swrelease table
send_user "\n[clock format [clock seconds]]Bulkget the swrelease talbe\n"
spawn snmpbulkget -t 3 -v 2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.2 -Cr100
expect {
    -re "SNMPv2-SMI::enterprises" { set bulkgetfour true}
    -re "Timeout: No Response from" { send_user "Timedout in bulkgetfour \n" ; exit 1}
     eof {
		if {$bulkgetfour != true } {
			puts "Timeout in bulkgetfour\n";
			exit 1
		}
     }
}

sleep 10

#Get the xfSwReleaseOperStatus - new active is current passive
send_user "\n[clock format [clock seconds]]xfSwReleaseOperStatus.newactive should be running 7\n"
spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.2.1.5.$passive
expect {
    -re "INTEGER: 7" { send_user "New active is in running state\n" }
    eof { send_user "\n[clock format [clock seconds]]Timedout in getting the new active state\n"; exit 1 }
}

#Get xfSwGlobalState
send_user "\n[clock format [clock seconds]]xfSwGlobal state should be no upgrade 0 - (80 00) -\[128,0\]\n"
spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.11.0
expect {
    -re "Hex-STRING: 80 00" { send_user "State moved to no upgrade\n"}
    eof { send_user "\n[clock format [clock seconds]]Timedout in getting the no upgrade\n"; exit 1 }
}
EOF

Result=$?
EndTime=`date +%s%3N`
StartTime1=`expr $StartTime / 1000`
StartTimeFormat=`date -d @$StartTime1`
EndTime1=`expr $EndTime / 1000`
EndTimeFormat=`date -d @$EndTime1`
Diff=`expr $EndTime - $StartTime`
echo "${NODE_NAME} $StartTime:::$StartTimeFormat $EndTime:::$EndTimeFormat $Diff"  >> sblupgrade_stats.log

if [[ $Result -ne 0 ]]
then
     echo "Sbl Upgrade failed"
     exit 1
else
     echo "Sbl Upgrade completed successfully"
fi

