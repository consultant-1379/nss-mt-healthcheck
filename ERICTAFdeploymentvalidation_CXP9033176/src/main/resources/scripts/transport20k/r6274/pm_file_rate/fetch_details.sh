########################################################################
# DESCRIPTION: To get the file details to fetched. Output is stored fetcheddata.txt
# USAGE : sh fetch_details.sh <Simulation-name>
# Note - Node2.txt should have nodename and nodeips
########################################################################
simulation=$1
rm finalfetch.txt
while read -r line
do
node_name=$(echo $line | awk '{print $1}')
node_ip=$(echo $line | awk '{print $2}')

cd /netsim/netsim_dbdir/simdir/netsim/netsimdir/$simulation/$node_name/fs/c/pm_data/dir
ls -lrth | tee -a zp1.txt
lined=$(cat zp1.txt | tail -2 | head -1 | awk '{print $9}')
rm zp1.txt
cd
echo $node_name $node_ip $lined >> finalfetch.txt

echo $node_name $node_ip
done < nodeips.txt

