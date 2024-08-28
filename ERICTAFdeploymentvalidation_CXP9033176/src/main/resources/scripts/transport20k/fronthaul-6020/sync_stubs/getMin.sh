min=9999
while read -r i;
 do
# echo "$min and $i" 
 if [[ $i -lt $min ]] 
then 
	#echo $i
	min=$i 
fi

done < arr.log
echo min is $min
