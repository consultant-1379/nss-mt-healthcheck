#!/bin/bash

####################################################################################################
#
# FileName: swupgrade.sh
# Author: Malla Goutham
# Description: This script will trigger the software upgrade actions on the dg2 nodes.
# Syntax: ./swupgrade.sh <NODE NAME> <NODE IP> <PROTOCOL> <JOB ID> <SERVER>
#         PROTOCOL - SSH/TLS
#         SERVER   - SMRS server to download the software package
# Example: ./swupgrade.sh LTEdg2ERBS00001 10.71.0.1 SSH 123456 10.54.0.1
# Pre-requisite: The SERVER should contain the upgrade package in the below path
#                /netsim/upgradePackageTest
####################################################################################################

# Load the default values from conf file
. conf.txt

StartTime=`date +%s%3N`
NODE_NAME=$1
NODE_IP=$2
PROTOCOL=$3
JOB_ID=$4
SERVER=$5
PACKAGE_URI="sftp://${SW_USERNAME}@${SERVER}${PACKAGE_PATH}"

/usr/bin/expect - << "EOF" $NODE_NAME $NODE_IP $TLS_PORT "$PACKAGE_NAME" $PACKAGE_URI $SW_PASSWORD $CREATE_TIMEOUT $PREPARE_TIMEOUT $ACTIVATE_TIMEOUT $CONFIRM_TIMEOUT $JOB_ID $PROTOCOL $SSH_PORT

set NODE_NAME [lindex $argv 0]
set NODE_IP [lindex $argv 1]
set TLS_PORT [lindex $argv 2]
set PACKAGE_NAME [lindex $argv 3]
set PACKAGE_URI [lindex $argv 4]
set PASSWORD [lindex $argv 5]
set CREATE_TIMEOUT [lindex $argv 6]
set PREPARE_TIMEOUT [lindex $argv 7]
set ACTIVATE_TIMEOUT [lindex $argv 8]
set CONFIRM_TIMEOUT [lindex $argv 9]
set JOB_ID [lindex $argv 10]
set PROTOCOL [lindex $argv 11]
set SSH_PORT [lindex $argv 12]

#---------------------------------------------------------------------------------------------------
# Subroutine for close session
#---------------------------------------------------------------------------------------------------

proc close_session { JOB_ID } {
    send "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
        <rpc message-id=\"S_${JOB_ID}_7\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">
            <close-session/>
        </rpc>]]>]]>\r"; send_user "\nS_${JOB_ID}_7 [clock format [clock seconds]]\n"
    expect {
    "</rpc-reply>]]>]]>" {}
    }
}

#---------------------------------------------------------------------------------------------------
# Connection to the node ( SSH/TLS )
#---------------------------------------------------------------------------------------------------

set timeout 600

if { $PROTOCOL == "TLS" } {
    spawn openssl s_client -connect $NODE_IP:$TLS_PORT
    expect {
    "</hello>\r
]]>]]>" {}
    -re "refused" { send_user "\nConnection to the node refused,terminating\n";exit 1 }
    }
} else {
    spawn ssh -o StrictHostKeyChecking=no netsim@${NODE_IP} -p ${SSH_PORT} -s netconf
    expect "password:"
    send "netsim\r"
    expect "]]>]]>"
}

#---------------------------------------------------------------------------------------------------
# Create subscription
#---------------------------------------------------------------------------------------------------

send "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
 <netconf:rpc message-id=\"S_${JOB_ID}_1\" xmlns:netconf=\"urn:ietf:params:xml:ns:netconf:base:1.0\">
  <create-subscription xmlns=\"urn:ietf:params:xml:ns:netconf:notification:1.0\">
    <filter type=\"subtree\">
      <event>
        <filterType>objectCreated</filterType>
        <filterValue>ManagedElement.*</filterValue>
      </event>
      <event>
        <filterType>objectDeleted</filterType>
        <filterValue>ManagedElement.*</filterValue>
      </event>
      <event>
        <filterType>attributeChanged</filterType>
        <filterValue>ManagedElement.*</filterValue>
      </event>
    </filter>
 </create-subscription>
