 #!/bin/bash

 allureReport=$1
 JobType=$2
 ClusterId=$3
 NetworkElement=$4
 
 
 mkdir -p logCollector
 cd logCollector
 rm -rf *
 WORKSPACE=`pwd`

 #Check if the vapp given is available or not
 if [ ! -z "$ClusterId" ] &&  [[ ${ClusterId} = *"vts"* ]]; then 
     sshpass -p shroot ssh -q -o StrictHostKeyChecking=no root@$ClusterId || { echo "Unfortunately, the input vApp which is given is down. Please provide a vApp which is online." && exit 1; }
 fi

 #Downloading the required jq packages
 curl -s -O "https://arm901-eiffel004.athtem.eei.ericsson.se:8443/nexus/service/local/repositories/nss/content/com/ericsson/nss/scripts/jq/1.0.1/jq-1.0.1.tar"  
 tar -xvf jq-1.0.1.tar > /dev/null
 chmod +x ./jq 

 if [ -z "$NetworkElement" ]; then 

     #Suppressing the echo statements in Console
     set +x

     #Getting the xunit and widgets .json content
     allure1=`echo $allureReport | sed 's/#\//data\/xunit.json/'`
     allure=`echo $allureReport | sed 's/#\//data\/widgets.json/'`

     #Downloading the xunit and json allure files.
     wget --quiet $allure1 
     wget --quiet $allure 

     #Getting the start and stop time information of the test suites from xunit.json file
     start=$(./jq --raw-output '.time.start' xunit.json)
     stop=$(./jq --raw-output '.time.stop' xunit.json)
     #echo $nooftotalsuites $noofpassedsuites $passrate

     #Download the logcollection.py file from Nexus
     curl -s --retry 5 -fsS "https://arm901-eiffel004.athtem.eei.ericsson.se:8443/nexus/content/repositories/nss/com/ericsson/nss/NSS_Configuration/CollectENMLogs/logcollection/1.0.1/logcollection-1.0.1.py" -o logcollection.py

     #Get the start and stop times of the allure link passed from the logcollection.py script
     startTime=$(python logcollection.py time $start)
     stopTime=$(python logcollection.py time $stop)
     #echo "startTime=$startTime"
     #echo "stopTime=$stopTime"

     #Getting the ISO and ClusterId values from the widgets.json file
     ISO=$( ./jq --raw-output '.data[] | select (.name == "environment") | (.data[]) | select( .key == "ISO version") | (.value)' widgets.json )
     clusterIdDetails=$(grep -q -oh -E "ieatenm[[:alnum:]]+ | uniq | xargs" widgets.json && echo Openstack || echo Physical)

     if [ "$clusterIdDetails" == "Physical" ]; then

         clusterId=$(./jq --raw-output '.data[] | select (.name == "environment") | (.data[]) | select( .key == "Test environment cluster ID") | (.value)' widgets.json)

         #Get the MS_IP from the clusterId obtained from above
         MS_IP=`wget -q -O - --no-check-certificate "https://cifwk-oss.lmera.ericsson.se/generateTAFHostPropertiesJSON/?clusterId=$clusterId&tunnel=true" | awk -F',' '{print $1}' | awk -F':' '{print $2}' | sed -e "s/\"//g" -e "s/ //g"`>/dev/null 
         echo "The MS_IP is $MS_IP"

         #Get the active Netsim vfarms and store it in a variable Netsims
         curl -s --request GET "https://cifwk-oss.lmera.ericsson.se/generateTAFHostPropertiesJSON/?clusterId=${clusterId}&tunnel=true&pretty=true&allNetsims=true" > Netsims.json
         Netsims=$(./jq --raw-output '.[] | select (.type == "netsim" and .status == "active") | (.hostname)' Netsims.json)

         #Collect the logs from cmserv,fmserv,pmserv,mscm,mscmce services and copy to LMS of the cluster Id in /var/tmp/collectedNSSMTLogs path
         functions="cmserv,fmserv,mscm,mscmce,pmserv"
         curl -s --retry 5 -fsS "https://arm901-eiffel004.athtem.eei.ericsson.se:8443/nexus/content/repositories/nss/com/ericsson/nss/NSS_Configuration/CollectENMLogs/collectLogs/1.0.15/collectLogs-1.0.15.sh" -o collectLogs.sh
         curl -s --retry 5 -k -fsS -T collectLogs.sh -u root:12shroot scp://$MS_IP/var/tmp/collectLogs.sh || { echo "Why so serious. Call the NSS-MT Team to turn that frown upside down. They will investigate why collectLogs.sh was not copied successfully" && exit 1; }

         #Run collectlogs to copy logs from enm side to MS_IP
         sshpass -p 12shroot ssh -q -o StrictHostKeyChecking=no root@$MS_IP "chmod +x /var/tmp/collectLogs.sh; /var/tmp/collectLogs.sh $clusterId $MS_IP \"$functions\" \"$startTime\" \"$stopTime\"  &> /dev/null " || { echo "Why so serious. Call the NSS-MT Team and they will investigate why Collection of logs" && exit 1; }
         sshpass -p 12shroot ssh  -q -o StrictHostKeyChecking=no root@$MS_IP  "curl https://arm901-eiffel004.athtem.eei.ericsson.se:8443/nexus/content/repositories/nss/com/ericsson/nss/sshtest/1.0.3/sshtest-1.0.3.sh -o sshtest.sh"
         sshpass -p 12shroot ssh  -q -o StrictHostKeyChecking=no root@$MS_IP  "curl https://arm901-eiffel004.athtem.eei.ericsson.se:8443/nexus/content/repositories/nss/com/ericsson/nss/sftptest/1.0.2/sftptest-1.0.2.sh -o sftptest.sh"

         #Get LVF_IP
         LVF_IP=$(sshpass -p 12shroot ssh -q root@$MS_IP cat /ericsson/tor/data/global.properties | grep -w lvsrouter_service_IPs | awk -F"=" '{print $2}' | awk -F"," '{print $1}')
		 echo "LVF_IP is $LVF_IP"
         sshpass -p 12shroot ssh -4 -n -T -q -o StrictHostKeyChecking=no root@$MS_IP -t ssh -4 -q -i /root/.ssh/vm_private_key cloud-user@$LVF_IP "curl https://arm901-eiffel004.athtem.eei.ericsson.se:8443/nexus/content/repositories/nss/com/ericsson/nss/sshtest/1.0.3/sshtest-1.0.3.sh -o sshtest.sh"
         sshpass -p 12shroot ssh -4 -n -T -q -o StrictHostKeyChecking=no root@$MS_IP -t ssh -4 -q -i /root/.ssh/vm_private_key cloud-user@$LVF_IP "curl https://arm901-eiffel004.athtem.eei.ericsson.se:8443/nexus/content/repositories/nss/com/ericsson/nss/sftptest/1.0.1/sftptest-1.0.1.sh -o sftptest.sh"
		 
		 sshpass -p 12shroot ssh -4 -n -T -q -o StrictHostKeyChecking=no root@$MS_IP -t ssh -4 -q -i /root/.ssh/vm_private_key cloud-user@$LVF_IP "curl https://arm901-eiffel004.athtem.eei.ericsson.se:8443/nexus/content/repositories/nss/com/ericsson/nss/pingtest/1.0.1/pingtest-1.0.1.sh -o pingtest.sh"
		 

         #echo "LVF_IP is $LVF_IP"

     fi

     if [ "$clusterIdDetails" == "Openstack" ]; then

         #get clusterId,netsim and MSIP details of openstack
         clusterId=$(grep -oh -E 'ieatenm[[:alnum:]]+ | uniq | xargs' widgets.json)
         wget --quiet https://atvdit.athtem.eei.ericsson.se/api/deployments?q=name=${clusterId} -O file
         file2=$(./jq --raw-output '.[].documents[] |  select( .schema_name == "netsim") |.document_id' file | sed "s/\"//g")
         wget --quiet https://atvdit.athtem.eei.ericsson.se/api/documents/$file2 -O file3
         Netsims=$(./jq --raw-output  '.content.vm[].hostname' file3)
         file4=$(./jq --raw-output '.[].documents[] |  select( .schema_name == "workload") |.document_id' file | sed "s/\"//g")
         wget --quiet https://atvdit.athtem.eei.ericsson.se/api/documents/$file4 -O file5
         WL_VM=$(./jq --raw-output '.content.vm[].ip' file5)
         MS_IP=$WL_VM

         echo The Netsimboxes are $Netsims
         echo The MS_IP is $MS_IP

         curl -s -X GET "https://atvdit.athtem.eei.ericsson.se/api/deployments"  -H "accept: application/json"  > deployments.json
         sedid=`./jq -r --arg var $clusterId '.[] | select(."name"== $var ) | (.enm.sed_id)' deployments.json |  sed 's/"//g'`
         curl -s --request GET "https://atvdit.athtem.eei.ericsson.se/api/documents" -H "accept: application/json" > a.json
         LAF_IP=`./jq -r --arg var1 $sedid '.[] | select(."_id"== $var1 ) | (.content.parameters.enm_laf_1_ip_external)' a.json |  sed 's/"//g'` 

         echo "enm_laf IP address is =$LAF_IP"

         wget --quiet https://arm901-eiffel004.athtem.eei.ericsson.se:8443/nexus/content/repositories/nss/com/ericsson/nss/logcollection/1.0.1/logcollection-1.0.1.sh -O collectLogs.sh
         sshpass -p N3wP@55w0rd scp -q collectLogs.sh cloud-user@$LAF_IP:/home/cloud-user/
         sshpass -p N3wP@55w0rd ssh -n -q -o StrictHostKeyChecking=no cloud-user@$LAF_IP "chmod +x /home/cloud-user/collectLogs.sh; sh /home/cloud-user/collectLogs.sh  \"$startTime\" \"$stopTime\"  &> /dev/null " || { echo "Why so serious. Call the NSS-MT Team and they will investigate why Collection of logs is not copied" && exit 1; }


         wget --quiet https://atvdit.athtem.eei.ericsson.se/api/documents/$sedid -O file6
         LVS_IP=$(./jq --raw-output '.content.parameters.lvsrouter_external_ip_list' file6 | awk -F"," '{print $1}')

         echo The LVS_IP is $LVS_IP

         sshpass -p N3wP@55w0rd ssh -4 -n -T -q -o StrictHostKeyChecking=no cloud-user@$LAF_IP -t sudo ssh -4 -o StrictHostKeyChecking=no -q -i /var/tmp/pem_key/*.pem  cloud-user@$LVS_IP "curl https://arm901-eiffel004.athtem.eei.ericsson.se:8443/nexus/content/repositories/nss/com/ericsson/nss/sshtest/1.0.3/sshtest-1.0.3.sh -o sshtest.sh"
         sshpass -p N3wP@55w0rd ssh -4 -n -T -q -o StrictHostKeyChecking=no cloud-user@$LAF_IP -t sudo ssh -4 -o StrictHostKeyChecking=no -q -i /var/tmp/pem_key/*.pem  cloud-user@$LVS_IP "curl https://arm901-eiffel004.athtem.eei.ericsson.se:8443/nexus/content/repositories/nss/com/ericsson/nss/sftptest/1.0.2/sftptest-1.0.2.sh -o sftptest.sh"
		 
		 sshpass -p N3wP@55w0rd ssh -4 -n -T -q -o StrictHostKeyChecking=no cloud-user@$LAF_IP -t sudo ssh -4 -o StrictHostKeyChecking=no -q -i /var/tmp/pem_key/*.pem  cloud-user@$LVS_IP "curl https://arm901-eiffel004.athtem.eei.ericsson.se:8443/nexus/content/repositories/nss/com/ericsson/nss/pingtest/1.0.1/pingtest-1.0.1.sh -o pingtest.sh"

     fi

     #echo "The ISO value is $ISO"
     #echo "The ClusterID value is $clusterIdDetails"
     #echo "Netsims is $Netsims"
     #echo "The MS_IP is $MS_IP"

     #Get the full suite names of the failing suites in RFA250 from xunit.json
     ./jq --raw-output '.testSuites[] | select( .statistic.failed != 0 or .statistic.pending != 0 or .statistic.canceled != 0 or .statistic.broken != 0) | (.name)' xunit.json | sort > nssmtfailedsuites

     #Get all the log files information from allure link
     alluremain=$(echo $allureReport | sed "s/#\///g")
     wget --quiet $alluremain/data/jenkins-logs.json -O logofalltestsuites
     cat logofalltestsuites | grep "name" | cut -d":" -f 2 | sed "s/^ //g" | sed 's/,//g ; s/"//g' > logofallsuitenames

     #This is used to get the node details of the failing test suites
     while read suites
     do
         emptyornot=$(curl -s $alluremain/te-console-logs/$suites | grep "Finished: FAILURE" | wc -c )
         if [ "$emptyornot" -ne "0" ]; then 
             wget --quiet $alluremain/te-console-logs/$suites
             grep -Po 'Network Element \K[^ ]+ | networkElementId=\K[^ ]+' $suites  | tr -d '[]'| tr -d '"'| cut -d , -f 1 | sort | uniq  > ${suites}nodes
             #if [ -s ${suites}nodes ]; then continue; fi
             sed -i '/^$/d' ${suites}nodes
             mv ${suites}nodes test
             #This is used to get the failing suite's node, netsimbox and its IP Details and push it in a file
             while read x
             do
                 for server in ${Netsims//,/ }
             do
                 Ip=$(sshpass -p netsim ssh -n -q -o StrictHostKeyChecking=no netsim@${server}.athtem.eei.ericsson.se ' cd /netsim/netsimdir ;cat networkMap.json ' | grep -oh \"name\":\"${x}.*\"type\":  | awk -F\"type\": '{print $1}' | awk -F\"ip\": '{print $2}' | sed 's/,//g;s/"//g')
                 if [ ! "$Ip" ]; then 
                     continue
                 else
                     set +x
                     echo "$x,$server,$Ip" >> ${suites}nodedetails.txt
                     break 
                 fi
             done
         done < test
     fi
 done < logofallsuitenames

 # This is used to get the trs details of vENM and get the number of suites with that particular ISO
 if [ "$clusterIdDetails" == "Physical" ] && [[ "$JobType" == "RFA250" ]]; then
     wget --quiet https://trs.lmera.ericsson.se/api/tvs/jobs/2412b8d4-eb6a-495c-b517-9440fc04b412/test-sessions/csv -O venm.csv
     grep $ISO venm.csv | awk -F"," '{print $16}' >> suiteswithiso.csv
     sed -i "s/^$//g ; s/\"//g" suiteswithiso.csv
 fi

 if [ "$clusterIdDetails" == "Openstack" ] && [[ "$JobType" == "RFA250" ]]; then
     wget --quiet https://trs.lmera.ericsson.se/api/tvs/jobs/2412b8d4-eb6a-495c-b517-9440fc04b412/test-sessions/csv -O venm.csv
     grep $ISO venm.csv | awk -F"," '{print $16}' >> suiteswithiso.csv
     sed -i "s/^$//g ; s/\"//g" suiteswithiso.csv
 fi

 if [ "$JobType" == "Longloop" ]; then
     wget --quiet https://trs.lmera.ericsson.se/api/tvs/jobs/2412b8d4-eb6a-495c-b517-9440fc04b412/test-sessions/csv -O venm.csv
     grep $ISO venm.csv | awk -F"," '{print $16}' >> suiteswithiso.csv
     sed -i "s/^$//g ; s/\"//g" suiteswithiso.csv


 fi


 #Get the allure Links with that particular ISO from ENM side and copy to enmsuitedetails folder in workspace
 i=1
 while read p
 do
     wget --quiet $p/data/jenkins-logs.json -O logofalltestsuites_${i}
     cat logofalltestsuites | grep "name" | cut -d":" -f 2 | sed "s/^ //g" | sed 's/,//g ; s/"//g' > logofallsuitenames_${i}

     wget --quiet $p/data/widgets.json -O widgets.json_${i}
     enmclusterId=$(./jq --raw-output '.data[] | select (.name == "environment") | (.data[]) | select( .key == "Test environment cluster ID") | (.value)' widgets.json_${i})
     if [ $(($enmclusterId)) -eq 0 ];then enmclusterId=$(grep -oh -E 'ieatenm[[:alnum:]]+' widgets.json_${i}) ;  fi

     while read suites
     do
         emptyornot=$(curl -s $p/te-console-logs/$suites | grep "Finished: FAILURE" | wc -c )

         if [ "$emptyornot" -ne "0" ]; then 
             echo $suites::::$p::::$enmclusterId >> enmmtfailingsuites_${i}.details
         fi

     done < logofallsuitenames_${i}

     if [ ! -e enmmtfailingsuites_${i}.details ];then
         touch enmmtfailingsuites_${i}.details
         echo suites::::$p::::$enmclusterId >> enmmtfailingsuites_${i}.details
     fi

     i=$(($i+1))

 done < suiteswithiso.csv

 #echo "###################################################################################################"

 mkdir lognodedetails
 mkdir enmsuitedetails
 mv *.details enmsuitedetails 2>/dev/null
 mv *.txt lognodedetails/ 2>/dev/null
 cd lognodedetails/ 

 #echo "###################################################################################################"

 #Declaring enm logs function here
 enmlogsfunction()
 {

     if [ "$clusterIdDetails" == "Openstack" ]; then

         MS_IP=$1
         Nodename=$2
         ENMoutput=$(sshpass -p N3wP@55w0rd ssh -n -q -o StrictHostKeyChecking=no cloud-user@$LAF_IP "cd /var/tmp/collectedNSSMTLogs ; grep -w -R --no-messages $Nodename * | grep -nr --no-messages 'ERROR' | head -n 30 > diff.txt ; if [[ -s diff.txt ]]; then cat diff.txt ; else echo No errors for the node $Nodename on ENM side  ; fi ; rm -rf diff.txt")
         echo $ENMoutput
         return

     fi

     MS_IP=$1
     Nodename=$2
     ENMoutput=$(sshpass -p 12shroot ssh -n -q -o StrictHostKeyChecking=no root@$MS_IP "cd /var/tmp/collectedNSSMTLogs ; grep -w -R --no-messages $Nodename * | grep -nr --no-messages 'ERROR' | head -n 30 > diff.txt ; if [[ -s diff.txt ]]; then cat diff.txt ; else echo No errors for the node $Nodename on ENM side  ; fi ; rm -rf diff.txt")
     echo $ENMoutput

 }

 #Declaring prmn response function here
 prmnfunction()
 {
     startTime=$1
     stopTime=$2
     Nodename=$3

     startTime1=$(echo $startTime | awk -F " " '{print $2}' | awk -F":" '{print $1}')
     stopTime1=$(echo $stopTime | awk -F " " '{print $2}' | awk -F":" '{print $1}' )

     startTime1=$((10#$startTime1))
     stopTime1=$((10#$stopTime1))

     diff=$((stopTime1-startTime1))
     datenow=$(echo $startTime | awk -F " " '{print $1}' | sed "s/-//g")

     if (( $diff <  1 )); then
         for i in $(seq 1) ; do
             stopTime1=$((10#$stopTime1))
             onehourlater=$(($stopTime1+1))
             twohourslater=$(($stopTime1+2))
             onehourlater1=$(printf %02d $onehourlater)
             twohourlater1=$(printf %02d $twohourslater)
             #echo "twohourslater is $twohourslater and onehourlater1 is $onehourlater1"

             Netsimoutput=$(sshpass -p netsim ssh -n -q -o StrictHostKeyChecking=no netsim@$Netsimbox "cd /netsim/inst/prmnresponse ; grep --no-messages -w $Nodename Prmnresponse_${datenow}_$(($onehourlater1)):00:00-${datenow}_$(($stopTime1+2)):00:00.resp > prmnres.txt ; if [ -e Prmnresponse_${datenow}_$(($onehourlater1)):00:00-${datenow}_$(($twohourlater1)):00:00.resp ] && [ -s prmnres.txt ]; then cat prmnres.txt | head -n 30 ; elif [ ! Prmnresponse_${datenow}_$(($onehourlater1)):00:00-${datenow}_$(($twohourlater1)):00:00.resp ]; then echo -e \"\nPrmnresponse_${datenow}_$(($onehourlater1)):00:00-${datenow}_$(($twohourlater1)):00:00.resp. Please check if rollout is performed on it.\n\" ; else echo -e \"\nPlease run this job after one hour for complete Netsim Logs\n\" ; fi ; rm -rf prmnres.txt")
             echo $Netsimoutput
         done
     fi

     if (( $diff ==  1 )) ; then
         stoplast=$((stopTime1+1))
         for i in $(seq $stopTime1 $stoplast) ; do
             now=$(printf %02d $i)
             j=$((i+1))
             later=$(printf %02d $j)
             Netsimoutput=$(sshpass -p netsim ssh -n -q -o StrictHostKeyChecking=no netsim@$Netsimbox "cd /netsim/inst/prmnresponse ;  grep --no-messages -w $Nodename Prmnresponse_${datenow}_${now}:00:00-${datenow}_${later}:00:00.resp > prmnres.txt ; if [  -e Prmnresponse_${datenow}_${now}:00:00-${datenow}_${later}:00:00.resp ] && [ -s prmnres.txt ]; then cat prmnres.txt | head -n 30 ; elif [ ! -e Prmnresponse_${datenow}_${now}:00:00-${datenow}_${later}:00:00.resp ]; then echo -e \"\nThe file Prmnresponse_${datenow}_${now}:00:00-${datenow}_${later}:00:00.resp is missing. Please check if rollout is performed on it.\n\" ; else echo -e \"\nThere is no netsim response for this $Nodename from netsim side\n\"  ; fi ; rm -rf prmnres.txt " )
             echo $Netsimoutput
         done

     fi

     if (( $diff >  1 )); then
         i=$(printf %02d $i)
         starttimelatest=$(($startTime1+1))
         stoptimelatest=$(($stopTime1+1))
         echo $starttimelatest,$stoptimelatest

         for i in $(seq $starttimelatest $stoptimelatest)
         do
             Netsimoutput=$(sshpass -p netsim ssh -n -q -o StrictHostKeyChecking=no netsim@$Netsimbox "cd /netsim/inst/prmnresponse ;grep --no-messages -w $Nodename Prmnresponse_${datenow}_${i}:00:00-${datenow}_$((i+1)):00:00.resp > prmnres.txt ; if [ -e Prmnresponse_${datenow}_${i}:00:00-${datenow}_$((i+1)):00:00.resp ] && [ -s prmnres.txt ]; then cat prmnres.txt | head -n 30 ; elif [ ! Prmnresponse_${datenow}_$(($stopTime1+1)):00:00-${datenow}_$(($stopTime1+2)):00:00.resp ]; then echo -e \"\nThe file Prmnresponse_${datenow}_${now}:00:00-${datenow}_${later}:00:00.resp is missing. Please check if rollout is performed on it.\n\" ; else echo -e \"\nPlease run this job after one hour for complete Netsim Logs\" ; fi ; rm -rf prmnres.txt")
             echo $Netsimoutput
         done

     fi

 }

 #Check the Infra Network Status
 infranetwork()
 {

     Nodename=$1
     clusterId=$2
     MS_IP=$3
     LVF_IP=$4
     NodeIp=$5

     #echo Nodename is $Nodename
     #echo Clusterid is $clusterId
     #echo MS_IP is $MS_IP
     #echo the LVF_Ip is $LVF_IP
     #echo Nodeip is $NodeIp
     #echo "The clusterIdDetails is $clusterIdDetails"

     if [ "$clusterIdDetails" == "Openstack" ]; then

         echo "################################################################################################"
         echo "####### Pinging $Nodename from ${clusterId}'s LVF Router($LVF_IP)#####"
         echo "################################################################################################"
         pingoutput=$(sshpass -p N3wP@55w0rd ssh -4 -n -T -q -o StrictHostKeyChecking=no cloud-user@$LAF_IP -t sudo ssh -4 -o StrictHostKeyChecking=no -q -i /var/tmp/pem_key/*.pem  cloud-user@$LVS_IP "sh pingtest.sh $NodeIp")
         echo $pingoutput

         echo "#####################################################################################################"
         echo "####### Traceroute from  ${clusterId}'s LVF Router($LVF_IP) to $Nodename#####"
         echo "#######################################################################################################"
         sshpass -p N3wP@55w0rd ssh -4 -n -T -q -o StrictHostKeyChecking=no cloud-user@$LAF_IP -t sudo ssh -4 -q -i /var/tmp/pem_key/*.pem  cloud-user@$LVS_IP "traceroute $NodeIp" > tracerouteotput
         cat tracerouteotput

         echo "########################################################################################################"
         echo "####### Checking SSH connection to $Nodename which is on $Netsimbox of ${clusterId}'s LVF Router($LVF_IP)######"
         echo "########################################################################################################"
         sshpass -p N3wP@55w0rd ssh -4 -n -T -q -o StrictHostKeyChecking=no cloud-user@$LAF_IP -t sudo ssh -4 -q -i /var/tmp/pem_key/*.pem  cloud-user@$LVS_IP  "sh sshtest.sh $NodeIp" >  sshtest
         cat sshtest | grep 'not pingable' | wc -l > ssh1check ; if [ -s ssh1check ]; then cat sshtest ; echo -e "\n\n ssh to $Nodename can be done" ; else echo ssh connection to $Nodename has failed ; fi

         echo "########################################################################################################"
         echo "####### Checking sftp connection to $Nodename which is on $Netsimbox of ${clusterId}'s LVF Router($LVF_IP)e#####"
         echo "########################################################################################################"
         sshpass -p N3wP@55w0rd ssh -4 -n -T -q -o StrictHostKeyChecking=no cloud-user@$LAF_IP -t sudo ssh -4 -q -i /var/tmp/pem_key/*.pem  cloud-user@$LVS_IP "sh sftptest.sh $NodeIp" >  sftptest
         cat sftptest | grep 'not pingable' | wc -l > sftpcheck ; if [ -s sftpcheck ]; then cat sftptest ; echo -e "\n\n sftp to $Nodename can be done" ; else echo sftp connection to $Nodename has failed ; fi

         return

     fi

     echo "################################################################################################"
     echo "####### Pinging $Nodename from ${clusterId}'s LVF Router($LVF_IP)#####"
     echo "################################################################################################"
     pingoutput=$(sshpass -p 12shroot ssh -4 -n -T -q -o StrictHostKeyChecking=no root@$MS_IP -t ssh -4 -q -i /root/.ssh/vm_private_key cloud-user@$LVF_IP "sh pingtest.sh $NodeIp")
     echo $pingoutput

     echo "#####################################################################################################"
     echo "####### Traceroute from  ${clusterId}'s LVF Router($LVF_IP) to $Nodename#####"
     echo "#######################################################################################################"
     tracerouteotput=$(sshpass -p 12shroot ssh -4 -n -T -q -o StrictHostKeyChecking=no root@$MS_IP -t ssh -4 -q -i /root/.ssh/vm_private_key cloud-user@$LVF_IP "traceroute $NodeIp")
     echo "$tracerouteotput" 

     echo "########################################################################################################"
     echo "####### Checking SSH connection to $Nodename which is on $Netsimbox of ${clusterId}'s LVF Router($LVF_IP)######"
     echo "########################################################################################################"
     sshpass -p 12shroot ssh -4 -n -T -q -o StrictHostKeyChecking=no root@$MS_IP -t ssh -4 -q -i /root/.ssh/vm_private_key cloud-user@$LVF_IP "sh sshtest.sh $NodeIp" >  sshtest
     cat sshtest | grep 'not pingable' | wc -l > ssh1.txt ; if [ -s ssh1.txt ]; then cat sshtest ; echo -e "\n\n ssh to $Nodename can be done" ; else echo ssh connection to $Nodename has failed ; fi

     echo "########################################################################################################"
     echo "####### Checking sftp connection to $Nodename which is on $Netsimbox of ${clusterId}'s LVF Router($LVF_IP)e#####"
     echo "########################################################################################################"
     sshpass -p 12shroot ssh -4 -n -T -q -o StrictHostKeyChecking=no root@$MS_IP -t ssh -4 -q -i /root/.ssh/vm_private_key cloud-user@$LVF_IP "sh sftptest.sh $NodeIp" >  sftptest
     cat sftptest | grep 'not pingable' | wc -l > sftp.txt ; if [ -s sftp.txt ]; then cat sftptest ; echo -e "\n\n sftp to $Nodename can be done" ; else echo sftp connection to $Nodename has failed ; fi

 }

 #Declaring ENM side analysis
 enmanalysis()
 {
     filename=$1

     cd ${WORKSPACE}/

     if [ ! -s suiteswithiso.csv ]; then
         echo -e "\nThere are no results with this ISO in MainTrack."
         cd lognodedetails/
         return
     fi

     cd ${WORKSPACE}/enmsuitedetails/

     for enmsuite in *.details
     do
         grep --no-messages $filename $enmsuite >>  s.txt
         Allure=$(cat $enmsuite | awk -F"::::" '{print $2}' | uniq)
         cluster=$(cat $enmsuite | awk -F"::::" '{print $3}' | uniq)

         if [ -s s.txt ]; then
             echo -e "\nThis suite is failing in ENM-MT."
             echo -e "\nENM-MT Allure link: $Allure"
             echo -e "\nENM Tenancy: $cluster"
             echo -e "\nStatus: Failed"

         elif [ -z "$cluster" ]; then
             echo -e "\nThis suite is failing in ENM-MT."
             echo -e "\nENM-MT Allure link: $Allure"
             echo -e "\nStatus: Failed"

         elif [[ ! -s s.txt ]] &&  [[ ! -z "$cluster" ]]; then
             echo -e "\nThis suite has passed in ENM-MT."
             echo -e "\nENM-MT Allure link: $Allure"
             echo -e "\nENM Tenancy: $cluster"
             echo -e "\nStatus: Passed"
         fi

     done

     cd ${WORKSPACE}/lognodedetails/

 }

 #Function to check the TLS side certs
 tlscheck()

 {

     cd ${WORKSPACE}/

     ClusterId=$1
     Nodename=$2

     if [[ ${ClusterId} = *"enm"*  ]]; then

         set +x

         #echo "the Cluster id is $ClusterId"
         #echo "the Nodename is $Nodename"
		 #echo "The Netsims is $Netsims"

         for server in $Netsims
         do
             set +x
             simname=$(sshpass -p netsim ssh -n -q -o StrictHostKeyChecking=no netsim@$server.athtem.eei.ericsson.se "curl -s -O \"https://arm901-eiffel004.athtem.eei.ericsson.se:8443/nexus/service/local/repositories/nss/content/com/ericsson/nss/scripts/jq/1.0.1/jq-1.0.1.tar\";tar -xvf jq-1.0.1.tar > /dev/null ;chmod +x ./jq; ./jq --raw-output '.networkMap[] | select(.name == \"$Nodename\") | (.Simulation)' /netsim/netsimdir/networkMap.json")

             #echo $simname

             if [ ! -z "$simname" ];then
                 sshpass -p netsim ssh -n -q -o StrictHostKeyChecking=no netsim@${server} "echo -e \".open $simname \n.select $Nodename\n.start\n e MOID = ecim_csmo:ldn_string_to_mo_id(null,\x22ManagedElement=$Nodename,SystemFunctions=1,SecM=1,CertM=1,VendorCredential=1\x22).\ne Content = csmo:get_attribute_value(null,MOID,certificateContent).\" | /netsim/inst/netsim_shell | grep \"C=IN,ST=TS,L=HYD,O=TCS,OU=ERICSSON,CN=NSSCA,emailAddress=nss@tcs.com\"" > netsimsidecerts
                 sshpass -p 12shroot ssh -n -q -o StrictHostKeyChecking=no root@$WL_VM "/opt/ericsson/enmutils/bin/cli_app \"pkiadm extcalist\" | grep \"E=nss@tcs.com,CN=NSSCA,OU=ERICSSON,O=TCS,L=HYD,ST=TS,C=IN\" " > enmsidecerts
             fi
         done

         if [[ -s netsimsidecerts ]] && [[ -s enmsidecerts ]]; then 
             echo "TLS certs on The netsimbox and on ENM side for the $Nodename on ClusterId - $ClusterId are matching"
         else
             echo "TLS certs on The netsimbox and on ENM side for the $Nodename on ClusterId - $ClusterId are not matching. Could you please check the sync status of the Node $Nodename manually and get back to NSS if it is not syncing."
         fi

         cd ${WORKSPACE}/lognodedetails

     fi

     #echo "########################################################################"

     if [[ ${ClusterId} =~ ^[0-9]+$  ]]; then

         set +x

         #echo "the Cluster id is $ClusterId"
         #echo "the Nodename is $Nodename"
         echo "The Netsims is $Netsims"

         #echo "The MS_IP is $MS_IP"


         for server in ${Netsims//,/ }
     do
         simname=$(sshpass -p netsim ssh -n -q -o StrictHostKeyChecking=no netsim@$server.athtem.eei.ericsson.se "curl -s -O \"https://arm901-eiffel004.athtem.eei.ericsson.se:8443/nexus/service/local/repositories/nss/content/com/ericsson/nss/scripts/jq/1.0.1/jq-1.0.1.tar\";tar -xvf jq-1.0.1.tar > /dev/null ;chmod +x ./jq; ./jq --raw-output '.networkMap[] | select(.name == \"$Nodename\") | (.Simulation)' /netsim/netsimdir/networkMap.json")

         #echo The simname is $simname
         #echo The server is $server

         if [ ! -z "$simname" ]; then

             sshpass -p netsim ssh -n -q -o StrictHostKeyChecking=no netsim@${server} "echo -e \".open $simname \n.select $Nodename\n.start\n e MOID = ecim_csmo:ldn_string_to_mo_id(null,\x22ManagedElement=$Nodename,SystemFunctions=1,SecM=1,CertM=1,VendorCredential=1\x22).\ne Content = csmo:get_attribute_value(null,MOID,certificateContent).\" | /netsim/inst/netsim_shell | grep \"C=IN,ST=TS,L=HYD,O=TCS,OU=ERICSSON,CN=NSSCA,emailAddress=nss@tcs.com\"" > netsimsidecerts

             if ! grep -q "issuer" netsimsidecerts 
             then
                 sshpass -p netsim ssh -n -q -o StrictHostKeyChecking=no netsim@${server} "echo -e \".open $simname \n.select $Nodename\n.start\n e [MOID|_] = csmo:get_mo_ids_by_type(null, \x22Security\x22).\ne csmo:get_attribute_value(null,MOID,nodeCertificate).\" | /netsim/inst/netsim_shell | grep \"C=IN,ST=TS,L=HYD,O=TCS,OU=ERICSSON,CN=NSSCA,emailAddress=nss@tcs.com\"" > netsimsidecerts
             fi
             sshpass -p 12shroot ssh -n -q -o StrictHostKeyChecking=no root@$MS_IP "/opt/ericsson/enmutils/bin/cli_app \"pkiadm extcalist\" | grep \"E=nss@tcs.com,CN=NSSCA,OU=ERICSSON,O=TCS,L=HYD,ST=TS,C=IN\" " > enmsidecerts

             break

         fi

     done

     if [[ -s netsimsidecerts ]] && [[ -s enmsidecerts ]]; then
         echo "TLS certs on The netsimbox and on ENM side for the $Nodename on ClusterId - $ClusterId are matching"
     else
         echo "TLS certs on The netsimbox and on ENM side for the $Nodename on ClusterId - $ClusterId are not matching"
     fi

     cd ${WORKSPACE}/lognodedetails

 fi

 }

 ###############################echo "Calling all the functions"###############################

 if [ "$clusterIdDetails" == "Physical" ]; then

     for filename in *.txt ;  do

         #rm -rf enmoutput.txt Netsimoutput.txt infra.txt 

         echo "####################################################################"
         echo "The analysis for failing test suite ${filename/.lognodedetails.txt/}"

         while read nodes ; do

             Nodename=$(echo $nodes | awk -F"," '{print $1}')
             Netsimbox=$(echo $nodes | awk -F"," '{print $2}')
             NodeIp=$(echo $nodes | awk -F"," '{print $3}')
             filename1=$(echo $filename | sed "s/.lognodedetails.txt//g")


             #echo the filename is $filename
             #echo the nodes is $nodes

             echo "########################################################################################################"
             echo "####### Step 1: ERRORS found ON ENM(cmserv,fmserv,mscm,mscmce,pmserv) for $Nodename of ${filename/.lognodedetails.txt/} test suite #####"
             echo "########################################################################################################"

             enmlogsfunction $MS_IP $Nodename

             echo "########################################################################################################"
             echo "####### Step 2: ERRORS found ON Netsim side for $Nodename of ${filename/.lognodedetails.txt/} test suite#####"
             echo "########################################################################################################"

             prmnfunction "$startTime" "$stopTime" "$Nodename"

             echo "################################################################################################"
             echo "####### Step 3: Errors related to Infra/Network Issues for $Nodename#####"
             echo "################################################################################################"

             infranetwork $Nodename $clusterId $MS_IP $LVF_IP $NodeIp

             echo "########################################################################################################"
             echo "####### Step 4: Other tenancies results####"
             echo "########################################################################################################"

             enmanalysis $filename

             echo "########################################################################################################"
             echo "####### Step 5: TLS Check ####"
             echo "########################################################################################################"

             tlscheck $clusterId $Nodename

         done < $filename

     done

 fi

 if [ "$clusterIdDetails" == "Openstack" ]; then

     for filename in *.txt ;  do
	 
	      

         echo "####################################################################"
         echo "The analysis for failing test suite ${filename/.lognodedetails.txt/}"
         while read nodes ; do

             Nodename=$(echo $nodes | awk -F"," '{print $1}')
             Netsimbox=$(echo $nodes | awk -F"," '{print $2}')
             NodeIp=$(echo $nodes | awk -F"," '{print $3}')
             filename1=$(echo $filename | sed "s/.lognodedetails.txt//g")

             #cat $filename

             echo "########################################################################################################"
             echo "####### Step 1: ERRORS found ON ENM(cmserv,fmserv,mscm,mscmce,pmserv) for $Nodename of ${filename/.lognodedetails.txt/} test suite #####"
             echo "########################################################################################################"

             enmlogsfunction $MS_IP $Nodename

             echo "########################################################################################################"
             echo "####### Step 2: ERRORS found ON Netsim side for $Nodename of ${filename/.lognodedetails.txt/} test suite#####"
             echo "########################################################################################################"

             prmnfunction "$startTime" "$stopTime" "$Nodename"

             echo "################################################################################################"
             echo "####### Step 3: Errors related to Infra/Network Issues for $Nodename#####"
             echo "################################################################################################"

             infranetwork $Nodename $clusterId $MS_IP 123 $NodeIp

             echo "########################################################################################################"
             echo "####### Step 4: Other tenancies results####"
             echo "########################################################################################################"

             enmanalysis $filename

             echo "########################################################################################################"
             echo "####### Step 5: TLS Check ####"
             echo "########################################################################################################"

             tlscheck $clusterId $Nodename

         done < $filename

     done

 fi

 fi

