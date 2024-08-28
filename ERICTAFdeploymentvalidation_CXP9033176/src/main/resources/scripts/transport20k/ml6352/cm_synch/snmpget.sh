NUM_NODES=$1
`cat nodeips.txt | head -n $NUM_NODES > selectednodes.txt`
   while read -r SIM_NAME NODE_NAME NODE_IP AGENT_PORT COMMUNITY;
   do
        #COMMUNITY=$(echo $COMMUNITY | awk -F"," '{print $2}')
        sh ind_snmpget.sh $NODE_NAME $NODE_IP $AGENT_PORT $COMMUNITY &
    done < selectednodes.txt