</netconf:rpc>]]>]]>\r"; send_user "\nS_${JOB_ID}_1 [clock format [clock seconds]]\n"

expect {
    "<ok/>\r
</rpc-reply>]]>]]>" { }
    "  </rpc-error>\r
</rpc-reply>]]>]]>" { send_user "\nCreate subscription failed at create upgrade\n"; exit 1 }
    timeout { send_user "\nTimedout in create subscription response\n";close_session ${JOB_ID};exit 1 }
}

#---------------------------------------------------------------------------------------------------
##Create upgrade
#---------------------------------------------------------------------------------------------------
proc validate_create { a b } {
   if { $a == true && $b == true } {
       puts "Create upgrade successful" } else {
       puts "Status objectcreated-$a createfinished-$b"
       exp_continue
   }
}

set objectcreated false
set createfinished false
set timeout ${CREATE_TIMEOUT}

send "<rpc message-id=\"S_${JOB_ID}_2\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">
  <action xmlns=\"urn:com:ericsson:ecim:1.0\">
    <data>
      <ManagedElement xmlns=\"urn:com:ericsson:ecim:ComTop\">
        <managedElementId>${NODE_NAME}</managedElementId>
        <SystemFunctions>
          <systemFunctionsId>1</systemFunctionsId>
          <SwM xmlns=\"urn:com:ericsson:ecim:RcsSwM\">
            <swMId>1</swMId>
            <createUpgradePackage>
              <uri>${PACKAGE_URI}</uri>
              <password>${PASSWORD}</password>
            </createUpgradePackage>
          </SwM>
        </SystemFunctions>
      </ManagedElement>
    </data>
  </action>
</rpc>]]>]]>]]\r"; send_user "\nS_${JOB_ID}_2 [clock format [clock seconds]]\n"


expect {
        "  </rpc-error>\r
</rpc-reply>]]>]]>" { send_user "\nCreate upgrade action failed\n"; exit 1 }
    "</data>
</rpc-reply>]]>]]>" { exp_continue }
     -re  "<objectCreated dn=\"ManagedElement=${NODE_NAME},SystemFunctions=1,SwM=1,UpgradePackage=${PACKAGE_NAME}\">" { set objectcreated true; validate_create $objectcreated $createfinished }
     -re  "<v>createUpgradePackage started; action succeeded</v>(.*?)<elem name=\"result\">(.*?)<v>SUCCESS</v>(.*?)<elem name=\"state\">(.*?)<v>FINISHED</v>(.*?)" { set createfinished true; validate_create $objectcreated $createfinished }
     -re "<v>FAILURE</v>" { send_user "\nCreate upgrade failed\n"; }
     timeout { send_user "\nTimedout in createupgrade action\n";close_session ${JOB_ID};exit 1}
}

#---------------------------------------------------------------------------------------------------
# Prepare Upgrade
#---------------------------------------------------------------------------------------------------
proc validate_prepare { a b c } {
   if { $a == true && $b == true && $c == true } {
       puts "Prepare upgrade successful" } else {
       puts "Status prepareprogress-$a preparefinshed-$b preparecompleted-$c"
       exp_continue
   }
}

set timeout ${PREPARE_TIMEOUT}
set prepareprogress false
set preparefinished false
set preparecompleted false

send "<rpc message-id=\"S_${JOB_ID}_3\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">
  <action xmlns=\"urn:com:ericsson:ecim:1.0\">
    <data>
      <ManagedElement xmlns=\"urn:com:ericsson:ecim:ComTop\">
        <managedElementId>${NODE_NAME}</managedElementId>
        <SystemFunctions>
          <systemFunctionsId>1</systemFunctionsId>
          <SwM xmlns=\"urn:com:ericsson:ecim:RcsSwM\">
            <swMId>1</swMId>
            <UpgradePackage>
              <upgradePackageId>${PACKAGE_NAME}</upgradePackageId>
              <prepare/>
            </UpgradePackage>
          </SwM>
        </SystemFunctions>
      </ManagedElement>
    </data>
  </action>
