#!/bin/bash
####################################################################################################
#
# FileName: brmbackup.sh
# Author: Malla Goutham
# Description: This script will trigger the backup actions for dg2 nodes
# Syntax: ./brmbackup.sh <NODE NAME> <NODE IP> <PROTOCOL> <JOBID> <SERVER>
#         PROTOCOL - SSH/TLS
#         SERVER - SMRS server to export the backup file
# Example: ./brmbackup.sh LTEdg2ERBS00001 10.78.0.1 SSH 123456 10.54.0.1
# Dependency: conf.txt file with default parameters (SSH_PORT,TLS_PORT,BACKUP_USERNAME,
#             BACKUP_PASSWORD,BACKUP_PATH,CREATE_BACKUP_TIMEOUT,EXPORT_BACKUP_TIMEOUT)
####################################################################################################

. conf.txt

StartTime=`date +%s%3N`
NODE_NAME=$1
NODE_IP=$2
PROTOCOL=$3
JOB_ID=$4
SERVER=$5
BACKUP_ID=0
CREATE_BACKUP_URI="sftp://${BACKUP_USERNAME}@${SERVER}/${BACKUP_PATH}"
TEST_BACKUP_NAME="${BACKUP_NAME}_${JOB_ID}"

/usr/bin/expect - << "EOF" $NODE_NAME $NODE_IP $TLS_PORT $CREATE_BACKUP_URI $BACKUP_PASSWORD $TEST_BACKUP_NAME $BACKUP_ID $CREATE_BACKUP_TIMEOUT $EXPORT_BACKUP_TIMEOUT $PROTOCOL $SSH_PORT $JOB_ID

set NODE_NAME [lindex $argv 0]
set NODE_IP [lindex $argv 1]
set TLS_PORT [lindex $argv 2]
set CREATE_BACKUP_URI [lindex $argv 3]
set PASSWORD [lindex $argv 4]
set TEST_BACKUP_NAME [lindex $argv 5]
set BACKUP_ID [lindex $argv 6]
set CREATE_BACKUP_TIMEOUT [lindex $argv 7]
set EXPORT_BACKUP_TIMEOUT [lindex $argv 8]
set PROTOCOL [lindex $argv 9]
set SSH_PORT [lindex $argv 10]
set JOB_ID [lindex $argv 11]
match_max 6000
set timeout 600

#--------------------------------------------------------------------------------------------
#Subroutine to close the session
#--------------------------------------------------------------------------------------------

proc close_session { JOB_ID } {
    send "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
        <rpc message-id=\"B_${JOB_ID}_5\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">
            <close-session/>
        </rpc>]]>]]>\r"; send_user "\nB_${JOB_ID}_5 [clock format [clock seconds]]\n"
    expect {
    "</rpc-reply>]]>]]>" {}
    }
}

#--------------------------------------------------------------------------------------------------
# SSH/TLS connection to the node
#--------------------------------------------------------------------------------------------------

if { $PROTOCOL == "TLS" } {
    spawn openssl s_client -connect $NODE_IP:$TLS_PORT
    expect {
    "</hello>\r
]]>]]>" {}
    -re "refused" { send_user "\nConnection to the node refused,terminating\n";exit 1 }
    }
} else {
    spawn ssh -o StrictHostKeyChecking=no netsim@${NODE_IP} -p ${SSH_PORT} -s netconf
    expect {
        "password:" { send "netsim\r"; exp_continue }
        "]]>]]>" { }
    }
}

#--------------------------------------------------------------------------------------------------
# Create subscription
#--------------------------------------------------------------------------------------------------

send "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
 <netconf:rpc message-id=\"B_${JOB_ID}_1\" xmlns:netconf=\"urn:ietf:params:xml:ns:netconf:base:1.0\">
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
</netconf:rpc>]]>]]>\r"; send_user "\nB_${JOB_ID}_1 [clock format [clock seconds]]\n"

expect {
    "<ok/>\r
</rpc-reply>]]>]]>" { }
    "  </rpc-error>\r
</rpc-reply>]]>]]>" { send_user "\nCreate subscription failed at create backup\n" }
    timeout { send_user "\nTimedout in create subscription response\n";close_session ${JOB_ID}; exit 1 }
}

#--------------------------------------------------------------------------------------------------
# Create backup action
#--------------------------------------------------------------------------------------------------

proc validate_create { a b c d e } {
   if { $a == true && $b == true && $c == true && $d == true && $e ==true } {
       puts "Backup creation successful" } else {
       puts "Status createreply-$a objectcreated-$b lastcreated-$c finished-$d brmbackupcomplete-$e"
       exp_continue
   }
}

set timeout $CREATE_BACKUP_TIMEOUT
set createreply true
set objectcreated false
set lastcreated true
set finished false
set brmbackupcomplete false

