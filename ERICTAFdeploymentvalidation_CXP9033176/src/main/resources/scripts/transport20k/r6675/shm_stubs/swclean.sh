#!/bin/bash

####################################################################################################
#
# FileName: swclean.sh
# Authour: Malla Goutham
# Description: Script to delete the previously created Upgrade MO
# Syntax: ./swclean.sh <NODE_NAME> <NODE_IP> <PROTOCOL> <JOB ID>
#
####################################################################################################

# Load the default parameters from the config file
. conf.txt

NODE_NAME=$1
NODE_IP=$2
PROTOCOL=$3
JOB_ID=$4

/usr/bin/expect - << "EOF" $NODE_NAME $NODE_IP $TLS_PORT "$PACKAGE_NAME" $PROTOCOL $SSH_PORT $JOB_ID

set NODE_NAME [lindex $argv 0]
set NODE_IP [lindex $argv 1]
set TLS_PORT [lindex $argv 2]
set PACKAGE_NAME [lindex $argv 3]
set PROTOCOL [lindex $argv 4]
set SSH_PORT [lindex $argv 5]
set JOB_ID [lindex $argv 6]
set timeout 600

#---------------------------------------------------------------------------------------------------
# Sub routine to close the netconf session
#---------------------------------------------------------------------------------------------------
proc close_session { JOB_ID } {
    send "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
        <rpc message-id=\"D_${JOB_ID}_4\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">
            <close-session/>
        </rpc>]]>]]>\r"; send_user "\nD_${JOB_ID}_4 [clock format [clock seconds]]\n"
    expect {
    "</rpc-reply>]]>]]>" {}
    }
}

#---------------------------------------------------------------------------------------------------
# SSH/TLS Connection to the node
#---------------------------------------------------------------------------------------------------
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

#---------------------------------------------------------------------------------------------------
# Create subscription
#---------------------------------------------------------------------------------------------------
send "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
 <netconf:rpc message-id=\"D_${JOB_ID}_1\" xmlns:netconf=\"urn:ietf:params:xml:ns:netconf:base:1.0\">
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
</netconf:rpc>]]>]]>\r"; send_user "\nD_${JOB_ID}_1 [clock format [clock seconds]]\n"

expect {
    "<ok/>\r
</rpc-reply>]]>]]>" { }
    "  </rpc-error>\r
</rpc-reply>]]>]]>" { send_user "\nCreate subscription failed at create upgrade\n" }
    timeout { send_user "\nTimedout in create subscription response\n";close_session ${JOB_ID};exit 1 }
}

#---------------------------------------------------------------------------------------------------
# Delete the previously created upgrade package MO
#---------------------------------------------------------------------------------------------------
send "<rpc message-id=\"D_${JOB_ID}_2\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">
    <edit-config>
        <target>
            <running/>
        </target>
        <config>
        <ManagedElement xmlns=\"urn:com:ericsson:ecim:ComTop\">
                <managedElementId>${NODE_NAME}</managedElementId>
            <SystemFunctions xmlns=\"urn:com:ericsson:ecim:ComTop\">
                <systemFunctionsId>1</systemFunctionsId>
                <SwM xmlns=\"urn:com:ericsson:ecim:RcsSwM\">                                                                     <swMId>1</swMId>
                <UpgradePackage operation=\"delete\">
                            <upgradePackageId>${PACKAGE_NAME}</upgradePackageId>
                </UpgradePackage>
                    </SwM>
                </SystemFunctions>
        </ManagedElement>
        </config>
    </edit-config>
</rpc>]]>]]>\r"; send_user "\nD_${JOB_ID}_2 [clock format [clock seconds]]\n"


expect {
"<ok/>\r
</rpc-reply>]]>]]>" { send_user "\nDelete package successfull\n" }
"</rpc-error>\r
</rpc-reply>]]>]]>" { send_user "\nDelete package failed\n" }
}

#---------------------------------------------------------------------------------------------------
# Close the session to commit the above changes
#---------------------------------------------------------------------------------------------------
close_session ${JOB_ID}

EOF

/usr/bin/expect - << "EOF" $NODE_NAME $NODE_IP $TLS_PORT "$PACKAGE_NAME" $PROTOCOL $SSH_PORT $JOB_ID

set NODE_NAME [lindex $argv 0]
set NODE_IP [lindex $argv 1]
set TLS_PORT [lindex $argv 2]
set PACKAGE_NAME [lindex $argv 3]
set PROTOCOL [lindex $argv 4]
set SSH_PORT [lindex $argv 5]
set JOB_ID [lindex $argv 6]

#---------------------------------------------------------------------------------------------------
# Sub routine to close the netconf session
#---------------------------------------------------------------------------------------------------
proc close_session { JOB_ID } {
    send "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
        <rpc message-id=\"D_${JOB_ID}_5\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">
            <close-session/>
        </rpc>]]>]]>\r"; send_user "\nD_${JOB_ID}_5 [clock format [clock seconds]]\n"
    expect {
    "</rpc-reply>]]>]]>" {}
    }
}

#---------------------------------------------------------------------------------------------------
# SSH/TLS connection to the node
#---------------------------------------------------------------------------------------------------
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

#---------------------------------------------------------------------------------------------------
# Check whether the MO deleted in the previous session
#---------------------------------------------------------------------------------------------------
send "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<rpc message-id=\"D_${JOB_ID}_3\" xmlns=\"urn:ietf:params:xml:ns:netconf:base:1.0\">
  <get>
    <filter type=\"subtree\">
      <ManagedElement xmlns=\"urn:com:ericsson:ecim:ComTop\">
        <managedElementId>${NODE_NAME}</managedElementId>
            <SystemFunctions><systemFunctionsId>1</systemFunctionsId>
                <SwM xmlns=\"urn:com:ericsson:ecim:RcsSwM\">
                    <swMId>1</swMId>
                        <UpgradePackage>
                            <upgradePackageId>${PACKAGE_NAME}</upgradePackageId>
                        </UpgradePackage>
                </SwM>
            </SystemFunctions>
        </ManagedElement>
    </filter>
  </get>
</rpc>]]>]]>\r"; send_user "\nD_${JOB_ID}_3 [clock format [clock seconds]]\n"

expect {
"</rpc-error>\r
</rpc-reply>]]>]]>" { send_user "\nMo not present\n"}
"</data>\r
</rpc-reply>]]>]]>" {send_user "\nMO still present\n"; close_session ${JOB_ID}; exit 1}
timeout {send_user "\nTimedout in fetching the MO details\n"; close_session ${JOB_ID}; exit 1}
}

#---------------------------------------------------------------------------------------------------
# Close the netconf session
#---------------------------------------------------------------------------------------------------

close_session ${JOB_ID}

EOF