</rpc>]]>]]>]]\r"; send_user "\nS_${JOB_ID}_3 [clock format [clock seconds]]\n"


expect {
    -re "</rpc-error>\r
</rpc-reply>]]>]]>\r\r" { send_user "\nPrepare action failed\n"; exit 1 }
    -re "<attr name=\"state\">(.*?)<v>PREPARE_IN_PROGRESS</v>" { set prepareprogress true; validate_prepare $prepareprogress $preparefinished $preparecompleted }
 -re  "<v>prepare started; action succeeded</v>(.*?)<elem name=\"result\">(.*?)<v>SUCCESS</v>(.*?)<elem name=\"state\">(.*?)<v>FINISHED</v>(.*?)" { set preparefinished true; validate_prepare $prepareprogress $preparefinished $preparecompleted }
 -re "<attr name=\"state\">(.*?)<v>PREPARE_COMPLETED</v>" { set preparecompleted true; validate_prepare $prepareprogress $preparefinished $preparecompleted }    
 -re "<v>FAILURE</v>" { send_user "\nPrepare upgrade failed\n"; }
  timeout { send_user "\nTimedout in prepare action\n";close_session ${JOB_ID};exit 1}
}

#---------------------------------------------------------------------------------------------------
# Ignore breakpoints to skip the step activation
#---------------------------------------------------------------------------------------------------

set timeout 600

send "<rpc message-id=\"S_${JOB_ID}_4\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">
    <edit-config>
        <target>
            <running/>
        </target>
        <config>
            <ManagedElement xmlns=\"urn:com:ericsson:ecim:ComTop\">
                <managedElementId>${NODE_NAME}</managedElementId>
                    <SystemFunctions xmlns=\"urn:com:ericsson:ecim:ComTop\">
                        <systemFunctionsId>1</systemFunctionsId>
                            <SwM xmlns=\"urn:com:ericsson:ecim:RcsSwM\">
                                <swMId>1</swMId>
                                    <UpgradePackage operation=\"merge\">
                                        <upgradePackageId>${PACKAGE_NAME}</upgradePackageId>
                                        <ignoreBreakPoints>true</ignoreBreakPoints>
                                    </UpgradePackage>
                            </SwM>
                    </SystemFunctions>
            </ManagedElement>
        </config>
    </edit-config>
</rpc>]]>]]>\r"; send_user "\nS_${JOB_ID}_4 [clock format [clock seconds]]\n"

expect {
    "<ok/>\r
</rpc-reply>]]>]]>" { }
    "  </rpc-error>\r
</rpc-reply>]]>]]>" { send_user "\nFailed in setting ignore breakpoints\n"; exit 1 }
    timeout { send_user "\nTimedout in setting ignore breakpoints\n";close_session ${JOB_ID};exit 1 }
}

#---------------------------------------------------------------------------------------------------
# ACTIVATE upgrade
#---------------------------------------------------------------------------------------------------
proc validate_activate { a b c d } {
   if { $a == true && $b == true && $c == true && $d == true } {
       puts "Activate upgrade successful" } else {
       puts "Status activationprogress-$a activationcompleted-$b activatefinished-$c waitingformcommit-$d"
       exp_continue
   }
}

set activationprogress false
set activationcompleted false
set activatefinished false
set waitingforcommit false
set timeout ${ACTIVATE_TIMEOUT}

send "<rpc message-id=\"S_${JOB_ID}_5\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">
  <action xmlns=\"urn:com:ericsson:ecim:1.0\">
    <data>
      <ManagedElement xmlns=\"urn:com:ericsson:ecim:ComTop\">
        <managedElementId>${NODE_NAME}</managedElementId>
        <SystemFunctions>
          <systemFunctionsId>1</systemFunctionsId>
          <SwM xmlns=\"urn:com:ericsson:ecim:RcsSwM\">
            <swMId>1</swMId>
            <UpgradePackage>
              <upgradePackageId>${PACKAGE_NAME}</upgradePackageId>
              <activate/>
            </UpgradePackage>
          </SwM>
        </SystemFunctions>
      </ManagedElement>
    </data>
  </action>
