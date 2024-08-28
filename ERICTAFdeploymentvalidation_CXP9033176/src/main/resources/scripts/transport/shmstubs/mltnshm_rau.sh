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

# when adding a new NE type
# - find an entPhysIndex for which
#     entPhysicalDescr.$(entPhysIndex) == "RAU2 ..."
# - RAUProdNum = xfSwBoardProductNumber.$(entPhysIndex)
# - find RAURowIndex for which
#     xfSwLmUpgradeProductNumber.$(RAURowIndex) == $(RAUProdNum)
# Example:
# entPhysicalDescr   --> .1.3.6.1.2.1.47.1.1.1.1.2 --> RAU2 (ROW)
#{".1.3.6.1.2.1.47.1.1.1.1.2.(1686385151)",'STRING',"RAU2 X 23/77"}.
#xfSwBoardProductNumber --> .1.3.6.1.4.1.193.81.2.7.1.6.1.3.(1686385151) --> CXP 901 2878
#xfSwLmUpgradeProductNumber --> .1.3.6.1.4.1.193.81.2.7.1.10.1.3.(Row) --> CXP 901 2878
#For ML-TN 6.1 row is 4

set selectedproduct 4

spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.3.0
expect  {
    -re "INTEGER: 1" { send_user "\n[clock format [clock seconds]]Row 1 is active\n"; set active 1; set passive 2 }
    -re "INTEGER: 2" { send_user "\n[clock format [clock seconds]]Row 2 is active\n"; set active 2; set passive 1 }
    timeout { send_user "timedout\n" }
    eof { send_user "Invalid response\n"; exit 1 }
}

#BulkGet the FTP table 
set getbulkone false
send_user "\n[clock format [clock seconds]]Bulkget the ftptable\n"
spawn snmpbulkget -t 3 -v 2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.8.3.11.1 -Cr100
expect {
    -re "SNMPv2-SMI::enterprises" { set getbulkone true }
    -re "Timeout: No Response from" { send_user "Timedout in getbulkone \n" ; exit 1}
     eof { 
		if {$getbulkone != true } {
			puts "Timeout in getbulkone\n" ; exit 1
		}
     }
}

spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.5.0 i 2
expect ">"
spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.4.0 x "00 00 00 00 00 00 00 00"
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


#Set the xfSwLmUpgradeRevision.selectedproduct
spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.10.1.4.$selectedproduct s "R3A05"
expect ">"

#Set xfSwLmUpgradeAdminStatus(selectedproduct) to upgradestarted
send_user "\n[clock format [clock seconds]]xfSwLmUpgradeAdminStatus should be upgradeStarted(1)\n"
spawn snmpset -t 60 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.10.1.6.$selectedproduct i 1
expect ">"

#Get the xfSwGlobal state
send_user "\n[clock format [clock seconds]]xfSwGlobalState should be 4 - (08 00) - \[8,0\] --manualstarted(4)\n"
spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.11.0
expect {
    -re "Hex-STRING: 08 00" { send_user "State moved to manual started\n"}
    eof { send_user "Timedout in getting the manual started response"; exit 1 }
}

#Get the xfSwLmUpgradeOperStatus(selectedproduct)
send_user "\n[clock format [clock seconds]]xfSwLmUpgradeOperStatus should be upgradeStarted(2)\n"
spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.10.1.7.$selectedproduct
expect {
    -re "INTEGER: 2" { send_user "xfSwLmUpgradeOperStatus moved to upgrade Started\n" }
    eof { send_user "Timedout in getting the xfSwLmUpgradeOperStatus"; exit 1}
}

#BulkGet the xfSwLmUpgradeTable  
set getbulktwo false
send_user "\n[clock format [clock seconds]]Bulkget the xfSwLmUpgradeTable\n"
spawn snmpbulkget -t 3 -v 2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.10 -Cr100
expect {
    -re "SNMPv2-SMI::enterprises" { set getbulktwo true}
    -re "Timeout: No Response from" { send_user "Timedout in  \n" ; exit 1}
     eof { 
		if {$getbulktwo != true } {
			puts "Timeout in getbulktwo\n" ; exit 1
		}
     }
}

#Get xfSwLmUpgradeOperStatus(selectedproduct) upgrade finished (3)
send_user "\n[clock format [clock seconds]]xfSwLmUpgradeOperStatus should be 3 -- finished\n"
while { $operstatus != 3 } {
    if { $count > 5 } {
        puts "Timedout in getting the finished status in 300 seconds\n"; exit 1
    }
    sleep 60
    spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.10.1.7.$selectedproduct
    expect {
        -re "INTEGER: 3" { send_user "Upgrade operstatatus is in finished state\n"; set operstatus 3 }
        eof { send_user "Polling upgrade oper state $count time(s)\n" }
    }
    set count [expr $count+1];
}