send "<rpc message-id=\"B_${JOB_ID}_2\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">
  <action xmlns=\"urn:com:ericsson:ecim:1.0\">
    <data>
      <ManagedElement xmlns=\"urn:com:ericsson:ecim:ComTop\">
        <managedElementId>${NODE_NAME}</managedElementId>
        <SystemFunctions xmlns=\"urn:com:ericsson:ecim:ComTop\">
          <systemFunctionsId>1</systemFunctionsId>
          <BrM xmlns=\"urn:com:ericsson:ecim:RcsBrM\">
            <brMId>1</brMId>
            <BrmBackupManager xmlns=\"urn:com:ericsson:ecim:RcsBrM\">
               <brmBackupManagerId>1</brmBackupManagerId>
               <createBackup>
                 <name>${TEST_BACKUP_NAME}</name>
               </createBackup>
            </BrmBackupManager>
          </BrM>
        </SystemFunctions>
      </ManagedElement>
    </data>
  </action>
</rpc>]]>]]>]]\r"; send_user "\nB_${JOB_ID}_2 [clock format [clock seconds]]\n"

expect {

        "</rpc-error>\r
</rpc-reply>]]>]]>" { send_user "\nCreate backup action failed\n"; exit 1 }

#    "</data>\r
</rpc-reply>]]>]]>" { set createreply true; validate_create $createreply $objectcreated $lastcreated $finished $brmbackupcomplete  }

   -re  "<notification xmlns(.*?)>(.*?)<objectCreated dn=\"ManagedElement=${NODE_NAME},SystemFunctions=1,BrM=1,BrmBackupManager=1,BrmBackup=(.*?)\">(.*?)</notification>" { regexp "<objectCreated dn=\"ManagedElement=${NODE_NAME},SystemFunctions=1,BrM=1,BrmBackupManager=1,BrmBackup=(.*?)\">" $expect_out(0,string) match id; set BACKUP_ID $id; set objectcreated true; validate_create $createreply $objectcreated $lastcreated $finished $brmbackupcomplete }

#   -re  "<notification xmlns(.*?)<attr name=\"lastCreatedBackup\">(.*?)</notification>" { set lastcreated true; validate_create $createreply $objectcreated $lastcreated $finished $brmbackupcomplete }

   -re  "<notification xmlns(.*?)<elem name=\"progressInfo\">(.*?)<v>CREATE started; action succeeded</v>(.*?)</elem>(.*?)<elem name=\"progressPercentage\">(.*?)<v>100</v>(.*?)</elem>(.*?)<elem name=\"result\">(.*?)<v>SUCCESS</v>(.*?)</elem>(.*?)<elem name=\"state\">(.*?)<v>FINISHED</v>(.*?)</notification>" { set finished true; validate_create $createreply $objectcreated $lastcreated $finished $brmbackupcomplete }

   -re  "<notification xmlns(.*?)<attr name=\"status\">(.*?)<v>BRM_BACKUP_COMPLETE</v>(.*?)</attr>(.*?)</notification>" { set brmbackupcomplete true; validate_create $createreply $objectcreated $lastcreated $finished $brmbackupcomplete  }

   -re  FAILURE { send_user "\nCreate backup failed\n" }

        timeout { send_user "\nTimedout in create backup action\n"; close_session ${JOB_ID}; exit 1}
}

#--------------------------------------------------------------------------------------------------
# Export backup action
#--------------------------------------------------------------------------------------------------

proc validate_export { a b c } {
   if { $a == true && $b == true && $c == true } {
       puts "Export action successful" } else {
       exp_continue
   }
}

set timeout $EXPORT_BACKUP_TIMEOUT
set exportreply false
set lastexported false
set exportfinished false

send "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<rpc message-id=\"B_${JOB_ID}_3\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">
<action xmlns=\"urn:com:ericsson:ecim:1.0\">
<data>
<ManagedElement xmlns=\"urn:com:ericsson:ecim:ComTop\">
<managedElementId>${NODE_NAME}</managedElementId>
<SystemFunctions>
<systemFunctionsId>1</systemFunctionsId>
<BrM xmlns=\"urn:com:ericsson:ecim:RcsBrM\">
<brMId>1</brMId>
<BrmBackupManager xmlns=\"urn:com:ericsson:ecim:RcsBrM\">
<brmBackupManagerId>1</brmBackupManagerId>
<BrmBackup xmlns=\"urn:com:ericsson:ecim:RcsBrM\">
<brmBackupId>${BACKUP_ID}</brmBackupId>
<export>
<uri>${CREATE_BACKUP_URI}</uri>
<password>${PASSWORD}</password>
</export>
</BrmBackup>
</BrmBackupManager>
</BrM>
</SystemFunctions>
</ManagedElement>
</data>
</action>
</rpc>]]>]]>]]\r"; send_user "\nB_${JOB_ID}_3 [clock format [clock seconds]]\n"