</rpc>]]>]]>]]\r";send_user "\nS_${JOB_ID}_5 [clock format [clock seconds]]\n"

expect {
   "  </rpc-error>\r
</rpc-reply>]]>]]>" { send_user "Activate upgrade failed\n"; exit 1 }
  -re "ACTIVATION_IN_PROGRESS" { set activationprogress true; validate_activate $activationprogress $activationcompleted $activatefinished $waitingforcommit }
  -re "ACTIVATION_STEP_COMPLETED" { set activationcompleted true; validate_activate $activationprogress $activationcompleted $activatefinished $waitingforcommit }
  -re "<v>activate started; all steps succeeded</v>" { set activatefinished true; validate_activate $activationprogress $activationcompleted $activatefinished $waitingforcommit }
  -re "WAITING_FOR_COMMIT" { set waitingforcommit true ; validate_activate $activationprogress $activationcompleted $activatefinished $waitingforcommit }
  -re "<v>FAILURE</v>" { send_user "\nActivate upgrade failed\n"; }
  timeout { send_user "Timedout in activate upgrade action"; close_session ${JOB_ID}; exit 1 }
}

#---------------------------------------------------------------------------------------------------
#Confirm Upgrade
#---------------------------------------------------------------------------------------------------
proc validate_commit { a b } {
   if { $a == true && $b == true } {
       puts "Confirm upgrade successful" } else {
       puts "Status commitfinished-$a commitcompleted-$b"
       exp_continue
   }
}
# Initialize the confirm variables
set commitfinished false
set commitcompleted false
set timeout ${CONFIRM_TIMEOUT}

# Confirm action
send "<rpc message-id=\"S_${JOB_ID}_6\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">
  <action xmlns=\"urn:com:ericsson:ecim:1.0\">
    <data>
      <ManagedElement xmlns=\"urn:com:ericsson:ecim:ComTop\">
        <managedElementId>${NODE_NAME}</managedElementId>
        <SystemFunctions>
          <systemFunctionsId>1</systemFunctionsId>
          <SwM xmlns=\"urn:com:ericsson:ecim:RcsSwM\">
            <swMId>1</swMId>
            <UpgradePackage>
              <upgradePackageId>${PACKAGE_NAME}</upgradePackageId>
              <confirm/>
            </UpgradePackage>
          </SwM>
        </SystemFunctions>
      </ManagedElement>
    </data>
  </action>
</rpc>]]>]]>]]\r";send_user "\nS_${JOB_ID}_6 [clock format [clock seconds]]\n"

expect {
  "  </rpc-error>\r
</rpc-reply>]]>]]>" { send_user "Commit action failed \n"; exit 1 }
 -re  "<v>confirm started; action succeeded(.*?)</v>(.*?)<elem name=\"result\">(.*?)<v>SUCCESS</v>(.*?)<elem name=\"state\">(.*?)<v>FINISHED</v>(.*?)" { set commitfinished true; validate_commit $commitfinished $commitcompleted }
 -re "<attr name=\"state\">(.*?)<v>COMMIT_COMPLETED</v>" { set commitcompleted true; validate_commit $commitfinished $commitcompleted }
 -re "<v>FAILURE</v>" { send_user "\nConfirm upgrade failed\n"; }
  timeout { send_user "Timedout in prepare upgrade action"; close_session ${JOB_ID}; exit 1 }
}

#---------------------------------------------------------------------------------------------------
#close the session
#---------------------------------------------------------------------------------------------------
close_session ${JOB_ID}

EOF

Result=$?
EndTime=`date +%s%3N`
StartTime1=`expr $StartTime / 1000`
StartTimeFormat=`date -d @$StartTime1`
EndTime1=`expr $EndTime / 1000`
EndTimeFormat=`date -d @$EndTime1`
Diff=`expr $EndTime - $StartTime`
echo "${NODE_NAME} $StartTime:::$StartTimeFormat $EndTime:::$EndTimeFormat $Diff"  >> upgradestats.log

if [[ $Result -ne 0 ]]
then
     echo "Upgrade failed"
     exit 1
else
     echo "Upgrade completed successfully"
fi
