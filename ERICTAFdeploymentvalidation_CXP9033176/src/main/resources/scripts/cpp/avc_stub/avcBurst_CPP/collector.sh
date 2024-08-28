#!/bin/bash
#===================================================================================
#
# FILE: collector.sh
#
# USAGE: sh collector.sh <JOB_ID> <NE_COUNT> <SIM_NODE_NAME>
#
# DESCRIPTION: Generates a file containing details of NEs present in the current server.
#              Output File will be <JOB_ID>.job
#
# NOTES: ---
# AUTHOR: ZPALSRI(srihari.palivela@tcs.com)
# VERSION: 1.0
# CREATED: 15.03.2018 
#
#===================================================================================

# Validate Commandline Args
if [[ $# -ne 3 ]];then
	echo "Invalid Parameters"
	echo "Usage : sh $0 <JOB_ID> <NE_COUNT> <SIM_NODE_NAME>
	EX: <SIM_NODE_NAME> will be LTEJ1160-lim for LTEJ1160-limx80-60K-FDD-LTE04 and LTEJ1160-limx80-60K-FDD-LTE03 Simulations"
	exit 1
fi


JOB_ID=$1
NE_COUNT=$2
SIM_NODE_NAME=$3
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

#----------------------------------------------------------------------
# Fetch all simulations and loop over each simulation to fetch 
# details of each NE
#----------------------------------------------------------------------

# Fetch all sims
COUNT=0
echo -e ".show simulations\n"|~/inst/netsim_shell >  $ALL_SIMS 

# Loop over each simulation 
while  read -r SIM && [[ $COUNT -lt $NE_COUNT ]] ;
do
    if [[ $SIM == *"$SIM_NODE_NAME"* ]];then
	#Get all NEs of simulation
        echo ".open" $SIM >> $TMP_FILE
        echo ".show simnes" >> $TMP_FILE
        ~/inst/netsim_shell < $TMP_FILE > $SIM_FILE
        rm -rf $TMP_FILE
	
	# Loop over Each NE and extract details
        while read -r LINE && [[ $COUNT -lt $NE_COUNT ]]; do
            if [[ $LINE == *"NE Name"* ]];then
                continue
            elif [[ $LINE == *">>"* ]];then
                continue
            elif [[ $LINE == *"OK"* ]];then
                continue
            elif [[ $LINE == *"O&M"* ]];then
                continue
            elif [[ $LINE == *"Error"* ]];then
                continue
	    elif [[ $LINE == *"RANOS"* ]];then
		continue
            else
                NE=$(echo $LINE | awk '{print $1}')
                NEIP=$(echo $LINE | awk '{print $6}')
                
		# Check if node is IPV4 
		# As openssl for IPV6 didn't worked (Can be removed if found working)
		if ! [[ $NEIP =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]];then
                    continue
                fi

		# Check if node is TLS enabled
                echo $LINE | grep TLS > /dev/null
                TLS=$?
                    echo -e ".open "$SIM"\n.select "$NE"\ndumpmotree:count;\n" | ~/inst/netsim_shell |tee $TMP_FILE
                    MOCOUNT=$(tail -2 $TMP_FILE | head -1)
                    if [[ $LINE = *[!\ ]* ]]; then
                        echo $NE $NEIP $TLS $MOCOUNT $SIM >> $JOB_DETAILS_FILE
                        COUNT=`expr $COUNT + 1`
                    fi
            fi
        done < "$SIM_FILE"
    fi
done < "$ALL_SIMS"

#----------------------------------------------------------------------
# Intermediate Files Cleanup
#----------------------------------------------------------------------
rm -rf $ALL_SIMS
rm -rf $SIM_FILE
rm -rf $TMP_FILE