expect {
        "</rpc-error>\r
</rpc-reply>]]>]]>" { send_user "\nExport action failed\n"; exit 1 }

    "</data>\r
</rpc-reply>]]>]]>" { set exportreply true; validate_export $exportreply $lastexported $exportfinished }

    -re "<notification xmlns(.*?)<attr name=\"lastExportedBackup\">(.*?)</notification>" { set lastexported true; validate_export $exportreply $lastexported $exportfinished }

    -re "<notification xmlns(.*?)<elem name=\"progressInfo\">(.*?)<v>FINISHED</v>(.*?)</elem>(.*)<elem name=\"progressPercentage\">(.*?)<v>100</v>(.*?)<elem name=\"result\">(.*?)<v>SUCCESS</v>(.*?)<elem name=\"state\">(.*?)<v>FINISHED</v>(.*?)</notification>" { set exportfinished true; validate_export $exportreply $lastexported $exportfinished }

    -re FAILURE { send_user "\n Export action failed\n" }

     timeout { send_user "\nTimedout in receiving the FINISHED state in export action\n";close_session ${JOB_ID};exit 1}
}

#--------------------------------------------------------------------------------------------------
# Delete backup action
#--------------------------------------------------------------------------------------------------

proc validate_delete { a b c } {
   if { $a == true && $b == true && $c == true } {
       puts "Delete action successful" } else {
       puts "Status  deletereply-$a objectdeleted-$b deletefinished-$c"
       exp_continue
   }
}

set deletereply false
set objectdeleted false
set deletefinished false

send "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<rpc message-id=\"B_${JOB_ID}_4\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">
  <action xmlns=\"urn:com:ericsson:ecim:1.0\">
    <data>
      <ManagedElement xmlns=\"urn:com:ericsson:ecim:ComTop\">
        <managedElementId>${NODE_NAME}</managedElementId>
        <SystemFunctions xmlns=\"urn:com:ericsson:ecim:ComTop\">
          <systemFunctionsId>1</systemFunctionsId>
          <BrM xmlns=\"urn:com:ericsson:ecim:RcsBrM\">
            <brMId>1</brMId>
            <BrmBackupManager xmlns=\"urn:com:ericsson:ecim:RcsBrM\">
               <brmBackupManagerId>1</brmBackupManagerId>
               <deleteBackup>
                 <name>${TEST_BACKUP_NAME}</name>
               </deleteBackup>
            </BrmBackupManager>
          </BrM>
        </SystemFunctions>
      </ManagedElement>
    </data>
  </action>
</rpc>]]>]]>]]\r"; ; send_user "\nB_${JOB_ID}_4 [clock format [clock seconds]]\n"

expect {

    "</rpc-error>\r
</rpc-reply>]]>]]>" { send_user "\nDelete action failed\n"; exit 1 }

        "</data>\r
</rpc-reply>]]>]]>" { set deletereply true ; validate_delete $deletereply $objectdeleted $deletefinished   }

    -re "<notification xmlns(.*?)<elem name=\"progressInfo\">(.*?)<v>DELETE started; action succeeded</v>(.*?)</elem>(.*)<elem name=\"progressPercentage\">(.*?)<v>100</v>(.*?)<elem name=\"result\">(.*?)<v>SUCCESS</v>(.*?)<elem name=\"state\">(.*?)<v>FINISHED</v>(.*?)</notification>" { set deletefinished true; validate_delete $deletereply $objectdeleted $deletefinished }

    -re "<notification xmlns(.*?)<objectDeleted(.*?)</notification>" { set objectdeleted true; validate_delete $deletereply $objectdeleted $deletefinished }

    -re FAILURE { send_user "\nDelete action failed\n" }

        timeout { send_user "\nTimedout in delete action\n"; close_session ${JOB_ID}; exit 1}

}

#----------------------------------------------------------------------------------------
#close the current session
#----------------------------------------------------------------------------------------
close_session ${JOB_ID}

EOF

Result=$?
EndTime=`date +%s%3N`
StartTime1=`expr $StartTime / 1000`
StartTimeFormat=`date -d @$StartTime1`
EndTime1=`expr $EndTime / 1000`
EndTimeFormat=`date -d @$EndTime1`
Diff=`expr $EndTime - $StartTime`
echo "${NODE_NAME} $StartTime:::$StartTimeFormat $EndTime:::$EndTimeFormat $Diff"  >> backupstats.log

if [[ $Result -ne 0 ]]
then
     echo "Backup action failed"
     exit 1
else
     echo "Backup action completed successfully"
fi
