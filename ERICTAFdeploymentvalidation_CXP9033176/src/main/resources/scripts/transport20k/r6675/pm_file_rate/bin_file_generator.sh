############################################
#USAGE : bin_file_generator.sh <Simulation Name>
#Description - Creates 7 bin files in the path defined
# Note - nodes.txt file should be present in the path where this is run having nodenames
###########################################
simulation=$1
for i in `cat nodes.txt`
do
echo $i
cd /netsim/netsim_dbdir/simdir/netsim/netsimdir/$1/$i/fs/c/pm_data/
#mkdir LTE03 # USER DEFINED < CAN BE ANYTHING >
## NOTE - The above mkdir command should be commented when re-triggering the file or the directory is already created.
cd LTE03/
q=1
k=1
	while [[ $q -le 7 ]]
		do
		name="CellTrace_DUL1_1"
		name2=$name$i$q
		ln -sf /netsim_users/pms/rec_templates/celltrace_256k.bin.gz $name2
		q=`expr $q + 1`
	done
        while [[ $k -le 7 ]]
        do
            name="CellTrace_DUL1_3"
            name2=$name$i$k
            ln -sf /netsim_users/pms/rec_templates/celltrace_4.7M.bin.gz $name2
            k=`expr $k + 1`
        done
done

