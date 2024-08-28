
i=10
while [[ $i -le 100 ]];do
sh parallel.sh -f multi_pmfilecollection -n $i
i=$((i+10))
sleep 10
done
