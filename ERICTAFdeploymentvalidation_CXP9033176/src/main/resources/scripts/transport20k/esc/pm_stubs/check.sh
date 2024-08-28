ls -lrth *
for i in {1..200}
do
ls -lrth *  | grep xml -c
ls -lrth *  | grep 25K -c 
#for i in {1..150}
#do
fc=$(ls -lrth *  | grep 25K -c )
date
if [ $fc -eq 161 ]
then
	ti=$(date)
	echo started at $ti>>tim
elif [ $fc -eq 1280 ]
then
	ti2=$(date)
	echo $fc completed at $ti2 >> tim
fi

echo endtime is $ti2
sleep 1
done


