#!/bin/bash
#===================================================================================
#
# FILE: collector.sh
#
# USAGE: sh collector.sh <JOB_ID> <NE_COUNT>
#
# DESCRIPTION: Generates a file containing details of NEs present in the current server.
#              Output File will be <JOB_ID>.job
#              which has to be fed into trigger.sh to trigger fullsync on given number
# 	       of nodes
#
# NOTES: ---
# AUTHOR: ZPALSRI(srihari.palivela@tcs.com)
# VERSION: 1.0
# CREATED: 15.03.2018 
#
#===================================================================================

# Validate Commandline Args
if [[ $# -ne 0 ]];then
	echo "Invalid Parameters"
	echo "Usage : sh $0 "
	exit 1
fi


JOB_ID="allNodes"
ALL_SIMS="allsims.txt"
SIM_FILE="simfile.txt"
TMP_FILE="tmp.txt"

#----------------------------------------------------------------------
# Precheck for files
#----------------------------------------------------------------------
JOB_DETAILS_FILE=${JOB_ID}.job
if [[ -f ${JOB_DETAILS_FILE} ]];then
    rm -f ${JOB_DETAILS_FILE}
fi


sh getNodes.sh temp.job


# FOR RV SPITFIRE, a static respose will be sent for full get
# Static File : /home/xnetgar/cvscheckout/YANG/response-files/SpitFire_17A/get_response_yang.xml

MOCOUNT=4514

while  read -r line;
do
                NE=$(echo $line | awk '{print $1}')
		NEIP=$(echo $line | awk '{print $2}')
		SIM=$(echo $line | awk '{print $3}')
                
		# Check if node is IPV4 
		# As openssl for IPV6 didn't worked (Can be removed if found working)
		if ! [[ $NEIP =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]];then
                    continue
                fi
		echo $line
                echo -e ".open "${SIM}"\n.select "${NE}"\ndumpmotree:count;\n" | ~/inst/netsim_shell |tee ${TMP_FILE}
                MOCOUNT=$(tail -2 $TMP_FILE | head -1)
                        echo $line $MOCOUNT >> ${JOB_DETAILS_FILE}
            
        done < temp.job

#----------------------------------------------------------------------
# Intermediate Files Cleanup
#----------------------------------------------------------------------
rm -rf temp.job
rm -rf $ALL_SIMS
rm -rf $SIM_FILE
rm -rf $TMP_FILE



