nodefile=$4
file=$1
file2=$2
result=$3
n_MO=$5
#rm -rf finalfile.txt
while read -r line
do
rm finalfile.txt
NE_NAME=$(echo $line | awk '{print $1}')
echo $NE_NAME
#sh extract.sh $file $result $NE_NAME
sh extract_net.sh $file2 $result $NE_NAME
sh extract.sh $file $result $NE_NAME
end_time=$(cat finalfile.txt | tail -1 | awk '{print $1}')
start_time=$(cat finalfile.txt | head -1 | awk '{print $1}')

log_create_diff=$(cat finalfile.txt | tail -1 | awk '{print $3}')
difference=`expr $end_time - $start_time`
#div=`expr $n_MO / $log_create_diff`

diff_in_sec=$(bc <<< "scale = 10; ($difference/1000)")
MO_per_sec=$(bc <<< "scale = 10;  ($n_MO/$diff_in_sec)")

echo hgshdghsdhdgsdg $diff_in_sec
echo hjsdhjhsdjhjhslkllkslk $MO_per_sec

log_cre_sec=$(bc <<< "scale = 10; ($log_create_diff/1000)")
NOTIF_per_sec=$(bc <<< "scale = 10; ($n_MO/$log_cre_sec)")
echo $log_cre_sec
echo $NOTIF_per_sec

echo $NE_NAME The number of MO Created:- $n_MO Usecase1:- $difference MO/per sec is : $MO_per_sec and NOTIF/per sec is : $NOTIF_per_sec >> observations.txt
done < $nodefile
