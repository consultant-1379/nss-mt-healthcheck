#! /bin/bash

Sim=$1
NeName=$2
NeIp=$3
HttpPort=$4

if [ ! -d "/netsim/inst/cppStub" ]; then	mkdir /netsim/inst/cppStub; fi
if [ ! -d "/netsim/inst/cppStub/${Sim}" ]; then mkdir /netsim/inst/cppStub/${Sim}; fi
if [ ! -d "/netsim/inst/cppStub/${Sim}/javaAttrLists" ]; then mkdir /netsim/inst/cppStub/${Sim}/javaAttrLists; fi
if [ ! -d "/netsim/inst/cppStub/${Sim}/javaAttrLists/${NeName}" ]; then mkdir /netsim/inst/cppStub/${Sim}/javaAttrLists/${NeName};
else exit 0 ;fi

echo "Clearing older attr list files for $NeName.."
rm -rf /netsim/inst/cppStub/${Sim}/javaAttrLists/${NeName}/javaAttrListBlock_*

MoCount=$(echo "dumpmotree:count;" | /netsim/inst/netsim_shell -sim $Sim -ne $NeName | awk 'FNR == 2 {print $1}')

if [[ $MoCount -gt 10000 ]]; then
    if [[ $((MoCount%10000)) -eq 0 ]]
    then 
	NoOfIters=$((MoCount/10000))
    else 
	NoOfIters=$(($((MoCount/10000))+1))
    fi
    echo "" > createAttrBlockListForLargeNodes_${NeName}.sh
    echo "#! /bin/bash" >> createAttrBlockListForLargeNodes_${NeName}.sh
    echo "Sim=$1" >> createAttrBlockListForLargeNodes_${NeName}.sh
    echo "NeName=$2" >> createAttrBlockListForLargeNodes_${NeName}.sh
    echo "NeIp=$3" >> createAttrBlockListForLargeNodes_${NeName}.sh
    echo "/netsim/inst/netsim_pipe -sim $Sim -ne $NeName <<EOF" >> createAttrBlockListForLargeNodes_${NeName}.sh
    echo "e f()." >> createAttrBlockListForLargeNodes_${NeName}.sh
    echo "connect:vars=cs, host=\"$NeIp\", port=$HttpPort, objpath=\"CelloConfigurationService\", iorpath=\"/cello/ior_files/nameroot.ior\";" >> createAttrBlockListForLargeNodes_${NeName}.sh
    echo "select:co=cs;" >> createAttrBlockListForLargeNodes_${NeName}.sh
    echo "corba:vars=session, call=create_session, args=\"readMOAttrs\"&0;" >> createAttrBlockListForLargeNodes_${NeName}.sh
    echo "vars:set=root_mo_fdn, args=\"ManagedElement=1\";" >> createAttrBlockListForLargeNodes_${NeName}.sh
    echo "corbalib:vars=iter_filter, call=new_Filter;" >> createAttrBlockListForLargeNodes_${NeName}.sh
    echo "corba:vars=iter, call=get_MO_containment, args=root_mo_fdn&10000&iter_filter&session;" >> createAttrBlockListForLargeNodes_${NeName}.sh
    
    while [[ $NoOfIters -gt 0 ]]
    do
	echo "No of iters $NoOfIters"
	echo "corba:vars=flag&res, call=next_MO_info, args=iter&10000&session;" >> createAttrBlockListForLargeNodes_${NeName}.sh
	echo "corbalib:vars=attrnames, call=get_attr_names_java, args=res;" >> createAttrBlockListForLargeNodes_${NeName}.sh
	NoOfIters=$(($((NoOfIters))-1))
    done
    echo "corbalib:vars=clrIndex, call=clr_stubMO_index;" >> createAttrBlockListForLargeNodes_${NeName}.sh
    echo "EOF" >> createAttrBlockListForLargeNodes_${NeName}.sh
    
    sh createAttrBlockListForLargeNodes_${NeName}.sh $Sim $NeName $NeIp
    rm -rf createAttrBlockListForLargeNodes_${NeName}.sh
else
/netsim/inst/netsim_pipe -sim $Sim -ne $NeName <<EOF
e f().
connect:vars=cs, host="$NeIp", port=$HttpPort, objpath="CelloConfigurationService", iorpath="/cello/ior_files/nameroot.ior";
select:co=cs;
corba:vars=session, call=create_session, args="readMOAttrs"&0;
vars:set=root_mo_fdn, args="ManagedElement=1";
corbalib:vars=iter_filter, call=new_Filter;
corba:vars=iter, call=get_MO_containment, args=root_mo_fdn&10000&iter_filter&session;
corba:vars=flag&res, call=next_MO_info, args=iter&10000&session;
corbalib:vars=attrnames, call=get_attr_names_java, args=res;
corbalib:vars=clrIndex, call=clr_stubMO_index;
EOF
fi

NumOfFiles=$(ls /netsim/inst/cppStub/${Sim}/javaAttrLists/${NeName} | grep javaAttrListBlock_ | grep -v "~" | wc -l)

cp -R /netsim/inst/cppStub/${Sim}/javaAttrLists/${NeName} /netsim/inst/cppStub/${Sim}/javaAttrLists/${NeName}_bck
echo $NumOfFiles


# Rearrange missplitted lines to single line

while [[ $NumOfFiles -gt 0 ]]
do
NumOfFiles=$((NumOfFiles-1))
File="/netsim/inst/cppStub/${Sim}/javaAttrLists/${NeName}_bck/javaAttrListBlock_${NumOfFiles}"
TargetFile="/netsim/inst/cppStub/${Sim}/javaAttrLists/${NeName}/javaAttrListBlock_${NumOfFiles}"
rm -f ${TargetFile}
while IFS='' read -r line || [[ -n "$line" ]]; do
    echo $line | grep "]" > /dev/null
    res=$?
    BUFFER=$BUFFER$line
    if [[ "$res" -eq 0 ]];then
        echo $BUFFER >> ${TargetFile}
        BUFFER=""
    fi
        
done < "$File"
done

NumOfFiles=$(ls /netsim/inst/cppStub/${Sim}/javaAttrLists/${NeName} | grep javaAttrListBlock_ | grep -v "~" | wc -l)


while [[ $NumOfFiles -gt 0 ]]
do
    NumOfFiles=$((NumOfFiles-1))
    File="/netsim/inst/cppStub/${Sim}/javaAttrLists/${NeName}/javaAttrListBlock_${NumOfFiles}"
    sed -i -e 's/\[//g' "$File"
    sed -i -e 's/\]/\n/g' "$File"
    sed -i -e 's/\"\,/\:/' "$File"
    sed -i -e 's/\"//g' "$File"
    sed -i -e 's/,$//' "$File"
    sed -i -e 's/^,//' "$File"
    sed -i -e '/^\s*$/d' "$File"
done