#Get xfSwGlobalState
send_user "\n[clock format [clock seconds]]xfSwGlobalState should be 5 - (04 00) -\[4,0\] --manual wait for active(5)\n"
spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.11.0
expect {
    -re "Hex-STRING: 04 00" { send_user "State moved to Sbl wait for active\n"}
    eof { send_user "Timedout in sbl wait for active"; exit 1 }
}

#Set xfSwLmUpgradeAdminStatus.selectedproduct to upgradeTest(4)
send_user "\n[clock format [clock seconds]]Set admin status to upgradeTest 4\n"
spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.10.1.6.$selectedproduct i 4
expect {
	-re "INTEGER: 4" { }
	eof { send_user "Timedout in setting the adminstatus to upgradeTest(4)"; exit 1}
}

#BulkGet the xfSwLmUpgradeTable 
set getbulkthree false
send_user "\n[clock format [clock seconds]]Bulkget the swrelease talbe\n"
spawn snmpbulkget -t 3 -v 2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.10 -Cr100
expect {
    -re "SNMPv2-SMI::enterprises" { set getbulkthree true}
    -re "Timeout: No Response from" { send_user "Timedout in getbulkthree \n" ; exit 1}
     eof { 
		if {$getbulkthree != true } {
			puts "Timeout in getbulkthree\n"; 
			exit 1
		}
     }
}
sleep 10

#Get xfSwLmUpgradeOperStatus.selectedproduct (should be upgradeTested(4))
send_user "\n[clock format [clock seconds]]xfSwLmUpgradeOperStatus.selected should be 4 testing\n"
spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.10.1.7.$selectedproduct
expect {
    -re "INTEGER: 4" { send_user "Upgrade operstate is in testing state\n" }
    eof { send_user "\n[clock format [clock seconds]]Timedout in getting the upgrade oper state\n"; exit 1 }
}

#Get xfSwGlobal state
send_user "\n[clock format [clock seconds]]xfSwGlobal state should be 6 - (02 00) -\[2,0\] --manual wait for commit\n"
spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.11.0
expect {
    -re "Hex-STRING: 02 00" { send_user "State moved to Sbl wait for commit\n"}
    eof { send_user "\n[clock format [clock seconds]]Timedout in getting the sbl wait for commit\n"; exit 1 }
}

#Set xfSwLmUpgradeAdminStatus.selectedproduct active and running
send_user "\n[clock format [clock seconds]]Set admin status to activate and running 3\n"
spawn snmpset -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.10.1.6.$selectedproduct i 3
expect {
    -re "INTEGER: 3" { }
    eof { send_user "\n[clock format [clock seconds]]Timedout in setting the active and running state\n"; exit 1}
}

set getbulkfour false
#BulkGet the xfSwLmUpgrade table 
send_user "\n[clock format [clock seconds]]Bulkget the xfSwLmUpgrade table\n"
spawn snmpbulkget -t 3 -v 2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.10 -Cr100
expect {
    -re "SNMPv2-SMI::enterprises" { set getbulkfour true}
    -re "Timeout: No Response from" { send_user "Timedout in getbulkfour \n" ; exit 1}
     eof { 
		if {$getbulkfour != true } {
			puts "Timeout in getbulkfour\n"; 
			exit 1
		}
     }
}

sleep 10

#Get the xfSwLmUpgradeOperStatus.selcetedproduct to active
send_user "\n[clock format [clock seconds]]xfSwLmUpgradeOperStatus.selectedproduct should be active 1\n"
spawn snmpget -t 1 -v2c -c $COMMUNITY $NODEIP:$PORT 1.3.6.1.4.1.193.81.2.7.1.10.1.7.$selectedproduct
expect {
    -re "INTEGER: 1" { send_user "OperStatus is active\n" }
    eof { send_user "\n[clock format [clock seconds]]Timedout in getting the active operstatus\n"; exit 1 }
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
echo "${NODE_NAME} $StartTime:::$StartTimeFormat $EndTime:::$EndTimeFormat $Diff"  >> manualupgrade_stats.log

if [[ $Result -ne 0 ]]
then
     echo "Manual Upgrade failed"
     exit 1
else
     echo "Manual Upgrade completed successfully"
fi
