############################################
#USAGE : xml_file_generator.sh <Simulation Name>
#Description - Creates 100 xml files in the path defined
# Note since the files generated are symlinked , the xml file should be present at /netsim/mylink path.
###########################################
simulation=$1
for i in `cat nodes.txt`
do
echo $i
cd /netsim/netsim_dbdir/simdir/netsim/netsimdir/$1/$i/fs/c/pm_data/
rm -rf LTE03
mkdir LTE03 # USER DEFINED < CAN BE ANYTHING >
cd LTE03/
q=1
	while [[ $q -le 100 ]]
		do
		name=$i$q
#		name2=$name$i$q
		ln -sf /netsim/mylink/A20190124.0612-0613_LTE32dg2ERBS00007.xml.gz $name
		q=`expr $q + 1`
	done
done

