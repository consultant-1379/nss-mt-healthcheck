#function get_pm_counters ()
#NUM_NODES=$1
##{
#    `cat nodeips.txt | head -n $NUM_NODES > selectednodes.txt`
#    while read -r SIM_NAME NODE_NAME NODE_IP AGENT_PORT COMMUNITY;
#    do
#        COMMUNITY=$(echo $COMMUNITY | awk -F"," '{print $2}')
#        snmpget $NODE_NAME $NODE_IP $AGENT_PORT $COMMUNITY
#    done < selectednodes.txt
#    parallel_wait
#    parallel_status
##}
#
#function snmpget ()
#{
#    LOG_FILE=snmpget_${NODE_NAME}.log
#    STATUS_HEADER=snmpget_${NODE_NAME}
#    (
#    (
#        echo "Running the function ind_snmpget_${NODE_NAME}"
#        sh ind_snmpget.sh ${NODE_NAME} ${NODE_IP} ${AGENT_PORT} ${COMMUNITY}
#    ) > $LOG_FILE 2>&1; parallel_finish
#    ) & set_parallel_variables
#}
NUM_NODES=$1
`cat nodeips.txt | head -n $NUM_NODES > selectednodes.txt`
   while read -r SIM_NAME NODE_NAME NODE_IP AGENT_PORT COMMUNITY;
   do
       # COMMUNITY=$(echo $COMMUNITY | awk -F"," '{print $2}')
        sh ind_snmpget.sh $NODE_NAME $NODE_IP $AGENT_PORT $COMMUNITY &
    done < selectednodes.txt
